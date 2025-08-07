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
,p_default_application_id=>4542
,p_default_id_offset=>0
,p_default_owner=>'APEX_240200'
);
end;
/
 
prompt APPLICATION 4542 - Oracle APEX Runtime Messages
--
-- Application Export:
--   Application:     4542
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
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'A144691878022756196')
,p_page_view_logging=>'YES'
,p_charset=>'utf-8'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt_last_reset=>'20250422180859'
,p_bookmark_checksum_function=>'SH1'
,p_compatibility_mode=>'24.2'
,p_session_state_commits=>'IMMEDIATE'
,p_flow_language=>'he'
,p_flow_language_derived_from=>'SESSION'
,p_date_format=>'&DATE_FORMAT.'
,p_direction_right_to_left=>'Y'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(109678305570583962.4542)
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
 p_id=>wwv_flow_imp.id(4542)
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
 p_id=>wwv_flow_imp.id(728504220438374.4542)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SELECT_MANY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_values_as', 'separated')).to_clob
,p_version_scn=>7007816
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(736540203200530.4542)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_BOSS'
,p_version_scn=>243430877
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(800575880762576.4542)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'NATIVE_OPEN_AI_ASSISTANT'
,p_version_scn=>15457644
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2657043006125217.4542)
,p_plugin_type=>'PROCESS TYPE'
,p_plugin=>'NATIVE_GEOCODING'
,p_attribute_01=>'RELAX_HOUSE_NUMBER'
,p_version_scn=>117636987
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(110599941590099161.4542)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'default_icon', 'fa-star',
  'tooltip', '#VALUE#')).to_clob
,p_version_scn=>7007818
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(118481226255833028.4542)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_MAP_REGION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_vector_tile_layers', 'Y')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(123214098089478467.4542)
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
 p_id=>wwv_flow_imp.id(124389732573989299.4542)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_ADFBC'
,p_version_scn=>37165931336889
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(209516503264520988.4542)
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
 p_id=>wwv_flow_imp.id(285800719532138903.4542)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N')).to_clob
,p_version_scn=>7007823
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(649595203182764436.4542)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_style', 'SWITCH_CB',
  'off_value', 'N',
  'on_value', 'Y')).to_clob
,p_version_scn=>6539584
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1874744429444344138.4542)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'include_slider', 'N')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1941451863897626238.4542)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'actions_menu_structure', 'IG')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2027366558906572283.4542)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'mode', 'FULL')).to_clob
,p_version_scn=>7007824
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2120597162971751123.4542)
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
 p_id=>wwv_flow_imp.id(649613204592764515.4542)
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
 p_id=>wwv_flow_imp.id(850359229090693491.4542)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Wizard Dialog.he'
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
 p_id=>wwv_flow_imp.id(293526110820992194.4542)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4542)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293526630547992195.4542)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4542)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293527171164992195.4542)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4542)
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
 p_id=>wwv_flow_imp.id(851037359784626333.4542)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Dialog.he'
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
 p_id=>wwv_flow_imp.id(293473352245977306.4542)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4542)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293473882718977306.4542)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4542)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293474370844977307.4542)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4542)
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
 p_id=>wwv_flow_imp.id(851037631091626378.4542)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Edit Screen.he'
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
 p_id=>wwv_flow_imp.id(2495515088702127.4542)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4542)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2496016567702127.4542)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4542)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2496522618702127.4542)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4542)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2497097895702127.4542)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4542)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2497562953702128.4542)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4542)
,p_name=>'Edit Screen Header'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2498085850702128.4542)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4542)
,p_name=>'Page Position 5'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2498553894702128.4542)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4542)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2499023066702128.4542)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4542)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2499516729702128.4542)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4542)
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
 p_id=>wwv_flow_imp.id(851039898661626389.4542)
,p_theme_id=>3
,p_name=>'APEX 5.0 - No Side Bar.he'
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
 p_id=>wwv_flow_imp.id(2418665544706094.4542)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4542)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2419139140706094.4542)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4542)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2419660231706094.4542)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4542)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2420136000706094.4542)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4542)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2420617033706094.4542)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4542)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2421142368706094.4542)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4542)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2421629849706095.4542)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4542)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2422132460706095.4542)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4542)
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
 p_id=>wwv_flow_imp.id(851040471818626394.4542)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Right Side Bar.he'
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
 p_id=>wwv_flow_imp.id(1537388880131854.4542)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4542)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1537880270131855.4542)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4542)
,p_name=>'Page Header (Position 3)'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1538315330131855.4542)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4542)
,p_name=>'Page Header (Position 4)'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1538840638131855.4542)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4542)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1539339441131855.4542)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4542)
,p_name=>'After Body'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1539830162131855.4542)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4542)
,p_name=>'Page Header (Position 1)'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1540338421131855.4542)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4542)
,p_name=>'Page Header (Position 2)'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1540832064131856.4542)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4542)
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
 p_id=>wwv_flow_imp.id(851041812938626395.4542)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Sign Up Wizard.he'
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
 p_id=>wwv_flow_imp.id(115212309210289451.4542)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4542)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115212857712289451.4542)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4542)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115213340345289452.4542)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4542)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115213804331289452.4542)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4542)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115214317592289452.4542)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4542)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115214875819289453.4542)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4542)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115215325320289453.4542)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4542)
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
 p_id=>wwv_flow_imp.id(851042476105626395.4542)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Wizard Page.he'
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
 p_id=>wwv_flow_imp.id(1485266589875353.4542)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4542)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1485734308875353.4542)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4542)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1486237142875354.4542)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4542)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1486735024875354.4542)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4542)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1487219028875354.4542)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4542)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1487770987875354.4542)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4542)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1488272041875354.4542)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4542)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1488725778875354.4542)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4542)
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
 p_id=>wwv_flow_imp.id(514381861202541059.4542)
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
 p_id=>wwv_flow_imp.id(514382190540541061.4542)
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
 p_id=>wwv_flow_imp.id(514382538845541061.4542)
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
 p_id=>wwv_flow_imp.id(620629666890811728.4542)
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
 p_id=>wwv_flow_imp.id(620629778318811745.4542)
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
 p_id=>wwv_flow_imp.id(868252865986181054.4542)
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
 p_id=>wwv_flow_imp.id(514338947870435171.4542)
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
 p_id=>wwv_flow_imp.id(2962385277500935.4542)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4542)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2962865718500935.4542)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4542)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2963338641500935.4542)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4542)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2963894582500935.4542)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4542)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2964329937500935.4542)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4542)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2964897214500936.4542)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4542)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2965324003500936.4542)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4542)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2965838011500936.4542)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4542)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2966328405500936.4542)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4542)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2966823859500936.4542)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4542)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2967325351500936.4542)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4542)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2967812485500936.4542)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4542)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2968377768500937.4542)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4542)
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
 p_id=>wwv_flow_imp.id(514343873675436760.4542)
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
 p_id=>wwv_flow_imp.id(32585474981747544.4542)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4542)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32585915750747544.4542)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4542)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32586471989747545.4542)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4542)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32586972270747545.4542)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4542)
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
 p_id=>wwv_flow_imp.id(771803843049318447.4542)
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
 p_id=>wwv_flow_imp.id(3207496127505978.4542)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4542)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3207907805505978.4542)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4542)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3208484941505978.4542)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4542)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3208991047505978.4542)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4542)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3209402462505979.4542)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4542)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3209972507505979.4542)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4542)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3210460159505979.4542)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4542)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3210935368505979.4542)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4542)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3211466566505979.4542)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4542)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3211956312505979.4542)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4542)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3212461962505979.4542)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4542)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3212966370505980.4542)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4542)
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
 p_id=>wwv_flow_imp.id(850406444708718383.4542)
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
 p_id=>wwv_flow_imp.id(2204663592232325.4542)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4542)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2205135519232325.4542)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4542)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2205694824232325.4542)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4542)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2206129075232325.4542)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4542)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2206618558232325.4542)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4542)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2207115910232326.4542)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4542)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2207688896232326.4542)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4542)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2208160700232326.4542)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4542)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2208614050232326.4542)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4542)
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
 p_id=>wwv_flow_imp.id(850442966147812557.4542)
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
 p_id=>wwv_flow_imp.id(3346988371508588.4542)
,p_plug_template_id=>wwv_flow_imp.id(850442966147812557.4542)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3347426198508588.4542)
,p_plug_template_id=>wwv_flow_imp.id(850442966147812557.4542)
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
 p_id=>wwv_flow_imp.id(856206049762521193.4542)
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
 p_id=>wwv_flow_imp.id(2526185270486606.4542)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4542)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2526610033486606.4542)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4542)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2527184084486606.4542)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4542)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2527626846486607.4542)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4542)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2528141078486607.4542)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4542)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2528637911486607.4542)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4542)
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
 p_id=>wwv_flow_imp.id(914802799655239969.4542)
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
 p_id=>wwv_flow_imp.id(88183211858816924.4542)
,p_plug_template_id=>wwv_flow_imp.id(914802799655239969.4542)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(88183732152816924.4542)
,p_plug_template_id=>wwv_flow_imp.id(914802799655239969.4542)
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
 p_id=>wwv_flow_imp.id(914803495164240003.4542)
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
 p_id=>wwv_flow_imp.id(3373447170510516.4542)
,p_plug_template_id=>wwv_flow_imp.id(914803495164240003.4542)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3373993086510516.4542)
,p_plug_template_id=>wwv_flow_imp.id(914803495164240003.4542)
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
 p_id=>wwv_flow_imp.id(915210356236972585.4542)
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
 p_id=>wwv_flow_imp.id(2899946654493378.4542)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4542)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2900442121493378.4542)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4542)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2900949359493378.4542)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4542)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2901467944493378.4542)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4542)
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
 p_id=>wwv_flow_imp.id(915371118115573423.4542)
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
 p_id=>wwv_flow_imp.id(2695578355491332.4542)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4542)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2696079816491332.4542)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4542)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2696558276491332.4542)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4542)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2697055726491332.4542)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4542)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2697581510491332.4542)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4542)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2698048732491333.4542)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4542)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2698576547491333.4542)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4542)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2699004772491333.4542)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4542)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2699557295491333.4542)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4542)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2700035673491333.4542)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4542)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2700500589491333.4542)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4542)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2701097053491333.4542)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4542)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2701554382491334.4542)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4542)
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
 p_id=>wwv_flow_imp.id(1274355059486017828.4542)
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
 p_id=>wwv_flow_imp.id(61232728057733462.4542)
,p_plug_template_id=>wwv_flow_imp.id(1274355059486017828.4542)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(61233207886733462.4542)
,p_plug_template_id=>wwv_flow_imp.id(1274355059486017828.4542)
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
 p_id=>wwv_flow_imp.id(514332014414430986.4542)
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
 p_id=>wwv_flow_imp.id(514332292784430987.4542)
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
 p_id=>wwv_flow_imp.id(860563697365629462.4542)
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
 p_id=>wwv_flow_imp.id(865273508717512144.4542)
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
 p_id=>wwv_flow_imp.id(908020362212234651.4542)
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
 p_id=>wwv_flow_imp.id(914818080687341593.4542)
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
 p_id=>wwv_flow_imp.id(851049711466639395.4542)
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
 p_id=>wwv_flow_imp.id(851054516889639461.4542)
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
 p_id=>wwv_flow_imp.id(851055225644639463.4542)
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
 p_id=>wwv_flow_imp.id(851056531929639482.4542)
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
 p_id=>wwv_flow_imp.id(914792024808213039.4542)
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
 p_id=>wwv_flow_imp.id(914792322768213043.4542)
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
 p_id=>wwv_flow_imp.id(915377874236666939.4542)
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
 p_id=>wwv_flow_imp.id(1041941432531249038.4542)
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
 p_id=>wwv_flow_imp.id(850683711614406253.4542)
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
 p_id=>wwv_flow_imp.id(851047536471633848.4542)
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
 p_id=>wwv_flow_imp.id(851047676005633854.4542)
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
 p_id=>wwv_flow_imp.id(851047684809633856.4542)
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
 p_id=>wwv_flow_imp.id(851047795461633856.4542)
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
 p_id=>wwv_flow_imp.id(860542631889572088.4542)
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
 p_id=>wwv_flow_imp.id(1321751941832424103.4542)
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
 p_id=>wwv_flow_imp.id(514333590213433126.4542)
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
 p_id=>wwv_flow_imp.id(649611704621764507.4542)
,p_page_name=>'winlov'
,p_page_title=>unistr('\05D3\05D5-\05E9\05D9\05D7 ''\05D7\05D9\05E4\05D5\05E9''')
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
,p_find_button_text=>unistr('\05D7\05E4\05E9')
,p_find_button_attr=>'class="a-Button a-Button--hot a-Button--padLeft"'
,p_close_button_text=>unistr('\05E1\05D2\05D5\05E8')
,p_close_button_attr=>'class="a-Button u-pullRight"'
,p_next_button_text=>unistr('\05D4\05D1\05D0 &gt;')
,p_next_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_prev_button_text=>unistr('&lt; \05D4\05E7\05D5\05D3\05DD')
,p_prev_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'380'
,p_height=>'480'
,p_result_row_x_of_y=>unistr('<div class="a-PopupLOV-pagination">\05E9\05D5\05E8\05D5\05EA #FIRST_ROW# - #LAST_ROW#</div>')
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
 p_id=>wwv_flow_imp.id(649611609668764506.4542)
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
 p_id=>wwv_flow_imp.id(182005134783173294.4542)
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
 p_id=>wwv_flow_imp.id(666074212329754757.4542)
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
 p_id=>wwv_flow_imp.id(666074525535755551.4542)
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
 p_id=>wwv_flow_imp.id(717250289307903026.4542)
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
 p_id=>wwv_flow_imp.id(2336377640986141.4542)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL'
,p_display_name=>'Heading Level'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(806925000765340952.4542)
,p_theme_id=>3
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default - No Icons'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808380142596819918.4542)
,p_theme_id=>3
,p_name=>'ALTERNATING_TABLE_ROWS'
,p_display_name=>'Alternating Table Rows'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Enable'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808380828683819918.4542)
,p_theme_id=>3
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Disable'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808381542095819918.4542)
,p_theme_id=>3
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default Border'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808383088145819924.4542)
,p_theme_id=>3
,p_name=>'REPORT_WIDTH'
,p_display_name=>'Report Width'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850406791580718389.4542)
,p_theme_id=>3
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850407096779718396.4542)
,p_theme_id=>3
,p_name=>'REGION_PADDING'
,p_display_name=>'Region Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Padding'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850407509193718398.4542)
,p_theme_id=>3
,p_name=>'REGION_STYLE'
,p_display_name=>'Region Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Style'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(851050160062639437.4542)
,p_theme_id=>3
,p_name=>'BADGE_LAYOUT'
,p_display_name=>'Badge Layout'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(851051045625639457.4542)
,p_theme_id=>3
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856113214217058023.4542)
,p_theme_id=>3
,p_name=>'HEIGHT'
,p_display_name=>'Height'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856114568019058024.4542)
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
 p_id=>wwv_flow_imp.id(856114830529058024.4542)
,p_theme_id=>3
,p_name=>'FORM_LABEL_WIDTH'
,p_display_name=>'Form Label Width'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856115135223058024.4542)
,p_theme_id=>3
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Not Part of Button Set'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116214022058024.4542)
,p_theme_id=>3
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>1
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116523282058024.4542)
,p_theme_id=>3
,p_name=>'FORM_LABEL_POSITION'
,p_display_name=>'Form Label Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116798725058025.4542)
,p_theme_id=>3
,p_name=>'BUTTON_SIZE'
,p_display_name=>'Button Size'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Button Size'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117102944058028.4542)
,p_theme_id=>3
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing left'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Left Spacing'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117454663058028.4542)
,p_theme_id=>3
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Right Spacing'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117908453058029.4542)
,p_theme_id=>3
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Icon on Right'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856118261810058029.4542)
,p_theme_id=>3
,p_name=>'BUTTON_TYPE'
,p_display_name=>'Button Type'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856206461450521195.4542)
,p_theme_id=>3
,p_name=>'ALERT_TYPE'
,p_display_name=>'Alert Type'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856206736628521198.4542)
,p_theme_id=>3
,p_name=>'DISPLAY'
,p_display_name=>'Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(860570508910721307.4542)
,p_theme_id=>3
,p_name=>'REGION_POSITION'
,p_display_name=>'Region Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(860571060920721309.4542)
,p_theme_id=>3
,p_name=>'REGION_OVERFLOW'
,p_display_name=>'Region Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(908020718209234676.4542)
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
 p_id=>wwv_flow_imp.id(1487577187426769.4542)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden to Assistive Tech'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4542)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4542)
,p_template_types=>'REGION'
,p_help_text=>'By default, region title is hidden but accessible, use this option to remove the header from accessible interface'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2336635141996782.4542)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H1'
,p_display_name=>'H1'
,p_display_sequence=>10
,p_css_classes=>'js-headingLevel-1'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4542)
,p_template_types=>'REGION'
,p_help_text=>'H1'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2336917964996782.4542)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H2'
,p_display_name=>'H2'
,p_display_sequence=>20
,p_css_classes=>'js-headingLevel-2'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4542)
,p_template_types=>'REGION'
,p_help_text=>'H2'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2337368425996782.4542)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H3'
,p_display_name=>'H3'
,p_display_sequence=>30
,p_css_classes=>'js-headingLevel-3'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4542)
,p_template_types=>'REGION'
,p_help_text=>'H3'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2337706283996782.4542)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H4'
,p_display_name=>'H4'
,p_display_sequence=>40
,p_css_classes=>'js-headingLevel-4'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4542)
,p_template_types=>'REGION'
,p_help_text=>'H4'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2338144805996782.4542)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H5'
,p_display_name=>'H5'
,p_display_sequence=>50
,p_css_classes=>'js-headingLevel-5'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4542)
,p_template_types=>'REGION'
,p_help_text=>'H5'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2338562059996782.4542)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H6'
,p_display_name=>'H6'
,p_display_sequence=>60
,p_css_classes=>'js-headingLevel-6'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4542)
,p_template_types=>'REGION'
,p_help_text=>'H6'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134384175764258.4542)
,p_theme_id=>3
,p_name=>'LARGELEFT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapLeft'
,p_group_id=>wwv_flow_imp.id(856117102944058028.4542)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134654971764258.4542)
,p_theme_id=>3
,p_name=>'LARGERIGHT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapRight'
,p_group_id=>wwv_flow_imp.id(856117454663058028.4542)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134823880764258.4542)
,p_theme_id=>3
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(856117908453058029.4542)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135009020764258.4542)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>3
,p_css_classes=>'a-Button--large'
,p_group_id=>wwv_flow_imp.id(856116798725058025.4542)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135269851764258.4542)
,p_theme_id=>3
,p_name=>'SMALLLEFT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padLeft'
,p_group_id=>wwv_flow_imp.id(856117102944058028.4542)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135477215764258.4542)
,p_theme_id=>3
,p_name=>'SMALLRIGHT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padRight'
,p_group_id=>wwv_flow_imp.id(856117454663058028.4542)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135634744764258.4542)
,p_theme_id=>3
,p_name=>'INNERBUTTON'
,p_display_name=>'Inner Button'
,p_display_sequence=>2
,p_css_classes=>'a-Button--pill'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4542)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135785730764258.4542)
,p_theme_id=>3
,p_name=>'LASTBUTTON'
,p_display_name=>'Last Button'
,p_display_sequence=>3
,p_css_classes=>'a-Button--pillEnd'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4542)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136068296764258.4542)
,p_theme_id=>3
,p_name=>'FIRSTBUTTON'
,p_display_name=>'First Button'
,p_display_sequence=>1
,p_css_classes=>'a-Button--pillStart'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4542)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136225140764258.4542)
,p_theme_id=>3
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>1
,p_css_classes=>'a-Button--primary'
,p_group_id=>wwv_flow_imp.id(856118261810058029.4542)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136360666764258.4542)
,p_theme_id=>3
,p_name=>'REGIONHEADERBUTTON'
,p_display_name=>'Button in Region Header'
,p_display_sequence=>1
,p_css_classes=>'a-Button--regionHeader'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136507481764259.4542)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--small'
,p_group_id=>wwv_flow_imp.id(856116798725058025.4542)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136620486764259.4542)
,p_theme_id=>3
,p_name=>'STRONGBUTTONLABEL'
,p_display_name=>'Strong Button Label'
,p_display_sequence=>1
,p_css_classes=>'a-Button--strongLabel'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136861925764259.4542)
,p_theme_id=>3
,p_name=>'AUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form--autoWidthLabels'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4542)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137023291764259.4542)
,p_theme_id=>3
,p_name=>'FIXEDWIDTH'
,p_display_name=>'Fixed'
,p_display_sequence=>10
,p_css_classes=>'a-Form--fixedLabels'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4542)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137193234764259.4542)
,p_theme_id=>3
,p_name=>'LABELSABOVE'
,p_display_name=>'Labels Above'
,p_display_sequence=>1
,p_css_classes=>'a-Form--labelsAbove'
,p_group_id=>wwv_flow_imp.id(856116523282058024.4542)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137470293764259.4542)
,p_theme_id=>3
,p_name=>'ALIGNLABELSLEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Form--leftLabels'
,p_group_id=>wwv_flow_imp.id(856114568019058024.4542)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137586003764259.4542)
,p_theme_id=>3
,p_name=>'LABELAUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--autoLabelWidth'
,p_group_id=>wwv_flow_imp.id(856116214022058024.4542)
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137737661764259.4542)
,p_theme_id=>3
,p_name=>'STRETCHFORMFIELD'
,p_display_name=>'Stretch Form Field'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--stretch'
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137933035764259.4542)
,p_theme_id=>3
,p_name=>'FIXEDLARGE'
,p_display_name=>'Fixed (Large Width)'
,p_display_sequence=>30
,p_css_classes=>'a-Form-fixedLabelsLarge'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4542)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138175863764259.4542)
,p_theme_id=>3
,p_name=>'FIXEDMEDIUM'
,p_display_name=>'Fixed (Medium Width)'
,p_display_sequence=>20
,p_css_classes=>'a-Form-fixedLabelsMed'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4542)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138340877764259.4542)
,p_theme_id=>3
,p_name=>'180PX'
,p_display_name=>'180px'
,p_display_sequence=>10
,p_css_classes=>'h180'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4542)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138553321764259.4542)
,p_theme_id=>3
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>20
,p_css_classes=>'h240'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4542)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138777457764259.4542)
,p_theme_id=>3
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>30
,p_css_classes=>'h320'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4542)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138891974764260.4542)
,p_theme_id=>3
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>50
,p_css_classes=>'h480'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4542)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857139153872764260.4542)
,p_theme_id=>3
,p_name=>'540PX'
,p_display_name=>'540px'
,p_display_sequence=>60
,p_css_classes=>'h540'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4542)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857139375337764260.4542)
,p_theme_id=>3
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>70
,p_css_classes=>'h640'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4542)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145206107768768.4542)
,p_theme_id=>3
,p_name=>'USE_COLORED_BACKGROUND'
,p_display_name=>'Use Colored Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4542)
,p_css_classes=>'a-Alert--colorBG'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145328630768768.4542)
,p_theme_id=>3
,p_name=>'USE_DEFAULT_ICONS'
,p_display_name=>'Use Default Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4542)
,p_css_classes=>'a-Alert--defaultIcons'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145505007768768.4542)
,p_theme_id=>3
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4542)
,p_css_classes=>'a-Alert--warning'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4542)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145725778768768.4542)
,p_theme_id=>3
,p_name=>'ERROR'
,p_display_name=>'Error'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4542)
,p_css_classes=>'a-Alert--danger'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4542)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145892117768768.4542)
,p_theme_id=>3
,p_name=>'INFORMATIONAL'
,p_display_name=>'Informational'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4542)
,p_css_classes=>'a-Alert--info'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4542)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146085228768768.4542)
,p_theme_id=>3
,p_name=>'HORIZONTAL'
,p_display_name=>'Horizontal'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4542)
,p_css_classes=>'a-Alert--horizontal'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4542)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146322225768769.4542)
,p_theme_id=>3
,p_name=>'WIZARD'
,p_display_name=>'Wizard'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4542)
,p_css_classes=>'a-Alert--wizard'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4542)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146393064768769.4542)
,p_theme_id=>3
,p_name=>'REMOVE_ICON'
,p_display_name=>'Remove Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4542)
,p_css_classes=>'a-Alert--noIcon'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146615368768769.4542)
,p_theme_id=>3
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4542)
,p_css_classes=>'a-Alert--success'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4542)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147042367768771.4542)
,p_theme_id=>3
,p_name=>'REGIONCONTAINSITEMSTEXT'
,p_display_name=>'Region Contains Items / Text'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4542)
,p_css_classes=>'a-ButtonRegion--withItems'
,p_template_types=>'REGION'
,p_help_text=>'Check this option if this region contains items or text.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147189725768771.4542)
,p_theme_id=>3
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4542)
,p_css_classes=>'a-ButtonRegion--noUI'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4542)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147385795768771.4542)
,p_theme_id=>3
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4542)
,p_css_classes=>'a-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4542)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147655668768771.4542)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4542)
,p_css_classes=>'a-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4542)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147872948768771.4542)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4542)
,p_css_classes=>'a-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4542)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147976018768771.4542)
,p_theme_id=>3
,p_name=>'WIZARDDIALOG'
,p_display_name=>'Used for Wizard Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4542)
,p_css_classes=>'a-ButtonRegion--wizard'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857148162424768771.4542)
,p_theme_id=>3
,p_name=>'VISIBLE'
,p_display_name=>'Visible'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4542)
,p_css_classes=>'a-ButtonRegion--showTitle'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4542)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857148341454768771.4542)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4542)
,p_css_classes=>'a-ButtonRegion--accessibleTitle'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4542)
,p_template_types=>'REGION'
,p_help_text=>'Use this option to add a visually hidden heading which is accessible for screen readers, but otherwise not visible to users.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149438708768778.4542)
,p_theme_id=>3
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4542)
,p_css_classes=>'a-BadgeList--float'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4542)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149614105768778.4542)
,p_theme_id=>3
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4542)
,p_css_classes=>'a-BadgeList--fixed'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4542)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149843563768778.4542)
,p_theme_id=>3
,p_name=>'STACKEDVERTICALLY'
,p_display_name=>'Stacked Vertically'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4542)
,p_css_classes=>'a-BadgeList--stacked'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4542)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149998210768778.4542)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'32px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4542)
,p_css_classes=>'a-BadgeList--small'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4542)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150194417768778.4542)
,p_theme_id=>3
,p_name=>'MEDIUM'
,p_display_name=>'48px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4542)
,p_css_classes=>'a-BadgeList--medium'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4542)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150439507768778.4542)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'64px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4542)
,p_css_classes=>'a-BadgeList--large'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4542)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150608654768780.4542)
,p_theme_id=>3
,p_name=>'XLARGE'
,p_display_name=>'96px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4542)
,p_css_classes=>'a-BadgeList--xlarge'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4542)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150792333768780.4542)
,p_theme_id=>3
,p_name=>'XXLARGE'
,p_display_name=>'128px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4542)
,p_css_classes=>'a-BadgeList--xxlarge'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4542)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151008734768780.4542)
,p_theme_id=>3
,p_name=>'2COLUMNNGRID'
,p_display_name=>'2 Columnn Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4542)
,p_css_classes=>'a-BadgeList--cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4542)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151259777768780.4542)
,p_theme_id=>3
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4542)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--3cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4542)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151408063768780.4542)
,p_theme_id=>3
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4542)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--4cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4542)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151643103768780.4542)
,p_theme_id=>3
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4542)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--5cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4542)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151861194768780.4542)
,p_theme_id=>3
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4542)
,p_css_classes=>'a-BadgeList--flex'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4542)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896798730495581814.4542)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4542)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(808380142596819918.4542)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896798963380581814.4542)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4542)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(808380828683819918.4542)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799089194581814.4542)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4542)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4542)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799349986581814.4542)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4542)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4542)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799577541581814.4542)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4542)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4542)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799637215581814.4542)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4542)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799807498581814.4542)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4542)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_imp.id(808383088145819924.4542)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022191342234716.4542)
,p_theme_id=>3
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4542)
,p_css_classes=>'a-MediaList--cols a-MediaList--2cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4542)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022392217234716.4542)
,p_theme_id=>3
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4542)
,p_css_classes=>'a-MediaList--cols a-MediaList--3cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4542)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022597980234716.4542)
,p_theme_id=>3
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4542)
,p_css_classes=>'a-MediaList--cols a-MediaList--4cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4542)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022867300234717.4542)
,p_theme_id=>3
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4542)
,p_css_classes=>'a-MediaList--cols a-MediaList--5cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4542)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023065592234717.4542)
,p_theme_id=>3
,p_name=>'SPANHORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4542)
,p_css_classes=>'a-MediaList--horizontal'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4542)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023131122234717.4542)
,p_theme_id=>3
,p_name=>'HIDEBADGE'
,p_display_name=>'Hide Badge'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4542)
,p_css_classes=>'a-MediaList--noBadge'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023191297234717.4542)
,p_theme_id=>3
,p_name=>'HIDEDESCRIPTION'
,p_display_name=>'Hide Description'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4542)
,p_css_classes=>'a-MediaList--noDesc'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023315038234717.4542)
,p_theme_id=>3
,p_name=>'HIDETITLE'
,p_display_name=>'Hide Title'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4542)
,p_css_classes=>'a-MediaList--noTitle'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023432264234717.4542)
,p_theme_id=>3
,p_name=>'HIDEICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4542)
,p_css_classes=>'a-MediaList--noIcons'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023494059234717.4542)
,p_theme_id=>3
,p_name=>'SLIMLIST'
,p_display_name=>'Slim List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4542)
,p_css_classes=>'a-MediaList--slim'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378094918666945.4542)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4542)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(808380142596819918.4542)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378225037666947.4542)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4542)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(808380828683819918.4542)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378370589666947.4542)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4542)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4542)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378467813666947.4542)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4542)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378526097666947.4542)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4542)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4542)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378615102666947.4542)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4542)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_imp.id(808383088145819924.4542)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378735377666947.4542)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4542)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4542)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1036071796325339624.4542)
,p_theme_id=>3
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(514332292784430987.4542)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1036071972285339624.4542)
,p_theme_id=>3
,p_name=>'ADD_SLIDE_ANIMATION'
,p_display_name=>'Add Slide Animation'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(514332292784430987.4542)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1050367122398973653.4542)
,p_theme_id=>3
,p_name=>'SLIMPROGRESSLIST'
,p_display_name=>'Slim Progress List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(865273508717512144.4542)
,p_css_classes=>'a-WizardSteps--slim'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1309233880682664517.4542)
,p_theme_id=>3
,p_name=>'LEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_button_template_id=>wwv_flow_imp.id(868252865986181054.4542)
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(856117908453058029.4542)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1351338307429029043.4542)
,p_theme_id=>3
,p_name=>'USED_IN_DIALOG'
,p_display_name=>'Used in Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1274355059486017828.4542)
,p_css_classes=>'a-ProcessingRegion--dialog'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333722717814196.4542)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4542)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333859287814196.4542)
,p_theme_id=>3
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4542)
,p_css_classes=>'a-LinksList--showBadge'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333887728814196.4542)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4542)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334039640814196.4542)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4542)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334247146814196.4542)
,p_theme_id=>3
,p_name=>'FORTOPLEVELONLY'
,p_display_name=>'For top level only'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4542)
,p_css_classes=>'a-LinksList--showTopIcons'
,p_group_id=>wwv_flow_imp.id(806925000765340952.4542)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334455135814196.4542)
,p_theme_id=>3
,p_name=>'FORALLITEMS'
,p_display_name=>'For all items'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4542)
,p_css_classes=>'a-LinksList--showIcons'
,p_group_id=>wwv_flow_imp.id(806925000765340952.4542)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491342397110118.4542)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4542)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491390428110118.4542)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4542)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491480011110118.4542)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4542)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664488722406040473.4542)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4542)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4542)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664488933681040473.4542)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4542)
,p_css_classes=>'a-Region--accessibleHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4542)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489165994040473.4542)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4542)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4542)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489304869040473.4542)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4542)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4542)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489519844040473.4542)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4542)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_imp.id(860570508910721307.4542)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489753255040473.4542)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4542)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4542)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489941797040473.4542)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4542)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4542)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490153471040473.4542)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4542)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4542)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490336091040473.4542)
,p_theme_id=>3
,p_name=>'DEFAULTPADDING'
,p_display_name=>'Default Padding'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4542)
,p_css_classes=>'a-Region--paddedBody'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4542)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490377667040473.4542)
,p_theme_id=>3
,p_name=>'REMOVE_TOP_BORDER'
,p_display_name=>'Remove Top Border'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4542)
,p_css_classes=>'a-Region--noTopBorder'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490659850040473.4542)
,p_theme_id=>3
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4542)
,p_css_classes=>'a-Region--simple'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4542)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664501980442158869.4542)
,p_theme_id=>3
,p_name=>'RESPONSIVEICONCOLUMNS'
,p_display_name=>'Responsive Icon Columns'
,p_display_sequence=>2
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4542)
,p_css_classes=>'a-IRR-region--responsiveIconView'
,p_template_types=>'REGION'
,p_help_text=>'Automatically increases number of icon columns to show based on screen resolution.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664502160891158869.4542)
,p_theme_id=>3
,p_name=>'ICONLABELSRIGHT'
,p_display_name=>'Icon Labels on Right'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4542)
,p_css_classes=>'a-IRR-region--iconLabelsRight'
,p_template_types=>'REGION'
,p_help_text=>'Shows labels in Icon View to the right of the icon.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664502181188158869.4542)
,p_theme_id=>3
,p_name=>'REMOVEOUTERBORDERS'
,p_display_name=>'Remove Outer Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4542)
,p_css_classes=>'a-IRR-region--noOuterBorders'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508367504174332.4542)
,p_theme_id=>3
,p_name=>'FLUSHREGION'
,p_display_name=>'Flush Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4542)
,p_css_classes=>'a-Region--flush'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508426350174332.4542)
,p_theme_id=>3
,p_name=>'STACKEDREGION'
,p_display_name=>'Stacked Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4542)
,p_css_classes=>'a-Region--stacked'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508588305174332.4542)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4542)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4542)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508810521174332.4542)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4542)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4542)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509005841174332.4542)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4542)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_imp.id(860570508910721307.4542)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509270186174332.4542)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4542)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4542)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509448573174333.4542)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4542)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4542)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509659839174333.4542)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4542)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4542)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509822387174334.4542)
,p_theme_id=>3
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>.1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4542)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4542)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664510028962174334.4542)
,p_theme_id=>3
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4542)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4542)
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
 p_id=>wwv_flow_imp.id(139112566400751345)
,p_name=>'4150_COLUMN_NUMBER'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DE\05D5\05D3\05D4 %0')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139097116829751341)
,p_name=>'ACCESS_CONTROL_ADMIN'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E0\05D4\05DC\05DF')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139097093328751341)
,p_name=>'ACCESS_CONTROL_USERNAME'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DD \05D4\05DE\05E9\05EA\05DE\05E9')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139159707793751359)
,p_name=>'ACCESS_DENIED_SIMPLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D2\05D9\05E9\05D4 \05E0\05D3\05D7\05EA\05D4')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139116677023751347)
,p_name=>'ACCOUNT_HAS_BEEN_CREATED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05E9\05D1\05D5\05DF %0 \05E9\05DC\05DA \05E0\05D5\05E6\05E8.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139099832910751342)
,p_name=>'ACCOUNT_LOCKED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D7\05E9\05D1\05D5\05DF \05E0\05E2\05D5\05DC.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139084391081751337)
,p_name=>'AM_PM'
,p_message_language=>'he'
,p_message_text=>'AM / PM'
,p_version_scn=>2704861
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139067156302751332)
,p_name=>'APEX.ACTIONS.ACTION_LINK'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D9\05E9\05D5\05E8 \05E4\05E2\05D5\05DC\05D4')
,p_is_js_message=>true
,p_version_scn=>2704858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139067088749751332)
,p_name=>'APEX.ACTIONS.DIALOG_LINK'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D9\05E9\05D5\05E8 \05DC\05EA\05D9\05D1\05EA \05D3\05D5-\05E9\05D9\05D7')
,p_is_js_message=>true
,p_version_scn=>2704858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139231414555751381)
,p_name=>'APEX.ACTIONS.TOGGLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D7\05DC\05E4\05EA \05DE\05E6\05D1 %0')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139239264404751383)
,p_name=>'APEX.ACTIVE_STATE'
,p_message_language=>'he'
,p_message_text=>unistr('(\05E4\05E2\05D9\05DC)')
,p_is_js_message=>true
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139044041359751325)
,p_name=>'APEX.AI.CHAT_CLEARED'
,p_message_language=>'he'
,p_message_text=>unistr('\05E6''\05D0\05D8 \05E0\05D5\05E7\05D4')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139043948665751325)
,p_name=>'APEX.AI.CLEAR_CHAT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05E7\05D4 \05E6''\05D0\05D8')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139040515832751324)
,p_name=>'APEX.AI.CONSENT_ACCEPT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05DB\05DD')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139040676140751324)
,p_name=>'APEX.AI.CONSENT_DENY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05D7\05D4')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139040301408751324)
,p_name=>'APEX.AI.CONVERSATION_HISTORY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D9\05E1\05D8\05D5\05E8\05D9\05D9\05EA \05E9\05D9\05D7\05D4')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139043710706751325)
,p_name=>'APEX.AI.COPIED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05E2\05EA\05E7')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139043835309751325)
,p_name=>'APEX.AI.COPIED_TO_CLIPBOARD'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05E2\05EA\05E7 \05DC\05DC\05D5\05D7 \05D2\05D6\05D9\05E8\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139043579914751325)
,p_name=>'APEX.AI.COPY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E2\05EA\05E7\05D4')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139043670001751325)
,p_name=>'APEX.AI.COPY_TO_CLIPBOARD'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E2\05EA\05E7\05D4 \05DC\05DC\05D5\05D7')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139041049244751324)
,p_name=>'APEX.AI.DIALOG_TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05E9\05E3 \05E1\05D9\05D5\05E2')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139041443068751324)
,p_name=>'APEX.AI.DISABLED'
,p_message_language=>'he'
,p_message_text=>unistr('AI \05D7\05E1\05D5\05DD \05D1\05E8\05DE\05EA \05DE\05E8\05D7\05D1 \05D4\05E2\05D1\05D5\05D3\05D4 \05D0\05D5 \05D4\05DE\05D5\05E4\05E2.')
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139080761716751336)
,p_name=>'APEX.AI.GET_SERVER_ID_OR_STATIC_ID'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05DE\05E6\05D0 \05E9\05D9\05E8\05D5\05EA \05D1\05D9\05E0\05D4 \05DE\05DC\05D0\05DB\05D5\05EA\05D9\05EA \05D2\05E0\05E8\05D8\05D9\05D1\05D9\05EA \05E2\05DD \05DE\05D6\05D4\05D4 \05E0\05EA\05D5\05DF \05D0\05D5 \05DE\05D6\05D4\05D4 \05E1\05D8\05D8\05D9.')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139079448921751336)
,p_name=>'APEX.AI.HTTP_4013_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05EA \05D0\05D9\05DE\05D5\05EA \05D0\05D5 \05D2\05D9\05E9\05D4 \05D0\05E1\05D5\05E8\05D4 (HTTP-%1) \05DC\05DB\05EA\05D5\05D1\05EA \05D4-URL %0. \05D1\05D3\05D5\05E7 \05D0\05EA \05D4\05EA\05E6\05D5\05E8\05D4 \05E9\05DC \05E9\05D9\05E8\05D5\05EA \05D1\05D9\05E0\05D4 \05DE\05DC\05D0\05DB\05D5\05EA\05D9\05EA \05D2\05E0\05E8\05D8\05D9\05D1\05D9\05EA %2.')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139059235196751329)
,p_name=>'APEX.AI.HTTP_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05E7\05E9\05EA \05D4-HTTP \05DC\05E9\05D9\05E8\05D5\05EA \05D1\05D9\05E0\05D4 \05DE\05DC\05D0\05DB\05D5\05EA\05D9\05EA \05D2\05E0\05E8\05D8\05D9\05D1\05D9\05EA \05D1-%0 \05E0\05DB\05E9\05DC\05D4 \05E2\05DD HTTP-%1: %2')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139083673624751337)
,p_name=>'APEX.AI.HTTP_FRIENDLY_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05D1\05E7\05E9\05EA HTTP \05DC\05E9\05D9\05E8\05D5\05EA \05D1\05D9\05E0\05D4 \05DE\05DC\05D0\05DB\05D5\05EA\05D9\05EA \05D2\05E0\05E8\05D8\05D9\05D1\05D9\05EA \05D1\05E9\05D1\05D9\05DC \05D4\05EA\05D5\05E1\05E3 %0 \05D1\05DE\05E6\05D1 %1. \05D1\05D3\05D5\05E7 \05D0\05EA \05D4\05EA\05E6\05D5\05E8\05D4 \05E9\05DC \05E9\05D9\05E8\05D5\05EA \05D1\05D9\05E0\05D4 \05DE\05DC\05D0\05DB\05D5\05EA\05D9\05EA \05D2\05E0\05E8\05D8\05D9\05D1\05D9\05EA.')
,p_version_scn=>2704860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139046404132751326)
,p_name=>'APEX.AI.MAIN_QUICK_ACTIONS_ARIA_LABEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05D5\05D2\05DE\05D0\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139044891152751325)
,p_name=>'APEX.AI.NAME_ASSISTANT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05E9\05E3 \05E1\05D9\05D5\05E2')
,p_is_js_message=>true
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139046220099751325)
,p_name=>'APEX.AI.NAME_COMMA_MESSAGE'
,p_message_language=>'he'
,p_message_text=>'%0,%1'
,p_is_js_message=>true
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139044781977751325)
,p_name=>'APEX.AI.NAME_USER'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05EA\05D4')
,p_is_js_message=>true
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139075407697751334)
,p_name=>'APEX.AI.OCI_CHAT_NOT_SUPPORTED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D9\05E0\05D4 \05DE\05DC\05D0\05DB\05D5\05EA\05D9\05EA \05D2\05E0\05E8\05D8\05D9\05D1\05D9\05EA \05E9\05DC OCI \05D0\05D9\05E0\05D4 \05EA\05D5\05DE\05DB\05EA \05DB\05E8\05D2\05E2 \05D1\05D7\05D5\05D5\05D9\05D9\05EA \05E6''\05D0\05D8 \05E2\05DD \05DE\05E1\05E4\05E8 \05D4\05D5\05D3\05E2\05D5\05EA.')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139055312986751328)
,p_name=>'APEX.AI.PROMPT_ENRICHMENT_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05E2\05D9\05D1\05D5\05D3 \05D4\05DE\05E0\05D7\05D4 %0 \05D1\05E9\05D1\05D9\05DC \05D4\05D9\05D9\05E9\05D5\05DD %1. \05D1\05D3\05D5\05E7 \05D0\05DD App Builder \05D6\05DE\05D9\05DF \05D1\05DE\05D5\05E4\05E2 \05D6\05D4.')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139060484537751330)
,p_name=>'APEX.AI.RESPONSE_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05D9\05EA\05DF \05DC\05E2\05D1\05D3 \05EA\05D2\05D5\05D1\05D4 \05DC\05E9\05D9\05E8\05D5\05EA AI %0, \05EA\05D2\05D5\05D1\05D4 %1')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139066689607751332)
,p_name=>'APEX.AI.SEND_MESSAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DC\05D7 \05D4\05D5\05D3\05E2\05D4')
,p_is_js_message=>true
,p_version_scn=>2704858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139054940469751328)
,p_name=>'APEX.AI.SERVICE_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05E9\05D9\05E8\05D5\05EA AI \05E9\05DC \05DE\05E2\05E8\05DB\05EA \05E2\05D5\05E8\05E4\05D9\05EA %0')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139040746354751324)
,p_name=>'APEX.AI.TEXTAREA_LABEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05D3\05E2\05D4')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139040890029751324)
,p_name=>'APEX.AI.TEXTAREA_PLACEHOLDER'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E7\05DC\05D3 \05D0\05EA \05D4\05D5\05D3\05E2\05EA\05DA \05DB\05D0\05DF')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139044107665751325)
,p_name=>'APEX.AI.USER_AVATAR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05E6\05D2\05DF \05E9\05DC \05DE\05E9\05EA\05DE\05E9')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139044282049751325)
,p_name=>'APEX.AI.USE_THIS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E9\05EA\05DE\05E9 \05D1\05D6\05D4')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139040935732751324)
,p_name=>'APEX.AI.WARN_UNSENT_MESSAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05E9 \05DC\05DA \05D4\05D5\05D3\05E2\05D4 \05E9\05DC\05D0 \05E0\05E9\05DC\05D7\05D4, \05D4\05D0\05DD \05D0\05EA\05D4 \05D1\05D8\05D5\05D7?')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139209915510751374)
,p_name=>'APEX.AJAX_SERVER_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05E8\05D9\05D0\05D4 \05DC-Ajax \05D4\05D7\05D6\05D9\05E8\05D4 \05E9\05D2\05D9\05D0\05EA \05E9\05E8\05EA %0 \05DC-%1.')
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139137051353751353)
,p_name=>'APEX.APPLICATION.ALIAS.NON_UNIQUE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05EA \05DB\05D9\05E0\05D5\05D9 \05D4\05D9\05D9\05E9\05D5\05DD "%0" \05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05D4\05DE\05D9\05E8 \05DC\05DE\05D6\05D4\05D4 \05D9\05D9\05D7\05D5\05D3\05D9 \05E9\05DC \05D9\05D9\05E9\05D5\05DD.')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139125836325751349)
,p_name=>'APEX.APPLICATION.ALIAS.UNHANDLED_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('ERR-1816 \05E9\05D2\05D9\05D0\05D4 \05D1\05DC\05EA\05D9 \05E6\05E4\05D5\05D9\05D4 \05D1\05D4\05DE\05E8\05EA \05DB\05D9\05E0\05D5\05D9 \05D4\05D9\05D9\05E9\05D5\05DD alias p_flow_alias_or_id (%0).')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139223286950751378)
,p_name=>'APEX.APPLICATION.CHECKSUM.DESCRIPTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E8\05DA \05E1\05D9\05DB\05D5\05DD \05D4\05D1\05D9\05E0\05D9\05D9\05DD (checksum) \05E9\05DC \05D4\05D9\05D9\05E9\05D5\05DD \05DE\05E2\05E0\05D9\05E7 \05D3\05E8\05DA \05E7\05DC\05D4 \05DC\05E7\05D1\05D5\05E2 \05D0\05DD \05D0\05D5\05EA\05D5 \05D9\05D9\05E9\05D5\05DD \05E0\05E4\05E8\05E1 \05E2\05DC \05E4\05E0\05D9 \05DE\05E8\05D7\05D1\05D9 \05E2\05D1\05D5\05D3\05D4. \05D0\05EA\05D4 \05D9\05DB\05D5\05DC \05DC\05D4\05E9\05D5\05D5\05EA \05E2\05E8\05DA \05D6\05D4 \05DB\05D3\05D9 \05DC\05E7\05D1\05D5\05E2 \05D0\05DD \05D9\05E9 \05D4\05EA\05D0\05DE\05D4.')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139109817105751345)
,p_name=>'APEX.AUTHENTICATION.AUTH_FUNC.UNHANDLED_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05E2\05D9\05D1\05D5\05D3 \05E4\05D5\05E0\05E7\05E6\05D9\05EA \05D0\05D9\05DE\05D5\05EA \05D6\05D4\05D5\05EA.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139091892507751339)
,p_name=>'APEX.AUTHENTICATION.AUTH_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05E2\05D9\05D1\05D5\05D3 \05E4\05D5\05E0\05E7\05E6\05D9\05EA \05D0\05D9\05DE\05D5\05EA \05D6\05D4\05D5\05EA.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139263755490751390)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.HOST_PREFIX_MISMATCH'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DD \05D4\05D3\05D9\05D9\05E8 %0 \05E9\05D4\05D5\05D7\05D6\05E8 \05E2\05DC \05D9\05D3\05D9 Oracle Cloud Identity Management \05D0\05D9\05E0\05D5 \05DE\05D5\05E8\05E9\05D4 \05DC\05D3\05D5\05DE\05D9\05D9\05DF %1!<br/><a href="&LOGOUT_URL.">\05D4\05EA\05D7\05D1\05E8 \05E9\05D5\05D1</a> \05D5\05E6\05D9\05D9\05DF \05E9\05DD \05E9\05DC \05D3\05D9\05D9\05E8 \05DE\05D5\05E8\05E9\05D4 \05D0\05D5 \05E9\05E0\05D4 \05D0\05EA \05D4-URL \05E9\05DC\05DA.')
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139087951313751338)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.USER_IS_NOT_DEVELOPER'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D7\05E9\05D1\05D5\05E0\05DA "%0" \05D0\05D9\05DF \05D4\05E8\05E9\05D0\05D5\05EA \05D4\05E4\05D9\05EA\05D5\05D7 \05D4\05D3\05E8\05D5\05E9\05D5\05EA (DB_DEVELOPER \05D0\05D5 DB_ADMINISTRATOR)<br/>\05DC\05DE\05E8\05D7\05D1 \05E2\05D1\05D5\05D3\05D4 "%1"! <a href="&LOGOUT_URL.">\05D4\05EA\05D7\05D1\05E8 \05E9\05D5\05D1</a> \05D0\05D7\05E8\05D9 \05E7\05D1\05DC\05EA \05D4\05D4\05E8\05E9\05D0\05D5\05EA.')
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139084547177751337)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.WRONG_GROUP_NAME'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DD \05D4\05D3\05D9\05D9\05E8 \05E9\05D4\05D5\05D7\05D6\05E8 \05E2\05DC \05D9\05D3\05D9 Oracle Cloud Identity Management \05D0\05D9\05E0\05D5 \05DE\05D5\05E8\05E9\05D4 \05DC\05DE\05E8\05D7\05D1 \05D4\05E2\05D1\05D5\05D3\05D4 \05D4\05E0\05D5\05DB\05D7\05D9!<br/><a href="&LOGOUT_URL.">\05D4\05EA\05D7\05D1\05E8 \05E9\05D5\05D1</a> \05D5\05E6\05D9\05D9\05DF \05E9\05DD \05E9\05DC \05D3\05D9\05D9\05E8 \05DE\05D5\05E8\05E9\05D4.')
,p_version_scn=>2704861
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139088091442751338)
,p_name=>'APEX.AUTHENTICATION.HOST_PREFIX_MISMATCH'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E9\05D9\05E7\05D5\05DC\05D9 \05D0\05D1\05D8\05D7\05D4, \05D4\05E8\05E6\05EA \05D9\05D9\05E9\05D5\05DE\05D9\05DD \05E9\05DC \05DE\05E8\05D7\05D1 \05E2\05D1\05D5\05D3\05D4 \05D6\05D4 \05D3\05E8\05DA \05D4\05D3\05D5\05DE\05D9\05D9\05DF \05D1\05DB\05EA\05D5\05D1\05EA \05D4-URL \05D0\05E1\05D5\05E8\05D4.')
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139109541570751345)
,p_name=>'APEX.AUTHENTICATION.LDAP.DBMS_LDAP.ASK_FOR_INSTALLATION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05E7\05E9 \05DE\05D4-DBA (\05DE\05E0\05D4\05DC\05DF \05DE\05E1\05D3 \05E0\05EA\05D5\05E0\05D9\05DD) \05E9\05DC\05DA \05DC\05D4\05E8\05D9\05E5 \05D0\05EA $OH/rdbms/admin/catldap.sql.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139109470970751345)
,p_name=>'APEX.AUTHENTICATION.LDAP.DBMS_LDAP.MISSING'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05DE\05D0\05E8\05D6 SYS.DBMS_LDAP \05DC\05D0 \05E7\05D9\05D9\05DD \05D0\05D5 \05DC\05D0 \05EA\05E7\05E3.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139109376131751345)
,p_name=>'APEX.AUTHENTICATION.LDAP.EDIT_USER_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05E2\05D9\05D1\05D5\05D3 \05E4\05D5\05E0\05E7\05E6\05D9\05EA \05DE\05E9\05EA\05DE\05E9 \05E9\05DC \05E2\05E8\05D9\05DB\05EA LDAP.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139109634807751345)
,p_name=>'APEX.AUTHENTICATION.LDAP.UNHANDLED_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05E2\05D9\05D1\05D5\05D3 \05D0\05D9\05DE\05D5\05EA \05D6\05D4\05D5\05EA \05E9\05DC LDAP.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139110455103751345)
,p_name=>'APEX.AUTHENTICATION.LOGIN.ILLEGAL_PAGE_ARG'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05D0\05E8\05D2\05D5\05DE\05E0\05D8 p_flow_page \05E0\05D5\05D4\05DC login_page.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139110014967751345)
,p_name=>'APEX.AUTHENTICATION.LOGIN.INVALID_ARG'
,p_message_language=>'he'
,p_message_text=>unistr('p_session \05D1\05DC\05EA\05D9 \05EA\05E7\05E3 \05D1-wwv_flow_custom_auth_std.login--p_flow_page:%0 p_session_id:%1.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139161301222751360)
,p_name=>'APEX.AUTHENTICATION.LOGIN.MALFORMED_ARGS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05E8\05D2\05D5\05DE\05E0\05D8 \05D1\05DE\05D1\05E0\05D4 \05E9\05D2\05D5\05D9 \05D0\05DC wwv_flow_custom_auth_std.login--p_flow_page:p_session_id:p_entry_point:%0:%1:%2.')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139110132963751345)
,p_name=>'APEX.AUTHENTICATION.LOGIN.NULL_USER'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DD \05DE\05E9\05EA\05DE\05E9 Null \05D4\05D5\05E2\05D1\05E8 \05DC\05E0\05D5\05D4\05DC \05D4\05D4\05EA\05D7\05D1\05E8\05D5\05EA.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139096955384751341)
,p_name=>'APEX.AUTHENTICATION.LOGIN_THROTTLE.COUNTER'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05DE\05EA\05DF<span id="apex_login_throttle_sec">%0</span> \05E9\05E0\05D9\05D5\05EA \05DC\05E4\05E0\05D9 \05E9\05D0\05EA\05D4 \05DE\05EA\05D7\05D1\05E8 \05E9\05D5\05D1.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139098211516751341)
,p_name=>'APEX.AUTHENTICATION.LOGIN_THROTTLE.ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05D9\05E1\05D9\05D5\05DF \05D4\05D4\05EA\05D7\05D1\05E8\05D5\05EA \05E0\05D7\05E1\05DD.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139159098725751359)
,p_name=>'APEX.AUTHENTICATION.NOT_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05DE\05D5\05EA \05D6\05D4\05D5\05EA "%0" \05DC\05D0 \05E0\05DE\05E6\05D0')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139098790345751341)
,p_name=>'APEX.AUTHENTICATION.NO_SECURITY_GROUP_ID'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D6\05D4\05D4 \05E7\05D1\05D5\05E6\05EA \05D4\05D0\05D1\05D8\05D7\05D4 \05D4\05D5\05D0 null.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139109998196751345)
,p_name=>'APEX.AUTHENTICATION.POST_AUTH_PROC.UNHANDLED_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05D4\05E8\05E6\05EA \05EA\05D4\05DC\05D9\05DA \05D0\05D7\05E8\05D9 \05D0\05D9\05DE\05D5\05EA \05D6\05D4\05D5\05EA.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139109788341751345)
,p_name=>'APEX.AUTHENTICATION.PRE_AUTH_PROC.UNHANDLED_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05E2\05D9\05D1\05D5\05D3 \05EA\05D4\05DC\05D9\05DA \05E7\05D3\05DD-\05D0\05D9\05DE\05D5\05EA \05D6\05D4\05D5\05EA.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139111490227751345)
,p_name=>'APEX.AUTHENTICATION.RESET_PASSWORD.INSTRUCTIONS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05EA\05D7 \05D0\05EA \05DB\05EA\05D5\05D1\05EA \05D4-URL \05D1\05D0\05D5\05EA\05D5 \05D3\05E4\05D3\05E4\05DF \05E9\05D1\05D5 \05D0\05EA\05D7\05DC\05EA \05D0\05EA \05D4\05D1\05E7\05E9\05D4 ''\05D0\05D9\05E4\05D5\05E1 \05E1\05D9\05E1\05DE\05D4''. \05D0\05DD \05D0\05EA\05D4 \05DC\05D5\05D7\05E5 \05E2\05DC \05D4-URL \05E9\05DC \05D0\05D9\05E4\05D5\05E1 \05E1\05D9\05E1\05DE\05D4 \05D5\05D0\05EA\05D4 \05DE\05E0\05D5\05EA\05D1 \05DC\05D3\05E3 \05D4\05D4\05EA\05D7\05D1\05E8\05D5\05EA, \05D0\05EA\05D7\05DC \05E9\05D5\05D1 \05D0\05EA ''\05D0\05D9\05E4\05D5\05E1 \05E1\05D9\05E1\05DE\05D4'' \05D5\05D4\05E9\05D0\05E8 \05D0\05EA \05D4\05D3\05E4\05D3\05E4\05DF \05E4\05EA\05D5\05D7.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139261207637751390)
,p_name=>'APEX.AUTHENTICATION.RESET_PASSWORD_URL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05E4\05E1 \05D0\05EA \05D4-URL \05E9\05DC \05E1\05D9\05E1\05DE\05D4')
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139088248150751338)
,p_name=>'APEX.AUTHENTICATION.RM_GROUP_NOT_GRANTED'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D1\05D5\05E6\05EA \05E6\05E8\05DB\05E0\05D9 \05DE\05E0\05D4\05DC \05D4\05DE\05E9\05D0\05D1\05D9\05DD %0 \05DC\05D0 \05D4\05D5\05E2\05E0\05E7\05D4 \05DC-%1')
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139088392528751338)
,p_name=>'APEX.AUTHENTICATION.RM_INFO_TO_GRANT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E9\05EA\05DE\05E9 \05D1-DBMS_RESOURCE_MANAGER_PRIVS.GRANT_SWITCH_CONSUMER_GROUP \05DB\05D3\05D9 \05DC\05D4\05E2\05E0\05D9\05E7 \05D4\05D4\05E8\05E9\05D0\05D4 \05D4\05D7\05E1\05E8\05D4.')
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139122970418751348)
,p_name=>'APEX.AUTHENTICATION.SESSION_SENTRY_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05E2\05D9\05D1\05D5\05D3 \05E4\05D5\05E0\05E7\05E6\05D9\05EA \05D6\05E7\05D9\05E3 \05E9\05DC \05DE\05D5\05E9\05D1 \05E2\05D1\05D5\05D3\05D4.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139123020095751349)
,p_name=>'APEX.AUTHENTICATION.SESSION_VERIFY_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05E2\05D9\05D1\05D5\05D3 \05E4\05D5\05E0\05E7\05E6\05D9\05EA \05D0\05D9\05DE\05D5\05EA \05E9\05DC \05DE\05D5\05E9\05D1 \05E2\05D1\05D5\05D3\05D4.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139123255343751349)
,p_name=>'APEX.AUTHENTICATION.SSO.ASK_FOR_INSTALLATION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05E7\05E9 \05DE\05DE\05E0\05D4\05DC\05DF %0 \05DC\05D4\05D2\05D3\05D9\05E8 \05D0\05EA \05EA\05E6\05D5\05E8\05EA \05D4\05DE\05E0\05D5\05E2 \05D1\05E9\05D1\05D9\05DC Oracle Application Server Single Sign-On.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139133619257751352)
,p_name=>'APEX.AUTHENTICATION.SSO.BAD_URLC'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05DC\05D0 \05D7\05D5\05E7\05D9 \05D1\05D0\05E1\05D9\05DE\05D5\05DF %1 \05D4\05D5\05D7\05D6\05E8 \05E2\05DC \05D9\05D3\05D9 sso.')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139110381950751345)
,p_name=>'APEX.AUTHENTICATION.SSO.FIX_PARTNER_APP'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E8\05D5\05DA \05D0\05EA \05EA\05D5\05DB\05E0\05D9\05EA \05D0\05D9\05DE\05D5\05EA \05D4\05D6\05D4\05D5\05EA \05D5\05D4\05D5\05E1\05E3 \05D0\05EA \05E9\05DD \05D4\05D9\05D9\05E9\05D5\05DD.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139133343330751352)
,p_name=>'APEX.AUTHENTICATION.SSO.ILLEGAL_CALLER'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D5\05E8\05D0 \05DC\05D0 \05D7\05D5\05E7\05D9 \05E9\05DC \05E4\05E8\05D5\05E6\05D3\05D5\05E8\05D4 %0:')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139133567968751352)
,p_name=>'APEX.AUTHENTICATION.SSO.INVALID_APP_SESSION'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D5\05E9\05D1 \05D9\05D9\05E9\05D5\05DD \05DC\05D0 \05EA\05E7\05E3 \05D1\05D0\05E1\05D9\05DE\05D5\05DF urlc : %0')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139133188345751352)
,p_name=>'APEX.AUTHENTICATION.SSO.MISSING_APP_REGISTRATION'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1-portal_sso_redirect: \05D7\05E1\05E8\05D9\05DD \05E4\05E8\05D8\05D9\05DD \05E2\05DC \05E8\05D9\05E9\05D5\05DD \05D4\05D9\05D9\05E9\05D5\05DD: %0')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139123157821751349)
,p_name=>'APEX.AUTHENTICATION.SSO.PACKAGE_MISSING'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05DE\05D0\05E8\05D6 WWSEC_SSO_ENABLER_PRIVATE \05DC\05D0 \05E7\05D9\05D9\05DD \05D0\05D5 \05DC\05D0 \05EA\05E7\05E3.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139110217934751345)
,p_name=>'APEX.AUTHENTICATION.SSO.PARTNER_APP_IS_NULL'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DD \05D4\05D9\05D9\05E9\05D5\05DD \05E9\05DC \05E9\05D5\05EA\05E3 \05E8\05E9\05D5\05DD \05DC\05D0 \05E0\05DE\05E6\05D0 \05D1\05EA\05D5\05DB\05E0\05D9\05EA \05D0\05D9\05DE\05D5\05EA \05D4\05D6\05D4\05D5\05EA.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139133286732751352)
,p_name=>'APEX.AUTHENTICATION.SSO.REGISTER_APP'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05E9\05D5\05DD \05D9\05D9\05E9\05D5\05DD \05D6\05D4 \05DB\05E4\05D9 \05E9\05DE\05EA\05D5\05D0\05E8 \05D1\05DE\05D3\05E8\05D9\05DA \05D4\05D4\05EA\05E7\05E0\05D4.')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139123336750751349)
,p_name=>'APEX.AUTHENTICATION.SSO.UNHANDLED_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05E2\05D9\05D1\05D5\05D3 \05D0\05D9\05DE\05D5\05EA \05D6\05D4\05D5\05EA \05E9\05DC SSO.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139236663694751382)
,p_name=>'APEX.AUTHENTICATION.UNAUTHORIZED_URL'
,p_message_language=>'he'
,p_message_text=>unistr('URL \05DC\05D0 \05DE\05D5\05E8\05E9\05D4:  %0')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139122732661751348)
,p_name=>'APEX.AUTHENTICATION.UNHANDLED_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05E2\05D9\05D1\05D5\05D3 \05D0\05D9\05DE\05D5\05EA \05D6\05D4\05D5\05EA.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139088118045751338)
,p_name=>'APEX.AUTHENTICATION.WORKSPACE_NOT_ASSIGNED'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E8\05D7\05D1 \05E2\05D1\05D5\05D3\05D4 "%0" \05D0\05D9\05E0\05D5 \05E4\05E2\05D9\05DC. \05E4\05E0\05D4 \05DC\05DE\05E0\05D4\05DC\05DF.')
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139088880821751338)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED'
,p_message_language=>'he'
,p_message_text=>'%0'
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139097999657751341)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED.APPLICATION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D2\05D9\05E9\05D4 \05E0\05D3\05D7\05EA\05D4 \05E2\05DC \05D9\05D3\05D9 \05D1\05D3\05D9\05E7\05EA \05D0\05D1\05D8\05D7\05EA \05D9\05D9\05E9\05D5\05DD')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139098018669751341)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED.PAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D2\05D9\05E9\05D4 \05E0\05D3\05D7\05EA\05D4 \05E2\05DC \05D9\05D3\05D9 \05D1\05D3\05D9\05E7\05EA \05D0\05D1\05D8\05D7\05EA \05D3\05E3')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139098165979751341)
,p_name=>'APEX.AUTHORIZATION.UNHANDLED_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05E2\05D9\05D1\05D5\05D3 \05D4\05E8\05E9\05D0\05D4.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139167259450751362)
,p_name=>'APEX.BUILT_WITH_LOVE_USING_APEX'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05E0\05D5\05D9 \05E2\05DD %0 \05D1\05D0\05DE\05E6\05E2\05D5\05EA %1')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139167301481751362)
,p_name=>'APEX.BUILT_WITH_LOVE_USING_APEX.ACCESSIBLE.LOVE'
,p_message_language=>'he'
,p_message_text=>'Love'
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139227110432751379)
,p_name=>'APEX.CALENDAR.EVENT_DESCRIPTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D9\05D0\05D5\05E8 \05D0\05D9\05E8\05D5\05E2')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139226993887751379)
,p_name=>'APEX.CALENDAR.EVENT_END'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D0\05E8\05D9\05DA \05E1\05D9\05D5\05DD')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139227228863751379)
,p_name=>'APEX.CALENDAR.EVENT_ID'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D6\05D4\05D4 \05D0\05D9\05E8\05D5\05E2')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139226823494751379)
,p_name=>'APEX.CALENDAR.EVENT_START'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D0\05E8\05D9\05DA \05D4\05EA\05D7\05DC\05D4')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139227013184751379)
,p_name=>'APEX.CALENDAR.EVENT_TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D5\05EA\05E8\05EA \05D0\05D9\05E8\05D5\05E2')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139069637028751333)
,p_name=>'APEX.CARD'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05E8\05D8\05D9\05E1')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139069887671751333)
,p_name=>'APEX.CARD.CARD_ACTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05E2\05D5\05DC\05EA \05DB\05E8\05D8\05D9\05E1')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139110558471751345)
,p_name=>'APEX.CHECKBOX.VISUALLY_HIDDEN_CHECKBOX'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D9\05D1\05EA \05EA\05D9\05D5\05D2 \05E0\05E1\05EA\05E8\05EA \05DE\05D4\05E2\05D9\05DF')
,p_is_js_message=>true
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139112467126751345)
,p_name=>'APEX.CHECKSUM.CONTENT_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05EA\05D5\05DB\05DF \05E2\05E8\05DA \05E1\05D9\05DB\05D5\05DD \05D4\05D1\05D9\05E7\05D5\05E8\05EA (Checksum)')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139112304968751345)
,p_name=>'APEX.CHECKSUM.FORMAT_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05E4\05D5\05E8\05DE\05D8 \05E2\05E8\05DA \05E1\05D9\05DB\05D5\05DD \05D4\05D1\05D9\05E7\05D5\05E8\05EA (Checksum)')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139182273478751366)
,p_name=>'APEX.CLIPBOARD.COPIED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05E2\05EA\05E7 \05DC\05DC\05D5\05D7 \05D2\05D6\05D9\05E8\05D9\05DD.')
,p_is_js_message=>true
,p_version_scn=>2704879
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139181774062751366)
,p_name=>'APEX.CLIPBOARD.NOTSUP'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05E4\05D3\05E4\05DF \05D6\05D4 \05D0\05D9\05E0\05D5 \05EA\05D5\05DE\05DA \05D1\05D4\05E2\05EA\05E7\05D4 \05DE\05DC\05D7\05E6\05DF \05D0\05D5 \05EA\05E4\05E8\05D9\05D8. \05E0\05E1\05D4 Ctrl+C or \05E4\05E7\05D5\05D3\05D4+C.')
,p_version_scn=>2704878
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139167973199751362)
,p_name=>'APEX.CLOSE_NOTIFICATION'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D2\05D5\05E8')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139046342474751325)
,p_name=>'APEX.CODE_EDITOR.MAXIMUM_LENGTH_EXCEEDED'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D5\05DB\05DF \05E9\05DC \05E2\05D5\05E8\05DA \05E7\05D5\05D3\05D9\05DD \05D7\05D5\05E8\05D2 \05DE\05D4\05D0\05D5\05E8\05DA \05D4\05DE\05E8\05D1\05D9 \05E9\05DC \05D4\05E4\05E8\05D9\05D8 (\05D1\05E4\05D5\05E2\05DC %0, \05DE\05D5\05EA\05E8 %1 \05EA\05D5\05D5\05D9\05DD)')
,p_is_js_message=>true
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139226475982751379)
,p_name=>'APEX.COLOR_PICKER.CONTRAST'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05D9\05D2\05D5\05D3\05D9\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139220904204751378)
,p_name=>'APEX.COLOR_PICKER.CURRENT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05D5\05DB\05D7\05D9')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139220897002751378)
,p_name=>'APEX.COLOR_PICKER.INITIAL'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05D0\05E9\05D5\05E0\05D9')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139225014054751379)
,p_name=>'APEX.COLOR_PICKER.INVALID_COLOR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E2\05E8\05DA \05E9\05DC #LABEL# \05D7\05D9\05D9\05D1 \05DC\05D4\05D9\05D5\05EA \05E6\05D1\05E2 \05EA\05E7\05E3. \05DC\05D3\05D5\05D2\05DE\05D4: %0')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139087426964751338)
,p_name=>'APEX.COLOR_PICKER.MORE_PRESET_COLORS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E6\05D1\05E2\05D9\05DD \05E0\05D5\05E1\05E4\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139087510968751338)
,p_name=>'APEX.COLOR_PICKER.OPEN'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05EA\05D9\05D7\05EA \05D1\05D5\05E8\05E8 \05E6\05D1\05E2\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139044639444751325)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.ALPHA_SLIDER'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D7\05D5\05D5\05DF \05D0\05D5\05E4\05E7\05D9 \05DC\05DE\05D7\05D5\05D5\05DF \05D0\05DC\05E4\05D0. \05D4\05E9\05EA\05DE\05E9 \05D1\05DE\05E7\05E9\05D9 \05D4\05D7\05E6\05D9\05DD \05DB\05D3\05D9 \05DC\05E0\05D5\05D5\05D8.')
,p_is_js_message=>true
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139044329831751325)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.COLOR_SPECTRUM'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D7\05D5\05D5\05DF \05E9\05DC \05D0\05E8\05D1\05E2\05D4 \05E6\05D3\05D3\05D9\05DD \05DC\05E1\05E4\05E7\05D8\05E8\05D5\05DD \05E6\05D1\05E2\05D9\05DD. \05D4\05E9\05EA\05DE\05E9 \05D1\05DE\05E7\05E9\05D9 \05D4\05D7\05E6\05D9\05DD \05DB\05D3\05D9 \05DC\05E0\05D5\05D5\05D8.')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139044431733751325)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.HUE_SLIDER'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D7\05D5\05D5\05DF \05D0\05E0\05DB\05D9 \05DC\05DE\05D7\05D5\05D5\05DF \05D4\05D2\05D5\05D5\05E0\05D9\05DD. \05D4\05E9\05EA\05DE\05E9 \05D1\05DE\05E7\05E9\05D9 \05D4\05D7\05E6\05D9\05DD \05DB\05D3\05D9 \05DC\05E0\05D5\05D5\05D8.')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139220753742751378)
,p_name=>'APEX.COLOR_PICKER.TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05E8 \05E6\05D1\05E2')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139221013195751378)
,p_name=>'APEX.COLOR_PICKER.TOGGLE_TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D9\05E0\05D5\05D9 \05E4\05D5\05E8\05DE\05D8 \05E6\05D1\05E2')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139258939214751389)
,p_name=>'APEX.COMBOBOX.LIST_OF_VALUES'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05E9\05D9\05DE\05EA \05E2\05E8\05DB\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139259001376751389)
,p_name=>'APEX.COMBOBOX.SHOW_ALL_VALUES'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05EA\05D7 \05E8\05E9\05D9\05DE\05D4 \05D1\05E9\05D1\05D9\05DC: %0')
,p_is_js_message=>true
,p_version_scn=>2704896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139239334483751383)
,p_name=>'APEX.COMPLETED_STATE'
,p_message_language=>'he'
,p_message_text=>unistr('(\05D4\05D5\05E9\05DC\05DD)')
,p_is_js_message=>true
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139128211404751350)
,p_name=>'APEX.CONTACT_ADMIN'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05E0\05D4 \05DC\05DE\05E0\05D4\05DC\05DF \05D4\05D9\05D9\05E9\05D5\05DD.')
,p_version_scn=>2704869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139143755140751355)
,p_name=>'APEX.CONTACT_ADMIN.DEBUG'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\05E4\05E0\05D4 \05DC\05DE\05E0\05D4\05DC\05DF \05D4\05D9\05D9\05E9\05D5\05DD.'),
unistr(' \05E4\05E8\05D8\05D9\05DD \05E2\05DC \05EA\05E7\05E8\05D9\05EA \05D6\05D5 \05D6\05DE\05D9\05E0\05D9\05DD \05D3\05E8\05DA \05DE\05D6\05D4\05D4 \05E0\05D9\05E4\05D5\05D9 \05D1\05D0\05D2\05D9\05DD "%0".')))
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139225379540751379)
,p_name=>'APEX.CORRECT_ERRORS'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05E7\05DF \05E9\05D2\05D9\05D0\05D5\05EA \05DC\05E4\05E0\05D9 \05D4\05E9\05DE\05D9\05E8\05D4.')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139070657978751333)
,p_name=>'APEX.CS.ACTIVE_VALUE_CHIP'
,p_message_language=>'he'
,p_message_text=>unistr('%0. \05D4\05E7\05E9 \05E2\05DC Backspace \05DB\05D3\05D9 \05DC\05DE\05D7\05D5\05E7.')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139168803883751362)
,p_name=>'APEX.CS.MATCHES_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D4\05EA\05D0\05DE\05D5\05EA \05E0\05DE\05E6\05D0\05D5')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139050756294751327)
,p_name=>'APEX.CS.MATCH_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('1 \05E0\05DE\05E6\05D0\05D4 \05D4\05EA\05D0\05DE\05D4')
,p_is_js_message=>true
,p_version_scn=>2704854
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139168798471751362)
,p_name=>'APEX.CS.NO_MATCHES'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05DE\05E6\05D0\05D5 \05D4\05EA\05D0\05DE\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139045109767751325)
,p_name=>'APEX.CS.OTHERS_GROUP'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D7\05E8\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139045047846751325)
,p_name=>'APEX.CS.SELECTED_VALUES_COUNTER'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05E2\05E8\05DB\05D9\05DD \05E0\05D1\05D7\05E8\05D5')
,p_is_js_message=>true
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139239817216751383)
,p_name=>'APEX.CURRENT_PROGRESS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05EA\05E7\05D3\05DE\05D5\05EA \05E0\05D5\05DB\05D7\05D9\05EA')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139225754055751379)
,p_name=>'APEX.DATA.LOAD.FILE_DOES_NOT_EXIST'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E7\05D5\05D1\05E5 \05D4\05DE\05E6\05D5\05D9\05DF \05D1\05E4\05E8\05D9\05D8 %0 \05DC\05D0 \05E7\05D9\05D9\05DD \05D1-APEX_APPLICATION_TEMP_FILES.')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139214230477751376)
,p_name=>'APEX.DATA_HAS_CHANGED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D2\05E8\05E1\05D4 \05D4\05E0\05D5\05DB\05D7\05D9\05EA \05E9\05DC \05E0\05EA\05D5\05E0\05D9\05DD \05D1\05DE\05E1\05D3 \05D4\05E0\05EA\05D5\05E0\05D9\05DD \05D4\05E9\05EA\05E0\05EA\05D4 \05DE\05D0\05D6 \05E9\05D4\05DE\05E9\05EA\05DE\05E9 \05D0\05EA\05D7\05DC \05EA\05D4\05DC\05D9\05DA \05E2\05D3\05DB\05D5\05DF.')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139183359516751366)
,p_name=>'APEX.DATA_LOAD.DO_NOT_LOAD'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05DF \05DC\05D8\05E2\05D5\05DF')
,p_version_scn=>2704879
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139229674001751380)
,p_name=>'APEX.DATA_LOAD.FAILED'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05EA \05E7\05D3\05DD-\05E2\05D9\05D1\05D5\05D3')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139229498649751380)
,p_name=>'APEX.DATA_LOAD.INSERT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05E1\05E3 \05E9\05D5\05E8\05D4')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139243020053751384)
,p_name=>'APEX.DATA_LOAD.SEQUENCE_ACTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05E6\05E3: \05E4\05E2\05D5\05DC\05D4')
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139229582291751380)
,p_name=>'APEX.DATA_LOAD.UPDATE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D3\05DB\05DF \05E9\05D5\05E8\05D4')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139058084762751329)
,p_name=>'APEX.DATEPICKER.ACTIONS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05E2\05D5\05DC\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139085633905751337)
,p_name=>'APEX.DATEPICKER.AM_PM'
,p_message_language=>'he'
,p_message_text=>'AM/PM'
,p_is_js_message=>true
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139071793516751333)
,p_name=>'APEX.DATEPICKER.BOUNDARY_ITEM_FORMAT_INVALID'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D7\05D9\05D9\05D1 \05DC\05D4\05D9\05D5\05EA \05D1\05D5\05E8\05E8 \05EA\05D0\05E8\05D9\05DB\05D9\05DD \05D0\05D5 \05EA\05D0\05E8\05D9\05DA \05EA\05E7\05E3, \05DC\05D3\05D5\05D2\05DE\05D4 %1.')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139180929197751366)
,p_name=>'APEX.DATEPICKER.CLEAR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05E7\05D4')
,p_is_js_message=>true
,p_version_scn=>2704878
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139089154073751338)
,p_name=>'APEX.DATEPICKER.DONE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D9\05D5\05DD')
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139100198877751342)
,p_name=>'APEX.DATEPICKER.FORMAT_NOT_SUPPORTED'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05DB\05D5\05DC\05DC \05D7\05DC\05E7\05D9\05DD \05E9\05D0\05D9\05E0\05DD \05E0\05EA\05DE\05DB\05D9\05DD \05D1\05DE\05E1\05DB\05EA \05D4\05EA\05D1\05E0\05D9\05EA: %1')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139085359580751337)
,p_name=>'APEX.DATEPICKER.HOUR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05E2\05D4')
,p_is_js_message=>true
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139169260759751362)
,p_name=>'APEX.DATEPICKER.ICON_TEXT'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D5\05D7 \05E9\05E0\05D4 \05E6\05E5: %0')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139085120509751337)
,p_name=>'APEX.DATEPICKER.ISO_WEEK'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D1\05D5\05E2')
,p_is_js_message=>true
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139085289660751337)
,p_name=>'APEX.DATEPICKER.ISO_WEEK_ABBR'
,p_message_language=>'he'
,p_message_text=>'WK'
,p_is_js_message=>true
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139085538679751337)
,p_name=>'APEX.DATEPICKER.MINUTES'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05E7\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139085748727751337)
,p_name=>'APEX.DATEPICKER.MONTH'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D5\05D3\05E9')
,p_is_js_message=>true
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139086198830751338)
,p_name=>'APEX.DATEPICKER.NEXT_MONTH'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D7\05D5\05D3\05E9 \05D4\05D1\05D0')
,p_is_js_message=>true
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139055787961751328)
,p_name=>'APEX.DATEPICKER.POPUP'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05DC\05D5\05DF \05E6\05E5 \05D1\05E9\05D1\05D9\05DC %0')
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139086083979751338)
,p_name=>'APEX.DATEPICKER.PREVIOUS_MONTH'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D7\05D5\05D3\05E9 \05D4\05E7\05D5\05D3\05DD')
,p_is_js_message=>true
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139178555686751365)
,p_name=>'APEX.DATEPICKER.READONLY_DATEPICKER'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D5\05E8\05E8 \05EA\05D0\05E8\05D9\05DB\05D9\05DD \05DC\05E7\05E8\05D9\05D0\05D4 \05D1\05DC\05D1\05D3')
,p_version_scn=>2704877
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139086955531751338)
,p_name=>'APEX.DATEPICKER.SELECT_DATE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05E8 \05EA\05D0\05E8\05D9\05DA')
,p_is_js_message=>true
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139055827464751328)
,p_name=>'APEX.DATEPICKER.SELECT_DATE_AND_TIME'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05E8 \05EA\05D0\05E8\05D9\05DA \05D5\05E9\05E2\05D4')
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139053079417751327)
,p_name=>'APEX.DATEPICKER.SELECT_DAY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05E8 \05D9\05D5\05DD')
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139056437492751328)
,p_name=>'APEX.DATEPICKER.SELECT_MONTH_AND_YEAR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05E8 \05D7\05D5\05D3\05E9 \05D5\05E9\05E0\05D4')
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139053282380751328)
,p_name=>'APEX.DATEPICKER.SELECT_TIME'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05E8 \05E9\05E2\05D4')
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139053735220751328)
,p_name=>'APEX.DATEPICKER.TODAY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D9\05D5\05DD')
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139071381226751333)
,p_name=>'APEX.DATEPICKER.VALUE_INVALID'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E2\05E8\05DA \05E9\05DC #LABEL# \05D7\05D9\05D9\05D1 \05DC\05D4\05D9\05D5\05EA \05EA\05D0\05E8\05D9\05DA \05EA\05E7\05E3. \05DC\05D3\05D5\05D2\05DE\05D4: %0')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139071042806751333)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_BETWEEN'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E2\05E8\05DA \05E9\05DC #LABEL# \05D7\05D9\05D9\05D1 \05DC\05D4\05D9\05D5\05EA \05D1\05D9\05DF %0 \05DC\05D1\05D9\05DF %1.')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139071165349751333)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_ON_OR_AFTER'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E2\05E8\05DA \05E9\05DC #LABEL# \05D7\05D9\05D9\05D1 \05DC\05D4\05D9\05D5\05EA \05D1-%0 \05D0\05D5 \05D0\05D7\05E8\05D9\05D5.')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139071287317751333)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_ON_OR_BEFORE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E2\05E8\05DA \05E9\05DC #LABEL# \05D7\05D9\05D9\05D1 \05DC\05D4\05D9\05D5\05EA \05D1-%0 \05D0\05D5 \05DC\05E4\05E0\05D9\05D5.')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139062624177751331)
,p_name=>'APEX.DATEPICKER.VISUALLY_HIDDEN_EDIT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E8\05D9\05DB\05D4 \05E0\05E1\05EA\05E8\05EA \05DE\05D4\05E2\05D9\05DF')
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139085934618751338)
,p_name=>'APEX.DATEPICKER.YEAR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05E0\05D4')
,p_is_js_message=>true
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139172953732751363)
,p_name=>'APEX.DATEPICKER_VALUE_GREATER_MAX_DATE'
,p_message_language=>'he'
,p_message_text=>unistr('#LABEL# \05DE\05D0\05D5\05D7\05E8 \05DE\05D4\05EA\05D0\05E8\05D9\05DA \05D4\05DE\05E8\05D1\05D9 \05D4\05DE\05E6\05D5\05D9\05DF %0.')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139173392576751363)
,p_name=>'APEX.DATEPICKER_VALUE_INVALID'
,p_message_language=>'he'
,p_message_text=>unistr('#LABEL# \05DC\05D0 \05DE\05EA\05D0\05D9\05DD \05DC\05E4\05D5\05E8\05DE\05D8 %0.')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139172856449751363)
,p_name=>'APEX.DATEPICKER_VALUE_LESS_MIN_DATE'
,p_message_language=>'he'
,p_message_text=>unistr('#LABEL# \05DE\05D5\05E7\05D3\05DD \05DE\05D4\05EA\05D0\05E8\05D9\05DA \05D4\05DE\05D6\05E2\05E8\05D9 \05D4\05DE\05E6\05D5\05D9\05DF %0.')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139173041878751363)
,p_name=>'APEX.DATEPICKER_VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'he'
,p_message_text=>unistr('#LABEL# \05D0\05D9\05E0\05D5 \05D1\05D8\05D5\05D5\05D7 \05D4\05EA\05E7\05E3 \05E9\05DC %0 \05E2\05D3 %1.')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139173297631751363)
,p_name=>'APEX.DATEPICKER_VALUE_NOT_IN_YEAR_RANGE'
,p_message_language=>'he'
,p_message_text=>unistr('#LABEL# \05D0\05D9\05E0\05D5 \05D1\05EA\05D5\05DA \05D8\05D5\05D5\05D7 \05D4\05E9\05E0\05D9\05DD \05D4\05EA\05E7\05E3 \05E9\05DC %0 \05D5-%1.')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139065054660751331)
,p_name=>'APEX.DBMS_CLOUD_INT.DBMS_CLOUD_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E8\05E2\05D4 \05E9\05D2\05D9\05D0\05D4 \05E4\05E0\05D9\05DE\05D9\05EA \05D1\05DE\05D4\05DC\05DA \05E2\05D9\05D1\05D5\05D3 \05D1\05E7\05E9\05EA \05D4-DBMS_CLOUD.')
,p_version_scn=>2704857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139225626377751379)
,p_name=>'APEX.DIALOG.CANCEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D8\05DC')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139251515018751387)
,p_name=>'APEX.DIALOG.CLOSE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D2\05D5\05E8')
,p_is_js_message=>true
,p_version_scn=>2704893
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139112783924751346)
,p_name=>'APEX.DIALOG.CONFIRMATION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E9\05D5\05E8')
,p_is_js_message=>true
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139253512859751387)
,p_name=>'APEX.DIALOG.HELP'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D6\05E8\05D4')
,p_is_js_message=>true
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139225427148751379)
,p_name=>'APEX.DIALOG.OK'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D5\05E7\05D9\05D9')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139225592074751379)
,p_name=>'APEX.DIALOG.SAVE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DE\05D5\05E8')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139093205311751340)
,p_name=>'APEX.DIALOG.TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D5\05EA\05E8\05EA \05D4\05D3\05D5-\05E9\05D9\05D7')
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139132974906751351)
,p_name=>'APEX.DIALOG.VISUALLY_HIDDEN_TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D5\05EA\05E8\05EA \05EA\05D9\05D1\05EA \05D3\05D5-\05E9\05D9\05D7 \05E0\05E1\05EA\05E8\05EA \05DE\05D4\05E2\05D9\05DF')
,p_is_js_message=>true
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139054002737751328)
,p_name=>'APEX.DOCGEN'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05D5\05E0\05E7\05E6\05D9\05D4 \05D1\05E0\05D5\05D9\05D4 \05DE\05E8\05D0\05E9 \05E9\05DC Oracle Document Generator:')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139064839185751331)
,p_name=>'APEX.DOCGEN.DBMS_CLOUD_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05DE\05D4\05DC\05DA \05D4\05D3\05E4\05E1\05EA \05DE\05E1\05DE\05DA.')
,p_version_scn=>2704857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139042026899751324)
,p_name=>'APEX.DOCGEN.INVALID_OUTPUT_TYPE'
,p_message_language=>'he'
,p_message_text=>unistr('%s \05D0\05D9\05E0\05D5 \05EA\05D5\05DE\05DA \05D1-%1 \05DB\05E4\05DC\05D8.')
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139053983827751328)
,p_name=>'APEX.DOCGEN.INVOKE_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 "%0" \05D1\05D4\05E4\05E2\05DC\05EA \05E4\05D5\05E0\05E7\05E6\05D9\05D4 \05D1\05E0\05D5\05D9\05D4 \05DE\05E8\05D0\05E9 \05E9\05DC Oracle Document Generator:')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139045467941751325)
,p_name=>'APEX.DOCGEN.TEMPLATE_REQUIRED'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05D3\05E8\05E9\05EA \05EA\05D1\05E0\05D9\05EA.')
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139070859875751333)
,p_name=>'APEX.DOWNLOAD.ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05DE\05D4\05DC\05DA \05D4\05D5\05E8\05D3\05EA \05D4\05E7\05D5\05D1\05E5.')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139070771670751333)
,p_name=>'APEX.DOWNLOAD.NO_DATA_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05DE\05E6\05D0\05D5 \05E0\05EA\05D5\05E0\05D9\05DD \05E0\05D9\05EA\05E0\05D9\05DD \05DC\05D4\05D5\05E8\05D3\05D4.')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139074316159751334)
,p_name=>'APEX.ENVIRONMENT.RUNTIME_ONLY'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D0\05E4\05D9\05D9\05DF \05D6\05D4 \05D0\05D9\05E0\05D5 \05D6\05DE\05D9\05DF \05D1\05E1\05D1\05D9\05D1\05EA \05D6\05DE\05DF \05E8\05D9\05E6\05D4 \05D1\05DC\05D1\05D3.')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139127115236751350)
,p_name=>'APEX.ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4')
,p_is_js_message=>true
,p_version_scn=>2704869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139087090685751338)
,p_name=>'APEX.ERROR.CALLBACK_FAILED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E9\05D2\05D9\05D0\05D4 \05D4\05D1\05D0\05D4 \05D0\05D9\05E8\05E2\05D4 \05D1\05D6\05DE\05DF \05D4\05E8\05E6\05EA \05D4\05E4\05E0\05D9\05D9\05D4 \05D4\05D7\05D5\05D6\05E8\05EA \05DC\05D8\05D9\05E4\05D5\05DC \05D1\05E9\05D2\05D9\05D0\05D5\05EA. %0')
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139099650099751342)
,p_name=>'APEX.ERROR.ERROR_PAGE.UNHANDLED_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E8\05E2\05D4 \05E9\05D2\05D9\05D0\05D4 \05D1\05D6\05DE\05DF \05E6\05D1\05D9\05E2\05EA \05D3\05E3 \05D4\05E9\05D2\05D9\05D0\05D5\05EA: %0')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139088747226751338)
,p_name=>'APEX.ERROR.INTERNAL'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05E4\05E0\05D9\05DE\05D9\05EA')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139238430935751383)
,p_name=>'APEX.ERROR.INTERNAL.CONTACT_ADMINISTRATOR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05E0\05D4 \05DC\05DE\05E0\05D4\05DC\05DF \05E9\05DC\05DA. \05E4\05E8\05D8\05D9\05DD \05E2\05DC \05EA\05E7\05E8\05D9\05EA \05D6\05D5 \05D6\05DE\05D9\05E0\05D9\05DD \05D3\05E8\05DA \05DE\05D6\05D4\05D4 \05E0\05D9\05E4\05D5\05D9 \05D1\05D0\05D2\05D9\05DD "%0".')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139233019502751381)
,p_name=>'APEX.ERROR.ORA-16000'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E1\05D3 \05D4\05E0\05EA\05D5\05E0\05D9\05DD \05E4\05EA\05D5\05D7 \05DC\05D2\05D9\05E9\05EA \05E7\05E8\05D9\05D0\05D4 \05D1\05DC\05D1\05D3')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139263102918751390)
,p_name=>'APEX.ERROR.ORA-28353'
,p_message_language=>'he'
,p_message_text=>unistr('ORA-28353: \05E4\05EA\05D9\05D7\05EA \05D4\05D0\05E8\05E0\05E7 \05E0\05DB\05E9\05DC\05D4. \05DC\05D0 \05E0\05D9\05EA\05DF \05DC\05D2\05E9\05EA \05DB\05E8\05D2\05E2 \05DC\05E0\05EA\05D5\05E0\05D9 \05D4\05D9\05D9\05E9\05D5\05DD.')
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139233183674751381)
,p_name=>'APEX.ERROR.PAGE_NOT_AVAILABLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05E3 \05D6\05D4 \05D0\05D9\05E0\05D5 \05D6\05DE\05D9\05DF.')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139091704117751339)
,p_name=>'APEX.ERROR.TECHNICAL_INFO'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D9\05D3\05E2 \05D8\05DB\05E0\05D9 (\05D6\05DE\05D9\05DF \05DC\05DE\05E4\05EA\05D7\05D9\05DD \05D1\05DC\05D1\05D3)')
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139197690596751371)
,p_name=>'APEX.ERROR_MESSAGE_HEADING'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05D3\05E2\05EA \05E9\05D2\05D9\05D0\05D4')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139211581136751375)
,p_name=>'APEX.EXPECTED_FORMAT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05D5\05E8\05DE\05D8 \05E6\05E4\05D5\05D9: %0')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139176482051751364)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.ALREADY_IN_ACL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05DE\05E9\05EA\05DE\05E9 \05DB\05D1\05E8 \05E0\05DE\05E6\05D0 \05D1\05E8\05E9\05D9\05DE\05EA \05D1\05E7\05E8\05EA \05D2\05D9\05E9\05D4')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139176357645751364)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.CREATE_CONFIRM'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05E9 \05DC\05D0\05E9\05E8 \05D4\05D5\05E1\05E4\05EA %0 \05D4\05DE\05E9\05EA\05DE\05E9\05D9\05DD \05D4\05D1\05D0\05D9\05DD \05DC\05E8\05E9\05D9\05DE\05EA \05D1\05E7\05E8\05EA \05D4\05D2\05D9\05E9\05D4 <strong>%1</strong>.')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139176852220751364)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.DUPLICATE_USER'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D9\05D9\05DD \05DE\05E9\05EA\05DE\05E9 \05DB\05E4\05D5\05DC')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139176599907751364)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.MISSING_AT_SIGN'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05E1\05E8\05D4 \05DB\05E8\05D5\05DB\05D9\05EA (@) \05D1\05DB\05EA\05D5\05D1\05EA \05D4\05D3\05D5\05D0"\05DC')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139176698567751364)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.MISSING_DOT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05E1\05E8\05D4 \05E0\05E7\05D5\05D3\05D4 (.) \05D1\05DB\05EA\05D5\05D1\05EA \05D4\05D3\05D5\05D0"\05DC')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139176794819751364)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.USERNAME_TOO_LONG'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DD \05D4\05DE\05E9\05EA\05DE\05E9 \05D0\05E8\05D5\05DA \05DE\05D3\05D9')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139177003977751365)
,p_name=>'APEX.FEATURE.ACL.INFO.ACL_ONLY'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05E7 \05DE\05E9\05EA\05DE\05E9\05D9\05DD \05E9\05D4\05D5\05D2\05D3\05E8\05D5 \05D1\05E8\05E9\05D9\05DE\05EA \05D1\05E7\05E8\05EA \05D4\05D2\05D9\05E9\05D4 \05E9\05DC \05D4\05D9\05D9\05E9\05D5\05DD, \05D9\05DB\05D5\05DC\05D9\05DD \05DC\05D2\05E9\05EA \05DC\05D9\05D9\05E9\05D5\05DD \05D6\05D4')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139177143319751365)
,p_name=>'APEX.FEATURE.ACL.INFO.ACL_VALUE_INVALID'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E8\05DA \05D4\05D2\05D3\05E8\05EA \05D1\05E7\05E8\05EA \05D2\05D9\05E9\05D4 \05DC\05D0 \05E6\05E4\05D5\05D9: %0')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139176979360751365)
,p_name=>'APEX.FEATURE.ACL.INFO.ALL_USERS'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05DC \05D4\05DE\05E9\05EA\05DE\05E9\05D9\05DD \05E9\05D0\05D5\05DE\05EA\05D5 \05D9\05DB\05D5\05DC\05D9\05DD \05DC\05D2\05E9\05EA \05DC\05D9\05D9\05E9\05D5\05DD \05D6\05D4')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139221437823751378)
,p_name=>'APEX.FEATURE.CONFIG.DISABLED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05E1\05D5\05DD')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139221306866751378)
,p_name=>'APEX.FEATURE.CONFIG.ENABLED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05E4\05E9\05E8\05D9')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139221635622751378)
,p_name=>'APEX.FEATURE.CONFIG.IS_DISABLED'
,p_message_language=>'he'
,p_message_text=>unistr('%0: \05D7\05E1\05D5\05DD')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139221592756751378)
,p_name=>'APEX.FEATURE.CONFIG.IS_ENABLED'
,p_message_language=>'he'
,p_message_text=>unistr('%0: \05D0\05E4\05E9\05E8\05D9')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139070153363751333)
,p_name=>'APEX.FEATURE.CONFIG.NOT_SUPPORTED'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05EA\05DE\05DA')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139131333486751351)
,p_name=>'APEX.FEATURE.CONFIG.OFF'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D1\05D5\05D9')
,p_is_js_message=>true
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139131251621751351)
,p_name=>'APEX.FEATURE.CONFIG.ON'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D5\05E4\05E2\05DC')
,p_is_js_message=>true
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139221286481751378)
,p_name=>'APEX.FEATURE.TOP_USERS.USERNAME.NOT_IDENTIFIED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E0\05D5 \05DE\05D6\05D5\05D4\05D4')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139061764976751330)
,p_name=>'APEX.FILESIZE.BYTES'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D1\05D9\05D9\05D8\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139062255228751330)
,p_name=>'APEX.FILESIZE.GB'
,p_message_language=>'he'
,p_message_text=>'%0 GB'
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139061997263751330)
,p_name=>'APEX.FILESIZE.KB'
,p_message_language=>'he'
,p_message_text=>'%0 KB'
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139062123529751330)
,p_name=>'APEX.FILESIZE.MB'
,p_message_language=>'he'
,p_message_text=>'%0 MB'
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139214446030751376)
,p_name=>'APEX.FILE_BROWSE.DOWNLOAD_LINK_TEXT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05E8\05D3')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139067527362751332)
,p_name=>'APEX.FS.ACTIONS_MENU_BUTTON_LABEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05E4\05E9\05E8\05D5\05D9\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139067291875751332)
,p_name=>'APEX.FS.ACTIONS_MENU_FILTER'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05E0\05DF')
,p_is_js_message=>true
,p_version_scn=>2704858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139067427750751332)
,p_name=>'APEX.FS.ACTIONS_MENU_HIDE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05EA\05E8 \05D4\05D9\05D1\05D8')
,p_is_js_message=>true
,p_version_scn=>2704858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139092147746751339)
,p_name=>'APEX.FS.ADD_FILTER'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05E1\05E3 \05DE\05E1\05E0\05DF')
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139168414994751362)
,p_name=>'APEX.FS.APPLIED_FACET'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E1\05E0\05DF \05E9\05D4\05D5\05D7\05DC %0')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139092854683751340)
,p_name=>'APEX.FS.APPLY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D7\05DC')
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139212048881751375)
,p_name=>'APEX.FS.BATCH_APPLY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D7\05DC')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139092910115751340)
,p_name=>'APEX.FS.CANCEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D8\05DC')
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139076714801751335)
,p_name=>'APEX.FS.CHART_BAR'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05E8\05E9\05D9\05DD \05DE\05D5\05D8\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139224795738751379)
,p_name=>'APEX.FS.CHART_OTHERS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D7\05E8\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139076801321751335)
,p_name=>'APEX.FS.CHART_PIE'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05E8\05E9\05D9\05DD \05E2\05D5\05D2\05D4')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139223393247751378)
,p_name=>'APEX.FS.CHART_TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05E8\05E9\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139076567783751335)
,p_name=>'APEX.FS.CHART_VALUE_LABEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05E4\05D9\05E8\05D4')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139212574787751375)
,p_name=>'APEX.FS.CLEAR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05E7\05D4')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139212696157751375)
,p_name=>'APEX.FS.CLEAR_ALL'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05E7\05D4 \05D4\05DB\05DC')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139212752383751375)
,p_name=>'APEX.FS.CLEAR_VALUE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05E7\05D4 \05D0\05EA %0')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139229226421751380)
,p_name=>'APEX.FS.COLUMN_UNAUTHORIZED'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DE\05D5\05D3\05D4 %1, \05E9\05D0\05DC\05D9\05D4 \05DE\05E4\05E0\05D4 \05D4\05D9\05D1\05D8 %0, \05D0\05D9\05E0\05D4 \05D6\05DE\05D9\05E0\05D4 \05D0\05D5 \05D0\05D9\05E0\05D4 \05DE\05D5\05E8\05E9\05D9\05EA.')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139039924367751324)
,p_name=>'APEX.FS.CONFIG_TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05E8 \05DE\05E1\05E0\05E0\05D9\05DD \05DC\05D4\05E6\05D2\05D4')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139166455743751361)
,p_name=>'APEX.FS.COUNT_RESULTS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05EA\05D5\05E6\05D0\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139166524079751361)
,p_name=>'APEX.FS.COUNT_SELECTED'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05E0\05D1\05D7\05E8\05D5')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139169366758751362)
,p_name=>'APEX.FS.CUR_FILTERS_LM'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E1\05E0\05E0\05D9\05DD \05E0\05D5\05DB\05D7\05D9\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139044999834751325)
,p_name=>'APEX.FS.FACETED_SEARCH_NEEDS_REGION_QUERY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D9\05E4\05D5\05E9 \05DC\05E4\05D9 \05D4\05D9\05D1\05D8\05D9\05DD \05D3\05D5\05E8\05E9 \05DE\05E7\05D5\05E8 \05E0\05EA\05D5\05E0\05D9\05DD \05D1\05E8\05DE\05EA \05D4\05D0\05D6\05D5\05E8.')
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139048673513751326)
,p_name=>'APEX.FS.FACETS_LIST'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05E9\05D9\05DE\05EA \05DE\05E1\05E0\05E0\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139227797752751380)
,p_name=>'APEX.FS.FACET_VALUE_LIMIT_EXCEEDED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05E8\05D9\05D2\05D4 \05DE\05D2\05D1\05D5\05DC \05D4\05E2\05E8\05DB\05D9\05DD \05D4\05E0\05D1\05D3\05DC\05D9\05DD (%0) \05D1\05E9\05D1\05D9\05DC \05D4\05D9\05D1\05D8 %1.')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139214093976751376)
,p_name=>'APEX.FS.FC_TYPE_UNSUPPORTED_FOR_DATE_COLUMNS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D9\05D1\05D8 %0 \05DC\05D0 \05E0\05EA\05DE\05DA \05DC\05E2\05DE\05D5\05D3\05D5\05EA ''\05EA\05D0\05E8\05D9\05DA'' \05D0\05D5 ''\05D7\05D5\05EA\05DE\05EA \05D6\05DE\05DF''.')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139212123185751375)
,p_name=>'APEX.FS.FILTER'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E1\05E0\05DF %0')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139086744148751338)
,p_name=>'APEX.FS.FILTER_APPLIED'
,p_message_language=>'he'
,p_message_text=>unistr('%0 (\05DE\05E1\05E0\05DF \05D4\05D5\05D7\05DC)')
,p_is_js_message=>true
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139212271286751375)
,p_name=>'APEX.FS.GO'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D9\05E6\05D5\05E2')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139082221736751336)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_C'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05DB\05D9\05DC \05D0\05EA %0')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139213696506751375)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_EQ'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D5\05D5\05D4 %0')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139081961700751336)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_GT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D2\05D3\05D5\05DC \05DE-%0')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139082045052751336)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_GTE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D2\05D3\05D5\05DC \05D0\05D5 \05E9\05D5\05D5\05D4: %0')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139081669407751336)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_LT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D8\05DF \05DE-%0')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139081862542751336)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_LTE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D8\05DF \05D0\05D5 \05E9\05D5\05D5\05D4: %0')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139081115550751336)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NC'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E0\05D5 \05DE\05DB\05D9\05DC %0')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139066902790751332)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NEQ'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E9\05D5\05D5\05D4 %0')
,p_is_js_message=>true
,p_version_scn=>2704858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139081262992751336)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NSTARTS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E0\05D5 \05DE\05EA\05D7\05D9\05DC \05D1: %0')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139082122411751336)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_STARTS'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05EA\05D7\05D9\05DC \05D1-%0')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139080248626751336)
,p_name=>'APEX.FS.INPUT_FACET_SELECTOR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05D9\05E8\05EA \05D4\05D9\05D1\05D8')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139056057945751328)
,p_name=>'APEX.FS.INPUT_INVALID_FILTER_PREFIX'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D7\05D9\05DC\05D9\05EA \05DE\05E1\05E0\05DF "%0" \05DC\05D0 \05EA\05E7\05E4\05D4 \05DC\05D4\05D9\05D1\05D8 "%1".')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139054462928751328)
,p_name=>'APEX.FS.INPUT_MISSING_FILTER_PREFIX'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05E1\05E8\05D4 \05EA\05D7\05D9\05DC\05D9\05EA \05DE\05E1\05E0\05DF \05DC\05D4\05D9\05D1\05D8 "%0".')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139088602554751338)
,p_name=>'APEX.FS.INPUT_OPERATOR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D5\05E4\05E8\05D8\05D5\05E8')
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139070531448751333)
,p_name=>'APEX.FS.INPUT_OPERATOR.C'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05DB\05D9\05DC')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139069525445751333)
,p_name=>'APEX.FS.INPUT_OPERATOR.EQ'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D5\05D5\05D4')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139070213156751333)
,p_name=>'APEX.FS.INPUT_OPERATOR.GT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D2\05D3\05D5\05DC \05DE-')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139070359521751333)
,p_name=>'APEX.FS.INPUT_OPERATOR.GTE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D2\05D3\05D5\05DC \05D0\05D5 \05E9\05D5\05D5\05D4 \05DC-')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139069982848751333)
,p_name=>'APEX.FS.INPUT_OPERATOR.LT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D8\05DF \05DE-')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139070060735751333)
,p_name=>'APEX.FS.INPUT_OPERATOR.LTE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D8\05DF \05D0\05D5 \05E9\05D5\05D5\05D4 \05DC-')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139081045034751336)
,p_name=>'APEX.FS.INPUT_OPERATOR.NC'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E0\05D5 \05DE\05DB\05D9\05DC')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139069753906751333)
,p_name=>'APEX.FS.INPUT_OPERATOR.NEQ'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E9\05D5\05D5\05D4')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139080911324751336)
,p_name=>'APEX.FS.INPUT_OPERATOR.NSTARTS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E0\05D5 \05DE\05EA\05D7\05D9\05DC \05D1:')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139070455692751333)
,p_name=>'APEX.FS.INPUT_OPERATOR.STARTS'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05EA\05D7\05D9\05DC \05D1-')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139089006323751338)
,p_name=>'APEX.FS.INPUT_UNSUPPORTED_DATA_TYPE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D5\05D2 \05D4\05E0\05EA\05D5\05E0\05D9\05DD %0 (%1) \05DC\05D0 \05E0\05EA\05DE\05DA \05DC\05D4\05D9\05D1\05D8 \05E9\05D3\05D4 \05D4\05E7\05DC\05D8.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139055943826751328)
,p_name=>'APEX.FS.INPUT_UNSUPPORTED_FILTER_FOR_DATA_TYPE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E1\05E0\05DF "%0" \05D0\05D9\05E0\05D5 \05E0\05EA\05DE\05DA \05DC\05D4\05D9\05D1\05D8 "%1" (\05E1\05D5\05D2 \05E0\05EA\05D5\05E0\05D9\05DD %2).')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139088541450751338)
,p_name=>'APEX.FS.INPUT_VALUE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E8\05DA')
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139213882009751375)
,p_name=>'APEX.FS.NO_SEARCH_COLUMNS_PROVIDED'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E6\05D5\05D9\05E0\05D5 \05E2\05DE\05D5\05D3\05D5\05EA \05D7\05D9\05E4\05D5\05E9 \05DC\05D4\05D9\05D1\05D8 %0')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139040000073751324)
,p_name=>'APEX.FS.OPEN_CONFIG'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E1\05E0\05E0\05D9\05DD \05E0\05D5\05E1\05E4\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139166668955751361)
,p_name=>'APEX.FS.RANGE_BEGIN'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05EA\05D7\05DC\05EA \05D4\05D8\05D5\05D5\05D7')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139213329572751375)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05E2\05D3 %1')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139213435658751375)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL_OPEN_HI'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E2\05DC %0')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139213550052751375)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL_OPEN_LO'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05EA\05D7\05EA \05DC-%0')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139166780588751361)
,p_name=>'APEX.FS.RANGE_END'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D5\05E3 \05D4\05D8\05D5\05D5\05D7')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139231354552751381)
,p_name=>'APEX.FS.RANGE_LOV_ITEM_INVALID'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05E8\05D9\05D8 \05E8\05E9\05D9\05DE\05EA \05E2\05E8\05DB\05D9\05DD #%2 ("%1") \05DC\05D4\05D9\05D1\05D8 \05D8\05D5\05D5\05D7 %0 \05D1\05DC\05EA\05D9 \05EA\05E7\05E3 (\05DE\05E4\05E8\05D9\05D3 "|" \05D7\05E1\05E8).')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139213720620751375)
,p_name=>'APEX.FS.RANGE_MANUAL_NOT_SUPPORTED'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05DC\05D8 \05D9\05D3\05E0\05D9 \05DC\05D4\05D9\05D1\05D8 \05D8\05D5\05D5\05D7 %0 \05DC\05D0 \05E0\05EA\05DE\05DA \05DB\05E8\05D2\05E2 \05DB\05D9\05D5\05D5\05DF \05E9\05D4\05E2\05DE\05D5\05D3\05D4 \05D4\05D9\05D0 ''\05EA\05D0\05E8\05D9\05DA'' \05D0\05D5 ''\05D7\05D5\05EA\05DE\05EA \05D6\05DE\05DF''.')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139213073156751375)
,p_name=>'APEX.FS.RANGE_TEXT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D3')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139076603170751335)
,p_name=>'APEX.FS.REMOVE_CHART'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05E8 \05EA\05E8\05E9\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139163069849751360)
,p_name=>'APEX.FS.RESET'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E4\05D5\05E1')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139212446574751375)
,p_name=>'APEX.FS.SEARCH_LABEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05E4\05E9')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139212349284751375)
,p_name=>'APEX.FS.SEARCH_PLACEHOLDER'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05E4\05E9...')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139213250030751375)
,p_name=>'APEX.FS.SELECT_PLACEHOLDER'
,p_message_language=>'he'
,p_message_text=>unistr('- \05D1\05D7\05E8 -')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139076481644751335)
,p_name=>'APEX.FS.SHOW_CHART'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E6\05D2\05EA \05EA\05E8\05E9\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139212808162751375)
,p_name=>'APEX.FS.SHOW_LESS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E6\05D2 \05E4\05D7\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139212969919751375)
,p_name=>'APEX.FS.SHOW_MORE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E6\05D2 \05D4\05DB\05DC')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139213124443751375)
,p_name=>'APEX.FS.STAR_RATING_LABEL'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05DB\05D5\05DB\05D1\05D9\05DD \05D5\05DE\05E2\05DC\05D4')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139168382262751362)
,p_name=>'APEX.FS.SUGGESTIONS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E6\05E2\05D5\05EA \05E1\05D9\05E0\05D5\05DF')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139213919245751376)
,p_name=>'APEX.FS.TEXT_FIELD_ONLY_FOR_NUMBER_COLUMNS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D9\05D1\05D8 \05E9\05D3\05D4 \05D8\05E7\05E1\05D8 %0 \05E0\05EA\05DE\05DA \05DB\05E8\05D2\05E2 \05E8\05E7 \05DC\05E2\05DE\05D5\05D3\05D5\05EA ''\05DE\05E1\05E4\05E8''.')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139039429532751323)
,p_name=>'APEX.FS.TOTAL_ROW_COUNT_LABEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D4"\05DB \05DE\05E1\05E4\05E8 \05E9\05D5\05E8\05D5\05EA')
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139229310395751380)
,p_name=>'APEX.FS.UNSUPPORTED_DATA_TYPE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D5\05D2 \05D4\05E0\05EA\05D5\05E0\05D9\05DD %0 (%1) \05DC\05D0 \05E0\05EA\05DE\05DA \05DC\05D7\05D9\05E4\05D5\05E9 \05DC\05E4\05D9 \05D4\05D9\05D1\05D8\05D9\05DD.')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139159533813751359)
,p_name=>'APEX.FS.VISUALLY_HIDDEN_HEADING'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D5\05EA\05E8\05EA \05E0\05E1\05EA\05E8\05EA \05DE\05D4\05E2\05D9\05DF')
,p_is_js_message=>true
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139221850099751378)
,p_name=>'APEX.GO_TO_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D1\05D5\05E8 \05DC\05E9\05D2\05D9\05D0\05D4')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139177809440751365)
,p_name=>'APEX.GV.AGG_CONTEXT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05DB\05D9\05DE\05D4.')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139105707637751343)
,p_name=>'APEX.GV.BLANK_HEADING'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D5\05EA\05E8\05EA \05E8\05D9\05E7\05D4')
,p_is_js_message=>true
,p_version_scn=>2704865
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139187133005751368)
,p_name=>'APEX.GV.BREAK_COLLAPSE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D5\05D5\05E5 Control Break')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139177981740751365)
,p_name=>'APEX.GV.BREAK_CONTEXT'
,p_message_language=>'he'
,p_message_text=>'Control break.'
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139187011704751368)
,p_name=>'APEX.GV.BREAK_EXPAND'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E8\05D7\05D1 Control Break')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139186824494751367)
,p_name=>'APEX.GV.DELETED_COUNT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05DE\05D7\05E7\05D5 %0 \05E9\05D5\05E8\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139255972092751388)
,p_name=>'APEX.GV.DUP_REC_ID'
,p_message_language=>'he'
,p_message_text=>unistr('\05D6\05D4\05D5\05EA \05DB\05E4\05D5\05DC\05D4')
,p_is_js_message=>true
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139048879347751326)
,p_name=>'APEX.GV.ENTER_EDIT_MODE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05E0\05D9\05E1\05D4 \05DC\05DE\05E6\05D1 \05E2\05E8\05D9\05DB\05D4')
,p_is_js_message=>true
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139174779859751364)
,p_name=>'APEX.GV.FIRST_PAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05D0\05E9\05D5\05DF')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139047697629751326)
,p_name=>'APEX.GV.FLOATING_ITEM.DIALOG.HIDE_DIALOG'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05EA\05E8 \05EA\05D9\05D1\05EA \05D3\05D5-\05E9\05D9\05D7')
,p_is_js_message=>true
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139046600904751326)
,p_name=>'APEX.GV.FLOATING_ITEM.DIALOG.TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D5\05DB\05DF \05EA\05D0 \05D2\05DC\05D9\05E9\05D4 \05E6\05E3')
,p_is_js_message=>true
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139047989639751326)
,p_name=>'APEX.GV.FLOATING_ITEM.SHOW_DIALOG'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E6\05D2 \05EA\05D5\05DB\05DF \05D2\05DC\05D9\05E9\05D4')
,p_is_js_message=>true
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139122166508751348)
,p_name=>'APEX.GV.FOOTER_LANDMARK'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D5\05EA\05E8\05EA \05EA\05D7\05EA\05D5\05E0\05D4 \05E9\05DC \05E8\05E9\05EA')
,p_is_js_message=>true
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139178157110751365)
,p_name=>'APEX.GV.GROUP_CONTEXT'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D5\05EA\05E8\05EA \05E7\05D1\05D5\05E6\05D4')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139178089274751365)
,p_name=>'APEX.GV.HEADER_CONTEXT'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D5\05EA\05E8\05EA.')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139174803893751364)
,p_name=>'APEX.GV.LAST_PAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D7\05E8\05D5\05DF')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139049086623751326)
,p_name=>'APEX.GV.LEAVE_EDIT_MODE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05E6\05D9\05D0\05D4 \05DE\05DE\05E6\05D1 \05E2\05E8\05D9\05DB\05D4')
,p_is_js_message=>true
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139073726404751334)
,p_name=>'APEX.GV.LOAD_ALL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D8\05E2\05DF \05D4\05DB\05DC')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139196697560751370)
,p_name=>'APEX.GV.LOAD_MORE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E6\05D2 \05E2\05D5\05D3')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139174501904751364)
,p_name=>'APEX.GV.NEXT_PAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D1\05D0')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139178231762751365)
,p_name=>'APEX.GV.PAGE_RANGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D5\05E8\05D5\05EA \05D3\05E3')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139087330500751338)
,p_name=>'APEX.GV.PAGE_RANGE_ENTITY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05E3 %0')
,p_is_js_message=>true
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139174984367751364)
,p_name=>'APEX.GV.PAGE_RANGE_XY'
,p_message_language=>'he'
,p_message_text=>'%0 - %1'
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139175095117751364)
,p_name=>'APEX.GV.PAGE_RANGE_XYZ'
,p_message_language=>'he'
,p_message_text=>unistr('%0 - %1 \05DE\05EA\05D5\05DA %2')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139231998867751381)
,p_name=>'APEX.GV.PAGE_SELECTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05D9\05E8\05EA \05D3\05E3')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139122403939751348)
,p_name=>'APEX.GV.PAGINATION_LANDMARK'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D9\05DE\05D5\05D3')
,p_is_js_message=>true
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139174684744751364)
,p_name=>'APEX.GV.PREV_PAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E7\05D5\05D3\05DD')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139072648653751334)
,p_name=>'APEX.GV.RANGE_DISPLAY'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05E6\05D5\05D2\05EA \05D8\05D5\05D5\05D7')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139106029712751344)
,p_name=>'APEX.GV.ROWS_SELECTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05D9\05E8\05EA \05E9\05D5\05E8\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704865
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139255744547751388)
,p_name=>'APEX.GV.ROW_ADDED'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05D5\05E1\05E3')
,p_is_js_message=>true
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139255827205751388)
,p_name=>'APEX.GV.ROW_CHANGED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E9\05EA\05E0\05D4')
,p_is_js_message=>true
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139264105734751391)
,p_name=>'APEX.GV.ROW_COLUMN_CONTEXT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05E6\05E3 \05E9\05D5\05E8\05D5\05EA \05D1\05D8\05DC\05D4 %0, \05E2\05DE\05D5\05D3\05D4 %1.')
,p_is_js_message=>true
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139264272855751391)
,p_name=>'APEX.GV.ROW_CONTEXT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05E6\05E3 \05E9\05D5\05E8\05D5\05EA \05D1\05D8\05D1\05DC\05D4 %0.')
,p_is_js_message=>true
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139255615733751388)
,p_name=>'APEX.GV.ROW_DELETED'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05DE\05D7\05E7')
,p_is_js_message=>true
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139178413049751365)
,p_name=>'APEX.GV.ROW_HEADER'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D5\05EA\05E8\05EA \05E9\05D5\05E8\05D4')
,p_is_js_message=>true
,p_version_scn=>2704877
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139105932512751343)
,p_name=>'APEX.GV.ROW_SELECTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05D9\05E8\05EA \05E9\05D5\05E8\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704865
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139073879493751334)
,p_name=>'APEX.GV.SELECTED_ENTITY_COUNT'
,p_message_language=>'he'
,p_message_text=>unistr('%0 %1 \05E0\05D1\05D7\05E8\05D5')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139173911475751364)
,p_name=>'APEX.GV.SELECTION_CELL_COUNT'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05EA\05D0\05D9\05DD \05E0\05D1\05D7\05E8\05D5')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139175153004751364)
,p_name=>'APEX.GV.SELECTION_COUNT'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05E9\05D5\05E8\05D5\05EA \05E0\05D1\05D7\05E8\05D5')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139217210165751376)
,p_name=>'APEX.GV.SELECT_ALL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05E8 \05D4\05DB\05DC')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139110780919751345)
,p_name=>'APEX.GV.SELECT_ALL_ROWS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05E8 \05D0\05EA \05DB\05DC \05D4\05E9\05D5\05E8\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139186924135751367)
,p_name=>'APEX.GV.SELECT_PAGE_N'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05E3 %0')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139178317494751365)
,p_name=>'APEX.GV.SELECT_ROW'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05E8 \05E9\05D5\05E8\05D4 ')
,p_is_js_message=>true
,p_version_scn=>2704877
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139178632915751365)
,p_name=>'APEX.GV.SORTED_ASCENDING'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D3\05E8 \05E2\05D5\05DC\05D4 \05DE\05DE\05D5\05D9\05DF %0')
,p_is_js_message=>true
,p_version_scn=>2704877
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139178739811751365)
,p_name=>'APEX.GV.SORTED_DESCENDING'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D3\05E8 \05D9\05D5\05E8\05D3 \05DE\05DE\05D5\05D9\05DF %0')
,p_is_js_message=>true
,p_version_scn=>2704877
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139174013259751364)
,p_name=>'APEX.GV.SORT_ASCENDING'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D9\05D9\05DF \05D1\05E1\05D3\05E8 \05E2\05D5\05DC\05D4')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139174391594751364)
,p_name=>'APEX.GV.SORT_ASCENDING_ORDER'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D9\05D9\05DF \05D1\05E1\05D3\05E8 \05E2\05D5\05DC\05D4 %0')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139174136992751364)
,p_name=>'APEX.GV.SORT_DESCENDING'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D9\05D9\05DF \05D1\05E1\05D3\05E8 \05D9\05D5\05E8\05D3')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139174451557751364)
,p_name=>'APEX.GV.SORT_DESCENDING_ORDER'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D9\05D9\05DF \05D1\05E1\05D3\05E8 \05D9\05D5\05E8\05D3 %0')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139174298049751364)
,p_name=>'APEX.GV.SORT_OFF'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05DF \05DC\05DE\05D9\05D9\05DF')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139039842936751324)
,p_name=>'APEX.GV.SORT_OPTIONS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05E4\05E9\05E8\05D5\05D9\05D5\05EA \05DE\05D9\05D5\05DF')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139122206355751348)
,p_name=>'APEX.GV.STATE_ICONS_LANDMARK'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E7\05D5\05E0\05D9\05DD \05E9\05DC \05DE\05E6\05D1\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139122364674751348)
,p_name=>'APEX.GV.STATUS_LANDMARK'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D8\05D8\05D5\05E1 \05E9\05DC \05E8\05E9\05EA')
,p_is_js_message=>true
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139052196309751327)
,p_name=>'APEX.GV.TOTAL_ENTITY_PLURAL'
,p_message_language=>'he'
,p_message_text=>'%0 %1'
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139051898694751327)
,p_name=>'APEX.GV.TOTAL_ENTITY_SINGULAR'
,p_message_language=>'he'
,p_message_text=>'1 %0'
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139186712720751367)
,p_name=>'APEX.GV.TOTAL_PAGES'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D4"\05DB %0')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139105532053751343)
,p_name=>'APEX.HTTP.REQUEST_FAILED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05E7\05E9\05EA HTTP \05DC-"%0" \05E0\05DB\05E9\05DC\05D4.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139107130810751344)
,p_name=>'APEX.ICON_LIST.COLUMN'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DE\05D5\05D3\05D4 %0')
,p_is_js_message=>true
,p_version_scn=>2704867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139107371939751344)
,p_name=>'APEX.ICON_LIST.COLUMN_AND_ROW'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DE\05D5\05D3\05D4 %0 \05D5\05E9\05D5\05E8\05D4 %1')
,p_is_js_message=>true
,p_version_scn=>2704867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139107611085751344)
,p_name=>'APEX.ICON_LIST.FIRST_COLUMN'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D1\05E8 \05D1\05E2\05DE\05D5\05D3\05D4 \05D4\05E8\05D0\05E9\05D5\05E0\05D4. \05E2\05DE\05D5\05D3\05D4 %0 \05D5\05E9\05D5\05E8\05D4 %1')
,p_is_js_message=>true
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139107558590751344)
,p_name=>'APEX.ICON_LIST.FIRST_ROW'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D1\05E8 \05D1\05E9\05D5\05E8\05D4 \05D4\05E8\05D0\05E9\05D5\05E0\05D4. \05E2\05DE\05D5\05D3\05D4 %0 \05D5\05E9\05D5\05E8\05D4 %1')
,p_is_js_message=>true
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139253119420751387)
,p_name=>'APEX.ICON_LIST.GRID_DIM'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D5\05E6\05D2 \05D1-%0 \05E2\05DE\05D5\05D3\05D5\05EA \05D5\05D1-%1 \05E9\05D5\05E8\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139107751292751344)
,p_name=>'APEX.ICON_LIST.LAST_COLUMN'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D1\05E8 \05D1\05E2\05DE\05D5\05D3\05D4 \05D4\05D0\05D7\05E8\05D5\05E0\05D4. \05E2\05DE\05D5\05D3\05D4 %0 \05D5\05E9\05D5\05E8\05D4 %1')
,p_is_js_message=>true
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139107408651751344)
,p_name=>'APEX.ICON_LIST.LAST_ROW'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D1\05E8 \05D1\05E9\05D5\05E8\05D4 \05D4\05D0\05D7\05E8\05D5\05E0\05D4. \05E2\05DE\05D5\05D3\05D4 %0 \05D5\05E9\05D5\05E8\05D4 %1')
,p_is_js_message=>true
,p_version_scn=>2704867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139186651973751367)
,p_name=>'APEX.ICON_LIST.LIST_DIM'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D5\05E6\05D2 \05D1-%0 \05E9\05D5\05E8\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139107275197751344)
,p_name=>'APEX.ICON_LIST.ROW'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D5\05E8\05D4 %0')
,p_is_js_message=>true
,p_version_scn=>2704867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139263979079751390)
,p_name=>'APEX.IG.ACC_LABEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05E9\05EA \05D0\05D9\05E0\05D8\05E8\05D0\05E7\05D8\05D9\05D1\05D9\05EA %0')
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139171099017751363)
,p_name=>'APEX.IG.ACTIONS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05E2\05D5\05DC\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139172009020751363)
,p_name=>'APEX.IG.ADD'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05E1\05E3')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139171919994751363)
,p_name=>'APEX.IG.ADD_ROW'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05E1\05E3 \05E9\05D5\05E8\05D4')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139257594438751388)
,p_name=>'APEX.IG.AGGREGATE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05DB\05D9\05DE\05D4')
,p_is_js_message=>true
,p_version_scn=>2704896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139243144704751384)
,p_name=>'APEX.IG.AGGREGATION'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05DB\05D9\05DE\05D4')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139244814829751385)
,p_name=>'APEX.IG.ALL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05DB\05DC')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139202480390751372)
,p_name=>'APEX.IG.ALL_TEXT_COLUMNS'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05DC \05E2\05DE\05D5\05D3\05D5\05EA \05D4\05D8\05E7\05E1\05D8')
,p_is_js_message=>true
,p_version_scn=>2704881
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139203650153751372)
,p_name=>'APEX.IG.ALTERNATIVE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05DC\05D5\05E4\05D9')
,p_is_js_message=>true
,p_version_scn=>2704882
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139204755964751373)
,p_name=>'APEX.IG.AND'
,p_message_language=>'he'
,p_message_text=>unistr('\05D5\05D2\05DD')
,p_is_js_message=>true
,p_version_scn=>2704882
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139224156161751379)
,p_name=>'APEX.IG.APPROX_COUNT_DISTINCT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05E4\05D9\05E8\05EA \05E0\05D1\05D3\05DC\05D9\05DD \05D1\05E7\05D9\05E8\05D5\05D1')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139258568304751389)
,p_name=>'APEX.IG.APPROX_COUNT_DISTINCT_OVERALL'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05E4\05D9\05E8\05EA \05E0\05D1\05D3\05DC\05D9\05DD \05D1\05E7\05D9\05E8\05D5\05D1 \05DB\05D5\05DC\05DC\05EA')
,p_is_js_message=>true
,p_version_scn=>2704896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139241705953751384)
,p_name=>'APEX.IG.AREA'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D8\05D7')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139243682392751384)
,p_name=>'APEX.IG.ASCENDING'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05E1\05D3\05E8 \05E2\05D5\05DC\05D4')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139203769799751372)
,p_name=>'APEX.IG.AUTHORIZATION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E8\05E9\05D0\05D4')
,p_is_js_message=>true
,p_version_scn=>2704882
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139257630986751388)
,p_name=>'APEX.IG.AUTO'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D5\05D8\05D5\05DE\05D8\05D9')
,p_is_js_message=>true
,p_version_scn=>2704896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139224579108751379)
,p_name=>'APEX.IG.AVG'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05DE\05D5\05E6\05E2')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139258260086751389)
,p_name=>'APEX.IG.AVG_OVERALL'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05DE\05D5\05E6\05E2 \05DB\05D5\05DC\05DC')
,p_is_js_message=>true
,p_version_scn=>2704896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139241256390751384)
,p_name=>'APEX.IG.AXIS_LABEL_TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D5\05EA\05E8\05EA \05E6\05D9\05E8 \05EA\05D5\05D5\05D9\05EA')
,p_is_js_message=>true
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139241421090751384)
,p_name=>'APEX.IG.AXIS_VALUE_DECIMAL'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E7\05D5\05DE\05D5\05EA \05E2\05E9\05E8\05D5\05E0\05D9\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139241349494751384)
,p_name=>'APEX.IG.AXIS_VALUE_TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D5\05EA\05E8\05EA \05E6\05D9\05E8 \05E2\05E8\05DA')
,p_is_js_message=>true
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139247485331751385)
,p_name=>'APEX.IG.BACKGROUND_COLOR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E6\05D1\05E2 \05E8\05E7\05E2')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139241839354751384)
,p_name=>'APEX.IG.BAR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DE\05D5\05D3\05D4')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139199064438751371)
,p_name=>'APEX.IG.BETWEEN'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D9\05DF')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139248683106751386)
,p_name=>'APEX.IG.BOTH'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05E0\05D9\05D4\05DD')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139241993940751384)
,p_name=>'APEX.IG.BUBBLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05E8\05E9\05D9\05DD \05D1\05D5\05E2\05D4')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139172282462751363)
,p_name=>'APEX.IG.CANCEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D8\05DC')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139204611822751373)
,p_name=>'APEX.IG.CASE_SENSITIVE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05D2\05D9\05E9 \05DC\05D0\05D5\05EA\05D9\05D5\05EA \05E8\05D9\05E9\05D9\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704882
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139259133567751389)
,p_name=>'APEX.IG.CASE_SENSITIVE_WITH_BRACKETS'
,p_message_language=>'he'
,p_message_text=>unistr('(\05E8\05D2\05D9\05E9 \05DC\05D0\05D5\05EA\05D9\05D5\05EA \05E8\05D9\05E9\05D9\05D5\05EA)')
,p_is_js_message=>true
,p_version_scn=>2704896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139230419832751380)
,p_name=>'APEX.IG.CHANGES_SAVED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E9\05D9\05E0\05D5\05D9\05D9\05DD \05E0\05E9\05DE\05E8\05D5')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139172604839751363)
,p_name=>'APEX.IG.CHANGE_VIEW'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D7\05DC\05E3 \05EA\05E6\05D5\05D2\05D4')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139205731402751373)
,p_name=>'APEX.IG.CHART'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05E8\05E9\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704882
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139202247207751372)
,p_name=>'APEX.IG.CHART_MAX_DATAPOINT_CNT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E9\05D0\05D9\05DC\05EA\05D0 \05D7\05D5\05E8\05D2\05EA \05DE\05D4\05DE\05E1\05E4\05E8 \05D4\05DE\05E8\05D1\05D9 \05E9\05DC %0 \05E0\05E7\05D5\05D3\05D5\05EA \05E0\05EA\05D5\05E0\05D9\05DD \05DC\05DB\05DC \05EA\05E8\05E9\05D9\05DD. \05D4\05D7\05DC \05DE\05E1\05E0\05DF \05DB\05D3\05D9 \05DC\05E6\05DE\05E6\05DD \05D0\05EA \05DE\05E1\05E4\05E8 \05D4\05E8\05E9\05D5\05DE\05D5\05EA \05D1\05E9\05D0\05D9\05DC\05EA\05EA \05D4\05D1\05E1\05D9\05E1 \05E9\05DC\05DA.')
,p_is_js_message=>true
,p_version_scn=>2704881
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139170954749751363)
,p_name=>'APEX.IG.CHART_VIEW'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05E6\05D5\05D2\05EA \05EA\05E8\05E9\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139179317758751365)
,p_name=>'APEX.IG.CLEAR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05E7\05D4')
,p_is_js_message=>true
,p_version_scn=>2704877
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139240705419751383)
,p_name=>'APEX.IG.CLOSE_COLUMN'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D2\05D5\05E8')
,p_is_js_message=>true
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139247631092751385)
,p_name=>'APEX.IG.COLORS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E6\05D1\05E2\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139224951584751379)
,p_name=>'APEX.IG.COLOR_PREVIEW'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05E6\05D5\05D2\05D4 \05DE\05E7\05D3\05D9\05DE\05D4')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139204049962751373)
,p_name=>'APEX.IG.COLUMN'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DE\05D5\05D3\05D4')
,p_is_js_message=>true
,p_version_scn=>2704882
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139171116431751363)
,p_name=>'APEX.IG.COLUMNS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DE\05D5\05D3\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139133051589751351)
,p_name=>'APEX.IG.COLUMN_HEADER_ACTIONS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05E2\05D5\05DC\05D5\05EA \05E2\05DE\05D5\05D3\05D4')
,p_is_js_message=>true
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139132825933751351)
,p_name=>'APEX.IG.COLUMN_HEADER_ACTIONS_FOR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05E2\05D5\05DC\05D5\05EA \05DC\05E2\05DE\05D5\05D3\05D4 "%0"')
,p_is_js_message=>true
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139249462078751386)
,p_name=>'APEX.IG.COLUMN_TYPE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D8\05E8\05EA \05E2\05DE\05D5\05D3\05D4')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139204176116751373)
,p_name=>'APEX.IG.COMPLEX'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D5\05E8\05DB\05D1')
,p_is_js_message=>true
,p_version_scn=>2704882
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139171397298751363)
,p_name=>'APEX.IG.COMPUTE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05E9\05D1')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139199663056751371)
,p_name=>'APEX.IG.CONTAINS'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05DB\05D9\05DC')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139205974913751373)
,p_name=>'APEX.IG.CONTROL_BREAK'
,p_message_language=>'he'
,p_message_text=>'Control Break'
,p_is_js_message=>true
,p_version_scn=>2704882
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139179198382751365)
,p_name=>'APEX.IG.COPY_CB'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E2\05EA\05E7\05D4 \05DC\05DC\05D5\05D7')
,p_is_js_message=>true
,p_version_scn=>2704877
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139179224325751365)
,p_name=>'APEX.IG.COPY_DOWN'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E2\05EA\05E7 \05DC\05DE\05D8\05D4')
,p_is_js_message=>true
,p_version_scn=>2704877
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139223949948751378)
,p_name=>'APEX.IG.COUNT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05E4\05D9\05E8\05D4')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139224076977751379)
,p_name=>'APEX.IG.COUNT_DISTINCT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05E4\05D9\05E8\05EA \05E0\05D1\05D3\05DC\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139258405185751389)
,p_name=>'APEX.IG.COUNT_DISTINCT_OVERALL'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05E4\05D9\05E8\05EA \05E0\05D1\05D3\05DC\05D9\05DD \05DB\05D5\05DC\05DC\05EA')
,p_is_js_message=>true
,p_version_scn=>2704896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139258394636751389)
,p_name=>'APEX.IG.COUNT_OVERALL'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05E4\05D9\05E8\05D4 \05DB\05D5\05DC\05DC\05EA')
,p_is_js_message=>true
,p_version_scn=>2704896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139256064171751388)
,p_name=>'APEX.IG.CREATE_X'
,p_message_language=>'he'
,p_message_text=>unistr('\05E6\05D5\05E8 %0')
,p_is_js_message=>true
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139202691646751372)
,p_name=>'APEX.IG.DATA'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05EA\05D5\05E0\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704881
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139249218621751386)
,p_name=>'APEX.IG.DATA_TYPE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D5\05D2 \05E0\05EA\05D5\05DF')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139248833274751386)
,p_name=>'APEX.IG.DATE'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D0\05E8\05D9\05DA')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139230202816751380)
,p_name=>'APEX.IG.DATE_INVALID_VALUE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E8\05DA \05EA\05D0\05E8\05D9\05DA \05DC\05D0 \05EA\05E7\05E3')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139200389174751371)
,p_name=>'APEX.IG.DAYS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05DE\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704881
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139203365879751372)
,p_name=>'APEX.IG.DEFAULT_SETTINGS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D2\05D3\05E8\05D5\05EA \05D1\05E8\05D9\05E8\05EA \05DE\05D7\05D3\05DC')
,p_is_js_message=>true
,p_version_scn=>2704881
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139203164111751372)
,p_name=>'APEX.IG.DEFAULT_TYPE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D5\05D2 \05D1\05E8\05D9\05E8\05EA \05DE\05D7\05D3\05DC')
,p_is_js_message=>true
,p_version_scn=>2704881
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139172110149751363)
,p_name=>'APEX.IG.DELETE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D7\05E7')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139250334859751386)
,p_name=>'APEX.IG.DELETE_REPORT_CONFIRM'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D0\05DD \05D1\05D8\05D5\05D7 \05E9\05EA\05E8\05E6\05D4 \05DC\05DE\05D7\05D5\05E7 \05D3\05D5\05D7 \05D6\05D4?')
,p_is_js_message=>true
,p_version_scn=>2704893
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139207766448751374)
,p_name=>'APEX.IG.DELETE_ROW'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D7\05E7 \05E9\05D5\05E8\05D4')
,p_is_js_message=>true
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139206513253751373)
,p_name=>'APEX.IG.DELETE_ROWS'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D7\05D9\05E7\05EA \05E9\05D5\05E8\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704882
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139243709290751384)
,p_name=>'APEX.IG.DESCENDING'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05E1\05D3\05E8 \05D9\05D5\05E8\05D3')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139205488180751373)
,p_name=>'APEX.IG.DETAIL'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05D9\05E8\05D5\05D8')
,p_is_js_message=>true
,p_version_scn=>2704882
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139170602125751363)
,p_name=>'APEX.IG.DETAIL_VIEW'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D1\05D8 \05E4\05D9\05E8\05D5\05D8')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139232762976751381)
,p_name=>'APEX.IG.DIRECTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D9\05D5\05D5\05DF')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139205114279751373)
,p_name=>'APEX.IG.DISABLED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05E1\05D5\05DD')
,p_is_js_message=>true
,p_version_scn=>2704882
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139199707329751371)
,p_name=>'APEX.IG.DOES_NOT_CONTAIN'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E0\05D5 \05DE\05DB\05D9\05DC')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139199911440751371)
,p_name=>'APEX.IG.DOES_NOT_START_WITH'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E0\05D5 \05DE\05EA\05D7\05D9\05DC \05D1:')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139242065728751384)
,p_name=>'APEX.IG.DONUT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D8\05D1\05E2\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139206141939751373)
,p_name=>'APEX.IG.DOWNLOAD'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05E8\05D3')
,p_is_js_message=>true
,p_version_scn=>2704882
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139096481363751341)
,p_name=>'APEX.IG.DOWNLOAD_DATA_ONLY'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05EA\05D5\05E0\05D9\05DD \05D1\05DC\05D1\05D3')
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139251376985751387)
,p_name=>'APEX.IG.DOWNLOAD_FORMAT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05E8 \05E4\05D5\05E8\05DE\05D8')
,p_is_js_message=>true
,p_version_scn=>2704893
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139111546047751345)
,p_name=>'APEX.IG.DOWNLOAD_FORMAT_NOT_ENABLED'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05D5\05E8\05DE\05D8 \05D4\05D4\05D5\05E8\05D3\05D4 %0 \05D0\05D9\05E0\05D5 \05DE\05D0\05D5\05E4\05E9\05E8.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139244442896751385)
,p_name=>'APEX.IG.DUPLICATE_AGGREGATION'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05DB\05D9\05DE\05D4 \05DB\05E4\05D5\05DC\05D4')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139244594184751385)
,p_name=>'APEX.IG.DUPLICATE_CONTROLBREAK'
,p_message_language=>'he'
,p_message_text=>unistr('Control Break \05DB\05E4\05D5\05DC')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139207651904751374)
,p_name=>'APEX.IG.DUPLICATE_ROW'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D5\05E8\05D4 \05DB\05E4\05D5\05DC\05D4')
,p_is_js_message=>true
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139206414278751373)
,p_name=>'APEX.IG.DUPLICATE_ROWS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D5\05E8\05D5\05EA \05DB\05E4\05D5\05DC\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704882
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139171709614751363)
,p_name=>'APEX.IG.EDIT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E8\05D5\05DA')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139243560256751384)
,p_name=>'APEX.IG.EDIT_CHART'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E8\05D5\05DA \05EA\05E8\05E9\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139124082660751349)
,p_name=>'APEX.IG.EDIT_CONTROL'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E8\05D5\05DA %0')
,p_is_js_message=>true
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139254950421751388)
,p_name=>'APEX.IG.EDIT_GROUP_BY'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E8\05D5\05DA \05E7\05D1\05D5\05E6\05D4 \05DC\05E4\05D9')
,p_is_js_message=>true
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139162106482751360)
,p_name=>'APEX.IG.EDIT_MODE'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D1\05DE\05E6\05D1 \05E2\05E8\05D9\05DB\05D4')
,p_is_js_message=>true
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139137715028751353)
,p_name=>'APEX.IG.EDIT_MODE_DESCRIPTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E8\05E9\05EA \05D1\05DE\05E6\05D1 \05E2\05E8\05D9\05DB\05D4, \05D1\05D8\05DC \05D0\05EA \05D4\05DC\05D7\05D9\05E6\05D4 \05DB\05D3\05D9 \05DC\05E2\05D1\05D5\05E8 \05DC\05DE\05E6\05D1 \05EA\05E6\05D5\05D2\05D4')
,p_is_js_message=>true
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139250954145751386)
,p_name=>'APEX.IG.EMAIL_BCC'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D5\05EA\05E7 \05E1\05DE\05D5\05D9 (bcc)')
,p_is_js_message=>true
,p_version_scn=>2704893
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139251170497751387)
,p_name=>'APEX.IG.EMAIL_BODY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05D3\05E2\05D4')
,p_is_js_message=>true
,p_version_scn=>2704893
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139250823714751386)
,p_name=>'APEX.IG.EMAIL_CC'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E2\05EA\05E7 (cc)')
,p_is_js_message=>true
,p_version_scn=>2704893
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139250555945751386)
,p_name=>'APEX.IG.EMAIL_SENT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05D3\05E2\05EA \05D3\05D5\05D0"\05DC \05E0\05E9\05DC\05D7\05D4.')
,p_is_js_message=>true
,p_version_scn=>2704893
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139251082281751387)
,p_name=>'APEX.IG.EMAIL_SUBJECT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E0\05D5\05E9\05D0')
,p_is_js_message=>true
,p_version_scn=>2704893
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139250786213751386)
,p_name=>'APEX.IG.EMAIL_TO'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05DE\05E2\05DF (\05D0\05DC)')
,p_is_js_message=>true
,p_version_scn=>2704893
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139204879110751373)
,p_name=>'APEX.IG.ENABLED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05E4\05E9\05E8\05D9')
,p_is_js_message=>true
,p_version_scn=>2704882
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139198085158751371)
,p_name=>'APEX.IG.EQUALS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D5\05D5\05D4')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139204938539751373)
,p_name=>'APEX.IG.EXPRESSION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D9\05D8\05D5\05D9')
,p_is_js_message=>true
,p_version_scn=>2704882
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139249932391751386)
,p_name=>'APEX.IG.FD_TYPE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D5\05D2')
,p_is_js_message=>true
,p_version_scn=>2704893
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139217121528751376)
,p_name=>'APEX.IG.FILE_PREPARED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E7\05D5\05D1\05E5 \05DE\05D5\05DB\05DF. \05DE\05EA\05D7\05D9\05DC \05D1\05D4\05D5\05E8\05D3\05D4.')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139179487347751365)
,p_name=>'APEX.IG.FILL'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D9\05DC\05D5\05D9')
,p_is_js_message=>true
,p_version_scn=>2704877
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139181649269751366)
,p_name=>'APEX.IG.FILL_LABEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05D9\05E8\05EA \05DE\05D9\05DC\05D5\05D9 \05E2\05DD')
,p_is_js_message=>true
,p_version_scn=>2704878
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139181507882751366)
,p_name=>'APEX.IG.FILL_TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05D9\05E8\05EA \05DE\05D9\05DC\05D5\05D9')
,p_is_js_message=>true
,p_version_scn=>2704878
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139171249056751363)
,p_name=>'APEX.IG.FILTER'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05E0\05DF')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139204231750751373)
,p_name=>'APEX.IG.FILTERS'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E1\05E0\05E0\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704882
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139257927248751389)
,p_name=>'APEX.IG.FILTER_WITH_DOTS'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E1\05E0\05DF...')
,p_is_js_message=>true
,p_version_scn=>2704896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139243969957751384)
,p_name=>'APEX.IG.FIRST'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05D0\05E9\05D5\05DF')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139171495550751363)
,p_name=>'APEX.IG.FLASHBACK'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05DC\05D0\05E9\05D1\05E7')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139202778371751372)
,p_name=>'APEX.IG.FORMAT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05D5\05E8\05DE\05D8')
,p_is_js_message=>true
,p_version_scn=>2704881
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139248505110751386)
,p_name=>'APEX.IG.FORMATMASK'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E1\05DB\05EA \05EA\05D1\05E0\05D9\05EA')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139250291833751386)
,p_name=>'APEX.IG.FORMAT_CSV'
,p_message_language=>'he'
,p_message_text=>'CSV'
,p_is_js_message=>true
,p_version_scn=>2704893
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139250130920751386)
,p_name=>'APEX.IG.FORMAT_HTML'
,p_message_language=>'he'
,p_message_text=>'HTML'
,p_is_js_message=>true
,p_version_scn=>2704893
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139161296946751360)
,p_name=>'APEX.IG.FORMAT_PDF'
,p_message_language=>'he'
,p_message_text=>'PDF'
,p_is_js_message=>true
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139095199336751340)
,p_name=>'APEX.IG.FORMAT_XLSX'
,p_message_language=>'he'
,p_message_text=>'Excel'
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139207366188751374)
,p_name=>'APEX.IG.FREEZE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E7\05E4\05D0')
,p_is_js_message=>true
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139205046978751373)
,p_name=>'APEX.IG.FUNCTIONS_AND_OPERATORS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05D5\05E0\05E7\05E6\05D9\05D5\05EA \05D5\05D0\05D5\05E4\05E8\05D8\05D5\05E8\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704882
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139242176975751384)
,p_name=>'APEX.IG.FUNNEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E9\05E4\05DA')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139223832793751378)
,p_name=>'APEX.IG.GO'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D9\05E6\05D5\05E2')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139198619756751371)
,p_name=>'APEX.IG.GREATER_THAN'
,p_message_language=>'he'
,p_message_text=>unistr('\05D2\05D3\05D5\05DC \05DE-')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139198762464751371)
,p_name=>'APEX.IG.GREATER_THAN_OR_EQUALS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D2\05D3\05D5\05DC \05D0\05D5 \05E9\05D5\05D5\05D4 \05DC-')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139205305492751373)
,p_name=>'APEX.IG.GRID'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05E8\05D9\05D2 \05E0\05EA\05D5\05E0\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704882
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139170441870751363)
,p_name=>'APEX.IG.GRID_VIEW'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05E6\05D5\05D2\05D4 \05D8\05D1\05DC\05D0\05D9\05EA')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139244712119751385)
,p_name=>'APEX.IG.GROUP'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D1\05D5\05E6\05D4')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139205595870751373)
,p_name=>'APEX.IG.GROUP_BY'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D1\05E5 \05DC\05E4\05D9')
,p_is_js_message=>true
,p_version_scn=>2704882
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139170748657751363)
,p_name=>'APEX.IG.GROUP_BY_VIEW'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05E6\05D5\05D2\05EA ''\05E7\05D1\05E5 \05DC\05E4\05D9''')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139249121078751386)
,p_name=>'APEX.IG.HD_TYPE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D5\05D2 \05EA\05E0\05D0\05D9')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139248099574751386)
,p_name=>'APEX.IG.HEADING'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D5\05EA\05E8\05EA')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139248222487751386)
,p_name=>'APEX.IG.HEADING_ALIGN'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05D9\05E9\05D5\05E8 \05DB\05D5\05EA\05E8\05EA')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139257884029751389)
,p_name=>'APEX.IG.HELP'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D6\05E8\05D4')
,p_is_js_message=>true
,p_version_scn=>2704896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139253368845751387)
,p_name=>'APEX.IG.HELP.ACTIONS.EDITING'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\05D0\05EA\05D4 \05D9\05DB\05D5\05DC \05DC\05D4\05D5\05E1\05D9\05E3, \05DC\05E2\05D3\05DB\05DF \05D5\05DC\05DE\05D7\05D5\05E7 \05E0\05EA\05D5\05E0\05D9\05DD \05D9\05E9\05D9\05E8\05D5\05EA \05D1\05EA\05D5\05DA \05E8\05E9\05EA \05D0\05D9\05E0\05D8\05E8\05D0\05E7\05D8\05D9\05D1\05D9\05EA \05D6\05D5.</p>'),
'',
unistr('<p>\05D4\05D5\05E1\05E3 \05E9\05D5\05E8\05D4 \05D7\05D3\05E9\05D4 \05E2\05DC \05D9\05D3\05D9 \05DC\05D7\05D9\05E6\05D4 \05E2\05DC \05D4\05DC\05D7\05E6\05DF ''\05D4\05D5\05E1\05E3 \05E9\05D5\05E8\05D4''.</p>'),
'',
unistr('<p>\05E2\05E8\05D5\05DA \05E0\05EA\05D5\05E0\05D9\05DD \05E7\05D9\05D9\05DE\05D9\05DD \05E2\05DC \05D9\05D3\05D9 \05DC\05D7\05D9\05E6\05D4 \05DB\05E4\05D5\05DC\05D4 \05E2\05DC \05EA\05D0 \05E1\05E4\05E6\05D9\05E4\05D9. \05DC\05E2\05D1\05D5\05D3\05EA \05E2\05E8\05D9\05DB\05D4 \05D2\05D3\05D5\05DC\05D4 \05D9\05D5\05EA\05E8, \05DC\05D7\05E5 \05E2\05DC ''\05E2\05E8\05D5\05DA'' \05DB\05D3\05D9 \05DC\05D4\05D9\05DB\05E0\05E1 \05DC\05DE\05E6\05D1 \05E2\05E8\05D9\05DB\05D4. \05D1\05DE\05E6\05D1 \05E2\05E8\05D9\05DB\05D4, \05D0\05EA\05D4 \05D9\05DB\05D5\05DC \05DC\05DC\05D7\05D5\05E5 \05DC\05D7\05D9\05E6\05D4 \05D9\05D7\05D9\05D3\05D4 \05D0\05D5 \05DC\05D4\05E9\05EA\05DE\05E9 \05D1\05DE\05E7\05DC\05D3\05EA \05DB\05D3\05D9 \05DC\05E2\05E8\05D5\05DA \05EA\05D0\05D9\05DD \05E1\05E4\05E6\05D9\05E4\05D9\05D9\05DD.</p>'),
'',
unistr('<p>\05D4\05E9\05EA\05DE\05E9 \05D1\05EA\05E4\05E8\05D9\05D8 ''\05E9\05E0\05D4'' \05DB\05D3\05D9 \05DC\05E9\05DB\05E4\05DC \05D5\05DC\05DE\05D7\05D5\05E7 \05E9\05D5\05E8\05D5\05EA. \05DB\05D3\05D9 \05DC\05D0\05E4\05E9\05E8 \05D0\05EA \05D4\05EA\05E4\05E8\05D9\05D8 ''\05E9\05E0\05D4'', \05D4\05E9\05EA\05DE\05E9 \05D1\05EA\05D9\05D1\05D5\05EA \05D4\05EA\05D9\05D5\05D2 \05DC\05D1\05D7\05D9\05E8\05EA \05E9\05D5\05E8\05D4 \05D0\05D7\05EA \05D0\05D5 \05D9\05D5\05EA\05E8.</p>'),
'',
unistr('<p>\05E9\05DB\05E4\05DC \05E9\05D5\05E8\05D4 \05E9\05E0\05D1\05D7\05E8\05D4 \05E2\05DC \05D9\05D3\05D9 \05DC\05D7\05D9\05E6\05D4 \05E2\05DC \05D4\05EA\05E4\05E8\05D9\05D8 ''\05E9\05E0\05D4'' \05D5\05D1\05D7\05D9\05E8\05EA ''\05E9\05DB\05E4\05DC \05E9\05D5\05E8\05D5\05EA''. \05DE\05D7\05E7 \05E9\05D5\05E8\05D4 \05E9\05E0\05D1\05D7\05E8\05D4 \05E2\05DC \05D9\05D3\05D9 \05DC\05D7\05D9\05E6\05D4 \05E2\05DC \05EA\05E4\05E8\05D9\05D8 ''\05E9\05E0\05D4'' \05D5\05D1\05D7\05D9\05E8\05D4 \05D1''\05DE\05D7\05E7 \05E9\05D5\05E8\05D4''.</p>')))
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139255481276751388)
,p_name=>'APEX.IG.HELP.ACTIONS.EDITING_HEADING'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05DB\05D5\05DC\05D5\05EA \05E2\05E8\05D9\05DB\05D4')
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139255538699751388)
,p_name=>'APEX.IG.HELP.ACTIONS.INTRO'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\05E8\05E9\05EA \05D0\05D9\05E0\05D8\05E8\05D0\05E7\05D8\05D9\05D1\05D9\05EA \05DE\05E6\05D9\05D2\05D4 \05E1\05DC \05E0\05EA\05D5\05E0\05D9\05DD \05D1\05D3\05D5\05D7 \05E0\05D9\05EA\05DF \05DC\05D7\05D9\05E4\05D5\05E9 \05D5\05DC\05D4\05EA\05D0\05DE\05D4 \05D0\05D9\05E9\05D9\05EA. \05D0\05EA\05D4 \05D9\05DB\05D5\05DC \05DC\05D1\05E6\05E2 \05E4\05E2\05D5\05DC\05D5\05EA \05E8\05D1\05D5\05EA \05DB\05D3\05D9 \05DC\05D4\05D2\05D1\05D9\05DC \05D0\05EA \05DE\05E1\05E4\05E8 \05D4\05E8\05E9\05D5\05DE\05D5\05EA \05E9\05D9\05D0\05D5\05D7\05D6\05E8\05D5 \05D5\05DC\05E9\05E0\05D5\05EA \05D0\05EA \05D4\05D0\05D5\05E4\05DF \05E9\05D1\05D5 \05D4\05E0\05EA\05D5\05E0\05D9\05DD \05DE\05D5\05E6\05D2\05D9\05DD.</p>'),
'',
unistr('<p>\05D4\05E9\05EA\05DE\05E9 \05D1\05E9\05D3\05D4 ''\05D7\05D9\05E4\05D5\05E9'' \05DB\05D3\05D9 \05DC\05E1\05E0\05DF \05D0\05EA \05D4\05E8\05E9\05D5\05DE\05D5\05EA \05E9\05D0\05D5\05D7\05D6\05E8\05D5. \05DC\05D7\05E5 \05E2\05DC ''\05E4\05E2\05D5\05DC\05D5\05EA'' \05DB\05D3\05D9 \05DC\05D2\05E9\05EA \05DC\05D0\05E4\05E9\05E8\05D5\05D9\05D5\05EA \05E8\05D1\05D5\05EA \05DC\05E9\05D9\05E0\05D5\05D9 \05DE\05EA\05D5\05D5\05D4 \05D4\05D3\05D5\05D7, \05D0\05D5 \05D4\05E9\05EA\05DE\05E9 \05D1\05EA\05E4\05E8\05D9\05D8\05D9 ''\05DB\05D5\05EA\05E8\05EA \05E2\05DE\05D5\05D3\05D4'' \05E2\05DC \05D4\05E2\05DE\05D5\05D3\05D5\05EA \05D4\05DE\05D5\05E6\05D2\05D5\05EA.</p>'),
'',
unistr('<p>\05D4\05E9\05EA\05DE\05E9 \05D1''\05D4\05D2\05D3\05E8\05D5\05EA \05D3\05D5\05D7'' \05DB\05D3\05D9 \05DC\05E9\05DE\05D5\05E8 \05D0\05EA \05D4\05D4\05EA\05D0\05DE\05D5\05EA \05D4\05D0\05D9\05E9\05D9\05D5\05EA \05E9\05DC\05DA \05D1\05D3\05D5\05D7. \05EA\05D5\05DB\05DC \05D2\05DD \05DC\05D4\05D5\05E8\05D9\05D3 \05D0\05EA \05D4\05E0\05EA\05D5\05E0\05D9\05DD \05DE\05D4\05D3\05D5\05D7 \05DC\05E7\05D5\05D1\05E5 \05D7\05D9\05E6\05D5\05E0\05D9 \05D0\05D5 \05DC\05E9\05DC\05D5\05D7 \05D0\05D5\05EA\05DD \05D1\05D3\05D5\05D0"\05DC \05DC\05E2\05E6\05DE\05DA \05D0\05D5 \05DC\05D0\05D7\05E8\05D9\05DD.</p>'),
'',
unistr('<p>\05DC\05E7\05D1\05DC\05EA \05DE\05D9\05D3\05E2 \05E0\05D5\05E1\05E3, \05E2\05D9\05D9\05DF \05D1\05E4\05E8\05E7 "Using Interactive Grids" (\05E9\05D9\05DE\05D5\05E9 \05D1\05E8\05E9\05EA\05D5\05EA \05D0\05D9\05E0\05D8\05E8\05D0\05E7\05D8\05D9\05D1\05D9\05D5\05EA) \05D1\05DE\05D3\05E8\05D9\05DA <em>Oracle APEX End User''s Guide</em>.')))
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139255234665751388)
,p_name=>'APEX.IG.HELP.ACTIONS.INTRO_HEADING'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D1\05D8 \05DB\05DC\05DC\05D9')
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139253294349751387)
,p_name=>'APEX.IG.HELP.ACTIONS.REPORTING'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\05D0\05EA\05D4 \05D9\05DB\05D5\05DC \05DC\05D4\05EA\05D0\05D9\05DD \05D0\05D9\05E9\05D9\05EA \05D0\05EA \05D4\05E8\05E9\05EA \05D4\05D0\05D9\05E0\05D8\05E8\05D0\05E7\05D8\05D9\05D1\05D9\05EA \05DB\05D3\05D9 \05E9\05EA\05E6\05D9\05D2 \05E0\05EA\05D5\05E0\05D9\05DD \05D1\05DE\05E1\05E4\05E8 \05D3\05E8\05DB\05D9\05DD \05E9\05D5\05E0\05D5\05EA \05D1\05D0\05DE\05E6\05E2\05D5\05EA \05D4\05D9\05DB\05D5\05DC\05D5\05EA \05D4\05DE\05D5\05D1\05E0\05D5\05EA.</p>'),
'',
unistr('<p>\05D4\05E9\05EA\05DE\05E9 \05D1\05EA\05E4\05E8\05D9\05D8\05D9 ''\05DB\05D5\05EA\05E8\05D5\05EA \05E2\05DE\05D5\05D3\05D5\05EA'' \05D0\05D5 \05D1\05EA\05E4\05E8\05D9\05D8 ''\05E4\05E2\05D5\05DC\05D5\05EA'' \05DB\05D3\05D9 \05DC\05E7\05D1\05D5\05E2 \05D0\05D9\05D6\05D4 \05E2\05DE\05D5\05D3\05D5\05EA \05DC\05D4\05E6\05D9\05D2, \05D1\05D0\05D9\05D6\05D4 \05E1\05D3\05E8, \05D5\05DC\05D4\05E7\05E4\05D9\05D0 \05E2\05DE\05D5\05D3\05D5\05EA. \05D0\05EA\05D4 \05D2\05DD \05D9\05DB\05D5\05DC \05DC\05D4\05D2\05D3\05D9\05E8 \05DE\05E1\05E0\05E0\05D9 \05E0\05EA\05D5\05E0\05D9\05DD \05E9\05D5\05E0\05D9\05DD \05D5\05DC\05DE\05D9\05D9\05DF \05D0\05EA \05D4\05E0\05EA\05D5\05E0\05D9\05DD \05D4\05DE\05D5\05D7\05D6\05E8\05D9\05DD.</p>'),
'',
unistr('<p>\05D4\05E9\05EA\05DE\05E9 \05D1\05DC\05D7\05E6\05DF ''\05D4\05E6\05D2'' (\05D4\05E1\05DE\05D5\05DA \05DC\05E9\05D3\05D4 \05D4\05D7\05D9\05E4\05D5\05E9) \05DB\05D3\05D9 \05DC\05D2\05E9\05EA \05DC\05EA\05E6\05D5\05D2\05D5\05EA \05E0\05EA\05D5\05E0\05D9\05DD \05D0\05D7\05E8\05D5\05EA \05E9\05D0\05D5\05DC\05D9 \05D4\05D5\05D2\05D3\05E8\05D5 \05E2\05DC \05D9\05D3\05D9 \05DE\05E4\05EA\05D7 \05D4\05D9\05D9\05E9\05D5\05DD. \05D0\05EA\05D4 \05D2\05DD \05D9\05DB\05D5\05DC \05DC\05D9\05E6\05D5\05E8 \05EA\05E8\05E9\05D9\05DD \05D0\05D5 \05DC\05D4\05E6\05D9\05D2 \05EA\05E8\05E9\05D9\05DD \05E7\05D9\05D9\05DD.</p>  '),
'',
unistr('<p><em>\05D4\05E2\05E8\05D4: \05DC\05D7\05E5 \05E2\05DC <strong>\05E2\05D6\05E8\05D4</strong> \05D1\05EA\05D9\05D1\05D5\05EA \05D4\05D3\05D5-\05E9\05D9\05D7 \05E9\05DC \05D4\05E8\05E9\05EA \05D4\05D0\05D9\05E0\05D8\05E8\05D0\05E7\05D8\05D9\05D1\05D9\05EA \05DB\05D3\05D9 \05DC\05E7\05D1\05DC \05DE\05D9\05D3\05E2 \05DE\05E4\05D5\05E8\05D8 \05D9\05D5\05EA\05E8 \05E2\05DC \05D4\05E4\05D5\05E0\05E7\05E6\05D9\05D4 \05E9\05E0\05D1\05D7\05E8\05D4.</em></p>')))
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139255341561751388)
,p_name=>'APEX.IG.HELP.ACTIONS.REPORTING_HEADING'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05DB\05D5\05DC\05D5\05EA \05D3\05D9\05D5\05D5\05D7')
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139206378020751373)
,p_name=>'APEX.IG.HELP.ACTIONS_TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D6\05E8\05D4 \05DC\05E1\05E8\05D9\05D2 \05D0\05D9\05E0\05D8\05E8\05D0\05E7\05D8\05D9\05D1\05D9')
,p_is_js_message=>true
,p_version_scn=>2704882
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139252100938751387)
,p_name=>'APEX.IG.HELP.AGGREGATE'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\05D4\05E9\05EA\05DE\05E9 \05D1\05EA\05D9\05D1\05EA \05D3\05D5-\05E9\05D9\05D7 \05D6\05D5 \05DB\05D3\05D9 \05DC\05E1\05DB\05DD \05E2\05DE\05D5\05D3\05D5\05EA. \05E2\05E8\05DB\05D9\05DD \05DE\05E1\05D5\05DB\05DE\05D9\05DD \05DE\05D5\05E6\05D2\05D9\05DD \05D1\05EA\05D7\05EA\05D9\05EA \05D4\05E0\05EA\05D5\05E0\05D9\05DD, \05D0\05D5 \05D1\05EA\05D7\05EA\05D9\05EA \05E9\05DC \05DB\05DC break \05D0\05DD \05DE\05D5\05D2\05D3\05E8\05D9\05DD Control Breaks.</p>'),
'',
unistr('<p><strong>\05E8\05E9\05D9\05DE\05EA \05E1\05DB\05D9\05DE\05D4</strong><br>'),
unistr('\05E8\05E9\05D9\05DE\05EA \05D4\05E1\05DB\05D9\05DE\05D4 \05DE\05E6\05D9\05D2\05D4 \05E1\05DB\05D9\05DE\05D5\05EA \05DE\05D5\05D2\05D3\05E8\05D5\05EA. \05D7\05E1\05D5\05DD \05E1\05DB\05D9\05DE\05D4 \05E7\05D9\05D9\05DE\05EA \05E2\05DC \05D9\05D3\05D9 \05D1\05D9\05D8\05D5\05DC \05D4\05D1\05D7\05D9\05E8\05D4 \05D1\05D4.<br>'),
unistr('\05DC\05D7\05E5 \05E2\05DC \05D4\05D5\05E1\05E3 ( &plus; ) \05DB\05D3\05D9 \05DC\05D9\05E6\05D5\05E8 \05E1\05DB\05D9\05DE\05D4 \05D7\05D3\05E9\05D4, \05D0\05D5 \05E2\05DC \05DE\05D7\05E7 ( &minus; ) \05DB\05D3\05D9 \05DC\05D4\05E1\05D9\05E8 \05E1\05DB\05D9\05DE\05D4 \05E7\05D9\05D9\05DE\05EA.</p>'),
'',
unistr('<p><strong>\05D4\05D2\05D3\05E8\05D5\05EA \05E1\05DB\05D9\05DE\05D4</strong><br>'),
unistr('\05D4\05E9\05EA\05DE\05E9 \05D1\05D8\05D5\05E4\05E1 \05D1\05E6\05D3 \05E9\05DE\05D0\05DC \05DB\05D3\05D9 \05DC\05D4\05D2\05D3\05D9\05E8 \05D0\05EA \05D4\05E1\05DB\05D9\05DE\05D4.<br>'),
unistr('\05D1\05D7\05E8 \05D0\05EA \05E9\05DD \05D4\05E2\05DE\05D5\05D3\05D4 \05D5\05D0\05EA \05E1\05D5\05D2 \05D4\05E1\05DB\05D9\05DE\05D4.<br>'),
unistr('\05DB\05D0\05D5\05E4\05E6\05D9\05D4, \05D4\05D6\05DF \05E8\05DE\05D6 \05E6\05E5 \05D1\05E9\05D1\05D9\05DC \05D4\05E1\05DB\05D9\05DE\05D4.<br>'),
unistr('\05D0\05DD \05D4\05D2\05D3\05E8\05EA Control Break, \05D1\05D7\05D9\05E8\05D4 \05D1<strong>\05D4\05E6\05D2 \05E2\05E8\05DA \05DB\05D5\05DC\05DC</strong> \05DE\05E6\05D9\05D2\05D4 \05D4\05DE\05DE\05D5\05E6\05E2 \05D4\05DB\05D5\05DC\05DC, \05D4\05E1\05D4"\05DB \05D4\05DB\05D5\05DC\05DC \05D0\05D5 \05E2\05E8\05DA \05DB\05D5\05DC\05DC \05D3\05D5\05DE\05D4 \05D1\05EA\05D7\05EA\05D9\05EA \05D4\05E0\05EA\05D5\05E0\05D9\05DD.</p>'),
'',
unistr('<p><em>\05D4\05E2\05E8\05D4: \05E2\05D1\05D5\05E8 \05DC\05EA\05D9\05D1\05EA \05D4\05D3\05D5-\05E9\05D9\05D7 ''\05E1\05DB\05D9\05DE\05D4'' \05D1\05EA\05E4\05E8\05D9\05D8 ''\05E4\05E2\05D5\05DC\05D5\05EA'' \05D0\05D5 \05E2\05DC \05D9\05D3\05D9 \05DC\05D7\05D9\05E6\05D4 \05E2\05DC \05DB\05D5\05EA\05E8\05EA \05D4\05E2\05DE\05D5\05D3\05D4 \05D5\05E1\05DB\05DD ( &sum; ).</em></p>')))
,p_version_scn=>2704893
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139254385489751387)
,p_name=>'APEX.IG.HELP.AGGREGATE_TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D6\05E8\05D4 \05DC\05E1\05DB\05D9\05DE\05D4')
,p_is_js_message=>true
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139252827965751387)
,p_name=>'APEX.IG.HELP.CHART'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\05D4\05E9\05EA\05DE\05E9 \05D1\05EA\05D9\05D1\05EA \05D3\05D5-\05E9\05D9\05D7 \05D6\05D5 \05DB\05D3\05D9 \05DC\05D4\05D2\05D3\05D9\05E8 \05EA\05E8\05E9\05D9\05DD \05D4\05DE\05D5\05E6\05D2 \05DB\05EA\05E6\05D5\05D2\05EA \05E0\05EA\05D5\05E0\05D9\05DD \05E0\05E4\05E8\05D3\05EA.<br>'),
unistr('\05D1\05D7\05E8 \05E1\05D5\05D2 \05EA\05E8\05E9\05D9\05DD \05D5\05EA\05DB\05D5\05E0\05D5\05EA \05EA\05E8\05E9\05D9\05DD.</p>'),
unistr('<p><strong>\05EA\05DB\05D5\05E0\05D5\05EA \05EA\05E8\05E9\05D9\05DD</strong><br>'),
unistr('\05EA\05DB\05D5\05E0\05D5\05EA \05D4\05EA\05E8\05E9\05D9\05DD \05D4\05D6\05DE\05D9\05E0\05D5\05EA \05DE\05E9\05EA\05E0\05D5\05EA \05D1\05D4\05EA\05D0\05DD \05DC\05E1\05D5\05D2 \05D4\05EA\05E8\05E9\05D9\05DD.</p>'),
'<p>',
'<ul>',
unistr('  <li>\05D1\05D7\05E8 \05D0\05EA \05D4\05E2\05DE\05D5\05D3\05D4 \05D4\05DE\05DB\05D9\05DC\05D4 \05D0\05EA \05D4\05E2\05E8\05DA \05DC\05EA\05DB\05D5\05E0\05D4:'),
'    <ul>',
unistr('      <li>\05EA\05D5\05D5\05D9\05EA - \05D4\05D8\05E7\05E1\05D8 \05DC\05DB\05DC \05E0\05E7\05D5\05D3\05EA \05E0\05EA\05D5\05E0\05D9\05DD.</li>'),
unistr('      <li>\05E2\05E8\05DA - \05D4\05E0\05EA\05D5\05E0\05D9\05DD \05E9\05D9\05E9 \05DC\05E9\05E8\05D8\05D8.</li>'),
unistr('      <li>\05E1\05D3\05E8\05D4 - \05DC\05D4\05D2\05D3\05E8\05EA \05D4\05E9\05D0\05D9\05DC\05EA\05D0 \05D4\05D3\05D9\05E0\05DE\05D9\05EA \05E2\05DD \05E8\05D9\05D1\05D5\05D9 \05D4\05E1\05D3\05E8\05D5\05EA \05E9\05DC\05DA.</li>'),
unistr('      <li>\05E4\05EA\05D5\05D7 - \05DE\05D7\05D9\05E8 \05E4\05EA\05D9\05D7\05EA \05D4\05DE\05DC\05D0\05D9 \05D4\05D9\05D5\05DE\05D9 (\05DE\05DC\05D0\05D9 \05D1\05DC\05D1\05D3).</li>'),
unistr('      <li>\05E1\05D2\05D5\05E8 - \05DE\05D7\05D9\05E8 \05E1\05D2\05D9\05E8\05EA \05D4\05DE\05DC\05D0\05D9 \05D4\05D9\05D5\05DE\05D9 (\05DE\05DC\05D0\05D9 \05D1\05DC\05D1\05D3).</li>'),
unistr('      <li>\05D2\05D1\05D5\05D4 - \05D4\05E2\05E8\05DA \05D4\05D2\05D1\05D5\05D4 (\05D8\05D5\05D5\05D7 \05D5\05DE\05DC\05D0\05D9 \05D1\05DC\05D1\05D3).</li>'),
unistr('      <li>\05E0\05DE\05D5\05DA - \05D4\05E2\05E8\05DA \05D4\05E0\05DE\05D5\05DA (\05D8\05D5\05D5\05D7 \05D5\05DE\05DC\05D0\05D9 \05D1\05DC\05D1\05D3).</li>'),
unistr('      <li>\05E0\05E4\05D7 - \05E0\05E4\05D7 \05D4\05DE\05DC\05D0\05D9 \05D4\05D9\05D5\05DE\05D9 (\05DE\05DC\05D0\05D9 \05D1\05DC\05D1\05D3).</li>'),
unistr('      <li>\05D9\05E2\05D3 - \05E2\05E8\05DA \05D4\05D9\05E2\05D3 (\05DE\05E9\05E4\05DA \05D1\05DC\05D1\05D3).</li>'),
unistr('      <li>X - \05E2\05E8\05DA \05E6\05D9\05E8 \05D4-x (\05EA\05E8\05E9\05D9\05DD \05D1\05D5\05E2\05D5\05EA \05D5\05D2\05E8\05E3 \05E4\05D9\05D6\05D5\05E8 \05D1\05DC\05D1\05D3).</li>'),
unistr('      <li>Y - \05E2\05E8\05DA \05E6\05D9\05E8 \05D4-y (\05EA\05E8\05E9\05D9\05DD \05D1\05D5\05E2\05D5\05EA \05D5\05D2\05E8\05E3 \05E4\05D9\05D6\05D5\05E8 \05D1\05DC\05D1\05D3).</li>'),
unistr('      <li>Z- \05E8\05D5\05D7\05D1 \05D4\05E2\05DE\05D5\05D3\05D4 \05D0\05D5 \05E8\05D3\05D9\05D5\05E1 \05EA\05E8\05E9\05D9\05DD \05D4\05D1\05D5\05E2\05D5\05EA (\05E2\05DE\05D5\05D3\05D4, \05EA\05E8\05E9\05D9\05DD \05D1\05D5\05E2\05D5\05EA \05D5\05D8\05D5\05D5\05D7 \05D1\05DC\05D1\05D3).</li>'),
'    </ul>',
'  </li>',
unistr('  <li>\05DB\05D9\05D5\05D5\05DF \05D4\05D4\05D3\05E4\05E1\05D4 - \05D0\05E0\05DB\05D9 \05D0\05D5 \05D0\05D5\05E4\05E7\05D9.</li>'),
unistr('  <li>\05E1\05DB\05D9\05DE\05D4 - \05D1\05D7\05E8 \05DB\05D9\05E6\05D3 \05DC\05E1\05DB\05D5\05DD \05D0\05EA \05E2\05E8\05DB\05D9 \05D4\05EA\05E8\05E9\05D9\05DD.</li>'),
unistr('  <li>\05E2\05E8\05D9\05DE\05D4 - \05E6\05D9\05D9\05DF \05D0\05DD \05E4\05E8\05D9\05D8\05D9 \05D4\05E0\05EA\05D5\05E0\05D9\05DD \05DE\05D5\05E2\05E8\05DE\05D9\05DD.</li>'),
unistr('  <li>\05DE\05D9\05D5\05DF \05DC\05E4\05D9 \2013 \05DE\05D9\05D9\05DF \05DC\05E4\05D9 \05EA\05D5\05D5\05D9\05EA \05D0\05D5 \05E2\05E8\05DB\05D9\05DD.'),
'    <ul>',
unistr('      <li>\05DB\05D9\05D5\05D5\05DF - \05DE\05D9\05D9\05DF \05E2\05E8\05DB\05D9\05DD \05D1\05E1\05D3\05E8 \05E2\05D5\05DC\05D4 \05D0\05D5 \05D1\05E1\05D3\05E8 \05D9\05D5\05E8\05D3.</li>'),
unistr('      <li>\05E2\05E8\05DB\05D9 Null - \05E6\05D9\05D9\05DF \05DB\05D9\05E6\05D3 \05DC\05DE\05D9\05D9\05DF \05E8\05E9\05D5\05DE\05D5\05EA \05E2\05DD \05E2\05E8\05DB\05D9 null \05D1\05D9\05D7\05E1 \05DC\05E8\05E9\05D5\05DE\05D5\05EA \05E2\05DD \05E2\05E8\05DB\05D9\05DD \05E9\05D0\05D9\05E0\05DD null.</li>'),
'    </ul>',
'  </li>',
unistr('  <li>\05DE\05E7\05D5\05DE\05D5\05EA \05E2\05E9\05E8\05D5\05E0\05D9\05D9\05DD.</li>'),
unistr('  <li>\05DB\05D5\05EA\05E8\05EA \05E6\05D9\05E8 \05EA\05D5\05D5\05D9\05EA</li>'),
unistr('  <li>\05DB\05D5\05EA\05E8\05EA \05E6\05D9\05E8 \05E2\05E8\05DA</li>'),
'</ul>',
'</p>'))
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139254748986751388)
,p_name=>'APEX.IG.HELP.CHART_TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D6\05E8\05D4 \05DC\05EA\05E8\05E9\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139251817607751387)
,p_name=>'APEX.IG.HELP.COLUMNS'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\05D4\05E9\05EA\05DE\05E9 \05D1\05EA\05D9\05D1\05EA \05D3\05D5-\05E9\05D9\05D7 \05D6\05D5 \05DB\05D3\05D9 \05DC\05D1\05D7\05D5\05E8 \05D0\05D9\05D6\05D4 \05E2\05DE\05D5\05D3\05D5\05EA \05DC\05D4\05E6\05D9\05D2 \05D5\05D1\05D0\05D9\05D6\05D4 \05E1\05D3\05E8.</p>'),
'',
unistr('<p>\05D4\05E1\05EA\05E8 \05E2\05DE\05D5\05D3\05D4 \05E2\05DC \05D9\05D3\05D9 \05D1\05D9\05D8\05D5\05DC \05D4\05D1\05D7\05D9\05E8\05D4 \05D1\05D4.<br>'),
unistr('\05E9\05E0\05D4 \05D0\05EA \05E1\05D3\05E8 \05D4\05E2\05DE\05D5\05D3\05D5\05EA \05E2\05DC \05D9\05D3\05D9 \05DC\05D7\05D9\05E6\05D4 \05E2\05DC \05D4\05D6\05D6 \05DE\05E2\05DC\05D4 ( &uarr; ) \05D0\05D5 \05D4\05D6\05D6 \05DE\05D8\05D4 ( &darr; ).<br>'),
unistr('\05D4\05E9\05EA\05DE\05E9 \05D1\05D1\05D5\05E8\05E8 \05D4\05E8\05E9\05D9\05DE\05D4 \05D4\05E0\05E4\05EA\05D7\05EA \05DC\05E7\05D1\05DC\05EA \05E8\05E9\05D9\05DE\05D4 \05E9\05DC \05DB\05DC \05D4\05E2\05DE\05D5\05D3\05D5\05EA, \05D4\05E2\05DE\05D5\05D3\05D5\05EA \05D4\05DE\05D5\05E6\05D2\05D5\05EA \05D0\05D5 \05D4\05E2\05DE\05D5\05D3\05D5\05EA \05D4\05DC\05D0-\05DE\05D5\05E6\05D2\05D5\05EA.</p>'),
'',
unistr('<p>\05DB\05D0\05D5\05E4\05E6\05D9\05D4, \05D4\05E9\05EA\05DE\05E9 \05D1\05D8\05D5\05E4\05E1 \05DB\05D3\05D9 \05DC\05D4\05D2\05D3\05D9\05E8 \05D0\05EA \05D4\05E8\05D5\05D7\05D1 \05D4\05DE\05D9\05E0\05D9\05DE\05DC\05D9 \05E9\05DC \05E2\05DE\05D5\05D3\05D4 \05D1\05E4\05D9\05E7\05E1\05DC\05D9\05DD.</p>'),
'',
unistr('<p><em>\05D4\05E2\05E8\05D4: \05D0\05EA\05D4 \05D9\05DB\05D5\05DC \05D2\05DD \05DC\05E9\05E0\05D5\05EA \05D0\05EA \05D4\05E1\05D3\05E8 \05E9\05DC \05D4\05E2\05DE\05D5\05D3\05D5\05EA \05D4\05DE\05D5\05E6\05D2\05D5\05EA \05E2\05DC \05D9\05D3\05D9 \05DC\05D7\05D9\05E6\05D4 \05E2\05DC \05DE\05E6\05D1\05D9\05E2 \05D4\05D2\05E8\05D9\05E8\05D4 (\05D1\05EA\05D7\05D9\05DC\05EA \05DB\05D5\05EA\05E8\05EA \05D4\05E2\05DE\05D5\05D3\05D4) \05D5\05D2\05E8\05D9\05E8\05EA \05D4\05E2\05DE\05D5\05D3\05D4 \05E9\05DE\05D0\05DC\05D4 \05D0\05D5 \05D9\05DE\05D9\05E0\05D4. \05D0\05EA\05D4 \05D9\05DB\05D5\05DC \05D2\05DD \05DC\05E9\05E0\05D5\05EA \05D0\05EA \05D4\05E8\05D5\05D7\05D1 \05E9\05DC \05E2\05DE\05D5\05D3\05D5\05EA \05DE\05D5\05E6\05D2\05D5\05EA \05E2\05DC \05D9\05D3\05D9 \05D1\05D7\05D9\05E8\05D4 \05D1\05DE\05E4\05E8\05D9\05D3 \05D4\05E2\05DE\05D5\05D3\05D5\05EA, \05D1\05D9\05DF \05DB\05D5\05EA\05E8\05D5\05EA, \05D5\05D4\05D6\05D6\05EA\05D5 \05E9\05DE\05D0\05DC\05D4 \05D0\05D5 \05D9\05DE\05D9\05E0\05D4</em>')
||'</p>.'))
,p_version_scn=>2704893
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139254613178751388)
,p_name=>'APEX.IG.HELP.COLUMNS_TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D6\05E8\05D4 \05DC\05E2\05DE\05D5\05D3\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139252283556751387)
,p_name=>'APEX.IG.HELP.COMPUTE'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\05D4\05E9\05EA\05DE\05E9 \05D1\05EA\05D9\05D1\05EA \05D3\05D5-\05E9\05D9\05D7 \05D6\05D5 \05DB\05D3\05D9 \05DC\05D4\05D2\05D3\05D9\05E8 \05E2\05DE\05D5\05D3\05D5\05EA \05E0\05D5\05E1\05E4\05D5\05EA \05E2\05DC \05D1\05E1\05D9\05E1 \05D7\05D9\05E9\05D5\05D1\05D9\05DD \05DE\05EA\05DE\05D8\05D9\05D9\05DD \05D5\05E4\05D5\05E0\05E7\05E6\05D9\05D5\05E0\05DC\05D9\05D9\05DD \05D4\05DE\05D1\05D5\05E6\05E2\05D9\05DD \05DE\05D5\05DC \05E2\05DE\05D5\05D3\05D5\05EA \05E7\05D9\05D9\05DE\05D5\05EA.</p>'),
'',
unistr('<p><strong>\05E8\05E9\05D9\05DE\05EA \05D7\05D9\05E9\05D5\05D1\05D9\05DD</strong><br>'),
unistr('\05E8\05E9\05D9\05DE\05EA \05D4\05D7\05D9\05E9\05D5\05D1\05D9\05DD \05DE\05E6\05D9\05D2\05D4 \05D7\05D9\05E9\05D5\05D1\05D9\05DD \05DE\05D5\05D2\05D3\05E8\05D9\05DD. \05D7\05E1\05D5\05DD \05D7\05D9\05E9\05D5\05D1 \05E7\05D9\05D9\05DD \05E2\05DC \05D9\05D3\05D9 \05D1\05D9\05D8\05D5\05DC \05D4\05D1\05D7\05D9\05E8\05D4 \05D1\05D5.<br>'),
unistr('\05DC\05D7\05E5 \05E2\05DC \05D4\05D5\05E1\05E3 ( &plus; ) \05DB\05D3\05D9 \05DC\05D4\05D5\05E1\05D9\05E3 \05D7\05D9\05E9\05D5\05D1 \05D7\05D3\05E9, \05D0\05D5 \05E2\05DC \05DE\05D7\05E7 ( &minus; ) \05DB\05D3\05D9 \05DC\05D4\05E1\05D9\05E8 \05D7\05D9\05E9\05D5\05D1 \05E7\05D9\05D9\05DD.</p>'),
'',
unistr('<p><strong>\05D4\05D2\05D3\05E8\05D5\05EA \05D7\05D9\05E9\05D5\05D1</strong><br>'),
unistr('\05D4\05E9\05EA\05DE\05E9 \05D1\05D8\05D5\05E4\05E1 \05DB\05D3\05D9 \05DC\05D4\05D2\05D3\05D9\05E8 \05D0\05EA\05D4\05D7\05D9\05E9\05D5\05D1.<br>'),
unistr('\05D4\05D6\05DF \05D0\05EA \05E4\05E8\05D8\05D9 \05D4\05E2\05DE\05D5\05D3\05D4 \05DB\05DE\05D5 \05DB\05D5\05EA\05E8\05EA, \05EA\05D5\05D5\05D9\05EA \05D5\05D1\05D7\05E8 \05D4\05D2\05D3\05E8\05D5\05EA \05D9\05D9\05E9\05D5\05E8.<br> '),
unistr('\05D4\05E9\05EA\05DE\05E9 \05D1\05D0\05D6\05D5\05E8 \05D4\05D8\05E7\05E1\05D8 ''\05D1\05D9\05D8\05D5\05D9'' \05DB\05D3\05D9 \05DC\05D4\05D6\05D9\05DF \05D0\05EA \05D4\05E2\05DE\05D5\05D3\05D5\05EA \05D5\05E4\05D5\05E0\05E7\05E6\05D9\05D5\05EA \05E7\05E9\05D5\05E8\05D5\05EA \05D1\05E9\05D1\05D9\05DC \05D4\05D7\05D9\05E9\05D5\05D1.<br>'),
unistr('\05D1\05D7\05E8 \05D1\05E9\05D1\05D9\05DC \05D4\05E2\05DE\05D5\05D3\05D4 \05D4\05D7\05D3\05E9\05D4 \05D0\05EA \05E1\05D5\05D2 \05D4\05E0\05EA\05D5\05E0\05D9\05DD \05D4\05DE\05EA\05D0\05D9\05DD \05D5\05DB\05D0\05D5\05E4\05E6\05D9\05D4 \05DE\05E1\05DB\05EA \05E4\05D5\05E8\05DE\05D8.</p>')))
,p_version_scn=>2704893
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139254259121751387)
,p_name=>'APEX.IG.HELP.COMPUTE_TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D6\05E8\05D4 \05DC\05D7\05D9\05E9\05D5\05D1')
,p_is_js_message=>true
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139252574567751387)
,p_name=>'APEX.IG.HELP.CONTROL_BREAK'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\05D4\05E9\05EA\05DE\05E9 \05D1\05EA\05D9\05D1\05EA \05D3\05D5-\05E9\05D9\05D7 \05D6\05D5 \05DB\05D3\05D9 \05DC\05D4\05D2\05D3\05D9\05E8 control break \05E2\05DC \05E2\05DE\05D5\05D3\05D4 \05D0\05D7\05EA \05D0\05D5 \05D9\05D5\05EA\05E8.</p>'),
'',
unistr('<p><strong>\05E8\05E9\05D9\05DE\05EA Control Break </strong><br>'),
unistr('\05E8\05E9\05D9\05DE\05EA Control Break \05DE\05E6\05D9\05D2\05D4 control breaks \05DE\05D5\05D2\05D3\05E8\05D9\05DD. \05D7\05E1\05D5\05DD \05E2\05DE\05D5\05D3\05EA control break \05E7\05D9\05D9\05DE\05EA \05E2\05DC \05D9\05D3\05D9 \05D1\05D9\05D8\05D5\05DC \05D4\05D1\05D7\05D9\05E8\05D4 \05D1\05D4.<br>'),
unistr('\05DC\05D7\05E5 \05E2\05DC \05D4\05D5\05E1\05E3 ( &plus; ) \05DB\05D3\05D9 \05DC\05DB\05DC\05D5\05DC \05E2\05DE\05D5\05D3\05D4 \05D7\05D3\05E9\05D4 \05D1-control break, \05D0\05D5 \05E2\05DC \05DE\05D7\05E7 ( &minus; ) \05DB\05D3\05D9 \05DC\05D4\05E1\05D9\05E8 \05E2\05DE\05D5\05D3\05D4 \05E7\05D9\05D9\05DE\05EA \05DE\05D4-control break.<br>'),
unistr('\05DC\05E9\05D9\05E0\05D5\05D9 \05E1\05D3\05E8 \05D4\05E2\05DE\05D5\05D3\05D5\05EA, \05DC\05D7\05E5 \05E2\05DC \05D4\05D6\05D6 \05DE\05E2\05DC\05D4 ( &uarr; ) \05D0\05D5 \05E2\05DC \05D4\05D6\05D6 \05DE\05D8\05D4 ( &darr; ) \05DB\05D3\05D9 \05DC\05D4\05D6\05D9\05D6 \05D0\05EA \05D4\05E2\05DE\05D5\05D3\05D4 \05E9\05E0\05D1\05D7\05E8\05D4 \05DE\05E2\05DC\05D4 \05D5\05DE\05D8\05D4 \05D9\05D7\05E1\05D9\05EA \05DC\05E2\05DE\05D5\05D3\05D5\05EA \05D0\05D7\05E8\05D5\05EA.</p>'),
'',
unistr('<p><strong>\05D4\05D2\05D3\05E8\05D5\05EAControl Break</strong><br>'),
unistr('\05D4\05E9\05EA\05DE\05E9 \05D1\05D8\05D5\05E4\05E1 \05DB\05D3\05D9 \05DC\05D4\05D2\05D3\05D9\05E8 \05D0\05EA \05E2\05DE\05D5\05D3\05EA \05D4-control break.<br>'),
unistr('\05D1\05D7\05E8 \05E2\05DE\05D5\05D3\05EA control break, \05DB\05D9\05D5\05D5\05DF \05D4\05DE\05D9\05D5\05DF \05D5\05D0\05D9\05DA \05DC\05E1\05D3\05E8 \05E2\05DE\05D5\05D3\05D5\05EA null (\05E2\05DE\05D5\05D3\05D5\05EA \05DC\05DC\05D0 \05E2\05E8\05DA).</p>'),
'',
unistr('<p><em>\05D4\05E2\05E8\05D4: \05D1\05D6\05DE\05DF \05D4\05E6\05D2\05EA \05D4\05E8\05E9\05EA \05D4\05D0\05D9\05E0\05D8\05E8\05D0\05E7\05D8\05D9\05D1\05D9\05EA, \05D0\05EA\05D4 \05D9\05DB\05D5\05DC \05DC\05D4\05D2\05D3\05D9\05E8 control break \05E2\05DC \05D9\05D3\05D9 \05DC\05D7\05D9\05E6\05D4 \05E2\05DC \05DB\05D5\05EA\05E8\05EA \05E2\05DE\05D5\05D3\05D4 \05D5\05D1\05D7\05D9\05E8\05D4 \05D1\05D0\05D9\05E7\05D5\05DF \05E9\05DC control break.</em></p>')))
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139253942691751387)
,p_name=>'APEX.IG.HELP.CONTROL_BREAK_TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D6\05E8\05D4 \05DC-Control Break')
,p_is_js_message=>true
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139252708402751387)
,p_name=>'APEX.IG.HELP.DOWNLOAD'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\05D4\05E9\05EA\05DE\05E9 \05D1\05EA\05D9\05D1\05EA \05D3\05D5-\05E9\05D9\05D7 \05D6\05D5 \05DB\05D3\05D9 \05DC\05D4\05D5\05E8\05D9\05D3 \05D0\05EA \05DB\05DC \05D4\05E9\05D5\05E8\05D5\05EA \05D4\05E0\05D5\05DB\05D7\05D9\05D5\05EA \05DC\05E7\05D5\05D1\05E5 \05D7\05D9\05E6\05D5\05E0\05D9. \05D4\05E7\05D5\05D1\05E5 \05D9\05DB\05D9\05DC \05E8\05E7 \05D0\05EA \05D4\05E2\05DE\05D5\05D3\05D5\05EA \05D4\05DE\05D5\05E6\05D2\05D5\05EA \05DB\05E8\05D2\05E2, \05EA\05D5\05DA \05E9\05D9\05DE\05D5\05E9 \05D1\05DB\05DC \05D4\05DE\05E1\05E0\05E0\05D9\05DD \05D5\05D4\05DE\05D9\05D5\05E0\05D9\05DD \05E9\05D4\05D5\05D7\05DC\05D5 \05E2\05DC \05D4\05E0\05EA\05D5\05E0\05D9\05DD.</p>'),
'',
unistr('<p>\05D1\05D7\05E8 \05D0\05EA \05E4\05D5\05E8\05DE\05D8 \05D4\05E7\05D5\05D1\05E5 \05D5\05DC\05D7\05E5 \05E2\05DC ''\05D4\05D5\05E8\05D3''.<br>'),
unistr('\05D4\05E2\05E8\05D4: CSV \05DC\05D0 \05D9\05DB\05DC\05D5\05DC \05E2\05D9\05E6\05D5\05D1 \05D8\05E7\05E1\05D8 \05DB\05DE\05D5 \05E1\05DB\05D9\05DE\05D5\05EA \05D5-control breaks.</p>'),
'',
unistr('<p>\05DB\05D3\05D9 \05DC\05E9\05DC\05D5\05D7 \05D0\05EA \05D4\05E7\05D5\05D1\05E5 \05D1\05D3\05D5\05D0"\05DC, \05D1\05D7\05E8 ''\05E9\05DC\05D7 \05DB\05D3\05D5\05D0"\05DC'' \05D5\05D4\05D6\05DF \05D0\05EA \05E4\05E8\05D8\05D9 \05D4\05D3\05D5\05D0"\05DC (\05E0\05DE\05E2\05DF, \05E0\05D5\05E9\05D0 \05D5\05D4\05D5\05D3\05E2\05D4).</p>')))
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139253704134751387)
,p_name=>'APEX.IG.HELP.DOWNLOAD_TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D6\05E8\05D4 \05DC\05D4\05D5\05E8\05D3\05D4')
,p_is_js_message=>true
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139251948046751387)
,p_name=>'APEX.IG.HELP.FILTER'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\05D4\05E9\05EA\05DE\05E9 \05D1\05EA\05D9\05D1\05EA \05D3\05D5-\05E9\05D9\05D7 \05D6\05D5 \05DB\05D3\05D9 \05DC\05D4\05D2\05D3\05D9\05E8 \05DE\05E1\05E0\05E0\05D9 \05E0\05EA\05D5\05E0\05D9\05DD \05E9\05DE\05D2\05D1\05D9\05DC\05D9\05DD \05D0\05EA \05D4\05E9\05D5\05E8\05D5\05EA \05D4\05DE\05D5\05D7\05D6\05E8\05D5\05EA.</p>'),
'',
unistr('<p><strong>\05E8\05E9\05D9\05DE\05EA \05DE\05E1\05E0\05E0\05D9\05DD</strong><br>'),
unistr('\05E8\05E9\05D9\05DE\05EA \05D4\05DE\05E1\05E0\05E0\05D9\05DD \05DE\05E6\05D9\05D2\05D4 \05DE\05E1\05E0\05E0\05D9\05DD \05DE\05D5\05D2\05D3\05E8\05D9\05DD. \05D7\05E1\05D5\05DD \05DE\05E1\05E0\05DF \05E7\05D9\05D9\05DD \05E2\05DC \05D9\05D3\05D9 \05D1\05D9\05D8\05D5\05DC \05D4\05D1\05D7\05D9\05E8\05D4 \05D1\05D5.<br>'),
unistr('\05DC\05D7\05E5 \05E2\05DC \05D4\05D5\05E1\05E3 ( &plus; ) \05DB\05D3\05D9 \05DC\05D9\05E6\05D5\05E8 \05DE\05E1\05E0\05DF \05D7\05D3\05E9, \05D0\05D5 \05E2\05DC \05DE\05D7\05E7 ( &minus; ) \05DB\05D3\05D9 \05DC\05D4\05E1\05D9\05E8 \05DE\05E1\05E0\05DF \05E7\05D9\05D9\05DD.</p>'),
'',
unistr('<p><strong>\05D4\05D2\05D3\05E8\05D5\05EA \05DE\05E1\05E0\05DF</strong><br>'),
unistr('\05D4\05E9\05EA\05DE\05E9 \05D1\05D8\05D5\05E4\05E1 \05DB\05D3\05D9 \05DC\05D4\05D2\05D3\05D9\05E8 \05D0\05EA \05DE\05D0\05E4\05D9\05D9\05E0\05D9 \05D4\05DE\05E1\05E0\05DF.<br>'),
unistr('\05D1\05E8 \05D0\05EA \05E1\05D5\05D2 \05D4\05DE\05E1\05E0\05DF \05D4\05DE\05EA\05D0\05D9\05DD:<br>'),
unistr('&nbsp;&nbsp;&nbsp;Row - \05E1\05E0\05DF \05DC\05DE\05D5\05E0\05D7 \05D1\05DB\05DC \05E2\05DE\05D5\05D3\05D4 \05D4\05E0\05D9\05EA\05E0\05EA \05DC\05E1\05D9\05E0\05D5\05DF.<br>'),
unistr('&nbsp;&nbsp;&nbsp;Column - \05E1\05E0\05DF \05E2\05DE\05D5\05D3\05D4 \05E1\05E4\05E6\05D9\05E4\05D9\05EA \05E2\05DD \05D0\05D5\05E4\05E8\05D8\05D5\05E8 \05D5\05E2\05E8\05DA \05DE\05D5\05D2\05D3\05E8\05D9\05DD.</p>'),
'',
unistr('<p><em>\05D4\05E2\05E8\05D4: \05D1\05D6\05DE\05DF \05D4\05E6\05D2\05EA \05D4\05E8\05E9\05EA \05D4\05D0\05D9\05E0\05D8\05E8\05D0\05E7\05D8\05D9\05D1\05D9\05EA, \05D0\05EA\05D4 \05D9\05DB\05D5\05DC \05DC\05D4\05D2\05D3\05D9\05E8 \05DE\05E1\05E0\05E0\05D9 \05E9\05D5\05E8\05D4 \05E2\05DC \05D9\05D3\05D9 \05D4\05E7\05DC\05D3\05D4 \05D9\05E9\05D9\05E8\05D5\05EA \05D1\05E9\05D3\05D4 ''\05D7\05E4\05E9''. \05DC\05D7\05E5 \05E2\05DC ''\05D1\05D7\05E8 \05E2\05DE\05D5\05D3\05D5\05EA \05DC\05D7\05D9\05E4\05D5\05E9'' \05DB\05D3\05D9 \05DC\05D4\05D2\05D1\05D9\05DC \05D0\05EA \05D4\05D7\05D9\05E4\05D5\05E9 \05DC\05E2\05DE\05D5\05D3\05D4 \05E1\05E4\05E6\05D9\05E4\05D9\05EA. \05DC\05D7\05DC\05D5\05E4\05D9\05DF, \05E4\05EA\05D7 \05EA\05E4\05E8\05D9\05D8 ''\05DB\05D5\05EA\05E8\05EA \05E2\05DE\05D5\05D3\05D4'' \05D5\05D1\05D7\05E8 \05E2\05E8\05DA \05DB\05D3\05D9 \05DC\05D9\05E6\05D5\05E8 \05DE\05E1\05E0\05DF \05E2\05DE\05D5\05D3\05D5\05EA.</em></p>')))
,p_version_scn=>2704893
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139254509744751388)
,p_name=>'APEX.IG.HELP.FILTER_TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D6\05E8\05D4 \05DC\05DE\05E1\05E0\05DF')
,p_is_js_message=>true
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139252380103751387)
,p_name=>'APEX.IG.HELP.FLASHBACK'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\05D4\05E9\05EA\05DE\05E9 \05D1\05EA\05D9\05D1\05EA \05D3\05D5-\05E9\05D9\05D7 \05D6\05D5 \05DB\05D3\05D9 \05DC\05D4\05E6\05D9\05D2 \05D0\05EA \05D4\05E0\05EA\05D5\05E0\05D9\05DD \05DB\05E4\05D9 \05E9\05D4\05D9\05D5 \05E7\05D9\05D9\05DE\05D9\05DD \05D1\05E0\05E7\05D5\05D3\05EA \05D6\05DE\05DF \05E7\05D5\05D3\05DE\05EA.</p>'),
unistr('<p>\05D4\05D6\05DF \05D0\05EA \05DE\05E1\05E4\05E8 \05D4\05D3\05E7\05D5\05EA \05D1\05E2\05D1\05E8 \05DC\05D4\05E8\05E6\05EA \05D0\05EA \05E9\05D0\05D9\05DC\05EA\05EA \05D4-flashback.</p>')))
,p_version_scn=>2704893
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139254106316751387)
,p_name=>'APEX.IG.HELP.FLASHBACK_TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D6\05E8\05D4 \05DC\05E4\05DC\05D0\05E9\05D1\05E7')
,p_is_js_message=>true
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139254899732751388)
,p_name=>'APEX.IG.HELP.GROUP_BY_TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D6\05E8\05D4 \05DC''\05E7\05D1\05E5 \05DC\05E4\05D9''')
,p_is_js_message=>true
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139252489673751387)
,p_name=>'APEX.IG.HELP.HIGHLIGHT'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\05D4\05E9\05EA\05DE\05E9 \05D1\05EA\05D9\05D1\05EA \05D3\05D5-\05E9\05D9\05D7 \05D6\05D5 \05DB\05D3\05D9 \05DC\05D4\05D3\05D2\05D9\05E9 \05E9\05D5\05E8\05D5\05EA \05D0\05D5 \05E2\05DE\05D5\05D3\05D5\05EA \05E9\05DC \05E0\05EA\05D5\05E0\05D9\05DD \05E2\05DC \05D1\05E1\05D9\05E1 \05D4\05EA\05E0\05D0\05D9 \05E9\05D4\05D5\05D6\05DF.</p>'),
'',
unistr('<p><strong>\05E8\05E9\05D9\05DE\05EA \05D4\05D3\05D2\05E9\05D5\05EA</strong><br>'),
unistr('\05E8\05E9\05D9\05DE\05EA \05D4\05D4\05D3\05D2\05E9\05D5\05EA \05DE\05E6\05D9\05D2\05D4 \05D4\05D3\05D2\05E9\05D5\05EA \05DE\05D5\05D2\05D3\05E8\05D5\05EA. \05D7\05E1\05D5\05DD \05D4\05D3\05D2\05E9\05D4 \05E7\05D9\05D9\05DE\05EA \05E2\05DC \05D9\05D3\05D9 \05D1\05D9\05D8\05D5\05DC \05D4\05D1\05D7\05D9\05E8\05D4 \05D1\05D4.<br>'),
unistr('\05DC\05D7\05E5 \05E2\05DC \05D4\05D5\05E1\05E3 ( &plus; ) \05DB\05D3\05D9 \05DC\05D9\05E6\05D5\05E8 \05D4\05D3\05D2\05E9\05D4 \05D7\05D3\05E9\05D4, \05D0\05D5 \05E2\05DC \05DE\05D7\05E7 ( &minus; ) \05DB\05D3\05D9 \05DC\05D4\05E1\05D9\05E8 \05D4\05D3\05D2\05E9\05D4 \05E7\05D9\05D9\05DE\05EA.</p>'),
'',
unistr('<p><strong>\05D4\05D2\05D3\05E8\05D5\05EA \05D4\05D3\05D2\05E9\05D4</strong><br>'),
unistr('\05D4\05E9\05EA\05DE\05E9 \05D1\05D8\05D5\05E4\05E1 \05DB\05D3\05D9 \05DC\05D4\05D2\05D3\05D9\05E8 \05D0\05EA \05DE\05D0\05E4\05D9\05D9\05E0\05D9 \05D4\05D4\05D3\05D2\05E9\05D4.<br>'),
unistr('\05D4\05D6\05DF \05D0\05EA \05D4\05E9\05DD, \05D1\05D7\05E8 ''\05E9\05D5\05E8\05D4'' \05D0\05D5 ''\05E2\05DE\05D5\05D3\05D4'', \05D5\05D1\05D7\05E8 \05D0\05EA \05E7\05D5\05D3\05D9 \05E6\05D1\05E2 HTML \05D1\05E9\05D1\05D9\05DC \05D4\05E8\05E7\05E2 \05D5\05D4\05D8\05E7\05E1\05D8.<br>'),
unistr('\05D1\05D7\05E8 \05D0\05EA <strong>\05E1\05D5\05D2 \05D4\05EA\05E0\05D0\05D9</strong> \05D4\05DE\05EA\05D0\05D9\05DD \05DB\05D3\05D9 \05DC\05D4\05D3\05D2\05D9\05E9 \05E0\05EA\05D5\05E0\05D9\05DD \05E1\05E4\05E6\05D9\05E4\05D9\05D9\05DD:<br>'),
unistr('&nbsp;&nbsp;&nbsp;Row - \05D4\05D3\05D2\05E9 \05D0\05EA \05D4\05DE\05D5\05E0\05D7 \05D1\05DB\05DC \05E2\05DE\05D5\05D3\05D4.<br>'),
unistr('&nbsp;&nbsp;&nbsp;Column - \05D4\05D3\05D2\05E9 \05D1\05EA\05D5\05DA \05E2\05DE\05D5\05D3\05D4 \05E1\05E4\05E6\05D9\05E4\05D9\05EA \05D1\05D4\05EA\05D1\05E1\05E1 \05E2\05DC \05D4\05D0\05D5\05E4\05E8\05D8\05D5\05E8 \05D5\05E2\05E8\05DA \05E9\05E6\05D5\05D9\05E0\05D5.</p>')))
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139254069804751387)
,p_name=>'APEX.IG.HELP.HIGHLIGHT_TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D6\05E8\05D4 \05DC\05D4\05D3\05D2\05E9\05D4')
,p_is_js_message=>true
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139252644877751387)
,p_name=>'APEX.IG.HELP.REPORT'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\05D4\05E9\05EA\05DE\05E9 \05D1\05EA\05D9\05D1\05EA \05D3\05D5-\05E9\05D9\05D7 \05D6\05D5 \05DB\05D3\05D9 \05DC\05E9\05DE\05D5\05E8 \05E9\05D9\05E0\05D5\05D9\05D9\05DD \05E9\05E2\05E9\05D9\05EA \05D1\05DE\05EA\05D5\05D5\05D4 \05D5\05EA\05E6\05D5\05E8\05D4 \05D4\05E0\05D5\05DB\05D7\05D9\05D9\05DD \05E9\05DC \05D4\05E8\05E9\05EA.<br>'),
unistr('\05DE\05E4\05EA\05D7\05D9 \05D9\05D9\05E9\05D5\05DE\05D9\05DD \05D9\05DB\05D5\05DC\05D9\05DD \05DC\05D4\05D2\05D3\05D9\05E8 \05DE\05E1\05E4\05E8 \05DE\05EA\05D5\05D5\05D9\05DD \05D7\05DC\05D5\05E4\05D9\05D9\05DD \05E9\05DC \05D3\05D5\05D7. \05DB\05D0\05E9\05E8 \05DE\05D5\05EA\05E8, \05D0\05EA\05D4 \05D5\05DE\05E9\05EA\05DE\05E9\05D9 \05E7\05E6\05D4 \05D0\05D7\05E8\05D9\05DD \05D9\05DB\05D5\05DC\05D9\05DD \05DC\05E9\05DE\05D5\05E8 \05D3\05D5\05D7 \05DB\05E6\05D9\05D1\05D5\05E8\05D9, \05DE\05D4 \05E9\05D4\05D5\05E4\05DA \05D0\05D5\05EA\05D5 \05DC\05D6\05DE\05D9\05DF \05DC\05DB\05DC \05DE\05E9\05EA\05DE\05E9\05D9 \05D4\05E8\05E9\05EA \05D4\05D0\05D7\05E8\05D9\05DD. \05D0\05EA\05D4 \05D2\05DD \05D9\05DB\05D5\05DC \05DC\05E9\05DE\05D5\05E8 \05D3\05D5\05D7 \05DB\05D3\05D5\05D7 \05DB\05D3\05D5\05D7 \05E4\05E8\05D8\05D9 \05E9\05E8\05E7 \05D0\05EA\05D4 \05D9\05DB\05D5\05DC \05DC\05E6\05E4\05D5\05EA \05D1\05D5.</p>'),
unistr('<p>\05D1\05D7\05E8 \05DE\05D1\05D9\05DF \05D4\05E1\05D5\05D2\05D9\05DD \05D4\05D6\05DE\05D9\05E0\05D9\05DD \05D5\05D4\05D6\05DF \05E9\05DD \05D1\05E9\05D1\05D9\05DC \05D4\05D3\05D5\05D7 \05D4\05E9\05DE\05D5\05E8.</p>')))
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139253802117751387)
,p_name=>'APEX.IG.HELP.REPORT_TITLE'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\05E2\05D6\05E8\05D4 \05DC\05D3\05D5\05D7'),
''))
,p_is_js_message=>true
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139252086119751387)
,p_name=>'APEX.IG.HELP.SORT'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\05D4\05E9\05EA\05DE\05E9 \05D1\05EA\05D9\05D1\05EA \05D3\05D5-\05E9\05D9\05D7 \05D6\05D5 \05DB\05D3\05D9 \05DC\05D4\05D2\05D3\05D9\05E8 \05D0\05EA \05E1\05D3\05E8 \05D4\05D4\05E6\05D2\05D4.</p>'),
'',
unistr('<p><strong>\05E8\05E9\05D9\05DE\05EA \05DE\05D9\05D5\05DF</strong><br>'),
unistr('\05EA\05D9\05D1\05EA \05D4\05D3\05D5-\05E9\05D9\05D7 ''\05DE\05D9\05D5\05DF'' \05DE\05E6\05D9\05D2\05D4 \05E8\05E9\05D9\05DE\05D4 \05E9\05DC \05DB\05DC\05DC\05D9 \05DE\05D9\05D5\05DF \05DE\05D5\05D2\05D3\05E8\05D9\05DD.<br>'),
unistr('\05DC\05D7\05E5 \05E2\05DC \05D4\05D5\05E1\05E3 ( &plus; ) \05DB\05D3\05D9 \05DC\05D9\05E6\05D5\05E8 \05E2\05DE\05D5\05D3\05EA \05DE\05D9\05D5\05DF, \05D0\05D5 \05E2\05DC \05DE\05D7\05E7 ( &minus; ) \05DB\05D3\05D9 \05DC\05D4\05E1\05D9\05E8 \05E2\05DE\05D5\05D3\05EA \05DE\05D9\05D5\05DF.<br>'),
unistr('\05DC\05D7\05E5 \05E2\05DC \05D4\05D6\05D6 \05DE\05E2\05DC\05D4 ( &uarr; ) \05D5\05E2\05DC \05D4\05D6\05D6 \05DE\05D8\05D4 ( &darr; ) \05DB\05D3\05D9 \05DC\05D4\05E2\05D1\05D9\05E8 \05D0\05EA \05E2\05DE\05D5\05D3\05EA \05D4\05DE\05D9\05D5\05DF \05E9\05E0\05D1\05D7\05E8\05D4 \05DE\05E2\05DC\05D4 \05D5\05DE\05D8\05D4 \05D9\05D7\05E1\05D9\05EA \05DC\05E2\05DE\05D5\05D3\05D5\05EA \05D4\05DE\05D9\05D5\05DF \05D4\05D0\05D7\05E8\05D5\05EA.</p>'),
'',
unistr('<p><strong>\05D4\05D2\05D3\05E8\05D5\05EA \05DE\05D9\05D5\05DF</strong><br>'),
unistr('\05D1\05D7\05E8 \05E2\05DE\05D5\05D3\05EA \05DE\05D9\05D5\05DF, \05DB\05D9\05D5\05D5\05DF \05D4\05DE\05D9\05D5\05DF \05D5\05D0\05D9\05DA \05DC\05E1\05D3\05E8 \05E2\05DE\05D5\05D3\05D5\05EA null (\05E2\05DE\05D5\05D3\05D5\05EA \05DC\05DC\05D0 \05E2\05E8\05DA).</p>'),
'',
unistr('<p><em>\05D4\05E2\05E8\05D4: \05D0\05E4\05E9\05E8 \05DC\05DE\05D9\05D9\05DF \05E0\05EA\05D5\05E0\05D9\05DD \05DC\05E4\05D9 \05E2\05DE\05D5\05D3\05D5\05EA \05E9\05D0\05D9\05E0\05DF \05DE\05D5\05E6\05D2\05D5\05EA, \05D0\05D1\05DC \05D9\05D9\05EA\05DB\05DF \05E9\05DC\05D0 \05DB\05DC \05D4\05E2\05DE\05D5\05D3\05D5\05EA \05E0\05D9\05EA\05E0\05D5\05EA \05DC\05DE\05D9\05D5\05DF.</em><br>'),
unistr('<em>\05E2\05DE\05D5\05D3\05D5\05EA \05DE\05D5\05E6\05D2\05D5\05EA \05D0\05E4\05E9\05E8 \05DC\05DE\05D9\05D9\05DF \05E2\05DC \05D9\05D3\05D9 \05DC\05D7\05D9\05E6\05D4 \05E2\05DC \05D7\05E5 \05DE\05E2\05DC\05D4 (\05E1\05D3\05E8 \05E2\05D5\05DC\05D4) \05D0\05D5 \05E2\05DC \05D7\05E5 \05DE\05D8\05D4 (\05E1\05D3\05E8 \05D9\05D5\05E8\05D3) \05D1\05E1\05D5\05E3 \05DB\05D5\05EA\05E8\05EA \05D4\05E2\05DE\05D5\05D3\05D4. \05DB\05D3\05D9 \05DC\05D4\05D5\05E1\05D9\05E3 \05E2\05DE\05D5\05D3\05D4 \05E2\05D5\05E7\05D1\05EA \05DC\05DE\05D9\05D5\05DF \05E7\05D9\05D9\05DD, \05D4\05D7\05D6\05E7 \05D0\05EA \05DE\05E7\05E9 Shift \05DC\05D7\05D5\05E5 \05D5\05DC\05D7\05E5 \05E2\05DC \05D7\05E5 \05DE\05E2\05DC\05D4 \05D0\05D5 \05DE\05D8\05D4.</em></p>')))
,p_version_scn=>2704893
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139254494946751388)
,p_name=>'APEX.IG.HELP.SORT_TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D6\05E8\05D4 \05DC\05DE\05D9\05D5\05DF')
,p_is_js_message=>true
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139253685115751387)
,p_name=>'APEX.IG.HELP.SUBSCRIPTION_TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D6\05E8\05D4 \05DC\05DE\05E0\05D5\05D9')
,p_is_js_message=>true
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139207299545751373)
,p_name=>'APEX.IG.HIDE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05EA\05E8')
,p_is_js_message=>true
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139171676030751363)
,p_name=>'APEX.IG.HIGHLIGHT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D3\05D2\05E9')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139240860957751383)
,p_name=>'APEX.IG.HIGH_COLUMN'
,p_message_language=>'he'
,p_message_text=>unistr('\05D2\05D1\05D5\05D4')
,p_is_js_message=>true
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139241614395751384)
,p_name=>'APEX.IG.HORIZONTAL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D5\05E4\05E7\05D9')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139200268396751371)
,p_name=>'APEX.IG.HOURS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05E2\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704881
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139205257789751373)
,p_name=>'APEX.IG.ICON'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E7\05D5\05DF')
,p_is_js_message=>true
,p_version_scn=>2704882
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139170532616751363)
,p_name=>'APEX.IG.ICON_VIEW'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05E6\05D5\05D2\05EA \05D0\05D9\05E7\05D5\05E0\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139198477046751371)
,p_name=>'APEX.IG.IN'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1-')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139206805274751373)
,p_name=>'APEX.IG.INACTIVE_SETTING'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D2\05D3\05E8\05D4 \05DC\05D0 \05E4\05E2\05D9\05DC\05D4')
,p_is_js_message=>true
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139206956482751373)
,p_name=>'APEX.IG.INACTIVE_SETTINGS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D2\05D3\05E8\05D5\05EA \05DC\05D0 \05E4\05E2\05D9\05DC\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139214517344751376)
,p_name=>'APEX.IG.INTERNAL_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E8\05E2\05D4 \05E9\05D2\05D9\05D0\05D4 \05E4\05E0\05D9\05DE\05D9\05EA \05D1\05D6\05DE\05DF \05E2\05D9\05D1\05D5\05D3 \05D1\05E7\05E9\05EA \05D4\05E8\05E9\05EA \05D4\05D0\05D9\05E0\05D8\05E8\05D0\05E7\05D8\05D9\05D1\05D9\05EA.')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139102464366751342)
,p_name=>'APEX.IG.INVALID_COLUMN_FILTER_TYPE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E1\05E0\05DF \05E2\05DE\05D5\05D3\05D5\05EA \05DE\05E1\05D5\05D2 "%0" \05DC\05D0 \05E0\05EA\05DE\05DA \05DC\05E2\05DE\05D5\05D3\05D4 "%1".')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139253439538751387)
,p_name=>'APEX.IG.INVALID_DATE_FORMAT'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D1\05E0\05D9\05EA \05EA\05D0\05E8\05D9\05DA \05D1\05DC\05EA\05D9 \05EA\05E7\05E4\05D4')
,p_is_js_message=>true
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139228225215751380)
,p_name=>'APEX.IG.INVALID_FILTER_COLUMN'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05E9\05EA \05D0\05D9\05E0\05D8\05E8\05D0\05E7\05D8\05D9\05D1\05D9\05EA \05DC\05D0 \05EA\05D5\05DE\05DB\05EA \05D1\05D4\05D2\05D3\05E8\05EA \05DE\05E1\05E0\05DF \05E2\05DC \05E2\05DE\05D5\05D3\05D4 %0.')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139228120020751380)
,p_name=>'APEX.IG.INVALID_FILTER_OPERATOR'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D0\05D9\05E0\05E0\05D5 \05E1\05D5\05D2 \05DE\05E1\05E0\05DF \05EA\05E7\05E3 \05DC\05D4\05D2\05D3\05E8\05EA \05DE\05E1\05E0\05DF \05E9\05DC \05E8\05E9\05EA \05D0\05D9\05E0\05D8\05E8\05D0\05E7\05D8\05D9\05D1\05D9\05EA.')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139109097767751344)
,p_name=>'APEX.IG.INVALID_NUMBER_FORMAT'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D1\05E0\05D9\05EA \05DE\05E1\05E4\05E8 \05D1\05DC\05EA\05D9 \05EA\05E7\05E4\05D4')
,p_is_js_message=>true
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139256130526751388)
,p_name=>'APEX.IG.INVALID_SETTING'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D2\05D3\05E8\05D4 \05DC\05D0 \05EA\05E7\05E4\05D4')
,p_is_js_message=>true
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139256219393751388)
,p_name=>'APEX.IG.INVALID_SETTINGS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D2\05D3\05E8\05D5\05EA \05DC\05D0 \05EA\05E7\05E4\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139247317677751385)
,p_name=>'APEX.IG.INVALID_SORT_BY'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E8\05DA ''\05DE\05D9\05D9\05DF \05DC\05E4\05D9'' \05E0\05E7\05D1\05E2 \05DC-%0, \05D0\05DA \05DC\05D0 \05E0\05D1\05D7\05E8\05D4 \05D0\05E3 \05E2\05DE\05D5\05D3\05D4 \05DC-%0.')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139244643103751385)
,p_name=>'APEX.IG.INVALID_VALUE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E8\05DA \05DC\05D0 \05EA\05E7\05E3 ')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139239766348751383)
,p_name=>'APEX.IG.INVISIBLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05D4\05D5\05E6\05D2')
,p_is_js_message=>true
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139199252849751371)
,p_name=>'APEX.IG.IN_THE_LAST'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D0\05D7\05E8\05D5\05E0\05D5\05EA/\05D1\05D0\05D7\05E8\05D5\05E0\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139199418190751371)
,p_name=>'APEX.IG.IN_THE_NEXT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D1\05D0\05D5\05EA/\05D1\05D1\05D0\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139198360855751371)
,p_name=>'APEX.IG.IS_NOT_NULL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E0\05D5 \05E8\05D9\05E7')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139198203947751371)
,p_name=>'APEX.IG.IS_NULL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05D0 \05E8\05D9\05E7')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139248174904751386)
,p_name=>'APEX.IG.LABEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D2\05D9\05EA')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139240184950751383)
,p_name=>'APEX.IG.LABEL_COLUMN'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D5\05D5\05D9\05EA ')
,p_is_js_message=>true
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139244058440751384)
,p_name=>'APEX.IG.LAST'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D7\05E8\05D5\05DF')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139188584568751368)
,p_name=>'APEX.IG.LAST.DAY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D9\05D5\05DD \05D4\05D0\05D7\05E8\05D5\05DF')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139188784325751368)
,p_name=>'APEX.IG.LAST.HOUR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E9\05E2\05D4 \05D4\05D0\05D7\05E8\05D5\05E0\05D4')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139189223039751368)
,p_name=>'APEX.IG.LAST.MINUTE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D3\05E7\05D4 \05D4\05D0\05D7\05E8\05D5\05E0\05D4')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139188236245751368)
,p_name=>'APEX.IG.LAST.MONTH'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05D5\05D3\05E9 \05E9\05E2\05D1\05E8')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139188308208751368)
,p_name=>'APEX.IG.LAST.WEEK'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05E9\05D1\05D5\05E2 \05E9\05E2\05D1\05E8')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139188484222751368)
,p_name=>'APEX.IG.LAST.X_DAYS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D4\05D9\05DE\05D9\05DD \05D4\05D0\05D7\05E8\05D5\05E0\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139188695636751368)
,p_name=>'APEX.IG.LAST.X_HOURS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D4\05E9\05E2\05D5\05EA \05D4\05D0\05D7\05E8\05D5\05E0\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139189334405751368)
,p_name=>'APEX.IG.LAST.X_MINUTES'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D4\05D3\05E7\05D5\05EA \05D4\05D0\05D7\05E8\05D5\05E0\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139189151108751368)
,p_name=>'APEX.IG.LAST.X_MONTHS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D4\05D7\05D5\05D3\05E9\05D9\05DD \05D4\05D0\05D7\05E8\05D5\05E0\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139189058257751368)
,p_name=>'APEX.IG.LAST.X_WEEKS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D4\05E9\05D1\05D5\05E2\05D5\05EA \05D4\05D0\05D7\05E8\05D5\05E0\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139188090501751368)
,p_name=>'APEX.IG.LAST.X_YEARS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D4\05E9\05E0\05D9\05DD \05D4\05D0\05D7\05E8\05D5\05E0\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139188150096751368)
,p_name=>'APEX.IG.LAST.YEAR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05E9\05E0\05D4 \05E9\05E2\05D1\05E8\05D4')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139248331809751386)
,p_name=>'APEX.IG.LAYOUT_ALIGN'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05D9\05E9\05D5\05E8 \05EA\05D0')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139248416011751386)
,p_name=>'APEX.IG.LAYOUT_USEGROUPFOR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E9\05EA\05DE\05E9 \05D1\05E7\05D1\05D5\05E6\05D4 \05D1\05E9\05D1\05D9\05DC')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139198814430751371)
,p_name=>'APEX.IG.LESS_THAN'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D8\05DF \05DE-')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139198911963751371)
,p_name=>'APEX.IG.LESS_THAN_OR_EQUALS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D8\05DF \05D0\05D5 \05E9\05D5\05D5\05D4 \05DC-')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139242283236751384)
,p_name=>'APEX.IG.LINE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D5')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139242314176751384)
,p_name=>'APEX.IG.LINE_WITH_AREA'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D5 \05E2\05DD \05E9\05D8\05D7')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139248784726751386)
,p_name=>'APEX.IG.LISTAGG'
,p_message_language=>'he'
,p_message_text=>'Listagg'
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139240921406751384)
,p_name=>'APEX.IG.LOW_COLUMN'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05DE\05D5\05DA')
,p_is_js_message=>true
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139251233775751387)
,p_name=>'APEX.IG.MAILADDRESSES_COMMASEP'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E4\05E8\05D3 \05D1\05D9\05DF \05DE\05E1\05E4\05E8 \05DB\05EA\05D5\05D1\05D5\05EA \05D1\05D0\05DE\05E6\05E2\05D5\05EA \05E4\05E1\05D9\05E7\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704893
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139200084964751371)
,p_name=>'APEX.IG.MATCHES_REGULAR_EXPRESSION'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05EA\05D0\05D9\05DD \05DC-Regular Expression')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139224418716751379)
,p_name=>'APEX.IG.MAX'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E8\05D1\05D9')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139258725443751389)
,p_name=>'APEX.IG.MAX_OVERALL'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E7\05E1\05D9\05DE\05D5\05DD \05DB\05D5\05DC\05DC')
,p_is_js_message=>true
,p_version_scn=>2704896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139224606031751379)
,p_name=>'APEX.IG.MEDIAN'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05E6\05D9\05D5\05DF')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139258863775751389)
,p_name=>'APEX.IG.MEDIAN_OVERALL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05E6\05D9\05D5\05DF \05DB\05D5\05DC\05DC')
,p_is_js_message=>true
,p_version_scn=>2704896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139224380806751379)
,p_name=>'APEX.IG.MIN'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D6\05E2\05E8\05D9')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139200105698751371)
,p_name=>'APEX.IG.MINUTES'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05E7\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704881
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139225198573751379)
,p_name=>'APEX.IG.MINUTES_AGO'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05E4\05E0\05D9  \05D3\05E7\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139258674434751389)
,p_name=>'APEX.IG.MIN_OVERALL'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D9\05E0\05D9\05DE\05D5\05DD \05DB\05D5\05DC\05DC')
,p_is_js_message=>true
,p_version_scn=>2704896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139200555812751371)
,p_name=>'APEX.IG.MONTHS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D5\05D3\05E9\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704881
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139207155099751373)
,p_name=>'APEX.IG.MORE_DATA_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E0\05EA\05D5\05E0\05D9\05DD \05DE\05DB\05D9\05DC\05D9\05DD \05D9\05D5\05EA\05E8 \05DE-%0 \05E9\05D5\05E8\05D5\05EA \05D5\05D7\05D5\05E8\05D2\05D9\05DD \05DE\05D4\05DE\05E8\05D1 \05D4\05DE\05D5\05EA\05E8. \05D4\05D7\05DC \05DE\05E1\05E0\05E0\05D9\05DD \05E0\05D5\05E1\05E4\05D9\05DD \05DB\05D3\05D9 \05DC\05D4\05E6\05D9\05D2 \05D0\05EA \05D4\05EA\05D5\05E6\05D0\05D5\05EA.')
,p_is_js_message=>true
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139232939774751381)
,p_name=>'APEX.IG.MULTIIG_PAGE_REGION_STATIC_ID_REQUIRED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D5\05D1\05D4 \05DC\05E6\05D9\05D9\05DF \05DE\05D6\05D4\05D4 \05E1\05D8\05D8\05D9 \05E9\05DC \05D0\05D6\05D5\05E8 \05DB\05D9\05D5\05D5\05DF \05E9\05D4\05D3\05E3 \05DE\05DB\05D9\05DC \05DE\05E1\05E4\05E8 \05E8\05E9\05EA\05D5\05EA \05D0\05D9\05E0\05D8\05E8\05D0\05E7\05D8\05D9\05D1\05D9\05D5\05EA.')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139203280764751372)
,p_name=>'APEX.IG.NAME'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DD ')
,p_is_js_message=>true
,p_version_scn=>2704881
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139203428519751372)
,p_name=>'APEX.IG.NAMED_REPORT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05D5\05D7 \05E9\05DE\05D9')
,p_is_js_message=>true
,p_version_scn=>2704881
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139187443930751368)
,p_name=>'APEX.IG.NEXT.DAY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D9\05D5\05DD \05D4\05D1\05D0')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139187245507751368)
,p_name=>'APEX.IG.NEXT.HOUR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E9\05E2\05D4 \05D4\05D1\05D0\05D4')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139189497312751368)
,p_name=>'APEX.IG.NEXT.MINUTE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D3\05E7\05D4 \05D4\05D1\05D0\05D4')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139187742800751368)
,p_name=>'APEX.IG.NEXT.MONTH'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D7\05D5\05D3\05E9 \05D4\05D1\05D0')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139187671944751368)
,p_name=>'APEX.IG.NEXT.WEEK'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E9\05D1\05D5\05E2 \05D4\05D1\05D0')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139187532204751368)
,p_name=>'APEX.IG.NEXT.X_DAYS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D4\05D9\05DE\05D9\05DD \05D4\05D1\05D0\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139187332527751368)
,p_name=>'APEX.IG.NEXT.X_HOURS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D4\05E9\05E2\05D5\05EA \05D4\05D1\05D0\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139189580445751368)
,p_name=>'APEX.IG.NEXT.X_MINUTES'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D4\05D3\05E7\05D5\05EA \05D4\05D1\05D0\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139188842390751368)
,p_name=>'APEX.IG.NEXT.X_MONTHS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D4\05D7\05D5\05D3\05E9\05D9\05DD \05D4\05D1\05D0\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139188963470751368)
,p_name=>'APEX.IG.NEXT.X_WEEKS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D4\05E9\05D1\05D5\05E2\05D5\05EA \05D4\05D1\05D0\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139187973464751368)
,p_name=>'APEX.IG.NEXT.X_YEARS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D4\05E9\05E0\05D9\05DD \05D4\05D1\05D0\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139187834010751368)
,p_name=>'APEX.IG.NEXT.YEAR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E9\05E0\05D4 \05D4\05D1\05D0\05D4')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139199109886751371)
,p_name=>'APEX.IG.NOT_BETWEEN'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05DE\05E6\05D0 \05D1\05D9\05DF')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139198115515751371)
,p_name=>'APEX.IG.NOT_EQUALS'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E9\05D5\05D5\05D4')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139262946340751390)
,p_name=>'APEX.IG.NOT_EXIST'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D0\05D6\05D5\05E8 \05E2\05DD \05DE\05D6\05D4\05D4 %0 \05D0\05D9\05E0\05E0\05D5 \05D0\05D6\05D5\05E8 \05E9\05DC \05E8\05E9\05EA \05D0\05D9\05E0\05D8\05E8\05D0\05E7\05D8\05D9\05D1\05D9\05EA \05D0\05D5 \05DC\05D0 \05E7\05D9\05D9\05DD \05D1\05D9\05D9\05E9\05D5\05DD %1.')
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139198515371751371)
,p_name=>'APEX.IG.NOT_IN'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E0\05D5 \05D1-')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139199315373751371)
,p_name=>'APEX.IG.NOT_IN_THE_LAST'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05D1\05D0\05D7\05E8\05D5\05E0\05D5\05EA/\05D1\05D0\05D7\05E8\05D5\05E0\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139199582824751371)
,p_name=>'APEX.IG.NOT_IN_THE_NEXT'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05D1\05D1\05D0\05D5\05EA/\05D1\05D1\05D0\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139207042796751373)
,p_name=>'APEX.IG.NO_DATA_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05DE\05E6\05D0\05D5 \05E0\05EA\05D5\05E0\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139243877490751384)
,p_name=>'APEX.IG.NULLS'
,p_message_language=>'he'
,p_message_text=>unistr('Nulls (\05E8\05D9\05E7\05D9\05DD)')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139248962698751386)
,p_name=>'APEX.IG.NUMBER'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E1\05E4\05E8\05D9')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139244183573751384)
,p_name=>'APEX.IG.OFF'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D1\05D5\05D9')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139244220134751384)
,p_name=>'APEX.IG.ON'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D5\05E4\05E2\05DC')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139197364786751371)
,p_name=>'APEX.IG.ONE_MINUTE_AGO'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05E4\05E0\05D9 \05D3\05E7\05D4 \05D0\05D7\05EA')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139251782817751387)
,p_name=>'APEX.IG.OPEN_COLORPICKER'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05EA\05D7 \05D1\05D5\05E8\05E8 \05E6\05D1\05E2: %0')
,p_is_js_message=>true
,p_version_scn=>2704893
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139240623358751383)
,p_name=>'APEX.IG.OPEN_COLUMN'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05EA\05D7')
,p_is_js_message=>true
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139204333211751373)
,p_name=>'APEX.IG.OPERATOR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D5\05E4\05E8\05D8\05D5\05E8')
,p_is_js_message=>true
,p_version_scn=>2704882
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139240068594751383)
,p_name=>'APEX.IG.ORIENTATION'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D9\05D5\05D5\05DF')
,p_is_js_message=>true
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139242451596751384)
,p_name=>'APEX.IG.PIE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D5\05D2\05D4')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139205600569751373)
,p_name=>'APEX.IG.PIVOT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E6\05D9\05E8')
,p_is_js_message=>true
,p_version_scn=>2704882
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139170851137751363)
,p_name=>'APEX.IG.PIVOT_VIEW'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05E1\05E3 \05E6\05D9\05E8')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139251681842751387)
,p_name=>'APEX.IG.PLACEHOLDER_INVALUES'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E4\05E8\05D3 \05D1\05D9\05DF \05E2\05E8\05DB\05D9\05DD \05D1\05D0\05DE\05E6\05E2\05D5\05EA "%0"')
,p_is_js_message=>true
,p_version_scn=>2704893
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139242515632751384)
,p_name=>'APEX.IG.POLAR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D5\05D8\05D1\05D9')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139247818803751386)
,p_name=>'APEX.IG.POSITION_CENTER'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E8\05DB\05D6')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139247949672751386)
,p_name=>'APEX.IG.POSITION_END'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D9\05D5\05DD')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139247775285751386)
,p_name=>'APEX.IG.POSITION_START'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05EA\05D7\05DC\05D4')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139203533786751372)
,p_name=>'APEX.IG.PRIMARY'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05D0\05E9\05D9')
,p_is_js_message=>true
,p_version_scn=>2704882
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139203898525751372)
,p_name=>'APEX.IG.PRIMARY_DEFAULT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05E8\05D9\05E8\05EA \05DE\05D7\05D3\05DC \05E8\05D0\05E9\05D9\05EA')
,p_is_js_message=>true
,p_version_scn=>2704882
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139220398196751377)
,p_name=>'APEX.IG.PRIMARY_REPORT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05D5\05D7 \05E8\05D0\05E9\05D9')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139093913171751340)
,p_name=>'APEX.IG.PRINT_ACCESSIBLE.PROMPT'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05DC\05D5\05DC \05EA\05D2\05D9\05D5\05EA \05E0\05D2\05D9\05E9\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139091342069751339)
,p_name=>'APEX.IG.PRINT_ORIENTATION.LOV.HORIZONTAL.D'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05E8\05D5\05D7\05D1')
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139091440380751339)
,p_name=>'APEX.IG.PRINT_ORIENTATION.LOV.VERTICAL.D'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0\05D5\05E8\05DA')
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139091219204751339)
,p_name=>'APEX.IG.PRINT_ORIENTATION.PROMPT'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D9\05D5\05D5\05DF \05D4\05D3\05E3')
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139091104980751339)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.A3.D'
,p_message_language=>'he'
,p_message_text=>'A3'
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139091054641751339)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.A4.D'
,p_message_language=>'he'
,p_message_text=>'A4'
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139094110110751340)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.CUSTOM.D'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05EA\05D0\05DE\05D4 \05D0\05D9\05E9\05D9\05EA')
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139090803766751339)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.LEGAL.D'
,p_message_language=>'he'
,p_message_text=>'Legal'
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139090767783751339)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.LETTER.D'
,p_message_language=>'he'
,p_message_text=>'Letter'
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139090973018751339)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.TABLOID.D'
,p_message_language=>'he'
,p_message_text=>'TABLOID'
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139090601325751339)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.PROMPT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D2\05D5\05D3\05DC \05D4\05D3\05E3')
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139056216449751328)
,p_name=>'APEX.IG.PRINT_STRIP_RICH_TEXT.PROMPT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05E8\05EA \05D8\05E7\05E1\05D8 \05E2\05E9\05D9\05E8')
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139242658025751384)
,p_name=>'APEX.IG.RADAR'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05DB"\05DD')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139242720570751384)
,p_name=>'APEX.IG.RANGE'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\05D8\05D5\05D5\05D7 '),
'         '))
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139252962951751387)
,p_name=>'APEX.IG.REFRESH'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05E2\05E0\05DF')
,p_is_js_message=>true
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139207822956751374)
,p_name=>'APEX.IG.REFRESH_ROW'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05E2\05E0\05DF \05E9\05D5\05E8\05D4')
,p_is_js_message=>true
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139206651133751373)
,p_name=>'APEX.IG.REFRESH_ROWS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05E2\05E0\05DF \05E9\05D5\05E8\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704882
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139211816318751375)
,p_name=>'APEX.IG.REGION_NOT_EXIST'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E7\05D9\05D9\05DD \05D0\05D6\05D5\05E8 \05E8\05E9\05EA \05D0\05D9\05E0\05D8\05E8\05D0\05E7\05D8\05D9\05D1\05D9\05EA \05D1\05D9\05D9\05E9\05D5\05DD %0, \05D3\05E3 %1 \05D5\05D0\05D6\05D5\05E8 %2.')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139172382924751363)
,p_name=>'APEX.IG.REMOVE_CONTROL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05E8 %0')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139202987885751372)
,p_name=>'APEX.IG.REPORT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05D5\05D7')
,p_is_js_message=>true
,p_version_scn=>2704881
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139262126578751390)
,p_name=>'APEX.IG.REPORT.DELETED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D3\05D5\05D7  \05E0\05DE\05D7\05E7')
,p_is_js_message=>true
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139261894519751390)
,p_name=>'APEX.IG.REPORT.SAVED.ALTERNATIVE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05D5\05D7 \05D7\05DC\05D5\05E4\05D9 \05E0\05E9\05DE\05E8 \05DC\05DB\05DC \05D4\05DE\05E9\05EA\05DE\05E9\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139261730102751390)
,p_name=>'APEX.IG.REPORT.SAVED.DEFAULT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05E8\05D9\05E8\05EA \05D4\05DE\05D7\05D3\05DC \05E9\05DC \05D3\05D5\05D7 \05E0\05E9\05DE\05E8\05D4 \05DC\05DB\05DC \05D4\05DE\05E9\05EA\05DE\05E9\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139262056729751390)
,p_name=>'APEX.IG.REPORT.SAVED.PRIVATE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05D5\05D7 \05E4\05E8\05D8\05D9 \05E0\05E9\05DE\05E8')
,p_is_js_message=>true
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139261963322751390)
,p_name=>'APEX.IG.REPORT.SAVED.PUBLIC'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05D5\05D7 \05E6\05D9\05D1\05D5\05E8\05D9 \05E0\05E9\05DE\05E8 \05DC\05DB\05DC \05D4\05DE\05E9\05EA\05DE\05E9\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139211965979751375)
,p_name=>'APEX.IG.REPORT_ALIAS_DOES_NOT_EXIST'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05E9\05EA \05D0\05D9\05E0\05D8\05E8\05D0\05E7\05D8\05D9\05D1\05D9\05EA \05E9\05DE\05D5\05E8\05D4 \05D1\05E2\05DC\05EA \05E9\05DD %0 \05DC\05D0 \05E7\05D9\05D9\05DE\05EA.')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139197238225751370)
,p_name=>'APEX.IG.REPORT_DATA_AS_OF.X.MINUTES_AGO'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05EA\05D5\05E0\05D9 \05D8\05D1\05DC\05D4 \05E0\05DB\05D5\05DF \05DC\05DC\05E4\05E0\05D9 %0 \05D3\05E7\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139197179446751370)
,p_name=>'APEX.IG.REPORT_DATA_AS_OF_ONE_MINUTE_AGO'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05EA\05D5\05E0\05D9 \05D8\05D1\05DC\05D4 \05E0\05DB\05D5\05DF \05DC\05DC\05E4\05E0\05D9 \05D3\05E7\05D4 \05D0\05D7\05EA')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139132613230751351)
,p_name=>'APEX.IG.REPORT_DOES_NOT_EXIST'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05D5\05D7 \05E8\05E9\05EA \05D0\05D9\05E0\05D8\05E8\05D0\05E7\05D8\05D9\05D1\05D9\05EA \05DC\05D0 \05E7\05D9\05D9\05DD.')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139255135343751388)
,p_name=>'APEX.IG.REPORT_EDIT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05D5\05D7 - \05E2\05E8\05D9\05DB\05D4')
,p_is_js_message=>true
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139211743849751375)
,p_name=>'APEX.IG.REPORT_ID_DOES_NOT_EXIST'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05E9\05EA \05D0\05D9\05E0\05D8\05E8\05D0\05E7\05D8\05D9\05D1\05D9\05EA \05E9\05DE\05D5\05E8\05D4 \05D1\05E2\05DC\05EA \05DE\05D6\05D4\05D4 %0 \05DC\05D0 \05E7\05D9\05D9\05DE\05EA.')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139255090093751388)
,p_name=>'APEX.IG.REPORT_SAVE_AS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05D5\05D7 - \05E9\05DE\05D9\05E8\05D4 \05D1\05E9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139172424657751363)
,p_name=>'APEX.IG.REPORT_SETTINGS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D2\05D3\05E8\05D5\05EA \05E8\05E9\05EA')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139263035113751390)
,p_name=>'APEX.IG.REPORT_STATIC_ID_DOES_NOT_EXIST'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05E9\05EA \05D0\05D9\05E0\05D8\05E8\05D0\05E7\05D8\05D9\05D1\05D9\05EA \05E9\05DE\05D5\05E8\05D4 \05D1\05E2\05DC\05EA \05DE\05D6\05D4\05D4 \05E1\05D8\05D8\05D9 %0 \05DC\05D0 \05E7\05D9\05D9\05DE\05EA.')
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139258037956751389)
,p_name=>'APEX.IG.REPORT_VIEW'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05E6\05D5\05D2\05EA \05D3\05D5\05D7')
,p_is_js_message=>true
,p_version_scn=>2704896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139171535818751363)
,p_name=>'APEX.IG.RESET'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E4\05D5\05E1')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139207996447751374)
,p_name=>'APEX.IG.REVERT_CHANGES'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D8\05DC \05E9\05D9\05E0\05D5\05D9\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139206770107751373)
,p_name=>'APEX.IG.REVERT_ROWS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E4\05D5\05DA \05E9\05D5\05E8\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139203908581751372)
,p_name=>'APEX.IG.ROW'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D5\05E8\05D4 ')
,p_is_js_message=>true
,p_version_scn=>2704882
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139202808757751372)
,p_name=>'APEX.IG.ROWS_PER_PAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D5\05E8\05D5\05EA \05D1\05E2\05DE\05D5\05D3')
,p_is_js_message=>true
,p_version_scn=>2704881
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139262686754751390)
,p_name=>'APEX.IG.ROW_ACTIONS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05E2\05D5\05DC\05D5\05EA \05E9\05D5\05E8\05D4')
,p_is_js_message=>true
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139263831979751390)
,p_name=>'APEX.IG.ROW_ACTIONS_FOR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05E2\05D5\05DC\05D5\05EA \05DC\05E9\05D5\05E8\05D4 %0')
,p_is_js_message=>true
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139171814702751363)
,p_name=>'APEX.IG.SAVE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DE\05D5\05E8')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139216906537751376)
,p_name=>'APEX.IG.SAVED'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DE\05D5\05E8')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139121501729751348)
,p_name=>'APEX.IG.SAVED_REPORT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05D5\05D7 \05E9\05E0\05E9\05DE\05E8: %0')
,p_is_js_message=>true
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139170013207751362)
,p_name=>'APEX.IG.SAVED_REPORTS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05D5\05D7\05D5\05EA \05E9\05E0\05E9\05DE\05E8\05D5')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139170161600751363)
,p_name=>'APEX.IG.SAVED_REPORT_DEFAULT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05E8\05D9\05E8\05EA \05DE\05D7\05D3\05DC')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139143605820751355)
,p_name=>'APEX.IG.SAVED_REPORT_EXISTS'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D1\05E8 \05E7\05D9\05D9\05DD \05D3\05D5\05D7 \05E9\05DE\05D5\05E8 \05D1\05E9\05DD %0. \05D4\05D6\05DF \05E9\05DD \05D7\05D3\05E9.')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139170285307751363)
,p_name=>'APEX.IG.SAVED_REPORT_PRIVATE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05E8\05D8\05D9')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139170318352751363)
,p_name=>'APEX.IG.SAVED_REPORT_PUBLIC'
,p_message_language=>'he'
,p_message_text=>unistr('\05E6\05D9\05D1\05D5\05E8\05D9')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139257726679751389)
,p_name=>'APEX.IG.SAVE_AS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DE\05D5\05E8 \05D1\05E9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139206041188751373)
,p_name=>'APEX.IG.SAVE_REPORT_SETTINGS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DE\05D5\05E8 \05D4\05D2\05D3\05E8\05D5\05EA \05D3\05D5\05D7')
,p_is_js_message=>true
,p_version_scn=>2704882
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139242805943751384)
,p_name=>'APEX.IG.SCATTER'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05D9\05D6\05D5\05E8')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139169947972751362)
,p_name=>'APEX.IG.SEARCH'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05E4\05E9')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139250024756751386)
,p_name=>'APEX.IG.SEARCH.ALL_COLUMNS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D9\05E4\05D5\05E9: \05DB\05DC \05E2\05DE\05D5\05D3\05D5\05EA \05D4\05D8\05E7\05E1\05D8')
,p_is_js_message=>true
,p_version_scn=>2704893
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139169812936751362)
,p_name=>'APEX.IG.SEARCH.COLUMN'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D9\05E4\05D5\05E9: %0')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139249338557751386)
,p_name=>'APEX.IG.SEARCH.ORACLE_TEXT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D9\05E4\05D5\05E9: \05D8\05E7\05E1\05D8 \05DE\05DC\05D0')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139197028062751370)
,p_name=>'APEX.IG.SEARCH_FOR.X'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05E4\05E9 \05D0\05EA ''%0''')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139239460954751383)
,p_name=>'APEX.IG.SELECT'
,p_message_language=>'he'
,p_message_text=>unistr('- \05D1\05D7\05E8 -')
,p_is_js_message=>true
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139179557329751365)
,p_name=>'APEX.IG.SELECTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05D9\05E8\05D4')
,p_is_js_message=>true
,p_version_scn=>2704877
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139232693436751381)
,p_name=>'APEX.IG.SELECT_1_ROW_IN_MASTER'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05E8 \05E9\05D5\05E8\05D4 \05D0\05D7\05EA \05D1\05D0\05D6\05D5\05E8 \05D4\05D0\05D1')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139169777211751362)
,p_name=>'APEX.IG.SELECT_COLUMNS_TO_SEARCH'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05E8 \05E2\05DE\05D5\05D3\05D5\05EA \05DC\05D7\05D9\05E4\05D5\05E9')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139262380653751390)
,p_name=>'APEX.IG.SEL_ACTIONS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05E2\05D5\05DC\05D5\05EA \05D1\05D7\05D9\05E8\05D4')
,p_is_js_message=>true
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139179778104751365)
,p_name=>'APEX.IG.SEL_MODE_CELL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05D9\05E8\05EA \05EA\05D0')
,p_is_js_message=>true
,p_version_scn=>2704877
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139179647742751365)
,p_name=>'APEX.IG.SEL_MODE_ROW'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05D9\05E8\05EA \05E9\05D5\05E8\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704877
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139250660165751386)
,p_name=>'APEX.IG.SEND_AS_EMAIL'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DC\05D7 \05DB\05D3\05D5\05D0\05E8 \05D0\05DC\05E7\05D8\05E8\05D5\05E0\05D9')
,p_is_js_message=>true
,p_version_scn=>2704893
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139243283490751384)
,p_name=>'APEX.IG.SERIES_COLUMN'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D3\05E8\05D4 ')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139167410569751362)
,p_name=>'APEX.IG.SHOW'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E6\05D2')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139222661116751378)
,p_name=>'APEX.IG.SHOW_OVERALL_VALUE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E6\05D2 \05E2\05E8\05DA \05DB\05D5\05DC\05DC')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139207507426751374)
,p_name=>'APEX.IG.SINGLE_ROW_VIEW'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05E6\05D5\05D2\05EA \05E9\05D5\05E8\05D4 \05D1\05D5\05D3\05D3\05EA')
,p_is_js_message=>true
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139205896417751373)
,p_name=>'APEX.IG.SORT'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D9\05D9\05DF')
,p_is_js_message=>true
,p_version_scn=>2704882
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139243331493751384)
,p_name=>'APEX.IG.SORT_BY'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D9\05D9\05DF \05DC\05E4\05D9')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139262755656751390)
,p_name=>'APEX.IG.SORT_ONLY_ONE_PER_COLUMN'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D5\05DB\05DC \05DC\05D4\05D2\05D3\05D9\05E8 \05DE\05D9\05D5\05DF \05D0\05D7\05D3 \05D1\05DC\05D1\05D3 \05DC\05DB\05DC \05E2\05DE\05D5\05D3\05D4.')
,p_is_js_message=>true
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139262559463751390)
,p_name=>'APEX.IG.SRV_CHANGE_MENU'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D9\05E0\05D5\05D9')
,p_is_js_message=>true
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139244346716751385)
,p_name=>'APEX.IG.STACK'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D7\05E1\05E0\05D9\05EA')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139199867214751371)
,p_name=>'APEX.IG.STARTS_WITH'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05EA\05D7\05D9\05DC \05D1-')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139242910549751384)
,p_name=>'APEX.IG.STOCK'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D5\05E7 \05D4\05D5\05DF')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139162267872751360)
,p_name=>'APEX.IG.STRETCH_COLUMNS'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05EA\05D7 \05E8\05D5\05D7\05D1\05D9 \05E2\05DE\05D5\05D3\05D4')
,p_is_js_message=>true
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139206242956751373)
,p_name=>'APEX.IG.SUBSCRIPTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E0\05D5\05D9')
,p_is_js_message=>true
,p_version_scn=>2704882
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139224247263751379)
,p_name=>'APEX.IG.SUM'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05DB\05D5\05DD')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139264044550751390)
,p_name=>'APEX.IG.SUMMARY'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05E8\05D9\05D2 \05D0\05D9\05E0\05D8\05E8\05D0\05E7\05D8\05D9\05D1\05D9. \05D3\05D5\05D7: %0, \05EA\05E6\05D5\05D2\05D4: %1.')
,p_is_js_message=>true
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139258165756751389)
,p_name=>'APEX.IG.SUM_OVERALL'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D9\05DB\05D5\05DD \05DB\05D5\05DC\05DC')
,p_is_js_message=>true
,p_version_scn=>2704896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139241146355751384)
,p_name=>'APEX.IG.TARGET_COLUMN'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05E2\05D3')
,p_is_js_message=>true
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139247563050751385)
,p_name=>'APEX.IG.TEXT_COLOR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E6\05D1\05E2 \05D8\05E7\05E1\05D8')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139172557037751363)
,p_name=>'APEX.IG.TOGGLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D7\05DC\05E4\05EA \05DE\05E6\05D1')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139054618465751328)
,p_name=>'APEX.IG.TOOLBAR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05E8\05D9\05D2 \05E0\05EA\05D5\05E0\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139222552700751378)
,p_name=>'APEX.IG.TOOLTIP'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05DE\05D6 \05E6\05E5')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139203022640751372)
,p_name=>'APEX.IG.TYPE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D5\05D2')
,p_is_js_message=>true
,p_version_scn=>2704881
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139207459427751374)
,p_name=>'APEX.IG.UNFREEZE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D8\05DC \05D4\05E7\05E4\05D0\05D4')
,p_is_js_message=>true
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139204563457751373)
,p_name=>'APEX.IG.UNIT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05D7\05D9\05D3\05D4')
,p_is_js_message=>true
,p_version_scn=>2704882
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139250462485751386)
,p_name=>'APEX.IG.UNSAVED_CHANGES_CONTINUE_CONFIRM'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D9\05D9\05DE\05D9\05DD \05E9\05D9\05E0\05D5\05D9\05D9\05DD \05E9\05DC\05D0 \05E0\05E9\05DE\05E8\05D5. \05D4\05D0\05DD \05EA\05E8\05E6\05D4 \05DC\05D4\05DE\05E9\05D9\05DA?')
,p_is_js_message=>true
,p_version_scn=>2704893
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139204483345751373)
,p_name=>'APEX.IG.VALUE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E8\05DA')
,p_is_js_message=>true
,p_version_scn=>2704882
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139240221402751383)
,p_name=>'APEX.IG.VALUE_COLUMN'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E8\05DA')
,p_is_js_message=>true
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139245149651751385)
,p_name=>'APEX.IG.VALUE_REQUIRED'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05D3\05E8\05E9 \05E2\05E8\05DA.')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139230395441751380)
,p_name=>'APEX.IG.VALUE_TIMESTAMP_TZ'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E8\05DA (\05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05E9\05E0\05D5\05EA \05D0\05D6\05D5\05E8 \05D6\05DE\05DF)')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139249085376751386)
,p_name=>'APEX.IG.VARCHAR2'
,p_message_language=>'he'
,p_message_text=>unistr('\05D8\05E7\05E1\05D8')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139241525169751384)
,p_name=>'APEX.IG.VERTICAL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05E0\05DB\05D9')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139202586135751372)
,p_name=>'APEX.IG.VIEW'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E6\05D2')
,p_is_js_message=>true
,p_version_scn=>2704881
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139137693521751353)
,p_name=>'APEX.IG.VIEW_MODE_DESCRIPTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E8\05E9\05EA \05D1\05DE\05E6\05D1 \05EA\05E6\05D5\05D2\05D4, \05DC\05D7\05E5 \05DC\05E2\05E8\05D9\05DB\05D4')
,p_is_js_message=>true
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139239513685751383)
,p_name=>'APEX.IG.VISIBLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D5\05E6\05D2')
,p_is_js_message=>true
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139241081104751384)
,p_name=>'APEX.IG.VOLUME_COLUMN'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05E4\05D7')
,p_is_js_message=>true
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139200483630751371)
,p_name=>'APEX.IG.WEEKS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D1\05D5\05E2\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704881
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139239629064751383)
,p_name=>'APEX.IG.WIDTH'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05D5\05D7\05D1 \05E2\05DE\05D5\05D3\05D4 \05DE\05D6\05E2\05E8\05D9 (Pixel)')
,p_is_js_message=>true
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139191663821751369)
,p_name=>'APEX.IG.X.BETWEEN.Y.AND.Z'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D1\05D9\05DF %1 \05DC-%2')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139191322832751369)
,p_name=>'APEX.IG.X.CONTAINS.Y'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05DE\05DB\05D9\05DC \05D0\05EA %1')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139191467984751369)
,p_name=>'APEX.IG.X.DOES_NOT_CONTAIN.Y'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D0\05D9\05E0\05D5 \05DE\05DB\05D9\05DC \05D0\05EA %1')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139166893658751362)
,p_name=>'APEX.IG.X.DOES_NOT_START_WITH.Y'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D0\05D9\05E0\05D5 \05DE\05EA\05D7\05D9\05DC \05D1-%1')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139190196368751368)
,p_name=>'APEX.IG.X.EQUALS.Y'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05E9\05D5\05D5\05D4 %1')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139190346647751368)
,p_name=>'APEX.IG.X.GREATER_THAN.Y'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D2\05D3\05D5\05DC \05DE-%1')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139190490738751369)
,p_name=>'APEX.IG.X.GREATER_THAN_OR_EQUALS.Y'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D2\05D3\05D5\05DC \05D0\05D5 \05E9\05D5\05D5\05D4 %1')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139191181118751369)
,p_name=>'APEX.IG.X.IN.Y'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D1-%1')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139192336701751369)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.DAYS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D1-%1 \05D4\05D9\05DE\05D9\05DD \05D4\05D0\05D7\05E8\05D5\05E0\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139192163868751369)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.HOURS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D1-%1 \05D4\05E9\05E2\05D5\05EA \05D4\05D0\05D7\05E8\05D5\05E0\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139191964204751369)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.MINUTES'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D1-%1 \05D4\05D3\05E7\05D5\05EA \05D4\05D0\05D7\05E8\05D5\05E0\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139192792109751369)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.MONTHS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D1-%1 \05D4\05D7\05D5\05D3\05E9\05D9\05DD \05D4\05D0\05D7\05E8\05D5\05E0\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139192584952751369)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.WEEKS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D1-%1 \05D4\05E9\05D1\05D5\05E2\05D5\05EA \05D4\05D0\05D7\05E8\05D5\05E0\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139192969922751369)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.YEARS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D1-%1 \05D4\05E9\05E0\05D9\05DD \05D4\05D0\05D7\05E8\05D5\05E0\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139192225366751369)
,p_name=>'APEX.IG.X.IN_THE_LAST_DAY'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D1\05D9\05D5\05DD \05D4\05D0\05D7\05E8\05D5\05DF')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139192018805751369)
,p_name=>'APEX.IG.X.IN_THE_LAST_HOUR'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D1\05E9\05E2\05D4 \05D4\05D0\05D7\05E8\05D5\05E0\05D4')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139191853006751369)
,p_name=>'APEX.IG.X.IN_THE_LAST_MINUTE'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D1\05D3\05E7\05D4 \05D4\05D0\05D7\05E8\05D5\05E0\05D4')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139192629388751369)
,p_name=>'APEX.IG.X.IN_THE_LAST_MONTH'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D1\05D7\05D5\05D3\05E9 \05D4\05D0\05D7\05E8\05D5\05DF')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139192456215751369)
,p_name=>'APEX.IG.X.IN_THE_LAST_WEEK'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D1\05E9\05D1\05D5\05E2 \05D4\05D0\05D7\05E8\05D5\05DF')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139192818531751369)
,p_name=>'APEX.IG.X.IN_THE_LAST_YEAR'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D1\05E9\05E0\05D4 \05D4\05D0\05D7\05E8\05D5\05E0\05D4')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139194744703751370)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.DAYS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D1-%1 \05D4\05D9\05DE\05D9\05DD \05D4\05D1\05D0\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139194508434751370)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.HOURS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D1-%1 \05D4\05E9\05E2\05D5\05EA \05D4\05D1\05D0\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139194375398751370)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.MINUTES'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D1-%1 \05D4\05D3\05E7\05D5\05EA \05D4\05D1\05D0\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139195174592751370)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.MONTHS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D1-%1 \05D4\05D7\05D5\05D3\05E9\05D9\05DD \05D4\05D1\05D0\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139194971736751370)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.WEEKS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D1-%1 \05D4\05E9\05D1\05D5\05E2\05D5\05EA \05D4\05D1\05D0\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139195345525751370)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.YEARS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D1-%1 \05D4\05E9\05E0\05D9\05DD \05D4\05D1\05D0\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139194690151751370)
,p_name=>'APEX.IG.X.IN_THE_NEXT_DAY'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D1\05D9\05D5\05DD \05D4\05D1\05D0')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139194407892751370)
,p_name=>'APEX.IG.X.IN_THE_NEXT_HOUR'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D1\05E9\05E2\05D4 \05D4\05D1\05D0\05D4')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139194295083751370)
,p_name=>'APEX.IG.X.IN_THE_NEXT_MINUTE'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D1\05D3\05E7\05D4 \05D4\05D1\05D0\05D4')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139195035104751370)
,p_name=>'APEX.IG.X.IN_THE_NEXT_MONTH'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D1\05D7\05D5\05D3\05E9 \05D4\05D1\05D0')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139194866120751370)
,p_name=>'APEX.IG.X.IN_THE_NEXT_WEEK'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D1\05E9\05D1\05D5\05E2 \05D4\05D1\05D0')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139195208920751370)
,p_name=>'APEX.IG.X.IN_THE_NEXT_YEAR'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D1\05E9\05E0\05D4 \05D4\05D1\05D0\05D4')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139190890043751369)
,p_name=>'APEX.IG.X.IS_NOT_NULL'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D0\05D9\05E0\05D5 \05E8\05D9\05E7')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139190778902751369)
,p_name=>'APEX.IG.X.IS_NULL'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05E8\05D9\05E7')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139190558401751369)
,p_name=>'APEX.IG.X.LESS_THAN.Y'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05E7\05D8\05DF \05DE-%1')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139190609369751369)
,p_name=>'APEX.IG.X.LESS_THAN_OR_EQUALS.Y'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05E7\05D8\05DF \05D0\05D5 \05E9\05D5\05D5\05D4 %1')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139190983608751369)
,p_name=>'APEX.IG.X.LIKE.Y'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05DB\05DE\05D5 %1')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139191581845751369)
,p_name=>'APEX.IG.X.MATCHES_REGULAR_EXPRESSION.Y'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05DE\05EA\05D0\05D9\05DD \05DC-regular expression %1')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139197440226751371)
,p_name=>'APEX.IG.X.MINUTES_AGO'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05E4\05E0\05D9 %0 \05D3\05E7\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139191705393751369)
,p_name=>'APEX.IG.X.NOT_BETWEEN.Y.AND.Z'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D0\05D9\05E0\05D5 \05D1\05D9\05DF %1 \05DC-%2')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139190259332751368)
,p_name=>'APEX.IG.X.NOT_EQUALS.Y'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05DC\05D0 \05E9\05D5\05D5\05D4 %1')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139191217537751369)
,p_name=>'APEX.IG.X.NOT_IN.Y'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D0\05D9\05E0\05D5 \05D1-%1')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139193551554751369)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.DAYS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D0\05D9\05E0\05D5 \05D1-%1 \05D4\05D9\05DE\05D9\05DD \05D4\05D0\05D7\05E8\05D5\05E0\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139193310519751369)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.HOURS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D0\05D9\05E0\05D5 \05D1-%1 \05D4\05E9\05E2\05D5\05EA \05D4\05D0\05D7\05E8\05D5\05E0\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139193199456751369)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.MINUTES'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D0\05D9\05E0\05D5 \05D1-%1 \05D4\05D3\05E7\05D5\05EA \05D4\05D0\05D7\05E8\05D5\05E0\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139193968391751370)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.MONTHS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D0\05D9\05E0\05D5 \05D1-%1 \05D4\05D7\05D5\05D3\05E9\05D9\05DD \05D4\05D0\05D7\05E8\05D5\05E0\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139193779708751369)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.WEEKS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D0\05D9\05E0\05D5 \05D1-%1 \05D4\05E9\05D1\05D5\05E2\05D5\05EA \05D4\05D0\05D7\05E8\05D5\05E0\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139194135739751370)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.YEARS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D0\05D9\05E0\05D5 \05D1-%1 \05D4\05E9\05E0\05D9\05DD \05D4\05D0\05D7\05E8\05D5\05E0\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139193454450751369)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_DAY'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D0\05D9\05E0\05D5 \05D1\05D9\05D5\05DD \05D4\05D0\05D7\05E8\05D5\05DF')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139193244629751369)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_HOUR'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D0\05D9\05E0\05D5 \05D1\05E9\05E2\05D4 \05D4\05D0\05D7\05E8\05D5\05E0\05D4')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139193092971751369)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_MINUTE'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D0\05D9\05E0\05D5 \05D1\05D3\05E7\05D4 \05D4\05D0\05D7\05E8\05D5\05E0\05D4')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139193855820751369)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_MONTH'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D0\05D9\05E0\05D5 \05D1\05D7\05D5\05D3\05E9 \05D4\05D0\05D7\05E8\05D5\05DF')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139193685224751369)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_WEEK'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D0\05D9\05E0\05D5 \05D1\05E9\05D1\05D5\05E2 \05D4\05D0\05D7\05E8\05D5\05DF')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139194019164751370)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_YEAR'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D0\05D9\05E0\05D5 \05D1\05E9\05E0\05D4 \05D4\05D0\05D7\05E8\05D5\05E0\05D4')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139195986233751370)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.DAYS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D0\05D9\05E0\05D5 \05D1-%1 \05D4\05D9\05DE\05D9\05DD \05D4\05D1\05D0\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139195793647751370)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.HOURS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D0\05D9\05E0\05D5 \05D1-%1 \05D4\05E9\05E2\05D5\05EA \05D4\05D1\05D0\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139195519746751370)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.MINUTES'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D0\05D9\05E0\05D5 \05D1-%1 \05D4\05D3\05E7\05D5\05EA \05D4\05D1\05D0\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139196362427751370)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.MONTHS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D0\05D9\05E0\05D5 \05D1-%1 \05D4\05D7\05D5\05D3\05E9\05D9\05DD \05D4\05D1\05D0\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139196100523751370)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.WEEKS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D0\05D9\05E0\05D5 \05D1-%1 \05D4\05E9\05D1\05D5\05E2\05D5\05EA \05D4\05D1\05D0\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139196591902751370)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.YEARS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D0\05D9\05E0\05D5 \05D1-%1 \05D4\05E9\05E0\05D9\05DD \05D4\05D1\05D0\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139195865554751370)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_DAY'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D0\05D9\05E0\05D5 \05D1\05D9\05D5\05DD \05D4\05D1\05D0')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139195626180751370)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_HOUR'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D0\05D9\05E0\05D5 \05D1\05E9\05E2\05D4 \05D4\05D1\05D0\05D4')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139195463221751370)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_MINUTE'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D0\05D9\05E0\05D5 \05D1\05D3\05E7\05D4 \05D4\05D1\05D0\05D4')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139196200061751370)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_MONTH'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D0\05D9\05E0\05D5 \05D1\05D7\05D5\05D3\05E9 \05D4\05D1\05D0')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139196057533751370)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_WEEK'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D0\05D9\05E0\05D5 \05D1\05E9\05D1\05D5\05E2 \05D4\05D1\05D0')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139196461817751370)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_YEAR'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D0\05D9\05E0\05D5 \05D1\05E9\05E0\05D4 \05D4\05D1\05D0\05D4')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139191048512751369)
,p_name=>'APEX.IG.X.NOT_LIKE.Y'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05DC\05D0 \05DB\05DE\05D5 %1')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139197949473751371)
,p_name=>'APEX.IG.X.STARTS_WITH.Y'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05DE\05EA\05D7\05D9\05DC \05D1-%1')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139240300204751383)
,p_name=>'APEX.IG.X_COLUMN'
,p_message_language=>'he'
,p_message_text=>'X'
,p_is_js_message=>true
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139200661904751371)
,p_name=>'APEX.IG.YEARS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05E0\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704881
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139240410273751383)
,p_name=>'APEX.IG.Y_COLUMN'
,p_message_language=>'he'
,p_message_text=>'Y'
,p_is_js_message=>true
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139240580692751383)
,p_name=>'APEX.IG.Z_COLUMN'
,p_message_language=>'he'
,p_message_text=>'Z'
,p_is_js_message=>true
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139249519212751386)
,p_name=>'APEX.IG_FORMAT_SAMPLE_1'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05D5\05DD \05E9\05E0\05D9, \05D4-12 \05D1\05D9\05E0\05D5\05D0\05E8, 2016')
,p_is_js_message=>true
,p_version_scn=>2704893
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139249633929751386)
,p_name=>'APEX.IG_FORMAT_SAMPLE_2'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05E0\05D5\05D0\05E8')
,p_is_js_message=>true
,p_version_scn=>2704893
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139249740138751386)
,p_name=>'APEX.IG_FORMAT_SAMPLE_3'
,p_message_language=>'he'
,p_message_text=>unistr('16 \05E9\05E2\05D5\05EA \05DC\05E4\05E0\05D9 \05DB\05DF')
,p_is_js_message=>true
,p_version_scn=>2704893
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139249811806751386)
,p_name=>'APEX.IG_FORMAT_SAMPLE_4'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1-16h')
,p_is_js_message=>true
,p_version_scn=>2704893
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139067873357751332)
,p_name=>'APEX.ITEM.CROPPER.APPLY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D7\05DC')
,p_is_js_message=>true
,p_version_scn=>2704858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139059865188751329)
,p_name=>'APEX.ITEM.CROPPER.HELP.TEXT'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\05D2\05E8\05D5\05E8 \05D0\05EA \05D4\05EA\05DE\05D5\05E0\05D4 \05E9\05DC\05DA \05D5\05D4\05E9\05EA\05DE\05E9 \05D1\05DE\05D7\05D5\05D5\05DF \05D6\05D5\05DD \05DB\05D3\05D9 \05DC\05DE\05E7\05DD \05D0\05D5\05EA\05D5 \05DE\05D7\05D3\05E9 \05D1\05EA\05D5\05DA \05D4\05DE\05E1\05D2\05E8\05EA.</p>'),
'',
unistr('<p>\05DB\05D0\05E9\05E8 \05DE\05EA\05DE\05E7\05D3\05D9\05DD \05D1\05D7\05D5\05EA\05DA \05D4\05EA\05DE\05D5\05E0\05D5\05EA, \05DE\05E7\05E9\05D9 \05D4\05E7\05D9\05E6\05D5\05E8 \05D4\05D1\05D0\05D9\05DD \05D6\05DE\05D9\05E0\05D9\05DD:</p>'),
'<ul>',
unistr('    <li>\05D7\05E5 \05E9\05DE\05D0\05DC\05D9: \05D4\05D6\05D6 \05D0\05EA \05D4\05EA\05DE\05D5\05E0\05D4 \05E9\05DE\05D0\05DC\05D4*</li>'),
unistr('    <li>\05D7\05E5 \05DC\05DE\05E2\05DC\05D4: \05D4\05D6\05D6 \05D0\05EA \05D4\05EA\05DE\05D5\05E0\05D4 \05DC\05DE\05E2\05DC\05D4*</li>'),
unistr('    <li>\05D7\05E5 \05D9\05DE\05E0\05D9: \05D4\05D6\05D6 \05EA\05DE\05D5\05E0\05D4 \05D9\05DE\05D9\05E0\05D4*</li>'),
unistr('    <li>\05D7\05E5 \05DC\05DE\05D8\05D4: \05D4\05D6\05D6 \05EA\05DE\05D5\05E0\05D4 \05DC\05DE\05D8\05D4*</li>'),
unistr('    <li>I: \05D4\05EA\05E7\05E8\05D1\05D5\05EA</li>'),
unistr('    <li>O: \05D4\05EA\05E8\05D7\05E7\05D5\05EA</li>'),
unistr('    <li>L: \05E1\05D5\05D1\05D1 \05E9\05DE\05D0\05DC\05D4</li>'),
unistr('    <li>R: \05E1\05D5\05D1\05D1 \05D9\05DE\05D9\05E0\05D4</li>'),
'</ul>',
'',
unistr('<p class="margin-top-md"><em>*\05D4\05D7\05D6\05E7 \05D0\05EA \05DE\05E7\05E9 Shift \05DB\05D3\05D9 \05DC\05D4\05D6\05D9\05D6 \05DE\05D4\05E8 \05D9\05D5\05EA\05E8</em></p>')))
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139060038891751330)
,p_name=>'APEX.ITEM.CROPPER.HELP.TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D6\05E8\05D4 \05D1\05D7\05D9\05EA\05D5\05DA \05EA\05DE\05D5\05E0\05D4')
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139067931163751332)
,p_name=>'APEX.ITEM.CROPPER.RESET'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E4\05D5\05E1')
,p_is_js_message=>true
,p_version_scn=>2704858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139060386171751330)
,p_name=>'APEX.ITEM.CROPPER.TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D9\05EA\05D5\05DA \05EA\05DE\05D5\05E0\05D4')
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139068029147751332)
,p_name=>'APEX.ITEM.CROPPER.ZOOM_SLIDER_LABEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D6\05D6 \05DE\05D7\05D5\05D5\05DF \05DB\05D3\05D9 \05DC\05D4\05EA\05D0\05D9\05DD \05E8\05DE\05EA \05D6\05D5\05DD')
,p_is_js_message=>true
,p_version_scn=>2704858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139097610234751341)
,p_name=>'APEX.ITEM.FILE.ACCEPTED_TYPES'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D5\05D2 \05E7\05D5\05D1\05E5 \05DC\05D0 \05EA\05E7\05E3. \05E1\05D5\05D2\05D9 \05E7\05D5\05D1\05E5 \05E0\05EA\05DE\05DB\05D9\05DD %0.')
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139232066749751381)
,p_name=>'APEX.ITEM.FILE.BROWSE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D9\05D9\05DF')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139231713527751381)
,p_name=>'APEX.ITEM.FILE.CHOOSE_FILE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05E8 \05E7\05D5\05D1\05E5')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139231811468751381)
,p_name=>'APEX.ITEM.FILE.CHOOSE_FILES'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05E8 \05E7\05D1\05E6\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139097407997751341)
,p_name=>'APEX.ITEM.FILE.DROP_FILE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D2\05E8\05D5\05E8 \05D5\05E9\05D7\05E8\05E8')
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139097883541751341)
,p_name=>'APEX.ITEM.FILE.DROP_FILES'
,p_message_language=>'he'
,p_message_text=>unistr('\05D2\05E8\05D5\05E8 \05D5\05E9\05D7\05E8\05E8 \05E7\05D1\05E6\05D9\05DD')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139099272263751341)
,p_name=>'APEX.ITEM.FILE.DROP_OR_CHOOSE_FILE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05E8 \05E7\05D5\05D1\05E5 \05D0\05D5 \05E9\05D7\05E8\05E8 \05D0\05D5\05EA\05D5 \05DB\05D0\05DF.')
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139099393563751342)
,p_name=>'APEX.ITEM.FILE.DROP_OR_CHOOSE_FILES'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05E8 \05E7\05D1\05E6\05D9\05DD \05D0\05D5 \05E9\05D7\05E8\05E8 \05D0\05D5\05EA\05DD \05DB\05D0\05DF.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139099407684751342)
,p_name=>'APEX.ITEM.FILE.DROP_OR_SELECT_FILE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05E8 \05E7\05D5\05D1\05E5 \05D0\05D5 \05E9\05D7\05E8\05E8 \05D0\05D5\05EA\05D5 \05DB\05D0\05DF.')
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139099529666751342)
,p_name=>'APEX.ITEM.FILE.DROP_OR_SELECT_FILES'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05E8 \05E7\05D1\05E6\05D9\05DD \05D0\05D5 \05E9\05D7\05E8\05E8 \05D0\05D5\05EA\05DD \05DB\05D0\05DF.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139097741454751341)
,p_name=>'APEX.ITEM.FILE.FILES_WITH_COUNT'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05E7\05D1\05E6\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139097508246751341)
,p_name=>'APEX.ITEM.FILE.MAX_FILE_SIZE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E7\05D5\05D1\05E5 \05D2\05D3\05D5\05DC \05DE\05D3\05D9. \05D2\05D5\05D3\05DC \05DE\05E8\05D1\05D9 \05E9\05DC \05E7\05D5\05D1\05E5 \05D4\05D5\05D0 %0.')
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139078065294751335)
,p_name=>'APEX.ITEM.FILE.MULTIPLE_FILES_NOT_SUPPORTED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E2\05DC\05D0\05D5\05EA \05E7\05D1\05E6\05D9\05DD \05DE\05E8\05D5\05D1\05D9\05DD \05D0\05D9\05E0\05DF \05E0\05EA\05DE\05DB\05D5\05EA.')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139060913418751330)
,p_name=>'APEX.ITEM.FILE.REMOVE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05E8')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139066487760751332)
,p_name=>'APEX.ITEM.GEOCODE.ADDRESS_REQUIRED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05E8\05D5\05E9\05D4 \05DB\05EA\05D5\05D1\05EA.')
,p_is_js_message=>true
,p_version_scn=>2704858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139065361366751331)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_CITY'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D9\05E8')
,p_is_js_message=>true
,p_version_scn=>2704857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139065771055751331)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_COUNTRY'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D5\05D3 \05D4\05D0\05E8\05E5')
,p_is_js_message=>true
,p_version_scn=>2704857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139065405347751331)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_HOUSENUMBER'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E1\05E4\05E8 \05D1\05D9\05EA')
,p_is_js_message=>true
,p_version_scn=>2704857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139066339453751332)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_LATITUDE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D5 \05E8\05D5\05D7\05D1')
,p_is_js_message=>true
,p_version_scn=>2704858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139066251793751332)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_LONGITUDE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D5 \05D0\05D5\05E8\05DA')
,p_is_js_message=>true
,p_version_scn=>2704858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139066164414751332)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_MAPLINK'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E6\05D2 \05D1\05DE\05E4\05D4')
,p_is_js_message=>true
,p_version_scn=>2704858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139065811121751331)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_MATCHSCORE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05D9\05E7\05D5\05D3')
,p_is_js_message=>true
,p_version_scn=>2704857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139065519584751331)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_POSTALCODE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D9\05E7\05D5\05D3')
,p_is_js_message=>true
,p_version_scn=>2704857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139065647831751331)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_STATE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D3\05D9\05E0\05D4')
,p_is_js_message=>true
,p_version_scn=>2704857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139065290519751331)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_STREET'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05D7\05D5\05D1')
,p_is_js_message=>true
,p_version_scn=>2704857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139065117145751331)
,p_name=>'APEX.ITEM.GEOCODE.DIALOG_TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D5\05E6\05D0\05D5\05EA \05DE\05E2\05E8\05DB\05EA \05D2\05D9\05D0\05D5\05E7\05D5\05D3')
,p_is_js_message=>true
,p_version_scn=>2704857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139096629104751341)
,p_name=>'APEX.ITEM.GEOCODE.GEOCODING_DONE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D5\05D3\05D3 \05D1\05DE\05E2\05E8\05DB\05EA \05D2\05D9\05D0\05D5\05E7\05D5\05D3')
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139096785678751341)
,p_name=>'APEX.ITEM.GEOCODE.GEOCODING_OPEN'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E7\05D5\05D3\05D3 \05D1\05DE\05E2\05E8\05DB\05EA \05D2\05D9\05D0\05D5\05E7\05D5\05D3')
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139066050623751332)
,p_name=>'APEX.ITEM.GEOCODE.MAP_DIALOG_TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E4\05D4')
,p_is_js_message=>true
,p_version_scn=>2704858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139065926544751332)
,p_name=>'APEX.ITEM.GEOCODE.NO_DATA_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05DE\05E6\05D0\05D5 \05DB\05EA\05D5\05D1\05D5\05EA.')
,p_is_js_message=>true
,p_version_scn=>2704858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139066527510751332)
,p_name=>'APEX.ITEM.GEOCODE.REQUIRED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05E8\05D5\05E9 %0.')
,p_is_js_message=>true
,p_version_scn=>2704858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139172739066751363)
,p_name=>'APEX.ITEM.GEOCODE.REQUIRED_MULTIPLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05E8\05D5\05E9\05D9\05DD %0 \05D0\05D5 %1.')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139262253626751390)
,p_name=>'APEX.ITEM.HELP_TEXT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E6\05D2\05EA \05D8\05E7\05E1\05D8 \05E2\05D6\05E8\05D4 \05D1\05E9\05D1\05D9\05DC  %0.')
,p_is_js_message=>true
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139068231398751332)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.CHOOSE_FILE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05E8 \05EA\05DE\05D5\05E0\05D4')
,p_is_js_message=>true
,p_version_scn=>2704858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139068391102751332)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.CHOOSE_FILES'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05E8 \05EA\05DE\05D5\05E0\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139068141035751332)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DOWNLOAD_LINK_TEXT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05E8\05D3')
,p_is_js_message=>true
,p_version_scn=>2704858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139068481206751332)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_FILE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D2\05E8\05D5\05E8 \05D5\05E9\05D7\05E8\05E8')
,p_is_js_message=>true
,p_version_scn=>2704858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139068544171751332)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_FILES'
,p_message_language=>'he'
,p_message_text=>unistr('\05D2\05E8\05D5\05E8 \05D5\05E9\05D7\05E8\05E8 \05EA\05DE\05D5\05E0\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139068639743751332)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_CHOOSE_FILE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05E8 \05EA\05DE\05D5\05E0\05D4 \05D0\05D5 \05E9\05D7\05E8\05E8 \05D0\05D5\05EA\05D4 \05DB\05D0\05DF.')
,p_is_js_message=>true
,p_version_scn=>2704858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139068740264751332)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_CHOOSE_FILES'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05E8 \05D0\05D5 \05E9\05D7\05E8\05E8 \05EA\05DE\05D5\05E0\05D5\05EA \05DB\05D0\05DF.')
,p_is_js_message=>true
,p_version_scn=>2704858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139068823933751332)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_SELECT_FILE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05E8 \05EA\05DE\05D5\05E0\05D4 \05D0\05D5 \05E9\05D7\05E8\05E8 \05D0\05D5\05EA\05D4 \05DB\05D0\05DF.')
,p_is_js_message=>true
,p_version_scn=>2704858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139068912751751332)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_SELECT_FILES'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05E8 \05D0\05D5 \05E9\05D7\05E8\05E8 \05EA\05DE\05D5\05E0\05D5\05EA \05DB\05D0\05DF.')
,p_is_js_message=>true
,p_version_scn=>2704858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139153609029751358)
,p_name=>'APEX.ITEM_TYPE.CHECKBOX.CHECKED'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E1\05D5\05DE\05DF')
,p_is_js_message=>true
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139153763632751358)
,p_name=>'APEX.ITEM_TYPE.CHECKBOX.UNCHECKED'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05DE\05E1\05D5\05DE\05DF')
,p_is_js_message=>true
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139181264957751366)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.EMPTY_READONLY_COMBOBOX'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D9\05D1\05EA \05E7\05D5\05DE\05D1\05D5 \05E8\05D9\05E7\05D4 \05DC\05E7\05E8\05D9\05D0\05D4 \05D1\05DC\05D1\05D3')
,p_version_scn=>2704878
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139179048207751365)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.EMPTY_READONLY_LISTBOX'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D9\05D1\05EA \05E8\05E9\05D9\05DE\05D4 \05E8\05D9\05E7\05D4 \05DC\05E7\05E8\05D9\05D0\05D4 \05D1\05DC\05D1\05D3')
,p_version_scn=>2704877
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139178877061751365)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.READONLY_COMBOBOX'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D9\05D1\05EA \05E7\05D5\05DE\05D1\05D5 \05DC\05E7\05E8\05D9\05D0\05D4 \05D1\05DC\05D1\05D3')
,p_version_scn=>2704877
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139178979934751365)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.READONLY_LISTBOX'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D9\05D1\05EA \05E8\05E9\05D9\05DE\05D4 \05DC\05E7\05E8\05D9\05D0\05D4 \05D1\05DC\05D1\05D3')
,p_version_scn=>2704877
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139094629787751340)
,p_name=>'APEX.ITEM_TYPE.SLIDER.VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'he'
,p_message_text=>unistr('#LABEL# \05D0\05D9\05E0\05D5 \05D1\05D8\05D5\05D5\05D7 \05D4\05EA\05E7\05E3 \05E9\05DC %0 \05E2\05D3 %1.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139094753732751340)
,p_name=>'APEX.ITEM_TYPE.SLIDER.VALUE_NOT_MULTIPLE_OF_STEP'
,p_message_language=>'he'
,p_message_text=>unistr('#LABEL# \05D0\05D9\05E0\05D5 \05DB\05E4\05D5\05DC\05D4 \05E9\05DC %0.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139182050743751366)
,p_name=>'APEX.ITEM_TYPE.SWITCH.READONLY_SWITCH'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D7\05DC\05E4\05D4 \05DC\05E7\05E8\05D9\05D0\05D4 \05D1\05DC\05D1\05D3')
,p_version_scn=>2704879
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139122649055751348)
,p_name=>'APEX.ITEM_TYPE.TEXT.READONLY_WITH_LINK'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E8\05D9\05DB\05D4 \05DC\05E7\05E8\05D9\05D0\05D4 \05D1\05DC\05D1\05D3 \05E2\05DD \05E7\05D9\05E9\05D5\05E8')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139094268725751340)
,p_name=>'APEX.ITEM_TYPE.YES_NO.INVALID_VALUE'
,p_message_language=>'he'
,p_message_text=>unistr('#LABEL# \05E6\05E8\05D9\05DA \05DC\05D4\05EA\05D0\05D9\05DD \05DC\05E2\05E8\05DB\05D9\05DD %0 \05D5-%1.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139094402044751340)
,p_name=>'APEX.ITEM_TYPE.YES_NO.NO_LABEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139180774793751366)
,p_name=>'APEX.ITEM_TYPE.YES_NO.OFF_LABEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D1\05D5\05D9')
,p_version_scn=>2704878
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139180867262751366)
,p_name=>'APEX.ITEM_TYPE.YES_NO.ON_LABEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D5\05E4\05E2\05DC')
,p_version_scn=>2704878
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139094363975751340)
,p_name=>'APEX.ITEM_TYPE.YES_NO.YES_LABEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05DF ')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139102283602751342)
,p_name=>'APEX.LANGUAGE_SELECTOR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D5\05E8\05E8 \05E9\05E4\05D4')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139038600021751323)
,p_name=>'APEX.LIST_MANAGER.ADD_ENTRY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05E1\05E3 \05E8\05E9\05D5\05DE\05D4')
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139215407207751376)
,p_name=>'APEX.LIST_MANAGER.BUTTON_ADD'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05E1\05E3')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139215513167751376)
,p_name=>'APEX.LIST_MANAGER.BUTTON_REMOVE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05E8')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139038703929751323)
,p_name=>'APEX.LIST_MANAGER.SELECTED_ENTRY'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05E9\05D5\05DE\05D5\05EA \05E9\05E0\05D1\05D7\05E8\05D5')
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139219249452751377)
,p_name=>'APEX.LTO.ADVANCED'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05EA\05E7\05D3\05DD')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139219504628751377)
,p_name=>'APEX.LTO.CANCEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D8\05DC')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139219338532751377)
,p_name=>'APEX.LTO.COMMON'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E9\05D5\05EA\05E3')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139219671237751377)
,p_name=>'APEX.LTO.LIVE_TEMPLATE_OPTIONS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05E4\05E9\05E8\05D5\05D9\05D5\05EA \05EA\05D1\05E0\05D9\05EA \05D7\05D9\05D4')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139220206925751377)
,p_name=>'APEX.LTO.NOT_APPLICABLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05E4\05E9\05E8\05D5\05D9\05D5\05EA \05D4\05EA\05D1\05E0\05D9\05EA \05D0\05D9\05E0\05DF \05D6\05DE\05D9\05E0\05D5\05EA \05DB\05D9\05D5\05D5\05DF \05E9\05E8\05DB\05D9\05D1 \05D6\05D4 \05D0\05D9\05E0\05D5 \05DE\05D5\05E6\05D2 \05D1\05D3\05E3.')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139219104228751377)
,p_name=>'APEX.LTO.NO_OPTIONS_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05DE\05E6\05D0\05D5 \05D0\05E4\05E9\05E8\05D5\05D9\05D5\05EA \05EA\05D1\05E0\05D9\05EA')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139219488037751377)
,p_name=>'APEX.LTO.SAVE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DE\05D5\05E8')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139073222197751334)
,p_name=>'APEX.MAPS.CLEAR_CIRCLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05E7\05D4 \05E2\05D9\05D2\05D5\05DC')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139075674517751334)
,p_name=>'APEX.MAPS.CUSTOM_STYLES_INVALID_JSON'
,p_message_language=>'he'
,p_message_text=>unistr('''\05E1\05D2\05E0\05D5\05E0\05D5\05EA \05DE\05D5\05EA\05D0\05DE\05D9\05DD \05D0\05D9\05E9\05D9\05EA'' \05D0\05D9\05E0\05D5 JSON \05EA\05E7\05E3.')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139073522817751334)
,p_name=>'APEX.MAPS.DISTANCE_TOOL'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05DC\05D9 \05DE\05E8\05D7\05E7')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139073376122751334)
,p_name=>'APEX.MAPS.DRAW_CIRCLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05E8\05D8\05D8 \05E2\05D9\05D2\05D5\05DC')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139053168421751328)
,p_name=>'APEX.MAPS.FIND_MY_LOCATION'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D9\05E7\05D5\05DD \05E0\05D5\05DB\05D7\05D9')
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139059527948751329)
,p_name=>'APEX.MAPS.INIT_POINT_COORDINATES_INVALID'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D5\05D0\05D5\05E8\05D3\05D9\05E0\05D8\05D5\05EA \05D4\05DE\05D9\05E7\05D5\05DD \05D4\05D4\05EA\05D7\05DC\05EA\05D9 \05D0\05D9\05E0\05DF \05EA\05E7\05E4\05D5\05EA.')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139048525831751326)
,p_name=>'APEX.MAPS.INIT_POINT_GEOMETRY_REQUIRED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05DE\05D9\05E7\05D5\05DD \05D4\05D4\05EA\05D7\05DC\05EA\05D9 \05E6\05E8\05D9\05DA \05DC\05D4\05D9\05D5\05EA \05D2\05D9\05D0\05D5\05DE\05D8\05E8\05D9\05D9\05EA \05E0\05E7\05D5\05D3\05D5\05EA.')
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139057175902751329)
,p_name=>'APEX.MAPS.KM'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7"\05DE')
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139052382500751327)
,p_name=>'APEX.MAPS.LAYER'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DB\05D1\05D4')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139222756610751378)
,p_name=>'APEX.MAPS.LAYER_NAME'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DB\05D1\05D4: %0')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139071551308751333)
,p_name=>'APEX.MAPS.MAP'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E4\05D4')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139041290707751324)
,p_name=>'APEX.MAPS.MAP_MESSAGES'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05D3\05E2\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139057303829751329)
,p_name=>'APEX.MAPS.MILES'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D9\05D9\05DC\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139221713529751378)
,p_name=>'APEX.MAPS.MORE_DATA_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E0\05EA\05D5\05E0\05D9\05DD \05DE\05DB\05D9\05DC\05D9\05DD \05D9\05D5\05EA\05E8 \05DE-%0 \05E9\05D5\05E8\05D5\05EA, \05DE\05D4 \05E9\05D7\05D5\05E8\05D2 \05DE\05D4\05DE\05E1\05E4\05E8 \05D4\05DE\05E8\05D1 \05D4\05DE\05D5\05EA\05E8.')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139051669659751327)
,p_name=>'APEX.MAPS.ORACLE_MAP_COPYRIGHT'
,p_message_language=>'he'
,p_message_text=>unistr('&copy; 2022 Oracle Corporation &nbsp;&nbsp; <a rel="noopener noreferrer" target="_blank" href="https://elocation.oracle.com/elocation/legal.html">Terms</a> &nbsp;&nbsp; \05DE\05E4\05D4 \05E0\05EA\05D5\05E0\05D9 &copy; 2021 \05DB\05D0\05DF')
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139048277841751326)
,p_name=>'APEX.MAPS.ORACLE_SDO_GEOMETRY_NOT_AVAILABLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D5\05D2 \05D4\05E0\05EA\05D5\05E0\05D9\05DD SDO_GEOMETRY \05D0\05D9\05E0\05D5 \05D6\05DE\05D9\05DF \05D1\05DE\05E1\05D3 \05E0\05EA\05D5\05E0\05D9\05DD \05D6\05D4.')
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139051746712751327)
,p_name=>'APEX.MAPS.OSM_MAP_COPYRIGHT'
,p_message_language=>'he'
,p_message_text=>unistr('<a rel="noopener noreferrer" target="_blank" href="http://openmaptiles.org"> &copy; OpenMapTiles </a> &nbsp; <a rel="noopener noreferrer" target="_blank" href="https://www.openstreetmap.org/copyright"> &copy; \05EA\05D5\05E8\05DE\05D9 OpenStreetMap</a>')
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139076363107751335)
,p_name=>'APEX.MAPS.OSM_VECTOR_MAP_COPYRIGHT'
,p_message_language=>'he'
,p_message_text=>unistr('<a rel="noopener noreferrer" target="blank" href="https://www.maptiler.com/copyright"> &copy; MapTiler</a> &nbsp; <a rel="noopener noreferrer" target="_blank" href="https://www.openstreetmap.org/copyright"> &copy; \05EA\05D5\05E8\05DE\05D9 OpenStreetMap</a>')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139052594730751327)
,p_name=>'APEX.MAPS.POINTS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05E7\05D5\05D3\05D5\05EA')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139222889194751378)
,p_name=>'APEX.MAPS.POINTS_COUNT'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05E0\05E7\05D5\05D3\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139073422682751334)
,p_name=>'APEX.MAPS.RECTANGLE_ZOOM'
,p_message_language=>'he'
,p_message_text=>unistr('\05D6\05D5\05DD \05DE\05DC\05D1\05E0\05D9')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139073198703751334)
,p_name=>'APEX.MAPS.REMOVE_MESSAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05E8')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139052974609751327)
,p_name=>'APEX.MAPS.RESET_BEARING_TO_NORTH'
,p_message_language=>'he'
,p_message_text=>unistr('\05E6\05E4\05D5\05DF \05EA\05DE\05D9\05D3 \05DC\05DE\05E2\05DC\05D4')
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139167775803751362)
,p_name=>'APEX.MAPS.TOGGLE_2D_MODE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D7\05DC\05E3 \05DC\05DE\05E6\05D1 \05D3\05D5-\05DE\05DE\05D3\05D9')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139167852770751362)
,p_name=>'APEX.MAPS.TOGGLE_3D_MODE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D7\05DC\05E3 \05DC\05DE\05E6\05D1 \05EA\05DC\05EA-\05DE\05DE\05D3\05D9')
,p_is_js_message=>true
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139073054319751334)
,p_name=>'APEX.MAPS.TOGGLE_COPYRIGHT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D7\05DC\05E3 \05DE\05E6\05D1 \05E9\05DC \05D4\05D5\05D3\05E2\05EA \05D6\05DB\05D5\05D9\05D5\05EA \05D9\05D5\05E6\05E8\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139073603708751334)
,p_name=>'APEX.MAPS.TOTAL_DISTANCE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E8\05D7\05E7 \05DB\05D5\05DC\05DC')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139052609246751327)
,p_name=>'APEX.MAPS.ZOOM_IN'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05EA\05E7\05E8\05D1\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139052885728751327)
,p_name=>'APEX.MAPS.ZOOM_OUT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05EA\05E8\05D7\05E7\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139217323202751377)
,p_name=>'APEX.MARKDOWN.BOLD'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D5\05D3\05D2\05E9')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139218299564751377)
,p_name=>'APEX.MARKDOWN.IMAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05DE\05D5\05E0\05D4')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139217882061751377)
,p_name=>'APEX.MARKDOWN.INLINE_CODE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D5\05D3 \05DB\05DC\05D5\05DC')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139230577622751380)
,p_name=>'APEX.MARKDOWN.INSERT_IMAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05E1\05E4\05EA \05EA\05DE\05D5\05E0\05D4')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139230690432751380)
,p_name=>'APEX.MARKDOWN.INSERT_LINK'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05E1\05E4\05EA \05E7\05D9\05E9\05D5\05E8')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139217468546751377)
,p_name=>'APEX.MARKDOWN.ITALIC'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05D8\05D5\05D9')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139231219711751381)
,p_name=>'APEX.MARKDOWN.LINK'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D9\05E9\05D5\05E8')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139218172405751377)
,p_name=>'APEX.MARKDOWN.LIST'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05E9\05D9\05DE\05D4')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139218064455751377)
,p_name=>'APEX.MARKDOWN.ORDERED_LIST'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05E9\05D9\05DE\05D4 \05DE\05E1\05D5\05D3\05E8\05EA')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139217531570751377)
,p_name=>'APEX.MARKDOWN.PREVIEW'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05E6\05D5\05D2\05D4 \05DE\05E7\05D3\05D9\05DE\05D4')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139217650016751377)
,p_name=>'APEX.MARKDOWN.PREVIEW_EMPTY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05DF \05DE\05D4 \05DC\05D4\05E6\05D9\05D2 \05D1\05EA\05E6\05D5\05D2\05D4 \05DE\05E7\05D3\05D9\05DE\05D4')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139217703323751377)
,p_name=>'APEX.MARKDOWN.STRIKETHROUGH'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D5 \05D7\05D5\05E6\05D4')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139217997242751377)
,p_name=>'APEX.MARKDOWN.UNORDERED_LIST'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05E9\05D9\05DE\05D4 \05DC\05D0 \05DE\05E1\05D5\05D3\05E8\05EA')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139196827199751370)
,p_name=>'APEX.MENU.CURRENT_MENU'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05D5\05DB\05D7\05D9')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139253001740751387)
,p_name=>'APEX.MENU.OVERFLOW_LABEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D5\05D3...')
,p_is_js_message=>true
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139196745540751370)
,p_name=>'APEX.MENU.PROCESSING'
,p_message_language=>'he'
,p_message_text=>unistr('\05D8\05D5\05E2\05DF')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139110984464751345)
,p_name=>'APEX.MENU.SPLIT_BUTTON'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D7\05E6\05DF \05E4\05D9\05E6\05D5\05DC')
,p_is_js_message=>true
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139110864705751345)
,p_name=>'APEX.MENU.SPLIT_MENU'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05E4\05E8\05D9\05D8 \05DE\05E4\05D5\05E6\05DC')
,p_is_js_message=>true
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139227831544751380)
,p_name=>'APEX.NOTIFICATION_MESSAGE_HEADING'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05D3\05E2\05D4')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139051908357751327)
,p_name=>'APEX.NO_DATA_FOUND_ENTITY'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05DE\05E6\05D0 %0')
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139201846559751372)
,p_name=>'APEX.NUMBER_FIELD.VALUE_GREATER_MAX_VALUE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E2\05E8\05DA \05E9\05DC #LABEL# \05D7\05D9\05D9\05D1 \05DC\05D4\05D9\05D5\05EA \05DE\05E1\05E4\05E8 \05E7\05D8\05DF \05D0\05D5 \05E9\05D5\05D5\05D4 \05DC-%0.')
,p_is_js_message=>true
,p_version_scn=>2704881
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139201993239751372)
,p_name=>'APEX.NUMBER_FIELD.VALUE_INVALID'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E2\05E8\05DA \05E9\05DC #LABEL# \05D7\05D9\05D9\05D1 \05DC\05D4\05D9\05D5\05EA \05DE\05E1\05E4\05E8 \05EA\05E7\05E3.')
,p_is_js_message=>true
,p_version_scn=>2704881
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139202007161751372)
,p_name=>'APEX.NUMBER_FIELD.VALUE_INVALID2'
,p_message_language=>'he'
,p_message_text=>unistr('#LABEL# \05D0\05D9\05E0\05D5 \05EA\05D5\05D0\05DD \05DC\05E4\05D5\05E8\05DE\05D8 \05D4\05DE\05E1\05E4\05E8 %0 (\05D3\05D5\05D2\05DE\05D4: %1).')
,p_version_scn=>2704881
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139201703929751372)
,p_name=>'APEX.NUMBER_FIELD.VALUE_LESS_MIN_VALUE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E2\05E8\05DA \05E9\05DC #LABEL# \05D7\05D9\05D9\05D1 \05DC\05D4\05D9\05D5\05EA \05DE\05E1\05E4\05E8 \05D2\05D3\05D5\05DC \05D0\05D5 \05E9\05D5\05D5\05D4 \05DC-%0.')
,p_is_js_message=>true
,p_version_scn=>2704881
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139201677453751372)
,p_name=>'APEX.NUMBER_FIELD.VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E2\05E8\05DA \05E9\05DC #LABEL# \05D7\05D9\05D9\05D1 \05DC\05D4\05D9\05D5\05EA \05DE\05E1\05E4\05E8 \05D1\05D9\05DF %0 \05DC\05D1\05D9\05DF %1.')
,p_is_js_message=>true
,p_version_scn=>2704881
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139196940024751370)
,p_name=>'APEX.OPENS_IN_NEW_WINDOW_LOWER'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05E4\05EA\05D7 \05D1\05D7\05DC\05D5\05DF \05D7\05D3\05E9')
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139146776543751356)
,p_name=>'APEX.PAGE.DUPLICATE_SUBMIT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05E3 \05D6\05D4 \05E0\05E9\05DC\05D7 \05DB\05D1\05E8 \05D5\05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05E9\05DC\05D5\05D7 \05D0\05D5\05EA\05D5 \05E9\05D5\05D1.')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139128119289751350)
,p_name=>'APEX.PAGE.NOT_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D9\05D9\05E9\05D5\05DD "%0" \05D3\05E3 "%1" \05DC\05D0 \05E0\05DE\05E6\05D0.')
,p_version_scn=>2704869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139163667018751361)
,p_name=>'APEX.PAGE_ITEM_IS_REQUIRED'
,p_message_language=>'he'
,p_message_text=>unistr('#LABEL# \05D7\05D9\05D9\05D1 \05DC\05D4\05D9\05D5\05EA \05E2\05DD \05E2\05E8\05DA \05DB\05DC\05E9\05D4\05D5.')
,p_is_js_message=>true
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139054368031751328)
,p_name=>'APEX.PASSWORD.HIDE_PASSWORD'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05EA\05E8 \05E1\05D9\05E1\05DE\05D4')
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139054237730751328)
,p_name=>'APEX.PASSWORD.SHOW_PASSWORD'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E6\05D2 \05E1\05D9\05E1\05DE\05D4')
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139101820425751342)
,p_name=>'APEX.POPUP.SEARCH'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05E4\05E9')
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139215879904751376)
,p_name=>'APEX.POPUP_LOV.BUTTON_CLOSE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D2\05D5\05E8')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139215752402751376)
,p_name=>'APEX.POPUP_LOV.BUTTON_FIND'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05E4\05E9%0')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139216069380751376)
,p_name=>'APEX.POPUP_LOV.BUTTON_NEXT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D1\05D0')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139215934075751376)
,p_name=>'APEX.POPUP_LOV.BUTTON_PREV'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E7\05D5\05D3\05DD')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139092645947751340)
,p_name=>'APEX.POPUP_LOV.FILTER_REQ'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D6\05DF \05D1\05D9\05D8\05D5\05D9 \05D7\05D9\05E4\05D5\05E9 \05E9\05DC %0 \05EA\05D5\05D5\05D9\05DD \05DC\05E4\05D7\05D5\05EA.')
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139168983541751362)
,p_name=>'APEX.POPUP_LOV.ICON_TEXT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05E9\05D9\05DE\05EA \05E2\05E8\05DB\05D9\05DD \05E6\05E6\05D4: %0')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139092788956751340)
,p_name=>'APEX.POPUP_LOV.INITIAL_FILTER_REQ'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D6\05DF \05DE\05D5\05E0\05D7 \05D7\05D9\05E4\05D5\05E9.')
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139039721428751324)
,p_name=>'APEX.POPUP_LOV.LIST_OF_VALUES'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05E9\05D9\05DE\05EA \05E2\05E8\05DB\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139092551453751339)
,p_name=>'APEX.POPUP_LOV.NO_RESULTS'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05DE\05E6\05D0\05D5 \05EA\05D5\05E6\05D0\05D5\05EA.')
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139092443448751339)
,p_name=>'APEX.POPUP_LOV.REMOVE_VALUE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05E8 %0')
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139189635307751368)
,p_name=>'APEX.POPUP_LOV.SEARCH'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D9\05D8\05D5\05D9 \05D7\05D9\05E4\05D5\05E9')
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139215634312751376)
,p_name=>'APEX.POPUP_LOV.TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05E4\05E9')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139041817771751324)
,p_name=>'APEX.PRINT.DOCGEN_REQUIRED'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05D3\05E8\05E9 %0.')
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139054125290751328)
,p_name=>'APEX.PRINT_REPORT.ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05DE\05D4\05DC\05DA \05D4\05D3\05E4\05E1\05EA \05D3\05D5\05D7.')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139064959302751331)
,p_name=>'APEX.PRINT_UTIL.UNABLE_TO_PRINT'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05D9\05EA\05DF \05DC\05D4\05D3\05E4\05D9\05E1 \05D0\05EA \05D4\05DE\05E1\05DE\05DA \05D1\05D0\05DE\05E6\05E2\05D5\05EA \05E9\05E8\05EA \05D4\05D4\05D3\05E4\05E1\05D4 \05D4\05DE\05D5\05D2\05D3\05E8.')
,p_version_scn=>2704857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139087600549751338)
,p_name=>'APEX.PROCESS.INVOKE_API.PARAMETER_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05DE\05D4\05DC\05DA \05D4\05E2\05E8\05DB\05D4 \05E9\05DC \05E4\05E8\05DE\05D8\05E8 %0 \05D1\05E2\05EA \05E7\05E8\05D9\05D0\05D4 \05DC-%1. \05E2\05D9\05D9\05DF \05D1\05D9\05D5\05DE\05DF \05E9\05D2\05D9\05D0\05D5\05EA \05DC\05E7\05D1\05DC\05EA \05E4\05E8\05D8\05D9\05DD.')
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139226301065751379)
,p_name=>'APEX.PROCESSING'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E2\05D1\05D3')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139085496283751337)
,p_name=>'APEX.PWA.DIALOG.HIDE.INSTRUCTIONS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E7\05D5\05D3\05DD')
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139086593485751338)
,p_name=>'APEX.PWA.DIALOG.INTRO'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0\05EA\05E8 \05D0\05D9\05E0\05D8\05E8\05E0\05D8 \05D6\05D4 \05D9\05E9 \05E4\05D5\05E0\05E7\05E6\05D9\05D5\05E0\05DC\05D9\05D5\05EA \05D9\05D9\05E9\05D5\05DD. \05D4\05EA\05E7\05DF \05D0\05D5\05EA\05D5 \05D1\05DE\05DB\05E9\05D9\05E8 \05E9\05DC\05DA \05DC\05E7\05D1\05DC\05EA \05D4\05D7\05D5\05D5\05D9\05D4 \05D4\05D8\05D5\05D1\05D4 \05D1\05D9\05D5\05EA\05E8.')
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139087888225751338)
,p_name=>'APEX.PWA.DIALOG.SHOW.INSTRUCTIONS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D1\05D0')
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139089492271751339)
,p_name=>'APEX.PWA.DIALOG.TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05EA\05E7\05DF \05D9\05D9\05E9\05D5\05DD \05D6\05D4')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139074243088751334)
,p_name=>'APEX.PWA.INSTRUCTIONS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05E8\05D0\05D4 \05E9\05D4\05DE\05DB\05E9\05D9\05E8 \05D0\05D5 \05D4\05D3\05E4\05D3\05E4\05DF \05E9\05DC\05DA \05D0\05D9\05E0\05DD \05EA\05D5\05DE\05DB\05D9\05DD \05DB\05E8\05D2\05E2 \05D1\05D4\05EA\05E7\05E0\05D4 \05E9\05DC \05D9\05D9\05E9\05D5\05DE\05D9 \05D0\05D9\05E0\05D8\05E8\05E0\05D8 \05DE\05EA\05E7\05D3\05DE\05D9\05DD (PWA).')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139069300585751333)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP1'
,p_message_language=>'he'
,p_message_text=>unistr('1. \05D4\05E7\05E9 \05E2\05DC \05D4\05D0\05D9\05E7\05D5\05DF <strong>\05E9\05EA\05E3</strong>')
,p_version_scn=>2704858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139069427577751333)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP2'
,p_message_language=>'he'
,p_message_text=>unistr('2. \05D2\05DC\05D5\05DC \05DE\05D8\05D4 \05D5\05D4\05E7\05E9 \05E2\05DC <strong>\05D4\05D5\05E1\05E3 \05DC\05DE\05E1\05DA \05D4\05D1\05D9\05EA</strong>')
,p_version_scn=>2704858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139085889187751337)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP3'
,p_message_language=>'he'
,p_message_text=>unistr('3. \05D4\05E7\05E9 \05E2\05DC <strong style="color:#007AE1;">\05D4\05D5\05E1\05E3</strong> \05DB\05D3\05D9 \05DC\05D0\05E9\05E8')
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139084928337751337)
,p_name=>'APEX.PWA.OFFLINE.BODY'
,p_message_language=>'he'
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
unistr('    <h1>\05DC\05D0 \05E0\05D9\05EA\05DF \05DC\05D4\05EA\05D7\05D1\05E8</h1>'),
unistr('    <p>\05E0\05E8\05D0\05D4 \05E9\05D9\05E9 \05D1\05E2\05D9\05D4 \05D1\05E8\05E9\05EA. \05D1\05D3\05D5\05E7 \05D0\05EA \05D4\05D7\05D9\05D1\05D5\05E8 \05E9\05DC\05DA \05D5\05E0\05E1\05D4 \05E9\05D5\05D1.</p>'),
unistr('    <button type="button">\05E0\05E1\05D4 \05E9\05D5\05D1</button>'),
'</main>',
'',
'<script>',
'    document.querySelector("button").addEventListener("click", () => {',
'        window.location.reload();',
'    });',
'</script>'))
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139084842903751337)
,p_name=>'APEX.PWA.OFFLINE.TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05D4\05EA\05D7\05D1\05E8')
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139131432492751351)
,p_name=>'APEX.PWA.PUSH.SUBSCRIPTION_FAILED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05DE\05DB\05E9\05D9\05E8 \05DC\05D0 \05D4\05E6\05DC\05D9\05D7 \05DC\05D4\05E4\05E2\05D9\05DC \05D3\05D7\05D9\05E4\05EA \05D4\05D5\05D3\05E2\05D5\05EA.')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139136969046751353)
,p_name=>'APEX.QUICK_PICK.GROUP_LABEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05D9\05E8\05D5\05EA \05DE\05E7\05D5\05E6\05E8\05D5\05EA \05DC-%0')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139136875576751353)
,p_name=>'APEX.QUICK_PICK.LINK_ROLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D9\05E9\05D5\05E8 \05DC\05D1\05D7\05D9\05E8\05D4 \05DE\05E7\05D5\05E6\05E8\05EA')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139110629865751345)
,p_name=>'APEX.RADIO.VISUALLY_HIDDEN_RADIO'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D7\05E6\05DF \05D0\05E4\05E9\05E8\05D5\05D9\05D5\05EA \05E0\05E1\05EA\05E8 \05DE\05D4\05E2\05D9\05DF')
,p_is_js_message=>true
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139054792102751328)
,p_name=>'APEX.RECORD_VIEW.TOOLBAR'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05E6\05D5\05D2\05EA \05E9\05D5\05E8\05D4 \05D1\05D5\05D3\05D3\05EA')
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139237446470751382)
,p_name=>'APEX.REGION.CSSCALENDAR.ADD'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05E1\05E3')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139182703720751366)
,p_name=>'APEX.REGION.CSSCALENDAR.ALL_DAY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05D5\05DD \05E9\05DC\05DD')
,p_version_scn=>2704879
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139260366603751389)
,p_name=>'APEX.REGION.CSSCALENDAR.BUTTON.SENDEMAIL'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DC\05D7 \05D4\05D6\05DE\05E0\05D4')
,p_version_scn=>2704896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139260118791751389)
,p_name=>'APEX.REGION.CSSCALENDAR.CHOOSE_ACTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05E4\05E9\05E8\05D5\05D9\05D5\05EA')
,p_version_scn=>2704896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139184505952751367)
,p_name=>'APEX.REGION.CSSCALENDAR.DAILY_ALLDAY'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05E6\05D5\05D2\05D4 \05D9\05D5\05DE\05D9\05EA \05DC\05DB\05DC \05D4\05D9\05D5\05DD')
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139184317625751367)
,p_name=>'APEX.REGION.CSSCALENDAR.DAILY_TIME_SPECIFIC'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05E6\05D5\05D2\05D4 \05D9\05D5\05DE\05D9\05EA \05DC\05E0\05EA\05D5\05E0\05D9\05DD \05E2\05DD \05D6\05DE\05DF')
,p_version_scn=>2704879
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139228569011751380)
,p_name=>'APEX.REGION.CSSCALENDAR.DAY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05D5\05DD')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139223544136751378)
,p_name=>'APEX.REGION.CSSCALENDAR.DESCRIPTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D9\05D0\05D5\05E8')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139107057698751344)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.CSV'
,p_message_language=>'he'
,p_message_text=>'CSV'
,p_version_scn=>2704867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139106893855751344)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.ICALENDAR'
,p_message_language=>'he'
,p_message_text=>'iCal'
,p_version_scn=>2704866
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139106769568751344)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.PDF'
,p_message_language=>'he'
,p_message_text=>'PDF'
,p_version_scn=>2704865
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139106914772751344)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.XML'
,p_message_language=>'he'
,p_message_text=>'XML'
,p_version_scn=>2704867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139106491551751344)
,p_name=>'APEX.REGION.CSSCALENDAR.ENDDATE'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D0\05E8\05D9\05DA \05E1\05D9\05D5\05DD')
,p_version_scn=>2704865
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139106612554751344)
,p_name=>'APEX.REGION.CSSCALENDAR.EVENTNAME'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DD \05D4\05D0\05D9\05E8\05D5\05E2')
,p_version_scn=>2704865
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139260256306751389)
,p_name=>'APEX.REGION.CSSCALENDAR.INVITATION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D6\05DE\05E0\05D4')
,p_version_scn=>2704896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139228631144751380)
,p_name=>'APEX.REGION.CSSCALENDAR.LIST'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05E9\05D9\05DE\05D4')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139228361251751380)
,p_name=>'APEX.REGION.CSSCALENDAR.MONTH'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D5\05D3\05E9')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139230983034751381)
,p_name=>'APEX.REGION.CSSCALENDAR.NEXT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D1\05D0')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139244998584751385)
,p_name=>'APEX.REGION.CSSCALENDAR.NOEVENTS'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05DC\05D0 \05D0\05D9\05E8\05D5\05E2\05D9\05DD')
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139260586180751389)
,p_name=>'APEX.REGION.CSSCALENDAR.OPTION.FORM'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E8\05D5\05DA \05D0\05D9\05E8\05D5\05E2 \05E7\05D9\05D9\05DD')
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139260407497751389)
,p_name=>'APEX.REGION.CSSCALENDAR.OPTION.SEND'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DC\05D9\05D7\05EA \05D4\05D6\05DE\05E0\05D4 \05D1\05D0\05DE\05E6\05E2\05D5\05EA \05D3\05D5\05D0"\05DC')
,p_version_scn=>2704896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139231078937751381)
,p_name=>'APEX.REGION.CSSCALENDAR.PREVIOUS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E7\05D5\05D3\05DD')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139238777307751383)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DC\05D7 \05D3\05D5\05D0"\05DC')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139238523205751383)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.BUTTON'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DC\05D7 \05D3\05D5\05D0"\05DC')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139261169355751390)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.DIALOG.REQUIRED'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05DC \05D4\05E9\05D3\05D5\05EA \05D3\05E8\05D5\05E9\05D9\05DD.')
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139261071609751390)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.DIALOG.TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DC\05D7 \05D4\05D6\05DE\05E0\05D4')
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139260030755751389)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.SUBJECT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E0\05D5\05E9\05D0')
,p_version_scn=>2704896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139238627669751383)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.TO'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05DC')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139106532858751344)
,p_name=>'APEX.REGION.CSSCALENDAR.STARTDATE'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D0\05E8\05D9\05DA \05D4\05EA\05D7\05DC\05D4')
,p_version_scn=>2704865
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139236736423751382)
,p_name=>'APEX.REGION.CSSCALENDAR.TABLEFORM'
,p_message_language=>'he'
,p_message_text=>unistr('\05D8\05D5\05E4\05E1 \05E2\05DC %0')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139184130843751367)
,p_name=>'APEX.REGION.CSSCALENDAR.TIME'
,p_message_language=>'he'
,p_message_text=>unistr('\05D6\05DE\05DF')
,p_version_scn=>2704879
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139231197957751381)
,p_name=>'APEX.REGION.CSSCALENDAR.TODAY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D9\05D5\05DD')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139229183507751380)
,p_name=>'APEX.REGION.CSSCALENDAR.VIEW'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E6\05D2')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139228470871751380)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEK'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D1\05D5\05E2')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139184459290751367)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEKLY_ALLDAY'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05E6\05D5\05D2\05D4 \05E9\05D1\05D5\05E2\05D9\05EA \05DC\05DB\05DC \05D4\05D9\05D5\05DD')
,p_version_scn=>2704879
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139184258788751367)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEKLY_TIME_SPECIFIC'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05E6\05D5\05D2\05D4 \05E9\05D1\05D5\05E2\05D9\05EA \05DC\05E0\05EA\05D5\05E0\05D9\05DD \05E2\05DD \05D6\05DE\05DF')
,p_version_scn=>2704879
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139229022467751380)
,p_name=>'APEX.REGION.CSSCALENDAR.YEAR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05E0\05D4')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139228761581751380)
,p_name=>'APEX.REGION.JQM_COLUMN_TOGGLE.COLUMNS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DE\05D5\05D3\05D5\05EA...')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139228887212751380)
,p_name=>'APEX.REGION.JQM_COLUMN_TOGGLE.LOAD_MORE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D8\05E2\05DF \05E2\05D5\05D3...')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139158205022751359)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.BACK'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E7\05D5\05D3\05DD')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139099716130751342)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.LOAD_MORE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D8\05E2\05DF \05E2\05D5\05D3...')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139102021750751342)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.SEARCH'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05E4\05E9...')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139228949622751380)
,p_name=>'APEX.REGION.JQM_REFLOW.LOAD_MORE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D8\05E2\05DF \05E2\05D5\05D3...')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139230894161751381)
,p_name=>'APEX.REGION.NOT_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D6\05D4\05D4 \05D0\05D6\05D5\05E8 %0 \05DC\05D0 \05E0\05DE\05E6\05D0.')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139101976359751342)
,p_name=>'APEX.REGION.NO_DATA_FOUND_MESSAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05DE\05E6\05D0\05D5 \05E0\05EA\05D5\05E0\05D9\05DD')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139129491547751350)
,p_name=>'APEX.REGION.PAGINATION.RESET_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05D0\05E4\05E1 \05D0\05EA \05E2\05D9\05DE\05D5\05D3 \05D4\05D0\05D6\05D5\05E8.')
,p_version_scn=>2704869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139093110269751340)
,p_name=>'APEX.REGION.PAGINATION.UNHANDLED_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05D4\05D2\05D3\05E8\05EA \05E2\05D9\05DE\05D5\05D3 \05D4\05D0\05D6\05D5\05E8.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139222996871751378)
,p_name=>'APEX.REGION.RESPONSIVE_TABLE.COLUMNS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DE\05D5\05D3\05D5\05EA...')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139077498192751335)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.LAZY_LOADING_INCOMPATIBLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D8\05E2\05D9\05E0\05D4 \05E2\05E6\05DC\05D4 \05D0\05D9\05E0\05D4 \05EA\05D5\05D0\05DE\05EA \05DC\05DE\05E9\05D1\05E6\05D5\05EA \05D1-%0, \05E9\05D4\05D5\05D0 \05D0\05D6\05D5\05E8 \05D1\05D5\05D3\05D3 (\05D7\05DC\05E7\05D9). \05E2\05DC\05D9\05DA \05DC\05D7\05E1\05D5\05DD \05D8\05E2\05D9\05E0\05D4 \05E2\05E6\05DC\05D4 \05DC\05D0\05D6\05D5\05E8 \05D6\05D4, \05D0\05D5 \05DC\05D4\05E2\05D1\05D9\05E8 \05D0\05EA \05E8\05DB\05D9\05D1\05D9 \05D4\05DE\05E9\05D1\05E6\05D5\05EA \05DC\05D0\05D6\05D5\05E8 \05D0\05D7\05E8.')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139072768823751334)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.NO_GROUP_TEMPLATE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05E1\05E8\05D4 \05EA\05D1\05E0\05D9\05EA \05E7\05D1\05D5\05E6\05D4 \05D1\05E8\05DB\05D9\05D1 \05D4\05EA\05D1\05E0\05D9\05EA \05D1\05E9\05D1\05D9\05DC %0.')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139067708085751332)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.TOO_MANY_ROWS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D4\05D5\05D0 \05D0\05D6\05D5\05E8 \05D9\05D7\05D9\05D3 (\05D7\05DC\05E7\05D9) \05D5\05D4\05D7\05D6\05D9\05E8 \05E9\05D5\05E8\05D5\05EA \05DE\05E8\05D5\05D1\05D5\05EA.')
,p_version_scn=>2704858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139230774879751380)
,p_name=>'APEX.REGION.TYPE_NOT_SUPPORTED'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D5\05D2 \05D0\05D6\05D5\05E8 %0 \05DC\05D0 \05E0\05EA\05DE\05DA.')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139093031651751340)
,p_name=>'APEX.REGION.UNHANDLED_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05D6\05DE\05DF \05D4\05E6\05D2\05EA \05D4\05D0\05D6\05D5\05E8 "#COMPONENT_NAME#".')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139163706422751361)
,p_name=>'APEX.REGION_COLUMN_IS_REQUIRED'
,p_message_language=>'he'
,p_message_text=>unistr('#COLUMN_HEADER# \05D7\05D9\05D9\05D1 \05DC\05D4\05D9\05D5\05EA \05E2\05DD \05E2\05E8\05DA \05DB\05DC\05E9\05D4\05D5.')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139045345140751325)
,p_name=>'APEX.REPORT_QUERY.LAYOUT_REQUIRED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D5\05D1\05D4 \05DC\05E6\05D9\05D9\05DF \05DE\05EA\05D5\05D5\05D4 \05D3\05D5\05D7.')
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139259631377751389)
,p_name=>'APEX.RICH_TEXT_EDITOR.ACCESSIBLE_LABEL'
,p_message_language=>'he'
,p_message_text=>unistr('%0, \05E2\05D5\05E8\05DA \05D8\05E7\05E1\05D8 \05E2\05E9\05D9\05E8')
,p_is_js_message=>true
,p_version_scn=>2704896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139165810796751361)
,p_name=>'APEX.RICH_TEXT_EDITOR.MAXIMUM_LENGTH_EXCEEDED'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D2\05D9\05EA HTML \05E9\05DC \05D8\05E7\05E1\05D8 \05E2\05E9\05D9\05E8 \05D7\05D5\05E8\05D2\05EA \05DE\05D4\05D0\05D5\05E8\05DA \05D4\05DE\05E8\05D1\05D9 \05E9\05DC \05D4\05E4\05E8\05D9\05D8 (\05D1\05E4\05D5\05E2\05DC %0, \05DE\05D5\05EA\05E8 %1 \05EA\05D5\05D5\05D9\05DD)')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139075295961751334)
,p_name=>'APEX.RTE.READ_ONLY_RICH_TEXT_EDITOR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D5\05E8\05DA \05D8\05E7\05E1\05D8 \05E2\05E9\05D9\05E8 \05DC\05E7\05E8\05D9\05D0\05D4 \05D1\05DC\05D1\05D3')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139075142369751334)
,p_name=>'APEX.RTE.RICH_TEXT_EDITOR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D5\05E8\05DA \05D8\05E7\05E1\05D8 \05E2\05E9\05D9\05E8')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139074951731751334)
,p_name=>'APEX.RTE.TOOLBAR_ALIGNMENT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05D9\05E9\05D5\05E8')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139075050171751334)
,p_name=>'APEX.RTE.TOOLBAR_EXTRAS'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D5\05E1\05E4\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139074704540751334)
,p_name=>'APEX.RTE.TOOLBAR_FONT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D2\05D5\05E4\05DF')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139074618719751334)
,p_name=>'APEX.RTE.TOOLBAR_FORMATTING'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D9\05E6\05D5\05D1')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139074898148751334)
,p_name=>'APEX.RTE.TOOLBAR_LISTS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05E9\05D9\05DE\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139227920383751380)
,p_name=>'APEX.RV.DELETE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D7\05E7')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139220453819751377)
,p_name=>'APEX.RV.DUPLICATE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DB\05E4\05DC')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139218759379751377)
,p_name=>'APEX.RV.EXCLUDE_HIDDEN'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DE\05D5\05D3\05D5\05EA \05DE\05D5\05E6\05D2\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139218660305751377)
,p_name=>'APEX.RV.EXCLUDE_NULL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05DF \05DC\05DB\05DC\05D5\05DC \05E2\05E8\05DB\05D9 Null')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139228073549751380)
,p_name=>'APEX.RV.INSERT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05E1\05E3')
,p_is_js_message=>true
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139182318486751366)
,p_name=>'APEX.RV.MOVE_DOWN'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E2\05D1\05E8 \05DC\05DE\05D8\05D4')
,p_is_js_message=>true
,p_version_scn=>2704879
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139182492282751366)
,p_name=>'APEX.RV.MOVE_UP'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E2\05D1\05E8 \05DC\05DE\05E2\05DC\05D4')
,p_is_js_message=>true
,p_version_scn=>2704879
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139218436131751377)
,p_name=>'APEX.RV.NEXT_RECORD'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D1\05D0')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139219074829751377)
,p_name=>'APEX.RV.NOT_GROUPED_LABEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DE\05D5\05D3\05D5\05EA \05D0\05D7\05E8\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139218568881751377)
,p_name=>'APEX.RV.PREV_RECORD'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E7\05D5\05D3\05DD')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139218862310751377)
,p_name=>'APEX.RV.REC_X'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D5\05E8\05D4 %0')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139218930765751377)
,p_name=>'APEX.RV.REC_XY'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D5\05E8\05D4 %0 \05DE\05EA\05D5\05DA %1 ')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139220564705751377)
,p_name=>'APEX.RV.REFRESH'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05E2\05E0\05DF')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139220678962751377)
,p_name=>'APEX.RV.REVERT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D8\05DC \05E9\05D9\05E0\05D5\05D9\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139218309211751377)
,p_name=>'APEX.RV.SETTINGS_MENU'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D2\05D3\05E8\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139177545921751365)
,p_name=>'APEX.SAMPLE_FORMAT'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D3\05D5\05D2\05DE\05D4, %0')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139181812393751366)
,p_name=>'APEX.SAMPLE_FORMAT_SHORT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05D5\05D2\05DE\05D4: %0')
,p_is_js_message=>true
,p_version_scn=>2704878
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139094519689751340)
,p_name=>'APEX.SEARCH.1_RESULT_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D5\05E6\05D0\05D4 1')
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139091607264751339)
,p_name=>'APEX.SEARCH.N_RESULTS_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05EA\05D5\05E6\05D0\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139143461128751355)
,p_name=>'APEX.SEARCH.PAGINATION'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D9\05DE\05D5\05D3')
,p_is_js_message=>true
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139143507798751355)
,p_name=>'APEX.SEARCH.RESULTS_X_TO_Y'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D5\05E6\05D0\05D5\05EA, %0 \05E2\05D3 %1')
,p_is_js_message=>true
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139039287582751323)
,p_name=>'APEX.SESSION.ALERT.CREATE_NEW'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05EA\05D7\05D1\05E8 \05E9\05D5\05D1')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139039101339751323)
,p_name=>'APEX.SESSION.ALERT.EXPIRED'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D5\05E9\05D1 \05E2\05D1\05D5\05D3\05D4 \05E9\05DC\05DA \05D4\05E1\05EA\05D9\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139039324665751323)
,p_name=>'APEX.SESSION.ALERT.EXTEND'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E8\05D7\05D1')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139038917701751323)
,p_name=>'APEX.SESSION.ALERT.IDLE_WARN'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D5\05E9\05D1 \05D4\05E2\05D1\05D5\05D3\05D4 \05E9\05DC\05DA \05D9\05E1\05EA\05D9\05D9\05DD \05D1-%0. \05D4\05D0\05DD \05EA\05E8\05E6\05D4 \05DC\05D4\05D0\05E8\05D9\05DA \05D0\05D5\05EA\05D5?')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139039097861751323)
,p_name=>'APEX.SESSION.ALERT.MAX_WARN'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D5\05E9\05D1 \05D4\05E2\05D1\05D5\05D3\05D4 \05E9\05DC\05DA \05D9\05E1\05EA\05D9\05D9\05DD \05D1-%0 \05D5\05DC\05D0 \05E0\05D9\05EA\05DF \05DC\05D4\05D0\05E8\05D9\05DA \05D0\05D5\05EA\05D5. \05E9\05DE\05D5\05E8 \05D0\05EA \05DB\05DC \05D4\05E2\05D1\05D5\05D3\05D4 \05E2\05DB\05E9\05D9\05D5 \05DB\05D3\05D9 \05DC\05D4\05D9\05DE\05E0\05E2 \05DE\05D0\05D5\05D1\05D3\05DF \05E0\05EA\05D5\05E0\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139238398924751383)
,p_name=>'APEX.SESSION.DB_SESSION_CLEANUP.UNHANDLED_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05E2\05D9\05D1\05D5\05D3 \05E7\05D5\05D3 \05E0\05D9\05E7\05D5\05D9 \05DB\05DC\05DC\05D9 \05E9\05DC \05DE\05D5\05E9\05D1 \05DE\05E1\05D3 \05E0\05EA\05D5\05E0\05D9\05DD.')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139128030248751350)
,p_name=>'APEX.SESSION.DB_SESSION_INIT.UNHANDLED_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05E2\05D9\05D1\05D5\05D3 \05E7\05D5\05D3 \05D4\05D4\05E7\05DE\05D4 \05E9\05DC \05DE\05D5\05E9\05D1 \05DE\05E1\05D3 \05E0\05EA\05D5\05E0\05D9\05DD.')
,p_version_scn=>2704869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139098450569751341)
,p_name=>'APEX.SESSION.EXPIRED'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D5\05E9\05D1 \05E2\05D1\05D5\05D3\05D4 \05E9\05DC\05DA \05D4\05E1\05EA\05D9\05D9\05DD.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139237526584751383)
,p_name=>'APEX.SESSION.EXPIRED.CLOSE_DIALOG'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D2\05D5\05E8 \05EA\05D9\05D1\05EA \05D3\05D5-\05E9\05D9\05D7 \05D6\05D5 \05D5\05DC\05D7\05E5 \05E2\05DC \05DC\05D7\05E6\05DF \05D4\05D8\05E2\05D9\05E0\05D4 \05D4\05D7\05D5\05D6\05E8\05EA \05E9\05DC \05D4\05D3\05E4\05D3\05E4\05DF \05E9\05DC\05DA \05DB\05D3\05D9 \05DC\05E7\05D1\05DC \05DE\05D5\05E9\05D1 \05E2\05D1\05D5\05D3\05D4 \05D7\05D3\05E9.')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139256485579751388)
,p_name=>'APEX.SESSION.EXPIRED.NEW_SESSION'
,p_message_language=>'he'
,p_message_text=>unistr('<a href="%0">\05D4\05EA\05D7\05D1\05E8</a> \05E9\05D5\05D1 \05DB\05D3\05D9 \05DC\05D9\05E6\05D5\05E8 \05DE\05D5\05E9\05D1 \05E2\05D1\05D5\05D3\05D4 \05D7\05D3\05E9.')
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139140794297751354)
,p_name=>'APEX.SESSION.NOT_VALID'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D5\05E9\05D1 \05E2\05D1\05D5\05D3\05D4 \05DC\05D0 \05EA\05E7\05E3')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139183849120751367)
,p_name=>'APEX.SESSION.RAS.NO_DYNAMIC_ROLES'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05D9\05EA\05DF \05DC\05D0\05E4\05E9\05E8 \05EA\05E4\05E7\05D9\05D3\05D9\05DD \05D3\05D9\05E0\05DE\05D9\05D9\05DD \05DB\05DC\05E9\05D4\05DD \05D1\05DE\05D5\05E9\05D1 \05E9\05DC Real Application Security \05DC\05DE\05E9\05EA\05DE\05E9 "%0".')
,p_version_scn=>2704879
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139125986730751349)
,p_name=>'APEX.SESSION.UNHANDLED_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('ERR-99900 \05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05D9\05E6\05D5\05E8 \05DE\05D6\05D4\05D4 \05D9\05D9\05D7\05D5\05D3\05D9 \05E9\05DC \05DE\05D5\05E9\05D1: %0')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139055083815751328)
,p_name=>'APEX.SESSION_STATE.CLOB_NOT_ALLOWED'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D5\05D2 \05E0\05EA\05D5\05E0\05D9 \05DE\05E6\05D1 \05DE\05D5\05E9\05D1 \05E2\05D1\05D5\05D3\05D4 CLOB \05D0\05D9\05E0\05D5 \05DE\05D5\05EA\05E8 \05D1\05E9\05D1\05D9\05DC \05E4\05E8\05D9\05D8 %0.')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139074407302751334)
,p_name=>'APEX.SESSION_STATE.CLOB_SUBSTITUTION_NOT_ALLOWED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05DF \05EA\05DE\05D9\05DB\05D4 \05D1\05D4\05D7\05DC\05E4\05EA \05E4\05E8\05D9\05D8\05D9\05DD \05DE\05E1\05D5\05D2 \05E0\05EA\05D5\05E0\05D9 \05DE\05E6\05D1 \05DE\05D5\05E9\05D1 \05E2\05D1\05D5\05D3\05D4 CLOB.')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139143245876751355)
,p_name=>'APEX.SESSION_STATE.ITEM_VALUE_PROTECTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E4\05E8\05EA \05D4\05D4\05D2\05E0\05D4 \05E2\05DC \05DE\05E6\05D1 \05DE\05D5\05E9\05D1 \05D4\05E2\05D1\05D5\05D3\05D4. \05D4\05E1\05D9\05D1\05D4 \05DC\05DB\05DA \05D9\05DB\05D5\05DC\05D4 \05DC\05D4\05D9\05D5\05EA \05E9\05D9\05E0\05D5\05D9 \05D9\05D3\05E0\05D9 \05E9\05DC \05E4\05E8\05D9\05D8 %0 \05E9\05DC \05D3\05E3 \05DE\05D5\05D2\05DF. \05D0\05DD \05D0\05EA\05D4 \05DC\05D0 \05D1\05D8\05D5\05D7 \05DE\05D4 \05D2\05E8\05DD \05DC\05E9\05D2\05D9\05D0\05D4 \05D6\05D5, \05E4\05E0\05D4 \05DC\05DE\05E0\05D4\05DC\05DF \05D4\05D9\05D9\05E9\05D5\05DD \05DC\05E2\05D6\05E8\05D4.')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139264439075751391)
,p_name=>'APEX.SESSION_STATE.PAGE_PROTECTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E4\05E8\05D4 \05E9\05DC \05D4\05D2\05E0\05EA \05D3\05E3. \05D4\05E1\05D9\05D1\05D4 \05DC\05DB\05DA \05D9\05DB\05D5\05DC\05D4 \05DC\05D4\05D9\05D5\05EA \05E9\05DC\05D9\05D7\05EA \05D3\05E3 \05E9\05D4\05D8\05E2\05D9\05E0\05D4 \05E9\05DC\05D5 \05DC\05D0 \05D4\05E1\05EA\05D9\05D9\05DE\05D4 \05D0\05D5 \05E9\05D9\05E0\05D5\05D9 \05D9\05D3\05E0\05D9 \05E9\05DC \05E4\05E8\05D9\05D8\05D9\05DD \05DE\05D5\05D2\05E0\05D9\05DD \05E9\05DC \05D4\05D3\05E3. \05DC\05E1\05D9\05D5\05E2 \05E0\05D5\05E1\05E3, \05E4\05E0\05D4 \05DC\05DE\05E0\05D4\05DC\05DF \05D4\05D9\05D9\05E9\05D5\05DD.')
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139263540767751390)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.NO_SPECIAL_CHAR'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05DE\05DB\05D9\05DC \05D0\05D7\05D3 \05DE\05D4\05EA\05D5\05D5\05D9\05DD \05D4\05D1\05DC\05EA\05D9 \05EA\05E7\05E4\05D9\05DD \05D4\05D1\05D0\05D9\05DD &<>"/;,*|=% \05D0\05D5 --')
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139263600413751390)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.NO_SPECIAL_CHAR_NL'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05DE\05DB\05D9\05DC \05D0\05D7\05D3 \05DE\05D4\05EA\05D5\05D5\05D9\05DD \05D4\05D1\05DC\05EA\05D9 \05EA\05E7\05E4\05D9\05DD \05D4\05D1\05D0\05D9\05DD &<>"/;,*|=% \05D0\05D5 -- \05D0\05D5 \05E9\05D5\05E8\05D4 \05D7\05D3\05E9\05D4.')
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139263341061751390)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.US_ONLY'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05DE\05DB\05D9\05DC \05EA\05D5\05D5\05D9\05DD \05DE\05D9\05D5\05D7\05D3\05D9\05DD. \05DE\05D5\05EA\05E8\05D9\05DD \05E8\05E7 \05D4\05EA\05D5\05D5\05D9\05DD a-Z, 0-9 \05D5\05E8\05D5\05D5\05D7\05D9\05DD.')
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139263429372751390)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05DE\05DB\05D9\05DC <, > \05D0\05D5 " \05E9\05D4\05DD \05EA\05D5\05D5\05D9\05DD \05D1\05DC\05EA\05D9 \05EA\05E7\05E4\05D9\05DD.')
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139100895889751342)
,p_name=>'APEX.SESSION_STATE.SSP_CHECKSUM_MISSING'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05DE\05E1\05E8 \05E2\05E8\05DA \05E1\05D9\05DB\05D5\05DD \05D1\05D9\05E7\05D5\05E8\05EA (checksum) \05DB\05D3\05D9 \05DC\05D4\05E8\05D0\05D5\05EA \05E2\05D9\05D1\05D5\05D3 \05E9\05DC \05D3\05E3 \05E9\05D3\05D5\05E8\05E9 \05E2\05E8\05DA \05E1\05D9\05DB\05D5\05DD \05D1\05D9\05E7\05D5\05E8\05EA \05DB\05D0\05E9\05E8 \05E2\05E8\05DA \05D0\05D7\05D3 \05D0\05D5 \05D9\05D5\05EA\05E8 \05E9\05DC \05D1\05E7\05E9\05D4, \05E0\05D9\05E7\05D5\05D9 \05DE\05D8\05DE\05D5\05DF \05D0\05D5 \05D0\05E8\05D2\05D5\05DE\05E0\05D8 \05DE\05D5\05E2\05D1\05E8\05D9\05DD \05DB\05E4\05E8\05DE\05D8\05E8\05D9\05DD.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139138143987751353)
,p_name=>'APEX.SESSION_STATE.SSP_VIOLATION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E4\05E8\05EA \05D4\05D4\05D2\05E0\05D4 \05E2\05DC \05DE\05E6\05D1 \05DE\05D5\05E9\05D1 \05D4\05E2\05D1\05D5\05D3\05D4. \05D4\05E1\05D9\05D1\05D4 \05DC\05DB\05DA \05D9\05DB\05D5\05DC\05D4 \05DC\05D4\05D9\05D5\05EA \05E9\05D9\05E0\05D5\05D9 \05D9\05D3\05E0\05D9 \05E9\05DC URL \05D4\05DE\05DB\05D9\05DC \05E2\05E8\05DA \05E1\05D9\05DB\05D5\05DD \05D1\05D9\05E7\05D5\05E8\05EA (checksum) \05D0\05D5 \05E9\05D9\05DE\05D5\05E9 \05D1\05E7\05D9\05E9\05D5\05E8 \05E2\05DD \05E2\05E8\05DA \05E1\05D9\05DB\05D5\05DD \05D1\05D9\05E7\05D5\05E8\05EA \05E9\05D2\05D5\05D9 \05D0\05D5 \05D7\05E1\05E8. \05D0\05DD \05D0\05EA\05D4 \05DC\05D0 \05D1\05D8\05D5\05D7 \05DE\05D4 \05D2\05E8\05DD \05DC\05E9\05D2\05D9\05D0\05D4 \05D6\05D5, \05E4\05E0\05D4 \05DC\05DE\05E0\05D4\05DC\05DF \05D4\05D9\05D9\05E9\05D5\05DD \05DC\05E2\05D6\05E8\05D4.')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139219761999751377)
,p_name=>'APEX.SET_HIGH_CONTRAST_MODE_OFF'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D2\05D3\05E8 \05DE\05E6\05D1 \05E0\05D9\05D2\05D5\05D3\05D9\05D5\05EA \05D2\05D1\05D5\05D4\05D4 \05DB''\05DB\05D1\05D5\05D9''')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139219894240751377)
,p_name=>'APEX.SET_HIGH_CONTRAST_MODE_ON'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D2\05D3\05E8 \05DE\05E6\05D1 \05E0\05D9\05D2\05D5\05D3\05D9\05D5\05EA \05D2\05D1\05D5\05D4\05D4 \05DB''\05DE\05D5\05E4\05E2\05DC''')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139084251040751337)
,p_name=>'APEX.SET_VALUE_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05E2\05D3\05DB\05DF \05D0\05EA \05D4\05D2\05D3\05E8\05EA \05D4\05D9\05D9\05E9\05D5\05DD %0 \05DB\05D9\05D5\05D5\05DF \05E9\05D4\05E8\05D9\05E9\05D5\05DD \05DB\05DE\05E0\05D5\05D9 \05D4\05EA\05D1\05E6\05E2 \05DE\05D9\05D9\05E9\05D5\05DD \05D0\05D7\05E8.')
,p_version_scn=>2704860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139134591939751352)
,p_name=>'APEX.SHUTTLE.CONTROL_BOTTOM'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D7\05EA\05D5\05DF')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139134772864751352)
,p_name=>'APEX.SHUTTLE.CONTROL_DOWN'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05DE\05D8\05D4')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139134886259751352)
,p_name=>'APEX.SHUTTLE.CONTROL_MOVE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E2\05D1\05E8')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139134984077751352)
,p_name=>'APEX.SHUTTLE.CONTROL_MOVE_ALL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E2\05D1\05E8 \05D4\05DB\05DC')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139135099667751352)
,p_name=>'APEX.SHUTTLE.CONTROL_REMOVE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05E8')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139135190635751352)
,p_name=>'APEX.SHUTTLE.CONTROL_REMOVE_ALL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05E8 \05D4\05DB\05DC')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139135224331751352)
,p_name=>'APEX.SHUTTLE.CONTROL_RESET'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E4\05D5\05E1')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139134449412751352)
,p_name=>'APEX.SHUTTLE.CONTROL_TOP'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DC\05D9\05D5\05DF')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139134695440751352)
,p_name=>'APEX.SHUTTLE.CONTROL_UP'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05DE\05E2\05DC\05D4')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139246209435751385)
,p_name=>'APEX.SINCE.SHORT.DAYS_AGO'
,p_message_language=>'he'
,p_message_text=>'%0d'
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139246942458751385)
,p_name=>'APEX.SINCE.SHORT.DAYS_FROM_NOW'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1-%0d')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139246137403751385)
,p_name=>'APEX.SINCE.SHORT.HOURS_AGO'
,p_message_language=>'he'
,p_message_text=>'%0h'
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139247084237751385)
,p_name=>'APEX.SINCE.SHORT.HOURS_FROM_NOW'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1-%0h')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139245914510751385)
,p_name=>'APEX.SINCE.SHORT.MINUTES_AGO'
,p_message_language=>'he'
,p_message_text=>'%0m'
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139247189393751385)
,p_name=>'APEX.SINCE.SHORT.MINUTES_FROM_NOW'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1-%0m')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139246575606751385)
,p_name=>'APEX.SINCE.SHORT.MONTHS_AGO'
,p_message_language=>'he'
,p_message_text=>'%0mo'
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139246779440751385)
,p_name=>'APEX.SINCE.SHORT.MONTHS_FROM_NOW'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1-%0mo')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139246017055751385)
,p_name=>'APEX.SINCE.SHORT.SECONDS_AGO'
,p_message_language=>'he'
,p_message_text=>'%0s'
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139246833207751385)
,p_name=>'APEX.SINCE.SHORT.SECONDS_FROM_NOW'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1-%0s')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139246367331751385)
,p_name=>'APEX.SINCE.SHORT.WEEKS_AGO'
,p_message_language=>'he'
,p_message_text=>'%0w'
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139247279576751385)
,p_name=>'APEX.SINCE.SHORT.WEEKS_FROM_NOW'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1-%0w')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139246475331751385)
,p_name=>'APEX.SINCE.SHORT.YEARS_AGO'
,p_message_language=>'he'
,p_message_text=>'%0y'
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139246661331751385)
,p_name=>'APEX.SINCE.SHORT.YEARS_FROM_NOW'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1-%0y')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139047502189751326)
,p_name=>'APEX.SPATIAL.GEOMETRY.LINE'
,p_message_language=>'he'
,p_message_text=>unistr('[\05E9\05D5\05E8\05D4]')
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139048109529751326)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTILINE'
,p_message_language=>'he'
,p_message_text=>unistr('[\05E9\05D5\05E8\05D5\05EA \05E8\05D1\05D5\05EA]')
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139047829997751326)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTIPOINT'
,p_message_language=>'he'
,p_message_text=>unistr('[\05E0\05E7\05D5\05D3\05D5\05EA \05E8\05D1\05D5\05EA]')
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139048368832751326)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTIPOLYGON'
,p_message_language=>'he'
,p_message_text=>unistr('[\05DE\05E6\05D5\05DC\05E2\05D9\05DD \05E8\05D1\05D9\05DD]')
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139048470038751326)
,p_name=>'APEX.SPATIAL.GEOMETRY.OTHER'
,p_message_language=>'he'
,p_message_text=>unistr('[\05D0\05D5\05D1\05D9\05D9\05E7\05D8 \05D2\05D9\05D0\05D5\05DE\05D8\05E8\05D9\05D4]')
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139047495148751326)
,p_name=>'APEX.SPATIAL.GEOMETRY.POINT'
,p_message_language=>'he'
,p_message_text=>unistr('[\05E0\05E7\05D5\05D3\05D4 (%0,%1)]')
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139047783605751326)
,p_name=>'APEX.SPATIAL.GEOMETRY.POLYGON'
,p_message_language=>'he'
,p_message_text=>unistr('[\05DE\05E6\05D5\05DC\05E2]')
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139046924003751326)
,p_name=>'APEX.SPLITTER.COLLAPSED_REGION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D6\05D5\05E8 \05E9\05DB\05D5\05D5\05E5: %0')
,p_is_js_message=>true
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139162087022751360)
,p_name=>'APEX.SPLITTER.COLLAPSE_TEXT'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D5\05D5\05E5')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139045988158751325)
,p_name=>'APEX.SPLITTER.HORIZ_CANNOT_LEFT_RIGHT'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05D9\05EA\05DF \05DC\05D4\05D6\05D9\05D6 \05DE\05E4\05E6\05DC \05D1\05DB\05D9\05D5\05D5\05DF \05D0\05D5\05E4\05E7\05D9 \05E9\05DE\05D0\05DC\05D4 \05D0\05D5 \05D9\05DE\05D9\05E0\05D4')
,p_is_js_message=>true
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139046128627751325)
,p_name=>'APEX.SPLITTER.MAX_SIZE_REACHED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D5\05E6\05E2\05D4 \05D4\05D2\05E2\05D4 \05DC\05D2\05D5\05D3\05DC \05D4\05DE\05E7\05E1\05D9\05DE\05DC\05D9 \05E9\05DC %0px')
,p_is_js_message=>true
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139047182482751326)
,p_name=>'APEX.SPLITTER.MIN_SIZE_REACHED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D5\05E6\05E2\05D4 \05D4\05D2\05E2\05D4 \05DC\05D2\05D5\05D3\05DC \05D4\05DE\05D9\05E0\05D9\05DE\05DC\05D9 \05E9\05DC %0px')
,p_is_js_message=>true
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139047048757751326)
,p_name=>'APEX.SPLITTER.REGION_IS_COLLAPSED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D0\05D6\05D5\05E8 \05DB\05D5\05D5\05E5')
,p_is_js_message=>true
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139046884088751326)
,p_name=>'APEX.SPLITTER.REGION_IS_RESTORED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D0\05D6\05D5\05E8 \05E9\05D5\05D7\05D6\05E8')
,p_is_js_message=>true
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139046551107751326)
,p_name=>'APEX.SPLITTER.RESIZED_TO'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05E0\05D4 \05D2\05D5\05D3\05DC \05DC-%0px')
,p_is_js_message=>true
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139046791788751326)
,p_name=>'APEX.SPLITTER.RESTORED_REGION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D6\05D5\05E8 \05DE\05E9\05D5\05D7\05D6\05E8: %0')
,p_is_js_message=>true
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139161984677751360)
,p_name=>'APEX.SPLITTER.RESTORE_TEXT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D7\05D6\05E8')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139046060629751325)
,p_name=>'APEX.SPLITTER.VERTICAL_CANNOT_UP_DOWN'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05D9\05EA\05DF \05DC\05D4\05D6\05D9\05D6 \05DE\05E4\05E6\05DC \05D1\05DB\05D9\05D5\05D5\05DF \05D0\05E0\05DB\05D9 \05DC\05DE\05E2\05DC\05D4 \05D0\05D5 \05DC\05DE\05D8\05D4')
,p_is_js_message=>true
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139211474834751375)
,p_name=>'APEX.STAR_RATING.CLEAR_RATING'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05E7\05D4 \05D3\05D9\05E8\05D5\05D2')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139201354123751372)
,p_name=>'APEX.STAR_RATING.INVALID_RATING_RANGE'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D0\05D9\05E0\05E0\05D5 \05D1\05D8\05D5\05D5\05D7 \05D4\05D3\05D9\05E8\05D5\05D2 \05D4\05EA\05E7\05E3 \05E9\05DC 1 - %1')
,p_version_scn=>2704881
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139201450993751372)
,p_name=>'APEX.STAR_RATING.IS_NOT_NUMERIC'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D0\05D9\05E0\05D5 \05DE\05E1\05E4\05E8\05D9')
,p_version_scn=>2704881
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139197563021751371)
,p_name=>'APEX.SUCCESS_MESSAGE_HEADING'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05D3\05E2\05EA \05D4\05E6\05DC\05D7\05D4')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139259336297751389)
,p_name=>'APEX.TABS.NEXT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D1\05D0')
,p_is_js_message=>true
,p_version_scn=>2704896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139259240321751389)
,p_name=>'APEX.TABS.PREVIOUS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E7\05D5\05D3\05DD')
,p_is_js_message=>true
,p_version_scn=>2704896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139169418407751362)
,p_name=>'APEX.TASK.ACTION.DATA_NOT_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05DE\05E6\05D0\05D4 \05DE\05E2\05E8\05DB\05EA \05E9\05DC \05E8\05E9\05D5\05DE\05D5\05EA \05D4\05E7\05E9\05D5\05E8\05D5\05EA \05DC\05DE\05D5\05E4\05E2 \05DE\05E9\05D9\05DE\05D4 \05D6\05D4')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139177728852751365)
,p_name=>'APEX.TASK.ACTION.ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D9\05E6\05D5\05E2 \05E4\05E2\05D5\05DC\05EA \05D4\05DE\05E9\05D9\05DE\05D4 %0 \05E0\05DB\05E9\05DC. \05D4\05DE\05E9\05D9\05DE\05D4 \05D4\05D5\05D2\05D3\05E8\05D4 \05DC\05DE\05E6\05D1 \05E9\05D2\05D5\05D9, \05D1\05D3\05D5\05E7 \05D0\05EA \05E7\05D5\05D3 \05E4\05E2\05D5\05DC\05EA \05D4\05DE\05E9\05D9\05DE\05D4')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139057939669751329)
,p_name=>'APEX.TASK.ADD_COMMENT_NOT_AUTHORIZED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05E1\05E3 \05DE\05E9\05D9\05DE\05D4: \05DC\05D0 \05DE\05D5\05E8\05E9\05D4')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139057252138751329)
,p_name=>'APEX.TASK.ALREADY_ASSIGNED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05DE\05E9\05D9\05DE\05D4 \05DB\05D1\05E8 \05D4\05D5\05E7\05E6\05EA\05D4')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139050670821751327)
,p_name=>'APEX.TASK.ASSIGNED_TO_USER'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05E7\05E6\05D4 \05DC-%0')
,p_version_scn=>2704854
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139056962662751329)
,p_name=>'APEX.TASK.CANCEL_TASK_NOT_AUTHORIZED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D8\05DC \05DE\05E9\05D9\05DE\05D4: \05DC\05D0 \05DE\05D5\05E8\05E9\05D4')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139072527966751334)
,p_name=>'APEX.TASK.CANNOT_REMOVE_OWNER'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05D4\05E1\05D9\05E8 \05D0\05EA \05D4\05D1\05E2\05DC\05D9\05DD \05D1\05E4\05D5\05E2\05DC \05E9\05DC \05DE\05E9\05D9\05DE\05D4 \05D6\05D5. \05D4\05D0\05E6\05DC \05D0\05EA \05E1\05DE\05DB\05D5\05D9\05D5\05EA \05D4\05DE\05E9\05D9\05DE\05D4 \05DC\05DE\05E9\05EA\05EA\05E3 \05D0\05D7\05E8 \05DC\05E4\05E0\05D9 \05E9\05EA\05E0\05E1\05D4 \05E9\05D5\05D1 \05DC\05D1\05E6\05E2 \05D0\05EA \05D4\05E4\05E2\05D5\05DC\05D4.')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139056526724751329)
,p_name=>'APEX.TASK.CLAIM_TASK_NOT_AUTHORIZED'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D1\05E2 \05DE\05E9\05D9\05DE\05D4: \05DC\05D0 \05DE\05D5\05E8\05E9\05D4')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139056621634751329)
,p_name=>'APEX.TASK.COMPLETE_TASK_NOT_AUTHORIZED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E9\05DC\05DD \05DE\05E9\05D9\05DE\05D4: \05DC\05D0 \05DE\05D5\05E8\05E9\05D4')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139056764611751329)
,p_name=>'APEX.TASK.DELEGATE_TASK_NOT_AUTHORIZED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D0\05E6\05DC \05DE\05E9\05D9\05DE\05D4: \05DC\05D0 \05DE\05D5\05E8\05E9\05D4')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139055193936751328)
,p_name=>'APEX.TASK.DUE_DATE_IN_PAST'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D0\05E8\05D9\05DA \05D9\05E2\05D3 \05E9\05DC \05D4\05DE\05E9\05D9\05DE\05D4 \05D0\05D9\05E0\05D5 \05D9\05DB\05D5\05DC \05DC\05D4\05D9\05D5\05EA \05D1\05E2\05D1\05E8.')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139050443082751327)
,p_name=>'APEX.TASK.DUE_SINCE'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D0\05E8\05D9\05DA \05D9\05E2\05D3: %0')
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139050834312751327)
,p_name=>'APEX.TASK.EVENT.ACTION.ERROR_MESSAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05E2\05D5\05DC\05EA \05D4\05DE\05E9\05D9\05DE\05D4 %1 \05E0\05DB\05E9\05DC\05D4. \05D4\05D5\05D3\05E2\05EA \05E9\05D2\05D9\05D0\05D4 - %0')
,p_version_scn=>2704854
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139050578884751327)
,p_name=>'APEX.TASK.EVENT.ACTION.FAILURE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05DB\05E9\05DC')
,p_version_scn=>2704854
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139050132293751327)
,p_name=>'APEX.TASK.EVENT.ACTION.SUCCESS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D5\05E6\05E2 \05D1\05D4\05E6\05DC\05D7\05D4')
,p_is_js_message=>true
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139050360742751327)
,p_name=>'APEX.TASK.EVENT.ACTION.SUCCESS_MESSAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E4\05E2\05D5\05DC\05D4 %1 \05D4\05E6\05DC\05D9\05D7\05D4 \05E2\05DD \05D4\05D4\05D5\05D3\05E2\05D4 %0')
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139053662007751328)
,p_name=>'APEX.TASK.EVENT.BEFORE_EXPIRE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05E4\05E0\05D9 \05EA\05E4\05D5\05D2\05D4')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139079258586751335)
,p_name=>'APEX.TASK.EVENT.CANCEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D8\05DC')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139078761843751335)
,p_name=>'APEX.TASK.EVENT.CANCEL_MESSAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05DE\05E9\05D9\05DE\05D4 \05D1\05D5\05D8\05DC\05D4')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139079349272751336)
,p_name=>'APEX.TASK.EVENT.CANCEL_NOT_ALLOWED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05DE\05E9\05EA\05EA\05E3 \05D0\05D9\05E0\05D5 \05DE\05D5\05E8\05E9\05D4 \05DC\05D1\05D8\05DC \05D0\05EA \05D4\05DE\05E9\05D9\05DE\05D4')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139078693587751335)
,p_name=>'APEX.TASK.EVENT.CLAIM'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D1\05D9\05E2\05D4')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139079071392751335)
,p_name=>'APEX.TASK.EVENT.CLAIM_ALREADY_CLAIMED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05D9\05EA\05DB\05DF \05E9\05D4\05DE\05E9\05D9\05DE\05D4 \05DB\05D1\05E8 \05E0\05EA\05D1\05E2\05D4 \05E2\05DC-\05D9\05D3\05D9 \05DE\05E9\05EA\05DE\05E9 \05D0\05D7\05E8 \05D0\05D5 \05E9\05D4\05DE\05E9\05EA\05EA\05E3 \05D0\05D9\05E0\05D5 \05D6\05DB\05D0\05D9 \05DC\05EA\05D1\05D5\05E2 \05DE\05E9\05D9\05DE\05D4 \05D6\05D5')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139078821595751335)
,p_name=>'APEX.TASK.EVENT.CLAIM_MESSAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E9\05D9\05DE\05D4 \05E0\05EA\05D1\05E2\05D4 \05E2\05DC-\05D9\05D3\05D9 %0')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139179943372751365)
,p_name=>'APEX.TASK.EVENT.COMPLETE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05E9\05DC\05DD')
,p_version_scn=>2704877
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139078408164751335)
,p_name=>'APEX.TASK.EVENT.COMPLETE_MESSAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05DE\05E9\05D9\05DE\05D4 \05D4\05D5\05E9\05DC\05DE\05D4 \05E2\05DD \05D4\05EA\05D5\05E6\05D0\05D4 %0')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139079764664751336)
,p_name=>'APEX.TASK.EVENT.COMPLETE_NOT_ALLOWED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05D9\05EA\05DB\05DF \05E9\05D4\05DE\05E9\05D9\05DE\05D4 \05DC\05D0 \05D4\05D5\05E7\05E6\05EA\05D4 \05D0\05D5 \05E9\05D4\05DE\05E9\05EA\05EA\05E3 \05D0\05D9\05E0\05D5 \05DE\05D5\05E8\05E9\05D4 \05DC\05D4\05E9\05DC\05D9\05DD \05D0\05EA \05D4\05DE\05E9\05D9\05DE\05D4')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139040185441751324)
,p_name=>'APEX.TASK.EVENT.COMPLETE_NO_OUTCOME'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05DE\05E9\05D9\05DE\05D4 \05D4\05D5\05E9\05DC\05DE\05D4 \05DC\05DC\05D0 \05EA\05D5\05E6\05D0\05D4')
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139180080757751365)
,p_name=>'APEX.TASK.EVENT.CREATE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E6\05D5\05E8')
,p_version_scn=>2704877
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139072943739751334)
,p_name=>'APEX.TASK.EVENT.CREATE_MESSAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05DE\05E9\05D9\05DE\05D4 \05E0\05D5\05E6\05E8\05D4 \05E2\05DD \05D4\05DE\05D6\05D4\05D4 %0')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139180136147751365)
,p_name=>'APEX.TASK.EVENT.DELEGATE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D0\05E6\05DC \05E1\05DE\05DB\05D5\05D9\05D5\05EA')
,p_version_scn=>2704877
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139078543146751335)
,p_name=>'APEX.TASK.EVENT.DELEGATE_MESSAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05DE\05E9\05D9\05DE\05D4 \05D4\05D5\05D0\05E6\05DC\05D4 \05DC\05D1\05E2\05DC\05D9\05DD \05D4\05E4\05D5\05D8\05E0\05E6\05D9\05D0\05DC\05D9 %0')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139079164319751335)
,p_name=>'APEX.TASK.EVENT.DELEGATE_NOT_ALLOWED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05D9\05EA\05DB\05DF \05E9\05D4\05DE\05E9\05EA\05EA\05E3 \05D0\05D9\05E0\05D5 \05D6\05DB\05D0\05D9 \05D0\05D5 \05E9\05DE\05E9\05EA\05EA\05E3 \05D7\05D3\05E9 \05D0\05D9\05E0\05D5 \05D1\05E2\05DC\05D9\05DD \05E4\05D5\05D8\05E0\05E6\05D9\05D0\05DC\05D9 \05E9\05DC \05DE\05E9\05D9\05DE\05D4 \05D6\05D5')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139052291020751327)
,p_name=>'APEX.TASK.EVENT.EXPIRE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E4\05D5\05DA \05DC\05E4\05D2 \05EA\05D5\05E7\05E3')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139053389877751328)
,p_name=>'APEX.TASK.EVENT.EXPIRED_MESSAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05D2 \05EA\05D5\05E7\05E3 \05D4\05DE\05E9\05D9\05DE\05D4.')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139180251400751365)
,p_name=>'APEX.TASK.EVENT.FAIL'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05DB\05E9\05DC')
,p_version_scn=>2704877
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139048944763751326)
,p_name=>'APEX.TASK.EVENT.INFO_REQUEST.NOT_ALLOWED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05D9\05EA\05DB\05DF \05E9\05D4\05DE\05E9\05D9\05DE\05D4 \05DC\05D0 \05D4\05D5\05E7\05E6\05EA\05D4 \05D0\05D5 \05E9\05D4\05DE\05E9\05EA\05EA\05E3 \05D0\05D9\05E0\05D5 \05DE\05D5\05E8\05E9\05D4 \05DC\05D1\05E7\05E9 \05DE\05D9\05D3\05E2 \05DC\05DE\05E9\05D9\05DE\05D4')
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139049156936751326)
,p_name=>'APEX.TASK.EVENT.INFO_SUBMIT.NOT_ALLOWED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05D9\05EA\05DB\05DF \05E9\05DC\05D0 \05D4\05EA\05D1\05E7\05E9 \05DB\05DC \05DE\05D9\05D3\05E2 \05DC\05DE\05E9\05D9\05DE\05D4 \05D0\05D5 \05E9\05D4\05DE\05E9\05EA\05EA\05E3 \05D0\05D9\05E0\05D5 \05DE\05D5\05E8\05E9\05D4 \05DC\05E9\05DC\05D5\05D7 \05DE\05D9\05D3\05E2 \05E2\05DC \05D4\05DE\05E9\05D9\05DE\05D4.')
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139052758811751327)
,p_name=>'APEX.TASK.EVENT.MAXRENEW_EXPIRED_MESSAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E4\05D5\05DA \05D0\05EA \05D4\05DE\05E9\05D9\05DE\05D4 \05DC\05E4\05D2\05EA \05EA\05D5\05E7\05E3 \05DB\05D9\05D5\05D5\05DF \05E9\05D4\05D2\05D9\05E2 \05D4\05DE\05E1\05E4\05E8 \05D4\05DE\05E8\05D1\05D9, \05E9\05D4\05D5\05D0 %0.')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139080045092751336)
,p_name=>'APEX.TASK.EVENT.NOT_ALLOWED_BUSINESS_ADMIN'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05D9\05EA\05DB\05DF \05E9\05D4\05DE\05E9\05D9\05DE\05D4 \05D0\05D9\05E0\05D4 \05D1\05DE\05E6\05D1 \05E0\05DB\05D5\05DF \05D0\05D5 \05E9\05D4\05DE\05E9\05EA\05EA\05E3 \05D0\05D9\05E0\05D5 \05DE\05E0\05D4\05DC\05DF \05E2\05E1\05E7\05D9 \05DC\05DE\05E9\05D9\05DE\05D4 \05D6\05D5')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139080171533751336)
,p_name=>'APEX.TASK.EVENT.NOT_APPLICABLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05D9\05EA\05DB\05DF \05E9\05D4\05E4\05E2\05D5\05DC\05D4 %0 \05D0\05D9\05E0\05D4 \05D9\05D3\05D5\05E2\05D4 \05D0\05D5 \05E9\05D0\05D9\05E0\05D4 \05D9\05E9\05D9\05DE\05D4 \05DC\05DE\05E9\05D9\05DE\05D4 \05D6\05D5')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139180366364751366)
,p_name=>'APEX.TASK.EVENT.RELEASE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D7\05E8\05E8')
,p_version_scn=>2704877
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139166099888751361)
,p_name=>'APEX.TASK.EVENT.RELEASE_MESSAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05DE\05E9\05D9\05DE\05D4 \05E9\05D5\05D7\05E8\05E8\05D4, \05D5\05D0\05D7\05E8\05D9\05DD \05D9\05DB\05D5\05DC\05D9\05DD \05E2\05DB\05E9\05D9\05D5 \05DC\05EA\05D1\05D5\05E2 \05D0\05D5\05EA\05D4')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139058973052751329)
,p_name=>'APEX.TASK.EVENT.RELEASE_NOT_ALLOWED'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D7\05E8\05D5\05E8 \05D4\05DE\05E9\05D9\05DE\05D4 \05D0\05E1\05D5\05E8, \05D4\05DE\05E9\05EA\05DE\05E9 \05D0\05D9\05E0\05D5 \05D1\05E2\05DC\05D9 \05D4\05DE\05E9\05D9\05DE\05D4')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139075964931751335)
,p_name=>'APEX.TASK.EVENT.REMOVE_OWNER'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05E8 \05D1\05E2\05DC\05D9\05DD')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139076162806751335)
,p_name=>'APEX.TASK.EVENT.REMOVE_OWNER_MESSAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05DE\05E9\05EA\05EA\05E3 %0 \05D4\05D5\05E1\05E8 \05DE\05D4\05DE\05E9\05D9\05DE\05D4')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139053513484751328)
,p_name=>'APEX.TASK.EVENT.RENEW'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D9\05D3\05D5\05E9')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139052420007751327)
,p_name=>'APEX.TASK.EVENT.RENEW_EXPIRED_MESSAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05DE\05E9\05D9\05DE\05D4 \05D7\05D5\05D3\05E9\05D4 \05E2\05DD \05D4\05DE\05D6\05D4\05D4 %0, \05D4\05DE\05E1\05E4\05E8 \05D4\05DE\05E8\05D1\05D9 \05D4\05E0\05D5\05EA\05E8 \05E9\05DC \05D7\05D9\05D3\05D5\05E9\05D9\05DD \05DC\05E4\05E0\05D9 \05E4\05E7\05D9\05E2\05EA \05D4\05EA\05D5\05E7\05E3 \05D4\05D5\05D0 %1.')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139053420068751328)
,p_name=>'APEX.TASK.EVENT.RENEW_MESSAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D6\05D4\05D4 \05DE\05E9\05D9\05DE\05D4 %0 \05D7\05D5\05D3\05E9 \05E2\05DD \05DE\05D6\05D4\05D4 \05D4\05DE\05E9\05D9\05DE\05D4 %1')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139049471869751326)
,p_name=>'APEX.TASK.EVENT.REQUEST_INFO'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05E7\05E9 \05DE\05D9\05D3\05E2')
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139049363460751326)
,p_name=>'APEX.TASK.EVENT.REQUEST_INFO_MESSAGE'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D4\05EA\05D1\05E7\05E9 \05DC\05DE\05D9\05D3\05E2 \05E0\05D5\05E1\05E3: %1')
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139047246910751326)
,p_name=>'APEX.TASK.EVENT.SET_INITIATOR_CAN_COMPLETE_MESSAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D2\05D3\05E8 \05D0\05EA ''\05D9\05D5\05D6\05DD \05D9\05DB\05D5\05DC \05DC\05D4\05E9\05DC\05D9\05DD'' \05DC-%0')
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139049590350751326)
,p_name=>'APEX.TASK.EVENT.SUBMIT_INFO'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DC\05D7 \05DE\05D9\05D3\05E2')
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139049228797751326)
,p_name=>'APEX.TASK.EVENT.SUBMIT_INFO_MESSAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05DE\05D9\05D3\05E2 \05D4\05DE\05D1\05D5\05E7\05E9 \05E0\05E9\05DC\05D7 \05D0\05DC %0: %1')
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139180440561751366)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D3\05DB\05D5\05DF \05D4\05E2\05E8\05D4')
,p_version_scn=>2704877
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139076963973751335)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT_MESSAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05E1\05E3 \05D4\05E2\05E8\05D4: %0')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139079814820751336)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT_NOT_ALLOWED'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E6\05D1 \05D4\05DE\05E9\05D9\05DE\05D4 \05DC\05D0 \05DE\05E8\05E9\05D4 \05D4\05E2\05E8\05D5\05EA')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139087130199751338)
,p_name=>'APEX.TASK.EVENT.UPDATE_DUE_DATE_MESSAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D2\05D3\05E8 \05D0\05EA \05EA\05D0\05E8\05D9\05DA \05D4\05D9\05E2\05D3 \05E9\05DC \05D4\05DE\05E9\05D9\05DE\05D4 \05DC-%0')
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139045229907751325)
,p_name=>'APEX.TASK.EVENT.UPDATE_DUE_ON'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D0\05E8\05D9\05DA \05D9\05E2\05D3 \05E9\05DC \05E2\05D3\05DB\05D5\05DF')
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139180579522751366)
,p_name=>'APEX.TASK.EVENT.UPDATE_OWNER'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D3\05DB\05DF \05D1\05E2\05DC\05D9\05DD')
,p_version_scn=>2704877
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139078276884751335)
,p_name=>'APEX.TASK.EVENT.UPDATE_OWNER_MESSAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05E1\05E3 \05D1\05E2\05DC\05D9\05DD \05E4\05D5\05D8\05E0\05E6\05D9\05D0\05DC\05D9 %0 \05DC\05DE\05E9\05EA\05EA\05E4\05D9 \05D4\05DE\05E9\05D9\05DE\05D4')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139077303123751335)
,p_name=>'APEX.TASK.EVENT.UPDATE_PARAM'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D3\05DB\05DF \05E4\05E8\05DE\05D8\05E8\05D9\05DD')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139180656310751366)
,p_name=>'APEX.TASK.EVENT.UPDATE_PRIORITY'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D3\05DB\05DF \05E7\05D3\05D9\05DE\05D5\05EA')
,p_version_scn=>2704877
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139078961110751335)
,p_name=>'APEX.TASK.EVENT.UPDATE_PRIORITY_MESSAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D2\05D3\05E8 \05E7\05D3\05D9\05DE\05D5\05EA \05DE\05E9\05D9\05DE\05D4 \05DC-%0')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139076291544751335)
,p_name=>'APEX.TASK.EVENT.UPD_PARAMETER_MESSAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E4\05E8\05DE\05D8\05E8 "%0" \05E2\05D5\05D3\05DB\05DF \05DE-"%1" \05DC-"%2".')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139059789305751329)
,p_name=>'APEX.TASK.EVENT.WF_CANCEL_MESSAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05DE\05E9\05D9\05DE\05D4 \05D1\05D5\05D8\05DC\05D4 \05DE\05DB\05D9\05D5\05D5\05DF \05E9\05DE\05D5\05E4\05E2 \05EA\05D4\05DC\05D9\05DA \05D4\05E2\05D1\05D5\05D3\05D4 \05D4\05DE\05EA\05D0\05D9\05DD \05D4\05D5\05E4\05E1\05E7.')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139056804444751329)
,p_name=>'APEX.TASK.FORWARD_TASK_NOT_AUTHORIZED'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D3\05DD \05DE\05E9\05D9\05DE\05D4: \05DC\05D0 \05DE\05D5\05E8\05E9\05D4')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139050218373751327)
,p_name=>'APEX.TASK.INITIATED_BY_USER_SINCE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DD \05D4\05D9\05D5\05D6\05DD: %0 %1')
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139059167257751329)
,p_name=>'APEX.TASK.INTERNAL_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E8\05E2\05D4 \05E9\05D2\05D9\05D0\05D4 \05E4\05E0\05D9\05DE\05D9\05EA \05D1\05DC\05EA\05D9 \05E6\05E4\05D5\05D9\05D4')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139057438207751329)
,p_name=>'APEX.TASK.NOT_APPLICABLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05E2\05D5\05DC\05EA \05D4\05DE\05E9\05D9\05DE\05D4 \05DC\05D0 \05D9\05E9\05D9\05DE\05D4')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139083033005751337)
,p_name=>'APEX.TASK.NO_POTENTIAL_OWNER'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D1\05E2\05DC\05D9\05DD \05D4\05E4\05D5\05D8\05E0\05E6\05D9\05D0\05DC\05D9 \05D4\05D6\05D4 \05DC\05D0 \05E7\05D9\05D9\05DD.')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139058702070751329)
,p_name=>'APEX.TASK.OUTCOME.APPROVED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D5\05E9\05E8')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139058834704751329)
,p_name=>'APEX.TASK.OUTCOME.REJECTED'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05D3\05D7\05D4')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139040203124751324)
,p_name=>'APEX.TASK.OUTCOME_MISSING'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E9\05DC\05DE\05EA \05DE\05E9\05D9\05DE\05D4 \05D3\05D5\05E8\05E9\05EA \05EA\05D5\05E6\05D0\05D4')
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139040432630751324)
,p_name=>'APEX.TASK.OUTCOME_NOT_ALLOWED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05E1\05D5\05E8 \05E9\05EA\05D4\05D9\05D4 \05DC\05DE\05E9\05D9\05DE\05D4 \05EA\05D5\05E6\05D0\05D4')
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139076060571751335)
,p_name=>'APEX.TASK.PARAM_NOT_UPDATABLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05E2\05D3\05DB\05DF \05D0\05EA \05D4\05E4\05E8\05DE\05D8\05E8 %0.')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139072380288751333)
,p_name=>'APEX.TASK.PARTICIPANT_EXISTS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05DE\05E9\05EA\05EA\05E3 \05DB\05D1\05E8 \05E7\05D9\05D9\05DD \05DC\05DE\05D5\05E4\05E2 \05DE\05E9\05D9\05DE\05D4 \05D6\05D4.')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139173806227751364)
,p_name=>'APEX.TASK.PRIORITY.1'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05D7\05D5\05E3')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139050964821751327)
,p_name=>'APEX.TASK.PRIORITY.1.DESCRIPTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05D7\05D5\05E3')
,p_version_scn=>2704854
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139173709981751364)
,p_name=>'APEX.TASK.PRIORITY.2'
,p_message_language=>'he'
,p_message_text=>unistr('\05D2\05D1\05D5\05D4')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139051022864751327)
,p_name=>'APEX.TASK.PRIORITY.2.DESCRIPTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D3\05D9\05DE\05D5\05EA \05D2\05D1\05D5\05D4\05D4')
,p_version_scn=>2704854
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139173655689751364)
,p_name=>'APEX.TASK.PRIORITY.3'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D9\05E0\05D5\05E0\05D9')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139051111972751327)
,p_name=>'APEX.TASK.PRIORITY.3.DESCRIPTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D3\05D9\05DE\05D5\05EA \05D1\05D9\05E0\05D5\05E0\05D9\05EA')
,p_version_scn=>2704854
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139173582732751363)
,p_name=>'APEX.TASK.PRIORITY.4'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05DE\05D5\05DA')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139051264665751327)
,p_name=>'APEX.TASK.PRIORITY.4.DESCRIPTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D3\05D9\05DE\05D5\05EA \05E0\05DE\05D5\05DB\05D4')
,p_version_scn=>2704854
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139173433353751363)
,p_name=>'APEX.TASK.PRIORITY.5'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E0\05DE\05D5\05DA \05D1\05D9\05D5\05EA\05E8')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139051376494751327)
,p_name=>'APEX.TASK.PRIORITY.5.DESCRIPTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E7\05D3\05D9\05DE\05D5\05EA \05D4\05E0\05DE\05D5\05DB\05D4 \05D1\05D9\05D5\05EA\05E8')
,p_version_scn=>2704854
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139057090685751329)
,p_name=>'APEX.TASK.SET_PRIORITY_NOT_AUTHORIZED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D2\05D3\05E8 \05E7\05D3\05D9\05DE\05D5\05EA \05DE\05E9\05D9\05DE\05D4: \05DC\05D0 \05DE\05D5\05E8\05E9\05D4')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139058269825751329)
,p_name=>'APEX.TASK.STATE.ASSIGNED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05E7\05E6\05D4')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139058607799751329)
,p_name=>'APEX.TASK.STATE.CANCELLED'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D1\05D5\05D8\05DC')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139058366073751329)
,p_name=>'APEX.TASK.STATE.COMPLETED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05E9\05DC\05DD')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139058504308751329)
,p_name=>'APEX.TASK.STATE.ERRORED'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D5\05D9')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139052073760751327)
,p_name=>'APEX.TASK.STATE.EXPIRED'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05D2 \05EA\05D5\05E7\05E3')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139058424526751329)
,p_name=>'APEX.TASK.STATE.FAILED'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05DB\05E9\05DC')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139048769392751326)
,p_name=>'APEX.TASK.STATE.INFO_REQUESTED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05EA\05D1\05E7\05E9 \05DE\05D9\05D3\05E2')
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139058113870751329)
,p_name=>'APEX.TASK.STATE.UNASSIGNED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05DC\05EA\05D9 \05DE\05D5\05E7\05E6\05D4')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139080550376751336)
,p_name=>'APEX.TASK.TASK_CREATE_ERROR'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\05D4\05D9\05E6\05D9\05E8\05D4 \05E9\05DC \05DE\05E9\05D9\05DE\05D4 \05D7\05D3\05E9\05D4 \05DC\05D4\05D2\05D3\05E8\05EA \05D4\05DE\05E9\05D9\05DE\05D4 %0 \05D1\05D9\05D9\05E9\05D5\05DD %1 \05E0\05DB\05E9\05DC.'),
'SQLCODE: %2'))
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139080410335751336)
,p_name=>'APEX.TASK.TASK_CREATE_NO_POTENTIAL_OWNER'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05D9\05E1\05D9\05D5\05DF \05DC\05D9\05E6\05D5\05E8 \05DE\05E9\05D9\05DE\05D4 \05DC\05D4\05D2\05D3\05E8\05EA \05D4\05DE\05E9\05D9\05DE\05D4 %0 \05D1\05D9\05D9\05E9\05D5\05DD %1 \05E0\05DB\05E9\05DC \05DB\05D9\05D5\05D5\05DF \05E9\05D4\05D2\05D3\05E8\05EA \05D4\05DE\05E9\05D9\05DE\05D4 \05DC\05D0 \05DE\05DB\05D9\05DC\05D4 \05D0\05E3 \05D1\05E2\05DC\05D9\05DD \05E4\05D5\05D8\05E0\05E6\05D9\05D0\05DC\05D9. \05E2\05E8\05D5\05DA \05D0\05EA \05D4\05D2\05D3\05E8\05EA \05D4\05DE\05E9\05D9\05DE\05D4 \05D5\05D4\05D5\05E1\05E3 \05DC\05E4\05D7\05D5\05EA \05DE\05E9\05EA\05EA\05E3 \05D0\05D7\05D3 \05DE\05E1\05D5\05D2 \05D1\05E2\05DC\05D9\05DD \05E4\05D5\05D8\05E0\05E6\05D9\05D0\05DC\05D9')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139057718613751329)
,p_name=>'APEX.TASK.TASK_DEFINITION_NOT_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05DE\05E6\05D0\05D4 \05D4\05D2\05D3\05E8\05EA \05DE\05E9\05D9\05DE\05D4')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139057650396751329)
,p_name=>'APEX.TASK.TASK_DEF_PARTICIPANTS_NOT_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05DE\05E6\05D0\05D5 \05DE\05E9\05EA\05EA\05E4\05D9\05DD \05DC\05DE\05E9\05D9\05DE\05D4')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139059003144751329)
,p_name=>'APEX.TASK.TASK_ID_PK_VIOLATION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05E9 \05D9\05D5\05EA\05E8 \05DE\05DE\05E9\05D9\05DE\05D4 \05D0\05D7\05EA \05DC\05DE\05D6\05D4\05D4 \05D4\05DE\05E9\05D9\05DE\05D4 \05D4\05E0\05EA\05D5\05DF. \05D1\05D3\05D5\05E7 \05D0\05E6\05DC \05DE\05E0\05D4\05DC\05DF \05DE\05E1\05D3 \05D4\05E0\05EA\05D5\05E0\05D9\05DD \05E9\05DC\05DA')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139057851065751329)
,p_name=>'APEX.TASK.TASK_NOT_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05DE\05E6\05D0\05D4 \05DE\05E9\05D9\05DE\05D4')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139057549965751329)
,p_name=>'APEX.TASK.TASK_PARAMETER_NOT_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05DE\05E6\05D0 \05E4\05E8\05DE\05D8\05E8 \05DC\05DE\05E9\05D9\05DE\05D4')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139093889037751340)
,p_name=>'APEX.TASK.TYPE.ACTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05E2\05D5\05DC\05D4')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139093730649751340)
,p_name=>'APEX.TASK.TYPE.APPROVAL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E9\05D5\05E8')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139041114729751324)
,p_name=>'APEX.TASK.VACATION_RULE_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05E8\05D5\05E6\05D3\05D5\05E8\05EA \05DB\05DC\05DC \05D7\05D5\05E4\05E9\05D4 %2 \05E0\05DB\05E9\05DC\05D4 \05D1\05D1\05D9\05E6\05D5\05E2 \05DC\05D4\05D2\05D3\05E8\05EA \05D4\05DE\05E9\05D9\05DE\05D4 %0 \05D1\05D9\05D9\05E9\05D5\05DD %1.')
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139041315706751324)
,p_name=>'APEX.TASK.VACATION_RULE_MESSAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05DE\05E9\05EA\05EA\05E3 %1 \05E0\05D5\05E1\05E3 \05DB\05EA\05D7\05DC\05D9\05E3 \05DC\05DE\05E9\05EA\05EA\05E3 %0. \05E1\05D9\05D1\05D4 - %2 .')
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139245057307751385)
,p_name=>'APEX.TB.TOOLBAR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05E8\05D2\05DC \05DB\05DC\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139098586628751341)
,p_name=>'APEX.TEMPLATE.APPLICATION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05D9\05E9\05D5\05DD')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139259718030751389)
,p_name=>'APEX.TEMPLATE.EXPAND_COLLAPSE_NAV_LABEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E8\05D7\05D1 / \05DB\05D5\05D5\05E5 \05E0\05D9\05D5\05D5\05D8')
,p_version_scn=>2704896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139259864483751389)
,p_name=>'APEX.TEMPLATE.EXPAND_COLLAPSE_SIDE_COL_LABEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E8\05D7\05D1 / \05DB\05D5\05D5\05E5 \05E2\05DE\05D5\05D3\05EA \05E6\05D3')
,p_version_scn=>2704896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139168285831751362)
,p_name=>'APEX.TEMPLATE.MAIN_NAV_LABEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05D9\05D5\05D5\05D8 \05E8\05D0\05E9\05D9')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139069068358751332)
,p_name=>'APEX.TEMPLATE_DIRECTIVE.INVALID_PLACEHOLDER_NAME'
,p_message_language=>'he'
,p_message_text=>unistr('"%0" \05D4\05D5\05D0 \05E9\05DD \05DC\05D0 \05EA\05E7\05E3 \05E9\05DC \05E9\05D5\05DE\05E8 \05DE\05E7\05D5\05DD.')
,p_version_scn=>2704858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139175937921751364)
,p_name=>'APEX.TIME.DAY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05D5\05DD \05D0\05D7\05D3')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139175772767751364)
,p_name=>'APEX.TIME.HOUR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05E2\05D4 \05D0\05D7\05EA')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139176028941751364)
,p_name=>'APEX.TIME.N_DAYS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D9\05DE\05D9\05DD')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139175841969751364)
,p_name=>'APEX.TIME.N_HOURS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05E9\05E2\05D5\05EA')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139175662621751364)
,p_name=>'APEX.TIME.N_MINUTES'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D3\05E7\05D5\05EA')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139176238637751364)
,p_name=>'APEX.TIME.N_WEEKS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05E9\05D1\05D5\05E2\05D5\05EA')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139176173713751364)
,p_name=>'APEX.TIME.WEEK'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D1\05D5\05E2 \05D0\05D7\05D3')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139073900434751334)
,p_name=>'APEX.TMV.SELECTION_COUNT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05D1\05D7\05E8\05D5 %0 \05E4\05E8\05D9\05D8\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139074199998751334)
,p_name=>'APEX.TMV.SELECTOR_LABEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05E8 \05E4\05E8\05D9\05D8')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139074036396751334)
,p_name=>'APEX.TMV.SELECTOR_LABEL_1'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05E8 %0')
,p_is_js_message=>true
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139262871086751390)
,p_name=>'APEX.UI.BACK_TO_TOP'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05EA\05D7\05DC\05EA \05D3\05E3')
,p_is_js_message=>true
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139120411929751348)
,p_name=>'APEX.UI.ENABLED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05E4\05E9\05E8\05D9')
,p_is_js_message=>true
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139088973498751338)
,p_name=>'APEX.UNHANDLED_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05E2\05D9\05D1\05D5\05D3 \05D1\05E7\05E9\05D4')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139074543104751334)
,p_name=>'APEX.UPDATE_MESSAGE_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05E2\05D3\05DB\05DF \05D0\05EA \05D4\05D5\05D3\05E2\05EA \05D4\05D8\05E7\05E1\05D8 %0 \05DB\05D9\05D5\05D5\05DF \05E9\05D4\05E8\05D9\05E9\05D5\05DD \05DB\05DE\05E0\05D5\05D9 \05D4\05EA\05D1\05E6\05E2 \05DE\05D9\05D9\05E9\05D5\05DD \05D0\05D7\05E8.')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139177678734751365)
,p_name=>'APEX.VALUE_REQUIRED'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05D3\05E8\05E9 \05E2\05E8\05DA')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139094021540751340)
,p_name=>'APEX.VISUALLY_HIDDEN_HEADING'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05DE\05EA \05DB\05D5\05EA\05E8\05EA %0, \05E0\05E1\05EA\05E8\05EA')
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139222464202751378)
,p_name=>'APEX.WARN_ON_UNSAVED_CHANGES'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05E3 \05D6\05D4 \05DB\05D5\05DC\05DC \05E9\05D9\05E0\05D5\05D9\05D9\05DD \05E9\05DC\05D0 \05E0\05E9\05DE\05E8\05D5.')
,p_is_js_message=>true
,p_version_scn=>2704886
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139084027863751337)
,p_name=>'APEX.WF.NAVIGATOR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05D5\05D5\05D8')
,p_is_js_message=>true
,p_version_scn=>2704860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139083770817751337)
,p_name=>'APEX.WF.ZOOM_IN'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05EA\05E7\05E8\05D1\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139084743867751337)
,p_name=>'APEX.WF.ZOOM_LEVEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05DE\05EA \05D6\05D5\05DD {0}%')
,p_is_js_message=>true
,p_version_scn=>2704861
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139083821644751337)
,p_name=>'APEX.WF.ZOOM_OUT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05EA\05E8\05D7\05E7\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139083925523751337)
,p_name=>'APEX.WF.ZOOM_RESET'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05E4\05E1 \05D6\05D5\05DD')
,p_is_js_message=>true
,p_version_scn=>2704860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139059431456751329)
,p_name=>'APEX.WF_DIAGRAM.ARIA_DESC'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05D9\05D0\05D2\05E8\05DE\05EA \05EA\05D4\05DC\05D9\05DA \05D4\05E2\05D1\05D5\05D3\05D4 \05D0\05D9\05E0\05D4 \05E0\05D2\05D9\05E9\05D4 \05DB\05E8\05D2\05E2.')
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139059343873751329)
,p_name=>'APEX.WF_DIAGRAM.ARIA_LABEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05D9\05D0\05D2\05E8\05DE\05EA \05EA\05D4\05DC\05D9\05DA \05E2\05D1\05D5\05D3\05D4')
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139061280509751330)
,p_name=>'APEX.WORKFLOW.ACTION_NOT_ALLOWED'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D5\05E4\05E2 \05EA\05D4\05DC\05D9\05DA \05D4\05E2\05D1\05D5\05D3\05D4 %0 \05E0\05DE\05E6\05D0 \05DB\05E2\05EA \05D1\05DE\05E6\05D1 %1. \05DC\05DB\05DF \05D4\05E4\05E2\05D5\05DC\05D4 \05D0\05E1\05D5\05E8\05D4')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139063863404751331)
,p_name=>'APEX.WORKFLOW.ACTIVITY.COMPLETED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05DE\05D5\05E4\05E2 %1 \05E9\05DC \05E4\05E2\05D9\05DC\05D5\05EA %2 \05D1\05EA\05D4\05DC\05D9\05DA \05D4\05E2\05D1\05D5\05D3\05D4 %0 \05D4\05D5\05E9\05DC\05DD')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139063693199751331)
,p_name=>'APEX.WORKFLOW.ACTIVITY.CREATED'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05D5\05E6\05E8 \05DE\05D5\05E4\05E2 \05D7\05D3\05E9 %1 \05E9\05DC \05E4\05E2\05D9\05DC\05D5\05EA %2 \05D1\05EA\05D4\05DC\05D9\05DA \05D4\05E2\05D1\05D5\05D3\05D4 %0')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139055455190751328)
,p_name=>'APEX.WORKFLOW.ACTIVITY.DATA_NOT_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D5\05E8\05EA \05E0\05EA\05D5\05E0\05D9\05DD \05E0\05D5\05E1\05E4\05EA \05D4\05DE\05E9\05D5\05D9\05DB\05EA \05DC\05DE\05D5\05E4\05E2 \05E4\05E2\05D9\05DC\05D5\05EA \05EA\05D4\05DC\05D9\05DA \05E2\05D1\05D5\05D3\05D4 \05D6\05D4 \05DC\05D0 \05E0\05DE\05E6\05D0\05D4')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139063775127751331)
,p_name=>'APEX.WORKFLOW.ACTIVITY.RETRIED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D5\05E6\05E2 \05E0\05D9\05E1\05D9\05D5\05DF \05D7\05D5\05D6\05E8 \05E9\05DC \05D4\05DE\05D5\05E4\05E2 \05D4\05E9\05D2\05D5\05D9 %1 \05E9\05DC \05E4\05E2\05D9\05DC\05D5\05EA %2 \05D1\05EA\05D4\05DC\05D9\05DA \05D4\05E2\05D1\05D5\05D3\05D4 %0')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139045737371751325)
,p_name=>'APEX.WORKFLOW.ACTIVITY.TERMINATED'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D5\05E4\05E2 \05D4\05E4\05E2\05D9\05DC\05D5\05EA %1 \05D1\05EA\05D4\05DC\05D9\05DA \05D4\05E2\05D1\05D5\05D3\05D4 %0 \05D4\05D5\05E4\05E1\05E7')
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139079522901751336)
,p_name=>'APEX.WORKFLOW.ACTIVITY.TIMEOUT'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D5\05E4\05E2 \05D4\05E4\05E2\05D9\05DC\05D5\05EA %1 \05D1\05EA\05D4\05DC\05D9\05DA \05D4\05E2\05D1\05D5\05D3\05D4 %0 \05E0\05DB\05E0\05E1 \05DC\05E4\05E1\05E7 \05D6\05DE\05DF \05D4\05D5\05E4\05E1\05E7')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139063906465751331)
,p_name=>'APEX.WORKFLOW.ACTIVITY.WAITING'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05DE\05D5\05E4\05E2 %1 \05E9\05DC \05E4\05E2\05D9\05DC\05D5\05EA %2 \05D1\05EA\05D4\05DC\05D9\05DA \05D4\05E2\05D1\05D5\05D3\05D4 %0 \05E0\05DE\05E6\05D0 \05D1\05DE\05E6\05D1 \05D4\05DE\05EA\05E0\05D4')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139045536110751325)
,p_name=>'APEX.WORKFLOW.ALTERED_AND_RESUMED'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D5\05E4\05E2 \05EA\05D4\05DC\05D9\05DA \05E2\05D1\05D5\05D3\05D4 %0 \05E9\05D5\05E0\05D4 \05D5\05D4\05EA\05D7\05D3\05E9 \05D1\05E4\05E2\05D9\05DC\05D5\05EA %1')
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139062907899751331)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.COMPLETED'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D5\05E4\05E2 \05D4\05D4\05DE\05EA\05E0\05D4 %1 \05E9\05DC \05E4\05E2\05D9\05DC\05D5\05EA %2 \05D1\05EA\05D4\05DC\05D9\05DA \05D4\05E2\05D1\05D5\05D3\05D4 %0 \05D4\05D5\05E9\05DC\05DD \05D1\05D4\05E6\05DC\05D7\05D4')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139062764055751331)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.FAULTED'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05E2\05D9\05DC\05D5\05EA \05D4\05DE\05EA\05E0\05D4 %1 \05DE\05D5\05D2\05D3\05E8\05EA \05DB\05E9\05D2\05D5\05D9\05D4 \05DB\05D9\05D5\05D5\05DF \05E9\05EA\05D4\05DC\05D9\05DA \05D4\05E2\05D1\05D5\05D3\05D4 %0 \05DB\05D1\05E8 \05D4\05D9\05D4 \05D1\05DE\05E6\05D1 \05E9\05D2\05D5\05D9 \05DC\05E4\05E0\05D9 \05E9\05D4\05E4\05E2\05D9\05DC\05D5\05EA \05D4\05D5\05E9\05DC\05DE\05D4')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139062889925751331)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.TERMINATED'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05E2\05D9\05DC\05D5\05EA \05D4\05DE\05EA\05E0\05D4 %1 \05D4\05E1\05EA\05D9\05D9\05DE\05D4 \05DB\05D9\05D5\05D5\05DF \05E9\05EA\05D4\05DC\05D9\05DA \05D4\05E2\05D1\05D5\05D3\05D4 %0 \05DB\05D1\05E8 \05D4\05D9\05D4 \05D1\05DE\05E6\05D1 \05D4\05E1\05EA\05D9\05D9\05DD \05DC\05E4\05E0\05D9 \05D4\05E9\05DC\05DE\05EA \05D4\05E4\05E2\05D9\05DC\05D5\05EA')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139045837312751325)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.TERMINATE_FAILED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E4\05E1\05E7\05EA \05D4\05E4\05E2\05D9\05DC\05D5\05EA %1 \05D1\05EA\05D4\05DC\05D9\05DA \05D4\05E2\05D1\05D5\05D3\05D4 %0 \05E0\05DB\05E9\05DC\05D4 \05E2\05E7\05D1 \05D7\05E8\05D9\05D2 - %2')
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139061432070751330)
,p_name=>'APEX.WORKFLOW.BUSY'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D4\05DC\05D9\05DA \05D4\05E2\05D1\05D5\05D3\05D4 \05DE\05D1\05E6\05E2 \05DB\05E2\05EA \05D4\05E9\05DC\05DE\05EA \05E4\05E2\05D5\05DC\05D4 \05E7\05D5\05D3\05DE\05EA. \05E0\05E1\05D4 \05DE\05D0\05D5\05D7\05E8 \05D9\05D5\05EA\05E8')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139077565905751335)
,p_name=>'APEX.WORKFLOW.COMPLETED_SINCE'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D4\05D5\05E9\05DC\05DD')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139060576666751330)
,p_name=>'APEX.WORKFLOW.CONTINUE.NOT_ALLOWED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05D4\05DE\05E9\05D9\05DA \05D0\05EA \05EA\05D4\05DC\05D9\05DA \05D4\05E2\05D1\05D5\05D3\05D4 %0 \05DB\05D9\05D5\05D5\05DF \05E9\05D4\05D5\05D0 \05E0\05DE\05E6\05D0 \05DB\05E2\05EA \05D1\05E4\05E2\05D9\05DC\05D5\05EA %1 \05E9\05D0\05D9\05E0\05D4 \05D1\05DE\05E6\05D1 \05D4\05DE\05EA\05E0\05D4')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139072433075751333)
,p_name=>'APEX.WORKFLOW.CORRELATION_CONTEXT_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D0\05D9\05E0\05D5 \05D4\05E7\05E9\05E8 \05EA\05E7\05E3 \05E9\05DC \05DE\05EA\05D0\05DD \05EA\05D4\05DC\05D9\05DA \05E2\05D1\05D5\05D3\05D4 \05DC\05EA\05D4\05DC\05D9\05DA \05D4\05DE\05EA\05D1\05E6\05E2 \05E2\05DC-\05D9\05D3\05D9 \05E4\05E2\05D9\05DC\05D5\05EA \05EA\05D4\05DC\05D9\05DA \05E2\05D1\05D5\05D3\05D4 \05D6\05D4. \05D4\05E7\05E9\05E8 \05D4\05DE\05EA\05D0\05DD \05D7\05D9\05D9\05D1 \05DC\05D4\05D9\05D5\05EA \05D8\05E7\05E1\05D8 \05DE\05D5\05E4\05E8\05D3 \05D1\05E0\05E7\05D5\05D3\05EA\05D9\05D9\05DD \05D4\05DE\05DB\05D9\05DC APEX_APPL_WORKFLOW \05D5\05D0\05D7\05E8\05D9\05D5 \05DE\05D6\05D4\05D4 \05DE\05D5\05E4\05E2 \05EA\05D4\05DC\05D9\05DA \05D4\05E2\05D1\05D5\05D3\05D4 \05D5\05DE\05D6\05D4\05D4 \05DE\05D5\05E4\05E2 \05D4\05E4\05E2\05D9\05DC\05D5\05EA.')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139063173373751331)
,p_name=>'APEX.WORKFLOW.CREATED'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05D5\05E6\05E8 \05DE\05D5\05E4\05E2 \05D7\05D3\05E9 %0 \05E9\05DC \05EA\05D4\05DC\05D9\05DA \05E2\05D1\05D5\05D3\05D4 %1, \05D2\05E8\05E1\05D4 %2')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139055267921751328)
,p_name=>'APEX.WORKFLOW.DATA_NOT_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D5\05E8\05EA \05E0\05EA\05D5\05E0\05D9\05DD \05E0\05D5\05E1\05E4\05EA \05D4\05DE\05E9\05D5\05D9\05DB\05EA \05DC\05DE\05D5\05E4\05E2 \05EA\05D4\05DC\05D9\05DA \05E2\05D1\05D5\05D3\05D4 \05D6\05D4 \05DC\05D0 \05E0\05DE\05E6\05D0\05D4')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139077703098751335)
,p_name=>'APEX.WORKFLOW.DUE_SINCE'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D0\05E8\05D9\05DA \05D9\05E2\05D3: %0')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139063016898751331)
,p_name=>'APEX.WORKFLOW.END'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D4\05DC\05D9\05DA \05D4\05E2\05D1\05D5\05D3\05D4 %0 \05D4\05E1\05EA\05D9\05D9\05DE\05D4 \05D1\05DE\05E6\05D1 %1')
,p_version_scn=>2704855
);
end;
/
begin
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139060252554751330)
,p_name=>'APEX.WORKFLOW.INCOMPATIBLE_DATA_TYPE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D5\05D2 \05D4\05E0\05EA\05D5\05E0\05D9\05DD %1 \05DC\05EA\05E0\05D0\05D9\05DD \05E9\05DE\05E9\05D5\05D5\05D9\05DD \05D1\05E4\05E2\05D9\05DC\05D5\05EA \05D4\05DE\05E4\05E1\05E7 \05E9\05DC \05EA\05D4\05DC\05D9\05DA \05D4\05E2\05D1\05D5\05D3\05D4 %0 \05D0\05D9\05E0\05D5 \05EA\05D5\05D0\05DD \05DC\05D0\05D5\05E4\05E8\05D8\05D5\05E8 \05D4\05EA\05E0\05D0\05D9')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139050003360751327)
,p_name=>'APEX.WORKFLOW.INITIATED_BY_USER_SINCE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DD \05D4\05D9\05D5\05D6\05DD: %0 %1')
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139072825539751334)
,p_name=>'APEX.WORKFLOW.INVOKED'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05D5\05E6\05E8 \05DE\05D5\05E4\05E2 \05D7\05D3\05E9 %0 \05E9\05DC \05EA\05D4\05DC\05D9\05DA \05E2\05D1\05D5\05D3\05D4 %1, \05D2\05E8\05E1\05D4 %2 - \05D4\05D5\05E4\05E2\05DC \05DE\05DE\05D5\05E4\05E2 \05E4\05E2\05D9\05DC\05D5\05EA %4 \05E9\05DC \05DE\05D5\05E4\05E2 \05EA\05D4\05DC\05D9\05DA \05E2\05D1\05D5\05D3\05D4 %3')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139045694880751325)
,p_name=>'APEX.WORKFLOW.NO_ACTIVITY_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05E2\05D9\05DC\05D5\05EA \05E2\05DD \05DE\05D6\05D4\05D4 \05E1\05D8\05D8\05D9 %1 \05D0\05D9\05E0\05D4 \05E4\05E2\05D9\05DC\05D5\05EA \05D1\05EA\05D4\05DC\05D9\05DA \05D4\05E2\05D1\05D5\05D3\05D4 %0. \05D1\05D3\05D5\05E7 \05D0\05EA \05D4\05DE\05D6\05D4\05D9\05DD \05D4\05E1\05D8\05D8\05D9\05D9\05DD \05E9\05DC \05D4\05E4\05E2\05D9\05DC\05D5\05EA \05E9\05DC \05D2\05E8\05E1\05EA \05EA\05D4\05DC\05D9\05DA \05D4\05E2\05D1\05D5\05D3\05D4 \05D4\05DE\05EA\05D0\05D9\05DE\05D4.')
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139070994919751333)
,p_name=>'APEX.WORKFLOW.REQUIRED_PARAM_MISSING'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D4\05D5\05D0 \05E4\05E8\05DE\05D8\05E8 \05E0\05D3\05E8\05E9 \05DC\05EA\05D4\05DC\05D9\05DA \05E2\05D1\05D5\05D3\05D4 \05D6\05D4 \05D5\05D0\05E1\05D5\05E8 \05DC\05D5 \05DC\05D4\05D9\05D5\05EA NULL.')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139063508304751331)
,p_name=>'APEX.WORKFLOW.RESUMED'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D5\05E4\05E2 \05EA\05D4\05DC\05D9\05DA \05E2\05D1\05D5\05D3\05D4 %0 \05D7\05D5\05D3\05E9')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139063433050751331)
,p_name=>'APEX.WORKFLOW.RETRIED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D5\05E6\05E2 \05E0\05D9\05E1\05D9\05D5\05DF \05D7\05D5\05D6\05E8 \05E9\05DC \05DE\05D5\05E4\05E2 \05EA\05D4\05DC\05D9\05DA \05E2\05D1\05D5\05D3\05D4 %0 ')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139077868611751335)
,p_name=>'APEX.WORKFLOW.RETRY_COUNT.EQUALS_ONE'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05E0\05D9\05E1\05D9\05D5\05DF \05D7\05D5\05D6\05E8')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139077909875751335)
,p_name=>'APEX.WORKFLOW.RETRY_COUNT.NOT_EQUALS_ONE'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05E0\05D9\05E1\05D9\05D5\05E0\05D5\05EA \05D7\05D5\05D6\05E8\05D9\05DD')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139077602581751335)
,p_name=>'APEX.WORKFLOW.STARTED_SINCE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05EA\05D7\05D9\05DC: %0')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139071821779751333)
,p_name=>'APEX.WORKFLOW.STATE.ACTIVE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05E2\05D9\05DC')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139072058379751333)
,p_name=>'APEX.WORKFLOW.STATE.COMPLETED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05E9\05DC\05DD')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139072173205751333)
,p_name=>'APEX.WORKFLOW.STATE.FAULTED'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D5\05D9')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139072210946751333)
,p_name=>'APEX.WORKFLOW.STATE.SUSPENDED'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D5\05E9\05D4\05D4')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139071937611751333)
,p_name=>'APEX.WORKFLOW.STATE.TERMINATED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05EA\05D9\05D9\05DD')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139087277447751338)
,p_name=>'APEX.WORKFLOW.STATE.WAITING'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D4\05DE\05EA\05E0\05D4')
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139063284653751331)
,p_name=>'APEX.WORKFLOW.SUSPENDED'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D5\05E4\05E2 \05EA\05D4\05DC\05D9\05DA \05E2\05D1\05D5\05D3\05D4 %0 \05D4\05D5\05E9\05D4\05D4')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139069147046751332)
,p_name=>'APEX.WORKFLOW.SWITCH.BRANCH_NOT_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05D9\05EA\05DF \05DC\05E7\05D1\05D5\05E2 \05D0\05EA \05D4\05E4\05E2\05D9\05DC\05D5\05EA \05D4\05D1\05D0\05D4 \05DC\05DE\05D5\05E4\05E2 \05EA\05D4\05DC\05D9\05DA \05E2\05D1\05D5\05D3\05D4 %0. \05D0\05DE\05EA \05D5\05EA\05E7\05DF \05D0\05EA \05D4\05EA\05E0\05D0\05D9\05DD \05E9\05D4\05D5\05D2\05D3\05E8\05D5 \05DC\05E4\05E2\05D9\05DC\05D5\05EA \05D4\05DE\05EA\05D2 \05D4\05E0\05D5\05DB\05D7\05D9\05EA \05DC\05E4\05E0\05D9 \05E0\05D9\05E1\05D9\05D5\05DF \05D7\05D5\05D6\05E8 \05E9\05DC \05EA\05D4\05DC\05D9\05DA \05D4\05E2\05D1\05D5\05D3\05D4.')
,p_version_scn=>2704858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139063371020751331)
,p_name=>'APEX.WORKFLOW.TERMINATED'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D5\05E4\05E2 \05EA\05D4\05DC\05D9\05DA \05E2\05D1\05D5\05D3\05D4 %0 \05D4\05E1\05EA\05D9\05D9\05DD')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139062430238751330)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_RESUME'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05E7 \05DE\05E0\05D4\05DC\05DF \05E2\05E1\05E7\05D9 \05E9\05DC \05EA\05D4\05DC\05D9\05DA \05D4\05E2\05D1\05D5\05D3\05D4 %0 \05D9\05DB\05D5\05DC \05DC\05D7\05D3\05E9 \05D0\05EA \05EA\05D4\05DC\05D9\05DA \05D4\05E2\05D1\05D5\05D3\05D4')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139062571105751330)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_RETRY'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05E7 \05DE\05E0\05D4\05DC\05DF \05E2\05E1\05E7\05D9 \05D5/\05D0\05D5 \05D1\05E2\05DC\05D9\05DD \05D9\05DB\05D5\05DC \05DC\05D1\05E6\05E2 \05E0\05D9\05E1\05D9\05D5\05DF \05D7\05D5\05D6\05E8 \05E9\05DC \05EA\05D4\05DC\05D9\05DA \05D4\05E2\05D1\05D5\05D3\05D4 %0')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139062085013751330)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_SUSPEND'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05E7 \05E2\05DC-\05D9\05D3\05D9 \05DE\05E0\05D4\05DC\05DF \05E2\05E1\05E7\05D9 \05E9\05DC \05EA\05D4\05DC\05D9\05DA \05D4\05E2\05D1\05D5\05D3\05D4 \05D9\05DB\05D5\05DC \05DC\05D4\05E9\05D4\05D5\05EA \05D0\05EA \05DE\05D5\05E4\05E2 \05EA\05D4\05DC\05D9\05DA \05D4\05E2\05D1\05D5\05D3\05D4 %0')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139062393280751330)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_TERMINATE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05E7 \05D1\05E2\05DC\05D9\05DD \05D5\05DE\05E0\05D4\05DC\05DF \05E2\05E1\05E7\05D9 \05E9\05DC \05DE\05D5\05E4\05E2 \05EA\05D4\05DC\05D9\05DA \05E2\05D1\05D5\05D3\05D4 %0 \05D9\05DB\05D5\05DC\05D9\05DD \05DC\05E1\05D9\05D9\05DD \05D0\05EA \05EA\05D4\05DC\05D9\05DA \05D4\05E2\05D1\05D5\05D3\05D4')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139060754105751330)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_UPDATE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05E7 \05E2\05DC-\05D9\05D3\05D9 \05DE\05E0\05D4\05DC\05DF \05E2\05E1\05E7\05D9 \05E9\05DC \05EA\05D4\05DC\05D9\05DA \05D4\05E2\05D1\05D5\05D3\05D4 \05D9\05DB\05D5\05DC \05DC\05E2\05D3\05DB\05DF \05DE\05E9\05EA\05E0\05D9\05DD \05E9\05DC \05EA\05D4\05DC\05D9\05DA \05E2\05D1\05D5\05D3\05D4 %0')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139075377528751334)
,p_name=>'APEX.WORKFLOW.UPDATE,NOT_ALLOWED'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D5\05E4\05E2 \05EA\05D4\05DC\05D9\05DA \05D4\05E2\05D1\05D5\05D3\05D4 %0 \05D7\05D9\05D9\05D1 \05DC\05D4\05D9\05D5\05EA \05D1\05DE\05E6\05D1 \05E4\05D2\05D5\05DD \05D0\05D5 \05DE\05D5\05E9\05D4\05D4 \05DC\05E4\05E0\05D9 \05E9\05E0\05D9\05EA\05DF \05D9\05D4\05D9\05D4 \05DC\05E2\05D3\05DB\05DF \05D0\05EA \05D4\05DE\05E9\05EA\05E0\05D9\05DD \05E9\05DC\05D5.')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139066849985751332)
,p_name=>'APEX.WORKFLOW.UPDATED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E2\05E8\05DA \05E9\05DC \05DE\05E9\05EA\05E0\05D4 \05EA\05D4\05DC\05D9\05DA \05D4\05E2\05D1\05D5\05D3\05D4 %0 \05E2\05D5\05D3\05DB\05DF \05DC-%1')
,p_version_scn=>2704858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139077000406751335)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_ACTIVE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05EA\05D4\05DC\05D9\05DA \05D4\05E2\05D1\05D5\05D3\05D4 %0 \05D0\05D9\05DF \05D2\05E8\05E1\05D4 \05E4\05E2\05D9\05DC\05D4')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139077124410751335)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_DEV'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05EA\05D4\05DC\05D9\05DA \05D4\05E2\05D1\05D5\05D3\05D4 %0 \05D0\05D9\05DF \05D2\05E8\05E1\05EA \05E4\05D9\05EA\05D5\05D7')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139077295069751335)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05EA\05D4\05DC\05D9\05DA \05D4\05E2\05D1\05D5\05D3\05D4 %0 \05D0\05D9\05DF  \05D2\05E8\05E1\05D4 \05E4\05E2\05D9\05DC\05D4 \05D0\05D5 \05D2\05E8\05E1\05EA \05E4\05D9\05EA\05D5\05D7')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139060169537751330)
,p_name=>'APEX.WORKFLOW.WORKFLOW_ACT_INSTANCE_NOT_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D5\05E4\05E2 \05E4\05E2\05D9\05DC\05D5\05EA %1 \05DC\05DE\05D5\05E4\05E2 \05EA\05D4\05DC\05D9\05DA \05E2\05D1\05D5\05D3\05D4 %0 \05DC\05D0 \05E0\05DE\05E6\05D0')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139059907638751330)
,p_name=>'APEX.WORKFLOW.WORKFLOW_INSTANCE_NOT_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D5\05E4\05E2 \05EA\05D4\05DC\05D9\05DA \05E2\05D1\05D5\05D3\05D4 %0 \05DC\05D0 \05E0\05DE\05E6\05D0')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139095054297751340)
,p_name=>'APEX.XLSX.ERROR.NO_ACTIVE_WORKSHEET'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D7\05D5\05D1\05E8\05EA \05D4\05E2\05D1\05D5\05D3\05D4  \05D0\05D9\05DF \05D2\05D9\05DC\05D9\05D5\05DF \05E2\05D1\05D5\05D3\05D4 \05E4\05E2\05D9\05DC.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139094944535751340)
,p_name=>'APEX.XLSX.ERROR.WORKBOOK_NOT_INITIALIZED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D5\05D1\05E8\05EA \05D4\05E2\05D1\05D5\05D3\05D4 \05DC\05D0 \05D0\05D5\05EA\05D7\05DC\05D4.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139094848013751340)
,p_name=>'APEX.XLSX.INTERNAL_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E8\05E2\05D4 \05E9\05D2\05D9\05D0\05D4 \05E4\05E0\05D9\05DE\05D9\05EA \05D1\05E2\05EA \05D9\05E6\05D9\05E8\05EA \05E7\05D5\05D1\05E5 XLSX.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139097362303751341)
,p_name=>'APEX.XLSX.SHEET'
,p_message_language=>'he'
,p_message_text=>unistr('\05D2\05D9\05DC\05D9\05D5\05DF')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139107999227751344)
,p_name=>'APEX.XLSX.SHEET_NAME_TAKEN'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DD \05D2\05D9\05DC\05D9\05D5\05DF \05D4\05E2\05D1\05D5\05D3\05D4 "%0" \05DB\05D1\05E8 \05D1\05E9\05D9\05DE\05D5\05E9. \05E0\05E1\05D4 \05E9\05DD \05D0\05D7\05E8.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139236571562751382)
,p_name=>'APEXIR_ACTIONS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05E2\05D5\05DC\05D5\05EA')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139151542568751357)
,p_name=>'APEXIR_ACTIONS_MENU'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05E4\05E8\05D9\05D8 \05E4\05E2\05D5\05DC\05D5\05EA')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139147276478751356)
,p_name=>'APEXIR_ADD_FUNCTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05E1\05E3 \05E4\05D5\05E0\05E7\05E6\05D9\05D4')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139147192907751356)
,p_name=>'APEXIR_ADD_GROUP_BY_COLUMN'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05E1\05E3 \05E2\05DE\05D5\05D3\05EA ''\05E7\05D1\05E5 \05DC\05E4\05D9''')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139184767418751367)
,p_name=>'APEXIR_ADD_PIVOT_COLUMN'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05E1\05E3 \05E2\05DE\05D5\05D3\05EA \05E6\05D9\05E8')
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139184839728751367)
,p_name=>'APEXIR_ADD_ROW_COLUMN'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05E1\05E3 \05E2\05DE\05D5\05D3\05EA \05E9\05D5\05E8\05D4')
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139119299244751347)
,p_name=>'APEXIR_AGGREGATE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05DB\05D9\05DE\05D4')
,p_is_js_message=>true
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139157708530751359)
,p_name=>'APEXIR_AGGREGATION'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05DB\05D9\05DE\05D4')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139138697849751353)
,p_name=>'APEXIR_AGG_AVG'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05DE\05D5\05E6\05E2')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139142987310751354)
,p_name=>'APEXIR_AGG_COUNT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05E4\05D9\05E8\05D4')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139138757797751353)
,p_name=>'APEXIR_AGG_MAX'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E8\05D1\05D9')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139138987857751353)
,p_name=>'APEXIR_AGG_MEDIAN'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05E6\05D9\05D5\05DF')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139138876362751353)
,p_name=>'APEXIR_AGG_MIN'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D6\05E2\05E8\05D9')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139138570794751353)
,p_name=>'APEXIR_AGG_SUM'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05DB\05D5\05DD %0')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139139677804751353)
,p_name=>'APEXIR_ALL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05DB\05DC')
,p_is_js_message=>true
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139118593209751347)
,p_name=>'APEXIR_ALL_COLUMNS'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05DC \05D4\05E2\05DE\05D5\05D3\05D5\05EA')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139098626538751341)
,p_name=>'APEXIR_ALL_ROWS'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05DC \05D4\05E9\05D5\05E8\05D5\05EA')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139233529856751381)
,p_name=>'APEXIR_ALTERNATIVE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05DC\05D5\05E4\05D9')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139235144202751382)
,p_name=>'APEXIR_ALTERNATIVE_DEFAULT_NAME'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05E8\05D9\05E8\05EA \05DE\05D7\05D3\05DC \05D7\05DC\05D5\05E4\05D9\05EA: %0')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139132750532751351)
,p_name=>'APEXIR_AND'
,p_message_language=>'he'
,p_message_text=>unistr('\05D5\05D2\05DD')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139167505997751362)
,p_name=>'APEXIR_API.IMPORT_CONTENT_CORRUPTED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05D9\05D9\05D1\05D0 \05D0\05EA \05D4\05D3\05D5\05D7 \05E9\05E0\05E9\05DE\05E8. \05D4\05EA\05D5\05DB\05DF \05E4\05D2\05D5\05DD.')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139167634753751362)
,p_name=>'APEXIR_API.IMPORT_CONTENT_EMPTY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05D9\05D9\05D1\05D0 \05D0\05EA \05D4\05D3\05D5\05D7 \05E9\05E0\05E9\05DE\05E8. \05D4\05EA\05D5\05DB\05DF \05E8\05D9\05E7.')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139120730348751348)
,p_name=>'APEXIR_APPLY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D7\05DC')
,p_is_js_message=>true
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139114377104751346)
,p_name=>'APEXIR_ASCENDING'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05E1\05D3\05E8 \05E2\05D5\05DC\05D4')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139135868267751352)
,p_name=>'APEXIR_AS_OF'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05DB\05D5\05DF \05DC-%0')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139235750989751382)
,p_name=>'APEXIR_AVERAGE_X'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05DE\05D5\05E6\05E2 %0')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139227338549751379)
,p_name=>'APEXIR_BAR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DE\05D5\05D3\05D4 ')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139120064970751348)
,p_name=>'APEXIR_BETWEEN'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D9\05DF')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139113194134751346)
,p_name=>'APEXIR_BGCOLOR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E6\05D1\05E2 \05E8\05E7\05E2')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139115069418751346)
,p_name=>'APEXIR_BLUE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D7\05D5\05DC')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139149180773751356)
,p_name=>'APEXIR_BOTTOM'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D7\05EA\05D5\05DF')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139079965684751336)
,p_name=>'APEXIR_BTNS_NEXT_TO_SEARCH_OF'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D7\05E6\05E0\05D9\05DD \05DC\05D9\05D3 \05E1\05E8\05D2\05DC \05D4\05D7\05D9\05E4\05D5\05E9 \05E9\05DC %0')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139115688339751346)
,p_name=>'APEXIR_CANCEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D8\05DC')
,p_is_js_message=>true
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139121939176751348)
,p_name=>'APEXIR_CATEGORY'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D8\05D2\05D5\05E8\05D9\05D4')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139113055308751346)
,p_name=>'APEXIR_CELL'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D0')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139139514698751353)
,p_name=>'APEXIR_CHART'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05E8\05E9\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139150009369751357)
,p_name=>'APEXIR_CHART_INITIALIZING'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D0\05EA\05D7\05DC...')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139189784125751368)
,p_name=>'APEXIR_CHART_LABEL_NOT_NULL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D5\05D1\05D4 \05DC\05E6\05D9\05D9\05DF \05EA\05D5\05D5\05D9\05EA \05EA\05E8\05E9\05D9\05DD.')
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139202105779751372)
,p_name=>'APEXIR_CHART_MAX_DATAPOINT_CNT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E9\05D0\05D9\05DC\05EA\05D0 \05D7\05D5\05E8\05D2\05EA \05DE\05D4\05DE\05E1\05E4\05E8 \05D4\05DE\05E8\05D1\05D9 \05E9\05DC %0 \05E0\05E7\05D5\05D3\05D5\05EA \05E0\05EA\05D5\05E0\05D9\05DD \05DC\05DB\05DC \05EA\05E8\05E9\05D9\05DD. \05D4\05D7\05DC \05DE\05E1\05E0\05DF \05DB\05D3\05D9 \05DC\05E6\05DE\05E6\05DD \05D0\05EA \05DE\05E1\05E4\05E8 \05D4\05E8\05E9\05D5\05DE\05D5\05EA \05D1\05E9\05D0\05D9\05DC\05EA\05EA \05D4\05D1\05E1\05D9\05E1 \05E9\05DC\05DA.')
,p_version_scn=>2704881
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139201078374751372)
,p_name=>'APEXIR_CHART_MAX_ROW_CNT'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E1\05E4\05E8 \05D4\05E9\05D5\05E8\05D5\05EA \05D4\05DE\05E8\05D1\05D9 \05DC\05E9\05D0\05D9\05DC\05EA\05EA \05EA\05E8\05E9\05D9\05DD \05DE\05D2\05D1\05D9\05DC \05D0\05EA \05DE\05E1\05E4\05E8 \05D4\05E9\05D5\05E8\05D5\05EA \05D1\05E9\05D0\05D9\05DC\05EA\05EA \05D4\05D1\05E1\05D9\05E1, \05D5\05DC\05D0 \05D0\05EA \05DE\05E1\05E4\05E8 \05D4\05E9\05D5\05E8\05D5\05EA \05D4\05DE\05D5\05E6\05D2\05D5\05EA. \05E9\05D0\05D9\05DC\05EA\05EA \05D4\05D1\05E1\05D9\05E1 \05D7\05D5\05E8\05D2\05EA \05DE\05DE\05E1\05E4\05E8 \05D4\05E9\05D5\05E8\05D5\05EA \05D4\05DE\05E8\05D1\05D9 \05E9\05DC %0. \05D4\05D7\05DC \05DE\05E1\05E0\05DF \05DB\05D3\05D9 \05DC\05E6\05DE\05E6\05DD \05D0\05EA \05DE\05E1\05E4\05E8 \05D4\05E8\05E9\05D5\05DE\05D5\05EA \05D1\05E9\05D0\05D9\05DC\05EA\05EA \05D4\05D1\05E1\05D9\05E1 \05E9\05DC\05DA.')
,p_version_scn=>2704881
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139118655268751347)
,p_name=>'APEXIR_CHART_TYPE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D5\05D2 \05EA\05E8\05E9\05D9\05DD')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139082502919751336)
,p_name=>'APEXIR_CHART_VIEW_OF'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05E6\05D5\05D2\05EA \05EA\05E8\05E9\05D9\05DD \05E9\05DC %0')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139197763309751371)
,p_name=>'APEXIR_CHECK_ALL'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05DE\05DF \05D4\05DB\05DC')
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139136232057751352)
,p_name=>'APEXIR_CHOOSE_DOWNLOAD_FORMAT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05E8 \05E4\05D5\05E8\05DE\05D8 \05D3\05D5\05D7')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139144021662751355)
,p_name=>'APEXIR_CLEAR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05E7\05D4')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139115531666751346)
,p_name=>'APEXIR_COLUMN'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DE\05D5\05D3\05D4')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139155315270751358)
,p_name=>'APEXIR_COLUMNS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DE\05D5\05D3\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139122504477751348)
,p_name=>'APEXIR_COLUMN_ALIASES'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D9\05E0\05D5\05D9\05D9 \05E2\05DE\05D5\05D3\05D4')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139230145974751380)
,p_name=>'APEXIR_COLUMN_FILTER'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E1\05E0\05DF...')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139090398457751339)
,p_name=>'APEXIR_COLUMN_HEADER'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D5\05EA\05E8\05EA \05E2\05DE\05D5\05D3\05D4')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139104439833751343)
,p_name=>'APEXIR_COLUMN_HEADER_ACTIONS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05E2\05D5\05DC\05D5\05EA \05E2\05DE\05D5\05D3\05D4')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139104756711751343)
,p_name=>'APEXIR_COLUMN_HEADER_ACTIONS_FOR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05E2\05D5\05DC\05D5\05EA \05DC\05E2\05DE\05D5\05D3\05D4 "%0"')
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139146189590751355)
,p_name=>'APEXIR_COLUMN_HEADING_MENU'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05E4\05E8\05D9\05D8 \05DB\05D5\05EA\05E8\05EA \05E2\05DE\05D5\05D3\05D4')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139149874956751356)
,p_name=>'APEXIR_COLUMN_INFO'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05E8\05D8\05D9 \05E2\05DE\05D5\05D3\05D4')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139232471089751381)
,p_name=>'APEXIR_COLUMN_LABEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D5\05D5\05D9\05EA \05E2\05DE\05D5\05D3\05D4')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139147587743751356)
,p_name=>'APEXIR_COLUMN_N'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DE\05D5\05D3\05D4 %0')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139130465682751351)
,p_name=>'APEXIR_COMPARISON_CONTAINS'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05DB\05D9\05DC')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139131723212751351)
,p_name=>'APEXIR_COMPARISON_DOESNOT_CONTAIN'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E0\05D5 \05DE\05DB\05D9\05DC')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139114065046751346)
,p_name=>'APEXIR_COMPARISON_IN'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1-')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139131992553751351)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_LAST'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05D1\05D0\05D7\05E8\05D5\05E0\05D5\05EA/\05D1\05D0\05D7\05E8\05D5\05E0\05D9\05DD')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139141045635751354)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_NEXT'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05D1\05D1\05D0\05D5\05EA/\05D1\05D1\05D0\05D9\05DD')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139131857742751351)
,p_name=>'APEXIR_COMPARISON_IS_IN_LAST'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D0\05D7\05E8\05D5\05E0\05D5\05EA/\05D1\05D0\05D7\05E8\05D5\05E0\05D9\05DD')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139140980279751354)
,p_name=>'APEXIR_COMPARISON_IS_IN_NEXT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D1\05D0\05D5\05EA/\05D1\05D1\05D0\05D9\05DD')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139113925931751346)
,p_name=>'APEXIR_COMPARISON_IS_NOT_NULL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E0\05D5 null')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139113890356751346)
,p_name=>'APEXIR_COMPARISON_IS_NULL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05D0 null')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139113634338751346)
,p_name=>'APEXIR_COMPARISON_LIKE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05DE\05D5')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139114184411751346)
,p_name=>'APEXIR_COMPARISON_NOT_IN'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E0\05D5 \05D1-')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139113784509751346)
,p_name=>'APEXIR_COMPARISON_NOT_LIKE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05DB\05DE\05D5')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139130717769751351)
,p_name=>'APEXIR_COMPARISON_REGEXP_LIKE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05EA\05D0\05D9\05DD \05DC-Regular Expression')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139136167668751352)
,p_name=>'APEXIR_COMPUTATION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D9\05E9\05D5\05D1')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139200797714751372)
,p_name=>'APEXIR_COMPUTATION_EXPRESSION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D9\05D8\05D5\05D9 \05D7\05D9\05E9\05D5\05D1\05D9')
,p_version_scn=>2704881
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139155653130751358)
,p_name=>'APEXIR_COMPUTATION_FOOTER'
,p_message_language=>'he'
,p_message_text=>unistr('\05E6\05D5\05E8 \05D7\05D9\05E9\05D5\05D1 \05D1\05D0\05DE\05E6\05E2\05D5\05EA \05DB\05D9\05E0\05D5\05D9\05D9 \05E2\05DE\05D5\05D3\05D4.')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139155719184751358)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E1'
,p_message_language=>'he'
,p_message_text=>'(B+C)*100'
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139155814020751358)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E2'
,p_message_language=>'he'
,p_message_text=>'INITCAP(B)||'', ''||INITCAP(C)'
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139155957340751358)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E3'
,p_message_language=>'he'
,p_message_text=>'CASE WHEN A = 10 THEN B + C ELSE B END'
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139096807193751341)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E4'
,p_message_language=>'he'
,p_message_text=>'ROUND(C / 1000000)'
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139140377902751354)
,p_name=>'APEXIR_COMPUTE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05E9\05D1')
,p_is_js_message=>true
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139148175959751356)
,p_name=>'APEXIR_CONTROL_BREAK'
,p_message_language=>'he'
,p_message_text=>'Control Break'
,p_is_js_message=>true
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139151158876751357)
,p_name=>'APEXIR_CONTROL_BREAKS'
,p_message_language=>'he'
,p_message_text=>'Control Breaks'
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139237712259751383)
,p_name=>'APEXIR_CONTROL_BREAK_COLUMNS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DE\05D5\05D3\05D5\05EA Control Break')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139093511081751340)
,p_name=>'APEXIR_COUNT_DISTINCT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05E4\05D9\05E8\05EA \05E0\05D1\05D3\05DC\05D9\05DD')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139236281426751382)
,p_name=>'APEXIR_COUNT_DISTINCT_X'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05E4\05D9\05E8\05EA \05E0\05D1\05D3\05DC\05D9\05DD')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139236185075751382)
,p_name=>'APEXIR_COUNT_X'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05E4\05D9\05E8\05D4 %0')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139209192267751374)
,p_name=>'APEXIR_DAILY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05D5\05DE\05D9')
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139262451038751390)
,p_name=>'APEXIR_DATA'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05EA\05D5\05E0\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139149999120751357)
,p_name=>'APEXIR_DATA_AS_OF'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05EA\05D5\05E0\05D9 \05D4\05D3\05D5\05D7 \05E0\05DB\05D5\05DF \05DC\05DC\05E4\05E0\05D9 %0 \05D3\05E7\05D5\05EA.')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139082965067751337)
,p_name=>'APEXIR_DATA_VIEW_OF'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05E6\05D5\05D2\05EA \05E0\05EA\05D5\05E0\05D9\05DD \05E9\05DC %0')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139119382228751347)
,p_name=>'APEXIR_DATE'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D0\05E8\05D9\05DA')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139153876985751358)
,p_name=>'APEXIR_DEFAULT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05E8\05D9\05E8\05EA \05DE\05D7\05D3\05DC')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139233394651751381)
,p_name=>'APEXIR_DEFAULT_REPORT_TYPE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05E8\05D9\05E8\05EA \05DE\05D7\05D3\05DC \05E9\05DC \05E1\05D5\05D2 \05D3\05D5\05D7')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139115711771751346)
,p_name=>'APEXIR_DELETE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D7\05E7')
,p_is_js_message=>true
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139119621626751348)
,p_name=>'APEXIR_DELETE_CONFIRM'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D0\05DD \05EA\05E8\05E6\05D4 \05DC\05DE\05D7\05D5\05E7 \05D4\05D2\05D3\05E8\05D5\05EA \05D3\05D5\05D7 \05D0\05DC\05D5?')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139220104496751377)
,p_name=>'APEXIR_DELETE_DEFAULT_REPORT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D0\05DD \05DC\05DE\05D7\05D5\05E7 \05D0\05EA \05D1\05E8\05D9\05E8\05EA \05D4\05DE\05D7\05D3\05DC \05E9\05DC \05D3\05D5\05D7?')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139147888966751356)
,p_name=>'APEXIR_DELETE_REPORT'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D7\05E7 \05D3\05D5\05D7')
,p_is_js_message=>true
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139114449375751346)
,p_name=>'APEXIR_DESCENDING'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05E1\05D3\05E8 \05D9\05D5\05E8\05D3')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139122065331751348)
,p_name=>'APEXIR_DESCRIPTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D9\05D0\05D5\05E8')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139146053007751355)
,p_name=>'APEXIR_DETAIL_VIEW'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05E6\05D5\05D2\05EA \05E9\05D5\05E8\05D4 \05D1\05D5\05D3\05D3\05EA')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139154357705751358)
,p_name=>'APEXIR_DIRECTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D9\05D5\05D5\05DF %0')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139155238613751358)
,p_name=>'APEXIR_DISABLED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05E1\05D5\05DD')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139115272143751346)
,p_name=>'APEXIR_DISPLAYED'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D5\05E6\05D2')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139118472754751347)
,p_name=>'APEXIR_DISPLAYED_COLUMNS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DE\05D5\05D3\05D5\05EA \05DE\05D5\05E6\05D2\05D5\05EA')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139154298710751358)
,p_name=>'APEXIR_DISPLAY_IN_REPORT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E6\05D2 \05D1\05D3\05D5\05D7')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139149066430751356)
,p_name=>'APEXIR_DOWN'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05DE\05D8\05D4')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139140440376751354)
,p_name=>'APEXIR_DOWNLOAD'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05E8\05D3')
,p_is_js_message=>true
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139154177517751358)
,p_name=>'APEXIR_DO_NOT_DISPLAY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05DF \05DC\05D4\05E6\05D9\05D2')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139223474123751378)
,p_name=>'APEXIR_DUPLICATE_HIGHLIGHT_COND'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D1\05E8 \05E7\05D9\05D9\05DE\05EA \05D4\05D3\05D2\05E9\05D4 \05E2\05DD \05D0\05D5\05EA\05D5 \05D4\05EA\05E0\05D0\05D9.')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139237923927751383)
,p_name=>'APEXIR_DUPLICATE_PIVOT_COLUMN'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DE\05D5\05D3\05EA \05E6\05D9\05E8 \05DB\05E4\05D5\05DC\05D4. \05E8\05E9\05D9\05DE\05EA \05E2\05DE\05D5\05D3\05D5\05EA \05D4\05E6\05D9\05E8 \05D7\05D9\05D9\05D1\05EA \05DC\05D4\05D9\05D5\05EA \05D9\05D9\05D7\05D5\05D3\05D9\05EA.')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139238104683751383)
,p_name=>'APEXIR_EDIT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E8\05D5\05DA')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139150100928751357)
,p_name=>'APEXIR_EDIT_CHART'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E8\05D5\05DA \05D4\05D2\05D3\05E8\05D5\05EA \05EA\05E8\05E9\05D9\05DD')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139156728976751359)
,p_name=>'APEXIR_EDIT_CHART2'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E8\05D5\05DA \05EA\05E8\05E9\05D9\05DD')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139120665387751348)
,p_name=>'APEXIR_EDIT_CONTROL_BREAK'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E8\05D5\05DA \05D0\05EA Control Break')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139157182529751359)
,p_name=>'APEXIR_EDIT_FILTER'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E8\05D5\05DA \05DE\05E1\05E0\05DF')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139123672351751349)
,p_name=>'APEXIR_EDIT_FLASHBACK'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E8\05D5\05DA \05D0\05EA Flashback')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139214916904751376)
,p_name=>'APEXIR_EDIT_GROUP_BY'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E8\05D5\05DA \05E7\05D1\05D5\05E6\05D4 \05DC\05E4\05D9')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139157011196751359)
,p_name=>'APEXIR_EDIT_HIGHLIGHT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E8\05D5\05DA \05D4\05D3\05D2\05E9\05D4')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139185071208751367)
,p_name=>'APEXIR_EDIT_PIVOT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E8\05D5\05DA \05E6\05D9\05E8')
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139144470042751355)
,p_name=>'APEXIR_EDIT_REPORT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E8\05D5\05DA \05D3\05D5\05D7')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139233687781751381)
,p_name=>'APEXIR_EMAIL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05D5\05D0"\05DC')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139105852355751343)
,p_name=>'APEXIR_EMAIL_ADDRESS'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05EA\05D5\05D1\05EA \05D3\05D5\05D0"\05DC')
,p_version_scn=>2704865
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139233984279751381)
,p_name=>'APEXIR_EMAIL_BCC'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D5\05EA\05E7 \05E0\05E1\05EA\05E8')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139234127854751381)
,p_name=>'APEXIR_EMAIL_BODY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D2\05D5\05E3')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139233876657751381)
,p_name=>'APEXIR_EMAIL_CC'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D5\05EA\05E7')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139234653067751382)
,p_name=>'APEXIR_EMAIL_FREQUENCY'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D3\05D9\05E8\05D5\05EA')
,p_version_scn=>2704889
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139111033454751345)
,p_name=>'APEXIR_EMAIL_NOT_CONFIGURED'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05E6\05D5\05E8\05EA \05D4\05D3\05D5\05D0"\05DC \05DC\05D0 \05D4\05D5\05D2\05D3\05E8\05D4 \05DC\05D9\05D9\05E9\05D5\05DD \05D6\05D4. \05E4\05E0\05D4 \05DC\05DE\05E0\05D4\05DC\05DF \05D4\05DE\05E2\05E8\05DB\05EA.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139208472467751374)
,p_name=>'APEXIR_EMAIL_REQUIRED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D5\05D1\05D4 \05DC\05E6\05D9\05D9\05DF \05DB\05EA\05D5\05D1\05EA \05D3\05D5\05D0"\05DC.')
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139234210975751382)
,p_name=>'APEXIR_EMAIL_SEE_ATTACHED'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D9\05D9\05DF \05D1\05DE\05E1\05DE\05DA \05D4\05DE\05E6\05D5\05E8\05E3')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139234095307751381)
,p_name=>'APEXIR_EMAIL_SUBJECT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E0\05D5\05E9\05D0')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139209482206751374)
,p_name=>'APEXIR_EMAIL_SUBJECT_REQUIRED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D5\05D1\05D4 \05DC\05E6\05D9\05D9\05DF \05E0\05D5\05E9\05D0 \05D4\05D3\05D5\05D0"\05DC.')
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139233727308751381)
,p_name=>'APEXIR_EMAIL_TO'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05DC')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139112815069751346)
,p_name=>'APEXIR_ENABLED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05E4\05E9\05E8\05D9')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139156928054751359)
,p_name=>'APEXIR_ENABLE_DISABLE_ALT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05E4\05E9\05E8/\05D1\05D8\05DC \05D0\05E4\05E9\05D5\05E8')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139156423734751358)
,p_name=>'APEXIR_ERROR_LANDMARK'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4! %0')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139156056107751358)
,p_name=>'APEXIR_EXAMPLES'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05D5\05D2\05DE\05D0\05D5\05EA')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139156847657751359)
,p_name=>'APEXIR_EXAMPLES_WITH_COLON'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05D5\05D2\05DE\05D0\05D5\05EA:')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139118308688751347)
,p_name=>'APEXIR_EXCLUDE_NULL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05DF \05DC\05DB\05DC\05D5\05DC \05E2\05E8\05DB\05D9 Null')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139157485524751359)
,p_name=>'APEXIR_EXPAND_COLLAPSE_ALT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E8\05D7\05D1/\05DB\05D5\05D5\05E5')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139155023688751358)
,p_name=>'APEXIR_EXPRESSION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D9\05D8\05D5\05D9')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139139924190751354)
,p_name=>'APEXIR_FILTER'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05E0\05DF')
,p_is_js_message=>true
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139151077444751357)
,p_name=>'APEXIR_FILTERS'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E1\05E0\05E0\05D9\05DD')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139161766545751360)
,p_name=>'APEXIR_FILTER_EXPRESSION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D9\05D8\05D5\05D9 \05E1\05D9\05E0\05D5\05DF')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139259912448751389)
,p_name=>'APEXIR_FILTER_EXPR_TOO_LONG'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D9\05D8\05D5\05D9 \05D4\05DE\05E1\05E0\05DF \05D0\05E8\05D5\05DA \05DE\05D3\05D9.')
,p_version_scn=>2704896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139104669126751343)
,p_name=>'APEXIR_FILTER_SUGGESTIONS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E6\05E2\05D5\05EA \05E1\05D9\05E0\05D5\05DF')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139161681546751360)
,p_name=>'APEXIR_FILTER_TYPE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D5\05D2 \05DE\05E1\05E0\05DF')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139157691960751359)
,p_name=>'APEXIR_FINDER_ALT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05E8 \05E2\05DE\05D5\05D3\05D5\05EA \05DC\05D7\05D9\05E4\05D5\05E9')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139140256693751354)
,p_name=>'APEXIR_FLASHBACK'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05DC\05D0\05E9\05D1\05E7')
,p_is_js_message=>true
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139154873954751358)
,p_name=>'APEXIR_FLASHBACK_DESCRIPTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D0\05D9\05DC\05EA\05EA \05E4\05DC\05D0\05E9\05D1\05E7 \05DE\05D0\05E4\05E9\05E8\05EA \05DC\05DA \05DC\05D4\05E6\05D9\05D2 \05D0\05EA \05D4\05E0\05EA\05D5\05E0\05D9\05DD \05DB\05E4\05D9 \05E9\05D4\05DD \05D4\05D9\05D5 \05D1\05E0\05E7\05D5\05D3\05EA \05D6\05DE\05DF \05E7\05D5\05D3\05DE\05EA.')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139208839818751374)
,p_name=>'APEXIR_FLASHBACK_LABEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E9\05DA \05D4\05E4\05DC\05D0\05E9\05D1\05E7')
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139210204491751374)
,p_name=>'APEXIR_FORMAT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05D5\05E8\05DE\05D8')
,p_is_js_message=>true
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139136022451751352)
,p_name=>'APEXIR_FORMAT_MASK'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E1\05DB\05EA \05E4\05D5\05E8\05DE\05D8 %0')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139147715597751356)
,p_name=>'APEXIR_FUNCTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05D5\05E0\05E7\05E6\05D9\05D4')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139155509715751358)
,p_name=>'APEXIR_FUNCTIONS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05D5\05E0\05E7\05E6\05D9\05D5\05EA %0')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139233272368751381)
,p_name=>'APEXIR_FUNCTIONS_OPERATORS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05D5\05E0\05E7\05E6\05D9\05D5\05EA / \05D0\05D5\05E4\05E8\05D8\05D5\05E8\05D9\05DD')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139147430572751356)
,p_name=>'APEXIR_FUNCTION_N'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05D5\05E0\05E7\05E6\05D9\05D4 %0')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139139768397751353)
,p_name=>'APEXIR_GO'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D9\05E6\05D5\05E2')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139113386615751346)
,p_name=>'APEXIR_GREEN'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05E8\05D5\05E7')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139158355122751359)
,p_name=>'APEXIR_GROUPBY_COLUMNS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DE\05D5\05D3\05D5\05EA ''\05E7\05D1\05E5 \05DC\05E4\05D9''')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139158447790751359)
,p_name=>'APEXIR_GROUPBY_FUNCTIONS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D9\05D1\05D5\05E5 \05DC\05E4\05D9 \05E4\05D5\05E0\05E7\05E6\05D9\05D5\05EA')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139093692804751340)
,p_name=>'APEXIR_GROUP_BY'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D1\05E5 \05DC\05E4\05D9')
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139234358263751382)
,p_name=>'APEXIR_GROUP_BY_COLUMN'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DE\05D5\05D3\05EA ''\05E7\05D1\05E5 \05DC\05E4\05D9'' %0')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139189845929751368)
,p_name=>'APEXIR_GROUP_BY_COL_NOT_NULL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D5\05D1\05D4 \05DC\05E6\05D9\05D9\05DF \05E2\05DE\05D5\05D3\05EA ''\05E7\05D1\05E5 \05DC\05E4\05D9''.')
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139200908525751372)
,p_name=>'APEXIR_GROUP_BY_MAX_ROW_CNT'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E1\05E4\05E8 \05D4\05E9\05D5\05E8\05D5\05EA \05D4\05DE\05E8\05D1\05D9 \05DC\05E9\05D0\05D9\05DC\05EA\05EA ''\05E7\05D1\05E5 \05DC\05E4\05D9'' \05DE\05D2\05D1\05D9\05DC \05D0\05EA \05DE\05E1\05E4\05E8 \05D4\05E9\05D5\05E8\05D5\05EA \05D1\05E9\05D0\05D9\05DC\05EA\05EA \05D4\05D1\05E1\05D9\05E1, \05D5\05DC\05D0 \05D0\05EA \05DE\05E1\05E4\05E8 \05D4\05E9\05D5\05E8\05D5\05EA \05D4\05DE\05D5\05E6\05D2\05D5\05EA. \05E9\05D0\05D9\05DC\05EA\05EA \05D4\05D1\05E1\05D9\05E1 \05D7\05D5\05E8\05D2\05EA \05DE\05DE\05E1\05E4\05E8 \05D4\05E9\05D5\05E8\05D5\05EA \05D4\05DE\05E8\05D1\05D9 \05E9\05DC %0. \05D4\05D7\05DC \05DE\05E1\05E0\05DF \05DB\05D3\05D9 \05DC\05E6\05DE\05E6\05DD \05D0\05EA \05DE\05E1\05E4\05E8 \05D4\05E8\05E9\05D5\05DE\05D5\05EA \05D1\05E9\05D0\05D9\05DC\05EA\05EA \05D4\05D1\05E1\05D9\05E1 \05E9\05DC\05DA.')
,p_version_scn=>2704881
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139181107593751366)
,p_name=>'APEXIR_GROUP_BY_SORT'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D9\05D5\05DF \05E9\05DC ''\05E7\05D1\05E5 \05DC\05E4\05D9''')
,p_is_js_message=>true
,p_version_scn=>2704878
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139237801083751383)
,p_name=>'APEXIR_GROUP_BY_SORT_ORDER'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D3\05E8 \05DE\05D9\05D5\05DF \05E9\05DC ''\05E7\05D1\05E5 \05DC\05E4\05D9''')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139082736438751337)
,p_name=>'APEXIR_GROUP_BY_VIEW_OF'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D9\05D1\05D5\05E5 \05DC\05E4\05D9 \05EA\05E6\05D5\05D2\05D4 \05E9\05DC %0')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139118784177751347)
,p_name=>'APEXIR_HCOLUMN'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DE\05D5\05D3\05D4 \05D0\05D5\05E4\05E7\05D9\05EA')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139152715360751357)
,p_name=>'APEXIR_HELP'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D6\05E8\05D4')
,p_is_js_message=>true
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139144570262751355)
,p_name=>'APEXIR_HELP_01'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\05D3\05D5\05D7\05D5\05EA \05D0\05D9\05E0\05D8\05E8\05D0\05E7\05D8\05D9\05D1\05D9\05D9\05DD \05DE\05D0\05E4\05E9\05E8\05D9\05DD \05DC\05DE\05E9\05EA\05DE\05E9\05D9 \05E7\05E6\05D4 \05DC\05D1\05E6\05E2 \05D4\05EA\05D0\05DE\05D4 \05D0\05D9\05E9\05D9\05EA \05E9\05DC \05D3\05D5\05D7\05D5\05EA. \05DE\05E9\05EA\05DE\05E9\05D9\05DD \05D9\05DB\05D5\05DC\05D9\05DD \05DC\05E9\05E0\05D5\05EA \05D0\05EA \05D4\05DE\05EA\05D5\05D5\05D4 \05E9\05DC \05E0\05EA\05D5\05E0\05D9 \05D3\05D5\05D7 \05E2\05DC-\05D9\05D3\05D9 \05D1\05D7\05D9\05E8\05EA \05E2\05DE\05D5\05D3\05D5\05EA, \05D4\05D7\05DC\05EA \05DE\05E1\05E0\05E0\05D9\05DD, \05D4\05D3\05D2\05E9\05D4 \05D5\05DE\05D9\05D5\05DF. \05DE\05E9\05EA\05DE\05E9\05D9\05DD \05D9\05DB\05D5\05DC\05D9\05DD \05D2\05DD \05DC\05D4\05D2\05D3\05D9\05E8 \05DE\05E2\05D1\05E8\05D9\05DD, \05E1\05DB\05D9\05DE\05D5\05EA, \05EA\05E8\05E9\05D9\05DE\05D9\05DD \05D5\05DE\05D9\05D5\05E0\05D9 ''\05E7\05D1\05E5 \05DC\05E4\05D9'', \05D5\05DC\05D4\05D5\05E1\05D9\05E3 \05D7\05D9\05E9\05D5\05D1\05D9\05DD \05DE\05E9\05DC \05E2\05E6\05DE\05DD.')
||unistr(' \05DE\05E9\05EA\05DE\05E9\05D9\05DD \05D9\05DB\05D5\05DC\05D9\05DD \05D2\05DD \05DC\05D4\05E7\05D9\05DD \05DE\05E0\05D5\05D9 \05DB\05D3\05D9 \05E9\05D2\05E8\05E1\05EA HTML \05E9\05DC \05D4\05D3\05D5\05D7 \05EA\05D9\05E9\05DC\05D7 \05D0\05DC\05D9\05D4\05DD \05D1\05D3\05D5\05D0"\05DC \05D1\05DE\05E8\05D5\05D5\05D7\05D9 \05D6\05DE\05DF \05DE\05D5\05D2\05D3\05E8\05D9\05DD. \05DE\05E9\05EA\05DE\05E9\05D9\05DD \05D9\05DB\05D5\05DC\05D9\05DD \05DC\05D9\05E6\05D5\05E8 \05DE\05E1\05E4\05E8 \05D5\05E8\05D9\05D0\05E6\05D9\05D5\05EA \05E9\05DC \05D3\05D5\05D7 \05D5\05DC\05E9\05DE\05D5\05E8 \05D0\05D5\05EA\05DF \05DB\05D3\05D5\05D7\05D5\05EA \05E9\05DE\05D9\05D9\05DD, \05DC\05E6\05D5\05E8\05DA \05E6\05E4\05D9\05D9\05D4 \05E6\05D9\05D1\05D5\05E8\05D9\05EA \05D0\05D5 \05E4\05E8\05D8\05D9\05EA. '),
'<p/>',
unistr('\05D4\05E4\05E8\05E7\05D9\05DD \05D4\05D1\05D0\05D9\05DD \05DE\05E1\05DB\05DE\05D9\05DD \05D0\05EA \05D4\05D3\05E8\05DB\05D9\05DD \05E9\05D1\05D4\05DF \05EA\05D5\05DB\05DC \05DC\05D4\05EA\05D0\05D9\05DD \05D0\05D9\05E9\05D9\05EA \05D3\05D5\05D7 \05D0\05D9\05E0\05D8\05E8\05D0\05E7\05D8\05D9\05D1\05D9. \05DC\05E7\05D1\05DC\05EA \05DE\05D9\05D3\05E2 \05E0\05D5\05E1\05E3 \05E2\05D9\05D9\05DF \05D1\05E4\05E8\05E7 "Using Interactive Reports" (\05E9\05D9\05DE\05D5\05E9 \05D1\05D3\05D5\05D7\05D5\05EA \05D0\05D9\05E0\05D8\05E8\05D0\05E7\05D8\05D9\05D1\05D9\05D9\05DD) \05D1\05DE\05D3\05E8\05D9\05DA <i>Oracle APEX End User''s Guide</i>.')))
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139151618448751357)
,p_name=>'APEXIR_HELP_ACTIONS_MENU'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05E4\05E8\05D9\05D8 \05D4\05E4\05E2\05D5\05DC\05D5\05EA \05DE\05D5\05E4\05D9\05E2 \05DE\05E6\05D3 \05D9\05DE\05D9\05DF \05E9\05DC \05DC\05D7\05E6\05DF \05D4\05D1\05D9\05E6\05D5\05E2 \05D1\05E1\05E8\05D2\05DC \05D4\05D7\05D9\05E4\05D5\05E9. \05D4\05E9\05EA\05DE\05E9 \05D1\05EA\05E4\05E8\05D9\05D8 \05D6\05D4 \05DB\05D3\05D9 \05DC\05D4\05EA\05D0\05D9\05DD \05D0\05D9\05E9\05D9\05EA \05D3\05D5\05D7 \05D0\05D9\05E0\05D8\05E8\05D0\05E7\05D8\05D9\05D1\05D9.')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139145382538751355)
,p_name=>'APEXIR_HELP_AGGREGATE'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\05E1\05DB\05D9\05DE\05D5\05EA \05D4\05DF \05D7\05D9\05E9\05D5\05D1\05D9\05DD \05DE\05EA\05DE\05D8\05D9\05D9\05DD \05D4\05DE\05D1\05D5\05E6\05E2\05D9\05DD \05DB\05E0\05D2\05D3 \05E2\05DE\05D5\05D3\05D4. \05E1\05DB\05D9\05DE\05D5\05EA \05DE\05D5\05E6\05D2\05D5\05EA \05DC\05D0\05D7\05E8 \05DB\05DC Control Break \05D5\05D1\05E1\05D5\05E3 \05D4\05D3\05D5\05D7 \05D1\05EA\05D5\05DA \05D4\05E2\05DE\05D5\05D3\05D4 \05E9\05D1\05D4 \05D4\05D5\05D2\05D3\05E8\05D5. \05D4\05D0\05E4\05E9\05E8\05D5\05D9\05D5\05EA \05D4\05DF:'),
'<p>',
'</p><ul>',
unistr('<li><strong>\05E1\05DB\05D9\05DE\05D4</strong> \05DE\05D0\05E4\05E9\05E8\05EA \05DC\05DA \05DC\05D1\05D7\05D5\05E8 \05E1\05DB\05D9\05DE\05D4'),
unistr('\05E9\05D4\05D5\05D2\05D3\05E8\05D4 \05D1\05E2\05D1\05E8 \05D5\05DC\05E2\05E8\05D5\05DA \05D0\05D5\05EA\05D4.</li>'),
unistr('<li><strong>\05E4\05D5\05E0\05E7\05E6\05D9\05D4</strong> \05D4\05D9\05D0 \05D4\05E4\05D5\05E0\05E7\05E6\05D9\05D4 \05E9\05D9\05E9 \05DC\05D1\05E6\05E2 (\05DC\05D3\05D5\05D2\05DE\05D4, SUM, MIN).</li>'),
unistr('<li><strong>\05E2\05DE\05D5\05D3\05D4</strong> \05DE\05E9\05DE\05E9\05EA \05DC\05D1\05D7\05D9\05E8\05EA \05D4\05E2\05DE\05D5\05D3\05D4 \05E9\05E2\05DC\05D9\05D4 \05EA\05D7\05D5\05DC \05D4\05E4\05D5\05E0\05E7\05E6\05D9\05D4 \05D4\05DE\05EA\05DE\05D8\05D9\05EA. \05DE\05D5\05E6\05D2\05D5\05EA'),
unistr('\05E2\05DE\05D5\05D3\05D5\05EA \05DE\05E1\05E4\05E8\05D9\05D5\05EA \05D1\05DC\05D1\05D3.</li>'),
'</ul>'))
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139145408135751355)
,p_name=>'APEXIR_HELP_CHART'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\05EA\05D5\05DB\05DC \05DC\05D4\05D2\05D3\05D9\05E8 \05EA\05E8\05E9\05D9\05DD \05D0\05D7\05D3 \05DC\05DB\05DC \05D3\05D5\05D7 \05E9\05DE\05D5\05E8. \05DC\05D0\05D7\05E8 \05E9\05D4\05D5\05D0'),
unistr('\05D4\05D5\05D2\05D3\05E8, \05EA\05D5\05DB\05DC \05DC\05D4\05D7\05DC\05D9\05E3 \05D1\05D9\05DF \05EA\05E6\05D5\05D2\05EA \05D4\05EA\05E8\05E9\05D9\05DD \05D5\05EA\05E6\05D5\05D2\05D5\05EA \05D4\05D3\05D5\05D7 \05D1\05D0\05DE\05E6\05E2\05D5\05EA \05D0\05D9\05E7\05D5\05E0\05D9 \05D4\05EA\05E6\05D5\05D2\05D4 \05D1\05E1\05E8\05D2\05DC \05D4\05D7\05D9\05E4\05D5\05E9.'),
unistr('\05D4\05D0\05E4\05E9\05E8\05D5\05D9\05D5\05EA \05D4\05DF: '),
'<p>',
'</p><ul>',
unistr('<li><strong>\05E1\05D5\05D2 \05EA\05E8\05E9\05D9\05DD</strong> \05DE\05D6\05D4\05D4 \05D0\05EA \05E1\05D5\05D2 \05D4\05EA\05E8\05E9\05D9\05DD \05E9\05D9\05E9 \05DC\05DB\05DC\05D5\05DC.'),
unistr('\05D1\05D7\05E8 \05D1\05D9\05DF \05E2\05DE\05D5\05D3\05D5\05EA \05D0\05D5\05E4\05E7\05D9\05D5\05EA, \05E2\05DE\05D5\05D3\05D5\05EA \05D0\05E0\05DB\05D9\05D5\05EA, \05EA\05E8\05E9\05D9\05DD \05E2\05D5\05D2\05D4 \05D0\05D5 \05E7\05D5.</li>'),
unistr('<li><strong>\05EA\05D5\05D5\05D9\05EA</strong> \05DE\05D0\05E4\05E9\05E8\05EA \05DC\05DA \05DC\05D1\05D7\05D5\05E8 \05D0\05EA \05D4\05E2\05DE\05D5\05D3\05D4 \05E9\05EA\05E9\05DE\05E9 \05DB\05EA\05D5\05D5\05D9\05EA.</li>'),
unistr('<li><strong>\05DB\05D5\05EA\05E8\05EA \05E6\05D9\05E8 \05DC\05EA\05D5\05D5\05D9\05EA</strong> \05D4\05D9\05D0 \05D4\05DB\05D5\05EA\05E8\05EA \05D4\05DE\05D5\05E6\05D2\05EA \05E2\05DC \05D4\05E6\05D9\05E8 \05D4\05E7\05E9\05D5\05E8 \05DC\05E2\05DE\05D5\05D3\05D4 \05E9\05E0\05D1\05D7\05E8\05D4'),
unistr('\05DC\05EA\05D5\05D5\05D9\05EA. \05D6\05D4 \05DC\05D0 \05D6\05DE\05D9\05DF \05DC\05EA\05E8\05E9\05D9\05DD \05E2\05D5\05D2\05D4.</li>'),
unistr('<li><strong>\05E2\05E8\05DA</strong> \05DE\05D0\05E4\05E9\05E8 \05DC\05DA \05DC\05D1\05D7\05D5\05E8 \05D0\05EA \05D4\05E2\05DE\05D5\05D3\05D4 \05E9\05EA\05E9\05DE\05E9 \05DB\05E2\05E8\05DA. \05D0\05DD \05D4\05E4\05D5\05E0\05E7\05E6\05D9\05D4 \05E9\05DC\05DA'),
unistr('\05D4\05D9\05D0 COUNT, \05D0\05D9\05DF \05E6\05D5\05E8\05DA \05DC\05D1\05D7\05D5\05E8 \05E2\05E8\05DA.</li>'),
unistr('<li><strong>\05DB\05D5\05EA\05E8\05EA \05E6\05D9\05E8 \05DC\05E2\05E8\05DA</strong> \05D4\05D9\05D0 \05D4\05DB\05D5\05EA\05E8\05EA \05D4\05DE\05D5\05E6\05D2\05EA \05E2\05DC \05D4\05E6\05D9\05E8 \05D4\05E7\05E9\05D5\05E8 \05DC\05E2\05DE\05D5\05D3\05D4 \05E9\05E0\05D1\05D7\05E8\05D4'),
unistr('\05DC\05E2\05E8\05DA. \05D6\05D4 \05DC\05D0 \05D6\05DE\05D9\05DF \05DC\05EA\05E8\05E9\05D9\05DD \05E2\05D5\05D2\05D4.</li>'),
unistr('<li><strong>\05E4\05D5\05E0\05E7\05E6\05D9\05D4</strong> \05D4\05D9\05D0 \05E4\05D5\05E0\05E7\05E6\05D9\05D4 \05D0\05D5\05E4\05E6\05D9\05D5\05E0\05DC\05D9\05EA \05E9\05E0\05D9\05EA\05DF \05DC\05D4\05E4\05E2\05D9\05DC \05E2\05DC \05D4\05E2\05DE\05D5\05D3\05D4 \05E9\05E0\05D1\05D7\05E8\05D4 \05DC\05E2\05E8\05DA.</li>'),
unistr('<li><strong>\05DE\05D9\05D5\05DF</strong> \05DE\05D0\05E4\05E9\05E8\05EA \05DC\05DA \05DC\05DE\05D9\05D9\05DF \05D0\05EA \05E1\05DC \05D4\05EA\05D5\05E6\05D0\05D5\05EA.</li></ul>')))
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139144715273751355)
,p_name=>'APEXIR_HELP_COLUMN_HEADING_MENU'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\05DC\05D7\05D9\05E6\05D4 \05E2\05DC \05DB\05D5\05EA\05E8\05EA \05E2\05DE\05D5\05D3\05D4 \05DB\05DC\05E9\05D4\05D9 \05D7\05D5\05E9\05E4\05EA \05EA\05E4\05E8\05D9\05D8 \05E9\05DC \05DB\05D5\05EA\05E8\05EA \05E2\05DE\05D5\05D3\05D4. \05D4\05D0\05E4\05E9\05E8\05D5\05D9\05D5\05EA \05D4\05DF:'),
'<p></p>',
'<ul>',
unistr('<li>\05D4\05D0\05D9\05E7\05D5\05DF <strong>\05DE\05D9\05D9\05DF \05D1\05E1\05D3\05E8 \05E2\05D5\05DC\05D4</strong> \05DE\05DE\05D9\05D9\05DF \05D0\05EA \05D4\05D3\05D5\05D7 \05DC\05E4\05D9 \05D4\05E2\05DE\05D5\05D3\05D4 \05D1\05E1\05D3\05E8 \05E2\05D5\05DC\05D4.</li>'),
unistr('<li>\05D4\05D0\05D9\05E7\05D5\05DF <strong>\05DE\05D9\05D9\05DF \05D1\05E1\05D3\05E8 \05D9\05D5\05E8\05D3</strong> \05DE\05DE\05D9\05D9\05DF \05D0\05EA \05D4\05D3\05D5\05D7 \05DC\05E4\05D9 \05D4\05E2\05DE\05D5\05D3\05D4 \05D1\05E1\05D3\05E8 \05D9\05D5\05E8\05D3.</li>'),
unistr('<li><strong>\05D4\05E1\05EA\05E8 \05E2\05DE\05D5\05D3\05D4</strong> \05DE\05E1\05EA\05D9\05E8 \05D0\05EA \05D4\05E2\05DE\05D5\05D3\05D4. \05DC\05D0 \05D0\05EA \05DB\05DC \05D4\05E2\05DE\05D5\05D3\05D5\05EA \05D0\05E4\05E9\05E8 \05DC\05D4\05E1\05EA\05D9\05E8. \05D0\05DD \05E2\05DE\05D5\05D3\05D4 \05D0\05D9\05E0\05D4 \05E0\05D9\05EA\05E0\05EA \05DC\05D4\05E1\05EA\05E8\05D4, \05DC\05D0 \05D9\05D5\05E4\05D9\05E2 \05D0\05D9\05E7\05D5\05DF ''\05D4\05E1\05EA\05E8 \05E2\05DE\05D5\05D3\05D4''.</li>'),
unistr('<li><strong>\05E2\05DE\05D5\05D3\05EA \05E9\05D1\05D9\05E8\05D4</strong> \05D9\05D5\05E6\05E8 \05E7\05D1\05D5\05E6\05EA \05E9\05D1\05D9\05E8\05D4 \05D1\05E2\05DE\05D5\05D3\05D4. \05D3\05D1\05E8 \05D6\05D4 \05DE\05D5\05E9\05DA \05D0\05EA \05D4\05E2\05DE\05D5\05D3\05D4 \05DE\05D7\05D5\05E5 \05DC\05D3\05D5\05D7 \05DB\05E8\05E9\05D5\05DE\05EA \05D0\05D1.</li>'),
unistr('<li><strong>\05E4\05E8\05D8\05D9 \05E2\05DE\05D5\05D3\05D4</strong> \05DE\05E6\05D9\05D2 \05D8\05E7\05E1\05D8 \05E2\05D6\05E8\05D4 \05E2\05DC \05D4\05E2\05DE\05D5\05D3\05D4, \05D0\05DD \05D9\05E9.</li>'),
unistr('<li><strong>\05D0\05D6\05D5\05E8 \05D8\05E7\05E1\05D8</strong> \05DE\05E9\05DE\05E9 \05DC\05D4\05D6\05E0\05EA \05E7\05E8\05D9\05D8\05E8\05D9\05D5\05E0\05D9 \05D7\05D9\05E4\05D5\05E9 \05E8\05D2\05D9\05E9\05D9\05DD \05DC\05D0\05D5\05EA\05D9\05D5\05EA \05E8\05D9\05E9\05D9\05D5\05EA'),
unistr('(\05D0\05D9\05DF \05E6\05D5\05E8\05DA \05D1\05EA\05D5\05D5\05D9\05DD \05DB\05DC\05DC\05D9\05D9\05DD). \05D4\05D6\05E0\05EA \05E2\05E8\05DA \05DE\05E6\05DE\05E6\05DE\05EA \05D0\05EA \05E8\05E9\05D9\05DE\05EA'),
unistr('\05D4\05E2\05E8\05DB\05D9\05DD \05D1\05EA\05D7\05EA\05D9\05EA \05D4\05EA\05E4\05E8\05D9\05D8. \05D0\05D6 \05EA\05D5\05DB\05DC \05DC\05D1\05D7\05D5\05E8 \05E2\05E8\05DA \05DE\05D4\05EA\05D7\05EA\05D9\05EA'),
unistr('\05D5\05D4\05E2\05E8\05DA \05E9\05D1\05D7\05E8\05EA \05D9\05D9\05D5\05D5\05E6\05E8 \05DB\05DE\05E1\05E0\05DF \05D1\05D0\05DE\05E6\05E2\05D5\05EA ''='''),
unistr('(\05DC\05D3\05D5\05D2\05DE\05D4, <code>\05E2\05DE\05D5\05D3\05D4 = ''ABC''</code>). \05DC\05D7\05DC\05D5\05E4\05D9\05DF, \05EA\05D5\05DB\05DC \05DC\05DC\05D7\05D5\05E5 \05E2\05DC \05D0\05D9\05E7\05D5\05DF \05D4\05E4\05E0\05E1 \05D5\05DC\05D4\05D6\05D9\05DF \05E2\05E8\05DA \05DB\05D3\05D9 \05DC\05D9\05E6\05D5\05E8 \05D0\05D5\05EA\05D5 \05DB\05DE\05E1\05E0\05DF \05E2\05DD \05DE\05E1\05D2\05DC \05D4\05D7\05D9\05E4\05D5\05E9'),
unistr('''LIKE'' (\05DC\05D3\05D5\05D2\05DE\05D4, <code>\05E2\05DE\05D5\05D3\05D4 LIKE ''%ABC%''</code>).</li>'),
unistr('<li><strong>\05E8\05E9\05D9\05DE\05EA \05E2\05E8\05DB\05D9\05DD \05D9\05D9\05D7\05D5\05D3\05D9\05D9\05DD</strong> \05DE\05DB\05D9\05DC\05D4 \05D0\05EA 500 \05D4\05E2\05E8\05DB\05D9\05DD'),
unistr('\05D4\05E8\05D0\05E9\05D5\05E0\05D9\05DD \05E9\05E2\05D5\05E0\05D9\05DD \05E2\05DC \05E7\05E8\05D9\05D8\05E8\05D9\05D5\05E0\05D9 \05D4\05E1\05D9\05E0\05D5\05DF. \05D0\05DD \05D4\05E2\05DE\05D5\05D3\05D4 \05D4\05D9\05D0 \05EA\05D0\05E8\05D9\05DA, \05DE\05D5\05E6\05D2\05EA'),
unistr('\05D1\05DE\05E7\05D5\05DD \05D6\05D0\05EA \05E8\05E9\05D9\05DE\05D4 \05E9\05DC \05D8\05D5\05D5\05D7\05D9 \05EA\05D0\05E8\05D9\05DA. \05D0\05DD \05EA\05D1\05D7\05E8 \05E2\05E8\05DA, \05D9\05D9\05D5\05D5\05E6\05E8 \05DE\05E1\05E0\05DF'),
unistr('\05D1\05D0\05DE\05E6\05E2\05D5\05EA ''='' (\05DC\05D3\05D5\05D2\05DE\05D4, <code>\05E2\05DE\05D5\05D3\05D4 = ''ABC''</code>).</li>'),
'</ul>'))
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139145272777751355)
,p_name=>'APEXIR_HELP_COMPUTE'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\05DE\05D0\05E4\05E9\05E8 \05DC\05DA \05DC\05D4\05D5\05E1\05D9\05E3 \05E2\05DE\05D5\05D3\05D5\05EA \05DE\05D7\05D5\05E9\05D1\05D5\05EA \05DC\05D3\05D5\05D7. \05D0\05DC\05D5 \05E2\05E9\05D5\05D9\05D9\05DD \05DC\05D4\05D9\05D5\05EA \05D7\05D9\05E9\05D5\05D1\05D9\05DD \05DE\05EA\05DE\05D8\05D9\05D9\05DD (\05DC\05D3\05D5\05D2\05DE\05D4, <code>NBR_HOURS/24</code>) \05D0\05D5 \05E4\05D5\05E0\05E7\05E6\05D9\05D5\05EA \05E1\05D8\05E0\05D3\05E8\05D8\05D9\05D5\05EA \05E9\05DC Oracle'),
unistr('\05D4\05D7\05DC\05D5\05EA \05E2\05DC \05E2\05DE\05D5\05D3\05D5\05EA \05E7\05D9\05D9\05DE\05D5\05EA. \05DB\05DE\05D4 \05DE\05D4\05DD \05DE\05D5\05E6\05D2\05D9\05DD \05DB\05D3\05D5\05D2\05DE\05D0\05D5\05EA \05D5\05E0\05D9\05EA\05DF \05DC\05D4\05E9\05EA\05DE\05E9 \05D2\05DD \05D1\05D0\05D7\05E8\05D9\05DD (\05DB\05DE\05D5 \05DC\05DE\05E9\05DC <code>TO_DATE)</code>. \05D4\05D0\05E4\05E9\05E8\05D5\05D9\05D5\05EA \05D4\05DF:'),
'<p></p>',
'<ul>',
unistr('<li><strong>\05D7\05D9\05E9\05D5\05D1</strong> \05DE\05D0\05E4\05E9\05E8 \05DC\05DA \05DC\05D1\05D7\05D5\05E8 \05D7\05D9\05E9\05D5\05D1 \05E9\05D4\05D5\05D2\05D3\05E8 \05D1\05E2\05D1\05E8 \05D5\05DC\05E2\05E8\05D5\05DA \05D0\05D5\05EA\05D5.</li>'),
unistr('<li><strong>\05DB\05D5\05EA\05E8\05EA \05E2\05DE\05D5\05D3\05D4</strong> \05D4\05D9\05D0 \05DB\05D5\05EA\05E8\05EA \05D4\05E2\05DE\05D5\05D3\05D4 \05E9\05DC \05D4\05E2\05DE\05D5\05D3\05D4 \05D4\05D7\05D3\05E9\05D4.</li>'),
unistr('<li><strong>\05DE\05E1\05DB\05EA \05EA\05D1\05E0\05D9\05EA</strong> \05D4\05D9\05D0 \05DE\05E1\05DB\05EA \05EA\05D1\05E0\05D9\05EA \05E9\05DC Oracle \05E9\05D9\05E9 \05DC\05D4\05D7\05D9\05DC \05E2\05DC \05D4\05E2\05DE\05D5\05D3\05D4 (\05DC\05D3\05D5\05D2\05DE\05D4,S9999).</li>'),
unistr('<li><strong>\05D7\05D9\05E9\05D5\05D1</strong> \05D4\05D5\05D0 \05D4\05D7\05D9\05E9\05D5\05D1 \05E9\05D9\05E9 \05DC\05D1\05E6\05E2. \05D1\05DE\05E1\05D2\05E8\05EA \05D4\05D7\05D9\05E9\05D5\05D1, \05D4\05D4\05E4\05E0\05D9\05D4 \05DC\05E2\05DE\05D5\05D3\05D5\05EA \05E0\05E2\05E9\05D9\05EA \05D1\05D0\05DE\05E6\05E2\05D5\05EA \05D4\05DB\05D9\05E0\05D5\05D9\05D9\05DD \05D4\05DE\05D5\05E6\05D2\05D9\05DD.</li>'),
'</ul>',
unistr('<p>\05DE\05EA\05D7\05EA \05DC\05D7\05D9\05E9\05D5\05D1, \05D4\05E2\05DE\05D5\05D3\05D5\05EA \05D1\05E9\05D0\05D9\05DC\05EA\05D0 \05E9\05DC\05DA \05DE\05D5\05E6\05D2\05D5\05EA \05E2\05DD'),
unistr('\05D4\05DB\05D9\05E0\05D5\05D9 \05D4\05E7\05E9\05D5\05E8 \05D0\05DC\05D9\05D4\05DF. \05DC\05D7\05D9\05E6\05D4 \05E2\05DC \05E9\05DD \05D0\05D5 \05E2\05DC \05DB\05D9\05E0\05D5\05D9 \05E9\05DC \05E2\05DE\05D5\05D3\05D4 \05D2\05D5\05E8\05DE\05EA'),
unistr('\05DC\05D4\05DB\05DC\05DC\05EA\05D4 \05D1\05D7\05D9\05E9\05D5\05D1. \05DC\05D9\05D3 \05D4\05E2\05DE\05D5\05D3\05D5\05EA \05D9\05E9 keypad. \05D4\05D5\05D0 \05E4\05D5\05E2\05DC'),
unistr('\05DB\05E7\05D9\05E6\05D5\05E8 \05D3\05E8\05DA \05DC\05DE\05E7\05E9\05D9\05DD \05D1\05E9\05D9\05DE\05D5\05E9 \05E0\05E4\05D5\05E5. \05D1\05E7\05E6\05D4 \05D4\05D9\05DE\05E0\05D9 \05D9\05E9 \05E4\05D5\05E0\05E7\05E6\05D9\05D5\05EA.</p>'),
unistr('<p>\05D3\05D5\05D2\05DE\05EA \05D4\05D7\05D9\05E9\05D5\05D1 \05D4\05D1\05D0\05D4 \05DE\05DE\05D7\05D9\05E9\05D4 \05DB\05D9\05E6\05D3 \05DC\05D4\05E6\05D9\05D2 \05E1\05D4"\05DB \05EA\05D2\05DE\05D5\05DC\05D9\05DD:</p>'),
'<pre>CASE WHEN A = ''SALES'' THEN B + C ELSE B END</pre>',
unistr('(\05DB\05D0\05E9\05E8 A \05D4\05D5\05D0 \05D0\05E8\05D2\05D5\05DF, B \05D4\05D5\05D0 \05E9\05DB\05E8 \05D5\05D0\05D9\05DC\05D5 C \05D4\05D5\05D0 \05E2\05DE\05DC\05D4)'),
''))
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139151778171751357)
,p_name=>'APEXIR_HELP_CONTROL_BREAK'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E9\05DE\05E9 \05DC\05D9\05E6\05D9\05E8\05EA \05E7\05D1\05D5\05E6\05EA \05E9\05D1\05D9\05E8\05D4 \05D1\05E2\05DE\05D5\05D3\05D4 \05D0\05D7\05EA \05D0\05D5 \05D9\05D5\05EA\05E8. \05D3\05D1\05E8 \05D6\05D4 \05DE\05D5\05E9\05DA \05D0\05EA \05D4\05E2\05DE\05D5\05D3\05D5\05EA \05D0\05DC \05DE\05D7\05D5\05E5 \05DC\05D3\05D5\05D7 \05D4\05D0\05D9\05E0\05D8\05E8\05D0\05E7\05D8\05D9\05D1\05D9 \05D5\05DE\05E6\05D9\05D2 \05D0\05D5\05EA\05DF \05DB\05E8\05E9\05D5\05DE\05D4 \05D0\05D1.')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139145949975751355)
,p_name=>'APEXIR_HELP_DETAIL_VIEW'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D4\05E6\05D2\05EA \05E4\05E8\05D8\05D9 \05E9\05D5\05E8\05D4 \05D0\05D7\05EA \05D1\05DB\05DC \05E4\05E2\05DD, \05DC\05D7\05E5 \05E2\05DC \05D0\05D9\05E7\05D5\05DF \05D4\05EA\05E6\05D5\05D2\05D4 \05E9\05DC \05E9\05D5\05E8\05D4 \05D1\05D5\05D3\05D3\05EA \05D1\05E9\05D5\05E8\05D4 \05E9\05D0\05D5\05EA\05D4 \05EA\05E8\05E6\05D4 \05DC\05D4\05E6\05D9\05D2. \05D0\05DD \05D4\05E9\05D5\05E8\05D4 \05D4\05D1\05D5\05D3\05D3\05EA \05D6\05DE\05D9\05E0\05D4, \05D4\05D9\05D0 \05EA\05D5\05E6\05D2 \05EA\05DE\05D9\05D3 \05D1\05E2\05DE\05D5\05D3\05D4 \05D4\05E8\05D0\05E9\05D5\05E0\05D4. \05D1\05D4\05EA\05D0\05DD \05DC\05D4\05EA\05D0\05DE\05D4 \05D4\05D0\05D9\05E9\05D9\05EA \05E9\05DC \05D4\05D3\05D5\05D7 \05D4\05D0\05D9\05E0\05D8\05E8\05D0\05E7\05D8\05D9\05D1\05D9, \05EA\05E6\05D5\05D2\05EA \05D4\05E9\05D5\05E8\05D4 \05D4\05D1\05D5\05D3\05D3\05EA \05E2\05E9\05D5\05D9\05D4 \05DC\05D4\05D9\05D5\05EA \05EA\05E6\05D5\05D2\05D4 \05E1\05D8\05E0\05D3\05E8\05D8\05D9\05EA \05D0\05D5 \05D3\05E3 \05D1\05D4\05EA\05D0\05DE\05D4 \05D0\05D9\05E9\05D9\05EA \05E9\05DE\05E8')
||unistr('\05E9\05D4 \05E2\05D3\05DB\05D5\05DF.')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139145823608751355)
,p_name=>'APEXIR_HELP_DOWNLOAD'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D0\05E4\05E9\05E8 \05D4\05D5\05E8\05D3\05D4 \05E9\05DC \05E1\05DC \05D4\05EA\05D5\05E6\05D0\05D5\05EA \05D4\05E0\05D5\05DB\05D7\05D9. \05D4\05E4\05D5\05E8\05DE\05D8\05D9\05DD \05E9\05DC \05D4\05D4\05D5\05E8\05D3\05D4 \05DB\05D5\05DC\05DC\05D9\05DD \05D0\05EA PDF, Excel, HTML, \05D5-CSV. \05D0\05E4\05E9\05E8\05D5\05D9\05D5\05EA \05D4\05D4\05D5\05E8\05D3\05D4 \05DE\05E9\05EA\05E0\05D5\05EA \05E2\05DC \05E4\05D9 \05D4\05E4\05D5\05E8\05DE\05D8 \05E9\05E0\05D1\05D7\05E8. \05E0\05D9\05EA\05DF \05DC\05E9\05DC\05D5\05D7 \05D0\05EA \05DB\05DC \05D4\05E4\05D5\05E8\05DE\05D8\05D9\05DD \05D2\05DD \05D1\05D3\05D5\05D0"\05DC.')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139144922150751355)
,p_name=>'APEXIR_HELP_FILTER'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\05DE\05DE\05E7\05D3 \05D0\05EA \05D4\05D3\05D5\05D7 \05E2\05DC-\05D9\05D3\05D9 \05D4\05D5\05E1\05E4\05D4 \05D0\05D5 \05EA\05D9\05E7\05D5\05DF \05E9\05DC \05E4\05E1\05D5\05E7 <code>WHERE</code> \05D1\05E9\05D0\05D9\05DC\05EA\05D0. \05EA\05D5\05DB\05DC \05DC\05E1\05E0\05DF \05E2\05DC \05E2\05DE\05D5\05D3\05D4 \05D0\05D5 \05DC\05E4\05D9 \05E9\05D5\05E8\05D4. '),
unistr('<p>\05D0\05DD \05EA\05D1\05D7\05E8 \05DC\05E1\05E0\05DF \05DC\05E4\05D9 \05E2\05DE\05D5\05D3\05D4, \05D1\05D7\05E8 \05E2\05DE\05D5\05D3\05D4 (\05D4\05D9\05D0 \05DC\05D0 \05D7\05D9\05D9\05D1\05EA \05DC\05D4\05D9\05D5\05EA'),
unistr('\05E2\05DE\05D5\05D3\05D4 \05DE\05D5\05E6\05D2\05EA), \05D1\05D7\05E8 \05D0\05D5\05E4\05E8\05D8\05D5\05E8 \05E1\05D8\05E0\05D3\05E8\05D8\05D9 \05E9\05DC Oracle (=, !=, \05D0\05D9\05E0\05D5 \05D1-, \05D1\05D9\05DF), \05D5\05D4\05D6\05DF \05D1\05D9\05D8\05D5\05D9 \05DB\05D3\05D9 \05DC\05D4\05E9\05D5\05D5\05EA \05E0\05D2\05D3\05D5. \05D4\05D1\05D9\05D8\05D5\05D9\05D9\05DD \05E8\05D2\05D9\05E9\05D9\05DD \05DC\05D0\05D5\05EA\05D9\05D5\05EA \05E8\05D9\05E9\05D9\05D5\05EA. \05D4\05E9\05EA\05DE\05E9 \05D1\05EA\05D5 % \05DB\05EA\05D5 \05DB\05DC\05DC\05D9 (\05DC\05D3\05D5\05D2\05DE\05D4, <code>STATE_NAME'),
unistr('\05DB\05DE\05D5 A%)</code>.</p>'),
unistr('<p>\05D0\05DD \05EA\05D1\05D7\05E8 \05DC\05E1\05E0\05DF \05DC\05E4\05D9 \05E9\05D5\05E8\05D4, \05EA\05D5\05DB\05DC \05DC\05D9\05E6\05D5\05E8 \05E4\05E1\05D5\05E7\05D9 <code>WHERE</code> \05DE\05D5\05E8\05DB\05D1\05D9\05DD \05D1\05D0\05DE\05E6\05E2\05D5\05EA'),
unistr('\05DB\05D9\05E0\05D5\05D9\05D9 \05E2\05DE\05D5\05D3\05D4 \05D5\05DB\05DC \05E4\05D5\05E0\05E7\05E6\05D9\05D4 \05D0\05D5 \05D0\05D5\05E4\05E8\05D8\05D5\05E8 \05E9\05DC Oracle (\05DC\05D3\05D5\05D2\05DE\05D4, <code>G = ''VA'' \05D0\05D5 G = ''CT''</code>, \05DB\05D0\05E9\05E8'),
unistr('<code>G</code> \05D4\05D5\05D0 \05D4\05DB\05D9\05E0\05D5\05D9 \05E9\05DC <code>CUSTOMER_STATE</code>).</p>'),
''))
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139145570107751355)
,p_name=>'APEXIR_HELP_FLASHBACK'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\05E9\05D0\05D9\05DC\05EA\05EA \05E4\05DC\05D0\05E9\05D1\05E7 \05DE\05D0\05E4\05E9\05E8\05EA \05DC\05DA \05DC\05D4\05E6\05D9\05D2 \05D0\05EA \05D4\05E0\05EA\05D5\05E0\05D9\05DD \05DB\05E4\05D9 \05E9\05D4\05D9\05D5 \05D1\05E0\05E7\05D5\05D3\05D4 \05D4\05E7\05D5\05D3\05DE\05EA'),
unistr('\05D1\05D6\05DE\05DF. \05D1\05E8\05D9\05E8\05EA \05D4\05DE\05D7\05D3\05DC \05E9\05DC \05DE\05E9\05DA \05D4\05D6\05DE\05DF \05E9\05D1\05D4 \05EA\05D5\05DB\05DC \05DC\05D1\05E6\05E2 \05E4\05DC\05D0\05E9\05D1\05E7 \05D4\05D5\05D0 3 \05E9\05E2\05D5\05EA (\05D0\05D5 180'),
unistr('\05D3\05E7\05D5\05EA) \05D0\05DA \05D4\05DE\05E9\05DA \05D1\05E4\05D5\05E2\05DC \05D9\05E9\05EA\05E0\05D4 \05DC\05DB\05DC \05DE\05E1\05D3 \05E0\05EA\05D5\05E0\05D9\05DD.')))
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139210145954751374)
,p_name=>'APEXIR_HELP_FORMAT'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\05E4\05D5\05E8\05DE\05D8 \05DE\05D0\05E4\05E9\05E8 \05DC\05DA \05DC\05D1\05E6\05E2 \05D4\05EA\05D0\05DE\05D4 \05D0\05D9\05E9\05D9\05EA \05E9\05DC \05EA\05E6\05D5\05D2\05EA \05D4\05D3\05D5\05D7.'),
unistr('\05E4\05D5\05E8\05DE\05D8 \05DE\05DB\05D9\05DC \05D0\05EA \05EA\05E4\05E8\05D9\05D8\05D9 \05D4\05DE\05E9\05E0\05D4 \05D4\05D1\05D0\05D9\05DD:</p>'),
unistr('<ul><li>\05DE\05D9\05D5\05DF</li>'),
'<li>Control Break</li>',
unistr('<li>\05D4\05D3\05D2\05E9\05D4</li>'),
unistr('<li>\05D7\05D9\05E9\05D5\05D1</li>'),
unistr('<li>\05E1\05DB\05D9\05DE\05D4</li>'),
unistr('<li>\05EA\05E8\05E9\05D9\05DD</li>'),
unistr('<li>\05E7\05D1\05E5 \05DC\05E4\05D9</li>'),
unistr('<li>\05E6\05D9\05E8</li>'),
'</ul>',
''))
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139208374603751374)
,p_name=>'APEXIR_HELP_GROUP_BY'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\05EA\05D5\05DB\05DC \05DC\05D4\05D2\05D3\05D9\05E8 \05EA\05E6\05D5\05D2\05D4 \05D0\05D7\05EA \05E9\05DC ''\05E7\05D1\05E5 \05DC\05E4\05D9'' \05DC\05DB\05DC \05D3\05D5\05D7'),
unistr('\05E9\05E0\05E9\05DE\05E8. \05DC\05D0\05D7\05E8 \05E9\05D4\05D2\05D3\05E8\05EA, \05EA\05D5\05DB\05DC \05DC\05D4\05D7\05DC\05D9\05E3 \05D1\05D9\05DF \05EA\05E6\05D5\05D2\05EA ''\05E7\05D1\05E5 \05DC\05E4\05D9'' \05DC\05EA\05E6\05D5\05D2\05EA'),
unistr('\05D4\05D3\05D5\05D7 \05D1\05D0\05DE\05E6\05E2\05D5\05EA \05D0\05D9\05E7\05D5\05E0\05D9 \05EA\05E6\05D5\05D2\05D4 \05D1\05E1\05E8\05D2\05DC \05D4\05D7\05D9\05E4\05D5\05E9. \05DC\05D9\05E6\05D9\05E8\05EA \05EA\05E6\05D5\05D2\05EA ''\05E7\05D1\05E5 \05DC\05E4\05D9'','),
unistr('\05D1\05D7\05E8 \05D0\05EA:'),
'<p></p>',
'<ul>',
unistr('<li>\05D4\05E2\05DE\05D5\05D3\05D5\05EA \05E9\05E2\05DC\05D9\05D4\05DF \05D9\05E9 \05DC\05E7\05D1\05E5</li>'),
unistr('<li>\05D4\05E2\05DE\05D5\05D3\05D5\05EA \05DC\05E1\05DB\05D9\05DE\05D4 \05D1\05D9\05D7\05D3 \05E2\05DD \05D4\05E4\05D5\05E0\05E7\05E6\05D9\05D4 \05E9\05D9\05E9 \05DC\05D1\05E6\05E2 (\05DE\05DE\05D5\05E6\05E2, \05E1\05D9\05DB\05D5\05DD, \05E1\05E4\05D9\05E8\05D4 \05D5\05DB\05D5'')</li>'),
'</ul>'))
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139145159912751355)
,p_name=>'APEXIR_HELP_HIGHLIGHT'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\05DE\05D0\05E4\05E9\05E8 \05DC\05DA \05DC\05D4\05D2\05D3\05D9\05E8 \05DE\05E1\05E0\05DF. \05D4\05E9\05D5\05E8\05D5\05EA \05D4\05E2\05D5\05E0\05D5\05EA \05E2\05DC \05E7\05E8\05D9\05D8\05E8\05D9\05D5\05E0\05D9 \05D4\05E1\05D9\05E0\05D5\05DF \05DE\05D5\05E6\05D2\05D5\05EA \05DB\05E9\05D4\05DF \05DE\05D5\05D3\05D2\05E9\05D5\05EA \05D1\05D0\05DE\05E6\05E2\05D5\05EA \05D4\05DE\05D0\05E4\05D9\05D9\05E0\05D9\05DD \05D4\05E7\05E9\05D5\05E8\05D9\05DD \05DC\05DE\05E1\05E0\05DF. \05D4\05D0\05E4\05E9\05E8\05D5\05D9\05D5\05EA \05D4\05DF:</p>'),
'<ul>',
unistr('<li><strong>\05E9\05DD</strong> \05DE\05E9\05DE\05E9 \05DC\05EA\05E6\05D5\05D2\05D4 \05D1\05DC\05D1\05D3.</li>'),
unistr('<li><strong>\05E8\05E6\05E3</strong> \05DE\05D6\05D4\05D4 \05D0\05EA \05E8\05E6\05E3 \05D4\05E2\05E8\05DB\05EA \05D4\05DB\05DC\05DC\05D9\05DD.</li>'),
unistr('<li><strong>\05D0\05E4\05E9\05E8\05D9</strong> \05DE\05D6\05D4\05D4 \05D0\05DD \05DB\05DC\05DC \05D0\05E4\05E9\05E8\05D9 \05D0\05D5 \05D7\05E1\05D5\05DD.</li>'),
unistr('<li><strong>\05E1\05D5\05D2 \05D4\05D3\05D2\05E9\05D4</strong> \05DE\05D6\05D4\05D4 \05D0\05DD \05E9\05D5\05E8\05D4 \05D0\05D5 \05EA\05D0 \05D0\05DE\05D5\05E8\05D9\05DD \05DC\05D4\05D9\05D5\05EA'),
unistr('\05DE\05D5\05D3\05D2\05E9\05D9\05DD. \05D0\05DD \05E0\05D1\05D7\05E8 \05EA\05D0, \05D0\05D6\05D9 \05D4\05E2\05DE\05D5\05D3\05D4 \05E9\05D0\05DC\05D9\05D4 \05D9\05E9 \05D4\05E4\05E0\05D9\05D4'),
unistr('\05D1\05EA\05E0\05D0\05D9 \05D4\05D4\05D3\05D2\05E9\05D4, \05D4\05D9\05D0 \05D4\05DE\05D5\05D3\05D2\05E9\05EA.</li>'),
unistr('<li><strong>\05E6\05D1\05E2 \05E8\05E7\05E2</strong> \05D4\05D5\05D0 \05D4\05E6\05D1\05E2 \05D4\05D7\05D3\05E9 \05DC\05E8\05E7\05E2 \05E9\05DC \05D4\05D0\05D6\05D5\05E8 \05D4\05DE\05D5\05D3\05D2\05E9.</li>'),
unistr('<li><strong>\05E6\05D1\05E2 \05D8\05E7\05E1\05D8</strong> \05D4\05D5\05D0 \05D4\05E6\05D1\05E2 \05E9\05DC \05D4\05D8\05E7\05E1\05D8 \05D1\05D0\05D6\05D5\05E8 \05D4\05DE\05D5\05D3\05D2\05E9.</li>'),
unistr('<li><strong>\05EA\05E0\05D0\05D9 \05D4\05D3\05D2\05E9\05D4</strong>  \05DE\05D2\05D3\05D9\05E8 \05D0\05EA \05EA\05E0\05D0\05D9 \05D4\05E1\05D9\05E0\05D5\05DF \05E9\05DC\05DA.</li>'),
'</ul>',
''))
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139038592060751323)
,p_name=>'APEXIR_HELP_PIVOT'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\05EA\05D5\05DB\05DC \05DC\05D4\05D2\05D3\05D9\05E8 \05EA\05E6\05D5\05D2\05EA \05E6\05D9\05E8 \05D0\05D7\05EA \05DC\05DB\05DC \05D3\05D5\05D7 \05E9\05E0\05E9\05DE\05E8. \05DC\05D0\05D7\05E8 \05E9\05D4\05D2\05D3\05E8\05EA, \05EA\05D5\05DB\05DC \05DC\05D4\05D7\05DC\05D9\05E3 \05D1\05D9\05DF \05EA\05E6\05D5\05D2\05EA \05D4\05E6\05D9\05E8 \05DC\05EA\05E6\05D5\05D2\05EA \05D4\05D3\05D5\05D7 \05D1\05D0\05DE\05E6\05E2\05D5\05EA \05D0\05D9\05E7\05D5\05E0\05D9 \05EA\05E6\05D5\05D2\05D4 \05D1\05E1\05E8\05D2\05DC \05D4\05D7\05D9\05E4\05D5\05E9. \05DC\05D9\05E6\05D9\05E8\05EA \05EA\05E6\05D5\05D2\05EA \05E6\05D9\05E8, \05D1\05D7\05E8 \05D0\05EA: '),
'<p></p>',
'<ul>',
unistr('<li>\05D4\05E2\05DE\05D5\05D3\05D5\05EA \05E9\05E2\05DC\05D9\05D4\05DF \05D9\05E9 \05DC\05D1\05E0\05D5\05EA \05E6\05D9\05E8</li>'),
unistr('<li>\05D4\05E2\05DE\05D5\05D3\05D5\05EA \05E9\05D9\05E9 \05DC\05D4\05E6\05D9\05D2 \05DB\05E9\05D5\05E8\05D5\05EA</li>'),
unistr('<li>\05D4\05E2\05DE\05D5\05D3\05D5\05EA \05DC\05E1\05DB\05D9\05DE\05D4 \05D1\05D9\05D7\05D3 \05E2\05DD \05D4\05E4\05D5\05E0\05E7\05E6\05D9\05D4 \05E9\05D9\05E9 \05DC\05D1\05E6\05E2 (\05DE\05DE\05D5\05E6\05E2, \05E1\05D9\05DB\05D5\05DD, \05E1\05E4\05D9\05E8\05D4 \05D5\05DB\05D5'')</li>'),
'</ul>'))
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139156274967751358)
,p_name=>'APEXIR_HELP_REPORT_SETTINGS'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\05D0\05DD \05EA\05D1\05E6\05E2 \05D4\05EA\05D0\05DE\05D4 \05D0\05D9\05E9\05D9\05EA \05E9\05DC \05D3\05D5\05D7 \05D0\05D9\05E0\05D8\05E8\05D0\05E7\05D8\05D9\05D1\05D9, \05D4\05D2\05D3\05E8\05D5\05EA \05D4\05D3\05D5\05D7 \05D9\05D5\05E6\05D2\05D5'),
unistr('\05DE\05EA\05D7\05EA \05DC\05E1\05E8\05D2\05DC \05D4\05D7\05D9\05E4\05D5\05E9 \05D5\05DE\05E2\05DC \05D4\05D3\05D5\05D7. \05D0\05D6\05D5\05E8 \05D6\05D4 \05E0\05D9\05EA\05DF \05DC\05DB\05D9\05D5\05D5\05E5 \05D5\05DC\05D4\05E8\05D7\05D1\05D4 \05D1\05D0\05DE\05E6\05E2\05D5\05EA \05D4\05D0\05D9\05E7\05D5\05DF \05E9\05DE\05E9\05DE\05D0\05DC.'),
'<p>',
unistr('\05DC\05DB\05DC \05D4\05D2\05D3\05E8\05EA \05D3\05D5\05D7, \05EA\05D5\05DB\05DC \05DC\05E2\05E9\05D5\05EA \05D0\05EA \05D4\05D3\05D1\05E8\05D9\05DD \05D4\05D1\05D0\05D9\05DD:'),
'</p><ul>',
unistr('<li>\05DC\05E2\05E8\05D5\05DA \05D4\05D2\05D3\05E8\05D4 \05E2\05DC-\05D9\05D3\05D9 \05DC\05D7\05D9\05E6\05D4 \05E2\05DC \05D4\05E9\05DD.</li>'),
unistr('<li>\05DC\05D0\05E4\05E9\05E8 \05D0\05D5 \05DC\05D7\05E1\05D5\05DD \05D4\05D2\05D3\05E8\05D4 \05E2\05DC-\05D9\05D3\05D9 \05E1\05D9\05DE\05D5\05DF \05D0\05D5 \05D1\05D9\05D8\05D5\05DC \05D4\05E1\05D9\05DE\05D5\05DF \05D1\05EA\05D9\05D1\05EA \05D4\05EA\05D9\05D5\05D2 ''\05D0\05E4\05E9\05E8/\05D7\05E1\05D5\05DD''. \05D4\05E9\05EA\05DE\05E9 \05D1\05E4\05E7\05D3 \05D6\05D4 \05DB\05D3\05D9 \05DC\05D4\05E4\05E2\05D9\05DC \05D0\05D5 \05DC\05DB\05D1\05D5\05EA \05D4\05D2\05D3\05E8\05D4 \05D1\05D0\05D5\05E4\05DF \05D6\05DE\05E0\05D9.</li>'),
unistr('<li>\05DC\05D4\05E1\05D9\05E8 \05D4\05D2\05D3\05E8\05D4 \05E2\05DC-\05D9\05D3\05D9 \05DC\05D7\05D9\05E6\05D4 \05E2\05DC \05D0\05D9\05E7\05D5\05DF \05D4\05D4\05E1\05E8\05D4.</li>'),
'</ul>',
unistr('<p>\05D0\05DD \05D9\05E6\05E8\05EA \05EA\05E8\05E9\05D9\05DD, \05E7\05D1\05D5\05E6\05D4 \05D0\05D5 \05E6\05D9\05E8, \05EA\05D5\05DB\05DC \05DC\05D4\05D7\05DC\05D9\05E3 \05D1\05D9\05E0\05D9\05D4\05DD'),
unistr('\05DC\05D1\05D9\05DF \05D3\05D5\05D7 \05D4\05D1\05E1\05D9\05E1 \05D1\05D0\05DE\05E6\05E2\05D5\05EA \05D4\05E7\05D9\05E9\05D5\05E8\05D9\05DD \05DC\05EA\05E6\05D5\05D2\05EA \05D3\05D5\05D7, \05EA\05E6\05D5\05D2\05EA \05EA\05E8\05E9\05D9\05DD, \05EA\05E6\05D5\05D2\05EA ''\05E7\05D1\05E5 \05DC\05E4\05D9'' \05D5\05EA\05E6\05D5\05D2\05EA \05E6\05D9\05E8, \05D4\05DE\05D5\05E6\05D2\05D9\05DD \05DE\05D9\05DE\05D9\05DF. \05D0\05DD \05EA\05E6\05D9\05D2 \05D0\05EA \05D4\05EA\05E8\05E9\05D9\05DD, ''\05E7\05D1\05E5 \05DC\05E4\05D9'' \05D0\05D5 \05E6\05D9\05E8,'),
unistr('\05EA\05D5\05DB\05DC \05D2\05DD \05DC\05D4\05E9\05EA\05DE\05E9 \05D1\05E7\05D9\05E9\05D5\05E8 \05D4\05E2\05E8\05D9\05DB\05D4 \05DB\05D3\05D9 \05DC\05E2\05E8\05D5\05DA \05D0\05EA \05D4\05D4\05D2\05D3\05E8\05D5\05EA.</p>'),
''))
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139145761775751355)
,p_name=>'APEXIR_HELP_RESET'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D0\05E4\05E1 \05D0\05EA \05D4\05D3\05D5\05D7 \05D7\05D6\05E8\05D4 \05DC\05D4\05D2\05D3\05E8\05D5\05EA \05D1\05E8\05D9\05E8\05EA \05D4\05DE\05D7\05D3\05DC, \05D5\05DE\05E1\05D9\05E8 \05D0\05EA \05DB\05DC \05D4\05D4\05EA\05D0\05DE\05D5\05EA \05D4\05D0\05D9\05E9\05D9\05D5\05EA \05E9\05D1\05E6\05E2\05EA.')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139210452767751374)
,p_name=>'APEXIR_HELP_ROWS_PER_PAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D2\05D3\05E8 \05D0\05EA \05DE\05E1\05E4\05E8 \05D4\05E8\05E9\05D5\05DE\05D5\05EA \05DC\05EA\05E6\05D5\05D2\05D4 \05D1\05DB\05DC \05D3\05E3.')
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139145622848751355)
,p_name=>'APEXIR_HELP_SAVE_REPORT'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\05E9\05D5\05DE\05E8 \05D0\05EA \05D4\05D3\05D5\05D7\05D5\05EA \05D4\05DE\05D5\05EA\05D0\05DE\05D9\05DD \05D0\05D9\05E9\05D9\05EA \05DC\05E9\05D9\05DE\05D5\05E9 \05E2\05EA\05D9\05D3\05D9. \05EA\05D5\05DB\05DC \05DC\05E1\05E4\05E7 \05E9\05DD, \05DC\05E1\05E4\05E7 \05EA\05D9\05D0\05D5\05E8 \05D0\05D5\05E4\05E6\05D9\05D5\05E0\05DC\05D9, \05D5\05DC\05D4\05E4\05D5\05DA \05D0\05EA \05D4\05D3\05D5\05D7 \05DC\05E0\05D2\05D9\05E9 \05DC\05E6\05D9\05D1\05D5\05E8 (\05DB\05DC\05D5\05DE\05E8, \05DB\05DC \05D4\05DE\05E9\05EA\05DE\05E9\05D9\05DD \05D9\05D5\05DB\05DC\05D5 \05DC\05D2\05E9\05EA \05DC\05D1\05E8\05D9\05E8\05EA \05D4\05DE\05D7\05D3\05DC \05D4\05E8\05D0\05E9\05D9\05EA \05E9\05DC \05D3\05D5\05D7 \05D6\05D4). \05EA\05D5\05DB\05DC \05DC\05E9\05DE\05D5\05E8 \05D0\05E8\05D1\05E2\05D4 \05E1\05D5\05D2\05D9\05DD \05E9\05DC \05D3\05D5\05D7\05D5\05EA \05D0\05D9\05E0\05D8\05E8\05D0\05E7\05D8\05D9\05D1\05D9\05D9\05DD:</p>'),
'<ul>',
unistr('<li><strong>\05D1\05E8\05D9\05E8\05EA \05DE\05D7\05D3\05DC \05E8\05D0\05E9\05D9\05EA</strong> (\05DE\05E4\05EA\05D7 \05D1\05DC\05D1\05D3). \05D1\05E8\05D9\05E8\05EA \05D4\05DE\05D7\05D3\05DC \05D4\05E8\05D0\05E9\05D9\05EA \05D4\05D9\05D0 \05D4\05D3\05D5\05D7 \05D4\05DE\05D5\05E6\05D2 \05D4\05E8\05D0\05E9\05D5\05DF. \05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05E9\05E0\05D5\05EA \05E9\05DD \05D0\05D5 \05DC\05DE\05D7\05D5\05E7 \05D1\05E8\05D9\05E8\05D5\05EA \05DE\05D7\05D3\05DC \05E8\05D0\05E9\05D9\05D5\05EA \05E9\05DC \05D3\05D5\05D7.</li>'),
unistr('<li><strong>\05D3\05D5\05D7 \05D7\05DC\05D5\05E4\05D9</strong> (\05DE\05E4\05EA\05D7 \05D1\05DC\05D1\05D3). \05DE\05D0\05E4\05E9\05E8 \05DC\05DE\05E4\05EA\05D7\05D9\05DD \05DC\05D9\05E6\05D5\05E8 \05DE\05E1\05E4\05E8 \05DE\05EA\05D5\05D5\05D9\05DD \05E9\05DC \05D3\05D5\05D7. \05E8\05E7 \05DE\05E4\05EA\05D7\05D9\05DD \05D9\05DB\05D5\05DC\05D9\05DD \05DC\05E9\05DE\05D5\05E8, \05DC\05E9\05E0\05D5\05EA \05E9\05DD \05D0\05D5 \05DC\05DE\05D7\05D5\05E7 \05D3\05D5\05D7 \05D7\05DC\05D5\05E4\05D9.</li>'),
unistr('<li><strong>\05D3\05D5\05D7 \05E6\05D9\05D1\05D5\05E8\05D9</strong> (\05DE\05E9\05EA\05DE\05E9 \05E7\05E6\05D4). \05DE\05E9\05EA\05DE\05E9 \05D4\05E7\05E6\05D4 \05E9\05D9\05E6\05E8 \05D0\05D5\05EA\05D5 \05D9\05DB\05D5\05DC \05DC\05E9\05DE\05D5\05E8, \05DC\05E9\05E0\05D5\05EA \05E9\05DD \05D0\05D5 \05DC\05DE\05D7\05D5\05E7 \05D0\05D5\05EA\05D5. \05DE\05E9\05EA\05DE\05E9\05D9\05DD \05D0\05D7\05E8\05D9\05DD \05D9\05DB\05D5\05DC\05D9\05DD \05DC\05D4\05E6\05D9\05D2 \05D5\05DC\05E9\05DE\05D5\05E8 \05D0\05EA \05D4\05DE\05EA\05D5\05D5\05D4 \05DB\05D3\05D5\05D7 \05E0\05D5\05E1\05E3.</li>'),
unistr('<li><strong>\05D3\05D5\05D7 \05E4\05E8\05D8\05D9</strong> (\05DE\05E9\05EA\05DE\05E9 \05E7\05E6\05D4). \05E8\05E7 \05DE\05E9\05EA\05DE\05E9 \05D4\05E7\05E6\05D4 \05E9\05D9\05E6\05E8 \05D0\05EA \05D4\05D3\05D5\05D7 \05D9\05DB\05D5\05DC \05DC\05D4\05E6\05D9\05D2, \05DC\05E9\05DE\05D5\05E8, \05DC\05E9\05E0\05D5\05EA \05E9\05DD \05D0\05D5 \05DC\05DE\05D7\05D5\05E7 \05D0\05EA \05D4\05D3\05D5\05D7.</li>'),
'</ul>',
unistr('<p>\05D0\05DD \05EA\05E9\05DE\05D5\05E8 \05D3\05D5\05D7\05D5\05EA \05DE\05D5\05EA\05D0\05DE\05D9\05DD \05D0\05D9\05E9\05D9\05EA, \05D9\05D5\05E6\05D2 \05D1\05D5\05E8\05E8 \05D3\05D5\05D7\05D5\05EA \05D1\05E1\05E8\05D2\05DC \05D4\05D7\05D9\05E4\05D5\05E9 \05E9\05DE\05E9\05DE\05D0\05DC \05DC\05D1\05D5\05E8\05E8 \05D4\05E9\05D5\05E8\05D5\05EA (\05DE\05D0\05E4\05D9\05D9\05DF \05D6\05D4 \05D0\05E4\05E9\05E8\05D9).</p>'),
''))
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139144654856751355)
,p_name=>'APEXIR_HELP_SEARCH_BAR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05E8\05D0\05E9 \05DB\05DC \05D3\05E3 \05E9\05DC \05D3\05D5\05D7 \05E0\05DE\05E6\05D0 \05D0\05D6\05D5\05E8 \05D7\05D9\05E4\05D5\05E9. \05D0\05D6\05D5\05E8 (\05D0\05D5 \05E1\05E8\05D2\05DC \05D7\05D9\05E4\05D5\05E9) \05D6\05D4 \05DE\05E1\05E4\05E7 \05D0\05EA \05D4\05DE\05D0\05E4\05D9\05D9\05E0\05D9\05DD \05D4\05D1\05D0\05D9\05DD:')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139211079685751375)
,p_name=>'APEXIR_HELP_SEARCH_BAR_ACTIONS_MENU'
,p_message_language=>'he'
,p_message_text=>unistr('<li><strong>\05EA\05E4\05E8\05D9\05D8 \05E4\05E2\05D5\05DC\05D5\05EA</strong> \05DE\05D0\05E4\05E9\05E8 \05DC\05DA \05DC\05D1\05E6\05E2 \05D4\05EA\05D0\05DE\05D4 \05D0\05D9\05E9\05D9\05EA \05E9\05DC \05D3\05D5\05D7. \05E2\05D9\05D9\05DF \05D1\05E4\05E8\05E7\05D9\05DD \05D4\05D1\05D0\05D9\05DD.</li>')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139210502744751374)
,p_name=>'APEXIR_HELP_SEARCH_BAR_FINDER'
,p_message_language=>'he'
,p_message_text=>unistr('<li><strong>\05D0\05D9\05E7\05D5\05DF \05D1\05D7\05D9\05E8\05EA \05E2\05DE\05D5\05D3\05D5\05EA</strong> \05DE\05D0\05E4\05E9\05E8 \05DC\05DA \05DC\05D6\05D4\05D5\05EA \05D1\05D0\05D9\05D6\05D5 \05E2\05DE\05D5\05D3\05D4 \05DC\05D7\05E4\05E9 (\05D0\05D5 \05DB\05D5\05DC\05DF).</li>')
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139210838606751375)
,p_name=>'APEXIR_HELP_SEARCH_BAR_REPORTS'
,p_message_language=>'he'
,p_message_text=>unistr('<li><strong>\05D3\05D5\05D7\05D5\05EA</strong> \05DE\05E6\05D9\05D2 \05D1\05E8\05D9\05E8\05EA \05DE\05D7\05D3\05DC \05D7\05DC\05D5\05E4\05D9\05EA \05D5\05D3\05D5\05D7\05D5\05EA \05E4\05E8\05D8\05D9\05D9\05DD \05D0\05D5 \05E6\05D9\05D1\05D5\05E8\05D9\05D9\05DD \05E9\05DE\05D5\05E8\05D9\05DD.</li>')
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139210767058751375)
,p_name=>'APEXIR_HELP_SEARCH_BAR_ROWS'
,p_message_language=>'he'
,p_message_text=>unistr('<li><strong>\05E9\05D5\05E8\05D5\05EA</strong> \05DE\05D2\05D3\05D9\05E8 \05D0\05EA \05DE\05E1\05E4\05E8 \05D4\05E8\05E9\05D5\05DE\05D5\05EA \05DC\05EA\05E6\05D5\05D2\05D4 \05D1\05DB\05DC \05D3\05E3.</li>')
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139210651037751375)
,p_name=>'APEXIR_HELP_SEARCH_BAR_TEXTBOX'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<li><strong>\05D0\05D6\05D5\05E8 \05D8\05E7\05E1\05D8</strong> \05DE\05D0\05E4\05E9\05E8 \05DC\05DA \05DC\05D4\05D6\05D9\05DF \05E7\05E8\05D9\05D8\05E8\05D9\05D5\05E0\05D9 \05D7\05D9\05E4\05D5\05E9 \05E8\05D2\05D9\05E9\05D9\05DD \05DC\05D0\05D5\05EA\05D9\05D5\05EA \05E8\05D9\05E9\05D9\05D5\05EA (\05EA\05D5\05D5\05D9\05DD \05DB\05DC\05DC\05D9\05D9\05DD \05D4\05DD \05DE\05E8\05D5\05DE\05D6\05D9\05DD).</li>'),
unistr('<li><strong>\05DC\05D7\05E6\05DF \05D1\05D9\05E6\05D5\05E2</strong> \05DE\05D1\05E6\05E2 \05D0\05EA \05D4\05D7\05D9\05E4\05D5\05E9. \05D2\05DD \05D4\05E7\05E9\05D4 \05E2\05DC \05DE\05E7\05E9 enter \05EA\05D1\05E6\05E2 \05D0\05EA \05D4\05D7\05D9\05E4\05D5\05E9 \05DB\05D0\05E9\05E8 \05D4\05E1\05DE\05DF \05E0\05DE\05E6\05D0 \05D1\05D0\05D6\05D5\05E8 \05D8\05E7\05E1\05D8 \05D4\05D7\05D9\05E4\05D5\05E9.</li>')))
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139210915365751375)
,p_name=>'APEXIR_HELP_SEARCH_BAR_VIEW'
,p_message_language=>'he'
,p_message_text=>unistr('<li><strong>\05D0\05D9\05E7\05D5\05E0\05D9 \05EA\05E6\05D5\05D2\05D4</strong> \05DE\05D7\05DC\05D9\05E3 \05D1\05D9\05DF \05D4\05EA\05E6\05D5\05D2\05D5\05EA \05E9\05DC \05D4\05D0\05D9\05E7\05D5\05DF, \05D3\05D5\05D7, \05E4\05D9\05E8\05D5\05D8, \05EA\05E8\05E9\05D9\05DD, ''\05E7\05D1\05E5 \05DC\05E4\05D9'' \05D5\05E6\05D9\05E8 \05E9\05DC \05D4\05D3\05D5\05D7, \05D0\05DD \05D4\05D5\05D2\05D3\05E8\05D5.</li>')
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139144840000751355)
,p_name=>'APEXIR_HELP_SELECT_COLUMNS'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E9\05DE\05E9 \05DC\05E9\05D9\05E0\05D5\05D9 \05D4\05E2\05DE\05D5\05D3\05D5\05EA \05D4\05DE\05D5\05E6\05D2\05D5\05EA. \05D4\05E2\05DE\05D5\05D3\05D5\05EA \05D1\05E6\05D3 \05D9\05DE\05D9\05DF \05DE\05D5\05E6\05D2\05D5\05EA. \05D4\05E2\05DE\05D5\05D3\05D5\05EA \05D1\05E6\05D3 \05E9\05DE\05D0\05DC \05E0\05E1\05EA\05E8\05D5\05EA. \05EA\05D5\05DB\05DC \05DC\05E1\05D3\05E8 \05DE\05D7\05D3\05E9 \05D0\05EA \05D4\05E2\05DE\05D5\05D3\05D5\05EA \05D4\05DE\05D5\05E6\05D2\05D5\05EA \05D1\05D0\05DE\05E6\05E2\05D5\05EA \05D4\05D7\05E6\05D9\05DD \05D1\05E7\05E6\05D4 \05D4\05D9\05DE\05E0\05D9. \05E2\05DE\05D5\05D3\05D5\05EA \05DE\05D7\05D5\05E9\05D1\05D5\05EA \05DE\05D5\05E6\05D2\05D5\05EA \05E2\05DD \05D4\05EA\05D7\05D9\05DC\05D9\05EA <strong>**</strong>.')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139145039435751355)
,p_name=>'APEXIR_HELP_SORT'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\05DE\05E9\05DE\05E9 \05DC\05E9\05D9\05E0\05D5\05D9 \05D4\05E2\05DE\05D5\05D3\05D5\05EA \05E9\05D0\05D5\05EA\05DF \05DE\05DE\05D9\05D9\05E0\05D9\05DD \05D5\05E7\05D5\05D1\05E2 \05D0\05DD'),
unistr('\05DC\05DE\05D9\05D9\05DF \05D1\05E1\05D3\05E8 \05E2\05D5\05DC\05D4 \05D0\05D5 \05D1\05E1\05D3\05E8 \05D9\05D5\05E8\05D3. \05EA\05D5\05DB\05DC \05D2\05DD \05DC\05E6\05D9\05D9\05DF \05DB\05D9\05E6\05D3 \05DC\05D8\05E4\05DC \05D1\05E2\05E8\05DB\05D9'),
unistr('<code>NULL</code>. \05D4\05D2\05D3\05E8\05EA \05D1\05E8\05D9\05E8\05EA \05D4\05DE\05D7\05D3\05DC \05DE\05E6\05D9\05D2\05D4 \05E2\05E8\05DB\05D9 <code>NULL</code> \05EA\05DE\05D9\05D3 \05D0\05D7\05E8\05D5\05E0\05D9\05DD \05D0\05D5 \05EA\05DE\05D9\05D3 \05E8\05D0\05E9\05D5\05E0\05D9\05DD. \05D4\05DE\05D9\05D5\05DF \05D4\05E0\05D5\05D1\05E2 \05DE\05D5\05E6\05D2 \05D1\05E6\05D3 \05D9\05DE\05D9\05DF \05E9\05DC'),
unistr('\05DB\05D5\05EA\05E8\05D5\05EA \05D4\05E2\05DE\05D5\05D3\05D4 \05D1\05D3\05D5\05D7.</p>')))
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139208114303751374)
,p_name=>'APEXIR_HELP_SUBSCRIPTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05E9\05DE\05D5\05E1\05D9\05E4\05D9\05DD \05DE\05E0\05D5\05D9, \05DE\05E1\05E4\05E7\05D9\05DD \05DB\05EA\05D5\05D1\05EA \05D3\05D5\05D0"\05DC (\05D0\05D5 \05DE\05E1\05E4\05E8 \05DB\05EA\05D5\05D1\05D5\05EA \05D3\05D5\05D0"\05DC \05D4\05DE\05D5\05E4\05E8\05D3\05D5\05EA \05D1\05E4\05E1\05D9\05E7\05D9\05DD), \05E0\05D5\05E9\05D0 \05D4\05D5\05D3\05E2\05EA \05D3\05D5\05D0"\05DC, \05EA\05D3\05D9\05E8\05D5\05EA, \05D5\05EA\05D0\05E8\05D9\05DB\05D9 \05D4\05EA\05D7\05DC\05D4 \05D5\05E1\05D9\05D5\05DD. \05D4\05D5\05D3\05E2\05D5\05EA \05D4\05D3\05D5\05D0"\05DC \05D4\05E0\05D5\05D1\05E2\05D5\05EA \05DB\05D5\05DC\05DC\05D5\05EA \05D2\05E8\05E1\05D4 \05DE\05D9\05D5\05E6\05D0\05EA (PDF, Excel, HTML \05D0\05D5 CSV) \05E9\05DC \05D4\05D3\05D5\05D7 \05D4\05D0\05D9\05E0\05D8\05E8\05D0\05E7\05D8\05D9\05D1\05D9, \05E9\05DE\05DB\05D9\05DC\05D4 \05D0\05EA \05D4\05E0\05EA\05D5\05E0\05D9\05DD \05D4\05E0\05D5\05DB\05D7\05D9\05D9\05DD \05E2\05DC-\05E4\05D9 \05D4\05D2\05D3\05E8\05EA')
||unistr(' \05D4\05D3\05D5\05D7 \05E9\05D4\05D9\05D9\05EA\05D4 \05DB\05D0\05E9\05E8 \05E9\05D4\05DE\05E0\05D5\05D9 \05D4\05EA\05D5\05D5\05E1\05E3.')
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139149747327751356)
,p_name=>'APEXIR_HIDE_COLUMN'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05EA\05E8 \05E2\05DE\05D5\05D3\05D4')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139140156128751354)
,p_name=>'APEXIR_HIGHLIGHT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D3\05D2\05E9')
,p_is_js_message=>true
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139151251666751357)
,p_name=>'APEXIR_HIGHLIGHTS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D3\05D2\05E9\05D5\05EA')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139121407034751348)
,p_name=>'APEXIR_HIGHLIGHT_CELL_WITH_COLORS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D3\05D2\05E9 \05EA\05D0, %0 \05D1-%1')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139156303168751358)
,p_name=>'APEXIR_HIGHLIGHT_CONDITION'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05E0\05D0\05D9 \05D4\05D3\05D2\05E9\05D4')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139121382365751348)
,p_name=>'APEXIR_HIGHLIGHT_ROW_WITH_COLORS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D3\05D2\05E9 \05E9\05D5\05E8\05D4, %0 \05D1-%1')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139208733138751374)
,p_name=>'APEXIR_HIGHLIGHT_STYLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D2\05E0\05D5\05DF \05D4\05D3\05D2\05E9\05D4')
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139112967200751346)
,p_name=>'APEXIR_HIGHLIGHT_TYPE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D5\05D2 \05D4\05D3\05D2\05E9\05D4')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139227513744751380)
,p_name=>'APEXIR_HORIZONTAL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D5\05E4\05E7\05D9')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139256566468751388)
,p_name=>'APEXIR_INACTIVE_SETTING'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D2\05D3\05E8\05D4 \05DC\05D0 \05E4\05E2\05D9\05DC\05D4 \05D0\05D7\05EA')
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139256613017751388)
,p_name=>'APEXIR_INACTIVE_SETTINGS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D4\05D2\05D3\05E8\05D5\05EA \05DC\05D0 \05E4\05E2\05D9\05DC\05D5\05EA')
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139146314401751355)
,p_name=>'APEXIR_INTERACTIVE_REPORT_HELP'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D6\05E8\05D4 \05DC\05D3\05D5\05D7 \05D0\05D9\05E0\05D8\05E8\05D0\05E7\05D8\05D9\05D1\05D9')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139157318025751359)
,p_name=>'APEXIR_INVALID'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05EA\05E7\05E3')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139150767196751357)
,p_name=>'APEXIR_INVALID_COMPUTATION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D9\05D8\05D5\05D9 \05D7\05D9\05E9\05D5\05D1 \05DC\05D0 \05EA\05E7\05E3. %0')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139106356326751344)
,p_name=>'APEXIR_INVALID_END_DATE'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D0\05E8\05D9\05DA \05D4\05E1\05D9\05D5\05DD \05D7\05D9\05D9\05D1 \05DC\05D4\05D9\05D5\05EA \05DE\05D0\05D5\05D7\05E8 \05DE\05EA\05D0\05E8\05D9\05DA \05D4\05D4\05EA\05D7\05DC\05D4.')
,p_version_scn=>2704865
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139165548012751361)
,p_name=>'APEXIR_INVALID_FILTER'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D9\05D8\05D5\05D9 \05E1\05D9\05E0\05D5\05DF \05DC\05D0 \05EA\05E7\05E3. %0')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139235311897751382)
,p_name=>'APEXIR_INVALID_FILTER_QUERY'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D0\05D9\05DC\05EA\05EA \05DE\05E1\05E0\05DF \05DC\05D0 \05EA\05E7\05E4\05D4')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139256794044751388)
,p_name=>'APEXIR_INVALID_SETTING'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D2\05D3\05E8\05D4 \05DC\05D0 \05EA\05E7\05E4\05D4 \05D0\05D7\05EA')
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139256864939751388)
,p_name=>'APEXIR_INVALID_SETTINGS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D4\05D2\05D3\05E8\05D5\05EA \05DC\05D0 \05EA\05E7\05E4\05D5\05EA')
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139208904824751374)
,p_name=>'APEXIR_IN_MINUTES'
,p_message_language=>'he'
,p_message_text=>unistr('(\05D1\05D3\05E7\05D5\05EA)')
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139225986916751379)
,p_name=>'APEXIR_IS_IN_THE_LAST'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D7\05DC \05D1-%1 \05D4\05D0\05D7\05E8\05D5\05E0\05D9\05DD')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139226174069751379)
,p_name=>'APEXIR_IS_IN_THE_NEXT'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D7\05DC \05D1-%1 \05D4\05D1\05D0\05D9\05DD')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139226002212751379)
,p_name=>'APEXIR_IS_NOT_IN_THE_LAST'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05DC\05D0 \05D7\05DC \05D1-%1 \05D4\05D0\05D7\05E8\05D5\05E0\05D9\05DD')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139226294874751379)
,p_name=>'APEXIR_IS_NOT_IN_THE_NEXT'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05DC\05D0 \05D7\05DC \05D1-%1 \05D4\05D1\05D0\05D9\05DD')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139155412520751358)
,p_name=>'APEXIR_KEYPAD'
,p_message_language=>'he'
,p_message_text=>'KeyPad'
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139119199835751347)
,p_name=>'APEXIR_LABEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D5\05D5\05D9\05EA %0')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139149371108751356)
,p_name=>'APEXIR_LABEL_AXIS_TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D5\05EA\05E8\05EA \05E6\05D9\05E8 \05DC\05EA\05D5\05D5\05D9\05EA')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139141605213751354)
,p_name=>'APEXIR_LAST_DAY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D9\05D5\05DD \05D4\05D0\05D7\05E8\05D5\05DF')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139141802291751354)
,p_name=>'APEXIR_LAST_HOUR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E9\05E2\05D4 \05D4\05D0\05D7\05E8\05D5\05E0\05D4')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139141335015751354)
,p_name=>'APEXIR_LAST_MONTH'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05D5\05D3\05E9 \05E9\05E2\05D1\05E8')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139141432253751354)
,p_name=>'APEXIR_LAST_WEEK'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05E9\05D1\05D5\05E2 \05E9\05E2\05D1\05E8')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139141530056751354)
,p_name=>'APEXIR_LAST_X_DAYS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D4\05D9\05DE\05D9\05DD \05D4\05D0\05D7\05E8\05D5\05E0\05D9\05DD')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139141756524751354)
,p_name=>'APEXIR_LAST_X_HOURS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D4\05E9\05E2\05D5\05EA \05D4\05D0\05D7\05E8\05D5\05E0\05D5\05EA')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139141157502751354)
,p_name=>'APEXIR_LAST_X_YEARS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D4\05E9\05E0\05D9\05DD \05D4\05D0\05D7\05E8\05D5\05E0\05D5\05EA')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139141212499751354)
,p_name=>'APEXIR_LAST_YEAR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05E9\05E0\05D4 \05E9\05E2\05D1\05E8\05D4')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139119022423751347)
,p_name=>'APEXIR_LINE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D5')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139115832908751346)
,p_name=>'APEXIR_LINE_WITH_AREA'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D5 \05E2\05DD \05E9\05D8\05D7')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139235297493751382)
,p_name=>'APEXIR_MAP_IT'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E4\05D4 \05D6\05D0\05EA')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139150291362751357)
,p_name=>'APEXIR_MAX_QUERY_COST'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DC \05E4\05D9 \05D4\05D4\05E2\05E8\05DB\05D4, \05D4\05E9\05D0\05D9\05DC\05EA\05D0 \05EA\05D7\05E8\05D5\05D2 \05DE\05DE\05E1\05E4\05E8 \05D4\05DE\05E9\05D0\05D1\05D9\05DD \05D4\05DE\05E8\05D1\05D9 \05D4\05DE\05D5\05EA\05E8. \05EA\05E7\05DF \05D0\05EA \05D4\05D2\05D3\05E8\05D5\05EA \05D4\05D3\05D5\05D7 \05D5\05E0\05E1\05D4 \05E9\05D5\05D1.')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139131685874751351)
,p_name=>'APEXIR_MAX_ROW_CNT'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E1\05E4\05E8 \05D4\05E9\05D5\05E8\05D5\05EA \05D4\05DE\05E8\05D1\05D9 \05DC\05D3\05D5\05D7 \05D6\05D4 \05D4\05D5\05D0 %0 \05E9\05D5\05E8\05D5\05EA. \05D4\05D7\05DC \05DE\05E1\05E0\05DF \05DB\05D3\05D9 \05DC\05E6\05DE\05E6\05DD \05D0\05EA \05DE\05E1\05E4\05E8 \05D4\05E8\05E9\05D5\05DE\05D5\05EA \05D1\05E9\05D0\05D9\05DC\05EA\05D0 \05E9\05DC\05DA.')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139235843486751382)
,p_name=>'APEXIR_MAX_X'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E8\05D1\05D9 %0')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139236064042751382)
,p_name=>'APEXIR_MEDIAN_X'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05E6\05D9\05D5\05DF %0')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139078394776751335)
,p_name=>'APEXIR_MESSAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05D3\05E2\05D4')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139135922752751352)
,p_name=>'APEXIR_MIN_AGO'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05E4\05E0\05D9 %0 \05D3\05E7\05D5\05EA')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139235932171751382)
,p_name=>'APEXIR_MIN_X'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D6\05E2\05E8\05D9 %0')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139234957103751382)
,p_name=>'APEXIR_MONTH'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D5\05D3\05E9')
,p_version_scn=>2704889
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139209307705751374)
,p_name=>'APEXIR_MONTHLY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D5\05D3\05E9\05D9')
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139148555685751356)
,p_name=>'APEXIR_MOVE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E2\05D1\05E8')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139148420639751356)
,p_name=>'APEXIR_MOVE_ALL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E2\05D1\05E8 \05D4\05DB\05DC')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139261651692751390)
,p_name=>'APEXIR_MULTIIR_PAGE_REGION_STATIC_ID_REQUIRED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D5\05D1\05D4 \05DC\05E6\05D9\05D9\05DF \05DE\05D6\05D4\05D4 \05E1\05D8\05D8\05D9 \05E9\05DC \05D0\05D6\05D5\05E8 \05DB\05D9\05D5\05D5\05DF \05E9\05D4\05D3\05E3 \05DE\05DB\05D9\05DC \05DE\05E1\05E4\05E8 \05D3\05D5\05D7\05D5\05EA \05D0\05D9\05E0\05D8\05E8\05D0\05E7\05D8\05D9\05D1\05D9\05D9\05DD.')
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139114567830751346)
,p_name=>'APEXIR_NAME'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DD ')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139144279044751355)
,p_name=>'APEXIR_NEW_AGGREGATION'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05DB\05D9\05DE\05D4 \05D7\05D3\05E9\05D4')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139257401345751388)
,p_name=>'APEXIR_NEW_CATEGORY_LABEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D8\05D2\05D5\05E8\05D9\05D4 \05D7\05D3\05E9\05D4')
,p_is_js_message=>true
,p_version_scn=>2704896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139144314454751355)
,p_name=>'APEXIR_NEW_COMPUTATION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D9\05E9\05D5\05D1 \05D7\05D3\05E9')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139139091681751353)
,p_name=>'APEXIR_NEXT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D1\05D0')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139142130793751354)
,p_name=>'APEXIR_NEXT_DAY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D9\05D5\05DD \05D4\05D1\05D0')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139141930216751354)
,p_name=>'APEXIR_NEXT_HOUR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E9\05E2\05D4 \05D4\05D1\05D0\05D4')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139142488115751354)
,p_name=>'APEXIR_NEXT_MONTH'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D7\05D5\05D3\05E9 \05D4\05D1\05D0')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139142309931751354)
,p_name=>'APEXIR_NEXT_WEEK'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E9\05D1\05D5\05E2 \05D4\05D1\05D0')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139142236599751354)
,p_name=>'APEXIR_NEXT_X_DAYS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D4\05D9\05DE\05D9\05DD \05D4\05D1\05D0\05D9\05DD')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139142051239751354)
,p_name=>'APEXIR_NEXT_X_HOURS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D4\05E9\05E2\05D5\05EA \05D4\05D1\05D0\05D5\05EA')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139142695808751354)
,p_name=>'APEXIR_NEXT_X_YEARS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D4\05E9\05E0\05D9\05DD \05D4\05D1\05D0\05D5\05EA')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139142551339751354)
,p_name=>'APEXIR_NEXT_YEAR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E9\05E0\05D4 \05D4\05D1\05D0\05D4')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139114865421751346)
,p_name=>'APEXIR_NO'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139157589219751359)
,p_name=>'APEXIR_NONE'
,p_message_language=>'he'
,p_message_text=>unistr('- \05DC\05DC\05D0 -')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139208515736751374)
,p_name=>'APEXIR_NOT_VALID_EMAIL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E0\05D4 \05DB\05EA\05D5\05D1\05EA \05D3\05D5\05D0"\05DC \05EA\05E7\05E4\05D4.')
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139080609790751336)
,p_name=>'APEXIR_NO_COLUMNS_SELECTED'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05D1\05D7\05E8\05D5 \05E2\05DE\05D5\05D3\05D5\05EA \05DC\05EA\05E6\05D5\05D2\05D4. \05D4\05E9\05EA\05DE\05E9 \05D1<strong>\05E2\05DE\05D5\05D3\05D5\05EA</strong> \05D1\05EA\05E4\05E8\05D9\05D8 \05D4\05E4\05E2\05D5\05DC\05D5\05EA \05DB\05D3\05D9 \05DC\05D4\05E4\05D5\05DA \05E2\05DE\05D5\05D3\05D5\05EA \05DC\05D2\05DC\05D5\05D9\05D5\05EA.')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139154049563751358)
,p_name=>'APEXIR_NULLS_ALWAYS_FIRST'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E8\05DB\05D9 Null \05EA\05DE\05D9\05D3 \05E8\05D0\05E9\05D5\05E0\05D9\05DD')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139153983283751358)
,p_name=>'APEXIR_NULLS_ALWAYS_LAST'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E8\05DB\05D9 Null \05EA\05DE\05D9\05D3 \05D0\05D7\05E8\05D5\05E0\05D9\05DD')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139154404985751358)
,p_name=>'APEXIR_NULL_SORTING'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D9\05D5\05DF Null %0')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139150811721751357)
,p_name=>'APEXIR_NUMERIC_FLASHBACK_TIME'
,p_message_language=>'he'
,p_message_text=>unistr('\05D6\05DE\05DF \05E4\05DC\05D0\05E9\05D1\05E7 \05E6\05E8\05D9\05DA \05DC\05D4\05D9\05D5\05EA \05DE\05E1\05E4\05E8\05D9.')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139150437019751357)
,p_name=>'APEXIR_NUMERIC_SEQUENCE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E8\05E6\05E3 \05E6\05E8\05D9\05DA \05DC\05D4\05D9\05D5\05EA \05DE\05E1\05E4\05E8\05D9.')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139154917564751358)
,p_name=>'APEXIR_OPERATOR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D5\05E4\05E8\05D8\05D5\05E8')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139113499510751346)
,p_name=>'APEXIR_ORANGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05EA\05D5\05DD')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139227456396751380)
,p_name=>'APEXIR_ORIENTATION'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D9\05D5\05D5\05DF')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139115399691751346)
,p_name=>'APEXIR_OTHER'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D7\05E8')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139081555330751336)
,p_name=>'APEXIR_PAGINATION_OF'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D9\05DE\05D5\05D3 \05E9\05DC %0')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139095557361751340)
,p_name=>'APEXIR_PDF_ORIENTATION'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D9\05D5\05D5\05DF \05D4\05D3\05E3')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139096223162751341)
,p_name=>'APEXIR_PDF_ORIENTATION_HORIZONTAL'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05E8\05D5\05D7\05D1')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139096304596751341)
,p_name=>'APEXIR_PDF_ORIENTATION_VERTICAL'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0\05D5\05E8\05DA')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139095402189751340)
,p_name=>'APEXIR_PDF_PAGE_SIZE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D2\05D5\05D3\05DC \05D4\05D3\05E3')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139096062528751341)
,p_name=>'APEXIR_PDF_PAGE_SIZE_A3'
,p_message_language=>'he'
,p_message_text=>'A3'
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139095999693751340)
,p_name=>'APEXIR_PDF_PAGE_SIZE_A4'
,p_message_language=>'he'
,p_message_text=>'A4'
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139096124634751341)
,p_name=>'APEXIR_PDF_PAGE_SIZE_CUSTOM'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05EA\05D0\05DE\05D4 \05D0\05D9\05E9\05D9\05EA')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139095778215751340)
,p_name=>'APEXIR_PDF_PAGE_SIZE_LEGAL'
,p_message_language=>'he'
,p_message_text=>'Legal'
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139095619777751340)
,p_name=>'APEXIR_PDF_PAGE_SIZE_LETTER'
,p_message_language=>'he'
,p_message_text=>'Letter'
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139095816830751340)
,p_name=>'APEXIR_PDF_PAGE_SIZE_TABLOID'
,p_message_language=>'he'
,p_message_text=>'TABLOID'
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139236382364751382)
,p_name=>'APEXIR_PERCENT_OF_TOTAL_COUNT_X'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D7\05D5\05D6 \05DE\05EA\05D5\05DA \05D4\05E1\05E4\05D9\05E8\05D4 \05D4\05DB\05D5\05DC\05DC\05EA %0 (%)')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139235547510751382)
,p_name=>'APEXIR_PERCENT_OF_TOTAL_SUM_X'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D7\05D5\05D6 \05DE\05EA\05D5\05DA \05D4\05E1\05D9\05DB\05D5\05DD \05D4\05DB\05D5\05DC\05DC %0 (%)')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139234531736751382)
,p_name=>'APEXIR_PERCENT_TOTAL_COUNT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D7\05D5\05D6 \05DE\05EA\05D5\05DA \05E1\05E4\05D9\05E8\05EA \05DB\05D5\05DC\05DC\05EA')
,p_version_scn=>2704889
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139234420851751382)
,p_name=>'APEXIR_PERCENT_TOTAL_SUM'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D7\05D5\05D6 \05DE\05EA\05D5\05DA \05E1\05D9\05DB\05D5\05DD \05DB\05D5\05DC\05DC')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139118925970751347)
,p_name=>'APEXIR_PIE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D5\05D2\05D4')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139184663599751367)
,p_name=>'APEXIR_PIVOT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E6\05D9\05E8')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139186107658751367)
,p_name=>'APEXIR_PIVOT_AGG_NOT_NULL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D5\05D1\05D4 \05DC\05E6\05D9\05D9\05DF \05E1\05DB\05D9\05DE\05D4.')
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139186346007751367)
,p_name=>'APEXIR_PIVOT_AGG_NOT_ON_ROW_COL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05E1\05DB\05D5\05DD \05D1\05E2\05DE\05D5\05D3\05D4 \05E9\05E0\05D1\05D7\05E8\05D4 \05DB\05E2\05DE\05D5\05D3\05EA \05E9\05D5\05E8\05D4.')
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139185536698751367)
,p_name=>'APEXIR_PIVOT_COLUMNS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DE\05D5\05D3\05D5\05EA \05E6\05D9\05E8')
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139185371292751367)
,p_name=>'APEXIR_PIVOT_COLUMN_N'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DE\05D5\05D3\05EA \05E6\05D9\05E8 %0')
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139185960834751367)
,p_name=>'APEXIR_PIVOT_COLUMN_NOT_NULL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D5\05D1\05D4 \05DC\05E6\05D9\05D9\05DF \05E2\05DE\05D5\05D3\05EA \05E6\05D9\05E8.')
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139038479356751323)
,p_name=>'APEXIR_PIVOT_MAX_ROW_CNT'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E1\05E4\05E8 \05D4\05E9\05D5\05E8\05D5\05EA \05D4\05DE\05E8\05D1\05D9 \05DC\05E9\05D0\05D9\05DC\05EA\05EA \05E6\05D9\05E8 \05DE\05D2\05D1\05D9\05DC \05D0\05EA \05DE\05E1\05E4\05E8 \05D4\05E9\05D5\05E8\05D5\05EA \05D1\05E9\05D0\05D9\05DC\05EA\05EA \05D4\05D1\05E1\05D9\05E1, \05D5\05DC\05D0 \05D0\05EA \05DE\05E1\05E4\05E8 \05D4\05E9\05D5\05E8\05D5\05EA \05D4\05DE\05D5\05E6\05D2\05D5\05EA. \05E9\05D0\05D9\05DC\05EA\05EA \05D4\05D1\05E1\05D9\05E1 \05D7\05D5\05E8\05D2\05EA \05DE\05DE\05E1\05E4\05E8 \05D4\05E9\05D5\05E8\05D5\05EA \05D4\05DE\05E8\05D1\05D9 \05E9\05DC %0. \05D4\05D7\05DC \05DE\05E1\05E0\05DF \05DB\05D3\05D9 \05DC\05E6\05DE\05E6\05DD \05D0\05EA \05DE\05E1\05E4\05E8 \05D4\05E8\05E9\05D5\05DE\05D5\05EA \05D1\05E9\05D0\05D9\05DC\05EA\05EA \05D4\05D1\05E1\05D9\05E1 \05E9\05DC\05DA.')
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139185873837751367)
,p_name=>'APEXIR_PIVOT_SORT'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D9\05D5\05DF \05E6\05D9\05E8')
,p_is_js_message=>true
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139151850960751357)
,p_name=>'APEXIR_PIVOT_TOO_MANY_VALUES'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DE\05D5\05D3\05EA \05D4\05E6\05D9\05E8 \05DE\05DB\05D9\05DC\05D4 \05D9\05D5\05EA\05E8 \05DE\05D3\05D9 \05E2\05E8\05DB\05D9\05DD \05E0\05D1\05D3\05DC\05D9\05DD, \05DC\05D0 \05E0\05D9\05EA\05DF \05DC\05D4\05E4\05D9\05E7 SQL \05E9\05DC \05E6\05D9\05E8.')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139082821352751337)
,p_name=>'APEXIR_PIVOT_VIEW_OF'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05E6\05D5\05D2\05EA \05E6\05D9\05E8 \05E9\05DC %0')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139208601631751374)
,p_name=>'APEXIR_PREVIEW'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05E6\05D5\05D2\05D4 \05DE\05E7\05D3\05D9\05DE\05D4')
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139139122035751353)
,p_name=>'APEXIR_PREVIOUS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E7\05D5\05D3\05DD')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139233456057751381)
,p_name=>'APEXIR_PRIMARY'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05D0\05E9\05D9')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139209655184751374)
,p_name=>'APEXIR_PRIMARY_REPORT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05D5\05D7 \05E8\05D0\05E9\05D9')
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139095349693751340)
,p_name=>'APEXIR_PRINT_ACCESSIBLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05DC\05D5\05DC \05EA\05D2\05D9\05D5\05EA \05E0\05D2\05D9\05E9\05D5\05EA')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139056173911751328)
,p_name=>'APEXIR_PRINT_STRIP_RICH_TEXT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05E8\05EA \05D8\05E7\05E1\05D8 \05E2\05E9\05D9\05E8')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139164566959751361)
,p_name=>'APEXIR_PRIVATE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05E8\05D8\05D9')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139119588812751347)
,p_name=>'APEXIR_PUBLIC'
,p_message_language=>'he'
,p_message_text=>unistr('\05E6\05D9\05D1\05D5\05E8\05D9')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139115125757751346)
,p_name=>'APEXIR_RED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D3\05D5\05DD')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139261549824751390)
,p_name=>'APEXIR_REGION_STATIC_ID_DOES_NOT_EXIST'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D6\05D4\05D4 \05E1\05D8\05D8\05D9 \05E9\05DC \05D0\05D6\05D5\05E8 ID %0 \05DC\05D0 \05E7\05D9\05D9\05DD.')
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139148691716751356)
,p_name=>'APEXIR_REMOVE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05E8')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139148769439751356)
,p_name=>'APEXIR_REMOVE_ALL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05E8 \05D4\05DB\05DC')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139256973224751388)
,p_name=>'APEXIR_REMOVE_CHART'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05E8 \05EA\05E8\05E9\05D9\05DD')
,p_version_scn=>2704896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139148298993751356)
,p_name=>'APEXIR_REMOVE_CONTROL_BREAK'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05E8 Control Break')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139147983086751356)
,p_name=>'APEXIR_REMOVE_FILTER'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05E8 \05DE\05E1\05E0\05DF')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139148003143751356)
,p_name=>'APEXIR_REMOVE_FLASHBACK'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05E8 \05E4\05DC\05D0\05E9\05D1\05E7')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139257029836751388)
,p_name=>'APEXIR_REMOVE_GROUP_BY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05E8 \05D0\05EA ''\05E7\05D1\05E5 \05DC\05E4\05D9''')
,p_version_scn=>2704896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139148311983751356)
,p_name=>'APEXIR_REMOVE_HIGHLIGHT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05E8 \05D4\05D3\05D2\05E9\05D4')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139257132300751388)
,p_name=>'APEXIR_REMOVE_PIVOT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05E8 \05E6\05D9\05E8')
,p_version_scn=>2704896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139238253089751383)
,p_name=>'APEXIR_REMOVE_REPORT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05E8 \05D3\05D5\05D7')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139220055488751377)
,p_name=>'APEXIR_RENAME_DEFAULT_REPORT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05E0\05D4 \05E9\05DD \05D1\05E8\05D9\05E8\05EA \05DE\05D7\05D3\05DC \05E9\05DC \05D3\05D5\05D7')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139157882309751359)
,p_name=>'APEXIR_RENAME_REPORT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05E0\05D4 \05E9\05DD \05D3\05D5\05D7')
,p_is_js_message=>true
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139139446010751353)
,p_name=>'APEXIR_REPORT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05D5\05D7')
,p_is_js_message=>true
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139236463650751382)
,p_name=>'APEXIR_REPORTS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05D5\05D7\05D5\05EA')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139111641534751345)
,p_name=>'APEXIR_REPORT_ALIAS_DOES_NOT_EXIST'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E7\05D9\05D9\05DD \05D3\05D5\05D7 \05D0\05D9\05E0\05D8\05E8\05D0\05E7\05D8\05D9\05D1\05D9 \05E9\05DE\05D5\05E8 \05E2\05DD \05D4\05DB\05D9\05E0\05D5\05D9 %0.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139164823367751361)
,p_name=>'APEXIR_REPORT_DOES_NOT_EXIST'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D3\05D5\05D7 \05D0\05D9\05E0\05D5 \05E7\05D9\05D9\05DD.')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139111767842751345)
,p_name=>'APEXIR_REPORT_ID_DOES_NOT_EXIST'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E7\05D9\05D9\05DD \05DE\05D6\05D4\05D4 \05D3\05D5\05D7 \05D0\05D9\05E0\05D8\05E8\05D0\05E7\05D8\05D9\05D1\05D9 \05E9\05DE\05D5\05E8 %0.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139156116288751358)
,p_name=>'APEXIR_REPORT_SETTINGS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D2\05D3\05E8\05D5\05EA \05D3\05D5\05D7\05D5\05EA')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139080380394751336)
,p_name=>'APEXIR_REPORT_SETTINGS_OF'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D2\05D3\05E8\05D5\05EA \05D3\05D5\05D7 \05E9\05DC %0')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139136465736751352)
,p_name=>'APEXIR_REPORT_VIEW'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E6\05D2 \05D3\05D5\05D7')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139140626421751354)
,p_name=>'APEXIR_RESET'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E4\05D5\05E1')
,p_is_js_message=>true
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139119711451751348)
,p_name=>'APEXIR_RESET_CONFIRM'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D7\05D6\05E8 \05D3\05D5\05D7 \05DC\05D4\05D2\05D3\05E8\05D5\05EA \05D1\05E8\05D9\05E8\05EA \05D4\05DE\05D7\05D3\05DC.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139114982065751346)
,p_name=>'APEXIR_ROW'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D5\05E8\05D4 ')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139232559090751381)
,p_name=>'APEXIR_ROWID_NOT_SUPPORTED_FOR_WEBSOURCE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05D4\05E9\05EA\05DE\05E9 \05D1-ROWID \05DB\05E2\05DE\05D5\05D3\05EA \05D4\05DE\05E4\05EA\05D7 \05D4\05E8\05D0\05E9\05D9\05EA \05DC\05DE\05E7\05D5\05E8 \05E0\05EA\05D5\05E0\05D9 REST.')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139147318408751356)
,p_name=>'APEXIR_ROWS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D5\05E8\05D5\05EA')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139210376052751374)
,p_name=>'APEXIR_ROWS_PER_PAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D5\05E8\05D5\05EA \05D1\05E2\05DE\05D5\05D3')
,p_is_js_message=>true
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139185699728751367)
,p_name=>'APEXIR_ROW_COLUMNS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DE\05D5\05D3\05D5\05EA \05E9\05D5\05E8\05D4')
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139185498679751367)
,p_name=>'APEXIR_ROW_COLUMN_N'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DE\05D5\05D3\05EA \05E9\05D5\05E8\05D4 %0')
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139186081777751367)
,p_name=>'APEXIR_ROW_COLUMN_NOT_NULL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D5\05D1\05D4 \05DC\05E6\05D9\05D9\05DF \05E2\05DE\05D5\05D3\05EA \05E9\05D5\05E8\05D4.')
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139186208547751367)
,p_name=>'APEXIR_ROW_COL_DIFF_FROM_PIVOT_COL'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DE\05D5\05D3\05EA \05E9\05D5\05E8\05D4 \05D7\05D9\05D9\05D1\05EA \05DC\05D4\05D9\05D5\05EA \05E9\05D5\05E0\05D4 \05DE\05E2\05DE\05D5\05D3\05EA \05D4\05E6\05D9\05E8.')
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139161851242751360)
,p_name=>'APEXIR_ROW_FILTER'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E1\05E0\05DF \05E9\05D5\05E8\05D5\05EA')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139136558884751353)
,p_name=>'APEXIR_ROW_OF'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D5\05E8\05D4 %0 \05DE\05EA\05D5\05DA %1 ')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139140847396751354)
,p_name=>'APEXIR_ROW_TEXT_CONTAINS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D8\05E7\05E1\05D8 \05E9\05D5\05E8\05D4 \05DE\05DB\05D9\05DC')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139114277905751346)
,p_name=>'APEXIR_SAVE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DE\05D5\05E8')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139151431159751357)
,p_name=>'APEXIR_SAVED_REPORT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05D5\05D7 \05E9\05DE\05D5\05E8')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139151382263751357)
,p_name=>'APEXIR_SAVED_REPORT_MSG'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05D5\05D7 \05E9\05E0\05E9\05DE\05E8 = "%0"')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139153527768751358)
,p_name=>'APEXIR_SAVE_DEFAULT_CONFIRM'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D2\05D3\05E8\05D5\05EA \05D4\05D3\05D5\05D7 \05D4\05E0\05D5\05DB\05D7\05D9\05D5\05EA \05D9\05E9\05DE\05E9\05D5 \05DB\05D1\05E8\05D9\05E8\05EA \05D4\05DE\05D7\05D3\05DC \05DC\05DB\05DC \05D4\05DE\05E9\05EA\05DE\05E9\05D9\05DD.')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139219941550751377)
,p_name=>'APEXIR_SAVE_DEFAULT_REPORT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DE\05D5\05E8 \05D1\05E8\05D9\05E8\05EA \05DE\05D7\05D3\05DC \05E9\05DC \05D3\05D5\05D7')
,p_is_js_message=>true
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139140540470751354)
,p_name=>'APEXIR_SAVE_REPORT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DE\05D5\05E8 \05D3\05D5\05D7')
,p_is_js_message=>true
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139257337331751388)
,p_name=>'APEXIR_SAVE_REPORT_DEFAULT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DE\05D5\05E8 \05D3\05D5\05D7 *')
,p_is_js_message=>true
,p_version_scn=>2704896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139211305890751375)
,p_name=>'APEXIR_SEARCH'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05E4\05E9')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139146247562751355)
,p_name=>'APEXIR_SEARCH_BAR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05E8\05D2\05DC \05D7\05D9\05E4\05D5\05E9')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139079638258751336)
,p_name=>'APEXIR_SEARCH_BAR_OF'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05E8\05D2\05DC \05D7\05D9\05E4\05D5\05E9 \05E9\05DC %0')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139257253079751388)
,p_name=>'APEXIR_SEARCH_COLUMN'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D9\05E4\05D5\05E9: %0')
,p_is_js_message=>true
,p_version_scn=>2704896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139216804316751376)
,p_name=>'APEXIR_SEARCH_REPORT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05E4\05E9 \05D3\05D5\05D7')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139200844725751372)
,p_name=>'APEXIR_SELECTED_COLUMNS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DE\05D5\05D3\05D5\05EA \05E9\05E0\05D1\05D7\05E8\05D5')
,p_version_scn=>2704881
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139115909623751346)
,p_name=>'APEXIR_SELECT_COLUMN'
,p_message_language=>'he'
,p_message_text=>unistr('- \05D1\05D7\05E8 \05E2\05DE\05D5\05D3\05D4 -')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139139888521751353)
,p_name=>'APEXIR_SELECT_COLUMNS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05E8 \05E2\05DE\05D5\05D3\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139119411953751347)
,p_name=>'APEXIR_SELECT_FUNCTION'
,p_message_language=>'he'
,p_message_text=>unistr('- \05D1\05D7\05E8 \05E4\05D5\05E0\05E7\05E6\05D9\05D4 -')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139147047854751356)
,p_name=>'APEXIR_SELECT_GROUP_BY_COLUMN'
,p_message_language=>'he'
,p_message_text=>unistr('- \05D1\05D7\05E8 \05E2\05DE\05D5\05D3\05EA ''\05E7\05D1\05E5 \05DC\05E4\05D9'' -')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139185186825751367)
,p_name=>'APEXIR_SELECT_PIVOT_COLUMN'
,p_message_language=>'he'
,p_message_text=>unistr('- \05D1\05D7\05E8 \05E2\05DE\05D5\05D3\05EA \05E6\05D9\05E8 -')
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139235477536751382)
,p_name=>'APEXIR_SELECT_ROW'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05E8 \05E9\05D5\05E8\05D4 ')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139185242250751367)
,p_name=>'APEXIR_SELECT_ROW_COLUMN'
,p_message_language=>'he'
,p_message_text=>unistr('- \05D1\05D7\05E8 \05E2\05DE\05D5\05D3\05EA \05E9\05D5\05E8\05D4 -')
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139066747541751332)
,p_name=>'APEXIR_SEND'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DC\05D7')
,p_is_js_message=>true
,p_version_scn=>2704858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139089215473751339)
,p_name=>'APEXIR_SEND_AS_EMAIL'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DC\05D7 \05DB\05D3\05D5\05D0\05E8 \05D0\05DC\05E7\05D8\05E8\05D5\05E0\05D9')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139114647816751346)
,p_name=>'APEXIR_SEQUENCE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05E6\05E3')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139140039567751354)
,p_name=>'APEXIR_SORT'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D9\05D9\05DF')
,p_is_js_message=>true
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139149573976751356)
,p_name=>'APEXIR_SORT_ASCENDING'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D9\05D9\05DF \05D1\05E1\05D3\05E8 \05E2\05D5\05DC\05D4')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139149611832751356)
,p_name=>'APEXIR_SORT_DESCENDING'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D9\05D9\05DF \05D1\05E1\05D3\05E8 \05D9\05D5\05E8\05D3')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139237646610751383)
,p_name=>'APEXIR_SORT_ORDER'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D3\05E8 \05DE\05D9\05D5\05DF')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139143997791751355)
,p_name=>'APEXIR_SPACE_AS_IN_ONE_EMPTY_STRING'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05D5\05D5\05D7')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139155169605751358)
,p_name=>'APEXIR_STATUS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D8\05D8\05D5\05E1 %0')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139209064660751374)
,p_name=>'APEXIR_SUBSCRIPTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E0\05D5\05D9')
,p_is_js_message=>true
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139234871024751382)
,p_name=>'APEXIR_SUBSCRIPTION_ENDING'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D3')
,p_version_scn=>2704889
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139053865269751328)
,p_name=>'APEXIR_SUBSCRIPTION_SKIP_IF_NDF'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05DC\05D2 \05E2\05DD \05DC\05D0 \05E0\05DE\05E6\05D0\05D5 \05E0\05EA\05D5\05E0\05D9\05DD')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139234773329751382)
,p_name=>'APEXIR_SUBSCRIPTION_STARTING_FROM'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05EA\05D7\05DC \05DE-')
,p_version_scn=>2704889
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139235674147751382)
,p_name=>'APEXIR_SUM_X'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D9\05DB\05D5\05DD %0')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139226525897751379)
,p_name=>'APEXIR_TABLE_SUMMARY'
,p_message_language=>'he'
,p_message_text=>unistr('%0, \05D3\05D5\05D7 = %1, \05EA\05E6\05D5\05D2\05EA \05D3\05D5\05D7= %2')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139113551531751346)
,p_name=>'APEXIR_TEXT_COLOR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E6\05D1\05E2 \05D8\05E7\05E1\05D8')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139132293818751351)
,p_name=>'APEXIR_TIME_DAYS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05DE\05D9\05DD')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139132186250751351)
,p_name=>'APEXIR_TIME_HOURS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05E2\05D5\05EA')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139132043205751351)
,p_name=>'APEXIR_TIME_MINS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05E7\05D5\05EA')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139132437369751351)
,p_name=>'APEXIR_TIME_MONTHS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D5\05D3\05E9\05D9\05DD')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139132330683751351)
,p_name=>'APEXIR_TIME_WEEKS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D1\05D5\05E2\05D5\05EA')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139132502458751351)
,p_name=>'APEXIR_TIME_YEARS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05E0\05D9\05DD')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139238008169751383)
,p_name=>'APEXIR_TOGGLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D7\05DC\05E4\05EA \05DE\05E6\05D1')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139148858594751356)
,p_name=>'APEXIR_TOP'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DC\05D9\05D5\05DF')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139231595774751381)
,p_name=>'APEXIR_UNGROUPED_COLUMN'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DE\05D5\05D3\05D4 \05DC\05D0 \05DE\05E7\05D5\05D1\05E6\05EA')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139150365112751357)
,p_name=>'APEXIR_UNIQUE_HIGHLIGHT_NAME'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DD \05D4\05D3\05D2\05E9\05D4 \05E6\05E8\05D9\05DA \05DC\05D4\05D9\05D5\05EA \05D9\05D9\05D7\05D5\05D3\05D9.')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139118295152751347)
,p_name=>'APEXIR_UNSUPPORTED_DATA_TYPE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D5\05D2 \05E0\05EA\05D5\05E0\05D9\05DD \05DC\05D0 \05E0\05EA\05DE\05DA')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139148999118751356)
,p_name=>'APEXIR_UP'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05DE\05E2\05DC\05D4')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139150552425751357)
,p_name=>'APEXIR_VALID_COLOR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D6\05DF \05E6\05D1\05E2 \05EA\05E7\05E3.')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139150631640751357)
,p_name=>'APEXIR_VALID_FORMAT_MASK'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D6\05DF \05DE\05E1\05DB\05EA \05EA\05D1\05E0\05D9\05EA \05EA\05E7\05E4\05D4.')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139115482440751346)
,p_name=>'APEXIR_VALUE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E8\05DA ')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139149430243751356)
,p_name=>'APEXIR_VALUE_AXIS_TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D5\05EA\05E8\05EA \05E6\05D9\05E8 \05DC\05E2\05E8\05DA')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139157203548751359)
,p_name=>'APEXIR_VALUE_REQUIRED'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05D3\05E8\05E9 \05E2\05E8\05DA')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139118812255751347)
,p_name=>'APEXIR_VCOLUMN'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DE\05D5\05D3\05D4 \05D0\05E0\05DB\05D9\05EA')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139227699567751380)
,p_name=>'APEXIR_VERTICAL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05E0\05DB\05D9')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139156570427751358)
,p_name=>'APEXIR_VIEW_CHART'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E6\05D2 \05EA\05E8\05E9\05D9\05DD')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139215100427751376)
,p_name=>'APEXIR_VIEW_DETAIL'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05E8\05D8 \05DE\05D1\05D8')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139259413026751389)
,p_name=>'APEXIR_VIEW_DOES_NOT_EXIST'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D3\05D5\05D7 \05DC\05D0 \05D4\05D5\05D2\05D3\05E8\05D4 \05EA\05E6\05D5\05D2\05EA %0.')
,p_version_scn=>2704896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139215263747751376)
,p_name=>'APEXIR_VIEW_GROUP_BY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E6\05D2 ''\05E7\05D1\05E5 \05DC\05E4\05D9''')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139215036244751376)
,p_name=>'APEXIR_VIEW_ICONS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E6\05D2 \05D0\05D9\05E7\05D5\05E0\05D9\05DD')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139184962159751367)
,p_name=>'APEXIR_VIEW_PIVOT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E6\05D2 \05E6\05D9\05E8')
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139156610900751359)
,p_name=>'APEXIR_VIEW_REPORT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E6\05D2 \05D3\05D5\05D7')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139209228517751374)
,p_name=>'APEXIR_WEEKLY'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D1\05D5\05E2\05D9')
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139139310548751353)
,p_name=>'APEXIR_WORKING_REPORT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05D5\05D7 \05E2\05D1\05D5\05D3\05D4')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139237049268751382)
,p_name=>'APEXIR_X_DAYS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D9\05DE\05D9\05DD')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139236901245751382)
,p_name=>'APEXIR_X_HOURS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05E9\05E2\05D5\05EA')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139236854538751382)
,p_name=>'APEXIR_X_MINS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D3\05E7\05D5\05EA')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139237209750751382)
,p_name=>'APEXIR_X_MONTHS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D7\05D5\05D3\05E9\05D9\05DD')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139237182050751382)
,p_name=>'APEXIR_X_WEEKS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05E9\05D1\05D5\05E2\05D5\05EA')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139237387900751382)
,p_name=>'APEXIR_X_YEARS'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05E9\05E0\05D9\05DD')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139235029326751382)
,p_name=>'APEXIR_YEAR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05E0\05D4')
,p_version_scn=>2704889
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139113256504751346)
,p_name=>'APEXIR_YELLOW'
,p_message_language=>'he'
,p_message_text=>unistr('\05E6\05D4\05D5\05D1')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139114705293751346)
,p_name=>'APEXIR_YES'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05DF ')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139149266590751356)
,p_name=>'APEX_GROUP.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05DE\05DB\05D9\05DC \05D0\05EA \05D4\05EA\05D5\05D5\05D9\05DD < \05D0\05D5 > \05E9\05D0\05D9\05E0\05DD \05EA\05E7\05E4\05D9\05DD.')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139173164852751363)
,p_name=>'APEX_REGION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D6\05D5\05E8')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139064284721751331)
,p_name=>'APEX_ZIP.EXTRACT_FAILED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05D7\05DC\05E5 \05E7\05D5\05D1\05E5 ZIP.')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139064167940751331)
,p_name=>'APEX_ZIP.INVALID_ZIPFILE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05DE\05E6\05D0\05D4 \05D7\05EA\05D9\05DE\05D4 \05D1\05E1\05D5\05E3 \05D4\05E1\05E4\05E8\05D9\05D9\05D4 \05D4\05DE\05E8\05DB\05D6\05D9\05EA. \05E7\05D5\05D1\05E5 \05D6\05D4 \05D0\05D9\05E0\05D5 \05E7\05D5\05D1\05E5 ZIP.')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139095295232751340)
,p_name=>'API_PRECONDITION_VIOLATED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05E4\05E8 \05EA\05E0\05D0\05D9 \05DE\05D5\05E7\05D3\05DD \05E9\05DC API')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139117312441751347)
,p_name=>'APP.SETTING.CANNOT.GET'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05E7\05D1\05DC \05E2\05E8\05DA \05DC\05D4\05D2\05D3\05E8\05EA \05D9\05D9\05E9\05D5\05DD %0 \05DB\05D9\05D5\05D5\05DF \05E9\05D0\05E4\05E9\05E8\05D5\05EA \05D4\05D1\05E0\05D9\05D9\05D4 \05D4\05E7\05E9\05D5\05E8\05D4, \05D7\05E1\05D5\05DE\05D4.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139117288751751347)
,p_name=>'APP.SETTING.CANNOT.SET'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05E7\05D1\05D5\05E2 \05E2\05E8\05DA \05DC\05D4\05D2\05D3\05E8\05EA \05D9\05D9\05E9\05D5\05DD %0 \05DB\05D9\05D5\05D5\05DF \05E9\05D0\05E4\05E9\05E8\05D5\05EA \05D4\05D1\05E0\05D9\05D9\05D4 \05D4\05E7\05E9\05D5\05E8\05D4, \05D7\05E1\05D5\05DE\05D4.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139229838598751380)
,p_name=>'APP.SETTING.INVALID.VALUE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E8\05DA \05D4\05D2\05D3\05E8\05EA \05D4\05D9\05D9\05E9\05D5\05DD %0 \05D0\05D9\05E0\05D5 \05EA\05E7\05E3')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139229766245751380)
,p_name=>'APP.SETTING.NOT.DEFINED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D2\05D3\05E8\05EA \05D4\05D9\05D9\05E9\05D5\05DD \05D4\05DE\05D1\05D5\05E7\05E9\05EA %0 \05DC\05D0 \05D4\05D5\05D2\05D3\05E8\05D4')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139229907240751380)
,p_name=>'APP.SETTING.VALUE.NOT.NULL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05E7\05D1\05D5\05E2 \05D0\05EA \05D4\05D2\05D3\05E8\05EA \05D4\05D9\05D9\05E9\05D5\05DD %0 \05DC\05E2\05E8\05DA null')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139103858213751343)
,p_name=>'BACK'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E7\05D5\05D3\05DD')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139086223236751338)
,p_name=>'BUILDER'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05E0\05D9\05D9\05D4')
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139159832960751359)
,p_name=>'BUTTON LABEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D5\05D5\05D9\05EA \05DC\05D7\05E6\05DF')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139083128216751337)
,p_name=>'BUTTON_CSS_CLASSES'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D7\05DC\05E7\05EA CSS \05E9\05DC \05DC\05D7\05E6\05DF')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139121613290751348)
,p_name=>'BUTTON_ID'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D6\05D4\05D4 \05D4\05DC\05D7\05E6\05DF \05E9\05D4\05D5\05E4\05E7 \05D9\05D4\05D9\05D4 \05D4\05DE\05D6\05D4\05D4 \05D4\05E1\05D8\05D8\05D9 \05E9\05DC \05D4\05DC\05D7\05E6\05DF, \05D0\05DD \05D4\05D5\05D2\05D3\05E8; \05D0\05DD \05DC\05D0 \05D4\05D5\05D2\05D3\05E8 \05D4\05D5\05D0 \05D9\05D4\05D9\05D4 \05DE\05D6\05D4\05D4 \05E9\05D4\05D5\05E4\05E7 \05D1\05D0\05D5\05E4\05DF \05E4\05E0\05D9\05DE\05D9 \05D1\05E4\05D5\05E8\05DE\05D8 ''B'' || [Internal Button ID]')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139055623543751328)
,p_name=>'CANDLESTICK'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05E8\05E9\05D9\05DD \05E4\05DE\05D5\05D8')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139169636655751362)
,p_name=>'CENTER'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E8\05DB\05D6')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139116261616751347)
,p_name=>'CHANGE_PW_REQUEST'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05E7\05E9\05EA %0')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139106293970751344)
,p_name=>'CHECK$'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D5\05E8\05E8 \05E9\05D5\05E8\05D5\05EA')
,p_version_scn=>2704865
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139231674184751381)
,p_name=>'CHECKED'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E1\05D5\05DE\05DF')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139208033864751374)
,p_name=>'COLUMN'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DE\05D5\05D3\05D4')
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139165644304751361)
,p_name=>'COMMENTS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E2\05E8\05D5\05EA')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139146685019751356)
,p_name=>'CONTINUE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05DE\05E9\05DA')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139104105299751343)
,p_name=>'COPYRIGHT'
,p_message_language=>'he'
,p_message_text=>'Copyright &copy; 1999, %0, Oracle and/or its affiliates.'
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139152320420751357)
,p_name=>'COUNT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05E4\05D9\05E8\05D4')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139159358121751359)
,p_name=>'CREATE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E6\05D5\05E8')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139214712317751376)
,p_name=>'CREATED'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05D5\05E6\05E8')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139214892356751376)
,p_name=>'CREATED_BY'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05D5\05E6\05E8 \05E2\05DC-\05D9\05D3\05D9')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139135781747751352)
,p_name=>'CREATED_ON'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05D5\05E6\05E8 \05D1\05EA\05D0\05E8\05D9\05DA')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139146821597751356)
,p_name=>'CUSTOM'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05EA\05D0\05DE\05D4 \05D0\05D9\05E9\05D9\05EA')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139158063202751359)
,p_name=>'CUSTOMIZE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05EA\05D0\05DD \05D0\05D9\05E9\05D9\05EA')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139160088894751360)
,p_name=>'CUSTOMIZE.USER_PAGE_PREFS_RESET'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E4\05D5\05E1 \05D4\05E2\05D3\05E4\05D5\05EA \05D3\05E3 \05DC\05DE\05E9\05EA\05DE\05E9 %0.')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139160153669751360)
,p_name=>'CUSTOMIZE.USER_PREFS_CHANGED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D4\05E2\05D3\05E4\05D5\05EA \05D4\05E9\05EA\05E0\05D5 \05DC\05DE\05E9\05EA\05DE\05E9 %0.')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139159929995751359)
,p_name=>'CUSTOMIZE.USER_PREFS_RESET'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E4\05D5\05E1 \05D4\05E2\05D3\05E4\05D5\05EA \05D3\05E3 \05DC\05DE\05E9\05EA\05DE\05E9 %0.')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139121051158751348)
,p_name=>'DAILY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05D5\05DE\05D9')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139084447251751337)
,p_name=>'DATA.LOAD.INVALID_FILE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E7\05D5\05D1\05E5 \05E9\05D4\05D5\05E2\05DC\05D4 \05D0\05D9\05E0\05D5 \05EA\05E7\05E3 \05D0\05D5 \05E9\05D9\05E9 \05DC\05D5 \05E1\05D9\05D5\05DE\05EA \05E9\05D2\05D5\05D9\05D4.')
,p_version_scn=>2704861
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139116438529751347)
,p_name=>'DATA.LOAD.INVALID_SELECTOR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05E2\05E9\05D4 \05E9\05D9\05DE\05D5\05E9 \05D1\05D1\05D5\05E8\05E8 XML \05D0\05D5 JSON \05DC\05D0 \05EA\05E7\05E3.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139061580641751330)
,p_name=>'DATA.LOAD.NO_COMMON_COLUMNS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05E8\05D5\05E4\05D9\05DC \05D4\05E0\05EA\05D5\05E0\05D9\05DD \05D5\05D4\05E7\05D5\05D1\05E5 \05E9\05D4\05D5\05E2\05DC\05D4 \05DC\05D0 \05DE\05DB\05D9\05DC\05D9\05DD \05D0\05E3 \05E2\05DE\05D5\05D3\05EA \05D8\05D1\05DC\05EA \05D9\05E2\05D3.')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139175442850751364)
,p_name=>'DATA.LOAD.NO_FILE_CONTENTS'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05DE\05E6\05D0\05D5 \05E0\05EA\05D5\05E0\05D9\05DD \05D1\05E7\05D5\05D1\05E5 \05E9\05D4\05D5\05E2\05DC\05D4.')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139175598072751364)
,p_name=>'DATA.LOAD.NO_WORKSHEET_CONTENTS'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05DE\05E6\05D0\05D5 \05E0\05EA\05D5\05E0\05D9\05DD \05D1\05D2\05D9\05DC\05D9\05D5\05DF \05D4\05E2\05D1\05D5\05D3\05D4 "%0".')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139081314418751336)
,p_name=>'DATA.LOAD.NO_XLSX_FILE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E7\05D5\05D1\05E5 \05E9\05E6\05D5\05D9\05DF \05D0\05D9\05E0\05D5 \05E7\05D5\05D1\05E5 XLSX.')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139047311388751326)
,p_name=>'DATA.LOAD.ROWS_PROCESSED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D8\05E2\05D9\05E0\05EA \05E0\05EA\05D5\05E0\05D9\05DD \05D4\05E1\05EA\05D9\05D9\05DE\05D4: %0 \05E9\05D5\05E8\05D5\05EA \05E2\05D5\05D1\05D3\05D5.')
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139049692253751326)
,p_name=>'DATA.LOAD.ROWS_PROCESSED_W_ERROR_ROW'
,p_message_language=>'he'
,p_message_text=>unistr('\05D8\05E2\05D9\05E0\05EA \05E0\05EA\05D5\05E0\05D9\05DD \05D4\05E1\05EA\05D9\05D9\05DE\05D4: %0 \05E9\05D5\05E8\05D5\05EA \05E2\05D5\05D1\05D3\05D5 \05E2\05DD \05E9\05D2\05D9\05D0\05D4 \05D0\05D7\05EA.')
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139049902626751327)
,p_name=>'DATA.LOAD.ROWS_PROCESSED_W_ERROR_ROWS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D8\05E2\05D9\05E0\05EA \05E0\05EA\05D5\05E0\05D9\05DD \05D4\05E1\05EA\05D9\05D9\05DE\05D4: %0 \05E9\05D5\05E8\05D5\05EA \05E2\05D5\05D1\05D3\05D5 \05E2\05DD %1 \05E9\05D2\05D9\05D0\05D5\05EA.')
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139049755313751326)
,p_name=>'DATA.LOAD.ROW_PROCESSED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D8\05E2\05D9\05E0\05EA \05E0\05EA\05D5\05E0\05D9\05DD \05D4\05E1\05EA\05D9\05D9\05DE\05D4: \05E9\05D5\05E8\05D4 \05D0\05D7\05EA \05E2\05D5\05D1\05D3\05D4.')
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139064098408751331)
,p_name=>'DATA.LOAD.ROW_PROCESSED_W_ERROR_ROW'
,p_message_language=>'he'
,p_message_text=>unistr('\05D8\05E2\05D9\05E0\05EA \05E0\05EA\05D5\05E0\05D9\05DD \05D4\05E1\05EA\05D9\05D9\05DE\05D4: \05E9\05D5\05E8\05D4 \05D0\05D7\05EA \05E2\05D5\05D1\05D3\05D4 \05E2\05DD \05E9\05D2\05D9\05D0\05D4.')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139049808786751327)
,p_name=>'DATA.LOAD.ROW_PROCESSED_W_ERROR_ROWS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D8\05E2\05D9\05E0\05EA \05E0\05EA\05D5\05E0\05D9\05DD \05D4\05E1\05EA\05D9\05D9\05DE\05D4: \05E9\05D5\05E8\05D4 \05D0\05D7\05EA \05E2\05D5\05D1\05D3\05D4 \05DC\05DC\05D0 \05E9\05D2\05D9\05D0\05D4.')
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139182516265751366)
,p_name=>'DATA_LOAD.COLUMN_NAMES_MAPPING'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DE\05D5\05D3\05EA \05D9\05E2\05D3')
,p_version_scn=>2704879
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139089718097751339)
,p_name=>'DATA_LOAD.DO_NOT_LOAD'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05DF \05DC\05D8\05E2\05D5\05DF')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139089899871751339)
,p_name=>'DATA_LOAD.FAILED'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05EA \05E7\05D3\05DD-\05E2\05D9\05D1\05D5\05D3')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139182672617751366)
,p_name=>'DATA_LOAD.FIRST_COLUMN_NAMES'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DE\05D5\05D3\05EA \05DE\05E7\05D5\05E8')
,p_version_scn=>2704879
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139183483751751366)
,p_name=>'DATA_LOAD.FORMAT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05D5\05E8\05DE\05D8 \05EA\05D0\05E8\05D9\05DA / \05DE\05E1\05E4\05E8')
,p_version_scn=>2704879
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139089578969751339)
,p_name=>'DATA_LOAD.INSERT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05E1\05E3 \05E9\05D5\05E8\05D4')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139245649814751385)
,p_name=>'DATA_LOAD.LOOKUP_FAILED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D7\05D6\05D5\05E8 \05E2\05E8\05DA lookup \05E0\05DB\05E9\05DC.')
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139215357087751376)
,p_name=>'DATA_LOAD.MAPPING'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D9\05E4\05D5\05D9 \05E0\05EA\05D5\05E0\05D9\05DD / \05D8\05D1\05DC\05D4')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139183530342751366)
,p_name=>'DATA_LOAD.ROW'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D5\05E8\05D4 ')
,p_version_scn=>2704879
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139089941825751339)
,p_name=>'DATA_LOAD.SEQUENCE_ACTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05E6\05E3: \05E4\05E2\05D5\05DC\05D4')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139177284805751365)
,p_name=>'DATA_LOAD.TRANSFORMATION_FAILED'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05DC\05DC \05D4\05D8\05E8\05E0\05E1\05E4\05D5\05E8\05DE\05E6\05D9\05D4 \05E0\05DB\05E9\05DC')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139089624368751339)
,p_name=>'DATA_LOAD.UPDATE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D3\05DB\05DF \05E9\05D5\05E8\05D4')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139151949243751357)
,p_name=>'DATE'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D0\05E8\05D9\05DA')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139124820078751349)
,p_name=>'DAY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05D5\05DD')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139124916414751349)
,p_name=>'DAYS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05DE\05D9\05DD')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139165342994751361)
,p_name=>'DEBUGGING_OFF'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05D9\05E4\05D5\05D9 \05D1\05D0\05D2\05D9\05DD \05DC\05D0 \05D0\05D5\05E4\05E9\05E8 \05DC\05D9\05D9\05E9\05D5\05DD \05D6\05D4.')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139217007434751376)
,p_name=>'DEFAULT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05E8\05D9\05E8\05EA \05DE\05D7\05D3\05DC')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139125627985751349)
,p_name=>'DELETE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D7\05E7')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139101230402751342)
,p_name=>'DELETE_MSG'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D0\05DD \05EA\05E8\05E6\05D4 \05DC\05D1\05E6\05E2 \05E4\05E2\05D5\05DC\05EA \05DE\05D7\05D9\05E7\05D4 \05D6\05D5?')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139080825325751336)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05E8\05D9\05E1\05D5\05EA \05DE\05D5\05E9\05D1 \05E2\05D1\05D5\05D3\05D4')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139081779562751336)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ENABLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05E4\05E9\05E8 \05D3\05E8\05D9\05E1\05D5\05EA \05DE\05D5\05E9\05D1 \05E2\05D1\05D5\05D3\05D4')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139082616889751336)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ERROR_LOAD'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E8\05E2\05D4 \05E9\05D2\05D9\05D0\05D4 \05D1\05E2\05EA \05D8\05E2\05D9\05E0\05EA \05D3\05E8\05D9\05E1\05D5\05EA \05DE\05D5\05E9\05D1 \05D4\05E2\05D1\05D5\05D3\05D4.')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139082463217751336)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ERROR_SAVE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E8\05E2\05D4 \05E9\05D2\05D9\05D0\05D4 \05D1\05E2\05EA \05E9\05DE\05D9\05E8\05EA \05D3\05E8\05D9\05E1\05D5\05EA \05DE\05D5\05E9\05D1 \05D4\05E2\05D1\05D5\05D3\05D4.')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139082350579751336)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_SAVED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05E8\05D9\05E1\05D5\05EA \05DE\05D5\05E9\05D1 \05D4\05E2\05D1\05D5\05D3\05D4 \05E0\05E9\05DE\05E8\05D5. \05E1\05D2\05D5\05E8 \05EA\05D9\05D1\05EA \05D3\05D5-\05E9\05D9\05D7 \05D6\05D5 \05DB\05D3\05D9 \05DC\05E8\05D0\05D5\05EA \05D0\05EA \05D4\05E9\05D9\05E0\05D5\05D9\05D9\05DD.')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139055569846751328)
,p_name=>'DIAL_PCT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05E2\05D5\05DF \05D7\05D5\05D2\05D4 (\05D0\05D7\05D5\05D6)')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139096506668751341)
,p_name=>'DOWNLOAD'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05E8\05D3')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139216114193751376)
,p_name=>'DUP_USER'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DD \05DE\05E9\05EA\05DE\05E9 \05DB\05E4\05D5\05DC \05D1\05EA\05D5\05DA \05E8\05E9\05D9\05DE\05D4.')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139104990152751343)
,p_name=>'EDIT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E8\05D5\05DA')
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139116141212751346)
,p_name=>'EMAIL_NOT_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05DE\05E6\05D0\05D4 \05DB\05EA\05D5\05D1\05EA \05D4\05D3\05D5\05D0"\05DC "%0".')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139098875820751341)
,p_name=>'EMAIL_SENT_BY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05D3\05E2\05EA \05D3\05D5\05D0"\05DC \05D6\05D5 \05E0\05E9\05DC\05D7\05D4 \05E2\05DC-\05D9\05D3\05D9 %0.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139216347137751376)
,p_name=>'EMAIL_TOO_LONG'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05EA\05D5\05D1\05EA \05D4\05D3\05D5\05D0"\05DC \05D0\05E8\05D5\05DB\05D4 \05DE\05D3\05D9. \05D4\05D2\05D1\05D5\05DC \05D4\05D5\05D0 240 \05EA\05D5\05D5\05D9\05DD.')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139146504651751356)
,p_name=>'ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139177342443751365)
,p_name=>'ERROR_SET_ITEM_STATE_FOR_PPR_REGION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05D4\05D2\05D3\05D9\05E8 \05E2\05E8\05DA \05DE\05E7\05D5\05E8 \05D3\05E3 \05DC\05D0\05D6\05D5\05E8 \05E8\05E2\05E0\05D5\05DF \05D3\05E3 \05D7\05DC\05E7\05D9')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139137850532751353)
,p_name=>'F4500_P10_CREATED_BY'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05D5\05E6\05E8 \05E2\05DC-\05D9\05D3\05D9 ')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139099113802751341)
,p_name=>'F4500_P2613_EXPIRED'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05D2 \05EA\05D5\05E7\05E3 \05D4\05E1\05D9\05E1\05DE\05D4')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139091548331751339)
,p_name=>'FILE_EMPTY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E7\05D5\05D1\05E5 \05E8\05D9\05E7.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139181341131751366)
,p_name=>'FILE_TOO_LARGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D2\05D5\05D3\05DC \05D4\05E7\05D5\05D1\05E5 \05E9\05D4\05D5\05E2\05DC\05D4 \05D2\05D3\05D5\05DC \05DE-%0 MB. \05D4\05E2\05DC\05D4 \05E7\05D5\05D1\05E5 \05E7\05D8\05DF \05D9\05D5\05EA\05E8.')
,p_version_scn=>2704878
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139101476020751342)
,p_name=>'FILE_UPLOAD_AUTHENTICATION_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05DE\05D5\05EA \05D6\05D4\05D5\05EA \05D4\05DE\05E9\05EA\05DE\05E9 \05E0\05DB\05E9\05DC \05D5\05E7\05D5\05D1\05E5 \05D0\05D7\05D3 \05D0\05D5 \05D9\05D5\05EA\05E8 \05DC\05D0 \05D4\05D5\05D8\05E2\05E0\05D5.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139101599065751342)
,p_name=>'FILE_UPLOAD_PUBLICUSER_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D5\05E4\05E2 \05D6\05D4 \05D0\05D5\05E1\05E8 \05E2\05DC \05DE\05E9\05EA\05DE\05E9\05D9\05DD \05E9\05DC\05D0 \05D0\05D5\05DE\05EA\05D5 \05DC\05D4\05E2\05DC\05D5\05EA \05E7\05D1\05E6\05D9\05DD.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139181476740751366)
,p_name=>'FILTERS'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E1\05E0\05E0\05D9\05DD')
,p_version_scn=>2704878
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139159443686751359)
,p_name=>'FLOW.SINGLE_VALIDATION_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E8\05E2\05D4 \05E9\05D2\05D9\05D0\05D4 \05D0\05D7\05EA')
,p_is_js_message=>true
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139158660267751359)
,p_name=>'FLOW.VALIDATION_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E8\05E2\05D5 %0 \05E9\05D2\05D9\05D0\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139104020280751343)
,p_name=>'FORM_OF'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05DE\05EA\05D5\05DA %1')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139143023866751354)
,p_name=>'GO'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D9\05E6\05D5\05E2')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139245236358751385)
,p_name=>'HELP'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D6\05E8\05D4')
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139086304058751338)
,p_name=>'HOME'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05E3 \05D4\05D1\05D9\05EA')
,p_is_js_message=>true
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139124634980751349)
,p_name=>'HOUR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05E2\05D4')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139124732133751349)
,p_name=>'HOURS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05E2\05D5\05EA')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139106128802751344)
,p_name=>'ICON'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E7\05D5\05DF %0')
,p_version_scn=>2704865
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139083430194751337)
,p_name=>'ICON.EDITOR.CROP.HELP'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D6\05E8\05EA \05D0\05D9\05E7\05D5\05DF \05D7\05D9\05EA\05D5\05DA')
,p_version_scn=>2704860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139084605543751337)
,p_name=>'ICON.EDITOR.CROPPER.HELPTEXT'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\05D2\05E8\05D5\05E8 \05D0\05EA \05D4\05D0\05D9\05E7\05D5\05DF \05E9\05DC\05DA \05D5\05D4\05E9\05EA\05DE\05E9 \05D1\05DE\05D7\05D5\05D5\05DF \05D6\05D5\05DD \05DB\05D3\05D9 \05DC\05DE\05E7\05DD \05D0\05D5\05EA\05D5 \05DE\05D7\05D3\05E9 \05D1\05EA\05D5\05DA \05D4\05DE\05E1\05D2\05E8\05EA.</p>'),
'',
unistr('<p>\05D1\05E2\05EA \05D4\05E2\05DC\05D0\05EA \05D0\05D9\05E7\05D5\05DF \05D7\05D3\05E9 \05D2\05D5\05D3\05DC\05D5 \05D9\05E9\05EA\05E0\05D4 \05DB\05DA \05E9\05D9\05EA\05D0\05D9\05DD \05DC\05E9\05DC\05D5\05E9\05D4 \05E4\05D5\05E8\05DE\05D8\05E8\05D9\05DD: \05E4\05D0\05D1\05D9\05E7\05D5\05DF, \05D0\05D9\05E7\05D5\05DF \05E7\05D8\05DF \05D5\05D2\05D3\05D5\05DC.</p>'),
'',
unistr('<p>\05DB\05D0\05E9\05E8 \05DE\05EA\05DE\05E7\05D3\05D9\05DD \05D1\05D7\05D5\05EA\05DA \05D4\05D0\05D9\05E7\05D5\05E0\05D9\05DD, \05DE\05E7\05E9\05D9 \05D4\05E7\05D9\05E6\05D5\05E8 \05D4\05D1\05D0\05D9\05DD \05D6\05DE\05D9\05E0\05D9\05DD:</p>'),
'<ul>',
unistr('    <li>\05D7\05E5 \05E9\05DE\05D0\05DC\05D9: \05D4\05D6\05D6 \05D0\05EA \05D4\05EA\05DE\05D5\05E0\05D4 \05E9\05DE\05D0\05DC\05D4*</li>'),
unistr('    <li>\05D7\05E5 \05DC\05DE\05E2\05DC\05D4: \05D4\05D6\05D6 \05D0\05EA \05D4\05EA\05DE\05D5\05E0\05D4 \05DC\05DE\05E2\05DC\05D4*</li>'),
unistr('    <li>\05D7\05E5 \05D9\05DE\05E0\05D9: \05D4\05D6\05D6 \05EA\05DE\05D5\05E0\05D4 \05D9\05DE\05D9\05E0\05D4*</li>'),
unistr('    <li>\05D7\05E5 \05DC\05DE\05D8\05D4: \05D4\05D6\05D6 \05EA\05DE\05D5\05E0\05D4 \05DC\05DE\05D8\05D4*</li>'),
unistr('    <li>I: \05D4\05EA\05E7\05E8\05D1</li>'),
unistr('    <li>O: \05D4\05EA\05E8\05D7\05E7\05D5\05EA</li>'),
unistr('    <li>L: \05E1\05D5\05D1\05D1 \05E9\05DE\05D0\05DC\05D4</li>'),
unistr('    <li>R: \05E1\05D5\05D1\05D1 \05D9\05DE\05D9\05E0\05D4</li>'),
'</ul>',
'',
unistr('<p class="margin-top-md"><em>*\05D4\05D7\05D6\05E7 \05D0\05EA \05DE\05E7\05E9 Shift \05DB\05D3\05D9 \05DC\05D4\05D6\05D9\05D6 \05DE\05D4\05E8 \05D9\05D5\05EA\05E8</em></p>')))
,p_version_scn=>2704861
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139090182535751339)
,p_name=>'ICON.EDITOR.CROPPER.SUBTITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E7\05D5\05DF \05D2\05E8\05D5\05E8 \05DB\05D3\05D9 \05DC\05DE\05E7\05DD \05DE\05D7\05D3\05E9')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139090201139751339)
,p_name=>'ICON.EDITOR.CROPPER.ZOOM_SLIDER_LABEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D6\05D6 \05DE\05D7\05D5\05D5\05DF \05DB\05D3\05D9 \05DC\05D4\05EA\05D0\05D9\05DD \05E8\05DE\05EA \05D6\05D5\05DD')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139083245263751337)
,p_name=>'ICON.EDITOR.DIALOG.TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E7\05D5\05DF \05E2\05E8\05D9\05DB\05EA \05D9\05D9\05E9\05D5\05DD')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139083507158751337)
,p_name=>'ICON.EDITOR.ERROR.SAVING'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05E9\05DE\05D9\05E8\05EA \05D0\05D9\05E7\05D5\05DF')
,p_version_scn=>2704860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139165900028751361)
,p_name=>'ICON.EDITOR.LEGACY_DATA'
,p_message_language=>'he'
,p_message_text=>unistr('<p><span class="a-Icon icon-tr-warning"></span> \05D9\05D9\05E9\05D5\05DD \05D6\05D4 \05E2\05D5\05E9\05D4 \05E9\05D9\05DE\05D5\05E9 \05D1\05D0\05D9\05E7\05D5\05DF\05D9\05DD \05E9\05D4\05EA\05E7\05D1\05DC\05D5 \05D1\05D9\05E8\05D5\05E9\05D4. \05D4\05E2\05DC\05D0\05EA \05D0\05D9\05E7\05D5\05DF \05D7\05D3\05E9 \05EA\05D2\05E8\05D5\05DD \05DC\05D4\05D7\05DC\05E4\05EA \05DB\05DC \05D4\05D0\05D9\05E7\05D5\05E0\05D9\05DD \05E9\05D4\05EA\05E7\05D1\05DC\05D5 \05D1\05D9\05E8\05D5\05E9\05D4.</p>')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139084112328751337)
,p_name=>'ICON.EDITOR.UPLOAD.ICON'
,p_message_language=>'he'
,p_message_text=>unistr('\05D8\05E2\05DF \05D0\05D9\05E7\05D5\05DF \05D7\05D3\05E9')
,p_version_scn=>2704860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139160364631751360)
,p_name=>'INVALID_CREDENTIALS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05E8\05D8\05D9 \05D0\05D9\05DE\05D5\05EA \05DC\05D4\05EA\05D7\05D1\05E8\05D5\05EA \05DC\05D0 \05EA\05E7\05E4\05D9\05DD')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139261497478751390)
,p_name=>'INVALID_VALUE_FOR_PARAMETER'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E8\05DA \05DC\05D0 \05EA\05E7\05E3 \05DC\05E4\05E8\05DE\05D8\05E8: %0')
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139154670741751358)
,p_name=>'IR_AS_DEFAULT_REPORT_SETTING'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D1\05E8\05D9\05E8\05EA \05DE\05D7\05D3\05DC \05E9\05DC \05D4\05D2\05D3\05E8\05D5\05EA \05D3\05D5\05D7')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139154730404751358)
,p_name=>'IR_AS_NAMED_REPORT'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D3\05D5\05D7 \05E9\05DE\05D9')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139136647656751353)
,p_name=>'IR_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05EA %0. %1')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139136310775751352)
,p_name=>'IR_FRM_NAV_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05D7\05E9\05D1 \05E0\05D9\05D5\05D5\05D8 \05D8\05D5\05E4\05E1. %0')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139111903773751345)
,p_name=>'IR_NOT_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05DE\05E6\05D0 \05D3\05D5\05D7 \05D0\05D9\05E0\05D8\05E8\05D0\05E7\05D8\05D9\05D1\05D9.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139111351788751345)
,p_name=>'IR_REGION_NOT_EXIST'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E7\05D9\05D9\05DD \05D0\05D6\05D5\05E8 \05D3\05D5\05D7 \05D0\05D9\05E0\05D8\05E8\05D0\05E7\05D8\05D9\05D1\05D9 \05D1\05D9\05D9\05E9\05D5\05DD %0, \05D3\05E3 %1 \05D5\05D0\05D6\05D5\05E8 %2.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139154517790751358)
,p_name=>'IR_STAR'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D5\05E6\05D2 \05DC\05DE\05E4\05EA\05D7\05D9\05DD \05D1\05DC\05D1\05D3')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139142718238751354)
,p_name=>'IR_UNIQUE_KEY_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05E9\05D0\05D9\05DC\05EA\05EA \05D4\05D3\05D5\05D7 \05D3\05E8\05D5\05E9 \05DE\05E4\05EA\05D7 \05D9\05D9\05D7\05D5\05D3\05D9 \05DB\05D3\05D9 \05DC\05D6\05D4\05D5\05EA \05DB\05DC \05E9\05D5\05E8\05D4. \05DC\05D0 \05E0\05D9\05EA\05DF \05DC\05D4\05E9\05EA\05DE\05E9 \05D1\05DE\05E4\05EA\05D7 \05E9\05E1\05D5\05E4\05E7 \05DC\05E9\05D0\05D9\05DC\05EA\05D0 \05D6\05D5. \05D4\05D2\05D3\05E8 \05E2\05DE\05D5\05D3\05EA \05DE\05E4\05EA\05D7 \05D9\05D9\05D7\05D5\05D3\05D9. %0')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139142845347751354)
,p_name=>'IR_UNIQUE_KEY_ERROR2'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05E9\05D0\05D9\05DC\05EA\05EA \05D4\05D3\05D5\05D7 \05D3\05E8\05D5\05E9 \05DE\05E4\05EA\05D7 \05D9\05D9\05D7\05D5\05D3\05D9 \05DB\05D3\05D9 \05DC\05D6\05D4\05D5\05EA \05DB\05DC \05E9\05D5\05E8\05D4. \05DC\05D0 \05E0\05D9\05EA\05DF \05DC\05D4\05E9\05EA\05DE\05E9 \05D1\05DE\05E4\05EA\05D7 \05E9\05E1\05D5\05E4\05E7 \05DC\05E9\05D0\05D9\05DC\05EA\05D0 \05D6\05D5. \05E2\05E8\05D5\05DA \05D0\05EA \05EA\05DB\05D5\05E0\05D5\05EA \05D4\05D3\05D5\05D7 \05DB\05D3\05D9 \05DC\05D4\05D2\05D3\05D9\05E8 \05E2\05DE\05D5\05D3\05EA \05DE\05E4\05EA\05D7 \05D9\05D9\05D7\05D5\05D3\05D9. %0')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139183737000751367)
,p_name=>'ITEM.FILE_UPLOAD.CHOOSE_FILE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05E8 \05E7\05D5\05D1\05E5')
,p_is_js_message=>true
,p_version_scn=>2704879
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139183681629751366)
,p_name=>'ITEM.FILE_UPLOAD.DRAG_DROP_FILE_HERE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D2\05E8\05D5\05E8 \05D5\05E9\05D7\05E8\05E8 \05E7\05D5\05D1\05E5 \05DB\05D0\05DF \05D0\05D5')
,p_is_js_message=>true
,p_version_scn=>2704879
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139104398084751343)
,p_name=>'ITEMS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05E8\05D9\05D8\05D9\05DD\00A0')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139138063906751353)
,p_name=>'ITEM_VALUE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E8\05DA \05E4\05E8\05D9\05D8')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139152687278751357)
,p_name=>'LABEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D5\05D5\05D9\05EA ')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139165251598751361)
,p_name=>'LANGUAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05E4\05D4')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139125328662751349)
,p_name=>'LAST'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D7\05E8\05D5\05DF')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139101392623751342)
,p_name=>'LENGTH'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D5\05E8\05DA')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139159641459751359)
,p_name=>'LOGIN'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05EA\05D7\05D1\05E8')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139201210048751372)
,p_name=>'MANAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05D9\05D4\05D5\05DC')
,p_version_scn=>2704881
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139264379182751391)
,p_name=>'MAXIMIZE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D2\05D3\05DC\05D4 \05DE\05E8\05D1\05D9\05EA')
,p_is_js_message=>true
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139124415302751349)
,p_name=>'MINUTE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05E7\05D4')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139124521612751349)
,p_name=>'MINUTES'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05E7\05D5\05EA')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139216506556751376)
,p_name=>'MISSING_AT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05E1\05E8 \05D4\05EA\05D5 "@" \05D1\05DB\05EA\05D5\05D1\05EA \05D4\05D3\05D5\05D0"\05DC.')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139216770689751376)
,p_name=>'MISSING_DIALOG_PAGE_TEMPLATE_WARNING'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D6\05D4\05E8\05D4: \05DC\05D0 \05D4\05D5\05D2\05D3\05E8\05D4 \05EA\05D1\05E0\05D9\05EA \05E9\05DC \05D3\05E3 \05D3\05D5-\05E9\05D9\05D7 \05DC\05D3\05E3 %0 \05D1\05D9\05D9\05E9\05D5\05DD %1.')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139216432600751376)
,p_name=>'MISSING_DOT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05E1\05E8 \05D4\05EA\05D5 "." \05D1\05D3\05D5\05DE\05D9\05D9\05DF \05E9\05DC \05DB\05EA\05D5\05D1\05EA \05D4\05D3\05D5\05D0"\05DC.')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139162741568751360)
,p_name=>'MODULE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D5\05D3\05D5\05DC')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139116900424751347)
,p_name=>'MONTH'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D5\05D3\05E9')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139120818752751348)
,p_name=>'MONTHLY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D5\05D3\05E9\05D9')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139117016697751347)
,p_name=>'MONTHS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D5\05D3\05E9\05D9\05DD')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139152282805751357)
,p_name=>'MOVE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E2\05D1\05E8')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139223074375751378)
,p_name=>'MOVE_FROM'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E2\05D1\05E8 \05DE-')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139223174405751378)
,p_name=>'MOVE_TO'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E2\05D1\05E8\05D4 \05D0\05DC')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139139286569751353)
,p_name=>'MRU.ERROR_IN_MRD'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05E4\05E2\05D5\05DC\05EA \05DE\05D7\05D9\05E7\05D4 \05E9\05DC \05DE\05E1\05E4\05E8 \05E9\05D5\05E8\05D5\05EA: \05E9\05D5\05E8\05D4 = %0, %1, %2')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139138297256751353)
,p_name=>'MUST_NOT_BE_PUBLIC_USER'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05E1\05D5\05E8 \05E9\05D9\05D4\05D9\05D4 \05DE\05E9\05EA\05DE\05E9 \05E6\05D9\05D1\05D5\05E8\05D9')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139086887252751338)
,p_name=>'NAME'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DD ')
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139152442444751357)
,p_name=>'NEW'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D3\05E9')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139116708926751347)
,p_name=>'NEW_ACCOUNT_LOGIN_INSTRUCTIONS'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D5\05DB\05DC \05DC\05D4\05EA\05D7\05D1\05E8 \05D0\05DC %0 \05E2\05DC-\05D9\05D3\05D9 \05DE\05E2\05D1\05E8 \05D0\05DC:')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139116800883751347)
,p_name=>'NEW_ACCOUNT_NOTIFICATION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05D3\05E2\05D4 \05E2\05DC \05D7\05E9\05D1\05D5\05DF %0 \05D7\05D3\05E9')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139245417588751385)
,p_name=>'NEXT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D1\05D0')
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139162678455751360)
,p_name=>'NO'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139259579708751389)
,p_name=>'NOBODY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05E3 \05D0\05D7\05D3')
,p_version_scn=>2704896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139125710290751349)
,p_name=>'NOT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E0\05D5')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139168664165751362)
,p_name=>'NOT_NULL'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0-''Null''')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139138363213751353)
,p_name=>'NOT_W_ARGUMENT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E0\05D5 %0')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139158150090751359)
,p_name=>'NO_DATA_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05DE\05E6\05D0\05D5 \05E0\05EA\05D5\05E0\05D9\05DD')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139168142517751362)
,p_name=>'NO_UPDATEABLE_REPORT_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05DE\05E6\05D0 \05D3\05D5\05D7 \05E0\05D9\05EA\05DF \05DC\05E2\05D3\05DB\05D5\05DF. \05E0\05D9\05EA\05DF \05DC\05D1\05E6\05E2 \05E4\05E2\05D5\05DC\05D5\05EA \05E9\05DC \05E2\05D3\05DB\05D5\05DF \05D5\05DE\05D7\05D9\05E7\05D4 \05DC\05DE\05E1\05E4\05E8 \05E9\05D5\05E8\05D5\05EA \05E8\05E7 \05D1\05D8\05E4\05E1\05D9\05DD \05D8\05D1\05DC\05D0\05D9\05D9\05DD \05DE\05E1\05D5\05D2 ''\05D3\05D5\05D7 \05E0\05D9\05EA\05DF \05DC\05E2\05D3\05DB\05D5\05DF''.')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139169072992751362)
,p_name=>'OK'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D5\05E7\05D9\05D9')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139164369445751361)
,p_name=>'ORACLE_APPLICATION_EXPRESS'
,p_message_language=>'he'
,p_message_text=>'Oracle APEX'
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139263210937751390)
,p_name=>'ORA_06550'
,p_message_language=>'he'
,p_message_text=>unistr('ORA-06550: \05E9\05D5\05E8\05D4 %0, \05E2\05DE\05D5\05D3\05D4 %1')
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139214178587751376)
,p_name=>'OUTDATED_BROWSER'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05EA\05D4 \05DE\05E9\05EA\05DE\05E9 \05D1\05D3\05E4\05D3\05E4\05DF \05D0\05D9\05E0\05D8\05E8\05E0\05D8 \05DE\05D9\05D5\05E9\05DF. \05DC\05E7\05D1\05DC\05EA \05E8\05E9\05D9\05DE\05D4 \05E9\05DC \05D3\05E4\05D3\05E4\05E0\05D9\05DD \05E0\05EA\05DE\05DB\05D9\05DD, \05E2\05D9\05D9\05DF \05D1\05DE\05D3\05E8\05D9\05DA Oracle APEX Installation Guide.')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139109161441751344)
,p_name=>'OUT_OF_RANGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D1\05D5\05E7\05E9 \05E1\05DC \05E9\05D5\05E8\05D5\05EA \05DC\05D0 \05EA\05E7\05E3; \05E0\05EA\05D5\05E0\05D9 \05D4\05DE\05E7\05D5\05E8 \05E9\05DC \05D4\05D3\05D5\05D7 \05D4\05E9\05EA\05E0\05D5.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139131135938751351)
,p_name=>'P.VALID_PAGE_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D5\05D1\05D4 \05DC\05E6\05D9\05D9\05DF \05DE\05E1\05E4\05E8 \05D3\05E3 \05EA\05E7\05E3, \05DC\05D3\05D5\05D2\05DE\05D4 p?n=1234.')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139135327637751352)
,p_name=>'PAGINATION.NEXT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D1\05D0')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139135438357751352)
,p_name=>'PAGINATION.NEXT_SET'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05DC \05D4\05D1\05D0')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139135514228751352)
,p_name=>'PAGINATION.PREVIOUS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E7\05D5\05D3\05DD')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139135654025751352)
,p_name=>'PAGINATION.PREVIOUS_SET'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05DC \05D4\05E7\05D5\05D3\05DD')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139245377870751385)
,p_name=>'PAGINATION.SELECT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05E8 \05E2\05D9\05DE\05D5\05D3')
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139175397296751364)
,p_name=>'PASSWORD'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D9\05E1\05DE\05D4')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139116078196751346)
,p_name=>'PASSWORD_CHANGED'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D9\05E1\05DE\05EA\05DA \05DC-%0 \05D4\05E9\05EA\05E0\05EA\05D4.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139103722044751343)
,p_name=>'PASSWORD_COMPLEXITY_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05D9\05E1\05DE\05D4 \05D0\05D9\05E0\05D4 \05EA\05D5\05D0\05DE\05EA \05DC\05DB\05DC\05DC\05D9 \05DE\05D5\05E8\05DB\05D1\05D5\05EA \05D4\05E1\05D9\05E1\05DE\05D4 \05E9\05DC \05D0\05EA\05E8 \05D6\05D4.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139102872868751343)
,p_name=>'PASSWORD_DIFFERS_BY_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05D9\05E1\05DE\05D4 \05D4\05D7\05D3\05E9\05D4 \05D7\05D9\05D9\05D1\05EA \05DC\05D4\05D9\05D5\05EA \05E9\05D5\05E0\05D4 \05DE\05D4\05E1\05D9\05E1\05DE\05D4 \05D4\05D9\05E9\05E0\05D4 \05D1-%0 \05EA\05D5\05D5\05D9\05DD \05DC\05E4\05D7\05D5\05EA.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139103471326751343)
,p_name=>'PASSWORD_LIKE_USERNAME_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05E1\05D5\05E8 \05E9\05D4\05E1\05D9\05E1\05DE\05D4 \05EA\05DB\05D9\05DC \05E9\05DD \05DE\05E9\05EA\05DE\05E9.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139103615494751343)
,p_name=>'PASSWORD_LIKE_WORDS_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05D9\05E1\05DE\05D4 \05DE\05DB\05D9\05DC\05D4 \05DE\05D9\05DC\05D4 \05E4\05E9\05D5\05D8\05D4 \05D0\05E1\05D5\05E8\05D4.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139103518971751343)
,p_name=>'PASSWORD_LIKE_WORKSPACE_NAME_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05E1\05D5\05E8 \05E9\05D4\05E1\05D9\05E1\05DE\05D4 \05EA\05DB\05D9\05DC \05E9\05DD \05DE\05E8\05D7\05D1 \05E2\05D1\05D5\05D3\05D4.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139102780535751343)
,p_name=>'PASSWORD_MIN_LEN_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D9\05E1\05DE\05D4 \05D7\05D9\05D9\05D1\05EA \05DC\05D4\05DB\05D9\05DC \05DC\05E4\05D7\05D5\05EA %0 \05EA\05D5\05D5\05D9\05DD.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139102983911751343)
,p_name=>'PASSWORD_ONE_ALPHA_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05D9\05E1\05DE\05D4 \05D7\05D9\05D9\05D1\05EA \05DC\05D4\05DB\05D9\05DC \05DC\05E4\05D7\05D5\05EA \05EA\05D5 \05D0\05DC\05E4\05D0\05D1\05D9\05EA\05D9 \05D0\05D7\05D3 (%0).')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139103346686751343)
,p_name=>'PASSWORD_ONE_LOWER_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05D9\05E1\05DE\05D4 \05D7\05D9\05D9\05D1\05EA \05DC\05D4\05DB\05D9\05DC \05DC\05E4\05D7\05D5\05EA \05EA\05D5 \05D0\05DC\05E4\05D0\05D1\05D9\05EA\05D9 \05D0\05D7\05D3 \05D1\05D0\05D5\05EA \05E7\05D8\05E0\05D4.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139103077302751343)
,p_name=>'PASSWORD_ONE_NUMERIC_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05D9\05E1\05DE\05D4 \05D7\05D9\05D9\05D1\05EA \05DC\05D4\05DB\05D9\05DC \05DC\05E4\05D7\05D5\05EA \05EA\05D5 \05DE\05E1\05E4\05E8\05D9 \05D0\05D7\05D3 (0123456789).')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139103168895751343)
,p_name=>'PASSWORD_ONE_PUNCTUATION_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05D9\05E1\05DE\05D4 \05D7\05D9\05D9\05D1\05EA \05DC\05D4\05DB\05D9\05DC \05DC\05E4\05D7\05D5\05EA \05EA\05D5 \05E4\05D9\05E1\05D5\05E7 \05D0\05D7\05D3 (%0).')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139103221156751343)
,p_name=>'PASSWORD_ONE_UPPER_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05D9\05E1\05DE\05D4 \05D7\05D9\05D9\05D1\05EA \05DC\05D4\05DB\05D9\05DC \05DC\05E4\05D7\05D5\05EA \05EA\05D5 \05D0\05DC\05E4\05D0\05D1\05D9\05EA\05D9 \05D0\05D7\05D3 \05D1\05D0\05D5\05EA \05E8\05D9\05E9\05D9\05EA.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139116560160751347)
,p_name=>'PASSWORD_RESET_NOTIFICATION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05D3\05E2\05EA \05D0\05D9\05E4\05D5\05E1 \05E1\05D9\05E1\05DE\05D4')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139101647082751342)
,p_name=>'PASSWORD_REUSE_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05E1\05D5\05E8 \05DC\05D4\05E9\05EA\05DE\05E9 \05D1\05E1\05D9\05E1\05DE\05D4 \05DB\05D9\05D5\05D5\05DF \05E9\05E0\05E2\05E9\05D4 \05D1\05D4 \05E9\05D9\05DE\05D5\05E9 \05D1\05DE\05D4\05DC\05DA %0 \05D4\05D9\05DE\05D9\05DD \05D4\05E7\05D5\05D3\05DE\05D9\05DD.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139098331914751341)
,p_name=>'PCT_GRAPH_ARIA_LABEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D2\05E8\05E3 \05D0\05D7\05D5\05D6\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139189963959751368)
,p_name=>'PE.COMPONEN.TYPE.PAGE_ITEM.PLURAL'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05E8\05D9\05D8\05D9\05DD\00A0')
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139190003292751368)
,p_name=>'PE.COMPONEN.TYPE.PAGE_ITEM.SINGULAR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05E8\05D9\05D8')
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139164182964751361)
,p_name=>'PERCENT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D7\05D5\05D6\05D9\05DD')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139133420809751352)
,p_name=>'PLEASE_CONTACT_ADMINISTRATOR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05E0\05D4 \05DC\05DE\05E0\05D4\05DC\05DF.')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139245517299751385)
,p_name=>'PREVIOUS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E7\05D5\05D3\05DD')
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139182109947751366)
,p_name=>'PRINT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D3\05E4\05E1')
,p_version_scn=>2704879
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139162980209751360)
,p_name=>'PRIVILEGES'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E8\05E9\05D0\05D5\05EA')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139131583262751351)
,p_name=>'REGIOIN_REFERENCES'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E4\05E0\05D9\05D5\05EA \05DC\05D0\05D6\05D5\05E8')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139152519112751357)
,p_name=>'REPORT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05D5\05D7')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139162838385751360)
,p_name=>'REPORTING_PERIOD'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05E7\05D5\05E4\05EA \05D3\05D9\05D5\05D5\05D7')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139245792325751385)
,p_name=>'REPORT_LABEL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05D5\05D7: %0')
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139163552171751361)
,p_name=>'REPORT_TOTAL'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D4"\05DB \05DC\05D3\05D5\05D7')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139109283258751344)
,p_name=>'RESET'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E4\05D5\05E1 \05E2\05D9\05DE\05D5\05D3')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139137991021751353)
,p_name=>'RESET_PAGINATION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E4\05D5\05E1 \05E2\05D9\05DE\05D5\05D3')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139168087250751362)
,p_name=>'RESET_PASSWORD'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E4\05D5\05E1 \05E1\05D9\05E1\05DE\05D4')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139143891029751355)
,p_name=>'RESTORE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D7\05D6\05E8')
,p_is_js_message=>true
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139177491834751365)
,p_name=>'RESULTS'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D5\05E6\05D0\05D5\05EA')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139169145217751362)
,p_name=>'RETURN_TO_APPLICATION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D6\05E8\05D4 \05DC\05D9\05D9\05E9\05D5\05DD.')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139169536903751362)
,p_name=>'RIGHT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05DE\05D9\05DF')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139201587690751372)
,p_name=>'ROW'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D5\05E8\05D4 %0')
,p_version_scn=>2704881
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139152114772751357)
,p_name=>'ROW_COUNT'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E1\05E4\05E8 \05E9\05D5\05E8\05D5\05EA')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139041960701751324)
,p_name=>'RW_AO_ASK_ORACLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D0\05DC \05D0\05EA Oracle')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139042278073751324)
,p_name=>'RW_AO_CLOSE_ASK_ORACLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D2\05D5\05E8 \05D0\05EA ''\05E9\05D0\05DC \05D0\05EA Oracle''')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139042583782751324)
,p_name=>'RW_AO_NOTIFICATIONS_LIST'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05E9\05D9\05DE\05EA \05D4\05D5\05D3\05E2\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139042196191751324)
,p_name=>'RW_AO_OPEN_ASK_ORACLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05EA\05D7 \05D0\05EA ''\05E9\05D0\05DC \05D0\05EA Oracle''')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139042491997751324)
,p_name=>'RW_AO_PRODUCT_MAP'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E4\05EA \05D4\05DE\05D5\05E6\05E8')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139042302754751324)
,p_name=>'RW_AO_SUGGESTIONS_LIST'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05E9\05D9\05DE\05EA \05D4\05E6\05E2\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139043279550751325)
,p_name=>'RW_CLEAR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05E7\05D4')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139043175627751325)
,p_name=>'RW_CLOSE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D2\05D5\05E8')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139042991881751324)
,p_name=>'RW_FO_VIEW_MORE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E6\05D2 \05E2\05D5\05D3')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139043390196751325)
,p_name=>'RW_GO_TO'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D1\05D5\05E8 \05D0\05DC')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139042799241751324)
,p_name=>'RW_GP_STEP'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DC\05D1')
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139042854270751324)
,p_name=>'RW_GP_STEP_OF'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DC')
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139042624672751324)
,p_name=>'RW_GP_TOGGLE_STEPS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D7\05DC\05E3 \05DE\05E6\05D1 \05E9\05DC \05EA\05E6\05D5\05D2\05EA \05E9\05DC\05D1\05D9\05DD')
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139041769257751324)
,p_name=>'RW_HIDE_PASSWORD'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05EA\05E8 \05E1\05D9\05E1\05DE\05D4')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139043072317751324)
,p_name=>'RW_OPEN'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05EA\05D7')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139041528044751324)
,p_name=>'RW_ORACLE'
,p_message_language=>'he'
,p_message_text=>'Oracle'
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139041632112751324)
,p_name=>'RW_SHOW_PASSWORD'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E6\05D2 \05E1\05D9\05E1\05DE\05D4')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139043440638751325)
,p_name=>'RW_START'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05EA\05D7\05DC\05D4')
,p_is_js_message=>true
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139168589789751362)
,p_name=>'SAVE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DE\05D5\05E8')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139164772546751361)
,p_name=>'SAVED_REPORTS.ALTERNATIVE.DEFAULT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05E8\05D9\05E8\05EA \05DE\05D7\05D3\05DC \05D7\05DC\05D5\05E4\05D9\05EA')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139165139871751361)
,p_name=>'SAVED_REPORTS.DESCRIPTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D9\05D0\05D5\05E8')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139164662237751361)
,p_name=>'SAVED_REPORTS.PRIMARY.DEFAULT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05E8\05D9\05E8\05EA \05DE\05D7\05D3\05DC \05E8\05D0\05E9\05D9\05EA')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139165425632751361)
,p_name=>'SC_REPORT_ROWS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05E9 \05D9\05D5\05EA\05E8 \05DE-%0 \05E9\05D5\05E8\05D5\05EA \05D6\05DE\05D9\05E0\05D5\05EA. \05D4\05D2\05D3\05DC \05D0\05EA \05D1\05D5\05E8\05E8 \05D4\05E9\05D5\05E8\05D5\05EA \05DB\05D3\05D9 \05DC\05D4\05E6\05D9\05D2 \05E2\05D5\05D3 \05E9\05D5\05E8\05D5\05EA.')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139232867099751381)
,p_name=>'SEARCH'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05E4\05E9')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139124363008751349)
,p_name=>'SECONDS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05E0\05D9\05D5\05EA')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139164257786751361)
,p_name=>'SEE_ATTACHED'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D9\05D9\05DF \05D1\05DE\05E1\05DE\05DA \05D4\05DE\05E6\05D5\05E8\05E3')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139224825297751379)
,p_name=>'SELECT_ROW'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D7\05E8 \05E9\05D5\05E8\05D4 ')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139163954341751361)
,p_name=>'SET_SCREEN_READER_MODE_OFF'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D2\05D3\05E8 \05DE\05E6\05D1 ''\05DB\05D1\05D5\05D9'' \05E9\05DC \05E7\05D5\05E8\05D0 \05D4\05DE\05E1\05DA')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139164004919751361)
,p_name=>'SET_SCREEN_READER_MODE_ON'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D2\05D3\05E8 \05DE\05E6\05D1 ''\05DE\05D5\05E4\05E2\05DC'' \05E9\05DC \05E7\05D5\05E8\05D0 \05D4\05DE\05E1\05DA')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139160230150751360)
,p_name=>'SHOW'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E6\05D2')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139226675575751379)
,p_name=>'SHOW_ALL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E6\05D2 \05D4\05DB\05DC')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139251416215751387)
,p_name=>'SIGN_IN'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05EA\05D7\05D1\05E8')
,p_version_scn=>2704893
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139202317675751372)
,p_name=>'SIGN_OUT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05EA\05E0\05EA\05E7')
,p_version_scn=>2704881
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139153173920751357)
,p_name=>'SINCE_DAYS_AGO'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05E4\05E0\05D9 %0 \05D9\05DE\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139160749285751360)
,p_name=>'SINCE_DAYS_FROM_NOW'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D9\05DE\05D9\05DD \05DE\05E2\05DB\05E9\05D9\05D5')
,p_is_js_message=>true
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139153017525751357)
,p_name=>'SINCE_HOURS_AGO'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05E4\05E0\05D9 %0 \05E9\05E2\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139160610993751360)
,p_name=>'SINCE_HOURS_FROM_NOW'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05E9\05E2\05D5\05EA \05DE\05E2\05DB\05E9\05D9\05D5')
,p_is_js_message=>true
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139152911660751357)
,p_name=>'SINCE_MINUTES_AGO'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05E4\05E0\05D9 %0 \05D3\05E7\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139160531710751360)
,p_name=>'SINCE_MINUTES_FROM_NOW'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D3\05E7\05D5\05EA \05DE\05E2\05DB\05E9\05D9\05D5')
,p_is_js_message=>true
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139153358586751358)
,p_name=>'SINCE_MONTHS_AGO'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05E4\05E0\05D9 %0 \05D7\05D5\05D3\05E9\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139160982730751360)
,p_name=>'SINCE_MONTHS_FROM_NOW'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D7\05D5\05D3\05E9\05D9\05DD \05DE\05E2\05DB\05E9\05D9\05D5')
,p_is_js_message=>true
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139161127277751360)
,p_name=>'SINCE_NOW'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05E2\05EA')
,p_is_js_message=>true
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139152831474751357)
,p_name=>'SINCE_SECONDS_AGO'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05E4\05E0\05D9 %0 \05E9\05E0\05D9\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139160470316751360)
,p_name=>'SINCE_SECONDS_FROM_NOW'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05E9\05E0\05D9\05D5\05EA \05DE\05E2\05DB\05E9\05D9\05D5')
,p_is_js_message=>true
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139153255093751357)
,p_name=>'SINCE_WEEKS_AGO'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05E4\05E0\05D9 %0 \05E9\05D1\05D5\05E2\05D5\05EA')
,p_is_js_message=>true
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139160840548751360)
,p_name=>'SINCE_WEEKS_FROM_NOW'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05E9\05D1\05D5\05E2\05D5\05EA \05DE\05E2\05DB\05E9\05D9\05D5')
,p_is_js_message=>true
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139153425933751358)
,p_name=>'SINCE_YEARS_AGO'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05E4\05E0\05D9 %0 \05E9\05E0\05D9\05DD')
,p_is_js_message=>true
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139161007595751360)
,p_name=>'SINCE_YEARS_FROM_NOW'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05E9\05E0\05D9\05DD \05DE\05E2\05DB\05E9\05D9\05D5')
,p_is_js_message=>true
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139146978989751356)
,p_name=>'STANDARD'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D8\05E0\05D3\05E8\05D8\05D9')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139163805582751361)
,p_name=>'START_DATE'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D0\05E8\05D9\05DA \05D4\05EA\05D7\05DC\05D4')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139099040965751341)
,p_name=>'SUBSCRIPTION_CREATED_BY'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D9\05D1\05DC\05EA \05D4\05D5\05D3\05E2\05EA \05D3\05D5\05D0"\05DC \05D6\05D5 \05DE\05DE\05E0\05D5\05D9 \05D3\05D5\05D7 \05D0\05D9\05E0\05D8\05E8\05D0\05E7\05D8\05D9\05D1\05D9 \05E9\05E0\05D5\05E6\05E8 \05E2\05DC-\05D9\05D3\05D9 %0.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139260604708751389)
,p_name=>'SUBSCRIPTION_REFERENCES'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E0\05D5\05D9\05D9\05DD')
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139210039422751374)
,p_name=>'TAB'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05E8\05D8\05D9\05E1\05D9\05D9\05D4')
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139124288179751349)
,p_name=>'TITLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D5\05EA\05E8\05EA')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139103903133751343)
,p_name=>'TODAY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D9\05D5\05DD')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139163437814751361)
,p_name=>'TOTAL'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D4"\05DB')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139105202202751343)
,p_name=>'TO_MANY_COLUMNS_SELECTED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05E4\05E9\05E8 \05DC\05D1\05D7\05D5\05E8 %0 \05E2\05DE\05D5\05D3\05D5\05EA \05DC\05DB\05DC \05D4\05D9\05D5\05EA\05E8.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139061091251751330)
,p_name=>'TREE.COLLAPSE_ALL'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D5\05D5\05E5 \05D4\05DB\05DC')
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139061662578751330)
,p_name=>'TREE.COLLAPSE_ALL_BELOW'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05D5\05D5\05E5 \05DB\05DC \05DE\05D4 \05E9\05DC\05DE\05D8\05D4')
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139060613768751330)
,p_name=>'TREE.EXPAND_ALL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E8\05D7\05D1 \05D4\05DB\05DC')
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139061391202751330)
,p_name=>'TREE.EXPAND_ALL_BELOW'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E8\05D7\05D1 \05DB\05DC \05DE\05D4 \05E9\05DC\05DE\05D8\05D4')
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139061838448751330)
,p_name=>'TREE.REPARENT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D2\05D3\05E8 \05D0\05D1 \05DE\05D7\05D3\05E9')
,p_is_js_message=>true
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139183907855751367)
,p_name=>'TREES'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E6\05D9\05DD')
,p_version_scn=>2704879
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139226730607751379)
,p_name=>'UI.FORM.REQUIRED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05E8\05D5\05E9')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139147675226751356)
,p_name=>'UNAUTHORIZED'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05DE\05D5\05E8\05E9\05D4')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139197884012751371)
,p_name=>'UNAVAILABLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05D6\05DE\05D9\05DF')
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139161565080751360)
,p_name=>'UNKNOWN'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05D9\05D3\05D5\05E2')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139099978200751342)
,p_name=>'UNKNOWN_AUTHENTICATION_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E8\05E2\05D4 \05E9\05D2\05D9\05D0\05EA \05D0\05D9\05DE\05D5\05EA \05DC\05D0 \05DE\05D6\05D5\05D4\05D4.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139102131442751342)
,p_name=>'UNSUBSCRIBE_SUBSCRIPTION_MSG_HTML'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05DD \05D0\05D9\05E0\05DA \05DE\05E2\05D5\05E0\05D9\05D9\05DF \05DC\05E7\05D1\05DC \05E2\05D5\05D3 \05D4\05D5\05D3\05E2\05D5\05EA \05D3\05D5\05D0"\05DC, \05DC\05D7\05E5 \05E2\05DC <a href="%0">\05D1\05D9\05D8\05D5\05DC \05DE\05E0\05D5\05D9</a> \05DB\05D3\05D9 \05DC\05E0\05D4\05DC \05D0\05EA \05D4\05DE\05E0\05D5\05D9 \05E9\05DC\05DA.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139098933155751341)
,p_name=>'UNSUBSCRIBE_SUBSCRIPTION_MSG_TXT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05DD \05D0\05D9\05E0\05DA \05DE\05E2\05D5\05E0\05D9\05D9\05DF \05DC\05E7\05D1\05DC \05E2\05D5\05D3 \05D4\05D5\05D3\05E2\05D5\05EA \05D3\05D5\05D0"\05DC, \05E2\05D1\05D5\05E8 \05D0\05DC \05DB\05EA\05D5\05D1\05EA \05D4-URL \05D4\05D1\05D0\05D4 \05DB\05D3\05D9 \05DC\05E0\05D4\05DC \05D0\05EA \05D4\05DE\05E0\05D5\05D9 \05E9\05DC\05DA:')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139138455447751353)
,p_name=>'UNSUPPORTED_DATA_TYPE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D5\05D2 \05E0\05EA\05D5\05E0\05D9\05DD \05DC\05D0 \05E0\05EA\05DE\05DA')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139125519154751349)
,p_name=>'UPDATE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D3\05DB\05DF')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139124126578751349)
,p_name=>'UPDATED'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05D5\05D3\05DB\05DF')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139067394919751332)
,p_name=>'UPGRADE_IN_PROGRESS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D3\05E8\05D5\05D2 \05D1\05EA\05D4\05DC\05D9\05DA')
,p_version_scn=>2704858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139067667526751332)
,p_name=>'UPGRADE_IN_PROGRESS_DETAIL'
,p_message_language=>'he'
,p_message_text=>unistr('Oracle APEX \05DE\05E9\05D5\05D3\05E8\05D2 \05DC\05D2\05E8\05E1\05D4 \05D7\05D3\05E9\05D4 \05D9\05D5\05EA\05E8. \05EA\05D4\05DC\05D9\05DA \05D6\05D4 \05D0\05D5\05E8\05DA \05D1\05D3\05E8\05DA \05DB\05DC\05DC \05E2\05D3 3 \05D3\05E7\05D5\05EA.')
,p_version_scn=>2704858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139130956671751351)
,p_name=>'URL_PROHIBITED'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05EA\05D5\05D1\05EA \05D4-URL \05D4\05DE\05D1\05D5\05E7\05E9\05EA \05D0\05E1\05D5\05E8\05D4. \05E4\05E0\05D4 \05DC\05DE\05E0\05D4\05DC\05DF.')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139152060787751357)
,p_name=>'USER'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E9\05EA\05DE\05E9')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139175236894751364)
,p_name=>'USERNAME'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DD \05DE\05E9\05EA\05DE\05E9')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139216611180751376)
,p_name=>'USERNAME_TOO_LONG'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DD \05D4\05DE\05E9\05EA\05DE\05E9 \05D0\05E8\05D5\05DA \05DE\05D3\05D9. \05D4\05D2\05D1\05D5\05DC \05D4\05D5\05D0 %0 \05EA\05D5\05D5\05D9\05DD.')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139159167179751359)
,p_name=>'USERS'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E9\05EA\05DE\05E9\05D9\05DD')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139216213117751376)
,p_name=>'USER_EXISTS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DD \05D4\05DE\05E9\05EA\05DE\05E9 \05DB\05D1\05E8 \05E7\05D9\05D9\05DD.')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139230040860751380)
,p_name=>'USER_PROFILE_IMAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05DE\05D5\05E0\05EA \05E4\05E8\05D5\05E4\05D9\05DC \05DC\05DE\05E9\05EA\05DE\05E9 %0')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139091901714751339)
,p_name=>'UTILIZATION_REPORTS.AUTOMATION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D5\05D8\05D5\05DE\05E6\05D9\05D4- %0')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139090438467751339)
,p_name=>'UTILIZATION_REPORTS.PAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05E3 %0 - %1 ')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139093332762751340)
,p_name=>'UTILIZATION_REPORTS.PLUG_NAME'
,p_message_language=>'he'
,p_message_text=>'%0 - %1'
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139093427861751340)
,p_name=>'UTILIZATION_REPORTS.PROCESS_NAME'
,p_message_language=>'he'
,p_message_text=>'%0 - %1'
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139092360090751339)
,p_name=>'UTILIZATION_REPORTS.SEARCH_CONFIG'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05E6\05D5\05E8\05EA \05D7\05D9\05E4\05D5\05E9 - %0')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139092244778751339)
,p_name=>'UTILIZATION_REPORTS.SHARED_DYNAMIC_LOV'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05E9\05D9\05DE\05EA \05E2\05E8\05DB\05D9\05DD \05D3\05D9\05E0\05DE\05D9\05EA \05DE\05E9\05D5\05EA\05E4\05EA - %0')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139092060437751339)
,p_name=>'UTILIZATION_REPORTS.TASK_DEFINITION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D2\05D3\05E8\05EA \05DE\05E9\05D9\05DE\05D4 - %0')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139090559387751339)
,p_name=>'UTILIZATION_REPORTS.WORKFLOW'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D4\05DC\05D9\05DA \05E2\05D1\05D5\05D3\05D4 - %0 ')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139112663855751345)
,p_name=>'VALID'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05E7\05E3')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139104245991751343)
,p_name=>'VALIDATIONS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D3\05D9\05E7\05D5\05EA \05EA\05E7\05D9\05E0\05D5\05EA')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139164983646751361)
,p_name=>'VALUE_MUST_BE_SPECIFIED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D5\05D1\05D4 \05DC\05E6\05D9\05D9\05DF \05E2\05E8\05DA')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139211246917751375)
,p_name=>'VALUE_MUST_BE_SPECIFIED_FOR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D5\05D1\05D4 \05DC\05E6\05D9\05D9\05DF \05E2\05E8\05DA \05DC-%0')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139133831674751352)
,p_name=>'VERTICAL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05E0\05DB\05D9')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139125411254751349)
,p_name=>'VIEW'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E6\05D2')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139159243653751359)
,p_name=>'VIEWS'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D1\05D8\05D9\05DD')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139165766585751361)
,p_name=>'VIEW_ALL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E6\05D2 \05D4\05DB\05DC')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139105623919751343)
,p_name=>'VISUALLY_HIDDEN_LINK'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D9\05E9\05D5\05E8 \05E0\05E1\05EA\05E8 \05DE\05D4\05E2\05D9\05DF')
,p_is_js_message=>true
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139146472500751355)
,p_name=>'WARNING'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D6\05D4\05E8\05D4')
,p_is_js_message=>true
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139125026852751349)
,p_name=>'WEEK'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D1\05D5\05E2')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139120963493751348)
,p_name=>'WEEKLY'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D1\05D5\05E2\05D9')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139125156552751349)
,p_name=>'WEEKS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D1\05D5\05E2\05D5\05EA')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139165058876751361)
,p_name=>'WELCOME_USER'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05E8\05D5\05DB\05D9\05DD \05D4\05D1\05D0: %0')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139163294895751360)
,p_name=>'WWV_DBMS_SQL.INVALID_CLOB'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05DE\05E6\05D0 \05E2\05E8\05DA \05DE\05E1\05E4\05E8 \05DC\05D0 \05EA\05E7\05E3. \05D9\05E9 \05DC\05D5\05D5\05D3\05D0 \05D0\05EA \05D4\05E0\05EA\05D5\05E0\05D9\05DD \05E9\05D4\05D5\05D6\05E0\05D5.')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139163374499751360)
,p_name=>'WWV_DBMS_SQL.INVALID_DATATYPE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05DE\05E6\05D0 \05E2\05E8\05DA \05DE\05E1\05E4\05E8 \05DC\05D0 \05EA\05E7\05E3. \05D9\05E9 \05DC\05D5\05D5\05D3\05D0 \05D0\05EA \05D4\05E0\05EA\05D5\05E0\05D9\05DD \05E9\05D4\05D5\05D6\05E0\05D5.')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139101174739751342)
,p_name=>'WWV_DBMS_SQL.INVALID_DATE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05DE\05E6\05D0 \05E2\05E8\05DA \05EA\05D0\05E8\05D9\05DA \05DC\05D0 \05EA\05E7\05E3. \05D9\05E9 \05DC\05D5\05D5\05D3\05D0 \05D0\05EA \05E4\05D5\05E8\05DE\05D8 \05D4\05EA\05D0\05E8\05D9\05DA.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139163121362751360)
,p_name=>'WWV_DBMS_SQL.INVALID_NUMBER'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05DE\05E6\05D0 \05E2\05E8\05DA \05DE\05E1\05E4\05E8 \05DC\05D0 \05EA\05E7\05E3. \05D9\05E9 \05DC\05D5\05D5\05D3\05D0 \05D0\05EA \05E4\05D5\05E8\05DE\05D8 \05D4\05DE\05E1\05E4\05E8.')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139112268840751345)
,p_name=>'WWV_DBMS_SQL.INVALID_TIMESTAMP'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05DE\05E6\05D0 \05E2\05E8\05DA \05DC\05D0 \05EA\05E7\05E3 \05E9\05DC \05D7\05D5\05EA\05DE\05EA \05D6\05DE\05DF. \05D9\05E9 \05DC\05D5\05D5\05D3\05D0 \05D0\05EA \05E4\05D5\05E8\05DE\05D8 \05D7\05D5\05EA\05DE\05EA \05D4\05D6\05DE\05DF.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139136749831751353)
,p_name=>'WWV_DBMS_SQL.UNABLE_TO_BIND_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05DB\05E8\05D5\05DA \05D0\05EA "%0". \05D4\05E9\05EA\05DE\05E9 \05D1\05DE\05D9\05E8\05DB\05D0\05D5\05EA \05DB\05E4\05D5\05DC\05D5\05EA \05DC\05E4\05E8\05D9\05D8\05D9\05DD \05DE\05E8\05D5\05D1\05D9 \05D1\05D9\05D9\05D8\05D9\05DD, \05D0\05D5 \05D5\05D3\05D0 \05E9\05D0\05D5\05E8\05DA \05E4\05E8\05D9\05D8 \05D4\05D5\05D0 30 \05D1\05D9\05D9\05D8\05D9\05DD \05D0\05D5 \05E4\05D7\05D5\05EA. \05D4\05E9\05EA\05DE\05E9 \05D1\05EA\05D7\05D1\05D9\05E8 v() \05DB\05D3\05D9 \05DC\05D4\05E4\05E0\05D5\05EA \05DC\05E4\05E8\05D9\05D8\05D9\05DD \05D0\05E8\05D5\05DB\05D9\05DD \05DE-30 \05D1\05D9\05D9\05D8\05D9\05DD.')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139126596136751350)
,p_name=>'WWV_FLOW.ACCESS_DENIED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D2\05D9\05E9\05D4 \05E0\05D3\05D7\05EA\05D4 \05D1\05D0\05DE\05E6\05E2\05D5\05EA \05D1\05D3\05D9\05E7\05EA \05D0\05D1\05D8\05D7\05EA %0')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139129093794751350)
,p_name=>'WWV_FLOW.APP_NOT_AVAILABLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05D9\05E9\05D5\05DD \05DC\05D0 \05D6\05DE\05D9\05DF')
,p_version_scn=>2704869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139127402619751350)
,p_name=>'WWV_FLOW.APP_NOT_FOUND_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D9\05D9\05E9\05D5\05DD \05DC\05D0 \05E0\05DE\05E6\05D0.')
,p_version_scn=>2704869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139127581893751350)
,p_name=>'WWV_FLOW.APP_NOT_FOUND_FOOTER_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05D9\05E9\05D5\05DD = %0 \05DE\05E8\05D7\05D1 \05E2\05D1\05D5\05D3\05D4 = %1')
,p_version_scn=>2704869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139127927867751350)
,p_name=>'WWV_FLOW.APP_RESTRICTED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D2\05D9\05E9\05D4 \05DC\05D9\05D9\05E9\05D5\05DD \05D6\05D4 \05DE\05D5\05D2\05D1\05DC\05EA. \05E0\05E1\05D4 \05E9\05D5\05D1 \05D9\05D5\05EA\05E8 \05DE\05D0\05D5\05D7\05E8.')
,p_version_scn=>2704869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139127885221751350)
,p_name=>'WWV_FLOW.APP_RESTRICTED_TO_DEV'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D2\05D9\05E9\05D4 \05DC\05D9\05D9\05E9\05D5\05DD \05D6\05D4 \05DE\05D5\05D2\05D1\05DC\05EA \05DC\05DE\05E4\05EA\05D7\05D9 \05D9\05D9\05E9\05D5\05DE\05D9\05DD. \05E0\05E1\05D4 \05E9\05D5\05D1 \05D9\05D5\05EA\05E8 \05DE\05D0\05D5\05D7\05E8.')
,p_version_scn=>2704869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139127087624751350)
,p_name=>'WWV_FLOW.BRANCH_FUNC_RETURNING_URL_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('ERR-7744 \05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05E2\05D1\05D3 \05D4\05E1\05EA\05E2\05E4\05D5\05EA \05DC\05E4\05D5\05E0\05E7\05E6\05D9\05D4 \05E9\05DE\05D7\05D6\05D9\05E8\05D4 \05DB\05EA\05D5\05D1\05EA URL.')
,p_version_scn=>2704869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139126948818751350)
,p_name=>'WWV_FLOW.BRANCH_TO_FUNCT_RET_PAGE_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('ERR-7744 \05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05E2\05D1\05D3 \05D4\05E1\05EA\05E2\05E4\05D5\05EA \05DC\05E4\05D5\05E0\05E7\05E6\05D9\05D4 \05E9\05DE\05D7\05D6\05D9\05E8\05D4 \05D3\05E3.')
,p_version_scn=>2704869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139127250324751350)
,p_name=>'WWV_FLOW.CALL_TO_SHOW_FROM_PROC_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('ERR-1430 \05E7\05E8\05D9\05D0\05D4 \05DC\05D4\05E6\05D2\05D4 \05DE\05E2\05D9\05D1\05D5\05D3 \05D3\05E3, \05D0\05D9\05E0\05D4 \05E0\05EA\05DE\05DB\05EA: G_FLOW_STEP_ID (%0).')
,p_version_scn=>2704869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139128308403751350)
,p_name=>'WWV_FLOW.CLEAR_STEP_CACHE_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('ERR-1018 \05E9\05D2\05D9\05D0\05D4 \05D1\05E0\05D9\05E7\05D5\05D9 \05DE\05D8\05DE\05D5\05DF \05E9\05DC\05D1.')
,p_version_scn=>2704869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139126758461751350)
,p_name=>'WWV_FLOW.COMP_UNKNOWN_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('ERR-1005 \05E1\05D5\05D2 \05D7\05D9\05E9\05D5\05D1 \05DC\05D0 \05D9\05D3\05D5\05E2.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139127672631751350)
,p_name=>'WWV_FLOW.CUSTOM_AUTH_SESSION_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('ERR-1201 \05DC\05D0 \05D4\05D5\05D2\05D3\05E8 \05DE\05D6\05D4\05D4 \05DE\05D5\05E9\05D1 \05E2\05D1\05D5\05D3\05D4 \05D1\05D0\05D9\05DE\05D5\05EA \05D4\05EA\05D0\05DE\05D4 \05D0\05D9\05E9\05D9\05EA.')
,p_version_scn=>2704869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139127785266751350)
,p_name=>'WWV_FLOW.CUSTOM_AUTH_SESSION_FOOTER_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05E3 = %0')
,p_version_scn=>2704869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139127359748751350)
,p_name=>'WWV_FLOW.DET_COMPANY_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('ERR-7620 \05DC\05D0 \05E0\05D9\05EA\05DF \05DC\05E7\05D1\05D5\05E2 \05DE\05E8\05D7\05D1 \05E2\05D1\05D5\05D3\05D4 \05DC\05D9\05D9\05E9\05D5\05DD (%0).')
,p_version_scn=>2704869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139107865702751344)
,p_name=>'WWV_FLOW.EDIT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E8\05D5\05DA')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139126492149751350)
,p_name=>'WWV_FLOW.FIND_ITEM_ERR2'
,p_message_language=>'he'
,p_message_text=>unistr('ERR-1802 \05DC\05D0 \05E0\05DE\05E6\05D0 \05DE\05D6\05D4\05D4 \05D4\05E4\05E8\05D9\05D8 "%0"')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139126181026751349)
,p_name=>'WWV_FLOW.FIND_ITEM_ID_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('ERR-1002 \05DC\05D0 \05E0\05DE\05E6\05D0 \05DE\05D6\05D4\05D4 \05E4\05E8\05D9\05D8 \05DC\05E4\05E8\05D9\05D8 "%0" \05D1\05D9\05D9\05E9\05D5\05DD "%1".')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139126200091751349)
,p_name=>'WWV_FLOW.FIND_ITEM_ID_ERR2'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05DC\05EA\05D9 \05E6\05E4\05D5\05D9\05D4, \05DC\05D0 \05E0\05DE\05E6\05D0 \05E9\05DD \05E4\05E8\05D9\05D8 \05D1\05E8\05DE\05EA \05D4\05D9\05D9\05E9\05D5\05DD \05D0\05D5 \05D4\05D3\05E3.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139126699294751350)
,p_name=>'WWV_FLOW.FIRST_PAGE_DATA_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05EA\05D4 \05E0\05DE\05E6\05D0 \05DB\05D1\05E8 \05D1\05D3\05E3 \05D4\05E0\05EA\05D5\05E0\05D9\05DD \05D4\05E8\05D0\05E9\05D5\05DF.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139143113712751354)
,p_name=>'WWV_FLOW.ITEM_POSTING_VIOLATION'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D6\05D4\05D4 \05D4\05E4\05E8\05D9\05D8 (%0) \05D0\05D9\05E0\05D5 \05E4\05E8\05D9\05D8 \05E9\05D4\05D5\05D2\05D3\05E8 \05D1\05D3\05E3 \05D4\05E0\05D5\05DB\05D7\05D9.')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139100778436751342)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.INTERNAL_ONLY'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05D9\05EA\05DF \05DC\05D4\05D2\05D3\05D9\05E8 \05D0\05EA \05D4\05E4\05E8\05D9\05D8 \05E2\05DC-\05D9\05D3\05D9 \05D4\05E2\05D1\05E8\05EA \05D0\05E8\05D2\05D5\05DE\05E0\05D8\05D9\05DD \05DC\05D9\05D9\05E9\05D5\05DD.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139101038675751342)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.NO_CHECKSUM'
,p_message_language=>'he'
,p_message_text=>unistr('(\05DC\05D0 \05E1\05D5\05E4\05E7 checksum)')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139100565492751342)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.PRIVATE_BOOKMARK'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05D9\05EA\05DF \05DC\05D4\05D2\05D3\05D9\05E8 \05D0\05EA \05D4\05E4\05E8\05D9\05D8 \05DB\05E9\05D4\05D5\05D0 \05DE\05DC\05D5\05D5\05D4 \05D1-checksum "user-level bookmark".')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139100487411751342)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.PUBLIC_BOOKMARK'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05D9\05EA\05DF \05DC\05D4\05D2\05D3\05D9\05E8 \05D0\05EA \05D4\05E4\05E8\05D9\05D8 \05DB\05E9\05D4\05D5\05D0 \05DE\05DC\05D5\05D5\05D4 \05D1-checksum "application-level bookmark".')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139100698433751342)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.SESSION'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05D9\05EA\05DF \05DC\05D4\05D2\05D3\05D9\05E8 \05D0\05EA \05D4\05E4\05E8\05D9\05D8 \05DB\05E9\05D4\05D5\05D0 \05DE\05DC\05D5\05D5\05D4 \05D1-checksum "session".')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139100326520751342)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.UNPROTECTED'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05E4\05E8\05D9\05D8 \05D0\05D9\05DF \05D4\05D2\05E0\05D4.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139128497628751350)
,p_name=>'WWV_FLOW.NO_PAGE_HELP'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05DF \05E2\05D6\05E8\05D4 \05D6\05DE\05D9\05E0\05D4 \05DC\05D3\05E3.')
,p_version_scn=>2704869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139116388531751347)
,p_name=>'WWV_FLOW.NO_PRIV_ON_SCHEMA'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05DE\05E8\05D7\05D1 \05D4\05E2\05D1\05D5\05D3\05D4 %0 \05D0\05D9\05DF \05D4\05E8\05E9\05D0\05D5\05EA \05DC\05E4\05D9\05E8\05D5\05E7 \05DB\05E1\05DB\05DE\05D4 %1.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139126843106751350)
,p_name=>'WWV_FLOW.PAGE_ACCEPT_RECUR_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('ERR-1010 \05D7\05E8\05D9\05D2\05D4 \05DE\05D2\05D1\05D5\05DC \05D4\05E8\05E7\05D5\05E8\05E1\05D9\05D4 \05E9\05DC \05E2\05D9\05D1\05D5\05D3 \05E7\05D1\05DC\05EA ''\05D4\05E1\05EA\05E2\05E4\05D5\05EA \05DC\05D3\05E3''. %0')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139083332484751337)
,p_name=>'WWV_FLOW.PAGE_PATTERN_NOT_RUNNABLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D3\05E3 \05D0\05D9\05E0\05D5 \05D6\05DE\05D9\05DF, \05DC\05D0 \05E0\05D9\05EA\05DF \05DC\05D4\05E8\05D9\05E5 \05EA\05D1\05E0\05D9\05EA \05D3\05E3.')
,p_version_scn=>2704860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139100979663751342)
,p_name=>'WWV_FLOW.PAGE_PROTECTION.SHOW_NO_URL_ALLOWED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05D4\05E4\05E2\05D9\05DC \05D3\05E3 \05D6\05D4 \05D1\05D0\05DE\05E6\05E2\05D5\05EA \05DB\05EA\05D5\05D1\05EA URL \05D0\05D5 \05D1\05D0\05DE\05E6\05E2\05D5\05EA GET \05D0\05D5 POST \05DC\05E4\05E8\05D5\05E6\05D3\05D5\05E8\05EA \05D4\05D4\05E6\05D2\05D4; \05D9\05E9 \05DC\05E7\05E8\05D5\05D0 \05DC\05D5 \05D1\05D0\05DE\05E6\05E2\05D5\05EA \05E1\05D5\05D2 \05D4\05D4\05E1\05EA\05E2\05E4\05D5\05EA ''\05D4\05E1\05EA\05E2\05E4\05D5\05EA \05DC\05D3\05E3''.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139185703249751367)
,p_name=>'WWV_FLOW.SAVE_ROUTINE_NUMERIC_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05E0\05D9\05E1\05D9\05D5\05DF \05DC\05E9\05DE\05D5\05E8 \05E2\05E8\05DA \05DC\05D0 \05E0\05D5\05DE\05E8\05D9 \05D1\05E4\05E8\05D9\05D8 %0.')
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139118065671751347)
,p_name=>'WWV_FLOW.SCHEMA_NOT_EXISTS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05DB\05DE\05EA \05E4\05D9\05E8\05D5\05E7 \05D4\05D9\05D9\05E9\05D5\05DD "%0" \05DC\05D0 \05E7\05D9\05D9\05DE\05EA \05D1\05DE\05E1\05D3 \05D4\05E0\05EA\05D5\05E0\05D9\05DD.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139118165366751347)
,p_name=>'WWV_FLOW.SERVICE_ADMIN_LINK'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05D9\05EA\05DF \05DC\05D4\05E9\05EA\05DE\05E9 \05D1\05D7\05E9\05D1\05D5\05E0\05D5\05EA \05D1\05DE\05E8\05D7\05D1 \05D4\05E2\05D1\05D5\05D3\05D4 \05D4''\05E4\05E0\05D9\05DE\05D9'' \05E8\05E7 \05DC\05E6\05D5\05E8\05DA \05D2\05D9\05E9\05D4 \05D0\05DC &PRODUCT_NAME. <a href="%0">Administration Services</a>.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139126046535751349)
,p_name=>'WWV_FLOW.SESSION_INFO_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('ERR-1029 \05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05D0\05D7\05E1\05DF \05E4\05E8\05D8\05D9 \05DE\05D5\05E9\05D1 \05E2\05D1\05D5\05D3\05D4. \05DE\05D5\05E9\05D1 \05E2\05D1\05D5\05D3\05D4 = %0 \05E4\05E8\05D9\05D8 = %1')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139129149382751350)
,p_name=>'WWV_FLOW.UNABLE_TO_STOP_TRACE_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05E2\05E6\05D5\05E8 \05DE\05E2\05E7\05D1: %0')
,p_version_scn=>2704869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139126317060751349)
,p_name=>'WWV_FLOW.UNEXPECTED_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05DC\05EA\05D9 \05E6\05E4\05D5\05D9\05D4')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139137155592751353)
,p_name=>'WWV_FLOW.UPDATE_SUB_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05E2\05D3\05DB\05D5\05DF \05DE\05D8\05DE\05D5\05DF \05D4\05D7\05DC\05E4\05D5\05EA: %0')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139129240018751350)
,p_name=>'WWV_FLOW.VIEW_HELP_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D5\05D1\05D4 \05DC\05E1\05E4\05E7 \05D9\05D9\05E9\05D5\05DD \05D5\05D3\05E3 \05DB\05D3\05D9 \05DC\05D4\05E6\05D9\05D2 \05D0\05EA \05D4\05E2\05D6\05E8\05D4.')
,p_version_scn=>2704869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139150912251751357)
,p_name=>'WWV_FLOW_AUTOMATION.AUTOMATION_NOT_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05DE\05E6\05D0\05D4 \05D0\05D5\05D8\05D5\05DE\05E6\05D9\05D4.')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139086401768751338)
,p_name=>'WWV_FLOW_AUTOMATION.QUERY_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05EA \05E9\05D0\05D9\05DC\05EA\05EA \05D0\05D5\05D8\05D5\05DE\05E6\05D9\05D4: %0')
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139130339299751351)
,p_name=>'WWV_FLOW_CACHE.PURGE_SESSION'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D5\05DC\05E7\05D5 %0 \05DE\05D5\05E9\05D1\05D9 \05E2\05D1\05D5\05D3\05D4.')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139071636460751333)
,p_name=>'WWV_FLOW_CODE_EXEC_MLE.LANGUAGE_NOT_SUPPORTED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05D1\05E6\05E2 \05E7\05D5\05D3 %0! \05D9\05D9\05EA\05DB\05DF \05E9\05D6\05D4 \05DC\05D0 \05E0\05EA\05DE\05DA \05E2\05DC-\05D9\05D3\05D9 \05DE\05E1\05D3 \05E0\05EA\05D5\05E0\05D9\05DD \05D0\05D5 \05E9\05DC\05D0 \05D0\05D5\05E4\05E9\05E8 \05D1\05D0\05DE\05E6\05E2\05D5\05EA \05E4\05E8\05DE\05D8\05E8 \05D4\05DE\05D5\05E4\05E2 MLE_LANGUAGES.')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139069271757751333)
,p_name=>'WWV_FLOW_CODE_EXEC_MLE.MLE_NOT_SUPPORTED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05DE\05E0\05D5\05E2 \05D4\05E8\05D1-\05DC\05E9\05D5\05E0\05D9 \05D0\05D9\05E0\05D5 \05D6\05DE\05D9\05DF \05D1\05D2\05E8\05E1\05D4 \05D6\05D5 \05E9\05DC \05DE\05E1\05D3 \05E0\05EA\05D5\05E0\05D9\05DD!')
,p_version_scn=>2704858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139108491574751344)
,p_name=>'WWV_FLOW_COLLECTION.ARRAY_NOT_NULL'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E2\05E8\05DA \05D0\05D5\05E1\05E3 \05E0\05EA\05D5\05E0\05D9 \05D4\05D9\05D9\05E9\05D5\05DD \05D0\05D9\05E0\05D5 \05D9\05DB\05D5\05DC \05DC\05D4\05D9\05D5\05EA null')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139108254895751344)
,p_name=>'WWV_FLOW_COLLECTION.ATTRIBUTE_NUMBER_OUTSIDE_RANGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E1\05E4\05E8 \05EA\05DB\05D5\05E0\05EA \05D4\05D0\05D9\05D1\05E8 \05E9\05E6\05D5\05D9\05DF %0 \05D0\05D9\05E0\05D5 \05EA\05E7\05E3. \05DE\05E1\05E4\05E8 \05EA\05DB\05D5\05E0\05D4 \05D7\05D9\05D9\05D1 \05DC\05D4\05D9\05D5\05EA \05D1\05D9\05DF 1 \05DC-%1')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139108741197751344)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_EXISTS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D5\05E1\05E3 \05E0\05EA\05D5\05E0\05D9 \05D9\05D9\05E9\05D5\05DD \05E7\05D9\05D9\05DD')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139108505646751344)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NAME_NOT_NULL'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DD \05D0\05D5\05E1\05E3 \05E0\05EA\05D5\05E0\05D9\05DD \05DC\05D0 \05D9\05DB\05D5\05DC \05DC\05D4\05D9\05D5\05EA null')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139108689418751344)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NAME_TOO_LARGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DD \05D0\05D5\05E1\05E3 \05E0\05EA\05D5\05E0\05D9\05DD \05DC\05D0 \05D9\05DB\05D5\05DC \05DC\05D4\05D9\05D5\05EA \05D2\05D3\05D5\05DC \05DE-255 \05EA\05D5\05D5\05D9\05DD')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139108086949751344)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NOT_EXIST'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D5\05E1\05E3 \05E0\05EA\05D5\05E0\05D9 \05D4\05D9\05D9\05E9\05D5\05DD %0 \05DC\05D0 \05E7\05D9\05D9\05DD')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139108829245751344)
,p_name=>'WWV_FLOW_COLLECTION.CURSOR_NOT_OPEN'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E1\05DE\05DF \05D8\05E8\05DD \05E0\05E4\05EA\05D7')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139108164963751344)
,p_name=>'WWV_FLOW_COLLECTION.MEMBER_NOT_EXIST'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\05E8\05E6\05E3 \05D4\05D0\05D9\05D1\05E8\05D9\05DD %0 \05DC\05D0 \05E7\05D9\05D9\05DD \05D1\05D0\05D5\05E1\05E3 \05E0\05EA\05D5\05E0\05D9 \05D4\05D9\05D9\05E9\05D5\05DD %1'),
''))
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139108396657751344)
,p_name=>'WWV_FLOW_COLLECTION.MEMBER_SEQUENCE_NUMBER_INVALID'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05E6\05E3 \05D4\05D0\05D9\05D1\05E8\05D9\05DD %0 \05DC\05D0 \05E7\05D9\05D9\05DD \05D1\05D0\05D5\05E1\05E3 \05E0\05EA\05D5\05E0\05D9 \05D4\05D9\05D9\05E9\05D5\05DD "%1"')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139061188729751330)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_ALGORITHM'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05DC\05D2\05D5\05E8\05D9\05EA\05DD %0 \05DC\05D0 \05E0\05EA\05DE\05DA \05D1\05E9\05D1\05D9\05DC ECDSA.')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139060848976751330)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_EC_CURVE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E7\05D5\05DE\05D4 \05D0\05DC\05D9\05E4\05D8\05D9\05EA %0 \05D0\05D9\05E0\05D4 \05E0\05EA\05DE\05DB\05EA.')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139186521528751367)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_FUNCTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05D5\05E0\05E7\05E6\05D9\05D9\05EA \05D4\05D4\05E6\05E4\05E0\05D4 "%0" \05D0\05D9\05E0\05D4 \05E0\05EA\05DE\05DB\05EA \05D1\05DE\05E2\05E8\05DB\05EA \05D6\05D5.')
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139238805039751383)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_ACCESSIBLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E0\05D2\05D9\05E9\05D5\05EA \05E0\05D1\05D3\05E7\05D4')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139129809566751351)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_CLOSE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D2\05D5\05E8')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139129906700751351)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_CUST_OPT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05E4\05E9\05E8\05D5\05D9\05D5\05EA \05D4\05EA\05D0\05DE\05D4 \05D0\05D9\05E9\05D9\05EA \05E9\05DC \05D3\05E3')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139130003209751351)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_DEFAULT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05E8\05D9\05E8\05EA \05DE\05D7\05D3\05DC')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139130133117751351)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_DISP'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D5\05E6\05D2')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139130212918751351)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_HIDDEN'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05E1\05EA\05E8')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139129630676751350)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE1'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D3\05D5\05E7 \05D0\05EA \05D4\05D0\05D6\05D5\05E8\05D9\05DD \05E9\05E8\05E6\05D9\05EA \05DC\05DB\05DC\05D5\05DC \05D1\05D3\05E3 \05D6\05D4. \05D9\05D9\05EA\05DB\05DF \05E9\05D4\05D0\05D6\05D5\05E8\05D9\05DD \05D4\05E0\05D1\05D3\05E7\05D9\05DD \05DC\05D0 \05D9\05D5\05E6\05D2\05D5 \05D0\05DD \05D0\05D9\05E0\05DA \05D1\05D4\05E7\05E9\05E8 \05D4\05D9\05D9\05E9\05D5\05DD \05D4\05E0\05DB\05D5\05DF \05D0\05D5 \05D0\05DD \05D0\05D9\05DF \05DC\05DA \05D4\05E8\05E9\05D0\05D5\05EA \05E0\05DB\05D5\05E0\05D5\05EA.')
,p_version_scn=>2704869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139129759584751351)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE2'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05E3 \05D6\05D4 \05D0\05D9\05E0\05D5 \05E0\05D9\05EA\05DF \05DC\05D4\05EA\05D0\05DE\05D4 \05D0\05D9\05E9\05D9\05EA.')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139239169161751383)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE3'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D5\05DB\05DC \05DC\05D4\05EA\05D0\05D9\05DD \05D0\05D9\05E9\05D9\05EA \05D0\05EA \05D4\05DE\05E8\05D0\05D4 \05E9\05DC \05D9\05D9\05E9\05D5\05DD \05D6\05D4 \05E2\05DC-\05D9\05D3\05D9 \05E9\05D9\05E0\05D5\05D9 \05E1\05D2\05E0\05D5\05DF \05DE\05D5\05D8\05D9\05D1 \05D4\05E2\05D9\05E6\05D5\05D1. \05D1\05D7\05E8 \05E1\05D2\05E0\05D5\05DF \05DE\05D5\05D8\05D9\05D1 \05E2\05D9\05E6\05D5\05D1 \05DE\05D4\05E8\05E9\05D9\05DE\05D4 \05DC\05DE\05D8\05D4 \05D5\05DC\05D7\05E5 \05E2\05DC ''\05D4\05D7\05DC \05E9\05D9\05E0\05D5\05D9\05D9\05DD''.')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139239929361751383)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_REGION_DISP'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E6\05D2\05EA \05D0\05D6\05D5\05E8')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139239059778751383)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_REMOVE_STYLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E9\05EA\05DE\05E9 \05D1\05D1\05E8\05D9\05E8\05EA \05D4\05DE\05D7\05D3\05DC \05E9\05DC \05E1\05D2\05E0\05D5\05DF \05D4\05D9\05D9\05E9\05D5\05DD')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139238964948751383)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_THEME_STYLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05E4\05E2\05D4 ')
,p_version_scn=>2704890
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139183159328751366)
,p_name=>'WWV_FLOW_DATA_EXPORT.AGG_COLUMN_IDX_NOT_EXIST'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E0\05D3\05E7\05E1 \05D4\05E2\05DE\05D5\05D3\05D4 \05E9\05D9\05E9 \05D0\05DC\05D9\05D5 \05D4\05E4\05E0\05D9\05D4 \05D1\05E1\05DB\05D9\05DE\05D4 %0 \05DC\05D0 \05E7\05D9\05D9\05DD.')
,p_version_scn=>2704879
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139075814692751334)
,p_name=>'WWV_FLOW_DATA_EXPORT.APPEND_NOT_SUPPORTED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05E1\05E4\05EA \05D9\05E6\05D5\05D0 \05D4\05E0\05EA\05D5\05E0\05D9\05DD \05D0\05D9\05E0\05D4 \05E0\05EA\05DE\05DB\05EA \05DC\05E4\05D5\05E8\05DE\05D8 %0.')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139038834257751323)
,p_name=>'WWV_FLOW_DATA_EXPORT.CLOB_NOT_SUPPORTED'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D5\05E6\05D0\05EA CLOB \05D0\05D9\05E0\05D4 \05EA\05D5\05DE\05DB\05EA \05D1\05E4\05D5\05E8\05DE\05D8 %0.')
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139182853232751366)
,p_name=>'WWV_FLOW_DATA_EXPORT.COLUMN_BREAK_MUST_BE_IN_THE_BEGGINING'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E2\05D1\05E8 \05D4\05E2\05DE\05D5\05D3\05D4 \05E6\05E8\05D9\05DA \05DC\05D4\05D9\05D5\05EA \05D1\05EA\05D7\05D9\05DC\05EA \05DE\05E2\05E8\05DA \05D4\05E2\05DE\05D5\05D3\05D5\05EA.')
,p_version_scn=>2704879
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139182969218751366)
,p_name=>'WWV_FLOW_DATA_EXPORT.COLUMN_GROUP_IDX_NOT_EXIST'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E0\05D3\05E7\05E1 \05E7\05D1\05D5\05E6\05EA \05D4\05E2\05DE\05D5\05D3\05D5\05EA \05E9\05D9\05E9 \05D0\05DC\05D9\05D5 \05D4\05E4\05E0\05D9\05D4 \05D1-%0 \05DC\05D0 \05E7\05D9\05D9\05DD.')
,p_version_scn=>2704879
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139090085680751339)
,p_name=>'WWV_FLOW_DATA_EXPORT.EXPORT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05E6\05D5\05D0')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139097201861751341)
,p_name=>'WWV_FLOW_DATA_EXPORT.FORMAT_MUST_BE_XML'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05D5\05E8\05DE\05D8 \05D4\05D9\05E6\05D5\05D0 \05D7\05D9\05D9\05D1 \05DC\05D4\05D9\05D5\05EA XML \05E9\05E2\05D5\05E9\05D4 \05E9\05D9\05DE\05D5\05E9 \05D1-ORDS \05DB\05E9\05E8\05EA \05D4\05D3\05E4\05E1\05D4.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139183212451751366)
,p_name=>'WWV_FLOW_DATA_EXPORT.HIGHLIGHT_COLUMN_IDX_NOT_EXIST'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E0\05D3\05E7\05E1 \05D4\05E2\05DE\05D5\05D3\05D4 \05E9\05D9\05E9 \05D0\05DC\05D9\05D5 \05D4\05E4\05E0\05D9\05D4 \05D1\05D4\05D3\05D2\05E9\05D4 %0 \05DC\05D0 \05E7\05D9\05D9\05DD.')
,p_version_scn=>2704879
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139086656562751338)
,p_name=>'WWV_FLOW_DATA_EXPORT.INVALID_FORMAT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E4\05D5\05E8\05DE\05D8 \05D9\05E6\05D5\05D0 \05DC\05D0 \05EA\05E7\05E3: %0')
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139183059258751366)
,p_name=>'WWV_FLOW_DATA_EXPORT.PARENT_GROUP_IDX_NOT_EXIST'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05E0\05D3\05E7\05E1 \05D4\05E7\05D1\05D5\05E6\05D4 \05D4\05D0\05D1 \05E9\05D9\05E9 \05D0\05DC\05D9\05D5 \05D4\05E4\05E0\05D9\05D4 \05D1-%0 \05DC\05D0 \05E7\05D9\05D9\05DD.')
,p_version_scn=>2704879
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139208200069751374)
,p_name=>'WWV_FLOW_DATA_LOADER.CANNOT_LOAD_INTO_GENERATED_ALWAYS_COLUMN'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E2\05DE\05D5\05D3\05D4 %1 \05E9\05DC \05D4\05D8\05D1\05DC\05D4 %0 \05D4\05D9\05D0 \05E2\05DE\05D5\05D3\05EA \05D6\05D4\05D5\05EA "GENERATED ALWAYS". \05D5\05D3\05D0 \05E9\05D0\05E3 \05E2\05DE\05D5\05D3\05EA \05DE\05E7\05D5\05E8 \05DC\05D0 \05DE\05D5\05E4\05EA\05D4 \05D0\05DC \05D4\05E2\05DE\05D5\05D3\05D4 %1 \05D1\05EA\05D9\05D1\05EA \05D4\05D3\05D5-\05E9\05D9\05D7 ''\05D4\05D2\05D3\05E8 \05EA\05E6\05D5\05E8\05D4''.')
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139119806654751348)
,p_name=>'WWV_FLOW_DATA_LOADER.COMMIT_INTERVAL_TOO_LOW'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E8\05D5\05D5\05D7 \05D4-commit \05E9\05E6\05D5\05D9\05DF \05E7\05D8\05DF \05DE\05D3\05D9.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139119990637751348)
,p_name=>'WWV_FLOW_DATA_LOADER.NO_COLUMNS_PROVIDED'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E1\05D5\05E4\05E7\05D5 \05E2\05DE\05D5\05D3\05D5\05EA \05DC\05D8\05E2\05D9\05E0\05EA \05E0\05EA\05D5\05E0\05D9\05DD.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139121280183751348)
,p_name=>'WWV_FLOW_DATA_PARSER.NO_COLUMNS_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05DE\05E6\05D0\05D5 \05E2\05DE\05D5\05D3\05D5\05EA \05DC\05D1\05D5\05E8\05E8 \05D4\05E9\05D5\05E8\05D5\05EA "%0". \05E0\05E1\05D4 \05DC\05D1\05E6\05E2 \05D2\05D9\05DC\05D5\05D9 \05D0\05D5\05D8\05D5\05DE\05D8\05D9 \05D0\05D5 \05DC\05D1\05D3\05D5\05E7 \05D0\05EA \05DE\05D1\05E0\05D4 \05D4-JSON.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139130639577751351)
,p_name=>'WWV_FLOW_DATA_PARSER.NO_WORKSHEETS_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05DE\05E6\05D0\05D5 \05D2\05D9\05DC\05D9\05D5\05E0\05D5\05EA \05E2\05D1\05D5\05D3\05D4 \05D1\05E7\05D5\05D1\05E5 XLSX.')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139075730255751334)
,p_name=>'WWV_FLOW_DATA_PARSER.REQUESTED_HIERARCHY_LEVELS_EXCEED_MAXIMUM'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05DE\05D5\05EA \05D4\05D4\05D9\05E8\05E8\05DB\05D9\05D4 \05D4\05DE\05D1\05D5\05E7\05E9\05D5\05EA \05DC\05D2\05D9\05DC\05D5\05D9 (%0) \05D7\05D5\05E8\05D2\05D5\05EA \05DE\05D4\05DE\05E7\05E1\05D9\05DE\05D5\05DD \05E9\05DC %1.')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139130513068751351)
,p_name=>'WWV_FLOW_DATA_PARSER.WORKSHEET_DOES_NOT_EXIST'
,p_message_language=>'he'
,p_message_text=>unistr('\05D2\05D9\05DC\05D9\05D5\05DF \05D4\05E2\05D1\05D5\05D3\05D4 \05E9\05E6\05D5\05D9\05DF \05DC\05D0 \05E7\05D9\05D9\05DD \05D1\05E7\05D5\05D1\05E5 XLSX.')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139108968052751344)
,p_name=>'WWV_FLOW_DML.VERSION_OF_DATA_CHANGED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D2\05E8\05E1\05D4 \05D4\05E0\05D5\05DB\05D7\05D9\05EA \05E9\05DC \05E0\05EA\05D5\05E0\05D9\05DD \05D1\05DE\05E1\05D3 \05D4\05E0\05EA\05D5\05E0\05D9\05DD \05D4\05E9\05EA\05E0\05EA\05D4 \05DE\05D0\05D6 \05E9\05D4\05DE\05E9\05EA\05DE\05E9 \05D0\05EA\05D7\05DC \05EA\05D4\05DC\05D9\05DA \05E2\05D3\05DB\05D5\05DF.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139111833053751345)
,p_name=>'WWV_FLOW_EDIT_REPORT.ERR_UPDATING_COLS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05E2\05D3\05DB\05D5\05DF \05E2\05DE\05D5\05D3\05D5\05EA \05D3\05D5\05D7: %0')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139222373339751378)
,p_name=>'WWV_FLOW_EXEC.CANNOT_CONVERT_TO_SDOGEOMETRY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05D4\05DE\05D9\05E8 \05D0\05EA %0 \05DC-SDO_GEOMETRY.')
,p_version_scn=>2704886
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139158839813751359)
,p_name=>'WWV_FLOW_EXEC.CAN_NOT_CONVERT_TO_VARCHAR2'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05D9\05EA\05DF \05DC\05D4\05DE\05D9\05E8 \05D0\05EA \05D4\05E2\05DE\05D5\05D3\05D4 %0 \05DE\05E1\05D5\05D2 \05D4\05E0\05EA\05D5\05E0\05D9\05DD %1 \05DC-VARCHAR2!')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139166283309751361)
,p_name=>'WWV_FLOW_EXEC.COLUMN_NOT_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E2\05DE\05D5\05D3\05D4 "%0" \05E9\05E6\05D5\05D9\05E0\05D4 \05DC\05EA\05DB\05D5\05E0\05D4 "%1" \05DC\05D0 \05E0\05DE\05E6\05D0\05D4 \05D1\05DE\05E7\05D5\05E8 \05D4\05E0\05EA\05D5\05E0\05D9\05DD!')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139102397814751342)
,p_name=>'WWV_FLOW_EXEC.FILTER_NOT_SUPPORTED_WITH_MULTIPLE_VALUES'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D5\05D2 \05D4\05DE\05E1\05E0\05DF %0 \05D0\05D9\05E0\05D5 \05EA\05D5\05DE\05DA \05D1\05E2\05DE\05D5\05D3\05D5\05EA \05DE\05E8\05D5\05D1\05D5\05EA \05E2\05E8\05DB\05D9\05DD.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139225842757751379)
,p_name=>'WWV_FLOW_EXEC.INVALID_BETWEEN_FILTER'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E1\05E0\05DF "\05D1\05D9\05DF" \05DC\05D0 \05EA\05E7\05E3.')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139081437049751336)
,p_name=>'WWV_FLOW_EXEC.INVALID_COLUMN_OR_ROW_DATATYPE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05DE\05E6\05D0 \05E2\05E8\05DA %2 \05D1\05E2\05DE\05D5\05D3\05D4 %0, \05E9\05D5\05E8\05D4 #%1.')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139078126892751335)
,p_name=>'WWV_FLOW_EXEC.INVALID_COLUMN_OR_ROW_REFERENCE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E2\05DE\05D5\05D3\05D4 %0 \05D0\05D5 \05E9\05D5\05E8\05D4 #%1 \05D0\05D9\05E0\05D4 \05E7\05D9\05D9\05DE\05EA.')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139064724284751331)
,p_name=>'WWV_FLOW_EXEC.INVALID_LOV_SPECIFICATION'
,p_message_language=>'he'
,p_message_text=>unistr('\05E6\05D5\05D9\05DF \05E1\05D5\05D2 \05E8\05E9\05D9\05DE\05EA \05E2\05E8\05DB\05D9\05DD \05DC\05D0 \05EA\05E7\05E3.')
,p_version_scn=>2704857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139064669035751331)
,p_name=>'WWV_FLOW_EXEC.INVALID_QUERY_TYPE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D5\05D2 \05E9\05D0\05D9\05DC\05EA\05D0 \05DC\05D0 \05EA\05E7\05E3. \05E1\05D5\05D2 \05E9\05D0\05D9\05DC\05EA\05D0 \05D7\05D9\05D9\05D1 \05DC\05D4\05D9\05D5\05EA \05D8\05D1\05DC\05D4, \05E9\05D0\05D9\05DC\05EA\05EA SQL, \05D0\05D5 \05E4\05D5\05E0\05E7\05E6\05D9\05D9\05EA PL/SQL \05E9\05DE\05D0\05D7\05D6\05E8\05EA \05E9\05D0\05D9\05DC\05EA\05EA SQL.')
,p_version_scn=>2704857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139158927169751359)
,p_name=>'WWV_FLOW_EXEC.INVALID_SQL_QUERY'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\05E0\05DB\05E9\05DC \05D1\05E4\05D9\05E8\05D5\05E7 \05E9\05D0\05D9\05DC\05EA\05EA SQL!'),
'%0'))
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139166394878751361)
,p_name=>'WWV_FLOW_EXEC.LEGACY_COLUMN_NOT_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D9\05E7\05D5\05DD \05D4\05E2\05DE\05D5\05D3\05D4 \05E9\05E6\05D5\05D9\05DF %0 \05DC\05EA\05DB\05D5\05E0\05D4 "%1" \05DC\05D0 \05E0\05DE\05E6\05D0 \05D1\05DE\05E9\05E4\05D8 \05D4-SQL!')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139056338972751328)
,p_name=>'WWV_FLOW_EXEC.MULTI_VALUE_TOO_MANY_ITEMS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05E2\05E9\05D4 \05E9\05D9\05DE\05D5\05E9 \05D1\05D9\05D5\05EA\05E8 \05DE\05D3\05D9 \05E4\05E8\05D9\05D8\05D9\05DD \05D1\05DE\05E1\05E0\05DF \05E8\05D1-\05E2\05E8\05DB\05D9\05DD.')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139166117206751361)
,p_name=>'WWV_FLOW_EXEC.NO_COLUMN_FOR_ATTRIBUTE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E6\05D5\05D9\05E0\05D4 \05E2\05DE\05D5\05D3\05D4 \05DC\05EA\05DB\05D5\05E0\05D4 "%0".')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139064579045751331)
,p_name=>'WWV_FLOW_EXEC.NULL_QUERY_RETURNED_BY_FUNCTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D2\05D5\05E3 \05E4\05D5\05E0\05E7\05E6\05D9\05D9\05EA PL/SQL \05DC\05D0 \05D0\05D7\05D6\05E8 \05E2\05E8\05DA.')
,p_version_scn=>2704857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139181949842751366)
,p_name=>'WWV_FLOW_EXEC.OPERATION_NOT_PRESENT_IN_WEB_SRC_MODULE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E7\05D5\05E8 \05E0\05EA\05D5\05E0\05D9 REST \05D0\05D9\05E0\05D5 \05DE\05DB\05D9\05DC ''\05E4\05E2\05D5\05DC\05D4'' \05DC\05D8\05D9\05E4\05D5\05DC \05D1\05E4\05E2\05D5\05DC\05EA DML \05D4\05DE\05D1\05D5\05E7\05E9\05EA.')
,p_version_scn=>2704878
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139223699610751378)
,p_name=>'WWV_FLOW_EXEC.RANGE_BUCKET.NOT.SUPPORTED'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E1\05E0\05E0\05D9 \05D8\05D5\05D5\05D7 \05E0\05EA\05DE\05DB\05D9\05DD \05E8\05E7 \05DC\05E1\05D5\05D2\05D9 \05E0\05EA\05D5\05E0\05D9\05DD NUMBER, DATE \05D0\05D5 TIMESTAMP.')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139044551726751325)
,p_name=>'WWV_FLOW_EXEC.REST_REQUEST_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D1\05E7\05E9\05D4 \05E0\05DB\05E9\05DC\05D4 \05E2\05DD %0')
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139048024380751326)
,p_name=>'WWV_FLOW_EXEC.SPATIAL_JSON_NOT_AVAILABLE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05DE\05E8\05D4 \05DE-GeoJSON \05DC-SDO_GEOMETRY (\05E2\05DE\05D5\05D3\05D4 %0) \05D0\05D9\05E0\05D4 \05D6\05DE\05D9\05E0\05D4 \05D1\05DE\05E1\05D3 \05E0\05EA\05D5\05E0\05D9\05DD \05D6\05D4.')
,p_version_scn=>2704853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139051407469751327)
,p_name=>'WWV_FLOW_EXEC.SPATIAL_NOT_SUPPORTED_FOR_XML'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05DE\05E8\05EA SDO_GEOMETRY (\05E2\05DE\05D5\05D3\05D4 %0) \05D0\05D9\05E0\05D4 \05EA\05D5\05DE\05DB\05EA \05D1\05DE\05E7\05D5\05E8\05D5\05EA \05E0\05EA\05D5\05E0\05D9 XML.')
,p_version_scn=>2704854
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139075533240751334)
,p_name=>'WWV_FLOW_EXEC.UNSUPPPORTED_MULTI_VALUE_SEPARATOR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05EA\05D5 %0 \05D0\05D9\05E0\05D5 \05E0\05EA\05DE\05DA \05DB\05DE\05E4\05E8\05D9\05D3 \05E8\05D1-\05E2\05E8\05DB\05D9\05DD.')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139223704286751378)
,p_name=>'WWV_FLOW_EXEC.WRONG_CONTEXT_TYPE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05D4\05E9\05EA\05DE\05E9 \05D1\05E4\05D5\05E0\05E7\05E6\05D9\05D4 \05D6\05D5 \05D1\05D4\05E7\05E9\05E8 \05E9\05D0\05D9\05DC\05EA\05D0.')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139051554886751327)
,p_name=>'WWV_FLOW_EXEC_API.INVALID_DATA_TYPE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D5\05E1\05E8 \05D4\05EA\05D0\05DE\05D4 \05E9\05DC \05E1\05D5\05D2 \05E0\05EA\05D5\05E0\05D9 \05E2\05DE\05D5\05D3\05D4.')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139085028888751337)
,p_name=>'WWV_FLOW_EXEC_DOC_SRC.REMOTE_MULTI_ROW_DML_NOT_SUPPORTED_WITHOUT_JSON_BINDS'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E7\05D5\05E8 \05E0\05EA\05D5\05E0\05D9\05DD \05D6\05D4 \05D0\05D9\05E0\05D5 \05EA\05D5\05DE\05DA \05D1\05E9\05D9\05E0\05D5\05D9 \05E9\05D5\05E8\05D5\05EA \05DE\05E8\05D5\05D1\05D5\05EA.')
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139064438975751331)
,p_name=>'WWV_FLOW_EXEC_REMOTE.ORDS_OUT_BIND_LIMIT_EXCEEDED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05E8\05D9\05D2\05D4 \05DE\05D2\05D1\05D5\05DC\05D5\05EA \05DB\05E8\05D9\05DB\05D4 \05E4\05E0\05D9\05DE\05D9\05EA \05E9\05DC ORDS OUT. \05E6\05DE\05E6\05DD \05D0\05EA \05DB\05DE\05D5\05EA \05E9\05D5\05E8\05D5\05EA \05D4-DML.')
,p_version_scn=>2704857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139167138221751362)
,p_name=>'WWV_FLOW_EXEC_REMOTE.RESPONSE_PARSING_ERROR'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\05DC\05D0 \05E0\05D9\05EA\05DF \05DC\05E4\05E8\05E7 \05D0\05EA \05EA\05D2\05D5\05D1\05D5\05EA \05D4-JSON \05DE\05D4\05E9\05E8\05EA \05D4\05DE\05E8\05D5\05D7\05E7: '),
'%0'))
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139064387659751331)
,p_name=>'WWV_FLOW_EXEC_REMOTE.RUN_PLSQL_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D5\05D2 \05D4\05E7\05E9\05E8 \05DC\05D0 \05D9\05D3\05D5\05E2 \05D0\05D5 \05E9\05D2\05D5\05D9.')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139088487342751338)
,p_name=>'WWV_FLOW_EXPORT_INT.UNSUPPORTED_READABLE_EXPORT'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05DB\05D9\05D1\05D9\05DD \05DC\05D0 \05E0\05EA\05DE\05DB\05D9\05DD \05DC\05D9\05D9\05E6\05D5\05D0 \05E0\05D9\05EA\05DF \05DC\05E7\05E8\05D9\05D0\05D4: %0')
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139186453363751367)
,p_name=>'WWV_FLOW_FILE_PARSER.UNKNOWN_FILE_TYPE'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D5\05D2 \05D4\05E7\05D5\05D1\05E5 \05D0\05D9\05E0\05D5 \05E0\05EA\05DE\05DA \05E2"\05D9 \05D4-parser.')
,p_version_scn=>2704880
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139137290670751353)
,p_name=>'WWV_FLOW_FND_DEVELOPER_API.CREDENTIALS_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D2\05D9\05E9\05D4 \05DC\05D0 \05DE\05D5\05E8\05E9\05D9\05EA (\05DC\05D0 \05D4\05D5\05D2\05D3\05E8\05D5 wwv_flow_api.set_credentials).')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139112181057751345)
,p_name=>'WWV_FLOW_FND_USER_API.CREATE_COMPANY'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05D5\05E6\05E8 \05DE\05E8\05D7\05D1 \05E2\05D1\05D5\05D3\05D4 \05DB\05D9\05D5\05D5\05DF \05E9\05D4\05D5\05D0 \05DB\05D1\05E8 \05E7\05D9\05D9\05DD.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139112047926751345)
,p_name=>'WWV_FLOW_FND_USER_API.CREATE_USER_GROUP'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05D5\05E6\05E8\05D4 \05E7\05D1\05D5\05E6\05EA \05DE\05E9\05EA\05DE\05E9\05D9\05DD \05DB\05D9\05D5\05D5\05DF \05E9\05D4\05D9\05D0 \05DB\05D1\05E8 \05E7\05D9\05D9\05DE\05EA.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139123444519751349)
,p_name=>'WWV_FLOW_FND_USER_API.DUP_USER'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05DE\05E6\05D0 \05E9\05DD \05DE\05E9\05EA\05DE\05E9 \05DB\05E4\05D5\05DC \05DC-%0.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139123579606751349)
,p_name=>'WWV_FLOW_FND_USER_API.LOAD_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05D8\05E2\05D9\05E0\05EA \05DE\05E9\05EA\05DE\05E9\05D9\05DD. \05E0\05DB\05E9\05DC \05D1\05DE\05E9\05EA\05DE\05E9 %0.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139134368084751352)
,p_name=>'WWV_FLOW_FND_USER_API.T_MESSAGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D9\05D5 \05E0\05D8\05E2\05E0\05D9\05DD %0 \05DE\05E9\05EA\05DE\05E9\05D9\05DD.')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139134197477751352)
,p_name=>'WWV_FLOW_FND_USER_API.T_PASSWORD'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D9\05E1\05DE\05D4')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139134208772751352)
,p_name=>'WWV_FLOW_FND_USER_API.T_PRIVILEGE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E8\05E9\05D0\05D5\05EA')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139133966313751352)
,p_name=>'WWV_FLOW_FND_USER_API.T_USERNAME'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05DD \05D4\05DE\05E9\05EA\05DE\05E9')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139214302273751376)
,p_name=>'WWV_FLOW_FORM.UNHANDLED_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05E2\05D9\05D1\05D5\05D3 \05EA\05DE\05D5\05E0\05D4 \05E9\05DC \05E4\05E8\05D9\05D8 \05D4\05D3\05E3 #COMPONENT_NAME#.')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139129384866751350)
,p_name=>'WWV_FLOW_FORMS.FORM_NOT_OPEN_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05D4\05E6\05D9\05D2 \05E4\05E8\05D9\05D8 \05D3\05E3 \05DB\05D9\05D5\05D5\05DF \05E9\05D8\05D5\05E4\05E1 \05D4-HTML \05D8\05E8\05DD \05E0\05E4\05EA\05D7.')
,p_version_scn=>2704869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139087789320751338)
,p_name=>'WWV_FLOW_FORMS.ITEM_DEFAULT_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05E2\05EA \05D7\05D9\05E9\05D5\05D1 \05E2\05E8\05DA \05D1\05E8\05D9\05E8\05EA \05DE\05D7\05D3\05DC \05E9\05DC \05E4\05E8\05D9\05D8 \05DC\05E4\05E8\05D9\05D8 \05D4\05D3\05E3 #COMPONENT_NAME#.')
,p_version_scn=>2704863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139128600320751350)
,p_name=>'WWV_FLOW_FORMS.ITEM_POST_CALC_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05E2\05D9\05D1\05D5\05D3 \05DC\05D0\05D7\05E8 \05D7\05D9\05E9\05D5\05D1 \05E4\05E8\05D9\05D8 \05DC\05E4\05E8\05D9\05D8 \05D4\05D3\05E3 #COMPONENT_NAME#.')
,p_version_scn=>2704869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139128598373751350)
,p_name=>'WWV_FLOW_FORMS.ITEM_SOURCE_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05E2\05EA \05D7\05D9\05E9\05D5\05D1 \05E2\05E8\05DA \05DE\05E7\05D5\05E8 \05E4\05E8\05D9\05D8 \05DC\05E4\05E8\05D9\05D8 \05D4\05D3\05E3 #COMPONENT_NAME#.')
,p_version_scn=>2704869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139105355198751343)
,p_name=>'WWV_FLOW_HELP.UNAUTHORIZED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D2\05D9\05E9\05D4 \05DC\05D0 \05DE\05D5\05E8\05E9\05D9\05EA.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139054844747751328)
,p_name=>'WWV_FLOW_INTERACTIVE_GRID.INVALID_JSON_ARRAY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E2\05E8\05DA %0 \05E9\05DC %1 \05D0\05D9\05E0\05D5 \05DE\05E2\05E8\05DA JSON \05EA\05E7\05E3.')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139128808372751350)
,p_name=>'WWV_FLOW_ITEM.JS_NOT_SUPPORTED'
,p_message_language=>'he'
,p_message_text=>unistr('JavaScript \05DC\05D0 \05E0\05EA\05DE\05DA.')
,p_version_scn=>2704869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139128973209751350)
,p_name=>'WWV_FLOW_ITEM.LIST'
,p_message_language=>'he'
,p_message_text=>unistr('\05E8\05E9\05D9\05DE\05D4')
,p_version_scn=>2704869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139129597520751350)
,p_name=>'WWV_FLOW_ITEM.UNABLE_INIT_QUERY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05D0\05EA\05D7\05DC \05E9\05D0\05D9\05DC\05EA\05D0.')
,p_version_scn=>2704869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139137527797751353)
,p_name=>'WWV_FLOW_ITEM.UPDATE_NOT_SUPPORTED_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E2\05D3\05DB\05D5\05DF \05E9\05DC %0 \05DC\05D0 \05E0\05EA\05DE\05DA.')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139131040050751351)
,p_name=>'WWV_FLOW_ITEM_HELP.INVALID_ITEM_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D6\05D4\05D4 \05E4\05E8\05D9\05D8 \05DC\05D0 \05EA\05E7\05E3: %0')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139158796258751359)
,p_name=>'WWV_FLOW_ITEM_HELP.NO_HELP_EXISTS'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05DF \05E2\05D6\05E8\05D4 \05DC\05E4\05E8\05D9\05D8 \05D6\05D4.')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139120590333751348)
,p_name=>'WWV_FLOW_JET_CHART.QUERY_GENERATION_FAILED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E4\05E7\05EA \05E9\05D0\05D9\05DC\05EA\05EA \05EA\05E8\05E9\05D9\05DD \05E0\05DB\05E9\05DC\05D4. \05D1\05D3\05D5\05E7 \05D0\05EA \05D4\05D2\05D3\05E8\05D5\05EA \05D4\05DE\05D9\05E4\05D5\05D9 \05E9\05DC \05DE\05E7\05D5\05E8 \05D5\05E2\05DE\05D5\05D3\05D4.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139121857982751348)
,p_name=>'WWV_FLOW_MAIL.ADD_ATTACHMENT.INVALID_MAIL_ID'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05E8\05DA \05DC\05D0 \05EA\05E7\05E3 \05DC\05E4\05E8\05DE\05D8\05E8 p_mail_id: %0')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139158553122751359)
,p_name=>'WWV_FLOW_MAIL.CANNOT_USE_TO_OR_REPLYTO_AS_FROM'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05D4\05E9\05EA\05DE\05E9 \05D1"\05DC-" \05D0\05D5 "\05D4\05E9\05D1 \05DC-" \05DB\05DB\05EA\05D5\05D1\05EA "\05DE\05D0\05EA", \05DE\05DB\05D9\05D5\05D5\05DF \05E9\05D0\05DC\05D5 \05DE\05DB\05D9\05DC\05D5\05EA \05DE\05E1\05E4\05E8 \05DB\05EA\05D5\05D1\05D5\05EA \05D3\05D5\05D0"\05DC.')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139243455865751384)
,p_name=>'WWV_FLOW_MAIL.EMAIL_LIMIT_EXCEEDED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05E8\05D2\05EA \05DE\05D4\05DE\05E1\05E4\05E8 \05D4\05DE\05E8\05D1\05D9 \05E9\05DC \05D4\05D5\05D3\05E2\05D5\05EA \05D3\05D5\05D0"\05DC \05DC\05DB\05DC \05DE\05E8\05D7\05D1 \05E2\05D1\05D5\05D3\05D4. \05E4\05E0\05D4 \05DC\05DE\05E0\05D4\05DC\05DF.')
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139100091755751342)
,p_name=>'WWV_FLOW_MAIL.INVALID_CONTEXT'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D5\05D1\05D4 \05DC\05D4\05E4\05E2\05D9\05DC \05E4\05E8\05D5\05E6\05D3\05D5\05E8\05D4 \05D6\05D5 \05DE\05EA\05D5\05DA \05DE\05D5\05E9\05D1 \05E2\05D1\05D5\05D3\05D4 \05E9\05DC \05D9\05D9\05E9\05D5\05DD.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139121730544751348)
,p_name=>'WWV_FLOW_MAIL.PARAMETER_NULL'
,p_message_language=>'he'
,p_message_text=>unistr('\05E1\05D5\05E4\05E7 \05E2\05E8\05DA Null \05DC\05E4\05E8\05DE\05D8\05E8 %0.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139179883962751365)
,p_name=>'WWV_FLOW_MAIL.PREPARE_TEMPLATE.NO_DATA_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D1\05E0\05D9\05EA \05D4\05D3\05D5\05D0"\05DC "%0" \05DC\05D0 \05E0\05DE\05E6\05D0\05D4 \05D1\05D9\05D9\05E9\05D5\05DD %1.')
,p_version_scn=>2704877
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139256349352751388)
,p_name=>'WWV_FLOW_MAIL.SMTP_HOST_ADDRESS_REQUIRED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D5\05D1\05D4 \05DC\05D4\05D2\05D3\05D9\05E8 \05D0\05EA \05E4\05E8\05DE\05D8\05E8 \05D4\05DE\05D5\05E4\05E2 \05E9\05DC SMTP_HOST_ADDRESS \05DB\05D3\05D9 \05DC\05E9\05DC\05D5\05D7 \05D4\05D5\05D3\05E2\05D5\05EA \05D3\05D5\05D0"\05DC.')
,p_version_scn=>2704894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139121146792751348)
,p_name=>'WWV_FLOW_MAIL.TO_IS_REQUIRED'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DC\05D9\05DA \05DC\05E1\05E4\05E7 \05E0\05DE\05E2\05DF \05D4\05D5\05D3\05E2\05D4 \05DB\05D3\05D9 \05DC\05E9\05DC\05D5\05D7 \05D3\05D5\05D0\05E8.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139245817433751385)
,p_name=>'WWV_FLOW_MAIL.UNABLE_TO_OPEN_SMTP_CONNECTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05D4\05E7\05D9\05DD \05D7\05D9\05D1\05D5\05E8 SMTP \05DC\05E9\05E8\05EA \05D4\05D3\05D5\05D0"\05DC \05E9\05D4\05D5\05D2\05D3\05E8.')
,p_version_scn=>2704891
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139221110171751378)
,p_name=>'WWV_FLOW_PLUGIN.INVALID_AJAX_CALL'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05E8\05D9\05D0\05EA Ajax \05DC\05D0 \05EA\05E7\05E4\05D4!')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139105027267751343)
,p_name=>'WWV_FLOW_PLUGIN.NO_AJAX_FUNCTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05D4\05D5\05D2\05D3\05E8\05D4 \05E4\05D5\05E0\05E7\05E6\05D9\05D9\05EA Ajax \05DC\05EA\05D5\05E1\05E3 \05D1-%0')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139211692114751375)
,p_name=>'WWV_FLOW_PLUGIN.NO_EXECUTION_FUNCTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05D4\05D5\05D2\05D3\05E8\05D4 \05E4\05D5\05E0\05E7\05E6\05D9\05D9\05EA \05D1\05D9\05E6\05D5\05E2 \05DC\05EA\05D5\05E1\05E3 \05D1-%0')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139105196273751343)
,p_name=>'WWV_FLOW_PLUGIN.NO_RENDER_FUNCTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05D4\05D5\05D2\05D3\05E8\05D4 \05E4\05D5\05E0\05E7\05E6\05D9\05D9\05EA \05D4\05E6\05D2\05D4 \05DC\05EA\05D5\05E1\05E3 \05D1-%0')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139222093731751378)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_CAPABILITIES_FUNCTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D5\05E1\05E3 \05DE\05E7\05D5\05E8 \05E0\05EA\05D5\05E0\05D9 REST "%0" \05DC\05D0 \05DE\05DB\05D9\05DC \05E4\05D5\05E0\05E7\05E6\05D9\05D9\05EA "Capabilities".')
,p_version_scn=>2704886
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139221937918751378)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_DML_FUNCTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D5\05E1\05E3 \05DE\05E7\05D5\05E8 \05E0\05EA\05D5\05E0\05D9 REST "%0" \05DC\05D0 \05DE\05DB\05D9\05DC \05E4\05D5\05E0\05E7\05E6\05D9\05D9\05EA DML.')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139222173312751378)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_EXECUTE_FUNCTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D5\05E1\05E3 \05DE\05E7\05D5\05E8 \05E0\05EA\05D5\05E0\05D9 REST "%0" \05DC\05D0 \05DE\05DB\05D9\05DC \05E4\05D5\05E0\05E7\05E6\05D9\05D9\05EA \05D1\05D9\05E6\05D5\05E2.')
,p_version_scn=>2704886
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139222223302751378)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_FETCH_FUNCTION'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D5\05E1\05E3 \05DE\05E7\05D5\05E8 \05E0\05EA\05D5\05E0\05D9 REST "%0" \05DC\05D0 \05DE\05DB\05D9\05DC \05E4\05D5\05E0\05E7\05E6\05D9\05D9\05EA \05E9\05DC\05D9\05E4\05D4.')
,p_version_scn=>2704886
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139102566322751342)
,p_name=>'WWV_FLOW_PLUGIN.RUN_PLSQL_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05D5\05E2\05DC\05EA\05D4 \05E9\05D2\05D9\05D0\05D4 \05D1\05E7\05D5\05D3 PLSQL \05D1\05DE\05D4\05DC\05DA \05E2\05D9\05D1\05D5\05D3 \05E9\05DC \05EA\05D5\05E1\05E3.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139111138178751345)
,p_name=>'WWV_FLOW_PLUGIN_DEV.IS_REQUIRED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D5\05D1\05D4 \05DC\05E6\05D9\05D9\05DF \05E2\05E8\05DA.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139144163560751355)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.CANT_CONVERT_TO_VARCHAR2'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05D9\05EA\05DF \05DC\05D4\05DE\05D9\05E8 \05D0\05EA \05E1\05D5\05D2 \05D4\05E0\05EA\05D5\05E0\05D9\05DD %0 \05DC-VARCHAR2!')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139232316379751381)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.COLUMN_NOT_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E2\05DE\05D5\05D3\05D4 "%0" \05E9\05E6\05D5\05D9\05E0\05D4 \05DC\05EA\05DB\05D5\05E0\05D4 "%1" \05DC\05D0 \05E0\05DE\05E6\05D0\05D4 \05D1\05DE\05E9\05E4\05D8 SQL!')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139059621619751329)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.INVALID_JSON_ARRAY'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E2\05E8\05DA %0 \05E9\05DC %1 \05D0\05D9\05E0\05D5 \05DE\05E2\05E8\05DA JSON \05EA\05E7\05E3.')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139209510606751374)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.LOV_REQUIRED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05D5\05D1\05D4 \05DC\05E6\05D9\05D9\05DF \05E9\05D0\05D9\05DC\05EA\05EA \05E8\05E9\05D9\05DE\05EA \05E2\05E8\05DB\05D9\05DD \05D0\05D5 \05E8\05E9\05D9\05DE\05D4 \05E9\05DE\05D9\05EA \05E9\05DC \05E2\05E8\05DB\05D9\05DD \05DC-%0.')
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139211162329751375)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.LOV_SQL_WRONG_COLUMN_COUNT'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E1\05E4\05E8 \05E9\05D2\05D5\05D9 \05E9\05DC \05E2\05DE\05D5\05D3\05D5\05EA \05E0\05D1\05D7\05E8\05D5 \05D1\05E9\05D0\05D9\05DC\05EA\05EA \05D4-SQL \05E9\05DC \05E8\05E9\05D9\05DE\05EA \05E2\05E8\05DB\05D9\05DD, \05D1\05E9\05D1\05D9\05DC %0. \05E2\05D9\05D9\05DF \05D1\05D3\05D5\05D2\05DE\05D0\05D5\05EA \05E9\05DC \05DE\05E9\05E4\05D8\05D9\05DD \05EA\05E7\05E4\05D9\05DD.')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139232109776751381)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.NO_COLUMN_FOR_ATTRIBUTE'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E6\05D5\05D9\05E0\05D4 \05E2\05DE\05D5\05D3\05D4 \05DC\05EA\05DB\05D5\05E0\05D4 "%0".')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139261367231751390)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.NUMBER_ATTRIBUTE_VALUE_INVALID'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E2\05E8\05DA \05E9\05D4\05D5\05D6\05DF %0 \05DC\05EA\05DB\05D5\05E0\05D4 "%1" \05D0\05D9\05E0\05D5 \05DE\05E1\05E4\05E8\05D9.')
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139214675534751376)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.SQL_WRONG_DATA_TYPE'
,p_message_language=>'he'
,p_message_text=>unistr('%0 \05D4\05D5\05D0 \05DE\05E1\05D5\05D2 \05E0\05EA\05D5\05E0\05D9\05DD \05E9\05D2\05D5\05D9 \05D1\05DE\05E9\05E4\05D8 SQL. \05DE\05E1'' \05D4\05E2\05DE\05D5\05D3\05D4 %1 \05D4\05D5\05D0 %2 \05D0\05DA \05E6\05E4\05D5\05D9 %3.')
,p_version_scn=>2704885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139232209076751381)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.WRONG_COLUMN_DATA_TYPE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E2\05DE\05D5\05D3\05D4 "%0" \05E9\05E6\05D5\05D9\05E0\05D4 \05DC\05EA\05DB\05D5\05E0\05D4 "%1" \05DE\05DB\05D9\05DC\05D4 \05E1\05D5\05D2 \05E0\05EA\05D5\05E0\05D9\05DD %2 \05D0\05DA \05D0\05DE\05D5\05E8\05D4 \05DC\05D4\05DB\05D9\05DC %3.')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139101792111751342)
,p_name=>'WWV_FLOW_PRINT_UTIL.REPORT_LAYOUT_NOT_FOUND'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05EA\05D5\05D5\05D4 \05D4\05D3\05D5\05D7 \05DC\05D0 \05E0\05DE\05E6\05D0.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139089337522751339)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTIONS_LIMIT_EXCEEDED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D2\05D1\05D5\05DC \05D1\05D9\05E6\05D5\05E2\05D9\05DD \05D1\05E8\05E7\05E2 \05E2\05DC\05D4 \05E2\05DC %0.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139039606003751323)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTION_ALREADY_RUNNING'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D9\05E6\05D5\05E2 \05D0\05D7\05E8 \05E9\05DC %0 \05DB\05D1\05E8 \05E8\05E5.')
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139039582904751323)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTION_ALREADY_RUNNING_CTX'
,p_message_language=>'he'
,p_message_text=>unistr('\05D1\05D9\05E6\05D5\05E2 \05D0\05D7\05E8 \05E9\05DC %0 \05DB\05D1\05E8 \05E8\05E5 \05DC\05D4\05E7\05E9\05E8 %1.')
,p_version_scn=>2704851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139054562477751328)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.FILES_NOT_VISIBLE_IN_WORKING_SESSION'
,p_message_language=>'he'
,p_message_text=>unistr('\05E7\05D1\05E6\05D9\05DD \05E9\05D4\05D5\05E2\05DC\05D5 \05D0\05D9\05E0\05DD \05D2\05DC\05D5\05D9\05D9\05DD \05D1\05DE\05D5\05E9\05D1 \05D4\05E2\05D1\05D5\05D3\05D4 \05D4\05E4\05E2\05D9\05DC \05DC\05D1\05D9\05E6\05D5\05E2 \05E9\05DC %0.')
,p_version_scn=>2704855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139167039220751362)
,p_name=>'WWV_FLOW_RENDER_REPORT3.COMPUTE_SUM_NOT_SUPPORTED_FOR_WEB_SOURCES'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05D0 \05E0\05D9\05EA\05DF \05DC\05D4\05E9\05EA\05DE\05E9 \05D1\05DE\05D0\05E4\05D9\05D9\05DF ''\05D7\05D9\05E9\05D5\05D1 \05E1\05DB\05D5\05DD'' \05DC\05D3\05D5\05D7\05D5\05EA \05D4\05DE\05D1\05D5\05E1\05E1\05D9\05DD \05E2\05DC \05DE\05E7\05D5\05E8 \05E0\05EA\05D5\05E0\05D9 REST.')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139128770284751350)
,p_name=>'WWV_FLOW_RENDER_SHORTCUT.UNABLE_SET_SHORT_VAL_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('ERR-2904 \05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05D4\05D2\05D3\05D9\05E8 \05E2\05E8\05DA \05E7\05D9\05E6\05D5\05E8 \05D3\05E8\05DA.')
,p_version_scn=>2704869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139133737408751352)
,p_name=>'WWV_FLOW_RENDER_SHORTCUT.UNKNOWN_TYPE_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4: \05E1\05D5\05D2 \05E7\05D9\05E6\05D5\05E8 \05D3\05E8\05DA \05DC\05D0 \05D9\05D3\05D5\05E2.')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139071475062751333)
,p_name=>'WWV_FLOW_SEARCH_API.TEXT_QUERY_TOO_LONG'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D0\05D9\05DC\05EA\05EA \05D4\05D7\05D9\05E4\05D5\05E9 \05D0\05E8\05D5\05DB\05D4 \05DE\05D3\05D9.')
,p_version_scn=>2704859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139122887963751348)
,p_name=>'WWV_FLOW_SECURITY.AUTH_SCHEME_FETCH_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05E9\05DC\05D5\05E3 \05EA\05D5\05DB\05E0\05D9\05EA \05D0\05D9\05DE\05D5\05EA \05D6\05D4\05D5\05EA \05D1\05D9\05D9\05E9\05D5\05DD %0.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139130863864751351)
,p_name=>'WWV_FLOW_SECURITY.COMPONENT_FETCH_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05E9\05DC\05D5\05E3 \05E8\05DB\05D9\05D1 %0.')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139201149399751372)
,p_name=>'WWV_FLOW_SESSION_API.TENANT_ID_EXISTS'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D6\05D4\05D4 \05D4\05D3\05D9\05D9\05E8 \05DB\05D1\05E8 \05E7\05D9\05D9\05DD \05DC\05DE\05D5\05E9\05D1 \05D4\05E2\05D1\05D5\05D3\05D4 \05D4\05E0\05D5\05DB\05D7\05D9.')
,p_version_scn=>2704881
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139134092006751352)
,p_name=>'WWV_FLOW_USER_API.T_EMAIL'
,p_message_language=>'he'
,p_message_text=>unistr('\05D3\05D5\05D0"\05DC')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139260867101751389)
,p_name=>'WWV_FLOW_WEB_SERVICES.AUTHENTICATION_FAILED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9\05DE\05D5\05EA \05D4\05D6\05D4\05D5\05EA \05E0\05DB\05E9\05DC.')
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139161441949751360)
,p_name=>'WWV_FLOW_WEB_SERVICES.COOKIE_INVALID'
,p_message_language=>'he'
,p_message_text=>unistr('cookie \05D0\05D7\05D3 \05D0\05D5 \05D9\05D5\05EA\05E8 \05E9\05D4\05D5\05D2\05D3\05E8\05D5 \05D1-apex_util.g_request_cookies \05DE\05DB\05D9\05DC\05D9\05DD \05E2\05E8\05DA \05DC\05D0 \05EA\05E7\05E3.')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139143324129751355)
,p_name=>'WWV_FLOW_WEB_SERVICES.INVALID_UDDI_RESPONSE'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05EA\05D2\05D5\05D1\05D4 \05DE-UDDI registry \05D4\05D9\05D9\05EA\05D4 \05DC\05D0 \05EA\05E7\05E4\05D4.')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139102608594751342)
,p_name=>'WWV_FLOW_WEB_SERVICES.INVALID_WSDL'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05EA\05D5\05D1\05EA \05D4-URL \05E9\05E1\05D5\05E4\05E7\05D4 \05DC\05D0 \05D4\05D7\05D6\05D9\05E8\05D4 \05DE\05E1\05DE\05DA WSDL \05EA\05E7\05E3.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139105435193751343)
,p_name=>'WWV_FLOW_WEB_SERVICES.MULTIPLE_SOAP'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E1\05DE\05DA \05D4-WSDL \05DE\05DB\05D9\05DC \05DE\05E1\05E4\05E8 \05DB\05E8\05D9\05DB\05D5\05EA SOAP. \05D4\05DE\05D5\05E6\05E8 &PRODUCT_NAME. \05EA\05D5\05DE\05DA \05E8\05E7 \05D1-WSDL''s \05E2\05DD \05DB\05E8\05D9\05DB\05EA SOAP \05D0\05D7\05EA. \05DC\05D7\05E5 \05E2\05DC ''\05E6\05D5\05E8 \05D4\05E4\05E0\05D9\05D4 \05DC\05E9\05D9\05E8\05D5\05EA \05E8\05E9\05EA \05D1\05D0\05D5\05E4\05DF \05D9\05D3\05E0\05D9'' \05DB\05D3\05D9 \05DC\05D4\05DE\05E9\05D9\05DA \05DC\05D9\05E6\05D5\05E8 \05D4\05E4\05E0\05D9\05D4 \05DC\05E9\05D9\05E8\05D5\05EA \05D6\05D4.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139181000541751366)
,p_name=>'WWV_FLOW_WEB_SERVICES.NOT_XML'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05EA\05D2\05D5\05D1\05D4 \05DE\05D4\05E9\05D9\05E8\05D5\05EA \05DC\05D0 \05D4\05D9\05D9\05EA\05D4 XML.')
,p_version_scn=>2704878
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139260747290751389)
,p_name=>'WWV_FLOW_WEB_SERVICES.NO_VALID_OAUTH_TOKEN'
,p_message_language=>'he'
,p_message_text=>unistr('\05D9\05D9\05EA\05DB\05DF \05E9\05D0\05E1\05D9\05DE\05D5\05DF \05D4\05D2\05D9\05E9\05D4 \05DC-OAuth \05D0\05D9\05E0\05D5 \05D6\05DE\05D9\05DF \05D0\05D5 \05E9\05E4\05D2 \05EA\05D5\05E7\05E4\05D5.')
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139225294059751379)
,p_name=>'WWV_FLOW_WEB_SERVICES.REQUEST_LIMIT_EXCEEDED'
,p_message_language=>'he'
,p_message_text=>unistr('\05D7\05E8\05D2\05EA \05DE\05D4\05DE\05E1\05E4\05E8 \05D4\05DE\05E8\05D1\05D9 \05E9\05DC \05D1\05E7\05E9\05D5\05EA \05E9\05D9\05E8\05D5\05EA \05D0\05D9\05E0\05D8\05E8\05E0\05D8 \05DC\05DB\05DC \05DE\05E8\05D7\05D1 \05E2\05D1\05D5\05D3\05D4. \05E4\05E0\05D4 \05DC\05DE\05E0\05D4\05DC\05DF.')
,p_version_scn=>2704887
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139260998160751390)
,p_name=>'WWV_FLOW_WEB_SERVICES.UNSUPPORTED_OAUTH_TOKEN'
,p_message_language=>'he'
,p_message_text=>unistr('\05D4\05E9\05E8\05EA \05D4\05D2\05D9\05D1 \05E2\05DD \05E1\05D5\05D2 \05D0\05E1\05D9\05DE\05D5\05DF OAuth \05E9\05D0\05D9\05E0\05D5 \05E0\05EA\05DE\05DA.')
,p_version_scn=>2704897
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139104871135751343)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_NO_SOAP'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E1\05DE\05DA \05D4-WSDL \05DC\05D0 \05D4\05DB\05D9\05DC \05DB\05E8\05D9\05DB\05D4 \05DC-SOAP, \05D4\05D3\05E8\05D5\05E9\05D4 \05DB\05D3\05D9 \05DC\05D4\05D5\05E1\05D9\05E3 \05D0\05EA \05D4\05D4\05E4\05E0\05D9\05D4.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139100222999751342)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_REQUIRES_AUTH'
,p_message_language=>'he'
,p_message_text=>unistr('WSDL \05DE\05D7\05D9\05D9\05D1 \05E4\05E8\05D8\05D9 \05D0\05D9\05DE\05D5\05EA. \05E1\05E4\05E7 \05D0\05EA \05E9\05DD \05D4\05DE\05E9\05EA\05DE\05E9 \05D5\05D4\05E1\05D9\05E1\05DE\05D4 \05DC\05D4\05DC\05DF.')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139111295116751345)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_UNHANDLED'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E0\05D5\05E2 \05E2\05D9\05D1\05D5\05D3 \05D4\05EA\05DE\05D5\05E0\05D4 \05DC\05D0 \05D4\05E6\05DC\05D9\05D7 \05DC\05D4\05D1\05D9\05DF \05D0\05EA \05DE\05E1\05DE\05DA WSDL \05D6\05D4. \05DC\05D7\05E5 \05E2\05DC ''\05E6\05D5\05E8 \05D4\05E4\05E0\05D9\05D4 \05DC\05E9\05D9\05E8\05D5\05EA \05E8\05E9\05EA \05D1\05D0\05D5\05E4\05DF \05D9\05D3\05E0\05D9'' \05DB\05D3\05D9 \05DC\05D4\05DE\05E9\05D9\05DA \05DC\05D9\05E6\05D5\05E8 \05D4\05E4\05E0\05D9\05D4 \05DC\05E9\05D9\05E8\05D5\05EA \05D6\05D4.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139184073421751367)
,p_name=>'WWV_FLOW_WIZARD_API.UPDATE_ERROR'
,p_message_language=>'he'
,p_message_text=>unistr('\05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05E2\05D1\05D3 \05D0\05EA \05D4\05E2\05D3\05DB\05D5\05DF.')
,p_version_scn=>2704879
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139209805671751374)
,p_name=>'WWV_FLOW_WORKSHEET.LOV_DISPLAY_AND_RETURN_COLUMN_EQUAL'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DE\05D5\05D3\05D5\05EA \05D4\05D4\05D7\05D6\05E8\05D4 \05D5\05D4\05EA\05E6\05D5\05D2\05D4 \05E9\05DC \05E8\05E9\05D9\05DE\05EA \05E2\05E8\05DB\05D9\05DD \05D4\05DF \05D6\05D4\05D5\05EA!')
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139209796133751374)
,p_name=>'WWV_FLOW_WORKSHEET.LOV_NO_RETURN_COLUMN'
,p_message_language=>'he'
,p_message_text=>unistr('\05DC\05E8\05E9\05D9\05DE\05EA \05D4\05E2\05E8\05DB\05D9\05DD \05D0\05D9\05DF \05E2\05DE\05D5\05D3\05EA \05D4\05D7\05D6\05E8\05D4.')
,p_version_scn=>2704884
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139137452795751353)
,p_name=>'WWV_RENDER_REPORT3.COLUMN_VALUE_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05E9\05DC\05D9\05E4\05EA \05E2\05E8\05DA \05E2\05DE\05D5\05D3\05D4: %0')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139162315777751360)
,p_name=>'WWV_RENDER_REPORT3.DATA_TOO_OLD'
,p_message_language=>'he'
,p_message_text=>unistr('\05E0\05EA\05D5\05E0\05D9 \05D4\05D8\05D5\05E4\05E1 \05D4\05D8\05D1\05DC\05D0\05D9 \05D4\05E0\05D5\05DB\05D7\05D9 \05D9\05E9\05E0\05D9\05DD \05DE\05D3\05D9; \05E0\05EA\05D5\05E0\05D9 \05D4\05DE\05E7\05D5\05E8 \05D4\05E9\05EA\05E0\05D5.<br/> \05DC\05D7\05E5 <strong><a href="%0">\05DB\05D0\05DF</a></strong> \05DB\05D3\05D9 \05DC\05E0\05D8\05D5\05E9 \05D0\05EA \05D4\05E9\05D9\05E0\05D5\05D9\05D9\05DD \05D5\05DC\05D8\05E2\05D5\05DF \05DE\05D7\05D3\05E9 \05D0\05EA \05D4\05E0\05EA\05D5\05E0\05D9\05DD \05DE\05DE\05E1\05D3 \05D4\05E0\05EA\05D5\05E0\05D9\05DD.')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139117565248751347)
,p_name=>'WWV_RENDER_REPORT3.ERR_DETERMINE_PAGINATION'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05E7\05D1\05D9\05E2\05EA \05DE\05D7\05E8\05D5\05D6\05EA \05E2\05D9\05DE\05D5\05D3')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139117431611751347)
,p_name=>'WWV_RENDER_REPORT3.ERR_DETERMINE_QUERY_HEADINGS'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05E7\05D1\05D5\05E2 \05DB\05D5\05EA\05E8\05D5\05EA \05E9\05D0\05D9\05DC\05EA\05D0:'),
'%0'))
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139117697039751347)
,p_name=>'WWV_RENDER_REPORT3.ERR_REPORT_FOOTER'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05D1\05D9\05E6\05D5\05E2 \05D4\05D7\05DC\05E4\05D5\05EA \05DC\05DB\05D5\05EA\05E8\05EA \05EA\05D7\05EA\05D5\05E0\05D4 \05E9\05DC \05D3\05D5\05D7.')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139117763693751347)
,p_name=>'WWV_RENDER_REPORT3.FAILED_PARSING_QUERY'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\05E0\05DB\05E9\05DC \05D1\05E4\05D9\05E8\05D5\05E7 \05E9\05D0\05D9\05DC\05EA\05EA SQL:'),
'%0',
'%1'))
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139123881010751349)
,p_name=>'WWV_RENDER_REPORT3.FOUND_BUT_NOT_DISPLAYED'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05E1\05E4\05E8 \05DE\05D6\05E2\05E8\05D9 \05DE\05D1\05D5\05E7\05E9 \05E9\05DC \05E9\05D5\05E8\05D5\05EA: %0; \05E9\05D5\05E8\05D5\05EA \05E9\05E0\05DE\05E6\05D0\05D5 \05D0\05DA \05DC\05D0 \05D4\05D5\05E6\05D2\05D5: %1')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139120275653751348)
,p_name=>'WWV_RENDER_REPORT3.HTML_USE_COLUMN_ALIAS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DE\05D5\05D3\05EA \05D4\05E9\05D0\05D9\05DC\05EA\05D0 #%0 (%1) \05D0\05D9\05E0\05D4 \05EA\05E7\05E4\05D4. \05E2\05DE\05D5\05D3\05D5\05EA \05D4\05DE\05D1\05D5\05E1\05E1\05D5\05EA \05E2\05DC HTML \05D6\05E7\05D5\05E7\05D5\05EA \05DC\05E9\05DE\05D5\05EA \05DB\05D9\05E0\05D5\05D9')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139137381102751353)
,p_name=>'WWV_RENDER_REPORT3.QUERY_HEADING_ERR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D2\05D9\05D0\05D4 \05D1\05E7\05D1\05DC\05EA \05DB\05D5\05EA\05E8\05D5\05EA \05E9\05D0\05D9\05DC\05EA\05D0: %0')
,p_version_scn=>2704871
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139117854559751347)
,p_name=>'WWV_RENDER_REPORT3.REPORT_ERROR'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\05E9\05D2\05D9\05D0\05EA \05D3\05D5\05D7:'),
'%0'))
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139157971241751359)
,p_name=>'WWV_RENDER_REPORT3.SORT_BY_THIS_COLUMN'
,p_message_language=>'he'
,p_message_text=>unistr('\05DE\05D9\05D9\05DF \05DC\05E4\05D9 \05E2\05DE\05D5\05D3\05D4 \05D6\05D5')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139120397562751348)
,p_name=>'WWV_RENDER_REPORT3.SYNTAX_ERROR'
,p_message_language=>'he'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\05D0\05D9 \05D0\05E4\05E9\05E8 \05DC\05E4\05E8\05E7 \05D0\05EA \05D4\05E9\05D0\05D9\05DC\05EA\05D0, \05D1\05D3\05D5\05E7 \05D0\05EA \05EA\05D7\05D1\05D9\05E8 \05D4\05E9\05D0\05D9\05DC\05EA\05D0 \05E9\05DC\05DA.'),
'(%0)',
'</p>'))
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139162495210751360)
,p_name=>'WWV_RENDER_REPORT3.UNSAVED_DATA'
,p_message_language=>'he'
,p_message_text=>unistr('\05D8\05D5\05E4\05E1 \05D6\05D4 \05DE\05DB\05D9\05DC \05E9\05D9\05E0\05D5\05D9\05D9\05DD \05E9\05DC\05D0 \05E0\05E9\05DE\05E8\05D5. \05DC\05D7\05E5 \05E2\05DC ''\05D0\05D5\05E7\05D9\05D9'' \05DB\05D3\05D9 \05DC\05D4\05DE\05E9\05D9\05DA \05D1\05DC\05D9 \05DC\05E9\05DE\05D5\05E8 \05D0\05EA \05D4\05E9\05D9\05E0\05D5\05D9\05D9\05DD.')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139166913234751362)
,p_name=>'WWV_RENDER_REPORT3.UNSUPPORTED_PAGINATION_SCHEME'
,p_message_language=>'he'
,p_message_text=>unistr('\05EA\05D5\05DB\05E0\05D9\05EA \05E2\05D9\05DE\05D5\05D3 \05D4\05D3\05D5\05D7 (%0) \05D0\05D9\05E0\05D4 \05E0\05EA\05DE\05DB\05EA \05E2\05DD \05DE\05E7\05D5\05E8 \05D4\05E0\05EA\05D5\05E0\05D9\05DD \05E9\05E0\05D1\05D7\05E8.')
,p_version_scn=>2704875
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139120126411751348)
,p_name=>'WWV_RENDER_REPORT3.USE_COLUMN_ALIAS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E2\05DE\05D5\05D3\05EA \05D4\05E9\05D0\05D9\05DC\05EA\05D0 #%0 (%1) \05D0\05D9\05E0\05D4 \05EA\05E7\05E4\05D4, \05D4\05E9\05EA\05DE\05E9 \05D1\05DB\05D9\05E0\05D5\05D9 \05E2\05DE\05D5\05D3\05D4')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139123982404751349)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_MORE_THAN_Z'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D5\05E8\05D5\05EA %0 - %1 \05DE\05EA\05D5\05DA \05DE\05E2\05DC %2')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139164401548751361)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_MORE_THAN_Z_2'
,p_message_language=>'he'
,p_message_text=>unistr('%0 - %1 \05DE\05EA\05D5\05DA \05D9\05D5\05EA\05E8 \05DE-%2')
,p_version_scn=>2704874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139123734122751349)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05D5\05E8\05D5\05EA %0 - %1 of %2')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139104513008751343)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z_2'
,p_message_language=>'he'
,p_message_text=>unistr('%0 - %1 \05DE\05EA\05D5\05DA %2')
,p_version_scn=>2704864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139117900150751347)
,p_name=>'Y'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05DF')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139125272110751349)
,p_name=>'YEAR'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05E0\05D4')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139117174622751347)
,p_name=>'YEARS'
,p_message_language=>'he'
,p_message_text=>unistr('\05E9\05E0\05D9\05DD')
,p_version_scn=>2704868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139162557457751360)
,p_name=>'YES'
,p_message_language=>'he'
,p_message_text=>unistr('\05DB\05DF ')
,p_version_scn=>2704874
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
 p_id=>wwv_flow_imp.id(109678305570583962.4542)
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
 p_id=>1.4542
,p_name=>unistr('\05D4\05D5\05D3\05E2\05D5\05EA')
,p_alias=>'MESSAGES'
,p_step_title=>unistr('\05D4\05D5\05D3\05E2\05D5\05EA')
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
