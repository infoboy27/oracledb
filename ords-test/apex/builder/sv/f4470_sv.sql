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
,p_default_application_id=>4487
,p_default_id_offset=>0
,p_default_owner=>'APEX_240200'
);
end;
/
 
prompt APPLICATION 4487 - Oracle APEX Runtime Messages
--
-- Application Export:
--   Application:     4487
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
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'A144693630188762560')
,p_page_view_logging=>'YES'
,p_charset=>'utf-8'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt_last_reset=>'20250422180859'
,p_bookmark_checksum_function=>'SH1'
,p_compatibility_mode=>'24.2'
,p_session_state_commits=>'IMMEDIATE'
,p_flow_language=>'sv'
,p_flow_language_derived_from=>'SESSION'
,p_date_format=>'&DATE_FORMAT.'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(109678305570583962.4487)
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
 p_id=>wwv_flow_imp.id(4487)
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
 p_id=>wwv_flow_imp.id(728504220438374.4487)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SELECT_MANY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_values_as', 'separated')).to_clob
,p_version_scn=>7007816
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(736540203200530.4487)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_BOSS'
,p_version_scn=>243430877
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(800575880762576.4487)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'NATIVE_OPEN_AI_ASSISTANT'
,p_version_scn=>15457644
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2657043006125217.4487)
,p_plugin_type=>'PROCESS TYPE'
,p_plugin=>'NATIVE_GEOCODING'
,p_attribute_01=>'RELAX_HOUSE_NUMBER'
,p_version_scn=>117636987
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(110599941590099161.4487)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'default_icon', 'fa-star',
  'tooltip', '#VALUE#')).to_clob
,p_version_scn=>7007818
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(118481226255833028.4487)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_MAP_REGION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_vector_tile_layers', 'Y')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(123214098089478467.4487)
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
 p_id=>wwv_flow_imp.id(124389732573989299.4487)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_ADFBC'
,p_version_scn=>37165931336889
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(209516503264520988.4487)
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
 p_id=>wwv_flow_imp.id(285800719532138903.4487)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N')).to_clob
,p_version_scn=>7007823
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(649595203182764436.4487)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_style', 'SWITCH_CB',
  'off_value', 'N',
  'on_value', 'Y')).to_clob
,p_version_scn=>6539584
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1874744429444344138.4487)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'include_slider', 'N')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1941451863897626238.4487)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'actions_menu_structure', 'IG')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2027366558906572283.4487)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'mode', 'FULL')).to_clob
,p_version_scn=>7007824
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2120597162971751123.4487)
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
 p_id=>wwv_flow_imp.id(649613204592764515.4487)
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
 p_id=>wwv_flow_imp.id(850359229090693491.4487)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Wizard Dialog.sv'
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
 p_id=>wwv_flow_imp.id(293526110820992194.4487)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4487)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293526630547992195.4487)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4487)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293527171164992195.4487)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4487)
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
 p_id=>wwv_flow_imp.id(851037359784626333.4487)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Dialog.sv'
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
 p_id=>wwv_flow_imp.id(293473352245977306.4487)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4487)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293473882718977306.4487)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4487)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293474370844977307.4487)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4487)
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
 p_id=>wwv_flow_imp.id(851037631091626378.4487)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Edit Screen.sv'
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
 p_id=>wwv_flow_imp.id(2495515088702127.4487)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4487)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2496016567702127.4487)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4487)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2496522618702127.4487)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4487)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2497097895702127.4487)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4487)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2497562953702128.4487)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4487)
,p_name=>'Edit Screen Header'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2498085850702128.4487)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4487)
,p_name=>'Page Position 5'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2498553894702128.4487)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4487)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2499023066702128.4487)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4487)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2499516729702128.4487)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4487)
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
 p_id=>wwv_flow_imp.id(851039898661626389.4487)
,p_theme_id=>3
,p_name=>'APEX 5.0 - No Side Bar.sv'
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
 p_id=>wwv_flow_imp.id(2418665544706094.4487)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4487)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2419139140706094.4487)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4487)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2419660231706094.4487)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4487)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2420136000706094.4487)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4487)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2420617033706094.4487)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4487)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2421142368706094.4487)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4487)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2421629849706095.4487)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4487)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2422132460706095.4487)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4487)
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
 p_id=>wwv_flow_imp.id(851040471818626394.4487)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Right Side Bar.sv'
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
 p_id=>wwv_flow_imp.id(1537388880131854.4487)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4487)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1537880270131855.4487)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4487)
,p_name=>'Page Header (Position 3)'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1538315330131855.4487)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4487)
,p_name=>'Page Header (Position 4)'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1538840638131855.4487)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4487)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1539339441131855.4487)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4487)
,p_name=>'After Body'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1539830162131855.4487)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4487)
,p_name=>'Page Header (Position 1)'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1540338421131855.4487)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4487)
,p_name=>'Page Header (Position 2)'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1540832064131856.4487)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4487)
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
 p_id=>wwv_flow_imp.id(851041812938626395.4487)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Sign Up Wizard.sv'
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
 p_id=>wwv_flow_imp.id(115212309210289451.4487)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4487)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115212857712289451.4487)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4487)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115213340345289452.4487)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4487)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115213804331289452.4487)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4487)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115214317592289452.4487)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4487)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115214875819289453.4487)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4487)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115215325320289453.4487)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4487)
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
 p_id=>wwv_flow_imp.id(851042476105626395.4487)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Wizard Page.sv'
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
 p_id=>wwv_flow_imp.id(1485266589875353.4487)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4487)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1485734308875353.4487)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4487)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1486237142875354.4487)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4487)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1486735024875354.4487)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4487)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1487219028875354.4487)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4487)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1487770987875354.4487)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4487)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1488272041875354.4487)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4487)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1488725778875354.4487)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4487)
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
 p_id=>wwv_flow_imp.id(514381861202541059.4487)
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
 p_id=>wwv_flow_imp.id(514382190540541061.4487)
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
 p_id=>wwv_flow_imp.id(514382538845541061.4487)
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
 p_id=>wwv_flow_imp.id(620629666890811728.4487)
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
 p_id=>wwv_flow_imp.id(620629778318811745.4487)
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
 p_id=>wwv_flow_imp.id(868252865986181054.4487)
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
 p_id=>wwv_flow_imp.id(514338947870435171.4487)
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
 p_id=>wwv_flow_imp.id(2962385277500935.4487)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4487)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2962865718500935.4487)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4487)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2963338641500935.4487)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4487)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2963894582500935.4487)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4487)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2964329937500935.4487)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4487)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2964897214500936.4487)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4487)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2965324003500936.4487)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4487)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2965838011500936.4487)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4487)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2966328405500936.4487)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4487)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2966823859500936.4487)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4487)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2967325351500936.4487)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4487)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2967812485500936.4487)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4487)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2968377768500937.4487)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4487)
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
 p_id=>wwv_flow_imp.id(514343873675436760.4487)
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
 p_id=>wwv_flow_imp.id(32585474981747544.4487)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4487)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32585915750747544.4487)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4487)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32586471989747545.4487)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4487)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32586972270747545.4487)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4487)
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
 p_id=>wwv_flow_imp.id(771803843049318447.4487)
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
 p_id=>wwv_flow_imp.id(3207496127505978.4487)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4487)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3207907805505978.4487)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4487)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3208484941505978.4487)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4487)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3208991047505978.4487)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4487)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3209402462505979.4487)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4487)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3209972507505979.4487)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4487)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3210460159505979.4487)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4487)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3210935368505979.4487)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4487)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3211466566505979.4487)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4487)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3211956312505979.4487)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4487)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3212461962505979.4487)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4487)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3212966370505980.4487)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4487)
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
 p_id=>wwv_flow_imp.id(850406444708718383.4487)
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
 p_id=>wwv_flow_imp.id(2204663592232325.4487)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4487)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2205135519232325.4487)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4487)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2205694824232325.4487)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4487)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2206129075232325.4487)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4487)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2206618558232325.4487)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4487)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2207115910232326.4487)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4487)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2207688896232326.4487)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4487)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2208160700232326.4487)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4487)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2208614050232326.4487)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4487)
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
 p_id=>wwv_flow_imp.id(850442966147812557.4487)
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
 p_id=>wwv_flow_imp.id(3346988371508588.4487)
,p_plug_template_id=>wwv_flow_imp.id(850442966147812557.4487)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3347426198508588.4487)
,p_plug_template_id=>wwv_flow_imp.id(850442966147812557.4487)
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
 p_id=>wwv_flow_imp.id(856206049762521193.4487)
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
 p_id=>wwv_flow_imp.id(2526185270486606.4487)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4487)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2526610033486606.4487)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4487)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2527184084486606.4487)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4487)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2527626846486607.4487)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4487)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2528141078486607.4487)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4487)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2528637911486607.4487)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4487)
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
 p_id=>wwv_flow_imp.id(914802799655239969.4487)
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
 p_id=>wwv_flow_imp.id(88183211858816924.4487)
,p_plug_template_id=>wwv_flow_imp.id(914802799655239969.4487)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(88183732152816924.4487)
,p_plug_template_id=>wwv_flow_imp.id(914802799655239969.4487)
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
 p_id=>wwv_flow_imp.id(914803495164240003.4487)
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
 p_id=>wwv_flow_imp.id(3373447170510516.4487)
,p_plug_template_id=>wwv_flow_imp.id(914803495164240003.4487)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3373993086510516.4487)
,p_plug_template_id=>wwv_flow_imp.id(914803495164240003.4487)
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
 p_id=>wwv_flow_imp.id(915210356236972585.4487)
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
 p_id=>wwv_flow_imp.id(2899946654493378.4487)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4487)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2900442121493378.4487)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4487)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2900949359493378.4487)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4487)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2901467944493378.4487)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4487)
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
 p_id=>wwv_flow_imp.id(915371118115573423.4487)
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
 p_id=>wwv_flow_imp.id(2695578355491332.4487)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4487)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2696079816491332.4487)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4487)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2696558276491332.4487)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4487)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2697055726491332.4487)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4487)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2697581510491332.4487)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4487)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2698048732491333.4487)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4487)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2698576547491333.4487)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4487)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2699004772491333.4487)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4487)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2699557295491333.4487)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4487)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2700035673491333.4487)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4487)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2700500589491333.4487)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4487)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2701097053491333.4487)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4487)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2701554382491334.4487)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4487)
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
 p_id=>wwv_flow_imp.id(1274355059486017828.4487)
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
 p_id=>wwv_flow_imp.id(61232728057733462.4487)
,p_plug_template_id=>wwv_flow_imp.id(1274355059486017828.4487)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(61233207886733462.4487)
,p_plug_template_id=>wwv_flow_imp.id(1274355059486017828.4487)
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
 p_id=>wwv_flow_imp.id(514332014414430986.4487)
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
 p_id=>wwv_flow_imp.id(514332292784430987.4487)
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
 p_id=>wwv_flow_imp.id(860563697365629462.4487)
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
 p_id=>wwv_flow_imp.id(865273508717512144.4487)
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
 p_id=>wwv_flow_imp.id(908020362212234651.4487)
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
 p_id=>wwv_flow_imp.id(914818080687341593.4487)
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
 p_id=>wwv_flow_imp.id(851049711466639395.4487)
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
 p_id=>wwv_flow_imp.id(851054516889639461.4487)
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
 p_id=>wwv_flow_imp.id(851055225644639463.4487)
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
 p_id=>wwv_flow_imp.id(851056531929639482.4487)
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
 p_id=>wwv_flow_imp.id(914792024808213039.4487)
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
 p_id=>wwv_flow_imp.id(914792322768213043.4487)
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
 p_id=>wwv_flow_imp.id(915377874236666939.4487)
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
 p_id=>wwv_flow_imp.id(1041941432531249038.4487)
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
 p_id=>wwv_flow_imp.id(850683711614406253.4487)
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
 p_id=>wwv_flow_imp.id(851047536471633848.4487)
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
 p_id=>wwv_flow_imp.id(851047676005633854.4487)
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
 p_id=>wwv_flow_imp.id(851047684809633856.4487)
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
 p_id=>wwv_flow_imp.id(851047795461633856.4487)
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
 p_id=>wwv_flow_imp.id(860542631889572088.4487)
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
 p_id=>wwv_flow_imp.id(1321751941832424103.4487)
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
 p_id=>wwv_flow_imp.id(514333590213433126.4487)
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
 p_id=>wwv_flow_imp.id(649611704621764507.4487)
,p_page_name=>'winlov'
,p_page_title=>unistr('S\00F6k i dialogruta')
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
,p_find_button_text=>unistr('S\00F6k')
,p_find_button_attr=>'class="a-Button a-Button--hot a-Button--padLeft"'
,p_close_button_text=>unistr('St\00E4ng')
,p_close_button_attr=>'class="a-Button u-pullRight"'
,p_next_button_text=>unistr('N\00E4sta &gt;')
,p_next_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_prev_button_text=>unistr('&lt; F\00F6reg\00E5ende')
,p_prev_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'380'
,p_height=>'480'
,p_result_row_x_of_y=>'<div class="a-PopupLOV-pagination">Rad(er) #FIRST_ROW# - #LAST_ROW#</div>'
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
 p_id=>wwv_flow_imp.id(649611609668764506.4487)
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
 p_id=>wwv_flow_imp.id(182005134783173294.4487)
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
 p_id=>wwv_flow_imp.id(666074212329754757.4487)
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
 p_id=>wwv_flow_imp.id(666074525535755551.4487)
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
 p_id=>wwv_flow_imp.id(717250289307903026.4487)
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
 p_id=>wwv_flow_imp.id(2336377640986141.4487)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL'
,p_display_name=>'Heading Level'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(806925000765340952.4487)
,p_theme_id=>3
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default - No Icons'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808380142596819918.4487)
,p_theme_id=>3
,p_name=>'ALTERNATING_TABLE_ROWS'
,p_display_name=>'Alternating Table Rows'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Enable'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808380828683819918.4487)
,p_theme_id=>3
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Disable'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808381542095819918.4487)
,p_theme_id=>3
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default Border'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808383088145819924.4487)
,p_theme_id=>3
,p_name=>'REPORT_WIDTH'
,p_display_name=>'Report Width'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850406791580718389.4487)
,p_theme_id=>3
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850407096779718396.4487)
,p_theme_id=>3
,p_name=>'REGION_PADDING'
,p_display_name=>'Region Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Padding'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850407509193718398.4487)
,p_theme_id=>3
,p_name=>'REGION_STYLE'
,p_display_name=>'Region Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Style'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(851050160062639437.4487)
,p_theme_id=>3
,p_name=>'BADGE_LAYOUT'
,p_display_name=>'Badge Layout'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(851051045625639457.4487)
,p_theme_id=>3
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856113214217058023.4487)
,p_theme_id=>3
,p_name=>'HEIGHT'
,p_display_name=>'Height'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856114568019058024.4487)
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
 p_id=>wwv_flow_imp.id(856114830529058024.4487)
,p_theme_id=>3
,p_name=>'FORM_LABEL_WIDTH'
,p_display_name=>'Form Label Width'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856115135223058024.4487)
,p_theme_id=>3
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Not Part of Button Set'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116214022058024.4487)
,p_theme_id=>3
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>1
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116523282058024.4487)
,p_theme_id=>3
,p_name=>'FORM_LABEL_POSITION'
,p_display_name=>'Form Label Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116798725058025.4487)
,p_theme_id=>3
,p_name=>'BUTTON_SIZE'
,p_display_name=>'Button Size'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Button Size'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117102944058028.4487)
,p_theme_id=>3
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing left'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Left Spacing'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117454663058028.4487)
,p_theme_id=>3
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Right Spacing'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117908453058029.4487)
,p_theme_id=>3
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Icon on Right'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856118261810058029.4487)
,p_theme_id=>3
,p_name=>'BUTTON_TYPE'
,p_display_name=>'Button Type'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856206461450521195.4487)
,p_theme_id=>3
,p_name=>'ALERT_TYPE'
,p_display_name=>'Alert Type'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856206736628521198.4487)
,p_theme_id=>3
,p_name=>'DISPLAY'
,p_display_name=>'Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(860570508910721307.4487)
,p_theme_id=>3
,p_name=>'REGION_POSITION'
,p_display_name=>'Region Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(860571060920721309.4487)
,p_theme_id=>3
,p_name=>'REGION_OVERFLOW'
,p_display_name=>'Region Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(908020718209234676.4487)
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
 p_id=>wwv_flow_imp.id(1487577187426769.4487)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden to Assistive Tech'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4487)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4487)
,p_template_types=>'REGION'
,p_help_text=>'By default, region title is hidden but accessible, use this option to remove the header from accessible interface'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2336635141996782.4487)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H1'
,p_display_name=>'H1'
,p_display_sequence=>10
,p_css_classes=>'js-headingLevel-1'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4487)
,p_template_types=>'REGION'
,p_help_text=>'H1'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2336917964996782.4487)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H2'
,p_display_name=>'H2'
,p_display_sequence=>20
,p_css_classes=>'js-headingLevel-2'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4487)
,p_template_types=>'REGION'
,p_help_text=>'H2'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2337368425996782.4487)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H3'
,p_display_name=>'H3'
,p_display_sequence=>30
,p_css_classes=>'js-headingLevel-3'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4487)
,p_template_types=>'REGION'
,p_help_text=>'H3'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2337706283996782.4487)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H4'
,p_display_name=>'H4'
,p_display_sequence=>40
,p_css_classes=>'js-headingLevel-4'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4487)
,p_template_types=>'REGION'
,p_help_text=>'H4'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2338144805996782.4487)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H5'
,p_display_name=>'H5'
,p_display_sequence=>50
,p_css_classes=>'js-headingLevel-5'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4487)
,p_template_types=>'REGION'
,p_help_text=>'H5'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2338562059996782.4487)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H6'
,p_display_name=>'H6'
,p_display_sequence=>60
,p_css_classes=>'js-headingLevel-6'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4487)
,p_template_types=>'REGION'
,p_help_text=>'H6'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134384175764258.4487)
,p_theme_id=>3
,p_name=>'LARGELEFT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapLeft'
,p_group_id=>wwv_flow_imp.id(856117102944058028.4487)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134654971764258.4487)
,p_theme_id=>3
,p_name=>'LARGERIGHT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapRight'
,p_group_id=>wwv_flow_imp.id(856117454663058028.4487)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134823880764258.4487)
,p_theme_id=>3
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(856117908453058029.4487)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135009020764258.4487)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>3
,p_css_classes=>'a-Button--large'
,p_group_id=>wwv_flow_imp.id(856116798725058025.4487)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135269851764258.4487)
,p_theme_id=>3
,p_name=>'SMALLLEFT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padLeft'
,p_group_id=>wwv_flow_imp.id(856117102944058028.4487)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135477215764258.4487)
,p_theme_id=>3
,p_name=>'SMALLRIGHT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padRight'
,p_group_id=>wwv_flow_imp.id(856117454663058028.4487)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135634744764258.4487)
,p_theme_id=>3
,p_name=>'INNERBUTTON'
,p_display_name=>'Inner Button'
,p_display_sequence=>2
,p_css_classes=>'a-Button--pill'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4487)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135785730764258.4487)
,p_theme_id=>3
,p_name=>'LASTBUTTON'
,p_display_name=>'Last Button'
,p_display_sequence=>3
,p_css_classes=>'a-Button--pillEnd'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4487)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136068296764258.4487)
,p_theme_id=>3
,p_name=>'FIRSTBUTTON'
,p_display_name=>'First Button'
,p_display_sequence=>1
,p_css_classes=>'a-Button--pillStart'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4487)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136225140764258.4487)
,p_theme_id=>3
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>1
,p_css_classes=>'a-Button--primary'
,p_group_id=>wwv_flow_imp.id(856118261810058029.4487)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136360666764258.4487)
,p_theme_id=>3
,p_name=>'REGIONHEADERBUTTON'
,p_display_name=>'Button in Region Header'
,p_display_sequence=>1
,p_css_classes=>'a-Button--regionHeader'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136507481764259.4487)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--small'
,p_group_id=>wwv_flow_imp.id(856116798725058025.4487)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136620486764259.4487)
,p_theme_id=>3
,p_name=>'STRONGBUTTONLABEL'
,p_display_name=>'Strong Button Label'
,p_display_sequence=>1
,p_css_classes=>'a-Button--strongLabel'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136861925764259.4487)
,p_theme_id=>3
,p_name=>'AUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form--autoWidthLabels'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4487)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137023291764259.4487)
,p_theme_id=>3
,p_name=>'FIXEDWIDTH'
,p_display_name=>'Fixed'
,p_display_sequence=>10
,p_css_classes=>'a-Form--fixedLabels'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4487)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137193234764259.4487)
,p_theme_id=>3
,p_name=>'LABELSABOVE'
,p_display_name=>'Labels Above'
,p_display_sequence=>1
,p_css_classes=>'a-Form--labelsAbove'
,p_group_id=>wwv_flow_imp.id(856116523282058024.4487)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137470293764259.4487)
,p_theme_id=>3
,p_name=>'ALIGNLABELSLEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Form--leftLabels'
,p_group_id=>wwv_flow_imp.id(856114568019058024.4487)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137586003764259.4487)
,p_theme_id=>3
,p_name=>'LABELAUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--autoLabelWidth'
,p_group_id=>wwv_flow_imp.id(856116214022058024.4487)
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137737661764259.4487)
,p_theme_id=>3
,p_name=>'STRETCHFORMFIELD'
,p_display_name=>'Stretch Form Field'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--stretch'
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137933035764259.4487)
,p_theme_id=>3
,p_name=>'FIXEDLARGE'
,p_display_name=>'Fixed (Large Width)'
,p_display_sequence=>30
,p_css_classes=>'a-Form-fixedLabelsLarge'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4487)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138175863764259.4487)
,p_theme_id=>3
,p_name=>'FIXEDMEDIUM'
,p_display_name=>'Fixed (Medium Width)'
,p_display_sequence=>20
,p_css_classes=>'a-Form-fixedLabelsMed'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4487)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138340877764259.4487)
,p_theme_id=>3
,p_name=>'180PX'
,p_display_name=>'180px'
,p_display_sequence=>10
,p_css_classes=>'h180'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4487)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138553321764259.4487)
,p_theme_id=>3
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>20
,p_css_classes=>'h240'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4487)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138777457764259.4487)
,p_theme_id=>3
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>30
,p_css_classes=>'h320'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4487)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138891974764260.4487)
,p_theme_id=>3
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>50
,p_css_classes=>'h480'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4487)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857139153872764260.4487)
,p_theme_id=>3
,p_name=>'540PX'
,p_display_name=>'540px'
,p_display_sequence=>60
,p_css_classes=>'h540'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4487)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857139375337764260.4487)
,p_theme_id=>3
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>70
,p_css_classes=>'h640'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4487)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145206107768768.4487)
,p_theme_id=>3
,p_name=>'USE_COLORED_BACKGROUND'
,p_display_name=>'Use Colored Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4487)
,p_css_classes=>'a-Alert--colorBG'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145328630768768.4487)
,p_theme_id=>3
,p_name=>'USE_DEFAULT_ICONS'
,p_display_name=>'Use Default Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4487)
,p_css_classes=>'a-Alert--defaultIcons'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145505007768768.4487)
,p_theme_id=>3
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4487)
,p_css_classes=>'a-Alert--warning'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4487)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145725778768768.4487)
,p_theme_id=>3
,p_name=>'ERROR'
,p_display_name=>'Error'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4487)
,p_css_classes=>'a-Alert--danger'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4487)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145892117768768.4487)
,p_theme_id=>3
,p_name=>'INFORMATIONAL'
,p_display_name=>'Informational'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4487)
,p_css_classes=>'a-Alert--info'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4487)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146085228768768.4487)
,p_theme_id=>3
,p_name=>'HORIZONTAL'
,p_display_name=>'Horizontal'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4487)
,p_css_classes=>'a-Alert--horizontal'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4487)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146322225768769.4487)
,p_theme_id=>3
,p_name=>'WIZARD'
,p_display_name=>'Wizard'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4487)
,p_css_classes=>'a-Alert--wizard'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4487)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146393064768769.4487)
,p_theme_id=>3
,p_name=>'REMOVE_ICON'
,p_display_name=>'Remove Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4487)
,p_css_classes=>'a-Alert--noIcon'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146615368768769.4487)
,p_theme_id=>3
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4487)
,p_css_classes=>'a-Alert--success'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4487)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147042367768771.4487)
,p_theme_id=>3
,p_name=>'REGIONCONTAINSITEMSTEXT'
,p_display_name=>'Region Contains Items / Text'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4487)
,p_css_classes=>'a-ButtonRegion--withItems'
,p_template_types=>'REGION'
,p_help_text=>'Check this option if this region contains items or text.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147189725768771.4487)
,p_theme_id=>3
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4487)
,p_css_classes=>'a-ButtonRegion--noUI'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4487)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147385795768771.4487)
,p_theme_id=>3
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4487)
,p_css_classes=>'a-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4487)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147655668768771.4487)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4487)
,p_css_classes=>'a-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4487)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147872948768771.4487)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4487)
,p_css_classes=>'a-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4487)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147976018768771.4487)
,p_theme_id=>3
,p_name=>'WIZARDDIALOG'
,p_display_name=>'Used for Wizard Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4487)
,p_css_classes=>'a-ButtonRegion--wizard'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857148162424768771.4487)
,p_theme_id=>3
,p_name=>'VISIBLE'
,p_display_name=>'Visible'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4487)
,p_css_classes=>'a-ButtonRegion--showTitle'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4487)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857148341454768771.4487)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4487)
,p_css_classes=>'a-ButtonRegion--accessibleTitle'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4487)
,p_template_types=>'REGION'
,p_help_text=>'Use this option to add a visually hidden heading which is accessible for screen readers, but otherwise not visible to users.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149438708768778.4487)
,p_theme_id=>3
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4487)
,p_css_classes=>'a-BadgeList--float'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4487)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149614105768778.4487)
,p_theme_id=>3
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4487)
,p_css_classes=>'a-BadgeList--fixed'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4487)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149843563768778.4487)
,p_theme_id=>3
,p_name=>'STACKEDVERTICALLY'
,p_display_name=>'Stacked Vertically'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4487)
,p_css_classes=>'a-BadgeList--stacked'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4487)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149998210768778.4487)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'32px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4487)
,p_css_classes=>'a-BadgeList--small'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4487)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150194417768778.4487)
,p_theme_id=>3
,p_name=>'MEDIUM'
,p_display_name=>'48px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4487)
,p_css_classes=>'a-BadgeList--medium'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4487)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150439507768778.4487)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'64px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4487)
,p_css_classes=>'a-BadgeList--large'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4487)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150608654768780.4487)
,p_theme_id=>3
,p_name=>'XLARGE'
,p_display_name=>'96px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4487)
,p_css_classes=>'a-BadgeList--xlarge'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4487)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150792333768780.4487)
,p_theme_id=>3
,p_name=>'XXLARGE'
,p_display_name=>'128px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4487)
,p_css_classes=>'a-BadgeList--xxlarge'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4487)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151008734768780.4487)
,p_theme_id=>3
,p_name=>'2COLUMNNGRID'
,p_display_name=>'2 Columnn Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4487)
,p_css_classes=>'a-BadgeList--cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4487)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151259777768780.4487)
,p_theme_id=>3
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4487)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--3cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4487)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151408063768780.4487)
,p_theme_id=>3
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4487)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--4cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4487)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151643103768780.4487)
,p_theme_id=>3
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4487)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--5cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4487)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151861194768780.4487)
,p_theme_id=>3
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4487)
,p_css_classes=>'a-BadgeList--flex'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4487)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896798730495581814.4487)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4487)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(808380142596819918.4487)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896798963380581814.4487)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4487)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(808380828683819918.4487)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799089194581814.4487)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4487)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4487)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799349986581814.4487)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4487)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4487)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799577541581814.4487)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4487)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4487)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799637215581814.4487)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4487)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799807498581814.4487)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4487)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_imp.id(808383088145819924.4487)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022191342234716.4487)
,p_theme_id=>3
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4487)
,p_css_classes=>'a-MediaList--cols a-MediaList--2cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4487)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022392217234716.4487)
,p_theme_id=>3
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4487)
,p_css_classes=>'a-MediaList--cols a-MediaList--3cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4487)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022597980234716.4487)
,p_theme_id=>3
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4487)
,p_css_classes=>'a-MediaList--cols a-MediaList--4cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4487)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022867300234717.4487)
,p_theme_id=>3
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4487)
,p_css_classes=>'a-MediaList--cols a-MediaList--5cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4487)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023065592234717.4487)
,p_theme_id=>3
,p_name=>'SPANHORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4487)
,p_css_classes=>'a-MediaList--horizontal'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4487)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023131122234717.4487)
,p_theme_id=>3
,p_name=>'HIDEBADGE'
,p_display_name=>'Hide Badge'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4487)
,p_css_classes=>'a-MediaList--noBadge'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023191297234717.4487)
,p_theme_id=>3
,p_name=>'HIDEDESCRIPTION'
,p_display_name=>'Hide Description'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4487)
,p_css_classes=>'a-MediaList--noDesc'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023315038234717.4487)
,p_theme_id=>3
,p_name=>'HIDETITLE'
,p_display_name=>'Hide Title'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4487)
,p_css_classes=>'a-MediaList--noTitle'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023432264234717.4487)
,p_theme_id=>3
,p_name=>'HIDEICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4487)
,p_css_classes=>'a-MediaList--noIcons'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023494059234717.4487)
,p_theme_id=>3
,p_name=>'SLIMLIST'
,p_display_name=>'Slim List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4487)
,p_css_classes=>'a-MediaList--slim'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378094918666945.4487)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4487)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(808380142596819918.4487)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378225037666947.4487)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4487)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(808380828683819918.4487)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378370589666947.4487)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4487)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4487)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378467813666947.4487)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4487)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378526097666947.4487)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4487)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4487)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378615102666947.4487)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4487)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_imp.id(808383088145819924.4487)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378735377666947.4487)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4487)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4487)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1036071796325339624.4487)
,p_theme_id=>3
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(514332292784430987.4487)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1036071972285339624.4487)
,p_theme_id=>3
,p_name=>'ADD_SLIDE_ANIMATION'
,p_display_name=>'Add Slide Animation'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(514332292784430987.4487)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1050367122398973653.4487)
,p_theme_id=>3
,p_name=>'SLIMPROGRESSLIST'
,p_display_name=>'Slim Progress List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(865273508717512144.4487)
,p_css_classes=>'a-WizardSteps--slim'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1309233880682664517.4487)
,p_theme_id=>3
,p_name=>'LEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_button_template_id=>wwv_flow_imp.id(868252865986181054.4487)
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(856117908453058029.4487)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1351338307429029043.4487)
,p_theme_id=>3
,p_name=>'USED_IN_DIALOG'
,p_display_name=>'Used in Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1274355059486017828.4487)
,p_css_classes=>'a-ProcessingRegion--dialog'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333722717814196.4487)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4487)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333859287814196.4487)
,p_theme_id=>3
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4487)
,p_css_classes=>'a-LinksList--showBadge'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333887728814196.4487)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4487)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334039640814196.4487)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4487)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334247146814196.4487)
,p_theme_id=>3
,p_name=>'FORTOPLEVELONLY'
,p_display_name=>'For top level only'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4487)
,p_css_classes=>'a-LinksList--showTopIcons'
,p_group_id=>wwv_flow_imp.id(806925000765340952.4487)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334455135814196.4487)
,p_theme_id=>3
,p_name=>'FORALLITEMS'
,p_display_name=>'For all items'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4487)
,p_css_classes=>'a-LinksList--showIcons'
,p_group_id=>wwv_flow_imp.id(806925000765340952.4487)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491342397110118.4487)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4487)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491390428110118.4487)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4487)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491480011110118.4487)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4487)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664488722406040473.4487)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4487)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4487)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664488933681040473.4487)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4487)
,p_css_classes=>'a-Region--accessibleHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4487)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489165994040473.4487)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4487)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4487)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489304869040473.4487)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4487)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4487)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489519844040473.4487)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4487)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_imp.id(860570508910721307.4487)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489753255040473.4487)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4487)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4487)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489941797040473.4487)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4487)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4487)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490153471040473.4487)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4487)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4487)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490336091040473.4487)
,p_theme_id=>3
,p_name=>'DEFAULTPADDING'
,p_display_name=>'Default Padding'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4487)
,p_css_classes=>'a-Region--paddedBody'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4487)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490377667040473.4487)
,p_theme_id=>3
,p_name=>'REMOVE_TOP_BORDER'
,p_display_name=>'Remove Top Border'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4487)
,p_css_classes=>'a-Region--noTopBorder'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490659850040473.4487)
,p_theme_id=>3
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4487)
,p_css_classes=>'a-Region--simple'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4487)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664501980442158869.4487)
,p_theme_id=>3
,p_name=>'RESPONSIVEICONCOLUMNS'
,p_display_name=>'Responsive Icon Columns'
,p_display_sequence=>2
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4487)
,p_css_classes=>'a-IRR-region--responsiveIconView'
,p_template_types=>'REGION'
,p_help_text=>'Automatically increases number of icon columns to show based on screen resolution.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664502160891158869.4487)
,p_theme_id=>3
,p_name=>'ICONLABELSRIGHT'
,p_display_name=>'Icon Labels on Right'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4487)
,p_css_classes=>'a-IRR-region--iconLabelsRight'
,p_template_types=>'REGION'
,p_help_text=>'Shows labels in Icon View to the right of the icon.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664502181188158869.4487)
,p_theme_id=>3
,p_name=>'REMOVEOUTERBORDERS'
,p_display_name=>'Remove Outer Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4487)
,p_css_classes=>'a-IRR-region--noOuterBorders'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508367504174332.4487)
,p_theme_id=>3
,p_name=>'FLUSHREGION'
,p_display_name=>'Flush Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4487)
,p_css_classes=>'a-Region--flush'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508426350174332.4487)
,p_theme_id=>3
,p_name=>'STACKEDREGION'
,p_display_name=>'Stacked Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4487)
,p_css_classes=>'a-Region--stacked'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508588305174332.4487)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4487)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4487)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508810521174332.4487)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4487)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4487)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509005841174332.4487)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4487)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_imp.id(860570508910721307.4487)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509270186174332.4487)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4487)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4487)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509448573174333.4487)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4487)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4487)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509659839174333.4487)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4487)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4487)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509822387174334.4487)
,p_theme_id=>3
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>.1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4487)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4487)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664510028962174334.4487)
,p_theme_id=>3
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4487)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4487)
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
 p_id=>wwv_flow_imp.id(143182346580752618)
,p_name=>'4150_COLUMN_NUMBER'
,p_message_language=>'sv'
,p_message_text=>'Kolumn %0'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143166911589752613)
,p_name=>'ACCESS_CONTROL_ADMIN'
,p_message_language=>'sv'
,p_message_text=>unistr('Administrat\00F6r')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143166890183752613)
,p_name=>'ACCESS_CONTROL_USERNAME'
,p_message_language=>'sv'
,p_message_text=>unistr('Anv\00E4ndarnamn')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143229515316752632)
,p_name=>'ACCESS_DENIED_SIMPLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Nekad \00E5tkomst')
,p_version_scn=>2705693
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143186492415752619)
,p_name=>'ACCOUNT_HAS_BEEN_CREATED'
,p_message_language=>'sv'
,p_message_text=>'Ditt %0-konto har skapats.'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143169607755752614)
,p_name=>'ACCOUNT_LOCKED'
,p_message_language=>'sv'
,p_message_text=>unistr('Kontot \00E4r l\00E5st.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143154125071752610)
,p_name=>'AM_PM'
,p_message_language=>'sv'
,p_message_text=>'AM / PM'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143136929210752604)
,p_name=>'APEX.ACTIONS.ACTION_LINK'
,p_message_language=>'sv'
,p_message_text=>unistr('\00E5tg\00E4rdsl\00E4nk')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143136890794752604)
,p_name=>'APEX.ACTIONS.DIALOG_LINK'
,p_message_language=>'sv'
,p_message_text=>unistr('dialogl\00E4nk')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143301283511752653)
,p_name=>'APEX.ACTIONS.TOGGLE'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4xla %0')
,p_is_js_message=>true
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143309096367752656)
,p_name=>'APEX.ACTIVE_STATE'
,p_message_language=>'sv'
,p_message_text=>'(Aktiv)'
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143113813549752598)
,p_name=>'APEX.AI.CHAT_CLEARED'
,p_message_language=>'sv'
,p_message_text=>unistr('Chatten \00E4r rensad')
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143113734829752598)
,p_name=>'APEX.AI.CLEAR_CHAT'
,p_message_language=>'sv'
,p_message_text=>'Rensa chatt'
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143110386286752597)
,p_name=>'APEX.AI.CONSENT_ACCEPT'
,p_message_language=>'sv'
,p_message_text=>'Acceptera'
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143110407739752597)
,p_name=>'APEX.AI.CONSENT_DENY'
,p_message_language=>'sv'
,p_message_text=>'Neka'
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143110172567752596)
,p_name=>'APEX.AI.CONVERSATION_HISTORY'
,p_message_language=>'sv'
,p_message_text=>'Konversationshistorik'
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143113503972752597)
,p_name=>'APEX.AI.COPIED'
,p_message_language=>'sv'
,p_message_text=>'Kopierat'
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143113608666752598)
,p_name=>'APEX.AI.COPIED_TO_CLIPBOARD'
,p_message_language=>'sv'
,p_message_text=>'Kopierat till Urklipp'
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143113310612752597)
,p_name=>'APEX.AI.COPY'
,p_message_language=>'sv'
,p_message_text=>'Kopiera'
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143113493493752597)
,p_name=>'APEX.AI.COPY_TO_CLIPBOARD'
,p_message_language=>'sv'
,p_message_text=>'Kopiera till urklipp'
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143110880785752597)
,p_name=>'APEX.AI.DIALOG_TITLE'
,p_message_language=>'sv'
,p_message_text=>'Assistent'
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143111218832752597)
,p_name=>'APEX.AI.DISABLED'
,p_message_language=>'sv'
,p_message_text=>unistr('AI \00E4r inaktiverat p\00E5 arbetsytan eller instansniv\00E5.')
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143150554454752608)
,p_name=>'APEX.AI.GET_SERVER_ID_OR_STATIC_ID'
,p_message_language=>'sv'
,p_message_text=>unistr('Generative AI-tj\00E4nsten med ett angivet id eller statiskt id hittades inte.')
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143149293950752608)
,p_name=>'APEX.AI.HTTP_4013_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('Autentiseringsfel eller f\00F6rbjuden \00E5tkomst (HTTP-%1) f\00F6r URL %0. kontrollera konfigurationen av Generative AI-tj\00E4nsten %2.')
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143129056041752602)
,p_name=>'APEX.AI.HTTP_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('HTTP-beg\00E4ran till Generative AI-tj\00E4nsten vid %0 utf\00F6rdes inte med HTTP-%1: %2')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143153495022752609)
,p_name=>'APEX.AI.HTTP_FRIENDLY_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('Fel i HTTP-beg\00E4ran till Generative AI-tj\00E4nst f\00F6r insticksprogram %0 i l\00E4ge %1. Kontrollera konfigurationen f\00F6r Generative AI -tj\00E4nsten')
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143116211021752598)
,p_name=>'APEX.AI.MAIN_QUICK_ACTIONS_ARIA_LABEL'
,p_message_language=>'sv'
,p_message_text=>'Exempel'
,p_is_js_message=>true
,p_version_scn=>2705670
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143114642658752598)
,p_name=>'APEX.AI.NAME_ASSISTANT'
,p_message_language=>'sv'
,p_message_text=>'Assistent'
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143116025607752598)
,p_name=>'APEX.AI.NAME_COMMA_MESSAGE'
,p_message_language=>'sv'
,p_message_text=>'%0,%1'
,p_is_js_message=>true
,p_version_scn=>2705670
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143114591836752598)
,p_name=>'APEX.AI.NAME_USER'
,p_message_language=>'sv'
,p_message_text=>'Du'
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143145294771752607)
,p_name=>'APEX.AI.OCI_CHAT_NOT_SUPPORTED'
,p_message_language=>'sv'
,p_message_text=>unistr('OCI Generative AI st\00F6der f\00F6r n\00E4rvarande inte chattupplevelse med flera meddelanden.')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143125180226752601)
,p_name=>'APEX.AI.PROMPT_ENRICHMENT_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('Fel vid bearbetning av fr\00E5gan %0 f\00F6r applikationen %1. Kontrollera om applikationsverktyget \00E4r tillg\00E4ngligt i den h\00E4r instansen.')
,p_version_scn=>2705672
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143130286706752602)
,p_name=>'APEX.AI.RESPONSE_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('Kan inte bearbeta svar f\00F6r AI-tj\00E4nsten %0. Svar: %1')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143136449910752604)
,p_name=>'APEX.AI.SEND_MESSAGE'
,p_message_language=>'sv'
,p_message_text=>'Skicka meddelande'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143124726373752601)
,p_name=>'APEX.AI.SERVICE_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('Fel i AI-tj\00E4nsten %0 p\00E5 serversidan')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143110535322752597)
,p_name=>'APEX.AI.TEXTAREA_LABEL'
,p_message_language=>'sv'
,p_message_text=>'Meddelande'
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143110626352752597)
,p_name=>'APEX.AI.TEXTAREA_PLACEHOLDER'
,p_message_language=>'sv'
,p_message_text=>unistr('Skriv meddelandet h\00E4r')
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143113941836752598)
,p_name=>'APEX.AI.USER_AVATAR'
,p_message_language=>'sv'
,p_message_text=>unistr('Anv\00E4ndarens avatar')
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143114056766752598)
,p_name=>'APEX.AI.USE_THIS'
,p_message_language=>'sv'
,p_message_text=>unistr('Anv\00E4nd den h\00E4r')
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143110753358752597)
,p_name=>'APEX.AI.WARN_UNSENT_MESSAGE'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C4r du s\00E4ker? Du har ett meddelande som inte har skickats.')
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143279714100752647)
,p_name=>'APEX.AJAX_SERVER_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('Ajax-anropet returnerade serverfelet %0 f\00F6r %1.')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143206829795752625)
,p_name=>'APEX.APPLICATION.ALIAS.NON_UNIQUE'
,p_message_language=>'sv'
,p_message_text=>'Applikationsaliaset "%0" kan inte konverteras till ett unikt applikations-id.'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143195674466752622)
,p_name=>'APEX.APPLICATION.ALIAS.UNHANDLED_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('ERR-1816 Ov\00E4ntat fel vid konvertering av applikationsaliaset p_flow_alias_or_id (%0).')
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143293084437752651)
,p_name=>'APEX.APPLICATION.CHECKSUM.DESCRIPTION'
,p_message_language=>'sv'
,p_message_text=>unistr('Med kontrollsumman f\00F6r applikation f\00E5r du ett enkelt s\00E4tt att avg\00F6ra om samma applikation anv\00E4nds i flera arbetsytor. Du kan j\00E4mf\00F6ra kontrollsumman f\00F6r att avg\00F6ra om det finns en matchning.')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143179625020752617)
,p_name=>'APEX.AUTHENTICATION.AUTH_FUNC.UNHANDLED_ERROR'
,p_message_language=>'sv'
,p_message_text=>'Fel vid bearbetning av autentiseringsfunktion.'
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143161660472752612)
,p_name=>'APEX.AUTHENTICATION.AUTH_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'sv'
,p_message_text=>'Fel vid bearbetning av autentiseringsfunktion.'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143333509242752663)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.HOST_PREFIX_MISMATCH'
,p_message_language=>'sv'
,p_message_text=>unistr('Namnet p\00E5 tenant %0 som returnerades av Oracle Cloud Identity Management \00E4r inte beh\00F6rigt f\00F6r dom\00E4nen %1!<br/><a href="&LOGOUT_URL.">Logga in igen</a> och ange ett beh\00F6rigt tenantnamn eller \00E4ndra URL:en.')
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143157775130752611)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.USER_IS_NOT_DEVELOPER'
,p_message_language=>'sv'
,p_message_text=>unistr('Ditt konto "%0" har inte den utvecklingsbeh\00F6righet som kr\00E4vs (DB_DEVELOPER eller DB_ADMINISTRATOR)<br/>f\00F6r arbetsytan "%1"! <a href="&LOGOUT_URL.">Logga in igen</a> n\00E4r beh\00F6righeten har tillhandah\00E5llits.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143154304617752610)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.WRONG_GROUP_NAME'
,p_message_language=>'sv'
,p_message_text=>unistr('Namnet p\00E5 tenant som returnerades av Oracle Cloud Identity Management har inte beh\00F6righet f\00F6r den aktuella arbetsytan!<br/><a href="&LOGOUT_URL.">Logga in igen</a> och ange ett beh\00F6rigt tenant-namn.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143157835615752611)
,p_name=>'APEX.AUTHENTICATION.HOST_PREFIX_MISMATCH'
,p_message_language=>'sv'
,p_message_text=>unistr('Av s\00E4kerhetssk\00E4l till\00E5ts inte k\00F6rning av applikationer f\00F6r den h\00E4r arbetsytan via dom\00E4nen i URL:en.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143179361667752617)
,p_name=>'APEX.AUTHENTICATION.LDAP.DBMS_LDAP.ASK_FOR_INSTALLATION'
,p_message_language=>'sv'
,p_message_text=>unistr('Be databasadministrat\00F6ren k\00F6ra $OH/rdbms/admin/catldap.sql.')
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143179216336752617)
,p_name=>'APEX.AUTHENTICATION.LDAP.DBMS_LDAP.MISSING'
,p_message_language=>'sv'
,p_message_text=>unistr('SYS.DBMS_LDAP-paketet finns inte eller \00E4r ogiltigt.')
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143179187099752617)
,p_name=>'APEX.AUTHENTICATION.LDAP.EDIT_USER_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('Fel vid bearbetning av redigering av LDAP-anv\00E4ndarfunktionen.')
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143179495995752617)
,p_name=>'APEX.AUTHENTICATION.LDAP.UNHANDLED_ERROR'
,p_message_language=>'sv'
,p_message_text=>'Fel vid bearbetning av LDAP-autentisering.'
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143180286327752617)
,p_name=>'APEX.AUTHENTICATION.LOGIN.ILLEGAL_PAGE_ARG'
,p_message_language=>'sv'
,p_message_text=>unistr('Fel i argumentet p_flow_page f\00F6r proceduren login_page.')
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143179846186752617)
,p_name=>'APEX.AUTHENTICATION.LOGIN.INVALID_ARG'
,p_message_language=>'sv'
,p_message_text=>'Ogiltig p_session i wwv_flow_custom_auth_std.login--p_flow_page:%0 p_session_id:%1.'
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143231146703752632)
,p_name=>'APEX.AUTHENTICATION.LOGIN.MALFORMED_ARGS'
,p_message_language=>'sv'
,p_message_text=>'Felaktigt utformat argument till wwv_flow_custom_auth_std.login--p_flow_page:p_session_id:p_entry_point:%0:%1:%2.'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143179959303752617)
,p_name=>'APEX.AUTHENTICATION.LOGIN.NULL_USER'
,p_message_language=>'sv'
,p_message_text=>unistr('Ett null-anv\00E4ndarnamn \00F6verf\00F6rdes till inloggningsproceduren.')
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143166714536752613)
,p_name=>'APEX.AUTHENTICATION.LOGIN_THROTTLE.COUNTER'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4nta <span id="apex_login_throttle_sec">%0</span> sekunder innan du loggar in igen.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143168005032752614)
,p_name=>'APEX.AUTHENTICATION.LOGIN_THROTTLE.ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('Inloggningsf\00F6rs\00F6ket har blockerats.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143228867787752632)
,p_name=>'APEX.AUTHENTICATION.NOT_FOUND'
,p_message_language=>'sv'
,p_message_text=>'Hittar inte autentiseringen "%0"'
,p_version_scn=>2705693
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143168507761752614)
,p_name=>'APEX.AUTHENTICATION.NO_SECURITY_GROUP_ID'
,p_message_language=>'sv'
,p_message_text=>unistr('S\00E4kerhetsgrupp-id \00E4r null.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143179741285752617)
,p_name=>'APEX.AUTHENTICATION.POST_AUTH_PROC.UNHANDLED_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('Fel vid k\00F6rning av processen efter autentisering.')
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143179597048752617)
,p_name=>'APEX.AUTHENTICATION.PRE_AUTH_PROC.UNHANDLED_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('Fel vid bearbetning av processen f\00F6re autentisering.')
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143181245586752618)
,p_name=>'APEX.AUTHENTICATION.RESET_PASSWORD.INSTRUCTIONS'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\00D6ppna URL:en i samma webbl\00E4sare som du initierade beg\00E4ran om att \00E5terst\00E4lla l\00F6senord i. Om du klickar p\00E5 URL:en f\00F6r att \00E5terst\00E4lla l\00F6senord och omdirigeras till'),
unistr('inloggningssidan initierar du beg\00E4ran om att \00E5terst\00E4lla l\00F6senord igen och l\00E4mnar'),
unistr('webbl\00E4saren \00F6ppen.')))
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143331077838752662)
,p_name=>'APEX.AUTHENTICATION.RESET_PASSWORD_URL'
,p_message_language=>'sv'
,p_message_text=>unistr('URL f\00F6r att \00E5terst\00E4lla l\00F6senord')
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143158053286752611)
,p_name=>'APEX.AUTHENTICATION.RM_GROUP_NOT_GRANTED'
,p_message_language=>'sv'
,p_message_text=>'Resurshanterarkonsumentgrupp %0 har inte beviljats %1'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143158199019752611)
,p_name=>'APEX.AUTHENTICATION.RM_INFO_TO_GRANT'
,p_message_language=>'sv'
,p_message_text=>unistr('Anv\00E4nd DBMS_RESOURCE_MANAGER_PRIVS.GRANT_SWITCH_CONSUMER_GROUP till att bevilja den saknade beh\00F6righeten.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143192768031752621)
,p_name=>'APEX.AUTHENTICATION.SESSION_SENTRY_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('Fel vid bearbetning av funktionen f\00F6r sessionsvaktpost.')
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143192875583752621)
,p_name=>'APEX.AUTHENTICATION.SESSION_VERIFY_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('Fel vid bearbetning av funktionen f\00F6r sessionsverifiering.')
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143193097839752621)
,p_name=>'APEX.AUTHENTICATION.SSO.ASK_FOR_INSTALLATION'
,p_message_language=>'sv'
,p_message_text=>unistr('Be %0-administrat\00F6ren konfigurera motorn f\00F6r enkel inloggning f\00F6r Oracle Application Server.')
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143203475856752624)
,p_name=>'APEX.AUTHENTICATION.SSO.BAD_URLC'
,p_message_language=>'sv'
,p_message_text=>unistr('Otill\00E5ten %0 i %1-token returnerades av sso.')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143180142193752617)
,p_name=>'APEX.AUTHENTICATION.SSO.FIX_PARTNER_APP'
,p_message_language=>'sv'
,p_message_text=>unistr('Redigera autentiseringsschemat och l\00E4gg till applikationens namn.')
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143203136658752624)
,p_name=>'APEX.AUTHENTICATION.SSO.ILLEGAL_CALLER'
,p_message_language=>'sv'
,p_message_text=>unistr('Otill\00E5ten anropare av %0-procedur:')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143203392269752624)
,p_name=>'APEX.AUTHENTICATION.SSO.INVALID_APP_SESSION'
,p_message_language=>'sv'
,p_message_text=>unistr('Otill\00E5ten appsession i urlc-token: %0')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143202983674752624)
,p_name=>'APEX.AUTHENTICATION.SSO.MISSING_APP_REGISTRATION'
,p_message_language=>'sv'
,p_message_text=>'Fel i portal_sso_redirect: Information om applikationsregistering saknas: %0'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143192976035752621)
,p_name=>'APEX.AUTHENTICATION.SSO.PACKAGE_MISSING'
,p_message_language=>'sv'
,p_message_text=>unistr('Paketet WWSEC_SSO_ENABLER_PRIVATE finns inte eller \00E4r ogiltigt.')
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143180055724752617)
,p_name=>'APEX.AUTHENTICATION.SSO.PARTNER_APP_IS_NULL'
,p_message_language=>'sv'
,p_message_text=>unistr('Hittar inte namn p\00E5 registrerad partnerapplikation i autentiseringsschemat.')
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143203077590752624)
,p_name=>'APEX.AUTHENTICATION.SSO.REGISTER_APP'
,p_message_language=>'sv'
,p_message_text=>'Registrera applikationen enligt beskrivningen i installationsguiden.'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143193147556752621)
,p_name=>'APEX.AUTHENTICATION.SSO.UNHANDLED_ERROR'
,p_message_language=>'sv'
,p_message_text=>'Fel vid bearbetning av SSO-autentisering.'
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143306469694752655)
,p_name=>'APEX.AUTHENTICATION.UNAUTHORIZED_URL'
,p_message_language=>'sv'
,p_message_text=>unistr('Obeh\00F6rig URL: %0')
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143192587097752621)
,p_name=>'APEX.AUTHENTICATION.UNHANDLED_ERROR'
,p_message_language=>'sv'
,p_message_text=>'Fel vid bearbetning av autentisering.'
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143157950699752611)
,p_name=>'APEX.AUTHENTICATION.WORKSPACE_NOT_ASSIGNED'
,p_message_language=>'sv'
,p_message_text=>unistr('Arbetsytan "%0" \00E4r inaktiv. Kontakta administrat\00F6ren.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143158613570752611)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED'
,p_message_language=>'sv'
,p_message_text=>'%0'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143167770837752614)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED.APPLICATION'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C5tkomst nekad av applikationens s\00E4kerhetskontroll')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143167870665752614)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED.PAGE'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C5tkomst nekad av sidans s\00E4kerhetskontroll')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143167992561752614)
,p_name=>'APEX.AUTHORIZATION.UNHANDLED_ERROR'
,p_message_language=>'sv'
,p_message_text=>'Fel vid bearbetning av auktorisering.'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143237027221752634)
,p_name=>'APEX.BUILT_WITH_LOVE_USING_APEX'
,p_message_language=>'sv'
,p_message_text=>unistr('Skapad med %0 med hj\00E4lp av %1')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143237193772752634)
,p_name=>'APEX.BUILT_WITH_LOVE_USING_APEX.ACCESSIBLE.LOVE'
,p_message_language=>'sv'
,p_message_text=>unistr('k\00E4rlek')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143296914903752652)
,p_name=>'APEX.CALENDAR.EVENT_DESCRIPTION'
,p_message_language=>'sv'
,p_message_text=>unistr('H\00E4ndelsebeskrivning')
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143296706225752652)
,p_name=>'APEX.CALENDAR.EVENT_END'
,p_message_language=>'sv'
,p_message_text=>'Slutdatum'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143297074408752652)
,p_name=>'APEX.CALENDAR.EVENT_ID'
,p_message_language=>'sv'
,p_message_text=>unistr('H\00E4ndelse-id')
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143296685687752652)
,p_name=>'APEX.CALENDAR.EVENT_START'
,p_message_language=>'sv'
,p_message_text=>'Startdatum'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143296815463752652)
,p_name=>'APEX.CALENDAR.EVENT_TITLE'
,p_message_language=>'sv'
,p_message_text=>unistr('H\00E4ndelserubrik')
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143139495063752605)
,p_name=>'APEX.CARD'
,p_message_language=>'sv'
,p_message_text=>'Kort'
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143139684460752605)
,p_name=>'APEX.CARD.CARD_ACTION'
,p_message_language=>'sv'
,p_message_text=>unistr('Kort\00E5tg\00E4rder')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143180341127752617)
,p_name=>'APEX.CHECKBOX.VISUALLY_HIDDEN_CHECKBOX'
,p_message_language=>'sv'
,p_message_text=>'Visuellt dold kryssruta'
,p_is_js_message=>true
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143182254325752618)
,p_name=>'APEX.CHECKSUM.CONTENT_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('Fel i kontrollsummeinneh\00E5ll')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143182176462752618)
,p_name=>'APEX.CHECKSUM.FORMAT_ERROR'
,p_message_language=>'sv'
,p_message_text=>'Fel i kontrollsummeformat'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143252034876752639)
,p_name=>'APEX.CLIPBOARD.COPIED'
,p_message_language=>'sv'
,p_message_text=>'Kopierat till Urklipp.'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143251573880752639)
,p_name=>'APEX.CLIPBOARD.NOTSUP'
,p_message_language=>'sv'
,p_message_text=>unistr('Den h\00E4r webbl\00E4saren saknar st\00F6d f\00F6r kopiering via en knapp eller meny. Prova med Ctrl+C eller Kommando+C.')
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143237701363752634)
,p_name=>'APEX.CLOSE_NOTIFICATION'
,p_message_language=>'sv'
,p_message_text=>unistr('St\00E4ng')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143116104271752598)
,p_name=>'APEX.CODE_EDITOR.MAXIMUM_LENGTH_EXCEEDED'
,p_message_language=>'sv'
,p_message_text=>unistr('Inneh\00E5llet i kodredigeraren \00F6verskrider objektets maxl\00E4ngd (faktiskt antal %0, till\00E5tet antal %1 tecken)')
,p_is_js_message=>true
,p_version_scn=>2705670
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143296235903752652)
,p_name=>'APEX.COLOR_PICKER.CONTRAST'
,p_message_language=>'sv'
,p_message_text=>'Kontrast'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143290734816752650)
,p_name=>'APEX.COLOR_PICKER.CURRENT'
,p_message_language=>'sv'
,p_message_text=>'Aktuell'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143290637812752650)
,p_name=>'APEX.COLOR_PICKER.INITIAL'
,p_message_language=>'sv'
,p_message_text=>'Inledande'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143294881653752651)
,p_name=>'APEX.COLOR_PICKER.INVALID_COLOR'
,p_message_language=>'sv'
,p_message_text=>unistr('#LABEL# m\00E5ste vara en giltig v\00E4rdef\00E4rg. Till exempel: %0')
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143157248924752610)
,p_name=>'APEX.COLOR_PICKER.MORE_PRESET_COLORS'
,p_message_language=>'sv'
,p_message_text=>unistr('Fler f\00E4rger')
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143157307601752610)
,p_name=>'APEX.COLOR_PICKER.OPEN'
,p_message_language=>'sv'
,p_message_text=>unistr('\00D6ppna f\00E4rgv\00E4ljaren')
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143114413370752598)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.ALPHA_SLIDER'
,p_message_language=>'sv'
,p_message_text=>unistr('Alfaskjutreglage, horisontellt skjutreglage. Anv\00E4nd piltangenterna till att navigera.')
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143114141970752598)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.COLOR_SPECTRUM'
,p_message_language=>'sv'
,p_message_text=>unistr('F\00E4rgspektrum, fyrv\00E4gsskjutreglage. Anv\00E4nd piltangenterna till att navigera.')
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143114264489752598)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.HUE_SLIDER'
,p_message_language=>'sv'
,p_message_text=>unistr('Nyansskjutreglage, vertikalt skjutreglage. Anv\00E4nd piltangenterna till att navigera.')
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143290579117752650)
,p_name=>'APEX.COLOR_PICKER.TITLE'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4lj en f\00E4rg')
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143290861592752650)
,p_name=>'APEX.COLOR_PICKER.TOGGLE_TITLE'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C4ndra f\00E4rgformat')
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143328796104752662)
,p_name=>'APEX.COMBOBOX.LIST_OF_VALUES'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4rdelista')
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143328831433752662)
,p_name=>'APEX.COMBOBOX.SHOW_ALL_VALUES'
,p_message_language=>'sv'
,p_message_text=>unistr('\00D6ppna lista f\00F6r: %0')
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143309181253752656)
,p_name=>'APEX.COMPLETED_STATE'
,p_message_language=>'sv'
,p_message_text=>unistr('(Slutf\00F6rd)')
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143198043328752623)
,p_name=>'APEX.CONTACT_ADMIN'
,p_message_language=>'sv'
,p_message_text=>unistr('Kontakta applikationsadministrat\00F6ren.')
,p_version_scn=>2705687
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143213589457752627)
,p_name=>'APEX.CONTACT_ADMIN.DEBUG'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Kontakta applikationsadministrat\00F6ren.'),
unistr('Information om incidenten kan f\00E5s via fels\00F6knings-id "%0".')))
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143295116002752652)
,p_name=>'APEX.CORRECT_ERRORS'
,p_message_language=>'sv'
,p_message_text=>'Korrigera felen innan du sparar.'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143140456467752605)
,p_name=>'APEX.CS.ACTIVE_VALUE_CHIP'
,p_message_language=>'sv'
,p_message_text=>unistr('%0. Tryck p\00E5 backstegstangenten f\00F6r att ta bort.')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143238642599752635)
,p_name=>'APEX.CS.MATCHES_FOUND'
,p_message_language=>'sv'
,p_message_text=>'%0 matchningar hittades'
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143120554097752600)
,p_name=>'APEX.CS.MATCH_FOUND'
,p_message_language=>'sv'
,p_message_text=>'1 matchning hittades'
,p_is_js_message=>true
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143238513583752635)
,p_name=>'APEX.CS.NO_MATCHES'
,p_message_language=>'sv'
,p_message_text=>unistr('Inga tr\00E4ffar')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143114957159752598)
,p_name=>'APEX.CS.OTHERS_GROUP'
,p_message_language=>'sv'
,p_message_text=>unistr('\00D6vriga')
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143114830483752598)
,p_name=>'APEX.CS.SELECTED_VALUES_COUNTER'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 v\00E4rden valda')
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143309630027752656)
,p_name=>'APEX.CURRENT_PROGRESS'
,p_message_language=>'sv'
,p_message_text=>unistr('Aktuellt f\00F6rlopp')
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143295537110752652)
,p_name=>'APEX.DATA.LOAD.FILE_DOES_NOT_EXIST'
,p_message_language=>'sv'
,p_message_text=>'Filen som angetts i objektet %0 finns inte i APEX_APPLICATION_TEMP_FILES.'
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143284061393752648)
,p_name=>'APEX.DATA_HAS_CHANGED'
,p_message_language=>'sv'
,p_message_text=>unistr('Den aktuella versionen av data i databasen har \00E4ndrats sedan anv\00E4ndaren initierade uppdateringsprocessen.')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143253167194752639)
,p_name=>'APEX.DATA_LOAD.DO_NOT_LOAD'
,p_message_language=>'sv'
,p_message_text=>'Ladda inte'
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143299485696752653)
,p_name=>'APEX.DATA_LOAD.FAILED'
,p_message_language=>'sv'
,p_message_text=>unistr('F\00F6rbearbetningsfel')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143299297078752653)
,p_name=>'APEX.DATA_LOAD.INSERT'
,p_message_language=>'sv'
,p_message_text=>'Infoga rad'
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143312848005752657)
,p_name=>'APEX.DATA_LOAD.SEQUENCE_ACTION'
,p_message_language=>'sv'
,p_message_text=>unistr('Sekvens: \00C5tg\00E4rd')
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143299338680752653)
,p_name=>'APEX.DATA_LOAD.UPDATE'
,p_message_language=>'sv'
,p_message_text=>'Uppdatera rad'
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143127844617752602)
,p_name=>'APEX.DATEPICKER.ACTIONS'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C5tg\00E4rder')
,p_is_js_message=>true
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143155400930752610)
,p_name=>'APEX.DATEPICKER.AM_PM'
,p_message_language=>'sv'
,p_message_text=>'AM/PM'
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143141539547752606)
,p_name=>'APEX.DATEPICKER.BOUNDARY_ITEM_FORMAT_INVALID'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 m\00E5ste vara en datumv\00E4ljare eller ett giltigt datum, till exempel %1.')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143250761158752638)
,p_name=>'APEX.DATEPICKER.CLEAR'
,p_message_language=>'sv'
,p_message_text=>'Rensa'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143158967553752611)
,p_name=>'APEX.DATEPICKER.DONE'
,p_message_language=>'sv'
,p_message_text=>unistr('Utf\00F6rd')
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143169932228752614)
,p_name=>'APEX.DATEPICKER.FORMAT_NOT_SUPPORTED'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 har delar utan st\00F6d i formatmasken: %1')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143155173303752610)
,p_name=>'APEX.DATEPICKER.HOUR'
,p_message_language=>'sv'
,p_message_text=>'Timme'
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143239057579752635)
,p_name=>'APEX.DATEPICKER.ICON_TEXT'
,p_message_language=>'sv'
,p_message_text=>'Popupkalender: %0'
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143154917434752610)
,p_name=>'APEX.DATEPICKER.ISO_WEEK'
,p_message_language=>'sv'
,p_message_text=>'Vecka'
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143155007456752610)
,p_name=>'APEX.DATEPICKER.ISO_WEEK_ABBR'
,p_message_language=>'sv'
,p_message_text=>'V.'
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143155382716752610)
,p_name=>'APEX.DATEPICKER.MINUTES'
,p_message_language=>'sv'
,p_message_text=>'Minuter'
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143155566388752610)
,p_name=>'APEX.DATEPICKER.MONTH'
,p_message_language=>'sv'
,p_message_text=>unistr('M\00E5nad')
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143155959327752610)
,p_name=>'APEX.DATEPICKER.NEXT_MONTH'
,p_message_language=>'sv'
,p_message_text=>unistr('N\00E4sta m\00E5nad')
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143125528142752601)
,p_name=>'APEX.DATEPICKER.POPUP'
,p_message_language=>'sv'
,p_message_text=>unistr('Popupf\00F6nster f\00F6r %0')
,p_is_js_message=>true
,p_version_scn=>2705672
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143155859522752610)
,p_name=>'APEX.DATEPICKER.PREVIOUS_MONTH'
,p_message_language=>'sv'
,p_message_text=>unistr('F\00F6reg\00E5ende m\00E5nad')
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143248380937752638)
,p_name=>'APEX.DATEPICKER.READONLY_DATEPICKER'
,p_message_language=>'sv'
,p_message_text=>unistr('Skrivskyddad datumv\00E4ljare')
,p_version_scn=>2705695
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143156790279752610)
,p_name=>'APEX.DATEPICKER.SELECT_DATE'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4lj datum')
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143125695136752601)
,p_name=>'APEX.DATEPICKER.SELECT_DATE_AND_TIME'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4lj datum och tid')
,p_is_js_message=>true
,p_version_scn=>2705672
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143122885312752600)
,p_name=>'APEX.DATEPICKER.SELECT_DAY'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4lj dag')
,p_is_js_message=>true
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143126215997752601)
,p_name=>'APEX.DATEPICKER.SELECT_MONTH_AND_YEAR'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4lj m\00E5nad och \00E5r')
,p_is_js_message=>true
,p_version_scn=>2705672
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143123004731752600)
,p_name=>'APEX.DATEPICKER.SELECT_TIME'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4lj tid')
,p_is_js_message=>true
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143123590401752600)
,p_name=>'APEX.DATEPICKER.TODAY'
,p_message_language=>'sv'
,p_message_text=>'Idag'
,p_is_js_message=>true
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143141109587752606)
,p_name=>'APEX.DATEPICKER.VALUE_INVALID'
,p_message_language=>'sv'
,p_message_text=>unistr('#LABEL# m\00E5ste vara ett giltigt datum, till exempel %0.')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143140829313752606)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_BETWEEN'
,p_message_language=>'sv'
,p_message_text=>unistr('#LABEL# m\00E5ste vara mellan %0 och %1.')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143140978954752606)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_ON_OR_AFTER'
,p_message_language=>'sv'
,p_message_text=>unistr('#LABEL# m\00E5ste infalla p\00E5 eller efter %0.')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143141052313752606)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_ON_OR_BEFORE'
,p_message_language=>'sv'
,p_message_text=>unistr('#LABEL# m\00E5ste infalla p\00E5 eller f\00F6re %0.')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143132407898752603)
,p_name=>'APEX.DATEPICKER.VISUALLY_HIDDEN_EDIT'
,p_message_language=>'sv'
,p_message_text=>'Redigera Visuellt dold'
,p_is_js_message=>true
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143155781364752610)
,p_name=>'APEX.DATEPICKER.YEAR'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C5r')
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143242785972752636)
,p_name=>'APEX.DATEPICKER_VALUE_GREATER_MAX_DATE'
,p_message_language=>'sv'
,p_message_text=>unistr('#LABEL# \00E4r h\00F6gre \00E4n det angivna h\00F6gsta datumet %0.')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143243146263752636)
,p_name=>'APEX.DATEPICKER_VALUE_INVALID'
,p_message_language=>'sv'
,p_message_text=>'#LABEL# matchar inte formatet %0.'
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143242689350752636)
,p_name=>'APEX.DATEPICKER_VALUE_LESS_MIN_DATE'
,p_message_language=>'sv'
,p_message_text=>unistr('#LABEL# \00E4r l\00E4gre \00E4n det angivna l\00E4gsta datumet %0.')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143242893009752636)
,p_name=>'APEX.DATEPICKER_VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'sv'
,p_message_text=>'#LABEL# ligger inte inom det giltiga intervallet %0 till %1.'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143243099263752636)
,p_name=>'APEX.DATEPICKER_VALUE_NOT_IN_YEAR_RANGE'
,p_message_language=>'sv'
,p_message_text=>unistr('#LABEL# ligger inte inom det giltiga \00E5rsintervallet %0 och %1.')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143134896717752604)
,p_name=>'APEX.DBMS_CLOUD_INT.DBMS_CLOUD_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('Ett internt fel intr\00E4ffade vid bearbetning av DBMS_CLOUD-beg\00E4ran.')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143295431675752652)
,p_name=>'APEX.DIALOG.CANCEL'
,p_message_language=>'sv'
,p_message_text=>'Avbryt'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143321372899752659)
,p_name=>'APEX.DIALOG.CLOSE'
,p_message_language=>'sv'
,p_message_text=>unistr('St\00E4ng')
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143182567201752618)
,p_name=>'APEX.DIALOG.CONFIRMATION'
,p_message_language=>'sv'
,p_message_text=>unistr('Bekr\00E4ftelse')
,p_is_js_message=>true
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143323379375752660)
,p_name=>'APEX.DIALOG.HELP'
,p_message_language=>'sv'
,p_message_text=>unistr('Hj\00E4lp')
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143295201492752652)
,p_name=>'APEX.DIALOG.OK'
,p_message_language=>'sv'
,p_message_text=>'OK'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143295362939752652)
,p_name=>'APEX.DIALOG.SAVE'
,p_message_language=>'sv'
,p_message_text=>'Spara'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143163059725752612)
,p_name=>'APEX.DIALOG.TITLE'
,p_message_language=>'sv'
,p_message_text=>'Dialogrubrik'
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143202720756752624)
,p_name=>'APEX.DIALOG.VISUALLY_HIDDEN_TITLE'
,p_message_language=>'sv'
,p_message_text=>'Dialogrutan Visuellt dold'
,p_is_js_message=>true
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143123877352752601)
,p_name=>'APEX.DOCGEN'
,p_message_language=>'sv'
,p_message_text=>unistr('Oracles f\00F6rdefinierade funktion f\00F6r dokumentgenerering')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143134648465752604)
,p_name=>'APEX.DOCGEN.DBMS_CLOUD_ERROR'
,p_message_language=>'sv'
,p_message_text=>'Fel vid utskrift av ett dokument.'
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143111888369752597)
,p_name=>'APEX.DOCGEN.INVALID_OUTPUT_TYPE'
,p_message_language=>'sv'
,p_message_text=>unistr('%s har inte st\00F6d f\00F6r %1 som utdata.')
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143123791561752601)
,p_name=>'APEX.DOCGEN.INVOKE_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('Felet "%0" intr\00E4ffade vid anrop av Oracles f\00F6rdefinierade funktion f\00F6r dokumentgenerering:')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143115272336752598)
,p_name=>'APEX.DOCGEN.TEMPLATE_REQUIRED'
,p_message_language=>'sv'
,p_message_text=>unistr('En mall kr\00E4vs.')
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143140624085752606)
,p_name=>'APEX.DOWNLOAD.ERROR'
,p_message_language=>'sv'
,p_message_text=>'Fel vid nedladdning av fil.'
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143140542039752605)
,p_name=>'APEX.DOWNLOAD.NO_DATA_FOUND'
,p_message_language=>'sv'
,p_message_text=>'Hittade inga nedladdningsbara data.'
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143144171582752607)
,p_name=>'APEX.ENVIRONMENT.RUNTIME_ONLY'
,p_message_language=>'sv'
,p_message_text=>unistr('Den h\00E4r funktionen \00E4r inte tillg\00E4nglig i en Runtime-Only-milj\00F6.')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143196960417752622)
,p_name=>'APEX.ERROR'
,p_message_language=>'sv'
,p_message_text=>'Fel'
,p_is_js_message=>true
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143156886708752610)
,p_name=>'APEX.ERROR.CALLBACK_FAILED'
,p_message_language=>'sv'
,p_message_text=>unistr('F\00F6ljande fel intr\00E4ffade vid k\00F6rning av \00E5teranrop f\00F6r felhantering: %0')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143169426260752614)
,p_name=>'APEX.ERROR.ERROR_PAGE.UNHANDLED_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('Ett fel intr\00E4ffade vid formatering av felsidan: %0')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143158584394752611)
,p_name=>'APEX.ERROR.INTERNAL'
,p_message_language=>'sv'
,p_message_text=>'Internt fel'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143308209992752656)
,p_name=>'APEX.ERROR.INTERNAL.CONTACT_ADMINISTRATOR'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Kontakta administrat\00F6ren.'),
unistr('Information om incidenten \00E4r tillg\00E4nglig via fels\00F6knings-id "%0".')))
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143302823781752654)
,p_name=>'APEX.ERROR.ORA-16000'
,p_message_language=>'sv'
,p_message_text=>unistr('Databasen \00E4r \00F6ppen f\00F6r skrivskyddad \00E5tkomst.')
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143332982986752663)
,p_name=>'APEX.ERROR.ORA-28353'
,p_message_language=>'sv'
,p_message_text=>unistr('ORA-28353: Kunde inte \00F6ppna pl\00E5nboken. Applikationsdata \00E4r inte tillg\00E4ngliga just nu.')
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143302967910752654)
,p_name=>'APEX.ERROR.PAGE_NOT_AVAILABLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Sidan \00E4r inte tillg\00E4nglig')
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143161538952752612)
,p_name=>'APEX.ERROR.TECHNICAL_INFO'
,p_message_language=>'sv'
,p_message_text=>unistr('Teknisk information (endast tillg\00E4nglig f\00F6r utvecklare)')
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143267402572752643)
,p_name=>'APEX.ERROR_MESSAGE_HEADING'
,p_message_language=>'sv'
,p_message_text=>'Felmeddelande'
,p_is_js_message=>true
,p_version_scn=>2705700
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143281305110752647)
,p_name=>'APEX.EXPECTED_FORMAT'
,p_message_language=>'sv'
,p_message_text=>unistr('F\00F6rv\00E4ntat format: %0')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143246261635752637)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.ALREADY_IN_ACL'
,p_message_language=>'sv'
,p_message_text=>unistr('Anv\00E4ndare finns redan i \00E5tkomstkontrollistan')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143246121254752637)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.CREATE_CONFIRM'
,p_message_language=>'sv'
,p_message_text=>unistr('Bekr\00E4fta att f\00F6ljande %0 anv\00E4ndare l\00E4ggs till i \00E5tkomstkontrollistan f\00F6r <strong>%1</strong>.')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143246656223752637)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.DUPLICATE_USER'
,p_message_language=>'sv'
,p_message_text=>unistr('Dubblettanv\00E4ndare finns')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143246355944752637)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.MISSING_AT_SIGN'
,p_message_language=>'sv'
,p_message_text=>'Snabel-a (@) saknas i e-postadressen'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143246451568752637)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.MISSING_DOT'
,p_message_language=>'sv'
,p_message_text=>'Punkt (.) saknas i e-postadressen'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143246589294752637)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.USERNAME_TOO_LONG'
,p_message_language=>'sv'
,p_message_text=>unistr('Anv\00E4ndarnamnet \00E4r f\00F6r l\00E5ngt')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143246803352752637)
,p_name=>'APEX.FEATURE.ACL.INFO.ACL_ONLY'
,p_message_language=>'sv'
,p_message_text=>unistr('Endast anv\00E4ndare som har definierats i applikationens \00E5tkomstkontrollista har \00E5tkomst till den h\00E4r applikationen')
,p_version_scn=>2705695
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143246965461752637)
,p_name=>'APEX.FEATURE.ACL.INFO.ACL_VALUE_INVALID'
,p_message_language=>'sv'
,p_message_text=>unistr('Ov\00E4ntat v\00E4rde f\00F6r \00E5tkomstkontrollinst\00E4llning: %0')
,p_version_scn=>2705695
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143246727667752637)
,p_name=>'APEX.FEATURE.ACL.INFO.ALL_USERS'
,p_message_language=>'sv'
,p_message_text=>unistr('Alla autentiserade anv\00E4ndare har \00E5tkomst till den h\00E4r applikationen')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143291298031752650)
,p_name=>'APEX.FEATURE.CONFIG.DISABLED'
,p_message_language=>'sv'
,p_message_text=>'Inaktiv'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143291185623752650)
,p_name=>'APEX.FEATURE.CONFIG.ENABLED'
,p_message_language=>'sv'
,p_message_text=>'Aktiv'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143291446361752650)
,p_name=>'APEX.FEATURE.CONFIG.IS_DISABLED'
,p_message_language=>'sv'
,p_message_text=>unistr('%0: \00E4r inaktiv')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143291376597752650)
,p_name=>'APEX.FEATURE.CONFIG.IS_ENABLED'
,p_message_language=>'sv'
,p_message_text=>unistr('%0: \00E4r aktiv')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143139940796752605)
,p_name=>'APEX.FEATURE.CONFIG.NOT_SUPPORTED'
,p_message_language=>'sv'
,p_message_text=>unistr('St\00F6ds inte')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143201133998752624)
,p_name=>'APEX.FEATURE.CONFIG.OFF'
,p_message_language=>'sv'
,p_message_text=>'Av'
,p_is_js_message=>true
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143201098537752624)
,p_name=>'APEX.FEATURE.CONFIG.ON'
,p_message_language=>'sv'
,p_message_text=>unistr('P\00E5')
,p_is_js_message=>true
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143291035242752650)
,p_name=>'APEX.FEATURE.TOP_USERS.USERNAME.NOT_IDENTIFIED'
,p_message_language=>'sv'
,p_message_text=>'ej identifierad'
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143131501247752603)
,p_name=>'APEX.FILESIZE.BYTES'
,p_message_language=>'sv'
,p_message_text=>'%0 byte'
,p_is_js_message=>true
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143132098641752603)
,p_name=>'APEX.FILESIZE.GB'
,p_message_language=>'sv'
,p_message_text=>'%0 GB'
,p_is_js_message=>true
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143131755524752603)
,p_name=>'APEX.FILESIZE.KB'
,p_message_language=>'sv'
,p_message_text=>'%0 KB'
,p_is_js_message=>true
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143131937203752603)
,p_name=>'APEX.FILESIZE.MB'
,p_message_language=>'sv'
,p_message_text=>'%0 MB'
,p_is_js_message=>true
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143284204395752648)
,p_name=>'APEX.FILE_BROWSE.DOWNLOAD_LINK_TEXT'
,p_message_language=>'sv'
,p_message_text=>'Ladda ned'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143137352578752605)
,p_name=>'APEX.FS.ACTIONS_MENU_BUTTON_LABEL'
,p_message_language=>'sv'
,p_message_text=>'Alternativ'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143137014761752604)
,p_name=>'APEX.FS.ACTIONS_MENU_FILTER'
,p_message_language=>'sv'
,p_message_text=>'Filtrera'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143137218480752605)
,p_name=>'APEX.FS.ACTIONS_MENU_HIDE'
,p_message_language=>'sv'
,p_message_text=>unistr('D\00F6lj fasett')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143161972828752612)
,p_name=>'APEX.FS.ADD_FILTER'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00E4gg t filter')
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143238299227752635)
,p_name=>'APEX.FS.APPLIED_FACET'
,p_message_language=>'sv'
,p_message_text=>unistr('Anv\00E4nt filter: %0')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143162629390752612)
,p_name=>'APEX.FS.APPLY'
,p_message_language=>'sv'
,p_message_text=>unistr('Till\00E4mpa')
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143281891342752648)
,p_name=>'APEX.FS.BATCH_APPLY'
,p_message_language=>'sv'
,p_message_text=>unistr('Till\00E4mpa')
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143162713533752612)
,p_name=>'APEX.FS.CANCEL'
,p_message_language=>'sv'
,p_message_text=>'Avbryt'
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143146580832752607)
,p_name=>'APEX.FS.CHART_BAR'
,p_message_language=>'sv'
,p_message_text=>'Stapeldiagram'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143294550882752651)
,p_name=>'APEX.FS.CHART_OTHERS'
,p_message_language=>'sv'
,p_message_text=>unistr('\00D6vriga')
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143146656475752607)
,p_name=>'APEX.FS.CHART_PIE'
,p_message_language=>'sv'
,p_message_text=>'Cirkeldiagram'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143293114323752651)
,p_name=>'APEX.FS.CHART_TITLE'
,p_message_language=>'sv'
,p_message_text=>'Diagram'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143146367621752607)
,p_name=>'APEX.FS.CHART_VALUE_LABEL'
,p_message_language=>'sv'
,p_message_text=>'Antal'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143282398853752648)
,p_name=>'APEX.FS.CLEAR'
,p_message_language=>'sv'
,p_message_text=>'Rensa'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143282406772752648)
,p_name=>'APEX.FS.CLEAR_ALL'
,p_message_language=>'sv'
,p_message_text=>'Rensa alla'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143282555746752648)
,p_name=>'APEX.FS.CLEAR_VALUE'
,p_message_language=>'sv'
,p_message_text=>'Rensa %0'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143299048517752653)
,p_name=>'APEX.FS.COLUMN_UNAUTHORIZED'
,p_message_language=>'sv'
,p_message_text=>unistr('Kolumnen %1, som refereras av fasetten %0, \00E4r inte tillg\00E4nglig eller inte auktoriserad.')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143109787092752596)
,p_name=>'APEX.FS.CONFIG_TITLE'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4lj vilka filter du vill visa')
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143236254340752634)
,p_name=>'APEX.FS.COUNT_RESULTS'
,p_message_language=>'sv'
,p_message_text=>'%0 resultat'
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143236391214752634)
,p_name=>'APEX.FS.COUNT_SELECTED'
,p_message_language=>'sv'
,p_message_text=>'%0 valda'
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143239180255752635)
,p_name=>'APEX.FS.CUR_FILTERS_LM'
,p_message_language=>'sv'
,p_message_text=>'Aktuella filter'
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143114728284752598)
,p_name=>'APEX.FS.FACETED_SEARCH_NEEDS_REGION_QUERY'
,p_message_language=>'sv'
,p_message_text=>unistr('F\00F6r fasetts\00F6kning kr\00E4vs en datak\00E4lla p\00E5 regionniv\00E5.')
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143118465577752599)
,p_name=>'APEX.FS.FACETS_LIST'
,p_message_language=>'sv'
,p_message_text=>'Filterlista'
,p_is_js_message=>true
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143297593402752652)
,p_name=>'APEX.FS.FACET_VALUE_LIMIT_EXCEEDED'
,p_message_language=>'sv'
,p_message_text=>unistr('Gr\00E4nsen f\00F6r unikt id (%0) har \00F6verskridits f\00F6r fasetten %1.')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143283894607752648)
,p_name=>'APEX.FS.FC_TYPE_UNSUPPORTED_FOR_DATE_COLUMNS'
,p_message_language=>'sv'
,p_message_text=>unistr('Fasetten %0 st\00F6ds inte f\00F6r kolumnerna DATE eller TIMESTAMP.')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143281946673752648)
,p_name=>'APEX.FS.FILTER'
,p_message_language=>'sv'
,p_message_text=>'Filtrera %0'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143156517692752610)
,p_name=>'APEX.FS.FILTER_APPLIED'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 (Till\00E4mpat filter)')
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143282097517752648)
,p_name=>'APEX.FS.GO'
,p_message_language=>'sv'
,p_message_text=>'OK'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143152087245752609)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_C'
,p_message_language=>'sv'
,p_message_text=>unistr('inneh\00E5ller %0')
,p_is_js_message=>true
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143283454609752648)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_EQ'
,p_message_language=>'sv'
,p_message_text=>'lika med %0'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143151773070752609)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_GT'
,p_message_language=>'sv'
,p_message_text=>unistr('st\00F6rre \00E4n %0')
,p_is_js_message=>true
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143151842939752609)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_GTE'
,p_message_language=>'sv'
,p_message_text=>unistr('st\00F6rre \00E4n eller lika med %0')
,p_is_js_message=>true
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143151447154752609)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_LT'
,p_message_language=>'sv'
,p_message_text=>unistr('mindre \00E4n %0')
,p_is_js_message=>true
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143151663545752609)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_LTE'
,p_message_language=>'sv'
,p_message_text=>unistr('mindre \00E4n eller lika med %0')
,p_is_js_message=>true
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143150969111752609)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NC'
,p_message_language=>'sv'
,p_message_text=>unistr('inneh\00E5ller inte %0')
,p_is_js_message=>true
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143136796717752604)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NEQ'
,p_message_language=>'sv'
,p_message_text=>unistr('\00E4r inte lika med %0')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143151075098752609)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NSTARTS'
,p_message_language=>'sv'
,p_message_text=>'inleds inte med %0'
,p_is_js_message=>true
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143151975666752609)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_STARTS'
,p_message_language=>'sv'
,p_message_text=>unistr('b\00F6rjar med %0')
,p_is_js_message=>true
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143150086951752608)
,p_name=>'APEX.FS.INPUT_FACET_SELECTOR'
,p_message_language=>'sv'
,p_message_text=>'Fasetturval'
,p_is_js_message=>true
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143125886904752601)
,p_name=>'APEX.FS.INPUT_INVALID_FILTER_PREFIX'
,p_message_language=>'sv'
,p_message_text=>unistr('Filterprefixet "%0" \00E4r ogiltigt f\00F6r fasetten "%1".')
,p_version_scn=>2705672
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143124260054752601)
,p_name=>'APEX.FS.INPUT_MISSING_FILTER_PREFIX'
,p_message_language=>'sv'
,p_message_text=>unistr('Filterprefix saknas f\00F6r fasetten "%0".')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143158491999752611)
,p_name=>'APEX.FS.INPUT_OPERATOR'
,p_message_language=>'sv'
,p_message_text=>'Operator'
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143140377049752605)
,p_name=>'APEX.FS.INPUT_OPERATOR.C'
,p_message_language=>'sv'
,p_message_text=>unistr('inneh\00E5ller')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143139365631752605)
,p_name=>'APEX.FS.INPUT_OPERATOR.EQ'
,p_message_language=>'sv'
,p_message_text=>'lika med'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143140069278752605)
,p_name=>'APEX.FS.INPUT_OPERATOR.GT'
,p_message_language=>'sv'
,p_message_text=>unistr('st\00F6rre \00E4n')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143140121314752605)
,p_name=>'APEX.FS.INPUT_OPERATOR.GTE'
,p_message_language=>'sv'
,p_message_text=>unistr('st\00F6rre \00E4n eller lika med')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143139716572752605)
,p_name=>'APEX.FS.INPUT_OPERATOR.LT'
,p_message_language=>'sv'
,p_message_text=>unistr('mindre \00E4n')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143139864873752605)
,p_name=>'APEX.FS.INPUT_OPERATOR.LTE'
,p_message_language=>'sv'
,p_message_text=>unistr('mindre \00E4n eller lika med')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143150891311752609)
,p_name=>'APEX.FS.INPUT_OPERATOR.NC'
,p_message_language=>'sv'
,p_message_text=>unistr('inneh\00E5ller inte')
,p_is_js_message=>true
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143139524759752605)
,p_name=>'APEX.FS.INPUT_OPERATOR.NEQ'
,p_message_language=>'sv'
,p_message_text=>'inte lika med'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143150795208752609)
,p_name=>'APEX.FS.INPUT_OPERATOR.NSTARTS'
,p_message_language=>'sv'
,p_message_text=>unistr('b\00F6rjar inte med')
,p_is_js_message=>true
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143140280647752605)
,p_name=>'APEX.FS.INPUT_OPERATOR.STARTS'
,p_message_language=>'sv'
,p_message_text=>unistr('b\00F6rjar med')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143158859766752611)
,p_name=>'APEX.FS.INPUT_UNSUPPORTED_DATA_TYPE'
,p_message_language=>'sv'
,p_message_text=>unistr('%0-datatypen (%1) st\00F6ds inte f\00F6r indataf\00E4ltsfasetten.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143125714566752601)
,p_name=>'APEX.FS.INPUT_UNSUPPORTED_FILTER_FOR_DATA_TYPE'
,p_message_language=>'sv'
,p_message_text=>unistr('Filtret "%0" st\00F6ds inte f\00F6r fasetten "%1" (datatyp %2).')
,p_version_scn=>2705672
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143158381088752611)
,p_name=>'APEX.FS.INPUT_VALUE'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4rde')
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143283659349752648)
,p_name=>'APEX.FS.NO_SEARCH_COLUMNS_PROVIDED'
,p_message_language=>'sv'
,p_message_text=>unistr('Inga s\00F6kkolumner har angetts f\00F6r fasetten %0')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143109815566752596)
,p_name=>'APEX.FS.OPEN_CONFIG'
,p_message_language=>'sv'
,p_message_text=>'Fler filter'
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143236462617752634)
,p_name=>'APEX.FS.RANGE_BEGIN'
,p_message_language=>'sv'
,p_message_text=>unistr('Intervallets b\00F6rjan')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143283187429752648)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL'
,p_message_language=>'sv'
,p_message_text=>'%0 till %1'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143283261228752648)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL_OPEN_HI'
,p_message_language=>'sv'
,p_message_text=>unistr('\00D6ver %0')
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143283324374752648)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL_OPEN_LO'
,p_message_language=>'sv'
,p_message_text=>'Under %0'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143236567616752634)
,p_name=>'APEX.FS.RANGE_END'
,p_message_language=>'sv'
,p_message_text=>'Intervallets slut'
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143301131345752653)
,p_name=>'APEX.FS.RANGE_LOV_ITEM_INVALID'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4rdelisteobjektet #%2 ("%1") f\00F6r intervallfasetten %0 \00E4r ogiltig (avgr\00E4nsaren "|" saknas).')
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143283540536752648)
,p_name=>'APEX.FS.RANGE_MANUAL_NOT_SUPPORTED'
,p_message_language=>'sv'
,p_message_text=>unistr('Manuell inmatning av intervallfasetten %0 st\00F6ds inte f\00F6r n\00E4rvarande eftersom kolumnen \00E4r DATE eller TIMESTAMP.')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143282860869752648)
,p_name=>'APEX.FS.RANGE_TEXT'
,p_message_language=>'sv'
,p_message_text=>'till'
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143146471585752607)
,p_name=>'APEX.FS.REMOVE_CHART'
,p_message_language=>'sv'
,p_message_text=>'Flytta bort diagram'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143232887788752633)
,p_name=>'APEX.FS.RESET'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C5terst\00E4ll')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143282261515752648)
,p_name=>'APEX.FS.SEARCH_LABEL'
,p_message_language=>'sv'
,p_message_text=>unistr('S\00F6k')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143282124149752648)
,p_name=>'APEX.FS.SEARCH_PLACEHOLDER'
,p_message_language=>'sv'
,p_message_text=>unistr('S\00F6k...')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143283080909752648)
,p_name=>'APEX.FS.SELECT_PLACEHOLDER'
,p_message_language=>'sv'
,p_message_text=>unistr('- V\00E4lj -')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143146206267752607)
,p_name=>'APEX.FS.SHOW_CHART'
,p_message_language=>'sv'
,p_message_text=>'Visa diagram'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143282659942752648)
,p_name=>'APEX.FS.SHOW_LESS'
,p_message_language=>'sv'
,p_message_text=>unistr('Visa f\00E4rre')
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143282783336752648)
,p_name=>'APEX.FS.SHOW_MORE'
,p_message_language=>'sv'
,p_message_text=>'Visa alla'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143282951144752648)
,p_name=>'APEX.FS.STAR_RATING_LABEL'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 stj\00E4rnor eller fler')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143238139666752635)
,p_name=>'APEX.FS.SUGGESTIONS'
,p_message_language=>'sv'
,p_message_text=>unistr('Filterf\00F6rslag')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143283727248752648)
,p_name=>'APEX.FS.TEXT_FIELD_ONLY_FOR_NUMBER_COLUMNS'
,p_message_language=>'sv'
,p_message_text=>unistr('Textf\00E4ltfasetten %0 st\00F6ds f\00F6r n\00E4rvarande endast f\00F6r NUMBER-kolumner.')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143109281648752596)
,p_name=>'APEX.FS.TOTAL_ROW_COUNT_LABEL'
,p_message_language=>'sv'
,p_message_text=>'Totalt antal rader'
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143299146182752653)
,p_name=>'APEX.FS.UNSUPPORTED_DATA_TYPE'
,p_message_language=>'sv'
,p_message_text=>unistr('%0-datatypen (%1) st\00F6ds inte f\00F6r fasetts\00F6kning.')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143229329487752632)
,p_name=>'APEX.FS.VISUALLY_HIDDEN_HEADING'
,p_message_language=>'sv'
,p_message_text=>'Visuellt dold rubrik'
,p_is_js_message=>true
,p_version_scn=>2705693
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143291608841752651)
,p_name=>'APEX.GO_TO_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('G\00E5 till felet')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143247657868752637)
,p_name=>'APEX.GV.AGG_CONTEXT'
,p_message_language=>'sv'
,p_message_text=>'Aggregera.'
,p_is_js_message=>true
,p_version_scn=>2705695
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143175579963752616)
,p_name=>'APEX.GV.BLANK_HEADING'
,p_message_language=>'sv'
,p_message_text=>'Tom rubrik'
,p_is_js_message=>true
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143256988979752640)
,p_name=>'APEX.GV.BREAK_COLLAPSE'
,p_message_language=>'sv'
,p_message_text=>'Komprimera kontrollstopp'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143247711974752637)
,p_name=>'APEX.GV.BREAK_CONTEXT'
,p_message_language=>'sv'
,p_message_text=>'Kontrollstopp.'
,p_is_js_message=>true
,p_version_scn=>2705695
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143256812223752640)
,p_name=>'APEX.GV.BREAK_EXPAND'
,p_message_language=>'sv'
,p_message_text=>'Expandera kontrollstopp'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143256669578752640)
,p_name=>'APEX.GV.DELETED_COUNT'
,p_message_language=>'sv'
,p_message_text=>'%0 rader har tagits bort'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143325733035752661)
,p_name=>'APEX.GV.DUP_REC_ID'
,p_message_language=>'sv'
,p_message_text=>'Dubblettidentitet'
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143118697381752599)
,p_name=>'APEX.GV.ENTER_EDIT_MODE'
,p_message_language=>'sv'
,p_message_text=>unistr('Aktiverar redigeringsl\00E4get')
,p_is_js_message=>true
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143244508216752636)
,p_name=>'APEX.GV.FIRST_PAGE'
,p_message_language=>'sv'
,p_message_text=>unistr('F\00F6rsta')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143117420618752599)
,p_name=>'APEX.GV.FLOATING_ITEM.DIALOG.HIDE_DIALOG'
,p_message_language=>'sv'
,p_message_text=>unistr('D\00F6lj dialogruta')
,p_is_js_message=>true
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143116467817752598)
,p_name=>'APEX.GV.FLOATING_ITEM.DIALOG.TITLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Cellinneh\00E5ll med flytande spill')
,p_is_js_message=>true
,p_version_scn=>2705670
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143117741698752599)
,p_name=>'APEX.GV.FLOATING_ITEM.SHOW_DIALOG'
,p_message_language=>'sv'
,p_message_text=>unistr('Visa spillinneh\00E5ll')
,p_is_js_message=>true
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143191922406752621)
,p_name=>'APEX.GV.FOOTER_LANDMARK'
,p_message_language=>'sv'
,p_message_text=>unistr('Sidfot f\00F6r rutn\00E4t')
,p_is_js_message=>true
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143247925126752637)
,p_name=>'APEX.GV.GROUP_CONTEXT'
,p_message_language=>'sv'
,p_message_text=>'Grupprubrik'
,p_is_js_message=>true
,p_version_scn=>2705695
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143247811650752637)
,p_name=>'APEX.GV.HEADER_CONTEXT'
,p_message_language=>'sv'
,p_message_text=>'Rubrik.'
,p_is_js_message=>true
,p_version_scn=>2705695
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143244600070752636)
,p_name=>'APEX.GV.LAST_PAGE'
,p_message_language=>'sv'
,p_message_text=>'Sista'
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143118853197752599)
,p_name=>'APEX.GV.LEAVE_EDIT_MODE'
,p_message_language=>'sv'
,p_message_text=>unistr('Avslutar redigeringsl\00E4get')
,p_is_js_message=>true
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143143596554752606)
,p_name=>'APEX.GV.LOAD_ALL'
,p_message_language=>'sv'
,p_message_text=>'Ladda alla'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143266433030752643)
,p_name=>'APEX.GV.LOAD_MORE'
,p_message_language=>'sv'
,p_message_text=>'Visa fler'
,p_is_js_message=>true
,p_version_scn=>2705700
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143244367935752636)
,p_name=>'APEX.GV.NEXT_PAGE'
,p_message_language=>'sv'
,p_message_text=>unistr('N\00E4sta')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143248058831752638)
,p_name=>'APEX.GV.PAGE_RANGE'
,p_message_language=>'sv'
,p_message_text=>'Sidrader'
,p_is_js_message=>true
,p_version_scn=>2705695
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143157177665752610)
,p_name=>'APEX.GV.PAGE_RANGE_ENTITY'
,p_message_language=>'sv'
,p_message_text=>'Sidan %0'
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143244751186752636)
,p_name=>'APEX.GV.PAGE_RANGE_XY'
,p_message_language=>'sv'
,p_message_text=>'%0 - %1'
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143244872631752636)
,p_name=>'APEX.GV.PAGE_RANGE_XYZ'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 \2013 %1 av %2')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143301724525752653)
,p_name=>'APEX.GV.PAGE_SELECTION'
,p_message_language=>'sv'
,p_message_text=>'Val av sida'
,p_is_js_message=>true
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143192213731752621)
,p_name=>'APEX.GV.PAGINATION_LANDMARK'
,p_message_language=>'sv'
,p_message_text=>'Sidindelning'
,p_is_js_message=>true
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143244479547752636)
,p_name=>'APEX.GV.PREV_PAGE'
,p_message_language=>'sv'
,p_message_text=>unistr('F\00F6reg\00E5ende')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143142441270752606)
,p_name=>'APEX.GV.RANGE_DISPLAY'
,p_message_language=>'sv'
,p_message_text=>'Visa intervall'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143175864999752616)
,p_name=>'APEX.GV.ROWS_SELECTION'
,p_message_language=>'sv'
,p_message_text=>'Radval'
,p_is_js_message=>true
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143325508680752661)
,p_name=>'APEX.GV.ROW_ADDED'
,p_message_language=>'sv'
,p_message_text=>'Tillagd'
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143325671342752661)
,p_name=>'APEX.GV.ROW_CHANGED'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C4ndrad')
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143333953279752663)
,p_name=>'APEX.GV.ROW_COLUMN_CONTEXT'
,p_message_language=>'sv'
,p_message_text=>unistr('Radnummer f\00F6r rutn\00E4t %0. Kolumn %1.')
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143334036210752663)
,p_name=>'APEX.GV.ROW_CONTEXT'
,p_message_language=>'sv'
,p_message_text=>unistr('Radnummer f\00F6r rutn\00E4t %0.')
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143325460235752661)
,p_name=>'APEX.GV.ROW_DELETED'
,p_message_language=>'sv'
,p_message_text=>'Borttagen'
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143248286886752638)
,p_name=>'APEX.GV.ROW_HEADER'
,p_message_language=>'sv'
,p_message_text=>'Radrubrik'
,p_is_js_message=>true
,p_version_scn=>2705695
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143175782209752616)
,p_name=>'APEX.GV.ROW_SELECTION'
,p_message_language=>'sv'
,p_message_text=>'Radval'
,p_is_js_message=>true
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143143663430752606)
,p_name=>'APEX.GV.SELECTED_ENTITY_COUNT'
,p_message_language=>'sv'
,p_message_text=>'%0 %1 valda'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143243715242752636)
,p_name=>'APEX.GV.SELECTION_CELL_COUNT'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 celler \00E4r valda')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143244957977752637)
,p_name=>'APEX.GV.SELECTION_COUNT'
,p_message_language=>'sv'
,p_message_text=>'%0 rader har valts'
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143287086672752649)
,p_name=>'APEX.GV.SELECT_ALL'
,p_message_language=>'sv'
,p_message_text=>'Markera alla'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143180534139752617)
,p_name=>'APEX.GV.SELECT_ALL_ROWS'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4lj alla rader')
,p_is_js_message=>true
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143256789772752640)
,p_name=>'APEX.GV.SELECT_PAGE_N'
,p_message_language=>'sv'
,p_message_text=>'Sidan %0'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143248101101752638)
,p_name=>'APEX.GV.SELECT_ROW'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4lj rad')
,p_is_js_message=>true
,p_version_scn=>2705695
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143248440923752638)
,p_name=>'APEX.GV.SORTED_ASCENDING'
,p_message_language=>'sv'
,p_message_text=>'Sorterad stigande %0'
,p_is_js_message=>true
,p_version_scn=>2705695
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143248519477752638)
,p_name=>'APEX.GV.SORTED_DESCENDING'
,p_message_language=>'sv'
,p_message_text=>'Sorterad fallande %0'
,p_is_js_message=>true
,p_version_scn=>2705695
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143243831933752636)
,p_name=>'APEX.GV.SORT_ASCENDING'
,p_message_language=>'sv'
,p_message_text=>'Sortera i stigande ordning'
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143244165731752636)
,p_name=>'APEX.GV.SORT_ASCENDING_ORDER'
,p_message_language=>'sv'
,p_message_text=>'Sortera stigande %0'
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143243924450752636)
,p_name=>'APEX.GV.SORT_DESCENDING'
,p_message_language=>'sv'
,p_message_text=>'Sortera i fallande ordning'
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143244269057752636)
,p_name=>'APEX.GV.SORT_DESCENDING_ORDER'
,p_message_language=>'sv'
,p_message_text=>'Sortera fallande %0'
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143244092621752636)
,p_name=>'APEX.GV.SORT_OFF'
,p_message_language=>'sv'
,p_message_text=>'Sortera inte'
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143109666674752596)
,p_name=>'APEX.GV.SORT_OPTIONS'
,p_message_language=>'sv'
,p_message_text=>'Sorteringsalternativ'
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143192065270752621)
,p_name=>'APEX.GV.STATE_ICONS_LANDMARK'
,p_message_language=>'sv'
,p_message_text=>'Statusikoner'
,p_is_js_message=>true
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143192106899752621)
,p_name=>'APEX.GV.STATUS_LANDMARK'
,p_message_language=>'sv'
,p_message_text=>unistr('Status f\00F6r rutn\00E4t')
,p_is_js_message=>true
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143121968230752600)
,p_name=>'APEX.GV.TOTAL_ENTITY_PLURAL'
,p_message_language=>'sv'
,p_message_text=>'%0 %1'
,p_is_js_message=>true
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143121664290752600)
,p_name=>'APEX.GV.TOTAL_ENTITY_SINGULAR'
,p_message_language=>'sv'
,p_message_text=>'1 %0'
,p_is_js_message=>true
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143256537742752640)
,p_name=>'APEX.GV.TOTAL_PAGES'
,p_message_language=>'sv'
,p_message_text=>'Totalsumma %0'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143175368534752616)
,p_name=>'APEX.HTTP.REQUEST_FAILED'
,p_message_language=>'sv'
,p_message_text=>unistr('HTTP-beg\00E4ran till "%0" utf\00F6rdes inte.')
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143176953662752616)
,p_name=>'APEX.ICON_LIST.COLUMN'
,p_message_language=>'sv'
,p_message_text=>'Kolumn %0'
,p_is_js_message=>true
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143177181602752616)
,p_name=>'APEX.ICON_LIST.COLUMN_AND_ROW'
,p_message_language=>'sv'
,p_message_text=>'Kolumn %0 och rad %1'
,p_is_js_message=>true
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143177441038752616)
,p_name=>'APEX.ICON_LIST.FIRST_COLUMN'
,p_message_language=>'sv'
,p_message_text=>unistr('Redan i f\00F6rsta kolumnen. Kolumn %0 och rad %1')
,p_is_js_message=>true
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143177312914752616)
,p_name=>'APEX.ICON_LIST.FIRST_ROW'
,p_message_language=>'sv'
,p_message_text=>unistr('Redan p\00E5 f\00F6rsta raden. Kolumn %0 och rad %1')
,p_is_js_message=>true
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143322962974752660)
,p_name=>'APEX.ICON_LIST.GRID_DIM'
,p_message_language=>'sv'
,p_message_text=>'Presenteras i %0 kolumner och %1 rader'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143177534718752617)
,p_name=>'APEX.ICON_LIST.LAST_COLUMN'
,p_message_language=>'sv'
,p_message_text=>'Redan i sista kolumnen. Kolumn %0 och rad %1'
,p_is_js_message=>true
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143177244051752616)
,p_name=>'APEX.ICON_LIST.LAST_ROW'
,p_message_language=>'sv'
,p_message_text=>unistr('Redan p\00E5 sista raden. Kolumn %0 och rad %1')
,p_is_js_message=>true
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143256403042752640)
,p_name=>'APEX.ICON_LIST.LIST_DIM'
,p_message_language=>'sv'
,p_message_text=>'Presenteras i %0 rader'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143177081232752616)
,p_name=>'APEX.ICON_LIST.ROW'
,p_message_language=>'sv'
,p_message_text=>'Rad %0'
,p_is_js_message=>true
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143333756598752663)
,p_name=>'APEX.IG.ACC_LABEL'
,p_message_language=>'sv'
,p_message_text=>unistr('Interaktivt rutn\00E4t %0')
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143240828396752635)
,p_name=>'APEX.IG.ACTIONS'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C5tg\00E4rder')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143241871118752636)
,p_name=>'APEX.IG.ADD'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00E4gg till')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143241709322752636)
,p_name=>'APEX.IG.ADD_ROW'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00E4gg till rad')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143327346411752661)
,p_name=>'APEX.IG.AGGREGATE'
,p_message_language=>'sv'
,p_message_text=>'Aggregera'
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143312913945752657)
,p_name=>'APEX.IG.AGGREGATION'
,p_message_language=>'sv'
,p_message_text=>'Aggregering'
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143314638462752657)
,p_name=>'APEX.IG.ALL'
,p_message_language=>'sv'
,p_message_text=>'Alla'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143272280930752645)
,p_name=>'APEX.IG.ALL_TEXT_COLUMNS'
,p_message_language=>'sv'
,p_message_text=>'Alla textkolumner'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143273453610752645)
,p_name=>'APEX.IG.ALTERNATIVE'
,p_message_language=>'sv'
,p_message_text=>'Alternativ'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143274597791752645)
,p_name=>'APEX.IG.AND'
,p_message_language=>'sv'
,p_message_text=>'och'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143293987788752651)
,p_name=>'APEX.IG.APPROX_COUNT_DISTINCT'
,p_message_language=>'sv'
,p_message_text=>unistr('Ungef\00E4rligt antal unika')
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143328338731752662)
,p_name=>'APEX.IG.APPROX_COUNT_DISTINCT_OVERALL'
,p_message_language=>'sv'
,p_message_text=>unistr('Ungef\00E4rligt totalt antal unika')
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143311546214752657)
,p_name=>'APEX.IG.AREA'
,p_message_language=>'sv'
,p_message_text=>'Area'
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143313485117752657)
,p_name=>'APEX.IG.ASCENDING'
,p_message_language=>'sv'
,p_message_text=>'Stigande'
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143273575880752645)
,p_name=>'APEX.IG.AUTHORIZATION'
,p_message_language=>'sv'
,p_message_text=>unistr('Beh\00F6righet')
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143327447905752661)
,p_name=>'APEX.IG.AUTO'
,p_message_language=>'sv'
,p_message_text=>'Automatiskt'
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143294371556752651)
,p_name=>'APEX.IG.AVG'
,p_message_language=>'sv'
,p_message_text=>'Genomsnitt'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143328044111752661)
,p_name=>'APEX.IG.AVG_OVERALL'
,p_message_language=>'sv'
,p_message_text=>unistr('\00D6vergripande genomsnitt')
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143311061424752656)
,p_name=>'APEX.IG.AXIS_LABEL_TITLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Etikett f\00F6r axelrubrik')
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143311282354752656)
,p_name=>'APEX.IG.AXIS_VALUE_DECIMAL'
,p_message_language=>'sv'
,p_message_text=>'Antal decimaler'
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143311117003752656)
,p_name=>'APEX.IG.AXIS_VALUE_TITLE'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4rde f\00F6r axelrubrik')
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143317259202752658)
,p_name=>'APEX.IG.BACKGROUND_COLOR'
,p_message_language=>'sv'
,p_message_text=>unistr('Bakgrundsf\00E4rg')
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143311699758752657)
,p_name=>'APEX.IG.BAR'
,p_message_language=>'sv'
,p_message_text=>'Stapel'
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143268882277752644)
,p_name=>'APEX.IG.BETWEEN'
,p_message_language=>'sv'
,p_message_text=>'mellan'
,p_is_js_message=>true
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143318452436752659)
,p_name=>'APEX.IG.BOTH'
,p_message_language=>'sv'
,p_message_text=>unistr('B\00E5da')
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143311797489752657)
,p_name=>'APEX.IG.BUBBLE'
,p_message_language=>'sv'
,p_message_text=>'Bubbla'
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143242027515752636)
,p_name=>'APEX.IG.CANCEL'
,p_message_language=>'sv'
,p_message_text=>'Avbryt'
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143274470249752645)
,p_name=>'APEX.IG.CASE_SENSITIVE'
,p_message_language=>'sv'
,p_message_text=>unistr('Skiftl\00E4gesk\00E4nslig')
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143328911292752662)
,p_name=>'APEX.IG.CASE_SENSITIVE_WITH_BRACKETS'
,p_message_language=>'sv'
,p_message_text=>unistr('(Skiftl\00E4gesk\00E4nslig)')
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143300299048752653)
,p_name=>'APEX.IG.CHANGES_SAVED'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C4ndringarna har sparats')
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143242479993752636)
,p_name=>'APEX.IG.CHANGE_VIEW'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C4ndra vy')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143275596519752646)
,p_name=>'APEX.IG.CHART'
,p_message_language=>'sv'
,p_message_text=>'Diagram'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143272088498752645)
,p_name=>'APEX.IG.CHART_MAX_DATAPOINT_CNT'
,p_message_language=>'sv'
,p_message_text=>unistr('Din fr\00E5ga \00F6verskrider det maximala antalet p\00E5 %0 datapunkter per diagram. Till\00E4mpa ett filter f\00F6r att minska antalet poster i din basfr\00E5ga.')
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143240750304752635)
,p_name=>'APEX.IG.CHART_VIEW'
,p_message_language=>'sv'
,p_message_text=>'Diagramvy'
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143249146496752638)
,p_name=>'APEX.IG.CLEAR'
,p_message_language=>'sv'
,p_message_text=>'Rensa'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143310584028752656)
,p_name=>'APEX.IG.CLOSE_COLUMN'
,p_message_language=>'sv'
,p_message_text=>unistr('St\00E4ng')
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143317474868752658)
,p_name=>'APEX.IG.COLORS'
,p_message_language=>'sv'
,p_message_text=>unistr('F\00E4rger')
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143294718082752651)
,p_name=>'APEX.IG.COLOR_PREVIEW'
,p_message_language=>'sv'
,p_message_text=>unistr('F\00F6rhandsgranska')
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143273828811752645)
,p_name=>'APEX.IG.COLUMN'
,p_message_language=>'sv'
,p_message_text=>'Kolumn'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143240954971752635)
,p_name=>'APEX.IG.COLUMNS'
,p_message_language=>'sv'
,p_message_text=>'Kolumner'
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143202891345752624)
,p_name=>'APEX.IG.COLUMN_HEADER_ACTIONS'
,p_message_language=>'sv'
,p_message_text=>unistr('Kolumn\00E5tg\00E4rder')
,p_is_js_message=>true
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143202640615752624)
,p_name=>'APEX.IG.COLUMN_HEADER_ACTIONS_FOR'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C5tg\00E4rder f\00F6r kolumnen "%0"')
,p_is_js_message=>true
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143319264908752659)
,p_name=>'APEX.IG.COLUMN_TYPE'
,p_message_language=>'sv'
,p_message_text=>'Kolumnsyfte'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143273949527752645)
,p_name=>'APEX.IG.COMPLEX'
,p_message_language=>'sv'
,p_message_text=>'Komplex'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143241139153752635)
,p_name=>'APEX.IG.COMPUTE'
,p_message_language=>'sv'
,p_message_text=>unistr('Ber\00E4kna')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143269465241752644)
,p_name=>'APEX.IG.CONTAINS'
,p_message_language=>'sv'
,p_message_text=>unistr('inneh\00E5ller')
,p_is_js_message=>true
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143275701822752646)
,p_name=>'APEX.IG.CONTROL_BREAK'
,p_message_language=>'sv'
,p_message_text=>'Kontrollstopp'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143248901657752638)
,p_name=>'APEX.IG.COPY_CB'
,p_message_language=>'sv'
,p_message_text=>'Kopiera till Urklipp'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143249072268752638)
,p_name=>'APEX.IG.COPY_DOWN'
,p_message_language=>'sv'
,p_message_text=>'Kopiera ned'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143293786230752651)
,p_name=>'APEX.IG.COUNT'
,p_message_language=>'sv'
,p_message_text=>'Antal'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143293872605752651)
,p_name=>'APEX.IG.COUNT_DISTINCT'
,p_message_language=>'sv'
,p_message_text=>'Antal unika'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143328286378752662)
,p_name=>'APEX.IG.COUNT_DISTINCT_OVERALL'
,p_message_language=>'sv'
,p_message_text=>'Totalt antal unika'
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143328104260752661)
,p_name=>'APEX.IG.COUNT_OVERALL'
,p_message_language=>'sv'
,p_message_text=>'Totalt antal'
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143325840577752661)
,p_name=>'APEX.IG.CREATE_X'
,p_message_language=>'sv'
,p_message_text=>'Skapa %0'
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143272470156752645)
,p_name=>'APEX.IG.DATA'
,p_message_language=>'sv'
,p_message_text=>'Data'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143319063071752659)
,p_name=>'APEX.IG.DATA_TYPE'
,p_message_language=>'sv'
,p_message_text=>'Datatyp'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143318629277752659)
,p_name=>'APEX.IG.DATE'
,p_message_language=>'sv'
,p_message_text=>'Datum'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143300095029752653)
,p_name=>'APEX.IG.DATE_INVALID_VALUE'
,p_message_language=>'sv'
,p_message_text=>unistr('Ogiltigt datumv\00E4rde')
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143270149093752644)
,p_name=>'APEX.IG.DAYS'
,p_message_language=>'sv'
,p_message_text=>'dagar'
,p_is_js_message=>true
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143273192000752645)
,p_name=>'APEX.IG.DEFAULT_SETTINGS'
,p_message_language=>'sv'
,p_message_text=>unistr('Standardinst\00E4llningar')
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143272904553752645)
,p_name=>'APEX.IG.DEFAULT_TYPE'
,p_message_language=>'sv'
,p_message_text=>'Standardtyp'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143241916373752636)
,p_name=>'APEX.IG.DELETE'
,p_message_language=>'sv'
,p_message_text=>'Ta bort'
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143320134293752659)
,p_name=>'APEX.IG.DELETE_REPORT_CONFIRM'
,p_message_language=>'sv'
,p_message_text=>unistr('Vill du verkligen ta bort den h\00E4r rapporten?')
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143277506559752646)
,p_name=>'APEX.IG.DELETE_ROW'
,p_message_language=>'sv'
,p_message_text=>'Ta bort rad'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143276314727752646)
,p_name=>'APEX.IG.DELETE_ROWS'
,p_message_language=>'sv'
,p_message_text=>'Ta bort rader'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143313544338752657)
,p_name=>'APEX.IG.DESCENDING'
,p_message_language=>'sv'
,p_message_text=>'Fallande'
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143275207677752646)
,p_name=>'APEX.IG.DETAIL'
,p_message_language=>'sv'
,p_message_text=>'Detalj'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143240494647752635)
,p_name=>'APEX.IG.DETAIL_VIEW'
,p_message_language=>'sv'
,p_message_text=>'Detaljvy'
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143302515141752654)
,p_name=>'APEX.IG.DIRECTION'
,p_message_language=>'sv'
,p_message_text=>'Riktning'
,p_is_js_message=>true
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143274922441752646)
,p_name=>'APEX.IG.DISABLED'
,p_message_language=>'sv'
,p_message_text=>'Inaktiv'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143269530628752644)
,p_name=>'APEX.IG.DOES_NOT_CONTAIN'
,p_message_language=>'sv'
,p_message_text=>unistr('inneh\00E5ller inte')
,p_is_js_message=>true
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143269775430752644)
,p_name=>'APEX.IG.DOES_NOT_START_WITH'
,p_message_language=>'sv'
,p_message_text=>unistr('b\00F6rjar inte med')
,p_is_js_message=>true
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143311836376752657)
,p_name=>'APEX.IG.DONUT'
,p_message_language=>'sv'
,p_message_text=>'Ring'
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143275941175752646)
,p_name=>'APEX.IG.DOWNLOAD'
,p_message_language=>'sv'
,p_message_text=>'Ladda ned'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143166238309752613)
,p_name=>'APEX.IG.DOWNLOAD_DATA_ONLY'
,p_message_language=>'sv'
,p_message_text=>'Endast data'
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143321123465752659)
,p_name=>'APEX.IG.DOWNLOAD_FORMAT'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4lj format')
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143181335717752618)
,p_name=>'APEX.IG.DOWNLOAD_FORMAT_NOT_ENABLED'
,p_message_language=>'sv'
,p_message_text=>unistr('Nedladdningsformatet %0 \00E4r inte aktiverat.')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143314277056752657)
,p_name=>'APEX.IG.DUPLICATE_AGGREGATION'
,p_message_language=>'sv'
,p_message_text=>'Dubblettaggregering'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143314330186752657)
,p_name=>'APEX.IG.DUPLICATE_CONTROLBREAK'
,p_message_language=>'sv'
,p_message_text=>'Dubblettkontrollstopp'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143277461129752646)
,p_name=>'APEX.IG.DUPLICATE_ROW'
,p_message_language=>'sv'
,p_message_text=>'Duplicera rad'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143276208013752646)
,p_name=>'APEX.IG.DUPLICATE_ROWS'
,p_message_language=>'sv'
,p_message_text=>'Duplicerade rader'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143241555253752636)
,p_name=>'APEX.IG.EDIT'
,p_message_language=>'sv'
,p_message_text=>'Redigera'
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143313341888752657)
,p_name=>'APEX.IG.EDIT_CHART'
,p_message_language=>'sv'
,p_message_text=>'Redigera diagram'
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143193850123752621)
,p_name=>'APEX.IG.EDIT_CONTROL'
,p_message_language=>'sv'
,p_message_text=>'Redigera %0'
,p_is_js_message=>true
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143324774260752660)
,p_name=>'APEX.IG.EDIT_GROUP_BY'
,p_message_language=>'sv'
,p_message_text=>'Redigera grupp per'
,p_is_js_message=>true
,p_version_scn=>2705709
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143231954244752633)
,p_name=>'APEX.IG.EDIT_MODE'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 \00E4r i redigeringsl\00E4get')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143207517576752625)
,p_name=>'APEX.IG.EDIT_MODE_DESCRIPTION'
,p_message_language=>'sv'
,p_message_text=>unistr('Rutn\00E4tet \00E4r i redigeringsl\00E4get, tryck igen f\00F6r att v\00E4xla till vyl\00E4get')
,p_is_js_message=>true
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143320767320752659)
,p_name=>'APEX.IG.EMAIL_BCC'
,p_message_language=>'sv'
,p_message_text=>'Hemlig kopia (bcc)'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143320995516752659)
,p_name=>'APEX.IG.EMAIL_BODY'
,p_message_language=>'sv'
,p_message_text=>'Meddelande'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143320674626752659)
,p_name=>'APEX.IG.EMAIL_CC'
,p_message_language=>'sv'
,p_message_text=>'Kopia (cc)'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143320398862752659)
,p_name=>'APEX.IG.EMAIL_SENT'
,p_message_language=>'sv'
,p_message_text=>'E-postmeddelande har skickats.'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143320887667752659)
,p_name=>'APEX.IG.EMAIL_SUBJECT'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C4mne')
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143320565311752659)
,p_name=>'APEX.IG.EMAIL_TO'
,p_message_language=>'sv'
,p_message_text=>'Mottagare (till)'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143274600439752645)
,p_name=>'APEX.IG.ENABLED'
,p_message_language=>'sv'
,p_message_text=>'Aktiv'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143267858406752643)
,p_name=>'APEX.IG.EQUALS'
,p_message_language=>'sv'
,p_message_text=>'lika med'
,p_is_js_message=>true
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143274790230752646)
,p_name=>'APEX.IG.EXPRESSION'
,p_message_language=>'sv'
,p_message_text=>'Uttryck'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143319751778752659)
,p_name=>'APEX.IG.FD_TYPE'
,p_message_language=>'sv'
,p_message_text=>'Typ'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143286982482752649)
,p_name=>'APEX.IG.FILE_PREPARED'
,p_message_language=>'sv'
,p_message_text=>unistr('Fil f\00F6rberedd. Startar nedladdning.')
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143249231426752638)
,p_name=>'APEX.IG.FILL'
,p_message_language=>'sv'
,p_message_text=>'Fyll'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143251418349752639)
,p_name=>'APEX.IG.FILL_LABEL'
,p_message_language=>'sv'
,p_message_text=>'Fyll urval med'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143251398937752639)
,p_name=>'APEX.IG.FILL_TITLE'
,p_message_language=>'sv'
,p_message_text=>'Fyll urval'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143241040910752635)
,p_name=>'APEX.IG.FILTER'
,p_message_language=>'sv'
,p_message_text=>'Filtrera'
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143274095232752645)
,p_name=>'APEX.IG.FILTERS'
,p_message_language=>'sv'
,p_message_text=>'Filter'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143327719077752661)
,p_name=>'APEX.IG.FILTER_WITH_DOTS'
,p_message_language=>'sv'
,p_message_text=>'Filtrera...'
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143313732822752657)
,p_name=>'APEX.IG.FIRST'
,p_message_language=>'sv'
,p_message_text=>unistr('F\00F6rsta')
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143241244094752635)
,p_name=>'APEX.IG.FLASHBACK'
,p_message_language=>'sv'
,p_message_text=>'Flashback'
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143272563551752645)
,p_name=>'APEX.IG.FORMAT'
,p_message_language=>'sv'
,p_message_text=>'Format'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143318380435752659)
,p_name=>'APEX.IG.FORMATMASK'
,p_message_language=>'sv'
,p_message_text=>'Formatmask'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143320026526752659)
,p_name=>'APEX.IG.FORMAT_CSV'
,p_message_language=>'sv'
,p_message_text=>'CSV'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143319951475752659)
,p_name=>'APEX.IG.FORMAT_HTML'
,p_message_language=>'sv'
,p_message_text=>'HTML'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143231069738752632)
,p_name=>'APEX.IG.FORMAT_PDF'
,p_message_language=>'sv'
,p_message_text=>'PDF'
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143164996895752613)
,p_name=>'APEX.IG.FORMAT_XLSX'
,p_message_language=>'sv'
,p_message_text=>'Excel'
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143277120284752646)
,p_name=>'APEX.IG.FREEZE'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00E5s')
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143274815130752646)
,p_name=>'APEX.IG.FUNCTIONS_AND_OPERATORS'
,p_message_language=>'sv'
,p_message_text=>'Funktioner och operatorer'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143311960654752657)
,p_name=>'APEX.IG.FUNNEL'
,p_message_language=>'sv'
,p_message_text=>'Tratt'
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143293655724752651)
,p_name=>'APEX.IG.GO'
,p_message_language=>'sv'
,p_message_text=>'OK'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143268444105752644)
,p_name=>'APEX.IG.GREATER_THAN'
,p_message_language=>'sv'
,p_message_text=>unistr('st\00F6rre \00E4n')
,p_is_js_message=>true
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143268578146752644)
,p_name=>'APEX.IG.GREATER_THAN_OR_EQUALS'
,p_message_language=>'sv'
,p_message_text=>unistr('st\00F6rre \00E4n eller lika med')
,p_is_js_message=>true
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143275178759752646)
,p_name=>'APEX.IG.GRID'
,p_message_language=>'sv'
,p_message_text=>unistr('Rutn\00E4t')
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143240208686752635)
,p_name=>'APEX.IG.GRID_VIEW'
,p_message_language=>'sv'
,p_message_text=>unistr('Rutn\00E4tsvy')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143314566379752657)
,p_name=>'APEX.IG.GROUP'
,p_message_language=>'sv'
,p_message_text=>'Grupp'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143275335372752646)
,p_name=>'APEX.IG.GROUP_BY'
,p_message_language=>'sv'
,p_message_text=>'Gruppera per'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143240565566752635)
,p_name=>'APEX.IG.GROUP_BY_VIEW'
,p_message_language=>'sv'
,p_message_text=>'Gruppera per-vy'
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143318978499752659)
,p_name=>'APEX.IG.HD_TYPE'
,p_message_language=>'sv'
,p_message_text=>'Villkorstyp'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143317861087752658)
,p_name=>'APEX.IG.HEADING'
,p_message_language=>'sv'
,p_message_text=>'Rubrik'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143318014250752658)
,p_name=>'APEX.IG.HEADING_ALIGN'
,p_message_language=>'sv'
,p_message_text=>'Rubrikjustering'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143327614561752661)
,p_name=>'APEX.IG.HELP'
,p_message_language=>'sv'
,p_message_text=>unistr('Hj\00E4lp')
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143323131648752660)
,p_name=>'APEX.IG.HELP.ACTIONS.EDITING'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Du kan infoga, uppdatera och ta bort data direkt i det interaktiva rutn\00E4tet.</p>'),
'',
unistr('<p>Infoga en ny rad genom att klicka p\00E5 knappen L\00E4gg till rad.</p>'),
'',
unistr('<p>Redigera befintliga data genom att dubbelklicka p\00E5 en cell. F\00F6r mer omfattande redigering klickar du p\00E5 Redigera f\00F6r att starta redigeringsl\00E4get. I redigeringsl\00E4get kan du redigera best\00E4mda celler genom att klicka en g\00E5ng eller anv\00E4nda tangentbord')
||'et.</p>',
'',
unistr('<p>Anv\00E4nd menyn \00C4ndra till att duplicera och ta bort rader. Du aktiverar menyn \00C4ndra genom att markera en eller flera rader med hj\00E4lp av kryssrutorna.</p>'),
'',
unistr('<p>Duplicera en vald rad genom att klicka p\00E5 menyn \00C4ndra och v\00E4lja Duplicera rader. Ta bort en rad genom att klicka p\00E5 menyn \00C4ndra och v\00E4lja Ta bort rad.</p>')))
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143325229374752661)
,p_name=>'APEX.IG.HELP.ACTIONS.EDITING_HEADING'
,p_message_language=>'sv'
,p_message_text=>'Redigeringsfunktioner'
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143325341823752661)
,p_name=>'APEX.IG.HELP.ACTIONS.INTRO'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>I ett interaktivt rutn\00E4t visas en upps\00E4ttning data i en anpassningsbar rapport som det g\00E5r att s\00F6ka i. Du kan utf\00F6ra ett flertal \00E5tg\00E4rder f\00F6r att begr\00E4nsa vilka poster som returneras och du kan \00E4ndra hur data visas.</p>'),
'',
unistr('<p>Med s\00F6kf\00E4ltet kan du filtrera de poster som returneras. Klicka p\00E5 \00C5tg\00E4rder f\00F6r att komma \00E5t ett flertal alternativ f\00F6r anpassning av rapportens layout och anv\00E4nd kolumnrubriksmenyerna p\00E5 de kolumner som visas.</p>'),
'',
unistr('<p>Anv\00E4nd rapportinst\00E4llningarna om du vill spara dina anpassningar av en rapport. Du kan ocks\00E5 ladda ned data fr\00E5n rapporten till en extern fil eller skicka dem via e-post till dig sj\00E4lv och andra.</p>'),
'',
unistr('<p>Mer information finns i "Anv\00E4nda interaktiva rutn\00E4t" i <em>Oracle APEX End User''s Guide</em>.')))
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143325042280752661)
,p_name=>'APEX.IG.HELP.ACTIONS.INTRO_HEADING'
,p_message_language=>'sv'
,p_message_text=>unistr('\00D6versikt')
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143323033598752660)
,p_name=>'APEX.IG.HELP.ACTIONS.REPORTING'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Du kan anpassa det interaktiva rutn\00E4tet f\00F6r att visa data p\00E5 ett flertal olika s\00E4tt med de inbyggda funktionerna.</p>'),
'',
unistr('<p>Anv\00E4nd kolumnrubrikmenyerna eller menyn \00C5tg\00E4rder f\00F6r att best\00E4mma vilka kolumner som ska visas, i vilken ordning de ska visas och f\00F6r att frysa kolumner. Du kan ocks\00E5 definiera olika datafilter och sortera de data som returneras.</p>'),
'',
unistr('<p>Anv\00E4nd knappen Visa (bredvid s\00F6kf\00E4ltet) till att komma \00E5t andra datavyer som kan ha definierats av applikationsutvecklaren. Du kan \00E4ven skapa ett diagram eller visa ett befintligt diagram.</p>  '),
'',
unistr('<p><em>Obs! Klicka p\00E5 <strong>Hj\00E4lp</strong> i dialogrutorna f\00F6r det interaktiva rutn\00E4tet om du vill ha mer ing\00E5ende information om den valda funktionen.</em></p>')))
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143325191963752661)
,p_name=>'APEX.IG.HELP.ACTIONS.REPORTING_HEADING'
,p_message_language=>'sv'
,p_message_text=>'Rapporteringsfunktioner'
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143276173510752646)
,p_name=>'APEX.IG.HELP.ACTIONS_TITLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Hj\00E4lp f\00F6r interaktivt rutn\00E4t')
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143321969879752660)
,p_name=>'APEX.IG.HELP.AGGREGATE'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>I den h\00E4r dialogrutan kan du aggregera kolumner. Aggregerade v\00E4rden visas i slutet av alla data eller, om kontrollstopp har definierats, i slutet av varje stopp.</p>'),
'',
'<p><strong>Aggregeringslista</strong><br>',
'I aggregeringslistan visas definierade aggregeringar. Avaktivera en befintlig aggregering genom att avmarkera den.<br>',
unistr('Klicka p\00E5 L\00E4gg till ( &plus; ) f\00F6r att skapa en ny aggregering och p\00E5 ta bort ( &minus; ) f\00F6r att ta bort en befintlig aggregering.</p>'),
'',
unistr('<p><strong>Aggregeringsinst\00E4llningar</strong><br>'),
unistr('Anv\00E4nd formul\00E4ret till h\00F6ger till att definiera aggregeringen.<br>'),
unistr('V\00E4lj kolumnnamn och aggregeringstyp.<br>'),
unistr('Du kan \00E4ven ange en knappbeskrivning f\00F6r aggregeringen.<br>'),
unistr('Om du har definierat ett kontrollstopp kan du v\00E4lja <strong>Visa totalv\00E4rde</strong> s\00E5 visas totalt genomsnitt, totalsumma eller liknande v\00E4rde i slutet av alla data.</p>'),
'',
unistr('<p><em>Obs! \00D6ppna dialogrutan Aggregering via menyn \00C5tg\00E4rder eller genom att klicka p\00E5 kolumnrubriken och summan ( &sum; ).</em></p>')))
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143324150194752660)
,p_name=>'APEX.IG.HELP.AGGREGATE_TITLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Hj\00E4lp f\00F6r aggregering')
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143322649135752660)
,p_name=>'APEX.IG.HELP.CHART'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>I den h\00E4r dialogrutan kan du definiera ett diagram som visas som en separat datavy.<br>'),
unistr('V\00E4lj en diagramtyp och ett diagramattribut.</p>'),
'<p><strong>Diagramattribut</strong><br>',
unistr('De tillg\00E4ngliga diagramattributen varierar beroende p\00E5 diagramtyp.</p>'),
'<p>',
'<ul>',
unistr('  <li>V\00E4lj kolumnen som inneh\00E5ller v\00E4rdet f\00F6r attributet:'),
'    <ul>',
unistr('      <li>Etikett - texten f\00F6r alla datapunkter.</li>'),
unistr('      <li>V\00E4rde - data som ska plottas.</li>'),
unistr('      <li>Serier - anv\00E4nds till att definiera dynamiska fr\00E5gor med flera serier.</li>'),
unistr('      <li>\00D6ppning - det dagliga \00F6ppningspriset p\00E5 b\00F6rsen (endast b\00F6rskurs).</li>'),
unistr('      <li>St\00E4ngning - det dagliga st\00E4ngningspriset p\00E5 b\00F6rsen (endast b\00F6rskurs).</li>'),
unistr('      <li>H\00F6gt - det h\00F6ga v\00E4rdet (endast intervall och b\00F6rskurs).</li>'),
unistr('      <li>L\00E5gt - det l\00E5ga v\00E4rdet (endast intervall och b\00F6rskurs).</li>'),
unistr('      <li>Volym - den dagliga b\00F6rskursvolymen (endast b\00F6rskurs).</li>'),
unistr('      <li>M\00E5l - m\00E5lv\00E4rdet (endast tratt).</li>'),
unistr('      <li>X - v\00E4rdet f\00F6r x-axeln (endast bubbla och spridning).</li>'),
unistr('      <li>Y - v\00E4rdet f\00F6r y-axeln (bubbla och spridning).</li>'),
'      <li>Z - stapelbredden eller bubbelradien (endast stapel, bubbla och intervall).</li>',
'    </ul>',
'  </li>',
'  <li>Orientering - vertikal eller horisontell.</li>',
unistr('  <li>Aggregering - v\00E4lj hur diagramv\00E4rdena ska aggregeras.</li>'),
'  <li>Stapla - ange om dataobjekten ska staplas.</li>',
unistr('  <li>Sortera per - sortera per etikett eller v\00E4rde(n).'),
'    <ul>',
unistr('      <li>Riktning - sortera per stigande eller sjunkande v\00E4rden.</li>'),
unistr('      <li>Null-v\00E4rden - ange hur poster med null-v\00E4rden ska sorteras i relation till poster med icke-null-v\00E4rden.</li>'),
'    </ul>',
'  </li>',
'  <li>Antalet decimaler</li>',
unistr('  <li>Etikett f\00F6r axelrubrik</li>'),
unistr('  <li>V\00E4rde f\00F6r axelrubrik</li>'),
'</ul>',
'</p>'))
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143324574441752660)
,p_name=>'APEX.IG.HELP.CHART_TITLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Hj\00E4lp f\00F6r diagram')
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143321647630752660)
,p_name=>'APEX.IG.HELP.COLUMNS'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>I den h\00E4r dialogrutan kan du v\00E4lja vilka kolumner som ska visas och i vilken ordning de ska visas.</p>'),
'',
unistr('<p>D\00F6lj en kolumn genom att avmarkera den.<br>'),
unistr('\00C4ndra ordningen p\00E5 kolumner genom att klicka p\00E5 Flytta upp ( &uarr; ) eller Flytta ned ( &darr; ).<br>'),
unistr('Anv\00E4nd listrutev\00E4ljaren till att lista alla kolumner, visade kolumner eller dolda kolumner.</p>'),
'',
unistr('<p>Du kan \00E4ven anv\00E4nda formul\00E4ret till att ange en kolumns minsta bredd i pixlar.</p>'),
'',
unistr('<p><em>Obs! Du kan ocks\00E5 \00E4ndra ordningen p\00E5 kolumner som visas genom att klicka p\00E5 skjutreglaget (i b\00F6rjan av kolumnrubriken) och dra kolumnen \00E5t v\00E4nster eller h\00F6ger. Du kan ocks\00E5 \00E4ndra kolumnbredden p\00E5 kolumner som visas genom att v\00E4lja kolumnavgr\00E4n')
||unistr('saren, mellan rubriker, och flytta den \00E5t v\00E4nster eller h\00F6ger.</em></p>')))
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143324486113752660)
,p_name=>'APEX.IG.HELP.COLUMNS_TITLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Hj\00E4lp f\00F6r kolumner')
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143322070090752660)
,p_name=>'APEX.IG.HELP.COMPUTE'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>I den h\00E4r dialogrutan kan du definiera ytterligare kolumner baserat p\00E5 matematiska ber\00E4kningar och funktionsber\00E4kningar som utf\00F6rs mot befintliga kolumner.</p>'),
'',
unistr('<p><strong>Ber\00E4kningslista</strong><br>'),
unistr('I ber\00E4kningslistan visas definierade ber\00E4kningar. Avaktivera en befintlig ber\00E4kning genom att avmarkera den.<br>'),
unistr('Klicka p\00E5 L\00E4gg till ( &plus; ) f\00F6r att l\00E4gga till en ny ber\00E4kning och p\00E5 Ta bort ( &minus; ) f\00F6r att ta bort en befintlig ber\00E4kning.</p>'),
'',
unistr('<p><strong>Ber\00E4kningsinst\00E4llningar</strong><br>'),
unistr('Anv\00E4nd formul\00E4ret till att definiera ber\00E4kningen.<br>'),
unistr('Ange kolumninformation som rubrik och etikett och v\00E4lj justeringsinst\00E4llningar.<br> '),
unistr('Anv\00E4nd textomr\00E5det Uttryck till att ange en eller flera kolumner och associerade funktioner f\00F6r ber\00E4kningen.<br>'),
unistr('V\00E4lj l\00E4mplig datatyp, och eventuellt en formatmask, f\00F6r den nya kolumnen.</p>')))
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143324094692752660)
,p_name=>'APEX.IG.HELP.COMPUTE_TITLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Hj\00E4lp f\00F6r ber\00E4kning')
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143322321728752660)
,p_name=>'APEX.IG.HELP.CONTROL_BREAK'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>I den h\00E4r dialogrutan kan du definiera ett kontrollstopp p\00E5 en eller flera kolumner.</p>'),
'',
'<p><strong>Lista med kontrollstopp</strong><br>',
'i listan med kontrollstopp visas definierade kontrollstopp. Avaktivera en befintlig kontrollstoppkolumn genom att avmarkera den.<br>',
unistr('Klicka p\00E5 L\00E4gg till ( &plus; ) f\00F6r att inkludera en ny kolumn i kontrollstoppet och p\00E5 Ta bort ( &minus; ) f\00F6r att ta bort en befintlig kolumn fr\00E5n kontrollstoppet.<br>'),
unistr('\00C4ndra ordning p\00E5 kolumner genom att klicka p\00E5 Flytta upp ( &uarr; ) och p\00E5 Flytta ned ( &darr; ) f\00F6r att flytta den valda kolumnen upp\00E5t eller ned\00E5t i relation till de andra kolumnerna.</p>'),
'',
unistr('<p><strong>Inst\00E4llningar f\00F6r kontrollstopp</strong><br>'),
unistr('Anv\00E4nd formul\00E4ret till att definiera kontrollstoppskolumnen.<br>'),
unistr('V\00E4lj en kontrollstoppskolumn, sorteringsriktning och hur null- kolumner (kolumner utan v\00E4rde) ska sorteras.</p>'),
'',
unistr('<p><em>Obs! N\00E4r du visar det interaktiva rutn\00E4tet kan du definiera ett kontrollstopp genom att klicka p\00E5 en kolumnrubrik och v\00E4lja ikonen f\00F6r kontrollstopp.</em></p>')))
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143323758192752660)
,p_name=>'APEX.IG.HELP.CONTROL_BREAK_TITLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Hj\00E4lp f\00F6r kontrollstopp')
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143322570500752660)
,p_name=>'APEX.IG.HELP.DOWNLOAD'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>I den h\00E4r dialogrutan kan du ladda ned alla aktuella rader till en extern fil. Filen inneh\00E5ller endast de kolumner som visas vid tillf\00E4llet, med de filter och sorteringar som anv\00E4nds p\00E5 dessa data.</p>'),
'',
unistr('<p>V\00E4lj filformat och klicka p\00E5 Ladda ned.<br>'),
unistr('Obs! Bland kommaavgr\00E4nsade v\00E4rden inkluderas inte textformatering som aggregeringar och kontrollstopp.</p>'),
'',
unistr('<p>Om du vill skicka filen via e-post v\00E4ljer du Skicka som e-post och anger e-postdetaljerna (mottagare, \00E4mne och meddelande).</p>')))
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143323588704752660)
,p_name=>'APEX.IG.HELP.DOWNLOAD_TITLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Hj\00E4lp f\00F6r nedladdning')
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143321751369752660)
,p_name=>'APEX.IG.HELP.FILTER'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>I den h\00E4r dialogrutan kan du konfigurera datafilter som begr\00E4nsar de returnerade raderna.</p>'),
'',
'<p><strong>Filterlista</strong><br>',
'I filterlistan visas definierade filter. Avaktivera ett befintligt filter genom att avmarkera det.<br>',
unistr('Klicka p\00E5 L\00E4gg till ( &plus; ) f\00F6r att skapa ett nytt filter och p\00E5 Ta bort ( &minus; ) f\00F6r att ta bort ett befintligt filter.</p>'),
'',
unistr('<p><strong>Filterinst\00E4llningar</strong><br>'),
unistr('Anv\00E4nd formul\00E4ret till att definiera filteregenskaperna.<br>'),
unistr('V\00E4lj l\00E4mplig filtertyp:<br>'),
'&nbsp;&nbsp;&nbsp;Rad - filtrera efter en term i valfri filtrerbar kolumn.<br>',
unistr('&nbsp;&nbsp;&nbsp;Kolumn - filtrera en best\00E4md kolumn efter operator och v\00E4rde.</p>'),
'',
unistr('<p><em>Obs! N\00E4r du visar det interaktiva rutn\00E4tet kan du definiera radfilter genom att skriva direkt i s\00F6kf\00E4ltet. Klicka p\00E5 V\00E4lj kolumner att s\00F6ka i f\00F6r att begr\00E4nsa s\00F6kningen till en best\00E4md kolumn. Du kan annars \00F6ppna en kolumnrubrikmeny och v\00E4lja ')
||unistr('ett v\00E4rde f\00F6r att skapa ett kolumnfilter.</em></p>')))
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143324337377752660)
,p_name=>'APEX.IG.HELP.FILTER_TITLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Hj\00E4lp f\00F6r filter')
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143322141918752660)
,p_name=>'APEX.IG.HELP.FLASHBACK'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>I den h\00E4r dialogrutan kan du visa data som de var vid en tidigare tidpunkt.</p>'),
unistr('<p>K\00F6r flashbackfr\00E5gan genom att ange antalet minuter i det f\00F6rflutna.</p>')))
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143323940957752660)
,p_name=>'APEX.IG.HELP.FLASHBACK_TITLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Hj\00E4lp f\00F6r flashback')
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143324620025752660)
,p_name=>'APEX.IG.HELP.GROUP_BY_TITLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Hj\00E4lp f\00F6r Gruppera per')
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143322250038752660)
,p_name=>'APEX.IG.HELP.HIGHLIGHT'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>I den h\00E4r dialogrutan kan du markera rader eller kolumner med data baserat p\00E5 det villkor som anges.</p>'),
'',
'<p><strong>Markeringslista</strong><br>',
'I markeringslistan visas definierade markeringar. Avaktivera en befintlig markering genom att avmarkera den.<br>',
unistr('Klicka p\00E5 L\00E4gg till ( &plus; ) f\00F6r att skapa en ny markering och p\00E5 Ta bort ( &minus; ) f\00F6r att ta bort en befintlig markering.</p>'),
'',
unistr('<p><strong>Inst\00E4llningar f\00F6r markeringar</strong><br>'),
unistr('Anv\00E4nd formul\00E4ret till att definiera egenskaperna f\00F6r markeringen.<br>'),
unistr('Ange namnet, v\00E4lj Rad eller Kolumn och v\00E4lj HTML-f\00E4rgkoder f\00F6r bakgrund och text.<br>'),
unistr('V\00E4lj l\00E4mplig <strong>villkorstyp</strong> f\00F6r att markera specifika data:<br>'),
'&nbsp;&nbsp;&nbsp;Rad - markera villkoret i valfri kolumn.<br>',
unistr('&nbsp;&nbsp;&nbsp;Kolumn - markera inom en specifik kolumn baserat p\00E5 operator och v\00E4rde som angetts.</p>')))
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143323857498752660)
,p_name=>'APEX.IG.HELP.HIGHLIGHT_TITLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Hj\00E4lp f\00F6r markering')
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143322429948752660)
,p_name=>'APEX.IG.HELP.REPORT'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>I den h\00E4r dialogrutan kan du spara \00E4ndringar du gjort i den aktuella rutn\00E4tslayouten och -konfigurationen.<br>'),
unistr('Applikationsutvecklare kan definiera flera alternativa rapportlayouter. N\00E4r det \00E4r till\00E5tet kan du och andra slutanv\00E4ndare spara en rapport som allm\00E4n, vilket g\00F6r rapporten tillg\00E4nglig f\00F6r alla som anv\00E4nder rutn\00E4tet. Du kan ocks\00E5 spara en rapport som')
||' en privat rapport som bara du kan visa.</p>',
unistr('<p>V\00E4lj bland de tillg\00E4ngliga typerna och ange ett namn p\00E5 rapporten.</p>')))
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143323692209752660)
,p_name=>'APEX.IG.HELP.REPORT_TITLE'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Hj\00E4lp f\00F6r rapport'),
''))
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143321807977752660)
,p_name=>'APEX.IG.HELP.SORT'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>I den h\00E4r dialogrutan kan du st\00E4lla in visningsordningen.</p>'),
'',
'<p><strong>Sorteringslista</strong><br>',
'I dialogrutan Sortera visas en lista med konfigurerade sorteringsregler.<br>',
unistr('Klicka p\00E5 L\00E4gg till ( &plus; ) om du vill skapa en sorteringskolumn och p\00E5 Ta bort ( &minus; ) om du vill ta bort en sorteringskolumn.<br>'),
unistr('Klicka p\00E5 Flytta upp ( &uarr; ) och Flytta ned ( &darr; ) f\00F6r att flytta den valda sorteringskolumnen upp\00E5t eller ned\00E5t i relation till de andra sorteringskolumnerna.</p>'),
'',
unistr('<p><strong>Sorteringsinst\00E4llningar</strong><br>'),
unistr('V\00E4lj en sorteringskolumn, sorteringsriktningen och hur null-kolumner (kolumner utan v\00E4rde) ska ordnas.</p>'),
'',
'<p><em>Obs! Data kan sorteras per kolumner som inte visas, men alla kolumner kanske inte kan sorteras.</em><br>',
unistr('<em>Kolumner som visas kan sorteras genom att du trycker p\00E5 upp\00E5t- (stigande) eller ned\00E5tpilen (sjunkande) i slutet av kolumnrubrikerna. Om du vill l\00E4gga till en efterf\00F6ljande kolumn i en befintlig sortering trycker du ned skift-tangenten och klickar')
||unistr(' p\00E5 upp\00E5t- eller ned\00E5tpilen.</em></p>')))
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143324294364752660)
,p_name=>'APEX.IG.HELP.SORT_TITLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Hj\00E4lp f\00F6r sortering')
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143323455096752660)
,p_name=>'APEX.IG.HELP.SUBSCRIPTION_TITLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Hj\00E4lp f\00F6r prenumeration')
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143277083834752646)
,p_name=>'APEX.IG.HIDE'
,p_message_language=>'sv'
,p_message_text=>unistr('D\00F6lj')
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143241406380752635)
,p_name=>'APEX.IG.HIGHLIGHT'
,p_message_language=>'sv'
,p_message_text=>'Markera'
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143310626744752656)
,p_name=>'APEX.IG.HIGH_COLUMN'
,p_message_language=>'sv'
,p_message_text=>unistr('H\00F6g')
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143311438776752657)
,p_name=>'APEX.IG.HORIZONTAL'
,p_message_language=>'sv'
,p_message_text=>'Horisontellt'
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143270068082752644)
,p_name=>'APEX.IG.HOURS'
,p_message_language=>'sv'
,p_message_text=>'timmar'
,p_is_js_message=>true
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143275097331752646)
,p_name=>'APEX.IG.ICON'
,p_message_language=>'sv'
,p_message_text=>'Ikon'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143240393933752635)
,p_name=>'APEX.IG.ICON_VIEW'
,p_message_language=>'sv'
,p_message_text=>'Ikonvyn'
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143268285479752644)
,p_name=>'APEX.IG.IN'
,p_message_language=>'sv'
,p_message_text=>'i'
,p_is_js_message=>true
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143276637126752646)
,p_name=>'APEX.IG.INACTIVE_SETTING'
,p_message_language=>'sv'
,p_message_text=>unistr('Inaktiv inst\00E4llning')
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143276719175752646)
,p_name=>'APEX.IG.INACTIVE_SETTINGS'
,p_message_language=>'sv'
,p_message_text=>unistr('Inaktiva inst\00E4llningar')
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143284360622752648)
,p_name=>'APEX.IG.INTERNAL_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('Ett internt fel intr\00E4ffade vid bearbetning av den interaktiva rutn\00E4tsbeg\00E4ran.')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143172286474752615)
,p_name=>'APEX.IG.INVALID_COLUMN_FILTER_TYPE'
,p_message_language=>'sv'
,p_message_text=>unistr('Kolumnfiltertypen "%0" st\00F6ds inte f\00F6r kolumnen "%1".')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143323227858752660)
,p_name=>'APEX.IG.INVALID_DATE_FORMAT'
,p_message_language=>'sv'
,p_message_text=>'Ogiltigt datumformat'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143298074681752652)
,p_name=>'APEX.IG.INVALID_FILTER_COLUMN'
,p_message_language=>'sv'
,p_message_text=>unistr('Interaktivt rutn\00E4t har inte st\00F6d f\00F6r definition av ett filter p\00E5 kolumnen %0.')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143297916609752652)
,p_name=>'APEX.IG.INVALID_FILTER_OPERATOR'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 \00E4r inte en giltig filtertyp f\00F6r definition av ett filter f\00F6r interaktivt rutn\00E4t.')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143178839458752617)
,p_name=>'APEX.IG.INVALID_NUMBER_FORMAT'
,p_message_language=>'sv'
,p_message_text=>'Ogiltigt talformat'
,p_is_js_message=>true
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143325935635752661)
,p_name=>'APEX.IG.INVALID_SETTING'
,p_message_language=>'sv'
,p_message_text=>unistr('Ogiltig inst\00E4llning')
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143326076938752661)
,p_name=>'APEX.IG.INVALID_SETTINGS'
,p_message_language=>'sv'
,p_message_text=>unistr('Ogiltiga inst\00E4llningar')
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143317166633752658)
,p_name=>'APEX.IG.INVALID_SORT_BY'
,p_message_language=>'sv'
,p_message_text=>unistr('Sortera per has konfigurerats till %0, men ingen kolumn har valts f\00F6r %0.')
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143314494538752657)
,p_name=>'APEX.IG.INVALID_VALUE'
,p_message_language=>'sv'
,p_message_text=>unistr('Ogiltigt v\00E4rde')
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143309593635752656)
,p_name=>'APEX.IG.INVISIBLE'
,p_message_language=>'sv'
,p_message_text=>'Visas inte'
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143269044592752644)
,p_name=>'APEX.IG.IN_THE_LAST'
,p_message_language=>'sv'
,p_message_text=>'i de senaste'
,p_is_js_message=>true
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143269258907752644)
,p_name=>'APEX.IG.IN_THE_NEXT'
,p_message_language=>'sv'
,p_message_text=>'under kommande'
,p_is_js_message=>true
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143268129281752644)
,p_name=>'APEX.IG.IS_NOT_NULL'
,p_message_language=>'sv'
,p_message_text=>unistr('\00E4r inte tomt')
,p_is_js_message=>true
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143268023508752644)
,p_name=>'APEX.IG.IS_NULL'
,p_message_language=>'sv'
,p_message_text=>unistr('\00E4r tomt')
,p_is_js_message=>true
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143317977954752658)
,p_name=>'APEX.IG.LABEL'
,p_message_language=>'sv'
,p_message_text=>'Etikett'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143309986447752656)
,p_name=>'APEX.IG.LABEL_COLUMN'
,p_message_language=>'sv'
,p_message_text=>'Etikett'
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143313845427752657)
,p_name=>'APEX.IG.LAST'
,p_message_language=>'sv'
,p_message_text=>'Sista'
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143258343079752641)
,p_name=>'APEX.IG.LAST.DAY'
,p_message_language=>'sv'
,p_message_text=>'Senaste dagen'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143258583420752641)
,p_name=>'APEX.IG.LAST.HOUR'
,p_message_language=>'sv'
,p_message_text=>'Senaste timmen'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143259063381752641)
,p_name=>'APEX.IG.LAST.MINUTE'
,p_message_language=>'sv'
,p_message_text=>'Senaste minuten'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143258040422752641)
,p_name=>'APEX.IG.LAST.MONTH'
,p_message_language=>'sv'
,p_message_text=>unistr('Senaste m\00E5naden')
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143258186070752641)
,p_name=>'APEX.IG.LAST.WEEK'
,p_message_language=>'sv'
,p_message_text=>'Senaste veckan'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143258273308752641)
,p_name=>'APEX.IG.LAST.X_DAYS'
,p_message_language=>'sv'
,p_message_text=>'Senaste %0 dagarna'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143258400177752641)
,p_name=>'APEX.IG.LAST.X_HOURS'
,p_message_language=>'sv'
,p_message_text=>'Senaste %0 timmarna'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143259113914752641)
,p_name=>'APEX.IG.LAST.X_MINUTES'
,p_message_language=>'sv'
,p_message_text=>'Senaste %0 minuterna'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143258954434752641)
,p_name=>'APEX.IG.LAST.X_MONTHS'
,p_message_language=>'sv'
,p_message_text=>unistr('Senaste %0 m\00E5naderna')
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143258831500752641)
,p_name=>'APEX.IG.LAST.X_WEEKS'
,p_message_language=>'sv'
,p_message_text=>'Senaste %0 veckorna'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143257889770752640)
,p_name=>'APEX.IG.LAST.X_YEARS'
,p_message_language=>'sv'
,p_message_text=>unistr('Senaste %0 \00E5ren')
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143257938991752640)
,p_name=>'APEX.IG.LAST.YEAR'
,p_message_language=>'sv'
,p_message_text=>unistr('F\00F6rra \00E5ret')
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143318121615752658)
,p_name=>'APEX.IG.LAYOUT_ALIGN'
,p_message_language=>'sv'
,p_message_text=>'Celljustering'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143318272256752659)
,p_name=>'APEX.IG.LAYOUT_USEGROUPFOR'
,p_message_language=>'sv'
,p_message_text=>unistr('Anv\00E4nd grupp f\00F6r')
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143268695691752644)
,p_name=>'APEX.IG.LESS_THAN'
,p_message_language=>'sv'
,p_message_text=>unistr('mindre \00E4n')
,p_is_js_message=>true
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143268718387752644)
,p_name=>'APEX.IG.LESS_THAN_OR_EQUALS'
,p_message_language=>'sv'
,p_message_text=>unistr('mindre \00E4n eller lika med')
,p_is_js_message=>true
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143312021551752657)
,p_name=>'APEX.IG.LINE'
,p_message_language=>'sv'
,p_message_text=>'Linje'
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143312107857752657)
,p_name=>'APEX.IG.LINE_WITH_AREA'
,p_message_language=>'sv'
,p_message_text=>'Linjediagram med yta'
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143318519008752659)
,p_name=>'APEX.IG.LISTAGG'
,p_message_language=>'sv'
,p_message_text=>'Listtagg'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143310768799752656)
,p_name=>'APEX.IG.LOW_COLUMN'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00E5g')
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143321060495752659)
,p_name=>'APEX.IG.MAILADDRESSES_COMMASEP'
,p_message_language=>'sv'
,p_message_text=>'Dela upp flera adresser med kommatecken'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143269852170752644)
,p_name=>'APEX.IG.MATCHES_REGULAR_EXPRESSION'
,p_message_language=>'sv'
,p_message_text=>unistr('matchar regulj\00E4rt uttryck')
,p_is_js_message=>true
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143294277324752651)
,p_name=>'APEX.IG.MAX'
,p_message_language=>'sv'
,p_message_text=>'Max'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143328513028752662)
,p_name=>'APEX.IG.MAX_OVERALL'
,p_message_language=>'sv'
,p_message_text=>unistr('Totalt h\00F6gst')
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143294419752752651)
,p_name=>'APEX.IG.MEDIAN'
,p_message_language=>'sv'
,p_message_text=>'Median'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143328634189752662)
,p_name=>'APEX.IG.MEDIAN_OVERALL'
,p_message_language=>'sv'
,p_message_text=>'Total median'
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143294163962752651)
,p_name=>'APEX.IG.MIN'
,p_message_language=>'sv'
,p_message_text=>'Min'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143269970688752644)
,p_name=>'APEX.IG.MINUTES'
,p_message_language=>'sv'
,p_message_text=>'minuter'
,p_is_js_message=>true
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143294912399752651)
,p_name=>'APEX.IG.MINUTES_AGO'
,p_message_language=>'sv'
,p_message_text=>'Minuter sedan'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143328428335752662)
,p_name=>'APEX.IG.MIN_OVERALL'
,p_message_language=>'sv'
,p_message_text=>unistr('Totalt l\00E4gst')
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143270383093752644)
,p_name=>'APEX.IG.MONTHS'
,p_message_language=>'sv'
,p_message_text=>unistr('m\00E5nader')
,p_is_js_message=>true
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143276907803752646)
,p_name=>'APEX.IG.MORE_DATA_FOUND'
,p_message_language=>'sv'
,p_message_text=>unistr('Data inneh\00E5ller fler \00E4n %0 vilket \00F6verskrider det maximalt till\00E5tna antalet. Till\00E4mpa ytterligare filter f\00F6r att visa resultat.')
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143302705300752654)
,p_name=>'APEX.IG.MULTIIG_PAGE_REGION_STATIC_ID_REQUIRED'
,p_message_language=>'sv'
,p_message_text=>unistr('Regionens statiska id m\00E5ste anges eftersom sidan inneh\00E5ller flera interaktiva rutn\00E4t.')
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143273078556752645)
,p_name=>'APEX.IG.NAME'
,p_message_language=>'sv'
,p_message_text=>'Namn'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143273210943752645)
,p_name=>'APEX.IG.NAMED_REPORT'
,p_message_language=>'sv'
,p_message_text=>'Namngiven rapport'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143257283453752640)
,p_name=>'APEX.IG.NEXT.DAY'
,p_message_language=>'sv'
,p_message_text=>unistr('N\00E4sta dag')
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143257060932752640)
,p_name=>'APEX.IG.NEXT.HOUR'
,p_message_language=>'sv'
,p_message_text=>unistr('N\00E4sta timmen')
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143259238470752641)
,p_name=>'APEX.IG.NEXT.MINUTE'
,p_message_language=>'sv'
,p_message_text=>unistr('N\00E4sta minut')
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143257533358752640)
,p_name=>'APEX.IG.NEXT.MONTH'
,p_message_language=>'sv'
,p_message_text=>unistr('N\00E4sta m\00E5nad')
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143257481189752640)
,p_name=>'APEX.IG.NEXT.WEEK'
,p_message_language=>'sv'
,p_message_text=>unistr('N\00E4sta vecka')
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143257393068752640)
,p_name=>'APEX.IG.NEXT.X_DAYS'
,p_message_language=>'sv'
,p_message_text=>unistr('N\00E4sta %0 dagarna')
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143257175671752640)
,p_name=>'APEX.IG.NEXT.X_HOURS'
,p_message_language=>'sv'
,p_message_text=>unistr('N\00E4sta %0 timmarna')
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143259384095752641)
,p_name=>'APEX.IG.NEXT.X_MINUTES'
,p_message_language=>'sv'
,p_message_text=>unistr('N\00E4sta %0 minuterna')
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143258611721752641)
,p_name=>'APEX.IG.NEXT.X_MONTHS'
,p_message_language=>'sv'
,p_message_text=>unistr('N\00E4sta %0 m\00E5naderna')
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143258701015752641)
,p_name=>'APEX.IG.NEXT.X_WEEKS'
,p_message_language=>'sv'
,p_message_text=>unistr('N\00E4sta %0 veckorna')
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143257730136752640)
,p_name=>'APEX.IG.NEXT.X_YEARS'
,p_message_language=>'sv'
,p_message_text=>unistr('N\00E4sta %0 \00E5ren')
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143257603788752640)
,p_name=>'APEX.IG.NEXT.YEAR'
,p_message_language=>'sv'
,p_message_text=>unistr('N\00E4sta \00E5r')
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143268943393752644)
,p_name=>'APEX.IG.NOT_BETWEEN'
,p_message_language=>'sv'
,p_message_text=>'inte mellan'
,p_is_js_message=>true
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143267985276752643)
,p_name=>'APEX.IG.NOT_EQUALS'
,p_message_language=>'sv'
,p_message_text=>'inte lika med'
,p_is_js_message=>true
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143332707277752663)
,p_name=>'APEX.IG.NOT_EXIST'
,p_message_language=>'sv'
,p_message_text=>unistr('Regionen med id:t %0 \00E4r inte en interaktiv rutn\00E4tsregion eller finns inte i applikationen %1.')
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143268352335752644)
,p_name=>'APEX.IG.NOT_IN'
,p_message_language=>'sv'
,p_message_text=>'inte i'
,p_is_js_message=>true
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143269197792752644)
,p_name=>'APEX.IG.NOT_IN_THE_LAST'
,p_message_language=>'sv'
,p_message_text=>'inte i de senaste'
,p_is_js_message=>true
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143269353598752644)
,p_name=>'APEX.IG.NOT_IN_THE_NEXT'
,p_message_language=>'sv'
,p_message_text=>unistr('inte i n\00E4sta')
,p_is_js_message=>true
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143276801713752646)
,p_name=>'APEX.IG.NO_DATA_FOUND'
,p_message_language=>'sv'
,p_message_text=>'Inga data hittades'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143313600251752657)
,p_name=>'APEX.IG.NULLS'
,p_message_language=>'sv'
,p_message_text=>'Null'
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143318784107752659)
,p_name=>'APEX.IG.NUMBER'
,p_message_language=>'sv'
,p_message_text=>'Numerisk'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143313944291752657)
,p_name=>'APEX.IG.OFF'
,p_message_language=>'sv'
,p_message_text=>'Av'
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143314052342752657)
,p_name=>'APEX.IG.ON'
,p_message_language=>'sv'
,p_message_text=>unistr('P\00E5')
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143267198672752643)
,p_name=>'APEX.IG.ONE_MINUTE_AGO'
,p_message_language=>'sv'
,p_message_text=>'1 minut sedan'
,p_is_js_message=>true
,p_version_scn=>2705700
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143321596232752660)
,p_name=>'APEX.IG.OPEN_COLORPICKER'
,p_message_language=>'sv'
,p_message_text=>unistr('\00D6ppna f\00E4rgv\00E4ljaren: %0')
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143310485508752656)
,p_name=>'APEX.IG.OPEN_COLUMN'
,p_message_language=>'sv'
,p_message_text=>unistr('\00D6ppna')
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143274126458752645)
,p_name=>'APEX.IG.OPERATOR'
,p_message_language=>'sv'
,p_message_text=>'Operator'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143309846438752656)
,p_name=>'APEX.IG.ORIENTATION'
,p_message_language=>'sv'
,p_message_text=>'Orientering'
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143312270042752657)
,p_name=>'APEX.IG.PIE'
,p_message_language=>'sv'
,p_message_text=>'Cirkel'
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143275430474752646)
,p_name=>'APEX.IG.PIVOT'
,p_message_language=>'sv'
,p_message_text=>'Pivot'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143240607047752635)
,p_name=>'APEX.IG.PIVOT_VIEW'
,p_message_language=>'sv'
,p_message_text=>'Pivotvy'
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143321468266752659)
,p_name=>'APEX.IG.PLACEHOLDER_INVALUES'
,p_message_language=>'sv'
,p_message_text=>unistr('Dela upp v\00E4rden med "%0"')
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143312315947752657)
,p_name=>'APEX.IG.POLAR'
,p_message_language=>'sv'
,p_message_text=>unistr('Pol\00E4r')
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143317674939752658)
,p_name=>'APEX.IG.POSITION_CENTER'
,p_message_language=>'sv'
,p_message_text=>'Center'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143317769711752658)
,p_name=>'APEX.IG.POSITION_END'
,p_message_language=>'sv'
,p_message_text=>'Slut'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143317589567752658)
,p_name=>'APEX.IG.POSITION_START'
,p_message_language=>'sv'
,p_message_text=>'Start'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143273384628752645)
,p_name=>'APEX.IG.PRIMARY'
,p_message_language=>'sv'
,p_message_text=>unistr('Prim\00E4r')
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143273668051752645)
,p_name=>'APEX.IG.PRIMARY_DEFAULT'
,p_message_language=>'sv'
,p_message_text=>unistr('Prim\00E4r standard')
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143290167216752650)
,p_name=>'APEX.IG.PRIMARY_REPORT'
,p_message_language=>'sv'
,p_message_text=>unistr('Prim\00E4r rapport')
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143163743020752612)
,p_name=>'APEX.IG.PRINT_ACCESSIBLE.PROMPT'
,p_message_language=>'sv'
,p_message_text=>unistr('Inkludera tillg\00E4nglighetstaggar')
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143161119584752612)
,p_name=>'APEX.IG.PRINT_ORIENTATION.LOV.HORIZONTAL.D'
,p_message_language=>'sv'
,p_message_text=>'Liggande'
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143161229033752612)
,p_name=>'APEX.IG.PRINT_ORIENTATION.LOV.VERTICAL.D'
,p_message_language=>'sv'
,p_message_text=>unistr('St\00E5ende ')
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143161097043752612)
,p_name=>'APEX.IG.PRINT_ORIENTATION.PROMPT'
,p_message_language=>'sv'
,p_message_text=>'Sidorientering'
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143160907975752612)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.A3.D'
,p_message_language=>'sv'
,p_message_text=>'A3'
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143160808270752612)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.A4.D'
,p_message_language=>'sv'
,p_message_text=>'A4'
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143163919322752612)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.CUSTOM.D'
,p_message_language=>'sv'
,p_message_text=>'Anpassad'
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143160658912752611)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.LEGAL.D'
,p_message_language=>'sv'
,p_message_text=>'Legal'
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143160578022752611)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.LETTER.D'
,p_message_language=>'sv'
,p_message_text=>'Letter'
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143160778679752611)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.TABLOID.D'
,p_message_language=>'sv'
,p_message_text=>'Tabloid'
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143160441111752611)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.PROMPT'
,p_message_language=>'sv'
,p_message_text=>'Sidstorlek'
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143126047403752601)
,p_name=>'APEX.IG.PRINT_STRIP_RICH_TEXT.PROMPT'
,p_message_language=>'sv'
,p_message_text=>'RTF-remsa'
,p_is_js_message=>true
,p_version_scn=>2705672
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143312438027752657)
,p_name=>'APEX.IG.RADAR'
,p_message_language=>'sv'
,p_message_text=>'Radar'
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143312510135752657)
,p_name=>'APEX.IG.RANGE'
,p_message_language=>'sv'
,p_message_text=>'Intervall'
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143322730815752660)
,p_name=>'APEX.IG.REFRESH'
,p_message_language=>'sv'
,p_message_text=>unistr('F\00F6rnya')
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143277622139752646)
,p_name=>'APEX.IG.REFRESH_ROW'
,p_message_language=>'sv'
,p_message_text=>unistr('F\00F6rnya rad')
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143276450196752646)
,p_name=>'APEX.IG.REFRESH_ROWS'
,p_message_language=>'sv'
,p_message_text=>unistr('F\00F6rnya rader')
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143281691582752648)
,p_name=>'APEX.IG.REGION_NOT_EXIST'
,p_message_language=>'sv'
,p_message_text=>unistr('Den interaktiva rutn\00E4tsregionen finns inte i applikationen %0, p\00E5 sidan %1 och i regionen %2.')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143242119407752636)
,p_name=>'APEX.IG.REMOVE_CONTROL'
,p_message_language=>'sv'
,p_message_text=>'Flytta bort %0'
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143272763348752645)
,p_name=>'APEX.IG.REPORT'
,p_message_language=>'sv'
,p_message_text=>'Rapport'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143331949817752663)
,p_name=>'APEX.IG.REPORT.DELETED'
,p_message_language=>'sv'
,p_message_text=>'Rapporten har tagits bort'
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143331659429752663)
,p_name=>'APEX.IG.REPORT.SAVED.ALTERNATIVE'
,p_message_language=>'sv'
,p_message_text=>unistr('Alternativ rapport har sparats f\00F6r alla anv\00E4ndare')
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143331574721752662)
,p_name=>'APEX.IG.REPORT.SAVED.DEFAULT'
,p_message_language=>'sv'
,p_message_text=>unistr('Standardrapport har sparats f\00F6r alla anv\00E4ndare')
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143331854103752663)
,p_name=>'APEX.IG.REPORT.SAVED.PRIVATE'
,p_message_language=>'sv'
,p_message_text=>'Privat rapport har sparats'
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143331756585752663)
,p_name=>'APEX.IG.REPORT.SAVED.PUBLIC'
,p_message_language=>'sv'
,p_message_text=>unistr('Offentlig rapport har sparats f\00F6r alla anv\00E4ndare')
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143281770905752648)
,p_name=>'APEX.IG.REPORT_ALIAS_DOES_NOT_EXIST'
,p_message_language=>'sv'
,p_message_text=>unistr('Det sparade interaktiva rutn\00E4tet med namnet %0 finns inte.')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143267057741752643)
,p_name=>'APEX.IG.REPORT_DATA_AS_OF.X.MINUTES_AGO'
,p_message_language=>'sv'
,p_message_text=>unistr('Matrisdata f\00F6r %0 minuter sedan')
,p_is_js_message=>true
,p_version_scn=>2705700
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143266907506752643)
,p_name=>'APEX.IG.REPORT_DATA_AS_OF_ONE_MINUTE_AGO'
,p_message_language=>'sv'
,p_message_text=>unistr('Matrisdata f\00F6r 1 minut sedan')
,p_is_js_message=>true
,p_version_scn=>2705700
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143202491549752624)
,p_name=>'APEX.IG.REPORT_DOES_NOT_EXIST'
,p_message_language=>'sv'
,p_message_text=>unistr('Rapporten f\00F6r interaktivt rutn\00E4t finns inte.')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143324916073752661)
,p_name=>'APEX.IG.REPORT_EDIT'
,p_message_language=>'sv'
,p_message_text=>unistr('Rapport \2013 Redigera')
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143281554054752648)
,p_name=>'APEX.IG.REPORT_ID_DOES_NOT_EXIST'
,p_message_language=>'sv'
,p_message_text=>unistr('Det sparade interaktiva rutn\00E4tet med id:t %0 finns inte.')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143324878562752661)
,p_name=>'APEX.IG.REPORT_SAVE_AS'
,p_message_language=>'sv'
,p_message_text=>unistr('Rapport \2013 Spara som')
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143242259589752636)
,p_name=>'APEX.IG.REPORT_SETTINGS'
,p_message_language=>'sv'
,p_message_text=>unistr('Rutn\00E4tsinst\00E4llningar')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143332897142752663)
,p_name=>'APEX.IG.REPORT_STATIC_ID_DOES_NOT_EXIST'
,p_message_language=>'sv'
,p_message_text=>unistr('Det sparade interaktiva rutn\00E4tet med det statiska id:t %0 finns inte.')
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143327806375752661)
,p_name=>'APEX.IG.REPORT_VIEW'
,p_message_language=>'sv'
,p_message_text=>'Rapportvy'
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143241399334752635)
,p_name=>'APEX.IG.RESET'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C5terst\00E4ll')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143277742443752646)
,p_name=>'APEX.IG.REVERT_CHANGES'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C5terst\00E4ll \00E4ndringar')
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143276510054752646)
,p_name=>'APEX.IG.REVERT_ROWS'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C5terst\00E4ll rader')
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143273742643752645)
,p_name=>'APEX.IG.ROW'
,p_message_language=>'sv'
,p_message_text=>'Rad'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143272610229752645)
,p_name=>'APEX.IG.ROWS_PER_PAGE'
,p_message_language=>'sv'
,p_message_text=>'Rader per sida'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143332441988752663)
,p_name=>'APEX.IG.ROW_ACTIONS'
,p_message_language=>'sv'
,p_message_text=>unistr('Rad\00E5tg\00E4rder')
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143333693614752663)
,p_name=>'APEX.IG.ROW_ACTIONS_FOR'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C5tg\00E4rder f\00F6r rad %0')
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143241646550752636)
,p_name=>'APEX.IG.SAVE'
,p_message_language=>'sv'
,p_message_text=>'Spara'
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143286730163752649)
,p_name=>'APEX.IG.SAVED'
,p_message_language=>'sv'
,p_message_text=>'sparad'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143191310369752621)
,p_name=>'APEX.IG.SAVED_REPORT'
,p_message_language=>'sv'
,p_message_text=>'Sparad rapport: %0'
,p_is_js_message=>true
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143239843104752635)
,p_name=>'APEX.IG.SAVED_REPORTS'
,p_message_language=>'sv'
,p_message_text=>'Sparade rapporter'
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143239913671752635)
,p_name=>'APEX.IG.SAVED_REPORT_DEFAULT'
,p_message_language=>'sv'
,p_message_text=>'Standard'
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143213467627752627)
,p_name=>'APEX.IG.SAVED_REPORT_EXISTS'
,p_message_language=>'sv'
,p_message_text=>'Det finns redan en sparad rapport med namnet %0. Ange ett nytt namn.'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143240034605752635)
,p_name=>'APEX.IG.SAVED_REPORT_PRIVATE'
,p_message_language=>'sv'
,p_message_text=>'Privat'
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143240168331752635)
,p_name=>'APEX.IG.SAVED_REPORT_PUBLIC'
,p_message_language=>'sv'
,p_message_text=>unistr('Allm\00E4n')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143327555109752661)
,p_name=>'APEX.IG.SAVE_AS'
,p_message_language=>'sv'
,p_message_text=>'Spara som'
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143275826288752646)
,p_name=>'APEX.IG.SAVE_REPORT_SETTINGS'
,p_message_language=>'sv'
,p_message_text=>unistr('Spara rapportinst\00E4llningar')
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143312638062752657)
,p_name=>'APEX.IG.SCATTER'
,p_message_language=>'sv'
,p_message_text=>'Spridning'
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143239708225752635)
,p_name=>'APEX.IG.SEARCH'
,p_message_language=>'sv'
,p_message_text=>unistr('S\00F6k')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143319893874752659)
,p_name=>'APEX.IG.SEARCH.ALL_COLUMNS'
,p_message_language=>'sv'
,p_message_text=>unistr('S\00F6k: Alla textkolumner')
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143239637757752635)
,p_name=>'APEX.IG.SEARCH.COLUMN'
,p_message_language=>'sv'
,p_message_text=>unistr('S\00F6k i: %0')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143319175775752659)
,p_name=>'APEX.IG.SEARCH.ORACLE_TEXT'
,p_message_language=>'sv'
,p_message_text=>unistr('S\00F6k: Full text')
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143266836709752643)
,p_name=>'APEX.IG.SEARCH_FOR.X'
,p_message_language=>'sv'
,p_message_text=>unistr('S\00F6k efter "%0"')
,p_is_js_message=>true
,p_version_scn=>2705700
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143309258421752656)
,p_name=>'APEX.IG.SELECT'
,p_message_language=>'sv'
,p_message_text=>unistr('- V\00E4lj -')
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143249347889752638)
,p_name=>'APEX.IG.SELECTION'
,p_message_language=>'sv'
,p_message_text=>'Urval'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143302406899752654)
,p_name=>'APEX.IG.SELECT_1_ROW_IN_MASTER'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4lj 1 rad i den n\00E4rmast \00F6verordnade regionen')
,p_is_js_message=>true
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143239518987752635)
,p_name=>'APEX.IG.SELECT_COLUMNS_TO_SEARCH'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4lj kolumner att s\00F6ka i')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143332146831752663)
,p_name=>'APEX.IG.SEL_ACTIONS'
,p_message_language=>'sv'
,p_message_text=>unistr('Urvals\00E5tg\00E4rder')
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143249577231752638)
,p_name=>'APEX.IG.SEL_MODE_CELL'
,p_message_language=>'sv'
,p_message_text=>'Cellurval'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143249446579752638)
,p_name=>'APEX.IG.SEL_MODE_ROW'
,p_message_language=>'sv'
,p_message_text=>'Radval'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143320446618752659)
,p_name=>'APEX.IG.SEND_AS_EMAIL'
,p_message_language=>'sv'
,p_message_text=>'Skicka som e-post'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143313046887752657)
,p_name=>'APEX.IG.SERIES_COLUMN'
,p_message_language=>'sv'
,p_message_text=>'Serie'
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143237207205752634)
,p_name=>'APEX.IG.SHOW'
,p_message_language=>'sv'
,p_message_text=>'Visa'
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143292450479752651)
,p_name=>'APEX.IG.SHOW_OVERALL_VALUE'
,p_message_language=>'sv'
,p_message_text=>unistr('Visa totalv\00E4rde')
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143277320682752646)
,p_name=>'APEX.IG.SINGLE_ROW_VIEW'
,p_message_language=>'sv'
,p_message_text=>'Enstaka rad-vy'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143275687314752646)
,p_name=>'APEX.IG.SORT'
,p_message_language=>'sv'
,p_message_text=>'Sortera'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143313102631752657)
,p_name=>'APEX.IG.SORT_BY'
,p_message_language=>'sv'
,p_message_text=>'Sortera per'
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143332514064752663)
,p_name=>'APEX.IG.SORT_ONLY_ONE_PER_COLUMN'
,p_message_language=>'sv'
,p_message_text=>'Du kan endast definiera en sort per kolumn.'
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143332383008752663)
,p_name=>'APEX.IG.SRV_CHANGE_MENU'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C4ndring')
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143314195248752657)
,p_name=>'APEX.IG.STACK'
,p_message_language=>'sv'
,p_message_text=>'Stack'
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143269621444752644)
,p_name=>'APEX.IG.STARTS_WITH'
,p_message_language=>'sv'
,p_message_text=>unistr('b\00F6rjar med')
,p_is_js_message=>true
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143312716896752657)
,p_name=>'APEX.IG.STOCK'
,p_message_language=>'sv'
,p_message_text=>'Lager'
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143232073383752633)
,p_name=>'APEX.IG.STRETCH_COLUMNS'
,p_message_language=>'sv'
,p_message_text=>unistr('Str\00E4ck ut kolumnbredder')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143276048633752646)
,p_name=>'APEX.IG.SUBSCRIPTION'
,p_message_language=>'sv'
,p_message_text=>'Prenumeration'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143294031128752651)
,p_name=>'APEX.IG.SUM'
,p_message_language=>'sv'
,p_message_text=>'Summa'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143333878027752663)
,p_name=>'APEX.IG.SUMMARY'
,p_message_language=>'sv'
,p_message_text=>unistr('Interaktivt rutn\00E4t. Rapport: %0, vy: %1.')
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143327967854752661)
,p_name=>'APEX.IG.SUM_OVERALL'
,p_message_language=>'sv'
,p_message_text=>'Totalsumma'
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143310943488752656)
,p_name=>'APEX.IG.TARGET_COLUMN'
,p_message_language=>'sv'
,p_message_text=>unistr('M\00E5l')
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143317353541752658)
,p_name=>'APEX.IG.TEXT_COLOR'
,p_message_language=>'sv'
,p_message_text=>unistr('Textf\00E4rg')
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143242306670752636)
,p_name=>'APEX.IG.TOGGLE'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4xla')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143124442018752601)
,p_name=>'APEX.IG.TOOLBAR'
,p_message_language=>'sv'
,p_message_text=>unistr('Rutn\00E4t')
,p_is_js_message=>true
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143292379781752651)
,p_name=>'APEX.IG.TOOLTIP'
,p_message_language=>'sv'
,p_message_text=>'Knappbeskrivning'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143272836440752645)
,p_name=>'APEX.IG.TYPE'
,p_message_language=>'sv'
,p_message_text=>'Typ'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143277226778752646)
,p_name=>'APEX.IG.UNFREEZE'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00E5s upp')
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143274325660752645)
,p_name=>'APEX.IG.UNIT'
,p_message_language=>'sv'
,p_message_text=>'Enhet'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143320206954752659)
,p_name=>'APEX.IG.UNSAVED_CHANGES_CONTINUE_CONFIRM'
,p_message_language=>'sv'
,p_message_text=>unistr('Du har \00E4ndringar som inte har sparats. Vill du forts\00E4tta?')
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143274212559752645)
,p_name=>'APEX.IG.VALUE'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4rde')
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143310014822752656)
,p_name=>'APEX.IG.VALUE_COLUMN'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4rde')
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143314942606752658)
,p_name=>'APEX.IG.VALUE_REQUIRED'
,p_message_language=>'sv'
,p_message_text=>unistr('Ett v\00E4rde m\00E5ste anges.')
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143300192812752653)
,p_name=>'APEX.IG.VALUE_TIMESTAMP_TZ'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4rde (tidszon kan inte \00E4ndras)')
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143318851796752659)
,p_name=>'APEX.IG.VARCHAR2'
,p_message_language=>'sv'
,p_message_text=>'Text'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143311354592752656)
,p_name=>'APEX.IG.VERTICAL'
,p_message_language=>'sv'
,p_message_text=>'Vertikalt'
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143272370770752645)
,p_name=>'APEX.IG.VIEW'
,p_message_language=>'sv'
,p_message_text=>'Visa'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143207483547752625)
,p_name=>'APEX.IG.VIEW_MODE_DESCRIPTION'
,p_message_language=>'sv'
,p_message_text=>unistr('Rutn\00E4tet \00E4r i vyl\00E4get, tryck f\00F6r att redigera')
,p_is_js_message=>true
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143309353639752656)
,p_name=>'APEX.IG.VISIBLE'
,p_message_language=>'sv'
,p_message_text=>'Visad'
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143310854414752656)
,p_name=>'APEX.IG.VOLUME_COLUMN'
,p_message_language=>'sv'
,p_message_text=>'Volym'
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143270224054752644)
,p_name=>'APEX.IG.WEEKS'
,p_message_language=>'sv'
,p_message_text=>'veckor'
,p_is_js_message=>true
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143309443176752656)
,p_name=>'APEX.IG.WIDTH'
,p_message_language=>'sv'
,p_message_text=>'Minsta kolumnbredd (pixlar)'
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143261419670752642)
,p_name=>'APEX.IG.X.BETWEEN.Y.AND.Z'
,p_message_language=>'sv'
,p_message_text=>'%0 mellan %1 och %2'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143261198500752641)
,p_name=>'APEX.IG.X.CONTAINS.Y'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 inneh\00E5ller %1')
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143261202677752641)
,p_name=>'APEX.IG.X.DOES_NOT_CONTAIN.Y'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 inneh\00E5ller inte %1')
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143236676773752634)
,p_name=>'APEX.IG.X.DOES_NOT_START_WITH.Y'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 b\00F6rjar inte med %1')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143259947694752641)
,p_name=>'APEX.IG.X.EQUALS.Y'
,p_message_language=>'sv'
,p_message_text=>'%0 lika med %1'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143260136972752641)
,p_name=>'APEX.IG.X.GREATER_THAN.Y'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 st\00F6rre \00E4n %1')
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143260229821752641)
,p_name=>'APEX.IG.X.GREATER_THAN_OR_EQUALS.Y'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 st\00F6rre \00E4n eller lika med %1')
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143260985544752641)
,p_name=>'APEX.IG.X.IN.Y'
,p_message_language=>'sv'
,p_message_text=>'%0 i %1'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143262156088752642)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.DAYS'
,p_message_language=>'sv'
,p_message_text=>'%0 de senaste %1 dagarna'
,p_is_js_message=>true
,p_version_scn=>2705697
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143261989721752642)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.HOURS'
,p_message_language=>'sv'
,p_message_text=>'%0 de senaste %1 timmarna'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143261705057752642)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.MINUTES'
,p_message_language=>'sv'
,p_message_text=>'%0 de senaste %1 minuterna'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143262508479752642)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.MONTHS'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 de senaste %1 m\00E5naderna')
,p_is_js_message=>true
,p_version_scn=>2705697
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143262383673752642)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.WEEKS'
,p_message_language=>'sv'
,p_message_text=>'%0 de senaste %1 veckorna'
,p_is_js_message=>true
,p_version_scn=>2705697
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143262797300752642)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.YEARS'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 de senaste %1 \00E5ren')
,p_is_js_message=>true
,p_version_scn=>2705697
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143262059859752642)
,p_name=>'APEX.IG.X.IN_THE_LAST_DAY'
,p_message_language=>'sv'
,p_message_text=>'%0 den senaste dagen'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143261811304752642)
,p_name=>'APEX.IG.X.IN_THE_LAST_HOUR'
,p_message_language=>'sv'
,p_message_text=>'%0 den senaste timmen'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143261666582752642)
,p_name=>'APEX.IG.X.IN_THE_LAST_MINUTE'
,p_message_language=>'sv'
,p_message_text=>'%0 den senaste minuten'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143262463339752642)
,p_name=>'APEX.IG.X.IN_THE_LAST_MONTH'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 den senaste m\00E5naden')
,p_is_js_message=>true
,p_version_scn=>2705697
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143262212582752642)
,p_name=>'APEX.IG.X.IN_THE_LAST_WEEK'
,p_message_language=>'sv'
,p_message_text=>'%0 den senaste veckan'
,p_is_js_message=>true
,p_version_scn=>2705697
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143262668916752642)
,p_name=>'APEX.IG.X.IN_THE_LAST_YEAR'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 det senaste \00E5ret')
,p_is_js_message=>true
,p_version_scn=>2705697
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143264516977752642)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.DAYS'
,p_message_language=>'sv'
,p_message_text=>'%0 de kommande %1 dagarna'
,p_is_js_message=>true
,p_version_scn=>2705697
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143264323243752642)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.HOURS'
,p_message_language=>'sv'
,p_message_text=>'%0 de kommande %1 timmarna'
,p_is_js_message=>true
,p_version_scn=>2705697
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143264140911752642)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.MINUTES'
,p_message_language=>'sv'
,p_message_text=>'%0 de kommande %1 minuterna'
,p_is_js_message=>true
,p_version_scn=>2705697
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143264980502752643)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.MONTHS'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 de kommande %1 m\00E5naderna')
,p_is_js_message=>true
,p_version_scn=>2705698
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143264789668752643)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.WEEKS'
,p_message_language=>'sv'
,p_message_text=>'%0 de kommande %1 veckorna'
,p_is_js_message=>true
,p_version_scn=>2705698
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143265108168752643)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.YEARS'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 de kommande %1 \00E5ren')
,p_is_js_message=>true
,p_version_scn=>2705698
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143264471723752642)
,p_name=>'APEX.IG.X.IN_THE_NEXT_DAY'
,p_message_language=>'sv'
,p_message_text=>'%0 den kommande dagen'
,p_is_js_message=>true
,p_version_scn=>2705697
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143264264175752642)
,p_name=>'APEX.IG.X.IN_THE_NEXT_HOUR'
,p_message_language=>'sv'
,p_message_text=>'%0 den kommande timmen'
,p_is_js_message=>true
,p_version_scn=>2705697
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143264005091752642)
,p_name=>'APEX.IG.X.IN_THE_NEXT_MINUTE'
,p_message_language=>'sv'
,p_message_text=>'%0 den kommande minuten'
,p_is_js_message=>true
,p_version_scn=>2705697
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143264886417752643)
,p_name=>'APEX.IG.X.IN_THE_NEXT_MONTH'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 den kommande m\00E5naden')
,p_is_js_message=>true
,p_version_scn=>2705698
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143264676392752642)
,p_name=>'APEX.IG.X.IN_THE_NEXT_WEEK'
,p_message_language=>'sv'
,p_message_text=>'%0 den kommande veckan'
,p_is_js_message=>true
,p_version_scn=>2705697
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143265024946752643)
,p_name=>'APEX.IG.X.IN_THE_NEXT_YEAR'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 det kommande \00E5ret')
,p_is_js_message=>true
,p_version_scn=>2705698
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143260645837752641)
,p_name=>'APEX.IG.X.IS_NOT_NULL'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 \00E4r inte tomt')
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143260516385752641)
,p_name=>'APEX.IG.X.IS_NULL'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 \00E4r tomt')
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143260323653752641)
,p_name=>'APEX.IG.X.LESS_THAN.Y'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 mindre \00E4n %1')
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143260460505752641)
,p_name=>'APEX.IG.X.LESS_THAN_OR_EQUALS.Y'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 mindre \00E4n eller lika med %1')
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143260715519752641)
,p_name=>'APEX.IG.X.LIKE.Y'
,p_message_language=>'sv'
,p_message_text=>'%0 som %1'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143261359546752641)
,p_name=>'APEX.IG.X.MATCHES_REGULAR_EXPRESSION.Y'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 matchar regulj\00E4rt uttryck %1')
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143267280541752643)
,p_name=>'APEX.IG.X.MINUTES_AGO'
,p_message_language=>'sv'
,p_message_text=>'%0 minuter sedan'
,p_is_js_message=>true
,p_version_scn=>2705700
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143261511090752642)
,p_name=>'APEX.IG.X.NOT_BETWEEN.Y.AND.Z'
,p_message_language=>'sv'
,p_message_text=>'%0 inte mellan %1 och %2'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143260032778752641)
,p_name=>'APEX.IG.X.NOT_EQUALS.Y'
,p_message_language=>'sv'
,p_message_text=>'%0 inte lika med %1'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143261003261752641)
,p_name=>'APEX.IG.X.NOT_IN.Y'
,p_message_language=>'sv'
,p_message_text=>'%0 inte i %1'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143263365399752642)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.DAYS'
,p_message_language=>'sv'
,p_message_text=>'%0 inte de senaste %1 dagarna'
,p_is_js_message=>true
,p_version_scn=>2705697
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143263119403752642)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.HOURS'
,p_message_language=>'sv'
,p_message_text=>'%0 inte de senaste %1 timmarna'
,p_is_js_message=>true
,p_version_scn=>2705697
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143262943444752642)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.MINUTES'
,p_message_language=>'sv'
,p_message_text=>'%0 inte de senaste %1 minuterna'
,p_is_js_message=>true
,p_version_scn=>2705697
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143263796890752642)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.MONTHS'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 inte de senaste %1 m\00E5naderna')
,p_is_js_message=>true
,p_version_scn=>2705697
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143263584696752642)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.WEEKS'
,p_message_language=>'sv'
,p_message_text=>'%0 inte de senaste %1 veckorna'
,p_is_js_message=>true
,p_version_scn=>2705697
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143263969270752642)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.YEARS'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 inte de senaste %1 \00E5ren')
,p_is_js_message=>true
,p_version_scn=>2705697
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143263272416752642)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_DAY'
,p_message_language=>'sv'
,p_message_text=>'%0 inte den senaste dagen'
,p_is_js_message=>true
,p_version_scn=>2705697
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143263080660752642)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_HOUR'
,p_message_language=>'sv'
,p_message_text=>'%0 inte den senaste timmen'
,p_is_js_message=>true
,p_version_scn=>2705697
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143262837072752642)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_MINUTE'
,p_message_language=>'sv'
,p_message_text=>'%0 inte den senaste minuten'
,p_is_js_message=>true
,p_version_scn=>2705697
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143263630181752642)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_MONTH'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 inte den senaste m\00E5naden')
,p_is_js_message=>true
,p_version_scn=>2705697
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143263453346752642)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_WEEK'
,p_message_language=>'sv'
,p_message_text=>'%0 inte den senaste veckan'
,p_is_js_message=>true
,p_version_scn=>2705697
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143263823443752642)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_YEAR'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 inte det senaste \00E5ret')
,p_is_js_message=>true
,p_version_scn=>2705697
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143265781336752643)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.DAYS'
,p_message_language=>'sv'
,p_message_text=>'%0 inte de kommande %1 dagarna'
,p_is_js_message=>true
,p_version_scn=>2705698
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143265505222752643)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.HOURS'
,p_message_language=>'sv'
,p_message_text=>'%0 inte de kommande %1 timmarna'
,p_is_js_message=>true
,p_version_scn=>2705698
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143265380556752643)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.MINUTES'
,p_message_language=>'sv'
,p_message_text=>'%0 inte de kommande %1 minuterna'
,p_is_js_message=>true
,p_version_scn=>2705698
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143266146720752643)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.MONTHS'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 inte de kommande %1 m\00E5naderna')
,p_is_js_message=>true
,p_version_scn=>2705700
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143265933909752643)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.WEEKS'
,p_message_language=>'sv'
,p_message_text=>'%0 inte de kommande %1 veckorna'
,p_is_js_message=>true
,p_version_scn=>2705698
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143266362527752643)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.YEARS'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 inte de kommande %1 \00E5ren')
,p_is_js_message=>true
,p_version_scn=>2705700
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143265680327752643)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_DAY'
,p_message_language=>'sv'
,p_message_text=>'%0 inte den kommande dagen'
,p_is_js_message=>true
,p_version_scn=>2705698
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143265413834752643)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_HOUR'
,p_message_language=>'sv'
,p_message_text=>'%0 inte den kommande timmen'
,p_is_js_message=>true
,p_version_scn=>2705698
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143265247183752643)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_MINUTE'
,p_message_language=>'sv'
,p_message_text=>'%0 inte den kommande minuten'
,p_is_js_message=>true
,p_version_scn=>2705698
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143266011306752643)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_MONTH'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 inte den kommande m\00E5naden')
,p_is_js_message=>true
,p_version_scn=>2705698
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143265850452752643)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_WEEK'
,p_message_language=>'sv'
,p_message_text=>'%0 inte den kommande veckan'
,p_is_js_message=>true
,p_version_scn=>2705698
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143266248567752643)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_YEAR'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 inte det kommande \00E5ret')
,p_is_js_message=>true
,p_version_scn=>2705700
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143260816540752641)
,p_name=>'APEX.IG.X.NOT_LIKE.Y'
,p_message_language=>'sv'
,p_message_text=>'%0 inte som %1'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143267701178752643)
,p_name=>'APEX.IG.X.STARTS_WITH.Y'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 b\00F6rjar med %1')
,p_is_js_message=>true
,p_version_scn=>2705700
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143310111556752656)
,p_name=>'APEX.IG.X_COLUMN'
,p_message_language=>'sv'
,p_message_text=>'X'
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143270449534752644)
,p_name=>'APEX.IG.YEARS'
,p_message_language=>'sv'
,p_message_text=>unistr('\00E5r')
,p_is_js_message=>true
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143310239905752656)
,p_name=>'APEX.IG.Y_COLUMN'
,p_message_language=>'sv'
,p_message_text=>'Y'
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143310308754752656)
,p_name=>'APEX.IG.Z_COLUMN'
,p_message_language=>'sv'
,p_message_text=>'Z'
,p_is_js_message=>true
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143319342260752659)
,p_name=>'APEX.IG_FORMAT_SAMPLE_1'
,p_message_language=>'sv'
,p_message_text=>unistr('M\00E5ndag den 12 januari 2016')
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143319447325752659)
,p_name=>'APEX.IG_FORMAT_SAMPLE_2'
,p_message_language=>'sv'
,p_message_text=>'Januari'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143319595742752659)
,p_name=>'APEX.IG_FORMAT_SAMPLE_3'
,p_message_language=>'sv'
,p_message_text=>'16 timmar sedan'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143319633943752659)
,p_name=>'APEX.IG_FORMAT_SAMPLE_4'
,p_message_language=>'sv'
,p_message_text=>'om 16 timmar'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143137643283752605)
,p_name=>'APEX.ITEM.CROPPER.APPLY'
,p_message_language=>'sv'
,p_message_text=>unistr('Till\00E4mpa')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143129649928752602)
,p_name=>'APEX.ITEM.CROPPER.HELP.TEXT'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Dra bilden och anv\00E4nd zoomskjutreglaget f\00F6r att ompositionera den i ramen.</p>'),
'',
unistr('<p>N\00E4r du fokuserar p\00E5 bildbesk\00E4raren \00E4r f\00F6ljande kortkommandon tillg\00E4ngliga:</p>'),
'<ul>',
unistr('    <li>V\00E4nsterpil: Flytta bilden \00E5t v\00E4nster*</li>'),
unistr('    <li>Upp\00E5tpil: Flytta bilden upp\00E5t*</li>'),
unistr('    <li>H\00F6gerpil: Flytta bilden \00E5t h\00F6ger*</li>'),
unistr('    <li>Ned\00E5tpil: Flytta bilden ned\00E5t*</li>'),
'    <li>I: Zooma in</li>',
'    <li>O: Zooma ut</li>',
unistr('    <li>L: Rotera \00E5t v\00E4nster</li>'),
unistr('    <li>R: Rotera \00E5t h\00F6ger</li>'),
'</ul>',
'',
unistr('<p class="margin-top-md"><em>*Tryck l\00E4nge p\00E5 Skift f\00F6r att flytta snabbare</em></p>')))
,p_is_js_message=>true
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143129896991752602)
,p_name=>'APEX.ITEM.CROPPER.HELP.TITLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Hj\00E4lp f\00F6r Besk\00E4r bild')
,p_is_js_message=>true
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143137734907752605)
,p_name=>'APEX.ITEM.CROPPER.RESET'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C5terst\00E4ll')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143130100674752602)
,p_name=>'APEX.ITEM.CROPPER.TITLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Besk\00E4r bild')
,p_is_js_message=>true
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143137871714752605)
,p_name=>'APEX.ITEM.CROPPER.ZOOM_SLIDER_LABEL'
,p_message_language=>'sv'
,p_message_text=>unistr('Dra i skjutreglaget f\00F6r att justera zoomniv\00E5n')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143167479760752613)
,p_name=>'APEX.ITEM.FILE.ACCEPTED_TYPES'
,p_message_language=>'sv'
,p_message_text=>unistr('Ogiltig filtyp. Filtyper som st\00F6ds \00E4r %0.')
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143301845304752654)
,p_name=>'APEX.ITEM.FILE.BROWSE'
,p_message_language=>'sv'
,p_message_text=>unistr('Bl\00E4ddra')
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143301515333752653)
,p_name=>'APEX.ITEM.FILE.CHOOSE_FILE'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4lj fil')
,p_is_js_message=>true
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143301613843752653)
,p_name=>'APEX.ITEM.FILE.CHOOSE_FILES'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4lj filer')
,p_is_js_message=>true
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143167203164752613)
,p_name=>'APEX.ITEM.FILE.DROP_FILE'
,p_message_language=>'sv'
,p_message_text=>unistr('Dra och sl\00E4pp')
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143167698782752614)
,p_name=>'APEX.ITEM.FILE.DROP_FILES'
,p_message_language=>'sv'
,p_message_text=>unistr('Dra och sl\00E4pp filer')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143169007308752614)
,p_name=>'APEX.ITEM.FILE.DROP_OR_CHOOSE_FILE'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4lj en fil eller sl\00E4pp en fil h\00E4r.')
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143169152479752614)
,p_name=>'APEX.ITEM.FILE.DROP_OR_CHOOSE_FILES'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4lj eller sl\00E4pp filer h\00E4r.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143169258180752614)
,p_name=>'APEX.ITEM.FILE.DROP_OR_SELECT_FILE'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4lj en fil eller sl\00E4pp en fil h\00E4r.')
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143169305105752614)
,p_name=>'APEX.ITEM.FILE.DROP_OR_SELECT_FILES'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4lj eller sl\00E4pp filer h\00E4r.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143167596001752613)
,p_name=>'APEX.ITEM.FILE.FILES_WITH_COUNT'
,p_message_language=>'sv'
,p_message_text=>'%0 filer'
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143167358128752613)
,p_name=>'APEX.ITEM.FILE.MAX_FILE_SIZE'
,p_message_language=>'sv'
,p_message_text=>unistr('Filen \00E4r f\00F6r stor. Maxstorleken f\00F6r filer \00E4r %0.')
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143147889067752608)
,p_name=>'APEX.ITEM.FILE.MULTIPLE_FILES_NOT_SUPPORTED'
,p_message_language=>'sv'
,p_message_text=>unistr('Flera filuppladdningar st\00F6ds inte.')
,p_is_js_message=>true
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143130732360752603)
,p_name=>'APEX.ITEM.FILE.REMOVE'
,p_message_language=>'sv'
,p_message_text=>'Flytta bort'
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143136273386752604)
,p_name=>'APEX.ITEM.GEOCODE.ADDRESS_REQUIRED'
,p_message_language=>'sv'
,p_message_text=>unistr('Adress kr\00E4vs.')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143135165860752604)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_CITY'
,p_message_language=>'sv'
,p_message_text=>'Ort'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143135529552752604)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_COUNTRY'
,p_message_language=>'sv'
,p_message_text=>'Landskod'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143135242556752604)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_HOUSENUMBER'
,p_message_language=>'sv'
,p_message_text=>'Husnummer'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143136126228752604)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_LATITUDE'
,p_message_language=>'sv'
,p_message_text=>'Latitud'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143136015718752604)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_LONGITUDE'
,p_message_language=>'sv'
,p_message_text=>'Longitud'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143135966852752604)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_MAPLINK'
,p_message_language=>'sv'
,p_message_text=>unistr('Visa p\00E5 kartan')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143135661531752604)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_MATCHSCORE'
,p_message_language=>'sv'
,p_message_text=>unistr('Po\00E4ng')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143135301772752604)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_POSTALCODE'
,p_message_language=>'sv'
,p_message_text=>'Postnummer'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143135454643752604)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_STATE'
,p_message_language=>'sv'
,p_message_text=>'Region'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143135087840752604)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_STREET'
,p_message_language=>'sv'
,p_message_text=>'Gatuadress'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143134979525752604)
,p_name=>'APEX.ITEM.GEOCODE.DIALOG_TITLE'
,p_message_language=>'sv'
,p_message_text=>'Geokodningsresultat'
,p_is_js_message=>true
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143166443483752613)
,p_name=>'APEX.ITEM.GEOCODE.GEOCODING_DONE'
,p_message_language=>'sv'
,p_message_text=>'Med geokod'
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143166527558752613)
,p_name=>'APEX.ITEM.GEOCODE.GEOCODING_OPEN'
,p_message_language=>'sv'
,p_message_text=>'Utan geokod'
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143135840129752604)
,p_name=>'APEX.ITEM.GEOCODE.MAP_DIALOG_TITLE'
,p_message_language=>'sv'
,p_message_text=>'Karta'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143135709253752604)
,p_name=>'APEX.ITEM.GEOCODE.NO_DATA_FOUND'
,p_message_language=>'sv'
,p_message_text=>'Inga adresser hittades.'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143136300479752604)
,p_name=>'APEX.ITEM.GEOCODE.REQUIRED'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 kr\00E4vs.')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143242559384752636)
,p_name=>'APEX.ITEM.GEOCODE.REQUIRED_MULTIPLE'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 eller %1 \00E4r obligatoriskt.')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143332052162752663)
,p_name=>'APEX.ITEM.HELP_TEXT'
,p_message_language=>'sv'
,p_message_text=>unistr('Visa hj\00E4lptext f\00F6r %0.')
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143138028782752605)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.CHOOSE_FILE'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4lj bild')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143138188877752605)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.CHOOSE_FILES'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4lj bilder')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143137941858752605)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DOWNLOAD_LINK_TEXT'
,p_message_language=>'sv'
,p_message_text=>'Ladda ned'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143138285958752605)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_FILE'
,p_message_language=>'sv'
,p_message_text=>unistr('Dra och sl\00E4pp')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143138357937752605)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_FILES'
,p_message_language=>'sv'
,p_message_text=>unistr('Dra och sl\00E4pp bilder')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143138446721752605)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_CHOOSE_FILE'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4lj en bild eller sl\00E4pp en bild h\00E4r.')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143138547885752605)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_CHOOSE_FILES'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4lj eller sl\00E4pp bilder h\00E4r.')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143138610091752605)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_SELECT_FILE'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4lj en bild eller sl\00E4pp en bild h\00E4r.')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143138732848752605)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_SELECT_FILES'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4lj eller sl\00E4pp bilder h\00E4r.')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143223412540752630)
,p_name=>'APEX.ITEM_TYPE.CHECKBOX.CHECKED'
,p_message_language=>'sv'
,p_message_text=>'Markerad'
,p_is_js_message=>true
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143223502201752630)
,p_name=>'APEX.ITEM_TYPE.CHECKBOX.UNCHECKED'
,p_message_language=>'sv'
,p_message_text=>'Avmarkerad'
,p_is_js_message=>true
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143251065850752638)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.EMPTY_READONLY_COMBOBOX'
,p_message_language=>'sv'
,p_message_text=>'Tom skrivskyddad kombinationsruta'
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143248853001752638)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.EMPTY_READONLY_LISTBOX'
,p_message_language=>'sv'
,p_message_text=>'Tom skrivskyddad listruta'
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143248695703752638)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.READONLY_COMBOBOX'
,p_message_language=>'sv'
,p_message_text=>'Skrivskyddad kombinationsruta'
,p_version_scn=>2705695
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143248717463752638)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.READONLY_LISTBOX'
,p_message_language=>'sv'
,p_message_text=>'Skrivskyddad listruta'
,p_version_scn=>2705695
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143164480948752613)
,p_name=>'APEX.ITEM_TYPE.SLIDER.VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'sv'
,p_message_text=>'#LABEL# ligger inte inom det giltiga intervallet %0 till %1.'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143164548582752613)
,p_name=>'APEX.ITEM_TYPE.SLIDER.VALUE_NOT_MULTIPLE_OF_STEP'
,p_message_language=>'sv'
,p_message_text=>unistr('#LABEL# \00E4r inte en multipel av %0.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143251843767752639)
,p_name=>'APEX.ITEM_TYPE.SWITCH.READONLY_SWITCH'
,p_message_language=>'sv'
,p_message_text=>unistr('Skrivskyddad v\00E4xlare')
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143192488407752621)
,p_name=>'APEX.ITEM_TYPE.TEXT.READONLY_WITH_LINK'
,p_message_language=>'sv'
,p_message_text=>unistr('Redigering av skrivskydd med en l\00E4nk')
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143164083762752612)
,p_name=>'APEX.ITEM_TYPE.YES_NO.INVALID_VALUE'
,p_message_language=>'sv'
,p_message_text=>unistr('#LABEL# m\00E5ste matcha v\00E4rdena %0 och %1.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143164263674752613)
,p_name=>'APEX.ITEM_TYPE.YES_NO.NO_LABEL'
,p_message_language=>'sv'
,p_message_text=>'Nej'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143250564682752638)
,p_name=>'APEX.ITEM_TYPE.YES_NO.OFF_LABEL'
,p_message_language=>'sv'
,p_message_text=>'Av'
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143250619828752638)
,p_name=>'APEX.ITEM_TYPE.YES_NO.ON_LABEL'
,p_message_language=>'sv'
,p_message_text=>unistr('P\00E5')
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143164178810752612)
,p_name=>'APEX.ITEM_TYPE.YES_NO.YES_LABEL'
,p_message_language=>'sv'
,p_message_text=>'Ja'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143172061902752615)
,p_name=>'APEX.LANGUAGE_SELECTOR'
,p_message_language=>'sv'
,p_message_text=>unistr('Spr\00E5kv\00E4ljare')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143108414606752596)
,p_name=>'APEX.LIST_MANAGER.ADD_ENTRY'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00E4gg till post')
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143285233977752649)
,p_name=>'APEX.LIST_MANAGER.BUTTON_ADD'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00E4gg till')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143285382871752649)
,p_name=>'APEX.LIST_MANAGER.BUTTON_REMOVE'
,p_message_language=>'sv'
,p_message_text=>'Flytta bort'
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143108502796752596)
,p_name=>'APEX.LIST_MANAGER.SELECTED_ENTRY'
,p_message_language=>'sv'
,p_message_text=>'Valda poster'
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143289027925752650)
,p_name=>'APEX.LTO.ADVANCED'
,p_message_language=>'sv'
,p_message_text=>'Avancerat'
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143289391814752650)
,p_name=>'APEX.LTO.CANCEL'
,p_message_language=>'sv'
,p_message_text=>'Avbryt'
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143289160909752650)
,p_name=>'APEX.LTO.COMMON'
,p_message_language=>'sv'
,p_message_text=>'Gemensam'
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143289442881752650)
,p_name=>'APEX.LTO.LIVE_TEMPLATE_OPTIONS'
,p_message_language=>'sv'
,p_message_text=>'Aktiva mallalternativ'
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143290086867752650)
,p_name=>'APEX.LTO.NOT_APPLICABLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Mallalternativ \00E4r inte tillg\00E4ngliga eftersom den h\00E4r komponenten inte \00E4r \00E5tergiven p\00E5 sidan.')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143288942122752650)
,p_name=>'APEX.LTO.NO_OPTIONS_FOUND'
,p_message_language=>'sv'
,p_message_text=>'Inga mallalternativ hittades.'
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143289220398752650)
,p_name=>'APEX.LTO.SAVE'
,p_message_language=>'sv'
,p_message_text=>'Spara'
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143143086903752606)
,p_name=>'APEX.MAPS.CLEAR_CIRCLE'
,p_message_language=>'sv'
,p_message_text=>'Rensa cirkel'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143145487549752607)
,p_name=>'APEX.MAPS.CUSTOM_STYLES_INVALID_JSON'
,p_message_language=>'sv'
,p_message_text=>unistr('Anpassade format \00E4r inte giltigt JSON.')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143143336612752606)
,p_name=>'APEX.MAPS.DISTANCE_TOOL'
,p_message_language=>'sv'
,p_message_text=>unistr('Verktyget Avst\00E5nd')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143143119986752606)
,p_name=>'APEX.MAPS.DRAW_CIRCLE'
,p_message_language=>'sv'
,p_message_text=>'Rita cirkel'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143122940565752600)
,p_name=>'APEX.MAPS.FIND_MY_LOCATION'
,p_message_language=>'sv'
,p_message_text=>'Aktuell plats'
,p_is_js_message=>true
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143129347989752602)
,p_name=>'APEX.MAPS.INIT_POINT_COORDINATES_INVALID'
,p_message_language=>'sv'
,p_message_text=>unistr('Koordinaterna f\00F6r inledande position \00E4r ogiltiga.')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143118320737752599)
,p_name=>'APEX.MAPS.INIT_POINT_GEOMETRY_REQUIRED'
,p_message_language=>'sv'
,p_message_text=>unistr('Inledande position m\00E5ste vara en punktgeometri.')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143126904933752601)
,p_name=>'APEX.MAPS.KM'
,p_message_language=>'sv'
,p_message_text=>'km'
,p_is_js_message=>true
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143122137599752600)
,p_name=>'APEX.MAPS.LAYER'
,p_message_language=>'sv'
,p_message_text=>'Skikt'
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143292504592752651)
,p_name=>'APEX.MAPS.LAYER_NAME'
,p_message_language=>'sv'
,p_message_text=>'Skikt: %0'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143141346049752606)
,p_name=>'APEX.MAPS.MAP'
,p_message_language=>'sv'
,p_message_text=>'Mappa'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143111028464752597)
,p_name=>'APEX.MAPS.MAP_MESSAGES'
,p_message_language=>'sv'
,p_message_text=>'Meddelanden'
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143127179821752602)
,p_name=>'APEX.MAPS.MILES'
,p_message_language=>'sv'
,p_message_text=>'engelska mil'
,p_is_js_message=>true
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143291512951752650)
,p_name=>'APEX.MAPS.MORE_DATA_FOUND'
,p_message_language=>'sv'
,p_message_text=>unistr('Data inneh\00E5ller fler \00E4n %0 rader vilket \00F6verskrider det h\00F6gsta till\00E5tna antalet.')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143121417836752600)
,p_name=>'APEX.MAPS.ORACLE_MAP_COPYRIGHT'
,p_message_language=>'sv'
,p_message_text=>unistr('&copy; 2022 Oracle Corporation &nbsp;&nbsp; <a rel="noopener noreferrer" target="_blank" href="https://elocation.oracle.com/elocation/legal.html">Villkor</a> &nbsp;&nbsp; Kartdata &copy; 2021 H\00C4R')
,p_is_js_message=>true
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143118026555752599)
,p_name=>'APEX.MAPS.ORACLE_SDO_GEOMETRY_NOT_AVAILABLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Datatypen SDO_GEOMETRY finns inte i den h\00E4r databasen.')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143121557388752600)
,p_name=>'APEX.MAPS.OSM_MAP_COPYRIGHT'
,p_message_language=>'sv'
,p_message_text=>'<a rel="noopener noreferrer" target="_blank" href="http://openmaptiles.org"> &copy; OpenMapTiles </a> &nbsp; <a rel="noopener noreferrer" target="_blank" href="https://www.openstreetmap.org/copyright"> &copy; OpenStreetMap-medverkande </a>'
,p_is_js_message=>true
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143146147557752607)
,p_name=>'APEX.MAPS.OSM_VECTOR_MAP_COPYRIGHT'
,p_message_language=>'sv'
,p_message_text=>'<a rel="noopener noreferrer" target="blank" href="https://www.maptiler.com/copyright"> &copy; MapTiler</a> &nbsp; <a rel="noopener noreferrer" target="_blank" href="https://www.openstreetmap.org/copyright"> &copy; OpenStreetMap-medverkande </a>'
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143122377650752600)
,p_name=>'APEX.MAPS.POINTS'
,p_message_language=>'sv'
,p_message_text=>'Punkter'
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143292602793752651)
,p_name=>'APEX.MAPS.POINTS_COUNT'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 po\00E4ng')
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143143228400752606)
,p_name=>'APEX.MAPS.RECTANGLE_ZOOM'
,p_message_language=>'sv'
,p_message_text=>unistr('Rektangul\00E4r zoom')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143142968010752606)
,p_name=>'APEX.MAPS.REMOVE_MESSAGE'
,p_message_language=>'sv'
,p_message_text=>'Flytta bort'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143122782384752600)
,p_name=>'APEX.MAPS.RESET_BEARING_TO_NORTH'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C5terst\00E4ll lager till norr')
,p_is_js_message=>true
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143237584743752634)
,p_name=>'APEX.MAPS.TOGGLE_2D_MODE'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4xla till 2D-l\00E4ge')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143237613399752634)
,p_name=>'APEX.MAPS.TOGGLE_3D_MODE'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4xla till 3D-l\00E4ge')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143142813640752606)
,p_name=>'APEX.MAPS.TOGGLE_COPYRIGHT'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4xla copyrightmeddelande')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143143497761752606)
,p_name=>'APEX.MAPS.TOTAL_DISTANCE'
,p_message_language=>'sv'
,p_message_text=>unistr('Hela avst\00E5ndet')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143122400879752600)
,p_name=>'APEX.MAPS.ZOOM_IN'
,p_message_language=>'sv'
,p_message_text=>'Zooma in'
,p_is_js_message=>true
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143122612923752600)
,p_name=>'APEX.MAPS.ZOOM_OUT'
,p_message_language=>'sv'
,p_message_text=>'Zooma ut'
,p_is_js_message=>true
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143287112875752649)
,p_name=>'APEX.MARKDOWN.BOLD'
,p_message_language=>'sv'
,p_message_text=>'Fetstil'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143288070630752649)
,p_name=>'APEX.MARKDOWN.IMAGE'
,p_message_language=>'sv'
,p_message_text=>'Bild'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143287614316752649)
,p_name=>'APEX.MARKDOWN.INLINE_CODE'
,p_message_language=>'sv'
,p_message_text=>'Inline-kod'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143300364945752653)
,p_name=>'APEX.MARKDOWN.INSERT_IMAGE'
,p_message_language=>'sv'
,p_message_text=>'Infoga bild'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143300415804752653)
,p_name=>'APEX.MARKDOWN.INSERT_LINK'
,p_message_language=>'sv'
,p_message_text=>unistr('Infoga l\00E4nk')
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143287291469752649)
,p_name=>'APEX.MARKDOWN.ITALIC'
,p_message_language=>'sv'
,p_message_text=>'Kursiv'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143301064227752653)
,p_name=>'APEX.MARKDOWN.LINK'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00E4nk')
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143287998599752649)
,p_name=>'APEX.MARKDOWN.LIST'
,p_message_language=>'sv'
,p_message_text=>'Lista'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143287832042752649)
,p_name=>'APEX.MARKDOWN.ORDERED_LIST'
,p_message_language=>'sv'
,p_message_text=>'Sorterad lista'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143287362068752649)
,p_name=>'APEX.MARKDOWN.PREVIEW'
,p_message_language=>'sv'
,p_message_text=>unistr('F\00F6rhandsgranska')
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143287487253752649)
,p_name=>'APEX.MARKDOWN.PREVIEW_EMPTY'
,p_message_language=>'sv'
,p_message_text=>unistr('Ingenting att f\00F6rhandsgranska')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143287570345752649)
,p_name=>'APEX.MARKDOWN.STRIKETHROUGH'
,p_message_language=>'sv'
,p_message_text=>'Genomstruken'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143287772274752649)
,p_name=>'APEX.MARKDOWN.UNORDERED_LIST'
,p_message_language=>'sv'
,p_message_text=>'Punktlista'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143266635410752643)
,p_name=>'APEX.MENU.CURRENT_MENU'
,p_message_language=>'sv'
,p_message_text=>'aktuell'
,p_is_js_message=>true
,p_version_scn=>2705700
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143322882335752660)
,p_name=>'APEX.MENU.OVERFLOW_LABEL'
,p_message_language=>'sv'
,p_message_text=>'Mer...'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143266561294752643)
,p_name=>'APEX.MENU.PROCESSING'
,p_message_language=>'sv'
,p_message_text=>'Laddar'
,p_is_js_message=>true
,p_version_scn=>2705700
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143180774945752617)
,p_name=>'APEX.MENU.SPLIT_BUTTON'
,p_message_language=>'sv'
,p_message_text=>'Delningsknapp'
,p_is_js_message=>true
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143180638756752617)
,p_name=>'APEX.MENU.SPLIT_MENU'
,p_message_language=>'sv'
,p_message_text=>'Delad meny'
,p_is_js_message=>true
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143297626210752652)
,p_name=>'APEX.NOTIFICATION_MESSAGE_HEADING'
,p_message_language=>'sv'
,p_message_text=>'Meddelande'
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143121792706752600)
,p_name=>'APEX.NO_DATA_FOUND_ENTITY'
,p_message_language=>'sv'
,p_message_text=>'Hittade inte %0'
,p_is_js_message=>true
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143271670959752645)
,p_name=>'APEX.NUMBER_FIELD.VALUE_GREATER_MAX_VALUE'
,p_message_language=>'sv'
,p_message_text=>unistr('#LABEL# m\00E5ste vara ett tal som \00E4r mindre \00E4n eller lika med %0.')
,p_is_js_message=>true
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143271763538752645)
,p_name=>'APEX.NUMBER_FIELD.VALUE_INVALID'
,p_message_language=>'sv'
,p_message_text=>unistr('#LABEL# m\00E5ste vara ett giltigt tal.')
,p_is_js_message=>true
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143271868150752645)
,p_name=>'APEX.NUMBER_FIELD.VALUE_INVALID2'
,p_message_language=>'sv'
,p_message_text=>'#LABEL# matchar inte talformatet %0 (exempel: %1).'
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143271530689752645)
,p_name=>'APEX.NUMBER_FIELD.VALUE_LESS_MIN_VALUE'
,p_message_language=>'sv'
,p_message_text=>unistr('#LABEL# m\00E5ste vara ett tal som \00E4r st\00F6rre \00E4n eller lika med %0.')
,p_is_js_message=>true
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143271404658752645)
,p_name=>'APEX.NUMBER_FIELD.VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'sv'
,p_message_text=>unistr('#LABEL# m\00E5ste vara ett tal mellan %0 och %1.')
,p_is_js_message=>true
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143266783752752643)
,p_name=>'APEX.OPENS_IN_NEW_WINDOW_LOWER'
,p_message_language=>'sv'
,p_message_text=>unistr('\00F6ppnas i ett nytt f\00F6nster')
,p_version_scn=>2705700
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143216596107752628)
,p_name=>'APEX.PAGE.DUPLICATE_SUBMIT'
,p_message_language=>'sv'
,p_message_text=>'Sidan har redan skickats och kan inte skickas igen.'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143197984186752623)
,p_name=>'APEX.PAGE.NOT_FOUND'
,p_message_language=>'sv'
,p_message_text=>'Applikationen "%0" sidan "%1" hittades inte.'
,p_version_scn=>2705687
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143233461377752633)
,p_name=>'APEX.PAGE_ITEM_IS_REQUIRED'
,p_message_language=>'sv'
,p_message_text=>unistr('#LABEL# m\00E5ste ha ett v\00E4rde.')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143124157673752601)
,p_name=>'APEX.PASSWORD.HIDE_PASSWORD'
,p_message_language=>'sv'
,p_message_text=>unistr('D\00F6lj l\00F6senord')
,p_is_js_message=>true
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143124057294752601)
,p_name=>'APEX.PASSWORD.SHOW_PASSWORD'
,p_message_language=>'sv'
,p_message_text=>unistr('Visa l\00F6senord')
,p_is_js_message=>true
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143171686995752615)
,p_name=>'APEX.POPUP.SEARCH'
,p_message_language=>'sv'
,p_message_text=>unistr('S\00F6k')
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143285678504752649)
,p_name=>'APEX.POPUP_LOV.BUTTON_CLOSE'
,p_message_language=>'sv'
,p_message_text=>unistr('St\00E4ng')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143285545148752649)
,p_name=>'APEX.POPUP_LOV.BUTTON_FIND'
,p_message_language=>'sv'
,p_message_text=>unistr('S\00F6k%0')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143285843393752649)
,p_name=>'APEX.POPUP_LOV.BUTTON_NEXT'
,p_message_language=>'sv'
,p_message_text=>unistr('N\00E4sta')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143285775507752649)
,p_name=>'APEX.POPUP_LOV.BUTTON_PREV'
,p_message_language=>'sv'
,p_message_text=>unistr('F\00F6reg\00E5ende')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143162494347752612)
,p_name=>'APEX.POPUP_LOV.FILTER_REQ'
,p_message_language=>'sv'
,p_message_text=>unistr('Ange en s\00F6kterm med minst %0 tecken.')
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143238785999752635)
,p_name=>'APEX.POPUP_LOV.ICON_TEXT'
,p_message_language=>'sv'
,p_message_text=>unistr('Snabbmeny med v\00E4rden: %0')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143162597920752612)
,p_name=>'APEX.POPUP_LOV.INITIAL_FILTER_REQ'
,p_message_language=>'sv'
,p_message_text=>unistr('Ange en s\00F6kterm.')
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143109593310752596)
,p_name=>'APEX.POPUP_LOV.LIST_OF_VALUES'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4rdelista')
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143162300217752612)
,p_name=>'APEX.POPUP_LOV.NO_RESULTS'
,p_message_language=>'sv'
,p_message_text=>'Inga resultat hittades.'
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143162264158752612)
,p_name=>'APEX.POPUP_LOV.REMOVE_VALUE'
,p_message_language=>'sv'
,p_message_text=>'Flytta bort %0'
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143259450158752641)
,p_name=>'APEX.POPUP_LOV.SEARCH'
,p_message_language=>'sv'
,p_message_text=>unistr('S\00F6kterm')
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143285493361752649)
,p_name=>'APEX.POPUP_LOV.TITLE'
,p_message_language=>'sv'
,p_message_text=>unistr('S\00F6k')
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143111618205752597)
,p_name=>'APEX.PRINT.DOCGEN_REQUIRED'
,p_message_language=>'sv'
,p_message_text=>unistr('Kr\00E4ver %0.')
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143123979564752601)
,p_name=>'APEX.PRINT_REPORT.ERROR'
,p_message_language=>'sv'
,p_message_text=>'Fel vid rapportutskrift.'
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143134758229752604)
,p_name=>'APEX.PRINT_UTIL.UNABLE_TO_PRINT'
,p_message_language=>'sv'
,p_message_text=>'Kan inte skriva ut dokumentet med den konfigurerade utskriftsservern.'
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143157497478752611)
,p_name=>'APEX.PROCESS.INVOKE_API.PARAMETER_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('Ett fel intr\00E4ffade vid utv\00E4rderingen av parametern %0 vid anrop av %1. Mer information finns i felloggen.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143296166604752652)
,p_name=>'APEX.PROCESSING'
,p_message_language=>'sv'
,p_message_text=>'Bearbetar'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143155229882752610)
,p_name=>'APEX.PWA.DIALOG.HIDE.INSTRUCTIONS'
,p_message_language=>'sv'
,p_message_text=>'Tillbaka'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143156307750752610)
,p_name=>'APEX.PWA.DIALOG.INTRO'
,p_message_language=>'sv'
,p_message_text=>unistr('Den h\00E4r webbplatsen har appfunktionalitet. Installera den p\00E5 din enhet f\00F6r den b\00E4sta upplevelsen.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143157633447752611)
,p_name=>'APEX.PWA.DIALOG.SHOW.INSTRUCTIONS'
,p_message_language=>'sv'
,p_message_text=>unistr('N\00E4sta')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143159279796752611)
,p_name=>'APEX.PWA.DIALOG.TITLE'
,p_message_language=>'sv'
,p_message_text=>'Installera appen'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143144004493752607)
,p_name=>'APEX.PWA.INSTRUCTIONS'
,p_message_language=>'sv'
,p_message_text=>unistr('Din enhet eller webbl\00E4sare verkar inte ha st\00F6d f\00F6r installationen av webbappar just nu.')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143139165490752605)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP1'
,p_message_language=>'sv'
,p_message_text=>unistr('1. Tryck p\00E5 ikonen <strong>Dela</strong>')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143139218365752605)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP2'
,p_message_language=>'sv'
,p_message_text=>unistr('2. Rulla ner och tryck p\00E5 <strong>L\00E4gg till p\00E5 hemsidan</strong>')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143155651695752610)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP3'
,p_message_language=>'sv'
,p_message_text=>unistr('3. Tryck p\00E5 <strong style="color:#007AE1;">L\00E4gg till</strong> f\00F6r att bekr\00E4fta')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143154799626752610)
,p_name=>'APEX.PWA.OFFLINE.BODY'
,p_message_language=>'sv'
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
unistr('    <h1>Anslutning kan inte uppr\00E4ttas</h1>'),
unistr('    <p>Det ser ut som om det finns ett n\00E4tverksfel. Kontrollera anslutningen och f\00F6rs\00F6k igen.</p>'),
unistr('    <button type="button">F\00F6rs\00F6k igen</button>'),
'</main>',
'',
'<script>',
'    document.querySelector("button").addEventListener("click", () => {',
'        window.location.reload();',
'    });',
'</script>'))
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143154626499752610)
,p_name=>'APEX.PWA.OFFLINE.TITLE'
,p_message_language=>'sv'
,p_message_text=>'Kan inte ansluta'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143201212514752624)
,p_name=>'APEX.PWA.PUSH.SUBSCRIPTION_FAILED'
,p_message_language=>'sv'
,p_message_text=>unistr('Den h\00E4r enheten kunde inte aktivera pushmeddelanden.')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143206750812752625)
,p_name=>'APEX.QUICK_PICK.GROUP_LABEL'
,p_message_language=>'sv'
,p_message_text=>unistr('Snabbval f\00F6r %0')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143206625867752625)
,p_name=>'APEX.QUICK_PICK.LINK_ROLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Snabbvalsl\00E4nk')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143180411078752617)
,p_name=>'APEX.RADIO.VISUALLY_HIDDEN_RADIO'
,p_message_language=>'sv'
,p_message_text=>'Visuellt dold alternativknapp'
,p_is_js_message=>true
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143124578399752601)
,p_name=>'APEX.RECORD_VIEW.TOOLBAR'
,p_message_language=>'sv'
,p_message_text=>'Enstaka rad-vy'
,p_is_js_message=>true
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143307232254752655)
,p_name=>'APEX.REGION.CSSCALENDAR.ADD'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00E4gg till')
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143252585601752639)
,p_name=>'APEX.REGION.CSSCALENDAR.ALL_DAY'
,p_message_language=>'sv'
,p_message_text=>'Heldag'
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143330148746752662)
,p_name=>'APEX.REGION.CSSCALENDAR.BUTTON.SENDEMAIL'
,p_message_language=>'sv'
,p_message_text=>'Skicka inbjudan'
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143329922264752662)
,p_name=>'APEX.REGION.CSSCALENDAR.CHOOSE_ACTION'
,p_message_language=>'sv'
,p_message_text=>'Alternativ'
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143254318561752639)
,p_name=>'APEX.REGION.CSSCALENDAR.DAILY_ALLDAY'
,p_message_language=>'sv'
,p_message_text=>unistr('Dagvy f\00F6r hela dagen ')
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143254196847752639)
,p_name=>'APEX.REGION.CSSCALENDAR.DAILY_TIME_SPECIFIC'
,p_message_language=>'sv'
,p_message_text=>unistr('Dagvy f\00F6r data med tid ')
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143298365596752652)
,p_name=>'APEX.REGION.CSSCALENDAR.DAY'
,p_message_language=>'sv'
,p_message_text=>'Dag'
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143293310066752651)
,p_name=>'APEX.REGION.CSSCALENDAR.DESCRIPTION'
,p_message_language=>'sv'
,p_message_text=>'Beskrivning'
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143176889667752616)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.CSV'
,p_message_language=>'sv'
,p_message_text=>'CSV'
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143176680116752616)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.ICALENDAR'
,p_message_language=>'sv'
,p_message_text=>'iCal'
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143176560517752616)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.PDF'
,p_message_language=>'sv'
,p_message_text=>'PDF'
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143176732952752616)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.XML'
,p_message_language=>'sv'
,p_message_text=>'XML'
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143176237927752616)
,p_name=>'APEX.REGION.CSSCALENDAR.ENDDATE'
,p_message_language=>'sv'
,p_message_text=>'Slutdatum'
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143176479462752616)
,p_name=>'APEX.REGION.CSSCALENDAR.EVENTNAME'
,p_message_language=>'sv'
,p_message_text=>unistr('H\00E4ndelsenamn')
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143330016894752662)
,p_name=>'APEX.REGION.CSSCALENDAR.INVITATION'
,p_message_language=>'sv'
,p_message_text=>'Inbjudan'
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143298470254752653)
,p_name=>'APEX.REGION.CSSCALENDAR.LIST'
,p_message_language=>'sv'
,p_message_text=>'Lista'
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143298128068752652)
,p_name=>'APEX.REGION.CSSCALENDAR.MONTH'
,p_message_language=>'sv'
,p_message_text=>unistr('M\00E5nad')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143300735434752653)
,p_name=>'APEX.REGION.CSSCALENDAR.NEXT'
,p_message_language=>'sv'
,p_message_text=>unistr('N\00E4sta')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143314796134752658)
,p_name=>'APEX.REGION.CSSCALENDAR.NOEVENTS'
,p_message_language=>'sv'
,p_message_text=>unistr('Inga h\00E4ndelser')
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143330323955752662)
,p_name=>'APEX.REGION.CSSCALENDAR.OPTION.FORM'
,p_message_language=>'sv'
,p_message_text=>unistr('Redigera en befintlig h\00E4ndelse.')
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143330283712752662)
,p_name=>'APEX.REGION.CSSCALENDAR.OPTION.SEND'
,p_message_language=>'sv'
,p_message_text=>'Skickar en inbjudan via e-post.'
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143300823585752653)
,p_name=>'APEX.REGION.CSSCALENDAR.PREVIOUS'
,p_message_language=>'sv'
,p_message_text=>unistr('F\00F6reg\00E5ende')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143308585128752656)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL'
,p_message_language=>'sv'
,p_message_text=>'Skicka e-post'
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143308327551752656)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.BUTTON'
,p_message_language=>'sv'
,p_message_text=>'Skicka e-post'
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143330972054752662)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.DIALOG.REQUIRED'
,p_message_language=>'sv'
,p_message_text=>unistr('Alla f\00E4lt \00E4r obligatoriska.')
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143330841253752662)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.DIALOG.TITLE'
,p_message_language=>'sv'
,p_message_text=>'Skicka inbjudan'
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143329854608752662)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.SUBJECT'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C4mne')
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143308455590752656)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.TO'
,p_message_language=>'sv'
,p_message_text=>'Till'
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143176317565752616)
,p_name=>'APEX.REGION.CSSCALENDAR.STARTDATE'
,p_message_language=>'sv'
,p_message_text=>'Startdatum'
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143306561347752655)
,p_name=>'APEX.REGION.CSSCALENDAR.TABLEFORM'
,p_message_language=>'sv'
,p_message_text=>unistr('Formul\00E4r p\00E5 %0')
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143253912272752639)
,p_name=>'APEX.REGION.CSSCALENDAR.TIME'
,p_message_language=>'sv'
,p_message_text=>'Tid'
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143300981241752653)
,p_name=>'APEX.REGION.CSSCALENDAR.TODAY'
,p_message_language=>'sv'
,p_message_text=>'Idag'
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143298945610752653)
,p_name=>'APEX.REGION.CSSCALENDAR.VIEW'
,p_message_language=>'sv'
,p_message_text=>'Visa'
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143298211199752652)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEK'
,p_message_language=>'sv'
,p_message_text=>'Vecka'
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143254255250752639)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEKLY_ALLDAY'
,p_message_language=>'sv'
,p_message_text=>unistr('Veckovy f\00F6r hela dagen')
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143254081791752639)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEKLY_TIME_SPECIFIC'
,p_message_language=>'sv'
,p_message_text=>unistr('Veckovy f\00F6r data med tid')
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143298866703752653)
,p_name=>'APEX.REGION.CSSCALENDAR.YEAR'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C5r')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143298540678752653)
,p_name=>'APEX.REGION.JQM_COLUMN_TOGGLE.COLUMNS'
,p_message_language=>'sv'
,p_message_text=>'Kolumner...'
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143298675224752653)
,p_name=>'APEX.REGION.JQM_COLUMN_TOGGLE.LOAD_MORE'
,p_message_language=>'sv'
,p_message_text=>'Ladda fler...'
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143228021099752632)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.BACK'
,p_message_language=>'sv'
,p_message_text=>'Tillbaka'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143169543177752614)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.LOAD_MORE'
,p_message_language=>'sv'
,p_message_text=>'Ladda fler...'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143171856032752615)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.SEARCH'
,p_message_language=>'sv'
,p_message_text=>unistr('S\00F6k...')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143298742850752653)
,p_name=>'APEX.REGION.JQM_REFLOW.LOAD_MORE'
,p_message_language=>'sv'
,p_message_text=>'Ladda fler...'
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143300678844752653)
,p_name=>'APEX.REGION.NOT_FOUND'
,p_message_language=>'sv'
,p_message_text=>'Regions-id:t %0 hittades inte.'
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143171725617752615)
,p_name=>'APEX.REGION.NO_DATA_FOUND_MESSAGE'
,p_message_language=>'sv'
,p_message_text=>'Inga data hittades'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143199225573752623)
,p_name=>'APEX.REGION.PAGINATION.RESET_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('Kan inte \00E5terst\00E4lla sidindelning av regioner.')
,p_version_scn=>2705687
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143162913463752612)
,p_name=>'APEX.REGION.PAGINATION.UNHANDLED_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('Fel vid inst\00E4llning av sidindelning f\00F6r regioner.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143292761433752651)
,p_name=>'APEX.REGION.RESPONSIVE_TABLE.COLUMNS'
,p_message_language=>'sv'
,p_message_text=>'Kolumner...'
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143147291562752607)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.LAZY_LOADING_INCOMPATIBLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Lazy-laddning \00E4r inte kompatibelt med platser i %0 som \00E4r en enkel (partiell) region. Du b\00F6r inaktivera lazy-laddning f\00F6r den h\00E4r regionen eller flytta platskomponenterna till en annan region.')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143142529756752606)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.NO_GROUP_TEMPLATE'
,p_message_language=>'sv'
,p_message_text=>unistr('Gruppmall saknas i mallkomponent f\00F6r %0.')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143137576599752605)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.TOO_MANY_ROWS'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 \00E4r en enkel (partiell) region och har returnerat flera rader.')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143300520126752653)
,p_name=>'APEX.REGION.TYPE_NOT_SUPPORTED'
,p_message_language=>'sv'
,p_message_text=>unistr('Regionstypen %0 st\00F6ds inte.')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143162871443752612)
,p_name=>'APEX.REGION.UNHANDLED_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('Fel vid \00E5tergivning av regionen "#COMPONENT_NAME#".')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143233587943752633)
,p_name=>'APEX.REGION_COLUMN_IS_REQUIRED'
,p_message_language=>'sv'
,p_message_text=>unistr('#COLUMN_HEADER# m\00E5ste ha ett v\00E4rde.')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143115150549752598)
,p_name=>'APEX.REPORT_QUERY.LAYOUT_REQUIRED'
,p_message_language=>'sv'
,p_message_text=>unistr('Du m\00E5ste ange en rapportlayout.')
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143329440679752662)
,p_name=>'APEX.RICH_TEXT_EDITOR.ACCESSIBLE_LABEL'
,p_message_language=>'sv'
,p_message_text=>'%0, RTF-redigerare'
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143235671595752634)
,p_name=>'APEX.RICH_TEXT_EDITOR.MAXIMUM_LENGTH_EXCEEDED'
,p_message_language=>'sv'
,p_message_text=>unistr('HTML-markeringen \00F6verskrider objektets maxl\00E4ngd (faktiskt antal %0, till\00E5tet antal %1 tecken)')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143145007245752607)
,p_name=>'APEX.RTE.READ_ONLY_RICH_TEXT_EDITOR'
,p_message_language=>'sv'
,p_message_text=>'Skrivskyddad RTF-redigerare'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143144906969752607)
,p_name=>'APEX.RTE.RICH_TEXT_EDITOR'
,p_message_language=>'sv'
,p_message_text=>'RTF-redigerare'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143144759087752607)
,p_name=>'APEX.RTE.TOOLBAR_ALIGNMENT'
,p_message_language=>'sv'
,p_message_text=>'Justering'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143144822126752607)
,p_name=>'APEX.RTE.TOOLBAR_EXTRAS'
,p_message_language=>'sv'
,p_message_text=>'Extra'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143144506222752607)
,p_name=>'APEX.RTE.TOOLBAR_FONT'
,p_message_language=>'sv'
,p_message_text=>'Teckensnitt'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143144409430752607)
,p_name=>'APEX.RTE.TOOLBAR_FORMATTING'
,p_message_language=>'sv'
,p_message_text=>'Formatering'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143144621444752607)
,p_name=>'APEX.RTE.TOOLBAR_LISTS'
,p_message_language=>'sv'
,p_message_text=>'Listor'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143297722931752652)
,p_name=>'APEX.RV.DELETE'
,p_message_language=>'sv'
,p_message_text=>'Ta bort'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143290282598752650)
,p_name=>'APEX.RV.DUPLICATE'
,p_message_language=>'sv'
,p_message_text=>'Dubblett'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143288512642752650)
,p_name=>'APEX.RV.EXCLUDE_HIDDEN'
,p_message_language=>'sv'
,p_message_text=>'Visade kolumner'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143288437569752650)
,p_name=>'APEX.RV.EXCLUDE_NULL'
,p_message_language=>'sv'
,p_message_text=>unistr('Exkludera nullv\00E4rden')
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143297889532752652)
,p_name=>'APEX.RV.INSERT'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00E4gg till')
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143252199987752639)
,p_name=>'APEX.RV.MOVE_DOWN'
,p_message_language=>'sv'
,p_message_text=>'Flytta ned'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143252215010752639)
,p_name=>'APEX.RV.MOVE_UP'
,p_message_language=>'sv'
,p_message_text=>'Flytta upp'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143288281915752650)
,p_name=>'APEX.RV.NEXT_RECORD'
,p_message_language=>'sv'
,p_message_text=>unistr('N\00E4sta')
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143288802847752650)
,p_name=>'APEX.RV.NOT_GROUPED_LABEL'
,p_message_language=>'sv'
,p_message_text=>unistr('\00D6vriga kolumner')
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143288391833752650)
,p_name=>'APEX.RV.PREV_RECORD'
,p_message_language=>'sv'
,p_message_text=>unistr('F\00F6reg\00E5ende')
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143288618094752650)
,p_name=>'APEX.RV.REC_X'
,p_message_language=>'sv'
,p_message_text=>'Rad %0'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143288725192752650)
,p_name=>'APEX.RV.REC_XY'
,p_message_language=>'sv'
,p_message_text=>'Rad %0 av %1'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143290331230752650)
,p_name=>'APEX.RV.REFRESH'
,p_message_language=>'sv'
,p_message_text=>unistr('F\00F6rnya')
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143290475052752650)
,p_name=>'APEX.RV.REVERT'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C5terst\00E4ll \00E4ndringar')
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143288160457752649)
,p_name=>'APEX.RV.SETTINGS_MENU'
,p_message_language=>'sv'
,p_message_text=>unistr('Inst\00E4llningar')
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143247395434752637)
,p_name=>'APEX.SAMPLE_FORMAT'
,p_message_language=>'sv'
,p_message_text=>'Till exempel %0'
,p_version_scn=>2705695
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143251693447752639)
,p_name=>'APEX.SAMPLE_FORMAT_SHORT'
,p_message_language=>'sv'
,p_message_text=>'Exempel: %0'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143164357169752613)
,p_name=>'APEX.SEARCH.1_RESULT_FOUND'
,p_message_language=>'sv'
,p_message_text=>'1 resultat'
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143161487697752612)
,p_name=>'APEX.SEARCH.N_RESULTS_FOUND'
,p_message_language=>'sv'
,p_message_text=>'%0 resultat'
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143213282623752627)
,p_name=>'APEX.SEARCH.PAGINATION'
,p_message_language=>'sv'
,p_message_text=>'Sidindelning'
,p_is_js_message=>true
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143213331834752627)
,p_name=>'APEX.SEARCH.RESULTS_X_TO_Y'
,p_message_language=>'sv'
,p_message_text=>'Resultatet %0 till %1'
,p_is_js_message=>true
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143109083105752596)
,p_name=>'APEX.SESSION.ALERT.CREATE_NEW'
,p_message_language=>'sv'
,p_message_text=>'Logga in igen'
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143108927416752596)
,p_name=>'APEX.SESSION.ALERT.EXPIRED'
,p_message_language=>'sv'
,p_message_text=>'Sessionen har avslutats'
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143109107280752596)
,p_name=>'APEX.SESSION.ALERT.EXTEND'
,p_message_language=>'sv'
,p_message_text=>unistr('Ut\00F6ka')
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143108718379752596)
,p_name=>'APEX.SESSION.ALERT.IDLE_WARN'
,p_message_language=>'sv'
,p_message_text=>unistr('Sessionen l\00F6per ut den %0. Vill du f\00F6rl\00E4nga den?')
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143108806793752596)
,p_name=>'APEX.SESSION.ALERT.MAX_WARN'
,p_message_language=>'sv'
,p_message_text=>unistr('Din session upph\00F6r den %0 och kan inte f\00F6rl\00E4ngas. Spara ditt arbete nu f\00F6r att inte f\00F6rlora n\00E5gra data.')
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143308108854752656)
,p_name=>'APEX.SESSION.DB_SESSION_CLEANUP.UNHANDLED_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('Fel vid bearbetning av rensningskod f\00F6r databassession.')
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143197845935752623)
,p_name=>'APEX.SESSION.DB_SESSION_INIT.UNHANDLED_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('Fel vid bearbetning av konfigurationskod f\00F6r databassession.')
,p_version_scn=>2705687
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143168278797752614)
,p_name=>'APEX.SESSION.EXPIRED'
,p_message_language=>'sv'
,p_message_text=>'Sessionen har avslutats.'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143307372884752655)
,p_name=>'APEX.SESSION.EXPIRED.CLOSE_DIALOG'
,p_message_language=>'sv'
,p_message_text=>unistr('St\00E4ng dialogrutan och klicka p\00E5 uppdateringsknappen i webbl\00E4saren f\00F6r att starta en ny session.')
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143326202813752661)
,p_name=>'APEX.SESSION.EXPIRED.NEW_SESSION'
,p_message_language=>'sv'
,p_message_text=>unistr('<a href="%0">Logga in</a> igen f\00F6r att skapa en ny version.')
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143210548349752626)
,p_name=>'APEX.SESSION.NOT_VALID'
,p_message_language=>'sv'
,p_message_text=>unistr('Sessionen \00E4r inte giltig')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143253665312752639)
,p_name=>'APEX.SESSION.RAS.NO_DYNAMIC_ROLES'
,p_message_language=>'sv'
,p_message_text=>unistr('Inga dynamiska roller kunde aktiveras i Real Application Security-sessionen f\00F6r anv\00E4ndaren "%0".')
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143195744235752622)
,p_name=>'APEX.SESSION.UNHANDLED_ERROR'
,p_message_language=>'sv'
,p_message_text=>'ERR-99900 Kunde inte skapa unikt sessions-id: %0'
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143124858977752601)
,p_name=>'APEX.SESSION_STATE.CLOB_NOT_ALLOWED'
,p_message_language=>'sv'
,p_message_text=>unistr('Datatypen CLOB f\00F6r sessionstillst\00E5nd \00E4r inte till\00E5ten f\00F6r objektet %0.')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143144290224752607)
,p_name=>'APEX.SESSION_STATE.CLOB_SUBSTITUTION_NOT_ALLOWED'
,p_message_language=>'sv'
,p_message_text=>unistr('Det finns inte st\00F6d f\00F6r att byta ut objekt av datatypen CLOB f\00F6r sessionstillst\00E5nd.')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143213054091752627)
,p_name=>'APEX.SESSION_STATE.ITEM_VALUE_PROTECTION'
,p_message_language=>'sv'
,p_message_text=>unistr('\00D6vertr\00E4delse av skydd av sessionstillst\00E5nd: Det kan ha orsakats av manuell \00E4ndring av det skyddade sidobjektet %0. Om du \00E4r os\00E4ker p\00E5 vad som kan ha orsakat felet kontaktar du applikationsadministrat\00F6ren och ber om hj\00E4lp.')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143334224715752663)
,p_name=>'APEX.SESSION_STATE.PAGE_PROTECTION'
,p_message_language=>'sv'
,p_message_text=>unistr('\00D6vertr\00E4delse av sidskydd: Den kan ha orsakats av att en sida skickats som inte hade laddats klart eller av en manuell \00E4ndring av skyddade sidobjekt. Kontakta applikationsadministrat\00F6ren om du beh\00F6ver mer hj\00E4lp.')
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143333305324752663)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.NO_SPECIAL_CHAR'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 inneh\00E5ller ett av de ogiltiga tecknen &<>"/;,*|=% eller --')
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143333464050752663)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.NO_SPECIAL_CHAR_NL'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 inneh\00E5ller ett eller flera ogiltiga tecken &<>"/;,*|=% eller -- eller en ny rad.')
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143333134227752663)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.US_ONLY'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 inneh\00E5ller ett specialtecken. Endast tecknen A-Z, 0-9 och blanksteg \00E4r till\00E5tna.')
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143333267459752663)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 inneh\00E5ller <, > eller ", vilka \00E4r ogiltiga tecken.')
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143170632968752614)
,p_name=>'APEX.SESSION_STATE.SSP_CHECKSUM_MISSING'
,p_message_language=>'sv'
,p_message_text=>unistr('Ingen kontrollsumma hade angetts f\00F6r att visa bearbetning f\00F6r en sida som kr\00E4ver en kontrollsumma n\00E4r ett eller flera v\00E4rden f\00F6r beg\00E4randen, cacherensning eller argument \00F6verf\00F6rs som parametrar.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143207966952752626)
,p_name=>'APEX.SESSION_STATE.SSP_VIOLATION'
,p_message_language=>'sv'
,p_message_text=>unistr('\00D6vertr\00E4delse av skydd av sessionstillst\00E5nd: Det kan ha orsakats av manuell \00E4ndring av en URL som inneh\00E5ller en kontrollsumma eller anv\00E4ndning av en l\00E4nk med en felaktig eller saknad kontrollsumma. Om du \00E4r os\00E4ker p\00E5 vad som kan ha orsakat felet konta')
||unistr('ktar du applikationsadministrat\00F6ren och ber om hj\00E4lp.')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143289583423752650)
,p_name=>'APEX.SET_HIGH_CONTRAST_MODE_OFF'
,p_message_language=>'sv'
,p_message_text=>unistr('St\00E4ng av h\00F6gkontrastl\00E4ge')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143289625829752650)
,p_name=>'APEX.SET_HIGH_CONTRAST_MODE_ON'
,p_message_language=>'sv'
,p_message_text=>unistr('S\00E4tt p\00E5 h\00F6gkontrastl\00E4ge')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143154042732752610)
,p_name=>'APEX.SET_VALUE_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('Applikationsinst\00E4llningen %0 kan inte uppdateras eftersom den \00E4r prenumererad via en annan applikation.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143204322327752625)
,p_name=>'APEX.SHUTTLE.CONTROL_BOTTOM'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00E4ngst ned')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143204534202752625)
,p_name=>'APEX.SHUTTLE.CONTROL_DOWN'
,p_message_language=>'sv'
,p_message_text=>'Ned'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143204681163752625)
,p_name=>'APEX.SHUTTLE.CONTROL_MOVE'
,p_message_language=>'sv'
,p_message_text=>'Flytta'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143204784387752625)
,p_name=>'APEX.SHUTTLE.CONTROL_MOVE_ALL'
,p_message_language=>'sv'
,p_message_text=>'Flytta alla'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143204801220752625)
,p_name=>'APEX.SHUTTLE.CONTROL_REMOVE'
,p_message_language=>'sv'
,p_message_text=>'Flytta bort'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143204958822752625)
,p_name=>'APEX.SHUTTLE.CONTROL_REMOVE_ALL'
,p_message_language=>'sv'
,p_message_text=>'Ta bort alla'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143205070912752625)
,p_name=>'APEX.SHUTTLE.CONTROL_RESET'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C5terst\00E4ll')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143204264734752624)
,p_name=>'APEX.SHUTTLE.CONTROL_TOP'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00E4ngst upp')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143204479770752625)
,p_name=>'APEX.SHUTTLE.CONTROL_UP'
,p_message_language=>'sv'
,p_message_text=>'Upp'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143316008550752658)
,p_name=>'APEX.SINCE.SHORT.DAYS_AGO'
,p_message_language=>'sv'
,p_message_text=>'%0d'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143316768346752658)
,p_name=>'APEX.SINCE.SHORT.DAYS_FROM_NOW'
,p_message_language=>'sv'
,p_message_text=>'om %0d'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143315925207752658)
,p_name=>'APEX.SINCE.SHORT.HOURS_AGO'
,p_message_language=>'sv'
,p_message_text=>'%0h'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143316853746752658)
,p_name=>'APEX.SINCE.SHORT.HOURS_FROM_NOW'
,p_message_language=>'sv'
,p_message_text=>'om %0h'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143315731155752658)
,p_name=>'APEX.SINCE.SHORT.MINUTES_AGO'
,p_message_language=>'sv'
,p_message_text=>'%0m'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143316927313752658)
,p_name=>'APEX.SINCE.SHORT.MINUTES_FROM_NOW'
,p_message_language=>'sv'
,p_message_text=>'om %0m'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143316390678752658)
,p_name=>'APEX.SINCE.SHORT.MONTHS_AGO'
,p_message_language=>'sv'
,p_message_text=>'%0mo'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143316526667752658)
,p_name=>'APEX.SINCE.SHORT.MONTHS_FROM_NOW'
,p_message_language=>'sv'
,p_message_text=>'om %0mo'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143315862318752658)
,p_name=>'APEX.SINCE.SHORT.SECONDS_AGO'
,p_message_language=>'sv'
,p_message_text=>'%0s'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143316672615752658)
,p_name=>'APEX.SINCE.SHORT.SECONDS_FROM_NOW'
,p_message_language=>'sv'
,p_message_text=>'om %0s'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143316143830752658)
,p_name=>'APEX.SINCE.SHORT.WEEKS_AGO'
,p_message_language=>'sv'
,p_message_text=>'%0w'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143317040314752658)
,p_name=>'APEX.SINCE.SHORT.WEEKS_FROM_NOW'
,p_message_language=>'sv'
,p_message_text=>'om %0w'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143316243330752658)
,p_name=>'APEX.SINCE.SHORT.YEARS_AGO'
,p_message_language=>'sv'
,p_message_text=>'%0y'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143316442895752658)
,p_name=>'APEX.SINCE.SHORT.YEARS_FROM_NOW'
,p_message_language=>'sv'
,p_message_text=>'om %0y'
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143117365737752599)
,p_name=>'APEX.SPATIAL.GEOMETRY.LINE'
,p_message_language=>'sv'
,p_message_text=>'[Rad]'
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143117962568752599)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTILINE'
,p_message_language=>'sv'
,p_message_text=>'[Flera rader]'
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143117680646752599)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTIPOINT'
,p_message_language=>'sv'
,p_message_text=>'[Flera punkter]'
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143118177439752599)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTIPOLYGON'
,p_message_language=>'sv'
,p_message_text=>'[Flera polygoner]'
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143118268810752599)
,p_name=>'APEX.SPATIAL.GEOMETRY.OTHER'
,p_message_language=>'sv'
,p_message_text=>'[Geometriobjekt]'
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143117244178752599)
,p_name=>'APEX.SPATIAL.GEOMETRY.POINT'
,p_message_language=>'sv'
,p_message_text=>'[Punkt (%0,%1)]'
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143117537228752599)
,p_name=>'APEX.SPATIAL.GEOMETRY.POLYGON'
,p_message_language=>'sv'
,p_message_text=>'[Polygon]'
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143116733993752598)
,p_name=>'APEX.SPLITTER.COLLAPSED_REGION'
,p_message_language=>'sv'
,p_message_text=>'Komprimerad region: %0'
,p_is_js_message=>true
,p_version_scn=>2705670
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143231823864752633)
,p_name=>'APEX.SPLITTER.COLLAPSE_TEXT'
,p_message_language=>'sv'
,p_message_text=>'Komprimera'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143115705515752598)
,p_name=>'APEX.SPLITTER.HORIZ_CANNOT_LEFT_RIGHT'
,p_message_language=>'sv'
,p_message_text=>unistr('Horisontellt orienterad delning kan inte flyttas till v\00E4nster eller h\00F6ger')
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143115908124752598)
,p_name=>'APEX.SPLITTER.MAX_SIZE_REACHED'
,p_message_language=>'sv'
,p_message_text=>unistr('Den st\00F6rsta storleken %0 px har uppn\00E5tts')
,p_is_js_message=>true
,p_version_scn=>2705670
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143116969543752599)
,p_name=>'APEX.SPLITTER.MIN_SIZE_REACHED'
,p_message_language=>'sv'
,p_message_text=>unistr('Den minsta storleken %0 px har uppn\00E5tts')
,p_is_js_message=>true
,p_version_scn=>2705670
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143116892394752598)
,p_name=>'APEX.SPLITTER.REGION_IS_COLLAPSED'
,p_message_language=>'sv'
,p_message_text=>'Regionen har komprimerats'
,p_is_js_message=>true
,p_version_scn=>2705670
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143116647517752598)
,p_name=>'APEX.SPLITTER.REGION_IS_RESTORED'
,p_message_language=>'sv'
,p_message_text=>unistr('Regionen har \00E5terst\00E4llts')
,p_is_js_message=>true
,p_version_scn=>2705670
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143116376677752598)
,p_name=>'APEX.SPLITTER.RESIZED_TO'
,p_message_language=>'sv'
,p_message_text=>unistr('Storleken har \00E4ndrats till %0 px')
,p_is_js_message=>true
,p_version_scn=>2705670
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143116527750752598)
,p_name=>'APEX.SPLITTER.RESTORED_REGION'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C5terst\00E4lld region: %0')
,p_is_js_message=>true
,p_version_scn=>2705670
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143231736825752633)
,p_name=>'APEX.SPLITTER.RESTORE_TEXT'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C5terst\00E4ll')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143115814471752598)
,p_name=>'APEX.SPLITTER.VERTICAL_CANNOT_UP_DOWN'
,p_message_language=>'sv'
,p_message_text=>unistr('Vertikalt orienterad delning kan inte flyttas upp\00E5t eller ned\00E5t')
,p_is_js_message=>true
,p_version_scn=>2705670
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143281234156752647)
,p_name=>'APEX.STAR_RATING.CLEAR_RATING'
,p_message_language=>'sv'
,p_message_text=>unistr('Rensa bed\00F6mning')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143271141807752644)
,p_name=>'APEX.STAR_RATING.INVALID_RATING_RANGE'
,p_message_language=>'sv'
,p_message_text=>'%0 ligger inte inom det giltiga intervallet 1 - %1'
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143271241484752644)
,p_name=>'APEX.STAR_RATING.IS_NOT_NUMERIC'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 \00E4r inte numeriskt')
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143267307112752643)
,p_name=>'APEX.SUCCESS_MESSAGE_HEADING'
,p_message_language=>'sv'
,p_message_text=>unistr('Meddelande om utf\00F6rande')
,p_is_js_message=>true
,p_version_scn=>2705700
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143329178240752662)
,p_name=>'APEX.TABS.NEXT'
,p_message_language=>'sv'
,p_message_text=>unistr('N\00E4sta')
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143329035435752662)
,p_name=>'APEX.TABS.PREVIOUS'
,p_message_language=>'sv'
,p_message_text=>unistr('F\00F6reg\00E5ende')
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143239273187752635)
,p_name=>'APEX.TASK.ACTION.DATA_NOT_FOUND'
,p_message_language=>'sv'
,p_message_text=>unistr('Hittade inga registreringssystem som \00E4r associerade med uppgiftsinstansen')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143247581891752637)
,p_name=>'APEX.TASK.ACTION.ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('Exekveringen av uppgifts\00E5tg\00E4rden %0 utf\00F6rdes inte - uppgiften har felaktigt tillst\00E5nd. Kontrollera \00E5tg\00E4rdskoden f\00F6r uppgiften')
,p_version_scn=>2705695
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143127740101752602)
,p_name=>'APEX.TASK.ADD_COMMENT_NOT_AUTHORIZED'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00E4gg till kommentar: Beh\00F6righet saknas')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143127066321752602)
,p_name=>'APEX.TASK.ALREADY_ASSIGNED'
,p_message_language=>'sv'
,p_message_text=>'Uppgiften har redan tilldelats'
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143120489726752600)
,p_name=>'APEX.TASK.ASSIGNED_TO_USER'
,p_message_language=>'sv'
,p_message_text=>'Tilldelad till %0'
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143126781153752601)
,p_name=>'APEX.TASK.CANCEL_TASK_NOT_AUTHORIZED'
,p_message_language=>'sv'
,p_message_text=>unistr('Avbryt uppgift: Beh\00F6righet saknas')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143142373745752606)
,p_name=>'APEX.TASK.CANNOT_REMOVE_OWNER'
,p_message_language=>'sv'
,p_message_text=>unistr('Kan inte ta bort den faktiska \00E4garen av den h\00E4r uppgiften. Delegera uppgiften till en annan deltagare innan du utf\00F6r \00E5tg\00E4rden igen.')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143126323569752601)
,p_name=>'APEX.TASK.CLAIM_TASK_NOT_AUTHORIZED'
,p_message_language=>'sv'
,p_message_text=>unistr('Boka uppgift: Beh\00F6righet saknas')
,p_version_scn=>2705672
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143126475434752601)
,p_name=>'APEX.TASK.COMPLETE_TASK_NOT_AUTHORIZED'
,p_message_language=>'sv'
,p_message_text=>unistr('Slutf\00F6r uppgift: Beh\00F6righet saknas')
,p_version_scn=>2705672
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143126505010752601)
,p_name=>'APEX.TASK.DELEGATE_TASK_NOT_AUTHORIZED'
,p_message_language=>'sv'
,p_message_text=>unistr('Delegera uppgift: Beh\00F6righet saknas')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143124981853752601)
,p_name=>'APEX.TASK.DUE_DATE_IN_PAST'
,p_message_language=>'sv'
,p_message_text=>unistr('Det sista datumet f\00F6r uppgiften f\00E5r inte ha passerat.')
,p_version_scn=>2705672
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143120282747752599)
,p_name=>'APEX.TASK.DUE_SINCE'
,p_message_language=>'sv'
,p_message_text=>unistr('F\00F6rfaller %0')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143120662938752600)
,p_name=>'APEX.TASK.EVENT.ACTION.ERROR_MESSAGE'
,p_message_language=>'sv'
,p_message_text=>unistr('Uppgifts\00E5tg\00E4rden %1 utf\00F6rdes inte. Felmeddelande: %0')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143120337664752600)
,p_name=>'APEX.TASK.EVENT.ACTION.FAILURE'
,p_message_language=>'sv'
,p_message_text=>unistr('Utf\00F6rdes inte')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143119944043752599)
,p_name=>'APEX.TASK.EVENT.ACTION.SUCCESS'
,p_message_language=>'sv'
,p_message_text=>unistr('Utf\00F6rd')
,p_is_js_message=>true
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143120153557752599)
,p_name=>'APEX.TASK.EVENT.ACTION.SUCCESS_MESSAGE'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C5tg\00E4rden %1 utf\00F6rdes med meddelandet %0')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143123487187752600)
,p_name=>'APEX.TASK.EVENT.BEFORE_EXPIRE'
,p_message_language=>'sv'
,p_message_text=>unistr('Innan upph\00F6rande')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143149008870752608)
,p_name=>'APEX.TASK.EVENT.CANCEL'
,p_message_language=>'sv'
,p_message_text=>'Avbryt'
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143148589910752608)
,p_name=>'APEX.TASK.EVENT.CANCEL_MESSAGE'
,p_message_language=>'sv'
,p_message_text=>'Uppgiften har avbrutits'
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143149101597752608)
,p_name=>'APEX.TASK.EVENT.CANCEL_NOT_ALLOWED'
,p_message_language=>'sv'
,p_message_text=>unistr('Deltagaren \00E4r inte till\00E5ten att avbryta uppgiften')
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143148453113752608)
,p_name=>'APEX.TASK.EVENT.CLAIM'
,p_message_language=>'sv'
,p_message_text=>'Boka'
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143148807986752608)
,p_name=>'APEX.TASK.EVENT.CLAIM_ALREADY_CLAIMED'
,p_message_language=>'sv'
,p_message_text=>unistr('Uppgiften \00E4r redan bokad av en annan anv\00E4ndare eller s\00E5 \00E4r deltagaren inte ber\00E4ttigad att boka den h\00E4r uppgiften')
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143148676465752608)
,p_name=>'APEX.TASK.EVENT.CLAIM_MESSAGE'
,p_message_language=>'sv'
,p_message_text=>'Uppgiften har bokats av %0'
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143249776601752638)
,p_name=>'APEX.TASK.EVENT.COMPLETE'
,p_message_language=>'sv'
,p_message_text=>unistr('Slutf\00F6r')
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143148201249752608)
,p_name=>'APEX.TASK.EVENT.COMPLETE_MESSAGE'
,p_message_language=>'sv'
,p_message_text=>unistr('Uppgiften slutf\00F6rdes med resultatet %0')
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143149545310752608)
,p_name=>'APEX.TASK.EVENT.COMPLETE_NOT_ALLOWED'
,p_message_language=>'sv'
,p_message_text=>unistr('Antingen \00E4r uppgiften inte tilldelad eller s\00E5 \00E4r deltagaren inte till\00E5ten att slutf\00F6ra uppgiften')
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143109987384752596)
,p_name=>'APEX.TASK.EVENT.COMPLETE_NO_OUTCOME'
,p_message_language=>'sv'
,p_message_text=>unistr('Uppgiften slutf\00F6rdes utan resultat')
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143249835549752638)
,p_name=>'APEX.TASK.EVENT.CREATE'
,p_message_language=>'sv'
,p_message_text=>'Skapa'
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143142711746752606)
,p_name=>'APEX.TASK.EVENT.CREATE_MESSAGE'
,p_message_language=>'sv'
,p_message_text=>'Uppgiften skapades med id:t %0'
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143249958000752638)
,p_name=>'APEX.TASK.EVENT.DELEGATE'
,p_message_language=>'sv'
,p_message_text=>'Delegera'
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143148378349752608)
,p_name=>'APEX.TASK.EVENT.DELEGATE_MESSAGE'
,p_message_language=>'sv'
,p_message_text=>unistr('Uppgiften har delegerats till den potentiella \00E4garen %0')
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143148923300752608)
,p_name=>'APEX.TASK.EVENT.DELEGATE_NOT_ALLOWED'
,p_message_language=>'sv'
,p_message_text=>unistr('Deltagaren \00E4r inte ber\00E4ttigad eller s\00E5 \00E4r den nya deltagaren inte en potentiell \00E4gare av uppgiften')
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143122009585752600)
,p_name=>'APEX.TASK.EVENT.EXPIRE'
,p_message_language=>'sv'
,p_message_text=>unistr('Upph\00F6r')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143123122186752600)
,p_name=>'APEX.TASK.EVENT.EXPIRED_MESSAGE'
,p_message_language=>'sv'
,p_message_text=>unistr('Uppgiften har upph\00F6rt.')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143250085262752638)
,p_name=>'APEX.TASK.EVENT.FAIL'
,p_message_language=>'sv'
,p_message_text=>unistr('Utf\00F6r inte')
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143118795893752599)
,p_name=>'APEX.TASK.EVENT.INFO_REQUEST.NOT_ALLOWED'
,p_message_language=>'sv'
,p_message_text=>unistr('Antingen \00E4r uppgiften inte tilldelad eller s\00E5 \00E4r deltagaren inte till\00E5ten att beg\00E4ra information om uppgiften')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143118990713752599)
,p_name=>'APEX.TASK.EVENT.INFO_SUBMIT.NOT_ALLOWED'
,p_message_language=>'sv'
,p_message_text=>unistr('Antingen har ingen information beg\00E4rts om uppgiften eller s\00E5 \00E4r deltagaren inte till\00E5ten att skicka information om uppgiften.')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143122513024752600)
,p_name=>'APEX.TASK.EVENT.MAXRENEW_EXPIRED_MESSAGE'
,p_message_language=>'sv'
,p_message_text=>unistr('Uppgiften har upph\00F6rt eftersom det h\00F6gsta f\00F6rnyelseantalet p\00E5 %0 har n\00E5tts.')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143149849523752608)
,p_name=>'APEX.TASK.EVENT.NOT_ALLOWED_BUSINESS_ADMIN'
,p_message_language=>'sv'
,p_message_text=>unistr('Uppgiften \00E4r i fel tillst\00E5nd eller s\00E5 \00E4r deltagaren inte en aff\00E4rsadministrat\00F6r f\00F6r uppgiften')
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143149938479752608)
,p_name=>'APEX.TASK.EVENT.NOT_APPLICABLE'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C5tg\00E4rden %0 \00E4r ok\00E4nd eller inte till\00E4mplig f\00F6r uppgiften')
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143250121483752638)
,p_name=>'APEX.TASK.EVENT.RELEASE'
,p_message_language=>'sv'
,p_message_text=>unistr('Frisl\00E4pp')
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143235863036752634)
,p_name=>'APEX.TASK.EVENT.RELEASE_MESSAGE'
,p_message_language=>'sv'
,p_message_text=>unistr('Uppgiften har frisl\00E4ppts och kan nu bokas av andra')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143128772645752602)
,p_name=>'APEX.TASK.EVENT.RELEASE_NOT_ALLOWED'
,p_message_language=>'sv'
,p_message_text=>unistr('Frisl\00E4ppning av uppgift \00E4r inte till\00E5ten - anv\00E4ndaren \00E4ger inte uppgiften')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143145735010752607)
,p_name=>'APEX.TASK.EVENT.REMOVE_OWNER'
,p_message_language=>'sv'
,p_message_text=>unistr('Ta bort \00E4gare')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143145989598752607)
,p_name=>'APEX.TASK.EVENT.REMOVE_OWNER_MESSAGE'
,p_message_language=>'sv'
,p_message_text=>unistr('Deltagaren %0 har tagits bort fr\00E5n uppgiften')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143123359273752600)
,p_name=>'APEX.TASK.EVENT.RENEW'
,p_message_language=>'sv'
,p_message_text=>unistr('F\00F6rnya')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143122262903752600)
,p_name=>'APEX.TASK.EVENT.RENEW_EXPIRED_MESSAGE'
,p_message_language=>'sv'
,p_message_text=>unistr('Uppgiften har f\00F6rnyats med id:t %0. Det h\00F6gsta antalet kvarvarande f\00F6rnyelser innan upph\00F6randet \00E4r %1.')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143123288350752600)
,p_name=>'APEX.TASK.EVENT.RENEW_MESSAGE'
,p_message_language=>'sv'
,p_message_text=>unistr('Uppgifts-id:t %0 har f\00F6rnyats med uppgifts-id:t %1')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143119231134752599)
,p_name=>'APEX.TASK.EVENT.REQUEST_INFO'
,p_message_language=>'sv'
,p_message_text=>unistr('Beg\00E4ran om information')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143119113075752599)
,p_name=>'APEX.TASK.EVENT.REQUEST_INFO_MESSAGE'
,p_message_language=>'sv'
,p_message_text=>unistr('Beg\00E4rde %0 f\00F6r mer information: %1')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143117022925752599)
,p_name=>'APEX.TASK.EVENT.SET_INITIATOR_CAN_COMPLETE_MESSAGE'
,p_message_language=>'sv'
,p_message_text=>unistr('Angiven upphovsman kan slutf\00F6ra till %0')
,p_version_scn=>2705670
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143119310388752599)
,p_name=>'APEX.TASK.EVENT.SUBMIT_INFO'
,p_message_language=>'sv'
,p_message_text=>'Skicka information'
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143119080010752599)
,p_name=>'APEX.TASK.EVENT.SUBMIT_INFO_MESSAGE'
,p_message_language=>'sv'
,p_message_text=>unistr('Beg\00E4rd information har skickats till %0: %1')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143250242363752638)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT'
,p_message_language=>'sv'
,p_message_text=>'Uppdatera kommentar'
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143146721384752607)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT_MESSAGE'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00E4gg till kommentar: %0')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143149621415752608)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT_NOT_ALLOWED'
,p_message_language=>'sv'
,p_message_text=>unistr('Uppgiftstillst\00E5ndet till\00E5ter inga kommentarer')
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143156990783752610)
,p_name=>'APEX.TASK.EVENT.UPDATE_DUE_DATE_MESSAGE'
,p_message_language=>'sv'
,p_message_text=>unistr('Ange det sista datumet %0 f\00F6r \00E5tg\00E4rden')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143115085873752598)
,p_name=>'APEX.TASK.EVENT.UPDATE_DUE_ON'
,p_message_language=>'sv'
,p_message_text=>unistr('Sista datum f\00F6r uppdatering')
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143250368348752638)
,p_name=>'APEX.TASK.EVENT.UPDATE_OWNER'
,p_message_language=>'sv'
,p_message_text=>unistr('Uppdatera \00E4gare')
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143148069848752608)
,p_name=>'APEX.TASK.EVENT.UPDATE_OWNER_MESSAGE'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00E4gg till den potentiella \00E4garen %0 till uppgiftsdeltagarna')
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143147160225752607)
,p_name=>'APEX.TASK.EVENT.UPDATE_PARAM'
,p_message_language=>'sv'
,p_message_text=>'Uppdatera parametrar'
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143250457836752638)
,p_name=>'APEX.TASK.EVENT.UPDATE_PRIORITY'
,p_message_language=>'sv'
,p_message_text=>'Uppdatera prioritet'
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143148789350752608)
,p_name=>'APEX.TASK.EVENT.UPDATE_PRIORITY_MESSAGE'
,p_message_language=>'sv'
,p_message_text=>'Ange uppgiftsprioriteten till %0'
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143146055429752607)
,p_name=>'APEX.TASK.EVENT.UPD_PARAMETER_MESSAGE'
,p_message_language=>'sv'
,p_message_text=>unistr('Uppdaterade parametern %0 fr\00E5n %1 till %2.')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143129547074752602)
,p_name=>'APEX.TASK.EVENT.WF_CANCEL_MESSAGE'
,p_message_language=>'sv'
,p_message_text=>unistr('Uppgiften har avbrutits eftersom motsvarande arbetsfl\00F6desinstans har avslutats.')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143126699501752601)
,p_name=>'APEX.TASK.FORWARD_TASK_NOT_AUTHORIZED'
,p_message_language=>'sv'
,p_message_text=>unistr('Vidarebefordra uppgift: Beh\00F6righet saknas')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143120083927752599)
,p_name=>'APEX.TASK.INITIATED_BY_USER_SINCE'
,p_message_language=>'sv'
,p_message_text=>'Initierad av %0 %1'
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143128990390752602)
,p_name=>'APEX.TASK.INTERNAL_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('Ett ov\00E4ntat internt fel har intr\00E4ffat')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143127252193752602)
,p_name=>'APEX.TASK.NOT_APPLICABLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Uppgifts\00E5tg\00E4rden \00E4r inte till\00E4mplig')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143152815742752609)
,p_name=>'APEX.TASK.NO_POTENTIAL_OWNER'
,p_message_language=>'sv'
,p_message_text=>unistr('Den potentiella \00E4garen finns inte.')
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143128586736752602)
,p_name=>'APEX.TASK.OUTCOME.APPROVED'
,p_message_language=>'sv'
,p_message_text=>unistr('Godk\00E4nd')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143128677907752602)
,p_name=>'APEX.TASK.OUTCOME.REJECTED'
,p_message_language=>'sv'
,p_message_text=>'Avslagen'
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143110008535752596)
,p_name=>'APEX.TASK.OUTCOME_MISSING'
,p_message_language=>'sv'
,p_message_text=>unistr('Slutf\00F6randet av uppgiften kr\00E4ver ett resultat')
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143110212089752597)
,p_name=>'APEX.TASK.OUTCOME_NOT_ALLOWED'
,p_message_language=>'sv'
,p_message_text=>unistr('Uppgiften f\00E5r inte ha ett resultat')
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143145841604752607)
,p_name=>'APEX.TASK.PARAM_NOT_UPDATABLE'
,p_message_language=>'sv'
,p_message_text=>'Kan inte uppdatera parametern %0.'
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143142116482752606)
,p_name=>'APEX.TASK.PARTICIPANT_EXISTS'
,p_message_language=>'sv'
,p_message_text=>unistr('Deltagaren finns redan f\00F6r den h\00E4r uppgiftsinstansen.')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143243678827752636)
,p_name=>'APEX.TASK.PRIORITY.1'
,p_message_language=>'sv'
,p_message_text=>unistr('Br\00E5dskande')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143120742786752600)
,p_name=>'APEX.TASK.PRIORITY.1.DESCRIPTION'
,p_message_language=>'sv'
,p_message_text=>unistr('Br\00E5dskande')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143243581411752636)
,p_name=>'APEX.TASK.PRIORITY.2'
,p_message_language=>'sv'
,p_message_text=>unistr('H\00F6g')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143120873588752600)
,p_name=>'APEX.TASK.PRIORITY.2.DESCRIPTION'
,p_message_language=>'sv'
,p_message_text=>unistr('H\00F6g prioritet')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143243440685752636)
,p_name=>'APEX.TASK.PRIORITY.3'
,p_message_language=>'sv'
,p_message_text=>'Medel'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143120934396752600)
,p_name=>'APEX.TASK.PRIORITY.3.DESCRIPTION'
,p_message_language=>'sv'
,p_message_text=>unistr('Medelh\00F6g prioritet')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143243378698752636)
,p_name=>'APEX.TASK.PRIORITY.4'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00E5g')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143121065323752600)
,p_name=>'APEX.TASK.PRIORITY.4.DESCRIPTION'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00E5g prioritet')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143243273327752636)
,p_name=>'APEX.TASK.PRIORITY.5'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00E4gsta')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143121141237752600)
,p_name=>'APEX.TASK.PRIORITY.5.DESCRIPTION'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00E4gsta prioritet')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143126851747752601)
,p_name=>'APEX.TASK.SET_PRIORITY_NOT_AUTHORIZED'
,p_message_language=>'sv'
,p_message_text=>unistr('Ange uppgiftsprioritet: Beh\00F6righet saknas')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143128007997752602)
,p_name=>'APEX.TASK.STATE.ASSIGNED'
,p_message_language=>'sv'
,p_message_text=>'Tilldelad'
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143128432128752602)
,p_name=>'APEX.TASK.STATE.CANCELLED'
,p_message_language=>'sv'
,p_message_text=>'Avbruten'
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143128126434752602)
,p_name=>'APEX.TASK.STATE.COMPLETED'
,p_message_language=>'sv'
,p_message_text=>unistr('Slutf\00F6rd')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143128385970752602)
,p_name=>'APEX.TASK.STATE.ERRORED'
,p_message_language=>'sv'
,p_message_text=>'Felaktig'
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143121890287752600)
,p_name=>'APEX.TASK.STATE.EXPIRED'
,p_message_language=>'sv'
,p_message_text=>unistr('Utg\00E5ngen')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143128232466752602)
,p_name=>'APEX.TASK.STATE.FAILED'
,p_message_language=>'sv'
,p_message_text=>unistr('Utf\00F6rdes inte')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143118596413752599)
,p_name=>'APEX.TASK.STATE.INFO_REQUESTED'
,p_message_language=>'sv'
,p_message_text=>unistr('Information beg\00E4rd')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143127921263752602)
,p_name=>'APEX.TASK.STATE.UNASSIGNED'
,p_message_language=>'sv'
,p_message_text=>'Inte tilldelad'
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143150306636752608)
,p_name=>'APEX.TASK.TASK_CREATE_ERROR'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('En ny uppgift f\00F6r uppgiftsdefinitionen %0 i applikationen %1 skapades inte.'),
'SQLCODE: %2'))
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143150282449752608)
,p_name=>'APEX.TASK.TASK_CREATE_NO_POTENTIAL_OWNER'
,p_message_language=>'sv'
,p_message_text=>unistr('Ett f\00F6rs\00F6k att skapa en uppgift f\00F6r uppgiftsdefinitionen %0 i applikationen %1 utf\00F6rdes inte eftersom uppgiftsdefinitionen inte inneh\00E5ller n\00E5gra potentiella \00E4gare - redigera uppgiftsdefinitionen och l\00E4gg till \00E5tminstone en deltagare av typen Potentie')
||unistr('ll \00E4gare')
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143127520731752602)
,p_name=>'APEX.TASK.TASK_DEFINITION_NOT_FOUND'
,p_message_language=>'sv'
,p_message_text=>'Hittade ingen uppgiftsdefinition'
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143127448278752602)
,p_name=>'APEX.TASK.TASK_DEF_PARTICIPANTS_NOT_FOUND'
,p_message_language=>'sv'
,p_message_text=>unistr('Deltagare hittades inte f\00F6r uppgiften')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143128887596752602)
,p_name=>'APEX.TASK.TASK_ID_PK_VIOLATION'
,p_message_language=>'sv'
,p_message_text=>unistr('Mer \00E4n en uppgift f\00F6r angivet uppgifts-id - kontakta databasadministrat\00F6ren')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143127605418752602)
,p_name=>'APEX.TASK.TASK_NOT_FOUND'
,p_message_language=>'sv'
,p_message_text=>'Uppgiften hittades inte'
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143127392373752602)
,p_name=>'APEX.TASK.TASK_PARAMETER_NOT_FOUND'
,p_message_language=>'sv'
,p_message_text=>'Hittade inte uppgiftsparametern'
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143163637927752612)
,p_name=>'APEX.TASK.TYPE.ACTION'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C5tg\00E4rd')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143163555273752612)
,p_name=>'APEX.TASK.TYPE.APPROVAL'
,p_message_language=>'sv'
,p_message_text=>unistr('Godk\00E4nnande')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143110953907752597)
,p_name=>'APEX.TASK.VACATION_RULE_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('Proceduren %2 f\00F6r semesterregler kunde inte utf\00F6ras f\00F6r uppgiftsdefinitionen %0 i applikationen %1.')
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143111181517752597)
,p_name=>'APEX.TASK.VACATION_RULE_MESSAGE'
,p_message_language=>'sv'
,p_message_text=>unistr('Deltagaren %1 lades till i st\00E4llet f\00F6r deltagaren %0. Anledning: %2.')
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143314823754752658)
,p_name=>'APEX.TB.TOOLBAR'
,p_message_language=>'sv'
,p_message_text=>unistr('Verktygsf\00E4lt')
,p_is_js_message=>true
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143168335412752614)
,p_name=>'APEX.TEMPLATE.APPLICATION'
,p_message_language=>'sv'
,p_message_text=>'Applikation'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143329590667752662)
,p_name=>'APEX.TEMPLATE.EXPAND_COLLAPSE_NAV_LABEL'
,p_message_language=>'sv'
,p_message_text=>'Expandera/komprimera navigering'
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143329647027752662)
,p_name=>'APEX.TEMPLATE.EXPAND_COLLAPSE_SIDE_COL_LABEL'
,p_message_language=>'sv'
,p_message_text=>'Expandera/komprimera sidkolumn'
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143238043038752634)
,p_name=>'APEX.TEMPLATE.MAIN_NAV_LABEL'
,p_message_language=>'sv'
,p_message_text=>'Huvudnavigering'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143138814326752605)
,p_name=>'APEX.TEMPLATE_DIRECTIVE.INVALID_PLACEHOLDER_NAME'
,p_message_language=>'sv'
,p_message_text=>unistr('"%0" \00E4r ett ogiltigt platsh\00E5llarnamn.')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143245789584752637)
,p_name=>'APEX.TIME.DAY'
,p_message_language=>'sv'
,p_message_text=>'1 dag'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143245583087752637)
,p_name=>'APEX.TIME.HOUR'
,p_message_language=>'sv'
,p_message_text=>'1 timme'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143245831632752637)
,p_name=>'APEX.TIME.N_DAYS'
,p_message_language=>'sv'
,p_message_text=>'%0 dagar'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143245686001752637)
,p_name=>'APEX.TIME.N_HOURS'
,p_message_language=>'sv'
,p_message_text=>'%0 timmar'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143245411944752637)
,p_name=>'APEX.TIME.N_MINUTES'
,p_message_language=>'sv'
,p_message_text=>'%0 minuter'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143246094008752637)
,p_name=>'APEX.TIME.N_WEEKS'
,p_message_language=>'sv'
,p_message_text=>'%0 veckor'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143245985534752637)
,p_name=>'APEX.TIME.WEEK'
,p_message_language=>'sv'
,p_message_text=>'1 vecka'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143143790715752606)
,p_name=>'APEX.TMV.SELECTION_COUNT'
,p_message_language=>'sv'
,p_message_text=>'%0 objekt har valts'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143143931338752606)
,p_name=>'APEX.TMV.SELECTOR_LABEL'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4lj objekt')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143143860344752606)
,p_name=>'APEX.TMV.SELECTOR_LABEL_1'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4lj %0')
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143332605551752663)
,p_name=>'APEX.UI.BACK_TO_TOP'
,p_message_language=>'sv'
,p_message_text=>unistr('B\00F6rjan av sida')
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143190207789752620)
,p_name=>'APEX.UI.ENABLED'
,p_message_language=>'sv'
,p_message_text=>'Aktiv'
,p_is_js_message=>true
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143158770082752611)
,p_name=>'APEX.UNHANDLED_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('Fel vid bearbetning av beg\00E4ran.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143144319249752607)
,p_name=>'APEX.UPDATE_MESSAGE_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('Textmeddelandet %0 kan inte uppdateras efter det \00E4r prenumererat via en annan applikation.')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143247436239752637)
,p_name=>'APEX.VALUE_REQUIRED'
,p_message_language=>'sv'
,p_message_text=>unistr('Ett v\00E4rde m\00E5ste anges')
,p_version_scn=>2705695
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143163873804752612)
,p_name=>'APEX.VISUALLY_HIDDEN_HEADING'
,p_message_language=>'sv'
,p_message_text=>unistr('Rubrikniv\00E5 %0, g\00F6md')
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143292236226752651)
,p_name=>'APEX.WARN_ON_UNSAVED_CHANGES'
,p_message_language=>'sv'
,p_message_text=>unistr('Det finns \00E4ndringar f\00F6r sidan som inte har sparats.')
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143153841768752609)
,p_name=>'APEX.WF.NAVIGATOR'
,p_message_language=>'sv'
,p_message_text=>'Navigator'
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143153554787752609)
,p_name=>'APEX.WF.ZOOM_IN'
,p_message_language=>'sv'
,p_message_text=>'Zooma in'
,p_is_js_message=>true
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143154535952752610)
,p_name=>'APEX.WF.ZOOM_LEVEL'
,p_message_language=>'sv'
,p_message_text=>unistr('Zoomniv\00E5 {0} %')
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143153685220752609)
,p_name=>'APEX.WF.ZOOM_OUT'
,p_message_language=>'sv'
,p_message_text=>'Zooma ut'
,p_is_js_message=>true
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143153782863752609)
,p_name=>'APEX.WF.ZOOM_RESET'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C5terst\00E4ll zoom')
,p_is_js_message=>true
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143129206041752602)
,p_name=>'APEX.WF_DIAGRAM.ARIA_DESC'
,p_message_language=>'sv'
,p_message_text=>unistr('Diagrammet f\00F6r arbetsfl\00F6det g\00E5r inte att komma \00E5t just nu.')
,p_is_js_message=>true
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143129168938752602)
,p_name=>'APEX.WF_DIAGRAM.ARIA_LABEL'
,p_message_language=>'sv'
,p_message_text=>unistr('Diagram f\00F6r arbetsfl\00F6de')
,p_is_js_message=>true
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143131029024752603)
,p_name=>'APEX.WORKFLOW.ACTION_NOT_ALLOWED'
,p_message_language=>'sv'
,p_message_text=>unistr('Arbetsfl\00F6desinstansen %0 \00E4r f\00F6r n\00E4rvarande i l\00E4get %1. D\00E4rf\00F6r till\00E5ts inte \00E5tg\00E4rden')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143133692969752603)
,p_name=>'APEX.WORKFLOW.ACTIVITY.COMPLETED'
,p_message_language=>'sv'
,p_message_text=>unistr('Instansen %1 f\00F6r aktiviteten %2 i arbetsfl\00F6det %0 har slutf\00F6rts')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143133446165752603)
,p_name=>'APEX.WORKFLOW.ACTIVITY.CREATED'
,p_message_language=>'sv'
,p_message_text=>unistr('Skapade den nya instansen %1 f\00F6r aktiviteten%2 i arbetsfl\00F6det%0')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143125233298752601)
,p_name=>'APEX.WORKFLOW.ACTIVITY.DATA_NOT_FOUND'
,p_message_language=>'sv'
,p_message_text=>unistr('Hittade ingen ytterligare datarad som \00E4r associerad med instansen f\00F6r arbetsfl\00F6desaktiviteten')
,p_version_scn=>2705672
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143133511493752603)
,p_name=>'APEX.WORKFLOW.ACTIVITY.RETRIED'
,p_message_language=>'sv'
,p_message_text=>unistr('Instansen %1 med fel f\00F6r aktiviteten %2 i arbetsfl\00F6det %0 har ompr\00F6vats')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143115509520752598)
,p_name=>'APEX.WORKFLOW.ACTIVITY.TERMINATED'
,p_message_language=>'sv'
,p_message_text=>unistr('Aktivitetsinstansen %1 i arbetsfl\00F6det %0 har avslutats')
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143149302306752608)
,p_name=>'APEX.WORKFLOW.ACTIVITY.TIMEOUT'
,p_message_language=>'sv'
,p_message_text=>unistr('Aktivitetsinstansen %1 i arbetsfl\00F6det %0 \00E4r tids\00F6verskriden och har avslutats.')
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143133738053752603)
,p_name=>'APEX.WORKFLOW.ACTIVITY.WAITING'
,p_message_language=>'sv'
,p_message_text=>unistr('Instansen %1 f\00F6r aktiviteten %2 i arbetsfl\00F6det %0 \00E4r i v\00E4ntel\00E4ge')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143115371611752598)
,p_name=>'APEX.WORKFLOW.ALTERED_AND_RESUMED'
,p_message_language=>'sv'
,p_message_text=>unistr('Arbetsfl\00F6desinstansen %0 har \00E4ndrats och \00E5terupptagits med aktiviteten %1')
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143132710999752603)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.COMPLETED'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4nteinstansen %1 f\00F6r aktiviteten %2 i arbetsfl\00F6det %0 har slutf\00F6rts')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143132588211752603)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.FAULTED'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4nteaktiviteten %1 har felm\00E4rkts eftersom arbetsfl\00F6det %0 redan var i felm\00E4rkt l\00E4ge innan aktiviteten slutf\00F6rdes')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143132692787752603)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.TERMINATED'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4nteaktiviteten %1 avslutades eftersom arbetsfl\00F6det %0 redan var i avslutat l\00E4ge innan aktiviteten slutf\00F6rdes')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143115678648752598)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.TERMINATE_FAILED'
,p_message_language=>'sv'
,p_message_text=>unistr('Avsluts\00E5tg\00E4rden f\00F6r aktiviteten %1 i arbetsfl\00F6det %0 kunde inte utf\00F6ras p\00E5 grund av ett undantag: %2')
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143131269705752603)
,p_name=>'APEX.WORKFLOW.BUSY'
,p_message_language=>'sv'
,p_message_text=>unistr('Arbetsfl\00F6det \00E4r f\00F6r n\00E4rvarande upptaget med att slutf\00F6ra en tidigare \00E5tg\00E4rd. F\00F6rs\00F6k igen senare')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143147391288752607)
,p_name=>'APEX.WORKFLOW.COMPLETED_SINCE'
,p_message_language=>'sv'
,p_message_text=>unistr('Slutf\00F6rd %0')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143130321563752602)
,p_name=>'APEX.WORKFLOW.CONTINUE.NOT_ALLOWED'
,p_message_language=>'sv'
,p_message_text=>unistr('Arbetsfl\00F6det %0 kan inte forts\00E4tta eftersom det f\00F6r n\00E4rvarande \00E4r vid aktiviteten %1 som inte \00E4r ett v\00E4ntel\00E4ge')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143142287846752606)
,p_name=>'APEX.WORKFLOW.CORRELATION_CONTEXT_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 \00E4r inte en giltig korrelationskontext f\00F6r arbetsfl\00F6det f\00F6r den process som utf\00F6rs av den h\00E4r arbetsfl\00F6desaktiviteten. Korrelationskontexten m\00E5ste vara en text avgr\00E4nsad med kolon som inneh\00E5ller APEX_APPL_WORKFLOW f\00F6ljt av arbetsfl\00F6desinstans-id:t ')
||'och aktivitetsinstans-id:t.'
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143132997303752603)
,p_name=>'APEX.WORKFLOW.CREATED'
,p_message_language=>'sv'
,p_message_text=>unistr('Skapade den nya instansen %0 f\00F6r arbetsfl\00F6det %1, version %2')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143125009772752601)
,p_name=>'APEX.WORKFLOW.DATA_NOT_FOUND'
,p_message_language=>'sv'
,p_message_text=>unistr('Hittade ingen ytterligare datarad som \00E4r associerad med arbetsfl\00F6desinstansen')
,p_version_scn=>2705672
);
end;
/
begin
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143147503930752608)
,p_name=>'APEX.WORKFLOW.DUE_SINCE'
,p_message_language=>'sv'
,p_message_text=>unistr('F\00F6rfaller %0')
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143132885209752603)
,p_name=>'APEX.WORKFLOW.END'
,p_message_language=>'sv'
,p_message_text=>unistr('Arbetsfl\00F6det %0 avslutades med l\00E4get %1')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143130076993752602)
,p_name=>'APEX.WORKFLOW.INCOMPATIBLE_DATA_TYPE'
,p_message_language=>'sv'
,p_message_text=>unistr('Datatypen %1 f\00F6r villkoren som j\00E4mf\00F6rs i v\00E4xelaktiviteten f\00F6r arbetsfl\00F6det %0 \00E4r inte kompatibel med villkorsoperatorn')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143119828570752599)
,p_name=>'APEX.WORKFLOW.INITIATED_BY_USER_SINCE'
,p_message_language=>'sv'
,p_message_text=>'Initierad av %0 %1'
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143142686463752606)
,p_name=>'APEX.WORKFLOW.INVOKED'
,p_message_language=>'sv'
,p_message_text=>unistr('Skapade den nya instansen %0 f\00F6r arbetsfl\00F6det %1, version %2 - startad fr\00E5n aktivitetsinstansen %4 f\00F6r arbetsfl\00F6desinstansen %3')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143115468328752598)
,p_name=>'APEX.WORKFLOW.NO_ACTIVITY_FOUND'
,p_message_language=>'sv'
,p_message_text=>unistr('Aktivitet med statisk id %1\00E4r inte en aktivitet i arbetsfl\00F6det %0. Kontrollera det statiska id:t f\00F6r aktiviteten i motsvarande arbetsfl\00F6desversion.')
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143140798327752606)
,p_name=>'APEX.WORKFLOW.REQUIRED_PARAM_MISSING'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 \00E4r en obligatorisk parameter f\00F6r det h\00E4r arbetsfl\00F6det och f\00E5r inte vara NULL.')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143133357692752603)
,p_name=>'APEX.WORKFLOW.RESUMED'
,p_message_language=>'sv'
,p_message_text=>unistr('Arbetsfl\00F6desinstansen %0 har \00E5terupptagits')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143133277670752603)
,p_name=>'APEX.WORKFLOW.RETRIED'
,p_message_language=>'sv'
,p_message_text=>unistr('Arbetsfl\00F6desinstansen %0 har ompr\00F6vats')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143147614704752608)
,p_name=>'APEX.WORKFLOW.RETRY_COUNT.EQUALS_ONE'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 nytt f\00F6rs\00F6k')
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143147712720752608)
,p_name=>'APEX.WORKFLOW.RETRY_COUNT.NOT_EQUALS_ONE'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 Nya f\00F6rs\00F6k')
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143147411184752608)
,p_name=>'APEX.WORKFLOW.STARTED_SINCE'
,p_message_language=>'sv'
,p_message_text=>unistr('P\00E5b\00F6rjad: %0')
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143141609241752606)
,p_name=>'APEX.WORKFLOW.STATE.ACTIVE'
,p_message_language=>'sv'
,p_message_text=>'Aktiv'
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143141813106752606)
,p_name=>'APEX.WORKFLOW.STATE.COMPLETED'
,p_message_language=>'sv'
,p_message_text=>unistr('Slutf\00F6rd')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143141925600752606)
,p_name=>'APEX.WORKFLOW.STATE.FAULTED'
,p_message_language=>'sv'
,p_message_text=>'Med fel'
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143142039813752606)
,p_name=>'APEX.WORKFLOW.STATE.SUSPENDED'
,p_message_language=>'sv'
,p_message_text=>unistr('Sp\00E4rrad')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143141755489752606)
,p_name=>'APEX.WORKFLOW.STATE.TERMINATED'
,p_message_language=>'sv'
,p_message_text=>'Avslutad'
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143157043664752610)
,p_name=>'APEX.WORKFLOW.STATE.WAITING'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4ntande')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143133044125752603)
,p_name=>'APEX.WORKFLOW.SUSPENDED'
,p_message_language=>'sv'
,p_message_text=>unistr('Arbetsfl\00F6desinstansen %0 har sp\00E4rrats')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143138955782752605)
,p_name=>'APEX.WORKFLOW.SWITCH.BRANCH_NOT_FOUND'
,p_message_language=>'sv'
,p_message_text=>unistr('N\00E4sta aktivitet f\00F6r arbetsfl\00F6desinstansen %0 kan inte fastst\00E4llas. Verifiera och korrigera de villkor som definierats f\00F6r den aktuella v\00E4xlingsaktiviteten innan du f\00F6rs\00F6ker p\00E5 nytt med arbetsfl\00F6det')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143133199391752603)
,p_name=>'APEX.WORKFLOW.TERMINATED'
,p_message_language=>'sv'
,p_message_text=>unistr('Arbetsfl\00F6desinstansen %0 har avslutats')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143132278612752603)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_RESUME'
,p_message_language=>'sv'
,p_message_text=>unistr('Endast aff\00E4rsadministrat\00F6ren f\00F6r arbetsfl\00F6det %0 kan \00E5teruppta arbetsfl\00F6det')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143132330352752603)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_RETRY'
,p_message_language=>'sv'
,p_message_text=>unistr('Arbetsfl\00F6det %0 kan bara ompr\00F6vas av en aff\00E4rsadministrat\00F6r eller \00E4gare')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143131854803752603)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_SUSPEND'
,p_message_language=>'sv'
,p_message_text=>unistr('Arbetsfl\00F6desinstansen %0 kan bara uppeh\00E5llas av en aff\00E4rsadministrat\00F6r som definierats f\00F6r arbetsfl\00F6det')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143132174037752603)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_TERMINATE'
,p_message_language=>'sv'
,p_message_text=>unistr('Endast \00E4gare av och aff\00E4rsadministrat\00F6rer f\00F6r arbetsfl\00F6desinstansen %0 kan avsluta arbetsfl\00F6det')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143130532174752603)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_UPDATE'
,p_message_language=>'sv'
,p_message_text=>unistr('Variablerna f\00F6r arbetsfl\00F6det %0 kan bara uppdateras av en aff\00E4rsadministrat\00F6r som definierats f\00F6r arbetsfl\00F6det')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143145145891752607)
,p_name=>'APEX.WORKFLOW.UPDATE,NOT_ALLOWED'
,p_message_language=>'sv'
,p_message_text=>unistr('Arbetsfl\00F6desinstansen %0 m\00E5ste vara i tillst\00E5ndet Felaktig eller Uppskjuten innan dess variabler kan uppdateras.')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143136645945752604)
,p_name=>'APEX.WORKFLOW.UPDATED'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4rdet i arbetsfl\00F6desvariabeln %0 uppdaterades till %1')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143146868743752607)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_ACTIVE'
,p_message_language=>'sv'
,p_message_text=>unistr('Arbetsfl\00F6det %0 har inte en aktiv version')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143146947233752607)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_DEV'
,p_message_language=>'sv'
,p_message_text=>unistr('Arbetsfl\00F6det %0 har inte en version under utveckling')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143147052123752607)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_FOUND'
,p_message_language=>'sv'
,p_message_text=>unistr('Arbetsfl\00F6det %0 har inte n\00E5gon aktiv version eller version under utveckling')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143129909774752602)
,p_name=>'APEX.WORKFLOW.WORKFLOW_ACT_INSTANCE_NOT_FOUND'
,p_message_language=>'sv'
,p_message_text=>unistr('Aktivitetsinstansen %1 f\00F6r arbetsfl\00F6desinstansen %0 hittades inte')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143129708868752602)
,p_name=>'APEX.WORKFLOW.WORKFLOW_INSTANCE_NOT_FOUND'
,p_message_language=>'sv'
,p_message_text=>unistr('Arbetsfl\00F6desinstansen %0 hittades inte')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143164834620752613)
,p_name=>'APEX.XLSX.ERROR.NO_ACTIVE_WORKSHEET'
,p_message_language=>'sv'
,p_message_text=>'Arbetsboken har inga aktiva arbetsblad.'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143164748987752613)
,p_name=>'APEX.XLSX.ERROR.WORKBOOK_NOT_INITIALIZED'
,p_message_language=>'sv'
,p_message_text=>'Arbetsboken har inte initierats.'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143164669437752613)
,p_name=>'APEX.XLSX.INTERNAL_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('Ett internt fel intr\00E4ffade n\00E4r XLSX-filen skulle skapas.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143167119573752613)
,p_name=>'APEX.XLSX.SHEET'
,p_message_language=>'sv'
,p_message_text=>'Blad'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143177736708752617)
,p_name=>'APEX.XLSX.SHEET_NAME_TAKEN'
,p_message_language=>'sv'
,p_message_text=>unistr('Arbetsbladsnamnet %0 finns redan. F\00F6rs\00F6k med ett annat.')
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143306374215752655)
,p_name=>'APEXIR_ACTIONS'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C5tg\00E4rder')
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143221308380752630)
,p_name=>'APEXIR_ACTIONS_MENU'
,p_message_language=>'sv'
,p_message_text=>unistr('Menyn \00C5tg\00E4rder')
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143217079626752628)
,p_name=>'APEXIR_ADD_FUNCTION'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00E4gg till funktion')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143216964207752628)
,p_name=>'APEXIR_ADD_GROUP_BY_COLUMN'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00E4gg till Gruppera per kolumn')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143254598219752639)
,p_name=>'APEXIR_ADD_PIVOT_COLUMN'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00E4gg till pivotkolumn')
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143254694377752640)
,p_name=>'APEXIR_ADD_ROW_COLUMN'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00E4gg till radkolumn')
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143189076124752620)
,p_name=>'APEXIR_AGGREGATE'
,p_message_language=>'sv'
,p_message_text=>'Aggregera'
,p_is_js_message=>true
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143227524592752631)
,p_name=>'APEXIR_AGGREGATION'
,p_message_language=>'sv'
,p_message_text=>'Aggregering'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143208464138752626)
,p_name=>'APEXIR_AGG_AVG'
,p_message_language=>'sv'
,p_message_text=>'Genomsnitt'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143212794842752627)
,p_name=>'APEXIR_AGG_COUNT'
,p_message_language=>'sv'
,p_message_text=>'Antal'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143208530783752626)
,p_name=>'APEXIR_AGG_MAX'
,p_message_language=>'sv'
,p_message_text=>'Max'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143208778737752626)
,p_name=>'APEXIR_AGG_MEDIAN'
,p_message_language=>'sv'
,p_message_text=>'Median'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143208688575752626)
,p_name=>'APEXIR_AGG_MIN'
,p_message_language=>'sv'
,p_message_text=>'Min'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143208331795752626)
,p_name=>'APEXIR_AGG_SUM'
,p_message_language=>'sv'
,p_message_text=>'Summa %0'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143209466157752626)
,p_name=>'APEXIR_ALL'
,p_message_language=>'sv'
,p_message_text=>'Alla'
,p_is_js_message=>true
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143188376316752620)
,p_name=>'APEXIR_ALL_COLUMNS'
,p_message_language=>'sv'
,p_message_text=>'Alla kolumner'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143168442191752614)
,p_name=>'APEXIR_ALL_ROWS'
,p_message_language=>'sv'
,p_message_text=>'Alla rader'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143303385150752654)
,p_name=>'APEXIR_ALTERNATIVE'
,p_message_language=>'sv'
,p_message_text=>'Alternativ'
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143304964699752654)
,p_name=>'APEXIR_ALTERNATIVE_DEFAULT_NAME'
,p_message_language=>'sv'
,p_message_text=>'Alternativ standard: %0'
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143202558070752624)
,p_name=>'APEXIR_AND'
,p_message_language=>'sv'
,p_message_text=>'och'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143237349465752634)
,p_name=>'APEXIR_API.IMPORT_CONTENT_CORRUPTED'
,p_message_language=>'sv'
,p_message_text=>unistr('Kan inte importera den sparade rapporten. Inneh\00E5llet \00E4r skadat.')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143237429077752634)
,p_name=>'APEXIR_API.IMPORT_CONTENT_EMPTY'
,p_message_language=>'sv'
,p_message_text=>unistr('Kan inte importera den sparade rapporten. Inneh\00E5llet \00E4r tomt.')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143190533007752620)
,p_name=>'APEXIR_APPLY'
,p_message_language=>'sv'
,p_message_text=>unistr('Till\00E4mpa')
,p_is_js_message=>true
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143184150675752618)
,p_name=>'APEXIR_ASCENDING'
,p_message_language=>'sv'
,p_message_text=>'Stigande'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143205613571752625)
,p_name=>'APEXIR_AS_OF'
,p_message_language=>'sv'
,p_message_text=>'Per den %0'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143305581269752655)
,p_name=>'APEXIR_AVERAGE_X'
,p_message_language=>'sv'
,p_message_text=>'Genomsnitt %0'
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143297142924752652)
,p_name=>'APEXIR_BAR'
,p_message_language=>'sv'
,p_message_text=>'Stapel'
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143189807747752620)
,p_name=>'APEXIR_BETWEEN'
,p_message_language=>'sv'
,p_message_text=>'mellan'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143182948403752618)
,p_name=>'APEXIR_BGCOLOR'
,p_message_language=>'sv'
,p_message_text=>unistr('Bakgrundsf\00E4rg')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143184829357752619)
,p_name=>'APEXIR_BLUE'
,p_message_language=>'sv'
,p_message_text=>unistr('bl\00E5')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143218973183752629)
,p_name=>'APEXIR_BOTTOM'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00E4ngst ned')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143149782431752608)
,p_name=>'APEXIR_BTNS_NEXT_TO_SEARCH_OF'
,p_message_language=>'sv'
,p_message_text=>unistr('Knappar bredvid s\00F6kf\00E4ltet i %0')
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143185437465752619)
,p_name=>'APEXIR_CANCEL'
,p_message_language=>'sv'
,p_message_text=>'Avbryt'
,p_is_js_message=>true
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143191791375752621)
,p_name=>'APEXIR_CATEGORY'
,p_message_language=>'sv'
,p_message_text=>'Kategori'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143182816008752618)
,p_name=>'APEXIR_CELL'
,p_message_language=>'sv'
,p_message_text=>'Cell'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143209316558752626)
,p_name=>'APEXIR_CHART'
,p_message_language=>'sv'
,p_message_text=>'Diagram'
,p_is_js_message=>true
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143219803338752629)
,p_name=>'APEXIR_CHART_INITIALIZING'
,p_message_language=>'sv'
,p_message_text=>'Initierar...'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143259545130752641)
,p_name=>'APEXIR_CHART_LABEL_NOT_NULL'
,p_message_language=>'sv'
,p_message_text=>unistr('Diagrametikett m\00E5ste anges.')
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143271925621752645)
,p_name=>'APEXIR_CHART_MAX_DATAPOINT_CNT'
,p_message_language=>'sv'
,p_message_text=>unistr('Din fr\00E5ga \00F6verskrider det maximala antalet p\00E5 %0 datapunkter per diagram. Till\00E4mpa ett filter f\00F6r att minska antalet poster i din basfr\00E5ga.')
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143270834767752644)
,p_name=>'APEXIR_CHART_MAX_ROW_CNT'
,p_message_language=>'sv'
,p_message_text=>unistr('Det maximala antalet rader f\00F6r en Diagramfr\00E5ga begr\00E4nsar antalet rader i basfr\00E5gan, inte antalet rader som visas.  Din basfr\00E5ga \00F6verstiger det maximala antalet rader p\00E5 %0.  Till\00E4mpa ett filter f\00F6r att minska antalet poster i din basfr\00E5ga.')
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143188411962752620)
,p_name=>'APEXIR_CHART_TYPE'
,p_message_language=>'sv'
,p_message_text=>'Diagramtyp'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143152396363752609)
,p_name=>'APEXIR_CHART_VIEW_OF'
,p_message_language=>'sv'
,p_message_text=>'Diagramvy i %0'
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143267586035752643)
,p_name=>'APEXIR_CHECK_ALL'
,p_message_language=>'sv'
,p_message_text=>'Markera alla'
,p_version_scn=>2705700
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143206067884752625)
,p_name=>'APEXIR_CHOOSE_DOWNLOAD_FORMAT'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4lj rapportformat')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143213885373752627)
,p_name=>'APEXIR_CLEAR'
,p_message_language=>'sv'
,p_message_text=>'rensa'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143185314198752619)
,p_name=>'APEXIR_COLUMN'
,p_message_language=>'sv'
,p_message_text=>'Kolumn'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143225100371752631)
,p_name=>'APEXIR_COLUMNS'
,p_message_language=>'sv'
,p_message_text=>'Kolumner'
,p_is_js_message=>true
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143192371089752621)
,p_name=>'APEXIR_COLUMN_ALIASES'
,p_message_language=>'sv'
,p_message_text=>'Kolumnalias'
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143299967344752653)
,p_name=>'APEXIR_COLUMN_FILTER'
,p_message_language=>'sv'
,p_message_text=>'Filtrera...'
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143160161975752611)
,p_name=>'APEXIR_COLUMN_HEADER'
,p_message_language=>'sv'
,p_message_text=>'Kolumnrubrik'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143174233347752616)
,p_name=>'APEXIR_COLUMN_HEADER_ACTIONS'
,p_message_language=>'sv'
,p_message_text=>unistr('Kolumn\00E5tg\00E4rder')
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143174561349752616)
,p_name=>'APEXIR_COLUMN_HEADER_ACTIONS_FOR'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C5tg\00E4rder f\00F6r kolumnen "%0"')
,p_is_js_message=>true
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143215990987752628)
,p_name=>'APEXIR_COLUMN_HEADING_MENU'
,p_message_language=>'sv'
,p_message_text=>unistr('Meny f\00F6r kolumnrubrik')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143219604614752629)
,p_name=>'APEXIR_COLUMN_INFO'
,p_message_language=>'sv'
,p_message_text=>'Kolumninformation'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143302233597752654)
,p_name=>'APEXIR_COLUMN_LABEL'
,p_message_language=>'sv'
,p_message_text=>'Kolumnetikett'
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143217344437752628)
,p_name=>'APEXIR_COLUMN_N'
,p_message_language=>'sv'
,p_message_text=>'Kolumn %0'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143200207878752623)
,p_name=>'APEXIR_COMPARISON_CONTAINS'
,p_message_language=>'sv'
,p_message_text=>unistr('inneh\00E5ller')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143201583224752624)
,p_name=>'APEXIR_COMPARISON_DOESNOT_CONTAIN'
,p_message_language=>'sv'
,p_message_text=>unistr('inneh\00E5ller inte')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143183894938752618)
,p_name=>'APEXIR_COMPARISON_IN'
,p_message_language=>'sv'
,p_message_text=>'i'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143201793952752624)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_LAST'
,p_message_language=>'sv'
,p_message_text=>unistr('\00E4r inte i de senaste')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143210806723752626)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_NEXT'
,p_message_language=>'sv'
,p_message_text=>unistr('\00E4r inte i n\00E4sta')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143201642116752624)
,p_name=>'APEXIR_COMPARISON_IS_IN_LAST'
,p_message_language=>'sv'
,p_message_text=>unistr('\00E4r i den senaste')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143210750174752626)
,p_name=>'APEXIR_COMPARISON_IS_IN_NEXT'
,p_message_language=>'sv'
,p_message_text=>unistr('\00E4r i n\00E4sta')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143183772043752618)
,p_name=>'APEXIR_COMPARISON_IS_NOT_NULL'
,p_message_language=>'sv'
,p_message_text=>unistr('\00E4r inte null')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143183671935752618)
,p_name=>'APEXIR_COMPARISON_IS_NULL'
,p_message_language=>'sv'
,p_message_text=>unistr('\00E4r null')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143183467169752618)
,p_name=>'APEXIR_COMPARISON_LIKE'
,p_message_language=>'sv'
,p_message_text=>'liknar'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143183960195752618)
,p_name=>'APEXIR_COMPARISON_NOT_IN'
,p_message_language=>'sv'
,p_message_text=>'inte i'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143183577318752618)
,p_name=>'APEXIR_COMPARISON_NOT_LIKE'
,p_message_language=>'sv'
,p_message_text=>'liknar inte'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143200572725752623)
,p_name=>'APEXIR_COMPARISON_REGEXP_LIKE'
,p_message_language=>'sv'
,p_message_text=>unistr('matchar regulj\00E4rt uttryck')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143205916288752625)
,p_name=>'APEXIR_COMPUTATION'
,p_message_language=>'sv'
,p_message_text=>unistr('Ber\00E4kning')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143270567504752644)
,p_name=>'APEXIR_COMPUTATION_EXPRESSION'
,p_message_language=>'sv'
,p_message_text=>unistr('Ber\00E4kningsuttryck')
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143225425477752631)
,p_name=>'APEXIR_COMPUTATION_FOOTER'
,p_message_language=>'sv'
,p_message_text=>unistr('Skapa en ber\00E4kning med hj\00E4lp av kolumnalias.')
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143225593000752631)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E1'
,p_message_language=>'sv'
,p_message_text=>'(B+C)*100'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143225681285752631)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E2'
,p_message_language=>'sv'
,p_message_text=>'INITCAP(B)||'', ''||INITCAP(C)'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143225716543752631)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E3'
,p_message_language=>'sv'
,p_message_text=>'CASE WHEN A = 10 THEN B + C ELSE B END'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143166656071752613)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E4'
,p_message_language=>'sv'
,p_message_text=>'ROUND(C / 1000000)'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143210185536752626)
,p_name=>'APEXIR_COMPUTE'
,p_message_language=>'sv'
,p_message_text=>unistr('Ber\00E4kna')
,p_is_js_message=>true
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143217999362752629)
,p_name=>'APEXIR_CONTROL_BREAK'
,p_message_language=>'sv'
,p_message_text=>'Kontrollstopp'
,p_is_js_message=>true
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143220982983752629)
,p_name=>'APEXIR_CONTROL_BREAKS'
,p_message_language=>'sv'
,p_message_text=>'Kontrollstopp'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143307580197752655)
,p_name=>'APEXIR_CONTROL_BREAK_COLUMNS'
,p_message_language=>'sv'
,p_message_text=>'Kontrollera brytkolumner'
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143163336988752612)
,p_name=>'APEXIR_COUNT_DISTINCT'
,p_message_language=>'sv'
,p_message_text=>'Antal unika'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143306042975752655)
,p_name=>'APEXIR_COUNT_DISTINCT_X'
,p_message_language=>'sv'
,p_message_text=>'Antal unika'
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143305908371752655)
,p_name=>'APEXIR_COUNT_X'
,p_message_language=>'sv'
,p_message_text=>'Antal %0'
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143278909931752647)
,p_name=>'APEXIR_DAILY'
,p_message_language=>'sv'
,p_message_text=>'Dagligen'
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143332275886752663)
,p_name=>'APEXIR_DATA'
,p_message_language=>'sv'
,p_message_text=>'Data'
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143219756619752629)
,p_name=>'APEXIR_DATA_AS_OF'
,p_message_language=>'sv'
,p_message_text=>unistr('Rapportdata f\00F6r %0 minuter sedan.')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143152745630752609)
,p_name=>'APEXIR_DATA_VIEW_OF'
,p_message_language=>'sv'
,p_message_text=>'Datavy i %0'
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143189141190752620)
,p_name=>'APEXIR_DATE'
,p_message_language=>'sv'
,p_message_text=>'Datum'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143223683532752630)
,p_name=>'APEXIR_DEFAULT'
,p_message_language=>'sv'
,p_message_text=>'Standard'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143303171274752654)
,p_name=>'APEXIR_DEFAULT_REPORT_TYPE'
,p_message_language=>'sv'
,p_message_text=>'Standardrapporttyp'
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143185519397752619)
,p_name=>'APEXIR_DELETE'
,p_message_language=>'sv'
,p_message_text=>'Ta bort'
,p_is_js_message=>true
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143189447204752620)
,p_name=>'APEXIR_DELETE_CONFIRM'
,p_message_language=>'sv'
,p_message_text=>unistr('Vill du verkligen ta bort de h\00E4r rapportinst\00E4llningarna?')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143289974833752650)
,p_name=>'APEXIR_DELETE_DEFAULT_REPORT'
,p_message_language=>'sv'
,p_message_text=>'Ta bort standardrapport'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143217604503752628)
,p_name=>'APEXIR_DELETE_REPORT'
,p_message_language=>'sv'
,p_message_text=>'Ta bort rapport'
,p_is_js_message=>true
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143184298148752619)
,p_name=>'APEXIR_DESCENDING'
,p_message_language=>'sv'
,p_message_text=>'Fallande'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143191862108752621)
,p_name=>'APEXIR_DESCRIPTION'
,p_message_language=>'sv'
,p_message_text=>'Beskrivning'
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143215856320752628)
,p_name=>'APEXIR_DETAIL_VIEW'
,p_message_language=>'sv'
,p_message_text=>'Enstaka rad-vy'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143224169745752630)
,p_name=>'APEXIR_DIRECTION'
,p_message_language=>'sv'
,p_message_text=>'Riktning %0'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143225036115752631)
,p_name=>'APEXIR_DISABLED'
,p_message_language=>'sv'
,p_message_text=>'Inaktiv'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143185036309752619)
,p_name=>'APEXIR_DISPLAYED'
,p_message_language=>'sv'
,p_message_text=>'Visad'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143188203127752620)
,p_name=>'APEXIR_DISPLAYED_COLUMNS'
,p_message_language=>'sv'
,p_message_text=>'Visade kolumner'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143224032791752630)
,p_name=>'APEXIR_DISPLAY_IN_REPORT'
,p_message_language=>'sv'
,p_message_text=>'Visa i rapport'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143218814532752629)
,p_name=>'APEXIR_DOWN'
,p_message_language=>'sv'
,p_message_text=>'Ned'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143210235468752626)
,p_name=>'APEXIR_DOWNLOAD'
,p_message_language=>'sv'
,p_message_text=>'Ladda ned'
,p_is_js_message=>true
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143223990419752630)
,p_name=>'APEXIR_DO_NOT_DISPLAY'
,p_message_language=>'sv'
,p_message_text=>'Visa inte'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143293251374752651)
,p_name=>'APEXIR_DUPLICATE_HIGHLIGHT_COND'
,p_message_language=>'sv'
,p_message_text=>'Markering med samma villkor finns redan.'
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143307756799752655)
,p_name=>'APEXIR_DUPLICATE_PIVOT_COLUMN'
,p_message_language=>'sv'
,p_message_text=>unistr('Dubblettpivotkolumn. Pivotkolumnlistan m\00E5ste vara unik.')
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143307952304752655)
,p_name=>'APEXIR_EDIT'
,p_message_language=>'sv'
,p_message_text=>'Redigera'
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143219924537752629)
,p_name=>'APEXIR_EDIT_CHART'
,p_message_language=>'sv'
,p_message_text=>unistr('Redigera diagraminst\00E4llningar')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143226573555752631)
,p_name=>'APEXIR_EDIT_CHART2'
,p_message_language=>'sv'
,p_message_text=>'Redigera diagram'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143190464556752620)
,p_name=>'APEXIR_EDIT_CONTROL_BREAK'
,p_message_language=>'sv'
,p_message_text=>'Redigera kontrollstopp'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143226943783752631)
,p_name=>'APEXIR_EDIT_FILTER'
,p_message_language=>'sv'
,p_message_text=>'Redigera filter'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143193499979752621)
,p_name=>'APEXIR_EDIT_FLASHBACK'
,p_message_language=>'sv'
,p_message_text=>'Redigera flashback'
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143284773042752648)
,p_name=>'APEXIR_EDIT_GROUP_BY'
,p_message_language=>'sv'
,p_message_text=>'Redigera grupp per'
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143226891285752631)
,p_name=>'APEXIR_EDIT_HIGHLIGHT'
,p_message_language=>'sv'
,p_message_text=>'Redigera markering'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143254804493752640)
,p_name=>'APEXIR_EDIT_PIVOT'
,p_message_language=>'sv'
,p_message_text=>'Redigera pivot'
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143214289926752627)
,p_name=>'APEXIR_EDIT_REPORT'
,p_message_language=>'sv'
,p_message_text=>'Redigera rapport'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143303490290752654)
,p_name=>'APEXIR_EMAIL'
,p_message_language=>'sv'
,p_message_text=>'E-post'
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143175623433752616)
,p_name=>'APEXIR_EMAIL_ADDRESS'
,p_message_language=>'sv'
,p_message_text=>'E-postadress'
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143303765193752654)
,p_name=>'APEXIR_EMAIL_BCC'
,p_message_language=>'sv'
,p_message_text=>'Hemlig kopia'
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143303981056752654)
,p_name=>'APEXIR_EMAIL_BODY'
,p_message_language=>'sv'
,p_message_text=>'Text'
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143303627518752654)
,p_name=>'APEXIR_EMAIL_CC'
,p_message_language=>'sv'
,p_message_text=>'Kopia'
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143304437332752654)
,p_name=>'APEXIR_EMAIL_FREQUENCY'
,p_message_language=>'sv'
,p_message_text=>'Frekvens'
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143180827841752617)
,p_name=>'APEXIR_EMAIL_NOT_CONFIGURED'
,p_message_language=>'sv'
,p_message_text=>unistr('E-post har inte konfigurerats f\00F6r den h\00E4r applikationen. Kontakta administrat\00F6ren.')
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143278241287752647)
,p_name=>'APEXIR_EMAIL_REQUIRED'
,p_message_language=>'sv'
,p_message_text=>unistr('E-postadress m\00E5ste anges.')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143304057080752654)
,p_name=>'APEXIR_EMAIL_SEE_ATTACHED'
,p_message_language=>'sv'
,p_message_text=>'Se bifogad'
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143303830667752654)
,p_name=>'APEXIR_EMAIL_SUBJECT'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C4mne')
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143279294212752647)
,p_name=>'APEXIR_EMAIL_SUBJECT_REQUIRED'
,p_message_language=>'sv'
,p_message_text=>unistr('E-post\00E4mne m\00E5ste anges.')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143303584480752654)
,p_name=>'APEXIR_EMAIL_TO'
,p_message_language=>'sv'
,p_message_text=>'Till'
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143182613711752618)
,p_name=>'APEXIR_ENABLED'
,p_message_language=>'sv'
,p_message_text=>'Aktiv'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143226729917752631)
,p_name=>'APEXIR_ENABLE_DISABLE_ALT'
,p_message_language=>'sv'
,p_message_text=>'Aktivera/avaktivera'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143226282957752631)
,p_name=>'APEXIR_ERROR_LANDMARK'
,p_message_language=>'sv'
,p_message_text=>'Fel! %0'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143225824386752631)
,p_name=>'APEXIR_EXAMPLES'
,p_message_language=>'sv'
,p_message_text=>'Exempel'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143226653832752631)
,p_name=>'APEXIR_EXAMPLES_WITH_COLON'
,p_message_language=>'sv'
,p_message_text=>'Exempel:'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143188199962752620)
,p_name=>'APEXIR_EXCLUDE_NULL'
,p_message_language=>'sv'
,p_message_text=>unistr('Exkludera nullv\00E4rden')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143227205375752631)
,p_name=>'APEXIR_EXPAND_COLLAPSE_ALT'
,p_message_language=>'sv'
,p_message_text=>'Expandera/komprimera'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143224822622752631)
,p_name=>'APEXIR_EXPRESSION'
,p_message_language=>'sv'
,p_message_text=>'Uttryck'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143209750234752626)
,p_name=>'APEXIR_FILTER'
,p_message_language=>'sv'
,p_message_text=>'Filtrera'
,p_is_js_message=>true
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143220826252752629)
,p_name=>'APEXIR_FILTERS'
,p_message_language=>'sv'
,p_message_text=>'Filter'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143231527570752633)
,p_name=>'APEXIR_FILTER_EXPRESSION'
,p_message_language=>'sv'
,p_message_text=>'Filteruttryck'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143329742629752662)
,p_name=>'APEXIR_FILTER_EXPR_TOO_LONG'
,p_message_language=>'sv'
,p_message_text=>unistr('Filteruttrycket \00E4r f\00F6r l\00E5ngt.')
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143174457613752616)
,p_name=>'APEXIR_FILTER_SUGGESTIONS'
,p_message_language=>'sv'
,p_message_text=>unistr('Filterf\00F6rslag')
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143231459297752633)
,p_name=>'APEXIR_FILTER_TYPE'
,p_message_language=>'sv'
,p_message_text=>'Filtertyp'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143227456828752631)
,p_name=>'APEXIR_FINDER_ALT'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4lj kolumner att s\00F6ka i')
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143210041983752626)
,p_name=>'APEXIR_FLASHBACK'
,p_message_language=>'sv'
,p_message_text=>'Flashback'
,p_is_js_message=>true
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143224615011752631)
,p_name=>'APEXIR_FLASHBACK_DESCRIPTION'
,p_message_language=>'sv'
,p_message_text=>unistr('En flashbackfr\00E5ga l\00E5ter dig visa data som fanns vid en tidigare tidpunkt.')
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143278640691752647)
,p_name=>'APEXIR_FLASHBACK_LABEL'
,p_message_language=>'sv'
,p_message_text=>'Flashbackvaraktighet'
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143280058170752647)
,p_name=>'APEXIR_FORMAT'
,p_message_language=>'sv'
,p_message_text=>'Format'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143205824800752625)
,p_name=>'APEXIR_FORMAT_MASK'
,p_message_language=>'sv'
,p_message_text=>'Formatmask %0'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143217583982752628)
,p_name=>'APEXIR_FUNCTION'
,p_message_language=>'sv'
,p_message_text=>'Funktion'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143225312694752631)
,p_name=>'APEXIR_FUNCTIONS'
,p_message_language=>'sv'
,p_message_text=>'Funktioner %0'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143303051315752654)
,p_name=>'APEXIR_FUNCTIONS_OPERATORS'
,p_message_language=>'sv'
,p_message_text=>'Funktioner/operatorer'
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143217228311752628)
,p_name=>'APEXIR_FUNCTION_N'
,p_message_language=>'sv'
,p_message_text=>'Funktion %0'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143209568378752626)
,p_name=>'APEXIR_GO'
,p_message_language=>'sv'
,p_message_text=>'OK'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143183133846752618)
,p_name=>'APEXIR_GREEN'
,p_message_language=>'sv'
,p_message_text=>unistr('gr\00F6n')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143228188213752632)
,p_name=>'APEXIR_GROUPBY_COLUMNS'
,p_message_language=>'sv'
,p_message_text=>'Gruppera per kolumn'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143228276634752632)
,p_name=>'APEXIR_GROUPBY_FUNCTIONS'
,p_message_language=>'sv'
,p_message_text=>'Gruppera per funktioner'
,p_version_scn=>2705693
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143163470686752612)
,p_name=>'APEXIR_GROUP_BY'
,p_message_language=>'sv'
,p_message_text=>'Gruppera per'
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143304131469752654)
,p_name=>'APEXIR_GROUP_BY_COLUMN'
,p_message_language=>'sv'
,p_message_text=>'Gruppera per kolumn %0'
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143259603604752641)
,p_name=>'APEXIR_GROUP_BY_COL_NOT_NULL'
,p_message_language=>'sv'
,p_message_text=>unistr('Gruppera per kolumn m\00E5ste anges.')
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143270771135752644)
,p_name=>'APEXIR_GROUP_BY_MAX_ROW_CNT'
,p_message_language=>'sv'
,p_message_text=>unistr('Det maximala antalet rader f\00F6r en Gruppera per-fr\00E5ga begr\00E4nsar antalet rader i basfr\00E5gan, inte antalet rader som visas.  Din basfr\00E5ga \00F6verstiger det maximala antalet rader p\00E5 %0.  Till\00E4mpa ett filter f\00F6r att minska antalet poster i din basfr\00E5ga.')
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143250966393752638)
,p_name=>'APEXIR_GROUP_BY_SORT'
,p_message_language=>'sv'
,p_message_text=>'Gruppera per-sortering'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143307657830752655)
,p_name=>'APEXIR_GROUP_BY_SORT_ORDER'
,p_message_language=>'sv'
,p_message_text=>unistr('Sorteringsordning f\00F6r Gruppera per')
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143152508679752609)
,p_name=>'APEXIR_GROUP_BY_VIEW_OF'
,p_message_language=>'sv'
,p_message_text=>'Gruppera per-vy i %0'
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143188567371752620)
,p_name=>'APEXIR_HCOLUMN'
,p_message_language=>'sv'
,p_message_text=>'Horisontell kolumn'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143222536235752630)
,p_name=>'APEXIR_HELP'
,p_message_language=>'sv'
,p_message_text=>unistr('Hj\00E4lp')
,p_is_js_message=>true
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143214378234752627)
,p_name=>'APEXIR_HELP_01'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Interaktiva rapporter l\00E5ter slutanv\00E4ndare anpassa rapporter. Anv\00E4ndare kan \00E4ndra layouten av rapportdata genom att v\00E4lja kolumner, till\00E4mpa filter, markera och sortera. Anv\00E4ndare kan \00E4ven definiera brytkolumner, aggregeringar, diagram, Gruppera per o')
||unistr('ch l\00E4gga till sina egna ber\00E4kningar. Anv\00E4ndare kan \00E4ven konfigurera en prenumeration s\00E5 att HTML-version av rapporten kan skickas via e-post till dem vid ett angivet intervall. Anv\00E4ndare kan skapa flera versioner av en rapport och spara dem som namng')
||unistr('ivna rapporter, antingen f\00F6r offentlig eller privat visning. '),
'<p/>',
unistr('De f\00F6ljande sektionerna sammanfattar s\00E4tt som du kan anpassa en interaktiv rapport. Se "Anv\00E4nda interaktiva rapporter" i <i>Oracle APEX End User''s Guide</i> om du vill veta mer.')))
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143221441611752630)
,p_name=>'APEXIR_HELP_ACTIONS_MENU'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C5tg\00E4rdsmenyn visas till h\00F6ger om S\00F6k-knappen i s\00F6kf\00E4ltet. Anv\00E4nd den h\00E4r menyn f\00F6r att anpassa en interaktiv rapport.')
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143215166849752628)
,p_name=>'APEXIR_HELP_AGGREGATE'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Aggregeringar \00E4r matematiska ber\00E4kningar som utf\00F6rs mot en kolumn. Aggregeringar visas efter varje kontrollstop och i slutet av rapporten i kolumnen d\00E4r de \00E4r definierade. Alternativen inkluderar f\00F6ljande:'),
'<p>',
'</p><ul>',
unistr('<li><strong>Aggregering</strong> l\00E5ter dig v\00E4lja en tidigare'),
'definierad aggregering att redigera.</li>',
unistr('<li><strong>Funktion</strong> \00E4r den funktion som ska utf\00F6ras (till exempel, SUM, MIN).</li>'),
unistr('<li><strong>Kolumn</strong> anv\00E4nds f\00F6r att v\00E4lja kolumnen d\00E4r den matematiska funktionen ska till\00E4mpas. Endast numeriska'),
'kolumner visas.</li>',
'</ul>'))
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143215237159752628)
,p_name=>'APEXIR_HELP_CHART'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Du kan definiera ett diagram per sparad rapport. N\00E4r'),
unistr('detta har definierats kan du v\00E4xla mellan diagram- och rapportvyn med hj\00E4lp av vyikonerna i s\00F6kf\00E4ltet.'),
'Alternativen inkluderar:  ',
'<p>',
'</p><ul>',
'<li><strong>Diagramtyp</strong> identifierar diagramtypen som ska inkluderas.',
unistr('V\00E4lj mellan horisontell stapel, vertikal stapel, cirkel eller linje.</li>'),
unistr('<li><strong>Etikett</strong> l\00E5ter dig v\00E4lja kolumnen som ska anv\00E4ndas som etikett.</li>'),
unistr('<li><strong>Axelrubrik f\00F6r etiketten</strong> \00E4r titeln som visas p\00E5 axeln som \00E4r associerad med den valda kolumnen f\00F6r'),
unistr('etiketten. Detta \00E4r inte tillg\00E4ngligt f\00F6r cirkeldiagram.</li>'),
unistr('<li><strong>V\00E4rde</strong> l\00E5ter dig v\00E4lja kolumnen som ska anv\00E4ndas som v\00E4rde. Om din funktion '),
unistr('\00E4r en COUNT beh\00F6ver inte ett v\00E4rde v\00E4ljas.</li>'),
unistr('<li><strong>Axelrubrik f\00F6r v\00E4rde</strong> \00E4r titeln som visas p\00E5 axeln som \00E4r associerad med den valda kolumnen f\00F6r'),
unistr('V\00E4rde. Detta \00E4r inte tillg\00E4ngligt f\00F6r cirkeldiagram.</li>'),
unistr('<li><strong>Funktion</strong> \00E4r en valfri funktion som ska utf\00F6ras p\00E5 den valda kolumnen f\00F6r V\00E4rde.</li>'),
unistr('<li><strong>Sortera</strong> l\00E5ter dig sortera resultatupps\00E4ttningen.</li></ul>')))
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143214594633752628)
,p_name=>'APEXIR_HELP_COLUMN_HEADING_MENU'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Att klicka p\00E5 n\00E5gon kolumnrubrik visar en kolumnrubrikmeny. Alternativen inkluderar f\00F6ljande:'),
'<p></p>',
'<ul>',
'<li>Ikonen <strong>Sortera i stigande ordning </strong> sorterar rapporten efter kolumn i stigande ordning.</li>',
'<li>Ikonen <strong>Sortera i fallande ordning</strong> sorterar rapporten efter kolumn i fallande ordning.</li>',
unistr('<li><strong>D\00F6lj kolumn</strong> d\00F6ljer kolumnen. Inte alla kolumner kan d\00F6ljas. Om en kolumn inte kan d\00F6ljas finns ingen ikon f\00F6r D\00F6lj kolumn.</li>'),
unistr('<li><strong>Brytkolumn</strong> skapar en brytgrupp p\00E5 kolumnen. Detta extraherar kolumnen ur rapporten som en huvudpost.</li>'),
unistr('<li><strong>Kolumninformation</strong> visar hj\00E4lptext om kolumnen, om s\00E5dan \00E4r tillg\00E4nglig.</li>'),
unistr('<li><strong>Textomr\00E5de</strong> anv\00E4nds f\00F6r att ange skiftl\00E4gesk\00E4nsliga s\00F6kkriterier'),
unistr('(jokertecken beh\00F6vs inte). Att ange ett v\00E4rde minskar listan av'),
unistr('v\00E4rden l\00E4ngst ner i menyn. Du kan sedan v\00E4lja ett v\00E4rde'),
unistr('l\00E4ngst ner och det valda v\00E4rdet visas som ett filter genom att anv\00E4nda "="'),
unistr('(till exempel, <code>kolumn= "ABC"</code>). Alternativt kan du klicka p\00E5 s\00F6kfunktionsikonen och ange ett v\00E4rde som ska skapas som ett filter med "LIKE"-modifieraren (till exempel <code>kolumn LIKE "%ABC%"</code>).</li>'),
unistr('<li><strong>Lista av unika v\00E4rden</strong> inneh\00E5ller de f\00F6rsta 500 unika'),
unistr('v\00E4rdena som uppfyller dina filterkriterier. Om kolumnen \00E4r ett datum visas en lista av datumintervall'),
unistr('ist\00E4llet. Om du v\00E4ljer ett v\00E4rde kommer ett filter att'),
unistr('skapas genom att anv\00E4nda "=" (till exempel, <code>kolumn = "ABC"</code>).</li>'),
'</ul>'))
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143215031316752628)
,p_name=>'APEXIR_HELP_COMPUTE'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('L\00E5ter dig l\00E4gga till ber\00E4knade kolumner i din rapport. Detta kan vara matematiska ber\00E4kningar (till exempel <code>NBR_HOURS/24</code>) eller Oracle'),
unistr('standardfunktioner som till\00E4mpas p\00E5 befintliga kolumner. Vissa visas som exempel och andra (t.ex. kan \00E4ven <code>TO_DATE)</code> anv\00E4ndas). Alternativen inkluderar f\00F6ljande:'),
'<p></p>',
'<ul>',
unistr('<li><strong>Ber\00E4kning</strong> l\00E5ter dig v\00E4lja en tidigare definierad ber\00E4kning att redigera.</li>'),
unistr('<li><strong>Kolumnrubrik</strong> \00E4r kolumnrubriken f\00F6r den nya kolumnen.</li>'),
unistr('<li><strong>Formatmask</strong> \00E4r en Oracle-formatmask som ska till\00E4mpas mot kolumnen (till exempel S9999).</li>'),
unistr('<li><strong>Ber\00E4kning</strong> \00E4r ber\00E4kningen som ska utf\00F6ras. Inom ber\00E4kningen h\00E4nvisas kolumner genom att anv\00E4nda visningsalias.</li>'),
'</ul>',
unistr('<p>Under ber\00E4kning visas kolumnerna i din fr\00E5ga med'),
unistr('sina associerade alias. Att klicka p\00E5 kolumnnamnet eller alias inkluderar'),
unistr('dem i ber\00E4kningen. Bredvid Kolumner finns en knappsats. Den h\00E4r knappsatsen fungerar som'),
unistr('en genv\00E4g till ofta anv\00E4nda knappar. L\00E4ngst till h\00F6ger finns Funktioner.</p>'),
unistr('<p>F\00F6ljande exempelber\00E4kning demonstrerar hur total ers\00E4ttning visas:</p>'),
'<pre>CASE WHEN A = ''SALES'' AND B + C ELSE B END</pre>',
unistr('(d\00E4r A \00E4r ORGANIZATION, B \00E4r SALARY och C \00E4r COMMISSION)'),
''))
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143221515137752630)
,p_name=>'APEXIR_HELP_CONTROL_BREAK'
,p_message_language=>'sv'
,p_message_text=>unistr('Anv\00E4nds f\00F6r att skapa en brytgrupp p\00E5 en eller flera kolumner. Detta extraherar kolumnerna ur den interaktiva rapporten och visar dem som en masterpost.')
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143215711792752628)
,p_name=>'APEXIR_HELP_DETAIL_VIEW'
,p_message_language=>'sv'
,p_message_text=>unistr('F\00F6r att visa detaljerna f\00F6r en enstaka rad \00E5t g\00E5ngen klickar du p\00E5 ikonen f\00F6r enstaka rad-vy f\00F6r den rad du vill visa. Om den \00E4r tillg\00E4nglig kommer vyn f\00F6r enstaka rader alltid att vara den f\00F6rsta kolumnen. Beroende p\00E5 anpassningen f\00F6r den interaktiv')
||unistr('a rapporten kan vyn f\00F6r enstaka rader vara standardvyn eller en anpassad sida som till\00E5ter uppdateringar.')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143215631050752628)
,p_name=>'APEXIR_HELP_DOWNLOAD'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00E5ter den aktuella resultatupps\00E4ttningen laddas ned. Nedladdningsformaten inkluderar PDF, Excel, HTML och CSV. Nedladdningsalternativen varierar beroende p\00E5 det valda formatet. Alla format kan skickas som e-post.')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143214722952752628)
,p_name=>'APEXIR_HELP_FILTER'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Fokuserar rapporten genom att l\00E4gga till eller modifiera satsen <code>WHERE</code> p\00E5 fr\00E5gan. Du kan filtrera efter kolumn eller efter rad.  '),
unistr('<p>Om du filtrerar efter kolumn v\00E4ljer du en kolumn (det beh\00F6ver inte vara'),
unistr('en kolumn som visas), v\00E4lj en Oracle standardoperator (=, !=, ej i, mellan), och ange ett uttryck att j\00E4mf\00F6ra mot. Uttryck \00E4r skiftl\00E4gesk\00E4nsliga. Anv\00E4nd % som ett jokertecken (till exempel, <code>STATE_NAME'),
'som A%)</code>.</p>',
unistr('<p>Om du filtrerar efter rad kan du skapa komplexa <code>WHERE</code>-satser genom att anv\00E4nda'),
unistr('kolumnalias och Oracle-funktioner eller -operatorer (till exempel, <code>G = "VA" eller G = "CT"</code>, n\00E4r'),
unistr('<code>G</code> \00E4r alias f\00F6r <code>CUSTOMER_STATE</code>).</p>'),
''))
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143215388162752628)
,p_name=>'APEXIR_HELP_FLASHBACK'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('En flashbackfr\00E5ga l\00E5ter dig visa data som fanns vid en tidigare'),
unistr('tidpunkt. Standardtiden f\00F6r en flashback \00E4r 3 timmar (eller 180'),
unistr('minuter) men den faktiska tiden kan variera f\00F6r varje databas.')))
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143279909643752647)
,p_name=>'APEXIR_HELP_FORMAT'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Format l\00E5ter dig anpassa visningen av rapporten.'),
unistr('Format inneh\00E5ller f\00F6ljande undermenyer:</p>'),
'<ul><li>Sortera</li>',
'<li>Kontrollstopp</li>',
'<li>Markera</li>',
unistr('<li>Ber\00E4kna</li>'),
'<li>Aggregera</li>',
'<li>Diagram</li>',
'<li>Gruppera per</li>',
'<li>Pivot</li>',
'</ul>',
''))
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143278193314752647)
,p_name=>'APEXIR_HELP_GROUP_BY'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Du kan definiera en Gruppera per f\00F6r varje sparad'),
unistr('rapport. N\00E4r det har definierats kan du v\00E4xla mellan vyerna Gruppera per och Rapport'),
unistr('genom att anv\00E4nda vyikonerna i s\00F6kf\00E4ltet. F\00F6r att skapa en Gruppera per-vy'),
unistr('v\00E4ljer du:'),
'<p></p><ul>',
'<li>kolumnen som ska grupperas</li>',
unistr('<li>kolumnerna som ska aggregeras tillsammans med funktionen som ska utf\00F6ras (genomsnitt, summa, antal, osv.)</li>'),
'</ul>'))
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143214907740752628)
,p_name=>'APEXIR_HELP_HIGHLIGHT'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>L\00E5ter dig definiera ett filter. Raderna som uppfyller filterkriterierna visas som markerade genom att anv\00E4nda egenskaper som \00E4r associerade med filtret. Alternativen inkluderar f\00F6ljande:</p>'),
'<ul>',
unistr('<li><strong>Namn</strong> anv\00E4nds endast f\00F6r visning.</li>'),
unistr('<li><strong>Sekvens</strong> identifierar sekvensen som regler utv\00E4rderas efter .</li>'),
unistr('<li><strong>Aktiv</strong> identifierar om en regel \00E4r aktiv eller inaktiv.</li>'),
'<li><strong>Markeringstyp</strong> identifierar om raden eller cellen ska',
unistr('markeras. Om Cell v\00E4ljs kommer kolumnen som h\00E4nvisas i'),
'Markeringsvillkor att markeras.</li>',
unistr('<li><strong>Bakgrundsf\00E4rg</strong> \00E4r den nya f\00E4rgen f\00F6r bakgrunden i det markerade omr\00E5det.</li>'),
unistr('<li><strong>Textf\00E4rg</strong> \00E4r den nya f\00E4rgen f\00F6r texten i det markerade omr\00E5det.</li>'),
'<li><strong>Markeringsvillkor</strong> definierar dina filtervillkor.</li>',
'</ul>',
''))
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143108364282752596)
,p_name=>'APEXIR_HELP_PIVOT'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Du kan definiera en pivotvy per sparad rapport. N\00E4r det har definierats kan du v\00E4xla mellan pivot- och rapportvyerna genom att anv\00E4nda visningsikonerna i s\00F6kf\00E4ltet. F\00F6r att skapa en pivotvy v\00E4ljer du: '),
'<p></p>',
'<ul>',
'<li>kolumnerna som ska pivoteras </li>',
'<li>kolumnerna som ska visas som rader</li>',
unistr('<li>kolumnerna som ska aggregeras tillsammans med funktionen som ska utf\00F6ras (genomsnitt, summa, antal osv.)</li>'),
'</ul>'))
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143226008888752631)
,p_name=>'APEXIR_HELP_REPORT_SETTINGS'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Om du anpassar en interaktiv rapport visas rapportinst\00E4llningarna'),
unistr('under s\00F6kf\00E4ltet och ovanf\00F6r rapporten. Det h\00E4r omr\00E5det kan komprimeras och expanderas genom att anv\00E4nda ikonen till v\00E4nster.'),
'<p>',
unistr('F\00F6r varje rapportinst\00E4llning kan du:'),
'</p><ul>',
unistr('<li>Redigera en inst\00E4llning genom att klicka p\00E5 namnet.</li>'),
unistr('<li>Avaktivera/aktivera en inst\00E4llning genom att avmarkera eller markera kryssrutan Aktivera/avaktivera. Anv\00E4nd det h\00E4r alternativet f\00F6r att tillf\00E4lligt sl\00E5 p\00E5 eller sl\00E5 av en inst\00E4llning.</li>'),
unistr('<li>Flytta bort en inst\00E4llning genom att klicka p\00E5 ikonen Flytta bort.</li>'),
'</ul>',
unistr('<p>Om du har skapat ett diagram, Gruppera per eller pivot kan du v\00E4xla mellan dem'),
unistr('och basrapporten med hj\00E4lp av l\00E4nkarna f\00F6r rapportvyn, diagramvyn, Gruppera per-vyn och pivotvyn'),
unistr('som visas till h\00F6ger. Om du visar diagram, Gruppera per eller pivot kan'),
unistr('du \00E4ven anv\00E4nda l\00E4nken Redigera f\00F6r att redigera inst\00E4llningarna.</p>'),
''))
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143215563740752628)
,p_name=>'APEXIR_HELP_RESET'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C5terst\00E4ller rapporten till standardinst\00E4llningarna och tar bort alla anpassningar du har gjort.')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143280229856752647)
,p_name=>'APEXIR_HELP_ROWS_PER_PAGE'
,p_message_language=>'sv'
,p_message_text=>'Anger antalet poster som ska visas per sida.'
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143215487375752628)
,p_name=>'APEXIR_HELP_SAVE_REPORT'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Sparar den anpassade rapporten f\00F6r framtida anv\00E4ndning. Du anger ett namn och beskrivning (valfritt) och kan g\00F6ra rapporten offentlig (vilket inneb\00E4r att alla anv\00E4ndare kan komma \00E5t den prim\00E4ra standardrapporten). Du kan spara fyra typer av intera')
||'ktiva rapporter:</p>',
'<ul>',
unistr('<li><strong>Prim\00E4r standard</strong> (endast utvecklare). Prim\00E4r standard \00E4r rapporten som inledningsvis visas. Prim\00E4ra standardrapporter kan inte d\00F6pas om eller tas bort.</li>'),
unistr('<li><strong>Alternativ rapport</strong> (endast utvecklare). L\00E5ter utvecklare skapa flera rapportlayouter. Endast utvecklare kan spara, d\00F6pa om eller ta bort en alternativ rapport.</li>'),
unistr('<li><strong>Offentlig rapport</strong> (slutanv\00E4ndare). Kan sparas, d\00F6pas om eller tas bort av slutanv\00E4ndaren som skapade den. Andra anv\00E4ndare kan visa och spara layouten som en annan rapport.</li>'),
unistr('<li><strong>Privat rapport</strong> (slutanv\00E4ndare). Endast slutanv\00E4ndaren som skapade rapporten kan visa, spara, d\00F6pa om eller ta bort rapporten.</li>'),
'</ul>',
unistr('<p>Om du sparar anpassade rapporter visas en rapportv\00E4ljare i s\00F6kf\00E4ltet till v\00E4nster om radv\00E4ljaren (om denna funktion \00E4r aktiv).</p>'),
''))
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143214453800752627)
,p_name=>'APEXIR_HELP_SEARCH_BAR'
,p_message_language=>'sv'
,p_message_text=>unistr('\00D6verst p\00E5 varje rapportsida finns en s\00F6kregion. Denna region (eller s\00F6kf\00E4lt) tillhandah\00E5ller f\00F6ljande funktioner:')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143280871333752647)
,p_name=>'APEXIR_HELP_SEARCH_BAR_ACTIONS_MENU'
,p_message_language=>'sv'
,p_message_text=>unistr('<li><strong>\00C5tg\00E4rdsmenyn</strong> l\00E5ter dig anpassa en rapport. Se efterf\00F6ljande sektioner.</li>')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143280350207752647)
,p_name=>'APEXIR_HELP_SEARCH_BAR_FINDER'
,p_message_language=>'sv'
,p_message_text=>unistr('<li><strong>Ikonen V\00E4lj kolumner</strong> l\00E5ter dig identifiera vilka kolumner att s\00F6ka i (eller alla).</li>')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143280699748752647)
,p_name=>'APEXIR_HELP_SEARCH_BAR_REPORTS'
,p_message_language=>'sv'
,p_message_text=>'<li><strong>Rapporter</strong> visar alternativa standardrapporter och sparade privata eller offentliga rapporter.</li>'
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143280514255752647)
,p_name=>'APEXIR_HELP_SEARCH_BAR_ROWS'
,p_message_language=>'sv'
,p_message_text=>'<li><strong>Rader</strong> anger antalet poster som ska visas per sida.</li>'
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143280473079752647)
,p_name=>'APEXIR_HELP_SEARCH_BAR_TEXTBOX'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<li><strong>Textomr\00E5de</strong> l\00E5ter dig ange skiftl\00E4gesk\00E4nsliga s\00F6kkriterier (jokertecken \00E4r underf\00F6rst\00E5dda).</li>'),
unistr('<li><strong>S\00F6k-knappen</strong> k\00F6r s\00F6kningen. Att trycka p\00E5 Enter k\00F6r \00E4ven s\00F6kningen n\00E4r mark\00F6ren \00E4r i s\00F6ktextomr\00E5det.</li>')))
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143280731270752647)
,p_name=>'APEXIR_HELP_SEARCH_BAR_VIEW'
,p_message_language=>'sv'
,p_message_text=>unistr('<li><strong>Vyikoner</strong> v\00E4xlar mellan vyerna Ikon, Rapport, Detalj, Diagram, Gruppera per och Pivot i rapporten om de har definierats.</li>')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143214613729752628)
,p_name=>'APEXIR_HELP_SELECT_COLUMNS'
,p_message_language=>'sv'
,p_message_text=>unistr('Anv\00E4nds f\00F6r att modifiera de kolumner som visas. Kolumnerna till h\00F6ger visas. Kolumnerna till v\00E4nster d\00F6ljs. Du kan ordna om de kolumner som visas genom att anv\00E4nda pilarna l\00E4ngst till h\00F6ger. Ber\00E4knade kolumner har prefix med <strong>**</strong>.')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143214828039752628)
,p_name=>'APEXIR_HELP_SORT'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Anv\00E4nds f\00F6r att \00E4ndra kolumnerna som ska sorteras och fastst\00E4ller om'),
unistr('de ska sorteras i stigande eller fallande ordning. Du kan \00E4ven ange hur'),
unistr('<code>NULLs</code> ska hanteras. Standardinst\00E4llningen visar alltid <code>NULLs</code> sist eller visar dem alltid f\00F6rst. Den resulterande sorteringen visas till h\00F6ger om'),
'kolumnrubrikerna i rapporten.</p>'))
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143277908153752646)
,p_name=>'APEXIR_HELP_SUBSCRIPTION'
,p_message_language=>'sv'
,p_message_text=>unistr('N\00E4r du l\00E4gger till en prenumeration anger du en e-postadress (eller flera e-postadresser, avgr\00E4nsade med kommatecken), e-post\00E4mne, frekvens och start- och slutdatum. De resulterande e-postmeddelandena inkluderar en exporterad version (PDF, Excel, HTM')
||unistr('L eller CSV) av den interaktiva rapporten och inneh\00E5ller aktuella data med hj\00E4lp av rapportinst\00E4llningarna som var aktuella n\00E4r prenumerationen lades till.')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143219567599752629)
,p_name=>'APEXIR_HIDE_COLUMN'
,p_message_language=>'sv'
,p_message_text=>unistr('D\00F6lj kolumn')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143209907345752626)
,p_name=>'APEXIR_HIGHLIGHT'
,p_message_language=>'sv'
,p_message_text=>'Markera'
,p_is_js_message=>true
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143221028136752629)
,p_name=>'APEXIR_HIGHLIGHTS'
,p_message_language=>'sv'
,p_message_text=>'Markeringar'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143191273488752621)
,p_name=>'APEXIR_HIGHLIGHT_CELL_WITH_COLORS'
,p_message_language=>'sv'
,p_message_text=>'Markera cellen %0 i %1'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143226198497752631)
,p_name=>'APEXIR_HIGHLIGHT_CONDITION'
,p_message_language=>'sv'
,p_message_text=>'Markera villkor'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143191118554752621)
,p_name=>'APEXIR_HIGHLIGHT_ROW_WITH_COLORS'
,p_message_language=>'sv'
,p_message_text=>'Markera raden %0 i %1'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143278592569752647)
,p_name=>'APEXIR_HIGHLIGHT_STYLE'
,p_message_language=>'sv'
,p_message_text=>'Markeringsformat'
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143182790912752618)
,p_name=>'APEXIR_HIGHLIGHT_TYPE'
,p_message_language=>'sv'
,p_message_text=>'Markera typ'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143297322948752652)
,p_name=>'APEXIR_HORIZONTAL'
,p_message_language=>'sv'
,p_message_text=>'Horisontellt'
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143326352194752661)
,p_name=>'APEXIR_INACTIVE_SETTING'
,p_message_language=>'sv'
,p_message_text=>unistr('1 inaktiv inst\00E4llning')
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143326410710752661)
,p_name=>'APEXIR_INACTIVE_SETTINGS'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 inaktiva inst\00E4llningar')
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143216170994752628)
,p_name=>'APEXIR_INTERACTIVE_REPORT_HELP'
,p_message_language=>'sv'
,p_message_text=>unistr('Hj\00E4lp f\00F6r interaktiv rapport')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143227187751752631)
,p_name=>'APEXIR_INVALID'
,p_message_language=>'sv'
,p_message_text=>'Ogiltig'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143220507321752629)
,p_name=>'APEXIR_INVALID_COMPUTATION'
,p_message_language=>'sv'
,p_message_text=>unistr('Ogiltigt ber\00E4kningsuttryck. %0')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143176152904752616)
,p_name=>'APEXIR_INVALID_END_DATE'
,p_message_language=>'sv'
,p_message_text=>unistr('Slutdatumet m\00E5ste infalla efter startdatumet.')
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143235362005752634)
,p_name=>'APEXIR_INVALID_FILTER'
,p_message_language=>'sv'
,p_message_text=>'Ogiltigt filteruttryck. %0'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143305183982752655)
,p_name=>'APEXIR_INVALID_FILTER_QUERY'
,p_message_language=>'sv'
,p_message_text=>unistr('Ogiltig filterfr\00E5ga')
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143326580370752661)
,p_name=>'APEXIR_INVALID_SETTING'
,p_message_language=>'sv'
,p_message_text=>unistr('1 ogiltig inst\00E4llning')
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143326669120752661)
,p_name=>'APEXIR_INVALID_SETTINGS'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 ogiltiga inst\00E4llningar')
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143278739520752647)
,p_name=>'APEXIR_IN_MINUTES'
,p_message_language=>'sv'
,p_message_text=>'(i minuter)'
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143295765107752652)
,p_name=>'APEXIR_IS_IN_THE_LAST'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 \00E4r i de senaste %1')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143295957541752652)
,p_name=>'APEXIR_IS_IN_THE_NEXT'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 \00E4r i de kommande %1')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143295845009752652)
,p_name=>'APEXIR_IS_NOT_IN_THE_LAST'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 \00E4r inte i de senaste %1')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143296023115752652)
,p_name=>'APEXIR_IS_NOT_IN_THE_NEXT'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 \00E4r inte i de kommande %1')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143225283350752631)
,p_name=>'APEXIR_KEYPAD'
,p_message_language=>'sv'
,p_message_text=>'Knappsats'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143188994437752620)
,p_name=>'APEXIR_LABEL'
,p_message_language=>'sv'
,p_message_text=>'Etikett %0'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143219164991752629)
,p_name=>'APEXIR_LABEL_AXIS_TITLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Axelrubrik f\00F6r etikett')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143211489713752627)
,p_name=>'APEXIR_LAST_DAY'
,p_message_language=>'sv'
,p_message_text=>'Senaste dagen'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143211645027752627)
,p_name=>'APEXIR_LAST_HOUR'
,p_message_language=>'sv'
,p_message_text=>'Senaste timmen'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143211106124752627)
,p_name=>'APEXIR_LAST_MONTH'
,p_message_language=>'sv'
,p_message_text=>unistr('Senaste m\00E5naden')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143211283647752627)
,p_name=>'APEXIR_LAST_WEEK'
,p_message_language=>'sv'
,p_message_text=>'Senaste veckan'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143211356635752627)
,p_name=>'APEXIR_LAST_X_DAYS'
,p_message_language=>'sv'
,p_message_text=>'Senaste %0 dagarna'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143211596381752627)
,p_name=>'APEXIR_LAST_X_HOURS'
,p_message_language=>'sv'
,p_message_text=>'Senaste %0 timmarna'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143210953249752626)
,p_name=>'APEXIR_LAST_X_YEARS'
,p_message_language=>'sv'
,p_message_text=>unistr('Senaste %0 \00E5ren')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143211045765752626)
,p_name=>'APEXIR_LAST_YEAR'
,p_message_language=>'sv'
,p_message_text=>unistr('F\00F6rra \00E5ret')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143188815082752620)
,p_name=>'APEXIR_LINE'
,p_message_language=>'sv'
,p_message_text=>'Linje'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143185641068752619)
,p_name=>'APEXIR_LINE_WITH_AREA'
,p_message_language=>'sv'
,p_message_text=>'Linjediagram med yta'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143305030575752654)
,p_name=>'APEXIR_MAP_IT'
,p_message_language=>'sv'
,p_message_text=>'Mappa den'
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143220086927752629)
,p_name=>'APEXIR_MAX_QUERY_COST'
,p_message_language=>'sv'
,p_message_text=>unistr('Fr\00E5gan ber\00E4knas \00F6verskrida det maximala antalet till\00E5tna resurser. \00C4ndra dina rapportinst\00E4llningar och f\00F6rs\00F6k igen.')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143201481809752624)
,p_name=>'APEXIR_MAX_ROW_CNT'
,p_message_language=>'sv'
,p_message_text=>unistr('Det maximala antalet rader f\00F6r den h\00E4r rapporten \00E4r %0 rader.  Till\00E4mpa ett filter f\00F6r att minska antalet poster i din fr\00E5ga.')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143305659871752655)
,p_name=>'APEXIR_MAX_X'
,p_message_language=>'sv'
,p_message_text=>'Max %0'
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143305823165752655)
,p_name=>'APEXIR_MEDIAN_X'
,p_message_language=>'sv'
,p_message_text=>'Median %0'
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143148124175752608)
,p_name=>'APEXIR_MESSAGE'
,p_message_language=>'sv'
,p_message_text=>'Meddelande'
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143205790452752625)
,p_name=>'APEXIR_MIN_AGO'
,p_message_language=>'sv'
,p_message_text=>'%0 minuter sedan'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143305755301752655)
,p_name=>'APEXIR_MIN_X'
,p_message_language=>'sv'
,p_message_text=>'Min %0'
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143304735623752654)
,p_name=>'APEXIR_MONTH'
,p_message_language=>'sv'
,p_message_text=>unistr('M\00E5nad')
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143279138402752647)
,p_name=>'APEXIR_MONTHLY'
,p_message_language=>'sv'
,p_message_text=>unistr('M\00E5natligen')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143218383376752629)
,p_name=>'APEXIR_MOVE'
,p_message_language=>'sv'
,p_message_text=>'Flytta'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143218267430752629)
,p_name=>'APEXIR_MOVE_ALL'
,p_message_language=>'sv'
,p_message_text=>'Flytta alla'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143331451162752662)
,p_name=>'APEXIR_MULTIIR_PAGE_REGION_STATIC_ID_REQUIRED'
,p_message_language=>'sv'
,p_message_text=>unistr('Regionens statiska id m\00E5ste anges eftersom sidan inneh\00E5ller flera interaktiva rapporter.')
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143184325142752619)
,p_name=>'APEXIR_NAME'
,p_message_language=>'sv'
,p_message_text=>'Namn'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143214048152752627)
,p_name=>'APEXIR_NEW_AGGREGATION'
,p_message_language=>'sv'
,p_message_text=>'Ny aggregering'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143327221890752661)
,p_name=>'APEXIR_NEW_CATEGORY_LABEL'
,p_message_language=>'sv'
,p_message_text=>'Ny kategori'
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143214194725752627)
,p_name=>'APEXIR_NEW_COMPUTATION'
,p_message_language=>'sv'
,p_message_text=>unistr('Ny ber\00E4kning')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143208899759752626)
,p_name=>'APEXIR_NEXT'
,p_message_language=>'sv'
,p_message_text=>unistr('N\00E4sta')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143211988024752627)
,p_name=>'APEXIR_NEXT_DAY'
,p_message_language=>'sv'
,p_message_text=>unistr('N\00E4sta dag')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143211702019752627)
,p_name=>'APEXIR_NEXT_HOUR'
,p_message_language=>'sv'
,p_message_text=>unistr('N\00E4sta timmen')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143212240762752627)
,p_name=>'APEXIR_NEXT_MONTH'
,p_message_language=>'sv'
,p_message_text=>unistr('N\00E4sta m\00E5nad')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143212130207752627)
,p_name=>'APEXIR_NEXT_WEEK'
,p_message_language=>'sv'
,p_message_text=>unistr('N\00E4sta vecka')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143212073043752627)
,p_name=>'APEXIR_NEXT_X_DAYS'
,p_message_language=>'sv'
,p_message_text=>unistr('N\00E4sta %0 dagarna')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143211835708752627)
,p_name=>'APEXIR_NEXT_X_HOURS'
,p_message_language=>'sv'
,p_message_text=>unistr('N\00E4sta %0 timmarna')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143212479818752627)
,p_name=>'APEXIR_NEXT_X_YEARS'
,p_message_language=>'sv'
,p_message_text=>unistr('N\00E4sta %0 \00E5ren')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143212353712752627)
,p_name=>'APEXIR_NEXT_YEAR'
,p_message_language=>'sv'
,p_message_text=>unistr('N\00E4sta \00E5r')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143184641166752619)
,p_name=>'APEXIR_NO'
,p_message_language=>'sv'
,p_message_text=>'Nej'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143227352447752631)
,p_name=>'APEXIR_NONE'
,p_message_language=>'sv'
,p_message_text=>'- Inget -'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143278365492752647)
,p_name=>'APEXIR_NOT_VALID_EMAIL'
,p_message_language=>'sv'
,p_message_text=>'Inte en giltig e-postadress.'
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143150427218752608)
,p_name=>'APEXIR_NO_COLUMNS_SELECTED'
,p_message_language=>'sv'
,p_message_text=>unistr('Inga kolumner har valts f\00F6r visning. Anv\00E4nd <strong>Kolumner</strong> i menyn \00C5tg\00E4rder f\00F6r att g\00F6ra kolumnerna synliga.')
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143223840563752630)
,p_name=>'APEXIR_NULLS_ALWAYS_FIRST'
,p_message_language=>'sv'
,p_message_text=>unistr('Nulls alltid f\00F6rst')
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143223723156752630)
,p_name=>'APEXIR_NULLS_ALWAYS_LAST'
,p_message_language=>'sv'
,p_message_text=>'Nulls alltid sist'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143224262042752630)
,p_name=>'APEXIR_NULL_SORTING'
,p_message_language=>'sv'
,p_message_text=>'Nullsortering %0'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143220649698752629)
,p_name=>'APEXIR_NUMERIC_FLASHBACK_TIME'
,p_message_language=>'sv'
,p_message_text=>unistr('Flashbacktid m\00E5ste vara numerisk.')
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143220207288752629)
,p_name=>'APEXIR_NUMERIC_SEQUENCE'
,p_message_language=>'sv'
,p_message_text=>unistr('Sekvensen m\00E5ste vara numerisk.')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143224739603752631)
,p_name=>'APEXIR_OPERATOR'
,p_message_language=>'sv'
,p_message_text=>'Operator'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143183255637752618)
,p_name=>'APEXIR_ORANGE'
,p_message_language=>'sv'
,p_message_text=>'orange'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143297222873752652)
,p_name=>'APEXIR_ORIENTATION'
,p_message_language=>'sv'
,p_message_text=>'Orientering'
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143185100568752619)
,p_name=>'APEXIR_OTHER'
,p_message_language=>'sv'
,p_message_text=>unistr('\00D6vrigt')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143151302774752609)
,p_name=>'APEXIR_PAGINATION_OF'
,p_message_language=>'sv'
,p_message_text=>'Sidnumrering i %0'
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143165345498752613)
,p_name=>'APEXIR_PDF_ORIENTATION'
,p_message_language=>'sv'
,p_message_text=>'Sidorientering'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143166019980752613)
,p_name=>'APEXIR_PDF_ORIENTATION_HORIZONTAL'
,p_message_language=>'sv'
,p_message_text=>'Liggande'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143166182680752613)
,p_name=>'APEXIR_PDF_ORIENTATION_VERTICAL'
,p_message_language=>'sv'
,p_message_text=>unistr('St\00E5ende ')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143165218497752613)
,p_name=>'APEXIR_PDF_PAGE_SIZE'
,p_message_language=>'sv'
,p_message_text=>'Sidstorlek'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143165824525752613)
,p_name=>'APEXIR_PDF_PAGE_SIZE_A3'
,p_message_language=>'sv'
,p_message_text=>'A3'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143165717012752613)
,p_name=>'APEXIR_PDF_PAGE_SIZE_A4'
,p_message_language=>'sv'
,p_message_text=>'A4'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143165921046752613)
,p_name=>'APEXIR_PDF_PAGE_SIZE_CUSTOM'
,p_message_language=>'sv'
,p_message_text=>'Anpassad'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143165567711752613)
,p_name=>'APEXIR_PDF_PAGE_SIZE_LEGAL'
,p_message_language=>'sv'
,p_message_text=>'Legal'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143165461141752613)
,p_name=>'APEXIR_PDF_PAGE_SIZE_LETTER'
,p_message_language=>'sv'
,p_message_text=>'Letter'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143165649463752613)
,p_name=>'APEXIR_PDF_PAGE_SIZE_TABLOID'
,p_message_language=>'sv'
,p_message_text=>'Tabloid'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143306170629752655)
,p_name=>'APEXIR_PERCENT_OF_TOTAL_COUNT_X'
,p_message_language=>'sv'
,p_message_text=>'Procent av totalt antal %0 (%)'
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143305338193752655)
,p_name=>'APEXIR_PERCENT_OF_TOTAL_SUM_X'
,p_message_language=>'sv'
,p_message_text=>'Procent av totalsumma %0 (%)'
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143304329056752654)
,p_name=>'APEXIR_PERCENT_TOTAL_COUNT'
,p_message_language=>'sv'
,p_message_text=>'Procent av totalt antal'
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143304245571752654)
,p_name=>'APEXIR_PERCENT_TOTAL_SUM'
,p_message_language=>'sv'
,p_message_text=>'Procent av totalsumma'
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143188723037752620)
,p_name=>'APEXIR_PIE'
,p_message_language=>'sv'
,p_message_text=>'Cirkel'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143254430669752639)
,p_name=>'APEXIR_PIVOT'
,p_message_language=>'sv'
,p_message_text=>'Pivot'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143255940467752640)
,p_name=>'APEXIR_PIVOT_AGG_NOT_NULL'
,p_message_language=>'sv'
,p_message_text=>unistr('Aggregering m\00E5ste anges.')
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143256148476752640)
,p_name=>'APEXIR_PIVOT_AGG_NOT_ON_ROW_COL'
,p_message_language=>'sv'
,p_message_text=>'Du kan inte aggregera en vald kolumn till en radkolumn.'
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143255345703752640)
,p_name=>'APEXIR_PIVOT_COLUMNS'
,p_message_language=>'sv'
,p_message_text=>'Pivotkolumner'
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143255130178752640)
,p_name=>'APEXIR_PIVOT_COLUMN_N'
,p_message_language=>'sv'
,p_message_text=>'Pivotkolumn %0'
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143255745648752640)
,p_name=>'APEXIR_PIVOT_COLUMN_NOT_NULL'
,p_message_language=>'sv'
,p_message_text=>unistr('Pivotkolumn m\00E5ste anges.')
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143108259524752596)
,p_name=>'APEXIR_PIVOT_MAX_ROW_CNT'
,p_message_language=>'sv'
,p_message_text=>unistr('Det maximala antalet rader f\00F6r en pivotfr\00E5ga begr\00E4nsar antalet rader i basfr\00E5gan, inte antalet rader som visas. Din basfr\00E5ga \00F6verstiger det maximala antalet rader p\00E5 %0. Till\00E4mpa ett filter f\00F6r att minska antalet poster i din basfr\00E5ga.')
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143255670805752640)
,p_name=>'APEXIR_PIVOT_SORT'
,p_message_language=>'sv'
,p_message_text=>'Pivotsortering'
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143221680667752630)
,p_name=>'APEXIR_PIVOT_TOO_MANY_VALUES'
,p_message_language=>'sv'
,p_message_text=>unistr('Pivotkolumnen inneh\00E5ller f\00F6r m\00E5nga unika v\00E4rden \2013 pivot-SQL kan inte genereras.')
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143152648227752609)
,p_name=>'APEXIR_PIVOT_VIEW_OF'
,p_message_language=>'sv'
,p_message_text=>'Pivoteringsvy i %0'
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143278407223752647)
,p_name=>'APEXIR_PREVIEW'
,p_message_language=>'sv'
,p_message_text=>unistr('F\00F6rhandsgranska')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143208945331752626)
,p_name=>'APEXIR_PREVIOUS'
,p_message_language=>'sv'
,p_message_text=>unistr('F\00F6reg\00E5ende')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143303276721752654)
,p_name=>'APEXIR_PRIMARY'
,p_message_language=>'sv'
,p_message_text=>unistr('Prim\00E4r')
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143279499271752647)
,p_name=>'APEXIR_PRIMARY_REPORT'
,p_message_language=>'sv'
,p_message_text=>unistr('Prim\00E4r rapport')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143165155923752613)
,p_name=>'APEXIR_PRINT_ACCESSIBLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Inkludera tillg\00E4nglighetstaggar')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143125953453752601)
,p_name=>'APEXIR_PRINT_STRIP_RICH_TEXT'
,p_message_language=>'sv'
,p_message_text=>'RTF-remsa'
,p_version_scn=>2705672
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143234325848752633)
,p_name=>'APEXIR_PRIVATE'
,p_message_language=>'sv'
,p_message_text=>'Privat'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143189388921752620)
,p_name=>'APEXIR_PUBLIC'
,p_message_language=>'sv'
,p_message_text=>unistr('Allm\00E4n')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143184968744752619)
,p_name=>'APEXIR_RED'
,p_message_language=>'sv'
,p_message_text=>unistr('r\00F6d')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143331336911752662)
,p_name=>'APEXIR_REGION_STATIC_ID_DOES_NOT_EXIST'
,p_message_language=>'sv'
,p_message_text=>'Regionens statiska id %0 finns inte.'
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143218485450752629)
,p_name=>'APEXIR_REMOVE'
,p_message_language=>'sv'
,p_message_text=>'Flytta bort'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143218568443752629)
,p_name=>'APEXIR_REMOVE_ALL'
,p_message_language=>'sv'
,p_message_text=>'Ta bort alla'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143326715739752661)
,p_name=>'APEXIR_REMOVE_CHART'
,p_message_language=>'sv'
,p_message_text=>'Flytta bort diagram'
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143218019819752629)
,p_name=>'APEXIR_REMOVE_CONTROL_BREAK'
,p_message_language=>'sv'
,p_message_text=>'Flytta bort kontrollstopp'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143217755100752628)
,p_name=>'APEXIR_REMOVE_FILTER'
,p_message_language=>'sv'
,p_message_text=>'Ta bort filter'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143217859692752628)
,p_name=>'APEXIR_REMOVE_FLASHBACK'
,p_message_language=>'sv'
,p_message_text=>'Flytta bort flashback'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143326896309752661)
,p_name=>'APEXIR_REMOVE_GROUP_BY'
,p_message_language=>'sv'
,p_message_text=>'Flytta bort Gruppera per'
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143218100295752629)
,p_name=>'APEXIR_REMOVE_HIGHLIGHT'
,p_message_language=>'sv'
,p_message_text=>'Flytta bort markering'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143326995320752661)
,p_name=>'APEXIR_REMOVE_PIVOT'
,p_message_language=>'sv'
,p_message_text=>'Flytta bort pivot'
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143308010871752656)
,p_name=>'APEXIR_REMOVE_REPORT'
,p_message_language=>'sv'
,p_message_text=>'Ta bort rapport'
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143289836600752650)
,p_name=>'APEXIR_RENAME_DEFAULT_REPORT'
,p_message_language=>'sv'
,p_message_text=>unistr('Namn\00E4ndra standardrapport')
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143227637519752631)
,p_name=>'APEXIR_RENAME_REPORT'
,p_message_language=>'sv'
,p_message_text=>unistr('Namn\00E4ndra rapport')
,p_is_js_message=>true
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143209234561752626)
,p_name=>'APEXIR_REPORT'
,p_message_language=>'sv'
,p_message_text=>'Rapport'
,p_is_js_message=>true
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143306254502752655)
,p_name=>'APEXIR_REPORTS'
,p_message_language=>'sv'
,p_message_text=>'Rapporter'
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143181424664752618)
,p_name=>'APEXIR_REPORT_ALIAS_DOES_NOT_EXIST'
,p_message_language=>'sv'
,p_message_text=>'Sparad Interaktiv rapport med alias %0 finns inte.'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143234671067752633)
,p_name=>'APEXIR_REPORT_DOES_NOT_EXIST'
,p_message_language=>'sv'
,p_message_text=>'Rapporten finns inte.'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143181562079752618)
,p_name=>'APEXIR_REPORT_ID_DOES_NOT_EXIST'
,p_message_language=>'sv'
,p_message_text=>'Sparat Interaktiv rapport-id %0 finns inte.'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143225961473752631)
,p_name=>'APEXIR_REPORT_SETTINGS'
,p_message_language=>'sv'
,p_message_text=>unistr('Rapportinst\00E4llningar')
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143150182198752608)
,p_name=>'APEXIR_REPORT_SETTINGS_OF'
,p_message_language=>'sv'
,p_message_text=>unistr('Rapportinst\00E4llningar i %0')
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143206247141752625)
,p_name=>'APEXIR_REPORT_VIEW'
,p_message_language=>'sv'
,p_message_text=>'Rapportvy'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143210496651752626)
,p_name=>'APEXIR_RESET'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C5terst\00E4ll')
,p_is_js_message=>true
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143189561920752620)
,p_name=>'APEXIR_RESET_CONFIRM'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C5terst\00E4ll rapport till standardinst\00E4llningarna.')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143184767436752619)
,p_name=>'APEXIR_ROW'
,p_message_language=>'sv'
,p_message_text=>'Rad'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143302313060752654)
,p_name=>'APEXIR_ROWID_NOT_SUPPORTED_FOR_WEBSOURCE'
,p_message_language=>'sv'
,p_message_text=>unistr('Du kan inte anv\00E4nda ROWID som den prim\00E4ra nyckelkolumnen f\00F6r en REST-datak\00E4lla.')
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143217121305752628)
,p_name=>'APEXIR_ROWS'
,p_message_language=>'sv'
,p_message_text=>'Rader'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143280103350752647)
,p_name=>'APEXIR_ROWS_PER_PAGE'
,p_message_language=>'sv'
,p_message_text=>'Rader per sida'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143255489408752640)
,p_name=>'APEXIR_ROW_COLUMNS'
,p_message_language=>'sv'
,p_message_text=>'Radkolumner'
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143255243970752640)
,p_name=>'APEXIR_ROW_COLUMN_N'
,p_message_language=>'sv'
,p_message_text=>'Radkolumn %0'
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143255873195752640)
,p_name=>'APEXIR_ROW_COLUMN_NOT_NULL'
,p_message_language=>'sv'
,p_message_text=>unistr('Radkolumn m\00E5ste anges.')
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143256002075752640)
,p_name=>'APEXIR_ROW_COL_DIFF_FROM_PIVOT_COL'
,p_message_language=>'sv'
,p_message_text=>unistr('Radkolumn m\00E5ste skilja sig fr\00E5n pivotkolumnen.')
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143231657720752633)
,p_name=>'APEXIR_ROW_FILTER'
,p_message_language=>'sv'
,p_message_text=>'Radfilter'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143206351594752625)
,p_name=>'APEXIR_ROW_OF'
,p_message_language=>'sv'
,p_message_text=>'Rad %0 av %1'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143210640811752626)
,p_name=>'APEXIR_ROW_TEXT_CONTAINS'
,p_message_language=>'sv'
,p_message_text=>unistr('Radtext inneh\00E5ller')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143184075392752618)
,p_name=>'APEXIR_SAVE'
,p_message_language=>'sv'
,p_message_text=>'Spara'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143221237942752630)
,p_name=>'APEXIR_SAVED_REPORT'
,p_message_language=>'sv'
,p_message_text=>'Sparad rapport'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143221108734752629)
,p_name=>'APEXIR_SAVED_REPORT_MSG'
,p_message_language=>'sv'
,p_message_text=>'Sparad rapport = "%0"'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143223339703752630)
,p_name=>'APEXIR_SAVE_DEFAULT_CONFIRM'
,p_message_language=>'sv'
,p_message_text=>unistr('De aktuella rapportinst\00E4llningarna anv\00E4nds som standard f\00F6r alla anv\00E4ndare.')
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143289732437752650)
,p_name=>'APEXIR_SAVE_DEFAULT_REPORT'
,p_message_language=>'sv'
,p_message_text=>'Spara standardrapport'
,p_is_js_message=>true
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143210310569752626)
,p_name=>'APEXIR_SAVE_REPORT'
,p_message_language=>'sv'
,p_message_text=>'Spara rapport'
,p_is_js_message=>true
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143327184591752661)
,p_name=>'APEXIR_SAVE_REPORT_DEFAULT'
,p_message_language=>'sv'
,p_message_text=>'Spara rapport *'
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143281145511752647)
,p_name=>'APEXIR_SEARCH'
,p_message_language=>'sv'
,p_message_text=>unistr('S\00F6k')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143216066698752628)
,p_name=>'APEXIR_SEARCH_BAR'
,p_message_language=>'sv'
,p_message_text=>unistr('S\00F6kf\00E4lt')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143149415230752608)
,p_name=>'APEXIR_SEARCH_BAR_OF'
,p_message_language=>'sv'
,p_message_text=>unistr('S\00F6kf\00E4lt i %0')
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143327010157752661)
,p_name=>'APEXIR_SEARCH_COLUMN'
,p_message_language=>'sv'
,p_message_text=>unistr('S\00F6k i: %0')
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143286631278752649)
,p_name=>'APEXIR_SEARCH_REPORT'
,p_message_language=>'sv'
,p_message_text=>unistr('S\00F6k efter rapport')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143270659786752644)
,p_name=>'APEXIR_SELECTED_COLUMNS'
,p_message_language=>'sv'
,p_message_text=>'Valda kolumner'
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143185772870752619)
,p_name=>'APEXIR_SELECT_COLUMN'
,p_message_language=>'sv'
,p_message_text=>unistr('- V\00E4lj kolumn -')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143209661739752626)
,p_name=>'APEXIR_SELECT_COLUMNS'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4lj kolumner')
,p_is_js_message=>true
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143189217131752620)
,p_name=>'APEXIR_SELECT_FUNCTION'
,p_message_language=>'sv'
,p_message_text=>unistr('- V\00E4lj funktion -')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143216899763752628)
,p_name=>'APEXIR_SELECT_GROUP_BY_COLUMN'
,p_message_language=>'sv'
,p_message_text=>unistr('- V\00E4lj Gruppera per kolumn -')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143254966691752640)
,p_name=>'APEXIR_SELECT_PIVOT_COLUMN'
,p_message_language=>'sv'
,p_message_text=>unistr('- V\00E4lj pivotkolumn -')
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143305285168752655)
,p_name=>'APEXIR_SELECT_ROW'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4lj rad')
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143255001661752640)
,p_name=>'APEXIR_SELECT_ROW_COLUMN'
,p_message_language=>'sv'
,p_message_text=>unistr('- V\00E4lj radkolumn -')
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143136572639752604)
,p_name=>'APEXIR_SEND'
,p_message_language=>'sv'
,p_message_text=>'Skicka'
,p_is_js_message=>true
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143159075823752611)
,p_name=>'APEXIR_SEND_AS_EMAIL'
,p_message_language=>'sv'
,p_message_text=>'Skicka som e-post'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143184417663752619)
,p_name=>'APEXIR_SEQUENCE'
,p_message_language=>'sv'
,p_message_text=>'Sekvens'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143209863465752626)
,p_name=>'APEXIR_SORT'
,p_message_language=>'sv'
,p_message_text=>'Sortera'
,p_is_js_message=>true
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143219343435752629)
,p_name=>'APEXIR_SORT_ASCENDING'
,p_message_language=>'sv'
,p_message_text=>'Sortera i stigande ordning'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143219472204752629)
,p_name=>'APEXIR_SORT_DESCENDING'
,p_message_language=>'sv'
,p_message_text=>'Sortera i fallande ordning'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143307445267752655)
,p_name=>'APEXIR_SORT_ORDER'
,p_message_language=>'sv'
,p_message_text=>'Sorteringsordning'
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143213720772752627)
,p_name=>'APEXIR_SPACE_AS_IN_ONE_EMPTY_STRING'
,p_message_language=>'sv'
,p_message_text=>'blanksteg'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143224961180752631)
,p_name=>'APEXIR_STATUS'
,p_message_language=>'sv'
,p_message_text=>'Status %0'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143278872529752647)
,p_name=>'APEXIR_SUBSCRIPTION'
,p_message_language=>'sv'
,p_message_text=>'Prenumeration'
,p_is_js_message=>true
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143304648502752654)
,p_name=>'APEXIR_SUBSCRIPTION_ENDING'
,p_message_language=>'sv'
,p_message_text=>'Slutar'
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143123629323752600)
,p_name=>'APEXIR_SUBSCRIPTION_SKIP_IF_NDF'
,p_message_language=>'sv'
,p_message_text=>unistr('Hoppa \00F6ver om inga data hittades')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143304564407752654)
,p_name=>'APEXIR_SUBSCRIPTION_STARTING_FROM'
,p_message_language=>'sv'
,p_message_text=>unistr('Startar fr\00E5n')
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143305494978752655)
,p_name=>'APEXIR_SUM_X'
,p_message_language=>'sv'
,p_message_text=>'Summa %0'
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143296337323752652)
,p_name=>'APEXIR_TABLE_SUMMARY'
,p_message_language=>'sv'
,p_message_text=>'%0, rapport = %1, vy = %2'
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143183381898752618)
,p_name=>'APEXIR_TEXT_COLOR'
,p_message_language=>'sv'
,p_message_text=>unistr('Textf\00E4rg')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143202075568752624)
,p_name=>'APEXIR_TIME_DAYS'
,p_message_language=>'sv'
,p_message_text=>'dagar'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143201930692752624)
,p_name=>'APEXIR_TIME_HOURS'
,p_message_language=>'sv'
,p_message_text=>'timmar'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143201898993752624)
,p_name=>'APEXIR_TIME_MINS'
,p_message_language=>'sv'
,p_message_text=>'minuter'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143202244458752624)
,p_name=>'APEXIR_TIME_MONTHS'
,p_message_language=>'sv'
,p_message_text=>unistr('m\00E5nader')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143202147655752624)
,p_name=>'APEXIR_TIME_WEEKS'
,p_message_language=>'sv'
,p_message_text=>'veckor'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143202370654752624)
,p_name=>'APEXIR_TIME_YEARS'
,p_message_language=>'sv'
,p_message_text=>unistr('\00E5r')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143307810088752655)
,p_name=>'APEXIR_TOGGLE'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4xla')
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143218644245752629)
,p_name=>'APEXIR_TOP'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00E4ngst upp')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143301334628752653)
,p_name=>'APEXIR_UNGROUPED_COLUMN'
,p_message_language=>'sv'
,p_message_text=>'Ogrupperad kolumn'
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143220122500752629)
,p_name=>'APEXIR_UNIQUE_HIGHLIGHT_NAME'
,p_message_language=>'sv'
,p_message_text=>unistr('Markerat namn m\00E5ste vara unikt.')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143188092825752620)
,p_name=>'APEXIR_UNSUPPORTED_DATA_TYPE'
,p_message_language=>'sv'
,p_message_text=>unistr('datatypen st\00F6ds inte')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143218732035752629)
,p_name=>'APEXIR_UP'
,p_message_language=>'sv'
,p_message_text=>'Upp'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143220379960752629)
,p_name=>'APEXIR_VALID_COLOR'
,p_message_language=>'sv'
,p_message_text=>unistr('Ange en giltig f\00E4rg.')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143220476110752629)
,p_name=>'APEXIR_VALID_FORMAT_MASK'
,p_message_language=>'sv'
,p_message_text=>'Ange en giltig formatmask.'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143185294180752619)
,p_name=>'APEXIR_VALUE'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4rde')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143219225484752629)
,p_name=>'APEXIR_VALUE_AXIS_TITLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Axelrubrik f\00F6r v\00E4rde')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143227057267752631)
,p_name=>'APEXIR_VALUE_REQUIRED'
,p_message_language=>'sv'
,p_message_text=>unistr('Ett v\00E4rde m\00E5ste anges')
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143188686385752620)
,p_name=>'APEXIR_VCOLUMN'
,p_message_language=>'sv'
,p_message_text=>'Vertikal kolumn'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143297440445752652)
,p_name=>'APEXIR_VERTICAL'
,p_message_language=>'sv'
,p_message_text=>'Vertikalt'
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143226311070752631)
,p_name=>'APEXIR_VIEW_CHART'
,p_message_language=>'sv'
,p_message_text=>'Visa diagram'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143284990480752649)
,p_name=>'APEXIR_VIEW_DETAIL'
,p_message_language=>'sv'
,p_message_text=>'Visa detalj'
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143329285282752662)
,p_name=>'APEXIR_VIEW_DOES_NOT_EXIST'
,p_message_language=>'sv'
,p_message_text=>'Rapporten har ingen definierad %0-vy.'
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143285008342752649)
,p_name=>'APEXIR_VIEW_GROUP_BY'
,p_message_language=>'sv'
,p_message_text=>'Visa Gruppera per'
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143284821315752648)
,p_name=>'APEXIR_VIEW_ICONS'
,p_message_language=>'sv'
,p_message_text=>'Visa ikoner'
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143254706537752640)
,p_name=>'APEXIR_VIEW_PIVOT'
,p_message_language=>'sv'
,p_message_text=>'Visa pivot'
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143226427467752631)
,p_name=>'APEXIR_VIEW_REPORT'
,p_message_language=>'sv'
,p_message_text=>'Visa rapport'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143279068187752647)
,p_name=>'APEXIR_WEEKLY'
,p_message_language=>'sv'
,p_message_text=>'Veckovis'
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143209127087752626)
,p_name=>'APEXIR_WORKING_REPORT'
,p_message_language=>'sv'
,p_message_text=>'Aktuell rapport'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143306883275752655)
,p_name=>'APEXIR_X_DAYS'
,p_message_language=>'sv'
,p_message_text=>'%0 dagar'
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143306795049752655)
,p_name=>'APEXIR_X_HOURS'
,p_message_language=>'sv'
,p_message_text=>'%0 timmar'
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143306628756752655)
,p_name=>'APEXIR_X_MINS'
,p_message_language=>'sv'
,p_message_text=>'%0 minuter'
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143307002407752655)
,p_name=>'APEXIR_X_MONTHS'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 m\00E5nader')
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143306957085752655)
,p_name=>'APEXIR_X_WEEKS'
,p_message_language=>'sv'
,p_message_text=>'%0 veckor'
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143307138994752655)
,p_name=>'APEXIR_X_YEARS'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 \00E5r')
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143304843025752654)
,p_name=>'APEXIR_YEAR'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C5r')
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143183031995752618)
,p_name=>'APEXIR_YELLOW'
,p_message_language=>'sv'
,p_message_text=>'gul'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143184597428752619)
,p_name=>'APEXIR_YES'
,p_message_language=>'sv'
,p_message_text=>'Ja'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143219007218752629)
,p_name=>'APEX_GROUP.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 inneh\00E5ller < or > som \00E4r ogiltiga tecken.')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143242938212752636)
,p_name=>'APEX_REGION'
,p_message_language=>'sv'
,p_message_text=>'Region'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143134003089752604)
,p_name=>'APEX_ZIP.EXTRACT_FAILED'
,p_message_language=>'sv'
,p_message_text=>'Kunde inte extrahera zip-fil.'
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143133961195752604)
,p_name=>'APEX_ZIP.INVALID_ZIPFILE'
,p_message_language=>'sv'
,p_message_text=>unistr('End-of-central-directory-signatur hittades inte. Det h\00E4r \00E4r inte en zip-fil.')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143165047545752613)
,p_name=>'API_PRECONDITION_VIOLATED'
,p_message_language=>'sv'
,p_message_text=>unistr('API-f\00F6rhandsvillkor \00F6vertr\00E4tt')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143187104437752619)
,p_name=>'APP.SETTING.CANNOT.GET'
,p_message_language=>'sv'
,p_message_text=>unistr('Kan inte h\00E4mta v\00E4rde f\00F6r Applikationsinst\00E4llningen %0 eftersom associerat byggalternativ \00E4r inaktivt.')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143187056624752619)
,p_name=>'APP.SETTING.CANNOT.SET'
,p_message_language=>'sv'
,p_message_text=>unistr('Kan inte ange v\00E4rde f\00F6r Applikationsinst\00E4llningen %0 eftersom associerat byggalternativ \00E4r inaktivt.')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143299622178752653)
,p_name=>'APP.SETTING.INVALID.VALUE'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4rdet f\00F6r applikationsinst\00E4llningen %0 \00E4r ogiltigt')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143299590538752653)
,p_name=>'APP.SETTING.NOT.DEFINED'
,p_message_language=>'sv'
,p_message_text=>unistr('Beg\00E4rd applikationsinst\00E4llning %0 har inte definierats')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143299755161752653)
,p_name=>'APP.SETTING.VALUE.NOT.NULL'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4rdet f\00F6r applikationsinst\00E4llningen %0 f\00E5r inte vara null')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143173625512752615)
,p_name=>'BACK'
,p_message_language=>'sv'
,p_message_text=>'Tillbaka'
,p_version_scn=>2705681
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143156037767752610)
,p_name=>'BUILDER'
,p_message_language=>'sv'
,p_message_text=>'Verktyg'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143229601986752632)
,p_name=>'BUTTON LABEL'
,p_message_language=>'sv'
,p_message_text=>'Knappetikett'
,p_version_scn=>2705693
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143152963431752609)
,p_name=>'BUTTON_CSS_CLASSES'
,p_message_language=>'sv'
,p_message_text=>unistr('CSS-klasser f\00F6r knapp')
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143191410378752621)
,p_name=>'BUTTON_ID'
,p_message_language=>'sv'
,p_message_text=>unistr('Genererat knapp-id kommer antingen att vara knappens statiska id om det \00E4r definierat, eller ett internt genererat id i formatet "B" || [internt knapp-id]')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143125453038752601)
,p_name=>'CANDLESTICK'
,p_message_language=>'sv'
,p_message_text=>'Candlestick'
,p_version_scn=>2705672
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143239404751752635)
,p_name=>'CENTER'
,p_message_language=>'sv'
,p_message_text=>'Center'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143186056077752619)
,p_name=>'CHANGE_PW_REQUEST'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 Beg\00E4ran')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143176019524752616)
,p_name=>'CHECK$'
,p_message_language=>'sv'
,p_message_text=>unistr('radv\00E4ljare')
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143301486572752653)
,p_name=>'CHECKED'
,p_message_language=>'sv'
,p_message_text=>'markerad'
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143277824660752646)
,p_name=>'COLUMN'
,p_message_language=>'sv'
,p_message_text=>'Kolumn'
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143235402399752634)
,p_name=>'COMMENTS'
,p_message_language=>'sv'
,p_message_text=>'Kommentarer'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143216487811752628)
,p_name=>'CONTINUE'
,p_message_language=>'sv'
,p_message_text=>unistr('Forts\00E4tt')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143173914100752615)
,p_name=>'COPYRIGHT'
,p_message_language=>'sv'
,p_message_text=>'Copyright &copy; 1999, %0, Oracle och/eller dess dotterbolag.'
,p_version_scn=>2705681
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143222108906752630)
,p_name=>'COUNT'
,p_message_language=>'sv'
,p_message_text=>'Antal'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143229192523752632)
,p_name=>'CREATE'
,p_message_language=>'sv'
,p_message_text=>'Skapa'
,p_version_scn=>2705693
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143284591087752648)
,p_name=>'CREATED'
,p_message_language=>'sv'
,p_message_text=>'Skapad'
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143284654212752648)
,p_name=>'CREATED_BY'
,p_message_language=>'sv'
,p_message_text=>'Skapad av'
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143205575362752625)
,p_name=>'CREATED_ON'
,p_message_language=>'sv'
,p_message_text=>'Skapad den'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143216645757752628)
,p_name=>'CUSTOM'
,p_message_language=>'sv'
,p_message_text=>'Anpassad'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143227865714752631)
,p_name=>'CUSTOMIZE'
,p_message_language=>'sv'
,p_message_text=>'Anpassa'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143229891395752632)
,p_name=>'CUSTOMIZE.USER_PAGE_PREFS_RESET'
,p_message_language=>'sv'
,p_message_text=>unistr('Sidinst\00E4llningarna har \00E5terst\00E4llts f\00F6r anv\00E4ndaren %0.')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143229954463752632)
,p_name=>'CUSTOMIZE.USER_PREFS_CHANGED'
,p_message_language=>'sv'
,p_message_text=>unistr('Inst\00E4llningarna har \00E4ndrats f\00F6r anv\00E4ndaren %0.')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143229758351752632)
,p_name=>'CUSTOMIZE.USER_PREFS_RESET'
,p_message_language=>'sv'
,p_message_text=>unistr('Sidinst\00E4llningarna har \00E5terst\00E4llts f\00F6r anv\00E4ndaren %0.')
,p_version_scn=>2705693
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143190863638752620)
,p_name=>'DAILY'
,p_message_language=>'sv'
,p_message_text=>'Dagligen'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143154200811752610)
,p_name=>'DATA.LOAD.INVALID_FILE'
,p_message_language=>'sv'
,p_message_text=>unistr('Den uppladdade filen \00E4r ogiltig eller har fel filtill\00E4gg.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143186231986752619)
,p_name=>'DATA.LOAD.INVALID_SELECTOR'
,p_message_language=>'sv'
,p_message_text=>unistr('Ogiltig v\00E4ljare f\00F6r XML eller JSON anv\00E4nds.')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143131376349752603)
,p_name=>'DATA.LOAD.NO_COMMON_COLUMNS'
,p_message_language=>'sv'
,p_message_text=>unistr('Dataprofilen och den uppladdade filen inneh\00E5ller ingen m\00E5ltabellkolumn.')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143245200708752637)
,p_name=>'DATA.LOAD.NO_FILE_CONTENTS'
,p_message_language=>'sv'
,p_message_text=>'Inga data hittades i den uppladdade filen.'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143245346602752637)
,p_name=>'DATA.LOAD.NO_WORKSHEET_CONTENTS'
,p_message_language=>'sv'
,p_message_text=>'Inga data hittades i arbetsbladet "%0".'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143151155352752609)
,p_name=>'DATA.LOAD.NO_XLSX_FILE'
,p_message_language=>'sv'
,p_message_text=>unistr('Den angivna filen \00E4r inte en giltig XLSX-fil.')
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143117187193752599)
,p_name=>'DATA.LOAD.ROWS_PROCESSED'
,p_message_language=>'sv'
,p_message_text=>unistr('Dataladdning slutf\00F6rd: %0 rader har bearbetats.')
,p_version_scn=>2705670
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143119411181752599)
,p_name=>'DATA.LOAD.ROWS_PROCESSED_W_ERROR_ROW'
,p_message_language=>'sv'
,p_message_text=>unistr('Dataladdning slutf\00F6rd: %0 rader har bearbetats med 1 fel.')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143119718966752599)
,p_name=>'DATA.LOAD.ROWS_PROCESSED_W_ERROR_ROWS'
,p_message_language=>'sv'
,p_message_text=>unistr('Dataladdning slutf\00F6rd: %0 rader har bearbetats med %1 fel.')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143119585037752599)
,p_name=>'DATA.LOAD.ROW_PROCESSED'
,p_message_language=>'sv'
,p_message_text=>unistr('Dataladdning slutf\00F6rd: 1 rad har bearbetats.')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143133813302752604)
,p_name=>'DATA.LOAD.ROW_PROCESSED_W_ERROR_ROW'
,p_message_language=>'sv'
,p_message_text=>unistr('Dataladdning slutf\00F6rd: 1 rad har bearbetats med fel.')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143119672219752599)
,p_name=>'DATA.LOAD.ROW_PROCESSED_W_ERROR_ROWS'
,p_message_language=>'sv'
,p_message_text=>unistr('Dataladdning slutf\00F6rd: 1 rad har bearbetats utan fel.')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143252357223752639)
,p_name=>'DATA_LOAD.COLUMN_NAMES_MAPPING'
,p_message_language=>'sv'
,p_message_text=>unistr('M\00E5lkolumn')
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143159587525752611)
,p_name=>'DATA_LOAD.DO_NOT_LOAD'
,p_message_language=>'sv'
,p_message_text=>'Ladda inte'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143159682660752611)
,p_name=>'DATA_LOAD.FAILED'
,p_message_language=>'sv'
,p_message_text=>unistr('F\00F6rbearbetningsfel')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143252476000752639)
,p_name=>'DATA_LOAD.FIRST_COLUMN_NAMES'
,p_message_language=>'sv'
,p_message_text=>unistr('K\00E4llkolumn')
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143253229200752639)
,p_name=>'DATA_LOAD.FORMAT'
,p_message_language=>'sv'
,p_message_text=>'Datum/talformat'
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143159300347752611)
,p_name=>'DATA_LOAD.INSERT'
,p_message_language=>'sv'
,p_message_text=>'Infoga rad'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143315456712752658)
,p_name=>'DATA_LOAD.LOOKUP_FAILED'
,p_message_language=>'sv'
,p_message_text=>unistr('Kunde inte h\00E4mta uppslagsv\00E4rdet.')
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143285132464752649)
,p_name=>'DATA_LOAD.MAPPING'
,p_message_language=>'sv'
,p_message_text=>'Data/tabellmappning'
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143253363603752639)
,p_name=>'DATA_LOAD.ROW'
,p_message_language=>'sv'
,p_message_text=>'Rad'
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143159795303752611)
,p_name=>'DATA_LOAD.SEQUENCE_ACTION'
,p_message_language=>'sv'
,p_message_text=>unistr('Sekvens: \00C5tg\00E4rd')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143247090577752637)
,p_name=>'DATA_LOAD.TRANSFORMATION_FAILED'
,p_message_language=>'sv'
,p_message_text=>unistr('Transformeringsregeln utf\00F6rdes inte')
,p_version_scn=>2705695
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143159443374752611)
,p_name=>'DATA_LOAD.UPDATE'
,p_message_language=>'sv'
,p_message_text=>'Uppdatera rad'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143221766570752630)
,p_name=>'DATE'
,p_message_language=>'sv'
,p_message_text=>'Datum'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143194656756752622)
,p_name=>'DAY'
,p_message_language=>'sv'
,p_message_text=>'dag'
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143194793837752622)
,p_name=>'DAYS'
,p_message_language=>'sv'
,p_message_text=>'dagar'
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143235108069752634)
,p_name=>'DEBUGGING_OFF'
,p_message_language=>'sv'
,p_message_text=>unistr('Fels\00F6kning har inte aktiverats f\00F6r den h\00E4r applikationen.')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143286847034752649)
,p_name=>'DEFAULT'
,p_message_language=>'sv'
,p_message_text=>'Standard'
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143195408356752622)
,p_name=>'DELETE'
,p_message_language=>'sv'
,p_message_text=>'ta bort'
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143171019960752615)
,p_name=>'DELETE_MSG'
,p_message_language=>'sv'
,p_message_text=>unistr('Vill du utf\00F6ra borttagnings\00E5tg\00E4rden?')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143150648002752608)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES'
,p_message_language=>'sv'
,p_message_text=>unistr('Sessions\00E5sidos\00E4ttningar')
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143151566905752609)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ENABLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Aktivera sessions\00E5sidos\00E4ttningar')
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143152407484752609)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ERROR_LOAD'
,p_message_language=>'sv'
,p_message_text=>unistr('Ett fel intr\00E4ffade n\00E4r sessions\00E5sidos\00E4ttningarna laddades.')
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143152243157752609)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ERROR_SAVE'
,p_message_language=>'sv'
,p_message_text=>unistr('Ett fel intr\00E4ffade n\00E4r sessions\00E5sidos\00E4ttningarna sparades.')
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143152185622752609)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_SAVED'
,p_message_language=>'sv'
,p_message_text=>unistr('Sessions\00E5sidos\00E4ttningarna har sparats. St\00E4ng dialogrutan f\00F6r att se \00E4ndringarna.')
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143125340099752601)
,p_name=>'DIAL_PCT'
,p_message_language=>'sv'
,p_message_text=>'Visare (procent)'
,p_version_scn=>2705672
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143166336411752613)
,p_name=>'DOWNLOAD'
,p_message_language=>'sv'
,p_message_text=>'Ladda ned'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143285940387752649)
,p_name=>'DUP_USER'
,p_message_language=>'sv'
,p_message_text=>unistr('Dubblettanv\00E4ndarnamn f\00F6rekommer i listan.')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143174785836752616)
,p_name=>'EDIT'
,p_message_language=>'sv'
,p_message_text=>'Redigera'
,p_is_js_message=>true
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143185988440752619)
,p_name=>'EMAIL_NOT_FOUND'
,p_message_language=>'sv'
,p_message_text=>'E-postadressen "%0" hittades inte.'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143168684440752614)
,p_name=>'EMAIL_SENT_BY'
,p_message_language=>'sv'
,p_message_text=>'E-postmeddelandet skickades av %0.'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143286183118752649)
,p_name=>'EMAIL_TOO_LONG'
,p_message_language=>'sv'
,p_message_text=>unistr('E-postadressen \00E4r f\00F6r l\00E5ng. Gr\00E4nsen \00E4r 240 tecken.')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143216397411752628)
,p_name=>'ERROR'
,p_message_language=>'sv'
,p_message_text=>'Fel'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143247121145752637)
,p_name=>'ERROR_SET_ITEM_STATE_FOR_PPR_REGION'
,p_message_language=>'sv'
,p_message_text=>unistr('Kan inte konfigurera sidobjektets k\00E4llv\00E4rde f\00F6r partiell sidf\00F6rnyelseregion')
,p_version_scn=>2705695
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143207675471752625)
,p_name=>'F4500_P10_CREATED_BY'
,p_message_language=>'sv'
,p_message_text=>'Skapad av'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143168980831752614)
,p_name=>'F4500_P2613_EXPIRED'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00F6senordet har upph\00F6rt')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143161357227752612)
,p_name=>'FILE_EMPTY'
,p_message_language=>'sv'
,p_message_text=>unistr('Filen \00E4r tom.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143251106307752638)
,p_name=>'FILE_TOO_LARGE'
,p_message_language=>'sv'
,p_message_text=>unistr('Storleken p\00E5 den uppladdade filen \00F6verskrider %0 Mbyte. Ladda upp en mindre fil.')
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143171295133752615)
,p_name=>'FILE_UPLOAD_AUTHENTICATION_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('Anv\00E4ndarautentiseringen utf\00F6rdes inte och en eller fler filer laddades inte upp.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143171380769752615)
,p_name=>'FILE_UPLOAD_PUBLICUSER_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('Den h\00E4r instansen till\00E5ter inte icke-autentiserade anv\00E4ndare att ladda upp filer.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143251230576752638)
,p_name=>'FILTERS'
,p_message_language=>'sv'
,p_message_text=>'Filter'
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143229210778752632)
,p_name=>'FLOW.SINGLE_VALIDATION_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('1 fel har intr\00E4ffat')
,p_is_js_message=>true
,p_version_scn=>2705693
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143228489548752632)
,p_name=>'FLOW.VALIDATION_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 fel har intr\00E4ffat')
,p_is_js_message=>true
,p_version_scn=>2705693
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143173851140752615)
,p_name=>'FORM_OF'
,p_message_language=>'sv'
,p_message_text=>'%0 av %1'
,p_version_scn=>2705681
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143212803825752627)
,p_name=>'GO'
,p_message_language=>'sv'
,p_message_text=>'OK'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143315016632752658)
,p_name=>'HELP'
,p_message_language=>'sv'
,p_message_text=>unistr('Hj\00E4lp')
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143156107740752610)
,p_name=>'HOME'
,p_message_language=>'sv'
,p_message_text=>'Hem'
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143194437080752622)
,p_name=>'HOUR'
,p_message_language=>'sv'
,p_message_text=>'timme'
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143194590171752622)
,p_name=>'HOURS'
,p_message_language=>'sv'
,p_message_text=>'timmar'
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143175926981752616)
,p_name=>'ICON'
,p_message_language=>'sv'
,p_message_text=>'Ikon %0'
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143153228152752609)
,p_name=>'ICON.EDITOR.CROP.HELP'
,p_message_language=>'sv'
,p_message_text=>unistr('Hj\00E4lp f\00F6r ikonen Besk\00E4r')
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143154400678752610)
,p_name=>'ICON.EDITOR.CROPPER.HELPTEXT'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Dra i ikonen och anv\00E4nd zoomskjutreglaget f\00F6r att ompositionera den i ramen.</p>'),
'',
unistr('<p>N\00E4r du laddar upp en ny ikon f\00E5r den en ny storlek f\00F6r att passa in i tre format: adressikon, liten och stor ikon.</p>'),
'',
unistr('<p>N\00E4r du fokuserar p\00E5 ikonbesk\00E4raren \00E4r f\00F6ljande kortkommandon tillg\00E4ngliga:</p>'),
'<ul>',
unistr('    <li>V\00E4nsterpil: Flytta bilden \00E5t v\00E4nster*</li>'),
unistr('    <li>Upp\00E5tpil: Flytta bilden upp\00E5t*</li>'),
unistr('    <li>H\00F6gerpil: Flytta bilden \00E5t h\00F6ger*</li>'),
unistr('    <li>Ned\00E5tpil: Flytta bilden ned\00E5t*</li>'),
'    <li>I: Zooma in</li>',
'    <li>O: Zooma ut</li>',
unistr('    <li>L: Rotera \00E5t h\00F6ger</li>'),
unistr('    <li>R: Rotera \00E5t v\00E4nster</li>'),
'</ul>',
'',
unistr('<p class="margin-top-md"><em>*Tryck l\00E4nge p\00E5 Skift f\00F6r att flytta snabbare</em></p>')))
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143159990333752611)
,p_name=>'ICON.EDITOR.CROPPER.SUBTITLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Dra f\00F6r att ompositionera ikonen')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143160073349752611)
,p_name=>'ICON.EDITOR.CROPPER.ZOOM_SLIDER_LABEL'
,p_message_language=>'sv'
,p_message_text=>unistr('Dra i skjutreglaget f\00F6r att justera zoomniv\00E5n')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143153042062752609)
,p_name=>'ICON.EDITOR.DIALOG.TITLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Ikon f\00F6r Redigera applikation')
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143153330721752609)
,p_name=>'ICON.EDITOR.ERROR.SAVING'
,p_message_language=>'sv'
,p_message_text=>unistr('Ikon f\00F6r fel vid spara')
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143235760986752634)
,p_name=>'ICON.EDITOR.LEGACY_DATA'
,p_message_language=>'sv'
,p_message_text=>unistr('<p><span class="a-Icon icon-tr-warning"></span> Applikationen anv\00E4nder \00E4ldre ikoner. Om du laddar upp en ny ikon ers\00E4tts alla \00E4ldre ikoner.</p>')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143153996933752609)
,p_name=>'ICON.EDITOR.UPLOAD.ICON'
,p_message_language=>'sv'
,p_message_text=>'Ladda upp en ny ikon'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143230126571752632)
,p_name=>'INVALID_CREDENTIALS'
,p_message_language=>'sv'
,p_message_text=>'Ogiltiga inloggningsuppgifter'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143331299449752662)
,p_name=>'INVALID_VALUE_FOR_PARAMETER'
,p_message_language=>'sv'
,p_message_text=>unistr('Ogiltigt v\00E4rde f\00F6r parameter: %0')
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143224445788752630)
,p_name=>'IR_AS_DEFAULT_REPORT_SETTING'
,p_message_language=>'sv'
,p_message_text=>unistr('Som standardinst\00E4llningar f\00F6r rapport')
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143224567236752630)
,p_name=>'IR_AS_NAMED_REPORT'
,p_message_language=>'sv'
,p_message_text=>'Som namngiven rapport'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143206418599752625)
,p_name=>'IR_ERROR'
,p_message_language=>'sv'
,p_message_text=>'%0 fel. %1'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143206175861752625)
,p_name=>'IR_FRM_NAV_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('Kan inte ber\00E4kna formul\00E4rnavigering. %0')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143181724027752618)
,p_name=>'IR_NOT_FOUND'
,p_message_language=>'sv'
,p_message_text=>'Interaktiv rapport hittades inte.'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143181119215752618)
,p_name=>'IR_REGION_NOT_EXIST'
,p_message_language=>'sv'
,p_message_text=>'Interaktiv rapportregion finns inte i applikationen %0, sida %1 och region %2.'
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143224366732752630)
,p_name=>'IR_STAR'
,p_message_language=>'sv'
,p_message_text=>unistr('Visas endast f\00F6r utvecklare')
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143212578222752627)
,p_name=>'IR_UNIQUE_KEY_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('Rapportfr\00E5gan beh\00F6ver en unik nyckel f\00F6r att identifiera varje rad.  Den angivna nyckeln kan inte anv\00E4ndas f\00F6r den h\00E4r fr\00E5gan.  Definiera en unik nyckelkolumn. %0')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143212653878752627)
,p_name=>'IR_UNIQUE_KEY_ERROR2'
,p_message_language=>'sv'
,p_message_text=>unistr('Rapportfr\00E5gan beh\00F6ver en unik nyckel f\00F6r att identifiera varje rad.  Den angivna nyckeln kan inte anv\00E4ndas f\00F6r den h\00E4r fr\00E5gan.  Redigera rapportattributen f\00F6r att definiera en unik nyckelkolumn. %0')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143253541635752639)
,p_name=>'ITEM.FILE_UPLOAD.CHOOSE_FILE'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4lj fil')
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143253408522752639)
,p_name=>'ITEM.FILE_UPLOAD.DRAG_DROP_FILE_HERE'
,p_message_language=>'sv'
,p_message_text=>unistr('Dra och sl\00E4pp filen h\00E4r eller')
,p_is_js_message=>true
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143174185330752616)
,p_name=>'ITEMS'
,p_message_language=>'sv'
,p_message_text=>'Objekt'
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143207898394752626)
,p_name=>'ITEM_VALUE'
,p_message_language=>'sv'
,p_message_text=>unistr('Objektv\00E4rde')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143222468822752630)
,p_name=>'LABEL'
,p_message_language=>'sv'
,p_message_text=>'Etikett'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143235054427752634)
,p_name=>'LANGUAGE'
,p_message_language=>'sv'
,p_message_text=>unistr('Spr\00E5k')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143195145005752622)
,p_name=>'LAST'
,p_message_language=>'sv'
,p_message_text=>'senaste'
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143171106079752615)
,p_name=>'LENGTH'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00E4ngd')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143229463603752632)
,p_name=>'LOGIN'
,p_message_language=>'sv'
,p_message_text=>'Logga in'
,p_version_scn=>2705693
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143271027854752644)
,p_name=>'MANAGE'
,p_message_language=>'sv'
,p_message_text=>'Hantera'
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143334103653752663)
,p_name=>'MAXIMIZE'
,p_message_language=>'sv'
,p_message_text=>'Maximera'
,p_is_js_message=>true
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143194215013752621)
,p_name=>'MINUTE'
,p_message_language=>'sv'
,p_message_text=>'minut'
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143194379663752622)
,p_name=>'MINUTES'
,p_message_language=>'sv'
,p_message_text=>'minuter'
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143286319397752649)
,p_name=>'MISSING_AT'
,p_message_language=>'sv'
,p_message_text=>'"@" saknas i e-postadressen.'
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143286511032752649)
,p_name=>'MISSING_DIALOG_PAGE_TEMPLATE_WARNING'
,p_message_language=>'sv'
,p_message_text=>unistr('Varning: Ingen mall f\00F6r Dialogsia har definierats f\00F6r Dialogsidan %0 i applikationen %1.')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143286263937752649)
,p_name=>'MISSING_DOT'
,p_message_language=>'sv'
,p_message_text=>unistr('"." saknas i e-postadressdom\00E4nen.')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143232569089752633)
,p_name=>'MODULE'
,p_message_language=>'sv'
,p_message_text=>'Modul'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143186761439752619)
,p_name=>'MONTH'
,p_message_language=>'sv'
,p_message_text=>unistr('M\00E5nad')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143190616021752620)
,p_name=>'MONTHLY'
,p_message_language=>'sv'
,p_message_text=>unistr('M\00E5natligen')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143186865591752619)
,p_name=>'MONTHS'
,p_message_language=>'sv'
,p_message_text=>unistr('m\00E5nader')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143222049308752630)
,p_name=>'MOVE'
,p_message_language=>'sv'
,p_message_text=>'Flytta'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143292894721752651)
,p_name=>'MOVE_FROM'
,p_message_language=>'sv'
,p_message_text=>unistr('Flytta fr\00E5n')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143292949737752651)
,p_name=>'MOVE_TO'
,p_message_language=>'sv'
,p_message_text=>'Flytta till'
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143209055272752626)
,p_name=>'MRU.ERROR_IN_MRD'
,p_message_language=>'sv'
,p_message_text=>'Fel vid borttagning av flera rader: rad= %0, %1, %2'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143208054015752626)
,p_name=>'MUST_NOT_BE_PUBLIC_USER'
,p_message_language=>'sv'
,p_message_text=>unistr('F\00E5r inte vara en offentlig anv\00E4ndare')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143156603922752610)
,p_name=>'NAME'
,p_message_language=>'sv'
,p_message_text=>'Namn'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143222244963752630)
,p_name=>'NEW'
,p_message_language=>'sv'
,p_message_text=>'Ny'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143186510055752619)
,p_name=>'NEW_ACCOUNT_LOGIN_INSTRUCTIONS'
,p_message_language=>'sv'
,p_message_text=>unistr('Du kan logga in p\00E5 %0 genom att g\00E5 till:')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143186626021752619)
,p_name=>'NEW_ACCOUNT_NOTIFICATION'
,p_message_language=>'sv'
,p_message_text=>'Nytt %0-kontomeddelande'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143315252160752658)
,p_name=>'NEXT'
,p_message_language=>'sv'
,p_message_text=>unistr('N\00E4sta')
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143232460731752633)
,p_name=>'NO'
,p_message_language=>'sv'
,p_message_text=>'Nej'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143329337899752662)
,p_name=>'NOBODY'
,p_message_language=>'sv'
,p_message_text=>'ingen'
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143195582406752622)
,p_name=>'NOT'
,p_message_language=>'sv'
,p_message_text=>'Inte'
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143238480595752635)
,p_name=>'NOT_NULL'
,p_message_language=>'sv'
,p_message_text=>'Inte null'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143208112780752626)
,p_name=>'NOT_W_ARGUMENT'
,p_message_language=>'sv'
,p_message_text=>'Inte %0'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143227992321752631)
,p_name=>'NO_DATA_FOUND'
,p_message_language=>'sv'
,p_message_text=>'inga data hittades'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143237907568752634)
,p_name=>'NO_UPDATEABLE_REPORT_FOUND'
,p_message_language=>'sv'
,p_message_text=>unistr('Ingen uppdateringsbar rapport hittades. Uppdatering av flera rader och borttagnings\00E5tg\00E4rder kan endast utf\00F6ras p\00E5 tabellformul\00E4r av typen "Uppdateringsbar rapport".')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143238894404752635)
,p_name=>'OK'
,p_message_language=>'sv'
,p_message_text=>'OK'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143234130956752633)
,p_name=>'ORACLE_APPLICATION_EXPRESS'
,p_message_language=>'sv'
,p_message_text=>'Oracle APEX'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143333094303752663)
,p_name=>'ORA_06550'
,p_message_language=>'sv'
,p_message_text=>'ORA-06550: rad %0, kolumn %1'
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143283984358752648)
,p_name=>'OUTDATED_BROWSER'
,p_message_language=>'sv'
,p_message_text=>unistr('Du anv\00E4nder en \00E4ldre version av webbl\00E4saren. Se Oracle APEX Installation Guide f\00F6r en lista \00F6ver webbl\00E4sare som st\00F6ds.')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143178915575752617)
,p_name=>'OUT_OF_RANGE'
,p_message_language=>'sv'
,p_message_text=>unistr('Ogiltig radupps\00E4ttning har beg\00E4rts, k\00E4lldata f\00F6r rapporten har \00E4ndrats.')
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143200929907752624)
,p_name=>'P.VALID_PAGE_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('Ett giltigt sidnummer m\00E5ste anges, till exempel p?n=1234.')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143205108211752625)
,p_name=>'PAGINATION.NEXT'
,p_message_language=>'sv'
,p_message_text=>unistr('N\00E4sta')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143205231823752625)
,p_name=>'PAGINATION.NEXT_SET'
,p_message_language=>'sv'
,p_message_text=>unistr('N\00E4sta upps\00E4ttning')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143205392407752625)
,p_name=>'PAGINATION.PREVIOUS'
,p_message_language=>'sv'
,p_message_text=>unistr('F\00F6reg\00E5ende')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143205473695752625)
,p_name=>'PAGINATION.PREVIOUS_SET'
,p_message_language=>'sv'
,p_message_text=>unistr('F\00F6reg\00E5ende upps\00E4ttning')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143315123694752658)
,p_name=>'PAGINATION.SELECT'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4lj sidnumrering')
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143245192874752637)
,p_name=>'PASSWORD'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00F6senord')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143185873863752619)
,p_name=>'PASSWORD_CHANGED'
,p_message_language=>'sv'
,p_message_text=>unistr('Ditt l\00F6senord f\00F6r %0 har \00E4ndrats.')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143173558475752615)
,p_name=>'PASSWORD_COMPLEXITY_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00F6senordet \00E4r inte f\00F6renligt med den h\00E4r webbplatsens komplexitetsregler f\00F6r l\00F6senord.')
,p_version_scn=>2705681
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143172632169752615)
,p_name=>'PASSWORD_DIFFERS_BY_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('Det nya l\00F6senordet m\00E5ste skilja sig fr\00E5n det gamla l\00F6senordet med minst %0 tecken.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143173291968752615)
,p_name=>'PASSWORD_LIKE_USERNAME_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00F6senordet f\00E5r inte inneh\00E5lla anv\00E4ndarnamnet.')
,p_version_scn=>2705680
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143173492626752615)
,p_name=>'PASSWORD_LIKE_WORDS_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00F6senordet inneh\00E5ller ett f\00F6rbjudet simpelt ord.')
,p_version_scn=>2705680
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143173378503752615)
,p_name=>'PASSWORD_LIKE_WORKSPACE_NAME_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00F6senordet f\00E5r inte inneh\00E5lla arbetsytenamn.')
,p_version_scn=>2705680
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143172537546752615)
,p_name=>'PASSWORD_MIN_LEN_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00F6senordet m\00E5ste inneh\00E5lla minst %0 tecken.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143172706435752615)
,p_name=>'PASSWORD_ONE_ALPHA_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00F6senordet m\00E5ste inneh\00E5lla mins ett alfabetiskt tecken (%0).')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143173189641752615)
,p_name=>'PASSWORD_ONE_LOWER_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00F6senordet m\00E5ste inneh\00E5lla minst ett alfabetiskt tecken med gemener.')
,p_version_scn=>2705680
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143172888991752615)
,p_name=>'PASSWORD_ONE_NUMERIC_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00F6senordet m\00E5ste inneh\00E5lla minst ett numeriskt tecken (0123456789).')
,p_version_scn=>2705680
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143172916333752615)
,p_name=>'PASSWORD_ONE_PUNCTUATION_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00F6senordet m\00E5ste inneh\00E5lla minst ett skiljetecken (%0).')
,p_version_scn=>2705680
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143173018361752615)
,p_name=>'PASSWORD_ONE_UPPER_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00F6senordet m\00E5ste inneh\00E5lla minst ett alfabetiskt tecken med versaler.')
,p_version_scn=>2705680
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143186366312752619)
,p_name=>'PASSWORD_RESET_NOTIFICATION'
,p_message_language=>'sv'
,p_message_text=>unistr('Meddelande om \00E5terst\00E4llning av l\00F6senord')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143171436438752615)
,p_name=>'PASSWORD_REUSE_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00F6senordet kan inte anv\00E4ndas eftersom det har anv\00E4nts inom de senaste %0 dagarna.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143168101943752614)
,p_name=>'PCT_GRAPH_ARIA_LABEL'
,p_message_language=>'sv'
,p_message_text=>'Procentdiagram'
,p_is_js_message=>true
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143259765318752641)
,p_name=>'PE.COMPONEN.TYPE.PAGE_ITEM.PLURAL'
,p_message_language=>'sv'
,p_message_text=>'Objekt'
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143259849472752641)
,p_name=>'PE.COMPONEN.TYPE.PAGE_ITEM.SINGULAR'
,p_message_language=>'sv'
,p_message_text=>'Objekt'
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143233958419752633)
,p_name=>'PERCENT'
,p_message_language=>'sv'
,p_message_text=>'Procent'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143203229516752624)
,p_name=>'PLEASE_CONTACT_ADMINISTRATOR'
,p_message_language=>'sv'
,p_message_text=>unistr('Kontakta administrat\00F6ren.')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143315374808752658)
,p_name=>'PREVIOUS'
,p_message_language=>'sv'
,p_message_text=>unistr('F\00F6reg\00E5ende')
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143251962791752639)
,p_name=>'PRINT'
,p_message_language=>'sv'
,p_message_text=>'Skriv ut'
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143232783223752633)
,p_name=>'PRIVILEGES'
,p_message_language=>'sv'
,p_message_text=>unistr('Beh\00F6righeter')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143201330720752624)
,p_name=>'REGIOIN_REFERENCES'
,p_message_language=>'sv'
,p_message_text=>'Regionreferenser'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143222338919752630)
,p_name=>'REPORT'
,p_message_language=>'sv'
,p_message_text=>'Rapport'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143232688087752633)
,p_name=>'REPORTING_PERIOD'
,p_message_language=>'sv'
,p_message_text=>'Rapportperiod'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143315551205752658)
,p_name=>'REPORT_LABEL'
,p_message_language=>'sv'
,p_message_text=>'Rapport: %0'
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143233338308752633)
,p_name=>'REPORT_TOTAL'
,p_message_language=>'sv'
,p_message_text=>'Rapportsumma'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143179036044752617)
,p_name=>'RESET'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C5terst\00E4ll sidnumrering')
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143207787281752626)
,p_name=>'RESET_PAGINATION'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C5terst\00E4ll sidnumrering')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143237888154752634)
,p_name=>'RESET_PASSWORD'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C5terst\00E4ll l\00F6senord')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143213608503752627)
,p_name=>'RESTORE'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C5terst\00E4ll')
,p_is_js_message=>true
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143247241190752637)
,p_name=>'RESULTS'
,p_message_language=>'sv'
,p_message_text=>'Resultat'
,p_version_scn=>2705695
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143238978815752635)
,p_name=>'RETURN_TO_APPLICATION'
,p_message_language=>'sv'
,p_message_text=>unistr('G\00E5 tillbaka till applikationen.')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143239366510752635)
,p_name=>'RIGHT'
,p_message_language=>'sv'
,p_message_text=>unistr('H\00F6ger')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143271379401752644)
,p_name=>'ROW'
,p_message_language=>'sv'
,p_message_text=>'Rad %0'
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143221959468752630)
,p_name=>'ROW_COUNT'
,p_message_language=>'sv'
,p_message_text=>'Antal rader'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143111713572752597)
,p_name=>'RW_AO_ASK_ORACLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Fr\00E5ga Oracle')
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143112040975752597)
,p_name=>'RW_AO_CLOSE_ASK_ORACLE'
,p_message_language=>'sv'
,p_message_text=>unistr('St\00E4ng Fr\00E5ga Oracle')
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143112347511752597)
,p_name=>'RW_AO_NOTIFICATIONS_LIST'
,p_message_language=>'sv'
,p_message_text=>unistr('Lista \00F6ver meddelanden')
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143111938509752597)
,p_name=>'RW_AO_OPEN_ASK_ORACLE'
,p_message_language=>'sv'
,p_message_text=>unistr('\00D6ppna Fr\00E5ga Oracle')
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143112220195752597)
,p_name=>'RW_AO_PRODUCT_MAP'
,p_message_language=>'sv'
,p_message_text=>'Produktkarta'
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143112126842752597)
,p_name=>'RW_AO_SUGGESTIONS_LIST'
,p_message_language=>'sv'
,p_message_text=>unistr('F\00F6rslagslista')
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143113086897752597)
,p_name=>'RW_CLEAR'
,p_message_language=>'sv'
,p_message_text=>'Rensa'
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143112985444752597)
,p_name=>'RW_CLOSE'
,p_message_language=>'sv'
,p_message_text=>unistr('St\00E4ng')
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143112769594752597)
,p_name=>'RW_FO_VIEW_MORE'
,p_message_language=>'sv'
,p_message_text=>'Visa fler'
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143113149961752597)
,p_name=>'RW_GO_TO'
,p_message_language=>'sv'
,p_message_text=>unistr('G\00E5 till')
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143112502105752597)
,p_name=>'RW_GP_STEP'
,p_message_language=>'sv'
,p_message_text=>'Steg'
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143112616503752597)
,p_name=>'RW_GP_STEP_OF'
,p_message_language=>'sv'
,p_message_text=>'av'
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143112402983752597)
,p_name=>'RW_GP_TOGGLE_STEPS'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4xla visning av steg')
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143111513340752597)
,p_name=>'RW_HIDE_PASSWORD'
,p_message_language=>'sv'
,p_message_text=>unistr('D\00F6lj l\00F6senord')
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143112809507752597)
,p_name=>'RW_OPEN'
,p_message_language=>'sv'
,p_message_text=>unistr('\00D6ppna')
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143111328324752597)
,p_name=>'RW_ORACLE'
,p_message_language=>'sv'
,p_message_text=>'Oracle'
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143111424071752597)
,p_name=>'RW_SHOW_PASSWORD'
,p_message_language=>'sv'
,p_message_text=>unistr('Visa l\00F6senord')
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143113262995752597)
,p_name=>'RW_START'
,p_message_language=>'sv'
,p_message_text=>'Start'
,p_is_js_message=>true
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143238308114752635)
,p_name=>'SAVE'
,p_message_language=>'sv'
,p_message_text=>'Spara'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143234594502752633)
,p_name=>'SAVED_REPORTS.ALTERNATIVE.DEFAULT'
,p_message_language=>'sv'
,p_message_text=>'Alternativ standard'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143234967070752634)
,p_name=>'SAVED_REPORTS.DESCRIPTION'
,p_message_language=>'sv'
,p_message_text=>'Beskrivning'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143234449945752633)
,p_name=>'SAVED_REPORTS.PRIMARY.DEFAULT'
,p_message_language=>'sv'
,p_message_text=>unistr('Prim\00E4r standard')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143235270184752634)
,p_name=>'SC_REPORT_ROWS'
,p_message_language=>'sv'
,p_message_text=>unistr('Fler \00E4n %0 tillg\00E4ngliga rader. \00D6ka radv\00E4ljaren f\00F6r att visa fler rader.')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143302699362752654)
,p_name=>'SEARCH'
,p_message_language=>'sv'
,p_message_text=>unistr('S\00F6k')
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143194140509752621)
,p_name=>'SECONDS'
,p_message_language=>'sv'
,p_message_text=>'sekunder'
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143234055048752633)
,p_name=>'SEE_ATTACHED'
,p_message_language=>'sv'
,p_message_text=>'Se bifogad'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143294602387752651)
,p_name=>'SELECT_ROW'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4lj rad')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143233736962752633)
,p_name=>'SET_SCREEN_READER_MODE_OFF'
,p_message_language=>'sv'
,p_message_text=>unistr('St\00E4ng av sk\00E4rml\00E4sarl\00E4ge')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143233837037752633)
,p_name=>'SET_SCREEN_READER_MODE_ON'
,p_message_language=>'sv'
,p_message_text=>unistr('Sl\00E5 p\00E5 sk\00E4rml\00E4sarl\00E4ge')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143230064764752632)
,p_name=>'SHOW'
,p_message_language=>'sv'
,p_message_text=>'Visa'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143296459478752652)
,p_name=>'SHOW_ALL'
,p_message_language=>'sv'
,p_message_text=>'Visa alla'
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143321268964752659)
,p_name=>'SIGN_IN'
,p_message_language=>'sv'
,p_message_text=>'Logga in'
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143272194438752645)
,p_name=>'SIGN_OUT'
,p_message_language=>'sv'
,p_message_text=>'Logga ut'
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143222988512752630)
,p_name=>'SINCE_DAYS_AGO'
,p_message_language=>'sv'
,p_message_text=>'%0 dagar sedan'
,p_is_js_message=>true
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143230530215752632)
,p_name=>'SINCE_DAYS_FROM_NOW'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 dagar fr\00E5n nu')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143222801005752630)
,p_name=>'SINCE_HOURS_AGO'
,p_message_language=>'sv'
,p_message_text=>'%0 timmar sedan'
,p_is_js_message=>true
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143230470342752632)
,p_name=>'SINCE_HOURS_FROM_NOW'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 timmar fr\00E5n nu')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143222740606752630)
,p_name=>'SINCE_MINUTES_AGO'
,p_message_language=>'sv'
,p_message_text=>'%0 minuter sedan'
,p_is_js_message=>true
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143230394234752632)
,p_name=>'SINCE_MINUTES_FROM_NOW'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 minuter fr\00E5n nu')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143223112362752630)
,p_name=>'SINCE_MONTHS_AGO'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 m\00E5nader sedan')
,p_is_js_message=>true
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143230755149752632)
,p_name=>'SINCE_MONTHS_FROM_NOW'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 m\00E5nader fr\00E5n nu')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143230950955752632)
,p_name=>'SINCE_NOW'
,p_message_language=>'sv'
,p_message_text=>'Nu'
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143222665495752630)
,p_name=>'SINCE_SECONDS_AGO'
,p_message_language=>'sv'
,p_message_text=>'%0 sekunder sedan'
,p_is_js_message=>true
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143230202138752632)
,p_name=>'SINCE_SECONDS_FROM_NOW'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 sekunder fr\00E5n nu')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143223029929752630)
,p_name=>'SINCE_WEEKS_AGO'
,p_message_language=>'sv'
,p_message_text=>'%0 veckor sedan'
,p_is_js_message=>true
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143230611557752632)
,p_name=>'SINCE_WEEKS_FROM_NOW'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 veckor fr\00E5n nu')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143223281328752630)
,p_name=>'SINCE_YEARS_AGO'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 \00E5r sedan')
,p_is_js_message=>true
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143230872243752632)
,p_name=>'SINCE_YEARS_FROM_NOW'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 \00E5r fr\00E5n nu')
,p_is_js_message=>true
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143216741505752628)
,p_name=>'STANDARD'
,p_message_language=>'sv'
,p_message_text=>'Standard'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143233692217752633)
,p_name=>'START_DATE'
,p_message_language=>'sv'
,p_message_text=>'Startdatum'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143168832173752614)
,p_name=>'SUBSCRIPTION_CREATED_BY'
,p_message_language=>'sv'
,p_message_text=>unistr('Du har f\00E5tt det h\00E4r e-postmeddelandet fr\00E5n Interaktiv rapport-prenumerationen skapad av %0.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143330462319752662)
,p_name=>'SUBSCRIPTION_REFERENCES'
,p_message_language=>'sv'
,p_message_text=>'Prenumerationer'
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143279818896752647)
,p_name=>'TAB'
,p_message_language=>'sv'
,p_message_text=>'Flik'
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143194031933752621)
,p_name=>'TITLE'
,p_message_language=>'sv'
,p_message_text=>'Titel'
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143173738153752615)
,p_name=>'TODAY'
,p_message_language=>'sv'
,p_message_text=>'Idag'
,p_version_scn=>2705681
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143233282789752633)
,p_name=>'TOTAL'
,p_message_language=>'sv'
,p_message_text=>'Summa'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143175050049752616)
,p_name=>'TO_MANY_COLUMNS_SELECTED'
,p_message_language=>'sv'
,p_message_text=>unistr('Du kan markera h\00F6gst %0 kolumner.')
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143130869118752603)
,p_name=>'TREE.COLLAPSE_ALL'
,p_message_language=>'sv'
,p_message_text=>'Komprimera alla'
,p_is_js_message=>true
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143131470266752603)
,p_name=>'TREE.COLLAPSE_ALL_BELOW'
,p_message_language=>'sv'
,p_message_text=>'Komprimera alla nedan'
,p_is_js_message=>true
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143130455219752603)
,p_name=>'TREE.EXPAND_ALL'
,p_message_language=>'sv'
,p_message_text=>'Expandera alla'
,p_is_js_message=>true
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143131152557752603)
,p_name=>'TREE.EXPAND_ALL_BELOW'
,p_message_language=>'sv'
,p_message_text=>'Expandera alla nedan'
,p_is_js_message=>true
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143131625750752603)
,p_name=>'TREE.REPARENT'
,p_message_language=>'sv'
,p_message_text=>unistr('Ange ny \00F6verordning')
,p_is_js_message=>true
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143253715540752639)
,p_name=>'TREES'
,p_message_language=>'sv'
,p_message_text=>unistr('Tr\00E4d')
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143296503327752652)
,p_name=>'UI.FORM.REQUIRED'
,p_message_language=>'sv'
,p_message_text=>'Obligatoriskt'
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143217434002752628)
,p_name=>'UNAUTHORIZED'
,p_message_language=>'sv'
,p_message_text=>unistr('Obeh\00F6rig')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143267656227752643)
,p_name=>'UNAVAILABLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Ej tillg\00E4nglig')
,p_version_scn=>2705700
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143231340857752632)
,p_name=>'UNKNOWN'
,p_message_language=>'sv'
,p_message_text=>unistr('Ok\00E4nt')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143169799453752614)
,p_name=>'UNKNOWN_AUTHENTICATION_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('Ett ok\00E4nt autentiseringsfel har uppst\00E5tt.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143171954374752615)
,p_name=>'UNSUBSCRIBE_SUBSCRIPTION_MSG_HTML'
,p_message_language=>'sv'
,p_message_text=>unistr('Om du inte l\00E4ngre vill f\00E5 e-postmeddelanden klickar du p\00E5 <a href="%0">s\00E4g upp prenumeration</a> f\00F6r att hantera din prenumeration.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143168796486752614)
,p_name=>'UNSUBSCRIBE_SUBSCRIPTION_MSG_TXT'
,p_message_language=>'sv'
,p_message_text=>unistr('Om du inte l\00E4ngre vill f\00E5 e-postmeddelanden g\00E5r du till f\00F6ljande URL f\00F6r att hantera din prenumeration:')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143208255552752626)
,p_name=>'UNSUPPORTED_DATA_TYPE'
,p_message_language=>'sv'
,p_message_text=>unistr('datatypen st\00F6ds inte')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143195302928752622)
,p_name=>'UPDATE'
,p_message_language=>'sv'
,p_message_text=>'uppdatera'
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143193906471752621)
,p_name=>'UPDATED'
,p_message_language=>'sv'
,p_message_text=>'Uppdaterad'
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143137103484752604)
,p_name=>'UPGRADE_IN_PROGRESS'
,p_message_language=>'sv'
,p_message_text=>unistr('Uppgraderingen p\00E5g\00E5r')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143137457395752605)
,p_name=>'UPGRADE_IN_PROGRESS_DETAIL'
,p_message_language=>'sv'
,p_message_text=>'Oracle APEX uppgraderas till en ny version. Processen tar vanligtvis upp till tre minuter.'
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143200730780752623)
,p_name=>'URL_PROHIBITED'
,p_message_language=>'sv'
,p_message_text=>unistr('Den beg\00E4rda URL:en har f\00F6rbjudits. Kontakta administrat\00F6ren.')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143221853735752630)
,p_name=>'USER'
,p_message_language=>'sv'
,p_message_text=>unistr('Anv\00E4ndare')
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143245034599752637)
,p_name=>'USERNAME'
,p_message_language=>'sv'
,p_message_text=>unistr('Anv\00E4ndarnamn')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143286410382752649)
,p_name=>'USERNAME_TOO_LONG'
,p_message_language=>'sv'
,p_message_text=>unistr('Anv\00E4ndarnamnet \00E4r f\00F6r l\00E5ngt. Gr\00E4nsen \00E4r %0 tecken.')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143228984319752632)
,p_name=>'USERS'
,p_message_language=>'sv'
,p_message_text=>unistr('anv\00E4ndare')
,p_version_scn=>2705693
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143286039136752649)
,p_name=>'USER_EXISTS'
,p_message_language=>'sv'
,p_message_text=>unistr('Anv\00E4ndarnamnet finns redan.')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143299876542752653)
,p_name=>'USER_PROFILE_IMAGE'
,p_message_language=>'sv'
,p_message_text=>unistr('Profilbild f\00F6r anv\00E4ndaren %0')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143161753147752612)
,p_name=>'UTILIZATION_REPORTS.AUTOMATION'
,p_message_language=>'sv'
,p_message_text=>unistr('Automatisering \2013 %0')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143160273475752611)
,p_name=>'UTILIZATION_REPORTS.PAGE'
,p_message_language=>'sv'
,p_message_text=>unistr('Sida %0 \2013 %1 ')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143163133270752612)
,p_name=>'UTILIZATION_REPORTS.PLUG_NAME'
,p_message_language=>'sv'
,p_message_text=>'%0 - %1'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143163232908752612)
,p_name=>'UTILIZATION_REPORTS.PROCESS_NAME'
,p_message_language=>'sv'
,p_message_text=>'%0 - %1'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143162153619752612)
,p_name=>'UTILIZATION_REPORTS.SEARCH_CONFIG'
,p_message_language=>'sv'
,p_message_text=>unistr('S\00F6kkonfiguration \2013 %0')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143162066182752612)
,p_name=>'UTILIZATION_REPORTS.SHARED_DYNAMIC_LOV'
,p_message_language=>'sv'
,p_message_text=>unistr('Delad dynamisk v\00E4rdelista \2013 %0')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143161856240752612)
,p_name=>'UTILIZATION_REPORTS.TASK_DEFINITION'
,p_message_language=>'sv'
,p_message_text=>unistr('Uppgiftsdefinition \2013 %0')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143160374804752611)
,p_name=>'UTILIZATION_REPORTS.WORKFLOW'
,p_message_language=>'sv'
,p_message_text=>unistr('Arbetsfl\00F6de\2013 %0 ')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143182430740752618)
,p_name=>'VALID'
,p_message_language=>'sv'
,p_message_text=>'Giltig'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143174098499752615)
,p_name=>'VALIDATIONS'
,p_message_language=>'sv'
,p_message_text=>'Valideringar'
,p_version_scn=>2705681
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143234714272752634)
,p_name=>'VALUE_MUST_BE_SPECIFIED'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4rde m\00E5ste anges')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143281007407752647)
,p_name=>'VALUE_MUST_BE_SPECIFIED_FOR'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4rde m\00E5ste anges f\00F6r %0')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143203640704752624)
,p_name=>'VERTICAL'
,p_message_language=>'sv'
,p_message_text=>'vertikal'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143195269746752622)
,p_name=>'VIEW'
,p_message_language=>'sv'
,p_message_text=>'visa'
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143229069384752632)
,p_name=>'VIEWS'
,p_message_language=>'sv'
,p_message_text=>'vyer'
,p_version_scn=>2705693
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143235573504752634)
,p_name=>'VIEW_ALL'
,p_message_language=>'sv'
,p_message_text=>'Visa alla'
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143175455611752616)
,p_name=>'VISUALLY_HIDDEN_LINK'
,p_message_language=>'sv'
,p_message_text=>unistr('Visuellt dold l\00E4nk')
,p_is_js_message=>true
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143216293617752628)
,p_name=>'WARNING'
,p_message_language=>'sv'
,p_message_text=>'Varning'
,p_is_js_message=>true
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143194863333752622)
,p_name=>'WEEK'
,p_message_language=>'sv'
,p_message_text=>'vecka'
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143190720219752620)
,p_name=>'WEEKLY'
,p_message_language=>'sv'
,p_message_text=>'Veckovis'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143194962191752622)
,p_name=>'WEEKS'
,p_message_language=>'sv'
,p_message_text=>'veckor'
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143234855059752634)
,p_name=>'WELCOME_USER'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4lkommen: %0')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143233023863752633)
,p_name=>'WWV_DBMS_SQL.INVALID_CLOB'
,p_message_language=>'sv'
,p_message_text=>unistr('Hittade ogiltigt v\00E4rde, kontrollera angivna data.')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143233191865752633)
,p_name=>'WWV_DBMS_SQL.INVALID_DATATYPE'
,p_message_language=>'sv'
,p_message_text=>unistr('Hittade ogiltigt v\00E4rde, kontrollera angivna data.')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143170957484752615)
,p_name=>'WWV_DBMS_SQL.INVALID_DATE'
,p_message_language=>'sv'
,p_message_text=>unistr('Hittade ogiltigt datav\00E4rde, kontrollera datumformatet.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143232967161752633)
,p_name=>'WWV_DBMS_SQL.INVALID_NUMBER'
,p_message_language=>'sv'
,p_message_text=>unistr('Hittade ogiltigt nummerv\00E4rde, kontrollera nummerformatet.')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143182008578752618)
,p_name=>'WWV_DBMS_SQL.INVALID_TIMESTAMP'
,p_message_language=>'sv'
,p_message_text=>unistr('Hittade ogiltigt tidsst\00E4mpelsv\00E4rde, kontrollera tidsst\00E4mpelformatet.')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143206537897752625)
,p_name=>'WWV_DBMS_SQL.UNABLE_TO_BIND_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('Kan inte binda "%0". Anv\00E4nd dubbla citattecken f\00F6r multibyte-objekt eller kontrollera att objektets l\00E4ngd \00E4r 30 byte eller mindre. Anv\00E4nd v() syntax f\00F6r referensobjekt som \00E4r l\00E4ngre \00E4n 30 byte.')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143196302002752622)
,p_name=>'WWV_FLOW.ACCESS_DENIED'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C5tkomst nekad av %0-s\00E4kerhetskontroll')
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143198833297752623)
,p_name=>'WWV_FLOW.APP_NOT_AVAILABLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Applikationen \00E4r inte tillg\00E4nglig')
,p_version_scn=>2705687
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143197267315752622)
,p_name=>'WWV_FLOW.APP_NOT_FOUND_ERR'
,p_message_language=>'sv'
,p_message_text=>'Applikationen hittades inte.'
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143197390472752622)
,p_name=>'WWV_FLOW.APP_NOT_FOUND_FOOTER_ERR'
,p_message_language=>'sv'
,p_message_text=>'applikation=%0  arbetsyta=%1'
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143197772737752623)
,p_name=>'WWV_FLOW.APP_RESTRICTED'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C5tkomst till den h\00E4r applikationen \00E4r begr\00E4nsad, f\00F6rs\00F6k igen senare.')
,p_version_scn=>2705687
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143197640179752622)
,p_name=>'WWV_FLOW.APP_RESTRICTED_TO_DEV'
,p_message_language=>'sv'
,p_message_text=>unistr('\00C5tkomst till den h\00E4r applikationen \00E4r begr\00E4nsad till applikationsutvecklare, f\00F6rs\00F6k igen senare.')
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143196876318752622)
,p_name=>'WWV_FLOW.BRANCH_FUNC_RETURNING_URL_ERROR'
,p_message_language=>'sv'
,p_message_text=>'ERR-7744 Kan inte bearbeta grenen till funktionen returwebbadress.'
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143196739722752622)
,p_name=>'WWV_FLOW.BRANCH_TO_FUNCT_RET_PAGE_ERR'
,p_message_language=>'sv'
,p_message_text=>'ERR-7744 Kan inte bearbeta grenen till funktionen retursida.'
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143197099888752622)
,p_name=>'WWV_FLOW.CALL_TO_SHOW_FROM_PROC_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('ERR-1430 Anrop som visas fr\00E5n sidprocessen st\00F6ds inte: G_FLOW_STEP_ID (%0).')
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143198193068752623)
,p_name=>'WWV_FLOW.CLEAR_STEP_CACHE_ERR'
,p_message_language=>'sv'
,p_message_text=>'ERR-1018 Fel vid rensning av stegcache.'
,p_version_scn=>2705687
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143196558961752622)
,p_name=>'WWV_FLOW.COMP_UNKNOWN_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('ERR-1005 Ok\00E4nd ber\00E4kningstyp.')
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143197409978752622)
,p_name=>'WWV_FLOW.CUSTOM_AUTH_SESSION_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('ERR-1201 sessions-id har inte angetts f\00F6r anpassad autentisering.')
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143197584521752622)
,p_name=>'WWV_FLOW.CUSTOM_AUTH_SESSION_FOOTER_ERR'
,p_message_language=>'sv'
,p_message_text=>'sida=%0'
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143197107891752622)
,p_name=>'WWV_FLOW.DET_COMPANY_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('ERR-7620 Kan inte fastst\00E4lla arbetsytan f\00F6r applikationen (%0).')
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143177658446752617)
,p_name=>'WWV_FLOW.EDIT'
,p_message_language=>'sv'
,p_message_text=>'Redigera'
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143196220520752622)
,p_name=>'WWV_FLOW.FIND_ITEM_ERR2'
,p_message_language=>'sv'
,p_message_text=>'ERR-1802 Kan inte hitta objekt-id "%0"'
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143195958636752622)
,p_name=>'WWV_FLOW.FIND_ITEM_ID_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('ERR-1002 Kan inte hitta objekt-id f\00F6r objektet "%0" i applikationen "%1".')
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143196055773752622)
,p_name=>'WWV_FLOW.FIND_ITEM_ID_ERR2'
,p_message_language=>'sv'
,p_message_text=>unistr('Ov\00E4ntat fel, kan inte hitta objektnamnet p\00E5 applikations- eller sidniv\00E5.')
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143196441161752622)
,p_name=>'WWV_FLOW.FIRST_PAGE_DATA_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('Du befinner dig redan p\00E5 den f\00F6rsta datasidan.')
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143212956796752627)
,p_name=>'WWV_FLOW.ITEM_POSTING_VIOLATION'
,p_message_language=>'sv'
,p_message_text=>unistr('Objekt-id (%0) \00E4r inte ett definierat objekt p\00E5 den aktuella sidan.')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143170595586752614)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.INTERNAL_ONLY'
,p_message_language=>'sv'
,p_message_text=>unistr('Objektet kan inte konfigureras genom att \00F6verf\00F6ra argument till applikationen.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143170898176752614)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.NO_CHECKSUM'
,p_message_language=>'sv'
,p_message_text=>'(Ingen kontrollsumma har angetts)'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143170390552752614)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.PRIVATE_BOOKMARK'
,p_message_language=>'sv'
,p_message_text=>unistr('Objektet kan konfigureras n\00E4r det \00E5tf\00F6ljs av en kontrollsumma med "anv\00E4ndarniv\00E5bokm\00E4rke".')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143170240069752614)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.PUBLIC_BOOKMARK'
,p_message_language=>'sv'
,p_message_text=>unistr('Objektet kan konfigureras n\00E4r det \00E5tf\00F6ljs av en kontrollsumma med "applikationsniv\00E5bokm\00E4rke".')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143170431995752614)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.SESSION'
,p_message_language=>'sv'
,p_message_text=>unistr('Objektet kan konfigureras n\00E4r det \00E5tf\00F6ljs av en kontrollsumma med "session".')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143170182767752614)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.UNPROTECTED'
,p_message_language=>'sv'
,p_message_text=>'Objektet har inget skydd.'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143198232858752623)
,p_name=>'WWV_FLOW.NO_PAGE_HELP'
,p_message_language=>'sv'
,p_message_text=>unistr('Ingen sidhj\00E4lp \00E4r tillg\00E4nglig.')
,p_version_scn=>2705687
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143186149264752619)
,p_name=>'WWV_FLOW.NO_PRIV_ON_SCHEMA'
,p_message_language=>'sv'
,p_message_text=>unistr('Arbetsytan %0 har inga beh\00F6righeter att tolka som schema %1.')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143196639021752622)
,p_name=>'WWV_FLOW.PAGE_ACCEPT_RECUR_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('ERR-1010 F\00F6rgrena sidan f\00F6r att acceptera bearbetning av \00F6verskriden rekursionsgr\00E4ns. %0')
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143153161700752609)
,p_name=>'WWV_FLOW.PAGE_PATTERN_NOT_RUNNABLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Sidan \00E4r inte tillg\00E4nglig. Du kan inte k\00F6ra ett sidm\00F6nster.')
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143170737437752614)
,p_name=>'WWV_FLOW.PAGE_PROTECTION.SHOW_NO_URL_ALLOWED'
,p_message_language=>'sv'
,p_message_text=>unistr('Den h\00E4r sidan kan inte startas genom att anv\00E4nda en URL eller en GET eller POST till show-proceduren, den m\00E5ste anropas genom att anv\00E4nda typen "F\00F6rgrena till sida".')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143255506911752640)
,p_name=>'WWV_FLOW.SAVE_ROUTINE_NUMERIC_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('Fel uppstod n\00E4r ett icke-numeriskt v\00E4rde skulle sparas i objektet %0. ')
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143187861870752620)
,p_name=>'WWV_FLOW.SCHEMA_NOT_EXISTS'
,p_message_language=>'sv'
,p_message_text=>'Applikationens tolkningsschema "%0" finns inte i databasen.'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143187997231752620)
,p_name=>'WWV_FLOW.SERVICE_ADMIN_LINK'
,p_message_language=>'sv'
,p_message_text=>unistr('Konton i den INTERNA arbetsytan kan endast anv\00E4ndas f\00F6r att komma \00E5t &PRODUCT_NAME. <a href="%0">Administrationstj\00E4nster</a>.')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143195806679752622)
,p_name=>'WWV_FLOW.SESSION_INFO_ERR'
,p_message_language=>'sv'
,p_message_text=>'ERR-1029 Kan inte lagra sessionsinfo.  session=%0 item=%1'
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143198945649752623)
,p_name=>'WWV_FLOW.UNABLE_TO_STOP_TRACE_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('Kan inte stoppa sp\00E5rning: %0')
,p_version_scn=>2705687
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143196175218752622)
,p_name=>'WWV_FLOW.UNEXPECTED_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('Ov\00E4ntat fel')
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143206920597752625)
,p_name=>'WWV_FLOW.UPDATE_SUB_ERR'
,p_message_language=>'sv'
,p_message_text=>'Fel vid update_substitution_cache: %0'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143199035952752623)
,p_name=>'WWV_FLOW.VIEW_HELP_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('Applikationen och sidan m\00E5ste anges f\00F6r att visa hj\00E4lp.')
,p_version_scn=>2705687
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143220784778752629)
,p_name=>'WWV_FLOW_AUTOMATION.AUTOMATION_NOT_FOUND'
,p_message_language=>'sv'
,p_message_text=>'Automatisering hittades inte.'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143156216347752610)
,p_name=>'WWV_FLOW_AUTOMATION.QUERY_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('Fel i automatiseringsfr\00E5ga: %0')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143200159722752623)
,p_name=>'WWV_FLOW_CACHE.PURGE_SESSION'
,p_message_language=>'sv'
,p_message_text=>'Rensade %0 sessioner.'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143141421375752606)
,p_name=>'WWV_FLOW_CODE_EXEC_MLE.LANGUAGE_NOT_SUPPORTED'
,p_message_language=>'sv'
,p_message_text=>unistr('Kan inte k\00F6ra koden %0! Den st\00F6ds inte av databasen eller har inte aktiverats av instansparametern MLE_LANGUAGES.')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143139007667752605)
,p_name=>'WWV_FLOW_CODE_EXEC_MLE.MLE_NOT_SUPPORTED'
,p_message_language=>'sv'
,p_message_text=>unistr('Flerspr\00E5kig motor \00E4r inte tillg\00E4nglig i den h\00E4r databasversionen!')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143178297465752617)
,p_name=>'WWV_FLOW_COLLECTION.ARRAY_NOT_NULL'
,p_message_language=>'sv'
,p_message_text=>unistr('Applikationssamlingsuppst\00E4llningen f\00E5r inte vara null')
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143178084124752617)
,p_name=>'WWV_FLOW_COLLECTION.ATTRIBUTE_NUMBER_OUTSIDE_RANGE'
,p_message_language=>'sv'
,p_message_text=>unistr('Det angivna medlemsattributnumret %0 \00E4r ogiltigt. Attributnummer m\00E5ste vara mellan 1 och %1')
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143178525150752617)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_EXISTS'
,p_message_language=>'sv'
,p_message_text=>'Applikationssamlingen finns redan'
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143178389848752617)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NAME_NOT_NULL'
,p_message_language=>'sv'
,p_message_text=>unistr('Samlingsnamnet f\00E5r inte vara null')
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143178415903752617)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NAME_TOO_LARGE'
,p_message_language=>'sv'
,p_message_text=>unistr('Samlingsnamnet f\00E5r inte vara l\00E4ngre \00E4n 255 tecken')
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143177873705752617)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NOT_EXIST'
,p_message_language=>'sv'
,p_message_text=>'Applikationssamlingen %0 finns inte'
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143178617727752617)
,p_name=>'WWV_FLOW_COLLECTION.CURSOR_NOT_OPEN'
,p_message_language=>'sv'
,p_message_text=>unistr('Mark\00F6ren \00E4r inte \00F6ppen')
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143177946705752617)
,p_name=>'WWV_FLOW_COLLECTION.MEMBER_NOT_EXIST'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Medlemssekvensen %0 finns inte i Applikationssamlingen %1',
''))
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143178171120752617)
,p_name=>'WWV_FLOW_COLLECTION.MEMBER_SEQUENCE_NUMBER_INVALID'
,p_message_language=>'sv'
,p_message_text=>'Medlemssekvensen %0 finns inte i applikationssamlingen "%1"'
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143130910387752603)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_ALGORITHM'
,p_message_language=>'sv'
,p_message_text=>unistr('Algoritmen %0 saknar st\00F6d f\00F6r ECDSA.')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143130631885752603)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_EC_CURVE'
,p_message_language=>'sv'
,p_message_text=>unistr('Den elliptiska kurvan %0 saknar st\00F6d.')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143256341553752640)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_FUNCTION'
,p_message_language=>'sv'
,p_message_text=>unistr('Den kryptografiska funktionen "%0" st\00F6ds inte av det h\00E4r systemet.')
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143308692889752656)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_ACCESSIBLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Tillg\00E4nglighet testad')
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143199623230752623)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_CLOSE'
,p_message_language=>'sv'
,p_message_text=>unistr('St\00E4ng')
,p_version_scn=>2705687
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143199769013752623)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_CUST_OPT'
,p_message_language=>'sv'
,p_message_text=>unistr('Anpassningsalternativ f\00F6r sida')
,p_version_scn=>2705687
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143199881702752623)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_DEFAULT'
,p_message_language=>'sv'
,p_message_text=>'Standard'
,p_version_scn=>2705687
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143199933544752623)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_DISP'
,p_message_language=>'sv'
,p_message_text=>'Visad'
,p_version_scn=>2705687
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143200043387752623)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_HIDDEN'
,p_message_language=>'sv'
,p_message_text=>'Dold'
,p_version_scn=>2705687
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143199428476752623)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE1'
,p_message_language=>'sv'
,p_message_text=>unistr('Kontrollera regionerna du vill inkludera p\00E5 den h\00E4r sidan. Kontrollerade regioner kan inte visas om du inte \00E4r i r\00E4tt applikationskontext eller om du inte har r\00E4tt beh\00F6righeter.')
,p_version_scn=>2705687
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143199581317752623)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE2'
,p_message_language=>'sv'
,p_message_text=>unistr('Den h\00E4r sidan \00E4r inte anpassningsbar.')
,p_version_scn=>2705687
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143308900779752656)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE3'
,p_message_language=>'sv'
,p_message_text=>unistr('Du kan anpassa formatet f\00F6r den h\00E4r applikationen genom att \00E4ndra Temaformatet. V\00E4lj ett Temaformat fr\00E5n listan nedan och klicka p\00E5 Till\00E4mpa \00E4ndringar.')
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143309736734752656)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_REGION_DISP'
,p_message_language=>'sv'
,p_message_text=>'Regionvisning'
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143308885454752656)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_REMOVE_STYLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Anv\00E4nd applikationsstandard f\00F6r format')
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143308730087752656)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_THEME_STYLE'
,p_message_language=>'sv'
,p_message_text=>'Format '
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143252941485752639)
,p_name=>'WWV_FLOW_DATA_EXPORT.AGG_COLUMN_IDX_NOT_EXIST'
,p_message_language=>'sv'
,p_message_text=>'Kolumnindexet som refereras i det aggregerade %0 finns inte.'
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143145600454752607)
,p_name=>'WWV_FLOW_DATA_EXPORT.APPEND_NOT_SUPPORTED'
,p_message_language=>'sv'
,p_message_text=>unistr('Till\00E4gg av dataexporten st\00F6ds inte f\00F6r formatet %0.')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143108639019752596)
,p_name=>'WWV_FLOW_DATA_EXPORT.CLOB_NOT_SUPPORTED'
,p_message_language=>'sv'
,p_message_text=>unistr('CLOB-utdataformatet st\00F6ds inte f\00F6r formatet %0.')
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143252663527752639)
,p_name=>'WWV_FLOW_DATA_EXPORT.COLUMN_BREAK_MUST_BE_IN_THE_BEGGINING'
,p_message_language=>'sv'
,p_message_text=>unistr('Kolumnbrytningen beh\00F6ver vara i b\00F6rjan av kolumnuppst\00E4llningen.')
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143252745266752639)
,p_name=>'WWV_FLOW_DATA_EXPORT.COLUMN_GROUP_IDX_NOT_EXIST'
,p_message_language=>'sv'
,p_message_text=>'Kolumngruppens index som refereras i %0 finns inte.'
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143159800421752611)
,p_name=>'WWV_FLOW_DATA_EXPORT.EXPORT'
,p_message_language=>'sv'
,p_message_text=>'exportera'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143167027874752613)
,p_name=>'WWV_FLOW_DATA_EXPORT.FORMAT_MUST_BE_XML'
,p_message_language=>'sv'
,p_message_text=>unistr('Exportformatet m\00E5ste vara XML och anv\00E4nda ORDS som utskriftsserver.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143253045423752639)
,p_name=>'WWV_FLOW_DATA_EXPORT.HIGHLIGHT_COLUMN_IDX_NOT_EXIST'
,p_message_language=>'sv'
,p_message_text=>'Kolumnindexet som refereras i det markerade %0 finns inte.'
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143156408184752610)
,p_name=>'WWV_FLOW_DATA_EXPORT.INVALID_FORMAT'
,p_message_language=>'sv'
,p_message_text=>'Ogiltigt exportformat: %0'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143252852377752639)
,p_name=>'WWV_FLOW_DATA_EXPORT.PARENT_GROUP_IDX_NOT_EXIST'
,p_message_language=>'sv'
,p_message_text=>unistr('Det \00F6verordnade gruppindexet som refereras i %0 finns inte.')
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143278055845752646)
,p_name=>'WWV_FLOW_DATA_LOADER.CANNOT_LOAD_INTO_GENERATED_ALWAYS_COLUMN'
,p_message_language=>'sv'
,p_message_text=>unistr('Kolumnen %1 i tabellen %0 \00E4r en "GENERATED ALWAYS"-identitetskolumn. Se till att ingen k\00E4llkolumn \00E4r mappad till kolumnen %1 i dialogrutan Konfigurera.')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143189602384752620)
,p_name=>'WWV_FLOW_DATA_LOADER.COMMIT_INTERVAL_TOO_LOW'
,p_message_language=>'sv'
,p_message_text=>unistr('Angivet bekr\00E4ftelseintervall \00E4r f\00F6r l\00E5gt.')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143189751253752620)
,p_name=>'WWV_FLOW_DATA_LOADER.NO_COLUMNS_PROVIDED'
,p_message_language=>'sv'
,p_message_text=>unistr('Inga kolumner har angetts f\00F6r dataladdningen.')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143191068483752621)
,p_name=>'WWV_FLOW_DATA_PARSER.NO_COLUMNS_FOUND'
,p_message_language=>'sv'
,p_message_text=>unistr('Hittade inga kolumner f\00F6r radv\00E4ljaren "%0". F\00F6rs\00F6k att automatiskt identifiera eller granska JSON-strukturen.')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143200474579752623)
,p_name=>'WWV_FLOW_DATA_PARSER.NO_WORKSHEETS_FOUND'
,p_message_language=>'sv'
,p_message_text=>'Inga arbetsblad hittades i XLSX-filen.'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143145549494752607)
,p_name=>'WWV_FLOW_DATA_PARSER.REQUESTED_HIERARCHY_LEVELS_EXCEED_MAXIMUM'
,p_message_language=>'sv'
,p_message_text=>unistr('Beg\00E4rda hierarkiniv\00E5er f\00F6r uppt\00E4ckt (%0) \00F6verskrider maxgr\00E4nsen %1.')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143200364066752623)
,p_name=>'WWV_FLOW_DATA_PARSER.WORKSHEET_DOES_NOT_EXIST'
,p_message_language=>'sv'
,p_message_text=>'Angivet arbetsblad finns inte i XLSX-filen.'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143178773678752617)
,p_name=>'WWV_FLOW_DML.VERSION_OF_DATA_CHANGED'
,p_message_language=>'sv'
,p_message_text=>unistr('Den aktuella versionen av data i databasen har \00E4ndrats sedan anv\00E4ndaren initierade uppdateringsprocessen.')
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143181651763752618)
,p_name=>'WWV_FLOW_EDIT_REPORT.ERR_UPDATING_COLS'
,p_message_language=>'sv'
,p_message_text=>'Fel vid uppdatering av rapportkolumner: %0'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143292133994752651)
,p_name=>'WWV_FLOW_EXEC.CANNOT_CONVERT_TO_SDOGEOMETRY'
,p_message_language=>'sv'
,p_message_text=>'Kan inte konvertera %0 till SDO_GEOMETRY.'
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143228667008752632)
,p_name=>'WWV_FLOW_EXEC.CAN_NOT_CONVERT_TO_VARCHAR2'
,p_message_language=>'sv'
,p_message_text=>unistr('Kolumnen %0 som \00E4r av datatypen %1 kan inte konverteras till VARCHAR2!')
,p_version_scn=>2705693
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143236086175752634)
,p_name=>'WWV_FLOW_EXEC.COLUMN_NOT_FOUND'
,p_message_language=>'sv'
,p_message_text=>unistr('Den angivna kolumnen "%0" f\00F6r attributet "%1" hittades inte i datak\00E4llan!')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143172129738752615)
,p_name=>'WWV_FLOW_EXEC.FILTER_NOT_SUPPORTED_WITH_MULTIPLE_VALUES'
,p_message_language=>'sv'
,p_message_text=>unistr('Filtypen %0 st\00F6ds inte f\00F6r kolumner med flera v\00E4rden.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143295661598752652)
,p_name=>'WWV_FLOW_EXEC.INVALID_BETWEEN_FILTER'
,p_message_language=>'sv'
,p_message_text=>'Ogiltigt "mellan"-filter.'
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143151292169752609)
,p_name=>'WWV_FLOW_EXEC.INVALID_COLUMN_OR_ROW_DATATYPE'
,p_message_language=>'sv'
,p_message_text=>unistr('Inget %2-v\00E4rde hittades i kolumnen %0, rad #%1.')
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143147998352752608)
,p_name=>'WWV_FLOW_EXEC.INVALID_COLUMN_OR_ROW_REFERENCE'
,p_message_language=>'sv'
,p_message_text=>'Kolumnen %0 eller raden #%1 finns inte.'
,p_version_scn=>2705678
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143134556045752604)
,p_name=>'WWV_FLOW_EXEC.INVALID_LOV_SPECIFICATION'
,p_message_language=>'sv'
,p_message_text=>unistr('Ogiltig typ av v\00E4rdelista har angetts.')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143134446835752604)
,p_name=>'WWV_FLOW_EXEC.INVALID_QUERY_TYPE'
,p_message_language=>'sv'
,p_message_text=>unistr('Ogiltig fr\00E5getyp. Fr\00E5getypen m\00E5ste vara Tabell, SQL-fr\00E5ga eller PL/SQL-funktion som returnera SQL-fr\00E5ga.')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143228735286752632)
,p_name=>'WWV_FLOW_EXEC.INVALID_SQL_QUERY'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Kunde inte tolka SQL-fr\00E5gan!'),
'%0'))
,p_version_scn=>2705693
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143236147759752634)
,p_name=>'WWV_FLOW_EXEC.LEGACY_COLUMN_NOT_FOUND'
,p_message_language=>'sv'
,p_message_text=>unistr('Den angivna kolumnpositionen %0 f\00F6r attributet "%1" hittades inte i SQL-satsen!')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143126140580752601)
,p_name=>'WWV_FLOW_EXEC.MULTI_VALUE_TOO_MANY_ITEMS'
,p_message_language=>'sv'
,p_message_text=>unistr('F\00F6r m\00E5nga objekt anv\00E4nds i filtret Flera v\00E4rden.')
,p_version_scn=>2705672
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143235960386752634)
,p_name=>'WWV_FLOW_EXEC.NO_COLUMN_FOR_ATTRIBUTE'
,p_message_language=>'sv'
,p_message_text=>unistr('Ingen kolumn har angetts f\00F6r attributet "%0".')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143134381405752604)
,p_name=>'WWV_FLOW_EXEC.NULL_QUERY_RETURNED_BY_FUNCTION'
,p_message_language=>'sv'
,p_message_text=>unistr('PL/SQL-funktionstexten returnerade inte ett v\00E4rde.')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143251783911752639)
,p_name=>'WWV_FLOW_EXEC.OPERATION_NOT_PRESENT_IN_WEB_SRC_MODULE'
,p_message_language=>'sv'
,p_message_text=>unistr('REST-datak\00E4llan inneh\00E5ller inte en \00E5tg\00E4rd f\00F6r att hantera den beg\00E4rda DML-\00E5tg\00E4rden.')
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143293486849752651)
,p_name=>'WWV_FLOW_EXEC.RANGE_BUCKET.NOT.SUPPORTED'
,p_message_language=>'sv'
,p_message_text=>unistr('Intervallfilter har bara st\00F6d f\00F6r datatyperna NUMBER, DATE och TIMESTAMP.')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143114384114752598)
,p_name=>'WWV_FLOW_EXEC.REST_REQUEST_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('Beg\00E4ran utf\00F6rdes inte med: %0')
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143117862716752599)
,p_name=>'WWV_FLOW_EXEC.SPATIAL_JSON_NOT_AVAILABLE'
,p_message_language=>'sv'
,p_message_text=>unistr('Konverteringen fr\00E5n GeoJSON till SDO_GEOMETRY (kolumn %0) \00E4r inte tillg\00E4nglig i den h\00E4r databasen.')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143121297270752600)
,p_name=>'WWV_FLOW_EXEC.SPATIAL_NOT_SUPPORTED_FOR_XML'
,p_message_language=>'sv'
,p_message_text=>unistr('SDO_GEOMETRY-konvertering (kolumn %0) st\00F6ds inte f\00F6r XML-datak\00E4llor.')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143145311162752607)
,p_name=>'WWV_FLOW_EXEC.UNSUPPPORTED_MULTI_VALUE_SEPARATOR'
,p_message_language=>'sv'
,p_message_text=>unistr('Tecknet %0 st\00F6ds inte som avgr\00E4nsare f\00F6r flera v\00E4rden.')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143293508300752651)
,p_name=>'WWV_FLOW_EXEC.WRONG_CONTEXT_TYPE'
,p_message_language=>'sv'
,p_message_text=>unistr('Den h\00E4r funktionen kan inte anv\00E4ndas i en fr\00E5gekontext.')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143121363177752600)
,p_name=>'WWV_FLOW_EXEC_API.INVALID_DATA_TYPE'
,p_message_language=>'sv'
,p_message_text=>'Felmatchad kolumndatatyp.'
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143154842365752610)
,p_name=>'WWV_FLOW_EXEC_DOC_SRC.REMOTE_MULTI_ROW_DML_NOT_SUPPORTED_WITHOUT_JSON_BINDS'
,p_message_language=>'sv'
,p_message_text=>unistr('Den h\00E4r datak\00E4llan st\00F6der inte \00E4ndring av flera rader.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143134282209752604)
,p_name=>'WWV_FLOW_EXEC_REMOTE.ORDS_OUT_BIND_LIMIT_EXCEEDED'
,p_message_language=>'sv'
,p_message_text=>unistr('Interna ORDS OUT-bindgr\00E4nser har \00F6verskridits. Minska antalet DML-rader.')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143236901565752634)
,p_name=>'WWV_FLOW_EXEC_REMOTE.RESPONSE_PARSING_ERROR'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('JSON-svaret fr\00E5n fj\00E4rrservern kan inte tolkas: '),
'%0'))
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143134187942752604)
,p_name=>'WWV_FLOW_EXEC_REMOTE.RUN_PLSQL_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('Ok\00E4nd eller felaktig kontexttyp.')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143158282628752611)
,p_name=>'WWV_FLOW_EXPORT_INT.UNSUPPORTED_READABLE_EXPORT'
,p_message_language=>'sv'
,p_message_text=>unistr('Komponenter som inte st\00F6ds f\00F6r export som kan l\00E4sas: %0')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143256225940752640)
,p_name=>'WWV_FLOW_FILE_PARSER.UNKNOWN_FILE_TYPE'
,p_message_language=>'sv'
,p_message_text=>unistr('Den h\00E4r filtypen st\00F6ds inte av parsern.')
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143207049602752625)
,p_name=>'WWV_FLOW_FND_DEVELOPER_API.CREDENTIALS_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('Obeh\00F6rig \00E5tkomst (wwv_flow_api.set_credentials \00E4r ej konfigurerade).')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143181985672752618)
,p_name=>'WWV_FLOW_FND_USER_API.CREATE_COMPANY'
,p_message_language=>'sv'
,p_message_text=>'Arbetsytan har inte skapats eftersom den redan finns.'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143181882923752618)
,p_name=>'WWV_FLOW_FND_USER_API.CREATE_USER_GROUP'
,p_message_language=>'sv'
,p_message_text=>unistr('Anv\00E4ndargruppen har inte skapats eftersom den redan finns.')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143193246782752621)
,p_name=>'WWV_FLOW_FND_USER_API.DUP_USER'
,p_message_language=>'sv'
,p_message_text=>unistr('Dubblettanv\00E4ndarnamn hittades f\00F6r %0.')
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143193327566752621)
,p_name=>'WWV_FLOW_FND_USER_API.LOAD_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('Fel vid laddning av anv\00E4ndare. Misslyckades f\00F6r anv\00E4ndaren %0.')
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143204149723752624)
,p_name=>'WWV_FLOW_FND_USER_API.T_MESSAGE'
,p_message_language=>'sv'
,p_message_text=>unistr('Skulle ha laddat %0 anv\00E4ndare.')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143203937394752624)
,p_name=>'WWV_FLOW_FND_USER_API.T_PASSWORD'
,p_message_language=>'sv'
,p_message_text=>unistr('L\00F6senord')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143204001709752624)
,p_name=>'WWV_FLOW_FND_USER_API.T_PRIVILEGE'
,p_message_language=>'sv'
,p_message_text=>unistr('Beh\00F6righeter')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143203786254752624)
,p_name=>'WWV_FLOW_FND_USER_API.T_USERNAME'
,p_message_language=>'sv'
,p_message_text=>unistr('Anv\00E4ndarnamn')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143284155332752648)
,p_name=>'WWV_FLOW_FORM.UNHANDLED_ERROR'
,p_message_language=>'sv'
,p_message_text=>unistr('Fel vid \00E5tergivning av sidobjektet #COMPONENT_NAME#.')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143199118540752623)
,p_name=>'WWV_FLOW_FORMS.FORM_NOT_OPEN_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('Kan inte visa sidobjektet eftersom HTML-formul\00E4ret inte har \00F6ppnats \00E4n.')
,p_version_scn=>2705687
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143157509280752611)
,p_name=>'WWV_FLOW_FORMS.ITEM_DEFAULT_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('Fel vid h\00E4mtning av standardv\00E4rden f\00F6r sidobjektet #COMPONENT_NAME#.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143198481797752623)
,p_name=>'WWV_FLOW_FORMS.ITEM_POST_CALC_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('Fel i objektpostber\00E4kning f\00F6r sidobjektet #COMPONENT_NAME#.')
,p_version_scn=>2705687
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143198304909752623)
,p_name=>'WWV_FLOW_FORMS.ITEM_SOURCE_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('Fel vid h\00E4mtning av objektk\00E4llv\00E4rdet f\00F6r sidobjektet #COMPONENT_NAME#.')
,p_version_scn=>2705687
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143175148140752616)
,p_name=>'WWV_FLOW_HELP.UNAUTHORIZED'
,p_message_language=>'sv'
,p_message_text=>unistr('Obeh\00F6rig \00E5tkomst.')
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143124618489752601)
,p_name=>'WWV_FLOW_INTERACTIVE_GRID.INVALID_JSON_ARRAY'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4rdet %0 f\00F6r %1 \00E4r inte en giltig JSON-uppst\00E4llning.')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143198644062752623)
,p_name=>'WWV_FLOW_ITEM.JS_NOT_SUPPORTED'
,p_message_language=>'sv'
,p_message_text=>unistr('JavaScript st\00F6ds inte.')
,p_version_scn=>2705687
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143198700931752623)
,p_name=>'WWV_FLOW_ITEM.LIST'
,p_message_language=>'sv'
,p_message_text=>'Lista'
,p_version_scn=>2705687
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143199307388752623)
,p_name=>'WWV_FLOW_ITEM.UNABLE_INIT_QUERY'
,p_message_language=>'sv'
,p_message_text=>unistr('Kan inte initiera fr\00E5gan.')
,p_version_scn=>2705687
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143207340464752625)
,p_name=>'WWV_FLOW_ITEM.UPDATE_NOT_SUPPORTED_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('Uppdatering av %0 st\00F6ds inte.')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143200870891752623)
,p_name=>'WWV_FLOW_ITEM_HELP.INVALID_ITEM_ERR'
,p_message_language=>'sv'
,p_message_text=>'Ogiltigt objekt-id: %0 '
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143228527173752632)
,p_name=>'WWV_FLOW_ITEM_HELP.NO_HELP_EXISTS'
,p_message_language=>'sv'
,p_message_text=>unistr('Det finns ingen hj\00E4lp f\00F6r det h\00E4r objektet.')
,p_version_scn=>2705693
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143190372942752620)
,p_name=>'WWV_FLOW_JET_CHART.QUERY_GENERATION_FAILED'
,p_message_language=>'sv'
,p_message_text=>unistr('Generering av diagramfr\00E5ga utf\00F6rdes inte. Kontrollera inst\00E4llningarna f\00F6r K\00E4lla och Kolumnmappning.')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143191682831752621)
,p_name=>'WWV_FLOW_MAIL.ADD_ATTACHMENT.INVALID_MAIL_ID'
,p_message_language=>'sv'
,p_message_text=>unistr('Ogiltigt v\00E4rde f\00F6r parametern p_mail_id: %0')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143228310027752632)
,p_name=>'WWV_FLOW_MAIL.CANNOT_USE_TO_OR_REPLYTO_AS_FROM'
,p_message_language=>'sv'
,p_message_text=>unistr('Kan inte anv\00E4nda "Till" eller "Svar till" som adressen "Fr\00E5n" eftersom de inneh\00E5ller flera e-postadresser.')
,p_version_scn=>2705693
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143313218629752657)
,p_name=>'WWV_FLOW_MAIL.EMAIL_LIMIT_EXCEEDED'
,p_message_language=>'sv'
,p_message_text=>unistr('Du har \00F6verskridit det maximala antalet e-postmeddelanden per arbetsyta. Kontakta administrat\00F6ren.')
,p_version_scn=>2705706
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143169856581752614)
,p_name=>'WWV_FLOW_MAIL.INVALID_CONTEXT'
,p_message_language=>'sv'
,p_message_text=>unistr('Den h\00E4r proceduren m\00E5ste anropas fr\00E5n en applikationssession.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143191530396752621)
,p_name=>'WWV_FLOW_MAIL.PARAMETER_NULL'
,p_message_language=>'sv'
,p_message_text=>unistr('Nullv\00E4rde har angetts f\00F6r parametern %0.')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143249679408752638)
,p_name=>'WWV_FLOW_MAIL.PREPARE_TEMPLATE.NO_DATA_FOUND'
,p_message_language=>'sv'
,p_message_text=>'E-postmallen "%0" hittades inte i applikationen %1.'
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143326107949752661)
,p_name=>'WWV_FLOW_MAIL.SMTP_HOST_ADDRESS_REQUIRED'
,p_message_language=>'sv'
,p_message_text=>unistr('Instansparametern SMTP_HOST_ADDRESS m\00E5ste konfigureras f\00F6r att skicka meddelanden.')
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143190950500752621)
,p_name=>'WWV_FLOW_MAIL.TO_IS_REQUIRED'
,p_message_language=>'sv'
,p_message_text=>unistr('Du m\00E5ste ange en meddelandemottagare f\00F6r att skicka ett meddelande.')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143315664891752658)
,p_name=>'WWV_FLOW_MAIL.UNABLE_TO_OPEN_SMTP_CONNECTION'
,p_message_language=>'sv'
,p_message_text=>unistr('Kan inte uppr\00E4tta en SMTP-anslutning med den konfigurerade e-postservern.')
,p_version_scn=>2705708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143290949881752650)
,p_name=>'WWV_FLOW_PLUGIN.INVALID_AJAX_CALL'
,p_message_language=>'sv'
,p_message_text=>'Ogiltigt Ajax-anrop!'
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143174854081752616)
,p_name=>'WWV_FLOW_PLUGIN.NO_AJAX_FUNCTION'
,p_message_language=>'sv'
,p_message_text=>unistr('Inga Ajax-funktioner har definierats f\00F6r insticksprogrammet %0')
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143281401543752647)
,p_name=>'WWV_FLOW_PLUGIN.NO_EXECUTION_FUNCTION'
,p_message_language=>'sv'
,p_message_text=>unistr('Inga k\00F6rningsfunktion har definierats f\00F6r insticksprogrammet %0')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143174907568752616)
,p_name=>'WWV_FLOW_PLUGIN.NO_RENDER_FUNCTION'
,p_message_language=>'sv'
,p_message_text=>unistr('Inga \00E5tergivningsfunktioner har definierats f\00F6r insticksprogrammet %0')
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143291865724752651)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_CAPABILITIES_FUNCTION'
,p_message_language=>'sv'
,p_message_text=>unistr('REST-datak\00E4llans insticksprogram "%0" inneh\00E5ller inte en "Kapacitet"-funktion.')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143291746158752651)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_DML_FUNCTION'
,p_message_language=>'sv'
,p_message_text=>unistr('REST-datak\00E4llans insticksprogram "%0" inneh\00E5ller inte en DML-funktion.')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143291996553752651)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_EXECUTE_FUNCTION'
,p_message_language=>'sv'
,p_message_text=>unistr('REST-datak\00E4llans insticksprogram "%0" inneh\00E5ller inte en K\00F6r-funktion.')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143292091862752651)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_FETCH_FUNCTION'
,p_message_language=>'sv'
,p_message_text=>unistr('REST-datak\00E4llans insticksprogram "%0" inneh\00E5ller inte en H\00E4mta-funktion.')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143172347577752615)
,p_name=>'WWV_FLOW_PLUGIN.RUN_PLSQL_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('Fel i PLSQL-koden intr\00E4ffade vid bearbetning av insticksprogrammet.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143180995606752618)
,p_name=>'WWV_FLOW_PLUGIN_DEV.IS_REQUIRED'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4rde m\00E5ste anges.')
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143213942055752627)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.CANT_CONVERT_TO_VARCHAR2'
,p_message_language=>'sv'
,p_message_text=>'Datatypen %0 kan inte konverteras till VARCHAR2!'
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143302141652752654)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.COLUMN_NOT_FOUND'
,p_message_language=>'sv'
,p_message_text=>unistr('Den angivna kolumnen "%0" f\00F6r attributet "%1" hittades inte i SQL-satsen!')
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143129442465752602)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.INVALID_JSON_ARRAY'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4rdet %0 f\00F6r %1 \00E4r inte en giltig JSON-uppst\00E4llning.')
,p_version_scn=>2705675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143279364997752647)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.LOV_REQUIRED'
,p_message_language=>'sv'
,p_message_text=>unistr('En v\00E4rdelistfr\00E5ga (LOV) eller Namngiven v\00E4rdelista m\00E5ste anges f\00F6r %0.')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143280905634752647)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.LOV_SQL_WRONG_COLUMN_COUNT'
,p_message_language=>'sv'
,p_message_text=>unistr('Fel antal kolumner har valts i v\00E4rdelistans SQL-fr\00E5ga f\00F6r %0. Se exempel f\00F6r giltiga satser.')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143301969674752654)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.NO_COLUMN_FOR_ATTRIBUTE'
,p_message_language=>'sv'
,p_message_text=>unistr('Ingen kolumn har angetts f\00F6r attributet "%0".')
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143331117976752662)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.NUMBER_ATTRIBUTE_VALUE_INVALID'
,p_message_language=>'sv'
,p_message_text=>unistr('Det angivna v\00E4rdet %0 f\00F6r attributet "%1" \00E4r inte numeriskt.')
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143284476892752648)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.SQL_WRONG_DATA_TYPE'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 har en felaktig datatyp i SQL-satsen. Kolumn# %1 \00E4r %2 men %3 f\00F6rv\00E4ntas.')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143302059554752654)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.WRONG_COLUMN_DATA_TYPE'
,p_message_language=>'sv'
,p_message_text=>unistr('Den angivna kolumnen "%0" f\00F6r attributet "%1" har datatypen %2 men ska ha %3.')
,p_version_scn=>2705705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143171501783752615)
,p_name=>'WWV_FLOW_PRINT_UTIL.REPORT_LAYOUT_NOT_FOUND'
,p_message_language=>'sv'
,p_message_text=>'Hittar inte rapportlayouten.'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143159125876752611)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTIONS_LIMIT_EXCEEDED'
,p_message_language=>'sv'
,p_message_text=>unistr('Gr\00E4nsen f\00F6r exekveringar i bakgrunden har \00F6verskridits med %0.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143109465059752596)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTION_ALREADY_RUNNING'
,p_message_language=>'sv'
,p_message_text=>unistr('En annan exekvering av %0 k\00F6rs redan.')
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143109327692752596)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTION_ALREADY_RUNNING_CTX'
,p_message_language=>'sv'
,p_message_text=>unistr('En annan exekvering av %0 k\00F6rs redan f\00F6r kontexten %1.')
,p_version_scn=>2705669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143124329098752601)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.FILES_NOT_VISIBLE_IN_WORKING_SESSION'
,p_message_language=>'sv'
,p_message_text=>unistr('Uppladdade filer visas inte i arbetssessionen f\00F6r exekveringen av %0.')
,p_version_scn=>2705671
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143236888888752634)
,p_name=>'WWV_FLOW_RENDER_REPORT3.COMPUTE_SUM_NOT_SUPPORTED_FOR_WEB_SOURCES'
,p_message_language=>'sv'
,p_message_text=>unistr('Funktionen Ber\00E4kna summa kan inte anv\00E4ndas f\00F6r rapporter baserat p\00E5 en REST-datak\00E4lla.')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143198546465752623)
,p_name=>'WWV_FLOW_RENDER_SHORTCUT.UNABLE_SET_SHORT_VAL_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('ERR-2904 Kan inte ange genv\00E4gsv\00E4rde.')
,p_version_scn=>2705687
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143203544087752624)
,p_name=>'WWV_FLOW_RENDER_SHORTCUT.UNKNOWN_TYPE_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('Fel: Ok\00E4nd genv\00E4gstyp.')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143141217420752606)
,p_name=>'WWV_FLOW_SEARCH_API.TEXT_QUERY_TOO_LONG'
,p_message_language=>'sv'
,p_message_text=>unistr('S\00F6kfr\00E5gan \00E4r f\00F6r l\00E5ng.')
,p_version_scn=>2705676
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143192601702752621)
,p_name=>'WWV_FLOW_SECURITY.AUTH_SCHEME_FETCH_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('Kan inte h\00E4mta autentiseringsschema i applikationen %0.')
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143200674948752623)
,p_name=>'WWV_FLOW_SECURITY.COMPONENT_FETCH_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('Kan inte h\00E4mta komponenten %0.')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143270943537752644)
,p_name=>'WWV_FLOW_SESSION_API.TENANT_ID_EXISTS'
,p_message_language=>'sv'
,p_message_text=>unistr('Detta klient-id finns redan f\00F6r den aktuella sessionen.')
,p_version_scn=>2705701
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143203872634752624)
,p_name=>'WWV_FLOW_USER_API.T_EMAIL'
,p_message_language=>'sv'
,p_message_text=>'E-post'
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143330683684752662)
,p_name=>'WWV_FLOW_WEB_SERVICES.AUTHENTICATION_FAILED'
,p_message_language=>'sv'
,p_message_text=>unistr('Autentiseringen utf\00F6rdes inte.')
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143231243287752632)
,p_name=>'WWV_FLOW_WEB_SERVICES.COOKIE_INVALID'
,p_message_language=>'sv'
,p_message_text=>unistr('En eller flera cookies konfigurerade i apex_util.g_request_cookies inneh\00E5ller ett ogiltigt v\00E4rde.')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143213171471752627)
,p_name=>'WWV_FLOW_WEB_SERVICES.INVALID_UDDI_RESPONSE'
,p_message_language=>'sv'
,p_message_text=>unistr('Svaret fr\00E5n UDDI-registret var ogiltigt.')
,p_version_scn=>2705689
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143172469053752615)
,p_name=>'WWV_FLOW_WEB_SERVICES.INVALID_WSDL'
,p_message_language=>'sv'
,p_message_text=>'Den angivna URL:en returnerade inte ett giltigt WSDL-dokument.'
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143175217568752616)
,p_name=>'WWV_FLOW_WEB_SERVICES.MULTIPLE_SOAP'
,p_message_language=>'sv'
,p_message_text=>unistr('WSDL-dokumentet inneh\00E5ller flera SOAP-bindningar. &PRODUCT_NAME. har endast st\00F6d f\00F6r WSDL:er med en SOAP-bindning. Klicka p\00E5 Skapa webbtj\00E4nstreferens manuellt f\00F6r att forts\00E4tta skapa en referens f\00F6r den h\00E4r tj\00E4nsten.')
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143250891754752638)
,p_name=>'WWV_FLOW_WEB_SERVICES.NOT_XML'
,p_message_language=>'sv'
,p_message_text=>unistr('Svaret fr\00E5n tj\00E4nsten var inte XML.')
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143330509459752662)
,p_name=>'WWV_FLOW_WEB_SERVICES.NO_VALID_OAUTH_TOKEN'
,p_message_language=>'sv'
,p_message_text=>unistr('OAuth-\00E5tkomsttoken \00E4r ogiltigt eller har upph\00F6rt.')
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143295078699752652)
,p_name=>'WWV_FLOW_WEB_SERVICES.REQUEST_LIMIT_EXCEEDED'
,p_message_language=>'sv'
,p_message_text=>unistr('Du har \00F6verskridit det maximala antalet webbtj\00E4nstf\00F6rfr\00E5gningar per arbetsyta. Kontakta administrat\00F6ren.')
,p_version_scn=>2705704
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143330712180752662)
,p_name=>'WWV_FLOW_WEB_SERVICES.UNSUPPORTED_OAUTH_TOKEN'
,p_message_language=>'sv'
,p_message_text=>unistr('Servern svarade med OAuth-tokentyp som inte st\00F6ds.')
,p_version_scn=>2705710
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143174635931752616)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_NO_SOAP'
,p_message_language=>'sv'
,p_message_text=>unistr('WSDL-dokumentet inneh\00F6ll inte en bindning f\00F6r SOAP vilket kr\00E4vs f\00F6r att l\00E4gga till referensen.')
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143170007178752614)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_REQUIRES_AUTH'
,p_message_language=>'sv'
,p_message_text=>unistr('Denna WSDL kr\00E4ver autentiseringsuppgifter. Ange anv\00E4ndarnamn och l\00F6senord nedan.')
,p_version_scn=>2705679
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143181087486752618)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_UNHANDLED'
,p_message_language=>'sv'
,p_message_text=>unistr('WSDL-dokumentet kunde inte tolkas av \00E5tergivningsmotorn. Klicka p\00E5 Skapa webbtj\00E4nstreferens manuellt f\00F6r att forts\00E4tta skapa en referens f\00F6r den h\00E4r tj\00E4nsten.')
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143253828069752639)
,p_name=>'WWV_FLOW_WIZARD_API.UPDATE_ERROR'
,p_message_language=>'sv'
,p_message_text=>'Kan inte bearbeta uppdatering.'
,p_version_scn=>2705696
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143279679011752647)
,p_name=>'WWV_FLOW_WORKSHEET.LOV_DISPLAY_AND_RETURN_COLUMN_EQUAL'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4rdelistan och visningskolumnen \00E4r samma!')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143279510807752647)
,p_name=>'WWV_FLOW_WORKSHEET.LOV_NO_RETURN_COLUMN'
,p_message_language=>'sv'
,p_message_text=>unistr('V\00E4rdelistan har ingen returkolumn.')
,p_version_scn=>2705703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143207222180752625)
,p_name=>'WWV_RENDER_REPORT3.COLUMN_VALUE_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('Fel vid h\00E4mtning av kolumnv\00E4rde: %0')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143232127759752633)
,p_name=>'WWV_RENDER_REPORT3.DATA_TOO_OLD'
,p_message_language=>'sv'
,p_message_text=>unistr('Aktuella data i tabellform \00E4r f\00F6r gamla, k\00E4lldata har modifierats.<br/> Klicka <strong><a href="%0">h\00E4r</a></strong> f\00F6r att ignorera dina \00E4ndringar och ladda om data fr\00E5n databasen.')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143187311757752619)
,p_name=>'WWV_RENDER_REPORT3.ERR_DETERMINE_PAGINATION'
,p_message_language=>'sv'
,p_message_text=>unistr('Fel vid fastst\00E4llande av sidnumreringsstr\00E4ng')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143187281148752619)
,p_name=>'WWV_RENDER_REPORT3.ERR_DETERMINE_QUERY_HEADINGS'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('kan inte fastst\00E4lla fr\00E5gerubriker:'),
'%0'))
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143187426718752619)
,p_name=>'WWV_RENDER_REPORT3.ERR_REPORT_FOOTER'
,p_message_language=>'sv'
,p_message_text=>unistr('fel intr\00E4ffade vid ers\00E4ttningar av rapportfot')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143187517816752620)
,p_name=>'WWV_RENDER_REPORT3.FAILED_PARSING_QUERY'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('kunde inte tolka SQL-fr\00E5gan:'),
'%0',
'%1'))
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143193660502752621)
,p_name=>'WWV_RENDER_REPORT3.FOUND_BUT_NOT_DISPLAYED'
,p_message_language=>'sv'
,p_message_text=>unistr('Minsta antal beg\00E4rda rader: %0, rader hittades men visades inte: %1')
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143190092594752620)
,p_name=>'WWV_RENDER_REPORT3.HTML_USE_COLUMN_ALIAS'
,p_message_language=>'sv'
,p_message_text=>unistr('fr\00E5gekolumnen #%0 (%1) \00E4r ogiltig, kolumner som anv\00E4nder HTML beh\00F6ver aliasnamn')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143207136610752625)
,p_name=>'WWV_RENDER_REPORT3.QUERY_HEADING_ERR'
,p_message_language=>'sv'
,p_message_text=>unistr('Fel n\00E4r fr\00E5gerubriker skulle h\00E4mtas: %0')
,p_version_scn=>2705688
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143187603882752620)
,p_name=>'WWV_RENDER_REPORT3.REPORT_ERROR'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'rapportfel:',
'%0'))
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143227789711752631)
,p_name=>'WWV_RENDER_REPORT3.SORT_BY_THIS_COLUMN'
,p_message_language=>'sv'
,p_message_text=>'Sortera efter denna kolumn'
,p_version_scn=>2705691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143190129681752620)
,p_name=>'WWV_RENDER_REPORT3.SYNTAX_ERROR'
,p_message_language=>'sv'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Fr\00E5gan kan inte tolkas, kontrollera syntaxen i fr\00E5gan.'),
'(%0)',
'</p>'))
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143232206638752633)
,p_name=>'WWV_RENDER_REPORT3.UNSAVED_DATA'
,p_message_language=>'sv'
,p_message_text=>unistr('Detta formul\00E4r inneh\00E5ller \00E4ndringar som inte har sparats. Tryck p\00E5 "OK" f\00F6r att forts\00E4tta utan att spara \00E4ndringarna.')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143236721467752634)
,p_name=>'WWV_RENDER_REPORT3.UNSUPPORTED_PAGINATION_SCHEME'
,p_message_language=>'sv'
,p_message_text=>unistr('Sidnumreringsschema f\00F6r rapporten (%0) st\00F6ds inte med den valda datak\00E4llan.')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143189948733752620)
,p_name=>'WWV_RENDER_REPORT3.USE_COLUMN_ALIAS'
,p_message_language=>'sv'
,p_message_text=>unistr('fr\00E5gekolumnen #%0 (%1) \00E4r ogiltig, anv\00E4nd kolumnalias')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143193788998752621)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_MORE_THAN_Z'
,p_message_language=>'sv'
,p_message_text=>unistr('rad(er) %0 \2013 %1 av mer \00E4n %2')
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143234289294752633)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_MORE_THAN_Z_2'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 \2013 %1 av mer \00E4n %2')
,p_version_scn=>2705694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143193500079752621)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z'
,p_message_language=>'sv'
,p_message_text=>unistr('rad(er) %0 \2013 %1 av %2')
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143174329618752616)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z_2'
,p_message_language=>'sv'
,p_message_text=>unistr('%0 \2013 %1 av %2')
,p_version_scn=>2705683
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143187732296752620)
,p_name=>'Y'
,p_message_language=>'sv'
,p_message_text=>'Y'
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143195009011752622)
,p_name=>'YEAR'
,p_message_language=>'sv'
,p_message_text=>unistr('\00E5r')
,p_version_scn=>2705685
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143186912920752619)
,p_name=>'YEARS'
,p_message_language=>'sv'
,p_message_text=>unistr('\00E5r')
,p_version_scn=>2705684
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143232310500752633)
,p_name=>'YES'
,p_message_language=>'sv'
,p_message_text=>'Ja'
,p_version_scn=>2705694
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
 p_id=>wwv_flow_imp.id(109678305570583962.4487)
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
 p_id=>1.4487
,p_name=>'Meddelanden'
,p_alias=>'MESSAGES'
,p_step_title=>'Meddelanden'
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
