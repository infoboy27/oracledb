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
,p_default_application_id=>4495
,p_default_id_offset=>0
,p_default_owner=>'APEX_240200'
);
end;
/
 
prompt APPLICATION 4495 - Oracle APEX Runtime Messages
--
-- Application Export:
--   Application:     4495
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
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'A144692803358759765')
,p_page_view_logging=>'YES'
,p_charset=>'utf-8'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt_last_reset=>'20250422180859'
,p_bookmark_checksum_function=>'SH1'
,p_compatibility_mode=>'24.2'
,p_session_state_commits=>'IMMEDIATE'
,p_flow_language=>'pt'
,p_flow_language_derived_from=>'SESSION'
,p_date_format=>'&DATE_FORMAT.'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(109678305570583962.4495)
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
 p_id=>wwv_flow_imp.id(4495)
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
 p_id=>wwv_flow_imp.id(728504220438374.4495)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SELECT_MANY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_values_as', 'separated')).to_clob
,p_version_scn=>7007816
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(736540203200530.4495)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_BOSS'
,p_version_scn=>243430877
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(800575880762576.4495)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'NATIVE_OPEN_AI_ASSISTANT'
,p_version_scn=>15457644
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2657043006125217.4495)
,p_plugin_type=>'PROCESS TYPE'
,p_plugin=>'NATIVE_GEOCODING'
,p_attribute_01=>'RELAX_HOUSE_NUMBER'
,p_version_scn=>117636987
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(110599941590099161.4495)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'default_icon', 'fa-star',
  'tooltip', '#VALUE#')).to_clob
,p_version_scn=>7007818
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(118481226255833028.4495)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_MAP_REGION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_vector_tile_layers', 'Y')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(123214098089478467.4495)
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
 p_id=>wwv_flow_imp.id(124389732573989299.4495)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_ADFBC'
,p_version_scn=>37165931336889
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(209516503264520988.4495)
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
 p_id=>wwv_flow_imp.id(285800719532138903.4495)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N')).to_clob
,p_version_scn=>7007823
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(649595203182764436.4495)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_style', 'SWITCH_CB',
  'off_value', 'N',
  'on_value', 'Y')).to_clob
,p_version_scn=>6539584
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1874744429444344138.4495)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'include_slider', 'N')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1941451863897626238.4495)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'actions_menu_structure', 'IG')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2027366558906572283.4495)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'mode', 'FULL')).to_clob
,p_version_scn=>7007824
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2120597162971751123.4495)
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
 p_id=>wwv_flow_imp.id(649613204592764515.4495)
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
 p_id=>wwv_flow_imp.id(850359229090693491.4495)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Wizard Dialog.pt'
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
 p_id=>wwv_flow_imp.id(293526110820992194.4495)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4495)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293526630547992195.4495)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4495)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293527171164992195.4495)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4495)
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
 p_id=>wwv_flow_imp.id(851037359784626333.4495)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Dialog.pt'
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
 p_id=>wwv_flow_imp.id(293473352245977306.4495)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4495)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293473882718977306.4495)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4495)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293474370844977307.4495)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4495)
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
 p_id=>wwv_flow_imp.id(851037631091626378.4495)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Edit Screen.pt'
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
 p_id=>wwv_flow_imp.id(2495515088702127.4495)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4495)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2496016567702127.4495)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4495)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2496522618702127.4495)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4495)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2497097895702127.4495)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4495)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2497562953702128.4495)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4495)
,p_name=>'Edit Screen Header'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2498085850702128.4495)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4495)
,p_name=>'Page Position 5'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2498553894702128.4495)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4495)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2499023066702128.4495)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4495)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2499516729702128.4495)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4495)
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
 p_id=>wwv_flow_imp.id(851039898661626389.4495)
,p_theme_id=>3
,p_name=>'APEX 5.0 - No Side Bar.pt'
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
 p_id=>wwv_flow_imp.id(2418665544706094.4495)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4495)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2419139140706094.4495)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4495)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2419660231706094.4495)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4495)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2420136000706094.4495)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4495)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2420617033706094.4495)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4495)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2421142368706094.4495)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4495)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2421629849706095.4495)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4495)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2422132460706095.4495)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4495)
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
 p_id=>wwv_flow_imp.id(851040471818626394.4495)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Right Side Bar.pt'
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
 p_id=>wwv_flow_imp.id(1537388880131854.4495)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4495)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1537880270131855.4495)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4495)
,p_name=>'Page Header (Position 3)'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1538315330131855.4495)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4495)
,p_name=>'Page Header (Position 4)'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1538840638131855.4495)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4495)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1539339441131855.4495)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4495)
,p_name=>'After Body'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1539830162131855.4495)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4495)
,p_name=>'Page Header (Position 1)'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1540338421131855.4495)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4495)
,p_name=>'Page Header (Position 2)'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1540832064131856.4495)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4495)
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
 p_id=>wwv_flow_imp.id(851041812938626395.4495)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Sign Up Wizard.pt'
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
 p_id=>wwv_flow_imp.id(115212309210289451.4495)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4495)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115212857712289451.4495)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4495)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115213340345289452.4495)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4495)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115213804331289452.4495)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4495)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115214317592289452.4495)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4495)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115214875819289453.4495)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4495)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115215325320289453.4495)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4495)
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
 p_id=>wwv_flow_imp.id(851042476105626395.4495)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Wizard Page.pt'
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
 p_id=>wwv_flow_imp.id(1485266589875353.4495)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4495)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1485734308875353.4495)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4495)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1486237142875354.4495)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4495)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1486735024875354.4495)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4495)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1487219028875354.4495)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4495)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1487770987875354.4495)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4495)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1488272041875354.4495)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4495)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1488725778875354.4495)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4495)
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
 p_id=>wwv_flow_imp.id(514381861202541059.4495)
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
 p_id=>wwv_flow_imp.id(514382190540541061.4495)
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
 p_id=>wwv_flow_imp.id(514382538845541061.4495)
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
 p_id=>wwv_flow_imp.id(620629666890811728.4495)
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
 p_id=>wwv_flow_imp.id(620629778318811745.4495)
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
 p_id=>wwv_flow_imp.id(868252865986181054.4495)
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
 p_id=>wwv_flow_imp.id(514338947870435171.4495)
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
 p_id=>wwv_flow_imp.id(2962385277500935.4495)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4495)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2962865718500935.4495)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4495)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2963338641500935.4495)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4495)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2963894582500935.4495)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4495)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2964329937500935.4495)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4495)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2964897214500936.4495)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4495)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2965324003500936.4495)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4495)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2965838011500936.4495)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4495)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2966328405500936.4495)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4495)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2966823859500936.4495)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4495)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2967325351500936.4495)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4495)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2967812485500936.4495)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4495)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2968377768500937.4495)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4495)
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
 p_id=>wwv_flow_imp.id(514343873675436760.4495)
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
 p_id=>wwv_flow_imp.id(32585474981747544.4495)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4495)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32585915750747544.4495)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4495)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32586471989747545.4495)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4495)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32586972270747545.4495)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4495)
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
 p_id=>wwv_flow_imp.id(771803843049318447.4495)
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
 p_id=>wwv_flow_imp.id(3207496127505978.4495)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4495)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3207907805505978.4495)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4495)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3208484941505978.4495)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4495)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3208991047505978.4495)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4495)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3209402462505979.4495)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4495)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3209972507505979.4495)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4495)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3210460159505979.4495)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4495)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3210935368505979.4495)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4495)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3211466566505979.4495)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4495)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3211956312505979.4495)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4495)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3212461962505979.4495)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4495)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3212966370505980.4495)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4495)
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
 p_id=>wwv_flow_imp.id(850406444708718383.4495)
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
 p_id=>wwv_flow_imp.id(2204663592232325.4495)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4495)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2205135519232325.4495)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4495)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2205694824232325.4495)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4495)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2206129075232325.4495)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4495)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2206618558232325.4495)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4495)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2207115910232326.4495)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4495)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2207688896232326.4495)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4495)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2208160700232326.4495)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4495)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2208614050232326.4495)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4495)
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
 p_id=>wwv_flow_imp.id(850442966147812557.4495)
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
 p_id=>wwv_flow_imp.id(3346988371508588.4495)
,p_plug_template_id=>wwv_flow_imp.id(850442966147812557.4495)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3347426198508588.4495)
,p_plug_template_id=>wwv_flow_imp.id(850442966147812557.4495)
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
 p_id=>wwv_flow_imp.id(856206049762521193.4495)
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
 p_id=>wwv_flow_imp.id(2526185270486606.4495)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4495)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2526610033486606.4495)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4495)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2527184084486606.4495)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4495)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2527626846486607.4495)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4495)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2528141078486607.4495)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4495)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2528637911486607.4495)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4495)
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
 p_id=>wwv_flow_imp.id(914802799655239969.4495)
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
 p_id=>wwv_flow_imp.id(88183211858816924.4495)
,p_plug_template_id=>wwv_flow_imp.id(914802799655239969.4495)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(88183732152816924.4495)
,p_plug_template_id=>wwv_flow_imp.id(914802799655239969.4495)
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
 p_id=>wwv_flow_imp.id(914803495164240003.4495)
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
 p_id=>wwv_flow_imp.id(3373447170510516.4495)
,p_plug_template_id=>wwv_flow_imp.id(914803495164240003.4495)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3373993086510516.4495)
,p_plug_template_id=>wwv_flow_imp.id(914803495164240003.4495)
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
 p_id=>wwv_flow_imp.id(915210356236972585.4495)
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
 p_id=>wwv_flow_imp.id(2899946654493378.4495)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4495)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2900442121493378.4495)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4495)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2900949359493378.4495)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4495)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2901467944493378.4495)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4495)
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
 p_id=>wwv_flow_imp.id(915371118115573423.4495)
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
 p_id=>wwv_flow_imp.id(2695578355491332.4495)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4495)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2696079816491332.4495)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4495)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2696558276491332.4495)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4495)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2697055726491332.4495)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4495)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2697581510491332.4495)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4495)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2698048732491333.4495)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4495)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2698576547491333.4495)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4495)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2699004772491333.4495)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4495)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2699557295491333.4495)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4495)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2700035673491333.4495)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4495)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2700500589491333.4495)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4495)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2701097053491333.4495)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4495)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2701554382491334.4495)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4495)
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
 p_id=>wwv_flow_imp.id(1274355059486017828.4495)
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
 p_id=>wwv_flow_imp.id(61232728057733462.4495)
,p_plug_template_id=>wwv_flow_imp.id(1274355059486017828.4495)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(61233207886733462.4495)
,p_plug_template_id=>wwv_flow_imp.id(1274355059486017828.4495)
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
 p_id=>wwv_flow_imp.id(514332014414430986.4495)
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
 p_id=>wwv_flow_imp.id(514332292784430987.4495)
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
 p_id=>wwv_flow_imp.id(860563697365629462.4495)
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
 p_id=>wwv_flow_imp.id(865273508717512144.4495)
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
 p_id=>wwv_flow_imp.id(908020362212234651.4495)
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
 p_id=>wwv_flow_imp.id(914818080687341593.4495)
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
 p_id=>wwv_flow_imp.id(851049711466639395.4495)
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
 p_id=>wwv_flow_imp.id(851054516889639461.4495)
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
 p_id=>wwv_flow_imp.id(851055225644639463.4495)
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
 p_id=>wwv_flow_imp.id(851056531929639482.4495)
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
 p_id=>wwv_flow_imp.id(914792024808213039.4495)
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
 p_id=>wwv_flow_imp.id(914792322768213043.4495)
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
 p_id=>wwv_flow_imp.id(915377874236666939.4495)
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
 p_id=>wwv_flow_imp.id(1041941432531249038.4495)
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
 p_id=>wwv_flow_imp.id(850683711614406253.4495)
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
 p_id=>wwv_flow_imp.id(851047536471633848.4495)
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
 p_id=>wwv_flow_imp.id(851047676005633854.4495)
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
 p_id=>wwv_flow_imp.id(851047684809633856.4495)
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
 p_id=>wwv_flow_imp.id(851047795461633856.4495)
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
 p_id=>wwv_flow_imp.id(860542631889572088.4495)
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
 p_id=>wwv_flow_imp.id(1321751941832424103.4495)
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
 p_id=>wwv_flow_imp.id(514333590213433126.4495)
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
 p_id=>wwv_flow_imp.id(649611704621764507.4495)
,p_page_name=>'winlov'
,p_page_title=>unistr('Caixa de Di\00E1logo Pesquisar')
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
,p_find_button_text=>'Pesquisar'
,p_find_button_attr=>'class="a-Button a-Button--hot a-Button--padLeft"'
,p_close_button_text=>'Fechar'
,p_close_button_attr=>'class="a-Button u-pullRight"'
,p_next_button_text=>'Seguinte &gt;'
,p_next_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_prev_button_text=>'&lt; Anterior'
,p_prev_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'380'
,p_height=>'480'
,p_result_row_x_of_y=>'<div class="a-PopupLOV-pagination">Linha(s) #FIRST_ROW# - #LAST_ROW#</div>'
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
 p_id=>wwv_flow_imp.id(649611609668764506.4495)
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
 p_id=>wwv_flow_imp.id(182005134783173294.4495)
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
 p_id=>wwv_flow_imp.id(666074212329754757.4495)
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
 p_id=>wwv_flow_imp.id(666074525535755551.4495)
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
 p_id=>wwv_flow_imp.id(717250289307903026.4495)
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
 p_id=>wwv_flow_imp.id(2336377640986141.4495)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL'
,p_display_name=>'Heading Level'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(806925000765340952.4495)
,p_theme_id=>3
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default - No Icons'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808380142596819918.4495)
,p_theme_id=>3
,p_name=>'ALTERNATING_TABLE_ROWS'
,p_display_name=>'Alternating Table Rows'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Enable'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808380828683819918.4495)
,p_theme_id=>3
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Disable'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808381542095819918.4495)
,p_theme_id=>3
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default Border'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808383088145819924.4495)
,p_theme_id=>3
,p_name=>'REPORT_WIDTH'
,p_display_name=>'Report Width'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850406791580718389.4495)
,p_theme_id=>3
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850407096779718396.4495)
,p_theme_id=>3
,p_name=>'REGION_PADDING'
,p_display_name=>'Region Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Padding'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850407509193718398.4495)
,p_theme_id=>3
,p_name=>'REGION_STYLE'
,p_display_name=>'Region Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Style'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(851050160062639437.4495)
,p_theme_id=>3
,p_name=>'BADGE_LAYOUT'
,p_display_name=>'Badge Layout'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(851051045625639457.4495)
,p_theme_id=>3
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856113214217058023.4495)
,p_theme_id=>3
,p_name=>'HEIGHT'
,p_display_name=>'Height'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856114568019058024.4495)
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
 p_id=>wwv_flow_imp.id(856114830529058024.4495)
,p_theme_id=>3
,p_name=>'FORM_LABEL_WIDTH'
,p_display_name=>'Form Label Width'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856115135223058024.4495)
,p_theme_id=>3
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Not Part of Button Set'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116214022058024.4495)
,p_theme_id=>3
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>1
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116523282058024.4495)
,p_theme_id=>3
,p_name=>'FORM_LABEL_POSITION'
,p_display_name=>'Form Label Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116798725058025.4495)
,p_theme_id=>3
,p_name=>'BUTTON_SIZE'
,p_display_name=>'Button Size'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Button Size'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117102944058028.4495)
,p_theme_id=>3
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing left'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Left Spacing'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117454663058028.4495)
,p_theme_id=>3
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Right Spacing'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117908453058029.4495)
,p_theme_id=>3
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Icon on Right'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856118261810058029.4495)
,p_theme_id=>3
,p_name=>'BUTTON_TYPE'
,p_display_name=>'Button Type'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856206461450521195.4495)
,p_theme_id=>3
,p_name=>'ALERT_TYPE'
,p_display_name=>'Alert Type'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856206736628521198.4495)
,p_theme_id=>3
,p_name=>'DISPLAY'
,p_display_name=>'Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(860570508910721307.4495)
,p_theme_id=>3
,p_name=>'REGION_POSITION'
,p_display_name=>'Region Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(860571060920721309.4495)
,p_theme_id=>3
,p_name=>'REGION_OVERFLOW'
,p_display_name=>'Region Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(908020718209234676.4495)
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
 p_id=>wwv_flow_imp.id(1487577187426769.4495)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden to Assistive Tech'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4495)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4495)
,p_template_types=>'REGION'
,p_help_text=>'By default, region title is hidden but accessible, use this option to remove the header from accessible interface'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2336635141996782.4495)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H1'
,p_display_name=>'H1'
,p_display_sequence=>10
,p_css_classes=>'js-headingLevel-1'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4495)
,p_template_types=>'REGION'
,p_help_text=>'H1'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2336917964996782.4495)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H2'
,p_display_name=>'H2'
,p_display_sequence=>20
,p_css_classes=>'js-headingLevel-2'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4495)
,p_template_types=>'REGION'
,p_help_text=>'H2'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2337368425996782.4495)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H3'
,p_display_name=>'H3'
,p_display_sequence=>30
,p_css_classes=>'js-headingLevel-3'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4495)
,p_template_types=>'REGION'
,p_help_text=>'H3'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2337706283996782.4495)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H4'
,p_display_name=>'H4'
,p_display_sequence=>40
,p_css_classes=>'js-headingLevel-4'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4495)
,p_template_types=>'REGION'
,p_help_text=>'H4'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2338144805996782.4495)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H5'
,p_display_name=>'H5'
,p_display_sequence=>50
,p_css_classes=>'js-headingLevel-5'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4495)
,p_template_types=>'REGION'
,p_help_text=>'H5'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2338562059996782.4495)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H6'
,p_display_name=>'H6'
,p_display_sequence=>60
,p_css_classes=>'js-headingLevel-6'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4495)
,p_template_types=>'REGION'
,p_help_text=>'H6'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134384175764258.4495)
,p_theme_id=>3
,p_name=>'LARGELEFT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapLeft'
,p_group_id=>wwv_flow_imp.id(856117102944058028.4495)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134654971764258.4495)
,p_theme_id=>3
,p_name=>'LARGERIGHT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapRight'
,p_group_id=>wwv_flow_imp.id(856117454663058028.4495)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134823880764258.4495)
,p_theme_id=>3
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(856117908453058029.4495)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135009020764258.4495)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>3
,p_css_classes=>'a-Button--large'
,p_group_id=>wwv_flow_imp.id(856116798725058025.4495)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135269851764258.4495)
,p_theme_id=>3
,p_name=>'SMALLLEFT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padLeft'
,p_group_id=>wwv_flow_imp.id(856117102944058028.4495)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135477215764258.4495)
,p_theme_id=>3
,p_name=>'SMALLRIGHT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padRight'
,p_group_id=>wwv_flow_imp.id(856117454663058028.4495)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135634744764258.4495)
,p_theme_id=>3
,p_name=>'INNERBUTTON'
,p_display_name=>'Inner Button'
,p_display_sequence=>2
,p_css_classes=>'a-Button--pill'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4495)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135785730764258.4495)
,p_theme_id=>3
,p_name=>'LASTBUTTON'
,p_display_name=>'Last Button'
,p_display_sequence=>3
,p_css_classes=>'a-Button--pillEnd'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4495)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136068296764258.4495)
,p_theme_id=>3
,p_name=>'FIRSTBUTTON'
,p_display_name=>'First Button'
,p_display_sequence=>1
,p_css_classes=>'a-Button--pillStart'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4495)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136225140764258.4495)
,p_theme_id=>3
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>1
,p_css_classes=>'a-Button--primary'
,p_group_id=>wwv_flow_imp.id(856118261810058029.4495)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136360666764258.4495)
,p_theme_id=>3
,p_name=>'REGIONHEADERBUTTON'
,p_display_name=>'Button in Region Header'
,p_display_sequence=>1
,p_css_classes=>'a-Button--regionHeader'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136507481764259.4495)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--small'
,p_group_id=>wwv_flow_imp.id(856116798725058025.4495)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136620486764259.4495)
,p_theme_id=>3
,p_name=>'STRONGBUTTONLABEL'
,p_display_name=>'Strong Button Label'
,p_display_sequence=>1
,p_css_classes=>'a-Button--strongLabel'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136861925764259.4495)
,p_theme_id=>3
,p_name=>'AUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form--autoWidthLabels'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4495)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137023291764259.4495)
,p_theme_id=>3
,p_name=>'FIXEDWIDTH'
,p_display_name=>'Fixed'
,p_display_sequence=>10
,p_css_classes=>'a-Form--fixedLabels'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4495)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137193234764259.4495)
,p_theme_id=>3
,p_name=>'LABELSABOVE'
,p_display_name=>'Labels Above'
,p_display_sequence=>1
,p_css_classes=>'a-Form--labelsAbove'
,p_group_id=>wwv_flow_imp.id(856116523282058024.4495)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137470293764259.4495)
,p_theme_id=>3
,p_name=>'ALIGNLABELSLEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Form--leftLabels'
,p_group_id=>wwv_flow_imp.id(856114568019058024.4495)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137586003764259.4495)
,p_theme_id=>3
,p_name=>'LABELAUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--autoLabelWidth'
,p_group_id=>wwv_flow_imp.id(856116214022058024.4495)
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137737661764259.4495)
,p_theme_id=>3
,p_name=>'STRETCHFORMFIELD'
,p_display_name=>'Stretch Form Field'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--stretch'
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137933035764259.4495)
,p_theme_id=>3
,p_name=>'FIXEDLARGE'
,p_display_name=>'Fixed (Large Width)'
,p_display_sequence=>30
,p_css_classes=>'a-Form-fixedLabelsLarge'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4495)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138175863764259.4495)
,p_theme_id=>3
,p_name=>'FIXEDMEDIUM'
,p_display_name=>'Fixed (Medium Width)'
,p_display_sequence=>20
,p_css_classes=>'a-Form-fixedLabelsMed'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4495)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138340877764259.4495)
,p_theme_id=>3
,p_name=>'180PX'
,p_display_name=>'180px'
,p_display_sequence=>10
,p_css_classes=>'h180'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4495)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138553321764259.4495)
,p_theme_id=>3
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>20
,p_css_classes=>'h240'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4495)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138777457764259.4495)
,p_theme_id=>3
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>30
,p_css_classes=>'h320'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4495)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138891974764260.4495)
,p_theme_id=>3
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>50
,p_css_classes=>'h480'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4495)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857139153872764260.4495)
,p_theme_id=>3
,p_name=>'540PX'
,p_display_name=>'540px'
,p_display_sequence=>60
,p_css_classes=>'h540'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4495)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857139375337764260.4495)
,p_theme_id=>3
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>70
,p_css_classes=>'h640'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4495)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145206107768768.4495)
,p_theme_id=>3
,p_name=>'USE_COLORED_BACKGROUND'
,p_display_name=>'Use Colored Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4495)
,p_css_classes=>'a-Alert--colorBG'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145328630768768.4495)
,p_theme_id=>3
,p_name=>'USE_DEFAULT_ICONS'
,p_display_name=>'Use Default Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4495)
,p_css_classes=>'a-Alert--defaultIcons'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145505007768768.4495)
,p_theme_id=>3
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4495)
,p_css_classes=>'a-Alert--warning'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4495)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145725778768768.4495)
,p_theme_id=>3
,p_name=>'ERROR'
,p_display_name=>'Error'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4495)
,p_css_classes=>'a-Alert--danger'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4495)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145892117768768.4495)
,p_theme_id=>3
,p_name=>'INFORMATIONAL'
,p_display_name=>'Informational'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4495)
,p_css_classes=>'a-Alert--info'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4495)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146085228768768.4495)
,p_theme_id=>3
,p_name=>'HORIZONTAL'
,p_display_name=>'Horizontal'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4495)
,p_css_classes=>'a-Alert--horizontal'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4495)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146322225768769.4495)
,p_theme_id=>3
,p_name=>'WIZARD'
,p_display_name=>'Wizard'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4495)
,p_css_classes=>'a-Alert--wizard'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4495)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146393064768769.4495)
,p_theme_id=>3
,p_name=>'REMOVE_ICON'
,p_display_name=>'Remove Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4495)
,p_css_classes=>'a-Alert--noIcon'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146615368768769.4495)
,p_theme_id=>3
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4495)
,p_css_classes=>'a-Alert--success'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4495)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147042367768771.4495)
,p_theme_id=>3
,p_name=>'REGIONCONTAINSITEMSTEXT'
,p_display_name=>'Region Contains Items / Text'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4495)
,p_css_classes=>'a-ButtonRegion--withItems'
,p_template_types=>'REGION'
,p_help_text=>'Check this option if this region contains items or text.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147189725768771.4495)
,p_theme_id=>3
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4495)
,p_css_classes=>'a-ButtonRegion--noUI'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4495)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147385795768771.4495)
,p_theme_id=>3
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4495)
,p_css_classes=>'a-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4495)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147655668768771.4495)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4495)
,p_css_classes=>'a-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4495)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147872948768771.4495)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4495)
,p_css_classes=>'a-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4495)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147976018768771.4495)
,p_theme_id=>3
,p_name=>'WIZARDDIALOG'
,p_display_name=>'Used for Wizard Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4495)
,p_css_classes=>'a-ButtonRegion--wizard'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857148162424768771.4495)
,p_theme_id=>3
,p_name=>'VISIBLE'
,p_display_name=>'Visible'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4495)
,p_css_classes=>'a-ButtonRegion--showTitle'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4495)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857148341454768771.4495)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4495)
,p_css_classes=>'a-ButtonRegion--accessibleTitle'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4495)
,p_template_types=>'REGION'
,p_help_text=>'Use this option to add a visually hidden heading which is accessible for screen readers, but otherwise not visible to users.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149438708768778.4495)
,p_theme_id=>3
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4495)
,p_css_classes=>'a-BadgeList--float'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4495)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149614105768778.4495)
,p_theme_id=>3
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4495)
,p_css_classes=>'a-BadgeList--fixed'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4495)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149843563768778.4495)
,p_theme_id=>3
,p_name=>'STACKEDVERTICALLY'
,p_display_name=>'Stacked Vertically'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4495)
,p_css_classes=>'a-BadgeList--stacked'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4495)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149998210768778.4495)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'32px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4495)
,p_css_classes=>'a-BadgeList--small'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4495)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150194417768778.4495)
,p_theme_id=>3
,p_name=>'MEDIUM'
,p_display_name=>'48px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4495)
,p_css_classes=>'a-BadgeList--medium'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4495)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150439507768778.4495)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'64px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4495)
,p_css_classes=>'a-BadgeList--large'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4495)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150608654768780.4495)
,p_theme_id=>3
,p_name=>'XLARGE'
,p_display_name=>'96px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4495)
,p_css_classes=>'a-BadgeList--xlarge'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4495)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150792333768780.4495)
,p_theme_id=>3
,p_name=>'XXLARGE'
,p_display_name=>'128px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4495)
,p_css_classes=>'a-BadgeList--xxlarge'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4495)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151008734768780.4495)
,p_theme_id=>3
,p_name=>'2COLUMNNGRID'
,p_display_name=>'2 Columnn Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4495)
,p_css_classes=>'a-BadgeList--cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4495)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151259777768780.4495)
,p_theme_id=>3
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4495)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--3cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4495)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151408063768780.4495)
,p_theme_id=>3
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4495)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--4cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4495)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151643103768780.4495)
,p_theme_id=>3
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4495)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--5cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4495)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151861194768780.4495)
,p_theme_id=>3
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4495)
,p_css_classes=>'a-BadgeList--flex'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4495)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896798730495581814.4495)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4495)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(808380142596819918.4495)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896798963380581814.4495)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4495)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(808380828683819918.4495)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799089194581814.4495)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4495)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4495)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799349986581814.4495)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4495)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4495)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799577541581814.4495)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4495)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4495)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799637215581814.4495)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4495)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799807498581814.4495)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4495)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_imp.id(808383088145819924.4495)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022191342234716.4495)
,p_theme_id=>3
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4495)
,p_css_classes=>'a-MediaList--cols a-MediaList--2cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4495)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022392217234716.4495)
,p_theme_id=>3
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4495)
,p_css_classes=>'a-MediaList--cols a-MediaList--3cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4495)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022597980234716.4495)
,p_theme_id=>3
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4495)
,p_css_classes=>'a-MediaList--cols a-MediaList--4cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4495)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022867300234717.4495)
,p_theme_id=>3
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4495)
,p_css_classes=>'a-MediaList--cols a-MediaList--5cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4495)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023065592234717.4495)
,p_theme_id=>3
,p_name=>'SPANHORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4495)
,p_css_classes=>'a-MediaList--horizontal'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4495)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023131122234717.4495)
,p_theme_id=>3
,p_name=>'HIDEBADGE'
,p_display_name=>'Hide Badge'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4495)
,p_css_classes=>'a-MediaList--noBadge'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023191297234717.4495)
,p_theme_id=>3
,p_name=>'HIDEDESCRIPTION'
,p_display_name=>'Hide Description'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4495)
,p_css_classes=>'a-MediaList--noDesc'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023315038234717.4495)
,p_theme_id=>3
,p_name=>'HIDETITLE'
,p_display_name=>'Hide Title'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4495)
,p_css_classes=>'a-MediaList--noTitle'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023432264234717.4495)
,p_theme_id=>3
,p_name=>'HIDEICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4495)
,p_css_classes=>'a-MediaList--noIcons'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023494059234717.4495)
,p_theme_id=>3
,p_name=>'SLIMLIST'
,p_display_name=>'Slim List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4495)
,p_css_classes=>'a-MediaList--slim'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378094918666945.4495)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4495)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(808380142596819918.4495)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378225037666947.4495)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4495)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(808380828683819918.4495)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378370589666947.4495)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4495)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4495)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378467813666947.4495)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4495)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378526097666947.4495)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4495)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4495)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378615102666947.4495)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4495)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_imp.id(808383088145819924.4495)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378735377666947.4495)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4495)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4495)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1036071796325339624.4495)
,p_theme_id=>3
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(514332292784430987.4495)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1036071972285339624.4495)
,p_theme_id=>3
,p_name=>'ADD_SLIDE_ANIMATION'
,p_display_name=>'Add Slide Animation'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(514332292784430987.4495)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1050367122398973653.4495)
,p_theme_id=>3
,p_name=>'SLIMPROGRESSLIST'
,p_display_name=>'Slim Progress List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(865273508717512144.4495)
,p_css_classes=>'a-WizardSteps--slim'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1309233880682664517.4495)
,p_theme_id=>3
,p_name=>'LEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_button_template_id=>wwv_flow_imp.id(868252865986181054.4495)
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(856117908453058029.4495)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1351338307429029043.4495)
,p_theme_id=>3
,p_name=>'USED_IN_DIALOG'
,p_display_name=>'Used in Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1274355059486017828.4495)
,p_css_classes=>'a-ProcessingRegion--dialog'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333722717814196.4495)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4495)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333859287814196.4495)
,p_theme_id=>3
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4495)
,p_css_classes=>'a-LinksList--showBadge'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333887728814196.4495)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4495)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334039640814196.4495)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4495)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334247146814196.4495)
,p_theme_id=>3
,p_name=>'FORTOPLEVELONLY'
,p_display_name=>'For top level only'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4495)
,p_css_classes=>'a-LinksList--showTopIcons'
,p_group_id=>wwv_flow_imp.id(806925000765340952.4495)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334455135814196.4495)
,p_theme_id=>3
,p_name=>'FORALLITEMS'
,p_display_name=>'For all items'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4495)
,p_css_classes=>'a-LinksList--showIcons'
,p_group_id=>wwv_flow_imp.id(806925000765340952.4495)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491342397110118.4495)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4495)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491390428110118.4495)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4495)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491480011110118.4495)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4495)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664488722406040473.4495)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4495)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4495)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664488933681040473.4495)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4495)
,p_css_classes=>'a-Region--accessibleHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4495)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489165994040473.4495)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4495)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4495)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489304869040473.4495)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4495)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4495)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489519844040473.4495)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4495)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_imp.id(860570508910721307.4495)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489753255040473.4495)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4495)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4495)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489941797040473.4495)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4495)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4495)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490153471040473.4495)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4495)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4495)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490336091040473.4495)
,p_theme_id=>3
,p_name=>'DEFAULTPADDING'
,p_display_name=>'Default Padding'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4495)
,p_css_classes=>'a-Region--paddedBody'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4495)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490377667040473.4495)
,p_theme_id=>3
,p_name=>'REMOVE_TOP_BORDER'
,p_display_name=>'Remove Top Border'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4495)
,p_css_classes=>'a-Region--noTopBorder'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490659850040473.4495)
,p_theme_id=>3
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4495)
,p_css_classes=>'a-Region--simple'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4495)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664501980442158869.4495)
,p_theme_id=>3
,p_name=>'RESPONSIVEICONCOLUMNS'
,p_display_name=>'Responsive Icon Columns'
,p_display_sequence=>2
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4495)
,p_css_classes=>'a-IRR-region--responsiveIconView'
,p_template_types=>'REGION'
,p_help_text=>'Automatically increases number of icon columns to show based on screen resolution.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664502160891158869.4495)
,p_theme_id=>3
,p_name=>'ICONLABELSRIGHT'
,p_display_name=>'Icon Labels on Right'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4495)
,p_css_classes=>'a-IRR-region--iconLabelsRight'
,p_template_types=>'REGION'
,p_help_text=>'Shows labels in Icon View to the right of the icon.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664502181188158869.4495)
,p_theme_id=>3
,p_name=>'REMOVEOUTERBORDERS'
,p_display_name=>'Remove Outer Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4495)
,p_css_classes=>'a-IRR-region--noOuterBorders'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508367504174332.4495)
,p_theme_id=>3
,p_name=>'FLUSHREGION'
,p_display_name=>'Flush Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4495)
,p_css_classes=>'a-Region--flush'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508426350174332.4495)
,p_theme_id=>3
,p_name=>'STACKEDREGION'
,p_display_name=>'Stacked Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4495)
,p_css_classes=>'a-Region--stacked'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508588305174332.4495)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4495)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4495)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508810521174332.4495)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4495)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4495)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509005841174332.4495)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4495)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_imp.id(860570508910721307.4495)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509270186174332.4495)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4495)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4495)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509448573174333.4495)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4495)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4495)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509659839174333.4495)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4495)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4495)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509822387174334.4495)
,p_theme_id=>3
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>.1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4495)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4495)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664510028962174334.4495)
,p_theme_id=>3
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4495)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4495)
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
 p_id=>wwv_flow_imp.id(141373541000752051)
,p_name=>'4150_COLUMN_NUMBER'
,p_message_language=>'pt'
,p_message_text=>'Coluna %0'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141358109531752047)
,p_name=>'ACCESS_CONTROL_ADMIN'
,p_message_language=>'pt'
,p_message_text=>'Administrador'
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141358011633752047)
,p_name=>'ACCESS_CONTROL_USERNAME'
,p_message_language=>'pt'
,p_message_text=>'Nome de Utilizador'
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141420716448752065)
,p_name=>'ACCESS_DENIED_SIMPLE'
,p_message_language=>'pt'
,p_message_text=>'Acesso Recusado'
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141377656293752052)
,p_name=>'ACCOUNT_HAS_BEEN_CREATED'
,p_message_language=>'pt'
,p_message_text=>'A sua conta %0 foi criada.'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141360826808752047)
,p_name=>'ACCOUNT_LOCKED'
,p_message_language=>'pt'
,p_message_text=>unistr('A conta est\00E1 bloqueada.')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141345343698752043)
,p_name=>'AM_PM'
,p_message_language=>'pt'
,p_message_text=>'AM / PM'
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141328193284752038)
,p_name=>'APEX.ACTIONS.ACTION_LINK'
,p_message_language=>'pt'
,p_message_text=>unistr('liga\00E7\00E3o da a\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141328006218752038)
,p_name=>'APEX.ACTIONS.DIALOG_LINK'
,p_message_language=>'pt'
,p_message_text=>unistr('liga\00E7\00E3o da caixa de di\00E1logo')
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141492455599752086)
,p_name=>'APEX.ACTIONS.TOGGLE'
,p_message_language=>'pt'
,p_message_text=>'Alternar %0'
,p_is_js_message=>true
,p_version_scn=>2705332
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141500201143752089)
,p_name=>'APEX.ACTIVE_STATE'
,p_message_language=>'pt'
,p_message_text=>'(Ativo)'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141305096881752031)
,p_name=>'APEX.AI.CHAT_CLEARED'
,p_message_language=>'pt'
,p_message_text=>'Chat limpo'
,p_is_js_message=>true
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141304924640752031)
,p_name=>'APEX.AI.CLEAR_CHAT'
,p_message_language=>'pt'
,p_message_text=>'Limpar chat'
,p_is_js_message=>true
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141301533442752030)
,p_name=>'APEX.AI.CONSENT_ACCEPT'
,p_message_language=>'pt'
,p_message_text=>'Aceitar'
,p_is_js_message=>true
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141301642719752030)
,p_name=>'APEX.AI.CONSENT_DENY'
,p_message_language=>'pt'
,p_message_text=>'Recusar'
,p_is_js_message=>true
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141301313819752030)
,p_name=>'APEX.AI.CONVERSATION_HISTORY'
,p_message_language=>'pt'
,p_message_text=>unistr('Hist\00F3rico de Conversa\00E7\00F5es')
,p_is_js_message=>true
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141304735632752031)
,p_name=>'APEX.AI.COPIED'
,p_message_language=>'pt'
,p_message_text=>'Copiado'
,p_is_js_message=>true
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141304805359752031)
,p_name=>'APEX.AI.COPIED_TO_CLIPBOARD'
,p_message_language=>'pt'
,p_message_text=>unistr('Copiado para a \00E1rea de transfer\00EAncia')
,p_is_js_message=>true
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141304582484752031)
,p_name=>'APEX.AI.COPY'
,p_message_language=>'pt'
,p_message_text=>'Copiar'
,p_is_js_message=>true
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141304650826752031)
,p_name=>'APEX.AI.COPY_TO_CLIPBOARD'
,p_message_language=>'pt'
,p_message_text=>unistr('Copiar para \00E1rea de transfer\00EAncia')
,p_is_js_message=>true
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141302019781752030)
,p_name=>'APEX.AI.DIALOG_TITLE'
,p_message_language=>'pt'
,p_message_text=>'Assistente'
,p_is_js_message=>true
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141302496028752030)
,p_name=>'APEX.AI.DISABLED'
,p_message_language=>'pt'
,p_message_text=>unistr('A IA est\00E1 desativada ao n\00EDvel do espa\00E7o de trabalho ou da inst\00E2ncia.')
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141341731332752042)
,p_name=>'APEX.AI.GET_SERVER_ID_OR_STATIC_ID'
,p_message_language=>'pt'
,p_message_text=>unistr('O Servi\00E7o de IA Generativa com a ID fornecida ou ID est\00E1tica n\00E3o foi encontrado.')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141340448666752041)
,p_name=>'APEX.AI.HTTP_4013_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro de autentica\00E7\00E3o ou acesso proibido (HTTP-%1) para o URL %0. Verifique a configura\00E7\00E3o do Servi\00E7o de IA Generativa %2.')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141320220072752036)
,p_name=>'APEX.AI.HTTP_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('O pedido de HTTP para o Servi\00E7o de IA Generativa em %0 falhou com HTTP-%1: %2')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141344672377752043)
,p_name=>'APEX.AI.HTTP_FRIENDLY_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro no pedido de HTTP ao Servi\00E7o de IA Generativa para o plug-in %0 no modo %1. Verifique a configura\00E7\00E3o do Servi\00E7o de IA Generativa.')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141307430938752032)
,p_name=>'APEX.AI.MAIN_QUICK_ACTIONS_ARIA_LABEL'
,p_message_language=>'pt'
,p_message_text=>'Exemplos'
,p_is_js_message=>true
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141305870841752031)
,p_name=>'APEX.AI.NAME_ASSISTANT'
,p_message_language=>'pt'
,p_message_text=>'Assistente'
,p_is_js_message=>true
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141307246215752032)
,p_name=>'APEX.AI.NAME_COMMA_MESSAGE'
,p_message_language=>'pt'
,p_message_text=>'%0,%1'
,p_is_js_message=>true
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141305765824752031)
,p_name=>'APEX.AI.NAME_USER'
,p_message_language=>'pt'
,p_message_text=>'Utilizador'
,p_is_js_message=>true
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141336423469752040)
,p_name=>'APEX.AI.OCI_CHAT_NOT_SUPPORTED'
,p_message_language=>'pt'
,p_message_text=>unistr('O OCI Generative AI n\00E3o suporta atualmente a experi\00EAncia de chat com v\00E1rias mensagens.')
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141316377988752034)
,p_name=>'APEX.AI.PROMPT_ENRICHMENT_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro ao processar o prompt %0 para a aplica\00E7\00E3o %1. Verifique se o App Builder est\00E1 dispon\00EDvel nesta inst\00E2ncia.')
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141321458441752036)
,p_name=>'APEX.AI.RESPONSE_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel processar a resposta para o AI Service %0, resposta %1')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141327608756752038)
,p_name=>'APEX.AI.SEND_MESSAGE'
,p_message_language=>'pt'
,p_message_text=>'Enviar Mensagem'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141315925240752034)
,p_name=>'APEX.AI.SERVICE_ERROR'
,p_message_language=>'pt'
,p_message_text=>'Erro no AI Service de backend %0'
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141301726851752030)
,p_name=>'APEX.AI.TEXTAREA_LABEL'
,p_message_language=>'pt'
,p_message_text=>'Mensagem'
,p_is_js_message=>true
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141301824220752030)
,p_name=>'APEX.AI.TEXTAREA_PLACEHOLDER'
,p_message_language=>'pt'
,p_message_text=>'Introduza a sua mensagem aqui'
,p_is_js_message=>true
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141305164668752031)
,p_name=>'APEX.AI.USER_AVATAR'
,p_message_language=>'pt'
,p_message_text=>'Avatar do utilizador'
,p_is_js_message=>true
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141305245771752031)
,p_name=>'APEX.AI.USE_THIS'
,p_message_language=>'pt'
,p_message_text=>'Utilizar este/a'
,p_is_js_message=>true
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141301901377752030)
,p_name=>'APEX.AI.WARN_UNSENT_MESSAGE'
,p_message_language=>'pt'
,p_message_text=>unistr('Tem uma mensagem n\00E3o enviada, tem a certeza?')
,p_is_js_message=>true
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141470986817752080)
,p_name=>'APEX.AJAX_SERVER_ERROR'
,p_message_language=>'pt'
,p_message_text=>'A chamada de Ajax devolveu o erro do servidor %0 para %1.'
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141398080947752058)
,p_name=>'APEX.APPLICATION.ALIAS.NON_UNIQUE'
,p_message_language=>'pt'
,p_message_text=>unistr('O pseud\00F3nimo da aplica\00E7\00E3o "%0" n\00E3o pode ser convertido numa ID da aplica\00E7\00E3o exclusiva.')
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141386851285752055)
,p_name=>'APEX.APPLICATION.ALIAS.UNHANDLED_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('ERR-1816 Erro inesperado ao converter o pseud\00F3nimo da aplica\00E7\00E3o p_flow_alias_or_id (%0).')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141484243907752084)
,p_name=>'APEX.APPLICATION.CHECKSUM.DESCRIPTION'
,p_message_language=>'pt'
,p_message_text=>unistr('A soma de verifica\00E7\00E3o da aplica\00E7\00E3o proporciona uma forma f\00E1cil de determinar se a mesma aplica\00E7\00E3o \00E9 implementada em todos os espa\00E7os de trabalho. Pode comparar esta soma de verifica\00E7\00E3o para determinar se existe uma correspond\00EAncia. ')
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141370815088752050)
,p_name=>'APEX.AUTHENTICATION.AUTH_FUNC.UNHANDLED_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro ao processar a fun\00E7\00E3o de autentica\00E7\00E3o.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141352826430752045)
,p_name=>'APEX.AUTHENTICATION.AUTH_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro ao processar a fun\00E7\00E3o de autentica\00E7\00E3o.')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141524748428752096)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.HOST_PREFIX_MISMATCH'
,p_message_language=>'pt'
,p_message_text=>unistr('O Nome do Tenant %0 devolvido pelo Oracle Cloud Identity Management n\00E3o est\00E1 autorizado para o dom\00EDnio %1!<br/><a href="&LOGOUT_URL.">Entre novamente em sess\00E3o</a> e especifique um nome de tenant autorizado ou altere o seu URL.')
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141348943944752044)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.USER_IS_NOT_DEVELOPER'
,p_message_language=>'pt'
,p_message_text=>unistr('A sua conta "%0" n\00E3o tem os privil\00E9gios de desenvolvimento necess\00E1rios (DB_DEVELOPER ou DB_ADMINISTRATOR)<br/>para o espa\00E7o de trabalho "%1"! <a href="&LOGOUT_URL.">Entre novamente em sess\00E3o</a> ap\00F3s os privil\00E9gios terem sido fornecidos.')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141345588371752043)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.WRONG_GROUP_NAME'
,p_message_language=>'pt'
,p_message_text=>unistr('O Nome do Tenant devolvido pelo Oracle Cloud Identity Management n\00E3o est\00E1 autorizado para o espa\00E7o de trabalho atual!<br/><a href="&LOGOUT_URL.">Entre novamente em sess\00E3o</a> e especifique um nome de tenant autorizado.')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141349044915752044)
,p_name=>'APEX.AUTHENTICATION.HOST_PREFIX_MISMATCH'
,p_message_language=>'pt'
,p_message_text=>unistr('Por motivos de seguran\00E7a, n\00E3o \00E9 permitido executar aplica\00E7\00F5es deste espa\00E7o de trabalho atrav\00E9s do dom\00EDnio no URL.')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141370539929752050)
,p_name=>'APEX.AUTHENTICATION.LDAP.DBMS_LDAP.ASK_FOR_INSTALLATION'
,p_message_language=>'pt'
,p_message_text=>unistr('Pe\00E7a ao DBA para executar $OH/rdbms/admin/catldap.sql.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141370484734752050)
,p_name=>'APEX.AUTHENTICATION.LDAP.DBMS_LDAP.MISSING'
,p_message_language=>'pt'
,p_message_text=>unistr('O pacote SYS.DBMS_LDAP n\00E3o existe ou \00E9 inv\00E1lido.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141370320080752050)
,p_name=>'APEX.AUTHENTICATION.LDAP.EDIT_USER_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro ao processar a fun\00E7\00E3o de edi\00E7\00E3o de utilizador de LDAP.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141370620212752050)
,p_name=>'APEX.AUTHENTICATION.LDAP.UNHANDLED_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro ao processar a autentica\00E7\00E3o de LDAP.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141371492519752051)
,p_name=>'APEX.AUTHENTICATION.LOGIN.ILLEGAL_PAGE_ARG'
,p_message_language=>'pt'
,p_message_text=>'Erro no argumento p_flow_page para o procedimento login_page.'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141371073858752050)
,p_name=>'APEX.AUTHENTICATION.LOGIN.INVALID_ARG'
,p_message_language=>'pt'
,p_message_text=>unistr('p_session inv\00E1lido em wwv_flow_custom_auth_std.login--p_flow_page:%0 p_session_id:%1.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141422336255752066)
,p_name=>'APEX.AUTHENTICATION.LOGIN.MALFORMED_ARGS'
,p_message_language=>'pt'
,p_message_text=>'Argumento incorreto para wwv_flow_custom_auth_std.login--p_flow_page:p_session_id:p_entry_point:%0:%1:%2.'
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141371169298752050)
,p_name=>'APEX.AUTHENTICATION.LOGIN.NULL_USER'
,p_message_language=>'pt'
,p_message_text=>unistr('Nome de utilizador nulo transmitido ao procedimento de entrada em sess\00E3o.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141357986380752047)
,p_name=>'APEX.AUTHENTICATION.LOGIN_THROTTLE.COUNTER'
,p_message_language=>'pt'
,p_message_text=>unistr('Aguarde <span id="apex_login_throttle_sec">%0</span> segundos para entrar em sess\00E3o novamente.')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141359239938752047)
,p_name=>'APEX.AUTHENTICATION.LOGIN_THROTTLE.ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('A tentativa de entrada em sess\00E3o foi bloqueada.')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141420098007752065)
,p_name=>'APEX.AUTHENTICATION.NOT_FOUND'
,p_message_language=>'pt'
,p_message_text=>unistr('Autentica\00E7\00E3o "%0" n\00E3o encontrada')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141359792240752047)
,p_name=>'APEX.AUTHENTICATION.NO_SECURITY_GROUP_ID'
,p_message_language=>'pt'
,p_message_text=>unistr('A ID do grupo de seguran\00E7a \00E9 nula.')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141370996716752050)
,p_name=>'APEX.AUTHENTICATION.POST_AUTH_PROC.UNHANDLED_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro ao executar o processo de p\00F3s-autentica\00E7\00E3o.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141370748135752050)
,p_name=>'APEX.AUTHENTICATION.PRE_AUTH_PROC.UNHANDLED_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro ao processar o processo de pr\00E9-autentica\00E7\00E3o.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141372485800752051)
,p_name=>'APEX.AUTHENTICATION.RESET_PASSWORD.INSTRUCTIONS'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Abra o URL no mesmo browser onde iniciou o pedido Redefinir Senha. Se clicar no URL de Redefini\00E7\00E3o da Senha e for redirecionado para'),
unistr('a p\00E1gina de entrada em sess\00E3o, inicie novamente a Redefini\00E7\00E3o da Senha e deixe o'),
'browser aberto.'))
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141522210190752095)
,p_name=>'APEX.AUTHENTICATION.RESET_PASSWORD_URL'
,p_message_language=>'pt'
,p_message_text=>unistr('URL de Redefini\00E7\00E3o da Senha')
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141349239562752044)
,p_name=>'APEX.AUTHENTICATION.RM_GROUP_NOT_GRANTED'
,p_message_language=>'pt'
,p_message_text=>unistr('O grupo de consumidores do Gestor de Recursos %0 n\00E3o foi concedido a %1')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141349320817752044)
,p_name=>'APEX.AUTHENTICATION.RM_INFO_TO_GRANT'
,p_message_language=>'pt'
,p_message_text=>unistr('Utilize DBMS_RESOURCE_MANAGER_PRIVS.GRANT_SWITCH_CONSUMER_GROUP para conceder o privil\00E9gio em falta.')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141383969403752054)
,p_name=>'APEX.AUTHENTICATION.SESSION_SENTRY_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro ao processar a fun\00E7\00E3o de sentinela da sess\00E3o.')
,p_version_scn=>2705310
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141384037446752054)
,p_name=>'APEX.AUTHENTICATION.SESSION_VERIFY_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro ao processar a fun\00E7\00E3o de verifica\00E7\00E3o da sess\00E3o.')
,p_version_scn=>2705310
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141384292849752054)
,p_name=>'APEX.AUTHENTICATION.SSO.ASK_FOR_INSTALLATION'
,p_message_language=>'pt'
,p_message_text=>unistr('Pe\00E7a ao administrador do %0 para configurar o mecanismo para o Acesso \00DAnico do Oracle Application Server.')
,p_version_scn=>2705310
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141394670413752057)
,p_name=>'APEX.AUTHENTICATION.SSO.BAD_URLC'
,p_message_language=>'pt'
,p_message_text=>'%0 ilegal no token %1 devolvido pelo SSO.'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141371337975752051)
,p_name=>'APEX.AUTHENTICATION.SSO.FIX_PARTNER_APP'
,p_message_language=>'pt'
,p_message_text=>unistr('Edite o esquema de autentica\00E7\00E3o e acrescente o nome da aplica\00E7\00E3o.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141394315153752057)
,p_name=>'APEX.AUTHENTICATION.SSO.ILLEGAL_CALLER'
,p_message_language=>'pt'
,p_message_text=>'Chamador ilegal do procedimento %0:'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141394593827752057)
,p_name=>'APEX.AUTHENTICATION.SSO.INVALID_APP_SESSION'
,p_message_language=>'pt'
,p_message_text=>unistr('Sess\00E3o da aplica\00E7\00E3o inv\00E1lida no token de URLC: %0')
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141394152838752057)
,p_name=>'APEX.AUTHENTICATION.SSO.MISSING_APP_REGISTRATION'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro em portal_sso_redirect: informa\00E7\00F5es de registo da aplica\00E7\00E3o em falta: %0')
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141384165886752054)
,p_name=>'APEX.AUTHENTICATION.SSO.PACKAGE_MISSING'
,p_message_language=>'pt'
,p_message_text=>unistr('O pacote WWSEC_SSO_ENABLER_PRIVATE n\00E3o existe ou \00E9 inv\00E1lido.')
,p_version_scn=>2705310
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141371233218752051)
,p_name=>'APEX.AUTHENTICATION.SSO.PARTNER_APP_IS_NULL'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel encontrar o nome da aplica\00E7\00E3o de parceiro registada no esquema de autentica\00E7\00E3o.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141394208108752057)
,p_name=>'APEX.AUTHENTICATION.SSO.REGISTER_APP'
,p_message_language=>'pt'
,p_message_text=>unistr('Registe esta aplica\00E7\00E3o conforme descrito no manual de instala\00E7\00E3o.')
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141384363144752054)
,p_name=>'APEX.AUTHENTICATION.SSO.UNHANDLED_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro ao processar a autentica\00E7\00E3o de SSO.')
,p_version_scn=>2705310
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141497635869752088)
,p_name=>'APEX.AUTHENTICATION.UNAUTHORIZED_URL'
,p_message_language=>'pt'
,p_message_text=>unistr('URL N\00E3o Autorizado: %0')
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141383715241752054)
,p_name=>'APEX.AUTHENTICATION.UNHANDLED_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro ao processar a autentica\00E7\00E3o.')
,p_version_scn=>2705310
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141349142117752044)
,p_name=>'APEX.AUTHENTICATION.WORKSPACE_NOT_ASSIGNED'
,p_message_language=>'pt'
,p_message_text=>unistr('O espa\00E7o de trabalho "%0" est\00E1 inativo. Contacte o administrador.')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141349839336752044)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED'
,p_message_language=>'pt'
,p_message_text=>'%0'
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141358984482752047)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED.APPLICATION'
,p_message_language=>'pt'
,p_message_text=>unistr('Acesso recusado pela verifica\00E7\00E3o de seguran\00E7a da Aplica\00E7\00E3o')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141359031637752047)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED.PAGE'
,p_message_language=>'pt'
,p_message_text=>unistr('Acesso recusado pela verifica\00E7\00E3o de seguran\00E7a da P\00E1gina')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141359134257752047)
,p_name=>'APEX.AUTHORIZATION.UNHANDLED_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro ao processar a autoriza\00E7\00E3o.')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141428222534752067)
,p_name=>'APEX.BUILT_WITH_LOVE_USING_APEX'
,p_message_language=>'pt'
,p_message_text=>'Criado com %0 utilizando %1'
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141428344001752067)
,p_name=>'APEX.BUILT_WITH_LOVE_USING_APEX.ACCESSIBLE.LOVE'
,p_message_language=>'pt'
,p_message_text=>'amor'
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141488174946752085)
,p_name=>'APEX.CALENDAR.EVENT_DESCRIPTION'
,p_message_language=>'pt'
,p_message_text=>unistr('Descri\00E7\00E3o do Evento')
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141487928417752085)
,p_name=>'APEX.CALENDAR.EVENT_END'
,p_message_language=>'pt'
,p_message_text=>'Data de Fim'
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141488208449752085)
,p_name=>'APEX.CALENDAR.EVENT_ID'
,p_message_language=>'pt'
,p_message_text=>'ID do Evento'
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141487897549752085)
,p_name=>'APEX.CALENDAR.EVENT_START'
,p_message_language=>'pt'
,p_message_text=>unistr('Data de In\00EDcio')
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141488018115752085)
,p_name=>'APEX.CALENDAR.EVENT_TITLE'
,p_message_language=>'pt'
,p_message_text=>unistr('T\00EDtulo do Evento')
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141330648167752039)
,p_name=>'APEX.CARD'
,p_message_language=>'pt'
,p_message_text=>unistr('Cart\00E3o')
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141330824998752039)
,p_name=>'APEX.CARD.CARD_ACTION'
,p_message_language=>'pt'
,p_message_text=>unistr('A\00E7\00E3o do cart\00E3o')
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141371599637752051)
,p_name=>'APEX.CHECKBOX.VISUALLY_HIDDEN_CHECKBOX'
,p_message_language=>'pt'
,p_message_text=>unistr('Caixa de sele\00E7\00E3o visualmente oculta')
,p_is_js_message=>true
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141373419294752051)
,p_name=>'APEX.CHECKSUM.CONTENT_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro no conte\00FAdo da soma de verifica\00E7\00E3o')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141373398427752051)
,p_name=>'APEX.CHECKSUM.FORMAT_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro no formato da soma de verifica\00E7\00E3o')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141443291864752072)
,p_name=>'APEX.CLIPBOARD.COPIED'
,p_message_language=>'pt'
,p_message_text=>unistr('Copiado para a \00E1rea de transfer\00EAncia.')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141442799751752072)
,p_name=>'APEX.CLIPBOARD.NOTSUP'
,p_message_language=>'pt'
,p_message_text=>unistr('Este browser n\00E3o suporta a c\00F3pia a partir de um bot\00E3o ou menu. Tente Ctrl+C ou Comando+C.')
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141428950586752068)
,p_name=>'APEX.CLOSE_NOTIFICATION'
,p_message_language=>'pt'
,p_message_text=>'Fechar'
,p_is_js_message=>true
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141307391024752032)
,p_name=>'APEX.CODE_EDITOR.MAXIMUM_LENGTH_EXCEEDED'
,p_message_language=>'pt'
,p_message_text=>unistr('O conte\00FAdo do Editor de C\00F3digo excede o comprimento m\00E1ximo do item (caracteres reais %0, caracteres permitidos %1)')
,p_is_js_message=>true
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141487401313752085)
,p_name=>'APEX.COLOR_PICKER.CONTRAST'
,p_message_language=>'pt'
,p_message_text=>'Contraste'
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141481949476752083)
,p_name=>'APEX.COLOR_PICKER.CURRENT'
,p_message_language=>'pt'
,p_message_text=>'Atual'
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141481848472752083)
,p_name=>'APEX.COLOR_PICKER.INITIAL'
,p_message_language=>'pt'
,p_message_text=>'Inicial'
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141486078844752084)
,p_name=>'APEX.COLOR_PICKER.INVALID_COLOR'
,p_message_language=>'pt'
,p_message_text=>unistr('#LABEL# deve ser uma cor v\00E1lida. Exemplo: %0')
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141348452609752044)
,p_name=>'APEX.COLOR_PICKER.MORE_PRESET_COLORS'
,p_message_language=>'pt'
,p_message_text=>'Mais cores'
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141348597520752044)
,p_name=>'APEX.COLOR_PICKER.OPEN'
,p_message_language=>'pt'
,p_message_text=>'Abrir seletor de cores'
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141305640929752031)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.ALPHA_SLIDER'
,p_message_language=>'pt'
,p_message_text=>unistr('Cursor de Desloca\00E7\00E3o de Alfa, cursor de desloca\00E7\00E3o horizontal. Utilize as teclas de setas para navegar.')
,p_is_js_message=>true
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141305394897752031)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.COLOR_SPECTRUM'
,p_message_language=>'pt'
,p_message_text=>unistr('Espectro de Cores, cursor de desloca\00E7\00E3o de 4 sentidos. Utilize as teclas de setas para navegar.')
,p_is_js_message=>true
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141305415637752031)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.HUE_SLIDER'
,p_message_language=>'pt'
,p_message_text=>unistr('Cursor de Desloca\00E7\00E3o de Tonalidade, cursor de desloca\00E7\00E3o vertical. Utilize as teclas de setas para navegar.')
,p_is_js_message=>true
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141481750747752083)
,p_name=>'APEX.COLOR_PICKER.TITLE'
,p_message_language=>'pt'
,p_message_text=>'Escolher cor'
,p_is_js_message=>true
,p_version_scn=>2705329
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141482018714752083)
,p_name=>'APEX.COLOR_PICKER.TOGGLE_TITLE'
,p_message_language=>'pt'
,p_message_text=>'Alterar formato da cor'
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141519970013752094)
,p_name=>'APEX.COMBOBOX.LIST_OF_VALUES'
,p_message_language=>'pt'
,p_message_text=>'Lista de Valores'
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141520006733752094)
,p_name=>'APEX.COMBOBOX.SHOW_ALL_VALUES'
,p_message_language=>'pt'
,p_message_text=>'Abrir lista para: %0'
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141500359536752089)
,p_name=>'APEX.COMPLETED_STATE'
,p_message_language=>'pt'
,p_message_text=>unistr('(Conclu\00EDdo)')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141389292491752056)
,p_name=>'APEX.CONTACT_ADMIN'
,p_message_language=>'pt'
,p_message_text=>unistr('Contacte o administrador da aplica\00E7\00E3o.')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141404732981752060)
,p_name=>'APEX.CONTACT_ADMIN.DEBUG'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Contacte o administrador da aplica\00E7\00E3o.'),
unistr('Existem detalhes sobre este incidente dispon\00EDveis atrav\00E9s da ID de depura\00E7\00E3o "%0".')))
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141486343080752084)
,p_name=>'APEX.CORRECT_ERRORS'
,p_message_language=>'pt'
,p_message_text=>'Corrija os erros antes de gravar.'
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141331659582752039)
,p_name=>'APEX.CS.ACTIVE_VALUE_CHIP'
,p_message_language=>'pt'
,p_message_text=>'%0. Prima a Tecla de retrocesso para apagar.'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141429891993752068)
,p_name=>'APEX.CS.MATCHES_FOUND'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 correspond\00EAncias encontradas')
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141311733947752033)
,p_name=>'APEX.CS.MATCH_FOUND'
,p_message_language=>'pt'
,p_message_text=>unistr('1 correspond\00EAncia encontrada')
,p_is_js_message=>true
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141429731548752068)
,p_name=>'APEX.CS.NO_MATCHES'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o foram encontradas correspond\00EAncias')
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141306108835752031)
,p_name=>'APEX.CS.OTHERS_GROUP'
,p_message_language=>'pt'
,p_message_text=>'Outros'
,p_is_js_message=>true
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141306095537752031)
,p_name=>'APEX.CS.SELECTED_VALUES_COUNTER'
,p_message_language=>'pt'
,p_message_text=>'%0 valores selecionados'
,p_is_js_message=>true
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141500844231752089)
,p_name=>'APEX.CURRENT_PROGRESS'
,p_message_language=>'pt'
,p_message_text=>'Progresso Atual'
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141486703810752085)
,p_name=>'APEX.DATA.LOAD.FILE_DOES_NOT_EXIST'
,p_message_language=>'pt'
,p_message_text=>unistr('O ficheiro especificado no item %0 n\00E3o existe em in APEX_APPLICATION_TEMP_FILES.')
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141475268369752081)
,p_name=>'APEX.DATA_HAS_CHANGED'
,p_message_language=>'pt'
,p_message_text=>unistr('A vers\00E3o atual dos dados na base de dados foi alterada desde que o utilizador iniciou o processo de atualiza\00E7\00E3o.')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141444356532752072)
,p_name=>'APEX.DATA_LOAD.DO_NOT_LOAD'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o Carregar')
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141490673630752086)
,p_name=>'APEX.DATA_LOAD.FAILED'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro de pr\00E9-processamento')
,p_version_scn=>2705332
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141490470370752086)
,p_name=>'APEX.DATA_LOAD.INSERT'
,p_message_language=>'pt'
,p_message_text=>'Inserir linha'
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141504083417752090)
,p_name=>'APEX.DATA_LOAD.SEQUENCE_ACTION'
,p_message_language=>'pt'
,p_message_text=>unistr('Sequ\00EAncia: A\00E7\00E3o')
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141490578363752086)
,p_name=>'APEX.DATA_LOAD.UPDATE'
,p_message_language=>'pt'
,p_message_text=>'Atualizar linha'
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141319060018752035)
,p_name=>'APEX.DATEPICKER.ACTIONS'
,p_message_language=>'pt'
,p_message_text=>unistr('A\00E7\00F5es')
,p_is_js_message=>true
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141346605067752043)
,p_name=>'APEX.DATEPICKER.AM_PM'
,p_message_language=>'pt'
,p_message_text=>'AM/PM'
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141332740604752039)
,p_name=>'APEX.DATEPICKER.BOUNDARY_ITEM_FORMAT_INVALID'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 deve ser um seletor de datas ou uma data v\00E1lida, por exemplo, %1.')
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141441942552752071)
,p_name=>'APEX.DATEPICKER.CLEAR'
,p_message_language=>'pt'
,p_message_text=>'Limpar'
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141350190011752044)
,p_name=>'APEX.DATEPICKER.DONE'
,p_message_language=>'pt'
,p_message_text=>unistr('Conclu\00EDdo')
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141361194763752048)
,p_name=>'APEX.DATEPICKER.FORMAT_NOT_SUPPORTED'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 tem partes n\00E3o suportadas na m\00E1scara de formato: %1')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141346397527752043)
,p_name=>'APEX.DATEPICKER.HOUR'
,p_message_language=>'pt'
,p_message_text=>'Hora'
,p_is_js_message=>true
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141430206907752068)
,p_name=>'APEX.DATEPICKER.ICON_TEXT'
,p_message_language=>'pt'
,p_message_text=>unistr('Calend\00E1rio Sobreposto: %0')
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141346124596752043)
,p_name=>'APEX.DATEPICKER.ISO_WEEK'
,p_message_language=>'pt'
,p_message_text=>'Semana'
,p_is_js_message=>true
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141346256633752043)
,p_name=>'APEX.DATEPICKER.ISO_WEEK_ABBR'
,p_message_language=>'pt'
,p_message_text=>'Sem.'
,p_is_js_message=>true
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141346535905752043)
,p_name=>'APEX.DATEPICKER.MINUTES'
,p_message_language=>'pt'
,p_message_text=>'Minutos'
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141346731814752043)
,p_name=>'APEX.DATEPICKER.MONTH'
,p_message_language=>'pt'
,p_message_text=>unistr('M\00EAs')
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141347167881752043)
,p_name=>'APEX.DATEPICKER.NEXT_MONTH'
,p_message_language=>'pt'
,p_message_text=>unistr('M\00EAs Seguinte')
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141316772946752034)
,p_name=>'APEX.DATEPICKER.POPUP'
,p_message_language=>'pt'
,p_message_text=>'Janela Sobreposta para %0'
,p_is_js_message=>true
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141347041958752043)
,p_name=>'APEX.DATEPICKER.PREVIOUS_MONTH'
,p_message_language=>'pt'
,p_message_text=>unistr('M\00EAs Anterior')
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141439537228752071)
,p_name=>'APEX.DATEPICKER.READONLY_DATEPICKER'
,p_message_language=>'pt'
,p_message_text=>unistr('Seletor de data s\00F3 de leitura')
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141347992857752044)
,p_name=>'APEX.DATEPICKER.SELECT_DATE'
,p_message_language=>'pt'
,p_message_text=>'Selecionar Data'
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141316805461752035)
,p_name=>'APEX.DATEPICKER.SELECT_DATE_AND_TIME'
,p_message_language=>'pt'
,p_message_text=>'Selecionar Data e Hora'
,p_is_js_message=>true
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141314018716752034)
,p_name=>'APEX.DATEPICKER.SELECT_DAY'
,p_message_language=>'pt'
,p_message_text=>'Selecionar Dia'
,p_is_js_message=>true
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141317449577752035)
,p_name=>'APEX.DATEPICKER.SELECT_MONTH_AND_YEAR'
,p_message_language=>'pt'
,p_message_text=>unistr('Selecionar M\00EAs e Ano')
,p_is_js_message=>true
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141314204729752034)
,p_name=>'APEX.DATEPICKER.SELECT_TIME'
,p_message_language=>'pt'
,p_message_text=>'Selecionar Hora'
,p_is_js_message=>true
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141314753048752034)
,p_name=>'APEX.DATEPICKER.TODAY'
,p_message_language=>'pt'
,p_message_text=>'Hoje'
,p_is_js_message=>true
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141332344557752039)
,p_name=>'APEX.DATEPICKER.VALUE_INVALID'
,p_message_language=>'pt'
,p_message_text=>unistr('#LABEL# deve ser uma data v\00E1lida; por exemplo, %0.')
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141332090424752039)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_BETWEEN'
,p_message_language=>'pt'
,p_message_text=>'#LABEL# deve estar entre %0 e %1.'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141332187504752039)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_ON_OR_AFTER'
,p_message_language=>'pt'
,p_message_text=>'#LABEL# deve ser igual ou posterior a %0.'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141332259695752039)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_ON_OR_BEFORE'
,p_message_language=>'pt'
,p_message_text=>'#LABEL# deve ser igual ou anterior a %0.'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141323670434752037)
,p_name=>'APEX.DATEPICKER.VISUALLY_HIDDEN_EDIT'
,p_message_language=>'pt'
,p_message_text=>unistr('Edi\00E7\00E3o Visualmente Oculta')
,p_is_js_message=>true
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141346913709752043)
,p_name=>'APEX.DATEPICKER.YEAR'
,p_message_language=>'pt'
,p_message_text=>'Ano'
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141433900427752069)
,p_name=>'APEX.DATEPICKER_VALUE_GREATER_MAX_DATE'
,p_message_language=>'pt'
,p_message_text=>unistr('#LABEL# \00E9 posterior \00E0 data m\00E1xima especificada %0.')
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141434391997752069)
,p_name=>'APEX.DATEPICKER_VALUE_INVALID'
,p_message_language=>'pt'
,p_message_text=>unistr('#LABEL# n\00E3o corresponde ao formato %0.')
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141433860019752069)
,p_name=>'APEX.DATEPICKER_VALUE_LESS_MIN_DATE'
,p_message_language=>'pt'
,p_message_text=>unistr('#LABEL# \00E9 anterior \00E0 data m\00EDnima especificada %0.')
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141434072297752069)
,p_name=>'APEX.DATEPICKER_VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'pt'
,p_message_text=>unistr('#LABEL# n\00E3o est\00E1 no intervalo v\00E1lido de %0 a %1.')
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141434206205752069)
,p_name=>'APEX.DATEPICKER_VALUE_NOT_IN_YEAR_RANGE'
,p_message_language=>'pt'
,p_message_text=>unistr('#LABEL# n\00E3o est\00E1 no intervalo de anos v\00E1lido de %0 e %1.')
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141326009949752037)
,p_name=>'APEX.DBMS_CLOUD_INT.DBMS_CLOUD_ERROR'
,p_message_language=>'pt'
,p_message_text=>'Ocorreu um erro interno ao processar o pedido DBMS_CLOUD.'
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141486602403752085)
,p_name=>'APEX.DIALOG.CANCEL'
,p_message_language=>'pt'
,p_message_text=>'Cancelar'
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141512573535752092)
,p_name=>'APEX.DIALOG.CLOSE'
,p_message_language=>'pt'
,p_message_text=>'Fechar'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141373750595752051)
,p_name=>'APEX.DIALOG.CONFIRMATION'
,p_message_language=>'pt'
,p_message_text=>unistr('Confirma\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141514522297752093)
,p_name=>'APEX.DIALOG.HELP'
,p_message_language=>'pt'
,p_message_text=>unistr('Aux\00EDlio')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141486439597752084)
,p_name=>'APEX.DIALOG.OK'
,p_message_language=>'pt'
,p_message_text=>'OK'
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141486551327752085)
,p_name=>'APEX.DIALOG.SAVE'
,p_message_language=>'pt'
,p_message_text=>'Gravar'
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141354281248752045)
,p_name=>'APEX.DIALOG.TITLE'
,p_message_language=>'pt'
,p_message_text=>unistr('T\00EDtulo da Caixa de Di\00E1logo')
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141393944086752057)
,p_name=>'APEX.DIALOG.VISUALLY_HIDDEN_TITLE'
,p_message_language=>'pt'
,p_message_text=>unistr('T\00EDtulo da caixa de di\00E1logo visualmente oculta')
,p_is_js_message=>true
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141315098806752034)
,p_name=>'APEX.DOCGEN'
,p_message_language=>'pt'
,p_message_text=>unistr('Fun\00E7\00E3o Pr\00E9-Criada do Gerador de Documentos da Oracle')
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141325863442752037)
,p_name=>'APEX.DOCGEN.DBMS_CLOUD_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro na impress\00E3o do documento.')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141303064019752030)
,p_name=>'APEX.DOCGEN.INVALID_OUTPUT_TYPE'
,p_message_language=>'pt'
,p_message_text=>unistr('%s n\00E3o suporta %1 como sa\00EDda de dados.')
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141314989988752034)
,p_name=>'APEX.DOCGEN.INVOKE_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro "%0" ao invocar a Fun\00E7\00E3o Pr\00E9-Criada do Gerador de Documentos da Oracle:')
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141306400741752031)
,p_name=>'APEX.DOCGEN.TEMPLATE_REQUIRED'
,p_message_language=>'pt'
,p_message_text=>unistr('\00C9 obrigat\00F3rio um modelo.')
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141331820180752039)
,p_name=>'APEX.DOWNLOAD.ERROR'
,p_message_language=>'pt'
,p_message_text=>'Erro durante o descarregamento do ficheiro.'
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141331742932752039)
,p_name=>'APEX.DOWNLOAD.NO_DATA_FOUND'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o foram encontrados dados descarreg\00E1veis.')
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141335370677752040)
,p_name=>'APEX.ENVIRONMENT.RUNTIME_ONLY'
,p_message_language=>'pt'
,p_message_text=>unistr('Esta funcionalidade n\00E3o est\00E1 dispon\00EDvel num ambiente S\00F3 de Runtime.')
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141388177364752055)
,p_name=>'APEX.ERROR'
,p_message_language=>'pt'
,p_message_text=>'Erro'
,p_is_js_message=>true
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141348011945752044)
,p_name=>'APEX.ERROR.CALLBACK_FAILED'
,p_message_language=>'pt'
,p_message_text=>'Ocorreu o erro seguinte ao executar a callback de tratamento de erros: %0'
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141360619524752047)
,p_name=>'APEX.ERROR.ERROR_PAGE.UNHANDLED_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('Ocorreu um erro ao pintar a p\00E1gina de erro: %0')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141349771479752044)
,p_name=>'APEX.ERROR.INTERNAL'
,p_message_language=>'pt'
,p_message_text=>'Erro Interno'
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141499436744752088)
,p_name=>'APEX.ERROR.INTERNAL.CONTACT_ADMINISTRATOR'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Contacte o administrador.',
unistr('Existem detalhes sobre este incidente dispon\00EDveis atrav\00E9s da ID de depura\00E7\00E3o "%0".')))
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141494009800752087)
,p_name=>'APEX.ERROR.ORA-16000'
,p_message_language=>'pt'
,p_message_text=>unistr('A base de dados est\00E1 aberta para acesso s\00F3 de leitura.')
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141524156401752096)
,p_name=>'APEX.ERROR.ORA-28353'
,p_message_language=>'pt'
,p_message_text=>unistr('ORA-28353: Falha ao abrir o wallet. Dados da aplica\00E7\00E3o n\00E3o acess\00EDveis atualmente.')
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141494188066752087)
,p_name=>'APEX.ERROR.PAGE_NOT_AVAILABLE'
,p_message_language=>'pt'
,p_message_text=>unistr('Esta p\00E1gina n\00E3o est\00E1 dispon\00EDvel')
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141352736693752045)
,p_name=>'APEX.ERROR.TECHNICAL_INFO'
,p_message_language=>'pt'
,p_message_text=>unistr('Informa\00E7\00F5es t\00E9cnicas (dispon\00EDveis apenas para programadores)')
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141458652698752076)
,p_name=>'APEX.ERROR_MESSAGE_HEADING'
,p_message_language=>'pt'
,p_message_text=>'Mensagem de Erro'
,p_is_js_message=>true
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141472548541752080)
,p_name=>'APEX.EXPECTED_FORMAT'
,p_message_language=>'pt'
,p_message_text=>'Formato esperado: %0'
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141437471640752070)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.ALREADY_IN_ACL'
,p_message_language=>'pt'
,p_message_text=>unistr('O Utilizador j\00E1 existe na Lista de Controlo de Acesso')
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141437316167752070)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.CREATE_CONFIRM'
,p_message_language=>'pt'
,p_message_text=>unistr('Confirme a adi\00E7\00E3o do(s) seguinte(s) %0 utilizador(es) \00E0 lista de controlo de acesso <strong>%1</strong>.')
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141437896565752070)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.DUPLICATE_USER'
,p_message_language=>'pt'
,p_message_text=>'Existe um utilizador duplicado'
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141437569889752070)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.MISSING_AT_SIGN'
,p_message_language=>'pt'
,p_message_text=>unistr('Falta o sinal de arroba (@) no endere\00E7o de Email')
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141437617892752070)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.MISSING_DOT'
,p_message_language=>'pt'
,p_message_text=>unistr('Falta o ponto final (.) no endere\00E7o de Email')
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141437752973752070)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.USERNAME_TOO_LONG'
,p_message_language=>'pt'
,p_message_text=>unistr('O nome de utilizador \00E9 demasiado longo')
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141438082148752070)
,p_name=>'APEX.FEATURE.ACL.INFO.ACL_ONLY'
,p_message_language=>'pt'
,p_message_text=>unistr('Apenas os utilizadores definidos na lista de controlo de acesso podem aceder a esta aplica\00E7\00E3o')
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141438108123752070)
,p_name=>'APEX.FEATURE.ACL.INFO.ACL_VALUE_INVALID'
,p_message_language=>'pt'
,p_message_text=>unistr('Valor de Defini\00E7\00E3o de Controlo de Acesso Inesperado: %0')
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141437906204752070)
,p_name=>'APEX.FEATURE.ACL.INFO.ALL_USERS'
,p_message_language=>'pt'
,p_message_text=>unistr('Todos os utilizadores autenticados podem aceder a esta aplica\00E7\00E3o')
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141482414299752083)
,p_name=>'APEX.FEATURE.CONFIG.DISABLED'
,p_message_language=>'pt'
,p_message_text=>'Desativado'
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141482391253752083)
,p_name=>'APEX.FEATURE.CONFIG.ENABLED'
,p_message_language=>'pt'
,p_message_text=>'Ativado'
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141482653117752083)
,p_name=>'APEX.FEATURE.CONFIG.IS_DISABLED'
,p_message_language=>'pt'
,p_message_text=>unistr('%0: Est\00E1 Desativado')
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141482559512752083)
,p_name=>'APEX.FEATURE.CONFIG.IS_ENABLED'
,p_message_language=>'pt'
,p_message_text=>unistr('%0: Est\00E1 Ativado')
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141331154745752039)
,p_name=>'APEX.FEATURE.CONFIG.NOT_SUPPORTED'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o Suportado')
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141392333210752057)
,p_name=>'APEX.FEATURE.CONFIG.OFF'
,p_message_language=>'pt'
,p_message_text=>'Desativado'
,p_is_js_message=>true
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141392212833752057)
,p_name=>'APEX.FEATURE.CONFIG.ON'
,p_message_language=>'pt'
,p_message_text=>'Ativado'
,p_is_js_message=>true
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141482275743752083)
,p_name=>'APEX.FEATURE.TOP_USERS.USERNAME.NOT_IDENTIFIED'
,p_message_language=>'pt'
,p_message_text=>unistr('n\00E3o identificado')
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141322727114752036)
,p_name=>'APEX.FILESIZE.BYTES'
,p_message_language=>'pt'
,p_message_text=>'%0 Bytes'
,p_is_js_message=>true
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141323200337752036)
,p_name=>'APEX.FILESIZE.GB'
,p_message_language=>'pt'
,p_message_text=>'%0 GB'
,p_is_js_message=>true
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141322922283752036)
,p_name=>'APEX.FILESIZE.KB'
,p_message_language=>'pt'
,p_message_text=>'%0 KB'
,p_is_js_message=>true
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141323104363752036)
,p_name=>'APEX.FILESIZE.MB'
,p_message_language=>'pt'
,p_message_text=>'%0 MB'
,p_is_js_message=>true
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141475447226752081)
,p_name=>'APEX.FILE_BROWSE.DOWNLOAD_LINK_TEXT'
,p_message_language=>'pt'
,p_message_text=>'Descarregar'
,p_is_js_message=>true
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141328535565752038)
,p_name=>'APEX.FS.ACTIONS_MENU_BUTTON_LABEL'
,p_message_language=>'pt'
,p_message_text=>unistr('Op\00E7\00F5es')
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141328209841752038)
,p_name=>'APEX.FS.ACTIONS_MENU_FILTER'
,p_message_language=>'pt'
,p_message_text=>'Filtrar'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141328432044752038)
,p_name=>'APEX.FS.ACTIONS_MENU_HIDE'
,p_message_language=>'pt'
,p_message_text=>'Ocultar Faceta'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141353115656752045)
,p_name=>'APEX.FS.ADD_FILTER'
,p_message_language=>'pt'
,p_message_text=>'Acrescentar Filtro'
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141429473053752068)
,p_name=>'APEX.FS.APPLIED_FACET'
,p_message_language=>'pt'
,p_message_text=>'Filtro %0 Aplicado'
,p_is_js_message=>true
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141353849089752045)
,p_name=>'APEX.FS.APPLY'
,p_message_language=>'pt'
,p_message_text=>'Aplicar'
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141473097875752081)
,p_name=>'APEX.FS.BATCH_APPLY'
,p_message_language=>'pt'
,p_message_text=>'Aplicar'
,p_is_js_message=>true
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141353975118752045)
,p_name=>'APEX.FS.CANCEL'
,p_message_language=>'pt'
,p_message_text=>'Cancelar'
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141337730675752041)
,p_name=>'APEX.FS.CHART_BAR'
,p_message_language=>'pt'
,p_message_text=>unistr('Gr\00E1fico de Barras')
,p_is_js_message=>true
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141485715992752084)
,p_name=>'APEX.FS.CHART_OTHERS'
,p_message_language=>'pt'
,p_message_text=>'Outros'
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141337824854752041)
,p_name=>'APEX.FS.CHART_PIE'
,p_message_language=>'pt'
,p_message_text=>'Sectograma'
,p_is_js_message=>true
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141484328109752084)
,p_name=>'APEX.FS.CHART_TITLE'
,p_message_language=>'pt'
,p_message_text=>'Diagrama'
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141337551555752041)
,p_name=>'APEX.FS.CHART_VALUE_LABEL'
,p_message_language=>'pt'
,p_message_text=>'Contagem'
,p_is_js_message=>true
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141473546658752081)
,p_name=>'APEX.FS.CLEAR'
,p_message_language=>'pt'
,p_message_text=>'Limpar'
,p_is_js_message=>true
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141473640544752081)
,p_name=>'APEX.FS.CLEAR_ALL'
,p_message_language=>'pt'
,p_message_text=>'Limpar Tudo'
,p_is_js_message=>true
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141473708326752081)
,p_name=>'APEX.FS.CLEAR_VALUE'
,p_message_language=>'pt'
,p_message_text=>'Limpar %0'
,p_is_js_message=>true
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141490281013752086)
,p_name=>'APEX.FS.COLUMN_UNAUTHORIZED'
,p_message_language=>'pt'
,p_message_text=>unistr('A coluna %1, referenciada pela faceta %0, n\00E3o est\00E1 dispon\00EDvel ou n\00E3o est\00E1 autorizada.')
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141300991076752030)
,p_name=>'APEX.FS.CONFIG_TITLE'
,p_message_language=>'pt'
,p_message_text=>'Escolher Filtros para mostrar'
,p_is_js_message=>true
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141427490925752067)
,p_name=>'APEX.FS.COUNT_RESULTS'
,p_message_language=>'pt'
,p_message_text=>'%0 resultados'
,p_is_js_message=>true
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141427506987752067)
,p_name=>'APEX.FS.COUNT_SELECTED'
,p_message_language=>'pt'
,p_message_text=>'%0 selecionado'
,p_is_js_message=>true
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141430352167752068)
,p_name=>'APEX.FS.CUR_FILTERS_LM'
,p_message_language=>'pt'
,p_message_text=>'Filtros atuais'
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141305996686752031)
,p_name=>'APEX.FS.FACETED_SEARCH_NEEDS_REGION_QUERY'
,p_message_language=>'pt'
,p_message_text=>unistr('A Pesquisa Facetada requer uma Origem de Dados ao n\00EDvel da regi\00E3o.')
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141309601821752032)
,p_name=>'APEX.FS.FACETS_LIST'
,p_message_language=>'pt'
,p_message_text=>'Lista de filtros'
,p_is_js_message=>true
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141488793211752085)
,p_name=>'APEX.FS.FACET_VALUE_LIMIT_EXCEEDED'
,p_message_language=>'pt'
,p_message_text=>'Limite de valor distinto (%0) excedido para a faceta %1.'
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141475076284752081)
,p_name=>'APEX.FS.FC_TYPE_UNSUPPORTED_FOR_DATE_COLUMNS'
,p_message_language=>'pt'
,p_message_text=>unistr('A faceta %0 n\00E3o \00E9 suportada para colunas DATE ou TIMESTAMP.')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141473197438752081)
,p_name=>'APEX.FS.FILTER'
,p_message_language=>'pt'
,p_message_text=>'Filtrar %0'
,p_is_js_message=>true
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141347790829752044)
,p_name=>'APEX.FS.FILTER_APPLIED'
,p_message_language=>'pt'
,p_message_text=>'%0 (Filtro Aplicado)'
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141473238583752081)
,p_name=>'APEX.FS.GO'
,p_message_language=>'pt'
,p_message_text=>'Ir'
,p_is_js_message=>true
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141343272457752042)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_C'
,p_message_language=>'pt'
,p_message_text=>unistr('cont\00E9m %0')
,p_is_js_message=>true
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141474682956752081)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_EQ'
,p_message_language=>'pt'
,p_message_text=>'igual a %0'
,p_is_js_message=>true
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141342961346752042)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_GT'
,p_message_language=>'pt'
,p_message_text=>'maior que %0'
,p_is_js_message=>true
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141343025890752042)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_GTE'
,p_message_language=>'pt'
,p_message_text=>'maior que ou igual a %0'
,p_is_js_message=>true
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141342675187752042)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_LT'
,p_message_language=>'pt'
,p_message_text=>'menor que %0'
,p_is_js_message=>true
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141342819602752042)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_LTE'
,p_message_language=>'pt'
,p_message_text=>'menor que ou igual a %0'
,p_is_js_message=>true
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141342139842752042)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NC'
,p_message_language=>'pt'
,p_message_text=>unistr('n\00E3o cont\00E9m %0')
,p_is_js_message=>true
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141327946168752038)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NEQ'
,p_message_language=>'pt'
,p_message_text=>'diferente de %0'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141342235732752042)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NSTARTS'
,p_message_language=>'pt'
,p_message_text=>unistr('n\00E3o come\00E7a por %0')
,p_is_js_message=>true
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141343167607752042)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_STARTS'
,p_message_language=>'pt'
,p_message_text=>unistr('come\00E7a por %0')
,p_is_js_message=>true
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141341243886752042)
,p_name=>'APEX.FS.INPUT_FACET_SELECTOR'
,p_message_language=>'pt'
,p_message_text=>unistr('Sele\00E7\00E3o de Faceta')
,p_is_js_message=>true
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141317081982752035)
,p_name=>'APEX.FS.INPUT_INVALID_FILTER_PREFIX'
,p_message_language=>'pt'
,p_message_text=>unistr('Prefixo do filtro %0" inv\00E1lido para a faceta "%1".')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141315475210752034)
,p_name=>'APEX.FS.INPUT_MISSING_FILTER_PREFIX'
,p_message_language=>'pt'
,p_message_text=>'Prefixo do filtro em falta para a faceta "%0".'
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141349691168752044)
,p_name=>'APEX.FS.INPUT_OPERATOR'
,p_message_language=>'pt'
,p_message_text=>'Operador'
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141331518665752039)
,p_name=>'APEX.FS.INPUT_OPERATOR.C'
,p_message_language=>'pt'
,p_message_text=>unistr('cont\00E9m')
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141330539134752039)
,p_name=>'APEX.FS.INPUT_OPERATOR.EQ'
,p_message_language=>'pt'
,p_message_text=>'igual a'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141331225615752039)
,p_name=>'APEX.FS.INPUT_OPERATOR.GT'
,p_message_language=>'pt'
,p_message_text=>'maior que'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141331397717752039)
,p_name=>'APEX.FS.INPUT_OPERATOR.GTE'
,p_message_language=>'pt'
,p_message_text=>'maior que ou igual a'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141330924965752039)
,p_name=>'APEX.FS.INPUT_OPERATOR.LT'
,p_message_language=>'pt'
,p_message_text=>'menor que'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141331072486752039)
,p_name=>'APEX.FS.INPUT_OPERATOR.LTE'
,p_message_language=>'pt'
,p_message_text=>'menor que ou igual a'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141342063606752042)
,p_name=>'APEX.FS.INPUT_OPERATOR.NC'
,p_message_language=>'pt'
,p_message_text=>unistr('n\00E3o cont\00E9m')
,p_is_js_message=>true
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141330733108752039)
,p_name=>'APEX.FS.INPUT_OPERATOR.NEQ'
,p_message_language=>'pt'
,p_message_text=>'diferente'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141341902935752042)
,p_name=>'APEX.FS.INPUT_OPERATOR.NSTARTS'
,p_message_language=>'pt'
,p_message_text=>unistr('n\00E3o come\00E7a por')
,p_is_js_message=>true
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141331471486752039)
,p_name=>'APEX.FS.INPUT_OPERATOR.STARTS'
,p_message_language=>'pt'
,p_message_text=>unistr('come\00E7a por')
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141350052251752044)
,p_name=>'APEX.FS.INPUT_UNSUPPORTED_DATA_TYPE'
,p_message_language=>'pt'
,p_message_text=>unistr('O tipo de dados %0 (%1) n\00E3o \00E9 suportado para a faceta Campo de Entrada de Dados.')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141316921114752035)
,p_name=>'APEX.FS.INPUT_UNSUPPORTED_FILTER_FOR_DATA_TYPE'
,p_message_language=>'pt'
,p_message_text=>unistr('O filtro "%0" n\00E3o \00E9 suportado para a faceta "%1" (tipo de dados %2).')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141349500141752044)
,p_name=>'APEX.FS.INPUT_VALUE'
,p_message_language=>'pt'
,p_message_text=>'Valor'
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141474871579752081)
,p_name=>'APEX.FS.NO_SEARCH_COLUMNS_PROVIDED'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o foram fornecidas colunas de pesquisa para a faceta %0')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141301033923752030)
,p_name=>'APEX.FS.OPEN_CONFIG'
,p_message_language=>'pt'
,p_message_text=>'Mais Filtros'
,p_is_js_message=>true
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141427679463752067)
,p_name=>'APEX.FS.RANGE_BEGIN'
,p_message_language=>'pt'
,p_message_text=>unistr('In\00EDcio do Intervalo')
,p_is_js_message=>true
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141474399575752081)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL'
,p_message_language=>'pt'
,p_message_text=>'%0 a %1'
,p_is_js_message=>true
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141474481581752081)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL_OPEN_HI'
,p_message_language=>'pt'
,p_message_text=>'Acima de %0'
,p_is_js_message=>true
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141474585047752081)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL_OPEN_LO'
,p_message_language=>'pt'
,p_message_text=>'Abaixo de %0'
,p_is_js_message=>true
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141427749876752067)
,p_name=>'APEX.FS.RANGE_END'
,p_message_language=>'pt'
,p_message_text=>'Fim do Intervalo'
,p_is_js_message=>true
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141492368796752086)
,p_name=>'APEX.FS.RANGE_LOV_ITEM_INVALID'
,p_message_language=>'pt'
,p_message_text=>unistr('O item da LDV #%2 ("%1") para a faceta de intervalo %0 \00E9 inv\00E1lido (separador "|" em falta).')
,p_version_scn=>2705332
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141474773817752081)
,p_name=>'APEX.FS.RANGE_MANUAL_NOT_SUPPORTED'
,p_message_language=>'pt'
,p_message_text=>unistr('A Entrada de Dados Manual para a faceta Intervalo %0 n\00E3o \00E9 suportada atualmente, uma vez que a coluna \00E9 DATE ou TIMESTAMP.')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141474055670752081)
,p_name=>'APEX.FS.RANGE_TEXT'
,p_message_language=>'pt'
,p_message_text=>'para'
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141337671874752041)
,p_name=>'APEX.FS.REMOVE_CHART'
,p_message_language=>'pt'
,p_message_text=>'Retirar Diagrama'
,p_is_js_message=>true
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141424024849752066)
,p_name=>'APEX.FS.RESET'
,p_message_language=>'pt'
,p_message_text=>'Redefinir'
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141473489413752081)
,p_name=>'APEX.FS.SEARCH_LABEL'
,p_message_language=>'pt'
,p_message_text=>'Pesquisar'
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141473372235752081)
,p_name=>'APEX.FS.SEARCH_PLACEHOLDER'
,p_message_language=>'pt'
,p_message_text=>'Pesquisar...'
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141474242016752081)
,p_name=>'APEX.FS.SELECT_PLACEHOLDER'
,p_message_language=>'pt'
,p_message_text=>'- Selecionar -'
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141337454507752041)
,p_name=>'APEX.FS.SHOW_CHART'
,p_message_language=>'pt'
,p_message_text=>unistr('Mostrar Gr\00E1fico')
,p_is_js_message=>true
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141473831638752081)
,p_name=>'APEX.FS.SHOW_LESS'
,p_message_language=>'pt'
,p_message_text=>'Mostrar Menos'
,p_is_js_message=>true
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141473975671752081)
,p_name=>'APEX.FS.SHOW_MORE'
,p_message_language=>'pt'
,p_message_text=>'Mostrar Tudo'
,p_is_js_message=>true
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141474124202752081)
,p_name=>'APEX.FS.STAR_RATING_LABEL'
,p_message_language=>'pt'
,p_message_text=>'%0 estrelas e mais'
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141429350575752068)
,p_name=>'APEX.FS.SUGGESTIONS'
,p_message_language=>'pt'
,p_message_text=>unistr('Filtrar sugest\00F5es')
,p_is_js_message=>true
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141474990453752081)
,p_name=>'APEX.FS.TEXT_FIELD_ONLY_FOR_NUMBER_COLUMNS'
,p_message_language=>'pt'
,p_message_text=>unistr('A faceta Campo de Texto %0 atualmente s\00F3 \00E9 suportada para colunas NUMBER.')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141300415992752030)
,p_name=>'APEX.FS.TOTAL_ROW_COUNT_LABEL'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00FAmero Total de Linhas')
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141490387903752086)
,p_name=>'APEX.FS.UNSUPPORTED_DATA_TYPE'
,p_message_language=>'pt'
,p_message_text=>unistr('O tipo de dados %0 (%1) n\00E3o \00E9 suportado para a pesquisa facetada.')
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141420588529752065)
,p_name=>'APEX.FS.VISUALLY_HIDDEN_HEADING'
,p_message_language=>'pt'
,p_message_text=>unistr('T\00EDtulo visualmente oculto')
,p_is_js_message=>true
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141482892574752083)
,p_name=>'APEX.GO_TO_ERROR'
,p_message_language=>'pt'
,p_message_text=>'Ir para o erro'
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141438829409752070)
,p_name=>'APEX.GV.AGG_CONTEXT'
,p_message_language=>'pt'
,p_message_text=>unistr('Agrega\00E7\00E3o.')
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141366732218752049)
,p_name=>'APEX.GV.BLANK_HEADING'
,p_message_language=>'pt'
,p_message_text=>unistr('T\00EDtulo em branco')
,p_is_js_message=>true
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141448150451752073)
,p_name=>'APEX.GV.BREAK_COLLAPSE'
,p_message_language=>'pt'
,p_message_text=>unistr('Contrair controlo de interrup\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141438982208752070)
,p_name=>'APEX.GV.BREAK_CONTEXT'
,p_message_language=>'pt'
,p_message_text=>unistr('Controlo de interrup\00E7\00E3o.')
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141448047179752073)
,p_name=>'APEX.GV.BREAK_EXPAND'
,p_message_language=>'pt'
,p_message_text=>unistr('Expandir controlo de interrup\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141447865330752073)
,p_name=>'APEX.GV.DELETED_COUNT'
,p_message_language=>'pt'
,p_message_text=>'%0 linhas apagadas'
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141516910872752094)
,p_name=>'APEX.GV.DUP_REC_ID'
,p_message_language=>'pt'
,p_message_text=>'Identidade duplicada'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141309828431752032)
,p_name=>'APEX.GV.ENTER_EDIT_MODE'
,p_message_language=>'pt'
,p_message_text=>unistr('A entrar no modo de edi\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141435715681752070)
,p_name=>'APEX.GV.FIRST_PAGE'
,p_message_language=>'pt'
,p_message_text=>'Primeiro'
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141308647511752032)
,p_name=>'APEX.GV.FLOATING_ITEM.DIALOG.HIDE_DIALOG'
,p_message_language=>'pt'
,p_message_text=>unistr('Ocultar caixa de di\00E1logo')
,p_is_js_message=>true
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141307624647752032)
,p_name=>'APEX.GV.FLOATING_ITEM.DIALOG.TITLE'
,p_message_language=>'pt'
,p_message_text=>unistr('Conte\00FAdo da c\00E9lula de excesso de dados flutuante')
,p_is_js_message=>true
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141308977615752032)
,p_name=>'APEX.GV.FLOATING_ITEM.SHOW_DIALOG'
,p_message_language=>'pt'
,p_message_text=>unistr('Mostrar este conte\00FAdo do excesso de dados')
,p_is_js_message=>true
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141383131396752054)
,p_name=>'APEX.GV.FOOTER_LANDMARK'
,p_message_language=>'pt'
,p_message_text=>unistr('Rodap\00E9 da Grelha')
,p_is_js_message=>true
,p_version_scn=>2705310
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141439100674752071)
,p_name=>'APEX.GV.GROUP_CONTEXT'
,p_message_language=>'pt'
,p_message_text=>unistr('Cabe\00E7alho do grupo')
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141439081526752071)
,p_name=>'APEX.GV.HEADER_CONTEXT'
,p_message_language=>'pt'
,p_message_text=>unistr('Cabe\00E7alho.')
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141435873939752070)
,p_name=>'APEX.GV.LAST_PAGE'
,p_message_language=>'pt'
,p_message_text=>unistr('\00DAltimo')
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141310052103752033)
,p_name=>'APEX.GV.LEAVE_EDIT_MODE'
,p_message_language=>'pt'
,p_message_text=>unistr('A sair do modo de edi\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141334712974752040)
,p_name=>'APEX.GV.LOAD_ALL'
,p_message_language=>'pt'
,p_message_text=>'Carregar Todos'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141457672325752076)
,p_name=>'APEX.GV.LOAD_MORE'
,p_message_language=>'pt'
,p_message_text=>'Mostrar Mais'
,p_is_js_message=>true
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141435525923752069)
,p_name=>'APEX.GV.NEXT_PAGE'
,p_message_language=>'pt'
,p_message_text=>'Seguinte'
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141439283376752071)
,p_name=>'APEX.GV.PAGE_RANGE'
,p_message_language=>'pt'
,p_message_text=>unistr('Linhas da p\00E1gina')
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141348302280752044)
,p_name=>'APEX.GV.PAGE_RANGE_ENTITY'
,p_message_language=>'pt'
,p_message_text=>unistr('P\00E1gina %0')
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141435924967752070)
,p_name=>'APEX.GV.PAGE_RANGE_XY'
,p_message_language=>'pt'
,p_message_text=>'%0 - %1'
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141436025650752070)
,p_name=>'APEX.GV.PAGE_RANGE_XYZ'
,p_message_language=>'pt'
,p_message_text=>'%0 - %1 de %2'
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141492941437752086)
,p_name=>'APEX.GV.PAGE_SELECTION'
,p_message_language=>'pt'
,p_message_text=>unistr('Sele\00E7\00E3o de P\00E1ginas')
,p_is_js_message=>true
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141383444755752054)
,p_name=>'APEX.GV.PAGINATION_LANDMARK'
,p_message_language=>'pt'
,p_message_text=>unistr('Pagina\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705310
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141435606385752070)
,p_name=>'APEX.GV.PREV_PAGE'
,p_message_language=>'pt'
,p_message_text=>'Anterior'
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141333648470752039)
,p_name=>'APEX.GV.RANGE_DISPLAY'
,p_message_language=>'pt'
,p_message_text=>unistr('Ecr\00E3 do intervalo')
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141367085671752049)
,p_name=>'APEX.GV.ROWS_SELECTION'
,p_message_language=>'pt'
,p_message_text=>unistr('Sele\00E7\00E3o de Linhas')
,p_is_js_message=>true
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141516780517752093)
,p_name=>'APEX.GV.ROW_ADDED'
,p_message_language=>'pt'
,p_message_text=>'Acrescentado'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141516800215752093)
,p_name=>'APEX.GV.ROW_CHANGED'
,p_message_language=>'pt'
,p_message_text=>'Alterado'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141525161300752096)
,p_name=>'APEX.GV.ROW_COLUMN_CONTEXT'
,p_message_language=>'pt'
,p_message_text=>unistr('Sequ\00EAncia de linha de grelha %0, Coluna %1.')
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141525288096752096)
,p_name=>'APEX.GV.ROW_CONTEXT'
,p_message_language=>'pt'
,p_message_text=>unistr('Sequ\00EAncia de linha de grelha %0.')
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141516693055752093)
,p_name=>'APEX.GV.ROW_DELETED'
,p_message_language=>'pt'
,p_message_text=>'Apagado'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141439426873752071)
,p_name=>'APEX.GV.ROW_HEADER'
,p_message_language=>'pt'
,p_message_text=>unistr('Cabe\00E7alho da linha')
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141366973078752049)
,p_name=>'APEX.GV.ROW_SELECTION'
,p_message_language=>'pt'
,p_message_text=>unistr('Sele\00E7\00E3o de Linhas')
,p_is_js_message=>true
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141334870180752040)
,p_name=>'APEX.GV.SELECTED_ENTITY_COUNT'
,p_message_language=>'pt'
,p_message_text=>'%0 %1 selecionado'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141434949013752069)
,p_name=>'APEX.GV.SELECTION_CELL_COUNT'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 c\00E9lulas selecionadas')
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141436137649752070)
,p_name=>'APEX.GV.SELECTION_COUNT'
,p_message_language=>'pt'
,p_message_text=>'%0 linhas selecionadas'
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141478209943752082)
,p_name=>'APEX.GV.SELECT_ALL'
,p_message_language=>'pt'
,p_message_text=>'Selecionar Tudo'
,p_is_js_message=>true
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141371767707752051)
,p_name=>'APEX.GV.SELECT_ALL_ROWS'
,p_message_language=>'pt'
,p_message_text=>'Selecionar Todas as Linhas'
,p_is_js_message=>true
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141447923753752073)
,p_name=>'APEX.GV.SELECT_PAGE_N'
,p_message_language=>'pt'
,p_message_text=>unistr('P\00E1gina %0')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141439371118752071)
,p_name=>'APEX.GV.SELECT_ROW'
,p_message_language=>'pt'
,p_message_text=>'Selecionar Linha'
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141439688099752071)
,p_name=>'APEX.GV.SORTED_ASCENDING'
,p_message_language=>'pt'
,p_message_text=>'Ordenado por Ordem Crescente %0'
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141439722279752071)
,p_name=>'APEX.GV.SORTED_DESCENDING'
,p_message_language=>'pt'
,p_message_text=>'Ordenado por Ordem Decrescente %0'
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141435068782752069)
,p_name=>'APEX.GV.SORT_ASCENDING'
,p_message_language=>'pt'
,p_message_text=>'Ordem Crescente'
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141435371469752069)
,p_name=>'APEX.GV.SORT_ASCENDING_ORDER'
,p_message_language=>'pt'
,p_message_text=>'Ordem Crescente %0'
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141435125955752069)
,p_name=>'APEX.GV.SORT_DESCENDING'
,p_message_language=>'pt'
,p_message_text=>'Ordem Decrescente'
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141435416099752069)
,p_name=>'APEX.GV.SORT_DESCENDING_ORDER'
,p_message_language=>'pt'
,p_message_text=>'Ordem Decrescente %0'
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141435299737752069)
,p_name=>'APEX.GV.SORT_OFF'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o Ordenar')
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141300834647752030)
,p_name=>'APEX.GV.SORT_OPTIONS'
,p_message_language=>'pt'
,p_message_text=>unistr('Op\00E7\00F5es de ordena\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141383252182752054)
,p_name=>'APEX.GV.STATE_ICONS_LANDMARK'
,p_message_language=>'pt'
,p_message_text=>unistr('\00CDcones de Estado')
,p_is_js_message=>true
,p_version_scn=>2705310
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141383367613752054)
,p_name=>'APEX.GV.STATUS_LANDMARK'
,p_message_language=>'pt'
,p_message_text=>'Estado da Grelha'
,p_is_js_message=>true
,p_version_scn=>2705310
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141313182111752033)
,p_name=>'APEX.GV.TOTAL_ENTITY_PLURAL'
,p_message_language=>'pt'
,p_message_text=>'%0 %1'
,p_is_js_message=>true
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141312852108752033)
,p_name=>'APEX.GV.TOTAL_ENTITY_SINGULAR'
,p_message_language=>'pt'
,p_message_text=>'1 %0'
,p_is_js_message=>true
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141447757039752073)
,p_name=>'APEX.GV.TOTAL_PAGES'
,p_message_language=>'pt'
,p_message_text=>'Total de %0'
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141366545753752049)
,p_name=>'APEX.HTTP.REQUEST_FAILED'
,p_message_language=>'pt'
,p_message_text=>'Falha no pedido de HTTP para "%0".'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141368118124752050)
,p_name=>'APEX.ICON_LIST.COLUMN'
,p_message_language=>'pt'
,p_message_text=>'Coluna %0'
,p_is_js_message=>true
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141368327197752050)
,p_name=>'APEX.ICON_LIST.COLUMN_AND_ROW'
,p_message_language=>'pt'
,p_message_text=>'Coluna %0 e linha %1'
,p_is_js_message=>true
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141368633473752050)
,p_name=>'APEX.ICON_LIST.FIRST_COLUMN'
,p_message_language=>'pt'
,p_message_text=>unistr('J\00E1 na primeira coluna. Coluna %0 e linha %1')
,p_is_js_message=>true
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141368517510752050)
,p_name=>'APEX.ICON_LIST.FIRST_ROW'
,p_message_language=>'pt'
,p_message_text=>unistr('J\00E1 na primeira linha. Coluna %0 e linha %1')
,p_is_js_message=>true
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141514118588752093)
,p_name=>'APEX.ICON_LIST.GRID_DIM'
,p_message_language=>'pt'
,p_message_text=>'Apresentado em %0 colunas e %1 linhas'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141368718769752050)
,p_name=>'APEX.ICON_LIST.LAST_COLUMN'
,p_message_language=>'pt'
,p_message_text=>unistr('J\00E1 na \00FAltima coluna. Coluna %0 e linha %1')
,p_is_js_message=>true
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141368436431752050)
,p_name=>'APEX.ICON_LIST.LAST_ROW'
,p_message_language=>'pt'
,p_message_text=>unistr('J\00E1 na \00FAltima linha. Coluna %0 e linha %1')
,p_is_js_message=>true
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141447638141752073)
,p_name=>'APEX.ICON_LIST.LIST_DIM'
,p_message_language=>'pt'
,p_message_text=>'Apresentado em %0 linhas'
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141368285971752050)
,p_name=>'APEX.ICON_LIST.ROW'
,p_message_language=>'pt'
,p_message_text=>'Linha %0'
,p_is_js_message=>true
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141524932608752096)
,p_name=>'APEX.IG.ACC_LABEL'
,p_message_language=>'pt'
,p_message_text=>'Grelha Interativa %0'
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141432089183752068)
,p_name=>'APEX.IG.ACTIONS'
,p_message_language=>'pt'
,p_message_text=>unistr('A\00E7\00F5es')
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141433002115752069)
,p_name=>'APEX.IG.ADD'
,p_message_language=>'pt'
,p_message_text=>'Acrescentar'
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141432931888752069)
,p_name=>'APEX.IG.ADD_ROW'
,p_message_language=>'pt'
,p_message_text=>'Acrescentar Linha'
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141518576728752094)
,p_name=>'APEX.IG.AGGREGATE'
,p_message_language=>'pt'
,p_message_text=>'Agregar'
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141504112753752090)
,p_name=>'APEX.IG.AGGREGATION'
,p_message_language=>'pt'
,p_message_text=>unistr('Agrega\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141505850235752090)
,p_name=>'APEX.IG.ALL'
,p_message_language=>'pt'
,p_message_text=>'Tudo'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141463485251752078)
,p_name=>'APEX.IG.ALL_TEXT_COLUMNS'
,p_message_language=>'pt'
,p_message_text=>'Todas as Colunas de Texto'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141464647597752078)
,p_name=>'APEX.IG.ALTERNATIVE'
,p_message_language=>'pt'
,p_message_text=>'Alternativo'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141465718120752078)
,p_name=>'APEX.IG.AND'
,p_message_language=>'pt'
,p_message_text=>'e'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141485162993752084)
,p_name=>'APEX.IG.APPROX_COUNT_DISTINCT'
,p_message_language=>'pt'
,p_message_text=>'Contagem Distinta Aprox.'
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141519535676752094)
,p_name=>'APEX.IG.APPROX_COUNT_DISTINCT_OVERALL'
,p_message_language=>'pt'
,p_message_text=>'Contagem Distinta Global Aprox.'
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141502716082752089)
,p_name=>'APEX.IG.AREA'
,p_message_language=>'pt'
,p_message_text=>unistr('\00C1rea')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141504617937752090)
,p_name=>'APEX.IG.ASCENDING'
,p_message_language=>'pt'
,p_message_text=>'Crescente'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141464766600752078)
,p_name=>'APEX.IG.AUTHORIZATION'
,p_message_language=>'pt'
,p_message_text=>unistr('Autoriza\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141518678041752094)
,p_name=>'APEX.IG.AUTO'
,p_message_language=>'pt'
,p_message_text=>unistr('Autom\00E1tico')
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141485579994752084)
,p_name=>'APEX.IG.AVG'
,p_message_language=>'pt'
,p_message_text=>unistr('M\00E9dia')
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141519283397752094)
,p_name=>'APEX.IG.AVG_OVERALL'
,p_message_language=>'pt'
,p_message_text=>unistr('M\00E9dia Global')
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141502296703752089)
,p_name=>'APEX.IG.AXIS_LABEL_TITLE'
,p_message_language=>'pt'
,p_message_text=>unistr('T\00EDtulo do Eixo da Etiqueta')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141502458803752089)
,p_name=>'APEX.IG.AXIS_VALUE_DECIMAL'
,p_message_language=>'pt'
,p_message_text=>'Casas Decimais'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141502313404752089)
,p_name=>'APEX.IG.AXIS_VALUE_TITLE'
,p_message_language=>'pt'
,p_message_text=>unistr('T\00EDtulo do Eixo do Valor')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141508424946752091)
,p_name=>'APEX.IG.BACKGROUND_COLOR'
,p_message_language=>'pt'
,p_message_text=>'Cor de Segundo Plano'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141502864210752089)
,p_name=>'APEX.IG.BAR'
,p_message_language=>'pt'
,p_message_text=>'Barra'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141460023033752077)
,p_name=>'APEX.IG.BETWEEN'
,p_message_language=>'pt'
,p_message_text=>'entre'
,p_is_js_message=>true
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141509682691752091)
,p_name=>'APEX.IG.BOTH'
,p_message_language=>'pt'
,p_message_text=>'Ambos'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141502940488752089)
,p_name=>'APEX.IG.BUBBLE'
,p_message_language=>'pt'
,p_message_text=>'Bolhas'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141433259718752069)
,p_name=>'APEX.IG.CANCEL'
,p_message_language=>'pt'
,p_message_text=>'Cancelar'
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141465605121752078)
,p_name=>'APEX.IG.CASE_SENSITIVE'
,p_message_language=>'pt'
,p_message_text=>unistr('Sens\00EDvel a Mai\00FAsculas/Min\00FAsculas')
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141520123950752095)
,p_name=>'APEX.IG.CASE_SENSITIVE_WITH_BRACKETS'
,p_message_language=>'pt'
,p_message_text=>unistr('(Sens\00EDvel a Mai\00FAsculas/Min\00FAsculas)')
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141491485805752086)
,p_name=>'APEX.IG.CHANGES_SAVED'
,p_message_language=>'pt'
,p_message_text=>unistr('Altera\00E7\00F5es gravadas')
,p_is_js_message=>true
,p_version_scn=>2705332
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141433691583752069)
,p_name=>'APEX.IG.CHANGE_VIEW'
,p_message_language=>'pt'
,p_message_text=>unistr('Alterar Visualiza\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141466710361752079)
,p_name=>'APEX.IG.CHART'
,p_message_language=>'pt'
,p_message_text=>'Diagrama'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141463213043752078)
,p_name=>'APEX.IG.CHART_MAX_DATAPOINT_CNT'
,p_message_language=>'pt'
,p_message_text=>unistr('A sua consulta excede o m\00E1ximo de %0 pontos de dados por diagrama. Aplique um filtro para reduzir o n\00FAmero de registos na sua consulta base.')
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141431984945752068)
,p_name=>'APEX.IG.CHART_VIEW'
,p_message_language=>'pt'
,p_message_text=>unistr('Visualiza\00E7\00E3o do Gr\00E1fico')
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141440394919752071)
,p_name=>'APEX.IG.CLEAR'
,p_message_language=>'pt'
,p_message_text=>'Limpar'
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141501742205752089)
,p_name=>'APEX.IG.CLOSE_COLUMN'
,p_message_language=>'pt'
,p_message_text=>'Fecho'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141508680041752091)
,p_name=>'APEX.IG.COLORS'
,p_message_language=>'pt'
,p_message_text=>'Cores'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141485914349752084)
,p_name=>'APEX.IG.COLOR_PREVIEW'
,p_message_language=>'pt'
,p_message_text=>unistr('Pr\00E9-visualizar')
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141465021620752078)
,p_name=>'APEX.IG.COLUMN'
,p_message_language=>'pt'
,p_message_text=>'Coluna'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141432157291752068)
,p_name=>'APEX.IG.COLUMNS'
,p_message_language=>'pt'
,p_message_text=>'Colunas'
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141394089101752057)
,p_name=>'APEX.IG.COLUMN_HEADER_ACTIONS'
,p_message_language=>'pt'
,p_message_text=>unistr('A\00E7\00F5es da Coluna')
,p_is_js_message=>true
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141393860278752057)
,p_name=>'APEX.IG.COLUMN_HEADER_ACTIONS_FOR'
,p_message_language=>'pt'
,p_message_text=>unistr('A\00E7\00F5es para a coluna "%0"')
,p_is_js_message=>true
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141510421181752092)
,p_name=>'APEX.IG.COLUMN_TYPE'
,p_message_language=>'pt'
,p_message_text=>'Finalidade da Coluna'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141465140752752078)
,p_name=>'APEX.IG.COMPLEX'
,p_message_language=>'pt'
,p_message_text=>'Complexo'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141432394145752069)
,p_name=>'APEX.IG.COMPUTE'
,p_message_language=>'pt'
,p_message_text=>'Calcular'
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141460675488752077)
,p_name=>'APEX.IG.CONTAINS'
,p_message_language=>'pt'
,p_message_text=>unistr('cont\00E9m')
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141466995951752079)
,p_name=>'APEX.IG.CONTROL_BREAK'
,p_message_language=>'pt'
,p_message_text=>unistr('Controlo de Interrup\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141440134282752071)
,p_name=>'APEX.IG.COPY_CB'
,p_message_language=>'pt'
,p_message_text=>unistr('Copiar para \00C1rea de Transfer\00EAncia')
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141440200188752071)
,p_name=>'APEX.IG.COPY_DOWN'
,p_message_language=>'pt'
,p_message_text=>'Copiar Abaixo'
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141484923986752084)
,p_name=>'APEX.IG.COUNT'
,p_message_language=>'pt'
,p_message_text=>'Contagem'
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141485073138752084)
,p_name=>'APEX.IG.COUNT_DISTINCT'
,p_message_language=>'pt'
,p_message_text=>'Contagem Distinta'
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141519482554752094)
,p_name=>'APEX.IG.COUNT_DISTINCT_OVERALL'
,p_message_language=>'pt'
,p_message_text=>'Contagem Distinta Global'
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141519382296752094)
,p_name=>'APEX.IG.COUNT_OVERALL'
,p_message_language=>'pt'
,p_message_text=>'Contagem Global'
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141517008401752094)
,p_name=>'APEX.IG.CREATE_X'
,p_message_language=>'pt'
,p_message_text=>'Criar %0'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141463603683752078)
,p_name=>'APEX.IG.DATA'
,p_message_language=>'pt'
,p_message_text=>'Dados'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141510292245752092)
,p_name=>'APEX.IG.DATA_TYPE'
,p_message_language=>'pt'
,p_message_text=>'Tipo de Dados'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141509876110752091)
,p_name=>'APEX.IG.DATE'
,p_message_language=>'pt'
,p_message_text=>'Data'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141491208228752086)
,p_name=>'APEX.IG.DATE_INVALID_VALUE'
,p_message_language=>'pt'
,p_message_text=>unistr('Valor da Data Inv\00E1lido')
,p_is_js_message=>true
,p_version_scn=>2705332
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141461383554752077)
,p_name=>'APEX.IG.DAYS'
,p_message_language=>'pt'
,p_message_text=>'dias'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141464354738752078)
,p_name=>'APEX.IG.DEFAULT_SETTINGS'
,p_message_language=>'pt'
,p_message_text=>unistr('Defini\00E7\00F5es por Omiss\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141464188602752078)
,p_name=>'APEX.IG.DEFAULT_TYPE'
,p_message_language=>'pt'
,p_message_text=>unistr('Tipo por Omiss\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141433132801752069)
,p_name=>'APEX.IG.DELETE'
,p_message_language=>'pt'
,p_message_text=>'Apagar'
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141511390765752092)
,p_name=>'APEX.IG.DELETE_REPORT_CONFIRM'
,p_message_language=>'pt'
,p_message_text=>unistr('Tem a certeza de que pretende apagar este relat\00F3rio?')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141468771703752079)
,p_name=>'APEX.IG.DELETE_ROW'
,p_message_language=>'pt'
,p_message_text=>'Apagar Linha'
,p_is_js_message=>true
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141467580978752079)
,p_name=>'APEX.IG.DELETE_ROWS'
,p_message_language=>'pt'
,p_message_text=>'Apagar Linhas'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141504788535752090)
,p_name=>'APEX.IG.DESCENDING'
,p_message_language=>'pt'
,p_message_text=>'Decrescente'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141466436371752079)
,p_name=>'APEX.IG.DETAIL'
,p_message_language=>'pt'
,p_message_text=>'Detalhe'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141431675148752068)
,p_name=>'APEX.IG.DETAIL_VIEW'
,p_message_language=>'pt'
,p_message_text=>unistr('Visualiza\00E7\00E3o de Detalhe')
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141493713586752087)
,p_name=>'APEX.IG.DIRECTION'
,p_message_language=>'pt'
,p_message_text=>unistr('Dire\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141466178328752079)
,p_name=>'APEX.IG.DISABLED'
,p_message_language=>'pt'
,p_message_text=>'Desativado'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141460719989752077)
,p_name=>'APEX.IG.DOES_NOT_CONTAIN'
,p_message_language=>'pt'
,p_message_text=>unistr('n\00E3o cont\00E9m')
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141460992592752077)
,p_name=>'APEX.IG.DOES_NOT_START_WITH'
,p_message_language=>'pt'
,p_message_text=>unistr('n\00E3o come\00E7a por')
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141503089831752089)
,p_name=>'APEX.IG.DONUT'
,p_message_language=>'pt'
,p_message_text=>'Anel'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141467107206752079)
,p_name=>'APEX.IG.DOWNLOAD'
,p_message_language=>'pt'
,p_message_text=>'Descarregar'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141357456304752046)
,p_name=>'APEX.IG.DOWNLOAD_DATA_ONLY'
,p_message_language=>'pt'
,p_message_text=>'Apenas Dados'
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141512322611752092)
,p_name=>'APEX.IG.DOWNLOAD_FORMAT'
,p_message_language=>'pt'
,p_message_text=>'Escolher Formato'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141372584765752051)
,p_name=>'APEX.IG.DOWNLOAD_FORMAT_NOT_ENABLED'
,p_message_language=>'pt'
,p_message_text=>unistr('O Formato de Descarregamento %0 n\00E3o est\00E1 ativado.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141505449085752090)
,p_name=>'APEX.IG.DUPLICATE_AGGREGATION'
,p_message_language=>'pt'
,p_message_text=>unistr('Agrega\00E7\00E3o Duplicada')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141505506247752090)
,p_name=>'APEX.IG.DUPLICATE_CONTROLBREAK'
,p_message_language=>'pt'
,p_message_text=>unistr('Controlo de Interrup\00E7\00E3o Duplicado')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141468660455752079)
,p_name=>'APEX.IG.DUPLICATE_ROW'
,p_message_language=>'pt'
,p_message_text=>'Duplicar Linha'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141467408283752079)
,p_name=>'APEX.IG.DUPLICATE_ROWS'
,p_message_language=>'pt'
,p_message_text=>'Duplicar Linhas'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141432759232752069)
,p_name=>'APEX.IG.EDIT'
,p_message_language=>'pt'
,p_message_text=>'Editar'
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141504584000752090)
,p_name=>'APEX.IG.EDIT_CHART'
,p_message_language=>'pt'
,p_message_text=>unistr('Editar Gr\00E1fico')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141385095886752055)
,p_name=>'APEX.IG.EDIT_CONTROL'
,p_message_language=>'pt'
,p_message_text=>'Editar %0'
,p_is_js_message=>true
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141515942515752093)
,p_name=>'APEX.IG.EDIT_GROUP_BY'
,p_message_language=>'pt'
,p_message_text=>'Editar Grupo por'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141423143061752066)
,p_name=>'APEX.IG.EDIT_MODE'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 em modo de edi\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141398767431752059)
,p_name=>'APEX.IG.EDIT_MODE_DESCRIPTION'
,p_message_language=>'pt'
,p_message_text=>unistr('Grelha no modo de edi\00E7\00E3o. Anule o bot\00E3o premido para alternar para o modo de visualiza\00E7\00E3o.')
,p_is_js_message=>true
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141511991521752092)
,p_name=>'APEX.IG.EMAIL_BCC'
,p_message_language=>'pt'
,p_message_text=>unistr('C\00F3pia oculta (bcc)')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141512156391752092)
,p_name=>'APEX.IG.EMAIL_BODY'
,p_message_language=>'pt'
,p_message_text=>'Mensagem'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141511873153752092)
,p_name=>'APEX.IG.EMAIL_CC'
,p_message_language=>'pt'
,p_message_text=>unistr('C\00F3pia (cc)')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141511556017752092)
,p_name=>'APEX.IG.EMAIL_SENT'
,p_message_language=>'pt'
,p_message_text=>'Mensagem de email enviada.'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141512042006752092)
,p_name=>'APEX.IG.EMAIL_SUBJECT'
,p_message_language=>'pt'
,p_message_text=>'Assunto'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141511758563752092)
,p_name=>'APEX.IG.EMAIL_TO'
,p_message_language=>'pt'
,p_message_text=>unistr('Destinat\00E1rio (para)')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141465836931752078)
,p_name=>'APEX.IG.ENABLED'
,p_message_language=>'pt'
,p_message_text=>'Ativado'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141459031631752076)
,p_name=>'APEX.IG.EQUALS'
,p_message_language=>'pt'
,p_message_text=>'igual a'
,p_is_js_message=>true
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141465922366752078)
,p_name=>'APEX.IG.EXPRESSION'
,p_message_language=>'pt'
,p_message_text=>unistr('Express\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141510945228752092)
,p_name=>'APEX.IG.FD_TYPE'
,p_message_language=>'pt'
,p_message_text=>'Tipo'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141478187798752082)
,p_name=>'APEX.IG.FILE_PREPARED'
,p_message_language=>'pt'
,p_message_text=>'Ficheiro preparado. A iniciar descarregamento.'
,p_is_js_message=>true
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141440475368752071)
,p_name=>'APEX.IG.FILL'
,p_message_language=>'pt'
,p_message_text=>'Preencher'
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141442656817752072)
,p_name=>'APEX.IG.FILL_LABEL'
,p_message_language=>'pt'
,p_message_text=>unistr('Sele\00E7\00E3o de preenchimento com')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141442524428752072)
,p_name=>'APEX.IG.FILL_TITLE'
,p_message_language=>'pt'
,p_message_text=>unistr('Sele\00E7\00E3o de Preenchimento')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141432234713752069)
,p_name=>'APEX.IG.FILTER'
,p_message_language=>'pt'
,p_message_text=>'Filtrar'
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141465260008752078)
,p_name=>'APEX.IG.FILTERS'
,p_message_language=>'pt'
,p_message_text=>'Filtros'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141518985831752094)
,p_name=>'APEX.IG.FILTER_WITH_DOTS'
,p_message_language=>'pt'
,p_message_text=>'Filtrar...'
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141504998180752090)
,p_name=>'APEX.IG.FIRST'
,p_message_language=>'pt'
,p_message_text=>'Primeiro'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141432430182752069)
,p_name=>'APEX.IG.FLASHBACK'
,p_message_language=>'pt'
,p_message_text=>'Flashback'
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141463714595752078)
,p_name=>'APEX.IG.FORMAT'
,p_message_language=>'pt'
,p_message_text=>'Formatar'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141509517639752091)
,p_name=>'APEX.IG.FORMATMASK'
,p_message_language=>'pt'
,p_message_text=>unistr('M\00E1scara de Formato')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141511271041752092)
,p_name=>'APEX.IG.FORMAT_CSV'
,p_message_language=>'pt'
,p_message_text=>'CSV'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141511155888752092)
,p_name=>'APEX.IG.FORMAT_HTML'
,p_message_language=>'pt'
,p_message_text=>'HTML'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141422273404752066)
,p_name=>'APEX.IG.FORMAT_PDF'
,p_message_language=>'pt'
,p_message_text=>'PDF'
,p_is_js_message=>true
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141356144674752046)
,p_name=>'APEX.IG.FORMAT_XLSX'
,p_message_language=>'pt'
,p_message_text=>'Excel'
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141468313657752079)
,p_name=>'APEX.IG.FREEZE'
,p_message_language=>'pt'
,p_message_text=>'Congelar'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141466011767752078)
,p_name=>'APEX.IG.FUNCTIONS_AND_OPERATORS'
,p_message_language=>'pt'
,p_message_text=>unistr('Fun\00E7\00F5es e Operadores')
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141503148963752089)
,p_name=>'APEX.IG.FUNNEL'
,p_message_language=>'pt'
,p_message_text=>'Funil'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141484821920752084)
,p_name=>'APEX.IG.GO'
,p_message_language=>'pt'
,p_message_text=>'Ir'
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141459650884752077)
,p_name=>'APEX.IG.GREATER_THAN'
,p_message_language=>'pt'
,p_message_text=>'maior que'
,p_is_js_message=>true
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141459791322752077)
,p_name=>'APEX.IG.GREATER_THAN_OR_EQUALS'
,p_message_language=>'pt'
,p_message_text=>'maior que ou igual a'
,p_is_js_message=>true
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141466376055752079)
,p_name=>'APEX.IG.GRID'
,p_message_language=>'pt'
,p_message_text=>'Grelha'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141431488338752068)
,p_name=>'APEX.IG.GRID_VIEW'
,p_message_language=>'pt'
,p_message_text=>unistr('Visualiza\00E7\00E3o de Grelha')
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141505798311752090)
,p_name=>'APEX.IG.GROUP'
,p_message_language=>'pt'
,p_message_text=>'Agrupar'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141466577388752079)
,p_name=>'APEX.IG.GROUP_BY'
,p_message_language=>'pt'
,p_message_text=>'Agrupar por'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141431711390752068)
,p_name=>'APEX.IG.GROUP_BY_VIEW'
,p_message_language=>'pt'
,p_message_text=>unistr('Visualiza\00E7\00E3o Agrupar Por')
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141510134433752092)
,p_name=>'APEX.IG.HD_TYPE'
,p_message_language=>'pt'
,p_message_text=>unistr('Tipo de Condi\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141509037642752091)
,p_name=>'APEX.IG.HEADING'
,p_message_language=>'pt'
,p_message_text=>unistr('T\00EDtulo')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141509281965752091)
,p_name=>'APEX.IG.HEADING_ALIGN'
,p_message_language=>'pt'
,p_message_text=>unistr('Alinhamento do T\00EDtulo')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141518847369752094)
,p_name=>'APEX.IG.HELP'
,p_message_language=>'pt'
,p_message_text=>unistr('Aux\00EDlio')
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141514367158752093)
,p_name=>'APEX.IG.HELP.ACTIONS.EDITING'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Pode inserir, atualizar e apagar dados diretamente nesta grelha interativa.</p>',
'',
unistr('<p>Insira uma nova linha clicando no bot\00E3o Acrescentar Linha.</p>'),
'',
unistr('<p>Edite os dados existentes clicando duas vezes numa c\00E9lula espec\00EDfica. Para edi\00E7\00F5es maiores, clique em Editar para entrar no modo de edi\00E7\00E3o. No modo de edi\00E7\00E3o, pode clicar uma vez ou utilizar o teclado para editar c\00E9lulas espec\00EDficas.</p>'),
'',
unistr('<p>Utilize o menu Alterar para duplicar e apagar linhas. Para ativar o menu Alterar, utilize as caixas de sele\00E7\00E3o para selecionar uma ou mais linhas.</p>'),
'',
'<p>Duplique uma linha selecionada clicando no menu Alterar e selecionando Duplicar Linhas. Apague uma linha selecionada clicando no menu Alterar e selecionando Apagar Linha.</p>'))
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141516454044752093)
,p_name=>'APEX.IG.HELP.ACTIONS.EDITING_HEADING'
,p_message_language=>'pt'
,p_message_text=>unistr('Capacidades de Edi\00E7\00E3o')
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141516529875752093)
,p_name=>'APEX.IG.HELP.ACTIONS.INTRO'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Uma grelha interativa apresenta um conjunto de dados num relat\00F3rio pesquis\00E1vel e customiz\00E1vel. Pode efetuar diversas opera\00E7\00F5es para limitar os registos devolvidos e alterar a forma como os dados s\00E3o apresentados.</p>'),
'',
unistr('<p>Utilize o campo Pesquisar para filtrar os registos devolvidos. Clique em A\00E7\00F5es para aceder a diversas op\00E7\00F5es para modificar a disposi\00E7\00E3o do relat\00F3rio ou utilize os menus de T\00EDtulo da Coluna nas colunas apresentadas.</p>'),
'',
unistr('<p>Utilize as Defini\00E7\00F5es do Relat\00F3rio para gravar as suas customiza\00E7\00F5es num relat\00F3rio. Tamb\00E9m pode descarregar os dados do relat\00F3rio para um ficheiro externo ou enviar os dados por email para si pr\00F3prio ou para outras pessoas.</p>'),
'',
unistr('<p>Para saber mais, consulte o t\00F3pico sobre como Utilizar Grelhas Interativas no <em>Oracle APEX End User''s Guide</em>.')))
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141516254296752093)
,p_name=>'APEX.IG.HELP.ACTIONS.INTRO_HEADING'
,p_message_language=>'pt'
,p_message_text=>'Perspetiva Geral'
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141514248177752093)
,p_name=>'APEX.IG.HELP.ACTIONS.REPORTING'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Pode customizar a grelha interativa para apresentar os dados de formas diferentes utilizando as capacidades integradas.</p>',
'',
unistr('<p>Utilize os menus de T\00EDtulo da Coluna ou o menu A\00E7\00F5es para determinar as colunas a apresentar, por que sequ\00EAncia e congelar colunas. Tamb\00E9m pode definir v\00E1rios filtros de dados e ordenar os dados devolvidos.</p>'),
'',
unistr('<p>Utilize o bot\00E3o Visualizar (adjacente ao campo Pesquisar) para aceder a outras visualiza\00E7\00F5es de dados que possam ter sido definidas pelo programador da aplica\00E7\00E3o. Tamb\00E9m pode criar um diagrama ou visualizar um diagrama existente.</p>  '),
'',
unistr('<p><em>Nota: Clique em <strong>Aux\00EDlio</strong> nas caixas de di\00E1logo da grelha interativa para obter informa\00E7\00F5es mais detalhadas sobre a fun\00E7\00E3o selecionada.</em></p>')))
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141516365636752093)
,p_name=>'APEX.IG.HELP.ACTIONS.REPORTING_HEADING'
,p_message_language=>'pt'
,p_message_text=>unistr('Capacidades de Gera\00E7\00E3o de Relat\00F3rios')
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141467310255752079)
,p_name=>'APEX.IG.HELP.ACTIONS_TITLE'
,p_message_language=>'pt'
,p_message_text=>unistr('Aux\00EDlio da Grelha Interativa')
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141513117811752092)
,p_name=>'APEX.IG.HELP.AGGREGATE'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Utilize esta caixa de di\00E1logo para agregar colunas. Os valores agregados s\00E3o apresentados na parte inferior dos dados ou, se existirem Controlos de Interrup\00E7\00E3o definidos, na parte inferior de cada interrup\00E7\00E3o.</p>'),
'',
unistr('<p><strong>Lista Agrega\00E7\00E3o</strong><br>'),
unistr('A lista Agrega\00E7\00E3o apresenta as agrega\00E7\00F5es definidas. Desative uma agrega\00E7\00E3o existente anulando a respetiva sele\00E7\00E3o.<br>'),
unistr('Clique em Acrescentar (&plus;) para criar uma nova agrega\00E7\00E3o ou em Apagar (&minus;) para retirar uma agrega\00E7\00E3o existente.</p>'),
'',
unistr('<p><strong>Defini\00E7\00F5es de Agrega\00E7\00E3o</strong><br>'),
unistr('Utilize o formul\00E1rio \00E0 direita para definir a agrega\00E7\00E3o.<br>'),
unistr('Selecione o nome da Coluna e o tipo de Agrega\00E7\00E3o.<br>'),
unistr('Opcionalmente, introduza uma nota informativa para a agrega\00E7\00E3o.<br>'),
unistr('Se tiver definido um Controlo de Interrup\00E7\00E3o, a sele\00E7\00E3o de <strong>Mostrar Valor Global</strong> apresenta o valor m\00E9dio global, total ou semelhante na parte inferior dos dados.</p>'),
'',
unistr('<p><em>Nota: Aceda \00E0 caixa de di\00E1logo Agrega\00E7\00E3o no menu A\00E7\00F5es ou clicando no t\00EDtulo da coluna e em soma (&sum;).</em></p>')))
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141515330261752093)
,p_name=>'APEX.IG.HELP.AGGREGATE_TITLE'
,p_message_language=>'pt'
,p_message_text=>unistr('Aux\00EDlio da Agrega\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141513803813752093)
,p_name=>'APEX.IG.HELP.CHART'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Utilize esta caixa de di\00E1logo para definir um diagrama que \00E9 apresentado como uma visualiza\00E7\00E3o de dados separada.<br> '),
'Selecione um Tipo de diagrama e atributos do diagrama.</p>',
'<p><strong>Atributos do Diagrama</strong><br>',
unistr('Os atributos do diagrama dispon\00EDveis variam consoante o tipo de diagrama.</p>'),
'<p>',
'<ul>',
unistr('  <li>Selecione a coluna que cont\00E9m o valor para o atributo:'),
'<ul>',
'      <li>Etiqueta - O texto para cada ponto de dados.</li>',
unistr('      <li>Valor - Os dados a tra\00E7ar.</li>'),
unistr('      <li>S\00E9rie - Para definir a sua consulta din\00E2mica de v\00E1rias s\00E9ries.</li>'),
unistr('      <li>Abertura - O pre\00E7o de abertura di\00E1rio da a\00E7\00E3o (apenas para A\00E7\00F5es).</li>'),
unistr('      <li>Fecho - O pre\00E7o de fecho di\00E1rio da a\00E7\00E3o (apenas para A\00E7\00F5es).</li>'),
unistr('      <li>M\00E1ximo - O valor m\00E1ximo (apenas para Intervalos e A\00E7\00F5es).</li>'),
unistr('      <li>M\00EDnimo - O valor m\00EDnimo (apenas para Intervalos e A\00E7\00F5es).</li>'),
unistr('      <li>Volume - O volume di\00E1rio de a\00E7\00F5es (apenas para A\00E7\00F5es).</li>'),
'      <li>Alvo - O valor-alvo (apenas para Funil).</li>',
unistr('      <li>X - O valor do eixo X (apenas para Bolhas e Dispers\00E3o).</li>'),
unistr('      <li>Y - O valor do eixo Y (apenas para Bolhas e Dispers\00E3o).</li>'),
'      <li>Z - A largura da barra ou o raio da bolha (apenas para Barras, Bolhas e Intervalos).</li>',
'    </ul>',
'  </li>',
unistr('  <li>Orienta\00E7\00E3o - Vertical ou horizontal.</li>'),
unistr('  <li>Agrega\00E7\00E3o - Selecione como agregar os valores de diagrama.</li>'),
unistr('  <li>Pilha - Especifique se os itens de dados s\00E3o empilhados.</li>'),
'  <li>Ordenar Por - Selecione pela etiqueta ou pelo(s) valor(es).',
'<ul>',
unistr('      <li>Dire\00E7\00E3o - Ordene por valores crescentes ou decrescentes.</li>'),
unistr('      <li>Nulos - Especifique como ordenar os registos com valores nulos em rela\00E7\00E3o aos registos com valores n\00E3o nulos.</li>'),
'    </ul>',
'  </li>',
'  <li>Casas Decimais</li>',
unistr('  <li>T\00EDtulo do Eixo da Etiqueta</li>'),
unistr('  <li>T\00EDtulo do Eixo do Valor</li>'),
'</ul>',
'</p>'))
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141515756275752093)
,p_name=>'APEX.IG.HELP.CHART_TITLE'
,p_message_language=>'pt'
,p_message_text=>unistr('Aux\00EDlio do Diagrama')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141512879552752092)
,p_name=>'APEX.IG.HELP.COLUMNS'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Utilize esta caixa de di\00E1logo para escolher quais as colunas apresentadas e por que ordem.</p>'),
'',
unistr('<p>Oculte uma coluna anulando a respetiva sele\00E7\00E3o.<br>'),
'Reordene as colunas clicando em Deslocar para Cima (&uarr;) ou Deslocar para Baixo (&darr;).<br>',
unistr('Utilize o seletor pendente para listar Todas as colunas, as Colunas apresentadas ou as Colunas n\00E3o apresentadas.</p>'),
'',
unistr('<p>Opcionalmente, utilize o formul\00E1rio para especificar a largura m\00EDnima de uma coluna em p\00EDxeis.</p>'),
'',
unistr('<p><em>Nota: Tamb\00E9m pode reordenar as colunas apresentadas clicando na al\00E7a para arrastar (no in\00EDcio do t\00EDtulo da coluna) e arrastando a coluna para a esquerda ou direita. Tamb\00E9m pode alterar a largura das colunas apresentadas selecionando o separado')
||unistr('r da coluna, entre os t\00EDtulos, e deslocando-o para a esquerda ou direita.</em></p>')))
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141515676992752093)
,p_name=>'APEX.IG.HELP.COLUMNS_TITLE'
,p_message_language=>'pt'
,p_message_text=>unistr('Aux\00EDlio das Colunas')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141513204235752092)
,p_name=>'APEX.IG.HELP.COMPUTE'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Utilize esta caixa de di\00E1logo para definir colunas adicionais com base em c\00E1lculos matem\00E1ticos e funcionais efetuados em rela\00E7\00E3o \00E0s colunas existentes.</p>'),
'',
unistr('<p><strong>Lista C\00E1lculo</strong><br>'),
unistr('A lista C\00E1lculo apresenta os c\00E1lculos definidos. Desative um c\00E1lculo existente anulando a respetiva sele\00E7\00E3o.<br>'),
unistr('Clique em Acrescentar (&plus;) para acrescentar um novo c\00E1lculo ou em Apagar (&minus;) para retirar um c\00E1lculo existente.</p>'),
'',
unistr('<p><strong>Defini\00E7\00F5es de C\00E1lculo</strong><br>'),
unistr('Utilize o formul\00E1rio para definir o c\00E1lculo.<br>'),
unistr('Introduza os detalhes da coluna, como o t\00EDtulo ou etiqueta, e selecione as defini\00E7\00F5es de alinhamento.<br> '),
unistr('Utilize a \00E1rea de texto Express\00E3o para introduzir a(s) coluna(s) e as fun\00E7\00F5es associadas para o c\00E1lculo.<br>'),
unistr('Selecione o tipo de dados adequado e, opcionalmente, uma m\00E1scara de formato para a nova coluna.</p>')))
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141515269840752093)
,p_name=>'APEX.IG.HELP.COMPUTE_TITLE'
,p_message_language=>'pt'
,p_message_text=>unistr('Aux\00EDlio do C\00E1lculo')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141513543459752093)
,p_name=>'APEX.IG.HELP.CONTROL_BREAK'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Utilize esta caixa de di\00E1logo para definir um controlo de interrup\00E7\00E3o numa ou mais colunas.</p>'),
'',
unistr('<p><strong>Lista Controlo de Interrup\00E7\00E3o</strong><br>'),
unistr('A lista Controlo de Interrup\00E7\00E3o apresenta os controlos de interrup\00E7\00E3o definidos. Desative uma coluna de controlo de interrup\00E7\00E3o existente anulando a respetiva sele\00E7\00E3o.<br>'),
unistr('Clique em Acrescentar (&plus;) para incluir uma nova coluna no controlo de interrup\00E7\00E3o ou em Apagar (&minus;) para retirar uma coluna existente do controlo de interrup\00E7\00E3o.<br>'),
unistr('Para reordenar colunas, clique em Deslocar para Cima (&uarr;) ou Deslocar para Baixo (&darr;) para deslocar a coluna selecionada para cima e para baixo relativamente \00E0s outras colunas.</p>'),
'',
unistr('<p><strong>Defini\00E7\00F5es de Controlo de Interrup\00E7\00E3o</strong><br>'),
unistr('Utilize o formul\00E1rio para definir a coluna de controlo de interrup\00E7\00E3o.<br>'),
unistr('Selecione uma coluna de controlo de interrup\00E7\00E3o, a dire\00E7\00E3o de ordena\00E7\00E3o e o modo de ordena\00E7\00E3o das colunas nulas (colunas sem valores).</p>'),
'',
unistr('<p><em>Nota: Ao visualizar a grelha interativa, pode definir um controlo de interrup\00E7\00E3o clicando num T\00EDtulo da Coluna e selecionando o \00EDcone de controlo de interrup\00E7\00E3o.</em></p>')))
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141514921508752093)
,p_name=>'APEX.IG.HELP.CONTROL_BREAK_TITLE'
,p_message_language=>'pt'
,p_message_text=>unistr('Aux\00EDlio do Controlo de Interrup\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141513772450752093)
,p_name=>'APEX.IG.HELP.DOWNLOAD'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Utilize esta caixa de di\00E1logo para descarregar todas as linhas atuais para um ficheiro externo. O ficheiro ir\00E1 conter apenas as colunas apresentadas atualmente, utilizando os filtros e ordena\00E7\00F5es aplicados nos dados.</p>'),
'',
'<p>Selecione o formato do ficheiro e clique em Descarregar.<br>',
unistr('Nota: o CSV n\00E3o incluir\00E1 formata\00E7\00E3o de texto, como agrega\00E7\00F5es e controlos de interrup\00E7\00E3o.</p>'),
'',
unistr('<p>Para enviar o ficheiro por email, selecione Enviar como Mensagem de Email e introduza os detalhes de email (Destinat\00E1rio, Assunto e Mensagem).</p>')))
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141514781215752093)
,p_name=>'APEX.IG.HELP.DOWNLOAD_TITLE'
,p_message_language=>'pt'
,p_message_text=>unistr('Aux\00EDlio do Descarregamento')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141512908267752092)
,p_name=>'APEX.IG.HELP.FILTER'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Utilize esta caixa de di\00E1logo para configurar filtros de dados que limitam as linhas devolvidas.</p>'),
'',
'<p><strong>Lista Filtro</strong><br>',
unistr('A lista Filtro apresenta os filtros definidos. Desative um filtro existente anulando a respetiva sele\00E7\00E3o.<br>'),
'Clique em Acrescentar (&plus;) para criar um novo filtro ou em Apagar (&minus;) para retirar um filtro existente.</p>',
'',
unistr('<p><strong>Defini\00E7\00F5es de Filtro</strong><br>'),
unistr('Utilize o formul\00E1rio para definir as propriedades do filtro.<br>'),
'Selecione o tipo de filtro adequado:<br>',
unistr('&nbsp;&nbsp;&nbsp;Linha - filtra um termo em qualquer coluna filtr\00E1vel.<br>'),
unistr('&nbsp;&nbsp;&nbsp;Coluna - filtra uma coluna espec\00EDfica com um operador e valor especificados.</p>'),
'',
unistr('<p><em>Nota: Ao visualizar a grelha interativa, pode definir filtros de linha escrevendo diretamente no campo Pesquisar. Clique em Selecionar Colunas para Pesquisar para limitar a pesquisa a uma coluna espec\00EDfica. Em alternativa, abra um menu de T\00EDtu')
||'lo da Coluna e selecione um valor para criar um filtro de coluna.</em></p>'))
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141515555852752093)
,p_name=>'APEX.IG.HELP.FILTER_TITLE'
,p_message_language=>'pt'
,p_message_text=>unistr('Aux\00EDlio do Filtro')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141513373006752092)
,p_name=>'APEX.IG.HELP.FLASHBACK'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Utilize esta caixa de di\00E1logo para visualizar os dados tal como existiam num per\00EDodo anterior.</p>'),
unistr('<p>Introduza o n\00FAmero de minutos no passado para executar a consulta de flashback.</p>')))
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141515176501752093)
,p_name=>'APEX.IG.HELP.FLASHBACK_TITLE'
,p_message_language=>'pt'
,p_message_text=>unistr('Aux\00EDlio do Flashback')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141515837160752093)
,p_name=>'APEX.IG.HELP.GROUP_BY_TITLE'
,p_message_language=>'pt'
,p_message_text=>unistr('Aux\00EDlio de Agrupar Por')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141513491102752092)
,p_name=>'APEX.IG.HELP.HIGHLIGHT'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Utilize esta caixa de di\00E1logo para destacar linhas ou colunas de dados com base na condi\00E7\00E3o introduzida.</p>'),
'',
'<p><strong>Lista Destaque</strong><br>',
unistr('A lista Destaque apresenta os destaques definidos. Desative um destaque existente anulando a respetiva sele\00E7\00E3o.<br>'),
'Clique em Acrescentar (&plus;) para criar um novo destaque ou em Apagar (&minus;) para retirar um destaque existente.</p>',
'',
unistr('<p><strong>Defini\00E7\00F5es de Destaque</strong><br>'),
unistr('Utilize o formul\00E1rio para definir as propriedades de destaque.<br>'),
unistr('Introduza o nome, selecione Linha ou Coluna e selecione os c\00F3digos de cor de HTML para o fundo e o texto.<br>'),
unistr('Selecione o <strong>Tipo de Condi\00E7\00E3o</strong> adequado para destacar dados espec\00EDficos:<br>'),
'&nbsp;&nbsp;&nbsp;Linha - destaca o termo em qualquer coluna.<br>',
unistr('&nbsp;&nbsp;&nbsp;Coluna - destaca numa coluna espec\00EDfica com base no operador e valor especificados.</p>')))
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141515018206752093)
,p_name=>'APEX.IG.HELP.HIGHLIGHT_TITLE'
,p_message_language=>'pt'
,p_message_text=>unistr('Aux\00EDlio do Destaque')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141513626323752093)
,p_name=>'APEX.IG.HELP.REPORT'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Utilize esta caixa de di\00E1logo para gravar as altera\00E7\00F5es que efetuou na disposi\00E7\00E3o e configura\00E7\00E3o da grelha atual.<br>'),
unistr('Os programadores de aplica\00E7\00F5es podem definir v\00E1rias disposi\00E7\00F5es de relat\00F3rio alternativas. Onde for permitido, o utilizador e outros utilizadores finais poder\00E3o gravar um relat\00F3rio como P\00FAblico, disponibilizando o relat\00F3rio para todos os outros utili')
||unistr('zadores da grelha. Tamb\00E9m pode gravar um relat\00F3rio como Privado que s\00F3 pode ser visualizado por si.</p>'),
unistr('<p>Selecione um dos tipos dispon\00EDveis e introduza um nome para o relat\00F3rio gravado.</p>')))
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141514810670752093)
,p_name=>'APEX.IG.HELP.REPORT_TITLE'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Aux\00EDlio do Relat\00F3rio'),
''))
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141513043925752092)
,p_name=>'APEX.IG.HELP.SORT'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Utilize esta caixa de di\00E1logo para definir a ordem de apresenta\00E7\00E3o.</p>'),
'',
unistr('<p><strong>Lista de Ordena\00E7\00E3o</strong><br>'),
unistr('A caixa de di\00E1logo Ordenar apresenta uma lista das regras de ordena\00E7\00E3o configuradas.<br>'),
unistr('Clique em Acrescentar (&plus;) para criar uma coluna de ordena\00E7\00E3o ou em Apagar (&minus;) para retirar uma coluna de ordena\00E7\00E3o.<br>'),
unistr('Clique em Deslocar para Cima (&uarr;) e Deslocar para Baixo (&darr;) para deslocar a coluna de ordena\00E7\00E3o selecionada para cima e para baixo relativamente \00E0s outras colunas de ordena\00E7\00E3o.</p>'),
'',
unistr('<p><strong>Defini\00E7\00F5es de Ordena\00E7\00E3o</strong><br>'),
unistr('Selecione uma coluna de ordena\00E7\00E3o, a dire\00E7\00E3o de ordena\00E7\00E3o e o modo de ordena\00E7\00E3o das colunas nulas (colunas sem valores).</p>'),
'',
unistr('<p><em>Nota: Os dados podem ser ordenados por colunas que n\00E3o s\00E3o apresentadas; contudo, \00E9 poss\00EDvel que nem todas as colunas sejam orden\00E1veis.</em><br>'),
unistr('<em>As colunas apresentadas podem ser ordenadas premindo as setas para cima (crescente) ou para baixo (decrescente) no fim dos t\00EDtulos da coluna. Para acrescentar uma coluna subsequente a uma ordena\00E7\00E3o existente, mantenha a tecla Shift premida e cliq')
||'ue na seta para cima ou para baixo.</em></p>'))
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141515440428752093)
,p_name=>'APEX.IG.HELP.SORT_TITLE'
,p_message_language=>'pt'
,p_message_text=>unistr('Aux\00EDlio da Ordena\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141514625236752093)
,p_name=>'APEX.IG.HELP.SUBSCRIPTION_TITLE'
,p_message_language=>'pt'
,p_message_text=>unistr('Aux\00EDlio da Subscri\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141468283918752079)
,p_name=>'APEX.IG.HIDE'
,p_message_language=>'pt'
,p_message_text=>'Ocultar'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141432692409752069)
,p_name=>'APEX.IG.HIGHLIGHT'
,p_message_language=>'pt'
,p_message_text=>'Destacar'
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141501840419752089)
,p_name=>'APEX.IG.HIGH_COLUMN'
,p_message_language=>'pt'
,p_message_text=>unistr('M\00E1ximo')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141502623967752089)
,p_name=>'APEX.IG.HORIZONTAL'
,p_message_language=>'pt'
,p_message_text=>'Horizontal'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141461216004752077)
,p_name=>'APEX.IG.HOURS'
,p_message_language=>'pt'
,p_message_text=>'horas'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141466290686752079)
,p_name=>'APEX.IG.ICON'
,p_message_language=>'pt'
,p_message_text=>unistr('\00CDcone')
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141431549209752068)
,p_name=>'APEX.IG.ICON_VIEW'
,p_message_language=>'pt'
,p_message_text=>unistr('Visualiza\00E7\00E3o de \00CDcones')
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141459459820752077)
,p_name=>'APEX.IG.IN'
,p_message_language=>'pt'
,p_message_text=>'em'
,p_is_js_message=>true
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141467814697752079)
,p_name=>'APEX.IG.INACTIVE_SETTING'
,p_message_language=>'pt'
,p_message_text=>unistr('Defini\00E7\00E3o Inativa')
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141467950432752079)
,p_name=>'APEX.IG.INACTIVE_SETTINGS'
,p_message_language=>'pt'
,p_message_text=>unistr('Defini\00E7\00F5es Inativas')
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141475522523752081)
,p_name=>'APEX.IG.INTERNAL_ERROR'
,p_message_language=>'pt'
,p_message_text=>'Ocorreu um erro interno ao processar o pedido da Grelha Interativa.'
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141363495115752048)
,p_name=>'APEX.IG.INVALID_COLUMN_FILTER_TYPE'
,p_message_language=>'pt'
,p_message_text=>unistr('O Tipo de Filtro da Coluna "%0" n\00E3o \00E9 suportado para a coluna "%1".')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141514457335752093)
,p_name=>'APEX.IG.INVALID_DATE_FORMAT'
,p_message_language=>'pt'
,p_message_text=>unistr('Formato de Data Inv\00E1lido')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141489250419752085)
,p_name=>'APEX.IG.INVALID_FILTER_COLUMN'
,p_message_language=>'pt'
,p_message_text=>unistr('A Grelha Interativa n\00E3o suporta a defini\00E7\00E3o de um filtro na coluna %0.')
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141489155412752085)
,p_name=>'APEX.IG.INVALID_FILTER_OPERATOR'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 n\00E3o \00E9 um tipo de filtro v\00E1lido para definir um filtro da Grelha Interativa.')
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141370037756752050)
,p_name=>'APEX.IG.INVALID_NUMBER_FORMAT'
,p_message_language=>'pt'
,p_message_text=>unistr('Formato de N\00FAmero Inv\00E1lido')
,p_is_js_message=>true
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141517159906752094)
,p_name=>'APEX.IG.INVALID_SETTING'
,p_message_language=>'pt'
,p_message_text=>unistr('Defini\00E7\00E3o Inv\00E1lida')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141517296996752094)
,p_name=>'APEX.IG.INVALID_SETTINGS'
,p_message_language=>'pt'
,p_message_text=>unistr('Defini\00E7\00F5es Inv\00E1lidas')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141508317972752091)
,p_name=>'APEX.IG.INVALID_SORT_BY'
,p_message_language=>'pt'
,p_message_text=>unistr('Ordenar Por foi definido como %0, mas n\00E3o foi selecionada nenhuma coluna para %0.')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141505651238752090)
,p_name=>'APEX.IG.INVALID_VALUE'
,p_message_language=>'pt'
,p_message_text=>unistr('Valor Inv\00E1lido')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141500794015752089)
,p_name=>'APEX.IG.INVISIBLE'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o Apresentado')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141460212689752077)
,p_name=>'APEX.IG.IN_THE_LAST'
,p_message_language=>'pt'
,p_message_text=>unistr('no(s) \00FAltimo(s)')
,p_is_js_message=>true
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141460471099752077)
,p_name=>'APEX.IG.IN_THE_NEXT'
,p_message_language=>'pt'
,p_message_text=>'seguinte(s)'
,p_is_js_message=>true
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141459309726752077)
,p_name=>'APEX.IG.IS_NOT_NULL'
,p_message_language=>'pt'
,p_message_text=>unistr('n\00E3o est\00E1 vazio')
,p_is_js_message=>true
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141459203989752076)
,p_name=>'APEX.IG.IS_NULL'
,p_message_language=>'pt'
,p_message_text=>unistr('est\00E1 vazio')
,p_is_js_message=>true
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141509138384752091)
,p_name=>'APEX.IG.LABEL'
,p_message_language=>'pt'
,p_message_text=>'Etiqueta'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141501104101752089)
,p_name=>'APEX.IG.LABEL_COLUMN'
,p_message_language=>'pt'
,p_message_text=>'Etiqueta'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141505032890752090)
,p_name=>'APEX.IG.LAST'
,p_message_language=>'pt'
,p_message_text=>unistr('\00DAltimo')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141449552884752074)
,p_name=>'APEX.IG.LAST.DAY'
,p_message_language=>'pt'
,p_message_text=>unistr('\00DAltimo Dia')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141449708748752074)
,p_name=>'APEX.IG.LAST.HOUR'
,p_message_language=>'pt'
,p_message_text=>unistr('\00DAltima Hora')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141450269998752074)
,p_name=>'APEX.IG.LAST.MINUTE'
,p_message_language=>'pt'
,p_message_text=>unistr('\00DAltimo Minuto')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141449285063752074)
,p_name=>'APEX.IG.LAST.MONTH'
,p_message_language=>'pt'
,p_message_text=>unistr('\00DAltimo M\00EAs')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141449304513752074)
,p_name=>'APEX.IG.LAST.WEEK'
,p_message_language=>'pt'
,p_message_text=>unistr('\00DAltima Semana')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141449407313752074)
,p_name=>'APEX.IG.LAST.X_DAYS'
,p_message_language=>'pt'
,p_message_text=>unistr('\00DAltimos %0 Dias')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141449617203752074)
,p_name=>'APEX.IG.LAST.X_HOURS'
,p_message_language=>'pt'
,p_message_text=>unistr('\00DAltimas %0 Horas')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141450356458752074)
,p_name=>'APEX.IG.LAST.X_MINUTES'
,p_message_language=>'pt'
,p_message_text=>unistr('\00DAltimos %0 Minutos')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141450120886752074)
,p_name=>'APEX.IG.LAST.X_MONTHS'
,p_message_language=>'pt'
,p_message_text=>unistr('\00DAltimos %0 Meses')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141450022893752074)
,p_name=>'APEX.IG.LAST.X_WEEKS'
,p_message_language=>'pt'
,p_message_text=>unistr('\00DAltimas %0 Semanas')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141449022265752074)
,p_name=>'APEX.IG.LAST.X_YEARS'
,p_message_language=>'pt'
,p_message_text=>unistr('\00DAltimos %0 Anos')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141449148660752074)
,p_name=>'APEX.IG.LAST.YEAR'
,p_message_language=>'pt'
,p_message_text=>unistr('\00DAltimo Ano')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141509312814752091)
,p_name=>'APEX.IG.LAYOUT_ALIGN'
,p_message_language=>'pt'
,p_message_text=>unistr('Ajustamento das C\00E9lulas')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141509421169752091)
,p_name=>'APEX.IG.LAYOUT_USEGROUPFOR'
,p_message_language=>'pt'
,p_message_text=>'Utilizar Grupo Para'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141459894806752077)
,p_name=>'APEX.IG.LESS_THAN'
,p_message_language=>'pt'
,p_message_text=>'menor que'
,p_is_js_message=>true
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141459914150752077)
,p_name=>'APEX.IG.LESS_THAN_OR_EQUALS'
,p_message_language=>'pt'
,p_message_text=>'menor que ou igual a'
,p_is_js_message=>true
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141503208755752089)
,p_name=>'APEX.IG.LINE'
,p_message_language=>'pt'
,p_message_text=>'Linha'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141503303531752089)
,p_name=>'APEX.IG.LINE_WITH_AREA'
,p_message_language=>'pt'
,p_message_text=>unistr('Linha com \00C1rea')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141509781425752091)
,p_name=>'APEX.IG.LISTAGG'
,p_message_language=>'pt'
,p_message_text=>'Listagg'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141501912556752089)
,p_name=>'APEX.IG.LOW_COLUMN'
,p_message_language=>'pt'
,p_message_text=>unistr('M\00EDnimo')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141512202115752092)
,p_name=>'APEX.IG.MAILADDRESSES_COMMASEP'
,p_message_language=>'pt'
,p_message_text=>unistr('Separar v\00E1rios endere\00E7os com v\00EDrgulas')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141461040375752077)
,p_name=>'APEX.IG.MATCHES_REGULAR_EXPRESSION'
,p_message_language=>'pt'
,p_message_text=>unistr('corresponde \00E0 express\00E3o regular')
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141485412704752084)
,p_name=>'APEX.IG.MAX'
,p_message_language=>'pt'
,p_message_text=>unistr('M\00E1ximo')
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141519743471752094)
,p_name=>'APEX.IG.MAX_OVERALL'
,p_message_language=>'pt'
,p_message_text=>unistr('M\00E1ximo Global')
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141485689474752084)
,p_name=>'APEX.IG.MEDIAN'
,p_message_language=>'pt'
,p_message_text=>'Mediano'
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141519877938752094)
,p_name=>'APEX.IG.MEDIAN_OVERALL'
,p_message_language=>'pt'
,p_message_text=>'Mediano Global'
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141485358644752084)
,p_name=>'APEX.IG.MIN'
,p_message_language=>'pt'
,p_message_text=>unistr('M\00EDnimo')
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141461154817752077)
,p_name=>'APEX.IG.MINUTES'
,p_message_language=>'pt'
,p_message_text=>'minutos'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141486180495752084)
,p_name=>'APEX.IG.MINUTES_AGO'
,p_message_language=>'pt'
,p_message_text=>unistr('H\00E1 minutos')
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141519649504752094)
,p_name=>'APEX.IG.MIN_OVERALL'
,p_message_language=>'pt'
,p_message_text=>unistr('M\00EDnimo Global')
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141461510649752077)
,p_name=>'APEX.IG.MONTHS'
,p_message_language=>'pt'
,p_message_text=>'meses'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141468179579752079)
,p_name=>'APEX.IG.MORE_DATA_FOUND'
,p_message_language=>'pt'
,p_message_text=>unistr('Os dados cont\00EAm mais de %0 linhas, o que excede o m\00E1ximo permitido. Aplique filtros adicionais para visualizar os resultados.')
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141493926821752087)
,p_name=>'APEX.IG.MULTIIG_PAGE_REGION_STATIC_ID_REQUIRED'
,p_message_language=>'pt'
,p_message_text=>unistr('A ID Est\00E1tica da Regi\00E3o deve ser especificada dado que a p\00E1gina cont\00E9m v\00E1rias Grelhas Interativas.')
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141464243151752078)
,p_name=>'APEX.IG.NAME'
,p_message_language=>'pt'
,p_message_text=>'Nome'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141464411269752078)
,p_name=>'APEX.IG.NAMED_REPORT'
,p_message_language=>'pt'
,p_message_text=>unistr('Relat\00F3rio Nomeado')
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141448484994752073)
,p_name=>'APEX.IG.NEXT.DAY'
,p_message_language=>'pt'
,p_message_text=>'Dia Seguinte'
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141448276705752073)
,p_name=>'APEX.IG.NEXT.HOUR'
,p_message_language=>'pt'
,p_message_text=>unistr('Pr\00F3xima hora')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141450444486752074)
,p_name=>'APEX.IG.NEXT.MINUTE'
,p_message_language=>'pt'
,p_message_text=>unistr('Pr\00F3ximo Minuto')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141448799428752073)
,p_name=>'APEX.IG.NEXT.MONTH'
,p_message_language=>'pt'
,p_message_text=>unistr('M\00EAs Seguinte')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141448614419752073)
,p_name=>'APEX.IG.NEXT.WEEK'
,p_message_language=>'pt'
,p_message_text=>unistr('Pr\00F3xima Semana')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141448574990752073)
,p_name=>'APEX.IG.NEXT.X_DAYS'
,p_message_language=>'pt'
,p_message_text=>unistr('Pr\00F3ximos %0 Dias')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141448304057752073)
,p_name=>'APEX.IG.NEXT.X_HOURS'
,p_message_language=>'pt'
,p_message_text=>unistr('Pr\00F3ximas %0 Horas')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141450501447752074)
,p_name=>'APEX.IG.NEXT.X_MINUTES'
,p_message_language=>'pt'
,p_message_text=>unistr('Pr\00F3ximos %0 Minutos')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141449864671752074)
,p_name=>'APEX.IG.NEXT.X_MONTHS'
,p_message_language=>'pt'
,p_message_text=>unistr('Pr\00F3ximos %0 Meses')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141449921060752074)
,p_name=>'APEX.IG.NEXT.X_WEEKS'
,p_message_language=>'pt'
,p_message_text=>unistr('Pr\00F3ximas %0 Semanas')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141448943304752073)
,p_name=>'APEX.IG.NEXT.X_YEARS'
,p_message_language=>'pt'
,p_message_text=>unistr('Pr\00F3ximos %0 Anos')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141448836537752073)
,p_name=>'APEX.IG.NEXT.YEAR'
,p_message_language=>'pt'
,p_message_text=>'Ano Seguinte'
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141460119301752077)
,p_name=>'APEX.IG.NOT_BETWEEN'
,p_message_language=>'pt'
,p_message_text=>unistr('n\00E3o entre')
,p_is_js_message=>true
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141459116197752076)
,p_name=>'APEX.IG.NOT_EQUALS'
,p_message_language=>'pt'
,p_message_text=>'diferente'
,p_is_js_message=>true
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141523917234752096)
,p_name=>'APEX.IG.NOT_EXIST'
,p_message_language=>'pt'
,p_message_text=>unistr('A regi\00E3o com a ID %0 n\00E3o \00E9 uma regi\00E3o da Grelha Interativa ou n\00E3o existe na aplica\00E7\00E3o %1.')
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141459595157752077)
,p_name=>'APEX.IG.NOT_IN'
,p_message_language=>'pt'
,p_message_text=>unistr('n\00E3o est\00E1 em')
,p_is_js_message=>true
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141460397864752077)
,p_name=>'APEX.IG.NOT_IN_THE_LAST'
,p_message_language=>'pt'
,p_message_text=>unistr('n\00E3o est\00E1 no(s) \00FAltimo(s)')
,p_is_js_message=>true
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141460583776752077)
,p_name=>'APEX.IG.NOT_IN_THE_NEXT'
,p_message_language=>'pt'
,p_message_text=>unistr('n\00E3o est\00E1 no(s) pr\00F3ximo(s)')
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141468073168752079)
,p_name=>'APEX.IG.NO_DATA_FOUND'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o foram encontrados dados')
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141504842841752090)
,p_name=>'APEX.IG.NULLS'
,p_message_language=>'pt'
,p_message_text=>'Nulos'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141509930420752091)
,p_name=>'APEX.IG.NUMBER'
,p_message_language=>'pt'
,p_message_text=>unistr('Num\00E9rico')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141505173960752090)
,p_name=>'APEX.IG.OFF'
,p_message_language=>'pt'
,p_message_text=>'Desativado'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141505254339752090)
,p_name=>'APEX.IG.ON'
,p_message_language=>'pt'
,p_message_text=>'Ativado'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141458395952752076)
,p_name=>'APEX.IG.ONE_MINUTE_AGO'
,p_message_language=>'pt'
,p_message_text=>unistr('H\00E1 1 minuto')
,p_is_js_message=>true
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141512767335752092)
,p_name=>'APEX.IG.OPEN_COLORPICKER'
,p_message_language=>'pt'
,p_message_text=>'Abrir Seletor de Cores: %0'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141501676198752089)
,p_name=>'APEX.IG.OPEN_COLUMN'
,p_message_language=>'pt'
,p_message_text=>'Abertura'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141465315053752078)
,p_name=>'APEX.IG.OPERATOR'
,p_message_language=>'pt'
,p_message_text=>'Operador'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141501055545752089)
,p_name=>'APEX.IG.ORIENTATION'
,p_message_language=>'pt'
,p_message_text=>unistr('Orienta\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141503442877752090)
,p_name=>'APEX.IG.PIE'
,p_message_language=>'pt'
,p_message_text=>'Sectograma'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141466612722752079)
,p_name=>'APEX.IG.PIVOT'
,p_message_language=>'pt'
,p_message_text=>unistr('Din\00E2mica')
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141431815371752068)
,p_name=>'APEX.IG.PIVOT_VIEW'
,p_message_language=>'pt'
,p_message_text=>unistr('Visualiza\00E7\00E3o Din\00E2mica')
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141512674128752092)
,p_name=>'APEX.IG.PLACEHOLDER_INVALUES'
,p_message_language=>'pt'
,p_message_text=>'Separar valores com "%0"'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141503570059752090)
,p_name=>'APEX.IG.POLAR'
,p_message_language=>'pt'
,p_message_text=>'Polar'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141508823755752091)
,p_name=>'APEX.IG.POSITION_CENTER'
,p_message_language=>'pt'
,p_message_text=>'Centro'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141508927951752091)
,p_name=>'APEX.IG.POSITION_END'
,p_message_language=>'pt'
,p_message_text=>'Fim'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141508731156752091)
,p_name=>'APEX.IG.POSITION_START'
,p_message_language=>'pt'
,p_message_text=>unistr('In\00EDcio')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141464515153752078)
,p_name=>'APEX.IG.PRIMARY'
,p_message_language=>'pt'
,p_message_text=>'Principal'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141464891520752078)
,p_name=>'APEX.IG.PRIMARY_DEFAULT'
,p_message_language=>'pt'
,p_message_text=>unistr('Valor Por Omiss\00E3o Principal')
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141481329731752083)
,p_name=>'APEX.IG.PRIMARY_REPORT'
,p_message_language=>'pt'
,p_message_text=>unistr('Relat\00F3rio Principal')
,p_is_js_message=>true
,p_version_scn=>2705329
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141354982870752046)
,p_name=>'APEX.IG.PRINT_ACCESSIBLE.PROMPT'
,p_message_language=>'pt'
,p_message_text=>'Incluir Identificadores de Acessibilidade'
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141352376529752045)
,p_name=>'APEX.IG.PRINT_ORIENTATION.LOV.HORIZONTAL.D'
,p_message_language=>'pt'
,p_message_text=>'Horizontal'
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141352469982752045)
,p_name=>'APEX.IG.PRINT_ORIENTATION.LOV.VERTICAL.D'
,p_message_language=>'pt'
,p_message_text=>'Vertical'
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141352271716752045)
,p_name=>'APEX.IG.PRINT_ORIENTATION.PROMPT'
,p_message_language=>'pt'
,p_message_text=>unistr('Orienta\00E7\00E3o da p\00E1gina')
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141352115447752045)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.A3.D'
,p_message_language=>'pt'
,p_message_text=>'A3'
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141352020248752045)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.A4.D'
,p_message_language=>'pt'
,p_message_text=>'A4'
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141355146077752046)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.CUSTOM.D'
,p_message_language=>'pt'
,p_message_text=>'Customizado'
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141351897485752045)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.LEGAL.D'
,p_message_language=>'pt'
,p_message_text=>'Legal'
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141351716054752045)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.LETTER.D'
,p_message_language=>'pt'
,p_message_text=>'Letter'
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141351970788752045)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.TABLOID.D'
,p_message_language=>'pt'
,p_message_text=>'Tabloid'
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141351690113752045)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.PROMPT'
,p_message_language=>'pt'
,p_message_text=>unistr('Tamanho da p\00E1gina')
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141317211136752035)
,p_name=>'APEX.IG.PRINT_STRIP_RICH_TEXT.PROMPT'
,p_message_language=>'pt'
,p_message_text=>'Retirar RTF'
,p_is_js_message=>true
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141503633898752090)
,p_name=>'APEX.IG.RADAR'
,p_message_language=>'pt'
,p_message_text=>'Radar'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141503750906752090)
,p_name=>'APEX.IG.RANGE'
,p_message_language=>'pt'
,p_message_text=>'Intervalo'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141513922185752093)
,p_name=>'APEX.IG.REFRESH'
,p_message_language=>'pt'
,p_message_text=>'Renovar'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141468877518752079)
,p_name=>'APEX.IG.REFRESH_ROW'
,p_message_language=>'pt'
,p_message_text=>'Renovar Linha'
,p_is_js_message=>true
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141467655148752079)
,p_name=>'APEX.IG.REFRESH_ROWS'
,p_message_language=>'pt'
,p_message_text=>'Renovar Linhas'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141472826349752080)
,p_name=>'APEX.IG.REGION_NOT_EXIST'
,p_message_language=>'pt'
,p_message_text=>unistr('A regi\00E3o da Grelha Interativa n\00E3o existe na aplica\00E7\00E3o %0, p\00E1gina %1 e regi\00E3o %2.')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141433376219752069)
,p_name=>'APEX.IG.REMOVE_CONTROL'
,p_message_language=>'pt'
,p_message_text=>'Retirar %0'
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141463954902752078)
,p_name=>'APEX.IG.REPORT'
,p_message_language=>'pt'
,p_message_text=>unistr('Relat\00F3rio')
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141523182242752095)
,p_name=>'APEX.IG.REPORT.DELETED'
,p_message_language=>'pt'
,p_message_text=>unistr('Relat\00F3rio apagado')
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141522869534752095)
,p_name=>'APEX.IG.REPORT.SAVED.ALTERNATIVE'
,p_message_language=>'pt'
,p_message_text=>unistr('Relat\00F3rio alternativo gravado para todos os utilizadores')
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141522721363752095)
,p_name=>'APEX.IG.REPORT.SAVED.DEFAULT'
,p_message_language=>'pt'
,p_message_text=>unistr('Relat\00F3rio por omiss\00E3o gravado para todos os utilizadores')
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141523084353752095)
,p_name=>'APEX.IG.REPORT.SAVED.PRIVATE'
,p_message_language=>'pt'
,p_message_text=>unistr('Relat\00F3rio privado gravado')
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141522960147752095)
,p_name=>'APEX.IG.REPORT.SAVED.PUBLIC'
,p_message_language=>'pt'
,p_message_text=>unistr('Relat\00F3rio p\00FAblico gravado para todos os utilizadores')
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141472994424752081)
,p_name=>'APEX.IG.REPORT_ALIAS_DOES_NOT_EXIST'
,p_message_language=>'pt'
,p_message_text=>unistr('A Grelha Interativa gravada com o nome %0 n\00E3o existe.')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141458214974752076)
,p_name=>'APEX.IG.REPORT_DATA_AS_OF.X.MINUTES_AGO'
,p_message_language=>'pt'
,p_message_text=>unistr('Dados da grelha de h\00E1 %0 minutos')
,p_is_js_message=>true
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141458119392752076)
,p_name=>'APEX.IG.REPORT_DATA_AS_OF_ONE_MINUTE_AGO'
,p_message_language=>'pt'
,p_message_text=>unistr('Dados da grelha de h\00E1 1 minuto')
,p_is_js_message=>true
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141393610604752057)
,p_name=>'APEX.IG.REPORT_DOES_NOT_EXIST'
,p_message_language=>'pt'
,p_message_text=>unistr('O Relat\00F3rio da Grelha Interativa n\00E3o existe.')
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141516171139752093)
,p_name=>'APEX.IG.REPORT_EDIT'
,p_message_language=>'pt'
,p_message_text=>unistr('Relat\00F3rio - Editar')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141472760421752080)
,p_name=>'APEX.IG.REPORT_ID_DOES_NOT_EXIST'
,p_message_language=>'pt'
,p_message_text=>unistr('A Grelha Interativa gravada com a ID %0 n\00E3o existe.')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141516049400752093)
,p_name=>'APEX.IG.REPORT_SAVE_AS'
,p_message_language=>'pt'
,p_message_text=>unistr('Relat\00F3rio - Gravar Como')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141433493564752069)
,p_name=>'APEX.IG.REPORT_SETTINGS'
,p_message_language=>'pt'
,p_message_text=>unistr('Defini\00E7\00F5es da Grelha')
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141524022234752096)
,p_name=>'APEX.IG.REPORT_STATIC_ID_DOES_NOT_EXIST'
,p_message_language=>'pt'
,p_message_text=>unistr('A Grelha Interativa gravada com a ID est\00E1tica %0 n\00E3o existe.')
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141519056375752094)
,p_name=>'APEX.IG.REPORT_VIEW'
,p_message_language=>'pt'
,p_message_text=>unistr('Visualiza\00E7\00E3o do Relat\00F3rio')
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141432530687752069)
,p_name=>'APEX.IG.RESET'
,p_message_language=>'pt'
,p_message_text=>'Redefinir'
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141468985692752079)
,p_name=>'APEX.IG.REVERT_CHANGES'
,p_message_language=>'pt'
,p_message_text=>unistr('Reverter Altera\00E7\00F5es')
,p_is_js_message=>true
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141467706699752079)
,p_name=>'APEX.IG.REVERT_ROWS'
,p_message_language=>'pt'
,p_message_text=>'Reverter Linhas'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141464925374752078)
,p_name=>'APEX.IG.ROW'
,p_message_language=>'pt'
,p_message_text=>'Linha'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141463812288752078)
,p_name=>'APEX.IG.ROWS_PER_PAGE'
,p_message_language=>'pt'
,p_message_text=>unistr('Linhas por P\00E1gina')
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141523643193752096)
,p_name=>'APEX.IG.ROW_ACTIONS'
,p_message_language=>'pt'
,p_message_text=>unistr('A\00E7\00F5es da Linha')
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141524884639752096)
,p_name=>'APEX.IG.ROW_ACTIONS_FOR'
,p_message_language=>'pt'
,p_message_text=>unistr('A\00E7\00F5es para a linha %0')
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141432858799752069)
,p_name=>'APEX.IG.SAVE'
,p_message_language=>'pt'
,p_message_text=>'Gravar'
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141477971826752082)
,p_name=>'APEX.IG.SAVED'
,p_message_language=>'pt'
,p_message_text=>'gravado'
,p_is_js_message=>true
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141382576753752054)
,p_name=>'APEX.IG.SAVED_REPORT'
,p_message_language=>'pt'
,p_message_text=>unistr('Relat\00F3rio gravado: %0')
,p_is_js_message=>true
,p_version_scn=>2705310
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141431023339752068)
,p_name=>'APEX.IG.SAVED_REPORTS'
,p_message_language=>'pt'
,p_message_text=>unistr('Relat\00F3rios Gravados')
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141431179907752068)
,p_name=>'APEX.IG.SAVED_REPORT_DEFAULT'
,p_message_language=>'pt'
,p_message_text=>unistr('Valor Por Omiss\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141404618458752060)
,p_name=>'APEX.IG.SAVED_REPORT_EXISTS'
,p_message_language=>'pt'
,p_message_text=>unistr('J\00E1 existe um relat\00F3rio gravado com o nome %0. Introduza um novo nome.')
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141431298889752068)
,p_name=>'APEX.IG.SAVED_REPORT_PRIVATE'
,p_message_language=>'pt'
,p_message_text=>'Privado'
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141431387684752068)
,p_name=>'APEX.IG.SAVED_REPORT_PUBLIC'
,p_message_language=>'pt'
,p_message_text=>unistr('P\00FAblico')
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141518714247752094)
,p_name=>'APEX.IG.SAVE_AS'
,p_message_language=>'pt'
,p_message_text=>'Gravar Como'
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141467060884752079)
,p_name=>'APEX.IG.SAVE_REPORT_SETTINGS'
,p_message_language=>'pt'
,p_message_text=>unistr('Gravar Defini\00E7\00F5es do Relat\00F3rio')
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141503896657752090)
,p_name=>'APEX.IG.SCATTER'
,p_message_language=>'pt'
,p_message_text=>unistr('Dispers\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141430972114752068)
,p_name=>'APEX.IG.SEARCH'
,p_message_language=>'pt'
,p_message_text=>'Pesquisar'
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141511098833752092)
,p_name=>'APEX.IG.SEARCH.ALL_COLUMNS'
,p_message_language=>'pt'
,p_message_text=>'Pesquisar: Todas as Colunas de Texto'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141430851347752068)
,p_name=>'APEX.IG.SEARCH.COLUMN'
,p_message_language=>'pt'
,p_message_text=>'Pesquisar: %0'
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141510372143752092)
,p_name=>'APEX.IG.SEARCH.ORACLE_TEXT'
,p_message_language=>'pt'
,p_message_text=>'Pesquisa: Texto Integral'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141458063444752076)
,p_name=>'APEX.IG.SEARCH_FOR.X'
,p_message_language=>'pt'
,p_message_text=>'Pesquisar ''%0'''
,p_is_js_message=>true
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141500420009752089)
,p_name=>'APEX.IG.SELECT'
,p_message_language=>'pt'
,p_message_text=>'- Selecionar -'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141440567000752071)
,p_name=>'APEX.IG.SELECTION'
,p_message_language=>'pt'
,p_message_text=>unistr('Sele\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141493651701752087)
,p_name=>'APEX.IG.SELECT_1_ROW_IN_MASTER'
,p_message_language=>'pt'
,p_message_text=>unistr('Selecionar 1 linha na regi\00E3o pai')
,p_is_js_message=>true
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141430700972752068)
,p_name=>'APEX.IG.SELECT_COLUMNS_TO_SEARCH'
,p_message_language=>'pt'
,p_message_text=>'Selecionar colunas para pesquisar'
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141523392755752096)
,p_name=>'APEX.IG.SEL_ACTIONS'
,p_message_language=>'pt'
,p_message_text=>unistr('A\00E7\00F5es de Sele\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141440747747752071)
,p_name=>'APEX.IG.SEL_MODE_CELL'
,p_message_language=>'pt'
,p_message_text=>unistr('Sele\00E7\00E3o de C\00E9lulas')
,p_is_js_message=>true
,p_version_scn=>2705320
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141440688298752071)
,p_name=>'APEX.IG.SEL_MODE_ROW'
,p_message_language=>'pt'
,p_message_text=>unistr('Sele\00E7\00E3o de Linhas')
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141511673556752092)
,p_name=>'APEX.IG.SEND_AS_EMAIL'
,p_message_language=>'pt'
,p_message_text=>'Enviar como Mensagem de Email'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141504271157752090)
,p_name=>'APEX.IG.SERIES_COLUMN'
,p_message_language=>'pt'
,p_message_text=>unistr('S\00E9rie')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141428406489752067)
,p_name=>'APEX.IG.SHOW'
,p_message_language=>'pt'
,p_message_text=>'Mostrar'
,p_is_js_message=>true
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141483626949752084)
,p_name=>'APEX.IG.SHOW_OVERALL_VALUE'
,p_message_language=>'pt'
,p_message_text=>'Mostrar Valor Global'
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141468593612752079)
,p_name=>'APEX.IG.SINGLE_ROW_VIEW'
,p_message_language=>'pt'
,p_message_text=>unistr('Visualiza\00E7\00E3o de Linha \00DAnica')
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141466867336752079)
,p_name=>'APEX.IG.SORT'
,p_message_language=>'pt'
,p_message_text=>'Ordenar'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141504366184752090)
,p_name=>'APEX.IG.SORT_BY'
,p_message_language=>'pt'
,p_message_text=>'Ordenar Por'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141523711636752096)
,p_name=>'APEX.IG.SORT_ONLY_ONE_PER_COLUMN'
,p_message_language=>'pt'
,p_message_text=>unistr('S\00F3 pode definir uma ordena\00E7\00E3o por coluna.')
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141523574999752096)
,p_name=>'APEX.IG.SRV_CHANGE_MENU'
,p_message_language=>'pt'
,p_message_text=>'Alterar'
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141505396941752090)
,p_name=>'APEX.IG.STACK'
,p_message_language=>'pt'
,p_message_text=>'Pilha'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141460899848752077)
,p_name=>'APEX.IG.STARTS_WITH'
,p_message_language=>'pt'
,p_message_text=>unistr('come\00E7a por')
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141503918615752090)
,p_name=>'APEX.IG.STOCK'
,p_message_language=>'pt'
,p_message_text=>unistr('A\00E7\00F5es')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141423261605752066)
,p_name=>'APEX.IG.STRETCH_COLUMNS'
,p_message_language=>'pt'
,p_message_text=>'Alongar Larguras das Colunas'
,p_is_js_message=>true
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141467277711752079)
,p_name=>'APEX.IG.SUBSCRIPTION'
,p_message_language=>'pt'
,p_message_text=>unistr('Subscri\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141485272018752084)
,p_name=>'APEX.IG.SUM'
,p_message_language=>'pt'
,p_message_text=>'Soma'
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141525033668752096)
,p_name=>'APEX.IG.SUMMARY'
,p_message_language=>'pt'
,p_message_text=>unistr('Grelha Interativa. Relat\00F3rio: %0, Visualiza\00E7\00E3o: %1.')
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141519144655752094)
,p_name=>'APEX.IG.SUM_OVERALL'
,p_message_language=>'pt'
,p_message_text=>'Soma Global'
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141502193393752089)
,p_name=>'APEX.IG.TARGET_COLUMN'
,p_message_language=>'pt'
,p_message_text=>'Alvo'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141508555217752091)
,p_name=>'APEX.IG.TEXT_COLOR'
,p_message_language=>'pt'
,p_message_text=>'Cor do Texto'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141433542558752069)
,p_name=>'APEX.IG.TOGGLE'
,p_message_language=>'pt'
,p_message_text=>'Alternar'
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141315695722752034)
,p_name=>'APEX.IG.TOOLBAR'
,p_message_language=>'pt'
,p_message_text=>'Grelha'
,p_is_js_message=>true
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141483582304752084)
,p_name=>'APEX.IG.TOOLTIP'
,p_message_language=>'pt'
,p_message_text=>'Nota Informativa'
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141464066164752078)
,p_name=>'APEX.IG.TYPE'
,p_message_language=>'pt'
,p_message_text=>'Tipo'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141468455042752079)
,p_name=>'APEX.IG.UNFREEZE'
,p_message_language=>'pt'
,p_message_text=>'Descongelar'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141465538312752078)
,p_name=>'APEX.IG.UNIT'
,p_message_language=>'pt'
,p_message_text=>'Unidade'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141511478439752092)
,p_name=>'APEX.IG.UNSAVED_CHANGES_CONTINUE_CONFIRM'
,p_message_language=>'pt'
,p_message_text=>unistr('Existem altera\00E7\00F5es n\00E3o gravadas. Continuar?')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141465484025752078)
,p_name=>'APEX.IG.VALUE'
,p_message_language=>'pt'
,p_message_text=>'Valor'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141501233108752089)
,p_name=>'APEX.IG.VALUE_COLUMN'
,p_message_language=>'pt'
,p_message_text=>'Valor'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141506120227752090)
,p_name=>'APEX.IG.VALUE_REQUIRED'
,p_message_language=>'pt'
,p_message_text=>unistr('\00C9 necess\00E1rio um valor.')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141491333732752086)
,p_name=>'APEX.IG.VALUE_TIMESTAMP_TZ'
,p_message_language=>'pt'
,p_message_text=>unistr('Valor (o fuso hor\00E1rio n\00E3o pode ser alterado)')
,p_is_js_message=>true
,p_version_scn=>2705332
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141510053445752091)
,p_name=>'APEX.IG.VARCHAR2'
,p_message_language=>'pt'
,p_message_text=>'Texto'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141502597507752089)
,p_name=>'APEX.IG.VERTICAL'
,p_message_language=>'pt'
,p_message_text=>'Vertical'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141463507052752078)
,p_name=>'APEX.IG.VIEW'
,p_message_language=>'pt'
,p_message_text=>'Visualizar'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141398613745752059)
,p_name=>'APEX.IG.VIEW_MODE_DESCRIPTION'
,p_message_language=>'pt'
,p_message_text=>unistr('Grelha no modo de visualiza\00E7\00E3o, prima para editar')
,p_is_js_message=>true
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141500597796752089)
,p_name=>'APEX.IG.VISIBLE'
,p_message_language=>'pt'
,p_message_text=>'Apresentado'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141502090414752089)
,p_name=>'APEX.IG.VOLUME_COLUMN'
,p_message_language=>'pt'
,p_message_text=>'Volume'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141461425020752077)
,p_name=>'APEX.IG.WEEKS'
,p_message_language=>'pt'
,p_message_text=>'semanas'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141500659475752089)
,p_name=>'APEX.IG.WIDTH'
,p_message_language=>'pt'
,p_message_text=>unistr('Largura M\00EDnima da Coluna (P\00EDxel)')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141452609815752075)
,p_name=>'APEX.IG.X.BETWEEN.Y.AND.Z'
,p_message_language=>'pt'
,p_message_text=>'%0 entre %1 e %2'
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141452385759752074)
,p_name=>'APEX.IG.X.CONTAINS.Y'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 cont\00E9m %1')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141452406327752074)
,p_name=>'APEX.IG.X.DOES_NOT_CONTAIN.Y'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 n\00E3o cont\00E9m %1')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141427829682752067)
,p_name=>'APEX.IG.X.DOES_NOT_START_WITH.Y'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 n\00E3o come\00E7a por %1')
,p_is_js_message=>true
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141451170311752074)
,p_name=>'APEX.IG.X.EQUALS.Y'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 \00E9 igual a %1')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141451387287752074)
,p_name=>'APEX.IG.X.GREATER_THAN.Y'
,p_message_language=>'pt'
,p_message_text=>'%0 maior que %1'
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141451418623752074)
,p_name=>'APEX.IG.X.GREATER_THAN_OR_EQUALS.Y'
,p_message_language=>'pt'
,p_message_text=>'%0 maior que ou igual a %1'
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141452132178752074)
,p_name=>'APEX.IG.X.IN.Y'
,p_message_language=>'pt'
,p_message_text=>'%0 em %1'
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141453317658752075)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.DAYS'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 nos \00FAltimos %1 dias')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141453195723752075)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.HOURS'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 nas \00FAltimas %1 horas')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141452960848752075)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.MINUTES'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 nos \00FAltimos %1 minutos')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141453793986752075)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.MONTHS'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 nos \00FAltimos %1 meses')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141453572931752075)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.WEEKS'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 nas \00FAltimas %1 semanas')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141453935669752075)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.YEARS'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 nos \00FAltimos %1 anos')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141453232668752075)
,p_name=>'APEX.IG.X.IN_THE_LAST_DAY'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 no \00FAltimo dia')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141453002125752075)
,p_name=>'APEX.IG.X.IN_THE_LAST_HOUR'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 na \00FAltima hora')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141452839876752075)
,p_name=>'APEX.IG.X.IN_THE_LAST_MINUTE'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 no \00FAltimo minuto')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141453647099752075)
,p_name=>'APEX.IG.X.IN_THE_LAST_MONTH'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 no \00FAltimo m\00EAs')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141453485501752075)
,p_name=>'APEX.IG.X.IN_THE_LAST_WEEK'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 na \00FAltima semana')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141453872854752075)
,p_name=>'APEX.IG.X.IN_THE_LAST_YEAR'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 no \00FAltimo ano')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141455756177752075)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.DAYS'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 nos pr\00F3ximos %1 dias')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141455532568752075)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.HOURS'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 nas pr\00F3ximas %1 horas')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141455321448752075)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.MINUTES'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 nos pr\00F3ximos %1 minutos')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141456162772752076)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.MONTHS'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 nos pr\00F3ximos %1 meses')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141455946868752076)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.WEEKS'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 nas pr\00F3ximas %1 semanas')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141456391667752076)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.YEARS'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 nos pr\00F3ximos %1 anos')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141455685081752075)
,p_name=>'APEX.IG.X.IN_THE_NEXT_DAY'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 no pr\00F3ximo dia')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141455412691752075)
,p_name=>'APEX.IG.X.IN_THE_NEXT_HOUR'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 na pr\00F3xima hora')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141455227370752075)
,p_name=>'APEX.IG.X.IN_THE_NEXT_MINUTE'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 no pr\00F3ximo minuto')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141456091964752076)
,p_name=>'APEX.IG.X.IN_THE_NEXT_MONTH'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 no pr\00F3ximo m\00EAs')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141455887921752075)
,p_name=>'APEX.IG.X.IN_THE_NEXT_WEEK'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 na pr\00F3xima semana')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141456211758752076)
,p_name=>'APEX.IG.X.IN_THE_NEXT_YEAR'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 no pr\00F3ximo ano')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141451888308752074)
,p_name=>'APEX.IG.X.IS_NOT_NULL'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 n\00E3o est\00E1 vazio')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141451733651752074)
,p_name=>'APEX.IG.X.IS_NULL'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 est\00E1 vazio')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141451535125752074)
,p_name=>'APEX.IG.X.LESS_THAN.Y'
,p_message_language=>'pt'
,p_message_text=>'%0 menor que %1'
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141451676912752074)
,p_name=>'APEX.IG.X.LESS_THAN_OR_EQUALS.Y'
,p_message_language=>'pt'
,p_message_text=>'%0 menor que ou igual a %1'
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141451931475752074)
,p_name=>'APEX.IG.X.LIKE.Y'
,p_message_language=>'pt'
,p_message_text=>'%0 semelhante a %1'
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141452525952752075)
,p_name=>'APEX.IG.X.MATCHES_REGULAR_EXPRESSION.Y'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 corresponde \00E0 express\00E3o regular %1')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141458457801752076)
,p_name=>'APEX.IG.X.MINUTES_AGO'
,p_message_language=>'pt'
,p_message_text=>unistr('h\00E1 %0 minutos')
,p_is_js_message=>true
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141452714896752075)
,p_name=>'APEX.IG.X.NOT_BETWEEN.Y.AND.Z'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 n\00E3o entre %1 e %2')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141451265337752074)
,p_name=>'APEX.IG.X.NOT_EQUALS.Y'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 \00E9 diferente de %1')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141452213792752074)
,p_name=>'APEX.IG.X.NOT_IN.Y'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 n\00E3o est\00E1 em %1')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141454536489752075)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.DAYS'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 n\00E3o est\00E1 nos \00FAltimos %1 dias')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141454342938752075)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.HOURS'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 n\00E3o est\00E1 nas \00FAltimas %1 horas')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141454117831752075)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.MINUTES'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 n\00E3o est\00E1 nos \00FAltimos %1 minutos')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141454935826752075)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.MONTHS'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 n\00E3o est\00E1 nos \00FAltimos %1 meses')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141454758940752075)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.WEEKS'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 n\00E3o est\00E1 nas \00FAltimas %1 semanas')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141455178041752075)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.YEARS'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 n\00E3o est\00E1 nos \00FAltimos %1 anos')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141454453699752075)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_DAY'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 n\00E3o est\00E1 no \00FAltimo dia')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141454281015752075)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_HOUR'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 n\00E3o est\00E1 na \00FAltima hora')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141454027840752075)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_MINUTE'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 n\00E3o est\00E1 no \00FAltimo minuto')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141454856386752075)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_MONTH'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 n\00E3o est\00E1 no \00FAltimo m\00EAs')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141454641478752075)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_WEEK'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 n\00E3o est\00E1 na \00FAltima semana')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141455055678752075)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_YEAR'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 n\00E3o est\00E1 no \00FAltimo ano')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141456988049752076)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.DAYS'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 n\00E3o est\00E1 nos pr\00F3ximos %1 dias')
,p_is_js_message=>true
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141456741471752076)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.HOURS'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 n\00E3o est\00E1 nas pr\00F3ximas %1 horas')
,p_is_js_message=>true
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141456541637752076)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.MINUTES'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 n\00E3o est\00E1 nos pr\00F3ximos %1 minutos')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141457376674752076)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.MONTHS'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 n\00E3o est\00E1 nos pr\00F3ximos %1 meses ')
,p_is_js_message=>true
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141457194701752076)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.WEEKS'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 n\00E3o est\00E1 nas pr\00F3ximas %1 semanas')
,p_is_js_message=>true
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141457572346752076)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.YEARS'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 n\00E3o est\00E1 nos pr\00F3ximos %1 anos')
,p_is_js_message=>true
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141456859841752076)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_DAY'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 n\00E3o est\00E1 no pr\00F3ximo dia')
,p_is_js_message=>true
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141456634835752076)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_HOUR'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 n\00E3o est\00E1 na pr\00F3xima hora')
,p_is_js_message=>true
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141456421093752076)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_MINUTE'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 n\00E3o est\00E1 no pr\00F3ximo minuto')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141457243028752076)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_MONTH'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 n\00E3o est\00E1 no pr\00F3ximo m\00EAs')
,p_is_js_message=>true
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141457036370752076)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_WEEK'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 n\00E3o est\00E1 na pr\00F3xima semana')
,p_is_js_message=>true
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141457492982752076)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_YEAR'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 n\00E3o est\00E1 no pr\00F3ximo ano')
,p_is_js_message=>true
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141452055124752074)
,p_name=>'APEX.IG.X.NOT_LIKE.Y'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 n\00E3o \00E9 semelhante a %1')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141458928300752076)
,p_name=>'APEX.IG.X.STARTS_WITH.Y'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 come\00E7a por %1')
,p_is_js_message=>true
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141501315333752089)
,p_name=>'APEX.IG.X_COLUMN'
,p_message_language=>'pt'
,p_message_text=>'X'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141461664484752077)
,p_name=>'APEX.IG.YEARS'
,p_message_language=>'pt'
,p_message_text=>'anos'
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141501497027752089)
,p_name=>'APEX.IG.Y_COLUMN'
,p_message_language=>'pt'
,p_message_text=>'Y'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141501544935752089)
,p_name=>'APEX.IG.Z_COLUMN'
,p_message_language=>'pt'
,p_message_text=>'Z'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141510534762752092)
,p_name=>'APEX.IG_FORMAT_SAMPLE_1'
,p_message_language=>'pt'
,p_message_text=>'Segunda-feira, 12 de janeiro de 2016'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141510606965752092)
,p_name=>'APEX.IG_FORMAT_SAMPLE_2'
,p_message_language=>'pt'
,p_message_text=>'Janeiro'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141510747084752092)
,p_name=>'APEX.IG_FORMAT_SAMPLE_3'
,p_message_language=>'pt'
,p_message_text=>unistr('16 horas atr\00E1s')
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141510835888752092)
,p_name=>'APEX.IG_FORMAT_SAMPLE_4'
,p_message_language=>'pt'
,p_message_text=>'em 16 h'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141328858901752038)
,p_name=>'APEX.ITEM.CROPPER.APPLY'
,p_message_language=>'pt'
,p_message_text=>'Aplicar'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141320801743752036)
,p_name=>'APEX.ITEM.CROPPER.HELP.TEXT'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Arraste a sua imagem e utilize o cursor de desloca\00E7\00E3o para reposicion\00E1-la dentro da moldura.</p>'),
'',
unistr('<p>Quando focado no recorte de imagens, est\00E3o dispon\00EDveis os seguintes atalhos de teclado:</p>'),
'<ul>',
'    <li>Seta para Esquerda: Deslocar a imagem para a esquerda*</li>',
'    <li>Seta para Cima: Deslocar a imagem para cima*</li>',
'    <li>Seta para a Direita: Deslocar a imagem para a direita*</li>',
'    <li>Seta para Baixo: Deslocar a imagem para baixo*</li>',
'    <li>I: Ampliar</li>',
'    <li>O: Reduzir</li>',
'    <li>L: Rodar para a esquerda</li>',
'    <li>R: Rodar para a direita</li>',
'</ul>',
'',
'<p class="margin-top-md"><em>*Manter Shift premido para se deslocar mais rapidamente</em></p>'))
,p_is_js_message=>true
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141321042097752036)
,p_name=>'APEX.ITEM.CROPPER.HELP.TITLE'
,p_message_language=>'pt'
,p_message_text=>unistr('Aux\00EDlio do \00EDcone Cortar Imagem')
,p_is_js_message=>true
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141328982843752038)
,p_name=>'APEX.ITEM.CROPPER.RESET'
,p_message_language=>'pt'
,p_message_text=>'Redefinir'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141321306196752036)
,p_name=>'APEX.ITEM.CROPPER.TITLE'
,p_message_language=>'pt'
,p_message_text=>'Cortar Imagem'
,p_is_js_message=>true
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141329018434752038)
,p_name=>'APEX.ITEM.CROPPER.ZOOM_SLIDER_LABEL'
,p_message_language=>'pt'
,p_message_text=>unistr('Mover o cursor de desloca\00E7\00E3o para ajustar o n\00EDvel de zoom')
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141358604530752047)
,p_name=>'APEX.ITEM.FILE.ACCEPTED_TYPES'
,p_message_language=>'pt'
,p_message_text=>unistr('Tipo de ficheiro inv\00E1lido. Tipos de ficheiros suportados %0.')
,p_is_js_message=>true
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141493071378752086)
,p_name=>'APEX.ITEM.FILE.BROWSE'
,p_message_language=>'pt'
,p_message_text=>'Percorrer'
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141492798012752086)
,p_name=>'APEX.ITEM.FILE.CHOOSE_FILE'
,p_message_language=>'pt'
,p_message_text=>'Escolher Ficheiro'
,p_is_js_message=>true
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141492834557752086)
,p_name=>'APEX.ITEM.FILE.CHOOSE_FILES'
,p_message_language=>'pt'
,p_message_text=>'Escolher Ficheiros'
,p_is_js_message=>true
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141358403319752047)
,p_name=>'APEX.ITEM.FILE.DROP_FILE'
,p_message_language=>'pt'
,p_message_text=>'Arrastar e Largar'
,p_is_js_message=>true
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141358816470752047)
,p_name=>'APEX.ITEM.FILE.DROP_FILES'
,p_message_language=>'pt'
,p_message_text=>'Arrastar e Largar Ficheiros'
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141360244061752047)
,p_name=>'APEX.ITEM.FILE.DROP_OR_CHOOSE_FILE'
,p_message_language=>'pt'
,p_message_text=>'Selecionar um ficheiro ou largar um aqui.'
,p_is_js_message=>true
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141360331203752047)
,p_name=>'APEX.ITEM.FILE.DROP_OR_CHOOSE_FILES'
,p_message_language=>'pt'
,p_message_text=>'Selecionar ou largar ficheiros aqui.'
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141360476151752047)
,p_name=>'APEX.ITEM.FILE.DROP_OR_SELECT_FILE'
,p_message_language=>'pt'
,p_message_text=>'Selecionar um ficheiro ou largar um aqui.'
,p_is_js_message=>true
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141360545717752047)
,p_name=>'APEX.ITEM.FILE.DROP_OR_SELECT_FILES'
,p_message_language=>'pt'
,p_message_text=>'Selecionar ou largar ficheiros aqui.'
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141358778012752047)
,p_name=>'APEX.ITEM.FILE.FILES_WITH_COUNT'
,p_message_language=>'pt'
,p_message_text=>'%0 ficheiros'
,p_is_js_message=>true
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141358508142752047)
,p_name=>'APEX.ITEM.FILE.MAX_FILE_SIZE'
,p_message_language=>'pt'
,p_message_text=>unistr('O ficheiro \00E9 demasiado grande. O tamanho m\00E1ximo do ficheiro \00E9 %0.')
,p_is_js_message=>true
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141339057096752041)
,p_name=>'APEX.ITEM.FILE.MULTIPLE_FILES_NOT_SUPPORTED'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o s\00E3o suportados v\00E1rios carregamentos de ficheiros.')
,p_is_js_message=>true
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141321940825752036)
,p_name=>'APEX.ITEM.FILE.REMOVE'
,p_message_language=>'pt'
,p_message_text=>'Retirar'
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141327461943752038)
,p_name=>'APEX.ITEM.GEOCODE.ADDRESS_REQUIRED'
,p_message_language=>'pt'
,p_message_text=>unistr('O endere\00E7o \00E9 obrigat\00F3rio.')
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141326320726752037)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_CITY'
,p_message_language=>'pt'
,p_message_text=>'Localidade'
,p_is_js_message=>true
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141326725801752037)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_COUNTRY'
,p_message_language=>'pt'
,p_message_text=>unistr('C\00F3digo do Pa\00EDs')
,p_is_js_message=>true
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141326406577752037)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_HOUSENUMBER'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00FAmero da Porta')
,p_is_js_message=>true
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141327353970752038)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_LATITUDE'
,p_message_language=>'pt'
,p_message_text=>'Latitude'
,p_is_js_message=>true
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141327276257752038)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_LONGITUDE'
,p_message_language=>'pt'
,p_message_text=>'Longitude'
,p_is_js_message=>true
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141327141199752038)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_MAPLINK'
,p_message_language=>'pt'
,p_message_text=>'Mostrar no Mapa'
,p_is_js_message=>true
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141326817608752037)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_MATCHSCORE'
,p_message_language=>'pt'
,p_message_text=>unistr('Pontua\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141326595335752037)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_POSTALCODE'
,p_message_language=>'pt'
,p_message_text=>unistr('C\00F3digo Postal')
,p_is_js_message=>true
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141326625490752037)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_STATE'
,p_message_language=>'pt'
,p_message_text=>'Distrito'
,p_is_js_message=>true
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141326242739752037)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_STREET'
,p_message_language=>'pt'
,p_message_text=>'Rua'
,p_is_js_message=>true
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141326184067752037)
,p_name=>'APEX.ITEM.GEOCODE.DIALOG_TITLE'
,p_message_language=>'pt'
,p_message_text=>unistr('Resultados da Codifica\00E7\00E3o Geogr\00E1fica')
,p_is_js_message=>true
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141357630952752046)
,p_name=>'APEX.ITEM.GEOCODE.GEOCODING_DONE'
,p_message_language=>'pt'
,p_message_text=>'Codificado geograficamente'
,p_is_js_message=>true
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141357750293752047)
,p_name=>'APEX.ITEM.GEOCODE.GEOCODING_OPEN'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o Codificado Geograficamente')
,p_is_js_message=>true
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141327081467752037)
,p_name=>'APEX.ITEM.GEOCODE.MAP_DIALOG_TITLE'
,p_message_language=>'pt'
,p_message_text=>'Mapa'
,p_is_js_message=>true
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141326943636752037)
,p_name=>'APEX.ITEM.GEOCODE.NO_DATA_FOUND'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o foram encontrados endere\00E7os.')
,p_is_js_message=>true
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141327559045752038)
,p_name=>'APEX.ITEM.GEOCODE.REQUIRED'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 \00E9 obrigat\00F3rio(a).')
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141433734327752069)
,p_name=>'APEX.ITEM.GEOCODE.REQUIRED_MULTIPLE'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 ou %1 \00E9 obrigat\00F3rio.')
,p_is_js_message=>true
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141523289274752095)
,p_name=>'APEX.ITEM.HELP_TEXT'
,p_message_language=>'pt'
,p_message_text=>unistr('Visualizar texto de aux\00EDlio para %0.')
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141329234200752038)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.CHOOSE_FILE'
,p_message_language=>'pt'
,p_message_text=>'Escolher Imagem'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141329362504752038)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.CHOOSE_FILES'
,p_message_language=>'pt'
,p_message_text=>'Escolher Imagens'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141329131752752038)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DOWNLOAD_LINK_TEXT'
,p_message_language=>'pt'
,p_message_text=>'Descarregar'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141329442671752038)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_FILE'
,p_message_language=>'pt'
,p_message_text=>'Arrastar e Largar'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141329591888752038)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_FILES'
,p_message_language=>'pt'
,p_message_text=>'Arrastar e Largar Imagens'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141329617354752038)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_CHOOSE_FILE'
,p_message_language=>'pt'
,p_message_text=>'Selecione uma imagem ou largue uma aqui.'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141329706142752038)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_CHOOSE_FILES'
,p_message_language=>'pt'
,p_message_text=>'Selecione ou largue imagens aqui.'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141329807464752038)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_SELECT_FILE'
,p_message_language=>'pt'
,p_message_text=>'Selecione uma imagem ou largue uma aqui.'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141329993626752038)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_SELECT_FILES'
,p_message_language=>'pt'
,p_message_text=>'Selecione ou largue imagens aqui.'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141414660431752063)
,p_name=>'APEX.ITEM_TYPE.CHECKBOX.CHECKED'
,p_message_language=>'pt'
,p_message_text=>'Selecionado'
,p_is_js_message=>true
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141414751899752063)
,p_name=>'APEX.ITEM_TYPE.CHECKBOX.UNCHECKED'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o Selecionado')
,p_is_js_message=>true
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141442250248752072)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.EMPTY_READONLY_COMBOBOX'
,p_message_language=>'pt'
,p_message_text=>unistr('Caixa mista s\00F3 de leitura em branco')
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141440027127752071)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.EMPTY_READONLY_LISTBOX'
,p_message_language=>'pt'
,p_message_text=>unistr('Caixa de listagem s\00F3 de leitura em branco')
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141439824961752071)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.READONLY_COMBOBOX'
,p_message_language=>'pt'
,p_message_text=>unistr('Caixa mista s\00F3 de leitura')
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141439923328752071)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.READONLY_LISTBOX'
,p_message_language=>'pt'
,p_message_text=>unistr('Caixa de listagem s\00F3 de leitura')
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141355637936752046)
,p_name=>'APEX.ITEM_TYPE.SLIDER.VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'pt'
,p_message_text=>unistr('#LABEL# n\00E3o est\00E1 no intervalo v\00E1lido de %0 a %1.')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141355708310752046)
,p_name=>'APEX.ITEM_TYPE.SLIDER.VALUE_NOT_MULTIPLE_OF_STEP'
,p_message_language=>'pt'
,p_message_text=>unistr('#LABEL# n\00E3o \00E9 um m\00FAltiplo de %0.')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141443039823752072)
,p_name=>'APEX.ITEM_TYPE.SWITCH.READONLY_SWITCH'
,p_message_language=>'pt'
,p_message_text=>unistr('Alternar para s\00F3 de leitura')
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141383610277752054)
,p_name=>'APEX.ITEM_TYPE.TEXT.READONLY_WITH_LINK'
,p_message_language=>'pt'
,p_message_text=>unistr('Edi\00E7\00E3o s\00F3 de leitura com uma liga\00E7\00E3o')
,p_version_scn=>2705310
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141355226092752046)
,p_name=>'APEX.ITEM_TYPE.YES_NO.INVALID_VALUE'
,p_message_language=>'pt'
,p_message_text=>'#LABEL# deve corresponder aos valores %0 e %1.'
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141355458114752046)
,p_name=>'APEX.ITEM_TYPE.YES_NO.NO_LABEL'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141441701017752071)
,p_name=>'APEX.ITEM_TYPE.YES_NO.OFF_LABEL'
,p_message_language=>'pt'
,p_message_text=>'Desativado'
,p_version_scn=>2705322
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141441888243752071)
,p_name=>'APEX.ITEM_TYPE.YES_NO.ON_LABEL'
,p_message_language=>'pt'
,p_message_text=>'Ativado'
,p_version_scn=>2705322
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141355301123752046)
,p_name=>'APEX.ITEM_TYPE.YES_NO.YES_LABEL'
,p_message_language=>'pt'
,p_message_text=>'Sim'
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141363243694752048)
,p_name=>'APEX.LANGUAGE_SELECTOR'
,p_message_language=>'pt'
,p_message_text=>unistr('Seletor de l\00EDnguas')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141299641890752029)
,p_name=>'APEX.LIST_MANAGER.ADD_ENTRY'
,p_message_language=>'pt'
,p_message_text=>'Acrescentar Entrada'
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141476419283752082)
,p_name=>'APEX.LIST_MANAGER.BUTTON_ADD'
,p_message_language=>'pt'
,p_message_text=>'Acrescentar'
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141476564228752082)
,p_name=>'APEX.LIST_MANAGER.BUTTON_REMOVE'
,p_message_language=>'pt'
,p_message_text=>'Retirar'
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141299703858752029)
,p_name=>'APEX.LIST_MANAGER.SELECTED_ENTRY'
,p_message_language=>'pt'
,p_message_text=>'Entradas selecionadas'
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141480232969752083)
,p_name=>'APEX.LTO.ADVANCED'
,p_message_language=>'pt'
,p_message_text=>unistr('Avan\00E7adas')
,p_version_scn=>2705329
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141480580743752083)
,p_name=>'APEX.LTO.CANCEL'
,p_message_language=>'pt'
,p_message_text=>'Cancelar'
,p_version_scn=>2705329
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141480382005752083)
,p_name=>'APEX.LTO.COMMON'
,p_message_language=>'pt'
,p_message_text=>'Comum'
,p_version_scn=>2705329
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141480606316752083)
,p_name=>'APEX.LTO.LIVE_TEMPLATE_OPTIONS'
,p_message_language=>'pt'
,p_message_text=>unistr('Op\00E7\00F5es de Modelo Interativo')
,p_version_scn=>2705329
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141481285895752083)
,p_name=>'APEX.LTO.NOT_APPLICABLE'
,p_message_language=>'pt'
,p_message_text=>unistr('As Op\00E7\00F5es de Modelo n\00E3o est\00E3o dispon\00EDveis porque este componente n\00E3o \00E9 renderizado na p\00E1gina.')
,p_version_scn=>2705329
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141480155733752083)
,p_name=>'APEX.LTO.NO_OPTIONS_FOUND'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o foram encontradas Op\00E7\00F5es de Modelo.')
,p_version_scn=>2705329
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141480491946752083)
,p_name=>'APEX.LTO.SAVE'
,p_message_language=>'pt'
,p_message_text=>'Gravar'
,p_version_scn=>2705329
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141334242423752040)
,p_name=>'APEX.MAPS.CLEAR_CIRCLE'
,p_message_language=>'pt'
,p_message_text=>unistr('Limpar C\00EDrculo')
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141336635691752040)
,p_name=>'APEX.MAPS.CUSTOM_STYLES_INVALID_JSON'
,p_message_language=>'pt'
,p_message_text=>unistr('Os Estilos Customizados n\00E3o s\00E3o JSON v\00E1lido.')
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141334566452752040)
,p_name=>'APEX.MAPS.DISTANCE_TOOL'
,p_message_language=>'pt'
,p_message_text=>unistr('Ferramenta de Dist\00E2ncia')
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141334358467752040)
,p_name=>'APEX.MAPS.DRAW_CIRCLE'
,p_message_language=>'pt'
,p_message_text=>unistr('Desenhar C\00EDrculo')
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141314169840752034)
,p_name=>'APEX.MAPS.FIND_MY_LOCATION'
,p_message_language=>'pt'
,p_message_text=>unistr('Localiza\00E7\00E3o Atual')
,p_is_js_message=>true
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141320566300752036)
,p_name=>'APEX.MAPS.INIT_POINT_COORDINATES_INVALID'
,p_message_language=>'pt'
,p_message_text=>unistr('As coordenadas da posi\00E7\00E3o inicial s\00E3o inv\00E1lidas.')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141309556520752032)
,p_name=>'APEX.MAPS.INIT_POINT_GEOMETRY_REQUIRED'
,p_message_language=>'pt'
,p_message_text=>unistr('A posi\00E7\00E3o inicial deve ser uma geometria de pontos.')
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141318103271752035)
,p_name=>'APEX.MAPS.KM'
,p_message_language=>'pt'
,p_message_text=>'km'
,p_is_js_message=>true
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141313349734752033)
,p_name=>'APEX.MAPS.LAYER'
,p_message_language=>'pt'
,p_message_text=>'Camada'
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141483769276752084)
,p_name=>'APEX.MAPS.LAYER_NAME'
,p_message_language=>'pt'
,p_message_text=>'Camada: %0'
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141332597284752039)
,p_name=>'APEX.MAPS.MAP'
,p_message_language=>'pt'
,p_message_text=>'Mapa'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141302286389752030)
,p_name=>'APEX.MAPS.MAP_MESSAGES'
,p_message_language=>'pt'
,p_message_text=>'Mensagens'
,p_is_js_message=>true
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141318362999752035)
,p_name=>'APEX.MAPS.MILES'
,p_message_language=>'pt'
,p_message_text=>'milhas'
,p_is_js_message=>true
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141482752177752083)
,p_name=>'APEX.MAPS.MORE_DATA_FOUND'
,p_message_language=>'pt'
,p_message_text=>unistr('Os dados cont\00EAm mais de %0 linhas, o que excede o m\00E1ximo permitido.')
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141312627946752033)
,p_name=>'APEX.MAPS.ORACLE_MAP_COPYRIGHT'
,p_message_language=>'pt'
,p_message_text=>'&copy; 2022 Oracle Corporation &nbsp;&nbsp; <a rel="noopener noreferrer" target="_blank" href="https://elocation.oracle.com/elocation/legal.html">Termos</a> &nbsp;&nbsp; Dados do mapa &copy; 2021 AQUI'
,p_is_js_message=>true
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141309277005752032)
,p_name=>'APEX.MAPS.ORACLE_SDO_GEOMETRY_NOT_AVAILABLE'
,p_message_language=>'pt'
,p_message_text=>unistr('O tipo de dados SDO_GEOMETRY n\00E3o est\00E1 dispon\00EDvel nesta base de dados.')
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141312725340752033)
,p_name=>'APEX.MAPS.OSM_MAP_COPYRIGHT'
,p_message_language=>'pt'
,p_message_text=>'<a rel="noopener noreferrer" target="_blank" href="http://openmaptiles.org"> &copy; OpenMapTiles </a> &nbsp; <a rel="noopener noreferrer" target="_blank" href="https://www.openstreetmap.org/copyright"> &copy; Contribuidores de OpenStreetMap </a>'
,p_is_js_message=>true
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141337307530752041)
,p_name=>'APEX.MAPS.OSM_VECTOR_MAP_COPYRIGHT'
,p_message_language=>'pt'
,p_message_text=>'<a rel="noopener noreferrer" target="blank" href="https://www.maptiler.com/copyright"> &copy; MapTiler</a> &nbsp; <a rel="noopener noreferrer" target="_blank" href="https://www.openstreetmap.org/copyright"> &copy; Contribuidores de OpenStreetMap </a>'
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141313577570752034)
,p_name=>'APEX.MAPS.POINTS'
,p_message_language=>'pt'
,p_message_text=>'Pontos'
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141483867042752084)
,p_name=>'APEX.MAPS.POINTS_COUNT'
,p_message_language=>'pt'
,p_message_text=>'%0 Pontos'
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141334423247752040)
,p_name=>'APEX.MAPS.RECTANGLE_ZOOM'
,p_message_language=>'pt'
,p_message_text=>unistr('Zoom de Ret\00E2ngulo')
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141334124535752040)
,p_name=>'APEX.MAPS.REMOVE_MESSAGE'
,p_message_language=>'pt'
,p_message_text=>'Retirar'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141313956204752034)
,p_name=>'APEX.MAPS.RESET_BEARING_TO_NORTH'
,p_message_language=>'pt'
,p_message_text=>unistr('Redefinir Orienta\00E7\00E3o para Norte')
,p_is_js_message=>true
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141428721657752067)
,p_name=>'APEX.MAPS.TOGGLE_2D_MODE'
,p_message_language=>'pt'
,p_message_text=>'Alternar para modo 2D'
,p_is_js_message=>true
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141428819470752068)
,p_name=>'APEX.MAPS.TOGGLE_3D_MODE'
,p_message_language=>'pt'
,p_message_text=>'Alternar para modo 3D'
,p_is_js_message=>true
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141334012205752040)
,p_name=>'APEX.MAPS.TOGGLE_COPYRIGHT'
,p_message_language=>'pt'
,p_message_text=>'Alternar Aviso de Direitos de Autor'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141334647337752040)
,p_name=>'APEX.MAPS.TOTAL_DISTANCE'
,p_message_language=>'pt'
,p_message_text=>unistr('Dist\00E2ncia Total')
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141313691399752034)
,p_name=>'APEX.MAPS.ZOOM_IN'
,p_message_language=>'pt'
,p_message_text=>'Aproximar'
,p_is_js_message=>true
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141313896615752034)
,p_name=>'APEX.MAPS.ZOOM_OUT'
,p_message_language=>'pt'
,p_message_text=>'Afastar'
,p_is_js_message=>true
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141478363798752082)
,p_name=>'APEX.MARKDOWN.BOLD'
,p_message_language=>'pt'
,p_message_text=>'Negrito'
,p_is_js_message=>true
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141479288672752082)
,p_name=>'APEX.MARKDOWN.IMAGE'
,p_message_language=>'pt'
,p_message_text=>'Imagem'
,p_is_js_message=>true
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141478802969752082)
,p_name=>'APEX.MARKDOWN.INLINE_CODE'
,p_message_language=>'pt'
,p_message_text=>unistr('C\00F3digo Inline')
,p_is_js_message=>true
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141491592997752086)
,p_name=>'APEX.MARKDOWN.INSERT_IMAGE'
,p_message_language=>'pt'
,p_message_text=>'Inserir Imagem'
,p_is_js_message=>true
,p_version_scn=>2705332
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141491648681752086)
,p_name=>'APEX.MARKDOWN.INSERT_LINK'
,p_message_language=>'pt'
,p_message_text=>unistr('Inserir Liga\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705332
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141478491229752082)
,p_name=>'APEX.MARKDOWN.ITALIC'
,p_message_language=>'pt'
,p_message_text=>unistr('It\00E1lico')
,p_is_js_message=>true
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141492242349752086)
,p_name=>'APEX.MARKDOWN.LINK'
,p_message_language=>'pt'
,p_message_text=>'Ligar'
,p_is_js_message=>true
,p_version_scn=>2705332
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141479100188752082)
,p_name=>'APEX.MARKDOWN.LIST'
,p_message_language=>'pt'
,p_message_text=>'Lista'
,p_is_js_message=>true
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141479008087752082)
,p_name=>'APEX.MARKDOWN.ORDERED_LIST'
,p_message_language=>'pt'
,p_message_text=>'Lista Ordenada'
,p_is_js_message=>true
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141478599283752082)
,p_name=>'APEX.MARKDOWN.PREVIEW'
,p_message_language=>'pt'
,p_message_text=>unistr('Pr\00E9-visualizar')
,p_is_js_message=>true
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141478624259752082)
,p_name=>'APEX.MARKDOWN.PREVIEW_EMPTY'
,p_message_language=>'pt'
,p_message_text=>unistr('Nada para Pr\00E9-Visualizar')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141478795862752082)
,p_name=>'APEX.MARKDOWN.STRIKETHROUGH'
,p_message_language=>'pt'
,p_message_text=>'Riscado'
,p_is_js_message=>true
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141478944353752082)
,p_name=>'APEX.MARKDOWN.UNORDERED_LIST'
,p_message_language=>'pt'
,p_message_text=>unistr('Lista N\00E3o Ordenada')
,p_is_js_message=>true
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141457865776752076)
,p_name=>'APEX.MENU.CURRENT_MENU'
,p_message_language=>'pt'
,p_message_text=>'atual'
,p_is_js_message=>true
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141514004315752093)
,p_name=>'APEX.MENU.OVERFLOW_LABEL'
,p_message_language=>'pt'
,p_message_text=>'Mais...'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141457707607752076)
,p_name=>'APEX.MENU.PROCESSING'
,p_message_language=>'pt'
,p_message_text=>'A carregar'
,p_is_js_message=>true
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141371944583752051)
,p_name=>'APEX.MENU.SPLIT_BUTTON'
,p_message_language=>'pt'
,p_message_text=>unistr('Bot\00E3o Dividir')
,p_is_js_message=>true
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141371848274752051)
,p_name=>'APEX.MENU.SPLIT_MENU'
,p_message_language=>'pt'
,p_message_text=>'Menu Dividir'
,p_is_js_message=>true
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141488858467752085)
,p_name=>'APEX.NOTIFICATION_MESSAGE_HEADING'
,p_message_language=>'pt'
,p_message_text=>unistr('Mensagem de Notifica\00E7\00E3o')
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141312978359752033)
,p_name=>'APEX.NO_DATA_FOUND_ENTITY'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o foi encontrado nenhum %0')
,p_is_js_message=>true
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141462818580752078)
,p_name=>'APEX.NUMBER_FIELD.VALUE_GREATER_MAX_VALUE'
,p_message_language=>'pt'
,p_message_text=>unistr('#LABEL# deve ser um n\00FAmero menor que ou igual a %0.')
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141462950858752078)
,p_name=>'APEX.NUMBER_FIELD.VALUE_INVALID'
,p_message_language=>'pt'
,p_message_text=>unistr('#LABEL# deve ser um n\00FAmero v\00E1lido.')
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141463061399752078)
,p_name=>'APEX.NUMBER_FIELD.VALUE_INVALID2'
,p_message_language=>'pt'
,p_message_text=>unistr('#LABEL# n\00E3o corresponde ao formato de n\00FAmero %0 (Exemplo: %1).')
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141462722476752078)
,p_name=>'APEX.NUMBER_FIELD.VALUE_LESS_MIN_VALUE'
,p_message_language=>'pt'
,p_message_text=>unistr('#LABEL# deve ser um n\00FAmero maior que ou igual a %0.')
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141462653892752077)
,p_name=>'APEX.NUMBER_FIELD.VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'pt'
,p_message_text=>unistr('#LABEL# deve ser um n\00FAmero entre %0 E %1.')
,p_is_js_message=>true
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141457981842752076)
,p_name=>'APEX.OPENS_IN_NEW_WINDOW_LOWER'
,p_message_language=>'pt'
,p_message_text=>unistr('\00E9 aberto numa nova janela')
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141407718536752061)
,p_name=>'APEX.PAGE.DUPLICATE_SUBMIT'
,p_message_language=>'pt'
,p_message_text=>unistr('Esta p\00E1gina j\00E1 foi submetida e n\00E3o pode ser submetida novamente.')
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141389103503752056)
,p_name=>'APEX.PAGE.NOT_FOUND'
,p_message_language=>'pt'
,p_message_text=>unistr('Aplica\00E7\00E3o "%0", P\00E1gina "%1", n\00E3o encontrada.')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141424628526752066)
,p_name=>'APEX.PAGE_ITEM_IS_REQUIRED'
,p_message_language=>'pt'
,p_message_text=>'#LABEL# deve ter um valor.'
,p_is_js_message=>true
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141315308737752034)
,p_name=>'APEX.PASSWORD.HIDE_PASSWORD'
,p_message_language=>'pt'
,p_message_text=>'Ocultar Senha'
,p_is_js_message=>true
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141315252916752034)
,p_name=>'APEX.PASSWORD.SHOW_PASSWORD'
,p_message_language=>'pt'
,p_message_text=>'Mostrar Senha'
,p_is_js_message=>true
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141362803904752048)
,p_name=>'APEX.POPUP.SEARCH'
,p_message_language=>'pt'
,p_message_text=>'Pesquisar'
,p_is_js_message=>true
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141476872008752082)
,p_name=>'APEX.POPUP_LOV.BUTTON_CLOSE'
,p_message_language=>'pt'
,p_message_text=>'Fechar'
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141476775024752082)
,p_name=>'APEX.POPUP_LOV.BUTTON_FIND'
,p_message_language=>'pt'
,p_message_text=>'Encontrar %0'
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141477053729752082)
,p_name=>'APEX.POPUP_LOV.BUTTON_NEXT'
,p_message_language=>'pt'
,p_message_text=>'Seguinte'
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141476914360752082)
,p_name=>'APEX.POPUP_LOV.BUTTON_PREV'
,p_message_language=>'pt'
,p_message_text=>'Anterior'
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141353681116752045)
,p_name=>'APEX.POPUP_LOV.FILTER_REQ'
,p_message_language=>'pt'
,p_message_text=>'Introduza um termo de pesquisa com, pelo menos, %0 caracteres.'
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141429973734752068)
,p_name=>'APEX.POPUP_LOV.ICON_TEXT'
,p_message_language=>'pt'
,p_message_text=>'Lista de Valores Sobreposta: %0'
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141353759008752045)
,p_name=>'APEX.POPUP_LOV.INITIAL_FILTER_REQ'
,p_message_language=>'pt'
,p_message_text=>'Introduza um termo de pesquisa.'
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141300721818752030)
,p_name=>'APEX.POPUP_LOV.LIST_OF_VALUES'
,p_message_language=>'pt'
,p_message_text=>'Lista de valores'
,p_is_js_message=>true
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141353516030752045)
,p_name=>'APEX.POPUP_LOV.NO_RESULTS'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o foram encontrados resultados.')
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141353453440752045)
,p_name=>'APEX.POPUP_LOV.REMOVE_VALUE'
,p_message_language=>'pt'
,p_message_text=>'Retirar %0'
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141450692613752074)
,p_name=>'APEX.POPUP_LOV.SEARCH'
,p_message_language=>'pt'
,p_message_text=>'Termo de Pesquisa'
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141476639871752082)
,p_name=>'APEX.POPUP_LOV.TITLE'
,p_message_language=>'pt'
,p_message_text=>'Pesquisar'
,p_is_js_message=>true
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141302816622752030)
,p_name=>'APEX.PRINT.DOCGEN_REQUIRED'
,p_message_language=>'pt'
,p_message_text=>'Requer %0.'
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141315145235752034)
,p_name=>'APEX.PRINT_REPORT.ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro durante a impress\00E3o do relat\00F3rio.')
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141325927632752037)
,p_name=>'APEX.PRINT_UTIL.UNABLE_TO_PRINT'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel imprimir o documento utilizando o servidor de impress\00E3o configurado.')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141348672035752044)
,p_name=>'APEX.PROCESS.INVOKE_API.PARAMETER_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro durante a avalia\00E7\00E3o do par\00E2metro %0 ao chamar %1. Consulte o di\00E1rio de erros para mais detalhes.')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141487383900752085)
,p_name=>'APEX.PROCESSING'
,p_message_language=>'pt'
,p_message_text=>'A processar'
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141346474250752043)
,p_name=>'APEX.PWA.DIALOG.HIDE.INSTRUCTIONS'
,p_message_language=>'pt'
,p_message_text=>'Anterior'
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141347584530752044)
,p_name=>'APEX.PWA.DIALOG.INTRO'
,p_message_language=>'pt'
,p_message_text=>unistr('Este website tem funcionalidade de aplica\00E7\00E3o. Instale-a no seu dispositivo para beneficiar da melhor experi\00EAncia poss\00EDvel.')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141348852842752044)
,p_name=>'APEX.PWA.DIALOG.SHOW.INSTRUCTIONS'
,p_message_language=>'pt'
,p_message_text=>'Seguinte'
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141350472239752044)
,p_name=>'APEX.PWA.DIALOG.TITLE'
,p_message_language=>'pt'
,p_message_text=>unistr('Instalar esta aplica\00E7\00E3o')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141335245807752040)
,p_name=>'APEX.PWA.INSTRUCTIONS'
,p_message_language=>'pt'
,p_message_text=>unistr('Aparentemente, o seu dispositivo ou browser n\00E3o suporta a instala\00E7\00E3o de Aplica\00E7\00F5es Web Progressivas, de momento.')
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141330362756752038)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP1'
,p_message_language=>'pt'
,p_message_text=>unistr('1. Toque no \00EDcone <strong>Partilhar</strong>')
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141330447490752038)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP2'
,p_message_language=>'pt'
,p_message_text=>unistr('2. Desloque-se para baixo e toque em <strong>Adicionar ao Ecr\00E3 Principal</strong>')
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141346859116752043)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP3'
,p_message_language=>'pt'
,p_message_text=>'3. Toque em <strong style="color:#007AE1;">Adicionar</strong> para confirmar'
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141345901303752043)
,p_name=>'APEX.PWA.OFFLINE.BODY'
,p_message_language=>'pt'
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
unistr('    <h1>N\00E3o \00E9 poss\00EDvel ligar</h1>'),
unistr('    <p>Poder\00E1 existir um problema na rede. Verifique a sua liga\00E7\00E3o e tente novamente.</p>'),
'    <button type="button">Repetir</button>',
'</main>',
'',
'<script>',
'    document.querySelector("button").addEventListener("click", () => {',
'        window.location.reload();',
'    });',
'</script>'))
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141345826698752043)
,p_name=>'APEX.PWA.OFFLINE.TITLE'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel ligar')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141392453637752057)
,p_name=>'APEX.PWA.PUSH.SUBSCRIPTION_FAILED'
,p_message_language=>'pt'
,p_message_text=>unistr('Este dispositivo n\00E3o conseguiu ativar as notifica\00E7\00F5es de push.')
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141397922584752058)
,p_name=>'APEX.QUICK_PICK.GROUP_LABEL'
,p_message_language=>'pt'
,p_message_text=>unistr('Escolhas R\00E1pidas para %0')
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141397839578752058)
,p_name=>'APEX.QUICK_PICK.LINK_ROLE'
,p_message_language=>'pt'
,p_message_text=>unistr('Liga\00E7\00E3o de Escolha R\00E1pida')
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141371601863752051)
,p_name=>'APEX.RADIO.VISUALLY_HIDDEN_RADIO'
,p_message_language=>'pt'
,p_message_text=>unistr('Bot\00E3o de r\00E1dio visualmente oculto')
,p_is_js_message=>true
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141315705043752034)
,p_name=>'APEX.RECORD_VIEW.TOOLBAR'
,p_message_language=>'pt'
,p_message_text=>unistr('Visualiza\00E7\00E3o de Linha \00DAnica')
,p_is_js_message=>true
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141498441547752088)
,p_name=>'APEX.REGION.CSSCALENDAR.ADD'
,p_message_language=>'pt'
,p_message_text=>'Acrescentar'
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141443744419752072)
,p_name=>'APEX.REGION.CSSCALENDAR.ALL_DAY'
,p_message_language=>'pt'
,p_message_text=>'Todo o Dia'
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141521371264752095)
,p_name=>'APEX.REGION.CSSCALENDAR.BUTTON.SENDEMAIL'
,p_message_language=>'pt'
,p_message_text=>'Enviar Convite'
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141521189104752095)
,p_name=>'APEX.REGION.CSSCALENDAR.CHOOSE_ACTION'
,p_message_language=>'pt'
,p_message_text=>unistr('Op\00E7\00F5es')
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141445573234752072)
,p_name=>'APEX.REGION.CSSCALENDAR.DAILY_ALLDAY'
,p_message_language=>'pt'
,p_message_text=>unistr('Visualiza\00E7\00E3o di\00E1ria para todo o dia ')
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141445394912752072)
,p_name=>'APEX.REGION.CSSCALENDAR.DAILY_TIME_SPECIFIC'
,p_message_language=>'pt'
,p_message_text=>unistr('Visualiza\00E7\00E3o di\00E1ria para dados com hora ')
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141489538334752085)
,p_name=>'APEX.REGION.CSSCALENDAR.DAY'
,p_message_language=>'pt'
,p_message_text=>'Dia'
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141484507360752084)
,p_name=>'APEX.REGION.CSSCALENDAR.DESCRIPTION'
,p_message_language=>'pt'
,p_message_text=>unistr('Descri\00E7\00E3o')
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141368037577752050)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.CSV'
,p_message_language=>'pt'
,p_message_text=>'CSV'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141367812352752050)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.ICALENDAR'
,p_message_language=>'pt'
,p_message_text=>'iCal'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141367768351752049)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.PDF'
,p_message_language=>'pt'
,p_message_text=>'PDF'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141367994109752050)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.XML'
,p_message_language=>'pt'
,p_message_text=>'XML'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141367452780752049)
,p_name=>'APEX.REGION.CSSCALENDAR.ENDDATE'
,p_message_language=>'pt'
,p_message_text=>'Data de Fim'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141367659316752049)
,p_name=>'APEX.REGION.CSSCALENDAR.EVENTNAME'
,p_message_language=>'pt'
,p_message_text=>'Nome do Evento'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141521220033752095)
,p_name=>'APEX.REGION.CSSCALENDAR.INVITATION'
,p_message_language=>'pt'
,p_message_text=>'Convite'
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141489672303752085)
,p_name=>'APEX.REGION.CSSCALENDAR.LIST'
,p_message_language=>'pt'
,p_message_text=>'Lista'
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141489340702752085)
,p_name=>'APEX.REGION.CSSCALENDAR.MONTH'
,p_message_language=>'pt'
,p_message_text=>unistr('M\00EAs')
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141491978293752086)
,p_name=>'APEX.REGION.CSSCALENDAR.NEXT'
,p_message_language=>'pt'
,p_message_text=>'Seguinte'
,p_version_scn=>2705332
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141505907565752090)
,p_name=>'APEX.REGION.CSSCALENDAR.NOEVENTS'
,p_message_language=>'pt'
,p_message_text=>'Sem Eventos'
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141521542589752095)
,p_name=>'APEX.REGION.CSSCALENDAR.OPTION.FORM'
,p_message_language=>'pt'
,p_message_text=>'Edite um Evento Existente.'
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141521413230752095)
,p_name=>'APEX.REGION.CSSCALENDAR.OPTION.SEND'
,p_message_language=>'pt'
,p_message_text=>'Envie um Convite por Email.'
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141492019296752086)
,p_name=>'APEX.REGION.CSSCALENDAR.PREVIOUS'
,p_message_language=>'pt'
,p_message_text=>'Anterior'
,p_version_scn=>2705332
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141499783908752088)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL'
,p_message_language=>'pt'
,p_message_text=>'Enviar Email'
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141499503578752088)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.BUTTON'
,p_message_language=>'pt'
,p_message_text=>'Enviar Email'
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141522192448752095)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.DIALOG.REQUIRED'
,p_message_language=>'pt'
,p_message_text=>unistr('Todos os campos s\00E3o obrigat\00F3rios.')
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141522087019752095)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.DIALOG.TITLE'
,p_message_language=>'pt'
,p_message_text=>'Enviar Convite'
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141521085680752095)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.SUBJECT'
,p_message_language=>'pt'
,p_message_text=>'Assunto'
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141499696985752088)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.TO'
,p_message_language=>'pt'
,p_message_text=>'Para'
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141367574374752049)
,p_name=>'APEX.REGION.CSSCALENDAR.STARTDATE'
,p_message_language=>'pt'
,p_message_text=>unistr('Data de In\00EDcio')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141497794331752088)
,p_name=>'APEX.REGION.CSSCALENDAR.TABLEFORM'
,p_message_language=>'pt'
,p_message_text=>unistr('Formul\00E1rio em %0')
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141445188887752072)
,p_name=>'APEX.REGION.CSSCALENDAR.TIME'
,p_message_language=>'pt'
,p_message_text=>'Hora'
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141492193240752086)
,p_name=>'APEX.REGION.CSSCALENDAR.TODAY'
,p_message_language=>'pt'
,p_message_text=>'Hoje'
,p_version_scn=>2705332
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141490141632752086)
,p_name=>'APEX.REGION.CSSCALENDAR.VIEW'
,p_message_language=>'pt'
,p_message_text=>'Visualizar'
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141489426181752085)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEK'
,p_message_language=>'pt'
,p_message_text=>'Semana'
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141445436556752072)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEKLY_ALLDAY'
,p_message_language=>'pt'
,p_message_text=>unistr('Visualiza\00E7\00E3o semanal para todo o dia')
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141445207623752072)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEKLY_TIME_SPECIFIC'
,p_message_language=>'pt'
,p_message_text=>unistr('Visualiza\00E7\00E3o semanal para dados com hora')
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141490030250752086)
,p_name=>'APEX.REGION.CSSCALENDAR.YEAR'
,p_message_language=>'pt'
,p_message_text=>'Ano'
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141489729387752085)
,p_name=>'APEX.REGION.JQM_COLUMN_TOGGLE.COLUMNS'
,p_message_language=>'pt'
,p_message_text=>'Colunas...'
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141489889544752086)
,p_name=>'APEX.REGION.JQM_COLUMN_TOGGLE.LOAD_MORE'
,p_message_language=>'pt'
,p_message_text=>'Carregar mais...'
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141419251250752065)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.BACK'
,p_message_language=>'pt'
,p_message_text=>'Anterior'
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141360724267752047)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.LOAD_MORE'
,p_message_language=>'pt'
,p_message_text=>'Carregar mais...'
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141363066759752048)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.SEARCH'
,p_message_language=>'pt'
,p_message_text=>'Pesquisar...'
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141489920781752086)
,p_name=>'APEX.REGION.JQM_REFLOW.LOAD_MORE'
,p_message_language=>'pt'
,p_message_text=>'Carregar mais...'
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141491832012752086)
,p_name=>'APEX.REGION.NOT_FOUND'
,p_message_language=>'pt'
,p_message_text=>unistr('ID da Regi\00E3o %0 n\00E3o encontrada.')
,p_version_scn=>2705332
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141362929858752048)
,p_name=>'APEX.REGION.NO_DATA_FOUND_MESSAGE'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o Foram Encontrados Dados')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141390462021752056)
,p_name=>'APEX.REGION.PAGINATION.RESET_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel redefinir a pagina\00E7\00E3o da regi\00E3o.')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141354148433752045)
,p_name=>'APEX.REGION.PAGINATION.UNHANDLED_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro ao definir a pagina\00E7\00E3o da regi\00E3o.')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141483939735752084)
,p_name=>'APEX.REGION.RESPONSIVE_TABLE.COLUMNS'
,p_message_language=>'pt'
,p_message_text=>'Colunas...'
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141338408760752041)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.LAZY_LOADING_INCOMPATIBLE'
,p_message_language=>'pt'
,p_message_text=>unistr('O carregamento em modo lazy \00E9 incompat\00EDvel com slots em %0, que \00E9 uma regi\00E3o \00FAnica (parcial). Dever\00E1 desativar o carregamento em modo lazy para esta regi\00E3o ou deslocar os componentes de slot para uma regi\00E3o diferente.')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141333766206752039)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.NO_GROUP_TEMPLATE'
,p_message_language=>'pt'
,p_message_text=>unistr('O Modelo de Grupo est\00E1 em falta no Componente de Modelo para %0.')
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141328711870752038)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.TOO_MANY_ROWS'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 \00E9 uma regi\00E3o \00FAnica (parcial) e devolveu v\00E1rias linhas.')
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141491797419752086)
,p_name=>'APEX.REGION.TYPE_NOT_SUPPORTED'
,p_message_language=>'pt'
,p_message_text=>unistr('O Tipo de Regi\00E3o %0 n\00E3o \00E9 suportado.')
,p_version_scn=>2705332
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141354050833752045)
,p_name=>'APEX.REGION.UNHANDLED_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro durante a renderiza\00E7\00E3o da regi\00E3o "#COMPONENT_NAME#".')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141424782296752066)
,p_name=>'APEX.REGION_COLUMN_IS_REQUIRED'
,p_message_language=>'pt'
,p_message_text=>'#COLUMN_HEADER# deve ter um valor.'
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141306397360752031)
,p_name=>'APEX.REPORT_QUERY.LAYOUT_REQUIRED'
,p_message_language=>'pt'
,p_message_text=>unistr('\00C9 necess\00E1rio especificar uma Disposi\00E7\00E3o de Relat\00F3rio.')
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141520627394752095)
,p_name=>'APEX.RICH_TEXT_EDITOR.ACCESSIBLE_LABEL'
,p_message_language=>'pt'
,p_message_text=>'%0, editor de RTF'
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141426887895752067)
,p_name=>'APEX.RICH_TEXT_EDITOR.MAXIMUM_LENGTH_EXCEEDED'
,p_message_language=>'pt'
,p_message_text=>unistr('A markup de HTML RTF excede o comprimento m\00E1ximo do item (real %0, %1 caracteres permitidos)')
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141336271193752040)
,p_name=>'APEX.RTE.READ_ONLY_RICH_TEXT_EDITOR'
,p_message_language=>'pt'
,p_message_text=>unistr('Editor de RTF S\00F3 de Leitura')
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141336195449752040)
,p_name=>'APEX.RTE.RICH_TEXT_EDITOR'
,p_message_language=>'pt'
,p_message_text=>'Editor de RTF'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141335941604752040)
,p_name=>'APEX.RTE.TOOLBAR_ALIGNMENT'
,p_message_language=>'pt'
,p_message_text=>'Alinhamento'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141336073595752040)
,p_name=>'APEX.RTE.TOOLBAR_EXTRAS'
,p_message_language=>'pt'
,p_message_text=>'Extras'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141335707690752040)
,p_name=>'APEX.RTE.TOOLBAR_FONT'
,p_message_language=>'pt'
,p_message_text=>'Tipo de Letra'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141335606666752040)
,p_name=>'APEX.RTE.TOOLBAR_FORMATTING'
,p_message_language=>'pt'
,p_message_text=>'Formatar'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141335806491752040)
,p_name=>'APEX.RTE.TOOLBAR_LISTS'
,p_message_language=>'pt'
,p_message_text=>'Listas'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141488997558752085)
,p_name=>'APEX.RV.DELETE'
,p_message_language=>'pt'
,p_message_text=>'Apagar'
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141481488289752083)
,p_name=>'APEX.RV.DUPLICATE'
,p_message_language=>'pt'
,p_message_text=>'Duplicar'
,p_is_js_message=>true
,p_version_scn=>2705329
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141479748653752083)
,p_name=>'APEX.RV.EXCLUDE_HIDDEN'
,p_message_language=>'pt'
,p_message_text=>'Colunas Apresentadas'
,p_is_js_message=>true
,p_version_scn=>2705329
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141479605877752082)
,p_name=>'APEX.RV.EXCLUDE_NULL'
,p_message_language=>'pt'
,p_message_text=>'Excluir Valores Nulos'
,p_is_js_message=>true
,p_version_scn=>2705329
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141489008024752085)
,p_name=>'APEX.RV.INSERT'
,p_message_language=>'pt'
,p_message_text=>'Acrescentar'
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141443374358752072)
,p_name=>'APEX.RV.MOVE_DOWN'
,p_message_language=>'pt'
,p_message_text=>'Deslocar para Baixo'
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141443434384752072)
,p_name=>'APEX.RV.MOVE_UP'
,p_message_language=>'pt'
,p_message_text=>'Deslocar para Cima'
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141479494407752082)
,p_name=>'APEX.RV.NEXT_RECORD'
,p_message_language=>'pt'
,p_message_text=>'Seguinte'
,p_is_js_message=>true
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141480068311752083)
,p_name=>'APEX.RV.NOT_GROUPED_LABEL'
,p_message_language=>'pt'
,p_message_text=>'Outras Colunas'
,p_is_js_message=>true
,p_version_scn=>2705329
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141479551200752082)
,p_name=>'APEX.RV.PREV_RECORD'
,p_message_language=>'pt'
,p_message_text=>'Anterior'
,p_is_js_message=>true
,p_version_scn=>2705329
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141479806203752083)
,p_name=>'APEX.RV.REC_X'
,p_message_language=>'pt'
,p_message_text=>'Linha %0'
,p_is_js_message=>true
,p_version_scn=>2705329
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141479926115752083)
,p_name=>'APEX.RV.REC_XY'
,p_message_language=>'pt'
,p_message_text=>'Linha %0 de %1'
,p_is_js_message=>true
,p_version_scn=>2705329
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141481583506752083)
,p_name=>'APEX.RV.REFRESH'
,p_message_language=>'pt'
,p_message_text=>'Renovar'
,p_is_js_message=>true
,p_version_scn=>2705329
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141481634008752083)
,p_name=>'APEX.RV.REVERT'
,p_message_language=>'pt'
,p_message_text=>unistr('Reverter Altera\00E7\00F5es')
,p_is_js_message=>true
,p_version_scn=>2705329
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141479310325752082)
,p_name=>'APEX.RV.SETTINGS_MENU'
,p_message_language=>'pt'
,p_message_text=>unistr('Defini\00E7\00F5es')
,p_is_js_message=>true
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141438537215752070)
,p_name=>'APEX.SAMPLE_FORMAT'
,p_message_language=>'pt'
,p_message_text=>'Por exemplo, %0'
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141442837118752072)
,p_name=>'APEX.SAMPLE_FORMAT_SHORT'
,p_message_language=>'pt'
,p_message_text=>'Exemplo: %0'
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141355553498752046)
,p_name=>'APEX.SEARCH.1_RESULT_FOUND'
,p_message_language=>'pt'
,p_message_text=>'1 resultado'
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141352695773752045)
,p_name=>'APEX.SEARCH.N_RESULTS_FOUND'
,p_message_language=>'pt'
,p_message_text=>'%0 resultados'
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141404408542752060)
,p_name=>'APEX.SEARCH.PAGINATION'
,p_message_language=>'pt'
,p_message_text=>unistr('Pagina\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141404592853752060)
,p_name=>'APEX.SEARCH.RESULTS_X_TO_Y'
,p_message_language=>'pt'
,p_message_text=>'Resultados %0 para %1'
,p_is_js_message=>true
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141300278821752030)
,p_name=>'APEX.SESSION.ALERT.CREATE_NEW'
,p_message_language=>'pt'
,p_message_text=>unistr('Entrar Novamente em Sess\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141300112019752030)
,p_name=>'APEX.SESSION.ALERT.EXPIRED'
,p_message_language=>'pt'
,p_message_text=>unistr('A sua sess\00E3o terminou')
,p_is_js_message=>true
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141300348055752030)
,p_name=>'APEX.SESSION.ALERT.EXTEND'
,p_message_language=>'pt'
,p_message_text=>'Prolongar'
,p_is_js_message=>true
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141299973535752030)
,p_name=>'APEX.SESSION.ALERT.IDLE_WARN'
,p_message_language=>'pt'
,p_message_text=>unistr('A sua sess\00E3o vai terminar \00E0s %0. Pretende prolong\00E1-la?')
,p_is_js_message=>true
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141300037865752030)
,p_name=>'APEX.SESSION.ALERT.MAX_WARN'
,p_message_language=>'pt'
,p_message_text=>unistr('A sua sess\00E3o vai terminar \00E0s %0 e n\00E3o pode ser prolongada. Grave o trabalho agora para evitar perder dados')
,p_is_js_message=>true
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141499353595752088)
,p_name=>'APEX.SESSION.DB_SESSION_CLEANUP.UNHANDLED_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro ao processar o c\00F3digo de limpeza da sess\00E3o da base de dados.')
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141389058529752056)
,p_name=>'APEX.SESSION.DB_SESSION_INIT.UNHANDLED_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro ao processar o c\00F3digo de configura\00E7\00E3o da sess\00E3o da base de dados.')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141359406922752047)
,p_name=>'APEX.SESSION.EXPIRED'
,p_message_language=>'pt'
,p_message_text=>unistr('A sua sess\00E3o terminou.')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141498567300752088)
,p_name=>'APEX.SESSION.EXPIRED.CLOSE_DIALOG'
,p_message_language=>'pt'
,p_message_text=>unistr('Feche esta caixa de di\00E1logo e prima o bot\00E3o de recarregamento do seu browser para obter uma nova sess\00E3o.')
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141517467460752094)
,p_name=>'APEX.SESSION.EXPIRED.NEW_SESSION'
,p_message_language=>'pt'
,p_message_text=>unistr('Clique em <a href="%0">Iniciar sess\00E3o</a> novamente para criar uma nova sess\00E3o.')
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141401787824752060)
,p_name=>'APEX.SESSION.NOT_VALID'
,p_message_language=>'pt'
,p_message_text=>unistr('Sess\00E3o N\00E3o V\00E1lida')
,p_version_scn=>2705313
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141444815128752072)
,p_name=>'APEX.SESSION.RAS.NO_DYNAMIC_ROLES'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o foi poss\00EDvel ativar nenhum Perfil de Grupo Din\00E2mico na sess\00E3o de Real Application Security para o utilizador "%0".')
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141386923128752055)
,p_name=>'APEX.SESSION.UNHANDLED_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('ERR-99900 N\00E3o foi poss\00EDvel criar a ID da sess\00E3o exclusiva: %0')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141316092637752034)
,p_name=>'APEX.SESSION_STATE.CLOB_NOT_ALLOWED'
,p_message_language=>'pt'
,p_message_text=>unistr('O tipo de dados de estado da sess\00E3o CLOB n\00E3o \00E9 permitido para o item %0.')
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141335485114752040)
,p_name=>'APEX.SESSION_STATE.CLOB_SUBSTITUTION_NOT_ALLOWED'
,p_message_language=>'pt'
,p_message_text=>unistr('A substitui\00E7\00E3o de itens do tipo de dados de estado da sess\00E3o CLOB n\00E3o \00E9 suportada.')
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141404256752752060)
,p_name=>'APEX.SESSION_STATE.ITEM_VALUE_PROTECTION'
,p_message_language=>'pt'
,p_message_text=>unistr('Viola\00E7\00E3o de prote\00E7\00E3o do estado da sess\00E3o: Isto pode ser causado pela altera\00E7\00E3o manual do item de p\00E1gina protegido %0. Se n\00E3o tiver a certeza sobre a causa deste erro, contacte o administrador da aplica\00E7\00E3o para obter assist\00EAncia.')
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141525428484752096)
,p_name=>'APEX.SESSION_STATE.PAGE_PROTECTION'
,p_message_language=>'pt'
,p_message_text=>unistr('Viola\00E7\00E3o de prote\00E7\00E3o da p\00E1gina: Isto pode ser causado pela submiss\00E3o de uma p\00E1gina cujo carregamento ainda n\00E3o terminou ou pela altera\00E7\00E3o manual de itens da p\00E1gina protegidos. Para obter mais assist\00EAncia, contacte o administrador da aplica\00E7\00E3o.')
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141524528563752096)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.NO_SPECIAL_CHAR'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 cont\00E9m um dos seguintes caracteres inv\00E1lidos &<>"/;,*|=% ou --')
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141524664206752096)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.NO_SPECIAL_CHAR_NL'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 cont\00E9m um dos seguintes caracteres inv\00E1lidos &<>"/;,*|=% ou -- ou nova linha.')
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141524395690752096)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.US_ONLY'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 cont\00E9m caracteres especiais. S\00F3 s\00E3o permitidos os caracteres a-Z, 0-9 e espa\00E7os.')
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141524452592752096)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 cont\00E9m <, > ou " que s\00E3o caracteres inv\00E1lidos.')
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141361875219752048)
,p_name=>'APEX.SESSION_STATE.SSP_CHECKSUM_MISSING'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o foi fornecida uma soma de verifica\00E7\00E3o para mostrar o processamento de uma p\00E1gina que requer uma soma de verifica\00E7\00E3o quando um ou mais valores de pedido, limpeza da cache ou argumento s\00E3o transmitidos como par\00E2metros.')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141399128034752059)
,p_name=>'APEX.SESSION_STATE.SSP_VIOLATION'
,p_message_language=>'pt'
,p_message_text=>unistr('Viola\00E7\00E3o de prote\00E7\00E3o do estado da sess\00E3o: Isto pode ser causado pela altera\00E7\00E3o manual de um URL que cont\00E9m uma soma de verifica\00E7\00E3o ou pela utiliza\00E7\00E3o de uma liga\00E7\00E3o com uma soma de verifica\00E7\00E3o incorreta ou em falta. Se n\00E3o tiver a certeza sobre a cau')
||unistr('sa deste erro, contacte o administrador da aplica\00E7\00E3o para obter assist\00EAncia.')
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141480794550752083)
,p_name=>'APEX.SET_HIGH_CONTRAST_MODE_OFF'
,p_message_language=>'pt'
,p_message_text=>'Desativar Modo de Contraste Alto'
,p_version_scn=>2705329
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141480818947752083)
,p_name=>'APEX.SET_HIGH_CONTRAST_MODE_ON'
,p_message_language=>'pt'
,p_message_text=>'Ativar Modo de Contraste Alto'
,p_version_scn=>2705329
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141345295440752043)
,p_name=>'APEX.SET_VALUE_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('A defini\00E7\00E3o da aplica\00E7\00E3o %0 n\00E3o pode ser atualizada uma vez que foi subscrita a partir de outra aplica\00E7\00E3o.')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141395585792752058)
,p_name=>'APEX.SHUTTLE.CONTROL_BOTTOM'
,p_message_language=>'pt'
,p_message_text=>'Inferior'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141395779189752058)
,p_name=>'APEX.SHUTTLE.CONTROL_DOWN'
,p_message_language=>'pt'
,p_message_text=>'Para Baixo'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141395895849752058)
,p_name=>'APEX.SHUTTLE.CONTROL_MOVE'
,p_message_language=>'pt'
,p_message_text=>'Deslocar'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141395928122752058)
,p_name=>'APEX.SHUTTLE.CONTROL_MOVE_ALL'
,p_message_language=>'pt'
,p_message_text=>'Deslocar Todos'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141396000492752058)
,p_name=>'APEX.SHUTTLE.CONTROL_REMOVE'
,p_message_language=>'pt'
,p_message_text=>'Retirar'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141396166196752058)
,p_name=>'APEX.SHUTTLE.CONTROL_REMOVE_ALL'
,p_message_language=>'pt'
,p_message_text=>'Retirar Todos'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141396201404752058)
,p_name=>'APEX.SHUTTLE.CONTROL_RESET'
,p_message_language=>'pt'
,p_message_text=>'Redefinir'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141395407835752058)
,p_name=>'APEX.SHUTTLE.CONTROL_TOP'
,p_message_language=>'pt'
,p_message_text=>'Superior'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141395695001752058)
,p_name=>'APEX.SHUTTLE.CONTROL_UP'
,p_message_language=>'pt'
,p_message_text=>'Para Cima'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141507210733752091)
,p_name=>'APEX.SINCE.SHORT.DAYS_AGO'
,p_message_language=>'pt'
,p_message_text=>'%0d'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141507908219752091)
,p_name=>'APEX.SINCE.SHORT.DAYS_FROM_NOW'
,p_message_language=>'pt'
,p_message_text=>'em %0d'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141507147226752091)
,p_name=>'APEX.SINCE.SHORT.HOURS_AGO'
,p_message_language=>'pt'
,p_message_text=>'%0h'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141508077147752091)
,p_name=>'APEX.SINCE.SHORT.HOURS_FROM_NOW'
,p_message_language=>'pt'
,p_message_text=>'em %0h'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141506943751752091)
,p_name=>'APEX.SINCE.SHORT.MINUTES_AGO'
,p_message_language=>'pt'
,p_message_text=>'%0m'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141508134592752091)
,p_name=>'APEX.SINCE.SHORT.MINUTES_FROM_NOW'
,p_message_language=>'pt'
,p_message_text=>'em %0m'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141507570893752091)
,p_name=>'APEX.SINCE.SHORT.MONTHS_AGO'
,p_message_language=>'pt'
,p_message_text=>'%0mo'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141507706615752091)
,p_name=>'APEX.SINCE.SHORT.MONTHS_FROM_NOW'
,p_message_language=>'pt'
,p_message_text=>'em %0mo'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141507086792752091)
,p_name=>'APEX.SINCE.SHORT.SECONDS_AGO'
,p_message_language=>'pt'
,p_message_text=>'%0s'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141507898698752091)
,p_name=>'APEX.SINCE.SHORT.SECONDS_FROM_NOW'
,p_message_language=>'pt'
,p_message_text=>'em %0s'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141507391038752091)
,p_name=>'APEX.SINCE.SHORT.WEEKS_AGO'
,p_message_language=>'pt'
,p_message_text=>'%0w'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141508249480752091)
,p_name=>'APEX.SINCE.SHORT.WEEKS_FROM_NOW'
,p_message_language=>'pt'
,p_message_text=>'em %0w'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141507492826752091)
,p_name=>'APEX.SINCE.SHORT.YEARS_AGO'
,p_message_language=>'pt'
,p_message_text=>'%0y'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141507675363752091)
,p_name=>'APEX.SINCE.SHORT.YEARS_FROM_NOW'
,p_message_language=>'pt'
,p_message_text=>'em %0y'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141308534700752032)
,p_name=>'APEX.SPATIAL.GEOMETRY.LINE'
,p_message_language=>'pt'
,p_message_text=>'[Linha]'
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141309192140752032)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTILINE'
,p_message_language=>'pt'
,p_message_text=>unistr('[V\00E1rias Linhas]')
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141308899069752032)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTIPOINT'
,p_message_language=>'pt'
,p_message_text=>unistr('[V\00E1rios Pontos]')
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141309317192752032)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTIPOLYGON'
,p_message_language=>'pt'
,p_message_text=>unistr('[V\00E1rios Pol\00EDgonos]')
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141309492782752032)
,p_name=>'APEX.SPATIAL.GEOMETRY.OTHER'
,p_message_language=>'pt'
,p_message_text=>'[Objeto de Geometria]'
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141308481769752032)
,p_name=>'APEX.SPATIAL.GEOMETRY.POINT'
,p_message_language=>'pt'
,p_message_text=>'[Ponto (%0,%1)]'
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141308726957752032)
,p_name=>'APEX.SPATIAL.GEOMETRY.POLYGON'
,p_message_language=>'pt'
,p_message_text=>unistr('[Pol\00EDgono]')
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141307969110752032)
,p_name=>'APEX.SPLITTER.COLLAPSED_REGION'
,p_message_language=>'pt'
,p_message_text=>unistr('Regi\00E3o contra\00EDda: %0')
,p_is_js_message=>true
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141423079893752066)
,p_name=>'APEX.SPLITTER.COLLAPSE_TEXT'
,p_message_language=>'pt'
,p_message_text=>'Contrair'
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141306921095752032)
,p_name=>'APEX.SPLITTER.HORIZ_CANNOT_LEFT_RIGHT'
,p_message_language=>'pt'
,p_message_text=>unistr('A divis\00E3o orientada de forma horizontal n\00E3o pode ser deslocada para a esquerda ou direita')
,p_is_js_message=>true
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141307136736752032)
,p_name=>'APEX.SPLITTER.MAX_SIZE_REACHED'
,p_message_language=>'pt'
,p_message_text=>unistr('Foi atingido o tamanho m\00E1ximo de %0px')
,p_is_js_message=>true
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141308186050752032)
,p_name=>'APEX.SPLITTER.MIN_SIZE_REACHED'
,p_message_language=>'pt'
,p_message_text=>unistr('Foi atingido o tamanho m\00EDnimo de %0px')
,p_is_js_message=>true
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141308026884752032)
,p_name=>'APEX.SPLITTER.REGION_IS_COLLAPSED'
,p_message_language=>'pt'
,p_message_text=>unistr('A regi\00E3o est\00E1 contra\00EDda')
,p_is_js_message=>true
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141307805237752032)
,p_name=>'APEX.SPLITTER.REGION_IS_RESTORED'
,p_message_language=>'pt'
,p_message_text=>unistr('A regi\00E3o est\00E1 reposta')
,p_is_js_message=>true
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141307501874752032)
,p_name=>'APEX.SPLITTER.RESIZED_TO'
,p_message_language=>'pt'
,p_message_text=>'Redimensionado como %0px'
,p_is_js_message=>true
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141307724278752032)
,p_name=>'APEX.SPLITTER.RESTORED_REGION'
,p_message_language=>'pt'
,p_message_text=>unistr('Regi\00E3o reposta: %0')
,p_is_js_message=>true
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141422942089752066)
,p_name=>'APEX.SPLITTER.RESTORE_TEXT'
,p_message_language=>'pt'
,p_message_text=>'Repor'
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141307001822752032)
,p_name=>'APEX.SPLITTER.VERTICAL_CANNOT_UP_DOWN'
,p_message_language=>'pt'
,p_message_text=>unistr('A divis\00E3o orientada de forma vertical n\00E3o pode ser deslocada para cima ou baixo')
,p_is_js_message=>true
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141472405171752080)
,p_name=>'APEX.STAR_RATING.CLEAR_RATING'
,p_message_language=>'pt'
,p_message_text=>unistr('Limpar Classifica\00E7\00E3o')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141462332106752077)
,p_name=>'APEX.STAR_RATING.INVALID_RATING_RANGE'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 n\00E3o est\00E1 no intervalo de classifica\00E7\00E3o v\00E1lido de 1 - %1')
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141462440717752077)
,p_name=>'APEX.STAR_RATING.IS_NOT_NUMERIC'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 n\00E3o \00E9 num\00E9rico')
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141458521123752076)
,p_name=>'APEX.SUCCESS_MESSAGE_HEADING'
,p_message_language=>'pt'
,p_message_text=>unistr('Mensagem de \00CAxito')
,p_is_js_message=>true
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141520338011752095)
,p_name=>'APEX.TABS.NEXT'
,p_message_language=>'pt'
,p_message_text=>'Seguinte'
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141520224810752095)
,p_name=>'APEX.TABS.PREVIOUS'
,p_message_language=>'pt'
,p_message_text=>'Anterior'
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141430449437752068)
,p_name=>'APEX.TASK.ACTION.DATA_NOT_FOUND'
,p_message_language=>'pt'
,p_message_text=>unistr('O sistema de registo(s) associado a esta inst\00E2ncia de tarefa n\00E3o foi encontrado')
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141438785041752070)
,p_name=>'APEX.TASK.ACTION.ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('Falha na execu\00E7\00E3o da a\00E7\00E3o de tarefa %0: a tarefa foi definida para estado com erros. Verifique o c\00F3digo de a\00E7\00E3o da tarefa')
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141318917361752035)
,p_name=>'APEX.TASK.ADD_COMMENT_NOT_AUTHORIZED'
,p_message_language=>'pt'
,p_message_text=>unistr('Acrescentar Coment\00E1rio: N\00E3o autorizado')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141318240055752035)
,p_name=>'APEX.TASK.ALREADY_ASSIGNED'
,p_message_language=>'pt'
,p_message_text=>unistr('Tarefa j\00E1 atribu\00EDda')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141311648920752033)
,p_name=>'APEX.TASK.ASSIGNED_TO_USER'
,p_message_language=>'pt'
,p_message_text=>unistr('Atribu\00EDdo a %0')
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141317938537752035)
,p_name=>'APEX.TASK.CANCEL_TASK_NOT_AUTHORIZED'
,p_message_language=>'pt'
,p_message_text=>unistr('Cancelar Tarefa: N\00E3o autorizado')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141333575648752039)
,p_name=>'APEX.TASK.CANNOT_REMOVE_OWNER'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel retirar o atual propriet\00E1rio desta tarefa. Delegue a tarefa para outro participante antes de repetir esta opera\00E7\00E3o.')
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141317570866752035)
,p_name=>'APEX.TASK.CLAIM_TASK_NOT_AUTHORIZED'
,p_message_language=>'pt'
,p_message_text=>unistr('Reclamar Tarefa: N\00E3o autorizado')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141317605123752035)
,p_name=>'APEX.TASK.COMPLETE_TASK_NOT_AUTHORIZED'
,p_message_language=>'pt'
,p_message_text=>unistr('Concluir Tarefa: N\00E3o autorizado')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141317702908752035)
,p_name=>'APEX.TASK.DELEGATE_TASK_NOT_AUTHORIZED'
,p_message_language=>'pt'
,p_message_text=>unistr('Delegar Tarefa: N\00E3o autorizado')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141316116699752034)
,p_name=>'APEX.TASK.DUE_DATE_IN_PAST'
,p_message_language=>'pt'
,p_message_text=>unistr('A Data-Limite da tarefa n\00E3o pode j\00E1 ter decorrido.')
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141311434091752033)
,p_name=>'APEX.TASK.DUE_SINCE'
,p_message_language=>'pt'
,p_message_text=>'Limite %0'
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141311899153752033)
,p_name=>'APEX.TASK.EVENT.ACTION.ERROR_MESSAGE'
,p_message_language=>'pt'
,p_message_text=>unistr('Falha na A\00E7\00E3o da Tarefa %1. Mensagem de erro - %0')
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141311555779752033)
,p_name=>'APEX.TASK.EVENT.ACTION.FAILURE'
,p_message_language=>'pt'
,p_message_text=>'Com falha'
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141311114748752033)
,p_name=>'APEX.TASK.EVENT.ACTION.SUCCESS'
,p_message_language=>'pt'
,p_message_text=>unistr('Com \00CAxito')
,p_is_js_message=>true
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141311398157752033)
,p_name=>'APEX.TASK.EVENT.ACTION.SUCCESS_MESSAGE'
,p_message_language=>'pt'
,p_message_text=>unistr('A\00E7\00E3o %1 bem-sucedida com mensagem %0')
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141314668781752034)
,p_name=>'APEX.TASK.EVENT.BEFORE_EXPIRE'
,p_message_language=>'pt'
,p_message_text=>'Antes de Expirar'
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141340221490752041)
,p_name=>'APEX.TASK.EVENT.CANCEL'
,p_message_language=>'pt'
,p_message_text=>'Cancelar'
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141339782647752041)
,p_name=>'APEX.TASK.EVENT.CANCEL_MESSAGE'
,p_message_language=>'pt'
,p_message_text=>'Tarefa cancelada'
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141340378900752041)
,p_name=>'APEX.TASK.EVENT.CANCEL_NOT_ALLOWED'
,p_message_language=>'pt'
,p_message_text=>unistr('O participante n\00E3o pode cancelar a tarefa')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141339604048752041)
,p_name=>'APEX.TASK.EVENT.CLAIM'
,p_message_language=>'pt'
,p_message_text=>'Reclamar'
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141340032234752041)
,p_name=>'APEX.TASK.EVENT.CLAIM_ALREADY_CLAIMED'
,p_message_language=>'pt'
,p_message_text=>unistr('A tarefa j\00E1 foi reclamada por outro utilizador ou o participante n\00E3o tem o direito de reclamar esta tarefa')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141339891791752041)
,p_name=>'APEX.TASK.EVENT.CLAIM_MESSAGE'
,p_message_language=>'pt'
,p_message_text=>'Tarefa reclamada por %0'
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141440997074752071)
,p_name=>'APEX.TASK.EVENT.COMPLETE'
,p_message_language=>'pt'
,p_message_text=>unistr('Conclu\00EDda')
,p_version_scn=>2705320
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141339415377752041)
,p_name=>'APEX.TASK.EVENT.COMPLETE_MESSAGE'
,p_message_language=>'pt'
,p_message_text=>unistr('Tarefa conclu\00EDda com o resultado %0')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141340703949752042)
,p_name=>'APEX.TASK.EVENT.COMPLETE_NOT_ALLOWED'
,p_message_language=>'pt'
,p_message_text=>unistr('A Tarefa n\00E3o est\00E1 reservada ou o participante n\00E3o pode concluir a tarefa')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141301139852752030)
,p_name=>'APEX.TASK.EVENT.COMPLETE_NO_OUTCOME'
,p_message_language=>'pt'
,p_message_text=>unistr('Tarefa conclu\00EDda sem resultados')
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141441002151752071)
,p_name=>'APEX.TASK.EVENT.CREATE'
,p_message_language=>'pt'
,p_message_text=>'Criar'
,p_version_scn=>2705320
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141333981757752040)
,p_name=>'APEX.TASK.EVENT.CREATE_MESSAGE'
,p_message_language=>'pt'
,p_message_text=>'Tarefa criada com a ID %0'
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141441101069752071)
,p_name=>'APEX.TASK.EVENT.DELEGATE'
,p_message_language=>'pt'
,p_message_text=>'Delegar'
,p_version_scn=>2705320
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141339579610752041)
,p_name=>'APEX.TASK.EVENT.DELEGATE_MESSAGE'
,p_message_language=>'pt'
,p_message_text=>unistr('Tarefa delegada ao propriet\00E1rio potencial %0')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141340164776752041)
,p_name=>'APEX.TASK.EVENT.DELEGATE_NOT_ALLOWED'
,p_message_language=>'pt'
,p_message_text=>unistr('O participante n\00E3o tem direito ou o novo participante n\00E3o \00E9 um propriet\00E1rio potencial desta tarefa')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141313293224752033)
,p_name=>'APEX.TASK.EVENT.EXPIRE'
,p_message_language=>'pt'
,p_message_text=>'Expirar'
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141314301842752034)
,p_name=>'APEX.TASK.EVENT.EXPIRED_MESSAGE'
,p_message_language=>'pt'
,p_message_text=>'Tarefa expirada.'
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141441265581752071)
,p_name=>'APEX.TASK.EVENT.FAIL'
,p_message_language=>'pt'
,p_message_text=>unistr('Sem Aprova\00E7\00E3o')
,p_version_scn=>2705320
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141309977481752032)
,p_name=>'APEX.TASK.EVENT.INFO_REQUEST.NOT_ALLOWED'
,p_message_language=>'pt'
,p_message_text=>unistr('A Tarefa n\00E3o foi atribu\00EDda ou o participante n\00E3o tem permiss\00E3o para pedir informa\00E7\00F5es sobre a tarefa')
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141310191732752033)
,p_name=>'APEX.TASK.EVENT.INFO_SUBMIT.NOT_ALLOWED'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o foram pedidas informa\00E7\00F5es para a tarefa ou o participante n\00E3o tem permiss\00F5es para submeter informa\00E7\00F5es para a tarefa.')
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141313701453752034)
,p_name=>'APEX.TASK.EVENT.MAXRENEW_EXPIRED_MESSAGE'
,p_message_language=>'pt'
,p_message_text=>unistr('Foi atingido o n\00FAmero m\00E1ximo de renova\00E7\00F5es de %0 da tarefa de expira\00E7\00E3o.')
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141341061960752042)
,p_name=>'APEX.TASK.EVENT.NOT_ALLOWED_BUSINESS_ADMIN'
,p_message_language=>'pt'
,p_message_text=>unistr('A tarefa n\00E3o est\00E1 no estado correto ou o participante n\00E3o \00E9 um administrador de atividade para esta tarefa')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141341120981752042)
,p_name=>'APEX.TASK.EVENT.NOT_APPLICABLE'
,p_message_language=>'pt'
,p_message_text=>unistr('A opera\00E7\00E3o %0 \00E9 desconhecida ou n\00E3o \00E9 aplic\00E1vel para esta tarefa')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141441323480752071)
,p_name=>'APEX.TASK.EVENT.RELEASE'
,p_message_language=>'pt'
,p_message_text=>unistr('Liberta\00E7\00E3o')
,p_version_scn=>2705320
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141427063922752067)
,p_name=>'APEX.TASK.EVENT.RELEASE_MESSAGE'
,p_message_language=>'pt'
,p_message_text=>'Tarefa desbloqueada. Pode ser agora reclamada por outros.'
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141319930048752035)
,p_name=>'APEX.TASK.EVENT.RELEASE_NOT_ALLOWED'
,p_message_language=>'pt'
,p_message_text=>unistr('A liberta\00E7\00E3o da tarefa n\00E3o \00E9 permitida: o utilizador n\00E3o \00E9 o propriet\00E1rio da tarefa')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141336902425752040)
,p_name=>'APEX.TASK.EVENT.REMOVE_OWNER'
,p_message_language=>'pt'
,p_message_text=>unistr('Retirar Propriet\00E1rio')
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141337158533752040)
,p_name=>'APEX.TASK.EVENT.REMOVE_OWNER_MESSAGE'
,p_message_language=>'pt'
,p_message_text=>'Participante %0 retirado da tarefa'
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141314581220752034)
,p_name=>'APEX.TASK.EVENT.RENEW'
,p_message_language=>'pt'
,p_message_text=>'Renovar'
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141313472595752034)
,p_name=>'APEX.TASK.EVENT.RENEW_EXPIRED_MESSAGE'
,p_message_language=>'pt'
,p_message_text=>unistr('Tarefa renovada com a ID %0. O n\00FAmero m\00E1ximo de renova\00E7\00F5es restantes antes da expira\00E7\00E3o \00E9 %1.')
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141314440160752034)
,p_name=>'APEX.TASK.EVENT.RENEW_MESSAGE'
,p_message_language=>'pt'
,p_message_text=>'ID da tarefa %0 renovada com a ID da tarefa %1'
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141310489707752033)
,p_name=>'APEX.TASK.EVENT.REQUEST_INFO'
,p_message_language=>'pt'
,p_message_text=>unistr('Pedir Informa\00E7\00F5es')
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141310335304752033)
,p_name=>'APEX.TASK.EVENT.REQUEST_INFO_MESSAGE'
,p_message_language=>'pt'
,p_message_text=>unistr('Pedido de mais informa\00E7\00F5es: %1 efetuado a %0')
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141308252630752032)
,p_name=>'APEX.TASK.EVENT.SET_INITIATOR_CAN_COMPLETE_MESSAGE'
,p_message_language=>'pt'
,p_message_text=>'Definir Iniciador Pode Concluir para %0'
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141310534726752033)
,p_name=>'APEX.TASK.EVENT.SUBMIT_INFO'
,p_message_language=>'pt'
,p_message_text=>unistr('Submeter Informa\00E7\00F5es')
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141310254065752033)
,p_name=>'APEX.TASK.EVENT.SUBMIT_INFO_MESSAGE'
,p_message_language=>'pt'
,p_message_text=>unistr('Informa\00E7\00F5es pedidas submetidas a %0: %1')
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141441449228752071)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT'
,p_message_language=>'pt'
,p_message_text=>unistr('Atualizar Coment\00E1rio')
,p_version_scn=>2705320
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141337989094752041)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT_MESSAGE'
,p_message_language=>'pt'
,p_message_text=>unistr('Acrescentar coment\00E1rio: %0')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141340853732752042)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT_NOT_ALLOWED'
,p_message_language=>'pt'
,p_message_text=>unistr('O estado da tarefa n\00E3o permite coment\00E1rios')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141348122966752044)
,p_name=>'APEX.TASK.EVENT.UPDATE_DUE_DATE_MESSAGE'
,p_message_language=>'pt'
,p_message_text=>'Definir data-limite da tarefa para %0'
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141306290365752031)
,p_name=>'APEX.TASK.EVENT.UPDATE_DUE_ON'
,p_message_language=>'pt'
,p_message_text=>'Atualizar Data-Limite'
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141441551598752071)
,p_name=>'APEX.TASK.EVENT.UPDATE_OWNER'
,p_message_language=>'pt'
,p_message_text=>unistr('Atualizar Propriet\00E1rio')
,p_version_scn=>2705322
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141339258195752041)
,p_name=>'APEX.TASK.EVENT.UPDATE_OWNER_MESSAGE'
,p_message_language=>'pt'
,p_message_text=>unistr('Acrescentar o propriet\00E1rio potencial %0 aos participantes da tarefa')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141338305809752041)
,p_name=>'APEX.TASK.EVENT.UPDATE_PARAM'
,p_message_language=>'pt'
,p_message_text=>unistr('Atualizar Par\00E2metros')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141441645122752071)
,p_name=>'APEX.TASK.EVENT.UPDATE_PRIORITY'
,p_message_language=>'pt'
,p_message_text=>'Atualizar Prioridade'
,p_version_scn=>2705322
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141339921368752041)
,p_name=>'APEX.TASK.EVENT.UPDATE_PRIORITY_MESSAGE'
,p_message_language=>'pt'
,p_message_text=>'Definir prioridade da tarefa como %0'
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141337280652752041)
,p_name=>'APEX.TASK.EVENT.UPD_PARAMETER_MESSAGE'
,p_message_language=>'pt'
,p_message_text=>unistr('Par\00E2metro "%0" atualizado de "%1" para "%2".')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141320782535752036)
,p_name=>'APEX.TASK.EVENT.WF_CANCEL_MESSAGE'
,p_message_language=>'pt'
,p_message_text=>unistr('Tarefa cancelada uma vez que a inst\00E2ncia do fluxo de trabalho correspondente foi terminada.')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141317813757752035)
,p_name=>'APEX.TASK.FORWARD_TASK_NOT_AUTHORIZED'
,p_message_language=>'pt'
,p_message_text=>unistr('Reencaminhar Tarefa: N\00E3o autorizado')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141311259896752033)
,p_name=>'APEX.TASK.INITIATED_BY_USER_SINCE'
,p_message_language=>'pt'
,p_message_text=>'Iniciado por %0 %1'
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141320181383752035)
,p_name=>'APEX.TASK.INTERNAL_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('Ocorr\00EAncia de erro interno inesperado')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141318464953752035)
,p_name=>'APEX.TASK.NOT_APPLICABLE'
,p_message_language=>'pt'
,p_message_text=>unistr('Opera\00E7\00E3o de tarefa n\00E3o aplic\00E1vel')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141344001607752042)
,p_name=>'APEX.TASK.NO_POTENTIAL_OWNER'
,p_message_language=>'pt'
,p_message_text=>unistr('Este potencial propriet\00E1rio n\00E3o existe.')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141319771751752035)
,p_name=>'APEX.TASK.OUTCOME.APPROVED'
,p_message_language=>'pt'
,p_message_text=>'Aprovada'
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141319894919752035)
,p_name=>'APEX.TASK.OUTCOME.REJECTED'
,p_message_language=>'pt'
,p_message_text=>'Rejeitada'
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141301273218752030)
,p_name=>'APEX.TASK.OUTCOME_MISSING'
,p_message_language=>'pt'
,p_message_text=>unistr('A conclus\00E3o da tarefa requer um resultado')
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141301479924752030)
,p_name=>'APEX.TASK.OUTCOME_NOT_ALLOWED'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o \00E9 permitido que a tarefa tenha um resultado')
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141337022453752040)
,p_name=>'APEX.TASK.PARAM_NOT_UPDATABLE'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel atualizar o par\00E2metro %0.')
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141333366405752039)
,p_name=>'APEX.TASK.PARTICIPANT_EXISTS'
,p_message_language=>'pt'
,p_message_text=>unistr('O participante j\00E1 existe para esta inst\00E2ncia de tarefa.')
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141434869384752069)
,p_name=>'APEX.TASK.PRIORITY.1'
,p_message_language=>'pt'
,p_message_text=>'Urgente'
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141311962384752033)
,p_name=>'APEX.TASK.PRIORITY.1.DESCRIPTION'
,p_message_language=>'pt'
,p_message_text=>'Urgente'
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141434743478752069)
,p_name=>'APEX.TASK.PRIORITY.2'
,p_message_language=>'pt'
,p_message_text=>unistr('M\00E1ximo')
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141312027105752033)
,p_name=>'APEX.TASK.PRIORITY.2.DESCRIPTION'
,p_message_language=>'pt'
,p_message_text=>'Prioridade alta'
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141434619611752069)
,p_name=>'APEX.TASK.PRIORITY.3'
,p_message_language=>'pt'
,p_message_text=>'Meio'
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141312160642752033)
,p_name=>'APEX.TASK.PRIORITY.3.DESCRIPTION'
,p_message_language=>'pt'
,p_message_text=>unistr('Prioridade m\00E9dia')
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141434535439752069)
,p_name=>'APEX.TASK.PRIORITY.4'
,p_message_language=>'pt'
,p_message_text=>unistr('M\00EDnimo')
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141312223174752033)
,p_name=>'APEX.TASK.PRIORITY.4.DESCRIPTION'
,p_message_language=>'pt'
,p_message_text=>'Prioridade baixa'
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141434498935752069)
,p_name=>'APEX.TASK.PRIORITY.5'
,p_message_language=>'pt'
,p_message_text=>unistr('M\00EDnima')
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141312340415752033)
,p_name=>'APEX.TASK.PRIORITY.5.DESCRIPTION'
,p_message_language=>'pt'
,p_message_text=>unistr('Prioridade m\00EDnima')
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141318044260752035)
,p_name=>'APEX.TASK.SET_PRIORITY_NOT_AUTHORIZED'
,p_message_language=>'pt'
,p_message_text=>unistr('Definir Prioridade da Tarefa: N\00E3o autorizado')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141319243955752035)
,p_name=>'APEX.TASK.STATE.ASSIGNED'
,p_message_language=>'pt'
,p_message_text=>unistr('Atribu\00EDda')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141319671709752035)
,p_name=>'APEX.TASK.STATE.CANCELLED'
,p_message_language=>'pt'
,p_message_text=>'Cancelada'
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141319337357752035)
,p_name=>'APEX.TASK.STATE.COMPLETED'
,p_message_language=>'pt'
,p_message_text=>unistr('Conclu\00EDda')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141319508705752035)
,p_name=>'APEX.TASK.STATE.ERRORED'
,p_message_language=>'pt'
,p_message_text=>'Com Erros'
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141313060707752033)
,p_name=>'APEX.TASK.STATE.EXPIRED'
,p_message_language=>'pt'
,p_message_text=>'Expirado'
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141319443680752035)
,p_name=>'APEX.TASK.STATE.FAILED'
,p_message_language=>'pt'
,p_message_text=>'Com falha'
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141309751800752032)
,p_name=>'APEX.TASK.STATE.INFO_REQUESTED'
,p_message_language=>'pt'
,p_message_text=>unistr('Informa\00E7\00F5es Pedidas')
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141319199372752035)
,p_name=>'APEX.TASK.STATE.UNASSIGNED'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o Atribu\00EDda')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141341584361752042)
,p_name=>'APEX.TASK.TASK_CREATE_ERROR'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Falha na cria\00E7\00E3o de uma nova Tarefa para a Defini\00E7\00E3o da Tarefa %0 na aplica\00E7\00E3o %1.'),
'SQLCODE: %2'))
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141341496916752042)
,p_name=>'APEX.TASK.TASK_CREATE_NO_POTENTIAL_OWNER'
,p_message_language=>'pt'
,p_message_text=>unistr('Falhou a tentativa de criar uma tarefa para a defini\00E7\00E3o da tarefa %0 na aplica\00E7\00E3o %1 porque a defini\00E7\00E3o da tarefa n\00E3o cont\00E9m nenhum propriet\00E1rio potencial: edite a defini\00E7\00E3o da tarefa e acrescente, pelo menos, um participante do tipo propriet\00E1rio pot')
||'encial'
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141318717834752035)
,p_name=>'APEX.TASK.TASK_DEFINITION_NOT_FOUND'
,p_message_language=>'pt'
,p_message_text=>unistr('Defini\00E7\00E3o da tarefa n\00E3o encontrada')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141318676474752035)
,p_name=>'APEX.TASK.TASK_DEF_PARTICIPANTS_NOT_FOUND'
,p_message_language=>'pt'
,p_message_text=>unistr('Participantes n\00E3o encontrados para a tarefa')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141320006325752035)
,p_name=>'APEX.TASK.TASK_ID_PK_VIOLATION'
,p_message_language=>'pt'
,p_message_text=>'Foi especificada mais de uma tarefa para a ID da tarefa: consulte o administrador da base de dados'
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141318862909752035)
,p_name=>'APEX.TASK.TASK_NOT_FOUND'
,p_message_language=>'pt'
,p_message_text=>unistr('Tarefa N\00E3o Encontrada')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141318507988752035)
,p_name=>'APEX.TASK.TASK_PARAMETER_NOT_FOUND'
,p_message_language=>'pt'
,p_message_text=>unistr('Par\00E2metro da tarefa n\00E3o encontrado')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141354879103752046)
,p_name=>'APEX.TASK.TYPE.ACTION'
,p_message_language=>'pt'
,p_message_text=>unistr('A\00E7\00E3o')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141354756496752046)
,p_name=>'APEX.TASK.TYPE.APPROVAL'
,p_message_language=>'pt'
,p_message_text=>unistr('Aprova\00E7\00E3o')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141302145377752030)
,p_name=>'APEX.TASK.VACATION_RULE_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('O Procedimento da Regra de F\00E9rias %2 falhou a execu\00E7\00E3o da defini\00E7\00E3o da tarefa %0 na aplica\00E7\00E3o %1.')
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141302351073752030)
,p_name=>'APEX.TASK.VACATION_RULE_MESSAGE'
,p_message_language=>'pt'
,p_message_text=>'O participante %1 foi acrescentado como um substituto para o participante %0. Motivo - %2 .'
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141506096721752090)
,p_name=>'APEX.TB.TOOLBAR'
,p_message_language=>'pt'
,p_message_text=>'Barra de Ferramentas'
,p_is_js_message=>true
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141359520814752047)
,p_name=>'APEX.TEMPLATE.APPLICATION'
,p_message_language=>'pt'
,p_message_text=>unistr('Aplica\00E7\00E3o')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141520794566752095)
,p_name=>'APEX.TEMPLATE.EXPAND_COLLAPSE_NAV_LABEL'
,p_message_language=>'pt'
,p_message_text=>unistr('Expandir/Contrair Navega\00E7\00E3o')
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141520889711752095)
,p_name=>'APEX.TEMPLATE.EXPAND_COLLAPSE_SIDE_COL_LABEL'
,p_message_language=>'pt'
,p_message_text=>'Expandir/Contrair Coluna Lateral'
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141429293645752068)
,p_name=>'APEX.TEMPLATE.MAIN_NAV_LABEL'
,p_message_language=>'pt'
,p_message_text=>unistr('Navega\00E7\00E3o Principal')
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141330084401752038)
,p_name=>'APEX.TEMPLATE_DIRECTIVE.INVALID_PLACEHOLDER_NAME'
,p_message_language=>'pt'
,p_message_text=>unistr('"%0" \00E9 um nome de reposit\00F3rio de valores inv\00E1lido.')
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141436936561752070)
,p_name=>'APEX.TIME.DAY'
,p_message_language=>'pt'
,p_message_text=>'1 dia'
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141436736080752070)
,p_name=>'APEX.TIME.HOUR'
,p_message_language=>'pt'
,p_message_text=>'1 hora'
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141437061595752070)
,p_name=>'APEX.TIME.N_DAYS'
,p_message_language=>'pt'
,p_message_text=>'%0 dias'
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141436854814752070)
,p_name=>'APEX.TIME.N_HOURS'
,p_message_language=>'pt'
,p_message_text=>'%0 horas'
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141436649191752070)
,p_name=>'APEX.TIME.N_MINUTES'
,p_message_language=>'pt'
,p_message_text=>'%0 minutos'
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141437225219752070)
,p_name=>'APEX.TIME.N_WEEKS'
,p_message_language=>'pt'
,p_message_text=>'%0 semanas'
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141437130051752070)
,p_name=>'APEX.TIME.WEEK'
,p_message_language=>'pt'
,p_message_text=>'1 semana'
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141334948412752040)
,p_name=>'APEX.TMV.SELECTION_COUNT'
,p_message_language=>'pt'
,p_message_text=>'%0 itens selecionados'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141335149414752040)
,p_name=>'APEX.TMV.SELECTOR_LABEL'
,p_message_language=>'pt'
,p_message_text=>'Selecionar Item'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141335038954752040)
,p_name=>'APEX.TMV.SELECTOR_LABEL_1'
,p_message_language=>'pt'
,p_message_text=>'Selecionar %0'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141523861360752096)
,p_name=>'APEX.UI.BACK_TO_TOP'
,p_message_language=>'pt'
,p_message_text=>unistr('In\00EDcio da p\00E1gina')
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141381415511752054)
,p_name=>'APEX.UI.ENABLED'
,p_message_language=>'pt'
,p_message_text=>'Ativado'
,p_is_js_message=>true
,p_version_scn=>2705310
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141349909740752044)
,p_name=>'APEX.UNHANDLED_ERROR'
,p_message_language=>'pt'
,p_message_text=>'Erro ao processar o pedido.'
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141335595442752040)
,p_name=>'APEX.UPDATE_MESSAGE_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('A mensagem de texto %0 n\00E3o pode ser atualizada uma vez que foi subscrita a partir de outra aplica\00E7\00E3o.')
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141438690692752070)
,p_name=>'APEX.VALUE_REQUIRED'
,p_message_language=>'pt'
,p_message_text=>unistr('Valor Obrigat\00F3rio')
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141355059574752046)
,p_name=>'APEX.VISUALLY_HIDDEN_HEADING'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00EDvel do t\00EDtulo %0, oculto')
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141483460052752084)
,p_name=>'APEX.WARN_ON_UNSAVED_CHANGES'
,p_message_language=>'pt'
,p_message_text=>unistr('Esta p\00E1gina tem altera\00E7\00F5es n\00E3o gravadas.')
,p_is_js_message=>true
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141345030370752043)
,p_name=>'APEX.WF.NAVIGATOR'
,p_message_language=>'pt'
,p_message_text=>'Navegador'
,p_is_js_message=>true
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141344781429752043)
,p_name=>'APEX.WF.ZOOM_IN'
,p_message_language=>'pt'
,p_message_text=>'Aproximar'
,p_is_js_message=>true
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141345779591752043)
,p_name=>'APEX.WF.ZOOM_LEVEL'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00EDvel de zoom {0}%')
,p_is_js_message=>true
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141344855382752043)
,p_name=>'APEX.WF.ZOOM_OUT'
,p_message_language=>'pt'
,p_message_text=>'Afastar'
,p_is_js_message=>true
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141344938161752043)
,p_name=>'APEX.WF.ZOOM_RESET'
,p_message_language=>'pt'
,p_message_text=>unistr('Redefini\00E7\00E3o do Zoom')
,p_is_js_message=>true
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141320467108752036)
,p_name=>'APEX.WF_DIAGRAM.ARIA_DESC'
,p_message_language=>'pt'
,p_message_text=>unistr('De momento, o diagrama de fluxo de trabalho n\00E3o est\00E1 acess\00EDvel.')
,p_is_js_message=>true
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141320328791752036)
,p_name=>'APEX.WF_DIAGRAM.ARIA_LABEL'
,p_message_language=>'pt'
,p_message_text=>'Diagrama de Fluxo de Trabalho'
,p_is_js_message=>true
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141322213404752036)
,p_name=>'APEX.WORKFLOW.ACTION_NOT_ALLOWED'
,p_message_language=>'pt'
,p_message_text=>unistr('A Inst\00E2ncia do Fluxo de Trabalho %0 est\00E1 atualmente no estado %1. Como tal, a opera\00E7\00E3o n\00E3o \00E9 permitida')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141324810558752037)
,p_name=>'APEX.WORKFLOW.ACTIVITY.COMPLETED'
,p_message_language=>'pt'
,p_message_text=>unistr('A inst\00E2ncia %1 da Atividade %2 no Fluxo de Trabalho %0 foi conclu\00EDda')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141324608212752037)
,p_name=>'APEX.WORKFLOW.ACTIVITY.CREATED'
,p_message_language=>'pt'
,p_message_text=>unistr('Nova Inst\00E2ncia %1 da Atividade %2 criada no Fluxo de Trabalho %0')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141316479663752034)
,p_name=>'APEX.WORKFLOW.ACTIVITY.DATA_NOT_FOUND'
,p_message_language=>'pt'
,p_message_text=>unistr('A linha de dados adicional associada a esta inst\00E2ncia de atividade do fluxo de trabalho n\00E3o foi encontrada')
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141324775184752037)
,p_name=>'APEX.WORKFLOW.ACTIVITY.RETRIED'
,p_message_language=>'pt'
,p_message_text=>unistr('A inst\00E2ncia com falha %1 da Atividade %2 no Fluxo de Trabalho %0 foi repetida')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141306776936752032)
,p_name=>'APEX.WORKFLOW.ACTIVITY.TERMINATED'
,p_message_language=>'pt'
,p_message_text=>unistr('A inst\00E2ncia da atividade %1 no Fluxo de Trabalho %0 foi terminada')
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141340514824752041)
,p_name=>'APEX.WORKFLOW.ACTIVITY.TIMEOUT'
,p_message_language=>'pt'
,p_message_text=>unistr('O limite de tempo da inst\00E2ncia da atividade %1 no Fluxo de Trabalho %0 foi excedido e foi terminada a inst\00E2ncia.')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141324913719752037)
,p_name=>'APEX.WORKFLOW.ACTIVITY.WAITING'
,p_message_language=>'pt'
,p_message_text=>unistr('A inst\00E2ncia %1 da Atividade %2 no Fluxo de Trabalho %0 est\00E1 no estado Em Espera')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141306593834752031)
,p_name=>'APEX.WORKFLOW.ALTERED_AND_RESUMED'
,p_message_language=>'pt'
,p_message_text=>unistr('A Inst\00E2ncia do Fluxo de Trabalho %0 foi alterada e retomada na atividade %1')
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141323943341752037)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.COMPLETED'
,p_message_language=>'pt'
,p_message_text=>unistr('A Inst\00E2ncia de Espera %1 da Atividade %2 no Fluxo de Trabalho %0 foi conclu\00EDda com \00EAxito')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141323785929752037)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.FAULTED'
,p_message_language=>'pt'
,p_message_text=>unistr('Atividade em espera %1 Com falha uma vez que o Fluxo de Trabalho %0 j\00E1 estava no estado Com falha antes da Atividade ser conclu\00EDda')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141323829426752037)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.TERMINATED'
,p_message_language=>'pt'
,p_message_text=>unistr('A Atividade em espera %1 foi Terminada uma vez que o Fluxo de Trabalho %0 j\00E1 estava Terminado antes da Atividade ser conclu\00EDda')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141306819557752032)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.TERMINATE_FAILED'
,p_message_language=>'pt'
,p_message_text=>unistr('Falha no t\00E9rmino da Atividade %1 no Fluxo de Trabalho %0 devido \00E0 exce\00E7\00E3o - %2')
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141322438601752036)
,p_name=>'APEX.WORKFLOW.BUSY'
,p_message_language=>'pt'
,p_message_text=>unistr('O Fluxo de Trabalho est\00E1 atualmente ocupado a concluir a opera\00E7\00E3o anterior. Tente novamente mais tarde')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141338533414752041)
,p_name=>'APEX.WORKFLOW.COMPLETED_SINCE'
,p_message_language=>'pt'
,p_message_text=>unistr('Conclu\00EDdo %0')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141321518199752036)
,p_name=>'APEX.WORKFLOW.CONTINUE.NOT_ALLOWED'
,p_message_language=>'pt'
,p_message_text=>unistr('O Fluxo de Trabalho %0 n\00E3o pode ser continuado uma vez que est\00E1 na Atividade %1 que n\00E3o est\00E1 num estado de Espera')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141333461983752039)
,p_name=>'APEX.WORKFLOW.CORRELATION_CONTEXT_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 n\00E3o \00E9 um contexto de correla\00E7\00E3o do fluxo de trabalho v\00E1lido para o processo a ser executado por esta Atividade do Fluxo de Trabalho. O contexto de correla\00E7\00E3o deve ser um texto delimitado por dois pontos que contenha APEX_APPL_WORKFLOW seguido da I')
||unistr('D da Inst\00E2ncia do Fluxo de Trabalho e da ID da Inst\00E2ncia da Atividade.')
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141324180148752037)
,p_name=>'APEX.WORKFLOW.CREATED'
,p_message_language=>'pt'
,p_message_text=>unistr('Nova Inst\00E2ncia %0 do Fluxo de Trabalho %1 criada, Vers\00E3o %2')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141316203781752034)
,p_name=>'APEX.WORKFLOW.DATA_NOT_FOUND'
,p_message_language=>'pt'
,p_message_text=>unistr('A linha de dados adicional associada a esta inst\00E2ncia do fluxo de trabalho n\00E3o foi encontrada')
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141338788453752041)
,p_name=>'APEX.WORKFLOW.DUE_SINCE'
,p_message_language=>'pt'
,p_message_text=>'Limite %0'
,p_version_scn=>2705304
);
end;
/
begin
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141324028936752037)
,p_name=>'APEX.WORKFLOW.END'
,p_message_language=>'pt'
,p_message_text=>'O fluxo de trabalho %0 terminou com o estado %1'
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141321277345752036)
,p_name=>'APEX.WORKFLOW.INCOMPATIBLE_DATA_TYPE'
,p_message_language=>'pt'
,p_message_text=>unistr('O tipo de dados %1 das condi\00E7\00F5es a serem comparadas na Atividade de Troca do Fluxo de Trabalho %0 n\00E3o \00E9 compat\00EDvel com o operador da condi\00E7\00E3o')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141311045387752033)
,p_name=>'APEX.WORKFLOW.INITIATED_BY_USER_SINCE'
,p_message_language=>'pt'
,p_message_text=>'Iniciado por %0 %1'
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141333802512752040)
,p_name=>'APEX.WORKFLOW.INVOKED'
,p_message_language=>'pt'
,p_message_text=>unistr('Nova Inst\00E2ncia %0 do Fluxo de Trabalho %1 criada, Vers\00E3o %2 - invocada a partir da inst\00E2ncia da atividade %4 da inst\00E2ncia do fluxo de trabalho %3')
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141306687414752032)
,p_name=>'APEX.WORKFLOW.NO_ACTIVITY_FOUND'
,p_message_language=>'pt'
,p_message_text=>unistr('A atividade com a ID est\00E1tica %1 n\00E3o \00E9 uma atividade no Fluxo de Trabalho %0. Verifique a ID est\00E1tica da atividade da Vers\00E3o do Fluxo de Trabalho correspondente.')
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141331970328752039)
,p_name=>'APEX.WORKFLOW.REQUIRED_PARAM_MISSING'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 \00E9 um par\00E2metro obrigat\00F3rio para este fluxo de trabalho e n\00E3o deve ser NULL.')
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141324525010752037)
,p_name=>'APEX.WORKFLOW.RESUMED'
,p_message_language=>'pt'
,p_message_text=>unistr('A Inst\00E2ncia do Fluxo de Trabalho %0 foi retomada')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141324438520752037)
,p_name=>'APEX.WORKFLOW.RETRIED'
,p_message_language=>'pt'
,p_message_text=>unistr('A Inst\00E2ncia do Fluxo de Trabalho %0 foi repetida')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141338869065752041)
,p_name=>'APEX.WORKFLOW.RETRY_COUNT.EQUALS_ONE'
,p_message_language=>'pt'
,p_message_text=>'%0 tentativa'
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141338973233752041)
,p_name=>'APEX.WORKFLOW.RETRY_COUNT.NOT_EQUALS_ONE'
,p_message_language=>'pt'
,p_message_text=>'%0 tentativas'
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141338611370752041)
,p_name=>'APEX.WORKFLOW.STARTED_SINCE'
,p_message_language=>'pt'
,p_message_text=>'Iniciado %0'
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141332870770752039)
,p_name=>'APEX.WORKFLOW.STATE.ACTIVE'
,p_message_language=>'pt'
,p_message_text=>'Ativa'
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141333008366752039)
,p_name=>'APEX.WORKFLOW.STATE.COMPLETED'
,p_message_language=>'pt'
,p_message_text=>unistr('Conclu\00EDda')
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141333140864752039)
,p_name=>'APEX.WORKFLOW.STATE.FAULTED'
,p_message_language=>'pt'
,p_message_text=>'Com falha'
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141333224845752039)
,p_name=>'APEX.WORKFLOW.STATE.SUSPENDED'
,p_message_language=>'pt'
,p_message_text=>'Suspensa'
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141332928411752039)
,p_name=>'APEX.WORKFLOW.STATE.TERMINATED'
,p_message_language=>'pt'
,p_message_text=>'Terminada'
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141348254032752044)
,p_name=>'APEX.WORKFLOW.STATE.WAITING'
,p_message_language=>'pt'
,p_message_text=>'A aguardar'
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141324231081752037)
,p_name=>'APEX.WORKFLOW.SUSPENDED'
,p_message_language=>'pt'
,p_message_text=>unistr('A Inst\00E2ncia do Fluxo de Trabalho %0 foi suspensa')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141330141552752038)
,p_name=>'APEX.WORKFLOW.SWITCH.BRANCH_NOT_FOUND'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel determinar a atividade seguinte para a Inst\00E2ncia do Fluxo de Trabalho %0. Verifique e corrija as condi\00E7\00F5es definidas para a atividade de mudan\00E7a atual antes de repetir o fluxo de trabalho.')
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141324315679752037)
,p_name=>'APEX.WORKFLOW.TERMINATED'
,p_message_language=>'pt'
,p_message_text=>unistr('A Inst\00E2ncia do Fluxo de Trabalho %0 foi terminada')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141323463650752036)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_RESUME'
,p_message_language=>'pt'
,p_message_text=>'Apenas o Administrador de Atividades do Fluxo de Trabalho %0 podem retomar o fluxo de trabalho'
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141323586133752036)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_RETRY'
,p_message_language=>'pt'
,p_message_text=>unistr('O Fluxo de Trabalho %0 s\00F3 pode ser obtido por um Administrador de Atividade e/ou um Propriet\00E1rio')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141323022415752036)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_SUSPEND'
,p_message_language=>'pt'
,p_message_text=>unistr('A Inst\00E2ncia do Fluxo de Trabalho %0 s\00F3 pode ser suspensa por um Administrador de Atividade do fluxo de trabalho')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141323342658752036)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_TERMINATE'
,p_message_language=>'pt'
,p_message_text=>unistr('Apenas os Propriet\00E1rios e Administradores de Atividades da Inst\00E2ncia do Fluxo de Trabalho %0 podem terminar o fluxo de trabalho')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141321740654752036)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_UPDATE'
,p_message_language=>'pt'
,p_message_text=>unistr('As Vari\00E1veis do Fluxo de Trabalho %0 s\00F3 podem ser atualizadas por um Administrador de Atividade definido para o fluxo de trabalho')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141336372163752040)
,p_name=>'APEX.WORKFLOW.UPDATE,NOT_ALLOWED'
,p_message_language=>'pt'
,p_message_text=>unistr('A inst\00E2ncia do fluxo de trabalho %0 deve estar no estado Com Falha ou Suspensa para que as respetivas vari\00E1veis possam ser atualizadas.')
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141327891275752038)
,p_name=>'APEX.WORKFLOW.UPDATED'
,p_message_language=>'pt'
,p_message_text=>unistr('Valor da Vari\00E1vel do Fluxo de Trabalho %0 atualizado para %1')
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141338001986752041)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_ACTIVE'
,p_message_language=>'pt'
,p_message_text=>unistr('O Fluxo de Trabalho %0 n\00E3o tem uma vers\00E3o Ativa')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141338162735752041)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_DEV'
,p_message_language=>'pt'
,p_message_text=>unistr('O Fluxo de Trabalho %0 n\00E3o tem uma vers\00E3o Em Desenvolvimento')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141338291406752041)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_FOUND'
,p_message_language=>'pt'
,p_message_text=>unistr('O Fluxo de Trabalho %0 n\00E3o tem uma vers\00E3o Ativa ou Em Desenvolvimento')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141321104131752036)
,p_name=>'APEX.WORKFLOW.WORKFLOW_ACT_INSTANCE_NOT_FOUND'
,p_message_language=>'pt'
,p_message_text=>unistr('A Inst\00E2ncia da Atividade %1 para a Inst\00E2ncia do Fluxo de Trabalho %0 n\00E3o foi encontrada')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141320986699752036)
,p_name=>'APEX.WORKFLOW.WORKFLOW_INSTANCE_NOT_FOUND'
,p_message_language=>'pt'
,p_message_text=>unistr('A Inst\00E2ncia do Fluxo de Trabalho %0 n\00E3o foi encontrada')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141356047105752046)
,p_name=>'APEX.XLSX.ERROR.NO_ACTIVE_WORKSHEET'
,p_message_language=>'pt'
,p_message_text=>unistr('O livro n\00E3o tem nenhuma folha de c\00E1lculo ativa.')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141355986849752046)
,p_name=>'APEX.XLSX.ERROR.WORKBOOK_NOT_INITIALIZED'
,p_message_language=>'pt'
,p_message_text=>unistr('O livro n\00E3o foi inicializado.')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141355812822752046)
,p_name=>'APEX.XLSX.INTERNAL_ERROR'
,p_message_language=>'pt'
,p_message_text=>'Ocorreu um erro interno ao criar o ficheiro XLSX.'
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141358385235752047)
,p_name=>'APEX.XLSX.SHEET'
,p_message_language=>'pt'
,p_message_text=>'Folha'
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141368955308752050)
,p_name=>'APEX.XLSX.SHEET_NAME_TAKEN'
,p_message_language=>'pt'
,p_message_text=>unistr('O nome da folha de c\00E1lculo "%0" j\00E1 est\00E1 em uso. Experimente um nome diferente.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141497500719752088)
,p_name=>'APEXIR_ACTIONS'
,p_message_language=>'pt'
,p_message_text=>unistr('A\00E7\00F5es')
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141412555948752063)
,p_name=>'APEXIR_ACTIONS_MENU'
,p_message_language=>'pt'
,p_message_text=>unistr('Menu A\00E7\00F5es')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141408242510752061)
,p_name=>'APEXIR_ADD_FUNCTION'
,p_message_language=>'pt'
,p_message_text=>unistr('Acrescentar Fun\00E7\00E3o')
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141408112278752061)
,p_name=>'APEXIR_ADD_GROUP_BY_COLUMN'
,p_message_language=>'pt'
,p_message_text=>'Acrescentar Agrupar por Coluna'
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141445738568752073)
,p_name=>'APEXIR_ADD_PIVOT_COLUMN'
,p_message_language=>'pt'
,p_message_text=>unistr('Acrescentar Coluna Din\00E2mica')
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141445841508752073)
,p_name=>'APEXIR_ADD_ROW_COLUMN'
,p_message_language=>'pt'
,p_message_text=>'Acrescentar Coluna da Linha'
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141380276067752053)
,p_name=>'APEXIR_AGGREGATE'
,p_message_language=>'pt'
,p_message_text=>'Agregar'
,p_is_js_message=>true
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141418714458752065)
,p_name=>'APEXIR_AGGREGATION'
,p_message_language=>'pt'
,p_message_text=>unistr('Agrega\00E7\00E3o')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141399674082752059)
,p_name=>'APEXIR_AGG_AVG'
,p_message_language=>'pt'
,p_message_text=>unistr('M\00E9dia')
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141403908348752060)
,p_name=>'APEXIR_AGG_COUNT'
,p_message_language=>'pt'
,p_message_text=>'Contagem'
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141399780890752059)
,p_name=>'APEXIR_AGG_MAX'
,p_message_language=>'pt'
,p_message_text=>unistr('M\00E1ximo')
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141399937194752059)
,p_name=>'APEXIR_AGG_MEDIAN'
,p_message_language=>'pt'
,p_message_text=>'Mediano'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141399829143752059)
,p_name=>'APEXIR_AGG_MIN'
,p_message_language=>'pt'
,p_message_text=>unistr('M\00EDnimo')
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141399574216752059)
,p_name=>'APEXIR_AGG_SUM'
,p_message_language=>'pt'
,p_message_text=>'Soma %0'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141400687771752059)
,p_name=>'APEXIR_ALL'
,p_message_language=>'pt'
,p_message_text=>'Tudo'
,p_is_js_message=>true
,p_version_scn=>2705313
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141379543140752053)
,p_name=>'APEXIR_ALL_COLUMNS'
,p_message_language=>'pt'
,p_message_text=>'Todas as Colunas'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141359678869752047)
,p_name=>'APEXIR_ALL_ROWS'
,p_message_language=>'pt'
,p_message_text=>'Todas as Linhas'
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141494529114752087)
,p_name=>'APEXIR_ALTERNATIVE'
,p_message_language=>'pt'
,p_message_text=>'Alternativo'
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141496119927752087)
,p_name=>'APEXIR_ALTERNATIVE_DEFAULT_NAME'
,p_message_language=>'pt'
,p_message_text=>unistr('Valor Por Omiss\00E3o Alternativo: %0 ')
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141393778085752057)
,p_name=>'APEXIR_AND'
,p_message_language=>'pt'
,p_message_text=>'e'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141428582379752067)
,p_name=>'APEXIR_API.IMPORT_CONTENT_CORRUPTED'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel importar o relat\00F3rio gravado. O conte\00FAdo est\00E1 corrompido.')
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141428602367752067)
,p_name=>'APEXIR_API.IMPORT_CONTENT_EMPTY'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel importar o relat\00F3rio gravado. O conte\00FAdo est\00E1 vazio.')
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141381732805752054)
,p_name=>'APEXIR_APPLY'
,p_message_language=>'pt'
,p_message_text=>'Aplicar'
,p_is_js_message=>true
,p_version_scn=>2705310
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141375313824752052)
,p_name=>'APEXIR_ASCENDING'
,p_message_language=>'pt'
,p_message_text=>'Crescente'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141396811125752058)
,p_name=>'APEXIR_AS_OF'
,p_message_language=>'pt'
,p_message_text=>'A partir de %0'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141496756422752088)
,p_name=>'APEXIR_AVERAGE_X'
,p_message_language=>'pt'
,p_message_text=>unistr('M\00E9dia %0')
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141488372248752085)
,p_name=>'APEXIR_BAR'
,p_message_language=>'pt'
,p_message_text=>'Barra'
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141381085884752053)
,p_name=>'APEXIR_BETWEEN'
,p_message_language=>'pt'
,p_message_text=>'entre'
,p_version_scn=>2705310
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141374160224752051)
,p_name=>'APEXIR_BGCOLOR'
,p_message_language=>'pt'
,p_message_text=>'Cor de Segundo Plano'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141376001807752052)
,p_name=>'APEXIR_BLUE'
,p_message_language=>'pt'
,p_message_text=>'azul'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141410168183752062)
,p_name=>'APEXIR_BOTTOM'
,p_message_language=>'pt'
,p_message_text=>'Inferior'
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141340956515752042)
,p_name=>'APEXIR_BTNS_NEXT_TO_SEARCH_OF'
,p_message_language=>'pt'
,p_message_text=>unistr('Bot\00F5es junto \00E0 barra de pesquisa de %0')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141376600198752052)
,p_name=>'APEXIR_CANCEL'
,p_message_language=>'pt'
,p_message_text=>'Cancelar'
,p_is_js_message=>true
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141382995391752054)
,p_name=>'APEXIR_CATEGORY'
,p_message_language=>'pt'
,p_message_text=>'Categoria'
,p_version_scn=>2705310
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141374056988752051)
,p_name=>'APEXIR_CELL'
,p_message_language=>'pt'
,p_message_text=>unistr('C\00E9lula')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141400558714752059)
,p_name=>'APEXIR_CHART'
,p_message_language=>'pt'
,p_message_text=>'Diagrama'
,p_is_js_message=>true
,p_version_scn=>2705313
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141411021452752062)
,p_name=>'APEXIR_CHART_INITIALIZING'
,p_message_language=>'pt'
,p_message_text=>'A Inicializar...'
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141450795820752074)
,p_name=>'APEXIR_CHART_LABEL_NOT_NULL'
,p_message_language=>'pt'
,p_message_text=>unistr('\00C9 necess\00E1rio especificar a etiqueta do diagrama.')
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141463142967752078)
,p_name=>'APEXIR_CHART_MAX_DATAPOINT_CNT'
,p_message_language=>'pt'
,p_message_text=>unistr('A sua consulta excede o m\00E1ximo de %0 pontos de dados por diagrama. Aplique um filtro para reduzir o n\00FAmero de registos na sua consulta base.')
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141462025307752077)
,p_name=>'APEXIR_CHART_MAX_ROW_CNT'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('O n\00FAmero m\00E1ximo de linhas para uma consulta de Diagrama limita o n\00FAmero de linhas na consulta base e n\00E3o o n\00FAmero de linhas apresentadas.  '),
unistr('A sua consulta base excede o n\00FAmero m\00E1ximo de linhas de %0. Aplique um filtro para reduzir o n\00FAmero de registos na sua consulta base.')))
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141379687903752053)
,p_name=>'APEXIR_CHART_TYPE'
,p_message_language=>'pt'
,p_message_text=>'Tipo de Diagrama'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141343565226752042)
,p_name=>'APEXIR_CHART_VIEW_OF'
,p_message_language=>'pt'
,p_message_text=>unistr('Visualiza\00E7\00E3o de diagrama de %0')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141458769712752076)
,p_name=>'APEXIR_CHECK_ALL'
,p_message_language=>'pt'
,p_message_text=>'Selecionar Tudo'
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141397278414752058)
,p_name=>'APEXIR_CHOOSE_DOWNLOAD_FORMAT'
,p_message_language=>'pt'
,p_message_text=>unistr('Escolher formato do relat\00F3rio')
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141405052342752061)
,p_name=>'APEXIR_CLEAR'
,p_message_language=>'pt'
,p_message_text=>'limpar'
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141376575921752052)
,p_name=>'APEXIR_COLUMN'
,p_message_language=>'pt'
,p_message_text=>'Coluna'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141416388373752064)
,p_name=>'APEXIR_COLUMNS'
,p_message_language=>'pt'
,p_message_text=>'Colunas'
,p_is_js_message=>true
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141383597808752054)
,p_name=>'APEXIR_COLUMN_ALIASES'
,p_message_language=>'pt'
,p_message_text=>unistr('Pseud\00F3nimos de Colunas')
,p_version_scn=>2705310
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141491131098752086)
,p_name=>'APEXIR_COLUMN_FILTER'
,p_message_language=>'pt'
,p_message_text=>'Filtrar...'
,p_version_scn=>2705332
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141351338255752045)
,p_name=>'APEXIR_COLUMN_HEADER'
,p_message_language=>'pt'
,p_message_text=>unistr('Cabe\00E7alho da Coluna')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141365477694752049)
,p_name=>'APEXIR_COLUMN_HEADER_ACTIONS'
,p_message_language=>'pt'
,p_message_text=>unistr('A\00E7\00F5es da Coluna')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141365744586752049)
,p_name=>'APEXIR_COLUMN_HEADER_ACTIONS_FOR'
,p_message_language=>'pt'
,p_message_text=>unistr('A\00E7\00F5es para a coluna "%0"')
,p_is_js_message=>true
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141407123468752061)
,p_name=>'APEXIR_COLUMN_HEADING_MENU'
,p_message_language=>'pt'
,p_message_text=>unistr('Menu T\00EDtulo da Coluna')
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141410896239752062)
,p_name=>'APEXIR_COLUMN_INFO'
,p_message_language=>'pt'
,p_message_text=>unistr('Informa\00E7\00F5es da Coluna')
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141493417716752087)
,p_name=>'APEXIR_COLUMN_LABEL'
,p_message_language=>'pt'
,p_message_text=>'Etiqueta da Coluna'
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141408581075752062)
,p_name=>'APEXIR_COLUMN_N'
,p_message_language=>'pt'
,p_message_text=>'Coluna %0'
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141391487280752056)
,p_name=>'APEXIR_COMPARISON_CONTAINS'
,p_message_language=>'pt'
,p_message_text=>unistr('cont\00E9m')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141392769809752057)
,p_name=>'APEXIR_COMPARISON_DOESNOT_CONTAIN'
,p_message_language=>'pt'
,p_message_text=>unistr('n\00E3o cont\00E9m')
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141375071834752052)
,p_name=>'APEXIR_COMPARISON_IN'
,p_message_language=>'pt'
,p_message_text=>'em'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141392998176752057)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_LAST'
,p_message_language=>'pt'
,p_message_text=>unistr('n\00E3o est\00E1 no \00FAltimo intervalo de')
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141402087831752060)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_NEXT'
,p_message_language=>'pt'
,p_message_text=>unistr('n\00E3o est\00E1 no pr\00F3ximo intervalo de')
,p_version_scn=>2705313
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141392822657752057)
,p_name=>'APEXIR_COMPARISON_IS_IN_LAST'
,p_message_language=>'pt'
,p_message_text=>unistr('est\00E1 no \00FAltimo intervalo de')
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141401916407752060)
,p_name=>'APEXIR_COMPARISON_IS_IN_NEXT'
,p_message_language=>'pt'
,p_message_text=>unistr('est\00E1 no pr\00F3ximo intervalo de')
,p_version_scn=>2705313
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141374901207752052)
,p_name=>'APEXIR_COMPARISON_IS_NOT_NULL'
,p_message_language=>'pt'
,p_message_text=>unistr('n\00E3o \00E9 nulo')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141374852384752052)
,p_name=>'APEXIR_COMPARISON_IS_NULL'
,p_message_language=>'pt'
,p_message_text=>unistr('\00E9 nulo')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141374677087752052)
,p_name=>'APEXIR_COMPARISON_LIKE'
,p_message_language=>'pt'
,p_message_text=>'semelhante'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141375123185752052)
,p_name=>'APEXIR_COMPARISON_NOT_IN'
,p_message_language=>'pt'
,p_message_text=>unistr('n\00E3o est\00E1 em')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141374797779752052)
,p_name=>'APEXIR_COMPARISON_NOT_LIKE'
,p_message_language=>'pt'
,p_message_text=>unistr('n\00E3o semelhante')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141391784160752057)
,p_name=>'APEXIR_COMPARISON_REGEXP_LIKE'
,p_message_language=>'pt'
,p_message_text=>unistr('corresponde \00E0 express\00E3o regular')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141397190968752058)
,p_name=>'APEXIR_COMPUTATION'
,p_message_language=>'pt'
,p_message_text=>unistr('C\00E1lculo')
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141461710157752077)
,p_name=>'APEXIR_COMPUTATION_EXPRESSION'
,p_message_language=>'pt'
,p_message_text=>unistr('Express\00E3o de C\00E1lculo')
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141416612068752064)
,p_name=>'APEXIR_COMPUTATION_FOOTER'
,p_message_language=>'pt'
,p_message_text=>unistr('Crie um c\00E1lculo com pseud\00F3nimos de colunas.')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141416728461752064)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E1'
,p_message_language=>'pt'
,p_message_text=>'(B+C)*100'
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141416859862752064)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E2'
,p_message_language=>'pt'
,p_message_text=>'INITCAP(B)||'', ''||INITCAP(C)'
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141416956399752064)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E3'
,p_message_language=>'pt'
,p_message_text=>'CASE WHEN A = 10 THEN B + C ELSE B END'
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141357876639752047)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E4'
,p_message_language=>'pt'
,p_message_text=>'ROUND(C / 1000000)'
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141401393866752059)
,p_name=>'APEXIR_COMPUTE'
,p_message_language=>'pt'
,p_message_text=>'Calcular'
,p_is_js_message=>true
,p_version_scn=>2705313
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141409166295752062)
,p_name=>'APEXIR_CONTROL_BREAK'
,p_message_language=>'pt'
,p_message_text=>unistr('Controlo de Interrup\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141412146347752063)
,p_name=>'APEXIR_CONTROL_BREAKS'
,p_message_language=>'pt'
,p_message_text=>unistr('Controlos de Interrup\00E7\00E3o')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141498752408752088)
,p_name=>'APEXIR_CONTROL_BREAK_COLUMNS'
,p_message_language=>'pt'
,p_message_text=>unistr('Colunas de Controlo de Interrup\00E7\00E3o')
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141354570237752046)
,p_name=>'APEXIR_COUNT_DISTINCT'
,p_message_language=>'pt'
,p_message_text=>'Contagem Distinta'
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141497247295752088)
,p_name=>'APEXIR_COUNT_DISTINCT_X'
,p_message_language=>'pt'
,p_message_text=>'Contagem Distinta'
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141497120741752088)
,p_name=>'APEXIR_COUNT_X'
,p_message_language=>'pt'
,p_message_text=>'Contagem %0'
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141470198758752080)
,p_name=>'APEXIR_DAILY'
,p_message_language=>'pt'
,p_message_text=>unistr('Di\00E1rio')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141523455173752096)
,p_name=>'APEXIR_DATA'
,p_message_language=>'pt'
,p_message_text=>'Dados'
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141410951400752062)
,p_name=>'APEXIR_DATA_AS_OF'
,p_message_language=>'pt'
,p_message_text=>unistr('Comunicar dados de h\00E1 %0 minutos')
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141343904404752042)
,p_name=>'APEXIR_DATA_VIEW_OF'
,p_message_language=>'pt'
,p_message_text=>unistr('Visualiza\00E7\00E3o de dados de %0')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141380364469752053)
,p_name=>'APEXIR_DATE'
,p_message_language=>'pt'
,p_message_text=>'Data'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141414806886752063)
,p_name=>'APEXIR_DEFAULT'
,p_message_language=>'pt'
,p_message_text=>unistr('Valor Por Omiss\00E3o')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141494317403752087)
,p_name=>'APEXIR_DEFAULT_REPORT_TYPE'
,p_message_language=>'pt'
,p_message_text=>unistr('Tipo de Relat\00F3rio Por Omiss\00E3o')
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141376747202752052)
,p_name=>'APEXIR_DELETE'
,p_message_language=>'pt'
,p_message_text=>'Apagar'
,p_is_js_message=>true
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141380671017752053)
,p_name=>'APEXIR_DELETE_CONFIRM'
,p_message_language=>'pt'
,p_message_text=>unistr('Pretende apagar as defini\00E7\00F5es deste relat\00F3rio?')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141481187889752083)
,p_name=>'APEXIR_DELETE_DEFAULT_REPORT'
,p_message_language=>'pt'
,p_message_text=>unistr('Apagar Relat\00F3rios Por Omiss\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705329
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141408885910752062)
,p_name=>'APEXIR_DELETE_REPORT'
,p_message_language=>'pt'
,p_message_text=>unistr('Apagar Relat\00F3rio')
,p_is_js_message=>true
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141375481031752052)
,p_name=>'APEXIR_DESCENDING'
,p_message_language=>'pt'
,p_message_text=>'Decrescente'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141383052021752054)
,p_name=>'APEXIR_DESCRIPTION'
,p_message_language=>'pt'
,p_message_text=>unistr('Descri\00E7\00E3o')
,p_version_scn=>2705310
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141407055189752061)
,p_name=>'APEXIR_DETAIL_VIEW'
,p_message_language=>'pt'
,p_message_text=>unistr('Visualiza\00E7\00E3o de Linha \00DAnica')
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141415310388752064)
,p_name=>'APEXIR_DIRECTION'
,p_message_language=>'pt'
,p_message_text=>unistr('Dire\00E7\00E3o %0')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141416247467752064)
,p_name=>'APEXIR_DISABLED'
,p_message_language=>'pt'
,p_message_text=>'Desativado'
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141376211731752052)
,p_name=>'APEXIR_DISPLAYED'
,p_message_language=>'pt'
,p_message_text=>'Apresentado'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141379404595752053)
,p_name=>'APEXIR_DISPLAYED_COLUMNS'
,p_message_language=>'pt'
,p_message_text=>'Colunas Apresentadas'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141415240652752064)
,p_name=>'APEXIR_DISPLAY_IN_REPORT'
,p_message_language=>'pt'
,p_message_text=>unistr('Apresentar no Relat\00F3rio')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141410096718752062)
,p_name=>'APEXIR_DOWN'
,p_message_language=>'pt'
,p_message_text=>'Para Baixo'
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141401427909752059)
,p_name=>'APEXIR_DOWNLOAD'
,p_message_language=>'pt'
,p_message_text=>'Descarregar'
,p_is_js_message=>true
,p_version_scn=>2705313
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141415105165752064)
,p_name=>'APEXIR_DO_NOT_DISPLAY'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o Apresentar')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141484432717752084)
,p_name=>'APEXIR_DUPLICATE_HIGHLIGHT_COND'
,p_message_language=>'pt'
,p_message_text=>unistr('J\00E1 existe um destaque com a mesma condi\00E7\00E3o.')
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141498919459752088)
,p_name=>'APEXIR_DUPLICATE_PIVOT_COLUMN'
,p_message_language=>'pt'
,p_message_text=>unistr('Coluna din\00E2mica duplicada. A lista de colunas din\00E2micas deve ser exclusiva.')
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141499181001752088)
,p_name=>'APEXIR_EDIT'
,p_message_language=>'pt'
,p_message_text=>'Editar'
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141411121236752062)
,p_name=>'APEXIR_EDIT_CHART'
,p_message_language=>'pt'
,p_message_text=>unistr('Editar Defini\00E7\00F5es do Diagrama')
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141417755375752064)
,p_name=>'APEXIR_EDIT_CHART2'
,p_message_language=>'pt'
,p_message_text=>unistr('Editar Gr\00E1fico')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141381610438752054)
,p_name=>'APEXIR_EDIT_CONTROL_BREAK'
,p_message_language=>'pt'
,p_message_text=>unistr('Editar Controlo de Interrup\00E7\00E3o')
,p_version_scn=>2705310
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141418106581752064)
,p_name=>'APEXIR_EDIT_FILTER'
,p_message_language=>'pt'
,p_message_text=>'Editar Filtro'
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141384681530752054)
,p_name=>'APEXIR_EDIT_FLASHBACK'
,p_message_language=>'pt'
,p_message_text=>'Editar Flashback'
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141475973872752081)
,p_name=>'APEXIR_EDIT_GROUP_BY'
,p_message_language=>'pt'
,p_message_text=>'Editar Grupo por'
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141418091939752064)
,p_name=>'APEXIR_EDIT_HIGHLIGHT'
,p_message_language=>'pt'
,p_message_text=>'Editar Destaque'
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141446030034752073)
,p_name=>'APEXIR_EDIT_PIVOT'
,p_message_language=>'pt'
,p_message_text=>unistr('Editar Din\00E2mica')
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141405486844752061)
,p_name=>'APEXIR_EDIT_REPORT'
,p_message_language=>'pt'
,p_message_text=>unistr('Editar Relat\00F3rio')
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141494641114752087)
,p_name=>'APEXIR_EMAIL'
,p_message_language=>'pt'
,p_message_text=>'Email'
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141366899478752049)
,p_name=>'APEXIR_EMAIL_ADDRESS'
,p_message_language=>'pt'
,p_message_text=>unistr('Endere\00E7o de Email')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141494909842752087)
,p_name=>'APEXIR_EMAIL_BCC'
,p_message_language=>'pt'
,p_message_text=>'Bcc'
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141495118752752087)
,p_name=>'APEXIR_EMAIL_BODY'
,p_message_language=>'pt'
,p_message_text=>'Corpo'
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141494848562752087)
,p_name=>'APEXIR_EMAIL_CC'
,p_message_language=>'pt'
,p_message_text=>'Cc'
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141495689621752087)
,p_name=>'APEXIR_EMAIL_FREQUENCY'
,p_message_language=>'pt'
,p_message_text=>unistr('Frequ\00EAncia')
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141372043841752051)
,p_name=>'APEXIR_EMAIL_NOT_CONFIGURED'
,p_message_language=>'pt'
,p_message_text=>unistr('O email n\00E3o foi configurado para esta aplica\00E7\00E3o. Contacte o administrador.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141469457949752079)
,p_name=>'APEXIR_EMAIL_REQUIRED'
,p_message_language=>'pt'
,p_message_text=>unistr('\00C9 necess\00E1rio especificar o Endere\00E7o de Email.')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141495218001752087)
,p_name=>'APEXIR_EMAIL_SEE_ATTACHED'
,p_message_language=>'pt'
,p_message_text=>'Consultar anexo'
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141495083371752087)
,p_name=>'APEXIR_EMAIL_SUBJECT'
,p_message_language=>'pt'
,p_message_text=>'Assunto'
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141470475288752080)
,p_name=>'APEXIR_EMAIL_SUBJECT_REQUIRED'
,p_message_language=>'pt'
,p_message_text=>unistr('\00C9 necess\00E1rio especificar o Assunto da Mensagem de Email.')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141494740414752087)
,p_name=>'APEXIR_EMAIL_TO'
,p_message_language=>'pt'
,p_message_text=>'Para'
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141373863904752051)
,p_name=>'APEXIR_ENABLED'
,p_message_language=>'pt'
,p_message_text=>'Ativado'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141417936637752064)
,p_name=>'APEXIR_ENABLE_DISABLE_ALT'
,p_message_language=>'pt'
,p_message_text=>'Ativar/Desativar'
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141417421705752064)
,p_name=>'APEXIR_ERROR_LANDMARK'
,p_message_language=>'pt'
,p_message_text=>'Erro! %0'
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141417001906752064)
,p_name=>'APEXIR_EXAMPLES'
,p_message_language=>'pt'
,p_message_text=>'Exemplos'
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141417810224752064)
,p_name=>'APEXIR_EXAMPLES_WITH_COLON'
,p_message_language=>'pt'
,p_message_text=>'Exemplos:'
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141379338085752053)
,p_name=>'APEXIR_EXCLUDE_NULL'
,p_message_language=>'pt'
,p_message_text=>'Excluir Valores Nulos'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141418425627752064)
,p_name=>'APEXIR_EXPAND_COLLAPSE_ALT'
,p_message_language=>'pt'
,p_message_text=>'Expandir/Contrair'
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141416049581752064)
,p_name=>'APEXIR_EXPRESSION'
,p_message_language=>'pt'
,p_message_text=>unistr('Express\00E3o')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141400941629752059)
,p_name=>'APEXIR_FILTER'
,p_message_language=>'pt'
,p_message_text=>'Filtrar'
,p_is_js_message=>true
,p_version_scn=>2705313
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141412019409752063)
,p_name=>'APEXIR_FILTERS'
,p_message_language=>'pt'
,p_message_text=>'Filtros'
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141422762321752066)
,p_name=>'APEXIR_FILTER_EXPRESSION'
,p_message_language=>'pt'
,p_message_text=>unistr('Express\00E3o do Filtro')
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141520906322752095)
,p_name=>'APEXIR_FILTER_EXPR_TOO_LONG'
,p_message_language=>'pt'
,p_message_text=>unistr('A express\00E3o do filtro \00E9 demasiado longa.')
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141365613861752049)
,p_name=>'APEXIR_FILTER_SUGGESTIONS'
,p_message_language=>'pt'
,p_message_text=>unistr('Filtrar sugest\00F5es')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141422630762752066)
,p_name=>'APEXIR_FILTER_TYPE'
,p_message_language=>'pt'
,p_message_text=>'Tipo de Filtro'
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141418605761752065)
,p_name=>'APEXIR_FINDER_ALT'
,p_message_language=>'pt'
,p_message_text=>'Selecionar colunas para pesquisar'
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141401243535752059)
,p_name=>'APEXIR_FLASHBACK'
,p_message_language=>'pt'
,p_message_text=>'Flashback'
,p_is_js_message=>true
,p_version_scn=>2705313
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141415855258752064)
,p_name=>'APEXIR_FLASHBACK_DESCRIPTION'
,p_message_language=>'pt'
,p_message_text=>unistr('Uma consulta de flashback permite-lhe visualizar os dados tal como existiam num per\00EDodo anterior.')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141469894922752080)
,p_name=>'APEXIR_FLASHBACK_LABEL'
,p_message_language=>'pt'
,p_message_text=>unistr('Dura\00E7\00E3o do Flashback')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141471277601752080)
,p_name=>'APEXIR_FORMAT'
,p_message_language=>'pt'
,p_message_text=>'Formatar'
,p_is_js_message=>true
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141397085651752058)
,p_name=>'APEXIR_FORMAT_MASK'
,p_message_language=>'pt'
,p_message_text=>unistr('M\00E1scara de Formato %0')
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141408736622752062)
,p_name=>'APEXIR_FUNCTION'
,p_message_language=>'pt'
,p_message_text=>unistr('Fun\00E7\00E3o')
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141416586422752064)
,p_name=>'APEXIR_FUNCTIONS'
,p_message_language=>'pt'
,p_message_text=>unistr('Fun\00E7\00F5es %0')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141494280056752087)
,p_name=>'APEXIR_FUNCTIONS_OPERATORS'
,p_message_language=>'pt'
,p_message_text=>unistr('Fun\00E7\00F5es/Operadores')
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141408450508752062)
,p_name=>'APEXIR_FUNCTION_N'
,p_message_language=>'pt'
,p_message_text=>unistr('Fun\00E7\00E3o %0')
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141400735969752059)
,p_name=>'APEXIR_GO'
,p_message_language=>'pt'
,p_message_text=>'Ir'
,p_version_scn=>2705313
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141374350309752051)
,p_name=>'APEXIR_GREEN'
,p_message_language=>'pt'
,p_message_text=>'verde'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141419318441752065)
,p_name=>'APEXIR_GROUPBY_COLUMNS'
,p_message_language=>'pt'
,p_message_text=>'Agrupar por Colunas'
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141419473659752065)
,p_name=>'APEXIR_GROUPBY_FUNCTIONS'
,p_message_language=>'pt'
,p_message_text=>unistr('Agrupar por Fun\00E7\00F5es')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141354679058752046)
,p_name=>'APEXIR_GROUP_BY'
,p_message_language=>'pt'
,p_message_text=>'Agrupar por'
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141495323291752087)
,p_name=>'APEXIR_GROUP_BY_COLUMN'
,p_message_language=>'pt'
,p_message_text=>'Agrupar Por Coluna %0'
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141450852756752074)
,p_name=>'APEXIR_GROUP_BY_COL_NOT_NULL'
,p_message_language=>'pt'
,p_message_text=>unistr('\00C9 necess\00E1rio especificar Agrupar por coluna.')
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141461943561752077)
,p_name=>'APEXIR_GROUP_BY_MAX_ROW_CNT'
,p_message_language=>'pt'
,p_message_text=>unistr('O n\00FAmero m\00E1ximo de linhas para uma consulta de Agrupar Por limita o n\00FAmero de linhas na consulta base e n\00E3o o n\00FAmero de linhas apresentadas. A sua consulta base excede o n\00FAmero m\00E1ximo de linhas de %0. Aplique um filtro para reduzir o n\00FAmero de regist')
||'os na sua consulta base.'
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141442141142752071)
,p_name=>'APEXIR_GROUP_BY_SORT'
,p_message_language=>'pt'
,p_message_text=>unistr('Ordena\00E7\00E3o de Agrupar Por')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141498897652752088)
,p_name=>'APEXIR_GROUP_BY_SORT_ORDER'
,p_message_language=>'pt'
,p_message_text=>unistr('Sequ\00EAncia de Ordena\00E7\00E3o de Agrupar Por')
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141343764370752042)
,p_name=>'APEXIR_GROUP_BY_VIEW_OF'
,p_message_language=>'pt'
,p_message_text=>unistr('Visualiza\00E7\00E3o de agrupar por de %0')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141379768025752053)
,p_name=>'APEXIR_HCOLUMN'
,p_message_language=>'pt'
,p_message_text=>'Coluna Horizontal'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141413776375752063)
,p_name=>'APEXIR_HELP'
,p_message_language=>'pt'
,p_message_text=>unistr('Aux\00EDlio')
,p_is_js_message=>true
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141405596138752061)
,p_name=>'APEXIR_HELP_01'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Os relat\00F3rios interativos permitem que os utilizadores finais customizem relat\00F3rios. Os utilizadores podem alterar a disposi\00E7\00E3o dos dados do relat\00F3rio ao selecionarem colunas, aplicarem filtros, destacarem e ordenarem. Os utilizadores tamb\00E9m podem de')
||unistr('finir quebras, agrega\00E7\00F5es, diagramas e agrupamentos, e acrescentarem c\00E1lculos pr\00F3prios. Os utilizadores tamb\00E9m podem configurar uma subscri\00E7\00E3o para que uma vers\00E3o em HTML do relat\00F3rio lhes seja enviada por email em intervalos de tempo especificados. ')
||unistr('Os utilizadores podem criar diferentes varia\00E7\00F5es de um relat\00F3rio e grav\00E1-las como relat\00F3rios nomeados para visualiza\00E7\00E3o p\00FAblica ou privada. '),
'<p/>',
unistr('As sec\00E7\00F5es a seguir resumem as formas de customiza\00E7\00E3o de um relat\00F3rio interativo. Para saber mais, consulte "Utilizar Relat\00F3rios Interativos" no <i>Oracle APEX End User''s Guide</i>.')))
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141412699465752063)
,p_name=>'APEXIR_HELP_ACTIONS_MENU'
,p_message_language=>'pt'
,p_message_text=>unistr('O menu A\00E7\00F5es aparece \00E0 direita do bot\00E3o Ir na barra de Pesquisa. Utilize este menu para customizar um relat\00F3rio interativo.')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141406385913752061)
,p_name=>'APEXIR_HELP_AGGREGATE'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('As agrega\00E7\00F5es s\00E3o c\00E1lculos matem\00E1ticos efetuados com base numa coluna. As agrega\00E7\00F5es s\00E3o apresentadas ap\00F3s cada controlo de interrup\00E7\00E3o e no fim do relat\00F3rio, na coluna onde est\00E3o definidas. As op\00E7\00F5es incluem:'),
'<p>',
'</p><ul>',
unistr('<li><strong>Agrega\00E7\00E3o</strong> permite-lhe selecionar uma agrega\00E7\00E3o'),
unistr('definida anteriormente para edi\00E7\00E3o.</li>'),
unistr('<li><strong>Fun\00E7\00E3o</strong> \00E9 a fun\00E7\00E3o a efetuar (por exemplo, SUM, MIN).</li>'),
unistr('<li><strong>Coluna</strong> \00E9 utilizada para selecionar a coluna \00E0 qual a fun\00E7\00E3o matem\00E1tica \00E9 aplicada. Apenas s\00E3o apresentadas'),
unistr('colunas num\00E9ricas.</li>'),
'</ul>'))
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141406405628752061)
,p_name=>'APEXIR_HELP_CHART'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Pode definir um diagrama por cada relat\00F3rio gravado. Conclu\00EDda'),
unistr('a defini\00E7\00E3o, pode alternar entre as visualiza\00E7\00F5es de diagrama e de relat\00F3rio com os \00EDcones de visualiza\00E7\00E3o na barra de Pesquisa.'),
unistr('As op\00E7\00F5es incluem:  '),
'<p>',
'</p><ul>',
'<li><strong>Tipo de Diagrama</strong> identifica o tipo de diagrama a incluir.',
'Selecione barra horizontal, barra vertical, sectograma ou linha.</li>',
'<li><strong>Etiqueta</strong> permite-lhe selecionar a coluna a utilizar como etiqueta.</li>',
unistr('<li><strong>T\00EDtulo do Eixo para Etiqueta</strong> \00E9 o t\00EDtulo apresentado no eixo associado \00E0 coluna selecionada para a'),
unistr('Etiqueta. N\00E3o est\00E1 dispon\00EDvel para sectogramas.</li>'),
unistr('<li><strong>Valor</strong> permite-lhe selecionar a coluna a utilizar como valor. Se a fun\00E7\00E3o'),
unistr('for COUNT, n\00E3o \00E9 necess\00E1rio selecionar um Valor.</li>'),
unistr('<li><strong>T\00EDtulo do Eixo para Valor</strong> \00E9 o t\00EDtulo apresentado no eixo associado \00E0 coluna selecionada para o'),
unistr('Valor. N\00E3o est\00E1 dispon\00EDvel para sectogramas.</li>'),
unistr('<li><strong>Fun\00E7\00E3o</strong> \00E9 uma fun\00E7\00E3o opcional a efetuar na coluna selecionada para o Valor.</li>'),
'<li><strong>Ordenar</strong> permite-lhe ordenar o conjunto de resultados.</li></ul>'))
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141405751516752061)
,p_name=>'APEXIR_HELP_COLUMN_HEADING_MENU'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Clicar num t\00EDtulo de coluna exp\00F5e um menu de t\00EDtulo de coluna. As op\00E7\00F5es incluem:'),
'<p></p>',
'<ul>',
unistr('<li>O \00EDcone <strong>Ordem Crescente</strong> ordena o relat\00F3rio pela coluna na ordem crescente.</li>'),
unistr('<li>O \00EDcone <strong>Ordem Decrescente</strong> ordena o relat\00F3rio pela coluna na ordem decrescente.</li>'),
unistr('<li><strong>Ocultar Coluna</strong> oculta a coluna. Nem todas as colunas podem ser ocultadas. Se n\00E3o for poss\00EDvel ocultar uma coluna, o \00EDcone Ocultar Coluna n\00E3o \00E9 apresentado.</li>'),
unistr('<li><strong>Quebrar Coluna</strong> cria um grupo de quebras na coluna. Isto extrai a coluna do relat\00F3rio como um registo mestre.</li>'),
unistr('<li><strong>Informa\00E7\00F5es da Coluna</strong> apresenta texto de aux\00EDlio sobre a coluna, se dispon\00EDvel.</li>'),
unistr('<li>A <strong>\00C1rea de Texto</strong> \00E9 utilizada para introduzir crit\00E9rios de pesquisa n\00E3o sens\00EDveis a mai\00FAsculas/min\00FAsculas'),
unistr('(sem necessidade de caracteres de substitui\00E7\00E3o). A introdu\00E7\00E3o de um valor reduz a lista de'),
'valores na parte inferior do menu. Em seguida, pode selecionar um valor na',
unistr('parte inferior e o valor selecionado ser\00E1 criado como um filtro com ''='''),
unistr('(por exemplo, <code>coluna = ''ABC''</code>). Em alternativa, pode clicar no \00EDcone Lanterna e introduzir um valor para ser criado como um filtro com o modificador ''SEMELHANTE A'''),
'(por exemplo, <code>coluna SEMELHANTE A ''%ABC%''</code>).</li>',
unistr('<li>A <strong>Lista de Valores Exclusivos</strong> cont\00E9m os primeiros 500 valores'),
unistr('exclusivos correspondentes aos crit\00E9rios do filtro. Se a coluna for uma data, \00E9 apresentada'),
unistr('uma lista de intervalos de datas. Se selecionar um valor, ser\00E1 criado um filtro'),
'com ''='' (por exemplo, <code>coluna = ''ABC''</code>).</li>',
'</ul>'))
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141406260387752061)
,p_name=>'APEXIR_HELP_COMPUTE'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Permite-lhe acrescentar colunas calculadas ao relat\00F3rio. Podem ser c\00E1lculos matem\00E1ticos (por exemplo, <code>NBR_HOURS/24</code>) ou fun\00E7\00F5es Oracle standard'),
unistr('aplicadas a colunas existentes. Alguns s\00E3o apresentados como exemplos e outros (como <code>TO_DATE)</code> tamb\00E9m podem ser utilizados). As op\00E7\00F5es incluem:'),
'<p></p>',
'<ul>',
unistr('<li><strong>C\00E1lculo</strong> permite-lhe selecionar um c\00E1lculo definido anteriormente para edi\00E7\00E3o.</li>'),
unistr('<li><strong>T\00EDtulo da Coluna</strong> \00E9 o t\00EDtulo da coluna para a nova coluna.</li>'),
unistr('<li><strong>M\00E1scara de Formato</strong> \00E9 uma m\00E1scara de formato Oracle a ser aplicada \00E0 coluna (por exemplo,S9999).</li>'),
unistr('<li><strong>C\00E1lculo</strong> \00E9 o c\00E1lculo a efetuar. No c\00E1lculo, as colunas s\00E3o referenciadas com os pseud\00F3nimos apresentados.</li>'),
'</ul>',
unistr('<p>Abaixo do c\00E1lculo, as colunas da consulta s\00E3o apresentadas com'),
unistr('o respetivo pseud\00F3nimo associado. Ao clicar no nome ou pseud\00F3nimo da coluna, inclui-a'),
unistr('no C\00E1lculo. Existe um teclado junto \00E0s Colunas. Este teclado funciona como'),
unistr('um atalho para teclas utilizadas frequentemente. Na extremidade direita, encontra as Fun\00E7\00F5es.</p>'),
unistr('<p>O c\00E1lculo de exemplo a seguir demonstra como apresentar a remunera\00E7\00E3o total:</p>'),
'<pre>CASE WHEN A = ''SALES'' THEN B + C ELSE B END</pre>',
unistr('(em que A \00E9 ORGANIZATION, B \00E9 SALARY e C \00E9 COMMISSION)'),
''))
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141412716386752063)
,p_name=>'APEXIR_HELP_CONTROL_BREAK'
,p_message_language=>'pt'
,p_message_text=>unistr('Utilizado para criar um grupo de quebras numa ou mais colunas. Retira as colunas do relat\00F3rio interativo e apresenta-as como um registo mestre.')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141406944675752061)
,p_name=>'APEXIR_HELP_DETAIL_VIEW'
,p_message_language=>'pt'
,p_message_text=>unistr('Para ver os detalhes de uma s\00F3 linha de cada vez, clique no \00EDcone de visualiza\00E7\00E3o de linha \00FAnica na linha que pretende visualizar. Se estiver dispon\00EDvel, a visualiza\00E7\00E3o de linha \00FAnica ser\00E1 sempre a primeira coluna. Consoante a customiza\00E7\00E3o do relat\00F3r')
||unistr('io interativo, a visualiza\00E7\00E3o de linha \00FAnica pode ser a visualiza\00E7\00E3o standard ou uma p\00E1gina customizada que pode permitir a atualiza\00E7\00E3o.')
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141406896329752061)
,p_name=>'APEXIR_HELP_DOWNLOAD'
,p_message_language=>'pt'
,p_message_text=>unistr('Permite que o conjunto de resultados atual seja descarregado. Os formatos de descarregamento incluem PDF, Excel, HTML e CSV. As op\00E7\00F5es de descarregamento diferem consoante o formato selecionado. Todos os formatos podem tamb\00E9m ser enviados como mensag')
||'ens de e-mail.'
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141405972889752061)
,p_name=>'APEXIR_HELP_FILTER'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Foca o relat\00F3rio ao acrescentar ou modificar a cl\00E1usula <code>WHERE</code> na consulta. Pode filtrar por coluna ou por linha.  '),
unistr('<p>Se filtrar por coluna, selecione uma coluna (n\00E3o precisa de ser'),
unistr('uma das colunas apresentadas), selecione um operador Oracle standard (=, !=, n\00E3o est\00E1 em, entre) e introduza uma express\00E3o para compara\00E7\00E3o. As express\00F5es s\00E3o sens\00EDveis a mai\00FAsculas/min\00FAsculas. Utilize % como car\00E1cter de substitui\00E7\00E3o (por exemplo, <co')
||'de>STATE_NAME',
'semelhante a A%)</code>.</p>',
unistr('<p>Se filtrar por linha, pode criar cl\00E1usulas <code>WHERE</code> complexas com'),
unistr('pseud\00F3nimos de colunas e quaisquer operadores ou fun\00E7\00F5es Oracle (por exemplo, <code>G = ''VA'' ou G = ''CT''</code>, em que'),
unistr('<code>G</code> \00E9 o pseud\00F3nimo de <code>CUSTOMER_STATE</code>).</p>'),
''))
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141406583877752061)
,p_name=>'APEXIR_HELP_FLASHBACK'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Uma consulta de flashback permite-lhe visualizar os dados tal como existiam num per\00EDodo'),
unistr('anterior. A quantidade de tempo por omiss\00E3o para o flashback \00E9 de 3 horas (ou 180'),
unistr('minutos), mas a quantidade real ser\00E1 diferente para cada base de dados.')))
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141471133705752080)
,p_name=>'APEXIR_HELP_FORMAT'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Formatar permite-lhe customizar a apresenta\00E7\00E3o do relat\00F3rio.'),
unistr('Formatar cont\00E9m o seguinte submenu:</p>'),
'<ul><li>Ordenar</li>',
unistr('<li>Controlo de Interrup\00E7\00E3o</li>'),
'<li>Destacar</li>',
'<li>Calcular</li>',
'<li>Agregar</li>',
'<li>Diagrama</li>',
'<li>Agrupar Por</li>',
unistr('<li>Din\00E2mica</li>'),
'</ul>',
''))
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141469340065752079)
,p_name=>'APEXIR_HELP_GROUP_BY'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Pode definir uma visualiza\00E7\00E3o Agrupar Por para cada relat\00F3rio'),
unistr('gravado. Ap\00F3s a defini\00E7\00E3o, pode alternar entre as visualiza\00E7\00F5es'),
unistr('agrupar por e relat\00F3rio ao utilizar os \00EDcones de visualiza\00E7\00E3o na barra de Pesquisa. Para criar uma visualiza\00E7\00E3o Agrupar Por,'),
'selecione:',
'<p></p><ul>',
'<li>as colunas para agrupar</li>',
unistr('<li>as colunas a agregar com a fun\00E7\00E3o a efetuar (m\00E9dia, soma, contagem, etc.)</li>'),
'</ul>'))
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141406168008752061)
,p_name=>'APEXIR_HELP_HIGHLIGHT'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Permite-lhe definir um filtro. As linhas que cumprem os crit\00E9rios do filtro s\00E3o destacadas com as caracter\00EDsticas associadas ao filtro. As op\00E7\00F5es incluem:</p>'),
'<ul>',
unistr('<li>O <strong>Nome</strong> \00E9 utilizado apenas para apresenta\00E7\00E3o.</li>'),
unistr('<li>A <strong>Sequ\00EAncia</strong> identifica a sequ\00EAncia de avalia\00E7\00E3o das regras.</li>'),
unistr('<li>A op\00E7\00E3o <strong>Ativado</strong> identifica se uma regra est\00E1 ativada ou desativada.</li>'),
unistr('<li>O <strong>Tipo de Destaque</strong> identifica se a linha ou a c\00E9lula deve ser'),
unistr('destacada. Se selecionar C\00E9lula, a coluna referenciada na'),
unistr('Condi\00E7\00E3o de Destaque \00E9 destacada.</li>'),
unistr('<li>A <strong>Cor de Segundo Plano</strong> \00E9 a nova cor do segundo plano da \00E1rea destacada.</li>'),
unistr('<li>A <strong>Cor do Texto</strong> \00E9 a nova cor do texto na \00E1rea destacada.</li>'),
unistr('<li>A <strong>Condi\00E7\00E3o de Destaque</strong> define a condi\00E7\00E3o do filtro.</li>'),
'</ul>',
''))
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141299531272752029)
,p_name=>'APEXIR_HELP_PIVOT'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Pode definir uma visualiza\00E7\00E3o Din\00E2mica por relat\00F3rio gravado. Depois de definir a visualiza\00E7\00E3o, pode alternar entre as visualiza\00E7\00F5es de relat\00F3rio e din\00E2mica ao utilizar os \00EDcones de visualiza\00E7\00E3o dispon\00EDveis na barra de Pesquisa. Para criar uma visual')
||unistr('iza\00E7\00E3o Din\00E2mica, selecione: '),
'<p></p>',
'<ul>',
unistr('<li>as colunas din\00E2micas</li>'),
'<li>as colunas a apresentar como linhas</li>',
unistr('<li>as colunas a agregar com a fun\00E7\00E3o a efetuar (m\00E9dia, soma, contagem, etc.)</li>'),
'</ul>'))
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141417255728752064)
,p_name=>'APEXIR_HELP_REPORT_SETTINGS'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Se customizar um relat\00F3rio interativo, as defini\00E7\00F5es do relat\00F3rio s\00E3o apresentadas'),
unistr('abaixo da barra de Pesquisa e acima do relat\00F3rio. Esta \00E1rea pode ser contra\00EDda ou expandida com o \00EDcone \00E0 esquerda.'),
'<p>',
unistr('Para cada defini\00E7\00E3o do relat\00F3rio, pode:'),
'</p><ul>',
unistr('<li>Editar uma defini\00E7\00E3o ao clicar no nome.</li>'),
unistr('<li>Desativar/Ativar uma defini\00E7\00E3o ao anular a sele\00E7\00E3o ou ao selecionar a caixa de sele\00E7\00E3o Ativar/Desativar. Utilize este controlo para desativar ou ativar temporariamente uma defini\00E7\00E3o.</li>'),
unistr('<li>Retirar uma defini\00E7\00E3o ao clicar no \00EDcone Retirar.</li>'),
'</ul>',
unistr('<p>Se tiver criado um diagrama, agrupar por ou din\00E2mica, pode alternar entre eles'),
unistr('e o relat\00F3rio base atrav\00E9s das liga\00E7\00F5es Visualiza\00E7\00E3o de Relat\00F3rio, Visualiza\00E7\00E3o de Diagrama, Visualiza\00E7\00E3o Agrupar Por e Visualiza\00E7\00E3o Din\00E2mica'),
unistr('mostradas \00E0 direita. Se est\00E1 a visualizar o diagrama, agrupar por ou din\00E2mica, tamb\00E9m'),
unistr('pode utilizar a liga\00E7\00E3o Editar para editar as defini\00E7\00F5es.</p>'),
''))
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141406791319752061)
,p_name=>'APEXIR_HELP_RESET'
,p_message_language=>'pt'
,p_message_text=>unistr('Redefine o relat\00F3rio para as defini\00E7\00F5es por omiss\00E3o ao retirar todas as customiza\00E7\00F5es que efetuou.')
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141471456684752080)
,p_name=>'APEXIR_HELP_ROWS_PER_PAGE'
,p_message_language=>'pt'
,p_message_text=>unistr('Define o n\00FAmero de registos a apresentar por p\00E1gina.')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141406605550752061)
,p_name=>'APEXIR_HELP_SAVE_REPORT'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Grava o relat\00F3rio customizado para utiliza\00E7\00E3o futura. Fornece um nome e uma descri\00E7\00E3o opcional e pode tornar o relat\00F3rio acess\00EDvel ao p\00FAblico (ou seja, a todos os utilizadores que podem aceder ao relat\00F3rio por omiss\00E3o principal). Pode gravar quatr')
||unistr('o tipos de relat\00F3rios interativos:</p>'),
'<ul>',
unistr('<li><strong>Por Omiss\00E3o Principal</strong> (Apenas para Programadores). O relat\00F3rio Por Omiss\00E3o Principal \00E9 o relat\00F3rio apresentado inicialmente. O relat\00F3rio Por Omiss\00E3o Principal n\00E3o pode ser renomeado nem apagado.</li>'),
unistr('<li><strong>Relat\00F3rio Alternativo</strong> (Apenas para Programadores). Permite que os programadores criem v\00E1rias disposi\00E7\00F5es de relat\00F3rios. Um relat\00F3rio Alternativo s\00F3 pode ser gravado, renomeado ou apagado por um programador.</li>'),
unistr('<li><strong>Relat\00F3rio P\00FAblico</strong> (Utilizador final). Pode ser gravado, renomeado ou apagado pelo utilizador final que o criou. Outros utilizadores podem visualizar e gravar a disposi\00E7\00E3o como outro relat\00F3rio.</li>'),
unistr('<li><strong>Relat\00F3rio Privado</strong> (Utilizador final). O relat\00F3rio s\00F3 pode ser visualizado, gravado, renomeado ou apagado pelo utilizador final que o criou.</li>'),
'</ul>',
unistr('<p>Se gravar relat\00F3rios customizados, um seletor de Relat\00F3rios \00E9 apresentado na barra de Pesquisa \00E0 esquerda do seletor de Linhas (se esta funcionalidade estiver ativada).</p>'),
''))
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141405649157752061)
,p_name=>'APEXIR_HELP_SEARCH_BAR'
,p_message_language=>'pt'
,p_message_text=>unistr('Encontra uma regi\00E3o de pesquisa no in\00EDcio de cada p\00E1gina do relat\00F3rio. Esta regi\00E3o (ou barra de Pesquisa) fornece as seguintes funcionalidades:')
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141472029622752080)
,p_name=>'APEXIR_HELP_SEARCH_BAR_ACTIONS_MENU'
,p_message_language=>'pt'
,p_message_text=>unistr('<li>O <strong>Menu A\00E7\00F5es</strong> permite-lhe customizar um relat\00F3rio. Consulte as sec\00E7\00F5es a seguir.</li>')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141471507324752080)
,p_name=>'APEXIR_HELP_SEARCH_BAR_FINDER'
,p_message_language=>'pt'
,p_message_text=>unistr('<li>O <strong>\00EDcone Selecionar colunas</strong> permite-lhe identificar as colunas a pesquisar (ou todas).</li>')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141471895942752080)
,p_name=>'APEXIR_HELP_SEARCH_BAR_REPORTS'
,p_message_language=>'pt'
,p_message_text=>unistr('<li><strong>Relat\00F3rios</strong> apresenta os relat\00F3rios privados e p\00FAblicos gravados e por omiss\00E3o alternativos.</li>')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141471771508752080)
,p_name=>'APEXIR_HELP_SEARCH_BAR_ROWS'
,p_message_language=>'pt'
,p_message_text=>unistr('<li><strong>Linhas</strong> define o n\00FAmero de registos a apresentar por p\00E1gina.</li>')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141471677670752080)
,p_name=>'APEXIR_HELP_SEARCH_BAR_TEXTBOX'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<li>A <strong>\00C1rea de texto</strong> permite-lhe introduzir crit\00E9rios de pesquisa n\00E3o sens\00EDveis a mai\00FAsculas/min\00FAsculas (incluindo caracteres de substitui\00E7\00E3o).</li>'),
unistr('<li>O <strong>bot\00E3o Ir</strong> executa a pesquisa. Premir a tecla enter tamb\00E9m executa a pesquisa quando o cursor est\00E1 na \00E1rea de texto da pesquisa.</li>')))
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141471932951752080)
,p_name=>'APEXIR_HELP_SEARCH_BAR_VIEW'
,p_message_language=>'pt'
,p_message_text=>unistr('<li>Os <strong>\00CDcones de Visualiza\00E7\00F5es</strong> alternam entre as visualiza\00E7\00F5es de \00EDcone, relat\00F3rio, detalhe, diagrama, agrupar por e din\00E2mica do relat\00F3rio caso estejam definidas.</li>')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141405802814752061)
,p_name=>'APEXIR_HELP_SELECT_COLUMNS'
,p_message_language=>'pt'
,p_message_text=>unistr('Utilizado para modificar as colunas apresentadas. S\00E3o apresentadas as colunas \00E0 direita. As colunas \00E0 esquerda s\00E3o ocultadas. Pode reordenar as colunas apresentadas com as setas na extremidade direita. As colunas calculadas t\00EAm o prefixo <strong>**</')
||'strong>.'
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141406041570752061)
,p_name=>'APEXIR_HELP_SORT'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Utilizado para alterar as colunas para ordena\00E7\00E3o e determina a utiliza\00E7\00E3o da'),
unistr('ordem crescente ou da ordem decrescente. Tamb\00E9m pode especificar como os'),
unistr('<code>NULLs</code> s\00E3o processados. A defini\00E7\00E3o por omiss\00E3o apresenta sempre os <code>NULLs</code> em \00FAltimo lugar ou sempre em primeiro lugar. A ordena\00E7\00E3o resultante \00E9 apresentada \00E0 direita dos'),
unistr('t\00EDtulos das colunas no relat\00F3rio.</p>')))
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141469169768752079)
,p_name=>'APEXIR_HELP_SUBSCRIPTION'
,p_message_language=>'pt'
,p_message_text=>unistr('Quando acrescenta uma subscri\00E7\00E3o, fornece um endere\00E7o de email (ou v\00E1rios endere\00E7os de email separados por v\00EDrgulas), o assunto da mensagem de email, a frequ\00EAncia e as datas de in\00EDcio e fim. As mensagens de email resultantes incluem uma vers\00E3o export')
||unistr('ada (em PDF, Excel, HTML ou CSV) do relat\00F3rio interativo que cont\00E9m os dados atuais que utilizam as defini\00E7\00F5es do relat\00F3rio existentes quando a subscri\00E7\00E3o foi acrescentada.')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141410704337752062)
,p_name=>'APEXIR_HIDE_COLUMN'
,p_message_language=>'pt'
,p_message_text=>'Ocultar Coluna'
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141401107619752059)
,p_name=>'APEXIR_HIGHLIGHT'
,p_message_language=>'pt'
,p_message_text=>'Destacar'
,p_is_js_message=>true
,p_version_scn=>2705313
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141412298274752063)
,p_name=>'APEXIR_HIGHLIGHTS'
,p_message_language=>'pt'
,p_message_text=>'Destaques'
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141382475105752054)
,p_name=>'APEXIR_HIGHLIGHT_CELL_WITH_COLORS'
,p_message_language=>'pt'
,p_message_text=>unistr('Destacar C\00E9lula %0 em %1')
,p_version_scn=>2705310
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141417324699752064)
,p_name=>'APEXIR_HIGHLIGHT_CONDITION'
,p_message_language=>'pt'
,p_message_text=>unistr('Condi\00E7\00E3o de Destaque')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141382333784752054)
,p_name=>'APEXIR_HIGHLIGHT_ROW_WITH_COLORS'
,p_message_language=>'pt'
,p_message_text=>'Destacar Linha %0 em %1'
,p_version_scn=>2705310
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141469739670752080)
,p_name=>'APEXIR_HIGHLIGHT_STYLE'
,p_message_language=>'pt'
,p_message_text=>'Estilo do Destaque'
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141373954848752051)
,p_name=>'APEXIR_HIGHLIGHT_TYPE'
,p_message_language=>'pt'
,p_message_text=>'Tipo de Destaque'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141488527554752085)
,p_name=>'APEXIR_HORIZONTAL'
,p_message_language=>'pt'
,p_message_text=>'Horizontal'
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141517561058752094)
,p_name=>'APEXIR_INACTIVE_SETTING'
,p_message_language=>'pt'
,p_message_text=>unistr('1 defini\00E7\00E3o inativa')
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141517677214752094)
,p_name=>'APEXIR_INACTIVE_SETTINGS'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 defini\00E7\00F5es inativas')
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141407390712752061)
,p_name=>'APEXIR_INTERACTIVE_REPORT_HELP'
,p_message_language=>'pt'
,p_message_text=>unistr('Aux\00EDlio do Relat\00F3rio Interativo')
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141418369249752064)
,p_name=>'APEXIR_INVALID'
,p_message_language=>'pt'
,p_message_text=>unistr('Inv\00E1lido')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141411766900752063)
,p_name=>'APEXIR_INVALID_COMPUTATION'
,p_message_language=>'pt'
,p_message_text=>unistr('Express\00E3o de c\00E1lculo inv\00E1lida. %0')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141367312922752049)
,p_name=>'APEXIR_INVALID_END_DATE'
,p_message_language=>'pt'
,p_message_text=>unistr('A data de fim deve ser posterior \00E0 data de in\00EDcio.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141426525418752067)
,p_name=>'APEXIR_INVALID_FILTER'
,p_message_language=>'pt'
,p_message_text=>unistr('Express\00E3o de filtro inv\00E1lida. %0')
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141496320218752087)
,p_name=>'APEXIR_INVALID_FILTER_QUERY'
,p_message_language=>'pt'
,p_message_text=>unistr('Consulta de filtro inv\00E1lida')
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141517777793752094)
,p_name=>'APEXIR_INVALID_SETTING'
,p_message_language=>'pt'
,p_message_text=>unistr('1 defini\00E7\00E3o inv\00E1lida')
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141517837062752094)
,p_name=>'APEXIR_INVALID_SETTINGS'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 defini\00E7\00F5es inv\00E1lidas')
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141469948238752080)
,p_name=>'APEXIR_IN_MINUTES'
,p_message_language=>'pt'
,p_message_text=>'(em minutos)'
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141486975926752085)
,p_name=>'APEXIR_IS_IN_THE_LAST'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 est\00E1 no \00FAltimo intervalo de %1')
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141487176806752085)
,p_name=>'APEXIR_IS_IN_THE_NEXT'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 est\00E1 no pr\00F3ximo intervalo de %1')
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141487045114752085)
,p_name=>'APEXIR_IS_NOT_IN_THE_LAST'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 n\00E3o est\00E1 no \00FAltimo intervalo de %1')
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141487255656752085)
,p_name=>'APEXIR_IS_NOT_IN_THE_NEXT'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 n\00E3o est\00E1 no pr\00F3ximo intervalo de %1')
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141416450047752064)
,p_name=>'APEXIR_KEYPAD'
,p_message_language=>'pt'
,p_message_text=>'Teclado'
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141380143514752053)
,p_name=>'APEXIR_LABEL'
,p_message_language=>'pt'
,p_message_text=>'Etiqueta %0'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141410378537752062)
,p_name=>'APEXIR_LABEL_AXIS_TITLE'
,p_message_language=>'pt'
,p_message_text=>unistr('T\00EDtulo do Eixo para Etiqueta')
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141402609967752060)
,p_name=>'APEXIR_LAST_DAY'
,p_message_language=>'pt'
,p_message_text=>unistr('\00DAltimo Dia')
,p_version_scn=>2705313
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141402830016752060)
,p_name=>'APEXIR_LAST_HOUR'
,p_message_language=>'pt'
,p_message_text=>unistr('\00DAltima Hora')
,p_version_scn=>2705313
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141402327340752060)
,p_name=>'APEXIR_LAST_MONTH'
,p_message_language=>'pt'
,p_message_text=>unistr('\00DAltimo M\00EAs')
,p_version_scn=>2705313
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141402458172752060)
,p_name=>'APEXIR_LAST_WEEK'
,p_message_language=>'pt'
,p_message_text=>unistr('\00DAltima Semana')
,p_version_scn=>2705313
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141402556454752060)
,p_name=>'APEXIR_LAST_X_DAYS'
,p_message_language=>'pt'
,p_message_text=>unistr('\00DAltimos %0 Dias')
,p_version_scn=>2705313
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141402772932752060)
,p_name=>'APEXIR_LAST_X_HOURS'
,p_message_language=>'pt'
,p_message_text=>unistr('\00DAltimas %0 Horas')
,p_version_scn=>2705313
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141402183173752060)
,p_name=>'APEXIR_LAST_X_YEARS'
,p_message_language=>'pt'
,p_message_text=>unistr('\00DAltimos %0 Anos')
,p_version_scn=>2705313
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141402243678752060)
,p_name=>'APEXIR_LAST_YEAR'
,p_message_language=>'pt'
,p_message_text=>unistr('\00DAltimo Ano')
,p_version_scn=>2705313
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141380065717752053)
,p_name=>'APEXIR_LINE'
,p_message_language=>'pt'
,p_message_text=>'Linha'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141376838616752052)
,p_name=>'APEXIR_LINE_WITH_AREA'
,p_message_language=>'pt'
,p_message_text=>unistr('Linha com \00C1rea')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141496267902752087)
,p_name=>'APEXIR_MAP_IT'
,p_message_language=>'pt'
,p_message_text=>unistr('Localiza\00E7\00E3o no Mapa')
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141411227554752062)
,p_name=>'APEXIR_MAX_QUERY_COST'
,p_message_language=>'pt'
,p_message_text=>unistr('Estima-se que a consulta exceda o m\00E1ximo de recursos permitidos. Modifique as defini\00E7\00F5es do relat\00F3rio e tente novamente.')
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141392613044752057)
,p_name=>'APEXIR_MAX_ROW_CNT'
,p_message_language=>'pt'
,p_message_text=>unistr('O n\00FAmero m\00E1ximo de linhas para este relat\00F3rio \00E9 %0 linhas. Aplique um filtro para reduzir o n\00FAmero de registos na sua consulta.')
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141496838455752088)
,p_name=>'APEXIR_MAX_X'
,p_message_language=>'pt'
,p_message_text=>unistr('M\00E1ximo %0')
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141497018676752088)
,p_name=>'APEXIR_MEDIAN_X'
,p_message_language=>'pt'
,p_message_text=>'Mediano %0'
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141339350501752041)
,p_name=>'APEXIR_MESSAGE'
,p_message_language=>'pt'
,p_message_text=>'Mensagem'
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141396918004752058)
,p_name=>'APEXIR_MIN_AGO'
,p_message_language=>'pt'
,p_message_text=>unistr('h\00E1 %0 minutos')
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141496979500752088)
,p_name=>'APEXIR_MIN_X'
,p_message_language=>'pt'
,p_message_text=>unistr('M\00EDnimo %0')
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141495922302752087)
,p_name=>'APEXIR_MONTH'
,p_message_language=>'pt'
,p_message_text=>unistr('M\00EAs')
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141470309183752080)
,p_name=>'APEXIR_MONTHLY'
,p_message_language=>'pt'
,p_message_text=>'Mensal'
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141409597239752062)
,p_name=>'APEXIR_MOVE'
,p_message_language=>'pt'
,p_message_text=>'Deslocar'
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141409475326752062)
,p_name=>'APEXIR_MOVE_ALL'
,p_message_language=>'pt'
,p_message_text=>'Deslocar Todos'
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141522694628752095)
,p_name=>'APEXIR_MULTIIR_PAGE_REGION_STATIC_ID_REQUIRED'
,p_message_language=>'pt'
,p_message_text=>unistr('A ID Est\00E1tica da Regi\00E3o deve ser especificada dado que a p\00E1gina cont\00E9m v\00E1rios relat\00F3rios interativos.')
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141375540468752052)
,p_name=>'APEXIR_NAME'
,p_message_language=>'pt'
,p_message_text=>'Nome'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141405215226752061)
,p_name=>'APEXIR_NEW_AGGREGATION'
,p_message_language=>'pt'
,p_message_text=>unistr('Nova Agrega\00E7\00E3o')
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141518455710752094)
,p_name=>'APEXIR_NEW_CATEGORY_LABEL'
,p_message_language=>'pt'
,p_message_text=>'Nova Categoria'
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141405325083752061)
,p_name=>'APEXIR_NEW_COMPUTATION'
,p_message_language=>'pt'
,p_message_text=>unistr('Novo C\00E1lculo')
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141400077296752059)
,p_name=>'APEXIR_NEXT'
,p_message_language=>'pt'
,p_message_text=>'Seguinte'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141403139017752060)
,p_name=>'APEXIR_NEXT_DAY'
,p_message_language=>'pt'
,p_message_text=>'Dia Seguinte'
,p_version_scn=>2705313
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141402958050752060)
,p_name=>'APEXIR_NEXT_HOUR'
,p_message_language=>'pt'
,p_message_text=>unistr('Pr\00F3xima hora')
,p_version_scn=>2705313
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141403485941752060)
,p_name=>'APEXIR_NEXT_MONTH'
,p_message_language=>'pt'
,p_message_text=>unistr('Pr\00F3ximo M\00EAs')
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141403307796752060)
,p_name=>'APEXIR_NEXT_WEEK'
,p_message_language=>'pt'
,p_message_text=>unistr('Pr\00F3xima Semana')
,p_version_scn=>2705313
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141403278210752060)
,p_name=>'APEXIR_NEXT_X_DAYS'
,p_message_language=>'pt'
,p_message_text=>unistr('Pr\00F3ximos %0 Dias')
,p_version_scn=>2705313
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141403078557752060)
,p_name=>'APEXIR_NEXT_X_HOURS'
,p_message_language=>'pt'
,p_message_text=>unistr('Pr\00F3ximas %0 Horas')
,p_version_scn=>2705313
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141403671778752060)
,p_name=>'APEXIR_NEXT_X_YEARS'
,p_message_language=>'pt'
,p_message_text=>unistr('Pr\00F3ximos %0 Anos')
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141403560355752060)
,p_name=>'APEXIR_NEXT_YEAR'
,p_message_language=>'pt'
,p_message_text=>unistr('Pr\00F3ximo Ano')
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141375872790752052)
,p_name=>'APEXIR_NO'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141418576211752064)
,p_name=>'APEXIR_NONE'
,p_message_language=>'pt'
,p_message_text=>'- Nenhum -'
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141469542835752080)
,p_name=>'APEXIR_NOT_VALID_EMAIL'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o \00E9 um endere\00E7o de email v\00E1lido.')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141341611581752042)
,p_name=>'APEXIR_NO_COLUMNS_SELECTED'
,p_message_language=>'pt'
,p_message_text=>unistr('Nenhuma coluna selecionada para apresenta\00E7\00E3o. Utilize as <strong>Colunas</strong> no Menu A\00E7\00E3o para tornar as colunas vis\00EDveis.')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141415025047752063)
,p_name=>'APEXIR_NULLS_ALWAYS_FIRST'
,p_message_language=>'pt'
,p_message_text=>unistr('Nulos Sempre no In\00EDcio')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141414908257752063)
,p_name=>'APEXIR_NULLS_ALWAYS_LAST'
,p_message_language=>'pt'
,p_message_text=>'Nulos Sempre no Fim'
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141415445023752064)
,p_name=>'APEXIR_NULL_SORTING'
,p_message_language=>'pt'
,p_message_text=>unistr('Ordena\00E7\00E3o de Nulos %0')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141411867037752063)
,p_name=>'APEXIR_NUMERIC_FLASHBACK_TIME'
,p_message_language=>'pt'
,p_message_text=>unistr('\00C9 necess\00E1rio que o tempo de flashback seja num\00E9rico.')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141411451785752062)
,p_name=>'APEXIR_NUMERIC_SEQUENCE'
,p_message_language=>'pt'
,p_message_text=>unistr('\00C9 necess\00E1rio que a sequ\00EAncia seja num\00E9rica.')
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141415990664752064)
,p_name=>'APEXIR_OPERATOR'
,p_message_language=>'pt'
,p_message_text=>'Operador'
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141374445764752051)
,p_name=>'APEXIR_ORANGE'
,p_message_language=>'pt'
,p_message_text=>'laranja'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141488410256752085)
,p_name=>'APEXIR_ORIENTATION'
,p_message_language=>'pt'
,p_message_text=>unistr('Orienta\00E7\00E3o')
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141376326934752052)
,p_name=>'APEXIR_OTHER'
,p_message_language=>'pt'
,p_message_text=>'Outro'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141342576992752042)
,p_name=>'APEXIR_PAGINATION_OF'
,p_message_language=>'pt'
,p_message_text=>unistr('Pagina\00E7\00E3o de %0')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141356507263752046)
,p_name=>'APEXIR_PDF_ORIENTATION'
,p_message_language=>'pt'
,p_message_text=>unistr('Orienta\00E7\00E3o da p\00E1gina')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141357295726752046)
,p_name=>'APEXIR_PDF_ORIENTATION_HORIZONTAL'
,p_message_language=>'pt'
,p_message_text=>'Horizontal'
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141357398452752046)
,p_name=>'APEXIR_PDF_ORIENTATION_VERTICAL'
,p_message_language=>'pt'
,p_message_text=>'Vertical'
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141356430749752046)
,p_name=>'APEXIR_PDF_PAGE_SIZE'
,p_message_language=>'pt'
,p_message_text=>unistr('Tamanho da p\00E1gina')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141357064458752046)
,p_name=>'APEXIR_PDF_PAGE_SIZE_A3'
,p_message_language=>'pt'
,p_message_text=>'A3'
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141356983667752046)
,p_name=>'APEXIR_PDF_PAGE_SIZE_A4'
,p_message_language=>'pt'
,p_message_text=>'A4'
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141357162220752046)
,p_name=>'APEXIR_PDF_PAGE_SIZE_CUSTOM'
,p_message_language=>'pt'
,p_message_text=>'Customizado'
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141356796452752046)
,p_name=>'APEXIR_PDF_PAGE_SIZE_LEGAL'
,p_message_language=>'pt'
,p_message_text=>'Legal'
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141356686719752046)
,p_name=>'APEXIR_PDF_PAGE_SIZE_LETTER'
,p_message_language=>'pt'
,p_message_text=>'Letter'
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141356869473752046)
,p_name=>'APEXIR_PDF_PAGE_SIZE_TABLOID'
,p_message_language=>'pt'
,p_message_text=>'Tabloid'
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141497370751752088)
,p_name=>'APEXIR_PERCENT_OF_TOTAL_COUNT_X'
,p_message_language=>'pt'
,p_message_text=>'Percentagem da Contagem Total %0 (%)'
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141496560782752087)
,p_name=>'APEXIR_PERCENT_OF_TOTAL_SUM_X'
,p_message_language=>'pt'
,p_message_text=>'Percentagem da Soma Total %0 (%)'
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141495552094752087)
,p_name=>'APEXIR_PERCENT_TOTAL_COUNT'
,p_message_language=>'pt'
,p_message_text=>'Percentagem da Contagem Total'
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141495468357752087)
,p_name=>'APEXIR_PERCENT_TOTAL_SUM'
,p_message_language=>'pt'
,p_message_text=>'Percentagem da Soma Total'
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141379983778752053)
,p_name=>'APEXIR_PIE'
,p_message_language=>'pt'
,p_message_text=>'Sectograma'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141445649746752073)
,p_name=>'APEXIR_PIVOT'
,p_message_language=>'pt'
,p_message_text=>unistr('Din\00E2mica')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141447118183752073)
,p_name=>'APEXIR_PIVOT_AGG_NOT_NULL'
,p_message_language=>'pt'
,p_message_text=>unistr('\00C9 necess\00E1rio especificar a agrega\00E7\00E3o.')
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141447340155752073)
,p_name=>'APEXIR_PIVOT_AGG_NOT_ON_ROW_COL'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o pode efetuar a agrega\00E7\00E3o numa coluna selecionada como coluna da linha.')
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141446574422752073)
,p_name=>'APEXIR_PIVOT_COLUMNS'
,p_message_language=>'pt'
,p_message_text=>unistr('Colunas Din\00E2micas')
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141446382504752073)
,p_name=>'APEXIR_PIVOT_COLUMN_N'
,p_message_language=>'pt'
,p_message_text=>unistr('Coluna Din\00E2mica %0')
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141446923085752073)
,p_name=>'APEXIR_PIVOT_COLUMN_NOT_NULL'
,p_message_language=>'pt'
,p_message_text=>unistr('\00C9 necess\00E1rio especificar a coluna din\00E2mica.')
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141299403065752029)
,p_name=>'APEXIR_PIVOT_MAX_ROW_CNT'
,p_message_language=>'pt'
,p_message_text=>unistr('O n\00FAmero m\00E1ximo de linhas para uma consulta Din\00E2mica limita o n\00FAmero de linhas na consulta base e n\00E3o o n\00FAmero de linhas apresentadas. A sua consulta base excede o n\00FAmero m\00E1ximo de linhas de %0. Aplique um filtro para reduzir o n\00FAmero de registos na ')
||'sua consulta base.'
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141446866792752073)
,p_name=>'APEXIR_PIVOT_SORT'
,p_message_language=>'pt'
,p_message_text=>unistr('Ordena\00E7\00E3o Din\00E2mica')
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141412876037752063)
,p_name=>'APEXIR_PIVOT_TOO_MANY_VALUES'
,p_message_language=>'pt'
,p_message_text=>unistr('A coluna din\00E2mica cont\00E9m demasiados valores distintos - n\00E3o \00E9 poss\00EDvel gerar o SQL din\00E2mico.')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141343856351752042)
,p_name=>'APEXIR_PIVOT_VIEW_OF'
,p_message_language=>'pt'
,p_message_text=>unistr('Visualiza\00E7\00E3o din\00E2mica de %0')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141469683836752080)
,p_name=>'APEXIR_PREVIEW'
,p_message_language=>'pt'
,p_message_text=>unistr('Pr\00E9-visualizar')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141400196929752059)
,p_name=>'APEXIR_PREVIOUS'
,p_message_language=>'pt'
,p_message_text=>'Anterior'
,p_version_scn=>2705313
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141494489270752087)
,p_name=>'APEXIR_PRIMARY'
,p_message_language=>'pt'
,p_message_text=>'Principal'
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141470606924752080)
,p_name=>'APEXIR_PRIMARY_REPORT'
,p_message_language=>'pt'
,p_message_text=>unistr('Relat\00F3rio Principal')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141356330547752046)
,p_name=>'APEXIR_PRINT_ACCESSIBLE'
,p_message_language=>'pt'
,p_message_text=>'Incluir Identificadores de Acessibilidade'
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141317106229752035)
,p_name=>'APEXIR_PRINT_STRIP_RICH_TEXT'
,p_message_language=>'pt'
,p_message_text=>'Retirar RTF'
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141425547311752067)
,p_name=>'APEXIR_PRIVATE'
,p_message_language=>'pt'
,p_message_text=>'Privado'
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141380526632752053)
,p_name=>'APEXIR_PUBLIC'
,p_message_language=>'pt'
,p_message_text=>unistr('P\00FAblico')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141376165715752052)
,p_name=>'APEXIR_RED'
,p_message_language=>'pt'
,p_message_text=>'vermelho'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141522581201752095)
,p_name=>'APEXIR_REGION_STATIC_ID_DOES_NOT_EXIST'
,p_message_language=>'pt'
,p_message_text=>unistr('A ID Est\00E1tica da Regi\00E3o %0 n\00E3o existe.')
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141409670694752062)
,p_name=>'APEXIR_REMOVE'
,p_message_language=>'pt'
,p_message_text=>'Retirar'
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141409717630752062)
,p_name=>'APEXIR_REMOVE_ALL'
,p_message_language=>'pt'
,p_message_text=>'Retirar Todos'
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141517965694752094)
,p_name=>'APEXIR_REMOVE_CHART'
,p_message_language=>'pt'
,p_message_text=>'Retirar Diagrama'
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141409272659752062)
,p_name=>'APEXIR_REMOVE_CONTROL_BREAK'
,p_message_language=>'pt'
,p_message_text=>unistr('Retirar Controlo de Interrup\00E7\00E3o')
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141408954633752062)
,p_name=>'APEXIR_REMOVE_FILTER'
,p_message_language=>'pt'
,p_message_text=>'Retirar Filtro'
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141409055817752062)
,p_name=>'APEXIR_REMOVE_FLASHBACK'
,p_message_language=>'pt'
,p_message_text=>'Retirar Flashback'
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141518008545752094)
,p_name=>'APEXIR_REMOVE_GROUP_BY'
,p_message_language=>'pt'
,p_message_text=>'Retirar Agrupar Por'
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141409322704752062)
,p_name=>'APEXIR_REMOVE_HIGHLIGHT'
,p_message_language=>'pt'
,p_message_text=>'Retirar Destaque'
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141518146685752094)
,p_name=>'APEXIR_REMOVE_PIVOT'
,p_message_language=>'pt'
,p_message_text=>unistr('Retirar Din\00E2mica')
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141499252768752088)
,p_name=>'APEXIR_REMOVE_REPORT'
,p_message_language=>'pt'
,p_message_text=>unistr('Retirar Relat\00F3rio')
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141481002867752083)
,p_name=>'APEXIR_RENAME_DEFAULT_REPORT'
,p_message_language=>'pt'
,p_message_text=>unistr('Renomear Relat\00F3rio Por Omiss\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705329
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141418883842752065)
,p_name=>'APEXIR_RENAME_REPORT'
,p_message_language=>'pt'
,p_message_text=>unistr('Renomear Relat\00F3rio')
,p_is_js_message=>true
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141400493009752059)
,p_name=>'APEXIR_REPORT'
,p_message_language=>'pt'
,p_message_text=>unistr('Relat\00F3rio')
,p_is_js_message=>true
,p_version_scn=>2705313
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141497440027752088)
,p_name=>'APEXIR_REPORTS'
,p_message_language=>'pt'
,p_message_text=>unistr('Relat\00F3rios')
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141372626609752051)
,p_name=>'APEXIR_REPORT_ALIAS_DOES_NOT_EXIST'
,p_message_language=>'pt'
,p_message_text=>unistr('O relat\00F3rio interativo gravado com o pseud\00F3nimo %0 n\00E3o existe.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141425898931752067)
,p_name=>'APEXIR_REPORT_DOES_NOT_EXIST'
,p_message_language=>'pt'
,p_message_text=>unistr('O relat\00F3rio n\00E3o existe.')
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141372736555752051)
,p_name=>'APEXIR_REPORT_ID_DOES_NOT_EXIST'
,p_message_language=>'pt'
,p_message_text=>unistr('A ID do Relat\00F3rio Interativo Gravado %0 n\00E3o existe.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141417197879752064)
,p_name=>'APEXIR_REPORT_SETTINGS'
,p_message_language=>'pt'
,p_message_text=>unistr('Defini\00E7\00F5es do Relat\00F3rio')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141341342105752042)
,p_name=>'APEXIR_REPORT_SETTINGS_OF'
,p_message_language=>'pt'
,p_message_text=>unistr('Defini\00E7\00F5es de relat\00F3rio de %0')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141397415891752058)
,p_name=>'APEXIR_REPORT_VIEW'
,p_message_language=>'pt'
,p_message_text=>unistr('Visualiza\00E7\00E3o do Relat\00F3rio')
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141401631002752060)
,p_name=>'APEXIR_RESET'
,p_message_language=>'pt'
,p_message_text=>'Redefinir'
,p_is_js_message=>true
,p_version_scn=>2705313
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141380797322752053)
,p_name=>'APEXIR_RESET_CONFIRM'
,p_message_language=>'pt'
,p_message_text=>unistr('Repor defini\00E7\00F5es por omiss\00E3o do relat\00F3rio.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141375906079752052)
,p_name=>'APEXIR_ROW'
,p_message_language=>'pt'
,p_message_text=>'Linha'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141493518405752087)
,p_name=>'APEXIR_ROWID_NOT_SUPPORTED_FOR_WEBSOURCE'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o pode utilizar ROWID como coluna de chave prim\00E1ria para uma Origem de Dados REST.')
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141408351413752061)
,p_name=>'APEXIR_ROWS'
,p_message_language=>'pt'
,p_message_text=>'Linhas'
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141471379451752080)
,p_name=>'APEXIR_ROWS_PER_PAGE'
,p_message_language=>'pt'
,p_message_text=>unistr('Linhas por P\00E1gina')
,p_is_js_message=>true
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141446605521752073)
,p_name=>'APEXIR_ROW_COLUMNS'
,p_message_language=>'pt'
,p_message_text=>'Colunas da Linha'
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141446434864752073)
,p_name=>'APEXIR_ROW_COLUMN_N'
,p_message_language=>'pt'
,p_message_text=>'Coluna da Linha %0'
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141447098411752073)
,p_name=>'APEXIR_ROW_COLUMN_NOT_NULL'
,p_message_language=>'pt'
,p_message_text=>unistr('\00C9 necess\00E1rio especificar a coluna da linha.')
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141447206281752073)
,p_name=>'APEXIR_ROW_COL_DIFF_FROM_PIVOT_COL'
,p_message_language=>'pt'
,p_message_text=>unistr('A coluna da linha deve ser diferente da coluna din\00E2mica.')
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141422826266752066)
,p_name=>'APEXIR_ROW_FILTER'
,p_message_language=>'pt'
,p_message_text=>'Filtro de Linha'
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141397532048752058)
,p_name=>'APEXIR_ROW_OF'
,p_message_language=>'pt'
,p_message_text=>'Linha %0 de %1'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141401815224752060)
,p_name=>'APEXIR_ROW_TEXT_CONTAINS'
,p_message_language=>'pt'
,p_message_text=>unistr('O texto da linha cont\00E9m')
,p_version_scn=>2705313
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141375240063752052)
,p_name=>'APEXIR_SAVE'
,p_message_language=>'pt'
,p_message_text=>'Gravar'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141412409421752063)
,p_name=>'APEXIR_SAVED_REPORT'
,p_message_language=>'pt'
,p_message_text=>unistr('Relat\00F3rio Gravado')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141412367525752063)
,p_name=>'APEXIR_SAVED_REPORT_MSG'
,p_message_language=>'pt'
,p_message_text=>unistr('Relat\00F3rio Gravado = "%0"')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141414535181752063)
,p_name=>'APEXIR_SAVE_DEFAULT_CONFIRM'
,p_message_language=>'pt'
,p_message_text=>unistr('As defini\00E7\00F5es atuais do relat\00F3rio ser\00E3o utilizadas como valores por omiss\00E3o para todos os utilizadores.')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141480983819752083)
,p_name=>'APEXIR_SAVE_DEFAULT_REPORT'
,p_message_language=>'pt'
,p_message_text=>unistr('Gravar Relat\00F3rio Por Omiss\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705329
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141401575743752059)
,p_name=>'APEXIR_SAVE_REPORT'
,p_message_language=>'pt'
,p_message_text=>unistr('Gravar Relat\00F3rio')
,p_is_js_message=>true
,p_version_scn=>2705313
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141518364813752094)
,p_name=>'APEXIR_SAVE_REPORT_DEFAULT'
,p_message_language=>'pt'
,p_message_text=>unistr('Gravar Relat\00F3rio *')
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141472342421752080)
,p_name=>'APEXIR_SEARCH'
,p_message_language=>'pt'
,p_message_text=>'Pesquisar'
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141407270948752061)
,p_name=>'APEXIR_SEARCH_BAR'
,p_message_language=>'pt'
,p_message_text=>'Barra Pesquisa'
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141340658180752042)
,p_name=>'APEXIR_SEARCH_BAR_OF'
,p_message_language=>'pt'
,p_message_text=>'Barra de pesquisa de %0'
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141518241542752094)
,p_name=>'APEXIR_SEARCH_COLUMN'
,p_message_language=>'pt'
,p_message_text=>'Pesquisar: %0'
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141477801105752082)
,p_name=>'APEXIR_SEARCH_REPORT'
,p_message_language=>'pt'
,p_message_text=>unistr('Pesquisar Relat\00F3rio')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141461840960752077)
,p_name=>'APEXIR_SELECTED_COLUMNS'
,p_message_language=>'pt'
,p_message_text=>'Colunas Selecionadas'
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141376973733752052)
,p_name=>'APEXIR_SELECT_COLUMN'
,p_message_language=>'pt'
,p_message_text=>'- Selecionar Coluna -'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141400899809752059)
,p_name=>'APEXIR_SELECT_COLUMNS'
,p_message_language=>'pt'
,p_message_text=>'Selecionar Colunas'
,p_is_js_message=>true
,p_version_scn=>2705313
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141380496142752053)
,p_name=>'APEXIR_SELECT_FUNCTION'
,p_message_language=>'pt'
,p_message_text=>unistr('- Selecionar Fun\00E7\00E3o -')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141408048952752061)
,p_name=>'APEXIR_SELECT_GROUP_BY_COLUMN'
,p_message_language=>'pt'
,p_message_text=>'- Selecionar Agrupar Por Coluna -'
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141446170312752073)
,p_name=>'APEXIR_SELECT_PIVOT_COLUMN'
,p_message_language=>'pt'
,p_message_text=>unistr('- Selecionar Coluna Din\00E2mica -')
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141496458173752087)
,p_name=>'APEXIR_SELECT_ROW'
,p_message_language=>'pt'
,p_message_text=>'Selecionar Linha'
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141446249933752073)
,p_name=>'APEXIR_SELECT_ROW_COLUMN'
,p_message_language=>'pt'
,p_message_text=>'- Selecionar Coluna da Linha -'
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141327716381752038)
,p_name=>'APEXIR_SEND'
,p_message_language=>'pt'
,p_message_text=>'Enviar'
,p_is_js_message=>true
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141350286635752044)
,p_name=>'APEXIR_SEND_AS_EMAIL'
,p_message_language=>'pt'
,p_message_text=>'Enviar como Mensagem de Email'
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141375619737752052)
,p_name=>'APEXIR_SEQUENCE'
,p_message_language=>'pt'
,p_message_text=>unistr('Sequ\00EAncia')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141401092609752059)
,p_name=>'APEXIR_SORT'
,p_message_language=>'pt'
,p_message_text=>'Ordenar'
,p_is_js_message=>true
,p_version_scn=>2705313
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141410513353752062)
,p_name=>'APEXIR_SORT_ASCENDING'
,p_message_language=>'pt'
,p_message_text=>'Ordem Crescente'
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141410626082752062)
,p_name=>'APEXIR_SORT_DESCENDING'
,p_message_language=>'pt'
,p_message_text=>'Ordem Decrescente'
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141498649876752088)
,p_name=>'APEXIR_SORT_ORDER'
,p_message_language=>'pt'
,p_message_text=>unistr('Sequ\00EAncia de Ordena\00E7\00E3o')
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141404998572752060)
,p_name=>'APEXIR_SPACE_AS_IN_ONE_EMPTY_STRING'
,p_message_language=>'pt'
,p_message_text=>unistr('espa\00E7o')
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141416169643752064)
,p_name=>'APEXIR_STATUS'
,p_message_language=>'pt'
,p_message_text=>'Estado %0'
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141470045309752080)
,p_name=>'APEXIR_SUBSCRIPTION'
,p_message_language=>'pt'
,p_message_text=>unistr('Subscri\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141495885727752087)
,p_name=>'APEXIR_SUBSCRIPTION_ENDING'
,p_message_language=>'pt'
,p_message_text=>'A terminar a'
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141314826292752034)
,p_name=>'APEXIR_SUBSCRIPTION_SKIP_IF_NDF'
,p_message_language=>'pt'
,p_message_text=>unistr('Ignorar se N\00E3o Foram Encontrados Dados')
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141495741169752087)
,p_name=>'APEXIR_SUBSCRIPTION_STARTING_FROM'
,p_message_language=>'pt'
,p_message_text=>'A Partir De'
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141496669719752088)
,p_name=>'APEXIR_SUM_X'
,p_message_language=>'pt'
,p_message_text=>'Soma %0'
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141487511928752085)
,p_name=>'APEXIR_TABLE_SUMMARY'
,p_message_language=>'pt'
,p_message_text=>unistr('%0, Relat\00F3rio = %1, Visualiza\00E7\00E3o = %2')
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141374564180752051)
,p_name=>'APEXIR_TEXT_COLOR'
,p_message_language=>'pt'
,p_message_text=>'Cor do Texto'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141393261392752057)
,p_name=>'APEXIR_TIME_DAYS'
,p_message_language=>'pt'
,p_message_text=>'dias'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141393183616752057)
,p_name=>'APEXIR_TIME_HOURS'
,p_message_language=>'pt'
,p_message_text=>'horas'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141393093475752057)
,p_name=>'APEXIR_TIME_MINS'
,p_message_language=>'pt'
,p_message_text=>'minutos'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141393466884752057)
,p_name=>'APEXIR_TIME_MONTHS'
,p_message_language=>'pt'
,p_message_text=>'meses'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141393345364752057)
,p_name=>'APEXIR_TIME_WEEKS'
,p_message_language=>'pt'
,p_message_text=>'semanas'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141393583999752057)
,p_name=>'APEXIR_TIME_YEARS'
,p_message_language=>'pt'
,p_message_text=>'anos'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141499025310752088)
,p_name=>'APEXIR_TOGGLE'
,p_message_language=>'pt'
,p_message_text=>'Alternar'
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141409811902752062)
,p_name=>'APEXIR_TOP'
,p_message_language=>'pt'
,p_message_text=>'Superior'
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141492554951752086)
,p_name=>'APEXIR_UNGROUPED_COLUMN'
,p_message_language=>'pt'
,p_message_text=>unistr('Coluna N\00E3o Agrupada')
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141411330960752062)
,p_name=>'APEXIR_UNIQUE_HIGHLIGHT_NAME'
,p_message_language=>'pt'
,p_message_text=>unistr('\00C9 necess\00E1rio que o Nome do Destaque seja exclusivo.')
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141379285415752053)
,p_name=>'APEXIR_UNSUPPORTED_DATA_TYPE'
,p_message_language=>'pt'
,p_message_text=>unistr('tipo de dados n\00E3o suportado')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141409981288752062)
,p_name=>'APEXIR_UP'
,p_message_language=>'pt'
,p_message_text=>'Para Cima'
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141411557114752062)
,p_name=>'APEXIR_VALID_COLOR'
,p_message_language=>'pt'
,p_message_text=>unistr('Introduza uma cor v\00E1lida.')
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141411653884752062)
,p_name=>'APEXIR_VALID_FORMAT_MASK'
,p_message_language=>'pt'
,p_message_text=>unistr('Introduza uma m\00E1scara de formato v\00E1lida.')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141376477482752052)
,p_name=>'APEXIR_VALUE'
,p_message_language=>'pt'
,p_message_text=>'Valor'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141410487012752062)
,p_name=>'APEXIR_VALUE_AXIS_TITLE'
,p_message_language=>'pt'
,p_message_text=>unistr('T\00EDtulo do Eixo para Valor')
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141418295982752064)
,p_name=>'APEXIR_VALUE_REQUIRED'
,p_message_language=>'pt'
,p_message_text=>unistr('Valor Obrigat\00F3rio')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141379824305752053)
,p_name=>'APEXIR_VCOLUMN'
,p_message_language=>'pt'
,p_message_text=>'Coluna Vertical'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141488637738752085)
,p_name=>'APEXIR_VERTICAL'
,p_message_language=>'pt'
,p_message_text=>'Vertical'
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141417503489752064)
,p_name=>'APEXIR_VIEW_CHART'
,p_message_language=>'pt'
,p_message_text=>'Visualizar Diagrama'
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141476103920752081)
,p_name=>'APEXIR_VIEW_DETAIL'
,p_message_language=>'pt'
,p_message_text=>'Visualizar Detalhe'
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141520496940752095)
,p_name=>'APEXIR_VIEW_DOES_NOT_EXIST'
,p_message_language=>'pt'
,p_message_text=>unistr('O relat\00F3rio n\00E3o tem a visualiza\00E7\00E3o %0 definida.')
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141476250643752081)
,p_name=>'APEXIR_VIEW_GROUP_BY'
,p_message_language=>'pt'
,p_message_text=>'Visualizar Grupo Por'
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141476059364752081)
,p_name=>'APEXIR_VIEW_ICONS'
,p_message_language=>'pt'
,p_message_text=>unistr('Visualizar \00CDcones')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141445907968752073)
,p_name=>'APEXIR_VIEW_PIVOT'
,p_message_language=>'pt'
,p_message_text=>unistr('Visualizar Din\00E2mica')
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141417631371752064)
,p_name=>'APEXIR_VIEW_REPORT'
,p_message_language=>'pt'
,p_message_text=>unistr('Visualizar Relat\00F3rio')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141470298998752080)
,p_name=>'APEXIR_WEEKLY'
,p_message_language=>'pt'
,p_message_text=>'Semanal'
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141400382995752059)
,p_name=>'APEXIR_WORKING_REPORT'
,p_message_language=>'pt'
,p_message_text=>unistr('Relat\00F3rio de Trabalho')
,p_version_scn=>2705313
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141498018162752088)
,p_name=>'APEXIR_X_DAYS'
,p_message_language=>'pt'
,p_message_text=>'%0 dias'
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141497985872752088)
,p_name=>'APEXIR_X_HOURS'
,p_message_language=>'pt'
,p_message_text=>'%0 horas'
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141497816754752088)
,p_name=>'APEXIR_X_MINS'
,p_message_language=>'pt'
,p_message_text=>'%0 minutos'
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141498212649752088)
,p_name=>'APEXIR_X_MONTHS'
,p_message_language=>'pt'
,p_message_text=>'%0 meses'
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141498199765752088)
,p_name=>'APEXIR_X_WEEKS'
,p_message_language=>'pt'
,p_message_text=>'%0 semanas'
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141498356000752088)
,p_name=>'APEXIR_X_YEARS'
,p_message_language=>'pt'
,p_message_text=>'%0 anos'
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141496082300752087)
,p_name=>'APEXIR_YEAR'
,p_message_language=>'pt'
,p_message_text=>'Ano'
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141374210208752051)
,p_name=>'APEXIR_YELLOW'
,p_message_language=>'pt'
,p_message_text=>'amarelo'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141375750751752052)
,p_name=>'APEXIR_YES'
,p_message_language=>'pt'
,p_message_text=>'Sim'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141410237783752062)
,p_name=>'APEX_GROUP.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 cont\00E9m < ou > que s\00E3o caracteres inv\00E1lidos.')
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141434107289752069)
,p_name=>'APEX_REGION'
,p_message_language=>'pt'
,p_message_text=>unistr('Regi\00E3o')
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141325283008752037)
,p_name=>'APEX_ZIP.EXTRACT_FAILED'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel extrair o ficheiro comprimido.')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141325123526752037)
,p_name=>'APEX_ZIP.INVALID_ZIPFILE'
,p_message_language=>'pt'
,p_message_text=>unistr('A assinatura do Fim do Diret\00F3rio Central n\00E3o foi encontrada. Este ficheiro n\00E3o \00E9 um ficheiro comprimido.')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141356235640752046)
,p_name=>'API_PRECONDITION_VIOLATED'
,p_message_language=>'pt'
,p_message_text=>unistr('Pr\00E9-condi\00E7\00E3o de API violada')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141378388471752053)
,p_name=>'APP.SETTING.CANNOT.GET'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel obter o valor para a Defini\00E7\00E3o de Aplica\00E7\00E3o %0 dado que a op\00E7\00E3o de cria\00E7\00E3o associada est\00E1 desativada.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141378266706752053)
,p_name=>'APP.SETTING.CANNOT.SET'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel definir o valor para a Defini\00E7\00E3o de Aplica\00E7\00E3o %0 dado que a op\00E7\00E3o de cria\00E7\00E3o associada est\00E1 desativada.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141490817729752086)
,p_name=>'APP.SETTING.INVALID.VALUE'
,p_message_language=>'pt'
,p_message_text=>unistr('O valor da Defini\00E7\00E3o %0 da Aplica\00E7\00E3o \00E9 inv\00E1lido')
,p_version_scn=>2705332
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141490745995752086)
,p_name=>'APP.SETTING.NOT.DEFINED'
,p_message_language=>'pt'
,p_message_text=>unistr('A Defini\00E7\00E3o %0 da Aplica\00E7\00E3o Pedida n\00E3o est\00E1 definida')
,p_version_scn=>2705332
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141490900429752086)
,p_name=>'APP.SETTING.VALUE.NOT.NULL'
,p_message_language=>'pt'
,p_message_text=>unistr('A Defini\00E7\00E3o %0 da Aplica\00E7\00E3o n\00E3o pode ser definida para um valor nulo')
,p_version_scn=>2705332
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141364874769752049)
,p_name=>'BACK'
,p_message_language=>'pt'
,p_message_text=>'Anterior'
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141347298631752043)
,p_name=>'BUILDER'
,p_message_language=>'pt'
,p_message_text=>'Criador'
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141420868264752065)
,p_name=>'BUTTON LABEL'
,p_message_language=>'pt'
,p_message_text=>unistr('Etiqueta de Bot\00E3o')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141344142175752043)
,p_name=>'BUTTON_CSS_CLASSES'
,p_message_language=>'pt'
,p_message_text=>unistr('Classes CSS do bot\00E3o')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141382640822752054)
,p_name=>'BUTTON_ID'
,p_message_language=>'pt'
,p_message_text=>unistr('A ID de bot\00E3o gerada ser\00E1 a ID Est\00E1tica do bot\00E3o se for definida; caso contr\00E1rio, ser\00E1 uma ID gerada internamente no formato ''B'' || [ID de Bot\00E3o Interna]')
,p_version_scn=>2705310
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141316667342752034)
,p_name=>'CANDLESTICK'
,p_message_language=>'pt'
,p_message_text=>'Vela'
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141430649277752068)
,p_name=>'CENTER'
,p_message_language=>'pt'
,p_message_text=>'Centro'
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141377249777752052)
,p_name=>'CHANGE_PW_REQUEST'
,p_message_language=>'pt'
,p_message_text=>'%0 Pedido'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141367232014752049)
,p_name=>'CHECK$'
,p_message_language=>'pt'
,p_message_text=>'seletor de linha'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141492639896752086)
,p_name=>'CHECKED'
,p_message_language=>'pt'
,p_message_text=>'selecionado'
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141469046314752079)
,p_name=>'COLUMN'
,p_message_language=>'pt'
,p_message_text=>'Coluna'
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141426663790752067)
,p_name=>'COMMENTS'
,p_message_language=>'pt'
,p_message_text=>unistr('Coment\00E1rios')
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141407612727752061)
,p_name=>'CONTINUE'
,p_message_language=>'pt'
,p_message_text=>'Continuar'
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141365176577752049)
,p_name=>'COPYRIGHT'
,p_message_language=>'pt'
,p_message_text=>'Copyright &copy; 1999, %0, Oracle e/ou respetivas afiliadas.'
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141413314705752063)
,p_name=>'COUNT'
,p_message_language=>'pt'
,p_message_text=>'Contagem'
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141420367421752065)
,p_name=>'CREATE'
,p_message_language=>'pt'
,p_message_text=>'Criar'
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141475761523752081)
,p_name=>'CREATED'
,p_message_language=>'pt'
,p_message_text=>'Criado'
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141475812075752081)
,p_name=>'CREATED_BY'
,p_message_language=>'pt'
,p_message_text=>'Criado Por'
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141396763549752058)
,p_name=>'CREATED_ON'
,p_message_language=>'pt'
,p_message_text=>'Criado em'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141407802338752061)
,p_name=>'CUSTOM'
,p_message_language=>'pt'
,p_message_text=>'Customizado'
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141419001649752065)
,p_name=>'CUSTOMIZE'
,p_message_language=>'pt'
,p_message_text=>'Customizar'
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141421019466752065)
,p_name=>'CUSTOMIZE.USER_PAGE_PREFS_RESET'
,p_message_language=>'pt'
,p_message_text=>unistr('As prefer\00EAncias da p\00E1gina foram redefinidas para o utilizador %0.')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141421120398752065)
,p_name=>'CUSTOMIZE.USER_PREFS_CHANGED'
,p_message_language=>'pt'
,p_message_text=>unistr('As prefer\00EAncias foram alteradas para o utilizador %0.')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141420913326752065)
,p_name=>'CUSTOMIZE.USER_PREFS_RESET'
,p_message_language=>'pt'
,p_message_text=>unistr('As prefer\00EAncias da p\00E1gina foram redefinidas para o utilizador %0.')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141382006946752054)
,p_name=>'DAILY'
,p_message_language=>'pt'
,p_message_text=>unistr('Di\00E1rio')
,p_version_scn=>2705310
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141345465883752043)
,p_name=>'DATA.LOAD.INVALID_FILE'
,p_message_language=>'pt'
,p_message_text=>unistr('O ficheiro carregado \00E9 inv\00E1lido ou tem uma extens\00E3o incorreta.')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141377444704752052)
,p_name=>'DATA.LOAD.INVALID_SELECTOR'
,p_message_language=>'pt'
,p_message_text=>unistr('Foi utilizado um seletor de XML ou JSON inv\00E1lido.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141322507680752036)
,p_name=>'DATA.LOAD.NO_COMMON_COLUMNS'
,p_message_language=>'pt'
,p_message_text=>unistr('O perfil de dados e o ficheiro carregado n\00E3o cont\00EAm nenhuma coluna da tabela de destino.')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141436407220752070)
,p_name=>'DATA.LOAD.NO_FILE_CONTENTS'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o foram encontrados dados no ficheiro carregado.')
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141436582482752070)
,p_name=>'DATA.LOAD.NO_WORKSHEET_CONTENTS'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o foram encontrados dados na folha de c\00E1lculo "%0".')
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141342344504752042)
,p_name=>'DATA.LOAD.NO_XLSX_FILE'
,p_message_language=>'pt'
,p_message_text=>unistr('O ficheiro especificado n\00E3o \00E9 um ficheiro XLSX.')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141308350769752032)
,p_name=>'DATA.LOAD.ROWS_PROCESSED'
,p_message_language=>'pt'
,p_message_text=>'O carregamento de dados terminou: %0 linhas processadas.'
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141310642986752033)
,p_name=>'DATA.LOAD.ROWS_PROCESSED_W_ERROR_ROW'
,p_message_language=>'pt'
,p_message_text=>'O carregamento de dados terminou: %0 linhas processadas com 1 erro.'
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141310983910752033)
,p_name=>'DATA.LOAD.ROWS_PROCESSED_W_ERROR_ROWS'
,p_message_language=>'pt'
,p_message_text=>'O carregamento de dados terminou: %0 linhas processadas com %1 erros.'
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141310700796752033)
,p_name=>'DATA.LOAD.ROW_PROCESSED'
,p_message_language=>'pt'
,p_message_text=>'O carregamento de dados terminou: 1 linha processada.'
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141325052042752037)
,p_name=>'DATA.LOAD.ROW_PROCESSED_W_ERROR_ROW'
,p_message_language=>'pt'
,p_message_text=>'O carregamento de dados terminou: 1 linha processada com erro.'
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141310866649752033)
,p_name=>'DATA.LOAD.ROW_PROCESSED_W_ERROR_ROWS'
,p_message_language=>'pt'
,p_message_text=>'O carregamento de dados terminou: 1 linha processada sem erro.'
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141443512575752072)
,p_name=>'DATA_LOAD.COLUMN_NAMES_MAPPING'
,p_message_language=>'pt'
,p_message_text=>'Coluna de Destino'
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141350746744752044)
,p_name=>'DATA_LOAD.DO_NOT_LOAD'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o Carregar')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141350874932752044)
,p_name=>'DATA_LOAD.FAILED'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro de pr\00E9-processamento')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141443650569752072)
,p_name=>'DATA_LOAD.FIRST_COLUMN_NAMES'
,p_message_language=>'pt'
,p_message_text=>'Coluna de Origem'
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141444403970752072)
,p_name=>'DATA_LOAD.FORMAT'
,p_message_language=>'pt'
,p_message_text=>unistr('Formato de Data/N\00FAmero')
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141350520126752044)
,p_name=>'DATA_LOAD.INSERT'
,p_message_language=>'pt'
,p_message_text=>'Inserir linha'
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141506612958752090)
,p_name=>'DATA_LOAD.LOOKUP_FAILED'
,p_message_language=>'pt'
,p_message_text=>'Falha ao obter o valor de lookup.'
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141476332448752082)
,p_name=>'DATA_LOAD.MAPPING'
,p_message_language=>'pt'
,p_message_text=>unistr('Correspond\00EAncia de Dados/Tabela')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141444577055752072)
,p_name=>'DATA_LOAD.ROW'
,p_message_language=>'pt'
,p_message_text=>'Linha'
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141350976601752045)
,p_name=>'DATA_LOAD.SEQUENCE_ACTION'
,p_message_language=>'pt'
,p_message_text=>unistr('Sequ\00EAncia: A\00E7\00E3o')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141438268835752070)
,p_name=>'DATA_LOAD.TRANSFORMATION_FAILED'
,p_message_language=>'pt'
,p_message_text=>unistr('Falha na regra de transforma\00E7\00E3o')
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141350694391752044)
,p_name=>'DATA_LOAD.UPDATE'
,p_message_language=>'pt'
,p_message_text=>'Atualizar linha'
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141412933336752063)
,p_name=>'DATE'
,p_message_language=>'pt'
,p_message_text=>'Data'
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141385860821752055)
,p_name=>'DAY'
,p_message_language=>'pt'
,p_message_text=>'dia'
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141385947941752055)
,p_name=>'DAYS'
,p_message_language=>'pt'
,p_message_text=>'dias'
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141426322664752067)
,p_name=>'DEBUGGING_OFF'
,p_message_language=>'pt'
,p_message_text=>unistr('A depura\00E7\00E3o n\00E3o est\00E1 ativada para esta aplica\00E7\00E3o.')
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141478021477752082)
,p_name=>'DEFAULT'
,p_message_language=>'pt'
,p_message_text=>unistr('Valor Por Omiss\00E3o')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141386629332752055)
,p_name=>'DELETE'
,p_message_language=>'pt'
,p_message_text=>'apagar'
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141362299486752048)
,p_name=>'DELETE_MSG'
,p_message_language=>'pt'
,p_message_text=>unistr('Pretende efetuar esta a\00E7\00E3o de apagamento?')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141341851068752042)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES'
,p_message_language=>'pt'
,p_message_text=>unistr('Corre\00E7\00F5es de Sess\00F5es')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141342725287752042)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ENABLE'
,p_message_language=>'pt'
,p_message_text=>unistr('Ativar Corre\00E7\00F5es de Sess\00F5es')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141343638734752042)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ERROR_LOAD'
,p_message_language=>'pt'
,p_message_text=>unistr('Ocorreu um erro ao carregar corre\00E7\00F5es de sess\00F5es.')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141343465976752042)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ERROR_SAVE'
,p_message_language=>'pt'
,p_message_text=>unistr('Ocorreu um erro ao gravar corre\00E7\00F5es de sess\00F5es.')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141343302411752042)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_SAVED'
,p_message_language=>'pt'
,p_message_text=>unistr('Corre\00E7\00F5es de sess\00F5es gravadas. Feche esta caixa de di\00E1logo para ver as altera\00E7\00F5es.')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141316525922752034)
,p_name=>'DIAL_PCT'
,p_message_language=>'pt'
,p_message_text=>unistr('Man\00F3metro (Percentagem)')
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141357552885752046)
,p_name=>'DOWNLOAD'
,p_message_language=>'pt'
,p_message_text=>'Descarregar'
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141477170611752082)
,p_name=>'DUP_USER'
,p_message_language=>'pt'
,p_message_text=>'Nome de Utilizador duplicado na lista.'
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141365997868752049)
,p_name=>'EDIT'
,p_message_language=>'pt'
,p_message_text=>'Editar'
,p_is_js_message=>true
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141377135571752052)
,p_name=>'EMAIL_NOT_FOUND'
,p_message_language=>'pt'
,p_message_text=>unistr('O endere\00E7o de email "%0" n\00E3o foi encontrado.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141359875343752047)
,p_name=>'EMAIL_SENT_BY'
,p_message_language=>'pt'
,p_message_text=>'Esta mensagem de email enviada por %0.'
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141477347177752082)
,p_name=>'EMAIL_TOO_LONG'
,p_message_language=>'pt'
,p_message_text=>unistr('O Endere\00E7o de Email \00E9 demasiado longo. Tem um limite de 240 caracteres.')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141407530297752061)
,p_name=>'ERROR'
,p_message_language=>'pt'
,p_message_text=>'Erro'
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141438377320752070)
,p_name=>'ERROR_SET_ITEM_STATE_FOR_PPR_REGION'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel definir o valor de origem do item da p\00E1gina para a regi\00E3o de renova\00E7\00E3o de p\00E1gina parcial')
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141398806198752059)
,p_name=>'F4500_P10_CREATED_BY'
,p_message_language=>'pt'
,p_message_text=>'Criado Por'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141360159347752047)
,p_name=>'F4500_P2613_EXPIRED'
,p_message_language=>'pt'
,p_message_text=>'A Senha Expirou'
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141352595400752045)
,p_name=>'FILE_EMPTY'
,p_message_language=>'pt'
,p_message_text=>unistr('O ficheiro est\00E1 vazio.')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141442330458752072)
,p_name=>'FILE_TOO_LARGE'
,p_message_language=>'pt'
,p_message_text=>'O tamanho do ficheiro carregado era maior que %0 MB. Carregue um ficheiro mais pequeno.'
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141362465305752048)
,p_name=>'FILE_UPLOAD_AUTHENTICATION_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('Falha na autentica\00E7\00E3o do utilizador e um ou mais ficheiros n\00E3o foram carregados.')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141362556260752048)
,p_name=>'FILE_UPLOAD_PUBLICUSER_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('Esta inst\00E2ncia n\00E3o permite que utilizadores n\00E3o autenticados carreguem ficheiros.')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141442484704752072)
,p_name=>'FILTERS'
,p_message_language=>'pt'
,p_message_text=>'Filtros'
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141420431400752065)
,p_name=>'FLOW.SINGLE_VALIDATION_ERROR'
,p_message_language=>'pt'
,p_message_text=>'Ocorreu 1 erro'
,p_is_js_message=>true
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141419623690752065)
,p_name=>'FLOW.VALIDATION_ERROR'
,p_message_language=>'pt'
,p_message_text=>'Ocorreram %0 erros'
,p_is_js_message=>true
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141365093305752049)
,p_name=>'FORM_OF'
,p_message_language=>'pt'
,p_message_text=>'%0 de %1'
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141404096830752060)
,p_name=>'GO'
,p_message_language=>'pt'
,p_message_text=>'Ir'
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141506275876752090)
,p_name=>'HELP'
,p_message_language=>'pt'
,p_message_text=>unistr('Aux\00EDlio')
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141347386758752043)
,p_name=>'HOME'
,p_message_language=>'pt'
,p_message_text=>unistr('P\00E1gina Principal')
,p_is_js_message=>true
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141385634740752055)
,p_name=>'HOUR'
,p_message_language=>'pt'
,p_message_text=>'hora'
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141385796139752055)
,p_name=>'HOURS'
,p_message_language=>'pt'
,p_message_text=>'horas'
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141367127989752049)
,p_name=>'ICON'
,p_message_language=>'pt'
,p_message_text=>unistr('\00CDcone %0')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141344453008752043)
,p_name=>'ICON.EDITOR.CROP.HELP'
,p_message_language=>'pt'
,p_message_text=>unistr('Aux\00EDlio do \00CDcone Recortar')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141345666437752043)
,p_name=>'ICON.EDITOR.CROPPER.HELPTEXT'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Arraste o seu \00EDcone e utilize o cursor de desloca\00E7\00E3o para reposicion\00E1-lo dentro da moldura.</p>'),
'',
unistr('<p>Ao carregar um novo \00EDcone, este ser\00E1 redimensionado para se ajustar a tr\00EAs formatos: \00EDcone favicon, pequeno e grande.</p>'),
'',
unistr('<p>Quando focado no recorte de \00EDcones, est\00E3o dispon\00EDveis os seguintes atalhos de teclado:</p>'),
'<ul>',
'    <li>Seta para Esquerda: Deslocar a imagem para a esquerda*</li>',
'    <li>Seta para Cima: Deslocar a imagem para cima*</li>',
'    <li>Seta para a Direita: Deslocar a imagem para a direita*</li>',
'    <li>Seta para Baixo: Deslocar a imagem para baixo*</li>',
'    <li>I: Ampliar</li>',
'    <li>O: Reduzir</li>',
'    <li>L: Rodar para a esquerda</li>',
'    <li>R: Rodar para a direita</li>',
'</ul>',
'',
'<p class="margin-top-md"><em>*Manter Shift premido para se deslocar mais rapidamente</em></p>'))
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141351170408752045)
,p_name=>'ICON.EDITOR.CROPPER.SUBTITLE'
,p_message_language=>'pt'
,p_message_text=>unistr('\00CDcone Arrastar para reposicionar')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141351215685752045)
,p_name=>'ICON.EDITOR.CROPPER.ZOOM_SLIDER_LABEL'
,p_message_language=>'pt'
,p_message_text=>unistr('Mover o cursor de desloca\00E7\00E3o para ajustar o n\00EDvel de zoom')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141344257943752043)
,p_name=>'ICON.EDITOR.DIALOG.TITLE'
,p_message_language=>'pt'
,p_message_text=>unistr('\00CDcone Editar Aplica\00E7\00E3o')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141344594180752043)
,p_name=>'ICON.EDITOR.ERROR.SAVING'
,p_message_language=>'pt'
,p_message_text=>unistr('\00CDcone de erro na grava\00E7\00E3o')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141426969565752067)
,p_name=>'ICON.EDITOR.LEGACY_DATA'
,p_message_language=>'pt'
,p_message_text=>unistr('<p><span class="a-Icon icon-tr-warning"></span> Esta aplica\00E7\00E3o utiliza \00EDcones anteriores. Carregar um novo \00EDcone ir\00E1 substituir todos os \00EDcones anteriores.</p>')
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141345122088752043)
,p_name=>'ICON.EDITOR.UPLOAD.ICON'
,p_message_language=>'pt'
,p_message_text=>unistr('Carregar novo \00EDcone')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141421395707752065)
,p_name=>'INVALID_CREDENTIALS'
,p_message_language=>'pt'
,p_message_text=>unistr('Credencias de Entrada em Sess\00E3o Inv\00E1lidas')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141522461869752095)
,p_name=>'INVALID_VALUE_FOR_PARAMETER'
,p_message_language=>'pt'
,p_message_text=>unistr('Valor inv\00E1lido para o par\00E2metro: %0')
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141415649586752064)
,p_name=>'IR_AS_DEFAULT_REPORT_SETTING'
,p_message_language=>'pt'
,p_message_text=>unistr('Como Defini\00E7\00F5es Por Omiss\00E3o do Relat\00F3rio')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141415797861752064)
,p_name=>'IR_AS_NAMED_REPORT'
,p_message_language=>'pt'
,p_message_text=>unistr('Como Relat\00F3rio Nomeado')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141397678174752058)
,p_name=>'IR_ERROR'
,p_message_language=>'pt'
,p_message_text=>'Erro de %0. %1'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141397364987752058)
,p_name=>'IR_FRM_NAV_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel calcular a navega\00E7\00E3o na ficha. %0')
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141372912028752051)
,p_name=>'IR_NOT_FOUND'
,p_message_language=>'pt'
,p_message_text=>unistr('O relat\00F3rio interativo n\00E3o foi encontrado.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141372320710752051)
,p_name=>'IR_REGION_NOT_EXIST'
,p_message_language=>'pt'
,p_message_text=>unistr('A regi\00E3o do relat\00F3rio interativo n\00E3o existe na aplica\00E7\00E3o %0, p\00E1gina %1 e regi\00E3o %2.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141415526530752064)
,p_name=>'IR_STAR'
,p_message_language=>'pt'
,p_message_text=>'Apenas apresentado para programadores'
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141403798015752060)
,p_name=>'IR_UNIQUE_KEY_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('A consulta de relat\00F3rio deve ser uma chave exclusiva para identificar cada linha. A chave fornecida n\00E3o pode ser utilizada para esta consulta. Defina uma coluna de chave exclusiva. %0')
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141403887037752060)
,p_name=>'IR_UNIQUE_KEY_ERROR2'
,p_message_language=>'pt'
,p_message_text=>unistr('A consulta de relat\00F3rio deve ser uma chave exclusiva para identificar cada linha. A chave fornecida n\00E3o pode ser utilizada nesta consulta. Edite os atributos do relat\00F3rio para definir uma coluna de chave exclusiva. %0')
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141444742195752072)
,p_name=>'ITEM.FILE_UPLOAD.CHOOSE_FILE'
,p_message_language=>'pt'
,p_message_text=>'Escolher Ficheiro'
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141444630162752072)
,p_name=>'ITEM.FILE_UPLOAD.DRAG_DROP_FILE_HERE'
,p_message_language=>'pt'
,p_message_text=>'Arraste e largue o ficheiro aqui ou'
,p_is_js_message=>true
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141365397374752049)
,p_name=>'ITEMS'
,p_message_language=>'pt'
,p_message_text=>'Itens'
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141399020235752059)
,p_name=>'ITEM_VALUE'
,p_message_language=>'pt'
,p_message_text=>'Valor do Item'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141413637027752063)
,p_name=>'LABEL'
,p_message_language=>'pt'
,p_message_text=>'Etiqueta'
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141426283521752067)
,p_name=>'LANGUAGE'
,p_message_language=>'pt'
,p_message_text=>unistr('L\00EDngua')
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141386387471752055)
,p_name=>'LAST'
,p_message_language=>'pt'
,p_message_text=>unistr('\00FAltimo')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141362398812752048)
,p_name=>'LENGTH'
,p_message_language=>'pt'
,p_message_text=>'Comprimento'
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141420655421752065)
,p_name=>'LOGIN'
,p_message_language=>'pt'
,p_message_text=>unistr('Entrar em Sess\00E3o')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141462200780752077)
,p_name=>'MANAGE'
,p_message_language=>'pt'
,p_message_text=>'Gerir'
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141525363871752096)
,p_name=>'MAXIMIZE'
,p_message_language=>'pt'
,p_message_text=>'Maximizar'
,p_is_js_message=>true
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141385423942752055)
,p_name=>'MINUTE'
,p_message_language=>'pt'
,p_message_text=>'minuto'
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141385570049752055)
,p_name=>'MINUTES'
,p_message_language=>'pt'
,p_message_text=>'minutos'
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141477501329752082)
,p_name=>'MISSING_AT'
,p_message_language=>'pt'
,p_message_text=>unistr('Falta "@" no Endere\00E7o de Email.')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141477743745752082)
,p_name=>'MISSING_DIALOG_PAGE_TEMPLATE_WARNING'
,p_message_language=>'pt'
,p_message_text=>unistr('Aviso: N\00E3o foi definido nenhum modelo de P\00E1gina de Caixa de Di\00E1logo para a p\00E1gina de Caixa de Di\00E1logo %0 na aplica\00E7\00E3o %1.')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141477492643752082)
,p_name=>'MISSING_DOT'
,p_message_language=>'pt'
,p_message_text=>unistr('Falta "." no dom\00EDnio do Endere\00E7o de Email.')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141423789221752066)
,p_name=>'MODULE'
,p_message_language=>'pt'
,p_message_text=>unistr('M\00F3dulo')
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141377922614752052)
,p_name=>'MONTH'
,p_message_language=>'pt'
,p_message_text=>unistr('M\00EAs')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141381828498752054)
,p_name=>'MONTHLY'
,p_message_language=>'pt'
,p_message_text=>'Mensal'
,p_version_scn=>2705310
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141378009510752052)
,p_name=>'MONTHS'
,p_message_language=>'pt'
,p_message_text=>'meses'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141413275955752063)
,p_name=>'MOVE'
,p_message_language=>'pt'
,p_message_text=>'Deslocar'
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141484042945752084)
,p_name=>'MOVE_FROM'
,p_message_language=>'pt'
,p_message_text=>'Deslocar de'
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141484176865752084)
,p_name=>'MOVE_TO'
,p_message_language=>'pt'
,p_message_text=>'Deslocar para'
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141400243491752059)
,p_name=>'MRU.ERROR_IN_MRD'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro na opera\00E7\00E3o de apagamento de v\00E1rias linhas: linha= %0, %1, %2')
,p_version_scn=>2705313
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141399256581752059)
,p_name=>'MUST_NOT_BE_PUBLIC_USER'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o Deve Ser Utilizador P\00FAblico')
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141347891880752044)
,p_name=>'NAME'
,p_message_language=>'pt'
,p_message_text=>'Nome'
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141413431322752063)
,p_name=>'NEW'
,p_message_language=>'pt'
,p_message_text=>'Novo'
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141377732755752052)
,p_name=>'NEW_ACCOUNT_LOGIN_INSTRUCTIONS'
,p_message_language=>'pt'
,p_message_text=>unistr('Pode entrar em sess\00E3o em %0 ao ir para:')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141377800612752052)
,p_name=>'NEW_ACCOUNT_NOTIFICATION'
,p_message_language=>'pt'
,p_message_text=>unistr('Notifica\00E7\00E3o de Nova Conta de %0')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141506458568752090)
,p_name=>'NEXT'
,p_message_language=>'pt'
,p_message_text=>'Seguinte'
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141423632315752066)
,p_name=>'NO'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o')
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141520592504752095)
,p_name=>'NOBODY'
,p_message_language=>'pt'
,p_message_text=>unistr('ningu\00E9m')
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141386788469752055)
,p_name=>'NOT'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141429601656752068)
,p_name=>'NOT_NULL'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o Nulo')
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141399359692752059)
,p_name=>'NOT_W_ARGUMENT'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o %0')
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141419197253752065)
,p_name=>'NO_DATA_FOUND'
,p_message_language=>'pt'
,p_message_text=>unistr('n\00E3o foram encontrados dados')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141429138951752068)
,p_name=>'NO_UPDATEABLE_REPORT_FOUND'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o foi encontrado nenhum relat\00F3rio atualiz\00E1vel. As opera\00E7\00F5es de atualiza\00E7\00E3o e apagamento de v\00E1rias linhas s\00F3 podem ser efetuadas em fichas tabulares do tipo "Relat\00F3rio Atualiz\00E1vel".')
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141430079513752068)
,p_name=>'OK'
,p_message_language=>'pt'
,p_message_text=>'OK'
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141425365613752066)
,p_name=>'ORACLE_APPLICATION_EXPRESS'
,p_message_language=>'pt'
,p_message_text=>'Oracle APEX'
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141524287874752096)
,p_name=>'ORA_06550'
,p_message_language=>'pt'
,p_message_text=>'ORA-06550: linha %0, coluna %1'
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141475119091752081)
,p_name=>'OUTDATED_BROWSER'
,p_message_language=>'pt'
,p_message_text=>unistr('Est\00E1 a utilizar um browser desatualizado. Para obter uma lista de browsers suportados, consulte o Oracle APEX Installation Guide.')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141370158341752050)
,p_name=>'OUT_OF_RANGE'
,p_message_language=>'pt'
,p_message_text=>unistr('Foi pedido um conjunto de linhas inv\00E1lido. Os dados de origem do relat\00F3rio foram modificados.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141392182514752057)
,p_name=>'P.VALID_PAGE_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('\00C9 necess\00E1rio especificar um n\00FAmero de p\00E1gina v\00E1lido; por exemplo, p?n=1234.')
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141396373445752058)
,p_name=>'PAGINATION.NEXT'
,p_message_language=>'pt'
,p_message_text=>'Seguinte'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141396470297752058)
,p_name=>'PAGINATION.NEXT_SET'
,p_message_language=>'pt'
,p_message_text=>'Conjunto Seguinte'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141396506454752058)
,p_name=>'PAGINATION.PREVIOUS'
,p_message_language=>'pt'
,p_message_text=>'Anterior'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141396602896752058)
,p_name=>'PAGINATION.PREVIOUS_SET'
,p_message_language=>'pt'
,p_message_text=>'Conjunto Anterior'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141506330089752090)
,p_name=>'PAGINATION.SELECT'
,p_message_language=>'pt'
,p_message_text=>unistr('Selecionar Pagina\00E7\00E3o')
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141436306339752070)
,p_name=>'PASSWORD'
,p_message_language=>'pt'
,p_message_text=>'Senha'
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141377064184752052)
,p_name=>'PASSWORD_CHANGED'
,p_message_language=>'pt'
,p_message_text=>'A sua senha de %0 foi alterada.'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141364731421752049)
,p_name=>'PASSWORD_COMPLEXITY_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('A senha n\00E3o est\00E1 em conformidade com as regras de complexidade da senha do site.')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141363842484752048)
,p_name=>'PASSWORD_DIFFERS_BY_ERR'
,p_message_language=>'pt'
,p_message_text=>'A nova senha deve ser diferente da senha antiga em, pelo menos, %0 caracteres.'
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141364458786752048)
,p_name=>'PASSWORD_LIKE_USERNAME_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('A senha n\00E3o deve conter o nome de utilizador.')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141364623735752049)
,p_name=>'PASSWORD_LIKE_WORDS_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('A senha cont\00E9m uma palavra simples proibida.')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141364568589752049)
,p_name=>'PASSWORD_LIKE_WORKSPACE_NAME_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('A senha n\00E3o deve conter o nome do espa\00E7o de trabalho.')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141363789583752048)
,p_name=>'PASSWORD_MIN_LEN_ERR'
,p_message_language=>'pt'
,p_message_text=>'A senha deve conter, pelo menos, %0 caracteres.'
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141363957171752048)
,p_name=>'PASSWORD_ONE_ALPHA_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('A senha deve conter, pelo menos, um car\00E1cter alfab\00E9tico (%0).')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141364307670752048)
,p_name=>'PASSWORD_ONE_LOWER_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('A senha deve conter, pelo menos, um car\00E1cter alfab\00E9tico em min\00FAsculas.')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141364011686752048)
,p_name=>'PASSWORD_ONE_NUMERIC_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('A senha deve conter, pelo menos, um car\00E1cter num\00E9rico (0123456789).')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141364166451752048)
,p_name=>'PASSWORD_ONE_PUNCTUATION_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('A senha deve conter, pelo menos, um car\00E1cter de pontua\00E7\00E3o (%0).')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141364257383752048)
,p_name=>'PASSWORD_ONE_UPPER_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('A senha deve conter, pelo menos, um car\00E1cter alfab\00E9tico em mai\00FAsculas.')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141377542096752052)
,p_name=>'PASSWORD_RESET_NOTIFICATION'
,p_message_language=>'pt'
,p_message_text=>unistr('Notifica\00E7\00E3o de Redefini\00E7\00E3o da Senha')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141362658833752048)
,p_name=>'PASSWORD_REUSE_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('A senha n\00E3o pode ser utilizada porque foi utilizada nos \00FAltimos %0 dias.')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141359330716752047)
,p_name=>'PCT_GRAPH_ARIA_LABEL'
,p_message_language=>'pt'
,p_message_text=>unistr('Gr\00E1fico Percentual')
,p_is_js_message=>true
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141450977622752074)
,p_name=>'PE.COMPONEN.TYPE.PAGE_ITEM.PLURAL'
,p_message_language=>'pt'
,p_message_text=>'Itens'
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141451015693752074)
,p_name=>'PE.COMPONEN.TYPE.PAGE_ITEM.SINGULAR'
,p_message_language=>'pt'
,p_message_text=>'Item'
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141425130078752066)
,p_name=>'PERCENT'
,p_message_language=>'pt'
,p_message_text=>'Percentagem'
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141394480588752057)
,p_name=>'PLEASE_CONTACT_ADMINISTRATOR'
,p_message_language=>'pt'
,p_message_text=>'Contacte o administrador.'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141506582344752090)
,p_name=>'PREVIOUS'
,p_message_language=>'pt'
,p_message_text=>'Anterior'
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141443168635752072)
,p_name=>'PRINT'
,p_message_language=>'pt'
,p_message_text=>'Imprimir'
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141423985489752066)
,p_name=>'PRIVILEGES'
,p_message_language=>'pt'
,p_message_text=>unistr('Privil\00E9gios')
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141392520647752057)
,p_name=>'REGIOIN_REFERENCES'
,p_message_language=>'pt'
,p_message_text=>unistr('Refer\00EAncias de Regi\00F5es')
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141413585248752063)
,p_name=>'REPORT'
,p_message_language=>'pt'
,p_message_text=>unistr('Relat\00F3rio')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141423892024752066)
,p_name=>'REPORTING_PERIOD'
,p_message_language=>'pt'
,p_message_text=>unistr('Per\00EDodo de Gera\00E7\00E3o de Relat\00F3rios')
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141506780169752091)
,p_name=>'REPORT_LABEL'
,p_message_language=>'pt'
,p_message_text=>unistr('Relat\00F3rio: %0')
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141424590741752066)
,p_name=>'REPORT_TOTAL'
,p_message_language=>'pt'
,p_message_text=>unistr('Total do Relat\00F3rio')
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141370258323752050)
,p_name=>'RESET'
,p_message_language=>'pt'
,p_message_text=>unistr('Redefinir Pagina\00E7\00E3o')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141398933944752059)
,p_name=>'RESET_PAGINATION'
,p_message_language=>'pt'
,p_message_text=>unistr('Redefinir Pagina\00E7\00E3o')
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141429025414752068)
,p_name=>'RESET_PASSWORD'
,p_message_language=>'pt'
,p_message_text=>'Redefinir Senha'
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141404815971752060)
,p_name=>'RESTORE'
,p_message_language=>'pt'
,p_message_text=>'Repor'
,p_is_js_message=>true
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141438483707752070)
,p_name=>'RESULTS'
,p_message_language=>'pt'
,p_message_text=>'Resultados'
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141430135378752068)
,p_name=>'RETURN_TO_APPLICATION'
,p_message_language=>'pt'
,p_message_text=>unistr('Regresse \00E0 aplica\00E7\00E3o.')
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141430520127752068)
,p_name=>'RIGHT'
,p_message_language=>'pt'
,p_message_text=>'Direita'
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141462559547752077)
,p_name=>'ROW'
,p_message_language=>'pt'
,p_message_text=>'Linha %0'
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141413102978752063)
,p_name=>'ROW_COUNT'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00FAmero de Linhas')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141302927605752030)
,p_name=>'RW_AO_ASK_ORACLE'
,p_message_language=>'pt'
,p_message_text=>unistr('Perguntar \00E0 Oracle')
,p_is_js_message=>true
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141303235198752030)
,p_name=>'RW_AO_CLOSE_ASK_ORACLE'
,p_message_language=>'pt'
,p_message_text=>unistr('Fechar Perguntar \00E0 Oracle')
,p_is_js_message=>true
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141303532965752031)
,p_name=>'RW_AO_NOTIFICATIONS_LIST'
,p_message_language=>'pt'
,p_message_text=>unistr('Lista de Notifica\00E7\00F5es')
,p_is_js_message=>true
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141303165803752030)
,p_name=>'RW_AO_OPEN_ASK_ORACLE'
,p_message_language=>'pt'
,p_message_text=>unistr('Abrir Perguntar \00E0 Oracle')
,p_is_js_message=>true
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141303461565752031)
,p_name=>'RW_AO_PRODUCT_MAP'
,p_message_language=>'pt'
,p_message_text=>'Mapa do Produto'
,p_is_js_message=>true
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141303341362752031)
,p_name=>'RW_AO_SUGGESTIONS_LIST'
,p_message_language=>'pt'
,p_message_text=>unistr('Lista de Sugest\00F5es')
,p_is_js_message=>true
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141304230252752031)
,p_name=>'RW_CLEAR'
,p_message_language=>'pt'
,p_message_text=>'Limpar'
,p_is_js_message=>true
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141304137107752031)
,p_name=>'RW_CLOSE'
,p_message_language=>'pt'
,p_message_text=>'Fechar'
,p_is_js_message=>true
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141303919257752031)
,p_name=>'RW_FO_VIEW_MORE'
,p_message_language=>'pt'
,p_message_text=>'Visualizar Mais'
,p_is_js_message=>true
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141304300447752031)
,p_name=>'RW_GO_TO'
,p_message_language=>'pt'
,p_message_text=>'Ir para'
,p_is_js_message=>true
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141303733125752031)
,p_name=>'RW_GP_STEP'
,p_message_language=>'pt'
,p_message_text=>'Passo'
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141303863032752031)
,p_name=>'RW_GP_STEP_OF'
,p_message_language=>'pt'
,p_message_text=>'de'
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141303685552752031)
,p_name=>'RW_GP_TOGGLE_STEPS'
,p_message_language=>'pt'
,p_message_text=>unistr('Alternar apresenta\00E7\00E3o de passos')
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141302734007752030)
,p_name=>'RW_HIDE_PASSWORD'
,p_message_language=>'pt'
,p_message_text=>'Ocultar Senha'
,p_is_js_message=>true
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141304061996752031)
,p_name=>'RW_OPEN'
,p_message_language=>'pt'
,p_message_text=>'Abertura'
,p_is_js_message=>true
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141302557772752030)
,p_name=>'RW_ORACLE'
,p_message_language=>'pt'
,p_message_text=>'Oracle'
,p_is_js_message=>true
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141302635856752030)
,p_name=>'RW_SHOW_PASSWORD'
,p_message_language=>'pt'
,p_message_text=>'Mostrar Senha'
,p_is_js_message=>true
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141304468131752031)
,p_name=>'RW_START'
,p_message_language=>'pt'
,p_message_text=>unistr('In\00EDcio')
,p_is_js_message=>true
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141429565460752068)
,p_name=>'SAVE'
,p_message_language=>'pt'
,p_message_text=>'Gravar'
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141425753248752067)
,p_name=>'SAVED_REPORTS.ALTERNATIVE.DEFAULT'
,p_message_language=>'pt'
,p_message_text=>unistr('Valor Por Omiss\00E3o Alternativo')
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141426140378752067)
,p_name=>'SAVED_REPORTS.DESCRIPTION'
,p_message_language=>'pt'
,p_message_text=>unistr('Descri\00E7\00E3o')
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141425651998752067)
,p_name=>'SAVED_REPORTS.PRIMARY.DEFAULT'
,p_message_language=>'pt'
,p_message_text=>unistr('Valor Por Omiss\00E3o Principal')
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141426439908752067)
,p_name=>'SC_REPORT_ROWS'
,p_message_language=>'pt'
,p_message_text=>unistr('Existem mais de %0 linhas dispon\00EDveis. Aumente o seletor de linhas para visualizar mais linhas.')
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141493887306752087)
,p_name=>'SEARCH'
,p_message_language=>'pt'
,p_message_text=>'Pesquisar'
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141385310182752055)
,p_name=>'SECONDS'
,p_message_language=>'pt'
,p_message_text=>'segundos'
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141425208350752066)
,p_name=>'SEE_ATTACHED'
,p_message_language=>'pt'
,p_message_text=>'Consultar anexo'
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141485850758752084)
,p_name=>'SELECT_ROW'
,p_message_language=>'pt'
,p_message_text=>'Selecionar Linha'
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141424953747752066)
,p_name=>'SET_SCREEN_READER_MODE_OFF'
,p_message_language=>'pt'
,p_message_text=>unistr('Desativar Modo de Leitor de Ecr\00E3')
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141425057816752066)
,p_name=>'SET_SCREEN_READER_MODE_ON'
,p_message_language=>'pt'
,p_message_text=>unistr('Ativar Modo de Leitor de Ecr\00E3')
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141421226293752065)
,p_name=>'SHOW'
,p_message_language=>'pt'
,p_message_text=>'Mostrar'
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141487616694752085)
,p_name=>'SHOW_ALL'
,p_message_language=>'pt'
,p_message_text=>'Mostrar Tudo'
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141512434107752092)
,p_name=>'SIGN_IN'
,p_message_language=>'pt'
,p_message_text=>unistr('Entrar em Sess\00E3o')
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141463325436752078)
,p_name=>'SIGN_OUT'
,p_message_language=>'pt'
,p_message_text=>unistr('Sair de sess\00E3o')
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141414150582752063)
,p_name=>'SINCE_DAYS_AGO'
,p_message_language=>'pt'
,p_message_text=>unistr('h\00E1 %0 dias')
,p_is_js_message=>true
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141421787750752065)
,p_name=>'SINCE_DAYS_FROM_NOW'
,p_message_language=>'pt'
,p_message_text=>'%0 dias a partir de agora'
,p_is_js_message=>true
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141414091927752063)
,p_name=>'SINCE_HOURS_AGO'
,p_message_language=>'pt'
,p_message_text=>unistr('h\00E1 %0 horas')
,p_is_js_message=>true
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141421668269752065)
,p_name=>'SINCE_HOURS_FROM_NOW'
,p_message_language=>'pt'
,p_message_text=>'%0 horas a partir de agora'
,p_is_js_message=>true
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141413992868752063)
,p_name=>'SINCE_MINUTES_AGO'
,p_message_language=>'pt'
,p_message_text=>unistr('h\00E1 %0 minutos')
,p_is_js_message=>true
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141421535214752065)
,p_name=>'SINCE_MINUTES_FROM_NOW'
,p_message_language=>'pt'
,p_message_text=>'%0 minutos a partir de agora'
,p_is_js_message=>true
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141414357544752063)
,p_name=>'SINCE_MONTHS_AGO'
,p_message_language=>'pt'
,p_message_text=>unistr('h\00E1 %0 meses')
,p_is_js_message=>true
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141421930103752065)
,p_name=>'SINCE_MONTHS_FROM_NOW'
,p_message_language=>'pt'
,p_message_text=>'%0 meses a partir de agora'
,p_is_js_message=>true
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141422129976752066)
,p_name=>'SINCE_NOW'
,p_message_language=>'pt'
,p_message_text=>'Agora'
,p_is_js_message=>true
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141413871739752063)
,p_name=>'SINCE_SECONDS_AGO'
,p_message_language=>'pt'
,p_message_text=>unistr('h\00E1 %0 segundos')
,p_is_js_message=>true
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141421440185752065)
,p_name=>'SINCE_SECONDS_FROM_NOW'
,p_message_language=>'pt'
,p_message_text=>'%0 segundos a partir de agora'
,p_is_js_message=>true
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141414259811752063)
,p_name=>'SINCE_WEEKS_AGO'
,p_message_language=>'pt'
,p_message_text=>unistr('h\00E1 %0 semanas')
,p_is_js_message=>true
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141421897544752065)
,p_name=>'SINCE_WEEKS_FROM_NOW'
,p_message_language=>'pt'
,p_message_text=>'%0 semanas a partir de agora'
,p_is_js_message=>true
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141414486158752063)
,p_name=>'SINCE_YEARS_AGO'
,p_message_language=>'pt'
,p_message_text=>unistr('h\00E1 %0 anos')
,p_is_js_message=>true
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141422012364752066)
,p_name=>'SINCE_YEARS_FROM_NOW'
,p_message_language=>'pt'
,p_message_text=>'%0 anos a partir de agora'
,p_is_js_message=>true
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141407958928752061)
,p_name=>'STANDARD'
,p_message_language=>'pt'
,p_message_text=>'Standard'
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141424884985752066)
,p_name=>'START_DATE'
,p_message_language=>'pt'
,p_message_text=>unistr('Data de In\00EDcio')
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141360064784752047)
,p_name=>'SUBSCRIPTION_CREATED_BY'
,p_message_language=>'pt'
,p_message_text=>unistr('Est\00E1 a receber esta mensagem de email a partir da subscri\00E7\00E3o de relat\00F3rio Interativo criada por %0.')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141521629751752095)
,p_name=>'SUBSCRIPTION_REFERENCES'
,p_message_language=>'pt'
,p_message_text=>unistr('Subscri\00E7\00F5es')
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141471075496752080)
,p_name=>'TAB'
,p_message_language=>'pt'
,p_message_text=>'Separador'
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141385220795752055)
,p_name=>'TITLE'
,p_message_language=>'pt'
,p_message_text=>unistr('T\00EDtulo')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141364942130752049)
,p_name=>'TODAY'
,p_message_language=>'pt'
,p_message_text=>'Hoje'
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141424495666752066)
,p_name=>'TOTAL'
,p_message_language=>'pt'
,p_message_text=>'Total'
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141366284081752049)
,p_name=>'TO_MANY_COLUMNS_SELECTED'
,p_message_language=>'pt'
,p_message_text=>unistr('\00C9 poss\00EDvel selecionar um m\00E1ximo de %0 colunas.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141322058433752036)
,p_name=>'TREE.COLLAPSE_ALL'
,p_message_language=>'pt'
,p_message_text=>'Contrair Todos'
,p_is_js_message=>true
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141322672481752036)
,p_name=>'TREE.COLLAPSE_ALL_BELOW'
,p_message_language=>'pt'
,p_message_text=>'Contrair Todos Abaixo'
,p_is_js_message=>true
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141321692936752036)
,p_name=>'TREE.EXPAND_ALL'
,p_message_language=>'pt'
,p_message_text=>'Expandir Todos'
,p_is_js_message=>true
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141322373805752036)
,p_name=>'TREE.EXPAND_ALL_BELOW'
,p_message_language=>'pt'
,p_message_text=>'Expandir Todos Abaixo'
,p_is_js_message=>true
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141322887775752036)
,p_name=>'TREE.REPARENT'
,p_message_language=>'pt'
,p_message_text=>'Novo pai'
,p_is_js_message=>true
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141444963830752072)
,p_name=>'TREES'
,p_message_language=>'pt'
,p_message_text=>unistr('\00C1rvores')
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141487765883752085)
,p_name=>'UI.FORM.REQUIRED'
,p_message_language=>'pt'
,p_message_text=>unistr('Obrigat\00F3rio')
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141408639979752062)
,p_name=>'UNAUTHORIZED'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o Autorizado')
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141458857341752076)
,p_name=>'UNAVAILABLE'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o Dispon\00EDvel')
,p_version_scn=>2705325
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141422555361752066)
,p_name=>'UNKNOWN'
,p_message_language=>'pt'
,p_message_text=>'Desconhecido'
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141360947444752047)
,p_name=>'UNKNOWN_AUTHENTICATION_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('Ocorreu um erro de autentica\00E7\00E3o n\00E3o reconhecido.')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141363194259752048)
,p_name=>'UNSUBSCRIBE_SUBSCRIPTION_MSG_HTML'
,p_message_language=>'pt'
,p_message_text=>unistr('Se j\00E1 n\00E3o pretende receber mensagens de email, clique em <a href="%0">anular subscri\00E7\00E3o</a> para gerir a sua subscri\00E7\00E3o.')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141359968701752047)
,p_name=>'UNSUBSCRIBE_SUBSCRIPTION_MSG_TXT'
,p_message_language=>'pt'
,p_message_text=>unistr('Se j\00E1 n\00E3o pretende receber mensagens de email, aceda ao seguinte URL para gerir a sua subscri\00E7\00E3o:')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141399456622752059)
,p_name=>'UNSUPPORTED_DATA_TYPE'
,p_message_language=>'pt'
,p_message_text=>unistr('tipo de dados n\00E3o suportado')
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141386509418752055)
,p_name=>'UPDATE'
,p_message_language=>'pt'
,p_message_text=>'atualizar'
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141385178966752055)
,p_name=>'UPDATED'
,p_message_language=>'pt'
,p_message_text=>'Atualizado'
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141328357291752038)
,p_name=>'UPGRADE_IN_PROGRESS'
,p_message_language=>'pt'
,p_message_text=>unistr('Atualiza\00E7\00E3o a Decorrer')
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141328629305752038)
,p_name=>'UPGRADE_IN_PROGRESS_DETAIL'
,p_message_language=>'pt'
,p_message_text=>unistr('O Oracle APEX est\00E1 a ser atualizado para uma vers\00E3o mais recente. Este processo demora geralmente at\00E9 3 minutos.')
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141391906355752057)
,p_name=>'URL_PROHIBITED'
,p_message_language=>'pt'
,p_message_text=>'O URL pedido foi proibido. Contacte o administrador.'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141413037289752063)
,p_name=>'USER'
,p_message_language=>'pt'
,p_message_text=>'Utilizador'
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141436223519752070)
,p_name=>'USERNAME'
,p_message_language=>'pt'
,p_message_text=>'Nome de Utilizador'
,p_version_scn=>2705318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141477632778752082)
,p_name=>'USERNAME_TOO_LONG'
,p_message_language=>'pt'
,p_message_text=>unistr('O nome de utilizador \00E9 demasiado longo. Tem um limite de %0 caracteres.')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141420111502752065)
,p_name=>'USERS'
,p_message_language=>'pt'
,p_message_text=>'utilizadores'
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141477204891752082)
,p_name=>'USER_EXISTS'
,p_message_language=>'pt'
,p_message_text=>unistr('O nome de utilizador j\00E1 existe.')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141491012941752086)
,p_name=>'USER_PROFILE_IMAGE'
,p_message_language=>'pt'
,p_message_text=>'Imagem do perfil para o utilizador %0'
,p_version_scn=>2705332
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141352999437752045)
,p_name=>'UTILIZATION_REPORTS.AUTOMATION'
,p_message_language=>'pt'
,p_message_text=>unistr('Automatiza\00E7\00E3o - %0')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141351497775752045)
,p_name=>'UTILIZATION_REPORTS.PAGE'
,p_message_language=>'pt'
,p_message_text=>unistr('P\00E1gina %0 - %1 ')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141354364888752046)
,p_name=>'UTILIZATION_REPORTS.PLUG_NAME'
,p_message_language=>'pt'
,p_message_text=>'%0 - %1'
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141354473452752046)
,p_name=>'UTILIZATION_REPORTS.PROCESS_NAME'
,p_message_language=>'pt'
,p_message_text=>'%0 - %1'
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141353399099752045)
,p_name=>'UTILIZATION_REPORTS.SEARCH_CONFIG'
,p_message_language=>'pt'
,p_message_text=>unistr('Configura\00E7\00E3o da Pesquisa - %0')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141353232398752045)
,p_name=>'UTILIZATION_REPORTS.SHARED_DYNAMIC_LOV'
,p_message_language=>'pt'
,p_message_text=>unistr('LDV Din\00E2mica Partilhada - %0')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141353046984752045)
,p_name=>'UTILIZATION_REPORTS.TASK_DEFINITION'
,p_message_language=>'pt'
,p_message_text=>unistr('Defini\00E7\00E3o de Tarefa - %0')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141351552709752045)
,p_name=>'UTILIZATION_REPORTS.WORKFLOW'
,p_message_language=>'pt'
,p_message_text=>'Fluxo de trabalho - %0 '
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141373651911752051)
,p_name=>'VALID'
,p_message_language=>'pt'
,p_message_text=>unistr('V\00E1lido')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141365206621752049)
,p_name=>'VALIDATIONS'
,p_message_language=>'pt'
,p_message_text=>unistr('Valida\00E7\00F5es')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141425982559752067)
,p_name=>'VALUE_MUST_BE_SPECIFIED'
,p_message_language=>'pt'
,p_message_text=>unistr('\00C9 necess\00E1rio especificar o valor')
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141472216301752080)
,p_name=>'VALUE_MUST_BE_SPECIFIED_FOR'
,p_message_language=>'pt'
,p_message_text=>unistr('\00C9 necess\00E1rio especificar o valor para %0')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141394894213752057)
,p_name=>'VERTICAL'
,p_message_language=>'pt'
,p_message_text=>'vertical'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141386494726752055)
,p_name=>'VIEW'
,p_message_language=>'pt'
,p_message_text=>'visualizar'
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141420268828752065)
,p_name=>'VIEWS'
,p_message_language=>'pt'
,p_message_text=>unistr('visualiza\00E7\00F5es')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141426706028752067)
,p_name=>'VIEW_ALL'
,p_message_language=>'pt'
,p_message_text=>'Visualizar Tudo'
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141366635034752049)
,p_name=>'VISUALLY_HIDDEN_LINK'
,p_message_language=>'pt'
,p_message_text=>unistr('Liga\00E7\00E3o visualmente oculta')
,p_is_js_message=>true
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141407409311752061)
,p_name=>'WARNING'
,p_message_language=>'pt'
,p_message_text=>'Aviso'
,p_is_js_message=>true
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141386079394752055)
,p_name=>'WEEK'
,p_message_language=>'pt'
,p_message_text=>'semana'
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141381951480752054)
,p_name=>'WEEKLY'
,p_message_language=>'pt'
,p_message_text=>'Semanal'
,p_version_scn=>2705310
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141386176938752055)
,p_name=>'WEEKS'
,p_message_language=>'pt'
,p_message_text=>'semanas'
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141426081699752067)
,p_name=>'WELCOME_USER'
,p_message_language=>'pt'
,p_message_text=>'Damos-lhe as boas-vindas: %0'
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141424236231752066)
,p_name=>'WWV_DBMS_SQL.INVALID_CLOB'
,p_message_language=>'pt'
,p_message_text=>unistr('Foi encontrado um valor inv\00E1lido. Verifique os dados introduzidos.')
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141424399561752066)
,p_name=>'WWV_DBMS_SQL.INVALID_DATATYPE'
,p_message_language=>'pt'
,p_message_text=>unistr('Foi encontrado um valor inv\00E1lido. Verifique os dados introduzidos.')
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141362174480752048)
,p_name=>'WWV_DBMS_SQL.INVALID_DATE'
,p_message_language=>'pt'
,p_message_text=>unistr('Foi encontrado um valor de data inv\00E1lido. Verifique o formato da data.')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141424111571752066)
,p_name=>'WWV_DBMS_SQL.INVALID_NUMBER'
,p_message_language=>'pt'
,p_message_text=>unistr('Foi encontrado um valor num\00E9rico inv\00E1lido. Verifique o formato do n\00FAmero.')
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141373235598752051)
,p_name=>'WWV_DBMS_SQL.INVALID_TIMESTAMP'
,p_message_language=>'pt'
,p_message_text=>unistr('Foi encontrado um valor de indica\00E7\00E3o de data/hora inv\00E1lido. Verifique o formato de indica\00E7\00E3o de data/hora.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141397727615752058)
,p_name=>'WWV_DBMS_SQL.UNABLE_TO_BIND_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel associar "%0". Utilize aspas para itens com v\00E1rios bytes ou verifique se o item tem 30 bytes ou menos de comprimento. Utilize a sintaxe v() para referenciar itens com mais de 30 bytes.')
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141387520431752055)
,p_name=>'WWV_FLOW.ACCESS_DENIED'
,p_message_language=>'pt'
,p_message_text=>unistr('Acesso negado pela verifica\00E7\00E3o de seguran\00E7a de %0')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141390090701752056)
,p_name=>'WWV_FLOW.APP_NOT_AVAILABLE'
,p_message_language=>'pt'
,p_message_text=>unistr('Aplica\00E7\00E3o N\00E3o Dispon\00EDvel')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141388414113752056)
,p_name=>'WWV_FLOW.APP_NOT_FOUND_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('Aplica\00E7\00E3o n\00E3o encontrada.')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141388535179752056)
,p_name=>'WWV_FLOW.APP_NOT_FOUND_FOOTER_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('aplica\00E7\00E3o=%0  espa\00E7o de trabalho=%1')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141388982866752056)
,p_name=>'WWV_FLOW.APP_RESTRICTED'
,p_message_language=>'pt'
,p_message_text=>unistr('O acesso a esta aplica\00E7\00E3o est\00E1 restringido. Tente novamente mais tarde.')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141388865669752056)
,p_name=>'WWV_FLOW.APP_RESTRICTED_TO_DEV'
,p_message_language=>'pt'
,p_message_text=>unistr('O acesso a esta aplica\00E7\00E3o est\00E1 restringido a programadores de aplica\00E7\00F5es. Tente novamente mais tarde.')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141388059876752055)
,p_name=>'WWV_FLOW.BRANCH_FUNC_RETURNING_URL_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('ERR-7744 N\00E3o \00E9 poss\00EDvel processar a ramifica\00E7\00E3o para a fun\00E7\00E3o que devolve o URL.')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141387945507752055)
,p_name=>'WWV_FLOW.BRANCH_TO_FUNCT_RET_PAGE_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('ERR-7744 N\00E3o \00E9 poss\00EDvel processar a ramifica\00E7\00E3o para a fun\00E7\00E3o que devolve a p\00E1gina.')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141388230543752056)
,p_name=>'WWV_FLOW.CALL_TO_SHOW_FROM_PROC_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('ERR-1430 A chamada para apresenta\00E7\00E3o a partir do processo da p\00E1gina n\00E3o \00E9 suportada: G_FLOW_STEP_ID (%0).')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141389377079752056)
,p_name=>'WWV_FLOW.CLEAR_STEP_CACHE_ERR'
,p_message_language=>'pt'
,p_message_text=>'ERR-1018 Erro ao limpar cache de passos.'
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141387736767752055)
,p_name=>'WWV_FLOW.COMP_UNKNOWN_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('ERR-1005 Tipo de c\00E1lculo desconhecido.')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141388690210752056)
,p_name=>'WWV_FLOW.CUSTOM_AUTH_SESSION_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('ERR-1201 A ID da sess\00E3o n\00E3o est\00E1 definida na autentica\00E7\00E3o customizada.')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141388716905752056)
,p_name=>'WWV_FLOW.CUSTOM_AUTH_SESSION_FOOTER_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('p\00E1gina=%0')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141388312843752056)
,p_name=>'WWV_FLOW.DET_COMPANY_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('ERR-7620 N\00E3o foi poss\00EDvel determinar o espa\00E7o de trabalho para a aplica\00E7\00E3o (%0).')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141368886462752050)
,p_name=>'WWV_FLOW.EDIT'
,p_message_language=>'pt'
,p_message_text=>'Editar'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141387484201752055)
,p_name=>'WWV_FLOW.FIND_ITEM_ERR2'
,p_message_language=>'pt'
,p_message_text=>unistr('ERR-1802 N\00E3o \00E9 poss\00EDvel encontrar a ID do item "%0"')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141387109834752055)
,p_name=>'WWV_FLOW.FIND_ITEM_ID_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('ERR-1002 N\00E3o \00E9 poss\00EDvel encontrar a ID do item "%0" na aplica\00E7\00E3o "%1".')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141387271620752055)
,p_name=>'WWV_FLOW.FIND_ITEM_ID_ERR2'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro inesperado, n\00E3o \00E9 poss\00EDvel encontrar o nome do item ao n\00EDvel da aplica\00E7\00E3o ou da p\00E1gina.')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141387625972752055)
,p_name=>'WWV_FLOW.FIRST_PAGE_DATA_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('J\00E1 est\00E1 na primeira p\00E1gina dos dados.')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141404145186752060)
,p_name=>'WWV_FLOW.ITEM_POSTING_VIOLATION'
,p_message_language=>'pt'
,p_message_text=>unistr('A ID do Item (%0) n\00E3o \00E9 um item definido na p\00E1gina atual.')
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141361726286752048)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.INTERNAL_ONLY'
,p_message_language=>'pt'
,p_message_text=>unistr('O item pode ser definido atrav\00E9s da transmiss\00E3o de argumentos \00E0 aplica\00E7\00E3o.')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141362075823752048)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.NO_CHECKSUM'
,p_message_language=>'pt'
,p_message_text=>unistr('(N\00E3o foi fornecida uma soma de verifica\00E7\00E3o)')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141361519197752048)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.PRIVATE_BOOKMARK'
,p_message_language=>'pt'
,p_message_text=>unistr('O item pode ser definido quando acompanhado de uma soma de verifica\00E7\00E3o de "marcador de n\00EDvel de utilizador".')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141361488125752048)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.PUBLIC_BOOKMARK'
,p_message_language=>'pt'
,p_message_text=>unistr('O item pode ser definido quando acompanhado de uma soma de verifica\00E7\00E3o de "marcador de n\00EDvel de aplica\00E7\00E3o".')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141361680930752048)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.SESSION'
,p_message_language=>'pt'
,p_message_text=>unistr('O item pode ser definido quando acompanhado de um soma de verifica\00E7\00E3o de "sess\00E3o".')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141361325869752048)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.UNPROTECTED'
,p_message_language=>'pt'
,p_message_text=>unistr('O item n\00E3o tem prote\00E7\00E3o.')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141389458921752056)
,p_name=>'WWV_FLOW.NO_PAGE_HELP'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o existe nenhuma p\00E1gina de aux\00EDlio dispon\00EDvel.')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141377397927752052)
,p_name=>'WWV_FLOW.NO_PRIV_ON_SCHEMA'
,p_message_language=>'pt'
,p_message_text=>unistr('O espa\00E7o de trabalho %0 n\00E3o tem privil\00E9gios para analisar como schema %1.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141387869684752055)
,p_name=>'WWV_FLOW.PAGE_ACCEPT_RECUR_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('ERR-1010 O limite de recurs\00E3o do processamento de aceita\00E7\00E3o da ramifica\00E7\00E3o para p\00E1gina foi excedido. %0')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141344338088752043)
,p_name=>'WWV_FLOW.PAGE_PATTERN_NOT_RUNNABLE'
,p_message_language=>'pt'
,p_message_text=>unistr('P\00E1gina indispon\00EDvel, n\00E3o pode executar um padr\00E3o de p\00E1gina.')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141361981671752048)
,p_name=>'WWV_FLOW.PAGE_PROTECTION.SHOW_NO_URL_ALLOWED'
,p_message_language=>'pt'
,p_message_text=>unistr('Esta p\00E1gina n\00E3o pode ser invocada atrav\00E9s de um URL ou um comando GET ou POST para o procedimento show. Deve ser chamada com um tipo de ramo "Ramificar para P\00E1gina".')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141446714186752073)
,p_name=>'WWV_FLOW.SAVE_ROUTINE_NUMERIC_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro ao tentar gravar valor n\00E3o num\00E9rico no item %0. ')
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141379075941752053)
,p_name=>'WWV_FLOW.SCHEMA_NOT_EXISTS'
,p_message_language=>'pt'
,p_message_text=>unistr('O schema de an\00E1lise "%0" da aplica\00E7\00E3o n\00E3o existe na base de dados.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141379128077752053)
,p_name=>'WWV_FLOW.SERVICE_ADMIN_LINK'
,p_message_language=>'pt'
,p_message_text=>unistr('As contas no espa\00E7o de trabalho INTERNAL s\00F3 podem ser utilizadas no acesso a &PRODUCT_NAME. <a href="%0">Servi\00E7os de Administra\00E7\00E3o</a>.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141387090711752055)
,p_name=>'WWV_FLOW.SESSION_INFO_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('ERR-1029 N\00E3o \00E9 poss\00EDvel armazenar informa\00E7\00F5es da sess\00E3o.  sess\00E3o=%0 item=%1')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141390138690752056)
,p_name=>'WWV_FLOW.UNABLE_TO_STOP_TRACE_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel parar o diagn\00F3stico: %0')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141387323722752055)
,p_name=>'WWV_FLOW.UNEXPECTED_ERR'
,p_message_language=>'pt'
,p_message_text=>'Erro inesperado'
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141398139461752058)
,p_name=>'WWV_FLOW.UPDATE_SUB_ERR'
,p_message_language=>'pt'
,p_message_text=>'Erro em update_substitution_cache: %0'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141390288850752056)
,p_name=>'WWV_FLOW.VIEW_HELP_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('\00C9 necess\00E1rio fornecer a aplica\00E7\00E3o e a p\00E1gina para visualizar o aux\00EDlio.')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141411974190752063)
,p_name=>'WWV_FLOW_AUTOMATION.AUTOMATION_NOT_FOUND'
,p_message_language=>'pt'
,p_message_text=>unistr('A automatiza\00E7\00E3o n\00E3o foi encontrada.')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141347497332752044)
,p_name=>'WWV_FLOW_AUTOMATION.QUERY_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro de Consulta de Automatiza\00E7\00E3o: %0')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141391300114752056)
,p_name=>'WWV_FLOW_CACHE.PURGE_SESSION'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 sess\00F5es eliminadas.')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141332625694752039)
,p_name=>'WWV_FLOW_CODE_EXEC_MLE.LANGUAGE_NOT_SUPPORTED'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel executar o c\00F3digo %0. N\00E3o \00E9 suportado pela base de dados ou n\00E3o \00E9 ativado pelo par\00E2metro de inst\00E2ncia MLE_LANGUAGES.')
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141330210170752038)
,p_name=>'WWV_FLOW_CODE_EXEC_MLE.MLE_NOT_SUPPORTED'
,p_message_language=>'pt'
,p_message_text=>unistr('O Mecanismo Multilingue n\00E3o est\00E1 dispon\00EDvel nesta vers\00E3o da base de dados!')
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141369423147752050)
,p_name=>'WWV_FLOW_COLLECTION.ARRAY_NOT_NULL'
,p_message_language=>'pt'
,p_message_text=>unistr('A matriz da cole\00E7\00E3o de aplica\00E7\00F5es n\00E3o deve ser nula')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141369234785752050)
,p_name=>'WWV_FLOW_COLLECTION.ATTRIBUTE_NUMBER_OUTSIDE_RANGE'
,p_message_language=>'pt'
,p_message_text=>unistr('O n\00FAmero do atributo de membro %0 especificado \00E9 inv\00E1lido. O n\00FAmero do atributo deve ser entre 1 e %1')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141369719420752050)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_EXISTS'
,p_message_language=>'pt'
,p_message_text=>unistr('Existe uma cole\00E7\00E3o de aplica\00E7\00F5es')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141369559384752050)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NAME_NOT_NULL'
,p_message_language=>'pt'
,p_message_text=>unistr('O nome da cole\00E7\00E3o n\00E3o pode ser nula')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141369619774752050)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NAME_TOO_LARGE'
,p_message_language=>'pt'
,p_message_text=>unistr('O nome da cole\00E7\00E3o n\00E3o pode ter mais de 255 caracteres')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141369056029752050)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NOT_EXIST'
,p_message_language=>'pt'
,p_message_text=>unistr('A cole\00E7\00E3o de aplica\00E7\00F5es %0 n\00E3o existe')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141369830380752050)
,p_name=>'WWV_FLOW_COLLECTION.CURSOR_NOT_OPEN'
,p_message_language=>'pt'
,p_message_text=>unistr('O cursor ainda n\00E3o est\00E1 aberto')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141369162951752050)
,p_name=>'WWV_FLOW_COLLECTION.MEMBER_NOT_EXIST'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('A sequ\00EAncia de membros %0 n\00E3o existe na cole\00E7\00E3o de Aplica\00E7\00F5es %1'),
''))
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141369304017752050)
,p_name=>'WWV_FLOW_COLLECTION.MEMBER_SEQUENCE_NUMBER_INVALID'
,p_message_language=>'pt'
,p_message_text=>unistr('A sequ\00EAncia de membros %0 n\00E3o existe na cole\00E7\00E3o de Aplica\00E7\00F5es "%1"')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141322109225752036)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_ALGORITHM'
,p_message_language=>'pt'
,p_message_text=>unistr('O algoritmo %0 n\00E3o \00E9 suportado para ECDSA.')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141321860030752036)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_EC_CURVE'
,p_message_language=>'pt'
,p_message_text=>unistr('A curva el\00EDptica %0 n\00E3o \00E9 suportada.')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141447512772752073)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_FUNCTION'
,p_message_language=>'pt'
,p_message_text=>unistr('A fun\00E7\00E3o criptogr\00E1fica "%0" n\00E3o \00E9 suportada neste sistema.')
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141499815548752088)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_ACCESSIBLE'
,p_message_language=>'pt'
,p_message_text=>'Acessibilidade Testada'
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141390824114752056)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_CLOSE'
,p_message_language=>'pt'
,p_message_text=>'Fechar'
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141390935506752056)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_CUST_OPT'
,p_message_language=>'pt'
,p_message_text=>unistr('Op\00E7\00F5es de Customiza\00E7\00E3o da P\00E1gina')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141391046150752056)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_DEFAULT'
,p_message_language=>'pt'
,p_message_text=>unistr('Valor Por Omiss\00E3o')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141391125954752056)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_DISP'
,p_message_language=>'pt'
,p_message_text=>'Apresentado'
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141391287807752056)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_HIDDEN'
,p_message_language=>'pt'
,p_message_text=>'Oculto'
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141390611829752056)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE1'
,p_message_language=>'pt'
,p_message_text=>unistr('Selecione as regi\00F5es que pretende incluir nesta p\00E1gina. As regi\00F5es selecionadas podem n\00E3o ser apresentadas se n\00E3o estiver no contexto de aplica\00E7\00E3o adequado ou n\00E3o tiver os privil\00E9gios adequados.')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141390711377752056)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE2'
,p_message_language=>'pt'
,p_message_text=>unistr('Esta p\00E1gina n\00E3o \00E9 customiz\00E1vel.')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141500163394752089)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE3'
,p_message_language=>'pt'
,p_message_text=>unistr('Pode personalizar o aspeto desta aplica\00E7\00E3o ao alterar o Estilo do Tema. Selecione um Estilo do Tema na lista abaixo e clique em Aplicar Altera\00E7\00F5es.')
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141500912964752089)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_REGION_DISP'
,p_message_language=>'pt'
,p_message_text=>unistr('Apresenta\00E7\00E3o da Regi\00E3o')
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141500004887752089)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_REMOVE_STYLE'
,p_message_language=>'pt'
,p_message_text=>unistr('Utilizar Estilo Por Omiss\00E3o da Aplica\00E7\00E3o')
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141499922868752089)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_THEME_STYLE'
,p_message_language=>'pt'
,p_message_text=>'Aspeto '
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141444132370752072)
,p_name=>'WWV_FLOW_DATA_EXPORT.AGG_COLUMN_IDX_NOT_EXIST'
,p_message_language=>'pt'
,p_message_text=>unistr('O \00EDndice de colunas referenciado na agrega\00E7\00E3o %0 n\00E3o existe.')
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141336832619752040)
,p_name=>'WWV_FLOW_DATA_EXPORT.APPEND_NOT_SUPPORTED'
,p_message_language=>'pt'
,p_message_text=>unistr('A anexa\00E7\00E3o da exporta\00E7\00E3o de dados n\00E3o \00E9 suportada para o formato %0.')
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141299880734752029)
,p_name=>'WWV_FLOW_DATA_EXPORT.CLOB_NOT_SUPPORTED'
,p_message_language=>'pt'
,p_message_text=>unistr('A sa\00EDda de dados de CLOB n\00E3o \00E9 suportada para o formato %0.')
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141443810029752072)
,p_name=>'WWV_FLOW_DATA_EXPORT.COLUMN_BREAK_MUST_BE_IN_THE_BEGGINING'
,p_message_language=>'pt'
,p_message_text=>unistr('A quebra da coluna deve ficar no in\00EDcio da matriz de colunas.')
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141443976412752072)
,p_name=>'WWV_FLOW_DATA_EXPORT.COLUMN_GROUP_IDX_NOT_EXIST'
,p_message_language=>'pt'
,p_message_text=>unistr('O \00EDndice de grupo de colunas referenciado em %0 n\00E3o existe.')
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141351058012752045)
,p_name=>'WWV_FLOW_DATA_EXPORT.EXPORT'
,p_message_language=>'pt'
,p_message_text=>unistr('exporta\00E7\00E3o')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141358204706752047)
,p_name=>'WWV_FLOW_DATA_EXPORT.FORMAT_MUST_BE_XML'
,p_message_language=>'pt'
,p_message_text=>unistr('O formato de exporta\00E7\00E3o deve ser XML e utilizar ORDS como Servidor de Impress\00E3o.')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141444263515752072)
,p_name=>'WWV_FLOW_DATA_EXPORT.HIGHLIGHT_COLUMN_IDX_NOT_EXIST'
,p_message_language=>'pt'
,p_message_text=>unistr('O \00EDndice de colunas referenciado no destaque %0 n\00E3o existe.')
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141347607837752044)
,p_name=>'WWV_FLOW_DATA_EXPORT.INVALID_FORMAT'
,p_message_language=>'pt'
,p_message_text=>unistr('Formato de Exporta\00E7\00E3o Inv\00E1lido: %0')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141444039702752072)
,p_name=>'WWV_FLOW_DATA_EXPORT.PARENT_GROUP_IDX_NOT_EXIST'
,p_message_language=>'pt'
,p_message_text=>unistr('O \00EDndice de grupos pai referenciado em %0 n\00E3o existe.')
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141469293794752079)
,p_name=>'WWV_FLOW_DATA_LOADER.CANNOT_LOAD_INTO_GENERATED_ALWAYS_COLUMN'
,p_message_language=>'pt'
,p_message_text=>unistr('A coluna %1 da tabela %0 \00E9 uma coluna de identidade "GENERATED ALWAYS". Certifique-se de que nenhuma coluna de origem tem correspond\00EAncia com a coluna %1 na caixa de di\00E1logo Configurar.')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141380809235752053)
,p_name=>'WWV_FLOW_DATA_LOADER.COMMIT_INTERVAL_TOO_LOW'
,p_message_language=>'pt'
,p_message_text=>unistr('O intervalo de confirma\00E7\00E3o especificado \00E9 demasiado pequeno.')
,p_version_scn=>2705310
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141380978876752053)
,p_name=>'WWV_FLOW_DATA_LOADER.NO_COLUMNS_PROVIDED'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o foram fornecidas colunas para o carregamento de dados.')
,p_version_scn=>2705310
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141382221281752054)
,p_name=>'WWV_FLOW_DATA_PARSER.NO_COLUMNS_FOUND'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o foi encontrada nenhuma coluna para o seletor de linhas "%0". Experimente a dete\00E7\00E3o autom\00E1tica ou reveja a estrutura do JSON.')
,p_version_scn=>2705310
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141391659183752057)
,p_name=>'WWV_FLOW_DATA_PARSER.NO_WORKSHEETS_FOUND'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o foram encontradas folhas de c\00E1lculo no ficheiro XLSX.')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141336746653752040)
,p_name=>'WWV_FLOW_DATA_PARSER.REQUESTED_HIERARCHY_LEVELS_EXCEED_MAXIMUM'
,p_message_language=>'pt'
,p_message_text=>unistr('Os n\00EDveis de hierarquia pedidos para detetar (%0) excedem o m\00E1ximo de %1.')
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141391595778752056)
,p_name=>'WWV_FLOW_DATA_PARSER.WORKSHEET_DOES_NOT_EXIST'
,p_message_language=>'pt'
,p_message_text=>unistr('A folha de c\00E1lculo especificada n\00E3o existe no ficheiro XLSX.')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141369940903752050)
,p_name=>'WWV_FLOW_DML.VERSION_OF_DATA_CHANGED'
,p_message_language=>'pt'
,p_message_text=>unistr('A vers\00E3o atual dos dados na base de dados foi alterada desde que o utilizador iniciou o processo de atualiza\00E7\00E3o.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141372818108752051)
,p_name=>'WWV_FLOW_EDIT_REPORT.ERR_UPDATING_COLS'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro ao atualizar as colunas do relat\00F3rio: %0')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141483330275752084)
,p_name=>'WWV_FLOW_EXEC.CANNOT_CONVERT_TO_SDOGEOMETRY'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel converter %0 em SDO_GEOMETRY.')
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141419884498752065)
,p_name=>'WWV_FLOW_EXEC.CAN_NOT_CONVERT_TO_VARCHAR2'
,p_message_language=>'pt'
,p_message_text=>unistr('A coluna %0 com o tipo de dados %1 n\00E3o pode ser convertida em VARCHAR2!')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141427227991752067)
,p_name=>'WWV_FLOW_EXEC.COLUMN_NOT_FOUND'
,p_message_language=>'pt'
,p_message_text=>unistr('A coluna "%0" especificada para o atributo "%1" n\00E3o foi encontrada na origem de dados!')
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141363393402752048)
,p_name=>'WWV_FLOW_EXEC.FILTER_NOT_SUPPORTED_WITH_MULTIPLE_VALUES'
,p_message_language=>'pt'
,p_message_text=>unistr('O tipo de filtro %0 n\00E3o \00E9 suportado para colunas de v\00E1rios valores.')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141486858531752085)
,p_name=>'WWV_FLOW_EXEC.INVALID_BETWEEN_FILTER'
,p_message_language=>'pt'
,p_message_text=>unistr('Filtro "entre" inv\00E1lido.')
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141342461958752042)
,p_name=>'WWV_FLOW_EXEC.INVALID_COLUMN_OR_ROW_DATATYPE'
,p_message_language=>'pt'
,p_message_text=>'Nenhum valor %2 encontrado na coluna %0, linha #%1.'
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141339196415752041)
,p_name=>'WWV_FLOW_EXEC.INVALID_COLUMN_OR_ROW_REFERENCE'
,p_message_language=>'pt'
,p_message_text=>unistr('A coluna %0 ou a linha #%1 n\00E3o existe.')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141325739489752037)
,p_name=>'WWV_FLOW_EXEC.INVALID_LOV_SPECIFICATION'
,p_message_language=>'pt'
,p_message_text=>unistr('Foi especificado um tipo de LDV inv\00E1lido.')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141325652003752037)
,p_name=>'WWV_FLOW_EXEC.INVALID_QUERY_TYPE'
,p_message_language=>'pt'
,p_message_text=>unistr('Tipo de consulta inv\00E1lido. O tipo de consulta deve ser Tabela, Consulta de SQL ou Fun\00E7\00E3o de PL/SQL que devolve uma Consulta de SQL.')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141419912303752065)
,p_name=>'WWV_FLOW_EXEC.INVALID_SQL_QUERY'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Falha ao analisar a consulta de SQL!',
'%0'))
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141427338679752067)
,p_name=>'WWV_FLOW_EXEC.LEGACY_COLUMN_NOT_FOUND'
,p_message_language=>'pt'
,p_message_text=>unistr('A posi\00E7\00E3o de coluna %0 especificada para o atributo "%1" n\00E3o foi encontrada na instru\00E7\00E3o de SQL!')
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141317326032752035)
,p_name=>'WWV_FLOW_EXEC.MULTI_VALUE_TOO_MANY_ITEMS'
,p_message_language=>'pt'
,p_message_text=>unistr('Demasiados itens utilizados no filtro de V\00E1rios Valores.')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141427173013752067)
,p_name=>'WWV_FLOW_EXEC.NO_COLUMN_FOR_ATTRIBUTE'
,p_message_language=>'pt'
,p_message_text=>'Nenhuma coluna especificada para o atributo "%0".'
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141325564312752037)
,p_name=>'WWV_FLOW_EXEC.NULL_QUERY_RETURNED_BY_FUNCTION'
,p_message_language=>'pt'
,p_message_text=>unistr('O corpo da fun\00E7\00E3o de PL/SQL n\00E3o devolveu um valor.')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141442987235752072)
,p_name=>'WWV_FLOW_EXEC.OPERATION_NOT_PRESENT_IN_WEB_SRC_MODULE'
,p_message_language=>'pt'
,p_message_text=>unistr('A Origem de Dados REST n\00E3o cont\00E9m uma Opera\00E7\00E3o para processar a a\00E7\00E3o DML pedida.')
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141484684533752084)
,p_name=>'WWV_FLOW_EXEC.RANGE_BUCKET.NOT.SUPPORTED'
,p_message_language=>'pt'
,p_message_text=>unistr('Os filtros de intervalo s\00F3 s\00E3o suportados para os tipos de dados NUMBER, DATE ou TIMESTAMP.')
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141305539483752031)
,p_name=>'WWV_FLOW_EXEC.REST_REQUEST_ERROR'
,p_message_language=>'pt'
,p_message_text=>'Falha do pedido com %0'
,p_version_scn=>2705298
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141309086461752032)
,p_name=>'WWV_FLOW_EXEC.SPATIAL_JSON_NOT_AVAILABLE'
,p_message_language=>'pt'
,p_message_text=>unistr('A convers\00E3o de GeoJSON em SDO_GEOMETRY (coluna %0) n\00E3o est\00E1 dispon\00EDvel nesta base de dados.')
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141312430990752033)
,p_name=>'WWV_FLOW_EXEC.SPATIAL_NOT_SUPPORTED_FOR_XML'
,p_message_language=>'pt'
,p_message_text=>unistr('A convers\00E3o de SDO_GEOMETRY (coluna %0) n\00E3o \00E9 suportada para origens de dados em XML.')
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141336528511752040)
,p_name=>'WWV_FLOW_EXEC.UNSUPPPORTED_MULTI_VALUE_SEPARATOR'
,p_message_language=>'pt'
,p_message_text=>unistr('O car\00E1cter %0 n\00E3o \00E9 suportado como separador de v\00E1rios valores.')
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141484754380752084)
,p_name=>'WWV_FLOW_EXEC.WRONG_CONTEXT_TYPE'
,p_message_language=>'pt'
,p_message_text=>unistr('Esta fun\00E7\00E3o n\00E3o pode ser utilizada num Contexto de Consulta.')
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141312512920752033)
,p_name=>'WWV_FLOW_EXEC_API.INVALID_DATA_TYPE'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o correspond\00EAncia do Tipo de Dados da Coluna.')
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141346037322752043)
,p_name=>'WWV_FLOW_EXEC_DOC_SRC.REMOTE_MULTI_ROW_DML_NOT_SUPPORTED_WITHOUT_JSON_BINDS'
,p_message_language=>'pt'
,p_message_text=>unistr('Esta origem de dados n\00E3o suporta a altera\00E7\00E3o de v\00E1rias linhas.')
,p_version_scn=>2705304
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141325404852752037)
,p_name=>'WWV_FLOW_EXEC_REMOTE.ORDS_OUT_BIND_LIMIT_EXCEEDED'
,p_message_language=>'pt'
,p_message_text=>unistr('Os limites de Associa\00E7\00E3o de ORDS OUT internos foram excedidos. Reduza a quantidade de linhas de DML.')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141428165704752067)
,p_name=>'WWV_FLOW_EXEC_REMOTE.RESPONSE_PARSING_ERROR'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('N\00E3o foi poss\00EDvel analisar a resposta de JSON a partir do servidor remoto: '),
'%0'))
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141325393938752037)
,p_name=>'WWV_FLOW_EXEC_REMOTE.RUN_PLSQL_ERR'
,p_message_language=>'pt'
,p_message_text=>'Tipo de contexto desconhecido ou incorreto.'
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141349470139752044)
,p_name=>'WWV_FLOW_EXPORT_INT.UNSUPPORTED_READABLE_EXPORT'
,p_message_language=>'pt'
,p_message_text=>unistr('Componentes n\00E3o suportados para a exporta\00E7\00E3o leg\00EDvel: %0')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141447460936752073)
,p_name=>'WWV_FLOW_FILE_PARSER.UNKNOWN_FILE_TYPE'
,p_message_language=>'pt'
,p_message_text=>unistr('Este tipo de ficheiro n\00E3o \00E9 suportado pelo analisador.')
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141398261853752058)
,p_name=>'WWV_FLOW_FND_DEVELOPER_API.CREDENTIALS_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('Acesso n\00E3o autorizado (wwv_flow_api.set_credentials n\00E3o definido).')
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141373164909752051)
,p_name=>'WWV_FLOW_FND_USER_API.CREATE_COMPANY'
,p_message_language=>'pt'
,p_message_text=>unistr('O espa\00E7o de trabalho n\00E3o foi criado porque j\00E1 existe.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141373004045752051)
,p_name=>'WWV_FLOW_FND_USER_API.CREATE_USER_GROUP'
,p_message_language=>'pt'
,p_message_text=>unistr('O grupo de utilizadores n\00E3o foi criado porque j\00E1 existe.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141384402873752054)
,p_name=>'WWV_FLOW_FND_USER_API.DUP_USER'
,p_message_language=>'pt'
,p_message_text=>'Nome de utilizador duplicado encontrado para %0.'
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141384537336752054)
,p_name=>'WWV_FLOW_FND_USER_API.LOAD_ERR'
,p_message_language=>'pt'
,p_message_text=>'Erro ao carregar utilizadores. Falha no utilizador %0.'
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141395300651752058)
,p_name=>'WWV_FLOW_FND_USER_API.T_MESSAGE'
,p_message_language=>'pt'
,p_message_text=>'Teria carregado %0 utilizadores.'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141395137777752058)
,p_name=>'WWV_FLOW_FND_USER_API.T_PASSWORD'
,p_message_language=>'pt'
,p_message_text=>'Senha'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141395205948752058)
,p_name=>'WWV_FLOW_FND_USER_API.T_PRIVILEGE'
,p_message_language=>'pt'
,p_message_text=>unistr('Privil\00E9gios')
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141394970650752057)
,p_name=>'WWV_FLOW_FND_USER_API.T_USERNAME'
,p_message_language=>'pt'
,p_message_text=>'Nome de Utilizador'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141475394029752081)
,p_name=>'WWV_FLOW_FORM.UNHANDLED_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro durante a renderiza\00E7\00E3o do item de p\00E1gina #COMPONENT_NAME#.')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141390384859752056)
,p_name=>'WWV_FLOW_FORMS.FORM_NOT_OPEN_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel apresentar o item da p\00E1gina porque a ficha em HTML ainda n\00E3o foi aberta.')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141348741297752044)
,p_name=>'WWV_FLOW_FORMS.ITEM_DEFAULT_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro ao calcular valor por omiss\00E3o para o item da p\00E1gina #COMPONENT_NAME#.')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141389658395752056)
,p_name=>'WWV_FLOW_FORMS.ITEM_POST_CALC_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro no p\00F3s-c\00E1lculo do item de p\00E1gina #COMPONENT_NAME#.')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141389583623752056)
,p_name=>'WWV_FLOW_FORMS.ITEM_SOURCE_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro ao calcular valor de origem do item de p\00E1gina #COMPONENT_NAME#.')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141366375100752049)
,p_name=>'WWV_FLOW_HELP.UNAUTHORIZED'
,p_message_language=>'pt'
,p_message_text=>unistr('Acesso n\00E3o autorizado.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141315822429752034)
,p_name=>'WWV_FLOW_INTERACTIVE_GRID.INVALID_JSON_ARRAY'
,p_message_language=>'pt'
,p_message_text=>unistr('O valor %0 de %1 n\00E3o \00E9 uma matriz de JSON v\00E1lida.')
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141389860166752056)
,p_name=>'WWV_FLOW_ITEM.JS_NOT_SUPPORTED'
,p_message_language=>'pt'
,p_message_text=>unistr('JavaScript n\00E3o suportado.')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141389953231752056)
,p_name=>'WWV_FLOW_ITEM.LIST'
,p_message_language=>'pt'
,p_message_text=>'Lista'
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141390584750752056)
,p_name=>'WWV_FLOW_ITEM.UNABLE_INIT_QUERY'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel inicializar a consulta.')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141398501975752059)
,p_name=>'WWV_FLOW_ITEM.UPDATE_NOT_SUPPORTED_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('A atualiza\00E7\00E3o de %0 n\00E3o \00E9 suportada.')
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141392002428752057)
,p_name=>'WWV_FLOW_ITEM_HELP.INVALID_ITEM_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('ID de item inv\00E1lido: %0 ')
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141419722883752065)
,p_name=>'WWV_FLOW_ITEM_HELP.NO_HELP_EXISTS'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o existe aux\00EDlio para este item.')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141381529264752054)
,p_name=>'WWV_FLOW_JET_CHART.QUERY_GENERATION_FAILED'
,p_message_language=>'pt'
,p_message_text=>unistr('Falha na gera\00E7\00E3o da consulta do diagrama. Verifique a defini\00E7\00F5es Origem e Correspond\00EAncia de Colunas.')
,p_version_scn=>2705310
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141382884053752054)
,p_name=>'WWV_FLOW_MAIL.ADD_ATTACHMENT.INVALID_MAIL_ID'
,p_message_language=>'pt'
,p_message_text=>unistr('Valor inv\00E1lido para o par\00E2metro p_mail_id: %0')
,p_version_scn=>2705310
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141419535010752065)
,p_name=>'WWV_FLOW_MAIL.CANNOT_USE_TO_OR_REPLYTO_AS_FROM'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel utilizar "Para" ou "Responder A" como endere\00E7o "De", uma vez que estes cont\00EAm v\00E1rios endere\00E7os de email.')
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141504473802752090)
,p_name=>'WWV_FLOW_MAIL.EMAIL_LIMIT_EXCEEDED'
,p_message_language=>'pt'
,p_message_text=>unistr('Excedeu o n\00FAmero m\00E1ximo de mensagens de email por espa\00E7o de trabalho. Contacte o administrador.')
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141361006556752047)
,p_name=>'WWV_FLOW_MAIL.INVALID_CONTEXT'
,p_message_language=>'pt'
,p_message_text=>unistr('Este procedimento deve ser invocado numa sess\00E3o da aplica\00E7\00E3o.')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141382761789752054)
,p_name=>'WWV_FLOW_MAIL.PARAMETER_NULL'
,p_message_language=>'pt'
,p_message_text=>unistr('Valor nulo fornecido para o par\00E2metro %0.')
,p_version_scn=>2705310
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141440836385752071)
,p_name=>'WWV_FLOW_MAIL.PREPARE_TEMPLATE.NO_DATA_FOUND'
,p_message_language=>'pt'
,p_message_text=>unistr('O modelo de email "%0" n\00E3o foi encontrado na aplica\00E7\00E3o %1.')
,p_version_scn=>2705320
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141517346773752094)
,p_name=>'WWV_FLOW_MAIL.SMTP_HOST_ADDRESS_REQUIRED'
,p_message_language=>'pt'
,p_message_text=>unistr('O par\00E2metro de inst\00E2ncia SMTP_HOST_ADDRESS deve ser definido para enviar correio.')
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141382192265752054)
,p_name=>'WWV_FLOW_MAIL.TO_IS_REQUIRED'
,p_message_language=>'pt'
,p_message_text=>unistr('Deve fornece um destinat\00E1rio da mensagem para enviar correio.')
,p_version_scn=>2705310
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141506802139752091)
,p_name=>'WWV_FLOW_MAIL.UNABLE_TO_OPEN_SMTP_CONNECTION'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel estabelecer a liga\00E7\00E3o de SMTP com o servidor de email configurado.')
,p_version_scn=>2705334
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141482157766752083)
,p_name=>'WWV_FLOW_PLUGIN.INVALID_AJAX_CALL'
,p_message_language=>'pt'
,p_message_text=>unistr('Chamada de Ajax inv\00E1lida!')
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141366058573752049)
,p_name=>'WWV_FLOW_PLUGIN.NO_AJAX_FUNCTION'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o foi definida nenhuma fun\00E7\00E3o Ajax para o plug-in %0')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141472662349752080)
,p_name=>'WWV_FLOW_PLUGIN.NO_EXECUTION_FUNCTION'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o foi definida nenhuma fun\00E7\00E3o de execu\00E7\00E3o para o plug-in %0')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141366166699752049)
,p_name=>'WWV_FLOW_PLUGIN.NO_RENDER_FUNCTION'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o foi definida nenhuma fun\00E7\00E3o de renderiza\00E7\00E3o para o plug-in %0')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141483067614752083)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_CAPABILITIES_FUNCTION'
,p_message_language=>'pt'
,p_message_text=>unistr('O Plug-In da Origem de Dados REST "%0" n\00E3o cont\00E9m uma fun\00E7\00E3o "Capacidades".')
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141482962928752083)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_DML_FUNCTION'
,p_message_language=>'pt'
,p_message_text=>unistr('O Plug-In da Origem de Dados REST "%0" n\00E3o cont\00E9m uma fun\00E7\00E3o DML.')
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141483171173752084)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_EXECUTE_FUNCTION'
,p_message_language=>'pt'
,p_message_text=>unistr('O Plug-In da Origem de Dados REST "%0" n\00E3o cont\00E9m uma fun\00E7\00E3o de execu\00E7\00E3o.')
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141483225510752084)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_FETCH_FUNCTION'
,p_message_language=>'pt'
,p_message_text=>unistr('O Plug-In da Origem de Dados REST "%0" n\00E3o cont\00E9m uma fun\00E7\00E3o de extra\00E7\00E3o.')
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141363575077752048)
,p_name=>'WWV_FLOW_PLUGIN.RUN_PLSQL_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro no c\00F3digo PLSQL gerado durante o processamento do plug-in.')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141372111602752051)
,p_name=>'WWV_FLOW_PLUGIN_DEV.IS_REQUIRED'
,p_message_language=>'pt'
,p_message_text=>unistr('\00C9 necess\00E1rio especificar o valor.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141405142452752061)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.CANT_CONVERT_TO_VARCHAR2'
,p_message_language=>'pt'
,p_message_text=>unistr('O tipo de dados %0 n\00E3o pode ser convertido em VARCHAR2!')
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141493396386752087)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.COLUMN_NOT_FOUND'
,p_message_language=>'pt'
,p_message_text=>unistr('A coluna "%0" especificada para o atributo "%1" n\00E3o foi encontrada na instru\00E7\00E3o de SQL!')
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141320647213752036)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.INVALID_JSON_ARRAY'
,p_message_language=>'pt'
,p_message_text=>unistr('O valor %0 de %1 n\00E3o \00E9 uma matriz de JSON v\00E1lida.')
,p_version_scn=>2705301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141470566429752080)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.LOV_REQUIRED'
,p_message_language=>'pt'
,p_message_text=>unistr('\00C9 necess\00E1rio especificar um consulta de lista de valores (LDV) ou uma lista de valores Nomeada para %0.')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141472169223752080)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.LOV_SQL_WRONG_COLUMN_COUNT'
,p_message_language=>'pt'
,p_message_text=>unistr('Foi selecionado um n\00FAmero incorreto de colunas nas consulta de SQL da LDV para %0. Consulte os exemplos para obter instru\00E7\00F5es v\00E1lidas.')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141493186650752087)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.NO_COLUMN_FOR_ATTRIBUTE'
,p_message_language=>'pt'
,p_message_text=>'Nenhuma coluna especificada para o atributo "%0".'
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141522359933752095)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.NUMBER_ATTRIBUTE_VALUE_INVALID'
,p_message_language=>'pt'
,p_message_text=>unistr('O valor %0 introduzido para o atributo "%1" n\00E3o \00E9 num\00E9rico.')
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141475697600752081)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.SQL_WRONG_DATA_TYPE'
,p_message_language=>'pt'
,p_message_text=>unistr('%0 tem um tipo de dados incorreto na instru\00E7\00E3o de SQL. Column# %1 \00E9 %2, mas era esperado %3.')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141493241537752087)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.WRONG_COLUMN_DATA_TYPE'
,p_message_language=>'pt'
,p_message_text=>'A coluna "%0" especificada para o atributo "%1" tem o tipo de dados %2, mas deveria ter %3.'
,p_version_scn=>2705333
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141362746948752048)
,p_name=>'WWV_FLOW_PRINT_UTIL.REPORT_LAYOUT_NOT_FOUND'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel encontrar a disposi\00E7\00E3o do relat\00F3rio.')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141350375262752044)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTIONS_LIMIT_EXCEEDED'
,p_message_language=>'pt'
,p_message_text=>unistr('Limite de Execu\00E7\00F5es em Segundo Plano excedido para %0.')
,p_version_scn=>2705305
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141300602927752030)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTION_ALREADY_RUNNING'
,p_message_language=>'pt'
,p_message_text=>unistr('J\00E1 est\00E1 em curso Outra Execu\00E7\00E3o de %0.')
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141300556815752030)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTION_ALREADY_RUNNING_CTX'
,p_message_language=>'pt'
,p_message_text=>unistr('J\00E1 est\00E1 em curso Outra Execu\00E7\00E3o de %0 para o contexto %1.')
,p_version_scn=>2705297
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141315564300752034)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.FILES_NOT_VISIBLE_IN_WORKING_SESSION'
,p_message_language=>'pt'
,p_message_text=>unistr('Os ficheiros carregados n\00E3o s\00E3o vis\00EDveis na sess\00E3o de trabalho para a Execu\00E7\00E3o de %0.')
,p_version_scn=>2705299
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141428023486752067)
,p_name=>'WWV_FLOW_RENDER_REPORT3.COMPUTE_SUM_NOT_SUPPORTED_FOR_WEB_SOURCES'
,p_message_language=>'pt'
,p_message_text=>unistr('A funcionalidade Calcular Soma n\00E3o pode ser utilizada para relat\00F3rios baseados numa Origem de Dados REST.')
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141389706233752056)
,p_name=>'WWV_FLOW_RENDER_SHORTCUT.UNABLE_SET_SHORT_VAL_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('ERR-2904 N\00E3o \00E9 poss\00EDvel definir valor do atalho.')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141394787177752057)
,p_name=>'WWV_FLOW_RENDER_SHORTCUT.UNKNOWN_TYPE_ERR'
,p_message_language=>'pt'
,p_message_text=>'Erro: Tipo de atalho desconhecido.'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141332496178752039)
,p_name=>'WWV_FLOW_SEARCH_API.TEXT_QUERY_TOO_LONG'
,p_message_language=>'pt'
,p_message_text=>'Consulta de pesquisa demasiado longa.'
,p_version_scn=>2705302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141383885883752054)
,p_name=>'WWV_FLOW_SECURITY.AUTH_SCHEME_FETCH_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel extrair authentication_scheme na aplica\00E7\00E3o %0.')
,p_version_scn=>2705310
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141391811615752057)
,p_name=>'WWV_FLOW_SECURITY.COMPONENT_FETCH_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel extrair o componente %0.')
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141462147101752077)
,p_name=>'WWV_FLOW_SESSION_API.TENANT_ID_EXISTS'
,p_message_language=>'pt'
,p_message_text=>unistr('A ID do tenant j\00E1 existe para a sess\00E3o atual.')
,p_version_scn=>2705326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141395041653752058)
,p_name=>'WWV_FLOW_USER_API.T_EMAIL'
,p_message_language=>'pt'
,p_message_text=>'E-Mail'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141521871189752095)
,p_name=>'WWV_FLOW_WEB_SERVICES.AUTHENTICATION_FAILED'
,p_message_language=>'pt'
,p_message_text=>unistr('Falha na autentica\00E7\00E3o.')
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141422471607752066)
,p_name=>'WWV_FLOW_WEB_SERVICES.COOKIE_INVALID'
,p_message_language=>'pt'
,p_message_text=>unistr('Um ou mais cookies definidos em apex_util.g_request_cookies cont\00EAm um valor inv\00E1lido.')
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141404363688752060)
,p_name=>'WWV_FLOW_WEB_SERVICES.INVALID_UDDI_RESPONSE'
,p_message_language=>'pt'
,p_message_text=>unistr('A resposta do registo de UDDI era inv\00E1lida.')
,p_version_scn=>2705314
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141363611131752048)
,p_name=>'WWV_FLOW_WEB_SERVICES.INVALID_WSDL'
,p_message_language=>'pt'
,p_message_text=>unistr('O URL fornecido n\00E3o devolveu uma documento em WSDL v\00E1lido.')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141366455391752049)
,p_name=>'WWV_FLOW_WEB_SERVICES.MULTIPLE_SOAP'
,p_message_language=>'pt'
,p_message_text=>unistr('O documento em WSDL cont\00E9m v\00E1rias associa\00E7\00F5es de SOAP. &PRODUCT_NAME. Apenas suporta WSDLs com uma associa\00E7\00E3o de SOAP. Clique em Criar Manualmente Refer\00EAncia de Servi\00E7o Web para continuar a criar uma refer\00EAncia para este servi\00E7o.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141442035291752071)
,p_name=>'WWV_FLOW_WEB_SERVICES.NOT_XML'
,p_message_language=>'pt'
,p_message_text=>unistr('A resposta do servi\00E7o n\00E3o foi XML.')
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141521764332752095)
,p_name=>'WWV_FLOW_WEB_SERVICES.NO_VALID_OAUTH_TOKEN'
,p_message_language=>'pt'
,p_message_text=>unistr('O token de acesso de OAuth n\00E3o est\00E1 dispon\00EDvel ou expirou.')
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141486244921752084)
,p_name=>'WWV_FLOW_WEB_SERVICES.REQUEST_LIMIT_EXCEEDED'
,p_message_language=>'pt'
,p_message_text=>unistr('Excedeu o n\00FAmero m\00E1ximo de pedidos de servi\00E7o Web por espa\00E7o de trabalho. Contacte o administrador.')
,p_version_scn=>2705330
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141521947699752095)
,p_name=>'WWV_FLOW_WEB_SERVICES.UNSUPPORTED_OAUTH_TOKEN'
,p_message_language=>'pt'
,p_message_text=>unistr('O servidor respondeu com um tipo de token de OAuth n\00E3o suportado.')
,p_version_scn=>2705335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141365873008752049)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_NO_SOAP'
,p_message_language=>'pt'
,p_message_text=>unistr('O documento em WSDL n\00E3o continha uma associa\00E7\00E3o para SOAP, o que \00E9 obrigat\00F3rio para acrescentar a refer\00EAncia.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141361233353752048)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_REQUIRES_AUTH'
,p_message_language=>'pt'
,p_message_text=>unistr('Este WSDL requer credenciais de autentica\00E7\00E3o. Forne\00E7a o nome de utilizador e a senha abaixo.')
,p_version_scn=>2705307
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141372211657752051)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_UNHANDLED'
,p_message_language=>'pt'
,p_message_text=>unistr('O mecanismo de renderiza\00E7\00E3o n\00E3o conseguiu compreender o documento em WSDL. Clique em Criar Manualmente Refer\00EAncia do Servi\00E7o Web para criar uma refer\00EAncia para este servi\00E7o.')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141445010834752072)
,p_name=>'WWV_FLOW_WIZARD_API.UPDATE_ERROR'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel processar a atualiza\00E7\00E3o.')
,p_version_scn=>2705324
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141470812089752080)
,p_name=>'WWV_FLOW_WORKSHEET.LOV_DISPLAY_AND_RETURN_COLUMN_EQUAL'
,p_message_language=>'pt'
,p_message_text=>unistr('As colunas de devolu\00E7\00E3o e apresenta\00E7\00E3o da Lista de Valores s\00E3o iguais!')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141470777823752080)
,p_name=>'WWV_FLOW_WORKSHEET.LOV_NO_RETURN_COLUMN'
,p_message_language=>'pt'
,p_message_text=>unistr('A Lista de Valores n\00E3o tem uma coluna de devolu\00E7\00E3o.')
,p_version_scn=>2705328
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141398494967752059)
,p_name=>'WWV_RENDER_REPORT3.COLUMN_VALUE_ERR'
,p_message_language=>'pt'
,p_message_text=>'Erro ao extrair valor da coluna: %0'
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141423397848752066)
,p_name=>'WWV_RENDER_REPORT3.DATA_TOO_OLD'
,p_message_language=>'pt'
,p_message_text=>unistr('Os dados da ficha tabular atual s\00E3o demasiado antigos; os dados de origem foram modificados.<br/> Clique <strong><a href="%0">aqui</a></strong> para excluir as altera\00E7\00F5es e carregar novamente os dados a partir da base de dados.')
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141378596961752053)
,p_name=>'WWV_RENDER_REPORT3.ERR_DETERMINE_PAGINATION'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro ao determinar cadeia de caracteres de pagina\00E7\00E3o')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141378407972752053)
,p_name=>'WWV_RENDER_REPORT3.ERR_DETERMINE_QUERY_HEADINGS'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('n\00E3o \00E9 poss\00EDvel determinar os t\00EDtulos da consulta:'),
'%0'))
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141378603134752053)
,p_name=>'WWV_RENDER_REPORT3.ERR_REPORT_FOOTER'
,p_message_language=>'pt'
,p_message_text=>unistr('erro ao efetuar substitui\00E7\00F5es do rodap\00E9 do relat\00F3rio')
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141378762316752053)
,p_name=>'WWV_RENDER_REPORT3.FAILED_PARSING_QUERY'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'falha ao analisar a consulta de SQL:',
'%0',
'%1'))
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141384856194752055)
,p_name=>'WWV_RENDER_REPORT3.FOUND_BUT_NOT_DISPLAYED'
,p_message_language=>'pt'
,p_message_text=>unistr('N\00FAmero m\00EDnimo de linhas pedido: %0, linhas encontradas, mas n\00E3o apresentadas: %1')
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141381202125752053)
,p_name=>'WWV_RENDER_REPORT3.HTML_USE_COLUMN_ALIAS'
,p_message_language=>'pt'
,p_message_text=>unistr('a coluna de consulta #%0 (%1) \00E9 inv\00E1lida, as colunas que utilizam HTML necessitam de nomes de pseud\00F3nimos')
,p_version_scn=>2705310
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141398377353752058)
,p_name=>'WWV_RENDER_REPORT3.QUERY_HEADING_ERR'
,p_message_language=>'pt'
,p_message_text=>unistr('Erro ao obter t\00EDtulos da consulta: %0')
,p_version_scn=>2705312
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141378832980752053)
,p_name=>'WWV_RENDER_REPORT3.REPORT_ERROR'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('erro de relat\00F3rio:'),
'%0'))
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141418934291752065)
,p_name=>'WWV_RENDER_REPORT3.SORT_BY_THIS_COLUMN'
,p_message_language=>'pt'
,p_message_text=>'Ordenar por esta coluna'
,p_version_scn=>2705316
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141381350386752053)
,p_name=>'WWV_RENDER_REPORT3.SYNTAX_ERROR'
,p_message_language=>'pt'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>N\00E3o \00E9 poss\00EDvel analisar a consulta. Verifique a sintaxe da consulta.'),
'(%0)',
'</p>'))
,p_version_scn=>2705310
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141423429790752066)
,p_name=>'WWV_RENDER_REPORT3.UNSAVED_DATA'
,p_message_language=>'pt'
,p_message_text=>unistr('Esta ficha cont\00E9m altera\00E7\00F5es n\00E3o gravadas. Prima "OK" para continuar sem gravar as altera\00E7\00F5es. ')
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141427979362752067)
,p_name=>'WWV_RENDER_REPORT3.UNSUPPORTED_PAGINATION_SCHEME'
,p_message_language=>'pt'
,p_message_text=>unistr('O esquema de pagina\00E7\00E3o do relat\00F3rio (%0) n\00E3o \00E9 suportado com a origem de dados escolhida.')
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141381138610752053)
,p_name=>'WWV_RENDER_REPORT3.USE_COLUMN_ALIAS'
,p_message_language=>'pt'
,p_message_text=>unistr('a coluna de consulta #%0 (%1) \00E9 inv\00E1lida, utilize o pseud\00F3nimo da coluna')
,p_version_scn=>2705310
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141384981553752055)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_MORE_THAN_Z'
,p_message_language=>'pt'
,p_message_text=>'linha(s) %0 - %1 de mais de %2'
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141425462133752067)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_MORE_THAN_Z_2'
,p_message_language=>'pt'
,p_message_text=>'%0 - %1 de mais de %2'
,p_version_scn=>2705317
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141384714579752054)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z'
,p_message_language=>'pt'
,p_message_text=>'linha(s) %0 - %1 de %2'
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141365542484752049)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z_2'
,p_message_language=>'pt'
,p_message_text=>'%0 - %1 de %2'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141378906966752053)
,p_name=>'Y'
,p_message_language=>'pt'
,p_message_text=>'S'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141386247321752055)
,p_name=>'YEAR'
,p_message_language=>'pt'
,p_message_text=>'ano'
,p_version_scn=>2705311
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141378130180752053)
,p_name=>'YEARS'
,p_message_language=>'pt'
,p_message_text=>'anos'
,p_version_scn=>2705308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141423549919752066)
,p_name=>'YES'
,p_message_language=>'pt'
,p_message_text=>'Sim'
,p_version_scn=>2705317
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
 p_id=>wwv_flow_imp.id(109678305570583962.4495)
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
 p_id=>1.4495
,p_name=>'Mensagens'
,p_alias=>'MESSAGES'
,p_step_title=>'Mensagens'
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
