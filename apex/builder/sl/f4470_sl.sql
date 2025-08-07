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
,p_default_application_id=>4486
,p_default_id_offset=>0
,p_default_owner=>'APEX_240200'
);
end;
/
 
prompt APPLICATION 4486 - Oracle APEX Runtime Messages
--
-- Application Export:
--   Application:     4486
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
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'A144693393282761462')
,p_page_view_logging=>'YES'
,p_charset=>'utf-8'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt_last_reset=>'20250422180859'
,p_bookmark_checksum_function=>'SH1'
,p_compatibility_mode=>'24.2'
,p_session_state_commits=>'IMMEDIATE'
,p_flow_language=>'sl'
,p_flow_language_derived_from=>'SESSION'
,p_date_format=>'&DATE_FORMAT.'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(109678305570583962.4486)
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
 p_id=>wwv_flow_imp.id(4486)
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
 p_id=>wwv_flow_imp.id(728504220438374.4486)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SELECT_MANY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_values_as', 'separated')).to_clob
,p_version_scn=>7007816
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(736540203200530.4486)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_BOSS'
,p_version_scn=>243430877
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(800575880762576.4486)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'NATIVE_OPEN_AI_ASSISTANT'
,p_version_scn=>15457644
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2657043006125217.4486)
,p_plugin_type=>'PROCESS TYPE'
,p_plugin=>'NATIVE_GEOCODING'
,p_attribute_01=>'RELAX_HOUSE_NUMBER'
,p_version_scn=>117636987
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(110599941590099161.4486)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'default_icon', 'fa-star',
  'tooltip', '#VALUE#')).to_clob
,p_version_scn=>7007818
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(118481226255833028.4486)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_MAP_REGION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_vector_tile_layers', 'Y')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(123214098089478467.4486)
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
 p_id=>wwv_flow_imp.id(124389732573989299.4486)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_ADFBC'
,p_version_scn=>37165931336889
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(209516503264520988.4486)
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
 p_id=>wwv_flow_imp.id(285800719532138903.4486)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N')).to_clob
,p_version_scn=>7007823
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(649595203182764436.4486)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_style', 'SWITCH_CB',
  'off_value', 'N',
  'on_value', 'Y')).to_clob
,p_version_scn=>6539584
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1874744429444344138.4486)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'include_slider', 'N')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1941451863897626238.4486)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'actions_menu_structure', 'IG')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2027366558906572283.4486)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'mode', 'FULL')).to_clob
,p_version_scn=>7007824
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2120597162971751123.4486)
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
 p_id=>wwv_flow_imp.id(649613204592764515.4486)
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
 p_id=>wwv_flow_imp.id(850359229090693491.4486)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Wizard Dialog.sl'
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
 p_id=>wwv_flow_imp.id(293526110820992194.4486)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4486)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293526630547992195.4486)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4486)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293527171164992195.4486)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4486)
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
 p_id=>wwv_flow_imp.id(851037359784626333.4486)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Dialog.sl'
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
 p_id=>wwv_flow_imp.id(293473352245977306.4486)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4486)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293473882718977306.4486)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4486)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293474370844977307.4486)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4486)
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
 p_id=>wwv_flow_imp.id(851037631091626378.4486)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Edit Screen.sl'
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
 p_id=>wwv_flow_imp.id(2495515088702127.4486)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4486)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2496016567702127.4486)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4486)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2496522618702127.4486)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4486)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2497097895702127.4486)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4486)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2497562953702128.4486)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4486)
,p_name=>'Edit Screen Header'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2498085850702128.4486)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4486)
,p_name=>'Page Position 5'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2498553894702128.4486)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4486)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2499023066702128.4486)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4486)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2499516729702128.4486)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4486)
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
 p_id=>wwv_flow_imp.id(851039898661626389.4486)
,p_theme_id=>3
,p_name=>'APEX 5.0 - No Side Bar.sl'
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
 p_id=>wwv_flow_imp.id(2418665544706094.4486)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4486)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2419139140706094.4486)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4486)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2419660231706094.4486)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4486)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2420136000706094.4486)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4486)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2420617033706094.4486)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4486)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2421142368706094.4486)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4486)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2421629849706095.4486)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4486)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2422132460706095.4486)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4486)
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
 p_id=>wwv_flow_imp.id(851040471818626394.4486)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Right Side Bar.sl'
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
 p_id=>wwv_flow_imp.id(1537388880131854.4486)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4486)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1537880270131855.4486)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4486)
,p_name=>'Page Header (Position 3)'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1538315330131855.4486)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4486)
,p_name=>'Page Header (Position 4)'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1538840638131855.4486)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4486)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1539339441131855.4486)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4486)
,p_name=>'After Body'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1539830162131855.4486)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4486)
,p_name=>'Page Header (Position 1)'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1540338421131855.4486)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4486)
,p_name=>'Page Header (Position 2)'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1540832064131856.4486)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4486)
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
 p_id=>wwv_flow_imp.id(851041812938626395.4486)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Sign Up Wizard.sl'
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
 p_id=>wwv_flow_imp.id(115212309210289451.4486)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4486)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115212857712289451.4486)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4486)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115213340345289452.4486)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4486)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115213804331289452.4486)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4486)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115214317592289452.4486)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4486)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115214875819289453.4486)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4486)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115215325320289453.4486)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4486)
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
 p_id=>wwv_flow_imp.id(851042476105626395.4486)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Wizard Page.sl'
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
 p_id=>wwv_flow_imp.id(1485266589875353.4486)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4486)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1485734308875353.4486)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4486)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1486237142875354.4486)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4486)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1486735024875354.4486)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4486)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1487219028875354.4486)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4486)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1487770987875354.4486)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4486)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1488272041875354.4486)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4486)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1488725778875354.4486)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4486)
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
 p_id=>wwv_flow_imp.id(514381861202541059.4486)
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
 p_id=>wwv_flow_imp.id(514382190540541061.4486)
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
 p_id=>wwv_flow_imp.id(514382538845541061.4486)
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
 p_id=>wwv_flow_imp.id(620629666890811728.4486)
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
 p_id=>wwv_flow_imp.id(620629778318811745.4486)
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
 p_id=>wwv_flow_imp.id(868252865986181054.4486)
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
 p_id=>wwv_flow_imp.id(514338947870435171.4486)
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
 p_id=>wwv_flow_imp.id(2962385277500935.4486)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4486)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2962865718500935.4486)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4486)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2963338641500935.4486)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4486)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2963894582500935.4486)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4486)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2964329937500935.4486)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4486)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2964897214500936.4486)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4486)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2965324003500936.4486)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4486)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2965838011500936.4486)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4486)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2966328405500936.4486)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4486)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2966823859500936.4486)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4486)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2967325351500936.4486)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4486)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2967812485500936.4486)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4486)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2968377768500937.4486)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4486)
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
 p_id=>wwv_flow_imp.id(514343873675436760.4486)
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
 p_id=>wwv_flow_imp.id(32585474981747544.4486)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4486)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32585915750747544.4486)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4486)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32586471989747545.4486)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4486)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32586972270747545.4486)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4486)
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
 p_id=>wwv_flow_imp.id(771803843049318447.4486)
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
 p_id=>wwv_flow_imp.id(3207496127505978.4486)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4486)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3207907805505978.4486)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4486)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3208484941505978.4486)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4486)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3208991047505978.4486)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4486)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3209402462505979.4486)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4486)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3209972507505979.4486)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4486)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3210460159505979.4486)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4486)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3210935368505979.4486)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4486)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3211466566505979.4486)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4486)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3211956312505979.4486)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4486)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3212461962505979.4486)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4486)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3212966370505980.4486)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4486)
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
 p_id=>wwv_flow_imp.id(850406444708718383.4486)
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
 p_id=>wwv_flow_imp.id(2204663592232325.4486)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4486)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2205135519232325.4486)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4486)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2205694824232325.4486)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4486)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2206129075232325.4486)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4486)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2206618558232325.4486)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4486)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2207115910232326.4486)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4486)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2207688896232326.4486)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4486)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2208160700232326.4486)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4486)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2208614050232326.4486)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4486)
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
 p_id=>wwv_flow_imp.id(850442966147812557.4486)
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
 p_id=>wwv_flow_imp.id(3346988371508588.4486)
,p_plug_template_id=>wwv_flow_imp.id(850442966147812557.4486)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3347426198508588.4486)
,p_plug_template_id=>wwv_flow_imp.id(850442966147812557.4486)
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
 p_id=>wwv_flow_imp.id(856206049762521193.4486)
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
 p_id=>wwv_flow_imp.id(2526185270486606.4486)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4486)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2526610033486606.4486)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4486)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2527184084486606.4486)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4486)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2527626846486607.4486)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4486)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2528141078486607.4486)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4486)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2528637911486607.4486)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4486)
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
 p_id=>wwv_flow_imp.id(914802799655239969.4486)
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
 p_id=>wwv_flow_imp.id(88183211858816924.4486)
,p_plug_template_id=>wwv_flow_imp.id(914802799655239969.4486)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(88183732152816924.4486)
,p_plug_template_id=>wwv_flow_imp.id(914802799655239969.4486)
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
 p_id=>wwv_flow_imp.id(914803495164240003.4486)
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
 p_id=>wwv_flow_imp.id(3373447170510516.4486)
,p_plug_template_id=>wwv_flow_imp.id(914803495164240003.4486)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3373993086510516.4486)
,p_plug_template_id=>wwv_flow_imp.id(914803495164240003.4486)
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
 p_id=>wwv_flow_imp.id(915210356236972585.4486)
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
 p_id=>wwv_flow_imp.id(2899946654493378.4486)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4486)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2900442121493378.4486)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4486)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2900949359493378.4486)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4486)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2901467944493378.4486)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4486)
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
 p_id=>wwv_flow_imp.id(915371118115573423.4486)
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
 p_id=>wwv_flow_imp.id(2695578355491332.4486)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4486)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2696079816491332.4486)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4486)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2696558276491332.4486)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4486)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2697055726491332.4486)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4486)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2697581510491332.4486)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4486)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2698048732491333.4486)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4486)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2698576547491333.4486)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4486)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2699004772491333.4486)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4486)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2699557295491333.4486)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4486)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2700035673491333.4486)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4486)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2700500589491333.4486)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4486)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2701097053491333.4486)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4486)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2701554382491334.4486)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4486)
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
 p_id=>wwv_flow_imp.id(1274355059486017828.4486)
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
 p_id=>wwv_flow_imp.id(61232728057733462.4486)
,p_plug_template_id=>wwv_flow_imp.id(1274355059486017828.4486)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(61233207886733462.4486)
,p_plug_template_id=>wwv_flow_imp.id(1274355059486017828.4486)
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
 p_id=>wwv_flow_imp.id(514332014414430986.4486)
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
 p_id=>wwv_flow_imp.id(514332292784430987.4486)
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
 p_id=>wwv_flow_imp.id(860563697365629462.4486)
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
 p_id=>wwv_flow_imp.id(865273508717512144.4486)
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
 p_id=>wwv_flow_imp.id(908020362212234651.4486)
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
 p_id=>wwv_flow_imp.id(914818080687341593.4486)
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
 p_id=>wwv_flow_imp.id(851049711466639395.4486)
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
 p_id=>wwv_flow_imp.id(851054516889639461.4486)
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
 p_id=>wwv_flow_imp.id(851055225644639463.4486)
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
 p_id=>wwv_flow_imp.id(851056531929639482.4486)
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
 p_id=>wwv_flow_imp.id(914792024808213039.4486)
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
 p_id=>wwv_flow_imp.id(914792322768213043.4486)
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
 p_id=>wwv_flow_imp.id(915377874236666939.4486)
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
 p_id=>wwv_flow_imp.id(1041941432531249038.4486)
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
 p_id=>wwv_flow_imp.id(850683711614406253.4486)
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
 p_id=>wwv_flow_imp.id(851047536471633848.4486)
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
 p_id=>wwv_flow_imp.id(851047676005633854.4486)
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
 p_id=>wwv_flow_imp.id(851047684809633856.4486)
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
 p_id=>wwv_flow_imp.id(851047795461633856.4486)
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
 p_id=>wwv_flow_imp.id(860542631889572088.4486)
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
 p_id=>wwv_flow_imp.id(1321751941832424103.4486)
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
 p_id=>wwv_flow_imp.id(514333590213433126.4486)
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
 p_id=>wwv_flow_imp.id(649611704621764507.4486)
,p_page_name=>'winlov'
,p_page_title=>'Pogovorno okno za iskanje'
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
,p_find_button_text=>'Iskanje'
,p_find_button_attr=>'class="a-Button a-Button--hot a-Button--padLeft"'
,p_close_button_text=>'Zapri'
,p_close_button_attr=>'class="a-Button u-pullRight"'
,p_next_button_text=>'Naprej &gt;'
,p_next_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_prev_button_text=>'&lt; Nazaj'
,p_prev_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'380'
,p_height=>'480'
,p_result_row_x_of_y=>'<div class="a-PopupLOV-pagination">Vrstice #FIRST_ROW# - #LAST_ROW#</div>'
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
 p_id=>wwv_flow_imp.id(649611609668764506.4486)
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
 p_id=>wwv_flow_imp.id(182005134783173294.4486)
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
 p_id=>wwv_flow_imp.id(666074212329754757.4486)
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
 p_id=>wwv_flow_imp.id(666074525535755551.4486)
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
 p_id=>wwv_flow_imp.id(717250289307903026.4486)
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
 p_id=>wwv_flow_imp.id(2336377640986141.4486)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL'
,p_display_name=>'Heading Level'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(806925000765340952.4486)
,p_theme_id=>3
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default - No Icons'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808380142596819918.4486)
,p_theme_id=>3
,p_name=>'ALTERNATING_TABLE_ROWS'
,p_display_name=>'Alternating Table Rows'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Enable'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808380828683819918.4486)
,p_theme_id=>3
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Disable'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808381542095819918.4486)
,p_theme_id=>3
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default Border'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808383088145819924.4486)
,p_theme_id=>3
,p_name=>'REPORT_WIDTH'
,p_display_name=>'Report Width'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850406791580718389.4486)
,p_theme_id=>3
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850407096779718396.4486)
,p_theme_id=>3
,p_name=>'REGION_PADDING'
,p_display_name=>'Region Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Padding'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850407509193718398.4486)
,p_theme_id=>3
,p_name=>'REGION_STYLE'
,p_display_name=>'Region Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Style'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(851050160062639437.4486)
,p_theme_id=>3
,p_name=>'BADGE_LAYOUT'
,p_display_name=>'Badge Layout'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(851051045625639457.4486)
,p_theme_id=>3
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856113214217058023.4486)
,p_theme_id=>3
,p_name=>'HEIGHT'
,p_display_name=>'Height'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856114568019058024.4486)
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
 p_id=>wwv_flow_imp.id(856114830529058024.4486)
,p_theme_id=>3
,p_name=>'FORM_LABEL_WIDTH'
,p_display_name=>'Form Label Width'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856115135223058024.4486)
,p_theme_id=>3
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Not Part of Button Set'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116214022058024.4486)
,p_theme_id=>3
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>1
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116523282058024.4486)
,p_theme_id=>3
,p_name=>'FORM_LABEL_POSITION'
,p_display_name=>'Form Label Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116798725058025.4486)
,p_theme_id=>3
,p_name=>'BUTTON_SIZE'
,p_display_name=>'Button Size'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Button Size'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117102944058028.4486)
,p_theme_id=>3
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing left'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Left Spacing'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117454663058028.4486)
,p_theme_id=>3
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Right Spacing'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117908453058029.4486)
,p_theme_id=>3
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Icon on Right'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856118261810058029.4486)
,p_theme_id=>3
,p_name=>'BUTTON_TYPE'
,p_display_name=>'Button Type'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856206461450521195.4486)
,p_theme_id=>3
,p_name=>'ALERT_TYPE'
,p_display_name=>'Alert Type'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856206736628521198.4486)
,p_theme_id=>3
,p_name=>'DISPLAY'
,p_display_name=>'Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(860570508910721307.4486)
,p_theme_id=>3
,p_name=>'REGION_POSITION'
,p_display_name=>'Region Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(860571060920721309.4486)
,p_theme_id=>3
,p_name=>'REGION_OVERFLOW'
,p_display_name=>'Region Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(908020718209234676.4486)
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
 p_id=>wwv_flow_imp.id(1487577187426769.4486)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden to Assistive Tech'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4486)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4486)
,p_template_types=>'REGION'
,p_help_text=>'By default, region title is hidden but accessible, use this option to remove the header from accessible interface'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2336635141996782.4486)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H1'
,p_display_name=>'H1'
,p_display_sequence=>10
,p_css_classes=>'js-headingLevel-1'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4486)
,p_template_types=>'REGION'
,p_help_text=>'H1'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2336917964996782.4486)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H2'
,p_display_name=>'H2'
,p_display_sequence=>20
,p_css_classes=>'js-headingLevel-2'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4486)
,p_template_types=>'REGION'
,p_help_text=>'H2'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2337368425996782.4486)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H3'
,p_display_name=>'H3'
,p_display_sequence=>30
,p_css_classes=>'js-headingLevel-3'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4486)
,p_template_types=>'REGION'
,p_help_text=>'H3'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2337706283996782.4486)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H4'
,p_display_name=>'H4'
,p_display_sequence=>40
,p_css_classes=>'js-headingLevel-4'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4486)
,p_template_types=>'REGION'
,p_help_text=>'H4'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2338144805996782.4486)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H5'
,p_display_name=>'H5'
,p_display_sequence=>50
,p_css_classes=>'js-headingLevel-5'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4486)
,p_template_types=>'REGION'
,p_help_text=>'H5'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2338562059996782.4486)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H6'
,p_display_name=>'H6'
,p_display_sequence=>60
,p_css_classes=>'js-headingLevel-6'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4486)
,p_template_types=>'REGION'
,p_help_text=>'H6'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134384175764258.4486)
,p_theme_id=>3
,p_name=>'LARGELEFT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapLeft'
,p_group_id=>wwv_flow_imp.id(856117102944058028.4486)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134654971764258.4486)
,p_theme_id=>3
,p_name=>'LARGERIGHT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapRight'
,p_group_id=>wwv_flow_imp.id(856117454663058028.4486)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134823880764258.4486)
,p_theme_id=>3
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(856117908453058029.4486)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135009020764258.4486)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>3
,p_css_classes=>'a-Button--large'
,p_group_id=>wwv_flow_imp.id(856116798725058025.4486)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135269851764258.4486)
,p_theme_id=>3
,p_name=>'SMALLLEFT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padLeft'
,p_group_id=>wwv_flow_imp.id(856117102944058028.4486)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135477215764258.4486)
,p_theme_id=>3
,p_name=>'SMALLRIGHT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padRight'
,p_group_id=>wwv_flow_imp.id(856117454663058028.4486)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135634744764258.4486)
,p_theme_id=>3
,p_name=>'INNERBUTTON'
,p_display_name=>'Inner Button'
,p_display_sequence=>2
,p_css_classes=>'a-Button--pill'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4486)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135785730764258.4486)
,p_theme_id=>3
,p_name=>'LASTBUTTON'
,p_display_name=>'Last Button'
,p_display_sequence=>3
,p_css_classes=>'a-Button--pillEnd'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4486)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136068296764258.4486)
,p_theme_id=>3
,p_name=>'FIRSTBUTTON'
,p_display_name=>'First Button'
,p_display_sequence=>1
,p_css_classes=>'a-Button--pillStart'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4486)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136225140764258.4486)
,p_theme_id=>3
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>1
,p_css_classes=>'a-Button--primary'
,p_group_id=>wwv_flow_imp.id(856118261810058029.4486)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136360666764258.4486)
,p_theme_id=>3
,p_name=>'REGIONHEADERBUTTON'
,p_display_name=>'Button in Region Header'
,p_display_sequence=>1
,p_css_classes=>'a-Button--regionHeader'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136507481764259.4486)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--small'
,p_group_id=>wwv_flow_imp.id(856116798725058025.4486)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136620486764259.4486)
,p_theme_id=>3
,p_name=>'STRONGBUTTONLABEL'
,p_display_name=>'Strong Button Label'
,p_display_sequence=>1
,p_css_classes=>'a-Button--strongLabel'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136861925764259.4486)
,p_theme_id=>3
,p_name=>'AUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form--autoWidthLabels'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4486)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137023291764259.4486)
,p_theme_id=>3
,p_name=>'FIXEDWIDTH'
,p_display_name=>'Fixed'
,p_display_sequence=>10
,p_css_classes=>'a-Form--fixedLabels'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4486)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137193234764259.4486)
,p_theme_id=>3
,p_name=>'LABELSABOVE'
,p_display_name=>'Labels Above'
,p_display_sequence=>1
,p_css_classes=>'a-Form--labelsAbove'
,p_group_id=>wwv_flow_imp.id(856116523282058024.4486)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137470293764259.4486)
,p_theme_id=>3
,p_name=>'ALIGNLABELSLEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Form--leftLabels'
,p_group_id=>wwv_flow_imp.id(856114568019058024.4486)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137586003764259.4486)
,p_theme_id=>3
,p_name=>'LABELAUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--autoLabelWidth'
,p_group_id=>wwv_flow_imp.id(856116214022058024.4486)
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137737661764259.4486)
,p_theme_id=>3
,p_name=>'STRETCHFORMFIELD'
,p_display_name=>'Stretch Form Field'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--stretch'
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137933035764259.4486)
,p_theme_id=>3
,p_name=>'FIXEDLARGE'
,p_display_name=>'Fixed (Large Width)'
,p_display_sequence=>30
,p_css_classes=>'a-Form-fixedLabelsLarge'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4486)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138175863764259.4486)
,p_theme_id=>3
,p_name=>'FIXEDMEDIUM'
,p_display_name=>'Fixed (Medium Width)'
,p_display_sequence=>20
,p_css_classes=>'a-Form-fixedLabelsMed'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4486)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138340877764259.4486)
,p_theme_id=>3
,p_name=>'180PX'
,p_display_name=>'180px'
,p_display_sequence=>10
,p_css_classes=>'h180'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4486)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138553321764259.4486)
,p_theme_id=>3
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>20
,p_css_classes=>'h240'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4486)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138777457764259.4486)
,p_theme_id=>3
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>30
,p_css_classes=>'h320'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4486)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138891974764260.4486)
,p_theme_id=>3
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>50
,p_css_classes=>'h480'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4486)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857139153872764260.4486)
,p_theme_id=>3
,p_name=>'540PX'
,p_display_name=>'540px'
,p_display_sequence=>60
,p_css_classes=>'h540'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4486)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857139375337764260.4486)
,p_theme_id=>3
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>70
,p_css_classes=>'h640'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4486)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145206107768768.4486)
,p_theme_id=>3
,p_name=>'USE_COLORED_BACKGROUND'
,p_display_name=>'Use Colored Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4486)
,p_css_classes=>'a-Alert--colorBG'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145328630768768.4486)
,p_theme_id=>3
,p_name=>'USE_DEFAULT_ICONS'
,p_display_name=>'Use Default Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4486)
,p_css_classes=>'a-Alert--defaultIcons'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145505007768768.4486)
,p_theme_id=>3
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4486)
,p_css_classes=>'a-Alert--warning'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4486)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145725778768768.4486)
,p_theme_id=>3
,p_name=>'ERROR'
,p_display_name=>'Error'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4486)
,p_css_classes=>'a-Alert--danger'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4486)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145892117768768.4486)
,p_theme_id=>3
,p_name=>'INFORMATIONAL'
,p_display_name=>'Informational'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4486)
,p_css_classes=>'a-Alert--info'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4486)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146085228768768.4486)
,p_theme_id=>3
,p_name=>'HORIZONTAL'
,p_display_name=>'Horizontal'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4486)
,p_css_classes=>'a-Alert--horizontal'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4486)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146322225768769.4486)
,p_theme_id=>3
,p_name=>'WIZARD'
,p_display_name=>'Wizard'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4486)
,p_css_classes=>'a-Alert--wizard'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4486)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146393064768769.4486)
,p_theme_id=>3
,p_name=>'REMOVE_ICON'
,p_display_name=>'Remove Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4486)
,p_css_classes=>'a-Alert--noIcon'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146615368768769.4486)
,p_theme_id=>3
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4486)
,p_css_classes=>'a-Alert--success'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4486)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147042367768771.4486)
,p_theme_id=>3
,p_name=>'REGIONCONTAINSITEMSTEXT'
,p_display_name=>'Region Contains Items / Text'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4486)
,p_css_classes=>'a-ButtonRegion--withItems'
,p_template_types=>'REGION'
,p_help_text=>'Check this option if this region contains items or text.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147189725768771.4486)
,p_theme_id=>3
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4486)
,p_css_classes=>'a-ButtonRegion--noUI'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4486)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147385795768771.4486)
,p_theme_id=>3
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4486)
,p_css_classes=>'a-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4486)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147655668768771.4486)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4486)
,p_css_classes=>'a-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4486)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147872948768771.4486)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4486)
,p_css_classes=>'a-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4486)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147976018768771.4486)
,p_theme_id=>3
,p_name=>'WIZARDDIALOG'
,p_display_name=>'Used for Wizard Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4486)
,p_css_classes=>'a-ButtonRegion--wizard'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857148162424768771.4486)
,p_theme_id=>3
,p_name=>'VISIBLE'
,p_display_name=>'Visible'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4486)
,p_css_classes=>'a-ButtonRegion--showTitle'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4486)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857148341454768771.4486)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4486)
,p_css_classes=>'a-ButtonRegion--accessibleTitle'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4486)
,p_template_types=>'REGION'
,p_help_text=>'Use this option to add a visually hidden heading which is accessible for screen readers, but otherwise not visible to users.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149438708768778.4486)
,p_theme_id=>3
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4486)
,p_css_classes=>'a-BadgeList--float'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4486)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149614105768778.4486)
,p_theme_id=>3
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4486)
,p_css_classes=>'a-BadgeList--fixed'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4486)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149843563768778.4486)
,p_theme_id=>3
,p_name=>'STACKEDVERTICALLY'
,p_display_name=>'Stacked Vertically'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4486)
,p_css_classes=>'a-BadgeList--stacked'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4486)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149998210768778.4486)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'32px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4486)
,p_css_classes=>'a-BadgeList--small'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4486)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150194417768778.4486)
,p_theme_id=>3
,p_name=>'MEDIUM'
,p_display_name=>'48px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4486)
,p_css_classes=>'a-BadgeList--medium'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4486)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150439507768778.4486)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'64px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4486)
,p_css_classes=>'a-BadgeList--large'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4486)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150608654768780.4486)
,p_theme_id=>3
,p_name=>'XLARGE'
,p_display_name=>'96px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4486)
,p_css_classes=>'a-BadgeList--xlarge'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4486)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150792333768780.4486)
,p_theme_id=>3
,p_name=>'XXLARGE'
,p_display_name=>'128px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4486)
,p_css_classes=>'a-BadgeList--xxlarge'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4486)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151008734768780.4486)
,p_theme_id=>3
,p_name=>'2COLUMNNGRID'
,p_display_name=>'2 Columnn Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4486)
,p_css_classes=>'a-BadgeList--cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4486)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151259777768780.4486)
,p_theme_id=>3
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4486)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--3cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4486)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151408063768780.4486)
,p_theme_id=>3
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4486)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--4cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4486)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151643103768780.4486)
,p_theme_id=>3
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4486)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--5cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4486)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151861194768780.4486)
,p_theme_id=>3
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4486)
,p_css_classes=>'a-BadgeList--flex'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4486)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896798730495581814.4486)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4486)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(808380142596819918.4486)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896798963380581814.4486)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4486)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(808380828683819918.4486)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799089194581814.4486)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4486)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4486)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799349986581814.4486)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4486)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4486)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799577541581814.4486)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4486)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4486)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799637215581814.4486)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4486)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799807498581814.4486)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4486)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_imp.id(808383088145819924.4486)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022191342234716.4486)
,p_theme_id=>3
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4486)
,p_css_classes=>'a-MediaList--cols a-MediaList--2cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4486)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022392217234716.4486)
,p_theme_id=>3
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4486)
,p_css_classes=>'a-MediaList--cols a-MediaList--3cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4486)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022597980234716.4486)
,p_theme_id=>3
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4486)
,p_css_classes=>'a-MediaList--cols a-MediaList--4cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4486)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022867300234717.4486)
,p_theme_id=>3
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4486)
,p_css_classes=>'a-MediaList--cols a-MediaList--5cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4486)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023065592234717.4486)
,p_theme_id=>3
,p_name=>'SPANHORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4486)
,p_css_classes=>'a-MediaList--horizontal'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4486)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023131122234717.4486)
,p_theme_id=>3
,p_name=>'HIDEBADGE'
,p_display_name=>'Hide Badge'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4486)
,p_css_classes=>'a-MediaList--noBadge'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023191297234717.4486)
,p_theme_id=>3
,p_name=>'HIDEDESCRIPTION'
,p_display_name=>'Hide Description'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4486)
,p_css_classes=>'a-MediaList--noDesc'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023315038234717.4486)
,p_theme_id=>3
,p_name=>'HIDETITLE'
,p_display_name=>'Hide Title'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4486)
,p_css_classes=>'a-MediaList--noTitle'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023432264234717.4486)
,p_theme_id=>3
,p_name=>'HIDEICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4486)
,p_css_classes=>'a-MediaList--noIcons'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023494059234717.4486)
,p_theme_id=>3
,p_name=>'SLIMLIST'
,p_display_name=>'Slim List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4486)
,p_css_classes=>'a-MediaList--slim'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378094918666945.4486)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4486)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(808380142596819918.4486)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378225037666947.4486)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4486)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(808380828683819918.4486)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378370589666947.4486)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4486)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4486)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378467813666947.4486)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4486)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378526097666947.4486)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4486)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4486)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378615102666947.4486)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4486)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_imp.id(808383088145819924.4486)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378735377666947.4486)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4486)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4486)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1036071796325339624.4486)
,p_theme_id=>3
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(514332292784430987.4486)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1036071972285339624.4486)
,p_theme_id=>3
,p_name=>'ADD_SLIDE_ANIMATION'
,p_display_name=>'Add Slide Animation'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(514332292784430987.4486)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1050367122398973653.4486)
,p_theme_id=>3
,p_name=>'SLIMPROGRESSLIST'
,p_display_name=>'Slim Progress List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(865273508717512144.4486)
,p_css_classes=>'a-WizardSteps--slim'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1309233880682664517.4486)
,p_theme_id=>3
,p_name=>'LEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_button_template_id=>wwv_flow_imp.id(868252865986181054.4486)
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(856117908453058029.4486)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1351338307429029043.4486)
,p_theme_id=>3
,p_name=>'USED_IN_DIALOG'
,p_display_name=>'Used in Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1274355059486017828.4486)
,p_css_classes=>'a-ProcessingRegion--dialog'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333722717814196.4486)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4486)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333859287814196.4486)
,p_theme_id=>3
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4486)
,p_css_classes=>'a-LinksList--showBadge'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333887728814196.4486)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4486)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334039640814196.4486)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4486)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334247146814196.4486)
,p_theme_id=>3
,p_name=>'FORTOPLEVELONLY'
,p_display_name=>'For top level only'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4486)
,p_css_classes=>'a-LinksList--showTopIcons'
,p_group_id=>wwv_flow_imp.id(806925000765340952.4486)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334455135814196.4486)
,p_theme_id=>3
,p_name=>'FORALLITEMS'
,p_display_name=>'For all items'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4486)
,p_css_classes=>'a-LinksList--showIcons'
,p_group_id=>wwv_flow_imp.id(806925000765340952.4486)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491342397110118.4486)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4486)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491390428110118.4486)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4486)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491480011110118.4486)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4486)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664488722406040473.4486)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4486)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4486)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664488933681040473.4486)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4486)
,p_css_classes=>'a-Region--accessibleHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4486)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489165994040473.4486)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4486)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4486)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489304869040473.4486)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4486)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4486)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489519844040473.4486)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4486)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_imp.id(860570508910721307.4486)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489753255040473.4486)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4486)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4486)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489941797040473.4486)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4486)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4486)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490153471040473.4486)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4486)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4486)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490336091040473.4486)
,p_theme_id=>3
,p_name=>'DEFAULTPADDING'
,p_display_name=>'Default Padding'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4486)
,p_css_classes=>'a-Region--paddedBody'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4486)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490377667040473.4486)
,p_theme_id=>3
,p_name=>'REMOVE_TOP_BORDER'
,p_display_name=>'Remove Top Border'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4486)
,p_css_classes=>'a-Region--noTopBorder'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490659850040473.4486)
,p_theme_id=>3
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4486)
,p_css_classes=>'a-Region--simple'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4486)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664501980442158869.4486)
,p_theme_id=>3
,p_name=>'RESPONSIVEICONCOLUMNS'
,p_display_name=>'Responsive Icon Columns'
,p_display_sequence=>2
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4486)
,p_css_classes=>'a-IRR-region--responsiveIconView'
,p_template_types=>'REGION'
,p_help_text=>'Automatically increases number of icon columns to show based on screen resolution.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664502160891158869.4486)
,p_theme_id=>3
,p_name=>'ICONLABELSRIGHT'
,p_display_name=>'Icon Labels on Right'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4486)
,p_css_classes=>'a-IRR-region--iconLabelsRight'
,p_template_types=>'REGION'
,p_help_text=>'Shows labels in Icon View to the right of the icon.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664502181188158869.4486)
,p_theme_id=>3
,p_name=>'REMOVEOUTERBORDERS'
,p_display_name=>'Remove Outer Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4486)
,p_css_classes=>'a-IRR-region--noOuterBorders'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508367504174332.4486)
,p_theme_id=>3
,p_name=>'FLUSHREGION'
,p_display_name=>'Flush Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4486)
,p_css_classes=>'a-Region--flush'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508426350174332.4486)
,p_theme_id=>3
,p_name=>'STACKEDREGION'
,p_display_name=>'Stacked Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4486)
,p_css_classes=>'a-Region--stacked'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508588305174332.4486)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4486)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4486)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508810521174332.4486)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4486)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4486)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509005841174332.4486)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4486)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_imp.id(860570508910721307.4486)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509270186174332.4486)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4486)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4486)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509448573174333.4486)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4486)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4486)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509659839174333.4486)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4486)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4486)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509822387174334.4486)
,p_theme_id=>3
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>.1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4486)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4486)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664510028962174334.4486)
,p_theme_id=>3
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4486)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4486)
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
 p_id=>wwv_flow_imp.id(142504006272752404)
,p_name=>'4150_COLUMN_NUMBER'
,p_message_language=>'sl'
,p_message_text=>'Stolpec %0'
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142488633895752400)
,p_name=>'ACCESS_CONTROL_ADMIN'
,p_message_language=>'sl'
,p_message_text=>'Skrbnik'
,p_version_scn=>2705521
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142488597136752400)
,p_name=>'ACCESS_CONTROL_USERNAME'
,p_message_language=>'sl'
,p_message_text=>unistr('Uporabni\0161ko ime')
,p_version_scn=>2705521
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142551275201752418)
,p_name=>'ACCESS_DENIED_SIMPLE'
,p_message_language=>'sl'
,p_message_text=>'Dostop zavrnjen'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142508174022752406)
,p_name=>'ACCOUNT_HAS_BEEN_CREATED'
,p_message_language=>'sl'
,p_message_text=>unistr('Va\0161 ra\010Dun %0 je bil ustvarjen.')
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142491327350752401)
,p_name=>'ACCOUNT_LOCKED'
,p_message_language=>'sl'
,p_message_text=>unistr('Ra\010Dun je zaklenjen.')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142475870214752396)
,p_name=>'AM_PM'
,p_message_language=>'sl'
,p_message_text=>'AM / PM'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142458673387752391)
,p_name=>'APEX.ACTIONS.ACTION_LINK'
,p_message_language=>'sl'
,p_message_text=>'povezava dejanja'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142458586231752391)
,p_name=>'APEX.ACTIONS.DIALOG_LINK'
,p_message_language=>'sl'
,p_message_text=>'povezava pogovornega okna'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142622986506752440)
,p_name=>'APEX.ACTIONS.TOGGLE'
,p_message_language=>'sl'
,p_message_text=>'Preklop %0'
,p_is_js_message=>true
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142630767597752442)
,p_name=>'APEX.ACTIVE_STATE'
,p_message_language=>'sl'
,p_message_text=>'(Aktivno)'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142435502077752384)
,p_name=>'APEX.AI.CHAT_CLEARED'
,p_message_language=>'sl'
,p_message_text=>unistr('Klepet po\010Di\0161\010Den')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142435458663752384)
,p_name=>'APEX.AI.CLEAR_CHAT'
,p_message_language=>'sl'
,p_message_text=>unistr('Po\010Disti klepet')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142432099831752383)
,p_name=>'APEX.AI.CONSENT_ACCEPT'
,p_message_language=>'sl'
,p_message_text=>'Sprejmi'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142432127123752383)
,p_name=>'APEX.AI.CONSENT_DENY'
,p_message_language=>'sl'
,p_message_text=>'Zavrni'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142431811744752383)
,p_name=>'APEX.AI.CONVERSATION_HISTORY'
,p_message_language=>'sl'
,p_message_text=>'Zgodovina pogovorov'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142435253709752384)
,p_name=>'APEX.AI.COPIED'
,p_message_language=>'sl'
,p_message_text=>'Kopirano'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142435303414752384)
,p_name=>'APEX.AI.COPIED_TO_CLIPBOARD'
,p_message_language=>'sl'
,p_message_text=>unistr('Kopirano v odlo\017Ei\0161\010De')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142435090000752384)
,p_name=>'APEX.AI.COPY'
,p_message_language=>'sl'
,p_message_text=>'Kopiraj'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142435107086752384)
,p_name=>'APEX.AI.COPY_TO_CLIPBOARD'
,p_message_language=>'sl'
,p_message_text=>unistr('Kopiraj v odlo\017Ei\0161\010De')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142432532986752383)
,p_name=>'APEX.AI.DIALOG_TITLE'
,p_message_language=>'sl'
,p_message_text=>unistr('Pomo\010Dnik')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142432925197752383)
,p_name=>'APEX.AI.DISABLED'
,p_message_language=>'sl'
,p_message_text=>unistr('Umetna inteligenca je onemogo\010Dena na ravni delovnega prostora ali instance.')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142472216764752395)
,p_name=>'APEX.AI.GET_SERVER_ID_OR_STATIC_ID'
,p_message_language=>'sl'
,p_message_text=>unistr('Storitve Generative AI z danim ID-jem ali stati\010Dnim ID-jem ni bilo mogo\010De najti.')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142470958660752395)
,p_name=>'APEX.AI.HTTP_4013_ERROR'
,p_message_language=>'sl'
,p_message_text=>'Napaka pri preverjanju pristnosti ali prepovedan dostop (HTTP-%1) za URL %0. Preverite konfiguracijo storitve Generative AI %2.'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142450797929752389)
,p_name=>'APEX.AI.HTTP_ERROR'
,p_message_language=>'sl'
,p_message_text=>'Zahteva HTTP storitvi Generative AI na %0 ni uspela s HTTP-%1: %2'
,p_version_scn=>2705517
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142475122788752396)
,p_name=>'APEX.AI.HTTP_FRIENDLY_ERROR'
,p_message_language=>'sl'
,p_message_text=>unistr('Napaka v zahtevi HTTP storitvi Generative AI za vti\010Dnik %0 v na\010Dinu %1. Preverite konfiguracijo storitve Generative AI.')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142437920719752385)
,p_name=>'APEX.AI.MAIN_QUICK_ACTIONS_ARIA_LABEL'
,p_message_language=>'sl'
,p_message_text=>'Primeri'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142436346501752384)
,p_name=>'APEX.AI.NAME_ASSISTANT'
,p_message_language=>'sl'
,p_message_text=>unistr('Pomo\010Dnik')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142437768398752385)
,p_name=>'APEX.AI.NAME_COMMA_MESSAGE'
,p_message_language=>'sl'
,p_message_text=>'%0,%1'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142436234111752384)
,p_name=>'APEX.AI.NAME_USER'
,p_message_language=>'sl'
,p_message_text=>'Vi'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142466926382752393)
,p_name=>'APEX.AI.OCI_CHAT_NOT_SUPPORTED'
,p_message_language=>'sl'
,p_message_text=>unistr('OCI Generative AI trenutno ne podpira izku\0161nje klepeta z ve\010D sporo\010Dili.')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142446842050752387)
,p_name=>'APEX.AI.PROMPT_ENRICHMENT_ERROR'
,p_message_language=>'sl'
,p_message_text=>'Napaka pri obdelovanju poziva %0 za aplikacijo %1. Preverite, ali je v tej instanci na voljo graditelj aplikacij.'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142451924285752389)
,p_name=>'APEX.AI.RESPONSE_ERROR'
,p_message_language=>'sl'
,p_message_text=>unistr('Ni mogo\010De obdelati odgovora za AI Service %0, odgovor %1')
,p_version_scn=>2705517
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142458109642752391)
,p_name=>'APEX.AI.SEND_MESSAGE'
,p_message_language=>'sl'
,p_message_text=>unistr('Po\0161lji sporo\010Dilo')
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142446417086752387)
,p_name=>'APEX.AI.SERVICE_ERROR'
,p_message_language=>'sl'
,p_message_text=>'Napaka AI Service %0 v ozadju'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142432244381752383)
,p_name=>'APEX.AI.TEXTAREA_LABEL'
,p_message_language=>'sl'
,p_message_text=>unistr('Sporo\010Dilo')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142432352982752383)
,p_name=>'APEX.AI.TEXTAREA_PLACEHOLDER'
,p_message_language=>'sl'
,p_message_text=>unistr('Tukaj vnesite sporo\010Dilo')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142435668398752384)
,p_name=>'APEX.AI.USER_AVATAR'
,p_message_language=>'sl'
,p_message_text=>'Avatar uporabnika'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142435778752752384)
,p_name=>'APEX.AI.USE_THIS'
,p_message_language=>'sl'
,p_message_text=>'Uporabi to'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142432489323752383)
,p_name=>'APEX.AI.WARN_UNSENT_MESSAGE'
,p_message_language=>'sl'
,p_message_text=>unistr('Imate neposlano sporo\010Dilo. Ste prepri\010Dani?')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142601448097752434)
,p_name=>'APEX.AJAX_SERVER_ERROR'
,p_message_language=>'sl'
,p_message_text=>unistr('Klic Ajax je vrnil napako stre\017Enika %0 za %1.')
,p_version_scn=>2705544
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142528537400752412)
,p_name=>'APEX.APPLICATION.ALIAS.NON_UNIQUE'
,p_message_language=>'sl'
,p_message_text=>unistr('Drugega imena aplikacije "%0" ni mogo\010De pretvoriti v enoli\010Den ID aplikacije.')
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142517362501752408)
,p_name=>'APEX.APPLICATION.ALIAS.UNHANDLED_ERROR'
,p_message_language=>'sl'
,p_message_text=>unistr('ERR-1816 Nepri\010Dakovana napaka pri pretvarjanju drugega imena aplikacije p_flow_alias_or_id (%0).')
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142614777438752438)
,p_name=>'APEX.APPLICATION.CHECKSUM.DESCRIPTION'
,p_message_language=>'sl'
,p_message_text=>unistr('Kontrolna vsota aplikacije omogo\010Da enostaven na\010Din dolo\010Danja tega, ali je ista aplikacija postavljena po delovnih prostorih. To kontrolno vsoto lahko primerjate, da dolo\010Dite, ali obstaja ujemanje. ')
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142501389827752404)
,p_name=>'APEX.AUTHENTICATION.AUTH_FUNC.UNHANDLED_ERROR'
,p_message_language=>'sl'
,p_message_text=>'Napaka pri obdelavi funkcije preverjanja pristnosti.'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142483337382752398)
,p_name=>'APEX.AUTHENTICATION.AUTH_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'sl'
,p_message_text=>'Napaka pri obdelavi funkcije preverjanja pristnosti.'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142655214941752450)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.HOST_PREFIX_MISMATCH'
,p_message_language=>'sl'
,p_message_text=>unistr('Ime najemnika %0, ki ga vrne Oracle Cloud Identity Management, ni odobreno za domeno %1!<br/><a href="&LOGOUT_URL.">Prijavite se znova</a> in dolo\010Dite odobreno ime najemnika ali spremenite svoj URL.')
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142479411133752397)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.USER_IS_NOT_DEVELOPER'
,p_message_language=>'sl'
,p_message_text=>unistr('Va\0161 ra\010Dun "%0" nima potrebnih privilegijev za razvoj (DB_DEVELOPER ali DB_ADMINISTRATOR)<br/>za delovni prostor "%1"! <a href="&LOGOUT_URL.">Ponovno se prijavite</a>, ko vam bodo zagotovljeni privilegiji.')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142476017120752396)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.WRONG_GROUP_NAME'
,p_message_language=>'sl'
,p_message_text=>'Ime najemnika, ki ga vrne Oracle Cloud Identity Management, ni odobreno za trenutni delovni prostor!<br/><a href="&LOGOUT_URL.">Ponovno se prijavite</a> in navedite odobreno ime najemnika.'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142479595061752397)
,p_name=>'APEX.AUTHENTICATION.HOST_PREFIX_MISMATCH'
,p_message_language=>'sl'
,p_message_text=>'Iz varnostnih razlogov izvajanje aplikacij tega delovnega prostora prek domene v URL-ju ni dovoljeno.'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142501089385752403)
,p_name=>'APEX.AUTHENTICATION.LDAP.DBMS_LDAP.ASK_FOR_INSTALLATION'
,p_message_language=>'sl'
,p_message_text=>unistr('Svojega skrbnika baze podatkov prosite, da za\017Eene $OH/rdbms/admin/catldap.sql.')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142500916809752403)
,p_name=>'APEX.AUTHENTICATION.LDAP.DBMS_LDAP.MISSING'
,p_message_language=>'sl'
,p_message_text=>'Paket SYS.DBMS_LDAP ne obstaja ali je neveljaven.'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142500892897752403)
,p_name=>'APEX.AUTHENTICATION.LDAP.EDIT_USER_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'sl'
,p_message_text=>'Napaka pri obdelavi funkcije urejanja uporabnika LDAP.'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142501176197752404)
,p_name=>'APEX.AUTHENTICATION.LDAP.UNHANDLED_ERROR'
,p_message_language=>'sl'
,p_message_text=>'Napaka pri obdelavi preverjanja pristnosti LDAP.'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142501993410752404)
,p_name=>'APEX.AUTHENTICATION.LOGIN.ILLEGAL_PAGE_ARG'
,p_message_language=>'sl'
,p_message_text=>'Napaka v argumentu p_flow_page do postopka login_page.'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142501519198752404)
,p_name=>'APEX.AUTHENTICATION.LOGIN.INVALID_ARG'
,p_message_language=>'sl'
,p_message_text=>'Neveljavna seja p_session v wwv_flow_custom_auth_std.login--p_flow_page:%0 p_session_id:%1.'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142552862890752419)
,p_name=>'APEX.AUTHENTICATION.LOGIN.MALFORMED_ARGS'
,p_message_language=>'sl'
,p_message_text=>unistr('Po\0161kodovan argument za wwv_flow_custom_auth_std.login--p_flow_page:p_session_id:p_entry_point:%0:%1:%2.')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142501653292752404)
,p_name=>'APEX.AUTHENTICATION.LOGIN.NULL_USER'
,p_message_language=>'sl'
,p_message_text=>unistr('Uporabni\0161ko ime NULL podano v postopek prijave.')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142488499851752400)
,p_name=>'APEX.AUTHENTICATION.LOGIN_THROTTLE.COUNTER'
,p_message_language=>'sl'
,p_message_text=>unistr('Pred ponovnim vpisom po\010Dakajte toliko sekund: <span id="apex_login_throttle_sec">%0</span>.')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142489796429752400)
,p_name=>'APEX.AUTHENTICATION.LOGIN_THROTTLE.ERROR'
,p_message_language=>'sl'
,p_message_text=>'Poskus prijave je bil blokiran.'
,p_version_scn=>2705521
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142550530892752418)
,p_name=>'APEX.AUTHENTICATION.NOT_FOUND'
,p_message_language=>'sl'
,p_message_text=>'Preverjanje pristnosti "%0" ni najdeno'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142490241795752400)
,p_name=>'APEX.AUTHENTICATION.NO_SECURITY_GROUP_ID'
,p_message_language=>'sl'
,p_message_text=>'ID varnostne skupine je NULL.'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142501408700752404)
,p_name=>'APEX.AUTHENTICATION.POST_AUTH_PROC.UNHANDLED_ERROR'
,p_message_language=>'sl'
,p_message_text=>'Napaka pri izvajanju procesa naknadnega preverjanja pristnosti.'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142501269559752404)
,p_name=>'APEX.AUTHENTICATION.PRE_AUTH_PROC.UNHANDLED_ERROR'
,p_message_language=>'sl'
,p_message_text=>unistr('Napaka pri obdelavi procesa vnaprej\0161njega preverjanja pristnosti.')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142502943399752404)
,p_name=>'APEX.AUTHENTICATION.RESET_PASSWORD.INSTRUCTIONS'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Naslov URL odprite v istem brskalniku, v katerem ste inicializirali zahtevo za ponastavitev gesla. \010Ce kliknete URL za ponastavitev gesla in ste preusmerjeni na'),
'stran za prijavo, znova inicializirajte Ponastavitev gesla in pustite',
'brskalnik odprt.'))
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142652735556752449)
,p_name=>'APEX.AUTHENTICATION.RESET_PASSWORD_URL'
,p_message_language=>'sl'
,p_message_text=>'URL za ponastavitev gesla'
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142479732326752397)
,p_name=>'APEX.AUTHENTICATION.RM_GROUP_NOT_GRANTED'
,p_message_language=>'sl'
,p_message_text=>'Skupina porabnikov upravitelja virov %0 ni bila dodeljena %1'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142479810381752397)
,p_name=>'APEX.AUTHENTICATION.RM_INFO_TO_GRANT'
,p_message_language=>'sl'
,p_message_text=>unistr('Za podelitev manjkajo\010Dega privilegija uporabite DBMS_RESOURCE_MANAGER_PRIVS.GRANT_SWITCH_CONSUMER_GROUP.')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142514415796752408)
,p_name=>'APEX.AUTHENTICATION.SESSION_SENTRY_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'sl'
,p_message_text=>unistr('Napaka pri obdelavi funkcije stra\017Ee v seji.')
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142514539068752408)
,p_name=>'APEX.AUTHENTICATION.SESSION_VERIFY_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'sl'
,p_message_text=>'Napaka pri obdelavi funkcije preverjanja seje.'
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142514723327752408)
,p_name=>'APEX.AUTHENTICATION.SSO.ASK_FOR_INSTALLATION'
,p_message_language=>'sl'
,p_message_text=>unistr('Svojega skrbnika %0 prosite, da konfigurira mehanizem za enotno prijavo v stre\017Enik Oracle Application Server.')
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142525143284752411)
,p_name=>'APEX.AUTHENTICATION.SSO.BAD_URLC'
,p_message_language=>'sl'
,p_message_text=>unistr('Neveljaven %0 v \017Eetonu %1 vrnjen s strani SSO.')
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142501860844752404)
,p_name=>'APEX.AUTHENTICATION.SSO.FIX_PARTNER_APP'
,p_message_language=>'sl'
,p_message_text=>'Uredite shemo preverjanja pristnosti in dodajte ime aplikacije.'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142524838098752411)
,p_name=>'APEX.AUTHENTICATION.SSO.ILLEGAL_CALLER'
,p_message_language=>'sl'
,p_message_text=>'Neveljaven program za klicanje postopka %0:'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142525050553752411)
,p_name=>'APEX.AUTHENTICATION.SSO.INVALID_APP_SESSION'
,p_message_language=>'sl'
,p_message_text=>unistr('Neveljavna seja aplikacije v \017Eetonu urlc: %0')
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142524652128752411)
,p_name=>'APEX.AUTHENTICATION.SSO.MISSING_APP_REGISTRATION'
,p_message_language=>'sl'
,p_message_text=>unistr('Napaka v portal_sso_redirect: manjkajo\010De informacije o registraciji aplikacije: %0')
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142514627148752408)
,p_name=>'APEX.AUTHENTICATION.SSO.PACKAGE_MISSING'
,p_message_language=>'sl'
,p_message_text=>'Paket WWSEC_SSO_ENABLER_PRIVATE ne obstaja ali je neveljaven.'
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142501788408752404)
,p_name=>'APEX.AUTHENTICATION.SSO.PARTNER_APP_IS_NULL'
,p_message_language=>'sl'
,p_message_text=>unistr('Ni mogo\010De najti imena aplikacije registriranega partnerja v shemi preverjanja pristnosti.')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142524729194752411)
,p_name=>'APEX.AUTHENTICATION.SSO.REGISTER_APP'
,p_message_language=>'sl'
,p_message_text=>unistr('Registrirajte to aplikacijo, kot je opisano v priro\010Dniku za namestitev.')
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142514823341752408)
,p_name=>'APEX.AUTHENTICATION.SSO.UNHANDLED_ERROR'
,p_message_language=>'sl'
,p_message_text=>'Napaka pri obdelavi preverjanja pristnosti SSO.'
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142628141164752442)
,p_name=>'APEX.AUTHENTICATION.UNAUTHORIZED_URL'
,p_message_language=>'sl'
,p_message_text=>'Neodobreni URL: %0'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142514276754752407)
,p_name=>'APEX.AUTHENTICATION.UNHANDLED_ERROR'
,p_message_language=>'sl'
,p_message_text=>'Napaka pri obdelavi preverjanja pristnosti.'
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142479661017752397)
,p_name=>'APEX.AUTHENTICATION.WORKSPACE_NOT_ASSIGNED'
,p_message_language=>'sl'
,p_message_text=>'Delovni prostor "%0" je neaktiven. Obrnite se na svojega skrbnika.'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142480391676752397)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED'
,p_message_language=>'sl'
,p_message_text=>'%0'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142489438721752400)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED.APPLICATION'
,p_message_language=>'sl'
,p_message_text=>'Dostop je zavrnilo varnostno preverjanje aplikacije'
,p_version_scn=>2705521
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142489504537752400)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED.PAGE'
,p_message_language=>'sl'
,p_message_text=>'Dostop je zavrnilo varnostno preverjanje strani'
,p_version_scn=>2705521
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142489615027752400)
,p_name=>'APEX.AUTHORIZATION.UNHANDLED_ERROR'
,p_message_language=>'sl'
,p_message_text=>'Napaka pri obdelavi odobritve.'
,p_version_scn=>2705521
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142558702613752421)
,p_name=>'APEX.BUILT_WITH_LOVE_USING_APEX'
,p_message_language=>'sl'
,p_message_text=>'Izdelano s/z %0 z uporabo %1'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142558843363752421)
,p_name=>'APEX.BUILT_WITH_LOVE_USING_APEX.ACCESSIBLE.LOVE'
,p_message_language=>'sl'
,p_message_text=>'ljubezen'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142618682556752439)
,p_name=>'APEX.CALENDAR.EVENT_DESCRIPTION'
,p_message_language=>'sl'
,p_message_text=>'Opis dogodka'
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142618481513752439)
,p_name=>'APEX.CALENDAR.EVENT_END'
,p_message_language=>'sl'
,p_message_text=>'Datum konca'
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142618774275752439)
,p_name=>'APEX.CALENDAR.EVENT_ID'
,p_message_language=>'sl'
,p_message_text=>'ID dogodka'
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142618342652752439)
,p_name=>'APEX.CALENDAR.EVENT_START'
,p_message_language=>'sl'
,p_message_text=>unistr('Datum za\010Detka')
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142618513423752439)
,p_name=>'APEX.CALENDAR.EVENT_TITLE'
,p_message_language=>'sl'
,p_message_text=>'Naziv dogodka'
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142461135132752392)
,p_name=>'APEX.CARD'
,p_message_language=>'sl'
,p_message_text=>'Kartica'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142461397035752392)
,p_name=>'APEX.CARD.CARD_ACTION'
,p_message_language=>'sl'
,p_message_text=>'Dejanje kartice'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142502045125752404)
,p_name=>'APEX.CHECKBOX.VISUALLY_HIDDEN_CHECKBOX'
,p_message_language=>'sl'
,p_message_text=>'Vizualno skrito potrditveno polje'
,p_is_js_message=>true
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142503964050752404)
,p_name=>'APEX.CHECKSUM.CONTENT_ERROR'
,p_message_language=>'sl'
,p_message_text=>'Napaka vsebine kontrolne vsote'
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142503824667752404)
,p_name=>'APEX.CHECKSUM.FORMAT_ERROR'
,p_message_language=>'sl'
,p_message_text=>'Napaka formata kontrolne vsote'
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142573774510752425)
,p_name=>'APEX.CLIPBOARD.COPIED'
,p_message_language=>'sl'
,p_message_text=>unistr('Kopirano v odlo\017Ei\0161\010De.')
,p_is_js_message=>true
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142573260392752425)
,p_name=>'APEX.CLIPBOARD.NOTSUP'
,p_message_language=>'sl'
,p_message_text=>'Ta brskalnik ne podpira kopiranja iz gumba ali menija. Poskusite z ukazom Ctrl + C ali Command + C.'
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142559442361752421)
,p_name=>'APEX.CLOSE_NOTIFICATION'
,p_message_language=>'sl'
,p_message_text=>'Zapri'
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142437889836752385)
,p_name=>'APEX.CODE_EDITOR.MAXIMUM_LENGTH_EXCEEDED'
,p_message_language=>'sl'
,p_message_text=>unistr('Vsebina urejevalnika kode presega maksimalno dol\017Eino elementa (dejansko \0161tevilo znakov je %0, dovoljenih je toliko znakov: %1)')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142617960108752439)
,p_name=>'APEX.COLOR_PICKER.CONTRAST'
,p_message_language=>'sl'
,p_message_text=>'Kontrast'
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142612498040752437)
,p_name=>'APEX.COLOR_PICKER.CURRENT'
,p_message_language=>'sl'
,p_message_text=>'Trenutno'
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142612362801752437)
,p_name=>'APEX.COLOR_PICKER.INITIAL'
,p_message_language=>'sl'
,p_message_text=>unistr('Za\010Detno')
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142616576933752438)
,p_name=>'APEX.COLOR_PICKER.INVALID_COLOR'
,p_message_language=>'sl'
,p_message_text=>'#LABEL# mora biti veljavna barva. Primer: %0'
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142478901238752397)
,p_name=>'APEX.COLOR_PICKER.MORE_PRESET_COLORS'
,p_message_language=>'sl'
,p_message_text=>unistr('Ve\010D barv')
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142479011696752397)
,p_name=>'APEX.COLOR_PICKER.OPEN'
,p_message_language=>'sl'
,p_message_text=>'Odpri izbirnik barve'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142436192348752384)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.ALPHA_SLIDER'
,p_message_language=>'sl'
,p_message_text=>unistr('Dvosmerni vodoravni drsnik za alfo. Za krmarjenje uporabite pu\0161\010Di\010Dni tipki.')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142435869363752384)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.COLOR_SPECTRUM'
,p_message_language=>'sl'
,p_message_text=>unistr('\0160tirismerni drsnik za barvni spekter. Za krmarjenje uporabite pu\0161\010Di\010Dne tipke.')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142435950247752384)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.HUE_SLIDER'
,p_message_language=>'sl'
,p_message_text=>unistr('Dvosmerni navpi\010Dni drsnik za odtenek. Za krmarjenje uporabite pu\0161\010Di\010Dni tipki.')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142612281560752437)
,p_name=>'APEX.COLOR_PICKER.TITLE'
,p_message_language=>'sl'
,p_message_text=>'Izbira barve'
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142612554795752437)
,p_name=>'APEX.COLOR_PICKER.TOGGLE_TITLE'
,p_message_language=>'sl'
,p_message_text=>'Spreminjanje formata barve'
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142650428259752448)
,p_name=>'APEX.COMBOBOX.LIST_OF_VALUES'
,p_message_language=>'sl'
,p_message_text=>'Seznam vrednosti'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142650540063752448)
,p_name=>'APEX.COMBOBOX.SHOW_ALL_VALUES'
,p_message_language=>'sl'
,p_message_text=>'Odpri seznam za: %0'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142630809669752442)
,p_name=>'APEX.COMPLETED_STATE'
,p_message_language=>'sl'
,p_message_text=>unistr('(Dokon\010Dano)')
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142519782652752409)
,p_name=>'APEX.CONTACT_ADMIN'
,p_message_language=>'sl'
,p_message_text=>'Obrnite se na skrbnika aplikacije.'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142535220712752414)
,p_name=>'APEX.CONTACT_ADMIN.DEBUG'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Obrnite se na skrbnika aplikacije.',
'Podrobnosti o tem incidentu so na voljo prek ID-ja za iskanje napak "%0".'))
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142616813748752438)
,p_name=>'APEX.CORRECT_ERRORS'
,p_message_language=>'sl'
,p_message_text=>'Pred shranjevanjem popravite napake.'
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142462126465752392)
,p_name=>'APEX.CS.ACTIVE_VALUE_CHIP'
,p_message_language=>'sl'
,p_message_text=>'%0. Za brisanje pritisnite tipko Backspace.'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142560300409752421)
,p_name=>'APEX.CS.MATCHES_FOUND'
,p_message_language=>'sl'
,p_message_text=>'Najdenih je toliko zadetkov: %0'
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142442224222752386)
,p_name=>'APEX.CS.MATCH_FOUND'
,p_message_language=>'sl'
,p_message_text=>'1 najdeno ujemanje'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142560227899752421)
,p_name=>'APEX.CS.NO_MATCHES'
,p_message_language=>'sl'
,p_message_text=>'Ni ustreznih zadetkov'
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142436654569752384)
,p_name=>'APEX.CS.OTHERS_GROUP'
,p_message_language=>'sl'
,p_message_text=>'Drugo'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142436512663752384)
,p_name=>'APEX.CS.SELECTED_VALUES_COUNTER'
,p_message_language=>'sl'
,p_message_text=>'Izbrane vrednosti: %0'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142631320202752443)
,p_name=>'APEX.CURRENT_PROGRESS'
,p_message_language=>'sl'
,p_message_text=>'Trenutni napredek'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142617212192752438)
,p_name=>'APEX.DATA.LOAD.FILE_DOES_NOT_EXIST'
,p_message_language=>'sl'
,p_message_text=>unistr('Datoteka, dolo\010Dena v elementu %0, ne obstaja v APEX_APPLICATION_TEMP_FILES.')
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142605704336752435)
,p_name=>'APEX.DATA_HAS_CHANGED'
,p_message_language=>'sl'
,p_message_text=>'Trenutna verzija podatkov v bazi podatkov se je spremenila, odkar je uporabnik inicializiral postopek posodobitve.'
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142574837943752426)
,p_name=>'APEX.DATA_LOAD.DO_NOT_LOAD'
,p_message_language=>'sl'
,p_message_text=>'Ne nalagaj'
,p_version_scn=>2705538
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142621115733752439)
,p_name=>'APEX.DATA_LOAD.FAILED'
,p_message_language=>'sl'
,p_message_text=>'Predobdelava napake'
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142620953940752439)
,p_name=>'APEX.DATA_LOAD.INSERT'
,p_message_language=>'sl'
,p_message_text=>'Vstavi vrstico'
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142634536661752443)
,p_name=>'APEX.DATA_LOAD.SEQUENCE_ACTION'
,p_message_language=>'sl'
,p_message_text=>'Zaporedje: Dejanje'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142621037574752439)
,p_name=>'APEX.DATA_LOAD.UPDATE'
,p_message_language=>'sl'
,p_message_text=>'Posodobi vrstico'
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142449506988752388)
,p_name=>'APEX.DATEPICKER.ACTIONS'
,p_message_language=>'sl'
,p_message_text=>'Dejanja'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142477174348752396)
,p_name=>'APEX.DATEPICKER.AM_PM'
,p_message_language=>'sl'
,p_message_text=>'AM/PM'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142463220878752392)
,p_name=>'APEX.DATEPICKER.BOUNDARY_ITEM_FORMAT_INVALID'
,p_message_language=>'sl'
,p_message_text=>'%0 mora biti izbirnik datuma ali veljaven datum, na primer %1.'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142572406122752425)
,p_name=>'APEX.DATEPICKER.CLEAR'
,p_message_language=>'sl'
,p_message_text=>unistr('Po\010Disti')
,p_is_js_message=>true
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142480629567752397)
,p_name=>'APEX.DATEPICKER.DONE'
,p_message_language=>'sl'
,p_message_text=>unistr('Kon\010Dano')
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142491611073752401)
,p_name=>'APEX.DATEPICKER.FORMAT_NOT_SUPPORTED'
,p_message_language=>'sl'
,p_message_text=>'%0 ima nepodprte dele v maski formata: %1'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142476863962752396)
,p_name=>'APEX.DATEPICKER.HOUR'
,p_message_language=>'sl'
,p_message_text=>'Ura'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142560788354752421)
,p_name=>'APEX.DATEPICKER.ICON_TEXT'
,p_message_language=>'sl'
,p_message_text=>'Pojavni koledar: %0'
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142476696630752396)
,p_name=>'APEX.DATEPICKER.ISO_WEEK'
,p_message_language=>'sl'
,p_message_text=>'Teden'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142476791568752396)
,p_name=>'APEX.DATEPICKER.ISO_WEEK_ABBR'
,p_message_language=>'sl'
,p_message_text=>'Teden'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142477020820752396)
,p_name=>'APEX.DATEPICKER.MINUTES'
,p_message_language=>'sl'
,p_message_text=>'Minute'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142477274791752396)
,p_name=>'APEX.DATEPICKER.MONTH'
,p_message_language=>'sl'
,p_message_text=>'Mesec'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142477681435752397)
,p_name=>'APEX.DATEPICKER.NEXT_MONTH'
,p_message_language=>'sl'
,p_message_text=>'Naslednji mesec'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142447218022752388)
,p_name=>'APEX.DATEPICKER.POPUP'
,p_message_language=>'sl'
,p_message_text=>'Pojavno okno za %0'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142477563958752397)
,p_name=>'APEX.DATEPICKER.PREVIOUS_MONTH'
,p_message_language=>'sl'
,p_message_text=>unistr('Prej\0161nji mesec')
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142570062846752424)
,p_name=>'APEX.DATEPICKER.READONLY_DATEPICKER'
,p_message_language=>'sl'
,p_message_text=>'Izbirnik datuma samo za branje'
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142478401575752397)
,p_name=>'APEX.DATEPICKER.SELECT_DATE'
,p_message_language=>'sl'
,p_message_text=>'Izberite datum'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142447360294752388)
,p_name=>'APEX.DATEPICKER.SELECT_DATE_AND_TIME'
,p_message_language=>'sl'
,p_message_text=>unistr('Izberite datum in \010Das')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142444510249752387)
,p_name=>'APEX.DATEPICKER.SELECT_DAY'
,p_message_language=>'sl'
,p_message_text=>'Izberite dan'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142447922675752388)
,p_name=>'APEX.DATEPICKER.SELECT_MONTH_AND_YEAR'
,p_message_language=>'sl'
,p_message_text=>'Izberite mesec in leto'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142444708706752387)
,p_name=>'APEX.DATEPICKER.SELECT_TIME'
,p_message_language=>'sl'
,p_message_text=>unistr('Izberite \010Das')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142445237060752387)
,p_name=>'APEX.DATEPICKER.TODAY'
,p_message_language=>'sl'
,p_message_text=>'Danes'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142462828314752392)
,p_name=>'APEX.DATEPICKER.VALUE_INVALID'
,p_message_language=>'sl'
,p_message_text=>'#LABEL# mora biti veljaven datum, na primer %0.'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142462523735752392)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_BETWEEN'
,p_message_language=>'sl'
,p_message_text=>'#LABEL# mora biti med %0 in %1.'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142462687138752392)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_ON_OR_AFTER'
,p_message_language=>'sl'
,p_message_text=>'#LABEL# mora biti na ali po %0.'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142462776518752392)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_ON_OR_BEFORE'
,p_message_language=>'sl'
,p_message_text=>'#LABEL# mora biti na ali pred %0.'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142454122103752390)
,p_name=>'APEX.DATEPICKER.VISUALLY_HIDDEN_EDIT'
,p_message_language=>'sl'
,p_message_text=>'Vizualno skrito urejanje'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142477450924752396)
,p_name=>'APEX.DATEPICKER.YEAR'
,p_message_language=>'sl'
,p_message_text=>'Leto'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142564435431752422)
,p_name=>'APEX.DATEPICKER_VALUE_GREATER_MAX_DATE'
,p_message_language=>'sl'
,p_message_text=>unistr('#LABEL# zna\0161a ve\010D od navedenega maksimalnega datuma %0.')
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142564839402752423)
,p_name=>'APEX.DATEPICKER_VALUE_INVALID'
,p_message_language=>'sl'
,p_message_text=>'#LABEL# se ne ujema s formatom %0.'
,p_is_js_message=>true
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142564394894752422)
,p_name=>'APEX.DATEPICKER_VALUE_LESS_MIN_DATE'
,p_message_language=>'sl'
,p_message_text=>unistr('#LABEL# zna\0161a manj od navedenega minimalnega datuma %0.')
,p_version_scn=>2705535
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142564526502752422)
,p_name=>'APEX.DATEPICKER_VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'sl'
,p_message_text=>'#LABEL# ni v veljavnem razponu med %0 in %1.'
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142564787375752422)
,p_name=>'APEX.DATEPICKER_VALUE_NOT_IN_YEAR_RANGE'
,p_message_language=>'sl'
,p_message_text=>'#LABEL# ni v veljavnem razponu let med %0 in %1.'
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142456542265752390)
,p_name=>'APEX.DBMS_CLOUD_INT.DBMS_CLOUD_ERROR'
,p_message_language=>'sl'
,p_message_text=>unistr('Med obdelavo zahteve DBMS_CLOUD je pri\0161lo do notranje napake.')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142617195235752438)
,p_name=>'APEX.DIALOG.CANCEL'
,p_message_language=>'sl'
,p_message_text=>unistr('Prekli\010Di')
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142643000864752446)
,p_name=>'APEX.DIALOG.CLOSE'
,p_message_language=>'sl'
,p_message_text=>'Zapri'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142504201069752404)
,p_name=>'APEX.DIALOG.CONFIRMATION'
,p_message_language=>'sl'
,p_message_text=>'Potrditev'
,p_is_js_message=>true
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142645044235752447)
,p_name=>'APEX.DIALOG.HELP'
,p_message_language=>'sl'
,p_message_text=>unistr('Pomo\010D')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142616904263752438)
,p_name=>'APEX.DIALOG.OK'
,p_message_language=>'sl'
,p_message_text=>'V redu'
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142617012299752438)
,p_name=>'APEX.DIALOG.SAVE'
,p_message_language=>'sl'
,p_message_text=>'Shrani'
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142484772133752399)
,p_name=>'APEX.DIALOG.TITLE'
,p_message_language=>'sl'
,p_message_text=>'Naslov pogovornega okna'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142524408130752410)
,p_name=>'APEX.DIALOG.VISUALLY_HIDDEN_TITLE'
,p_message_language=>'sl'
,p_message_text=>'Naslov vizualno skritega pogovornega okna'
,p_is_js_message=>true
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142445555673752387)
,p_name=>'APEX.DOCGEN'
,p_message_language=>'sl'
,p_message_text=>'Predvgrajena funkcija generatorja dokumentov Oracle'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142456350913752390)
,p_name=>'APEX.DOCGEN.DBMS_CLOUD_ERROR'
,p_message_language=>'sl'
,p_message_text=>'Napaka pri tiskanju dokumenta.'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142433537325752383)
,p_name=>'APEX.DOCGEN.INVALID_OUTPUT_TYPE'
,p_message_language=>'sl'
,p_message_text=>'%s ne podpira %1 kot izhod.'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142445468343752387)
,p_name=>'APEX.DOCGEN.INVOKE_ERROR'
,p_message_language=>'sl'
,p_message_text=>'Napaka "%0" pri priklicu predvgrajene funkcije generatorja dokumentov Oracle:'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142436934569752384)
,p_name=>'APEX.DOCGEN.TEMPLATE_REQUIRED'
,p_message_language=>'sl'
,p_message_text=>'Zahtevana je predloga.'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142462378639752392)
,p_name=>'APEX.DOWNLOAD.ERROR'
,p_message_language=>'sl'
,p_message_text=>'Napaka med prenosom datoteke.'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142462246451752392)
,p_name=>'APEX.DOWNLOAD.NO_DATA_FOUND'
,p_message_language=>'sl'
,p_message_text=>unistr('Prenosljivih podatkov ni bilo mogo\010De najti.')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142465821737752393)
,p_name=>'APEX.ENVIRONMENT.RUNTIME_ONLY'
,p_message_language=>'sl'
,p_message_text=>unistr('Ta funkcija ni na voljo v okolju samo v \010Dasu izvajanja.')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142518636887752409)
,p_name=>'APEX.ERROR'
,p_message_language=>'sl'
,p_message_text=>'Napaka'
,p_is_js_message=>true
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142478537895752397)
,p_name=>'APEX.ERROR.CALLBACK_FAILED'
,p_message_language=>'sl'
,p_message_text=>unistr('Med izvajanjem povratnega klica obravnavanja napak je pri\0161lo do naslednje napake: %0')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142491150749752401)
,p_name=>'APEX.ERROR.ERROR_PAGE.UNHANDLED_ERROR'
,p_message_language=>'sl'
,p_message_text=>unistr('Med slikanjem strani z napako je pri\0161lo do napake: %0')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142480241851752397)
,p_name=>'APEX.ERROR.INTERNAL'
,p_message_language=>'sl'
,p_message_text=>'Notranja napaka'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142629904492752442)
,p_name=>'APEX.ERROR.INTERNAL.CONTACT_ADMINISTRATOR'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Obrnite se na skrbnika.',
'Podrobnosti o tem incidentu so na voljo prek ID-ja za iskanje napak "%0".'))
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142624523973752440)
,p_name=>'APEX.ERROR.ORA-16000'
,p_message_language=>'sl'
,p_message_text=>'Baza podatkov je odprta za dostop samo za branje.'
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142654651248752450)
,p_name=>'APEX.ERROR.ORA-28353'
,p_message_language=>'sl'
,p_message_text=>'ORA-28353: Odpiranje denarnice ni uspelo. Podatki o aplikaciji trenutno niso na voljo.'
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142624651365752441)
,p_name=>'APEX.ERROR.PAGE_NOT_AVAILABLE'
,p_message_language=>'sl'
,p_message_text=>unistr('Ta stran \017Eal ni razpolo\017Eljiva')
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142483260071752398)
,p_name=>'APEX.ERROR.TECHNICAL_INFO'
,p_message_language=>'sl'
,p_message_text=>unistr('Tehni\010Dne informacije (na voljo samo razvijalcem)')
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142589115564752430)
,p_name=>'APEX.ERROR_MESSAGE_HEADING'
,p_message_language=>'sl'
,p_message_text=>unistr('Sporo\010Dilo o napaki')
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142603082004752434)
,p_name=>'APEX.EXPECTED_FORMAT'
,p_message_language=>'sl'
,p_message_text=>unistr('Pri\010Dakovani format: %0')
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142567917526752423)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.ALREADY_IN_ACL'
,p_message_language=>'sl'
,p_message_text=>unistr('Uporabnik je \017Ee na seznamu kontrole dostopa')
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142567821720752423)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.CREATE_CONFIRM'
,p_message_language=>'sl'
,p_message_text=>unistr('Potrdite dodajanje naslednjega \0161tevila uporabnikov na seznam kontrole dostopa <strong>%1</strong>: %0.')
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142568303009752424)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.DUPLICATE_USER'
,p_message_language=>'sl'
,p_message_text=>'Obstaja dvojnik uporabnika'
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142568084775752423)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.MISSING_AT_SIGN'
,p_message_language=>'sl'
,p_message_text=>unistr('V e-po\0161tnem naslovu manjka znak afne (@)')
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142568152464752423)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.MISSING_DOT'
,p_message_language=>'sl'
,p_message_text=>unistr('V e-po\0161tnem naslovu manjka pika (.)')
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142568269106752424)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.USERNAME_TOO_LONG'
,p_message_language=>'sl'
,p_message_text=>unistr('Uporabni\0161ko ime je predolgo')
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142568595587752424)
,p_name=>'APEX.FEATURE.ACL.INFO.ACL_ONLY'
,p_message_language=>'sl'
,p_message_text=>'Do te aplikacije lahko dostopajo samo uporabniki, navedeni na seznamu kontrole dostopa aplikacije'
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142568642157752424)
,p_name=>'APEX.FEATURE.ACL.INFO.ACL_VALUE_INVALID'
,p_message_language=>'sl'
,p_message_text=>unistr('Nepri\010Dakovana vrednost nastavitve kontrole dostopa: %0')
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142568477665752424)
,p_name=>'APEX.FEATURE.ACL.INFO.ALL_USERS'
,p_message_language=>'sl'
,p_message_text=>'Do te aplikacije lahko dostopajo vsi uporabniki s preverjeno pristnostjo'
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142612984141752437)
,p_name=>'APEX.FEATURE.CONFIG.DISABLED'
,p_message_language=>'sl'
,p_message_text=>unistr('Onemogo\010Deno')
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142612877193752437)
,p_name=>'APEX.FEATURE.CONFIG.ENABLED'
,p_message_language=>'sl'
,p_message_text=>unistr('Omogo\010Deno')
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142613141494752437)
,p_name=>'APEX.FEATURE.CONFIG.IS_DISABLED'
,p_message_language=>'sl'
,p_message_text=>unistr('%0: Je onemogo\010Deno')
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142613072847752437)
,p_name=>'APEX.FEATURE.CONFIG.IS_ENABLED'
,p_message_language=>'sl'
,p_message_text=>unistr('%0: Je omogo\010Deno')
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142461688747752392)
,p_name=>'APEX.FEATURE.CONFIG.NOT_SUPPORTED'
,p_message_language=>'sl'
,p_message_text=>'Ni podprto'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142522837978752410)
,p_name=>'APEX.FEATURE.CONFIG.OFF'
,p_message_language=>'sl'
,p_message_text=>'Izklopljeno'
,p_is_js_message=>true
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142522727039752410)
,p_name=>'APEX.FEATURE.CONFIG.ON'
,p_message_language=>'sl'
,p_message_text=>'Vklopljeno'
,p_is_js_message=>true
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142612793611752437)
,p_name=>'APEX.FEATURE.TOP_USERS.USERNAME.NOT_IDENTIFIED'
,p_message_language=>'sl'
,p_message_text=>'ni identificirano'
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142453216749752389)
,p_name=>'APEX.FILESIZE.BYTES'
,p_message_language=>'sl'
,p_message_text=>'%0 B'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142453762511752389)
,p_name=>'APEX.FILESIZE.GB'
,p_message_language=>'sl'
,p_message_text=>'%0 GB'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142453420944752389)
,p_name=>'APEX.FILESIZE.KB'
,p_message_language=>'sl'
,p_message_text=>'%0 KB'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142453668259752389)
,p_name=>'APEX.FILESIZE.MB'
,p_message_language=>'sl'
,p_message_text=>'%0 MB'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142605914901752435)
,p_name=>'APEX.FILE_BROWSE.DOWNLOAD_LINK_TEXT'
,p_message_language=>'sl'
,p_message_text=>'Prenos'
,p_is_js_message=>true
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142459079984752391)
,p_name=>'APEX.FS.ACTIONS_MENU_BUTTON_LABEL'
,p_message_language=>'sl'
,p_message_text=>unistr('Mo\017Enosti')
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142458712973752391)
,p_name=>'APEX.FS.ACTIONS_MENU_FILTER'
,p_message_language=>'sl'
,p_message_text=>'Filter'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142458923956752391)
,p_name=>'APEX.FS.ACTIONS_MENU_HIDE'
,p_message_language=>'sl'
,p_message_text=>'Skrij faseto'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142483675215752398)
,p_name=>'APEX.FS.ADD_FILTER'
,p_message_language=>'sl'
,p_message_text=>'Dodajanje filtra'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142559945188752421)
,p_name=>'APEX.FS.APPLIED_FACET'
,p_message_language=>'sl'
,p_message_text=>'Dodeljen filter %0'
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142484334300752399)
,p_name=>'APEX.FS.APPLY'
,p_message_language=>'sl'
,p_message_text=>'Dodeli'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142603517976752434)
,p_name=>'APEX.FS.BATCH_APPLY'
,p_message_language=>'sl'
,p_message_text=>'Dodeli'
,p_is_js_message=>true
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142484463460752399)
,p_name=>'APEX.FS.CANCEL'
,p_message_language=>'sl'
,p_message_text=>unistr('Prekli\010Di')
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142468226845752394)
,p_name=>'APEX.FS.CHART_BAR'
,p_message_language=>'sl'
,p_message_text=>unistr('Pali\010Dni grafikon')
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142616218169752438)
,p_name=>'APEX.FS.CHART_OTHERS'
,p_message_language=>'sl'
,p_message_text=>'Drugo'
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142468356745752394)
,p_name=>'APEX.FS.CHART_PIE'
,p_message_language=>'sl'
,p_message_text=>'Tortni grafikon'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142614878236752438)
,p_name=>'APEX.FS.CHART_TITLE'
,p_message_language=>'sl'
,p_message_text=>'Grafikon'
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142468074759752394)
,p_name=>'APEX.FS.CHART_VALUE_LABEL'
,p_message_language=>'sl'
,p_message_text=>unistr('\0160tevilo')
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142604013001752434)
,p_name=>'APEX.FS.CLEAR'
,p_message_language=>'sl'
,p_message_text=>unistr('Po\010Disti')
,p_is_js_message=>true
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142604173195752434)
,p_name=>'APEX.FS.CLEAR_ALL'
,p_message_language=>'sl'
,p_message_text=>unistr('Po\010Disti vse')
,p_is_js_message=>true
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142604227996752434)
,p_name=>'APEX.FS.CLEAR_VALUE'
,p_message_language=>'sl'
,p_message_text=>unistr('Po\010Disti %0')
,p_is_js_message=>true
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142620740021752439)
,p_name=>'APEX.FS.COLUMN_UNAUTHORIZED'
,p_message_language=>'sl'
,p_message_text=>'Stolpec %1, na katerega se sklicuje faseta %0, ni na voljo ali ni odobren.'
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142431463955752383)
,p_name=>'APEX.FS.CONFIG_TITLE'
,p_message_language=>'sl'
,p_message_text=>'Izbira filtrov za prikaz'
,p_is_js_message=>true
,p_version_scn=>2705513
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142557957967752420)
,p_name=>'APEX.FS.COUNT_RESULTS'
,p_message_language=>'sl'
,p_message_text=>unistr('\0160t. rezultatov: %0')
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142558024417752420)
,p_name=>'APEX.FS.COUNT_SELECTED'
,p_message_language=>'sl'
,p_message_text=>unistr('\0160t. izbranih: %0')
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142560878184752421)
,p_name=>'APEX.FS.CUR_FILTERS_LM'
,p_message_language=>'sl'
,p_message_text=>'Trenutni filtri'
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142436450979752384)
,p_name=>'APEX.FS.FACETED_SEARCH_NEEDS_REGION_QUERY'
,p_message_language=>'sl'
,p_message_text=>unistr('Za fasetno iskanje potrebujete vir podatkov na ravni podro\010Dja.')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142440155189752385)
,p_name=>'APEX.FS.FACETS_LIST'
,p_message_language=>'sl'
,p_message_text=>'Seznam filtrov'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142619291283752439)
,p_name=>'APEX.FS.FACET_VALUE_LIMIT_EXCEEDED'
,p_message_language=>'sl'
,p_message_text=>unistr('Razli\010Dna meja vrednosti (%0) je prese\017Eena za faseto %1.')
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142605596496752435)
,p_name=>'APEX.FS.FC_TYPE_UNSUPPORTED_FOR_DATE_COLUMNS'
,p_message_language=>'sl'
,p_message_text=>'Faseta %0 ni podprta za stolpce DATE ali TIMESTAMP.'
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142603630454752434)
,p_name=>'APEX.FS.FILTER'
,p_message_language=>'sl'
,p_message_text=>'Filter %0'
,p_is_js_message=>true
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142478255026752397)
,p_name=>'APEX.FS.FILTER_APPLIED'
,p_message_language=>'sl'
,p_message_text=>'%0 (Filter dodeljen)'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142603712824752434)
,p_name=>'APEX.FS.GO'
,p_message_language=>'sl'
,p_message_text=>'Pojdi'
,p_is_js_message=>true
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142473752078752395)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_C'
,p_message_language=>'sl'
,p_message_text=>'vsebuje %0'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142605110374752435)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_EQ'
,p_message_language=>'sl'
,p_message_text=>'Enako %0'
,p_is_js_message=>true
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142473463052752395)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_GT'
,p_message_language=>'sl'
,p_message_text=>unistr('ve\010D kot %0')
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142473598875752395)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_GTE'
,p_message_language=>'sl'
,p_message_text=>unistr('ve\010Dje kot ali enako %0')
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142473115622752395)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_LT'
,p_message_language=>'sl'
,p_message_text=>'manj kot %0'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142473361734752395)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_LTE'
,p_message_language=>'sl'
,p_message_text=>unistr('manj\0161e kot ali enako %0')
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142472654239752395)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NC'
,p_message_language=>'sl'
,p_message_text=>'ne vsebuje %0'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142458474788752391)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NEQ'
,p_message_language=>'sl'
,p_message_text=>'ni enako %0'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142472766674752395)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NSTARTS'
,p_message_language=>'sl'
,p_message_text=>unistr('se ne za\010Dne s/z %0')
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142473674761752395)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_STARTS'
,p_message_language=>'sl'
,p_message_text=>unistr('se za\010Dne s/z %0')
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142471785565752395)
,p_name=>'APEX.FS.INPUT_FACET_SELECTOR'
,p_message_language=>'sl'
,p_message_text=>'Izbira fasete'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142447561681752388)
,p_name=>'APEX.FS.INPUT_INVALID_FILTER_PREFIX'
,p_message_language=>'sl'
,p_message_text=>'Predpona filtra "%0" je neveljavna za faseto "%1".'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142445999259752387)
,p_name=>'APEX.FS.INPUT_MISSING_FILTER_PREFIX'
,p_message_language=>'sl'
,p_message_text=>'Predpona filtra manjka za faseto "%0".'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142480191641752397)
,p_name=>'APEX.FS.INPUT_OPERATOR'
,p_message_language=>'sl'
,p_message_text=>'Operator'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142462037191752392)
,p_name=>'APEX.FS.INPUT_OPERATOR.C'
,p_message_language=>'sl'
,p_message_text=>'vsebuje'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142461090618752392)
,p_name=>'APEX.FS.INPUT_OPERATOR.EQ'
,p_message_language=>'sl'
,p_message_text=>'je enako'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142461702357752392)
,p_name=>'APEX.FS.INPUT_OPERATOR.GT'
,p_message_language=>'sl'
,p_message_text=>unistr('ve\010Dje kot')
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142461814499752392)
,p_name=>'APEX.FS.INPUT_OPERATOR.GTE'
,p_message_language=>'sl'
,p_message_text=>unistr('ve\010Dje ali enako kot')
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142461405483752392)
,p_name=>'APEX.FS.INPUT_OPERATOR.LT'
,p_message_language=>'sl'
,p_message_text=>unistr('manj\0161e kot')
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142461574972752392)
,p_name=>'APEX.FS.INPUT_OPERATOR.LTE'
,p_message_language=>'sl'
,p_message_text=>unistr('manj\0161e kot ali enako')
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142472572118752395)
,p_name=>'APEX.FS.INPUT_OPERATOR.NC'
,p_message_language=>'sl'
,p_message_text=>'ne vsebuje'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142461238688752392)
,p_name=>'APEX.FS.INPUT_OPERATOR.NEQ'
,p_message_language=>'sl'
,p_message_text=>'ni enako'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142472432995752395)
,p_name=>'APEX.FS.INPUT_OPERATOR.NSTARTS'
,p_message_language=>'sl'
,p_message_text=>unistr('se ne za\010Dne s/z')
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142461966823752392)
,p_name=>'APEX.FS.INPUT_OPERATOR.STARTS'
,p_message_language=>'sl'
,p_message_text=>unistr('se za\010Dne s/z')
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142480551871752397)
,p_name=>'APEX.FS.INPUT_UNSUPPORTED_DATA_TYPE'
,p_message_language=>'sl'
,p_message_text=>'Podatkovni tip %0 (%1) ni podprt za faseto Vnosno polje.'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142447480440752388)
,p_name=>'APEX.FS.INPUT_UNSUPPORTED_FILTER_FOR_DATA_TYPE'
,p_message_language=>'sl'
,p_message_text=>'Filter "%0" ni podprt za faseto "%1" (podatkovni tip %2).'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142480046046752397)
,p_name=>'APEX.FS.INPUT_VALUE'
,p_message_language=>'sl'
,p_message_text=>'Vrednost'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142605394745752435)
,p_name=>'APEX.FS.NO_SEARCH_COLUMNS_PROVIDED'
,p_message_language=>'sl'
,p_message_text=>'Za faseto %0 niso bili zagotovljeni nobeni stolpci za iskanje'
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142431549877752383)
,p_name=>'APEX.FS.OPEN_CONFIG'
,p_message_language=>'sl'
,p_message_text=>unistr('Ve\010D filtrov')
,p_is_js_message=>true
,p_version_scn=>2705513
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142558136798752421)
,p_name=>'APEX.FS.RANGE_BEGIN'
,p_message_language=>'sl'
,p_message_text=>unistr('Za\010Detek razpona')
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142604827510752435)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL'
,p_message_language=>'sl'
,p_message_text=>'%0 do %1'
,p_is_js_message=>true
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142604915129752435)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL_OPEN_HI'
,p_message_language=>'sl'
,p_message_text=>'Nad %0'
,p_is_js_message=>true
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142605077031752435)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL_OPEN_LO'
,p_message_language=>'sl'
,p_message_text=>'Pod %0'
,p_is_js_message=>true
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142558201431752421)
,p_name=>'APEX.FS.RANGE_END'
,p_message_language=>'sl'
,p_message_text=>'Konec razpona'
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142622821004752440)
,p_name=>'APEX.FS.RANGE_LOV_ITEM_INVALID'
,p_message_language=>'sl'
,p_message_text=>unistr('Element seznama vrednosti #%2 ("%1") za faseto razpona %0 je neveljaven (manjka lo\010Dilo "|").')
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142605234952752435)
,p_name=>'APEX.FS.RANGE_MANUAL_NOT_SUPPORTED'
,p_message_language=>'sl'
,p_message_text=>unistr('Ro\010Dni vnos za faseto Razpon %0 trenutno ni podprt, ker je stolpec DATE ali TIMESTAMP.')
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142604559836752435)
,p_name=>'APEX.FS.RANGE_TEXT'
,p_message_language=>'sl'
,p_message_text=>'do'
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142468163165752394)
,p_name=>'APEX.FS.REMOVE_CHART'
,p_message_language=>'sl'
,p_message_text=>'Odstrani grafikon'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142554592671752419)
,p_name=>'APEX.FS.RESET'
,p_message_language=>'sl'
,p_message_text=>'Ponastavi'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142603922997752434)
,p_name=>'APEX.FS.SEARCH_LABEL'
,p_message_language=>'sl'
,p_message_text=>'Iskanje'
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142603898907752434)
,p_name=>'APEX.FS.SEARCH_PLACEHOLDER'
,p_message_language=>'sl'
,p_message_text=>unistr('I\0161\010Di ...')
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142604766826752435)
,p_name=>'APEX.FS.SELECT_PLACEHOLDER'
,p_message_language=>'sl'
,p_message_text=>'- Izbira -'
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142467947744752394)
,p_name=>'APEX.FS.SHOW_CHART'
,p_message_language=>'sl'
,p_message_text=>'Prikaz grafikona'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142604345727752434)
,p_name=>'APEX.FS.SHOW_LESS'
,p_message_language=>'sl'
,p_message_text=>unistr('Prika\017Ei manj')
,p_is_js_message=>true
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142604425369752435)
,p_name=>'APEX.FS.SHOW_MORE'
,p_message_language=>'sl'
,p_message_text=>unistr('Prika\017Ei vse')
,p_is_js_message=>true
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142604649161752435)
,p_name=>'APEX.FS.STAR_RATING_LABEL'
,p_message_language=>'sl'
,p_message_text=>unistr('Toliko zvezdic in ve\010D: %0')
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142559868358752421)
,p_name=>'APEX.FS.SUGGESTIONS'
,p_message_language=>'sl'
,p_message_text=>'Filtriraj predloge'
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142605462017752435)
,p_name=>'APEX.FS.TEXT_FIELD_ONLY_FOR_NUMBER_COLUMNS'
,p_message_language=>'sl'
,p_message_text=>'Faseta Besedilno polje %0 je trenutno podprta le za stolpce NUMBER.'
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142430983353752383)
,p_name=>'APEX.FS.TOTAL_ROW_COUNT_LABEL'
,p_message_language=>'sl'
,p_message_text=>unistr('Skupno \0161tevilo vrstic')
,p_version_scn=>2705512
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142620841551752439)
,p_name=>'APEX.FS.UNSUPPORTED_DATA_TYPE'
,p_message_language=>'sl'
,p_message_text=>'Podatkovni tip %0 (%1) ni podprt za fasetno iskanje.'
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142551050011752418)
,p_name=>'APEX.FS.VISUALLY_HIDDEN_HEADING'
,p_message_language=>'sl'
,p_message_text=>'Vizualno skrit naslov'
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142613302681752437)
,p_name=>'APEX.GO_TO_ERROR'
,p_message_language=>'sl'
,p_message_text=>'Pojdi na napako'
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142569300808752424)
,p_name=>'APEX.GV.AGG_CONTEXT'
,p_message_language=>'sl'
,p_message_text=>unistr('Zdru\017Eevanje.')
,p_is_js_message=>true
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142497239355752402)
,p_name=>'APEX.GV.BLANK_HEADING'
,p_message_language=>'sl'
,p_message_text=>'Prazen naslov'
,p_is_js_message=>true
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142578638679752427)
,p_name=>'APEX.GV.BREAK_COLLAPSE'
,p_message_language=>'sl'
,p_message_text=>'Strni kontrolni prelom'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142569437785752424)
,p_name=>'APEX.GV.BREAK_CONTEXT'
,p_message_language=>'sl'
,p_message_text=>'Kontrolni prelom.'
,p_is_js_message=>true
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142578566858752427)
,p_name=>'APEX.GV.BREAK_EXPAND'
,p_message_language=>'sl'
,p_message_text=>unistr('Raz\0161iri kontrolni prelom')
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142578399501752427)
,p_name=>'APEX.GV.DELETED_COUNT'
,p_message_language=>'sl'
,p_message_text=>unistr('\0160t. izbrisanih vrstic: %0')
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142647431089752447)
,p_name=>'APEX.GV.DUP_REC_ID'
,p_message_language=>'sl'
,p_message_text=>'Podvojena identiteta'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142440308694752385)
,p_name=>'APEX.GV.ENTER_EDIT_MODE'
,p_message_language=>'sl'
,p_message_text=>unistr('Vstopanje v na\010Din urejanja')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142566275194752423)
,p_name=>'APEX.GV.FIRST_PAGE'
,p_message_language=>'sl'
,p_message_text=>'Prvi'
,p_is_js_message=>true
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142439197832752385)
,p_name=>'APEX.GV.FLOATING_ITEM.DIALOG.HIDE_DIALOG'
,p_message_language=>'sl'
,p_message_text=>'Skrij pogovorno okno'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142438135796752385)
,p_name=>'APEX.GV.FLOATING_ITEM.DIALOG.TITLE'
,p_message_language=>'sl'
,p_message_text=>unistr('Plavajo\010Di prese\017Eek vsebine celice')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142439498157752385)
,p_name=>'APEX.GV.FLOATING_ITEM.SHOW_DIALOG'
,p_message_language=>'sl'
,p_message_text=>unistr('Prika\017Ei prese\017Eek vsebine')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142513664597752407)
,p_name=>'APEX.GV.FOOTER_LANDMARK'
,p_message_language=>'sl'
,p_message_text=>unistr('Noga mre\017Ee')
,p_is_js_message=>true
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142569692117752424)
,p_name=>'APEX.GV.GROUP_CONTEXT'
,p_message_language=>'sl'
,p_message_text=>'Glava skupine'
,p_is_js_message=>true
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142569542080752424)
,p_name=>'APEX.GV.HEADER_CONTEXT'
,p_message_language=>'sl'
,p_message_text=>'Glava.'
,p_is_js_message=>true
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142566314410752423)
,p_name=>'APEX.GV.LAST_PAGE'
,p_message_language=>'sl'
,p_message_text=>'Zadnji'
,p_is_js_message=>true
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142440597125752386)
,p_name=>'APEX.GV.LEAVE_EDIT_MODE'
,p_message_language=>'sl'
,p_message_text=>unistr('Zapu\0161\010Danje na\010Dina urejanja')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142465207296752393)
,p_name=>'APEX.GV.LOAD_ALL'
,p_message_language=>'sl'
,p_message_text=>unistr('Nalo\017Ei vse')
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142588190154752430)
,p_name=>'APEX.GV.LOAD_MORE'
,p_message_language=>'sl'
,p_message_text=>unistr('Prika\017Ei ve\010D')
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142566040708752423)
,p_name=>'APEX.GV.NEXT_PAGE'
,p_message_language=>'sl'
,p_message_text=>'Naprej'
,p_is_js_message=>true
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142569760622752424)
,p_name=>'APEX.GV.PAGE_RANGE'
,p_message_language=>'sl'
,p_message_text=>'Vrstice strani'
,p_is_js_message=>true
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142478882052752397)
,p_name=>'APEX.GV.PAGE_RANGE_ENTITY'
,p_message_language=>'sl'
,p_message_text=>'Stran %0'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142566401081752423)
,p_name=>'APEX.GV.PAGE_RANGE_XY'
,p_message_language=>'sl'
,p_message_text=>'%0 - %1'
,p_is_js_message=>true
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142566549854752423)
,p_name=>'APEX.GV.PAGE_RANGE_XYZ'
,p_message_language=>'sl'
,p_message_text=>'%0 - %1 od %2'
,p_is_js_message=>true
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142623494626752440)
,p_name=>'APEX.GV.PAGE_SELECTION'
,p_message_language=>'sl'
,p_message_text=>'Izbira strani'
,p_is_js_message=>true
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142513978077752407)
,p_name=>'APEX.GV.PAGINATION_LANDMARK'
,p_message_language=>'sl'
,p_message_text=>unistr('\0160tevil\010Denje strani')
,p_is_js_message=>true
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142566177202752423)
,p_name=>'APEX.GV.PREV_PAGE'
,p_message_language=>'sl'
,p_message_text=>'Nazaj'
,p_is_js_message=>true
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142464153560752393)
,p_name=>'APEX.GV.RANGE_DISPLAY'
,p_message_language=>'sl'
,p_message_text=>'Prikaz razpona'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142497556180752402)
,p_name=>'APEX.GV.ROWS_SELECTION'
,p_message_language=>'sl'
,p_message_text=>'Izbira vrstic'
,p_is_js_message=>true
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142647245249752447)
,p_name=>'APEX.GV.ROW_ADDED'
,p_message_language=>'sl'
,p_message_text=>'Dodano'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142647371634752447)
,p_name=>'APEX.GV.ROW_CHANGED'
,p_message_language=>'sl'
,p_message_text=>'Spremenjeno'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142655617253752450)
,p_name=>'APEX.GV.ROW_COLUMN_CONTEXT'
,p_message_language=>'sl'
,p_message_text=>unistr('Zaporedje vrstic mre\017Ee %0, stolpec %1.')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142655762932752450)
,p_name=>'APEX.GV.ROW_CONTEXT'
,p_message_language=>'sl'
,p_message_text=>unistr('Zaporedje vrstic mre\017Ee %0.')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142647159150752447)
,p_name=>'APEX.GV.ROW_DELETED'
,p_message_language=>'sl'
,p_message_text=>'Izbrisano'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142569911464752424)
,p_name=>'APEX.GV.ROW_HEADER'
,p_message_language=>'sl'
,p_message_text=>'Glava strani'
,p_is_js_message=>true
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142497466403752402)
,p_name=>'APEX.GV.ROW_SELECTION'
,p_message_language=>'sl'
,p_message_text=>'Izbira vrstice'
,p_is_js_message=>true
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142465357613752393)
,p_name=>'APEX.GV.SELECTED_ENTITY_COUNT'
,p_message_language=>'sl'
,p_message_text=>'Izbrano: %0 %1'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142565483121752423)
,p_name=>'APEX.GV.SELECTION_CELL_COUNT'
,p_message_language=>'sl'
,p_message_text=>unistr('\0160t. izbranih celic: %0')
,p_is_js_message=>true
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142566652734752423)
,p_name=>'APEX.GV.SELECTION_COUNT'
,p_message_language=>'sl'
,p_message_text=>unistr('\0160t. izbranih vrstic: %0')
,p_is_js_message=>true
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142608798404752436)
,p_name=>'APEX.GV.SELECT_ALL'
,p_message_language=>'sl'
,p_message_text=>'Izberi vse'
,p_is_js_message=>true
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142502233748752404)
,p_name=>'APEX.GV.SELECT_ALL_ROWS'
,p_message_language=>'sl'
,p_message_text=>'Izberi vse vrstice'
,p_is_js_message=>true
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142578479240752427)
,p_name=>'APEX.GV.SELECT_PAGE_N'
,p_message_language=>'sl'
,p_message_text=>'Stran %0'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142569817496752424)
,p_name=>'APEX.GV.SELECT_ROW'
,p_message_language=>'sl'
,p_message_text=>'Izbira vrstice'
,p_is_js_message=>true
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142570140886752424)
,p_name=>'APEX.GV.SORTED_ASCENDING'
,p_message_language=>'sl'
,p_message_text=>unistr('Razvr\0161\010Deno nara\0161\010Dajo\010De %0')
,p_is_js_message=>true
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142570261476752424)
,p_name=>'APEX.GV.SORTED_DESCENDING'
,p_message_language=>'sl'
,p_message_text=>unistr('Razvr\0161\010Deno padajo\010De %0')
,p_is_js_message=>true
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142565545063752423)
,p_name=>'APEX.GV.SORT_ASCENDING'
,p_message_language=>'sl'
,p_message_text=>unistr('Razvrsti nara\0161\010Dajo\010De')
,p_is_js_message=>true
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142565840428752423)
,p_name=>'APEX.GV.SORT_ASCENDING_ORDER'
,p_message_language=>'sl'
,p_message_text=>unistr('Razvrsti nara\0161\010Dajo\010De %0')
,p_is_js_message=>true
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142565681258752423)
,p_name=>'APEX.GV.SORT_DESCENDING'
,p_message_language=>'sl'
,p_message_text=>unistr('Razvrsti padajo\010De')
,p_is_js_message=>true
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142565986877752423)
,p_name=>'APEX.GV.SORT_DESCENDING_ORDER'
,p_message_language=>'sl'
,p_message_text=>unistr('Razvrsti padajo\010De %0')
,p_is_js_message=>true
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142565749161752423)
,p_name=>'APEX.GV.SORT_OFF'
,p_message_language=>'sl'
,p_message_text=>unistr('Ne razvr\0161\010Daj')
,p_is_js_message=>true
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142431354635752383)
,p_name=>'APEX.GV.SORT_OPTIONS'
,p_message_language=>'sl'
,p_message_text=>unistr('Mo\017Enosti razvr\0161\010Danja')
,p_is_js_message=>true
,p_version_scn=>2705512
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142513778654752407)
,p_name=>'APEX.GV.STATE_ICONS_LANDMARK'
,p_message_language=>'sl'
,p_message_text=>'Ikone stanja'
,p_is_js_message=>true
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142513804358752407)
,p_name=>'APEX.GV.STATUS_LANDMARK'
,p_message_language=>'sl'
,p_message_text=>unistr('Status mre\017Ee')
,p_is_js_message=>true
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142443690988752386)
,p_name=>'APEX.GV.TOTAL_ENTITY_PLURAL'
,p_message_language=>'sl'
,p_message_text=>'%0 %1'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142443385805752386)
,p_name=>'APEX.GV.TOTAL_ENTITY_SINGULAR'
,p_message_language=>'sl'
,p_message_text=>'1 %0'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142578208330752427)
,p_name=>'APEX.GV.TOTAL_PAGES'
,p_message_language=>'sl'
,p_message_text=>'Skupno %0'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142497038409752402)
,p_name=>'APEX.HTTP.REQUEST_FAILED'
,p_message_language=>'sl'
,p_message_text=>'Zahteva HTTP za "%0" ni uspela.'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142498650234752403)
,p_name=>'APEX.ICON_LIST.COLUMN'
,p_message_language=>'sl'
,p_message_text=>'Stolpec %0'
,p_is_js_message=>true
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142498881525752403)
,p_name=>'APEX.ICON_LIST.COLUMN_AND_ROW'
,p_message_language=>'sl'
,p_message_text=>'Stolpec %0 in vrstica %1'
,p_is_js_message=>true
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142499157584752403)
,p_name=>'APEX.ICON_LIST.FIRST_COLUMN'
,p_message_language=>'sl'
,p_message_text=>unistr('\017De v prvem stolpcu. Stolpec %0 in vrstica %1')
,p_is_js_message=>true
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142499053081752403)
,p_name=>'APEX.ICON_LIST.FIRST_ROW'
,p_message_language=>'sl'
,p_message_text=>unistr('\017De v prvi vrsti. Stolpec %0 in vrstica %1')
,p_is_js_message=>true
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142644682669752447)
,p_name=>'APEX.ICON_LIST.GRID_DIM'
,p_message_language=>'sl'
,p_message_text=>'Predstavljeno v %0 stolpcih in %1 vrsticah'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142499243035752403)
,p_name=>'APEX.ICON_LIST.LAST_COLUMN'
,p_message_language=>'sl'
,p_message_text=>unistr('\017De v zadnjem stolpcu. Stolpec %0 in vrstica %1')
,p_is_js_message=>true
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142498909581752403)
,p_name=>'APEX.ICON_LIST.LAST_ROW'
,p_message_language=>'sl'
,p_message_text=>unistr('\017De v zadnji vrstici. Stolpec %0 in vrstica %1')
,p_is_js_message=>true
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142578125201752427)
,p_name=>'APEX.ICON_LIST.LIST_DIM'
,p_message_language=>'sl'
,p_message_text=>'Predstavljeno v %0 vrsticah'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142498767055752403)
,p_name=>'APEX.ICON_LIST.ROW'
,p_message_language=>'sl'
,p_message_text=>'Vrstica %0'
,p_is_js_message=>true
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142655464100752450)
,p_name=>'APEX.IG.ACC_LABEL'
,p_message_language=>'sl'
,p_message_text=>unistr('Interaktivna mre\017Ea %0')
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142562590744752422)
,p_name=>'APEX.IG.ACTIONS'
,p_message_language=>'sl'
,p_message_text=>'Dejanja'
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142563566038752422)
,p_name=>'APEX.IG.ADD'
,p_message_language=>'sl'
,p_message_text=>'Dodaj'
,p_is_js_message=>true
,p_version_scn=>2705535
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142563468037752422)
,p_name=>'APEX.IG.ADD_ROW'
,p_message_language=>'sl'
,p_message_text=>'Dodaj vrstico'
,p_is_js_message=>true
,p_version_scn=>2705535
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142649007435752448)
,p_name=>'APEX.IG.AGGREGATE'
,p_message_language=>'sl'
,p_message_text=>unistr('Zdru\017Eevanje')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142634653251752444)
,p_name=>'APEX.IG.AGGREGATION'
,p_message_language=>'sl'
,p_message_text=>unistr('Zdru\017Eevanje')
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142636311103752444)
,p_name=>'APEX.IG.ALL'
,p_message_language=>'sl'
,p_message_text=>'Vse'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142593931046752431)
,p_name=>'APEX.IG.ALL_TEXT_COLUMNS'
,p_message_language=>'sl'
,p_message_text=>'Vsi besedilni stolpci'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142595135214752432)
,p_name=>'APEX.IG.ALTERNATIVE'
,p_message_language=>'sl'
,p_message_text=>'Nadomestno'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142596237287752432)
,p_name=>'APEX.IG.AND'
,p_message_language=>'sl'
,p_message_text=>'in'
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142615695553752438)
,p_name=>'APEX.IG.APPROX_COUNT_DISTINCT'
,p_message_language=>'sl'
,p_message_text=>unistr('Pribl. \0161tevilo razli\010Dnih')
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142650018453752448)
,p_name=>'APEX.IG.APPROX_COUNT_DISTINCT_OVERALL'
,p_message_language=>'sl'
,p_message_text=>unistr('Skupno pribl. \0161tevilo razli\010Dnih')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142633200180752443)
,p_name=>'APEX.IG.AREA'
,p_message_language=>'sl'
,p_message_text=>unistr('Obmo\010Dje')
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142635101736752444)
,p_name=>'APEX.IG.ASCENDING'
,p_message_language=>'sl'
,p_message_text=>unistr('Nara\0161\010Dajo\010De')
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142595259769752432)
,p_name=>'APEX.IG.AUTHORIZATION'
,p_message_language=>'sl'
,p_message_text=>'Odobritev'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142649111265752448)
,p_name=>'APEX.IG.AUTO'
,p_message_language=>'sl'
,p_message_text=>'Samodejno'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142616098132752438)
,p_name=>'APEX.IG.AVG'
,p_message_language=>'sl'
,p_message_text=>unistr('Povpre\010Dje')
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142649762943752448)
,p_name=>'APEX.IG.AVG_OVERALL'
,p_message_language=>'sl'
,p_message_text=>unistr('Skupno povpre\010Dje')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142632793517752443)
,p_name=>'APEX.IG.AXIS_LABEL_TITLE'
,p_message_language=>'sl'
,p_message_text=>'Naslov osi oznake'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142632968393752443)
,p_name=>'APEX.IG.AXIS_VALUE_DECIMAL'
,p_message_language=>'sl'
,p_message_text=>'Decimalna mesta'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142632848907752443)
,p_name=>'APEX.IG.AXIS_VALUE_TITLE'
,p_message_language=>'sl'
,p_message_text=>'Naslov osi vrednosti'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142638969512752445)
,p_name=>'APEX.IG.BACKGROUND_COLOR'
,p_message_language=>'sl'
,p_message_text=>'Barva ozadja'
,p_is_js_message=>true
,p_version_scn=>2705551
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142633337225752443)
,p_name=>'APEX.IG.BAR'
,p_message_language=>'sl'
,p_message_text=>'Vrstica'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142590534363752430)
,p_name=>'APEX.IG.BETWEEN'
,p_message_language=>'sl'
,p_message_text=>'med'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142640100989752445)
,p_name=>'APEX.IG.BOTH'
,p_message_language=>'sl'
,p_message_text=>'Oboje'
,p_is_js_message=>true
,p_version_scn=>2705551
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142633401919752443)
,p_name=>'APEX.IG.BUBBLE'
,p_message_language=>'sl'
,p_message_text=>unistr('Mehur\010Dek')
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142563738630752422)
,p_name=>'APEX.IG.CANCEL'
,p_message_language=>'sl'
,p_message_text=>unistr('Prekli\010Di')
,p_is_js_message=>true
,p_version_scn=>2705535
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142596100877752432)
,p_name=>'APEX.IG.CASE_SENSITIVE'
,p_message_language=>'sl'
,p_message_text=>unistr('Upo\0161tevaj velike/male \010Drke')
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142650660902752448)
,p_name=>'APEX.IG.CASE_SENSITIVE_WITH_BRACKETS'
,p_message_language=>'sl'
,p_message_text=>unistr('(Upo\0161tevaj velike/male \010Drke)')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142621973470752440)
,p_name=>'APEX.IG.CHANGES_SAVED'
,p_message_language=>'sl'
,p_message_text=>'Spremembe shranjene'
,p_is_js_message=>true
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142564178590752422)
,p_name=>'APEX.IG.CHANGE_VIEW'
,p_message_language=>'sl'
,p_message_text=>'Sprememba pogleda'
,p_is_js_message=>true
,p_version_scn=>2705535
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142597216266752432)
,p_name=>'APEX.IG.CHART'
,p_message_language=>'sl'
,p_message_text=>'Grafikon'
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142593790074752431)
,p_name=>'APEX.IG.CHART_MAX_DATAPOINT_CNT'
,p_message_language=>'sl'
,p_message_text=>unistr('Va\0161a poizvedba presega maksimalno \0161tevilo podatkovnih to\010Dk %0 na grafikon. Uporabite filter, da zmanj\0161ate \0161tevilo zapisov v osnovni poizvedbi.')
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142562450363752422)
,p_name=>'APEX.IG.CHART_VIEW'
,p_message_language=>'sl'
,p_message_text=>'Pogled grafikona'
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142570845719752424)
,p_name=>'APEX.IG.CLEAR'
,p_message_language=>'sl'
,p_message_text=>unistr('Po\010Disti')
,p_is_js_message=>true
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142632227856752443)
,p_name=>'APEX.IG.CLOSE_COLUMN'
,p_message_language=>'sl'
,p_message_text=>'Zapri'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142639124369752445)
,p_name=>'APEX.IG.COLORS'
,p_message_language=>'sl'
,p_message_text=>'Barve'
,p_is_js_message=>true
,p_version_scn=>2705551
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142616401698752438)
,p_name=>'APEX.IG.COLOR_PREVIEW'
,p_message_language=>'sl'
,p_message_text=>'Predogled'
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142595514791752432)
,p_name=>'APEX.IG.COLUMN'
,p_message_language=>'sl'
,p_message_text=>'Stolpec'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142562624531752422)
,p_name=>'APEX.IG.COLUMNS'
,p_message_language=>'sl'
,p_message_text=>'Stolpci'
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142524558554752411)
,p_name=>'APEX.IG.COLUMN_HEADER_ACTIONS'
,p_message_language=>'sl'
,p_message_text=>'Dejanja stolpca'
,p_is_js_message=>true
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142524306294752410)
,p_name=>'APEX.IG.COLUMN_HEADER_ACTIONS_FOR'
,p_message_language=>'sl'
,p_message_text=>'Dejanja za stolpec "%0"'
,p_is_js_message=>true
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142640908018752445)
,p_name=>'APEX.IG.COLUMN_TYPE'
,p_message_language=>'sl'
,p_message_text=>'Namen stolpca'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142595607326752432)
,p_name=>'APEX.IG.COMPLEX'
,p_message_language=>'sl'
,p_message_text=>'Zapleteno'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142562804257752422)
,p_name=>'APEX.IG.COMPUTE'
,p_message_language=>'sl'
,p_message_text=>unistr('Izra\010Dun')
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142591187972752431)
,p_name=>'APEX.IG.CONTAINS'
,p_message_language=>'sl'
,p_message_text=>'vsebuje'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142597493444752432)
,p_name=>'APEX.IG.CONTROL_BREAK'
,p_message_language=>'sl'
,p_message_text=>'Kontrolni prelom'
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142570619116752424)
,p_name=>'APEX.IG.COPY_CB'
,p_message_language=>'sl'
,p_message_text=>unistr('Kopiraj v odlo\017Ei\0161\010De')
,p_is_js_message=>true
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142570749524752424)
,p_name=>'APEX.IG.COPY_DOWN'
,p_message_language=>'sl'
,p_message_text=>'Kopiranje navzdol'
,p_is_js_message=>true
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142615493366752438)
,p_name=>'APEX.IG.COUNT'
,p_message_language=>'sl'
,p_message_text=>unistr('\0160tevilo')
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142615523837752438)
,p_name=>'APEX.IG.COUNT_DISTINCT'
,p_message_language=>'sl'
,p_message_text=>unistr('\0160tevilo razli\010Dnih')
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142649966685752448)
,p_name=>'APEX.IG.COUNT_DISTINCT_OVERALL'
,p_message_language=>'sl'
,p_message_text=>unistr('Skupno \0161tevilo razli\010Dnih')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142649837953752448)
,p_name=>'APEX.IG.COUNT_OVERALL'
,p_message_language=>'sl'
,p_message_text=>unistr('Skupno \0161tevilo')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142647554422752447)
,p_name=>'APEX.IG.CREATE_X'
,p_message_language=>'sl'
,p_message_text=>'Ustvari %0'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142594194407752431)
,p_name=>'APEX.IG.DATA'
,p_message_language=>'sl'
,p_message_text=>'Podatki'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142640724074752445)
,p_name=>'APEX.IG.DATA_TYPE'
,p_message_language=>'sl'
,p_message_text=>'Podatkovni tip'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142640302667752445)
,p_name=>'APEX.IG.DATE'
,p_message_language=>'sl'
,p_message_text=>'Datum'
,p_is_js_message=>true
,p_version_scn=>2705551
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142621764887752440)
,p_name=>'APEX.IG.DATE_INVALID_VALUE'
,p_message_language=>'sl'
,p_message_text=>'Neveljavna vrednost datuma'
,p_is_js_message=>true
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142591892217752431)
,p_name=>'APEX.IG.DAYS'
,p_message_language=>'sl'
,p_message_text=>'dnevi'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142594815084752432)
,p_name=>'APEX.IG.DEFAULT_SETTINGS'
,p_message_language=>'sl'
,p_message_text=>'Privzete nastavitve'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142594633020752432)
,p_name=>'APEX.IG.DEFAULT_TYPE'
,p_message_language=>'sl'
,p_message_text=>'Privzeti tip'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142563616578752422)
,p_name=>'APEX.IG.DELETE'
,p_message_language=>'sl'
,p_message_text=>unistr('Izbri\0161i')
,p_is_js_message=>true
,p_version_scn=>2705535
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142641820345752446)
,p_name=>'APEX.IG.DELETE_REPORT_CONFIRM'
,p_message_language=>'sl'
,p_message_text=>unistr('Ali ste prepri\010Dani, da \017Eelite izbrisati to poro\010Dilo?')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142599248357752433)
,p_name=>'APEX.IG.DELETE_ROW'
,p_message_language=>'sl'
,p_message_text=>unistr('Izbri\0161i vrstico')
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142598010037752433)
,p_name=>'APEX.IG.DELETE_ROWS'
,p_message_language=>'sl'
,p_message_text=>unistr('Izbri\0161i vrstice')
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142635214794752444)
,p_name=>'APEX.IG.DESCENDING'
,p_message_language=>'sl'
,p_message_text=>unistr('Padajo\010De')
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142596989614752432)
,p_name=>'APEX.IG.DETAIL'
,p_message_language=>'sl'
,p_message_text=>'Podrobnost'
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142562145959752422)
,p_name=>'APEX.IG.DETAIL_VIEW'
,p_message_language=>'sl'
,p_message_text=>'Podroben pogled'
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142624250696752440)
,p_name=>'APEX.IG.DIRECTION'
,p_message_language=>'sl'
,p_message_text=>'Smer'
,p_is_js_message=>true
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142596656158752432)
,p_name=>'APEX.IG.DISABLED'
,p_message_language=>'sl'
,p_message_text=>unistr('Onemogo\010Deno')
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142591241293752431)
,p_name=>'APEX.IG.DOES_NOT_CONTAIN'
,p_message_language=>'sl'
,p_message_text=>'ne vsebuje'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142591467870752431)
,p_name=>'APEX.IG.DOES_NOT_START_WITH'
,p_message_language=>'sl'
,p_message_text=>unistr('se ne za\010Dne s/z')
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142633567992752443)
,p_name=>'APEX.IG.DONUT'
,p_message_language=>'sl'
,p_message_text=>'Kolobar'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142597692529752432)
,p_name=>'APEX.IG.DOWNLOAD'
,p_message_language=>'sl'
,p_message_text=>'Prenos'
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142487943728752400)
,p_name=>'APEX.IG.DOWNLOAD_DATA_ONLY'
,p_message_language=>'sl'
,p_message_text=>'Samo podatki'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142642874622752446)
,p_name=>'APEX.IG.DOWNLOAD_FORMAT'
,p_message_language=>'sl'
,p_message_text=>'Izbira formata'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142503027649752404)
,p_name=>'APEX.IG.DOWNLOAD_FORMAT_NOT_ENABLED'
,p_message_language=>'sl'
,p_message_text=>unistr('Format prenosa %0 ni omogo\010Den.')
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142635949446752444)
,p_name=>'APEX.IG.DUPLICATE_AGGREGATION'
,p_message_language=>'sl'
,p_message_text=>unistr('Podvojeno zdru\017Eevanje')
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142636067666752444)
,p_name=>'APEX.IG.DUPLICATE_CONTROLBREAK'
,p_message_language=>'sl'
,p_message_text=>'Podvojen kontrolni prelom'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142599169973752433)
,p_name=>'APEX.IG.DUPLICATE_ROW'
,p_message_language=>'sl'
,p_message_text=>'Podvoji vrstico'
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142597922561752433)
,p_name=>'APEX.IG.DUPLICATE_ROWS'
,p_message_language=>'sl'
,p_message_text=>'Podvojene vrstice'
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142563225043752422)
,p_name=>'APEX.IG.EDIT'
,p_message_language=>'sl'
,p_message_text=>'Uredi'
,p_is_js_message=>true
,p_version_scn=>2705535
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142635074135752444)
,p_name=>'APEX.IG.EDIT_CHART'
,p_message_language=>'sl'
,p_message_text=>'Uredi grafikon'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142515597401752408)
,p_name=>'APEX.IG.EDIT_CONTROL'
,p_message_language=>'sl'
,p_message_text=>'Urejanje %0'
,p_is_js_message=>true
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142646409967752447)
,p_name=>'APEX.IG.EDIT_GROUP_BY'
,p_message_language=>'sl'
,p_message_text=>'Uredi grupiranje'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142553669802752419)
,p_name=>'APEX.IG.EDIT_MODE'
,p_message_language=>'sl'
,p_message_text=>unistr('%0 v na\010Dinu urejanja')
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142529240548752412)
,p_name=>'APEX.IG.EDIT_MODE_DESCRIPTION'
,p_message_language=>'sl'
,p_message_text=>unistr('Mre\017Ea v na\010Dinu urejanja, prekli\010Dite pritisk za preklop v na\010Din ogleda')
,p_is_js_message=>true
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142642452681752446)
,p_name=>'APEX.IG.EMAIL_BCC'
,p_message_language=>'sl'
,p_message_text=>'Slepa kopija (Skp)'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142642625735752446)
,p_name=>'APEX.IG.EMAIL_BODY'
,p_message_language=>'sl'
,p_message_text=>unistr('Sporo\010Dilo')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142642354619752446)
,p_name=>'APEX.IG.EMAIL_CC'
,p_message_language=>'sl'
,p_message_text=>'Kopija (Kp)'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142642067041752446)
,p_name=>'APEX.IG.EMAIL_SENT'
,p_message_language=>'sl'
,p_message_text=>unistr('E-po\0161tno sporo\010Dilo je poslano.')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142642521845752446)
,p_name=>'APEX.IG.EMAIL_SUBJECT'
,p_message_language=>'sl'
,p_message_text=>'Zadeva'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142642202068752446)
,p_name=>'APEX.IG.EMAIL_TO'
,p_message_language=>'sl'
,p_message_text=>'Prejemnik (Za)'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142596355190752432)
,p_name=>'APEX.IG.ENABLED'
,p_message_language=>'sl'
,p_message_text=>unistr('Omogo\010Deno')
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142589557623752430)
,p_name=>'APEX.IG.EQUALS'
,p_message_language=>'sl'
,p_message_text=>'je enako'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142596433730752432)
,p_name=>'APEX.IG.EXPRESSION'
,p_message_language=>'sl'
,p_message_text=>'Izraz'
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142641497019752446)
,p_name=>'APEX.IG.FD_TYPE'
,p_message_language=>'sl'
,p_message_text=>'Tip'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142608687853752436)
,p_name=>'APEX.IG.FILE_PREPARED'
,p_message_language=>'sl'
,p_message_text=>unistr('Datoteka je pripravljena. Za\010Detek prenosa.')
,p_is_js_message=>true
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142570972609752424)
,p_name=>'APEX.IG.FILL'
,p_message_language=>'sl'
,p_message_text=>'Zapolnitev'
,p_is_js_message=>true
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142573184003752425)
,p_name=>'APEX.IG.FILL_LABEL'
,p_message_language=>'sl'
,p_message_text=>'Zapolnitev izbire s/z'
,p_is_js_message=>true
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142573008948752425)
,p_name=>'APEX.IG.FILL_TITLE'
,p_message_language=>'sl'
,p_message_text=>'Zapolnitev izbire'
,p_is_js_message=>true
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142562713577752422)
,p_name=>'APEX.IG.FILTER'
,p_message_language=>'sl'
,p_message_text=>'Filter'
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142595754601752432)
,p_name=>'APEX.IG.FILTERS'
,p_message_language=>'sl'
,p_message_text=>'Filtri'
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142649483770752448)
,p_name=>'APEX.IG.FILTER_WITH_DOTS'
,p_message_language=>'sl'
,p_message_text=>'Filtriranje ...'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142635438413752444)
,p_name=>'APEX.IG.FIRST'
,p_message_language=>'sl'
,p_message_text=>'Prvi'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142562911621752422)
,p_name=>'APEX.IG.FLASHBACK'
,p_message_language=>'sl'
,p_message_text=>'Pogled nazaj'
,p_is_js_message=>true
,p_version_scn=>2705535
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142594242739752431)
,p_name=>'APEX.IG.FORMAT'
,p_message_language=>'sl'
,p_message_text=>'Format'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142640069638752445)
,p_name=>'APEX.IG.FORMATMASK'
,p_message_language=>'sl'
,p_message_text=>'Maska formata'
,p_is_js_message=>true
,p_version_scn=>2705551
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142641719157752446)
,p_name=>'APEX.IG.FORMAT_CSV'
,p_message_language=>'sl'
,p_message_text=>'CSV'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142641601636752446)
,p_name=>'APEX.IG.FORMAT_HTML'
,p_message_language=>'sl'
,p_message_text=>'HTML'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142552737516752419)
,p_name=>'APEX.IG.FORMAT_PDF'
,p_message_language=>'sl'
,p_message_text=>'PDF'
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142486688442752399)
,p_name=>'APEX.IG.FORMAT_XLSX'
,p_message_language=>'sl'
,p_message_text=>'Excel'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142598848222752433)
,p_name=>'APEX.IG.FREEZE'
,p_message_language=>'sl'
,p_message_text=>'Zamrzni'
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142596542678752432)
,p_name=>'APEX.IG.FUNCTIONS_AND_OPERATORS'
,p_message_language=>'sl'
,p_message_text=>'Funkcije in operatorji'
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142633621279752443)
,p_name=>'APEX.IG.FUNNEL'
,p_message_language=>'sl'
,p_message_text=>'Lijak'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142615317588752438)
,p_name=>'APEX.IG.GO'
,p_message_language=>'sl'
,p_message_text=>'Pojdi'
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142590160951752430)
,p_name=>'APEX.IG.GREATER_THAN'
,p_message_language=>'sl'
,p_message_text=>unistr('ve\010Dje kot')
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142590205878752430)
,p_name=>'APEX.IG.GREATER_THAN_OR_EQUALS'
,p_message_language=>'sl'
,p_message_text=>unistr('ve\010Dje kot ali enako')
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142596868376752432)
,p_name=>'APEX.IG.GRID'
,p_message_language=>'sl'
,p_message_text=>unistr('Mre\017Ea')
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142561914466752422)
,p_name=>'APEX.IG.GRID_VIEW'
,p_message_language=>'sl'
,p_message_text=>unistr('Pogled mre\017Ee')
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142636283926752444)
,p_name=>'APEX.IG.GROUP'
,p_message_language=>'sl'
,p_message_text=>'Skupina'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142597076317752432)
,p_name=>'APEX.IG.GROUP_BY'
,p_message_language=>'sl'
,p_message_text=>'Grupiranje'
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142562273583752422)
,p_name=>'APEX.IG.GROUP_BY_VIEW'
,p_message_language=>'sl'
,p_message_text=>'Pogled grupiranja'
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142640638136752445)
,p_name=>'APEX.IG.HD_TYPE'
,p_message_language=>'sl'
,p_message_text=>'Tip pogoja'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142639547418752445)
,p_name=>'APEX.IG.HEADING'
,p_message_language=>'sl'
,p_message_text=>'Naslov'
,p_is_js_message=>true
,p_version_scn=>2705551
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142639776615752445)
,p_name=>'APEX.IG.HEADING_ALIGN'
,p_message_language=>'sl'
,p_message_text=>'Poravnava naslova'
,p_is_js_message=>true
,p_version_scn=>2705551
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142649370261752448)
,p_name=>'APEX.IG.HELP'
,p_message_language=>'sl'
,p_message_text=>unistr('Pomo\010D')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142644823917752447)
,p_name=>'APEX.IG.HELP.ACTIONS.EDITING'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Podatke lahko vstavljate, posodabljate in bri\0161ete neposredno v tej interaktivni mre\017Ei.</p>'),
'',
'<p>Novo vrstico vstavite tako, da kliknete gumb Dodaj vrstico.</p>',
'',
unistr('<p>Obstoje\010De podatke uredite tako, da dvokliknete dolo\010Deno celico. Pri obse\017Enej\0161em urejanju kliknite Uredi, da vstopite v na\010Din za urejanje. V na\010Dinu za urejanje lahko dolo\010Dene celice urejate tako, da jih enkrat kliknete ali uporabite tipkovnico.</p>'),
'',
unistr('<p>Z menijem Spremeni podvojite in bri\0161ite vrstice. \010Ce \017Eelite omogo\010Diti meni Spremeni, uporabite potrditvena polja, da izberete eno ali ve\010D vrstic.</p>'),
'',
unistr('<p>Izbrano vrstico podvojite tako, da kliknete meni Spremeni in izberete Podvoji vrstice. Izbrano vrstico izbri\0161ite tako, da kliknete meni Spremeni in izberete Izbri\0161i vrstico.</p>')))
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142646944159752447)
,p_name=>'APEX.IG.HELP.ACTIONS.EDITING_HEADING'
,p_message_language=>'sl'
,p_message_text=>unistr('Zmo\017Enosti urejanja')
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142647062777752447)
,p_name=>'APEX.IG.HELP.ACTIONS.INTRO'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Interaktivna mre\017Ea predstavlja nabor podatkov v poro\010Dilu, po katerem je mogo\010De iskati in ga prilagajati. Izvajate lahko \0161tevilne operacije za omejitev vrnjenih zapisov in spremenite na\010Din prikaza podatkov.</p>'),
'',
unistr('<p>S poljem Iskanje filtrirajte vrnjene rezultate. Kliknite Dejanja za dostop do \0161tevilnih mo\017Enosti za spreminjanje postavitve poro\010Dila ali pa uporabite menije Glava stolpca na prikazanih stolpcih.</p>'),
'',
unistr('<p>Uporabite Nastavitve poro\010Dila, da shranite svoje prilagoditve v poro\010Dilo. Podatke iz poro\010Dila lahko tudi prenesete v zunanjo datoteko ali jih po\0161ljete po e-po\0161ti sebi ali drugim.</p>'),
'',
unistr('<p>Za ve\010D informacij si oglejte "Uporaba interaktivnih mre\017E" v <em>priro\010Dniku za kon\010Dnega uporabnika Oracle APEX</em>.')))
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142646704403752447)
,p_name=>'APEX.IG.HELP.ACTIONS.INTRO_HEADING'
,p_message_language=>'sl'
,p_message_text=>'Pregled'
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142644727824752447)
,p_name=>'APEX.IG.HELP.ACTIONS.REPORTING'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Interaktivno mre\017Eo lahko prilagodite tako, da prikazuje podatke na razli\010Dne na\010Dine z vgrajenimi zmo\017Enostmi.</p>'),
'',
unistr('<p>Z meniji Glava stolpca ali menijem Dejanja dolo\010Dite, kateri stolpci bodo prikazani , v katerem zaporedju, stolpce pa lahko tudi zamrznete. Dolo\010Dite lahko tudi razli\010Dne filtre podatkov in razvrstite vrnjene podatke.</p>'),
'',
unistr('<p>Z gumbom Pogled (poleg polja Iskanje) dostopajte do drugih pogledov podatkov, ki jih je morda dolo\010Dil razvijalec aplikacije. Lahko tudi ustvarite grafikon ali si ogledate obstoje\010Di grafikon.</p>  '),
'',
unistr('<p><em>Opomba: Kliknite <strong>Pomo\010D</strong> v pogovornih oknih interaktivne mre\017Ee, da pridobite podrobnej\0161e informacije o izbrani funkciji.</em></p>')))
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142646809804752447)
,p_name=>'APEX.IG.HELP.ACTIONS.REPORTING_HEADING'
,p_message_language=>'sl'
,p_message_text=>unistr('Zmo\017Enosti poro\010Danja')
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142597855735752433)
,p_name=>'APEX.IG.HELP.ACTIONS_TITLE'
,p_message_language=>'sl'
,p_message_text=>unistr('Interaktivna mre\017Ea - Pomo\010D')
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142643697159752446)
,p_name=>'APEX.IG.HELP.AGGREGATE'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>S tem pogovornim oknom zdru\017Eite stolpce. Zdru\017Eene vrednosti se prika\017Eejo na dnu podatkov, \010De pa so dolo\010Deni kontrolni prelomi, se prika\017Eejo na dnu vsakega preloma.</p>'),
'',
unistr('<p><strong>Seznam zdru\017Eevanja</strong><br>'),
unistr('Na seznamu zdru\017Eevanja so prikazana dolo\010Dena zdru\017Eevanja. Obstoje\010De zdru\017Eevanje onemogo\010Dite tako, da prekli\010Dete njegovo izbiro.<br>'),
unistr('Kliknite Dodaj ( &plus; ), da ustvarite novo zdru\017Eevanje, ali Izbri\0161i ( &minus; ), da odstranite obstoje\010De zdru\017Eevanje.</p>'),
'',
unistr('<p><strong>Nastavitve zdru\017Eevanja</strong><br>'),
unistr('Z obrazcem na desni strani dolo\010Dite zdru\017Eevanje.<br>'),
unistr('Izberite ime stolpca in tip zdru\017Eevanja.<br>'),
unistr('Druga mo\017Enost je, da za zdru\017Eevanje vnesete zaslonski namig.<br>'),
unistr('\010Ce ste dolo\010Dili kontrolni prelom, z izbiro mo\017Enosti <strong>Prika\017Ei skupno vrednost</strong> na dnu podatkov prika\017Eete celotno povpre\010Dje, skupno vrednost ali podobno vrednost.</p>'),
'',
unistr('<p><em>Opomba: Do pogovornega okna Zdru\017Eevanje dostopajte v meniju Dejanja ali tako, da kliknete naslov stolpca in vsoto ( &sum; ).</em></p>')))
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142645840184752447)
,p_name=>'APEX.IG.HELP.AGGREGATE_TITLE'
,p_message_language=>'sl'
,p_message_text=>unistr('Zdru\017Eevanje - Pomo\010D')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142644301177752446)
,p_name=>'APEX.IG.HELP.CHART'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>S tem pogovornim oknom dolo\010Dite grafikon, ki se prika\017Ee kot lo\010Den prikaz podatkov.<br>'),
'Izberite tip grafikona in atribute grafikona.</p>',
'<p><strong>Atributi grafikona</strong><br>',
unistr('Razpolo\017Eljivi atributi grafikona se razlikujejo glede na tip grafikona.</p>'),
'<p>',
'<ul>',
'  <li>Izberite stolpec, ki vsebuje vrednost za atribut:',
'    <ul>',
unistr('      <li>Oznaka - Besedilo za vsako podatkovno to\010Dko.</li>'),
'      <li>Vrednost - Podatki, ki bodo izrisani.</li>',
unistr('      <li>Serija - Za definiranje dinami\010Dne poizvedbe z ve\010D serijami.</li>'),
unistr('      <li>Odpiranje - Dnevna za\010Detna cena delnic (Samo Delnica).</li>'),
unistr('      <li>Zaklju\010Dek - Dnevna zaklju\010Dna cena delnic (Samo Delnica).</li>'),
'      <li>Visoko - Visoka vrednost (Samo Razpon in Delnica).</li>',
'      <li>Nizko - Nizka vrednost (Samo Razpon in Delnica).</li>',
'      <li>Obseg - Dnevni obseg delnic (Samo Delnica).</li>',
'      <li>Cilj - Ciljna vrednost (Samo Lijak).</li>',
unistr('      <li>X - Vrednost osi x (Samo Mehur\010Dek in Raztreseni).</li>'),
unistr('      <li>Y - Vrednost osi y (Samo Mehur\010Dek in Raztreseni).</li>'),
unistr('      <li>Z - \0160irina stolpca ali polmer mehur\010Dka (Samo Stolp\010Dni, Mehur\010Dek in Razpon).</li>'),
'    </ul>',
'  </li>',
unistr('  <li>Usmerjenost - Navpi\010Dno ali vodoravno.</li>'),
unistr('  <li>Zdru\017Eevanje - Izberite, kako zdru\017Eiti povezane vrednosti grafikona.</li>'),
unistr('  <li>Sklad - Dolo\010Dite, ali so elementi podatkov nalo\017Eeni v sklad.</li>'),
unistr('  <li>Razvrsti po - Razvr\0161\010Danje po oznaki ali vrednostih.'),
'    <ul>',
unistr('      <li>Smer - Razvr\0161\010Danje po nara\0161\010Dajo\010Dih ali padajo\010Dih vrednostih.</li>'),
unistr('      <li>Ni\010Dle - Dolo\010Dite, kako razvrstiti zapise z ni\010Delnimi vrednostmi glede na zapise z neni\010Delnimi vrednostmi.</li>'),
'    </ul>',
'  </li>',
'  <li>Decimalna mesta</li>',
'  <li>Naslov osi oznake</li>',
'  <li>Naslov osi vrednosti</li>',
'</ul>',
'</p>'))
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142646292534752447)
,p_name=>'APEX.IG.HELP.CHART_TITLE'
,p_message_language=>'sl'
,p_message_text=>unistr('Grafikon - Pomo\010D')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142643362486752446)
,p_name=>'APEX.IG.HELP.COLUMNS'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>To pogovorno okno uporabite za izbiranje tega, kateri stolpci se prika\017Eejo in v katerem vrstnem redu.</p>'),
'',
unistr('<p>Stolpec skrijete tako, da prekli\010Dete njegovo izbiro.<br>'),
'Stolpce prerazporedite tako, da kliknete Premakni navzgor ( &uarr; ) ali Premakni navzdol ( &darr; ).<br>',
unistr('S spustnim izbirnikom na seznamu navedite mo\017Enosti Vsi stolpci, Prikazani stolpci ali Neprikazani stolpci.</p>'),
'',
unistr('<p>Obrazec lahko uporabite za dolo\010Danje minimalne \0161irine stolpca v pikslih.</p>'),
'',
unistr('<p><em>Opomba: Prikazane stolpce lahko prerazporedite tudi tako, da kliknete oprimek za vle\010Denje (na za\010Detku glave stolpca) in povle\010Dete stolpec v levo ali desno. \0160irino prikazanih stolpcev lahko spremenite tudi tako, da izberete lo\010Devalnik stolpca, ')
||'med glavami, in ga premaknete v levo ali desno.</em></p>'))
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142646137696752447)
,p_name=>'APEX.IG.HELP.COLUMNS_TITLE'
,p_message_language=>'sl'
,p_message_text=>unistr('Stolpci - Pomo\010D')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142643720310752446)
,p_name=>'APEX.IG.HELP.COMPUTE'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>S tem pogovornim oknom dolo\010Dite dodatne stolpce na podlagi matemati\010Dnih in funkcijskih izra\010Dunov, izvedenih na podlagi obstoje\010Dih stolpcev.</p>'),
'',
unistr('<p><strong>Seznam izra\010Dunov</strong><br>'),
unistr('Na seznamu izra\010Dunov so prikazani dolo\010Deni izra\010Duni. Obstoje\010Di izra\010Dun onemogo\010Dite tako, da prekli\010Dete njegovo izbiro.<br>'),
unistr('Kliknite Dodaj ( &plus; ), da dodate nov izra\010Dun, ali Izbri\0161i ( &minus; ), da odstranite obstoje\010Di izra\010Dun.</p>'),
'',
unistr('<p><strong>Nastavitve izra\010Dunov</strong><br>'),
unistr('Z obrazcem dolo\010Dite izra\010Dun.<br>'),
'Vnesite podrobnosti stolpca, kot sta naslov in oznaka, ter izberite nastavitve poravnave.<br> ',
unistr('Z besedilnim obmo\010Djem Izraz vnesite stolpce in povezane funkcije za izra\010Dun.<br>'),
unistr('Izberite ustrezen podatkovni tip in po \017Eelji masko formata za nov stolpec.</p>')))
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142645771352752447)
,p_name=>'APEX.IG.HELP.COMPUTE_TITLE'
,p_message_language=>'sl'
,p_message_text=>unistr('Izra\010Dun - Pomo\010D')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142644084497752446)
,p_name=>'APEX.IG.HELP.CONTROL_BREAK'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>S tem pogovornim oknom dolo\010Dite kontrolni prelom na enem ali ve\010D stolpcih.</p>'),
'',
'<p><strong>Seznam kontrolnih prelomov</strong><br>',
unistr('Na seznamu kontrolnih prelomov so prikazani dolo\010Deni kontrolni prelomi. Onemogo\010Dite obstoje\010Di kontrolni prelom tako, da prekli\010Dete njegovo izbiro.<br>'),
unistr('Kliknite Dodaj ( &plus; ), da vklju\010Dite nov stolpec v kontrolni prelom, ali Izbri\0161i ( &minus; ), da odstranite obstoje\010Di stolpec iz kontrolnega preloma.<br>'),
'Stolpce prerazporedite tako, da kliknite Premakni navzgor ( &uarr; ) ali Premakni navzdol ( &darr; ), da premaknete izbrani stolpec navzgor in navzdol glede na druge stolpce.</p>',
'',
'<p><strong>Nastavitve kontrolnega preloma</strong><br>',
unistr('Z obrazcem dolo\010Dite stolpec s kontrolnim prelomom.<br>'),
unistr('Izberite stolpec s kontrolnim prelomom, smer razvr\0161\010Danja in na\010Din razporeditve ni\010Delnih stolpcev (stolpci brez vrednosti).</p>'),
'',
unistr('<p><em>Opomba: Kadar si ogledujete interaktivno mre\017Eo, lahko kontrolni prelom dolo\010Dite tako, da kliknete glavo stolpca in izberete ikono kontrolnega preloma.</em></p>')))
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142645474924752447)
,p_name=>'APEX.IG.HELP.CONTROL_BREAK_TITLE'
,p_message_language=>'sl'
,p_message_text=>unistr('Kontrolni prelom - Pomo\010D')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142644262405752446)
,p_name=>'APEX.IG.HELP.DOWNLOAD'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>S tem pogovornim oknom prenesite vse trenutne vrstice v zunanjo datoteko. Datoteka bo vsebovala le trenutno prikazane stolpce, pri \010Demer bodo uporabljeni katerikoli filtri in razvr\0161\010Danja, uporabljeni pri podatkih.</p>'),
'',
'<p>Izberite format datoteke in kliknite Prenesi.<br>',
'Opomba: Datoteka CSV ne bo vsebovala formatiranja besedila, na primer skupnih vrednosti in kontrolnih prelomov.</p>',
'',
unistr('<p>\010Ce \017Eelite datoteko poslati po elektronski po\0161ti, izberite Po\0161lji kot e-po\0161to in vnesite podrobnosti e-po\0161te (prejemnik, zadeva in sporo\010Dilo).</p>')))
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142645228518752447)
,p_name=>'APEX.IG.HELP.DOWNLOAD_TITLE'
,p_message_language=>'sl'
,p_message_text=>unistr('Prenos - Pomo\010D')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142643432472752446)
,p_name=>'APEX.IG.HELP.FILTER'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>S tem pogovornim oknom konfigurirajte podatkovne filtre, ki omejujejo \0161tevilo vrnjenih vrstic.</p>'),
'',
'<p><strong>Seznam filtrov</strong><br>',
unistr('Na seznamu filtrov so prikazani dolo\010Deni filtri. Obstoje\010Di filter onemogo\010Dite tako, da prekli\010Dete njegovo izbiro.<br>'),
unistr('Kliknite Dodaj ( &plus; ), da ustvarite nov filter, ali Izbri\0161i ( &minus; ), da odstranite obstoje\010Di filter.</p>'),
'',
'<p><strong>Nastavitve filtra</strong><br>',
unistr('Uporabite obrazec, da dolo\010Dite lastnosti filtra.<br>'),
'Izberite ustrezen tip filtra:<br>',
unistr('&nbsp;&nbsp;&nbsp;Vrstica - filter za izraz v kateremkoli stolpcu, ki ga je mogo\010De filtrirati.<br>'),
unistr('&nbsp;&nbsp;&nbsp;Stolpec - filtriranje dolo\010Denega stolpca z dolo\010Denim operatorjem in vrednostjo.</p>'),
'',
unistr('<p><em>Opomba: Med ogledom interaktivne mre\017Ee lahko dolo\010Dite filtre vrstic tako, da tipkate neposredno v polje Iskanje. Kliknite Izbira stolpcev za iskanje, da omejite iskanje na dolo\010Deni stolpec. Druga mo\017Enost je, da odprete meni naslova stolpca in ')
||'izberete vrednost za ustvarjanje filtra stolpca.</em></p>'))
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142646096125752447)
,p_name=>'APEX.IG.HELP.FILTER_TITLE'
,p_message_language=>'sl'
,p_message_text=>unistr('Filtriranje - Pomo\010D')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142643846864752446)
,p_name=>'APEX.IG.HELP.FLASHBACK'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>S tem pogovornim oknom si oglejte podatke, kot so obstajali na neki pretekli to\010Dki v \010Dasu.</p>'),
unistr('<p>Vnesite \0161tevilo minut v preteklosti, da izvedete poizvedbo pogleda nazaj.</p>')))
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142645682858752447)
,p_name=>'APEX.IG.HELP.FLASHBACK_TITLE'
,p_message_language=>'sl'
,p_message_text=>unistr('Pogled nazaj - Pomo\010D')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142646328675752447)
,p_name=>'APEX.IG.HELP.GROUP_BY_TITLE'
,p_message_language=>'sl'
,p_message_text=>unistr('Grupiranje - Pomo\010D')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142643936990752446)
,p_name=>'APEX.IG.HELP.HIGHLIGHT'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>S tem pogovornim oknom ozna\010Dite vrstice ali stolpce podatkov na podlagi vnesenih pogojev.</p>'),
'',
unistr('<p><strong>Seznam ozna\010Db</strong><br>'),
unistr('Na seznamu ozna\010Db so prikazane dolo\010Dene ozna\010Dbe. Obstoje\010Do ozna\010Dbo onemogo\010Dite tako, da prekli\010Dete njeno izbiro.<br>'),
unistr('Kliknite Dodaj ( &plus; ), da ustvarite novo ozna\010Dbo, ali Izbri\0161i ( &minus; ), da odstranite obstoje\010Do ozna\010Dbo.</p>'),
'',
unistr('<p><strong>Nastavitve ozna\010Db</strong><br>'),
unistr('Z obrazcem dolo\010Dite lastnosti ozna\010Dbe.<br>'),
'Vnesite ime, izberite vrstico ali stolpec in izberite barvne kode HTML za ozadje in besedilo.<br>',
unistr('Izberite ustrezno mo\017Enost <strong>Tip pogoja</strong>, da ozna\010Dite posebne podatke:<br>'),
unistr('&nbsp;&nbsp;&nbsp;Vrstica - ozna\010Dite izraz v kateremkoli stolpcu.<br>'),
unistr('&nbsp;&nbsp;&nbsp;Stolpec - ozna\010Dite znotraj posebnega stolpca na podlagi navedenega operatorja in vrednosti.</p>')))
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142645535888752447)
,p_name=>'APEX.IG.HELP.HIGHLIGHT_TITLE'
,p_message_language=>'sl'
,p_message_text=>unistr('Ozna\010Dba - Pomo\010D')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142644176576752446)
,p_name=>'APEX.IG.HELP.REPORT'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>S tem pogovornim oknom shranite spremembe, ki ste jih opravili pri trenutni postavitvi mre\017Ee in konfiguraciji.<br>'),
unistr('Razvijalci aplikacij lahko dolo\010Dijo ve\010D razli\010Dnih postavitev poro\010Dila. \010Ce je dovoljeno, lahko vi in drugi kon\010Dni uporabniki shranijo poro\010Dilo kot Javno, kar omogo\010Da, da je poro\010Dilo razpolo\017Eljivo vsem drugim uporabnikom mre\017Ee. Poro\010Dilo lahko shranite ')
||'tudi kot Zasebno, ki si ga lahko ogledate le vi.</p>',
unistr('<p>Izberite med razpolo\017Eljivimi tipi in vnesite ime za shranjeno poro\010Dilo.</p>')))
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142645302942752447)
,p_name=>'APEX.IG.HELP.REPORT_TITLE'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Poro\010Dilo - Pomo\010D'),
''))
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142643575840752446)
,p_name=>'APEX.IG.HELP.SORT'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>S tem pogovornim oknom nastavite vrstni red prikaza.</p>',
'',
unistr('<p><strong>Seznam razvr\0161\010Danja</strong><br>'),
unistr('V pogovornem oknu Razvr\0161\010Danje je prikazan seznam konfiguriranih pravil razvr\0161\010Danja.<br>'),
unistr('Kliknite Dodaj ( &plus; ), da ustvarite stolpec za razvr\0161\010Danje, ali Izbri\0161i ( &minus; ), da odstranite stolpec za razvr\0161\010Danje.<br>'),
unistr('Kliknite Premakni navzgor ( &uarr; ) in Premakni navzdol ( &darr; ), da premaknete izbrani stolpec za razvr\0161\010Danje navzgor in navzdol relativno glede na ostale stolpce za razvr\0161\010Danje.</p>'),
'',
unistr('<p><strong>Nastavitve razvr\0161\010Danja</strong><br>'),
unistr('Izberite stolpec za razvr\0161\010Danje, smer razvr\0161\010Danja in na\010Din razvrstitve ni\010Delnih stolpcev (stolpci brez vrednosti).</p>'),
'',
unistr('<p><em>Opomba: Podatke lahko razvrstite glede na stolpce, ki niso prikazani; vendar pa se lahko zgodi, da ne bo mogo\010De razvrstiti vseh stolpcev.</em><br>'),
unistr('<em>Prikazane stolpce lahko razvrstite tako, da pritisnete pu\0161\010Dico navzgor (nara\0161\010Dajo\010De) ali navzdol (padajo\010De) na koncu glav stolpca. \010Ce \017Eelite obstoje\010Demu razvr\0161\010Danju dodati naslednji stolpec, pridr\017Eite tipko Shift in kliknite pu\0161\010Dico navzgor ali n')
||'avzdol.</em></p>'))
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142645940788752447)
,p_name=>'APEX.IG.HELP.SORT_TITLE'
,p_message_language=>'sl'
,p_message_text=>unistr('Razvr\0161\010Danje - Pomo\010D')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142645194842752447)
,p_name=>'APEX.IG.HELP.SUBSCRIPTION_TITLE'
,p_message_language=>'sl'
,p_message_text=>unistr('Naro\010Dnina - Pomo\010D')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142598788968752433)
,p_name=>'APEX.IG.HIDE'
,p_message_language=>'sl'
,p_message_text=>'Skrij'
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142563166589752422)
,p_name=>'APEX.IG.HIGHLIGHT'
,p_message_language=>'sl'
,p_message_text=>unistr('Ozna\010Dba')
,p_is_js_message=>true
,p_version_scn=>2705535
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142632396974752443)
,p_name=>'APEX.IG.HIGH_COLUMN'
,p_message_language=>'sl'
,p_message_text=>'Visoko'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142633168254752443)
,p_name=>'APEX.IG.HORIZONTAL'
,p_message_language=>'sl'
,p_message_text=>'Vodoravno'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142591760910752431)
,p_name=>'APEX.IG.HOURS'
,p_message_language=>'sl'
,p_message_text=>'ure'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142596763629752432)
,p_name=>'APEX.IG.ICON'
,p_message_language=>'sl'
,p_message_text=>'Ikona'
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142562005887752422)
,p_name=>'APEX.IG.ICON_VIEW'
,p_message_language=>'sl'
,p_message_text=>'Pogled ikon'
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142589964649752430)
,p_name=>'APEX.IG.IN'
,p_message_language=>'sl'
,p_message_text=>'v'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142598345313752433)
,p_name=>'APEX.IG.INACTIVE_SETTING'
,p_message_language=>'sl'
,p_message_text=>'Neaktivna nastavitev'
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142598494582752433)
,p_name=>'APEX.IG.INACTIVE_SETTINGS'
,p_message_language=>'sl'
,p_message_text=>'Neaktivne nastavitve'
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142606037237752435)
,p_name=>'APEX.IG.INTERNAL_ERROR'
,p_message_language=>'sl'
,p_message_text=>unistr('Med obdelavo zahteve Interaktivna mre\017Ea je pri\0161lo do notranje napake.')
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142493952424752401)
,p_name=>'APEX.IG.INVALID_COLUMN_FILTER_TYPE'
,p_message_language=>'sl'
,p_message_text=>'Tip filtra stolpca "%0" ni podprt za stolpec "%1".'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142644992149752447)
,p_name=>'APEX.IG.INVALID_DATE_FORMAT'
,p_message_language=>'sl'
,p_message_text=>'Neveljavna oblika datuma'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142619768073752439)
,p_name=>'APEX.IG.INVALID_FILTER_COLUMN'
,p_message_language=>'sl'
,p_message_text=>unistr('Interaktivna mre\017Ea ne podpira dolo\010Danja filtra na stolpcu %0.')
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142619689104752439)
,p_name=>'APEX.IG.INVALID_FILTER_OPERATOR'
,p_message_language=>'sl'
,p_message_text=>unistr('%0 ni veljaven tip filtra za dolo\010Danje filtra Interaktivna mre\017Ea.')
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142500597640752403)
,p_name=>'APEX.IG.INVALID_NUMBER_FORMAT'
,p_message_language=>'sl'
,p_message_text=>unistr('Neveljaven format \0161tevilke')
,p_is_js_message=>true
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142647620845752447)
,p_name=>'APEX.IG.INVALID_SETTING'
,p_message_language=>'sl'
,p_message_text=>'Neveljavna nastavitev'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142647709042752448)
,p_name=>'APEX.IG.INVALID_SETTINGS'
,p_message_language=>'sl'
,p_message_text=>'Neveljavne nastavitve'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142638883139752445)
,p_name=>'APEX.IG.INVALID_SORT_BY'
,p_message_language=>'sl'
,p_message_text=>unistr('Mo\017Enost Razvrsti po je bila nastavljena na %0, vendar za %0 ni bil izbran noben stolpec.')
,p_is_js_message=>true
,p_version_scn=>2705551
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142636164160752444)
,p_name=>'APEX.IG.INVALID_VALUE'
,p_message_language=>'sl'
,p_message_text=>'Neveljavna vrednost'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142631206220752443)
,p_name=>'APEX.IG.INVISIBLE'
,p_message_language=>'sl'
,p_message_text=>'Ni prikazano'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142590770034752430)
,p_name=>'APEX.IG.IN_THE_LAST'
,p_message_language=>'sl'
,p_message_text=>'v zadnjih'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142590903425752430)
,p_name=>'APEX.IG.IN_THE_NEXT'
,p_message_language=>'sl'
,p_message_text=>'v naslednjih'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142589840016752430)
,p_name=>'APEX.IG.IS_NOT_NULL'
,p_message_language=>'sl'
,p_message_text=>'ni prazno'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142589701780752430)
,p_name=>'APEX.IG.IS_NULL'
,p_message_language=>'sl'
,p_message_text=>'je prazno'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142639621431752445)
,p_name=>'APEX.IG.LABEL'
,p_message_language=>'sl'
,p_message_text=>'Oznaka'
,p_is_js_message=>true
,p_version_scn=>2705551
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142631613670752443)
,p_name=>'APEX.IG.LABEL_COLUMN'
,p_message_language=>'sl'
,p_message_text=>'Oznaka'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142635521719752444)
,p_name=>'APEX.IG.LAST'
,p_message_language=>'sl'
,p_message_text=>'Zadnji'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142580037843752427)
,p_name=>'APEX.IG.LAST.DAY'
,p_message_language=>'sl'
,p_message_text=>'Zadnji dan'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142580295678752427)
,p_name=>'APEX.IG.LAST.HOUR'
,p_message_language=>'sl'
,p_message_text=>'Zadnja ura'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142580766279752427)
,p_name=>'APEX.IG.LAST.MINUTE'
,p_message_language=>'sl'
,p_message_text=>'Zadnja minuta'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142579708323752427)
,p_name=>'APEX.IG.LAST.MONTH'
,p_message_language=>'sl'
,p_message_text=>'Zadnji mesec'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142579803874752427)
,p_name=>'APEX.IG.LAST.WEEK'
,p_message_language=>'sl'
,p_message_text=>'Zadnji teden'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142579966750752427)
,p_name=>'APEX.IG.LAST.X_DAYS'
,p_message_language=>'sl'
,p_message_text=>'Zadnjih toliko dni: %0'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142580186542752427)
,p_name=>'APEX.IG.LAST.X_HOURS'
,p_message_language=>'sl'
,p_message_text=>'Zadnjih toliko ur: %0'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142580881732752427)
,p_name=>'APEX.IG.LAST.X_MINUTES'
,p_message_language=>'sl'
,p_message_text=>'Zadnjih toliko minut: %0'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142580633879752427)
,p_name=>'APEX.IG.LAST.X_MONTHS'
,p_message_language=>'sl'
,p_message_text=>'Zadnjih toliko mesecev: %0'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142580522547752427)
,p_name=>'APEX.IG.LAST.X_WEEKS'
,p_message_language=>'sl'
,p_message_text=>'Zadnjih toliko tednov: %0'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142579582440752427)
,p_name=>'APEX.IG.LAST.X_YEARS'
,p_message_language=>'sl'
,p_message_text=>'Zadnjih toliko let: %0'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142579619712752427)
,p_name=>'APEX.IG.LAST.YEAR'
,p_message_language=>'sl'
,p_message_text=>'Zadnje leto'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142639811130752445)
,p_name=>'APEX.IG.LAYOUT_ALIGN'
,p_message_language=>'sl'
,p_message_text=>'Poravnava celic'
,p_is_js_message=>true
,p_version_scn=>2705551
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142639900926752445)
,p_name=>'APEX.IG.LAYOUT_USEGROUPFOR'
,p_message_language=>'sl'
,p_message_text=>'Uporabi skupino za'
,p_is_js_message=>true
,p_version_scn=>2705551
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142590318337752430)
,p_name=>'APEX.IG.LESS_THAN'
,p_message_language=>'sl'
,p_message_text=>unistr('manj\0161e kot')
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142590465824752430)
,p_name=>'APEX.IG.LESS_THAN_OR_EQUALS'
,p_message_language=>'sl'
,p_message_text=>unistr('manj\0161e kot ali enako')
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142633708074752443)
,p_name=>'APEX.IG.LINE'
,p_message_language=>'sl'
,p_message_text=>'Vrstica'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142633854403752443)
,p_name=>'APEX.IG.LINE_WITH_AREA'
,p_message_language=>'sl'
,p_message_text=>unistr('Vrstica z obmo\010Djem')
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142640278463752445)
,p_name=>'APEX.IG.LISTAGG'
,p_message_language=>'sl'
,p_message_text=>'Listagg'
,p_is_js_message=>true
,p_version_scn=>2705551
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142632479268752443)
,p_name=>'APEX.IG.LOW_COLUMN'
,p_message_language=>'sl'
,p_message_text=>'Nizko'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142642723250752446)
,p_name=>'APEX.IG.MAILADDRESSES_COMMASEP'
,p_message_language=>'sl'
,p_message_text=>unistr('Ve\010D naslovov lo\010Dite z vejicami')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142591599583752431)
,p_name=>'APEX.IG.MATCHES_REGULAR_EXPRESSION'
,p_message_language=>'sl'
,p_message_text=>'se ujema z regularnim izrazom'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142615904828752438)
,p_name=>'APEX.IG.MAX'
,p_message_language=>'sl'
,p_message_text=>'Maksimum'
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142650225479752448)
,p_name=>'APEX.IG.MAX_OVERALL'
,p_message_language=>'sl'
,p_message_text=>'Skupno maksimalno'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142616107311752438)
,p_name=>'APEX.IG.MEDIAN'
,p_message_language=>'sl'
,p_message_text=>'Mediana'
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142650330910752448)
,p_name=>'APEX.IG.MEDIAN_OVERALL'
,p_message_language=>'sl'
,p_message_text=>'Skupna mediana'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142615896611752438)
,p_name=>'APEX.IG.MIN'
,p_message_language=>'sl'
,p_message_text=>'Minimum'
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142591677059752431)
,p_name=>'APEX.IG.MINUTES'
,p_message_language=>'sl'
,p_message_text=>'minute'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142616601713752438)
,p_name=>'APEX.IG.MINUTES_AGO'
,p_message_language=>'sl'
,p_message_text=>'min. v preteklosti'
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142650172961752448)
,p_name=>'APEX.IG.MIN_OVERALL'
,p_message_language=>'sl'
,p_message_text=>'Skupno minimalno'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142592082732752431)
,p_name=>'APEX.IG.MONTHS'
,p_message_language=>'sl'
,p_message_text=>'meseci'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142598654136752433)
,p_name=>'APEX.IG.MORE_DATA_FOUND'
,p_message_language=>'sl'
,p_message_text=>unistr('Podatki vsebujejo ve\010D kot toliko vrstic: %0, kar presega maksimalno dovoljeno \0161tevilo. Za ogled rezultatov dodelite dodatne filtre.')
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142624498040752440)
,p_name=>'APEX.IG.MULTIIG_PAGE_REGION_STATIC_ID_REQUIRED'
,p_message_language=>'sl'
,p_message_text=>unistr('Naveden mora biti stati\010Dni ID podro\010Dja, saj stran vsebuje ve\010D interaktivnih mre\017E.')
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142594790941752432)
,p_name=>'APEX.IG.NAME'
,p_message_language=>'sl'
,p_message_text=>'Ime'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142594937618752432)
,p_name=>'APEX.IG.NAMED_REPORT'
,p_message_language=>'sl'
,p_message_text=>unistr('Imenovano poro\010Dilo')
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142578964106752427)
,p_name=>'APEX.IG.NEXT.DAY'
,p_message_language=>'sl'
,p_message_text=>'Naslednji dan'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142578716799752427)
,p_name=>'APEX.IG.NEXT.HOUR'
,p_message_language=>'sl'
,p_message_text=>'Naslednja ura'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142580979336752427)
,p_name=>'APEX.IG.NEXT.MINUTE'
,p_message_language=>'sl'
,p_message_text=>'Naslednja minuta'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142579256625752427)
,p_name=>'APEX.IG.NEXT.MONTH'
,p_message_language=>'sl'
,p_message_text=>'Naslednji mesec'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142579116996752427)
,p_name=>'APEX.IG.NEXT.WEEK'
,p_message_language=>'sl'
,p_message_text=>'Naslednji teden'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142579065623752427)
,p_name=>'APEX.IG.NEXT.X_DAYS'
,p_message_language=>'sl'
,p_message_text=>'Naslednjih toliko dni: %0'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142578882279752427)
,p_name=>'APEX.IG.NEXT.X_HOURS'
,p_message_language=>'sl'
,p_message_text=>'Naslednjih toliko ur: %0'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142581056567752427)
,p_name=>'APEX.IG.NEXT.X_MINUTES'
,p_message_language=>'sl'
,p_message_text=>'Naslednjih toliko minut: %0'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142580359253752427)
,p_name=>'APEX.IG.NEXT.X_MONTHS'
,p_message_language=>'sl'
,p_message_text=>'Naslednjih toliko mesecev: %0'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142580461845752427)
,p_name=>'APEX.IG.NEXT.X_WEEKS'
,p_message_language=>'sl'
,p_message_text=>'Naslednjih toliko tednov: %0'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142579479834752427)
,p_name=>'APEX.IG.NEXT.X_YEARS'
,p_message_language=>'sl'
,p_message_text=>'Naslednjih toliko let: %0'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142579320055752427)
,p_name=>'APEX.IG.NEXT.YEAR'
,p_message_language=>'sl'
,p_message_text=>'Naslednje leto'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142590609601752430)
,p_name=>'APEX.IG.NOT_BETWEEN'
,p_message_language=>'sl'
,p_message_text=>'ni med'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142589600227752430)
,p_name=>'APEX.IG.NOT_EQUALS'
,p_message_language=>'sl'
,p_message_text=>'ni enako'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142654408782752450)
,p_name=>'APEX.IG.NOT_EXIST'
,p_message_language=>'sl'
,p_message_text=>unistr('Podro\010Dje z ID-jem %0 ni podro\010Dje interaktivne mre\017Ee ali pa ne obstaja v aplikaciji %1.')
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142590053117752430)
,p_name=>'APEX.IG.NOT_IN'
,p_message_language=>'sl'
,p_message_text=>'ni v'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142590807864752430)
,p_name=>'APEX.IG.NOT_IN_THE_LAST'
,p_message_language=>'sl'
,p_message_text=>'ni v zadnjih'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142591023687752430)
,p_name=>'APEX.IG.NOT_IN_THE_NEXT'
,p_message_language=>'sl'
,p_message_text=>'ni v naslednjih'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142598517809752433)
,p_name=>'APEX.IG.NO_DATA_FOUND'
,p_message_language=>'sl'
,p_message_text=>unistr('Podatkov ni bilo mogo\010De najti')
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142635354886752444)
,p_name=>'APEX.IG.NULLS'
,p_message_language=>'sl'
,p_message_text=>'Vrednosti NULL'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142640456683752445)
,p_name=>'APEX.IG.NUMBER'
,p_message_language=>'sl'
,p_message_text=>unistr('\0160tevilska vrednost')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142635672679752444)
,p_name=>'APEX.IG.OFF'
,p_message_language=>'sl'
,p_message_text=>'Izklopljeno'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142635734773752444)
,p_name=>'APEX.IG.ON'
,p_message_language=>'sl'
,p_message_text=>'Vklopljeno'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142588850876752430)
,p_name=>'APEX.IG.ONE_MINUTE_AGO'
,p_message_language=>'sl'
,p_message_text=>'Pred 1 minuto'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142643265669752446)
,p_name=>'APEX.IG.OPEN_COLORPICKER'
,p_message_language=>'sl'
,p_message_text=>'Odpri izbirnik barve: %0'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142632111219752443)
,p_name=>'APEX.IG.OPEN_COLUMN'
,p_message_language=>'sl'
,p_message_text=>'Odpri'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142595844013752432)
,p_name=>'APEX.IG.OPERATOR'
,p_message_language=>'sl'
,p_message_text=>'Operator'
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142631536579752443)
,p_name=>'APEX.IG.ORIENTATION'
,p_message_language=>'sl'
,p_message_text=>'Usmerjenost'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142633983637752443)
,p_name=>'APEX.IG.PIE'
,p_message_language=>'sl'
,p_message_text=>'Tortni'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142597171515752432)
,p_name=>'APEX.IG.PIVOT'
,p_message_language=>'sl'
,p_message_text=>'Vrtenje'
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142562345117752422)
,p_name=>'APEX.IG.PIVOT_VIEW'
,p_message_language=>'sl'
,p_message_text=>'Vrtilni pogled'
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142643146277752446)
,p_name=>'APEX.IG.PLACEHOLDER_INVALUES'
,p_message_language=>'sl'
,p_message_text=>unistr('Vrednosti lo\010Dite s/z "%0"')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142634065504752443)
,p_name=>'APEX.IG.POLAR'
,p_message_language=>'sl'
,p_message_text=>'Polarni'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142639365184752445)
,p_name=>'APEX.IG.POSITION_CENTER'
,p_message_language=>'sl'
,p_message_text=>'Sredina'
,p_is_js_message=>true
,p_version_scn=>2705551
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142639481750752445)
,p_name=>'APEX.IG.POSITION_END'
,p_message_language=>'sl'
,p_message_text=>'Konec'
,p_is_js_message=>true
,p_version_scn=>2705551
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142639211422752445)
,p_name=>'APEX.IG.POSITION_START'
,p_message_language=>'sl'
,p_message_text=>unistr('Za\010Detek')
,p_is_js_message=>true
,p_version_scn=>2705551
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142595011756752432)
,p_name=>'APEX.IG.PRIMARY'
,p_message_language=>'sl'
,p_message_text=>'Primarno'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142595343760752432)
,p_name=>'APEX.IG.PRIMARY_DEFAULT'
,p_message_language=>'sl'
,p_message_text=>'Primarno privzeto'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142611888382752437)
,p_name=>'APEX.IG.PRIMARY_REPORT'
,p_message_language=>'sl'
,p_message_text=>unistr('Primarno poro\010Dilo')
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142485424713752399)
,p_name=>'APEX.IG.PRINT_ACCESSIBLE.PROMPT'
,p_message_language=>'sl'
,p_message_text=>unistr('Vklju\010Ditev oznak za dostopnost')
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142482867892752398)
,p_name=>'APEX.IG.PRINT_ORIENTATION.LOV.HORIZONTAL.D'
,p_message_language=>'sl'
,p_message_text=>unistr('Le\017Ee\010De')
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142482950714752398)
,p_name=>'APEX.IG.PRINT_ORIENTATION.LOV.VERTICAL.D'
,p_message_language=>'sl'
,p_message_text=>unistr('Pokon\010Dno')
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142482765678752398)
,p_name=>'APEX.IG.PRINT_ORIENTATION.PROMPT'
,p_message_language=>'sl'
,p_message_text=>'Usmerjenost strani'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142482622614752398)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.A3.D'
,p_message_language=>'sl'
,p_message_text=>'A3'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142482535231752398)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.A4.D'
,p_message_language=>'sl'
,p_message_text=>'A4'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142485683000752399)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.CUSTOM.D'
,p_message_language=>'sl'
,p_message_text=>'Prilagojeno'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142482382850752398)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.LEGAL.D'
,p_message_language=>'sl'
,p_message_text=>'Pravno'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142482286774752398)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.LETTER.D'
,p_message_language=>'sl'
,p_message_text=>unistr('\010Crka')
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142482447520752398)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.TABLOID.D'
,p_message_language=>'sl'
,p_message_text=>'Tabloid'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142482135951752398)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.PROMPT'
,p_message_language=>'sl'
,p_message_text=>'Velikost strani'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142447710976752388)
,p_name=>'APEX.IG.PRINT_STRIP_RICH_TEXT.PROMPT'
,p_message_language=>'sl'
,p_message_text=>unistr('\010Ci\0161\010Denje obogatenega besedila')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142634151246752443)
,p_name=>'APEX.IG.RADAR'
,p_message_language=>'sl'
,p_message_text=>'Radarski'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142634288145752443)
,p_name=>'APEX.IG.RANGE'
,p_message_language=>'sl'
,p_message_text=>'Razpon'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142644491259752447)
,p_name=>'APEX.IG.REFRESH'
,p_message_language=>'sl'
,p_message_text=>unistr('Osve\017Ei')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142599396700752433)
,p_name=>'APEX.IG.REFRESH_ROW'
,p_message_language=>'sl'
,p_message_text=>unistr('Osve\017Ei vrstico')
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142598192638752433)
,p_name=>'APEX.IG.REFRESH_ROWS'
,p_message_language=>'sl'
,p_message_text=>unistr('Osve\017Ei vrstice')
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142603312114752434)
,p_name=>'APEX.IG.REGION_NOT_EXIST'
,p_message_language=>'sl'
,p_message_text=>unistr('Podro\010Dje interaktivne mre\017Ee ne obstaja v aplikaciji %0 na strani %1 in na podro\010Dju %2.')
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142563879890752422)
,p_name=>'APEX.IG.REMOVE_CONTROL'
,p_message_language=>'sl'
,p_message_text=>'Odstrani %0'
,p_is_js_message=>true
,p_version_scn=>2705535
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142594400668752431)
,p_name=>'APEX.IG.REPORT'
,p_message_language=>'sl'
,p_message_text=>unistr('Poro\010Dilo')
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142653647974752449)
,p_name=>'APEX.IG.REPORT.DELETED'
,p_message_language=>'sl'
,p_message_text=>unistr('Poro\010Dilo je bilo izbrisano')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142653319417752449)
,p_name=>'APEX.IG.REPORT.SAVED.ALTERNATIVE'
,p_message_language=>'sl'
,p_message_text=>unistr('Nadomestno poro\010Dilo je bilo shranjeno za vse uporabnike')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142653217596752449)
,p_name=>'APEX.IG.REPORT.SAVED.DEFAULT'
,p_message_language=>'sl'
,p_message_text=>unistr('Privzeto poro\010Dilo je bilo shranjeno za vse uporabnike')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142653526227752449)
,p_name=>'APEX.IG.REPORT.SAVED.PRIVATE'
,p_message_language=>'sl'
,p_message_text=>unistr('Zasebno poro\010Dilo je bilo shranjeno')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142653415093752449)
,p_name=>'APEX.IG.REPORT.SAVED.PUBLIC'
,p_message_language=>'sl'
,p_message_text=>unistr('Javno poro\010Dilo je bilo shranjeno za vse uporabnike')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142603441604752434)
,p_name=>'APEX.IG.REPORT_ALIAS_DOES_NOT_EXIST'
,p_message_language=>'sl'
,p_message_text=>unistr('Shranjena interaktivna mre\017Ea z imenom %0 ne obstaja.')
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142588702433752430)
,p_name=>'APEX.IG.REPORT_DATA_AS_OF.X.MINUTES_AGO'
,p_message_language=>'sl'
,p_message_text=>unistr('Podatki mre\017Ee pred toliko minutami: %0')
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142588675317752430)
,p_name=>'APEX.IG.REPORT_DATA_AS_OF_ONE_MINUTE_AGO'
,p_message_language=>'sl'
,p_message_text=>unistr('Podatki mre\017Ee pred toliko minutami: 1')
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142524167266752410)
,p_name=>'APEX.IG.REPORT_DOES_NOT_EXIST'
,p_message_language=>'sl'
,p_message_text=>unistr('Poro\010Dilo o interaktivni mre\017Ei ne obstaja.')
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142646687306752447)
,p_name=>'APEX.IG.REPORT_EDIT'
,p_message_language=>'sl'
,p_message_text=>unistr('Poro\010Dilo - Urejanje')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142603259408752434)
,p_name=>'APEX.IG.REPORT_ID_DOES_NOT_EXIST'
,p_message_language=>'sl'
,p_message_text=>unistr('Shranjena interaktivna mre\017Ea z ID-jem %0 ne obstaja.')
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142646566011752447)
,p_name=>'APEX.IG.REPORT_SAVE_AS'
,p_message_language=>'sl'
,p_message_text=>unistr('Poro\010Dilo - Shrani kot')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142563986920752422)
,p_name=>'APEX.IG.REPORT_SETTINGS'
,p_message_language=>'sl'
,p_message_text=>unistr('Nastavitve mre\017Ee')
,p_is_js_message=>true
,p_version_scn=>2705535
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142654537423752450)
,p_name=>'APEX.IG.REPORT_STATIC_ID_DOES_NOT_EXIST'
,p_message_language=>'sl'
,p_message_text=>unistr('Shranjena interaktivna mre\017Ea s stati\010Dnim ID-jem %0 ne obstaja.')
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142649587366752448)
,p_name=>'APEX.IG.REPORT_VIEW'
,p_message_language=>'sl'
,p_message_text=>unistr('Pogled poro\010Dila')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142563006774752422)
,p_name=>'APEX.IG.RESET'
,p_message_language=>'sl'
,p_message_text=>'Ponastavi'
,p_is_js_message=>true
,p_version_scn=>2705535
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142599428957752433)
,p_name=>'APEX.IG.REVERT_CHANGES'
,p_message_language=>'sl'
,p_message_text=>'Povrni spremembe'
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142598274222752433)
,p_name=>'APEX.IG.REVERT_ROWS'
,p_message_language=>'sl'
,p_message_text=>'Povrni vrstice'
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142595411505752432)
,p_name=>'APEX.IG.ROW'
,p_message_language=>'sl'
,p_message_text=>'Vrstica'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142594328383752431)
,p_name=>'APEX.IG.ROWS_PER_PAGE'
,p_message_language=>'sl'
,p_message_text=>unistr('\0160tevilo vrstic na stran')
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142654141390752449)
,p_name=>'APEX.IG.ROW_ACTIONS'
,p_message_language=>'sl'
,p_message_text=>'Dejanja za vrstice'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142655325090752450)
,p_name=>'APEX.IG.ROW_ACTIONS_FOR'
,p_message_language=>'sl'
,p_message_text=>'Dejanja za vrstico %0'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142563355261752422)
,p_name=>'APEX.IG.SAVE'
,p_message_language=>'sl'
,p_message_text=>'Shrani'
,p_is_js_message=>true
,p_version_scn=>2705535
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142608472282752436)
,p_name=>'APEX.IG.SAVED'
,p_message_language=>'sl'
,p_message_text=>'shranjeno'
,p_is_js_message=>true
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142513098624752407)
,p_name=>'APEX.IG.SAVED_REPORT'
,p_message_language=>'sl'
,p_message_text=>unistr('Shranjeno poro\010Dilo: %0')
,p_is_js_message=>true
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142561576452752422)
,p_name=>'APEX.IG.SAVED_REPORTS'
,p_message_language=>'sl'
,p_message_text=>unistr('Shranjena poro\010Dila')
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142561601405752422)
,p_name=>'APEX.IG.SAVED_REPORT_DEFAULT'
,p_message_language=>'sl'
,p_message_text=>'Privzeto'
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142535116926752414)
,p_name=>'APEX.IG.SAVED_REPORT_EXISTS'
,p_message_language=>'sl'
,p_message_text=>unistr('Shranjeno poro\010Dilo z imenom %0 \017Ee obstaja. Vnesite novo ime.')
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142561775254752422)
,p_name=>'APEX.IG.SAVED_REPORT_PRIVATE'
,p_message_language=>'sl'
,p_message_text=>'Zasebno'
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142561825438752422)
,p_name=>'APEX.IG.SAVED_REPORT_PUBLIC'
,p_message_language=>'sl'
,p_message_text=>'Javno'
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142649276212752448)
,p_name=>'APEX.IG.SAVE_AS'
,p_message_language=>'sl'
,p_message_text=>'Shrani kot'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142597537466752432)
,p_name=>'APEX.IG.SAVE_REPORT_SETTINGS'
,p_message_language=>'sl'
,p_message_text=>unistr('Shrani nastavitve poro\010Dila')
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142634376833752443)
,p_name=>'APEX.IG.SCATTER'
,p_message_language=>'sl'
,p_message_text=>'Raztreseni'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142561446224752421)
,p_name=>'APEX.IG.SEARCH'
,p_message_language=>'sl'
,p_message_text=>'Iskanje'
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142641532420752446)
,p_name=>'APEX.IG.SEARCH.ALL_COLUMNS'
,p_message_language=>'sl'
,p_message_text=>'Iskanje: Vsi besedilni stolpci'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142561374781752421)
,p_name=>'APEX.IG.SEARCH.COLUMN'
,p_message_language=>'sl'
,p_message_text=>'Iskanje: %0'
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142640816283752445)
,p_name=>'APEX.IG.SEARCH.ORACLE_TEXT'
,p_message_language=>'sl'
,p_message_text=>'Iskanje: Polno besedilo'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142588562051752430)
,p_name=>'APEX.IG.SEARCH_FOR.X'
,p_message_language=>'sl'
,p_message_text=>'Iskanje "%0"'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142630943214752442)
,p_name=>'APEX.IG.SELECT'
,p_message_language=>'sl'
,p_message_text=>'- Izbira -'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142571012124752424)
,p_name=>'APEX.IG.SELECTION'
,p_message_language=>'sl'
,p_message_text=>'Izbira'
,p_is_js_message=>true
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142624100385752440)
,p_name=>'APEX.IG.SELECT_1_ROW_IN_MASTER'
,p_message_language=>'sl'
,p_message_text=>unistr('Izberite 1 vrstico znotraj nadrejenega podro\010Dja')
,p_is_js_message=>true
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142561265434752421)
,p_name=>'APEX.IG.SELECT_COLUMNS_TO_SEARCH'
,p_message_language=>'sl'
,p_message_text=>'Izbira stolpcev za iskanje'
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142653856485752449)
,p_name=>'APEX.IG.SEL_ACTIONS'
,p_message_language=>'sl'
,p_message_text=>'Dejanja izbire'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142571299909752424)
,p_name=>'APEX.IG.SEL_MODE_CELL'
,p_message_language=>'sl'
,p_message_text=>'Izbira celice'
,p_is_js_message=>true
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142571182347752424)
,p_name=>'APEX.IG.SEL_MODE_ROW'
,p_message_language=>'sl'
,p_message_text=>'Izbira vrstice'
,p_is_js_message=>true
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142642158448752446)
,p_name=>'APEX.IG.SEND_AS_EMAIL'
,p_message_language=>'sl'
,p_message_text=>unistr('Po\0161lji kot e-po\0161to')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142634762377752444)
,p_name=>'APEX.IG.SERIES_COLUMN'
,p_message_language=>'sl'
,p_message_text=>'Serija'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142558921106752421)
,p_name=>'APEX.IG.SHOW'
,p_message_language=>'sl'
,p_message_text=>'Prikaz'
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142614132793752437)
,p_name=>'APEX.IG.SHOW_OVERALL_VALUE'
,p_message_language=>'sl'
,p_message_text=>unistr('Prika\017Ei skupno vrednost')
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142599025573752433)
,p_name=>'APEX.IG.SINGLE_ROW_VIEW'
,p_message_language=>'sl'
,p_message_text=>'Pogled ene vrstice'
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142597308035752432)
,p_name=>'APEX.IG.SORT'
,p_message_language=>'sl'
,p_message_text=>'Razvrsti'
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142634884627752444)
,p_name=>'APEX.IG.SORT_BY'
,p_message_language=>'sl'
,p_message_text=>'Razvrsti po'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142654203548752450)
,p_name=>'APEX.IG.SORT_ONLY_ONE_PER_COLUMN'
,p_message_language=>'sl'
,p_message_text=>unistr('Dolo\010Dite lahko samo eno razvrstitev na stolpec.')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142654053839752449)
,p_name=>'APEX.IG.SRV_CHANGE_MENU'
,p_message_language=>'sl'
,p_message_text=>'Sprememba'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142635820104752444)
,p_name=>'APEX.IG.STACK'
,p_message_language=>'sl'
,p_message_text=>'Sklad'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142591365191752431)
,p_name=>'APEX.IG.STARTS_WITH'
,p_message_language=>'sl'
,p_message_text=>unistr('se za\010Dne s/z')
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142634462058752443)
,p_name=>'APEX.IG.STOCK'
,p_message_language=>'sl'
,p_message_text=>'Zaloga'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142553785953752419)
,p_name=>'APEX.IG.STRETCH_COLUMNS'
,p_message_language=>'sl'
,p_message_text=>unistr('Raztegni \0161irino stolpcev')
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142597789944752432)
,p_name=>'APEX.IG.SUBSCRIPTION'
,p_message_language=>'sl'
,p_message_text=>unistr('Naro\010Dnina')
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142615776345752438)
,p_name=>'APEX.IG.SUM'
,p_message_language=>'sl'
,p_message_text=>'Vsota'
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142655587508752450)
,p_name=>'APEX.IG.SUMMARY'
,p_message_language=>'sl'
,p_message_text=>unistr('Interaktivna mre\017Ea. Poro\010Dilo: %0, Pogled: %1.')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142649639869752448)
,p_name=>'APEX.IG.SUM_OVERALL'
,p_message_language=>'sl'
,p_message_text=>'Skupna vsota'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142632611927752443)
,p_name=>'APEX.IG.TARGET_COLUMN'
,p_message_language=>'sl'
,p_message_text=>'Cilj'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142639089226752445)
,p_name=>'APEX.IG.TEXT_COLOR'
,p_message_language=>'sl'
,p_message_text=>'Barva besedila'
,p_is_js_message=>true
,p_version_scn=>2705551
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142564058041752422)
,p_name=>'APEX.IG.TOGGLE'
,p_message_language=>'sl'
,p_message_text=>'Preklop'
,p_is_js_message=>true
,p_version_scn=>2705535
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142446121802752387)
,p_name=>'APEX.IG.TOOLBAR'
,p_message_language=>'sl'
,p_message_text=>unistr('Mre\017Ea')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142614060457752437)
,p_name=>'APEX.IG.TOOLTIP'
,p_message_language=>'sl'
,p_message_text=>'Zaslonski namig'
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142594547901752432)
,p_name=>'APEX.IG.TYPE'
,p_message_language=>'sl'
,p_message_text=>'Tip'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142598923861752433)
,p_name=>'APEX.IG.UNFREEZE'
,p_message_language=>'sl'
,p_message_text=>'Odmrzni'
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142596079890752432)
,p_name=>'APEX.IG.UNIT'
,p_message_language=>'sl'
,p_message_text=>'Enota'
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142641943349752446)
,p_name=>'APEX.IG.UNSAVED_CHANGES_CONTINUE_CONFIRM'
,p_message_language=>'sl'
,p_message_text=>unistr('Obstajajo neshranjene spremembe. Ali \017Eelite nadaljevati?')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142595963494752432)
,p_name=>'APEX.IG.VALUE'
,p_message_language=>'sl'
,p_message_text=>'Vrednost'
,p_is_js_message=>true
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142631700366752443)
,p_name=>'APEX.IG.VALUE_COLUMN'
,p_message_language=>'sl'
,p_message_text=>'Vrednost'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142636675359752444)
,p_name=>'APEX.IG.VALUE_REQUIRED'
,p_message_language=>'sl'
,p_message_text=>'Zahtevana je vrednost.'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142621834630752440)
,p_name=>'APEX.IG.VALUE_TIMESTAMP_TZ'
,p_message_language=>'sl'
,p_message_text=>unistr('Vrednost (\010Dasovnega pasu ni mogo\010De spremeniti)')
,p_is_js_message=>true
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142640546626752445)
,p_name=>'APEX.IG.VARCHAR2'
,p_message_language=>'sl'
,p_message_text=>'Besedilo'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142633074121752443)
,p_name=>'APEX.IG.VERTICAL'
,p_message_language=>'sl'
,p_message_text=>unistr('Navpi\010Dno')
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142594041487752431)
,p_name=>'APEX.IG.VIEW'
,p_message_language=>'sl'
,p_message_text=>'Pogled'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142529111963752412)
,p_name=>'APEX.IG.VIEW_MODE_DESCRIPTION'
,p_message_language=>'sl'
,p_message_text=>unistr('Mre\017Ea v na\010Dinu ogleda, pritisnite za urejanje')
,p_is_js_message=>true
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142631014744752442)
,p_name=>'APEX.IG.VISIBLE'
,p_message_language=>'sl'
,p_message_text=>'Prikazano'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142632553742752443)
,p_name=>'APEX.IG.VOLUME_COLUMN'
,p_message_language=>'sl'
,p_message_text=>unistr('Podro\010Dje')
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142591911542752431)
,p_name=>'APEX.IG.WEEKS'
,p_message_language=>'sl'
,p_message_text=>'tedni'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142631135066752442)
,p_name=>'APEX.IG.WIDTH'
,p_message_language=>'sl'
,p_message_text=>unistr('Minimalna \0161irina stolpca (slikovne pike)')
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142583150442752428)
,p_name=>'APEX.IG.X.BETWEEN.Y.AND.Z'
,p_message_language=>'sl'
,p_message_text=>'%0 med %1 in %2'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142582860534752428)
,p_name=>'APEX.IG.X.CONTAINS.Y'
,p_message_language=>'sl'
,p_message_text=>'%0 vsebuje %1'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142582959534752428)
,p_name=>'APEX.IG.X.DOES_NOT_CONTAIN.Y'
,p_message_language=>'sl'
,p_message_text=>'%0 ne vsebuje %1'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142558377788752421)
,p_name=>'APEX.IG.X.DOES_NOT_START_WITH.Y'
,p_message_language=>'sl'
,p_message_text=>unistr('%0 se ne za\010Dne s/z %1')
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142581623262752428)
,p_name=>'APEX.IG.X.EQUALS.Y'
,p_message_language=>'sl'
,p_message_text=>'%0 je enako %1'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142581869948752428)
,p_name=>'APEX.IG.X.GREATER_THAN.Y'
,p_message_language=>'sl'
,p_message_text=>unistr('%0 ve\010Dje kot %1')
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142581927648752428)
,p_name=>'APEX.IG.X.GREATER_THAN_OR_EQUALS.Y'
,p_message_language=>'sl'
,p_message_text=>unistr('%0 ve\010Dje kot ali enako %1')
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142582619359752428)
,p_name=>'APEX.IG.X.IN.Y'
,p_message_language=>'sl'
,p_message_text=>'%0 v %1'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142583842650752428)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.DAYS'
,p_message_language=>'sl'
,p_message_text=>'%0 v zadnjih %1 dneh'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142583600204752428)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.HOURS'
,p_message_language=>'sl'
,p_message_text=>'%0 v zadnjih %1 urah'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142583487158752428)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.MINUTES'
,p_message_language=>'sl'
,p_message_text=>'%0 v zadnjih %1 minutah'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142584223135752428)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.MONTHS'
,p_message_language=>'sl'
,p_message_text=>'%0 v zadnjih %1 mesecih'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142584097009752428)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.WEEKS'
,p_message_language=>'sl'
,p_message_text=>'%0 v zadnjih %1 tednih'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142584415528752428)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.YEARS'
,p_message_language=>'sl'
,p_message_text=>'%0 v zadnjih toliko letih: %1'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142583760034752428)
,p_name=>'APEX.IG.X.IN_THE_LAST_DAY'
,p_message_language=>'sl'
,p_message_text=>'%0 v zadnjem dnevu'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142583565581752428)
,p_name=>'APEX.IG.X.IN_THE_LAST_HOUR'
,p_message_language=>'sl'
,p_message_text=>'%0 v zadnji uri'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142583391638752428)
,p_name=>'APEX.IG.X.IN_THE_LAST_MINUTE'
,p_message_language=>'sl'
,p_message_text=>'%0 v zadnji minuti'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142584184572752428)
,p_name=>'APEX.IG.X.IN_THE_LAST_MONTH'
,p_message_language=>'sl'
,p_message_text=>'%0 v zadnjem mesecu'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142583964399752428)
,p_name=>'APEX.IG.X.IN_THE_LAST_WEEK'
,p_message_language=>'sl'
,p_message_text=>'%0 v zadnjem tednu'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142584319830752428)
,p_name=>'APEX.IG.X.IN_THE_LAST_YEAR'
,p_message_language=>'sl'
,p_message_text=>'%0 v zadnjem letu'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142586289848752429)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.DAYS'
,p_message_language=>'sl'
,p_message_text=>'%0 v naslednjih %1 dneh'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142586052626752429)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.HOURS'
,p_message_language=>'sl'
,p_message_text=>'%0 v naslednjih %1 urah'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142585887435752429)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.MINUTES'
,p_message_language=>'sl'
,p_message_text=>'%0 v naslednjih %1 minutah'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142586667502752429)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.MONTHS'
,p_message_language=>'sl'
,p_message_text=>'%0 v naslednjih %1 mesecih'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142586467738752429)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.WEEKS'
,p_message_language=>'sl'
,p_message_text=>'%0 v naslednjih %1 tednih'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142586884350752429)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.YEARS'
,p_message_language=>'sl'
,p_message_text=>'%0 v naslednjih %1 letih'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142586161380752429)
,p_name=>'APEX.IG.X.IN_THE_NEXT_DAY'
,p_message_language=>'sl'
,p_message_text=>'%0 v naslednjem dnevu'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142585997924752429)
,p_name=>'APEX.IG.X.IN_THE_NEXT_HOUR'
,p_message_language=>'sl'
,p_message_text=>'%0 v naslednji uri'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142585766931752429)
,p_name=>'APEX.IG.X.IN_THE_NEXT_MINUTE'
,p_message_language=>'sl'
,p_message_text=>'%0 v naslednji minuti'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142586579611752429)
,p_name=>'APEX.IG.X.IN_THE_NEXT_MONTH'
,p_message_language=>'sl'
,p_message_text=>'%0 v naslednjem mesecu'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142586341880752429)
,p_name=>'APEX.IG.X.IN_THE_NEXT_WEEK'
,p_message_language=>'sl'
,p_message_text=>'%0 v naslednjem tednu'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142586798989752429)
,p_name=>'APEX.IG.X.IN_THE_NEXT_YEAR'
,p_message_language=>'sl'
,p_message_text=>'%0 v naslednjem letu'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142582373793752428)
,p_name=>'APEX.IG.X.IS_NOT_NULL'
,p_message_language=>'sl'
,p_message_text=>'%0 ni prazno'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142582254914752428)
,p_name=>'APEX.IG.X.IS_NULL'
,p_message_language=>'sl'
,p_message_text=>'%0 je prazno'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142582044836752428)
,p_name=>'APEX.IG.X.LESS_THAN.Y'
,p_message_language=>'sl'
,p_message_text=>unistr('%0 manj\0161e kot %1')
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142582173576752428)
,p_name=>'APEX.IG.X.LESS_THAN_OR_EQUALS.Y'
,p_message_language=>'sl'
,p_message_text=>unistr('%0 manj\0161e kot ali enako %1')
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142582417456752428)
,p_name=>'APEX.IG.X.LIKE.Y'
,p_message_language=>'sl'
,p_message_text=>'%0 kot %1'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142583020918752428)
,p_name=>'APEX.IG.X.MATCHES_REGULAR_EXPRESSION.Y'
,p_message_language=>'sl'
,p_message_text=>'%0 se ujema z regularnim izrazom %1'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142588986022752430)
,p_name=>'APEX.IG.X.MINUTES_AGO'
,p_message_language=>'sl'
,p_message_text=>'Pred toliko minutami: %0'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142583203880752428)
,p_name=>'APEX.IG.X.NOT_BETWEEN.Y.AND.Z'
,p_message_language=>'sl'
,p_message_text=>'%0 ni med %1 in %2'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142581725067752428)
,p_name=>'APEX.IG.X.NOT_EQUALS.Y'
,p_message_language=>'sl'
,p_message_text=>'%0 ni enako %1'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142582714951752428)
,p_name=>'APEX.IG.X.NOT_IN.Y'
,p_message_language=>'sl'
,p_message_text=>'%0 ni v %1'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142585028044752429)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.DAYS'
,p_message_language=>'sl'
,p_message_text=>'%0 ni v zadnjih toliko dneh: %1'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142584828997752429)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.HOURS'
,p_message_language=>'sl'
,p_message_text=>'%0 ni v zadnjih toliko urah: %1'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142584666059752428)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.MINUTES'
,p_message_language=>'sl'
,p_message_text=>'%0 ni v zadnjih toliko minutah: %1'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142585476881752429)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.MONTHS'
,p_message_language=>'sl'
,p_message_text=>'%0 ni v zadnjih toliko mesecih: %1'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142585256364752429)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.WEEKS'
,p_message_language=>'sl'
,p_message_text=>'%0 ni v zadnjih toliko tednih: %1'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142585671312752429)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.YEARS'
,p_message_language=>'sl'
,p_message_text=>'%0 ni v zadnjih %1 letih'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142584901134752429)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_DAY'
,p_message_language=>'sl'
,p_message_text=>'%0 ni v zadnjem dnevu'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142584795552752429)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_HOUR'
,p_message_language=>'sl'
,p_message_text=>'%0 ni v zadnji uri'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142584519975752428)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_MINUTE'
,p_message_language=>'sl'
,p_message_text=>'%0 ni v zadnji minuti'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142585364779752429)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_MONTH'
,p_message_language=>'sl'
,p_message_text=>'%0 ni v zadnjem mesecu'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142585111343752429)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_WEEK'
,p_message_language=>'sl'
,p_message_text=>'%0 ni v zadnjem tednu'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142585523120752429)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_YEAR'
,p_message_language=>'sl'
,p_message_text=>'%0 ni v zadnjem letu'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142587466414752429)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.DAYS'
,p_message_language=>'sl'
,p_message_text=>'%0 ni v naslednjih %1 dneh'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142587204079752429)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.HOURS'
,p_message_language=>'sl'
,p_message_text=>'%0 ni v naslednjih %1 urah'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142587036011752429)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.MINUTES'
,p_message_language=>'sl'
,p_message_text=>'%0 ni v naslednjih %1 minutah'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142587891566752429)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.MONTHS'
,p_message_language=>'sl'
,p_message_text=>'%0 ni v naslednjih %1 mesecih'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142587640218752429)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.WEEKS'
,p_message_language=>'sl'
,p_message_text=>'%0 ni v naslednjih %1 tednih'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142588055575752429)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.YEARS'
,p_message_language=>'sl'
,p_message_text=>'%0 ni v naslednjih %1 letih'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142587316186752429)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_DAY'
,p_message_language=>'sl'
,p_message_text=>'%0 ni v naslednjem dnevu'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142587166940752429)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_HOUR'
,p_message_language=>'sl'
,p_message_text=>'%0 ni v naslednji uri'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142586933470752429)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_MINUTE'
,p_message_language=>'sl'
,p_message_text=>'%0 ni v naslednji minuti'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142587790826752429)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_MONTH'
,p_message_language=>'sl'
,p_message_text=>'%0 ni v naslednjem mesecu'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142587524480752429)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_WEEK'
,p_message_language=>'sl'
,p_message_text=>'%0 ni v naslednjem tednu'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142587970509752429)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_YEAR'
,p_message_language=>'sl'
,p_message_text=>'%0 ni v naslednjem letu'
,p_is_js_message=>true
,p_version_scn=>2705540
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142582508953752428)
,p_name=>'APEX.IG.X.NOT_LIKE.Y'
,p_message_language=>'sl'
,p_message_text=>'%0 ni kot %1'
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142589409980752430)
,p_name=>'APEX.IG.X.STARTS_WITH.Y'
,p_message_language=>'sl'
,p_message_text=>unistr('%0 se za\010Dne s/z %1')
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142631851662752443)
,p_name=>'APEX.IG.X_COLUMN'
,p_message_language=>'sl'
,p_message_text=>'X'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142592161613752431)
,p_name=>'APEX.IG.YEARS'
,p_message_language=>'sl'
,p_message_text=>'leta'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142631995397752443)
,p_name=>'APEX.IG.Y_COLUMN'
,p_message_language=>'sl'
,p_message_text=>'Y'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142632052509752443)
,p_name=>'APEX.IG.Z_COLUMN'
,p_message_language=>'sl'
,p_message_text=>'Z'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142641018192752445)
,p_name=>'APEX.IG_FORMAT_SAMPLE_1'
,p_message_language=>'sl'
,p_message_text=>'Ponedeljek, 12. januar 2016'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142641163008752445)
,p_name=>'APEX.IG_FORMAT_SAMPLE_2'
,p_message_language=>'sl'
,p_message_text=>'Januar'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142641204681752446)
,p_name=>'APEX.IG_FORMAT_SAMPLE_3'
,p_message_language=>'sl'
,p_message_text=>'Pred 16 urami'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142641360440752446)
,p_name=>'APEX.IG_FORMAT_SAMPLE_4'
,p_message_language=>'sl'
,p_message_text=>'v roku 16 h'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142459397688752391)
,p_name=>'APEX.ITEM.CROPPER.APPLY'
,p_message_language=>'sl'
,p_message_text=>'Dodeli'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142451333909752389)
,p_name=>'APEX.ITEM.CROPPER.HELP.TEXT'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Povlecite sliko in jo z drsnikom za pove\010Davo prestavite znotraj okvirja.</p>'),
'',
unistr('<p>Kadar je fokus na obrezovalniku slik, so na voljo naslednje bli\017Enjice na tipkovnici:</p>'),
'<ul>',
unistr('    <li>Pu\0161\010Dica levo: Premik slike levo*</li>'),
unistr('    <li>Pu\0161\010Dica navzgor: Premik slike navzgor*</li>'),
unistr('    <li>Pu\0161\010Dica desno: Premik slike desno*</li>'),
unistr('    <li>Pu\0161\010Dica navzdol: Premik slike navzdol*</li>'),
unistr('    <li>I: Pove\010Dava</li>'),
unistr('    <li>O: Pomanj\0161ava</li>'),
'    <li>L: Rotacija levo</li>',
'    <li>R: Rotacija desno</li>',
'</ul>',
'',
unistr('<p class="margin-top-md"><em>*Za hitrej\0161e premikanje dr\017Eite tipko Shift</em></p>')))
,p_is_js_message=>true
,p_version_scn=>2705517
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142451500685752389)
,p_name=>'APEX.ITEM.CROPPER.HELP.TITLE'
,p_message_language=>'sl'
,p_message_text=>unistr('Pomo\010D za obrezovanje slike')
,p_is_js_message=>true
,p_version_scn=>2705517
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142459448068752391)
,p_name=>'APEX.ITEM.CROPPER.RESET'
,p_message_language=>'sl'
,p_message_text=>'Ponastavi'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142451870948752389)
,p_name=>'APEX.ITEM.CROPPER.TITLE'
,p_message_language=>'sl'
,p_message_text=>'Obrezovanje slike'
,p_is_js_message=>true
,p_version_scn=>2705517
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142459503640752391)
,p_name=>'APEX.ITEM.CROPPER.ZOOM_SLIDER_LABEL'
,p_message_language=>'sl'
,p_message_text=>unistr('Premaknite drsnik za prilagajanje ravni pove\010Dave')
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142489137697752400)
,p_name=>'APEX.ITEM.FILE.ACCEPTED_TYPES'
,p_message_language=>'sl'
,p_message_text=>'Neveljaven tip datoteke. Podprti tipi datotek %0.'
,p_is_js_message=>true
,p_version_scn=>2705521
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142623594901752440)
,p_name=>'APEX.ITEM.FILE.BROWSE'
,p_message_language=>'sl'
,p_message_text=>'Prebrskaj'
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142623223433752440)
,p_name=>'APEX.ITEM.FILE.CHOOSE_FILE'
,p_message_language=>'sl'
,p_message_text=>'Izbira datoteke'
,p_is_js_message=>true
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142623367842752440)
,p_name=>'APEX.ITEM.FILE.CHOOSE_FILES'
,p_message_language=>'sl'
,p_message_text=>'Izbira datotek'
,p_is_js_message=>true
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142488962015752400)
,p_name=>'APEX.ITEM.FILE.DROP_FILE'
,p_message_language=>'sl'
,p_message_text=>'Povlecite in spustite'
,p_is_js_message=>true
,p_version_scn=>2705521
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142489362323752400)
,p_name=>'APEX.ITEM.FILE.DROP_FILES'
,p_message_language=>'sl'
,p_message_text=>'Povlecite in spustite datoteke'
,p_version_scn=>2705521
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142490743484752400)
,p_name=>'APEX.ITEM.FILE.DROP_OR_CHOOSE_FILE'
,p_message_language=>'sl'
,p_message_text=>'Izberite datoteko ali jo spustite sem.'
,p_is_js_message=>true
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142490869187752400)
,p_name=>'APEX.ITEM.FILE.DROP_OR_CHOOSE_FILES'
,p_message_language=>'sl'
,p_message_text=>'Izberite ali spustite datoteke sem.'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142490934624752401)
,p_name=>'APEX.ITEM.FILE.DROP_OR_SELECT_FILE'
,p_message_language=>'sl'
,p_message_text=>'Izberite datoteko ali jo spustite sem.'
,p_is_js_message=>true
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142491084875752401)
,p_name=>'APEX.ITEM.FILE.DROP_OR_SELECT_FILES'
,p_message_language=>'sl'
,p_message_text=>'Izberite ali spustite datoteke sem.'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142489226002752400)
,p_name=>'APEX.ITEM.FILE.FILES_WITH_COUNT'
,p_message_language=>'sl'
,p_message_text=>'Datoteke: %0'
,p_is_js_message=>true
,p_version_scn=>2705521
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142489044110752400)
,p_name=>'APEX.ITEM.FILE.MAX_FILE_SIZE'
,p_message_language=>'sl'
,p_message_text=>'Datoteka je prevelika. Maksimalna velikost datoteke je %0.'
,p_is_js_message=>true
,p_version_scn=>2705521
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142469510461752394)
,p_name=>'APEX.ITEM.FILE.MULTIPLE_FILES_NOT_SUPPORTED'
,p_message_language=>'sl'
,p_message_text=>unistr('Ve\010D nalaganj datotek ni podprtih.')
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142452425725752389)
,p_name=>'APEX.ITEM.FILE.REMOVE'
,p_message_language=>'sl'
,p_message_text=>'Odstrani'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142457907238752391)
,p_name=>'APEX.ITEM.GEOCODE.ADDRESS_REQUIRED'
,p_message_language=>'sl'
,p_message_text=>'Naslov je zahtevan.'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142456896039752390)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_CITY'
,p_message_language=>'sl'
,p_message_text=>'Kraj'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142457204097752390)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_COUNTRY'
,p_message_language=>'sl'
,p_message_text=>unistr('Koda dr\017Eave')
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142456956908752390)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_HOUSENUMBER'
,p_message_language=>'sl'
,p_message_text=>unistr('Hi\0161na \0161tevilka')
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142457851585752391)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_LATITUDE'
,p_message_language=>'sl'
,p_message_text=>unistr('\0160irina')
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142457788144752391)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_LONGITUDE'
,p_message_language=>'sl'
,p_message_text=>unistr('Dol\017Eina')
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142457615277752391)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_MAPLINK'
,p_message_language=>'sl'
,p_message_text=>unistr('Poka\017Ei na zemljevidu')
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142457396370752391)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_MATCHSCORE'
,p_message_language=>'sl'
,p_message_text=>'Rezultat'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142457082661752390)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_POSTALCODE'
,p_message_language=>'sl'
,p_message_text=>unistr('Po\0161tna \0161tevilka')
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142457155811752390)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_STATE'
,p_message_language=>'sl'
,p_message_text=>'Stanje'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142456704075752390)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_STREET'
,p_message_language=>'sl'
,p_message_text=>'Ulica'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142456640255752390)
,p_name=>'APEX.ITEM.GEOCODE.DIALOG_TITLE'
,p_message_language=>'sl'
,p_message_text=>'Rezultati geokodiranja'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142488163173752400)
,p_name=>'APEX.ITEM.GEOCODE.GEOCODING_DONE'
,p_message_language=>'sl'
,p_message_text=>'Geokodirano'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142488219940752400)
,p_name=>'APEX.ITEM.GEOCODE.GEOCODING_OPEN'
,p_message_language=>'sl'
,p_message_text=>'Ni geokodirano'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142457598067752391)
,p_name=>'APEX.ITEM.GEOCODE.MAP_DIALOG_TITLE'
,p_message_language=>'sl'
,p_message_text=>'Zemljevid'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142457465637752391)
,p_name=>'APEX.ITEM.GEOCODE.NO_DATA_FOUND'
,p_message_language=>'sl'
,p_message_text=>unistr('Nobenega naslova ni bilo mogo\010De najti.')
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142458083020752391)
,p_name=>'APEX.ITEM.GEOCODE.REQUIRED'
,p_message_language=>'sl'
,p_message_text=>'%0 je zahtevano.'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142564235169752422)
,p_name=>'APEX.ITEM.GEOCODE.REQUIRED_MULTIPLE'
,p_message_language=>'sl'
,p_message_text=>'Zahteva se %0 ali %1.'
,p_is_js_message=>true
,p_version_scn=>2705535
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142653762394752449)
,p_name=>'APEX.ITEM.HELP_TEXT'
,p_message_language=>'sl'
,p_message_text=>unistr('Oglejte si besedilo pomo\010Di za %0.')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142459721003752391)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.CHOOSE_FILE'
,p_message_language=>'sl'
,p_message_text=>'Izberite sliko'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142459866917752391)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.CHOOSE_FILES'
,p_message_language=>'sl'
,p_message_text=>'Izberite slike'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142459684661752391)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DOWNLOAD_LINK_TEXT'
,p_message_language=>'sl'
,p_message_text=>'Prenos'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142459921199752391)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_FILE'
,p_message_language=>'sl'
,p_message_text=>'Povlecite in spustite'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142460003049752391)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_FILES'
,p_message_language=>'sl'
,p_message_text=>'Povlecite in spustite slike'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142460145014752391)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_CHOOSE_FILE'
,p_message_language=>'sl'
,p_message_text=>'Izberite sliko ali jo spustite sem.'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142460258721752391)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_CHOOSE_FILES'
,p_message_language=>'sl'
,p_message_text=>'Izberite ali spustite slike sem.'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142460307674752391)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_SELECT_FILE'
,p_message_language=>'sl'
,p_message_text=>'Izberite sliko ali jo spustite sem.'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142460465805752391)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_SELECT_FILES'
,p_message_language=>'sl'
,p_message_text=>'Izberite ali spustite slike sem.'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142545116720752417)
,p_name=>'APEX.ITEM_TYPE.CHECKBOX.CHECKED'
,p_message_language=>'sl'
,p_message_text=>'Potrjeno'
,p_is_js_message=>true
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142545202177752417)
,p_name=>'APEX.ITEM_TYPE.CHECKBOX.UNCHECKED'
,p_message_language=>'sl'
,p_message_text=>'Nepotrjeno'
,p_is_js_message=>true
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142572749792752425)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.EMPTY_READONLY_COMBOBOX'
,p_message_language=>'sl'
,p_message_text=>'Prazno kombinirano polje samo za branje'
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142570536391752424)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.EMPTY_READONLY_LISTBOX'
,p_message_language=>'sl'
,p_message_text=>'Prazno polje s seznamom samo za branje'
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142570353835752424)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.READONLY_COMBOBOX'
,p_message_language=>'sl'
,p_message_text=>'Kombinirano polje samo za branje'
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142570498196752424)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.READONLY_LISTBOX'
,p_message_language=>'sl'
,p_message_text=>'Polje s seznamom samo za branje'
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142486187455752399)
,p_name=>'APEX.ITEM_TYPE.SLIDER.VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'sl'
,p_message_text=>'#LABEL# ni v veljavnem razponu med %0 in %1.'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142486262507752399)
,p_name=>'APEX.ITEM_TYPE.SLIDER.VALUE_NOT_MULTIPLE_OF_STEP'
,p_message_language=>'sl'
,p_message_text=>unistr('#LABEL# ni ve\010Dkratnik %0.')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142573524979752425)
,p_name=>'APEX.ITEM_TYPE.SWITCH.READONLY_SWITCH'
,p_message_language=>'sl'
,p_message_text=>'Stikalo samo za branje'
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142514140170752407)
,p_name=>'APEX.ITEM_TYPE.TEXT.READONLY_WITH_LINK'
,p_message_language=>'sl'
,p_message_text=>'Urejanje samo za branje s povezavo'
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142485724499752399)
,p_name=>'APEX.ITEM_TYPE.YES_NO.INVALID_VALUE'
,p_message_language=>'sl'
,p_message_text=>'#LABEL# se mora ujemati z vrednostma %0 in %1.'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142485901481752399)
,p_name=>'APEX.ITEM_TYPE.YES_NO.NO_LABEL'
,p_message_language=>'sl'
,p_message_text=>'Ne'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142572261286752425)
,p_name=>'APEX.ITEM_TYPE.YES_NO.OFF_LABEL'
,p_message_language=>'sl'
,p_message_text=>'Izklopljeno'
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142572397744752425)
,p_name=>'APEX.ITEM_TYPE.YES_NO.ON_LABEL'
,p_message_language=>'sl'
,p_message_text=>'Vklopljeno'
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142485848418752399)
,p_name=>'APEX.ITEM_TYPE.YES_NO.YES_LABEL'
,p_message_language=>'sl'
,p_message_text=>'Da'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142493771240752401)
,p_name=>'APEX.LANGUAGE_SELECTOR'
,p_message_language=>'sl'
,p_message_text=>'Izbirnik jezikov'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142430194870752382)
,p_name=>'APEX.LIST_MANAGER.ADD_ENTRY'
,p_message_language=>'sl'
,p_message_text=>'Dodaj vnos'
,p_version_scn=>2705512
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142606908391752435)
,p_name=>'APEX.LIST_MANAGER.BUTTON_ADD'
,p_message_language=>'sl'
,p_message_text=>'Dodaj'
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142607092997752435)
,p_name=>'APEX.LIST_MANAGER.BUTTON_REMOVE'
,p_message_language=>'sl'
,p_message_text=>'Odstrani'
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142430230476752382)
,p_name=>'APEX.LIST_MANAGER.SELECTED_ENTRY'
,p_message_language=>'sl'
,p_message_text=>'Izbrani vnosi'
,p_version_scn=>2705512
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142610766416752436)
,p_name=>'APEX.LTO.ADVANCED'
,p_message_language=>'sl'
,p_message_text=>'Napredno'
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142611003658752436)
,p_name=>'APEX.LTO.CANCEL'
,p_message_language=>'sl'
,p_message_text=>unistr('Prekli\010Di')
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142610805930752436)
,p_name=>'APEX.LTO.COMMON'
,p_message_language=>'sl'
,p_message_text=>unistr('Splo\0161no')
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142611196460752437)
,p_name=>'APEX.LTO.LIVE_TEMPLATE_OPTIONS'
,p_message_language=>'sl'
,p_message_text=>unistr('Mo\017Enosti predloge v \017Eivo')
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142611703849752437)
,p_name=>'APEX.LTO.NOT_APPLICABLE'
,p_message_language=>'sl'
,p_message_text=>unistr('Mo\017Enosti predloge niso na voljo, ker ta komponenta ni upodobljena na strani.')
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142610671936752436)
,p_name=>'APEX.LTO.NO_OPTIONS_FOUND'
,p_message_language=>'sl'
,p_message_text=>unistr('Mo\017Enosti predloge ni bilo mogo\010De najti.')
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142610901557752436)
,p_name=>'APEX.LTO.SAVE'
,p_message_language=>'sl'
,p_message_text=>'Shrani'
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142464777248752393)
,p_name=>'APEX.MAPS.CLEAR_CIRCLE'
,p_message_language=>'sl'
,p_message_text=>unistr('Po\010Disti krog')
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142467192679752393)
,p_name=>'APEX.MAPS.CUSTOM_STYLES_INVALID_JSON'
,p_message_language=>'sl'
,p_message_text=>unistr('Mo\017Enost Prilagojeni slogi ni veljaven JSON.')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142465033211752393)
,p_name=>'APEX.MAPS.DISTANCE_TOOL'
,p_message_language=>'sl'
,p_message_text=>'Orodje razdalje'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142464829260752393)
,p_name=>'APEX.MAPS.DRAW_CIRCLE'
,p_message_language=>'sl'
,p_message_text=>unistr('Nari\0161i krog')
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142444672995752387)
,p_name=>'APEX.MAPS.FIND_MY_LOCATION'
,p_message_language=>'sl'
,p_message_text=>'Trenutna lokacija'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142451027814752389)
,p_name=>'APEX.MAPS.INIT_POINT_COORDINATES_INVALID'
,p_message_language=>'sl'
,p_message_text=>unistr('Koordinate za\010Detnega polo\017Eaja so neveljavne.')
,p_version_scn=>2705517
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142440085475752385)
,p_name=>'APEX.MAPS.INIT_POINT_GEOMETRY_REQUIRED'
,p_message_language=>'sl'
,p_message_text=>unistr('Za\010Detni polo\017Eaj mora biti to\010Dkovna geometrija.')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142448622589752388)
,p_name=>'APEX.MAPS.KM'
,p_message_language=>'sl'
,p_message_text=>'km'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142443883118752387)
,p_name=>'APEX.MAPS.LAYER'
,p_message_language=>'sl'
,p_message_text=>'Plast'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142614291928752437)
,p_name=>'APEX.MAPS.LAYER_NAME'
,p_message_language=>'sl'
,p_message_text=>'Nivo: %0'
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142463052460752392)
,p_name=>'APEX.MAPS.MAP'
,p_message_language=>'sl'
,p_message_text=>'Zemljevid'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142432738978752383)
,p_name=>'APEX.MAPS.MAP_MESSAGES'
,p_message_language=>'sl'
,p_message_text=>unistr('Sporo\010Dila')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142448841257752388)
,p_name=>'APEX.MAPS.MILES'
,p_message_language=>'sl'
,p_message_text=>'milje'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142613296520752437)
,p_name=>'APEX.MAPS.MORE_DATA_FOUND'
,p_message_language=>'sl'
,p_message_text=>unistr('Podatki vsebujejo ve\010D kot %0 vrstic, kar presega maksimalno dovoljeno \0161tevilo.')
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142443118584752386)
,p_name=>'APEX.MAPS.ORACLE_MAP_COPYRIGHT'
,p_message_language=>'sl'
,p_message_text=>'&copy; 2022 Oracle Corporation &nbsp;&nbsp; <a rel="noopener noreferrer" target="_blank" href="https://elocation.oracle.com/elocation/legal.html">Pogoji</a> &nbsp;&nbsp; Podatki zemljevida &copy; 2021 HERE'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142439755079752385)
,p_name=>'APEX.MAPS.ORACLE_SDO_GEOMETRY_NOT_AVAILABLE'
,p_message_language=>'sl'
,p_message_text=>unistr('Podatkovni tip SDO_GEOMETRY ni razpolo\017Eljiv v tej bazi podatkov.')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142443231788752386)
,p_name=>'APEX.MAPS.OSM_MAP_COPYRIGHT'
,p_message_language=>'sl'
,p_message_text=>'<a rel="noopener noreferrer" target="_blank" href="http://openmaptiles.org"> &copy; OpenMapTiles </a> &nbsp; <a rel="noopener noreferrer" target="_blank" href="https://www.openstreetmap.org/copyright"> &copy; Sodelavci pri OpenStreetMap </a>'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142467811780752394)
,p_name=>'APEX.MAPS.OSM_VECTOR_MAP_COPYRIGHT'
,p_message_language=>'sl'
,p_message_text=>'<a rel="noopener noreferrer" target="blank" href="https://www.maptiler.com/copyright"> &copy; MapTiler</a> &nbsp; <a rel="noopener noreferrer" target="_blank" href="https://www.openstreetmap.org/copyright"> &copy; Sodelavci pri OpenStreetMap </a>'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142444071185752387)
,p_name=>'APEX.MAPS.POINTS'
,p_message_language=>'sl'
,p_message_text=>unistr('To\010Dke')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142614304871752437)
,p_name=>'APEX.MAPS.POINTS_COUNT'
,p_message_language=>'sl'
,p_message_text=>unistr('%0 To\010Dke')
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142464954834752393)
,p_name=>'APEX.MAPS.RECTANGLE_ZOOM'
,p_message_language=>'sl'
,p_message_text=>unistr('Pove\010Dava pravokotnika')
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142464619335752393)
,p_name=>'APEX.MAPS.REMOVE_MESSAGE'
,p_message_language=>'sl'
,p_message_text=>'Odstrani'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142444409158752387)
,p_name=>'APEX.MAPS.RESET_BEARING_TO_NORTH'
,p_message_language=>'sl'
,p_message_text=>'Ponastavitev usmerjenosti na sever'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142559228740752421)
,p_name=>'APEX.MAPS.TOGGLE_2D_MODE'
,p_message_language=>'sl'
,p_message_text=>unistr('Preklopi na 2D-na\010Din')
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142559324490752421)
,p_name=>'APEX.MAPS.TOGGLE_3D_MODE'
,p_message_language=>'sl'
,p_message_text=>unistr('Preklopi na 3D-na\010Din')
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142464586672752393)
,p_name=>'APEX.MAPS.TOGGLE_COPYRIGHT'
,p_message_language=>'sl'
,p_message_text=>'Preklop obvestila o avtorskih pravicah'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142465152421752393)
,p_name=>'APEX.MAPS.TOTAL_DISTANCE'
,p_message_language=>'sl'
,p_message_text=>'Skupna razdalja'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142444153662752387)
,p_name=>'APEX.MAPS.ZOOM_IN'
,p_message_language=>'sl'
,p_message_text=>unistr('Pove\010Dava')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142444375954752387)
,p_name=>'APEX.MAPS.ZOOM_OUT'
,p_message_language=>'sl'
,p_message_text=>unistr('Pomanj\0161ava')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142608859531752436)
,p_name=>'APEX.MARKDOWN.BOLD'
,p_message_language=>'sl'
,p_message_text=>'Krepko'
,p_is_js_message=>true
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142609710228752436)
,p_name=>'APEX.MARKDOWN.IMAGE'
,p_message_language=>'sl'
,p_message_text=>'Slika'
,p_is_js_message=>true
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142609396764752436)
,p_name=>'APEX.MARKDOWN.INLINE_CODE'
,p_message_language=>'sl'
,p_message_text=>'Koda v vrstici'
,p_is_js_message=>true
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142622011708752440)
,p_name=>'APEX.MARKDOWN.INSERT_IMAGE'
,p_message_language=>'sl'
,p_message_text=>'Vstavi sliko'
,p_is_js_message=>true
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142622117037752440)
,p_name=>'APEX.MARKDOWN.INSERT_LINK'
,p_message_language=>'sl'
,p_message_text=>'Vstavi povezavo'
,p_is_js_message=>true
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142608913700752436)
,p_name=>'APEX.MARKDOWN.ITALIC'
,p_message_language=>'sl'
,p_message_text=>unistr('Le\017Ee\010De')
,p_is_js_message=>true
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142622730421752440)
,p_name=>'APEX.MARKDOWN.LINK'
,p_message_language=>'sl'
,p_message_text=>'Povezava'
,p_is_js_message=>true
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142609697923752436)
,p_name=>'APEX.MARKDOWN.LIST'
,p_message_language=>'sl'
,p_message_text=>'Seznam'
,p_is_js_message=>true
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142609597950752436)
,p_name=>'APEX.MARKDOWN.ORDERED_LIST'
,p_message_language=>'sl'
,p_message_text=>unistr('Razvr\0161\010Den seznam')
,p_is_js_message=>true
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142609078248752436)
,p_name=>'APEX.MARKDOWN.PREVIEW'
,p_message_language=>'sl'
,p_message_text=>'Predogled'
,p_is_js_message=>true
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142609180971752436)
,p_name=>'APEX.MARKDOWN.PREVIEW_EMPTY'
,p_message_language=>'sl'
,p_message_text=>unistr('Ni ni\010Desar za predogled')
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142609296475752436)
,p_name=>'APEX.MARKDOWN.STRIKETHROUGH'
,p_message_language=>'sl'
,p_message_text=>unistr('Pre\010Drtano')
,p_is_js_message=>true
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142609426119752436)
,p_name=>'APEX.MARKDOWN.UNORDERED_LIST'
,p_message_language=>'sl'
,p_message_text=>unistr('Nerazvr\0161\010Den seznam')
,p_is_js_message=>true
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142588362558752430)
,p_name=>'APEX.MENU.CURRENT_MENU'
,p_message_language=>'sl'
,p_message_text=>'trenutno'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142644578440752447)
,p_name=>'APEX.MENU.OVERFLOW_LABEL'
,p_message_language=>'sl'
,p_message_text=>unistr('Ve\010D ...')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142588269485752430)
,p_name=>'APEX.MENU.PROCESSING'
,p_message_language=>'sl'
,p_message_text=>'Nalaganje'
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142502473514752404)
,p_name=>'APEX.MENU.SPLIT_BUTTON'
,p_message_language=>'sl'
,p_message_text=>'Razdelitev gumba'
,p_is_js_message=>true
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142502314677752404)
,p_name=>'APEX.MENU.SPLIT_MENU'
,p_message_language=>'sl'
,p_message_text=>'Razdelitev menija'
,p_is_js_message=>true
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142619362431752439)
,p_name=>'APEX.NOTIFICATION_MESSAGE_HEADING'
,p_message_language=>'sl'
,p_message_text=>unistr('Obvestilno sporo\010Dilo')
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142443422152752386)
,p_name=>'APEX.NO_DATA_FOUND_ENTITY'
,p_message_language=>'sl'
,p_message_text=>unistr('%0 ni mogo\010De najti')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142593348129752431)
,p_name=>'APEX.NUMBER_FIELD.VALUE_GREATER_MAX_VALUE'
,p_message_language=>'sl'
,p_message_text=>unistr('#LABEL# mora biti \0161tevilo, manj\0161e kot ali enako %0.')
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142593457559752431)
,p_name=>'APEX.NUMBER_FIELD.VALUE_INVALID'
,p_message_language=>'sl'
,p_message_text=>unistr('#LABEL# mora biti veljavno \0161tevilo.')
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142593544456752431)
,p_name=>'APEX.NUMBER_FIELD.VALUE_INVALID2'
,p_message_language=>'sl'
,p_message_text=>unistr('#LABEL# se ne ujema s formatom \0161tevilke %0 (Primer: %1).')
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142593210153752431)
,p_name=>'APEX.NUMBER_FIELD.VALUE_LESS_MIN_VALUE'
,p_message_language=>'sl'
,p_message_text=>unistr('#LABEL# mora biti \0161tevilo, ve\010Dje kot ali enako %0.')
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142593115222752431)
,p_name=>'APEX.NUMBER_FIELD.VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'sl'
,p_message_text=>unistr('#LABEL# mora biti \0161tevilo med %0 in %1.')
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142588455515752430)
,p_name=>'APEX.OPENS_IN_NEW_WINDOW_LOWER'
,p_message_language=>'sl'
,p_message_text=>'odpre se v novem oknu'
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142538287831752415)
,p_name=>'APEX.PAGE.DUPLICATE_SUBMIT'
,p_message_language=>'sl'
,p_message_text=>unistr('Ta stran je \017Ee bila predlo\017Eena in je ni mogo\010De ponovno predlo\017Eiti.')
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142519690224752409)
,p_name=>'APEX.PAGE.NOT_FOUND'
,p_message_language=>'sl'
,p_message_text=>'Aplikacija "%0", stran "%1" ni bila najdena.'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142555115022752420)
,p_name=>'APEX.PAGE_ITEM_IS_REQUIRED'
,p_message_language=>'sl'
,p_message_text=>'#LABEL# mora imeti neko vrednost.'
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142445872750752387)
,p_name=>'APEX.PASSWORD.HIDE_PASSWORD'
,p_message_language=>'sl'
,p_message_text=>'Skrij geslo'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142445703661752387)
,p_name=>'APEX.PASSWORD.SHOW_PASSWORD'
,p_message_language=>'sl'
,p_message_text=>unistr('Prika\017Ei geslo')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142493322456752401)
,p_name=>'APEX.POPUP.SEARCH'
,p_message_language=>'sl'
,p_message_text=>'Iskanje'
,p_is_js_message=>true
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142607310894752435)
,p_name=>'APEX.POPUP_LOV.BUTTON_CLOSE'
,p_message_language=>'sl'
,p_message_text=>'Zapri'
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142607249793752435)
,p_name=>'APEX.POPUP_LOV.BUTTON_FIND'
,p_message_language=>'sl'
,p_message_text=>unistr('Poi\0161\010Di%0')
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142607584744752435)
,p_name=>'APEX.POPUP_LOV.BUTTON_NEXT'
,p_message_language=>'sl'
,p_message_text=>'Naprej'
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142607492049752435)
,p_name=>'APEX.POPUP_LOV.BUTTON_PREV'
,p_message_language=>'sl'
,p_message_text=>'Nazaj'
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142484100068752398)
,p_name=>'APEX.POPUP_LOV.FILTER_REQ'
,p_message_language=>'sl'
,p_message_text=>'Vnesite iskani izraz, ki vsebuje vsaj toliko znakov: %0.'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142560464470752421)
,p_name=>'APEX.POPUP_LOV.ICON_TEXT'
,p_message_language=>'sl'
,p_message_text=>'Pojavni seznam vrednosti: %0'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142484250195752398)
,p_name=>'APEX.POPUP_LOV.INITIAL_FILTER_REQ'
,p_message_language=>'sl'
,p_message_text=>'Vnesite iskani izraz.'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142431281018752383)
,p_name=>'APEX.POPUP_LOV.LIST_OF_VALUES'
,p_message_language=>'sl'
,p_message_text=>'Seznam vrednosti'
,p_is_js_message=>true
,p_version_scn=>2705512
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142484054463752398)
,p_name=>'APEX.POPUP_LOV.NO_RESULTS'
,p_message_language=>'sl'
,p_message_text=>'Ni najdenih rezultatov.'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142483925562752398)
,p_name=>'APEX.POPUP_LOV.REMOVE_VALUE'
,p_message_language=>'sl'
,p_message_text=>'Odstrani %0'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142581132402752427)
,p_name=>'APEX.POPUP_LOV.SEARCH'
,p_message_language=>'sl'
,p_message_text=>'Iskani izraz'
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142607136526752435)
,p_name=>'APEX.POPUP_LOV.TITLE'
,p_message_language=>'sl'
,p_message_text=>'Iskanje'
,p_is_js_message=>true
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142433317086752383)
,p_name=>'APEX.PRINT.DOCGEN_REQUIRED'
,p_message_language=>'sl'
,p_message_text=>'Zahteva %0.'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142445681317752387)
,p_name=>'APEX.PRINT_REPORT.ERROR'
,p_message_language=>'sl'
,p_message_text=>unistr('Napaka med tiskanjem poro\010Dila.')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142456455381752390)
,p_name=>'APEX.PRINT_UTIL.UNABLE_TO_PRINT'
,p_message_language=>'sl'
,p_message_text=>unistr('Dokumenta ni mogo\010De natisniti z uporabo konfiguriranega tiskalni\0161kega stre\017Enika.')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142479190054752397)
,p_name=>'APEX.PROCESS.INVOKE_API.PARAMETER_ERROR'
,p_message_language=>'sl'
,p_message_text=>'Napaka med ocenjevanjem parametra %0 pri klicanju %1. Za podrobnosti si oglejte dnevnik napak.'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142617878886752439)
,p_name=>'APEX.PROCESSING'
,p_message_language=>'sl'
,p_message_text=>'Obdelava'
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142476948821752396)
,p_name=>'APEX.PWA.DIALOG.HIDE.INSTRUCTIONS'
,p_message_language=>'sl'
,p_message_text=>'Nazaj'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142478098350752397)
,p_name=>'APEX.PWA.DIALOG.INTRO'
,p_message_language=>'sl'
,p_message_text=>unistr('To spletno mesto ime funkcionalnost aplikacije. Za najbolj\0161o izku\0161njo jo namestite v svojo napravo.')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142479376466752397)
,p_name=>'APEX.PWA.DIALOG.SHOW.INSTRUCTIONS'
,p_message_language=>'sl'
,p_message_text=>'Naprej'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142480949697752398)
,p_name=>'APEX.PWA.DIALOG.TITLE'
,p_message_language=>'sl'
,p_message_text=>'Namesti to aplikacijo'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142465721175752393)
,p_name=>'APEX.PWA.INSTRUCTIONS'
,p_message_language=>'sl'
,p_message_text=>unistr('Ni videti, da bi va\0161a naprava ali brskalnik trenutno podpiral namestitev progresivnih spletnih aplikacij.')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142460833538752392)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP1'
,p_message_language=>'sl'
,p_message_text=>'1. Tapnite ikono <strong>Share</strong>'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142460984233752392)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP2'
,p_message_language=>'sl'
,p_message_text=>'2. Pomaknite se navzdol in tapnite <strong>Add to Home Screen</strong>'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142477331854752396)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP3'
,p_message_language=>'sl'
,p_message_text=>'3. Tapnite <strong style="color:#007AE1;">Add</strong> za potrditev'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142476434678752396)
,p_name=>'APEX.PWA.OFFLINE.BODY'
,p_message_language=>'sl'
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
unistr('    <h1>Ni mogo\010De povezati</h1>'),
unistr('    <p>Ka\017Ee, da obstaja te\017Eava z omre\017Ejem. Preverite povezavo in poskusite znova.</p>'),
'    <button type="button">Poskusi znova</button>',
'</main>',
'',
'<script>',
'    document.querySelector("button").addEventListener("click", () => {',
'        window.location.reload();',
'    });',
'</script>'))
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142476376730752396)
,p_name=>'APEX.PWA.OFFLINE.TITLE'
,p_message_language=>'sl'
,p_message_text=>unistr('Ni mogo\010De povezati')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142522960963752410)
,p_name=>'APEX.PWA.PUSH.SUBSCRIPTION_FAILED'
,p_message_language=>'sl'
,p_message_text=>unistr('Ta naprava ni uspela omogo\010Diti potisnih obvestil.')
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142528431962752412)
,p_name=>'APEX.QUICK_PICK.GROUP_LABEL'
,p_message_language=>'sl'
,p_message_text=>'Hitra izbiranja za %0'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142528335259752412)
,p_name=>'APEX.QUICK_PICK.LINK_ROLE'
,p_message_language=>'sl'
,p_message_text=>'Povezava za hitro izbiranje'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142502165492752404)
,p_name=>'APEX.RADIO.VISUALLY_HIDDEN_RADIO'
,p_message_language=>'sl'
,p_message_text=>'Vizualno skrit izbirni gumb'
,p_is_js_message=>true
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142446285852752387)
,p_name=>'APEX.RECORD_VIEW.TOOLBAR'
,p_message_language=>'sl'
,p_message_text=>'Pogled ene vrstice'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142628992802752442)
,p_name=>'APEX.REGION.CSSCALENDAR.ADD'
,p_message_language=>'sl'
,p_message_text=>'Dodaj'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142574295282752425)
,p_name=>'APEX.REGION.CSSCALENDAR.ALL_DAY'
,p_message_language=>'sl'
,p_message_text=>'Ves dan'
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142651874114752449)
,p_name=>'APEX.REGION.CSSCALENDAR.BUTTON.SENDEMAIL'
,p_message_language=>'sl'
,p_message_text=>unistr('Po\0161lji vabilo')
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142651624083752449)
,p_name=>'APEX.REGION.CSSCALENDAR.CHOOSE_ACTION'
,p_message_language=>'sl'
,p_message_text=>unistr('Mo\017Enosti')
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142576099354752426)
,p_name=>'APEX.REGION.CSSCALENDAR.DAILY_ALLDAY'
,p_message_language=>'sl'
,p_message_text=>'Dnevni pogled za ves dan '
,p_version_scn=>2705538
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142575800535752426)
,p_name=>'APEX.REGION.CSSCALENDAR.DAILY_TIME_SPECIFIC'
,p_message_language=>'sl'
,p_message_text=>unistr('Dnevni pogled za podatke s \010Dasom ')
,p_version_scn=>2705538
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142620012306752439)
,p_name=>'APEX.REGION.CSSCALENDAR.DAY'
,p_message_language=>'sl'
,p_message_text=>'Dan'
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142615029229752438)
,p_name=>'APEX.REGION.CSSCALENDAR.DESCRIPTION'
,p_message_language=>'sl'
,p_message_text=>'Opis'
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142498512791752403)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.CSV'
,p_message_language=>'sl'
,p_message_text=>'CSV'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142498349112752403)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.ICALENDAR'
,p_message_language=>'sl'
,p_message_text=>'iCal'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142498217845752403)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.PDF'
,p_message_language=>'sl'
,p_message_text=>'PDF'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142498448237752403)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.XML'
,p_message_language=>'sl'
,p_message_text=>'XML'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142497937836752403)
,p_name=>'APEX.REGION.CSSCALENDAR.ENDDATE'
,p_message_language=>'sl'
,p_message_text=>'Datum konca'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142498122658752403)
,p_name=>'APEX.REGION.CSSCALENDAR.EVENTNAME'
,p_message_language=>'sl'
,p_message_text=>'Ime dogodka'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142651741385752449)
,p_name=>'APEX.REGION.CSSCALENDAR.INVITATION'
,p_message_language=>'sl'
,p_message_text=>'Vabilo'
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142620185663752439)
,p_name=>'APEX.REGION.CSSCALENDAR.LIST'
,p_message_language=>'sl'
,p_message_text=>'Seznam'
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142619837089752439)
,p_name=>'APEX.REGION.CSSCALENDAR.MONTH'
,p_message_language=>'sl'
,p_message_text=>'Mesec'
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142622493457752440)
,p_name=>'APEX.REGION.CSSCALENDAR.NEXT'
,p_message_language=>'sl'
,p_message_text=>'Naprej'
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142636413784752444)
,p_name=>'APEX.REGION.CSSCALENDAR.NOEVENTS'
,p_message_language=>'sl'
,p_message_text=>'Ni dogodkov'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142652001970752449)
,p_name=>'APEX.REGION.CSSCALENDAR.OPTION.FORM'
,p_message_language=>'sl'
,p_message_text=>unistr('Uredite obstoje\010Di dogodek.')
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142651984926752449)
,p_name=>'APEX.REGION.CSSCALENDAR.OPTION.SEND'
,p_message_language=>'sl'
,p_message_text=>unistr('Po\0161ljite vabilo prek e-po\0161te.')
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142622549364752440)
,p_name=>'APEX.REGION.CSSCALENDAR.PREVIOUS'
,p_message_language=>'sl'
,p_message_text=>'Nazaj'
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142630202392752442)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL'
,p_message_language=>'sl'
,p_message_text=>unistr('Po\0161lji e-po\0161to')
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142630057188752442)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.BUTTON'
,p_message_language=>'sl'
,p_message_text=>unistr('Po\0161lji e-po\0161to')
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142652655055752449)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.DIALOG.REQUIRED'
,p_message_language=>'sl'
,p_message_text=>'Zahtevana so vsa polja.'
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142652505154752449)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.DIALOG.TITLE'
,p_message_language=>'sl'
,p_message_text=>unistr('Po\0161lji vabilo')
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142651542606752449)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.SUBJECT'
,p_message_language=>'sl'
,p_message_text=>'Zadeva'
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142630161014752442)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.TO'
,p_message_language=>'sl'
,p_message_text=>'Za'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142498096836752403)
,p_name=>'APEX.REGION.CSSCALENDAR.STARTDATE'
,p_message_language=>'sl'
,p_message_text=>unistr('Datum za\010Detka')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142628260830752442)
,p_name=>'APEX.REGION.CSSCALENDAR.TABLEFORM'
,p_message_language=>'sl'
,p_message_text=>'Obrazec na %0'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142575641799752426)
,p_name=>'APEX.REGION.CSSCALENDAR.TIME'
,p_message_language=>'sl'
,p_message_text=>unistr('\010Cas')
,p_version_scn=>2705538
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142622688173752440)
,p_name=>'APEX.REGION.CSSCALENDAR.TODAY'
,p_message_language=>'sl'
,p_message_text=>'Danes'
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142620681206752439)
,p_name=>'APEX.REGION.CSSCALENDAR.VIEW'
,p_message_language=>'sl'
,p_message_text=>'Pogled'
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142619986182752439)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEK'
,p_message_language=>'sl'
,p_message_text=>'Teden'
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142575954953752426)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEKLY_ALLDAY'
,p_message_language=>'sl'
,p_message_text=>'Tedenski pogled za ves dan'
,p_version_scn=>2705538
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142575728943752426)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEKLY_TIME_SPECIFIC'
,p_message_language=>'sl'
,p_message_text=>unistr('Tedenski pogled za podatke s \010Dasom')
,p_version_scn=>2705538
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142620506845752439)
,p_name=>'APEX.REGION.CSSCALENDAR.YEAR'
,p_message_language=>'sl'
,p_message_text=>'Leto'
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142620268725752439)
,p_name=>'APEX.REGION.JQM_COLUMN_TOGGLE.COLUMNS'
,p_message_language=>'sl'
,p_message_text=>'Stolpci ...'
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142620370626752439)
,p_name=>'APEX.REGION.JQM_COLUMN_TOGGLE.LOAD_MORE'
,p_message_language=>'sl'
,p_message_text=>unistr('Nalo\017Ei ve\010D ...')
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142549782898752418)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.BACK'
,p_message_language=>'sl'
,p_message_text=>'Nazaj'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142491265735752401)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.LOAD_MORE'
,p_message_language=>'sl'
,p_message_text=>unistr('Nalo\017Ei ve\010D ...')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142493546085752401)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.SEARCH'
,p_message_language=>'sl'
,p_message_text=>unistr('I\0161\010Di ...')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142620416952752439)
,p_name=>'APEX.REGION.JQM_REFLOW.LOAD_MORE'
,p_message_language=>'sl'
,p_message_text=>unistr('Nalo\017Ei ve\010D ...')
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142622396141752440)
,p_name=>'APEX.REGION.NOT_FOUND'
,p_message_language=>'sl'
,p_message_text=>unistr('ID podro\010Dja %0 ni najden.')
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142493415008752401)
,p_name=>'APEX.REGION.NO_DATA_FOUND_MESSAGE'
,p_message_language=>'sl'
,p_message_text=>'Najdeni niso bili nobeni podatki'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142520952473752409)
,p_name=>'APEX.REGION.PAGINATION.RESET_ERROR'
,p_message_language=>'sl'
,p_message_text=>unistr('Ni mogo\010De ponastaviti \0161tevil\010Denja strani podro\010Dja.')
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142484675158752399)
,p_name=>'APEX.REGION.PAGINATION.UNHANDLED_ERROR'
,p_message_language=>'sl'
,p_message_text=>unistr('Napaka pri nastavljanju \0161tevil\010Denja strani podro\010Dja.')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142614422996752437)
,p_name=>'APEX.REGION.RESPONSIVE_TABLE.COLUMNS'
,p_message_language=>'sl'
,p_message_text=>'Stolpci ...'
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142468940919752394)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.LAZY_LOADING_INCOMPATIBLE'
,p_message_language=>'sl'
,p_message_text=>unistr('Leno nalaganje ni zdru\017Eljivo z re\017Eami na podro\010Dju %0, ki je enojno (delno) podro\010Dje. Onemogo\010Dite leno nalaganje za to podro\010Dje ali premaknite komponente re\017E na drugo podro\010Dje.')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142464205212752393)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.NO_GROUP_TEMPLATE'
,p_message_language=>'sl'
,p_message_text=>'V komponenti predloge za %0 manjka predloga skupine.'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142459290490752391)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.TOO_MANY_ROWS'
,p_message_language=>'sl'
,p_message_text=>unistr('%0 je enojno (delno) podro\010Dje in je vrnilo ve\010D vrstic.')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142622291098752440)
,p_name=>'APEX.REGION.TYPE_NOT_SUPPORTED'
,p_message_language=>'sl'
,p_message_text=>unistr('Tip podro\010Dja %0 ni podprt.')
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142484572653752399)
,p_name=>'APEX.REGION.UNHANDLED_ERROR'
,p_message_language=>'sl'
,p_message_text=>unistr('Napaka med upodabljanjem podro\010Dja "#COMPONENT_NAME#".')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142555204141752420)
,p_name=>'APEX.REGION_COLUMN_IS_REQUIRED'
,p_message_language=>'sl'
,p_message_text=>'#COLUMN_HEADER# mora imeti neko vrednost.'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142436833166752384)
,p_name=>'APEX.REPORT_QUERY.LAYOUT_REQUIRED'
,p_message_language=>'sl'
,p_message_text=>unistr('Navesti morate postavitev poro\010Dila.')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142651187066752449)
,p_name=>'APEX.RICH_TEXT_EDITOR.ACCESSIBLE_LABEL'
,p_message_language=>'sl'
,p_message_text=>'%0, urejevalnik obogatenega besedila'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142557350239752420)
,p_name=>'APEX.RICH_TEXT_EDITOR.MAXIMUM_LENGTH_EXCEEDED'
,p_message_language=>'sl'
,p_message_text=>unistr('Ozna\010Devanje HTML obogatenega besedila presega maksimalno dol\017Eino elementa (dejansko \0161tevilo znakov je %0, dovoljenih je toliko znakov: %1)')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142466734459752393)
,p_name=>'APEX.RTE.READ_ONLY_RICH_TEXT_EDITOR'
,p_message_language=>'sl'
,p_message_text=>'Urejevalnik obogatenega besedila samo za branje'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142466632427752393)
,p_name=>'APEX.RTE.RICH_TEXT_EDITOR'
,p_message_language=>'sl'
,p_message_text=>'Urejevalnik obogatenega besedila'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142466420667752393)
,p_name=>'APEX.RTE.TOOLBAR_ALIGNMENT'
,p_message_language=>'sl'
,p_message_text=>'Poravnava'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142466509279752393)
,p_name=>'APEX.RTE.TOOLBAR_EXTRAS'
,p_message_language=>'sl'
,p_message_text=>'Dodatki'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142466257926752393)
,p_name=>'APEX.RTE.TOOLBAR_FONT'
,p_message_language=>'sl'
,p_message_text=>'Pisava'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142466163948752393)
,p_name=>'APEX.RTE.TOOLBAR_FORMATTING'
,p_message_language=>'sl'
,p_message_text=>'Formatiranje'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142466391500752393)
,p_name=>'APEX.RTE.TOOLBAR_LISTS'
,p_message_language=>'sl'
,p_message_text=>'Seznami'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142619494500752439)
,p_name=>'APEX.RV.DELETE'
,p_message_language=>'sl'
,p_message_text=>unistr('Izbri\0161i')
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142611934113752437)
,p_name=>'APEX.RV.DUPLICATE'
,p_message_language=>'sl'
,p_message_text=>'Podvoji'
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142610221788752436)
,p_name=>'APEX.RV.EXCLUDE_HIDDEN'
,p_message_language=>'sl'
,p_message_text=>'Prikazani stolpci'
,p_is_js_message=>true
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142610112264752436)
,p_name=>'APEX.RV.EXCLUDE_NULL'
,p_message_language=>'sl'
,p_message_text=>unistr('Izklju\010Di vrednosti NULL')
,p_is_js_message=>true
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142619597200752439)
,p_name=>'APEX.RV.INSERT'
,p_message_language=>'sl'
,p_message_text=>'Dodaj'
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142573886431752425)
,p_name=>'APEX.RV.MOVE_DOWN'
,p_message_language=>'sl'
,p_message_text=>'Premik navzdol'
,p_is_js_message=>true
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142573901200752425)
,p_name=>'APEX.RV.MOVE_UP'
,p_message_language=>'sl'
,p_message_text=>'Premik navzgor'
,p_is_js_message=>true
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142609960991752436)
,p_name=>'APEX.RV.NEXT_RECORD'
,p_message_language=>'sl'
,p_message_text=>'Naprej'
,p_is_js_message=>true
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142610521927752436)
,p_name=>'APEX.RV.NOT_GROUPED_LABEL'
,p_message_language=>'sl'
,p_message_text=>'Drugi stolpci'
,p_is_js_message=>true
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142610096953752436)
,p_name=>'APEX.RV.PREV_RECORD'
,p_message_language=>'sl'
,p_message_text=>'Nazaj'
,p_is_js_message=>true
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142610327294752436)
,p_name=>'APEX.RV.REC_X'
,p_message_language=>'sl'
,p_message_text=>'Vrstica %0'
,p_is_js_message=>true
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142610435552752436)
,p_name=>'APEX.RV.REC_XY'
,p_message_language=>'sl'
,p_message_text=>'Vrstica %0 od %1'
,p_is_js_message=>true
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142612036616752437)
,p_name=>'APEX.RV.REFRESH'
,p_message_language=>'sl'
,p_message_text=>unistr('Osve\017Ei')
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142612127588752437)
,p_name=>'APEX.RV.REVERT'
,p_message_language=>'sl'
,p_message_text=>'Povrni spremembe'
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142609880522752436)
,p_name=>'APEX.RV.SETTINGS_MENU'
,p_message_language=>'sl'
,p_message_text=>'Nastavitve'
,p_is_js_message=>true
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142569010914752424)
,p_name=>'APEX.SAMPLE_FORMAT'
,p_message_language=>'sl'
,p_message_text=>'Na primer %0'
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142573346669752425)
,p_name=>'APEX.SAMPLE_FORMAT_SHORT'
,p_message_language=>'sl'
,p_message_text=>'Primer: %0'
,p_is_js_message=>true
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142486046054752399)
,p_name=>'APEX.SEARCH.1_RESULT_FOUND'
,p_message_language=>'sl'
,p_message_text=>'1 rezultat'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142483134020752398)
,p_name=>'APEX.SEARCH.N_RESULTS_FOUND'
,p_message_language=>'sl'
,p_message_text=>unistr('\0160t. rezultatov: %0')
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142534996673752414)
,p_name=>'APEX.SEARCH.PAGINATION'
,p_message_language=>'sl'
,p_message_text=>unistr('\0160tevil\010Denje strani')
,p_is_js_message=>true
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142535016735752414)
,p_name=>'APEX.SEARCH.RESULTS_X_TO_Y'
,p_message_language=>'sl'
,p_message_text=>'Rezultati, %0 do %1'
,p_is_js_message=>true
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142430752108752383)
,p_name=>'APEX.SESSION.ALERT.CREATE_NEW'
,p_message_language=>'sl'
,p_message_text=>'Ponovni vpis'
,p_is_js_message=>true
,p_version_scn=>2705512
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142430649178752383)
,p_name=>'APEX.SESSION.ALERT.EXPIRED'
,p_message_language=>'sl'
,p_message_text=>unistr('Va\0161a seja se je kon\010Dala')
,p_is_js_message=>true
,p_version_scn=>2705512
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142430850489752383)
,p_name=>'APEX.SESSION.ALERT.EXTEND'
,p_message_language=>'sl'
,p_message_text=>unistr('Raz\0161iritev')
,p_is_js_message=>true
,p_version_scn=>2705512
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142430494771752383)
,p_name=>'APEX.SESSION.ALERT.IDLE_WARN'
,p_message_language=>'sl'
,p_message_text=>unistr('Va\0161a seja bo kon\010Dana ob %0. Ali jo \017Eelite podalj\0161ati?')
,p_is_js_message=>true
,p_version_scn=>2705512
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142430590754752383)
,p_name=>'APEX.SESSION.ALERT.MAX_WARN'
,p_message_language=>'sl'
,p_message_text=>unistr('Va\0161a seja se bo kon\010Dala ob %0 in je ni mogo\010De podalj\0161ati. Shranite vse delo zdaj, da ne izgubite podatkov')
,p_is_js_message=>true
,p_version_scn=>2705512
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142629846974752442)
,p_name=>'APEX.SESSION.DB_SESSION_CLEANUP.UNHANDLED_ERROR'
,p_message_language=>'sl'
,p_message_text=>unistr('Napaka pri obdelavi kode za \010Di\0161\010Denje seje baze podatkov.')
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142519589935752409)
,p_name=>'APEX.SESSION.DB_SESSION_INIT.UNHANDLED_ERROR'
,p_message_language=>'sl'
,p_message_text=>'Napaka pri obdelavi kode za nastavitev seje baze podatkov.'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142489936094752400)
,p_name=>'APEX.SESSION.EXPIRED'
,p_message_language=>'sl'
,p_message_text=>unistr('Va\0161a seja se je kon\010Dala.')
,p_version_scn=>2705521
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142629056854752442)
,p_name=>'APEX.SESSION.EXPIRED.CLOSE_DIALOG'
,p_message_language=>'sl'
,p_message_text=>'Zaprite to pogovorno okno in pritisnite gumb za ponovno nalaganje v brskalniku, da pridobite novo sejo.'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142647916802752448)
,p_name=>'APEX.SESSION.EXPIRED.NEW_SESSION'
,p_message_language=>'sl'
,p_message_text=>unistr('Za ustvarjanje nove seje se znova <a href="%0">vpi\0161ite</a>.')
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142532234371752413)
,p_name=>'APEX.SESSION.NOT_VALID'
,p_message_language=>'sl'
,p_message_text=>'Seja ni veljavna'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142575396845752426)
,p_name=>'APEX.SESSION.RAS.NO_DYNAMIC_ROLES'
,p_message_language=>'sl'
,p_message_text=>unistr('V seji Real Application Security ni bilo mogo\010De omogo\010Diti nobene dinami\010Dne vloge za uporabnika "%0".')
,p_version_scn=>2705538
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142517441942752408)
,p_name=>'APEX.SESSION.UNHANDLED_ERROR'
,p_message_language=>'sl'
,p_message_text=>unistr('ERR-99900 Ni bilo mogo\010De ustvariti enoli\010Dnega ID-ja seje: %0')
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142446511172752387)
,p_name=>'APEX.SESSION_STATE.CLOB_NOT_ALLOWED'
,p_message_language=>'sl'
,p_message_text=>'CLOB podatkovnega tipa stanja seje ni dovoljen za element %0.'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142465944755752393)
,p_name=>'APEX.SESSION_STATE.CLOB_SUBSTITUTION_NOT_ALLOWED'
,p_message_language=>'sl'
,p_message_text=>'Zamenjava elementov za CLOB podatkovnega tipa stanja seje ni podprta.'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142534798029752414)
,p_name=>'APEX.SESSION_STATE.ITEM_VALUE_PROTECTION'
,p_message_language=>'sl'
,p_message_text=>unistr('Kr\0161itev za\0161\010Dite stanja seje: Vzrok za to je lahko ro\010Dno spreminjanje za\0161\010Ditenega elementa strani %0. \010Ce niste prepri\010Dani, kaj je povzro\010Dilo to napako, se za pomo\010D obrnite na skrbnika aplikacije.')
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142655953866752450)
,p_name=>'APEX.SESSION_STATE.PAGE_PROTECTION'
,p_message_language=>'sl'
,p_message_text=>unistr('Kr\0161itev za\0161\010Dite strani: Vzrok za to je lahko po\0161iljanje strani, ki se \0161e ni nalo\017Eila do konca, ali ro\010Dno spreminjanje za\0161\010Ditenih elementov strani. Za nadaljnjo pomo\010D se obrnite na skrbnika aplikacije.')
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142655034167752450)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.NO_SPECIAL_CHAR'
,p_message_language=>'sl'
,p_message_text=>'%0 vsebuje enega izmed naslednjih neveljavnih znakov &<>"/;,*|=% ali --'
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142655157334752450)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.NO_SPECIAL_CHAR_NL'
,p_message_language=>'sl'
,p_message_text=>'%0 vsebuje enega izmed naslednjih neveljavnih znakov &<>"/;,*|=% ali -- ali novo vrstico.'
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142654871661752450)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.US_ONLY'
,p_message_language=>'sl'
,p_message_text=>'%0 vsebuje posebne znake. Dovoljeni so le znaki a-Z, 0-9 in presledki.'
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142654920577752450)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE'
,p_message_language=>'sl'
,p_message_text=>'%0 vsebuje <, > ali ", kar so neveljavni znaki.'
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142492365459752401)
,p_name=>'APEX.SESSION_STATE.SSP_CHECKSUM_MISSING'
,p_message_language=>'sl'
,p_message_text=>unistr('Nobena kontrolna vsota ni bila navedena za prikaz obdelave za stran, ki zahteva kontrolno vsoto, kadar so kot parametri podani ena ali ve\010D zahtev, \010Di\0161\010Denje predpomnilnika ali vrednosti argumentov.')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142529646752752412)
,p_name=>'APEX.SESSION_STATE.SSP_VIOLATION'
,p_message_language=>'sl'
,p_message_text=>unistr('Kr\0161itev za\0161\010Dite stanja seje: Vzrok za to je lahko ro\010Dno spreminjanje URL-ja, ki vsebuje kontrolno vsoto, ali uporaba povezave z nepravilno ali manjkajo\010Do kontrolno vsoto. \010Ce niste prepri\010Dani, kaj je povzro\010Dilo to napako, se za pomo\010D obrnite na skrbni')
||'ka aplikacije.'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142611216024752437)
,p_name=>'APEX.SET_HIGH_CONTRAST_MODE_OFF'
,p_message_language=>'sl'
,p_message_text=>unistr('Izklop na\010Dina visokega kontrasta')
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142611326641752437)
,p_name=>'APEX.SET_HIGH_CONTRAST_MODE_ON'
,p_message_language=>'sl'
,p_message_text=>unistr('Vklop na\010Dina visokega kontrasta')
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142475731065752396)
,p_name=>'APEX.SET_VALUE_ERROR'
,p_message_language=>'sl'
,p_message_text=>unistr('Nastavitve aplikacije %0 ni mogo\010De posodobiti, ker je naro\010Dena iz druge aplikacije.')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142526033332752411)
,p_name=>'APEX.SHUTTLE.CONTROL_BOTTOM'
,p_message_language=>'sl'
,p_message_text=>'Spodaj'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142526240040752411)
,p_name=>'APEX.SHUTTLE.CONTROL_DOWN'
,p_message_language=>'sl'
,p_message_text=>'Dol'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142526305481752411)
,p_name=>'APEX.SHUTTLE.CONTROL_MOVE'
,p_message_language=>'sl'
,p_message_text=>'Premik'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142526441639752411)
,p_name=>'APEX.SHUTTLE.CONTROL_MOVE_ALL'
,p_message_language=>'sl'
,p_message_text=>'Premakni vse'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142526530942752411)
,p_name=>'APEX.SHUTTLE.CONTROL_REMOVE'
,p_message_language=>'sl'
,p_message_text=>'Odstrani'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142526696923752411)
,p_name=>'APEX.SHUTTLE.CONTROL_REMOVE_ALL'
,p_message_language=>'sl'
,p_message_text=>'Odstrani vse'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142526709612752411)
,p_name=>'APEX.SHUTTLE.CONTROL_RESET'
,p_message_language=>'sl'
,p_message_text=>'Ponastavi'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142525967887752411)
,p_name=>'APEX.SHUTTLE.CONTROL_TOP'
,p_message_language=>'sl'
,p_message_text=>'Zgoraj'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142526140154752411)
,p_name=>'APEX.SHUTTLE.CONTROL_UP'
,p_message_language=>'sl'
,p_message_text=>'Gor'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142637768831752444)
,p_name=>'APEX.SINCE.SHORT.DAYS_AGO'
,p_message_language=>'sl'
,p_message_text=>'%0d'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142638416642752445)
,p_name=>'APEX.SINCE.SHORT.DAYS_FROM_NOW'
,p_message_language=>'sl'
,p_message_text=>'v toliko dneh: %0'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142637625541752444)
,p_name=>'APEX.SINCE.SHORT.HOURS_AGO'
,p_message_language=>'sl'
,p_message_text=>'%0h'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142638588527752445)
,p_name=>'APEX.SINCE.SHORT.HOURS_FROM_NOW'
,p_message_language=>'sl'
,p_message_text=>'v toliko urah: %0'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142637480682752444)
,p_name=>'APEX.SINCE.SHORT.MINUTES_AGO'
,p_message_language=>'sl'
,p_message_text=>'%0m'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142638653751752445)
,p_name=>'APEX.SINCE.SHORT.MINUTES_FROM_NOW'
,p_message_language=>'sl'
,p_message_text=>'v toliko minutah: %0'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142638058496752445)
,p_name=>'APEX.SINCE.SHORT.MONTHS_AGO'
,p_message_language=>'sl'
,p_message_text=>'%0mo'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142638256340752445)
,p_name=>'APEX.SINCE.SHORT.MONTHS_FROM_NOW'
,p_message_language=>'sl'
,p_message_text=>'v toliko mesecih: %0'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142637500589752444)
,p_name=>'APEX.SINCE.SHORT.SECONDS_AGO'
,p_message_language=>'sl'
,p_message_text=>'%0s'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142638312288752445)
,p_name=>'APEX.SINCE.SHORT.SECONDS_FROM_NOW'
,p_message_language=>'sl'
,p_message_text=>'v toliko sekundah: %0'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142637877199752444)
,p_name=>'APEX.SINCE.SHORT.WEEKS_AGO'
,p_message_language=>'sl'
,p_message_text=>'%0w'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142638748161752445)
,p_name=>'APEX.SINCE.SHORT.WEEKS_FROM_NOW'
,p_message_language=>'sl'
,p_message_text=>'v toliko tednih: %0'
,p_is_js_message=>true
,p_version_scn=>2705551
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142637976192752445)
,p_name=>'APEX.SINCE.SHORT.YEARS_AGO'
,p_message_language=>'sl'
,p_message_text=>'%0y'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142638171432752445)
,p_name=>'APEX.SINCE.SHORT.YEARS_FROM_NOW'
,p_message_language=>'sl'
,p_message_text=>'v toliko letih: %0'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142439003024752385)
,p_name=>'APEX.SPATIAL.GEOMETRY.LINE'
,p_message_language=>'sl'
,p_message_text=>unistr('[\010Crta]')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142439601508752385)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTILINE'
,p_message_language=>'sl'
,p_message_text=>unistr('[Ve\010D \010Drt]')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142439322504752385)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTIPOINT'
,p_message_language=>'sl'
,p_message_text=>unistr('[Ve\010D to\010Dk]')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142439821585752385)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTIPOLYGON'
,p_message_language=>'sl'
,p_message_text=>unistr('[Ve\010D poligonov]')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142439967960752385)
,p_name=>'APEX.SPATIAL.GEOMETRY.OTHER'
,p_message_language=>'sl'
,p_message_text=>'[Geometrijski objekt]'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142438959988752385)
,p_name=>'APEX.SPATIAL.GEOMETRY.POINT'
,p_message_language=>'sl'
,p_message_text=>unistr('[To\010Dka (%0,%1)]')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142439246471752385)
,p_name=>'APEX.SPATIAL.GEOMETRY.POLYGON'
,p_message_language=>'sl'
,p_message_text=>'[Poligon]'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142438425811752385)
,p_name=>'APEX.SPLITTER.COLLAPSED_REGION'
,p_message_language=>'sl'
,p_message_text=>unistr('Strnjeno podro\010Dje: %0')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142553554071752419)
,p_name=>'APEX.SPLITTER.COLLAPSE_TEXT'
,p_message_language=>'sl'
,p_message_text=>'Strni'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142437462009752385)
,p_name=>'APEX.SPLITTER.HORIZ_CANNOT_LEFT_RIGHT'
,p_message_language=>'sl'
,p_message_text=>unistr('Vodoravno usmerjenega razdelilnika ni mogo\010De premakniti levo ali desno')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142437610607752385)
,p_name=>'APEX.SPLITTER.MAX_SIZE_REACHED'
,p_message_language=>'sl'
,p_message_text=>unistr('Dose\017Eena je maksimalna velikost toliko pikslov: %0')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142438613784752385)
,p_name=>'APEX.SPLITTER.MIN_SIZE_REACHED'
,p_message_language=>'sl'
,p_message_text=>unistr('Dose\017Eena je minimalna velikost toliko pikslov: %0')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142438585258752385)
,p_name=>'APEX.SPLITTER.REGION_IS_COLLAPSED'
,p_message_language=>'sl'
,p_message_text=>unistr('Podro\010Dje je strnjeno')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142438376272752385)
,p_name=>'APEX.SPLITTER.REGION_IS_RESTORED'
,p_message_language=>'sl'
,p_message_text=>unistr('Podro\010Dje je obnovljeno')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142438031446752385)
,p_name=>'APEX.SPLITTER.RESIZED_TO'
,p_message_language=>'sl'
,p_message_text=>'Velikost spremenjena na toliko pikslov: %0'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142438280295752385)
,p_name=>'APEX.SPLITTER.RESTORED_REGION'
,p_message_language=>'sl'
,p_message_text=>unistr('Obnovljeno podro\010Dje: %0')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142553448276752419)
,p_name=>'APEX.SPLITTER.RESTORE_TEXT'
,p_message_language=>'sl'
,p_message_text=>'Obnovi'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142437517609752385)
,p_name=>'APEX.SPLITTER.VERTICAL_CANNOT_UP_DOWN'
,p_message_language=>'sl'
,p_message_text=>unistr('Navpi\010Dno usmerjenega razdelilnika ni mogo\010De premakniti navzgor ali navzdol')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142602904159752434)
,p_name=>'APEX.STAR_RATING.CLEAR_RATING'
,p_message_language=>'sl'
,p_message_text=>unistr('Po\010Disti oceno')
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142592824044752431)
,p_name=>'APEX.STAR_RATING.INVALID_RATING_RANGE'
,p_message_language=>'sl'
,p_message_text=>'%0 ni v veljavnem razponu ocenjevanja 1 - %1'
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142592992909752431)
,p_name=>'APEX.STAR_RATING.IS_NOT_NUMERIC'
,p_message_language=>'sl'
,p_message_text=>unistr('%0 ni \0161tevilska vrednost')
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142589049140752430)
,p_name=>'APEX.SUCCESS_MESSAGE_HEADING'
,p_message_language=>'sl'
,p_message_text=>unistr('Sporo\010Dilo o uspehu')
,p_is_js_message=>true
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142650820219752448)
,p_name=>'APEX.TABS.NEXT'
,p_message_language=>'sl'
,p_message_text=>'Naprej'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142650778617752448)
,p_name=>'APEX.TABS.PREVIOUS'
,p_message_language=>'sl'
,p_message_text=>'Nazaj'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142560927917752421)
,p_name=>'APEX.TASK.ACTION.DATA_NOT_FOUND'
,p_message_language=>'sl'
,p_message_text=>unistr('Sistema zapisov, povezanega s to instanco naloge, ni mogo\010De najti')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142569255210752424)
,p_name=>'APEX.TASK.ACTION.ERROR'
,p_message_language=>'sl'
,p_message_text=>'Izvedba dejanja naloge %0 ni uspela - naloga ima nastavljeno stanje z napako, preverite kodo dejanja naloge'
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142449465757752388)
,p_name=>'APEX.TASK.ADD_COMMENT_NOT_AUTHORIZED'
,p_message_language=>'sl'
,p_message_text=>'Dodajanje komentarja: Ni pooblastila'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142448743334752388)
,p_name=>'APEX.TASK.ALREADY_ASSIGNED'
,p_message_language=>'sl'
,p_message_text=>unistr('Naloga je \017Ee dodeljena')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142442181470752386)
,p_name=>'APEX.TASK.ASSIGNED_TO_USER'
,p_message_language=>'sl'
,p_message_text=>'Dodeljeno %0'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142448402722752388)
,p_name=>'APEX.TASK.CANCEL_TASK_NOT_AUTHORIZED'
,p_message_language=>'sl'
,p_message_text=>'Preklic naloge: Ni pooblastila'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142464055931752392)
,p_name=>'APEX.TASK.CANNOT_REMOVE_OWNER'
,p_message_language=>'sl'
,p_message_text=>unistr('Dejanskega lastnika te naloge ni mogo\010De odstraniti. Pred ponovnim poskusom te operacije dodelite nalogo drugemu udele\017Eencu.')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142448079469752388)
,p_name=>'APEX.TASK.CLAIM_TASK_NOT_AUTHORIZED'
,p_message_language=>'sl'
,p_message_text=>'Zahtevanje naloge: Ni pooblastila'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142448156166752388)
,p_name=>'APEX.TASK.COMPLETE_TASK_NOT_AUTHORIZED'
,p_message_language=>'sl'
,p_message_text=>unistr('Dokon\010Danje naloge: Ni pooblastila')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142448269305752388)
,p_name=>'APEX.TASK.DELEGATE_TASK_NOT_AUTHORIZED'
,p_message_language=>'sl'
,p_message_text=>'Dodelitev naloge: Ni pooblastila'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142446627414752387)
,p_name=>'APEX.TASK.DUE_DATE_IN_PAST'
,p_message_language=>'sl'
,p_message_text=>'Datum zapadlosti naloge ne more biti v preteklosti.'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142441990642752386)
,p_name=>'APEX.TASK.DUE_SINCE'
,p_message_language=>'sl'
,p_message_text=>'Zapade %0'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142442332857752386)
,p_name=>'APEX.TASK.EVENT.ACTION.ERROR_MESSAGE'
,p_message_language=>'sl'
,p_message_text=>unistr('Dejanje naloge %1 ni uspelo. Sporo\010Dilo o napaki - %0')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142442078269752386)
,p_name=>'APEX.TASK.EVENT.ACTION.FAILURE'
,p_message_language=>'sl'
,p_message_text=>'Ni uspelo'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142441617018752386)
,p_name=>'APEX.TASK.EVENT.ACTION.SUCCESS'
,p_message_language=>'sl'
,p_message_text=>'Uspeh'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142441831116752386)
,p_name=>'APEX.TASK.EVENT.ACTION.SUCCESS_MESSAGE'
,p_message_language=>'sl'
,p_message_text=>unistr('Dejanje %1 je uspelo s sporo\010Dilom %0')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142445101128752387)
,p_name=>'APEX.TASK.EVENT.BEFORE_EXPIRE'
,p_message_language=>'sl'
,p_message_text=>'Pred potekom'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142470783848752394)
,p_name=>'APEX.TASK.EVENT.CANCEL'
,p_message_language=>'sl'
,p_message_text=>unistr('Prekli\010Di')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142470232412752394)
,p_name=>'APEX.TASK.EVENT.CANCEL_MESSAGE'
,p_message_language=>'sl'
,p_message_text=>'Naloga je preklicana'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142470865822752395)
,p_name=>'APEX.TASK.EVENT.CANCEL_NOT_ALLOWED'
,p_message_language=>'sl'
,p_message_text=>unistr('Udele\017Eencu ni dovoljeno preklicati naloge')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142470179417752394)
,p_name=>'APEX.TASK.EVENT.CLAIM'
,p_message_language=>'sl'
,p_message_text=>'Zahtevek'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142470527154752394)
,p_name=>'APEX.TASK.EVENT.CLAIM_ALREADY_CLAIMED'
,p_message_language=>'sl'
,p_message_text=>unistr('Nalogo je \017Ee zahteval drug uporabnik ali pa udele\017Eenec ni upravi\010Den do zahtevanja te naloge')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142470337471752394)
,p_name=>'APEX.TASK.EVENT.CLAIM_MESSAGE'
,p_message_language=>'sl'
,p_message_text=>'Nalogo zahteval %0'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142571427464752425)
,p_name=>'APEX.TASK.EVENT.COMPLETE'
,p_message_language=>'sl'
,p_message_text=>unistr('Dokon\010Danje')
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142469901808752394)
,p_name=>'APEX.TASK.EVENT.COMPLETE_MESSAGE'
,p_message_language=>'sl'
,p_message_text=>unistr('Naloga je dokon\010Dana z rezultatom %0')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142471208373752395)
,p_name=>'APEX.TASK.EVENT.COMPLETE_NOT_ALLOWED'
,p_message_language=>'sl'
,p_message_text=>unistr('Naloga bodisi ni dodeljena bodisi udele\017Eencu ni dovoljeno dokon\010Danje naloge')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142431601651752383)
,p_name=>'APEX.TASK.EVENT.COMPLETE_NO_OUTCOME'
,p_message_language=>'sl'
,p_message_text=>unistr('Naloga je dokon\010Dana brez rezultata')
,p_version_scn=>2705513
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142571548814752425)
,p_name=>'APEX.TASK.EVENT.CREATE'
,p_message_language=>'sl'
,p_message_text=>'Ustvarjanje'
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142464403818752393)
,p_name=>'APEX.TASK.EVENT.CREATE_MESSAGE'
,p_message_language=>'sl'
,p_message_text=>'Naloga je ustvarjena z ID-jem %0'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142571628485752425)
,p_name=>'APEX.TASK.EVENT.DELEGATE'
,p_message_language=>'sl'
,p_message_text=>'Dodelitev'
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142470051233752394)
,p_name=>'APEX.TASK.EVENT.DELEGATE_MESSAGE'
,p_message_language=>'sl'
,p_message_text=>'Naloga je dodeljena potencialnemu lastniku %0'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142470616879752394)
,p_name=>'APEX.TASK.EVENT.DELEGATE_NOT_ALLOWED'
,p_message_language=>'sl'
,p_message_text=>unistr('Udele\017Eenec ni upravi\010Den ali pa novi udele\017Eenec ni potencialni lastnik te naloge')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142443799268752386)
,p_name=>'APEX.TASK.EVENT.EXPIRE'
,p_message_language=>'sl'
,p_message_text=>'Potek'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142444879631752387)
,p_name=>'APEX.TASK.EVENT.EXPIRED_MESSAGE'
,p_message_language=>'sl'
,p_message_text=>'Naloga je potekla.'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142571708456752425)
,p_name=>'APEX.TASK.EVENT.FAIL'
,p_message_language=>'sl'
,p_message_text=>'Ni uspelo'
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142440484189752386)
,p_name=>'APEX.TASK.EVENT.INFO_REQUEST.NOT_ALLOWED'
,p_message_language=>'sl'
,p_message_text=>unistr('Naloga bodisi ni dodeljena bodisi udele\017Eencu ni dovoljeno zahtevanje informacij za nalogo')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142440612627752386)
,p_name=>'APEX.TASK.EVENT.INFO_SUBMIT.NOT_ALLOWED'
,p_message_language=>'sl'
,p_message_text=>unistr('Bodisi nobene informacije za nalogo niso bile zahtevane bodisi udele\017Eencu ni dovoljeno predlo\017Eiti informacij za nalogo.')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142444206366752387)
,p_name=>'APEX.TASK.EVENT.MAXRENEW_EXPIRED_MESSAGE'
,p_message_language=>'sl'
,p_message_text=>unistr('Naloga naj pote\010De, ko je dose\017Eeno maksimalno \0161tevilo obnovitev %0.')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142471513703752395)
,p_name=>'APEX.TASK.EVENT.NOT_ALLOWED_BUSINESS_ADMIN'
,p_message_language=>'sl'
,p_message_text=>unistr('Naloga ni v pravilnem stanju ali pa udele\017Eenec ni poslovni skrbnik za to nalogo')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142471658434752395)
,p_name=>'APEX.TASK.EVENT.NOT_APPLICABLE'
,p_message_language=>'sl'
,p_message_text=>'Operacija %0 je neznana ali ni uporabna za to nalogo'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142571801738752425)
,p_name=>'APEX.TASK.EVENT.RELEASE'
,p_message_language=>'sl'
,p_message_text=>'Sprostitev'
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142557566142752420)
,p_name=>'APEX.TASK.EVENT.RELEASE_MESSAGE'
,p_message_language=>'sl'
,p_message_text=>unistr('Naloga je spro\0161\010Dena, zdaj jo lahko zahtevajo drugi')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142450423801752388)
,p_name=>'APEX.TASK.EVENT.RELEASE_NOT_ALLOWED'
,p_message_language=>'sl'
,p_message_text=>'Sprostitev naloge ni dovoljena - uporabnik ni lastnik naloge'
,p_version_scn=>2705517
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142467441579752393)
,p_name=>'APEX.TASK.EVENT.REMOVE_OWNER'
,p_message_language=>'sl'
,p_message_text=>'Odstrani lastnika'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142467639807752394)
,p_name=>'APEX.TASK.EVENT.REMOVE_OWNER_MESSAGE'
,p_message_language=>'sl'
,p_message_text=>unistr('Udele\017Eenec %0 odstranjen iz naloge')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142445076742752387)
,p_name=>'APEX.TASK.EVENT.RENEW'
,p_message_language=>'sl'
,p_message_text=>'Obnovitev'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142443964110752387)
,p_name=>'APEX.TASK.EVENT.RENEW_EXPIRED_MESSAGE'
,p_message_language=>'sl'
,p_message_text=>unistr('Naloga je bila obnovljena z ID-jem %0, maksimalno \0161tevilo preostalih obnovitev pred potekom je %1.')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142444917985752387)
,p_name=>'APEX.TASK.EVENT.RENEW_MESSAGE'
,p_message_language=>'sl'
,p_message_text=>'ID naloge %0 obnovljen z ID-jem naloge %1'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142440952120752386)
,p_name=>'APEX.TASK.EVENT.REQUEST_INFO'
,p_message_language=>'sl'
,p_message_text=>'Zahtevanje informacij'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142440890411752386)
,p_name=>'APEX.TASK.EVENT.REQUEST_INFO_MESSAGE'
,p_message_language=>'sl'
,p_message_text=>unistr('Zahtevano %0 za ve\010D informacij: %1')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142438769483752385)
,p_name=>'APEX.TASK.EVENT.SET_INITIATOR_CAN_COMPLETE_MESSAGE'
,p_message_language=>'sl'
,p_message_text=>unistr('Nastavite "Pobudnik lahko dokon\010Da" na %0')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142441072647752386)
,p_name=>'APEX.TASK.EVENT.SUBMIT_INFO'
,p_message_language=>'sl'
,p_message_text=>unistr('Predlo\017Eitev informacij')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142440770739752386)
,p_name=>'APEX.TASK.EVENT.SUBMIT_INFO_MESSAGE'
,p_message_language=>'sl'
,p_message_text=>unistr('Zahtevane informacije so bile predlo\017Eene osebi %0: %1')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142571988523752425)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT'
,p_message_language=>'sl'
,p_message_text=>'Posodobitev komentarja'
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142468495994752394)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT_MESSAGE'
,p_message_language=>'sl'
,p_message_text=>'Dodajanje komentarja: %0'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142471305913752395)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT_NOT_ALLOWED'
,p_message_language=>'sl'
,p_message_text=>'Stanje naloge ne dovoljuje nobenih komentarjev'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142478642580752397)
,p_name=>'APEX.TASK.EVENT.UPDATE_DUE_DATE_MESSAGE'
,p_message_language=>'sl'
,p_message_text=>'Nastavite datum zapadlosti naloge na %0'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142436775159752384)
,p_name=>'APEX.TASK.EVENT.UPDATE_DUE_ON'
,p_message_language=>'sl'
,p_message_text=>'Posodobitev zapade'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142572045358752425)
,p_name=>'APEX.TASK.EVENT.UPDATE_OWNER'
,p_message_language=>'sl'
,p_message_text=>'Posodobitev lastnika'
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142469709388752394)
,p_name=>'APEX.TASK.EVENT.UPDATE_OWNER_MESSAGE'
,p_message_language=>'sl'
,p_message_text=>unistr('Dodajanje potencialnega lastnika %0 udele\017Eencem naloge')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142468878506752394)
,p_name=>'APEX.TASK.EVENT.UPDATE_PARAM'
,p_message_language=>'sl'
,p_message_text=>'Posodobi parametre'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142572104102752425)
,p_name=>'APEX.TASK.EVENT.UPDATE_PRIORITY'
,p_message_language=>'sl'
,p_message_text=>'Posodobitev prioritete'
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142470423030752394)
,p_name=>'APEX.TASK.EVENT.UPDATE_PRIORITY_MESSAGE'
,p_message_language=>'sl'
,p_message_text=>'Nastavitev prioritete naloge na %0'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142467796963752394)
,p_name=>'APEX.TASK.EVENT.UPD_PARAMETER_MESSAGE'
,p_message_language=>'sl'
,p_message_text=>'Parameter "%0" je bil posodobljen iz "%1" v "%2".'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142451290568752389)
,p_name=>'APEX.TASK.EVENT.WF_CANCEL_MESSAGE'
,p_message_language=>'sl'
,p_message_text=>'Naloga je bila preklicana, ker je bila ustrezna instanca delovnega toka prekinjena.'
,p_version_scn=>2705517
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142448387269752388)
,p_name=>'APEX.TASK.FORWARD_TASK_NOT_AUTHORIZED'
,p_message_language=>'sl'
,p_message_text=>'Posredovanje naloge: Ni pooblastila'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142441786623752386)
,p_name=>'APEX.TASK.INITIATED_BY_USER_SINCE'
,p_message_language=>'sl'
,p_message_text=>'Inicializiral %0 %1'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142450667429752389)
,p_name=>'APEX.TASK.INTERNAL_ERROR'
,p_message_language=>'sl'
,p_message_text=>unistr('Pri\0161lo je do nepri\010Dakovane notranje napake')
,p_version_scn=>2705517
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142448948962752388)
,p_name=>'APEX.TASK.NOT_APPLICABLE'
,p_message_language=>'sl'
,p_message_text=>'Operacija naloge se ne uporablja'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142474590478752396)
,p_name=>'APEX.TASK.NO_POTENTIAL_OWNER'
,p_message_language=>'sl'
,p_message_text=>'Ta morebitni lastnik ne obstaja.'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142450214143752388)
,p_name=>'APEX.TASK.OUTCOME.APPROVED'
,p_message_language=>'sl'
,p_message_text=>'Odobreno'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142450353317752388)
,p_name=>'APEX.TASK.OUTCOME.REJECTED'
,p_message_language=>'sl'
,p_message_text=>'Zavrnjeno'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142431703259752383)
,p_name=>'APEX.TASK.OUTCOME_MISSING'
,p_message_language=>'sl'
,p_message_text=>unistr('Dokon\010Danje naloge zahteva rezultat')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142431924002752383)
,p_name=>'APEX.TASK.OUTCOME_NOT_ALLOWED'
,p_message_language=>'sl'
,p_message_text=>'Nalogi ni dovoljeno imeti rezultata'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142467531881752394)
,p_name=>'APEX.TASK.PARAM_NOT_UPDATABLE'
,p_message_language=>'sl'
,p_message_text=>unistr('Ni mogo\010De posodobiti parametra %0.')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142463857217752392)
,p_name=>'APEX.TASK.PARTICIPANT_EXISTS'
,p_message_language=>'sl'
,p_message_text=>unistr('Udele\017Eenec \017Ee obstaja za to instanco naloge.')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142565393452752423)
,p_name=>'APEX.TASK.PRIORITY.1'
,p_message_language=>'sl'
,p_message_text=>'Nujno'
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142442425226752386)
,p_name=>'APEX.TASK.PRIORITY.1.DESCRIPTION'
,p_message_language=>'sl'
,p_message_text=>'Nujno'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142565297715752423)
,p_name=>'APEX.TASK.PRIORITY.2'
,p_message_language=>'sl'
,p_message_text=>'Visoko'
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142442529981752386)
,p_name=>'APEX.TASK.PRIORITY.2.DESCRIPTION'
,p_message_language=>'sl'
,p_message_text=>'Visoka prioriteta'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142565100094752423)
,p_name=>'APEX.TASK.PRIORITY.3'
,p_message_language=>'sl'
,p_message_text=>'Srednje'
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142442627057752386)
,p_name=>'APEX.TASK.PRIORITY.3.DESCRIPTION'
,p_message_language=>'sl'
,p_message_text=>'Srednja prioriteta'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142565083948752423)
,p_name=>'APEX.TASK.PRIORITY.4'
,p_message_language=>'sl'
,p_message_text=>'Nizko'
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142442775781752386)
,p_name=>'APEX.TASK.PRIORITY.4.DESCRIPTION'
,p_message_language=>'sl'
,p_message_text=>'Nizka prioriteta'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142564969582752423)
,p_name=>'APEX.TASK.PRIORITY.5'
,p_message_language=>'sl'
,p_message_text=>unistr('Najni\017Eje')
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142442820958752386)
,p_name=>'APEX.TASK.PRIORITY.5.DESCRIPTION'
,p_message_language=>'sl'
,p_message_text=>unistr('Najni\017Eja prioriteta')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142448535644752388)
,p_name=>'APEX.TASK.SET_PRIORITY_NOT_AUTHORIZED'
,p_message_language=>'sl'
,p_message_text=>'Nastavitev prioritete naloge: Ni pooblastila'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142449777422752388)
,p_name=>'APEX.TASK.STATE.ASSIGNED'
,p_message_language=>'sl'
,p_message_text=>'Dodeljeno'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142450146495752388)
,p_name=>'APEX.TASK.STATE.CANCELLED'
,p_message_language=>'sl'
,p_message_text=>'Preklicano'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142449870159752388)
,p_name=>'APEX.TASK.STATE.COMPLETED'
,p_message_language=>'sl'
,p_message_text=>unistr('Dokon\010Dano')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142450065032752388)
,p_name=>'APEX.TASK.STATE.ERRORED'
,p_message_language=>'sl'
,p_message_text=>'Z napako'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142443572174752386)
,p_name=>'APEX.TASK.STATE.EXPIRED'
,p_message_language=>'sl'
,p_message_text=>'Poteklo'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142449917028752388)
,p_name=>'APEX.TASK.STATE.FAILED'
,p_message_language=>'sl'
,p_message_text=>'Ni uspelo'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142440292046752385)
,p_name=>'APEX.TASK.STATE.INFO_REQUESTED'
,p_message_language=>'sl'
,p_message_text=>'Informacije so bile zahtevane'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142449610738752388)
,p_name=>'APEX.TASK.STATE.UNASSIGNED'
,p_message_language=>'sl'
,p_message_text=>'Oddeljeno'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142472078992752395)
,p_name=>'APEX.TASK.TASK_CREATE_ERROR'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Ustvarjanje nove naloge za definicijo naloge %0 v aplikaciji %1 ni uspelo.',
'SQLCODE: %2'))
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142471980804752395)
,p_name=>'APEX.TASK.TASK_CREATE_NO_POTENTIAL_OWNER'
,p_message_language=>'sl'
,p_message_text=>unistr('Poskus ustvarjanja naloge za definicijo naloge %0 v aplikaciji %1 ni uspel, ker definicija naloge ne vsebuje nobenih potencialnih lastnikov - uredite definicijo naloge in dodajte vsaj enega udele\017Eenca tipa "potencialni lastnik"')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142449254169752388)
,p_name=>'APEX.TASK.TASK_DEFINITION_NOT_FOUND'
,p_message_language=>'sl'
,p_message_text=>unistr('Definicije naloge ni mogo\010De najti')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142449110343752388)
,p_name=>'APEX.TASK.TASK_DEF_PARTICIPANTS_NOT_FOUND'
,p_message_language=>'sl'
,p_message_text=>unistr('Udele\017Eencev za nalogo ni mogo\010De najti')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142450501477752388)
,p_name=>'APEX.TASK.TASK_ID_PK_VIOLATION'
,p_message_language=>'sl'
,p_message_text=>unistr('Ve\010D kot ena naloga za dani ID naloge - preverite pri svojem skrbniku baze podatkov')
,p_version_scn=>2705517
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142449389024752388)
,p_name=>'APEX.TASK.TASK_NOT_FOUND'
,p_message_language=>'sl'
,p_message_text=>unistr('Naloge ni mogo\010De najti')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142449016940752388)
,p_name=>'APEX.TASK.TASK_PARAMETER_NOT_FOUND'
,p_message_language=>'sl'
,p_message_text=>unistr('Parametra naloge ni mogo\010De najti')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142485382362752399)
,p_name=>'APEX.TASK.TYPE.ACTION'
,p_message_language=>'sl'
,p_message_text=>'Dejanje'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142485281312752399)
,p_name=>'APEX.TASK.TYPE.APPROVAL'
,p_message_language=>'sl'
,p_message_text=>'Odobritev'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142432629901752383)
,p_name=>'APEX.TASK.VACATION_RULE_ERROR'
,p_message_language=>'sl'
,p_message_text=>unistr('Postopek pravila za dopuste %2 se ni uspe\0161no izvedel za definicijo naloge %0 v aplikaciji %1.')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142432871220752383)
,p_name=>'APEX.TASK.VACATION_RULE_MESSAGE'
,p_message_language=>'sl'
,p_message_text=>unistr('Udele\017Eenec %1 je bil dodan kot zamenjava za udele\017Eenca %0. Vzrok - %2.')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142636552053752444)
,p_name=>'APEX.TB.TOOLBAR'
,p_message_language=>'sl'
,p_message_text=>'Orodna vrstica'
,p_is_js_message=>true
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142490095287752400)
,p_name=>'APEX.TEMPLATE.APPLICATION'
,p_message_language=>'sl'
,p_message_text=>'Aplikacija'
,p_version_scn=>2705521
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142651255609752449)
,p_name=>'APEX.TEMPLATE.EXPAND_COLLAPSE_NAV_LABEL'
,p_message_language=>'sl'
,p_message_text=>unistr('Raz\0161iri/strni krmarjenje')
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142651353751752449)
,p_name=>'APEX.TEMPLATE.EXPAND_COLLAPSE_SIDE_COL_LABEL'
,p_message_language=>'sl'
,p_message_text=>unistr('Raz\0161iri/strni stranski stolpec')
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142559792217752421)
,p_name=>'APEX.TEMPLATE.MAIN_NAV_LABEL'
,p_message_language=>'sl'
,p_message_text=>'Glavno krmarjenje'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142460535533752391)
,p_name=>'APEX.TEMPLATE_DIRECTIVE.INVALID_PLACEHOLDER_NAME'
,p_message_language=>'sl'
,p_message_text=>'"%0" je neveljavno ime ograde.'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142567415325752423)
,p_name=>'APEX.TIME.DAY'
,p_message_language=>'sl'
,p_message_text=>'1 dan'
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142567221481752423)
,p_name=>'APEX.TIME.HOUR'
,p_message_language=>'sl'
,p_message_text=>'1 ura'
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142567526042752423)
,p_name=>'APEX.TIME.N_DAYS'
,p_message_language=>'sl'
,p_message_text=>'%0 (dnevi)'
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142567313299752423)
,p_name=>'APEX.TIME.N_HOURS'
,p_message_language=>'sl'
,p_message_text=>'%0 (ure)'
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142567107451752423)
,p_name=>'APEX.TIME.N_MINUTES'
,p_message_language=>'sl'
,p_message_text=>'%0 (minute)'
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142567719509752423)
,p_name=>'APEX.TIME.N_WEEKS'
,p_message_language=>'sl'
,p_message_text=>'%0 (tedni)'
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142567646969752423)
,p_name=>'APEX.TIME.WEEK'
,p_message_language=>'sl'
,p_message_text=>'1 teden'
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142465421815752393)
,p_name=>'APEX.TMV.SELECTION_COUNT'
,p_message_language=>'sl'
,p_message_text=>'Izbrani elementi: %0'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142465615046752393)
,p_name=>'APEX.TMV.SELECTOR_LABEL'
,p_message_language=>'sl'
,p_message_text=>'Izberi element'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142465518144752393)
,p_name=>'APEX.TMV.SELECTOR_LABEL_1'
,p_message_language=>'sl'
,p_message_text=>'Izberi %0'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142654371126752450)
,p_name=>'APEX.UI.BACK_TO_TOP'
,p_message_language=>'sl'
,p_message_text=>unistr('Za\010Detek strani')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142511971320752407)
,p_name=>'APEX.UI.ENABLED'
,p_message_language=>'sl'
,p_message_text=>unistr('Omogo\010Deno')
,p_is_js_message=>true
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142480461846752397)
,p_name=>'APEX.UNHANDLED_ERROR'
,p_message_language=>'sl'
,p_message_text=>'Napaka pri obdelavi zahteve.'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142466089037752393)
,p_name=>'APEX.UPDATE_MESSAGE_ERROR'
,p_message_language=>'sl'
,p_message_text=>unistr('Besedilnega sporo\010Dila %0 ni mogo\010De posodobiti, ker je naro\010Deno iz druge aplikacije.')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142569144689752424)
,p_name=>'APEX.VALUE_REQUIRED'
,p_message_language=>'sl'
,p_message_text=>'Zahtevana je vrednost'
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142485562823752399)
,p_name=>'APEX.VISUALLY_HIDDEN_HEADING'
,p_message_language=>'sl'
,p_message_text=>'Raven naslova %0, skrito'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142613989591752437)
,p_name=>'APEX.WARN_ON_UNSAVED_CHANGES'
,p_message_language=>'sl'
,p_message_text=>'Ta stran ima neshranjene spremembe.'
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142475568286752396)
,p_name=>'APEX.WF.NAVIGATOR'
,p_message_language=>'sl'
,p_message_text=>'Krmar'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142475244566752396)
,p_name=>'APEX.WF.ZOOM_IN'
,p_message_language=>'sl'
,p_message_text=>unistr('Pove\010Dava')
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142476290484752396)
,p_name=>'APEX.WF.ZOOM_LEVEL'
,p_message_language=>'sl'
,p_message_text=>unistr('Raven pove\010Dave {0} %')
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142475321471752396)
,p_name=>'APEX.WF.ZOOM_OUT'
,p_message_language=>'sl'
,p_message_text=>unistr('Pomanj\0161ava')
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142475436095752396)
,p_name=>'APEX.WF.ZOOM_RESET'
,p_message_language=>'sl'
,p_message_text=>unistr('Ponastavitev pove\010Dave')
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142450917122752389)
,p_name=>'APEX.WF_DIAGRAM.ARIA_DESC'
,p_message_language=>'sl'
,p_message_text=>'Diagram delovnega toka trenutno ni dostopen.'
,p_is_js_message=>true
,p_version_scn=>2705517
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142450841666752389)
,p_name=>'APEX.WF_DIAGRAM.ARIA_LABEL'
,p_message_language=>'sl'
,p_message_text=>'Diagram delovnega toka'
,p_is_js_message=>true
,p_version_scn=>2705517
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142452764062752389)
,p_name=>'APEX.WORKFLOW.ACTION_NOT_ALLOWED'
,p_message_language=>'sl'
,p_message_text=>'Instanca delovnega toka %0 je trenutno v stanju %1. Zato operacija ni dovoljena'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142455330470752390)
,p_name=>'APEX.WORKFLOW.ACTIVITY.COMPLETED'
,p_message_language=>'sl'
,p_message_text=>unistr('Instanca %1 aktivnosti %2 v delovnem toku %0 je bila zaklju\010Dena')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142455117661752390)
,p_name=>'APEX.WORKFLOW.ACTIVITY.CREATED'
,p_message_language=>'sl'
,p_message_text=>'Ustvarjena nova instanca %1 aktivnosti %2 v delovnem toku %0'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142446929324752387)
,p_name=>'APEX.WORKFLOW.ACTIVITY.DATA_NOT_FOUND'
,p_message_language=>'sl'
,p_message_text=>unistr('Dodatne vrstice podatkov, povezane s to instanco aktivnosti delovnega toka, ni bilo mogo\010De najti')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142455205586752390)
,p_name=>'APEX.WORKFLOW.ACTIVITY.RETRIED'
,p_message_language=>'sl'
,p_message_text=>unistr('Okvarjena instanca %1 aktivnosti %2 v delovnem toku %0 je bila ponovno posku\0161ena')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142437205849752385)
,p_name=>'APEX.WORKFLOW.ACTIVITY.TERMINATED'
,p_message_language=>'sl'
,p_message_text=>'Instanca aktivnosti %1 v delovnem toku %0 je bila prekinjena'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142471048955752395)
,p_name=>'APEX.WORKFLOW.ACTIVITY.TIMEOUT'
,p_message_language=>'sl'
,p_message_text=>unistr('Instanci aktivnosti %1 v delovnem toku %0 je potekla \010Dasovna omejitev in je bila prekinjena.')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142455474021752390)
,p_name=>'APEX.WORKFLOW.ACTIVITY.WAITING'
,p_message_language=>'sl'
,p_message_text=>unistr('Instanca %1 aktivnosti %2 v delovnem toku %0 je v stanju \010Dakanja')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142437009543752385)
,p_name=>'APEX.WORKFLOW.ALTERED_AND_RESUMED'
,p_message_language=>'sl'
,p_message_text=>'Instanca delovnega toka %0 je bila spremenjena in nadaljevana pri aktivnosti %1'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142454479700752390)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.COMPLETED'
,p_message_language=>'sl'
,p_message_text=>unistr('\010Cakajo\010Da instanca %1 aktivnosti %2 v delovnem toku %0 se je uspe\0161no zaklju\010Dila')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142454206904752390)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.FAULTED'
,p_message_language=>'sl'
,p_message_text=>unistr('\010Cakajo\010Da aktivnost %1 je bila Okvarjeno, ker je bil delovni tok %0 \017Ee v stanju Okvarjeno, preden se je aktivnost zaklju\010Dila')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142454384331752390)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.TERMINATED'
,p_message_language=>'sl'
,p_message_text=>unistr('\010Cakajo\010Da aktivnost %1 je bila prekinjena, ker je bil delovni tok %0 \017Ee v stanju Prekinjeno, preden se je aktivnost zaklju\010Dila')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142437369454752385)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.TERMINATE_FAILED'
,p_message_language=>'sl'
,p_message_text=>'Prekinitev aktivnosti %1 v delovnem toku %0 ni uspela zaradi izjeme - %2'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142452915070752389)
,p_name=>'APEX.WORKFLOW.BUSY'
,p_message_language=>'sl'
,p_message_text=>unistr('Delovni tok je trenutno zaposlen z zaklju\010Devanjem prej\0161nje operacije. Poskusite pozneje')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142469097371752394)
,p_name=>'APEX.WORKFLOW.COMPLETED_SINCE'
,p_message_language=>'sl'
,p_message_text=>unistr('Dokon\010Dano %0')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142452071510752389)
,p_name=>'APEX.WORKFLOW.CONTINUE.NOT_ALLOWED'
,p_message_language=>'sl'
,p_message_text=>unistr('Delovnega toka %0 ni mogo\010De nadaljevati, ker je trenutno v aktivnosti %1, ki ni v stanju \010Dakanja')
,p_version_scn=>2705517
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142463910804752392)
,p_name=>'APEX.WORKFLOW.CORRELATION_CONTEXT_ERROR'
,p_message_language=>'sl'
,p_message_text=>unistr('%0 ni veljaven kontekst korelacije delovnega toka za proces, ki se izvaja s to aktivnostjo delovnega toka. Kontekst korelacije mora biti besedilo, lo\010Deno z dvopi\010Dji, ki vsebuje APEX_APPL_WORKFLOW, ki mu sledita ID instance delovnega toka in ID instan')
||'ce aktivnosti.'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142454651610752390)
,p_name=>'APEX.WORKFLOW.CREATED'
,p_message_language=>'sl'
,p_message_text=>'Ustvarjena nova instanca %0 delovnega toka %1, verzija %2'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142446776960752387)
,p_name=>'APEX.WORKFLOW.DATA_NOT_FOUND'
,p_message_language=>'sl'
,p_message_text=>unistr('Dodatne vrstice podatkov, povezane s to instanco delovnega toka, ni bilo mogo\010De najti')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142469253698752394)
,p_name=>'APEX.WORKFLOW.DUE_SINCE'
,p_message_language=>'sl'
,p_message_text=>'Zapade %0'
,p_version_scn=>2705519
);
end;
/
begin
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142454573509752390)
,p_name=>'APEX.WORKFLOW.END'
,p_message_language=>'sl'
,p_message_text=>unistr('Delovni tok %0 se je kon\010Dal s stanjem %1')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142451778394752389)
,p_name=>'APEX.WORKFLOW.INCOMPATIBLE_DATA_TYPE'
,p_message_language=>'sl'
,p_message_text=>unistr('Podatkovni tip %1 za pogoje, ki se primerjajo v aktivnosti stikala delovnega toka %0, ni zdru\017Eljiv z operatorjem pogoja')
,p_version_scn=>2705517
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142441582378752386)
,p_name=>'APEX.WORKFLOW.INITIATED_BY_USER_SINCE'
,p_message_language=>'sl'
,p_message_text=>'Inicializiral %0 %1'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142464370851752393)
,p_name=>'APEX.WORKFLOW.INVOKED'
,p_message_language=>'sl'
,p_message_text=>'Ustvarjena nova instanca %0 delovnega toka %1, verzija %2 - priklicano iz instance aktivnosti %4 instance delovnega toka %3'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142437153912752385)
,p_name=>'APEX.WORKFLOW.NO_ACTIVITY_FOUND'
,p_message_language=>'sl'
,p_message_text=>unistr('Aktivnost s stati\010Dnim ID-jem %1 ni aktivnost v delovnem toku %0. Preverite stati\010Dne ID-je aktivnosti ustrezne verzije delovnega toka.')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142462492157752392)
,p_name=>'APEX.WORKFLOW.REQUIRED_PARAM_MISSING'
,p_message_language=>'sl'
,p_message_text=>'%0 je zahtevan parameter za ta delovni tok in ne sme biti NULL.'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142455025911752390)
,p_name=>'APEX.WORKFLOW.RESUMED'
,p_message_language=>'sl'
,p_message_text=>'Instanca delovnega toka %0 je bila nadaljevana'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142454955762752390)
,p_name=>'APEX.WORKFLOW.RETRIED'
,p_message_language=>'sl'
,p_message_text=>unistr('Instanca delovnega toka %0 je bila ponovno posku\0161ena')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142469383517752394)
,p_name=>'APEX.WORKFLOW.RETRY_COUNT.EQUALS_ONE'
,p_message_language=>'sl'
,p_message_text=>unistr('\0160t. ponovnih poskusov: %0')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142469491081752394)
,p_name=>'APEX.WORKFLOW.RETRY_COUNT.NOT_EQUALS_ONE'
,p_message_language=>'sl'
,p_message_text=>unistr('\0160t. ponovnih poskusov: %0')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142469137044752394)
,p_name=>'APEX.WORKFLOW.STARTED_SINCE'
,p_message_language=>'sl'
,p_message_text=>unistr('Za\010Deto %0')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142463330895752392)
,p_name=>'APEX.WORKFLOW.STATE.ACTIVE'
,p_message_language=>'sl'
,p_message_text=>'Aktivno'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142463500971752392)
,p_name=>'APEX.WORKFLOW.STATE.COMPLETED'
,p_message_language=>'sl'
,p_message_text=>unistr('Dokon\010Dano')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142463602001752392)
,p_name=>'APEX.WORKFLOW.STATE.FAULTED'
,p_message_language=>'sl'
,p_message_text=>'Okvarjeno'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142463704540752392)
,p_name=>'APEX.WORKFLOW.STATE.SUSPENDED'
,p_message_language=>'sl'
,p_message_text=>unistr('Za\010Dasno prekinjeno')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142463496197752392)
,p_name=>'APEX.WORKFLOW.STATE.TERMINATED'
,p_message_language=>'sl'
,p_message_text=>'Prekinjeno'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142478716942752397)
,p_name=>'APEX.WORKFLOW.STATE.WAITING'
,p_message_language=>'sl'
,p_message_text=>unistr('\010Cakanje')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142454769716752390)
,p_name=>'APEX.WORKFLOW.SUSPENDED'
,p_message_language=>'sl'
,p_message_text=>unistr('Instanca delovnega toka %0 je bila za\010Dasno prekinjena')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142460614632752391)
,p_name=>'APEX.WORKFLOW.SWITCH.BRANCH_NOT_FOUND'
,p_message_language=>'sl'
,p_message_text=>unistr('Naslednje aktivnosti za instanco delovnega toka %0 ni mogo\010De dolo\010Diti. Pred ponovnim poskusom delovnega toka preverite in popravite pogoje, dolo\010Dene za trenutno aktivnost stikala.')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142454814391752390)
,p_name=>'APEX.WORKFLOW.TERMINATED'
,p_message_language=>'sl'
,p_message_text=>'Instanca delovnega toka %0 je bila prekinjena'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142453917212752390)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_RESUME'
,p_message_language=>'sl'
,p_message_text=>'Samo poslovni skrbnik delovnega toka %0 lahko nadaljuje delovni tok'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142454003364752390)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_RETRY'
,p_message_language=>'sl'
,p_message_text=>'Delovni tok %0 lahko ponovno poskusi le poslovni skrbnik in/ali lastnik'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142453502008752389)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_SUSPEND'
,p_message_language=>'sl'
,p_message_text=>unistr('Instanco delovnega toka %0 lahko za\010Dasno prekine le poslovni skrbnik delovnega toka')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142453845234752389)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_TERMINATE'
,p_message_language=>'sl'
,p_message_text=>'Delovni tok lahko prekinejo samo lastniki in poslovni skrbniki instance delovnega toka %0'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142452203149752389)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_UPDATE'
,p_message_language=>'sl'
,p_message_text=>unistr('Spremenljivke delovnega toka %0 lahko posodablja samo poslovni skrbnik, ki je dolo\010Den za delovni tok')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142466800410752393)
,p_name=>'APEX.WORKFLOW.UPDATE,NOT_ALLOWED'
,p_message_language=>'sl'
,p_message_text=>unistr('Instanca delovnega toka %0 mora biti v stanju Okvarjeno ali Za\010Dasno prekinjeno, preden je mogo\010De posodobiti njene spremenljivke.')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142458335071752391)
,p_name=>'APEX.WORKFLOW.UPDATED'
,p_message_language=>'sl'
,p_message_text=>'Vrednost spremenljivke delovnega toka %0 je posodobljena na %1'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142468529417752394)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_ACTIVE'
,p_message_language=>'sl'
,p_message_text=>'Delovni tok %0 nima aktivne verzije'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142468663041752394)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_DEV'
,p_message_language=>'sl'
,p_message_text=>'Delovni tok %0 nima verzije v razvoju'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142468715879752394)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_FOUND'
,p_message_language=>'sl'
,p_message_text=>'Delovni tok %0 nima aktivne verzije ali verzije v razvoju'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142451693434752389)
,p_name=>'APEX.WORKFLOW.WORKFLOW_ACT_INSTANCE_NOT_FOUND'
,p_message_language=>'sl'
,p_message_text=>unistr('Instance aktivnosti %1 za instanco delovnega %0 ni bilo mogo\010De najti')
,p_version_scn=>2705517
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142451490675752389)
,p_name=>'APEX.WORKFLOW.WORKFLOW_INSTANCE_NOT_FOUND'
,p_message_language=>'sl'
,p_message_text=>unistr('Instance delovnega toka %0 ni bilo mogo\010De najti')
,p_version_scn=>2705517
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142486535926752399)
,p_name=>'APEX.XLSX.ERROR.NO_ACTIVE_WORKSHEET'
,p_message_language=>'sl'
,p_message_text=>'Delovni zvezek nima nobenega aktivnega delovnega lista.'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142486486597752399)
,p_name=>'APEX.XLSX.ERROR.WORKBOOK_NOT_INITIALIZED'
,p_message_language=>'sl'
,p_message_text=>'Delovni zvezek ni inicializiran.'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142486395095752399)
,p_name=>'APEX.XLSX.INTERNAL_ERROR'
,p_message_language=>'sl'
,p_message_text=>unistr('Pri ustvarjanju datoteke XLSX je pri\0161lo do notranje napake.')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142488896463752400)
,p_name=>'APEX.XLSX.SHEET'
,p_message_language=>'sl'
,p_message_text=>'List'
,p_version_scn=>2705521
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142499427860752403)
,p_name=>'APEX.XLSX.SHEET_NAME_TAKEN'
,p_message_language=>'sl'
,p_message_text=>unistr('Ime delovnega lista "%0" je \017Ee zasedeno. Poskusite z drugim.')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142628058105752442)
,p_name=>'APEXIR_ACTIONS'
,p_message_language=>'sl'
,p_message_text=>'Dejanja'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142543034177752416)
,p_name=>'APEXIR_ACTIONS_MENU'
,p_message_language=>'sl'
,p_message_text=>'Meni Dejanja'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142538760786752415)
,p_name=>'APEXIR_ADD_FUNCTION'
,p_message_language=>'sl'
,p_message_text=>'Doda funkcijo'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142538608127752415)
,p_name=>'APEXIR_ADD_GROUP_BY_COLUMN'
,p_message_language=>'sl'
,p_message_text=>'Dodaj stolpec Grupiranje'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142576241279752426)
,p_name=>'APEXIR_ADD_PIVOT_COLUMN'
,p_message_language=>'sl'
,p_message_text=>'Dodaj vrtilni stolpec'
,p_version_scn=>2705538
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142576374500752426)
,p_name=>'APEXIR_ADD_ROW_COLUMN'
,p_message_language=>'sl'
,p_message_text=>'Dodaj stolpec vrstice'
,p_version_scn=>2705538
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142510722392752406)
,p_name=>'APEXIR_AGGREGATE'
,p_message_language=>'sl'
,p_message_text=>unistr('Zdru\017Eevanje')
,p_is_js_message=>true
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142549269833752418)
,p_name=>'APEXIR_AGGREGATION'
,p_message_language=>'sl'
,p_message_text=>unistr('Zdru\017Eevanje')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142530180850752412)
,p_name=>'APEXIR_AGG_AVG'
,p_message_language=>'sl'
,p_message_text=>unistr('Povpre\010Dje')
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142534483876752413)
,p_name=>'APEXIR_AGG_COUNT'
,p_message_language=>'sl'
,p_message_text=>unistr('\0160tevilo')
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142530255065752412)
,p_name=>'APEXIR_AGG_MAX'
,p_message_language=>'sl'
,p_message_text=>'Maksimum'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142530432600752412)
,p_name=>'APEXIR_AGG_MEDIAN'
,p_message_language=>'sl'
,p_message_text=>'Mediana'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142530364069752412)
,p_name=>'APEXIR_AGG_MIN'
,p_message_language=>'sl'
,p_message_text=>'Minimum'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142530024483752412)
,p_name=>'APEXIR_AGG_SUM'
,p_message_language=>'sl'
,p_message_text=>'Vsota %0'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142531118515752412)
,p_name=>'APEXIR_ALL'
,p_message_language=>'sl'
,p_message_text=>'Vse'
,p_is_js_message=>true
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142510073014752406)
,p_name=>'APEXIR_ALL_COLUMNS'
,p_message_language=>'sl'
,p_message_text=>'Vsi stolpci'
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142490150594752400)
,p_name=>'APEXIR_ALL_ROWS'
,p_message_language=>'sl'
,p_message_text=>'Vse vrstice'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142625081245752441)
,p_name=>'APEXIR_ALTERNATIVE'
,p_message_language=>'sl'
,p_message_text=>'Nadomestno'
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142626667522752441)
,p_name=>'APEXIR_ALTERNATIVE_DEFAULT_NAME'
,p_message_language=>'sl'
,p_message_text=>'Nadomestno privzeto: %0'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142524210581752410)
,p_name=>'APEXIR_AND'
,p_message_language=>'sl'
,p_message_text=>'in'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142559075485752421)
,p_name=>'APEXIR_API.IMPORT_CONTENT_CORRUPTED'
,p_message_language=>'sl'
,p_message_text=>unistr('Shranjenega poro\010Dila ni mogo\010De uvoziti. Vsebina je po\0161kodovana.')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142559112918752421)
,p_name=>'APEXIR_API.IMPORT_CONTENT_EMPTY'
,p_message_language=>'sl'
,p_message_text=>unistr('Shranjenega poro\010Dila ni mogo\010De uvoziti. Vsebina je prazna.')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142512297139752407)
,p_name=>'APEXIR_APPLY'
,p_message_language=>'sl'
,p_message_text=>'Dodeli'
,p_is_js_message=>true
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142505896080752405)
,p_name=>'APEXIR_ASCENDING'
,p_message_language=>'sl'
,p_message_text=>unistr('Nara\0161\010Dajo\010De')
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142527332640752411)
,p_name=>'APEXIR_AS_OF'
,p_message_language=>'sl'
,p_message_text=>'Z dne %0'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142627289023752441)
,p_name=>'APEXIR_AVERAGE_X'
,p_message_language=>'sl'
,p_message_text=>unistr('Povpre\010Dje %0')
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142618835778752439)
,p_name=>'APEXIR_BAR'
,p_message_language=>'sl'
,p_message_text=>'Vrstica'
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142511595010752407)
,p_name=>'APEXIR_BETWEEN'
,p_message_language=>'sl'
,p_message_text=>'med'
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142504621402752405)
,p_name=>'APEXIR_BGCOLOR'
,p_message_language=>'sl'
,p_message_text=>'Barva ozadja'
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142506508424752405)
,p_name=>'APEXIR_BLUE'
,p_message_language=>'sl'
,p_message_text=>'modra'
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142540643993752415)
,p_name=>'APEXIR_BOTTOM'
,p_message_language=>'sl'
,p_message_text=>'Spodaj'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142471489674752395)
,p_name=>'APEXIR_BTNS_NEXT_TO_SEARCH_OF'
,p_message_language=>'sl'
,p_message_text=>'Gumbi zraven vrstice za iskanje za %0'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142507181544752405)
,p_name=>'APEXIR_CANCEL'
,p_message_language=>'sl'
,p_message_text=>unistr('Prekli\010Di')
,p_is_js_message=>true
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142513466234752407)
,p_name=>'APEXIR_CATEGORY'
,p_message_language=>'sl'
,p_message_text=>'Kategorija'
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142504521333752405)
,p_name=>'APEXIR_CELL'
,p_message_language=>'sl'
,p_message_text=>'Celica'
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142531078585752412)
,p_name=>'APEXIR_CHART'
,p_message_language=>'sl'
,p_message_text=>'Grafikon'
,p_is_js_message=>true
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142541506854752416)
,p_name=>'APEXIR_CHART_INITIALIZING'
,p_message_language=>'sl'
,p_message_text=>'Inicializiranje ...'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142581204093752427)
,p_name=>'APEXIR_CHART_LABEL_NOT_NULL'
,p_message_language=>'sl'
,p_message_text=>unistr('Dolo\010Diti je treba oznako grafikona.')
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142593633634752431)
,p_name=>'APEXIR_CHART_MAX_DATAPOINT_CNT'
,p_message_language=>'sl'
,p_message_text=>unistr('Va\0161a poizvedba presega maksimalno \0161tevilo podatkovnih to\010Dk %0 na grafikon. Uporabite filter, da zmanj\0161ate \0161tevilo zapisov v osnovni poizvedbi.')
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142592551000752431)
,p_name=>'APEXIR_CHART_MAX_ROW_CNT'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Maksimalno \0161tevilo vrstic za poizvedbo grafikonov omeji \0161tevilo vrstic v osnovni poizvedbi in ne \0161tevila prikazanih vrstic. '),
unistr('Va\0161a osnovna poizvedba presega maksimalno \0161tevilo vrstic, ki je %0. Uporabite filter, da zmanj\0161ate \0161tevilo zapisov v osnovni poizvedbi.')))
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142510106836752406)
,p_name=>'APEXIR_CHART_TYPE'
,p_message_language=>'sl'
,p_message_text=>'Tip grafikona'
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142474000105752395)
,p_name=>'APEXIR_CHART_VIEW_OF'
,p_message_language=>'sl'
,p_message_text=>'Pogled grafikona za %0'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142589213735752430)
,p_name=>'APEXIR_CHECK_ALL'
,p_message_language=>'sl'
,p_message_text=>unistr('Ozna\010Di vse')
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142527788075752411)
,p_name=>'APEXIR_CHOOSE_DOWNLOAD_FORMAT'
,p_message_language=>'sl'
,p_message_text=>unistr('Izbira formata poro\010Dila')
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142535553985752414)
,p_name=>'APEXIR_CLEAR'
,p_message_language=>'sl'
,p_message_text=>unistr('po\010Disti')
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142507088321752405)
,p_name=>'APEXIR_COLUMN'
,p_message_language=>'sl'
,p_message_text=>'Stolpec'
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142546878090752417)
,p_name=>'APEXIR_COLUMNS'
,p_message_language=>'sl'
,p_message_text=>'Stolpci'
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142514069817752407)
,p_name=>'APEXIR_COLUMN_ALIASES'
,p_message_language=>'sl'
,p_message_text=>'Druga imena stolpca'
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142621600550752440)
,p_name=>'APEXIR_COLUMN_FILTER'
,p_message_language=>'sl'
,p_message_text=>'Filtriranje ...'
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142481870223752398)
,p_name=>'APEXIR_COLUMN_HEADER'
,p_message_language=>'sl'
,p_message_text=>'Glava stolpca'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142495952458752402)
,p_name=>'APEXIR_COLUMN_HEADER_ACTIONS'
,p_message_language=>'sl'
,p_message_text=>'Dejanja stolpca'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142496210414752402)
,p_name=>'APEXIR_COLUMN_HEADER_ACTIONS_FOR'
,p_message_language=>'sl'
,p_message_text=>'Dejanja za stolpec "%0"'
,p_is_js_message=>true
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142537682283752414)
,p_name=>'APEXIR_COLUMN_HEADING_MENU'
,p_message_language=>'sl'
,p_message_text=>'Meni naslova stolpca'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142541378472752416)
,p_name=>'APEXIR_COLUMN_INFO'
,p_message_language=>'sl'
,p_message_text=>'Informacije o stolpcu'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142623965859752440)
,p_name=>'APEXIR_COLUMN_LABEL'
,p_message_language=>'sl'
,p_message_text=>'Oznaka stolpca'
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142539061026752415)
,p_name=>'APEXIR_COLUMN_N'
,p_message_language=>'sl'
,p_message_text=>'Stolpec %0'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142521919188752410)
,p_name=>'APEXIR_COMPARISON_CONTAINS'
,p_message_language=>'sl'
,p_message_text=>'vsebuje'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142523263785752410)
,p_name=>'APEXIR_COMPARISON_DOESNOT_CONTAIN'
,p_message_language=>'sl'
,p_message_text=>'ne vsebuje'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142505577566752405)
,p_name=>'APEXIR_COMPARISON_IN'
,p_message_language=>'sl'
,p_message_text=>'v'
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142523460347752410)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_LAST'
,p_message_language=>'sl'
,p_message_text=>'ni v zadnjih'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142532518044752413)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_NEXT'
,p_message_language=>'sl'
,p_message_text=>'ni v naslednjem'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142523367919752410)
,p_name=>'APEXIR_COMPARISON_IS_IN_LAST'
,p_message_language=>'sl'
,p_message_text=>'je v zadnjih'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142532468449752413)
,p_name=>'APEXIR_COMPARISON_IS_IN_NEXT'
,p_message_language=>'sl'
,p_message_text=>'je v naslednjem'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142505432883752405)
,p_name=>'APEXIR_COMPARISON_IS_NOT_NULL'
,p_message_language=>'sl'
,p_message_text=>'ni NULL'
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142505325179752405)
,p_name=>'APEXIR_COMPARISON_IS_NULL'
,p_message_language=>'sl'
,p_message_text=>'je NULL'
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142505153105752405)
,p_name=>'APEXIR_COMPARISON_LIKE'
,p_message_language=>'sl'
,p_message_text=>'kot'
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142505694843752405)
,p_name=>'APEXIR_COMPARISON_NOT_IN'
,p_message_language=>'sl'
,p_message_text=>'ni v'
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142505294389752405)
,p_name=>'APEXIR_COMPARISON_NOT_LIKE'
,p_message_language=>'sl'
,p_message_text=>'ni kot'
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142522258933752410)
,p_name=>'APEXIR_COMPARISON_REGEXP_LIKE'
,p_message_language=>'sl'
,p_message_text=>'se ujema z regularnim izrazom'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142527681700752411)
,p_name=>'APEXIR_COMPUTATION'
,p_message_language=>'sl'
,p_message_text=>unistr('Izra\010Dun')
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142592225690752431)
,p_name=>'APEXIR_COMPUTATION_EXPRESSION'
,p_message_language=>'sl'
,p_message_text=>unistr('Izraz izra\010Duna')
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142547196396752417)
,p_name=>'APEXIR_COMPUTATION_FOOTER'
,p_message_language=>'sl'
,p_message_text=>unistr('Ustvarjanje izra\010Duna z drugimi imeni stolpcev.')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142547250084752417)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E1'
,p_message_language=>'sl'
,p_message_text=>'(B+C)*100'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142547336187752417)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E2'
,p_message_language=>'sl'
,p_message_text=>'INITCAP(B)||'', ''||INITCAP(C)'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142547409039752417)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E3'
,p_message_language=>'sl'
,p_message_text=>'CASE WHEN A = 10 THEN B + C ELSE B END'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142488374945752400)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E4'
,p_message_language=>'sl'
,p_message_text=>'ROUND(C / 1000000)'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142531865672752413)
,p_name=>'APEXIR_COMPUTE'
,p_message_language=>'sl'
,p_message_text=>unistr('Izra\010Dun')
,p_is_js_message=>true
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142539632869752415)
,p_name=>'APEXIR_CONTROL_BREAK'
,p_message_language=>'sl'
,p_message_text=>'Kontrolni prelom'
,p_is_js_message=>true
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142542659588752416)
,p_name=>'APEXIR_CONTROL_BREAKS'
,p_message_language=>'sl'
,p_message_text=>'Kontrolni prelomi'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142629291661752442)
,p_name=>'APEXIR_CONTROL_BREAK_COLUMNS'
,p_message_language=>'sl'
,p_message_text=>'Kontrolni prelomni stolpci'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142485014398752399)
,p_name=>'APEXIR_COUNT_DISTINCT'
,p_message_language=>'sl'
,p_message_text=>unistr('\0160tevilo razli\010Dnih')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142627778704752441)
,p_name=>'APEXIR_COUNT_DISTINCT_X'
,p_message_language=>'sl'
,p_message_text=>unistr('\0160tevilo razli\010Dnih')
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142627678709752441)
,p_name=>'APEXIR_COUNT_X'
,p_message_language=>'sl'
,p_message_text=>unistr('\0160tevilo %0')
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142600633085752433)
,p_name=>'APEXIR_DAILY'
,p_message_language=>'sl'
,p_message_text=>'Dnevno'
,p_version_scn=>2705544
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142653969054752449)
,p_name=>'APEXIR_DATA'
,p_message_language=>'sl'
,p_message_text=>'Podatki'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142541444014752416)
,p_name=>'APEXIR_DATA_AS_OF'
,p_message_language=>'sl'
,p_message_text=>unistr('Podatki poro\010Dila pred toliko minutami: %0.')
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142474475230752396)
,p_name=>'APEXIR_DATA_VIEW_OF'
,p_message_language=>'sl'
,p_message_text=>'Pogled podatkov za %0'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142510848340752406)
,p_name=>'APEXIR_DATE'
,p_message_language=>'sl'
,p_message_text=>'Datum'
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142545313927752417)
,p_name=>'APEXIR_DEFAULT'
,p_message_language=>'sl'
,p_message_text=>'Privzeto'
,p_version_scn=>2705532
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142624891356752441)
,p_name=>'APEXIR_DEFAULT_REPORT_TYPE'
,p_message_language=>'sl'
,p_message_text=>unistr('Privzeti tip poro\010Dila')
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142507208231752405)
,p_name=>'APEXIR_DELETE'
,p_message_language=>'sl'
,p_message_text=>unistr('Izbri\0161i')
,p_is_js_message=>true
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142511176864752407)
,p_name=>'APEXIR_DELETE_CONFIRM'
,p_message_language=>'sl'
,p_message_text=>unistr('\017Delite izbrisati te nastavitve poro\010Dila?')
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142611653762752437)
,p_name=>'APEXIR_DELETE_DEFAULT_REPORT'
,p_message_language=>'sl'
,p_message_text=>unistr('Izbri\0161i privzeto poro\010Dilo')
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142539326377752415)
,p_name=>'APEXIR_DELETE_REPORT'
,p_message_language=>'sl'
,p_message_text=>unistr('Brisanje poro\010Dila')
,p_is_js_message=>true
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142505995309752405)
,p_name=>'APEXIR_DESCENDING'
,p_message_language=>'sl'
,p_message_text=>unistr('Padajo\010De')
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142513543164752407)
,p_name=>'APEXIR_DESCRIPTION'
,p_message_language=>'sl'
,p_message_text=>'Opis'
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142537519983752414)
,p_name=>'APEXIR_DETAIL_VIEW'
,p_message_language=>'sl'
,p_message_text=>'Pogled ene vrstice'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142545843580752417)
,p_name=>'APEXIR_DIRECTION'
,p_message_language=>'sl'
,p_message_text=>'Smer %0'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142546718900752417)
,p_name=>'APEXIR_DISABLED'
,p_message_language=>'sl'
,p_message_text=>unistr('Onemogo\010Deno')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142506772554752405)
,p_name=>'APEXIR_DISPLAYED'
,p_message_language=>'sl'
,p_message_text=>'Prikazano'
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142509947237752406)
,p_name=>'APEXIR_DISPLAYED_COLUMNS'
,p_message_language=>'sl'
,p_message_text=>'Prikazani stolpci'
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142545762079752417)
,p_name=>'APEXIR_DISPLAY_IN_REPORT'
,p_message_language=>'sl'
,p_message_text=>unistr('Prika\017Ei v poro\010Dilu')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142540556441752415)
,p_name=>'APEXIR_DOWN'
,p_message_language=>'sl'
,p_message_text=>'Dol'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142531984269752413)
,p_name=>'APEXIR_DOWNLOAD'
,p_message_language=>'sl'
,p_message_text=>'Prenos'
,p_is_js_message=>true
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142545699435752417)
,p_name=>'APEXIR_DO_NOT_DISPLAY'
,p_message_language=>'sl'
,p_message_text=>unistr('Ne prika\017Ei')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142614941975752438)
,p_name=>'APEXIR_DUPLICATE_HIGHLIGHT_COND'
,p_message_language=>'sl'
,p_message_text=>unistr('Ozna\010Dba z istim pogojem \017Ee obstaja.')
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142629471294752442)
,p_name=>'APEXIR_DUPLICATE_PIVOT_COLUMN'
,p_message_language=>'sl'
,p_message_text=>unistr('Podvojen vrtilni stolpec. Seznam vrtilnih stolpcev mora biti enoli\010Den.')
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142629610422752442)
,p_name=>'APEXIR_EDIT'
,p_message_language=>'sl'
,p_message_text=>'Uredi'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142541688399752416)
,p_name=>'APEXIR_EDIT_CHART'
,p_message_language=>'sl'
,p_message_text=>'Uredi nastavitve grafikona'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142548248532752418)
,p_name=>'APEXIR_EDIT_CHART2'
,p_message_language=>'sl'
,p_message_text=>'Uredi grafikon'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142512166420752407)
,p_name=>'APEXIR_EDIT_CONTROL_BREAK'
,p_message_language=>'sl'
,p_message_text=>'Urejanje kontrolnega preloma'
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142548693732752418)
,p_name=>'APEXIR_EDIT_FILTER'
,p_message_language=>'sl'
,p_message_text=>'Uredi filter'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142515119467752408)
,p_name=>'APEXIR_EDIT_FLASHBACK'
,p_message_language=>'sl'
,p_message_text=>'Urejanje pogleda nazaj'
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142606405636752435)
,p_name=>'APEXIR_EDIT_GROUP_BY'
,p_message_language=>'sl'
,p_message_text=>'Uredi grupiranje'
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142548533406752418)
,p_name=>'APEXIR_EDIT_HIGHLIGHT'
,p_message_language=>'sl'
,p_message_text=>unistr('Uredi ozna\010Dbo')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142576561789752426)
,p_name=>'APEXIR_EDIT_PIVOT'
,p_message_language=>'sl'
,p_message_text=>'Uredi vrtenje'
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142535942481752414)
,p_name=>'APEXIR_EDIT_REPORT'
,p_message_language=>'sl'
,p_message_text=>unistr('Urejanje poro\010Dila')
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142625194330752441)
,p_name=>'APEXIR_EMAIL'
,p_message_language=>'sl'
,p_message_text=>unistr('E-po\0161ta')
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142497391934752402)
,p_name=>'APEXIR_EMAIL_ADDRESS'
,p_message_language=>'sl'
,p_message_text=>unistr('E-po\0161tni naslov')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142625401329752441)
,p_name=>'APEXIR_EMAIL_BCC'
,p_message_language=>'sl'
,p_message_text=>'Skp'
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142625652562752441)
,p_name=>'APEXIR_EMAIL_BODY'
,p_message_language=>'sl'
,p_message_text=>'Telo'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142625309968752441)
,p_name=>'APEXIR_EMAIL_CC'
,p_message_language=>'sl'
,p_message_text=>'Kp'
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142626122645752441)
,p_name=>'APEXIR_EMAIL_FREQUENCY'
,p_message_language=>'sl'
,p_message_text=>'Pogostost'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142502531226752404)
,p_name=>'APEXIR_EMAIL_NOT_CONFIGURED'
,p_message_language=>'sl'
,p_message_text=>unistr('E-po\0161ta ni bila konfigurirana za to aplikacijo. Obrnite se na svojega skrbnika.')
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142599977333752433)
,p_name=>'APEXIR_EMAIL_REQUIRED'
,p_message_language=>'sl'
,p_message_text=>unistr('E-po\0161tni naslov mora biti naveden.')
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142625754643752441)
,p_name=>'APEXIR_EMAIL_SEE_ATTACHED'
,p_message_language=>'sl'
,p_message_text=>'Glejte prilogo'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142625528565752441)
,p_name=>'APEXIR_EMAIL_SUBJECT'
,p_message_language=>'sl'
,p_message_text=>'Zadeva'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142600913558752433)
,p_name=>'APEXIR_EMAIL_SUBJECT_REQUIRED'
,p_message_language=>'sl'
,p_message_text=>unistr('Zadeva e-po\0161tnega sporo\010Dila mora biti navedena.')
,p_version_scn=>2705544
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142625235326752441)
,p_name=>'APEXIR_EMAIL_TO'
,p_message_language=>'sl'
,p_message_text=>'Za'
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142504357039752404)
,p_name=>'APEXIR_ENABLED'
,p_message_language=>'sl'
,p_message_text=>unistr('Omogo\010Deno')
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142548429008752418)
,p_name=>'APEXIR_ENABLE_DISABLE_ALT'
,p_message_language=>'sl'
,p_message_text=>unistr('Omogo\010Di/onemogo\010Di')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142547965810752418)
,p_name=>'APEXIR_ERROR_LANDMARK'
,p_message_language=>'sl'
,p_message_text=>'Napaka! %0'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142547567600752417)
,p_name=>'APEXIR_EXAMPLES'
,p_message_language=>'sl'
,p_message_text=>'Primeri'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142548342406752418)
,p_name=>'APEXIR_EXAMPLES_WITH_COLON'
,p_message_language=>'sl'
,p_message_text=>'Primeri:'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142509817021752406)
,p_name=>'APEXIR_EXCLUDE_NULL'
,p_message_language=>'sl'
,p_message_text=>unistr('Izklju\010Di vrednosti NULL')
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142548994597752418)
,p_name=>'APEXIR_EXPAND_COLLAPSE_ALT'
,p_message_language=>'sl'
,p_message_text=>unistr('Raz\0161iri/strni')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142546595032752417)
,p_name=>'APEXIR_EXPRESSION'
,p_message_language=>'sl'
,p_message_text=>'Izraz'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142531422489752413)
,p_name=>'APEXIR_FILTER'
,p_message_language=>'sl'
,p_message_text=>'Filter'
,p_is_js_message=>true
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142542539323752416)
,p_name=>'APEXIR_FILTERS'
,p_message_language=>'sl'
,p_message_text=>'Filtri'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142553275330752419)
,p_name=>'APEXIR_FILTER_EXPRESSION'
,p_message_language=>'sl'
,p_message_text=>'Izraz filtra'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142651414767752449)
,p_name=>'APEXIR_FILTER_EXPR_TOO_LONG'
,p_message_language=>'sl'
,p_message_text=>'Izraz filtra je predolg.'
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142496109425752402)
,p_name=>'APEXIR_FILTER_SUGGESTIONS'
,p_message_language=>'sl'
,p_message_text=>'Filtriraj predloge'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142553142160752419)
,p_name=>'APEXIR_FILTER_TYPE'
,p_message_language=>'sl'
,p_message_text=>'Tip filtra'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142549158143752418)
,p_name=>'APEXIR_FINDER_ALT'
,p_message_language=>'sl'
,p_message_text=>'Izbira stolpcev za iskanje'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142531741664752413)
,p_name=>'APEXIR_FLASHBACK'
,p_message_language=>'sl'
,p_message_text=>'Pogled nazaj'
,p_is_js_message=>true
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142546395048752417)
,p_name=>'APEXIR_FLASHBACK_DESCRIPTION'
,p_message_language=>'sl'
,p_message_text=>unistr('Poizvedba pogleda nazaj vam omogo\010Da ogled podatkov, kot so obstajali na predhodni to\010Dki v \010Dasu.')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142600328535752433)
,p_name=>'APEXIR_FLASHBACK_LABEL'
,p_message_language=>'sl'
,p_message_text=>'Trajanje pogleda nazaj'
,p_version_scn=>2705544
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142601739333752434)
,p_name=>'APEXIR_FORMAT'
,p_message_language=>'sl'
,p_message_text=>'Format'
,p_is_js_message=>true
,p_version_scn=>2705544
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142527512767752411)
,p_name=>'APEXIR_FORMAT_MASK'
,p_message_language=>'sl'
,p_message_text=>'Maska formata %0'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142539284141752415)
,p_name=>'APEXIR_FUNCTION'
,p_message_language=>'sl'
,p_message_text=>'Funkcija'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142547017124752417)
,p_name=>'APEXIR_FUNCTIONS'
,p_message_language=>'sl'
,p_message_text=>'Funkcije %0'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142624771894752441)
,p_name=>'APEXIR_FUNCTIONS_OPERATORS'
,p_message_language=>'sl'
,p_message_text=>'Funkcije/operatorji'
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142538989467752415)
,p_name=>'APEXIR_FUNCTION_N'
,p_message_language=>'sl'
,p_message_text=>'Funkcija %0'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142531207798752413)
,p_name=>'APEXIR_GO'
,p_message_language=>'sl'
,p_message_text=>'Pojdi'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142504855123752405)
,p_name=>'APEXIR_GREEN'
,p_message_language=>'sl'
,p_message_text=>'zelena'
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142549811837752418)
,p_name=>'APEXIR_GROUPBY_COLUMNS'
,p_message_language=>'sl'
,p_message_text=>unistr('Zdru\017Eevanje po stolpcih')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142549944104752418)
,p_name=>'APEXIR_GROUPBY_FUNCTIONS'
,p_message_language=>'sl'
,p_message_text=>unistr('Zdru\017Eevanje po funkcijah')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142485113381752399)
,p_name=>'APEXIR_GROUP_BY'
,p_message_language=>'sl'
,p_message_text=>'Grupiranje'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142625895397752441)
,p_name=>'APEXIR_GROUP_BY_COLUMN'
,p_message_language=>'sl'
,p_message_text=>'Stolpec Grupiranje %0'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142581332384752427)
,p_name=>'APEXIR_GROUP_BY_COL_NOT_NULL'
,p_message_language=>'sl'
,p_message_text=>unistr('Dolo\010Diti je treba stolpec Grupiranje.')
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142592409674752431)
,p_name=>'APEXIR_GROUP_BY_MAX_ROW_CNT'
,p_message_language=>'sl'
,p_message_text=>unistr('Maksimalno \0161tevilo vrstic za poizvedbo Grupiranje omeji \0161tevilo vrstic v osnovni poizvedbi in ne \0161tevila prikazanih vrstic. Va\0161a osnovna poizvedba presega maksimalno \0161tevilo vrstic %0. Uporabite filter, da zmanj\0161ate \0161tevilo zapisov v osnovni poizvedb')
||'i.'
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142572620672752425)
,p_name=>'APEXIR_GROUP_BY_SORT'
,p_message_language=>'sl'
,p_message_text=>unistr('Razvr\0161\010Danje grupiranja')
,p_is_js_message=>true
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142629396701752442)
,p_name=>'APEXIR_GROUP_BY_SORT_ORDER'
,p_message_language=>'sl'
,p_message_text=>unistr('Vrstni red razvr\0161\010Danja grupiranja')
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142474223258752396)
,p_name=>'APEXIR_GROUP_BY_VIEW_OF'
,p_message_language=>'sl'
,p_message_text=>'Pogled grupiranja za %0'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142510291170752406)
,p_name=>'APEXIR_HCOLUMN'
,p_message_language=>'sl'
,p_message_text=>'Vodoravni stolpec'
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142544229111752416)
,p_name=>'APEXIR_HELP'
,p_message_language=>'sl'
,p_message_text=>unistr('Pomo\010D')
,p_is_js_message=>true
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142536053225752414)
,p_name=>'APEXIR_HELP_01'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Interaktivna poro\010Dila kon\010Dnim uporabnikom omogo\010Dajo prilagajanje poro\010Dil. Uporabniki lahko spremenijo postavitev podatkov poro\010Dila z izbiranjem stolpcev, uporabo filtrov, ozna\010Devanjem in razvr\0161\010Danjem. Uporabniki lahko tudi dolo\010Dijo prelome, zdru\017Eevan')
||unistr('ja, grafikone, grupiranja in dodajajo lastne izra\010Dune. Uporabniki lahko tudi nastavijo naro\010Dnino tako, da jim bo verzija HTML poro\010Dila poslana po e-po\0161ti v skladu z dolo\010Denim intervalom. Uporabniki lahko ustvarijo ve\010D variacij poro\010Dila in jih shranij')
||unistr('o kot imenovana poro\010Dila, bodisi za javni bodisi zasebni ogled. '),
'<p/>',
unistr('Naslednji razdelki povzemajo na\010Dine, kako lahko prilagodite interaktivno poro\010Dilo. Za ve\010D informacij si oglejte "Uporaba interaktivnih poro\010Dil" v <i>Uporabni\0161kem priro\010Dniku za kon\010Dnega uporabnika Oracle APEX</i>.')))
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142543174392752416)
,p_name=>'APEXIR_HELP_ACTIONS_MENU'
,p_message_language=>'sl'
,p_message_text=>unistr('Meni Dejanja se prika\017Ee na desni strani gumba Pojdi v vrstici za iskanje. V tem meniju lahko prilagodite interaktivno poro\010Dilo.')
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142536837250752414)
,p_name=>'APEXIR_HELP_AGGREGATE'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Zdru\017Eevanja so matemati\010Dni izra\010Duni, ki se izvedejo za stolpec. Zdru\017Eevanja so prikazana po vsakem kontrolnem prelomu in ob koncu poro\010Dila v stolpcu, v katerem so dolo\010Dena. Mo\017Enosti vklju\010Dujejo:'),
'<p>',
'</p><ul>',
unistr('<li><strong>Zdru\017Eevanje</strong> vam omogo\010Da, da izberete predhodno'),
unistr('dolo\010Deno zdru\017Eevanje za urejanje.</li>'),
'<li><strong>Funkcija</strong> je funkcija, ki se izvede (na primer SUM, MIN).</li>',
unistr('<li><strong>Stolpec</strong> se uporablja za izbiro stolpca, za katerega se uporabi matemati\010Dna funkcija. Prikazani so'),
unistr('samo \0161tevilski stolpci.</li>'),
'</ul>'))
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142536927954752414)
,p_name=>'APEXIR_HELP_CHART'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Dolo\010Dite lahko en grafikon na shranjeno poro\010Dilo. Ko'),
unistr('je dolo\010Den, lahko preklapljate med pogledom grafikona in poro\010Dila z uporabo ikon v vrstici za iskanje.'),
unistr('Mo\017Enosti vklju\010Dujejo:  '),
'<p>',
'</p><ul>',
unistr('<li><strong>Tip grafikona</strong> identificira tip grafikona, ki bo vklju\010Den.'),
unistr('Izberite horizontalni pali\010Dni, vertikalni pali\010Dni, tortni ali \010Drtni.</li>'),
unistr('<li><strong>Oznaka</strong> vam omogo\010Da, da izberete stolpec, ki bo uporabljen kot oznaka.</li>'),
'<li><strong>Naslov osi za oznako</strong> je naslov, ki je prikazan na osi, povezani s stolpcem, izbranim za',
'oznako. To ni na voljo za tortni grafikon.</li>',
unistr('<li><strong>Vrednost</strong> vam omogo\010Da, da izberete stolpec, ki bo uporabljen kot vrednost.  \010Ce je va\0161a funkcija'),
'COUNT, vrednosti ni treba izbrati.</li>',
'<li><strong>Naslov osi za vrednost</strong> je naslov, ki je prikazan na osi, povezani s stolpcem, izbranim za',
'vrednost. To ni na voljo za tortni grafikon.</li>',
'<li><strong>Funkcija</strong> je izbirna funkcija, ki jo je treba izvesti za stolpec, izbran za vrednost.</li>',
unistr('<li><strong>Razvr\0161\010Danje</strong> vam omogo\010Da, da razvrstite svoj nabor rezultatov.</li></ul>')))
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142536214143752414)
,p_name=>'APEXIR_HELP_COLUMN_HEADING_MENU'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\010Ce kliknete katerikoli naslov stolpca, se prika\017Ee meni naslova stolpca. Mo\017Enosti vklju\010Dujejo:'),
'<p></p>',
'<ul>',
unistr('<li>Ikona <strong>Razvrsti nara\0161\010Dajo\010De</strong> razvrsti poro\010Dilo po stolpcu v nara\0161\010Dajo\010Dem vrstnem redu.</li>'),
unistr('<li>Ikona <strong>Razvrsti padajo\010De</strong> razvrsti poro\010Dilo po stolpcu v padajo\010Dem vrstnem redu.</li>'),
unistr('<li><strong>Skrij stolpec</strong> skrije stolpec. Vseh stolpcev ni mogo\010De skriti. \010Ce stolpca ni mogo\010De skriti, ikona Skrij stolpec ne bo prikazana.</li>'),
unistr('<li><strong>Prelomi stolpec</strong> ustvari skupino za prelom v stolpcu. To stolpec povle\010De iz poro\010Dila kot glavni zapis.</li>'),
unistr('<li><strong>Informacije o stolpcu</strong> prikazuje besedilo pomo\010Di o stolpcu, \010De je na voljo.</li>'),
unistr('<li><strong>Obmo\010Dje besedila</strong> se uporablja za vnos iskalnih kriterijev brez razlikovanja velikih in malih \010Drk'),
unistr('(brez potrebe po nadomestnih znakih). Z vnosom vrednosti se zmanj\0161a seznam'),
'vrednosti na dnu menija. Nato lahko izberete vrednost z',
'dna in izbrana vrednost bo ustvarjena kot filter, ki uporablja "="',
'(na primer <code>column = ''ABC''</code>). Lahko pa tudi kliknete ikono svetilke in vnesete vrednost, ki bo ustvarjena kot filter z modifikatorjem "LIKE"',
'(na primer <code>column LIKE ''%ABC%''</code>).</li>',
unistr('<li><strong>Seznam enoli\010Dnih vrednosti</strong> vsebuje prvih 500 enoli\010Dnih'),
unistr('vrednosti, ki izpolnjujejo va\0161e kriterije filtriranja. \010Ce je stolpec datum, je namesto tega prikazan'),
unistr('seznam datumskih razponov. \010Ce izberete vrednost, bo filter ustvarjen'),
'z "=" (na primer <code>column = ''ABC''</code>).</li>',
'</ul>'))
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142536778187752414)
,p_name=>'APEXIR_HELP_COMPUTE'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Omogo\010Da vam dodajanje izra\010Dunanih stolpcev v poro\010Dilo. Lahko so matemati\010Dni izra\010Duni (na primer <code>NBR_HOURS/24</code>) ali standardne Oraclove'),
unistr('funkcije, uporabljene na obstoje\010Dih stolpcih. Nekateri so prikazani kot primeri, mogo\010De pa je uporabiti tudi druge (kot je <code>TO_DATE)</code>). Mo\017Enosti vklju\010Dujejo:'),
'<p></p>',
'<ul>',
unistr('<li><strong>Izra\010Dun</strong> vam omogo\010Da izbiro predhodno dolo\010Denega izra\010Duna za urejanje.</li>'),
'<li><strong>Naslov stolpca</strong> je naslov stolpca za novi stolpec.</li>',
'<li><strong>Maska formata</strong> je Oraclova maska formata, ki se uporabi za stolpec (na primer S9999).</li>',
unistr('<li><strong>Izra\010Dun</strong> je izra\010Dun, ki se izvede. V izra\010Dune se vklju\010Dijo sklici na stolpce s prikazanimi drugimi imeni.</li>'),
'</ul>',
unistr('<p>Pod izra\010Dunom se stolpci v va\0161i poizvedbi prika\017Eejo s'),
unistr('svojimi povezanimi drugimi imeni. \010Ce kliknete ime ali drugo ime stolpca, bo ta vklju\010Den'),
unistr('v izra\010Dun. Ob stolpcu je \0161tevilska tipkovnica. Ta tipkovnica deluje kot'),
unistr('bli\017Enjica do pogosto uporabljanih klju\010Dev. Na skrajni desni so funkcije.</p>'),
unistr('<p>Naslednji primer izra\010Duna prikazuje, kako prikazati skupno nadomestilo:</p>'),
'<pre>CASE WHEN A = ''SALES'' THEN B + C ELSE B END</pre>',
'(A je ORGANIZATION, B je SALARY in C je COMMISSION)',
''))
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142543241832752416)
,p_name=>'APEXIR_HELP_CONTROL_BREAK'
,p_message_language=>'sl'
,p_message_text=>unistr('Uporablja se za ustvarjanje prelomne skupine v enem ali ve\010D stolpcih. Na ta na\010Din se stolpci izvle\010Dejo iz interaktivnega poro\010Dila in prika\017Eejo kot glavni zapis.')
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142537417153752414)
,p_name=>'APEXIR_HELP_DETAIL_VIEW'
,p_message_language=>'sl'
,p_message_text=>unistr('Za ogled podrobnosti ene vrstice naenkrat kliknite ikono za ogled ene vrstice za vrstico, ki si jo \017Eelite ogledati. \010Ce je na voljo, bo pogled ene vrstice vedno prvi stolpec. Odvisno od prilagoditve interaktivnega poro\010Dila je lahko pogled ene vrstice ')
||unistr('standardni pogled ali prilagojena stran, ki lahko omogo\010Da posodobitev.')
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142537342794752414)
,p_name=>'APEXIR_HELP_DOWNLOAD'
,p_message_language=>'sl'
,p_message_text=>unistr('Omogo\010Da prenos trenutnega nabora rezultatov. Formati za prenos vklju\010Dujejo PDF, Excel, HTML in CSV. Mo\017Enosti prenosa se razlikujejo glede na izbrani format. Vse formate je mogo\010De poslati tudi kot e-po\0161to.')
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142536408894752414)
,p_name=>'APEXIR_HELP_FILTER'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Osredoto\010Di poro\010Dilo tako, da doda ali spremeni stavek <code>WHERE</code> v poizvedbi. Filtrirate lahko v stolpcu ali po vrstici.  '),
unistr('<p>\010Ce filtrirate po stolpcu, izberite stolpec (ni treba, da je eden od prikazanih), izberite standardni Oraclov operator (=, !=, not in, between) in vnesite izraz za primerjavo. Izrazi razlikujejo med velikimi in malimi \010Drkami. Uporabite % kot nadome')
||'stni znak (na primer <code>STATE_NAME',
'like A%)</code>.</p>',
unistr('<p>\010Ce filtrirate po vrsticah, lahko ustvarite zapletene stavke <code>WHERE</code> z'),
unistr('drugimi imeni stolpcev in vsemi Oraclovimi funkcijami ali operatorji (na primer <code>G = ''VA'' or G = ''CT''</code>, pri \010Demer'),
'je <code>G</code> drugo ime za <code>CUSTOMER_STATE</code>).</p>',
''))
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142537045183752414)
,p_name=>'APEXIR_HELP_FLASHBACK'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Poizvedba pogleda nazaj vam omogo\010Da, da si ogledate podatke, kot so obstajali na predhodni to\010Dki'),
unistr('v \010Dasu. Privzeta koli\010Dina \010Dasa za pogled nazaj je 3 ure (ali 180'),
unistr('minut), vendar dejanska koli\010Dina se razlikuje za vsako bazo podatkov.')))
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142601667503752434)
,p_name=>'APEXIR_HELP_FORMAT'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Format vam omogo\010Da prilagoditev prikaza poro\010Dila.'),
'Format vsebuje naslednji podmeni:</p>',
unistr('<ul><li>Razvr\0161\010Danje</li>'),
'<li>Kontrolni prelom</li>',
unistr('<li>Ozna\010Dba</li>'),
unistr('<li>Izra\010Dun</li>'),
unistr('<li>Zdru\017Eevanje</li>'),
'<li>Grafikon</li>',
'<li>Grupiranje</li>',
'<li>Vrtenje</li>',
'</ul>',
''))
,p_version_scn=>2705544
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142599808890752433)
,p_name=>'APEXIR_HELP_GROUP_BY'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Dolo\010Dite lahko en pogled grupiranja na shranjeno poro\010Dilo. Ko je dolo\010Den, lahko preklapljate med pogledom grupiranja in pogledom poro\010Dila z ikonami pogleda v vrstici za iskanje. \010Ce \017Eelite ustvariti pogled grupiranja, izberite: '),
'<p></p><ul>',
'<li>stolpce za grupiranje</li>',
unistr('<li>stolpce za zdru\017Eevanje s funkcijo, ki bo izvedena (povpre\010Dje, vsota, \0161tevilo, itd.)</li>'),
'</ul>'))
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142536665329752414)
,p_name=>'APEXIR_HELP_HIGHLIGHT'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Omogo\010Da vam dolo\010Ditev filtra. Vrstice, ki se ujemajo s kriteriji filtriranja, se prika\017Eejo kot ozna\010Dene z zna\010Dilnostmi, povezanimi s filtrom. Mo\017Enosti vklju\010Dujejo:</p>'),
'<ul>',
'<li><strong>Ime</strong> se uporablja samo za prikaz.</li>',
'<li><strong>Zaporedje</strong> identificira zaporedje, po katerem se ocenjujejo pravila.</li>',
unistr('<li><strong>Omogo\010Deno</strong> identificira, ali je pravilo omogo\010Deno ali onemogo\010Deno.</li>'),
unistr('<li><strong>Tip ozna\010Dbe</strong> identificira, ali je treba vrstico ali celico'),
unistr('ozna\010Diti. \010Ce izberete celico, se ozna\010Di stolpec, naveden'),
unistr('v pogoju ozna\010Dbe.</li>'),
unistr('<li><strong>Barva ozadja</strong> je nova barva za ozadje ozna\010Denega obmo\010Dja.</li>'),
unistr('<li><strong>Barva besedila</strong> je nova barva za besedilo v ozna\010Denem obmo\010Dju.</li>'),
unistr('<li><strong>Pogoj ozna\010Dbe</strong> dolo\010Da va\0161 pogoj filtriranja.</li>'),
'</ul>',
''))
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142430067092752382)
,p_name=>'APEXIR_HELP_PIVOT'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Dolo\010Dite lahko en vrtilni pogled na shranjeno poro\010Dilo. Ko je dolo\010Den, lahko preklapljate med vrtilnim pogledom in pogledom poro\010Dila z ikonami pogleda v vrstici za iskanje. \010Ce \017Eelite ustvariti vrtilni pogled, izberite: '),
'<p></p>',
'<ul>',
'<li>stolpce za vrtenje</li>',
'<li>stolpce za prikaz v obliki vrstic</li>',
unistr('<li>stolpce za zdru\017Eevanje in funkcijo, ki bo izvedena (povpre\010Dje, vsota, \0161tevilo, itd.)</li>'),
'</ul>'))
,p_version_scn=>2705512
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142547758995752417)
,p_name=>'APEXIR_HELP_REPORT_SETTINGS'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Pri prilagajanju interaktivnega poro\010Dila so nastavitve poro\010Dila prikazane'),
unistr('pod vrstico za iskanje in nad poro\010Dilom. To obmo\010Dje lahko strnete in raz\0161irite z ikono na levi.'),
'<p>',
unistr('Za vsako nastavitev poro\010Dila lahko uporabite naslednje mo\017Enosti:'),
'</p><ul>',
'<li>Uredite nastavitev tako, da kliknete ime.</li>',
unistr('<li>Onemogo\010Dite/omogo\010Dite nastavitev tako, da ozna\010Dite/po\010Distite potrditveno polje Omogo\010Di/Onemogo\010Di. S tem kontrolnim elementom lahko za\010Dasno izklopite in vklopite nastavitev.</li>'),
'<li>Odstranite nastavitev tako, da kliknete ikono Odstrani.</li>',
'</ul>',
unistr('<p>\010Ce ste ustvarili grafikon, grupiranje ali vrtenje, lahko preklapljate med njimi '),
unistr('in osnovnim poro\010Dilom z uporabo povezav Pogled poro\010Dila, Pogled grafikona, Pogled grupiranja in Vrtilni pogled,'),
'prikazanimi na desni. Pri ogledu grafikona, grupiranja ali vrtenja lahko',
'uporabite tudi povezavo Uredi in uredite nastavitve.</p>',
''))
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142537243849752414)
,p_name=>'APEXIR_HELP_RESET'
,p_message_language=>'sl'
,p_message_text=>unistr('Ponastavi poro\010Dilo nazaj na privzete nastavitve, pri \010Demer se odstranijo vse izvedene prilagoditve.')
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142601971790752434)
,p_name=>'APEXIR_HELP_ROWS_PER_PAGE'
,p_message_language=>'sl'
,p_message_text=>unistr('Nastavi \0161tevilo zapisov za prikaz na stran.')
,p_version_scn=>2705544
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142537161849752414)
,p_name=>'APEXIR_HELP_SAVE_REPORT'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Shrani prilagojeno poro\010Dilo za prihodnjo uporabo. Navedete ime in izbirni opis ter zagotovite, da je poro\010Dilo dostopno javnosti (tj. vsem uporabnikom, ki lahko dostopajo do primarnega privzetega poro\010Dila). Shranite lahko \0161tiri tipe interaktivnih p')
||unistr('oro\010Dil:</p>'),
'<ul>',
unistr('<li><strong>Primarno privzeto</strong> (samo za razvijalce). Primarno privzeto je poro\010Dilo, ki se prika\017Ee na za\010Detku. Primarnih privzetih poro\010Dil ni mogo\010De preimenovati ali izbrisati.</li>'),
unistr('<li><strong>Nadomestno poro\010Dilo</strong> (samo za razvijalce). Razvijalcem omogo\010Da ustvarjanje ve\010D postavitev poro\010Dil. Samo razvijalci lahko shranijo, preimenujejo ali izbri\0161ejo nadomestno poro\010Dilo.</li>'),
unistr('<li><strong>Javno poro\010Dilo</strong> (kon\010Dni uporabnik). Shrani, preimenuje ali izbri\0161e ga lahko kon\010Dni uporabnik, ki ga je ustvaril. Drugi uporabniki si lahko ogledajo in shranijo postavitev kot drugo poro\010Dilo.</li>'),
unistr('<li><strong>Zasebno poro\010Dilo</strong> (kon\010Dni uporabnik). Samo kon\010Dni uporabnik, ki je ustvaril poro\010Dilo, si lahko ogleda, shrani, preimenuje ali izbri\0161e poro\010Dilo.</li>'),
'</ul>',
unistr('<p>\010Ce shranite prilagojena poro\010Dila, se prika\017Ee izbirnik poro\010Dil v vrstici za iskanje na levi strani izbirnika vrstic (\010De je ta funkcija omogo\010Dena).</p>'),
''))
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142536104371752414)
,p_name=>'APEXIR_HELP_SEARCH_BAR'
,p_message_language=>'sl'
,p_message_text=>unistr('Na vrhu vsake strani poro\010Dila je podro\010Dje za iskanje. To podro\010Dje (ali vrstica za iskanje) zagotavlja naslednje funkcije:')
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142602578844752434)
,p_name=>'APEXIR_HELP_SEARCH_BAR_ACTIONS_MENU'
,p_message_language=>'sl'
,p_message_text=>unistr('<li><strong>Meni Dejanja</strong> omogo\010Da prilagoditev poro\010Dila. Oglejte si odseke, ki sledijo.</li>')
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142602068079752434)
,p_name=>'APEXIR_HELP_SEARCH_BAR_FINDER'
,p_message_language=>'sl'
,p_message_text=>unistr('<li><strong>Ikona za izbiro stolpcev</strong> vam omogo\010Da identifikacijo stolpca za iskanje (ali vseh).</li>')
,p_version_scn=>2705544
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142602381523752434)
,p_name=>'APEXIR_HELP_SEARCH_BAR_REPORTS'
,p_message_language=>'sl'
,p_message_text=>unistr('<li><strong>Poro\010Dila</strong> prika\017Ee nadomestna privzeta in shranjena zasebna ali javna poro\010Dila.</li>')
,p_version_scn=>2705544
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142602277046752434)
,p_name=>'APEXIR_HELP_SEARCH_BAR_ROWS'
,p_message_language=>'sl'
,p_message_text=>unistr('<li><strong>Vrstice</strong> nastavi \0161tevilo zapisov za prikaz na stran.</li>')
,p_version_scn=>2705544
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142602119158752434)
,p_name=>'APEXIR_HELP_SEARCH_BAR_TEXTBOX'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<li><strong>Besedilno obmo\010Dje</strong> vam omogo\010Da vnos kriterijev iskanja brez razlikovanja med velikimi in malimi \010Drkami (nadomestni znaki so nakazani).</li>'),
unistr('<li><strong>Gumb Pojdi</strong> izvede iskanje. Ko je kazalec v besedilnem obmo\010Dju za iskanje, lahko iskanje izvedete tudi s pritiskom tipke Enter.</li>')))
,p_version_scn=>2705544
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142602433079752434)
,p_name=>'APEXIR_HELP_SEARCH_BAR_VIEW'
,p_message_language=>'sl'
,p_message_text=>unistr('<li><strong>Ogled ikon</strong> omogo\010Da preklop med pogledi ikon, poro\010Dil, podrobnosti, grafikonov, grupiranj in vrtenji poro\010Dila, \010De so dolo\010Deni.</li>')
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142536353164752414)
,p_name=>'APEXIR_HELP_SELECT_COLUMNS'
,p_message_language=>'sl'
,p_message_text=>unistr('Uporablja se za spreminjanje prikazanih stolpcev. Stolpci na desni so prikazani. Stolpci na levi so skriti. Prikazane stolpce lahko ponovno razvrstite s pu\0161\010Dicami na skrajni desni. Izra\010Dunani stolpci imajo predpono <strong>**</strong>.')
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142536572918752414)
,p_name=>'APEXIR_HELP_SORT'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Uporablja se za spreminjanje stolpcev, v katerih poteka razvr\0161\010Danje, in dolo\010Da, ali'),
unistr('razvr\0161\010Dati v nara\0161\010Dajo\010Dem ali padajo\010Dem vrstnem redu. Lahko tudi dolo\010Dite, kako ravnati z vrednostmi'),
unistr('<code>NULL</code>. Privzeta nastavitev vedno prika\017Ee vrednosti <code>NULL</code> nazadnje ali pa jih vedno prika\017Ee najprej. Tako nastala razporeditev se prika\017Ee desno od'),
unistr('naslovov stolpcev v poro\010Dilu.</p>')))
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142599613844752433)
,p_name=>'APEXIR_HELP_SUBSCRIPTION'
,p_message_language=>'sl'
,p_message_text=>unistr('Pri dodajanju naro\010Dnine navedete e-po\0161tni naslov (ali ve\010D e-po\0161tnih naslovov, lo\010Denih z vejicami), zadevo e-po\0161tnega sporo\010Dila, pogostost ter datuma za\010Detka in konca. E-po\0161tna sporo\010Dila posledi\010Dno vklju\010Dujejo izvo\017Eeno verzijo (PDF, Excel, HTML ali CS')
||unistr('V) interaktivnega poro\010Dila s trenutnimi podatki z uporabo nastavitev poro\010Dila, ki so se uporabljale v \010Dasu dodajanja naro\010Dnine.')
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142541287197752415)
,p_name=>'APEXIR_HIDE_COLUMN'
,p_message_language=>'sl'
,p_message_text=>'Skrij stolpec'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142531621904752413)
,p_name=>'APEXIR_HIGHLIGHT'
,p_message_language=>'sl'
,p_message_text=>unistr('Ozna\010Dba')
,p_is_js_message=>true
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142542775513752416)
,p_name=>'APEXIR_HIGHLIGHTS'
,p_message_language=>'sl'
,p_message_text=>unistr('Ozna\010Dbe')
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142512924073752407)
,p_name=>'APEXIR_HIGHLIGHT_CELL_WITH_COLORS'
,p_message_language=>'sl'
,p_message_text=>unistr('Ozna\010Denje celice, %0 na %1')
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142547842405752417)
,p_name=>'APEXIR_HIGHLIGHT_CONDITION'
,p_message_language=>'sl'
,p_message_text=>unistr('Pogoj ozna\010Dbe')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142512833742752407)
,p_name=>'APEXIR_HIGHLIGHT_ROW_WITH_COLORS'
,p_message_language=>'sl'
,p_message_text=>unistr('Ozna\010Denje vrstice, %0 na %1')
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142600249649752433)
,p_name=>'APEXIR_HIGHLIGHT_STYLE'
,p_message_language=>'sl'
,p_message_text=>unistr('Slog ozna\010Dbe')
,p_version_scn=>2705544
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142504461442752405)
,p_name=>'APEXIR_HIGHLIGHT_TYPE'
,p_message_language=>'sl'
,p_message_text=>unistr('Tip ozna\010Dbe')
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142619001753752439)
,p_name=>'APEXIR_HORIZONTAL'
,p_message_language=>'sl'
,p_message_text=>'Vodoravno'
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142648045845752448)
,p_name=>'APEXIR_INACTIVE_SETTING'
,p_message_language=>'sl'
,p_message_text=>'1 neaktivna nastavitev'
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142648113294752448)
,p_name=>'APEXIR_INACTIVE_SETTINGS'
,p_message_language=>'sl'
,p_message_text=>'Neaktivne nastavitve: %0'
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142537835746752414)
,p_name=>'APEXIR_INTERACTIVE_REPORT_HELP'
,p_message_language=>'sl'
,p_message_text=>unistr('Interaktivno poro\010Dilo - Pomo\010D')
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142548870050752418)
,p_name=>'APEXIR_INVALID'
,p_message_language=>'sl'
,p_message_text=>'Neveljavno'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142542295056752416)
,p_name=>'APEXIR_INVALID_COMPUTATION'
,p_message_language=>'sl'
,p_message_text=>unistr('Neveljaven izraz izra\010Duna. %0')
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142497833990752403)
,p_name=>'APEXIR_INVALID_END_DATE'
,p_message_language=>'sl'
,p_message_text=>unistr('Datum konca mora biti poznej\0161i od datuma za\010Detka.')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142557096336752420)
,p_name=>'APEXIR_INVALID_FILTER'
,p_message_language=>'sl'
,p_message_text=>'Neveljaven izraz filtra. %0'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142626826116752441)
,p_name=>'APEXIR_INVALID_FILTER_QUERY'
,p_message_language=>'sl'
,p_message_text=>'Neveljavna poizvedba filtra'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142648244862752448)
,p_name=>'APEXIR_INVALID_SETTING'
,p_message_language=>'sl'
,p_message_text=>'1 neveljavna nastavitev'
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142648369522752448)
,p_name=>'APEXIR_INVALID_SETTINGS'
,p_message_language=>'sl'
,p_message_text=>'Neveljavne nastavitve: %0'
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142600446733752433)
,p_name=>'APEXIR_IN_MINUTES'
,p_message_language=>'sl'
,p_message_text=>'(v minutah)'
,p_version_scn=>2705544
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142617467401752438)
,p_name=>'APEXIR_IS_IN_THE_LAST'
,p_message_language=>'sl'
,p_message_text=>'%0 je v zadnjih %1'
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142617637883752438)
,p_name=>'APEXIR_IS_IN_THE_NEXT'
,p_message_language=>'sl'
,p_message_text=>'%0 je v naslednjih %1'
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142617559795752438)
,p_name=>'APEXIR_IS_NOT_IN_THE_LAST'
,p_message_language=>'sl'
,p_message_text=>'%0 ni v zadnjih %1'
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142617745344752438)
,p_name=>'APEXIR_IS_NOT_IN_THE_NEXT'
,p_message_language=>'sl'
,p_message_text=>'%0 ni v naslednjih %1'
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142546958775752417)
,p_name=>'APEXIR_KEYPAD'
,p_message_language=>'sl'
,p_message_text=>unistr('\0160tevilska tipkovnica')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142510671694752406)
,p_name=>'APEXIR_LABEL'
,p_message_language=>'sl'
,p_message_text=>'Oznaka %0'
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142540819153752415)
,p_name=>'APEXIR_LABEL_AXIS_TITLE'
,p_message_language=>'sl'
,p_message_text=>'Naslov osi za oznako'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142533139929752413)
,p_name=>'APEXIR_LAST_DAY'
,p_message_language=>'sl'
,p_message_text=>'Zadnji dan'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142533327627752413)
,p_name=>'APEXIR_LAST_HOUR'
,p_message_language=>'sl'
,p_message_text=>'Zadnja ura'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142532889409752413)
,p_name=>'APEXIR_LAST_MONTH'
,p_message_language=>'sl'
,p_message_text=>'Zadnji mesec'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142532928991752413)
,p_name=>'APEXIR_LAST_WEEK'
,p_message_language=>'sl'
,p_message_text=>'Zadnji teden'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142533068908752413)
,p_name=>'APEXIR_LAST_X_DAYS'
,p_message_language=>'sl'
,p_message_text=>'Zadnjih toliko dni: %0'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142533232554752413)
,p_name=>'APEXIR_LAST_X_HOURS'
,p_message_language=>'sl'
,p_message_text=>'Zadnjih toliko ur: %0'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142532650602752413)
,p_name=>'APEXIR_LAST_X_YEARS'
,p_message_language=>'sl'
,p_message_text=>'Zadnjih toliko let: %0'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142532727880752413)
,p_name=>'APEXIR_LAST_YEAR'
,p_message_language=>'sl'
,p_message_text=>'Zadnje leto'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142510595415752406)
,p_name=>'APEXIR_LINE'
,p_message_language=>'sl'
,p_message_text=>'Vrstica'
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142507393272752405)
,p_name=>'APEXIR_LINE_WITH_AREA'
,p_message_language=>'sl'
,p_message_text=>unistr('Vrstica z obmo\010Djem')
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142626719377752441)
,p_name=>'APEXIR_MAP_IT'
,p_message_language=>'sl'
,p_message_text=>unistr('Pove\017Ei')
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142541743165752416)
,p_name=>'APEXIR_MAX_QUERY_COST'
,p_message_language=>'sl'
,p_message_text=>unistr('Poizvedba predvidoma presega maksimalno \0161tevilo dovoljenih virov. Spremenite svoje nastavitve poro\010Dila in poskusite znova.')
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142523117374752410)
,p_name=>'APEXIR_MAX_ROW_CNT'
,p_message_language=>'sl'
,p_message_text=>unistr('Maksimalno \0161tevilo vrstic za to poro\010Dilo je %0. Uporabite filter za zmanj\0161anje \0161tevila zapisov v svoji poizvedbi.')
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142627311218752441)
,p_name=>'APEXIR_MAX_X'
,p_message_language=>'sl'
,p_message_text=>'Maksimalno %0'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142627560929752441)
,p_name=>'APEXIR_MEDIAN_X'
,p_message_language=>'sl'
,p_message_text=>'Mediana %0'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142469826718752394)
,p_name=>'APEXIR_MESSAGE'
,p_message_language=>'sl'
,p_message_text=>unistr('Sporo\010Dilo')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142527476334752411)
,p_name=>'APEXIR_MIN_AGO'
,p_message_language=>'sl'
,p_message_text=>'Pred toliko minutami: %0'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142627432728752441)
,p_name=>'APEXIR_MIN_X'
,p_message_language=>'sl'
,p_message_text=>'Minimalno %0'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142626448270752441)
,p_name=>'APEXIR_MONTH'
,p_message_language=>'sl'
,p_message_text=>'Mesec'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142600835631752433)
,p_name=>'APEXIR_MONTHLY'
,p_message_language=>'sl'
,p_message_text=>unistr('Mese\010Dno')
,p_version_scn=>2705544
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142540074547752415)
,p_name=>'APEXIR_MOVE'
,p_message_language=>'sl'
,p_message_text=>'Premik'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142539975178752415)
,p_name=>'APEXIR_MOVE_ALL'
,p_message_language=>'sl'
,p_message_text=>'Premakni vse'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142653130830752449)
,p_name=>'APEXIR_MULTIIR_PAGE_REGION_STATIC_ID_REQUIRED'
,p_message_language=>'sl'
,p_message_text=>unistr('Naveden mora biti stati\010Dni ID podro\010Dja, saj stran vsebuje ve\010D interaktivnih poro\010Dil.')
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142506097060752405)
,p_name=>'APEXIR_NAME'
,p_message_language=>'sl'
,p_message_text=>'Ime'
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142535728781752414)
,p_name=>'APEXIR_NEW_AGGREGATION'
,p_message_language=>'sl'
,p_message_text=>unistr('Novo zdru\017Eevanje')
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142648922042752448)
,p_name=>'APEXIR_NEW_CATEGORY_LABEL'
,p_message_language=>'sl'
,p_message_text=>'Nova kategorija'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142535886537752414)
,p_name=>'APEXIR_NEW_COMPUTATION'
,p_message_language=>'sl'
,p_message_text=>unistr('Nov izra\010Dun')
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142530595009752412)
,p_name=>'APEXIR_NEXT'
,p_message_language=>'sl'
,p_message_text=>'Naprej'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142533667088752413)
,p_name=>'APEXIR_NEXT_DAY'
,p_message_language=>'sl'
,p_message_text=>'Naslednji dan'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142533470924752413)
,p_name=>'APEXIR_NEXT_HOUR'
,p_message_language=>'sl'
,p_message_text=>'Naslednja ura'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142533973664752413)
,p_name=>'APEXIR_NEXT_MONTH'
,p_message_language=>'sl'
,p_message_text=>'Naslednji mesec'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142533805713752413)
,p_name=>'APEXIR_NEXT_WEEK'
,p_message_language=>'sl'
,p_message_text=>'Naslednji teden'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142533776516752413)
,p_name=>'APEXIR_NEXT_X_DAYS'
,p_message_language=>'sl'
,p_message_text=>'Naslednjih toliko dni: %0'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142533576925752413)
,p_name=>'APEXIR_NEXT_X_HOURS'
,p_message_language=>'sl'
,p_message_text=>'Naslednjih toliko ur: %0'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142534128812752413)
,p_name=>'APEXIR_NEXT_X_YEARS'
,p_message_language=>'sl'
,p_message_text=>'Naslednjih toliko let: %0'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142534031939752413)
,p_name=>'APEXIR_NEXT_YEAR'
,p_message_language=>'sl'
,p_message_text=>'Naslednje leto'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142506329372752405)
,p_name=>'APEXIR_NO'
,p_message_language=>'sl'
,p_message_text=>'Ne'
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142549023402752418)
,p_name=>'APEXIR_NONE'
,p_message_language=>'sl'
,p_message_text=>'- Brez -'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142600062724752433)
,p_name=>'APEXIR_NOT_VALID_EMAIL'
,p_message_language=>'sl'
,p_message_text=>unistr('Ni veljaven e-po\0161tni naslov.')
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142472169401752395)
,p_name=>'APEXIR_NO_COLUMNS_SELECTED'
,p_message_language=>'sl'
,p_message_text=>'Ni izbranih stolpcev za prikaz. Uporabite <strong>Stolpci</strong> v meniju dejanj, da stolpec naredite viden.'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142545540220752417)
,p_name=>'APEXIR_NULLS_ALWAYS_FIRST'
,p_message_language=>'sl'
,p_message_text=>'Vrednosti NULL vedno prve'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142545454938752417)
,p_name=>'APEXIR_NULLS_ALWAYS_LAST'
,p_message_language=>'sl'
,p_message_text=>'Vrednosti NULL vedno zadnje'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142545938727752417)
,p_name=>'APEXIR_NULL_SORTING'
,p_message_language=>'sl'
,p_message_text=>'Razvrsti NULL %0'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142542347793752416)
,p_name=>'APEXIR_NUMERIC_FLASHBACK_TIME'
,p_message_language=>'sl'
,p_message_text=>unistr('\010Cas pogleda nazaj mora biti \0161tevilski.')
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142541969902752416)
,p_name=>'APEXIR_NUMERIC_SEQUENCE'
,p_message_language=>'sl'
,p_message_text=>unistr('Zaporedje mora biti \0161tevilsko.')
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142546483204752417)
,p_name=>'APEXIR_OPERATOR'
,p_message_language=>'sl'
,p_message_text=>'Operator'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142504919329752405)
,p_name=>'APEXIR_ORANGE'
,p_message_language=>'sl'
,p_message_text=>unistr('oran\017Ena')
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142618964056752439)
,p_name=>'APEXIR_ORIENTATION'
,p_message_language=>'sl'
,p_message_text=>'Usmerjenost'
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142506838201752405)
,p_name=>'APEXIR_OTHER'
,p_message_language=>'sl'
,p_message_text=>'Drugo'
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142473079999752395)
,p_name=>'APEXIR_PAGINATION_OF'
,p_message_language=>'sl'
,p_message_text=>unistr('\0160tevil\010Denje strani za %0')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142487094619752399)
,p_name=>'APEXIR_PDF_ORIENTATION'
,p_message_language=>'sl'
,p_message_text=>'Usmerjenost strani'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142487738981752400)
,p_name=>'APEXIR_PDF_ORIENTATION_HORIZONTAL'
,p_message_language=>'sl'
,p_message_text=>unistr('Le\017Ee\010De')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142487885511752400)
,p_name=>'APEXIR_PDF_ORIENTATION_VERTICAL'
,p_message_language=>'sl'
,p_message_text=>unistr('Pokon\010Dno')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142486966197752399)
,p_name=>'APEXIR_PDF_PAGE_SIZE'
,p_message_language=>'sl'
,p_message_text=>'Velikost strani'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142487514940752399)
,p_name=>'APEXIR_PDF_PAGE_SIZE_A3'
,p_message_language=>'sl'
,p_message_text=>'A3'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142487456733752399)
,p_name=>'APEXIR_PDF_PAGE_SIZE_A4'
,p_message_language=>'sl'
,p_message_text=>'A4'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142487661336752399)
,p_name=>'APEXIR_PDF_PAGE_SIZE_CUSTOM'
,p_message_language=>'sl'
,p_message_text=>'Prilagojeno'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142487291571752399)
,p_name=>'APEXIR_PDF_PAGE_SIZE_LEGAL'
,p_message_language=>'sl'
,p_message_text=>'Pravno'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142487185184752399)
,p_name=>'APEXIR_PDF_PAGE_SIZE_LETTER'
,p_message_language=>'sl'
,p_message_text=>unistr('\010Crka')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142487317397752399)
,p_name=>'APEXIR_PDF_PAGE_SIZE_TABLOID'
,p_message_language=>'sl'
,p_message_text=>'Tabloid'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142627800880752442)
,p_name=>'APEXIR_PERCENT_OF_TOTAL_COUNT_X'
,p_message_language=>'sl'
,p_message_text=>unistr('Odstotek skupnega \0161tevila %0 (%)')
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142627039312752441)
,p_name=>'APEXIR_PERCENT_OF_TOTAL_SUM_X'
,p_message_language=>'sl'
,p_message_text=>'Odstotek skupne vsote %0 (%)'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142626004214752441)
,p_name=>'APEXIR_PERCENT_TOTAL_COUNT'
,p_message_language=>'sl'
,p_message_text=>unistr('Odstotek skupnega \0161tevila')
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142625957433752441)
,p_name=>'APEXIR_PERCENT_TOTAL_SUM'
,p_message_language=>'sl'
,p_message_text=>'Odstotek skupne vsote'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142510458874752406)
,p_name=>'APEXIR_PIE'
,p_message_language=>'sl'
,p_message_text=>'Tortni grafikon'
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142576187740752426)
,p_name=>'APEXIR_PIVOT'
,p_message_language=>'sl'
,p_message_text=>'Vrtenje'
,p_is_js_message=>true
,p_version_scn=>2705538
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142577633435752426)
,p_name=>'APEXIR_PIVOT_AGG_NOT_NULL'
,p_message_language=>'sl'
,p_message_text=>unistr('Dolo\010Diti je treba zdru\017Eevanje.')
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142577808815752426)
,p_name=>'APEXIR_PIVOT_AGG_NOT_ON_ROW_COL'
,p_message_language=>'sl'
,p_message_text=>unistr('V stolpcu, ki je izbran kot stolpec vrstice, ne morete zdru\017Eevati.')
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142577039431752426)
,p_name=>'APEXIR_PIVOT_COLUMNS'
,p_message_language=>'sl'
,p_message_text=>'Vrtilni stolpci'
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142576822715752426)
,p_name=>'APEXIR_PIVOT_COLUMN_N'
,p_message_language=>'sl'
,p_message_text=>'Vrtilni stolpec %0'
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142577429675752426)
,p_name=>'APEXIR_PIVOT_COLUMN_NOT_NULL'
,p_message_language=>'sl'
,p_message_text=>unistr('Dolo\010Diti je treba vrtilni stolpec.')
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142429995109752382)
,p_name=>'APEXIR_PIVOT_MAX_ROW_CNT'
,p_message_language=>'sl'
,p_message_text=>unistr('Maksimalno \0161tevilo vrstic za poizvedbo PIVOT omeji \0161tevilo vrstic v osnovni poizvedbi in ne \0161tevila prikazanih vrstic. Va\0161a osnovna poizvedba presega maksimalno \0161tevilo vrstic, ki je %0. Uporabite filter, da zmanj\0161ate \0161tevilo zapisov v osnovni poizve')
||'dbi.'
,p_version_scn=>2705512
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142577305204752426)
,p_name=>'APEXIR_PIVOT_SORT'
,p_message_language=>'sl'
,p_message_text=>unistr('Vrtilno razvr\0161\010Danje')
,p_is_js_message=>true
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142543377564752416)
,p_name=>'APEXIR_PIVOT_TOO_MANY_VALUES'
,p_message_language=>'sl'
,p_message_text=>unistr('Vrtilni stolpec vsebuje preve\010D razli\010Dnih vrednosti - poizvedbe SQL PIVOT ni mogo\010De ustvariti.')
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142474303703752396)
,p_name=>'APEXIR_PIVOT_VIEW_OF'
,p_message_language=>'sl'
,p_message_text=>'Vrtilni pogled za %0'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142600179014752433)
,p_name=>'APEXIR_PREVIEW'
,p_message_language=>'sl'
,p_message_text=>'Predogled'
,p_version_scn=>2705544
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142530671008752412)
,p_name=>'APEXIR_PREVIOUS'
,p_message_language=>'sl'
,p_message_text=>'Nazaj'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142624975408752441)
,p_name=>'APEXIR_PRIMARY'
,p_message_language=>'sl'
,p_message_text=>'Primarno'
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142601180830752434)
,p_name=>'APEXIR_PRIMARY_REPORT'
,p_message_language=>'sl'
,p_message_text=>unistr('Primarno poro\010Dilo')
,p_version_scn=>2705544
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142486853709752399)
,p_name=>'APEXIR_PRINT_ACCESSIBLE'
,p_message_language=>'sl'
,p_message_text=>unistr('Vklju\010Ditev oznak za dostopnost')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142447623635752388)
,p_name=>'APEXIR_PRINT_STRIP_RICH_TEXT'
,p_message_language=>'sl'
,p_message_text=>unistr('\010Ci\0161\010Denje obogatenega besedila')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142556082586752420)
,p_name=>'APEXIR_PRIVATE'
,p_message_language=>'sl'
,p_message_text=>'Zasebno'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142511082782752406)
,p_name=>'APEXIR_PUBLIC'
,p_message_language=>'sl'
,p_message_text=>'Javno'
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142506669666752405)
,p_name=>'APEXIR_RED'
,p_message_language=>'sl'
,p_message_text=>unistr('rde\010Da')
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142653015809752449)
,p_name=>'APEXIR_REGION_STATIC_ID_DOES_NOT_EXIST'
,p_message_language=>'sl'
,p_message_text=>unistr('Stati\010Dni ID podro\010Dja %0 ne obstaja.')
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142540178427752415)
,p_name=>'APEXIR_REMOVE'
,p_message_language=>'sl'
,p_message_text=>'Odstrani'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142540247451752415)
,p_name=>'APEXIR_REMOVE_ALL'
,p_message_language=>'sl'
,p_message_text=>'Odstrani vse'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142648462954752448)
,p_name=>'APEXIR_REMOVE_CHART'
,p_message_language=>'sl'
,p_message_text=>'Odstrani grafikon'
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142539755198752415)
,p_name=>'APEXIR_REMOVE_CONTROL_BREAK'
,p_message_language=>'sl'
,p_message_text=>'Odstrani kontrolni prelom'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142539402718752415)
,p_name=>'APEXIR_REMOVE_FILTER'
,p_message_language=>'sl'
,p_message_text=>'Odstrani filter'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142539590518752415)
,p_name=>'APEXIR_REMOVE_FLASHBACK'
,p_message_language=>'sl'
,p_message_text=>'Odstrani pogled nazaj'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142648506819752448)
,p_name=>'APEXIR_REMOVE_GROUP_BY'
,p_message_language=>'sl'
,p_message_text=>'Odstrani grupiranje'
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142539854370752415)
,p_name=>'APEXIR_REMOVE_HIGHLIGHT'
,p_message_language=>'sl'
,p_message_text=>unistr('Odstrani ozna\010Dbo')
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142648688623752448)
,p_name=>'APEXIR_REMOVE_PIVOT'
,p_message_language=>'sl'
,p_message_text=>'Odstrani vrtenje'
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142629712843752442)
,p_name=>'APEXIR_REMOVE_REPORT'
,p_message_language=>'sl'
,p_message_text=>unistr('Odstrani poro\010Dilo')
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142611533673752437)
,p_name=>'APEXIR_RENAME_DEFAULT_REPORT'
,p_message_language=>'sl'
,p_message_text=>unistr('Preimenuj privzeto poro\010Dilo')
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142549360125752418)
,p_name=>'APEXIR_RENAME_REPORT'
,p_message_language=>'sl'
,p_message_text=>unistr('Preimenovanje poro\010Dila')
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142530976039752412)
,p_name=>'APEXIR_REPORT'
,p_message_language=>'sl'
,p_message_text=>unistr('Poro\010Dilo')
,p_is_js_message=>true
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142627918739752442)
,p_name=>'APEXIR_REPORTS'
,p_message_language=>'sl'
,p_message_text=>unistr('Poro\010Dila')
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142503145343752404)
,p_name=>'APEXIR_REPORT_ALIAS_DOES_NOT_EXIST'
,p_message_language=>'sl'
,p_message_text=>unistr('Shranjeno interaktivno poro\010Dilo z drugim imenom %0 ne obstaja.')
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142556336246752420)
,p_name=>'APEXIR_REPORT_DOES_NOT_EXIST'
,p_message_language=>'sl'
,p_message_text=>unistr('Poro\010Dilo ne obstaja.')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142503220378752404)
,p_name=>'APEXIR_REPORT_ID_DOES_NOT_EXIST'
,p_message_language=>'sl'
,p_message_text=>unistr('ID shranjenega interaktivnega poro\010Dila %0 ne obstaja.')
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142547606079752417)
,p_name=>'APEXIR_REPORT_SETTINGS'
,p_message_language=>'sl'
,p_message_text=>unistr('Nastavitve poro\010Dila')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142471856468752395)
,p_name=>'APEXIR_REPORT_SETTINGS_OF'
,p_message_language=>'sl'
,p_message_text=>unistr('Nastavitve poro\010Dila za %0')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142527913537752412)
,p_name=>'APEXIR_REPORT_VIEW'
,p_message_language=>'sl'
,p_message_text=>unistr('Pogled poro\010Dila')
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142532178872752413)
,p_name=>'APEXIR_RESET'
,p_message_language=>'sl'
,p_message_text=>'Ponastavi'
,p_is_js_message=>true
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142511235054752407)
,p_name=>'APEXIR_RESET_CONFIRM'
,p_message_language=>'sl'
,p_message_text=>unistr('Obnovite poro\010Dilo na privzete nastavitve.')
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142506422782752405)
,p_name=>'APEXIR_ROW'
,p_message_language=>'sl'
,p_message_text=>'Vrstica'
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142624042580752440)
,p_name=>'APEXIR_ROWID_NOT_SUPPORTED_FOR_WEBSOURCE'
,p_message_language=>'sl'
,p_message_text=>unistr('ROWID ni mogo\010De uporabiti kot stolpec primarnega klju\010Da za vir podatkov REST.')
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142538814989752415)
,p_name=>'APEXIR_ROWS'
,p_message_language=>'sl'
,p_message_text=>'Vrstice'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142601896932752434)
,p_name=>'APEXIR_ROWS_PER_PAGE'
,p_message_language=>'sl'
,p_message_text=>unistr('\0160tevilo vrstic na stran')
,p_is_js_message=>true
,p_version_scn=>2705544
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142577168331752426)
,p_name=>'APEXIR_ROW_COLUMNS'
,p_message_language=>'sl'
,p_message_text=>'Stolpci vrstice'
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142576964412752426)
,p_name=>'APEXIR_ROW_COLUMN_N'
,p_message_language=>'sl'
,p_message_text=>'Stolpec vrstice %0'
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142577549315752426)
,p_name=>'APEXIR_ROW_COLUMN_NOT_NULL'
,p_message_language=>'sl'
,p_message_text=>unistr('Dolo\010Diti je treba stolpec vrstice.')
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142577702089752426)
,p_name=>'APEXIR_ROW_COL_DIFF_FROM_PIVOT_COL'
,p_message_language=>'sl'
,p_message_text=>'Stolpec vrstice se mora razlikovati od vrtilnega stolpca.'
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142553355967752419)
,p_name=>'APEXIR_ROW_FILTER'
,p_message_language=>'sl'
,p_message_text=>'Filter vrstic'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142528025778752412)
,p_name=>'APEXIR_ROW_OF'
,p_message_language=>'sl'
,p_message_text=>'Vrstica %0 od %1'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142532300880752413)
,p_name=>'APEXIR_ROW_TEXT_CONTAINS'
,p_message_language=>'sl'
,p_message_text=>'Besedilo vrstice vsebuje'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142505707764752405)
,p_name=>'APEXIR_SAVE'
,p_message_language=>'sl'
,p_message_text=>'Shrani'
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142542940693752416)
,p_name=>'APEXIR_SAVED_REPORT'
,p_message_language=>'sl'
,p_message_text=>unistr('Shranjeno poro\010Dilo')
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142542898813752416)
,p_name=>'APEXIR_SAVED_REPORT_MSG'
,p_message_language=>'sl'
,p_message_text=>unistr('Shranjeno poro\010Dilo = "%0"')
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142545044207752417)
,p_name=>'APEXIR_SAVE_DEFAULT_CONFIRM'
,p_message_language=>'sl'
,p_message_text=>unistr('Trenutne nastavitve poro\010Dila bodo uporabljene kot privzete za vse uporabnike.')
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142611476681752437)
,p_name=>'APEXIR_SAVE_DEFAULT_REPORT'
,p_message_language=>'sl'
,p_message_text=>unistr('Shrani privzeto poro\010Dilo')
,p_is_js_message=>true
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142532034255752413)
,p_name=>'APEXIR_SAVE_REPORT'
,p_message_language=>'sl'
,p_message_text=>unistr('Shrani poro\010Dilo')
,p_is_js_message=>true
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142648809675752448)
,p_name=>'APEXIR_SAVE_REPORT_DEFAULT'
,p_message_language=>'sl'
,p_message_text=>unistr('Shrani poro\010Dilo *')
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142602844443752434)
,p_name=>'APEXIR_SEARCH'
,p_message_language=>'sl'
,p_message_text=>'Iskanje'
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142537700088752414)
,p_name=>'APEXIR_SEARCH_BAR'
,p_message_language=>'sl'
,p_message_text=>'Vrstica za iskanje'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142471183173752395)
,p_name=>'APEXIR_SEARCH_BAR_OF'
,p_message_language=>'sl'
,p_message_text=>'Vrstica za iskanje za %0'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142648772494752448)
,p_name=>'APEXIR_SEARCH_COLUMN'
,p_message_language=>'sl'
,p_message_text=>'Iskanje: %0'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142608323937752436)
,p_name=>'APEXIR_SEARCH_REPORT'
,p_message_language=>'sl'
,p_message_text=>unistr('Poro\010Dilo o iskanju')
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142592328379752431)
,p_name=>'APEXIR_SELECTED_COLUMNS'
,p_message_language=>'sl'
,p_message_text=>'Izbrani stolpci'
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142507445950752405)
,p_name=>'APEXIR_SELECT_COLUMN'
,p_message_language=>'sl'
,p_message_text=>'- Izbira stolpca -'
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142531389970752413)
,p_name=>'APEXIR_SELECT_COLUMNS'
,p_message_language=>'sl'
,p_message_text=>'Izbira stolpcev'
,p_is_js_message=>true
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142510966072752406)
,p_name=>'APEXIR_SELECT_FUNCTION'
,p_message_language=>'sl'
,p_message_text=>'- Izbira funkcije -'
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142538512835752415)
,p_name=>'APEXIR_SELECT_GROUP_BY_COLUMN'
,p_message_language=>'sl'
,p_message_text=>'- Izbira stolpca Grupiranje -'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142576652377752426)
,p_name=>'APEXIR_SELECT_PIVOT_COLUMN'
,p_message_language=>'sl'
,p_message_text=>'- Izbira vrtilnega stolpca -'
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142626981768752441)
,p_name=>'APEXIR_SELECT_ROW'
,p_message_language=>'sl'
,p_message_text=>'Izbira vrstice'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142576702172752426)
,p_name=>'APEXIR_SELECT_ROW_COLUMN'
,p_message_language=>'sl'
,p_message_text=>'- Izbira stolpca vrstice -'
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142458232624752391)
,p_name=>'APEXIR_SEND'
,p_message_language=>'sl'
,p_message_text=>unistr('Po\0161lji')
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142480720870752397)
,p_name=>'APEXIR_SEND_AS_EMAIL'
,p_message_language=>'sl'
,p_message_text=>unistr('Po\0161lji kot e-po\0161to')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142506170184752405)
,p_name=>'APEXIR_SEQUENCE'
,p_message_language=>'sl'
,p_message_text=>'Zaporedje'
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142531586131752413)
,p_name=>'APEXIR_SORT'
,p_message_language=>'sl'
,p_message_text=>'Razvrsti'
,p_is_js_message=>true
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142541092663752415)
,p_name=>'APEXIR_SORT_ASCENDING'
,p_message_language=>'sl'
,p_message_text=>unistr('Razvrsti nara\0161\010Dajo\010De')
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142541153744752415)
,p_name=>'APEXIR_SORT_DESCENDING'
,p_message_language=>'sl'
,p_message_text=>unistr('Razvrsti padajo\010De')
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142629172292752442)
,p_name=>'APEXIR_SORT_ORDER'
,p_message_language=>'sl'
,p_message_text=>unistr('Vrstni red razvr\0161\010Danja')
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142535448229752414)
,p_name=>'APEXIR_SPACE_AS_IN_ONE_EMPTY_STRING'
,p_message_language=>'sl'
,p_message_text=>'presledek'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142546693544752417)
,p_name=>'APEXIR_STATUS'
,p_message_language=>'sl'
,p_message_text=>'Status %0'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142600531182752433)
,p_name=>'APEXIR_SUBSCRIPTION'
,p_message_language=>'sl'
,p_message_text=>unistr('Naro\010Dnina')
,p_is_js_message=>true
,p_version_scn=>2705544
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142626311698752441)
,p_name=>'APEXIR_SUBSCRIPTION_ENDING'
,p_message_language=>'sl'
,p_message_text=>'Konec'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142445331314752387)
,p_name=>'APEXIR_SUBSCRIPTION_SKIP_IF_NDF'
,p_message_language=>'sl'
,p_message_text=>unistr('Presko\010Di, \010De ni najdenih podatkov')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142626299152752441)
,p_name=>'APEXIR_SUBSCRIPTION_STARTING_FROM'
,p_message_language=>'sl'
,p_message_text=>unistr('Za\010Detek')
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142627110024752441)
,p_name=>'APEXIR_SUM_X'
,p_message_language=>'sl'
,p_message_text=>'Vsota %0'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142618022124752439)
,p_name=>'APEXIR_TABLE_SUMMARY'
,p_message_language=>'sl'
,p_message_text=>unistr('%0, poro\010Dilo = %1, pogled = %2')
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142505042223752405)
,p_name=>'APEXIR_TEXT_COLOR'
,p_message_language=>'sl'
,p_message_text=>'Barva besedila'
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142523700861752410)
,p_name=>'APEXIR_TIME_DAYS'
,p_message_language=>'sl'
,p_message_text=>'dnevi'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142523652902752410)
,p_name=>'APEXIR_TIME_HOURS'
,p_message_language=>'sl'
,p_message_text=>'ure'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142523581266752410)
,p_name=>'APEXIR_TIME_MINS'
,p_message_language=>'sl'
,p_message_text=>'minute'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142523929282752410)
,p_name=>'APEXIR_TIME_MONTHS'
,p_message_language=>'sl'
,p_message_text=>'meseci'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142523833259752410)
,p_name=>'APEXIR_TIME_WEEKS'
,p_message_language=>'sl'
,p_message_text=>'tedni'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142524097340752410)
,p_name=>'APEXIR_TIME_YEARS'
,p_message_language=>'sl'
,p_message_text=>'leta'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142629525787752442)
,p_name=>'APEXIR_TOGGLE'
,p_message_language=>'sl'
,p_message_text=>'Preklop'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142540329946752415)
,p_name=>'APEXIR_TOP'
,p_message_language=>'sl'
,p_message_text=>'Zgoraj'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142623070890752440)
,p_name=>'APEXIR_UNGROUPED_COLUMN'
,p_message_language=>'sl'
,p_message_text=>unistr('Razdru\017Een stolpec')
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142541865682752416)
,p_name=>'APEXIR_UNIQUE_HIGHLIGHT_NAME'
,p_message_language=>'sl'
,p_message_text=>unistr('Ime ozna\010Dbe mora biti enoli\010Dno.')
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142509704077752406)
,p_name=>'APEXIR_UNSUPPORTED_DATA_TYPE'
,p_message_language=>'sl'
,p_message_text=>'nepodprt podatkovni tip'
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142540479928752415)
,p_name=>'APEXIR_UP'
,p_message_language=>'sl'
,p_message_text=>'Gor'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142542040109752416)
,p_name=>'APEXIR_VALID_COLOR'
,p_message_language=>'sl'
,p_message_text=>'Vnesite veljavno barvo.'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142542131248752416)
,p_name=>'APEXIR_VALID_FORMAT_MASK'
,p_message_language=>'sl'
,p_message_text=>'Vnesite veljavno masko formata.'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142506924105752405)
,p_name=>'APEXIR_VALUE'
,p_message_language=>'sl'
,p_message_text=>'Vrednost'
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142540919672752415)
,p_name=>'APEXIR_VALUE_AXIS_TITLE'
,p_message_language=>'sl'
,p_message_text=>'Naslov osi za vrednost'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142548783497752418)
,p_name=>'APEXIR_VALUE_REQUIRED'
,p_message_language=>'sl'
,p_message_text=>'Zahtevana je vrednost'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142510331395752406)
,p_name=>'APEXIR_VCOLUMN'
,p_message_language=>'sl'
,p_message_text=>unistr('Navpi\010Dni stolpec')
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142619128756752439)
,p_name=>'APEXIR_VERTICAL'
,p_message_language=>'sl'
,p_message_text=>unistr('Navpi\010Dno')
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142548022872752418)
,p_name=>'APEXIR_VIEW_CHART'
,p_message_language=>'sl'
,p_message_text=>'Ogled grafikona'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142606657002752435)
,p_name=>'APEXIR_VIEW_DETAIL'
,p_message_language=>'sl'
,p_message_text=>'Ogled podrobnosti'
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142650921590752449)
,p_name=>'APEXIR_VIEW_DOES_NOT_EXIST'
,p_message_language=>'sl'
,p_message_text=>unistr('Poro\010Dilo nima dolo\010Denega pogleda %0.')
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142606781635752435)
,p_name=>'APEXIR_VIEW_GROUP_BY'
,p_message_language=>'sl'
,p_message_text=>'Ogled grupiranja'
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142606564282752435)
,p_name=>'APEXIR_VIEW_ICONS'
,p_message_language=>'sl'
,p_message_text=>'Ogled ikon'
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142576424466752426)
,p_name=>'APEXIR_VIEW_PIVOT'
,p_message_language=>'sl'
,p_message_text=>'Pogled vrtenja'
,p_version_scn=>2705538
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142548135784752418)
,p_name=>'APEXIR_VIEW_REPORT'
,p_message_language=>'sl'
,p_message_text=>unistr('Ogled poro\010Dila')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142600779079752433)
,p_name=>'APEXIR_WEEKLY'
,p_message_language=>'sl'
,p_message_text=>'Tedensko'
,p_version_scn=>2705544
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142530845514752412)
,p_name=>'APEXIR_WORKING_REPORT'
,p_message_language=>'sl'
,p_message_text=>unistr('Delovno poro\010Dilo')
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142628556436752442)
,p_name=>'APEXIR_X_DAYS'
,p_message_language=>'sl'
,p_message_text=>'%0 (dnevi)'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142628413710752442)
,p_name=>'APEXIR_X_HOURS'
,p_message_language=>'sl'
,p_message_text=>'%0 (ure)'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142628390346752442)
,p_name=>'APEXIR_X_MINS'
,p_message_language=>'sl'
,p_message_text=>'%0 (minute)'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142628767181752442)
,p_name=>'APEXIR_X_MONTHS'
,p_message_language=>'sl'
,p_message_text=>'%0 (meseci)'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142628677511752442)
,p_name=>'APEXIR_X_WEEKS'
,p_message_language=>'sl'
,p_message_text=>'%0 (tedni)'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142628873839752442)
,p_name=>'APEXIR_X_YEARS'
,p_message_language=>'sl'
,p_message_text=>'%0 (leta)'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142626578271752441)
,p_name=>'APEXIR_YEAR'
,p_message_language=>'sl'
,p_message_text=>'Leto'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142504723868752405)
,p_name=>'APEXIR_YELLOW'
,p_message_language=>'sl'
,p_message_text=>'rumena'
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142506255968752405)
,p_name=>'APEXIR_YES'
,p_message_language=>'sl'
,p_message_text=>'Da'
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142540752363752415)
,p_name=>'APEX_GROUP.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE'
,p_message_language=>'sl'
,p_message_text=>'%0 vsebuje < ali >, ki sta neveljavna znaka.'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142564677198752422)
,p_name=>'APEX_REGION'
,p_message_language=>'sl'
,p_message_text=>unistr('Podro\010Dje')
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142455725441752390)
,p_name=>'APEX_ZIP.EXTRACT_FAILED'
,p_message_language=>'sl'
,p_message_text=>unistr('Datoteke ZIP ni mogo\010De ekstrahirati.')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142455691710752390)
,p_name=>'APEX_ZIP.INVALID_ZIPFILE'
,p_message_language=>'sl'
,p_message_text=>unistr('Podpisa konca osrednjega imenika ni mogo\010De najti. Ta datoteka ni datoteka ZIP.')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142486720408752399)
,p_name=>'API_PRECONDITION_VIOLATED'
,p_message_language=>'sl'
,p_message_text=>unistr('Prekr\0161en predpogoj API-ja')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142508835784752406)
,p_name=>'APP.SETTING.CANNOT.GET'
,p_message_language=>'sl'
,p_message_text=>unistr('Vrednosti za nastavitev aplikacije %0 ni mogo\010De pridobiti, ker je povezana mo\017Enost gradnje onemogo\010Dena.')
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142508714235752406)
,p_name=>'APP.SETTING.CANNOT.SET'
,p_message_language=>'sl'
,p_message_text=>unistr('Vrednosti za nastavitev aplikacije %0 ni mogo\010De nastaviti, ker je povezana mo\017Enost gradnje onemogo\010Dena.')
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142621353370752440)
,p_name=>'APP.SETTING.INVALID.VALUE'
,p_message_language=>'sl'
,p_message_text=>'Vrednost nastavitve aplikacije %0 je neveljavna'
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142621220999752440)
,p_name=>'APP.SETTING.NOT.DEFINED'
,p_message_language=>'sl'
,p_message_text=>unistr('Zahtevana nastavitev aplikacije %0 ni dolo\010Dena')
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142621490266752440)
,p_name=>'APP.SETTING.VALUE.NOT.NULL'
,p_message_language=>'sl'
,p_message_text=>unistr('Nastavitve aplikacije %0 ni mogo\010De nastaviti na vrednost NULL')
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142495398832752402)
,p_name=>'BACK'
,p_message_language=>'sl'
,p_message_text=>'Nazaj'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142477758439752397)
,p_name=>'BUILDER'
,p_message_language=>'sl'
,p_message_text=>'Graditelj'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142551355907752419)
,p_name=>'BUTTON LABEL'
,p_message_language=>'sl'
,p_message_text=>'Oznaka gumba'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142474677412752396)
,p_name=>'BUTTON_CSS_CLASSES'
,p_message_language=>'sl'
,p_message_text=>'Razredi CSS gumba'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142513157813752407)
,p_name=>'BUTTON_ID'
,p_message_language=>'sl'
,p_message_text=>unistr('Ustvarjeni ID gumba bo stati\010Dni ID gumba, \010De je dolo\010Den. \010Ce ni dolo\010Den, bo notranje ustvarjeni ID v formatu "B" || [Notranji ID gumba]')
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142447192930752387)
,p_name=>'CANDLESTICK'
,p_message_language=>'sl'
,p_message_text=>unistr('Sve\010Dnik')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142561165390752421)
,p_name=>'CENTER'
,p_message_language=>'sl'
,p_message_text=>'Sredina'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142507796832752406)
,p_name=>'CHANGE_PW_REQUEST'
,p_message_language=>'sl'
,p_message_text=>'Zahteva %0'
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142497753955752403)
,p_name=>'CHECK$'
,p_message_language=>'sl'
,p_message_text=>'izbirnik vrstic'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142623192110752440)
,p_name=>'CHECKED'
,p_message_language=>'sl'
,p_message_text=>'potrjeno'
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142599524353752433)
,p_name=>'COLUMN'
,p_message_language=>'sl'
,p_message_text=>'Stolpec'
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142557150992752420)
,p_name=>'COMMENTS'
,p_message_language=>'sl'
,p_message_text=>'Komentarji'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142538123274752415)
,p_name=>'CONTINUE'
,p_message_language=>'sl'
,p_message_text=>'Nadaljuj'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142495640179752402)
,p_name=>'COPYRIGHT'
,p_message_language=>'sl'
,p_message_text=>unistr('Copyright &copy; 1999, %0, Oracle in/ali povezane dru\017Ebe.')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142543893945752416)
,p_name=>'COUNT'
,p_message_language=>'sl'
,p_message_text=>unistr('\0160tevilo')
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142550863334752418)
,p_name=>'CREATE'
,p_message_language=>'sl'
,p_message_text=>'Ustvarjanje'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142606200453752435)
,p_name=>'CREATED'
,p_message_language=>'sl'
,p_message_text=>'Ustvarjeno'
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142606398619752435)
,p_name=>'CREATED_BY'
,p_message_language=>'sl'
,p_message_text=>'Ustvaril(-a)'
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142527223676752411)
,p_name=>'CREATED_ON'
,p_message_language=>'sl'
,p_message_text=>'Ustvarjeno dne'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142538367242752415)
,p_name=>'CUSTOM'
,p_message_language=>'sl'
,p_message_text=>'Prilagojeno'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142549556352752418)
,p_name=>'CUSTOMIZE'
,p_message_language=>'sl'
,p_message_text=>'Prilagajanje'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142551556203752419)
,p_name=>'CUSTOMIZE.USER_PAGE_PREFS_RESET'
,p_message_language=>'sl'
,p_message_text=>'Preference strani so bile ponastavljene za uporabnika %0.'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142551649090752419)
,p_name=>'CUSTOMIZE.USER_PREFS_CHANGED'
,p_message_language=>'sl'
,p_message_text=>'Preference spremenjene za uporabnika %0.'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142551434020752419)
,p_name=>'CUSTOMIZE.USER_PREFS_RESET'
,p_message_language=>'sl'
,p_message_text=>'Preference strani so bile ponastavljene za uporabnika %0.'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142512568432752407)
,p_name=>'DAILY'
,p_message_language=>'sl'
,p_message_text=>'Dnevno'
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142475905071752396)
,p_name=>'DATA.LOAD.INVALID_FILE'
,p_message_language=>'sl'
,p_message_text=>unistr('Nalo\017Eena datoteka je neveljavna ali ima napa\010Dno pripono.')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142507949395752406)
,p_name=>'DATA.LOAD.INVALID_SELECTOR'
,p_message_language=>'sl'
,p_message_text=>'Uporabljen je bil neveljaven izbirnik XML ali JSON.'
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142453046031752389)
,p_name=>'DATA.LOAD.NO_COMMON_COLUMNS'
,p_message_language=>'sl'
,p_message_text=>unistr('Podatkovni profil in nalo\017Eena datoteka ne vsebujeta nobenega ciljnega stolpca tabele.')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142566977004752423)
,p_name=>'DATA.LOAD.NO_FILE_CONTENTS'
,p_message_language=>'sl'
,p_message_text=>unistr('V nalo\017Eeni datoteki ni bilo mogo\010De najti podatkov.')
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142567028015752423)
,p_name=>'DATA.LOAD.NO_WORKSHEET_CONTENTS'
,p_message_language=>'sl'
,p_message_text=>unistr('V delovnem listu "%0" ni bilo mogo\010De najti podatkov.')
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142472811524752395)
,p_name=>'DATA.LOAD.NO_XLSX_FILE'
,p_message_language=>'sl'
,p_message_text=>'Navedena datoteka ni datoteka XLSX.'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142438845278752385)
,p_name=>'DATA.LOAD.ROWS_PROCESSED'
,p_message_language=>'sl'
,p_message_text=>unistr('Nalaganje podatkov je kon\010Dano. Obdelanih je bilo toliko vrstic: %0.')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142441186468752386)
,p_name=>'DATA.LOAD.ROWS_PROCESSED_W_ERROR_ROW'
,p_message_language=>'sl'
,p_message_text=>unistr('Nalaganje podatkov je kon\010Dano. Obdelanih je bilo toliko vrstic: %0 z 1 napako.')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142441415812752386)
,p_name=>'DATA.LOAD.ROWS_PROCESSED_W_ERROR_ROWS'
,p_message_language=>'sl'
,p_message_text=>unistr('Nalaganje podatkov je kon\010Dano. Obdelanih je bilo toliko vrstic: %0 s toliko napakami: %1.')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142441251887752386)
,p_name=>'DATA.LOAD.ROW_PROCESSED'
,p_message_language=>'sl'
,p_message_text=>unistr('Nalaganje podatkov je kon\010Dano. Obdelana je bila 1 vrstica.')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142455538410752390)
,p_name=>'DATA.LOAD.ROW_PROCESSED_W_ERROR_ROW'
,p_message_language=>'sl'
,p_message_text=>unistr('Nalaganje podatkov je kon\010Dano. Obdelana je bila 1 vrstica z napako.')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142441359327752386)
,p_name=>'DATA.LOAD.ROW_PROCESSED_W_ERROR_ROWS'
,p_message_language=>'sl'
,p_message_text=>unistr('Nalaganje podatkov je kon\010Dano. Obdelana je bila 1 vrstica brez napake.')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142574040783752425)
,p_name=>'DATA_LOAD.COLUMN_NAMES_MAPPING'
,p_message_language=>'sl'
,p_message_text=>'Ciljni stolpec'
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142481205916752398)
,p_name=>'DATA_LOAD.DO_NOT_LOAD'
,p_message_language=>'sl'
,p_message_text=>'Ne nalagaj'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142481393866752398)
,p_name=>'DATA_LOAD.FAILED'
,p_message_language=>'sl'
,p_message_text=>'Predobdelava napake'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142574186971752425)
,p_name=>'DATA_LOAD.FIRST_COLUMN_NAMES'
,p_message_language=>'sl'
,p_message_text=>'Izvorni stolpec'
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142574915133752426)
,p_name=>'DATA_LOAD.FORMAT'
,p_message_language=>'sl'
,p_message_text=>unistr('Format datuma/\0161tevilke')
,p_version_scn=>2705538
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142481032853752398)
,p_name=>'DATA_LOAD.INSERT'
,p_message_language=>'sl'
,p_message_text=>'Vstavi vrstico'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142637151691752444)
,p_name=>'DATA_LOAD.LOOKUP_FAILED'
,p_message_language=>'sl'
,p_message_text=>unistr('Vrednosti \0161ifranta ni bilo mogo\010De pridobiti.')
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142606846064752435)
,p_name=>'DATA_LOAD.MAPPING'
,p_message_language=>'sl'
,p_message_text=>'Preslikava podatkov/tabele'
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142575049263752426)
,p_name=>'DATA_LOAD.ROW'
,p_message_language=>'sl'
,p_message_text=>'Vrstica'
,p_version_scn=>2705538
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142481467190752398)
,p_name=>'DATA_LOAD.SEQUENCE_ACTION'
,p_message_language=>'sl'
,p_message_text=>'Zaporedje: Dejanje'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142568762312752424)
,p_name=>'DATA_LOAD.TRANSFORMATION_FAILED'
,p_message_language=>'sl'
,p_message_text=>'Pravilo transformacije ni uspelo'
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142481149046752398)
,p_name=>'DATA_LOAD.UPDATE'
,p_message_language=>'sl'
,p_message_text=>'Posodobi vrstico'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142543418241752416)
,p_name=>'DATE'
,p_message_language=>'sl'
,p_message_text=>'Datum'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142516327749752408)
,p_name=>'DAY'
,p_message_language=>'sl'
,p_message_text=>'dan'
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142516406430752408)
,p_name=>'DAYS'
,p_message_language=>'sl'
,p_message_text=>'dnevi'
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142556872196752420)
,p_name=>'DEBUGGING_OFF'
,p_message_language=>'sl'
,p_message_text=>unistr('Iskanje napak ni omogo\010Deno za to aplikacijo.')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142608558580752436)
,p_name=>'DEFAULT'
,p_message_language=>'sl'
,p_message_text=>'Privzeto'
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142517199286752408)
,p_name=>'DELETE'
,p_message_language=>'sl'
,p_message_text=>unistr('izbri\0161i')
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142492710249752401)
,p_name=>'DELETE_MSG'
,p_message_language=>'sl'
,p_message_text=>unistr('Ali \017Eelite izvesti to dejanje brisanja?')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142472308189752395)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES'
,p_message_language=>'sl'
,p_message_text=>'Preglasitve seje'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142473230514752395)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ENABLE'
,p_message_language=>'sl'
,p_message_text=>unistr('Omogo\010Di preglasitve seje')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142474158629752395)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ERROR_LOAD'
,p_message_language=>'sl'
,p_message_text=>unistr('Pri nalaganju preglasitev seje je pri\0161lo do napake.')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142473910579752395)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ERROR_SAVE'
,p_message_language=>'sl'
,p_message_text=>unistr('Pri shranjevanju preglasitev seje je pri\0161lo do napake.')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142473889429752395)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_SAVED'
,p_message_language=>'sl'
,p_message_text=>'Preglasitve seje so shranjene. Za ogled sprememb zaprite to pogovorno okno.'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142447031281752387)
,p_name=>'DIAL_PCT'
,p_message_language=>'sl'
,p_message_text=>'Merilnik (odstotek)'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142488025147752400)
,p_name=>'DOWNLOAD'
,p_message_language=>'sl'
,p_message_text=>'Prenos'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142607661074752435)
,p_name=>'DUP_USER'
,p_message_language=>'sl'
,p_message_text=>unistr('Podvojeno uporabni\0161ko ime na seznamu.')
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142496446122752402)
,p_name=>'EDIT'
,p_message_language=>'sl'
,p_message_text=>'Uredi'
,p_is_js_message=>true
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142507677086752405)
,p_name=>'EMAIL_NOT_FOUND'
,p_message_language=>'sl'
,p_message_text=>unistr('E-po\0161tnega naslova "%0" ni bilo mogo\010De najti.')
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142490355804752400)
,p_name=>'EMAIL_SENT_BY'
,p_message_language=>'sl'
,p_message_text=>unistr('To e-po\0161to je poslal(-a) %0.')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142607830022752436)
,p_name=>'EMAIL_TOO_LONG'
,p_message_language=>'sl'
,p_message_text=>'Elektronski naslov je predolg. Omejitev je 240 znakov.'
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142538082951752415)
,p_name=>'ERROR'
,p_message_language=>'sl'
,p_message_text=>'Napaka'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142568801600752424)
,p_name=>'ERROR_SET_ITEM_STATE_FOR_PPR_REGION'
,p_message_language=>'sl'
,p_message_text=>unistr('Ni mogo\010De nastaviti izvorne vrednosti elementa strani za podro\010Dje delne osve\017Eitve strani')
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142529317218752412)
,p_name=>'F4500_P10_CREATED_BY'
,p_message_language=>'sl'
,p_message_text=>'Ustvaril(-a)'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142490636245752400)
,p_name=>'F4500_P2613_EXPIRED'
,p_message_language=>'sl'
,p_message_text=>'Geslo je poteklo'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142483055067752398)
,p_name=>'FILE_EMPTY'
,p_message_language=>'sl'
,p_message_text=>'Datoteka je prazna.'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142572857934752425)
,p_name=>'FILE_TOO_LARGE'
,p_message_language=>'sl'
,p_message_text=>unistr('Velikost nalo\017Eene datoteke je bila ve\010D kot %0 MB. Nalo\017Eite manj\0161o datoteko.')
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142492945707752401)
,p_name=>'FILE_UPLOAD_AUTHENTICATION_ERR'
,p_message_language=>'sl'
,p_message_text=>unistr('Preverjanje pristnosti uporabnika ni uspelo in vsaj ena datoteka ni bila nalo\017Eena.')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142493006421752401)
,p_name=>'FILE_UPLOAD_PUBLICUSER_ERR'
,p_message_language=>'sl'
,p_message_text=>unistr('Ta instanca uporabnikom brez preverjene pristnosti ne omogo\010Da nalaganja datotek.')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142572939879752425)
,p_name=>'FILTERS'
,p_message_language=>'sl'
,p_message_text=>'Filtri'
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142550964650752418)
,p_name=>'FLOW.SINGLE_VALIDATION_ERROR'
,p_message_language=>'sl'
,p_message_text=>unistr('Pri\0161lo je do 1 napake')
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142550194369752418)
,p_name=>'FLOW.VALIDATION_ERROR'
,p_message_language=>'sl'
,p_message_text=>unistr('Pri\0161lo je do toliko napak: %0')
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142495522971752402)
,p_name=>'FORM_OF'
,p_message_language=>'sl'
,p_message_text=>'%0 od %1'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142534588348752413)
,p_name=>'GO'
,p_message_language=>'sl'
,p_message_text=>'Pojdi'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142636711924752444)
,p_name=>'HELP'
,p_message_language=>'sl'
,p_message_text=>unistr('Pomo\010D')
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142477818257752397)
,p_name=>'HOME'
,p_message_language=>'sl'
,p_message_text=>'Domov'
,p_is_js_message=>true
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142516123832752408)
,p_name=>'HOUR'
,p_message_language=>'sl'
,p_message_text=>'ura'
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142516270709752408)
,p_name=>'HOURS'
,p_message_language=>'sl'
,p_message_text=>'ure'
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142497624787752402)
,p_name=>'ICON'
,p_message_language=>'sl'
,p_message_text=>'Ikona %0'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142474979062752396)
,p_name=>'ICON.EDITOR.CROP.HELP'
,p_message_language=>'sl'
,p_message_text=>unistr('Pomo\010D za obrezovanje ikone')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142476100241752396)
,p_name=>'ICON.EDITOR.CROPPER.HELPTEXT'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Povlecite ikono in jo z drsnikom za pove\010Davo prestavite znotraj okvirja.</p>'),
'',
'<p>Velikost nove ikone ob nalaganju bo spremenjena tako, da se bo prilegala trem formatom: ikona priljubljenih, mala ikona in velika ikona.</p>',
'',
unistr('<p>Kadar je fokus na obrezovalniku ikon, so na voljo naslednje bli\017Enjice na tipkovnici:</p>'),
'<ul>',
unistr('    <li>Pu\0161\010Dica levo: Premik slike levo*</li>'),
unistr('    <li>Pu\0161\010Dica navzgor: Premik slike navzgor*</li>'),
unistr('    <li>Pu\0161\010Dica desno: Premik slike desno*</li>'),
unistr('    <li>Pu\0161\010Dica navzdol: Premik slike navzdol*</li>'),
unistr('    <li>I: Pove\010Dava</li>'),
unistr('    <li>O: Pomanj\0161ava</li>'),
'    <li>L: Rotacija levo</li>',
'    <li>R: Rotacija desno</li>',
'</ul>',
'',
unistr('<p class="margin-top-md"><em>*Za hitrej\0161e premikanje dr\017Eite tipko Shift</em></p>')))
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142481676473752398)
,p_name=>'ICON.EDITOR.CROPPER.SUBTITLE'
,p_message_language=>'sl'
,p_message_text=>'Povlecite za prestavljanje ikone'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142481751324752398)
,p_name=>'ICON.EDITOR.CROPPER.ZOOM_SLIDER_LABEL'
,p_message_language=>'sl'
,p_message_text=>unistr('Premaknite drsnik za prilagajanje ravni pove\010Dave')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142474766309752396)
,p_name=>'ICON.EDITOR.DIALOG.TITLE'
,p_message_language=>'sl'
,p_message_text=>'Urejanje ikone aplikacije'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142475071802752396)
,p_name=>'ICON.EDITOR.ERROR.SAVING'
,p_message_language=>'sl'
,p_message_text=>'Napaka pri shranjevanju ikone'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142557415695752420)
,p_name=>'ICON.EDITOR.LEGACY_DATA'
,p_message_language=>'sl'
,p_message_text=>'<p><span class="a-Icon icon-tr-warning"></span> Ta aplikacija uporablja podedovane ikone. Nalaganje nove ikone bo zamenjalo vse podedovane ikone.</p>'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142475633163752396)
,p_name=>'ICON.EDITOR.UPLOAD.ICON'
,p_message_language=>'sl'
,p_message_text=>unistr('Nalo\017Eite novo ikono')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142551832717752419)
,p_name=>'INVALID_CREDENTIALS'
,p_message_language=>'sl'
,p_message_text=>'Neveljavne poverilnice za prijavo'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142652937322752449)
,p_name=>'INVALID_VALUE_FOR_PARAMETER'
,p_message_language=>'sl'
,p_message_text=>'Neveljavna vrednost za parameter: %0'
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142546112495752417)
,p_name=>'IR_AS_DEFAULT_REPORT_SETTING'
,p_message_language=>'sl'
,p_message_text=>unistr('Kot privzete nastavitve poro\010Dila')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142546268320752417)
,p_name=>'IR_AS_NAMED_REPORT'
,p_message_language=>'sl'
,p_message_text=>unistr('Kot imenovano poro\010Dilo')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142528182058752412)
,p_name=>'IR_ERROR'
,p_message_language=>'sl'
,p_message_text=>'Napaka %0. %1'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142527827592752412)
,p_name=>'IR_FRM_NAV_ERROR'
,p_message_language=>'sl'
,p_message_text=>unistr('Ni mogo\010De izra\010Dunati krmarjenja obrazca. %0')
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142503414331752404)
,p_name=>'IR_NOT_FOUND'
,p_message_language=>'sl'
,p_message_text=>unistr('Interaktivno poro\010Dilo ni bilo najdeno.')
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142502813296752404)
,p_name=>'IR_REGION_NOT_EXIST'
,p_message_language=>'sl'
,p_message_text=>unistr('Podro\010Dje interaktivnega poro\010Dila ne obstaja v aplikaciji %0, stran %1 in podro\010Dje %2.')
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142546073937752417)
,p_name=>'IR_STAR'
,p_message_language=>'sl'
,p_message_text=>'Prikazano samo za razvijalce'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142534299717752413)
,p_name=>'IR_UNIQUE_KEY_ERROR'
,p_message_language=>'sl'
,p_message_text=>unistr('Poizvedba poro\010Dila zahteva enoli\010Den klju\010D za identifikacijo posamezne vrstice. Posredovanega klju\010Da ni mogo\010De uporabiti za to poizvedbo. Dolo\010Dite stolpec enoli\010Dnega klju\010Da. %0')
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142534398406752413)
,p_name=>'IR_UNIQUE_KEY_ERROR2'
,p_message_language=>'sl'
,p_message_text=>unistr('Poizvedba poro\010Dila zahteva enoli\010Den klju\010D za identifikacijo posamezne vrstice. Posredovanega klju\010Da ni mogo\010De uporabiti za to poizvedbo. Za dolo\010Danje stolpca enoli\010Dnega klju\010Da uredite atribute poro\010Dila. %0')
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142575292526752426)
,p_name=>'ITEM.FILE_UPLOAD.CHOOSE_FILE'
,p_message_language=>'sl'
,p_message_text=>'Izbira datoteke'
,p_is_js_message=>true
,p_version_scn=>2705538
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142575184766752426)
,p_name=>'ITEM.FILE_UPLOAD.DRAG_DROP_FILE_HERE'
,p_message_language=>'sl'
,p_message_text=>'Povlecite in spustite datoteko sem ali'
,p_is_js_message=>true
,p_version_scn=>2705538
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142495887397752402)
,p_name=>'ITEMS'
,p_message_language=>'sl'
,p_message_text=>'Elementi'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142529562372752412)
,p_name=>'ITEM_VALUE'
,p_message_language=>'sl'
,p_message_text=>'Vrednost elementa'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142544185089752416)
,p_name=>'LABEL'
,p_message_language=>'sl'
,p_message_text=>'Oznaka'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142556755185752420)
,p_name=>'LANGUAGE'
,p_message_language=>'sl'
,p_message_text=>'Jezik'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142516889443752408)
,p_name=>'LAST'
,p_message_language=>'sl'
,p_message_text=>'zadnji'
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142492879517752401)
,p_name=>'LENGTH'
,p_message_language=>'sl'
,p_message_text=>unistr('Dol\017Eina')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142551175374752418)
,p_name=>'LOGIN'
,p_message_language=>'sl'
,p_message_text=>'Prijava'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142592702255752431)
,p_name=>'MANAGE'
,p_message_language=>'sl'
,p_message_text=>'Upravljanje'
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142655899756752450)
,p_name=>'MAXIMIZE'
,p_message_language=>'sl'
,p_message_text=>'Maksimiraj'
,p_is_js_message=>true
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142515914638752408)
,p_name=>'MINUTE'
,p_message_language=>'sl'
,p_message_text=>'minuta'
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142516088166752408)
,p_name=>'MINUTES'
,p_message_language=>'sl'
,p_message_text=>'minute'
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142608027559752436)
,p_name=>'MISSING_AT'
,p_message_language=>'sl'
,p_message_text=>unistr('V e-po\0161tnem naslovu manjka "@".')
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142608215167752436)
,p_name=>'MISSING_DIALOG_PAGE_TEMPLATE_WARNING'
,p_message_language=>'sl'
,p_message_text=>unistr('Opozorilo: Za pogovorno stran %0 v aplikaciji %1 ni bila dolo\010Dena nobena predloga pogovorne strani.')
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142607915432752436)
,p_name=>'MISSING_DOT'
,p_message_language=>'sl'
,p_message_text=>unistr('V domeni e-po\0161tnega naslova manjka ".".')
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142554262154752419)
,p_name=>'MODULE'
,p_message_language=>'sl'
,p_message_text=>'Modul'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142508494470752406)
,p_name=>'MONTH'
,p_message_language=>'sl'
,p_message_text=>'Mesec'
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142512353831752407)
,p_name=>'MONTHLY'
,p_message_language=>'sl'
,p_message_text=>unistr('Mese\010Dno')
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142508564077752406)
,p_name=>'MONTHS'
,p_message_language=>'sl'
,p_message_text=>'meseci'
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142543792173752416)
,p_name=>'MOVE'
,p_message_language=>'sl'
,p_message_text=>'Premik'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142614509883752438)
,p_name=>'MOVE_FROM'
,p_message_language=>'sl'
,p_message_text=>'Premakni iz'
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142614654476752438)
,p_name=>'MOVE_TO'
,p_message_language=>'sl'
,p_message_text=>'Premakni v'
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142530754498752412)
,p_name=>'MRU.ERROR_IN_MRD'
,p_message_language=>'sl'
,p_message_text=>unistr('Napaka v operaciji brisanja ve\010D vrstic: vrstica= %0, %1, %2')
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142529799724752412)
,p_name=>'MUST_NOT_BE_PUBLIC_USER'
,p_message_language=>'sl'
,p_message_text=>'Ne sme biti javni uporabnik'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142478310364752397)
,p_name=>'NAME'
,p_message_language=>'sl'
,p_message_text=>'Ime'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142543994583752416)
,p_name=>'NEW'
,p_message_language=>'sl'
,p_message_text=>'Novo'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142508289662752406)
,p_name=>'NEW_ACCOUNT_LOGIN_INSTRUCTIONS'
,p_message_language=>'sl'
,p_message_text=>unistr('V %0 se lahko prijavite tako, da obi\0161\010Dete:')
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142508314587752406)
,p_name=>'NEW_ACCOUNT_NOTIFICATION'
,p_message_language=>'sl'
,p_message_text=>unistr('\0160t. novih obvestil o ra\010Dunu: %0')
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142636903023752444)
,p_name=>'NEXT'
,p_message_language=>'sl'
,p_message_text=>'Naprej'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142554157647752419)
,p_name=>'NO'
,p_message_language=>'sl'
,p_message_text=>'Ne'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142651064571752449)
,p_name=>'NOBODY'
,p_message_language=>'sl'
,p_message_text=>unistr('nih\010De')
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142517265597752408)
,p_name=>'NOT'
,p_message_language=>'sl'
,p_message_text=>'Ne'
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142560190854752421)
,p_name=>'NOT_NULL'
,p_message_language=>'sl'
,p_message_text=>'Ni NULL'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142529891453752412)
,p_name=>'NOT_W_ARGUMENT'
,p_message_language=>'sl'
,p_message_text=>'Ni %0'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142549678977752418)
,p_name=>'NO_DATA_FOUND'
,p_message_language=>'sl'
,p_message_text=>unistr('podatkov ni bilo mogo\010De najti')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142559680654752421)
,p_name=>'NO_UPDATEABLE_REPORT_FOUND'
,p_message_language=>'sl'
,p_message_text=>unistr('Ni bilo mogo\010De najti poro\010Dila, ki bi ga bilo mogo\010De posodobiti. Ve\010D vrstic je bilo posodobljenih in operacije brisanja je mogo\010De izvajati samo na tabelarnih obrazcih tipa "Poro\010Dilo, ki ga je mogo\010De posodobiti".')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142560536201752421)
,p_name=>'OK'
,p_message_language=>'sl'
,p_message_text=>'V redu'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142555851111752420)
,p_name=>'ORACLE_APPLICATION_EXPRESS'
,p_message_language=>'sl'
,p_message_text=>'Oracle APEX'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142654735793752450)
,p_name=>'ORA_06550'
,p_message_language=>'sl'
,p_message_text=>'ORA-06550: vrstica %0, stolpec %1'
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142605659716752435)
,p_name=>'OUTDATED_BROWSER'
,p_message_language=>'sl'
,p_message_text=>unistr('Uporabljate zastarel spletni brskalnik. Za seznam podprtih brskalnikov glejte priro\010Dnik za namestitev Oracle APEX.')
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142500627370752403)
,p_name=>'OUT_OF_RANGE'
,p_message_language=>'sl'
,p_message_text=>unistr('Zahtevan je bil neveljaven nabor vrstic, izvorni podatki poro\010Dila so bili spremenjeni.')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142522646894752410)
,p_name=>'P.VALID_PAGE_ERR'
,p_message_language=>'sl'
,p_message_text=>unistr('Treba je navesti veljavno \0161tevilko strani, na primer p?n=1234.')
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142526874340752411)
,p_name=>'PAGINATION.NEXT'
,p_message_language=>'sl'
,p_message_text=>'Naprej'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142526916868752411)
,p_name=>'PAGINATION.NEXT_SET'
,p_message_language=>'sl'
,p_message_text=>'Naslednji nabor'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142527066041752411)
,p_name=>'PAGINATION.PREVIOUS'
,p_message_language=>'sl'
,p_message_text=>'Nazaj'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142527124901752411)
,p_name=>'PAGINATION.PREVIOUS_SET'
,p_message_language=>'sl'
,p_message_text=>unistr('Prej\0161nji nabor')
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142636833822752444)
,p_name=>'PAGINATION.SELECT'
,p_message_language=>'sl'
,p_message_text=>unistr('Izbira \0161tevil\010Denja strani')
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142566855424752423)
,p_name=>'PASSWORD'
,p_message_language=>'sl'
,p_message_text=>'Geslo'
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142507585464752405)
,p_name=>'PASSWORD_CHANGED'
,p_message_language=>'sl'
,p_message_text=>unistr('Va\0161e geslo za %0 je bilo spremenjeno.')
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142495247233752402)
,p_name=>'PASSWORD_COMPLEXITY_ERROR'
,p_message_language=>'sl'
,p_message_text=>'Geslo ne ustreza pravilom o zapletenosti gesla za to mesto.'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142494385174752402)
,p_name=>'PASSWORD_DIFFERS_BY_ERR'
,p_message_language=>'sl'
,p_message_text=>'Novo geslo se mora razlikovati od starega gesla za vsaj toliko znakov: %0.'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142494955378752402)
,p_name=>'PASSWORD_LIKE_USERNAME_ERR'
,p_message_language=>'sl'
,p_message_text=>unistr('Geslo ne sme vsebovati uporabni\0161kega imena.')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142495148615752402)
,p_name=>'PASSWORD_LIKE_WORDS_ERR'
,p_message_language=>'sl'
,p_message_text=>unistr('Geslo vsebuje prepovedano vzor\010Dno besedo.')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142495029821752402)
,p_name=>'PASSWORD_LIKE_WORKSPACE_NAME_ERR'
,p_message_language=>'sl'
,p_message_text=>'Geslo ne sme vsebovati imena delovnega prostora.'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142494299837752401)
,p_name=>'PASSWORD_MIN_LEN_ERR'
,p_message_language=>'sl'
,p_message_text=>'Geslo mora vsebovati vsaj toliko znakov: %0.'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142494438296752402)
,p_name=>'PASSWORD_ONE_ALPHA_ERR'
,p_message_language=>'sl'
,p_message_text=>'Geslo mora vsebovati vsaj en abecedni znak (%0).'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142494807359752402)
,p_name=>'PASSWORD_ONE_LOWER_ERR'
,p_message_language=>'sl'
,p_message_text=>unistr('Geslo mora vsebovati vsaj eno malo \010Drko.')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142494574065752402)
,p_name=>'PASSWORD_ONE_NUMERIC_ERR'
,p_message_language=>'sl'
,p_message_text=>unistr('Geslo mora vsebovati vsaj en \0161tevilski znak (0123456789).')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142494619866752402)
,p_name=>'PASSWORD_ONE_PUNCTUATION_ERR'
,p_message_language=>'sl'
,p_message_text=>unistr('Geslo mora vsebovati vsaj eno lo\010Dilo (%0).')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142494703603752402)
,p_name=>'PASSWORD_ONE_UPPER_ERR'
,p_message_language=>'sl'
,p_message_text=>unistr('Geslo mora vsebovati vsaj eno veliko \010Drko.')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142508066458752406)
,p_name=>'PASSWORD_RESET_NOTIFICATION'
,p_message_language=>'sl'
,p_message_text=>'Obvestilo o ponastavitvi gesla'
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142493112887752401)
,p_name=>'PASSWORD_REUSE_ERROR'
,p_message_language=>'sl'
,p_message_text=>unistr('Gesla ni dovoljeno uporabiti, ker je \017Ee bilo uporabljeno v zadnjih %0 dneh.')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142489875096752400)
,p_name=>'PCT_GRAPH_ARIA_LABEL'
,p_message_language=>'sl'
,p_message_text=>'Graf z odstotki'
,p_is_js_message=>true
,p_version_scn=>2705521
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142581424582752428)
,p_name=>'PE.COMPONEN.TYPE.PAGE_ITEM.PLURAL'
,p_message_language=>'sl'
,p_message_text=>'Elementi'
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142581556462752428)
,p_name=>'PE.COMPONEN.TYPE.PAGE_ITEM.SINGULAR'
,p_message_language=>'sl'
,p_message_text=>'Element'
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142555616933752420)
,p_name=>'PERCENT'
,p_message_language=>'sl'
,p_message_text=>'Odstotek'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142524944929752411)
,p_name=>'PLEASE_CONTACT_ADMINISTRATOR'
,p_message_language=>'sl'
,p_message_text=>'Obrnite se na skrbnika.'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142637086955752444)
,p_name=>'PREVIOUS'
,p_message_language=>'sl'
,p_message_text=>'Nazaj'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142573696432752425)
,p_name=>'PRINT'
,p_message_language=>'sl'
,p_message_text=>'Tiskanje'
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142554461114752419)
,p_name=>'PRIVILEGES'
,p_message_language=>'sl'
,p_message_text=>'Privilegiji'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142523002037752410)
,p_name=>'REGIOIN_REFERENCES'
,p_message_language=>'sl'
,p_message_text=>unistr('Reference podro\010Dja')
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142544017262752416)
,p_name=>'REPORT'
,p_message_language=>'sl'
,p_message_text=>unistr('Poro\010Dilo')
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142554355203752419)
,p_name=>'REPORTING_PERIOD'
,p_message_language=>'sl'
,p_message_text=>unistr('Obdobje poro\010Danja')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142637298187752444)
,p_name=>'REPORT_LABEL'
,p_message_language=>'sl'
,p_message_text=>unistr('Poro\010Dilo: %0')
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142555043367752420)
,p_name=>'REPORT_TOTAL'
,p_message_language=>'sl'
,p_message_text=>unistr('Skupna vsota poro\010Dila')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142500777176752403)
,p_name=>'RESET'
,p_message_language=>'sl'
,p_message_text=>unistr('Ponastavitev \0161tevil\010Denja strani')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142529486787752412)
,p_name=>'RESET_PAGINATION'
,p_message_language=>'sl'
,p_message_text=>unistr('Ponastavitev \0161tevil\010Denja strani')
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142559552798752421)
,p_name=>'RESET_PASSWORD'
,p_message_language=>'sl'
,p_message_text=>'Ponastavitev gesla'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142535369688752414)
,p_name=>'RESTORE'
,p_message_language=>'sl'
,p_message_text=>'Obnovi'
,p_is_js_message=>true
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142568913762752424)
,p_name=>'RESULTS'
,p_message_language=>'sl'
,p_message_text=>'Rezultati'
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142560681400752421)
,p_name=>'RETURN_TO_APPLICATION'
,p_message_language=>'sl'
,p_message_text=>'Nazaj na aplikacijo.'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142561033188752421)
,p_name=>'RIGHT'
,p_message_language=>'sl'
,p_message_text=>'Desno'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142593007014752431)
,p_name=>'ROW'
,p_message_language=>'sl'
,p_message_text=>'Vrstica %0'
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142543616566752416)
,p_name=>'ROW_COUNT'
,p_message_language=>'sl'
,p_message_text=>unistr('\0160tevilo vrstic')
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142433460327752383)
,p_name=>'RW_AO_ASK_ORACLE'
,p_message_language=>'sl'
,p_message_text=>unistr('Vpra\0161ajte Oracle')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142433703152752384)
,p_name=>'RW_AO_CLOSE_ASK_ORACLE'
,p_message_language=>'sl'
,p_message_text=>unistr('Zapri Vpra\0161ajte Oracle')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142434087446752384)
,p_name=>'RW_AO_NOTIFICATIONS_LIST'
,p_message_language=>'sl'
,p_message_text=>'Seznam obvestil'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142433649666752384)
,p_name=>'RW_AO_OPEN_ASK_ORACLE'
,p_message_language=>'sl'
,p_message_text=>unistr('Odpri Vpra\0161ajte Oracle')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142433916007752384)
,p_name=>'RW_AO_PRODUCT_MAP'
,p_message_language=>'sl'
,p_message_text=>'Preslikava izdelka'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142433821085752384)
,p_name=>'RW_AO_SUGGESTIONS_LIST'
,p_message_language=>'sl'
,p_message_text=>'Seznam predlogov'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142434760972752384)
,p_name=>'RW_CLEAR'
,p_message_language=>'sl'
,p_message_text=>unistr('Po\010Disti')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142434681267752384)
,p_name=>'RW_CLOSE'
,p_message_language=>'sl'
,p_message_text=>'Zapri'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142434444877752384)
,p_name=>'RW_FO_VIEW_MORE'
,p_message_language=>'sl'
,p_message_text=>unistr('Ogled ve\010D')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142434857693752384)
,p_name=>'RW_GO_TO'
,p_message_language=>'sl'
,p_message_text=>'Pojdi na'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142434205897752384)
,p_name=>'RW_GP_STEP'
,p_message_language=>'sl'
,p_message_text=>'Korak'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142434305920752384)
,p_name=>'RW_GP_STEP_OF'
,p_message_language=>'sl'
,p_message_text=>'od'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142434167012752384)
,p_name=>'RW_GP_TOGGLE_STEPS'
,p_message_language=>'sl'
,p_message_text=>'Preklop prikaza korakov'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142433266790752383)
,p_name=>'RW_HIDE_PASSWORD'
,p_message_language=>'sl'
,p_message_text=>'Skrij geslo'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142434597735752384)
,p_name=>'RW_OPEN'
,p_message_language=>'sl'
,p_message_text=>'Odpri'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142433040491752383)
,p_name=>'RW_ORACLE'
,p_message_language=>'sl'
,p_message_text=>'Oracle'
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142433121223752383)
,p_name=>'RW_SHOW_PASSWORD'
,p_message_language=>'sl'
,p_message_text=>unistr('Prika\017Ei geslo')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142434981063752384)
,p_name=>'RW_START'
,p_message_language=>'sl'
,p_message_text=>unistr('Za\010Detek')
,p_is_js_message=>true
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142560044655752421)
,p_name=>'SAVE'
,p_message_language=>'sl'
,p_message_text=>'Shrani'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142556251003752420)
,p_name=>'SAVED_REPORTS.ALTERNATIVE.DEFAULT'
,p_message_language=>'sl'
,p_message_text=>'Nadomestno privzeto'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142556644214752420)
,p_name=>'SAVED_REPORTS.DESCRIPTION'
,p_message_language=>'sl'
,p_message_text=>'Opis'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142556162981752420)
,p_name=>'SAVED_REPORTS.PRIMARY.DEFAULT'
,p_message_language=>'sl'
,p_message_text=>'Primarno privzeto'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142556945570752420)
,p_name=>'SC_REPORT_ROWS'
,p_message_language=>'sl'
,p_message_text=>unistr('Na voljo je ve\010D kot toliko vrstic: %0. Pove\010Dajte izbirnik vrstic za ogled ve\010D vrstic.')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142624335027752440)
,p_name=>'SEARCH'
,p_message_language=>'sl'
,p_message_text=>'Iskanje'
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142515857095752408)
,p_name=>'SECONDS'
,p_message_language=>'sl'
,p_message_text=>'sekunde'
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142555799792752420)
,p_name=>'SEE_ATTACHED'
,p_message_language=>'sl'
,p_message_text=>'Glejte prilogo'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142616396516752438)
,p_name=>'SELECT_ROW'
,p_message_language=>'sl'
,p_message_text=>'Izbira vrstice'
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142555498661752420)
,p_name=>'SET_SCREEN_READER_MODE_OFF'
,p_message_language=>'sl'
,p_message_text=>unistr('Izklop na\010Dina bralnika zaslona')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142555598101752420)
,p_name=>'SET_SCREEN_READER_MODE_ON'
,p_message_language=>'sl'
,p_message_text=>unistr('Vklop na\010Dina bralnika zaslona')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142551749516752419)
,p_name=>'SHOW'
,p_message_language=>'sl'
,p_message_text=>'Prikaz'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142618131993752439)
,p_name=>'SHOW_ALL'
,p_message_language=>'sl'
,p_message_text=>unistr('Prika\017Ei vse')
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142642994783752446)
,p_name=>'SIGN_IN'
,p_message_language=>'sl'
,p_message_text=>'Vpis'
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142593858011752431)
,p_name=>'SIGN_OUT'
,p_message_language=>'sl'
,p_message_text=>'Odjava'
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142544654846752416)
,p_name=>'SINCE_DAYS_AGO'
,p_message_language=>'sl'
,p_message_text=>'Pred toliko dnevi: %0'
,p_is_js_message=>true
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142552244580752419)
,p_name=>'SINCE_DAYS_FROM_NOW'
,p_message_language=>'sl'
,p_message_text=>'Toliko dni od tega trenutka: %0'
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142544587190752416)
,p_name=>'SINCE_HOURS_AGO'
,p_message_language=>'sl'
,p_message_text=>'Pred toliko urami: %0'
,p_is_js_message=>true
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142552190439752419)
,p_name=>'SINCE_HOURS_FROM_NOW'
,p_message_language=>'sl'
,p_message_text=>'Toliko ur od tega trenutka: %0'
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142544462429752416)
,p_name=>'SINCE_MINUTES_AGO'
,p_message_language=>'sl'
,p_message_text=>'Pred toliko minutami: %0'
,p_is_js_message=>true
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142552030369752419)
,p_name=>'SINCE_MINUTES_FROM_NOW'
,p_message_language=>'sl'
,p_message_text=>'Toliko minut od tega trenutka: %0'
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142544882707752417)
,p_name=>'SINCE_MONTHS_AGO'
,p_message_language=>'sl'
,p_message_text=>'Pred toliko meseci: %0'
,p_is_js_message=>true
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142552400178752419)
,p_name=>'SINCE_MONTHS_FROM_NOW'
,p_message_language=>'sl'
,p_message_text=>'Toliko mesecev od tega trenutka: %0'
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142552653636752419)
,p_name=>'SINCE_NOW'
,p_message_language=>'sl'
,p_message_text=>'Zdaj'
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142544341655752416)
,p_name=>'SINCE_SECONDS_AGO'
,p_message_language=>'sl'
,p_message_text=>'Pred toliko sekundami: %0'
,p_is_js_message=>true
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142551978324752419)
,p_name=>'SINCE_SECONDS_FROM_NOW'
,p_message_language=>'sl'
,p_message_text=>'Toliko sekund od tega trenutka: %0'
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142544712990752417)
,p_name=>'SINCE_WEEKS_AGO'
,p_message_language=>'sl'
,p_message_text=>'Pred toliko tedni: %0'
,p_is_js_message=>true
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142552364975752419)
,p_name=>'SINCE_WEEKS_FROM_NOW'
,p_message_language=>'sl'
,p_message_text=>'Toliko tednov od tega trenutka: %0'
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142544952306752417)
,p_name=>'SINCE_YEARS_AGO'
,p_message_language=>'sl'
,p_message_text=>'Pred toliko leti: %0'
,p_is_js_message=>true
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142552519308752419)
,p_name=>'SINCE_YEARS_FROM_NOW'
,p_message_language=>'sl'
,p_message_text=>'Toliko let od tega trenutka: %0'
,p_is_js_message=>true
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142538447640752415)
,p_name=>'STANDARD'
,p_message_language=>'sl'
,p_message_text=>'Standardno'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142555397370752420)
,p_name=>'START_DATE'
,p_message_language=>'sl'
,p_message_text=>unistr('Datum za\010Detka')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142490558446752400)
,p_name=>'SUBSCRIPTION_CREATED_BY'
,p_message_language=>'sl'
,p_message_text=>unistr('To e-po\0161tno sporo\010Dilo ste prejeli iz naro\010Dnine na interaktivno poro\010Dilo, ki jo je ustvaril(-a) %0.')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142652166252752449)
,p_name=>'SUBSCRIPTION_REFERENCES'
,p_message_language=>'sl'
,p_message_text=>unistr('Naro\010Dnine')
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142601559296752434)
,p_name=>'TAB'
,p_message_language=>'sl'
,p_message_text=>'Zavihek'
,p_version_scn=>2705544
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142515783680752408)
,p_name=>'TITLE'
,p_message_language=>'sl'
,p_message_text=>'Naslov'
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142495403989752402)
,p_name=>'TODAY'
,p_message_language=>'sl'
,p_message_text=>'Danes'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142554964601752420)
,p_name=>'TOTAL'
,p_message_language=>'sl'
,p_message_text=>'Skupaj'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142496728699752402)
,p_name=>'TO_MANY_COLUMNS_SELECTED'
,p_message_language=>'sl'
,p_message_text=>unistr('Izbrati je mogo\010De maksimalno toliko stolpcev: %0.')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142452513747752389)
,p_name=>'TREE.COLLAPSE_ALL'
,p_message_language=>'sl'
,p_message_text=>'Strni vse'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142453101188752389)
,p_name=>'TREE.COLLAPSE_ALL_BELOW'
,p_message_language=>'sl'
,p_message_text=>'Strni vse spodnje'
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142452114713752389)
,p_name=>'TREE.EXPAND_ALL'
,p_message_language=>'sl'
,p_message_text=>unistr('Raz\0161iri vse')
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142452872142752389)
,p_name=>'TREE.EXPAND_ALL_BELOW'
,p_message_language=>'sl'
,p_message_text=>unistr('Raz\0161iri vse spodnje')
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142453373103752389)
,p_name=>'TREE.REPARENT'
,p_message_language=>'sl'
,p_message_text=>unistr('Ponovna dolo\010Ditev nadrejenega')
,p_is_js_message=>true
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142575470315752426)
,p_name=>'TREES'
,p_message_language=>'sl'
,p_message_text=>'Drevesa'
,p_version_scn=>2705538
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142618258736752439)
,p_name=>'UI.FORM.REQUIRED'
,p_message_language=>'sl'
,p_message_text=>'Zahtevano'
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142539167146752415)
,p_name=>'UNAUTHORIZED'
,p_message_language=>'sl'
,p_message_text=>'Neodobreno'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142589343040752430)
,p_name=>'UNAVAILABLE'
,p_message_language=>'sl'
,p_message_text=>'Ni na voljo'
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142553041773752419)
,p_name=>'UNKNOWN'
,p_message_language=>'sl'
,p_message_text=>'Neznano'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142491458833752401)
,p_name=>'UNKNOWN_AUTHENTICATION_ERROR'
,p_message_language=>'sl'
,p_message_text=>unistr('Pri\0161lo je do neprepoznane napake preverjanja pristnosti.')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142493665067752401)
,p_name=>'UNSUBSCRIBE_SUBSCRIPTION_MSG_HTML'
,p_message_language=>'sl'
,p_message_text=>unistr('\010Ce ne \017Eelite ve\010D prejemati e-po\0161tnih sporo\010Dil, za upravljanje svoje naro\010Dnine kliknite <a href="%0">Odjavi</a>.')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142490423427752400)
,p_name=>'UNSUBSCRIBE_SUBSCRIPTION_MSG_TXT'
,p_message_language=>'sl'
,p_message_text=>unistr('\010Ce ne \017Eelite ve\010D prejemati e-po\0161tnih sporo\010Dil, za upravljanje svoje naro\010Dnine obi\0161\010Dite naslednji URL:')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142529992855752412)
,p_name=>'UNSUPPORTED_DATA_TYPE'
,p_message_language=>'sl'
,p_message_text=>'nepodprt podatkovni tip'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142517059066752408)
,p_name=>'UPDATE'
,p_message_language=>'sl'
,p_message_text=>'posodobitev'
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142515657444752408)
,p_name=>'UPDATED'
,p_message_language=>'sl'
,p_message_text=>'Posodobljeno'
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142458878599752391)
,p_name=>'UPGRADE_IN_PROGRESS'
,p_message_language=>'sl'
,p_message_text=>'Nadgradnja v teku'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142459161446752391)
,p_name=>'UPGRADE_IN_PROGRESS_DETAIL'
,p_message_language=>'sl'
,p_message_text=>unistr('Oracle APEX se nadgrajuje na novej\0161o verzijo. Ta proces na splo\0161no traja do 3 minute.')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142522420610752410)
,p_name=>'URL_PROHIBITED'
,p_message_language=>'sl'
,p_message_text=>'Zahtevani URL je bil prepovedan. Obrnite se na svojega skrbnika.'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142543558083752416)
,p_name=>'USER'
,p_message_language=>'sl'
,p_message_text=>'Uporabnik'
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142566794203752423)
,p_name=>'USERNAME'
,p_message_language=>'sl'
,p_message_text=>unistr('Uporabni\0161ko ime')
,p_version_scn=>2705536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142608176439752436)
,p_name=>'USERNAME_TOO_LONG'
,p_message_language=>'sl'
,p_message_text=>unistr('Uporabni\0161ko ime je predolgo. Omejitev je %0 znakov.')
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142550675759752418)
,p_name=>'USERS'
,p_message_language=>'sl'
,p_message_text=>'uporabniki'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142607793063752435)
,p_name=>'USER_EXISTS'
,p_message_language=>'sl'
,p_message_text=>unistr('Uporabni\0161ko ime \017Ee obstaja.')
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142621593558752440)
,p_name=>'USER_PROFILE_IMAGE'
,p_message_language=>'sl'
,p_message_text=>'Slika profila za uporabnika %0'
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142483404786752398)
,p_name=>'UTILIZATION_REPORTS.AUTOMATION'
,p_message_language=>'sl'
,p_message_text=>'Avtomatizacija - %0'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142481953011752398)
,p_name=>'UTILIZATION_REPORTS.PAGE'
,p_message_language=>'sl'
,p_message_text=>'Stran %0- %1 '
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142484882977752399)
,p_name=>'UTILIZATION_REPORTS.PLUG_NAME'
,p_message_language=>'sl'
,p_message_text=>'%0 - %1'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142484914209752399)
,p_name=>'UTILIZATION_REPORTS.PROCESS_NAME'
,p_message_language=>'sl'
,p_message_text=>'%0 - %1'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142483879782752398)
,p_name=>'UTILIZATION_REPORTS.SEARCH_CONFIG'
,p_message_language=>'sl'
,p_message_text=>'Konfiguracija iskanja - %0'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142483783135752398)
,p_name=>'UTILIZATION_REPORTS.SHARED_DYNAMIC_LOV'
,p_message_language=>'sl'
,p_message_text=>unistr('Deljeni dinami\010Dni seznam vrednosti - %0')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142483576995752398)
,p_name=>'UTILIZATION_REPORTS.TASK_DEFINITION'
,p_message_language=>'sl'
,p_message_text=>'Definicija naloge - %0'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142482025830752398)
,p_name=>'UTILIZATION_REPORTS.WORKFLOW'
,p_message_language=>'sl'
,p_message_text=>'Delovni tok - %0'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142504159436752404)
,p_name=>'VALID'
,p_message_language=>'sl'
,p_message_text=>'Veljavno'
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142495703033752402)
,p_name=>'VALIDATIONS'
,p_message_language=>'sl'
,p_message_text=>'Preverjanja'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142556481595752420)
,p_name=>'VALUE_MUST_BE_SPECIFIED'
,p_message_language=>'sl'
,p_message_text=>unistr('Vrednost mora biti dolo\010Dena')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142602710278752434)
,p_name=>'VALUE_MUST_BE_SPECIFIED_FOR'
,p_message_language=>'sl'
,p_message_text=>unistr('Vrednost mora biti dolo\010Dena za %0')
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142525360720752411)
,p_name=>'VERTICAL'
,p_message_language=>'sl'
,p_message_text=>unistr('navpi\010Dno')
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142516922172752408)
,p_name=>'VIEW'
,p_message_language=>'sl'
,p_message_text=>'ogled'
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142550788746752418)
,p_name=>'VIEWS'
,p_message_language=>'sl'
,p_message_text=>'pogledi'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142557245259752420)
,p_name=>'VIEW_ALL'
,p_message_language=>'sl'
,p_message_text=>'Ogled vsega'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142497106986752402)
,p_name=>'VISUALLY_HIDDEN_LINK'
,p_message_language=>'sl'
,p_message_text=>'Vizualno skrita povezava'
,p_is_js_message=>true
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142537975705752415)
,p_name=>'WARNING'
,p_message_language=>'sl'
,p_message_text=>'Opozorilo'
,p_is_js_message=>true
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142516594119752408)
,p_name=>'WEEK'
,p_message_language=>'sl'
,p_message_text=>'teden'
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142512468283752407)
,p_name=>'WEEKLY'
,p_message_language=>'sl'
,p_message_text=>'Tedensko'
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142516614342752408)
,p_name=>'WEEKS'
,p_message_language=>'sl'
,p_message_text=>'tedni'
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142556563952752420)
,p_name=>'WELCOME_USER'
,p_message_language=>'sl'
,p_message_text=>unistr('Dobrodo\0161li: %0')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142554769818752420)
,p_name=>'WWV_DBMS_SQL.INVALID_CLOB'
,p_message_language=>'sl'
,p_message_text=>'Najdena je bila neveljavna vrednost, preverite vnesene podatke.'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142554836603752420)
,p_name=>'WWV_DBMS_SQL.INVALID_DATATYPE'
,p_message_language=>'sl'
,p_message_text=>'Najdena je bila neveljavna vrednost, preverite vnesene podatke.'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142492623032752401)
,p_name=>'WWV_DBMS_SQL.INVALID_DATE'
,p_message_language=>'sl'
,p_message_text=>'Najdena je bila neveljavna vrednost datuma, preverite format datuma.'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142554689547752419)
,p_name=>'WWV_DBMS_SQL.INVALID_NUMBER'
,p_message_language=>'sl'
,p_message_text=>unistr('Najdena je bila neveljavna vrednost \0161tevilke, preverite format \0161tevilke.')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142503784457752404)
,p_name=>'WWV_DBMS_SQL.INVALID_TIMESTAMP'
,p_message_language=>'sl'
,p_message_text=>unistr('Najdena je bila neveljavna vrednost \010Dasovnega \017Eiga, preverite format \010Dasovnega \017Eiga.')
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142528259241752412)
,p_name=>'WWV_DBMS_SQL.UNABLE_TO_BIND_ERR'
,p_message_language=>'sl'
,p_message_text=>unistr('Ni mogo\010De vezati "%0". Uporabite dvojne narekovaje za elemente iz ve\010D bajtov ali preverite, ali je dol\017Eina elementa 30 bajtov ali manj. Za sklicevanje na elemente, dalj\0161e od 30 bajtov, uporabite sintakso v().')
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142518004480752409)
,p_name=>'WWV_FLOW.ACCESS_DENIED'
,p_message_language=>'sl'
,p_message_text=>'Dostop zavrnilo varnostno preverjanje %0'
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142520564733752409)
,p_name=>'WWV_FLOW.APP_NOT_AVAILABLE'
,p_message_language=>'sl'
,p_message_text=>'Aplikacija ni na voljo'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142518958695752409)
,p_name=>'WWV_FLOW.APP_NOT_FOUND_ERR'
,p_message_language=>'sl'
,p_message_text=>unistr('Aplikacije ni bilo mogo\010De najti.')
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142519068677752409)
,p_name=>'WWV_FLOW.APP_NOT_FOUND_FOOTER_ERR'
,p_message_language=>'sl'
,p_message_text=>'aplikacija=%0  delovni prostor=%1'
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142519412814752409)
,p_name=>'WWV_FLOW.APP_RESTRICTED'
,p_message_language=>'sl'
,p_message_text=>'Dostop do te aplikacije je omejen, poskusite znova pozneje.'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142519369197752409)
,p_name=>'WWV_FLOW.APP_RESTRICTED_TO_DEV'
,p_message_language=>'sl'
,p_message_text=>'Dostop do te aplikacije je omejen na razvijalce aplikacij, poskusite znova pozneje.'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142518503706752409)
,p_name=>'WWV_FLOW.BRANCH_FUNC_RETURNING_URL_ERROR'
,p_message_language=>'sl'
,p_message_text=>unistr('ERR-7744 Ni mogo\010De obdelati veje do funkcije, ki vrne URL.')
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142518424361752409)
,p_name=>'WWV_FLOW.BRANCH_TO_FUNCT_RET_PAGE_ERR'
,p_message_language=>'sl'
,p_message_text=>unistr('ERR-7744 Ni mogo\010De obdelati veje do funkcije, ki vrne stran.')
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142518700615752409)
,p_name=>'WWV_FLOW.CALL_TO_SHOW_FROM_PROC_ERR'
,p_message_language=>'sl'
,p_message_text=>'ERR-1430 Klic za prikaz iz obdelave strani ni podprt: G_FLOW_STEP_ID (%0).'
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142519865578752409)
,p_name=>'WWV_FLOW.CLEAR_STEP_CACHE_ERR'
,p_message_language=>'sl'
,p_message_text=>unistr('ERR-1018 Napaka pri \010Di\0161\010Denju predpomnilnika.')
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142518243757752409)
,p_name=>'WWV_FLOW.COMP_UNKNOWN_ERR'
,p_message_language=>'sl'
,p_message_text=>unistr('ERR-1005 Neznan tip izra\010Duna.')
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142519197632752409)
,p_name=>'WWV_FLOW.CUSTOM_AUTH_SESSION_ERR'
,p_message_language=>'sl'
,p_message_text=>'ERR-1201 ID seje ni nastavljen za prilagojeno preverjanje pristnosti.'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142519276930752409)
,p_name=>'WWV_FLOW.CUSTOM_AUTH_SESSION_FOOTER_ERR'
,p_message_language=>'sl'
,p_message_text=>'stran=%0'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142518833473752409)
,p_name=>'WWV_FLOW.DET_COMPANY_ERR'
,p_message_language=>'sl'
,p_message_text=>unistr('ERR-7620 Ni bilo mogo\010De dolo\010Diti delovnega prostora za aplikacijo (%0).')
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142499355009752403)
,p_name=>'WWV_FLOW.EDIT'
,p_message_language=>'sl'
,p_message_text=>'Uredi'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142517972592752409)
,p_name=>'WWV_FLOW.FIND_ITEM_ERR2'
,p_message_language=>'sl'
,p_message_text=>unistr('ERR-1802 Ni mogo\010De najti ID-ja elementa "%0"')
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142517655569752408)
,p_name=>'WWV_FLOW.FIND_ITEM_ID_ERR'
,p_message_language=>'sl'
,p_message_text=>unistr('ERR-1002 Ni mogo\010De poiskati ID-ja elementa za element "%0" v aplikaciji "%1".')
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142517797968752408)
,p_name=>'WWV_FLOW.FIND_ITEM_ID_ERR2'
,p_message_language=>'sl'
,p_message_text=>unistr('Nepri\010Dakovana napaka, ni mogo\010De poiskati imena elementa na ravni aplikacije ali strani.')
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142518114491752409)
,p_name=>'WWV_FLOW.FIRST_PAGE_DATA_ERR'
,p_message_language=>'sl'
,p_message_text=>unistr('Ste \017Ee na prvi strani podatkov.')
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142534633533752414)
,p_name=>'WWV_FLOW.ITEM_POSTING_VIOLATION'
,p_message_language=>'sl'
,p_message_text=>unistr('ID elementa (%0) ni element, dolo\010Den na trenutni strani.')
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142492256393752401)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.INTERNAL_ONLY'
,p_message_language=>'sl'
,p_message_text=>unistr('Elementa ni mogo\010De nastaviti s podajanjem argumentov aplikaciji.')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142492503601752401)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.NO_CHECKSUM'
,p_message_language=>'sl'
,p_message_text=>'(Navedena ni bila nobena vrednost kontrolne vsote)'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142492074377752401)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.PRIVATE_BOOKMARK'
,p_message_language=>'sl'
,p_message_text=>unistr('Element je mogo\010De nastaviti, ko ga spremlja vrednost kontrolne vsote "user-level bookmark".')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142491941724752401)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.PUBLIC_BOOKMARK'
,p_message_language=>'sl'
,p_message_text=>unistr('Element je mogo\010De nastaviti, ko ga spremlja vrednost kontrolne vsote "application-level bookmark".')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142492100324752401)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.SESSION'
,p_message_language=>'sl'
,p_message_text=>unistr('Element je mogo\010De nastaviti, ko ga spremlja vrednost kontrolne vsote "session".')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142491815844752401)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.UNPROTECTED'
,p_message_language=>'sl'
,p_message_text=>unistr('Element nima za\0161\010Dite.')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142519986075752409)
,p_name=>'WWV_FLOW.NO_PAGE_HELP'
,p_message_language=>'sl'
,p_message_text=>unistr('Pomo\010D za stran ni na voljo.')
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142507862049752406)
,p_name=>'WWV_FLOW.NO_PRIV_ON_SCHEMA'
,p_message_language=>'sl'
,p_message_text=>unistr('Delovni prostor %0 nima pravic za raz\010Dlenjevanje kot shema %1.')
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142518309756752409)
,p_name=>'WWV_FLOW.PAGE_ACCEPT_RECUR_ERR'
,p_message_language=>'sl'
,p_message_text=>unistr('ERR-1010 Prese\017Eena je bila omejitev rekurzije obdelave veje do sprejetja strani. %0')
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142474830556752396)
,p_name=>'WWV_FLOW.PAGE_PATTERN_NOT_RUNNABLE'
,p_message_language=>'sl'
,p_message_text=>unistr('Stran ni na voljo, vzorca strani ni mogo\010De zagnati.')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142492417604752401)
,p_name=>'WWV_FLOW.PAGE_PROTECTION.SHOW_NO_URL_ALLOWED'
,p_message_language=>'sl'
,p_message_text=>unistr('Te strani ni mogo\010De priklicati z URL-jem ali z uporabo GET ali POST za postopek prikaza, priklicati jo morate s tipom veje "Branch to Page".')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142577220321752426)
,p_name=>'WWV_FLOW.SAVE_ROUTINE_NUMERIC_ERR'
,p_message_language=>'sl'
,p_message_text=>unistr('Napaka pri poskusu shranjevanja ne\0161tevilske vrednosti v elementu %0. ')
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142509507797752406)
,p_name=>'WWV_FLOW.SCHEMA_NOT_EXISTS'
,p_message_language=>'sl'
,p_message_text=>unistr('Shema raz\010Dlenjevanja aplikacije "%0" ne obstaja v bazi podatkov.')
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142509604991752406)
,p_name=>'WWV_FLOW.SERVICE_ADMIN_LINK'
,p_message_language=>'sl'
,p_message_text=>unistr('Ra\010Dune v delovnem prostoru INTERNAL je mogo\010De uporabiti samo za dostop do elementa &PRODUCT_NAME. <a href="%0">Skrbni\0161ke storitve</a>.')
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142517575158752408)
,p_name=>'WWV_FLOW.SESSION_INFO_ERR'
,p_message_language=>'sl'
,p_message_text=>unistr('ERR-1029 Ni mogo\010De shraniti informacij seje.  seja=%0 element=%1')
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142520605788752409)
,p_name=>'WWV_FLOW.UNABLE_TO_STOP_TRACE_ERR'
,p_message_language=>'sl'
,p_message_text=>unistr('Sledenja ni bilo mogo\010De zaustaviti: %0')
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142517870076752409)
,p_name=>'WWV_FLOW.UNEXPECTED_ERR'
,p_message_language=>'sl'
,p_message_text=>unistr('Nepri\010Dakovana napaka')
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142528647660752412)
,p_name=>'WWV_FLOW.UPDATE_SUB_ERR'
,p_message_language=>'sl'
,p_message_text=>'Napaka v update_substitution_cache: %0'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142520781390752409)
,p_name=>'WWV_FLOW.VIEW_HELP_ERR'
,p_message_language=>'sl'
,p_message_text=>unistr('Za ogled pomo\010Di je treba navesti aplikacijo in stran.')
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142542447674752416)
,p_name=>'WWV_FLOW_AUTOMATION.AUTOMATION_NOT_FOUND'
,p_message_language=>'sl'
,p_message_text=>unistr('Avtomatizacije ni bilo mogo\010De najti.')
,p_version_scn=>2705531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142477965226752397)
,p_name=>'WWV_FLOW_AUTOMATION.QUERY_ERROR'
,p_message_language=>'sl'
,p_message_text=>'Napaka poizvedbe za avtomatizacijo: %0'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142521859915752410)
,p_name=>'WWV_FLOW_CACHE.PURGE_SESSION'
,p_message_language=>'sl'
,p_message_text=>unistr('\0160tevilo po\010Di\0161\010Denih sej: %0.')
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142463115478752392)
,p_name=>'WWV_FLOW_CODE_EXEC_MLE.LANGUAGE_NOT_SUPPORTED'
,p_message_language=>'sl'
,p_message_text=>unistr('Ni mogo\010De izvr\0161iti kode %0! Baza podatkov je ne podpira ali pa je ne omogo\010Da parameter instance MLE_LANGUAGES.')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142460728828752392)
,p_name=>'WWV_FLOW_CODE_EXEC_MLE.MLE_NOT_SUPPORTED'
,p_message_language=>'sl'
,p_message_text=>'Multilingual Engine ni na voljo v tej verziji baze podatkov!'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142499932387752403)
,p_name=>'WWV_FLOW_COLLECTION.ARRAY_NOT_NULL'
,p_message_language=>'sl'
,p_message_text=>'Polje zbirke aplikacij ne sme biti NULL'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142499783173752403)
,p_name=>'WWV_FLOW_COLLECTION.ATTRIBUTE_NUMBER_OUTSIDE_RANGE'
,p_message_language=>'sl'
,p_message_text=>unistr('Navedena \0161tevilka atributa \010Dlana %0 je neveljavna.  \0160tevilka atributa mora biti med 1 in %1')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142500210818752403)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_EXISTS'
,p_message_language=>'sl'
,p_message_text=>'Zbirka aplikacij obstaja'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142500023311752403)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NAME_NOT_NULL'
,p_message_language=>'sl'
,p_message_text=>'Ime zbirke ne sme biti NULL'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142500194845752403)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NAME_TOO_LARGE'
,p_message_language=>'sl'
,p_message_text=>unistr('Ime zbirke ne sme biti dalj\0161e od 255 znakov')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142499529153752403)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NOT_EXIST'
,p_message_language=>'sl'
,p_message_text=>'Zbirka aplikacij %0 ne obstaja'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142500332486752403)
,p_name=>'WWV_FLOW_COLLECTION.CURSOR_NOT_OPEN'
,p_message_language=>'sl'
,p_message_text=>unistr('Kazalec \0161e ni odprt')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142499630789752403)
,p_name=>'WWV_FLOW_COLLECTION.MEMBER_NOT_EXIST'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Zaporedje \010Dlanov %0 ne obstaja v zbirki aplikacij %1'),
''))
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142499853312752403)
,p_name=>'WWV_FLOW_COLLECTION.MEMBER_SEQUENCE_NUMBER_INVALID'
,p_message_language=>'sl'
,p_message_text=>unistr('Zaporedje \010Dlanov %0 ne obstaja v zbirki aplikacij "%1"')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142452676296752389)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_ALGORITHM'
,p_message_language=>'sl'
,p_message_text=>'Algoritem %0 ni podprt za ECDSA.'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142452355280752389)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_EC_CURVE'
,p_message_language=>'sl'
,p_message_text=>unistr('Elipti\010Dna krivulja %0 ni podprta.')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142578039970752427)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_FUNCTION'
,p_message_language=>'sl'
,p_message_text=>'Kriptografska funkcija "%0" ni podprta v tem sistemu.'
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142630324700752442)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_ACCESSIBLE'
,p_message_language=>'sl'
,p_message_text=>'Dostopnost testirana'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142521395445752410)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_CLOSE'
,p_message_language=>'sl'
,p_message_text=>'Zapri'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142521479642752410)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_CUST_OPT'
,p_message_language=>'sl'
,p_message_text=>unistr('Mo\017Enosti prilagajanja strani')
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142521553406752410)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_DEFAULT'
,p_message_language=>'sl'
,p_message_text=>'Privzeto'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142521636856752410)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_DISP'
,p_message_language=>'sl'
,p_message_text=>'Prikazano'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142521721566752410)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_HIDDEN'
,p_message_language=>'sl'
,p_message_text=>'Skrito'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142521164020752409)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE1'
,p_message_language=>'sl'
,p_message_text=>unistr('Preverite podro\010Dja, ki jih \017Eelite vklju\010Diti na to stran.  Preverjena podro\010Dja se morda ne bodo prikazala, \010De niste v ustreznem kontekstu aplikacije ali nimate ustreznih privilegijev.')
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142521211897752410)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE2'
,p_message_language=>'sl'
,p_message_text=>unistr('Te strani ni mogo\010De prilagoditi.')
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142630606130752442)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE3'
,p_message_language=>'sl'
,p_message_text=>'Videz te aplikacije lahko prilagodite tako, da spremenite slog teme. Izberite slog teme s spodnjega seznama in kliknite Dodeli spremembe.'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142631429323752443)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_REGION_DISP'
,p_message_language=>'sl'
,p_message_text=>unistr('Prikaz podro\010Dja')
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142630569021752442)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_REMOVE_STYLE'
,p_message_language=>'sl'
,p_message_text=>'Uporabi privzeti slog aplikacije'
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142630411708752442)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_THEME_STYLE'
,p_message_language=>'sl'
,p_message_text=>'Videz '
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142574625566752426)
,p_name=>'WWV_FLOW_DATA_EXPORT.AGG_COLUMN_IDX_NOT_EXIST'
,p_message_language=>'sl'
,p_message_text=>unistr('Indeks stolpcev s sklicem v zdru\017Eevanju %0 ne obstaja.')
,p_version_scn=>2705538
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142467320662752393)
,p_name=>'WWV_FLOW_DATA_EXPORT.APPEND_NOT_SUPPORTED'
,p_message_language=>'sl'
,p_message_text=>'Dodajanje izvoza podatkov ni podprto za format %0.'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142430311411752383)
,p_name=>'WWV_FLOW_DATA_EXPORT.CLOB_NOT_SUPPORTED'
,p_message_language=>'sl'
,p_message_text=>'Izhod CLOB ni podprt za format %0.'
,p_version_scn=>2705512
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142574394564752425)
,p_name=>'WWV_FLOW_DATA_EXPORT.COLUMN_BREAK_MUST_BE_IN_THE_BEGGINING'
,p_message_language=>'sl'
,p_message_text=>unistr('Prelom stolpca mora biti na za\010Detku polja stolpcev.')
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142574439456752425)
,p_name=>'WWV_FLOW_DATA_EXPORT.COLUMN_GROUP_IDX_NOT_EXIST'
,p_message_language=>'sl'
,p_message_text=>'Indeks skupine stolpcev s sklicem v %0 ne obstaja.'
,p_version_scn=>2705538
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142481534005752398)
,p_name=>'WWV_FLOW_DATA_EXPORT.EXPORT'
,p_message_language=>'sl'
,p_message_text=>'izvoz'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142488716082752400)
,p_name=>'WWV_FLOW_DATA_EXPORT.FORMAT_MUST_BE_XML'
,p_message_language=>'sl'
,p_message_text=>unistr('Format izvoza mora biti XML, ki uporablja ORDS kot tiskalni stre\017Enik.')
,p_version_scn=>2705521
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142574727563752426)
,p_name=>'WWV_FLOW_DATA_EXPORT.HIGHLIGHT_COLUMN_IDX_NOT_EXIST'
,p_message_language=>'sl'
,p_message_text=>unistr('Indeks stolpcev s sklicem v ozna\010Dbi %0 ne obstaja.')
,p_version_scn=>2705538
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142478157503752397)
,p_name=>'WWV_FLOW_DATA_EXPORT.INVALID_FORMAT'
,p_message_language=>'sl'
,p_message_text=>'Neveljaven format izvoza: %0'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142574596069752425)
,p_name=>'WWV_FLOW_DATA_EXPORT.PARENT_GROUP_IDX_NOT_EXIST'
,p_message_language=>'sl'
,p_message_text=>'Indeks nadrejene skupine s sklicem v %0 ne obstaja.'
,p_version_scn=>2705538
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142599774293752433)
,p_name=>'WWV_FLOW_DATA_LOADER.CANNOT_LOAD_INTO_GENERATED_ALWAYS_COLUMN'
,p_message_language=>'sl'
,p_message_text=>unistr('Stolpec %1 tabele %0 je stolpec identitet "GENERATED ALWAYS". Prepri\010Dajte se, da noben izvorni stolpec ni preslikan v stolpec %1 v pogovornem oknu Konfiguracija.')
,p_version_scn=>2705543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142511323821752407)
,p_name=>'WWV_FLOW_DATA_LOADER.COMMIT_INTERVAL_TOO_LOW'
,p_message_language=>'sl'
,p_message_text=>'Navedeni interval potrditev je prenizek.'
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142511455439752407)
,p_name=>'WWV_FLOW_DATA_LOADER.NO_COLUMNS_PROVIDED'
,p_message_language=>'sl'
,p_message_text=>'Za nalaganje podatkov ni bilo zagotovljenih nobenih stolpcev.'
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142512784982752407)
,p_name=>'WWV_FLOW_DATA_PARSER.NO_COLUMNS_FOUND'
,p_message_language=>'sl'
,p_message_text=>unistr('Za izbirnika vrstic "%0" ni bilo mogo\010De najti nobenega stolpca. Poskusite samodejno zaznati ali pregledati strukturo JSON.')
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142522126821752410)
,p_name=>'WWV_FLOW_DATA_PARSER.NO_WORKSHEETS_FOUND'
,p_message_language=>'sl'
,p_message_text=>unistr('V datoteki XLSX ni bilo mogo\010De najti delovnih listov.')
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142467269026752393)
,p_name=>'WWV_FLOW_DATA_PARSER.REQUESTED_HIERARCHY_LEVELS_EXCEED_MAXIMUM'
,p_message_language=>'sl'
,p_message_text=>'Zahtevane ravni hierarhije za odkrivanje (%0) presegajo maksimum, ki je %1.'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142522055535752410)
,p_name=>'WWV_FLOW_DATA_PARSER.WORKSHEET_DOES_NOT_EXIST'
,p_message_language=>'sl'
,p_message_text=>'Navedeni delovni list ne obstaja v datoteki XLSX.'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142500484129752403)
,p_name=>'WWV_FLOW_DML.VERSION_OF_DATA_CHANGED'
,p_message_language=>'sl'
,p_message_text=>'Trenutna verzija podatkov v bazi podatkov se je spremenila, odkar je uporabnik inicializiral postopek posodobitve.'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142503312277752404)
,p_name=>'WWV_FLOW_EDIT_REPORT.ERR_UPDATING_COLS'
,p_message_language=>'sl'
,p_message_text=>unistr('Napaka pri posodabljanju stolpcev poro\010Dila: %0')
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142613803929752437)
,p_name=>'WWV_FLOW_EXEC.CANNOT_CONVERT_TO_SDOGEOMETRY'
,p_message_language=>'sl'
,p_message_text=>unistr('%0 ni mogo\010De pretvoriti v SDO_GEOMETRY.')
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142550302504752418)
,p_name=>'WWV_FLOW_EXEC.CAN_NOT_CONVERT_TO_VARCHAR2'
,p_message_language=>'sl'
,p_message_text=>unistr('Stolpca %0, ki je podatkovnega tipa %1, ni mogo\010De pretvoriti v VARCHAR2!')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142557703473752420)
,p_name=>'WWV_FLOW_EXEC.COLUMN_NOT_FOUND'
,p_message_language=>'sl'
,p_message_text=>unistr('Stolpca "%0", dolo\010Denega za atribut "%1", ni bilo mogo\010De najti v viru podatkov!')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142493850688752401)
,p_name=>'WWV_FLOW_EXEC.FILTER_NOT_SUPPORTED_WITH_MULTIPLE_VALUES'
,p_message_language=>'sl'
,p_message_text=>unistr('Tip filtra %0 ni podprt za stolpce z ve\010D vrednostmi.')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142617341908752438)
,p_name=>'WWV_FLOW_EXEC.INVALID_BETWEEN_FILTER'
,p_message_language=>'sl'
,p_message_text=>'Neveljaven filter "med".'
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142472929125752395)
,p_name=>'WWV_FLOW_EXEC.INVALID_COLUMN_OR_ROW_DATATYPE'
,p_message_language=>'sl'
,p_message_text=>unistr('V vrstici \0161t. %1 v stolpcu %0 ni bila najdena nobena vrednost %2.')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142469631023752394)
,p_name=>'WWV_FLOW_EXEC.INVALID_COLUMN_OR_ROW_REFERENCE'
,p_message_language=>'sl'
,p_message_text=>'Stolpec %0 ali vrstica #%1 ne obstaja.'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142456234046752390)
,p_name=>'WWV_FLOW_EXEC.INVALID_LOV_SPECIFICATION'
,p_message_language=>'sl'
,p_message_text=>'Naveden neveljaven tip LOV.'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142456179122752390)
,p_name=>'WWV_FLOW_EXEC.INVALID_QUERY_TYPE'
,p_message_language=>'sl'
,p_message_text=>'Neveljaven tip poizvedbe. Tip poizvedbe mora biti tabela, poizvedba SQL ali funkcija PL/SQL, ki vrne poizvedbo SQL.'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142550429910752418)
,p_name=>'WWV_FLOW_EXEC.INVALID_SQL_QUERY'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Raz\010Dlenjevanje poizvedbe SQL ni uspelo!'),
'%0'))
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142557823698752420)
,p_name=>'WWV_FLOW_EXEC.LEGACY_COLUMN_NOT_FOUND'
,p_message_language=>'sl'
,p_message_text=>unistr('Navedenega polo\017Eaja stolpca %0 za atribut "%1" ni bilo mogo\010De najti v izpisku SQL!')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142447800336752388)
,p_name=>'WWV_FLOW_EXEC.MULTI_VALUE_TOO_MANY_ITEMS'
,p_message_language=>'sl'
,p_message_text=>unistr('V filtru z ve\010D vrednostmi je bilo uporabljenih preve\010D elementov.')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142557613651752420)
,p_name=>'WWV_FLOW_EXEC.NO_COLUMN_FOR_ATTRIBUTE'
,p_message_language=>'sl'
,p_message_text=>unistr('Za atribut "%0" ni dolo\010Den noben stolpec.')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142456071190752390)
,p_name=>'WWV_FLOW_EXEC.NULL_QUERY_RETURNED_BY_FUNCTION'
,p_message_language=>'sl'
,p_message_text=>'Telo funkcije PL/SQL ni vrnilo vrednosti.'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142573413608752425)
,p_name=>'WWV_FLOW_EXEC.OPERATION_NOT_PRESENT_IN_WEB_SRC_MODULE'
,p_message_language=>'sl'
,p_message_text=>'Vir podatkov REST ne vsebuje operacije za obravnavo zahtevanega dejanja DML.'
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142615118093752438)
,p_name=>'WWV_FLOW_EXEC.RANGE_BUCKET.NOT.SUPPORTED'
,p_message_language=>'sl'
,p_message_text=>'Filtri razpona so podprti za podatkovne tipe NUMBER, DATE in TIMESTAMP.'
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142436010122752384)
,p_name=>'WWV_FLOW_EXEC.REST_REQUEST_ERROR'
,p_message_language=>'sl'
,p_message_text=>'Zahteva ni uspela zaradi %0'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142439566672752385)
,p_name=>'WWV_FLOW_EXEC.SPATIAL_JSON_NOT_AVAILABLE'
,p_message_language=>'sl'
,p_message_text=>'Pretvorba GeoJSON v SDO_GEOMETRY (stolpec %0) ni na voljo v tej bazi podatkov.'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142442926031752386)
,p_name=>'WWV_FLOW_EXEC.SPATIAL_NOT_SUPPORTED_FOR_XML'
,p_message_language=>'sl'
,p_message_text=>'Pretvorba SDO_GEOMETRY (stolpec %0) ni podprta za vire podatkov XML.'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142467086835752393)
,p_name=>'WWV_FLOW_EXEC.UNSUPPPORTED_MULTI_VALUE_SEPARATOR'
,p_message_language=>'sl'
,p_message_text=>unistr('Znak %0 ni podprt kot lo\010Dilo za ve\010D vrednosti.')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142615247166752438)
,p_name=>'WWV_FLOW_EXEC.WRONG_CONTEXT_TYPE'
,p_message_language=>'sl'
,p_message_text=>unistr('Te funkcije ni mogo\010De uporabiti za kontekst poizvedbe.')
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142443068515752386)
,p_name=>'WWV_FLOW_EXEC_API.INVALID_DATA_TYPE'
,p_message_language=>'sl'
,p_message_text=>'Podatkovni tip stolpca se ne ujema.'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142476593960752396)
,p_name=>'WWV_FLOW_EXEC_DOC_SRC.REMOTE_MULTI_ROW_DML_NOT_SUPPORTED_WITHOUT_JSON_BINDS'
,p_message_language=>'sl'
,p_message_text=>unistr('Ta vir podatkov ne podpira spreminjanja ve\010D vrstic.')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142455917089752390)
,p_name=>'WWV_FLOW_EXEC_REMOTE.ORDS_OUT_BIND_LIMIT_EXCEEDED'
,p_message_language=>'sl'
,p_message_text=>unistr('Prekora\010Dene notranje omejitve vezave ORDS OUT. Zmanj\0161ajte \0161tevilo vrstic DML.')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142558665524752421)
,p_name=>'WWV_FLOW_EXEC_REMOTE.RESPONSE_PARSING_ERROR'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Odgovora JSON oddaljenega stre\017Enika ni bilo mogo\010De raz\010Dleniti: '),
'%0'))
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142455896315752390)
,p_name=>'WWV_FLOW_EXEC_REMOTE.RUN_PLSQL_ERR'
,p_message_language=>'sl'
,p_message_text=>unistr('Neznan ali napa\010Den tip konteksta.')
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142479958105752397)
,p_name=>'WWV_FLOW_EXPORT_INT.UNSUPPORTED_READABLE_EXPORT'
,p_message_language=>'sl'
,p_message_text=>'Nepodprte komponente za berljivi izvoz: %0'
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142577934925752426)
,p_name=>'WWV_FLOW_FILE_PARSER.UNKNOWN_FILE_TYPE'
,p_message_language=>'sl'
,p_message_text=>unistr('Tega tipa datoteke raz\010Dlenjevalnik ne podpira.')
,p_version_scn=>2705539
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142528757255752412)
,p_name=>'WWV_FLOW_FND_DEVELOPER_API.CREDENTIALS_ERR'
,p_message_language=>'sl'
,p_message_text=>unistr('Nepoobla\0161\010Den dostop (wwv_flow_api.set_credentials ni nastavljeno).')
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142503674978752404)
,p_name=>'WWV_FLOW_FND_USER_API.CREATE_COMPANY'
,p_message_language=>'sl'
,p_message_text=>unistr('Delovni prostor ni bil ustvarjen, ker \017Ee obstaja.')
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142503526246752404)
,p_name=>'WWV_FLOW_FND_USER_API.CREATE_USER_GROUP'
,p_message_language=>'sl'
,p_message_text=>unistr('Skupina uporabnikov ni bila ustvarjena, ker \017Ee obstaja.')
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142514971491752408)
,p_name=>'WWV_FLOW_FND_USER_API.DUP_USER'
,p_message_language=>'sl'
,p_message_text=>unistr('Podvojeno uporabni\0161ko ime najdeno za %0.')
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142515093774752408)
,p_name=>'WWV_FLOW_FND_USER_API.LOAD_ERR'
,p_message_language=>'sl'
,p_message_text=>'Napaka pri nalaganju uporabnikov. Ni uspelo za uporabnika %0.'
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142525883148752411)
,p_name=>'WWV_FLOW_FND_USER_API.T_MESSAGE'
,p_message_language=>'sl'
,p_message_text=>unistr('Nalo\017Eilo bi se toliko uporabnikov: %0.')
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142525643483752411)
,p_name=>'WWV_FLOW_FND_USER_API.T_PASSWORD'
,p_message_language=>'sl'
,p_message_text=>'Geslo'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142525775274752411)
,p_name=>'WWV_FLOW_FND_USER_API.T_PRIVILEGE'
,p_message_language=>'sl'
,p_message_text=>'Privilegiji'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142525430037752411)
,p_name=>'WWV_FLOW_FND_USER_API.T_USERNAME'
,p_message_language=>'sl'
,p_message_text=>unistr('Uporabni\0161ko ime')
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142605827704752435)
,p_name=>'WWV_FLOW_FORM.UNHANDLED_ERROR'
,p_message_language=>'sl'
,p_message_text=>'Napaka med upodabljanjem elementa strani #COMPONENT_NAME#.'
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142520810996752409)
,p_name=>'WWV_FLOW_FORMS.FORM_NOT_OPEN_ERR'
,p_message_language=>'sl'
,p_message_text=>unistr('Elementa strani ni mogo\010De prikazati, ker obrazec HTML \0161e ni bil odprt.')
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142479298408752397)
,p_name=>'WWV_FLOW_FORMS.ITEM_DEFAULT_ERR'
,p_message_language=>'sl'
,p_message_text=>unistr('Napaka pri izra\010Dunavanju privzete vrednosti elementa za element strani #COMPONENT_NAME#.')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142520142493752409)
,p_name=>'WWV_FLOW_FORMS.ITEM_POST_CALC_ERR'
,p_message_language=>'sl'
,p_message_text=>unistr('Napaka pri izra\010Dunavanju objave elementa za element strani #COMPONENT_NAME#.')
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142520006420752409)
,p_name=>'WWV_FLOW_FORMS.ITEM_SOURCE_ERR'
,p_message_language=>'sl'
,p_message_text=>unistr('Napaka pri izra\010Dunavanju izvorne vrednosti elementa za element strani #COMPONENT_NAME#.')
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142496811767752402)
,p_name=>'WWV_FLOW_HELP.UNAUTHORIZED'
,p_message_language=>'sl'
,p_message_text=>unistr('Nepoobla\0161\010Den dostop.')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142446379260752387)
,p_name=>'WWV_FLOW_INTERACTIVE_GRID.INVALID_JSON_ARRAY'
,p_message_language=>'sl'
,p_message_text=>'Vrednost %0 od %1 ni veljavno polje JSON.'
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142520361747752409)
,p_name=>'WWV_FLOW_ITEM.JS_NOT_SUPPORTED'
,p_message_language=>'sl'
,p_message_text=>'JavaScript ni podprt.'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142520418745752409)
,p_name=>'WWV_FLOW_ITEM.LIST'
,p_message_language=>'sl'
,p_message_text=>'Seznam'
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142521077317752409)
,p_name=>'WWV_FLOW_ITEM.UNABLE_INIT_QUERY'
,p_message_language=>'sl'
,p_message_text=>unistr('Ni bilo mogo\010De inicializirati poizvedbe.')
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142529053962752412)
,p_name=>'WWV_FLOW_ITEM.UPDATE_NOT_SUPPORTED_ERR'
,p_message_language=>'sl'
,p_message_text=>'Posodobitev %0 ni podprta.'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142522599859752410)
,p_name=>'WWV_FLOW_ITEM_HELP.INVALID_ITEM_ERR'
,p_message_language=>'sl'
,p_message_text=>'Neveljaven ID elementa: %0 '
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142550285161752418)
,p_name=>'WWV_FLOW_ITEM_HELP.NO_HELP_EXISTS'
,p_message_language=>'sl'
,p_message_text=>unistr('Za ta element ne obstaja nobena pomo\010D.')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142512057080752407)
,p_name=>'WWV_FLOW_JET_CHART.QUERY_GENERATION_FAILED'
,p_message_language=>'sl'
,p_message_text=>'Ustvarjanje poizvedbe grafikona ni uspelo. Preverite nastavitve preslikave izvora in stolpcev.'
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142513322697752407)
,p_name=>'WWV_FLOW_MAIL.ADD_ATTACHMENT.INVALID_MAIL_ID'
,p_message_language=>'sl'
,p_message_text=>'Neveljavna vrednost za parameter p_mail_id: %0'
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142550075599752418)
,p_name=>'WWV_FLOW_MAIL.CANNOT_USE_TO_OR_REPLYTO_AS_FROM'
,p_message_language=>'sl'
,p_message_text=>unistr('Polja "Za" ali "Odgovori" ne morete uporabiti kot naslov "Od", saj vsebuje ve\010D e-po\0161tnih naslovov.')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142634904399752444)
,p_name=>'WWV_FLOW_MAIL.EMAIL_LIMIT_EXCEEDED'
,p_message_language=>'sl'
,p_message_text=>unistr('Presegli ste maksimalno \0161tevilo e-po\0161tnih sporo\010Dil na delovni prostor. Obrnite se na svojega skrbnika.')
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142491529333752401)
,p_name=>'WWV_FLOW_MAIL.INVALID_CONTEXT'
,p_message_language=>'sl'
,p_message_text=>'Ta postopek je treba priklicati iz seje aplikacije.'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142513238880752407)
,p_name=>'WWV_FLOW_MAIL.PARAMETER_NULL'
,p_message_language=>'sl'
,p_message_text=>'Vrednost NULL navedena za parameter %0.'
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142571325223752425)
,p_name=>'WWV_FLOW_MAIL.PREPARE_TEMPLATE.NO_DATA_FOUND'
,p_message_language=>'sl'
,p_message_text=>unistr('E-po\0161tne predloge "%0" ni bilo mogo\010De najti v aplikaciji %1.')
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142647832841752448)
,p_name=>'WWV_FLOW_MAIL.SMTP_HOST_ADDRESS_REQUIRED'
,p_message_language=>'sl'
,p_message_text=>unistr('Parameter instance SMTP_HOST_ADDRESS mora biti nastavljen za po\0161iljanje po\0161te.')
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142512694164752407)
,p_name=>'WWV_FLOW_MAIL.TO_IS_REQUIRED'
,p_message_language=>'sl'
,p_message_text=>unistr('Za po\0161iljanje po\0161te je treba navesti prejemnika sporo\010Dila.')
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142637316538752444)
,p_name=>'WWV_FLOW_MAIL.UNABLE_TO_OPEN_SMTP_CONNECTION'
,p_message_language=>'sl'
,p_message_text=>unistr('Povezave SMTP s konfiguriranim e-po\0161tnim stre\017Enikom ni bilo mogo\010De vzpostaviti.')
,p_version_scn=>2705549
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142612663688752437)
,p_name=>'WWV_FLOW_PLUGIN.INVALID_AJAX_CALL'
,p_message_language=>'sl'
,p_message_text=>'Neveljaven klic Ajax!'
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142496585806752402)
,p_name=>'WWV_FLOW_PLUGIN.NO_AJAX_FUNCTION'
,p_message_language=>'sl'
,p_message_text=>unistr('Za vti\010Dnik %0 ni bila dolo\010Dena nobena funkcija Ajax')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142603109288752434)
,p_name=>'WWV_FLOW_PLUGIN.NO_EXECUTION_FUNCTION'
,p_message_language=>'sl'
,p_message_text=>unistr('Nobena funkcija izvajanja ni bila dolo\010Dena za vti\010Dnik %0')
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142496639764752402)
,p_name=>'WWV_FLOW_PLUGIN.NO_RENDER_FUNCTION'
,p_message_language=>'sl'
,p_message_text=>unistr('Za vti\010Dnik %0 ni bila dolo\010Dena nobena funkcija upodobitve')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142613513857752437)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_CAPABILITIES_FUNCTION'
,p_message_language=>'sl'
,p_message_text=>unistr('Vti\010Dnik vira podatkov REST "%0" ne vsebuje funkcije "Zmo\017Enosti".')
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142613497664752437)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_DML_FUNCTION'
,p_message_language=>'sl'
,p_message_text=>unistr('Vti\010Dnik vira podatkov REST "%0" ne vsebuje funkcije DML.')
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142613685472752437)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_EXECUTE_FUNCTION'
,p_message_language=>'sl'
,p_message_text=>unistr('Vti\010Dnik vira podatkov REST "%0" ne vsebuje funkcije izvajanja.')
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142613753552752437)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_FETCH_FUNCTION'
,p_message_language=>'sl'
,p_message_text=>unistr('Vti\010Dnik vira podatkov REST "%0" ne vsebuje funkcije pridobivanja.')
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142494000821752401)
,p_name=>'WWV_FLOW_PLUGIN.RUN_PLSQL_ERR'
,p_message_language=>'sl'
,p_message_text=>unistr('Napaka v kodi PLSQL, do katere je pri\0161lo med obdelovanjem vti\010Dnika.')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142502651139752404)
,p_name=>'WWV_FLOW_PLUGIN_DEV.IS_REQUIRED'
,p_message_language=>'sl'
,p_message_text=>unistr('Vrednost mora biti dolo\010Dena.')
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142535662394752414)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.CANT_CONVERT_TO_VARCHAR2'
,p_message_language=>'sl'
,p_message_text=>unistr('Podatkovnega tipa %0 ni mogo\010De pretvoriti v VARCHAR2!')
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142623873494752440)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.COLUMN_NOT_FOUND'
,p_message_language=>'sl'
,p_message_text=>unistr('Stolpca "%0", dolo\010Denega za atribut "%1", ni bilo mogo\010De najti v izpisku SQL!')
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142451162073752389)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.INVALID_JSON_ARRAY'
,p_message_language=>'sl'
,p_message_text=>'Vrednost %0 od %1 ni veljavno polje JSON.'
,p_version_scn=>2705517
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142601001854752433)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.LOV_REQUIRED'
,p_message_language=>'sl'
,p_message_text=>'Za %0 mora biti navedena poizvedba o seznamu vrednosti (LOV) ali poimenovan seznam vrednosti.'
,p_version_scn=>2705544
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142602679633752434)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.LOV_SQL_WRONG_COLUMN_COUNT'
,p_message_language=>'sl'
,p_message_text=>unistr('\0160tevilo stolpcev v poizvedbi LOV SQL za %0 je napa\010Dno. Oglejte si primere veljavnih izpiskov.')
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142623625997752440)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.NO_COLUMN_FOR_ATTRIBUTE'
,p_message_language=>'sl'
,p_message_text=>unistr('Za atribut "%0" ni dolo\010Den noben stolpec.')
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142652811977752449)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.NUMBER_ATTRIBUTE_VALUE_INVALID'
,p_message_language=>'sl'
,p_message_text=>unistr('Vnesena vrednost %0 za atribut "%1" ni \0161tevilska.')
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142606136343752435)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.SQL_WRONG_DATA_TYPE'
,p_message_language=>'sl'
,p_message_text=>unistr('%0 vsebuje napa\010Den tip podatkov v izpisku SQL. Stolpec \0161t. %1 je %2, vendar pri\010Dakovano je bilo %3.')
,p_version_scn=>2705545
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142623769728752440)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.WRONG_COLUMN_DATA_TYPE'
,p_message_language=>'sl'
,p_message_text=>unistr('Stolpec "%0", dolo\010Den za atribut "%1", ima tip podatkov %2, a bi moral imeti %3.')
,p_version_scn=>2705547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142493293939752401)
,p_name=>'WWV_FLOW_PRINT_UTIL.REPORT_LAYOUT_NOT_FOUND'
,p_message_language=>'sl'
,p_message_text=>unistr('Ni mogo\010De najti postavitve poro\010Dila.')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142480886844752397)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTIONS_LIMIT_EXCEEDED'
,p_message_language=>'sl'
,p_message_text=>unistr('Omejitev izvajanj v ozadju prese\017Eena za %0.')
,p_version_scn=>2705520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142431156192752383)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTION_ALREADY_RUNNING'
,p_message_language=>'sl'
,p_message_text=>unistr('Druga izvedba %0 se \017Ee izvaja.')
,p_version_scn=>2705512
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142431031029752383)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTION_ALREADY_RUNNING_CTX'
,p_message_language=>'sl'
,p_message_text=>unistr('Za kontekst %1 se \017Ee izvaja druga izvedba %0.')
,p_version_scn=>2705512
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142446085119752387)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.FILES_NOT_VISIBLE_IN_WORKING_SESSION'
,p_message_language=>'sl'
,p_message_text=>unistr('Nalo\017Eene datoteke niso vidne v delovni seji za izvajanje %0.')
,p_version_scn=>2705516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142558515530752421)
,p_name=>'WWV_FLOW_RENDER_REPORT3.COMPUTE_SUM_NOT_SUPPORTED_FOR_WEB_SOURCES'
,p_message_language=>'sl'
,p_message_text=>unistr('Funkcije Vsota izra\010Duna ni mogo\010De uporabiti za poro\010Dila na osnovi vira podatkov REST.')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142520274392752409)
,p_name=>'WWV_FLOW_RENDER_SHORTCUT.UNABLE_SET_SHORT_VAL_ERR'
,p_message_language=>'sl'
,p_message_text=>unistr('ERR-2904 Ni mogo\010De nastaviti vrednosti bli\017Enjice.')
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142525238527752411)
,p_name=>'WWV_FLOW_RENDER_SHORTCUT.UNKNOWN_TYPE_ERR'
,p_message_language=>'sl'
,p_message_text=>unistr('Napaka: Neznan tip bli\017Enjice.')
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142462923255752392)
,p_name=>'WWV_FLOW_SEARCH_API.TEXT_QUERY_TOO_LONG'
,p_message_language=>'sl'
,p_message_text=>'Iskalna poizvedba je predolga.'
,p_version_scn=>2705519
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142514357859752407)
,p_name=>'WWV_FLOW_SECURITY.AUTH_SCHEME_FETCH_ERR'
,p_message_language=>'sl'
,p_message_text=>unistr('Ni bilo mogo\010De pridobiti authentication_scheme v aplikaciji %0.')
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142522319933752410)
,p_name=>'WWV_FLOW_SECURITY.COMPONENT_FETCH_ERR'
,p_message_language=>'sl'
,p_message_text=>unistr('Ni mogo\010De pridobiti komponente %0.')
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142592682452752431)
,p_name=>'WWV_FLOW_SESSION_API.TENANT_ID_EXISTS'
,p_message_language=>'sl'
,p_message_text=>unistr('ID najemnika \017Ee obstaja za trenutno sejo.')
,p_version_scn=>2705542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142525511719752411)
,p_name=>'WWV_FLOW_USER_API.T_EMAIL'
,p_message_language=>'sl'
,p_message_text=>unistr('E-po\0161ta')
,p_version_scn=>2705529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142652388920752449)
,p_name=>'WWV_FLOW_WEB_SERVICES.AUTHENTICATION_FAILED'
,p_message_language=>'sl'
,p_message_text=>'Preverjanje pristnosti ni uspelo.'
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142552937258752419)
,p_name=>'WWV_FLOW_WEB_SERVICES.COOKIE_INVALID'
,p_message_language=>'sl'
,p_message_text=>unistr('Eden ali ve\010D pi\0161kotkov, nastavljenih v apex_util.g_request_cookies, vsebuje neveljavno vrednost.')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142534852191752414)
,p_name=>'WWV_FLOW_WEB_SERVICES.INVALID_UDDI_RESPONSE'
,p_message_language=>'sl'
,p_message_text=>'Odgovor registra UDDI je bil neveljaven.'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142494185549752401)
,p_name=>'WWV_FLOW_WEB_SERVICES.INVALID_WSDL'
,p_message_language=>'sl'
,p_message_text=>'Navedeni URL ni vrnil veljavnega dokumenta WSDL.'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142496908649752402)
,p_name=>'WWV_FLOW_WEB_SERVICES.MULTIPLE_SOAP'
,p_message_language=>'sl'
,p_message_text=>unistr('Dokument WSDL vsebuje ve\010D vezav SOAP. &PRODUCT_NAME. podpira samo WSDL-je z eno vezavo SOAP. Za nadaljevanje postopka ustvarjanja reference za to storitev kliknite Ro\010Dno ustvari referenco spletne storitve.')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142572535074752425)
,p_name=>'WWV_FLOW_WEB_SERVICES.NOT_XML'
,p_message_language=>'sl'
,p_message_text=>'Odgovor storitve ni bil XML.'
,p_version_scn=>2705537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142652224263752449)
,p_name=>'WWV_FLOW_WEB_SERVICES.NO_VALID_OAUTH_TOKEN'
,p_message_language=>'sl'
,p_message_text=>unistr('\017Deton za dostop OAuth ni na voljo ali pa je potekel.')
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142616717451752438)
,p_name=>'WWV_FLOW_WEB_SERVICES.REQUEST_LIMIT_EXCEEDED'
,p_message_language=>'sl'
,p_message_text=>unistr('Presegli ste maksimalno \0161tevilo zahtev spletne storitve na delovni prostor. Obrnite se na svojega skrbnika.')
,p_version_scn=>2705546
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142652492781752449)
,p_name=>'WWV_FLOW_WEB_SERVICES.UNSUPPORTED_OAUTH_TOKEN'
,p_message_language=>'sl'
,p_message_text=>unistr('Stre\017Enik se je odzval z nepodprtim tipom \017Eetona OAuth.')
,p_version_scn=>2705552
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142496333324752402)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_NO_SOAP'
,p_message_language=>'sl'
,p_message_text=>'Dokument WSDL ni vseboval vezave za SOAP, ki je zahtevana za namene dodajanja reference.'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142491775838752401)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_REQUIRES_AUTH'
,p_message_language=>'sl'
,p_message_text=>unistr('Ta WSDL zahteva poverilnice za preverjanje pristnosti. Spodaj navedite uporabni\0161ko ime in geslo.')
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142502758537752404)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_UNHANDLED'
,p_message_language=>'sl'
,p_message_text=>unistr('Dokumenta WSDL mehanizem upodabljanja ni mogel razumeti. Za nadaljevanje postopka ustvarjanja reference za to storitev kliknite Ro\010Dno ustvari referenco spletne storitve.')
,p_version_scn=>2705525
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142575558679752426)
,p_name=>'WWV_FLOW_WIZARD_API.UPDATE_ERROR'
,p_message_language=>'sl'
,p_message_text=>unistr('Ni bilo mogo\010De obdelati posodobitve.')
,p_version_scn=>2705538
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142601312205752434)
,p_name=>'WWV_FLOW_WORKSHEET.LOV_DISPLAY_AND_RETURN_COLUMN_EQUAL'
,p_message_language=>'sl'
,p_message_text=>unistr('Stolpec za vra\010Dilo in stolpec za prikaz na seznamu vrednosti sta enaka!')
,p_version_scn=>2705544
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142601251102752434)
,p_name=>'WWV_FLOW_WORKSHEET.LOV_NO_RETURN_COLUMN'
,p_message_language=>'sl'
,p_message_text=>unistr('Seznam vrednosti nima stolpca za vra\010Dilo.')
,p_version_scn=>2705544
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142528975086752412)
,p_name=>'WWV_RENDER_REPORT3.COLUMN_VALUE_ERR'
,p_message_language=>'sl'
,p_message_text=>'Napaka pri pridobivanju vrednosti stolpca: %0'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142553839083752419)
,p_name=>'WWV_RENDER_REPORT3.DATA_TOO_OLD'
,p_message_language=>'sl'
,p_message_text=>unistr('Trenutni podatki tabelarnega obrazca so prestari; izvorni podatki so bili spremenjeni.<br/> Kliknite <strong><a href="%0">tukaj</a></strong>, da zavr\017Eete spremembe in znova nalo\017Eite podatke iz baze podatkov.')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142509026219752406)
,p_name=>'WWV_RENDER_REPORT3.ERR_DETERMINE_PAGINATION'
,p_message_language=>'sl'
,p_message_text=>unistr('Napaka pri dolo\010Danju niza \0161tevil\010Denja strani')
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142508997985752406)
,p_name=>'WWV_RENDER_REPORT3.ERR_DETERMINE_QUERY_HEADINGS'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('ni mogo\010De dolo\010Diti naslovov poizvedbe:'),
'%0'))
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142509181827752406)
,p_name=>'WWV_RENDER_REPORT3.ERR_REPORT_FOOTER'
,p_message_language=>'sl'
,p_message_text=>unistr('napaka pri izvajanju zamenjav noge poro\010Dila')
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142509257509752406)
,p_name=>'WWV_RENDER_REPORT3.FAILED_PARSING_QUERY'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('raz\010Dlenjevanje poizvedbe SQL ni uspelo:'),
'%0',
'%1'))
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142515356084752408)
,p_name=>'WWV_RENDER_REPORT3.FOUND_BUT_NOT_DISPLAYED'
,p_message_language=>'sl'
,p_message_text=>unistr('Minimalno \0161tevilo zahtevanih vrstic: %0, \0161tevilo najdenih vrstic, ki pa niso prikazane: %1')
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142511700760752407)
,p_name=>'WWV_RENDER_REPORT3.HTML_USE_COLUMN_ALIAS'
,p_message_language=>'sl'
,p_message_text=>'stolpec poizvedbe #%0 (%1) je neveljaven, stolpci, ki uporabljajo HTML, potrebujejo druga imena'
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142528823159752412)
,p_name=>'WWV_RENDER_REPORT3.QUERY_HEADING_ERR'
,p_message_language=>'sl'
,p_message_text=>'Napaka pri pridobivanju naslovov poizvedb: %0'
,p_version_scn=>2705530
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142509362445752406)
,p_name=>'WWV_RENDER_REPORT3.REPORT_ERROR'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('napaka poro\010Dila:'),
'%0'))
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142549455401752418)
,p_name=>'WWV_RENDER_REPORT3.SORT_BY_THIS_COLUMN'
,p_message_language=>'sl'
,p_message_text=>'Razvrsti po tem stolpcu'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142511836319752407)
,p_name=>'WWV_RENDER_REPORT3.SYNTAX_ERROR'
,p_message_language=>'sl'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Poizvedbe ni mogo\010De raz\010Dleniti, preverite sintakso svoje poizvedbe.'),
'(%0)',
'</p>'))
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142553939476752419)
,p_name=>'WWV_RENDER_REPORT3.UNSAVED_DATA'
,p_message_language=>'sl'
,p_message_text=>'Ta obrazec vsebuje neshranjene spremembe. Pritisnite "V redu", da nadaljujete, ne da bi shranili spremembe.'
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142558488728752421)
,p_name=>'WWV_RENDER_REPORT3.UNSUPPORTED_PAGINATION_SCHEME'
,p_message_language=>'sl'
,p_message_text=>unistr('Shema \0161tevil\010Denja strani poro\010Dila (%0) ni podprta z izbranim virom podatkov.')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142511646466752407)
,p_name=>'WWV_RENDER_REPORT3.USE_COLUMN_ALIAS'
,p_message_language=>'sl'
,p_message_text=>'stolpec poizvedbe #%0 (%1) je neveljaven, uporabite drugo ime stolpca'
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142515449136752408)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_MORE_THAN_Z'
,p_message_language=>'sl'
,p_message_text=>unistr('vrstice %0 - %1 od ve\010D kot %2')
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142555900711752420)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_MORE_THAN_Z_2'
,p_message_language=>'sl'
,p_message_text=>unistr('%0 - %1 od ve\010D kot %2')
,p_version_scn=>2705533
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142515237755752408)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z'
,p_message_language=>'sl'
,p_message_text=>'vrstice %0 - %1 od %2'
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142496049510752402)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z_2'
,p_message_language=>'sl'
,p_message_text=>'%0 - %1 od %2'
,p_version_scn=>2705523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142509409093752406)
,p_name=>'Y'
,p_message_language=>'sl'
,p_message_text=>'Y'
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142516710004752408)
,p_name=>'YEAR'
,p_message_language=>'sl'
,p_message_text=>'leto'
,p_version_scn=>2705528
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142508652988752406)
,p_name=>'YEARS'
,p_message_language=>'sl'
,p_message_text=>'leta'
,p_version_scn=>2705526
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142554014743752419)
,p_name=>'YES'
,p_message_language=>'sl'
,p_message_text=>'Da'
,p_version_scn=>2705533
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
 p_id=>wwv_flow_imp.id(109678305570583962.4486)
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
 p_id=>1.4486
,p_name=>unistr('Sporo\010Dila')
,p_alias=>'MESSAGES'
,p_step_title=>unistr('Sporo\010Dila')
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
