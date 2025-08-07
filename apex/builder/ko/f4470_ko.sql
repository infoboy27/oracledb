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
,p_default_application_id=>4478
,p_default_id_offset=>0
,p_default_owner=>'APEX_240200'
);
end;
/
 
prompt APPLICATION 4478 - Oracle APEX Runtime Messages
--
-- Application Export:
--   Application:     4478
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
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'A144692438909758316')
,p_page_view_logging=>'YES'
,p_charset=>'utf-8'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt_last_reset=>'20250422180859'
,p_bookmark_checksum_function=>'SH1'
,p_compatibility_mode=>'24.2'
,p_session_state_commits=>'IMMEDIATE'
,p_flow_language=>'ko'
,p_flow_language_derived_from=>'SESSION'
,p_date_format=>'&DATE_FORMAT.'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(109678305570583962.4478)
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
 p_id=>wwv_flow_imp.id(4478)
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
 p_id=>wwv_flow_imp.id(728504220438374.4478)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SELECT_MANY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_values_as', 'separated')).to_clob
,p_version_scn=>7007816
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(736540203200530.4478)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_BOSS'
,p_version_scn=>243430877
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(800575880762576.4478)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'NATIVE_OPEN_AI_ASSISTANT'
,p_version_scn=>15457644
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2657043006125217.4478)
,p_plugin_type=>'PROCESS TYPE'
,p_plugin=>'NATIVE_GEOCODING'
,p_attribute_01=>'RELAX_HOUSE_NUMBER'
,p_version_scn=>117636987
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(110599941590099161.4478)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'default_icon', 'fa-star',
  'tooltip', '#VALUE#')).to_clob
,p_version_scn=>7007818
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(118481226255833028.4478)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_MAP_REGION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_vector_tile_layers', 'Y')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(123214098089478467.4478)
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
 p_id=>wwv_flow_imp.id(124389732573989299.4478)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_ADFBC'
,p_version_scn=>37165931336889
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(209516503264520988.4478)
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
 p_id=>wwv_flow_imp.id(285800719532138903.4478)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N')).to_clob
,p_version_scn=>7007823
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(649595203182764436.4478)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_style', 'SWITCH_CB',
  'off_value', 'N',
  'on_value', 'Y')).to_clob
,p_version_scn=>6539584
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1874744429444344138.4478)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'include_slider', 'N')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1941451863897626238.4478)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'actions_menu_structure', 'IG')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2027366558906572283.4478)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'mode', 'FULL')).to_clob
,p_version_scn=>7007824
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2120597162971751123.4478)
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
 p_id=>wwv_flow_imp.id(649613204592764515.4478)
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
 p_id=>wwv_flow_imp.id(850359229090693491.4478)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Wizard Dialog.ko'
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
 p_id=>wwv_flow_imp.id(293526110820992194.4478)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4478)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293526630547992195.4478)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4478)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293527171164992195.4478)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4478)
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
 p_id=>wwv_flow_imp.id(851037359784626333.4478)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Dialog.ko'
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
 p_id=>wwv_flow_imp.id(293473352245977306.4478)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4478)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293473882718977306.4478)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4478)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293474370844977307.4478)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4478)
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
 p_id=>wwv_flow_imp.id(851037631091626378.4478)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Edit Screen.ko'
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
 p_id=>wwv_flow_imp.id(2495515088702127.4478)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4478)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2496016567702127.4478)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4478)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2496522618702127.4478)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4478)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2497097895702127.4478)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4478)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2497562953702128.4478)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4478)
,p_name=>'Edit Screen Header'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2498085850702128.4478)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4478)
,p_name=>'Page Position 5'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2498553894702128.4478)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4478)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2499023066702128.4478)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4478)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2499516729702128.4478)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4478)
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
 p_id=>wwv_flow_imp.id(851039898661626389.4478)
,p_theme_id=>3
,p_name=>'APEX 5.0 - No Side Bar.ko'
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
 p_id=>wwv_flow_imp.id(2418665544706094.4478)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4478)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2419139140706094.4478)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4478)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2419660231706094.4478)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4478)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2420136000706094.4478)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4478)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2420617033706094.4478)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4478)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2421142368706094.4478)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4478)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2421629849706095.4478)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4478)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2422132460706095.4478)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4478)
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
 p_id=>wwv_flow_imp.id(851040471818626394.4478)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Right Side Bar.ko'
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
 p_id=>wwv_flow_imp.id(1537388880131854.4478)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4478)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1537880270131855.4478)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4478)
,p_name=>'Page Header (Position 3)'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1538315330131855.4478)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4478)
,p_name=>'Page Header (Position 4)'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1538840638131855.4478)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4478)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1539339441131855.4478)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4478)
,p_name=>'After Body'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1539830162131855.4478)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4478)
,p_name=>'Page Header (Position 1)'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1540338421131855.4478)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4478)
,p_name=>'Page Header (Position 2)'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1540832064131856.4478)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4478)
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
 p_id=>wwv_flow_imp.id(851041812938626395.4478)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Sign Up Wizard.ko'
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
 p_id=>wwv_flow_imp.id(115212309210289451.4478)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4478)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115212857712289451.4478)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4478)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115213340345289452.4478)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4478)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115213804331289452.4478)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4478)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115214317592289452.4478)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4478)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115214875819289453.4478)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4478)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115215325320289453.4478)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4478)
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
 p_id=>wwv_flow_imp.id(851042476105626395.4478)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Wizard Page.ko'
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
 p_id=>wwv_flow_imp.id(1485266589875353.4478)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4478)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1485734308875353.4478)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4478)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1486237142875354.4478)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4478)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1486735024875354.4478)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4478)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1487219028875354.4478)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4478)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1487770987875354.4478)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4478)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1488272041875354.4478)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4478)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1488725778875354.4478)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4478)
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
 p_id=>wwv_flow_imp.id(514381861202541059.4478)
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
 p_id=>wwv_flow_imp.id(514382190540541061.4478)
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
 p_id=>wwv_flow_imp.id(514382538845541061.4478)
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
 p_id=>wwv_flow_imp.id(620629666890811728.4478)
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
 p_id=>wwv_flow_imp.id(620629778318811745.4478)
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
 p_id=>wwv_flow_imp.id(868252865986181054.4478)
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
 p_id=>wwv_flow_imp.id(514338947870435171.4478)
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
 p_id=>wwv_flow_imp.id(2962385277500935.4478)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4478)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2962865718500935.4478)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4478)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2963338641500935.4478)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4478)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2963894582500935.4478)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4478)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2964329937500935.4478)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4478)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2964897214500936.4478)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4478)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2965324003500936.4478)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4478)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2965838011500936.4478)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4478)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2966328405500936.4478)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4478)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2966823859500936.4478)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4478)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2967325351500936.4478)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4478)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2967812485500936.4478)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4478)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2968377768500937.4478)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4478)
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
 p_id=>wwv_flow_imp.id(514343873675436760.4478)
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
 p_id=>wwv_flow_imp.id(32585474981747544.4478)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4478)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32585915750747544.4478)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4478)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32586471989747545.4478)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4478)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32586972270747545.4478)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4478)
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
 p_id=>wwv_flow_imp.id(771803843049318447.4478)
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
 p_id=>wwv_flow_imp.id(3207496127505978.4478)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4478)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3207907805505978.4478)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4478)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3208484941505978.4478)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4478)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3208991047505978.4478)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4478)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3209402462505979.4478)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4478)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3209972507505979.4478)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4478)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3210460159505979.4478)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4478)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3210935368505979.4478)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4478)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3211466566505979.4478)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4478)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3211956312505979.4478)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4478)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3212461962505979.4478)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4478)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3212966370505980.4478)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4478)
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
 p_id=>wwv_flow_imp.id(850406444708718383.4478)
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
 p_id=>wwv_flow_imp.id(2204663592232325.4478)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4478)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2205135519232325.4478)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4478)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2205694824232325.4478)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4478)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2206129075232325.4478)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4478)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2206618558232325.4478)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4478)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2207115910232326.4478)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4478)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2207688896232326.4478)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4478)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2208160700232326.4478)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4478)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2208614050232326.4478)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4478)
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
 p_id=>wwv_flow_imp.id(850442966147812557.4478)
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
 p_id=>wwv_flow_imp.id(3346988371508588.4478)
,p_plug_template_id=>wwv_flow_imp.id(850442966147812557.4478)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3347426198508588.4478)
,p_plug_template_id=>wwv_flow_imp.id(850442966147812557.4478)
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
 p_id=>wwv_flow_imp.id(856206049762521193.4478)
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
 p_id=>wwv_flow_imp.id(2526185270486606.4478)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4478)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2526610033486606.4478)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4478)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2527184084486606.4478)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4478)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2527626846486607.4478)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4478)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2528141078486607.4478)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4478)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2528637911486607.4478)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4478)
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
 p_id=>wwv_flow_imp.id(914802799655239969.4478)
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
 p_id=>wwv_flow_imp.id(88183211858816924.4478)
,p_plug_template_id=>wwv_flow_imp.id(914802799655239969.4478)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(88183732152816924.4478)
,p_plug_template_id=>wwv_flow_imp.id(914802799655239969.4478)
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
 p_id=>wwv_flow_imp.id(914803495164240003.4478)
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
 p_id=>wwv_flow_imp.id(3373447170510516.4478)
,p_plug_template_id=>wwv_flow_imp.id(914803495164240003.4478)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3373993086510516.4478)
,p_plug_template_id=>wwv_flow_imp.id(914803495164240003.4478)
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
 p_id=>wwv_flow_imp.id(915210356236972585.4478)
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
 p_id=>wwv_flow_imp.id(2899946654493378.4478)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4478)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2900442121493378.4478)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4478)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2900949359493378.4478)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4478)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2901467944493378.4478)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4478)
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
 p_id=>wwv_flow_imp.id(915371118115573423.4478)
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
 p_id=>wwv_flow_imp.id(2695578355491332.4478)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4478)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2696079816491332.4478)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4478)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2696558276491332.4478)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4478)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2697055726491332.4478)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4478)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2697581510491332.4478)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4478)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2698048732491333.4478)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4478)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2698576547491333.4478)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4478)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2699004772491333.4478)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4478)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2699557295491333.4478)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4478)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2700035673491333.4478)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4478)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2700500589491333.4478)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4478)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2701097053491333.4478)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4478)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2701554382491334.4478)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4478)
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
 p_id=>wwv_flow_imp.id(1274355059486017828.4478)
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
 p_id=>wwv_flow_imp.id(61232728057733462.4478)
,p_plug_template_id=>wwv_flow_imp.id(1274355059486017828.4478)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(61233207886733462.4478)
,p_plug_template_id=>wwv_flow_imp.id(1274355059486017828.4478)
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
 p_id=>wwv_flow_imp.id(514332014414430986.4478)
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
 p_id=>wwv_flow_imp.id(514332292784430987.4478)
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
 p_id=>wwv_flow_imp.id(860563697365629462.4478)
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
 p_id=>wwv_flow_imp.id(865273508717512144.4478)
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
 p_id=>wwv_flow_imp.id(908020362212234651.4478)
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
 p_id=>wwv_flow_imp.id(914818080687341593.4478)
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
 p_id=>wwv_flow_imp.id(851049711466639395.4478)
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
 p_id=>wwv_flow_imp.id(851054516889639461.4478)
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
 p_id=>wwv_flow_imp.id(851055225644639463.4478)
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
 p_id=>wwv_flow_imp.id(851056531929639482.4478)
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
 p_id=>wwv_flow_imp.id(914792024808213039.4478)
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
 p_id=>wwv_flow_imp.id(914792322768213043.4478)
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
 p_id=>wwv_flow_imp.id(915377874236666939.4478)
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
 p_id=>wwv_flow_imp.id(1041941432531249038.4478)
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
 p_id=>wwv_flow_imp.id(850683711614406253.4478)
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
 p_id=>wwv_flow_imp.id(851047536471633848.4478)
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
 p_id=>wwv_flow_imp.id(851047676005633854.4478)
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
 p_id=>wwv_flow_imp.id(851047684809633856.4478)
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
 p_id=>wwv_flow_imp.id(851047795461633856.4478)
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
 p_id=>wwv_flow_imp.id(860542631889572088.4478)
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
 p_id=>wwv_flow_imp.id(1321751941832424103.4478)
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
 p_id=>wwv_flow_imp.id(514333590213433126.4478)
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
 p_id=>wwv_flow_imp.id(649611704621764507.4478)
,p_page_name=>'winlov'
,p_page_title=>unistr('\AC80\C0C9 \B300\D654\C0C1\C790')
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
,p_find_button_text=>unistr('\AC80\C0C9')
,p_find_button_attr=>'class="a-Button a-Button--hot a-Button--padLeft"'
,p_close_button_text=>unistr('\B2EB\AE30')
,p_close_button_attr=>'class="a-Button u-pullRight"'
,p_next_button_text=>unistr('\B2E4\C74C &gt;')
,p_next_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_prev_button_text=>unistr('&lt; \C774\C804')
,p_prev_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'380'
,p_height=>'480'
,p_result_row_x_of_y=>unistr('<div class="a-PopupLOV-pagination">\D589 #FIRST_ROW# - #LAST_ROW#</div>')
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
 p_id=>wwv_flow_imp.id(649611609668764506.4478)
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
 p_id=>wwv_flow_imp.id(182005134783173294.4478)
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
 p_id=>wwv_flow_imp.id(666074212329754757.4478)
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
 p_id=>wwv_flow_imp.id(666074525535755551.4478)
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
 p_id=>wwv_flow_imp.id(717250289307903026.4478)
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
 p_id=>wwv_flow_imp.id(2336377640986141.4478)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL'
,p_display_name=>'Heading Level'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(806925000765340952.4478)
,p_theme_id=>3
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default - No Icons'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808380142596819918.4478)
,p_theme_id=>3
,p_name=>'ALTERNATING_TABLE_ROWS'
,p_display_name=>'Alternating Table Rows'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Enable'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808380828683819918.4478)
,p_theme_id=>3
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Disable'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808381542095819918.4478)
,p_theme_id=>3
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default Border'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808383088145819924.4478)
,p_theme_id=>3
,p_name=>'REPORT_WIDTH'
,p_display_name=>'Report Width'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850406791580718389.4478)
,p_theme_id=>3
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850407096779718396.4478)
,p_theme_id=>3
,p_name=>'REGION_PADDING'
,p_display_name=>'Region Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Padding'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850407509193718398.4478)
,p_theme_id=>3
,p_name=>'REGION_STYLE'
,p_display_name=>'Region Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Style'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(851050160062639437.4478)
,p_theme_id=>3
,p_name=>'BADGE_LAYOUT'
,p_display_name=>'Badge Layout'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(851051045625639457.4478)
,p_theme_id=>3
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856113214217058023.4478)
,p_theme_id=>3
,p_name=>'HEIGHT'
,p_display_name=>'Height'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856114568019058024.4478)
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
 p_id=>wwv_flow_imp.id(856114830529058024.4478)
,p_theme_id=>3
,p_name=>'FORM_LABEL_WIDTH'
,p_display_name=>'Form Label Width'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856115135223058024.4478)
,p_theme_id=>3
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Not Part of Button Set'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116214022058024.4478)
,p_theme_id=>3
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>1
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116523282058024.4478)
,p_theme_id=>3
,p_name=>'FORM_LABEL_POSITION'
,p_display_name=>'Form Label Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116798725058025.4478)
,p_theme_id=>3
,p_name=>'BUTTON_SIZE'
,p_display_name=>'Button Size'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Button Size'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117102944058028.4478)
,p_theme_id=>3
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing left'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Left Spacing'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117454663058028.4478)
,p_theme_id=>3
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Right Spacing'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117908453058029.4478)
,p_theme_id=>3
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Icon on Right'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856118261810058029.4478)
,p_theme_id=>3
,p_name=>'BUTTON_TYPE'
,p_display_name=>'Button Type'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856206461450521195.4478)
,p_theme_id=>3
,p_name=>'ALERT_TYPE'
,p_display_name=>'Alert Type'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856206736628521198.4478)
,p_theme_id=>3
,p_name=>'DISPLAY'
,p_display_name=>'Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(860570508910721307.4478)
,p_theme_id=>3
,p_name=>'REGION_POSITION'
,p_display_name=>'Region Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(860571060920721309.4478)
,p_theme_id=>3
,p_name=>'REGION_OVERFLOW'
,p_display_name=>'Region Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(908020718209234676.4478)
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
 p_id=>wwv_flow_imp.id(1487577187426769.4478)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden to Assistive Tech'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4478)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4478)
,p_template_types=>'REGION'
,p_help_text=>'By default, region title is hidden but accessible, use this option to remove the header from accessible interface'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2336635141996782.4478)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H1'
,p_display_name=>'H1'
,p_display_sequence=>10
,p_css_classes=>'js-headingLevel-1'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4478)
,p_template_types=>'REGION'
,p_help_text=>'H1'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2336917964996782.4478)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H2'
,p_display_name=>'H2'
,p_display_sequence=>20
,p_css_classes=>'js-headingLevel-2'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4478)
,p_template_types=>'REGION'
,p_help_text=>'H2'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2337368425996782.4478)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H3'
,p_display_name=>'H3'
,p_display_sequence=>30
,p_css_classes=>'js-headingLevel-3'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4478)
,p_template_types=>'REGION'
,p_help_text=>'H3'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2337706283996782.4478)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H4'
,p_display_name=>'H4'
,p_display_sequence=>40
,p_css_classes=>'js-headingLevel-4'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4478)
,p_template_types=>'REGION'
,p_help_text=>'H4'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2338144805996782.4478)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H5'
,p_display_name=>'H5'
,p_display_sequence=>50
,p_css_classes=>'js-headingLevel-5'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4478)
,p_template_types=>'REGION'
,p_help_text=>'H5'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2338562059996782.4478)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H6'
,p_display_name=>'H6'
,p_display_sequence=>60
,p_css_classes=>'js-headingLevel-6'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4478)
,p_template_types=>'REGION'
,p_help_text=>'H6'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134384175764258.4478)
,p_theme_id=>3
,p_name=>'LARGELEFT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapLeft'
,p_group_id=>wwv_flow_imp.id(856117102944058028.4478)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134654971764258.4478)
,p_theme_id=>3
,p_name=>'LARGERIGHT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapRight'
,p_group_id=>wwv_flow_imp.id(856117454663058028.4478)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134823880764258.4478)
,p_theme_id=>3
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(856117908453058029.4478)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135009020764258.4478)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>3
,p_css_classes=>'a-Button--large'
,p_group_id=>wwv_flow_imp.id(856116798725058025.4478)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135269851764258.4478)
,p_theme_id=>3
,p_name=>'SMALLLEFT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padLeft'
,p_group_id=>wwv_flow_imp.id(856117102944058028.4478)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135477215764258.4478)
,p_theme_id=>3
,p_name=>'SMALLRIGHT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padRight'
,p_group_id=>wwv_flow_imp.id(856117454663058028.4478)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135634744764258.4478)
,p_theme_id=>3
,p_name=>'INNERBUTTON'
,p_display_name=>'Inner Button'
,p_display_sequence=>2
,p_css_classes=>'a-Button--pill'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4478)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135785730764258.4478)
,p_theme_id=>3
,p_name=>'LASTBUTTON'
,p_display_name=>'Last Button'
,p_display_sequence=>3
,p_css_classes=>'a-Button--pillEnd'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4478)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136068296764258.4478)
,p_theme_id=>3
,p_name=>'FIRSTBUTTON'
,p_display_name=>'First Button'
,p_display_sequence=>1
,p_css_classes=>'a-Button--pillStart'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4478)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136225140764258.4478)
,p_theme_id=>3
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>1
,p_css_classes=>'a-Button--primary'
,p_group_id=>wwv_flow_imp.id(856118261810058029.4478)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136360666764258.4478)
,p_theme_id=>3
,p_name=>'REGIONHEADERBUTTON'
,p_display_name=>'Button in Region Header'
,p_display_sequence=>1
,p_css_classes=>'a-Button--regionHeader'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136507481764259.4478)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--small'
,p_group_id=>wwv_flow_imp.id(856116798725058025.4478)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136620486764259.4478)
,p_theme_id=>3
,p_name=>'STRONGBUTTONLABEL'
,p_display_name=>'Strong Button Label'
,p_display_sequence=>1
,p_css_classes=>'a-Button--strongLabel'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136861925764259.4478)
,p_theme_id=>3
,p_name=>'AUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form--autoWidthLabels'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4478)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137023291764259.4478)
,p_theme_id=>3
,p_name=>'FIXEDWIDTH'
,p_display_name=>'Fixed'
,p_display_sequence=>10
,p_css_classes=>'a-Form--fixedLabels'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4478)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137193234764259.4478)
,p_theme_id=>3
,p_name=>'LABELSABOVE'
,p_display_name=>'Labels Above'
,p_display_sequence=>1
,p_css_classes=>'a-Form--labelsAbove'
,p_group_id=>wwv_flow_imp.id(856116523282058024.4478)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137470293764259.4478)
,p_theme_id=>3
,p_name=>'ALIGNLABELSLEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Form--leftLabels'
,p_group_id=>wwv_flow_imp.id(856114568019058024.4478)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137586003764259.4478)
,p_theme_id=>3
,p_name=>'LABELAUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--autoLabelWidth'
,p_group_id=>wwv_flow_imp.id(856116214022058024.4478)
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137737661764259.4478)
,p_theme_id=>3
,p_name=>'STRETCHFORMFIELD'
,p_display_name=>'Stretch Form Field'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--stretch'
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137933035764259.4478)
,p_theme_id=>3
,p_name=>'FIXEDLARGE'
,p_display_name=>'Fixed (Large Width)'
,p_display_sequence=>30
,p_css_classes=>'a-Form-fixedLabelsLarge'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4478)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138175863764259.4478)
,p_theme_id=>3
,p_name=>'FIXEDMEDIUM'
,p_display_name=>'Fixed (Medium Width)'
,p_display_sequence=>20
,p_css_classes=>'a-Form-fixedLabelsMed'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4478)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138340877764259.4478)
,p_theme_id=>3
,p_name=>'180PX'
,p_display_name=>'180px'
,p_display_sequence=>10
,p_css_classes=>'h180'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4478)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138553321764259.4478)
,p_theme_id=>3
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>20
,p_css_classes=>'h240'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4478)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138777457764259.4478)
,p_theme_id=>3
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>30
,p_css_classes=>'h320'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4478)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138891974764260.4478)
,p_theme_id=>3
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>50
,p_css_classes=>'h480'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4478)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857139153872764260.4478)
,p_theme_id=>3
,p_name=>'540PX'
,p_display_name=>'540px'
,p_display_sequence=>60
,p_css_classes=>'h540'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4478)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857139375337764260.4478)
,p_theme_id=>3
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>70
,p_css_classes=>'h640'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4478)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145206107768768.4478)
,p_theme_id=>3
,p_name=>'USE_COLORED_BACKGROUND'
,p_display_name=>'Use Colored Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4478)
,p_css_classes=>'a-Alert--colorBG'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145328630768768.4478)
,p_theme_id=>3
,p_name=>'USE_DEFAULT_ICONS'
,p_display_name=>'Use Default Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4478)
,p_css_classes=>'a-Alert--defaultIcons'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145505007768768.4478)
,p_theme_id=>3
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4478)
,p_css_classes=>'a-Alert--warning'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4478)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145725778768768.4478)
,p_theme_id=>3
,p_name=>'ERROR'
,p_display_name=>'Error'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4478)
,p_css_classes=>'a-Alert--danger'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4478)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145892117768768.4478)
,p_theme_id=>3
,p_name=>'INFORMATIONAL'
,p_display_name=>'Informational'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4478)
,p_css_classes=>'a-Alert--info'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4478)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146085228768768.4478)
,p_theme_id=>3
,p_name=>'HORIZONTAL'
,p_display_name=>'Horizontal'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4478)
,p_css_classes=>'a-Alert--horizontal'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4478)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146322225768769.4478)
,p_theme_id=>3
,p_name=>'WIZARD'
,p_display_name=>'Wizard'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4478)
,p_css_classes=>'a-Alert--wizard'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4478)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146393064768769.4478)
,p_theme_id=>3
,p_name=>'REMOVE_ICON'
,p_display_name=>'Remove Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4478)
,p_css_classes=>'a-Alert--noIcon'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146615368768769.4478)
,p_theme_id=>3
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4478)
,p_css_classes=>'a-Alert--success'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4478)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147042367768771.4478)
,p_theme_id=>3
,p_name=>'REGIONCONTAINSITEMSTEXT'
,p_display_name=>'Region Contains Items / Text'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4478)
,p_css_classes=>'a-ButtonRegion--withItems'
,p_template_types=>'REGION'
,p_help_text=>'Check this option if this region contains items or text.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147189725768771.4478)
,p_theme_id=>3
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4478)
,p_css_classes=>'a-ButtonRegion--noUI'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4478)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147385795768771.4478)
,p_theme_id=>3
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4478)
,p_css_classes=>'a-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4478)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147655668768771.4478)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4478)
,p_css_classes=>'a-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4478)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147872948768771.4478)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4478)
,p_css_classes=>'a-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4478)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147976018768771.4478)
,p_theme_id=>3
,p_name=>'WIZARDDIALOG'
,p_display_name=>'Used for Wizard Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4478)
,p_css_classes=>'a-ButtonRegion--wizard'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857148162424768771.4478)
,p_theme_id=>3
,p_name=>'VISIBLE'
,p_display_name=>'Visible'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4478)
,p_css_classes=>'a-ButtonRegion--showTitle'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4478)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857148341454768771.4478)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4478)
,p_css_classes=>'a-ButtonRegion--accessibleTitle'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4478)
,p_template_types=>'REGION'
,p_help_text=>'Use this option to add a visually hidden heading which is accessible for screen readers, but otherwise not visible to users.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149438708768778.4478)
,p_theme_id=>3
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4478)
,p_css_classes=>'a-BadgeList--float'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4478)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149614105768778.4478)
,p_theme_id=>3
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4478)
,p_css_classes=>'a-BadgeList--fixed'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4478)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149843563768778.4478)
,p_theme_id=>3
,p_name=>'STACKEDVERTICALLY'
,p_display_name=>'Stacked Vertically'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4478)
,p_css_classes=>'a-BadgeList--stacked'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4478)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149998210768778.4478)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'32px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4478)
,p_css_classes=>'a-BadgeList--small'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4478)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150194417768778.4478)
,p_theme_id=>3
,p_name=>'MEDIUM'
,p_display_name=>'48px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4478)
,p_css_classes=>'a-BadgeList--medium'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4478)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150439507768778.4478)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'64px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4478)
,p_css_classes=>'a-BadgeList--large'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4478)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150608654768780.4478)
,p_theme_id=>3
,p_name=>'XLARGE'
,p_display_name=>'96px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4478)
,p_css_classes=>'a-BadgeList--xlarge'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4478)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150792333768780.4478)
,p_theme_id=>3
,p_name=>'XXLARGE'
,p_display_name=>'128px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4478)
,p_css_classes=>'a-BadgeList--xxlarge'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4478)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151008734768780.4478)
,p_theme_id=>3
,p_name=>'2COLUMNNGRID'
,p_display_name=>'2 Columnn Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4478)
,p_css_classes=>'a-BadgeList--cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4478)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151259777768780.4478)
,p_theme_id=>3
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4478)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--3cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4478)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151408063768780.4478)
,p_theme_id=>3
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4478)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--4cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4478)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151643103768780.4478)
,p_theme_id=>3
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4478)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--5cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4478)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151861194768780.4478)
,p_theme_id=>3
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4478)
,p_css_classes=>'a-BadgeList--flex'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4478)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896798730495581814.4478)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4478)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(808380142596819918.4478)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896798963380581814.4478)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4478)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(808380828683819918.4478)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799089194581814.4478)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4478)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4478)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799349986581814.4478)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4478)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4478)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799577541581814.4478)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4478)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4478)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799637215581814.4478)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4478)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799807498581814.4478)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4478)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_imp.id(808383088145819924.4478)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022191342234716.4478)
,p_theme_id=>3
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4478)
,p_css_classes=>'a-MediaList--cols a-MediaList--2cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4478)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022392217234716.4478)
,p_theme_id=>3
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4478)
,p_css_classes=>'a-MediaList--cols a-MediaList--3cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4478)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022597980234716.4478)
,p_theme_id=>3
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4478)
,p_css_classes=>'a-MediaList--cols a-MediaList--4cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4478)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022867300234717.4478)
,p_theme_id=>3
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4478)
,p_css_classes=>'a-MediaList--cols a-MediaList--5cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4478)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023065592234717.4478)
,p_theme_id=>3
,p_name=>'SPANHORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4478)
,p_css_classes=>'a-MediaList--horizontal'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4478)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023131122234717.4478)
,p_theme_id=>3
,p_name=>'HIDEBADGE'
,p_display_name=>'Hide Badge'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4478)
,p_css_classes=>'a-MediaList--noBadge'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023191297234717.4478)
,p_theme_id=>3
,p_name=>'HIDEDESCRIPTION'
,p_display_name=>'Hide Description'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4478)
,p_css_classes=>'a-MediaList--noDesc'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023315038234717.4478)
,p_theme_id=>3
,p_name=>'HIDETITLE'
,p_display_name=>'Hide Title'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4478)
,p_css_classes=>'a-MediaList--noTitle'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023432264234717.4478)
,p_theme_id=>3
,p_name=>'HIDEICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4478)
,p_css_classes=>'a-MediaList--noIcons'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023494059234717.4478)
,p_theme_id=>3
,p_name=>'SLIMLIST'
,p_display_name=>'Slim List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4478)
,p_css_classes=>'a-MediaList--slim'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378094918666945.4478)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4478)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(808380142596819918.4478)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378225037666947.4478)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4478)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(808380828683819918.4478)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378370589666947.4478)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4478)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4478)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378467813666947.4478)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4478)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378526097666947.4478)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4478)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4478)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378615102666947.4478)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4478)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_imp.id(808383088145819924.4478)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378735377666947.4478)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4478)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4478)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1036071796325339624.4478)
,p_theme_id=>3
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(514332292784430987.4478)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1036071972285339624.4478)
,p_theme_id=>3
,p_name=>'ADD_SLIDE_ANIMATION'
,p_display_name=>'Add Slide Animation'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(514332292784430987.4478)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1050367122398973653.4478)
,p_theme_id=>3
,p_name=>'SLIMPROGRESSLIST'
,p_display_name=>'Slim Progress List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(865273508717512144.4478)
,p_css_classes=>'a-WizardSteps--slim'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1309233880682664517.4478)
,p_theme_id=>3
,p_name=>'LEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_button_template_id=>wwv_flow_imp.id(868252865986181054.4478)
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(856117908453058029.4478)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1351338307429029043.4478)
,p_theme_id=>3
,p_name=>'USED_IN_DIALOG'
,p_display_name=>'Used in Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1274355059486017828.4478)
,p_css_classes=>'a-ProcessingRegion--dialog'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333722717814196.4478)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4478)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333859287814196.4478)
,p_theme_id=>3
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4478)
,p_css_classes=>'a-LinksList--showBadge'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333887728814196.4478)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4478)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334039640814196.4478)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4478)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334247146814196.4478)
,p_theme_id=>3
,p_name=>'FORTOPLEVELONLY'
,p_display_name=>'For top level only'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4478)
,p_css_classes=>'a-LinksList--showTopIcons'
,p_group_id=>wwv_flow_imp.id(806925000765340952.4478)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334455135814196.4478)
,p_theme_id=>3
,p_name=>'FORALLITEMS'
,p_display_name=>'For all items'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4478)
,p_css_classes=>'a-LinksList--showIcons'
,p_group_id=>wwv_flow_imp.id(806925000765340952.4478)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491342397110118.4478)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4478)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491390428110118.4478)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4478)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491480011110118.4478)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4478)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664488722406040473.4478)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4478)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4478)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664488933681040473.4478)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4478)
,p_css_classes=>'a-Region--accessibleHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4478)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489165994040473.4478)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4478)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4478)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489304869040473.4478)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4478)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4478)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489519844040473.4478)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4478)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_imp.id(860570508910721307.4478)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489753255040473.4478)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4478)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4478)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489941797040473.4478)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4478)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4478)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490153471040473.4478)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4478)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4478)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490336091040473.4478)
,p_theme_id=>3
,p_name=>'DEFAULTPADDING'
,p_display_name=>'Default Padding'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4478)
,p_css_classes=>'a-Region--paddedBody'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4478)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490377667040473.4478)
,p_theme_id=>3
,p_name=>'REMOVE_TOP_BORDER'
,p_display_name=>'Remove Top Border'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4478)
,p_css_classes=>'a-Region--noTopBorder'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490659850040473.4478)
,p_theme_id=>3
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4478)
,p_css_classes=>'a-Region--simple'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4478)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664501980442158869.4478)
,p_theme_id=>3
,p_name=>'RESPONSIVEICONCOLUMNS'
,p_display_name=>'Responsive Icon Columns'
,p_display_sequence=>2
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4478)
,p_css_classes=>'a-IRR-region--responsiveIconView'
,p_template_types=>'REGION'
,p_help_text=>'Automatically increases number of icon columns to show based on screen resolution.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664502160891158869.4478)
,p_theme_id=>3
,p_name=>'ICONLABELSRIGHT'
,p_display_name=>'Icon Labels on Right'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4478)
,p_css_classes=>'a-IRR-region--iconLabelsRight'
,p_template_types=>'REGION'
,p_help_text=>'Shows labels in Icon View to the right of the icon.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664502181188158869.4478)
,p_theme_id=>3
,p_name=>'REMOVEOUTERBORDERS'
,p_display_name=>'Remove Outer Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4478)
,p_css_classes=>'a-IRR-region--noOuterBorders'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508367504174332.4478)
,p_theme_id=>3
,p_name=>'FLUSHREGION'
,p_display_name=>'Flush Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4478)
,p_css_classes=>'a-Region--flush'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508426350174332.4478)
,p_theme_id=>3
,p_name=>'STACKEDREGION'
,p_display_name=>'Stacked Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4478)
,p_css_classes=>'a-Region--stacked'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508588305174332.4478)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4478)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4478)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508810521174332.4478)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4478)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4478)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509005841174332.4478)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4478)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_imp.id(860570508910721307.4478)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509270186174332.4478)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4478)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4478)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509448573174333.4478)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4478)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4478)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509659839174333.4478)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4478)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4478)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509822387174334.4478)
,p_theme_id=>3
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>.1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4478)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4478)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664510028962174334.4478)
,p_theme_id=>3
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4478)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4478)
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
 p_id=>wwv_flow_imp.id(140469183533751769)
,p_name=>'4150_COLUMN_NUMBER'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F4 %0')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140453781340751764)
,p_name=>'ACCESS_CONTROL_ADMIN'
,p_message_language=>'ko'
,p_message_text=>unistr('\AD00\B9AC\C790')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140453658247751764)
,p_name=>'ACCESS_CONTROL_USERNAME'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AC\C6A9\C790 \C774\B984')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140516342430751783)
,p_name=>'ACCESS_DENIED_SIMPLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C561\C138\C2A4\AC00 \AC70\BD80\B428')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140473221198751770)
,p_name=>'ACCOUNT_HAS_BEEN_CREATED'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \ACC4\C815\C774 \C0DD\C131\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140456418978751765)
,p_name=>'ACCOUNT_LOCKED'
,p_message_language=>'ko'
,p_message_text=>unistr('\ACC4\C815\C774 \C7A0\ACBC\C2B5\B2C8\B2E4.')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140440962245751760)
,p_name=>'AM_PM'
,p_message_language=>'ko'
,p_message_text=>'AM / PM'
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140423779432751755)
,p_name=>'APEX.ACTIONS.ACTION_LINK'
,p_message_language=>'ko'
,p_message_text=>unistr('\C791\C5C5 \B9C1\D06C')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140423618027751755)
,p_name=>'APEX.ACTIONS.DIALOG_LINK'
,p_message_language=>'ko'
,p_message_text=>unistr('\B300\D654\C0C1\C790 \B9C1\D06C')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140588071580751804)
,p_name=>'APEX.ACTIONS.TOGGLE'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \D1A0\AE00')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140595866502751806)
,p_name=>'APEX.ACTIVE_STATE'
,p_message_language=>'ko'
,p_message_text=>unistr('(\D65C\C131)')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140400685918751748)
,p_name=>'APEX.AI.CHAT_CLEARED'
,p_message_language=>'ko'
,p_message_text=>unistr('\CC44\D305 \C9C0\C6CC\C9D0')
,p_is_js_message=>true
,p_version_scn=>2705114
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140400561146751748)
,p_name=>'APEX.AI.CLEAR_CHAT'
,p_message_language=>'ko'
,p_message_text=>unistr('\CC44\D305 \C9C0\C6B0\AE30')
,p_is_js_message=>true
,p_version_scn=>2705114
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140397187627751747)
,p_name=>'APEX.AI.CONSENT_ACCEPT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C218\B77D')
,p_is_js_message=>true
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140397201323751747)
,p_name=>'APEX.AI.CONSENT_DENY'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC70\BD80')
,p_is_js_message=>true
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140396903184751747)
,p_name=>'APEX.AI.CONVERSATION_HISTORY'
,p_message_language=>'ko'
,p_message_text=>unistr('\B300\D654 \B0B4\C5ED')
,p_is_js_message=>true
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140400345999751748)
,p_name=>'APEX.AI.COPIED'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF5\C0AC\B428')
,p_is_js_message=>true
,p_version_scn=>2705114
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140400415570751748)
,p_name=>'APEX.AI.COPIED_TO_CLIPBOARD'
,p_message_language=>'ko'
,p_message_text=>unistr('\D074\B9BD\BCF4\B4DC\C5D0 \BCF5\C0AC\B428')
,p_is_js_message=>true
,p_version_scn=>2705114
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140400147273751748)
,p_name=>'APEX.AI.COPY'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF5\C0AC')
,p_is_js_message=>true
,p_version_scn=>2705114
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140400274693751748)
,p_name=>'APEX.AI.COPY_TO_CLIPBOARD'
,p_message_language=>'ko'
,p_message_text=>unistr('\D074\B9BD\BCF4\B4DC\C5D0 \BCF5\C0AC')
,p_is_js_message=>true
,p_version_scn=>2705114
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140397656465751748)
,p_name=>'APEX.AI.DIALOG_TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\B3C4\C6B0\BBF8')
,p_is_js_message=>true
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140398085824751748)
,p_name=>'APEX.AI.DISABLED'
,p_message_language=>'ko'
,p_message_text=>unistr('AI\AC00 \C791\C5C5\C601\C5ED \B610\B294 \C778\C2A4\D134\C2A4 \B808\BCA8\C5D0\C11C \C0AC\C6A9 \C548\D568\C73C\B85C \C124\C815\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140437300545751759)
,p_name=>'APEX.AI.GET_SERVER_ID_OR_STATIC_ID'
,p_message_language=>'ko'
,p_message_text=>unistr('\C8FC\C5B4\C9C4 ID \B610\B294 \C815\C801 ID\C758 \C0DD\C131\D615 AI \C11C\BE44\C2A4\B97C \CC3E\C744 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140436050834751759)
,p_name=>'APEX.AI.HTTP_4013_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('URL %0\C5D0 \B300\D55C \C778\C99D \C624\B958 \B610\B294 \AE08\C9C0\B41C \C561\C138\C2A4(HTTP-%1). \C0DD\C131\D615 AI \C11C\BE44\C2A4 %2\C758 \AD6C\C131\C744 \D655\C778\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140415808861751753)
,p_name=>'APEX.AI.HTTP_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C758 \C0DD\C131\D615 AI \C11C\BE44\C2A4\C5D0 \B300\D55C HTTP \C694\CCAD\C744 \C2E4\D328\D588\C2B5\B2C8\B2E4. HTTP-%1: %2')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140440296664751760)
,p_name=>'APEX.AI.HTTP_FRIENDLY_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('%1 \BAA8\B4DC\B85C %0 \D50C\B7EC\ADF8\C778\C5D0 \B300\D55C \C0DD\C131\D615 AI \C11C\BE44\C2A4\C758 HTTP \C694\CCAD \C2DC \C624\B958 \BC1C\C0DD. \C0DD\C131\D615 AI \C11C\BE44\C2A4\C758 \AD6C\C131\C744 \D655\C778\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140403088138751749)
,p_name=>'APEX.AI.MAIN_QUICK_ACTIONS_ARIA_LABEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C608')
,p_is_js_message=>true
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140401486471751749)
,p_name=>'APEX.AI.NAME_ASSISTANT'
,p_message_language=>'ko'
,p_message_text=>unistr('\B3C4\C6B0\BBF8')
,p_is_js_message=>true
,p_version_scn=>2705114
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140402878673751749)
,p_name=>'APEX.AI.NAME_COMMA_MESSAGE'
,p_message_language=>'ko'
,p_message_text=>'%0,%1'
,p_is_js_message=>true
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140401321241751749)
,p_name=>'APEX.AI.NAME_USER'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AC\C6A9\C790')
,p_is_js_message=>true
,p_version_scn=>2705114
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140432025369751758)
,p_name=>'APEX.AI.OCI_CHAT_NOT_SUPPORTED'
,p_message_language=>'ko'
,p_message_text=>unistr('OCI \C0DD\C131\D615 AI\B294 \D604\C7AC \C5EC\B7EC \BA54\C2DC\C9C0\B85C \AD6C\C131\B41C \CC44\D305 \ACBD\D5D8\C744 \C9C0\C6D0\D558\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140411979468751752)
,p_name=>'APEX.AI.PROMPT_ENRICHMENT_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('%1 \C560\D50C\B9AC\CF00\C774\C158\C5D0 \B300\D55C %0 \D504\B86C\D504\D2B8\B97C \CC98\B9AC\D558\B294 \C911 \C624\B958\AC00 \BC1C\C0DD\D588\C2B5\B2C8\B2E4. \C774 \C778\C2A4\D134\C2A4\C5D0\C11C \C571 \C791\C131\AE30\AC00 \C0AC\C6A9 \AC00\B2A5\D55C\C9C0 \D655\C778\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140417062794751753)
,p_name=>'APEX.AI.RESPONSE_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('AI \C11C\BE44\C2A4 %0\C758 \C751\B2F5\C744 \CC98\B9AC\D560 \C218 \C5C6\C2B5\B2C8\B2E4. \C751\B2F5 %1')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140423253762751755)
,p_name=>'APEX.AI.SEND_MESSAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\BA54\C2DC\C9C0 \BCF4\B0B4\AE30')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140411598094751752)
,p_name=>'APEX.AI.SERVICE_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\BC31\C5D4\B4DC AI \C11C\BE44\C2A4 %0\C5D0\C11C \C624\B958 \BC1C\C0DD')
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140397331494751748)
,p_name=>'APEX.AI.TEXTAREA_LABEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\BA54\C2DC\C9C0')
,p_is_js_message=>true
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140397455361751748)
,p_name=>'APEX.AI.TEXTAREA_PLACEHOLDER'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5EC\AE30\C5D0 \BA54\C2DC\C9C0 \C785\B825')
,p_is_js_message=>true
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140400771864751749)
,p_name=>'APEX.AI.USER_AVATAR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AC\C6A9\C790 \C544\BC14\D0C0')
,p_is_js_message=>true
,p_version_scn=>2705114
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140400814705751749)
,p_name=>'APEX.AI.USE_THIS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774 \D56D\BAA9 \C0AC\C6A9')
,p_is_js_message=>true
,p_version_scn=>2705114
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140397570705751748)
,p_name=>'APEX.AI.WARN_UNSENT_MESSAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\B0B4\C9C0 \C54A\C740 \BA54\C2DC\C9C0\AC00 \C788\C2B5\B2C8\B2E4. \ACC4\C18D\D558\ACA0\C2B5\B2C8\AE4C?')
,p_is_js_message=>true
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140566515307751798)
,p_name=>'APEX.AJAX_SERVER_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('Ajax \D638\CD9C\C774 %1\C5D0 \B300\D574 \C11C\BC84 \C624\B958 %0\C744(\B97C) \BC18\D658\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140493674613751776)
,p_name=>'APEX.APPLICATION.ALIAS.NON_UNIQUE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C560\D50C\B9AC\CF00\C774\C158 \BCC4\CE6D "%0"\C744(\B97C) \ACE0\C720 \C560\D50C\B9AC\CF00\C774\C158 ID\B85C \BCC0\D658\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140482407739751773)
,p_name=>'APEX.APPLICATION.ALIAS.UNHANDLED_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('ERR-1816 \C560\D50C\B9AC\CF00\C774\C158 \BCC4\CE6D p_flow_alias_or_id(%0)\B97C \BCC0\D658\D558\B294 \C911 \C608\C0C1\CE58 \C54A\C740 \C624\B958\AC00 \BC1C\C0DD\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140579895653751802)
,p_name=>'APEX.APPLICATION.CHECKSUM.DESCRIPTION'
,p_message_language=>'ko'
,p_message_text=>unistr('\C560\D50C\B9AC\CF00\C774\C158 \CCB4\D06C\C12C\C740 \C791\C5C5\C601\C5ED\C5D0 \B3D9\C77C\D55C \C560\D50C\B9AC\CF00\C774\C158\C774 \BC30\CE58\B418\C5C8\B294\C9C0 \C5EC\BD80\B97C \C27D\AC8C \D655\C778\D560 \C218 \C788\B294 \BC29\BC95\C744 \C81C\ACF5\D569\B2C8\B2E4. \C774 \CCB4\D06C\C12C\C744 \BE44\AD50\D558\C5EC \C77C\CE58\D558\B294 \D56D\BAA9\C774 \C788\B294\C9C0 \D655\C778\D560 \C218 \C788\C2B5\B2C8\B2E4. ')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140466421173751768)
,p_name=>'APEX.AUTHENTICATION.AUTH_FUNC.UNHANDLED_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C778\C99D \D568\C218\B97C \CC98\B9AC\D558\B294 \C911 \C624\B958\AC00 \BC1C\C0DD\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140448489990751763)
,p_name=>'APEX.AUTHENTICATION.AUTH_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C778\C99D \D568\C218\B97C \CC98\B9AC\D558\B294 \C911 \C624\B958\AC00 \BC1C\C0DD\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140620397700751813)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.HOST_PREFIX_MISMATCH'
,p_message_language=>'ko'
,p_message_text=>unistr('Oracle Cloud ID \AD00\B9AC\C5D0\C11C \BC18\D658\B41C \D14C\B10C\D2B8 \C774\B984 %0\C5D0 %1 \B3C4\BA54\C778\C5D0 \B300\D55C \AD8C\D55C\C774 \BD80\C5EC\B418\C9C0 \C54A\C558\C2B5\B2C8\B2E4.<br/><a href="&LOGOUT_URL.">\B2E4\C2DC \B85C\ADF8\C778</a>\D558\ACE0 \C778\C99D\B41C \D14C\B10C\D2B8 \C774\B984\C744 \C9C0\C815\D558\AC70\B098 URL\C744 \BCC0\ACBD\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140444593078751762)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.USER_IS_NOT_DEVELOPER'
,p_message_language=>'ko'
,p_message_text=>unistr('"%0" \ACC4\C815\C5D0 "%1" \C791\C5C5\C601\C5ED\C5D0 \D544\C694\D55C \AC1C\BC1C \AD8C\D55C(DB_DEVELOPER \B610\B294 DB_ADMINISTRATOR)\C774 \C5C6\C2B5\B2C8\B2E4.<br/> \AD8C\D55C\C774 \C81C\ACF5\B41C \D6C4\C5D0 <a href="&LOGOUT_URL.">\B2E4\C2DC \B85C\ADF8\C778</a>\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140441145042751760)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.WRONG_GROUP_NAME'
,p_message_language=>'ko'
,p_message_text=>unistr('Oracle Cloud ID \AD00\B9AC\C5D0\C11C \BC18\D658\B41C \D14C\B10C\D2B8 \C774\B984\C5D0 \D604\C7AC \C791\C5C5\C601\C5ED\C5D0 \B300\D574 \AD8C\D55C\C774 \BD80\C5EC\B418\C9C0 \C54A\C558\C2B5\B2C8\B2E4.<br/><a href="&LOGOUT_URL.">\B2E4\C2DC \B85C\ADF8\C778</a>\D558\ACE0 \C778\C99D\B41C \D14C\B10C\D2B8 \C774\B984\C744 \C9C0\C815\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140444638140751762)
,p_name=>'APEX.AUTHENTICATION.HOST_PREFIX_MISMATCH'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\C548\C0C1\C758 \C774\C720\B85C \C774 \C791\C5C5\C601\C5ED\C758 \C560\D50C\B9AC\CF00\C774\C158\C744 URL\C758 \B3C4\BA54\C778\C744 \D1B5\D574 \C2E4\D589\D558\B294 \AC83\C740 \D5C8\C6A9\B418\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140466149471751768)
,p_name=>'APEX.AUTHENTICATION.LDAP.DBMS_LDAP.ASK_FOR_INSTALLATION'
,p_message_language=>'ko'
,p_message_text=>unistr('DBA\C5D0\AC8C $OH/rdbms/admin/catldap.sql \C2E4\D589\C744 \C694\CCAD\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140466098515751768)
,p_name=>'APEX.AUTHENTICATION.LDAP.DBMS_LDAP.MISSING'
,p_message_language=>'ko'
,p_message_text=>unistr('SYS.DBMS_LDAP \D328\D0A4\C9C0\AC00 \C874\C7AC\D558\C9C0 \C54A\AC70\B098 \BD80\C801\D569\D569\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140465932422751768)
,p_name=>'APEX.AUTHENTICATION.LDAP.EDIT_USER_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('LDAP \C0AC\C6A9\C790 \D3B8\C9D1 \D568\C218\B97C \CC98\B9AC\D558\B294 \C911 \C624\B958\AC00 \BC1C\C0DD\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140466236056751768)
,p_name=>'APEX.AUTHENTICATION.LDAP.UNHANDLED_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('LDAP \C778\C99D\C744 \CC98\B9AC\D558\B294 \C911 \C624\B958\AC00 \BC1C\C0DD\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140467024781751768)
,p_name=>'APEX.AUTHENTICATION.LOGIN.ILLEGAL_PAGE_ARG'
,p_message_language=>'ko'
,p_message_text=>unistr('login_page \D504\B85C\C2DC\C800\C5D0 \B300\D55C p_flow_page \C778\C218\C5D0 \C624\B958\AC00 \BC1C\C0DD\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140466680643751768)
,p_name=>'APEX.AUTHENTICATION.LOGIN.INVALID_ARG'
,p_message_language=>'ko'
,p_message_text=>unistr('wwv_flow_custom_auth_std.login--p_flow_page:%0 p_session_id:%1\C758 p_session\C774 \BD80\C801\D569\D569\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140517950694751783)
,p_name=>'APEX.AUTHENTICATION.LOGIN.MALFORMED_ARGS'
,p_message_language=>'ko'
,p_message_text=>unistr('wwv_flow_custom_auth_std.login--p_flow_page:p_session_id:p_entry_point:%0:%1:%2\C5D0 \B300\D55C \C778\C218 \D615\C2DD\C774 \C798\BABB\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140466743077751768)
,p_name=>'APEX.AUTHENTICATION.LOGIN.NULL_USER'
,p_message_language=>'ko'
,p_message_text=>unistr('\B85C\ADF8\C778 \D504\B85C\C2DC\C800\C5D0 \B110 \C0AC\C6A9\C790 \C774\B984\C774 \C804\B2EC\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140453547388751764)
,p_name=>'APEX.AUTHENTICATION.LOGIN_THROTTLE.COUNTER'
,p_message_language=>'ko'
,p_message_text=>unistr('<span id="apex_login_throttle_sec">%0</span>\CD08 \AE30\B2E4\B838\B2E4\AC00 \B2E4\C2DC \C0AC\C778\C778\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140454861263751765)
,p_name=>'APEX.AUTHENTICATION.LOGIN_THROTTLE.ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\B85C\ADF8\C778 \C2DC\B3C4\AC00 \CC28\B2E8\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140515654550751783)
,p_name=>'APEX.AUTHENTICATION.NOT_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('"%0" \C778\C99D\C744 \CC3E\C744 \C218 \C5C6\C74C')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140455324108751765)
,p_name=>'APEX.AUTHENTICATION.NO_SECURITY_GROUP_ID'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\C548 \ADF8\B8F9 ID\AC00 \B110\C785\B2C8\B2E4.')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140466532513751768)
,p_name=>'APEX.AUTHENTICATION.POST_AUTH_PROC.UNHANDLED_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AC\D6C4 \C778\C99D \D504\B85C\C138\C2A4\B97C \C2E4\D589\D558\B294 \C911 \C624\B958\AC00 \BC1C\C0DD\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140466390348751768)
,p_name=>'APEX.AUTHENTICATION.PRE_AUTH_PROC.UNHANDLED_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AC\C804 \C778\C99D \D504\B85C\C138\C2A4\B97C \CC98\B9AC\D558\B294 \C911 \C624\B958\AC00 \BC1C\C0DD\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140468067492751768)
,p_name=>'APEX.AUTHENTICATION.RESET_PASSWORD.INSTRUCTIONS'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\BE44\BC00\BC88\D638 \C7AC\C124\C815 \C694\CCAD\C744 \C2DC\C791\D55C \B3D9\C77C \BE0C\B77C\C6B0\C800\C5D0\C11C URL\C744 \C5EC\C2ED\C2DC\C624. \BE44\BC00\BC88\D638 \C7AC\C124\C815 URL\C744 \B204\B974\ACE0'),
unistr('\B85C\ADF8\C778 \D398\C774\C9C0\B85C \C7AC\C9C0\C815\B420 \ACBD\C6B0 \BE44\BC00\BC88\D638 \C7AC\C124\C815\C744 \B2E4\C2DC \C2DC\C791\D558\ACE0'),
unistr('\BE0C\B77C\C6B0\C800\B97C \C5F4\C5B4 \B450\C2ED\C2DC\C624.')))
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140617858116751813)
,p_name=>'APEX.AUTHENTICATION.RESET_PASSWORD_URL'
,p_message_language=>'ko'
,p_message_text=>unistr('\BE44\BC00\BC88\D638 \C7AC\C124\C815 URL')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140444847992751762)
,p_name=>'APEX.AUTHENTICATION.RM_GROUP_NOT_GRANTED'
,p_message_language=>'ko'
,p_message_text=>unistr('\B9AC\C18C\C2A4 \AD00\B9AC\C790 \C18C\BE44\C790 \ADF8\B8F9 %0\C5D0\AC8C %1\C774(\AC00) \BD80\C5EC\B418\C9C0 \C54A\C558\C2B5\B2C8\B2E4.')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140444905240751762)
,p_name=>'APEX.AUTHENTICATION.RM_INFO_TO_GRANT'
,p_message_language=>'ko'
,p_message_text=>unistr('\B204\B77D\B41C \AD8C\D55C\C744 \BD80\C5EC\D558\B824\BA74 DBMS_RESOURCE_MANAGER_PRIVS.GRANT_SWITCH_CONSUMER_GROUP\C744 \C0AC\C6A9\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140479504698751772)
,p_name=>'APEX.AUTHENTICATION.SESSION_SENTRY_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C138\C158 \AC10\C2DC \D568\C218\B97C \CC98\B9AC\D558\B294 \C911 \C624\B958\AC00 \BC1C\C0DD\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140479699681751772)
,p_name=>'APEX.AUTHENTICATION.SESSION_VERIFY_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C138\C158 \D655\C778 \D568\C218\B97C \CC98\B9AC\D558\B294 \C911 \C624\B958\AC00 \BC1C\C0DD\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140479811909751772)
,p_name=>'APEX.AUTHENTICATION.SSO.ASK_FOR_INSTALLATION'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \AD00\B9AC\C790\C5D0\AC8C Oracle Application Server Single Sign-On \C5D4\C9C4 \AD6C\C131\C744 \C694\CCAD\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140490273871751775)
,p_name=>'APEX.AUTHENTICATION.SSO.BAD_URLC'
,p_message_language=>'ko'
,p_message_text=>unistr('%1 \D1A0\D070\C758 \C798\BABB\B41C %0\C774(\AC00) SSO\C5D0 \C758\D574 \BC18\D658\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140466916046751768)
,p_name=>'APEX.AUTHENTICATION.SSO.FIX_PARTNER_APP'
,p_message_language=>'ko'
,p_message_text=>unistr('\C778\C99D \CCB4\ACC4\B97C \D3B8\C9D1\D558\ACE0 \C560\D50C\B9AC\CF00\C774\C158 \C774\B984\C744 \CD94\AC00\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140489906769751775)
,p_name=>'APEX.AUTHENTICATION.SSO.ILLEGAL_CALLER'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \D504\B85C\C2DC\C800\C758 \C798\BABB\B41C \D638\CD9C\C790:')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140490120537751775)
,p_name=>'APEX.AUTHENTICATION.SSO.INVALID_APP_SESSION'
,p_message_language=>'ko'
,p_message_text=>unistr('URLC \D1A0\D070\C5D0 \BD80\C801\D569\D55C \C560\D50C\B9AC\CF00\C774\C158 \C138\C158\C774 \C788\C74C: %0')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140489764338751775)
,p_name=>'APEX.AUTHENTICATION.SSO.MISSING_APP_REGISTRATION'
,p_message_language=>'ko'
,p_message_text=>unistr('portal_sso_redirect\C5D0\C11C \C624\B958 \BC1C\C0DD: \C560\D50C\B9AC\CF00\C774\C158 \B4F1\B85D \C815\BCF4 \B204\B77D: %0')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140479779053751772)
,p_name=>'APEX.AUTHENTICATION.SSO.PACKAGE_MISSING'
,p_message_language=>'ko'
,p_message_text=>unistr('WWSEC_SSO_ENABLER_PRIVATE \D328\D0A4\C9C0\AC00 \C874\C7AC\D558\C9C0 \C54A\AC70\B098 \BD80\C801\D569\D569\B2C8\B2E4.')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140466864728751768)
,p_name=>'APEX.AUTHENTICATION.SSO.PARTNER_APP_IS_NULL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C778\C99D \CCB4\ACC4\C5D0\C11C \B4F1\B85D\B41C \D611\B825 \C560\D50C\B9AC\CF00\C774\C158 \C774\B984\C744 \CC3E\C744 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140489850250751775)
,p_name=>'APEX.AUTHENTICATION.SSO.REGISTER_APP'
,p_message_language=>'ko'
,p_message_text=>unistr('\C124\CE58 \C124\BA85\C11C\C5D0 \C124\BA85\B41C \B300\B85C \C774 \C560\D50C\B9AC\CF00\C774\C158\C744 \B4F1\B85D\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140479922216751772)
,p_name=>'APEX.AUTHENTICATION.SSO.UNHANDLED_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('SSO \C778\C99D\C744 \CC98\B9AC\D558\B294 \C911 \C624\B958\AC00 \BC1C\C0DD\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140593228284751805)
,p_name=>'APEX.AUTHENTICATION.UNAUTHORIZED_URL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C778\C99D\B418\C9C0 \C54A\C740 URL: %0')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140479391229751772)
,p_name=>'APEX.AUTHENTICATION.UNHANDLED_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C778\C99D\C744 \CC98\B9AC\D558\B294 \C911 \C624\B958\AC00 \BC1C\C0DD\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140444742551751762)
,p_name=>'APEX.AUTHENTICATION.WORKSPACE_NOT_ASSIGNED'
,p_message_language=>'ko'
,p_message_text=>unistr('"%0" \C791\C5C5\C601\C5ED\C774 \BE44\D65C\C131 \C0C1\D0DC\C785\B2C8\B2E4. \AD00\B9AC\C790\C5D0\AC8C \BB38\C758\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140445467868751762)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED'
,p_message_language=>'ko'
,p_message_text=>'%0'
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140454581982751764)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED.APPLICATION'
,p_message_language=>'ko'
,p_message_text=>unistr('\C560\D50C\B9AC\CF00\C774\C158 \BCF4\C548 \AC80\C0AC\C5D0 \C758\D574 \C561\C138\C2A4\AC00 \AC70\BD80\B428')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140454660186751764)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED.PAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D398\C774\C9C0 \BCF4\C548 \AC80\C0AC\C5D0 \C758\D574 \C561\C138\C2A4\AC00 \AC70\BD80\B428')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140454748751751764)
,p_name=>'APEX.AUTHORIZATION.UNHANDLED_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\AD8C\D55C \BD80\C5EC\B97C \CC98\B9AC\D558\B294 \C911 \C624\B958\AC00 \BC1C\C0DD\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140523817476751785)
,p_name=>'APEX.BUILT_WITH_LOVE_USING_APEX'
,p_message_language=>'ko'
,p_message_text=>unistr('%1\C744(\B97C) \C0AC\C6A9\D558\C5EC %0(\C73C)\B85C \AD6C\CD95\B428')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140523973354751785)
,p_name=>'APEX.BUILT_WITH_LOVE_USING_APEX.ACCESSIBLE.LOVE'
,p_message_language=>'ko'
,p_message_text=>'love'
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140583797902751803)
,p_name=>'APEX.CALENDAR.EVENT_DESCRIPTION'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\BCA4\D2B8 \C124\BA85')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140583558047751803)
,p_name=>'APEX.CALENDAR.EVENT_END'
,p_message_language=>'ko'
,p_message_text=>unistr('\C885\B8CC \B0A0\C9DC')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140583886888751803)
,p_name=>'APEX.CALENDAR.EVENT_ID'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\BCA4\D2B8 ID')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140583468365751803)
,p_name=>'APEX.CALENDAR.EVENT_START'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2DC\C791 \B0A0\C9DC')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140583626392751803)
,p_name=>'APEX.CALENDAR.EVENT_TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\BCA4\D2B8 \C81C\BAA9')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140426231074751756)
,p_name=>'APEX.CARD'
,p_message_language=>'ko'
,p_message_text=>unistr('\CE74\B4DC')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140426440745751756)
,p_name=>'APEX.CARD.CARD_ACTION'
,p_message_language=>'ko'
,p_message_text=>unistr('\CE74\B4DC \C791\C5C5')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140467144275751768)
,p_name=>'APEX.CHECKBOX.VISUALLY_HIDDEN_CHECKBOX'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2DC\AC01\C801\C73C\B85C \C228\ACA8\C9C4 \CCB4\D06C\BC15\C2A4')
,p_is_js_message=>true
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140469081686751769)
,p_name=>'APEX.CHECKSUM.CONTENT_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\CCB4\D06C\C12C \CF58\D150\CE20 \C624\B958')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140468935939751769)
,p_name=>'APEX.CHECKSUM.FORMAT_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\CCB4\D06C\C12C \D615\C2DD \C624\B958')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140538857545751789)
,p_name=>'APEX.CLIPBOARD.COPIED'
,p_message_language=>'ko'
,p_message_text=>unistr('\D074\B9BD\BCF4\B4DC\C5D0 \BCF5\C0AC\B428.')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140538395738751789)
,p_name=>'APEX.CLIPBOARD.NOTSUP'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774 \BE0C\B77C\C6B0\C800\B294 \B2E8\CD94 \B610\B294 \BA54\B274\B97C \D1B5\D55C \BCF5\C0AC\B97C \C9C0\C6D0\D558\C9C0 \C54A\C2B5\B2C8\B2E4. Ctrl+C \B610\B294 Command+C\B97C \C0AC\C6A9\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140524532812751785)
,p_name=>'APEX.CLOSE_NOTIFICATION'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2EB\AE30')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140402931156751749)
,p_name=>'APEX.CODE_EDITOR.MAXIMUM_LENGTH_EXCEEDED'
,p_message_language=>'ko'
,p_message_text=>unistr('\CF54\B4DC \D3B8\C9D1\AE30 \CF58\D150\CE20\AC00 \D56D\BAA9\C758 \CD5C\B300 \AE38\C774\B97C \CD08\ACFC\D569\B2C8\B2E4(\C2E4\C81C \AE38\C774: %0\C790, \D5C8\C6A9\B418\B294 \AE38\C774: %1\C790).')
,p_is_js_message=>true
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140583021484751802)
,p_name=>'APEX.COLOR_PICKER.CONTRAST'
,p_message_language=>'ko'
,p_message_text=>unistr('\B300\BE44')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140577505126751801)
,p_name=>'APEX.COLOR_PICKER.CURRENT'
,p_message_language=>'ko'
,p_message_text=>unistr('\D604\C7AC')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140577461660751801)
,p_name=>'APEX.COLOR_PICKER.INITIAL'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD08\AE30')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140581609702751802)
,p_name=>'APEX.COLOR_PICKER.INVALID_COLOR'
,p_message_language=>'ko'
,p_message_text=>unistr('#LABEL#\C740(\B294) \C801\D569\D55C \C0C9\C0C1\C774\C5B4\C57C \D569\B2C8\B2E4. \C608: %0')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140444089878751761)
,p_name=>'APEX.COLOR_PICKER.MORE_PRESET_COLORS'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD94\AC00 \C0C9\C0C1')
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140444172117751761)
,p_name=>'APEX.COLOR_PICKER.OPEN'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F4\B9B0 \C0C9\C0C1 \C120\D0DD\AE30')
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140401201554751749)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.ALPHA_SLIDER'
,p_message_language=>'ko'
,p_message_text=>unistr('\C54C\D30C \C2AC\B77C\C774\B354, \AC00\B85C \C2AC\B77C\C774\B354\C785\B2C8\B2E4. \D654\C0B4\D45C \D0A4\B97C \C0AC\C6A9\D558\C5EC \C774\B3D9\D560 \C218 \C788\C2B5\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705114
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140400981633751749)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.COLOR_SPECTRUM'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0C9\C0C1 \C2A4\D399\D2B8\B7FC, 4\BC29\D5A5 \C2AC\B77C\C774\B354\C785\B2C8\B2E4. \D654\C0B4\D45C \D0A4\B97C \C0AC\C6A9\D558\C5EC \C774\B3D9\D560 \C218 \C788\C2B5\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705114
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140401064493751749)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.HUE_SLIDER'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0C9\C870 \C2AC\B77C\C774\B354, \C138\B85C \C2AC\B77C\C774\B354\C785\B2C8\B2E4. \D654\C0B4\D45C \D0A4\B97C \C0AC\C6A9\D558\C5EC \C774\B3D9\D560 \C218 \C788\C2B5\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705114
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140577321705751801)
,p_name=>'APEX.COLOR_PICKER.TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0C9\C0C1 \C120\D0DD')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140577604383751801)
,p_name=>'APEX.COLOR_PICKER.TOGGLE_TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0C9\C0C1 \D615\C2DD \BCC0\ACBD')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140615560950751812)
,p_name=>'APEX.COMBOBOX.LIST_OF_VALUES'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC12 \BAA9\B85D')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140615673148751812)
,p_name=>'APEX.COMBOBOX.SHOW_ALL_VALUES'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C \BAA9\B85D \C5F4\AE30: %0')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140595955919751806)
,p_name=>'APEX.COMPLETED_STATE'
,p_message_language=>'ko'
,p_message_text=>unistr('(\C644\B8CC\B428)')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140484870275751773)
,p_name=>'APEX.CONTACT_ADMIN'
,p_message_language=>'ko'
,p_message_text=>unistr('\C560\D50C\B9AC\CF00\C774\C158 \AD00\B9AC\C790\C5D0\AC8C \BB38\C758\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140500389967751778)
,p_name=>'APEX.CONTACT_ADMIN.DEBUG'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\C560\D50C\B9AC\CF00\C774\C158 \AD00\B9AC\C790\C5D0\AC8C \C5F0\B77D\D558\C2ED\C2DC\C624.'),
unistr('\C774 \C7A5\C560\C5D0 \B300\D55C \C138\BD80\C815\BCF4\B294 \B514\BC84\ADF8 ID "%0"\C744(\B97C) \D1B5\D574 \C81C\ACF5\B429\B2C8\B2E4.')))
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140581953237751802)
,p_name=>'APEX.CORRECT_ERRORS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C800\C7A5\D558\AE30 \C804\C5D0 \C624\B958\B97C \C218\C815\D558\C2ED\C2DC\C624.')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140427288156751756)
,p_name=>'APEX.CS.ACTIVE_VALUE_CHIP'
,p_message_language=>'ko'
,p_message_text=>unistr('%0. \C0AD\C81C\D558\B824\BA74 \BC31\C2A4\D398\C774\C2A4\B97C \B204\B974\C2ED\C2DC\C624.')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140525453156751785)
,p_name=>'APEX.CS.MATCHES_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\AC1C \C77C\CE58\D56D\BAA9\C774 \BC1C\ACAC\B428')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140407342618751751)
,p_name=>'APEX.CS.MATCH_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('1\AC1C\C758 \C77C\CE58 \D56D\BAA9\C774 \BC1C\ACAC\B418\C5C8\C2B5\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140525341985751785)
,p_name=>'APEX.CS.NO_MATCHES'
,p_message_language=>'ko'
,p_message_text=>unistr('\C77C\CE58\D56D\BAA9\C744 \CC3E\C744 \C218 \C5C6\C74C')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140401786541751749)
,p_name=>'APEX.CS.OTHERS_GROUP'
,p_message_language=>'ko'
,p_message_text=>unistr('\AE30\D0C0')
,p_is_js_message=>true
,p_version_scn=>2705114
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140401677044751749)
,p_name=>'APEX.CS.SELECTED_VALUES_COUNTER'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \AC12\C774 \C120\D0DD\B428')
,p_is_js_message=>true
,p_version_scn=>2705114
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140596408802751806)
,p_name=>'APEX.CURRENT_PROGRESS'
,p_message_language=>'ko'
,p_message_text=>unistr('\D604\C7AC \C9C4\D589\B960')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140582387302751802)
,p_name=>'APEX.DATA.LOAD.FILE_DOES_NOT_EXIST'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \D56D\BAA9\C5D0 \C9C0\C815\B41C \D30C\C77C\C774 APEX_APPLICATION_TEMP_FILES\C5D0 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140570849137751799)
,p_name=>'APEX.DATA_HAS_CHANGED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AC\C6A9\C790\AC00 \C5C5\B370\C774\D2B8 \D504\B85C\C138\C2A4\B97C \C2DC\C791\D588\C73C\BBC0\B85C \B370\C774\D130\BCA0\C774\C2A4\C5D0 \C788\B294 \B370\C774\D130\C758 \D604\C7AC \BC84\C804\C774 \BCC0\ACBD\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140539976306751790)
,p_name=>'APEX.DATA_LOAD.DO_NOT_LOAD'
,p_message_language=>'ko'
,p_message_text=>unistr('\B85C\B4DC \C548\D568')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140586270378751803)
,p_name=>'APEX.DATA_LOAD.FAILED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C120\D589 \CC98\B9AC \C624\B958')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140586033633751803)
,p_name=>'APEX.DATA_LOAD.INSERT'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589 \C0BD\C785')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140599634634751807)
,p_name=>'APEX.DATA_LOAD.SEQUENCE_ACTION'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2DC\D000\C2A4: \C791\C5C5')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140586109031751803)
,p_name=>'APEX.DATA_LOAD.UPDATE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589 \C5C5\B370\C774\D2B8')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140414620189751753)
,p_name=>'APEX.DATEPICKER.ACTIONS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C791\C5C5')
,p_is_js_message=>true
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140442218075751761)
,p_name=>'APEX.DATEPICKER.AM_PM'
,p_message_language=>'ko'
,p_message_text=>'AM/PM'
,p_is_js_message=>true
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140428374543751757)
,p_name=>'APEX.DATEPICKER.BOUNDARY_ITEM_FORMAT_INVALID'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C740(\B294) \C801\D569\D55C \B0A0\C9DC\C5EC\C57C \D569\B2C8\B2E4. \C608: %1.')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140537501651751789)
,p_name=>'APEX.DATEPICKER.CLEAR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\C6B0\AE30')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140445756827751762)
,p_name=>'APEX.DATEPICKER.DONE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C644\B8CC')
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140456731424751765)
,p_name=>'APEX.DATEPICKER.FORMAT_NOT_SUPPORTED'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C758 \C77C\BD80\AC00 \D615\C2DD \B9C8\C2A4\D06C\C5D0\C11C \C9C0\C6D0\B418\C9C0 \C54A\C74C: %1')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140441959178751761)
,p_name=>'APEX.DATEPICKER.HOUR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2DC\AC04')
,p_is_js_message=>true
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140525865511751786)
,p_name=>'APEX.DATEPICKER.ICON_TEXT'
,p_message_language=>'ko'
,p_message_text=>unistr('\D31D\C5C5 \B2EC\B825: %0')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140441750366751761)
,p_name=>'APEX.DATEPICKER.ISO_WEEK'
,p_message_language=>'ko'
,p_message_text=>unistr('\C8FC')
,p_is_js_message=>true
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140441809894751761)
,p_name=>'APEX.DATEPICKER.ISO_WEEK_ABBR'
,p_message_language=>'ko'
,p_message_text=>'WK'
,p_is_js_message=>true
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140442160835751761)
,p_name=>'APEX.DATEPICKER.MINUTES'
,p_message_language=>'ko'
,p_message_text=>unistr('\BD84')
,p_is_js_message=>true
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140442359111751761)
,p_name=>'APEX.DATEPICKER.MONTH'
,p_message_language=>'ko'
,p_message_text=>unistr('\C6D4')
,p_is_js_message=>true
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140442794377751761)
,p_name=>'APEX.DATEPICKER.NEXT_MONTH'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C \C6D4')
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140412399580751752)
,p_name=>'APEX.DATEPICKER.POPUP'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C5D0 \B300\D55C \D31D\C5C5')
,p_is_js_message=>true
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140442674380751761)
,p_name=>'APEX.DATEPICKER.PREVIOUS_MONTH'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\C804 \C6D4')
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140535117524751788)
,p_name=>'APEX.DATEPICKER.READONLY_DATEPICKER'
,p_message_language=>'ko'
,p_message_text=>unistr('\C77D\AE30 \C804\C6A9 \B0A0\C9DC \C120\D0DD\AE30')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140443583677751761)
,p_name=>'APEX.DATEPICKER.SELECT_DATE'
,p_message_language=>'ko'
,p_message_text=>unistr('\B0A0\C9DC \C120\D0DD')
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140412465812751752)
,p_name=>'APEX.DATEPICKER.SELECT_DATE_AND_TIME'
,p_message_language=>'ko'
,p_message_text=>unistr('\B0A0\C9DC \BC0F \C2DC\AC04 \C120\D0DD')
,p_is_js_message=>true
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140409636066751751)
,p_name=>'APEX.DATEPICKER.SELECT_DAY'
,p_message_language=>'ko'
,p_message_text=>unistr('\C77C \C120\D0DD')
,p_is_js_message=>true
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140413069150751752)
,p_name=>'APEX.DATEPICKER.SELECT_MONTH_AND_YEAR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C6D4 \BC0F \C5F0\B3C4 \C120\D0DD')
,p_is_js_message=>true
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140409826160751751)
,p_name=>'APEX.DATEPICKER.SELECT_TIME'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2DC\AC04 \C120\D0DD')
,p_is_js_message=>true
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140410378684751751)
,p_name=>'APEX.DATEPICKER.TODAY'
,p_message_language=>'ko'
,p_message_text=>unistr('\C624\B298')
,p_is_js_message=>true
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140427970752751757)
,p_name=>'APEX.DATEPICKER.VALUE_INVALID'
,p_message_language=>'ko'
,p_message_text=>unistr('#LABEL#\C740(\B294) \C801\D569\D55C \B0A0\C9DC\C5EC\C57C \D569\B2C8\B2E4. \C608: %0.')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140427631429751756)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_BETWEEN'
,p_message_language=>'ko'
,p_message_text=>unistr('#LABEL#\C740(\B294) %0 - %1 \BC94\C704\C758 \AC12\C774\C5B4\C57C \D569\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140427793623751757)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_ON_OR_AFTER'
,p_message_language=>'ko'
,p_message_text=>unistr('#LABEL#\C740(\B294) %0 \B610\B294 \ADF8 \C774\D6C4\C5EC\C57C \D569\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140427828461751757)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_ON_OR_BEFORE'
,p_message_language=>'ko'
,p_message_text=>unistr('#LABEL#\C740(\B294) %0 \B610\B294 \ADF8 \C774\C804\C774\C5B4\C57C \D569\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140419212416751754)
,p_name=>'APEX.DATEPICKER.VISUALLY_HIDDEN_EDIT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2DC\AC01\C801\C73C\B85C \C228\ACA8\C9C4 \D3B8\C9D1')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140442521572751761)
,p_name=>'APEX.DATEPICKER.YEAR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F0\B3C4')
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140529547286751787)
,p_name=>'APEX.DATEPICKER_VALUE_GREATER_MAX_DATE'
,p_message_language=>'ko'
,p_message_text=>unistr('#LABEL#\C774 \C9C0\C815\B41C \CD5C\B300 \B0A0\C9DC %0\BCF4\B2E4 \C774\D6C4\C785\B2C8\B2E4.')
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140529943926751787)
,p_name=>'APEX.DATEPICKER_VALUE_INVALID'
,p_message_language=>'ko'
,p_message_text=>unistr('#LABEL#\C774 \D615\C2DD %0\ACFC(\C640) \C77C\CE58\D558\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140529420343751787)
,p_name=>'APEX.DATEPICKER_VALUE_LESS_MIN_DATE'
,p_message_language=>'ko'
,p_message_text=>unistr('#LABEL#\C774 \C9C0\C815\B41C \CD5C\C18C \B0A0\C9DC %0\BCF4\B2E4 \C774\C804\C785\B2C8\B2E4.')
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140529601391751787)
,p_name=>'APEX.DATEPICKER_VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'ko'
,p_message_text=>unistr('#LABEL#\C774 %0\BD80\D130 %1\AE4C\C9C0\C758 \C801\D569\D55C \BC94\C704\C5D0 \C18D\D558\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140529833237751787)
,p_name=>'APEX.DATEPICKER_VALUE_NOT_IN_YEAR_RANGE'
,p_message_language=>'ko'
,p_message_text=>unistr('#LABEL#\C774 %0\ACFC(\C640) %1 \C0AC\C774\C758 \C801\D569\D55C \C5F0\B3C4 \BC94\C704\C5D0 \C18D\D558\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140421686145751755)
,p_name=>'APEX.DBMS_CLOUD_INT.DBMS_CLOUD_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('DBMS_CLOUD \C694\CCAD\C744 \CC98\B9AC\D558\B294 \C911 \B0B4\BD80 \C624\B958\AC00 \BC1C\C0DD\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140582288412751802)
,p_name=>'APEX.DIALOG.CANCEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\CDE8\C18C')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140608109452751810)
,p_name=>'APEX.DIALOG.CLOSE'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2EB\AE30')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140469337547751769)
,p_name=>'APEX.DIALOG.CONFIRMATION'
,p_message_language=>'ko'
,p_message_text=>unistr('\D655\C778')
,p_is_js_message=>true
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140610190745751810)
,p_name=>'APEX.DIALOG.HELP'
,p_message_language=>'ko'
,p_message_text=>unistr('\B3C4\C6C0\B9D0')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140582021822751802)
,p_name=>'APEX.DIALOG.OK'
,p_message_language=>'ko'
,p_message_text=>unistr('\D655\C778')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140582114178751802)
,p_name=>'APEX.DIALOG.SAVE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C800\C7A5')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140449899043751763)
,p_name=>'APEX.DIALOG.TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\B300\D654\C0C1\C790 \C81C\BAA9')
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140489579974751775)
,p_name=>'APEX.DIALOG.VISUALLY_HIDDEN_TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\B300\D654\C0C1\C790 \C81C\BAA9\C744 \C2DC\AC01\C801\C73C\B85C \C228\AE40')
,p_is_js_message=>true
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140410648246751751)
,p_name=>'APEX.DOCGEN'
,p_message_language=>'ko'
,p_message_text=>unistr('Oracle Document Generator \BBF8\B9AC \C791\C131\B41C \D568\C218')
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140421470054751755)
,p_name=>'APEX.DOCGEN.DBMS_CLOUD_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\BB38\C11C\B97C \C778\C1C4\D558\B294 \C911 \C624\B958 \BC1C\C0DD.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140398673876751748)
,p_name=>'APEX.DOCGEN.INVALID_OUTPUT_TYPE'
,p_message_language=>'ko'
,p_message_text=>unistr('%s\C740(\B294) \CD9C\B825\C73C\B85C %1\C744(\B97C) \C9C0\C6D0\D558\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140410566845751751)
,p_name=>'APEX.DOCGEN.INVOKE_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('Oracle Document Generator \BBF8\B9AC \C791\C131\B41C \D568\C218\B97C \D638\CD9C\D558\B294 \C911 "%0" \C624\B958 \BC1C\C0DD:')
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140402074305751749)
,p_name=>'APEX.DOCGEN.TEMPLATE_REQUIRED'
,p_message_language=>'ko'
,p_message_text=>unistr('\D15C\D50C\B9AC\D2B8\AC00 \D544\C694\D569\B2C8\B2E4.')
,p_version_scn=>2705114
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140427423714751756)
,p_name=>'APEX.DOWNLOAD.ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\D30C\C77C \B2E4\C6B4\B85C\B4DC \C911 \C624\B958 \BC1C\C0DD.')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140427338169751756)
,p_name=>'APEX.DOWNLOAD.NO_DATA_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C6B4\B85C\B4DC \AC00\B2A5\D55C \B370\C774\D130\AC00 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140430985085751757)
,p_name=>'APEX.ENVIRONMENT.RUNTIME_ONLY'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774 \AE30\B2A5\C740 \B7F0\D0C0\C784 \C804\C6A9 \D658\ACBD\C5D0\C11C \C0AC\C6A9\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140483747291751773)
,p_name=>'APEX.ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C624\B958')
,p_is_js_message=>true
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140443658536751761)
,p_name=>'APEX.ERROR.CALLBACK_FAILED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C624\B958 \CC98\B9AC \CF5C\BC31\C744 \C2E4\D589\D558\B294 \C911 \B2E4\C74C \C624\B958 \BC1C\C0DD: %0')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140456235657751765)
,p_name=>'APEX.ERROR.ERROR_PAGE.UNHANDLED_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C624\B958 \D398\C774\C9C0\B97C \C791\C131\D558\B294 \C911 \C624\B958 \BC1C\C0DD: %0')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140445384276751762)
,p_name=>'APEX.ERROR.INTERNAL'
,p_message_language=>'ko'
,p_message_text=>unistr('\B0B4\BD80 \C624\B958')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140595076877751806)
,p_name=>'APEX.ERROR.INTERNAL.CONTACT_ADMINISTRATOR'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\AD00\B9AC\C790\C5D0\AC8C \C5F0\B77D\D558\C2ED\C2DC\C624.'),
unistr('\C774 \C7A5\C560\C5D0 \B300\D55C \C138\BD80\C815\BCF4\B294 \B514\BC84\ADF8 ID "%0"\C744(\B97C) \D1B5\D574 \C81C\ACF5\B429\B2C8\B2E4.')))
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140589653692751804)
,p_name=>'APEX.ERROR.ORA-16000'
,p_message_language=>'ko'
,p_message_text=>unistr('\B370\C774\D130\BCA0\C774\C2A4\AC00 \C77D\AE30 \C804\C6A9 \C561\C138\C2A4\B85C \C5F4\B838\C2B5\B2C8\B2E4.')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140619759176751813)
,p_name=>'APEX.ERROR.ORA-28353'
,p_message_language=>'ko'
,p_message_text=>unistr('ORA-28353: \C804\C790 \C9C0\AC11 \C5F4\AE30\B97C \C2E4\D328\D588\C2B5\B2C8\B2E4. \C560\D50C\B9AC\CF00\C774\C158 \B370\C774\D130\C5D0 \D604\C7AC \C561\C138\C2A4\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140589713258751804)
,p_name=>'APEX.ERROR.PAGE_NOT_AVAILABLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C8C4\C1A1\D569\B2C8\B2E4. \C774 \D398\C774\C9C0\B97C \C0AC\C6A9\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140448397017751763)
,p_name=>'APEX.ERROR.TECHNICAL_INFO'
,p_message_language=>'ko'
,p_message_text=>unistr('\AE30\C220 \C815\BCF4(\AC1C\BC1C\C790\B9CC \C0AC\C6A9 \AC00\B2A5)')
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140554260413751794)
,p_name=>'APEX.ERROR_MESSAGE_HEADING'
,p_message_language=>'ko'
,p_message_text=>unistr('\C624\B958 \BA54\C2DC\C9C0')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140568103311751798)
,p_name=>'APEX.EXPECTED_FORMAT'
,p_message_language=>'ko'
,p_message_text=>unistr('\D544\C694\D55C \D615\C2DD: %0')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140533088067751788)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.ALREADY_IN_ACL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AC\C6A9\C790\AC00 \C561\C138\C2A4 \C81C\C5B4 \BAA9\B85D\C5D0 \C774\BBF8 \C788\C2B5\B2C8\B2E4.')
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140532915361751788)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.CREATE_CONFIRM'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C %0\BA85\C758 \C0AC\C6A9\C790\B97C <strong>%1</strong> \C561\C138\C2A4 \C81C\C5B4 \BAA9\B85D\C5D0 \CD94\AC00\D560\C9C0 \D655\C778\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140533470206751788)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.DUPLICATE_USER'
,p_message_language=>'ko'
,p_message_text=>unistr('\C911\BCF5 \C0AC\C6A9\C790\AC00 \C874\C7AC\D569\B2C8\B2E4.')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140533111817751788)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.MISSING_AT_SIGN'
,p_message_language=>'ko'
,p_message_text=>unistr('\C804\C790\BA54\C77C \C8FC\C18C\C5D0 at \AE30\D638(@)\AC00 \B204\B77D\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140533211153751788)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.MISSING_DOT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C804\C790\BA54\C77C \C8FC\C18C\C5D0 \B9C8\CE68\D45C(.)\AC00 \B204\B77D\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140533384741751788)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.USERNAME_TOO_LONG'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AC\C6A9\C790 \C774\B984\C774 \B108\BB34 \AE41\B2C8\B2E4.')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140533675033751788)
,p_name=>'APEX.FEATURE.ACL.INFO.ACL_ONLY'
,p_message_language=>'ko'
,p_message_text=>unistr('\C560\D50C\B9AC\CF00\C774\C158 \C561\C138\C2A4 \C81C\C5B4 \BAA9\B85D\C5D0 \C815\C758\B41C \C0AC\C6A9\C790\B9CC \C774 \C560\D50C\B9AC\CF00\C774\C158\C5D0 \C561\C138\C2A4\D560 \C218 \C788\C2B5\B2C8\B2E4.')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140533712449751788)
,p_name=>'APEX.FEATURE.ACL.INFO.ACL_VALUE_INVALID'
,p_message_language=>'ko'
,p_message_text=>unistr('\C608\C0C1\CE58 \C54A\C740 \C561\C138\C2A4 \C81C\C5B4 \C124\C815 \AC12: %0')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140533555279751788)
,p_name=>'APEX.FEATURE.ACL.INFO.ALL_USERS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C778\C99D\B41C \BAA8\B4E0 \C0AC\C6A9\C790\AC00 \C774 \C560\D50C\B9AC\CF00\C774\C158\C5D0 \C561\C138\C2A4\D560 \C218 \C788\C2B5\B2C8\B2E4.')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140578065457751801)
,p_name=>'APEX.FEATURE.CONFIG.DISABLED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AC\C6A9 \C548\D568')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140577915923751801)
,p_name=>'APEX.FEATURE.CONFIG.ENABLED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AC\C6A9')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140578245788751801)
,p_name=>'APEX.FEATURE.CONFIG.IS_DISABLED'
,p_message_language=>'ko'
,p_message_text=>unistr('%0: \C0AC\C6A9 \C548\D568\C73C\B85C \C124\C815\B428')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140578128199751801)
,p_name=>'APEX.FEATURE.CONFIG.IS_ENABLED'
,p_message_language=>'ko'
,p_message_text=>unistr('%0: \C0AC\C6A9\C73C\B85C \C124\C815\B428')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140426709326751756)
,p_name=>'APEX.FEATURE.CONFIG.NOT_SUPPORTED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\C6D0\B418\C9C0 \C54A\C74C')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140487946164751774)
,p_name=>'APEX.FEATURE.CONFIG.OFF'
,p_message_language=>'ko'
,p_message_text=>unistr('\D574\C81C')
,p_is_js_message=>true
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140487865400751774)
,p_name=>'APEX.FEATURE.CONFIG.ON'
,p_message_language=>'ko'
,p_message_text=>unistr('\C124\C815')
,p_is_js_message=>true
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140577872679751801)
,p_name=>'APEX.FEATURE.TOP_USERS.USERNAME.NOT_IDENTIFIED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\C815\D558\C9C0 \C54A\C74C')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140418302530751754)
,p_name=>'APEX.FILESIZE.BYTES'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \BC14\C774\D2B8')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140418881602751754)
,p_name=>'APEX.FILESIZE.GB'
,p_message_language=>'ko'
,p_message_text=>'%0 GB'
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140418582299751754)
,p_name=>'APEX.FILESIZE.KB'
,p_message_language=>'ko'
,p_message_text=>'%0 KB'
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140418743152751754)
,p_name=>'APEX.FILESIZE.MB'
,p_message_language=>'ko'
,p_message_text=>'%0 MB'
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140571042448751799)
,p_name=>'APEX.FILE_BROWSE.DOWNLOAD_LINK_TEXT'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C6B4\B85C\B4DC')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140424185018751755)
,p_name=>'APEX.FS.ACTIONS_MENU_BUTTON_LABEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C635\C158')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140423896846751755)
,p_name=>'APEX.FS.ACTIONS_MENU_FILTER'
,p_message_language=>'ko'
,p_message_text=>unistr('\D544\D130')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140424084491751755)
,p_name=>'APEX.FS.ACTIONS_MENU_HIDE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D328\C2EF \C228\AE30\AE30')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140448730125751763)
,p_name=>'APEX.FS.ADD_FILTER'
,p_message_language=>'ko'
,p_message_text=>unistr('\D544\D130 \CD94\AC00')
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140525091737751785)
,p_name=>'APEX.FS.APPLIED_FACET'
,p_message_language=>'ko'
,p_message_text=>unistr('\C801\C6A9\B41C \D544\D130 %0')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140449484529751763)
,p_name=>'APEX.FS.APPLY'
,p_message_language=>'ko'
,p_message_text=>unistr('\C801\C6A9')
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140568612336751798)
,p_name=>'APEX.FS.BATCH_APPLY'
,p_message_language=>'ko'
,p_message_text=>unistr('\C801\C6A9')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140449506250751763)
,p_name=>'APEX.FS.CANCEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\CDE8\C18C')
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140433307207751758)
,p_name=>'APEX.FS.CHART_BAR'
,p_message_language=>'ko'
,p_message_text=>unistr('\B9C9\B300 \CC28\D2B8')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140581314998751802)
,p_name=>'APEX.FS.CHART_OTHERS'
,p_message_language=>'ko'
,p_message_text=>unistr('\AE30\D0C0')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140433414811751758)
,p_name=>'APEX.FS.CHART_PIE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D30C\C774 \CC28\D2B8')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140579943239751802)
,p_name=>'APEX.FS.CHART_TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\CC28\D2B8')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140433133037751758)
,p_name=>'APEX.FS.CHART_VALUE_LABEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC1C\C218')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140569181273751798)
,p_name=>'APEX.FS.CLEAR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\C6B0\AE30')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140569279663751798)
,p_name=>'APEX.FS.CLEAR_ALL'
,p_message_language=>'ko'
,p_message_text=>unistr('\BAA8\B450 \C9C0\C6B0\AE30')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140569339982751798)
,p_name=>'APEX.FS.CLEAR_VALUE'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C9C0\C6B0\AE30')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140585885280751803)
,p_name=>'APEX.FS.COLUMN_UNAUTHORIZED'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \D328\C2EF\C774 \CC38\C870\D558\B294 %1 \C5F4\C744 \C0AC\C6A9\D560 \C218 \C5C6\AC70\B098 \D574\B2F9 \C5F4\C5D0 \B300\D55C \AD8C\D55C\C774 \BD80\C5EC\B418\C9C0 \C54A\C558\C2B5\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140396534563751747)
,p_name=>'APEX.FS.CONFIG_TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D45C\C2DC\D560 \D544\D130 \C120\D0DD')
,p_is_js_message=>true
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140523050932751785)
,p_name=>'APEX.FS.COUNT_RESULTS'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\AC1C \ACB0\ACFC')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140523117296751785)
,p_name=>'APEX.FS.COUNT_SELECTED'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\AC1C \C120\D0DD\B428')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140525949217751786)
,p_name=>'APEX.FS.CUR_FILTERS_LM'
,p_message_language=>'ko'
,p_message_text=>unistr('\D604\C7AC \D544\D130')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140401558372751749)
,p_name=>'APEX.FS.FACETED_SEARCH_NEEDS_REGION_QUERY'
,p_message_language=>'ko'
,p_message_text=>unistr('\D328\C2EF\C774 \C9C0\C815\B41C \AC80\C0C9\C740 \C601\C5ED \B808\BCA8\C5D0 \B370\C774\D130 \C18C\C2A4\AC00 \C788\C5B4\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705114
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140405218388751750)
,p_name=>'APEX.FS.FACETS_LIST'
,p_message_language=>'ko'
,p_message_text=>unistr('\D544\D130 \BAA9\B85D')
,p_is_js_message=>true
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140584371485751803)
,p_name=>'APEX.FS.FACET_VALUE_LIMIT_EXCEEDED'
,p_message_language=>'ko'
,p_message_text=>unistr('%1 \D328\C2EF\C5D0 \B300\D55C \ACE0\C720 \AC12 \C81C\D55C(%0)\C774 \CD08\ACFC\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140570670858751799)
,p_name=>'APEX.FS.FC_TYPE_UNSUPPORTED_FOR_DATE_COLUMNS'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \D328\C2EF\C740 DATE \B610\B294 TIMESTAMP \C5F4\C5D0 \B300\D574 \C9C0\C6D0\B418\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140568714428751798)
,p_name=>'APEX.FS.FILTER'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \D544\D130\B9C1')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140443334358751761)
,p_name=>'APEX.FS.FILTER_APPLIED'
,p_message_language=>'ko'
,p_message_text=>unistr('%0(\D544\D130 \C801\C6A9\B428)')
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140568816879751798)
,p_name=>'APEX.FS.GO'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2E4\D589')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140438857111751760)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_C'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \D3EC\D568')
,p_is_js_message=>true
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140570296501751799)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_EQ'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\ACFC(\C640) \AC19\C74C')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140438525732751760)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_GT'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \CD08\ACFC')
,p_is_js_message=>true
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140438622783751760)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_GTE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D06C\AC70\B098 \AC19\C74C %0')
,p_is_js_message=>true
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140438220308751760)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_LT'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \BBF8\B9CC')
,p_is_js_message=>true
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140438458625751760)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_LTE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C791\AC70\B098 \AC19\C74C %0')
,p_is_js_message=>true
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140437789581751759)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NC'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C\C744 \D3EC\D568\D558\C9C0 \C54A\C74C %0')
,p_is_js_message=>true
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140423558895751755)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NEQ'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC19\C9C0 \C54A\C74C %0')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140437879098751760)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NSTARTS'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C\C73C\B85C \C2DC\C791\D558\C9C0 \C54A\C74C %0')
,p_is_js_message=>true
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140438728315751760)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_STARTS'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C\C73C\B85C \C2DC\C791 %0')
,p_is_js_message=>true
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140436886350751759)
,p_name=>'APEX.FS.INPUT_FACET_SELECTOR'
,p_message_language=>'ko'
,p_message_text=>unistr('\D328\C2EF \C120\D0DD')
,p_is_js_message=>true
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140412620072751752)
,p_name=>'APEX.FS.INPUT_INVALID_FILTER_PREFIX'
,p_message_language=>'ko'
,p_message_text=>unistr('\D544\D130 \C811\B450\C5B4 "%0"\C774(\AC00) "%1" \D328\C2EF\C5D0 \BD80\C801\D569\D569\B2C8\B2E4.')
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140411062626751752)
,p_name=>'APEX.FS.INPUT_MISSING_FILTER_PREFIX'
,p_message_language=>'ko'
,p_message_text=>unistr('"%0" \D328\C2EF\C5D0 \D544\D130 \C811\B450\C5B4\AC00 \B204\B77D\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140445233218751762)
,p_name=>'APEX.FS.INPUT_OPERATOR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F0\C0B0\C790')
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140427127148751756)
,p_name=>'APEX.FS.INPUT_OPERATOR.C'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C\C744 \D3EC\D568')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140426112252751756)
,p_name=>'APEX.FS.INPUT_OPERATOR.EQ'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC19\C74C')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140426882646751756)
,p_name=>'APEX.FS.INPUT_OPERATOR.GT'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\B2E4 \D07C')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140426911797751756)
,p_name=>'APEX.FS.INPUT_OPERATOR.GTE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D06C\AC70\B098 \AC19\C74C')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140426514954751756)
,p_name=>'APEX.FS.INPUT_OPERATOR.LT'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\B2E4 \C791\C74C')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140426617472751756)
,p_name=>'APEX.FS.INPUT_OPERATOR.LTE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C791\AC70\B098 \AC19\C74C')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140437621572751759)
,p_name=>'APEX.FS.INPUT_OPERATOR.NC'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C\C744 \D3EC\D568\D558\C9C0 \C54A\C74C')
,p_is_js_message=>true
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140426395814751756)
,p_name=>'APEX.FS.INPUT_OPERATOR.NEQ'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC19\C9C0 \C54A\C74C')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140437525476751759)
,p_name=>'APEX.FS.INPUT_OPERATOR.NSTARTS'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C\C73C\B85C \C2DC\C791\B418\C9C0 \C54A\C74C')
,p_is_js_message=>true
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140427016835751756)
,p_name=>'APEX.FS.INPUT_OPERATOR.STARTS'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C\C73C\B85C \C2DC\C791')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140445610640751762)
,p_name=>'APEX.FS.INPUT_UNSUPPORTED_DATA_TYPE'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \B370\C774\D130 \C720\D615(%1)\C740 \C785\B825 \D544\B4DC \D328\C2EF\C5D0 \B300\D574 \C9C0\C6D0\B418\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140412549691751752)
,p_name=>'APEX.FS.INPUT_UNSUPPORTED_FILTER_FOR_DATA_TYPE'
,p_message_language=>'ko'
,p_message_text=>unistr('"%0" \D544\D130\AC00 "%1" \D328\C2EF(\B370\C774\D130 \C720\D615 %2)\C5D0 \C9C0\C6D0\B418\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140445125497751762)
,p_name=>'APEX.FS.INPUT_VALUE'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC12')
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140570416168751799)
,p_name=>'APEX.FS.NO_SEARCH_COLUMNS_PROVIDED'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \D328\C2EF\C5D0 \B300\D574 \C81C\ACF5\B41C \AC80\C0C9 \C5F4\C774 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140396665313751747)
,p_name=>'APEX.FS.OPEN_CONFIG'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD94\AC00 \D544\D130')
,p_is_js_message=>true
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140523281613751785)
,p_name=>'APEX.FS.RANGE_BEGIN'
,p_message_language=>'ko'
,p_message_text=>unistr('\BC94\C704 \C2DC\C791')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140569946077751799)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL'
,p_message_language=>'ko'
,p_message_text=>'%0 - %1'
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140570056710751799)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL_OPEN_HI'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C774\C0C1')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140570126211751799)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL_OPEN_LO'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C774\D558')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140523342716751785)
,p_name=>'APEX.FS.RANGE_END'
,p_message_language=>'ko'
,p_message_text=>unistr('\BC94\C704 \B05D')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140587928390751804)
,p_name=>'APEX.FS.RANGE_LOV_ITEM_INVALID'
,p_message_language=>'ko'
,p_message_text=>unistr('\BC94\C704 \D328\C2EF %0\C5D0 \B300\D55C LOV \D56D\BAA9 #%2("%1")\C774(\AC00) \BD80\C801\D569\D569\B2C8\B2E4("|" \AD6C\BD84 \AE30\D638 \B204\B77D).')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140570311180751799)
,p_name=>'APEX.FS.RANGE_MANUAL_NOT_SUPPORTED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F4\C774 DATE \B610\B294 TIMESTAMP\C774\BBC0\B85C \BC94\C704 \D328\C2EF %0\C5D0 \B300\D55C \C218\B3D9 \C785\B825\C740 \D604\C7AC \C9C0\C6D0\B418\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140569626642751798)
,p_name=>'APEX.FS.RANGE_TEXT'
,p_message_language=>'ko'
,p_message_text=>'-'
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140433257436751758)
,p_name=>'APEX.FS.REMOVE_CHART'
,p_message_language=>'ko'
,p_message_text=>unistr('\CC28\D2B8 \C81C\AC70')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140519672495751784)
,p_name=>'APEX.FS.RESET'
,p_message_language=>'ko'
,p_message_text=>unistr('\C7AC\C124\C815')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140569073256751798)
,p_name=>'APEX.FS.SEARCH_LABEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC80\C0C9')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140568906313751798)
,p_name=>'APEX.FS.SEARCH_PLACEHOLDER'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC80\C0C9...')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140569831118751799)
,p_name=>'APEX.FS.SELECT_PLACEHOLDER'
,p_message_language=>'ko'
,p_message_text=>unistr('- \C120\D0DD -')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140433012901751758)
,p_name=>'APEX.FS.SHOW_CHART'
,p_message_language=>'ko'
,p_message_text=>unistr('\CC28\D2B8 \D45C\C2DC')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140569440078751798)
,p_name=>'APEX.FS.SHOW_LESS'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC04\B2E8\D788 \D45C\C2DC')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140569514408751798)
,p_name=>'APEX.FS.SHOW_MORE'
,p_message_language=>'ko'
,p_message_text=>unistr('\BAA8\B450 \D45C\C2DC')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140569766085751799)
,p_name=>'APEX.FS.STAR_RATING_LABEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCC4 %0\AC1C \C774\C0C1')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140524928882751785)
,p_name=>'APEX.FS.SUGGESTIONS'
,p_message_language=>'ko'
,p_message_text=>unistr('\D544\D130 \C81C\C548\C0AC\D56D')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140570515833751799)
,p_name=>'APEX.FS.TEXT_FIELD_ONLY_FOR_NUMBER_COLUMNS'
,p_message_language=>'ko'
,p_message_text=>unistr('\D14D\C2A4\D2B8 \D544\B4DC \D328\C2EF %0\C740(\B294) \D604\C7AC NUMBER \C5F4\C5D0 \B300\D574\C11C\B9CC \C9C0\C6D0\B429\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140396001228751747)
,p_name=>'APEX.FS.TOTAL_ROW_COUNT_LABEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD1D \D589 \C218')
,p_version_scn=>2705111
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140585939171751803)
,p_name=>'APEX.FS.UNSUPPORTED_DATA_TYPE'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \B370\C774\D130 \C720\D615(%1)\C740 \D328\C2EF\C774 \C9C0\C815\B41C \AC80\C0C9\C5D0 \B300\D574 \C9C0\C6D0\B418\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140516162647751783)
,p_name=>'APEX.FS.VISUALLY_HIDDEN_HEADING'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2DC\AC01\C801\C73C\B85C \C228\ACA8\C9C4 \BA38\B9AC\AE00')
,p_is_js_message=>true
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140578406913751801)
,p_name=>'APEX.GO_TO_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C624\B958\B85C \C774\B3D9')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140534494169751788)
,p_name=>'APEX.GV.AGG_CONTEXT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9D1\ACC4.')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140462366057751767)
,p_name=>'APEX.GV.BLANK_HEADING'
,p_message_language=>'ko'
,p_message_text=>unistr('\BE48 \BA38\B9AC\AE00')
,p_is_js_message=>true
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140543712453751791)
,p_name=>'APEX.GV.BREAK_COLLAPSE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C81C\C5B4 \CC28\B2E8 \CD95\C18C')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140534520058751788)
,p_name=>'APEX.GV.BREAK_CONTEXT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C81C\C5B4 \CC28\B2E8.')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140543619509751791)
,p_name=>'APEX.GV.BREAK_EXPAND'
,p_message_language=>'ko'
,p_message_text=>unistr('\C81C\C5B4 \CC28\B2E8 \D655\C7A5')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140543431916751791)
,p_name=>'APEX.GV.DELETED_COUNT'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\AC1C \D589\C774 \C0AD\C81C\B428')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140612510984751811)
,p_name=>'APEX.GV.DUP_REC_ID'
,p_message_language=>'ko'
,p_message_text=>unistr('\C911\BCF5 ID')
,p_is_js_message=>true
,p_version_scn=>2705148
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140405442292751750)
,p_name=>'APEX.GV.ENTER_EDIT_MODE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D3B8\C9D1 \BAA8\B4DC \B4E4\C5B4\AC00\AE30')
,p_is_js_message=>true
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140531319746751787)
,p_name=>'APEX.GV.FIRST_PAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\CCAB\BC88\C9F8')
,p_is_js_message=>true
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140404231011751750)
,p_name=>'APEX.GV.FLOATING_ITEM.DIALOG.HIDE_DIALOG'
,p_message_language=>'ko'
,p_message_text=>unistr('\B300\D654\C0C1\C790 \C228\AE30\AE30')
,p_is_js_message=>true
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140403240049751749)
,p_name=>'APEX.GV.FLOATING_ITEM.DIALOG.TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\BD80\B3D9 \C624\BC84\D50C\B85C\C6B0 \C140 \CF58\D150\CE20')
,p_is_js_message=>true
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140404568836751750)
,p_name=>'APEX.GV.FLOATING_ITEM.SHOW_DIALOG'
,p_message_language=>'ko'
,p_message_text=>unistr('\C624\BC84\D50C\B85C\C6B0 \CF58\D150\CE20 \D45C\C2DC')
,p_is_js_message=>true
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140478743442751772)
,p_name=>'APEX.GV.FOOTER_LANDMARK'
,p_message_language=>'ko'
,p_message_text=>unistr('\ADF8\B9AC\B4DC \BC14\B2E5\AE00')
,p_is_js_message=>true
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140534701978751788)
,p_name=>'APEX.GV.GROUP_CONTEXT'
,p_message_language=>'ko'
,p_message_text=>unistr('\ADF8\B8F9 \BA38\B9AC\AE00')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140534622419751788)
,p_name=>'APEX.GV.HEADER_CONTEXT'
,p_message_language=>'ko'
,p_message_text=>unistr('\BA38\B9AC\AE00.')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140531423023751787)
,p_name=>'APEX.GV.LAST_PAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\B9C8\C9C0\B9C9')
,p_is_js_message=>true
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140405692566751750)
,p_name=>'APEX.GV.LEAVE_EDIT_MODE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D3B8\C9D1 \BAA8\B4DC \B098\AC00\AE30')
,p_is_js_message=>true
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140430325664751757)
,p_name=>'APEX.GV.LOAD_ALL'
,p_message_language=>'ko'
,p_message_text=>unistr('\BAA8\B450 \B85C\B4DC')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140553268125751794)
,p_name=>'APEX.GV.LOAD_MORE'
,p_message_language=>'ko'
,p_message_text=>unistr('\B354 \BCF4\AE30')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140531190692751787)
,p_name=>'APEX.GV.NEXT_PAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C')
,p_is_js_message=>true
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140534812161751788)
,p_name=>'APEX.GV.PAGE_RANGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D398\C774\C9C0 \D589')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140443931782751761)
,p_name=>'APEX.GV.PAGE_RANGE_ENTITY'
,p_message_language=>'ko'
,p_message_text=>unistr('\D398\C774\C9C0 %0')
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140531569597751787)
,p_name=>'APEX.GV.PAGE_RANGE_XY'
,p_message_language=>'ko'
,p_message_text=>'%0 - %1'
,p_is_js_message=>true
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140531695387751787)
,p_name=>'APEX.GV.PAGE_RANGE_XYZ'
,p_message_language=>'ko'
,p_message_text=>'%0-%1/%2'
,p_is_js_message=>true
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140588568766751804)
,p_name=>'APEX.GV.PAGE_SELECTION'
,p_message_language=>'ko'
,p_message_text=>unistr('\D398\C774\C9C0 \C120\D0DD\C0AC\D56D')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140479005513751772)
,p_name=>'APEX.GV.PAGINATION_LANDMARK'
,p_message_language=>'ko'
,p_message_text=>unistr('\D398\C774\C9C0 \B9E4\AE40')
,p_is_js_message=>true
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140531272813751787)
,p_name=>'APEX.GV.PREV_PAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\C804')
,p_is_js_message=>true
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140429260838751757)
,p_name=>'APEX.GV.RANGE_DISPLAY'
,p_message_language=>'ko'
,p_message_text=>unistr('\BC94\C704 \D45C\C2DC')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140462605603751767)
,p_name=>'APEX.GV.ROWS_SELECTION'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589 \C120\D0DD')
,p_is_js_message=>true
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140612369961751811)
,p_name=>'APEX.GV.ROW_ADDED'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD94\AC00\B428')
,p_is_js_message=>true
,p_version_scn=>2705148
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140612404626751811)
,p_name=>'APEX.GV.ROW_CHANGED'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCC0\ACBD\B428')
,p_is_js_message=>true
,p_version_scn=>2705148
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140620739676751814)
,p_name=>'APEX.GV.ROW_COLUMN_CONTEXT'
,p_message_language=>'ko'
,p_message_text=>unistr('\ADF8\B9AC\B4DC \D589 \C2DC\D000\C2A4 %0, \C5F4 %1\C785\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140620845467751814)
,p_name=>'APEX.GV.ROW_CONTEXT'
,p_message_language=>'ko'
,p_message_text=>unistr('\ADF8\B9AC\B4DC \D589 \C2DC\D000\C2A4 %0\C785\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140612218630751811)
,p_name=>'APEX.GV.ROW_DELETED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AD\C81C\B428')
,p_is_js_message=>true
,p_version_scn=>2705148
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140535040735751788)
,p_name=>'APEX.GV.ROW_HEADER'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589 \BA38\B9AC\AE00')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140462586193751767)
,p_name=>'APEX.GV.ROW_SELECTION'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589 \C120\D0DD')
,p_is_js_message=>true
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140430470726751757)
,p_name=>'APEX.GV.SELECTED_ENTITY_COUNT'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 %1 \C120\D0DD\B428')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140530506445751787)
,p_name=>'APEX.GV.SELECTION_CELL_COUNT'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\AC1C \C140\C774 \C120\D0DD\B428')
,p_is_js_message=>true
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140531750396751787)
,p_name=>'APEX.GV.SELECTION_COUNT'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\AC1C \D589\C774 \C120\D0DD\B428')
,p_is_js_message=>true
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140573833223751800)
,p_name=>'APEX.GV.SELECT_ALL'
,p_message_language=>'ko'
,p_message_text=>unistr('\BAA8\B450 \C120\D0DD')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140467339331751768)
,p_name=>'APEX.GV.SELECT_ALL_ROWS'
,p_message_language=>'ko'
,p_message_text=>unistr('\BAA8\B4E0 \D589 \C120\D0DD')
,p_is_js_message=>true
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140543512227751791)
,p_name=>'APEX.GV.SELECT_PAGE_N'
,p_message_language=>'ko'
,p_message_text=>unistr('\D398\C774\C9C0 %0')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140534996595751788)
,p_name=>'APEX.GV.SELECT_ROW'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589 \C120\D0DD')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140535274997751788)
,p_name=>'APEX.GV.SORTED_ASCENDING'
,p_message_language=>'ko'
,p_message_text=>unistr('\C624\B984\CC28\C21C\C73C\B85C \C815\B82C\B428 - %0')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140535344161751788)
,p_name=>'APEX.GV.SORTED_DESCENDING'
,p_message_language=>'ko'
,p_message_text=>unistr('\B0B4\B9BC\CC28\C21C\C73C\B85C \C815\B82C\B428 - %0')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140530621701751787)
,p_name=>'APEX.GV.SORT_ASCENDING'
,p_message_language=>'ko'
,p_message_text=>unistr('\C624\B984\CC28\C21C \C815\B82C')
,p_is_js_message=>true
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140530942819751787)
,p_name=>'APEX.GV.SORT_ASCENDING_ORDER'
,p_message_language=>'ko'
,p_message_text=>unistr('\C624\B984\CC28\C21C \C815\B82C %0')
,p_is_js_message=>true
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140530769516751787)
,p_name=>'APEX.GV.SORT_DESCENDING'
,p_message_language=>'ko'
,p_message_text=>unistr('\B0B4\B9BC\CC28\C21C \C815\B82C')
,p_is_js_message=>true
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140531020608751787)
,p_name=>'APEX.GV.SORT_DESCENDING_ORDER'
,p_message_language=>'ko'
,p_message_text=>unistr('\B0B4\B9BC\CC28\C21C \C815\B82C %0')
,p_is_js_message=>true
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140530804405751787)
,p_name=>'APEX.GV.SORT_OFF'
,p_message_language=>'ko'
,p_message_text=>unistr('\C815\B82C \C548\D568')
,p_is_js_message=>true
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140396430188751747)
,p_name=>'APEX.GV.SORT_OPTIONS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C815\B82C \C635\C158')
,p_is_js_message=>true
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140478847266751772)
,p_name=>'APEX.GV.STATE_ICONS_LANDMARK'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0C1\D0DC \C544\C774\CF58')
,p_is_js_message=>true
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140478995261751772)
,p_name=>'APEX.GV.STATUS_LANDMARK'
,p_message_language=>'ko'
,p_message_text=>unistr('\ADF8\B9AC\B4DC \C0C1\D0DC')
,p_is_js_message=>true
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140408772361751751)
,p_name=>'APEX.GV.TOTAL_ENTITY_PLURAL'
,p_message_language=>'ko'
,p_message_text=>'%0 %1'
,p_is_js_message=>true
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140408413087751751)
,p_name=>'APEX.GV.TOTAL_ENTITY_SINGULAR'
,p_message_language=>'ko'
,p_message_text=>'1 %0'
,p_is_js_message=>true
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140543337993751791)
,p_name=>'APEX.GV.TOTAL_PAGES'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD1D\ACC4 %0')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140462155447751767)
,p_name=>'APEX.HTTP.REQUEST_FAILED'
,p_message_language=>'ko'
,p_message_text=>unistr('"%0"\C5D0 \B300\D55C HTTP \C694\CCAD\C744 \C2E4\D328\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140463719128751767)
,p_name=>'APEX.ICON_LIST.COLUMN'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F4 %0')
,p_is_js_message=>true
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140463914040751767)
,p_name=>'APEX.ICON_LIST.COLUMN_AND_ROW'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C5F4 \BC0F %1 \D589')
,p_is_js_message=>true
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140464218143751767)
,p_name=>'APEX.ICON_LIST.FIRST_COLUMN'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\BBF8 \CCAB\BC88\C9F8 \C5F4\C5D0 \C788\C74C: %0 \C5F4 \BC0F %1 \D589')
,p_is_js_message=>true
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140464164826751767)
,p_name=>'APEX.ICON_LIST.FIRST_ROW'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\BBF8 \CCAB\BC88\C9F8 \D589\C5D0 \C788\C74C: %0 \C5F4 \BC0F %1 \D589')
,p_is_js_message=>true
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140609799777751810)
,p_name=>'APEX.ICON_LIST.GRID_DIM'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C5F4 \BC0F %1 \D589\C5D0 \C788\C74C')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140464373802751767)
,p_name=>'APEX.ICON_LIST.LAST_COLUMN'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\BBF8 \B9C8\C9C0\B9C9 \C5F4\C5D0 \C788\C74C: %0 \C5F4 \BC0F %1 \D589')
,p_is_js_message=>true
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140464024690751767)
,p_name=>'APEX.ICON_LIST.LAST_ROW'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\BBF8 \B9C8\C9C0\B9C9 \D589\C5D0 \C788\C74C: %0 \C5F4 \BC0F %1 \D589')
,p_is_js_message=>true
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140543280222751791)
,p_name=>'APEX.ICON_LIST.LIST_DIM'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \D589\C5D0 \C788\C74C')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140463881694751767)
,p_name=>'APEX.ICON_LIST.ROW'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589 %0')
,p_is_js_message=>true
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140620500823751814)
,p_name=>'APEX.IG.ACC_LABEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\B300\D654\C2DD \ADF8\B9AC\B4DC %0')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140527664058751786)
,p_name=>'APEX.IG.ACTIONS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C791\C5C5')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140528604937751786)
,p_name=>'APEX.IG.ADD'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD94\AC00')
,p_is_js_message=>true
,p_version_scn=>2705137
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140528591734751786)
,p_name=>'APEX.IG.ADD_ROW'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589 \CD94\AC00')
,p_is_js_message=>true
,p_version_scn=>2705137
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140614125088751812)
,p_name=>'APEX.IG.AGGREGATE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9D1\ACC4')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140599704498751807)
,p_name=>'APEX.IG.AGGREGATION'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9D1\ACC4')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140601479050751808)
,p_name=>'APEX.IG.ALL'
,p_message_language=>'ko'
,p_message_text=>unistr('\BAA8\B450')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140559093298751795)
,p_name=>'APEX.IG.ALL_TEXT_COLUMNS'
,p_message_language=>'ko'
,p_message_text=>unistr('\BAA8\B4E0 \D14D\C2A4\D2B8 \C5F4')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140560266145751796)
,p_name=>'APEX.IG.ALTERNATIVE'
,p_message_language=>'ko'
,p_message_text=>unistr('\B300\CCB4')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140561375787751796)
,p_name=>'APEX.IG.AND'
,p_message_language=>'ko'
,p_message_text=>unistr('\BC0F')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140580794458751802)
,p_name=>'APEX.IG.APPROX_COUNT_DISTINCT'
,p_message_language=>'ko'
,p_message_text=>unistr('\B300\B7B5\C801 \ACE0\C720 \AC1C\C218')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140615190694751812)
,p_name=>'APEX.IG.APPROX_COUNT_DISTINCT_OVERALL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C804\CCB4 \B300\B7B5\C801 \ACE0\C720 \AC1C\C218')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140598322025751807)
,p_name=>'APEX.IG.AREA'
,p_message_language=>'ko'
,p_message_text=>unistr('\C601\C5ED')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140600261264751807)
,p_name=>'APEX.IG.ASCENDING'
,p_message_language=>'ko'
,p_message_text=>unistr('\C624\B984\CC28\C21C')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140560314515751796)
,p_name=>'APEX.IG.AUTHORIZATION'
,p_message_language=>'ko'
,p_message_text=>unistr('\AD8C\D55C')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140614201221751812)
,p_name=>'APEX.IG.AUTO'
,p_message_language=>'ko'
,p_message_text=>unistr('\C790\B3D9')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140581156290751802)
,p_name=>'APEX.IG.AVG'
,p_message_language=>'ko'
,p_message_text=>unistr('\D3C9\ADE0')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140614891335751812)
,p_name=>'APEX.IG.AVG_OVERALL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C804\CCB4 \D3C9\ADE0')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140597842499751807)
,p_name=>'APEX.IG.AXIS_LABEL_TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\B808\C774\BE14 \CD95 \C81C\BAA9')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140598061784751807)
,p_name=>'APEX.IG.AXIS_VALUE_DECIMAL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C18C\C218\C810 \C790\B9AC')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140597997709751807)
,p_name=>'APEX.IG.AXIS_VALUE_TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC12 \CD95 \C81C\BAA9')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140604073574751809)
,p_name=>'APEX.IG.BACKGROUND_COLOR'
,p_message_language=>'ko'
,p_message_text=>unistr('\BC30\ACBD\C0C9')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140598433067751807)
,p_name=>'APEX.IG.BAR'
,p_message_language=>'ko'
,p_message_text=>unistr('\B9C9\B300')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140555673465751794)
,p_name=>'APEX.IG.BETWEEN'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C \C0AC\C774')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140605296315751809)
,p_name=>'APEX.IG.BOTH'
,p_message_language=>'ko'
,p_message_text=>unistr('\BAA8\B450')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140598586175751807)
,p_name=>'APEX.IG.BUBBLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\BC84\BE14')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140528860060751786)
,p_name=>'APEX.IG.CANCEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\CDE8\C18C')
,p_is_js_message=>true
,p_version_scn=>2705137
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140561209338751796)
,p_name=>'APEX.IG.CASE_SENSITIVE'
,p_message_language=>'ko'
,p_message_text=>unistr('\B300\C18C\BB38\C790 \AD6C\BD84')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140615712226751812)
,p_name=>'APEX.IG.CASE_SENSITIVE_WITH_BRACKETS'
,p_message_language=>'ko'
,p_message_text=>unistr('(\B300\C18C\BB38\C790 \AD6C\BD84)')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140587011865751804)
,p_name=>'APEX.IG.CHANGES_SAVED'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCC0\ACBD\C0AC\D56D\C774 \C800\C7A5\B428')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140529231058751787)
,p_name=>'APEX.IG.CHANGE_VIEW'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\AE30 \BCC0\ACBD')
,p_is_js_message=>true
,p_version_scn=>2705137
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140562358532751796)
,p_name=>'APEX.IG.CHART'
,p_message_language=>'ko'
,p_message_text=>unistr('\CC28\D2B8')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140558869241751795)
,p_name=>'APEX.IG.CHART_MAX_DATAPOINT_CNT'
,p_message_language=>'ko'
,p_message_text=>unistr('\D574\B2F9 \C9C8\C758\B294 \CC28\D2B8\B2F9 \CD5C\B300 \B370\C774\D130 \D3EC\C778\D2B8 \C218 %0\AC1C\B97C \CD08\ACFC\D569\B2C8\B2E4. \AE30\BCF8 \C9C8\C758\C758 \B808\CF54\B4DC \C218\B97C \C904\C774\B824\BA74 \D544\D130\B97C \C801\C6A9\D558\C2ED\C2DC\C624.')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140527539825751786)
,p_name=>'APEX.IG.CHART_VIEW'
,p_message_language=>'ko'
,p_message_text=>unistr('\CC28\D2B8 \BCF4\AE30')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140535968834751789)
,p_name=>'APEX.IG.CLEAR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\C6B0\AE30')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140597373885751807)
,p_name=>'APEX.IG.CLOSE_COLUMN'
,p_message_language=>'ko'
,p_message_text=>unistr('\C885\AC00')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140604201821751809)
,p_name=>'APEX.IG.COLORS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0C9\C0C1')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140581587394751802)
,p_name=>'APEX.IG.COLOR_PREVIEW'
,p_message_language=>'ko'
,p_message_text=>unistr('\BBF8\B9AC\BCF4\AE30')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140560649589751796)
,p_name=>'APEX.IG.COLUMN'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F4')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140527736458751786)
,p_name=>'APEX.IG.COLUMNS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F4')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140489693940751775)
,p_name=>'APEX.IG.COLUMN_HEADER_ACTIONS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F4 \C791\C5C5')
,p_is_js_message=>true
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140489461594751775)
,p_name=>'APEX.IG.COLUMN_HEADER_ACTIONS_FOR'
,p_message_language=>'ko'
,p_message_text=>unistr('"%0" \C5F4\C5D0 \B300\D55C \C791\C5C5')
,p_is_js_message=>true
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140606029951751809)
,p_name=>'APEX.IG.COLUMN_TYPE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F4 \C6A9\B3C4')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140560766928751796)
,p_name=>'APEX.IG.COMPLEX'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF5\D569')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140527977226751786)
,p_name=>'APEX.IG.COMPUTE'
,p_message_language=>'ko'
,p_message_text=>unistr('\ACC4\C0B0')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140556250564751795)
,p_name=>'APEX.IG.CONTAINS'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C\C744 \D3EC\D568')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140562559590751796)
,p_name=>'APEX.IG.CONTROL_BREAK'
,p_message_language=>'ko'
,p_message_text=>unistr('\C81C\C5B4 \CC28\B2E8')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140535792157751789)
,p_name=>'APEX.IG.COPY_CB'
,p_message_language=>'ko'
,p_message_text=>unistr('\D074\B9BD\BCF4\B4DC\B85C \BCF5\C0AC')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140535878322751789)
,p_name=>'APEX.IG.COPY_DOWN'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF5\C0AC')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140580561401751802)
,p_name=>'APEX.IG.COUNT'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC1C\C218')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140580691033751802)
,p_name=>'APEX.IG.COUNT_DISTINCT'
,p_message_language=>'ko'
,p_message_text=>unistr('\ACE0\C720 \AC1C\C218')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140615076661751812)
,p_name=>'APEX.IG.COUNT_DISTINCT_OVERALL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C804\CCB4 \ACE0\C720 \AC1C\C218')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140614980975751812)
,p_name=>'APEX.IG.COUNT_OVERALL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C804\CCB4 \AC1C\C218')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140612661528751811)
,p_name=>'APEX.IG.CREATE_X'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C0DD\C131')
,p_is_js_message=>true
,p_version_scn=>2705148
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140559294645751795)
,p_name=>'APEX.IG.DATA'
,p_message_language=>'ko'
,p_message_text=>unistr('\B370\C774\D130')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140605806988751809)
,p_name=>'APEX.IG.DATA_TYPE'
,p_message_language=>'ko'
,p_message_text=>unistr('\B370\C774\D130 \C720\D615')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140605465761751809)
,p_name=>'APEX.IG.DATE'
,p_message_language=>'ko'
,p_message_text=>unistr('\B0A0\C9DC')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140586870240751804)
,p_name=>'APEX.IG.DATE_INVALID_VALUE'
,p_message_language=>'ko'
,p_message_text=>unistr('\BD80\C801\D569\D55C \B0A0\C9DC \AC12')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140556972533751795)
,p_name=>'APEX.IG.DAYS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C77C')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140559951617751796)
,p_name=>'APEX.IG.DEFAULT_SETTINGS'
,p_message_language=>'ko'
,p_message_text=>unistr('\AE30\BCF8 \C124\C815')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140559769181751796)
,p_name=>'APEX.IG.DEFAULT_TYPE'
,p_message_language=>'ko'
,p_message_text=>unistr('\AE30\BCF8 \C720\D615')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140528752904751786)
,p_name=>'APEX.IG.DELETE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AD\C81C')
,p_is_js_message=>true
,p_version_scn=>2705137
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140606960496751809)
,p_name=>'APEX.IG.DELETE_REPORT_CONFIRM'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774 \BCF4\ACE0\C11C\B97C \C0AD\C81C\D558\ACA0\C2B5\B2C8\AE4C?')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140564352325751797)
,p_name=>'APEX.IG.DELETE_ROW'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589 \C0AD\C81C')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140563160345751797)
,p_name=>'APEX.IG.DELETE_ROWS'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589 \C0AD\C81C')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140600376565751808)
,p_name=>'APEX.IG.DESCENDING'
,p_message_language=>'ko'
,p_message_text=>unistr('\B0B4\B9BC\CC28\C21C')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140562064838751796)
,p_name=>'APEX.IG.DETAIL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C138\BD80\C815\BCF4')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140527284061751786)
,p_name=>'APEX.IG.DETAIL_VIEW'
,p_message_language=>'ko'
,p_message_text=>unistr('\C138\BD80\C815\BCF4 \BCF4\AE30')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140589329996751804)
,p_name=>'APEX.IG.DIRECTION'
,p_message_language=>'ko'
,p_message_text=>unistr('\BC29\D5A5')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140561786694751796)
,p_name=>'APEX.IG.DISABLED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AC\C6A9 \C548\D568')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140556321511751795)
,p_name=>'APEX.IG.DOES_NOT_CONTAIN'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C\C744 \D3EC\D568\D558\C9C0 \C54A\C74C')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140556552462751795)
,p_name=>'APEX.IG.DOES_NOT_START_WITH'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C\C73C\B85C \C2DC\C791\B418\C9C0 \C54A\C74C')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140598631005751807)
,p_name=>'APEX.IG.DONUT'
,p_message_language=>'ko'
,p_message_text=>unistr('\B3C4\B11B')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140562708835751796)
,p_name=>'APEX.IG.DOWNLOAD'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C6B4\B85C\B4DC')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140453031523751764)
,p_name=>'APEX.IG.DOWNLOAD_DATA_ONLY'
,p_message_language=>'ko'
,p_message_text=>unistr('\B370\C774\D130\B9CC')
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140607945270751810)
,p_name=>'APEX.IG.DOWNLOAD_FORMAT'
,p_message_language=>'ko'
,p_message_text=>unistr('\D615\C2DD \C120\D0DD')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140468159928751768)
,p_name=>'APEX.IG.DOWNLOAD_FORMAT_NOT_ENABLED'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C6B4\B85C\B4DC \D615\C2DD %0\C774(\AC00) \C0AC\C6A9\C73C\B85C \C124\C815\B418\C9C0 \C54A\C558\C2B5\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140601097001751808)
,p_name=>'APEX.IG.DUPLICATE_AGGREGATION'
,p_message_language=>'ko'
,p_message_text=>unistr('\C911\BCF5 \C9D1\ACC4')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140601143095751808)
,p_name=>'APEX.IG.DUPLICATE_CONTROLBREAK'
,p_message_language=>'ko'
,p_message_text=>unistr('\C911\BCF5 \C81C\C5B4 \CC28\B2E8')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140564247531751797)
,p_name=>'APEX.IG.DUPLICATE_ROW'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589 \BCF5\C81C')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140563039907751797)
,p_name=>'APEX.IG.DUPLICATE_ROWS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C911\BCF5 \D589')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140528364098751786)
,p_name=>'APEX.IG.EDIT'
,p_message_language=>'ko'
,p_message_text=>unistr('\D3B8\C9D1')
,p_is_js_message=>true
,p_version_scn=>2705137
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140600198853751807)
,p_name=>'APEX.IG.EDIT_CHART'
,p_message_language=>'ko'
,p_message_text=>unistr('\CC28\D2B8 \D3B8\C9D1')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140480644339751772)
,p_name=>'APEX.IG.EDIT_CONTROL'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \D3B8\C9D1')
,p_is_js_message=>true
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140611536343751811)
,p_name=>'APEX.IG.EDIT_GROUP_BY'
,p_message_language=>'ko'
,p_message_text=>unistr('\ADF8\B8F9 \AE30\C900 \D3B8\C9D1')
,p_is_js_message=>true
,p_version_scn=>2705148
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140518720729751784)
,p_name=>'APEX.IG.EDIT_MODE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D3B8\C9D1 \BAA8\B4DC\C758 %0')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140494303905751776)
,p_name=>'APEX.IG.EDIT_MODE_DESCRIPTION'
,p_message_language=>'ko'
,p_message_text=>unistr('\ADF8\B9AC\B4DC\AC00 \D3B8\C9D1 \BAA8\B4DC\C785\B2C8\B2E4. \BCF4\AE30 \BAA8\B4DC\B85C \C804\D658\D558\B824\BA74 \B204\B984 \CDE8\C18C\D569\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140607529901751810)
,p_name=>'APEX.IG.EMAIL_BCC'
,p_message_language=>'ko'
,p_message_text=>unistr('\C228\C740 \CC38\C870(bcc)')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140607702214751810)
,p_name=>'APEX.IG.EMAIL_BODY'
,p_message_language=>'ko'
,p_message_text=>unistr('\BA54\C2DC\C9C0')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140607468806751810)
,p_name=>'APEX.IG.EMAIL_CC'
,p_message_language=>'ko'
,p_message_text=>unistr('\CC38\C870(cc)')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140607194762751809)
,p_name=>'APEX.IG.EMAIL_SENT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C804\C790\BA54\C77C\C774 \C804\C1A1\B418\C5C8\C2B5\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140607618913751810)
,p_name=>'APEX.IG.EMAIL_SUBJECT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C81C\BAA9')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140607337111751810)
,p_name=>'APEX.IG.EMAIL_TO'
,p_message_language=>'ko'
,p_message_text=>unistr('\C218\C2E0\C790(\BC1B\B294 \C0AC\B78C)')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140561424024751796)
,p_name=>'APEX.IG.ENABLED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AC\C6A9')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140554616883751794)
,p_name=>'APEX.IG.EQUALS'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC19\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140561564816751796)
,p_name=>'APEX.IG.EXPRESSION'
,p_message_language=>'ko'
,p_message_text=>unistr('\D45C\D604\C2DD')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140606576482751809)
,p_name=>'APEX.IG.FD_TYPE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C720\D615')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140573722950751800)
,p_name=>'APEX.IG.FILE_PREPARED'
,p_message_language=>'ko'
,p_message_text=>unistr('\D30C\C77C\C774 \C900\BE44\B418\C5C8\C2B5\B2C8\B2E4. \B2E4\C6B4\B85C\B4DC\B97C \C2DC\C791\D558\B294 \C911\C785\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140536015308751789)
,p_name=>'APEX.IG.FILL'
,p_message_language=>'ko'
,p_message_text=>unistr('\CC44\C6B0\AE30')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140538215355751789)
,p_name=>'APEX.IG.FILL_LABEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C\C73C\B85C \C120\D0DD \CC44\C6B0\AE30')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140538121952751789)
,p_name=>'APEX.IG.FILL_TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C120\D0DD \CC44\C6B0\AE30')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140527806620751786)
,p_name=>'APEX.IG.FILTER'
,p_message_language=>'ko'
,p_message_text=>unistr('\D544\D130')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140560863495751796)
,p_name=>'APEX.IG.FILTERS'
,p_message_language=>'ko'
,p_message_text=>unistr('\D544\D130')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140614559765751812)
,p_name=>'APEX.IG.FILTER_WITH_DOTS'
,p_message_language=>'ko'
,p_message_text=>unistr('\D544\D130...')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140600543609751808)
,p_name=>'APEX.IG.FIRST'
,p_message_language=>'ko'
,p_message_text=>unistr('\CCAB\BC88\C9F8')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140528061333751786)
,p_name=>'APEX.IG.FLASHBACK'
,p_message_language=>'ko'
,p_message_text=>unistr('\D50C\B798\C2DC\BC31')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140559359175751795)
,p_name=>'APEX.IG.FORMAT'
,p_message_language=>'ko'
,p_message_text=>unistr('\D615\C2DD')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140605192652751809)
,p_name=>'APEX.IG.FORMATMASK'
,p_message_language=>'ko'
,p_message_text=>unistr('\D615\C2DD \B9C8\C2A4\D06C')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140606815959751809)
,p_name=>'APEX.IG.FORMAT_CSV'
,p_message_language=>'ko'
,p_message_text=>'CSV'
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140606761151751809)
,p_name=>'APEX.IG.FORMAT_HTML'
,p_message_language=>'ko'
,p_message_text=>'HTML'
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140517822044751783)
,p_name=>'APEX.IG.FORMAT_PDF'
,p_message_language=>'ko'
,p_message_text=>'PDF'
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140451754854751764)
,p_name=>'APEX.IG.FORMAT_XLSX'
,p_message_language=>'ko'
,p_message_text=>'Excel'
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140563996520751797)
,p_name=>'APEX.IG.FREEZE'
,p_message_language=>'ko'
,p_message_text=>unistr('\ACE0\C815')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140561696804751796)
,p_name=>'APEX.IG.FUNCTIONS_AND_OPERATORS'
,p_message_language=>'ko'
,p_message_text=>unistr('\D568\C218 \BC0F \C5F0\C0B0\C790')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140598755840751807)
,p_name=>'APEX.IG.FUNNEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\D37C\B110')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140580454575751802)
,p_name=>'APEX.IG.GO'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2E4\D589')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140555211620751794)
,p_name=>'APEX.IG.GREATER_THAN'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\B2E4 \D07C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140555393236751794)
,p_name=>'APEX.IG.GREATER_THAN_OR_EQUALS'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\B2E4 \D06C\AC70\B098 \AC19\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140561983563751796)
,p_name=>'APEX.IG.GRID'
,p_message_language=>'ko'
,p_message_text=>unistr('\ADF8\B9AC\B4DC')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140527031006751786)
,p_name=>'APEX.IG.GRID_VIEW'
,p_message_language=>'ko'
,p_message_text=>unistr('\ADF8\B9AC\B4DC \BDF0')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140601364559751808)
,p_name=>'APEX.IG.GROUP'
,p_message_language=>'ko'
,p_message_text=>unistr('\ADF8\B8F9')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140562146043751796)
,p_name=>'APEX.IG.GROUP_BY'
,p_message_language=>'ko'
,p_message_text=>unistr('\ADF8\B8F9 \AE30\C900')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140527340588751786)
,p_name=>'APEX.IG.GROUP_BY_VIEW'
,p_message_language=>'ko'
,p_message_text=>unistr('\ADF8\B8F9 \AE30\C900 \BCF4\AE30')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140605759990751809)
,p_name=>'APEX.IG.HD_TYPE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C870\AC74 \C720\D615')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140604690534751809)
,p_name=>'APEX.IG.HEADING'
,p_message_language=>'ko'
,p_message_text=>unistr('\BA38\B9AC\AE00')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140604866328751809)
,p_name=>'APEX.IG.HEADING_ALIGN'
,p_message_language=>'ko'
,p_message_text=>unistr('\BA38\B9AC\AE00 \B9DE\CDA4')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140614464063751812)
,p_name=>'APEX.IG.HELP'
,p_message_language=>'ko'
,p_message_text=>unistr('\B3C4\C6C0\B9D0')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140609907751751810)
,p_name=>'APEX.IG.HELP.ACTIONS.EDITING'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\C774 \B300\D654\C2DD \ADF8\B9AC\B4DC\C5D0\C11C \B370\C774\D130\B97C \C9C1\C811 \C0BD\C785, \C5C5\B370\C774\D2B8 \BC0F \C0AD\C81C\D560 \C218 \C788\C2B5\B2C8\B2E4.</p>'),
'',
unistr('<p>\D589 \CD94\AC00 \B2E8\CD94\B97C \B20C\B7EC\C11C \C0C8 \D589\C744 \C0BD\C785\D569\B2C8\B2E4.</p>'),
'',
unistr('<p>\D2B9\C815 \C140\C744 \B450 \BC88 \B20C\B7EC\C11C \AE30\C874 \B370\C774\D130\B97C \D3B8\C9D1\D569\B2C8\B2E4. \B300\ADDC\BAA8 \D3B8\C9D1 \C791\C5C5\C758 \ACBD\C6B0 \D3B8\C9D1\C744 \B20C\B7EC\C11C \D3B8\C9D1 \BAA8\B4DC\B85C \C804\D658\D569\B2C8\B2E4. \D3B8\C9D1 \BAA8\B4DC\C5D0\C11C \C140\C744 \D55C \BC88 \B204\B974\AC70\B098 \D0A4\BCF4\B4DC\B97C \C0AC\C6A9\D558\C5EC \D2B9\C815 \C140\C744 \D3B8\C9D1\D560 \C218 \C788\C2B5\B2C8\B2E4.</p>'),
'',
unistr('<p>\BCC0\ACBD \BA54\B274\B97C \C0AC\C6A9\D558\C5EC \D589\C744 \BCF5\C81C\D558\AC70\B098 \C0AD\C81C\D569\B2C8\B2E4. \BCC0\ACBD \BA54\B274\B97C \C0AC\C6A9\C73C\B85C \C124\C815\D558\B824\BA74 \CCB4\D06C\BC15\C2A4\B97C \C120\D0DD\D558\C5EC \D558\B098 \C774\C0C1\C758 \D589\C744 \C120\D0DD\D569\B2C8\B2E4.</p>'),
'',
unistr('<p>\BCC0\ACBD \BA54\B274\B97C \B204\B974\ACE0 \D589 \BCF5\C81C\B97C \C120\D0DD\D558\C5EC \C120\D0DD\D55C \D589\C744 \BCF5\C81C\D569\B2C8\B2E4. \BCC0\ACBD \BA54\B274\B97C \B204\B974\ACE0 \D589 \C0AD\C81C\B97C \C120\D0DD\D558\C5EC \C120\D0DD\D55C \D589\C744 \C0AD\C81C\D569\B2C8\B2E4.</p>')))
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140612033944751811)
,p_name=>'APEX.IG.HELP.ACTIONS.EDITING_HEADING'
,p_message_language=>'ko'
,p_message_text=>unistr('\AE30\B2A5 \D3B8\C9D1')
,p_version_scn=>2705148
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140612184600751811)
,p_name=>'APEX.IG.HELP.ACTIONS.INTRO'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\B300\D654\C2DD \ADF8\B9AC\B4DC\C5D0\B294 \B370\C774\D130 \C138\D2B8\AC00 \AC80\C0C9 \AC00\B2A5\D55C \C0AC\C6A9\C790\C815\C758 \BCF4\ACE0\C11C\B85C \D45C\C2DC\B429\B2C8\B2E4. \BC18\D658\B418\B294 \B808\CF54\B4DC\B97C \C81C\D55C\D558\ACE0 \B370\C774\D130 \D45C\C2DC \BC29\BC95\C744 \BCC0\ACBD\D558\B294 \B2E4\C591\D55C \C791\C5C5\C744 \C218\D589\D560 \C218 \C788\C2B5\B2C8\B2E4.</p>'),
'',
unistr('<p>\AC80\C0C9 \D544\B4DC\B97C \C0AC\C6A9\D558\C5EC \BC18\D658\B418\B294 \B808\CF54\B4DC\B97C \D544\D130\B9C1\D569\B2C8\B2E4. \C791\C5C5\C744 \B20C\B7EC\C11C \BCF4\ACE0\C11C \B808\C774\C544\C6C3\C744 \C218\C815\D560 \C218 \C788\B294 \B2E4\C591\D55C \C635\C158\C5D0 \C561\C138\C2A4\D558\AC70\B098, \D45C\C2DC\B41C \C5F4\C5D0\C11C \C5F4 \BA38\B9AC\AE00 \BA54\B274\B97C \C0AC\C6A9\D569\B2C8\B2E4.</p>'),
'',
unistr('<p>\BCF4\ACE0\C11C \C124\C815\C744 \C0AC\C6A9\D558\C5EC \C0AC\C6A9\C790\C815\C758\B97C \BCF4\ACE0\C11C\C5D0 \C800\C7A5\D569\B2C8\B2E4. \BCF4\ACE0\C11C\C758 \B370\C774\D130\B97C \C678\BD80 \D30C\C77C\B85C \B2E4\C6B4\B85C\B4DC\D558\AC70\B098 \B370\C774\D130\B97C \B098 \C790\C2E0\C774\B098 \B2E4\B978 \C0AC\C6A9\C790\C5D0\AC8C \C804\C790\BA54\C77C\B85C \BCF4\B0BC \C218 \C788\C2B5\B2C8\B2E4.</p>'),
'',
unistr('<p>\C790\C138\D55C \B0B4\C6A9\C740 <em>Oracle APEX End User''s Guide</em>\C758 "Using Interactive Grids"\B97C \CC38\C870\D558\C2ED\C2DC\C624.')))
,p_version_scn=>2705148
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140611814300751811)
,p_name=>'APEX.IG.HELP.ACTIONS.INTRO_HEADING'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC1C\C694')
,p_version_scn=>2705148
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140609839947751810)
,p_name=>'APEX.IG.HELP.ACTIONS.REPORTING'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\B0B4\C7A5 \AE30\B2A5\C744 \C0AC\C6A9\D558\C5EC \B370\C774\D130\B97C \B2E4\C591\D55C \BC29\C2DD\C73C\B85C \D45C\C2DC\D558\B3C4\B85D \B300\D654\C2DD \ADF8\B9AC\B4DC\B97C \C0AC\C6A9\C790\AC00 \C815\C758\D560 \C218 \C788\C2B5\B2C8\B2E4.</p>'),
'',
unistr('<p>\C5F4 \BA38\B9AC\AE00 \BA54\B274 \B610\B294 \C791\C5C5 \BA54\B274\B97C \C0AC\C6A9\D558\C5EC \D45C\C2DC\D560 \C5F4 \BC0F \C21C\C11C\B97C \ACB0\C815\D558\ACE0 \C5F4\C744 \ACE0\C815\D569\B2C8\B2E4. \B2E4\C591\D55C \B370\C774\D130 \D544\D130\B97C \C815\C758\D558\ACE0 \BC18\D658\B418\B294 \B370\C774\D130\B97C \C815\B82C\D560 \C218\B3C4 \C788\C2B5\B2C8\B2E4.</p>'),
'',
unistr('<p>\AC80\C0C9 \D544\B4DC \C606\C5D0 \C788\B294 \BCF4\AE30 \B2E8\CD94\B97C \C0AC\C6A9\D558\C5EC \C560\D50C\B9AC\CF00\C774\C158 \AC1C\BC1C\C790\AC00 \C815\C758\D55C \B2E4\B978 \B370\C774\D130 \BCF4\AE30\C5D0 \C561\C138\C2A4\D560 \C218 \C788\C2B5\B2C8\B2E4. \CC28\D2B8\B97C \C0DD\C131\D558\AC70\B098 \AE30\C874 \CC28\D2B8\B97C \C870\D68C\D560 \C218\B3C4 \C788\C2B5\B2C8\B2E4.</p>  '),
'',
unistr('<p><em>\CC38\ACE0: \B300\D654\C2DD \ADF8\B9AC\B4DC \B300\D654\C0C1\C790\C5D0\C11C <strong>\B3C4\C6C0\B9D0</strong>\C744 \B20C\B7EC\C11C \C120\D0DD\D55C \D568\C218\C5D0 \B300\D55C \C138\BD80\C815\BCF4\B97C \D655\C778\D560 \C218 \C788\C2B5\B2C8\B2E4.</em></p>')))
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140611997759751811)
,p_name=>'APEX.IG.HELP.ACTIONS.REPORTING_HEADING'
,p_message_language=>'ko'
,p_message_text=>unistr('\AE30\B2A5 \BCF4\ACE0')
,p_version_scn=>2705148
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140562907333751796)
,p_name=>'APEX.IG.HELP.ACTIONS_TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\B300\D654\C2DD \ADF8\B9AC\B4DC \B3C4\C6C0\B9D0')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140608770038751810)
,p_name=>'APEX.IG.HELP.AGGREGATE'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\C774 \B300\D654\C0C1\C790\B97C \C0AC\C6A9\D558\C5EC \C5F4\C744 \C9D1\ACC4\D569\B2C8\B2E4. \C9D1\ACC4\B41C \AC12\C740 \B370\C774\D130 \D558\B2E8 \B610\B294 \AC01 \AD6C\BD84\C120 \D558\B2E8(\C81C\C5B4 \CC28\B2E8\C774 \C815\C758\B418\C5B4 \C788\B294 \ACBD\C6B0)\C5D0 \D45C\C2DC\B429\B2C8\B2E4.</p>'),
'',
unistr('<p><strong>\C9D1\ACC4 \BAA9\B85D</strong><br>'),
unistr('\C9D1\ACC4 \BAA9\B85D\C5D0\B294 \C815\C758\B41C \C9D1\ACC4\AC00 \D45C\C2DC\B429\B2C8\B2E4. \C9D1\ACC4\B97C \C120\D0DD \D574\C81C\D558\C5EC \AE30\C874 \C9D1\ACC4\B97C \C0AC\C6A9 \C548\D568\C73C\B85C \C124\C815\D569\B2C8\B2E4.<br>'),
unistr('\C0C8 \C9D1\ACC4\B97C \C0DD\C131\D558\B824\BA74 \CD94\AC00( &plus; )\B97C \B204\B974\ACE0 \AE30\C874 \C9D1\ACC4\B97C \C81C\AC70\D558\B824\BA74 \C0AD\C81C( &minus; )\B97C \B204\B985\B2C8\B2E4.</p>'),
'',
unistr('<p><strong>\C9D1\ACC4 \C124\C815</strong><br>'),
unistr('\C624\B978\CABD\C5D0 \C788\B294 \D3FC\C744 \C0AC\C6A9\D558\C5EC \C9D1\ACC4\B97C \C815\C758\D569\B2C8\B2E4.<br>'),
unistr('\C5F4 \C774\B984\ACFC \C9D1\ACC4 \C720\D615\C744 \C120\D0DD\D569\B2C8\B2E4.<br>'),
unistr('\C9D1\ACC4\C5D0 \B300\D55C \B3C4\AD6C \C124\BA85\C744 \C785\B825\D569\B2C8\B2E4(\C120\D0DD\C0AC\D56D).<br>'),
unistr('\C81C\C5B4 \CC28\B2E8\C744 \C815\C758\D55C \ACBD\C6B0 <strong>\C804\CCB4 \AC12 \D45C\C2DC</strong>\B97C \C120\D0DD\D558\BA74 \B370\C774\D130 \D558\B2E8\C5D0 \C804\CCB4 \D3C9\ADE0, \CD1D\ACC4 \B610\B294 \C774\C640 \C720\C0AC\D55C \AC12\C774 \D45C\C2DC\B429\B2C8\B2E4.</p>'),
'',
unistr('<p><em>\CC38\ACE0: \C5F4 \BA38\B9AC\AE00 \BC0F \D569\ACC4( &sum; )\B97C \B204\B974\AC70\B098 \C791\C5C5 \BA54\B274\C5D0\C11C \C9D1\ACC4 \B300\D654\C0C1\C790\C5D0 \C561\C138\C2A4\D569\B2C8\B2E4.</em></p>')))
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140610996109751811)
,p_name=>'APEX.IG.HELP.AGGREGATE_TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9D1\ACC4 \B3C4\C6C0\B9D0')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140609401075751810)
,p_name=>'APEX.IG.HELP.CHART'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\C774 \B300\D654\C0C1\C790\B97C \C0AC\C6A9\D558\C5EC \BCC4\B3C4\C758 \B370\C774\D130 \BCF4\AE30\B85C \D45C\C2DC\B418\B294 \CC28\D2B8\B97C \C815\C758\D569\B2C8\B2E4.<br>'),
unistr('\CC28\D2B8 \C720\D615\ACFC \CC28\D2B8 \C18D\C131\C744 \C120\D0DD\D569\B2C8\B2E4.</p>'),
unistr('<p><strong>\CC28\D2B8 \C18D\C131</strong><br>'),
unistr('\C0AC\C6A9 \AC00\B2A5\D55C \CC28\D2B8 \C18D\C131\C740 \CC28\D2B8 \C720\D615\C5D0 \B530\B77C \B2E4\B985\B2C8\B2E4.</p>'),
'<p>',
'<ul>',
unistr('  <li>\C18D\C131 \AC12\C744 \D3EC\D568\D558\B294 \C5F4\C744 \C120\D0DD\D569\B2C8\B2E4.'),
'    <ul>',
unistr('      <li>\B808\C774\BE14 - \AC01 \B370\C774\D130 \D3EC\C778\D2B8\C5D0 \B300\D55C \D14D\C2A4\D2B8.</li>'),
unistr('      <li>\AC12 - \AD6C\D68D\D560 \B370\C774\D130.</li>'),
unistr('      <li>\ACC4\C5F4 - \B2E4\C911 \ACC4\C5F4 \B3D9\C801 \C9C8\C758\B97C \C815\C758\D560 \BAA9\C801.</li>'),
unistr('      <li>\C2DC\AC00 - \C77C\BCC4 \C8FC\C2DD \AC1C\C7A5 \AC00\ACA9(\C8FC\C2DD \C804\C6A9).</li>'),
unistr('      <li>\C885\AC00 - \C77C\BCC4 \C8FC\C2DD \B9C8\AC10 \AC00\ACA9(\C8FC\C2DD \C804\C6A9).</li>'),
unistr('      <li>\ACE0\AC00 - \C0C1\C704 \AC12(\BC94\C704 \BC0F \C8FC\C2DD \C804\C6A9).</li>'),
unistr('      <li>\C800\AC00 - \D558\C704 \AC12(\BC94\C704 \BC0F \C8FC\C2DD \C804\C6A9).</li>'),
unistr('      <li>\AC70\B798\B7C9 - \C77C\BCC4 \C8FC\C2DD \AC70\B798\B7C9(\C8FC\C2DD \C804\C6A9).</li>'),
unistr('      <li>\BAA9\D45C - \BAA9\D45C \AC12(\D37C\B110 \C804\C6A9).</li>'),
unistr('      <li>X - x\CD95 \AC12(\BC84\BE14 \BC0F \C0B0\D3EC \C804\C6A9).</li>'),
unistr('      <li>Y - y\CD95 \AC12(\BC84\BE14 \BC0F \C0B0\D3EC \C804\C6A9).</li>'),
unistr('      <li>Z - \B9C9\B300 \B108\BE44 \B610\B294 \BC84\BE14 \BC18\C9C0\B984(\B9C9\B300, \BC84\BE14 \BC0F \BC94\C704 \C804\C6A9).</li>'),
'    </ul>',
'  </li>',
unistr('  <li>\BC29\D5A5 - \C138\B85C \B610\B294 \AC00\B85C.</li>'),
unistr('  <li>\C9D1\ACC4 - \CC28\D2B8 \AC12\C744 \C9D1\ACC4\D558\B294 \BC29\BC95\C744 \C120\D0DD\D569\B2C8\B2E4.</li>'),
unistr('  <li>\C2A4\D0DD - \B370\C774\D130 \D56D\BAA9\C774 \B204\C801\B418\B294\C9C0 \C5EC\BD80\B97C \C9C0\C815\D569\B2C8\B2E4.</li>'),
unistr('  <li>\C815\B82C \AE30\C900 - \B808\C774\BE14 \B610\B294 \AC12\C744 \AE30\C900\C73C\B85C \C815\B82C\D569\B2C8\B2E4.'),
'    <ul>',
unistr('      <li>\BC29\D5A5 - \C624\B984\CC28\C21C \B610\B294 \B0B4\B9BC\CC28\C21C\C73C\B85C \AC12\C744 \C815\B82C\D569\B2C8\B2E4.</li>'),
unistr('      <li>\B110 - \B110\C774 \C544\B2CC \AC12\C744 \AC00\C9C4 \B808\CF54\B4DC\B97C \AE30\C900\C73C\B85C \B110 \AC12\C744 \AC00\C9C4 \B808\CF54\B4DC\B97C \C815\B82C\D560 \BC29\BC95\C744 \C9C0\C815\D569\B2C8\B2E4.</li>'),
'    </ul>',
'  </li>',
unistr('  <li>\C18C\C218\C810 \C790\B9AC</li>'),
unistr('  <li>\B808\C774\BE14 \CD95 \C81C\BAA9</li>'),
unistr('  <li>\AC12 \CD95 \C81C\BAA9</li>'),
'</ul>',
'</p>'))
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140611321987751811)
,p_name=>'APEX.IG.HELP.CHART_TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\CC28\D2B8 \B3C4\C6C0\B9D0')
,p_is_js_message=>true
,p_version_scn=>2705148
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140608406780751810)
,p_name=>'APEX.IG.HELP.COLUMNS'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\C774 \B300\D654\C0C1\C790\B97C \C0AC\C6A9\D558\C5EC \D45C\C2DC\B418\B294 \C5F4 \BC0F \C21C\C11C\B97C \C120\D0DD\D569\B2C8\B2E4.</p>'),
'',
unistr('<p>\C5F4\C744 \C120\D0DD \D574\C81C\D558\C5EC \C228\AE41\B2C8\B2E4.<br>'),
unistr('\C704\B85C \C774\B3D9( &uarr; ) \B610\B294 \C544\B798\B85C \C774\B3D9( &darr; )\C744 \B20C\B7EC\C11C \C5F4\C744 \C7AC\C815\B82C\D569\B2C8\B2E4.<br>'),
unistr('\B4DC\B86D\B2E4\C6B4 \C120\D0DD\AE30\B97C \C0AC\C6A9\D558\C5EC \BAA8\B4E0 \C5F4, \D45C\C2DC\B41C \C5F4 \B610\B294 \D45C\C2DC\B418\C9C0 \C54A\C740 \C5F4\C744 \B098\C5F4\D569\B2C8\B2E4.</p>'),
'',
unistr('<p>\D3FC\C744 \C0AC\C6A9\D558\C5EC \C5F4\C758 \CD5C\C18C \B108\BE44(\D53D\C140)\B97C \C9C0\C815\D569\B2C8\B2E4(\C120\D0DD\C0AC\D56D).</p>'),
'',
unistr('<p><em>\CC38\ACE0: \C5F4 \BA38\B9AC\AE00\C758 \B9E8 \C55E\C5D0 \C788\B294 \B04C\AE30 \D578\B4E4\C744 \B204\B974\ACE0 \C5F4\C744 \C67C\CABD \B610\B294 \C624\B978\CABD\C73C\B85C \B04C\C5B4\C11C \D45C\C2DC\B41C \C5F4\C744 \C7AC\C815\B82C\D560 \C218\B3C4 \C788\C2B5\B2C8\B2E4. \BA38\B9AC\AE00 \C0AC\C774\C758 \C5F4 \AD6C\BD84 \AE30\D638\B97C \C120\D0DD\D558\ACE0 \C67C\CABD \B610\B294 \C624\B978\CABD\C73C\B85C \C774\B3D9\D558\C5EC \D45C\C2DC\B41C \C5F4\C758 \B108\BE44\B97C \BCC0\ACBD\D560 \C218\B3C4 \C788\C2B5\B2C8\B2E4.</em></p>')))
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140611279253751811)
,p_name=>'APEX.IG.HELP.COLUMNS_TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F4 \B3C4\C6C0\B9D0')
,p_is_js_message=>true
,p_version_scn=>2705148
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140608817611751810)
,p_name=>'APEX.IG.HELP.COMPUTE'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\C774 \B300\D654\C0C1\C790\B97C \C0AC\C6A9\D558\C5EC \AE30\C874 \C5F4\C5D0 \B300\D574 \C218\D589\B41C \C218\D559 \BC0F \D568\C218 \ACC4\C0B0\C744 \AE30\C900\C73C\B85C \CD94\AC00 \C5F4\C744 \C815\C758\D569\B2C8\B2E4.</p>'),
'',
unistr('<p><strong>\ACC4\C0B0 \BAA9\B85D</strong><br>'),
unistr('\ACC4\C0B0 \BAA9\B85D\C5D0\B294 \C815\C758\B41C \ACC4\C0B0\C774 \D45C\C2DC\B429\B2C8\B2E4. \ACC4\C0B0\C744 \C120\D0DD \D574\C81C\D558\C5EC \AE30\C874 \ACC4\C0B0\C744 \C0AC\C6A9 \C548\D568\C73C\B85C \C124\C815\D569\B2C8\B2E4.<br>'),
unistr('\C0C8 \ACC4\C0B0\C744 \CD94\AC00\D558\B824\BA74 \CD94\AC00( &plus; )\B97C \B204\B974\ACE0, \AE30\C874 \ACC4\C0B0\C744 \C81C\AC70\D558\B824\BA74 \C0AD\C81C( &minus; )\B97C \B204\B985\B2C8\B2E4.</p>'),
'',
unistr('<p><strong>\ACC4\C0B0 \C124\C815</strong><br>'),
unistr('\D3FC\C744 \C0AC\C6A9\D558\C5EC \ACC4\C0B0\C744 \C815\C758\D569\B2C8\B2E4.<br>'),
unistr('\C5F4 \C138\BD80\C815\BCF4(\C608: \BA38\B9AC\AE00, \B808\C774\BE14)\B97C \C785\B825\D558\ACE0 \C815\B82C \C124\C815\C744 \C120\D0DD\D569\B2C8\B2E4.<br> '),
unistr('\D45C\D604\C2DD \D14D\C2A4\D2B8 \C601\C5ED\C744 \C0AC\C6A9\D558\C5EC \ACC4\C0B0\C744 \C704\D55C \C5F4 \BC0F \C5F0\ACB0\B41C \D568\C218\B97C \C785\B825\D569\B2C8\B2E4.<br>'),
unistr('\C0C8 \C5F4\C5D0 \B300\D574 \C801\D569\D55C \B370\C774\D130 \C720\D615 \BC0F \D615\C2DD \B9C8\C2A4\D06C(\C120\D0DD\C0AC\D56D)\B97C \C120\D0DD\D569\B2C8\B2E4.</p>')))
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140610870403751811)
,p_name=>'APEX.IG.HELP.COMPUTE_TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\ACC4\C0B0 \B3C4\C6C0\B9D0')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140609182947751810)
,p_name=>'APEX.IG.HELP.CONTROL_BREAK'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\C774 \B300\D654\C0C1\C790\B97C \C0AC\C6A9\D558\C5EC \D558\B098 \C774\C0C1\C758 \C5F4\C5D0 \B300\D55C \C81C\C5B4 \CC28\B2E8\C744 \C815\C758\D569\B2C8\B2E4.</p>'),
'',
unistr('<p><strong>\C81C\C5B4 \CC28\B2E8 \BAA9\B85D</strong><br>'),
unistr('\C81C\C5B4 \CC28\B2E8 \BAA9\B85D\C5D0\B294 \C815\C758\B41C \C81C\C5B4 \CC28\B2E8\C774 \D45C\C2DC\B429\B2C8\B2E4. \C81C\C5B4 \CC28\B2E8 \C5F4\C744 \C120\D0DD \D574\C81C\D558\C5EC \AE30\C874 \C81C\C5B4 \CC28\B2E8 \C5F4\C744 \C0AC\C6A9 \C548\D568\C73C\B85C \C124\C815\D569\B2C8\B2E4.<br>'),
unistr('\C81C\C5B4 \CC28\B2E8\C5D0 \C0C8 \C5F4\C744 \D3EC\D568\D558\B824\BA74 \CD94\AC00( &plus; )\B97C \B204\B974\ACE0, \C81C\C5B4 \CC28\B2E8\C5D0\C11C \AE30\C874 \C5F4\C744 \C81C\AC70\D558\B824\BA74 \C0AD\C81C( &minus; )\B97C \B204\B985\B2C8\B2E4.<br>'),
unistr('\C5F4\C744 \C7AC\C815\B82C\D558\B824\BA74 \C704\B85C \C774\B3D9( &uarr; ) \B610\B294 \C544\B798\B85C \C774\B3D9( &darr; )\C744 \B20C\B7EC\C11C \B2E4\B978 \C5F4\C744 \AE30\C900\C73C\B85C \C120\D0DD\B41C \C5F4\C744 \C704 \B610\B294 \C544\B798\B85C \C774\B3D9\D569\B2C8\B2E4.</p>'),
'',
unistr('<p><strong>\C81C\C5B4 \CC28\B2E8 \C124\C815</strong><br>'),
unistr('\D3FC\C744 \C0AC\C6A9\D558\C5EC \C81C\C5B4 \CC28\B2E8 \C5F4\C744 \C815\C758\D569\B2C8\B2E4.<br>'),
unistr('\C81C\C5B4 \CC28\B2E8 \C5F4, \C815\B82C \BC29\D5A5 \BC0F \B110 \C5F4(\AC12\C774 \C5C6\B294 \C5F4) \C815\B82C \BC29\BC95\C744 \C120\D0DD\D569\B2C8\B2E4.</p>'),
'',
unistr('<p><em>\CC38\ACE0: \B300\D654\C2DD \ADF8\B9AC\B4DC\B97C \C870\D68C\D560 \B54C \C5F4 \BA38\B9AC\AE00\C744 \B204\B974\ACE0 \C81C\C5B4 \CC28\B2E8 \C544\C774\CF58\C744 \C120\D0DD\D558\C5EC \C81C\C5B4 \CC28\B2E8\C744 \C815\C758\D560 \C218 \C788\C2B5\B2C8\B2E4.</em></p>')))
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140610570193751811)
,p_name=>'APEX.IG.HELP.CONTROL_BREAK_TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C81C\C5B4 \CC28\B2E8 \B3C4\C6C0\B9D0')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140609356813751810)
,p_name=>'APEX.IG.HELP.DOWNLOAD'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\C774 \B300\D654\C0C1\C790\B97C \C0AC\C6A9\D558\C5EC \BAA8\B4E0 \D604\C7AC \D589\C744 \C678\BD80 \D30C\C77C\B85C \B2E4\C6B4\B85C\B4DC\D569\B2C8\B2E4. \B370\C774\D130\C5D0 \C801\C6A9\B41C \D544\D130\C640 \C815\B82C\C744 \C0AC\C6A9\D558\C5EC \D30C\C77C\C5D0\B294 \D604\C7AC \D45C\C2DC\B41C \C5F4\B9CC \D3EC\D568\B429\B2C8\B2E4.</p>'),
'',
unistr('<p>\D30C\C77C \D615\C2DD\C744 \C120\D0DD\D558\ACE0 \B2E4\C6B4\B85C\B4DC\B97C \B204\B985\B2C8\B2E4.<br>'),
unistr('\CC38\ACE0: CSV\C5D0\B294 \D14D\C2A4\D2B8 \D615\C2DD(\C608: \C9D1\ACC4 \BC0F \C81C\C5B4 \CC28\B2E8)\C740 \D3EC\D568\B418\C9C0 \C54A\C2B5\B2C8\B2E4.</p>'),
'',
unistr('<p>\D30C\C77C\C744 \C804\C790\BA54\C77C\B85C \BCF4\B0B4\B824\BA74 \C804\C790\BA54\C77C\B85C \C804\C1A1\C744 \C120\D0DD\D558\ACE0 \C804\C790\BA54\C77C \C138\BD80\C815\BCF4(\C218\C2E0\C790, \C81C\BAA9, \BA54\C2DC\C9C0)\B97C \C785\B825\D569\B2C8\B2E4.</p>')))
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140610334718751810)
,p_name=>'APEX.IG.HELP.DOWNLOAD_TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C6B4\B85C\B4DC \B3C4\C6C0\B9D0')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140608521610751810)
,p_name=>'APEX.IG.HELP.FILTER'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\C774 \B300\D654\C0C1\C790\B97C \C0AC\C6A9\D558\C5EC \BC18\D658\B418\B294 \D589\C744 \C81C\D55C\D558\B294 \B370\C774\D130 \D544\D130\B97C \AD6C\C131\D569\B2C8\B2E4.</p>'),
'',
unistr('<p><strong>\D544\D130 \BAA9\B85D</strong><br>'),
unistr('\D544\D130 \BAA9\B85D\C740 \C815\C758\B41C \D544\D130\B97C \D45C\C2DC\D569\B2C8\B2E4. \D544\D130\B97C \C120\D0DD \D574\C81C\D558\C5EC \AE30\C874 \D544\D130\B97C \C0AC\C6A9 \C548\D568\C73C\B85C \C124\C815\D569\B2C8\B2E4.<br>'),
unistr('\C0C8 \D544\D130\B97C \C0DD\C131\D558\B824\BA74 \CD94\AC00( &plus; )\B97C \B204\B974\ACE0, \AE30\C874 \D544\D130\B97C \C81C\AC70\D558\B824\BA74 \C0AD\C81C( &minus; )\B97C \B204\B985\B2C8\B2E4.</p>'),
'',
unistr('<p><strong>\D544\D130 \C124\C815</strong><br>'),
unistr('\D3FC\C744 \C0AC\C6A9\D558\C5EC \D544\D130 \C18D\C131\C744 \C815\C758\D569\B2C8\B2E4.<br>'),
unistr('\C801\D569\D55C \D544\D130 \C720\D615\C744 \C120\D0DD\D569\B2C8\B2E4.<br>'),
unistr('&nbsp;&nbsp;&nbsp;\D589 - \D544\D130\B9C1 \AC00\B2A5\D55C \C5F4\C758 \C6A9\C5B4\C5D0 \B300\D574 \D544\D130\B9C1\D569\B2C8\B2E4.<br>'),
unistr('&nbsp;&nbsp;&nbsp;\C5F4 - \C9C0\C815\B41C \C5F0\C0B0\C790\C640 \AC12\C744 \C0AC\C6A9\D558\C5EC \D2B9\C815 \C5F4\C744 \D544\D130\B9C1\D569\B2C8\B2E4.</p>'),
'',
unistr('<p><em>\CC38\ACE0: \B300\D654\C2DD \ADF8\B9AC\B4DC\B97C \C870\D68C\D560 \B54C \AC80\C0C9 \D544\B4DC\C5D0 \C9C1\C811 \C785\B825\D558\C5EC \D589 \D544\D130\B97C \C815\C758\D560 \C218 \C788\C2B5\B2C8\B2E4. [\AC80\C0C9\D560 \C5F4 \C120\D0DD]\C744 \B20C\B7EC\C11C \AC80\C0C9\C744 \D2B9\C815 \C5F4\B85C \C81C\D55C\D560 \C218 \C788\C2B5\B2C8\B2E4. \B610\B294 \C5F4 \BA38\B9AC\AE00 \BA54\B274\B97C \C5F4\ACE0 \C5F4 \D544\D130\B97C \C0DD\C131\D560 \AC12\C744 \C120\D0DD\D569\B2C8\B2E4.</em></p>')))
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140611127743751811)
,p_name=>'APEX.IG.HELP.FILTER_TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D544\D130 \B3C4\C6C0\B9D0')
,p_is_js_message=>true
,p_version_scn=>2705148
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140608925935751810)
,p_name=>'APEX.IG.HELP.FLASHBACK'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\C774 \B300\D654\C0C1\C790\B97C \C0AC\C6A9\D558\C5EC \B370\C774\D130\B97C \C774\C804 \C2DC\C810\C5D0 \C874\C7AC\D55C \ADF8\B300\B85C \BCFC \C218 \C788\C2B5\B2C8\B2E4.</p>'),
unistr('<p>\C774\C804 \C2DC\AC04(\BD84)\C744 \C785\B825\D558\C5EC \D50C\B798\C2DC\BC31 \C9C8\C758\B97C \C2E4\D589\D569\B2C8\B2E4.</p>')))
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140610773252751811)
,p_name=>'APEX.IG.HELP.FLASHBACK_TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D50C\B798\C2DC\BC31 \B3C4\C6C0\B9D0')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140611404092751811)
,p_name=>'APEX.IG.HELP.GROUP_BY_TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\ADF8\B8F9 \AE30\C900 \B3C4\C6C0\B9D0')
,p_is_js_message=>true
,p_version_scn=>2705148
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140609009140751810)
,p_name=>'APEX.IG.HELP.HIGHLIGHT'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\C774 \B300\D654\C0C1\C790\B97C \C0AC\C6A9\D558\C5EC \C785\B825\B41C \C870\AC74\C744 \AE30\C900\C73C\B85C \B370\C774\D130 \D589 \B610\B294 \C5F4\C744 \AC15\C870 \D45C\C2DC\D569\B2C8\B2E4.</p>'),
'',
unistr('<p><strong>\AC15\C870 \D45C\C2DC \BAA9\B85D</strong><br>'),
unistr('\AC15\C870 \D45C\C2DC \BAA9\B85D\C5D0\B294 \C815\C758\B41C \AC15\C870 \D45C\C2DC\AC00 \D45C\C2DC\B429\B2C8\B2E4. \AC15\C870 \D45C\C2DC\B97C \C120\D0DD \D574\C81C\D558\C5EC \AE30\C874 \AC15\C870 \D45C\C2DC\B97C \C0AC\C6A9 \C548\D568\C73C\B85C \C124\C815\D569\B2C8\B2E4.<br>'),
unistr('\C0C8 \AC15\C870 \D45C\C2DC\B97C \C0DD\C131\D558\B824\BA74 \CD94\AC00( &plus; )\B97C \B204\B974\ACE0 \AE30\C874 \AC15\C870 \D45C\C2DC\B97C \C81C\AC70\D558\B824\BA74 \C0AD\C81C( &minus; )\B97C \B204\B985\B2C8\B2E4.</p>'),
'',
unistr('<p><strong>\AC15\C870 \D45C\C2DC \C124\C815</strong><br>'),
unistr('\D3FC\C744 \C0AC\C6A9\D558\C5EC \AC15\C870 \D45C\C2DC \C18D\C131\C744 \C815\C758\D569\B2C8\B2E4.<br>'),
unistr('\C774\B984\C744 \C785\B825\D558\ACE0, \D589 \B610\B294 \C5F4\C744 \C120\D0DD\D558\ACE0, \BC30\ACBD \BC0F \D14D\C2A4\D2B8\C5D0 \B300\D55C HTML \C0C9\C0C1 \CF54\B4DC\B97C \C120\D0DD\D569\B2C8\B2E4.<br>'),
unistr('\D2B9\C815 \B370\C774\D130\B97C \AC15\C870 \D45C\C2DC\D558\B294 \B370 \C801\D569\D55C <strong>\C870\AC74 \C720\D615</strong>\C744 \C120\D0DD\D569\B2C8\B2E4.<br>'),
unistr('&nbsp;&nbsp;&nbsp;\D589 - \C5F4\C5D0\C11C \C6A9\C5B4\B97C \AC15\C870 \D45C\C2DC\D569\B2C8\B2E4.<br>'),
unistr('&nbsp;&nbsp;&nbsp;\C5F4 - \C9C0\C815\B41C \C5F0\C0B0\C790 \BC0F \AC12\C744 \AE30\C900\C73C\B85C \D2B9\C815 \C5F4\C758 \B0B4\BD80\B97C \AC15\C870 \D45C\C2DC\D569\B2C8\B2E4.</p>')))
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140610608733751811)
,p_name=>'APEX.IG.HELP.HIGHLIGHT_TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC15\C870 \D45C\C2DC \B3C4\C6C0\B9D0')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140609242733751810)
,p_name=>'APEX.IG.HELP.REPORT'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\C774 \B300\D654\C0C1\C790\B97C \C0AC\C6A9\D558\C5EC \D604\C7AC \ADF8\B9AC\B4DC \B808\C774\C544\C6C3 \BC0F \AD6C\C131\C5D0 \B300\D55C \BCC0\ACBD\C0AC\D56D\C744 \C800\C7A5\D569\B2C8\B2E4.<br>'),
unistr('\C560\D50C\B9AC\CF00\C774\C158 \AC1C\BC1C\C790\B294 \C5EC\B7EC \B300\CCB4 \BCF4\ACE0\C11C \B808\C774\C544\C6C3\C744 \C815\C758\D560 \C218 \C788\C2B5\B2C8\B2E4. \D5C8\C6A9\B418\B294 \ACBD\C6B0 \C0AC\C6A9\C790\C640 \B2E4\B978 \C77C\BC18 \C0AC\C6A9\C790\AC00 \BCF4\ACE0\C11C\B97C \D37C\BE14\B9AD\C73C\B85C \C800\C7A5\D560 \C218 \C788\C2B5\B2C8\B2E4. \ADF8\B7EC\BA74 \BAA8\B4E0 \ADF8\B9AC\B4DC \C0AC\C6A9\C790\AC00 \BCF4\ACE0\C11C\B97C \C0AC\C6A9\D560 \C218 \C788\C2B5\B2C8\B2E4. \BCF4\ACE0\C11C\B97C \BCF8\C778\B9CC \BCFC \C218 \C788\B3C4\B85D \D504\B77C\C774\BE57 \BCF4\ACE0\C11C\B85C \C800\C7A5\D560 \C218\B3C4 \C788\C2B5\B2C8\B2E4.</p>'),
unistr('<p>\C0AC\C6A9 \AC00\B2A5\D55C \C720\D615\C744 \C120\D0DD\D558\ACE0 \C800\C7A5\B41C \BCF4\ACE0\C11C\C5D0 \B300\D55C \C774\B984\C744 \C785\B825\D569\B2C8\B2E4.</p>')))
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140610406066751810)
,p_name=>'APEX.IG.HELP.REPORT_TITLE'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\BCF4\ACE0\C11C \B3C4\C6C0\B9D0'),
''))
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140608672029751810)
,p_name=>'APEX.IG.HELP.SORT'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\C774 \B300\D654\C0C1\C790\B97C \C0AC\C6A9\D558\C5EC \D45C\C2DC \C21C\C11C\B97C \C124\C815\D569\B2C8\B2E4.</p>'),
'',
unistr('<p><strong>\BAA9\B85D \C815\B82C</strong><br>'),
unistr('\C815\B82C \B300\D654\C0C1\C790\C5D0\B294 \AD6C\C131\B41C \C815\B82C \ADDC\CE59 \BAA9\B85D\C774 \D45C\C2DC\B429\B2C8\B2E4.<br>'),
unistr('\C815\B82C \C5F4\C744 \C0DD\C131\D558\B824\BA74 \CD94\AC00( &plus; )\B97C \B204\B974\ACE0 \C815\B82C \C5F4\C744 \C81C\AC70\D558\B824\BA74 \C0AD\C81C( &minus; )\B97C \B204\B985\B2C8\B2E4.<br>'),
unistr('\C704\B85C \C774\B3D9( &uarr; ) \BC0F \C544\B798\B85C \C774\B3D9( &darr; )\C744 \B20C\B7EC\C11C \B2E4\B978 \C815\B82C \C5F4\C744 \AE30\C900\C73C\B85C \C120\D0DD\D55C \C5F4\C744 \C704 \B610\B294 \C544\B798\B85C \C774\B3D9\D569\B2C8\B2E4s.</p>'),
'',
unistr('<p><strong>\C815\B82C \C124\C815</strong><br>'),
unistr('\C815\B82C \C5F4, \C815\B82C \BC29\D5A5 \BC0F \B110 \C5F4(\AC12\C774 \C5C6\B294 \C5F4) \C815\B82C \BC29\BC95\C744 \C120\D0DD\D569\B2C8\B2E4.</p>'),
'',
unistr('<p><em>\CC38\ACE0: \D45C\C2DC\B418\C9C0 \C54A\C740 \C5F4\C744 \AE30\C900\C73C\B85C \B370\C774\D130\B97C \C815\B82C\D560 \C218 \C788\C9C0\B9CC, \C774 \ACBD\C6B0 \C77C\BD80 \C5F4\C774 \C815\B82C\B418\C9C0 \C54A\C744 \C218 \C788\C2B5\B2C8\B2E4.</em><br>'),
unistr('<em>\C5F4 \BA38\B9AC\AE00\C758 \B9E8 \B05D\C5D0 \C788\B294 \C704\CABD(\C624\B984\CC28\C21C) \B610\B294 \C544\B798\CABD(\B0B4\B9BC\CC28\C21C) \D654\C0B4\D45C\B97C \B20C\B7EC\C11C \D45C\C2DC\B41C \C5F4\C744 \C815\B82C\D560 \C218 \C788\C2B5\B2C8\B2E4. \AE30\C874 \C815\B82C\C5D0 \D6C4\C18D \C5F4\C744 \CD94\AC00\D558\B824\BA74 Shift \D0A4\B97C \B204\B974\ACE0 \C704\CABD \B610\B294 \C544\B798\CABD \D654\C0B4\D45C\B97C \B204\B985\B2C8\B2E4.</em></p>')))
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140611098998751811)
,p_name=>'APEX.IG.HELP.SORT_TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C815\B82C \B3C4\C6C0\B9D0')
,p_is_js_message=>true
,p_version_scn=>2705148
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140610283299751810)
,p_name=>'APEX.IG.HELP.SUBSCRIPTION_TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C801\C6A9 \B3C4\C6C0\B9D0')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140563871573751797)
,p_name=>'APEX.IG.HIDE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C228\AE30\AE30')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140528287616751786)
,p_name=>'APEX.IG.HIGHLIGHT'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC15\C870 \D45C\C2DC')
,p_is_js_message=>true
,p_version_scn=>2705137
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140597402040751807)
,p_name=>'APEX.IG.HIGH_COLUMN'
,p_message_language=>'ko'
,p_message_text=>unistr('\ACE0\AC00')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140598259574751807)
,p_name=>'APEX.IG.HORIZONTAL'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC00\B85C')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140556841261751795)
,p_name=>'APEX.IG.HOURS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2DC\AC04')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140561801262751796)
,p_name=>'APEX.IG.ICON'
,p_message_language=>'ko'
,p_message_text=>unistr('\C544\C774\CF58')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140527141070751786)
,p_name=>'APEX.IG.ICON_VIEW'
,p_message_language=>'ko'
,p_message_text=>unistr('\C544\C774\CF58 \BCF4\AE30')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140555018846751794)
,p_name=>'APEX.IG.IN'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C\C5D0 \C18D\D568')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140563492425751797)
,p_name=>'APEX.IG.INACTIVE_SETTING'
,p_message_language=>'ko'
,p_message_text=>unistr('\BE44\D65C\C131 \C124\C815')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140563568861751797)
,p_name=>'APEX.IG.INACTIVE_SETTINGS'
,p_message_language=>'ko'
,p_message_text=>unistr('\BE44\D65C\C131 \C124\C815')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140571142716751799)
,p_name=>'APEX.IG.INTERNAL_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\B300\D654\C2DD \ADF8\B9AC\B4DC \C694\CCAD\C744 \CC98\B9AC\D558\B294 \C911 \B0B4\BD80 \C624\B958\AC00 \BC1C\C0DD\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140459045143751766)
,p_name=>'APEX.IG.INVALID_COLUMN_FILTER_TYPE'
,p_message_language=>'ko'
,p_message_text=>unistr('"%1" \C5F4\C5D0 \B300\D574\C11C\B294 \C5F4 \D544\D130 \C720\D615 "%0"\C774(\AC00) \C9C0\C6D0\B418\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140610055822751810)
,p_name=>'APEX.IG.INVALID_DATE_FORMAT'
,p_message_language=>'ko'
,p_message_text=>unistr('\BD80\C801\D569\D55C \B0A0\C9DC \D615\C2DD')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140584866339751803)
,p_name=>'APEX.IG.INVALID_FILTER_COLUMN'
,p_message_language=>'ko'
,p_message_text=>unistr('\B300\D654\C2DD \ADF8\B9AC\B4DC\B294 %0 \C5F4\C5D0 \B300\D55C \D544\D130 \C815\C758\B97C \C9C0\C6D0\D558\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140584733516751803)
,p_name=>'APEX.IG.INVALID_FILTER_OPERATOR'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C740(\B294) \B300\D654\C2DD \ADF8\B9AC\B4DC \D544\D130 \C815\C758\C5D0 \C801\D569\D55C \D544\D130 \C720\D615\C774 \C544\B2D9\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140465654017751768)
,p_name=>'APEX.IG.INVALID_NUMBER_FORMAT'
,p_message_language=>'ko'
,p_message_text=>unistr('\BD80\C801\D569\D55C \C22B\C790 \D615\C2DD')
,p_is_js_message=>true
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140612780202751811)
,p_name=>'APEX.IG.INVALID_SETTING'
,p_message_language=>'ko'
,p_message_text=>unistr('\BD80\C801\D569\D55C \C124\C815')
,p_is_js_message=>true
,p_version_scn=>2705148
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140612859509751811)
,p_name=>'APEX.IG.INVALID_SETTINGS'
,p_message_language=>'ko'
,p_message_text=>unistr('\BD80\C801\D569\D55C \C124\C815')
,p_is_js_message=>true
,p_version_scn=>2705148
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140603934511751809)
,p_name=>'APEX.IG.INVALID_SORT_BY'
,p_message_language=>'ko'
,p_message_text=>unistr('\C815\B82C \AE30\C900\C774 %0(\C73C)\B85C \C124\C815\B418\C5B4 \C788\C9C0\B9CC %0\C5D0 \B300\D574 \C120\D0DD\B41C \C5F4\C774 \C5C6\C2B5\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140601290809751808)
,p_name=>'APEX.IG.INVALID_VALUE'
,p_message_language=>'ko'
,p_message_text=>unistr('\BD80\C801\D569\D55C \AC12')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140596359396751806)
,p_name=>'APEX.IG.INVISIBLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D45C\C2DC\B418\C9C0 \C54A\C74C')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140555881505751794)
,p_name=>'APEX.IG.IN_THE_LAST'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD5C\ADFC \AE30\AC04\C5D0 \C788\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140556011390751794)
,p_name=>'APEX.IG.IN_THE_NEXT'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C\C5D0\C11C')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140554954566751794)
,p_name=>'APEX.IG.IS_NOT_NULL'
,p_message_language=>'ko'
,p_message_text=>unistr('\BE44\C5B4 \C788\C9C0 \C54A\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140554865528751794)
,p_name=>'APEX.IG.IS_NULL'
,p_message_language=>'ko'
,p_message_text=>unistr('\BE44\C5B4 \C788\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140604796879751809)
,p_name=>'APEX.IG.LABEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\B808\C774\BE14')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140596738630751806)
,p_name=>'APEX.IG.LABEL_COLUMN'
,p_message_language=>'ko'
,p_message_text=>unistr('\B808\C774\BE14')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140600692632751808)
,p_name=>'APEX.IG.LAST'
,p_message_language=>'ko'
,p_message_text=>unistr('\B9C8\C9C0\B9C9')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140545171168751791)
,p_name=>'APEX.IG.LAST.DAY'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD5C\ADFC 1\C77C')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140545319855751791)
,p_name=>'APEX.IG.LAST.HOUR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\B09C \C2DC\AC04')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140545828956751791)
,p_name=>'APEX.IG.LAST.MINUTE'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD5C\ADFC 1\BD84')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140544857143751791)
,p_name=>'APEX.IG.LAST.MONTH'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\B09C \B2EC')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140544904681751791)
,p_name=>'APEX.IG.LAST.WEEK'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\B09C \C8FC')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140545025229751791)
,p_name=>'APEX.IG.LAST.X_DAYS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\B09C %0\C77C')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140545285589751791)
,p_name=>'APEX.IG.LAST.X_HOURS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\B09C %0\C2DC\AC04')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140545984819751792)
,p_name=>'APEX.IG.LAST.X_MINUTES'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD5C\ADFC %0\BD84')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140545771007751791)
,p_name=>'APEX.IG.LAST.X_MONTHS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\B09C %0\AC1C\C6D4')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140545637476751791)
,p_name=>'APEX.IG.LAST.X_WEEKS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\B09C %0\C8FC')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140544634098751791)
,p_name=>'APEX.IG.LAST.X_YEARS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\B09C %0\B144')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140544765340751791)
,p_name=>'APEX.IG.LAST.YEAR'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD5C\ADFC 1\B144')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140604913835751809)
,p_name=>'APEX.IG.LAYOUT_ALIGN'
,p_message_language=>'ko'
,p_message_text=>unistr('\C140 \B9DE\CDA4')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140605069567751809)
,p_name=>'APEX.IG.LAYOUT_USEGROUPFOR'
,p_message_language=>'ko'
,p_message_text=>unistr('\ADF8\B8F9 \C6A9\B3C4')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140555441333751794)
,p_name=>'APEX.IG.LESS_THAN'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\B2E4 \C791\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140555580045751794)
,p_name=>'APEX.IG.LESS_THAN_OR_EQUALS'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\B2E4 \C791\AC70\B098 \AC19\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140598864355751807)
,p_name=>'APEX.IG.LINE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C120')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140598913668751807)
,p_name=>'APEX.IG.LINE_WITH_AREA'
,p_message_language=>'ko'
,p_message_text=>unistr('\C120\ACFC \C601\C5ED')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140605319078751809)
,p_name=>'APEX.IG.LISTAGG'
,p_message_language=>'ko'
,p_message_text=>'Listagg'
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140597535623751807)
,p_name=>'APEX.IG.LOW_COLUMN'
,p_message_language=>'ko'
,p_message_text=>unistr('\C800\AC00')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140607834535751810)
,p_name=>'APEX.IG.MAILADDRESSES_COMMASEP'
,p_message_language=>'ko'
,p_message_text=>unistr('\C8FC\C18C\AC00 \C5EC\B7EC \AC1C\C77C \ACBD\C6B0 \CF64\B9C8\B85C \AD6C\BD84\D558\C2ED\C2DC\C624')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140556695649751795)
,p_name=>'APEX.IG.MATCHES_REGULAR_EXPRESSION'
,p_message_language=>'ko'
,p_message_text=>unistr('\C815\ADDC \D45C\D604\C2DD \C77C\CE58')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140581094708751802)
,p_name=>'APEX.IG.MAX'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD5C\B300\AC12')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140615327998751812)
,p_name=>'APEX.IG.MAX_OVERALL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C804\CCB4 \CD5C\B300\AC12')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140581294423751802)
,p_name=>'APEX.IG.MEDIAN'
,p_message_language=>'ko'
,p_message_text=>unistr('\C911\AC04\AC12')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140615421594751812)
,p_name=>'APEX.IG.MEDIAN_OVERALL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C804\CCB4 \C911\AC04\AC12')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140580928677751802)
,p_name=>'APEX.IG.MIN'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD5C\C18C\AC12')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140556742309751795)
,p_name=>'APEX.IG.MINUTES'
,p_message_language=>'ko'
,p_message_text=>unistr('\BD84')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140581791839751802)
,p_name=>'APEX.IG.MINUTES_AGO'
,p_message_language=>'ko'
,p_message_text=>unistr('\BD84 \C804')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140615204619751812)
,p_name=>'APEX.IG.MIN_OVERALL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C804\CCB4 \CD5C\C18C\AC12')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140557123201751795)
,p_name=>'APEX.IG.MONTHS'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC1C\C6D4')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140563706881751797)
,p_name=>'APEX.IG.MORE_DATA_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('\B370\C774\D130\B294 \D5C8\C6A9\B418\B294 \CD5C\B300\AC12\C744 \CD08\ACFC\D558\B294 %0 \C774\C0C1\C758 \D589\C744 \D3EC\D568\D569\B2C8\B2E4. \ACB0\ACFC\B97C \BCF4\B824\BA74 \CD94\AC00 \D544\D130\B97C \C801\C6A9\D558\C2ED\C2DC\C624.')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140589555257751804)
,p_name=>'APEX.IG.MULTIIG_PAGE_REGION_STATIC_ID_REQUIRED'
,p_message_language=>'ko'
,p_message_text=>unistr('\D398\C774\C9C0\C5D0 \C5EC\B7EC \B300\D654\C2DD \ADF8\B9AC\B4DC\AC00 \D3EC\D568\B418\C5B4 \C788\C73C\BBC0\B85C \C601\C5ED \C815\C801 ID\B97C \C9C0\C815\D574\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140559848713751796)
,p_name=>'APEX.IG.NAME'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\B984')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140560040347751796)
,p_name=>'APEX.IG.NAMED_REPORT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\B984\C774 \C9C0\C815\B41C \BCF4\ACE0\C11C')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140544020657751791)
,p_name=>'APEX.IG.NEXT.DAY'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C \C77C')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140543826713751791)
,p_name=>'APEX.IG.NEXT.HOUR'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C \C2DC\AC04')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140546014622751792)
,p_name=>'APEX.IG.NEXT.MINUTE'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C 1\BD84')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140544350145751791)
,p_name=>'APEX.IG.NEXT.MONTH'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C \C6D4')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140544248930751791)
,p_name=>'APEX.IG.NEXT.WEEK'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C \C8FC')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140544111590751791)
,p_name=>'APEX.IG.NEXT.X_DAYS'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C %0\C77C')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140543939336751791)
,p_name=>'APEX.IG.NEXT.X_HOURS'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C %0\C2DC\AC04')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140546113010751792)
,p_name=>'APEX.IG.NEXT.X_MINUTES'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C %0\BD84')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140545467807751791)
,p_name=>'APEX.IG.NEXT.X_MONTHS'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C %0\AC1C\C6D4')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140545595936751791)
,p_name=>'APEX.IG.NEXT.X_WEEKS'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C %0\C8FC')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140544532639751791)
,p_name=>'APEX.IG.NEXT.X_YEARS'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C %0\B144')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140544488826751791)
,p_name=>'APEX.IG.NEXT.YEAR'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C \C5F0\B3C4')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140555771870751794)
,p_name=>'APEX.IG.NOT_BETWEEN'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C \C0AC\C774\AC00 \C544\B2D8')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140554799913751794)
,p_name=>'APEX.IG.NOT_EQUALS'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC19\C9C0 \C54A\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140619510842751813)
,p_name=>'APEX.IG.NOT_EXIST'
,p_message_language=>'ko'
,p_message_text=>unistr('ID %0\C758 \C601\C5ED\C740 \B300\D654\C2DD \ADF8\B9AC\B4DC \C601\C5ED\C774 \C544\B2C8\AC70\B098 %1 \C560\D50C\B9AC\CF00\C774\C158\C5D0 \C874\C7AC\D558\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140555175476751794)
,p_name=>'APEX.IG.NOT_IN'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C\C5D0 \C18D\D558\C9C0 \C54A\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140555934883751794)
,p_name=>'APEX.IG.NOT_IN_THE_LAST'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD5C\ADFC \AE30\AC04\C5D0 \C5C6\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140556123407751795)
,p_name=>'APEX.IG.NOT_IN_THE_NEXT'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C \AE30\AC04\C5D0 \C5C6\C74C')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140563625099751797)
,p_name=>'APEX.IG.NO_DATA_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('\B370\C774\D130\B97C \CC3E\C744 \C218 \C5C6\C74C')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140600418572751808)
,p_name=>'APEX.IG.NULLS'
,p_message_language=>'ko'
,p_message_text=>unistr('\B110')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140605506406751809)
,p_name=>'APEX.IG.NUMBER'
,p_message_language=>'ko'
,p_message_text=>unistr('\C22B\C790')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140600797918751808)
,p_name=>'APEX.IG.OFF'
,p_message_language=>'ko'
,p_message_text=>unistr('\D574\C81C')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140600880736751808)
,p_name=>'APEX.IG.ON'
,p_message_language=>'ko'
,p_message_text=>unistr('\C124\C815')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140553977168751794)
,p_name=>'APEX.IG.ONE_MINUTE_AGO'
,p_message_language=>'ko'
,p_message_text=>unistr('1\BD84 \C804')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140608325889751810)
,p_name=>'APEX.IG.OPEN_COLORPICKER'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F4\B9B0 \C0C9\C0C1 \C120\D0DD\AE30: %0')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140597252905751807)
,p_name=>'APEX.IG.OPEN_COLUMN'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2DC\AC00')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140560954368751796)
,p_name=>'APEX.IG.OPERATOR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F0\C0B0\C790')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140596630740751806)
,p_name=>'APEX.IG.ORIENTATION'
,p_message_language=>'ko'
,p_message_text=>unistr('\BC29\D5A5')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140599029634751807)
,p_name=>'APEX.IG.PIE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D30C\C774')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140562229728751796)
,p_name=>'APEX.IG.PIVOT'
,p_message_language=>'ko'
,p_message_text=>unistr('\D53C\BC97')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140527449941751786)
,p_name=>'APEX.IG.PIVOT_VIEW'
,p_message_language=>'ko'
,p_message_text=>unistr('\D53C\BC97 \BCF4\AE30')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140608214118751810)
,p_name=>'APEX.IG.PLACEHOLDER_INVALUES'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC12\C744 "%0"(\C73C)\B85C \AD6C\BD84')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140599146525751807)
,p_name=>'APEX.IG.POLAR'
,p_message_language=>'ko'
,p_message_text=>unistr('\ADF9\C120')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140604479609751809)
,p_name=>'APEX.IG.POSITION_CENTER'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC00\C6B4\B370')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140604504446751809)
,p_name=>'APEX.IG.POSITION_END'
,p_message_language=>'ko'
,p_message_text=>unistr('\C885\B8CC')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140604378444751809)
,p_name=>'APEX.IG.POSITION_START'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2DC\C791')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140560170193751796)
,p_name=>'APEX.IG.PRIMARY'
,p_message_language=>'ko'
,p_message_text=>unistr('\AE30\BCF8')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140560420931751796)
,p_name=>'APEX.IG.PRIMARY_DEFAULT'
,p_message_language=>'ko'
,p_message_text=>unistr('\AE30\BCF8 \AE30\BCF8\AC12')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140576917587751801)
,p_name=>'APEX.IG.PRIMARY_REPORT'
,p_message_language=>'ko'
,p_message_text=>unistr('\AE30\BCF8 \BCF4\ACE0\C11C')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140450556694751763)
,p_name=>'APEX.IG.PRINT_ACCESSIBLE.PROMPT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C811\ADFC\C131 \D0DC\ADF8 \D3EC\D568')
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140447957734751763)
,p_name=>'APEX.IG.PRINT_ORIENTATION.LOV.HORIZONTAL.D'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC00\B85C')
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140448097333751763)
,p_name=>'APEX.IG.PRINT_ORIENTATION.LOV.VERTICAL.D'
,p_message_language=>'ko'
,p_message_text=>unistr('\C138\B85C')
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140447811500751762)
,p_name=>'APEX.IG.PRINT_ORIENTATION.PROMPT'
,p_message_language=>'ko'
,p_message_text=>unistr('\D398\C774\C9C0 \BC29\D5A5')
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140447786875751762)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.A3.D'
,p_message_language=>'ko'
,p_message_text=>'A3'
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140447617068751762)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.A4.D'
,p_message_language=>'ko'
,p_message_text=>'A4'
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140450757213751763)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.CUSTOM.D'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AC\C6A9\C790\C815\C758')
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140447482179751762)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.LEGAL.D'
,p_message_language=>'ko'
,p_message_text=>'Legal'
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140447344618751762)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.LETTER.D'
,p_message_language=>'ko'
,p_message_text=>'Letter'
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140447586176751762)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.TABLOID.D'
,p_message_language=>'ko'
,p_message_text=>'Tabloid'
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140447214991751762)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.PROMPT'
,p_message_language=>'ko'
,p_message_text=>unistr('\D398\C774\C9C0 \D06C\AE30')
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140412871512751752)
,p_name=>'APEX.IG.PRINT_STRIP_RICH_TEXT.PROMPT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C11C\C2DD \C788\B294 \D14D\C2A4\D2B8 \C81C\AC70')
,p_is_js_message=>true
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140599239589751807)
,p_name=>'APEX.IG.RADAR'
,p_message_language=>'ko'
,p_message_text=>unistr('\BC29\C0AC')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140599346160751807)
,p_name=>'APEX.IG.RANGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\BC94\C704')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140609539310751810)
,p_name=>'APEX.IG.REFRESH'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0C8\B85C\ACE0\CE68')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140564497832751797)
,p_name=>'APEX.IG.REFRESH_ROW'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589 \C0C8\B85C\ACE0\CE68')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140563252549751797)
,p_name=>'APEX.IG.REFRESH_ROWS'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589 \C0C8\B85C\ACE0\CE68')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140568448820751798)
,p_name=>'APEX.IG.REGION_NOT_EXIST'
,p_message_language=>'ko'
,p_message_text=>unistr('\B300\D654\C2DD \ADF8\B9AC\B4DC \C601\C5ED\C774 %0 \C560\D50C\B9AC\CF00\C774\C158, %1 \D398\C774\C9C0 \BC0F %2 \C601\C5ED\C5D0 \C874\C7AC\D558\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140528993942751787)
,p_name=>'APEX.IG.REMOVE_CONTROL'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C81C\AC70')
,p_is_js_message=>true
,p_version_scn=>2705137
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140559500239751796)
,p_name=>'APEX.IG.REPORT'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\ACE0\C11C')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140618733751751813)
,p_name=>'APEX.IG.REPORT.DELETED'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\ACE0\C11C\AC00 \C0AD\C81C\B428')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140618467732751813)
,p_name=>'APEX.IG.REPORT.SAVED.ALTERNATIVE'
,p_message_language=>'ko'
,p_message_text=>unistr('\BAA8\B4E0 \C0AC\C6A9\C790\C5D0 \B300\D55C \B300\CCB4 \BCF4\ACE0\C11C\AC00 \C800\C7A5\B428')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140618312975751813)
,p_name=>'APEX.IG.REPORT.SAVED.DEFAULT'
,p_message_language=>'ko'
,p_message_text=>unistr('\BAA8\B4E0 \C0AC\C6A9\C790\C5D0 \B300\D55C \AE30\BCF8 \BCF4\ACE0\C11C\AC00 \C800\C7A5\B428')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140618668418751813)
,p_name=>'APEX.IG.REPORT.SAVED.PRIVATE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D504\B77C\C774\BE57 \BCF4\ACE0\C11C\AC00 \C800\C7A5\B428')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140618522354751813)
,p_name=>'APEX.IG.REPORT.SAVED.PUBLIC'
,p_message_language=>'ko'
,p_message_text=>unistr('\BAA8\B4E0 \C0AC\C6A9\C790\C5D0 \B300\D55C \D37C\BE14\B9AD \BCF4\ACE0\C11C\AC00 \C800\C7A5\B428')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140568579459751798)
,p_name=>'APEX.IG.REPORT_ALIAS_DOES_NOT_EXIST'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\B984\C774 %0\C778 \C800\C7A5\B41C \B300\D654\C2DD \ADF8\B9AC\B4DC\AC00 \C874\C7AC\D558\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140553857946751794)
,p_name=>'APEX.IG.REPORT_DATA_AS_OF.X.MINUTES_AGO'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\BD84 \C804\C758 \ADF8\B9AC\B4DC \B370\C774\D130')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140553789218751794)
,p_name=>'APEX.IG.REPORT_DATA_AS_OF_ONE_MINUTE_AGO'
,p_message_language=>'ko'
,p_message_text=>unistr('1\BD84 \C804\C758 \ADF8\B9AC\B4DC \B370\C774\D130')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140489269628751775)
,p_name=>'APEX.IG.REPORT_DOES_NOT_EXIST'
,p_message_language=>'ko'
,p_message_text=>unistr('\B300\D654\C2DD \ADF8\B9AC\B4DC \BCF4\ACE0\C11C\AC00 \C874\C7AC\D558\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140611791977751811)
,p_name=>'APEX.IG.REPORT_EDIT'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\ACE0\C11C - \D3B8\C9D1')
,p_is_js_message=>true
,p_version_scn=>2705148
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140568312342751798)
,p_name=>'APEX.IG.REPORT_ID_DOES_NOT_EXIST'
,p_message_language=>'ko'
,p_message_text=>unistr('ID\AC00 %0\C778 \C800\C7A5\B41C \B300\D654\C2DD \ADF8\B9AC\B4DC\AC00 \C874\C7AC\D558\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140611640141751811)
,p_name=>'APEX.IG.REPORT_SAVE_AS'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\ACE0\C11C - \B2E4\B978 \C774\B984\C73C\B85C \C800\C7A5')
,p_is_js_message=>true
,p_version_scn=>2705148
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140529047743751787)
,p_name=>'APEX.IG.REPORT_SETTINGS'
,p_message_language=>'ko'
,p_message_text=>unistr('\ACA9\C790 \C124\C815')
,p_is_js_message=>true
,p_version_scn=>2705137
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140619671972751813)
,p_name=>'APEX.IG.REPORT_STATIC_ID_DOES_NOT_EXIST'
,p_message_language=>'ko'
,p_message_text=>unistr('\C815\C801 ID %0(\C73C)\B85C \C800\C7A5\B41C \B300\D654\C2DD \ADF8\B9AC\B4DC\AC00 \C874\C7AC\D558\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140614656749751812)
,p_name=>'APEX.IG.REPORT_VIEW'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\ACE0\C11C \BCF4\AE30')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140528157937751786)
,p_name=>'APEX.IG.RESET'
,p_message_language=>'ko'
,p_message_text=>unistr('\C7AC\C124\C815')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140564542932751797)
,p_name=>'APEX.IG.REVERT_CHANGES'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCC0\ACBD\C0AC\D56D \BCF5\C6D0')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140563383989751797)
,p_name=>'APEX.IG.REVERT_ROWS'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589 \BCF5\C6D0')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140560574654751796)
,p_name=>'APEX.IG.ROW'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140559413710751795)
,p_name=>'APEX.IG.ROWS_PER_PAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D398\C774\C9C0\B2F9 \D589')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140619206788751813)
,p_name=>'APEX.IG.ROW_ACTIONS'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589 \C791\C5C5')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140620403926751814)
,p_name=>'APEX.IG.ROW_ACTIONS_FOR'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \D589\C5D0 \B300\D55C \C791\C5C5')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140528476064751786)
,p_name=>'APEX.IG.SAVE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C800\C7A5')
,p_is_js_message=>true
,p_version_scn=>2705137
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140573554839751800)
,p_name=>'APEX.IG.SAVED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C800\C7A5\B428')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140478153627751771)
,p_name=>'APEX.IG.SAVED_REPORT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C800\C7A5\B41C \BCF4\ACE0\C11C: %0')
,p_is_js_message=>true
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140526605164751786)
,p_name=>'APEX.IG.SAVED_REPORTS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C800\C7A5\B41C \BCF4\ACE0\C11C')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140526751860751786)
,p_name=>'APEX.IG.SAVED_REPORT_DEFAULT'
,p_message_language=>'ko'
,p_message_text=>unistr('\AE30\BCF8\AC12')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140500246663751778)
,p_name=>'APEX.IG.SAVED_REPORT_EXISTS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\B984\C774 %0\C778 \C800\C7A5\B41C \BCF4\ACE0\C11C\AC00 \C874\C7AC\D569\B2C8\B2E4. \C0C8 \C774\B984\C744 \C785\B825\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140526837947751786)
,p_name=>'APEX.IG.SAVED_REPORT_PRIVATE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D504\B77C\C774\BE57')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140526972087751786)
,p_name=>'APEX.IG.SAVED_REPORT_PUBLIC'
,p_message_language=>'ko'
,p_message_text=>unistr('\D37C\BE14\B9AD')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140614336137751812)
,p_name=>'APEX.IG.SAVE_AS'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\B978 \C774\B984\C73C\B85C \C800\C7A5')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140562606286751796)
,p_name=>'APEX.IG.SAVE_REPORT_SETTINGS'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\ACE0\C11C \C124\C815 \C800\C7A5')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140599475276751807)
,p_name=>'APEX.IG.SCATTER'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0B0\D3EC')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140526513776751786)
,p_name=>'APEX.IG.SEARCH'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC80\C0C9')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140606600683751809)
,p_name=>'APEX.IG.SEARCH.ALL_COLUMNS'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC80\C0C9: \BAA8\B4E0 \D14D\C2A4\D2B8 \C5F4')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140526496931751786)
,p_name=>'APEX.IG.SEARCH.COLUMN'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC80\C0C9: %0')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140605991952751809)
,p_name=>'APEX.IG.SEARCH.ORACLE_TEXT'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC80\C0C9: \C804\CCB4 \D14D\C2A4\D2B8')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140553652979751794)
,p_name=>'APEX.IG.SEARCH_FOR.X'
,p_message_language=>'ko'
,p_message_text=>unistr('''%0'' \AC80\C0C9')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140596069141751806)
,p_name=>'APEX.IG.SELECT'
,p_message_language=>'ko'
,p_message_text=>unistr('- \C120\D0DD -')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140536104354751789)
,p_name=>'APEX.IG.SELECTION'
,p_message_language=>'ko'
,p_message_text=>unistr('\C120\D0DD \C0AC\D56D')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140589204551751804)
,p_name=>'APEX.IG.SELECT_1_ROW_IN_MASTER'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0C1\C704 \C601\C5ED\C5D0\C11C \D55C \AC1C\C758 \D589 \C120\D0DD')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140526342912751786)
,p_name=>'APEX.IG.SELECT_COLUMNS_TO_SEARCH'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC80\C0C9\D560 \C5F4\C744 \C120\D0DD\D558\C2ED\C2DC\C624.')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140618969083751813)
,p_name=>'APEX.IG.SEL_ACTIONS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C120\D0DD \C791\C5C5')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140536346012751789)
,p_name=>'APEX.IG.SEL_MODE_CELL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C140 \C120\D0DD')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140536246047751789)
,p_name=>'APEX.IG.SEL_MODE_ROW'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589 \C120\D0DD')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140607250614751810)
,p_name=>'APEX.IG.SEND_AS_EMAIL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C804\C790\BA54\C77C\B85C \C804\C1A1')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140599829992751807)
,p_name=>'APEX.IG.SERIES_COLUMN'
,p_message_language=>'ko'
,p_message_text=>unistr('\ACC4\C5F4')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140524064281751785)
,p_name=>'APEX.IG.SHOW'
,p_message_language=>'ko'
,p_message_text=>unistr('\D45C\C2DC')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140579215304751801)
,p_name=>'APEX.IG.SHOW_OVERALL_VALUE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C804\CCB4 \AC12 \D45C\C2DC')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140564156998751797)
,p_name=>'APEX.IG.SINGLE_ROW_VIEW'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E8\C77C \D589 \BCF4\AE30')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140562493138751796)
,p_name=>'APEX.IG.SORT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C815\B82C')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140599957760751807)
,p_name=>'APEX.IG.SORT_BY'
,p_message_language=>'ko'
,p_message_text=>unistr('\C815\B82C \AE30\C900')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140619345791751813)
,p_name=>'APEX.IG.SORT_ONLY_ONE_PER_COLUMN'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F4\B2F9 \D558\B098\C758 \C815\B82C\B9CC \C815\C758\D560 \C218 \C788\C2B5\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140619127563751813)
,p_name=>'APEX.IG.SRV_CHANGE_MENU'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCC0\ACBD')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140600914833751808)
,p_name=>'APEX.IG.STACK'
,p_message_language=>'ko'
,p_message_text=>unistr('\B204\C801')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140556424885751795)
,p_name=>'APEX.IG.STARTS_WITH'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C\C73C\B85C \C2DC\C791')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140599510174751807)
,p_name=>'APEX.IG.STOCK'
,p_message_language=>'ko'
,p_message_text=>unistr('\C8FC\C2DD')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140518812285751784)
,p_name=>'APEX.IG.STRETCH_COLUMNS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F4 \B108\BE44 \B298\C774\AE30')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140562825236751796)
,p_name=>'APEX.IG.SUBSCRIPTION'
,p_message_language=>'ko'
,p_message_text=>unistr('\C801\C6A9')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140580850734751802)
,p_name=>'APEX.IG.SUM'
,p_message_language=>'ko'
,p_message_text=>unistr('\D569\ACC4')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140620682771751814)
,p_name=>'APEX.IG.SUMMARY'
,p_message_language=>'ko'
,p_message_text=>unistr('\B300\D654\C2DD \ADF8\B9AC\B4DC\C785\B2C8\B2E4. \BCF4\ACE0\C11C: %0, \BDF0: %1.')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140614750598751812)
,p_name=>'APEX.IG.SUM_OVERALL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C804\CCB4 \D569\ACC4')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140597740593751807)
,p_name=>'APEX.IG.TARGET_COLUMN'
,p_message_language=>'ko'
,p_message_text=>unistr('\BAA9\D45C')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140604130876751809)
,p_name=>'APEX.IG.TEXT_COLOR'
,p_message_language=>'ko'
,p_message_text=>unistr('\D14D\C2A4\D2B8 \C0C9\C0C1')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140529179973751787)
,p_name=>'APEX.IG.TOGGLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D1A0\AE00')
,p_is_js_message=>true
,p_version_scn=>2705137
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140411281652751752)
,p_name=>'APEX.IG.TOOLBAR'
,p_message_language=>'ko'
,p_message_text=>unistr('\ADF8\B9AC\B4DC')
,p_is_js_message=>true
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140579118400751801)
,p_name=>'APEX.IG.TOOLTIP'
,p_message_language=>'ko'
,p_message_text=>unistr('\B3C4\AD6C \C124\BA85')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140559686864751796)
,p_name=>'APEX.IG.TYPE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C720\D615')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140564000938751797)
,p_name=>'APEX.IG.UNFREEZE'
,p_message_language=>'ko'
,p_message_text=>unistr('\ACE0\C815 \D574\C81C')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140561132578751796)
,p_name=>'APEX.IG.UNIT'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E8\C704')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140607009617751809)
,p_name=>'APEX.IG.UNSAVED_CHANGES_CONTINUE_CONFIRM'
,p_message_language=>'ko'
,p_message_text=>unistr('\C800\C7A5\B418\C9C0 \C54A\C740 \BCC0\ACBD\C0AC\D56D\C774 \C788\C2B5\B2C8\B2E4. \ACC4\C18D\D558\ACA0\C2B5\B2C8\AE4C?')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140561098705751796)
,p_name=>'APEX.IG.VALUE'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC12')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140596818897751806)
,p_name=>'APEX.IG.VALUE_COLUMN'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC12')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140601740083751808)
,p_name=>'APEX.IG.VALUE_REQUIRED'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC12\C774 \D544\C694\D569\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140586975461751804)
,p_name=>'APEX.IG.VALUE_TIMESTAMP_TZ'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC12(\C2DC\AC04\B300\B97C \BCC0\ACBD\D560 \C218 \C5C6\C74C)')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140605619880751809)
,p_name=>'APEX.IG.VARCHAR2'
,p_message_language=>'ko'
,p_message_text=>unistr('\D14D\C2A4\D2B8')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140598164161751807)
,p_name=>'APEX.IG.VERTICAL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C138\B85C')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140559187265751795)
,p_name=>'APEX.IG.VIEW'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\AE30')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140494205667751776)
,p_name=>'APEX.IG.VIEW_MODE_DESCRIPTION'
,p_message_language=>'ko'
,p_message_text=>unistr('\ADF8\B9AC\B4DC\AC00 \BCF4\AE30 \BAA8\B4DC\C785\B2C8\B2E4. \D3B8\C9D1\D558\B824\BA74 \B204\B985\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140596101094751806)
,p_name=>'APEX.IG.VISIBLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D45C\C2DC\B428')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140597636018751807)
,p_name=>'APEX.IG.VOLUME_COLUMN'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCFC\B968')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140557054973751795)
,p_name=>'APEX.IG.WEEKS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C8FC')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140596297130751806)
,p_name=>'APEX.IG.WIDTH'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD5C\C18C \C5F4 \B108\BE44(\D53D\C140)')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140548298588751792)
,p_name=>'APEX.IG.X.BETWEEN.Y.AND.Z'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) %1 - %2 \BC94\C704\C5D0 \C788\C74C')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140547938211751792)
,p_name=>'APEX.IG.X.CONTAINS.Y'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C5D0 \B2E4\C74C\C774 \D3EC\D568\B428: %1')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140548039926751792)
,p_name=>'APEX.IG.X.DOES_NOT_CONTAIN.Y'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C\C744 \D3EC\D568\D558\C9C0 \C54A\C74C %1')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140523443032751785)
,p_name=>'APEX.IG.X.DOES_NOT_START_WITH.Y'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) %1(\C73C)\B85C \C2DC\C791\D558\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140546763607751792)
,p_name=>'APEX.IG.X.EQUALS.Y'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C\ACFC \AC19\C74C: %1')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140546990516751792)
,p_name=>'APEX.IG.X.GREATER_THAN.Y'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C\BCF4\B2E4 \D07C: %1')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140547016836751792)
,p_name=>'APEX.IG.X.GREATER_THAN_OR_EQUALS.Y'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C\BCF4\B2E4 \D06C\AC70\B098 \AC19\C74C %1')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140547788024751792)
,p_name=>'APEX.IG.X.IN.Y'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C\C5D0 \C18D\D568: %1')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140548983335751792)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.DAYS'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \CD5C\ADFC %1\C77C \C774\B0B4\C5D0 \C788\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140548730864751792)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.HOURS'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \CD5C\ADFC %1\C2DC\AC04 \C774\B0B4\C5D0 \C788\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140548522979751792)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.MINUTES'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \CD5C\ADFC %1\BD84 \C774\B0B4\C5D0 \C788\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140549347357751793)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.MONTHS'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \CD5C\ADFC %1\AC1C\C6D4 \C774\B0B4\C5D0 \C788\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140549185393751792)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.WEEKS'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \CD5C\ADFC %1\C8FC \C774\B0B4\C5D0 \C788\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140549543673751793)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.YEARS'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \CD5C\ADFC %1\B144 \C774\B0B4\C5D0 \C788\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140548830207751792)
,p_name=>'APEX.IG.X.IN_THE_LAST_DAY'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \CD5C\ADFC 1\C77C \C774\B0B4\C5D0 \C788\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140548601480751792)
,p_name=>'APEX.IG.X.IN_THE_LAST_HOUR'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \CD5C\ADFC 1\C2DC\AC04 \C774\B0B4\C5D0 \C788\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140548416247751792)
,p_name=>'APEX.IG.X.IN_THE_LAST_MINUTE'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \CD5C\ADFC 1\BD84 \C774\B0B4\C5D0 \C788\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140549237582751792)
,p_name=>'APEX.IG.X.IN_THE_LAST_MONTH'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \CD5C\ADFC 1\AC1C\C6D4 \C774\B0B4\C5D0 \C788\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140549064584751792)
,p_name=>'APEX.IG.X.IN_THE_LAST_WEEK'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \CD5C\ADFC 1\C8FC \C774\B0B4\C5D0 \C788\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140549468454751793)
,p_name=>'APEX.IG.X.IN_THE_LAST_YEAR'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \CD5C\ADFC 1\B144 \C774\B0B4\C5D0 \C788\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140551392391751793)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.DAYS'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C %1\C77C \C774\B0B4\C5D0 \C788\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140551102804751793)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.HOURS'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C %1\C2DC\AC04 \C774\B0B4\C5D0 \C788\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140550968099751793)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.MINUTES'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C %1\BD84 \C774\B0B4\C5D0 \C788\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140551745934751793)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.MONTHS'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C %1\AC1C\C6D4 \C774\B0B4\C5D0 \C788\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140551538391751793)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.WEEKS'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C %1\C8FC \C774\B0B4\C5D0 \C788\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140551965377751793)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.YEARS'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C %1\B144 \C774\B0B4\C5D0 \C788\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140551294066751793)
,p_name=>'APEX.IG.X.IN_THE_NEXT_DAY'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C 1\C77C \C774\B0B4\C5D0 \C788\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140551096600751793)
,p_name=>'APEX.IG.X.IN_THE_NEXT_HOUR'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C 1\C2DC\AC04 \C774\B0B4\C5D0 \C788\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140550845267751793)
,p_name=>'APEX.IG.X.IN_THE_NEXT_MINUTE'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C 1\BD84 \C774\B0B4\C5D0 \C788\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140551652659751793)
,p_name=>'APEX.IG.X.IN_THE_NEXT_MONTH'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C 1\AC1C\C6D4 \C774\B0B4\C5D0 \C788\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140551469664751793)
,p_name=>'APEX.IG.X.IN_THE_NEXT_WEEK'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C 1\C8FC \C774\B0B4\C5D0 \C788\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140551836420751793)
,p_name=>'APEX.IG.X.IN_THE_NEXT_YEAR'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C 1\B144 \C774\B0B4\C5D0 \C788\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140547470357751792)
,p_name=>'APEX.IG.X.IS_NOT_NULL'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \BE44\C5B4 \C788\C9C0 \C54A\C74C')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140547349447751792)
,p_name=>'APEX.IG.X.IS_NULL'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \BE44\C5B4 \C788\C74C')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140547181387751792)
,p_name=>'APEX.IG.X.LESS_THAN.Y'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C\BCF4\B2E4 \C791\C74C: %1')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140547200430751792)
,p_name=>'APEX.IG.X.LESS_THAN_OR_EQUALS.Y'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C\BCF4\B2E4 \C791\AC70\B098 \AC19\C74C %1')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140547555981751792)
,p_name=>'APEX.IG.X.LIKE.Y'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C\ACFC \C720\C0AC\D568: %1')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140548189500751792)
,p_name=>'APEX.IG.X.MATCHES_REGULAR_EXPRESSION.Y'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C \C815\ADDC \D45C\D604\C2DD\ACFC \C77C\CE58\D568 %1')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140554082262751794)
,p_name=>'APEX.IG.X.MINUTES_AGO'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\BD84 \C804')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140548346049751792)
,p_name=>'APEX.IG.X.NOT_BETWEEN.Y.AND.Z'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) %1 \BC0F %2 \C0AC\C774 \C544\B2D8')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140546873459751792)
,p_name=>'APEX.IG.X.NOT_EQUALS.Y'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C\ACFC \AC19\C9C0 \C54A\C74C: %1')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140547880409751792)
,p_name=>'APEX.IG.X.NOT_IN.Y'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C\C5D0 \C18D\D558\C9C0 \C54A\C74C: %1')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140550162910751793)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.DAYS'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \CD5C\ADFC %1\C77C \C774\B0B4\C5D0 \C5C6\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140549926676751793)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.HOURS'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \CD5C\ADFC %1\C2DC\AC04 \C774\B0B4\C5D0 \C5C6\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140549780727751793)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.MINUTES'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \CD5C\ADFC %1\BD84 \C774\B0B4\C5D0 \C5C6\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140550505381751793)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.MONTHS'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \CD5C\ADFC %1\AC1C\C6D4 \C774\B0B4\C5D0 \C5C6\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140550327826751793)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.WEEKS'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \CD5C\ADFC %1\C8FC \C774\B0B4\C5D0 \C5C6\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140550711267751793)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.YEARS'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \CD5C\ADFC %1\B144 \C774\B0B4\C5D0 \C5C6\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140550038375751793)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_DAY'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \CD5C\ADFC 1\C77C \C774\B0B4\C5D0 \C5C6\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140549875569751793)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_HOUR'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \CD5C\ADFC 1\C2DC\AC04 \C774\B0B4\C5D0 \C5C6\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140549600482751793)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_MINUTE'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \CD5C\ADFC 1\BD84 \C774\B0B4\C5D0 \C5C6\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140550435736751793)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_MONTH'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \CD5C\ADFC 1\AC1C\C6D4 \C774\B0B4\C5D0 \C5C6\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140550286154751793)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_WEEK'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \CD5C\ADFC 1\C8FC \C774\B0B4\C5D0 \C5C6\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140550663114751793)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_YEAR'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \CD5C\ADFC 1\B144 \C774\B0B4\C5D0 \C5C6\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140552591320751793)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.DAYS'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C %1\C77C \C774\B0B4\C5D0 \C5C6\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140552331582751793)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.HOURS'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C %1\C2DC\AC04 \C774\B0B4\C5D0 \C5C6\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140552108816751793)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.MINUTES'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C %1\BD84 \C774\B0B4\C5D0 \C5C6\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140552970445751794)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.MONTHS'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C %1\AC1C\C6D4 \C774\B0B4\C5D0 \C5C6\C74C ')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140552796825751794)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.WEEKS'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C %1\C8FC \C774\B0B4\C5D0 \C5C6\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140553138962751794)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.YEARS'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C %1\B144 \C774\B0B4\C5D0 \C5C6\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140552433856751793)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_DAY'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C 1\C77C \C774\B0B4\C5D0 \C5C6\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140552234424751793)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_HOUR'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C 1\C2DC\AC04 \C774\B0B4\C5D0 \C5C6\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140552019397751793)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_MINUTE'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C 1\BD84 \C774\B0B4\C5D0 \C5C6\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140552809170751794)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_MONTH'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C 1\AC1C\C6D4 \C774\B0B4\C5D0 \C5C6\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140552602251751793)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_WEEK'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C 1\C8FC \C774\B0B4\C5D0 \C5C6\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140553023576751794)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_YEAR'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C 1\B144 \C774\B0B4\C5D0 \C5C6\C74C')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140547615560751792)
,p_name=>'APEX.IG.X.NOT_LIKE.Y'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C\ACFC \C720\C0AC\D558\C9C0 \C54A\C74C: %1')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140554581861751794)
,p_name=>'APEX.IG.X.STARTS_WITH.Y'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \B2E4\C74C\C73C\B85C \C2DC\C791 %1')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140596933643751807)
,p_name=>'APEX.IG.X_COLUMN'
,p_message_language=>'ko'
,p_message_text=>'X'
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140557250152751795)
,p_name=>'APEX.IG.YEARS'
,p_message_language=>'ko'
,p_message_text=>unistr('\B144')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140597016930751807)
,p_name=>'APEX.IG.Y_COLUMN'
,p_message_language=>'ko'
,p_message_text=>'Y'
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140597172069751807)
,p_name=>'APEX.IG.Z_COLUMN'
,p_message_language=>'ko'
,p_message_text=>'Z'
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140606187449751809)
,p_name=>'APEX.IG_FORMAT_SAMPLE_1'
,p_message_language=>'ko'
,p_message_text=>unistr('2016\B144 1\C6D4 12\C77C \C6D4\C694\C77C')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140606200908751809)
,p_name=>'APEX.IG_FORMAT_SAMPLE_2'
,p_message_language=>'ko'
,p_message_text=>unistr('1\C6D4')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140606301107751809)
,p_name=>'APEX.IG_FORMAT_SAMPLE_3'
,p_message_language=>'ko'
,p_message_text=>unistr('16\C2DC\AC04 \C804')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140606409001751809)
,p_name=>'APEX.IG_FORMAT_SAMPLE_4'
,p_message_language=>'ko'
,p_message_text=>unistr('16\C2DC\AC04 \B0B4')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140424456526751756)
,p_name=>'APEX.ITEM.CROPPER.APPLY'
,p_message_language=>'ko'
,p_message_text=>unistr('\C801\C6A9')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140416483287751753)
,p_name=>'APEX.ITEM.CROPPER.HELP.TEXT'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\C774\BBF8\C9C0\B97C \B04C\ACE0 \D655\B300/\CD95\C18C \C2AC\B77C\C774\B354\B97C \C0AC\C6A9\D558\C5EC \D504\B808\C784 \B0B4\C5D0\C11C \C704\CE58\B97C \C870\C815\D558\C2ED\C2DC\C624.</p>'),
'',
unistr('<p>\C774\BBF8\C9C0 \C790\B974\AE30 \B3C4\AD6C\C5D0 \D3EC\CEE4\C2A4\AC00 \C788\C73C\BA74 \B2E4\C74C \D0A4\BCF4\B4DC \B2E8\CD95\D0A4\B97C \C0AC\C6A9\D560 \C218 \C788\C2B5\B2C8\B2E4.</p>'),
'<ul>',
unistr('    <li>\C67C\CABD \D654\C0B4\D45C: \C774\BBF8\C9C0\B97C \C67C\CABD\C73C\B85C \C774\B3D9*</li>'),
unistr('    <li>\C704\CABD \D654\C0B4\D45C: \C774\BBF8\C9C0\B97C \C704\CABD\C73C\B85C \C774\B3D9*</li>'),
unistr('    <li>\C624\B978\CABD \D654\C0B4\D45C: \C774\BBF8\C9C0\B97C \C624\B978\CABD\C73C\B85C \C774\B3D9*</li>'),
unistr('    <li>\C544\B798\CABD \D654\C0B4\D45C: \C774\BBF8\C9C0\B97C \C544\B798\CABD\C73C\B85C \C774\B3D9*</li>'),
unistr('    <li>I: \D655\B300</li>'),
unistr('    <li>O: \CD95\C18C</li>'),
unistr('    <li>L: \C67C\CABD\C73C\B85C \D68C\C804</li>'),
unistr('    <li>R: \C624\B978\CABD\C73C\B85C \D68C\C804</li>'),
'</ul>',
'',
unistr('<p class="margin-top-md"><em>*Shift \D0A4\B97C \B20C\B7EC\C11C \B354 \BE60\B974\AC8C \C774\B3D9</em></p>')))
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140416674605751753)
,p_name=>'APEX.ITEM.CROPPER.HELP.TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\BBF8\C9C0 \C790\B974\AE30 \B3C4\C6C0\B9D0')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140424550012751756)
,p_name=>'APEX.ITEM.CROPPER.RESET'
,p_message_language=>'ko'
,p_message_text=>unistr('\C7AC\C124\C815')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140416987015751753)
,p_name=>'APEX.ITEM.CROPPER.TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\BBF8\C9C0 \C790\B974\AE30')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140424649730751756)
,p_name=>'APEX.ITEM.CROPPER.ZOOM_SLIDER_LABEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2AC\B77C\C774\B354\B97C \C774\B3D9\D574\C11C \D655\B300/\CD95\C18C \B808\BCA8 \C870\C815')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140454243921751764)
,p_name=>'APEX.ITEM.FILE.ACCEPTED_TYPES'
,p_message_language=>'ko'
,p_message_text=>unistr('\D30C\C77C \C720\D615\C774 \BD80\C801\D569\D569\B2C8\B2E4. \C9C0\C6D0\B418\B294 \D30C\C77C \C720\D615\C740 %0\C785\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140588651142751804)
,p_name=>'APEX.ITEM.FILE.BROWSE'
,p_message_language=>'ko'
,p_message_text=>unistr('\CC3E\C544\BCF4\AE30')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140588347736751804)
,p_name=>'APEX.ITEM.FILE.CHOOSE_FILE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D30C\C77C \C120\D0DD')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140588455378751804)
,p_name=>'APEX.ITEM.FILE.CHOOSE_FILES'
,p_message_language=>'ko'
,p_message_text=>unistr('\D30C\C77C \C120\D0DD')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140454016214751764)
,p_name=>'APEX.ITEM.FILE.DROP_FILE'
,p_message_language=>'ko'
,p_message_text=>unistr('\B04C\C5B4 \B193\AE30')
,p_is_js_message=>true
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140454484434751764)
,p_name=>'APEX.ITEM.FILE.DROP_FILES'
,p_message_language=>'ko'
,p_message_text=>unistr('\D30C\C77C \B04C\C5B4 \B193\AE30')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140455874018751765)
,p_name=>'APEX.ITEM.FILE.DROP_OR_CHOOSE_FILE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D30C\C77C\C744 \C120\D0DD\D558\AC70\B098 \C5EC\AE30\C5D0 \B04C\C5B4 \B193\AE30.')
,p_is_js_message=>true
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140455930212751765)
,p_name=>'APEX.ITEM.FILE.DROP_OR_CHOOSE_FILES'
,p_message_language=>'ko'
,p_message_text=>unistr('\D30C\C77C\C744 \C120\D0DD\D558\AC70\B098 \C5EC\AE30\C5D0 \B04C\C5B4 \B193\AE30.')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140456046407751765)
,p_name=>'APEX.ITEM.FILE.DROP_OR_SELECT_FILE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D30C\C77C\C744 \C120\D0DD\D558\AC70\B098 \C5EC\AE30\C5D0 \B04C\C5B4 \B193\AE30.')
,p_is_js_message=>true
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140456143077751765)
,p_name=>'APEX.ITEM.FILE.DROP_OR_SELECT_FILES'
,p_message_language=>'ko'
,p_message_text=>unistr('\D30C\C77C\C744 \C120\D0DD\D558\AC70\B098 \C5EC\AE30\C5D0 \B04C\C5B4 \B193\AE30.')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140454384391751764)
,p_name=>'APEX.ITEM.FILE.FILES_WITH_COUNT'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \D30C\C77C')
,p_is_js_message=>true
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140454194319751764)
,p_name=>'APEX.ITEM.FILE.MAX_FILE_SIZE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D30C\C77C\C774 \B108\BB34 \D07D\B2C8\B2E4. \CD5C\B300 \D30C\C77C \D06C\AE30\B294 %0\C785\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140434695316751759)
,p_name=>'APEX.ITEM.FILE.MULTIPLE_FILES_NOT_SUPPORTED'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C911 \D30C\C77C \C5C5\B85C\B4DC\B294 \C9C0\C6D0\B418\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140417576143751754)
,p_name=>'APEX.ITEM.FILE.REMOVE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C81C\AC70')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140423013279751755)
,p_name=>'APEX.ITEM.GEOCODE.ADDRESS_REQUIRED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C8FC\C18C\B294 \D544\C218\C785\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140421980987751755)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_CITY'
,p_message_language=>'ko'
,p_message_text=>unistr('\AD6C/\AD70/\C2DC')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140422310396751755)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_COUNTRY'
,p_message_language=>'ko'
,p_message_text=>unistr('\AD6D\AC00 \CF54\B4DC')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140422056321751755)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_HOUSENUMBER'
,p_message_language=>'ko'
,p_message_text=>unistr('\D638')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140422994875751755)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_LATITUDE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C704\B3C4')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140422833784751755)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_LONGITUDE'
,p_message_language=>'ko'
,p_message_text=>unistr('\ACBD\B3C4')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140422721328751755)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_MAPLINK'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\B3C4\C5D0 \D45C\C2DC')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140422453014751755)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_MATCHSCORE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C810\C218')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140422104032751755)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_POSTALCODE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C6B0\D3B8 \BC88\D638')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140422285106751755)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_STATE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2DC/\B3C4')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140421863167751755)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_STREET'
,p_message_language=>'ko'
,p_message_text=>unistr('\B3D9/\B9AC')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140421710438751755)
,p_name=>'APEX.ITEM.GEOCODE.DIALOG_TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\C624\CF54\B529 \ACB0\ACFC')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140453220684751764)
,p_name=>'APEX.ITEM.GEOCODE.GEOCODING_DONE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\C624\CF54\B529\B428')
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140453355473751764)
,p_name=>'APEX.ITEM.GEOCODE.GEOCODING_OPEN'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\C624\CF54\B529\B418\C9C0 \C54A\C74C')
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140422623177751755)
,p_name=>'APEX.ITEM.GEOCODE.MAP_DIALOG_TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\B3C4')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140422518276751755)
,p_name=>'APEX.ITEM.GEOCODE.NO_DATA_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('\BC1C\ACAC\B41C \C8FC\C18C \C5C6\C74C.')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140423190769751755)
,p_name=>'APEX.ITEM.GEOCODE.REQUIRED'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C740(\B294) \D544\C218\C785\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140529365655751787)
,p_name=>'APEX.ITEM.GEOCODE.REQUIRED_MULTIPLE'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \B610\B294 %1\C774(\AC00) \D544\C694\D569\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705137
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140618889248751813)
,p_name=>'APEX.ITEM.HELP_TEXT'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C5D0 \B300\D55C \B3C4\C6C0\B9D0 \D14D\C2A4\D2B8\B97C \D655\C778\D569\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140424815526751756)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.CHOOSE_FILE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\BBF8\C9C0 \C120\D0DD')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140424960965751756)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.CHOOSE_FILES'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\BBF8\C9C0 \C120\D0DD')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140424766275751756)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DOWNLOAD_LINK_TEXT'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C6B4\B85C\B4DC')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140425059542751756)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_FILE'
,p_message_language=>'ko'
,p_message_text=>unistr('\B04C\C5B4 \B193\AE30')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140425124346751756)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_FILES'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\BBF8\C9C0 \B04C\C5B4 \B193\AE30')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140425259420751756)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_CHOOSE_FILE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\BBF8\C9C0\B97C \C120\D0DD\D558\AC70\B098 \C5EC\AE30\C5D0 \B04C\C5B4 \B193\C73C\C2ED\C2DC\C624.')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140425324422751756)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_CHOOSE_FILES'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\BBF8\C9C0\B97C \C120\D0DD\D558\AC70\B098 \C5EC\AE30\C5D0 \B04C\C5B4 \B193\C73C\C2ED\C2DC\C624.')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140425458037751756)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_SELECT_FILE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\BBF8\C9C0\B97C \C120\D0DD\D558\AC70\B098 \C5EC\AE30\C5D0 \B04C\C5B4 \B193\C73C\C2ED\C2DC\C624.')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140425522871751756)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_SELECT_FILES'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\BBF8\C9C0\B97C \C120\D0DD\D558\AC70\B098 \C5EC\AE30\C5D0 \B04C\C5B4 \B193\C73C\C2ED\C2DC\C624.')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140510299163751781)
,p_name=>'APEX.ITEM_TYPE.CHECKBOX.CHECKED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C120\D0DD\B428')
,p_is_js_message=>true
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140510342909751781)
,p_name=>'APEX.ITEM_TYPE.CHECKBOX.UNCHECKED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C120\D0DD \CDE8\C18C\B428')
,p_is_js_message=>true
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140537865615751789)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.EMPTY_READONLY_COMBOBOX'
,p_message_language=>'ko'
,p_message_text=>unistr('\BE44\C5B4 \C788\B294 \C77D\AE30 \C804\C6A9 \CF64\BCF4 \C0C1\C790')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140535637198751788)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.EMPTY_READONLY_LISTBOX'
,p_message_language=>'ko'
,p_message_text=>unistr('\BE44\C5B4 \C788\B294 \C77D\AE30 \C804\C6A9 \BAA9\B85D \C0C1\C790')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140535465407751788)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.READONLY_COMBOBOX'
,p_message_language=>'ko'
,p_message_text=>unistr('\C77D\AE30 \C804\C6A9 \CF64\BCF4 \C0C1\C790')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140535590325751788)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.READONLY_LISTBOX'
,p_message_language=>'ko'
,p_message_text=>unistr('\C77D\AE30 \C804\C6A9 \BAA9\B85D \C0C1\C790')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140451224684751763)
,p_name=>'APEX.ITEM_TYPE.SLIDER.VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'ko'
,p_message_text=>unistr('#LABEL#\C774 %0\BD80\D130 %1\AE4C\C9C0\C758 \C801\D569\D55C \BC94\C704\C5D0 \C18D\D558\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140451362453751763)
,p_name=>'APEX.ITEM_TYPE.SLIDER.VALUE_NOT_MULTIPLE_OF_STEP'
,p_message_language=>'ko'
,p_message_text=>unistr('#LABEL#\C774 %0\C758 \BC30\C218\AC00 \C544\B2D9\B2C8\B2E4.')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140538665176751789)
,p_name=>'APEX.ITEM_TYPE.SWITCH.READONLY_SWITCH'
,p_message_language=>'ko'
,p_message_text=>unistr('\C77D\AE30 \C804\C6A9 \C2A4\C704\CE58')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140479253716751772)
,p_name=>'APEX.ITEM_TYPE.TEXT.READONLY_WITH_LINK'
,p_message_language=>'ko'
,p_message_text=>unistr('\B9C1\D06C\AC00 \C788\B294 \C77D\AE30 \C804\C6A9 \D3B8\C9D1')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140450822464751763)
,p_name=>'APEX.ITEM_TYPE.YES_NO.INVALID_VALUE'
,p_message_language=>'ko'
,p_message_text=>unistr('#LABEL#\C774 \AC12 %0 \BC0F %1\ACFC(\C640) \C77C\CE58\D574\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140451012154751763)
,p_name=>'APEX.ITEM_TYPE.YES_NO.NO_LABEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C544\B2C8\C624')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140537331925751789)
,p_name=>'APEX.ITEM_TYPE.YES_NO.OFF_LABEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\D574\C81C')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140537407037751789)
,p_name=>'APEX.ITEM_TYPE.YES_NO.ON_LABEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C124\C815')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140450989720751763)
,p_name=>'APEX.ITEM_TYPE.YES_NO.YES_LABEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C608')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140458835992751766)
,p_name=>'APEX.LANGUAGE_SELECTOR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5B8\C5B4 \C120\D0DD\AE30')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140395271958751747)
,p_name=>'APEX.LIST_MANAGER.ADD_ENTRY'
,p_message_language=>'ko'
,p_message_text=>unistr('\D56D\BAA9 \CD94\AC00')
,p_version_scn=>2705111
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140572087841751799)
,p_name=>'APEX.LIST_MANAGER.BUTTON_ADD'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD94\AC00')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140572118974751799)
,p_name=>'APEX.LIST_MANAGER.BUTTON_REMOVE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C81C\AC70')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140395320014751747)
,p_name=>'APEX.LIST_MANAGER.SELECTED_ENTRY'
,p_message_language=>'ko'
,p_message_text=>unistr('\C120\D0DD\B41C \D56D\BAA9')
,p_version_scn=>2705111
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140575882742751800)
,p_name=>'APEX.LTO.ADVANCED'
,p_message_language=>'ko'
,p_message_text=>unistr('\ACE0\AE09')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140576110834751800)
,p_name=>'APEX.LTO.CANCEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\CDE8\C18C')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140575959573751800)
,p_name=>'APEX.LTO.COMMON'
,p_message_language=>'ko'
,p_message_text=>unistr('\C77C\BC18 \C0AC\D56D')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140576200912751800)
,p_name=>'APEX.LTO.LIVE_TEMPLATE_OPTIONS'
,p_message_language=>'ko'
,p_message_text=>unistr('\B77C\C774\BE0C \D15C\D50C\B9AC\D2B8 \C635\C158')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140576826261751801)
,p_name=>'APEX.LTO.NOT_APPLICABLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774 \AD6C\C131\C694\C18C\B294 \D398\C774\C9C0\C5D0\C11C \B80C\B354\B9C1\B418\C9C0 \C54A\C73C\BBC0\B85C \D15C\D50C\B9AC\D2B8 \C635\C158\C744 \C0AC\C6A9\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140575759648751800)
,p_name=>'APEX.LTO.NO_OPTIONS_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('\D15C\D50C\B9AC\D2B8 \C635\C158\C744 \CC3E\C744 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140576009163751800)
,p_name=>'APEX.LTO.SAVE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C800\C7A5')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140429804683751757)
,p_name=>'APEX.MAPS.CLEAR_CIRCLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C6D0 \C9C0\C6B0\AE30')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140432203459751758)
,p_name=>'APEX.MAPS.CUSTOM_STYLES_INVALID_JSON'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AC\C6A9\C790\C815\C758 \C2A4\D0C0\C77C\C774 \C801\D569\D55C JSON\C774 \C544\B2D9\B2C8\B2E4.')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140430117503751757)
,p_name=>'APEX.MAPS.DISTANCE_TOOL'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC70\B9AC \B3C4\AD6C')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140429969509751757)
,p_name=>'APEX.MAPS.DRAW_CIRCLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C6D0 \ADF8\B9AC\AE30')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140409752282751751)
,p_name=>'APEX.MAPS.FIND_MY_LOCATION'
,p_message_language=>'ko'
,p_message_text=>unistr('\D604\C7AC \C704\CE58')
,p_is_js_message=>true
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140416197449751753)
,p_name=>'APEX.MAPS.INIT_POINT_COORDINATES_INVALID'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD08\AE30 \C704\CE58 \C88C\D45C\AC00 \BD80\C801\D569\D569\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140405126983751750)
,p_name=>'APEX.MAPS.INIT_POINT_GEOMETRY_REQUIRED'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD08\AE30 \C704\CE58\B294 \D3EC\C778\D2B8 \B3C4\BA74\C774\C5B4\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140413719669751752)
,p_name=>'APEX.MAPS.KM'
,p_message_language=>'ko'
,p_message_text=>unistr('\D0AC\B85C\BBF8\D130')
,p_is_js_message=>true
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140408985222751751)
,p_name=>'APEX.MAPS.LAYER'
,p_message_language=>'ko'
,p_message_text=>unistr('\CE35')
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140579311926751801)
,p_name=>'APEX.MAPS.LAYER_NAME'
,p_message_language=>'ko'
,p_message_text=>unistr('\CE35: %0')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140428121065751757)
,p_name=>'APEX.MAPS.MAP'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\B3C4')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140397808118751748)
,p_name=>'APEX.MAPS.MAP_MESSAGES'
,p_message_language=>'ko'
,p_message_text=>unistr('\BA54\C2DC\C9C0')
,p_is_js_message=>true
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140413999930751752)
,p_name=>'APEX.MAPS.MILES'
,p_message_language=>'ko'
,p_message_text=>unistr('\B9C8\C77C')
,p_is_js_message=>true
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140578329459751801)
,p_name=>'APEX.MAPS.MORE_DATA_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('\B370\C774\D130\B294 \D5C8\C6A9\B418\B294 \CD5C\B300\AC12\C744 \CD08\ACFC\D558\B294 %0 \C774\C0C1\C758 \D589\C744 \D3EC\D568\D569\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140408294244751751)
,p_name=>'APEX.MAPS.ORACLE_MAP_COPYRIGHT'
,p_message_language=>'ko'
,p_message_text=>'&copy; 2022 Oracle Corporation &nbsp;&nbsp; <a rel="noopener noreferrer" target="_blank" href="https://elocation.oracle.com/elocation/legal.html">Terms</a> &nbsp;&nbsp; Map data &copy; 2021 HERE'
,p_is_js_message=>true
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140404878500751750)
,p_name=>'APEX.MAPS.ORACLE_SDO_GEOMETRY_NOT_AVAILABLE'
,p_message_language=>'ko'
,p_message_text=>unistr('SDO_GEOMETRY \B370\C774\D130 \C720\D615\C740 \C774 \B370\C774\D130\BCA0\C774\C2A4\C5D0\C11C \C0AC\C6A9\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140408364578751751)
,p_name=>'APEX.MAPS.OSM_MAP_COPYRIGHT'
,p_message_language=>'ko'
,p_message_text=>unistr('<a rel="noopener noreferrer" target="_blank" href="http://openmaptiles.org"> &copy; OpenMapTiles </a> &nbsp; <a rel="noopener noreferrer" target="_blank" href="https://www.openstreetmap.org/copyright"> &copy; OpenStreetMap \C81C\ACF5\C790 </a>')
,p_is_js_message=>true
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140432951247751758)
,p_name=>'APEX.MAPS.OSM_VECTOR_MAP_COPYRIGHT'
,p_message_language=>'ko'
,p_message_text=>unistr('<a rel="noopener noreferrer" target="blank" href="https://www.maptiler.com/copyright"> &copy; MapTiler</a> &nbsp; <a rel="noopener noreferrer" target="_blank" href="https://www.openstreetmap.org/copyright"> &copy; OpenStreetMap \C81C\ACF5\C790 </a>')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140409190585751751)
,p_name=>'APEX.MAPS.POINTS'
,p_message_language=>'ko'
,p_message_text=>unistr('\D3EC\C778\D2B8')
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140579461898751801)
,p_name=>'APEX.MAPS.POINTS_COUNT'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \D3EC\C778\D2B8')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140430043045751757)
,p_name=>'APEX.MAPS.RECTANGLE_ZOOM'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C1\C0AC\AC01\D615 \D655\B300/\CD95\C18C')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140429782714751757)
,p_name=>'APEX.MAPS.REMOVE_MESSAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C81C\AC70')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140409569716751751)
,p_name=>'APEX.MAPS.RESET_BEARING_TO_NORTH'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCA0\C5B4\B9C1\C744 \BD81\CABD\C73C\B85C \C7AC\C124\C815')
,p_is_js_message=>true
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140524331024751785)
,p_name=>'APEX.MAPS.TOGGLE_2D_MODE'
,p_message_language=>'ko'
,p_message_text=>unistr('2D \BAA8\B4DC\B85C \D1A0\AE00')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140524495441751785)
,p_name=>'APEX.MAPS.TOGGLE_3D_MODE'
,p_message_language=>'ko'
,p_message_text=>unistr('3D \BAA8\B4DC\B85C \D1A0\AE00')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140429697624751757)
,p_name=>'APEX.MAPS.TOGGLE_COPYRIGHT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C800\C791\AD8C \D1B5\C9C0 \D1A0\AE00')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140430201720751757)
,p_name=>'APEX.MAPS.TOTAL_DISTANCE'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD1D \AC70\B9AC')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140409220166751751)
,p_name=>'APEX.MAPS.ZOOM_IN'
,p_message_language=>'ko'
,p_message_text=>unistr('\D655\B300')
,p_is_js_message=>true
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140409452323751751)
,p_name=>'APEX.MAPS.ZOOM_OUT'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD95\C18C')
,p_is_js_message=>true
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140573994481751800)
,p_name=>'APEX.MARKDOWN.BOLD'
,p_message_language=>'ko'
,p_message_text=>unistr('\AD75\C740\CCB4')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140574836287751800)
,p_name=>'APEX.MARKDOWN.IMAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\BBF8\C9C0')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140574493447751800)
,p_name=>'APEX.MARKDOWN.INLINE_CODE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C778\B77C\C778 \CF54\B4DC')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140587163711751804)
,p_name=>'APEX.MARKDOWN.INSERT_IMAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\BBF8\C9C0 \C0BD\C785')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140587242075751804)
,p_name=>'APEX.MARKDOWN.INSERT_LINK'
,p_message_language=>'ko'
,p_message_text=>unistr('\B9C1\D06C \C0BD\C785')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140574078544751800)
,p_name=>'APEX.MARKDOWN.ITALIC'
,p_message_language=>'ko'
,p_message_text=>unistr('\AE30\C6B8\C784\AF34')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140587896764751804)
,p_name=>'APEX.MARKDOWN.LINK'
,p_message_language=>'ko'
,p_message_text=>unistr('\B9C1\D06C')
,p_is_js_message=>true
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140574730201751800)
,p_name=>'APEX.MARKDOWN.LIST'
,p_message_language=>'ko'
,p_message_text=>unistr('\BAA9\B85D')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140574629059751800)
,p_name=>'APEX.MARKDOWN.ORDERED_LIST'
,p_message_language=>'ko'
,p_message_text=>unistr('\C21C\CC28 \BAA9\B85D')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140574152332751800)
,p_name=>'APEX.MARKDOWN.PREVIEW'
,p_message_language=>'ko'
,p_message_text=>unistr('\BBF8\B9AC\BCF4\AE30')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140574294927751800)
,p_name=>'APEX.MARKDOWN.PREVIEW_EMPTY'
,p_message_language=>'ko'
,p_message_text=>unistr('\BBF8\B9AC \BCFC \D56D\BAA9 \C5C6\C74C')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140574326452751800)
,p_name=>'APEX.MARKDOWN.STRIKETHROUGH'
,p_message_language=>'ko'
,p_message_text=>unistr('\CDE8\C18C\C120')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140574556749751800)
,p_name=>'APEX.MARKDOWN.UNORDERED_LIST'
,p_message_language=>'ko'
,p_message_text=>unistr('\BE44\C21C\CC28 \BAA9\B85D')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140553402331751794)
,p_name=>'APEX.MENU.CURRENT_MENU'
,p_message_language=>'ko'
,p_message_text=>unistr('\D604\C7AC')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140609635669751810)
,p_name=>'APEX.MENU.OVERFLOW_LABEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\B354 \BCF4\AE30...')
,p_is_js_message=>true
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140553303316751794)
,p_name=>'APEX.MENU.PROCESSING'
,p_message_language=>'ko'
,p_message_text=>unistr('\B85C\B4DC \C911')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140467555258751768)
,p_name=>'APEX.MENU.SPLIT_BUTTON'
,p_message_language=>'ko'
,p_message_text=>unistr('\BD84\D560 \B2E8\CD94')
,p_is_js_message=>true
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140467434294751768)
,p_name=>'APEX.MENU.SPLIT_MENU'
,p_message_language=>'ko'
,p_message_text=>unistr('\BD84\D560 \BA54\B274')
,p_is_js_message=>true
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140584400784751803)
,p_name=>'APEX.NOTIFICATION_MESSAGE_HEADING'
,p_message_language=>'ko'
,p_message_text=>unistr('\D1B5\C9C0 \BA54\C2DC\C9C0')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140408525516751751)
,p_name=>'APEX.NO_DATA_FOUND_ENTITY'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C744(\B97C) \CC3E\C744 \C218 \C5C6\C74C')
,p_is_js_message=>true
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140558498570751795)
,p_name=>'APEX.NUMBER_FIELD.VALUE_GREATER_MAX_VALUE'
,p_message_language=>'ko'
,p_message_text=>unistr('#LABEL#\C740(\B294) %0\BCF4\B2E4 \C791\AC70\B098 \AC19\C740 \C22B\C790\C5EC\C57C \D569\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140558589019751795)
,p_name=>'APEX.NUMBER_FIELD.VALUE_INVALID'
,p_message_language=>'ko'
,p_message_text=>unistr('#LABEL#\C740(\B294) \C801\D569\D55C \C22B\C790\C5EC\C57C \D569\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140558622973751795)
,p_name=>'APEX.NUMBER_FIELD.VALUE_INVALID2'
,p_message_language=>'ko'
,p_message_text=>unistr('#LABEL#\C774 \C22B\C790 \D615\C2DD %0\ACFC(\C640) \C77C\CE58\D558\C9C0 \C54A\C2B5\B2C8\B2E4(\C608: %1).')
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140558372413751795)
,p_name=>'APEX.NUMBER_FIELD.VALUE_LESS_MIN_VALUE'
,p_message_language=>'ko'
,p_message_text=>unistr('#LABEL#\C740(\B294) %0\BCF4\B2E4 \D06C\AC70\B098 \AC19\C740 \C22B\C790\C5EC\C57C \D569\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140558279952751795)
,p_name=>'APEX.NUMBER_FIELD.VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'ko'
,p_message_text=>unistr('#LABEL#\C740(\B294) %0\C5D0\C11C %1\C0AC\C774\C758 \C22B\C790\C5EC\C57C \D569\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140553571176751794)
,p_name=>'APEX.OPENS_IN_NEW_WINDOW_LOWER'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0C8 \CC3D\C5D0\C11C \C5F4\AE30')
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140503321726751779)
,p_name=>'APEX.PAGE.DUPLICATE_SUBMIT'
,p_message_language=>'ko'
,p_message_text=>unistr(' \C774 \D398\C774\C9C0\B294 \C774\BBF8 \C81C\CD9C\B418\C5C8\C73C\BA70 \B2E4\C2DC \C81C\CD9C\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140484731914751773)
,p_name=>'APEX.PAGE.NOT_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('"%0" \C560\D50C\B9AC\CF00\C774\C158 "%1" \D398\C774\C9C0\B97C \CC3E\C744 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140520201690751784)
,p_name=>'APEX.PAGE_ITEM_IS_REQUIRED'
,p_message_language=>'ko'
,p_message_text=>unistr('#LABEL# \AC12\C744 \C785\B825\D574\C57C \D569\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140410962082751752)
,p_name=>'APEX.PASSWORD.HIDE_PASSWORD'
,p_message_language=>'ko'
,p_message_text=>unistr('\BE44\BC00\BC88\D638 \C228\AE30\AE30')
,p_is_js_message=>true
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140410802050751752)
,p_name=>'APEX.PASSWORD.SHOW_PASSWORD'
,p_message_language=>'ko'
,p_message_text=>unistr('\BE44\BC00\BC88\D638 \D45C\C2DC')
,p_is_js_message=>true
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140458479163751766)
,p_name=>'APEX.POPUP.SEARCH'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC80\C0C9')
,p_is_js_message=>true
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140572417736751799)
,p_name=>'APEX.POPUP_LOV.BUTTON_CLOSE'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2EB\AE30')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140572384933751799)
,p_name=>'APEX.POPUP_LOV.BUTTON_FIND'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \CC3E\AE30')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140572676143751799)
,p_name=>'APEX.POPUP_LOV.BUTTON_NEXT'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140572580835751799)
,p_name=>'APEX.POPUP_LOV.BUTTON_PREV'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\C804')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140449250490751763)
,p_name=>'APEX.POPUP_LOV.FILTER_REQ'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC80\C0C9\C5B4\B97C %0\C790 \C774\C0C1 \C785\B825\D569\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140525580472751785)
,p_name=>'APEX.POPUP_LOV.ICON_TEXT'
,p_message_language=>'ko'
,p_message_text=>unistr('\D31D\C5C5 \AC12 \BAA9\B85D: %0')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140449326959751763)
,p_name=>'APEX.POPUP_LOV.INITIAL_FILTER_REQ'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC80\C0C9\C5B4\B97C \C785\B825\D558\C2ED\C2DC\C624.')
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140396386294751747)
,p_name=>'APEX.POPUP_LOV.LIST_OF_VALUES'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC12 \BAA9\B85D')
,p_is_js_message=>true
,p_version_scn=>2705112
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140449107339751763)
,p_name=>'APEX.POPUP_LOV.NO_RESULTS'
,p_message_language=>'ko'
,p_message_text=>unistr('\ACB0\ACFC\B97C \CC3E\C744 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140449061726751763)
,p_name=>'APEX.POPUP_LOV.REMOVE_VALUE'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C81C\AC70')
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140546217125751792)
,p_name=>'APEX.POPUP_LOV.SEARCH'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC80\C0C9\C5B4')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140572232508751799)
,p_name=>'APEX.POPUP_LOV.TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC80\C0C9')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140398453139751748)
,p_name=>'APEX.PRINT.DOCGEN_REQUIRED'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \D544\C694.')
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140410766779751752)
,p_name=>'APEX.PRINT_REPORT.ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\ACE0\C11C \C778\C1C4 \C911 \C624\B958 \BC1C\C0DD.')
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140421560872751755)
,p_name=>'APEX.PRINT_UTIL.UNABLE_TO_PRINT'
,p_message_language=>'ko'
,p_message_text=>unistr('\AD6C\C131\B41C \C778\C1C4 \C11C\BC84\B97C \C0AC\C6A9\D558\C5EC \BB38\C11C\B97C \C778\C1C4\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140444256041751761)
,p_name=>'APEX.PROCESS.INVOKE_API.PARAMETER_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('%1\C744(\B97C) \D638\CD9C\D560 \B54C %0 \B9E4\AC1C\BCC0\C218 \D3C9\AC00 \C911 \C624\B958\AC00 \BC1C\C0DD\D588\C2B5\B2C8\B2E4. \C790\C138\D55C \B0B4\C6A9\C740 \C624\B958 \B85C\ADF8\B97C \CC38\C870\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140582965077751802)
,p_name=>'APEX.PROCESSING'
,p_message_language=>'ko'
,p_message_text=>unistr('\D504\B85C\C138\C2F1')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140442037262751761)
,p_name=>'APEX.PWA.DIALOG.HIDE.INSTRUCTIONS'
,p_message_language=>'ko'
,p_message_text=>unistr('\B4A4\B85C')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140443112456751761)
,p_name=>'APEX.PWA.DIALOG.INTRO'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774 \C6F9\C0AC\C774\D2B8\C5D0\B294 \C571 \AE30\B2A5\C774 \C788\C2B5\B2C8\B2E4. \CD5C\ACE0\C758 \ACBD\D5D8\C744 \C704\D574 \C7A5\CE58\C5D0 \C124\CE58\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140444472864751761)
,p_name=>'APEX.PWA.DIALOG.SHOW.INSTRUCTIONS'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140446022312751762)
,p_name=>'APEX.PWA.DIALOG.TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774 \C571 \C124\CE58')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140430889732751757)
,p_name=>'APEX.PWA.INSTRUCTIONS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AC\C6A9 \C911\C778 \C7A5\CE58 \B610\B294 \BE0C\B77C\C6B0\C800\C5D0\C11C \D604\C7AC \D504\B85C\ADF8\B808\C2DC\BE0C \C6F9 \C571 \C124\CE58\B97C \C9C0\C6D0\D558\C9C0 \C54A\B294 \AC83 \AC19\C2B5\B2C8\B2E4.')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140425939831751756)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP1'
,p_message_language=>'ko'
,p_message_text=>unistr('1. <strong>\ACF5\C720</strong> \C544\C774\CF58\C744 \B204\B985\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140426019401751756)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP2'
,p_message_language=>'ko'
,p_message_text=>unistr('2. \C544\B798\B85C \C774\B3D9\D558\C5EC <strong>\D648 \D654\BA74\C5D0 \CD94\AC00</strong>\B97C \B204\B985\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140442408455751761)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP3'
,p_message_language=>'ko'
,p_message_text=>unistr('3. <strong style="color:#007AE1;">\CD94\AC00</strong>\B97C \B20C\B7EC \D655\C778\D569\B2C8\B2E4.')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140441527863751761)
,p_name=>'APEX.PWA.OFFLINE.BODY'
,p_message_language=>'ko'
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
unistr('    <h1>\C811\C18D\D560 \C218 \C5C6\C74C</h1>'),
unistr('    <p>\B124\D2B8\C6CC\D06C\C5D0 \BB38\C81C\AC00 \C788\B294 \AC83 \AC19\C2B5\B2C8\B2E4. \C811\C18D\C744 \D655\C778\D558\ACE0 \B2E4\C2DC \C2DC\B3C4\D558\C2ED\C2DC\C624.</p>'),
unistr('    <button type="button">\C7AC\C2DC\B3C4</button>'),
'</main>',
'',
'<script>',
'    document.querySelector("button").addEventListener("click", () => {',
'        window.location.reload();',
'    });',
'</script>'))
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140441482393751761)
,p_name=>'APEX.PWA.OFFLINE.TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C811\C18D\D560 \C218 \C5C6\C74C')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140488086984751774)
,p_name=>'APEX.PWA.PUSH.SUBSCRIPTION_FAILED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774 \C7A5\CE58\B294 \D478\C2DC \D1B5\C9C0\B97C \C0AC\C6A9\C73C\B85C \C124\C815\D558\B294 \B370 \C2E4\D328\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140493565951751776)
,p_name=>'APEX.QUICK_PICK.GROUP_LABEL'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C5D0 \B300\D55C \BE60\B978 \C120\D0DD')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140493401041751776)
,p_name=>'APEX.QUICK_PICK.LINK_ROLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\B9C1\D06C \BE60\B978 \C120\D0DD')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140467283186751768)
,p_name=>'APEX.RADIO.VISUALLY_HIDDEN_RADIO'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2DC\AC01\C801\C73C\B85C \C228\ACA8\C9C4 \B77C\B514\C624 \B2E8\CD94')
,p_is_js_message=>true
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140411378212751752)
,p_name=>'APEX.RECORD_VIEW.TOOLBAR'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E8\C77C \D589 \BCF4\AE30')
,p_is_js_message=>true
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140594038424751806)
,p_name=>'APEX.REGION.CSSCALENDAR.ADD'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD94\AC00')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140539342399751790)
,p_name=>'APEX.REGION.CSSCALENDAR.ALL_DAY'
,p_message_language=>'ko'
,p_message_text=>unistr('\D558\B8E8 \C885\C77C')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140616912421751812)
,p_name=>'APEX.REGION.CSSCALENDAR.BUTTON.SENDEMAIL'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD08\B300 \C804\C1A1')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140616778360751812)
,p_name=>'APEX.REGION.CSSCALENDAR.CHOOSE_ACTION'
,p_message_language=>'ko'
,p_message_text=>unistr('\C635\C158')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140541132328751790)
,p_name=>'APEX.REGION.CSSCALENDAR.DAILY_ALLDAY'
,p_message_language=>'ko'
,p_message_text=>unistr('\C885\C77C \C77C\AC04 \BCF4\AE30 ')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140540947240751790)
,p_name=>'APEX.REGION.CSSCALENDAR.DAILY_TIME_SPECIFIC'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2DC\AC04 \D3EC\D568 \C77C\AC04 \B370\C774\D130 \BCF4\AE30 ')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140585146851751803)
,p_name=>'APEX.REGION.CSSCALENDAR.DAY'
,p_message_language=>'ko'
,p_message_text=>unistr('\C77C')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140580198426751802)
,p_name=>'APEX.REGION.CSSCALENDAR.DESCRIPTION'
,p_message_language=>'ko'
,p_message_text=>unistr('\C124\BA85')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140463689294751767)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.CSV'
,p_message_language=>'ko'
,p_message_text=>'CSV'
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140463476775751767)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.ICALENDAR'
,p_message_language=>'ko'
,p_message_text=>'iCal'
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140463320020751767)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.PDF'
,p_message_language=>'ko'
,p_message_text=>'PDF'
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140463506638751767)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.XML'
,p_message_language=>'ko'
,p_message_text=>'XML'
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140463018102751767)
,p_name=>'APEX.REGION.CSSCALENDAR.ENDDATE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C885\B8CC \B0A0\C9DC')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140463201741751767)
,p_name=>'APEX.REGION.CSSCALENDAR.EVENTNAME'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\BCA4\D2B8 \C774\B984')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140616849662751812)
,p_name=>'APEX.REGION.CSSCALENDAR.INVITATION'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD08\B300')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140585246253751803)
,p_name=>'APEX.REGION.CSSCALENDAR.LIST'
,p_message_language=>'ko'
,p_message_text=>unistr('\BAA9\B85D')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140584918051751803)
,p_name=>'APEX.REGION.CSSCALENDAR.MONTH'
,p_message_language=>'ko'
,p_message_text=>unistr('\C6D4')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140587548216751804)
,p_name=>'APEX.REGION.CSSCALENDAR.NEXT'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140601500179751808)
,p_name=>'APEX.REGION.CSSCALENDAR.NOEVENTS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\BCA4\D2B8 \C5C6\C74C')
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140617155223751812)
,p_name=>'APEX.REGION.CSSCALENDAR.OPTION.FORM'
,p_message_language=>'ko'
,p_message_text=>unistr('\AE30\C874 \C774\BCA4\D2B8\B97C \D3B8\C9D1\D569\B2C8\B2E4.')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140617024357751812)
,p_name=>'APEX.REGION.CSSCALENDAR.OPTION.SEND'
,p_message_language=>'ko'
,p_message_text=>unistr('\C804\C790\BA54\C77C\C744 \D1B5\D574 \CD08\B300\B97C \C804\C1A1\D558\B294 \C911\C785\B2C8\B2E4.')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140587690227751804)
,p_name=>'APEX.REGION.CSSCALENDAR.PREVIOUS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\C804')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140595375210751806)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C804\C790\BA54\C77C \C804\C1A1')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140595104570751806)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.BUTTON'
,p_message_language=>'ko'
,p_message_text=>unistr('\C804\C790\BA54\C77C \C804\C1A1')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140617754864751813)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.DIALOG.REQUIRED'
,p_message_language=>'ko'
,p_message_text=>unistr('\BAA8\B4E0 \D544\B4DC\B294 \D544\C218\C785\B2C8\B2E4.')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140617634680751813)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.DIALOG.TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD08\B300 \C804\C1A1')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140616648498751812)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.SUBJECT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C81C\BAA9')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140595218750751806)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.TO'
,p_message_language=>'ko'
,p_message_text=>unistr('\BC1B\B294 \C0AC\B78C')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140463145253751767)
,p_name=>'APEX.REGION.CSSCALENDAR.STARTDATE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2DC\C791 \B0A0\C9DC')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140593347591751805)
,p_name=>'APEX.REGION.CSSCALENDAR.TABLEFORM'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C5D0 \B300\D55C \D3FC')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140540751811751790)
,p_name=>'APEX.REGION.CSSCALENDAR.TIME'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2DC\AC04')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140587760378751804)
,p_name=>'APEX.REGION.CSSCALENDAR.TODAY'
,p_message_language=>'ko'
,p_message_text=>unistr('\C624\B298')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140585724322751803)
,p_name=>'APEX.REGION.CSSCALENDAR.VIEW'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\AE30')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140585013434751803)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEK'
,p_message_language=>'ko'
,p_message_text=>unistr('\C8FC')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140541040804751790)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEKLY_ALLDAY'
,p_message_language=>'ko'
,p_message_text=>unistr('\C885\C77C \C8FC\AC04 \BCF4\AE30')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140540870350751790)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEKLY_TIME_SPECIFIC'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2DC\AC04 \D3EC\D568 \C8FC\AC04 \B370\C774\D130 \BCF4\AE30')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140585653847751803)
,p_name=>'APEX.REGION.CSSCALENDAR.YEAR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F0\B3C4')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140585353475751803)
,p_name=>'APEX.REGION.JQM_COLUMN_TOGGLE.COLUMNS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F4...')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140585490710751803)
,p_name=>'APEX.REGION.JQM_COLUMN_TOGGLE.LOAD_MORE'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD94\AC00 \B85C\B4DC...')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140514832724751782)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.BACK'
,p_message_language=>'ko'
,p_message_text=>unistr('\B4A4\B85C')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140456380459751765)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.LOAD_MORE'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD94\AC00 \B85C\B4DC...')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140458641024751766)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.SEARCH'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC80\C0C9...')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140585575992751803)
,p_name=>'APEX.REGION.JQM_REFLOW.LOAD_MORE'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD94\AC00 \B85C\B4DC...')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140587430113751804)
,p_name=>'APEX.REGION.NOT_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('\C601\C5ED ID %0\C744(\B97C) \CC3E\C744 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140458571553751766)
,p_name=>'APEX.REGION.NO_DATA_FOUND_MESSAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\B370\C774\D130\B97C \CC3E\C744 \C218 \C5C6\C74C')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140486020060751774)
,p_name=>'APEX.REGION.PAGINATION.RESET_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C601\C5ED \D398\C774\C9C0 \BC88\D638 \B9E4\AE40\C744 \C7AC\C124\C815\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140449791342751763)
,p_name=>'APEX.REGION.PAGINATION.UNHANDLED_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C601\C5ED \D398\C774\C9C0 \BC88\D638 \B9E4\AE40\C744 \C124\C815\D558\B294 \C911 \C624\B958\AC00 \BC1C\C0DD\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140579558182751801)
,p_name=>'APEX.REGION.RESPONSIVE_TABLE.COLUMNS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F4...')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140434067397751758)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.LAZY_LOADING_INCOMPATIBLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E8\C77C (\BD80\BD84) \C601\C5ED\C778 %0\C758 \C2AC\B86F\ACFC \C9C0\C5F0 \B85C\B529\C774 \D638\D658\B418\C9C0 \C54A\C2B5\B2C8\B2E4. \C774 \C601\C5ED\C5D0 \B300\D574 \C9C0\C5F0 \B85C\B529\C744 \C0AC\C6A9 \C548\D568\C73C\B85C \C124\C815\D558\AC70\B098 \C2AC\B86F \AD6C\C131\C694\C18C\B97C \B2E4\B978 \C601\C5ED\C73C\B85C \C774\B3D9\D574\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140429334775751757)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.NO_GROUP_TEMPLATE'
,p_message_language=>'ko'
,p_message_text=>unistr('\ADF8\B8F9 \D15C\D50C\B9AC\D2B8\AC00 %0\C5D0 \B300\D55C \D15C\D50C\B9AC\D2B8 \AD6C\C131\C694\C18C\C5D0\C11C \B204\B77D\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140424341588751756)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.TOO_MANY_ROWS'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C740(\B294) \B2E8\C77C(\BD80\BD84) \C601\C5ED\C774\BA70 \B2E4\C911 \D589\C744 \BC18\D658\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140587356112751804)
,p_name=>'APEX.REGION.TYPE_NOT_SUPPORTED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C601\C5ED \C720\D615 %0\C740(\B294) \C9C0\C6D0\B418\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140449647603751763)
,p_name=>'APEX.REGION.UNHANDLED_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('"#COMPONENT_NAME#" \C601\C5ED\C744 \B80C\B354\B9C1\D558\B294 \C911 \C624\B958\AC00 \BC1C\C0DD\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140520346570751784)
,p_name=>'APEX.REGION_COLUMN_IS_REQUIRED'
,p_message_language=>'ko'
,p_message_text=>unistr('#COLUMN_HEADER# \AC12\C744 \C785\B825\D574\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140401936060751749)
,p_name=>'APEX.REPORT_QUERY.LAYOUT_REQUIRED'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\ACE0\C11C \B808\C774\C544\C6C3\C744 \C9C0\C815\D574\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705114
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140616246605751812)
,p_name=>'APEX.RICH_TEXT_EDITOR.ACCESSIBLE_LABEL'
,p_message_language=>'ko'
,p_message_text=>unistr('%0, \C11C\C2DD \C788\B294 \D14D\C2A4\D2B8 \D3B8\C9D1\AE30')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140522469713751785)
,p_name=>'APEX.RICH_TEXT_EDITOR.MAXIMUM_LENGTH_EXCEEDED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C11C\C2DD \C788\B294 \D14D\C2A4\D2B8 HTML \B9C8\D06C\C5C5\C774 \D56D\BAA9\C758 \CD5C\B300 \AE38\C774\B97C \CD08\ACFC\D568(\C2E4\C81C %0\C790, \D5C8\C6A9\B41C %1\C790)')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140431870953751758)
,p_name=>'APEX.RTE.READ_ONLY_RICH_TEXT_EDITOR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C77D\AE30 \C804\C6A9 \C11C\C2DD \C788\B294 \D14D\C2A4\D2B8 \D3B8\C9D1\AE30')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140431725516751758)
,p_name=>'APEX.RTE.RICH_TEXT_EDITOR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C11C\C2DD \C788\B294 \D14D\C2A4\D2B8 \D3B8\C9D1\AE30')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140431553132751758)
,p_name=>'APEX.RTE.TOOLBAR_ALIGNMENT'
,p_message_language=>'ko'
,p_message_text=>unistr('\B9DE\CDA4')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140431676671751758)
,p_name=>'APEX.RTE.TOOLBAR_EXTRAS'
,p_message_language=>'ko'
,p_message_text=>unistr('\AE30\D0C0')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140431377807751758)
,p_name=>'APEX.RTE.TOOLBAR_FONT'
,p_message_language=>'ko'
,p_message_text=>unistr('\AE00\AF34')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140431266385751758)
,p_name=>'APEX.RTE.TOOLBAR_FORMATTING'
,p_message_language=>'ko'
,p_message_text=>unistr('\D615\C2DD \C9C0\C815')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140431445582751758)
,p_name=>'APEX.RTE.TOOLBAR_LISTS'
,p_message_language=>'ko'
,p_message_text=>unistr('\BAA9\B85D')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140584559943751803)
,p_name=>'APEX.RV.DELETE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AD\C81C')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140577052628751801)
,p_name=>'APEX.RV.DUPLICATE'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF5\C81C')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140575375412751800)
,p_name=>'APEX.RV.EXCLUDE_HIDDEN'
,p_message_language=>'ko'
,p_message_text=>unistr('\D45C\C2DC\B41C \C5F4')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140575278231751800)
,p_name=>'APEX.RV.EXCLUDE_NULL'
,p_message_language=>'ko'
,p_message_text=>unistr('\B110 \AC12 \C81C\C678')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140584634149751803)
,p_name=>'APEX.RV.INSERT'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD94\AC00')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140538946213751789)
,p_name=>'APEX.RV.MOVE_DOWN'
,p_message_language=>'ko'
,p_message_text=>unistr('\C544\B798\B85C \C774\B3D9')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140539093924751789)
,p_name=>'APEX.RV.MOVE_UP'
,p_message_language=>'ko'
,p_message_text=>unistr('\C704\B85C \C774\B3D9')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140575041334751800)
,p_name=>'APEX.RV.NEXT_RECORD'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140575620444751800)
,p_name=>'APEX.RV.NOT_GROUPED_LABEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\AE30\D0C0 \C5F4')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140575132890751800)
,p_name=>'APEX.RV.PREV_RECORD'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\C804')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140575457326751800)
,p_name=>'APEX.RV.REC_X'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589 %0')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140575530311751800)
,p_name=>'APEX.RV.REC_XY'
,p_message_language=>'ko'
,p_message_text=>unistr('%0/%1 \D589')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140577160350751801)
,p_name=>'APEX.RV.REFRESH'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0C8\B85C\ACE0\CE68')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140577298695751801)
,p_name=>'APEX.RV.REVERT'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCC0\ACBD\C0AC\D56D \BCF5\C6D0')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140574998263751800)
,p_name=>'APEX.RV.SETTINGS_MENU'
,p_message_language=>'ko'
,p_message_text=>unistr('\C124\C815')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140534149708751788)
,p_name=>'APEX.SAMPLE_FORMAT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C608: %0')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140538478646751789)
,p_name=>'APEX.SAMPLE_FORMAT_SHORT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C608: %0')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140451134380751763)
,p_name=>'APEX.SEARCH.1_RESULT_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('1\AC1C \ACB0\ACFC')
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140448210168751763)
,p_name=>'APEX.SEARCH.N_RESULTS_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\AC1C \ACB0\ACFC')
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140500026553751778)
,p_name=>'APEX.SEARCH.PAGINATION'
,p_message_language=>'ko'
,p_message_text=>unistr('\D398\C774\C9C0 \B9E4\AE40')
,p_is_js_message=>true
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140500151976751778)
,p_name=>'APEX.SEARCH.RESULTS_X_TO_Y'
,p_message_language=>'ko'
,p_message_text=>unistr('\ACB0\ACFC, %0 - %1')
,p_is_js_message=>true
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140395806789751747)
,p_name=>'APEX.SESSION.ALERT.CREATE_NEW'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C2DC \C0AC\C778\C778')
,p_is_js_message=>true
,p_version_scn=>2705111
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140395795330751747)
,p_name=>'APEX.SESSION.ALERT.EXPIRED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C138\C158\C774 \C885\B8CC\B418\C5C8\C2B5\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705111
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140395916023751747)
,p_name=>'APEX.SESSION.ALERT.EXTEND'
,p_message_language=>'ko'
,p_message_text=>unistr('\D655\C7A5')
,p_is_js_message=>true
,p_version_scn=>2705111
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140395516340751747)
,p_name=>'APEX.SESSION.ALERT.IDLE_WARN'
,p_message_language=>'ko'
,p_message_text=>unistr('\C138\C158\C774 %0\C5D0 \C885\B8CC\B429\B2C8\B2E4. \D655\C7A5\D558\ACA0\C2B5\B2C8\AE4C?')
,p_is_js_message=>true
,p_version_scn=>2705111
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140395661130751747)
,p_name=>'APEX.SESSION.ALERT.MAX_WARN'
,p_message_language=>'ko'
,p_message_text=>unistr('\C138\C158\C774 %0\C5D0 \C885\B8CC\B418\BA70 \D655\C7A5\D560 \C218 \C5C6\C2B5\B2C8\B2E4. \B370\C774\D130\AC00 \C190\C2E4\B418\C9C0 \C54A\B3C4\B85D \BC14\B85C \C791\C5C5\C744 \C800\C7A5\D558\C2ED\C2DC\C624.')
,p_is_js_message=>true
,p_version_scn=>2705111
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140594940678751806)
,p_name=>'APEX.SESSION.DB_SESSION_CLEANUP.UNHANDLED_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\B370\C774\D130\BCA0\C774\C2A4 \C138\C158 \C815\B9AC \CF54\B4DC\B97C \CC98\B9AC\D558\B294 \C911 \C624\B958\AC00 \BC1C\C0DD\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140484679549751773)
,p_name=>'APEX.SESSION.DB_SESSION_INIT.UNHANDLED_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\B370\C774\D130\BCA0\C774\C2A4 \C138\C158 \C124\C815 \CF54\B4DC\B97C \CC98\B9AC\D558\B294 \C911 \C624\B958\AC00 \BC1C\C0DD\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140455053664751765)
,p_name=>'APEX.SESSION.EXPIRED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C138\C158\C774 \C885\B8CC\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140594102170751806)
,p_name=>'APEX.SESSION.EXPIRED.CLOSE_DIALOG'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774 \B300\D654\C0C1\C790\B97C \B2EB\ACE0 \BE0C\B77C\C6B0\C800\C758 \B2E4\C2DC \B85C\B4DC \B2E8\CD94\B97C \B20C\B7EC\C11C \C0C8 \C138\C158\C744 \AC00\C838\C624\C2ED\C2DC\C624.')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140613009322751811)
,p_name=>'APEX.SESSION.EXPIRED.NEW_SESSION'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0C8 \C138\C158\C744 \C0DD\C131\D558\B824\BA74 \B2E4\C2DC <a href="%0">\C0AC\C778\C778</a>\D569\B2C8\B2E4.')
,p_version_scn=>2705148
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140497318775751777)
,p_name=>'APEX.SESSION.NOT_VALID'
,p_message_language=>'ko'
,p_message_text=>unistr('\BD80\C801\D569\D55C \C138\C158')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140540435236751790)
,p_name=>'APEX.SESSION.RAS.NO_DYNAMIC_ROLES'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AC\C6A9\C790 "%0"\C5D0 \B300\D574 Real Application Security \C138\C158\C5D0\C11C \B3D9\C801 \B864\C744 \C0AC\C6A9\C73C\B85C \C124\C815\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140482595549751773)
,p_name=>'APEX.SESSION.UNHANDLED_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('ERR-99900 \ACE0\C720 \C138\C158 ID\B97C \C0DD\C131\D560 \C218 \C5C6\C74C: %0')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140411684277751752)
,p_name=>'APEX.SESSION_STATE.CLOB_NOT_ALLOWED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C138\C158 \C0C1\D0DC \B370\C774\D130 \C720\D615 CLOB\B294 %0 \D56D\BAA9\C5D0 \D5C8\C6A9\B418\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140431051754751757)
,p_name=>'APEX.SESSION_STATE.CLOB_SUBSTITUTION_NOT_ALLOWED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C138\C158 \C0C1\D0DC \B370\C774\D130 \C720\D615 CLOB\C758 \D56D\BAA9 \CE58\D658\C740 \C9C0\C6D0\B418\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140499877821751778)
,p_name=>'APEX.SESSION_STATE.ITEM_VALUE_PROTECTION'
,p_message_language=>'ko'
,p_message_text=>unistr('\C138\C158 \C0C1\D0DC \BCF4\D638 \C704\BC18: \BCF4\D638\B41C \D398\C774\C9C0 \D56D\BAA9 %0\C744(\B97C) \C218\B3D9\C73C\B85C \BCC0\ACBD\D588\AE30 \B54C\BB38\C77C \C218 \C788\C2B5\B2C8\B2E4. \C774 \C624\B958\C758 \C6D0\C778\C744 \C54C \C218 \C5C6\B294 \ACBD\C6B0\C5D0\B294 \C560\D50C\B9AC\CF00\C774\C158 \AD00\B9AC\C790\C5D0\AC8C \B3C4\C6C0\C744 \C694\CCAD\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140621026658751814)
,p_name=>'APEX.SESSION_STATE.PAGE_PROTECTION'
,p_message_language=>'ko'
,p_message_text=>unistr('\D398\C774\C9C0 \BCF4\D638 \C704\BC18: \B85C\B4DC\AC00 \C644\B8CC\B418\C9C0 \C54A\C740 \D398\C774\C9C0\B97C \C81C\CD9C\D558\AC70\B098 \BCF4\D638\B41C \D398\C774\C9C0 \D56D\BAA9\C744 \C218\B3D9\C73C\B85C \BCC0\ACBD\D588\AE30 \B54C\BB38\C77C \C218 \C788\C2B5\B2C8\B2E4. \CD94\AC00 \B3C4\C6C0\C774 \D544\C694\D558\BA74 \C560\D50C\B9AC\CF00\C774\C158 \AD00\B9AC\C790\C5D0\AC8C \BB38\C758\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140620166496751813)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.NO_SPECIAL_CHAR'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C5D0 \BD80\C801\D569\D55C \BB38\C790\C778 &<>"/;,*|=% \B610\B294 -- \BB38\C790 \C911 \D558\B098\AC00 \D3EC\D568\B418\C5B4 \C788\C2B5\B2C8\B2E4.')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140620299419751813)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.NO_SPECIAL_CHAR_NL'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C5D0 \BD80\C801\D569\D55C \BB38\C790\C778 &<>"/;,*|=% or -- \B610\B294 \C0C8 \D589 \C911 \D558\B098\AC00 \D3EC\D568\B418\C5B4 \C788\C2B5\B2C8\B2E4.')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140619983186751813)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.US_ONLY'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C5D0 \D2B9\C218 \BB38\C790\AC00 \D3EC\D568\B418\C5B4 \C788\C2B5\B2C8\B2E4. \BB38\C790 a-Z, 0-9 \BC0F \ACF5\BC31\B9CC \D5C8\C6A9\B429\B2C8\B2E4.')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140620080361751813)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C5D0 \BD80\C801\D569\D55C \BB38\C790\C778 <, > \B610\B294 "\AC00 \D3EC\D568\B418\C5B4 \C788\C2B5\B2C8\B2E4.')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140457411985751765)
,p_name=>'APEX.SESSION_STATE.SSP_CHECKSUM_MISSING'
,p_message_language=>'ko'
,p_message_text=>unistr('\D558\B098 \C774\C0C1\C758 \C694\CCAD, \CE90\C2DC \BE44\C6B0\AE30 \B610\B294 \C778\C218 \AC12\C774 \B9E4\AC1C\BCC0\C218\B85C \C804\B2EC\B420 \B54C \CCB4\D06C\C12C\C774 \D544\C694\D55C \D398\C774\C9C0\C5D0 \B300\D55C \D45C\C2DC \D504\B85C\C138\C2F1\C5D0 \CCB4\D06C\C12C\C774 \C81C\ACF5\B418\C9C0 \C54A\C558\C2B5\B2C8\B2E4.')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140494771063751776)
,p_name=>'APEX.SESSION_STATE.SSP_VIOLATION'
,p_message_language=>'ko'
,p_message_text=>unistr('\C138\C158 \C0C1\D0DC \BCF4\D638 \C704\BC18: \CCB4\D06C\C12C\C774 \D3EC\D568\B41C URL\C744 \C218\B3D9\C73C\B85C \BCC0\ACBD\D558\AC70\B098, \CCB4\D06C\C12C\C774 \C798\BABB\B418\C5C8\AC70\B098 \B204\B77D\B41C \B9C1\D06C\B97C \C0AC\C6A9\D588\AE30 \B54C\BB38\C77C \C218 \C788\C2B5\B2C8\B2E4. \C774 \C624\B958\C758 \C6D0\C778\C744 \C54C \C218 \C5C6\B294 \ACBD\C6B0\C5D0\B294 \C560\D50C\B9AC\CF00\C774\C158 \AD00\B9AC\C790\C5D0\AC8C \B3C4\C6C0\C744 \C694\CCAD\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140576391847751800)
,p_name=>'APEX.SET_HIGH_CONTRAST_MODE_OFF'
,p_message_language=>'ko'
,p_message_text=>unistr('\ACE0\B300\BE44 \BAA8\B4DC \D574\C81C')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140576406599751801)
,p_name=>'APEX.SET_HIGH_CONTRAST_MODE_ON'
,p_message_language=>'ko'
,p_message_text=>unistr('\ACE0\B300\BE44 \BAA8\B4DC \C124\C815')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140440868096751760)
,p_name=>'APEX.SET_VALUE_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C560\D50C\B9AC\CF00\C774\C158 \C124\C815 %0\C740(\B294) \B2E4\B978 \C560\D50C\B9AC\CF00\C774\C158\C5D0 \AD6C\B3C5\B418\C5B4 \C788\AE30 \B54C\BB38\C5D0 \C5C5\B370\C774\D2B8\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140491100611751775)
,p_name=>'APEX.SHUTTLE.CONTROL_BOTTOM'
,p_message_language=>'ko'
,p_message_text=>unistr('\B9E8 \C544\B798\B85C')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140491357034751775)
,p_name=>'APEX.SHUTTLE.CONTROL_DOWN'
,p_message_language=>'ko'
,p_message_text=>unistr('\C544\B798\B85C')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140491499586751775)
,p_name=>'APEX.SHUTTLE.CONTROL_MOVE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\B3D9')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140491597622751775)
,p_name=>'APEX.SHUTTLE.CONTROL_MOVE_ALL'
,p_message_language=>'ko'
,p_message_text=>unistr('\BAA8\B450 \C774\B3D9')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140491631306751775)
,p_name=>'APEX.SHUTTLE.CONTROL_REMOVE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C81C\AC70')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140491772863751775)
,p_name=>'APEX.SHUTTLE.CONTROL_REMOVE_ALL'
,p_message_language=>'ko'
,p_message_text=>unistr('\BAA8\B450 \C81C\AC70')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140491886711751775)
,p_name=>'APEX.SHUTTLE.CONTROL_RESET'
,p_message_language=>'ko'
,p_message_text=>unistr('\C7AC\C124\C815')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140491037592751775)
,p_name=>'APEX.SHUTTLE.CONTROL_TOP'
,p_message_language=>'ko'
,p_message_text=>unistr('\B9E8 \C704\B85C')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140491295680751775)
,p_name=>'APEX.SHUTTLE.CONTROL_UP'
,p_message_language=>'ko'
,p_message_text=>unistr('\C704\B85C')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140602811015751808)
,p_name=>'APEX.SINCE.SHORT.DAYS_AGO'
,p_message_language=>'ko'
,p_message_text=>'%0d'
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140603546153751808)
,p_name=>'APEX.SINCE.SHORT.DAYS_FROM_NOW'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C77C \B0B4')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140602762098751808)
,p_name=>'APEX.SINCE.SHORT.HOURS_AGO'
,p_message_language=>'ko'
,p_message_text=>'%0h'
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140603657562751808)
,p_name=>'APEX.SINCE.SHORT.HOURS_FROM_NOW'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C2DC\AC04 \B0B4')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140602595958751808)
,p_name=>'APEX.SINCE.SHORT.MINUTES_AGO'
,p_message_language=>'ko'
,p_message_text=>'%0m'
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140603755581751808)
,p_name=>'APEX.SINCE.SHORT.MINUTES_FROM_NOW'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\BD84 \B0B4')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140603132097751808)
,p_name=>'APEX.SINCE.SHORT.MONTHS_AGO'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\AC1C\C6D4')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140603340901751808)
,p_name=>'APEX.SINCE.SHORT.MONTHS_FROM_NOW'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\AC1C\C6D4 \B0B4')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140602602229751808)
,p_name=>'APEX.SINCE.SHORT.SECONDS_AGO'
,p_message_language=>'ko'
,p_message_text=>'%0s'
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140603434444751808)
,p_name=>'APEX.SINCE.SHORT.SECONDS_FROM_NOW'
,p_message_language=>'ko'
,p_message_text=>unistr('%0s \B0B4')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140602952531751808)
,p_name=>'APEX.SINCE.SHORT.WEEKS_AGO'
,p_message_language=>'ko'
,p_message_text=>'%0w'
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140603822395751809)
,p_name=>'APEX.SINCE.SHORT.WEEKS_FROM_NOW'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C8FC \B0B4')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140603076277751808)
,p_name=>'APEX.SINCE.SHORT.YEARS_AGO'
,p_message_language=>'ko'
,p_message_text=>'%0y'
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140603233648751808)
,p_name=>'APEX.SINCE.SHORT.YEARS_FROM_NOW'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\B144 \B0B4')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140404186796751750)
,p_name=>'APEX.SPATIAL.GEOMETRY.LINE'
,p_message_language=>'ko'
,p_message_text=>unistr('[\C120]')
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140404726554751750)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTILINE'
,p_message_language=>'ko'
,p_message_text=>unistr('[\B2E4\C911 \C120]')
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140404446988751750)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTIPOINT'
,p_message_language=>'ko'
,p_message_text=>unistr('[\B2E4\C911 \D3EC\C778\D2B8]')
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140404924976751750)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTIPOLYGON'
,p_message_language=>'ko'
,p_message_text=>unistr('[\B2E4\C911 \B2E4\AC01\D615]')
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140405056460751750)
,p_name=>'APEX.SPATIAL.GEOMETRY.OTHER'
,p_message_language=>'ko'
,p_message_text=>unistr('[\B3C4\BA74 \AC1D\CCB4]')
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140404024255751750)
,p_name=>'APEX.SPATIAL.GEOMETRY.POINT'
,p_message_language=>'ko'
,p_message_text=>unistr('[\D3EC\C778\D2B8 (%0,%1)]')
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140404382781751750)
,p_name=>'APEX.SPATIAL.GEOMETRY.POLYGON'
,p_message_language=>'ko'
,p_message_text=>unistr('[\B2E4\AC01\D615]')
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140403511841751749)
,p_name=>'APEX.SPLITTER.COLLAPSED_REGION'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD95\C18C\B41C \C601\C5ED: %0')
,p_is_js_message=>true
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140518641487751783)
,p_name=>'APEX.SPLITTER.COLLAPSE_TEXT'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD95\C18C')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140402500300751749)
,p_name=>'APEX.SPLITTER.HORIZ_CANNOT_LEFT_RIGHT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C218\D3C9 \BC29\D5A5\C758 \BD84\D560\C120\C740 \C67C\CABD \B610\B294 \C624\B978\CABD\C73C\B85C \C774\B3D9\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140402736640751749)
,p_name=>'APEX.SPLITTER.MAX_SIZE_REACHED'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD5C\B300 \D06C\AE30\C778 %0px\C5D0 \B3C4\B2EC\D588\C2B5\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140403733584751749)
,p_name=>'APEX.SPLITTER.MIN_SIZE_REACHED'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD5C\C18C \D06C\AE30\C778 %0px\C5D0 \B3C4\B2EC\D588\C2B5\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140403663760751749)
,p_name=>'APEX.SPLITTER.REGION_IS_COLLAPSED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C601\C5ED\C774 \CD95\C18C\B418\C5C8\C2B5\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140403493024751749)
,p_name=>'APEX.SPLITTER.REGION_IS_RESTORED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C601\C5ED\C774 \BCF5\C6D0\B418\C5C8\C2B5\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140403142630751749)
,p_name=>'APEX.SPLITTER.RESIZED_TO'
,p_message_language=>'ko'
,p_message_text=>unistr('%0px\B85C \D06C\AE30 \C870\C815\B428')
,p_is_js_message=>true
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140403372245751749)
,p_name=>'APEX.SPLITTER.RESTORED_REGION'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF5\C6D0\B41C \C601\C5ED: %0')
,p_is_js_message=>true
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140518503929751783)
,p_name=>'APEX.SPLITTER.RESTORE_TEXT'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF5\C6D0')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140402667345751749)
,p_name=>'APEX.SPLITTER.VERTICAL_CANNOT_UP_DOWN'
,p_message_language=>'ko'
,p_message_text=>unistr('\C218\C9C1 \BC29\D5A5\C758 \BD84\D560\C120\C740 \C704\CABD \B610\B294 \C544\B798\CABD\C73C\B85C \C774\B3D9\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140568092078751798)
,p_name=>'APEX.STAR_RATING.CLEAR_RATING'
,p_message_language=>'ko'
,p_message_text=>unistr('\D3C9\AC00 \C9C0\C6B0\AE30')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140557950522751795)
,p_name=>'APEX.STAR_RATING.INVALID_RATING_RANGE'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C740(\B294) \C801\D569\D55C \B4F1\AE09 \BC94\C704 1 - %1\C5D0 \C18D\D558\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140558046256751795)
,p_name=>'APEX.STAR_RATING.IS_NOT_NUMERIC'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C740(\B294) \C22B\C790\AC00 \C544\B2D9\B2C8\B2E4.')
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140554130671751794)
,p_name=>'APEX.SUCCESS_MESSAGE_HEADING'
,p_message_language=>'ko'
,p_message_text=>unistr('\C131\ACF5 \BA54\C2DC\C9C0')
,p_is_js_message=>true
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140615966189751812)
,p_name=>'APEX.TABS.NEXT'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140615890887751812)
,p_name=>'APEX.TABS.PREVIOUS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\C804')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140526032484751786)
,p_name=>'APEX.TASK.ACTION.DATA_NOT_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774 \D0DC\C2A4\D06C \C778\C2A4\D134\C2A4\C640 \C5F0\AD00\B41C \B808\CF54\B4DC \C2DC\C2A4\D15C\C744 \CC3E\C744 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140534327563751788)
,p_name=>'APEX.TASK.ACTION.ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\D0DC\C2A4\D06C \C791\C5C5 %0 \C2E4\D589 \C2E4\D328 - \D0DC\C2A4\D06C\AC00 \C624\B958 \BC1C\C0DD \C0C1\D0DC\B85C \C124\C815\B418\C5C8\C2B5\B2C8\B2E4. \D0DC\C2A4\D06C \C791\C5C5 \CF54\B4DC\B97C \D655\C778\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140414529523751753)
,p_name=>'APEX.TASK.ADD_COMMENT_NOT_AUTHORIZED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C124\BA85 \CD94\AC00: \AD8C\D55C\C774 \BD80\C5EC\B418\C9C0 \C54A\C74C')
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140413867498751752)
,p_name=>'APEX.TASK.ALREADY_ASSIGNED'
,p_message_language=>'ko'
,p_message_text=>unistr('\D0DC\C2A4\D06C\AC00 \C774\BBF8 \C9C0\C815\B428')
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140407269459751750)
,p_name=>'APEX.TASK.ASSIGNED_TO_USER'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C5D0 \C9C0\C815\B428')
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140413510274751752)
,p_name=>'APEX.TASK.CANCEL_TASK_NOT_AUTHORIZED'
,p_message_language=>'ko'
,p_message_text=>unistr('\D0DC\C2A4\D06C \CDE8\C18C: \AD8C\D55C\C774 \BD80\C5EC\B418\C9C0 \C54A\C74C')
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140429156731751757)
,p_name=>'APEX.TASK.CANNOT_REMOVE_OWNER'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774 \D0DC\C2A4\D06C\C758 \C2E4\C81C \C18C\C720\C790\B97C \C81C\AC70\D560 \C218 \C5C6\C2B5\B2C8\B2E4. \C774 \C791\C5C5\C744 \C7AC\C2DC\B3C4\D558\AE30 \C804\C5D0 \B2E4\B978 \CC38\AC00\C790\C5D0\AC8C \D0DC\C2A4\D06C\B97C \C704\C784\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140413142133751752)
,p_name=>'APEX.TASK.CLAIM_TASK_NOT_AUTHORIZED'
,p_message_language=>'ko'
,p_message_text=>unistr('\D0DC\C2A4\D06C \C694\AD6C: \AD8C\D55C\C774 \BD80\C5EC\B418\C9C0 \C54A\C74C')
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140413214945751752)
,p_name=>'APEX.TASK.COMPLETE_TASK_NOT_AUTHORIZED'
,p_message_language=>'ko'
,p_message_text=>unistr('\D0DC\C2A4\D06C \C644\B8CC: \AD8C\D55C\C774 \BD80\C5EC\B418\C9C0 \C54A\C74C')
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140413352187751752)
,p_name=>'APEX.TASK.DELEGATE_TASK_NOT_AUTHORIZED'
,p_message_language=>'ko'
,p_message_text=>unistr('\D0DC\C2A4\D06C \C704\C784: \AD8C\D55C\C774 \BD80\C5EC\B418\C9C0 \C54A\C74C')
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140411783826751752)
,p_name=>'APEX.TASK.DUE_DATE_IN_PAST'
,p_message_language=>'ko'
,p_message_text=>unistr('\D0DC\C2A4\D06C\C758 \B9CC\AE30 \B0A0\C9DC\B294 \ACFC\AC70\C77C \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140407090220751750)
,p_name=>'APEX.TASK.DUE_SINCE'
,p_message_language=>'ko'
,p_message_text=>unistr('\AE30\D55C %0')
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140407477624751751)
,p_name=>'APEX.TASK.EVENT.ACTION.ERROR_MESSAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D0DC\C2A4\D06C \C791\C5C5 %1 \C2E4\D328. \C624\B958 \BA54\C2DC\C9C0 - %0')
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140407174385751750)
,p_name=>'APEX.TASK.EVENT.ACTION.FAILURE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2E4\D328')
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140406794511751750)
,p_name=>'APEX.TASK.EVENT.ACTION.SUCCESS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C131\ACF5')
,p_is_js_message=>true
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140406993113751750)
,p_name=>'APEX.TASK.EVENT.ACTION.SUCCESS_MESSAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('%1 \C791\C5C5\C774 %0 \BA54\C2DC\C9C0\C640 \D568\AED8 \C131\ACF5')
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140410283896751751)
,p_name=>'APEX.TASK.EVENT.BEFORE_EXPIRE'
,p_message_language=>'ko'
,p_message_text=>unistr('\B9CC\B8CC \C804')
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140435804547751759)
,p_name=>'APEX.TASK.EVENT.CANCEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\CDE8\C18C')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140435353788751759)
,p_name=>'APEX.TASK.EVENT.CANCEL_MESSAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C791\C5C5\C774 \CDE8\C18C\B418\C5C8\C2B5\B2C8\B2E4')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140435995159751759)
,p_name=>'APEX.TASK.EVENT.CANCEL_NOT_ALLOWED'
,p_message_language=>'ko'
,p_message_text=>unistr('\CC38\AC00\C790\AC00 \D0DC\C2A4\D06C\B97C \CDE8\C18C\D560 \AD8C\D55C\C774 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140435234144751759)
,p_name=>'APEX.TASK.EVENT.CLAIM'
,p_message_language=>'ko'
,p_message_text=>unistr('\C694\AD6C')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140435675157751759)
,p_name=>'APEX.TASK.EVENT.CLAIM_ALREADY_CLAIMED'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\B978 \C0AC\C6A9\C790\AC00 \C774\BBF8 \D0DC\C2A4\D06C\B97C \C694\AD6C\D588\AC70\B098 \CC38\AC00\C790\AC00 \C774 \D0DC\C2A4\D06C\B97C \C694\AD6C\D560 \C790\ACA9\C774 \C5C6\C2B5\B2C8\B2E4')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140435465575751759)
,p_name=>'APEX.TASK.EVENT.CLAIM_MESSAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \D0DC\C2A4\D06C\B97C \C694\AD6C\D568')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140536574674751789)
,p_name=>'APEX.TASK.EVENT.COMPLETE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C644\B8CC')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140435001999751759)
,p_name=>'APEX.TASK.EVENT.COMPLETE_MESSAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \ACB0\ACFC\B85C \D0DC\C2A4\D06C\AC00 \C644\B8CC\B428')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140436310843751759)
,p_name=>'APEX.TASK.EVENT.COMPLETE_NOT_ALLOWED'
,p_message_language=>'ko'
,p_message_text=>unistr('\D0DC\C2A4\D06C\AC00 \C9C0\C815\B418\C9C0 \C54A\C558\AC70\B098 \CC38\AC00\C790\AC00 \D0DC\C2A4\D06C\B97C \C644\B8CC\D560 \AD8C\D55C\C774 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140396773927751747)
,p_name=>'APEX.TASK.EVENT.COMPLETE_NO_OUTCOME'
,p_message_language=>'ko'
,p_message_text=>unistr('\D0DC\C2A4\D06C\AC00 \ACB0\ACFC \C5C6\C774 \C644\B8CC\B428')
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140536649257751789)
,p_name=>'APEX.TASK.EVENT.CREATE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0DD\C131')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140429526700751757)
,p_name=>'APEX.TASK.EVENT.CREATE_MESSAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('ID %0(\C73C)\B85C \D0DC\C2A4\D06C\AC00 \C0DD\C131\B428')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140536767859751789)
,p_name=>'APEX.TASK.EVENT.DELEGATE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C704\C784')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140435153311751759)
,p_name=>'APEX.TASK.EVENT.DELEGATE_MESSAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C7A0\C7AC\C801 \C18C\C720\C790 %0\C5D0\AC8C \D0DC\C2A4\D06C\AC00 \C704\C784\B428')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140435791655751759)
,p_name=>'APEX.TASK.EVENT.DELEGATE_NOT_ALLOWED'
,p_message_language=>'ko'
,p_message_text=>unistr('\CC38\AC00\C790\C5D0\AC8C \C790\ACA9\C774 \C5C6\AC70\B098 \C0C8 \CC38\AC00\C790\B294 \C774 \D0DC\C2A4\D06C\C758 \C7A0\C7AC\C801 \C18C\C720\C790\AC00 \C544\B2D9\B2C8\B2E4.')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140408888890751751)
,p_name=>'APEX.TASK.EVENT.EXPIRE'
,p_message_language=>'ko'
,p_message_text=>unistr('\B9CC\B8CC')
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140409965403751751)
,p_name=>'APEX.TASK.EVENT.EXPIRED_MESSAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D0DC\C2A4\D06C \B9CC\B8CC\B428.')
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140536842334751789)
,p_name=>'APEX.TASK.EVENT.FAIL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2E4\D328')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140405565416751750)
,p_name=>'APEX.TASK.EVENT.INFO_REQUEST.NOT_ALLOWED'
,p_message_language=>'ko'
,p_message_text=>unistr('\D0DC\C2A4\D06C\AC00 \C9C0\C815\B418\C9C0 \C54A\C558\AC70\B098 \CC38\AC00\C790\AC00 \D0DC\C2A4\D06C\C5D0 \B300\D55C \C815\BCF4\B97C \C694\CCAD\D560 \AD8C\D55C\C774 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140405770712751750)
,p_name=>'APEX.TASK.EVENT.INFO_SUBMIT.NOT_ALLOWED'
,p_message_language=>'ko'
,p_message_text=>unistr('\D0DC\C2A4\D06C\C5D0 \B300\D55C \C815\BCF4\AC00 \C694\CCAD\B418\C9C0 \C54A\C558\AC70\B098 \CC38\AC00\C790\AC00 \D0DC\C2A4\D06C\C5D0 \B300\D55C \C815\BCF4\B97C \C81C\CD9C\D560 \AD8C\D55C\C774 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140409390929751751)
,p_name=>'APEX.TASK.EVENT.MAXRENEW_EXPIRED_MESSAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD5C\B300 \AC31\C2E0 \D69F\C218 %0\C5D0 \B3C4\B2EC\D574\C11C \D0DC\C2A4\D06C\B97C \B9CC\B8CC\D569\B2C8\B2E4.')
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140436615257751759)
,p_name=>'APEX.TASK.EVENT.NOT_ALLOWED_BUSINESS_ADMIN'
,p_message_language=>'ko'
,p_message_text=>unistr('\D0DC\C2A4\D06C\AC00 \C62C\BC14\B978 \C0C1\D0DC\AC00 \C544\B2C8\AC70\B098 \CC38\AC00\C790\AC00 \C774 \D0DC\C2A4\D06C\C758 \BE44\C988\B2C8\C2A4 \AD00\B9AC\C790\AC00 \C544\B2D9\B2C8\B2E4.')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140436758969751759)
,p_name=>'APEX.TASK.EVENT.NOT_APPLICABLE'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C791\C5C5\C740 \C54C \C218 \C5C6\AC70\B098 \C774 \D0DC\C2A4\D06C\C5D0 \C801\C6A9\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140536951581751789)
,p_name=>'APEX.TASK.EVENT.RELEASE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D574\C81C')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140522623637751785)
,p_name=>'APEX.TASK.EVENT.RELEASE_MESSAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D0DC\C2A4\D06C\AC00 \D574\C81C\B418\C5B4 \C774\C81C \B2E4\B978 \C18C\C720\C790\AC00 \C694\AD6C\D560 \C218 \C788\C2B5\B2C8\B2E4.')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140415507963751753)
,p_name=>'APEX.TASK.EVENT.RELEASE_NOT_ALLOWED'
,p_message_language=>'ko'
,p_message_text=>unistr('\D0DC\C2A4\D06C \D574\C81C\AC00 \D5C8\C6A9\B418\C9C0 \C54A\C74C - \C0AC\C6A9\C790\AC00 \D0DC\C2A4\D06C \C18C\C720\C790\AC00 \C544\B2D9\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140432575346751758)
,p_name=>'APEX.TASK.EVENT.REMOVE_OWNER'
,p_message_language=>'ko'
,p_message_text=>unistr('\C18C\C720\C790 \C81C\AC70')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140432700310751758)
,p_name=>'APEX.TASK.EVENT.REMOVE_OWNER_MESSAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \CC38\AC00\C790\AC00 \D0DC\C2A4\D06C\C5D0\C11C \C81C\AC70\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140410121194751751)
,p_name=>'APEX.TASK.EVENT.RENEW'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC31\C2E0')
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140409095860751751)
,p_name=>'APEX.TASK.EVENT.RENEW_EXPIRED_MESSAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D0DC\C2A4\D06C\AC00 ID %0(\C73C)\B85C \AC31\C2E0\B428, \B9CC\B8CC \C804\C5D0 \B0A8\C740 \CD5C\B300 \AC31\C2E0 \D69F\C218\B294 %1\C785\B2C8\B2E4.')
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140410069061751751)
,p_name=>'APEX.TASK.EVENT.RENEW_MESSAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D0DC\C2A4\D06C ID %0\C774(\AC00) \D0DC\C2A4\D06C ID %1(\C73C)\B85C \AC31\C2E0\B428')
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140406036489751750)
,p_name=>'APEX.TASK.EVENT.REQUEST_INFO'
,p_message_language=>'ko'
,p_message_text=>unistr('\C815\BCF4 \C694\CCAD')
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140405975819751750)
,p_name=>'APEX.TASK.EVENT.REQUEST_INFO_MESSAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C790\C138\D55C \C815\BCF4\B97C \C704\D574 %0 \C694\CCAD\D568: %1')
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140403885707751749)
,p_name=>'APEX.TASK.EVENT.SET_INITIATOR_CAN_COMPLETE_MESSAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC1C\C2DC\C790\AC00 \C644\B8CC\D560 \C218 \C788\C74C\C744 %0(\C73C)\B85C \C124\C815')
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140406146756751750)
,p_name=>'APEX.TASK.EVENT.SUBMIT_INFO'
,p_message_language=>'ko'
,p_message_text=>unistr('\C815\BCF4 \C81C\CD9C')
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140405838573751750)
,p_name=>'APEX.TASK.EVENT.SUBMIT_INFO_MESSAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C694\CCAD\B41C \C815\BCF4\AC00 %0\C5D0 \C81C\CD9C\B428: %1')
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140537056163751789)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C124\BA85 \C5C5\B370\C774\D2B8')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140433550344751758)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT_MESSAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C124\BA85 \CD94\AC00: %0')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140436479280751759)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT_NOT_ALLOWED'
,p_message_language=>'ko'
,p_message_text=>unistr('\D0DC\C2A4\D06C \C0C1\D0DC\B85C \C778\D574 \C124\BA85\C774 \D5C8\C6A9\B418\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140443769720751761)
,p_name=>'APEX.TASK.EVENT.UPDATE_DUE_DATE_MESSAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D0DC\C2A4\D06C \AE30\D55C\C744 %0(\C73C)\B85C \C124\C815')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140401825113751749)
,p_name=>'APEX.TASK.EVENT.UPDATE_DUE_ON'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5C5\B370\C774\D2B8 \AE30\D55C\C77C')
,p_version_scn=>2705114
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140537157294751789)
,p_name=>'APEX.TASK.EVENT.UPDATE_OWNER'
,p_message_language=>'ko'
,p_message_text=>unistr('\C18C\C720\C790 \C5C5\B370\C774\D2B8')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140434841238751759)
,p_name=>'APEX.TASK.EVENT.UPDATE_OWNER_MESSAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D0DC\C2A4\D06C \CC38\AC00\C790\C5D0 \C7A0\C7AC\C801 \C18C\C720\C790 %0 \CD94\AC00')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140433987502751758)
,p_name=>'APEX.TASK.EVENT.UPDATE_PARAM'
,p_message_language=>'ko'
,p_message_text=>unistr('\B9E4\AC1C\BCC0\C218 \C5C5\B370\C774\D2B8')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140537276927751789)
,p_name=>'APEX.TASK.EVENT.UPDATE_PRIORITY'
,p_message_language=>'ko'
,p_message_text=>unistr('\C6B0\C120\C21C\C704 \C5C5\B370\C774\D2B8')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140435556939751759)
,p_name=>'APEX.TASK.EVENT.UPDATE_PRIORITY_MESSAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('%0(\C73C)\B85C \D0DC\C2A4\D06C \C6B0\C120\C21C\C704 \C124\C815')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140432810599751758)
,p_name=>'APEX.TASK.EVENT.UPD_PARAMETER_MESSAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('"%1"\C5D0\C11C "%2"(\C73C)\B85C "%0" \B9E4\AC1C\BCC0\C218\B97C \C5C5\B370\C774\D2B8\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140416302293751753)
,p_name=>'APEX.TASK.EVENT.WF_CANCEL_MESSAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D574\B2F9 \C6CC\D06C\D50C\B85C\C6B0 \C778\C2A4\D134\C2A4\AC00 \C885\B8CC\B418\C5B4\C11C \D0DC\C2A4\D06C\AC00 \CDE8\C18C\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140413477941751752)
,p_name=>'APEX.TASK.FORWARD_TASK_NOT_AUTHORIZED'
,p_message_language=>'ko'
,p_message_text=>unistr('\D0DC\C2A4\D06C \C804\B2EC: \AD8C\D55C\C774 \BD80\C5EC\B418\C9C0 \C54A\C74C')
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140406892876751750)
,p_name=>'APEX.TASK.INITIATED_BY_USER_SINCE'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 %1\C774(\AC00) \AC1C\C2DC\D568')
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140415719163751753)
,p_name=>'APEX.TASK.INTERNAL_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C608\C0C1\CE58 \C54A\C740 \B0B4\BD80 \C624\B958\AC00 \BC1C\C0DD\D588\C2B5\B2C8\B2E4')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140414009182751752)
,p_name=>'APEX.TASK.NOT_APPLICABLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D0DC\C2A4\D06C \C791\C5C5\C744 \C801\C6A9\D560 \C218 \C5C6\C74C')
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140439624676751760)
,p_name=>'APEX.TASK.NO_POTENTIAL_OWNER'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774 \C7A0\C7AC\C801 \C18C\C720\C790\AC00 \C874\C7AC\D558\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140415302078751753)
,p_name=>'APEX.TASK.OUTCOME.APPROVED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2B9\C778\B428')
,p_version_scn=>2705119
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140415408765751753)
,p_name=>'APEX.TASK.OUTCOME.REJECTED'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC70\BD80\B428')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140396856155751747)
,p_name=>'APEX.TASK.OUTCOME_MISSING'
,p_message_language=>'ko'
,p_message_text=>unistr('\D0DC\C2A4\D06C\B97C \C644\B8CC\D558\B824\BA74 \ACB0\ACFC\AC00 \D544\C694\D569\B2C8\B2E4.')
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140397084958751747)
,p_name=>'APEX.TASK.OUTCOME_NOT_ALLOWED'
,p_message_language=>'ko'
,p_message_text=>unistr('\D0DC\C2A4\D06C\AC00 \ACB0\ACFC\B97C \D3EC\D568\D558\B3C4\B85D \D5C8\C6A9\B418\C9C0 \C54A\C74C')
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140432693620751758)
,p_name=>'APEX.TASK.PARAM_NOT_UPDATABLE'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \B9E4\AC1C\BCC0\C218\B97C \C5C5\B370\C774\D2B8\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140428908546751757)
,p_name=>'APEX.TASK.PARTICIPANT_EXISTS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774 \D0DC\C2A4\D06C \C778\C2A4\D134\C2A4\C5D0 \B300\D55C \CC38\AC00\C790\AC00 \C874\C7AC\D569\B2C8\B2E4.')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140530418337751787)
,p_name=>'APEX.TASK.PRIORITY.1'
,p_message_language=>'ko'
,p_message_text=>unistr('\AE34\AE09')
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140407587733751751)
,p_name=>'APEX.TASK.PRIORITY.1.DESCRIPTION'
,p_message_language=>'ko'
,p_message_text=>unistr('\AE34\AE09')
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140530351214751787)
,p_name=>'APEX.TASK.PRIORITY.2'
,p_message_language=>'ko'
,p_message_text=>unistr('\ACE0\AC00')
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140407629539751751)
,p_name=>'APEX.TASK.PRIORITY.2.DESCRIPTION'
,p_message_language=>'ko'
,p_message_text=>unistr('\B192\C740 \C6B0\C120\C21C\C704')
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140530292727751787)
,p_name=>'APEX.TASK.PRIORITY.3'
,p_message_language=>'ko'
,p_message_text=>unistr('\C911\AC04')
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140407742836751751)
,p_name=>'APEX.TASK.PRIORITY.3.DESCRIPTION'
,p_message_language=>'ko'
,p_message_text=>unistr('\C911\AC04 \C6B0\C120\C21C\C704')
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140530127089751787)
,p_name=>'APEX.TASK.PRIORITY.4'
,p_message_language=>'ko'
,p_message_text=>unistr('\C800\AC00')
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140407838693751751)
,p_name=>'APEX.TASK.PRIORITY.4.DESCRIPTION'
,p_message_language=>'ko'
,p_message_text=>unistr('\B0AE\C740 \C6B0\C120\C21C\C704')
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140530041219751787)
,p_name=>'APEX.TASK.PRIORITY.5'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD5C\C800')
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140407935069751751)
,p_name=>'APEX.TASK.PRIORITY.5.DESCRIPTION'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC00\C7A5 \B0AE\C740 \C6B0\C120\C21C\C704')
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140413655818751752)
,p_name=>'APEX.TASK.SET_PRIORITY_NOT_AUTHORIZED'
,p_message_language=>'ko'
,p_message_text=>unistr('\D0DC\C2A4\D06C \C6B0\C120\C21C\C704 \C124\C815: \AD8C\D55C\C774 \BD80\C5EC\B418\C9C0 \C54A\C74C')
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140414853946751753)
,p_name=>'APEX.TASK.STATE.ASSIGNED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\C815\B428')
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140415270182751753)
,p_name=>'APEX.TASK.STATE.CANCELLED'
,p_message_language=>'ko'
,p_message_text=>unistr('\CDE8\C18C\B428')
,p_version_scn=>2705119
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140414921251751753)
,p_name=>'APEX.TASK.STATE.COMPLETED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C644\B8CC\B428')
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140415189718751753)
,p_name=>'APEX.TASK.STATE.ERRORED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C624\B958 \BC1C\C0DD')
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140408607724751751)
,p_name=>'APEX.TASK.STATE.EXPIRED'
,p_message_language=>'ko'
,p_message_text=>unistr('\B9CC\B8CC\B428')
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140415050163751753)
,p_name=>'APEX.TASK.STATE.FAILED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2E4\D328')
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140405376262751750)
,p_name=>'APEX.TASK.STATE.INFO_REQUESTED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C815\BCF4\AC00 \C694\CCAD\B428')
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140414731281751753)
,p_name=>'APEX.TASK.STATE.UNASSIGNED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\C815\B418\C9C0 \C54A\C74C')
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140437154562751759)
,p_name=>'APEX.TASK.TASK_CREATE_ERROR'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('%1 \C560\D50C\B9AC\CF00\C774\C158\C5D0\C11C \D0DC\C2A4\D06C \C815\C758 %0\C758 \C0C8 \D0DC\C2A4\D06C \C0DD\C131\C744 \C2E4\D328\D588\C2B5\B2C8\B2E4.'),
'SQLCODE: %2'))
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140437030338751759)
,p_name=>'APEX.TASK.TASK_CREATE_NO_POTENTIAL_OWNER'
,p_message_language=>'ko'
,p_message_text=>unistr('%1 \C560\D50C\B9AC\CF00\C774\C158\C5D0\C11C \D0DC\C2A4\D06C \C815\C758 %0\C758 \D0DC\C2A4\D06C\B97C \C0DD\C131\D558\B824\B294 \C2DC\B3C4\B97C \C2E4\D328\D588\C2B5\B2C8\B2E4. \D0DC\C2A4\D06C \C815\C758\C5D0 \C7A0\C7AC\C801 \C18C\C720\C790\AC00 \C5C6\C2B5\B2C8\B2E4. \D0DC\C2A4\D06C \C815\C758\B97C \D3B8\C9D1\D558\ACE0 \C7A0\C7AC\C801 \C18C\C720\C790 \C720\D615\C758 \CC38\AC00\C790\B97C \D558\B098 \C774\C0C1 \CD94\AC00\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140414334010751753)
,p_name=>'APEX.TASK.TASK_DEFINITION_NOT_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('\D0DC\C2A4\D06C \C815\C758\B97C \CC3E\C744 \C218 \C5C6\C74C')
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140414237842751753)
,p_name=>'APEX.TASK.TASK_DEF_PARTICIPANTS_NOT_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('\D0DC\C2A4\D06C\C758 \CC38\AC00\C790\B97C \CC3E\C744 \C218 \C5C6\C2B5\B2C8\B2E4')
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140415671835751753)
,p_name=>'APEX.TASK.TASK_ID_PK_VIOLATION'
,p_message_language=>'ko'
,p_message_text=>unistr('\C8FC\C5B4\C9C4 \D0DC\C2A4\D06C ID\C5D0 \B300\D574 \B458 \C774\C0C1\C758 \D0DC\C2A4\D06C\AC00 \C788\C74C - \B370\C774\D130\BCA0\C774\C2A4 \AD00\B9AC\C790\C5D0\AC8C \BB38\C758\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140414499106751753)
,p_name=>'APEX.TASK.TASK_NOT_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('\D0DC\C2A4\D06C\B97C \CC3E\C744 \C218 \C5C6\C74C')
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140414115603751753)
,p_name=>'APEX.TASK.TASK_PARAMETER_NOT_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('\D0DC\C2A4\D06C \B9E4\AC1C\BCC0\C218\B97C \CC3E\C744 \C218 \C5C6\C74C')
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140450472076751763)
,p_name=>'APEX.TASK.TYPE.ACTION'
,p_message_language=>'ko'
,p_message_text=>unistr('\C791\C5C5')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140450398073751763)
,p_name=>'APEX.TASK.TYPE.APPROVAL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2B9\C778')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140397729226751748)
,p_name=>'APEX.TASK.VACATION_RULE_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('%1 \C560\D50C\B9AC\CF00\C774\C158\C758 \D0DC\C2A4\D06C \C815\C758 %0\C5D0 \B300\D574 \D734\AC00 \ADDC\CE59 \D504\B85C\C2DC\C800 %2 \C2E4\D589\C744 \C2E4\D328\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140397942128751748)
,p_name=>'APEX.TASK.VACATION_RULE_MESSAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\CC38\AC00\C790 %1\C774(\AC00) \CC38\AC00\C790 %0\C758 \B300\CCB4\C790\B85C \CD94\AC00\B418\C5C8\C2B5\B2C8\B2E4. \C774\C720 - %2.')
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140601600570751808)
,p_name=>'APEX.TB.TOOLBAR'
,p_message_language=>'ko'
,p_message_text=>unistr('\B3C4\AD6C \BAA8\C74C')
,p_is_js_message=>true
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140455178226751765)
,p_name=>'APEX.TEMPLATE.APPLICATION'
,p_message_language=>'ko'
,p_message_text=>unistr('\C560\D50C\B9AC\CF00\C774\C158')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140616340623751812)
,p_name=>'APEX.TEMPLATE.EXPAND_COLLAPSE_NAV_LABEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\D0D0\C0C9 \D655\C7A5/\CD95\C18C')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140616434543751812)
,p_name=>'APEX.TEMPLATE.EXPAND_COLLAPSE_SIDE_COL_LABEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\CE21\BA74 \C5F4 \D655\C7A5/\CD95\C18C')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140524866797751785)
,p_name=>'APEX.TEMPLATE.MAIN_NAV_LABEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\AE30\BCF8 \D0D0\C0C9')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140425691500751756)
,p_name=>'APEX.TEMPLATE_DIRECTIVE.INVALID_PLACEHOLDER_NAME'
,p_message_language=>'ko'
,p_message_text=>unistr('"%0"\C740(\B294) \BD80\C801\D569\D55C \C704\CE58 \D45C\C2DC\C790 \C774\B984\C785\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140532516089751788)
,p_name=>'APEX.TIME.DAY'
,p_message_language=>'ko'
,p_message_text=>unistr('1\C77C')
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140532334758751788)
,p_name=>'APEX.TIME.HOUR'
,p_message_language=>'ko'
,p_message_text=>unistr('1\C2DC\AC04')
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140532655468751788)
,p_name=>'APEX.TIME.N_DAYS'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C77C')
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140532493828751788)
,p_name=>'APEX.TIME.N_HOURS'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C2DC\AC04')
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140532202732751787)
,p_name=>'APEX.TIME.N_MINUTES'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\BD84')
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140532834473751788)
,p_name=>'APEX.TIME.N_WEEKS'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C8FC')
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140532737910751788)
,p_name=>'APEX.TIME.WEEK'
,p_message_language=>'ko'
,p_message_text=>unistr('1\C8FC')
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140430519401751757)
,p_name=>'APEX.TMV.SELECTION_COUNT'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\AC1C \D56D\BAA9\C774 \C120\D0DD\B428')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140430707072751757)
,p_name=>'APEX.TMV.SELECTOR_LABEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\D56D\BAA9 \C120\D0DD')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140430674990751757)
,p_name=>'APEX.TMV.SELECTOR_LABEL_1'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C120\D0DD')
,p_is_js_message=>true
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140619463329751813)
,p_name=>'APEX.UI.BACK_TO_TOP'
,p_message_language=>'ko'
,p_message_text=>unistr('\D398\C774\C9C0 \C2DC\C791')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140477014950751771)
,p_name=>'APEX.UI.ENABLED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AC\C6A9')
,p_is_js_message=>true
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140445572352751762)
,p_name=>'APEX.UNHANDLED_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C694\CCAD\C744 \CC98\B9AC\D558\B294 \C911 \C624\B958\AC00 \BC1C\C0DD\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140431159603751758)
,p_name=>'APEX.UPDATE_MESSAGE_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\D14D\C2A4\D2B8 \BA54\C2DC\C9C0 %0\C740(\B294) \B2E4\B978 \C560\D50C\B9AC\CF00\C774\C158\C5D0\C11C \C801\C6A9\B418\C5B4 \C5C5\B370\C774\D2B8\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140534274889751788)
,p_name=>'APEX.VALUE_REQUIRED'
,p_message_language=>'ko'
,p_message_text=>unistr('\D544\C218 \AC12')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140450673709751763)
,p_name=>'APEX.VISUALLY_HIDDEN_HEADING'
,p_message_language=>'ko'
,p_message_text=>unistr('\BA38\B9AC\AE00 \B808\BCA8 %0, \C228\AE40')
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140579045063751801)
,p_name=>'APEX.WARN_ON_UNSAVED_CHANGES'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774 \D398\C774\C9C0\C5D0 \C800\C7A5\B418\C9C0 \C54A\C740 \BCC0\ACBD\C0AC\D56D\C774 \C788\C2B5\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140440642736751760)
,p_name=>'APEX.WF.NAVIGATOR'
,p_message_language=>'ko'
,p_message_text=>unistr('\B124\BE44\AC8C\C774\D130')
,p_is_js_message=>true
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140440355718751760)
,p_name=>'APEX.WF.ZOOM_IN'
,p_message_language=>'ko'
,p_message_text=>unistr('\D655\B300')
,p_is_js_message=>true
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140441307831751761)
,p_name=>'APEX.WF.ZOOM_LEVEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\D655\B300/\CD95\C18C \B808\BCA8 {0}%')
,p_is_js_message=>true
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140440475350751760)
,p_name=>'APEX.WF.ZOOM_OUT'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD95\C18C')
,p_is_js_message=>true
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140440508449751760)
,p_name=>'APEX.WF.ZOOM_RESET'
,p_message_language=>'ko'
,p_message_text=>unistr('\D655\B300/\CD95\C18C \C7AC\C124\C815')
,p_is_js_message=>true
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140416010376751753)
,p_name=>'APEX.WF_DIAGRAM.ARIA_DESC'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\AE08\C740 \C6CC\D06C\D50C\B85C\C6B0 \B2E4\C774\C5B4\ADF8\B7A8\C5D0 \C561\C138\C2A4\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140415903592751753)
,p_name=>'APEX.WF_DIAGRAM.ARIA_LABEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C6CC\D06C\D50C\B85C\C6B0 \B2E4\C774\C5B4\ADF8\B7A8')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140417827208751754)
,p_name=>'APEX.WORKFLOW.ACTION_NOT_ALLOWED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C6CC\D06C\D50C\B85C\C6B0 \C778\C2A4\D134\C2A4 %0\C740(\B294) \D604\C7AC \C0C1\D0DC\AC00 %1\C785\B2C8\B2E4. \B530\B77C\C11C \C791\C5C5\C774 \D5C8\C6A9\B418\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140420417042751754)
,p_name=>'APEX.WORKFLOW.ACTIVITY.COMPLETED'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C6CC\D06C\D50C\B85C\C6B0\C5D0\C11C %2 \C791\C5C5\C758 %1 \C778\C2A4\D134\C2A4\AC00 \C644\B8CC\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140420212271751754)
,p_name=>'APEX.WORKFLOW.ACTIVITY.CREATED'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C6CC\D06C\D50C\B85C\C6B0\C5D0 %2 \C791\C5C5\C758 %1 \C778\C2A4\D134\C2A4\B97C \C0C8\B85C \B9CC\B4E4\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140412003265751752)
,p_name=>'APEX.WORKFLOW.ACTIVITY.DATA_NOT_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774 \C6CC\D06C\D50C\B85C\C6B0 \C791\C5C5 \C778\C2A4\D134\C2A4\C640 \C5F0\AD00\B41C \CD94\AC00 \B370\C774\D130 \D589\C744 \CC3E\C744 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140420372857751754)
,p_name=>'APEX.WORKFLOW.ACTIVITY.RETRIED'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C6CC\D06C\D50C\B85C\C6B0\C5D0\C11C %2 \C791\C5C5\C758 \ACB0\D568 \BC1C\C0DD \C778\C2A4\D134\C2A4 %1\C774(\AC00) \C7AC\C2DC\B3C4\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140402364395751749)
,p_name=>'APEX.WORKFLOW.ACTIVITY.TERMINATED'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C6CC\D06C\D50C\B85C\C6B0\C758 \C791\C5C5 \C778\C2A4\D134\C2A4 %1\C774(\AC00) \C885\B8CC\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140436109900751759)
,p_name=>'APEX.WORKFLOW.ACTIVITY.TIMEOUT'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C6CC\D06C\D50C\B85C\C6B0\C758 \C791\C5C5 \C778\C2A4\D134\C2A4 %1\C774(\AC00) \C2DC\AC04 \CD08\ACFC\B418\C5B4 \C885\B8CC\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140420581116751754)
,p_name=>'APEX.WORKFLOW.ACTIVITY.WAITING'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C6CC\D06C\D50C\B85C\C6B0\C5D0\C11C %2 \C791\C5C5\C758 %1 \C778\C2A4\D134\C2A4\AC00 \B300\AE30 \C911 \C0C1\D0DC\C785\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140402189300751749)
,p_name=>'APEX.WORKFLOW.ALTERED_AND_RESUMED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C6CC\D06C\D50C\B85C\C6B0 \C778\C2A4\D134\C2A4 %0\C774(\AC00) \BCC0\ACBD\B418\ACE0 %1 \C791\C5C5\C5D0\C11C \C7AC\AC1C\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140419535173751754)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.COMPLETED'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C6CC\D06C\D50C\B85C\C6B0\C5D0 \C788\B294 %2 \C791\C5C5\C758 \B300\AE30 \C911\C778 \C778\C2A4\D134\C2A4 %1\C774(\AC00) \C131\ACF5\C801\C73C\B85C \C644\B8CC\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140419320220751754)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.FAULTED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C791\C5C5\C774 \C644\B8CC\B418\AE30 \C804 %0 \C6CC\D06C\D50C\B85C\C6B0\AC00 \C774\BBF8 \ACB0\D568 \BC1C\C0DD \C0C1\D0DC\C600\C73C\BBC0\B85C \B300\AE30 \C911\C778 \C791\C5C5 %1\C5D0 \ACB0\D568\C774 \BC1C\C0DD\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140419401346751754)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.TERMINATED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C791\C5C5\C774 \C644\B8CC\B418\AE30 \C804 %0 \C6CC\D06C\D50C\B85C\C6B0\AC00 \C774\BBF8 \C885\B8CC\B428 \C0C1\D0DC\C600\C73C\BBC0\B85C \B300\AE30 \C911\C778 \C791\C5C5 %1\C774(\AC00) \C885\B8CC\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140402476586751749)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.TERMINATE_FAILED'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C6CC\D06C\D50C\B85C\C6B0\C758 %1 \C791\C5C5 \C885\B8CC\AC00 \C608\C678\C0AC\D56D\C73C\B85C \C778\D574 \C2E4\D328\D568 - %2')
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140418042242751754)
,p_name=>'APEX.WORKFLOW.BUSY'
,p_message_language=>'ko'
,p_message_text=>unistr('\C6CC\D06C\D50C\B85C\C6B0\AC00 \D604\C7AC \C774\C804 \C791\C5C5 \C644\B8CC\B97C \CC98\B9AC\D558\B294 \C911\C785\B2C8\B2E4. \B098\C911\C5D0 \B2E4\C2DC \C2DC\B3C4\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140434106188751758)
,p_name=>'APEX.WORKFLOW.COMPLETED_SINCE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C644\B8CC\B428 %0')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140417117270751753)
,p_name=>'APEX.WORKFLOW.CONTINUE.NOT_ALLOWED'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C6CC\D06C\D50C\B85C\C6B0\B294 \D604\C7AC \B300\AE30 \C911 \C0C1\D0DC\AC00 \C544\B2CC %1 \C791\C5C5\C5D0 \C788\C73C\BBC0\B85C \ACC4\C18D\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140429016176751757)
,p_name=>'APEX.WORKFLOW.CORRELATION_CONTEXT_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C740(\B294) \C774 \C6CC\D06C\D50C\B85C\C6B0 \C791\C5C5\C5D0\C11C \C2E4\D589 \C911\C778 \D504\B85C\C138\C2A4\C5D0 \B300\D574 \C801\D569\D55C \C6CC\D06C\D50C\B85C\C6B0 \C0C1\AD00 \AD00\ACC4 \CEE8\D14D\C2A4\D2B8\AC00 \C544\B2D9\B2C8\B2E4. \C0C1\AD00 \AD00\ACC4 \CEE8\D14D\C2A4\D2B8\B294 APEX_APPL_WORKFLOW \B4A4\C5D0 \C6CC\D06C\D50C\B85C\C6B0 \C778\C2A4\D134\C2A4 ID \BC0F \C791\C5C5 \C778\C2A4\D134\C2A4 ID\AC00 \D3EC\D568\B418\C5B4 \CF5C\B860\C73C\B85C \AD6C\BD84\B41C \D14D\C2A4\D2B8\C5EC\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140419789969751754)
,p_name=>'APEX.WORKFLOW.CREATED'
,p_message_language=>'ko'
,p_message_text=>unistr('%1 \C6CC\D06C\D50C\B85C\C6B0, %2 \BC84\C804\C758 %0 \C778\C2A4\D134\C2A4\B97C \C0C8\B85C \B9CC\B4E4\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140411819798751752)
,p_name=>'APEX.WORKFLOW.DATA_NOT_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774 \C6CC\D06C\D50C\B85C\C6B0 \C778\C2A4\D134\C2A4\C640 \C5F0\AD00\B41C \CD94\AC00 \B370\C774\D130 \D589\C744 \CC3E\C744 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140434328324751758)
,p_name=>'APEX.WORKFLOW.DUE_SINCE'
,p_message_language=>'ko'
,p_message_text=>unistr('\AE30\D55C %0')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140419636755751754)
,p_name=>'APEX.WORKFLOW.END'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C6CC\D06C\D50C\B85C\C6B0\AC00 %1 \C0C1\D0DC\B85C \C885\B8CC\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705120
);
end;
/
begin
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140416856772751753)
,p_name=>'APEX.WORKFLOW.INCOMPATIBLE_DATA_TYPE'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C6CC\D06C\D50C\B85C\C6B0\C758 \C804\D658 \C791\C5C5\C5D0\C11C \BE44\AD50\D558\B824\B294 \C870\AC74\C758 \B370\C774\D130 \C720\D615 %1\C774(\AC00) \C870\AC74 \C5F0\C0B0\C790\C640 \D638\D658\B418\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140406629785751750)
,p_name=>'APEX.WORKFLOW.INITIATED_BY_USER_SINCE'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 %1\C774(\AC00) \AC1C\C2DC\D568')
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140429469306751757)
,p_name=>'APEX.WORKFLOW.INVOKED'
,p_message_language=>'ko'
,p_message_text=>unistr('%1 \C6CC\D06C\D50C\B85C\C6B0, %2 \BC84\C804\C758 %0 \C778\C2A4\D134\C2A4\B97C \C0C8\B85C \B9CC\B4E6 - \C6CC\D06C\D50C\B85C\C6B0 \C778\C2A4\D134\C2A4 %3\C758 \C791\C5C5 \C778\C2A4\D134\C2A4 %4\C5D0\C11C \D638\CD9C\B428')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140402251086751749)
,p_name=>'APEX.WORKFLOW.NO_ACTIVITY_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('\C815\C801 ID\AC00 %1\C778 \C791\C5C5\C740 %0 \C6CC\D06C\D50C\B85C\C6B0\C758 \C791\C5C5\C774 \C544\B2D9\B2C8\B2E4. \D574\B2F9\D558\B294 \C6CC\D06C\D50C\B85C\C6B0 \BC84\C804\C758 \C791\C5C5 \C815\C801 ID\B97C \D655\C778\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140427540025751756)
,p_name=>'APEX.WORKFLOW.REQUIRED_PARAM_MISSING'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C740(\B294) \C774 \C6CC\D06C\D50C\B85C\C6B0\C758 \D544\C218 \B9E4\AC1C\BCC0\C218\C774\BBC0\B85C NULL\C77C \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140420135969751754)
,p_name=>'APEX.WORKFLOW.RESUMED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C6CC\D06C\D50C\B85C\C6B0 \C778\C2A4\D134\C2A4 %0\C774(\AC00) \C7AC\AC1C\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140420055545751754)
,p_name=>'APEX.WORKFLOW.RETRIED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C6CC\D06C\D50C\B85C\C6B0 \C778\C2A4\D134\C2A4 %0\C774(\AC00) \C7AC\C2DC\B3C4\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140434429286751759)
,p_name=>'APEX.WORKFLOW.RETRY_COUNT.EQUALS_ONE'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C7AC\C2DC\B3C4')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140434536878751759)
,p_name=>'APEX.WORKFLOW.RETRY_COUNT.NOT_EQUALS_ONE'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C7AC\C2DC\B3C4')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140434216094751758)
,p_name=>'APEX.WORKFLOW.STARTED_SINCE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2DC\C791\B428 %0')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140428480675751757)
,p_name=>'APEX.WORKFLOW.STATE.ACTIVE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D65C\C131')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140428690615751757)
,p_name=>'APEX.WORKFLOW.STATE.COMPLETED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C644\B8CC\B428')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140428753917751757)
,p_name=>'APEX.WORKFLOW.STATE.FAULTED'
,p_message_language=>'ko'
,p_message_text=>unistr('\ACB0\D568 \BC1C\C0DD')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140428864043751757)
,p_name=>'APEX.WORKFLOW.STATE.SUSPENDED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C77C\C9C0 \C911\C9C0\B428')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140428574911751757)
,p_name=>'APEX.WORKFLOW.STATE.TERMINATED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C885\B8CC\B428')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140443865881751761)
,p_name=>'APEX.WORKFLOW.STATE.WAITING'
,p_message_language=>'ko'
,p_message_text=>unistr('\B300\AE30 \C911')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140419883046751754)
,p_name=>'APEX.WORKFLOW.SUSPENDED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C6CC\D06C\D50C\B85C\C6B0 \C778\C2A4\D134\C2A4 %0\C774(\AC00) \C77C\C2DC \C911\C9C0\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140425777251751756)
,p_name=>'APEX.WORKFLOW.SWITCH.BRANCH_NOT_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('\C6CC\D06C\D50C\B85C\C6B0 \C778\C2A4\D134\C2A4 %0\C5D0 \B300\D55C \B2E4\C74C \C791\C5C5\C744 \ACB0\C815\D560 \C218 \C5C6\C2B5\B2C8\B2E4. \C6CC\D06C\D50C\B85C\C6B0\B97C \C7AC\C2DC\B3C4\D558\AE30 \C804\C5D0 \D604\C7AC \C804\D658 \C791\C5C5\C5D0 \B300\D574 \C815\C758\B41C \C870\AC74\C744 \D655\C778\D558\ACE0 \C218\C815\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140419988255751754)
,p_name=>'APEX.WORKFLOW.TERMINATED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C6CC\D06C\D50C\B85C\C6B0 \C778\C2A4\D134\C2A4 %0\C774(\AC00) \C885\B8CC\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140419013984751754)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_RESUME'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C6CC\D06C\D50C\B85C\C6B0\C758 \BE44\C988\B2C8\C2A4 \AD00\B9AC\C790\B9CC \C6CC\D06C\D50C\B85C\C6B0\B97C \C7AC\AC1C\D560 \C218 \C788\C2B5\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140419189091751754)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_RETRY'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C6CC\D06C\D50C\B85C\C6B0\B294 \BE44\C988\B2C8\C2A4 \AD00\B9AC\C790 \BC0F/\B610\B294 \C18C\C720\C790\B9CC \C7AC\C2DC\B3C4\D560 \C218 \C788\C2B5\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140418642578751754)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_SUSPEND'
,p_message_language=>'ko'
,p_message_text=>unistr('\C6CC\D06C\D50C\B85C\C6B0 \C778\C2A4\D134\C2A4 %0\C740(\B294) \C6CC\D06C\D50C\B85C\C6B0\C758 \BE44\C988\B2C8\C2A4 \AD00\B9AC\C790\B9CC \C77C\C2DC \C911\C9C0\D560 \C218 \C788\C2B5\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140418970689751754)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_TERMINATE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C6CC\D06C\D50C\B85C\C6B0 \C778\C2A4\D134\C2A4 %0\C758 \C18C\C720\C790 \BC0F \BE44\C988\B2C8\C2A4 \AD00\B9AC\C790\B9CC \C6CC\D06C\D50C\B85C\C6B0\B97C \C885\B8CC\D560 \C218 \C788\C2B5\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140417306780751753)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_UPDATE'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C6CC\D06C\D50C\B85C\C6B0\C758 \BCC0\C218\B294 \C6CC\D06C\D50C\B85C\C6B0\C5D0 \B300\D574 \C815\C758\B41C \BE44\C988\B2C8\C2A4 \AD00\B9AC\C790\B9CC \C5C5\B370\C774\D2B8\D560 \C218 \C788\C2B5\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140431969184751758)
,p_name=>'APEX.WORKFLOW.UPDATE,NOT_ALLOWED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C6CC\D06C\D50C\B85C\C6B0 \C778\C2A4\D134\C2A4 %0\C758 \BCC0\C218\B97C \C5C5\B370\C774\D2B8\D558\B824\BA74 \C778\C2A4\D134\C2A4\AC00 \ACB0\D568 \BC1C\C0DD \B610\B294 \C77C\C9C0 \C911\C9C0\B428 \C0C1\D0DC\C5EC\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140423406463751755)
,p_name=>'APEX.WORKFLOW.UPDATED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C6CC\D06C\D50C\B85C\C6B0 \BCC0\C218 %0\C758 \AC12\C774 %1(\C73C)\B85C \C5C5\B370\C774\D2B8\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140433656816751758)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_ACTIVE'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C6CC\D06C\D50C\B85C\C6B0\C5D0 \D65C\C131 \BC84\C804\C774 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140433797900751758)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_DEV'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C6CC\D06C\D50C\B85C\C6B0\C5D0 \AC1C\BC1C \C911 \BC84\C804\C774 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140433899203751758)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C6CC\D06C\D50C\B85C\C6B0\C5D0 \D65C\C131 \B610\B294 \AC1C\BC1C \C911 \BC84\C804\C774 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140416795051751753)
,p_name=>'APEX.WORKFLOW.WORKFLOW_ACT_INSTANCE_NOT_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('\C6CC\D06C\D50C\B85C\C6B0 \C778\C2A4\D134\C2A4 %0\C5D0 \B300\D55C \C791\C5C5 \C778\C2A4\D134\C2A4 %1\C744(\B97C) \CC3E\C744 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140416506708751753)
,p_name=>'APEX.WORKFLOW.WORKFLOW_INSTANCE_NOT_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('\C6CC\D06C\D50C\B85C\C6B0 \C778\C2A4\D134\C2A4 %0\C744(\B97C) \CC3E\C744 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140451653374751764)
,p_name=>'APEX.XLSX.ERROR.NO_ACTIVE_WORKSHEET'
,p_message_language=>'ko'
,p_message_text=>unistr('\C6CC\D06C\BD81\C5D0 \D65C\C131 \C6CC\D06C\C2DC\D2B8\AC00 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140451531875751764)
,p_name=>'APEX.XLSX.ERROR.WORKBOOK_NOT_INITIALIZED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C6CC\D06C\BD81\C774 \CD08\AE30\D654\B418\C9C0 \C54A\C558\C2B5\B2C8\B2E4.')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140451453922751764)
,p_name=>'APEX.XLSX.INTERNAL_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('XLSX \D30C\C77C\C744 \C0DD\C131\D558\B294 \C911 \B0B4\BD80 \C624\B958\AC00 \BC1C\C0DD\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140453997176751764)
,p_name=>'APEX.XLSX.SHEET'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2DC\D2B8')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140464573341751767)
,p_name=>'APEX.XLSX.SHEET_NAME_TAKEN'
,p_message_language=>'ko'
,p_message_text=>unistr('\C6CC\D06C\C2DC\D2B8 \C774\B984 "%0"\C740(\B294) \C774\BBF8 \C0AC\C6A9\B418\C5C8\C2B5\B2C8\B2E4. \B2E4\B978 \C774\B984\C744 \C2DC\B3C4\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140593139582751805)
,p_name=>'APEXIR_ACTIONS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C791\C5C5')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140508156487751780)
,p_name=>'APEXIR_ACTIONS_MENU'
,p_message_language=>'ko'
,p_message_text=>unistr('\C791\C5C5 \BA54\B274')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140503850597751779)
,p_name=>'APEXIR_ADD_FUNCTION'
,p_message_language=>'ko'
,p_message_text=>unistr('\D568\C218 \CD94\AC00')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140503763276751779)
,p_name=>'APEXIR_ADD_GROUP_BY_COLUMN'
,p_message_language=>'ko'
,p_message_text=>unistr('\ADF8\B8F9 \AE30\C900 \C5F4 \CD94\AC00')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140541382277751790)
,p_name=>'APEXIR_ADD_PIVOT_COLUMN'
,p_message_language=>'ko'
,p_message_text=>unistr('\D53C\BC97 \C5F4 \CD94\AC00')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140541456592751790)
,p_name=>'APEXIR_ADD_ROW_COLUMN'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589 \C5F4 \CD94\AC00')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140475819856751771)
,p_name=>'APEXIR_AGGREGATE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9D1\ACC4')
,p_is_js_message=>true
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140514334105751782)
,p_name=>'APEXIR_AGGREGATION'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9D1\ACC4')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140495284317751776)
,p_name=>'APEXIR_AGG_AVG'
,p_message_language=>'ko'
,p_message_text=>unistr('\D3C9\ADE0')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140499537137751778)
,p_name=>'APEXIR_AGG_COUNT'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC1C\C218')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140495364624751777)
,p_name=>'APEXIR_AGG_MAX'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD5C\B300\AC12')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140495551188751777)
,p_name=>'APEXIR_AGG_MEDIAN'
,p_message_language=>'ko'
,p_message_text=>unistr('\C911\AC04\AC12')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140495492307751777)
,p_name=>'APEXIR_AGG_MIN'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD5C\C18C\AC12')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140495188658751776)
,p_name=>'APEXIR_AGG_SUM'
,p_message_language=>'ko'
,p_message_text=>unistr('\D569\ACC4 %0')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140496216625751777)
,p_name=>'APEXIR_ALL'
,p_message_language=>'ko'
,p_message_text=>unistr('\BAA8\B450')
,p_is_js_message=>true
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140475137879751771)
,p_name=>'APEXIR_ALL_COLUMNS'
,p_message_language=>'ko'
,p_message_text=>unistr('\BAA8\B4E0 \C5F4')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140455254148751765)
,p_name=>'APEXIR_ALL_ROWS'
,p_message_language=>'ko'
,p_message_text=>unistr('\BAA8\B4E0 \D589')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140590191496751805)
,p_name=>'APEXIR_ALTERNATIVE'
,p_message_language=>'ko'
,p_message_text=>unistr('\B300\CCB4')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140591765861751805)
,p_name=>'APEXIR_ALTERNATIVE_DEFAULT_NAME'
,p_message_language=>'ko'
,p_message_text=>unistr('\B300\CCB4 \AE30\BCF8\AC12: %0 ')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140489305494751775)
,p_name=>'APEXIR_AND'
,p_message_language=>'ko'
,p_message_text=>unistr('\BC0F')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140524135969751785)
,p_name=>'APEXIR_API.IMPORT_CONTENT_CORRUPTED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C800\C7A5\B41C \BCF4\ACE0\C11C\B97C \C784\D3EC\D2B8\D560 \C218 \C5C6\C2B5\B2C8\B2E4. \CF58\D150\CE20\AC00 \C190\C0C1\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140524280113751785)
,p_name=>'APEXIR_API.IMPORT_CONTENT_EMPTY'
,p_message_language=>'ko'
,p_message_text=>unistr('\C800\C7A5\B41C \BCF4\ACE0\C11C\B97C \C784\D3EC\D2B8\D560 \C218 \C5C6\C2B5\B2C8\B2E4. \CF58\D150\CE20\AC00 \BE44\C5B4 \C788\C2B5\B2C8\B2E4.')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140477375807751771)
,p_name=>'APEXIR_APPLY'
,p_message_language=>'ko'
,p_message_text=>unistr('\C801\C6A9')
,p_is_js_message=>true
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140470939354751769)
,p_name=>'APEXIR_ASCENDING'
,p_message_language=>'ko'
,p_message_text=>unistr('\C624\B984\CC28\C21C')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140492450759751776)
,p_name=>'APEXIR_AS_OF'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2DC\C810: %0')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140592349568751805)
,p_name=>'APEXIR_AVERAGE_X'
,p_message_language=>'ko'
,p_message_text=>unistr('\D3C9\ADE0 %0')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140583922448751803)
,p_name=>'APEXIR_BAR'
,p_message_language=>'ko'
,p_message_text=>unistr('\B9C9\B300')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140476664703751771)
,p_name=>'APEXIR_BETWEEN'
,p_message_language=>'ko'
,p_message_text=>unistr('\BC94\C704:')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140469718987751769)
,p_name=>'APEXIR_BGCOLOR'
,p_message_language=>'ko'
,p_message_text=>unistr('\BC30\ACBD\C0C9')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140471699823751769)
,p_name=>'APEXIR_BLUE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D30C\B780\C0C9')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140505785953751780)
,p_name=>'APEXIR_BOTTOM'
,p_message_language=>'ko'
,p_message_text=>unistr('\B9E8 \C544\B798\B85C')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140436521791751759)
,p_name=>'APEXIR_BTNS_NEXT_TO_SEARCH_OF'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C758 \AC80\C0C9 \B3C4\AD6C \BAA8\C74C \C606\C5D0 \C788\B294 \B2E8\CD94')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140472219083751770)
,p_name=>'APEXIR_CANCEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\CDE8\C18C')
,p_is_js_message=>true
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140478503434751772)
,p_name=>'APEXIR_CATEGORY'
,p_message_language=>'ko'
,p_message_text=>unistr('\BC94\C8FC')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140469610460751769)
,p_name=>'APEXIR_CELL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C140')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140496140058751777)
,p_name=>'APEXIR_CHART'
,p_message_language=>'ko'
,p_message_text=>unistr('\CC28\D2B8')
,p_is_js_message=>true
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140506637665751780)
,p_name=>'APEXIR_CHART_INITIALIZING'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD08\AE30\D654 \C911...')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140546396958751792)
,p_name=>'APEXIR_CHART_LABEL_NOT_NULL'
,p_message_language=>'ko'
,p_message_text=>unistr('\CC28\D2B8 \B808\C774\BE14\C744 \C9C0\C815\D574\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140558781484751795)
,p_name=>'APEXIR_CHART_MAX_DATAPOINT_CNT'
,p_message_language=>'ko'
,p_message_text=>unistr('\D574\B2F9 \C9C8\C758\B294 \CC28\D2B8\B2F9 \CD5C\B300 \B370\C774\D130 \D3EC\C778\D2B8 \C218 %0\AC1C\B97C \CD08\ACFC\D569\B2C8\B2E4. \AE30\BCF8 \C9C8\C758\C758 \B808\CF54\B4DC \C218\B97C \C904\C774\B824\BA74 \D544\D130\B97C \C801\C6A9\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140557609443751795)
,p_name=>'APEXIR_CHART_MAX_ROW_CNT'
,p_message_language=>'ko'
,p_message_text=>unistr('\CC28\D2B8 \C9C8\C758\C5D0 \B300\D55C \CD5C\B300 \D589 \C218\B294 \D45C\C2DC\B418\B294 \D589 \C218\AC00 \C544\B2CC \AE30\BCF8 \C9C8\C758\C758 \D589 \C218\B97C \C81C\D55C\D569\B2C8\B2E4. \AE30\BCF8 \C9C8\C758\AC00 \CD5C\B300 \D589 \C218 %0\AC1C\B97C \CD08\ACFC\D569\B2C8\B2E4. \AE30\BCF8 \C9C8\C758\C758 \B808\CF54\B4DC \C218\B97C \C904\C774\B824\BA74 \D544\D130\B97C \C801\C6A9\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140475223584751771)
,p_name=>'APEXIR_CHART_TYPE'
,p_message_language=>'ko'
,p_message_text=>unistr('\CC28\D2B8 \C720\D615')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140439152212751760)
,p_name=>'APEXIR_CHART_VIEW_OF'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C758 \CC28\D2B8 \BCF4\AE30')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140554399847751794)
,p_name=>'APEXIR_CHECK_ALL'
,p_message_language=>'ko'
,p_message_text=>unistr('\BAA8\B450 \C120\D0DD')
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140492864333751776)
,p_name=>'APEXIR_CHOOSE_DOWNLOAD_FORMAT'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\ACE0\C11C \D615\C2DD \C120\D0DD')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140500630259751778)
,p_name=>'APEXIR_CLEAR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\C6B0\AE30')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140472188073751770)
,p_name=>'APEXIR_COLUMN'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F4')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140511953588751781)
,p_name=>'APEXIR_COLUMNS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F4')
,p_is_js_message=>true
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140479126599751772)
,p_name=>'APEXIR_COLUMN_ALIASES'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F4 \BCC4\CE6D')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140586751758751804)
,p_name=>'APEXIR_COLUMN_FILTER'
,p_message_language=>'ko'
,p_message_text=>unistr('\D544\D130...')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140446996216751762)
,p_name=>'APEXIR_COLUMN_HEADER'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F4 \BA38\B9AC\AE00')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140461055083751766)
,p_name=>'APEXIR_COLUMN_HEADER_ACTIONS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F4 \C791\C5C5')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140461373352751766)
,p_name=>'APEXIR_COLUMN_HEADER_ACTIONS_FOR'
,p_message_language=>'ko'
,p_message_text=>unistr('"%0" \C5F4\C5D0 \B300\D55C \C791\C5C5')
,p_is_js_message=>true
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140502740478751779)
,p_name=>'APEXIR_COLUMN_HEADING_MENU'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F4 \BA38\B9AC\AE00 \BA54\B274')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140506438164751780)
,p_name=>'APEXIR_COLUMN_INFO'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F4 \C815\BCF4')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140589062788751804)
,p_name=>'APEXIR_COLUMN_LABEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F4 \B808\C774\BE14')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140504116343751779)
,p_name=>'APEXIR_COLUMN_N'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F4 %0')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140487011872751774)
,p_name=>'APEXIR_COMPARISON_CONTAINS'
,p_message_language=>'ko'
,p_message_text=>unistr('\D3EC\D568')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140488308595751774)
,p_name=>'APEXIR_COMPARISON_DOESNOT_CONTAIN'
,p_message_language=>'ko'
,p_message_text=>unistr('\D3EC\D568\D558\C9C0 \C54A\C74C')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140470689408751769)
,p_name=>'APEXIR_COMPARISON_IN'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C\C5D0 \C18D\D568')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140488515820751775)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_LAST'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C\C774 \B9C8\C9C0\B9C9\C774 \C544\B2D8')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140497636526751777)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_NEXT'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C\C774 \CC28\AE30\AC00 \C544\B2D8')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140488454805751774)
,p_name=>'APEXIR_COMPARISON_IS_IN_LAST'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C\C774 \B9C8\C9C0\B9C9\C784')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140497519437751777)
,p_name=>'APEXIR_COMPARISON_IS_IN_NEXT'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C\C774 \CC28\AE30\C784')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140470552821751769)
,p_name=>'APEXIR_COMPARISON_IS_NOT_NULL'
,p_message_language=>'ko'
,p_message_text=>unistr('\B110\C774 \C544\B2D8')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140470488028751769)
,p_name=>'APEXIR_COMPARISON_IS_NULL'
,p_message_language=>'ko'
,p_message_text=>unistr('\B110')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140470212514751769)
,p_name=>'APEXIR_COMPARISON_LIKE'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C\ACFC \C720\C0AC')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140470780447751769)
,p_name=>'APEXIR_COMPARISON_NOT_IN'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C\C5D0 \C18D\D558\C9C0 \C54A\C74C')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140470304817751769)
,p_name=>'APEXIR_COMPARISON_NOT_LIKE'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C\ACFC \C720\C0AC\D558\C9C0 \C54A\C74C')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140487302596751774)
,p_name=>'APEXIR_COMPARISON_REGEXP_LIKE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C815\ADDC \D45C\D604\C2DD \C77C\CE58')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140492771779751776)
,p_name=>'APEXIR_COMPUTATION'
,p_message_language=>'ko'
,p_message_text=>unistr('\ACC4\C0B0')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140557364226751795)
,p_name=>'APEXIR_COMPUTATION_EXPRESSION'
,p_message_language=>'ko'
,p_message_text=>unistr('\ACC4\C0B0 \D45C\D604\C2DD')
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140512250594751782)
,p_name=>'APEXIR_COMPUTATION_FOOTER'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F4 \BCC4\CE6D\C744 \C0AC\C6A9\D558\C5EC \ACC4\C0B0\C744 \C0DD\C131\D569\B2C8\B2E4.')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140512345368751782)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E1'
,p_message_language=>'ko'
,p_message_text=>'(B+C)*100'
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140512471637751782)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E2'
,p_message_language=>'ko'
,p_message_text=>'INITCAP(B)||'', ''||INITCAP(C)'
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140512578841751782)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E3'
,p_message_language=>'ko'
,p_message_text=>'CASE WHEN A = 10 THEN B + C ELSE B END'
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140453494644751764)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E4'
,p_message_language=>'ko'
,p_message_text=>'ROUND(C / 1000000)'
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140496994632751777)
,p_name=>'APEXIR_COMPUTE'
,p_message_language=>'ko'
,p_message_text=>unistr('\ACC4\C0B0')
,p_is_js_message=>true
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140504778850751779)
,p_name=>'APEXIR_CONTROL_BREAK'
,p_message_language=>'ko'
,p_message_text=>unistr('\C81C\C5B4 \CC28\B2E8')
,p_is_js_message=>true
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140507767099751780)
,p_name=>'APEXIR_CONTROL_BREAKS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C81C\C5B4 \CC28\B2E8')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140594367560751806)
,p_name=>'APEXIR_CONTROL_BREAK_COLUMNS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C81C\C5B4 \CC28\B2E8 \C5F4')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140450128067751763)
,p_name=>'APEXIR_COUNT_DISTINCT'
,p_message_language=>'ko'
,p_message_text=>unistr('\ACE0\C720 \AC1C\C218')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140592819414751805)
,p_name=>'APEXIR_COUNT_DISTINCT_X'
,p_message_language=>'ko'
,p_message_text=>unistr('\ACE0\C720 \AC1C\C218')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140592732834751805)
,p_name=>'APEXIR_COUNT_X'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC1C\C218 %0')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140565777869751797)
,p_name=>'APEXIR_DAILY'
,p_message_language=>'ko'
,p_message_text=>unistr('\C77C\BCC4')
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140619016586751813)
,p_name=>'APEXIR_DATA'
,p_message_language=>'ko'
,p_message_text=>unistr('\B370\C774\D130')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140506538625751780)
,p_name=>'APEXIR_DATA_AS_OF'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\BD84 \C804\C758 \BCF4\ACE0\C11C \B370\C774\D130\C785\B2C8\B2E4.')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140439577099751760)
,p_name=>'APEXIR_DATA_VIEW_OF'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C758 \B370\C774\D130 \BCF4\AE30')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140475946455751771)
,p_name=>'APEXIR_DATE'
,p_message_language=>'ko'
,p_message_text=>unistr('\B0A0\C9DC')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140510474901751781)
,p_name=>'APEXIR_DEFAULT'
,p_message_language=>'ko'
,p_message_text=>unistr('\AE30\BCF8\AC12')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140589950677751804)
,p_name=>'APEXIR_DEFAULT_REPORT_TYPE'
,p_message_language=>'ko'
,p_message_text=>unistr('\AE30\BCF8 \BCF4\ACE0\C11C \C720\D615')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140472397967751770)
,p_name=>'APEXIR_DELETE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AD\C81C')
,p_is_js_message=>true
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140476241825751771)
,p_name=>'APEXIR_DELETE_CONFIRM'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774 \BCF4\ACE0\C11C \C124\C815\C744 \C0AD\C81C\D558\ACA0\C2B5\B2C8\AE4C?')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140576707852751801)
,p_name=>'APEXIR_DELETE_DEFAULT_REPORT'
,p_message_language=>'ko'
,p_message_text=>unistr('\AE30\BCF8 \BCF4\ACE0\C11C \C0AD\C81C')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140504478592751779)
,p_name=>'APEXIR_DELETE_REPORT'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\ACE0\C11C \C0AD\C81C')
,p_is_js_message=>true
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140471064517751769)
,p_name=>'APEXIR_DESCENDING'
,p_message_language=>'ko'
,p_message_text=>unistr('\B0B4\B9BC\CC28\C21C')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140478666076751772)
,p_name=>'APEXIR_DESCRIPTION'
,p_message_language=>'ko'
,p_message_text=>unistr('\C124\BA85')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140502647299751779)
,p_name=>'APEXIR_DETAIL_VIEW'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E8\C77C \D589 \BCF4\AE30')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140510943702751781)
,p_name=>'APEXIR_DIRECTION'
,p_message_language=>'ko'
,p_message_text=>unistr('\BC29\D5A5: %0')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140511899736751781)
,p_name=>'APEXIR_DISABLED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AC\C6A9 \C548\D568')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140471881011751770)
,p_name=>'APEXIR_DISPLAYED'
,p_message_language=>'ko'
,p_message_text=>unistr('\D45C\C2DC\B428')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140475001231751771)
,p_name=>'APEXIR_DISPLAYED_COLUMNS'
,p_message_language=>'ko'
,p_message_text=>unistr('\D45C\C2DC\B41C \C5F4')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140510813433751781)
,p_name=>'APEXIR_DISPLAY_IN_REPORT'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\ACE0\C11C\C5D0 \D45C\C2DC')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140505632827751780)
,p_name=>'APEXIR_DOWN'
,p_message_language=>'ko'
,p_message_text=>unistr('\C544\B798\B85C')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140497001756751777)
,p_name=>'APEXIR_DOWNLOAD'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C6B4\B85C\B4DC')
,p_is_js_message=>true
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140510750621751781)
,p_name=>'APEXIR_DO_NOT_DISPLAY'
,p_message_language=>'ko'
,p_message_text=>unistr('\D45C\C2DC \C548\D568')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140580009521751802)
,p_name=>'APEXIR_DUPLICATE_HIGHLIGHT_COND'
,p_message_language=>'ko'
,p_message_text=>unistr('\C870\AC74\C774 \B3D9\C77C\D55C \AC15\C870 \D45C\C2DC\AC00 \C874\C7AC\D569\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140594529740751806)
,p_name=>'APEXIR_DUPLICATE_PIVOT_COLUMN'
,p_message_language=>'ko'
,p_message_text=>unistr('\C911\BCF5\B41C \D53C\BC97 \C5F4\C774 \C788\C2B5\B2C8\B2E4. \D53C\BC97 \C5F4 \BAA9\B85D\C740 \ACE0\C720\D574\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140594783202751806)
,p_name=>'APEXIR_EDIT'
,p_message_language=>'ko'
,p_message_text=>unistr('\D3B8\C9D1')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140506793607751780)
,p_name=>'APEXIR_EDIT_CHART'
,p_message_language=>'ko'
,p_message_text=>unistr('\CC28\D2B8 \C124\C815 \D3B8\C9D1')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140513332700751782)
,p_name=>'APEXIR_EDIT_CHART2'
,p_message_language=>'ko'
,p_message_text=>unistr('\CC28\D2B8 \D3B8\C9D1')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140477279722751771)
,p_name=>'APEXIR_EDIT_CONTROL_BREAK'
,p_message_language=>'ko'
,p_message_text=>unistr('\C81C\C5B4 \CC28\B2E8 \D3B8\C9D1')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140513779748751782)
,p_name=>'APEXIR_EDIT_FILTER'
,p_message_language=>'ko'
,p_message_text=>unistr('\D544\D130 \D3B8\C9D1')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140480279008751772)
,p_name=>'APEXIR_EDIT_FLASHBACK'
,p_message_language=>'ko'
,p_message_text=>unistr('\D50C\B798\C2DC\BC31 \D3B8\C9D1')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140571556315751799)
,p_name=>'APEXIR_EDIT_GROUP_BY'
,p_message_language=>'ko'
,p_message_text=>unistr('\ADF8\B8F9 \AE30\C900 \D3B8\C9D1')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140513642507751782)
,p_name=>'APEXIR_EDIT_HIGHLIGHT'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC15\C870 \D45C\C2DC \D3B8\C9D1')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140541694709751790)
,p_name=>'APEXIR_EDIT_PIVOT'
,p_message_language=>'ko'
,p_message_text=>unistr('\D53C\BC97 \D3B8\C9D1')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140501012383751778)
,p_name=>'APEXIR_EDIT_REPORT'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\ACE0\C11C \D3B8\C9D1')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140590208130751805)
,p_name=>'APEXIR_EMAIL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C804\C790\BA54\C77C')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140462401561751767)
,p_name=>'APEXIR_EMAIL_ADDRESS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C804\C790\BA54\C77C \C8FC\C18C')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140590585171751805)
,p_name=>'APEXIR_EMAIL_BCC'
,p_message_language=>'ko'
,p_message_text=>unistr('\C228\C740 \CC38\C870')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140590777129751805)
,p_name=>'APEXIR_EMAIL_BODY'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF8\BB38')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140590497783751805)
,p_name=>'APEXIR_EMAIL_CC'
,p_message_language=>'ko'
,p_message_text=>unistr('\CC38\C870')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140591211576751805)
,p_name=>'APEXIR_EMAIL_FREQUENCY'
,p_message_language=>'ko'
,p_message_text=>unistr('\BE48\B3C4')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140467671170751768)
,p_name=>'APEXIR_EMAIL_NOT_CONFIGURED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C804\C790\BA54\C77C\C774 \C774 \C560\D50C\B9AC\CF00\C774\C158\C5D0 \B300\D574 \AD6C\C131\B418\C9C0 \C54A\C558\C2B5\B2C8\B2E4. \AD00\B9AC\C790\C5D0\AC8C \BB38\C758\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140565062068751797)
,p_name=>'APEXIR_EMAIL_REQUIRED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C804\C790\BA54\C77C \C8FC\C18C\B97C \C9C0\C815\D574\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140590817768751805)
,p_name=>'APEXIR_EMAIL_SEE_ATTACHED'
,p_message_language=>'ko'
,p_message_text=>unistr('\CCA8\BD80 \CC38\C870')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140590689971751805)
,p_name=>'APEXIR_EMAIL_SUBJECT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C81C\BAA9')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140566088719751797)
,p_name=>'APEXIR_EMAIL_SUBJECT_REQUIRED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C804\C790\BA54\C77C \C81C\BAA9\C744 \C9C0\C815\D574\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140590325273751805)
,p_name=>'APEXIR_EMAIL_TO'
,p_message_language=>'ko'
,p_message_text=>unistr('\BC1B\B294 \C0AC\B78C')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140469495915751769)
,p_name=>'APEXIR_ENABLED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AC\C6A9')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140513528466751782)
,p_name=>'APEXIR_ENABLE_DISABLE_ALT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AC\C6A9/\C0AC\C6A9 \C548\D568')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140513078887751782)
,p_name=>'APEXIR_ERROR_LANDMARK'
,p_message_language=>'ko'
,p_message_text=>unistr('\C624\B958! %0')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140512608412751782)
,p_name=>'APEXIR_EXAMPLES'
,p_message_language=>'ko'
,p_message_text=>unistr('\C608')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140513460264751782)
,p_name=>'APEXIR_EXAMPLES_WITH_COLON'
,p_message_language=>'ko'
,p_message_text=>unistr('\C608:')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140474916642751770)
,p_name=>'APEXIR_EXCLUDE_NULL'
,p_message_language=>'ko'
,p_message_text=>unistr('\B110 \AC12 \C81C\C678')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140514086693751782)
,p_name=>'APEXIR_EXPAND_COLLAPSE_ALT'
,p_message_language=>'ko'
,p_message_text=>unistr('\D655\C7A5/\CD95\C18C')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140511677104751781)
,p_name=>'APEXIR_EXPRESSION'
,p_message_language=>'ko'
,p_message_text=>unistr('\D45C\D604\C2DD')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140496503265751777)
,p_name=>'APEXIR_FILTER'
,p_message_language=>'ko'
,p_message_text=>unistr('\D544\D130')
,p_is_js_message=>true
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140507603740751780)
,p_name=>'APEXIR_FILTERS'
,p_message_language=>'ko'
,p_message_text=>unistr('\D544\D130')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140518374135751783)
,p_name=>'APEXIR_FILTER_EXPRESSION'
,p_message_language=>'ko'
,p_message_text=>unistr('\D544\D130 \D45C\D604\C2DD')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140616535023751812)
,p_name=>'APEXIR_FILTER_EXPR_TOO_LONG'
,p_message_language=>'ko'
,p_message_text=>unistr('\D544\D130 \D45C\D604\C2DD\C774 \B108\BB34 \AE41\B2C8\B2E4.')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140461235876751766)
,p_name=>'APEXIR_FILTER_SUGGESTIONS'
,p_message_language=>'ko'
,p_message_text=>unistr('\D544\D130 \C81C\C548\C0AC\D56D')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140518289859751783)
,p_name=>'APEXIR_FILTER_TYPE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D544\D130 \C720\D615')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140514291009751782)
,p_name=>'APEXIR_FINDER_ALT'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC80\C0C9\D560 \C5F4\C744 \C120\D0DD\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140496884552751777)
,p_name=>'APEXIR_FLASHBACK'
,p_message_language=>'ko'
,p_message_text=>unistr('\D50C\B798\C2DC\BC31')
,p_is_js_message=>true
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140511487389751781)
,p_name=>'APEXIR_FLASHBACK_DESCRIPTION'
,p_message_language=>'ko'
,p_message_text=>unistr('\D50C\B798\C2DC\BC31 \C9C8\C758\B97C \C0AC\C6A9\D558\BA74 \C774\C804 \C2DC\C810\C5D0 \C874\C7AC\D55C \ADF8\B300\B85C \B370\C774\D130\B97C \BCFC \C218 \C788\C2B5\B2C8\B2E4.')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140565442936751797)
,p_name=>'APEXIR_FLASHBACK_LABEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\D50C\B798\C2DC\BC31 \AE30\AC04')
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140566845079751798)
,p_name=>'APEXIR_FORMAT'
,p_message_language=>'ko'
,p_message_text=>unistr('\D615\C2DD')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140492666730751776)
,p_name=>'APEXIR_FORMAT_MASK'
,p_message_language=>'ko'
,p_message_text=>unistr('\D615\C2DD \B9C8\C2A4\D06C %0')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140504370228751779)
,p_name=>'APEXIR_FUNCTION'
,p_message_language=>'ko'
,p_message_text=>unistr('\D568\C218')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140512125785751782)
,p_name=>'APEXIR_FUNCTIONS'
,p_message_language=>'ko'
,p_message_text=>unistr('\D568\C218: %0')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140589890996751804)
,p_name=>'APEXIR_FUNCTIONS_OPERATORS'
,p_message_language=>'ko'
,p_message_text=>unistr('\D568\C218/\C5F0\C0B0\C790')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140504092890751779)
,p_name=>'APEXIR_FUNCTION_N'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \D568\C218')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140496320615751777)
,p_name=>'APEXIR_GO'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2E4\D589')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140469963229751769)
,p_name=>'APEXIR_GREEN'
,p_message_language=>'ko'
,p_message_text=>unistr('\B179\C0C9')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140514990733751782)
,p_name=>'APEXIR_GROUPBY_COLUMNS'
,p_message_language=>'ko'
,p_message_text=>unistr('\ADF8\B8F9 \AE30\C900 \C5F4')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140515080312751782)
,p_name=>'APEXIR_GROUPBY_FUNCTIONS'
,p_message_language=>'ko'
,p_message_text=>unistr('Group By \D568\C218')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140450242768751763)
,p_name=>'APEXIR_GROUP_BY'
,p_message_language=>'ko'
,p_message_text=>unistr('\ADF8\B8F9 \AE30\C900')
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140590917340751805)
,p_name=>'APEXIR_GROUP_BY_COLUMN'
,p_message_language=>'ko'
,p_message_text=>unistr('\ADF8\B8F9 \AE30\C900 \C5F4 %0')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140546416131751792)
,p_name=>'APEXIR_GROUP_BY_COL_NOT_NULL'
,p_message_language=>'ko'
,p_message_text=>unistr('\ADF8\B8F9 \AE30\C900 \C5F4\C744 \C9C0\C815\D574\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140557551023751795)
,p_name=>'APEXIR_GROUP_BY_MAX_ROW_CNT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C8\C758\BCC4 \ADF8\B8F9\C758 \CD5C\B300 \D589 \C218\B294 \D45C\C2DC\B418\B294 \D589 \C218\AC00 \C544\B2CC \AE30\BCF8 \C9C8\C758\C758 \D589 \C218\B97C \C81C\D55C\D569\B2C8\B2E4. \AE30\BCF8 \C9C8\C758\AC00 \CD5C\B300 \D589 \C218 %0\AC1C\B97C \CD08\ACFC\D569\B2C8\B2E4. \AE30\BCF8 \C9C8\C758\C758 \B808\CF54\B4DC \C218\B97C \C904\C774\B824\BA74 \D544\D130\B97C \C801\C6A9\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140537782814751789)
,p_name=>'APEXIR_GROUP_BY_SORT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C815\B82C\BCC4 \ADF8\B8F9')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140594416313751806)
,p_name=>'APEXIR_GROUP_BY_SORT_ORDER'
,p_message_language=>'ko'
,p_message_text=>unistr('\ADF8\B8F9 \AE30\C900 \C815\B82C \C21C\C11C')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140439362480751760)
,p_name=>'APEXIR_GROUP_BY_VIEW_OF'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C758 \ADF8\B8F9 \AE30\C900 \BCF4\AE30')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140475309124751771)
,p_name=>'APEXIR_HCOLUMN'
,p_message_language=>'ko'
,p_message_text=>unistr('\C218\D3C9 \B9C9\B300')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140509311566751781)
,p_name=>'APEXIR_HELP'
,p_message_language=>'ko'
,p_message_text=>unistr('\B3C4\C6C0\B9D0')
,p_is_js_message=>true
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140501101453751778)
,p_name=>'APEXIR_HELP_01'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\B300\D654\C2DD \BCF4\ACE0\C11C\C5D0\C11C\B294 \C77C\BC18 \C0AC\C6A9\C790\AC00 \BCF4\ACE0\C11C\B97C \C815\C758\D560 \C218 \C788\C2B5\B2C8\B2E4. \C0AC\C6A9\C790\B294 \C5F4\C744 \C120\D0DD\D558\ACE0, \D544\D130\B97C \C801\C6A9\D558\ACE0, \AC15\C870 \D45C\C2DC \BC0F \C815\B82C\C744 \C218\D589\D558\C5EC \BCF4\ACE0\C11C \B370\C774\D130\C758 \B808\C774\C544\C6C3\C744 \BCC0\ACBD\D560 \C218 \C788\C2B5\B2C8\B2E4. \C0AC\C6A9\C790\B294 \B610\D55C \C911\B2E8\C810, \C9D1\ACC4, \CC28\D2B8, \ADF8\B8F9 \AE30\C900\C744 \C815\C758\D558\ACE0 \ACE0\C720 \ACC4\C0B0\C744 \CD94\AC00\D560 \C218 \C788\C2B5\B2C8\B2E4. \C0AC\C6A9\C790\B294 \C9C0\C815\B41C \AC04\ACA9\C5D0 \B530\B77C \BCF4\ACE0\C11C\C758 HTML \BC84\C804\C744 \C804\C790\BA54\C77C\B85C \BCF4\B0B4\B3C4\B85D \AC00\C785\C744 \C124\C815\D560 \C218\B3C4 \C788\C2B5\B2C8\B2E4. \C0AC\C6A9\C790\B294 \BCF4\ACE0\C11C\B97C \C5EC\B7EC \AC00\C9C0 \D615\D0DC\B85C \C0DD\C131\D558\ACE0 \D37C\BE14\B9AD \B610\B294 \D504\B77C\C774\BE57')
||unistr(' \BCF4\AE30\B97C \C704\D574 \C774\B984\C774 \C9C0\C815\B41C \BCF4\ACE0\C11C\B85C \C800\C7A5\D560 \C218 \C788\C2B5\B2C8\B2E4. '),
'<p/>',
unistr('\C774\D6C4 \C139\C158\C5D0\C11C\B294 \B300\D654\C2DD \BCF4\ACE0\C11C\B97C \C0AC\C6A9\C790\AC00 \C815\C758\D560 \C218 \C788\B294 \BC29\BC95\C744 \C694\C57D\D574\C11C \BCF4\C5EC\C90D\B2C8\B2E4. \C790\C138\D55C \B0B4\C6A9\C740 <i>Oracle APEX End User''s Guide</i>\C758 "Using Interactive Reports"\B97C \CC38\C870\D558\C2ED\C2DC\C624.')))
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140508228256751780)
,p_name=>'APEXIR_HELP_ACTIONS_MENU'
,p_message_language=>'ko'
,p_message_text=>unistr('\C791\C5C5 \BA54\B274\B294 \AC80\C0C9 \B3C4\AD6C \BAA8\C74C\C758 [\C2E4\D589] \B2E8\CD94 \C624\B978\CABD\C5D0 \D45C\C2DC\B429\B2C8\B2E4. \C774 \BA54\B274\B97C \C0AC\C6A9\D558\C5EC \B300\D654\C2DD \BCF4\ACE0\C11C\B97C \C0AC\C6A9\C790\C815\C758\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140501972416751779)
,p_name=>'APEXIR_HELP_AGGREGATE'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\C9D1\ACC4\B294 \C5F4\C5D0 \B300\D574 \C218\D589\B418\B294 \C218\D559 \ACC4\C0B0\C785\B2C8\B2E4. \C9D1\ACC4\B294 \C815\C758\B41C \C5F4 \B0B4\C5D0\C11C \AC01 \C81C\C5B4 \CC28\B2E8 \B4A4\C640 \BCF4\ACE0\C11C \B05D\C5D0 \D45C\C2DC\B429\B2C8\B2E4. \C635\C158\C740 \B2E4\C74C\ACFC \AC19\C2B5\B2C8\B2E4.'),
'<p>',
'</p><ul>',
unistr('<li><strong>\C9D1\ACC4</strong>\B97C \C0AC\C6A9\D558\BA74 \C774\C804\C5D0 \C815\C758\B41C \C9D1\ACC4\B97C '),
unistr('\C120\D0DD\D558\C5EC \D3B8\C9D1\D560 \C218 \C788\C2B5\B2C8\B2E4.</li>'),
unistr('<li><strong>\D568\C218</strong>\B294 \C218\D589\D560 \D568\C218(\C608: SUM, MIN)\C785\B2C8\B2E4.</li>'),
unistr('<li><strong>\C5F4</strong>\C740 \C218\D559 \D568\C218\B97C \C801\C6A9\D560 \C5F4\C744 \C120\D0DD\D558\B294 \B370 \C0AC\C6A9\B429\B2C8\B2E4. '),
unistr('\C22B\C790 \C5F4\B9CC \D45C\C2DC\B429\B2C8\B2E4.</li>'),
'</ul>'))
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140502083236751779)
,p_name=>'APEXIR_HELP_CHART'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\C800\C7A5\B41C \BCF4\ACE0\C11C\B2F9 \D558\B098\C758 \CC28\D2B8\B97C \C815\C758\D560 \C218 \C788\C2B5\B2C8\B2E4. \CC28\D2B8\AC00'),
unistr('\C815\C758\B418\BA74 \AC80\C0C9 \B3C4\AD6C \BAA8\C74C\C5D0 \C788\B294 \BCF4\AE30 \C544\C774\CF58\C744 \C0AC\C6A9\D574\C11C \CC28\D2B8 \BCF4\AE30 \B610\B294 \BCF4\ACE0\C11C \BCF4\AE30\B85C \C804\D658\D560 \C218 \C788\C2B5\B2C8\B2E4.'),
unistr('\C635\C158\C740 \B2E4\C74C\ACFC \AC19\C2B5\B2C8\B2E4. '),
'<p>',
'</p><ul>',
unistr('<li><strong>\CC28\D2B8 \C720\D615</strong>\C740 \D3EC\D568\C2DC\D0AC \CC28\D2B8 \C720\D615\C744 \C2DD\BCC4\D569\B2C8\B2E4.'),
unistr('\AC00\B85C \B9C9\B300, \C138\B85C \B9C9\B300, \D30C\C774 \B610\B294 \C120 \C911\C5D0\C11C \C120\D0DD\D558\C2ED\C2DC\C624.</li>'),
unistr('<li><strong>\B808\C774\BE14</strong>\C744 \C0AC\C6A9\D558\BA74 \B808\C774\BE14\B85C \C0AC\C6A9\D560 \C5F4\C744 \C120\D0DD\D560 \C218 \C788\C2B5\B2C8\B2E4.</li>'),
unistr('<li><strong>\B808\C774\BE14\C5D0 \B300\D55C \CD95 \C81C\BAA9</strong>\C740 \B808\C774\BE14\C5D0 \B300\D574 \C120\D0DD\D55C \C5F4\ACFC \C5F0\AD00\B41C \CD95\C5D0 \D45C\C2DC\B420 \C81C\BAA9\C785\B2C8\B2E4.'),
unistr('\D30C\C774 \CC28\D2B8\C5D0 \B300\D574\C11C\B294 \C0AC\C6A9\D560 \C218 \C5C6\C2B5\B2C8\B2E4.</li>'),
unistr('<li><strong>\AC12</strong>\C744 \C0AC\C6A9\D558\BA74 \AC12\C73C\B85C \C0AC\C6A9\D560 \C5F4\C744 \C120\D0DD\D560 \C218 \C788\C2B5\B2C8\B2E4. \D568\C218\AC00 COUNT\C778 \ACBD\C6B0 \AC12\C744'),
unistr('\C120\D0DD\D558\C9C0 \C54A\C544\B3C4 \B429\B2C8\B2E4.</li>'),
unistr('<li><strong>\AC12\C5D0 \B300\D55C \CD95 \C81C\BAA9</strong>\C740 \AC12\C5D0 \B300\D574 \C120\D0DD\B41C \C5F4\ACFC \C5F0\AD00\B41C \CD95\C5D0 \D45C\C2DC\B420 \C81C\BAA9\C785\B2C8\B2E4.'),
unistr('\D30C\C774 \CC28\D2B8\C5D0 \B300\D574\C11C\B294 \C0AC\C6A9\D560 \C218 \C5C6\C2B5\B2C8\B2E4.</li>'),
unistr('<li><strong>\D568\C218</strong>\B294 \AC12\C5D0 \B300\D574 \C120\D0DD\B41C \C5F4\C5D0\C11C \C218\D589\D560 \C120\D0DD\C801 \D568\C218\C785\B2C8\B2E4.</li>'),
unistr('<li><strong>\C815\B82C</strong>\C744 \C0AC\C6A9\D558\BA74 \ACB0\ACFC \C9D1\D569\C744 \C815\B82C\D560 \C218 \C788\C2B5\B2C8\B2E4.</li></ul>')))
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140501327408751778)
,p_name=>'APEXIR_HELP_COLUMN_HEADING_MENU'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\C784\C758\C758 \C5F4 \BA38\B9AC\AE00\C744 \B204\B974\BA74 \C5F4 \BA38\B9AC\AE00 \BA54\B274\AC00 \D45C\C2DC\B429\B2C8\B2E4. \C635\C158\C740 \B2E4\C74C\ACFC \AC19\C2B5\B2C8\B2E4.'),
'<p></p>',
'<ul>',
unistr('<li><strong>\C624\B984\CC28\C21C \C815\B82C \C544\C774\CF58</strong>\C744 \B204\B974\BA74 \BCF4\ACE0\C11C\AC00 \C5F4\C744 \AE30\C900\C73C\B85C \C624\B984\CC28\C21C\C73C\B85C \C815\B82C\B429\B2C8\B2E4.</li>'),
unistr('<li><strong>\B0B4\B9BC\CC28\C21C \C815\B82C \C544\C774\CF58</strong>\C744 \B204\B974\BA74 \BCF4\ACE0\C11C\AC00 \C5F4\C744 \AE30\C900\C73C\B85C \B0B4\B9BC\CC28\C21C\C73C\B85C \C815\B82C\B429\B2C8\B2E4.</li>'),
unistr('<li><strong>\C5F4 \C228\AE30\AE30</strong>\B97C \B204\B974\BA74 \C5F4\C774 \C228\ACA8\C9D1\B2C8\B2E4. \C77C\BD80 \C5F4\C740 \C228\AE38 \C218 \C5C6\C2B5\B2C8\B2E4. \C5F4\C744 \C228\AE38 \C218 \C5C6\B294 \ACBD\C6B0 \C5F4 \C228\AE30\AE30 \C544\C774\CF58\C774 \D45C\C2DC\B418\C9C0 \C54A\C2B5\B2C8\B2E4.</li>'),
unistr('<li><strong>\AD6C\BD84 \C5F4</strong>\C744 \B204\B974\BA74 \C5F4\C5D0 \AD6C\BD84 \ADF8\B8F9\C774 \C0DD\C131\B429\B2C8\B2E4. \C774\B294 \BCF4\ACE0\C11C\C758 \C5F4\C744 \B9C8\C2A4\D130 \B808\CF54\B4DC\B85C \AC00\C838\C635\B2C8\B2E4.</li>'),
unistr('<li><strong>\C5F4 \C815\BCF4</strong>\B97C \B204\B974\BA74 \C5F4\C5D0 \B300\D55C \B3C4\C6C0\B9D0 \D14D\C2A4\D2B8(\C0AC\C6A9 \AC00\B2A5\D55C \ACBD\C6B0)\AC00 \D45C\C2DC\B429\B2C8\B2E4.</li>'),
unistr('<li><strong>\D14D\C2A4\D2B8 \C601\C5ED</strong>\C740 \B300\C18C\BB38\C790 \AD6C\BD84 \C5C6\C774 \AC80\C0C9 \C870\AC74(\C640\C77C\B4DC \CE74\B4DC \BB38\C790 \D544\C694 \C5C6\C74C)\C744 '),
unistr('\C785\B825\D558\B294 \B370 \C0AC\C6A9\B429\B2C8\B2E4. \AC12\C744 \C785\B825\D558\BA74 \BA54\B274 \D558\B2E8\C758 \AC12 \BAA9\B85D\C774 \C904\C5B4\B4ED\B2C8\B2E4. '),
unistr('\ADF8\B7F0 \B2E4\C74C \D558\B2E8\C5D0\C11C \AC12\C744 \C120\D0DD\D560 \C218 \C788\C73C\BA70 \C120\D0DD\D55C \AC12\C740 ''=''\B97C \C0AC\C6A9\D558\B294'),
unistr('\D544\D130(\C608: <code>column = ''ABC''</code>)\B85C \C0DD\C131\B429\B2C8\B2E4. \B610\B294 \D45C\C2DC\B4F1 \C544\C774\CF58\C744 \B204\B97C \C218 \C788\B294\B370, \C774 \ACBD\C6B0 \C785\B825\D55C \AC12\C740 ''LIKE'' \C218\C815\C790\AC00 \C788\B294 '),
unistr('\D544\D130(\C608: <code>column LIKE ''%ABC%''</code>)\B85C \C0DD\C131\B429\B2C8\B2E4.</li>'),
unistr('<li><strong>\ACE0\C720 \AC12 \BAA9\B85D</strong>\C5D0\B294 \D544\D130\B97C \CDA9\C871\D558\B294 \CC98\C74C 500\AC1C\C758 \ACE0\C720 \AC12\C774 \D3EC\D568\B429\B2C8\B2E4. '),
unistr('\B0A0\C9DC \C5F4\C778 \ACBD\C6B0\C5D0\B294 \B0A0\C9DC \BC94\C704 \BAA9\B85D\C774 \B300\C2E0 \D45C\C2DC\B429\B2C8\B2E4. \AC12\C744 \C120\D0DD\D558\BA74 ''=''\B97C '),
unistr('\C0AC\C6A9\D558\B294 \D544\D130(\C608: <code>column = ''ABC''</code>)\AC00 \C0DD\C131\B429\B2C8\B2E4.</li>'),
'</ul>'))
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140501850598751778)
,p_name=>'APEXIR_HELP_COMPUTE'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\BCF4\ACE0\C11C\C5D0 \ACC4\C0B0\B41C \C5F4\C744 \CD94\AC00\D560 \C218 \C788\C2B5\B2C8\B2E4. \C774\B7EC\D55C \C5F4\C740 \C0B0\C220 \ACC4\C0B0(\C608: <code>NBR_HOURS/24</code>)\C774\AC70\B098 \AE30\C874 \C5F4\C5D0 \C801\C6A9\B41C \D45C\C900 Oracle \D568\C218\C77C'),
unistr('\C218 \C788\C2B5\B2C8\B2E4. \C77C\BD80\B294 \C608\C81C \BC0F \AE30\D0C0 \D56D\BAA9(\C608: <code>TO_DATE</code>\B97C \C0AC\C6A9\D560 \C218 \C788\C74C)\C73C\B85C \D45C\C2DC\B420 \C218 \C788\C2B5\B2C8\B2E4. \C635\C158\C740 \B2E4\C74C\ACFC \AC19\C2B5\B2C8\B2E4.'),
'<p></p>',
'<ul>',
unistr('<li><strong>\ACC4\C0B0</strong> - \C774\C804\C5D0 \C815\C758\B41C \ACC4\C0B0\C744 \C120\D0DD\D558\C5EC \D3B8\C9D1\D560 \C218 \C788\C2B5\B2C8\B2E4.</li>'),
unistr('<li><strong>\C5F4 \C81C\BAA9</strong> - \C0C8 \C5F4\C5D0 \B300\D55C \C5F4 \C81C\BAA9\C785\B2C8\B2E4.</li>'),
unistr('<li><strong>\D615\C2DD \B9C8\C2A4\D06C</strong> - \C5F4\C5D0 \B300\D574 \C801\C6A9\D560 Oracle \D615\C2DD \B9C8\C2A4\D06C\C785\B2C8\B2E4(\C608: S9999).</li>'),
unistr('<li><strong>\ACC4\C0B0</strong> - \C218\D589\D560 \ACC4\C0B0\C785\B2C8\B2E4. \ACC4\C0B0 \B0B4\C5D0\C11C \C5F4\C740 \D45C\C2DC\B41C \BCC4\CE6D\C744 \C0AC\C6A9\D558\C5EC \CC38\C870\B429\B2C8\B2E4.</li>'),
'</ul>',
unistr('<p>\ACC4\C0B0 \C544\B798\C5D0\C11C \C9C8\C758\C5D0 \C788\B294 \C5F4\C740 \D574\B2F9 \C5F0\AD00\B41C \BCC4\CE6D\ACFC \D568\AED8'),
unistr('\D45C\C2DC\B429\B2C8\B2E4. \C5F4 \C774\B984 \B610\B294 \BCC4\CE6D\C744 \B204\B974\BA74 \D574\B2F9 \D56D\BAA9\C774'),
unistr('\ACC4\C0B0\C5D0 \D3EC\D568\B429\B2C8\B2E4. \C5F4 \C606\C5D0\B294 \D0A4\D328\B4DC\AC00 \C788\C2B5\B2C8\B2E4. \C774 \D0A4\D328\B4DC\B294 \C77C\BC18\C801\C73C\B85C'),
unistr('\C0AC\C6A9\B418\B294 \D0A4\C5D0 \B300\D55C \B2E8\CD95\D0A4 \AE30\B2A5\C744 \C218\D589\D569\B2C8\B2E4. \C624\B978\CABD \B05D\C5D0\B294 \D568\C218\AC00 \C788\C2B5\B2C8\B2E4.</p>'),
unistr('<p>\B2E4\C74C \C608\C81C \ACC4\C0B0\C5D0\C11C\B294 \CD1D \BCF4\C0C1\C744 \D45C\C2DC\D558\B294 \BC29\BC95\C744 \BCF4\C5EC \C90D\B2C8\B2E4.</p>'),
'<pre>CASE WHEN A = ''SALES'' THEN B + C ELSE B END</pre>',
unistr('(\C5EC\AE30\C11C A\B294 ORGANIZATION, B\B294 SALARY, C\B294 COMMISSION\C785\B2C8\B2E4.)'),
''))
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140508314942751780)
,p_name=>'APEXIR_HELP_CONTROL_BREAK'
,p_message_language=>'ko'
,p_message_text=>unistr('\D558\B098 \C774\C0C1\C758 \C5F4\C5D0 \AD6C\BD84 \ADF8\B8F9\C744 \C0DD\C131\D558\B294 \B370 \C0AC\C6A9\B429\B2C8\B2E4. \C774\B294 \B300\D654\C2DD \BCF4\ACE0\C11C\C758 \C5F4\C744 \AC00\C838\C640\C11C \B9C8\C2A4\D130 \B808\CF54\B4DC\B85C \D45C\C2DC\D569\B2C8\B2E4.')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140502519917751779)
,p_name=>'APEXIR_HELP_DETAIL_VIEW'
,p_message_language=>'ko'
,p_message_text=>unistr('\D55C \BC88\C5D0 \B2E8\C77C \D589\C758 \C138\BD80\C815\BCF4\B97C \BCF4\B824\BA74 \D655\C778\D558\B824\B294 \D589\C5D0\C11C \B2E8\C77C \D589 \BCF4\AE30 \C544\C774\CF58\C744 \B204\B974\C2ED\C2DC\C624. \C0AC\C6A9 \AC00\B2A5\D55C \ACBD\C6B0 \B2E8\C77C \D589 \BCF4\AE30\B294 \D56D\C0C1 \CCAB\BC88\C9F8 \C5F4\C785\B2C8\B2E4. \B300\D654\C2DD \BCF4\ACE0\C11C\C758 \C0AC\C6A9\C790\C815\C758\C5D0 \B530\B77C \B2E8\C77C \D589 \BCF4\AE30\B294 \D45C\C900 \BCF4\AE30\AC00 \B418\AC70\B098 \C5C5\B370\C774\D2B8\B97C \D5C8\C6A9\D558\B294 \C0AC\C6A9\C790\C815\C758 \D398\C774\C9C0\AC00 \B420 \C218 \C788\C2B5\B2C8\B2E4.')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140502474867751779)
,p_name=>'APEXIR_HELP_DOWNLOAD'
,p_message_language=>'ko'
,p_message_text=>unistr('\D604\C7AC \ACB0\ACFC \C9D1\D569\C744 \B2E4\C6B4\B85C\B4DC\D560 \C218 \C788\C2B5\B2C8\B2E4. \B2E4\C6B4\B85C\B4DC \D615\C2DD\C5D0\B294 PDF, Excel, HTML \BC0F CSV\AC00 \D3EC\D568\B429\B2C8\B2E4. \B2E4\C6B4\B85C\B4DC \C635\C158\C740 \C120\D0DD\D55C \D615\C2DD\C5D0 \B530\B77C \B2E4\B985\B2C8\B2E4. \BAA8\B4E0 \D615\C2DD\C740 \C804\C790\BA54\C77C\B85C \BCF4\B0BC \C218 \C788\C2B5\B2C8\B2E4.')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140501586758751778)
,p_name=>'APEXIR_HELP_FILTER'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\C9C8\C758\C5D0 <code>WHERE</code> \C808\C744 \CD94\AC00\D558\AC70\B098 \C218\C815\D558\C5EC \BCF4\ACE0\C11C\C5D0 \D3EC\CEE4\C2A4\B97C \C124\C815\D569\B2C8\B2E4. \D55C \C5F4\C5D0\C11C \B610\B294 \D589\C744 \AE30\C900\C73C\B85C \D544\D130\B9C1\D560 \C218 \C788\C2B5\B2C8\B2E4.  '),
unistr('<p>\C5F4\C744 \AE30\C900\C73C\B85C \D544\D130\B9C1\D560 \ACBD\C6B0\C5D0\B294 \C5F4(\D45C\C2DC\B41C \C5F4\C77C \D544\C694\B294'),
unistr('\C5C6\C74C)\C744 \C120\D0DD\D558\ACE0, \D45C\C900 Oracle \C5F0\C0B0\C790(=, !=, \B2E4\C74C\C5D0 \C18D\D558\C9C0 \C54A\C74C, \B2E4\C74C \C0AC\C774)\B97C \C120\D0DD\D558\ACE0 \BE44\AD50\D560 \D45C\D604\C2DD\C744 \C785\B825\D558\C2ED\C2DC\C624. \D45C\D604\C2DD\C740 \B300\C18C\BB38\C790\B97C \AD6C\BD84\D569\B2C8\B2E4. %\B97C \C640\C77C\B4DC \CE74\B4DC \BB38\C790\B85C \C0AC\C6A9\D558\C2ED\C2DC\C624(\C608: <code>STATE_NAME'),
'like A%)</code>.</p>',
unistr('<p>\D589\C744 \AE30\C900\C73C\B85C \D544\D130\B9C1\D560 \ACBD\C6B0\C5D0\B294 \C5F4 \BCC4\CE6D \BC0F \C784\C758\C758 Oracle \D568\C218 \B610\B294 \C5F0\C0B0\C790\B97C'),
unistr('\C0AC\C6A9\D558\C5EC \BCF5\C7A1\D55C <code>WHERE</code> \C808\C744 \C0DD\C131\D560 \C218 \C788\C2B5\B2C8\B2E4(\C608: <code>G = ''VA'' or G = ''CT''</code>, \C5EC\AE30\C11C'),
unistr('<code>G</code>\B294 <code>CUSTOMER_STATE</code>\C5D0 \B300\D55C \BCC4\CE6D).</p>'),
''))
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140502145255751779)
,p_name=>'APEXIR_HELP_FLASHBACK'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\D50C\B798\C2DC\BC31 \C9C8\C758\B97C \C0AC\C6A9\D558\BA74 \C774\C804 \C2DC\C810\C5D0 \C874\C7AC\D55C \ADF8\B300\B85C \B370\C774\D130\B97C \BCFC \C218 \C788\C2B5\B2C8\B2E4. '),
unistr('\D50C\B798\C2DC\BC31\D560 \C218 \C788\B294 \C2DC\AC04\C758 \AE30\BCF8 \C591\C740 3\C2DC\AC04(\B610\B294 180\BD84)\C774\C9C0\B9CC \C2E4\C81C \C591\C740 \AC01 '),
unistr('\B370\C774\D130\BCA0\C774\C2A4\C5D0 \B530\B77C \B2E4\B985\B2C8\B2E4.')))
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140566788094751798)
,p_name=>'APEXIR_HELP_FORMAT'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\D615\C2DD\C744 \C0AC\C6A9\D558\BA74 \BCF4\ACE0\C11C\C758 \D45C\C2DC\B97C \C0AC\C6A9\C790\AC00 \C0AC\C6A9\C790\AC00 \C815\C758\D560 \C218 \C788\C2B5\B2C8\B2E4.'),
unistr('\D615\C2DD\C5D0\B294 \B2E4\C74C\ACFC \AC19\C740 \D558\C704 \BA54\B274\AC00 \D3EC\D568\B429\B2C8\B2E4.</p>'),
unistr('<ul><li>\C815\B82C</li>'),
unistr('<li>\C81C\C5B4 \CC28\B2E8</li>'),
unistr('<li>\AC15\C870 \D45C\C2DC</li>'),
unistr('<li>\ACC4\C0B0</li>'),
unistr('<li>\C9D1\ACC4</li>'),
unistr('<li>\CC28\D2B8</li>'),
unistr('<li>\ADF8\B8F9 \AE30\C900</li>'),
unistr('<li>\D53C\BC97</li>'),
'</ul>',
''))
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140564913273751797)
,p_name=>'APEXIR_HELP_GROUP_BY'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\C800\C7A5\B41C \BCF4\ACE0\C11C\B2F9 \D558\B098\C758 \ADF8\B8F9 \AE30\C900 \BCF4\AE30\B97C \C815\C758\D560 \C218'),
unistr('\C788\C2B5\B2C8\B2E4. \C815\C758\D55C \B2E4\C74C\C5D0\B294 \AC80\C0C9 \B3C4\AD6C \BAA8\C74C\C5D0\C11C \BCF4\AE30 \C544\C774\CF58\C744 \C0AC\C6A9\D558\C5EC'),
unistr('\ADF8\B8F9 \AE30\C900 \B610\B294 \BCF4\ACE0\C11C \BCF4\AE30\B85C \C804\D658\D560 \C218 \C788\C2B5\B2C8\B2E4. \ADF8\B8F9 \AE30\C900 \BCF4\AE30\B97C \C0DD\C131\D558\B824\BA74'),
unistr('\B2E4\C74C\C744 \C120\D0DD\D569\B2C8\B2E4.'),
'<p></p><ul>',
unistr('<li>\ADF8\B8F9\D654\D560 \C5F4</li>'),
unistr('<li>\C218\D589\D560 \D568\C218\C640 \D568\AED8 \C9D1\ACC4\D560 \C5F4(\D3C9\ADE0, \D569\ACC4, \AC1C\C218 \B4F1)</li>'),
'</ul>'))
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140501782693751778)
,p_name=>'APEXIR_HELP_HIGHLIGHT'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\D544\D130\B97C \C815\C758\D560 \C218 \C788\C2B5\B2C8\B2E4. \D544\D130 \C870\AC74 \D45C\C2DC\B97C \CDA9\C871\D558\B294 \D589\C740 \D544\D130\C640 \C5F0\AD00\B41C \D2B9\C131\C744 \C0AC\C6A9\D558\C5EC \AC15\C870 \D45C\C2DC\B429\B2C8\B2E4. \C635\C158\C740 \B2E4\C74C\ACFC \AC19\C2B5\B2C8\B2E4.</p>'),
'<ul>',
unistr('<li><strong>\C774\B984</strong>\C740 \D45C\C2DC\C5D0\B9CC \C0AC\C6A9\B429\B2C8\B2E4.</li>'),
unistr('<li><strong>\C2DC\D000\C2A4</strong>\B294 \ADDC\CE59 \D3C9\AC00 \C21C\C11C\B97C \C2DD\BCC4\D569\B2C8\B2E4.</li>'),
unistr('<li><strong>\C0AC\C6A9\C73C\B85C \C124\C815\B428</strong>\C740 \ADDC\CE59\C774 \C0AC\C6A9\C73C\B85C \C124\C815\B418\C5C8\B294\C9C0 \B610\B294 \C0AC\C6A9 \C548\D568\C73C\B85C \C124\C815\B418\C5C8\B294\C9C0 \C2DD\BCC4\D569\B2C8\B2E4.</li>'),
unistr('<li><strong>\AC15\C870 \D45C\C2DC \C720\D615</strong>\C740 \D589 \B610\B294 \C140\C774 \AC15\C870 \D45C\C2DC\B418\B294\C9C0 \C5EC\BD80\B97C '),
unistr('\C2DD\BCC4\D569\B2C8\B2E4. \C140\C774 \C120\D0DD\B41C \ACBD\C6B0 \AC15\C870 \D45C\C2DC \C870\AC74\C5D0\C11C \CC38\C870\B41C '),
unistr('\C5F4\C774 \AC15\C870 \D45C\C2DC\B429\B2C8\B2E4.</li>'),
unistr('<li><strong>\BC30\ACBD\C0C9</strong>\C740 \AC15\C870 \D45C\C2DC\B41C \C601\C5ED\C758 \C0C8 \BC30\ACBD\C0C9\C785\B2C8\B2E4.</li>'),
unistr('<li><strong>\D14D\C2A4\D2B8 \C0C9\C0C1</strong>\C740 \AC15\C870 \D45C\C2DC\B41C \C601\C5ED\C758 \C0C8 \D14D\C2A4\D2B8 \C0C9\C0C1\C785\B2C8\B2E4.</li>'),
unistr('<li><strong>\AC15\C870 \D45C\C2DC \C870\AC74</strong>\C740 \D544\D130 \C870\AC74\C744 \C815\C758\D569\B2C8\B2E4.</li>'),
'</ul>',
''))
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140395138267751747)
,p_name=>'APEXIR_HELP_PIVOT'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\C800\C7A5\B41C \BCF4\ACE0\C11C\B2F9 \D558\B098\C758 \D53C\BC97 \BCF4\AE30\B97C \C815\C758\D560 \C218 \C788\C2B5\B2C8\B2E4. \C815\C758\B41C \D6C4\C5D0\B294 \AC80\C0C9 \B3C4\AD6C \BAA8\C74C\C5D0 \C788\B294 \BCF4\AE30 \C544\C774\CF58\C744 \C0AC\C6A9\D574\C11C \D53C\BC97 \BCF4\AE30 \B610\B294 \BCF4\ACE0\C11C \BCF4\AE30\B85C \C804\D658\D560 \C218 \C788\C2B5\B2C8\B2E4. \D53C\BC97 \BCF4\AE30\B97C \C0DD\C131\D558\B824\BA74 \B2E4\C74C\C744 \C120\D0DD\D569\B2C8\B2E4. '),
'<p></p>',
'<ul>',
unistr('<li>\D53C\BC97\D560 \C5F4</li>'),
unistr('<li>\D589\C73C\B85C \D45C\C2DC\D560 \C5F4</li>'),
unistr('<li>\C218\D589\D560 \D568\C218\C640 \D568\AED8 \C9D1\ACC4\D560 \C5F4(\D3C9\ADE0, \D569\ACC4, \AC1C\C218 \B4F1)</li>'),
'</ul>'))
,p_version_scn=>2705111
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140512806585751782)
,p_name=>'APEXIR_HELP_REPORT_SETTINGS'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\B300\D654\C2DD \BCF4\ACE0\C11C\B97C \C0AC\C6A9\C790\AC00 \C815\C758\D560 \ACBD\C6B0 \BCF4\ACE0\C11C \C124\C815\C774 \AC80\C0C9 \B3C4\AD6C \BAA8\C74C'),
unistr('\C544\B798 \BC0F \BCF4\ACE0\C11C \C704\C5D0 \D45C\C2DC\B429\B2C8\B2E4. \C774 \C601\C5ED\C740 \C67C\CABD\C5D0 \C788\B294 \C544\C774\CF58\C744 \C0AC\C6A9\D558\C5EC \CD95\C18C \BC0F \D655\C7A5\D560 \C218 \C788\C2B5\B2C8\B2E4.'),
'<p>',
unistr('\AC01 \BCF4\ACE0\C11C \C124\C815\C5D0\C11C\B294 \B2E4\C74C\C744 \C218\D589\D560 \C218 \C788\C2B5\B2C8\B2E4.'),
'</p><ul>',
unistr('<li>\C774\B984\C744 \B20C\B7EC \C124\C815\C744 \D3B8\C9D1\D569\B2C8\B2E4.</li>'),
unistr('<li>[\C0AC\C6A9/\C0AC\C6A9 \C548\D568] \CCB4\D06C\BC15\C2A4\B97C \C120\D0DD\D558\AC70\B098 \C120\D0DD\C744 \CDE8\C18C\D558\C5EC \C124\C815\C744 \C0AC\C6A9/\C0AC\C6A9 \C548\D568\C73C\B85C \C124\C815\D569\B2C8\B2E4. \C774 \CF58\D2B8\B864\C744 \C0AC\C6A9\D558\C5EC \C124\C815\C744 \C77C\C2DC\C801\C73C\B85C \C124\C815\D558\AC70\B098 \D574\C81C\D569\B2C8\B2E4.</li>'),
unistr('<li>[\C81C\AC70] \C544\C774\CF58\C744 \B20C\B7EC \C124\C815\C744 \C81C\AC70\D569\B2C8\B2E4.</li>'),
'</ul>',
unistr('<p>\CC28\D2B8, \ADF8\B8F9 \AE30\C900 \B610\B294 \D53C\BC97\C744 \C0DD\C131\D55C \ACBD\C6B0 \C624\B978\CABD\C5D0 \D45C\C2DC\B41C [\BCF4\ACE0\C11C \BCF4\AE30],'),
unistr('[\CC28\D2B8 \BCF4\AE30], [\ADF8\B8F9 \AE30\C900 \BCF4\AE30] \BC0F [\D53C\BC97 \BCF4\AE30]\B97C \C0AC\C6A9\D558\C5EC \C774\B7EC\D55C \D56D\BAA9\ACFC \AE30\C900 \BCF4\ACE0\C11C'),
unistr('\C0AC\C774\B97C \D1A0\AE00\D560 \C218 \C788\C2B5\B2C8\B2E4. \CC28\D2B8, \ADF8\B8F9 \AE30\C900 \B610\B294 \D53C\BC97\C774 \D45C\C2DC\B41C \C0C1\D0DC\C5D0\C11C [\D3B8\C9D1]'),
unistr('\B9C1\D06C\B97C \C0AC\C6A9\D558\C5EC \C124\C815\C744 \D3B8\C9D1\D560 \C218\B3C4 \C788\C2B5\B2C8\B2E4.</p>')))
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140502364473751779)
,p_name=>'APEXIR_HELP_RESET'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\ACE0\C11C\B97C \AE30\BCF8 \C124\C815\C73C\B85C \B2E4\C2DC \C7AC\C124\C815\D558\C5EC \C0AC\C6A9\C790\AC00 \C815\C758\D55C \C0AC\D56D\C744 \BAA8\B450 \C81C\AC70\D569\B2C8\B2E4.')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140567091815751798)
,p_name=>'APEXIR_HELP_ROWS_PER_PAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D398\C774\C9C0\BCC4\B85C \D45C\C2DC\D560 \B808\CF54\B4DC \C218\B97C \C124\C815\D569\B2C8\B2E4.')
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140502217336751779)
,p_name=>'APEXIR_HELP_SAVE_REPORT'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\C774\D6C4 \C0AC\C6A9\C744 \C704\D574 \C0AC\C6A9\C790\C815\C758\B41C \BCF4\ACE0\C11C\B97C \C800\C7A5\D569\B2C8\B2E4. \C774\B984 \BC0F \C120\D0DD\C801\C778 \C124\BA85\C744 \C81C\ACF5\D558\ACE0 \BCF4\ACE0\C11C\B97C \C77C\BC18\C5D0 \C561\C138\C2A4\D560 \C218 \C788\B3C4\B85D \C124\C815\D560 \C218 \C788\C2B5\B2C8\B2E4. \C989, \BAA8\B4E0 \C0AC\C6A9\C790\AC00 \AE30\BCF8 \BCF4\ACE0\C11C\C5D0 \C561\C138\C2A4\D560 \C218 \C788\C2B5\B2C8\B2E4. \B2E4\C74C \B124 \AC00\C9C0 \C720\D615\C758 \B300\D654\C2DD \BCF4\ACE0\C11C\B97C \C800\C7A5\D560 \C218 \C788\C2B5\B2C8\B2E4.</p>'),
'<ul>',
unistr('<li><strong>\AE30\BCF8</strong>(\AC1C\BC1C\C790 \D504\B77C\C774\BE57). \AE30\BCF8\C740 \CC98\C74C\C5D0 \D45C\C2DC\B418\B294 \BCF4\ACE0\C11C\C785\B2C8\B2E4. \AE30\BCF8 \BCF4\ACE0\C11C\B294 \C774\B984\C744 \BC14\AFB8\AC70\B098 \C0AD\C81C\D560 \C218 \C5C6\C2B5\B2C8\B2E4.</li>'),
unistr('<li><strong>\B300\CCB4 \BCF4\ACE0\C11C</strong>(\AC1C\BC1C\C790 \D504\B77C\C774\BE57). \AC1C\BC1C\C790\AC00 \C5EC\B7EC \BCF4\ACE0\C11C \B808\C774\C544\C6C3\C744 \C0DD\C131\D560 \C218 \C788\C2B5\B2C8\B2E4. \AC1C\BC1C\C790\B9CC \B300\CCB4 \BCF4\ACE0\C11C\B97C \C800\C7A5, \C774\B984 \BC14\AFB8\AE30 \B610\B294 \C0AD\C81C\D560 \C218 \C788\C2B5\B2C8\B2E4.</li>'),
unistr('<li><strong>\D37C\BE14\B9AD \BCF4\ACE0\C11C</strong>(\C77C\BC18 \C0AC\C6A9\C790). \BCF4\ACE0\C11C\B97C \C0DD\C131\D55C \C77C\BC18 \C0AC\C6A9\C790\AC00 \C800\C7A5, \C774\B984 \BC14\AFB8\AE30 \B610\B294 \C0AD\C81C\D560 \C218 \C788\C2B5\B2C8\B2E4. \B2E4\B978 \C0AC\C6A9\C790\B294 \B808\C774\C544\C6C3\C744 \BCF4\ACE0 \B2E4\B978 \BCF4\ACE0\C11C\B85C \C800\C7A5\D560 \C218 \C788\C2B5\B2C8\B2E4.</li>'),
unistr('<li><strong>\D504\B77C\C774\BE57 \BCF4\ACE0\C11C</strong>(\C77C\BC18 \C0AC\C6A9\C790). \BCF4\ACE0\C11C\B97C \C0DD\C131\D55C \C77C\BC18 \C0AC\C6A9\C790\B9CC \BCF4\ACE0\C11C\B97C \BCF4\ACE0, \C800\C7A5, \C774\B984 \BC14\AFB8\AE30 \B610\B294 \C0AD\C81C\D560 \C218 \C788\C2B5\B2C8\B2E4.</li>'),
'</ul>',
unistr('<p>\C0AC\C6A9\C790\C815\C758\B41C \BCF4\ACE0\C11C\B97C \C800\C7A5\D55C \ACBD\C6B0 \BCF4\ACE0\C11C \C120\D0DD\AE30\B294 \D589 \C120\D0DD\AE30(\C774 \AE30\B2A5\C774 \C0AC\C6A9\C73C\B85C \C124\C815\B41C \ACBD\C6B0) \D589 \C120\D0DD\AE30\C758 \C67C\CABD\C5D0 \C788\B294 \AC80\C0C9 \B3C4\AD6C \BAA8\C74C\C5D0 \D45C\C2DC\B429\B2C8\B2E4.</p>'),
''))
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140501242349751778)
,p_name=>'APEXIR_HELP_SEARCH_BAR'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC01 \BCF4\ACE0\C11C \D398\C774\C9C0\C758 \C0C1\B2E8\C5D0\B294 \AC80\C0C9 \C601\C5ED\C774 \C788\C2B5\B2C8\B2E4. \C774 \C601\C5ED(\B610\B294 \AC80\C0C9 \B3C4\AD6C \BAA8\C74C)\C5D0\C11C\B294 \B2E4\C74C\ACFC \AC19\C740 \AE30\B2A5\C774 \C81C\ACF5\B429\B2C8\B2E4.')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140567616866751798)
,p_name=>'APEXIR_HELP_SEARCH_BAR_ACTIONS_MENU'
,p_message_language=>'ko'
,p_message_text=>unistr('<li><strong>\C791\C5C5 \BA54\B274</strong>\B97C \C0AC\C6A9\D558\BA74 \BCF4\ACE0\C11C\B97C \C0AC\C6A9\C790\AC00 \C815\C758\D560 \C218 \C788\C2B5\B2C8\B2E4. \C774\D6C4 \D45C\C2DC\B418\B294 \C139\C158\C744 \CC38\C870\D558\C2ED\C2DC\C624.</li>')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140567181077751798)
,p_name=>'APEXIR_HELP_SEARCH_BAR_FINDER'
,p_message_language=>'ko'
,p_message_text=>unistr('<li><strong>\C5F4 \C120\D0DD \C544\C774\CF58</strong>\C744 \C0AC\C6A9\D558\BA74 \AC80\C0C9\D560 \C5F4 \B610\B294 \BAA8\B4E0 \C5F4\C744 \C2DD\BCC4\D560 \C218 \C788\C2B5\B2C8\B2E4.</li>')
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140567414502751798)
,p_name=>'APEXIR_HELP_SEARCH_BAR_REPORTS'
,p_message_language=>'ko'
,p_message_text=>unistr('<li><strong>\BCF4\ACE0\C11C</strong>\B294 \B300\CCB4 \AE30\BCF8\AC12 \BC0F \C800\C7A5\B41C \D504\B77C\C774\BE57 \B610\B294 \D37C\BE14\B9AD \BCF4\ACE0\C11C\B97C \D45C\C2DC\D569\B2C8\B2E4.</li>')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140567344119751798)
,p_name=>'APEXIR_HELP_SEARCH_BAR_ROWS'
,p_message_language=>'ko'
,p_message_text=>unistr('<li><strong>\D589</strong>\C740 \D398\C774\C9C0\B2F9 \D45C\C2DC\D560 \B808\CF54\B4DC \C218\B97C \C124\C815\D569\B2C8\B2E4.</li>')
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140567291923751798)
,p_name=>'APEXIR_HELP_SEARCH_BAR_TEXTBOX'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<li><strong>\D14D\C2A4\D2B8 \C601\C5ED</strong>\C744 \C0AC\C6A9\D558\BA74 \B300\C18C\BB38\C790\B97C \AD6C\BD84\D558\C9C0 \C54A\B294 \AC80\C0C9 \C870\AC74(\C640\C77C\B4DC \CE74\B4DC \BB38\C790 \C0AC\C6A9)\C744 \C785\B825\D560 \C218 \C788\C2B5\B2C8\B2E4.</li>'),
unistr('<li><strong>\C2E4\D589 \B2E8\CD94</strong> - \AC80\C0C9\C744 \C2E4\D589\D569\B2C8\B2E4. Enter \D0A4\B97C \B204\B974\BA74 \CEE4\C11C\AC00 \AC80\C0C9 \D14C\C2A4\D2B8 \C601\C5ED \C548\C5D0 \C788\C744 \ACBD\C6B0 \AC80\C0C9\C774 \C2E4\D589\B429\B2C8\B2E4.</li>')))
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140567551069751798)
,p_name=>'APEXIR_HELP_SEARCH_BAR_VIEW'
,p_message_language=>'ko'
,p_message_text=>unistr('<li><strong>\BCF4\AE30 \C544\C774\CF58</strong>\C740 \C544\C774\CF58, \BCF4\ACE0\C11C, \C138\BD80\C815\BCF4, \CC28\D2B8, \ADF8\B8F9 \AE30\C900 \BC0F \BCF4\ACE0\C11C\C758 \D53C\BC97 \BCF4\AE30(\C815\C758\B41C \ACBD\C6B0)\B85C \C804\D658\B429\B2C8\B2E4.</li>')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140501475270751778)
,p_name=>'APEXIR_HELP_SELECT_COLUMNS'
,p_message_language=>'ko'
,p_message_text=>unistr('\D45C\C2DC\B41C \C5F4\C744 \C218\C815\D558\B294 \B370 \C0AC\C6A9\B429\B2C8\B2E4. \C624\B978\CABD\C5D0 \C788\B294 \C5F4\C740 \D45C\C2DC\B429\B2C8\B2E4. \C67C\CABD\C5D0 \C788\B294 \C5F4\C740 \C228\ACA8\C9D1\B2C8\B2E4. \B9E8 \C624\B978\CABD\C5D0 \C788\B294 \D654\C0B4\D45C\B97C \C0AC\C6A9\D558\C5EC \D45C\C2DC\B41C \C5F4\C744 \C7AC\C815\B82C\D560 \C218 \C788\C2B5\B2C8\B2E4. \ACC4\C0B0\B41C \C5F4 \C55E\C5D0\B294 <strong>**</strong>\AC00 \BD99\C2B5\B2C8\B2E4.')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140501676384751778)
,p_name=>'APEXIR_HELP_SORT'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\C815\B82C\D560 \C5F4\C744 \BCC0\ACBD\D558\B294 \B370 \C0AC\C6A9\B418\BA70, \C624\B984\CC28\C21C \B610\B294 \B0B4\B9BC\CC28\C21C\C73C\B85C'),
unistr('\C815\B82C\D560\C9C0\B97C \ACB0\C815\D569\B2C8\B2E4. \B610\D55C <code>NULL</code>\C758 \CC98\B9AC \BC29\BC95\B3C4'),
unistr('\C9C0\C815\D560 \C218 \C788\C2B5\B2C8\B2E4. \AE30\BCF8 \C124\C815\C740 \D56D\C0C1 <code>NULL</code>\C744 \B9C8\C9C0\B9C9\C73C\B85C \D45C\C2DC\D558\AC70\B098 \BA3C\C800 \D45C\C2DC\D569\B2C8\B2E4. \ACB0\ACFC \C815\B82C\C740 \BCF4\ACE0\C11C\C5D0\C11C \C5F4 \C81C\BAA9 \C624\B978\CABD\C5D0'),
unistr('\D45C\C2DC\B429\B2C8\B2E4.</p>')))
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140564706352751797)
,p_name=>'APEXIR_HELP_SUBSCRIPTION'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC00\C785\C744 \CD94\AC00\D560 \ACBD\C6B0 \C804\C790\BA54\C77C \C8FC\C18C(\B610\B294 \CF64\B9C8\B85C \AD6C\BD84\B41C \C5EC\B7EC \C804\C790\BA54\C77C \C8FC\C18C), \C804\C790\BA54\C77C \C81C\BAA9, \BE48\B3C4 \BC0F \C2DC\C791/\C885\B8CC \B0A0\C9DC\B97C \C81C\ACF5\D558\C2ED\C2DC\C624. \ACB0\ACFC \C804\C790\BA54\C77C\C740 \AC00\C785\C744 \CD94\AC00\D560 \B54C \C81C\ACF5\B41C \BCF4\ACE0\C11C \C124\C815\C744 \C0AC\C6A9\D558\C5EC \D604\C7AC \B370\C774\D130\B97C \D3EC\D568\D558\B294 \B300\D654\C2DD \BCF4\ACE0\C11C\C758 \C775\C2A4\D3EC\D2B8\B41C \BC84\C804(PDF, Excel, HTML \B610\B294 CSV)\C744 \D3EC\D568\D569\B2C8\B2E4.')
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140506375422751780)
,p_name=>'APEXIR_HIDE_COLUMN'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F4 \C228\AE30\AE30')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140496725396751777)
,p_name=>'APEXIR_HIGHLIGHT'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC15\C870 \D45C\C2DC')
,p_is_js_message=>true
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140507860525751780)
,p_name=>'APEXIR_HIGHLIGHTS'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC15\C870 \D45C\C2DC')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140478079153751771)
,p_name=>'APEXIR_HIGHLIGHT_CELL_WITH_COLORS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C140 \AC15\C870 \D45C\C2DC, %1\C758 %0')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140512960052751782)
,p_name=>'APEXIR_HIGHLIGHT_CONDITION'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC15\C870 \D45C\C2DC \C870\AC74')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140477982204751771)
,p_name=>'APEXIR_HIGHLIGHT_ROW_WITH_COLORS'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589 \AC15\C870 \D45C\C2DC, %1\C758 %0')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140565364940751797)
,p_name=>'APEXIR_HIGHLIGHT_STYLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC15\C870 \D45C\C2DC \C2A4\D0C0\C77C')
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140469596372751769)
,p_name=>'APEXIR_HIGHLIGHT_TYPE'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC15\C870 \D45C\C2DC \C720\D615')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140584144043751803)
,p_name=>'APEXIR_HORIZONTAL'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC00\B85C')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140613164320751811)
,p_name=>'APEXIR_INACTIVE_SETTING'
,p_message_language=>'ko'
,p_message_text=>unistr('1\AC1C \BE44\D65C\C131 \C124\C815')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140613269677751811)
,p_name=>'APEXIR_INACTIVE_SETTINGS'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\AC1C \BE44\D65C\C131 \C124\C815')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140502955381751779)
,p_name=>'APEXIR_INTERACTIVE_REPORT_HELP'
,p_message_language=>'ko'
,p_message_text=>unistr('\B300\D654\C2DD \BCF4\ACE0\C11C \B3C4\C6C0\B9D0')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140513991354751782)
,p_name=>'APEXIR_INVALID'
,p_message_language=>'ko'
,p_message_text=>unistr('\BD80\C801\D569')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140507305047751780)
,p_name=>'APEXIR_INVALID_COMPUTATION'
,p_message_language=>'ko'
,p_message_text=>unistr('\ACC4\C0B0 \D45C\D604\C2DD\C774 \BD80\C801\D569\D569\B2C8\B2E4. %0')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140462961203751767)
,p_name=>'APEXIR_INVALID_END_DATE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C885\B8CC \B0A0\C9DC\B294 \C2DC\C791 \B0A0\C9DC \C774\D6C4\C5EC\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140522139008751785)
,p_name=>'APEXIR_INVALID_FILTER'
,p_message_language=>'ko'
,p_message_text=>unistr('\BD80\C801\D569\D55C \D544\D130 \D45C\D604\C2DD\C785\B2C8\B2E4. %0')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140591918523751805)
,p_name=>'APEXIR_INVALID_FILTER_QUERY'
,p_message_language=>'ko'
,p_message_text=>unistr('\BD80\C801\D569\D55C \D544\D130 \C9C8\C758')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140613362814751811)
,p_name=>'APEXIR_INVALID_SETTING'
,p_message_language=>'ko'
,p_message_text=>unistr('1\AC1C \BD80\C801\D569\D55C \C124\C815')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140613443468751811)
,p_name=>'APEXIR_INVALID_SETTINGS'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\AC1C \BD80\C801\D569\D55C \C124\C815')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140565564997751797)
,p_name=>'APEXIR_IN_MINUTES'
,p_message_language=>'ko'
,p_message_text=>unistr('(\BD84)')
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140582541186751802)
,p_name=>'APEXIR_IS_IN_THE_LAST'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B9C8\C9C0\B9C9 %1 \C774\B0B4\C5D0 \C788\C74C')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140582715896751802)
,p_name=>'APEXIR_IS_IN_THE_NEXT'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C %1 \C774\B0B4\C5D0 \C788\C74C')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140582676790751802)
,p_name=>'APEXIR_IS_NOT_IN_THE_LAST'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B9C8\C9C0\B9C9 %1 \C774\B0B4\C5D0 \C5C6\C74C')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140582874553751802)
,p_name=>'APEXIR_IS_NOT_IN_THE_NEXT'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \B2E4\C74C %1 \C774\B0B4\C5D0 \C5C6\C74C')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140512093025751782)
,p_name=>'APEXIR_KEYPAD'
,p_message_language=>'ko'
,p_message_text=>unistr('\D0A4\D328\B4DC')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140475794121751771)
,p_name=>'APEXIR_LABEL'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \B808\C774\BE14')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140505994735751780)
,p_name=>'APEXIR_LABEL_AXIS_TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\B808\C774\BE14\C5D0 \B300\D55C \CD95 \C81C\BAA9')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140498257006751777)
,p_name=>'APEXIR_LAST_DAY'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD5C\ADFC 1\C77C')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140498420292751777)
,p_name=>'APEXIR_LAST_HOUR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\B09C \C2DC\AC04')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140497978382751777)
,p_name=>'APEXIR_LAST_MONTH'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\B09C \B2EC')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140498003537751777)
,p_name=>'APEXIR_LAST_WEEK'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\B09C \C8FC')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140498156628751777)
,p_name=>'APEXIR_LAST_X_DAYS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\B09C %0\C77C')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140498314501751777)
,p_name=>'APEXIR_LAST_X_HOURS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\B09C %0\C2DC\AC04')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140497708360751777)
,p_name=>'APEXIR_LAST_X_YEARS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\B09C %0\B144')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140497851278751777)
,p_name=>'APEXIR_LAST_YEAR'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD5C\ADFC 1\B144')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140475635698751771)
,p_name=>'APEXIR_LINE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140472485849751770)
,p_name=>'APEXIR_LINE_WITH_AREA'
,p_message_language=>'ko'
,p_message_text=>unistr('\C120\ACFC \C601\C5ED')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140591856234751805)
,p_name=>'APEXIR_MAP_IT'
,p_message_language=>'ko'
,p_message_text=>unistr('\B9E4\D551')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140506842069751780)
,p_name=>'APEXIR_MAX_QUERY_COST'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C8\C758\AC00 \D5C8\C6A9\B41C \CD5C\B300 \B9AC\C18C\C2A4\B97C \CD08\ACFC\D560 \AC83\C73C\B85C \C608\C0C1\B429\B2C8\B2E4. \BCF4\ACE0\C11C \C124\C815\C744 \C218\C815\D558\ACE0 \B2E4\C2DC \C2DC\B3C4\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140488226194751774)
,p_name=>'APEXIR_MAX_ROW_CNT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774 \BCF4\ACE0\C11C\C758 \CD5C\B300 \D589 \C218\B294 %0\AC1C \D589\C785\B2C8\B2E4. \C9C8\C758 \B808\CF54\B4DC \C218\B97C \C904\C774\B824\BA74 \D544\D130\B97C \C801\C6A9\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140592407482751805)
,p_name=>'APEXIR_MAX_X'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD5C\B300\AC12 %0')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140592625054751805)
,p_name=>'APEXIR_MEDIAN_X'
,p_message_language=>'ko'
,p_message_text=>unistr('\C911\AC04\AC12 %0')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140434973754751759)
,p_name=>'APEXIR_MESSAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\BA54\C2DC\C9C0')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140492566701751776)
,p_name=>'APEXIR_MIN_AGO'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\BD84 \C804')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140592507947751805)
,p_name=>'APEXIR_MIN_X'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD5C\C18C\AC12 %0')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140591531557751805)
,p_name=>'APEXIR_MONTH'
,p_message_language=>'ko'
,p_message_text=>unistr('\C6D4')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140565909290751797)
,p_name=>'APEXIR_MONTHLY'
,p_message_language=>'ko'
,p_message_text=>unistr('\C6D4\BCC4')
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140505133454751779)
,p_name=>'APEXIR_MOVE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\B3D9')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140505033730751779)
,p_name=>'APEXIR_MOVE_ALL'
,p_message_language=>'ko'
,p_message_text=>unistr('\BAA8\B450 \C774\B3D9')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140618295241751813)
,p_name=>'APEXIR_MULTIIR_PAGE_REGION_STATIC_ID_REQUIRED'
,p_message_language=>'ko'
,p_message_text=>unistr('\D398\C774\C9C0\C5D0 \C5EC\B7EC \B300\D654\C2DD \BCF4\ACE0\C11C\AC00 \C788\C73C\BBC0\B85C \C601\C5ED \C815\C801 ID\B97C \C9C0\C815\D574\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140471192681751769)
,p_name=>'APEXIR_NAME'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\B984')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140500897173751778)
,p_name=>'APEXIR_NEW_AGGREGATION'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0C8 \C9D1\ACC4')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140614096225751812)
,p_name=>'APEXIR_NEW_CATEGORY_LABEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0C8 \BC94\C8FC')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140500904283751778)
,p_name=>'APEXIR_NEW_COMPUTATION'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0C8 \ACC4\C0B0')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140495671104751777)
,p_name=>'APEXIR_NEXT'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140498710839751778)
,p_name=>'APEXIR_NEXT_DAY'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C \C77C')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140498597618751777)
,p_name=>'APEXIR_NEXT_HOUR'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C \C2DC\AC04')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140499011355751778)
,p_name=>'APEXIR_NEXT_MONTH'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C \C6D4')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140498998506751778)
,p_name=>'APEXIR_NEXT_WEEK'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C \C8FC')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140498802648751778)
,p_name=>'APEXIR_NEXT_X_DAYS'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C %0\C77C')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140498662224751778)
,p_name=>'APEXIR_NEXT_X_HOURS'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C %0\C2DC\AC04')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140499274246751778)
,p_name=>'APEXIR_NEXT_X_YEARS'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C %0\B144')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140499105939751778)
,p_name=>'APEXIR_NEXT_YEAR'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C \C5F0\B3C4')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140471474836751769)
,p_name=>'APEXIR_NO'
,p_message_language=>'ko'
,p_message_text=>unistr('\C544\B2C8\C624')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140514188451751782)
,p_name=>'APEXIR_NONE'
,p_message_language=>'ko'
,p_message_text=>unistr('- \C5C6\C74C -')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140565117108751797)
,p_name=>'APEXIR_NOT_VALID_EMAIL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C801\D569\D55C \C804\C790\BA54\C77C \C8FC\C18C\AC00 \C544\B2D9\B2C8\B2E4.')
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140437276467751759)
,p_name=>'APEXIR_NO_COLUMNS_SELECTED'
,p_message_language=>'ko'
,p_message_text=>unistr('\D45C\C2DC\D558\B3C4\B85D \C120\D0DD\B41C \C5F4\C774 \C5C6\C2B5\B2C8\B2E4. \C791\C5C5 \BA54\B274\C758 <strong>\C5F4</strong>\C744 \C0AC\C6A9\D558\C5EC \C5F4\C774 \D45C\C2DC\B418\B3C4\B85D \C124\C815\D569\B2C8\B2E4.')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140510636414751781)
,p_name=>'APEXIR_NULLS_ALWAYS_FIRST'
,p_message_language=>'ko'
,p_message_text=>unistr('\B110\C774 \D56D\C0C1 \CC98\C74C\C5D0')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140510507863751781)
,p_name=>'APEXIR_NULLS_ALWAYS_LAST'
,p_message_language=>'ko'
,p_message_text=>unistr('\B110\C774 \D56D\C0C1 \B9C8\C9C0\B9C9\C5D0')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140511057037751781)
,p_name=>'APEXIR_NULL_SORTING'
,p_message_language=>'ko'
,p_message_text=>unistr('\B110 \C815\B82C: %0')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140507408016751780)
,p_name=>'APEXIR_NUMERIC_FLASHBACK_TIME'
,p_message_language=>'ko'
,p_message_text=>unistr('\D50C\B798\C2DC\BC31 \C2DC\AC04\C740 \C22B\C790\C5EC\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140507061113751780)
,p_name=>'APEXIR_NUMERIC_SEQUENCE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2DC\D000\C2A4\B294 \C22B\C790\C5EC\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140511524189751781)
,p_name=>'APEXIR_OPERATOR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F0\C0B0\C790')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140470021423751769)
,p_name=>'APEXIR_ORANGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C624\B80C\C9C0\C0C9')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140584029115751803)
,p_name=>'APEXIR_ORIENTATION'
,p_message_language=>'ko'
,p_message_text=>unistr('\BC29\D5A5')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140471929130751770)
,p_name=>'APEXIR_OTHER'
,p_message_language=>'ko'
,p_message_text=>unistr('\AE30\D0C0')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140438161991751760)
,p_name=>'APEXIR_PAGINATION_OF'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C758 \D398\C774\C9C0 \B9E4\AE40')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140452186750751764)
,p_name=>'APEXIR_PDF_ORIENTATION'
,p_message_language=>'ko'
,p_message_text=>unistr('\D398\C774\C9C0 \BC29\D5A5')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140452838882751764)
,p_name=>'APEXIR_PDF_ORIENTATION_HORIZONTAL'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC00\B85C')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140452930190751764)
,p_name=>'APEXIR_PDF_ORIENTATION_VERTICAL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C138\B85C')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140452016509751764)
,p_name=>'APEXIR_PDF_PAGE_SIZE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D398\C774\C9C0 \D06C\AE30')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140452672474751764)
,p_name=>'APEXIR_PDF_PAGE_SIZE_A3'
,p_message_language=>'ko'
,p_message_text=>'A3'
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140452537760751764)
,p_name=>'APEXIR_PDF_PAGE_SIZE_A4'
,p_message_language=>'ko'
,p_message_text=>'A4'
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140452728615751764)
,p_name=>'APEXIR_PDF_PAGE_SIZE_CUSTOM'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AC\C6A9\C790\C815\C758')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140452386056751764)
,p_name=>'APEXIR_PDF_PAGE_SIZE_LEGAL'
,p_message_language=>'ko'
,p_message_text=>'Legal'
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140452245006751764)
,p_name=>'APEXIR_PDF_PAGE_SIZE_LETTER'
,p_message_language=>'ko'
,p_message_text=>'Letter'
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140452434839751764)
,p_name=>'APEXIR_PDF_PAGE_SIZE_TABLOID'
,p_message_language=>'ko'
,p_message_text=>'Tabloid'
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140592985466751805)
,p_name=>'APEXIR_PERCENT_OF_TOTAL_COUNT_X'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C5D0 \B300\D55C \CD1D \AC1C\C218 \BE44\C728(%)')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140592108528751805)
,p_name=>'APEXIR_PERCENT_OF_TOTAL_SUM_X'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C5D0 \B300\D55C \CD1D\ACC4 \BE44\C728(%)')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140591166591751805)
,p_name=>'APEXIR_PERCENT_TOTAL_COUNT'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD1D \AC1C\C218 \BE44\C728')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140591046266751805)
,p_name=>'APEXIR_PERCENT_TOTAL_SUM'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD1D\ACC4 \BE44\C728')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140475571967751771)
,p_name=>'APEXIR_PIE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D30C\C774')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140541280242751790)
,p_name=>'APEXIR_PIVOT'
,p_message_language=>'ko'
,p_message_text=>unistr('\D53C\BC97')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140542762337751791)
,p_name=>'APEXIR_PIVOT_AGG_NOT_NULL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9D1\ACC4\B97C \C9C0\C815\D574\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140542985866751791)
,p_name=>'APEXIR_PIVOT_AGG_NOT_ON_ROW_COL'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589 \C5F4\B85C \C120\D0DD\B41C \C5F4\C5D0\C11C\B294 \C9D1\ACC4\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140542166033751790)
,p_name=>'APEXIR_PIVOT_COLUMNS'
,p_message_language=>'ko'
,p_message_text=>unistr('\D53C\BC97 \C5F4')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140541945132751790)
,p_name=>'APEXIR_PIVOT_COLUMN_N'
,p_message_language=>'ko'
,p_message_text=>unistr('\D53C\BC97 \C5F4 %0')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140542500760751791)
,p_name=>'APEXIR_PIVOT_COLUMN_NOT_NULL'
,p_message_language=>'ko'
,p_message_text=>unistr('\D53C\BC97 \C5F4\C744 \C9C0\C815\D574\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140395020547751747)
,p_name=>'APEXIR_PIVOT_MAX_ROW_CNT'
,p_message_language=>'ko'
,p_message_text=>unistr('\D53C\BC97 \C9C8\C758\C5D0 \B300\D55C \CD5C\B300 \D589 \C218\B294 \D45C\C2DC\B418\B294 \D589 \C218\AC00 \C544\B2CC \AE30\BCF8 \C9C8\C758\C758 \D589 \C218\B97C \C81C\D55C\D569\B2C8\B2E4. \AE30\BCF8 \C9C8\C758\AC00 \CD5C\B300 \D589 \C218 %0\AC1C\B97C \CD08\ACFC\D569\B2C8\B2E4. \AE30\BCF8 \C9C8\C758\C758 \B808\CF54\B4DC \C218\B97C \C904\C774\B824\BA74 \D544\D130\B97C \C801\C6A9\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705111
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140542403381751790)
,p_name=>'APEXIR_PIVOT_SORT'
,p_message_language=>'ko'
,p_message_text=>unistr('\D53C\BC97 \C815\B82C')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140508420372751780)
,p_name=>'APEXIR_PIVOT_TOO_MANY_VALUES'
,p_message_language=>'ko'
,p_message_text=>unistr('\D53C\BC97 \C5F4\C5D0 \ACE0\C720 \AC12\C774 \B108\BB34 \B9CE\C774 \D3EC\D568\B418\C5B4 \C788\C2B5\B2C8\B2E4. \D53C\BC97 SQL\C744 \C0DD\C131\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140439478584751760)
,p_name=>'APEXIR_PIVOT_VIEW_OF'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C758 \D53C\BC97 \BCF4\AE30')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140565262226751797)
,p_name=>'APEXIR_PREVIEW'
,p_message_language=>'ko'
,p_message_text=>unistr('\BBF8\B9AC\BCF4\AE30')
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140495705556751777)
,p_name=>'APEXIR_PREVIOUS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\C804')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140590094639751804)
,p_name=>'APEXIR_PRIMARY'
,p_message_language=>'ko'
,p_message_text=>unistr('\AE30\BCF8')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140566278017751797)
,p_name=>'APEXIR_PRIMARY_REPORT'
,p_message_language=>'ko'
,p_message_text=>unistr('\AE30\BCF8 \BCF4\ACE0\C11C')
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140451948139751764)
,p_name=>'APEXIR_PRINT_ACCESSIBLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C811\ADFC\C131 \D0DC\ADF8 \D3EC\D568')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140412778546751752)
,p_name=>'APEXIR_PRINT_STRIP_RICH_TEXT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C11C\C2DD \C788\B294 \D14D\C2A4\D2B8 \C81C\AC70')
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140521126072751784)
,p_name=>'APEXIR_PRIVATE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D504\B77C\C774\BE57')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140476110954751771)
,p_name=>'APEXIR_PUBLIC'
,p_message_language=>'ko'
,p_message_text=>unistr('\D37C\BE14\B9AD')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140471774952751770)
,p_name=>'APEXIR_RED'
,p_message_language=>'ko'
,p_message_text=>unistr('\BE68\AC04\C0C9')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140618123140751813)
,p_name=>'APEXIR_REGION_STATIC_ID_DOES_NOT_EXIST'
,p_message_language=>'ko'
,p_message_text=>unistr('\C601\C5ED \C815\C801 ID %0\C774(\AC00) \C874\C7AC\D558\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140505254858751780)
,p_name=>'APEXIR_REMOVE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C81C\AC70')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140505337562751780)
,p_name=>'APEXIR_REMOVE_ALL'
,p_message_language=>'ko'
,p_message_text=>unistr('\BAA8\B450 \C81C\AC70')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140613591093751811)
,p_name=>'APEXIR_REMOVE_CHART'
,p_message_language=>'ko'
,p_message_text=>unistr('\CC28\D2B8 \C81C\AC70')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140504864034751779)
,p_name=>'APEXIR_REMOVE_CONTROL_BREAK'
,p_message_language=>'ko'
,p_message_text=>unistr('\C81C\C5B4 \CC28\B2E8 \C81C\AC70')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140504514266751779)
,p_name=>'APEXIR_REMOVE_FILTER'
,p_message_language=>'ko'
,p_message_text=>unistr('\D544\D130 \C81C\AC70')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140504624931751779)
,p_name=>'APEXIR_REMOVE_FLASHBACK'
,p_message_language=>'ko'
,p_message_text=>unistr('\D50C\B798\C2DC\BC31 \C81C\AC70')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140613676736751811)
,p_name=>'APEXIR_REMOVE_GROUP_BY'
,p_message_language=>'ko'
,p_message_text=>unistr('\ADF8\B8F9 \AE30\C900 \C81C\AC70')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140504978069751779)
,p_name=>'APEXIR_REMOVE_HIGHLIGHT'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC15\C870 \D45C\C2DC \C81C\AC70')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140613734020751811)
,p_name=>'APEXIR_REMOVE_PIVOT'
,p_message_language=>'ko'
,p_message_text=>unistr('\D53C\BC97 \C81C\AC70')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140594865690751806)
,p_name=>'APEXIR_REMOVE_REPORT'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\ACE0\C11C \C81C\AC70')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140576680908751801)
,p_name=>'APEXIR_RENAME_DEFAULT_REPORT'
,p_message_language=>'ko'
,p_message_text=>unistr('\AE30\BCF8 \BCF4\ACE0\C11C \C774\B984 \BC14\AFB8\AE30')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140514485991751782)
,p_name=>'APEXIR_RENAME_REPORT'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\ACE0\C11C \C774\B984 \BC14\AFB8\AE30')
,p_is_js_message=>true
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140496062577751777)
,p_name=>'APEXIR_REPORT'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\ACE0\C11C')
,p_is_js_message=>true
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140593079401751805)
,p_name=>'APEXIR_REPORTS'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\ACE0\C11C')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140468224327751768)
,p_name=>'APEXIR_REPORT_ALIAS_DOES_NOT_EXIST'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \BCC4\CE6D\ACFC \D568\AED8 \C800\C7A5\B41C \B300\D654\C2DD \BCF4\ACE0\C11C\AC00 \C874\C7AC\D558\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140521426437751784)
,p_name=>'APEXIR_REPORT_DOES_NOT_EXIST'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\ACE0\C11C\AC00 \C874\C7AC\D558\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140468330441751769)
,p_name=>'APEXIR_REPORT_ID_DOES_NOT_EXIST'
,p_message_language=>'ko'
,p_message_text=>unistr('\C800\C7A5\B41C \B300\D654\C2DD \BCF4\ACE0\C11C ID %0\C774(\AC00) \C874\C7AC\D558\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140512708075751782)
,p_name=>'APEXIR_REPORT_SETTINGS'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\ACE0\C11C \C124\C815')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140436901667751759)
,p_name=>'APEXIR_REPORT_SETTINGS_OF'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C758 \BCF4\ACE0\C11C \C124\C815')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140493063965751776)
,p_name=>'APEXIR_REPORT_VIEW'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\ACE0\C11C \BCF4\AE30')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140497217867751777)
,p_name=>'APEXIR_RESET'
,p_message_language=>'ko'
,p_message_text=>unistr('\C7AC\C124\C815')
,p_is_js_message=>true
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140476399966751771)
,p_name=>'APEXIR_RESET_CONFIRM'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\ACE0\C11C\B97C \AE30\BCF8 \C124\C815\C73C\B85C \BCF5\C6D0\D569\B2C8\B2E4.')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140471544854751769)
,p_name=>'APEXIR_ROW'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140589153240751804)
,p_name=>'APEXIR_ROWID_NOT_SUPPORTED_FOR_WEBSOURCE'
,p_message_language=>'ko'
,p_message_text=>unistr('REST \B370\C774\D130 \C18C\C2A4\C5D0 \B300\D55C \AE30\BCF8 \D0A4 \C5F4\B85C ROWID\B97C \C0AC\C6A9\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140503929243751779)
,p_name=>'APEXIR_ROWS'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140566913611751798)
,p_name=>'APEXIR_ROWS_PER_PAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D398\C774\C9C0\B2F9 \D589')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140542285011751790)
,p_name=>'APEXIR_ROW_COLUMNS'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589 \C5F4')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140542079214751790)
,p_name=>'APEXIR_ROW_COLUMN_N'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589 \C5F4 %0')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140542609150751791)
,p_name=>'APEXIR_ROW_COLUMN_NOT_NULL'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589 \C5F4\C744 \C9C0\C815\D574\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140542856695751791)
,p_name=>'APEXIR_ROW_COL_DIFF_FROM_PIVOT_COL'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589 \C5F4\C740 \D53C\BC97 \C5F4\ACFC \B2EC\B77C\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140518467977751783)
,p_name=>'APEXIR_ROW_FILTER'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589 \D544\D130')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140493186374751776)
,p_name=>'APEXIR_ROW_OF'
,p_message_language=>'ko'
,p_message_text=>unistr('%0/%1 \D589')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140497419564751777)
,p_name=>'APEXIR_ROW_TEXT_CONTAINS'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589 \D14D\C2A4\D2B8\AC00 \B2E4\C74C\C744 \D3EC\D568')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140470804431751769)
,p_name=>'APEXIR_SAVE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C800\C7A5')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140508048724751780)
,p_name=>'APEXIR_SAVED_REPORT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C800\C7A5\B41C \BCF4\ACE0\C11C')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140507917407751780)
,p_name=>'APEXIR_SAVED_REPORT_MSG'
,p_message_language=>'ko'
,p_message_text=>unistr('\C800\C7A5\B41C \BCF4\ACE0\C11C = "%0"')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140510107071751781)
,p_name=>'APEXIR_SAVE_DEFAULT_CONFIRM'
,p_message_language=>'ko'
,p_message_text=>unistr('\D604\C7AC \BCF4\ACE0\C11C \C124\C815\C774 \BAA8\B4E0 \C0AC\C6A9\C790\C5D0 \B300\D55C \AE30\BCF8\AC12\C73C\B85C \C0AC\C6A9\B429\B2C8\B2E4.')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140576546703751801)
,p_name=>'APEXIR_SAVE_DEFAULT_REPORT'
,p_message_language=>'ko'
,p_message_text=>unistr('\AE30\BCF8 \BCF4\ACE0\C11C \C800\C7A5')
,p_is_js_message=>true
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140497156385751777)
,p_name=>'APEXIR_SAVE_REPORT'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\ACE0\C11C \C800\C7A5')
,p_is_js_message=>true
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140613903939751812)
,p_name=>'APEXIR_SAVE_REPORT_DEFAULT'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\ACE0\C11C \C800\C7A5 *')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140567991708751798)
,p_name=>'APEXIR_SEARCH'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC80\C0C9')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140502884418751779)
,p_name=>'APEXIR_SEARCH_BAR'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC80\C0C9 \B3C4\AD6C \BAA8\C74C')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140436259541751759)
,p_name=>'APEXIR_SEARCH_BAR_OF'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C758 \AC80\C0C9 \B3C4\AD6C \BAA8\C74C')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140613868188751812)
,p_name=>'APEXIR_SEARCH_COLUMN'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC80\C0C9: %0')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140573416615751800)
,p_name=>'APEXIR_SEARCH_REPORT'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC80\C0C9 \BCF4\ACE0\C11C')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140557403047751795)
,p_name=>'APEXIR_SELECTED_COLUMNS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C120\D0DD\D55C \C5F4')
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140472501527751770)
,p_name=>'APEXIR_SELECT_COLUMN'
,p_message_language=>'ko'
,p_message_text=>unistr('- \C5F4 \C120\D0DD -')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140496452123751777)
,p_name=>'APEXIR_SELECT_COLUMNS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F4 \C120\D0DD')
,p_is_js_message=>true
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140476021103751771)
,p_name=>'APEXIR_SELECT_FUNCTION'
,p_message_language=>'ko'
,p_message_text=>unistr('- \D568\C218 \C120\D0DD -')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140503635836751779)
,p_name=>'APEXIR_SELECT_GROUP_BY_COLUMN'
,p_message_language=>'ko'
,p_message_text=>unistr('- \ADF8\B8F9 \AE30\C900 \C5F4 \C120\D0DD -')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140541720220751790)
,p_name=>'APEXIR_SELECT_PIVOT_COLUMN'
,p_message_language=>'ko'
,p_message_text=>unistr('- \D53C\BC97 \C5F4 \C120\D0DD -')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140592095551751805)
,p_name=>'APEXIR_SELECT_ROW'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589 \C120\D0DD')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140541813820751790)
,p_name=>'APEXIR_SELECT_ROW_COLUMN'
,p_message_language=>'ko'
,p_message_text=>unistr('- \D53C\BC97 \D589 \C120\D0DD -')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140423312093751755)
,p_name=>'APEXIR_SEND'
,p_message_language=>'ko'
,p_message_text=>unistr('\C804\C1A1')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140445808497751762)
,p_name=>'APEXIR_SEND_AS_EMAIL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C804\C790\BA54\C77C\B85C \C804\C1A1')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140471237370751769)
,p_name=>'APEXIR_SEQUENCE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2DC\D000\C2A4')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140496680076751777)
,p_name=>'APEXIR_SORT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C815\B82C')
,p_is_js_message=>true
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140506109162751780)
,p_name=>'APEXIR_SORT_ASCENDING'
,p_message_language=>'ko'
,p_message_text=>unistr('\C624\B984\CC28\C21C \C815\B82C')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140506293356751780)
,p_name=>'APEXIR_SORT_DESCENDING'
,p_message_language=>'ko'
,p_message_text=>unistr('\B0B4\B9BC\CC28\C21C \C815\B82C')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140594217993751806)
,p_name=>'APEXIR_SORT_ORDER'
,p_message_language=>'ko'
,p_message_text=>unistr('\C815\B82C \C21C\C11C')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140500511665751778)
,p_name=>'APEXIR_SPACE_AS_IN_ONE_EMPTY_STRING'
,p_message_language=>'ko'
,p_message_text=>unistr('\ACF5\BC31')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140511751474751781)
,p_name=>'APEXIR_STATUS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0C1\D0DC: %0')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140565689186751797)
,p_name=>'APEXIR_SUBSCRIPTION'
,p_message_language=>'ko'
,p_message_text=>unistr('\C801\C6A9')
,p_is_js_message=>true
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140591436143751805)
,p_name=>'APEXIR_SUBSCRIPTION_ENDING'
,p_message_language=>'ko'
,p_message_text=>unistr('\C885\B8CC')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140410457440751751)
,p_name=>'APEXIR_SUBSCRIPTION_SKIP_IF_NDF'
,p_message_language=>'ko'
,p_message_text=>unistr('\B370\C774\D130\B97C \CC3E\C744 \C218 \C5C6\B294 \ACBD\C6B0 \AC74\B108\B6F0\AE30')
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140591310007751805)
,p_name=>'APEXIR_SUBSCRIPTION_STARTING_FROM'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2DC\C791:')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140592205907751805)
,p_name=>'APEXIR_SUM_X'
,p_message_language=>'ko'
,p_message_text=>unistr('\D569\ACC4 %0')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140583123074751802)
,p_name=>'APEXIR_TABLE_SUMMARY'
,p_message_language=>'ko'
,p_message_text=>unistr('%0, \BCF4\ACE0\C11C = %1, \BDF0 = %2')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140470173289751769)
,p_name=>'APEXIR_TEXT_COLOR'
,p_message_language=>'ko'
,p_message_text=>unistr('\D14D\C2A4\D2B8 \C0C9\C0C1')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140488877868751775)
,p_name=>'APEXIR_TIME_DAYS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C77C')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140488726383751775)
,p_name=>'APEXIR_TIME_HOURS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2DC\AC04')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140488686170751775)
,p_name=>'APEXIR_TIME_MINS'
,p_message_language=>'ko'
,p_message_text=>unistr('\BD84')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140489082706751775)
,p_name=>'APEXIR_TIME_MONTHS'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC1C\C6D4')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140488907416751775)
,p_name=>'APEXIR_TIME_WEEKS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C8FC')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140489122509751775)
,p_name=>'APEXIR_TIME_YEARS'
,p_message_language=>'ko'
,p_message_text=>unistr('\B144')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140594685939751806)
,p_name=>'APEXIR_TOGGLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D1A0\AE00')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140505476771751780)
,p_name=>'APEXIR_TOP'
,p_message_language=>'ko'
,p_message_text=>unistr('\B9E8 \C704\B85C')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140588197274751804)
,p_name=>'APEXIR_UNGROUPED_COLUMN'
,p_message_language=>'ko'
,p_message_text=>unistr('\ADF8\B8F9\D654\B418\C9C0 \C54A\C740 \C5F4')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140506971998751780)
,p_name=>'APEXIR_UNIQUE_HIGHLIGHT_NAME'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC15\C870 \D45C\C2DC \C774\B984\C740 \ACE0\C720\D574\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140474826697751770)
,p_name=>'APEXIR_UNSUPPORTED_DATA_TYPE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\C6D0\B418\C9C0 \C54A\B294 \B370\C774\D130 \C720\D615')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140505574554751780)
,p_name=>'APEXIR_UP'
,p_message_language=>'ko'
,p_message_text=>unistr('\C704\B85C')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140507158993751780)
,p_name=>'APEXIR_VALID_COLOR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C801\D569\D55C \C0C9\C0C1\C744 \C785\B825\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140507203812751780)
,p_name=>'APEXIR_VALID_FORMAT_MASK'
,p_message_language=>'ko'
,p_message_text=>unistr('\C801\D569\D55C \D615\C2DD \B9C8\C2A4\D06C\B97C \C785\B825\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140472041223751770)
,p_name=>'APEXIR_VALUE'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC12')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140506051629751780)
,p_name=>'APEXIR_VALUE_AXIS_TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC12\C5D0 \B300\D55C \CD95 \C81C\BAA9')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140513891368751782)
,p_name=>'APEXIR_VALUE_REQUIRED'
,p_message_language=>'ko'
,p_message_text=>unistr('\D544\C218 \AC12')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140475461813751771)
,p_name=>'APEXIR_VCOLUMN'
,p_message_language=>'ko'
,p_message_text=>unistr('\C218\C9C1 \B9C9\B300')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140584239640751803)
,p_name=>'APEXIR_VERTICAL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C138\B85C')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140513162999751782)
,p_name=>'APEXIR_VIEW_CHART'
,p_message_language=>'ko'
,p_message_text=>unistr('\CC28\D2B8 \BCF4\AE30')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140571764501751799)
,p_name=>'APEXIR_VIEW_DETAIL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C138\BD80\C815\BCF4 \BCF4\AE30')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140616049821751812)
,p_name=>'APEXIR_VIEW_DOES_NOT_EXIST'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\ACE0\C11C\C5D0 %0 \BCF4\AE30\AC00 \C815\C758\B418\C5B4 \C788\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140571833497751799)
,p_name=>'APEXIR_VIEW_GROUP_BY'
,p_message_language=>'ko'
,p_message_text=>unistr('\ADF8\B8F9 \AE30\C900 \BCF4\AE30')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140571673642751799)
,p_name=>'APEXIR_VIEW_ICONS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C544\C774\CF58 \BCF4\AE30')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140541526885751790)
,p_name=>'APEXIR_VIEW_PIVOT'
,p_message_language=>'ko'
,p_message_text=>unistr('\D53C\BC97 \BCF4\AE30')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140513235832751782)
,p_name=>'APEXIR_VIEW_REPORT'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\ACE0\C11C \BCF4\AE30')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140565811962751797)
,p_name=>'APEXIR_WEEKLY'
,p_message_language=>'ko'
,p_message_text=>unistr('\C8FC\BCC4')
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140495977502751777)
,p_name=>'APEXIR_WORKING_REPORT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C791\C5C5 \BCF4\ACE0\C11C')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140593680550751806)
,p_name=>'APEXIR_X_DAYS'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C77C')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140593599179751806)
,p_name=>'APEXIR_X_HOURS'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C2DC\AC04')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140593477070751805)
,p_name=>'APEXIR_X_MINS'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\BD84')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140593894752751806)
,p_name=>'APEXIR_X_MONTHS'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\AC1C\C6D4')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140593733840751806)
,p_name=>'APEXIR_X_WEEKS'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C8FC')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140593908620751806)
,p_name=>'APEXIR_X_YEARS'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\B144')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140591647854751805)
,p_name=>'APEXIR_YEAR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F0\B3C4')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140469811014751769)
,p_name=>'APEXIR_YELLOW'
,p_message_language=>'ko'
,p_message_text=>unistr('\B178\B780\C0C9')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140471367725751769)
,p_name=>'APEXIR_YES'
,p_message_language=>'ko'
,p_message_text=>unistr('\C608')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140505847105751780)
,p_name=>'APEX_GROUP.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C5D0 \BD80\C801\D569\D55C \BB38\C790\C778 < \B610\B294 >\AC00 \D3EC\D568\B418\C5B4 \C788\C2B5\B2C8\B2E4.')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140529749856751787)
,p_name=>'APEX_REGION'
,p_message_language=>'ko'
,p_message_text=>unistr('\C601\C5ED')
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140420861267751754)
,p_name=>'APEX_ZIP.EXTRACT_FAILED'
,p_message_language=>'ko'
,p_message_text=>unistr('ZIP \D30C\C77C\C758 \C555\CD95\C744 \D480 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140420741250751754)
,p_name=>'APEX_ZIP.INVALID_ZIPFILE'
,p_message_language=>'ko'
,p_message_text=>unistr('End-of-central-directory \C11C\BA85\C744 \CC3E\C744 \C218 \C5C6\C2B5\B2C8\B2E4. \C774 \D30C\C77C\C740 ZIP \D30C\C77C\C774 \C544\B2D9\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140451881679751764)
,p_name=>'API_PRECONDITION_VIOLATED'
,p_message_language=>'ko'
,p_message_text=>unistr('API \C0AC\C804 \C870\AC74 \C704\BC18')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140473967611751770)
,p_name=>'APP.SETTING.CANNOT.GET'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F0\AD00\B41C \BE4C\B4DC \C635\C158\C774 \C0AC\C6A9 \C548\D568\C73C\B85C \C124\C815\B418\C5C8\C73C\BBC0\B85C \C560\D50C\B9AC\CF00\C774\C158 \C124\C815 %0\C5D0 \B300\D55C \AC12\C744 \AC00\C838\C62C \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140473819510751770)
,p_name=>'APP.SETTING.CANNOT.SET'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F0\AD00\B41C \BE4C\B4DC \C635\C158\C774 \C0AC\C6A9 \C548\D568\C73C\B85C \C124\C815\B418\C5C8\C73C\BBC0\B85C \C560\D50C\B9AC\CF00\C774\C158 \C124\C815 %0\C5D0 \B300\D55C \AC12\C744 \C124\C815\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140586487610751803)
,p_name=>'APP.SETTING.INVALID.VALUE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C560\D50C\B9AC\CF00\C774\C158 \C124\C815 %0 \AC12\C774 \BD80\C801\D569\D569\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140586375130751803)
,p_name=>'APP.SETTING.NOT.DEFINED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C694\CCAD\B41C \C560\D50C\B9AC\CF00\C774\C158 \C124\C815 %0\C774(\AC00) \C815\C758\B418\C9C0 \C54A\C558\C2B5\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140586564565751803)
,p_name=>'APP.SETTING.VALUE.NOT.NULL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C560\D50C\B9AC\CF00\C774\C158 \C124\C815 %0\C744(\B97C) \B110 \AC12\C73C\B85C \C124\C815\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140460491632751766)
,p_name=>'BACK'
,p_message_language=>'ko'
,p_message_text=>unistr('\B4A4\B85C')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140442874301751761)
,p_name=>'BUILDER'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0DD\C131\AE30')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140516444373751783)
,p_name=>'BUTTON LABEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E8\CD94 \B808\C774\BE14')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140439722155751760)
,p_name=>'BUTTON_CSS_CLASSES'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E8\CD94 CSS \D074\B798\C2A4')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140478210658751771)
,p_name=>'BUTTON_ID'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0DD\C131\B41C \B2E8\CD94 ID\B294 \C815\C758\B41C \ACBD\C6B0 \B2E8\CD94\C758 \C815\C801 ID\AC00 \B418\BA70, \C815\C758\B418\C9C0 \C54A\C740 \ACBD\C6B0 ''B'' || [Internal Button ID] \D615\C2DD\C758 \B0B4\BD80\C801\C73C\B85C \C0DD\C131\B41C ID\AC00 \B429\B2C8\B2E4.')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140412253850751752)
,p_name=>'CANDLESTICK'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD1B\B300')
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140526266422751786)
,p_name=>'CENTER'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC00\C6B4\B370')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140472866609751770)
,p_name=>'CHANGE_PW_REQUEST'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C694\CCAD')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140462869620751767)
,p_name=>'CHECK$'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589 \C120\D0DD\AE30')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140588297173751804)
,p_name=>'CHECKED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C120\D0DD\B428')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140564626448751797)
,p_name=>'COLUMN'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F4')
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140522203025751785)
,p_name=>'COMMENTS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C124\BA85')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140503278013751779)
,p_name=>'CONTINUE'
,p_message_language=>'ko'
,p_message_text=>unistr('\ACC4\C18D')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140460782445751766)
,p_name=>'COPYRIGHT'
,p_message_language=>'ko'
,p_message_text=>'Copyright &copy; 1999, %0, Oracle and/or its affiliates.'
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140508992328751781)
,p_name=>'COUNT'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC1C\C218')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140515956512751783)
,p_name=>'CREATE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0DD\C131')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140571378442751799)
,p_name=>'CREATED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0DD\C131\B428')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140571440241751799)
,p_name=>'CREATED_BY'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0DD\C131\C790')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140492393571751776)
,p_name=>'CREATED_ON'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0DD\C131 \B0A0\C9DC')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140503498143751779)
,p_name=>'CUSTOM'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AC\C6A9\C790\C815\C758')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140514614582751782)
,p_name=>'CUSTOMIZE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AC\C6A9\C790\C815\C758')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140516629077751783)
,p_name=>'CUSTOMIZE.USER_PAGE_PREFS_RESET'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C0AC\C6A9\C790\C5D0 \B300\D574 \D398\C774\C9C0 \D658\ACBD\C124\C815\C774 \C7AC\C124\C815\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140516700358751783)
,p_name=>'CUSTOMIZE.USER_PREFS_CHANGED'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C0AC\C6A9\C790\C5D0 \B300\D574 \D658\ACBD\C124\C815\C774 \BCC0\ACBD\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140516593151751783)
,p_name=>'CUSTOMIZE.USER_PREFS_RESET'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C0AC\C6A9\C790\C5D0 \B300\D574 \D398\C774\C9C0 \D658\ACBD\C124\C815\C774 \C7AC\C124\C815\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140477691099751771)
,p_name=>'DAILY'
,p_message_language=>'ko'
,p_message_text=>unistr('\C77C\BCC4')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140441007117751760)
,p_name=>'DATA.LOAD.INVALID_FILE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5C5\B85C\B4DC\B41C \D30C\C77C\C774 \BD80\C801\D569\D558\AC70\B098 \C798\BABB\B41C \D655\C7A5\C790\B97C \AC00\C9D1\B2C8\B2E4.')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140473065268751770)
,p_name=>'DATA.LOAD.INVALID_SELECTOR'
,p_message_language=>'ko'
,p_message_text=>unistr('\BD80\C801\D569\D55C XML \B610\B294 JSON \C120\D0DD\AE30\AC00 \C0AC\C6A9\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140418148533751754)
,p_name=>'DATA.LOAD.NO_COMMON_COLUMNS'
,p_message_language=>'ko'
,p_message_text=>unistr('\B370\C774\D130 \D504\B85C\D30C\C77C \BC0F \C5C5\B85C\B4DC\B41C \D30C\C77C\C5D0\B294 \B300\C0C1 \D14C\C774\BE14 \C5F4\C774 \D3EC\D568\B418\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140532025998751787)
,p_name=>'DATA.LOAD.NO_FILE_CONTENTS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5C5\B85C\B4DC\B41C \D30C\C77C\C5D0\C11C \B370\C774\D130\B97C \CC3E\C744 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140532137307751787)
,p_name=>'DATA.LOAD.NO_WORKSHEET_CONTENTS'
,p_message_language=>'ko'
,p_message_text=>unistr('"%0" \C6CC\D06C\C2DC\D2B8\C5D0\C11C \B370\C774\D130\B97C \CC3E\C744 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140437956614751760)
,p_name=>'DATA.LOAD.NO_XLSX_FILE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\C815\B41C \D30C\C77C\C740 XLSX \D30C\C77C\C774 \C544\B2D9\B2C8\B2E4.')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140403955416751749)
,p_name=>'DATA.LOAD.ROWS_PROCESSED'
,p_message_language=>'ko'
,p_message_text=>unistr('\B370\C774\D130 \B85C\B4DC \C644\B8CC\B428: %0\AC1C \D589\C774 \CC98\B9AC\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140406242326751750)
,p_name=>'DATA.LOAD.ROWS_PROCESSED_W_ERROR_ROW'
,p_message_language=>'ko'
,p_message_text=>unistr('\B370\C774\D130 \B85C\B4DC \C644\B8CC\B428: 1\AC1C \C624\B958\C640 \D568\AED8 %0\AC1C \D589\C774 \CC98\B9AC\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140406547530751750)
,p_name=>'DATA.LOAD.ROWS_PROCESSED_W_ERROR_ROWS'
,p_message_language=>'ko'
,p_message_text=>unistr('\B370\C774\D130 \B85C\B4DC \C644\B8CC\B428: %1\AC1C \C624\B958\C640 \D568\AED8 %0\AC1C \D589\C774 \CC98\B9AC\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140406304779751750)
,p_name=>'DATA.LOAD.ROW_PROCESSED'
,p_message_language=>'ko'
,p_message_text=>unistr('\B370\C774\D130 \B85C\B4DC \C644\B8CC\B428: 1\AC1C \D589\C774 \CC98\B9AC\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140420622806751754)
,p_name=>'DATA.LOAD.ROW_PROCESSED_W_ERROR_ROW'
,p_message_language=>'ko'
,p_message_text=>unistr('\B370\C774\D130 \B85C\B4DC \C644\B8CC\B428: \C624\B958\C640 \D568\AED8 1\AC1C \D589\C774 \CC98\B9AC\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140406472252751750)
,p_name=>'DATA.LOAD.ROW_PROCESSED_W_ERROR_ROWS'
,p_message_language=>'ko'
,p_message_text=>unistr('\B370\C774\D130 \B85C\B4DC \C644\B8CC\B428: \C624\B958 \C5C6\C774 1\AC1C \D589\C774 \CC98\B9AC\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140539146886751790)
,p_name=>'DATA_LOAD.COLUMN_NAMES_MAPPING'
,p_message_language=>'ko'
,p_message_text=>unistr('\B300\C0C1 \C5F4')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140446381722751762)
,p_name=>'DATA_LOAD.DO_NOT_LOAD'
,p_message_language=>'ko'
,p_message_text=>unistr('\B85C\B4DC \C548\D568')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140446488779751762)
,p_name=>'DATA_LOAD.FAILED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C120\D589 \CC98\B9AC \C624\B958')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140539291491751790)
,p_name=>'DATA_LOAD.FIRST_COLUMN_NAMES'
,p_message_language=>'ko'
,p_message_text=>unistr('\C18C\C2A4 \C5F4')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140540068260751790)
,p_name=>'DATA_LOAD.FORMAT'
,p_message_language=>'ko'
,p_message_text=>unistr('\B0A0\C9DC/\C22B\C790 \D615\C2DD')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140446156540751762)
,p_name=>'DATA_LOAD.INSERT'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589 \C0BD\C785')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140602248271751808)
,p_name=>'DATA_LOAD.LOOKUP_FAILED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C870\D68C \AC12 \AC80\C0C9\C744 \C2E4\D328\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140571974933751799)
,p_name=>'DATA_LOAD.MAPPING'
,p_message_language=>'ko'
,p_message_text=>unistr('\B370\C774\D130/\D14C\C774\BE14 \B9E4\D551')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140540181217751790)
,p_name=>'DATA_LOAD.ROW'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140446540057751762)
,p_name=>'DATA_LOAD.SEQUENCE_ACTION'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2DC\D000\C2A4: \C791\C5C5')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140533838459751788)
,p_name=>'DATA_LOAD.TRANSFORMATION_FAILED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2E4\D328\D55C \BCC0\D658 \ADDC\CE59\C785\B2C8\B2E4.')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140446272006751762)
,p_name=>'DATA_LOAD.UPDATE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589 \C5C5\B370\C774\D2B8')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140508561125751780)
,p_name=>'DATE'
,p_message_language=>'ko'
,p_message_text=>unistr('\B0A0\C9DC')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140481409262751772)
,p_name=>'DAY'
,p_message_language=>'ko'
,p_message_text=>unistr('\C77C')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140481580486751772)
,p_name=>'DAYS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C77C')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140521970699751784)
,p_name=>'DEBUGGING_OFF'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774 \C560\D50C\B9AC\CF00\C774\C158\C5D0 \B300\D55C \B514\BC84\AE45\C774 \C0AC\C6A9\C73C\B85C \C124\C815\B418\C9C0 \C54A\C558\C2B5\B2C8\B2E4.')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140573681296751800)
,p_name=>'DEFAULT'
,p_message_language=>'ko'
,p_message_text=>unistr('\AE30\BCF8\AC12')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140482280692751773)
,p_name=>'DELETE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AD\C81C')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140457852899751765)
,p_name=>'DELETE_MSG'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774 \C0AD\C81C \C791\C5C5\C744 \C218\D589\D558\ACA0\C2B5\B2C8\AE4C?')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140437458354751759)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES'
,p_message_language=>'ko'
,p_message_text=>unistr('\C138\C158 \C6B0\C120 \C801\C6A9')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140438313384751760)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ENABLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C138\C158 \C6B0\C120 \C801\C6A9 \C0AC\C6A9')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140439259467751760)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ERROR_LOAD'
,p_message_language=>'ko'
,p_message_text=>unistr('\C138\C158 \C6B0\C120 \C801\C6A9\C744 \B85C\B4DC\D560 \B54C \C624\B958\AC00 \BC1C\C0DD\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140439010761751760)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ERROR_SAVE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C138\C158 \C6B0\C120 \C801\C6A9\C744 \C800\C7A5\D560 \B54C \C624\B958\AC00 \BC1C\C0DD\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140438963964751760)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_SAVED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C138\C158 \C6B0\C120 \C801\C6A9\C774 \C800\C7A5\B418\C5C8\C2B5\B2C8\B2E4. \BCC0\ACBD\C0AC\D56D\C744 \BCF4\B824\BA74 \C774 \B300\D654\C0C1\C790\B97C \B2EB\C73C\C2ED\C2DC\C624.')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140412104788751752)
,p_name=>'DIAL_PCT'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C774\C5BC(\D37C\C13C\D2B8)')
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140453153370751764)
,p_name=>'DOWNLOAD'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C6B4\B85C\B4DC')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140572756002751799)
,p_name=>'DUP_USER'
,p_message_language=>'ko'
,p_message_text=>unistr('\BAA9\B85D \B0B4\C5D0\C11C \C0AC\C6A9\C790 \C774\B984\C774 \C911\BCF5\B429\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140461509819751767)
,p_name=>'EDIT'
,p_message_language=>'ko'
,p_message_text=>unistr('\D3B8\C9D1')
,p_is_js_message=>true
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140472758491751770)
,p_name=>'EMAIL_NOT_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('\C804\C790\BA54\C77C \C8FC\C18C "%0"\C744(\B97C) \CC3E\C744 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140455449083751765)
,p_name=>'EMAIL_SENT_BY'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774 \C804\C790\BA54\C77C\C740 %0\C774(\AC00) \BCF4\B0C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140572932423751799)
,p_name=>'EMAIL_TOO_LONG'
,p_message_language=>'ko'
,p_message_text=>unistr('\C804\C790\BA54\C77C \C8FC\C18C\AC00 \B108\BB34 \AE41\B2C8\B2E4. \C81C\D55C\C740 240\C790\C785\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140503125099751779)
,p_name=>'ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C624\B958')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140533922945751788)
,p_name=>'ERROR_SET_ITEM_STATE_FOR_PPR_REGION'
,p_message_language=>'ko'
,p_message_text=>unistr('\BD80\BD84 \D398\C774\C9C0 \C0C8\B85C\ACE0\CE68 \C601\C5ED\C5D0 \B300\D55C \D398\C774\C9C0 \D56D\BAA9 \C18C\C2A4 \AC12\C744 \C124\C815\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140494470426751776)
,p_name=>'F4500_P10_CREATED_BY'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0DD\C131\C790')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140455772735751765)
,p_name=>'F4500_P2613_EXPIRED'
,p_message_language=>'ko'
,p_message_text=>unistr('\BE44\BC00\BC88\D638\AC00 \B9CC\B8CC\B428')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140448179899751763)
,p_name=>'FILE_EMPTY'
,p_message_language=>'ko'
,p_message_text=>unistr('\D30C\C77C\C774 \BE44\C5B4 \C788\C2B5\B2C8\B2E4.')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140537924134751789)
,p_name=>'FILE_TOO_LARGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5C5\B85C\B4DC\B41C \D30C\C77C \D06C\AE30\AC00 %0MB \C774\C0C1\C785\B2C8\B2E4. \B354 \C791\C740 \D30C\C77C\C744 \C5C5\B85C\B4DC\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140458069645751765)
,p_name=>'FILE_UPLOAD_AUTHENTICATION_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AC\C6A9\C790 \C778\C99D\C744 \C2E4\D328\D588\C73C\BA70 \D558\B098 \C774\C0C1\C758 \D30C\C77C\C774 \C5C5\B85C\B4DC\B418\C9C0 \C54A\C558\C2B5\B2C8\B2E4.')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140458170116751765)
,p_name=>'FILE_UPLOAD_PUBLICUSER_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774 \C778\C2A4\D134\C2A4\B294 \C778\C99D\B418\C9C0 \C54A\C740 \C0AC\C6A9\C790\AC00 \D30C\C77C\C744 \C5C5\B85C\B4DC\D558\B3C4\B85D \D5C8\C6A9\D558\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140538068770751789)
,p_name=>'FILTERS'
,p_message_language=>'ko'
,p_message_text=>unistr('\D544\D130')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140516026790751783)
,p_name=>'FLOW.SINGLE_VALIDATION_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('1\AC1C\C758 \C624\B958\AC00 \BC1C\C0DD\D568')
,p_is_js_message=>true
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140515205702751782)
,p_name=>'FLOW.VALIDATION_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C624\B958 \BC1C\C0DD')
,p_is_js_message=>true
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140460661447751766)
,p_name=>'FORM_OF'
,p_message_language=>'ko'
,p_message_text=>'%0/%1'
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140499627665751778)
,p_name=>'GO'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2E4\D589')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140601855809751808)
,p_name=>'HELP'
,p_message_language=>'ko'
,p_message_text=>unistr('\B3C4\C6C0\B9D0')
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140442992636751761)
,p_name=>'HOME'
,p_message_language=>'ko'
,p_message_text=>unistr('\D648')
,p_is_js_message=>true
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140481285910751772)
,p_name=>'HOUR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2DC\AC04')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140481398932751772)
,p_name=>'HOURS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2DC\AC04')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140462747864751767)
,p_name=>'ICON'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C544\C774\CF58')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140440008183751760)
,p_name=>'ICON.EDITOR.CROP.HELP'
,p_message_language=>'ko'
,p_message_text=>unistr('\C790\B974\AE30 \C544\C774\CF58 \B3C4\C6C0\B9D0')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140441284584751761)
,p_name=>'ICON.EDITOR.CROPPER.HELPTEXT'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\C544\C774\CF58\C744 \B04C\ACE0 \D655\B300/\CD95\C18C \C2AC\B77C\C774\B354\B97C \C0AC\C6A9\D558\C5EC \D504\B808\C784 \B0B4\C5D0\C11C \C704\CE58\B97C \C870\C815\D558\C2ED\C2DC\C624.</p>'),
'',
unistr('<p>\C0C8 \C544\C774\CF58\C744 \C5C5\B85C\B4DC\D558\BA74 \D30C\BE44\CF58, \C18C\D615 \BC0F \B300\D615 \C544\C774\CF58\C758 \C138 \AC00\C9C0 \D615\C2DD\C5D0 \B9DE\AC8C \D06C\AE30\AC00 \C870\C815\B429\B2C8\B2E4.</p>'),
'',
unistr('<p>\C544\C774\CF58 \C790\B974\AE30 \B3C4\AD6C\C5D0 \D3EC\CEE4\C2A4\AC00 \C788\C73C\BA74 \B2E4\C74C \D0A4\BCF4\B4DC \B2E8\CD95\D0A4\B97C \C0AC\C6A9\D560 \C218 \C788\C2B5\B2C8\B2E4.</p>'),
'<ul>',
unistr('    <li>\C67C\CABD \D654\C0B4\D45C: \C774\BBF8\C9C0\B97C \C67C\CABD\C73C\B85C \C774\B3D9*</li>'),
unistr('    <li>\C704\CABD \D654\C0B4\D45C: \C774\BBF8\C9C0\B97C \C704\CABD\C73C\B85C \C774\B3D9*</li>'),
unistr('    <li>\C624\B978\CABD \D654\C0B4\D45C: \C774\BBF8\C9C0\B97C \C624\B978\CABD\C73C\B85C \C774\B3D9*</li>'),
unistr('    <li>\C544\B798\CABD \D654\C0B4\D45C: \C774\BBF8\C9C0\B97C \C544\B798\CABD\C73C\B85C \C774\B3D9*</li>'),
unistr('    <li>I: \D655\B300</li>'),
unistr('    <li>I: \CD95\C18C</li>'),
unistr('    <li>I: \C67C\CABD\C73C\B85C \D68C\C804</li>'),
unistr('    <li>I: \C624\B978\CABD\C73C\B85C \D68C\C804</li>'),
'</ul>',
'',
unistr('<p class="margin-top-md"><em>*Shift \D0A4\B97C \B20C\B7EC\C11C \B354 \BE60\B974\AC8C \C774\B3D9</em></p>')))
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140446700496751762)
,p_name=>'ICON.EDITOR.CROPPER.SUBTITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\B04C\C5B4\C11C \C7AC\BC30\CE58 \C544\C774\CF58')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140446891157751762)
,p_name=>'ICON.EDITOR.CROPPER.ZOOM_SLIDER_LABEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2AC\B77C\C774\B354\B97C \C774\B3D9\D574\C11C \D655\B300/\CD95\C18C \B808\BCA8 \C870\C815')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140439823725751760)
,p_name=>'ICON.EDITOR.DIALOG.TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C560\D50C\B9AC\CF00\C774\C158 \D3B8\C9D1 \C544\C774\CF58')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140440196145751760)
,p_name=>'ICON.EDITOR.ERROR.SAVING'
,p_message_language=>'ko'
,p_message_text=>unistr('\C544\C774\CF58 \C800\C7A5 \C911 \C624\B958 \BC1C\C0DD')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140522539533751785)
,p_name=>'ICON.EDITOR.LEGACY_DATA'
,p_message_language=>'ko'
,p_message_text=>unistr('<p><span class="a-Icon icon-tr-warning"></span> \C774 \C560\D50C\B9AC\CF00\C774\C158\C5D0\B294 \AE30\C874 \C544\C774\CF58\C774 \C0AC\C6A9\B429\B2C8\B2E4. \C0C8 \C544\C774\CF58\C744 \C5C5\B85C\B4DC\D558\BA74 \BAA8\B4E0 \AE30\C874 \C544\C774\CF58\C774 \BC14\B01D\B2C8\B2E4.</p>')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140440756429751760)
,p_name=>'ICON.EDITOR.UPLOAD.ICON'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0C8 \C544\C774\CF58 \C5C5\B85C\B4DC')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140516981668751783)
,p_name=>'INVALID_CREDENTIALS'
,p_message_language=>'ko'
,p_message_text=>unistr('\BD80\C801\D569\D55C \B85C\ADF8\C778 \C778\C99D\C11C')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140618048201751813)
,p_name=>'INVALID_VALUE_FOR_PARAMETER'
,p_message_language=>'ko'
,p_message_text=>unistr('\B9E4\AC1C\BCC0\C218\C5D0 \BD80\C801\D569\D55C \AC12: %0')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140511285150751781)
,p_name=>'IR_AS_DEFAULT_REPORT_SETTING'
,p_message_language=>'ko'
,p_message_text=>unistr('\AE30\BCF8 \BCF4\ACE0\C11C \C124\C815\C73C\B85C')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140511355486751781)
,p_name=>'IR_AS_NAMED_REPORT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\B984\C774 \C9C0\C815\B41C \BCF4\ACE0\C11C\B85C')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140493269333751776)
,p_name=>'IR_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C624\B958. %1')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140492901506751776)
,p_name=>'IR_FRM_NAV_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\D3FC \D0D0\C0C9\C744 \ACC4\C0B0\D560 \C218 \C5C6\C2B5\B2C8\B2E4. %0')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140468574539751769)
,p_name=>'IR_NOT_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('\B300\D654\C2DD \BCF4\ACE0\C11C\B97C \CC3E\C744 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140467948337751768)
,p_name=>'IR_REGION_NOT_EXIST'
,p_message_language=>'ko'
,p_message_text=>unistr('\B300\D654\C2DD \BCF4\ACE0\C11C \C601\C5ED\C774 %0 \C560\D50C\B9AC\CF00\C774\C158, %1 \D398\C774\C9C0 \BC0F %2 \C601\C5ED\C5D0 \C874\C7AC\D558\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140511138630751781)
,p_name=>'IR_STAR'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC1C\BC1C\C790\C5D0 \B300\D574\C11C\B9CC \D45C\C2DC\B429\B2C8\B2E4.')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140499310267751778)
,p_name=>'IR_UNIQUE_KEY_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\ACE0\C11C \C9C8\C758\C5D0\B294 \AC01 \D589\C744 \C2DD\BCC4\D558\B294 \ACE0\C720 \D0A4\AC00 \D544\C694\D569\B2C8\B2E4. \C81C\ACF5\B41C \D0A4\B294 \C774 \C9C8\C758\C5D0 \C0AC\C6A9\D560 \C218 \C5C6\C2B5\B2C8\B2E4. \ACE0\C720 \D0A4 \C5F4\C744 \C815\C758\D558\C2ED\C2DC\C624. %0')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140499426488751778)
,p_name=>'IR_UNIQUE_KEY_ERROR2'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\ACE0\C11C \C9C8\C758\C5D0\B294 \AC01 \D589\C744 \C2DD\BCC4\D558\B294 \ACE0\C720 \D0A4\AC00 \D544\C694\D569\B2C8\B2E4. \C81C\ACF5\B41C \D0A4\B294 \C774 \C9C8\C758\C5D0 \C0AC\C6A9\D560 \C218 \C5C6\C2B5\B2C8\B2E4. \ACE0\C720 \D0A4 \C5F4\C744 \C815\C758\D558\B824\BA74 \BCF4\ACE0\C11C \C18D\C131\C744 \D3B8\C9D1\D558\C2ED\C2DC\C624. %0')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140540392548751790)
,p_name=>'ITEM.FILE_UPLOAD.CHOOSE_FILE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D30C\C77C \C120\D0DD')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140540225111751790)
,p_name=>'ITEM.FILE_UPLOAD.DRAG_DROP_FILE_HERE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5EC\AE30\B85C \D30C\C77C \B04C\C5B4 \B193\AE30')
,p_is_js_message=>true
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140460927726751766)
,p_name=>'ITEMS'
,p_message_language=>'ko'
,p_message_text=>unistr('\D56D\BAA9')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140494651983751776)
,p_name=>'ITEM_VALUE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D56D\BAA9 \AC12')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140509276764751781)
,p_name=>'LABEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\B808\C774\BE14')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140521878499751784)
,p_name=>'LANGUAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5B8\C5B4')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140481999118751773)
,p_name=>'LAST'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD5C\ADFC')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140457954515751765)
,p_name=>'LENGTH'
,p_message_language=>'ko'
,p_message_text=>unistr('\AE38\C774')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140516263453751783)
,p_name=>'LOGIN'
,p_message_language=>'ko'
,p_message_text=>unistr('\B85C\ADF8\C778')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140557873958751795)
,p_name=>'MANAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\AD00\B9AC')
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140620987117751814)
,p_name=>'MAXIMIZE'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD5C\B300\D654')
,p_is_js_message=>true
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140481077296751772)
,p_name=>'MINUTE'
,p_message_language=>'ko'
,p_message_text=>unistr('\BD84')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140481149238751772)
,p_name=>'MINUTES'
,p_message_language=>'ko'
,p_message_text=>unistr('\BD84')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140573109619751800)
,p_name=>'MISSING_AT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C804\C790\BA54\C77C \C8FC\C18C \B3C4\BA54\C778\C5D0 "@"\C774 \B204\B77D\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140573378665751800)
,p_name=>'MISSING_DIALOG_PAGE_TEMPLATE_WARNING'
,p_message_language=>'ko'
,p_message_text=>unistr('\ACBD\ACE0: %1 \C560\D50C\B9AC\CF00\C774\C158\C758 \B300\D654\C0C1\C790 \D398\C774\C9C0 %0\C5D0 \B300\D574 \C815\C758\B41C \B300\D654\C0C1\C790 \D398\C774\C9C0 \D15C\D50C\B9AC\D2B8\AC00 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140573082653751800)
,p_name=>'MISSING_DOT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C804\C790\BA54\C77C \C8FC\C18C \B3C4\BA54\C778\C5D0 "."\C774 \B204\B77D\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140519311176751784)
,p_name=>'MODULE'
,p_message_language=>'ko'
,p_message_text=>unistr('\BAA8\B4C8')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140473575016751770)
,p_name=>'MONTH'
,p_message_language=>'ko'
,p_message_text=>unistr('\C6D4')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140477411509751771)
,p_name=>'MONTHLY'
,p_message_language=>'ko'
,p_message_text=>unistr('\C6D4\BCC4')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140473624419751770)
,p_name=>'MONTHS'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC1C\C6D4')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140508808540751781)
,p_name=>'MOVE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\B3D9')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140579619964751801)
,p_name=>'MOVE_FROM'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\B3D9 \CD9C\CC98')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140579708672751801)
,p_name=>'MOVE_TO'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\B3D9 \B300\C0C1')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140495853928751777)
,p_name=>'MRU.ERROR_IN_MRD'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C911 \D589 \C0AD\C81C \C791\C5C5 \C911 \C624\B958 \BC1C\C0DD: \D589= %0, %1, %2')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140494808319751776)
,p_name=>'MUST_NOT_BE_PUBLIC_USER'
,p_message_language=>'ko'
,p_message_text=>unistr('\ACF5\AC1C \C0AC\C6A9\C790\AC00 \C544\B2C8\C5B4\C57C \D568')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140443462648751761)
,p_name=>'NAME'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\B984')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140509033324751781)
,p_name=>'NEW'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0C8\B85C \B9CC\B4E4\AE30')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140473340221751770)
,p_name=>'NEW_ACCOUNT_LOGIN_INSTRUCTIONS'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C\C73C\B85C \C774\B3D9\D558\C5EC %0\C5D0 \B85C\ADF8\C778\D560 \C218 \C788\C74C:')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140473462518751770)
,p_name=>'NEW_ACCOUNT_NOTIFICATION'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0C8 %0 \ACC4\C815 \D1B5\C9C0')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140602006934751808)
,p_name=>'NEXT'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C')
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140519253066751784)
,p_name=>'NO'
,p_message_language=>'ko'
,p_message_text=>unistr('\C544\B2C8\C624')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140616141008751812)
,p_name=>'NOBODY'
,p_message_language=>'ko'
,p_message_text=>unistr('\C544\BB34\B3C4 \C5C6\C74C')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140482351032751773)
,p_name=>'NOT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C544\B2D8')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140525275076751785)
,p_name=>'NOT_NULL'
,p_message_language=>'ko'
,p_message_text=>unistr('\B110\C774 \C544\B2D8')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140494972387751776)
,p_name=>'NOT_W_ARGUMENT'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C544\B2D8')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140514729469751782)
,p_name=>'NO_DATA_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('\B370\C774\D130\B97C \CC3E\C744 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140524711578751785)
,p_name=>'NO_UPDATEABLE_REPORT_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5C5\B370\C774\D2B8 \AC00\B2A5\D55C \BCF4\ACE0\C11C\B97C \CC3E\C744 \C218 \C5C6\C2B5\B2C8\B2E4. ''\C5C5\B370\C774\D2B8 \AC00\B2A5\D55C \BCF4\ACE0\C11C'' \C720\D615\C758 \D45C \D615\C2DD \D3FC\C5D0 \B300\D574\C11C\B9CC \B2E4\C911 \D589 \C5C5\B370\C774\D2B8 \BC0F \C0AD\C81C \C791\C5C5\C744 \C218\D589\D560 \C218 \C788\C2B5\B2C8\B2E4.')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140525654495751786)
,p_name=>'OK'
,p_message_language=>'ko'
,p_message_text=>unistr('\D655\C778')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140520933895751784)
,p_name=>'ORACLE_APPLICATION_EXPRESS'
,p_message_language=>'ko'
,p_message_text=>'Oracle APEX'
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140619821608751813)
,p_name=>'ORA_06550'
,p_message_language=>'ko'
,p_message_text=>unistr('ORA-06550: %0\D589, %1\C5F4')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140570720460751799)
,p_name=>'OUTDATED_BROWSER'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\C804 \BC84\C804\C758 \C6F9 \BE0C\B77C\C6B0\C800\B97C \C0AC\C6A9\D558\ACE0 \C788\C2B5\B2C8\B2E4. \C9C0\C6D0\B418\B294 \BE0C\B77C\C6B0\C800 \BAA9\B85D\C740 Oracle APEX Installation Guide\B97C \CC38\C870\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140465705453751768)
,p_name=>'OUT_OF_RANGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\BD80\C801\D569\D55C \D589 \C9D1\D569\C774 \C694\CCAD\B418\C5C8\C2B5\B2C8\B2E4. \BCF4\ACE0\C11C\C758 \C18C\C2A4 \B370\C774\D130\AC00 \C218\C815\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140487740460751774)
,p_name=>'P.VALID_PAGE_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C801\D569\D55C \D398\C774\C9C0 \BC88\D638\B97C \C9C0\C815\D574\C57C \D569\B2C8\B2E4. (\C608: p?n=1234)')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140491939968751776)
,p_name=>'PAGINATION.NEXT'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140492000761751776)
,p_name=>'PAGINATION.NEXT_SET'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C74C \C9D1\D569')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140492162427751776)
,p_name=>'PAGINATION.PREVIOUS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\C804')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140492222079751776)
,p_name=>'PAGINATION.PREVIOUS_SET'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\C804 \C9D1\D569')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140601939311751808)
,p_name=>'PAGINATION.SELECT'
,p_message_language=>'ko'
,p_message_text=>unistr('\D398\C774\C9C0 \B9E4\AE40 \C120\D0DD')
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140531956703751787)
,p_name=>'PASSWORD'
,p_message_language=>'ko'
,p_message_text=>unistr('\BE44\BC00\BC88\D638')
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140472654544751770)
,p_name=>'PASSWORD_CHANGED'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C5D0 \B300\D55C \BE44\BC00\BC88\D638\AC00 \BCC0\ACBD\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140460338982751766)
,p_name=>'PASSWORD_COMPLEXITY_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\BE44\BC00\BC88\D638\AC00 \C774 \C0AC\C774\D2B8\C758 \BE44\BC00\BC88\D638 \BCF5\C7A1\C131 \ADDC\CE59\C744 \C900\C218\D558\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140459488473751766)
,p_name=>'PASSWORD_DIFFERS_BY_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0C8 \BE44\BC00\BC88\D638\B294 \C774\C804 \BE44\BC00\BC88\D638\C640 %0\C790 \C774\C0C1 \B2EC\B77C\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140460085492751766)
,p_name=>'PASSWORD_LIKE_USERNAME_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('\BE44\BC00\BC88\D638\C5D0\B294 \C0AC\C6A9\C790 \C774\B984\C774 \D3EC\D568\B418\C9C0 \C54A\C544\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140460279897751766)
,p_name=>'PASSWORD_LIKE_WORDS_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('\BE44\BC00\BC88\D638\C5D0 \D5C8\C6A9\B418\C9C0 \C54A\B294 \B2E8\C21C\D55C \B2E8\C5B4\AC00 \D3EC\D568\B418\C5B4 \C788\C2B5\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140460146909751766)
,p_name=>'PASSWORD_LIKE_WORKSPACE_NAME_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('\BE44\BC00\BC88\D638\C5D0\B294 \C791\C5C5\C601\C5ED \C774\B984\C774 \D3EC\D568\B418\C9C0 \C54A\C544\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140459309360751766)
,p_name=>'PASSWORD_MIN_LEN_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('\BE44\BC00\BC88\D638\B294 %0\C790 \C774\C0C1\C774\C5B4\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140459521188751766)
,p_name=>'PASSWORD_ONE_ALPHA_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('\BE44\BC00\BC88\D638\C5D0\B294 \D558\B098 \C774\C0C1\C758 \C601\BB38\C790(%0)\AC00 \D3EC\D568\B418\C5B4\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140459963781751766)
,p_name=>'PASSWORD_ONE_LOWER_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('\BE44\BC00\BC88\D638\C5D0\B294 \D558\B098 \C774\C0C1\C758 \C18C\BB38\C790(\C601\BB38\C790)\AC00 \D3EC\D568\B418\C5B4\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140459687643751766)
,p_name=>'PASSWORD_ONE_NUMERIC_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('\BE44\BC00\BC88\D638\C5D0\B294 \D558\B098 \C774\C0C1\C758 \C22B\C790(0123456789)\AC00 \D3EC\D568\B418\C5B4\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140459769380751766)
,p_name=>'PASSWORD_ONE_PUNCTUATION_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('\BE44\BC00\BC88\D638\C5D0\B294 \D558\B098 \C774\C0C1\C758 \AD6C\B450\C810 \BB38\C790(%0)\AC00 \D3EC\D568\B418\C5B4\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140459828864751766)
,p_name=>'PASSWORD_ONE_UPPER_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('\BE44\BC00\BC88\D638\C5D0\B294 \D558\B098 \C774\C0C1\C758 \B300\BB38\C790(\C601\BB38\C790)\AC00 \D3EC\D568\B418\C5B4\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140473188319751770)
,p_name=>'PASSWORD_RESET_NOTIFICATION'
,p_message_language=>'ko'
,p_message_text=>unistr('\BE44\BC00\BC88\D638 \C7AC\C124\C815 \D1B5\C9C0')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140458217467751766)
,p_name=>'PASSWORD_REUSE_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\B09C %0\C77C \C774\B0B4\C5D0 \BE44\BC00\BC88\D638\B97C \C0AC\C6A9\D588\C73C\BBC0\B85C \D574\B2F9 \BE44\BC00\BC88\D638\B97C \C0AC\C6A9\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140454903765751765)
,p_name=>'PCT_GRAPH_ARIA_LABEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\BE44\C728 \ADF8\B798\D504')
,p_is_js_message=>true
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140546554527751792)
,p_name=>'PE.COMPONEN.TYPE.PAGE_ITEM.PLURAL'
,p_message_language=>'ko'
,p_message_text=>unistr('\D56D\BAA9')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140546690380751792)
,p_name=>'PE.COMPONEN.TYPE.PAGE_ITEM.SINGULAR'
,p_message_language=>'ko'
,p_message_text=>unistr('\D56D\BAA9')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140520727687751784)
,p_name=>'PERCENT'
,p_message_language=>'ko'
,p_message_text=>unistr('\D37C\C13C\D2B8')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140490094036751775)
,p_name=>'PLEASE_CONTACT_ADMINISTRATOR'
,p_message_language=>'ko'
,p_message_text=>unistr('\AD00\B9AC\C790\C5D0\AC8C \BB38\C758\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140602140897751808)
,p_name=>'PREVIOUS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\C804')
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140538753508751789)
,p_name=>'PRINT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C778\C1C4')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140519559243751784)
,p_name=>'PRIVILEGES'
,p_message_language=>'ko'
,p_message_text=>unistr('\AD8C\D55C')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140488114353751774)
,p_name=>'REGIOIN_REFERENCES'
,p_message_language=>'ko'
,p_message_text=>unistr('\C601\C5ED \CC38\C870')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140509180014751781)
,p_name=>'REPORT'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\ACE0\C11C')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140519420698751784)
,p_name=>'REPORTING_PERIOD'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\ACE0 \AE30\AC04')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140602375852751808)
,p_name=>'REPORT_LABEL'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\ACE0\C11C: %0')
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140520184805751784)
,p_name=>'REPORT_TOTAL'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\ACE0\C11C \D569\ACC4')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140465866808751768)
,p_name=>'RESET'
,p_message_language=>'ko'
,p_message_text=>unistr('\D398\C774\C9C0 \BC88\D638 \B9E4\AE40 \C7AC\C124\C815')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140494585797751776)
,p_name=>'RESET_PAGINATION'
,p_message_language=>'ko'
,p_message_text=>unistr('\D398\C774\C9C0 \BC88\D638 \B9E4\AE40 \C7AC\C124\C815')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140524654271751785)
,p_name=>'RESET_PASSWORD'
,p_message_language=>'ko'
,p_message_text=>unistr('\BE44\BC00\BC88\D638 \C7AC\C124\C815')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140500489340751778)
,p_name=>'RESTORE'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF5\C6D0')
,p_is_js_message=>true
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140534052247751788)
,p_name=>'RESULTS'
,p_message_language=>'ko'
,p_message_text=>unistr('\ACB0\ACFC')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140525717160751786)
,p_name=>'RETURN_TO_APPLICATION'
,p_message_language=>'ko'
,p_message_text=>unistr('\C560\D50C\B9AC\CF00\C774\C158\C73C\B85C \B3CC\C544\AC00\C2ED\C2DC\C624.')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140526119302751786)
,p_name=>'RIGHT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C624\B978\CABD')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140558189764751795)
,p_name=>'ROW'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589 %0')
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140508754825751781)
,p_name=>'ROW_COUNT'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589 \C218')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140398550783751748)
,p_name=>'RW_AO_ASK_ORACLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C624\B77C\D074\C5D0 \BB38\C758')
,p_is_js_message=>true
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140398877726751748)
,p_name=>'RW_AO_CLOSE_ASK_ORACLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C624\B77C\D074\C5D0 \BB38\C758 \B2EB\AE30')
,p_is_js_message=>true
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140399124595751748)
,p_name=>'RW_AO_NOTIFICATIONS_LIST'
,p_message_language=>'ko'
,p_message_text=>unistr('\D1B5\C9C0 \BAA9\B85D')
,p_is_js_message=>true
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140398714611751748)
,p_name=>'RW_AO_OPEN_ASK_ORACLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C624\B77C\D074\C5D0 \BB38\C758 \C5F4\AE30')
,p_is_js_message=>true
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140399038837751748)
,p_name=>'RW_AO_PRODUCT_MAP'
,p_message_language=>'ko'
,p_message_text=>unistr('\C81C\D488 \B9E4\D551')
,p_is_js_message=>true
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140398971773751748)
,p_name=>'RW_AO_SUGGESTIONS_LIST'
,p_message_language=>'ko'
,p_message_text=>unistr('\C81C\C548 \BAA9\B85D')
,p_is_js_message=>true
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140399824300751748)
,p_name=>'RW_CLEAR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\C6B0\AE30')
,p_is_js_message=>true
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140399774408751748)
,p_name=>'RW_CLOSE'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2EB\AE30')
,p_is_js_message=>true
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140399556795751748)
,p_name=>'RW_FO_VIEW_MORE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C790\C138\D788 \BCF4\AE30')
,p_is_js_message=>true
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140399911872751748)
,p_name=>'RW_GO_TO'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\B3D9')
,p_is_js_message=>true
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140399376528751748)
,p_name=>'RW_GP_STEP'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E8\ACC4')
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140399450615751748)
,p_name=>'RW_GP_STEP_OF'
,p_message_language=>'ko'
,p_message_text=>'/'
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140399239310751748)
,p_name=>'RW_GP_TOGGLE_STEPS'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E8\ACC4 \D45C\C2DC \D1A0\AE00')
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140398361248751748)
,p_name=>'RW_HIDE_PASSWORD'
,p_message_language=>'ko'
,p_message_text=>unistr('\BE44\BC00\BC88\D638 \C228\AE30\AE30')
,p_is_js_message=>true
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140399631007751748)
,p_name=>'RW_OPEN'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F4\AE30')
,p_is_js_message=>true
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140398157092751748)
,p_name=>'RW_ORACLE'
,p_message_language=>'ko'
,p_message_text=>'Oracle'
,p_is_js_message=>true
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140398281932751748)
,p_name=>'RW_SHOW_PASSWORD'
,p_message_language=>'ko'
,p_message_text=>unistr('\BE44\BC00\BC88\D638 \D45C\C2DC')
,p_is_js_message=>true
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140400084694751748)
,p_name=>'RW_START'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2DC\C791')
,p_is_js_message=>true
,p_version_scn=>2705113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140525125297751785)
,p_name=>'SAVE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C800\C7A5')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140521338641751784)
,p_name=>'SAVED_REPORTS.ALTERNATIVE.DEFAULT'
,p_message_language=>'ko'
,p_message_text=>unistr('\B300\CCB4 \AE30\BCF8\AC12')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140521777391751784)
,p_name=>'SAVED_REPORTS.DESCRIPTION'
,p_message_language=>'ko'
,p_message_text=>unistr('\C124\BA85')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140521270134751784)
,p_name=>'SAVED_REPORTS.PRIMARY.DEFAULT'
,p_message_language=>'ko'
,p_message_text=>unistr('\AE30\BCF8 \AE30\BCF8\AC12')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140522052930751784)
,p_name=>'SC_REPORT_ROWS'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\AC1C\BCF4\B2E4 \B9CE\C740 \D589\C744 \C0AC\C6A9\D560 \C218 \C788\C2B5\B2C8\B2E4. \D589 \C120\D0DD\AE30\B97C \B298\B824 \D589\C744 \B354 \D45C\C2DC\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140589443264751804)
,p_name=>'SEARCH'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC80\C0C9')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140480949307751772)
,p_name=>'SECONDS'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD08')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140520823376751784)
,p_name=>'SEE_ATTACHED'
,p_message_language=>'ko'
,p_message_text=>unistr('\CCA8\BD80 \CC38\C870')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140581417063751802)
,p_name=>'SELECT_ROW'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589 \C120\D0DD')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140520573074751784)
,p_name=>'SET_SCREEN_READER_MODE_OFF'
,p_message_language=>'ko'
,p_message_text=>unistr('\D654\BA74 \D310\B3C5\AE30 \BAA8\B4DC \D574\C81C')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140520664937751784)
,p_name=>'SET_SCREEN_READER_MODE_ON'
,p_message_language=>'ko'
,p_message_text=>unistr('\D654\BA74 \D310\B3C5\AE30 \BAA8\B4DC \C124\C815')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140516829816751783)
,p_name=>'SHOW'
,p_message_language=>'ko'
,p_message_text=>unistr('\D45C\C2DC')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140583255400751802)
,p_name=>'SHOW_ALL'
,p_message_language=>'ko'
,p_message_text=>unistr('\BAA8\B450 \D45C\C2DC')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140608005842751810)
,p_name=>'SIGN_IN'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AC\C778\C778')
,p_version_scn=>2705146
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140558979750751795)
,p_name=>'SIGN_OUT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AC\C778\C544\C6C3')
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140509778607751781)
,p_name=>'SINCE_DAYS_AGO'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C77C \C804')
,p_is_js_message=>true
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140517335466751783)
,p_name=>'SINCE_DAYS_FROM_NOW'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\AE08\BD80\D130 %0\C77C')
,p_is_js_message=>true
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140509604829751781)
,p_name=>'SINCE_HOURS_AGO'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C2DC\AC04 \C804')
,p_is_js_message=>true
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140517294680751783)
,p_name=>'SINCE_HOURS_FROM_NOW'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\AE08\BD80\D130 %0\C2DC\AC04')
,p_is_js_message=>true
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140509587743751781)
,p_name=>'SINCE_MINUTES_AGO'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\BD84 \C804')
,p_is_js_message=>true
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140517165269751783)
,p_name=>'SINCE_MINUTES_FROM_NOW'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\AE08\BD80\D130 %0\BD84')
,p_is_js_message=>true
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140509984247751781)
,p_name=>'SINCE_MONTHS_AGO'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\AC1C\C6D4 \C804')
,p_is_js_message=>true
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140517586499751783)
,p_name=>'SINCE_MONTHS_FROM_NOW'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\AE08\BD80\D130 %0\AC1C\C6D4')
,p_is_js_message=>true
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140517701185751783)
,p_name=>'SINCE_NOW'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\AE08')
,p_is_js_message=>true
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140509417058751781)
,p_name=>'SINCE_SECONDS_AGO'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\CD08 \C804')
,p_is_js_message=>true
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140517057838751783)
,p_name=>'SINCE_SECONDS_FROM_NOW'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\AE08\BD80\D130 %0\CD08')
,p_is_js_message=>true
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140509881749751781)
,p_name=>'SINCE_WEEKS_AGO'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C8FC \C804')
,p_is_js_message=>true
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140517445313751783)
,p_name=>'SINCE_WEEKS_FROM_NOW'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\AE08\BD80\D130 %0\C8FC')
,p_is_js_message=>true
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140510089736751781)
,p_name=>'SINCE_YEARS_AGO'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\B144 \C804')
,p_is_js_message=>true
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140517671893751783)
,p_name=>'SINCE_YEARS_FROM_NOW'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\AE08\BD80\D130 %0\B144')
,p_is_js_message=>true
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140503598434751779)
,p_name=>'STANDARD'
,p_message_language=>'ko'
,p_message_text=>unistr('\D45C\C900')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140520489898751784)
,p_name=>'START_DATE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2DC\C791 \B0A0\C9DC')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140455692173751765)
,p_name=>'SUBSCRIPTION_CREATED_BY'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C774(\AC00) \C0DD\C131\D55C \B300\D654\C2DD \BCF4\ACE0\C11C \B4F1\B85D\C73C\B85C\BD80\D130 \C774 \C804\C790\BA54\C77C\C744 \BC1B\ACE0 \C788\C2B5\B2C8\B2E4.')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140617235245751813)
,p_name=>'SUBSCRIPTION_REFERENCES'
,p_message_language=>'ko'
,p_message_text=>unistr('\C801\C6A9')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140566613106751798)
,p_name=>'TAB'
,p_message_language=>'ko'
,p_message_text=>unistr('\D0ED')
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140480898853751772)
,p_name=>'TITLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C81C\BAA9')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140460595589751766)
,p_name=>'TODAY'
,p_message_language=>'ko'
,p_message_text=>unistr('\C624\B298')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140520063218751784)
,p_name=>'TOTAL'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD1D\ACC4')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140461802289751767)
,p_name=>'TO_MANY_COLUMNS_SELECTED'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD5C\B300 %0\AC1C\C758 \C5F4\C744 \C120\D0DD\D560 \C218 \C788\C2B5\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140417675585751754)
,p_name=>'TREE.COLLAPSE_ALL'
,p_message_language=>'ko'
,p_message_text=>unistr('\BAA8\B450 \CD95\C18C')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140418279704751754)
,p_name=>'TREE.COLLAPSE_ALL_BELOW'
,p_message_language=>'ko'
,p_message_text=>unistr('\C544\B798\C5D0 \BAA8\B450 \CD95\C18C')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140417295477751753)
,p_name=>'TREE.EXPAND_ALL'
,p_message_language=>'ko'
,p_message_text=>unistr('\BAA8\B450 \D655\C7A5')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140417964364751754)
,p_name=>'TREE.EXPAND_ALL_BELOW'
,p_message_language=>'ko'
,p_message_text=>unistr('\C544\B798\C5D0 \BAA8\B450 \D655\C7A5')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140418474483751754)
,p_name=>'TREE.REPARENT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0C1\C704 \C7AC\C9C0\C815')
,p_is_js_message=>true
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140540524634751790)
,p_name=>'TREES'
,p_message_language=>'ko'
,p_message_text=>unistr('\D2B8\B9AC')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140583359981751803)
,p_name=>'UI.FORM.REQUIRED'
,p_message_language=>'ko'
,p_message_text=>unistr('\D544\C218')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140504223117751779)
,p_name=>'UNAUTHORIZED'
,p_message_language=>'ko'
,p_message_text=>unistr('\AD8C\D55C \C5C6\C74C')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140554498360751794)
,p_name=>'UNAVAILABLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AC\C6A9\D560 \C218 \C5C6\C74C')
,p_version_scn=>2705140
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140518115486751783)
,p_name=>'UNKNOWN'
,p_message_language=>'ko'
,p_message_text=>unistr('\C54C \C218 \C5C6\C74C')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140456528399751765)
,p_name=>'UNKNOWN_AUTHENTICATION_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C54C \C218 \C5C6\B294 \C778\C99D \C624\B958\AC00 \BC1C\C0DD\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140458729201751766)
,p_name=>'UNSUBSCRIBE_SUBSCRIPTION_MSG_HTML'
,p_message_language=>'ko'
,p_message_text=>unistr('\B354 \C774\C0C1 \C804\C790\BA54\C77C\C744 \BC1B\C9C0 \C54A\C73C\B824\BA74 <a href="%0">\AC00\C785 \D574\C81C</a>\B97C \B20C\B7EC \AC00\C785\C744 \AD00\B9AC\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140455589237751765)
,p_name=>'UNSUBSCRIBE_SUBSCRIPTION_MSG_TXT'
,p_message_language=>'ko'
,p_message_text=>unistr('\B354 \C774\C0C1 \C804\C790\BA54\C77C\C744 \BC1B\C9C0 \C54A\C73C\B824\BA74 \B2E4\C74C URL\B85C \C774\B3D9\D558\C5EC \AC00\C785\C744 \AD00\B9AC\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140495012555751776)
,p_name=>'UNSUPPORTED_DATA_TYPE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\C6D0\B418\C9C0 \C54A\B294 \B370\C774\D130 \C720\D615')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140482189032751773)
,p_name=>'UPDATE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5C5\B370\C774\D2B8')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140480750249751772)
,p_name=>'UPDATED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5C5\B370\C774\D2B8 \B0A0\C9DC')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140423944568751755)
,p_name=>'UPGRADE_IN_PROGRESS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5C5\ADF8\B808\C774\B4DC \C9C4\D589 \C911')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140424228780751755)
,p_name=>'UPGRADE_IN_PROGRESS_DETAIL'
,p_message_language=>'ko'
,p_message_text=>unistr('Oracle APEX\B97C \CD5C\C2E0 \BC84\C804\C73C\B85C \C5C5\ADF8\B808\C774\B4DC\D558\ACE0 \C788\C2B5\B2C8\B2E4. \C774 \D504\B85C\C138\C2A4\B294 \C77C\BC18\C801\C73C\B85C \CD5C\B300 3\BD84\C774 \AC78\B9BD\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140487517509751774)
,p_name=>'URL_PROHIBITED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C694\CCAD\D55C URL\C740 \AE08\C9C0\B418\C5C8\C2B5\B2C8\B2E4. \AD00\B9AC\C790\C5D0\AC8C \BB38\C758\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140508691491751781)
,p_name=>'USER'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AC\C6A9\C790')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140531873839751787)
,p_name=>'USERNAME'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AC\C6A9\C790 \C774\B984')
,p_version_scn=>2705138
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140573202885751800)
,p_name=>'USERNAME_TOO_LONG'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AC\C6A9\C790 \C774\B984\C774 \B108\BB34 \AE41\B2C8\B2E4. \C81C\D55C\C740 %0\C790\C785\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140515703406751783)
,p_name=>'USERS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AC\C6A9\C790')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140572865588751799)
,p_name=>'USER_EXISTS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AC\C6A9\C790 \C774\B984\C774 \C874\C7AC\D569\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140586671288751803)
,p_name=>'USER_PROFILE_IMAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AC\C6A9\C790 %0\C5D0 \B300\D55C \D504\B85C\D30C\C77C \C774\BBF8\C9C0')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140448547163751763)
,p_name=>'UTILIZATION_REPORTS.AUTOMATION'
,p_message_language=>'ko'
,p_message_text=>unistr('\C790\B3D9\D654 - %0')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140447016987751762)
,p_name=>'UTILIZATION_REPORTS.PAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D398\C774\C9C0 %0 - %1 ')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140449945473751763)
,p_name=>'UTILIZATION_REPORTS.PLUG_NAME'
,p_message_language=>'ko'
,p_message_text=>'%0 - %1'
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140450046563751763)
,p_name=>'UTILIZATION_REPORTS.PROCESS_NAME'
,p_message_language=>'ko'
,p_message_text=>'%0 - %1'
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140448908911751763)
,p_name=>'UTILIZATION_REPORTS.SEARCH_CONFIG'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC80\C0C9 \AD6C\C131 - %0')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140448877210751763)
,p_name=>'UTILIZATION_REPORTS.SHARED_DYNAMIC_LOV'
,p_message_language=>'ko'
,p_message_text=>unistr('\ACF5\C720\B41C \B3D9\C801 LOV - %0')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140448610970751763)
,p_name=>'UTILIZATION_REPORTS.TASK_DEFINITION'
,p_message_language=>'ko'
,p_message_text=>unistr('\D0DC\C2A4\D06C \C815\C758 - %0')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140447172771751762)
,p_name=>'UTILIZATION_REPORTS.WORKFLOW'
,p_message_language=>'ko'
,p_message_text=>unistr('\C6CC\D06C\D50C\B85C\C6B0 - %0 ')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140469279890751769)
,p_name=>'VALID'
,p_message_language=>'ko'
,p_message_text=>unistr('\C801\D569')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140460840861751766)
,p_name=>'VALIDATIONS'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC80\C99D')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140521510750751784)
,p_name=>'VALUE_MUST_BE_SPECIFIED'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC12\C744 \C9C0\C815\D574\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140567813871751798)
,p_name=>'VALUE_MUST_BE_SPECIFIED_FOR'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C5D0 \B300\D55C \AC12\C744 \C9C0\C815\D574\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140490442945751775)
,p_name=>'VERTICAL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C138\B85C')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140482039418751773)
,p_name=>'VIEW'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\AE30')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140515894246751783)
,p_name=>'VIEWS'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\AE30')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140522302870751785)
,p_name=>'VIEW_ALL'
,p_message_language=>'ko'
,p_message_text=>unistr('\BAA8\B450 \BCF4\AE30')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140462202371751767)
,p_name=>'VISUALLY_HIDDEN_LINK'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2DC\AC01\C801\C73C\B85C \C228\ACA8\C9C4 \B9C1\D06C')
,p_is_js_message=>true
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140503008982751779)
,p_name=>'WARNING'
,p_message_language=>'ko'
,p_message_text=>unistr('\ACBD\ACE0')
,p_is_js_message=>true
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140481601238751772)
,p_name=>'WEEK'
,p_message_language=>'ko'
,p_message_text=>unistr('\C8FC')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140477500918751771)
,p_name=>'WEEKLY'
,p_message_language=>'ko'
,p_message_text=>unistr('\C8FC\BCC4')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140481706919751772)
,p_name=>'WEEKS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C8FC')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140521642512751784)
,p_name=>'WELCOME_USER'
,p_message_language=>'ko'
,p_message_text=>unistr('\C2DC\C791: %0')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140519876362751784)
,p_name=>'WWV_DBMS_SQL.INVALID_CLOB'
,p_message_language=>'ko'
,p_message_text=>unistr('\BD80\C801\D569\D55C \AC12\C774 \BC1C\ACAC\B418\C5C8\C2B5\B2C8\B2E4. \C785\B825\B41C \B370\C774\D130\B97C \D655\C778\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140519903444751784)
,p_name=>'WWV_DBMS_SQL.INVALID_DATATYPE'
,p_message_language=>'ko'
,p_message_text=>unistr('\BD80\C801\D569\D55C \AC12\C774 \BC1C\ACAC\B418\C5C8\C2B5\B2C8\B2E4. \C785\B825\B41C \B370\C774\D130\B97C \D655\C778\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140457777263751765)
,p_name=>'WWV_DBMS_SQL.INVALID_DATE'
,p_message_language=>'ko'
,p_message_text=>unistr('\BD80\C801\D569\D55C \B0A0\C9DC \AC12\C774 \BC1C\ACAC\B418\C5C8\C2B5\B2C8\B2E4. \B0A0\C9DC \D615\C2DD\C744 \D655\C778\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140519787795751784)
,p_name=>'WWV_DBMS_SQL.INVALID_NUMBER'
,p_message_language=>'ko'
,p_message_text=>unistr('\BD80\C801\D569\D55C \C22B\C790 \AC12\C774 \BC1C\ACAC\B418\C5C8\C2B5\B2C8\B2E4. \C22B\C790 \D615\C2DD\C744 \D655\C778\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140468829764751769)
,p_name=>'WWV_DBMS_SQL.INVALID_TIMESTAMP'
,p_message_language=>'ko'
,p_message_text=>unistr('\BD80\C801\D569\D55C \C2DC\AC04\AE30\B85D \AC12\C774 \BC1C\ACAC\B418\C5C8\C2B5\B2C8\B2E4. \C2DC\AC04\AE30\B85D \D615\C2DD\C744 \D655\C778\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140493373104751776)
,p_name=>'WWV_DBMS_SQL.UNABLE_TO_BIND_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('"%0"\C744(\B97C) \BC14\C778\B4DC\D560 \C218 \C5C6\C2B5\B2C8\B2E4. \BA40\D2F0 \BC14\C774\D2B8 \D56D\BAA9\C5D0 \B300\D574 \D070 \B530\C634\D45C\B97C \C0AC\C6A9\D558\AC70\B098 \D56D\BAA9 \AE38\C774\AC00 30\BC14\C774\D2B8 \C774\D558\C778\C9C0 \D655\C778\D558\C2ED\C2DC\C624. \AE38\C774\AC00 30\BC14\C774\D2B8\B97C \CD08\ACFC\D558\B294 \D56D\BAA9\C744 \CC38\C870\D558\B824\BA74 v() \AD6C\BB38\C744 \C0AC\C6A9\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140483109806751773)
,p_name=>'WWV_FLOW.ACCESS_DENIED'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \BCF4\C548 \AC80\C0AC\C5D0 \C758\D574 \C561\C138\C2A4\AC00 \AC70\BD80\B428')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140485621005751774)
,p_name=>'WWV_FLOW.APP_NOT_AVAILABLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C560\D50C\B9AC\CF00\C774\C158\C744 \C0AC\C6A9\D560 \C218 \C5C6\C74C')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140484057114751773)
,p_name=>'WWV_FLOW.APP_NOT_FOUND_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C560\D50C\B9AC\CF00\C774\C158\C744 \CC3E\C744 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140484154125751773)
,p_name=>'WWV_FLOW.APP_NOT_FOUND_FOOTER_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C560\D50C\B9AC\CF00\C774\C158=%0  \C791\C5C5\C601\C5ED=%1')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140484514973751773)
,p_name=>'WWV_FLOW.APP_RESTRICTED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774 \C560\D50C\B9AC\CF00\C774\C158\C5D0 \B300\D55C \C561\C138\C2A4\AC00 \C81C\D55C\B429\B2C8\B2E4. \B098\C911\C5D0 \B2E4\C2DC \C2DC\B3C4\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140484415514751773)
,p_name=>'WWV_FLOW.APP_RESTRICTED_TO_DEV'
,p_message_language=>'ko'
,p_message_text=>unistr('\C560\D50C\B9AC\CF00\C774\C158 \AC1C\BC1C\C790\B9CC \C774 \C560\D50C\B9AC\CF00\C774\C158\C5D0 \C561\C138\C2A4\D560 \C218 \C788\C2B5\B2C8\B2E4. \B098\C911\C5D0 \B2E4\C2DC \C2DC\B3C4\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140483688584751773)
,p_name=>'WWV_FLOW.BRANCH_FUNC_RETURNING_URL_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('ERR-7744 URL\C744 \BC18\D658\D558\B294 \D568\C218\B85C\C758 \BD84\AE30\B97C \CC98\B9AC\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140483558908751773)
,p_name=>'WWV_FLOW.BRANCH_TO_FUNCT_RET_PAGE_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('ERR-7744 \D398\C774\C9C0\B97C \BC18\D658\D558\B294 \D568\C218\B85C\C758 \BD84\AE30\B97C \CC98\B9AC\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140483888600751773)
,p_name=>'WWV_FLOW.CALL_TO_SHOW_FROM_PROC_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('ERR-1430 \D398\C774\C9C0 \D504\B85C\C138\C2A4\C5D0\C11C \D45C\C2DC\D558\AE30 \C704\D55C \D638\CD9C\C774 \C9C0\C6D0\B418\C9C0 \C54A\C74C: G_FLOW_STEP_ID (%0).')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140484964745751773)
,p_name=>'WWV_FLOW.CLEAR_STEP_CACHE_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('ERR-1018 \B2E8\ACC4 \CE90\C2DC\B97C \C9C0\C6B0\B294 \C911 \C624\B958\AC00 \BC1C\C0DD\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140483308095751773)
,p_name=>'WWV_FLOW.COMP_UNKNOWN_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('ERR-1005 \C54C \C218 \C5C6\B294 \ACC4\C0B0 \C720\D615\C785\B2C8\B2E4.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140484206508751773)
,p_name=>'WWV_FLOW.CUSTOM_AUTH_SESSION_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('ERR-1201 \C0AC\C6A9\C790\C815\C758 \C778\C99D\C5D0\C11C \C138\C158 ID\AC00 \C124\C815\B418\C9C0 \C54A\C558\C2B5\B2C8\B2E4.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140484352524751773)
,p_name=>'WWV_FLOW.CUSTOM_AUTH_SESSION_FOOTER_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('\D398\C774\C9C0=%0')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140483972795751773)
,p_name=>'WWV_FLOW.DET_COMPANY_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('ERR-7620 \C560\D50C\B9AC\CF00\C774\C158(%0)\C5D0 \B300\D55C \C791\C5C5\C601\C5ED\C744 \D655\C778\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140464429889751767)
,p_name=>'WWV_FLOW.EDIT'
,p_message_language=>'ko'
,p_message_text=>unistr('\D3B8\C9D1')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140483045879751773)
,p_name=>'WWV_FLOW.FIND_ITEM_ERR2'
,p_message_language=>'ko'
,p_message_text=>unistr('ERR-1802 \D56D\BAA9 ID "%0"\C744(\B97C) \CC3E\C744 \C218 \C5C6\C74C')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140482748170751773)
,p_name=>'WWV_FLOW.FIND_ITEM_ID_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('ERR-1002 "%1" \C560\D50C\B9AC\CF00\C774\C158\C5D0\C11C "%0" \D56D\BAA9\C5D0 \B300\D55C \D56D\BAA9 ID\B97C \CC3E\C744 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140482830189751773)
,p_name=>'WWV_FLOW.FIND_ITEM_ID_ERR2'
,p_message_language=>'ko'
,p_message_text=>unistr('\C608\C0C1\CE58 \C54A\C740 \C624\B958\C785\B2C8\B2E4. \C560\D50C\B9AC\CF00\C774\C158 \B610\B294 \D398\C774\C9C0 \B808\BCA8\C5D0\C11C \D56D\BAA9 \C774\B984\C744 \CC3E\C744 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140483299044751773)
,p_name=>'WWV_FLOW.FIRST_PAGE_DATA_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774\BBF8 \B370\C774\D130\C758 \CCAB\BC88\C9F8 \D398\C774\C9C0\C785\B2C8\B2E4.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140499778046751778)
,p_name=>'WWV_FLOW.ITEM_POSTING_VIOLATION'
,p_message_language=>'ko'
,p_message_text=>unistr('\D56D\BAA9 ID(%0)\AC00 \D604\C7AC \D398\C774\C9C0\C5D0 \C815\C758\B41C \D56D\BAA9\C774 \C544\B2D9\B2C8\B2E4.')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140457334319751765)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.INTERNAL_ONLY'
,p_message_language=>'ko'
,p_message_text=>unistr('\C778\C218\B97C \C560\D50C\B9AC\CF00\C774\C158\C5D0 \C804\B2EC\D558\BA74 \D56D\BAA9\C744 \C124\C815\D558\C9C0 \BABB\D560 \C218 \C788\C2B5\B2C8\B2E4.')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140457685011751765)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.NO_CHECKSUM'
,p_message_language=>'ko'
,p_message_text=>unistr('(\C81C\ACF5\B41C \CCB4\D06C\C12C\C774 \C5C6\C2B5\B2C8\B2E4.)')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140457102621751765)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.PRIVATE_BOOKMARK'
,p_message_language=>'ko'
,p_message_text=>unistr('"\C0AC\C6A9\C790 \B808\BCA8 \CC45\AC08\D53C" \CCB4\D06C\C12C\ACFC \D568\AED8 \C0AC\C6A9\B420 \ACBD\C6B0 \D56D\BAA9\C744 \C124\C815\D560 \C218 \C788\C2B5\B2C8\B2E4.')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140457097571751765)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.PUBLIC_BOOKMARK'
,p_message_language=>'ko'
,p_message_text=>unistr('"\C560\D50C\B9AC\CF00\C774\C158 \B808\BCA8 \CC45\AC08\D53C" \CCB4\D06C\C12C\ACFC \D568\AED8 \C0AC\C6A9\B420 \ACBD\C6B0 \D56D\BAA9\C744 \C124\C815\D560 \C218 \C788\C2B5\B2C8\B2E4.')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140457231714751765)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.SESSION'
,p_message_language=>'ko'
,p_message_text=>unistr('"\C138\C158" \CCB4\D06C\C12C\ACFC \D568\AED8 \C0AC\C6A9\B420 \ACBD\C6B0 \D56D\BAA9\C744 \C124\C815\D560 \C218 \C788\C2B5\B2C8\B2E4.')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140456912072751765)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.UNPROTECTED'
,p_message_language=>'ko'
,p_message_text=>unistr('\D56D\BAA9\C5D0 \C124\C815\B41C \BCF4\D638\AC00 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140485067343751773)
,p_name=>'WWV_FLOW.NO_PAGE_HELP'
,p_message_language=>'ko'
,p_message_text=>unistr('\D398\C774\C9C0 \B3C4\C6C0\B9D0\C774 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140472910269751770)
,p_name=>'WWV_FLOW.NO_PRIV_ON_SCHEMA'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C791\C5C5\C601\C5ED\C5D0\B294 %1 \C2A4\D0A4\B9C8\B97C \C2E4\D589\D560 \C218 \C788\B294 \AD8C\D55C\C774 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140483436267751773)
,p_name=>'WWV_FLOW.PAGE_ACCEPT_RECUR_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('ERR-1010 \D398\C774\C9C0 \D5C8\C6A9 \D504\B85C\C138\C2F1\C73C\B85C \BD84\AE30 \C21C\D658 \D55C\ACC4\B97C \CD08\ACFC\D588\C2B5\B2C8\B2E4. %0')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140439935572751760)
,p_name=>'WWV_FLOW.PAGE_PATTERN_NOT_RUNNABLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D398\C774\C9C0\B97C \C0AC\C6A9\D560 \C218 \C5C6\C74C. \D398\C774\C9C0 \D328\D134\C744 \C2E4\D589\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140457531698751765)
,p_name=>'WWV_FLOW.PAGE_PROTECTION.SHOW_NO_URL_ALLOWED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774 \D398\C774\C9C0\B294 URL \B610\B294 \D45C\C2DC \D504\B85C\C2DC\C800\C5D0 \B300\D55C GET/POST\B97C \C0AC\C6A9\D558\C5EC \D638\CD9C\D560 \C218 \C5C6\C2B5\B2C8\B2E4. "\D398\C774\C9C0 \BD84\AE30" \BD84\AE30 \C720\D615\C744 \C0AC\C6A9\D558\C5EC \D638\CD9C\D574\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140542321717751790)
,p_name=>'WWV_FLOW.SAVE_ROUTINE_NUMERIC_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \D56D\BAA9\C5D0 \C22B\C790\AC00 \C544\B2CC \AC12\C744 \C800\C7A5\D558\B824\B294 \C911 \C624\B958\AC00 \BC1C\C0DD\D588\C2B5\B2C8\B2E4. ')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140474657411751770)
,p_name=>'WWV_FLOW.SCHEMA_NOT_EXISTS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C560\D50C\B9AC\CF00\C774\C158\C758 \AD6C\BB38 \BD84\C11D \C2A4\D0A4\B9C8 "%0"\C774(\AC00) \B370\C774\D130\BCA0\C774\C2A4\C5D0 \C874\C7AC\D558\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140474712442751770)
,p_name=>'WWV_FLOW.SERVICE_ADMIN_LINK'
,p_message_language=>'ko'
,p_message_text=>unistr('INTERNAL \C791\C5C5\C601\C5ED\C758 \ACC4\C815\C740 &PRODUCT_NAME. <a href="%0">\AD00\B9AC \C11C\BE44\C2A4</a>\C5D0 \C561\C138\C2A4\D558\AE30 \C704\D55C \C6A9\B3C4\B85C\B9CC \C0AC\C6A9\D560 \C218 \C788\C2B5\B2C8\B2E4.')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140482628112751773)
,p_name=>'WWV_FLOW.SESSION_INFO_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('ERR-1029 \C138\C158 \C815\BCF4\B97C \C800\C7A5\D560 \C218 \C5C6\C2B5\B2C8\B2E4. \C138\C158=%0 \D56D\BAA9=%1')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140485704129751774)
,p_name=>'WWV_FLOW.UNABLE_TO_STOP_TRACE_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('\CD94\C801\C744 \C815\C9C0\D560 \C218 \C5C6\C74C: %0')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140482988816751773)
,p_name=>'WWV_FLOW.UNEXPECTED_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C608\C0C1\CE58 \C54A\C740 \C624\B958')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140493740892751776)
,p_name=>'WWV_FLOW.UPDATE_SUB_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('update_substitution_cache\C5D0 \C624\B958 \BC1C\C0DD: %0')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140485851954751774)
,p_name=>'WWV_FLOW.VIEW_HELP_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('\B3C4\C6C0\B9D0\C744 \BCF4\B824\BA74 \C560\D50C\B9AC\CF00\C774\C158 \BC0F \D398\C774\C9C0\B97C \C81C\ACF5\D574\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140507539204751780)
,p_name=>'WWV_FLOW_AUTOMATION.AUTOMATION_NOT_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('\C790\B3D9\D654\B97C \CC3E\C744 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140443014329751761)
,p_name=>'WWV_FLOW_AUTOMATION.QUERY_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C790\B3D9\D654 \C9C8\C758 \C624\B958: %0')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140486937170751774)
,p_name=>'WWV_FLOW_CACHE.PURGE_SESSION'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\AC1C\C758 \C138\C158\C774 \BE44\C6CC\C84C\C2B5\B2C8\B2E4.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140428238709751757)
,p_name=>'WWV_FLOW_CODE_EXEC_MLE.LANGUAGE_NOT_SUPPORTED'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \CF54\B4DC\B97C \C2E4\D589\D560 \C218 \C5C6\C2B5\B2C8\B2E4. \B370\C774\D130\BCA0\C774\C2A4\C5D0\C11C \C9C0\C6D0\B418\C9C0 \C54A\C73C\BA70 \C778\C2A4\D134\C2A4 \B9E4\AC1C\BCC0\C218 MLE_LANGUAGES\C5D0 \C758\D574 \C0AC\C6A9\C73C\B85C \C124\C815\B418\C5B4 \C788\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140425880684751756)
,p_name=>'WWV_FLOW_CODE_EXEC_MLE.MLE_NOT_SUPPORTED'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\AD6D\C5B4 \C5D4\C9C4\C740 \C774 \B370\C774\D130\BCA0\C774\C2A4 \BC84\C804\C5D0\C11C \C0AC\C6A9\D560 \C218 \C5C6\C2B5\B2C8\B2E4!')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140465039391751768)
,p_name=>'WWV_FLOW_COLLECTION.ARRAY_NOT_NULL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C560\D50C\B9AC\CF00\C774\C158 \BAA8\C74C \BC30\C5F4\C740 \B110\C774\BA74 \C548\B429\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140464886084751767)
,p_name=>'WWV_FLOW_COLLECTION.ATTRIBUTE_NUMBER_OUTSIDE_RANGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\C815\B41C \BA64\BC84 \C18D\C131 \BC88\D638 %0\C740(\B294) \BD80\C801\D569\D569\B2C8\B2E4. \C18D\C131 \BC88\D638\B294 1\ACFC %1 \C0AC\C774\C5EC\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140465385061751768)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_EXISTS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C560\D50C\B9AC\CF00\C774\C158 \BAA8\C74C\C774 \C874\C7AC\D569\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140465122977751768)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NAME_NOT_NULL'
,p_message_language=>'ko'
,p_message_text=>unistr('\BAA8\C74C \C774\B984\C740 \B110\C77C \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140465288942751768)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NAME_TOO_LARGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\BAA8\C74C \C774\B984\C740 255\C790\B97C \CD08\ACFC\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140464682962751767)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NOT_EXIST'
,p_message_language=>'ko'
,p_message_text=>unistr('\C560\D50C\B9AC\CF00\C774\C158 \BAA8\C74C %0\C774(\AC00) \C874\C7AC\D558\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140465410188751768)
,p_name=>'WWV_FLOW_COLLECTION.CURSOR_NOT_OPEN'
,p_message_language=>'ko'
,p_message_text=>unistr('\CEE4\C11C\AC00 \C544\C9C1 \C5F4\B824 \C788\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140464776801751767)
,p_name=>'WWV_FLOW_COLLECTION.MEMBER_NOT_EXIST'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\C560\D50C\B9AC\CF00\C774\C158 \BAA8\C74C %1\C5D0 \BA64\BC84 \C2DC\D000\C2A4 %0\C774(\AC00) \C874\C7AC\D558\C9C0 \C54A\C2B5\B2C8\B2E4.'),
''))
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140464922044751768)
,p_name=>'WWV_FLOW_COLLECTION.MEMBER_SEQUENCE_NUMBER_INVALID'
,p_message_language=>'ko'
,p_message_text=>unistr('\C560\D50C\B9AC\CF00\C774\C158 \BAA8\C74C "%1"\C5D0 \BA64\BC84 \C2DC\D000\C2A4 %0\C774(\AC00) \C874\C7AC\D558\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140417754462751754)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_ALGORITHM'
,p_message_language=>'ko'
,p_message_text=>unistr('ECDSA\C5D0 \B300\D574\C11C\B294 %0 \C54C\ACE0\B9AC\C998\C774 \C9C0\C6D0\B418\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140417481528751753)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_EC_CURVE'
,p_message_language=>'ko'
,p_message_text=>unistr('\D0C0\C6D0\D615 \ACE1\C120 %0\C740(\B294) \C9C0\C6D0\B418\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140543129509751791)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_FUNCTION'
,p_message_language=>'ko'
,p_message_text=>unistr('\C554\D638\D654 \D568\C218 "%0"\C740(\B294) \C774 \C2DC\C2A4\D15C\C5D0\C11C \C9C0\C6D0\B418\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140595422991751806)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_ACCESSIBLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C811\ADFC\C131 \D14C\C2A4\D2B8\B428')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140486494115751774)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_CLOSE'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2EB\AE30')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140486564111751774)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_CUST_OPT'
,p_message_language=>'ko'
,p_message_text=>unistr('\D398\C774\C9C0 \C0AC\C6A9\C790\C815\C758 \C635\C158')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140486675237751774)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_DEFAULT'
,p_message_language=>'ko'
,p_message_text=>unistr('\AE30\BCF8\AC12')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140486712490751774)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_DISP'
,p_message_language=>'ko'
,p_message_text=>unistr('\D45C\C2DC\B428')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140486850917751774)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_HIDDEN'
,p_message_language=>'ko'
,p_message_text=>unistr('\C228\AE40')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140486214218751774)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE1'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774 \D398\C774\C9C0\C5D0 \D3EC\D568\C2DC\D0A4\B824\B294 \C601\C5ED\C744 \C120\D0DD\D558\C2ED\C2DC\C624. \C801\C808\D55C \C560\D50C\B9AC\CF00\C774\C158 \CEE8\D14D\C2A4\D2B8\C5D0 \C788\C9C0 \C54A\AC70\B098 \C801\C808\D55C \AD8C\D55C\C774 \C5C6\B294 \ACBD\C6B0 \C120\D0DD\B41C \C601\C5ED\C774 \D45C\C2DC\B418\C9C0 \C54A\C744 \C218 \C788\C2B5\B2C8\B2E4.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140486306128751774)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE2'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774 \D398\C774\C9C0\B294 \C0AC\C6A9\C790\AC00 \C815\C758\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140595707115751806)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE3'
,p_message_language=>'ko'
,p_message_text=>unistr('\D14C\B9C8 \C2A4\D0C0\C77C\C744 \BCC0\ACBD\D558\C5EC \C774 \C560\D50C\B9AC\CF00\C774\C158\C758 \BAA8\C591\C744 \AC1C\C778 \C124\C815\D560 \C218 \C788\C2B5\B2C8\B2E4. \C544\B798 \BAA9\B85D\C5D0\C11C \D14C\B9C8 \C2A4\D0C0\C77C\C744 \C120\D0DD\D558\ACE0 \BCC0\ACBD\C0AC\D56D \C801\C6A9\C744 \B204\B974\C2ED\C2DC\C624.')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140596501009751806)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_REGION_DISP'
,p_message_language=>'ko'
,p_message_text=>unistr('\C601\C5ED \D45C\C2DC')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140595654548751806)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_REMOVE_STYLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C560\D50C\B9AC\CF00\C774\C158 \AE30\BCF8 \C2A4\D0C0\C77C \C0AC\C6A9')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140595560110751806)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_THEME_STYLE'
,p_message_language=>'ko'
,p_message_text=>unistr('\BAA8\C591 ')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140539737260751790)
,p_name=>'WWV_FLOW_DATA_EXPORT.AGG_COLUMN_IDX_NOT_EXIST'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C9D1\ACC4\C5D0\C11C \CC38\C870\B41C \C5F4 \C778\B371\C2A4\AC00 \C874\C7AC\D558\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140432425344751758)
,p_name=>'WWV_FLOW_DATA_EXPORT.APPEND_NOT_SUPPORTED'
,p_message_language=>'ko'
,p_message_text=>unistr('\B370\C774\D130 \C775\C2A4\D3EC\D2B8 \CD94\AC00\B294 %0 \D615\C2DD\C73C\B85C \C9C0\C6D0\B418\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140395469802751747)
,p_name=>'WWV_FLOW_DATA_EXPORT.CLOB_NOT_SUPPORTED'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \D615\C2DD\C5D0 \B300\D574\C11C\B294 CLOB \CD9C\B825\C774 \C9C0\C6D0\B418\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705111
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140539482148751790)
,p_name=>'WWV_FLOW_DATA_EXPORT.COLUMN_BREAK_MUST_BE_IN_THE_BEGGINING'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F4 \AD6C\BD84\C120\C740 \C5F4 \BC30\C5F4\C758 \CC98\C74C\C5D0 \C788\C5B4\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140539531170751790)
,p_name=>'WWV_FLOW_DATA_EXPORT.COLUMN_GROUP_IDX_NOT_EXIST'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C5D0\C11C \CC38\C870\B41C \C5F4 \ADF8\B8F9 \C778\B371\C2A4\AC00 \C874\C7AC\D558\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140446671414751762)
,p_name=>'WWV_FLOW_DATA_EXPORT.EXPORT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C775\C2A4\D3EC\D2B8')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140453850792751764)
,p_name=>'WWV_FLOW_DATA_EXPORT.FORMAT_MUST_BE_XML'
,p_message_language=>'ko'
,p_message_text=>unistr('\C775\C2A4\D3EC\D2B8 \D615\C2DD\C740 ORDS\B97C \C778\C1C4 \C11C\BC84\B85C \C0AC\C6A9\D558\B294 XML\C774\C5B4\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140539803194751790)
,p_name=>'WWV_FLOW_DATA_EXPORT.HIGHLIGHT_COLUMN_IDX_NOT_EXIST'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \AC15\C870 \D45C\C2DC\C5D0\C11C \CC38\C870\B41C \C5F4 \C778\B371\C2A4\AC00 \C874\C7AC\D558\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140443234281751761)
,p_name=>'WWV_FLOW_DATA_EXPORT.INVALID_FORMAT'
,p_message_language=>'ko'
,p_message_text=>unistr('\BD80\C801\D569\D55C \C775\C2A4\D3EC\D2B8 \D615\C2DD: %0')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140539679722751790)
,p_name=>'WWV_FLOW_DATA_EXPORT.PARENT_GROUP_IDX_NOT_EXIST'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C5D0\C11C \CC38\C870\B41C \C0C1\C704 \ADF8\B8F9 \C778\B371\C2A4\AC00 \C874\C7AC\D558\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140564853428751797)
,p_name=>'WWV_FLOW_DATA_LOADER.CANNOT_LOAD_INTO_GENERATED_ALWAYS_COLUMN'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \D14C\C774\BE14\C758 %1 \C5F4\C740 "GENERATED ALWAYS" ID \C5F4\C785\B2C8\B2E4. \AD6C\C131 \B300\D654\C0C1\C790\C5D0\C11C %1 \C5F4\C5D0 \B9E4\D551\B41C \C18C\C2A4 \C5F4\C774 \C5C6\B294\C9C0 \D655\C778\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140476436379751771)
,p_name=>'WWV_FLOW_DATA_LOADER.COMMIT_INTERVAL_TOO_LOW'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\C815\B41C \CEE4\BC0B \AC04\ACA9\C774 \B108\BB34 \B0AE\C2B5\B2C8\B2E4.')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140476520921751771)
,p_name=>'WWV_FLOW_DATA_LOADER.NO_COLUMNS_PROVIDED'
,p_message_language=>'ko'
,p_message_text=>unistr('\B370\C774\D130 \B85C\B4DC\C5D0 \B300\D574 \C81C\ACF5\B41C \C5F4\C774 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140477831590751771)
,p_name=>'WWV_FLOW_DATA_PARSER.NO_COLUMNS_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('\D589 \C120\D0DD\AE30 "%0"\C5D0 \B300\D55C \C5F4\C744 \CC3E\C744 \C218 \C5C6\C2B5\B2C8\B2E4. \C790\B3D9 \AC10\C9C0\B97C \C2DC\B3C4\D558\AC70\B098 JSON \AD6C\C870\B97C \AC80\D1A0\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140487271713751774)
,p_name=>'WWV_FLOW_DATA_PARSER.NO_WORKSHEETS_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('XLSX \D30C\C77C\C5D0\C11C \C6CC\D06C\C2DC\D2B8\B97C \CC3E\C744 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140432387187751758)
,p_name=>'WWV_FLOW_DATA_PARSER.REQUESTED_HIERARCHY_LEVELS_EXCEED_MAXIMUM'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC80\C0C9\D558\B3C4\B85D \C694\CCAD\B41C \ACC4\CE35 \B808\BCA8(%0)\C774 \CD5C\B300\AC12 %1\C744(\B97C) \CD08\ACFC\D569\B2C8\B2E4.')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140487147666751774)
,p_name=>'WWV_FLOW_DATA_PARSER.WORKSHEET_DOES_NOT_EXIST'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C0\C815\B41C \C6CC\D06C\C2DC\D2B8\AC00 XLSX \D30C\C77C\C5D0 \C874\C7AC\D558\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140465528413751768)
,p_name=>'WWV_FLOW_DML.VERSION_OF_DATA_CHANGED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AC\C6A9\C790\AC00 \C5C5\B370\C774\D2B8 \D504\B85C\C138\C2A4\B97C \C2DC\C791\D588\C73C\BBC0\B85C \B370\C774\D130\BCA0\C774\C2A4\C5D0 \C788\B294 \B370\C774\D130\C758 \D604\C7AC \BC84\C804\C774 \BCC0\ACBD\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140468407414751769)
,p_name=>'WWV_FLOW_EDIT_REPORT.ERR_UPDATING_COLS'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\ACE0\C11C \C5F4\C744 \C5C5\B370\C774\D2B8\D558\B294 \C911 \C624\B958 \BC1C\C0DD: %0')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140578950212751801)
,p_name=>'WWV_FLOW_EXEC.CANNOT_CONVERT_TO_SDOGEOMETRY'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C744(\B97C) SDO_GEOMETRY\B85C \BCC0\D658\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140515484556751783)
,p_name=>'WWV_FLOW_EXEC.CAN_NOT_CONVERT_TO_VARCHAR2'
,p_message_language=>'ko'
,p_message_text=>unistr('\B370\C774\D130 \C720\D615\C774 %1\C778 %0 \C5F4\C740 VARCHAR2\B85C \BCC0\D658\D560 \C218 \C5C6\C2B5\B2C8\B2E4!')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140522895479751785)
,p_name=>'WWV_FLOW_EXEC.COLUMN_NOT_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('"%1" \C18D\C131\C5D0 \B300\D574 \C9C0\C815\B41C "%0" \C5F4\C744 \B370\C774\D130 \C18C\C2A4\C5D0\C11C \CC3E\C744 \C218 \C5C6\C2B5\B2C8\B2E4!')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140458975783751766)
,p_name=>'WWV_FLOW_EXEC.FILTER_NOT_SUPPORTED_WITH_MULTIPLE_VALUES'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C911 \AC12 \C5F4\C5D0 \B300\D574\C11C\B294 \D544\D130 \C720\D615 %0\C774(\AC00) \C9C0\C6D0\B418\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140582425672751802)
,p_name=>'WWV_FLOW_EXEC.INVALID_BETWEEN_FILTER'
,p_message_language=>'ko'
,p_message_text=>unistr('"\B2E4\C74C \C0AC\C774" \D544\D130\AC00 \BD80\C801\D569\D569\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140438094911751760)
,p_name=>'WWV_FLOW_EXEC.INVALID_COLUMN_OR_ROW_DATATYPE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F4 %0, \D589 \BC88\D638 %1\C5D0\C11C %2 \AC12\C744 \CC3E\C744 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140434722412751759)
,p_name=>'WWV_FLOW_EXEC.INVALID_COLUMN_OR_ROW_REFERENCE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F4 %0 \B610\B294 \D589 \BC88\D638 %1\C774(\AC00) \C874\C7AC\D558\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140421320423751755)
,p_name=>'WWV_FLOW_EXEC.INVALID_LOV_SPECIFICATION'
,p_message_language=>'ko'
,p_message_text=>unistr('\BD80\C801\D569\D55C LOV \C720\D615\C774 \C9C0\C815\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140421263589751755)
,p_name=>'WWV_FLOW_EXEC.INVALID_QUERY_TYPE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C8\C758 \C720\D615\C774 \BD80\C801\D569\D569\B2C8\B2E4. \C9C8\C758 \C720\D615\C740 \D14C\C774\BE14, SQL \C9C8\C758 \B610\B294 SQL \C9C8\C758\B97C \BC18\D658\D558\B294 PL/SQL \D568\C218\C5EC\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140515536256751783)
,p_name=>'WWV_FLOW_EXEC.INVALID_SQL_QUERY'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('SQL \C9C8\C758 \AD6C\BB38\BD84\C11D \C2E4\D328!'),
'%0'))
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140522979474751785)
,p_name=>'WWV_FLOW_EXEC.LEGACY_COLUMN_NOT_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('"%1" \C18D\C131\C5D0 \B300\D574 \C9C0\C815\B41C \C5F4 \C704\CE58 %0\C744(\B97C) SQL \BB38\C5D0\C11C \CC3E\C744 \C218 \C5C6\C2B5\B2C8\B2E4!')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140412989793751752)
,p_name=>'WWV_FLOW_EXEC.MULTI_VALUE_TOO_MANY_ITEMS'
,p_message_language=>'ko'
,p_message_text=>unistr('\B2E4\C911 \AC12 \D544\D130\C5D0 \B108\BB34 \B9CE\C740 \D56D\BAA9\C774 \C0AC\C6A9\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140522780889751785)
,p_name=>'WWV_FLOW_EXEC.NO_COLUMN_FOR_ATTRIBUTE'
,p_message_language=>'ko'
,p_message_text=>unistr('"%0" \C18D\C131\C5D0 \B300\D574 \C9C0\C815\B41C \C5F4\C774 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140421140094751755)
,p_name=>'WWV_FLOW_EXEC.NULL_QUERY_RETURNED_BY_FUNCTION'
,p_message_language=>'ko'
,p_message_text=>unistr('PL/SQL \D568\C218 \BCF8\BB38\C774 \AC12\C744 \BC18\D658\D558\C9C0 \C54A\C558\C2B5\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140538537641751789)
,p_name=>'WWV_FLOW_EXEC.OPERATION_NOT_PRESENT_IN_WEB_SRC_MODULE'
,p_message_language=>'ko'
,p_message_text=>unistr('REST \B370\C774\D130 \C18C\C2A4\C5D0 \C694\CCAD\B41C DML \C791\C5C5\C744 \CC98\B9AC\D558\AE30 \C704\D55C \C791\C5C5\C774 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140580295477751802)
,p_name=>'WWV_FLOW_EXEC.RANGE_BUCKET.NOT.SUPPORTED'
,p_message_language=>'ko'
,p_message_text=>unistr('\BC94\C704 \D544\D130\B294 NUMBER, DATE \B610\B294 TIMESTAMP \B370\C774\D130 \C720\D615\C5D0\B9CC \C9C0\C6D0\B429\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140401182976751749)
,p_name=>'WWV_FLOW_EXEC.REST_REQUEST_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('%0(\C73C)\B85C \C778\D574 \C694\CCAD\C744 \C2E4\D328\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705114
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140404613641751750)
,p_name=>'WWV_FLOW_EXEC.SPATIAL_JSON_NOT_AVAILABLE'
,p_message_language=>'ko'
,p_message_text=>unistr('GeoJSON\C5D0\C11C SDO_GEOMETRY\B85C\C758 \BCC0\D658(\C5F4 %0)\C740 \C774 \B370\C774\D130\BCA0\C774\C2A4\C5D0\C11C \C81C\ACF5\B418\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705115
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140408069946751751)
,p_name=>'WWV_FLOW_EXEC.SPATIAL_NOT_SUPPORTED_FOR_XML'
,p_message_language=>'ko'
,p_message_text=>unistr('SDO_GEOMETRY \BCC0\D658(\C5F4 %0)\C740 XML \B370\C774\D130 \C18C\C2A4\C5D0 \C9C0\C6D0\B418\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140432177032751758)
,p_name=>'WWV_FLOW_EXEC.UNSUPPPORTED_MULTI_VALUE_SEPARATOR'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \BB38\C790\B294 \B2E4\C911 \AC12 \AD6C\BD84 \AE30\D638\B85C \C9C0\C6D0\B418\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140580312526751802)
,p_name=>'WWV_FLOW_EXEC.WRONG_CONTEXT_TYPE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774 \D568\C218\B294 \C9C8\C758 \CEE8\D14D\C2A4\D2B8\C5D0 \C0AC\C6A9\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140408175438751751)
,p_name=>'WWV_FLOW_EXEC_API.INVALID_DATA_TYPE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F4 \B370\C774\D130 \C720\D615\C774 \C77C\CE58\D558\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140441635773751761)
,p_name=>'WWV_FLOW_EXEC_DOC_SRC.REMOTE_MULTI_ROW_DML_NOT_SUPPORTED_WITHOUT_JSON_BINDS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774 \B370\C774\D130 \C18C\C2A4\B294 \B2E4\C911 \D589 \BCC0\ACBD\C744 \C9C0\C6D0\D558\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705123
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140421048966751755)
,p_name=>'WWV_FLOW_EXEC_REMOTE.ORDS_OUT_BIND_LIMIT_EXCEEDED'
,p_message_language=>'ko'
,p_message_text=>unistr('\B0B4\BD80 ORDS OUT \BC14\C778\B4DC \C81C\D55C\C774 \CD08\ACFC\B418\C5C8\C2B5\B2C8\B2E4. DML \D589 \C218\B97C \C904\C774\C2ED\C2DC\C624.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140523777351751785)
,p_name=>'WWV_FLOW_EXEC_REMOTE.RESPONSE_PARSING_ERROR'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\C6D0\ACA9 \C11C\BC84\B85C\BD80\D130\C758 JSON \C751\B2F5\C744 \AD6C\BB38\BD84\C11D\D560 \C218 \C5C6\C2B5\B2C8\B2E4. '),
'%0'))
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140420954450751755)
,p_name=>'WWV_FLOW_EXEC_REMOTE.RUN_PLSQL_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C54C \C218 \C5C6\AC70\B098 \C798\BABB\B41C \CEE8\D14D\C2A4\D2B8 \C720\D615\C785\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140445077687751762)
,p_name=>'WWV_FLOW_EXPORT_INT.UNSUPPORTED_READABLE_EXPORT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C77D\AE30 \AC00\B2A5\D55C \C775\C2A4\D3EC\D2B8\C5D0 \C9C0\C6D0\B418\C9C0 \C54A\B294 \AD6C\C131\C694\C18C: %0')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140543083003751791)
,p_name=>'WWV_FLOW_FILE_PARSER.UNKNOWN_FILE_TYPE'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774 \D30C\C77C \C720\D615\C740 \AD6C\BB38 \BD84\C11D\AE30\C5D0\C11C \C9C0\C6D0\B418\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140493875628751776)
,p_name=>'WWV_FLOW_FND_DEVELOPER_API.CREDENTIALS_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C778\C99D\B418\C9C0 \C54A\C740 \C561\C138\C2A4\C785\B2C8\B2E4. (wwv_flow_api.set_credentials\AC00 \C124\C815\B418\C9C0 \C54A\C74C)')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140468769009751769)
,p_name=>'WWV_FLOW_FND_USER_API.CREATE_COMPANY'
,p_message_language=>'ko'
,p_message_text=>unistr('\C874\C7AC\D558\B294 \C791\C5C5\C601\C5ED\C774\BBC0\B85C \C0DD\C131\B418\C9C0 \C54A\C558\C2B5\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140468672909751769)
,p_name=>'WWV_FLOW_FND_USER_API.CREATE_USER_GROUP'
,p_message_language=>'ko'
,p_message_text=>unistr('\C874\C7AC\D558\B294 \C0AC\C6A9\C790 \ADF8\B8F9\C774\BBC0\B85C \C0DD\C131\B418\C9C0 \C54A\C558\C2B5\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140480094075751772)
,p_name=>'WWV_FLOW_FND_USER_API.DUP_USER'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C5D0 \B300\D574 \C911\BCF5\B41C \C0AC\C6A9\C790 \C774\B984\C774 \BC1C\ACAC\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140480189675751772)
,p_name=>'WWV_FLOW_FND_USER_API.LOAD_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AC\C6A9\C790\B97C \B85C\B4DC\D558\B294 \C911 \C624\B958\AC00 \BC1C\C0DD\D588\C2B5\B2C8\B2E4. %0 \C0AC\C6A9\C790\C5D0 \B300\D574 \C2E4\D328\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140490989012751775)
,p_name=>'WWV_FLOW_FND_USER_API.T_MESSAGE'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\BA85\C758 \C0AC\C6A9\C790\B97C \B85C\B4DC\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140490733522751775)
,p_name=>'WWV_FLOW_FND_USER_API.T_PASSWORD'
,p_message_language=>'ko'
,p_message_text=>unistr('\BE44\BC00\BC88\D638')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140490874099751775)
,p_name=>'WWV_FLOW_FND_USER_API.T_PRIVILEGE'
,p_message_language=>'ko'
,p_message_text=>unistr('\AD8C\D55C')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140490555988751775)
,p_name=>'WWV_FLOW_FND_USER_API.T_USERNAME'
,p_message_language=>'ko'
,p_message_text=>unistr('\C0AC\C6A9\C790 \C774\B984')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140570914070751799)
,p_name=>'WWV_FLOW_FORM.UNHANDLED_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\D398\C774\C9C0 \D56D\BAA9 "#COMPONENT_NAME#"\C744 \B80C\B354\B9C1\D558\B294 \C911 \C624\B958\AC00 \BC1C\C0DD\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140485948939751774)
,p_name=>'WWV_FLOW_FORMS.FORM_NOT_OPEN_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('HTML \D3FC\C774 \C544\C9C1 \C5F4\B9AC\C9C0 \C54A\C558\AE30 \B54C\BB38\C5D0 \D398\C774\C9C0 \D56D\BAA9\C744 \D45C\C2DC\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140444344811751761)
,p_name=>'WWV_FLOW_FORMS.ITEM_DEFAULT_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('\D398\C774\C9C0 \D56D\BAA9 #COMPONENT_NAME#\C5D0 \B300\D55C \D56D\BAA9 \AE30\BCF8\AC12\C744 \ACC4\C0B0\D558\B294 \C911 \C624\B958\AC00 \BC1C\C0DD\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140485260646751774)
,p_name=>'WWV_FLOW_FORMS.ITEM_POST_CALC_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('\D398\C774\C9C0 \D56D\BAA9 #COMPONENT_NAME#\C5D0 \B300\D55C \D56D\BAA9 \C0AC\D6C4 \ACC4\C0B0\C5D0\C11C \C624\B958\AC00 \BC1C\C0DD\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140485108671751774)
,p_name=>'WWV_FLOW_FORMS.ITEM_SOURCE_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('\D398\C774\C9C0 \D56D\BAA9 #COMPONENT_NAME#\C5D0 \B300\D55C \D56D\BAA9 \C18C\C2A4 \AC12\C744 \ACC4\C0B0\D558\B294 \C911 \C624\B958\AC00 \BC1C\C0DD\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140461969693751767)
,p_name=>'WWV_FLOW_HELP.UNAUTHORIZED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C778\C99D\B418\C9C0 \C54A\C740 \C561\C138\C2A4\C785\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140411482399751752)
,p_name=>'WWV_FLOW_INTERACTIVE_GRID.INVALID_JSON_ARRAY'
,p_message_language=>'ko'
,p_message_text=>unistr('%1\C758 %0 \AC12\C740 \C801\D569\D55C JSON \BC30\C5F4\C774 \C544\B2D9\B2C8\B2E4.')
,p_version_scn=>2705118
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140485455500751774)
,p_name=>'WWV_FLOW_ITEM.JS_NOT_SUPPORTED'
,p_message_language=>'ko'
,p_message_text=>unistr('JavaScript\AC00 \C9C0\C6D0\B418\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140485598189751774)
,p_name=>'WWV_FLOW_ITEM.LIST'
,p_message_language=>'ko'
,p_message_text=>unistr('\BAA9\B85D')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140486191055751774)
,p_name=>'WWV_FLOW_ITEM.UNABLE_INIT_QUERY'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C8\C758\B97C \CD08\AE30\D654\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140494169138751776)
,p_name=>'WWV_FLOW_ITEM.UPDATE_NOT_SUPPORTED_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C5C5\B370\C774\D2B8\B294 \C9C0\C6D0\B418\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140487609380751774)
,p_name=>'WWV_FLOW_ITEM_HELP.INVALID_ITEM_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('\BD80\C801\D569\D55C \D56D\BAA9 ID: %0 ')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140515302414751782)
,p_name=>'WWV_FLOW_ITEM_HELP.NO_HELP_EXISTS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774 \D56D\BAA9\C5D0 \B300\D55C \B3C4\C6C0\B9D0\C774 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140477117973751771)
,p_name=>'WWV_FLOW_JET_CHART.QUERY_GENERATION_FAILED'
,p_message_language=>'ko'
,p_message_text=>unistr('\CC28\D2B8 \C9C8\C758 \C0DD\C131\C744 \C2E4\D328\D588\C2B5\B2C8\B2E4. \C18C\C2A4 \BC0F \C5F4 \B9E4\D551 \C124\C815\C744 \D655\C778\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140478465843751772)
,p_name=>'WWV_FLOW_MAIL.ADD_ATTACHMENT.INVALID_MAIL_ID'
,p_message_language=>'ko'
,p_message_text=>unistr('p_mail_id \B9E4\AC1C\BCC0\C218\C5D0 \BD80\C801\D569\D55C \AC12: %0')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140515125201751782)
,p_name=>'WWV_FLOW_MAIL.CANNOT_USE_TO_OR_REPLYTO_AS_FROM'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5EC\B7EC \C804\C790\BA54\C77C \C8FC\C18C\AC00 \D3EC\D568\B418\C5B4 \C788\C5B4\C11C "\BC1B\B294 \C0AC\B78C" \B610\B294 "\D68C\C2E0 \B300\C0C1"\C744 "\BCF4\B0B8 \C0AC\B78C" \C8FC\C18C\B85C \C0AC\C6A9\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140600095118751807)
,p_name=>'WWV_FLOW_MAIL.EMAIL_LIMIT_EXCEEDED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C791\C5C5\C601\C5ED\B2F9 \CD5C\B300 \C804\C790\BA54\C77C \BA54\C2DC\C9C0 \C218\B97C \CD08\ACFC\D588\C2B5\B2C8\B2E4. \AD00\B9AC\C790\C5D0\AC8C \BB38\C758\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140456613075751765)
,p_name=>'WWV_FLOW_MAIL.INVALID_CONTEXT'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774 \D504\B85C\C2DC\C800\B294 \C560\D50C\B9AC\CF00\C774\C158 \C138\C158 \B0B4\C5D0\C11C \D638\CD9C\D574\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140478312255751771)
,p_name=>'WWV_FLOW_MAIL.PARAMETER_NULL'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \B9E4\AC1C\BCC0\C218\C5D0 \B300\D574 \B110 \AC12\C774 \C81C\ACF5\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140536440469751789)
,p_name=>'WWV_FLOW_MAIL.PREPARE_TEMPLATE.NO_DATA_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('%1 \C560\D50C\B9AC\CF00\C774\C158\C5D0\C11C \C804\C790\BA54\C77C \D15C\D50C\B9AC\D2B8 "%0"\C744(\B97C) \CC3E\C744 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140612914745751811)
,p_name=>'WWV_FLOW_MAIL.SMTP_HOST_ADDRESS_REQUIRED'
,p_message_language=>'ko'
,p_message_text=>unistr('\BA54\C77C\C744 \C804\C1A1\D558\B824\BA74 SMTP_HOST_ADDRESS \C778\C2A4\D134\C2A4 \B9E4\AC1C\BCC0\C218\B97C \C124\C815\D574\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705148
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140477781253751771)
,p_name=>'WWV_FLOW_MAIL.TO_IS_REQUIRED'
,p_message_language=>'ko'
,p_message_text=>unistr('\BA54\C77C\C744 \C804\C1A1\D558\B824\BA74 \BA54\C2DC\C9C0 \BC1B\B294 \C0AC\B78C\C744 \C785\B825\D574\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140602447683751808)
,p_name=>'WWV_FLOW_MAIL.UNABLE_TO_OPEN_SMTP_CONNECTION'
,p_message_language=>'ko'
,p_message_text=>unistr('\AD6C\C131\B41C \C804\C790\BA54\C77C \C11C\BC84\B97C \C0AC\C6A9\D558\C5EC SMTP \C811\C18D\C744 \C124\C815\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705145
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140577751178751801)
,p_name=>'WWV_FLOW_PLUGIN.INVALID_AJAX_CALL'
,p_message_language=>'ko'
,p_message_text=>unistr('Ajax \D638\CD9C\C774 \BD80\C801\D569\D569\B2C8\B2E4!')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140461689317751767)
,p_name=>'WWV_FLOW_PLUGIN.NO_AJAX_FUNCTION'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \D50C\B7EC\ADF8\C778\C5D0 \B300\D574 \C815\C758\B41C Ajax \D568\C218\AC00 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140568283126751798)
,p_name=>'WWV_FLOW_PLUGIN.NO_EXECUTION_FUNCTION'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \D50C\B7EC\ADF8\C778\C5D0 \B300\D574 \C815\C758\B41C \C2E4\D589 \D568\C218\AC00 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140461723222751767)
,p_name=>'WWV_FLOW_PLUGIN.NO_RENDER_FUNCTION'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \D50C\B7EC\ADF8\C778\C5D0 \B300\D574 \C815\C758\B41C \B80C\B354\B9C1 \D568\C218\AC00 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140578637890751801)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_CAPABILITIES_FUNCTION'
,p_message_language=>'ko'
,p_message_text=>unistr('REST \B370\C774\D130 \C18C\C2A4 \D50C\B7EC\ADF8\C778 "%0"\C5D0 "\AE30\B2A5" \D568\C218\AC00 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140578577670751801)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_DML_FUNCTION'
,p_message_language=>'ko'
,p_message_text=>unistr('REST \B370\C774\D130 \C18C\C2A4 \D50C\B7EC\ADF8\C778 "%0"\C5D0 DML \D568\C218\AC00 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140578720761751801)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_EXECUTE_FUNCTION'
,p_message_language=>'ko'
,p_message_text=>unistr('REST \B370\C774\D130 \C18C\C2A4 \D50C\B7EC\ADF8\C778 "%0"\C5D0\B294 \C2E4\D589 \D568\C218\AC00 \D3EC\D568\B418\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140578860383751801)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_FETCH_FUNCTION'
,p_message_language=>'ko'
,p_message_text=>unistr('REST \B370\C774\D130 \C18C\C2A4 \D50C\B7EC\ADF8\C778 "%0"\C5D0 \C778\CD9C \D568\C218\AC00 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140459198341751766)
,p_name=>'WWV_FLOW_PLUGIN.RUN_PLSQL_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('\D50C\B7EC\ADF8\C778 \CC98\B9AC \C911\C5D0 \BC1C\C0DD\D55C PLSQL \CF54\B4DC\C5D0 \C624\B958\AC00 \C788\C2B5\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140467761675751768)
,p_name=>'WWV_FLOW_PLUGIN_DEV.IS_REQUIRED'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC12\C744 \C9C0\C815\D574\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140500721626751778)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.CANT_CONVERT_TO_VARCHAR2'
,p_message_language=>'ko'
,p_message_text=>unistr('\B370\C774\D130 \C720\D615 %0\C740(\B294) VARCHAR2\B85C \BCC0\D658\D560 \C218 \C5C6\C2B5\B2C8\B2E4!')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140588953005751804)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.COLUMN_NOT_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('"%1" \C18D\C131\C5D0 \B300\D574 \C9C0\C815\B41C "%0" \C5F4\C744 SQL \BB38\C5D0\C11C \CC3E\C744 \C218 \C5C6\C2B5\B2C8\B2E4!')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140416226808751753)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.INVALID_JSON_ARRAY'
,p_message_language=>'ko'
,p_message_text=>unistr('%1\C758 %0 \AC12\C740 \C801\D569\D55C JSON \BC30\C5F4\C774 \C544\B2D9\B2C8\B2E4.')
,p_version_scn=>2705120
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140566194000751797)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.LOV_REQUIRED'
,p_message_language=>'ko'
,p_message_text=>unistr('LOV(\AC12 \BAA9\B85D) \C9C8\C758 \B610\B294 \C774\B984\C774 \C9C0\C815\B41C \AC12 \BAA9\B85D\C744 %0\C5D0 \B300\D574 \C9C0\C815\D574\C57C \D569\B2C8\B2E4.')
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140567738787751798)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.LOV_SQL_WRONG_COLUMN_COUNT'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C5D0 \B300\D574 LOV SQL \C9C8\C758\C5D0\C11C \C120\D0DD\B41C \C5F4 \C218\AC00 \C798\BABB\B418\C5C8\C2B5\B2C8\B2E4. \C801\D569\D55C \BA85\B839\BB38\C740 \C608\C81C\B97C \CC38\C870\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140588790856751804)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.NO_COLUMN_FOR_ATTRIBUTE'
,p_message_language=>'ko'
,p_message_text=>unistr('"%0" \C18D\C131\C5D0 \B300\D574 \C9C0\C815\B41C \C5F4\C774 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140617939740751813)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.NUMBER_ATTRIBUTE_VALUE_INVALID'
,p_message_language=>'ko'
,p_message_text=>unistr('"%1" \C18D\C131\C5D0 \C785\B825\D55C \AC12 %0\C740(\B294) \C22B\C790\AC00 \C544\B2D9\B2C8\B2E4.')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140571245599751799)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.SQL_WRONG_DATA_TYPE'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C758 SQL \BB38\C5D0\C11C \B370\C774\D130 \C720\D615\C774 \C798\BABB\B418\C5C8\C2B5\B2C8\B2E4. Column# %1\C740(\B294) %2\C778\B370 %3\C774(\AC00) \D544\C694\D569\B2C8\B2E4.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140588887989751804)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.WRONG_COLUMN_DATA_TYPE'
,p_message_language=>'ko'
,p_message_text=>unistr('"%1" \C18D\C131\C5D0 \B300\D574 \C9C0\C815\B41C "%0" \C5F4\C758 \B370\C774\D130 \C720\D615\C774 %2\C774\C9C0\B9CC %3\C774(\AC00) \D544\C694\D569\B2C8\B2E4.')
,p_version_scn=>2705144
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140458313931751766)
,p_name=>'WWV_FLOW_PRINT_UTIL.REPORT_LAYOUT_NOT_FOUND'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\ACE0\C11C \B808\C774\C544\C6C3\C744 \CC3E\C744 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140445955886751762)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTIONS_LIMIT_EXCEEDED'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C5D0 \B300\D55C \BC31\ADF8\B77C\C6B4\B4DC \C2E4\D589 \C81C\D55C\C774 \CD08\ACFC\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705124
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140396219508751747)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTION_ALREADY_RUNNING'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C758 \B2E4\B978 \C218\D589\C774 \C774\BBF8 \C2E4\D589\B418\ACE0 \C788\C2B5\B2C8\B2E4.')
,p_version_scn=>2705111
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140396180056751747)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTION_ALREADY_RUNNING_CTX'
,p_message_language=>'ko'
,p_message_text=>unistr('%0\C758 \B2E4\B978 \C218\D589\C774 %1 \CEE8\D14D\C2A4\D2B8\C5D0 \B300\D574 \C774\BBF8 \C2E4\D589\B418\ACE0 \C788\C2B5\B2C8\B2E4.')
,p_version_scn=>2705111
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140411111312751752)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.FILES_NOT_VISIBLE_IN_WORKING_SESSION'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5C5\B85C\B4DC\B41C \D30C\C77C\C774 %0 \C2E4\D589\C5D0 \B300\D55C \C791\C5C5 \C138\C158\C5D0\C11C \D45C\C2DC\B418\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140523662328751785)
,p_name=>'WWV_FLOW_RENDER_REPORT3.COMPUTE_SUM_NOT_SUPPORTED_FOR_WEB_SOURCES'
,p_message_language=>'ko'
,p_message_text=>unistr('REST \B370\C774\D130 \C18C\C2A4 \AE30\BC18 \BCF4\ACE0\C11C\C5D0\B294 \D569\ACC4 \ACC4\C0B0 \AE30\B2A5\C744 \C0AC\C6A9\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140485351832751774)
,p_name=>'WWV_FLOW_RENDER_SHORTCUT.UNABLE_SET_SHORT_VAL_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('ERR-2904 \B2E8\CD95\D0A4 \AC12\C744 \C124\C815\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140490309356751775)
,p_name=>'WWV_FLOW_RENDER_SHORTCUT.UNKNOWN_TYPE_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C624\B958: \C54C \C218 \C5C6\B294 \B2E8\CD95\D0A4 \C720\D615\C785\B2C8\B2E4.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140428064985751757)
,p_name=>'WWV_FLOW_SEARCH_API.TEXT_QUERY_TOO_LONG'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC80\C0C9 \C9C8\C758\AC00 \B108\BB34 \AE41\B2C8\B2E4.')
,p_version_scn=>2705122
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140479497129751772)
,p_name=>'WWV_FLOW_SECURITY.AUTH_SCHEME_FETCH_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \C560\D50C\B9AC\CF00\C774\C158\C5D0\C11C authentication_scheme\C744 \C778\CD9C\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140487419336751774)
,p_name=>'WWV_FLOW_SECURITY.COMPONENT_FETCH_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('%0 \AD6C\C131\C694\C18C\B97C \C778\CD9C\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140557790619751795)
,p_name=>'WWV_FLOW_SESSION_API.TENANT_ID_EXISTS'
,p_message_language=>'ko'
,p_message_text=>unistr('\D604\C7AC \C138\C158\C5D0 \B300\D55C \D14C\B10C\D2B8 ID\AC00 \C874\C7AC\D569\B2C8\B2E4.')
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140490627944751775)
,p_name=>'WWV_FLOW_USER_API.T_EMAIL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C804\C790\BA54\C77C')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140617489333751813)
,p_name=>'WWV_FLOW_WEB_SERVICES.AUTHENTICATION_FAILED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C778\C99D\C744 \C2E4\D328\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140518067124751783)
,p_name=>'WWV_FLOW_WEB_SERVICES.COOKIE_INVALID'
,p_message_language=>'ko'
,p_message_text=>unistr('apex_util.g_request_cookies\C5D0 \C124\C815\B41C \D558\B098 \C774\C0C1\C758 \CFE0\D0A4\C5D0 \BD80\C801\D569\D55C \AC12\C774 \D3EC\D568\B429\B2C8\B2E4.')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140499902581751778)
,p_name=>'WWV_FLOW_WEB_SERVICES.INVALID_UDDI_RESPONSE'
,p_message_language=>'ko'
,p_message_text=>unistr('UDDI \B808\C9C0\C2A4\D2B8\B9AC\C758 \C751\B2F5\C774 \BD80\C801\D569\D569\B2C8\B2E4.')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140459207544751766)
,p_name=>'WWV_FLOW_WEB_SERVICES.INVALID_WSDL'
,p_message_language=>'ko'
,p_message_text=>unistr('\C81C\ACF5\B41C URL\C774 \C801\D569\D55C WSDL \BB38\C11C\B97C \BC18\D658\D558\C9C0 \C54A\C558\C2B5\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140462012954751767)
,p_name=>'WWV_FLOW_WEB_SERVICES.MULTIPLE_SOAP'
,p_message_language=>'ko'
,p_message_text=>unistr('WSDL \BB38\C11C\C5D0 \C5EC\B7EC SOAP \BC14\C778\B529\C774 \D3EC\D568\B418\C5B4 \C788\C2B5\B2C8\B2E4. &PRODUCT_NAME.\C5D0\C11C\B294 SOAP \BC14\C778\B529\C774 \D558\B098\C778 WSDL\B9CC \C9C0\C6D0\D569\B2C8\B2E4. \C774 \C11C\BE44\C2A4\C5D0 \B300\D55C \CC38\C870 \C0DD\C131\C744 \ACC4\C18D\D558\B824\BA74 <b>\C218\B3D9\C73C\B85C \C6F9 \C11C\BE44\C2A4 \CC38\C870 \C0DD\C131</b>\C744 \B204\B974\C2ED\C2DC\C624.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140537634750751789)
,p_name=>'WWV_FLOW_WEB_SERVICES.NOT_XML'
,p_message_language=>'ko'
,p_message_text=>unistr('\C11C\BE44\C2A4\C758 \C751\B2F5\C774 XML\C774 \C544\B2D9\B2C8\B2E4.')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140617329351751813)
,p_name=>'WWV_FLOW_WEB_SERVICES.NO_VALID_OAUTH_TOKEN'
,p_message_language=>'ko'
,p_message_text=>unistr('OAuth \C561\C138\C2A4 \D1A0\D070\C774 \C0AC\C6A9\D560 \C218 \C5C6\AC70\B098 \B9CC\B8CC\B418\C5C8\C2B5\B2C8\B2E4.')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140581847667751802)
,p_name=>'WWV_FLOW_WEB_SERVICES.REQUEST_LIMIT_EXCEEDED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C791\C5C5\C601\C5ED\B2F9 \CD5C\B300 \C6F9 \C11C\BE44\C2A4 \C694\CCAD \C218\B97C \CD08\ACFC\D588\C2B5\B2C8\B2E4. \AD00\B9AC\C790\C5D0\AC8C \BB38\C758\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140617527679751813)
,p_name=>'WWV_FLOW_WEB_SERVICES.UNSUPPORTED_OAUTH_TOKEN'
,p_message_language=>'ko'
,p_message_text=>unistr('\C11C\BC84\AC00 \C9C0\C6D0\B418\C9C0 \C54A\B294 OAuth \D1A0\D070 \C720\D615\C73C\B85C \C751\B2F5\D588\C2B5\B2C8\B2E4.')
,p_version_scn=>2705151
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140461446209751766)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_NO_SOAP'
,p_message_language=>'ko'
,p_message_text=>unistr('WSDL \BB38\C11C\C5D0 \CC38\C870\B97C \CD94\AC00\D558\B294 \B370 \D544\C694\D55C SOAP \BC14\C778\B529\C774 \D3EC\D568\B418\C9C0 \C54A\C558\C2B5\B2C8\B2E4.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140456853094751765)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_REQUIRES_AUTH'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774 WSDL\C740 \C99D\BA85\C11C\B97C \D544\C694\B85C \D569\B2C8\B2E4. \C544\B798\C5D0 \C0AC\C6A9\C790 \C774\B984 \BC0F \BE44\BC00\BC88\D638\B97C \C81C\ACF5\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705125
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140467814296751768)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_UNHANDLED'
,p_message_language=>'ko'
,p_message_text=>unistr('\B80C\B354\B9C1 \C5D4\C9C4\C5D0\C11C WSDL \BB38\C11C\B97C \C778\C2DD\D558\C9C0 \BABB\D588\C2B5\B2C8\B2E4. \C774 \C11C\BE44\C2A4\C5D0 \B300\D55C \CC38\C870 \C0DD\C131\C744 \ACC4\C18D\D558\B824\BA74 <b>\C218\B3D9\C73C\B85C \C6F9 \C11C\BE44\C2A4 \CC38\C870 \C0DD\C131</b>\C744 \B204\B974\C2ED\C2DC\C624.')
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140540680525751790)
,p_name=>'WWV_FLOW_WIZARD_API.UPDATE_ERROR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5C5\B370\C774\D2B8\B97C \CC98\B9AC\D560 \C218 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705139
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140566433597751798)
,p_name=>'WWV_FLOW_WORKSHEET.LOV_DISPLAY_AND_RETURN_COLUMN_EQUAL'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC12 \BAA9\B85D\C758 \BC18\D658 \BC0F \D45C\C2DC \C5F4\C774 \B3D9\C77C\D569\B2C8\B2E4!')
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140566365575751797)
,p_name=>'WWV_FLOW_WORKSHEET.LOV_NO_RETURN_COLUMN'
,p_message_language=>'ko'
,p_message_text=>unistr('\AC12 \BAA9\B85D\C5D0 \BC18\D658 \C5F4\C774 \C5C6\C2B5\B2C8\B2E4.')
,p_version_scn=>2705142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140494043994751776)
,p_name=>'WWV_RENDER_REPORT3.COLUMN_VALUE_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C5F4 \AC12\C744 \C778\CD9C\D558\B294 \C911 \C624\B958 \BC1C\C0DD: %0')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140518954429751784)
,p_name=>'WWV_RENDER_REPORT3.DATA_TOO_OLD'
,p_message_language=>'ko'
,p_message_text=>unistr('\D604\C7AC \D45C \D615\C2DD \D3FC \B370\C774\D130\AC00 \B108\BB34 \C624\B798\B418\C5C8\C2B5\B2C8\B2E4. \C18C\C2A4 \B370\C774\D130\AC00 \C218\C815\B418\C5C8\C2B5\B2C8\B2E4.<br/> \BCC0\ACBD\C0AC\D56D\C744 \BB34\C2DC\D558\ACE0 \B370\C774\D130\BCA0\C774\C2A4\C5D0\C11C \B370\C774\D130\B97C \C7AC\B85C\B4DC\D558\B824\BA74 <strong><a href="%0">\C5EC\AE30</a></strong>\B97C \B204\B974\C2ED\C2DC\C624.')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140474149725751770)
,p_name=>'WWV_RENDER_REPORT3.ERR_DETERMINE_PAGINATION'
,p_message_language=>'ko'
,p_message_text=>unistr('\D398\C774\C9C0 \BC88\D638 \B9E4\AE40 \BB38\C790\C5F4\C744 \D655\C778\D558\B294 \C911 \C624\B958 \BC1C\C0DD')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140474063429751770)
,p_name=>'WWV_RENDER_REPORT3.ERR_DETERMINE_QUERY_HEADINGS'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\C9C8\C758 \BA38\B9AC\AE00\C744 \D655\C778\D560 \C218 \C5C6\C74C:'),
'%0'))
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140474272573751770)
,p_name=>'WWV_RENDER_REPORT3.ERR_REPORT_FOOTER'
,p_message_language=>'ko'
,p_message_text=>unistr('\BCF4\ACE0\C11C \BC14\B2E5\AE00\C744 \BC14\AFB8\B294 \C911 \C624\B958 \BC1C\C0DD')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140474365596751770)
,p_name=>'WWV_RENDER_REPORT3.FAILED_PARSING_QUERY'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('SQL \C9C8\C758 \AD6C\BB38\BD84\C11D \C2E4\D328:'),
'%0',
'%1'))
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140480407589751772)
,p_name=>'WWV_RENDER_REPORT3.FOUND_BUT_NOT_DISPLAYED'
,p_message_language=>'ko'
,p_message_text=>unistr('\C694\CCAD\B41C \CD5C\C18C \D589: %0, \AC80\C0C9\B418\C5C8\C9C0\B9CC \D45C\C2DC\B418\C9C0 \C54A\C740 \D589: %1')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140476838300751771)
,p_name=>'WWV_RENDER_REPORT3.HTML_USE_COLUMN_ALIAS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C8\C758 \C5F4 #%0(%1)\C774(\AC00) \BD80\C801\D569\D569\B2C8\B2E4. HTML\C744 \C0AC\C6A9\D558\B294 \C5F4\C5D0\B294 \BCC4\CE6D \C774\B984\C774 \D544\C694\D569\B2C8\B2E4.')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140493988217751776)
,p_name=>'WWV_RENDER_REPORT3.QUERY_HEADING_ERR'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C8\C758 \BA38\B9AC\AE00\C744 \AC00\C838\C624\B294 \C911 \C624\B958 \BC1C\C0DD: %0')
,p_version_scn=>2705131
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140474438818751770)
,p_name=>'WWV_RENDER_REPORT3.REPORT_ERROR'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\BCF4\ACE0\C11C \C624\B958:'),
'%0'))
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140514512979751782)
,p_name=>'WWV_RENDER_REPORT3.SORT_BY_THIS_COLUMN'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774 \C5F4\C744 \AE30\C900\C73C\B85C \C815\B82C')
,p_version_scn=>2705134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140476984814751771)
,p_name=>'WWV_RENDER_REPORT3.SYNTAX_ERROR'
,p_message_language=>'ko'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\C9C8\C758 \AD6C\BB38\C744 \BD84\C11D\D560 \C218 \C5C6\C2B5\B2C8\B2E4. \C9C8\C758 \AD6C\BB38\C744 \D655\C778\D558\C2ED\C2DC\C624.'),
'(%0)',
'</p>'))
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140519025602751784)
,p_name=>'WWV_RENDER_REPORT3.UNSAVED_DATA'
,p_message_language=>'ko'
,p_message_text=>unistr('\C774 \D3FC\C5D0\B294 \C800\C7A5\B418\C9C0 \C54A\C740 \BCC0\ACBD\C0AC\D56D\C774 \D3EC\D568\B429\B2C8\B2E4. \BCC0\ACBD\C0AC\D56D\C744 \C800\C7A5\D558\C9C0 \C54A\ACE0 \ACC4\C18D\D558\B824\BA74 "\D655\C778"\C744 \B204\B974\C2ED\C2DC\C624. ')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140523561747751785)
,p_name=>'WWV_RENDER_REPORT3.UNSUPPORTED_PAGINATION_SCHEME'
,p_message_language=>'ko'
,p_message_text=>unistr('\C120\D0DD\B41C \B370\C774\D130 \C18C\C2A4\C5D0\B294 \BCF4\ACE0\C11C \D398\C774\C9C0 \B9E4\AE40 \CCB4\ACC4(%0)\AC00 \C9C0\C6D0\B418\C9C0 \C54A\C2B5\B2C8\B2E4.')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140476789851751771)
,p_name=>'WWV_RENDER_REPORT3.USE_COLUMN_ALIAS'
,p_message_language=>'ko'
,p_message_text=>unistr('\C9C8\C758 \C5F4 #%0(%1)\C774(\AC00) \BD80\C801\D569\D569\B2C8\B2E4. \C5F4 \BCC4\CE6D\C744 \C0AC\C6A9\D558\C2ED\C2DC\C624.')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140480520020751772)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_MORE_THAN_Z'
,p_message_language=>'ko'
,p_message_text=>unistr('%0-%1/ %2\D589 \CD08\ACFC')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140521019400751784)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_MORE_THAN_Z_2'
,p_message_language=>'ko'
,p_message_text=>unistr('%2 \CD08\ACFC %0 - %1')
,p_version_scn=>2705136
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140480302095751772)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z'
,p_message_language=>'ko'
,p_message_text=>unistr('%0-%1/%2 \D589')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140461148037751766)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z_2'
,p_message_language=>'ko'
,p_message_text=>'%0-%1/%2'
,p_version_scn=>2705127
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140474592680751770)
,p_name=>'Y'
,p_message_language=>'ko'
,p_message_text=>unistr('\C608')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140481813536751773)
,p_name=>'YEAR'
,p_message_language=>'ko'
,p_message_text=>unistr('\B144')
,p_version_scn=>2705130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140473777436751770)
,p_name=>'YEARS'
,p_message_language=>'ko'
,p_message_text=>unistr('\B144')
,p_version_scn=>2705128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140519151505751784)
,p_name=>'YES'
,p_message_language=>'ko'
,p_message_text=>unistr('\C608')
,p_version_scn=>2705136
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
 p_id=>wwv_flow_imp.id(109678305570583962.4478)
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
 p_id=>1.4478
,p_name=>unistr('\BA54\C2DC\C9C0')
,p_alias=>'MESSAGES'
,p_step_title=>unistr('\BA54\C2DC\C9C0')
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
