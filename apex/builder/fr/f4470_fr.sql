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
,p_default_application_id=>4472
,p_default_id_offset=>0
,p_default_owner=>'APEX_240200'
);
end;
/
 
prompt APPLICATION 4472 - Oracle APEX Runtime Messages
--
-- Application Export:
--   Application:     4472
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
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'A144691631720755468')
,p_page_view_logging=>'YES'
,p_charset=>'utf-8'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt_last_reset=>'20250422180859'
,p_bookmark_checksum_function=>'SH1'
,p_compatibility_mode=>'24.2'
,p_session_state_commits=>'IMMEDIATE'
,p_flow_language=>'fr'
,p_flow_language_derived_from=>'SESSION'
,p_date_format=>'&DATE_FORMAT.'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(109678305570583962.4472)
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
 p_id=>wwv_flow_imp.id(4472)
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
 p_id=>wwv_flow_imp.id(728504220438374.4472)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SELECT_MANY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_values_as', 'separated')).to_clob
,p_version_scn=>7007816
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(736540203200530.4472)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_BOSS'
,p_version_scn=>243430877
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(800575880762576.4472)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'NATIVE_OPEN_AI_ASSISTANT'
,p_version_scn=>15457644
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2657043006125217.4472)
,p_plugin_type=>'PROCESS TYPE'
,p_plugin=>'NATIVE_GEOCODING'
,p_attribute_01=>'RELAX_HOUSE_NUMBER'
,p_version_scn=>117636987
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(110599941590099161.4472)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'default_icon', 'fa-star',
  'tooltip', '#VALUE#')).to_clob
,p_version_scn=>7007818
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(118481226255833028.4472)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_MAP_REGION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_vector_tile_layers', 'Y')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(123214098089478467.4472)
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
 p_id=>wwv_flow_imp.id(124389732573989299.4472)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_ADFBC'
,p_version_scn=>37165931336889
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(209516503264520988.4472)
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
 p_id=>wwv_flow_imp.id(285800719532138903.4472)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N')).to_clob
,p_version_scn=>7007823
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(649595203182764436.4472)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_style', 'SWITCH_CB',
  'off_value', 'N',
  'on_value', 'Y')).to_clob
,p_version_scn=>6539584
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1874744429444344138.4472)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'include_slider', 'N')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1941451863897626238.4472)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'actions_menu_structure', 'IG')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2027366558906572283.4472)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'mode', 'FULL')).to_clob
,p_version_scn=>7007824
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2120597162971751123.4472)
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
 p_id=>wwv_flow_imp.id(649613204592764515.4472)
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
 p_id=>wwv_flow_imp.id(850359229090693491.4472)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Wizard Dialog.fr'
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
 p_id=>wwv_flow_imp.id(293526110820992194.4472)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4472)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293526630547992195.4472)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4472)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293527171164992195.4472)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4472)
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
 p_id=>wwv_flow_imp.id(851037359784626333.4472)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Dialog.fr'
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
 p_id=>wwv_flow_imp.id(293473352245977306.4472)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4472)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293473882718977306.4472)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4472)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293474370844977307.4472)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4472)
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
 p_id=>wwv_flow_imp.id(851037631091626378.4472)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Edit Screen.fr'
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
 p_id=>wwv_flow_imp.id(2495515088702127.4472)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4472)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2496016567702127.4472)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4472)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2496522618702127.4472)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4472)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2497097895702127.4472)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4472)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2497562953702128.4472)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4472)
,p_name=>'Edit Screen Header'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2498085850702128.4472)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4472)
,p_name=>'Page Position 5'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2498553894702128.4472)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4472)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2499023066702128.4472)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4472)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2499516729702128.4472)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4472)
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
 p_id=>wwv_flow_imp.id(851039898661626389.4472)
,p_theme_id=>3
,p_name=>'APEX 5.0 - No Side Bar.fr'
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
 p_id=>wwv_flow_imp.id(2418665544706094.4472)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4472)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2419139140706094.4472)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4472)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2419660231706094.4472)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4472)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2420136000706094.4472)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4472)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2420617033706094.4472)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4472)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2421142368706094.4472)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4472)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2421629849706095.4472)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4472)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2422132460706095.4472)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4472)
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
 p_id=>wwv_flow_imp.id(851040471818626394.4472)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Right Side Bar.fr'
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
 p_id=>wwv_flow_imp.id(1537388880131854.4472)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4472)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1537880270131855.4472)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4472)
,p_name=>'Page Header (Position 3)'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1538315330131855.4472)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4472)
,p_name=>'Page Header (Position 4)'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1538840638131855.4472)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4472)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1539339441131855.4472)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4472)
,p_name=>'After Body'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1539830162131855.4472)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4472)
,p_name=>'Page Header (Position 1)'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1540338421131855.4472)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4472)
,p_name=>'Page Header (Position 2)'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1540832064131856.4472)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4472)
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
 p_id=>wwv_flow_imp.id(851041812938626395.4472)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Sign Up Wizard.fr'
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
 p_id=>wwv_flow_imp.id(115212309210289451.4472)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4472)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115212857712289451.4472)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4472)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115213340345289452.4472)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4472)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115213804331289452.4472)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4472)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115214317592289452.4472)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4472)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115214875819289453.4472)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4472)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115215325320289453.4472)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4472)
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
 p_id=>wwv_flow_imp.id(851042476105626395.4472)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Wizard Page.fr'
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
 p_id=>wwv_flow_imp.id(1485266589875353.4472)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4472)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1485734308875353.4472)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4472)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1486237142875354.4472)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4472)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1486735024875354.4472)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4472)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1487219028875354.4472)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4472)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1487770987875354.4472)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4472)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1488272041875354.4472)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4472)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1488725778875354.4472)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4472)
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
 p_id=>wwv_flow_imp.id(514381861202541059.4472)
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
 p_id=>wwv_flow_imp.id(514382190540541061.4472)
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
 p_id=>wwv_flow_imp.id(514382538845541061.4472)
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
 p_id=>wwv_flow_imp.id(620629666890811728.4472)
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
 p_id=>wwv_flow_imp.id(620629778318811745.4472)
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
 p_id=>wwv_flow_imp.id(868252865986181054.4472)
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
 p_id=>wwv_flow_imp.id(514338947870435171.4472)
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
 p_id=>wwv_flow_imp.id(2962385277500935.4472)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4472)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2962865718500935.4472)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4472)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2963338641500935.4472)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4472)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2963894582500935.4472)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4472)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2964329937500935.4472)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4472)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2964897214500936.4472)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4472)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2965324003500936.4472)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4472)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2965838011500936.4472)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4472)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2966328405500936.4472)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4472)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2966823859500936.4472)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4472)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2967325351500936.4472)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4472)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2967812485500936.4472)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4472)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2968377768500937.4472)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4472)
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
 p_id=>wwv_flow_imp.id(514343873675436760.4472)
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
 p_id=>wwv_flow_imp.id(32585474981747544.4472)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4472)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32585915750747544.4472)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4472)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32586471989747545.4472)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4472)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32586972270747545.4472)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4472)
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
 p_id=>wwv_flow_imp.id(771803843049318447.4472)
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
 p_id=>wwv_flow_imp.id(3207496127505978.4472)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4472)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3207907805505978.4472)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4472)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3208484941505978.4472)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4472)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3208991047505978.4472)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4472)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3209402462505979.4472)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4472)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3209972507505979.4472)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4472)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3210460159505979.4472)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4472)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3210935368505979.4472)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4472)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3211466566505979.4472)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4472)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3211956312505979.4472)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4472)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3212461962505979.4472)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4472)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3212966370505980.4472)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4472)
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
 p_id=>wwv_flow_imp.id(850406444708718383.4472)
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
 p_id=>wwv_flow_imp.id(2204663592232325.4472)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4472)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2205135519232325.4472)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4472)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2205694824232325.4472)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4472)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2206129075232325.4472)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4472)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2206618558232325.4472)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4472)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2207115910232326.4472)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4472)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2207688896232326.4472)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4472)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2208160700232326.4472)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4472)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2208614050232326.4472)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4472)
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
 p_id=>wwv_flow_imp.id(850442966147812557.4472)
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
 p_id=>wwv_flow_imp.id(3346988371508588.4472)
,p_plug_template_id=>wwv_flow_imp.id(850442966147812557.4472)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3347426198508588.4472)
,p_plug_template_id=>wwv_flow_imp.id(850442966147812557.4472)
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
 p_id=>wwv_flow_imp.id(856206049762521193.4472)
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
 p_id=>wwv_flow_imp.id(2526185270486606.4472)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4472)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2526610033486606.4472)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4472)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2527184084486606.4472)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4472)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2527626846486607.4472)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4472)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2528141078486607.4472)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4472)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2528637911486607.4472)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4472)
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
 p_id=>wwv_flow_imp.id(914802799655239969.4472)
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
 p_id=>wwv_flow_imp.id(88183211858816924.4472)
,p_plug_template_id=>wwv_flow_imp.id(914802799655239969.4472)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(88183732152816924.4472)
,p_plug_template_id=>wwv_flow_imp.id(914802799655239969.4472)
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
 p_id=>wwv_flow_imp.id(914803495164240003.4472)
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
 p_id=>wwv_flow_imp.id(3373447170510516.4472)
,p_plug_template_id=>wwv_flow_imp.id(914803495164240003.4472)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3373993086510516.4472)
,p_plug_template_id=>wwv_flow_imp.id(914803495164240003.4472)
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
 p_id=>wwv_flow_imp.id(915210356236972585.4472)
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
 p_id=>wwv_flow_imp.id(2899946654493378.4472)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4472)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2900442121493378.4472)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4472)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2900949359493378.4472)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4472)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2901467944493378.4472)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4472)
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
 p_id=>wwv_flow_imp.id(915371118115573423.4472)
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
 p_id=>wwv_flow_imp.id(2695578355491332.4472)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4472)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2696079816491332.4472)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4472)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2696558276491332.4472)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4472)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2697055726491332.4472)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4472)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2697581510491332.4472)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4472)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2698048732491333.4472)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4472)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2698576547491333.4472)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4472)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2699004772491333.4472)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4472)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2699557295491333.4472)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4472)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2700035673491333.4472)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4472)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2700500589491333.4472)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4472)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2701097053491333.4472)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4472)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2701554382491334.4472)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4472)
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
 p_id=>wwv_flow_imp.id(1274355059486017828.4472)
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
 p_id=>wwv_flow_imp.id(61232728057733462.4472)
,p_plug_template_id=>wwv_flow_imp.id(1274355059486017828.4472)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(61233207886733462.4472)
,p_plug_template_id=>wwv_flow_imp.id(1274355059486017828.4472)
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
 p_id=>wwv_flow_imp.id(514332014414430986.4472)
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
 p_id=>wwv_flow_imp.id(514332292784430987.4472)
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
 p_id=>wwv_flow_imp.id(860563697365629462.4472)
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
 p_id=>wwv_flow_imp.id(865273508717512144.4472)
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
 p_id=>wwv_flow_imp.id(908020362212234651.4472)
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
 p_id=>wwv_flow_imp.id(914818080687341593.4472)
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
 p_id=>wwv_flow_imp.id(851049711466639395.4472)
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
 p_id=>wwv_flow_imp.id(851054516889639461.4472)
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
 p_id=>wwv_flow_imp.id(851055225644639463.4472)
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
 p_id=>wwv_flow_imp.id(851056531929639482.4472)
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
 p_id=>wwv_flow_imp.id(914792024808213039.4472)
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
 p_id=>wwv_flow_imp.id(914792322768213043.4472)
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
 p_id=>wwv_flow_imp.id(915377874236666939.4472)
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
 p_id=>wwv_flow_imp.id(1041941432531249038.4472)
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
 p_id=>wwv_flow_imp.id(850683711614406253.4472)
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
 p_id=>wwv_flow_imp.id(851047536471633848.4472)
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
 p_id=>wwv_flow_imp.id(851047676005633854.4472)
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
 p_id=>wwv_flow_imp.id(851047684809633856.4472)
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
 p_id=>wwv_flow_imp.id(851047795461633856.4472)
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
 p_id=>wwv_flow_imp.id(860542631889572088.4472)
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
 p_id=>wwv_flow_imp.id(1321751941832424103.4472)
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
 p_id=>wwv_flow_imp.id(514333590213433126.4472)
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
 p_id=>wwv_flow_imp.id(649611704621764507.4472)
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
,p_result_row_x_of_y=>'<div class="a-PopupLOV-pagination">Ligne(s) #FIRST_ROW# - #LAST_ROW#</div>'
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
 p_id=>wwv_flow_imp.id(649611609668764506.4472)
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
 p_id=>wwv_flow_imp.id(182005134783173294.4472)
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
 p_id=>wwv_flow_imp.id(666074212329754757.4472)
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
 p_id=>wwv_flow_imp.id(666074525535755551.4472)
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
 p_id=>wwv_flow_imp.id(717250289307903026.4472)
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
 p_id=>wwv_flow_imp.id(2336377640986141.4472)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL'
,p_display_name=>'Heading Level'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(806925000765340952.4472)
,p_theme_id=>3
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default - No Icons'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808380142596819918.4472)
,p_theme_id=>3
,p_name=>'ALTERNATING_TABLE_ROWS'
,p_display_name=>'Alternating Table Rows'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Enable'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808380828683819918.4472)
,p_theme_id=>3
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Disable'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808381542095819918.4472)
,p_theme_id=>3
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default Border'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808383088145819924.4472)
,p_theme_id=>3
,p_name=>'REPORT_WIDTH'
,p_display_name=>'Report Width'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850406791580718389.4472)
,p_theme_id=>3
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850407096779718396.4472)
,p_theme_id=>3
,p_name=>'REGION_PADDING'
,p_display_name=>'Region Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Padding'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850407509193718398.4472)
,p_theme_id=>3
,p_name=>'REGION_STYLE'
,p_display_name=>'Region Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Style'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(851050160062639437.4472)
,p_theme_id=>3
,p_name=>'BADGE_LAYOUT'
,p_display_name=>'Badge Layout'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(851051045625639457.4472)
,p_theme_id=>3
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856113214217058023.4472)
,p_theme_id=>3
,p_name=>'HEIGHT'
,p_display_name=>'Height'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856114568019058024.4472)
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
 p_id=>wwv_flow_imp.id(856114830529058024.4472)
,p_theme_id=>3
,p_name=>'FORM_LABEL_WIDTH'
,p_display_name=>'Form Label Width'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856115135223058024.4472)
,p_theme_id=>3
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Not Part of Button Set'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116214022058024.4472)
,p_theme_id=>3
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>1
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116523282058024.4472)
,p_theme_id=>3
,p_name=>'FORM_LABEL_POSITION'
,p_display_name=>'Form Label Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116798725058025.4472)
,p_theme_id=>3
,p_name=>'BUTTON_SIZE'
,p_display_name=>'Button Size'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Button Size'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117102944058028.4472)
,p_theme_id=>3
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing left'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Left Spacing'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117454663058028.4472)
,p_theme_id=>3
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Right Spacing'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117908453058029.4472)
,p_theme_id=>3
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Icon on Right'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856118261810058029.4472)
,p_theme_id=>3
,p_name=>'BUTTON_TYPE'
,p_display_name=>'Button Type'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856206461450521195.4472)
,p_theme_id=>3
,p_name=>'ALERT_TYPE'
,p_display_name=>'Alert Type'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856206736628521198.4472)
,p_theme_id=>3
,p_name=>'DISPLAY'
,p_display_name=>'Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(860570508910721307.4472)
,p_theme_id=>3
,p_name=>'REGION_POSITION'
,p_display_name=>'Region Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(860571060920721309.4472)
,p_theme_id=>3
,p_name=>'REGION_OVERFLOW'
,p_display_name=>'Region Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(908020718209234676.4472)
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
 p_id=>wwv_flow_imp.id(1487577187426769.4472)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden to Assistive Tech'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4472)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4472)
,p_template_types=>'REGION'
,p_help_text=>'By default, region title is hidden but accessible, use this option to remove the header from accessible interface'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2336635141996782.4472)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H1'
,p_display_name=>'H1'
,p_display_sequence=>10
,p_css_classes=>'js-headingLevel-1'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4472)
,p_template_types=>'REGION'
,p_help_text=>'H1'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2336917964996782.4472)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H2'
,p_display_name=>'H2'
,p_display_sequence=>20
,p_css_classes=>'js-headingLevel-2'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4472)
,p_template_types=>'REGION'
,p_help_text=>'H2'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2337368425996782.4472)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H3'
,p_display_name=>'H3'
,p_display_sequence=>30
,p_css_classes=>'js-headingLevel-3'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4472)
,p_template_types=>'REGION'
,p_help_text=>'H3'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2337706283996782.4472)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H4'
,p_display_name=>'H4'
,p_display_sequence=>40
,p_css_classes=>'js-headingLevel-4'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4472)
,p_template_types=>'REGION'
,p_help_text=>'H4'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2338144805996782.4472)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H5'
,p_display_name=>'H5'
,p_display_sequence=>50
,p_css_classes=>'js-headingLevel-5'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4472)
,p_template_types=>'REGION'
,p_help_text=>'H5'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2338562059996782.4472)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H6'
,p_display_name=>'H6'
,p_display_sequence=>60
,p_css_classes=>'js-headingLevel-6'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4472)
,p_template_types=>'REGION'
,p_help_text=>'H6'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134384175764258.4472)
,p_theme_id=>3
,p_name=>'LARGELEFT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapLeft'
,p_group_id=>wwv_flow_imp.id(856117102944058028.4472)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134654971764258.4472)
,p_theme_id=>3
,p_name=>'LARGERIGHT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapRight'
,p_group_id=>wwv_flow_imp.id(856117454663058028.4472)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134823880764258.4472)
,p_theme_id=>3
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(856117908453058029.4472)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135009020764258.4472)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>3
,p_css_classes=>'a-Button--large'
,p_group_id=>wwv_flow_imp.id(856116798725058025.4472)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135269851764258.4472)
,p_theme_id=>3
,p_name=>'SMALLLEFT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padLeft'
,p_group_id=>wwv_flow_imp.id(856117102944058028.4472)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135477215764258.4472)
,p_theme_id=>3
,p_name=>'SMALLRIGHT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padRight'
,p_group_id=>wwv_flow_imp.id(856117454663058028.4472)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135634744764258.4472)
,p_theme_id=>3
,p_name=>'INNERBUTTON'
,p_display_name=>'Inner Button'
,p_display_sequence=>2
,p_css_classes=>'a-Button--pill'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4472)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135785730764258.4472)
,p_theme_id=>3
,p_name=>'LASTBUTTON'
,p_display_name=>'Last Button'
,p_display_sequence=>3
,p_css_classes=>'a-Button--pillEnd'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4472)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136068296764258.4472)
,p_theme_id=>3
,p_name=>'FIRSTBUTTON'
,p_display_name=>'First Button'
,p_display_sequence=>1
,p_css_classes=>'a-Button--pillStart'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4472)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136225140764258.4472)
,p_theme_id=>3
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>1
,p_css_classes=>'a-Button--primary'
,p_group_id=>wwv_flow_imp.id(856118261810058029.4472)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136360666764258.4472)
,p_theme_id=>3
,p_name=>'REGIONHEADERBUTTON'
,p_display_name=>'Button in Region Header'
,p_display_sequence=>1
,p_css_classes=>'a-Button--regionHeader'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136507481764259.4472)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--small'
,p_group_id=>wwv_flow_imp.id(856116798725058025.4472)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136620486764259.4472)
,p_theme_id=>3
,p_name=>'STRONGBUTTONLABEL'
,p_display_name=>'Strong Button Label'
,p_display_sequence=>1
,p_css_classes=>'a-Button--strongLabel'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136861925764259.4472)
,p_theme_id=>3
,p_name=>'AUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form--autoWidthLabels'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4472)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137023291764259.4472)
,p_theme_id=>3
,p_name=>'FIXEDWIDTH'
,p_display_name=>'Fixed'
,p_display_sequence=>10
,p_css_classes=>'a-Form--fixedLabels'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4472)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137193234764259.4472)
,p_theme_id=>3
,p_name=>'LABELSABOVE'
,p_display_name=>'Labels Above'
,p_display_sequence=>1
,p_css_classes=>'a-Form--labelsAbove'
,p_group_id=>wwv_flow_imp.id(856116523282058024.4472)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137470293764259.4472)
,p_theme_id=>3
,p_name=>'ALIGNLABELSLEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Form--leftLabels'
,p_group_id=>wwv_flow_imp.id(856114568019058024.4472)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137586003764259.4472)
,p_theme_id=>3
,p_name=>'LABELAUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--autoLabelWidth'
,p_group_id=>wwv_flow_imp.id(856116214022058024.4472)
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137737661764259.4472)
,p_theme_id=>3
,p_name=>'STRETCHFORMFIELD'
,p_display_name=>'Stretch Form Field'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--stretch'
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137933035764259.4472)
,p_theme_id=>3
,p_name=>'FIXEDLARGE'
,p_display_name=>'Fixed (Large Width)'
,p_display_sequence=>30
,p_css_classes=>'a-Form-fixedLabelsLarge'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4472)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138175863764259.4472)
,p_theme_id=>3
,p_name=>'FIXEDMEDIUM'
,p_display_name=>'Fixed (Medium Width)'
,p_display_sequence=>20
,p_css_classes=>'a-Form-fixedLabelsMed'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4472)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138340877764259.4472)
,p_theme_id=>3
,p_name=>'180PX'
,p_display_name=>'180px'
,p_display_sequence=>10
,p_css_classes=>'h180'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4472)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138553321764259.4472)
,p_theme_id=>3
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>20
,p_css_classes=>'h240'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4472)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138777457764259.4472)
,p_theme_id=>3
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>30
,p_css_classes=>'h320'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4472)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138891974764260.4472)
,p_theme_id=>3
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>50
,p_css_classes=>'h480'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4472)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857139153872764260.4472)
,p_theme_id=>3
,p_name=>'540PX'
,p_display_name=>'540px'
,p_display_sequence=>60
,p_css_classes=>'h540'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4472)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857139375337764260.4472)
,p_theme_id=>3
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>70
,p_css_classes=>'h640'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4472)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145206107768768.4472)
,p_theme_id=>3
,p_name=>'USE_COLORED_BACKGROUND'
,p_display_name=>'Use Colored Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4472)
,p_css_classes=>'a-Alert--colorBG'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145328630768768.4472)
,p_theme_id=>3
,p_name=>'USE_DEFAULT_ICONS'
,p_display_name=>'Use Default Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4472)
,p_css_classes=>'a-Alert--defaultIcons'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145505007768768.4472)
,p_theme_id=>3
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4472)
,p_css_classes=>'a-Alert--warning'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4472)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145725778768768.4472)
,p_theme_id=>3
,p_name=>'ERROR'
,p_display_name=>'Error'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4472)
,p_css_classes=>'a-Alert--danger'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4472)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145892117768768.4472)
,p_theme_id=>3
,p_name=>'INFORMATIONAL'
,p_display_name=>'Informational'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4472)
,p_css_classes=>'a-Alert--info'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4472)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146085228768768.4472)
,p_theme_id=>3
,p_name=>'HORIZONTAL'
,p_display_name=>'Horizontal'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4472)
,p_css_classes=>'a-Alert--horizontal'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4472)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146322225768769.4472)
,p_theme_id=>3
,p_name=>'WIZARD'
,p_display_name=>'Wizard'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4472)
,p_css_classes=>'a-Alert--wizard'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4472)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146393064768769.4472)
,p_theme_id=>3
,p_name=>'REMOVE_ICON'
,p_display_name=>'Remove Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4472)
,p_css_classes=>'a-Alert--noIcon'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146615368768769.4472)
,p_theme_id=>3
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4472)
,p_css_classes=>'a-Alert--success'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4472)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147042367768771.4472)
,p_theme_id=>3
,p_name=>'REGIONCONTAINSITEMSTEXT'
,p_display_name=>'Region Contains Items / Text'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4472)
,p_css_classes=>'a-ButtonRegion--withItems'
,p_template_types=>'REGION'
,p_help_text=>'Check this option if this region contains items or text.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147189725768771.4472)
,p_theme_id=>3
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4472)
,p_css_classes=>'a-ButtonRegion--noUI'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4472)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147385795768771.4472)
,p_theme_id=>3
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4472)
,p_css_classes=>'a-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4472)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147655668768771.4472)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4472)
,p_css_classes=>'a-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4472)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147872948768771.4472)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4472)
,p_css_classes=>'a-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4472)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147976018768771.4472)
,p_theme_id=>3
,p_name=>'WIZARDDIALOG'
,p_display_name=>'Used for Wizard Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4472)
,p_css_classes=>'a-ButtonRegion--wizard'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857148162424768771.4472)
,p_theme_id=>3
,p_name=>'VISIBLE'
,p_display_name=>'Visible'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4472)
,p_css_classes=>'a-ButtonRegion--showTitle'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4472)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857148341454768771.4472)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4472)
,p_css_classes=>'a-ButtonRegion--accessibleTitle'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4472)
,p_template_types=>'REGION'
,p_help_text=>'Use this option to add a visually hidden heading which is accessible for screen readers, but otherwise not visible to users.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149438708768778.4472)
,p_theme_id=>3
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4472)
,p_css_classes=>'a-BadgeList--float'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4472)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149614105768778.4472)
,p_theme_id=>3
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4472)
,p_css_classes=>'a-BadgeList--fixed'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4472)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149843563768778.4472)
,p_theme_id=>3
,p_name=>'STACKEDVERTICALLY'
,p_display_name=>'Stacked Vertically'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4472)
,p_css_classes=>'a-BadgeList--stacked'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4472)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149998210768778.4472)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'32px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4472)
,p_css_classes=>'a-BadgeList--small'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4472)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150194417768778.4472)
,p_theme_id=>3
,p_name=>'MEDIUM'
,p_display_name=>'48px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4472)
,p_css_classes=>'a-BadgeList--medium'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4472)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150439507768778.4472)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'64px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4472)
,p_css_classes=>'a-BadgeList--large'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4472)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150608654768780.4472)
,p_theme_id=>3
,p_name=>'XLARGE'
,p_display_name=>'96px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4472)
,p_css_classes=>'a-BadgeList--xlarge'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4472)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150792333768780.4472)
,p_theme_id=>3
,p_name=>'XXLARGE'
,p_display_name=>'128px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4472)
,p_css_classes=>'a-BadgeList--xxlarge'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4472)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151008734768780.4472)
,p_theme_id=>3
,p_name=>'2COLUMNNGRID'
,p_display_name=>'2 Columnn Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4472)
,p_css_classes=>'a-BadgeList--cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4472)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151259777768780.4472)
,p_theme_id=>3
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4472)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--3cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4472)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151408063768780.4472)
,p_theme_id=>3
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4472)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--4cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4472)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151643103768780.4472)
,p_theme_id=>3
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4472)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--5cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4472)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151861194768780.4472)
,p_theme_id=>3
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4472)
,p_css_classes=>'a-BadgeList--flex'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4472)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896798730495581814.4472)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4472)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(808380142596819918.4472)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896798963380581814.4472)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4472)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(808380828683819918.4472)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799089194581814.4472)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4472)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4472)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799349986581814.4472)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4472)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4472)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799577541581814.4472)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4472)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4472)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799637215581814.4472)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4472)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799807498581814.4472)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4472)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_imp.id(808383088145819924.4472)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022191342234716.4472)
,p_theme_id=>3
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4472)
,p_css_classes=>'a-MediaList--cols a-MediaList--2cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4472)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022392217234716.4472)
,p_theme_id=>3
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4472)
,p_css_classes=>'a-MediaList--cols a-MediaList--3cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4472)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022597980234716.4472)
,p_theme_id=>3
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4472)
,p_css_classes=>'a-MediaList--cols a-MediaList--4cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4472)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022867300234717.4472)
,p_theme_id=>3
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4472)
,p_css_classes=>'a-MediaList--cols a-MediaList--5cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4472)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023065592234717.4472)
,p_theme_id=>3
,p_name=>'SPANHORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4472)
,p_css_classes=>'a-MediaList--horizontal'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4472)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023131122234717.4472)
,p_theme_id=>3
,p_name=>'HIDEBADGE'
,p_display_name=>'Hide Badge'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4472)
,p_css_classes=>'a-MediaList--noBadge'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023191297234717.4472)
,p_theme_id=>3
,p_name=>'HIDEDESCRIPTION'
,p_display_name=>'Hide Description'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4472)
,p_css_classes=>'a-MediaList--noDesc'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023315038234717.4472)
,p_theme_id=>3
,p_name=>'HIDETITLE'
,p_display_name=>'Hide Title'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4472)
,p_css_classes=>'a-MediaList--noTitle'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023432264234717.4472)
,p_theme_id=>3
,p_name=>'HIDEICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4472)
,p_css_classes=>'a-MediaList--noIcons'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023494059234717.4472)
,p_theme_id=>3
,p_name=>'SLIMLIST'
,p_display_name=>'Slim List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4472)
,p_css_classes=>'a-MediaList--slim'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378094918666945.4472)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4472)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(808380142596819918.4472)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378225037666947.4472)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4472)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(808380828683819918.4472)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378370589666947.4472)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4472)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4472)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378467813666947.4472)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4472)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378526097666947.4472)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4472)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4472)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378615102666947.4472)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4472)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_imp.id(808383088145819924.4472)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378735377666947.4472)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4472)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4472)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1036071796325339624.4472)
,p_theme_id=>3
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(514332292784430987.4472)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1036071972285339624.4472)
,p_theme_id=>3
,p_name=>'ADD_SLIDE_ANIMATION'
,p_display_name=>'Add Slide Animation'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(514332292784430987.4472)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1050367122398973653.4472)
,p_theme_id=>3
,p_name=>'SLIMPROGRESSLIST'
,p_display_name=>'Slim Progress List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(865273508717512144.4472)
,p_css_classes=>'a-WizardSteps--slim'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1309233880682664517.4472)
,p_theme_id=>3
,p_name=>'LEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_button_template_id=>wwv_flow_imp.id(868252865986181054.4472)
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(856117908453058029.4472)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1351338307429029043.4472)
,p_theme_id=>3
,p_name=>'USED_IN_DIALOG'
,p_display_name=>'Used in Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1274355059486017828.4472)
,p_css_classes=>'a-ProcessingRegion--dialog'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333722717814196.4472)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4472)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333859287814196.4472)
,p_theme_id=>3
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4472)
,p_css_classes=>'a-LinksList--showBadge'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333887728814196.4472)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4472)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334039640814196.4472)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4472)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334247146814196.4472)
,p_theme_id=>3
,p_name=>'FORTOPLEVELONLY'
,p_display_name=>'For top level only'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4472)
,p_css_classes=>'a-LinksList--showTopIcons'
,p_group_id=>wwv_flow_imp.id(806925000765340952.4472)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334455135814196.4472)
,p_theme_id=>3
,p_name=>'FORALLITEMS'
,p_display_name=>'For all items'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4472)
,p_css_classes=>'a-LinksList--showIcons'
,p_group_id=>wwv_flow_imp.id(806925000765340952.4472)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491342397110118.4472)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4472)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491390428110118.4472)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4472)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491480011110118.4472)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4472)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664488722406040473.4472)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4472)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4472)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664488933681040473.4472)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4472)
,p_css_classes=>'a-Region--accessibleHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4472)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489165994040473.4472)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4472)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4472)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489304869040473.4472)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4472)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4472)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489519844040473.4472)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4472)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_imp.id(860570508910721307.4472)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489753255040473.4472)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4472)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4472)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489941797040473.4472)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4472)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4472)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490153471040473.4472)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4472)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4472)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490336091040473.4472)
,p_theme_id=>3
,p_name=>'DEFAULTPADDING'
,p_display_name=>'Default Padding'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4472)
,p_css_classes=>'a-Region--paddedBody'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4472)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490377667040473.4472)
,p_theme_id=>3
,p_name=>'REMOVE_TOP_BORDER'
,p_display_name=>'Remove Top Border'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4472)
,p_css_classes=>'a-Region--noTopBorder'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490659850040473.4472)
,p_theme_id=>3
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4472)
,p_css_classes=>'a-Region--simple'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4472)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664501980442158869.4472)
,p_theme_id=>3
,p_name=>'RESPONSIVEICONCOLUMNS'
,p_display_name=>'Responsive Icon Columns'
,p_display_sequence=>2
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4472)
,p_css_classes=>'a-IRR-region--responsiveIconView'
,p_template_types=>'REGION'
,p_help_text=>'Automatically increases number of icon columns to show based on screen resolution.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664502160891158869.4472)
,p_theme_id=>3
,p_name=>'ICONLABELSRIGHT'
,p_display_name=>'Icon Labels on Right'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4472)
,p_css_classes=>'a-IRR-region--iconLabelsRight'
,p_template_types=>'REGION'
,p_help_text=>'Shows labels in Icon View to the right of the icon.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664502181188158869.4472)
,p_theme_id=>3
,p_name=>'REMOVEOUTERBORDERS'
,p_display_name=>'Remove Outer Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4472)
,p_css_classes=>'a-IRR-region--noOuterBorders'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508367504174332.4472)
,p_theme_id=>3
,p_name=>'FLUSHREGION'
,p_display_name=>'Flush Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4472)
,p_css_classes=>'a-Region--flush'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508426350174332.4472)
,p_theme_id=>3
,p_name=>'STACKEDREGION'
,p_display_name=>'Stacked Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4472)
,p_css_classes=>'a-Region--stacked'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508588305174332.4472)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4472)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4472)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508810521174332.4472)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4472)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4472)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509005841174332.4472)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4472)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_imp.id(860570508910721307.4472)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509270186174332.4472)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4472)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4472)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509448573174333.4472)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4472)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4472)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509659839174333.4472)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4472)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4472)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509822387174334.4472)
,p_theme_id=>3
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>.1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4472)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4472)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664510028962174334.4472)
,p_theme_id=>3
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4472)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4472)
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
 p_id=>wwv_flow_imp.id(138660338547751202)
,p_name=>'4150_COLUMN_NUMBER'
,p_message_language=>'fr'
,p_message_text=>'Colonne %0'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138644982779751198)
,p_name=>'ACCESS_CONTROL_ADMIN'
,p_message_language=>'fr'
,p_message_text=>'Administrateur'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138644878407751198)
,p_name=>'ACCESS_CONTROL_USERNAME'
,p_message_language=>'fr'
,p_message_text=>'Nom utilisateur'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138707569929751217)
,p_name=>'ACCESS_DENIED_SIMPLE'
,p_message_language=>'fr'
,p_message_text=>unistr('Acc\00E8s refus\00E9')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138664497581751204)
,p_name=>'ACCOUNT_HAS_BEEN_CREATED'
,p_message_language=>'fr'
,p_message_text=>unistr('Votre compte %0 a \00E9t\00E9 cr\00E9\00E9.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138647629058751199)
,p_name=>'ACCOUNT_LOCKED'
,p_message_language=>'fr'
,p_message_text=>unistr('Compte verrouill\00E9.')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138632165559751194)
,p_name=>'AM_PM'
,p_message_language=>'fr'
,p_message_text=>'AM / PM'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138614906661751189)
,p_name=>'APEX.ACTIONS.ACTION_LINK'
,p_message_language=>'fr'
,p_message_text=>'lien d''action'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138614895363751189)
,p_name=>'APEX.ACTIONS.DIALOG_LINK'
,p_message_language=>'fr'
,p_message_text=>unistr('lien de bo\00EEte de dialogue')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138779253102751238)
,p_name=>'APEX.ACTIONS.TOGGLE'
,p_message_language=>'fr'
,p_message_text=>unistr('Activer/d\00E9sactiver %0')
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138787060661751240)
,p_name=>'APEX.ACTIVE_STATE'
,p_message_language=>'fr'
,p_message_text=>'(Actif)'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138591855379751182)
,p_name=>'APEX.AI.CHAT_CLEARED'
,p_message_language=>'fr'
,p_message_text=>unistr('Discussion effac\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138591790823751182)
,p_name=>'APEX.AI.CLEAR_CHAT'
,p_message_language=>'fr'
,p_message_text=>'Effacer la discussion'
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138588318378751181)
,p_name=>'APEX.AI.CONSENT_ACCEPT'
,p_message_language=>'fr'
,p_message_text=>'Accepter'
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138588458909751181)
,p_name=>'APEX.AI.CONSENT_DENY'
,p_message_language=>'fr'
,p_message_text=>'Refuser'
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138588163989751181)
,p_name=>'APEX.AI.CONVERSATION_HISTORY'
,p_message_language=>'fr'
,p_message_text=>'Historique des conversations'
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138591540561751182)
,p_name=>'APEX.AI.COPIED'
,p_message_language=>'fr'
,p_message_text=>unistr('Copi\00E9')
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138591642207751182)
,p_name=>'APEX.AI.COPIED_TO_CLIPBOARD'
,p_message_language=>'fr'
,p_message_text=>unistr('Copi\00E9 dans le presse-papiers')
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138591311766751182)
,p_name=>'APEX.AI.COPY'
,p_message_language=>'fr'
,p_message_text=>'Copier'
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138591431903751182)
,p_name=>'APEX.AI.COPY_TO_CLIPBOARD'
,p_message_language=>'fr'
,p_message_text=>'Copier dans le presse-papiers'
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138588869180751181)
,p_name=>'APEX.AI.DIALOG_TITLE'
,p_message_language=>'fr'
,p_message_text=>'Assistant'
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138589252912751181)
,p_name=>'APEX.AI.DISABLED'
,p_message_language=>'fr'
,p_message_text=>unistr('L''IA est d\00E9sactiv\00E9e au niveau de l''espace de travail ou de l''instance.')
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138628564023751193)
,p_name=>'APEX.AI.GET_SERVER_ID_OR_STATIC_ID'
,p_message_language=>'fr'
,p_message_text=>unistr('Le service d''intelligence artificielle g\00E9n\00E9rative portant l''ID ou l''ID statique indiqu\00E9 est introuvable.')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138627215638751193)
,p_name=>'APEX.AI.HTTP_4013_ERROR'
,p_message_language=>'fr'
,p_message_text=>unistr('Erreur d''authentification ou acc\00E8s interdit (HTTP-%1) pour l''URL %0. V\00E9rifiez la configuration du service d''intelligence artificielle g\00E9n\00E9rative %2.')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138607026383751187)
,p_name=>'APEX.AI.HTTP_ERROR'
,p_message_language=>'fr'
,p_message_text=>unistr('Echec de la demande HTTP au service d''intelligence artificielle g\00E9n\00E9rative \00E0 %0 avec HTTP-%1 : %2')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138631407237751194)
,p_name=>'APEX.AI.HTTP_FRIENDLY_ERROR'
,p_message_language=>'fr'
,p_message_text=>unistr('Erreur dans la demande HTTP au service d''intelligence artificielle g\00E9n\00E9rative pour le module d''extension %0 en mode %1. V\00E9rifiez la configuration du service d''intelligence artificielle g\00E9n\00E9rative.')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138594277925751183)
,p_name=>'APEX.AI.MAIN_QUICK_ACTIONS_ARIA_LABEL'
,p_message_language=>'fr'
,p_message_text=>'Exemples'
,p_is_js_message=>true
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138592688834751182)
,p_name=>'APEX.AI.NAME_ASSISTANT'
,p_message_language=>'fr'
,p_message_text=>'Assistant'
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138594048737751183)
,p_name=>'APEX.AI.NAME_COMMA_MESSAGE'
,p_message_language=>'fr'
,p_message_text=>'%0,%1'
,p_is_js_message=>true
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138592508429751182)
,p_name=>'APEX.AI.NAME_USER'
,p_message_language=>'fr'
,p_message_text=>'Vous'
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138623297351751191)
,p_name=>'APEX.AI.OCI_CHAT_NOT_SUPPORTED'
,p_message_language=>'fr'
,p_message_text=>unistr('OCI Generative AI ne prend actuellement pas en charge l''exp\00E9rience de discussion avec plusieurs messages.')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138603118690751186)
,p_name=>'APEX.AI.PROMPT_ENRICHMENT_ERROR'
,p_message_language=>'fr'
,p_message_text=>unistr('Erreur lors du traitement de l''invite %0 pour l''application %1. V\00E9rifiez si App Builder est disponible sur cette instance.')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138608276102751187)
,p_name=>'APEX.AI.RESPONSE_ERROR'
,p_message_language=>'fr'
,p_message_text=>unistr('Impossible de traiter la r\00E9ponse pour le service d''IA %0, r\00E9ponse : %1')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138614407306751189)
,p_name=>'APEX.AI.SEND_MESSAGE'
,p_message_language=>'fr'
,p_message_text=>'Envoyer un message'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138602748408751185)
,p_name=>'APEX.AI.SERVICE_ERROR'
,p_message_language=>'fr'
,p_message_text=>'Erreur dans le service d''IA de back-end %0'
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138588596477751181)
,p_name=>'APEX.AI.TEXTAREA_LABEL'
,p_message_language=>'fr'
,p_message_text=>'Message'
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138588699443751181)
,p_name=>'APEX.AI.TEXTAREA_PLACEHOLDER'
,p_message_language=>'fr'
,p_message_text=>'Saisissez votre message ici'
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138591912739751182)
,p_name=>'APEX.AI.USER_AVATAR'
,p_message_language=>'fr'
,p_message_text=>'Avatar de l''utilisateur'
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138592081082751182)
,p_name=>'APEX.AI.USE_THIS'
,p_message_language=>'fr'
,p_message_text=>'Utiliser ce'
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138588791953751181)
,p_name=>'APEX.AI.WARN_UNSENT_MESSAGE'
,p_message_language=>'fr'
,p_message_text=>unistr('Un message n''a pas \00E9t\00E9 envoy\00E9. Voulez-vous continuer ?')
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138757760679751232)
,p_name=>'APEX.AJAX_SERVER_ERROR'
,p_message_language=>'fr'
,p_message_text=>unistr('L''appel d''AJAX a renvoy\00E9 une erreur de serveur %0 pour %1.')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138684853888751210)
,p_name=>'APEX.APPLICATION.ALIAS.NON_UNIQUE'
,p_message_language=>'fr'
,p_message_text=>unistr('L''alias d''application "%0" ne peut pas \00EAtre converti en ID d''application unique.')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138673695884751206)
,p_name=>'APEX.APPLICATION.ALIAS.UNHANDLED_ERROR'
,p_message_language=>'fr'
,p_message_text=>'ERR-1816 Erreur inattendue lors de la conversion de l''alias d''application p_flow_alias_or_id (%0).'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138771012751751236)
,p_name=>'APEX.APPLICATION.CHECKSUM.DESCRIPTION'
,p_message_language=>'fr'
,p_message_text=>unistr('Le checksum d''application permet de d\00E9terminer facilement si la m\00EAme application est d\00E9ploy\00E9e dans diff\00E9rents espaces de travail. Vous pouvez comparer ce checksum afin de d\00E9terminer s''il existe une correspondance. ')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138657667982751202)
,p_name=>'APEX.AUTHENTICATION.AUTH_FUNC.UNHANDLED_ERROR'
,p_message_language=>'fr'
,p_message_text=>'Erreur lors du traitement de la fonction d''authentification.'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138639636005751196)
,p_name=>'APEX.AUTHENTICATION.AUTH_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'fr'
,p_message_text=>'Erreur lors du traitement de la fonction d''authentification.'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138811574674751248)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.HOST_PREFIX_MISMATCH'
,p_message_language=>'fr'
,p_message_text=>unistr('Le nom de locataire %0 renvoy\00E9 par Oracle Cloud Identity Management n''est pas autoris\00E9 pour le domaine %1.<br/><a href="&LOGOUT_URL.">Reconnectez-vous</a>, puis indiquez un nom de locataire autoris\00E9 ou modifiez l''URL.')
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138635756924751195)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.USER_IS_NOT_DEVELOPER'
,p_message_language=>'fr'
,p_message_text=>unistr('Le compte "%0" ne dispose pas des privil\00E8ges de d\00E9veloppement n\00E9cessaires (DB_DEVELOPER ou DB_ADMINISTRATOR)<br/>pour l''espace de travail "%1". <a href="&LOGOUT_URL.">Reconnectez-vous</a> une fois les privil\00E8ges obtenus.')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138632396522751194)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.WRONG_GROUP_NAME'
,p_message_language=>'fr'
,p_message_text=>unistr('Le nom de locataire renvoy\00E9 par Oracle Cloud Identity Management n''est pas autoris\00E9 pour l''espace de travail en cours.<br/><a href="&LOGOUT_URL.">Reconnectez-vous</a> et indiquez un nom de locataire autoris\00E9.')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138635827609751195)
,p_name=>'APEX.AUTHENTICATION.HOST_PREFIX_MISMATCH'
,p_message_language=>'fr'
,p_message_text=>unistr('Pour des raisons de s\00E9curit\00E9, l''ex\00E9cution des applications de cet espace de travail via le domaine de l''URL n''est pas autoris\00E9e.')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138657313566751202)
,p_name=>'APEX.AUTHENTICATION.LDAP.DBMS_LDAP.ASK_FOR_INSTALLATION'
,p_message_language=>'fr'
,p_message_text=>unistr('Demandez \00E0 votre administrateur de base de donn\00E9es d''ex\00E9cuter $OH/rdbms/admin/catldap.sql.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138657235801751202)
,p_name=>'APEX.AUTHENTICATION.LDAP.DBMS_LDAP.MISSING'
,p_message_language=>'fr'
,p_message_text=>'Le package SYS.DBMS_LDAP n''existe pas ou n''est pas valide.'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138657111638751202)
,p_name=>'APEX.AUTHENTICATION.LDAP.EDIT_USER_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'fr'
,p_message_text=>unistr('Erreur lors du traitement de la fonction de mise \00E0 jour de l''utilisateur LDAP.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138657425627751202)
,p_name=>'APEX.AUTHENTICATION.LDAP.UNHANDLED_ERROR'
,p_message_language=>'fr'
,p_message_text=>'Erreur lors du traitement de l''authentification LDAP.'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138658212466751202)
,p_name=>'APEX.AUTHENTICATION.LOGIN.ILLEGAL_PAGE_ARG'
,p_message_language=>'fr'
,p_message_text=>unistr('Erreur dans l''argument p_flow_page de la proc\00E9dure login_page.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138657877758751202)
,p_name=>'APEX.AUTHENTICATION.LOGIN.INVALID_ARG'
,p_message_language=>'fr'
,p_message_text=>'p_session non valide dans wwv_flow_custom_auth_std.login--p_flow_page : %0 p_session_id : %1.'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138709116620751217)
,p_name=>'APEX.AUTHENTICATION.LOGIN.MALFORMED_ARGS'
,p_message_language=>'fr'
,p_message_text=>'Argument incorrect pour wwv_flow_custom_auth_std.login--p_flow_page:p_session_id:p_entry_point:%0:%1:%2.'
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138657971656751202)
,p_name=>'APEX.AUTHENTICATION.LOGIN.NULL_USER'
,p_message_language=>'fr'
,p_message_text=>unistr('Nom utilisateur Null transmis \00E0 la proc\00E9dure de connexion.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138644737476751198)
,p_name=>'APEX.AUTHENTICATION.LOGIN_THROTTLE.COUNTER'
,p_message_language=>'fr'
,p_message_text=>'Veuillez patienter pendant <span id="apex_login_throttle_sec">%0</span> secondes avant de vous reconnecter.'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138646032995751198)
,p_name=>'APEX.AUTHENTICATION.LOGIN_THROTTLE.ERROR'
,p_message_language=>'fr'
,p_message_text=>unistr('La tentative de connexion a \00E9t\00E9 bloqu\00E9e.')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138706850976751216)
,p_name=>'APEX.AUTHENTICATION.NOT_FOUND'
,p_message_language=>'fr'
,p_message_text=>'Authentification "%0" introuvable'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138646581924751198)
,p_name=>'APEX.AUTHENTICATION.NO_SECURITY_GROUP_ID'
,p_message_language=>'fr'
,p_message_text=>unistr('L''ID de groupe de s\00E9curit\00E9 est Null.')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138657701285751202)
,p_name=>'APEX.AUTHENTICATION.POST_AUTH_PROC.UNHANDLED_ERROR'
,p_message_language=>'fr'
,p_message_text=>unistr('Erreur d''ex\00E9cution du processus de postauthentification')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138657576713751202)
,p_name=>'APEX.AUTHENTICATION.PRE_AUTH_PROC.UNHANDLED_ERROR'
,p_message_language=>'fr'
,p_message_text=>unistr('Erreur lors du traitement du processus de pr\00E9authentification.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138659285180751202)
,p_name=>'APEX.AUTHENTICATION.RESET_PASSWORD.INSTRUCTIONS'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Ouvrez l''URL dans le navigateur que vous avez utilis\00E9 pour lancer la demande de r\00E9initialisation de mot de passe. Si vous cliquez sur l''URL de r\00E9initialisation du mot de passe et \00EAtes redirig\00E9 vers'),
unistr('la page de connexion, relancez la r\00E9initialisation du mot de passe et laissez le'),
'navigateur ouvert.'))
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138809093027751247)
,p_name=>'APEX.AUTHENTICATION.RESET_PASSWORD_URL'
,p_message_language=>'fr'
,p_message_text=>unistr('URL de r\00E9initialisation du mot de passe')
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138636012066751195)
,p_name=>'APEX.AUTHENTICATION.RM_GROUP_NOT_GRANTED'
,p_message_language=>'fr'
,p_message_text=>unistr('Le groupe de consommateurs Resource Manager %0 n''a pas \00E9t\00E9 accord\00E9 \00E0 %1')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138636186573751195)
,p_name=>'APEX.AUTHENTICATION.RM_INFO_TO_GRANT'
,p_message_language=>'fr'
,p_message_text=>unistr('Utilisez DBMS_RESOURCE_MANAGER_PRIVS.GRANT_SWITCH_CONSUMER_GROUP pour octroyer le privil\00E8ge manquant.')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138670776108751206)
,p_name=>'APEX.AUTHENTICATION.SESSION_SENTRY_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'fr'
,p_message_text=>'Erreur lors du traitement de la fonction de sentinelle de session.'
,p_version_scn=>2704763
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138670824791751206)
,p_name=>'APEX.AUTHENTICATION.SESSION_VERIFY_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'fr'
,p_message_text=>unistr('Erreur lors du traitement de la fonction de v\00E9rification de session.')
,p_version_scn=>2704763
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138671055159751206)
,p_name=>'APEX.AUTHENTICATION.SSO.ASK_FOR_INSTALLATION'
,p_message_language=>'fr'
,p_message_text=>unistr('Demandez \00E0 votre administrateur %0 de configurer le moteur pour Oracle Application Server Single Sign-On.')
,p_version_scn=>2704763
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138681405559751209)
,p_name=>'APEX.AUTHENTICATION.SSO.BAD_URLC'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 non valide dans le token %1 renvoy\00E9 par SSO.')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138658197827751202)
,p_name=>'APEX.AUTHENTICATION.SSO.FIX_PARTNER_APP'
,p_message_language=>'fr'
,p_message_text=>unistr('Modifiez le mod\00E8le d''authentification et ajoutez le nom d''application.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138681168736751209)
,p_name=>'APEX.AUTHENTICATION.SSO.ILLEGAL_CALLER'
,p_message_language=>'fr'
,p_message_text=>unistr('Appelant de la proc\00E9dure %0 non valide :')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138681356932751209)
,p_name=>'APEX.AUTHENTICATION.SSO.INVALID_APP_SESSION'
,p_message_language=>'fr'
,p_message_text=>'Session d''application non valide dans le token URLC : %0'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138680928737751209)
,p_name=>'APEX.AUTHENTICATION.SSO.MISSING_APP_REGISTRATION'
,p_message_language=>'fr'
,p_message_text=>'Erreur dans portal_sso_redirect : informations d''inscription d''application absentes : %0'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138670977496751206)
,p_name=>'APEX.AUTHENTICATION.SSO.PACKAGE_MISSING'
,p_message_language=>'fr'
,p_message_text=>'Le package WWSEC_SSO_ENABLER_PRIVATE n''existe pas ou n''est pas valide.'
,p_version_scn=>2704763
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138658044031751202)
,p_name=>'APEX.AUTHENTICATION.SSO.PARTNER_APP_IS_NULL'
,p_message_language=>'fr'
,p_message_text=>unistr('Impossible de trouver le nom d''application partenaire inscrit dans le mod\00E8le d''authentification.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138681036952751209)
,p_name=>'APEX.AUTHENTICATION.SSO.REGISTER_APP'
,p_message_language=>'fr'
,p_message_text=>unistr('Inscrivez cette application comme indiqu\00E9 dans le guide d''installation.')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138671135693751206)
,p_name=>'APEX.AUTHENTICATION.SSO.UNHANDLED_ERROR'
,p_message_language=>'fr'
,p_message_text=>'Erreur lors du traitement de l''authentification SSO.'
,p_version_scn=>2704763
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138784499173751240)
,p_name=>'APEX.AUTHENTICATION.UNAUTHORIZED_URL'
,p_message_language=>'fr'
,p_message_text=>unistr('URL non autoris\00E9e : %0')
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138670598749751205)
,p_name=>'APEX.AUTHENTICATION.UNHANDLED_ERROR'
,p_message_language=>'fr'
,p_message_text=>'Erreur lors du traitement de l''authentification.'
,p_version_scn=>2704763
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138635921311751195)
,p_name=>'APEX.AUTHENTICATION.WORKSPACE_NOT_ASSIGNED'
,p_message_language=>'fr'
,p_message_text=>'L''espace de travail "%0" est inactif. Contactez l''administrateur.'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138636638605751195)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED'
,p_message_language=>'fr'
,p_message_text=>'%0'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138645760762751198)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED.APPLICATION'
,p_message_language=>'fr'
,p_message_text=>unistr('Acc\00E8s refus\00E9 par le contr\00F4le de s\00E9curit\00E9 de l''application')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138645849402751198)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED.PAGE'
,p_message_language=>'fr'
,p_message_text=>unistr('Acc\00E8s refus\00E9 par le contr\00F4le de s\00E9curit\00E9 de la page')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138645904941751198)
,p_name=>'APEX.AUTHORIZATION.UNHANDLED_ERROR'
,p_message_language=>'fr'
,p_message_text=>'Erreur lors du traitement de l''autorisation.'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138715038963751219)
,p_name=>'APEX.BUILT_WITH_LOVE_USING_APEX'
,p_message_language=>'fr'
,p_message_text=>unistr('Construit avec %0 \00E0 l''aide de %1')
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138715158123751219)
,p_name=>'APEX.BUILT_WITH_LOVE_USING_APEX.ACCESSIBLE.LOVE'
,p_message_language=>'fr'
,p_message_text=>'amour'
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138774984349751237)
,p_name=>'APEX.CALENDAR.EVENT_DESCRIPTION'
,p_message_language=>'fr'
,p_message_text=>unistr('Description d''\00E9v\00E9nement')
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138774731017751237)
,p_name=>'APEX.CALENDAR.EVENT_END'
,p_message_language=>'fr'
,p_message_text=>'Date de fin'
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138775096126751237)
,p_name=>'APEX.CALENDAR.EVENT_ID'
,p_message_language=>'fr'
,p_message_text=>unistr('ID d''\00E9v\00E9nement')
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138774653490751237)
,p_name=>'APEX.CALENDAR.EVENT_START'
,p_message_language=>'fr'
,p_message_text=>unistr('Date de d\00E9but')
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138774856102751237)
,p_name=>'APEX.CALENDAR.EVENT_TITLE'
,p_message_language=>'fr'
,p_message_text=>unistr('Titre de l''\00E9v\00E9nement')
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138617449539751190)
,p_name=>'APEX.CARD'
,p_message_language=>'fr'
,p_message_text=>'Carte'
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138617660706751190)
,p_name=>'APEX.CARD.CARD_ACTION'
,p_message_language=>'fr'
,p_message_text=>'Action de carte'
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138658344789751202)
,p_name=>'APEX.CHECKBOX.VISUALLY_HIDDEN_CHECKBOX'
,p_message_language=>'fr'
,p_message_text=>unistr('Case \00E0 cocher masqu\00E9e visuellement')
,p_is_js_message=>true
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138660244407751202)
,p_name=>'APEX.CHECKSUM.CONTENT_ERROR'
,p_message_language=>'fr'
,p_message_text=>'Erreur de contenu de checksum'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138660174564751202)
,p_name=>'APEX.CHECKSUM.FORMAT_ERROR'
,p_message_language=>'fr'
,p_message_text=>'Erreur de format de checksum'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138730016654751223)
,p_name=>'APEX.CLIPBOARD.COPIED'
,p_message_language=>'fr'
,p_message_text=>unistr('Copi\00E9 dans le presse-papiers.')
,p_is_js_message=>true
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138729565394751223)
,p_name=>'APEX.CLIPBOARD.NOTSUP'
,p_message_language=>'fr'
,p_message_text=>unistr('Ce navigateur ne prend pas en charge la copie \00E0 partir d''un bouton ou d''un menu. Essayez la combinaison Ctrl+C ou Commande+C.')
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138715744814751219)
,p_name=>'APEX.CLOSE_NOTIFICATION'
,p_message_language=>'fr'
,p_message_text=>'Fermer'
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138594140423751183)
,p_name=>'APEX.CODE_EDITOR.MAXIMUM_LENGTH_EXCEEDED'
,p_message_language=>'fr'
,p_message_text=>unistr('Le contenu de l''\00E9diteur de code d\00E9passe la longueur maximale de l''\00E9l\00E9ment (longueur r\00E9elle : %0, longueur autoris\00E9e : %1 caract\00E8res)')
,p_is_js_message=>true
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138774286732751237)
,p_name=>'APEX.COLOR_PICKER.CONTRAST'
,p_message_language=>'fr'
,p_message_text=>'Contraste'
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138768729334751235)
,p_name=>'APEX.COLOR_PICKER.CURRENT'
,p_message_language=>'fr'
,p_message_text=>'En cours'
,p_is_js_message=>true
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138768651057751235)
,p_name=>'APEX.COLOR_PICKER.INITIAL'
,p_message_language=>'fr'
,p_message_text=>'Initial'
,p_is_js_message=>true
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138772803819751236)
,p_name=>'APEX.COLOR_PICKER.INVALID_COLOR'
,p_message_language=>'fr'
,p_message_text=>unistr('#LABEL# doit \00EAtre une couleur valide. Par exemple : %0')
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138635207924751195)
,p_name=>'APEX.COLOR_PICKER.MORE_PRESET_COLORS'
,p_message_language=>'fr'
,p_message_text=>'Autres couleurs'
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138635334354751195)
,p_name=>'APEX.COLOR_PICKER.OPEN'
,p_message_language=>'fr'
,p_message_text=>unistr('Ouvrir le s\00E9lecteur de couleur')
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138592453381751182)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.ALPHA_SLIDER'
,p_message_language=>'fr'
,p_message_text=>unistr('Curseur de valeur alpha, curseur horizontal. Utilisez les touches fl\00E9ch\00E9es pour vous d\00E9placer.')
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138592112447751182)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.COLOR_SPECTRUM'
,p_message_language=>'fr'
,p_message_text=>unistr('Spectre de couleurs, curseur quadridirectionnel. Utilisez les touches fl\00E9ch\00E9es pour vous d\00E9placer.')
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138592229858751182)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.HUE_SLIDER'
,p_message_language=>'fr'
,p_message_text=>unistr('Curseur de teinte, curseur vertical. Utilisez les touches fl\00E9ch\00E9es pour vous d\00E9placer.')
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138768584946751235)
,p_name=>'APEX.COLOR_PICKER.TITLE'
,p_message_language=>'fr'
,p_message_text=>'Choisir une couleur'
,p_is_js_message=>true
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138768844250751235)
,p_name=>'APEX.COLOR_PICKER.TOGGLE_TITLE'
,p_message_language=>'fr'
,p_message_text=>'Changer de format de couleur'
,p_is_js_message=>true
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138806700790751246)
,p_name=>'APEX.COMBOBOX.LIST_OF_VALUES'
,p_message_language=>'fr'
,p_message_text=>'Liste de valeurs (LOV)'
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138806844640751246)
,p_name=>'APEX.COMBOBOX.SHOW_ALL_VALUES'
,p_message_language=>'fr'
,p_message_text=>'Ouvrir la liste pour : %0'
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138787182299751240)
,p_name=>'APEX.COMPLETED_STATE'
,p_message_language=>'fr'
,p_message_text=>unistr('(Termin\00E9)')
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138676004441751207)
,p_name=>'APEX.CONTACT_ADMIN'
,p_message_language=>'fr'
,p_message_text=>'Contactez l''administrateur de l''application.'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138691559500751212)
,p_name=>'APEX.CONTACT_ADMIN.DEBUG'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Contactez l''administrateur de l''application.',
unistr('Les d\00E9tails relatifs \00E0 cet incident sont disponibles via l''ID de d\00E9bogage "%0".')))
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138773149417751236)
,p_name=>'APEX.CORRECT_ERRORS'
,p_message_language=>'fr'
,p_message_text=>'Corrigez les erreurs avant l''enregistrement.'
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138618464746751190)
,p_name=>'APEX.CS.ACTIVE_VALUE_CHIP'
,p_message_language=>'fr'
,p_message_text=>unistr('%0. Appuyez sur la touche de retour arri\00E8re pour proc\00E9der \00E0 la suppression.')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138716662090751219)
,p_name=>'APEX.CS.MATCHES_FOUND'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 correspondances trouv\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138598530282751184)
,p_name=>'APEX.CS.MATCH_FOUND'
,p_message_language=>'fr'
,p_message_text=>unistr('Une correspondance trouv\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138716575345751219)
,p_name=>'APEX.CS.NO_MATCHES'
,p_message_language=>'fr'
,p_message_text=>unistr('Aucune correspondance trouv\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138592925980751182)
,p_name=>'APEX.CS.OTHERS_GROUP'
,p_message_language=>'fr'
,p_message_text=>'Autres'
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138592840237751182)
,p_name=>'APEX.CS.SELECTED_VALUES_COUNTER'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 valeurs s\00E9lectionn\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138787645479751240)
,p_name=>'APEX.CURRENT_PROGRESS'
,p_message_language=>'fr'
,p_message_text=>'Progression'
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138773552254751236)
,p_name=>'APEX.DATA.LOAD.FILE_DOES_NOT_EXIST'
,p_message_language=>'fr'
,p_message_text=>unistr('Le fichier indiqu\00E9 dans l''\00E9l\00E9ment %0 n''existe pas dans APEX_APPLICATION_TEMP_FILES.')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138762002396751233)
,p_name=>'APEX.DATA_HAS_CHANGED'
,p_message_language=>'fr'
,p_message_text=>unistr('La version en cours des donn\00E9es dans la base a chang\00E9 depuis que l''utilisateur a lanc\00E9 le traitement de mise \00E0 jour.')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138731121588751224)
,p_name=>'APEX.DATA_LOAD.DO_NOT_LOAD'
,p_message_language=>'fr'
,p_message_text=>'Ne pas charger'
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138777462529751237)
,p_name=>'APEX.DATA_LOAD.FAILED'
,p_message_language=>'fr'
,p_message_text=>'Erreur avant traitement'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138777211369751237)
,p_name=>'APEX.DATA_LOAD.INSERT'
,p_message_language=>'fr'
,p_message_text=>unistr('Ins\00E9rer une ligne')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138790824657751241)
,p_name=>'APEX.DATA_LOAD.SEQUENCE_ACTION'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9quence : action')
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138777368922751237)
,p_name=>'APEX.DATA_LOAD.UPDATE'
,p_message_language=>'fr'
,p_message_text=>unistr('Mettre \00E0 jour une ligne')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138605836656751186)
,p_name=>'APEX.DATEPICKER.ACTIONS'
,p_message_language=>'fr'
,p_message_text=>'Actions'
,p_is_js_message=>true
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138633406920751195)
,p_name=>'APEX.DATEPICKER.AM_PM'
,p_message_language=>'fr'
,p_message_text=>'AM/PM'
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138619594385751190)
,p_name=>'APEX.DATEPICKER.BOUNDARY_ITEM_FORMAT_INVALID'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 doit \00EAtre un s\00E9lecteur de date ou une date valide, par exemple %1.')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138728791287751223)
,p_name=>'APEX.DATEPICKER.CLEAR'
,p_message_language=>'fr'
,p_message_text=>'Effacer'
,p_is_js_message=>true
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138636983182751196)
,p_name=>'APEX.DATEPICKER.DONE'
,p_message_language=>'fr'
,p_message_text=>unistr('Termin\00E9')
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138647935425751199)
,p_name=>'APEX.DATEPICKER.FORMAT_NOT_SUPPORTED'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 contient des \00E9l\00E9ments non pris en charge dans le masque de format : %1')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138633107381751194)
,p_name=>'APEX.DATEPICKER.HOUR'
,p_message_language=>'fr'
,p_message_text=>'Heure'
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138717056069751219)
,p_name=>'APEX.DATEPICKER.ICON_TEXT'
,p_message_language=>'fr'
,p_message_text=>unistr('Calendrier instantan\00E9 : %0')
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138632931780751194)
,p_name=>'APEX.DATEPICKER.ISO_WEEK'
,p_message_language=>'fr'
,p_message_text=>'Semaine'
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138633068668751194)
,p_name=>'APEX.DATEPICKER.ISO_WEEK_ABBR'
,p_message_language=>'fr'
,p_message_text=>'Sem.'
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138633371682751194)
,p_name=>'APEX.DATEPICKER.MINUTES'
,p_message_language=>'fr'
,p_message_text=>'Minutes'
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138633510026751195)
,p_name=>'APEX.DATEPICKER.MONTH'
,p_message_language=>'fr'
,p_message_text=>'Mois'
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138633976084751195)
,p_name=>'APEX.DATEPICKER.NEXT_MONTH'
,p_message_language=>'fr'
,p_message_text=>'Mois suivant'
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138603547543751186)
,p_name=>'APEX.DATEPICKER.POPUP'
,p_message_language=>'fr'
,p_message_text=>unistr('Fen\00EAtre instantan\00E9e pour %0')
,p_is_js_message=>true
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138633842929751195)
,p_name=>'APEX.DATEPICKER.PREVIOUS_MONTH'
,p_message_language=>'fr'
,p_message_text=>unistr('Mois pr\00E9c\00E9dent')
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138726303940751222)
,p_name=>'APEX.DATEPICKER.READONLY_DATEPICKER'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lecteur de date en lecture seule')
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138634726529751195)
,p_name=>'APEX.DATEPICKER.SELECT_DATE'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lectionner une date')
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138603629314751186)
,p_name=>'APEX.DATEPICKER.SELECT_DATE_AND_TIME'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lectionner la date et l''heure')
,p_is_js_message=>true
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138600888676751185)
,p_name=>'APEX.DATEPICKER.SELECT_DAY'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lectionner le jour')
,p_is_js_message=>true
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138604217943751186)
,p_name=>'APEX.DATEPICKER.SELECT_MONTH_AND_YEAR'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lectionner le mois et l''ann\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138601050584751185)
,p_name=>'APEX.DATEPICKER.SELECT_TIME'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lectionner l''heure')
,p_is_js_message=>true
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138601586750751185)
,p_name=>'APEX.DATEPICKER.TODAY'
,p_message_language=>'fr'
,p_message_text=>'Aujourd''hui'
,p_is_js_message=>true
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138619156694751190)
,p_name=>'APEX.DATEPICKER.VALUE_INVALID'
,p_message_language=>'fr'
,p_message_text=>unistr('#LABEL# doit \00EAtre une date valide, par exemple : %0.')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138618882344751190)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_BETWEEN'
,p_message_language=>'fr'
,p_message_text=>unistr('#LABEL# doit \00EAtre compris entre %0 et %1.')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138618931207751190)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_ON_OR_AFTER'
,p_message_language=>'fr'
,p_message_text=>unistr('#LABEL# doit correspondre ou \00EAtre post\00E9rieur \00E0 %0.')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138619060788751190)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_ON_OR_BEFORE'
,p_message_language=>'fr'
,p_message_text=>unistr('#LABEL# doit correspondre ou \00EAtre ant\00E9rieur \00E0 %0.')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138610405185751188)
,p_name=>'APEX.DATEPICKER.VISUALLY_HIDDEN_EDIT'
,p_message_language=>'fr'
,p_message_text=>unistr('Modification masqu\00E9e visuellement')
,p_is_js_message=>true
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138633724470751195)
,p_name=>'APEX.DATEPICKER.YEAR'
,p_message_language=>'fr'
,p_message_text=>unistr('Ann\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138720742971751221)
,p_name=>'APEX.DATEPICKER_VALUE_GREATER_MAX_DATE'
,p_message_language=>'fr'
,p_message_text=>unistr('La valeur #LABEL# est sup\00E9rieure \00E0 la date maximale indiqu\00E9e %0.')
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138721165390751221)
,p_name=>'APEX.DATEPICKER_VALUE_INVALID'
,p_message_language=>'fr'
,p_message_text=>'La valeur #LABEL# ne concorde pas avec le format %0.'
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138720605154751220)
,p_name=>'APEX.DATEPICKER_VALUE_LESS_MIN_DATE'
,p_message_language=>'fr'
,p_message_text=>unistr('La valeur #LABEL# est inf\00E9rieure \00E0 la date minimale indiqu\00E9e %0.')
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138720828753751221)
,p_name=>'APEX.DATEPICKER_VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'fr'
,p_message_text=>unistr('La valeur #LABEL# n''est pas comprise dans la plage valide de %0 \00E0 %1.')
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138721095715751221)
,p_name=>'APEX.DATEPICKER_VALUE_NOT_IN_YEAR_RANGE'
,p_message_language=>'fr'
,p_message_text=>unistr('La valeur #LABEL# ne figure pas dans la plage d''ann\00E9es valide comprise entre %0 et %1.')
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138612884977751188)
,p_name=>'APEX.DBMS_CLOUD_INT.DBMS_CLOUD_ERROR'
,p_message_language=>'fr'
,p_message_text=>'Une erreur interne est survenue lors du traitement de la demande DBMS_CLOUD.'
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138773448066751236)
,p_name=>'APEX.DIALOG.CANCEL'
,p_message_language=>'fr'
,p_message_text=>'Annuler'
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138799387539751244)
,p_name=>'APEX.DIALOG.CLOSE'
,p_message_language=>'fr'
,p_message_text=>'Fermer'
,p_is_js_message=>true
,p_version_scn=>2704788
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138660518351751203)
,p_name=>'APEX.DIALOG.CONFIRMATION'
,p_message_language=>'fr'
,p_message_text=>'Confirmation'
,p_is_js_message=>true
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138801319426751245)
,p_name=>'APEX.DIALOG.HELP'
,p_message_language=>'fr'
,p_message_text=>'Aide'
,p_is_js_message=>true
,p_version_scn=>2704789
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138773220393751236)
,p_name=>'APEX.DIALOG.OK'
,p_message_language=>'fr'
,p_message_text=>'OK'
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138773314438751236)
,p_name=>'APEX.DIALOG.SAVE'
,p_message_language=>'fr'
,p_message_text=>'Enregistrer'
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138641079488751197)
,p_name=>'APEX.DIALOG.TITLE'
,p_message_language=>'fr'
,p_message_text=>unistr('Titre de la bo\00EEte de dialogue')
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138680758341751209)
,p_name=>'APEX.DIALOG.VISUALLY_HIDDEN_TITLE'
,p_message_language=>'fr'
,p_message_text=>unistr('Titre de bo\00EEte de dialogue visuellement masqu\00E9')
,p_is_js_message=>true
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138601802038751185)
,p_name=>'APEX.DOCGEN'
,p_message_language=>'fr'
,p_message_text=>unistr('Fonction pr\00E9d\00E9finie de g\00E9n\00E9rateur de documents Oracle')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138612614710751188)
,p_name=>'APEX.DOCGEN.DBMS_CLOUD_ERROR'
,p_message_language=>'fr'
,p_message_text=>'Erreur lors de l''impression d''un document.'
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138589816259751182)
,p_name=>'APEX.DOCGEN.INVALID_OUTPUT_TYPE'
,p_message_language=>'fr'
,p_message_text=>'%s ne prend pas en charge %1 en tant que sortie.'
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138601710636751185)
,p_name=>'APEX.DOCGEN.INVOKE_ERROR'
,p_message_language=>'fr'
,p_message_text=>unistr('Erreur "%0" lors de l''appel de la fonction pr\00E9d\00E9finie de g\00E9n\00E9rateur de documents Oracle :')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138593275100751183)
,p_name=>'APEX.DOCGEN.TEMPLATE_REQUIRED'
,p_message_language=>'fr'
,p_message_text=>unistr('Un mod\00E8le est requis.')
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138618685761751190)
,p_name=>'APEX.DOWNLOAD.ERROR'
,p_message_language=>'fr'
,p_message_text=>unistr('Erreur lors du t\00E9l\00E9chargement du fichier.')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138618504646751190)
,p_name=>'APEX.DOWNLOAD.NO_DATA_FOUND'
,p_message_language=>'fr'
,p_message_text=>unistr('Aucune donn\00E9e \00E0 t\00E9l\00E9charger trouv\00E9e.')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138622196356751191)
,p_name=>'APEX.ENVIRONMENT.RUNTIME_ONLY'
,p_message_language=>'fr'
,p_message_text=>unistr('Cette fonctionnalit\00E9 n''est pas disponible dans un environnement d''ex\00E9cution uniquement.')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138674923867751207)
,p_name=>'APEX.ERROR'
,p_message_language=>'fr'
,p_message_text=>'Erreur'
,p_is_js_message=>true
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138634814042751195)
,p_name=>'APEX.ERROR.CALLBACK_FAILED'
,p_message_language=>'fr'
,p_message_text=>unistr('L''erreur suivante est survenue lors de l''ex\00E9cution du callback de gestion des erreurs : %0')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138647437306751199)
,p_name=>'APEX.ERROR.ERROR_PAGE.UNHANDLED_ERROR'
,p_message_language=>'fr'
,p_message_text=>'Erreur lors de l''affichage de la page d''erreur : %0'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138636500576751195)
,p_name=>'APEX.ERROR.INTERNAL'
,p_message_language=>'fr'
,p_message_text=>'Erreur interne'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138786248352751240)
,p_name=>'APEX.ERROR.INTERNAL.CONTACT_ADMINISTRATOR'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Contactez l''administrateur.',
unistr('Les d\00E9tails relatifs \00E0 cet incident sont disponibles via l''ID de d\00E9bogage "%0".')))
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138780875343751238)
,p_name=>'APEX.ERROR.ORA-16000'
,p_message_language=>'fr'
,p_message_text=>unistr('La base de donn\00E9es est ouverte pour acc\00E8s en lecture seule')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138810940142751247)
,p_name=>'APEX.ERROR.ORA-28353'
,p_message_language=>'fr'
,p_message_text=>unistr('ORA-28353 : \00E9chec de l''ouverture du portefeuille. Les donn\00E9es d''application sont actuellement inaccessibles.')
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138780938578751238)
,p_name=>'APEX.ERROR.PAGE_NOT_AVAILABLE'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9sol\00E9, cette page n''est pas disponible')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138639548743751196)
,p_name=>'APEX.ERROR.TECHNICAL_INFO'
,p_message_language=>'fr'
,p_message_text=>unistr('Informations techniques (disponibles uniquement pour les d\00E9veloppeurs)')
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138745437126751228)
,p_name=>'APEX.ERROR_MESSAGE_HEADING'
,p_message_language=>'fr'
,p_message_text=>'Message d''erreur'
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138759324277751232)
,p_name=>'APEX.EXPECTED_FORMAT'
,p_message_language=>'fr'
,p_message_text=>'Format attendu : %0'
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138724266288751222)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.ALREADY_IN_ACL'
,p_message_language=>'fr'
,p_message_text=>unistr('L''utilisateur figure d\00E9j\00E0 dans la liste de contr\00F4le d''acc\00E8s')
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138724171379751222)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.CREATE_CONFIRM'
,p_message_language=>'fr'
,p_message_text=>unistr('Confirmez l''ajout des %0 utilisateurs suivants \00E0 la liste de contr\00F4le d''acc\00E8s <strong>%1</strong>.')
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138724699808751222)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.DUPLICATE_USER'
,p_message_language=>'fr'
,p_message_text=>'Utilisateur en double'
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138724316803751222)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.MISSING_AT_SIGN'
,p_message_language=>'fr'
,p_message_text=>unistr('Arobase manquante (@) dans l''adresse \00E9lectronique')
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138724420623751222)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.MISSING_DOT'
,p_message_language=>'fr'
,p_message_text=>unistr('Point manquant (.) dans l''adresse \00E9lectronique')
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138724580324751222)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.USERNAME_TOO_LONG'
,p_message_language=>'fr'
,p_message_text=>'Le nom utilisateur est trop long'
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138724826421751222)
,p_name=>'APEX.FEATURE.ACL.INFO.ACL_ONLY'
,p_message_language=>'fr'
,p_message_text=>unistr('Seuls les utilisateurs d\00E9finis dans la liste de contr\00F4le d''acc\00E8s de l''application peuvent acc\00E9der \00E0 l''application')
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138724976773751222)
,p_name=>'APEX.FEATURE.ACL.INFO.ACL_VALUE_INVALID'
,p_message_language=>'fr'
,p_message_text=>unistr('Valeur de param\00E8tre de contr\00F4le d''acc\00E8s inattendue : %0')
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138724755861751222)
,p_name=>'APEX.FEATURE.ACL.INFO.ALL_USERS'
,p_message_language=>'fr'
,p_message_text=>unistr('Tous les utilisateurs authentifi\00E9s peuvent acc\00E9der \00E0 cette application')
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138769239403751235)
,p_name=>'APEX.FEATURE.CONFIG.DISABLED'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9sactiv\00E9')
,p_is_js_message=>true
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138769113908751235)
,p_name=>'APEX.FEATURE.CONFIG.ENABLED'
,p_message_language=>'fr'
,p_message_text=>unistr('Activ\00E9')
,p_is_js_message=>true
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138769486650751235)
,p_name=>'APEX.FEATURE.CONFIG.IS_DISABLED'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 : est d\00E9sactiv\00E9')
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138769367650751235)
,p_name=>'APEX.FEATURE.CONFIG.IS_ENABLED'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 : est activ\00E9')
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138617927904751190)
,p_name=>'APEX.FEATURE.CONFIG.NOT_SUPPORTED'
,p_message_language=>'fr'
,p_message_text=>'Non pris en charge'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138679142277751208)
,p_name=>'APEX.FEATURE.CONFIG.OFF'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9sactiv\00E9')
,p_is_js_message=>true
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138679048973751208)
,p_name=>'APEX.FEATURE.CONFIG.ON'
,p_message_language=>'fr'
,p_message_text=>unistr('Activ\00E9')
,p_is_js_message=>true
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138769016763751235)
,p_name=>'APEX.FEATURE.TOP_USERS.USERNAME.NOT_IDENTIFIED'
,p_message_language=>'fr'
,p_message_text=>unistr('non identifi\00E9')
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138609540994751187)
,p_name=>'APEX.FILESIZE.BYTES'
,p_message_language=>'fr'
,p_message_text=>'%0 octets'
,p_is_js_message=>true
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138610043377751188)
,p_name=>'APEX.FILESIZE.GB'
,p_message_language=>'fr'
,p_message_text=>'%0 GB'
,p_is_js_message=>true
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138609751550751187)
,p_name=>'APEX.FILESIZE.KB'
,p_message_language=>'fr'
,p_message_text=>'%0 KB'
,p_is_js_message=>true
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138609901155751188)
,p_name=>'APEX.FILESIZE.MB'
,p_message_language=>'fr'
,p_message_text=>'%0 MB'
,p_is_js_message=>true
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138762224867751233)
,p_name=>'APEX.FILE_BROWSE.DOWNLOAD_LINK_TEXT'
,p_message_language=>'fr'
,p_message_text=>unistr('T\00E9l\00E9charger en local')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138615308338751189)
,p_name=>'APEX.FS.ACTIONS_MENU_BUTTON_LABEL'
,p_message_language=>'fr'
,p_message_text=>'Options'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138615004301751189)
,p_name=>'APEX.FS.ACTIONS_MENU_FILTER'
,p_message_language=>'fr'
,p_message_text=>'Filtrer'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138615295424751189)
,p_name=>'APEX.FS.ACTIONS_MENU_HIDE'
,p_message_language=>'fr'
,p_message_text=>'Masquer le facet'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138639995933751196)
,p_name=>'APEX.FS.ADD_FILTER'
,p_message_language=>'fr'
,p_message_text=>'Ajouter un filtre'
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138716233649751219)
,p_name=>'APEX.FS.APPLIED_FACET'
,p_message_language=>'fr'
,p_message_text=>unistr('Filtre appliqu\00E9 : %0')
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138640684472751197)
,p_name=>'APEX.FS.APPLY'
,p_message_language=>'fr'
,p_message_text=>'Appliquer'
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138759825721751232)
,p_name=>'APEX.FS.BATCH_APPLY'
,p_message_language=>'fr'
,p_message_text=>'Appliquer'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138640728692751197)
,p_name=>'APEX.FS.CANCEL'
,p_message_language=>'fr'
,p_message_text=>'Annuler'
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138624528216751192)
,p_name=>'APEX.FS.CHART_BAR'
,p_message_language=>'fr'
,p_message_text=>unistr('Graphique \00E0 barres')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138772506858751236)
,p_name=>'APEX.FS.CHART_OTHERS'
,p_message_language=>'fr'
,p_message_text=>'Autres'
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138624610567751192)
,p_name=>'APEX.FS.CHART_PIE'
,p_message_language=>'fr'
,p_message_text=>unistr('Graphique \00E0 secteurs')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138771124636751236)
,p_name=>'APEX.FS.CHART_TITLE'
,p_message_language=>'fr'
,p_message_text=>'Graphique'
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138624391032751192)
,p_name=>'APEX.FS.CHART_VALUE_LABEL'
,p_message_language=>'fr'
,p_message_text=>'Nombre'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138760370221751232)
,p_name=>'APEX.FS.CLEAR'
,p_message_language=>'fr'
,p_message_text=>'Effacer'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138760423973751232)
,p_name=>'APEX.FS.CLEAR_ALL'
,p_message_language=>'fr'
,p_message_text=>'Effacer tout'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138760575419751232)
,p_name=>'APEX.FS.CLEAR_VALUE'
,p_message_language=>'fr'
,p_message_text=>'Effacer %0'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138777052488751237)
,p_name=>'APEX.FS.COLUMN_UNAUTHORIZED'
,p_message_language=>'fr'
,p_message_text=>unistr('La colonne %1, r\00E9f\00E9renc\00E9e par le facet %0, n''est pas disponible ou n''est pas autoris\00E9e.')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138587724717751181)
,p_name=>'APEX.FS.CONFIG_TITLE'
,p_message_language=>'fr'
,p_message_text=>unistr('Choisir les filtres \00E0 afficher')
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138714213927751219)
,p_name=>'APEX.FS.COUNT_RESULTS'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 r\00E9sultats')
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138714302350751219)
,p_name=>'APEX.FS.COUNT_SELECTED'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lection : %0')
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138717152599751219)
,p_name=>'APEX.FS.CUR_FILTERS_LM'
,p_message_language=>'fr'
,p_message_text=>'Filtres en cours'
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138592784358751182)
,p_name=>'APEX.FS.FACETED_SEARCH_NEEDS_REGION_QUERY'
,p_message_language=>'fr'
,p_message_text=>unistr('La recherche \00E0 facets n\00E9cessite une source de donn\00E9es au niveau de la r\00E9gion.')
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138596499172751184)
,p_name=>'APEX.FS.FACETS_LIST'
,p_message_language=>'fr'
,p_message_text=>'Liste des filtres'
,p_is_js_message=>true
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138775565146751237)
,p_name=>'APEX.FS.FACET_VALUE_LIMIT_EXCEEDED'
,p_message_language=>'fr'
,p_message_text=>unistr('Limite de valeur distincte (%0) d\00E9pass\00E9e pour le facet %1.')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138761877441751233)
,p_name=>'APEX.FS.FC_TYPE_UNSUPPORTED_FOR_DATE_COLUMNS'
,p_message_language=>'fr'
,p_message_text=>'Le facet %0 n''est pas pris en charge pour les colonnes de type DATE ou TIMESTAMP.'
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138759911930751232)
,p_name=>'APEX.FS.FILTER'
,p_message_language=>'fr'
,p_message_text=>'Filtrer %0'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138634524950751195)
,p_name=>'APEX.FS.FILTER_APPLIED'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 (filtre appliqu\00E9)')
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138760004769751232)
,p_name=>'APEX.FS.GO'
,p_message_language=>'fr'
,p_message_text=>'OK'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138630013507751193)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_C'
,p_message_language=>'fr'
,p_message_text=>'contient %0'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138761414969751233)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_EQ'
,p_message_language=>'fr'
,p_message_text=>unistr('est \00E9gal \00E0 %0')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138629786244751193)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_GT'
,p_message_language=>'fr'
,p_message_text=>unistr('sup\00E9rieur \00E0 %0')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138629807205751193)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_GTE'
,p_message_language=>'fr'
,p_message_text=>unistr('sup\00E9rieur ou \00E9gal \00E0 %0')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138629444477751193)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_LT'
,p_message_language=>'fr'
,p_message_text=>unistr('inf\00E9rieur \00E0 %0')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138629600011751193)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_LTE'
,p_message_language=>'fr'
,p_message_text=>unistr('inf\00E9rieur ou \00E9gal \00E0 %0')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138628943768751193)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NC'
,p_message_language=>'fr'
,p_message_text=>'ne contient pas %0'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138614771735751189)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NEQ'
,p_message_language=>'fr'
,p_message_text=>unistr('est diff\00E9rent de %0')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138629093011751193)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NSTARTS'
,p_message_language=>'fr'
,p_message_text=>'ne commence pas par %0'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138629920119751193)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_STARTS'
,p_message_language=>'fr'
,p_message_text=>'commence par %0'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138628020753751193)
,p_name=>'APEX.FS.INPUT_FACET_SELECTOR'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lection de facet')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138603854044751186)
,p_name=>'APEX.FS.INPUT_INVALID_FILTER_PREFIX'
,p_message_language=>'fr'
,p_message_text=>unistr('Le pr\00E9fixe de filtre "%0" n''est pas valide pour le facet "%1".')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138602260970751185)
,p_name=>'APEX.FS.INPUT_MISSING_FILTER_PREFIX'
,p_message_language=>'fr'
,p_message_text=>unistr('Pr\00E9fixe de filtre manquant pour le facet "%0".')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138636405214751195)
,p_name=>'APEX.FS.INPUT_OPERATOR'
,p_message_language=>'fr'
,p_message_text=>unistr('Op\00E9rateur')
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138618352998751190)
,p_name=>'APEX.FS.INPUT_OPERATOR.C'
,p_message_language=>'fr'
,p_message_text=>'contient'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138617370097751190)
,p_name=>'APEX.FS.INPUT_OPERATOR.EQ'
,p_message_language=>'fr'
,p_message_text=>unistr('est \00E9gal \00E0')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138618026409751190)
,p_name=>'APEX.FS.INPUT_OPERATOR.GT'
,p_message_language=>'fr'
,p_message_text=>unistr('est sup\00E9rieur \00E0')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138618121695751190)
,p_name=>'APEX.FS.INPUT_OPERATOR.GTE'
,p_message_language=>'fr'
,p_message_text=>unistr('sup\00E9rieur ou \00E9gal \00E0')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138617757417751190)
,p_name=>'APEX.FS.INPUT_OPERATOR.LT'
,p_message_language=>'fr'
,p_message_text=>unistr('est inf\00E9rieur \00E0')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138617837481751190)
,p_name=>'APEX.FS.INPUT_OPERATOR.LTE'
,p_message_language=>'fr'
,p_message_text=>unistr('inf\00E9rieur ou \00E9gal \00E0')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138628858791751193)
,p_name=>'APEX.FS.INPUT_OPERATOR.NC'
,p_message_language=>'fr'
,p_message_text=>'ne contient pas'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138617570912751190)
,p_name=>'APEX.FS.INPUT_OPERATOR.NEQ'
,p_message_language=>'fr'
,p_message_text=>unistr('est diff\00E9rent de')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138628751118751193)
,p_name=>'APEX.FS.INPUT_OPERATOR.NSTARTS'
,p_message_language=>'fr'
,p_message_text=>'ne commence pas par'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138618239957751190)
,p_name=>'APEX.FS.INPUT_OPERATOR.STARTS'
,p_message_language=>'fr'
,p_message_text=>'commence par'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138636814122751196)
,p_name=>'APEX.FS.INPUT_UNSUPPORTED_DATA_TYPE'
,p_message_language=>'fr'
,p_message_text=>unistr('Le type de donn\00E9es %0 (%1) n''est pas pris en charge pour le facet de champ de saisie.')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138603729979751186)
,p_name=>'APEX.FS.INPUT_UNSUPPORTED_FILTER_FOR_DATA_TYPE'
,p_message_language=>'fr'
,p_message_text=>unistr('Le filtre "%0" n''est pas pris en charge pour le facet "%1" (type de donn\00E9es %2).')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138636332589751195)
,p_name=>'APEX.FS.INPUT_VALUE'
,p_message_language=>'fr'
,p_message_text=>'Valeur'
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138761660312751233)
,p_name=>'APEX.FS.NO_SEARCH_COLUMNS_PROVIDED'
,p_message_language=>'fr'
,p_message_text=>unistr('Aucune colonne de recherche n''a \00E9t\00E9 fournie pour le facet %0')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138587849917751181)
,p_name=>'APEX.FS.OPEN_CONFIG'
,p_message_language=>'fr'
,p_message_text=>'Plus de filtres'
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138714462513751219)
,p_name=>'APEX.FS.RANGE_BEGIN'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9but de la plage')
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138761189458751233)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 \00E0 %1')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138761242186751233)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL_OPEN_HI'
,p_message_language=>'fr'
,p_message_text=>'Au-dessus de %0'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138761301524751233)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL_OPEN_LO'
,p_message_language=>'fr'
,p_message_text=>'En dessous de %0'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138714525893751219)
,p_name=>'APEX.FS.RANGE_END'
,p_message_language=>'fr'
,p_message_text=>'Fin de la plage'
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138779189982751238)
,p_name=>'APEX.FS.RANGE_LOV_ITEM_INVALID'
,p_message_language=>'fr'
,p_message_text=>unistr('L''\00E9l\00E9ment de liste de valeurs (LOV) #%2 ("%1") du facet de plage %0 n''est pas valide (s\00E9parateur "|" manquant).')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138761516231751233)
,p_name=>'APEX.FS.RANGE_MANUAL_NOT_SUPPORTED'
,p_message_language=>'fr'
,p_message_text=>unistr('L''entr\00E9e manuelle n''est actuellement pas prise en charge pour le facet de plage %0, car la colonne est de type DATE ou TIMESTAMP.')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138760818835751232)
,p_name=>'APEX.FS.RANGE_TEXT'
,p_message_language=>'fr'
,p_message_text=>unistr('\00E0')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138624459407751192)
,p_name=>'APEX.FS.REMOVE_CHART'
,p_message_language=>'fr'
,p_message_text=>'Enlever le graphique'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138710869676751218)
,p_name=>'APEX.FS.RESET'
,p_message_language=>'fr'
,p_message_text=>unistr('R\00E9initialiser')
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138760266877751232)
,p_name=>'APEX.FS.SEARCH_LABEL'
,p_message_language=>'fr'
,p_message_text=>'Rechercher'
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138760172808751232)
,p_name=>'APEX.FS.SEARCH_PLACEHOLDER'
,p_message_language=>'fr'
,p_message_text=>'Rechercher...'
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138761098050751233)
,p_name=>'APEX.FS.SELECT_PLACEHOLDER'
,p_message_language=>'fr'
,p_message_text=>unistr('- S\00E9lectionner -')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138624214138751192)
,p_name=>'APEX.FS.SHOW_CHART'
,p_message_language=>'fr'
,p_message_text=>'Afficher le graphique'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138760600069751232)
,p_name=>'APEX.FS.SHOW_LESS'
,p_message_language=>'fr'
,p_message_text=>'Afficher moins'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138760714018751232)
,p_name=>'APEX.FS.SHOW_MORE'
,p_message_language=>'fr'
,p_message_text=>'Afficher tout'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138760966292751233)
,p_name=>'APEX.FS.STAR_RATING_LABEL'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 \00E9toiles et plus')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138716114700751219)
,p_name=>'APEX.FS.SUGGESTIONS'
,p_message_language=>'fr'
,p_message_text=>'Suggestions de filtre'
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138761788355751233)
,p_name=>'APEX.FS.TEXT_FIELD_ONLY_FOR_NUMBER_COLUMNS'
,p_message_language=>'fr'
,p_message_text=>'Le facet de champ de texte %0 n''est actuellement pris en charge que pour les colonnes de type NUMBER.'
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138587284300751181)
,p_name=>'APEX.FS.TOTAL_ROW_COUNT_LABEL'
,p_message_language=>'fr'
,p_message_text=>'Nombre total de lignes'
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138777136891751237)
,p_name=>'APEX.FS.UNSUPPORTED_DATA_TYPE'
,p_message_language=>'fr'
,p_message_text=>unistr('Le type de donn\00E9es %0 (%1) n''est pas pris en charge pour la recherche \00E0 facets.')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138707323955751217)
,p_name=>'APEX.FS.VISUALLY_HIDDEN_HEADING'
,p_message_language=>'fr'
,p_message_text=>unistr('En-t\00EAte masqu\00E9 visuellement')
,p_is_js_message=>true
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138769674711751235)
,p_name=>'APEX.GO_TO_ERROR'
,p_message_language=>'fr'
,p_message_text=>unistr('Acc\00E9der \00E0 l''erreur')
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138725666937751222)
,p_name=>'APEX.GV.AGG_CONTEXT'
,p_message_language=>'fr'
,p_message_text=>unistr('Agr\00E9ger.')
,p_is_js_message=>true
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138653573819751200)
,p_name=>'APEX.GV.BLANK_HEADING'
,p_message_language=>'fr'
,p_message_text=>unistr('En-t\00EAte vide')
,p_is_js_message=>true
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138734981217751225)
,p_name=>'APEX.GV.BREAK_COLLAPSE'
,p_message_language=>'fr'
,p_message_text=>unistr('R\00E9duire la commande BREAK')
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138725765264751222)
,p_name=>'APEX.GV.BREAK_CONTEXT'
,p_message_language=>'fr'
,p_message_text=>'Commande BREAK.'
,p_is_js_message=>true
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138734876638751225)
,p_name=>'APEX.GV.BREAK_EXPAND'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9velopper la commande BREAK')
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138734688280751225)
,p_name=>'APEX.GV.DELETED_COUNT'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 lignes supprim\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138803745805751245)
,p_name=>'APEX.GV.DUP_REC_ID'
,p_message_language=>'fr'
,p_message_text=>unistr('Dupliquer l''identit\00E9')
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138596644023751184)
,p_name=>'APEX.GV.ENTER_EDIT_MODE'
,p_message_language=>'fr'
,p_message_text=>unistr('Entr\00E9e en mode de modification')
,p_is_js_message=>true
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138722595613751221)
,p_name=>'APEX.GV.FIRST_PAGE'
,p_message_language=>'fr'
,p_message_text=>'Premier'
,p_is_js_message=>true
,p_version_scn=>2704772
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138595456037751183)
,p_name=>'APEX.GV.FLOATING_ITEM.DIALOG.HIDE_DIALOG'
,p_message_language=>'fr'
,p_message_text=>unistr('Masquer la bo\00EEte de dialogue')
,p_is_js_message=>true
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138594469231751183)
,p_name=>'APEX.GV.FLOATING_ITEM.DIALOG.TITLE'
,p_message_language=>'fr'
,p_message_text=>unistr('Contenu de cellule de d\00E9bordement flottant')
,p_is_js_message=>true
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138595744525751183)
,p_name=>'APEX.GV.FLOATING_ITEM.SHOW_DIALOG'
,p_message_language=>'fr'
,p_message_text=>unistr('Afficher le contenu de d\00E9bordement')
,p_is_js_message=>true
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138669984808751205)
,p_name=>'APEX.GV.FOOTER_LANDMARK'
,p_message_language=>'fr'
,p_message_text=>'Pied de page de grille'
,p_is_js_message=>true
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138725939284751222)
,p_name=>'APEX.GV.GROUP_CONTEXT'
,p_message_language=>'fr'
,p_message_text=>unistr('En-t\00EAte de groupe')
,p_is_js_message=>true
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138725887209751222)
,p_name=>'APEX.GV.HEADER_CONTEXT'
,p_message_language=>'fr'
,p_message_text=>unistr('En-t\00EAte.')
,p_is_js_message=>true
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138722670898751221)
,p_name=>'APEX.GV.LAST_PAGE'
,p_message_language=>'fr'
,p_message_text=>'Dernier'
,p_is_js_message=>true
,p_version_scn=>2704772
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138596807368751184)
,p_name=>'APEX.GV.LEAVE_EDIT_MODE'
,p_message_language=>'fr'
,p_message_text=>'Sortie du mode de modification'
,p_is_js_message=>true
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138621539681751191)
,p_name=>'APEX.GV.LOAD_ALL'
,p_message_language=>'fr'
,p_message_text=>'Tout charger'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138744409956751228)
,p_name=>'APEX.GV.LOAD_MORE'
,p_message_language=>'fr'
,p_message_text=>'Afficher plus'
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138722367778751221)
,p_name=>'APEX.GV.NEXT_PAGE'
,p_message_language=>'fr'
,p_message_text=>'Suivant'
,p_is_js_message=>true
,p_version_scn=>2704772
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138726063420751222)
,p_name=>'APEX.GV.PAGE_RANGE'
,p_message_language=>'fr'
,p_message_text=>'Lignes de page'
,p_is_js_message=>true
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138635168619751195)
,p_name=>'APEX.GV.PAGE_RANGE_ENTITY'
,p_message_language=>'fr'
,p_message_text=>'Page %0'
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138722733576751221)
,p_name=>'APEX.GV.PAGE_RANGE_XY'
,p_message_language=>'fr'
,p_message_text=>'%0 - %1'
,p_is_js_message=>true
,p_version_scn=>2704772
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138722832937751221)
,p_name=>'APEX.GV.PAGE_RANGE_XYZ'
,p_message_language=>'fr'
,p_message_text=>'%0 - %1 sur %2'
,p_is_js_message=>true
,p_version_scn=>2704772
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138779779211751238)
,p_name=>'APEX.GV.PAGE_SELECTION'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lection de page')
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138670297529751205)
,p_name=>'APEX.GV.PAGINATION_LANDMARK'
,p_message_language=>'fr'
,p_message_text=>'Pagination'
,p_is_js_message=>true
,p_version_scn=>2704763
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138722490666751221)
,p_name=>'APEX.GV.PREV_PAGE'
,p_message_language=>'fr'
,p_message_text=>unistr('Pr\00E9c\00E9dent')
,p_is_js_message=>true
,p_version_scn=>2704772
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138620414663751191)
,p_name=>'APEX.GV.RANGE_DISPLAY'
,p_message_language=>'fr'
,p_message_text=>'Affichage de la plage'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138653839639751201)
,p_name=>'APEX.GV.ROWS_SELECTION'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lection de lignes')
,p_is_js_message=>true
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138803558210751245)
,p_name=>'APEX.GV.ROW_ADDED'
,p_message_language=>'fr'
,p_message_text=>unistr('Ajout\00E9')
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138803644715751245)
,p_name=>'APEX.GV.ROW_CHANGED'
,p_message_language=>'fr'
,p_message_text=>unistr('Modifi\00E9')
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138811914361751248)
,p_name=>'APEX.GV.ROW_COLUMN_CONTEXT'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9quence de ligne de grille %0, colonne %1.')
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138812000282751248)
,p_name=>'APEX.GV.ROW_CONTEXT'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9quence de ligne de grille %0.')
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138803420751751245)
,p_name=>'APEX.GV.ROW_DELETED'
,p_message_language=>'fr'
,p_message_text=>unistr('Supprim\00E9')
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138726209526751222)
,p_name=>'APEX.GV.ROW_HEADER'
,p_message_language=>'fr'
,p_message_text=>unistr('En-t\00EAte de ligne')
,p_is_js_message=>true
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138653799232751201)
,p_name=>'APEX.GV.ROW_SELECTION'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lection de ligne')
,p_is_js_message=>true
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138621627054751191)
,p_name=>'APEX.GV.SELECTED_ENTITY_COUNT'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 %1 s\00E9lectionn\00E9')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138721713972751221)
,p_name=>'APEX.GV.SELECTION_CELL_COUNT'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 cellules s\00E9lectionn\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138722932476751221)
,p_name=>'APEX.GV.SELECTION_COUNT'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 lignes s\00E9lectionn\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704772
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138765070918751234)
,p_name=>'APEX.GV.SELECT_ALL'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lectionner tout')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138658547636751202)
,p_name=>'APEX.GV.SELECT_ALL_ROWS'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lectionner toutes les lignes')
,p_is_js_message=>true
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138734743987751225)
,p_name=>'APEX.GV.SELECT_PAGE_N'
,p_message_language=>'fr'
,p_message_text=>'Page %0'
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138726107728751222)
,p_name=>'APEX.GV.SELECT_ROW'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lectionner une ligne')
,p_is_js_message=>true
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138726468708751222)
,p_name=>'APEX.GV.SORTED_ASCENDING'
,p_message_language=>'fr'
,p_message_text=>unistr('Tri\00E9 par ordre croissant %0')
,p_is_js_message=>true
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138726515280751222)
,p_name=>'APEX.GV.SORTED_DESCENDING'
,p_message_language=>'fr'
,p_message_text=>unistr('Tri\00E9 par ordre d\00E9croissant %0')
,p_is_js_message=>true
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138721851454751221)
,p_name=>'APEX.GV.SORT_ASCENDING'
,p_message_language=>'fr'
,p_message_text=>'Trier par ordre croissant'
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138722114601751221)
,p_name=>'APEX.GV.SORT_ASCENDING_ORDER'
,p_message_language=>'fr'
,p_message_text=>'Trier par ordre croissant %0'
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138721933004751221)
,p_name=>'APEX.GV.SORT_DESCENDING'
,p_message_language=>'fr'
,p_message_text=>unistr('Trier par ordre d\00E9croissant')
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138722203073751221)
,p_name=>'APEX.GV.SORT_DESCENDING_ORDER'
,p_message_language=>'fr'
,p_message_text=>unistr('Trier par ordre d\00E9croissant %0')
,p_is_js_message=>true
,p_version_scn=>2704772
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138722080522751221)
,p_name=>'APEX.GV.SORT_OFF'
,p_message_language=>'fr'
,p_message_text=>'Ne pas trier'
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138587687659751181)
,p_name=>'APEX.GV.SORT_OPTIONS'
,p_message_language=>'fr'
,p_message_text=>'Options de tri'
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138670098113751205)
,p_name=>'APEX.GV.STATE_ICONS_LANDMARK'
,p_message_language=>'fr'
,p_message_text=>unistr('Ic\00F4nes d''\00E9tat')
,p_is_js_message=>true
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138670135697751205)
,p_name=>'APEX.GV.STATUS_LANDMARK'
,p_message_language=>'fr'
,p_message_text=>'Statut de la grille'
,p_is_js_message=>true
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138599909490751185)
,p_name=>'APEX.GV.TOTAL_ENTITY_PLURAL'
,p_message_language=>'fr'
,p_message_text=>'%0 %1'
,p_is_js_message=>true
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138599698014751185)
,p_name=>'APEX.GV.TOTAL_ENTITY_SINGULAR'
,p_message_language=>'fr'
,p_message_text=>'1 %0'
,p_is_js_message=>true
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138734516346751225)
,p_name=>'APEX.GV.TOTAL_PAGES'
,p_message_language=>'fr'
,p_message_text=>'Total %0'
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138653360568751200)
,p_name=>'APEX.HTTP.REQUEST_FAILED'
,p_message_language=>'fr'
,p_message_text=>unistr('Echec de la demande HTTP \00E0 "%0".')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138654960858751201)
,p_name=>'APEX.ICON_LIST.COLUMN'
,p_message_language=>'fr'
,p_message_text=>'Colonne %0'
,p_is_js_message=>true
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138655152812751201)
,p_name=>'APEX.ICON_LIST.COLUMN_AND_ROW'
,p_message_language=>'fr'
,p_message_text=>'Colonne %0 et ligne %1'
,p_is_js_message=>true
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138655476792751201)
,p_name=>'APEX.ICON_LIST.FIRST_COLUMN'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9j\00E0 sur la premi\00E8re colonne. Colonne %0 et ligne %1')
,p_is_js_message=>true
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138655326381751201)
,p_name=>'APEX.ICON_LIST.FIRST_ROW'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9j\00E0 sur la premi\00E8re ligne. Colonne %0 et ligne %1')
,p_is_js_message=>true
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138800905521751244)
,p_name=>'APEX.ICON_LIST.GRID_DIM'
,p_message_language=>'fr'
,p_message_text=>unistr('Pr\00E9sentation en %0 colonnes et %1 lignes')
,p_is_js_message=>true
,p_version_scn=>2704789
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138655541545751201)
,p_name=>'APEX.ICON_LIST.LAST_COLUMN'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9j\00E0 sur la derni\00E8re colonne. Colonne %0 et ligne %1')
,p_is_js_message=>true
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138655217056751201)
,p_name=>'APEX.ICON_LIST.LAST_ROW'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9j\00E0 sur la derni\00E8re ligne. Colonne %0 et ligne %1')
,p_is_js_message=>true
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138734496011751225)
,p_name=>'APEX.ICON_LIST.LIST_DIM'
,p_message_language=>'fr'
,p_message_text=>unistr('Pr\00E9sentation en %0 lignes')
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138655052583751201)
,p_name=>'APEX.ICON_LIST.ROW'
,p_message_language=>'fr'
,p_message_text=>'Ligne %0'
,p_is_js_message=>true
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138811710677751248)
,p_name=>'APEX.IG.ACC_LABEL'
,p_message_language=>'fr'
,p_message_text=>'Grille interactive %0'
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138718802734751220)
,p_name=>'APEX.IG.ACTIONS'
,p_message_language=>'fr'
,p_message_text=>'Actions'
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138719827765751220)
,p_name=>'APEX.IG.ADD'
,p_message_language=>'fr'
,p_message_text=>'Ajouter'
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138719709328751220)
,p_name=>'APEX.IG.ADD_ROW'
,p_message_language=>'fr'
,p_message_text=>'Ajouter une ligne'
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138805374749751246)
,p_name=>'APEX.IG.AGGREGATE'
,p_message_language=>'fr'
,p_message_text=>unistr('Agr\00E9ger')
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138790907364751241)
,p_name=>'APEX.IG.AGGREGATION'
,p_message_language=>'fr'
,p_message_text=>unistr('Agr\00E9gation')
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138792633771751242)
,p_name=>'APEX.IG.ALL'
,p_message_language=>'fr'
,p_message_text=>'Tout'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138750247082751229)
,p_name=>'APEX.IG.ALL_TEXT_COLUMNS'
,p_message_language=>'fr'
,p_message_text=>'Toutes les colonnes de texte'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138751486148751230)
,p_name=>'APEX.IG.ALTERNATIVE'
,p_message_language=>'fr'
,p_message_text=>'Remplacement'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138752589576751230)
,p_name=>'APEX.IG.AND'
,p_message_language=>'fr'
,p_message_text=>'et'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138771908310751236)
,p_name=>'APEX.IG.APPROX_COUNT_DISTINCT'
,p_message_language=>'fr'
,p_message_text=>'Nombre approximatif de valeurs distinctes'
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138806384808751246)
,p_name=>'APEX.IG.APPROX_COUNT_DISTINCT_OVERALL'
,p_message_language=>'fr'
,p_message_text=>'Nombre approximatif global de valeurs distinctes'
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138789561280751241)
,p_name=>'APEX.IG.AREA'
,p_message_language=>'fr'
,p_message_text=>'Graphique en aires'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138791480770751242)
,p_name=>'APEX.IG.ASCENDING'
,p_message_language=>'fr'
,p_message_text=>'Croissant'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138751530040751230)
,p_name=>'APEX.IG.AUTHORIZATION'
,p_message_language=>'fr'
,p_message_text=>'Autorisation'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138805434450751246)
,p_name=>'APEX.IG.AUTO'
,p_message_language=>'fr'
,p_message_text=>'Automatique'
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138772323293751236)
,p_name=>'APEX.IG.AVG'
,p_message_language=>'fr'
,p_message_text=>'Moyenne'
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138806092390751246)
,p_name=>'APEX.IG.AVG_OVERALL'
,p_message_language=>'fr'
,p_message_text=>'Moyenne globale'
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138789045868751241)
,p_name=>'APEX.IG.AXIS_LABEL_TITLE'
,p_message_language=>'fr'
,p_message_text=>unistr('Titre d''axe de libell\00E9')
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138789261367751241)
,p_name=>'APEX.IG.AXIS_VALUE_DECIMAL'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9cimales')
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138789168017751241)
,p_name=>'APEX.IG.AXIS_VALUE_TITLE'
,p_message_language=>'fr'
,p_message_text=>'Titre d''axe de valeur'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138795299010751243)
,p_name=>'APEX.IG.BACKGROUND_COLOR'
,p_message_language=>'fr'
,p_message_text=>unistr('Couleur d''arri\00E8re-plan')
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138789613212751241)
,p_name=>'APEX.IG.BAR'
,p_message_language=>'fr'
,p_message_text=>unistr('Graphique \00E0 barres')
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138746841456751228)
,p_name=>'APEX.IG.BETWEEN'
,p_message_language=>'fr'
,p_message_text=>'entre'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138796445318751243)
,p_name=>'APEX.IG.BOTH'
,p_message_language=>'fr'
,p_message_text=>'Les deux'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138789794216751241)
,p_name=>'APEX.IG.BUBBLE'
,p_message_language=>'fr'
,p_message_text=>unistr('Graphique \00E0 bulles')
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138720013241751220)
,p_name=>'APEX.IG.CANCEL'
,p_message_language=>'fr'
,p_message_text=>'Annuler'
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138752469873751230)
,p_name=>'APEX.IG.CASE_SENSITIVE'
,p_message_language=>'fr'
,p_message_text=>'Respect des majuscules/minuscules'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138806939748751246)
,p_name=>'APEX.IG.CASE_SENSITIVE_WITH_BRACKETS'
,p_message_language=>'fr'
,p_message_text=>'(Respect des majuscules/minuscules)'
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138778230097751238)
,p_name=>'APEX.IG.CHANGES_SAVED'
,p_message_language=>'fr'
,p_message_text=>unistr('Modifications enregistr\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138720464896751220)
,p_name=>'APEX.IG.CHANGE_VIEW'
,p_message_language=>'fr'
,p_message_text=>'Modifier la vue'
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138753582886751230)
,p_name=>'APEX.IG.CHART'
,p_message_language=>'fr'
,p_message_text=>'Graphique'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138750052854751229)
,p_name=>'APEX.IG.CHART_MAX_DATAPOINT_CNT'
,p_message_language=>'fr'
,p_message_text=>unistr('Votre requ\00EAte d\00E9passe la valeur maximale de %0 points de donn\00E9es par graphique. Appliquez un filtre pour r\00E9duire le nombre d''enregistrements dans votre requ\00EAte de base.')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138718709217751220)
,p_name=>'APEX.IG.CHART_VIEW'
,p_message_language=>'fr'
,p_message_text=>'Vue graphique'
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138727115184751222)
,p_name=>'APEX.IG.CLEAR'
,p_message_language=>'fr'
,p_message_text=>'Effacer'
,p_is_js_message=>true
,p_version_scn=>2704775
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138788552453751241)
,p_name=>'APEX.IG.CLOSE_COLUMN'
,p_message_language=>'fr'
,p_message_text=>'Fermer'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138795435196751243)
,p_name=>'APEX.IG.COLORS'
,p_message_language=>'fr'
,p_message_text=>'Couleurs'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138772702588751236)
,p_name=>'APEX.IG.COLOR_PREVIEW'
,p_message_language=>'fr'
,p_message_text=>unistr('Aper\00E7u')
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138751878578751230)
,p_name=>'APEX.IG.COLUMN'
,p_message_language=>'fr'
,p_message_text=>'Colonne'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138718933860751220)
,p_name=>'APEX.IG.COLUMNS'
,p_message_language=>'fr'
,p_message_text=>'Colonnes'
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138680874622751209)
,p_name=>'APEX.IG.COLUMN_HEADER_ACTIONS'
,p_message_language=>'fr'
,p_message_text=>'Actions de colonne'
,p_is_js_message=>true
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138680684870751209)
,p_name=>'APEX.IG.COLUMN_HEADER_ACTIONS_FOR'
,p_message_language=>'fr'
,p_message_text=>'Actions pour la colonne "%0"'
,p_is_js_message=>true
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138797210870751243)
,p_name=>'APEX.IG.COLUMN_TYPE'
,p_message_language=>'fr'
,p_message_text=>'Objectif de la colonne'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138751922524751230)
,p_name=>'APEX.IG.COMPLEX'
,p_message_language=>'fr'
,p_message_text=>'Complexe'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138719166093751220)
,p_name=>'APEX.IG.COMPUTE'
,p_message_language=>'fr'
,p_message_text=>'Calculer'
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138747414913751229)
,p_name=>'APEX.IG.CONTAINS'
,p_message_language=>'fr'
,p_message_text=>'contient'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138753781221751230)
,p_name=>'APEX.IG.CONTROL_BREAK'
,p_message_language=>'fr'
,p_message_text=>'Commande BREAK'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138726991534751222)
,p_name=>'APEX.IG.COPY_CB'
,p_message_language=>'fr'
,p_message_text=>'Copier dans le presse-papiers'
,p_is_js_message=>true
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138727020359751222)
,p_name=>'APEX.IG.COPY_DOWN'
,p_message_language=>'fr'
,p_message_text=>'Copier'
,p_is_js_message=>true
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138771799728751236)
,p_name=>'APEX.IG.COUNT'
,p_message_language=>'fr'
,p_message_text=>'Nombre'
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138771860391751236)
,p_name=>'APEX.IG.COUNT_DISTINCT'
,p_message_language=>'fr'
,p_message_text=>'Nombre de valeurs distinctes'
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138806261036751246)
,p_name=>'APEX.IG.COUNT_DISTINCT_OVERALL'
,p_message_language=>'fr'
,p_message_text=>'Nombre global de valeurs distinctes'
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138806122457751246)
,p_name=>'APEX.IG.COUNT_OVERALL'
,p_message_language=>'fr'
,p_message_text=>'Nombre global'
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138803887764751245)
,p_name=>'APEX.IG.CREATE_X'
,p_message_language=>'fr'
,p_message_text=>unistr('Cr\00E9er %0')
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138750477745751229)
,p_name=>'APEX.IG.DATA'
,p_message_language=>'fr'
,p_message_text=>unistr('Donn\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138797053788751243)
,p_name=>'APEX.IG.DATA_TYPE'
,p_message_language=>'fr'
,p_message_text=>unistr('Type de donn\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138796637909751243)
,p_name=>'APEX.IG.DATE'
,p_message_language=>'fr'
,p_message_text=>'Date'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138778088896751238)
,p_name=>'APEX.IG.DATE_INVALID_VALUE'
,p_message_language=>'fr'
,p_message_text=>'Valeur de date non valide'
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138748189667751229)
,p_name=>'APEX.IG.DAYS'
,p_message_language=>'fr'
,p_message_text=>'jours'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138751179811751230)
,p_name=>'APEX.IG.DEFAULT_SETTINGS'
,p_message_language=>'fr'
,p_message_text=>unistr('Param\00E8tres par d\00E9faut')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138750911569751230)
,p_name=>'APEX.IG.DEFAULT_TYPE'
,p_message_language=>'fr'
,p_message_text=>unistr('Type par d\00E9faut')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138719909982751220)
,p_name=>'APEX.IG.DELETE'
,p_message_language=>'fr'
,p_message_text=>'Supprimer'
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138798160103751244)
,p_name=>'APEX.IG.DELETE_REPORT_CONFIRM'
,p_message_language=>'fr'
,p_message_text=>unistr('Voulez-vous supprimer cet \00E9tat ?')
,p_is_js_message=>true
,p_version_scn=>2704787
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138755566063751231)
,p_name=>'APEX.IG.DELETE_ROW'
,p_message_language=>'fr'
,p_message_text=>'Supprimer une ligne'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138754342712751231)
,p_name=>'APEX.IG.DELETE_ROWS'
,p_message_language=>'fr'
,p_message_text=>'Supprimer des lignes'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138791578333751242)
,p_name=>'APEX.IG.DESCENDING'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9croissant')
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138753291528751230)
,p_name=>'APEX.IG.DETAIL'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9tail')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138718477536751220)
,p_name=>'APEX.IG.DETAIL_VIEW'
,p_message_language=>'fr'
,p_message_text=>unistr('Vue d\00E9tail')
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138780565697751238)
,p_name=>'APEX.IG.DIRECTION'
,p_message_language=>'fr'
,p_message_text=>'Direction'
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138752909902751230)
,p_name=>'APEX.IG.DISABLED'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9sactiv\00E9')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138747512461751229)
,p_name=>'APEX.IG.DOES_NOT_CONTAIN'
,p_message_language=>'fr'
,p_message_text=>'ne contient pas'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138747748475751229)
,p_name=>'APEX.IG.DOES_NOT_START_WITH'
,p_message_language=>'fr'
,p_message_text=>'ne commence pas par'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138789817632751241)
,p_name=>'APEX.IG.DONUT'
,p_message_language=>'fr'
,p_message_text=>'Graphique en anneau'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138753947949751230)
,p_name=>'APEX.IG.DOWNLOAD'
,p_message_language=>'fr'
,p_message_text=>unistr('T\00E9l\00E9charger en local')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138644266005751198)
,p_name=>'APEX.IG.DOWNLOAD_DATA_ONLY'
,p_message_language=>'fr'
,p_message_text=>unistr('Donn\00E9es uniquement')
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138799103405751244)
,p_name=>'APEX.IG.DOWNLOAD_FORMAT'
,p_message_language=>'fr'
,p_message_text=>'Choisir un format'
,p_is_js_message=>true
,p_version_scn=>2704788
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138659311492751202)
,p_name=>'APEX.IG.DOWNLOAD_FORMAT_NOT_ENABLED'
,p_message_language=>'fr'
,p_message_text=>unistr('Le format de t\00E9l\00E9chargement %0 n''est pas activ\00E9.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138792227172751242)
,p_name=>'APEX.IG.DUPLICATE_AGGREGATION'
,p_message_language=>'fr'
,p_message_text=>unistr('Dupliquer l''agr\00E9gation')
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138792368252751242)
,p_name=>'APEX.IG.DUPLICATE_CONTROLBREAK'
,p_message_language=>'fr'
,p_message_text=>'Dupliquer la commande BREAK'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138755494454751231)
,p_name=>'APEX.IG.DUPLICATE_ROW'
,p_message_language=>'fr'
,p_message_text=>'Ligne en double'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138754204360751231)
,p_name=>'APEX.IG.DUPLICATE_ROWS'
,p_message_language=>'fr'
,p_message_text=>'Lignes en double'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138719589022751220)
,p_name=>'APEX.IG.EDIT'
,p_message_language=>'fr'
,p_message_text=>'Modifier'
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138791327199751242)
,p_name=>'APEX.IG.EDIT_CHART'
,p_message_language=>'fr'
,p_message_text=>'Modifier un graphique'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138671813085751206)
,p_name=>'APEX.IG.EDIT_CONTROL'
,p_message_language=>'fr'
,p_message_text=>'Modifier %0'
,p_is_js_message=>true
,p_version_scn=>2704763
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138802702235751245)
,p_name=>'APEX.IG.EDIT_GROUP_BY'
,p_message_language=>'fr'
,p_message_text=>'Modifier le groupement'
,p_is_js_message=>true
,p_version_scn=>2704789
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138709958882751217)
,p_name=>'APEX.IG.EDIT_MODE'
,p_message_language=>'fr'
,p_message_text=>'%0 en mode de modification'
,p_is_js_message=>true
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138685561653751210)
,p_name=>'APEX.IG.EDIT_MODE_DESCRIPTION'
,p_message_language=>'fr'
,p_message_text=>unistr('Grille en mode de modification, cliquez dessus pour enlever la s\00E9lection et basculer vers le mode de visualisation')
,p_is_js_message=>true
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138798751292751244)
,p_name=>'APEX.IG.EMAIL_BCC'
,p_message_language=>'fr'
,p_message_text=>'Copie conforme invisible (Cci)'
,p_is_js_message=>true
,p_version_scn=>2704787
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138798937102751244)
,p_name=>'APEX.IG.EMAIL_BODY'
,p_message_language=>'fr'
,p_message_text=>'Message'
,p_is_js_message=>true
,p_version_scn=>2704787
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138798658390751244)
,p_name=>'APEX.IG.EMAIL_CC'
,p_message_language=>'fr'
,p_message_text=>'Copie (Cc)'
,p_is_js_message=>true
,p_version_scn=>2704787
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138798309534751244)
,p_name=>'APEX.IG.EMAIL_SENT'
,p_message_language=>'fr'
,p_message_text=>unistr('Courriel envoy\00E9.')
,p_is_js_message=>true
,p_version_scn=>2704787
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138798814214751244)
,p_name=>'APEX.IG.EMAIL_SUBJECT'
,p_message_language=>'fr'
,p_message_text=>'Objet'
,p_is_js_message=>true
,p_version_scn=>2704787
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138798570798751244)
,p_name=>'APEX.IG.EMAIL_TO'
,p_message_language=>'fr'
,p_message_text=>'Destinataire (A)'
,p_is_js_message=>true
,p_version_scn=>2704787
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138752668408751230)
,p_name=>'APEX.IG.ENABLED'
,p_message_language=>'fr'
,p_message_text=>unistr('Activ\00E9')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138745840009751228)
,p_name=>'APEX.IG.EQUALS'
,p_message_language=>'fr'
,p_message_text=>unistr('est \00E9gal \00E0')
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138752790988751230)
,p_name=>'APEX.IG.EXPRESSION'
,p_message_language=>'fr'
,p_message_text=>'Expression'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138797786130751243)
,p_name=>'APEX.IG.FD_TYPE'
,p_message_language=>'fr'
,p_message_text=>'Type'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138764911789751234)
,p_name=>'APEX.IG.FILE_PREPARED'
,p_message_language=>'fr'
,p_message_text=>unistr('Fichier pr\00E9par\00E9. D\00E9marrage du t\00E9l\00E9chargement.')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138727294180751222)
,p_name=>'APEX.IG.FILL'
,p_message_language=>'fr'
,p_message_text=>'Remplir'
,p_is_js_message=>true
,p_version_scn=>2704775
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138729446384751223)
,p_name=>'APEX.IG.FILL_LABEL'
,p_message_language=>'fr'
,p_message_text=>unistr('Remplir la s\00E9lection avec')
,p_is_js_message=>true
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138729304330751223)
,p_name=>'APEX.IG.FILL_TITLE'
,p_message_language=>'fr'
,p_message_text=>unistr('Remplir la s\00E9lection')
,p_is_js_message=>true
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138719049708751220)
,p_name=>'APEX.IG.FILTER'
,p_message_language=>'fr'
,p_message_text=>'Filtrer'
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138752025487751230)
,p_name=>'APEX.IG.FILTERS'
,p_message_language=>'fr'
,p_message_text=>'Filtres'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138805738951751246)
,p_name=>'APEX.IG.FILTER_WITH_DOTS'
,p_message_language=>'fr'
,p_message_text=>'Filtrer...'
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138791743533751242)
,p_name=>'APEX.IG.FIRST'
,p_message_language=>'fr'
,p_message_text=>'Premier'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138719294194751220)
,p_name=>'APEX.IG.FLASHBACK'
,p_message_language=>'fr'
,p_message_text=>'Flashback'
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138750530044751229)
,p_name=>'APEX.IG.FORMAT'
,p_message_language=>'fr'
,p_message_text=>'Format'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138796366533751243)
,p_name=>'APEX.IG.FORMATMASK'
,p_message_language=>'fr'
,p_message_text=>'Masque de format'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138798073177751244)
,p_name=>'APEX.IG.FORMAT_CSV'
,p_message_language=>'fr'
,p_message_text=>'CSV'
,p_is_js_message=>true
,p_version_scn=>2704787
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138797915439751244)
,p_name=>'APEX.IG.FORMAT_HTML'
,p_message_language=>'fr'
,p_message_text=>'HTML'
,p_is_js_message=>true
,p_version_scn=>2704787
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138709032100751217)
,p_name=>'APEX.IG.FORMAT_PDF'
,p_message_language=>'fr'
,p_message_text=>'PDF'
,p_is_js_message=>true
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138642990845751197)
,p_name=>'APEX.IG.FORMAT_XLSX'
,p_message_language=>'fr'
,p_message_text=>'Excel'
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138755142956751231)
,p_name=>'APEX.IG.FREEZE'
,p_message_language=>'fr'
,p_message_text=>'Figer'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138752871913751230)
,p_name=>'APEX.IG.FUNCTIONS_AND_OPERATORS'
,p_message_language=>'fr'
,p_message_text=>unistr('Fonctions et op\00E9rateurs')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138789967507751241)
,p_name=>'APEX.IG.FUNNEL'
,p_message_language=>'fr'
,p_message_text=>'Graphique en entonnoir'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138771674749751236)
,p_name=>'APEX.IG.GO'
,p_message_language=>'fr'
,p_message_text=>'OK'
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138746488103751228)
,p_name=>'APEX.IG.GREATER_THAN'
,p_message_language=>'fr'
,p_message_text=>unistr('est sup\00E9rieur \00E0')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138746514601751228)
,p_name=>'APEX.IG.GREATER_THAN_OR_EQUALS'
,p_message_language=>'fr'
,p_message_text=>unistr('est sup\00E9rieur ou \00E9gal \00E0')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138753106771751230)
,p_name=>'APEX.IG.GRID'
,p_message_language=>'fr'
,p_message_text=>'Grille'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138718284097751220)
,p_name=>'APEX.IG.GRID_VIEW'
,p_message_language=>'fr'
,p_message_text=>'Grille'
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138792554713751242)
,p_name=>'APEX.IG.GROUP'
,p_message_language=>'fr'
,p_message_text=>'Groupe'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138753384907751230)
,p_name=>'APEX.IG.GROUP_BY'
,p_message_language=>'fr'
,p_message_text=>'Regrouper par'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138718505774751220)
,p_name=>'APEX.IG.GROUP_BY_VIEW'
,p_message_language=>'fr'
,p_message_text=>'Vue Grouper par'
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138796990190751243)
,p_name=>'APEX.IG.HD_TYPE'
,p_message_language=>'fr'
,p_message_text=>'Type de condition'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138795818675751243)
,p_name=>'APEX.IG.HEADING'
,p_message_language=>'fr'
,p_message_text=>unistr('En-t\00EAte')
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138796065001751243)
,p_name=>'APEX.IG.HEADING_ALIGN'
,p_message_language=>'fr'
,p_message_text=>unistr('Alignement d''en-t\00EAte')
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138805686315751246)
,p_name=>'APEX.IG.HELP'
,p_message_language=>'fr'
,p_message_text=>'Aide'
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138801192143751245)
,p_name=>'APEX.IG.HELP.ACTIONS.EDITING'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Vous pouvez ins\00E9rer, mettre \00E0 jour et supprimer des donn\00E9es directement dans cette grille interactive.</p>'),
'',
unistr('<p>Ins\00E9rez une nouvelle ligne en cliquant sur le bouton Ajouter une ligne.</p>'),
'',
unistr('<p>Modifiez des donn\00E9es existantes en double-cliquant sur une cellule sp\00E9cifique. Pour effectuer des modifications plus importantes, cliquez sur Modifier pour entrer en mode \00E9dition. Dans ce mode, vous pouvez effectuer un seul clic ou utiliser le cla')
||unistr('vier pour modifier des cellules sp\00E9cifiques.</p>'),
'',
unistr('<p>Utilisez le menu Modifier pour dupliquer et supprimer des lignes. Pour activer le menu Modifier, utilisez les cases \00E0 cocher pour s\00E9lectionner des lignes.</p>'),
'',
unistr('<p>Dupliquez une ligne s\00E9lectionn\00E9e en cliquant sur le menu Modifier et en s\00E9lectionnant Lignes en double. Supprimez une ligne s\00E9lectionn\00E9e en cliquant sur le menu Modifier et en s\00E9lectionnant Supprimer une ligne.</p>')))
,p_version_scn=>2704789
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138803235664751245)
,p_name=>'APEX.IG.HELP.ACTIONS.EDITING_HEADING'
,p_message_language=>'fr'
,p_message_text=>unistr('Fonctionnalit\00E9s de modification')
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138803346923751245)
,p_name=>'APEX.IG.HELP.ACTIONS.INTRO'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Une grille interactive pr\00E9sente un ensemble de donn\00E9es dans un \00E9tat pouvant faire l''objet d''une recherche et d''une personnalisation. Vous pouvez effectuer de nombreuses op\00E9rations pour limiter les enregistrements renvoy\00E9s et modifier la fa\00E7on dont')
||unistr(' les donn\00E9es sont affich\00E9es.</p>'),
'',
unistr('<p>Utilisez le champ de recherche pour filtrer les enregistrements renvoy\00E9s. Cliquez sur Actions pour acc\00E9der aux nombreuses options de modification de la mise en page de l''\00E9tat, ou utilisez les menus d''en-t\00EAte de colonne sur les colonnes affich\00E9es.<')
||'/p>',
'',
unistr('<p>Utilisez les param\00E8tres d''\00E9tat pour enregistrer les personnalisations d''un \00E9tat. Vous pouvez \00E9galement t\00E9l\00E9charger les donn\00E9es de l''\00E9tat vers un fichier externe, ou les envoyer par courriel \00E0 vous-m\00EAme ou \00E0 d''autres utilisateurs.</p>'),
'',
unistr('<p>Pour en savoir plus, reportez-vous \00E0 Utilisation de grilles interactives dans le <em>guide de l''utilisateur final Oracle APEX</em>.')))
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138803071948751245)
,p_name=>'APEX.IG.HELP.ACTIONS.INTRO_HEADING'
,p_message_language=>'fr'
,p_message_text=>unistr('Aper\00E7u')
,p_version_scn=>2704789
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138801042753751245)
,p_name=>'APEX.IG.HELP.ACTIONS.REPORTING'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Vous pouvez personnaliser la grille interactive de sorte qu''elle affiche les donn\00E9es de diverses fa\00E7ons \00E0 l''aide de capacit\00E9s int\00E9gr\00E9es.</p>'),
'',
unistr('<p>Utilisez les menus d''en-t\00EAte de colonne ou le menu Actions pour d\00E9terminer les colonnes \00E0 afficher, dans quel ordre, et pour figer les colonnes. Vous pouvez \00E9galement d\00E9finir divers filtres de donn\00E9es et trier les donn\00E9es renvoy\00E9es.</p>'),
'',
unistr('<p>Utilisez le bouton Vue (adjacent au champ de recherche) pour acc\00E9der \00E0 d''autres vues de donn\00E9es qui peuvent avoir \00E9t\00E9 d\00E9finies par le d\00E9veloppeur d''application. Vous pouvez \00E9galement cr\00E9er un graphique ou visualiser un graphique existant.</p>  '),
'',
unistr('<p><em>Remarque : cliquez sur <strong>Aide</strong> dans les bo\00EEtes de dialogue de la grille interactive pour obtenir des informations plus d\00E9taill\00E9es sur la fonction s\00E9lectionn\00E9e.</em></p>')))
,p_version_scn=>2704789
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138803143423751245)
,p_name=>'APEX.IG.HELP.ACTIONS.REPORTING_HEADING'
,p_message_language=>'fr'
,p_message_text=>unistr('Fonctionnalit\00E9s de g\00E9n\00E9ration d''\00E9tat')
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138754192287751231)
,p_name=>'APEX.IG.HELP.ACTIONS_TITLE'
,p_message_language=>'fr'
,p_message_text=>'Aide de la grille interactive'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138799926579751244)
,p_name=>'APEX.IG.HELP.AGGREGATE'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Utilisez cette bo\00EEte de dialogue pour agr\00E9ger des colonnes. Les valeurs agr\00E9g\00E9es s''affichent en bas des donn\00E9es ou, si des commandes BREAK sont d\00E9finies, en bas de chaque commande.</p>'),
'',
unistr('<p><strong>Liste Agr\00E9gation</strong><br>'),
unistr('La liste Agr\00E9gation affiche les agr\00E9gations d\00E9finies. D\00E9sactivez une agr\00E9gation existante en la d\00E9s\00E9lectionnant.<br>'),
unistr('Cliquez sur Ajouter ( &plus; ) pour cr\00E9er une agr\00E9gation ou sur Supprimer ( &minus; ) pour enlever une agr\00E9gation existante.</p>'),
'',
unistr('<p><strong>Param\00E8tres d''agr\00E9gation</strong><br>'),
unistr('Utilisez le panneau \00E0 droite pour d\00E9finir l''agr\00E9gation.<br>'),
unistr('S\00E9lectionnez le nom de colonne et le type d''agr\00E9gation.<br>'),
unistr('Saisissez \00E9ventuellement une info-bulle pour l''agr\00E9gation.<br>'),
unistr('Si vous avez d\00E9fini une commande BREAK, la s\00E9lection de l''option <strong>Afficher la valeur globale</strong> affiche la moyenne globale, le total ou une valeur similaire en bas des donn\00E9es.</p>'),
'',
unistr('<p><em>Remarque : acc\00E9dez \00E0 la bo\00EEte de dialogue Agr\00E9gation dans le menu Actions ou en cliquant sur l''en-t\00EAte de colonne et la somme ( &sum; ).</em></p>')))
,p_version_scn=>2704788
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138802149695751245)
,p_name=>'APEX.IG.HELP.AGGREGATE_TITLE'
,p_message_language=>'fr'
,p_message_text=>unistr('Aide sur l''agr\00E9gation')
,p_is_js_message=>true
,p_version_scn=>2704789
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138800675890751244)
,p_name=>'APEX.IG.HELP.CHART'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Utilisez cette bo\00EEte de dialogue pour d\00E9finir un graphique qui s''affiche sous forme de vue de donn\00E9es distincte.<br>'),
unistr('S\00E9lectionnez un type et des attributs de graphique.</p>'),
'<p><strong>Attributs de graphique</strong><br>',
'Les attributs de graphique disponibles varient selon le type de graphique.</p>',
'<p>',
'<ul>',
unistr('  <li>S\00E9lectionnez la colonne contenant la valeur pour l''attribut :'),
'    <ul>',
unistr('      <li>Libell\00E9 : texte pour chaque point de donn\00E9es.</li>'),
unistr('      <li>Valeur : donn\00E9es \00E0 tracer.</li>'),
unistr('      <li>S\00E9rie : pour d\00E9finir votre requ\00EAte dynamique \00E0 plusieurs s\00E9ries.</li>'),
unistr('      <li>Ouverture : prix d''ouverture boursi\00E8re quotidien (graphique boursier uniquement).</li>'),
unistr('      <li>Cl\00F4ture : prix de cl\00F4ture boursi\00E8re quotidien (graphique boursier uniquement).</li>'),
unistr('      <li>Elev\00E9 : valeur \00E9lev\00E9e (graphiques \00E0 plages et boursiers uniquement).</li>'),
unistr('      <li>Faible : valeur basse (graphiques \00E0 plages et boursiers uniquement).</li>'),
'      <li>Volume : volume boursier quotidien (graphique boursier uniquement).</li>',
'      <li>Cible : valeur cible (graphique en entonnoir uniquement).</li>',
unistr('      <li>X : valeur de l''axe des X (graphiques \00E0 bulles et en nuage de points uniquement).</li>'),
unistr('      <li>Y : valeur de l''axe des Y (graphiques \00E0 bulles et en nuage de points uniquement).</li>'),
unistr('      <li>Z : largeur des barres ou rayon des bulles (graphiques \00E0 barres, \00E0 bulles et \00E0 plages uniquement).</li>'),
'    </ul>',
'  </li>',
'  <li>Orientation : verticale ou horizontale.</li>',
unistr('  <li>Agr\00E9gation : s\00E9lectionnez le mode d''agr\00E9gation des valeurs de graphique associ\00E9es.</li>'),
unistr('  <li>Pile : indiquez si les \00E9l\00E9ments de donn\00E9es sont empil\00E9s.</li>'),
unistr('  <li>Trier par : d\00E9terminez si le graphique est tri\00E9 par libell\00E9 ou valeur.'),
'    <ul>',
unistr('      <li>Direction : triez les valeurs par ordre croissant ou d\00E9croissant.</li>'),
unistr('      <li>Valeurs NULL : indiquez la fa\00E7on dont vous voulez que les enregistrements avec des valeurs NULL soient tri\00E9s par rapport aux enregistrements avec des valeurs non NULL.</li>'),
'    </ul>',
'  </li>',
unistr('  <li>D\00E9cimales</li>'),
unistr('  <li>Titre de l''axe de libell\00E9</li>'),
'  <li>Titre de l''axe de valeur</li>',
'</ul>',
'</p>'))
,p_version_scn=>2704789
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138802597562751245)
,p_name=>'APEX.IG.HELP.CHART_TITLE'
,p_message_language=>'fr'
,p_message_text=>'Aide sur le graphique'
,p_is_js_message=>true
,p_version_scn=>2704789
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138799642652751244)
,p_name=>'APEX.IG.HELP.COLUMNS'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Utilisez cette bo\00EEte de dialogue pour choisir les colonnes \00E0 afficher et leur ordre d''affichage.</p>'),
'',
unistr('<p>Masquez une colonne en la d\00E9s\00E9lectionnant.<br>'),
unistr('R\00E9organisez les colonnes en cliquant sur D\00E9placer vers le haut ( &uarr; ) ou D\00E9placer vers le bas ( &darr; ).<br>'),
unistr('Utilisez le s\00E9lecteur d\00E9roulant pour r\00E9pertorier toutes les colonnes, les colonnes affich\00E9es ou les colonnes non affich\00E9es.</p>'),
'',
unistr('<p>Utilisez \00E9ventuellement le panneau pour indiquer la largeur minimale d''une colonne en pixels.</p>'),
'',
unistr('<p><em>Remarque : vous pouvez \00E9galement r\00E9organiser les colonnes affich\00E9es en cliquant sur la poign\00E9e de glissement (au d\00E9but de l''en-t\00EAte de colonne) et en d\00E9pla\00E7ant la colonne \00E0 gauche ou \00E0 droite. Vous pouvez \00E9galement modifier la largeur des colo')
||unistr('nnes affich\00E9es en s\00E9lectionnant le s\00E9parateur de colonnes, entre les en-t\00EAtes, et en le d\00E9pla\00E7ant vers la gauche ou la droite.</em></p>')))
,p_version_scn=>2704788
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138802442089751245)
,p_name=>'APEX.IG.HELP.COLUMNS_TITLE'
,p_message_language=>'fr'
,p_message_text=>'Aide sur les colonnes'
,p_is_js_message=>true
,p_version_scn=>2704789
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138800016242751244)
,p_name=>'APEX.IG.HELP.COMPUTE'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Utilisez cette bo\00EEte de dialogue pour d\00E9finir des colonnes suppl\00E9mentaires en fonction des calculs math\00E9matiques et fonctionnels r\00E9alis\00E9s par rapport aux colonnes existantes.</p>'),
'',
'<p><strong>Liste Calcul</strong><br>',
unistr('La liste Calcul affiche les calculs d\00E9finis. D\00E9sactivez un calcul existant en le d\00E9s\00E9lectionnant.<br>'),
'Cliquez sur Ajouter ( &plus; ) pour ajouter un nouveau calcul ou sur Supprimer ( &minus; ) pour enlever un calcul existant.</p>',
'',
unistr('<p><strong>Param\00E8tres de calcul</strong><br>'),
unistr('Utilisez le panneau pour d\00E9finir le calcul.<br>'),
unistr('Entrez les d\00E9tails de colonne, tels qu''un en-t\00EAte ou un libell\00E9, et s\00E9lectionnez des param\00E8tres d''alignement.<br> '),
unistr('Utilisez la zone de texte Expression pour entrer les colonnes et les fonctions associ\00E9es pour le calcul.<br>'),
unistr('S\00E9lectionnez le type de donn\00E9es ad\00E9quat et \00E9ventuellement un masque de format pour la nouvelle colonne.</p>')))
,p_version_scn=>2704788
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138802069678751245)
,p_name=>'APEX.IG.HELP.COMPUTE_TITLE'
,p_message_language=>'fr'
,p_message_text=>'Aide sur le calcul'
,p_is_js_message=>true
,p_version_scn=>2704789
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138800306587751244)
,p_name=>'APEX.IG.HELP.CONTROL_BREAK'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Utilisez cette bo\00EEte de dialogue pour d\00E9finir une commande BREAK sur des colonnes.</p>'),
'',
'<p><strong>Liste Commande BREAK</strong><br>',
unistr('La liste Commande BREAK affiche les commandes BREAK d\00E9finies. D\00E9sactivez une colonne de commande BREAK existante en la d\00E9s\00E9lectionnant.<br>'),
'Cliquez sur Ajouter ( &plus; ) pour inclure une nouvelle colonne dans la commande BREAK ou sur Supprimer ( &minus; ) pour enlever une colonne existante de la commande BREAK.<br>',
unistr('Pour r\00E9organiser les colonnes, cliquez sur D\00E9placer vers le haut ( &uarr; ) ou D\00E9placer vers le bas ( &darr; ) pour d\00E9placer la colonne s\00E9lectionn\00E9e vers le haut et vers le bas par rapport aux autres colonnes.</p>'),
'',
unistr('<p><strong>Param\00E8tres de commande BREAK</strong><br>'),
unistr('Utilisez le panneau pour d\00E9finir la colonne de commande BREAK.<br>'),
unistr('S\00E9lectionnez une colonne de commande BREAK, le sens de tri et le mode d''organisation des colonnes NULL (colonnes sans valeur).</p>'),
'',
unistr('<p><em>Remarque : lorsque vous affichez la grille interactive, vous pouvez d\00E9finir une commande BREAK en cliquant sur un en-t\00EAte de colonne et en s\00E9lectionnant l''ic\00F4ne de commande BREAK.</em></p>')))
,p_version_scn=>2704789
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138801727927751245)
,p_name=>'APEX.IG.HELP.CONTROL_BREAK_TITLE'
,p_message_language=>'fr'
,p_message_text=>'Aide sur les commandes BREAK'
,p_is_js_message=>true
,p_version_scn=>2704789
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138800523715751244)
,p_name=>'APEX.IG.HELP.DOWNLOAD'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Utilisez cette bo\00EEte de dialogue pour t\00E9l\00E9charger toutes les lignes en cours vers un fichier externe. Le fichier comportera uniquement les colonnes actuellement affich\00E9es, utilisant tous les filtres et les tris appliqu\00E9s aux donn\00E9es.</p>'),
'',
unistr('<p>S\00E9lectionnez le format de fichier et cliquez sur T\00E9l\00E9charger.<br>'),
unistr('Remarque : le format CSV n''inclura pas le formatage de texte tel que les agr\00E9gats et les commandes BREAK.</p>'),
'',
unistr('<p>Pour envoyer le fichier par courriel, s\00E9lectionnez Envoyer en tant que courriel et entrez les d\00E9tails de courriel (Destinataire, Objet et Message).</p>')))
,p_version_scn=>2704789
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138801522804751245)
,p_name=>'APEX.IG.HELP.DOWNLOAD_TITLE'
,p_message_language=>'fr'
,p_message_text=>unistr('Aide sur le t\00E9l\00E9chargement')
,p_is_js_message=>true
,p_version_scn=>2704789
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138799745857751244)
,p_name=>'APEX.IG.HELP.FILTER'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Utilisez cette bo\00EEte de dialogue pour configurer des filtres de donn\00E9es qui limitent le nombre de lignes renvoy\00E9es.</p>'),
'',
'<p><strong>Liste Filtre</strong><br>',
unistr('La liste Filtre affiche les filtres d\00E9finis. Pour d\00E9sactiver un filtre existant, d\00E9s\00E9lectionnez-le.<br>'),
unistr('Cliquez sur Ajouter (&plus;) pour cr\00E9er un filtre ou sur Supprimer (&minus;) pour enlever un filtre existant.</p>'),
'',
unistr('<p><strong>Param\00E8tres de filtre</strong><br>'),
unistr('Utilisez le panneau pour d\00E9finir les propri\00E9t\00E9s de filtre.<br>'),
unistr('S\00E9lectionnez le type de filtre ad\00E9quat :<br>'),
'&nbsp;&nbsp;&nbsp;Ligne : filtrer sur un terme dans toute colonne filtrable.<br>',
unistr('&nbsp;&nbsp;&nbsp;Colonne : filtrer sur une colonne sp\00E9cifique avec un op\00E9rateur et une valeur indiqu\00E9s.</p>'),
'',
unistr('<p><em>Remarque : lorsque vous affichez une grille interactive, vous pouvez d\00E9finir des filtres de ligne en les saisissant directement dans le champ de recherche. Cliquez sur S\00E9lectionner les colonnes \00E0 rechercher pour limiter la recherche \00E0 une cert')
||unistr('aine colonne. Vous pouvez \00E9galement ouvrir un menu En-t\00EAte de colonne et s\00E9lectionner une valeur pour cr\00E9er un filtre de colonne.</em></p>')))
,p_version_scn=>2704788
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138802376718751245)
,p_name=>'APEX.IG.HELP.FILTER_TITLE'
,p_message_language=>'fr'
,p_message_text=>'Aide sur le filtre'
,p_is_js_message=>true
,p_version_scn=>2704789
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138800128769751244)
,p_name=>'APEX.IG.HELP.FLASHBACK'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Utilisez cette bo\00EEte de dialogue pour visualiser les donn\00E9es telles qu''elles existaient \00E0 un moment donn\00E9.</p>'),
unistr('<p>Entrez le nombre de minutes pass\00E9es pour ex\00E9cuter la requ\00EAte Flashback.</p>')))
,p_version_scn=>2704789
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138801974561751245)
,p_name=>'APEX.IG.HELP.FLASHBACK_TITLE'
,p_message_language=>'fr'
,p_message_text=>'Aide sur Flashback'
,p_is_js_message=>true
,p_version_scn=>2704789
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138802655657751245)
,p_name=>'APEX.IG.HELP.GROUP_BY_TITLE'
,p_message_language=>'fr'
,p_message_text=>'Aide sur le regroupement'
,p_is_js_message=>true
,p_version_scn=>2704789
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138800255914751244)
,p_name=>'APEX.IG.HELP.HIGHLIGHT'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Utilisez cette bo\00EEte de dialogue pour mettre en \00E9vidence des lignes ou des colonnes de donn\00E9es en fonction de la condition entr\00E9e.</p>'),
'',
unistr('<p><strong>Liste Mise en \00E9vidence</strong><br>'),
unistr('La liste Mise en \00E9vidence affiche les mises en \00E9vidence d\00E9finies. Pour d\00E9sactiver une mise en \00E9vidence existante, d\00E9s\00E9lectionnez-la.<br>'),
unistr('Cliquez sur Ajouter (&plus;) pour cr\00E9er une mise en \00E9vidence ou sur Supprimer (&minus;) pour enlever une mise en \00E9vidence existante.</p>'),
'',
unistr('<p><strong>Param\00E8tres de mise en \00E9vidence</strong><br>'),
unistr('Utilisez le panneau pour d\00E9finir les propri\00E9t\00E9s de mise en \00E9vidence.<br>'),
unistr('Entrez le nom, s\00E9lectionnez Ligne ou Colonne, puis s\00E9lectionnez les codes couleur HTML pour le texte et l''arri\00E8re-plan.<br>'),
unistr('S\00E9lectionnez le <strong>type de condition</strong> ad\00E9quat pour mettre en \00E9vidence des donn\00E9es sp\00E9cifiques :<br>'),
unistr('&nbsp;&nbsp;&nbsp;Ligne : mise en \00E9vidence du terme dans toute colonne.<br>'),
unistr('&nbsp;&nbsp;&nbsp;Colonne : mise en \00E9vidence dans une colonne sp\00E9cifique selon l''op\00E9rateur et la valeur sp\00E9cifi\00E9s.</p>')))
,p_version_scn=>2704789
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138801812389751245)
,p_name=>'APEX.IG.HELP.HIGHLIGHT_TITLE'
,p_message_language=>'fr'
,p_message_text=>unistr('Aide sur la mise en \00E9vidence')
,p_is_js_message=>true
,p_version_scn=>2704789
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138800475212751244)
,p_name=>'APEX.IG.HELP.REPORT'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Utilisez cette bo\00EEte de dialogue pour enregistrer les modifications que vous avez apport\00E9es \00E0 la configuration et \00E0 la mise en page de la grille en cours.<br>'),
unistr('Les d\00E9veloppeurs d''application peuvent d\00E9finir plusieurs mises en page d''\00E9tat de remplacement. Lorsque cela est autoris\00E9, vous et d''autres utilisateurs finals pouvez enregistrer un \00E9tat comme Public, le mettant ainsi \00E0 la disposition de tous les autr')
||unistr('es utilisateurs de la grille. Vous pouvez \00E9galement enregistrer un \00E9tat comme Priv\00E9 ; vous seul pouvez alors le consulter.</p>'),
unistr('<p>Effectuez une s\00E9lection parmi les types disponibles et entrez le nom de l''\00E9tat enregistr\00E9.</p>')))
,p_version_scn=>2704789
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138801637910751245)
,p_name=>'APEX.IG.HELP.REPORT_TITLE'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Aide sur l''\00E9tat'),
''))
,p_is_js_message=>true
,p_version_scn=>2704789
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138799827215751244)
,p_name=>'APEX.IG.HELP.SORT'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Utilisez cette bo\00EEte de dialogue pour d\00E9finir l''ordre d''affichage.</p>'),
'',
'<p><strong>Liste Trier</strong><br>',
unistr('La bo\00EEte de dialogue Trier affiche la liste des r\00E8gles de tri configur\00E9es.<br>'),
unistr('Cliquez sur Ajouter ( &plus; ) pour cr\00E9er une colonne de tri ou sur Supprimer ( &minus; ) pour enlever une colonne de tri.<br>'),
unistr('Cliquez sur D\00E9placer vers le haut ( &uarr; ) et D\00E9placer vers le bas ( &darr; ) pour d\00E9placer la colonne de tri s\00E9lectionn\00E9e vers le haut et vers le bas par rapport aux autres colonnes de tri.</p>'),
'',
unistr('<p><strong>Param\00E8tres de tri</strong><br>'),
unistr('S\00E9lectionnez une colonne de tri, le sens du tri et le mode d''organisation des colonnes NULL (colonnes sans valeur).</p>'),
'',
unistr('<p><em>Remarque : les donn\00E9es peuvent \00EAtre tri\00E9es par des colonnes qui ne sont pas affich\00E9es. Cependant, les colonnes ne sont peut-\00EAtre pas toutes triables.</em><br>'),
unistr('<em>Les colonnes affich\00E9es peuvent \00EAtre tri\00E9es en appuyant sur les fl\00E8ches vers le haut (par ordre croissant) ou vers le bas (par ordre d\00E9croissant) \00E0 la fin des en-t\00EAtes de colonne. Pour ajouter une autre colonne \00E0 un tri existant, maintenez la touc')
||unistr('he Maj enfonc\00E9e et cliquez sur la fl\00E8che vers le haut ou vers le bas.</em></p>')))
,p_version_scn=>2704788
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138802275372751245)
,p_name=>'APEX.IG.HELP.SORT_TITLE'
,p_message_language=>'fr'
,p_message_text=>'Aide sur le tri'
,p_is_js_message=>true
,p_version_scn=>2704789
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138801493295751245)
,p_name=>'APEX.IG.HELP.SUBSCRIPTION_TITLE'
,p_message_language=>'fr'
,p_message_text=>'Aide sur l''abonnement'
,p_is_js_message=>true
,p_version_scn=>2704789
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138755030166751231)
,p_name=>'APEX.IG.HIDE'
,p_message_language=>'fr'
,p_message_text=>'Masquer'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138719479801751220)
,p_name=>'APEX.IG.HIGHLIGHT'
,p_message_language=>'fr'
,p_message_text=>unistr('Mettre en \00E9vidence')
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138788682973751241)
,p_name=>'APEX.IG.HIGH_COLUMN'
,p_message_language=>'fr'
,p_message_text=>unistr('Elev\00E9')
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138789484702751241)
,p_name=>'APEX.IG.HORIZONTAL'
,p_message_language=>'fr'
,p_message_text=>'Horizontal'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138748013640751229)
,p_name=>'APEX.IG.HOURS'
,p_message_language=>'fr'
,p_message_text=>'heures'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138753029250751230)
,p_name=>'APEX.IG.ICON'
,p_message_language=>'fr'
,p_message_text=>unistr('Ic\00F4ne')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138718328281751220)
,p_name=>'APEX.IG.ICON_VIEW'
,p_message_language=>'fr'
,p_message_text=>unistr('Vue ic\00F4ne')
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138746267535751228)
,p_name=>'APEX.IG.IN'
,p_message_language=>'fr'
,p_message_text=>'est dans'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138754650407751231)
,p_name=>'APEX.IG.INACTIVE_SETTING'
,p_message_language=>'fr'
,p_message_text=>unistr('Param\00E8tre inactif')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138754785711751231)
,p_name=>'APEX.IG.INACTIVE_SETTINGS'
,p_message_language=>'fr'
,p_message_text=>unistr('Param\00E8tres inactifs')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138762310592751233)
,p_name=>'APEX.IG.INTERNAL_ERROR'
,p_message_language=>'fr'
,p_message_text=>'Une erreur interne est survenue lors du traitement de la demande de grille interactive.'
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138650250018751199)
,p_name=>'APEX.IG.INVALID_COLUMN_FILTER_TYPE'
,p_message_language=>'fr'
,p_message_text=>'Le type de filtre de colonne "%0" n''est pas pris en charge pour la colonne "%1".'
,p_version_scn=>2704761
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138801279709751245)
,p_name=>'APEX.IG.INVALID_DATE_FORMAT'
,p_message_language=>'fr'
,p_message_text=>'Format de date non valide'
,p_is_js_message=>true
,p_version_scn=>2704789
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138776070205751237)
,p_name=>'APEX.IG.INVALID_FILTER_COLUMN'
,p_message_language=>'fr'
,p_message_text=>unistr('La grille interactive ne prend pas en charge la d\00E9finition d''un filtre sur la colonne %0.')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138775937144751237)
,p_name=>'APEX.IG.INVALID_FILTER_OPERATOR'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 n''est pas un type de filtre valide pour d\00E9finir un filtre Grille interactive.')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138656874235751201)
,p_name=>'APEX.IG.INVALID_NUMBER_FORMAT'
,p_message_language=>'fr'
,p_message_text=>unistr('Format num\00E9rique non valide')
,p_is_js_message=>true
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138803987369751245)
,p_name=>'APEX.IG.INVALID_SETTING'
,p_message_language=>'fr'
,p_message_text=>unistr('Param\00E8tre non valide')
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138804019758751245)
,p_name=>'APEX.IG.INVALID_SETTINGS'
,p_message_language=>'fr'
,p_message_text=>unistr('Param\00E8tres non valides')
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138795139707751243)
,p_name=>'APEX.IG.INVALID_SORT_BY'
,p_message_language=>'fr'
,p_message_text=>unistr('Trier par a \00E9t\00E9 d\00E9fini sur %0, mais aucune colonne n''a \00E9t\00E9 s\00E9lectionn\00E9e pour %0.')
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138792439088751242)
,p_name=>'APEX.IG.INVALID_VALUE'
,p_message_language=>'fr'
,p_message_text=>'Valeur non valide'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138787575776751240)
,p_name=>'APEX.IG.INVISIBLE'
,p_message_language=>'fr'
,p_message_text=>unistr('Non affich\00E9')
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138747037036751228)
,p_name=>'APEX.IG.IN_THE_LAST'
,p_message_language=>'fr'
,p_message_text=>'au cours des'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138747234767751228)
,p_name=>'APEX.IG.IN_THE_NEXT'
,p_message_language=>'fr'
,p_message_text=>'dans'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138746185903751228)
,p_name=>'APEX.IG.IS_NOT_NULL'
,p_message_language=>'fr'
,p_message_text=>'n''est pas vide'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138746042284751228)
,p_name=>'APEX.IG.IS_NULL'
,p_message_language=>'fr'
,p_message_text=>'est vide'
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138795964766751243)
,p_name=>'APEX.IG.LABEL'
,p_message_language=>'fr'
,p_message_text=>unistr('Libell\00E9')
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138787937130751241)
,p_name=>'APEX.IG.LABEL_COLUMN'
,p_message_language=>'fr'
,p_message_text=>unistr('Libell\00E9')
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138791820479751242)
,p_name=>'APEX.IG.LAST'
,p_message_language=>'fr'
,p_message_text=>'Dernier'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138736350937751225)
,p_name=>'APEX.IG.LAST.DAY'
,p_message_language=>'fr'
,p_message_text=>'Dernier jour'
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138736533653751225)
,p_name=>'APEX.IG.LAST.HOUR'
,p_message_language=>'fr'
,p_message_text=>unistr('Derni\00E8re heure')
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138737023381751225)
,p_name=>'APEX.IG.LAST.MINUTE'
,p_message_language=>'fr'
,p_message_text=>unistr('Derni\00E8re minute')
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138736013640751225)
,p_name=>'APEX.IG.LAST.MONTH'
,p_message_language=>'fr'
,p_message_text=>'Dernier mois'
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138736168892751225)
,p_name=>'APEX.IG.LAST.WEEK'
,p_message_language=>'fr'
,p_message_text=>unistr('Derni\00E8re semaine')
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138736254681751225)
,p_name=>'APEX.IG.LAST.X_DAYS'
,p_message_language=>'fr'
,p_message_text=>'Les %0 derniers jours'
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138736425905751225)
,p_name=>'APEX.IG.LAST.X_HOURS'
,p_message_language=>'fr'
,p_message_text=>unistr('Les %0 derni\00E8res heures')
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138737115522751225)
,p_name=>'APEX.IG.LAST.X_MINUTES'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 derni\00E8res minutes')
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138736999676751225)
,p_name=>'APEX.IG.LAST.X_MONTHS'
,p_message_language=>'fr'
,p_message_text=>'%0 derniers mois'
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138736853830751225)
,p_name=>'APEX.IG.LAST.X_WEEKS'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 derni\00E8res semaines')
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138735809381751225)
,p_name=>'APEX.IG.LAST.X_YEARS'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 derni\00E8res ann\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138735954784751225)
,p_name=>'APEX.IG.LAST.YEAR'
,p_message_language=>'fr'
,p_message_text=>unistr('Derni\00E8re ann\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138796174692751243)
,p_name=>'APEX.IG.LAYOUT_ALIGN'
,p_message_language=>'fr'
,p_message_text=>'Alignement des cellules'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138796226230751243)
,p_name=>'APEX.IG.LAYOUT_USEGROUPFOR'
,p_message_language=>'fr'
,p_message_text=>'Utiliser le groupe pour'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138746623797751228)
,p_name=>'APEX.IG.LESS_THAN'
,p_message_language=>'fr'
,p_message_text=>unistr('est inf\00E9rieur \00E0')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138746779256751228)
,p_name=>'APEX.IG.LESS_THAN_OR_EQUALS'
,p_message_language=>'fr'
,p_message_text=>unistr('est inf\00E9rieur ou \00E9gal \00E0')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138790031404751241)
,p_name=>'APEX.IG.LINE'
,p_message_language=>'fr'
,p_message_text=>unistr('Graphique \00E0 courbes')
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138790195555751241)
,p_name=>'APEX.IG.LINE_WITH_AREA'
,p_message_language=>'fr'
,p_message_text=>'A courbes avec aires'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138796558448751243)
,p_name=>'APEX.IG.LISTAGG'
,p_message_language=>'fr'
,p_message_text=>'Listagg'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138788749745751241)
,p_name=>'APEX.IG.LOW_COLUMN'
,p_message_language=>'fr'
,p_message_text=>'Faible'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138799050245751244)
,p_name=>'APEX.IG.MAILADDRESSES_COMMASEP'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9parez les adresses par des virgules')
,p_is_js_message=>true
,p_version_scn=>2704787
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138747820129751229)
,p_name=>'APEX.IG.MATCHES_REGULAR_EXPRESSION'
,p_message_language=>'fr'
,p_message_text=>unistr('recherche une expression r\00E9guli\00E8re')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138772282488751236)
,p_name=>'APEX.IG.MAX'
,p_message_language=>'fr'
,p_message_text=>'Valeur maximale'
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138806528291751246)
,p_name=>'APEX.IG.MAX_OVERALL'
,p_message_language=>'fr'
,p_message_text=>'Maximum global'
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138772493775751236)
,p_name=>'APEX.IG.MEDIAN'
,p_message_language=>'fr'
,p_message_text=>unistr('M\00E9diane')
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138806618453751246)
,p_name=>'APEX.IG.MEDIAN_OVERALL'
,p_message_language=>'fr'
,p_message_text=>unistr('M\00E9diane globale')
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138772168031751236)
,p_name=>'APEX.IG.MIN'
,p_message_language=>'fr'
,p_message_text=>'Valeur minimale'
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138747984440751229)
,p_name=>'APEX.IG.MINUTES'
,p_message_language=>'fr'
,p_message_text=>'minutes'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138772998512751236)
,p_name=>'APEX.IG.MINUTES_AGO'
,p_message_language=>'fr'
,p_message_text=>'Minutes auparavant'
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138806475825751246)
,p_name=>'APEX.IG.MIN_OVERALL'
,p_message_language=>'fr'
,p_message_text=>'Minimum global'
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138748329721751229)
,p_name=>'APEX.IG.MONTHS'
,p_message_language=>'fr'
,p_message_text=>'mois'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138754924882751231)
,p_name=>'APEX.IG.MORE_DATA_FOUND'
,p_message_language=>'fr'
,p_message_text=>unistr('Les donn\00E9es contiennent plus de %0 lignes, ce qui d\00E9passe le nombre maximal autoris\00E9. Appliquez des filtres suppl\00E9mentaires pour visualiser les r\00E9sultats.')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138780760111751238)
,p_name=>'APEX.IG.MULTIIG_PAGE_REGION_STATIC_ID_REQUIRED'
,p_message_language=>'fr'
,p_message_text=>unistr('L''ID statique de r\00E9gion doit \00EAtre indiqu\00E9, car la page contient plusieurs grilles interactives.')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138751093745751230)
,p_name=>'APEX.IG.NAME'
,p_message_language=>'fr'
,p_message_text=>'Nom'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138751223059751230)
,p_name=>'APEX.IG.NAMED_REPORT'
,p_message_language=>'fr'
,p_message_text=>unistr('Etat nomm\00E9')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138735279657751225)
,p_name=>'APEX.IG.NEXT.DAY'
,p_message_language=>'fr'
,p_message_text=>'Jour suivant'
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138735064110751225)
,p_name=>'APEX.IG.NEXT.HOUR'
,p_message_language=>'fr'
,p_message_text=>'Heure suivante'
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138737282876751225)
,p_name=>'APEX.IG.NEXT.MINUTE'
,p_message_language=>'fr'
,p_message_text=>'Prochaine minute'
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138735525644751225)
,p_name=>'APEX.IG.NEXT.MONTH'
,p_message_language=>'fr'
,p_message_text=>'Mois suivant'
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138735472999751225)
,p_name=>'APEX.IG.NEXT.WEEK'
,p_message_language=>'fr'
,p_message_text=>'Semaine suivante'
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138735360665751225)
,p_name=>'APEX.IG.NEXT.X_DAYS'
,p_message_language=>'fr'
,p_message_text=>'%0 prochains jours'
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138735130402751225)
,p_name=>'APEX.IG.NEXT.X_HOURS'
,p_message_language=>'fr'
,p_message_text=>'%0 prochaines heures'
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138737361834751225)
,p_name=>'APEX.IG.NEXT.X_MINUTES'
,p_message_language=>'fr'
,p_message_text=>'%0 prochaines minutes'
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138736615343751225)
,p_name=>'APEX.IG.NEXT.X_MONTHS'
,p_message_language=>'fr'
,p_message_text=>'%0 prochains mois'
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138736760193751225)
,p_name=>'APEX.IG.NEXT.X_WEEKS'
,p_message_language=>'fr'
,p_message_text=>'%0 prochaines semaines'
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138735746215751225)
,p_name=>'APEX.IG.NEXT.X_YEARS'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 prochaines ann\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138735668358751225)
,p_name=>'APEX.IG.NEXT.YEAR'
,p_message_language=>'fr'
,p_message_text=>unistr('Ann\00E9e suivante')
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138746991169751228)
,p_name=>'APEX.IG.NOT_BETWEEN'
,p_message_language=>'fr'
,p_message_text=>'non compris entre'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138745956901751228)
,p_name=>'APEX.IG.NOT_EQUALS'
,p_message_language=>'fr'
,p_message_text=>unistr('est diff\00E9rent de')
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138810771194751247)
,p_name=>'APEX.IG.NOT_EXIST'
,p_message_language=>'fr'
,p_message_text=>unistr('La r\00E9gion portant l''ID %0 n''est pas une r\00E9gion de grille interactive ou n''existe pas dans l''application %1.')
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138746337805751228)
,p_name=>'APEX.IG.NOT_IN'
,p_message_language=>'fr'
,p_message_text=>'n''est pas dans'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138747185769751228)
,p_name=>'APEX.IG.NOT_IN_THE_LAST'
,p_message_language=>'fr'
,p_message_text=>'pas au cours des'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138747340881751228)
,p_name=>'APEX.IG.NOT_IN_THE_NEXT'
,p_message_language=>'fr'
,p_message_text=>'pas dans'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138754874660751231)
,p_name=>'APEX.IG.NO_DATA_FOUND'
,p_message_language=>'fr'
,p_message_text=>unistr('Aucune donn\00E9e n''a \00E9t\00E9 trouv\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138791626521751242)
,p_name=>'APEX.IG.NULLS'
,p_message_language=>'fr'
,p_message_text=>'Valeurs NULL'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138796734935751243)
,p_name=>'APEX.IG.NUMBER'
,p_message_language=>'fr'
,p_message_text=>unistr('Num\00E9rique')
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138791992396751242)
,p_name=>'APEX.IG.OFF'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9sactiv\00E9')
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138792095503751242)
,p_name=>'APEX.IG.ON'
,p_message_language=>'fr'
,p_message_text=>unistr('Activ\00E9')
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138745161692751228)
,p_name=>'APEX.IG.ONE_MINUTE_AGO'
,p_message_language=>'fr'
,p_message_text=>'Il y a 1 minute'
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138799588316751244)
,p_name=>'APEX.IG.OPEN_COLORPICKER'
,p_message_language=>'fr'
,p_message_text=>unistr('Ouvrir le s\00E9lecteur de couleur : %0')
,p_is_js_message=>true
,p_version_scn=>2704788
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138788438873751241)
,p_name=>'APEX.IG.OPEN_COLUMN'
,p_message_language=>'fr'
,p_message_text=>'Ouvrir'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138752162061751230)
,p_name=>'APEX.IG.OPERATOR'
,p_message_language=>'fr'
,p_message_text=>unistr('Op\00E9rateur')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138787897337751241)
,p_name=>'APEX.IG.ORIENTATION'
,p_message_language=>'fr'
,p_message_text=>'Orientation'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138790247615751241)
,p_name=>'APEX.IG.PIE'
,p_message_language=>'fr'
,p_message_text=>unistr('Graphique \00E0 secteurs')
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138753455303751230)
,p_name=>'APEX.IG.PIVOT'
,p_message_language=>'fr'
,p_message_text=>'Pivot'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138718689294751220)
,p_name=>'APEX.IG.PIVOT_VIEW'
,p_message_language=>'fr'
,p_message_text=>'Vue de pivot'
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138799475080751244)
,p_name=>'APEX.IG.PLACEHOLDER_INVALUES'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9parer les valeurs par "%0"')
,p_is_js_message=>true
,p_version_scn=>2704788
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138790310599751241)
,p_name=>'APEX.IG.POLAR'
,p_message_language=>'fr'
,p_message_text=>'Graphique polaire'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138795617069751243)
,p_name=>'APEX.IG.POSITION_CENTER'
,p_message_language=>'fr'
,p_message_text=>'Au centre'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138795758065751243)
,p_name=>'APEX.IG.POSITION_END'
,p_message_language=>'fr'
,p_message_text=>'Fin'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138795558416751243)
,p_name=>'APEX.IG.POSITION_START'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9marrer')
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138751344388751230)
,p_name=>'APEX.IG.PRIMARY'
,p_message_language=>'fr'
,p_message_text=>'Principal'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138751685371751230)
,p_name=>'APEX.IG.PRIMARY_DEFAULT'
,p_message_language=>'fr'
,p_message_text=>unistr('Val. par d\00E9faut du principal')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138768113294751235)
,p_name=>'APEX.IG.PRIMARY_REPORT'
,p_message_language=>'fr'
,p_message_text=>'Etat principal'
,p_is_js_message=>true
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138641760702751197)
,p_name=>'APEX.IG.PRINT_ACCESSIBLE.PROMPT'
,p_message_language=>'fr'
,p_message_text=>unistr('Inclure des balises d''accessibilit\00E9')
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138639175677751196)
,p_name=>'APEX.IG.PRINT_ORIENTATION.LOV.HORIZONTAL.D'
,p_message_language=>'fr'
,p_message_text=>'Paysage'
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138639297325751196)
,p_name=>'APEX.IG.PRINT_ORIENTATION.LOV.VERTICAL.D'
,p_message_language=>'fr'
,p_message_text=>'Portrait'
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138639057623751196)
,p_name=>'APEX.IG.PRINT_ORIENTATION.PROMPT'
,p_message_language=>'fr'
,p_message_text=>'Orientation de page'
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138638997902751196)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.A3.D'
,p_message_language=>'fr'
,p_message_text=>'A3'
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138638845731751196)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.A4.D'
,p_message_language=>'fr'
,p_message_text=>'A4'
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138641953415751197)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.CUSTOM.D'
,p_message_language=>'fr'
,p_message_text=>unistr('Personnalis\00E9')
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138638605504751196)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.LEGAL.D'
,p_message_language=>'fr'
,p_message_text=>'Legal'
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138638524798751196)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.LETTER.D'
,p_message_language=>'fr'
,p_message_text=>'Lettre'
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138638780716751196)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.TABLOID.D'
,p_message_language=>'fr'
,p_message_text=>unistr('Tablo\00EFd')
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138638445961751196)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.PROMPT'
,p_message_language=>'fr'
,p_message_text=>'Taille de page'
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138604007354751186)
,p_name=>'APEX.IG.PRINT_STRIP_RICH_TEXT.PROMPT'
,p_message_language=>'fr'
,p_message_text=>'Enlever le texte enrichi'
,p_is_js_message=>true
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138790417621751241)
,p_name=>'APEX.IG.RADAR'
,p_message_language=>'fr'
,p_message_text=>'Graphique en radar'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138790555210751241)
,p_name=>'APEX.IG.RANGE'
,p_message_language=>'fr'
,p_message_text=>unistr('Graphique \00E0 plages')
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138800703866751244)
,p_name=>'APEX.IG.REFRESH'
,p_message_language=>'fr'
,p_message_text=>unistr('R\00E9g\00E9n\00E9rer')
,p_is_js_message=>true
,p_version_scn=>2704789
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138755611817751231)
,p_name=>'APEX.IG.REFRESH_ROW'
,p_message_language=>'fr'
,p_message_text=>unistr('R\00E9g\00E9n\00E9rer la ligne')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138754448354751231)
,p_name=>'APEX.IG.REFRESH_ROWS'
,p_message_language=>'fr'
,p_message_text=>unistr('R\00E9g\00E9n\00E9rer les lignes')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138759638546751232)
,p_name=>'APEX.IG.REGION_NOT_EXIST'
,p_message_language=>'fr'
,p_message_text=>unistr('La r\00E9gion de grille interactive n''existe pas dans l''application %0, la page %1 et la r\00E9gion %2.')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138720157703751220)
,p_name=>'APEX.IG.REMOVE_CONTROL'
,p_message_language=>'fr'
,p_message_text=>'Enlever %0'
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138750714202751230)
,p_name=>'APEX.IG.REPORT'
,p_message_language=>'fr'
,p_message_text=>'Etat'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138809923120751247)
,p_name=>'APEX.IG.REPORT.DELETED'
,p_message_language=>'fr'
,p_message_text=>unistr('Etat supprim\00E9')
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138809641432751247)
,p_name=>'APEX.IG.REPORT.SAVED.ALTERNATIVE'
,p_message_language=>'fr'
,p_message_text=>unistr('Etat de remplacement enregistr\00E9 pour tous les utilisateurs')
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138809586795751247)
,p_name=>'APEX.IG.REPORT.SAVED.DEFAULT'
,p_message_language=>'fr'
,p_message_text=>unistr('Etat par d\00E9faut enregistr\00E9 pour tous les utilisateurs')
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138809833219751247)
,p_name=>'APEX.IG.REPORT.SAVED.PRIVATE'
,p_message_language=>'fr'
,p_message_text=>unistr('Etat priv\00E9 enregistr\00E9')
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138809771979751247)
,p_name=>'APEX.IG.REPORT.SAVED.PUBLIC'
,p_message_language=>'fr'
,p_message_text=>unistr('Etat public enregistr\00E9 pour tous les utilisateurs')
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138759741624751232)
,p_name=>'APEX.IG.REPORT_ALIAS_DOES_NOT_EXIST'
,p_message_language=>'fr'
,p_message_text=>unistr('La grille interactive enregistr\00E9e avec le nom %0 n''existe pas.')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138745020099751228)
,p_name=>'APEX.IG.REPORT_DATA_AS_OF.X.MINUTES_AGO'
,p_message_language=>'fr'
,p_message_text=>unistr('Donn\00E9es de grille datant d''il y a %0 minutes')
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138744971305751228)
,p_name=>'APEX.IG.REPORT_DATA_AS_OF_ONE_MINUTE_AGO'
,p_message_language=>'fr'
,p_message_text=>unistr('Donn\00E9es de grille datant d''il y a 1 minute')
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138680422914751208)
,p_name=>'APEX.IG.REPORT_DOES_NOT_EXIST'
,p_message_language=>'fr'
,p_message_text=>unistr('L''\00E9tat de grille interactive n''existe pas.')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138802912937751245)
,p_name=>'APEX.IG.REPORT_EDIT'
,p_message_language=>'fr'
,p_message_text=>'Etat - Modifier'
,p_is_js_message=>true
,p_version_scn=>2704789
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138759565161751232)
,p_name=>'APEX.IG.REPORT_ID_DOES_NOT_EXIST'
,p_message_language=>'fr'
,p_message_text=>unistr('La grille interactive enregistr\00E9e avec l''ID %0 n''existe pas.')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138802892320751245)
,p_name=>'APEX.IG.REPORT_SAVE_AS'
,p_message_language=>'fr'
,p_message_text=>'Etat - Enregistrer sous'
,p_is_js_message=>true
,p_version_scn=>2704789
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138720212348751220)
,p_name=>'APEX.IG.REPORT_SETTINGS'
,p_message_language=>'fr'
,p_message_text=>unistr('Param\00E8tres de grille')
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138810883630751247)
,p_name=>'APEX.IG.REPORT_STATIC_ID_DOES_NOT_EXIST'
,p_message_language=>'fr'
,p_message_text=>unistr('La grille interactive enregistr\00E9e avec l''ID statique %0 n''existe pas.')
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138805825254751246)
,p_name=>'APEX.IG.REPORT_VIEW'
,p_message_language=>'fr'
,p_message_text=>unistr('Vue d''\00E9tat')
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138719349245751220)
,p_name=>'APEX.IG.RESET'
,p_message_language=>'fr'
,p_message_text=>unistr('R\00E9initialiser')
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138755785847751231)
,p_name=>'APEX.IG.REVERT_CHANGES'
,p_message_language=>'fr'
,p_message_text=>unistr('R\00E9tablir les modifications')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138754569131751231)
,p_name=>'APEX.IG.REVERT_ROWS'
,p_message_language=>'fr'
,p_message_text=>unistr('R\00E9tablir les lignes')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138751766664751230)
,p_name=>'APEX.IG.ROW'
,p_message_language=>'fr'
,p_message_text=>'Ligne'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138750699273751229)
,p_name=>'APEX.IG.ROWS_PER_PAGE'
,p_message_language=>'fr'
,p_message_text=>'Lignes par page'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138810473759751247)
,p_name=>'APEX.IG.ROW_ACTIONS'
,p_message_language=>'fr'
,p_message_text=>'Actions de ligne'
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138811635703751248)
,p_name=>'APEX.IG.ROW_ACTIONS_FOR'
,p_message_language=>'fr'
,p_message_text=>'Actions pour la ligne %0'
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138719656202751220)
,p_name=>'APEX.IG.SAVE'
,p_message_language=>'fr'
,p_message_text=>'Enregistrer'
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138764780336751234)
,p_name=>'APEX.IG.SAVED'
,p_message_language=>'fr'
,p_message_text=>unistr('enregistr\00E9')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138669307902751205)
,p_name=>'APEX.IG.SAVED_REPORT'
,p_message_language=>'fr'
,p_message_text=>unistr('Etat enregistr\00E9 : %0')
,p_is_js_message=>true
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138717875602751220)
,p_name=>'APEX.IG.SAVED_REPORTS'
,p_message_language=>'fr'
,p_message_text=>unistr('Etats enregistr\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138717910401751220)
,p_name=>'APEX.IG.SAVED_REPORT_DEFAULT'
,p_message_language=>'fr'
,p_message_text=>unistr('Valeur par d\00E9faut')
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138691440282751212)
,p_name=>'APEX.IG.SAVED_REPORT_EXISTS'
,p_message_language=>'fr'
,p_message_text=>unistr('Un \00E9tat enregistr\00E9 nomm\00E9 %0 existe d\00E9j\00E0. Entrez un nouveau nom.')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138718055222751220)
,p_name=>'APEX.IG.SAVED_REPORT_PRIVATE'
,p_message_language=>'fr'
,p_message_text=>unistr('Priv\00E9')
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138718176017751220)
,p_name=>'APEX.IG.SAVED_REPORT_PUBLIC'
,p_message_language=>'fr'
,p_message_text=>'Public'
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138805587095751246)
,p_name=>'APEX.IG.SAVE_AS'
,p_message_language=>'fr'
,p_message_text=>'Enregistrer sous'
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138753806121751230)
,p_name=>'APEX.IG.SAVE_REPORT_SETTINGS'
,p_message_language=>'fr'
,p_message_text=>unistr('Enregistrer les param\00E8tres d''\00E9tat')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138790609886751241)
,p_name=>'APEX.IG.SCATTER'
,p_message_language=>'fr'
,p_message_text=>'Graphique en nuage de points'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138717719149751220)
,p_name=>'APEX.IG.SEARCH'
,p_message_language=>'fr'
,p_message_text=>'Rechercher'
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138797876568751244)
,p_name=>'APEX.IG.SEARCH.ALL_COLUMNS'
,p_message_language=>'fr'
,p_message_text=>'Rechercher : Toutes les colonnes de texte'
,p_is_js_message=>true
,p_version_scn=>2704787
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138717689570751220)
,p_name=>'APEX.IG.SEARCH.COLUMN'
,p_message_language=>'fr'
,p_message_text=>'Rechercher : %0'
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138797151922751243)
,p_name=>'APEX.IG.SEARCH.ORACLE_TEXT'
,p_message_language=>'fr'
,p_message_text=>unistr('Rechercher : Texte int\00E9gral')
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138744884212751228)
,p_name=>'APEX.IG.SEARCH_FOR.X'
,p_message_language=>'fr'
,p_message_text=>'Rechercher ''%0'''
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138787221527751240)
,p_name=>'APEX.IG.SELECT'
,p_message_language=>'fr'
,p_message_text=>unistr('- S\00E9lectionner -')
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138727378277751223)
,p_name=>'APEX.IG.SELECTION'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lection')
,p_is_js_message=>true
,p_version_scn=>2704775
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138780422762751238)
,p_name=>'APEX.IG.SELECT_1_ROW_IN_MASTER'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lectionner 1 ligne dans la r\00E9gion parent')
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138717585591751220)
,p_name=>'APEX.IG.SELECT_COLUMNS_TO_SEARCH'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lectionner les colonnes \00E0 rechercher')
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138810186904751247)
,p_name=>'APEX.IG.SEL_ACTIONS'
,p_message_language=>'fr'
,p_message_text=>unistr('Actions de s\00E9lection')
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138727581668751223)
,p_name=>'APEX.IG.SEL_MODE_CELL'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lection de cellule')
,p_is_js_message=>true
,p_version_scn=>2704775
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138727476071751223)
,p_name=>'APEX.IG.SEL_MODE_ROW'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lection de ligne')
,p_is_js_message=>true
,p_version_scn=>2704775
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138798478659751244)
,p_name=>'APEX.IG.SEND_AS_EMAIL'
,p_message_language=>'fr'
,p_message_text=>'Envoyer en tant que courriel'
,p_is_js_message=>true
,p_version_scn=>2704787
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138791089966751241)
,p_name=>'APEX.IG.SERIES_COLUMN'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9rie')
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138715232945751219)
,p_name=>'APEX.IG.SHOW'
,p_message_language=>'fr'
,p_message_text=>'Afficher'
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138770438010751235)
,p_name=>'APEX.IG.SHOW_OVERALL_VALUE'
,p_message_language=>'fr'
,p_message_text=>'Afficher la valeur globale'
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138755370142751231)
,p_name=>'APEX.IG.SINGLE_ROW_VIEW'
,p_message_language=>'fr'
,p_message_text=>'Vue monoligne'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138753654645751230)
,p_name=>'APEX.IG.SORT'
,p_message_language=>'fr'
,p_message_text=>'Trier'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138791125185751242)
,p_name=>'APEX.IG.SORT_BY'
,p_message_language=>'fr'
,p_message_text=>'Trier par'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138810503281751247)
,p_name=>'APEX.IG.SORT_ONLY_ONE_PER_COLUMN'
,p_message_language=>'fr'
,p_message_text=>unistr('Vous ne pouvez d\00E9finir qu''un seul tri par colonne.')
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138810330077751247)
,p_name=>'APEX.IG.SRV_CHANGE_MENU'
,p_message_language=>'fr'
,p_message_text=>'Modifier'
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138792159783751242)
,p_name=>'APEX.IG.STACK'
,p_message_language=>'fr'
,p_message_text=>'Pile'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138747686805751229)
,p_name=>'APEX.IG.STARTS_WITH'
,p_message_language=>'fr'
,p_message_text=>'commence par'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138790710847751241)
,p_name=>'APEX.IG.STOCK'
,p_message_language=>'fr'
,p_message_text=>'Graphique boursier'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138710067723751217)
,p_name=>'APEX.IG.STRETCH_COLUMNS'
,p_message_language=>'fr'
,p_message_text=>'Etirer les largeurs de colonne'
,p_is_js_message=>true
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138754059077751230)
,p_name=>'APEX.IG.SUBSCRIPTION'
,p_message_language=>'fr'
,p_message_text=>'Abonnement'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138772017434751236)
,p_name=>'APEX.IG.SUM'
,p_message_language=>'fr'
,p_message_text=>'Somme'
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138811894146751248)
,p_name=>'APEX.IG.SUMMARY'
,p_message_language=>'fr'
,p_message_text=>'Grille interactive. Etat : %0, vue : %1.'
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138805959503751246)
,p_name=>'APEX.IG.SUM_OVERALL'
,p_message_language=>'fr'
,p_message_text=>'Somme globale'
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138788977150751241)
,p_name=>'APEX.IG.TARGET_COLUMN'
,p_message_language=>'fr'
,p_message_text=>'Cible'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138795393820751243)
,p_name=>'APEX.IG.TEXT_COLOR'
,p_message_language=>'fr'
,p_message_text=>'Couleur du texte'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138720323444751220)
,p_name=>'APEX.IG.TOGGLE'
,p_message_language=>'fr'
,p_message_text=>unistr('Activer/d\00E9sactiver')
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138602492751751185)
,p_name=>'APEX.IG.TOOLBAR'
,p_message_language=>'fr'
,p_message_text=>'Grille'
,p_is_js_message=>true
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138770350600751235)
,p_name=>'APEX.IG.TOOLTIP'
,p_message_language=>'fr'
,p_message_text=>'Info-bulle'
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138750886343751230)
,p_name=>'APEX.IG.TYPE'
,p_message_language=>'fr'
,p_message_text=>'Type'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138755297156751231)
,p_name=>'APEX.IG.UNFREEZE'
,p_message_language=>'fr'
,p_message_text=>unistr('Lib\00E9rer')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138752383839751230)
,p_name=>'APEX.IG.UNIT'
,p_message_language=>'fr'
,p_message_text=>unistr('Unit\00E9')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138798225197751244)
,p_name=>'APEX.IG.UNSAVED_CHANGES_CONTINUE_CONFIRM'
,p_message_language=>'fr'
,p_message_text=>unistr('Certaines modifications n''ont pas \00E9t\00E9 enregistr\00E9es. Voulez-vous continuer ?')
,p_is_js_message=>true
,p_version_scn=>2704787
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138752293678751230)
,p_name=>'APEX.IG.VALUE'
,p_message_language=>'fr'
,p_message_text=>'Valeur'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138788027191751241)
,p_name=>'APEX.IG.VALUE_COLUMN'
,p_message_language=>'fr'
,p_message_text=>'Valeur'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138792919428751242)
,p_name=>'APEX.IG.VALUE_REQUIRED'
,p_message_language=>'fr'
,p_message_text=>'Une valeur est requise.'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138778167362751238)
,p_name=>'APEX.IG.VALUE_TIMESTAMP_TZ'
,p_message_language=>'fr'
,p_message_text=>'Valeur (impossible de modifier le fuseau horaire)'
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138796821370751243)
,p_name=>'APEX.IG.VARCHAR2'
,p_message_language=>'fr'
,p_message_text=>'Texte'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138789392447751241)
,p_name=>'APEX.IG.VERTICAL'
,p_message_language=>'fr'
,p_message_text=>'Vertical'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138750355414751229)
,p_name=>'APEX.IG.VIEW'
,p_message_language=>'fr'
,p_message_text=>'Visualiser'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138685453804751210)
,p_name=>'APEX.IG.VIEW_MODE_DESCRIPTION'
,p_message_language=>'fr'
,p_message_text=>'Grille en mode de visualisation, cliquez dessus pour la modifier'
,p_is_js_message=>true
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138787337133751240)
,p_name=>'APEX.IG.VISIBLE'
,p_message_language=>'fr'
,p_message_text=>unistr('Affich\00E9')
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138788825125751241)
,p_name=>'APEX.IG.VOLUME_COLUMN'
,p_message_language=>'fr'
,p_message_text=>'Volume'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138748250618751229)
,p_name=>'APEX.IG.WEEKS'
,p_message_language=>'fr'
,p_message_text=>'semaines'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138787450231751240)
,p_name=>'APEX.IG.WIDTH'
,p_message_language=>'fr'
,p_message_text=>'Largeur de colonne minimale (pixels)'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138739442003751226)
,p_name=>'APEX.IG.X.BETWEEN.Y.AND.Z'
,p_message_language=>'fr'
,p_message_text=>'%0 compris entre %1 et %2'
,p_is_js_message=>true
,p_version_scn=>2704778
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138739147566751226)
,p_name=>'APEX.IG.X.CONTAINS.Y'
,p_message_language=>'fr'
,p_message_text=>'%0 contient %1'
,p_is_js_message=>true
,p_version_scn=>2704778
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138739248997751226)
,p_name=>'APEX.IG.X.DOES_NOT_CONTAIN.Y'
,p_message_language=>'fr'
,p_message_text=>'%0 ne contient pas %1'
,p_is_js_message=>true
,p_version_scn=>2704778
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138714668129751219)
,p_name=>'APEX.IG.X.DOES_NOT_START_WITH.Y'
,p_message_language=>'fr'
,p_message_text=>'%0 ne commence pas par %1'
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138737971531751226)
,p_name=>'APEX.IG.X.EQUALS.Y'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 est \00E9gal \00E0 %1')
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138738193607751226)
,p_name=>'APEX.IG.X.GREATER_THAN.Y'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 est sup\00E9rieur \00E0 %1')
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138738261714751226)
,p_name=>'APEX.IG.X.GREATER_THAN_OR_EQUALS.Y'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 sup\00E9rieur ou \00E9gal \00E0 %1')
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138738955229751226)
,p_name=>'APEX.IG.X.IN.Y'
,p_message_language=>'fr'
,p_message_text=>'%0 dans %1'
,p_is_js_message=>true
,p_version_scn=>2704778
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138740154788751226)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.DAYS'
,p_message_language=>'fr'
,p_message_text=>'%0 au cours des %1 derniers jours'
,p_is_js_message=>true
,p_version_scn=>2704778
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138739949080751226)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.HOURS'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 au cours des %1 derni\00E8res heures')
,p_is_js_message=>true
,p_version_scn=>2704778
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138739744594751226)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.MINUTES'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 au cours des %1 derni\00E8res minutes')
,p_is_js_message=>true
,p_version_scn=>2704778
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138740599601751226)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.MONTHS'
,p_message_language=>'fr'
,p_message_text=>'%0 au cours des %1 derniers mois'
,p_is_js_message=>true
,p_version_scn=>2704778
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138740389072751226)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.WEEKS'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 au cours des %1 derni\00E8res semaines')
,p_is_js_message=>true
,p_version_scn=>2704778
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138740799816751227)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.YEARS'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 au cours des %1 derni\00E8res ann\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138740076007751226)
,p_name=>'APEX.IG.X.IN_THE_LAST_DAY'
,p_message_language=>'fr'
,p_message_text=>'%0 au cours du dernier jour'
,p_is_js_message=>true
,p_version_scn=>2704778
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138739814041751226)
,p_name=>'APEX.IG.X.IN_THE_LAST_HOUR'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 au cours de la derni\00E8re heure')
,p_is_js_message=>true
,p_version_scn=>2704778
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138739697377751226)
,p_name=>'APEX.IG.X.IN_THE_LAST_MINUTE'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 au cours de la derni\00E8re minute')
,p_is_js_message=>true
,p_version_scn=>2704778
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138740454121751226)
,p_name=>'APEX.IG.X.IN_THE_LAST_MONTH'
,p_message_language=>'fr'
,p_message_text=>'%0 au cours du dernier mois'
,p_is_js_message=>true
,p_version_scn=>2704778
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138740226361751226)
,p_name=>'APEX.IG.X.IN_THE_LAST_WEEK'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 au cours de la derni\00E8re semaine')
,p_is_js_message=>true
,p_version_scn=>2704778
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138740666187751227)
,p_name=>'APEX.IG.X.IN_THE_LAST_YEAR'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 au cours de la derni\00E8re ann\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138742589864751227)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.DAYS'
,p_message_language=>'fr'
,p_message_text=>'%0 au cours des %1 prochains jours'
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138742377623751227)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.HOURS'
,p_message_language=>'fr'
,p_message_text=>'%0 dans les %1 prochaines heures'
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138742166167751227)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.MINUTES'
,p_message_language=>'fr'
,p_message_text=>'%0 dans les %1 prochaines minutes'
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138742911641751227)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.MONTHS'
,p_message_language=>'fr'
,p_message_text=>'%0 au cours des %1 prochains mois'
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138742770104751227)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.WEEKS'
,p_message_language=>'fr'
,p_message_text=>'%0 au cours des %1 prochaines semaines'
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138743100988751227)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.YEARS'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 dans les %1 prochaines ann\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138742469366751227)
,p_name=>'APEX.IG.X.IN_THE_NEXT_DAY'
,p_message_language=>'fr'
,p_message_text=>'%0 au cours du prochain jour'
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138742233803751227)
,p_name=>'APEX.IG.X.IN_THE_NEXT_HOUR'
,p_message_language=>'fr'
,p_message_text=>'%0 dans l''heure suivante'
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138742004013751227)
,p_name=>'APEX.IG.X.IN_THE_NEXT_MINUTE'
,p_message_language=>'fr'
,p_message_text=>'%0 dans la prochaine minute'
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138742811988751227)
,p_name=>'APEX.IG.X.IN_THE_NEXT_MONTH'
,p_message_language=>'fr'
,p_message_text=>'%0 au cours du prochain mois'
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138742619312751227)
,p_name=>'APEX.IG.X.IN_THE_NEXT_WEEK'
,p_message_language=>'fr'
,p_message_text=>'%0 au cours de la prochaine semaine'
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138743076874751227)
,p_name=>'APEX.IG.X.IN_THE_NEXT_YEAR'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 dans l''ann\00E9e prochaine')
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138738644072751226)
,p_name=>'APEX.IG.X.IS_NOT_NULL'
,p_message_language=>'fr'
,p_message_text=>'%0 n''est pas vide'
,p_is_js_message=>true
,p_version_scn=>2704778
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138738501958751226)
,p_name=>'APEX.IG.X.IS_NULL'
,p_message_language=>'fr'
,p_message_text=>'%0 est vide'
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138738374568751226)
,p_name=>'APEX.IG.X.LESS_THAN.Y'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 inf\00E9rieur \00E0 %1')
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138738433766751226)
,p_name=>'APEX.IG.X.LESS_THAN_OR_EQUALS.Y'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 inf\00E9rieur ou \00E9gal \00E0 %1')
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138738783772751226)
,p_name=>'APEX.IG.X.LIKE.Y'
,p_message_language=>'fr'
,p_message_text=>'%0 comme %1'
,p_is_js_message=>true
,p_version_scn=>2704778
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138739303418751226)
,p_name=>'APEX.IG.X.MATCHES_REGULAR_EXPRESSION.Y'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 recherche une expression r\00E9guli\00E8re %1')
,p_is_js_message=>true
,p_version_scn=>2704778
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138745253482751228)
,p_name=>'APEX.IG.X.MINUTES_AGO'
,p_message_language=>'fr'
,p_message_text=>'Il y a %0 minutes'
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138739542897751226)
,p_name=>'APEX.IG.X.NOT_BETWEEN.Y.AND.Z'
,p_message_language=>'fr'
,p_message_text=>'%0 n''est pas compris entre %1 et %2'
,p_is_js_message=>true
,p_version_scn=>2704778
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138738068933751226)
,p_name=>'APEX.IG.X.NOT_EQUALS.Y'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 est diff\00E9rent de %1')
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138739097684751226)
,p_name=>'APEX.IG.X.NOT_IN.Y'
,p_message_language=>'fr'
,p_message_text=>'%0 n''est pas dans %1'
,p_is_js_message=>true
,p_version_scn=>2704778
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138741348702751227)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.DAYS'
,p_message_language=>'fr'
,p_message_text=>'%0 pas au cours des %1 derniers jours'
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138741145892751227)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.HOURS'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 pas au cours des %1 derni\00E8res heures')
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138740983541751227)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.MINUTES'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 pas au cours des %1 derni\00E8res minutes')
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138741783248751227)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.MONTHS'
,p_message_language=>'fr'
,p_message_text=>'%0 pas au cours des %1 derniers mois'
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138741554700751227)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.WEEKS'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 pas au cours des %1 derni\00E8res semaines')
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138741950514751227)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.YEARS'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 pas au cours des %1 derni\00E8res ann\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138741202676751227)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_DAY'
,p_message_language=>'fr'
,p_message_text=>'%0 pas au cours du dernier jour'
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138741092791751227)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_HOUR'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 pas au cours de la derni\00E8re heure')
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138740869394751227)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_MINUTE'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 pas au cours de la derni\00E8re minute')
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138741636242751227)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_MONTH'
,p_message_language=>'fr'
,p_message_text=>'%0 pas au cours du dernier mois'
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138741434553751227)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_WEEK'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 pas au cours de la derni\00E8re semaine')
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138741817531751227)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_YEAR'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 pas au cours de la derni\00E8re ann\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138743776510751227)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.DAYS'
,p_message_language=>'fr'
,p_message_text=>'%0 pas au cours des %1 prochains jours'
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138743593059751227)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.HOURS'
,p_message_language=>'fr'
,p_message_text=>'%0 pas dans les %1 prochaines heures'
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138743354424751227)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.MINUTES'
,p_message_language=>'fr'
,p_message_text=>'%0 pas dans les %1 prochaines minutes'
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138744164342751228)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.MONTHS'
,p_message_language=>'fr'
,p_message_text=>'%0 pas dans les %1 prochains mois '
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138743990111751227)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.WEEKS'
,p_message_language=>'fr'
,p_message_text=>'%0 pas au cours des %1 prochaines semaines'
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138744310073751228)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.YEARS'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 pas dans les %1 prochaines ann\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138743680544751227)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_DAY'
,p_message_language=>'fr'
,p_message_text=>'%0 pas le jour suivant'
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138743423845751227)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_HOUR'
,p_message_language=>'fr'
,p_message_text=>'%0 pas dans la prochaine heure'
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138743262529751227)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_MINUTE'
,p_message_language=>'fr'
,p_message_text=>'%0 pas dans la prochaine minute'
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138744042758751228)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_MONTH'
,p_message_language=>'fr'
,p_message_text=>'%0 pas dans le prochain mois'
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138743846969751227)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_WEEK'
,p_message_language=>'fr'
,p_message_text=>'%0 pas au cours de la semaine prochaine'
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138744287990751228)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_YEAR'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 pas l''ann\00E9e prochaine')
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138738885398751226)
,p_name=>'APEX.IG.X.NOT_LIKE.Y'
,p_message_language=>'fr'
,p_message_text=>'%0 n''est pas comme %1'
,p_is_js_message=>true
,p_version_scn=>2704778
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138745757677751228)
,p_name=>'APEX.IG.X.STARTS_WITH.Y'
,p_message_language=>'fr'
,p_message_text=>'%0 commence par %1'
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138788144846751241)
,p_name=>'APEX.IG.X_COLUMN'
,p_message_language=>'fr'
,p_message_text=>'X'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138748431449751229)
,p_name=>'APEX.IG.YEARS'
,p_message_language=>'fr'
,p_message_text=>unistr('ann\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138788251395751241)
,p_name=>'APEX.IG.Y_COLUMN'
,p_message_language=>'fr'
,p_message_text=>'O'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138788320121751241)
,p_name=>'APEX.IG.Z_COLUMN'
,p_message_language=>'fr'
,p_message_text=>'Z'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138797310287751243)
,p_name=>'APEX.IG_FORMAT_SAMPLE_1'
,p_message_language=>'fr'
,p_message_text=>'Lundi 12 janvier 2016'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138797498015751243)
,p_name=>'APEX.IG_FORMAT_SAMPLE_2'
,p_message_language=>'fr'
,p_message_text=>'Janvier'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138797592063751243)
,p_name=>'APEX.IG_FORMAT_SAMPLE_3'
,p_message_language=>'fr'
,p_message_text=>'Il y a 16 heures'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138797685942751243)
,p_name=>'APEX.IG_FORMAT_SAMPLE_4'
,p_message_language=>'fr'
,p_message_text=>'dans 16 h'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138615607145751189)
,p_name=>'APEX.ITEM.CROPPER.APPLY'
,p_message_language=>'fr'
,p_message_text=>'Appliquer'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138607662825751187)
,p_name=>'APEX.ITEM.CROPPER.HELP.TEXT'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Faites glisser l''image et utilisez le curseur de zoom pour la repositionner \00E0 l''int\00E9rieur du cadre.</p>'),
'',
unistr('<p>Lorsque vous s\00E9lectionnez l''outil Rogner de l''image, les raccourcis clavier suivants sont disponibles :</p>'),
'<ul>',
unistr('    <li>Fl\00E8che vers la gauche : d\00E9placer l''image vers la gauche*</li>'),
unistr('    <li>Fl\00E8che vers le haut : d\00E9placer l''image vers le haut*</li>'),
unistr('    <li>Fl\00E8che vers la droite : d\00E9placer l''image vers la droite*</li>'),
unistr('    <li>Fl\00E8che vers le bas : d\00E9placer l''image vers le bas*</li>'),
'    <li>I : zoom avant</li>',
unistr('    <li>O : zoom arri\00E8re</li>'),
unistr('    <li>L : faire pivoter \00E0 gauche</li>'),
unistr('    <li>R : faire pivoter \00E0 droite</li>'),
'</ul>',
'',
unistr('<p class="margin-top-md"><em>*Maintenir la touche Maj enfonc\00E9e pour aller plus vite</em></p>')))
,p_is_js_message=>true
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138607829701751187)
,p_name=>'APEX.ITEM.CROPPER.HELP.TITLE'
,p_message_language=>'fr'
,p_message_text=>unistr('Aide relative \00E0 l''outil Rogner de l''image')
,p_is_js_message=>true
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138615757155751189)
,p_name=>'APEX.ITEM.CROPPER.RESET'
,p_message_language=>'fr'
,p_message_text=>unistr('R\00E9initialiser')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138608116380751187)
,p_name=>'APEX.ITEM.CROPPER.TITLE'
,p_message_language=>'fr'
,p_message_text=>'Rogner l''image'
,p_is_js_message=>true
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138615825178751189)
,p_name=>'APEX.ITEM.CROPPER.ZOOM_SLIDER_LABEL'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9placer le curseur pour ajuster le niveau de zoom')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138645477767751198)
,p_name=>'APEX.ITEM.FILE.ACCEPTED_TYPES'
,p_message_language=>'fr'
,p_message_text=>'Type de fichier non valide. Types de fichier pris en charge : %0.'
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138779867096751238)
,p_name=>'APEX.ITEM.FILE.BROWSE'
,p_message_language=>'fr'
,p_message_text=>'Parcourir'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138779526300751238)
,p_name=>'APEX.ITEM.FILE.CHOOSE_FILE'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lectionner un fichier')
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138779697926751238)
,p_name=>'APEX.ITEM.FILE.CHOOSE_FILES'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lectionner des fichiers')
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138645237976751198)
,p_name=>'APEX.ITEM.FILE.DROP_FILE'
,p_message_language=>'fr'
,p_message_text=>unistr('Glisser-d\00E9placer')
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138645605842751198)
,p_name=>'APEX.ITEM.FILE.DROP_FILES'
,p_message_language=>'fr'
,p_message_text=>unistr('Glisser et d\00E9placer des fichiers')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138647056025751199)
,p_name=>'APEX.ITEM.FILE.DROP_OR_CHOOSE_FILE'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lectionner un fichier ou en d\00E9placer un ici.')
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138647178395751199)
,p_name=>'APEX.ITEM.FILE.DROP_OR_CHOOSE_FILES'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lectionnez ou d\00E9placez des fichiers ici.')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138647241946751199)
,p_name=>'APEX.ITEM.FILE.DROP_OR_SELECT_FILE'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lectionner un fichier ou en d\00E9placer un ici.')
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138647369931751199)
,p_name=>'APEX.ITEM.FILE.DROP_OR_SELECT_FILES'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lectionnez ou d\00E9placez des fichiers ici.')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138645570661751198)
,p_name=>'APEX.ITEM.FILE.FILES_WITH_COUNT'
,p_message_language=>'fr'
,p_message_text=>'%0 fichiers'
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138645330207751198)
,p_name=>'APEX.ITEM.FILE.MAX_FILE_SIZE'
,p_message_language=>'fr'
,p_message_text=>'Le fichier est trop volumineux. La taille de fichier maximale est de %0.'
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138625869623751192)
,p_name=>'APEX.ITEM.FILE.MULTIPLE_FILES_NOT_SUPPORTED'
,p_message_language=>'fr'
,p_message_text=>unistr('Les t\00E9l\00E9chargements de plusieurs fichiers ne sont pas pris en charge.')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138608711785751187)
,p_name=>'APEX.ITEM.FILE.REMOVE'
,p_message_language=>'fr'
,p_message_text=>'Enlever'
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138614279773751189)
,p_name=>'APEX.ITEM.GEOCODE.ADDRESS_REQUIRED'
,p_message_language=>'fr'
,p_message_text=>'Adresse requise.'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138613103851751188)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_CITY'
,p_message_language=>'fr'
,p_message_text=>'Ville'
,p_is_js_message=>true
,p_version_scn=>2704756
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138613546468751189)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_COUNTRY'
,p_message_language=>'fr'
,p_message_text=>'Code pays'
,p_is_js_message=>true
,p_version_scn=>2704756
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138613228623751189)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_HOUSENUMBER'
,p_message_language=>'fr'
,p_message_text=>unistr('Num\00E9ro de b\00E2timent')
,p_is_js_message=>true
,p_version_scn=>2704756
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138614187134751189)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_LATITUDE'
,p_message_language=>'fr'
,p_message_text=>'Latitude'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138614059164751189)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_LONGITUDE'
,p_message_language=>'fr'
,p_message_text=>'Longitude'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138613952594751189)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_MAPLINK'
,p_message_language=>'fr'
,p_message_text=>'Affich. sur carte'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138613640708751189)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_MATCHSCORE'
,p_message_language=>'fr'
,p_message_text=>'Score'
,p_is_js_message=>true
,p_version_scn=>2704756
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138613386898751189)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_POSTALCODE'
,p_message_language=>'fr'
,p_message_text=>'Code postal'
,p_is_js_message=>true
,p_version_scn=>2704756
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138613432462751189)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_STATE'
,p_message_language=>'fr'
,p_message_text=>'Etat'
,p_is_js_message=>true
,p_version_scn=>2704756
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138613038221751188)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_STREET'
,p_message_language=>'fr'
,p_message_text=>'Rue'
,p_is_js_message=>true
,p_version_scn=>2704756
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138612978020751188)
,p_name=>'APEX.ITEM.GEOCODE.DIALOG_TITLE'
,p_message_language=>'fr'
,p_message_text=>unistr('R\00E9sultats de g\00E9ocodage')
,p_is_js_message=>true
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138644462491751198)
,p_name=>'APEX.ITEM.GEOCODE.GEOCODING_DONE'
,p_message_language=>'fr'
,p_message_text=>unistr('G\00E9ocod\00E9')
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138644558113751198)
,p_name=>'APEX.ITEM.GEOCODE.GEOCODING_OPEN'
,p_message_language=>'fr'
,p_message_text=>unistr('Non g\00E9ocod\00E9')
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138613880982751189)
,p_name=>'APEX.ITEM.GEOCODE.MAP_DIALOG_TITLE'
,p_message_language=>'fr'
,p_message_text=>'Carte'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138613781821751189)
,p_name=>'APEX.ITEM.GEOCODE.NO_DATA_FOUND'
,p_message_language=>'fr'
,p_message_text=>unistr('Aucune adresse trouv\00E9e.')
,p_is_js_message=>true
,p_version_scn=>2704756
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138614380069751189)
,p_name=>'APEX.ITEM.GEOCODE.REQUIRED'
,p_message_language=>'fr'
,p_message_text=>'%0 est requis.'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138720501622751220)
,p_name=>'APEX.ITEM.GEOCODE.REQUIRED_MULTIPLE'
,p_message_language=>'fr'
,p_message_text=>'%0 ou %1 est requis.'
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138810058787751247)
,p_name=>'APEX.ITEM.HELP_TEXT'
,p_message_language=>'fr'
,p_message_text=>'Affichez le texte d''aide pour %0.'
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138616035644751189)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.CHOOSE_FILE'
,p_message_language=>'fr'
,p_message_text=>'Choisir une image'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138616107674751189)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.CHOOSE_FILES'
,p_message_language=>'fr'
,p_message_text=>'Choisir des images'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138615998069751189)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DOWNLOAD_LINK_TEXT'
,p_message_language=>'fr'
,p_message_text=>unistr('T\00E9l\00E9charger en local')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138616278881751189)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_FILE'
,p_message_language=>'fr'
,p_message_text=>unistr('Glisser-d\00E9placer')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138616362501751189)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_FILES'
,p_message_language=>'fr'
,p_message_text=>unistr('Glisser-d\00E9placer les images')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138616461314751189)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_CHOOSE_FILE'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lectionnez une image ou d\00E9placez-en une ici.')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138616568531751190)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_CHOOSE_FILES'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lectionnez des images ou d\00E9placez-en ici.')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138616694661751190)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_SELECT_FILE'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lectionnez une image ou d\00E9placez-en une ici.')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138616710588751190)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_SELECT_FILES'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lectionnez des images ou d\00E9placez-en ici.')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138701428247751215)
,p_name=>'APEX.ITEM_TYPE.CHECKBOX.CHECKED'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lectionn\00E9')
,p_is_js_message=>true
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138701545767751215)
,p_name=>'APEX.ITEM_TYPE.CHECKBOX.UNCHECKED'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9s\00E9lectionn\00E9')
,p_is_js_message=>true
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138729043598751223)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.EMPTY_READONLY_COMBOBOX'
,p_message_language=>'fr'
,p_message_text=>unistr('Liste d\00E9roulante vide en lecture seule')
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138726876992751222)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.EMPTY_READONLY_LISTBOX'
,p_message_language=>'fr'
,p_message_text=>'Zone de liste vide en lecture seule'
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138726696826751222)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.READONLY_COMBOBOX'
,p_message_language=>'fr'
,p_message_text=>unistr('Liste d\00E9roulante en lecture seule')
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138726743605751222)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.READONLY_LISTBOX'
,p_message_language=>'fr'
,p_message_text=>'Zone de liste en lecture seule'
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138642450206751197)
,p_name=>'APEX.ITEM_TYPE.SLIDER.VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'fr'
,p_message_text=>unistr('La valeur #LABEL# n''est pas comprise dans la plage valide de %0 \00E0 %1.')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138642549392751197)
,p_name=>'APEX.ITEM_TYPE.SLIDER.VALUE_NOT_MULTIPLE_OF_STEP'
,p_message_language=>'fr'
,p_message_text=>'#LABEL# n''est pas un multiple de %0.'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138729818604751223)
,p_name=>'APEX.ITEM_TYPE.SWITCH.READONLY_SWITCH'
,p_message_language=>'fr'
,p_message_text=>'Commutateur en lecture seule'
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138670424211751205)
,p_name=>'APEX.ITEM_TYPE.TEXT.READONLY_WITH_LINK'
,p_message_language=>'fr'
,p_message_text=>'Lecture seule : modifier avec un lien'
,p_version_scn=>2704763
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138642070121751197)
,p_name=>'APEX.ITEM_TYPE.YES_NO.INVALID_VALUE'
,p_message_language=>'fr'
,p_message_text=>'#LABEL# doit correspondre aux valeurs %0 et %1.'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138642273628751197)
,p_name=>'APEX.ITEM_TYPE.YES_NO.NO_LABEL'
,p_message_language=>'fr'
,p_message_text=>'Non'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138728547157751223)
,p_name=>'APEX.ITEM_TYPE.YES_NO.OFF_LABEL'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9sactiv\00E9')
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138728643864751223)
,p_name=>'APEX.ITEM_TYPE.YES_NO.ON_LABEL'
,p_message_language=>'fr'
,p_message_text=>unistr('Activ\00E9')
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138642173272751197)
,p_name=>'APEX.ITEM_TYPE.YES_NO.YES_LABEL'
,p_message_language=>'fr'
,p_message_text=>'Oui'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138650019710751199)
,p_name=>'APEX.LANGUAGE_SELECTOR'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lecteur de langue')
,p_version_scn=>2704761
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138586425813751181)
,p_name=>'APEX.LIST_MANAGER.ADD_ENTRY'
,p_message_language=>'fr'
,p_message_text=>unistr('Ajouter une entr\00E9e')
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138763285053751233)
,p_name=>'APEX.LIST_MANAGER.BUTTON_ADD'
,p_message_language=>'fr'
,p_message_text=>'Ajouter'
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138763363855751233)
,p_name=>'APEX.LIST_MANAGER.BUTTON_REMOVE'
,p_message_language=>'fr'
,p_message_text=>'Enlever'
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138586509641751181)
,p_name=>'APEX.LIST_MANAGER.SELECTED_ENTRY'
,p_message_language=>'fr'
,p_message_text=>unistr('Entr\00E9es s\00E9lectionn\00E9es')
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138767053077751234)
,p_name=>'APEX.LTO.ADVANCED'
,p_message_language=>'fr'
,p_message_text=>unistr('Avanc\00E9')
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138767317433751234)
,p_name=>'APEX.LTO.CANCEL'
,p_message_language=>'fr'
,p_message_text=>'Annuler'
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138767198319751234)
,p_name=>'APEX.LTO.COMMON'
,p_message_language=>'fr'
,p_message_text=>'Standard'
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138767498777751234)
,p_name=>'APEX.LTO.LIVE_TEMPLATE_OPTIONS'
,p_message_language=>'fr'
,p_message_text=>unistr('Options de mod\00E8le en service')
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138768090269751235)
,p_name=>'APEX.LTO.NOT_APPLICABLE'
,p_message_language=>'fr'
,p_message_text=>unistr('Les options de mod\00E8le ne sont pas disponibles car ce composant n''est pas affich\00E9 sur la page.')
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138766927214751234)
,p_name=>'APEX.LTO.NO_OPTIONS_FOUND'
,p_message_language=>'fr'
,p_message_text=>unistr('Aucune option de mod\00E8le n''a \00E9t\00E9 trouv\00E9e.')
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138767292326751234)
,p_name=>'APEX.LTO.SAVE'
,p_message_language=>'fr'
,p_message_text=>'Enregistrer'
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138621032454751191)
,p_name=>'APEX.MAPS.CLEAR_CIRCLE'
,p_message_language=>'fr'
,p_message_text=>'Effacer le cercle'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138623483803751192)
,p_name=>'APEX.MAPS.CUSTOM_STYLES_INVALID_JSON'
,p_message_language=>'fr'
,p_message_text=>unistr('Les styles personnalis\00E9s ne sont pas une expression JSON valide.')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138621358326751191)
,p_name=>'APEX.MAPS.DISTANCE_TOOL'
,p_message_language=>'fr'
,p_message_text=>'Outil Distance'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138621171362751191)
,p_name=>'APEX.MAPS.DRAW_CIRCLE'
,p_message_language=>'fr'
,p_message_text=>'Dessiner un cercle'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138600944529751185)
,p_name=>'APEX.MAPS.FIND_MY_LOCATION'
,p_message_language=>'fr'
,p_message_text=>'Position actuelle'
,p_is_js_message=>true
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138607356354751187)
,p_name=>'APEX.MAPS.INIT_POINT_COORDINATES_INVALID'
,p_message_language=>'fr'
,p_message_text=>unistr('Les coordonn\00E9es de la position initiale ne sont pas valides.')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138596364955751184)
,p_name=>'APEX.MAPS.INIT_POINT_GEOMETRY_REQUIRED'
,p_message_language=>'fr'
,p_message_text=>unistr('La position initiale doit \00EAtre une g\00E9om\00E9trie de type point.')
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138604945399751186)
,p_name=>'APEX.MAPS.KM'
,p_message_language=>'fr'
,p_message_text=>'km'
,p_is_js_message=>true
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138600138051751185)
,p_name=>'APEX.MAPS.LAYER'
,p_message_language=>'fr'
,p_message_text=>'Couche'
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138770503498751235)
,p_name=>'APEX.MAPS.LAYER_NAME'
,p_message_language=>'fr'
,p_message_text=>'Couche : %0'
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138619380618751190)
,p_name=>'APEX.MAPS.MAP'
,p_message_language=>'fr'
,p_message_text=>'Carte'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138589051950751181)
,p_name=>'APEX.MAPS.MAP_MESSAGES'
,p_message_language=>'fr'
,p_message_text=>'Messages'
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138605131047751186)
,p_name=>'APEX.MAPS.MILES'
,p_message_language=>'fr'
,p_message_text=>'miles'
,p_is_js_message=>true
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138769556787751235)
,p_name=>'APEX.MAPS.MORE_DATA_FOUND'
,p_message_language=>'fr'
,p_message_text=>unistr('Les donn\00E9es contiennent plus de %0 lignes, ce qui est sup\00E9rieur au nombre maximal autoris\00E9.')
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138599488350751184)
,p_name=>'APEX.MAPS.ORACLE_MAP_COPYRIGHT'
,p_message_language=>'fr'
,p_message_text=>unistr('&copy; 2022 Oracle Corporation &nbsp;&nbsp; <a rel="noopener noreferrer" target="_blank" href="https://elocation.oracle.com/elocation/legal.html">Conditions</a> &nbsp;&nbsp; Donn\00E9es de carte &copy; 2021 HERE')
,p_is_js_message=>true
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138596068218751183)
,p_name=>'APEX.MAPS.ORACLE_SDO_GEOMETRY_NOT_AVAILABLE'
,p_message_language=>'fr'
,p_message_text=>unistr('Le type de donn\00E9es SDO_GEOMETRY n''est pas disponible dans cette base de donn\00E9es.')
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138599502658751184)
,p_name=>'APEX.MAPS.OSM_MAP_COPYRIGHT'
,p_message_language=>'fr'
,p_message_text=>'<a rel="noopener noreferrer" target="_blank" href="http://openmaptiles.org"> &copy; OpenMapTiles </a> &nbsp; <a rel="noopener noreferrer" target="_blank" href="https://www.openstreetmap.org/copyright"> &copy; Contributeurs OpenStreetMap </a>'
,p_is_js_message=>true
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138624176495751192)
,p_name=>'APEX.MAPS.OSM_VECTOR_MAP_COPYRIGHT'
,p_message_language=>'fr'
,p_message_text=>'<a rel="noopener noreferrer" target="blank" href="https://www.maptiler.com/copyright"> &copy; MapTiler</a> &nbsp; <a rel="noopener noreferrer" target="_blank" href="https://www.openstreetmap.org/copyright"> &copy; Contributeurs OpenStreetMap </a>'
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138600347632751185)
,p_name=>'APEX.MAPS.POINTS'
,p_message_language=>'fr'
,p_message_text=>'Points'
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138770640577751235)
,p_name=>'APEX.MAPS.POINTS_COUNT'
,p_message_language=>'fr'
,p_message_text=>'%0 points'
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138621217482751191)
,p_name=>'APEX.MAPS.RECTANGLE_ZOOM'
,p_message_language=>'fr'
,p_message_text=>'Zoom rectangle'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138620986212751191)
,p_name=>'APEX.MAPS.REMOVE_MESSAGE'
,p_message_language=>'fr'
,p_message_text=>'Enlever'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138600745909751185)
,p_name=>'APEX.MAPS.RESET_BEARING_TO_NORTH'
,p_message_language=>'fr'
,p_message_text=>unistr('R\00E9initialiser l''azimut sur le nord')
,p_is_js_message=>true
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138715599873751219)
,p_name=>'APEX.MAPS.TOGGLE_2D_MODE'
,p_message_language=>'fr'
,p_message_text=>'Basculer en mode 2D'
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138715685145751219)
,p_name=>'APEX.MAPS.TOGGLE_3D_MODE'
,p_message_language=>'fr'
,p_message_text=>'Basculer en mode 3D'
,p_is_js_message=>true
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138620893544751191)
,p_name=>'APEX.MAPS.TOGGLE_COPYRIGHT'
,p_message_language=>'fr'
,p_message_text=>unistr('Activer/d\00E9sactiver le copyright')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138621468501751191)
,p_name=>'APEX.MAPS.TOTAL_DISTANCE'
,p_message_language=>'fr'
,p_message_text=>'Distance totale'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138600468237751185)
,p_name=>'APEX.MAPS.ZOOM_IN'
,p_message_language=>'fr'
,p_message_text=>'Zoom avant'
,p_is_js_message=>true
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138600632217751185)
,p_name=>'APEX.MAPS.ZOOM_OUT'
,p_message_language=>'fr'
,p_message_text=>unistr('Zoom arri\00E8re')
,p_is_js_message=>true
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138765108711751234)
,p_name=>'APEX.MARKDOWN.BOLD'
,p_message_language=>'fr'
,p_message_text=>'Gras'
,p_is_js_message=>true
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138766037197751234)
,p_name=>'APEX.MARKDOWN.IMAGE'
,p_message_language=>'fr'
,p_message_text=>'Image'
,p_is_js_message=>true
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138765660461751234)
,p_name=>'APEX.MARKDOWN.INLINE_CODE'
,p_message_language=>'fr'
,p_message_text=>unistr('Code incorpor\00E9')
,p_is_js_message=>true
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138778301871751238)
,p_name=>'APEX.MARKDOWN.INSERT_IMAGE'
,p_message_language=>'fr'
,p_message_text=>unistr('Ins\00E9rer une image')
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138778469974751238)
,p_name=>'APEX.MARKDOWN.INSERT_LINK'
,p_message_language=>'fr'
,p_message_text=>unistr('Ins\00E9rer un lien')
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138765279753751234)
,p_name=>'APEX.MARKDOWN.ITALIC'
,p_message_language=>'fr'
,p_message_text=>'Italique'
,p_is_js_message=>true
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138779060299751238)
,p_name=>'APEX.MARKDOWN.LINK'
,p_message_language=>'fr'
,p_message_text=>'Lien'
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138765921624751234)
,p_name=>'APEX.MARKDOWN.LIST'
,p_message_language=>'fr'
,p_message_text=>'Liste'
,p_is_js_message=>true
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138765863663751234)
,p_name=>'APEX.MARKDOWN.ORDERED_LIST'
,p_message_language=>'fr'
,p_message_text=>unistr('Liste tri\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138765335011751234)
,p_name=>'APEX.MARKDOWN.PREVIEW'
,p_message_language=>'fr'
,p_message_text=>unistr('Aper\00E7u')
,p_is_js_message=>true
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138765489027751234)
,p_name=>'APEX.MARKDOWN.PREVIEW_EMPTY'
,p_message_language=>'fr'
,p_message_text=>unistr('Il n''y a rien \00E0 pr\00E9visualiser')
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138765539186751234)
,p_name=>'APEX.MARKDOWN.STRIKETHROUGH'
,p_message_language=>'fr'
,p_message_text=>unistr('Barr\00E9')
,p_is_js_message=>true
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138765757355751234)
,p_name=>'APEX.MARKDOWN.UNORDERED_LIST'
,p_message_language=>'fr'
,p_message_text=>unistr('Liste non tri\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138744676294751228)
,p_name=>'APEX.MENU.CURRENT_MENU'
,p_message_language=>'fr'
,p_message_text=>'en cours'
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138800822984751244)
,p_name=>'APEX.MENU.OVERFLOW_LABEL'
,p_message_language=>'fr'
,p_message_text=>'Plus...'
,p_is_js_message=>true
,p_version_scn=>2704789
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138744561417751228)
,p_name=>'APEX.MENU.PROCESSING'
,p_message_language=>'fr'
,p_message_text=>'Chargement'
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138658773083751202)
,p_name=>'APEX.MENU.SPLIT_BUTTON'
,p_message_language=>'fr'
,p_message_text=>'Fractionner le bouton'
,p_is_js_message=>true
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138658609872751202)
,p_name=>'APEX.MENU.SPLIT_MENU'
,p_message_language=>'fr'
,p_message_text=>'Fractionner le menu'
,p_is_js_message=>true
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138775672228751237)
,p_name=>'APEX.NOTIFICATION_MESSAGE_HEADING'
,p_message_language=>'fr'
,p_message_text=>'Message de notification'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138599743511751185)
,p_name=>'APEX.NO_DATA_FOUND_ENTITY'
,p_message_language=>'fr'
,p_message_text=>unistr('Aucun \00E9l\00E9ment %0 trouv\00E9')
,p_is_js_message=>true
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138749613429751229)
,p_name=>'APEX.NUMBER_FIELD.VALUE_GREATER_MAX_VALUE'
,p_message_language=>'fr'
,p_message_text=>unistr('#LABEL# doit \00EAtre un nombre inf\00E9rieur ou \00E9gal \00E0 %0.')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138749744433751229)
,p_name=>'APEX.NUMBER_FIELD.VALUE_INVALID'
,p_message_language=>'fr'
,p_message_text=>unistr('#LABEL# doit \00EAtre une valeur num\00E9rique valide.')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138749846392751229)
,p_name=>'APEX.NUMBER_FIELD.VALUE_INVALID2'
,p_message_language=>'fr'
,p_message_text=>unistr('La valeur #LABEL# ne correspond pas au format num\00E9rique %0 (exemple : %1).')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138749519970751229)
,p_name=>'APEX.NUMBER_FIELD.VALUE_LESS_MIN_VALUE'
,p_message_language=>'fr'
,p_message_text=>unistr('#LABEL# doit \00EAtre un nombre sup\00E9rieur ou \00E9gal \00E0 %0.')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138749417899751229)
,p_name=>'APEX.NUMBER_FIELD.VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'fr'
,p_message_text=>unistr('#LABEL# doit \00EAtre un nombre compris entre %0 et %1.')
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138744781351751228)
,p_name=>'APEX.OPENS_IN_NEW_WINDOW_LOWER'
,p_message_language=>'fr'
,p_message_text=>unistr('s''ouvre dans une nouvelle fen\00EAtre')
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138694546873751213)
,p_name=>'APEX.PAGE.DUPLICATE_SUBMIT'
,p_message_language=>'fr'
,p_message_text=>unistr('Cette page a d\00E9j\00E0 \00E9t\00E9 soumise ; elle ne peut pas l''\00EAtre de nouveau.')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138675902382751207)
,p_name=>'APEX.PAGE.NOT_FOUND'
,p_message_language=>'fr'
,p_message_text=>'L''application "%0", page "%1", est introuvable.'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138711453615751218)
,p_name=>'APEX.PAGE_ITEM_IS_REQUIRED'
,p_message_language=>'fr'
,p_message_text=>'#LABEL# doit comporter une valeur.'
,p_is_js_message=>true
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138602179618751185)
,p_name=>'APEX.PASSWORD.HIDE_PASSWORD'
,p_message_language=>'fr'
,p_message_text=>'Masquer le mot de passe'
,p_is_js_message=>true
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138602036380751185)
,p_name=>'APEX.PASSWORD.SHOW_PASSWORD'
,p_message_language=>'fr'
,p_message_text=>'Afficher le mot de passe'
,p_is_js_message=>true
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138649669357751199)
,p_name=>'APEX.POPUP.SEARCH'
,p_message_language=>'fr'
,p_message_text=>'Rechercher'
,p_is_js_message=>true
,p_version_scn=>2704761
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138763621129751233)
,p_name=>'APEX.POPUP_LOV.BUTTON_CLOSE'
,p_message_language=>'fr'
,p_message_text=>'Fermer'
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138763544144751233)
,p_name=>'APEX.POPUP_LOV.BUTTON_FIND'
,p_message_language=>'fr'
,p_message_text=>'Rechercher %0'
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138763897497751233)
,p_name=>'APEX.POPUP_LOV.BUTTON_NEXT'
,p_message_language=>'fr'
,p_message_text=>'Suivant'
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138763768163751233)
,p_name=>'APEX.POPUP_LOV.BUTTON_PREV'
,p_message_language=>'fr'
,p_message_text=>unistr('Pr\00E9c\00E9dent')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138640422090751197)
,p_name=>'APEX.POPUP_LOV.FILTER_REQ'
,p_message_language=>'fr'
,p_message_text=>unistr('Saisissez un terme de recherche comportant au moins %0 caract\00E8res.')
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138716755444751219)
,p_name=>'APEX.POPUP_LOV.ICON_TEXT'
,p_message_language=>'fr'
,p_message_text=>unistr('Liste de valeurs (LOV) instantan\00E9e : %0')
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138640574921751197)
,p_name=>'APEX.POPUP_LOV.INITIAL_FILTER_REQ'
,p_message_language=>'fr'
,p_message_text=>'Saisissez un terme de recherche.'
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138587507520751181)
,p_name=>'APEX.POPUP_LOV.LIST_OF_VALUES'
,p_message_language=>'fr'
,p_message_text=>'Liste de valeurs'
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138640399570751197)
,p_name=>'APEX.POPUP_LOV.NO_RESULTS'
,p_message_language=>'fr'
,p_message_text=>unistr('Aucun r\00E9sultat trouv\00E9.')
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138640200950751197)
,p_name=>'APEX.POPUP_LOV.REMOVE_VALUE'
,p_message_language=>'fr'
,p_message_text=>'Enlever %0'
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138737400030751226)
,p_name=>'APEX.POPUP_LOV.SEARCH'
,p_message_language=>'fr'
,p_message_text=>'Terme de recherche'
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138763488325751233)
,p_name=>'APEX.POPUP_LOV.TITLE'
,p_message_language=>'fr'
,p_message_text=>'Rechercher'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138589612154751182)
,p_name=>'APEX.PRINT.DOCGEN_REQUIRED'
,p_message_language=>'fr'
,p_message_text=>unistr('N\00E9cessite %0.')
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138601934075751185)
,p_name=>'APEX.PRINT_REPORT.ERROR'
,p_message_language=>'fr'
,p_message_text=>unistr('Erreur lors de l''impression d''\00E9tat.')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138612760084751188)
,p_name=>'APEX.PRINT_UTIL.UNABLE_TO_PRINT'
,p_message_language=>'fr'
,p_message_text=>unistr('Impossible d''imprimer le document \00E0 l''aide du serveur d''impression configur\00E9.')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138635485150751195)
,p_name=>'APEX.PROCESS.INVOKE_API.PARAMETER_ERROR'
,p_message_language=>'fr'
,p_message_text=>unistr('Erreur lors de l''\00E9valuation du param\00E8tre %0 lors de l''appel de %1. Consultez le journal des erreurs pour plus de d\00E9tails.')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138774114724751236)
,p_name=>'APEX.PROCESSING'
,p_message_language=>'fr'
,p_message_text=>'Traitement en cours'
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138633203697751194)
,p_name=>'APEX.PWA.DIALOG.HIDE.INSTRUCTIONS'
,p_message_language=>'fr'
,p_message_text=>'Retour'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138634381214751195)
,p_name=>'APEX.PWA.DIALOG.INTRO'
,p_message_language=>'fr'
,p_message_text=>unistr('Ce site Web est disponible sous forme d''application. Installez-le sur votre appareil pour b\00E9n\00E9ficier d''une exp\00E9rience optimale.')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138635640454751195)
,p_name=>'APEX.PWA.DIALOG.SHOW.INSTRUCTIONS'
,p_message_language=>'fr'
,p_message_text=>'Suivant'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138637260862751196)
,p_name=>'APEX.PWA.DIALOG.TITLE'
,p_message_language=>'fr'
,p_message_text=>'Installer cette application'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138622021860751191)
,p_name=>'APEX.PWA.INSTRUCTIONS'
,p_message_language=>'fr'
,p_message_text=>'Votre appareil ou votre navigateur ne semble pas prendre en charge l''installation des applications Web progressives pour le moment.'
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138617129628751190)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP1'
,p_message_language=>'fr'
,p_message_text=>unistr('1. Appuyer sur l''ic\00F4ne <strong>Partager</strong>')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138617282782751190)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP2'
,p_message_language=>'fr'
,p_message_text=>unistr('2. Faire d\00E9filer l''\00E9cran vers le bas et appuyer sur <strong>Ajouter \00E0 \00E9cran d''accueil</strong>')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138633621015751195)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP3'
,p_message_language=>'fr'
,p_message_text=>'3. Appuyer sur <strong style="color:#007AE1;">Ajouter</strong> pour confirmer'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138632718330751194)
,p_name=>'APEX.PWA.OFFLINE.BODY'
,p_message_language=>'fr'
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
unistr('    <p>Le probl\00E8me semble venir du r\00E9seau. V\00E9rifiez votre connexion et r\00E9essayez.</p>'),
unistr('    <button type="button">R\00E9essayer</button>'),
'</main>',
'',
'<script>',
'    document.querySelector("button").addEventListener("click", () => {',
'        window.location.reload();',
'    });',
'</script>'))
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138632683921751194)
,p_name=>'APEX.PWA.OFFLINE.TITLE'
,p_message_language=>'fr'
,p_message_text=>'Connexion impossible'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138679282359751208)
,p_name=>'APEX.PWA.PUSH.SUBSCRIPTION_FAILED'
,p_message_language=>'fr'
,p_message_text=>unistr('Cet appareil n''est pas parvenu \00E0 activer les notifications Push.')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138684729904751210)
,p_name=>'APEX.QUICK_PICK.GROUP_LABEL'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lections rapides pour %0')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138684646479751210)
,p_name=>'APEX.QUICK_PICK.LINK_ROLE'
,p_message_language=>'fr'
,p_message_text=>unistr('Lien de s\00E9lection rapide')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138658431357751202)
,p_name=>'APEX.RADIO.VISUALLY_HIDDEN_RADIO'
,p_message_language=>'fr'
,p_message_text=>unistr('Bouton radio masqu\00E9 visuellement')
,p_is_js_message=>true
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138602519552751185)
,p_name=>'APEX.RECORD_VIEW.TOOLBAR'
,p_message_language=>'fr'
,p_message_text=>'Vue monoligne'
,p_is_js_message=>true
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138785267621751240)
,p_name=>'APEX.REGION.CSSCALENDAR.ADD'
,p_message_language=>'fr'
,p_message_text=>'Ajouter'
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138730541901751223)
,p_name=>'APEX.REGION.CSSCALENDAR.ALL_DAY'
,p_message_language=>'fr'
,p_message_text=>unistr('Toute la journ\00E9e')
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138808168576751247)
,p_name=>'APEX.REGION.CSSCALENDAR.BUTTON.SENDEMAIL'
,p_message_language=>'fr'
,p_message_text=>'Envoyer une invitation'
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138807941945751247)
,p_name=>'APEX.REGION.CSSCALENDAR.CHOOSE_ACTION'
,p_message_language=>'fr'
,p_message_text=>'Options'
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138732334005751224)
,p_name=>'APEX.REGION.CSSCALENDAR.DAILY_ALLDAY'
,p_message_language=>'fr'
,p_message_text=>unistr('Vue quotidienne pour toute la journ\00E9e ')
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138732133942751224)
,p_name=>'APEX.REGION.CSSCALENDAR.DAILY_TIME_SPECIFIC'
,p_message_language=>'fr'
,p_message_text=>unistr('Vue quotidienne pour les donn\00E9es avec l''heure ')
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138776334841751237)
,p_name=>'APEX.REGION.CSSCALENDAR.DAY'
,p_message_language=>'fr'
,p_message_text=>'Jour'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138771341522751236)
,p_name=>'APEX.REGION.CSSCALENDAR.DESCRIPTION'
,p_message_language=>'fr'
,p_message_text=>'Description'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138654809732751201)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.CSV'
,p_message_language=>'fr'
,p_message_text=>'CSV'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138654624177751201)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.ICALENDAR'
,p_message_language=>'fr'
,p_message_text=>'iCal'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138654508806751201)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.PDF'
,p_message_language=>'fr'
,p_message_text=>'PDF'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138654717873751201)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.XML'
,p_message_language=>'fr'
,p_message_text=>'XML'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138654230559751201)
,p_name=>'APEX.REGION.CSSCALENDAR.ENDDATE'
,p_message_language=>'fr'
,p_message_text=>'Date de fin'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138654431953751201)
,p_name=>'APEX.REGION.CSSCALENDAR.EVENTNAME'
,p_message_language=>'fr'
,p_message_text=>unistr('Nom d''\00E9v\00E9nement')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138808051925751247)
,p_name=>'APEX.REGION.CSSCALENDAR.INVITATION'
,p_message_language=>'fr'
,p_message_text=>'Invitation'
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138776441648751237)
,p_name=>'APEX.REGION.CSSCALENDAR.LIST'
,p_message_language=>'fr'
,p_message_text=>'Liste'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138776160460751237)
,p_name=>'APEX.REGION.CSSCALENDAR.MONTH'
,p_message_language=>'fr'
,p_message_text=>'Mois'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138778769016751238)
,p_name=>'APEX.REGION.CSSCALENDAR.NEXT'
,p_message_language=>'fr'
,p_message_text=>'Suivant'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138792720233751242)
,p_name=>'APEX.REGION.CSSCALENDAR.NOEVENTS'
,p_message_language=>'fr'
,p_message_text=>unistr('Aucun \00E9v\00E9nement')
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138808311946751247)
,p_name=>'APEX.REGION.CSSCALENDAR.OPTION.FORM'
,p_message_language=>'fr'
,p_message_text=>unistr('Modifiez un \00E9v\00E9nement existant.')
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138808219035751247)
,p_name=>'APEX.REGION.CSSCALENDAR.OPTION.SEND'
,p_message_language=>'fr'
,p_message_text=>'Envoi d''une invitation par courriel.'
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138778808598751238)
,p_name=>'APEX.REGION.CSSCALENDAR.PREVIOUS'
,p_message_language=>'fr'
,p_message_text=>unistr('Pr\00E9c\00E9dent')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138786533844751240)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL'
,p_message_language=>'fr'
,p_message_text=>'Envoyer un courriel'
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138786324588751240)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.BUTTON'
,p_message_language=>'fr'
,p_message_text=>'Envoyer un courriel'
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138808997436751247)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.DIALOG.REQUIRED'
,p_message_language=>'fr'
,p_message_text=>'Tous les champs sont obligatoires.'
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138808840119751247)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.DIALOG.TITLE'
,p_message_language=>'fr'
,p_message_text=>'Envoyer une invitation'
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138807892337751247)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.SUBJECT'
,p_message_language=>'fr'
,p_message_text=>'Objet'
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138786477846751240)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.TO'
,p_message_language=>'fr'
,p_message_text=>'A'
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138654315775751201)
,p_name=>'APEX.REGION.CSSCALENDAR.STARTDATE'
,p_message_language=>'fr'
,p_message_text=>unistr('Date de d\00E9but')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138784522699751240)
,p_name=>'APEX.REGION.CSSCALENDAR.TABLEFORM'
,p_message_language=>'fr'
,p_message_text=>'Panneau sur %0'
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138731981354751224)
,p_name=>'APEX.REGION.CSSCALENDAR.TIME'
,p_message_language=>'fr'
,p_message_text=>'Heure'
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138778948473751238)
,p_name=>'APEX.REGION.CSSCALENDAR.TODAY'
,p_message_language=>'fr'
,p_message_text=>'Aujourd''hui'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138776983029751237)
,p_name=>'APEX.REGION.CSSCALENDAR.VIEW'
,p_message_language=>'fr'
,p_message_text=>'Visualiser'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138776296699751237)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEK'
,p_message_language=>'fr'
,p_message_text=>'Semaine'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138732268594751224)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEKLY_ALLDAY'
,p_message_language=>'fr'
,p_message_text=>unistr('Vue hebdomadaire pour toute la journ\00E9e')
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138732013918751224)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEKLY_TIME_SPECIFIC'
,p_message_language=>'fr'
,p_message_text=>unistr('Vue hebdomadaire pour les donn\00E9es avec l''heure')
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138776839762751237)
,p_name=>'APEX.REGION.CSSCALENDAR.YEAR'
,p_message_language=>'fr'
,p_message_text=>unistr('Ann\00E9e')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138776586889751237)
,p_name=>'APEX.REGION.JQM_COLUMN_TOGGLE.COLUMNS'
,p_message_language=>'fr'
,p_message_text=>'Colonnes...'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138776600610751237)
,p_name=>'APEX.REGION.JQM_COLUMN_TOGGLE.LOAD_MORE'
,p_message_language=>'fr'
,p_message_text=>unistr('Charger plus d''\00E9l\00E9ments...')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138706076401751216)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.BACK'
,p_message_language=>'fr'
,p_message_text=>'Retour'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138647581325751199)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.LOAD_MORE'
,p_message_language=>'fr'
,p_message_text=>unistr('Charger plus d''\00E9l\00E9ments...')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138649867983751199)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.SEARCH'
,p_message_language=>'fr'
,p_message_text=>'Rechercher...'
,p_version_scn=>2704761
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138776748342751237)
,p_name=>'APEX.REGION.JQM_REFLOW.LOAD_MORE'
,p_message_language=>'fr'
,p_message_text=>unistr('Charger plus d''\00E9l\00E9ments...')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138778671473751238)
,p_name=>'APEX.REGION.NOT_FOUND'
,p_message_language=>'fr'
,p_message_text=>unistr('ID de r\00E9gion %0 introuvable.')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138649728037751199)
,p_name=>'APEX.REGION.NO_DATA_FOUND_MESSAGE'
,p_message_language=>'fr'
,p_message_text=>unistr('Aucune donn\00E9e n''a \00E9t\00E9 trouv\00E9e')
,p_version_scn=>2704761
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138677216788751208)
,p_name=>'APEX.REGION.PAGINATION.RESET_ERROR'
,p_message_language=>'fr'
,p_message_text=>unistr('Impossible de r\00E9initialiser la pagination de r\00E9gion')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138640986264751197)
,p_name=>'APEX.REGION.PAGINATION.UNHANDLED_ERROR'
,p_message_language=>'fr'
,p_message_text=>unistr('Erreur lors de la d\00E9finition de pagination de r\00E9gion.')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138770769113751235)
,p_name=>'APEX.REGION.RESPONSIVE_TABLE.COLUMNS'
,p_message_language=>'fr'
,p_message_text=>'Colonnes...'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138625230277751192)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.LAZY_LOADING_INCOMPATIBLE'
,p_message_language=>'fr'
,p_message_text=>unistr('Le chargement lazy n''est pas compatible avec les emplacements de %0, qui est une r\00E9gion unique (partielle). D\00E9sactivez le chargement lazy pour la r\00E9gion ou d\00E9placez les composants d''emplacement vers une autre r\00E9gion.')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138620519214751191)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.NO_GROUP_TEMPLATE'
,p_message_language=>'fr'
,p_message_text=>unistr('Le mod\00E8le de groupe est manquant dans le composant de mod\00E8le pour %0.')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138615599601751189)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.TOO_MANY_ROWS'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 est une r\00E9gion unique (partielle) et a renvoy\00E9 plusieurs lignes.')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138778559839751238)
,p_name=>'APEX.REGION.TYPE_NOT_SUPPORTED'
,p_message_language=>'fr'
,p_message_text=>unistr('Le type de r\00E9gion %0 n''est pas pris en charge.')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138640836970751197)
,p_name=>'APEX.REGION.UNHANDLED_ERROR'
,p_message_language=>'fr'
,p_message_text=>unistr('Erreur lors de l''affichage de la r\00E9gion "#COMPONENT_NAME#".')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138711530273751218)
,p_name=>'APEX.REGION_COLUMN_IS_REQUIRED'
,p_message_language=>'fr'
,p_message_text=>'#COLUMN_HEADER# doit comporter une valeur.'
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138593149253751183)
,p_name=>'APEX.REPORT_QUERY.LAYOUT_REQUIRED'
,p_message_language=>'fr'
,p_message_text=>unistr('Vous devez indiquer une mise en page d''\00E9tat.')
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138807457009751246)
,p_name=>'APEX.RICH_TEXT_EDITOR.ACCESSIBLE_LABEL'
,p_message_language=>'fr'
,p_message_text=>unistr('%0, \00E9diteur de texte enrichi')
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138713614576751218)
,p_name=>'APEX.RICH_TEXT_EDITOR.MAXIMUM_LENGTH_EXCEEDED'
,p_message_language=>'fr'
,p_message_text=>unistr('Le balisage HTML de texte enrichi d\00E9passe la longueur maximale de l''\00E9l\00E9ment (r\00E9elle : %0, autoris\00E9e : %1 caract\00E8res)')
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138623038899751191)
,p_name=>'APEX.RTE.READ_ONLY_RICH_TEXT_EDITOR'
,p_message_language=>'fr'
,p_message_text=>'Editeur de texte enrichi en lecture seule'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138622996580751191)
,p_name=>'APEX.RTE.RICH_TEXT_EDITOR'
,p_message_language=>'fr'
,p_message_text=>'Editeur de texte enrichi'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138622740268751191)
,p_name=>'APEX.RTE.TOOLBAR_ALIGNMENT'
,p_message_language=>'fr'
,p_message_text=>'Alignement'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138622858291751191)
,p_name=>'APEX.RTE.TOOLBAR_EXTRAS'
,p_message_language=>'fr'
,p_message_text=>unistr('Suppl\00E9mentaires')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138622524555751191)
,p_name=>'APEX.RTE.TOOLBAR_FONT'
,p_message_language=>'fr'
,p_message_text=>'Police'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138622406428751191)
,p_name=>'APEX.RTE.TOOLBAR_FORMATTING'
,p_message_language=>'fr'
,p_message_text=>'Formatage'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138622602476751191)
,p_name=>'APEX.RTE.TOOLBAR_LISTS'
,p_message_language=>'fr'
,p_message_text=>'Listes'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138775717848751237)
,p_name=>'APEX.RV.DELETE'
,p_message_language=>'fr'
,p_message_text=>'Supprimer'
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138768200989751235)
,p_name=>'APEX.RV.DUPLICATE'
,p_message_language=>'fr'
,p_message_text=>'Dupliquer'
,p_is_js_message=>true
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138766588712751234)
,p_name=>'APEX.RV.EXCLUDE_HIDDEN'
,p_message_language=>'fr'
,p_message_text=>unistr('Colonnes affich\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138766493318751234)
,p_name=>'APEX.RV.EXCLUDE_NULL'
,p_message_language=>'fr'
,p_message_text=>'Exclure les valeurs NULL'
,p_is_js_message=>true
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138775893137751237)
,p_name=>'APEX.RV.INSERT'
,p_message_language=>'fr'
,p_message_text=>'Ajouter'
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138730156874751223)
,p_name=>'APEX.RV.MOVE_DOWN'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9placer vers le bas')
,p_is_js_message=>true
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138730233070751223)
,p_name=>'APEX.RV.MOVE_UP'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9placer vers le haut')
,p_is_js_message=>true
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138766200580751234)
,p_name=>'APEX.RV.NEXT_RECORD'
,p_message_language=>'fr'
,p_message_text=>'Suivant'
,p_is_js_message=>true
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138766840607751234)
,p_name=>'APEX.RV.NOT_GROUPED_LABEL'
,p_message_language=>'fr'
,p_message_text=>'Autres colonnes'
,p_is_js_message=>true
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138766350951751234)
,p_name=>'APEX.RV.PREV_RECORD'
,p_message_language=>'fr'
,p_message_text=>unistr('Pr\00E9c\00E9dent')
,p_is_js_message=>true
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138766684567751234)
,p_name=>'APEX.RV.REC_X'
,p_message_language=>'fr'
,p_message_text=>'Ligne %0'
,p_is_js_message=>true
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138766708916751234)
,p_name=>'APEX.RV.REC_XY'
,p_message_language=>'fr'
,p_message_text=>'Ligne %0 sur %1'
,p_is_js_message=>true
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138768346371751235)
,p_name=>'APEX.RV.REFRESH'
,p_message_language=>'fr'
,p_message_text=>unistr('R\00E9g\00E9n\00E9rer')
,p_is_js_message=>true
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138768455895751235)
,p_name=>'APEX.RV.REVERT'
,p_message_language=>'fr'
,p_message_text=>unistr('R\00E9tablir les modifications')
,p_is_js_message=>true
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138766112221751234)
,p_name=>'APEX.RV.SETTINGS_MENU'
,p_message_language=>'fr'
,p_message_text=>unistr('Param\00E8tres')
,p_is_js_message=>true
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138725359879751222)
,p_name=>'APEX.SAMPLE_FORMAT'
,p_message_language=>'fr'
,p_message_text=>'Par exemple, %0'
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138729613489751223)
,p_name=>'APEX.SAMPLE_FORMAT_SHORT'
,p_message_language=>'fr'
,p_message_text=>'Exemple : %0'
,p_is_js_message=>true
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138642350218751197)
,p_name=>'APEX.SEARCH.1_RESULT_FOUND'
,p_message_language=>'fr'
,p_message_text=>unistr('1 r\00E9sultat')
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138639424944751196)
,p_name=>'APEX.SEARCH.N_RESULTS_FOUND'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 r\00E9sultats')
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138691205569751212)
,p_name=>'APEX.SEARCH.PAGINATION'
,p_message_language=>'fr'
,p_message_text=>'Pagination'
,p_is_js_message=>true
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138691368798751212)
,p_name=>'APEX.SEARCH.RESULTS_X_TO_Y'
,p_message_language=>'fr'
,p_message_text=>unistr('R\00E9sultats, %0 \00E0 %1')
,p_is_js_message=>true
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138587060172751181)
,p_name=>'APEX.SESSION.ALERT.CREATE_NEW'
,p_message_language=>'fr'
,p_message_text=>'Se reconnecter'
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138586985542751181)
,p_name=>'APEX.SESSION.ALERT.EXPIRED'
,p_message_language=>'fr'
,p_message_text=>'Votre session a pris fin'
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138587123341751181)
,p_name=>'APEX.SESSION.ALERT.EXTEND'
,p_message_language=>'fr'
,p_message_text=>'Prolonger'
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138586729744751181)
,p_name=>'APEX.SESSION.ALERT.IDLE_WARN'
,p_message_language=>'fr'
,p_message_text=>unistr('Votre session prendra fin \00E0 %0. Voulez-vous la prolonger ?')
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138586825338751181)
,p_name=>'APEX.SESSION.ALERT.MAX_WARN'
,p_message_language=>'fr'
,p_message_text=>unistr('Votre session prendra fin \00E0 %0 et ne peut pas \00EAtre prolong\00E9e. Enregistrez votre travail pour \00E9viter de perdre des donn\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138786119125751240)
,p_name=>'APEX.SESSION.DB_SESSION_CLEANUP.UNHANDLED_ERROR'
,p_message_language=>'fr'
,p_message_text=>unistr('Erreur lors du traitement du code de nettoyage de session de base de donn\00E9es.')
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138675864789751207)
,p_name=>'APEX.SESSION.DB_SESSION_INIT.UNHANDLED_ERROR'
,p_message_language=>'fr'
,p_message_text=>unistr('Erreur lors du traitement du code de configuration de session de base de donn\00E9es.')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138646262374751198)
,p_name=>'APEX.SESSION.EXPIRED'
,p_message_language=>'fr'
,p_message_text=>'Votre session a pris fin.'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138785363123751240)
,p_name=>'APEX.SESSION.EXPIRED.CLOSE_DIALOG'
,p_message_language=>'fr'
,p_message_text=>unistr('Fermez cette bo\00EEte de dialogue et cliquez sur le bouton Recharger de votre navigateur pour obtenir une nouvelle session.')
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138804279799751245)
,p_name=>'APEX.SESSION.EXPIRED.NEW_SESSION'
,p_message_language=>'fr'
,p_message_text=>unistr('<a href="%0">Connectez-vous</a> \00E0 nouveau pour cr\00E9er une session.')
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138688554702751211)
,p_name=>'APEX.SESSION.NOT_VALID'
,p_message_language=>'fr'
,p_message_text=>'Session non valide'
,p_version_scn=>2704767
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138731622391751224)
,p_name=>'APEX.SESSION.RAS.NO_DYNAMIC_ROLES'
,p_message_language=>'fr'
,p_message_text=>unistr('Aucun r\00F4le dynamique n''a pu \00EAtre activ\00E9 dans la session Real Application Security pour l''utilisateur "%0".')
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138673786325751206)
,p_name=>'APEX.SESSION.UNHANDLED_ERROR'
,p_message_language=>'fr'
,p_message_text=>unistr('ERR-99900 Impossible de cr\00E9er l''ID de session unique : %0')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138602893947751185)
,p_name=>'APEX.SESSION_STATE.CLOB_NOT_ALLOWED'
,p_message_language=>'fr'
,p_message_text=>unistr('Le type de donn\00E9es d''\00E9tat de session CLOB n''est pas autoris\00E9 pour l''\00E9l\00E9ment %0.')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138622221207751191)
,p_name=>'APEX.SESSION_STATE.CLOB_SUBSTITUTION_NOT_ALLOWED'
,p_message_language=>'fr'
,p_message_text=>unistr('La substitution d''\00E9l\00E9ments du type de donn\00E9es d''\00E9tat de session CLOB n''est pas prise en charge.')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138691015176751212)
,p_name=>'APEX.SESSION_STATE.ITEM_VALUE_PROTECTION'
,p_message_language=>'fr'
,p_message_text=>unistr('Violation de protection de l''\00E9tat de session. Cause possible : modification manuelle de l''\00E9l\00E9ment de page prot\00E9g\00E9 %0. Si vous n''\00EAtes pas s\00FBr de la cause de l''erreur, contactez l''administrateur de l''application pour obtenir de l''aide.')
,p_version_scn=>2704768
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138812226470751248)
,p_name=>'APEX.SESSION_STATE.PAGE_PROTECTION'
,p_message_language=>'fr'
,p_message_text=>unistr('Violation de protection de page. Cause possible : soumission d''une page dont le chargement n''est pas encore termin\00E9 ou modification manuelle d''\00E9l\00E9ments de page prot\00E9g\00E9s. Pour obtenir de l''aide, contactez l''administrateur de l''application.')
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138811365944751248)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.NO_SPECIAL_CHAR'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 contient l''un des caract\00E8res non valides suivants : &<>"/;,*|=% ou --')
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138811477844751248)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.NO_SPECIAL_CHAR_NL'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 contient l''un des caract\00E8res non valides suivants : &<>"/;,*|=% ou --, ou un saut de ligne.')
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138811199916751248)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.US_ONLY'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 contient des caract\00E8res sp\00E9ciaux. Seuls les caract\00E8res a-Z, 0-9 et les espaces sont autoris\00E9s.')
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138811234025751248)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 contient <, > ou ", qui ne sont pas des caract\00E8res valides.')
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138648656492751199)
,p_name=>'APEX.SESSION_STATE.SSP_CHECKSUM_MISSING'
,p_message_language=>'fr'
,p_message_text=>unistr('Aucun checksum n''a \00E9t\00E9 fourni au traitement de l''affichage d''une page exigeant un checksum lorsqu''une ou plusieurs demandes, suppressions de cache ou valeurs d''argument sont transmises en tant que param\00E8tres.')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138685938758751210)
,p_name=>'APEX.SESSION_STATE.SSP_VIOLATION'
,p_message_language=>'fr'
,p_message_text=>unistr('Violation de protection du statut de session. Cause possible : modification manuelle d''une URL contenant un checksum ou utilisation d''un lien dont le checksum est incorrect ou absent. Si vous n''\00EAtes pas s\00FBr de la cause de l''erreur, contactez votre ad')
||'ministrateur pour obtenir de l''aide.'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138767552692751234)
,p_name=>'APEX.SET_HIGH_CONTRAST_MODE_OFF'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9sactiver le mode de contraste \00E9lev\00E9')
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138767675307751235)
,p_name=>'APEX.SET_HIGH_CONTRAST_MODE_ON'
,p_message_language=>'fr'
,p_message_text=>unistr('Activer le mode de contraste \00E9lev\00E9')
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138632061787751194)
,p_name=>'APEX.SET_VALUE_ERROR'
,p_message_language=>'fr'
,p_message_text=>unistr('Impossible de mettre \00E0 jour le param\00E8tre d''application %0 car il est abonn\00E9 \00E0 partir d''une autre application.')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138682333671751209)
,p_name=>'APEX.SHUTTLE.CONTROL_BOTTOM'
,p_message_language=>'fr'
,p_message_text=>'Bas'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138682567954751209)
,p_name=>'APEX.SHUTTLE.CONTROL_DOWN'
,p_message_language=>'fr'
,p_message_text=>'Bas'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138682605150751209)
,p_name=>'APEX.SHUTTLE.CONTROL_MOVE'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9placer')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138682765347751209)
,p_name=>'APEX.SHUTTLE.CONTROL_MOVE_ALL'
,p_message_language=>'fr'
,p_message_text=>unistr('Tout d\00E9placer')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138682875656751209)
,p_name=>'APEX.SHUTTLE.CONTROL_REMOVE'
,p_message_language=>'fr'
,p_message_text=>'Enlever'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138682926910751209)
,p_name=>'APEX.SHUTTLE.CONTROL_REMOVE_ALL'
,p_message_language=>'fr'
,p_message_text=>'Tout enlever'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138683027384751209)
,p_name=>'APEX.SHUTTLE.CONTROL_RESET'
,p_message_language=>'fr'
,p_message_text=>unistr('R\00E9initialiser')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138682259231751209)
,p_name=>'APEX.SHUTTLE.CONTROL_TOP'
,p_message_language=>'fr'
,p_message_text=>'Haut'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138682460027751209)
,p_name=>'APEX.SHUTTLE.CONTROL_UP'
,p_message_language=>'fr'
,p_message_text=>'Haut'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138794093479751242)
,p_name=>'APEX.SINCE.SHORT.DAYS_AGO'
,p_message_language=>'fr'
,p_message_text=>'%0d'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138794777339751243)
,p_name=>'APEX.SINCE.SHORT.DAYS_FROM_NOW'
,p_message_language=>'fr'
,p_message_text=>'dans %0 jours(s)'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138793922278751242)
,p_name=>'APEX.SINCE.SHORT.HOURS_AGO'
,p_message_language=>'fr'
,p_message_text=>'%0h'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138794816043751243)
,p_name=>'APEX.SINCE.SHORT.HOURS_FROM_NOW'
,p_message_language=>'fr'
,p_message_text=>'dans %0 h'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138793793879751242)
,p_name=>'APEX.SINCE.SHORT.MINUTES_AGO'
,p_message_language=>'fr'
,p_message_text=>'%0m'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138794946724751243)
,p_name=>'APEX.SINCE.SHORT.MINUTES_FROM_NOW'
,p_message_language=>'fr'
,p_message_text=>'dans %0 min'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138794306280751242)
,p_name=>'APEX.SINCE.SHORT.MONTHS_AGO'
,p_message_language=>'fr'
,p_message_text=>'%0 mois'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138794589241751243)
,p_name=>'APEX.SINCE.SHORT.MONTHS_FROM_NOW'
,p_message_language=>'fr'
,p_message_text=>'dans %0 mois'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138793883789751242)
,p_name=>'APEX.SINCE.SHORT.SECONDS_AGO'
,p_message_language=>'fr'
,p_message_text=>'%0s'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138794680699751243)
,p_name=>'APEX.SINCE.SHORT.SECONDS_FROM_NOW'
,p_message_language=>'fr'
,p_message_text=>'dans %0 s'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138794188248751242)
,p_name=>'APEX.SINCE.SHORT.WEEKS_AGO'
,p_message_language=>'fr'
,p_message_text=>'%0w'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138795083500751243)
,p_name=>'APEX.SINCE.SHORT.WEEKS_FROM_NOW'
,p_message_language=>'fr'
,p_message_text=>'dans %0 semaine(s)'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138794237880751242)
,p_name=>'APEX.SINCE.SHORT.YEARS_AGO'
,p_message_language=>'fr'
,p_message_text=>'%0y'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138794401621751242)
,p_name=>'APEX.SINCE.SHORT.YEARS_FROM_NOW'
,p_message_language=>'fr'
,p_message_text=>'dans %0 an(s)'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138595351427751183)
,p_name=>'APEX.SPATIAL.GEOMETRY.LINE'
,p_message_language=>'fr'
,p_message_text=>'[Ligne]'
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138595928877751183)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTILINE'
,p_message_language=>'fr'
,p_message_text=>'[Plusieurs lignes]'
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138595605912751183)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTIPOINT'
,p_message_language=>'fr'
,p_message_text=>'[Plusieurs points]'
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138596102661751183)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTIPOLYGON'
,p_message_language=>'fr'
,p_message_text=>'[Plusieurs polygones]'
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138596236351751184)
,p_name=>'APEX.SPATIAL.GEOMETRY.OTHER'
,p_message_language=>'fr'
,p_message_text=>unistr('[Objet de g\00E9om\00E9trie]')
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138595237715751183)
,p_name=>'APEX.SPATIAL.GEOMETRY.POINT'
,p_message_language=>'fr'
,p_message_text=>'[Point (%0,%1)]'
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138595576625751183)
,p_name=>'APEX.SPATIAL.GEOMETRY.POLYGON'
,p_message_language=>'fr'
,p_message_text=>'[Polygone]'
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138594777029751183)
,p_name=>'APEX.SPLITTER.COLLAPSED_REGION'
,p_message_language=>'fr'
,p_message_text=>unistr('R\00E9gion r\00E9duite : %0')
,p_is_js_message=>true
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138709848417751217)
,p_name=>'APEX.SPLITTER.COLLAPSE_TEXT'
,p_message_language=>'fr'
,p_message_text=>unistr('R\00E9duire')
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138593765097751183)
,p_name=>'APEX.SPLITTER.HORIZ_CANNOT_LEFT_RIGHT'
,p_message_language=>'fr'
,p_message_text=>unistr('Un r\00E9partiteur horizontal ne peut pas \00EAtre d\00E9plac\00E9 vers la gauche ou la droite')
,p_is_js_message=>true
,p_version_scn=>2704753
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138593967603751183)
,p_name=>'APEX.SPLITTER.MAX_SIZE_REACHED'
,p_message_language=>'fr'
,p_message_text=>'Taille maximale (%0 px) atteinte'
,p_is_js_message=>true
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138594908353751183)
,p_name=>'APEX.SPLITTER.MIN_SIZE_REACHED'
,p_message_language=>'fr'
,p_message_text=>'Taille minimale (%0 px) atteinte'
,p_is_js_message=>true
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138594843504751183)
,p_name=>'APEX.SPLITTER.REGION_IS_COLLAPSED'
,p_message_language=>'fr'
,p_message_text=>unistr('La r\00E9gion est r\00E9duite')
,p_is_js_message=>true
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138594605751751183)
,p_name=>'APEX.SPLITTER.REGION_IS_RESTORED'
,p_message_language=>'fr'
,p_message_text=>unistr('La r\00E9gion est restaur\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138594370614751183)
,p_name=>'APEX.SPLITTER.RESIZED_TO'
,p_message_language=>'fr'
,p_message_text=>unistr('Redimensionn\00E9 sur %0 px')
,p_is_js_message=>true
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138594552795751183)
,p_name=>'APEX.SPLITTER.RESTORED_REGION'
,p_message_language=>'fr'
,p_message_text=>unistr('R\00E9gion restaur\00E9e : %0')
,p_is_js_message=>true
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138709782451751217)
,p_name=>'APEX.SPLITTER.RESTORE_TEXT'
,p_message_language=>'fr'
,p_message_text=>'Restaurer'
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138593848653751183)
,p_name=>'APEX.SPLITTER.VERTICAL_CANNOT_UP_DOWN'
,p_message_language=>'fr'
,p_message_text=>unistr('Un r\00E9partiteur vertical ne peut pas \00EAtre d\00E9plac\00E9 vers le haut ou le bas')
,p_is_js_message=>true
,p_version_scn=>2704753
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138759293534751232)
,p_name=>'APEX.STAR_RATING.CLEAR_RATING'
,p_message_language=>'fr'
,p_message_text=>unistr('Effacer l''\00E9valuation')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138749168351751229)
,p_name=>'APEX.STAR_RATING.INVALID_RATING_RANGE'
,p_message_language=>'fr'
,p_message_text=>unistr('La valeur %0 ne figure pas dans la plage d''\00E9valuation valide comprise entre 1 et %1')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138749284851751229)
,p_name=>'APEX.STAR_RATING.IS_NOT_NUMERIC'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 n''est pas une valeur num\00E9rique')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138745349595751228)
,p_name=>'APEX.SUCCESS_MESSAGE_HEADING'
,p_message_language=>'fr'
,p_message_text=>unistr('Message de succ\00E8s')
,p_is_js_message=>true
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138807150317751246)
,p_name=>'APEX.TABS.NEXT'
,p_message_language=>'fr'
,p_message_text=>'Suivant'
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138807086335751246)
,p_name=>'APEX.TABS.PREVIOUS'
,p_message_language=>'fr'
,p_message_text=>unistr('Pr\00E9c\00E9dent')
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138717282998751219)
,p_name=>'APEX.TASK.ACTION.DATA_NOT_FOUND'
,p_message_language=>'fr'
,p_message_text=>unistr('Le syst\00E8me d''enregistrement(s) associ\00E9 \00E0 l''instance de t\00E2che est introuvable')
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138725588165751222)
,p_name=>'APEX.TASK.ACTION.ERROR'
,p_message_language=>'fr'
,p_message_text=>unistr('Echec de l''ex\00E9cution de l''action de t\00E2che %0 : la t\00E2che est d\00E9finie sur l''\00E9tat En erreur. Consultez le code d''action de t\00E2che')
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138605713347751186)
,p_name=>'APEX.TASK.ADD_COMMENT_NOT_AUTHORIZED'
,p_message_language=>'fr'
,p_message_text=>unistr('Ajouter un commentaire : non autoris\00E9')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138605019531751186)
,p_name=>'APEX.TASK.ALREADY_ASSIGNED'
,p_message_language=>'fr'
,p_message_text=>unistr('T\00E2che d\00E9j\00E0 affect\00E9e')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138598478266751184)
,p_name=>'APEX.TASK.ASSIGNED_TO_USER'
,p_message_language=>'fr'
,p_message_text=>unistr('Affect\00E9 \00E0 %0')
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138604793729751186)
,p_name=>'APEX.TASK.CANCEL_TASK_NOT_AUTHORIZED'
,p_message_language=>'fr'
,p_message_text=>unistr('Annuler la t\00E2che : non autoris\00E9')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138620309972751191)
,p_name=>'APEX.TASK.CANNOT_REMOVE_OWNER'
,p_message_language=>'fr'
,p_message_text=>unistr('Impossible d''enlever le propri\00E9taire r\00E9el de cette t\00E2che. D\00E9l\00E9guez la t\00E2che \00E0 un autre participant avant de retenter cette op\00E9ration.')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138604331028751186)
,p_name=>'APEX.TASK.CLAIM_TASK_NOT_AUTHORIZED'
,p_message_language=>'fr'
,p_message_text=>unistr('Demander la t\00E2che : non autoris\00E9')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138604453469751186)
,p_name=>'APEX.TASK.COMPLETE_TASK_NOT_AUTHORIZED'
,p_message_language=>'fr'
,p_message_text=>unistr('Terminer la t\00E2che : non autoris\00E9')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138604574663751186)
,p_name=>'APEX.TASK.DELEGATE_TASK_NOT_AUTHORIZED'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9l\00E9guer la t\00E2che : non autoris\00E9')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138602961428751185)
,p_name=>'APEX.TASK.DUE_DATE_IN_PAST'
,p_message_language=>'fr'
,p_message_text=>unistr('La date d''\00E9ch\00E9ance de la t\00E2che ne peut pas \00EAtre une date pass\00E9e.')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138598207957751184)
,p_name=>'APEX.TASK.DUE_SINCE'
,p_message_language=>'fr'
,p_message_text=>unistr('Ech\00E9ance : %0')
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138598681877751184)
,p_name=>'APEX.TASK.EVENT.ACTION.ERROR_MESSAGE'
,p_message_language=>'fr'
,p_message_text=>unistr('Echec de l''action de t\00E2che %1. Message d''erreur : %0')
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138598316300751184)
,p_name=>'APEX.TASK.EVENT.ACTION.FAILURE'
,p_message_language=>'fr'
,p_message_text=>'Echec'
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138597936929751184)
,p_name=>'APEX.TASK.EVENT.ACTION.SUCCESS'
,p_message_language=>'fr'
,p_message_text=>unistr('Succ\00E8s')
,p_is_js_message=>true
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138598121459751184)
,p_name=>'APEX.TASK.EVENT.ACTION.SUCCESS_MESSAGE'
,p_message_language=>'fr'
,p_message_text=>unistr('Action %1 termin\00E9e avec le message %0')
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138601450546751185)
,p_name=>'APEX.TASK.EVENT.BEFORE_EXPIRE'
,p_message_language=>'fr'
,p_message_text=>'Avant expiration'
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138627069283751193)
,p_name=>'APEX.TASK.EVENT.CANCEL'
,p_message_language=>'fr'
,p_message_text=>'Annuler'
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138626595980751192)
,p_name=>'APEX.TASK.EVENT.CANCEL_MESSAGE'
,p_message_language=>'fr'
,p_message_text=>unistr('T\00E2che annul\00E9e')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138627108909751193)
,p_name=>'APEX.TASK.EVENT.CANCEL_NOT_ALLOWED'
,p_message_language=>'fr'
,p_message_text=>unistr('Le participant n''est pas autoris\00E9 \00E0 annuler la t\00E2che')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138626418125751192)
,p_name=>'APEX.TASK.EVENT.CLAIM'
,p_message_language=>'fr'
,p_message_text=>'Demander'
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138626834214751193)
,p_name=>'APEX.TASK.EVENT.CLAIM_ALREADY_CLAIMED'
,p_message_language=>'fr'
,p_message_text=>unistr('La t\00E2che a d\00E9j\00E0 \00E9t\00E9 demand\00E9e par un autre utilisateur ou le participant n''est pas habilit\00E9 \00E0 la demander')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138626646033751192)
,p_name=>'APEX.TASK.EVENT.CLAIM_MESSAGE'
,p_message_language=>'fr'
,p_message_text=>unistr('T\00E2che demand\00E9e par %0')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138727779903751223)
,p_name=>'APEX.TASK.EVENT.COMPLETE'
,p_message_language=>'fr'
,p_message_text=>'Terminer'
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138626209365751192)
,p_name=>'APEX.TASK.EVENT.COMPLETE_MESSAGE'
,p_message_language=>'fr'
,p_message_text=>unistr('T\00E2che termin\00E9e avec le r\00E9sultat %0')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138627509876751193)
,p_name=>'APEX.TASK.EVENT.COMPLETE_NOT_ALLOWED'
,p_message_language=>'fr'
,p_message_text=>unistr('La t\00E2che n''est pas affect\00E9e ou le participant n''est pas autoris\00E9 \00E0 la terminer')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138587997142751181)
,p_name=>'APEX.TASK.EVENT.COMPLETE_NO_OUTCOME'
,p_message_language=>'fr'
,p_message_text=>unistr('T\00E2che termin\00E9e sans r\00E9sultat')
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138727891059751223)
,p_name=>'APEX.TASK.EVENT.CREATE'
,p_message_language=>'fr'
,p_message_text=>unistr('Cr\00E9er')
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138620729083751191)
,p_name=>'APEX.TASK.EVENT.CREATE_MESSAGE'
,p_message_language=>'fr'
,p_message_text=>unistr('T\00E2che cr\00E9\00E9e avec l''ID %0')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138727995356751223)
,p_name=>'APEX.TASK.EVENT.DELEGATE'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9l\00E9guer')
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138626390592751192)
,p_name=>'APEX.TASK.EVENT.DELEGATE_MESSAGE'
,p_message_language=>'fr'
,p_message_text=>unistr('T\00E2che d\00E9l\00E9gu\00E9e au propri\00E9taire potentiel %0')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138626917469751193)
,p_name=>'APEX.TASK.EVENT.DELEGATE_NOT_ALLOWED'
,p_message_language=>'fr'
,p_message_text=>unistr('Le participant n''est pas habilit\00E9 ou le nouveau participant n''est pas propri\00E9taire potentiel de la t\00E2che')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138600012949751185)
,p_name=>'APEX.TASK.EVENT.EXPIRE'
,p_message_language=>'fr'
,p_message_text=>'Faire expirer'
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138601180695751185)
,p_name=>'APEX.TASK.EVENT.EXPIRED_MESSAGE'
,p_message_language=>'fr'
,p_message_text=>unistr('T\00E2che arriv\00E9e \00E0 expiration.')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138728041116751223)
,p_name=>'APEX.TASK.EVENT.FAIL'
,p_message_language=>'fr'
,p_message_text=>unistr('Faire \00E9chouer')
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138596788142751184)
,p_name=>'APEX.TASK.EVENT.INFO_REQUEST.NOT_ALLOWED'
,p_message_language=>'fr'
,p_message_text=>unistr('La t\00E2che n''est pas affect\00E9e ou le participant n''est pas autoris\00E9 \00E0 demander des informations \00E0 son sujet')
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138596927296751184)
,p_name=>'APEX.TASK.EVENT.INFO_SUBMIT.NOT_ALLOWED'
,p_message_language=>'fr'
,p_message_text=>unistr('Aucune information n''a \00E9t\00E9 demand\00E9e pour la t\00E2che ou le participant n''est pas autoris\00E9 \00E0 soumettre des informations pour la t\00E2che.')
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138600536017751185)
,p_name=>'APEX.TASK.EVENT.MAXRENEW_EXPIRED_MESSAGE'
,p_message_language=>'fr'
,p_message_text=>unistr('Expiration de la t\00E2che car le nombre maximal de renouvellements (%0) a \00E9t\00E9 atteint.')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138627805460751193)
,p_name=>'APEX.TASK.EVENT.NOT_ALLOWED_BUSINESS_ADMIN'
,p_message_language=>'fr'
,p_message_text=>unistr('La t\00E2che ne pr\00E9sente pas le bon \00E9tat ou le participant n''en est pas l''administrateur m\00E9tier')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138627932510751193)
,p_name=>'APEX.TASK.EVENT.NOT_APPLICABLE'
,p_message_language=>'fr'
,p_message_text=>unistr('L''op\00E9ration %0 est inconnue ou n''est pas applicable \00E0 la t\00E2che')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138728150180751223)
,p_name=>'APEX.TASK.EVENT.RELEASE'
,p_message_language=>'fr'
,p_message_text=>unistr('Lib\00E9rer')
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138713886218751218)
,p_name=>'APEX.TASK.EVENT.RELEASE_MESSAGE'
,p_message_language=>'fr'
,p_message_text=>unistr('T\00E2che lib\00E9r\00E9e. Elle peut d\00E9sormais \00EAtre demand\00E9e par d''autres utilisateurs')
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138606733421751187)
,p_name=>'APEX.TASK.EVENT.RELEASE_NOT_ALLOWED'
,p_message_language=>'fr'
,p_message_text=>unistr('La lib\00E9ration de t\00E2che n''est pas autoris\00E9e : l''utilisateur n''est pas propri\00E9taire de la t\00E2che')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138623723497751192)
,p_name=>'APEX.TASK.EVENT.REMOVE_OWNER'
,p_message_language=>'fr'
,p_message_text=>unistr('Supprimer le propri\00E9taire')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138623961515751192)
,p_name=>'APEX.TASK.EVENT.REMOVE_OWNER_MESSAGE'
,p_message_language=>'fr'
,p_message_text=>unistr('Le participant %0 a \00E9t\00E9 enlev\00E9 de la t\00E2che')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138601369237751185)
,p_name=>'APEX.TASK.EVENT.RENEW'
,p_message_language=>'fr'
,p_message_text=>'Renouveler'
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138600237728751185)
,p_name=>'APEX.TASK.EVENT.RENEW_EXPIRED_MESSAGE'
,p_message_language=>'fr'
,p_message_text=>unistr('T\00E2che renouvel\00E9e avec l''ID %0, nombre maximal de renouvellements restants avant expiration : %1.')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138601227360751185)
,p_name=>'APEX.TASK.EVENT.RENEW_MESSAGE'
,p_message_language=>'fr'
,p_message_text=>unistr('ID de t\00E2che %0 renouvel\00E9e avec l''ID de t\00E2che %1')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138597231952751184)
,p_name=>'APEX.TASK.EVENT.REQUEST_INFO'
,p_message_language=>'fr'
,p_message_text=>'Demander des informations'
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138597167376751184)
,p_name=>'APEX.TASK.EVENT.REQUEST_INFO_MESSAGE'
,p_message_language=>'fr'
,p_message_text=>'Demande de %0 pour plus d''informations : %1'
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138595041795751183)
,p_name=>'APEX.TASK.EVENT.SET_INITIATOR_CAN_COMPLETE_MESSAGE'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9finir l''option L''initiateur est autoris\00E9 \00E0 terminer sur %0')
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138597380180751184)
,p_name=>'APEX.TASK.EVENT.SUBMIT_INFO'
,p_message_language=>'fr'
,p_message_text=>'Soumettre les informations'
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138597022815751184)
,p_name=>'APEX.TASK.EVENT.SUBMIT_INFO_MESSAGE'
,p_message_language=>'fr'
,p_message_text=>unistr('Informations demand\00E9es soumises \00E0 %0 : %1')
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138728209983751223)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT'
,p_message_language=>'fr'
,p_message_text=>unistr('Mettre \00E0 jour le commentaire')
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138624777221751192)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT_MESSAGE'
,p_message_language=>'fr'
,p_message_text=>'Ajouter un commentaire : %0'
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138627693862751193)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT_NOT_ALLOWED'
,p_message_language=>'fr'
,p_message_text=>unistr('L''\00E9tat de la t\00E2che n''autorise pas les commentaires')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138634937817751195)
,p_name=>'APEX.TASK.EVENT.UPDATE_DUE_DATE_MESSAGE'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9finir la date d''\00E9ch\00E9ance de la t\00E2che sur %0')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138593060233751183)
,p_name=>'APEX.TASK.EVENT.UPDATE_DUE_ON'
,p_message_language=>'fr'
,p_message_text=>unistr('Mettre \00E0 jour la date d''\00E9ch\00E9ance')
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138728303679751223)
,p_name=>'APEX.TASK.EVENT.UPDATE_OWNER'
,p_message_language=>'fr'
,p_message_text=>unistr('Mettre \00E0 jour le propri\00E9taire')
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138626019345751192)
,p_name=>'APEX.TASK.EVENT.UPDATE_OWNER_MESSAGE'
,p_message_language=>'fr'
,p_message_text=>unistr('Ajouter le propri\00E9taire potentiel %0 aux participants de la t\00E2che')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138625198740751192)
,p_name=>'APEX.TASK.EVENT.UPDATE_PARAM'
,p_message_language=>'fr'
,p_message_text=>unistr('Mettre \00E0 jour les param\00E8tres')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138728463112751223)
,p_name=>'APEX.TASK.EVENT.UPDATE_PRIORITY'
,p_message_language=>'fr'
,p_message_text=>unistr('Mettre \00E0 jour la priorit\00E9')
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138626779905751193)
,p_name=>'APEX.TASK.EVENT.UPDATE_PRIORITY_MESSAGE'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9finir la priorit\00E9 de la t\00E2che sur %0')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138624014876751192)
,p_name=>'APEX.TASK.EVENT.UPD_PARAMETER_MESSAGE'
,p_message_language=>'fr'
,p_message_text=>unistr('Le param\00E8tre "%0" a \00E9t\00E9 mis \00E0 jour : "%1" a \00E9t\00E9 remplac\00E9 par "%2".')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138607575711751187)
,p_name=>'APEX.TASK.EVENT.WF_CANCEL_MESSAGE'
,p_message_language=>'fr'
,p_message_text=>unistr('La t\00E2che a \00E9t\00E9 annul\00E9e car l''instance de workflow correspondante a pris fin.')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138604636236751186)
,p_name=>'APEX.TASK.FORWARD_TASK_NOT_AUTHORIZED'
,p_message_language=>'fr'
,p_message_text=>unistr('Transf\00E9rer la t\00E2che : non autoris\00E9')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138598086269751184)
,p_name=>'APEX.TASK.INITIATED_BY_USER_SINCE'
,p_message_language=>'fr'
,p_message_text=>unistr('Lanc\00E9 par %0 %1')
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138606936448751187)
,p_name=>'APEX.TASK.INTERNAL_ERROR'
,p_message_language=>'fr'
,p_message_text=>'Une erreur interne inattendue s''est produite'
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138605293696751186)
,p_name=>'APEX.TASK.NOT_APPLICABLE'
,p_message_language=>'fr'
,p_message_text=>unistr('Op\00E9ration de t\00E2che non applicable')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138630861150751194)
,p_name=>'APEX.TASK.NO_POTENTIAL_OWNER'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Ce propri\00E9taire potentiel n''existe pas.'),
''))
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138606544367751187)
,p_name=>'APEX.TASK.OUTCOME.APPROVED'
,p_message_language=>'fr'
,p_message_text=>unistr('Approuv\00E9')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138606663293751187)
,p_name=>'APEX.TASK.OUTCOME.REJECTED'
,p_message_language=>'fr'
,p_message_text=>unistr('Rejet\00E9')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138588002186751181)
,p_name=>'APEX.TASK.OUTCOME_MISSING'
,p_message_language=>'fr'
,p_message_text=>unistr('Un r\00E9sultat est requis pour terminer la t\00E2che')
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138588252322751181)
,p_name=>'APEX.TASK.OUTCOME_NOT_ALLOWED'
,p_message_language=>'fr'
,p_message_text=>unistr('La t\00E2che n''est pas autoris\00E9e \00E0 avoir un r\00E9sultat')
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138623882932751192)
,p_name=>'APEX.TASK.PARAM_NOT_UPDATABLE'
,p_message_language=>'fr'
,p_message_text=>unistr('Impossible de mettre \00E0 jour le param\00E8tre %0.')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138620146128751191)
,p_name=>'APEX.TASK.PARTICIPANT_EXISTS'
,p_message_language=>'fr'
,p_message_text=>unistr('Le participant existe d\00E9j\00E0 pour cette instance de t\00E2che.')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138721639965751221)
,p_name=>'APEX.TASK.PRIORITY.1'
,p_message_language=>'fr'
,p_message_text=>'Urgent'
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138598711636751184)
,p_name=>'APEX.TASK.PRIORITY.1.DESCRIPTION'
,p_message_language=>'fr'
,p_message_text=>'Urgent'
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138721515601751221)
,p_name=>'APEX.TASK.PRIORITY.2'
,p_message_language=>'fr'
,p_message_text=>unistr('Elev\00E9')
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138598882443751184)
,p_name=>'APEX.TASK.PRIORITY.2.DESCRIPTION'
,p_message_language=>'fr'
,p_message_text=>unistr('Priorit\00E9 \00E9lev\00E9e')
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138721465539751221)
,p_name=>'APEX.TASK.PRIORITY.3'
,p_message_language=>'fr'
,p_message_text=>'Moyen'
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138598965474751184)
,p_name=>'APEX.TASK.PRIORITY.3.DESCRIPTION'
,p_message_language=>'fr'
,p_message_text=>unistr('Priorit\00E9 moyenne')
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138721325222751221)
,p_name=>'APEX.TASK.PRIORITY.4'
,p_message_language=>'fr'
,p_message_text=>'Faible'
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138599049739751184)
,p_name=>'APEX.TASK.PRIORITY.4.DESCRIPTION'
,p_message_language=>'fr'
,p_message_text=>unistr('Priorit\00E9 faible')
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138721266636751221)
,p_name=>'APEX.TASK.PRIORITY.5'
,p_message_language=>'fr'
,p_message_text=>'Le plus faible'
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138599137964751184)
,p_name=>'APEX.TASK.PRIORITY.5.DESCRIPTION'
,p_message_language=>'fr'
,p_message_text=>unistr('Priorit\00E9 la plus faible')
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138604854153751186)
,p_name=>'APEX.TASK.SET_PRIORITY_NOT_AUTHORIZED'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9finir la priorit\00E9 de la t\00E2che : non autoris\00E9')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138606037133751186)
,p_name=>'APEX.TASK.STATE.ASSIGNED'
,p_message_language=>'fr'
,p_message_text=>unistr('Affect\00E9')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138606457096751187)
,p_name=>'APEX.TASK.STATE.CANCELLED'
,p_message_language=>'fr'
,p_message_text=>unistr('Annul\00E9')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138606137342751186)
,p_name=>'APEX.TASK.STATE.COMPLETED'
,p_message_language=>'fr'
,p_message_text=>unistr('Termin\00E9')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138606377911751186)
,p_name=>'APEX.TASK.STATE.ERRORED'
,p_message_language=>'fr'
,p_message_text=>'En erreur'
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138599849263751185)
,p_name=>'APEX.TASK.STATE.EXPIRED'
,p_message_language=>'fr'
,p_message_text=>unistr('Arriv\00E9 \00E0 expiration')
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138606288665751186)
,p_name=>'APEX.TASK.STATE.FAILED'
,p_message_language=>'fr'
,p_message_text=>'Echec'
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138596549316751184)
,p_name=>'APEX.TASK.STATE.INFO_REQUESTED'
,p_message_language=>'fr'
,p_message_text=>unistr('Informations demand\00E9es')
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138605908690751186)
,p_name=>'APEX.TASK.STATE.UNASSIGNED'
,p_message_language=>'fr'
,p_message_text=>unistr('Non affect\00E9')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138628332898751193)
,p_name=>'APEX.TASK.TASK_CREATE_ERROR'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Echec de la cr\00E9ation d''une t\00E2che pour la d\00E9finition de t\00E2che %0 dans l''application %1.'),
'SQLCODE : %2'))
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138628212929751193)
,p_name=>'APEX.TASK.TASK_CREATE_NO_POTENTIAL_OWNER'
,p_message_language=>'fr'
,p_message_text=>unistr('Echec de la tentative de cr\00E9ation d''une t\00E2che pour la d\00E9finition de t\00E2che %0 dans l''application %1 car la d\00E9finition de t\00E2che ne contient aucun propri\00E9taire potentiel : modifiez la d\00E9finition de t\00E2che et ajoutez au moins un participant de type Propri')
||unistr('\00E9taire potentiel')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138605519729751186)
,p_name=>'APEX.TASK.TASK_DEFINITION_NOT_FOUND'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9finition de t\00E2che introuvable')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138605496419751186)
,p_name=>'APEX.TASK.TASK_DEF_PARTICIPANTS_NOT_FOUND'
,p_message_language=>'fr'
,p_message_text=>unistr('Aucun participant trouv\00E9 pour la t\00E2che')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138606831663751187)
,p_name=>'APEX.TASK.TASK_ID_PK_VIOLATION'
,p_message_language=>'fr'
,p_message_text=>unistr('Plusieurs t\00E2ches correspondent \00E0 l''ID de t\00E2che indiqu\00E9. Consultez l''administrateur de base de donn\00E9es')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138605636247751186)
,p_name=>'APEX.TASK.TASK_NOT_FOUND'
,p_message_language=>'fr'
,p_message_text=>unistr('T\00E2che introuvable')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138605315427751186)
,p_name=>'APEX.TASK.TASK_PARAMETER_NOT_FOUND'
,p_message_language=>'fr'
,p_message_text=>unistr('Param\00E8tre de t\00E2che introuvable')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138641694418751197)
,p_name=>'APEX.TASK.TYPE.ACTION'
,p_message_language=>'fr'
,p_message_text=>'Action'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138641530540751197)
,p_name=>'APEX.TASK.TYPE.APPROVAL'
,p_message_language=>'fr'
,p_message_text=>'Approbation'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138588965741751181)
,p_name=>'APEX.TASK.VACATION_RULE_ERROR'
,p_message_language=>'fr'
,p_message_text=>unistr('Echec de l''ex\00E9cution de la proc\00E9dure de r\00E8gle de cong\00E9s %2 pour la d\00E9finition de t\00E2che %0 dans l''application %1.')
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138589131203751181)
,p_name=>'APEX.TASK.VACATION_RULE_MESSAGE'
,p_message_language=>'fr'
,p_message_text=>unistr('Participant %1 ajout\00E9 en tant que rempla\00E7ant du participant %0. Motif : %2.')
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138792868867751242)
,p_name=>'APEX.TB.TOOLBAR'
,p_message_language=>'fr'
,p_message_text=>'Barre d''outils'
,p_is_js_message=>true
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138646354430751198)
,p_name=>'APEX.TEMPLATE.APPLICATION'
,p_message_language=>'fr'
,p_message_text=>'Application'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138807520982751246)
,p_name=>'APEX.TEMPLATE.EXPAND_COLLAPSE_NAV_LABEL'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9velopper/R\00E9duire la navigation')
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138807695502751246)
,p_name=>'APEX.TEMPLATE.EXPAND_COLLAPSE_SIDE_COL_LABEL'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9velopper/R\00E9duire la colonne lat\00E9rale')
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138716027115751219)
,p_name=>'APEX.TEMPLATE.MAIN_NAV_LABEL'
,p_message_language=>'fr'
,p_message_text=>'Navigation principale'
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138616868309751190)
,p_name=>'APEX.TEMPLATE_DIRECTIVE.INVALID_PLACEHOLDER_NAME'
,p_message_language=>'fr'
,p_message_text=>unistr('"%0" n''est pas un nom de valeur de r\00E9serve valide.')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138723776479751221)
,p_name=>'APEX.TIME.DAY'
,p_message_language=>'fr'
,p_message_text=>'1 jour'
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138723520710751221)
,p_name=>'APEX.TIME.HOUR'
,p_message_language=>'fr'
,p_message_text=>'1 heure'
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138723807007751221)
,p_name=>'APEX.TIME.N_DAYS'
,p_message_language=>'fr'
,p_message_text=>'%0 jours'
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138723604071751221)
,p_name=>'APEX.TIME.N_HOURS'
,p_message_language=>'fr'
,p_message_text=>'%0 heures'
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138723464327751221)
,p_name=>'APEX.TIME.N_MINUTES'
,p_message_language=>'fr'
,p_message_text=>'%0 minutes'
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138724069834751222)
,p_name=>'APEX.TIME.N_WEEKS'
,p_message_language=>'fr'
,p_message_text=>'%0 semaines'
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138723913260751221)
,p_name=>'APEX.TIME.WEEK'
,p_message_language=>'fr'
,p_message_text=>'1 semaine'
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138621758608751191)
,p_name=>'APEX.TMV.SELECTION_COUNT'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 \00E9l\00E9ments s\00E9lectionn\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138621909923751191)
,p_name=>'APEX.TMV.SELECTOR_LABEL'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lectionner un \00E9l\00E9ment')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138621825556751191)
,p_name=>'APEX.TMV.SELECTOR_LABEL_1'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lectionner %0')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138810691969751247)
,p_name=>'APEX.UI.BACK_TO_TOP'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9but de la page')
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138668289735751205)
,p_name=>'APEX.UI.ENABLED'
,p_message_language=>'fr'
,p_message_text=>unistr('Activ\00E9')
,p_is_js_message=>true
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138636726037751195)
,p_name=>'APEX.UNHANDLED_ERROR'
,p_message_language=>'fr'
,p_message_text=>'Erreur lors du traitement de la demande.'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138622307231751191)
,p_name=>'APEX.UPDATE_MESSAGE_ERROR'
,p_message_language=>'fr'
,p_message_text=>unistr('Impossible de mettre \00E0 jour le message texte %0 car il est abonn\00E9 \00E0 partir d''une autre application.')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138725438603751222)
,p_name=>'APEX.VALUE_REQUIRED'
,p_message_language=>'fr'
,p_message_text=>'Valeur requise'
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138641883070751197)
,p_name=>'APEX.VISUALLY_HIDDEN_HEADING'
,p_message_language=>'fr'
,p_message_text=>unistr('Niveau d''en-t\00EAte %0, masqu\00E9')
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138770238724751235)
,p_name=>'APEX.WARN_ON_UNSAVED_CHANGES'
,p_message_language=>'fr'
,p_message_text=>unistr('Cette page comporte des modifications non enregistr\00E9es.')
,p_is_js_message=>true
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138631897160751194)
,p_name=>'APEX.WF.NAVIGATOR'
,p_message_language=>'fr'
,p_message_text=>'Navigateur'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138631542251751194)
,p_name=>'APEX.WF.ZOOM_IN'
,p_message_language=>'fr'
,p_message_text=>'Zoom avant'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138632577795751194)
,p_name=>'APEX.WF.ZOOM_LEVEL'
,p_message_language=>'fr'
,p_message_text=>'Niveau de zoom : {0} %'
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138631645697751194)
,p_name=>'APEX.WF.ZOOM_OUT'
,p_message_language=>'fr'
,p_message_text=>unistr('Zoom arri\00E8re')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138631719421751194)
,p_name=>'APEX.WF.ZOOM_RESET'
,p_message_language=>'fr'
,p_message_text=>unistr('R\00E9initialisation du zoom')
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138607263542751187)
,p_name=>'APEX.WF_DIAGRAM.ARIA_DESC'
,p_message_language=>'fr'
,p_message_text=>'Le diagramme de workflow est inaccessible pour le moment.'
,p_is_js_message=>true
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138607167765751187)
,p_name=>'APEX.WF_DIAGRAM.ARIA_LABEL'
,p_message_language=>'fr'
,p_message_text=>'Diagramme de workflow'
,p_is_js_message=>true
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138609058278751187)
,p_name=>'APEX.WORKFLOW.ACTION_NOT_ALLOWED'
,p_message_language=>'fr'
,p_message_text=>unistr('L''instance de workflow %0 est actuellement \00E0 l''\00E9tat %1. L''op\00E9ration n''est donc pas autoris\00E9e')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138611666523751188)
,p_name=>'APEX.WORKFLOW.ACTIVITY.COMPLETED'
,p_message_language=>'fr'
,p_message_text=>unistr('L''instance %1 de l''activit\00E9 %2 dans le workflow %0 a \00E9t\00E9 ex\00E9cut\00E9e')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138611443151751188)
,p_name=>'APEX.WORKFLOW.ACTIVITY.CREATED'
,p_message_language=>'fr'
,p_message_text=>unistr('Instance %1 de l''activit\00E9 %2 dans le workflow %0 cr\00E9\00E9e')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138603287373751186)
,p_name=>'APEX.WORKFLOW.ACTIVITY.DATA_NOT_FOUND'
,p_message_language=>'fr'
,p_message_text=>unistr('Aucune ligne de donn\00E9es suppl\00E9mentaire associ\00E9e \00E0 cette instance d''activit\00E9 de workflow n''a \00E9t\00E9 trouv\00E9e')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138611526343751188)
,p_name=>'APEX.WORKFLOW.ACTIVITY.RETRIED'
,p_message_language=>'fr'
,p_message_text=>unistr('L''instance en erreur %1 de l''activit\00E9 %2 dans le workflow %0 a fait l''objet d''une nouvelle tentative')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138593545651751183)
,p_name=>'APEX.WORKFLOW.ACTIVITY.TERMINATED'
,p_message_language=>'fr'
,p_message_text=>unistr('L''instance d''activit\00E9 %1 dans le workflow %0 a pris fin')
,p_version_scn=>2704753
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138627357682751193)
,p_name=>'APEX.WORKFLOW.ACTIVITY.TIMEOUT'
,p_message_language=>'fr'
,p_message_text=>unistr('L''instance d''activit\00E9 %1 dans le workflow %0 a expir\00E9 et a pris fin.')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138611739172751188)
,p_name=>'APEX.WORKFLOW.ACTIVITY.WAITING'
,p_message_language=>'fr'
,p_message_text=>unistr('L''instance %1 de l''activit\00E9 %2 dans le workflow %0 a l''\00E9tat En attente')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138593322449751183)
,p_name=>'APEX.WORKFLOW.ALTERED_AND_RESUMED'
,p_message_language=>'fr'
,p_message_text=>unistr('L''instance de workflow %0 a \00E9t\00E9 modifi\00E9e et reprise \00E0 l''activit\00E9 %1')
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138610755418751188)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.COMPLETED'
,p_message_language=>'fr'
,p_message_text=>unistr('L''instance en attente %1 de l''activit\00E9 %2 dans le workflow %0 a \00E9t\00E9 ex\00E9cut\00E9e')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138610504151751188)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.FAULTED'
,p_message_language=>'fr'
,p_message_text=>unistr('L''activit\00E9 en attente %1 a \00E9t\00E9 mise en erreur car le workflow %0 \00E9tait d\00E9j\00E0 \00E0 l''\00E9tat En erreur avant l''ex\00E9cution de l''activit\00E9')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138610621705751188)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.TERMINATED'
,p_message_language=>'fr'
,p_message_text=>unistr('L''activit\00E9 en attente %1 a pris fin car le workflow %0 \00E9tait d\00E9j\00E0 \00E0 l''\00E9tat A pris fin avant l''ex\00E9cution de l''activit\00E9')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138593620132751183)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.TERMINATE_FAILED'
,p_message_language=>'fr'
,p_message_text=>unistr('Echec de la terminaison de l''activit\00E9 %1 dans le workflow %0 en raison d''une exception : %2')
,p_version_scn=>2704753
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138609200421751187)
,p_name=>'APEX.WORKFLOW.BUSY'
,p_message_language=>'fr'
,p_message_text=>unistr('Le workflow est actuellement occup\00E9 \00E0 ex\00E9cuter une pr\00E9c\00E9dente op\00E9ration. Essayez ult\00E9rieurement')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138625304605751192)
,p_name=>'APEX.WORKFLOW.COMPLETED_SINCE'
,p_message_language=>'fr'
,p_message_text=>unistr('Termin\00E9 : %0')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138608350577751187)
,p_name=>'APEX.WORKFLOW.CONTINUE.NOT_ALLOWED'
,p_message_language=>'fr'
,p_message_text=>unistr('Impossible de poursuivre le workflow %0 car il est actuellement au niveau de l''activit\00E9 %1, qui n''est pas \00E0 l''\00E9tat En attente')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138620255845751191)
,p_name=>'APEX.WORKFLOW.CORRELATION_CONTEXT_ERROR'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 n''est pas un contexte de corr\00E9lation de workflow valide pour le processus actuellement ex\00E9cut\00E9 par cette activit\00E9 de workflow. Le contexte de corr\00E9lation doit \00EAtre un texte d\00E9limit\00E9 par le signe deux-points contenant APEX_APPL_WORKFLOW suivi de l''')
||unistr('ID de l''instance de workflow et de l''ID de l''instance d''activit\00E9.')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138610963834751188)
,p_name=>'APEX.WORKFLOW.CREATED'
,p_message_language=>'fr'
,p_message_text=>unistr('Instance %0 du workflow %1 version %2 cr\00E9\00E9e')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138603059824751186)
,p_name=>'APEX.WORKFLOW.DATA_NOT_FOUND'
,p_message_language=>'fr'
,p_message_text=>unistr('Aucune ligne de donn\00E9es suppl\00E9mentaire associ\00E9e \00E0 cette instance de workflow n''a \00E9t\00E9 trouv\00E9e')
,p_version_scn=>2704755
);
end;
/
begin
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138625587764751192)
,p_name=>'APEX.WORKFLOW.DUE_SINCE'
,p_message_language=>'fr'
,p_message_text=>unistr('Ech\00E9ance : %0')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138610859764751188)
,p_name=>'APEX.WORKFLOW.END'
,p_message_language=>'fr'
,p_message_text=>unistr('Le workflow %0 s''est termin\00E9 avec l''\00E9tat %1')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138608030240751187)
,p_name=>'APEX.WORKFLOW.INCOMPATIBLE_DATA_TYPE'
,p_message_language=>'fr'
,p_message_text=>unistr('Le type de donn\00E9es %1 pour les conditions en cours de comparaison dans l''activit\00E9 Switch du workflow %0 n''est pas compatible avec l''op\00E9rateur de condition')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138597874270751184)
,p_name=>'APEX.WORKFLOW.INITIATED_BY_USER_SINCE'
,p_message_language=>'fr'
,p_message_text=>unistr('Lanc\00E9 par %0 %1')
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138620609312751191)
,p_name=>'APEX.WORKFLOW.INVOKED'
,p_message_language=>'fr'
,p_message_text=>unistr('Instance %0 du workflow %1 version %2 cr\00E9\00E9e, appel\00E9e \00E0 partir de l''instance d''activit\00E9 %4 de l''instance de workflow %3')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138593481072751183)
,p_name=>'APEX.WORKFLOW.NO_ACTIVITY_FOUND'
,p_message_language=>'fr'
,p_message_text=>unistr('L''activit\00E9 portant l''ID statique %1 n''est pas une activit\00E9 du workflow %0. V\00E9rifiez l''ID statique d''activit\00E9 de la version de workflow correspondante.')
,p_version_scn=>2704753
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138618781155751190)
,p_name=>'APEX.WORKFLOW.REQUIRED_PARAM_MISSING'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 est un param\00E8tre requis pour ce workflow et ne doit pas \00EAtre NULL.')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138611367745751188)
,p_name=>'APEX.WORKFLOW.RESUMED'
,p_message_language=>'fr'
,p_message_text=>unistr('L''instance de workflow %0 a \00E9t\00E9 reprise')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138611273308751188)
,p_name=>'APEX.WORKFLOW.RETRIED'
,p_message_language=>'fr'
,p_message_text=>'L''instance de workflow %0 a fait l''objet d''une nouvelle tentative'
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138625608727751192)
,p_name=>'APEX.WORKFLOW.RETRY_COUNT.EQUALS_ONE'
,p_message_language=>'fr'
,p_message_text=>'%0 nouvelle tentative'
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138625748397751192)
,p_name=>'APEX.WORKFLOW.RETRY_COUNT.NOT_EQUALS_ONE'
,p_message_language=>'fr'
,p_message_text=>'%0 nouvelles tentatives'
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138625431535751192)
,p_name=>'APEX.WORKFLOW.STARTED_SINCE'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9marr\00E9 : %0')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138619606507751190)
,p_name=>'APEX.WORKFLOW.STATE.ACTIVE'
,p_message_language=>'fr'
,p_message_text=>'Actif'
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138619883172751190)
,p_name=>'APEX.WORKFLOW.STATE.COMPLETED'
,p_message_language=>'fr'
,p_message_text=>unistr('Termin\00E9')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138619921491751191)
,p_name=>'APEX.WORKFLOW.STATE.FAULTED'
,p_message_language=>'fr'
,p_message_text=>'En erreur'
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138620064592751191)
,p_name=>'APEX.WORKFLOW.STATE.SUSPENDED'
,p_message_language=>'fr'
,p_message_text=>'Suspendu'
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138619790717751190)
,p_name=>'APEX.WORKFLOW.STATE.TERMINATED'
,p_message_language=>'fr'
,p_message_text=>'A pris fin'
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138635093407751195)
,p_name=>'APEX.WORKFLOW.STATE.WAITING'
,p_message_language=>'fr'
,p_message_text=>'En attente'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138611052248751188)
,p_name=>'APEX.WORKFLOW.SUSPENDED'
,p_message_language=>'fr'
,p_message_text=>unistr('L''instance de workflow %0 a \00E9t\00E9 suspendue')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138616973716751190)
,p_name=>'APEX.WORKFLOW.SWITCH.BRANCH_NOT_FOUND'
,p_message_language=>'fr'
,p_message_text=>unistr('Impossible de d\00E9terminer la prochaine activit\00E9 pour l''instance de workflow %0. V\00E9rifiez et corrigez les conditions d\00E9finies pour l''activit\00E9 Switch en cours avant de retenter le workflow.')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138611188064751188)
,p_name=>'APEX.WORKFLOW.TERMINATED'
,p_message_language=>'fr'
,p_message_text=>'L''instance de workflow %0 a pris fin'
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138610253721751188)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_RESUME'
,p_message_language=>'fr'
,p_message_text=>unistr('Seul l''administrateur m\00E9tier du workflow %0 peut reprendre le workflow')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138610307346751188)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_RETRY'
,p_message_language=>'fr'
,p_message_text=>unistr('Seuls un administrateur m\00E9tier et/ou un propri\00E9taire peuvent retenter le workflow %0')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138609883897751188)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_SUSPEND'
,p_message_language=>'fr'
,p_message_text=>unistr('Seul un administrateur m\00E9tier du workflow peut suspendre l''instance de workflow %0')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138610178145751188)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_TERMINATE'
,p_message_language=>'fr'
,p_message_text=>unistr('Seuls les propri\00E9taires et les administrateurs m\00E9tier de l''instance de workflow %0 peuvent mettre fin au workflow')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138608539950751187)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_UPDATE'
,p_message_language=>'fr'
,p_message_text=>unistr('Seul un administrateur m\00E9tier d\00E9fini pour le workflow %0 peut mettre \00E0 jour les variables du workflow')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138623126197751191)
,p_name=>'APEX.WORKFLOW.UPDATE,NOT_ALLOWED'
,p_message_language=>'fr'
,p_message_text=>unistr('L''instance de workflow %0 doit \00EAtre \00E0 l''\00E9tat En erreur ou Suspendu pour que ses variables puissent \00EAtre mises \00E0 jour.')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138614651738751189)
,p_name=>'APEX.WORKFLOW.UPDATED'
,p_message_language=>'fr'
,p_message_text=>unistr('La valeur de la variable de workflow %0 a \00E9t\00E9 remplac\00E9e par %1')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138624866243751192)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_ACTIVE'
,p_message_language=>'fr'
,p_message_text=>'Le workflow %0 ne dispose pas de version active'
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138624967838751192)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_DEV'
,p_message_language=>'fr'
,p_message_text=>unistr('Le workflow %0 ne dispose pas de version en d\00E9veloppement')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138625040310751192)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_FOUND'
,p_message_language=>'fr'
,p_message_text=>unistr('Le workflow %0 ne dispose pas de version active ou en d\00E9veloppement')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138607933061751187)
,p_name=>'APEX.WORKFLOW.WORKFLOW_ACT_INSTANCE_NOT_FOUND'
,p_message_language=>'fr'
,p_message_text=>unistr('L''instance d''activit\00E9 %1 pour l''instance de workflow %0 est introuvable')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138607775575751187)
,p_name=>'APEX.WORKFLOW.WORKFLOW_INSTANCE_NOT_FOUND'
,p_message_language=>'fr'
,p_message_text=>'L''instance de workflow %0 est introuvable'
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138642818130751197)
,p_name=>'APEX.XLSX.ERROR.NO_ACTIVE_WORKSHEET'
,p_message_language=>'fr'
,p_message_text=>'Le classeur ne comporte pas de feuille de calcul active.'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138642796828751197)
,p_name=>'APEX.XLSX.ERROR.WORKBOOK_NOT_INITIALIZED'
,p_message_language=>'fr'
,p_message_text=>unistr('Le classeur n''est pas initialis\00E9.')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138642603046751197)
,p_name=>'APEX.XLSX.INTERNAL_ERROR'
,p_message_language=>'fr'
,p_message_text=>unistr('Une erreur interne est survenue lors de la cr\00E9ation du fichier XLSX.')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138645125272751198)
,p_name=>'APEX.XLSX.SHEET'
,p_message_language=>'fr'
,p_message_text=>'Feuille'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138655766277751201)
,p_name=>'APEX.XLSX.SHEET_NAME_TAKEN'
,p_message_language=>'fr'
,p_message_text=>unistr('Le nom de feuille de calcul "%0" est d\00E9j\00E0 pris. Essayez-en un autre.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138784373989751240)
,p_name=>'APEXIR_ACTIONS'
,p_message_language=>'fr'
,p_message_text=>'Actions'
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138699341735751214)
,p_name=>'APEXIR_ACTIONS_MENU'
,p_message_language=>'fr'
,p_message_text=>'Menu Actions'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138695076620751213)
,p_name=>'APEXIR_ADD_FUNCTION'
,p_message_language=>'fr'
,p_message_text=>'Ajouter une fonction'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138694986492751213)
,p_name=>'APEXIR_ADD_GROUP_BY_COLUMN'
,p_message_language=>'fr'
,p_message_text=>'Ajouter une colonne de regroupement'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138732513323751224)
,p_name=>'APEXIR_ADD_PIVOT_COLUMN'
,p_message_language=>'fr'
,p_message_text=>'Ajouter une colonne pour la permutation lignes vers colonnes'
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138732670960751224)
,p_name=>'APEXIR_ADD_ROW_COLUMN'
,p_message_language=>'fr'
,p_message_text=>'Ajouter une ligne /colonne'
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138667009557751204)
,p_name=>'APEXIR_AGGREGATE'
,p_message_language=>'fr'
,p_message_text=>unistr('Agr\00E9ger')
,p_is_js_message=>true
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138705529208751216)
,p_name=>'APEXIR_AGGREGATION'
,p_message_language=>'fr'
,p_message_text=>unistr('Agr\00E9gation')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138686459555751210)
,p_name=>'APEXIR_AGG_AVG'
,p_message_language=>'fr'
,p_message_text=>'Moyenne'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138690751133751212)
,p_name=>'APEXIR_AGG_COUNT'
,p_message_language=>'fr'
,p_message_text=>'Nombre'
,p_version_scn=>2704768
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138686574563751210)
,p_name=>'APEXIR_AGG_MAX'
,p_message_language=>'fr'
,p_message_text=>'Valeur maximale'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138686790086751210)
,p_name=>'APEXIR_AGG_MEDIAN'
,p_message_language=>'fr'
,p_message_text=>unistr('M\00E9diane')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138686686679751210)
,p_name=>'APEXIR_AGG_MIN'
,p_message_language=>'fr'
,p_message_text=>'Valeur minimale'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138686331614751210)
,p_name=>'APEXIR_AGG_SUM'
,p_message_language=>'fr'
,p_message_text=>'Total de %0'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138687435946751211)
,p_name=>'APEXIR_ALL'
,p_message_language=>'fr'
,p_message_text=>'Tout'
,p_is_js_message=>true
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138666339877751204)
,p_name=>'APEXIR_ALL_COLUMNS'
,p_message_language=>'fr'
,p_message_text=>'Toutes les colonnes'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138646413849751198)
,p_name=>'APEXIR_ALL_ROWS'
,p_message_language=>'fr'
,p_message_text=>'Toutes les lignes'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138781342995751239)
,p_name=>'APEXIR_ALTERNATIVE'
,p_message_language=>'fr'
,p_message_text=>'Remplacement'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138782980114751239)
,p_name=>'APEXIR_ALTERNATIVE_DEFAULT_NAME'
,p_message_language=>'fr'
,p_message_text=>unistr('Autre valeur par d\00E9faut : %0 ')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138680520371751208)
,p_name=>'APEXIR_AND'
,p_message_language=>'fr'
,p_message_text=>'et'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138715375824751219)
,p_name=>'APEXIR_API.IMPORT_CONTENT_CORRUPTED'
,p_message_language=>'fr'
,p_message_text=>unistr('Impossible d''importer l''\00E9tat enregistr\00E9. Le contenu est endommag\00E9.')
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138715429712751219)
,p_name=>'APEXIR_API.IMPORT_CONTENT_EMPTY'
,p_message_language=>'fr'
,p_message_text=>unistr('Impossible d''importer l''\00E9tat enregistr\00E9. Le contenu est vide.')
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138668537385751205)
,p_name=>'APEXIR_APPLY'
,p_message_language=>'fr'
,p_message_text=>'Appliquer'
,p_is_js_message=>true
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138662127569751203)
,p_name=>'APEXIR_ASCENDING'
,p_message_language=>'fr'
,p_message_text=>'Croissant'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138683657755751209)
,p_name=>'APEXIR_AS_OF'
,p_message_language=>'fr'
,p_message_text=>'A partir du %0'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138783546579751239)
,p_name=>'APEXIR_AVERAGE_X'
,p_message_language=>'fr'
,p_message_text=>'Moyenne de %0'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138775114500751237)
,p_name=>'APEXIR_BAR'
,p_message_language=>'fr'
,p_message_text=>unistr('Graphique \00E0 barres')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138667873263751205)
,p_name=>'APEXIR_BETWEEN'
,p_message_language=>'fr'
,p_message_text=>'entre'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138660932392751203)
,p_name=>'APEXIR_BGCOLOR'
,p_message_language=>'fr'
,p_message_text=>unistr('Couleur d''arri\00E8re-plan')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138662805011751203)
,p_name=>'APEXIR_BLUE'
,p_message_language=>'fr'
,p_message_text=>'bleu'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138696905838751213)
,p_name=>'APEXIR_BOTTOM'
,p_message_language=>'fr'
,p_message_text=>'Bas'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138627746446751193)
,p_name=>'APEXIR_BTNS_NEXT_TO_SEARCH_OF'
,p_message_language=>'fr'
,p_message_text=>'Boutons en regard de la barre de recherche pour %0'
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138663404795751203)
,p_name=>'APEXIR_CANCEL'
,p_message_language=>'fr'
,p_message_text=>'Annuler'
,p_is_js_message=>true
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138669712908751205)
,p_name=>'APEXIR_CATEGORY'
,p_message_language=>'fr'
,p_message_text=>unistr('Cat\00E9gorie')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138660853353751203)
,p_name=>'APEXIR_CELL'
,p_message_language=>'fr'
,p_message_text=>'Cellule'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138687338246751211)
,p_name=>'APEXIR_CHART'
,p_message_language=>'fr'
,p_message_text=>'Graphique'
,p_is_js_message=>true
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138697827565751214)
,p_name=>'APEXIR_CHART_INITIALIZING'
,p_message_language=>'fr'
,p_message_text=>'Initialisation en cours...'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138737559512751226)
,p_name=>'APEXIR_CHART_LABEL_NOT_NULL'
,p_message_language=>'fr'
,p_message_text=>unistr('Le libell\00E9 de graphique doit \00EAtre indiqu\00E9.')
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138749946614751229)
,p_name=>'APEXIR_CHART_MAX_DATAPOINT_CNT'
,p_message_language=>'fr'
,p_message_text=>unistr('Votre requ\00EAte d\00E9passe la valeur maximale de %0 points de donn\00E9es par graphique. Appliquez un filtre pour r\00E9duire le nombre d''enregistrements dans votre requ\00EAte de base.')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138748818946751229)
,p_name=>'APEXIR_CHART_MAX_ROW_CNT'
,p_message_language=>'fr'
,p_message_text=>unistr('Le nombre maximal de lignes pour la requ\00EAte Graphique limite le nombre de lignes dans la requ\00EAte de base, et non le nombre de lignes affich\00E9es. Votre requ\00EAte de base d\00E9passe le nombre de lignes maximal de %0. Appliquez un filtre pour r\00E9duire le nombr')
||unistr('e d''enregistrements dans votre requ\00EAte de base.')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138666453092751204)
,p_name=>'APEXIR_CHART_TYPE'
,p_message_language=>'fr'
,p_message_text=>'Type de graphique'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138630372580751194)
,p_name=>'APEXIR_CHART_VIEW_OF'
,p_message_language=>'fr'
,p_message_text=>'Vue graphique pour %0'
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138745572635751228)
,p_name=>'APEXIR_CHECK_ALL'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lectionner tout')
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138684070399751210)
,p_name=>'APEXIR_CHOOSE_DOWNLOAD_FORMAT'
,p_message_language=>'fr'
,p_message_text=>unistr('Choisir le format de l''\00E9tat')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138691800362751212)
,p_name=>'APEXIR_CLEAR'
,p_message_language=>'fr'
,p_message_text=>'effacer'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138663374017751203)
,p_name=>'APEXIR_COLUMN'
,p_message_language=>'fr'
,p_message_text=>'Colonne'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138703127674751215)
,p_name=>'APEXIR_COLUMNS'
,p_message_language=>'fr'
,p_message_text=>'Colonnes'
,p_is_js_message=>true
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138670338746751205)
,p_name=>'APEXIR_COLUMN_ALIASES'
,p_message_language=>'fr'
,p_message_text=>'Alias de colonnes'
,p_version_scn=>2704763
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138777999643751238)
,p_name=>'APEXIR_COLUMN_FILTER'
,p_message_language=>'fr'
,p_message_text=>'Filtrer...'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138638133993751196)
,p_name=>'APEXIR_COLUMN_HEADER'
,p_message_language=>'fr'
,p_message_text=>unistr('En-t\00EAte de colonne')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138652295566751200)
,p_name=>'APEXIR_COLUMN_HEADER_ACTIONS'
,p_message_language=>'fr'
,p_message_text=>'Actions de colonne'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138652531903751200)
,p_name=>'APEXIR_COLUMN_HEADER_ACTIONS_FOR'
,p_message_language=>'fr'
,p_message_text=>'Actions pour la colonne "%0"'
,p_is_js_message=>true
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138693993625751213)
,p_name=>'APEXIR_COLUMN_HEADING_MENU'
,p_message_language=>'fr'
,p_message_text=>unistr('Menu d''en-t\00EAte de colonne')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138697643457751214)
,p_name=>'APEXIR_COLUMN_INFO'
,p_message_language=>'fr'
,p_message_text=>'Informations de colonne'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138780285282751238)
,p_name=>'APEXIR_COLUMN_LABEL'
,p_message_language=>'fr'
,p_message_text=>unistr('Libell\00E9 de colonne')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138695360595751213)
,p_name=>'APEXIR_COLUMN_N'
,p_message_language=>'fr'
,p_message_text=>'Colonne %0'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138678219956751208)
,p_name=>'APEXIR_COMPARISON_CONTAINS'
,p_message_language=>'fr'
,p_message_text=>'contient'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138679540767751208)
,p_name=>'APEXIR_COMPARISON_DOESNOT_CONTAIN'
,p_message_language=>'fr'
,p_message_text=>'ne contient pas'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138661876981751203)
,p_name=>'APEXIR_COMPARISON_IN'
,p_message_language=>'fr'
,p_message_text=>'est dans'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138679722309751208)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_LAST'
,p_message_language=>'fr'
,p_message_text=>'n''est pas dans les dern.'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138688847987751211)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_NEXT'
,p_message_language=>'fr'
,p_message_text=>'ne figure pas sur la ligne suivante'
,p_version_scn=>2704767
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138679636808751208)
,p_name=>'APEXIR_COMPARISON_IS_IN_LAST'
,p_message_language=>'fr'
,p_message_text=>'est dans les derniers'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138688798620751211)
,p_name=>'APEXIR_COMPARISON_IS_IN_NEXT'
,p_message_language=>'fr'
,p_message_text=>'figure sur la ligne suivante'
,p_version_scn=>2704767
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138661756423751203)
,p_name=>'APEXIR_COMPARISON_IS_NOT_NULL'
,p_message_language=>'fr'
,p_message_text=>'n''est pas NULL'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138661640915751203)
,p_name=>'APEXIR_COMPARISON_IS_NULL'
,p_message_language=>'fr'
,p_message_text=>'est NULL'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138661457877751203)
,p_name=>'APEXIR_COMPARISON_LIKE'
,p_message_language=>'fr'
,p_message_text=>'est comme'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138661985448751203)
,p_name=>'APEXIR_COMPARISON_NOT_IN'
,p_message_language=>'fr'
,p_message_text=>'n''est pas dans'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138661584120751203)
,p_name=>'APEXIR_COMPARISON_NOT_LIKE'
,p_message_language=>'fr'
,p_message_text=>'n''est pas comme'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138678505454751208)
,p_name=>'APEXIR_COMPARISON_REGEXP_LIKE'
,p_message_language=>'fr'
,p_message_text=>unistr('recherche une expression r\00E9guli\00E8re')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138683998982751209)
,p_name=>'APEXIR_COMPUTATION'
,p_message_language=>'fr'
,p_message_text=>'Calcul'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138748550002751229)
,p_name=>'APEXIR_COMPUTATION_EXPRESSION'
,p_message_language=>'fr'
,p_message_text=>'Expression de calcul'
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138703419941751215)
,p_name=>'APEXIR_COMPUTATION_FOOTER'
,p_message_language=>'fr'
,p_message_text=>unistr('Cr\00E9er un calcul en utilisant les alias de colonne.')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138703500628751215)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E1'
,p_message_language=>'fr'
,p_message_text=>'(B+C)*100'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138703631001751215)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E2'
,p_message_language=>'fr'
,p_message_text=>'INITCAP(B)||'', ''||INITCAP(C)'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138703763584751215)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E3'
,p_message_language=>'fr'
,p_message_text=>'CASE WHEN A = 10 THEN B + C ELSE B END'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138644614492751198)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E4'
,p_message_language=>'fr'
,p_message_text=>'ROUND(C / 1000000)'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138688113150751211)
,p_name=>'APEXIR_COMPUTE'
,p_message_language=>'fr'
,p_message_text=>'Calculer'
,p_is_js_message=>true
,p_version_scn=>2704767
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138695971261751213)
,p_name=>'APEXIR_CONTROL_BREAK'
,p_message_language=>'fr'
,p_message_text=>'Commande BREAK'
,p_is_js_message=>true
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138698917462751214)
,p_name=>'APEXIR_CONTROL_BREAKS'
,p_message_language=>'fr'
,p_message_text=>'Commandes BREAK'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138785583430751240)
,p_name=>'APEXIR_CONTROL_BREAK_COLUMNS'
,p_message_language=>'fr'
,p_message_text=>'Colonnes de commande BREAK'
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138641334562751197)
,p_name=>'APEXIR_COUNT_DISTINCT'
,p_message_language=>'fr'
,p_message_text=>'Nombre de valeurs distinctes'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138784084699751239)
,p_name=>'APEXIR_COUNT_DISTINCT_X'
,p_message_language=>'fr'
,p_message_text=>'Nombre de valeurs distinctes'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138783942809751239)
,p_name=>'APEXIR_COUNT_X'
,p_message_language=>'fr'
,p_message_text=>'Nombre de %0'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138756971210751231)
,p_name=>'APEXIR_DAILY'
,p_message_language=>'fr'
,p_message_text=>'Quotidien'
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138810298450751247)
,p_name=>'APEXIR_DATA'
,p_message_language=>'fr'
,p_message_text=>unistr('Donn\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138697732447751214)
,p_name=>'APEXIR_DATA_AS_OF'
,p_message_language=>'fr'
,p_message_text=>unistr('Donn\00E9es d''\00E9tat datant d''il y a %0 minutes.')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138630775545751194)
,p_name=>'APEXIR_DATA_VIEW_OF'
,p_message_language=>'fr'
,p_message_text=>unistr('Vue de donn\00E9es pour %0')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138667122595751204)
,p_name=>'APEXIR_DATE'
,p_message_language=>'fr'
,p_message_text=>'Date'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138701603530751215)
,p_name=>'APEXIR_DEFAULT'
,p_message_language=>'fr'
,p_message_text=>unistr('Valeur par d\00E9faut')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138781171283751239)
,p_name=>'APEXIR_DEFAULT_REPORT_TYPE'
,p_message_language=>'fr'
,p_message_text=>unistr('Type d''\00E9tat par d\00E9faut')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138663537857751203)
,p_name=>'APEXIR_DELETE'
,p_message_language=>'fr'
,p_message_text=>'Supprimer'
,p_is_js_message=>true
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138667454161751205)
,p_name=>'APEXIR_DELETE_CONFIRM'
,p_message_language=>'fr'
,p_message_text=>unistr('Voulez-vous supprimer ces param\00E8tres d''\00E9tat ?')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138767909661751235)
,p_name=>'APEXIR_DELETE_DEFAULT_REPORT'
,p_message_language=>'fr'
,p_message_text=>unistr('Supprimer l''\00E9tat par d\00E9faut')
,p_is_js_message=>true
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138695679879751213)
,p_name=>'APEXIR_DELETE_REPORT'
,p_message_language=>'fr'
,p_message_text=>unistr('Supprimer l''\00E9tat')
,p_is_js_message=>true
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138662239364751203)
,p_name=>'APEXIR_DESCENDING'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9croissant')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138669881606751205)
,p_name=>'APEXIR_DESCRIPTION'
,p_message_language=>'fr'
,p_message_text=>'Description'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138693847668751213)
,p_name=>'APEXIR_DETAIL_VIEW'
,p_message_language=>'fr'
,p_message_text=>'Vue monoligne'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138702196044751215)
,p_name=>'APEXIR_DIRECTION'
,p_message_language=>'fr'
,p_message_text=>'Direction %0'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138703004296751215)
,p_name=>'APEXIR_DISABLED'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9sactiv\00E9')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138663053654751203)
,p_name=>'APEXIR_DISPLAYED'
,p_message_language=>'fr'
,p_message_text=>unistr('Affich\00E9')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138666238225751204)
,p_name=>'APEXIR_DISPLAYED_COLUMNS'
,p_message_language=>'fr'
,p_message_text=>unistr('Colonnes affich\00E9es')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138702056478751215)
,p_name=>'APEXIR_DISPLAY_IN_REPORT'
,p_message_language=>'fr'
,p_message_text=>unistr('Afficher dans l''\00E9tat')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138696859102751213)
,p_name=>'APEXIR_DOWN'
,p_message_language=>'fr'
,p_message_text=>'Bas'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138688288594751211)
,p_name=>'APEXIR_DOWNLOAD'
,p_message_language=>'fr'
,p_message_text=>unistr('T\00E9l\00E9charger en local')
,p_is_js_message=>true
,p_version_scn=>2704767
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138701968946751215)
,p_name=>'APEXIR_DO_NOT_DISPLAY'
,p_message_language=>'fr'
,p_message_text=>'Ne pas afficher'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138771292303751236)
,p_name=>'APEXIR_DUPLICATE_HIGHLIGHT_COND'
,p_message_language=>'fr'
,p_message_text=>unistr('Une mise en \00E9vidence avec la m\00EAme condition existe d\00E9j\00E0.')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138785717377751240)
,p_name=>'APEXIR_DUPLICATE_PIVOT_COLUMN'
,p_message_language=>'fr'
,p_message_text=>unistr('Colonne de pivot en double. La liste de colonnes de pivot doit \00EAtre unique.')
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138785988272751240)
,p_name=>'APEXIR_EDIT'
,p_message_language=>'fr'
,p_message_text=>'Modifier'
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138697964856751214)
,p_name=>'APEXIR_EDIT_CHART'
,p_message_language=>'fr'
,p_message_text=>unistr('Modifier les param\00E8tres du graphique')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138704504545751216)
,p_name=>'APEXIR_EDIT_CHART2'
,p_message_language=>'fr'
,p_message_text=>'Modifier un graphique'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138668489100751205)
,p_name=>'APEXIR_EDIT_CONTROL_BREAK'
,p_message_language=>'fr'
,p_message_text=>'Modifier la commande BREAK'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138704934953751216)
,p_name=>'APEXIR_EDIT_FILTER'
,p_message_language=>'fr'
,p_message_text=>'Modifier le filtre'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138671421021751206)
,p_name=>'APEXIR_EDIT_FLASHBACK'
,p_message_language=>'fr'
,p_message_text=>unistr('Modifier l''op\00E9ration Flashback')
,p_version_scn=>2704763
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138762787738751233)
,p_name=>'APEXIR_EDIT_GROUP_BY'
,p_message_language=>'fr'
,p_message_text=>'Modifier le groupement'
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138704867853751216)
,p_name=>'APEXIR_EDIT_HIGHLIGHT'
,p_message_language=>'fr'
,p_message_text=>unistr('Modifier la mise en \00E9vidence')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138732874749751224)
,p_name=>'APEXIR_EDIT_PIVOT'
,p_message_language=>'fr'
,p_message_text=>'Modifier le pivot'
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138692209995751212)
,p_name=>'APEXIR_EDIT_REPORT'
,p_message_language=>'fr'
,p_message_text=>unistr('Modifier un \00E9tat')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138781414014751239)
,p_name=>'APEXIR_EMAIL'
,p_message_language=>'fr'
,p_message_text=>unistr('Adresse \00E9lectronique')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138653641859751201)
,p_name=>'APEXIR_EMAIL_ADDRESS'
,p_message_language=>'fr'
,p_message_text=>unistr('Adresse \00E9lectronique')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138781790987751239)
,p_name=>'APEXIR_EMAIL_BCC'
,p_message_language=>'fr'
,p_message_text=>'Cci'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138781924593751239)
,p_name=>'APEXIR_EMAIL_BODY'
,p_message_language=>'fr'
,p_message_text=>'Corps'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138781606689751239)
,p_name=>'APEXIR_EMAIL_CC'
,p_message_language=>'fr'
,p_message_text=>'Cc'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138782411815751239)
,p_name=>'APEXIR_EMAIL_FREQUENCY'
,p_message_language=>'fr'
,p_message_text=>unistr('Fr\00E9quence')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138658895129751202)
,p_name=>'APEXIR_EMAIL_NOT_CONFIGURED'
,p_message_language=>'fr'
,p_message_text=>unistr('La messagerie \00E9lectronique n''a pas \00E9t\00E9 configur\00E9e pour cette application. Contactez l''administrateur.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138756287859751231)
,p_name=>'APEXIR_EMAIL_REQUIRED'
,p_message_language=>'fr'
,p_message_text=>unistr('L''adresse \00E9lectronique doit \00EAtre indiqu\00E9e.')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138782044336751239)
,p_name=>'APEXIR_EMAIL_SEE_ATTACHED'
,p_message_language=>'fr'
,p_message_text=>unistr('Consulter la pi\00E8ce jointe')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138781895697751239)
,p_name=>'APEXIR_EMAIL_SUBJECT'
,p_message_language=>'fr'
,p_message_text=>'Objet'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138757287170751231)
,p_name=>'APEXIR_EMAIL_SUBJECT_REQUIRED'
,p_message_language=>'fr'
,p_message_text=>unistr('L''objet du courriel doit \00EAtre indiqu\00E9.')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138781548574751239)
,p_name=>'APEXIR_EMAIL_TO'
,p_message_language=>'fr'
,p_message_text=>'A'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138660611475751203)
,p_name=>'APEXIR_ENABLED'
,p_message_language=>'fr'
,p_message_text=>unistr('Activ\00E9')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138704733491751216)
,p_name=>'APEXIR_ENABLE_DISABLE_ALT'
,p_message_language=>'fr'
,p_message_text=>unistr('Activer/d\00E9sactiver')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138704224682751216)
,p_name=>'APEXIR_ERROR_LANDMARK'
,p_message_language=>'fr'
,p_message_text=>'Erreur : %0'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138703887861751215)
,p_name=>'APEXIR_EXAMPLES'
,p_message_language=>'fr'
,p_message_text=>'Exemples'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138704693894751216)
,p_name=>'APEXIR_EXAMPLES_WITH_COLON'
,p_message_language=>'fr'
,p_message_text=>'Exemples :'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138666103360751204)
,p_name=>'APEXIR_EXCLUDE_NULL'
,p_message_language=>'fr'
,p_message_text=>'Exclure les valeurs NULL'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138705241350751216)
,p_name=>'APEXIR_EXPAND_COLLAPSE_ALT'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9velopper/R\00E9duire')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138702857570751215)
,p_name=>'APEXIR_EXPRESSION'
,p_message_language=>'fr'
,p_message_text=>'Expression'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138687737333751211)
,p_name=>'APEXIR_FILTER'
,p_message_language=>'fr'
,p_message_text=>'Filtrer'
,p_is_js_message=>true
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138698833675751214)
,p_name=>'APEXIR_FILTERS'
,p_message_language=>'fr'
,p_message_text=>'Filtres'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138709555089751217)
,p_name=>'APEXIR_FILTER_EXPRESSION'
,p_message_language=>'fr'
,p_message_text=>'Expression de filtre'
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138807765427751246)
,p_name=>'APEXIR_FILTER_EXPR_TOO_LONG'
,p_message_language=>'fr'
,p_message_text=>'L''expression de filtre est trop longue.'
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138652445191751200)
,p_name=>'APEXIR_FILTER_SUGGESTIONS'
,p_message_language=>'fr'
,p_message_text=>'Suggestions de filtre'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138709491371751217)
,p_name=>'APEXIR_FILTER_TYPE'
,p_message_language=>'fr'
,p_message_text=>'Type de filtre'
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138705448571751216)
,p_name=>'APEXIR_FINDER_ALT'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lectionner les colonnes \00E0 rechercher')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138688012954751211)
,p_name=>'APEXIR_FLASHBACK'
,p_message_language=>'fr'
,p_message_text=>'Flashback'
,p_is_js_message=>true
,p_version_scn=>2704767
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138702622715751215)
,p_name=>'APEXIR_FLASHBACK_DESCRIPTION'
,p_message_language=>'fr'
,p_message_text=>unistr('Une requ\00EAte Flashback permet de visualiser les donn\00E9es telles qu''elles existaient \00E0 un moment donn\00E9.')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138756644573751231)
,p_name=>'APEXIR_FLASHBACK_LABEL'
,p_message_language=>'fr'
,p_message_text=>unistr('Dur\00E9e de l''op\00E9ration Flashback')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138758051758751232)
,p_name=>'APEXIR_FORMAT'
,p_message_language=>'fr'
,p_message_text=>'Format'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138683886276751209)
,p_name=>'APEXIR_FORMAT_MASK'
,p_message_language=>'fr'
,p_message_text=>'Masque de format %0'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138695590634751213)
,p_name=>'APEXIR_FUNCTION'
,p_message_language=>'fr'
,p_message_text=>'Fonction'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138703365774751215)
,p_name=>'APEXIR_FUNCTIONS'
,p_message_language=>'fr'
,p_message_text=>'Fonctions %0'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138781076251751239)
,p_name=>'APEXIR_FUNCTIONS_OPERATORS'
,p_message_language=>'fr'
,p_message_text=>unistr('Fonctions/Op\00E9rateurs')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138695234396751213)
,p_name=>'APEXIR_FUNCTION_N'
,p_message_language=>'fr'
,p_message_text=>'Fonction %0'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138687577780751211)
,p_name=>'APEXIR_GO'
,p_message_language=>'fr'
,p_message_text=>'OK'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138661122209751203)
,p_name=>'APEXIR_GREEN'
,p_message_language=>'fr'
,p_message_text=>'vert'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138706179461751216)
,p_name=>'APEXIR_GROUPBY_COLUMNS'
,p_message_language=>'fr'
,p_message_text=>'Grouper par colonnes'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138706298767751216)
,p_name=>'APEXIR_GROUPBY_FUNCTIONS'
,p_message_language=>'fr'
,p_message_text=>'Fonctions de groupement'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138641400995751197)
,p_name=>'APEXIR_GROUP_BY'
,p_message_language=>'fr'
,p_message_text=>'Regrouper par'
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138782105092751239)
,p_name=>'APEXIR_GROUP_BY_COLUMN'
,p_message_language=>'fr'
,p_message_text=>'Grouper par colonne %0'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138737682229751226)
,p_name=>'APEXIR_GROUP_BY_COL_NOT_NULL'
,p_message_language=>'fr'
,p_message_text=>unistr('La colonne de regroupement doit \00EAtre indiqu\00E9e.')
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138748763886751229)
,p_name=>'APEXIR_GROUP_BY_MAX_ROW_CNT'
,p_message_language=>'fr'
,p_message_text=>unistr('Le nombre maximal de lignes pour la requ\00EAte Grouper par limite le nombre de lignes dans la requ\00EAte de base, et non le nombre le lignes affich\00E9es. Votre requ\00EAte de base d\00E9passe le nombre de lignes maximal de %0. Appliquez un filtre pour r\00E9duire le nom')
||unistr('bre d''enregistrements dans votre requ\00EAte de base.')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138728975073751223)
,p_name=>'APEXIR_GROUP_BY_SORT'
,p_message_language=>'fr'
,p_message_text=>'Grouper par tri'
,p_is_js_message=>true
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138785648530751240)
,p_name=>'APEXIR_GROUP_BY_SORT_ORDER'
,p_message_language=>'fr'
,p_message_text=>'Grouper par ordre de tri'
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138630590173751194)
,p_name=>'APEXIR_GROUP_BY_VIEW_OF'
,p_message_language=>'fr'
,p_message_text=>'Vue Grouper par pour %0'
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138666554007751204)
,p_name=>'APEXIR_HCOLUMN'
,p_message_language=>'fr'
,p_message_text=>'Colonne horizontale'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138700537927751214)
,p_name=>'APEXIR_HELP'
,p_message_language=>'fr'
,p_message_text=>'Aide'
,p_is_js_message=>true
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138692396994751212)
,p_name=>'APEXIR_HELP_01'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Les \00E9tats interactifs permettent aux utilisateurs finals de personnaliser des \00E9tats. Les utilisateurs peuvent modifier la mise en page des donn\00E9es d''\00E9tat en choisissant des colonnes, en appliquant des filtres, en mettant des valeurs en \00E9vidence et en')
||unistr(' les triant. Ils peuvent \00E9galement d\00E9finir des sections, des agr\00E9gations, des graphiques et des regroupements, et ajouter leurs propres calculs. Ils peuvent aussi configurer un abonnement pour l''envoi par courriel d''une version HTML de l''\00E9tat \00E0 un in')
||unistr('tervalle d\00E9fini. Ils peuvent cr\00E9er plusieurs versions d''un \00E9tat et les enregistrer en tant qu''\00E9tats nomm\00E9s, pour une utilisation publique ou priv\00E9e. '),
'<p/>',
unistr('Les sections qui suivent r\00E9capitulent les m\00E9thodes de personnalisation d''un \00E9tat interactif. Pour en savoir plus, reportez-vous \00E0 Utilisation d''\00E9tats interactifs dans le <i>guide de l''utilisateur final Oracle APEX</i>.')))
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138699430810751214)
,p_name=>'APEXIR_HELP_ACTIONS_MENU'
,p_message_language=>'fr'
,p_message_text=>unistr('Le menu Actions se trouve \00E0 droite du bouton Ex\00E9cuter dans la barre de recherche. Utilisez ce menu pour personnaliser un \00E9tat interactif.')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138693104064751212)
,p_name=>'APEXIR_HELP_AGGREGATE'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Les agr\00E9gats sont des calculs math\00E9matiques r\00E9alis\00E9s sur une colonne. Ils sont affich\00E9s apr\00E8s chaque commande BREAK et \00E0 la fin de l''\00E9tat dans la colonne o\00F9 ils sont d\00E9finis. Les options disponibles sont les suivantes :'),
'<p>',
'</p><ul>',
unistr('<ul><li><strong>Agr\00E9gation</strong> permet de s\00E9lectionner un agr\00E9gat'),
unistr('pr\00E9d\00E9fini \00E0 modifier.</li>'),
unistr('<li><strong>Fonction</strong> est la fonction \00E0 ex\00E9cuter (exemple : SUM, MIN).</li>'),
unistr('<li><strong>Colonne</strong> permet de s\00E9lectionner la colonne \00E0 laquelle appliquer la fonction math\00E9matique. Seules les colonnes num\00E9riques'),
unistr('seront affich\00E9es.</li>'),
'</ul>'))
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138693250185751212)
,p_name=>'APEXIR_HELP_CHART'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Vous pouvez d\00E9finir un graphique par \00E9tat interactif. Une fois'),
unistr('que vous l''avez d\00E9fini, vous pouvez basculer de la vue du graphique \00E0 celle de l''\00E9tat \00E0 l''aide des ic\00F4nes de vue de la barre de recherche.'),
'Les options disponibles sont les suivantes :  ',
'<p>',
'</p><ul>',
unistr('<li><strong>Type de graphique</strong> indique le type de graphique \00E0 inclure.'),
unistr('S\00E9lectionnez A barres horizontales, A barres verticales, A secteurs ou A courbes.</li>'),
unistr('<li><strong>Libell\00E9</strong> permet de s\00E9lectionner la colonne \00E0 utiliser comme libell\00E9.</li>'),
unistr('<li><strong>Titre de l''axe pour le libell\00E9</strong> indique le titre qui appara\00EEtra sur l''axe associ\00E9 \00E0 la colonne d\00E9finie'),
unistr('comme libell\00E9. Cette option n''est pas disponible pour les graphiques \00E0 secteurs.</li>'),
unistr('<li><strong>Valeur</strong> permet de s\00E9lectionner la colonne \00E0 utiliser comme valeur. Si votre fonction'),
unistr('est de type COUNT, il est inutile de s\00E9lectionner une valeur.</li>'),
unistr('<li><strong>Titre de l''axe pour la valeur</strong> indique le titre qui appara\00EEtra sur l''axe associ\00E9 \00E0 la colonne d\00E9finie'),
unistr('comme valeur. Cette option n''est pas disponible pour les graphiques \00E0 secteurs.</li>'),
unistr('<li><strong>Fonction</strong> est une fonction facultative \00E0 ex\00E9cuter sur la colonne s\00E9lectionn\00E9e comme valeur.</li>'),
unistr('<li><strong>Trier</strong> permet de trier l''ensemble de r\00E9sultats.</li></ul>')))
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138692562112751212)
,p_name=>'APEXIR_HELP_COLUMN_HEADING_MENU'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Si vous cliquez sur un en-t\00EAte de colonne, cela affiche un menu d''en-t\00EAte de colonne. Les options disponibles sont les suivantes :'),
'<p></p>',
'<ul>',
unistr('<li><strong>Ic\00F4ne de tri par ordre croissant :</strong> permet de trier les \00E9tats par ordre croissant.</li>'),
unistr('<li><strong>Ic\00F4ne de tri par ordre d\00E9croissant :</strong> permet de trier les \00E9tats par ordre d\00E9croissant.</li>'),
unistr('<li><strong>Masquer la colonne :</strong> permet de masquer une colonne. Les colonnes ne peuvent pas toutes \00EAtre masqu\00E9es. Si une colonne ne peut pas l''\00EAtre, cette ic\00F4ne n''est pas disponible.</li>'),
unistr('<li><strong>Colonne de section (BREAK) :</strong> permet de cr\00E9er un groupe de section sur la colonne, ce qui extrait la colonne de l''\00E9tat comme enregistrement ma\00EEtre.</li>'),
'<li><strong>Informations de colonne :</strong> permet d''afficher l''aide de la colonne, si elle existe.</li>',
unistr('<li><strong>Zone de texte :</strong> permet de saisir des crit\00E8res de recherche,'),
unistr('sans distinction entre les majuscules et les minuscules (caract\00E8res g\00E9n\00E9riques inutiles). Si vous saisissez une valeur, cela r\00E9duira'),
unistr('la liste de valeurs au bas du menu. Vous pourrez ensuite s\00E9lectionner une valeur du'),
unistr('bas du menu et cette valeur sera cr\00E9\00E9e en tant que filtre gr\00E2ce \00E0 l''op\00E9rateur ''='''),
unistr('(par exemple, <code>colonne = ''ABC''</code>). Vous pouvez \00E9galement cliquer sur l''ic\00F4ne repr\00E9sentant une torche pour que la valeur saisie soit cr\00E9\00E9e en tant que filtre avec le modificateur ''LIKE'''),
'(par exemple, <code>colonne LIKE ''%ABC%''</code>).</li>',
unistr('<li>La <strong>liste de valeurs uniques</strong> contient les 500 premi\00E8res valeurs uniques'),
unistr('correspondant \00E0 vos filtres. Si la colonne est une date, une liste de'),
unistr('plages de dates s''affiche \00E0 la place. Si vous s\00E9lectionnez une valeur, un filtre sera cr\00E9\00E9 avec'),
unistr('l''op\00E9rateur ''='' (par exemple, <code>colonne = ''ABC''</code>).</li>'),
'</ul>'))
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138693020291751212)
,p_name=>'APEXIR_HELP_COMPUTE'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Permet d''ajouter des colonnes calcul\00E9es \00E0 votre \00E9tat. Il peut s''agir de calculs math\00E9matiques (comme <code>NBR_HOURS/24</code>) ou de fonctions Oracle'),
unistr('standard appliqu\00E9es \00E0 des colonnes existantes (certaines sont affich\00E9es comme exemple tandis que d''autres, telles que <code>TO_DATE</code>, peuvent \00E9galement \00EAtre utilis\00E9es).'),
'Les options disponibles sont les suivantes :',
'<p></p>',
'<ul>',
unistr('<li><strong>Calcul</strong> permet de s\00E9lectionner un calcul pr\00E9d\00E9fini \00E0 modifier.</li>'),
unistr('<li><strong>En-t\00EAte de colonne</strong> d\00E9signe l''en-t\00EAte de la nouvelle colonne.</li>'),
unistr('<li><strong>Masque de format</strong> d\00E9signe un masque de format Oracle \00E0 appliquer \00E0 la colonne (par exemple, S9999).</li>'),
unistr('<li><strong>Calcul</strong> d\00E9signe le calcul \00E0 ex\00E9cuter. Dans le calcul, les colonnes sont r\00E9f\00E9renc\00E9es \00E0 l''aide des alias affich\00E9s.</li>'),
'</ul>',
unistr('<p>Sous le calcul, les colonnes de votre requ\00EAte sont affich\00E9es avec'),
unistr('leur alias associ\00E9. Si vous cliquez sur un nom de colonne ou un alias,'),
'celui-ci sera inscrit dans le calcul. En regard des colonnes, un clavier fournit simplement',
unistr('des raccourcis pour les touches fr\00E9quemment utilis\00E9es. A droite se trouvent les fonctions.</p>'),
unistr('<p>Voici un exemple de calcul permettant d''afficher la r\00E9mun\00E9ration totale :</p>'),
'<pre>CASE WHEN A = ''SALES'' THEN B + C ELSE B END</pre>',
unistr('(o\00F9 A est ORGANIZATION, B est SALARY et C, COMMISSION)'),
''))
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138699580399751214)
,p_name=>'APEXIR_HELP_CONTROL_BREAK'
,p_message_language=>'fr'
,p_message_text=>unistr('Utilis\00E9 pour cr\00E9er un groupe de section sur une ou plusieurs colonnes, ce qui extrait les colonnes de l''\00E9tat interactif et les affiche comme enregistrements ma\00EEtre.')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138693775743751212)
,p_name=>'APEXIR_HELP_DETAIL_VIEW'
,p_message_language=>'fr'
,p_message_text=>unistr('Pour afficher les d\00E9tails d''une seule ligne \00E0 la fois, cliquez sur l''ic\00F4ne de vue monoligne sur la ligne que vous souhaitez visualiser. Si l''option est disponible, la vue monoligne sera toujours la premi\00E8re colonne. En fonction de la personnalisation')
||unistr(' de l''\00E9tat interactif, la vue monoligne peut \00EAtre la vue standard ou une page personnalis\00E9e pouvant \00EAtre mise \00E0 jour.')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138693607210751212)
,p_name=>'APEXIR_HELP_DOWNLOAD'
,p_message_language=>'fr'
,p_message_text=>unistr('Permet le t\00E9l\00E9chargement de l''ensemble de r\00E9sultats en cours. Les formats de t\00E9l\00E9chargement sont les suivants : PDF, Excel, HTML et CSV. Les options de t\00E9l\00E9chargement sont diff\00E9rentes en fonction du format s\00E9lectionn\00E9. Tous les formats peuvent \00E9galem')
||unistr('ent \00EAtre envoy\00E9s en tant que courriel.')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138692730225751212)
,p_name=>'APEXIR_HELP_FILTER'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Active l''\00E9tat en ajoutant ou modifiant la clause <code>WHERE</code> de la requ\00EAte. Vous pouvez filtrer par colonne ou par ligne.  '),
unistr('<p>Si vous filtrez par colonne, vous devez s\00E9lectionner une colonne (pas n\00E9cessairement'),
unistr('une de celles affich\00E9es), choisir un op\00E9rateur Oracle standard (=, !=, n''est pas dans, entre), puis saisir une expression \00E0 comparer. Les expressions font la distinction entre les majuscules et les minuscules. Vous pouvez utiliser le caract\00E8re g\00E9n\00E9ri')
||'que % (par exemple, <code>STATE_NAME',
'like A%)</code>.</p>',
unistr('<p>Si vous filtrez par ligne, vous pouvez cr\00E9er des clauses <code>WHERE</code> complexes \00E0 l''aide'),
unistr('d''alias de colonne et de toute fonction ou tout op\00E9rateur Oracle (par exemple, <code>G = ''VA'' ou G = ''CT''</code>, o\00F9'),
'<code>G</code> est l''alias de <code>CUSTOMER_STATE</code>).</p>',
''))
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138693316634751212)
,p_name=>'APEXIR_HELP_FLASHBACK'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Une requ\00EAte Flashback vous permet de visualiser les donn\00E9es telles qu''elles existaient'),
unistr('\00E0 un moment donn\00E9. Par d\00E9faut, l''op\00E9ration Flashback permet de remonter \00E0 3 heures (ou 180 minutes)'),
unistr('mais la dur\00E9e r\00E9elle sera diff\00E9rente en fonction de la base de donn\00E9es.')))
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138757914128751232)
,p_name=>'APEXIR_HELP_FORMAT'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>L''\00E9l\00E9ment Format permet de personnaliser l''affichage d''un \00E9tat.'),
'Il comprend les sous-menus suivants :</p>',
'<ul><li>Trier</li>',
'<li>Commande BREAK</li>',
unistr('<li>Mise en \00E9vidence</li>'),
'<li>Calculer</li>',
unistr('<li>Agr\00E9gat</li>'),
'<li>Graphique</li>',
'<li>Grouper par</li>',
'<li>Pivot</li>',
'</ul>',
''))
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138756187998751231)
,p_name=>'APEXIR_HELP_GROUP_BY'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Vous pouvez d\00E9finir une vue Grouper par pour chaque \00E9tat'),
unistr('enregistr\00E9. Une fois d\00E9fini, vous pouvez basculer entre la vue Grouper par et la vue'),
unistr('d''\00E9tat \00E0 l''aide des ic\00F4nes de vue situ\00E9es en dessous de la barre de recherche. Pour cr\00E9er une vue Grouper par,'),
unistr('vous s\00E9lectionnez :'),
'<p></p><ul>',
'<li>les colonnes sur la base desquelles former le groupe</li>',
unistr('<li>les colonnes \00E0 agr\00E9ger, ainsi que la fonction \00E0 ex\00E9cuter (moyenne, somme, nombre, etc.)</li>'),
'</ul>'))
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138692995441751212)
,p_name=>'APEXIR_HELP_HIGHLIGHT'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Permet de d\00E9finir un filtre. Les lignes correspondant aux crit\00E8res du filtre sont mises en \00E9vidence \00E0 l''aide des caract\00E9ristiques associ\00E9es au filtre. Les options disponibles sont les suivantes :</p>'),
'<ul>',
unistr('<li><strong>Nom</strong> est utilis\00E9 uniquement pour l''affichage.</li>'),
unistr('<li><strong>S\00E9quence</strong> identifie la s\00E9quence utilis\00E9e pour l''\00E9valuation des r\00E8gles.</li>'),
unistr('<li><strong>Activ\00E9</strong> indique si la r\00E8gle est activ\00E9e ou non.</li>'),
unistr('<li><strong>Mettre le type en \00E9vidence</strong> indique si la ligne ou la cellule doit \00EAtre'),
unistr('mise en \00E9vidence. Si vous s\00E9lectionnez la cellule, la colonne r\00E9f\00E9renc\00E9e sous'),
unistr('Conditions de mise en \00E9vidence sera mise en \00E9vidence.</li>'),
unistr('<li><strong>Couleur d''arri\00E8re-plan</strong> indique la nouvelle couleur d''arri\00E8re-plan pour les zones mises en \00E9vidence.</li>'),
unistr('<li><strong>Couleur du texte</strong> indique la nouvelle couleur de texte pour les zones mises en \00E9vidence.</li>'),
unistr('<li><strong>Conditions de mise en \00E9vidence</strong> d\00E9finit vos conditions de filtrage.</li>'),
'</ul>',
''))
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138586371926751181)
,p_name=>'APEXIR_HELP_PIVOT'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Vous pouvez d\00E9finir une vue de permutation lignes vers colonnes pour chaque \00E9tat enregistr\00E9. Cela permet ensuite de basculer entre la vue de permutation lignes vers colonnes et la vue d''\00E9tat \00E0 l''aide des ic\00F4nes d''affichage de la barre de recherche. P')
||unistr('our cr\00E9er une vue de permutation lignes vers colonnes, vous devez s\00E9lectionner : '),
'<p></p>',
'<ul>',
'<li>les colonnes sur lesquelles effectuer la permutation lignes vers colonnes ;</li>',
unistr('<li>les colonnes \00E0 afficher en tant que lignes ; </li>'),
unistr('<li>les colonnes \00E0 agr\00E9ger, ainsi que la fonction \00E0 ex\00E9cuter (moyenne, somme, d\00E9compte, etc.).</li>'),
'</ul>'))
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138704062507751216)
,p_name=>'APEXIR_HELP_REPORT_SETTINGS'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Si vous personnalisez un \00E9tat interactif, les param\00E8tres d''\00E9tat seront affich\00E9s'),
unistr('en dessous de la barre de recherche et au-dessus de l''\00E9tat. Cette zone peut \00EAtre r\00E9duite et d\00E9velopp\00E9e \00E0 l''aide de l''ic\00F4ne de gauche.'),
'<p>',
unistr('Pour chaque param\00E8tre d''\00E9tat, vous pouvez effectuer les op\00E9rations suivantes :'),
'</p><ul>',
unistr('<li>Modifier un param\00E8tre en cliquant sur le nom.</li>'),
unistr('<li>D\00E9sactiver/Activer un param\00E8tre en cochant ou en d\00E9s\00E9lectionnant la case Activer/D\00E9sactiver. Ceci permet d''activer et de d\00E9sactiver temporairement le param\00E8tre.</li>'),
unistr('<li>Enlever un param\00E8tre en cliquant sur l''ic\00F4ne Enlever.</li>'),
'</ul>',
unistr('<p>Si vous avez cr\00E9\00E9 un graphique, un regroupement ou un pivot, vous pouvez basculer entre eux'),
unistr('et l''\00E9tat de base via les liens de vue d''\00E9tat, Vue de graphique, Vue Grouper par et Vue de pivot'),
'sur la droite. Si vous visualisez le graphique, le regroupement ou le pivot, vous',
unistr('pouvez \00E9galement utiliser le lien Modifier pour modifier les param\00E8tres.</p>'),
''))
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138693569243751212)
,p_name=>'APEXIR_HELP_RESET'
,p_message_language=>'fr'
,p_message_text=>unistr('R\00E9initialise l''\00E9tat pour retrouver les param\00E8tres par d\00E9faut, ce qui enl\00E8ve toute personnalisation effectu\00E9e.')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138758278734751232)
,p_name=>'APEXIR_HELP_ROWS_PER_PAGE'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9finit le nombre d''enregistrements \00E0 afficher par page.')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138693448575751212)
,p_name=>'APEXIR_HELP_SAVE_REPORT'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Enregistre l''\00E9tat personnalis\00E9 en vue d''une utilisation ult\00E9rieure. Vous devez indiquer un nom, pouvez entrer une description et rendre l''\00E9tat accessible au public (\00E0 savoir, \00E0 tous les utilisateurs pouvant acc\00E9der \00E0 l''\00E9tat par d\00E9faut principal). ')
||unistr('Vous pouvez enregistrer quatre types d''\00E9tat interactif :</p>'),
'<ul>',
unistr('<li><strong>Val. par d\00E9faut du principal</strong> (d\00E9veloppeur uniquement) : l''\00E9tat par d\00E9faut principal est celui qui est affich\00E9 initialement. Les \00E9tats de ce type ne peuvent \00EAtre ni renomm\00E9s, ni supprim\00E9s.</li>'),
unistr('<li><strong>Etat de remplacement</strong> (d\00E9veloppeur uniquement) : permet aux d\00E9veloppeurs de cr\00E9er diff\00E9rentes mises en page d''\00E9tat. Seuls les d\00E9veloppeurs sont autoris\00E9s \00E0 enregistrer, renommer et supprimer ce type d''\00E9tat.</li>'),
unistr('<li><strong>Etat public</strong> (utilisateur final) : ce type d''\00E9tat peut \00EAtre enregistr\00E9, renomm\00E9 et supprim\00E9 par l''utilisateur final l''ayant cr\00E9\00E9. Les autres utilisateurs peuvent visualiser et enregistrer la mise en page, comme pour les autres \00E9ta')
||'ts.</li>',
unistr('<li><strong>Etat priv\00E9</strong> (utilisateur final) : seul l''utilisateur final ayant cr\00E9\00E9 l''\00E9tat est autoris\00E9 \00E0 le visualiser, l''enregistrer, le renommer et le supprimer.</li>'),
'</ul>',
unistr('<p>Lorsque vous enregistrez des \00E9tats personnalis\00E9s, un s\00E9lecteur d''\00E9tats appara\00EEt dans la barre de recherche \00E0 gauche du s\00E9lecteur de lignes (\00E0 condition que cette fonctionnalit\00E9 soit activ\00E9e).</p>'),
''))
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138692438707751212)
,p_name=>'APEXIR_HELP_SEARCH_BAR'
,p_message_language=>'fr'
,p_message_text=>unistr('Une r\00E9gion de recherche se trouve dans la partie sup\00E9rieure de chaque page d''\00E9tat. Cette r\00E9gion (ou barre de recherche) fournit les fonctionnalit\00E9s suivantes :')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138758856135751232)
,p_name=>'APEXIR_HELP_SEARCH_BAR_ACTIONS_MENU'
,p_message_language=>'fr'
,p_message_text=>unistr('<li>Le <strong>menu Actions</strong> permet de personnaliser un \00E9tat. Reportez-vous aux sections qui suivent.</li>')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138758322411751232)
,p_name=>'APEXIR_HELP_SEARCH_BAR_FINDER'
,p_message_language=>'fr'
,p_message_text=>unistr('<li>L''<strong>ic\00F4ne S\00E9lectionner des colonnes</strong> permet d''indiquer les colonnes sur lesquelles doit porter la recherche (ou toutes les colonnes).</li>')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138758601877751232)
,p_name=>'APEXIR_HELP_SEARCH_BAR_REPORTS'
,p_message_language=>'fr'
,p_message_text=>unistr('<li>L''option <strong>Etats</strong> permet d''afficher les autres \00E9tats par d\00E9faut, et les \00E9tats enregistr\00E9s priv\00E9s ou publics.</li>')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138758558613751232)
,p_name=>'APEXIR_HELP_SEARCH_BAR_ROWS'
,p_message_language=>'fr'
,p_message_text=>unistr('<li>Le champ <strong>Lignes</strong> permet de d\00E9finir le nombre d''enregistrements \00E0 afficher par page.</li>')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138758428415751232)
,p_name=>'APEXIR_HELP_SEARCH_BAR_TEXTBOX'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<li>La <strong>zone de texte</strong> permet d''entrer des crit\00E8res de recherche sans distinction entre les majuscules et les minuscules (les caract\00E8res g\00E9n\00E9riques sont implicites).</li>'),
unistr('<li>Le <strong>bouton OK</strong> permet de lancer la recherche. Si vous appuyez sur la touche Entr\00E9e, la recherche sera \00E9galement ex\00E9cut\00E9e lorsque le curseur se trouve dans la zone de recherche de texte.</li>')))
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138758792617751232)
,p_name=>'APEXIR_HELP_SEARCH_BAR_VIEW'
,p_message_language=>'fr'
,p_message_text=>unistr('<li>L''option <strong>Ic\00F4nes Vue</strong> permet de basculer entre les vues d''ic\00F4ne, d''\00E9tat, de d\00E9tail, de graphique, de regroupement et de pivot de l''\00E9tat si elles sont d\00E9finies.</li>')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138692603583751212)
,p_name=>'APEXIR_HELP_SELECT_COLUMNS'
,p_message_language=>'fr'
,p_message_text=>unistr('Utilis\00E9 pour modifier les colonnes affich\00E9es. Les colonnes situ\00E9es sur la droite sont affich\00E9es, tandis que celles situ\00E9es sur la gauche sont masqu\00E9es. Vous pouvez re-trier les colonnes affich\00E9es \00E0 l''aide de la fl\00E8che situ\00E9e \00E0 droite. Les colonnes ca')
||unistr('lcul\00E9es sont pr\00E9c\00E9d\00E9es par <strong>**</strong>.')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138692855122751212)
,p_name=>'APEXIR_HELP_SORT'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Utilis\00E9 pour modifier les colonnes \00E0 utiliser pour trier et d\00E9terminer si'),
unistr('le tri doit \00EAtre croissant ou d\00E9croissant. Vous pouvez \00E9galement indiquer comment g\00E9rer'),
unistr('les valeurs <code>NULL</code>. Le param\00E8tre par d\00E9faut affiche toujours les valeurs <code>NULL</code> en premier ou en dernier. Le tri r\00E9sultant est affich\00E9 \00E0 droite'),
unistr('des en-t\00EAtes de colonnes dans l''\00E9tat.</p>')))
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138755931707751231)
,p_name=>'APEXIR_HELP_SUBSCRIPTION'
,p_message_language=>'fr'
,p_message_text=>unistr('Lorsque vous ajoutez un abonnement, vous fournissez une adresse \00E9lectronique (ou plusieurs adresses \00E9lectroniques s\00E9par\00E9es par des virgules), un objet de courriel, une fr\00E9quence, et des dates de d\00E9but et de fin. Les courriels obtenus seront une versi')
||unistr('on export\00E9e (PDF, Excel, HTML ou CSV) de l''\00E9tat interactif contenant les donn\00E9es en cours utilisant les param\00E8tres d''\00E9tat pr\00E9sents lors de l''ajout de l''abonnement.')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138697592660751214)
,p_name=>'APEXIR_HIDE_COLUMN'
,p_message_language=>'fr'
,p_message_text=>'Masquer la colonne'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138687999609751211)
,p_name=>'APEXIR_HIGHLIGHT'
,p_message_language=>'fr'
,p_message_text=>unistr('Mettre en \00E9vidence')
,p_is_js_message=>true
,p_version_scn=>2704767
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138699000123751214)
,p_name=>'APEXIR_HIGHLIGHTS'
,p_message_language=>'fr'
,p_message_text=>unistr('Mises en \00E9vidence')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138669264595751205)
,p_name=>'APEXIR_HIGHLIGHT_CELL_WITH_COLORS'
,p_message_language=>'fr'
,p_message_text=>unistr('Mettre en \00E9vidence une cellule, %0 sur %1')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138704153203751216)
,p_name=>'APEXIR_HIGHLIGHT_CONDITION'
,p_message_language=>'fr'
,p_message_text=>unistr('Conditions de mises en \00E9vidence')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138669187187751205)
,p_name=>'APEXIR_HIGHLIGHT_ROW_WITH_COLORS'
,p_message_language=>'fr'
,p_message_text=>unistr('Mettre en \00E9vidence une ligne, %0 sur %1')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138756598826751231)
,p_name=>'APEXIR_HIGHLIGHT_STYLE'
,p_message_language=>'fr'
,p_message_text=>unistr('Style de mise en \00E9vidence')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138660711649751203)
,p_name=>'APEXIR_HIGHLIGHT_TYPE'
,p_message_language=>'fr'
,p_message_text=>unistr('Mettre le type en \00E9vidence')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138775333364751237)
,p_name=>'APEXIR_HORIZONTAL'
,p_message_language=>'fr'
,p_message_text=>'Horizontal'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138804397299751245)
,p_name=>'APEXIR_INACTIVE_SETTING'
,p_message_language=>'fr'
,p_message_text=>unistr('1 param\00E8tre inactif')
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138804457937751246)
,p_name=>'APEXIR_INACTIVE_SETTINGS'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 param\00E8tres inactifs')
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138694143078751213)
,p_name=>'APEXIR_INTERACTIVE_REPORT_HELP'
,p_message_language=>'fr'
,p_message_text=>unistr('Aide de l''\00E9tat interactif')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138705158584751216)
,p_name=>'APEXIR_INVALID'
,p_message_language=>'fr'
,p_message_text=>'Non valide'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138698562857751214)
,p_name=>'APEXIR_INVALID_COMPUTATION'
,p_message_language=>'fr'
,p_message_text=>'Expression de calcul non valide. %0'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138654136032751201)
,p_name=>'APEXIR_INVALID_END_DATE'
,p_message_language=>'fr'
,p_message_text=>unistr('La date de fin doit \00EAtre post\00E9rieure \00E0 la date de d\00E9but.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138713312058751218)
,p_name=>'APEXIR_INVALID_FILTER'
,p_message_language=>'fr'
,p_message_text=>'Expression de filtre non valide. %0'
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138783178715751239)
,p_name=>'APEXIR_INVALID_FILTER_QUERY'
,p_message_language=>'fr'
,p_message_text=>unistr('Requ\00EAte de filtrage non valide')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138804573247751246)
,p_name=>'APEXIR_INVALID_SETTING'
,p_message_language=>'fr'
,p_message_text=>unistr('1 param\00E8tre non valide')
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138804693900751246)
,p_name=>'APEXIR_INVALID_SETTINGS'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 param\00E8tres non valides')
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138756717902751231)
,p_name=>'APEXIR_IN_MINUTES'
,p_message_language=>'fr'
,p_message_text=>'(en minutes)'
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138773723853751236)
,p_name=>'APEXIR_IS_IN_THE_LAST'
,p_message_language=>'fr'
,p_message_text=>'%0 est dans les derniers %1'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138773955984751236)
,p_name=>'APEXIR_IS_IN_THE_NEXT'
,p_message_language=>'fr'
,p_message_text=>'%0 est dans les %1 suivants'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138773899837751236)
,p_name=>'APEXIR_IS_NOT_IN_THE_LAST'
,p_message_language=>'fr'
,p_message_text=>'%0 n''est pas dans les derniers %1'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138774044808751236)
,p_name=>'APEXIR_IS_NOT_IN_THE_NEXT'
,p_message_language=>'fr'
,p_message_text=>'%0 n''est pas dans les %1 suivants'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138703277536751215)
,p_name=>'APEXIR_KEYPAD'
,p_message_language=>'fr'
,p_message_text=>'Clavier'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138666965115751204)
,p_name=>'APEXIR_LABEL'
,p_message_language=>'fr'
,p_message_text=>unistr('Libell\00E9 %0')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138697148275751213)
,p_name=>'APEXIR_LABEL_AXIS_TITLE'
,p_message_language=>'fr'
,p_message_text=>unistr('Titre de l''axe pour le libell\00E9')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138689445849751211)
,p_name=>'APEXIR_LAST_DAY'
,p_message_language=>'fr'
,p_message_text=>'La veille'
,p_version_scn=>2704768
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138689606526751211)
,p_name=>'APEXIR_LAST_HOUR'
,p_message_language=>'fr'
,p_message_text=>unistr('Derni\00E8re heure')
,p_version_scn=>2704768
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138689171155751211)
,p_name=>'APEXIR_LAST_MONTH'
,p_message_language=>'fr'
,p_message_text=>'Le mois dernier'
,p_version_scn=>2704768
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138689256598751211)
,p_name=>'APEXIR_LAST_WEEK'
,p_message_language=>'fr'
,p_message_text=>unistr('La semaine derni\00E8re')
,p_version_scn=>2704768
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138689351854751211)
,p_name=>'APEXIR_LAST_X_DAYS'
,p_message_language=>'fr'
,p_message_text=>'Les %0 derniers jours'
,p_version_scn=>2704768
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138689548345751211)
,p_name=>'APEXIR_LAST_X_HOURS'
,p_message_language=>'fr'
,p_message_text=>unistr('Les %0 derni\00E8res heures')
,p_version_scn=>2704768
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138688994793751211)
,p_name=>'APEXIR_LAST_X_YEARS'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 derni\00E8res ann\00E9es')
,p_version_scn=>2704767
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138689050242751211)
,p_name=>'APEXIR_LAST_YEAR'
,p_message_language=>'fr'
,p_message_text=>unistr('L''ann\00E9e derni\00E8re')
,p_version_scn=>2704768
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138666803799751204)
,p_name=>'APEXIR_LINE'
,p_message_language=>'fr'
,p_message_text=>unistr('Graphique \00E0 courbes')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138663668501751203)
,p_name=>'APEXIR_LINE_WITH_AREA'
,p_message_language=>'fr'
,p_message_text=>'A courbes avec aires'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138783013074751239)
,p_name=>'APEXIR_MAP_IT'
,p_message_language=>'fr'
,p_message_text=>'Mise en correspondance'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138698046790751214)
,p_name=>'APEXIR_MAX_QUERY_COST'
,p_message_language=>'fr'
,p_message_text=>unistr('Selon les estimations, la requ\00EAte d\00E9passe les ressources maximales autoris\00E9es. Modifiez les param\00E8tres de votre \00E9tat et r\00E9essayez.')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138679416046751208)
,p_name=>'APEXIR_MAX_ROW_CNT'
,p_message_language=>'fr'
,p_message_text=>unistr('Le nombre maximal de lignes pour cet \00E9tat est de %0 lignes. Appliquez un filtre pour r\00E9duire le nombre d''enregistrements dans votre requ\00EAte.')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138783628045751239)
,p_name=>'APEXIR_MAX_X'
,p_message_language=>'fr'
,p_message_text=>'Maximum de %0'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138783890310751239)
,p_name=>'APEXIR_MEDIAN_X'
,p_message_language=>'fr'
,p_message_text=>unistr('M\00E9diane de %0')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138626174472751192)
,p_name=>'APEXIR_MESSAGE'
,p_message_language=>'fr'
,p_message_text=>'Message'
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138683739271751209)
,p_name=>'APEXIR_MIN_AGO'
,p_message_language=>'fr'
,p_message_text=>'Il y a %0 minutes'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138783725127751239)
,p_name=>'APEXIR_MIN_X'
,p_message_language=>'fr'
,p_message_text=>'Minimum de %0'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138782786426751239)
,p_name=>'APEXIR_MONTH'
,p_message_language=>'fr'
,p_message_text=>'Mois'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138757152924751231)
,p_name=>'APEXIR_MONTHLY'
,p_message_language=>'fr'
,p_message_text=>'Mensuel'
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138696305516751213)
,p_name=>'APEXIR_MOVE'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9placer')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138696234460751213)
,p_name=>'APEXIR_MOVE_ALL'
,p_message_language=>'fr'
,p_message_text=>unistr('Tout d\00E9placer')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138809484185751247)
,p_name=>'APEXIR_MULTIIR_PAGE_REGION_STATIC_ID_REQUIRED'
,p_message_language=>'fr'
,p_message_text=>unistr('L''ID statique de r\00E9gion doit \00EAtre indiqu\00E9, car la page contient plusieurs \00E9tats interactifs.')
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138662364035751203)
,p_name=>'APEXIR_NAME'
,p_message_language=>'fr'
,p_message_text=>'Nom'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138692032575751212)
,p_name=>'APEXIR_NEW_AGGREGATION'
,p_message_language=>'fr'
,p_message_text=>unistr('Nouvelle agr\00E9gation')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138805281072751246)
,p_name=>'APEXIR_NEW_CATEGORY_LABEL'
,p_message_language=>'fr'
,p_message_text=>unistr('Nouvelle cat\00E9gorie')
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138692112485751212)
,p_name=>'APEXIR_NEW_COMPUTATION'
,p_message_language=>'fr'
,p_message_text=>'Nouveau calcul'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138686898391751210)
,p_name=>'APEXIR_NEXT'
,p_message_language=>'fr'
,p_message_text=>'Suivant'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138689947980751211)
,p_name=>'APEXIR_NEXT_DAY'
,p_message_language=>'fr'
,p_message_text=>'Jour suivant'
,p_version_scn=>2704768
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138689752841751211)
,p_name=>'APEXIR_NEXT_HOUR'
,p_message_language=>'fr'
,p_message_text=>'Heure suivante'
,p_version_scn=>2704768
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138690259579751211)
,p_name=>'APEXIR_NEXT_MONTH'
,p_message_language=>'fr'
,p_message_text=>'Mois suivant'
,p_version_scn=>2704768
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138690158061751211)
,p_name=>'APEXIR_NEXT_WEEK'
,p_message_language=>'fr'
,p_message_text=>'La semaine prochaine'
,p_version_scn=>2704768
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138690056952751211)
,p_name=>'APEXIR_NEXT_X_DAYS'
,p_message_language=>'fr'
,p_message_text=>'%0 prochains jours'
,p_version_scn=>2704768
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138689891103751211)
,p_name=>'APEXIR_NEXT_X_HOURS'
,p_message_language=>'fr'
,p_message_text=>'%0 prochaines heures'
,p_version_scn=>2704768
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138690412958751211)
,p_name=>'APEXIR_NEXT_X_YEARS'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 prochaines ann\00E9es')
,p_version_scn=>2704768
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138690348831751211)
,p_name=>'APEXIR_NEXT_YEAR'
,p_message_language=>'fr'
,p_message_text=>unistr('Ann\00E9e suivante')
,p_version_scn=>2704768
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138662635808751203)
,p_name=>'APEXIR_NO'
,p_message_language=>'fr'
,p_message_text=>'Non'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138705358339751216)
,p_name=>'APEXIR_NONE'
,p_message_language=>'fr'
,p_message_text=>'- Aucun -'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138756378882751231)
,p_name=>'APEXIR_NOT_VALID_EMAIL'
,p_message_language=>'fr'
,p_message_text=>unistr('Adresse \00E9lectronique non valide.')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138628449711751193)
,p_name=>'APEXIR_NO_COLUMNS_SELECTED'
,p_message_language=>'fr'
,p_message_text=>unistr('Aucune colonne s\00E9lectionn\00E9e pour l''affichage. Utilisez <strong>Colonnes</strong> dans le menu Actions pour rendre les colonnes visibles.')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138701846590751215)
,p_name=>'APEXIR_NULLS_ALWAYS_FIRST'
,p_message_language=>'fr'
,p_message_text=>'Valeurs NULL toujours en premier'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138701799713751215)
,p_name=>'APEXIR_NULLS_ALWAYS_LAST'
,p_message_language=>'fr'
,p_message_text=>'Valeurs NULL toujours en dernier'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138702290256751215)
,p_name=>'APEXIR_NULL_SORTING'
,p_message_language=>'fr'
,p_message_text=>'Tri des valeurs NULL %0'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138698629754751214)
,p_name=>'APEXIR_NUMERIC_FLASHBACK_TIME'
,p_message_language=>'fr'
,p_message_text=>unistr('L''heure de l''op\00E9ration Flashback doit \00EAtre une valeur num\00E9rique.')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138698207630751214)
,p_name=>'APEXIR_NUMERIC_SEQUENCE'
,p_message_language=>'fr'
,p_message_text=>unistr('La s\00E9quence doit \00EAtre num\00E9rique.')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138702720970751215)
,p_name=>'APEXIR_OPERATOR'
,p_message_language=>'fr'
,p_message_text=>unistr('Op\00E9rateur')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138661232024751203)
,p_name=>'APEXIR_ORANGE'
,p_message_language=>'fr'
,p_message_text=>'orange'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138775221169751237)
,p_name=>'APEXIR_ORIENTATION'
,p_message_language=>'fr'
,p_message_text=>'Orientation'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138663194262751203)
,p_name=>'APEXIR_OTHER'
,p_message_language=>'fr'
,p_message_text=>'Autre'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138629307525751193)
,p_name=>'APEXIR_PAGINATION_OF'
,p_message_language=>'fr'
,p_message_text=>'Pagination pour %0'
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138643327118751197)
,p_name=>'APEXIR_PDF_ORIENTATION'
,p_message_language=>'fr'
,p_message_text=>'Orientation de page'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138644081283751198)
,p_name=>'APEXIR_PDF_ORIENTATION_HORIZONTAL'
,p_message_language=>'fr'
,p_message_text=>'Paysage'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138644159413751198)
,p_name=>'APEXIR_PDF_ORIENTATION_VERTICAL'
,p_message_language=>'fr'
,p_message_text=>'Portrait'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138643208357751197)
,p_name=>'APEXIR_PDF_PAGE_SIZE'
,p_message_language=>'fr'
,p_message_text=>'Taille de page'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138643822196751198)
,p_name=>'APEXIR_PDF_PAGE_SIZE_A3'
,p_message_language=>'fr'
,p_message_text=>'A3'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138643713501751198)
,p_name=>'APEXIR_PDF_PAGE_SIZE_A4'
,p_message_language=>'fr'
,p_message_text=>'A4'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138643977826751198)
,p_name=>'APEXIR_PDF_PAGE_SIZE_CUSTOM'
,p_message_language=>'fr'
,p_message_text=>unistr('Personnalis\00E9')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138643533166751197)
,p_name=>'APEXIR_PDF_PAGE_SIZE_LEGAL'
,p_message_language=>'fr'
,p_message_text=>'Legal'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138643468754751197)
,p_name=>'APEXIR_PDF_PAGE_SIZE_LETTER'
,p_message_language=>'fr'
,p_message_text=>'Lettre'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138643637130751198)
,p_name=>'APEXIR_PDF_PAGE_SIZE_TABLOID'
,p_message_language=>'fr'
,p_message_text=>unistr('Tablo\00EFd')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138784125053751239)
,p_name=>'APEXIR_PERCENT_OF_TOTAL_COUNT_X'
,p_message_language=>'fr'
,p_message_text=>'Pourcentage du nombre total de %0 (%)'
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138783377812751239)
,p_name=>'APEXIR_PERCENT_OF_TOTAL_SUM_X'
,p_message_language=>'fr'
,p_message_text=>'Pourcentage de la somme totale de %0 (%)'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138782379788751239)
,p_name=>'APEXIR_PERCENT_TOTAL_COUNT'
,p_message_language=>'fr'
,p_message_text=>'Pourcentage du nombre total'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138782251858751239)
,p_name=>'APEXIR_PERCENT_TOTAL_SUM'
,p_message_language=>'fr'
,p_message_text=>'Pourcentage de la somme totale'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138666716039751204)
,p_name=>'APEXIR_PIE'
,p_message_language=>'fr'
,p_message_text=>unistr('Graphique \00E0 secteurs')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138732452224751224)
,p_name=>'APEXIR_PIVOT'
,p_message_language=>'fr'
,p_message_text=>'Pivot'
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138733980568751224)
,p_name=>'APEXIR_PIVOT_AGG_NOT_NULL'
,p_message_language=>'fr'
,p_message_text=>unistr('L''agr\00E9gation doit \00EAtre indiqu\00E9e.')
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138734174901751225)
,p_name=>'APEXIR_PIVOT_AGG_NOT_ON_ROW_COL'
,p_message_language=>'fr'
,p_message_text=>unistr('Vous ne pouvez pas effectuer l''agr\00E9gation sur une colonne s\00E9lectionn\00E9e en tant que colonne de ligne.')
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138733328403751224)
,p_name=>'APEXIR_PIVOT_COLUMNS'
,p_message_language=>'fr'
,p_message_text=>'Colonnes de pivot'
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138733191034751224)
,p_name=>'APEXIR_PIVOT_COLUMN_N'
,p_message_language=>'fr'
,p_message_text=>'Colonne de pivot %0'
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138733737936751224)
,p_name=>'APEXIR_PIVOT_COLUMN_NOT_NULL'
,p_message_language=>'fr'
,p_message_text=>unistr('La colonne de pivot doit \00EAtre indiqu\00E9e.')
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138586279241751181)
,p_name=>'APEXIR_PIVOT_MAX_ROW_CNT'
,p_message_language=>'fr'
,p_message_text=>unistr('Le nombre maximal de lignes pour la requ\00EAte Permutation ligne vers colonnes limite le nombre de lignes dans la requ\00EAte de base, et non le nombre de lignes affich\00E9es. La requ\00EAte de base d\00E9passe le nombre de lignes maximal de %0. Appliquez un filtre po')
||unistr('ur r\00E9duire le nombre d''enregistrements dans la requ\00EAte de base.')
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138733627303751224)
,p_name=>'APEXIR_PIVOT_SORT'
,p_message_language=>'fr'
,p_message_text=>'Tri de pivot'
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138699619074751214)
,p_name=>'APEXIR_PIVOT_TOO_MANY_VALUES'
,p_message_language=>'fr'
,p_message_text=>unistr('La colonne de pivot contient trop de valeurs distinctes : le code SQL de pivot ne peut pas \00EAtre g\00E9n\00E9r\00E9.')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138630636139751194)
,p_name=>'APEXIR_PIVOT_VIEW_OF'
,p_message_language=>'fr'
,p_message_text=>'Vue de pivot pour %0'
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138756411658751231)
,p_name=>'APEXIR_PREVIEW'
,p_message_language=>'fr'
,p_message_text=>unistr('Pr\00E9visualiser')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138686966102751210)
,p_name=>'APEXIR_PREVIOUS'
,p_message_language=>'fr'
,p_message_text=>unistr('Pr\00E9c\00E9dent')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138781219123751239)
,p_name=>'APEXIR_PRIMARY'
,p_message_language=>'fr'
,p_message_text=>'Principal'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138757402982751231)
,p_name=>'APEXIR_PRIMARY_REPORT'
,p_message_language=>'fr'
,p_message_text=>'Etat principal'
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138643132346751197)
,p_name=>'APEXIR_PRINT_ACCESSIBLE'
,p_message_language=>'fr'
,p_message_text=>unistr('Inclure des balises d''accessibilit\00E9')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138603919886751186)
,p_name=>'APEXIR_PRINT_STRIP_RICH_TEXT'
,p_message_language=>'fr'
,p_message_text=>'Enlever le texte enrichi'
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138712398474751218)
,p_name=>'APEXIR_PRIVATE'
,p_message_language=>'fr'
,p_message_text=>unistr('Priv\00E9')
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138667387984751205)
,p_name=>'APEXIR_PUBLIC'
,p_message_language=>'fr'
,p_message_text=>'Public'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138662944746751203)
,p_name=>'APEXIR_RED'
,p_message_language=>'fr'
,p_message_text=>'rouge'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138809398782751247)
,p_name=>'APEXIR_REGION_STATIC_ID_DOES_NOT_EXIST'
,p_message_language=>'fr'
,p_message_text=>unistr('L''ID statique de r\00E9gion %0 n''existe pas.')
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138696479417751213)
,p_name=>'APEXIR_REMOVE'
,p_message_language=>'fr'
,p_message_text=>'Enlever'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138696557213751213)
,p_name=>'APEXIR_REMOVE_ALL'
,p_message_language=>'fr'
,p_message_text=>'Tout enlever'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138804715501751246)
,p_name=>'APEXIR_REMOVE_CHART'
,p_message_language=>'fr'
,p_message_text=>'Enlever le graphique'
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138696065317751213)
,p_name=>'APEXIR_REMOVE_CONTROL_BREAK'
,p_message_language=>'fr'
,p_message_text=>'Enlever la commande BREAK'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138695779512751213)
,p_name=>'APEXIR_REMOVE_FILTER'
,p_message_language=>'fr'
,p_message_text=>'Enlever le filtre'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138695867319751213)
,p_name=>'APEXIR_REMOVE_FLASHBACK'
,p_message_language=>'fr'
,p_message_text=>unistr('Enlever l''op\00E9ration Flashback')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138804832879751246)
,p_name=>'APEXIR_REMOVE_GROUP_BY'
,p_message_language=>'fr'
,p_message_text=>'Enlever le regroupement'
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138696107380751213)
,p_name=>'APEXIR_REMOVE_HIGHLIGHT'
,p_message_language=>'fr'
,p_message_text=>unistr('Enlever la mise en \00E9vidence')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138804981941751246)
,p_name=>'APEXIR_REMOVE_PIVOT'
,p_message_language=>'fr'
,p_message_text=>'Enlever le pivot'
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138786020764751240)
,p_name=>'APEXIR_REMOVE_REPORT'
,p_message_language=>'fr'
,p_message_text=>unistr('Enlever l''\00E9tat')
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138767817452751235)
,p_name=>'APEXIR_RENAME_DEFAULT_REPORT'
,p_message_language=>'fr'
,p_message_text=>unistr('Renommer l''\00E9tat par d\00E9faut')
,p_is_js_message=>true
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138705693397751216)
,p_name=>'APEXIR_RENAME_REPORT'
,p_message_language=>'fr'
,p_message_text=>unistr('Renommer un \00E9tat')
,p_is_js_message=>true
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138687243475751210)
,p_name=>'APEXIR_REPORT'
,p_message_language=>'fr'
,p_message_text=>'Etat'
,p_is_js_message=>true
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138784228308751239)
,p_name=>'APEXIR_REPORTS'
,p_message_language=>'fr'
,p_message_text=>'Etats'
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138659479359751202)
,p_name=>'APEXIR_REPORT_ALIAS_DOES_NOT_EXIST'
,p_message_language=>'fr'
,p_message_text=>unistr('L''\00E9tat interactif enregistr\00E9 portant l''alias %0 n''existe pas.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138712679177751218)
,p_name=>'APEXIR_REPORT_DOES_NOT_EXIST'
,p_message_language=>'fr'
,p_message_text=>unistr('L''\00E9tat n''existe pas.')
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138659586834751202)
,p_name=>'APEXIR_REPORT_ID_DOES_NOT_EXIST'
,p_message_language=>'fr'
,p_message_text=>unistr('L''ID d''\00E9tat interactif enregistr\00E9, %0, n''existe pas.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138703940052751215)
,p_name=>'APEXIR_REPORT_SETTINGS'
,p_message_language=>'fr'
,p_message_text=>unistr('Param\00E8tres d''\00E9tat')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138628184103751193)
,p_name=>'APEXIR_REPORT_SETTINGS_OF'
,p_message_language=>'fr'
,p_message_text=>unistr('Param\00E8tres d''\00E9tat pour %0')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138684289647751210)
,p_name=>'APEXIR_REPORT_VIEW'
,p_message_language=>'fr'
,p_message_text=>unistr('Vue d''\00E9tat')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138688483874751211)
,p_name=>'APEXIR_RESET'
,p_message_language=>'fr'
,p_message_text=>unistr('R\00E9initialiser')
,p_is_js_message=>true
,p_version_scn=>2704767
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138667595970751205)
,p_name=>'APEXIR_RESET_CONFIRM'
,p_message_language=>'fr'
,p_message_text=>unistr('Restaurer les param\00E8tres par d\00E9faut de l''\00E9tat.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138662782544751203)
,p_name=>'APEXIR_ROW'
,p_message_language=>'fr'
,p_message_text=>'Ligne'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138780312042751238)
,p_name=>'APEXIR_ROWID_NOT_SUPPORTED_FOR_WEBSOURCE'
,p_message_language=>'fr'
,p_message_text=>unistr('Vous ne pouvez pas utiliser ROWID en tant que colonne de cl\00E9 primaire pour une source de donn\00E9es REST.')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138695160838751213)
,p_name=>'APEXIR_ROWS'
,p_message_language=>'fr'
,p_message_text=>'Lignes'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138758102994751232)
,p_name=>'APEXIR_ROWS_PER_PAGE'
,p_message_language=>'fr'
,p_message_text=>'Lignes par page'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138733409883751224)
,p_name=>'APEXIR_ROW_COLUMNS'
,p_message_language=>'fr'
,p_message_text=>'Colonnes de ligne'
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138733275300751224)
,p_name=>'APEXIR_ROW_COLUMN_N'
,p_message_language=>'fr'
,p_message_text=>'Colonne de ligne %0'
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138733816667751224)
,p_name=>'APEXIR_ROW_COLUMN_NOT_NULL'
,p_message_language=>'fr'
,p_message_text=>unistr('La colonne de ligne doit \00EAtre indiqu\00E9e.')
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138734089287751225)
,p_name=>'APEXIR_ROW_COL_DIFF_FROM_PIVOT_COL'
,p_message_language=>'fr'
,p_message_text=>unistr('La colonne de ligne doit \00EAtre diff\00E9rente de la colonne de pivot.')
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138709648551751217)
,p_name=>'APEXIR_ROW_FILTER'
,p_message_language=>'fr'
,p_message_text=>'Filtre de ligne'
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138684351144751210)
,p_name=>'APEXIR_ROW_OF'
,p_message_language=>'fr'
,p_message_text=>'Ligne %0 sur %1'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138688694183751211)
,p_name=>'APEXIR_ROW_TEXT_CONTAINS'
,p_message_language=>'fr'
,p_message_text=>'Le texte de ligne contient'
,p_version_scn=>2704767
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138662053740751203)
,p_name=>'APEXIR_SAVE'
,p_message_language=>'fr'
,p_message_text=>'Enregistrer'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138699241857751214)
,p_name=>'APEXIR_SAVED_REPORT'
,p_message_language=>'fr'
,p_message_text=>unistr('Etat enregistr\00E9')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138699187696751214)
,p_name=>'APEXIR_SAVED_REPORT_MSG'
,p_message_language=>'fr'
,p_message_text=>unistr('Etat enregistr\00E9 = "%0"')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138701394963751215)
,p_name=>'APEXIR_SAVE_DEFAULT_CONFIRM'
,p_message_language=>'fr'
,p_message_text=>unistr('Les param\00E8tres en cours de l''\00E9tat seront utilis\00E9s comme param\00E8tres par d\00E9faut pour tous les utilisateurs.')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138767778696751235)
,p_name=>'APEXIR_SAVE_DEFAULT_REPORT'
,p_message_language=>'fr'
,p_message_text=>unistr('Enregistrer l''\00E9tat par d\00E9faut')
,p_is_js_message=>true
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138688332289751211)
,p_name=>'APEXIR_SAVE_REPORT'
,p_message_language=>'fr'
,p_message_text=>unistr('Enregistrer un \00E9tat')
,p_is_js_message=>true
,p_version_scn=>2704767
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138805144464751246)
,p_name=>'APEXIR_SAVE_REPORT_DEFAULT'
,p_message_language=>'fr'
,p_message_text=>unistr('Enregistrer un \00E9tat *')
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138759124152751232)
,p_name=>'APEXIR_SEARCH'
,p_message_language=>'fr'
,p_message_text=>'Rechercher'
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138694091903751213)
,p_name=>'APEXIR_SEARCH_BAR'
,p_message_language=>'fr'
,p_message_text=>'Barre de recherche'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138627468013751193)
,p_name=>'APEXIR_SEARCH_BAR_OF'
,p_message_language=>'fr'
,p_message_text=>'Barre de recherche pour %0'
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138805029720751246)
,p_name=>'APEXIR_SEARCH_COLUMN'
,p_message_language=>'fr'
,p_message_text=>'Rechercher : %0'
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138764628704751234)
,p_name=>'APEXIR_SEARCH_REPORT'
,p_message_language=>'fr'
,p_message_text=>unistr('Rechercher un \00E9tat')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138748635072751229)
,p_name=>'APEXIR_SELECTED_COLUMNS'
,p_message_language=>'fr'
,p_message_text=>unistr('Colonnes s\00E9lectionn\00E9es')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138663792124751203)
,p_name=>'APEXIR_SELECT_COLUMN'
,p_message_language=>'fr'
,p_message_text=>unistr('- S\00E9lectionner une colonne -')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138687619067751211)
,p_name=>'APEXIR_SELECT_COLUMNS'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lectionner des colonnes')
,p_is_js_message=>true
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138667203310751205)
,p_name=>'APEXIR_SELECT_FUNCTION'
,p_message_language=>'fr'
,p_message_text=>unistr('- S\00E9lectionner une fonction -')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138694851095751213)
,p_name=>'APEXIR_SELECT_GROUP_BY_COLUMN'
,p_message_language=>'fr'
,p_message_text=>unistr('- S\00E9lectionner une colonne de regroupement -')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138732948099751224)
,p_name=>'APEXIR_SELECT_PIVOT_COLUMN'
,p_message_language=>'fr'
,p_message_text=>unistr('- S\00E9lectionner la colonne de pivot -')
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138783296002751239)
,p_name=>'APEXIR_SELECT_ROW'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lectionner une ligne')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138733086310751224)
,p_name=>'APEXIR_SELECT_ROW_COLUMN'
,p_message_language=>'fr'
,p_message_text=>unistr('- S\00E9lectionner la colonne de ligne -')
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138614555717751189)
,p_name=>'APEXIR_SEND'
,p_message_language=>'fr'
,p_message_text=>'Envoyer'
,p_is_js_message=>true
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138637074978751196)
,p_name=>'APEXIR_SEND_AS_EMAIL'
,p_message_language=>'fr'
,p_message_text=>'Envoyer en tant que courriel'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138662479387751203)
,p_name=>'APEXIR_SEQUENCE'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9quence')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138687825166751211)
,p_name=>'APEXIR_SORT'
,p_message_language=>'fr'
,p_message_text=>'Trier'
,p_is_js_message=>true
,p_version_scn=>2704767
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138697342115751214)
,p_name=>'APEXIR_SORT_ASCENDING'
,p_message_language=>'fr'
,p_message_text=>'Trier par ordre croissant'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138697499481751214)
,p_name=>'APEXIR_SORT_DESCENDING'
,p_message_language=>'fr'
,p_message_text=>unistr('Trier par ordre d\00E9croissant')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138785404072751240)
,p_name=>'APEXIR_SORT_ORDER'
,p_message_language=>'fr'
,p_message_text=>'Ordre de tri'
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138691722793751212)
,p_name=>'APEXIR_SPACE_AS_IN_ONE_EMPTY_STRING'
,p_message_language=>'fr'
,p_message_text=>'espace'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138702938605751215)
,p_name=>'APEXIR_STATUS'
,p_message_language=>'fr'
,p_message_text=>'Statut %0'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138756869859751231)
,p_name=>'APEXIR_SUBSCRIPTION'
,p_message_language=>'fr'
,p_message_text=>'Abonnement'
,p_is_js_message=>true
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138782676919751239)
,p_name=>'APEXIR_SUBSCRIPTION_ENDING'
,p_message_language=>'fr'
,p_message_text=>'Fin'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138601612238751185)
,p_name=>'APEXIR_SUBSCRIPTION_SKIP_IF_NDF'
,p_message_language=>'fr'
,p_message_text=>unistr('Ignorer si aucune donn\00E9e n''a \00E9t\00E9 trouv\00E9e')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138782544571751239)
,p_name=>'APEXIR_SUBSCRIPTION_STARTING_FROM'
,p_message_language=>'fr'
,p_message_text=>'A partir de'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138783459047751239)
,p_name=>'APEXIR_SUM_X'
,p_message_language=>'fr'
,p_message_text=>'Total de %0'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138774357501751237)
,p_name=>'APEXIR_TABLE_SUMMARY'
,p_message_language=>'fr'
,p_message_text=>unistr('%0, \00E9tat = %1, vue = %2')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138661370754751203)
,p_name=>'APEXIR_TEXT_COLOR'
,p_message_language=>'fr'
,p_message_text=>'Couleur du texte'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138680092537751208)
,p_name=>'APEXIR_TIME_DAYS'
,p_message_language=>'fr'
,p_message_text=>'jours'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138679906065751208)
,p_name=>'APEXIR_TIME_HOURS'
,p_message_language=>'fr'
,p_message_text=>'heures'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138679860768751208)
,p_name=>'APEXIR_TIME_MINS'
,p_message_language=>'fr'
,p_message_text=>'minutes'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138680205494751208)
,p_name=>'APEXIR_TIME_MONTHS'
,p_message_language=>'fr'
,p_message_text=>'mois'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138680116732751208)
,p_name=>'APEXIR_TIME_WEEKS'
,p_message_language=>'fr'
,p_message_text=>'semaines'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138680327038751208)
,p_name=>'APEXIR_TIME_YEARS'
,p_message_language=>'fr'
,p_message_text=>unistr('ann\00E9es')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138785841486751240)
,p_name=>'APEXIR_TOGGLE'
,p_message_language=>'fr'
,p_message_text=>unistr('Activer/d\00E9sactiver')
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138696626185751213)
,p_name=>'APEXIR_TOP'
,p_message_language=>'fr'
,p_message_text=>'Haut'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138779328015751238)
,p_name=>'APEXIR_UNGROUPED_COLUMN'
,p_message_language=>'fr'
,p_message_text=>'Colonne sans groupe'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138698137571751214)
,p_name=>'APEXIR_UNIQUE_HIGHLIGHT_NAME'
,p_message_language=>'fr'
,p_message_text=>unistr('Le nom de mise en \00E9vidence doit \00EAtre unique.')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138666004804751204)
,p_name=>'APEXIR_UNSUPPORTED_DATA_TYPE'
,p_message_language=>'fr'
,p_message_text=>unistr('type de donn\00E9es non pris en charge')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138696742662751213)
,p_name=>'APEXIR_UP'
,p_message_language=>'fr'
,p_message_text=>'Haut'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138698372831751214)
,p_name=>'APEXIR_VALID_COLOR'
,p_message_language=>'fr'
,p_message_text=>'Entrez une couleur valide.'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138698493524751214)
,p_name=>'APEXIR_VALID_FORMAT_MASK'
,p_message_language=>'fr'
,p_message_text=>'Entrez un masque de format valide.'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138663235641751203)
,p_name=>'APEXIR_VALUE'
,p_message_language=>'fr'
,p_message_text=>'Valeur'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138697255399751214)
,p_name=>'APEXIR_VALUE_AXIS_TITLE'
,p_message_language=>'fr'
,p_message_text=>'Titre de l''axe pour la valeur'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138705093333751216)
,p_name=>'APEXIR_VALUE_REQUIRED'
,p_message_language=>'fr'
,p_message_text=>'Valeur requise'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138666637557751204)
,p_name=>'APEXIR_VCOLUMN'
,p_message_language=>'fr'
,p_message_text=>'Colonne verticale'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138775439590751237)
,p_name=>'APEXIR_VERTICAL'
,p_message_language=>'fr'
,p_message_text=>'Vertical'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138704385439751216)
,p_name=>'APEXIR_VIEW_CHART'
,p_message_language=>'fr'
,p_message_text=>'Visualiser le graphique'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138762906328751233)
,p_name=>'APEXIR_VIEW_DETAIL'
,p_message_language=>'fr'
,p_message_text=>unistr('Voir le d\00E9tail')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138807241501751246)
,p_name=>'APEXIR_VIEW_DOES_NOT_EXIST'
,p_message_language=>'fr'
,p_message_text=>unistr('La vue %0 n''est pas d\00E9finie pour l''\00E9tat.')
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138763051592751233)
,p_name=>'APEXIR_VIEW_GROUP_BY'
,p_message_language=>'fr'
,p_message_text=>'Visualiser le groupement'
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138762823897751233)
,p_name=>'APEXIR_VIEW_ICONS'
,p_message_language=>'fr'
,p_message_text=>unistr('Ic\00F4nes Vue')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138732795770751224)
,p_name=>'APEXIR_VIEW_PIVOT'
,p_message_language=>'fr'
,p_message_text=>'Afficher le pivot'
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138704413506751216)
,p_name=>'APEXIR_VIEW_REPORT'
,p_message_language=>'fr'
,p_message_text=>unistr('Voir l''\00E9tat')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138757067680751231)
,p_name=>'APEXIR_WEEKLY'
,p_message_language=>'fr'
,p_message_text=>'Hebdomadaire'
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138687197715751210)
,p_name=>'APEXIR_WORKING_REPORT'
,p_message_language=>'fr'
,p_message_text=>'Etat de travail'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138784870828751240)
,p_name=>'APEXIR_X_DAYS'
,p_message_language=>'fr'
,p_message_text=>'%0 jours'
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138784763099751240)
,p_name=>'APEXIR_X_HOURS'
,p_message_language=>'fr'
,p_message_text=>'%0 heures'
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138784658852751240)
,p_name=>'APEXIR_X_MINS'
,p_message_language=>'fr'
,p_message_text=>'%0 minutes'
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138785093646751240)
,p_name=>'APEXIR_X_MONTHS'
,p_message_language=>'fr'
,p_message_text=>'%0 mois'
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138784977212751240)
,p_name=>'APEXIR_X_WEEKS'
,p_message_language=>'fr'
,p_message_text=>'%0 semaines'
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138785128496751240)
,p_name=>'APEXIR_X_YEARS'
,p_message_language=>'fr'
,p_message_text=>'%0 ans'
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138782887833751239)
,p_name=>'APEXIR_YEAR'
,p_message_language=>'fr'
,p_message_text=>unistr('Ann\00E9e')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138661067579751203)
,p_name=>'APEXIR_YELLOW'
,p_message_language=>'fr'
,p_message_text=>'jaune'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138662555418751203)
,p_name=>'APEXIR_YES'
,p_message_language=>'fr'
,p_message_text=>'Oui'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138697057470751213)
,p_name=>'APEX_GROUP.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 contient < ou >, qui ne sont pas des caract\00E8res valides.')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138720920209751221)
,p_name=>'APEX_REGION'
,p_message_language=>'fr'
,p_message_text=>unistr('R\00E9gion')
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138612027488751188)
,p_name=>'APEX_ZIP.EXTRACT_FAILED'
,p_message_language=>'fr'
,p_message_text=>'Impossible d''extraire le fichier ZIP.'
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138611913868751188)
,p_name=>'APEX_ZIP.INVALID_ZIPFILE'
,p_message_language=>'fr'
,p_message_text=>unistr('Signature de fin de r\00E9pertoire central introuvable. Ce fichier n''est pas au format ZIP.')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138643017285751197)
,p_name=>'API_PRECONDITION_VIOLATED'
,p_message_language=>'fr'
,p_message_text=>unistr('La condition pr\00E9alable de l''API n''a pas \00E9t\00E9 respect\00E9e')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138665194742751204)
,p_name=>'APP.SETTING.CANNOT.GET'
,p_message_language=>'fr'
,p_message_text=>unistr('Impossible d''obtenir la valeur du param\00E8tre d''application %0 car l''option de construction associ\00E9e est d\00E9sactiv\00E9e.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138665009271751204)
,p_name=>'APP.SETTING.CANNOT.SET'
,p_message_language=>'fr'
,p_message_text=>unistr('Impossible de d\00E9finir la valeur du param\00E8tre d''application %0 car l''option de construction associ\00E9e est d\00E9sactiv\00E9e.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138777649924751238)
,p_name=>'APP.SETTING.INVALID.VALUE'
,p_message_language=>'fr'
,p_message_text=>unistr('La valeur du param\00E8tre d''application %0 n''est pas valide')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138777512038751237)
,p_name=>'APP.SETTING.NOT.DEFINED'
,p_message_language=>'fr'
,p_message_text=>unistr('Le param\00E8tre d''application demand\00E9 %0 n''est pas d\00E9fini')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138777716675751238)
,p_name=>'APP.SETTING.VALUE.NOT.NULL'
,p_message_language=>'fr'
,p_message_text=>unistr('Le param\00E8tre d''application %0 ne peut pas \00EAtre d\00E9fini sur une valeur NULL')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138651612292751200)
,p_name=>'BACK'
,p_message_language=>'fr'
,p_message_text=>'Retour'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138634039761751195)
,p_name=>'BUILDER'
,p_message_language=>'fr'
,p_message_text=>unistr('G\00E9n\00E9rateur')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138707638748751217)
,p_name=>'BUTTON LABEL'
,p_message_language=>'fr'
,p_message_text=>unistr('Libell\00E9 de bouton')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138630942744751194)
,p_name=>'BUTTON_CSS_CLASSES'
,p_message_language=>'fr'
,p_message_text=>'Classes CSS de bouton'
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138669488108751205)
,p_name=>'BUTTON_ID'
,p_message_language=>'fr'
,p_message_text=>unistr('L''ID de bouton g\00E9n\00E9r\00E9 sera l''ID statique du bouton, s''il est d\00E9fini ; dans le cas contraire il s''agira d''un ID g\00E9n\00E9r\00E9 en interne au format ''B'' || [ID de bouton interne]')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138603405821751186)
,p_name=>'CANDLESTICK'
,p_message_language=>'fr'
,p_message_text=>'Chandelier'
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138717440361751220)
,p_name=>'CENTER'
,p_message_language=>'fr'
,p_message_text=>'Au centre'
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138664082368751204)
,p_name=>'CHANGE_PW_REQUEST'
,p_message_language=>'fr'
,p_message_text=>'%0 - Demande'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138654032600751201)
,p_name=>'CHECK$'
,p_message_language=>'fr'
,p_message_text=>unistr('s\00E9lecteur de ligne')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138779476939751238)
,p_name=>'CHECKED'
,p_message_language=>'fr'
,p_message_text=>unistr('s\00E9lectionn\00E9')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138755863355751231)
,p_name=>'COLUMN'
,p_message_language=>'fr'
,p_message_text=>'Colonne'
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138713404912751218)
,p_name=>'COMMENTS'
,p_message_language=>'fr'
,p_message_text=>'Commentaires'
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138694443039751213)
,p_name=>'CONTINUE'
,p_message_language=>'fr'
,p_message_text=>'Continuer'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138651961053751200)
,p_name=>'COPYRIGHT'
,p_message_language=>'fr'
,p_message_text=>unistr('Copyright &copy; 1999, %0, Oracle et/ou ses affili\00E9s.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138700121731751214)
,p_name=>'COUNT'
,p_message_language=>'fr'
,p_message_text=>'Nombre'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138707177371751216)
,p_name=>'CREATE'
,p_message_language=>'fr'
,p_message_text=>unistr('Cr\00E9er')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138762533818751233)
,p_name=>'CREATED'
,p_message_language=>'fr'
,p_message_text=>unistr('Cr\00E9\00E9')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138762636586751233)
,p_name=>'CREATED_BY'
,p_message_language=>'fr'
,p_message_text=>unistr('Cr\00E9\00E9 par')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138683538400751209)
,p_name=>'CREATED_ON'
,p_message_language=>'fr'
,p_message_text=>unistr('Date/heure de cr\00E9ation')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138694644188751213)
,p_name=>'CUSTOM'
,p_message_language=>'fr'
,p_message_text=>unistr('Personnalis\00E9')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138705840383751216)
,p_name=>'CUSTOMIZE'
,p_message_language=>'fr'
,p_message_text=>'Personnaliser'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138707800955751217)
,p_name=>'CUSTOMIZE.USER_PAGE_PREFS_RESET'
,p_message_language=>'fr'
,p_message_text=>unistr('Pr\00E9f\00E9rences de page r\00E9initialis\00E9es pour l''utilisateur %0.')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138707979984751217)
,p_name=>'CUSTOMIZE.USER_PREFS_CHANGED'
,p_message_language=>'fr'
,p_message_text=>unistr('Les pr\00E9f\00E9rences ont \00E9t\00E9 modifi\00E9es pour l''utilisateur %0.')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138707721632751217)
,p_name=>'CUSTOMIZE.USER_PREFS_RESET'
,p_message_language=>'fr'
,p_message_text=>unistr('Pr\00E9f\00E9rences de page r\00E9initialis\00E9es pour l''utilisateur %0.')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138668828456751205)
,p_name=>'DAILY'
,p_message_language=>'fr'
,p_message_text=>'Quotidien'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138632255547751194)
,p_name=>'DATA.LOAD.INVALID_FILE'
,p_message_language=>'fr'
,p_message_text=>unistr('Le fichier charg\00E9 n''est pas valide ou son extension est incorrecte.')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138664270892751204)
,p_name=>'DATA.LOAD.INVALID_SELECTOR'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lecteur JSON ou XML non valide utilis\00E9.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138609384591751187)
,p_name=>'DATA.LOAD.NO_COMMON_COLUMNS'
,p_message_language=>'fr'
,p_message_text=>unistr('Le profil de donn\00E9es et le fichier t\00E9l\00E9charg\00E9 ne contiennent pas de colonne de table cible.')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138723268222751221)
,p_name=>'DATA.LOAD.NO_FILE_CONTENTS'
,p_message_language=>'fr'
,p_message_text=>unistr('Aucune donn\00E9e n''a \00E9t\00E9 trouv\00E9e dans le fichier t\00E9l\00E9charg\00E9.')
,p_version_scn=>2704772
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138723308052751221)
,p_name=>'DATA.LOAD.NO_WORKSHEET_CONTENTS'
,p_message_language=>'fr'
,p_message_text=>unistr('Aucune donn\00E9e n''a \00E9t\00E9 trouv\00E9e dans la feuille de calcul "%0".')
,p_version_scn=>2704772
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138629148377751193)
,p_name=>'DATA.LOAD.NO_XLSX_FILE'
,p_message_language=>'fr'
,p_message_text=>unistr('Le fichier indiqu\00E9 n''est pas un fichier XLSX.')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138595141880751183)
,p_name=>'DATA.LOAD.ROWS_PROCESSED'
,p_message_language=>'fr'
,p_message_text=>unistr('Chargement des donn\00E9es termin\00E9 : %0 lignes trait\00E9es.')
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138597497327751184)
,p_name=>'DATA.LOAD.ROWS_PROCESSED_W_ERROR_ROW'
,p_message_language=>'fr'
,p_message_text=>unistr('Chargement des donn\00E9es termin\00E9 : %0 lignes trait\00E9es avec 1 erreur.')
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138597795320751184)
,p_name=>'DATA.LOAD.ROWS_PROCESSED_W_ERROR_ROWS'
,p_message_language=>'fr'
,p_message_text=>unistr('Chargement des donn\00E9es termin\00E9 : %0 lignes trait\00E9es avec %1 erreurs.')
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138597589413751184)
,p_name=>'DATA.LOAD.ROW_PROCESSED'
,p_message_language=>'fr'
,p_message_text=>unistr('Chargement des donn\00E9es termin\00E9 : 1 ligne trait\00E9e.')
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138611831438751188)
,p_name=>'DATA.LOAD.ROW_PROCESSED_W_ERROR_ROW'
,p_message_language=>'fr'
,p_message_text=>unistr('Chargement des donn\00E9es termin\00E9 : 1 ligne trait\00E9e avec erreur.')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138597613447751184)
,p_name=>'DATA.LOAD.ROW_PROCESSED_W_ERROR_ROWS'
,p_message_language=>'fr'
,p_message_text=>unistr('Chargement des donn\00E9es termin\00E9 : 1 ligne trait\00E9e sans erreur.')
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138730360543751223)
,p_name=>'DATA_LOAD.COLUMN_NAMES_MAPPING'
,p_message_language=>'fr'
,p_message_text=>'Colonne cible'
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138637509850751196)
,p_name=>'DATA_LOAD.DO_NOT_LOAD'
,p_message_language=>'fr'
,p_message_text=>'Ne pas charger'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138637661499751196)
,p_name=>'DATA_LOAD.FAILED'
,p_message_language=>'fr'
,p_message_text=>'Erreur avant traitement'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138730439762751223)
,p_name=>'DATA_LOAD.FIRST_COLUMN_NAMES'
,p_message_language=>'fr'
,p_message_text=>'Colonne source'
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138731222906751224)
,p_name=>'DATA_LOAD.FORMAT'
,p_message_language=>'fr'
,p_message_text=>'Format date/nombre'
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138637392667751196)
,p_name=>'DATA_LOAD.INSERT'
,p_message_language=>'fr'
,p_message_text=>unistr('Ins\00E9rer une ligne')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138793407319751242)
,p_name=>'DATA_LOAD.LOOKUP_FAILED'
,p_message_language=>'fr'
,p_message_text=>'Echec de l''extraction de la valeur de recherche.'
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138763182844751233)
,p_name=>'DATA_LOAD.MAPPING'
,p_message_language=>'fr'
,p_message_text=>unistr('Mapping de table/donn\00E9es')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138731371642751224)
,p_name=>'DATA_LOAD.ROW'
,p_message_language=>'fr'
,p_message_text=>'Ligne'
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138637779230751196)
,p_name=>'DATA_LOAD.SEQUENCE_ACTION'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9quence : action')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138725017220751222)
,p_name=>'DATA_LOAD.TRANSFORMATION_FAILED'
,p_message_language=>'fr'
,p_message_text=>unistr('Echec de la r\00E8gle de transformation')
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138637455814751196)
,p_name=>'DATA_LOAD.UPDATE'
,p_message_language=>'fr'
,p_message_text=>unistr('Mettre \00E0 jour une ligne')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138699726209751214)
,p_name=>'DATE'
,p_message_language=>'fr'
,p_message_text=>'Date'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138672603589751206)
,p_name=>'DAY'
,p_message_language=>'fr'
,p_message_text=>'jour'
,p_version_scn=>2704763
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138672776370751206)
,p_name=>'DAYS'
,p_message_language=>'fr'
,p_message_text=>'jours'
,p_version_scn=>2704763
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138713163396751218)
,p_name=>'DEBUGGING_OFF'
,p_message_language=>'fr'
,p_message_text=>unistr('Le d\00E9bogage n''est pas activ\00E9 pour cette application.')
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138764850694751234)
,p_name=>'DEFAULT'
,p_message_language=>'fr'
,p_message_text=>unistr('Valeur par d\00E9faut')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138673408053751206)
,p_name=>'DELETE'
,p_message_language=>'fr'
,p_message_text=>'supprimer'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138649072713751199)
,p_name=>'DELETE_MSG'
,p_message_language=>'fr'
,p_message_text=>'Voulez-vous effectuer cette action de suppression ?'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138628647647751193)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES'
,p_message_language=>'fr'
,p_message_text=>'Remplacements de session'
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138629561450751193)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ENABLE'
,p_message_language=>'fr'
,p_message_text=>'Activer les remplacements de session'
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138630414437751194)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ERROR_LOAD'
,p_message_language=>'fr'
,p_message_text=>'Une erreur est survenue lors du chargement des remplacements de session.'
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138630298304751194)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ERROR_SAVE'
,p_message_language=>'fr'
,p_message_text=>'Une erreur est survenue lors de l''enregistrement des remplacements de session.'
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138630149635751194)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_SAVED'
,p_message_language=>'fr'
,p_message_text=>unistr('Remplacements de session enregistr\00E9s. Fermez cette bo\00EEte de dialogue pour visualiser les modifications.')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138603330435751186)
,p_name=>'DIAL_PCT'
,p_message_language=>'fr'
,p_message_text=>'Cadran (pourcentage)'
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138644377412751198)
,p_name=>'DOWNLOAD'
,p_message_language=>'fr'
,p_message_text=>unistr('T\00E9l\00E9charger en local')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138763915372751233)
,p_name=>'DUP_USER'
,p_message_language=>'fr'
,p_message_text=>'Nom utilisateur en double dans la liste.'
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138652706977751200)
,p_name=>'EDIT'
,p_message_language=>'fr'
,p_message_text=>'Modifier'
,p_is_js_message=>true
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138663940030751204)
,p_name=>'EMAIL_NOT_FOUND'
,p_message_language=>'fr'
,p_message_text=>unistr('L''adresse \00E9lectronique "%0" est introuvable.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138646648844751198)
,p_name=>'EMAIL_SENT_BY'
,p_message_language=>'fr'
,p_message_text=>unistr('Ce courriel a \00E9t\00E9 envoy\00E9 par %0.')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138764128966751233)
,p_name=>'EMAIL_TOO_LONG'
,p_message_language=>'fr'
,p_message_text=>unistr('L''adresse \00E9lectronique est trop longue. La limite est de 240 caract\00E8res.')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138694324700751213)
,p_name=>'ERROR'
,p_message_language=>'fr'
,p_message_text=>'Erreur'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138725192519751222)
,p_name=>'ERROR_SET_ITEM_STATE_FOR_PPR_REGION'
,p_message_language=>'fr'
,p_message_text=>unistr('Impossible de d\00E9finir la valeur de source de l''\00E9l\00E9ment de page pour la r\00E9gion de r\00E9g\00E9n\00E9ration de page partielle.')
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138685637357751210)
,p_name=>'F4500_P10_CREATED_BY'
,p_message_language=>'fr'
,p_message_text=>unistr('Cr\00E9\00E9 par')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138646939812751198)
,p_name=>'F4500_P2613_EXPIRED'
,p_message_language=>'fr'
,p_message_text=>unistr('Mot de passe arriv\00E9 \00E0 expiration')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138639380400751196)
,p_name=>'FILE_EMPTY'
,p_message_language=>'fr'
,p_message_text=>'Le fichier est vide.'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138729130664751223)
,p_name=>'FILE_TOO_LARGE'
,p_message_language=>'fr'
,p_message_text=>unistr('La taille du fichier t\00E9l\00E9charg\00E9 d\00E9passe %0 Mo. T\00E9l\00E9chargez un fichier plus petit.')
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138649287945751199)
,p_name=>'FILE_UPLOAD_AUTHENTICATION_ERR'
,p_message_language=>'fr'
,p_message_text=>unistr('L''authentification de l''utilisateur a \00E9chou\00E9 et des fichiers n''ont pas \00E9t\00E9 t\00E9l\00E9charg\00E9s.')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138649352591751199)
,p_name=>'FILE_UPLOAD_PUBLICUSER_ERR'
,p_message_language=>'fr'
,p_message_text=>unistr('L''instance n''autorise pas les utilisateurs non authentifi\00E9s \00E0 t\00E9l\00E9charger des fichiers.')
,p_version_scn=>2704761
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138729203106751223)
,p_name=>'FILTERS'
,p_message_language=>'fr'
,p_message_text=>'Filtres'
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138707241573751216)
,p_name=>'FLOW.SINGLE_VALIDATION_ERROR'
,p_message_language=>'fr'
,p_message_text=>'1 erreur s''est produite'
,p_is_js_message=>true
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138706450018751216)
,p_name=>'FLOW.VALIDATION_ERROR'
,p_message_language=>'fr'
,p_message_text=>'%0 erreurs se sont produites'
,p_is_js_message=>true
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138651819324751200)
,p_name=>'FORM_OF'
,p_message_language=>'fr'
,p_message_text=>'%0 sur %1'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138690896923751212)
,p_name=>'GO'
,p_message_language=>'fr'
,p_message_text=>'OK'
,p_version_scn=>2704768
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138793033407751242)
,p_name=>'HELP'
,p_message_language=>'fr'
,p_message_text=>'Aide'
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138634182504751195)
,p_name=>'HOME'
,p_message_language=>'fr'
,p_message_text=>'Accueil'
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138672478282751206)
,p_name=>'HOUR'
,p_message_language=>'fr'
,p_message_text=>'heure'
,p_version_scn=>2704763
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138672581616751206)
,p_name=>'HOURS'
,p_message_language=>'fr'
,p_message_text=>'heures'
,p_version_scn=>2704763
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138653944700751201)
,p_name=>'ICON'
,p_message_language=>'fr'
,p_message_text=>unistr('Ic\00F4ne %0')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138631274303751194)
,p_name=>'ICON.EDITOR.CROP.HELP'
,p_message_language=>'fr'
,p_message_text=>unistr('Aide relative \00E0 l''ic\00F4ne Rogner')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138632492283751194)
,p_name=>'ICON.EDITOR.CROPPER.HELPTEXT'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Faites glisser l''ic\00F4ne et utilisez le curseur de zoom pour la repositionner \00E0 l''int\00E9rieur du cadre.</p>'),
'',
unistr('<p>Lors du t\00E9l\00E9chargement d''une nouvelle ic\00F4ne, elle est redimensionn\00E9e pour s''adapter \00E0 trois formats : ic\00F4ne de favori, et ic\00F4ne de petite et de grande taille.</p>'),
'',
unistr('<p>Lorsque vous s\00E9lectionnez l''outil Rogner de l''ic\00F4ne, les raccourcis clavier suivants sont disponibles :</p>'),
'<ul>',
unistr('    <li>Fl\00E8che vers la gauche : d\00E9placer l''image vers la gauche*</li>'),
unistr('    <li>Fl\00E8che vers le haut : d\00E9placer l''image vers le haut*</li>'),
unistr('    <li>Fl\00E8che vers la droite : d\00E9placer l''image vers la droite*</li>'),
unistr('    <li>Fl\00E8che vers le bas : d\00E9placer l''image vers le bas*</li>'),
'    <li>I : zoom avant</li>',
unistr('    <li>O : zoom arri\00E8re</li>'),
unistr('    <li>L : faire pivoter \00E0 gauche</li>'),
unistr('    <li>R : faire pivoter \00E0 droite</li>'),
'</ul>',
'',
unistr('<p class="margin-top-md"><em>*Maintenir la touche Maj enfonc\00E9e pour aller plus vite</em></p>')))
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138637989096751196)
,p_name=>'ICON.EDITOR.CROPPER.SUBTITLE'
,p_message_language=>'fr'
,p_message_text=>unistr('Faire glisser l''ic\00F4ne pour la repositionner')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138638081960751196)
,p_name=>'ICON.EDITOR.CROPPER.ZOOM_SLIDER_LABEL'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9placer le curseur pour ajuster le niveau de zoom')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138631078238751194)
,p_name=>'ICON.EDITOR.DIALOG.TITLE'
,p_message_language=>'fr'
,p_message_text=>unistr('Modifier l''ic\00F4ne de l''application')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138631366776751194)
,p_name=>'ICON.EDITOR.ERROR.SAVING'
,p_message_language=>'fr'
,p_message_text=>unistr('Erreur lors de l''enregistrement de l''ic\00F4ne.')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138713778164751218)
,p_name=>'ICON.EDITOR.LEGACY_DATA'
,p_message_language=>'fr'
,p_message_text=>unistr('<p><span class="a-Icon icon-tr-warning"></span> Cette application utilise des ic\00F4nes h\00E9rit\00E9es. Le t\00E9l\00E9chargement d''une nouvelle ic\00F4ne remplacera toutes les ic\00F4nes h\00E9rit\00E9es.</p>')
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138631972321751194)
,p_name=>'ICON.EDITOR.UPLOAD.ICON'
,p_message_language=>'fr'
,p_message_text=>unistr('T\00E9l\00E9charger une nouvelle ic\00F4ne')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138708189902751217)
,p_name=>'INVALID_CREDENTIALS'
,p_message_language=>'fr'
,p_message_text=>'Informations d''identification non valides'
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138809268917751247)
,p_name=>'INVALID_VALUE_FOR_PARAMETER'
,p_message_language=>'fr'
,p_message_text=>unistr('Valeur non valide pour le param\00E8tre : %0')
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138702450840751215)
,p_name=>'IR_AS_DEFAULT_REPORT_SETTING'
,p_message_language=>'fr'
,p_message_text=>unistr('Comme param\00E8tre d''\00E9tat par d\00E9faut')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138702575614751215)
,p_name=>'IR_AS_NAMED_REPORT'
,p_message_language=>'fr'
,p_message_text=>unistr('Comme \00E9tat nomm\00E9')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138684478597751210)
,p_name=>'IR_ERROR'
,p_message_language=>'fr'
,p_message_text=>'%0 erreur. %1'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138684163456751210)
,p_name=>'IR_FRM_NAV_ERROR'
,p_message_language=>'fr'
,p_message_text=>'Impossible de calculer la navigation du panneau. %0'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138659754137751202)
,p_name=>'IR_NOT_FOUND'
,p_message_language=>'fr'
,p_message_text=>'Etat interactif introuvable.'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138659187624751202)
,p_name=>'IR_REGION_NOT_EXIST'
,p_message_language=>'fr'
,p_message_text=>unistr('La r\00E9gion d''\00E9tat interactif n''existe pas dans l''application %0, la page %1 et la r\00E9gion %2.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138702377192751215)
,p_name=>'IR_STAR'
,p_message_language=>'fr'
,p_message_text=>unistr('S''affiche uniquement pour les d\00E9veloppeurs')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138690575760751211)
,p_name=>'IR_UNIQUE_KEY_ERROR'
,p_message_language=>'fr'
,p_message_text=>unistr('La requ\00EAte d''\00E9tat requiert une cl\00E9 unique pour identifier chaque ligne. La cl\00E9 fournie est inutilisable pour cette requ\00EAte. D\00E9finissez une colonne de cl\00E9 unique. %0')
,p_version_scn=>2704768
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138690603806751212)
,p_name=>'IR_UNIQUE_KEY_ERROR2'
,p_message_language=>'fr'
,p_message_text=>unistr('La requ\00EAte d''\00E9tat requiert une cl\00E9 unique pour identifier chaque ligne. La cl\00E9 fournie est inutilisable pour cette requ\00EAte. Modifiez les attributs d''\00E9tat pour d\00E9finir une colonne de cl\00E9 unique. %0')
,p_version_scn=>2704768
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138731576335751224)
,p_name=>'ITEM.FILE_UPLOAD.CHOOSE_FILE'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lectionner un fichier')
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138731424350751224)
,p_name=>'ITEM.FILE_UPLOAD.DRAG_DROP_FILE_HERE'
,p_message_language=>'fr'
,p_message_text=>unistr('Glisser et d\00E9placer le fichier ici ou')
,p_is_js_message=>true
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138652191192751200)
,p_name=>'ITEMS'
,p_message_language=>'fr'
,p_message_text=>unistr('El\00E9ments')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138685871608751210)
,p_name=>'ITEM_VALUE'
,p_message_language=>'fr'
,p_message_text=>unistr('Valeur d''\00E9l\00E9ment')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138700474915751214)
,p_name=>'LABEL'
,p_message_language=>'fr'
,p_message_text=>unistr('Libell\00E9')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138713058143751218)
,p_name=>'LANGUAGE'
,p_message_language=>'fr'
,p_message_text=>'Langue'
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138673188877751206)
,p_name=>'LAST'
,p_message_language=>'fr'
,p_message_text=>'dernier'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138649154341751199)
,p_name=>'LENGTH'
,p_message_language=>'fr'
,p_message_text=>'Longueur'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138707419648751217)
,p_name=>'LOGIN'
,p_message_language=>'fr'
,p_message_text=>'Connexion'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138749024243751229)
,p_name=>'MANAGE'
,p_message_language=>'fr'
,p_message_text=>unistr('G\00E9rer')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138812152659751248)
,p_name=>'MAXIMIZE'
,p_message_language=>'fr'
,p_message_text=>'Agrandir'
,p_is_js_message=>true
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138672249567751206)
,p_name=>'MINUTE'
,p_message_language=>'fr'
,p_message_text=>'minute'
,p_version_scn=>2704763
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138672328154751206)
,p_name=>'MINUTES'
,p_message_language=>'fr'
,p_message_text=>'minutes'
,p_version_scn=>2704763
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138764382585751234)
,p_name=>'MISSING_AT'
,p_message_language=>'fr'
,p_message_text=>unistr('"@" manquant dans l''adresse \00E9lectronique.')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138764526529751234)
,p_name=>'MISSING_DIALOG_PAGE_TEMPLATE_WARNING'
,p_message_language=>'fr'
,p_message_text=>unistr('Avertissement : aucun mod\00E8le de page de bo\00EEte de dialogue n''a \00E9t\00E9 d\00E9fini pour la page de bo\00EEte de dialogue %0 dans l''application %1.')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138764263249751234)
,p_name=>'MISSING_DOT'
,p_message_language=>'fr'
,p_message_text=>unistr('"." manquant dans le domaine d''adresse \00E9lectronique.')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138710580897751217)
,p_name=>'MODULE'
,p_message_language=>'fr'
,p_message_text=>'Module'
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138664771569751204)
,p_name=>'MONTH'
,p_message_language=>'fr'
,p_message_text=>'Mois'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138668631329751205)
,p_name=>'MONTHLY'
,p_message_language=>'fr'
,p_message_text=>'Mensuel'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138664892205751204)
,p_name=>'MONTHS'
,p_message_language=>'fr'
,p_message_text=>'mois'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138700067238751214)
,p_name=>'MOVE'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9placer')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138770812471751235)
,p_name=>'MOVE_FROM'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9placer \00E0 partir de')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138770905333751236)
,p_name=>'MOVE_TO'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9placer vers')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138687002911751210)
,p_name=>'MRU.ERROR_IN_MRD'
,p_message_language=>'fr'
,p_message_text=>unistr('Erreur dans l''op\00E9ration de suppression multiligne : lignes = %0, %1, %2')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138686050796751210)
,p_name=>'MUST_NOT_BE_PUBLIC_USER'
,p_message_language=>'fr'
,p_message_text=>unistr('Ne doit pas \00EAtre un utilisateur public')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138634646376751195)
,p_name=>'NAME'
,p_message_language=>'fr'
,p_message_text=>'Nom'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138700294351751214)
,p_name=>'NEW'
,p_message_language=>'fr'
,p_message_text=>'Nouveau'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138664598218751204)
,p_name=>'NEW_ACCOUNT_LOGIN_INSTRUCTIONS'
,p_message_language=>'fr'
,p_message_text=>unistr('Vous pouvez vous connecter \00E0 %0 en acc\00E9dant \00E0 :')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138664634258751204)
,p_name=>'NEW_ACCOUNT_NOTIFICATION'
,p_message_language=>'fr'
,p_message_text=>'Notification du nouveau compte %0'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138793200937751242)
,p_name=>'NEXT'
,p_message_language=>'fr'
,p_message_text=>'Suivant'
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138710450354751217)
,p_name=>'NO'
,p_message_language=>'fr'
,p_message_text=>'Non'
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138807305266751246)
,p_name=>'NOBODY'
,p_message_language=>'fr'
,p_message_text=>'personne'
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138673591444751206)
,p_name=>'NOT'
,p_message_language=>'fr'
,p_message_text=>'N''est pas'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138716495730751219)
,p_name=>'NOT_NULL'
,p_message_language=>'fr'
,p_message_text=>'Non NULL'
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138686120451751210)
,p_name=>'NOT_W_ARGUMENT'
,p_message_language=>'fr'
,p_message_text=>'N''est pas %0'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138705998160751216)
,p_name=>'NO_DATA_FOUND'
,p_message_language=>'fr'
,p_message_text=>unistr('aucune donn\00E9e n''a \00E9t\00E9 trouv\00E9e')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138715925805751219)
,p_name=>'NO_UPDATEABLE_REPORT_FOUND'
,p_message_language=>'fr'
,p_message_text=>unistr('Aucun \00E9tat modifiable n''a \00E9t\00E9 trouv\00E9. Les op\00E9rations de mise \00E0 jour et de suppression multilignes ne peuvent \00EAtre effectu\00E9es que sur des panneaux tabulaires de type ''Etat modifiable''.')
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138716877266751219)
,p_name=>'OK'
,p_message_language=>'fr'
,p_message_text=>'OK'
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138712165722751218)
,p_name=>'ORACLE_APPLICATION_EXPRESS'
,p_message_language=>'fr'
,p_message_text=>'Oracle APEX'
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138811091574751247)
,p_name=>'ORA_06550'
,p_message_language=>'fr'
,p_message_text=>'ORA-06550 : ligne %0, colonne %1'
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138761939917751233)
,p_name=>'OUTDATED_BROWSER'
,p_message_language=>'fr'
,p_message_text=>unistr('Votre navigateur Web est obsol\00E8te. Pour obtenir la liste des navigateurs pris en charge, reportez-vous au guide d''installation Oracle APEX.')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138656933984751201)
,p_name=>'OUT_OF_RANGE'
,p_message_language=>'fr'
,p_message_text=>unistr('L''ensemble de lignes demand\00E9 n''est pas valide : les donn\00E9es source de l''\00E9tat ont \00E9t\00E9 modifi\00E9es.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138678948112751208)
,p_name=>'P.VALID_PAGE_ERR'
,p_message_language=>'fr'
,p_message_text=>unistr('Un num\00E9ro de page valide doit \00EAtre indiqu\00E9, par exemple p?n=1234.')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138683146978751209)
,p_name=>'PAGINATION.NEXT'
,p_message_language=>'fr'
,p_message_text=>'Suivant'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138683261148751209)
,p_name=>'PAGINATION.NEXT_SET'
,p_message_language=>'fr'
,p_message_text=>'Ensemble suivant'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138683394947751209)
,p_name=>'PAGINATION.PREVIOUS'
,p_message_language=>'fr'
,p_message_text=>unistr('Pr\00E9c\00E9dent')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138683463441751209)
,p_name=>'PAGINATION.PREVIOUS_SET'
,p_message_language=>'fr'
,p_message_text=>unistr('Ensemble pr\00E9c\00E9dent')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138793172671751242)
,p_name=>'PAGINATION.SELECT'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lectionner la pagination')
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138723121096751221)
,p_name=>'PASSWORD'
,p_message_language=>'fr'
,p_message_text=>'Mot de passe'
,p_version_scn=>2704772
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138663859941751204)
,p_name=>'PASSWORD_CHANGED'
,p_message_language=>'fr'
,p_message_text=>unistr('Votre mot de passe pour %0 a \00E9t\00E9 modifi\00E9.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138651591217751200)
,p_name=>'PASSWORD_COMPLEXITY_ERROR'
,p_message_language=>'fr'
,p_message_text=>unistr('Le mot de passe n''est pas conforme aux r\00E8gles de complexit\00E9 de mot de passe de ce site.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138650627996751200)
,p_name=>'PASSWORD_DIFFERS_BY_ERR'
,p_message_language=>'fr'
,p_message_text=>unistr('Le nouveau mot de passe doit comporter au moins %0 caract\00E8res diff\00E9rents de l''ancien mot de passe.')
,p_version_scn=>2704761
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138651232691751200)
,p_name=>'PASSWORD_LIKE_USERNAME_ERR'
,p_message_language=>'fr'
,p_message_text=>'Le mot de passe ne doit pas contenir de nom utilisateur.'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138651449209751200)
,p_name=>'PASSWORD_LIKE_WORDS_ERR'
,p_message_language=>'fr'
,p_message_text=>'Le mot de passe contient un mot simple interdit.'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138651356142751200)
,p_name=>'PASSWORD_LIKE_WORKSPACE_NAME_ERR'
,p_message_language=>'fr'
,p_message_text=>'Le mot de passe ne doit pas contenir de nom d''espace de travail.'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138650552663751200)
,p_name=>'PASSWORD_MIN_LEN_ERR'
,p_message_language=>'fr'
,p_message_text=>unistr('Le mot de passe doit contenir au moins %0 caract\00E8res.')
,p_version_scn=>2704761
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138650799585751200)
,p_name=>'PASSWORD_ONE_ALPHA_ERR'
,p_message_language=>'fr'
,p_message_text=>'Le mot de passe doit contenir au moins une lettre (%0).'
,p_version_scn=>2704761
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138651101813751200)
,p_name=>'PASSWORD_ONE_LOWER_ERR'
,p_message_language=>'fr'
,p_message_text=>'Le mot de passe doit contenir au moins une lettre minuscule.'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138650856993751200)
,p_name=>'PASSWORD_ONE_NUMERIC_ERR'
,p_message_language=>'fr'
,p_message_text=>'Le mot de passe doit contenir au moins un chiffre (0123456789).'
,p_version_scn=>2704761
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138650968281751200)
,p_name=>'PASSWORD_ONE_PUNCTUATION_ERR'
,p_message_language=>'fr'
,p_message_text=>'Le mot de passe doit contenir au moins un signe de ponctuation (%0).'
,p_version_scn=>2704761
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138651088517751200)
,p_name=>'PASSWORD_ONE_UPPER_ERR'
,p_message_language=>'fr'
,p_message_text=>'Le mot de passe doit contenir au moins une lettre majuscule.'
,p_version_scn=>2704761
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138664375484751204)
,p_name=>'PASSWORD_RESET_NOTIFICATION'
,p_message_language=>'fr'
,p_message_text=>unistr('Notification de r\00E9initialisation du mot de passe')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138649473996751199)
,p_name=>'PASSWORD_REUSE_ERROR'
,p_message_language=>'fr'
,p_message_text=>unistr('Le mot de passe ne peut pas \00EAtre utilis\00E9 car il l''a d\00E9j\00E0 \00E9t\00E9 au cours des %0 derniers jours.')
,p_version_scn=>2704761
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138646179632751198)
,p_name=>'PCT_GRAPH_ARIA_LABEL'
,p_message_language=>'fr'
,p_message_text=>unistr('Graphique \00E0 pourcentage')
,p_is_js_message=>true
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138737735734751226)
,p_name=>'PE.COMPONEN.TYPE.PAGE_ITEM.PLURAL'
,p_message_language=>'fr'
,p_message_text=>unistr('El\00E9ments')
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138737848683751226)
,p_name=>'PE.COMPONEN.TYPE.PAGE_ITEM.SINGULAR'
,p_message_language=>'fr'
,p_message_text=>unistr('El\00E9ment')
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138711948077751218)
,p_name=>'PERCENT'
,p_message_language=>'fr'
,p_message_text=>'Pourcentage'
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138681281617751209)
,p_name=>'PLEASE_CONTACT_ADMINISTRATOR'
,p_message_language=>'fr'
,p_message_text=>'Contactez l''administrateur.'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138793356299751242)
,p_name=>'PREVIOUS'
,p_message_language=>'fr'
,p_message_text=>unistr('Pr\00E9c\00E9dent')
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138729965749751223)
,p_name=>'PRINT'
,p_message_language=>'fr'
,p_message_text=>'Imprimer'
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138710781486751218)
,p_name=>'PRIVILEGES'
,p_message_language=>'fr'
,p_message_text=>unistr('Privil\00E8ges')
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138679386070751208)
,p_name=>'REGIOIN_REFERENCES'
,p_message_language=>'fr'
,p_message_text=>unistr('R\00E9f\00E9rences de r\00E9gion')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138700361665751214)
,p_name=>'REPORT'
,p_message_language=>'fr'
,p_message_text=>'Etat'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138710612099751217)
,p_name=>'REPORTING_PERIOD'
,p_message_language=>'fr'
,p_message_text=>unistr('P\00E9riode de g\00E9n\00E9ration d''\00E9tat')
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138793500984751242)
,p_name=>'REPORT_LABEL'
,p_message_language=>'fr'
,p_message_text=>'Etat : %0'
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138711317247751218)
,p_name=>'REPORT_TOTAL'
,p_message_language=>'fr'
,p_message_text=>unistr('Nombre total d''\00E9tats')
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138657055274751202)
,p_name=>'RESET'
,p_message_language=>'fr'
,p_message_text=>unistr('R\00E9initialiser la pagination')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138685744909751210)
,p_name=>'RESET_PAGINATION'
,p_message_language=>'fr'
,p_message_text=>unistr('R\00E9initialiser la pagination')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138715822510751219)
,p_name=>'RESET_PASSWORD'
,p_message_language=>'fr'
,p_message_text=>unistr('R\00E9initialiser le mot de passe')
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138691684290751212)
,p_name=>'RESTORE'
,p_message_language=>'fr'
,p_message_text=>'Restaurer'
,p_is_js_message=>true
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138725243180751222)
,p_name=>'RESULTS'
,p_message_language=>'fr'
,p_message_text=>unistr('R\00E9sultats')
,p_version_scn=>2704774
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138716908917751219)
,p_name=>'RETURN_TO_APPLICATION'
,p_message_language=>'fr'
,p_message_text=>unistr('Retour \00E0 l''application')
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138717382951751220)
,p_name=>'RIGHT'
,p_message_language=>'fr'
,p_message_text=>'A droite'
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138749373639751229)
,p_name=>'ROW'
,p_message_language=>'fr'
,p_message_text=>'Ligne %0'
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138699903013751214)
,p_name=>'ROW_COUNT'
,p_message_language=>'fr'
,p_message_text=>'Nombre de lignes'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138589781649751182)
,p_name=>'RW_AO_ASK_ORACLE'
,p_message_language=>'fr'
,p_message_text=>unistr('Demander \00E0 Oracle')
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138590005125751182)
,p_name=>'RW_AO_CLOSE_ASK_ORACLE'
,p_message_language=>'fr'
,p_message_text=>unistr('Fermer Demander \00E0 Oracle')
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138590309888751182)
,p_name=>'RW_AO_NOTIFICATIONS_LIST'
,p_message_language=>'fr'
,p_message_text=>'Liste des notifications'
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138589930931751182)
,p_name=>'RW_AO_OPEN_ASK_ORACLE'
,p_message_language=>'fr'
,p_message_text=>unistr('Ouvrir Demander \00E0 Oracle')
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138590200192751182)
,p_name=>'RW_AO_PRODUCT_MAP'
,p_message_language=>'fr'
,p_message_text=>'Correspondance de produit'
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138590106517751182)
,p_name=>'RW_AO_SUGGESTIONS_LIST'
,p_message_language=>'fr'
,p_message_text=>'Liste des suggestions'
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138591012134751182)
,p_name=>'RW_CLEAR'
,p_message_language=>'fr'
,p_message_text=>'Effacer'
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138590904638751182)
,p_name=>'RW_CLOSE'
,p_message_language=>'fr'
,p_message_text=>'Fermer'
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138590780491751182)
,p_name=>'RW_FO_VIEW_MORE'
,p_message_language=>'fr'
,p_message_text=>unistr('Visualiser d''autres \00E9l\00E9ments')
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138591153990751182)
,p_name=>'RW_GO_TO'
,p_message_language=>'fr'
,p_message_text=>unistr('Aller \00E0')
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138590536629751182)
,p_name=>'RW_GP_STEP'
,p_message_language=>'fr'
,p_message_text=>'Etape'
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138590696912751182)
,p_name=>'RW_GP_STEP_OF'
,p_message_language=>'fr'
,p_message_text=>'sur'
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138590444754751182)
,p_name=>'RW_GP_TOGGLE_STEPS'
,p_message_language=>'fr'
,p_message_text=>unistr('Activer/d\00E9sactiver l''affichage des \00E9tapes')
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138589590487751181)
,p_name=>'RW_HIDE_PASSWORD'
,p_message_language=>'fr'
,p_message_text=>'Masquer le mot de passe'
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138590839668751182)
,p_name=>'RW_OPEN'
,p_message_language=>'fr'
,p_message_text=>'Ouvrir'
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138589302926751181)
,p_name=>'RW_ORACLE'
,p_message_language=>'fr'
,p_message_text=>'Oracle'
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138589434194751181)
,p_name=>'RW_SHOW_PASSWORD'
,p_message_language=>'fr'
,p_message_text=>'Afficher le mot de passe'
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138591280669751182)
,p_name=>'RW_START'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9marrer')
,p_is_js_message=>true
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138716354109751219)
,p_name=>'SAVE'
,p_message_language=>'fr'
,p_message_text=>'Enregistrer'
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138712535296751218)
,p_name=>'SAVED_REPORTS.ALTERNATIVE.DEFAULT'
,p_message_language=>'fr'
,p_message_text=>unistr('Val. par d\00E9faut du rempla\00E7ant')
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138712999458751218)
,p_name=>'SAVED_REPORTS.DESCRIPTION'
,p_message_language=>'fr'
,p_message_text=>'Description'
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138712493652751218)
,p_name=>'SAVED_REPORTS.PRIMARY.DEFAULT'
,p_message_language=>'fr'
,p_message_text=>unistr('Val. par d\00E9faut du principal')
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138713250454751218)
,p_name=>'SC_REPORT_ROWS'
,p_message_language=>'fr'
,p_message_text=>unistr('Plus de %0 lignes sont disponibles. Augmentez le s\00E9lecteur de lignes pour afficher plus de lignes.')
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138780646003751238)
,p_name=>'SEARCH'
,p_message_language=>'fr'
,p_message_text=>'Rechercher'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138672131565751206)
,p_name=>'SECONDS'
,p_message_language=>'fr'
,p_message_text=>'secondes'
,p_version_scn=>2704763
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138712096694751218)
,p_name=>'SEE_ATTACHED'
,p_message_language=>'fr'
,p_message_text=>unistr('Consulter la pi\00E8ce jointe')
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138772674746751236)
,p_name=>'SELECT_ROW'
,p_message_language=>'fr'
,p_message_text=>unistr('S\00E9lectionner une ligne')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138711762159751218)
,p_name=>'SET_SCREEN_READER_MODE_OFF'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9sactiver le mode lecteur d''\00E9cran')
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138711817502751218)
,p_name=>'SET_SCREEN_READER_MODE_ON'
,p_message_language=>'fr'
,p_message_text=>unistr('Activer le mode lecteur d''\00E9cran')
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138708031971751217)
,p_name=>'SHOW'
,p_message_language=>'fr'
,p_message_text=>'Afficher'
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138774419001751237)
,p_name=>'SHOW_ALL'
,p_message_language=>'fr'
,p_message_text=>'Afficher tout'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138799255407751244)
,p_name=>'SIGN_IN'
,p_message_language=>'fr'
,p_message_text=>'Connexion'
,p_version_scn=>2704788
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138750134464751229)
,p_name=>'SIGN_OUT'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9connexion')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138700958409751215)
,p_name=>'SINCE_DAYS_AGO'
,p_message_language=>'fr'
,p_message_text=>'Depuis %0 jours'
,p_is_js_message=>true
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138708534044751217)
,p_name=>'SINCE_DAYS_FROM_NOW'
,p_message_language=>'fr'
,p_message_text=>'Dans %0 jours'
,p_is_js_message=>true
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138700883211751215)
,p_name=>'SINCE_HOURS_AGO'
,p_message_language=>'fr'
,p_message_text=>'Il y a %0 heures'
,p_is_js_message=>true
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138708461481751217)
,p_name=>'SINCE_HOURS_FROM_NOW'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 heures \00E0 partir de maintenant')
,p_is_js_message=>true
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138700749844751215)
,p_name=>'SINCE_MINUTES_AGO'
,p_message_language=>'fr'
,p_message_text=>'Il y a %0 minutes'
,p_is_js_message=>true
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138708369197751217)
,p_name=>'SINCE_MINUTES_FROM_NOW'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 minutes \00E0 partir de maintenant')
,p_is_js_message=>true
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138701138982751215)
,p_name=>'SINCE_MONTHS_AGO'
,p_message_language=>'fr'
,p_message_text=>'Il y a %0 mois'
,p_is_js_message=>true
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138708790859751217)
,p_name=>'SINCE_MONTHS_FROM_NOW'
,p_message_language=>'fr'
,p_message_text=>'Dans %0 mois'
,p_is_js_message=>true
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138708986156751217)
,p_name=>'SINCE_NOW'
,p_message_language=>'fr'
,p_message_text=>'Maintenant'
,p_is_js_message=>true
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138700656905751215)
,p_name=>'SINCE_SECONDS_AGO'
,p_message_language=>'fr'
,p_message_text=>'Il y a %0 secondes'
,p_is_js_message=>true
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138708280049751217)
,p_name=>'SINCE_SECONDS_FROM_NOW'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 secondes \00E0 partir de maintenant')
,p_is_js_message=>true
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138701098134751215)
,p_name=>'SINCE_WEEKS_AGO'
,p_message_language=>'fr'
,p_message_text=>'Il y a %0 semaines'
,p_is_js_message=>true
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138708660999751217)
,p_name=>'SINCE_WEEKS_FROM_NOW'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 semaines \00E0 partir de maintenant')
,p_is_js_message=>true
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138701290865751215)
,p_name=>'SINCE_YEARS_AGO'
,p_message_language=>'fr'
,p_message_text=>'Il y a %0 ans'
,p_is_js_message=>true
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138708891985751217)
,p_name=>'SINCE_YEARS_FROM_NOW'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 ann\00E9es \00E0 partir de maintenant')
,p_is_js_message=>true
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138694787138751213)
,p_name=>'STANDARD'
,p_message_language=>'fr'
,p_message_text=>'Standard'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138711646799751218)
,p_name=>'START_DATE'
,p_message_language=>'fr'
,p_message_text=>unistr('Date de d\00E9but')
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138646822639751198)
,p_name=>'SUBSCRIPTION_CREATED_BY'
,p_message_language=>'fr'
,p_message_text=>unistr('Ce courriel provient d''un abonnement \00E0 l''\00E9tat interactif cr\00E9\00E9 par %0.')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138808468725751247)
,p_name=>'SUBSCRIPTION_REFERENCES'
,p_message_language=>'fr'
,p_message_text=>'Abonnements'
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138757865779751232)
,p_name=>'TAB'
,p_message_language=>'fr'
,p_message_text=>'Onglet'
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138672064387751206)
,p_name=>'TITLE'
,p_message_language=>'fr'
,p_message_text=>'Titre'
,p_version_scn=>2704763
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138651763377751200)
,p_name=>'TODAY'
,p_message_language=>'fr'
,p_message_text=>'Aujourd''hui'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138711206347751218)
,p_name=>'TOTAL'
,p_message_language=>'fr'
,p_message_text=>'Total'
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138653043754751200)
,p_name=>'TO_MANY_COLUMNS_SELECTED'
,p_message_language=>'fr'
,p_message_text=>unistr('Un maximum de %0 colonnes peut \00EAtre s\00E9lectionn\00E9.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138608829256751187)
,p_name=>'TREE.COLLAPSE_ALL'
,p_message_language=>'fr'
,p_message_text=>unistr('R\00E9duire tout')
,p_is_js_message=>true
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138609459218751187)
,p_name=>'TREE.COLLAPSE_ALL_BELOW'
,p_message_language=>'fr'
,p_message_text=>unistr('R\00E9duire tous les \00E9l\00E9ments en dessous')
,p_is_js_message=>true
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138608452559751187)
,p_name=>'TREE.EXPAND_ALL'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9velopper tout')
,p_is_js_message=>true
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138609140652751187)
,p_name=>'TREE.EXPAND_ALL_BELOW'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9velopper tous les \00E9l\00E9ments en dessous')
,p_is_js_message=>true
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138609652808751187)
,p_name=>'TREE.REPARENT'
,p_message_language=>'fr'
,p_message_text=>'Affecter un nouveau parent'
,p_is_js_message=>true
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138731794370751224)
,p_name=>'TREES'
,p_message_language=>'fr'
,p_message_text=>'Arborescences'
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138774507947751237)
,p_name=>'UI.FORM.REQUIRED'
,p_message_language=>'fr'
,p_message_text=>'Requis'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138695488863751213)
,p_name=>'UNAUTHORIZED'
,p_message_language=>'fr'
,p_message_text=>unistr('Non autoris\00E9')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138745631107751228)
,p_name=>'UNAVAILABLE'
,p_message_language=>'fr'
,p_message_text=>'Non disponible'
,p_version_scn=>2704780
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138709374234751217)
,p_name=>'UNKNOWN'
,p_message_language=>'fr'
,p_message_text=>'Inconnu'
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138647701861751199)
,p_name=>'UNKNOWN_AUTHENTICATION_ERROR'
,p_message_language=>'fr'
,p_message_text=>unistr('Une erreur d''authentification non identifi\00E9e s''est produite.')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138649984739751199)
,p_name=>'UNSUBSCRIBE_SUBSCRIPTION_MSG_HTML'
,p_message_language=>'fr'
,p_message_text=>unistr('Si vous ne souhaitez plus recevoir de courriels, cliquez sur <a href="%0">Annuler l''abonnement</a> pour g\00E9rer votre abonnement.')
,p_version_scn=>2704761
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138646797465751198)
,p_name=>'UNSUBSCRIBE_SUBSCRIPTION_MSG_TXT'
,p_message_language=>'fr'
,p_message_text=>unistr('Si vous ne souhaitez plus recevoir de courriels, acc\00E9dez \00E0 l''URL suivante pour g\00E9rer votre abonnement :')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138686274662751210)
,p_name=>'UNSUPPORTED_DATA_TYPE'
,p_message_language=>'fr'
,p_message_text=>unistr('type de donn\00E9es non pris en charge')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138673311159751206)
,p_name=>'UPDATE'
,p_message_language=>'fr'
,p_message_text=>unistr('mettre \00E0 jour')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138671935717751206)
,p_name=>'UPDATED'
,p_message_language=>'fr'
,p_message_text=>unistr('Mis \00E0 jour')
,p_version_scn=>2704763
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138615102739751189)
,p_name=>'UPGRADE_IN_PROGRESS'
,p_message_language=>'fr'
,p_message_text=>unistr('Mise \00E0 niveau en cours')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138615453266751189)
,p_name=>'UPGRADE_IN_PROGRESS_DETAIL'
,p_message_language=>'fr'
,p_message_text=>unistr('Oracle APEX est en cours de mise \00E0 niveau vers une nouvelle version. Ce processus prend en g\00E9n\00E9ral jusqu''\00E0 3 minutes.')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138678736368751208)
,p_name=>'URL_PROHIBITED'
,p_message_language=>'fr'
,p_message_text=>unistr('L''URL demand\00E9e est interdite. Contactez l''administrateur.')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138699835644751214)
,p_name=>'USER'
,p_message_language=>'fr'
,p_message_text=>'Utilisateur'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138723065731751221)
,p_name=>'USERNAME'
,p_message_language=>'fr'
,p_message_text=>'Nom utilisateur'
,p_version_scn=>2704772
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138764440236751234)
,p_name=>'USERNAME_TOO_LONG'
,p_message_language=>'fr'
,p_message_text=>unistr('Le nom utilisateur est trop long. La limite est de %0 caract\00E8res.')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138706913471751216)
,p_name=>'USERS'
,p_message_language=>'fr'
,p_message_text=>'utilisateurs'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138764007089751233)
,p_name=>'USER_EXISTS'
,p_message_language=>'fr'
,p_message_text=>unistr('Le nom utilisateur existe d\00E9j\00E0.')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138777836717751238)
,p_name=>'USER_PROFILE_IMAGE'
,p_message_language=>'fr'
,p_message_text=>'Image de profil de l''utilisateur %0'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138639753466751196)
,p_name=>'UTILIZATION_REPORTS.AUTOMATION'
,p_message_language=>'fr'
,p_message_text=>'Automatisation - %0'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138638222083751196)
,p_name=>'UTILIZATION_REPORTS.PAGE'
,p_message_language=>'fr'
,p_message_text=>'Page %0 - %1 '
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138641122427751197)
,p_name=>'UTILIZATION_REPORTS.PLUG_NAME'
,p_message_language=>'fr'
,p_message_text=>'%0 - %1'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138641259201751197)
,p_name=>'UTILIZATION_REPORTS.PROCESS_NAME'
,p_message_language=>'fr'
,p_message_text=>'%0 - %1'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138640135034751196)
,p_name=>'UTILIZATION_REPORTS.SEARCH_CONFIG'
,p_message_language=>'fr'
,p_message_text=>'Configuration de recherche - %0'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138640037689751196)
,p_name=>'UTILIZATION_REPORTS.SHARED_DYNAMIC_LOV'
,p_message_language=>'fr'
,p_message_text=>unistr('Liste de valeurs dynamique partag\00E9e - %0')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138639809591751196)
,p_name=>'UTILIZATION_REPORTS.TASK_DEFINITION'
,p_message_language=>'fr'
,p_message_text=>unistr('D\00E9finition de t\00E2che - %0')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138638355932751196)
,p_name=>'UTILIZATION_REPORTS.WORKFLOW'
,p_message_language=>'fr'
,p_message_text=>'Workflow - %0 '
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138660490601751203)
,p_name=>'VALID'
,p_message_language=>'fr'
,p_message_text=>'Valide'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138652097728751200)
,p_name=>'VALIDATIONS'
,p_message_language=>'fr'
,p_message_text=>'Validations'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138712731763751218)
,p_name=>'VALUE_MUST_BE_SPECIFIED'
,p_message_language=>'fr'
,p_message_text=>unistr('La valeur doit \00EAtre indiqu\00E9e')
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138759042402751232)
,p_name=>'VALUE_MUST_BE_SPECIFIED_FOR'
,p_message_language=>'fr'
,p_message_text=>'Vous devez indiquer la valeur pour %0'
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138681697434751209)
,p_name=>'VERTICAL'
,p_message_language=>'fr'
,p_message_text=>'vertical'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138673285110751206)
,p_name=>'VIEW'
,p_message_language=>'fr'
,p_message_text=>'visualiser'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138707064679751216)
,p_name=>'VIEWS'
,p_message_language=>'fr'
,p_message_text=>'vues'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138713531192751218)
,p_name=>'VIEW_ALL'
,p_message_language=>'fr'
,p_message_text=>'Visualiser tout'
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138653466351751200)
,p_name=>'VISUALLY_HIDDEN_LINK'
,p_message_language=>'fr'
,p_message_text=>unistr('Lien masqu\00E9 visuellement')
,p_is_js_message=>true
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138694220398751213)
,p_name=>'WARNING'
,p_message_language=>'fr'
,p_message_text=>'Avertissement'
,p_is_js_message=>true
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138672823675751206)
,p_name=>'WEEK'
,p_message_language=>'fr'
,p_message_text=>'semaine'
,p_version_scn=>2704763
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138668730701751205)
,p_name=>'WEEKLY'
,p_message_language=>'fr'
,p_message_text=>'Hebdomadaire'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138672978856751206)
,p_name=>'WEEKS'
,p_message_language=>'fr'
,p_message_text=>'semaines'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138712840315751218)
,p_name=>'WELCOME_USER'
,p_message_language=>'fr'
,p_message_text=>'Bienvenue, %0'
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138711063193751218)
,p_name=>'WWV_DBMS_SQL.INVALID_CLOB'
,p_message_language=>'fr'
,p_message_text=>unistr('Une valeur non valide a \00E9t\00E9 trouv\00E9e. V\00E9rifiez les donn\00E9es saisies.')
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138711101620751218)
,p_name=>'WWV_DBMS_SQL.INVALID_DATATYPE'
,p_message_language=>'fr'
,p_message_text=>unistr('Une valeur non valide a \00E9t\00E9 trouv\00E9e. V\00E9rifiez les donn\00E9es saisies.')
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138648985932751199)
,p_name=>'WWV_DBMS_SQL.INVALID_DATE'
,p_message_language=>'fr'
,p_message_text=>unistr('Valeur de date non valide. V\00E9rifiez le format de date.')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138710952720751218)
,p_name=>'WWV_DBMS_SQL.INVALID_NUMBER'
,p_message_language=>'fr'
,p_message_text=>unistr('Une valeur num\00E9rique non valide a \00E9t\00E9 trouv\00E9e. V\00E9rifiez le format num\00E9rique.')
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138660025768751202)
,p_name=>'WWV_DBMS_SQL.INVALID_TIMESTAMP'
,p_message_language=>'fr'
,p_message_text=>unistr('Valeur d''horodatage non valide. V\00E9rifiez le format d''horodatage.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138684570770751210)
,p_name=>'WWV_DBMS_SQL.UNABLE_TO_BIND_ERR'
,p_message_language=>'fr'
,p_message_text=>unistr('Liaison impossible pour "%0". Utilisez des guillemets pour les \00E9l\00E9ments multioctets ou assurez-vous que la longueur de l''\00E9l\00E9ment est inf\00E9rieure ou \00E9gale \00E0 30 octets. Pour faire r\00E9f\00E9rence \00E0 des \00E9l\00E9ments d''une longueur sup\00E9rieure \00E0 30 octets, utilisez ')
||'la syntaxe v().'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138674377895751207)
,p_name=>'WWV_FLOW.ACCESS_DENIED'
,p_message_language=>'fr'
,p_message_text=>unistr('Acc\00E8s refus\00E9 par le contr\00F4le de s\00E9curit\00E9 %0')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138676852867751207)
,p_name=>'WWV_FLOW.APP_NOT_AVAILABLE'
,p_message_language=>'fr'
,p_message_text=>'Application non disponible'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138675243921751207)
,p_name=>'WWV_FLOW.APP_NOT_FOUND_ERR'
,p_message_language=>'fr'
,p_message_text=>'Application introuvable.'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138675350387751207)
,p_name=>'WWV_FLOW.APP_NOT_FOUND_FOOTER_ERR'
,p_message_language=>'fr'
,p_message_text=>'application=%0  espace de travail=%1'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138675723178751207)
,p_name=>'WWV_FLOW.APP_RESTRICTED'
,p_message_language=>'fr'
,p_message_text=>unistr('L''acc\00E8s \00E0 cette application est limit\00E9. Ressayez plus tard.')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138675627729751207)
,p_name=>'WWV_FLOW.APP_RESTRICTED_TO_DEV'
,p_message_language=>'fr'
,p_message_text=>unistr('L''acc\00E8s \00E0 cette application est r\00E9serv\00E9 aux d\00E9veloppeurs d''application ; ressayez plus tard.')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138674821421751207)
,p_name=>'WWV_FLOW.BRANCH_FUNC_RETURNING_URL_ERROR'
,p_message_language=>'fr'
,p_message_text=>'ERR-7744 Impossible de traiter un branchement sur une fonction renvoyant une URL.'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138674733240751207)
,p_name=>'WWV_FLOW.BRANCH_TO_FUNCT_RET_PAGE_ERR'
,p_message_language=>'fr'
,p_message_text=>'ERR-7744 Impossible de traiter un branchement sur une fonction renvoyant une page.'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138675069670751207)
,p_name=>'WWV_FLOW.CALL_TO_SHOW_FROM_PROC_ERR'
,p_message_language=>'fr'
,p_message_text=>unistr('ERR-1430 Appel au processus d''affichage \00E0 partir de la page non pris en charge : G_FLOW_STEP_ID (%0).')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138676129543751207)
,p_name=>'WWV_FLOW.CLEAR_STEP_CACHE_ERR'
,p_message_language=>'fr'
,p_message_text=>unistr('ERR-1018 Erreur lors du nettoyage du cache d''\00E9tape.')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138674563686751207)
,p_name=>'WWV_FLOW.COMP_UNKNOWN_ERR'
,p_message_language=>'fr'
,p_message_text=>'ERR-1005 Type de calcul inconnu'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138675410528751207)
,p_name=>'WWV_FLOW.CUSTOM_AUTH_SESSION_ERR'
,p_message_language=>'fr'
,p_message_text=>unistr('ERR-1201 ID de session non d\00E9fini pour authentification personnalis\00E9e')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138675552867751207)
,p_name=>'WWV_FLOW.CUSTOM_AUTH_SESSION_FOOTER_ERR'
,p_message_language=>'fr'
,p_message_text=>'page=%0'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138675145742751207)
,p_name=>'WWV_FLOW.DET_COMPANY_ERR'
,p_message_language=>'fr'
,p_message_text=>unistr('ERR-7620 Impossible de d\00E9terminer l''espace de travail de l''application (%0).')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138655614797751201)
,p_name=>'WWV_FLOW.EDIT'
,p_message_language=>'fr'
,p_message_text=>'Modifier'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138674238629751207)
,p_name=>'WWV_FLOW.FIND_ITEM_ERR2'
,p_message_language=>'fr'
,p_message_text=>unistr('ERR-1802 ID \00E9l\00E9ment "%0" introuvable')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138673998626751207)
,p_name=>'WWV_FLOW.FIND_ITEM_ID_ERR'
,p_message_language=>'fr'
,p_message_text=>unistr('ERR-1002 ID d''\00E9l\00E9ment introuvable pour l''\00E9l\00E9ment "%0" dans l''application "%1".')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138674081616751207)
,p_name=>'WWV_FLOW.FIND_ITEM_ID_ERR2'
,p_message_language=>'fr'
,p_message_text=>unistr('Erreur inattendue, nom d''\00E9l\00E9ment introuvable au niveau application ou page.')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138674420224751207)
,p_name=>'WWV_FLOW.FIRST_PAGE_DATA_ERR'
,p_message_language=>'fr'
,p_message_text=>unistr('Vous \00EAtes d\00E9j\00E0 dans la premi\00E8re page de donn\00E9es.')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138690961276751212)
,p_name=>'WWV_FLOW.ITEM_POSTING_VIOLATION'
,p_message_language=>'fr'
,p_message_text=>unistr('L''ID de l''\00E9l\00E9ment (%0) n''est pas d\00E9fini sur la page en cours.')
,p_version_scn=>2704768
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138648591254751199)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.INTERNAL_ONLY'
,p_message_language=>'fr'
,p_message_text=>unistr('L''\00E9l\00E9ment ne peut pas \00EAtre d\00E9fini par la transmission d''arguments \00E0 l''application.')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138648838060751199)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.NO_CHECKSUM'
,p_message_language=>'fr'
,p_message_text=>unistr('(Aucun checksum n''a \00E9t\00E9 fourni)')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138648321798751199)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.PRIVATE_BOOKMARK'
,p_message_language=>'fr'
,p_message_text=>unistr('L''\00E9l\00E9ment peut \00EAtre d\00E9fini lorsqu''il est accompagn\00E9 d''un checksum de type "signet de niveau utilisateur".')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138648253257751199)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.PUBLIC_BOOKMARK'
,p_message_language=>'fr'
,p_message_text=>unistr('L''\00E9l\00E9ment peut \00EAtre d\00E9fini lorsqu''il est accompagn\00E9 d''un checksum de type "signet de niveau application".')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138648434335751199)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.SESSION'
,p_message_language=>'fr'
,p_message_text=>unistr('L''\00E9l\00E9ment peut \00EAtre d\00E9fini lorsqu''il est accompagn\00E9 d''un checksum de type "session".')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138648102356751199)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.UNPROTECTED'
,p_message_language=>'fr'
,p_message_text=>unistr('L''\00E9l\00E9ment n''a pas de protection.')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138676288399751207)
,p_name=>'WWV_FLOW.NO_PAGE_HELP'
,p_message_language=>'fr'
,p_message_text=>'Aucune aide n''est disponible pour la page.'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138664191164751204)
,p_name=>'WWV_FLOW.NO_PRIV_ON_SCHEMA'
,p_message_language=>'fr'
,p_message_text=>unistr('L''espace de travail %0 n''est pas autoris\00E9 \00E0 effectuer une analyse en tant que sch\00E9ma %1.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138674628981751207)
,p_name=>'WWV_FLOW.PAGE_ACCEPT_RECUR_ERR'
,p_message_language=>'fr'
,p_message_text=>unistr('ERR-1010 Branchement sur un traitement d''acceptation de page : limite de r\00E9cursivit\00E9 d\00E9pass\00E9e. %0')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138631164159751194)
,p_name=>'WWV_FLOW.PAGE_PATTERN_NOT_RUNNABLE'
,p_message_language=>'fr'
,p_message_text=>unistr('Page non disponible, vous ne pouvez pas ex\00E9cuter de mod\00E8le de page.')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138648771588751199)
,p_name=>'WWV_FLOW.PAGE_PROTECTION.SHOW_NO_URL_ALLOWED'
,p_message_language=>'fr'
,p_message_text=>unistr('Cette page ne peut pas \00EAtre appel\00E9e via une URL ou au moyen de GET ou POST vers la proc\00E9dure d''affichage. Elle doit \00EAtre appel\00E9e \00E0 l''aide d''un branchement de type "Branchement sur une page".')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138733567179751224)
,p_name=>'WWV_FLOW.SAVE_ROUTINE_NUMERIC_ERR'
,p_message_language=>'fr'
,p_message_text=>unistr('Erreur lors de la tentative d''enregistrement d''une valeur non num\00E9rique dans l''\00E9l\00E9ment %0. ')
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138665888433751204)
,p_name=>'WWV_FLOW.SCHEMA_NOT_EXISTS'
,p_message_language=>'fr'
,p_message_text=>unistr('Le sch\00E9ma d''analyse "%0" de l''application n''existe pas dans la base de donn\00E9es.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138665932654751204)
,p_name=>'WWV_FLOW.SERVICE_ADMIN_LINK'
,p_message_language=>'fr'
,p_message_text=>unistr('Les comptes de l''espace de travail INTERNAL ne peuvent \00EAtre utilis\00E9s que pour acc\00E9der \00E0 &PRODUCT_NAME. <a href="%0">Services d''administration</a>.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138673879406751206)
,p_name=>'WWV_FLOW.SESSION_INFO_ERR'
,p_message_language=>'fr'
,p_message_text=>unistr('ERR-1029 Impossible de stocker les infos de session. session=%0 \00E9l\00E9ment=%1')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138676943093751207)
,p_name=>'WWV_FLOW.UNABLE_TO_STOP_TRACE_ERR'
,p_message_language=>'fr'
,p_message_text=>unistr('Impossible d''arr\00EAter la trace : %0')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138674174914751207)
,p_name=>'WWV_FLOW.UNEXPECTED_ERR'
,p_message_language=>'fr'
,p_message_text=>'Erreur inattendue'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138684973952751210)
,p_name=>'WWV_FLOW.UPDATE_SUB_ERR'
,p_message_language=>'fr'
,p_message_text=>'Erreur dans update_substitution_cache : %0'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138677059236751207)
,p_name=>'WWV_FLOW.VIEW_HELP_ERR'
,p_message_language=>'fr'
,p_message_text=>unistr('L''application et la page doivent \00EAtre indiqu\00E9es pour l''affichage de l''aide.')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138698726132751214)
,p_name=>'WWV_FLOW_AUTOMATION.AUTOMATION_NOT_FOUND'
,p_message_language=>'fr'
,p_message_text=>'Automatisation introuvable.'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138634268338751195)
,p_name=>'WWV_FLOW_AUTOMATION.QUERY_ERROR'
,p_message_language=>'fr'
,p_message_text=>unistr('Erreur de requ\00EAte d''automatisation : %0')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138678151707751208)
,p_name=>'WWV_FLOW_CACHE.PURGE_SESSION'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 sessions ont \00E9t\00E9 purg\00E9es.')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138619435913751190)
,p_name=>'WWV_FLOW_CODE_EXEC_MLE.LANGUAGE_NOT_SUPPORTED'
,p_message_language=>'fr'
,p_message_text=>unistr('Impossible d''ex\00E9cuter le code %0. Il n''est pas pris en charge par la base de donn\00E9es ou n''est pas activ\00E9 par le param\00E8tre d''instance MLE_LANGUAGES.')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138617099093751190)
,p_name=>'WWV_FLOW_CODE_EXEC_MLE.MLE_NOT_SUPPORTED'
,p_message_language=>'fr'
,p_message_text=>unistr('Multilingual Engine n''est pas disponible pour cette version de base de donn\00E9es.')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138656239583751201)
,p_name=>'WWV_FLOW_COLLECTION.ARRAY_NOT_NULL'
,p_message_language=>'fr'
,p_message_text=>'Le tableau de collection d''applications ne doit pas avoir la valeur Null.'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138656007929751201)
,p_name=>'WWV_FLOW_COLLECTION.ATTRIBUTE_NUMBER_OUTSIDE_RANGE'
,p_message_language=>'fr'
,p_message_text=>unistr('Le num\00E9ro d''attribut de membre indiqu\00E9, %0, n''est pas valide. Le num\00E9ro d''attribut doit \00EAtre compris entre 1 et %1.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138656517750751201)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_EXISTS'
,p_message_language=>'fr'
,p_message_text=>'La collection d''applications existe.'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138656353659751201)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NAME_NOT_NULL'
,p_message_language=>'fr'
,p_message_text=>'Le nom de collection ne doit pas avoir la valeur Null.'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138656402736751201)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NAME_TOO_LARGE'
,p_message_language=>'fr'
,p_message_text=>unistr('La longueur du nom de collection ne doit pas d\00E9passer 255 caract\00E8res.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138655873361751201)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NOT_EXIST'
,p_message_language=>'fr'
,p_message_text=>'La collection d''applications %0 n''existe pas.'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138656630828751201)
,p_name=>'WWV_FLOW_COLLECTION.CURSOR_NOT_OPEN'
,p_message_language=>'fr'
,p_message_text=>'Le curseur n''est pas encore ouvert.'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138655915026751201)
,p_name=>'WWV_FLOW_COLLECTION.MEMBER_NOT_EXIST'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('La s\00E9quence de membre %0 n''existe pas dans la collection d''applications %1'),
''))
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138656194882751201)
,p_name=>'WWV_FLOW_COLLECTION.MEMBER_SEQUENCE_NUMBER_INVALID'
,p_message_language=>'fr'
,p_message_text=>unistr('La s\00E9quence de membre %0 n''existe pas dans la collection d''applications "%1"')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138608993817751187)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_ALGORITHM'
,p_message_language=>'fr'
,p_message_text=>'L''algorithme %0 n''est pas pris en charge pour ECDSA.'
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138608647391751187)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_EC_CURVE'
,p_message_language=>'fr'
,p_message_text=>'La courbe elliptique %0 n''est pas prise en charge.'
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138734368278751225)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_FUNCTION'
,p_message_language=>'fr'
,p_message_text=>unistr('La fonction de cryptographie %0 n''est pas prise en charge sur ce syst\00E8me.')
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138786669618751240)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_ACCESSIBLE'
,p_message_language=>'fr'
,p_message_text=>unistr('Accessibilit\00E9 test\00E9e')
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138677654493751208)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_CLOSE'
,p_message_language=>'fr'
,p_message_text=>'Fermer'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138677798015751208)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_CUST_OPT'
,p_message_language=>'fr'
,p_message_text=>'Options de personnalisation de page'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138677841181751208)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_DEFAULT'
,p_message_language=>'fr'
,p_message_text=>unistr('Valeur par d\00E9faut')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138677918994751208)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_DISP'
,p_message_language=>'fr'
,p_message_text=>unistr('Affich\00E9')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138678015427751208)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_HIDDEN'
,p_message_language=>'fr'
,p_message_text=>unistr('Masqu\00E9')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138677428993751208)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE1'
,p_message_language=>'fr'
,p_message_text=>unistr('Cochez les r\00E9gions que vous voulez inclure dans la page. Les r\00E9gions coch\00E9es peuvent ne pas s''afficher si vous n''\00EAtes pas dans le bon contexte applicatif ou si vous ne disposez pas des privil\00E8ges appropri\00E9s.')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138677527524751208)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE2'
,p_message_language=>'fr'
,p_message_text=>'Vous ne pouvez pas personnaliser cette page.'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138786960804751240)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE3'
,p_message_language=>'fr'
,p_message_text=>unistr('Vous pouvez personnaliser l''apparence de cette application en modifiant le style de th\00E8me. S\00E9lectionnez un style de th\00E8me dans la liste ci-dessous et cliquez sur Appliquer les modifications.')
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138787724556751241)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_REGION_DISP'
,p_message_language=>'fr'
,p_message_text=>unistr('Affichage de la r\00E9gion')
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138786872559751240)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_REMOVE_STYLE'
,p_message_language=>'fr'
,p_message_text=>unistr('Utiliser le style par d\00E9faut de l''application')
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138786705082751240)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_THEME_STYLE'
,p_message_language=>'fr'
,p_message_text=>'Apparence '
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138730926472751224)
,p_name=>'WWV_FLOW_DATA_EXPORT.AGG_COLUMN_IDX_NOT_EXIST'
,p_message_language=>'fr'
,p_message_text=>unistr('L''index de colonne r\00E9f\00E9renc\00E9 dans l''\00E9l\00E9ment %0 agr\00E9g\00E9 n''existe pas.')
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138623666008751192)
,p_name=>'WWV_FLOW_DATA_EXPORT.APPEND_NOT_SUPPORTED'
,p_message_language=>'fr'
,p_message_text=>unistr('L''ajout de l''export de donn\00E9es n''est pas pris en charge pour le format %0.')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138586626177751181)
,p_name=>'WWV_FLOW_DATA_EXPORT.CLOB_NOT_SUPPORTED'
,p_message_language=>'fr'
,p_message_text=>'La sortie CLOB n''est pas prise en charge pour le format %0.'
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138730624918751223)
,p_name=>'WWV_FLOW_DATA_EXPORT.COLUMN_BREAK_MUST_BE_IN_THE_BEGGINING'
,p_message_language=>'fr'
,p_message_text=>unistr('La section de colonne doit appara\00EEtre au d\00E9but du tableau de colonnes.')
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138730791835751224)
,p_name=>'WWV_FLOW_DATA_EXPORT.COLUMN_GROUP_IDX_NOT_EXIST'
,p_message_language=>'fr'
,p_message_text=>unistr('L''index de groupe de colonnes r\00E9f\00E9renc\00E9 dans %0 n''existe pas.')
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138637841266751196)
,p_name=>'WWV_FLOW_DATA_EXPORT.EXPORT'
,p_message_language=>'fr'
,p_message_text=>'export'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138645003149751198)
,p_name=>'WWV_FLOW_DATA_EXPORT.FORMAT_MUST_BE_XML'
,p_message_language=>'fr'
,p_message_text=>unistr('Le format d''export doit \00EAtre XML, avec ORDS comme serveur d''impression.')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138731042114751224)
,p_name=>'WWV_FLOW_DATA_EXPORT.HIGHLIGHT_COLUMN_IDX_NOT_EXIST'
,p_message_language=>'fr'
,p_message_text=>unistr('L''index de colonne r\00E9f\00E9renc\00E9 dans l''\00E9l\00E9ment %0 de mise en \00E9vidence n''existe pas.')
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138634477014751195)
,p_name=>'WWV_FLOW_DATA_EXPORT.INVALID_FORMAT'
,p_message_language=>'fr'
,p_message_text=>'Format d''export non valide : %0'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138730826749751224)
,p_name=>'WWV_FLOW_DATA_EXPORT.PARENT_GROUP_IDX_NOT_EXIST'
,p_message_language=>'fr'
,p_message_text=>unistr('L''index de groupe parent r\00E9f\00E9renc\00E9 dans %0 n''existe pas.')
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138756021512751231)
,p_name=>'WWV_FLOW_DATA_LOADER.CANNOT_LOAD_INTO_GENERATED_ALWAYS_COLUMN'
,p_message_language=>'fr'
,p_message_text=>unistr('La colonne %1 de la table %0 est une colonne d''identit\00E9 cr\00E9\00E9e avec "GENERATED ALWAYS". V\00E9rifiez qu''aucune colonne source n''est mise en correspondance avec la colonne %1 dans la bo\00EEte de dialogue Configurer.')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138667678677751205)
,p_name=>'WWV_FLOW_DATA_LOADER.COMMIT_INTERVAL_TOO_LOW'
,p_message_language=>'fr'
,p_message_text=>unistr('L''intervalle de validation indiqu\00E9 est trop petit.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138667733966751205)
,p_name=>'WWV_FLOW_DATA_LOADER.NO_COLUMNS_PROVIDED'
,p_message_language=>'fr'
,p_message_text=>unistr('Aucune colonne n''a \00E9t\00E9 fournie pour le chargement des donn\00E9es.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138669076476751205)
,p_name=>'WWV_FLOW_DATA_PARSER.NO_COLUMNS_FOUND'
,p_message_language=>'fr'
,p_message_text=>unistr('Aucune colonne trouv\00E9e pour le s\00E9lecteur de ligne "%0". Essayez d''effectuer une d\00E9tection automatique ou de v\00E9rifier la structure JSON.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138678430350751208)
,p_name=>'WWV_FLOW_DATA_PARSER.NO_WORKSHEETS_FOUND'
,p_message_language=>'fr'
,p_message_text=>'Feuilles de calcul introuvables dans le fichier XLSX.'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138623537015751192)
,p_name=>'WWV_FLOW_DATA_PARSER.REQUESTED_HIERARCHY_LEVELS_EXCEED_MAXIMUM'
,p_message_language=>'fr'
,p_message_text=>unistr('Le nombre de niveaux de hi\00E9rarchie demand\00E9s pour le rep\00E9rage (%0) d\00E9passe la valeur maximale (%1).')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138678309943751208)
,p_name=>'WWV_FLOW_DATA_PARSER.WORKSHEET_DOES_NOT_EXIST'
,p_message_language=>'fr'
,p_message_text=>unistr('La feuille de calcul indiqu\00E9e n''existe pas dans le fichier XLSX.')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138656779375751201)
,p_name=>'WWV_FLOW_DML.VERSION_OF_DATA_CHANGED'
,p_message_language=>'fr'
,p_message_text=>unistr('La version en cours des donn\00E9es dans la base a chang\00E9 depuis que l''utilisateur a lanc\00E9 le traitement de mise \00E0 jour.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138659639695751202)
,p_name=>'WWV_FLOW_EDIT_REPORT.ERR_UPDATING_COLS'
,p_message_language=>'fr'
,p_message_text=>unistr('Erreur lors de la mise \00E0 jour des colonnes d''\00E9tat : %0')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138770167295751235)
,p_name=>'WWV_FLOW_EXEC.CANNOT_CONVERT_TO_SDOGEOMETRY'
,p_message_language=>'fr'
,p_message_text=>'Impossible de convertir %0 en SDO_GEOMETRY.'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138706608624751216)
,p_name=>'WWV_FLOW_EXEC.CAN_NOT_CONVERT_TO_VARCHAR2'
,p_message_language=>'fr'
,p_message_text=>unistr('Impossible de convertir la colonne %0 dont le type de donn\00E9es est %1 en VARCHAR2.')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138714041875751219)
,p_name=>'WWV_FLOW_EXEC.COLUMN_NOT_FOUND'
,p_message_language=>'fr'
,p_message_text=>unistr('La colonne "%0" indiqu\00E9e pour l''attribut "%1" est introuvable dans la source de donn\00E9es.')
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138650149996751199)
,p_name=>'WWV_FLOW_EXEC.FILTER_NOT_SUPPORTED_WITH_MULTIPLE_VALUES'
,p_message_language=>'fr'
,p_message_text=>'Le type de filtre %0 n''est pas pris en charge pour les colonnes multivaleurs.'
,p_version_scn=>2704761
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138773666732751236)
,p_name=>'WWV_FLOW_EXEC.INVALID_BETWEEN_FILTER'
,p_message_language=>'fr'
,p_message_text=>'Filtre "Entre" non valide.'
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138629261444751193)
,p_name=>'WWV_FLOW_EXEC.INVALID_COLUMN_OR_ROW_DATATYPE'
,p_message_language=>'fr'
,p_message_text=>unistr('Aucune valeur %2 trouv\00E9e dans la colonne %0, ligne num\00E9ro %1.')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138625995466751192)
,p_name=>'WWV_FLOW_EXEC.INVALID_COLUMN_OR_ROW_REFERENCE'
,p_message_language=>'fr'
,p_message_text=>unistr('La colonne %0 ou la ligne num\00E9ro %1 n''existe pas.')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138612503713751188)
,p_name=>'WWV_FLOW_EXEC.INVALID_LOV_SPECIFICATION'
,p_message_language=>'fr'
,p_message_text=>unistr('Type de liste de valeurs indiqu\00E9 non valide.')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138612408611751188)
,p_name=>'WWV_FLOW_EXEC.INVALID_QUERY_TYPE'
,p_message_language=>'fr'
,p_message_text=>unistr('Type de requ\00EAte non valide. Le type de requ\00EAte doit \00EAtre une table, une requ\00EAte SQL ou une fonction PL/SQL renvoyant une requ\00EAte SQL.')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138706763600751216)
,p_name=>'WWV_FLOW_EXEC.INVALID_SQL_QUERY'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Echec de l''analyse de la requ\00EAte SQL.'),
'%0'))
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138714102366751219)
,p_name=>'WWV_FLOW_EXEC.LEGACY_COLUMN_NOT_FOUND'
,p_message_language=>'fr'
,p_message_text=>unistr('La position de colonne %0 indiqu\00E9e pour l''attribut "%1" est introuvable dans l''instruction SQL.')
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138604101706751186)
,p_name=>'WWV_FLOW_EXEC.MULTI_VALUE_TOO_MANY_ITEMS'
,p_message_language=>'fr'
,p_message_text=>unistr('Trop d''\00E9l\00E9ments utilis\00E9s dans le filtre \00E0 plusieurs valeurs.')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138713937208751218)
,p_name=>'WWV_FLOW_EXEC.NO_COLUMN_FOR_ATTRIBUTE'
,p_message_language=>'fr'
,p_message_text=>unistr('Aucune colonne indiqu\00E9e pour l''attribut "%0".')
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138612375390751188)
,p_name=>'WWV_FLOW_EXEC.NULL_QUERY_RETURNED_BY_FUNCTION'
,p_message_language=>'fr'
,p_message_text=>unistr('Le corps de fonction PL/SQL n''a renvoy\00E9 aucune valeur.')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138729740840751223)
,p_name=>'WWV_FLOW_EXEC.OPERATION_NOT_PRESENT_IN_WEB_SRC_MODULE'
,p_message_language=>'fr'
,p_message_text=>unistr('La source de donn\00E9es REST ne dispose pas d''op\00E9ration pour g\00E9rer l''action DML demand\00E9e.')
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138771422903751236)
,p_name=>'WWV_FLOW_EXEC.RANGE_BUCKET.NOT.SUPPORTED'
,p_message_language=>'fr'
,p_message_text=>unistr('Les filtres de plage ne sont pris en charge que pour les types de donn\00E9es NUMBER, DATE et TIMESTAMP.')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138592325540751182)
,p_name=>'WWV_FLOW_EXEC.REST_REQUEST_ERROR'
,p_message_language=>'fr'
,p_message_text=>'Echec de la demande avec %0'
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138595805959751183)
,p_name=>'WWV_FLOW_EXEC.SPATIAL_JSON_NOT_AVAILABLE'
,p_message_language=>'fr'
,p_message_text=>unistr('La conversion de GeoJSON en SDO_GEOMETRY (colonne %0) n''est pas disponible dans cette base de donn\00E9es.')
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138599205580751184)
,p_name=>'WWV_FLOW_EXEC.SPATIAL_NOT_SUPPORTED_FOR_XML'
,p_message_language=>'fr'
,p_message_text=>unistr('La conversion SDO_GEOMETRY (colonne %0) n''est pas prise en charge pour les sources de donn\00E9es XML.')
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138623377408751192)
,p_name=>'WWV_FLOW_EXEC.UNSUPPPORTED_MULTI_VALUE_SEPARATOR'
,p_message_language=>'fr'
,p_message_text=>unistr('Le caract\00E8re %0 n''est pas pris en charge en tant que s\00E9parateur multivaleur.')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138771582766751236)
,p_name=>'WWV_FLOW_EXEC.WRONG_CONTEXT_TYPE'
,p_message_language=>'fr'
,p_message_text=>unistr('Cette fonction ne peut pas \00EAtre utilis\00E9e dans un contexte de requ\00EAte.')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138599345706751184)
,p_name=>'WWV_FLOW_EXEC_API.INVALID_DATA_TYPE'
,p_message_language=>'fr'
,p_message_text=>unistr('Non-concordance du type de donn\00E9es de colonne.')
,p_version_scn=>2704754
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138632899543751194)
,p_name=>'WWV_FLOW_EXEC_DOC_SRC.REMOTE_MULTI_ROW_DML_NOT_SUPPORTED_WITHOUT_JSON_BINDS'
,p_message_language=>'fr'
,p_message_text=>unistr('Cette source de donn\00E9es ne prend pas en charge la modification de plusieurs lignes.')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138612295025751188)
,p_name=>'WWV_FLOW_EXEC_REMOTE.ORDS_OUT_BIND_LIMIT_EXCEEDED'
,p_message_language=>'fr'
,p_message_text=>unistr('Limites de variable attach\00E9e ORDS OUT internes d\00E9pass\00E9es. R\00E9duisez le nombre de lignes DML.')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138714930304751219)
,p_name=>'WWV_FLOW_EXEC_REMOTE.RESPONSE_PARSING_ERROR'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Impossible d''analyser la r\00E9ponse JSON du serveur distant : '),
'%0'))
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138612106274751188)
,p_name=>'WWV_FLOW_EXEC_REMOTE.RUN_PLSQL_ERR'
,p_message_language=>'fr'
,p_message_text=>'Type de contexte incorrect ou inconnu.'
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138636216025751195)
,p_name=>'WWV_FLOW_EXPORT_INT.UNSUPPORTED_READABLE_EXPORT'
,p_message_language=>'fr'
,p_message_text=>'Composants non pris en charge pour l''export lisible : %0'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138734205566751225)
,p_name=>'WWV_FLOW_FILE_PARSER.UNKNOWN_FILE_TYPE'
,p_message_language=>'fr'
,p_message_text=>'Ce type de fichier n''est pas pris en charge par l''analyseur.'
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138685046910751210)
,p_name=>'WWV_FLOW_FND_DEVELOPER_API.CREDENTIALS_ERR'
,p_message_language=>'fr'
,p_message_text=>unistr('Acc\00E8s non autoris\00E9 (wwv_flow_api.set_credentials non d\00E9fini).')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138659913033751202)
,p_name=>'WWV_FLOW_FND_USER_API.CREATE_COMPANY'
,p_message_language=>'fr'
,p_message_text=>unistr('L''espace de travail n''a pas \00E9t\00E9 cr\00E9\00E9 car il existe d\00E9j\00E0.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138659882531751202)
,p_name=>'WWV_FLOW_FND_USER_API.CREATE_USER_GROUP'
,p_message_language=>'fr'
,p_message_text=>unistr('Le groupe d''utilisateurs n''a pas \00E9t\00E9 cr\00E9\00E9 car il existe d\00E9j\00E0.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138671266081751206)
,p_name=>'WWV_FLOW_FND_USER_API.DUP_USER'
,p_message_language=>'fr'
,p_message_text=>'Nom utilisateur en double pour %0.'
,p_version_scn=>2704763
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138671341651751206)
,p_name=>'WWV_FLOW_FND_USER_API.LOAD_ERR'
,p_message_language=>'fr'
,p_message_text=>'Erreur lors du chargement des utilisateurs. Echec pour l''utilisateur %0.'
,p_version_scn=>2704763
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138682167067751209)
,p_name=>'WWV_FLOW_FND_USER_API.T_MESSAGE'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 utilisateurs auraient \00E9t\00E9 charg\00E9s.')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138681936901751209)
,p_name=>'WWV_FLOW_FND_USER_API.T_PASSWORD'
,p_message_language=>'fr'
,p_message_text=>'Mot de passe'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138682095956751209)
,p_name=>'WWV_FLOW_FND_USER_API.T_PRIVILEGE'
,p_message_language=>'fr'
,p_message_text=>unistr('Privil\00E8ges')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138681748430751209)
,p_name=>'WWV_FLOW_FND_USER_API.T_USERNAME'
,p_message_language=>'fr'
,p_message_text=>'Nom utilisateur'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138762119178751233)
,p_name=>'WWV_FLOW_FORM.UNHANDLED_ERROR'
,p_message_language=>'fr'
,p_message_text=>unistr('Erreur lors de l''affichage de l''\00E9l\00E9ment de page "#COMPONENT_NAME#".')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138677132211751207)
,p_name=>'WWV_FLOW_FORMS.FORM_NOT_OPEN_ERR'
,p_message_language=>'fr'
,p_message_text=>unistr('Impossible d''afficher l''\00E9l\00E9ment de page car le panneau HTML n''\00E9tait pas encore ouvert.')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138635575856751195)
,p_name=>'WWV_FLOW_FORMS.ITEM_DEFAULT_ERR'
,p_message_language=>'fr'
,p_message_text=>unistr('Erreur lors du calcul de la valeur par d\00E9faut de l''\00E9l\00E9ment de page #COMPONENT_NAME#.')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138676481064751207)
,p_name=>'WWV_FLOW_FORMS.ITEM_POST_CALC_ERR'
,p_message_language=>'fr'
,p_message_text=>unistr('Erreur lors du post-calcul de l''\00E9l\00E9ment de page #COMPONENT_NAME#.')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138676362550751207)
,p_name=>'WWV_FLOW_FORMS.ITEM_SOURCE_ERR'
,p_message_language=>'fr'
,p_message_text=>unistr('Erreur lors du calcul de la valeur source de l''\00E9l\00E9ment de page #COMPONENT_NAME#.')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138653168403751200)
,p_name=>'WWV_FLOW_HELP.UNAUTHORIZED'
,p_message_language=>'fr'
,p_message_text=>unistr('Acc\00E8s non autoris\00E9.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138602668905751185)
,p_name=>'WWV_FLOW_INTERACTIVE_GRID.INVALID_JSON_ARRAY'
,p_message_language=>'fr'
,p_message_text=>'La valeur %0 de %1 n''est pas un tableau JSON valide.'
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138676626575751207)
,p_name=>'WWV_FLOW_ITEM.JS_NOT_SUPPORTED'
,p_message_language=>'fr'
,p_message_text=>'JavaScript non pris en charge'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138676778540751207)
,p_name=>'WWV_FLOW_ITEM.LIST'
,p_message_language=>'fr'
,p_message_text=>'Liste'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138677324273751208)
,p_name=>'WWV_FLOW_ITEM.UNABLE_INIT_QUERY'
,p_message_language=>'fr'
,p_message_text=>unistr('Impossible d''initialiser la requ\00EAte.')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138685358397751210)
,p_name=>'WWV_FLOW_ITEM.UPDATE_NOT_SUPPORTED_ERR'
,p_message_language=>'fr'
,p_message_text=>unistr('La mise \00E0 jour de %0 n''est pas admise.')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138678880033751208)
,p_name=>'WWV_FLOW_ITEM_HELP.INVALID_ITEM_ERR'
,p_message_language=>'fr'
,p_message_text=>unistr('ID d''\00E9l\00E9ment non valide : %0 ')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138706513678751216)
,p_name=>'WWV_FLOW_ITEM_HELP.NO_HELP_EXISTS'
,p_message_language=>'fr'
,p_message_text=>unistr('Il n''y a pas d''aide pour cet \00E9l\00E9ment.')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138668306190751205)
,p_name=>'WWV_FLOW_JET_CHART.QUERY_GENERATION_FAILED'
,p_message_language=>'fr'
,p_message_text=>unistr('Echec de la g\00E9n\00E9ration de la requ\00EAte de graphique. V\00E9rifiez les param\00E8tres Source et Mapping de colonne.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138669650225751205)
,p_name=>'WWV_FLOW_MAIL.ADD_ATTACHMENT.INVALID_MAIL_ID'
,p_message_language=>'fr'
,p_message_text=>unistr('Valeur non valide pour le param\00E8tre p_mail_id : %0')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138706371414751216)
,p_name=>'WWV_FLOW_MAIL.CANNOT_USE_TO_OR_REPLYTO_AS_FROM'
,p_message_language=>'fr'
,p_message_text=>unistr('Impossible d''utiliser "A" ou "R\00E9pondre \00E0" en tant qu''adresse d''exp\00E9dition en raison de la pr\00E9sence de plusieurs adresses \00E9lectroniques.')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138791229254751242)
,p_name=>'WWV_FLOW_MAIL.EMAIL_LIMIT_EXCEEDED'
,p_message_language=>'fr'
,p_message_text=>unistr('Vous avez d\00E9pass\00E9 le nombre maximal de messages \00E9lectroniques par espace de travail. Contactez l''administrateur.')
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138647862132751199)
,p_name=>'WWV_FLOW_MAIL.INVALID_CONTEXT'
,p_message_language=>'fr'
,p_message_text=>unistr('Cette proc\00E9dure doit \00EAtre appel\00E9e \00E0 partir d''une session d''application.')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138669597388751205)
,p_name=>'WWV_FLOW_MAIL.PARAMETER_NULL'
,p_message_language=>'fr'
,p_message_text=>unistr('Valeur NULL fournie pour le param\00E8tre %0.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138727688158751223)
,p_name=>'WWV_FLOW_MAIL.PREPARE_TEMPLATE.NO_DATA_FOUND'
,p_message_language=>'fr'
,p_message_text=>unistr('Mod\00E8le de courriel "%0" introuvable dans l''application %1.')
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138804133369751245)
,p_name=>'WWV_FLOW_MAIL.SMTP_HOST_ADDRESS_REQUIRED'
,p_message_language=>'fr'
,p_message_text=>unistr('Le param\00E8tre d''instance SMTP_HOST_ADDRESS doit \00EAtre d\00E9fini de fa\00E7on \00E0 envoyer des courriels.')
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138668929886751205)
,p_name=>'WWV_FLOW_MAIL.TO_IS_REQUIRED'
,p_message_language=>'fr'
,p_message_text=>'Vous devez indiquer un destinataire de courriel.'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138793698111751242)
,p_name=>'WWV_FLOW_MAIL.UNABLE_TO_OPEN_SMTP_CONNECTION'
,p_message_language=>'fr'
,p_message_text=>unistr('Impossible d''\00E9tablir une connexion SMTP avec le serveur de messagerie configur\00E9.')
,p_version_scn=>2704785
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138768954487751235)
,p_name=>'WWV_FLOW_PLUGIN.INVALID_AJAX_CALL'
,p_message_language=>'fr'
,p_message_text=>'Appel AJAX non valide.'
,p_version_scn=>2704782
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138652894500751200)
,p_name=>'WWV_FLOW_PLUGIN.NO_AJAX_FUNCTION'
,p_message_language=>'fr'
,p_message_text=>unistr('Aucune fonction AJAX n''a \00E9t\00E9 d\00E9finie pour le module d''extension %0')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138759426341751232)
,p_name=>'WWV_FLOW_PLUGIN.NO_EXECUTION_FUNCTION'
,p_message_language=>'fr'
,p_message_text=>unistr('Aucune fonction d''ex\00E9cution n''a \00E9t\00E9 d\00E9finie pour le module d''extension %0')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138652995245751200)
,p_name=>'WWV_FLOW_PLUGIN.NO_RENDER_FUNCTION'
,p_message_language=>'fr'
,p_message_text=>unistr('Aucune fonction d''affichage n''a \00E9t\00E9 d\00E9finie pour le module d''extension %0')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138769833793751235)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_CAPABILITIES_FUNCTION'
,p_message_language=>'fr'
,p_message_text=>unistr('Le module d''extension Source de donn\00E9es REST "%0" ne contient pas de fonction de type Fonctionnalit\00E9s.')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138769751108751235)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_DML_FUNCTION'
,p_message_language=>'fr'
,p_message_text=>unistr('Le module d''extension Source de donn\00E9es REST "%0" ne contient pas de fonction DML.')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138769920917751235)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_EXECUTE_FUNCTION'
,p_message_language=>'fr'
,p_message_text=>unistr('Le module d''extension Source de donn\00E9es REST "%0" ne contient pas de fonction d''ex\00E9cution.')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138770089911751235)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_FETCH_FUNCTION'
,p_message_language=>'fr'
,p_message_text=>unistr('Le module d''extension Source de donn\00E9es REST "%0" ne contient pas de fonction d''extraction.')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138650338781751200)
,p_name=>'WWV_FLOW_PLUGIN.RUN_PLSQL_ERR'
,p_message_language=>'fr'
,p_message_text=>unistr('Erreur de code PL/SQL g\00E9n\00E9r\00E9e lors du traitement du module d''extension.')
,p_version_scn=>2704761
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138658931446751202)
,p_name=>'WWV_FLOW_PLUGIN_DEV.IS_REQUIRED'
,p_message_language=>'fr'
,p_message_text=>unistr('La valeur doit \00EAtre indiqu\00E9e.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138691987514751212)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.CANT_CONVERT_TO_VARCHAR2'
,p_message_language=>'fr'
,p_message_text=>unistr('Impossible de convertir le type de donn\00E9es %0 en VARCHAR2.')
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138780194868751238)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.COLUMN_NOT_FOUND'
,p_message_language=>'fr'
,p_message_text=>unistr('La colonne "%0" indiqu\00E9e pour l''attribut "%1" est introuvable dans l''instruction SQL.')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138607474897751187)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.INVALID_JSON_ARRAY'
,p_message_language=>'fr'
,p_message_text=>'La valeur %0 de %1 n''est pas un tableau JSON valide.'
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138757302311751231)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.LOV_REQUIRED'
,p_message_language=>'fr'
,p_message_text=>unistr('Une requ\00EAte de liste de valeurs (LOV) ou une liste de valeurs (LOV) nomm\00E9e doit \00EAtre indiqu\00E9e pour %0.')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138758935680751232)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.LOV_SQL_WRONG_COLUMN_COUNT'
,p_message_language=>'fr'
,p_message_text=>unistr('Le nombre de colonnes s\00E9lectionn\00E9es est incorrect dans la requ\00EAte SQL de liste de valeurs (LOV) pour %0. Reportez-vous aux exemples pour conna\00EEtre les instructions valides.')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138779950599751238)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.NO_COLUMN_FOR_ATTRIBUTE'
,p_message_language=>'fr'
,p_message_text=>unistr('Aucune colonne indiqu\00E9e pour l''attribut "%0".')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138809189591751247)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.NUMBER_ATTRIBUTE_VALUE_INVALID'
,p_message_language=>'fr'
,p_message_text=>unistr('La valeur saisie %0 pour l''attribut "%1" n''est pas num\00E9rique.')
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138762462109751233)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.SQL_WRONG_DATA_TYPE'
,p_message_language=>'fr'
,p_message_text=>unistr('%0 contient un type de donn\00E9es incorrect dans l''instruction SQL. Le num\00E9ro de colonne %1 est de type %2 alors que %3 est attendu.')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138780031717751238)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.WRONG_COLUMN_DATA_TYPE'
,p_message_language=>'fr'
,p_message_text=>unistr('La colonne "%0" indiqu\00E9e pour l''attribut "%1" poss\00E8de le type de donn\00E9es %2 alors qu''elle doit poss\00E9der le type %3.')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138649546235751199)
,p_name=>'WWV_FLOW_PRINT_UTIL.REPORT_LAYOUT_NOT_FOUND'
,p_message_language=>'fr'
,p_message_text=>'La mise en page du rapport est introuvable.'
,p_version_scn=>2704761
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138637130366751196)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTIONS_LIMIT_EXCEEDED'
,p_message_language=>'fr'
,p_message_text=>unistr('La limite d''ex\00E9cutions en arri\00E8re-plan a \00E9t\00E9 d\00E9pass\00E9e pour %0.')
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138587441044751181)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTION_ALREADY_RUNNING'
,p_message_language=>'fr'
,p_message_text=>unistr('Une autre ex\00E9cution de %0 est d\00E9j\00E0 en cours.')
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138587383108751181)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTION_ALREADY_RUNNING_CTX'
,p_message_language=>'fr'
,p_message_text=>unistr('Une autre ex\00E9cution de %0 est d\00E9j\00E0 en cours pour le contexte %1.')
,p_version_scn=>2704751
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138602314509751185)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.FILES_NOT_VISIBLE_IN_WORKING_SESSION'
,p_message_language=>'fr'
,p_message_text=>unistr('Les fichiers t\00E9l\00E9charg\00E9s ne sont pas visibles dans la session active pour l''ex\00E9cution de %0.')
,p_version_scn=>2704755
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138714890918751219)
,p_name=>'WWV_FLOW_RENDER_REPORT3.COMPUTE_SUM_NOT_SUPPORTED_FOR_WEB_SOURCES'
,p_message_language=>'fr'
,p_message_text=>unistr('La fonctionnalit\00E9 Calculer la somme ne peut pas \00EAtre utilis\00E9e pour des \00E9tats reposant sur une source de donn\00E9es REST.')
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138676573937751207)
,p_name=>'WWV_FLOW_RENDER_SHORTCUT.UNABLE_SET_SHORT_VAL_ERR'
,p_message_language=>'fr'
,p_message_text=>unistr('ERR-2904 Impossible de d\00E9finir la valeur de raccourci.')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138681528147751209)
,p_name=>'WWV_FLOW_RENDER_SHORTCUT.UNKNOWN_TYPE_ERR'
,p_message_language=>'fr'
,p_message_text=>'Erreur : type de raccourci inconnu.'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138619254367751190)
,p_name=>'WWV_FLOW_SEARCH_API.TEXT_QUERY_TOO_LONG'
,p_message_language=>'fr'
,p_message_text=>unistr('La requ\00EAte de recherche est trop longue.')
,p_version_scn=>2704758
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138670653421751206)
,p_name=>'WWV_FLOW_SECURITY.AUTH_SCHEME_FETCH_ERR'
,p_message_language=>'fr'
,p_message_text=>'Impossible d''extraire authentication_scheme dans l''application %0.'
,p_version_scn=>2704763
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138678691104751208)
,p_name=>'WWV_FLOW_SECURITY.COMPONENT_FETCH_ERR'
,p_message_language=>'fr'
,p_message_text=>'Impossible d''extraire le composant %0.'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138748921761751229)
,p_name=>'WWV_FLOW_SESSION_API.TENANT_ID_EXISTS'
,p_message_language=>'fr'
,p_message_text=>unistr('L''ID de location existe d\00E9j\00E0 pour la session en cours.')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138681879576751209)
,p_name=>'WWV_FLOW_USER_API.T_EMAIL'
,p_message_language=>'fr'
,p_message_text=>unistr('Adresse \00E9lectronique')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138808657134751247)
,p_name=>'WWV_FLOW_WEB_SERVICES.AUTHENTICATION_FAILED'
,p_message_language=>'fr'
,p_message_text=>'Echec de l''authentification.'
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138709295265751217)
,p_name=>'WWV_FLOW_WEB_SERVICES.COOKIE_INVALID'
,p_message_language=>'fr'
,p_message_text=>unistr('Au moins un cookie d\00E9fini dans apex_util.g_request_cookies contient une valeur non valide.')
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138691147506751212)
,p_name=>'WWV_FLOW_WEB_SERVICES.INVALID_UDDI_RESPONSE'
,p_message_language=>'fr'
,p_message_text=>unistr('La r\00E9ponse du registre UDDI n''\00E9tait pas valide.')
,p_version_scn=>2704768
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138650415862751200)
,p_name=>'WWV_FLOW_WEB_SERVICES.INVALID_WSDL'
,p_message_language=>'fr'
,p_message_text=>unistr('L''URL indiqu\00E9e n''a pas renvoy\00E9 de document WSDL valide.')
,p_version_scn=>2704761
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138653246682751200)
,p_name=>'WWV_FLOW_WEB_SERVICES.MULTIPLE_SOAP'
,p_message_language=>'fr'
,p_message_text=>unistr('Le document WSDL contient plusieurs liaisons SOAP. &PRODUCT_NAME. ne prend en charge que les documents WSDL n''ayant qu''une seule liaison SOAP. Cliquez sur Cr\00E9er manuellement une r\00E9f\00E9rence de service Web pour continuer la cr\00E9ation d''une r\00E9f\00E9rence pour')
||' ce service.'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138728844360751223)
,p_name=>'WWV_FLOW_WEB_SERVICES.NOT_XML'
,p_message_language=>'fr'
,p_message_text=>unistr('La r\00E9ponse du service n''\00E9tait pas au format XML.')
,p_version_scn=>2704776
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138808558124751247)
,p_name=>'WWV_FLOW_WEB_SERVICES.NO_VALID_OAUTH_TOKEN'
,p_message_language=>'fr'
,p_message_text=>unistr('Le token d''acc\00E8s OAuth n''est pas disponible ou a expir\00E9.')
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138773096351751236)
,p_name=>'WWV_FLOW_WEB_SERVICES.REQUEST_LIMIT_EXCEEDED'
,p_message_language=>'fr'
,p_message_text=>unistr('Vous avez d\00E9pass\00E9 le nombre maximal de demandes de service Web par espace de travail. Contactez l''administrateur.')
,p_version_scn=>2704784
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138808701269751247)
,p_name=>'WWV_FLOW_WEB_SERVICES.UNSUPPORTED_OAUTH_TOKEN'
,p_message_language=>'fr'
,p_message_text=>unistr('Le serveur a r\00E9pondu avec un type de token OAuth non pris en charge.')
,p_version_scn=>2704790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138652603564751200)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_NO_SOAP'
,p_message_language=>'fr'
,p_message_text=>unistr('Le document WSDL ne contient pas de liaison pour SOAP ; elle est requise pour l''ajout de la r\00E9f\00E9rence.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138648029592751199)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_REQUIRES_AUTH'
,p_message_language=>'fr'
,p_message_text=>'Ce WSDL exige des informations d''authentification. Indiquez le nom utilisateur et le mot de passe ci-dessous.'
,p_version_scn=>2704759
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138659067639751202)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_UNHANDLED'
,p_message_language=>'fr'
,p_message_text=>unistr('Le moteur d''affichage n''a pas r\00E9ussi \00E0 interpr\00E9ter le document WSDL. Cliquez sur Cr\00E9er manuellement une r\00E9f\00E9rence de service Web pour continuer la cr\00E9ation d''une r\00E9f\00E9rence pour ce service.')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138731820704751224)
,p_name=>'WWV_FLOW_WIZARD_API.UPDATE_ERROR'
,p_message_language=>'fr'
,p_message_text=>unistr('Impossible de traiter la mise \00E0 jour.')
,p_version_scn=>2704777
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138757660283751232)
,p_name=>'WWV_FLOW_WORKSHEET.LOV_DISPLAY_AND_RETURN_COLUMN_EQUAL'
,p_message_language=>'fr'
,p_message_text=>unistr('La colonne d''affichage et renvoy\00E9e de la liste de valeurs (LOV) sont identiques.')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138757549665751232)
,p_name=>'WWV_FLOW_WORKSHEET.LOV_NO_RETURN_COLUMN'
,p_message_language=>'fr'
,p_message_text=>unistr('La liste de valeurs (LOV) ne comporte aucune colonne renvoy\00E9e.')
,p_version_scn=>2704781
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138685259064751210)
,p_name=>'WWV_RENDER_REPORT3.COLUMN_VALUE_ERR'
,p_message_language=>'fr'
,p_message_text=>'Erreur lors de l''extraction de la valeur de colonne : %0'
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138710127251751217)
,p_name=>'WWV_RENDER_REPORT3.DATA_TOO_OLD'
,p_message_language=>'fr'
,p_message_text=>unistr('Les donn\00E9es de panneau tabulaire en cours sont trop anciennes ; les donn\00E9es source ont \00E9t\00E9 modifi\00E9es.<br/> Cliquez <strong><a href="%0">ici</a></strong> pour annuler vos modifications et recharger les donn\00E9es \00E0 partir de la base de donn\00E9es.')
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138665313384751204)
,p_name=>'WWV_RENDER_REPORT3.ERR_DETERMINE_PAGINATION'
,p_message_language=>'fr'
,p_message_text=>unistr('Erreur lors de la d\00E9termination de la cha\00EEne de pagination')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138665237548751204)
,p_name=>'WWV_RENDER_REPORT3.ERR_DETERMINE_QUERY_HEADINGS'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('impossible de d\00E9terminer les en-t\00EAtes de requ\00EAte :'),
'%0'))
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138665479322751204)
,p_name=>'WWV_RENDER_REPORT3.ERR_REPORT_FOOTER'
,p_message_language=>'fr'
,p_message_text=>unistr('erreur lors des remplacements de pied d''\00E9tat')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138665597690751204)
,p_name=>'WWV_RENDER_REPORT3.FAILED_PARSING_QUERY'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\00E9chec de l''analyse de la requ\00EAte SQL :'),
'%0',
'%1'))
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138671686489751206)
,p_name=>'WWV_RENDER_REPORT3.FOUND_BUT_NOT_DISPLAYED'
,p_message_language=>'fr'
,p_message_text=>unistr('Nombre minimum de lignes demand\00E9 : %0, lignes trouv\00E9es mais non affich\00E9es : %1')
,p_version_scn=>2704763
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138668084521751205)
,p_name=>'WWV_RENDER_REPORT3.HTML_USE_COLUMN_ALIAS'
,p_message_language=>'fr'
,p_message_text=>unistr('la colonne de requ\00EAte #%0 (%1) n''est pas valide ; les colonnes utilisant le HTML doivent avoir des alias')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138685125160751210)
,p_name=>'WWV_RENDER_REPORT3.QUERY_HEADING_ERR'
,p_message_language=>'fr'
,p_message_text=>unistr('Erreur lors de l''obtention des en-t\00EAtes de requ\00EAte : %0')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138665688708751204)
,p_name=>'WWV_RENDER_REPORT3.REPORT_ERROR'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('erreur d''\00E9tat :'),
'%0'))
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138705799230751216)
,p_name=>'WWV_RENDER_REPORT3.SORT_BY_THIS_COLUMN'
,p_message_language=>'fr'
,p_message_text=>'Trier sur cette colonne'
,p_version_scn=>2704769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138668131988751205)
,p_name=>'WWV_RENDER_REPORT3.SYNTAX_ERROR'
,p_message_language=>'fr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>La requ\00EAte ne peut pas \00EAtre analys\00E9e, v\00E9rifiez-en la syntaxe.'),
'(%0)',
'</p>'))
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138710235296751217)
,p_name=>'WWV_RENDER_REPORT3.UNSAVED_DATA'
,p_message_language=>'fr'
,p_message_text=>unistr('Ce panneau contient des modifications non enregistr\00E9es. Cliquez sur OK pour continuer sans enregistrer vos modifications. ')
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138714701919751219)
,p_name=>'WWV_RENDER_REPORT3.UNSUPPORTED_PAGINATION_SCHEME'
,p_message_language=>'fr'
,p_message_text=>unistr('Le mod\00E8le de pagination d''\00E9tat (%0) n''est pas pris en charge avec la source de donn\00E9es choisie.')
,p_version_scn=>2704771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138667962184751205)
,p_name=>'WWV_RENDER_REPORT3.USE_COLUMN_ALIAS'
,p_message_language=>'fr'
,p_message_text=>unistr('la colonne de requ\00EAte #%0 (%1) n''est pas valide, utilisez l''alias de colonne')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138671738939751206)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_MORE_THAN_Z'
,p_message_language=>'fr'
,p_message_text=>'ligne(s) %0 - %1 de plus de %2'
,p_version_scn=>2704763
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138712257804751218)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_MORE_THAN_Z_2'
,p_message_language=>'fr'
,p_message_text=>'%0 - %1 de plus que %2'
,p_version_scn=>2704770
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138671584446751206)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z'
,p_message_language=>'fr'
,p_message_text=>'ligne(s) %0 - %1 sur %2'
,p_version_scn=>2704763
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138652371578751200)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z_2'
,p_message_language=>'fr'
,p_message_text=>'%0 - %1 sur %2'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138665741456751204)
,p_name=>'Y'
,p_message_language=>'fr'
,p_message_text=>'O'
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138673012274751206)
,p_name=>'YEAR'
,p_message_language=>'fr'
,p_message_text=>unistr('ann\00E9e')
,p_version_scn=>2704765
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138664956589751204)
,p_name=>'YEARS'
,p_message_language=>'fr'
,p_message_text=>unistr('ann\00E9es')
,p_version_scn=>2704762
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138710361911751217)
,p_name=>'YES'
,p_message_language=>'fr'
,p_message_text=>'Oui'
,p_version_scn=>2704770
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
 p_id=>wwv_flow_imp.id(109678305570583962.4472)
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
 p_id=>1.4472
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
