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
,p_default_application_id=>4547
,p_default_id_offset=>0
,p_default_owner=>'APEX_240200'
);
end;
/
 
prompt APPLICATION 4547 - Oracle APEX Runtime Messages
--
-- Application Export:
--   Application:     4547
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
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'A144694060673763923')
,p_page_view_logging=>'YES'
,p_charset=>'utf-8'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt_last_reset=>'20250422180859'
,p_bookmark_checksum_function=>'SH1'
,p_compatibility_mode=>'24.2'
,p_session_state_commits=>'IMMEDIATE'
,p_flow_language=>'vi'
,p_flow_language_derived_from=>'SESSION'
,p_date_format=>'&DATE_FORMAT.'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(109678305570583962.4547)
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
 p_id=>wwv_flow_imp.id(4547)
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
 p_id=>wwv_flow_imp.id(728504220438374.4547)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SELECT_MANY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_values_as', 'separated')).to_clob
,p_version_scn=>7007816
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(736540203200530.4547)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_BOSS'
,p_version_scn=>243430877
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(800575880762576.4547)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'NATIVE_OPEN_AI_ASSISTANT'
,p_version_scn=>15457644
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2657043006125217.4547)
,p_plugin_type=>'PROCESS TYPE'
,p_plugin=>'NATIVE_GEOCODING'
,p_attribute_01=>'RELAX_HOUSE_NUMBER'
,p_version_scn=>117636987
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(110599941590099161.4547)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'default_icon', 'fa-star',
  'tooltip', '#VALUE#')).to_clob
,p_version_scn=>7007818
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(118481226255833028.4547)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_MAP_REGION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_vector_tile_layers', 'Y')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(123214098089478467.4547)
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
 p_id=>wwv_flow_imp.id(124389732573989299.4547)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_ADFBC'
,p_version_scn=>37165931336889
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(209516503264520988.4547)
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
 p_id=>wwv_flow_imp.id(285800719532138903.4547)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N')).to_clob
,p_version_scn=>7007823
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(649595203182764436.4547)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_style', 'SWITCH_CB',
  'off_value', 'N',
  'on_value', 'Y')).to_clob
,p_version_scn=>6539584
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1874744429444344138.4547)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'include_slider', 'N')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1941451863897626238.4547)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'actions_menu_structure', 'IG')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2027366558906572283.4547)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'mode', 'FULL')).to_clob
,p_version_scn=>7007824
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2120597162971751123.4547)
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
 p_id=>wwv_flow_imp.id(649613204592764515.4547)
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
 p_id=>wwv_flow_imp.id(850359229090693491.4547)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Wizard Dialog.vi'
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
 p_id=>wwv_flow_imp.id(293526110820992194.4547)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4547)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293526630547992195.4547)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4547)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293527171164992195.4547)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4547)
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
 p_id=>wwv_flow_imp.id(851037359784626333.4547)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Dialog.vi'
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
 p_id=>wwv_flow_imp.id(293473352245977306.4547)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4547)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293473882718977306.4547)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4547)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293474370844977307.4547)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4547)
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
 p_id=>wwv_flow_imp.id(851037631091626378.4547)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Edit Screen.vi'
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
 p_id=>wwv_flow_imp.id(2495515088702127.4547)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4547)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2496016567702127.4547)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4547)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2496522618702127.4547)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4547)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2497097895702127.4547)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4547)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2497562953702128.4547)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4547)
,p_name=>'Edit Screen Header'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2498085850702128.4547)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4547)
,p_name=>'Page Position 5'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2498553894702128.4547)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4547)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2499023066702128.4547)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4547)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2499516729702128.4547)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4547)
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
 p_id=>wwv_flow_imp.id(851039898661626389.4547)
,p_theme_id=>3
,p_name=>'APEX 5.0 - No Side Bar.vi'
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
 p_id=>wwv_flow_imp.id(2418665544706094.4547)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4547)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2419139140706094.4547)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4547)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2419660231706094.4547)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4547)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2420136000706094.4547)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4547)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2420617033706094.4547)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4547)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2421142368706094.4547)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4547)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2421629849706095.4547)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4547)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2422132460706095.4547)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4547)
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
 p_id=>wwv_flow_imp.id(851040471818626394.4547)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Right Side Bar.vi'
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
 p_id=>wwv_flow_imp.id(1537388880131854.4547)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4547)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1537880270131855.4547)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4547)
,p_name=>'Page Header (Position 3)'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1538315330131855.4547)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4547)
,p_name=>'Page Header (Position 4)'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1538840638131855.4547)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4547)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1539339441131855.4547)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4547)
,p_name=>'After Body'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1539830162131855.4547)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4547)
,p_name=>'Page Header (Position 1)'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1540338421131855.4547)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4547)
,p_name=>'Page Header (Position 2)'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1540832064131856.4547)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4547)
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
 p_id=>wwv_flow_imp.id(851041812938626395.4547)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Sign Up Wizard.vi'
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
 p_id=>wwv_flow_imp.id(115212309210289451.4547)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4547)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115212857712289451.4547)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4547)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115213340345289452.4547)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4547)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115213804331289452.4547)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4547)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115214317592289452.4547)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4547)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115214875819289453.4547)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4547)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115215325320289453.4547)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4547)
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
 p_id=>wwv_flow_imp.id(851042476105626395.4547)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Wizard Page.vi'
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
 p_id=>wwv_flow_imp.id(1485266589875353.4547)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4547)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1485734308875353.4547)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4547)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1486237142875354.4547)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4547)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1486735024875354.4547)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4547)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1487219028875354.4547)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4547)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1487770987875354.4547)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4547)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1488272041875354.4547)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4547)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1488725778875354.4547)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4547)
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
 p_id=>wwv_flow_imp.id(514381861202541059.4547)
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
 p_id=>wwv_flow_imp.id(514382190540541061.4547)
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
 p_id=>wwv_flow_imp.id(514382538845541061.4547)
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
 p_id=>wwv_flow_imp.id(620629666890811728.4547)
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
 p_id=>wwv_flow_imp.id(620629778318811745.4547)
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
 p_id=>wwv_flow_imp.id(868252865986181054.4547)
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
 p_id=>wwv_flow_imp.id(514338947870435171.4547)
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
 p_id=>wwv_flow_imp.id(2962385277500935.4547)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4547)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2962865718500935.4547)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4547)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2963338641500935.4547)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4547)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2963894582500935.4547)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4547)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2964329937500935.4547)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4547)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2964897214500936.4547)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4547)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2965324003500936.4547)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4547)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2965838011500936.4547)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4547)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2966328405500936.4547)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4547)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2966823859500936.4547)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4547)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2967325351500936.4547)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4547)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2967812485500936.4547)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4547)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2968377768500937.4547)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4547)
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
 p_id=>wwv_flow_imp.id(514343873675436760.4547)
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
 p_id=>wwv_flow_imp.id(32585474981747544.4547)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4547)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32585915750747544.4547)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4547)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32586471989747545.4547)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4547)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32586972270747545.4547)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4547)
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
 p_id=>wwv_flow_imp.id(771803843049318447.4547)
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
 p_id=>wwv_flow_imp.id(3207496127505978.4547)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4547)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3207907805505978.4547)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4547)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3208484941505978.4547)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4547)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3208991047505978.4547)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4547)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3209402462505979.4547)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4547)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3209972507505979.4547)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4547)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3210460159505979.4547)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4547)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3210935368505979.4547)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4547)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3211466566505979.4547)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4547)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3211956312505979.4547)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4547)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3212461962505979.4547)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4547)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3212966370505980.4547)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4547)
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
 p_id=>wwv_flow_imp.id(850406444708718383.4547)
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
 p_id=>wwv_flow_imp.id(2204663592232325.4547)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4547)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2205135519232325.4547)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4547)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2205694824232325.4547)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4547)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2206129075232325.4547)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4547)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2206618558232325.4547)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4547)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2207115910232326.4547)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4547)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2207688896232326.4547)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4547)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2208160700232326.4547)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4547)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2208614050232326.4547)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4547)
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
 p_id=>wwv_flow_imp.id(850442966147812557.4547)
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
 p_id=>wwv_flow_imp.id(3346988371508588.4547)
,p_plug_template_id=>wwv_flow_imp.id(850442966147812557.4547)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3347426198508588.4547)
,p_plug_template_id=>wwv_flow_imp.id(850442966147812557.4547)
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
 p_id=>wwv_flow_imp.id(856206049762521193.4547)
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
 p_id=>wwv_flow_imp.id(2526185270486606.4547)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4547)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2526610033486606.4547)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4547)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2527184084486606.4547)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4547)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2527626846486607.4547)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4547)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2528141078486607.4547)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4547)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2528637911486607.4547)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4547)
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
 p_id=>wwv_flow_imp.id(914802799655239969.4547)
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
 p_id=>wwv_flow_imp.id(88183211858816924.4547)
,p_plug_template_id=>wwv_flow_imp.id(914802799655239969.4547)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(88183732152816924.4547)
,p_plug_template_id=>wwv_flow_imp.id(914802799655239969.4547)
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
 p_id=>wwv_flow_imp.id(914803495164240003.4547)
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
 p_id=>wwv_flow_imp.id(3373447170510516.4547)
,p_plug_template_id=>wwv_flow_imp.id(914803495164240003.4547)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3373993086510516.4547)
,p_plug_template_id=>wwv_flow_imp.id(914803495164240003.4547)
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
 p_id=>wwv_flow_imp.id(915210356236972585.4547)
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
 p_id=>wwv_flow_imp.id(2899946654493378.4547)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4547)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2900442121493378.4547)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4547)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2900949359493378.4547)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4547)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2901467944493378.4547)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4547)
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
 p_id=>wwv_flow_imp.id(915371118115573423.4547)
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
 p_id=>wwv_flow_imp.id(2695578355491332.4547)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4547)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2696079816491332.4547)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4547)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2696558276491332.4547)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4547)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2697055726491332.4547)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4547)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2697581510491332.4547)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4547)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2698048732491333.4547)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4547)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2698576547491333.4547)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4547)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2699004772491333.4547)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4547)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2699557295491333.4547)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4547)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2700035673491333.4547)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4547)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2700500589491333.4547)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4547)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2701097053491333.4547)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4547)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2701554382491334.4547)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4547)
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
 p_id=>wwv_flow_imp.id(1274355059486017828.4547)
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
 p_id=>wwv_flow_imp.id(61232728057733462.4547)
,p_plug_template_id=>wwv_flow_imp.id(1274355059486017828.4547)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(61233207886733462.4547)
,p_plug_template_id=>wwv_flow_imp.id(1274355059486017828.4547)
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
 p_id=>wwv_flow_imp.id(514332014414430986.4547)
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
 p_id=>wwv_flow_imp.id(514332292784430987.4547)
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
 p_id=>wwv_flow_imp.id(860563697365629462.4547)
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
 p_id=>wwv_flow_imp.id(865273508717512144.4547)
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
 p_id=>wwv_flow_imp.id(908020362212234651.4547)
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
 p_id=>wwv_flow_imp.id(914818080687341593.4547)
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
 p_id=>wwv_flow_imp.id(851049711466639395.4547)
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
 p_id=>wwv_flow_imp.id(851054516889639461.4547)
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
 p_id=>wwv_flow_imp.id(851055225644639463.4547)
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
 p_id=>wwv_flow_imp.id(851056531929639482.4547)
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
 p_id=>wwv_flow_imp.id(914792024808213039.4547)
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
 p_id=>wwv_flow_imp.id(914792322768213043.4547)
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
 p_id=>wwv_flow_imp.id(915377874236666939.4547)
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
 p_id=>wwv_flow_imp.id(1041941432531249038.4547)
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
 p_id=>wwv_flow_imp.id(850683711614406253.4547)
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
 p_id=>wwv_flow_imp.id(851047536471633848.4547)
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
 p_id=>wwv_flow_imp.id(851047676005633854.4547)
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
 p_id=>wwv_flow_imp.id(851047684809633856.4547)
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
 p_id=>wwv_flow_imp.id(851047795461633856.4547)
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
 p_id=>wwv_flow_imp.id(860542631889572088.4547)
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
 p_id=>wwv_flow_imp.id(1321751941832424103.4547)
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
 p_id=>wwv_flow_imp.id(514333590213433126.4547)
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
 p_id=>wwv_flow_imp.id(649611704621764507.4547)
,p_page_name=>'winlov'
,p_page_title=>unistr('H\00F4\0323p thoa\0323i ti\0300m ki\00EA\0301m')
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
,p_find_button_text=>unistr('T\00ECm ki\1EBFm')
,p_find_button_attr=>'class="a-Button a-Button--hot a-Button--padLeft"'
,p_close_button_text=>unistr('\0110o\0301ng')
,p_close_button_attr=>'class="a-Button u-pullRight"'
,p_next_button_text=>unistr('Ti\00EA\0301p theo &gt;')
,p_next_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_prev_button_text=>unistr('&lt; Tr\01B0\01A1\0301c')
,p_prev_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'380'
,p_height=>'480'
,p_result_row_x_of_y=>unistr('<div class="a-PopupLOV-pagination">Ha\0300ng #FIRST_ROW# - #LAST_ROW#</div>')
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
 p_id=>wwv_flow_imp.id(649611609668764506.4547)
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
 p_id=>wwv_flow_imp.id(182005134783173294.4547)
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
 p_id=>wwv_flow_imp.id(666074212329754757.4547)
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
 p_id=>wwv_flow_imp.id(666074525535755551.4547)
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
 p_id=>wwv_flow_imp.id(717250289307903026.4547)
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
 p_id=>wwv_flow_imp.id(2336377640986141.4547)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL'
,p_display_name=>'Heading Level'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(806925000765340952.4547)
,p_theme_id=>3
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default - No Icons'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808380142596819918.4547)
,p_theme_id=>3
,p_name=>'ALTERNATING_TABLE_ROWS'
,p_display_name=>'Alternating Table Rows'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Enable'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808380828683819918.4547)
,p_theme_id=>3
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Disable'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808381542095819918.4547)
,p_theme_id=>3
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default Border'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808383088145819924.4547)
,p_theme_id=>3
,p_name=>'REPORT_WIDTH'
,p_display_name=>'Report Width'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850406791580718389.4547)
,p_theme_id=>3
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850407096779718396.4547)
,p_theme_id=>3
,p_name=>'REGION_PADDING'
,p_display_name=>'Region Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Padding'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850407509193718398.4547)
,p_theme_id=>3
,p_name=>'REGION_STYLE'
,p_display_name=>'Region Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Style'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(851050160062639437.4547)
,p_theme_id=>3
,p_name=>'BADGE_LAYOUT'
,p_display_name=>'Badge Layout'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(851051045625639457.4547)
,p_theme_id=>3
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856113214217058023.4547)
,p_theme_id=>3
,p_name=>'HEIGHT'
,p_display_name=>'Height'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856114568019058024.4547)
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
 p_id=>wwv_flow_imp.id(856114830529058024.4547)
,p_theme_id=>3
,p_name=>'FORM_LABEL_WIDTH'
,p_display_name=>'Form Label Width'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856115135223058024.4547)
,p_theme_id=>3
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Not Part of Button Set'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116214022058024.4547)
,p_theme_id=>3
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>1
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116523282058024.4547)
,p_theme_id=>3
,p_name=>'FORM_LABEL_POSITION'
,p_display_name=>'Form Label Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116798725058025.4547)
,p_theme_id=>3
,p_name=>'BUTTON_SIZE'
,p_display_name=>'Button Size'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Button Size'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117102944058028.4547)
,p_theme_id=>3
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing left'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Left Spacing'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117454663058028.4547)
,p_theme_id=>3
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Right Spacing'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117908453058029.4547)
,p_theme_id=>3
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Icon on Right'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856118261810058029.4547)
,p_theme_id=>3
,p_name=>'BUTTON_TYPE'
,p_display_name=>'Button Type'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856206461450521195.4547)
,p_theme_id=>3
,p_name=>'ALERT_TYPE'
,p_display_name=>'Alert Type'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856206736628521198.4547)
,p_theme_id=>3
,p_name=>'DISPLAY'
,p_display_name=>'Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(860570508910721307.4547)
,p_theme_id=>3
,p_name=>'REGION_POSITION'
,p_display_name=>'Region Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(860571060920721309.4547)
,p_theme_id=>3
,p_name=>'REGION_OVERFLOW'
,p_display_name=>'Region Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(908020718209234676.4547)
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
 p_id=>wwv_flow_imp.id(1487577187426769.4547)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden to Assistive Tech'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4547)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4547)
,p_template_types=>'REGION'
,p_help_text=>'By default, region title is hidden but accessible, use this option to remove the header from accessible interface'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2336635141996782.4547)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H1'
,p_display_name=>'H1'
,p_display_sequence=>10
,p_css_classes=>'js-headingLevel-1'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4547)
,p_template_types=>'REGION'
,p_help_text=>'H1'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2336917964996782.4547)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H2'
,p_display_name=>'H2'
,p_display_sequence=>20
,p_css_classes=>'js-headingLevel-2'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4547)
,p_template_types=>'REGION'
,p_help_text=>'H2'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2337368425996782.4547)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H3'
,p_display_name=>'H3'
,p_display_sequence=>30
,p_css_classes=>'js-headingLevel-3'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4547)
,p_template_types=>'REGION'
,p_help_text=>'H3'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2337706283996782.4547)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H4'
,p_display_name=>'H4'
,p_display_sequence=>40
,p_css_classes=>'js-headingLevel-4'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4547)
,p_template_types=>'REGION'
,p_help_text=>'H4'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2338144805996782.4547)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H5'
,p_display_name=>'H5'
,p_display_sequence=>50
,p_css_classes=>'js-headingLevel-5'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4547)
,p_template_types=>'REGION'
,p_help_text=>'H5'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2338562059996782.4547)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H6'
,p_display_name=>'H6'
,p_display_sequence=>60
,p_css_classes=>'js-headingLevel-6'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4547)
,p_template_types=>'REGION'
,p_help_text=>'H6'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134384175764258.4547)
,p_theme_id=>3
,p_name=>'LARGELEFT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapLeft'
,p_group_id=>wwv_flow_imp.id(856117102944058028.4547)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134654971764258.4547)
,p_theme_id=>3
,p_name=>'LARGERIGHT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapRight'
,p_group_id=>wwv_flow_imp.id(856117454663058028.4547)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134823880764258.4547)
,p_theme_id=>3
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(856117908453058029.4547)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135009020764258.4547)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>3
,p_css_classes=>'a-Button--large'
,p_group_id=>wwv_flow_imp.id(856116798725058025.4547)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135269851764258.4547)
,p_theme_id=>3
,p_name=>'SMALLLEFT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padLeft'
,p_group_id=>wwv_flow_imp.id(856117102944058028.4547)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135477215764258.4547)
,p_theme_id=>3
,p_name=>'SMALLRIGHT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padRight'
,p_group_id=>wwv_flow_imp.id(856117454663058028.4547)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135634744764258.4547)
,p_theme_id=>3
,p_name=>'INNERBUTTON'
,p_display_name=>'Inner Button'
,p_display_sequence=>2
,p_css_classes=>'a-Button--pill'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4547)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135785730764258.4547)
,p_theme_id=>3
,p_name=>'LASTBUTTON'
,p_display_name=>'Last Button'
,p_display_sequence=>3
,p_css_classes=>'a-Button--pillEnd'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4547)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136068296764258.4547)
,p_theme_id=>3
,p_name=>'FIRSTBUTTON'
,p_display_name=>'First Button'
,p_display_sequence=>1
,p_css_classes=>'a-Button--pillStart'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4547)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136225140764258.4547)
,p_theme_id=>3
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>1
,p_css_classes=>'a-Button--primary'
,p_group_id=>wwv_flow_imp.id(856118261810058029.4547)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136360666764258.4547)
,p_theme_id=>3
,p_name=>'REGIONHEADERBUTTON'
,p_display_name=>'Button in Region Header'
,p_display_sequence=>1
,p_css_classes=>'a-Button--regionHeader'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136507481764259.4547)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--small'
,p_group_id=>wwv_flow_imp.id(856116798725058025.4547)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136620486764259.4547)
,p_theme_id=>3
,p_name=>'STRONGBUTTONLABEL'
,p_display_name=>'Strong Button Label'
,p_display_sequence=>1
,p_css_classes=>'a-Button--strongLabel'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136861925764259.4547)
,p_theme_id=>3
,p_name=>'AUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form--autoWidthLabels'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4547)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137023291764259.4547)
,p_theme_id=>3
,p_name=>'FIXEDWIDTH'
,p_display_name=>'Fixed'
,p_display_sequence=>10
,p_css_classes=>'a-Form--fixedLabels'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4547)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137193234764259.4547)
,p_theme_id=>3
,p_name=>'LABELSABOVE'
,p_display_name=>'Labels Above'
,p_display_sequence=>1
,p_css_classes=>'a-Form--labelsAbove'
,p_group_id=>wwv_flow_imp.id(856116523282058024.4547)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137470293764259.4547)
,p_theme_id=>3
,p_name=>'ALIGNLABELSLEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Form--leftLabels'
,p_group_id=>wwv_flow_imp.id(856114568019058024.4547)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137586003764259.4547)
,p_theme_id=>3
,p_name=>'LABELAUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--autoLabelWidth'
,p_group_id=>wwv_flow_imp.id(856116214022058024.4547)
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137737661764259.4547)
,p_theme_id=>3
,p_name=>'STRETCHFORMFIELD'
,p_display_name=>'Stretch Form Field'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--stretch'
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137933035764259.4547)
,p_theme_id=>3
,p_name=>'FIXEDLARGE'
,p_display_name=>'Fixed (Large Width)'
,p_display_sequence=>30
,p_css_classes=>'a-Form-fixedLabelsLarge'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4547)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138175863764259.4547)
,p_theme_id=>3
,p_name=>'FIXEDMEDIUM'
,p_display_name=>'Fixed (Medium Width)'
,p_display_sequence=>20
,p_css_classes=>'a-Form-fixedLabelsMed'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4547)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138340877764259.4547)
,p_theme_id=>3
,p_name=>'180PX'
,p_display_name=>'180px'
,p_display_sequence=>10
,p_css_classes=>'h180'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4547)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138553321764259.4547)
,p_theme_id=>3
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>20
,p_css_classes=>'h240'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4547)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138777457764259.4547)
,p_theme_id=>3
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>30
,p_css_classes=>'h320'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4547)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138891974764260.4547)
,p_theme_id=>3
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>50
,p_css_classes=>'h480'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4547)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857139153872764260.4547)
,p_theme_id=>3
,p_name=>'540PX'
,p_display_name=>'540px'
,p_display_sequence=>60
,p_css_classes=>'h540'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4547)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857139375337764260.4547)
,p_theme_id=>3
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>70
,p_css_classes=>'h640'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4547)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145206107768768.4547)
,p_theme_id=>3
,p_name=>'USE_COLORED_BACKGROUND'
,p_display_name=>'Use Colored Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4547)
,p_css_classes=>'a-Alert--colorBG'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145328630768768.4547)
,p_theme_id=>3
,p_name=>'USE_DEFAULT_ICONS'
,p_display_name=>'Use Default Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4547)
,p_css_classes=>'a-Alert--defaultIcons'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145505007768768.4547)
,p_theme_id=>3
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4547)
,p_css_classes=>'a-Alert--warning'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4547)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145725778768768.4547)
,p_theme_id=>3
,p_name=>'ERROR'
,p_display_name=>'Error'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4547)
,p_css_classes=>'a-Alert--danger'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4547)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145892117768768.4547)
,p_theme_id=>3
,p_name=>'INFORMATIONAL'
,p_display_name=>'Informational'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4547)
,p_css_classes=>'a-Alert--info'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4547)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146085228768768.4547)
,p_theme_id=>3
,p_name=>'HORIZONTAL'
,p_display_name=>'Horizontal'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4547)
,p_css_classes=>'a-Alert--horizontal'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4547)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146322225768769.4547)
,p_theme_id=>3
,p_name=>'WIZARD'
,p_display_name=>'Wizard'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4547)
,p_css_classes=>'a-Alert--wizard'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4547)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146393064768769.4547)
,p_theme_id=>3
,p_name=>'REMOVE_ICON'
,p_display_name=>'Remove Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4547)
,p_css_classes=>'a-Alert--noIcon'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146615368768769.4547)
,p_theme_id=>3
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4547)
,p_css_classes=>'a-Alert--success'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4547)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147042367768771.4547)
,p_theme_id=>3
,p_name=>'REGIONCONTAINSITEMSTEXT'
,p_display_name=>'Region Contains Items / Text'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4547)
,p_css_classes=>'a-ButtonRegion--withItems'
,p_template_types=>'REGION'
,p_help_text=>'Check this option if this region contains items or text.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147189725768771.4547)
,p_theme_id=>3
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4547)
,p_css_classes=>'a-ButtonRegion--noUI'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4547)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147385795768771.4547)
,p_theme_id=>3
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4547)
,p_css_classes=>'a-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4547)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147655668768771.4547)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4547)
,p_css_classes=>'a-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4547)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147872948768771.4547)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4547)
,p_css_classes=>'a-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4547)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147976018768771.4547)
,p_theme_id=>3
,p_name=>'WIZARDDIALOG'
,p_display_name=>'Used for Wizard Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4547)
,p_css_classes=>'a-ButtonRegion--wizard'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857148162424768771.4547)
,p_theme_id=>3
,p_name=>'VISIBLE'
,p_display_name=>'Visible'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4547)
,p_css_classes=>'a-ButtonRegion--showTitle'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4547)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857148341454768771.4547)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4547)
,p_css_classes=>'a-ButtonRegion--accessibleTitle'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4547)
,p_template_types=>'REGION'
,p_help_text=>'Use this option to add a visually hidden heading which is accessible for screen readers, but otherwise not visible to users.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149438708768778.4547)
,p_theme_id=>3
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4547)
,p_css_classes=>'a-BadgeList--float'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4547)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149614105768778.4547)
,p_theme_id=>3
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4547)
,p_css_classes=>'a-BadgeList--fixed'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4547)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149843563768778.4547)
,p_theme_id=>3
,p_name=>'STACKEDVERTICALLY'
,p_display_name=>'Stacked Vertically'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4547)
,p_css_classes=>'a-BadgeList--stacked'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4547)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149998210768778.4547)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'32px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4547)
,p_css_classes=>'a-BadgeList--small'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4547)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150194417768778.4547)
,p_theme_id=>3
,p_name=>'MEDIUM'
,p_display_name=>'48px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4547)
,p_css_classes=>'a-BadgeList--medium'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4547)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150439507768778.4547)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'64px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4547)
,p_css_classes=>'a-BadgeList--large'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4547)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150608654768780.4547)
,p_theme_id=>3
,p_name=>'XLARGE'
,p_display_name=>'96px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4547)
,p_css_classes=>'a-BadgeList--xlarge'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4547)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150792333768780.4547)
,p_theme_id=>3
,p_name=>'XXLARGE'
,p_display_name=>'128px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4547)
,p_css_classes=>'a-BadgeList--xxlarge'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4547)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151008734768780.4547)
,p_theme_id=>3
,p_name=>'2COLUMNNGRID'
,p_display_name=>'2 Columnn Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4547)
,p_css_classes=>'a-BadgeList--cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4547)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151259777768780.4547)
,p_theme_id=>3
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4547)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--3cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4547)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151408063768780.4547)
,p_theme_id=>3
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4547)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--4cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4547)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151643103768780.4547)
,p_theme_id=>3
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4547)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--5cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4547)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151861194768780.4547)
,p_theme_id=>3
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4547)
,p_css_classes=>'a-BadgeList--flex'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4547)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896798730495581814.4547)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4547)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(808380142596819918.4547)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896798963380581814.4547)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4547)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(808380828683819918.4547)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799089194581814.4547)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4547)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4547)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799349986581814.4547)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4547)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4547)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799577541581814.4547)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4547)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4547)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799637215581814.4547)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4547)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799807498581814.4547)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4547)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_imp.id(808383088145819924.4547)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022191342234716.4547)
,p_theme_id=>3
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4547)
,p_css_classes=>'a-MediaList--cols a-MediaList--2cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4547)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022392217234716.4547)
,p_theme_id=>3
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4547)
,p_css_classes=>'a-MediaList--cols a-MediaList--3cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4547)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022597980234716.4547)
,p_theme_id=>3
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4547)
,p_css_classes=>'a-MediaList--cols a-MediaList--4cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4547)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022867300234717.4547)
,p_theme_id=>3
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4547)
,p_css_classes=>'a-MediaList--cols a-MediaList--5cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4547)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023065592234717.4547)
,p_theme_id=>3
,p_name=>'SPANHORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4547)
,p_css_classes=>'a-MediaList--horizontal'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4547)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023131122234717.4547)
,p_theme_id=>3
,p_name=>'HIDEBADGE'
,p_display_name=>'Hide Badge'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4547)
,p_css_classes=>'a-MediaList--noBadge'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023191297234717.4547)
,p_theme_id=>3
,p_name=>'HIDEDESCRIPTION'
,p_display_name=>'Hide Description'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4547)
,p_css_classes=>'a-MediaList--noDesc'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023315038234717.4547)
,p_theme_id=>3
,p_name=>'HIDETITLE'
,p_display_name=>'Hide Title'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4547)
,p_css_classes=>'a-MediaList--noTitle'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023432264234717.4547)
,p_theme_id=>3
,p_name=>'HIDEICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4547)
,p_css_classes=>'a-MediaList--noIcons'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023494059234717.4547)
,p_theme_id=>3
,p_name=>'SLIMLIST'
,p_display_name=>'Slim List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4547)
,p_css_classes=>'a-MediaList--slim'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378094918666945.4547)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4547)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(808380142596819918.4547)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378225037666947.4547)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4547)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(808380828683819918.4547)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378370589666947.4547)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4547)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4547)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378467813666947.4547)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4547)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378526097666947.4547)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4547)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4547)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378615102666947.4547)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4547)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_imp.id(808383088145819924.4547)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378735377666947.4547)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4547)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4547)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1036071796325339624.4547)
,p_theme_id=>3
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(514332292784430987.4547)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1036071972285339624.4547)
,p_theme_id=>3
,p_name=>'ADD_SLIDE_ANIMATION'
,p_display_name=>'Add Slide Animation'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(514332292784430987.4547)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1050367122398973653.4547)
,p_theme_id=>3
,p_name=>'SLIMPROGRESSLIST'
,p_display_name=>'Slim Progress List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(865273508717512144.4547)
,p_css_classes=>'a-WizardSteps--slim'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1309233880682664517.4547)
,p_theme_id=>3
,p_name=>'LEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_button_template_id=>wwv_flow_imp.id(868252865986181054.4547)
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(856117908453058029.4547)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1351338307429029043.4547)
,p_theme_id=>3
,p_name=>'USED_IN_DIALOG'
,p_display_name=>'Used in Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1274355059486017828.4547)
,p_css_classes=>'a-ProcessingRegion--dialog'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333722717814196.4547)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4547)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333859287814196.4547)
,p_theme_id=>3
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4547)
,p_css_classes=>'a-LinksList--showBadge'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333887728814196.4547)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4547)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334039640814196.4547)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4547)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334247146814196.4547)
,p_theme_id=>3
,p_name=>'FORTOPLEVELONLY'
,p_display_name=>'For top level only'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4547)
,p_css_classes=>'a-LinksList--showTopIcons'
,p_group_id=>wwv_flow_imp.id(806925000765340952.4547)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334455135814196.4547)
,p_theme_id=>3
,p_name=>'FORALLITEMS'
,p_display_name=>'For all items'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4547)
,p_css_classes=>'a-LinksList--showIcons'
,p_group_id=>wwv_flow_imp.id(806925000765340952.4547)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491342397110118.4547)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4547)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491390428110118.4547)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4547)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491480011110118.4547)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4547)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664488722406040473.4547)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4547)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4547)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664488933681040473.4547)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4547)
,p_css_classes=>'a-Region--accessibleHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4547)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489165994040473.4547)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4547)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4547)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489304869040473.4547)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4547)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4547)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489519844040473.4547)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4547)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_imp.id(860570508910721307.4547)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489753255040473.4547)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4547)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4547)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489941797040473.4547)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4547)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4547)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490153471040473.4547)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4547)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4547)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490336091040473.4547)
,p_theme_id=>3
,p_name=>'DEFAULTPADDING'
,p_display_name=>'Default Padding'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4547)
,p_css_classes=>'a-Region--paddedBody'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4547)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490377667040473.4547)
,p_theme_id=>3
,p_name=>'REMOVE_TOP_BORDER'
,p_display_name=>'Remove Top Border'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4547)
,p_css_classes=>'a-Region--noTopBorder'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490659850040473.4547)
,p_theme_id=>3
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4547)
,p_css_classes=>'a-Region--simple'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4547)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664501980442158869.4547)
,p_theme_id=>3
,p_name=>'RESPONSIVEICONCOLUMNS'
,p_display_name=>'Responsive Icon Columns'
,p_display_sequence=>2
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4547)
,p_css_classes=>'a-IRR-region--responsiveIconView'
,p_template_types=>'REGION'
,p_help_text=>'Automatically increases number of icon columns to show based on screen resolution.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664502160891158869.4547)
,p_theme_id=>3
,p_name=>'ICONLABELSRIGHT'
,p_display_name=>'Icon Labels on Right'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4547)
,p_css_classes=>'a-IRR-region--iconLabelsRight'
,p_template_types=>'REGION'
,p_help_text=>'Shows labels in Icon View to the right of the icon.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664502181188158869.4547)
,p_theme_id=>3
,p_name=>'REMOVEOUTERBORDERS'
,p_display_name=>'Remove Outer Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4547)
,p_css_classes=>'a-IRR-region--noOuterBorders'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508367504174332.4547)
,p_theme_id=>3
,p_name=>'FLUSHREGION'
,p_display_name=>'Flush Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4547)
,p_css_classes=>'a-Region--flush'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508426350174332.4547)
,p_theme_id=>3
,p_name=>'STACKEDREGION'
,p_display_name=>'Stacked Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4547)
,p_css_classes=>'a-Region--stacked'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508588305174332.4547)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4547)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4547)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508810521174332.4547)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4547)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4547)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509005841174332.4547)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4547)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_imp.id(860570508910721307.4547)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509270186174332.4547)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4547)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4547)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509448573174333.4547)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4547)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4547)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509659839174333.4547)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4547)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4547)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509822387174334.4547)
,p_theme_id=>3
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>.1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4547)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4547)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664510028962174334.4547)
,p_theme_id=>3
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4547)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4547)
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
 p_id=>wwv_flow_imp.id(144086721380752902)
,p_name=>'4150_COLUMN_NUMBER'
,p_message_language=>'vi'
,p_message_text=>unistr('C\1ED9t %0')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144071365056752898)
,p_name=>'ACCESS_CONTROL_ADMIN'
,p_message_language=>'vi'
,p_message_text=>unistr('Ng\01B0\01A1\0300i qua\0309n tri\0323')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144071234453752898)
,p_name=>'ACCESS_CONTROL_USERNAME'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00EAn ng\01B0\1EDDi d\00F9ng')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144133933284752917)
,p_name=>'ACCESS_DENIED_SIMPLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Quy\1EC1n truy c\1EADp b\1ECB t\1EEB ch\1ED1i')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144090828677752904)
,p_name=>'ACCOUNT_HAS_BEEN_CREATED'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00E0i kho\1EA3n %0 c\1EE7a b\1EA1n \0111\00E3 \0111\01B0\1EE3c t\1EA1o.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144074029498752899)
,p_name=>'ACCOUNT_LOCKED'
,p_message_language=>'vi'
,p_message_text=>unistr('Ta\0300i khoa\0309n na\0300y \0111a\0303 bi\0323 kho\0301a.')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144058514031752894)
,p_name=>'AM_PM'
,p_message_language=>'vi'
,p_message_text=>'AM / PM'
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144041387412752889)
,p_name=>'APEX.ACTIONS.ACTION_LINK'
,p_message_language=>'vi'
,p_message_text=>unistr('li\00EAn k\00EA\0301t ha\0300nh \0111\00F4\0323ng')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144041295514752889)
,p_name=>'APEX.ACTIONS.DIALOG_LINK'
,p_message_language=>'vi'
,p_message_text=>unistr('li\00EAn k\00EA\0301t h\00F4\0323p thoa\0323i')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144205642775752938)
,p_name=>'APEX.ACTIONS.TOGGLE'
,p_message_language=>'vi'
,p_message_text=>unistr('B\00E2\0323t/t\0103\0301t %0')
,p_is_js_message=>true
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144213401837752940)
,p_name=>'APEX.ACTIVE_STATE'
,p_message_language=>'vi'
,p_message_text=>unistr('(\0110ang ho\1EA1t \0111\1ED9ng)')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144018202553752882)
,p_name=>'APEX.AI.CHAT_CLEARED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 xo\0301a cu\00F4\0323c tro\0300 chuy\00EA\0323n')
,p_is_js_message=>true
,p_version_scn=>2705834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144018151453752882)
,p_name=>'APEX.AI.CLEAR_CHAT'
,p_message_language=>'vi'
,p_message_text=>unistr('Xo\0301a cu\00F4\0323c tro\0300 chuy\00EA\0323n')
,p_is_js_message=>true
,p_version_scn=>2705834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144014705498752881)
,p_name=>'APEX.AI.CONSENT_ACCEPT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\00E2\0301p nh\00E2\0323n')
,p_is_js_message=>true
,p_version_scn=>2705833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144014842414752881)
,p_name=>'APEX.AI.CONSENT_DENY'
,p_message_language=>'vi'
,p_message_text=>unistr('T\01B0\0300 ch\00F4\0301i')
,p_is_js_message=>true
,p_version_scn=>2705833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144014562964752881)
,p_name=>'APEX.AI.CONVERSATION_HISTORY'
,p_message_language=>'vi'
,p_message_text=>unistr('Li\0323ch s\01B0\0309 chuy\00EA\0309n \0111\00F4\0309i')
,p_is_js_message=>true
,p_version_scn=>2705833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144017922626752882)
,p_name=>'APEX.AI.COPIED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 sao che\0301p')
,p_is_js_message=>true
,p_version_scn=>2705834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144018076914752882)
,p_name=>'APEX.AI.COPIED_TO_CLIPBOARD'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 sao che\0301p va\0300o ba\0309ng ghi ta\0323m')
,p_is_js_message=>true
,p_version_scn=>2705834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144017705297752882)
,p_name=>'APEX.AI.COPY'
,p_message_language=>'vi'
,p_message_text=>unistr('Sao ch\00E9p')
,p_is_js_message=>true
,p_version_scn=>2705834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144017834596752882)
,p_name=>'APEX.AI.COPY_TO_CLIPBOARD'
,p_message_language=>'vi'
,p_message_text=>unistr('Sao che\0301p sang ba\0309ng ghi ta\0323m')
,p_is_js_message=>true
,p_version_scn=>2705834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144015273232752881)
,p_name=>'APEX.AI.DIALOG_TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\01A1\0323 ly\0301')
,p_is_js_message=>true
,p_version_scn=>2705834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144015694287752881)
,p_name=>'APEX.AI.DISABLED'
,p_message_language=>'vi'
,p_message_text=>unistr('AI bi\0323 v\00F4 hi\00EA\0323u ho\0301a \01A1\0309 c\00E2\0301p \0111\00F4\0323 kh\00F4ng gian la\0300m vi\00EA\0323c ho\0103\0323c ba\0309n \01B0\0301ng du\0323ng.')
,p_version_scn=>2705834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144054958827752893)
,p_name=>'APEX.AI.GET_SERVER_ID_OR_STATIC_ID'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng ti\0300m th\00E2\0301y di\0323ch vu\0323 AI ta\0323o sinh v\01A1\0301i ma\0303 ho\0103\0323c ma\0303 ti\0303nh xa\0301c \0111i\0323nh.')
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144053669119752893)
,p_name=>'APEX.AI.HTTP_4013_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i xa\0301c th\01B0\0323c ho\0103\0323c quy\00EA\0300n truy c\00E2\0323p bi\0323 c\00E2\0301m (HTTP-%1) \0111\00F4\0301i v\01A1\0301i URL %0. Ha\0303y ki\00EA\0309m tra c\00E2\0301u hi\0300nh cu\0309a Di\0323ch vu\0323 AI ta\0323o sinh %2.')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144033427698752887)
,p_name=>'APEX.AI.HTTP_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('Y\00EAu c\00E2\0300u HTTP t\01A1\0301i Di\0323ch vu\0323 AI ta\0323o sinh ta\0323i %0 kh\00F4ng tha\0300nh c\00F4ng v\01A1\0301i HTTP-%1: %2')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144057814661752894)
,p_name=>'APEX.AI.HTTP_FRIENDLY_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i trong y\00EAu c\00E2\0300u HTTP t\01A1\0301i Di\0323ch vu\0323 AI ta\0323o sinh cho tri\0300nh b\00F4\0309 tr\01A1\0323 %0 \01A1\0309 ch\00EA\0301 \0111\00F4\0323 %1. Ha\0303y ki\00EA\0309m tra c\00E2\0301u hi\0300nh cu\0309a Di\0323ch vu\0323 AI ta\0323o sinh.')
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144020689618752883)
,p_name=>'APEX.AI.MAIN_QUICK_ACTIONS_ARIA_LABEL'
,p_message_language=>'vi'
,p_message_text=>unistr('Vi\0301 du\0323')
,p_is_js_message=>true
,p_version_scn=>2705835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144019066963752882)
,p_name=>'APEX.AI.NAME_ASSISTANT'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\01A1\0323 ly\0301')
,p_is_js_message=>true
,p_version_scn=>2705835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144020400905752883)
,p_name=>'APEX.AI.NAME_COMMA_MESSAGE'
,p_message_language=>'vi'
,p_message_text=>'%0,%1'
,p_is_js_message=>true
,p_version_scn=>2705835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144018991738752882)
,p_name=>'APEX.AI.NAME_USER'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0323n')
,p_is_js_message=>true
,p_version_scn=>2705835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144049652832752891)
,p_name=>'APEX.AI.OCI_CHAT_NOT_SUPPORTED'
,p_message_language=>'vi'
,p_message_text=>unistr('AI ta\0323o sinh OCI hi\00EA\0323n kh\00F4ng h\00F4\0303 tr\01A1\0323 tra\0309i nghi\00EA\0323m tro\0300 chuy\00EA\0323n co\0301 nhi\00EA\0300u tin nh\0103\0301n.')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144029509157752885)
,p_name=>'APEX.AI.PROMPT_ENRICHMENT_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i khi x\01B0\0309 ly\0301 l\01A1\0300i nh\0103\0301c %0 cho \01B0\0301ng du\0323ng %1. Ha\0303y ki\00EA\0309m tra xem Tri\0300nh ta\0323o \01B0\0301ng du\0323ng co\0301 du\0300ng \0111\01B0\01A1\0323c cho th\01B0\0323c th\00EA\0309 na\0300y hay kh\00F4ng.')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144034648968752887)
,p_name=>'APEX.AI.RESPONSE_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\00EA\0309 x\01B0\0309 ly\0301 pha\0309n h\00F4\0300i cho Di\0323ch vu\0323 AI %0, pha\0309n h\00F4\0300i %1')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144040890914752889)
,p_name=>'APEX.AI.SEND_MESSAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('G\01B0\0309i tin nh\0103\0301n')
,p_is_js_message=>true
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144029130101752885)
,p_name=>'APEX.AI.SERVICE_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\1ED7i trong D\1ECBch v\1EE5 AI ph\1EE5 tr\1EE3 %0')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144014918898752881)
,p_name=>'APEX.AI.TEXTAREA_LABEL'
,p_message_language=>'vi'
,p_message_text=>unistr('Tin nh\0103\0301n')
,p_is_js_message=>true
,p_version_scn=>2705834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144015006521752881)
,p_name=>'APEX.AI.TEXTAREA_PLACEHOLDER'
,p_message_language=>'vi'
,p_message_text=>unistr('Nh\00E2\0323p tin nh\0103\0301n cu\0309a ba\0323n ta\0323i \0111\00E2y')
,p_is_js_message=>true
,p_version_scn=>2705834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144018354376752882)
,p_name=>'APEX.AI.USER_AVATAR'
,p_message_language=>'vi'
,p_message_text=>unistr('Hi\0300nh \0111a\0323i di\00EA\0323n cu\0309a ng\01B0\01A1\0300i du\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144018474602752882)
,p_name=>'APEX.AI.USE_THIS'
,p_message_language=>'vi'
,p_message_text=>unistr('S\01B0\0309 du\0323ng mu\0323c na\0300y')
,p_is_js_message=>true
,p_version_scn=>2705835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144015177201752881)
,p_name=>'APEX.AI.WARN_UNSENT_MESSAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0323n co\0301 tin nh\0103\0301n ch\01B0a g\01B0\0309i, ba\0323n co\0301 ch\0103\0301c ch\0103\0301n kh\00F4ng?')
,p_is_js_message=>true
,p_version_scn=>2705834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144184101172752932)
,p_name=>'APEX.AJAX_SERVER_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00EA\0323nh go\0323i Ajax \0111a\0303 tra\0309 v\00EA\0300 l\00F4\0303i ma\0301y chu\0309 %0 cho %1.')
,p_version_scn=>2705859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144111273489752910)
,p_name=>'APEX.APPLICATION.ALIAS.NON_UNIQUE'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\1EC3 chuy\1EC3n \0111\1ED5i b\00ED danh \1EE9ng d\1EE5ng "%0" th\00E0nh ma\0303 \1EE9ng d\1EE5ng duy nh\1EA5t.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144100097671752906)
,p_name=>'APEX.APPLICATION.ALIAS.UNHANDLED_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('ERR-1816 L\00F4\0303i kh\00F4ng mong \0111\01A1\0323i khi chuy\00EA\0309n \0111\00F4\0309i bi\0301 danh \01B0\0301ng du\0323ng p_flow_alias_or_id (%0).')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144197423249752936)
,p_name=>'APEX.APPLICATION.CHECKSUM.DESCRIPTION'
,p_message_language=>'vi'
,p_message_text=>unistr('Gia\0301 tri\0323 t\00F4\0309ng ki\00EA\0309m \01B0\0301ng du\0323ng giu\0301p d\00EA\0303 da\0300ng xa\0301c \0111i\0323nh li\00EA\0323u cu\0300ng m\00F4\0323t \01B0\0301ng du\0323ng co\0301 \0111\01B0\01A1\0323c tri\00EA\0309n khai tr\00EAn ca\0301c kh\00F4ng gian la\0300m vi\00EA\0323c hay kh\00F4ng. Ba\0323n co\0301 th\00EA\0309 so sa\0301nh gia\0301 tri\0323 t\00F4\0309ng ki\00EA\0309m na\0300y \0111\00EA\0309 xa\0301c \0111i\0323nh xem co\0301 gia\0301 tri\0323 tru\0300ng kh\01A1\0301p k')
||unistr('h\00F4ng. ')
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144084002448752902)
,p_name=>'APEX.AUTHENTICATION.AUTH_FUNC.UNHANDLED_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i khi x\01B0\0309 ly\0301 ch\01B0\0301c n\0103ng xa\0301c th\01B0\0323c.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144066057944752896)
,p_name=>'APEX.AUTHENTICATION.AUTH_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i khi x\01B0\0309 ly\0301 ch\01B0\0301c n\0103ng xa\0301c th\01B0\0323c.')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144237938908752948)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.HOST_PREFIX_MISMATCH'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00EAn \0111\00F4\0301i t\01B0\01A1\0323ng thu\00EA %0 do Oracle Cloud Identity Management tra\0309 v\00EA\0300 kh\00F4ng \0111\01B0\01A1\0323c u\0309y quy\00EA\0300n \0111\00F4\0301i v\01A1\0301i mi\00EA\0300n %1!<br/>Ha\0303y <a href="&LOGOUT_URL.">\0111\0103ng nh\00E2\0323p la\0323i</a> va\0300 chi\0309 \0111i\0323nh m\00F4\0323t t\00EAn \0111\00F4\0301i t\01B0\01A1\0323ng thu\00EA \0111\01B0\01A1\0323c u\0309y quy\00EA\0300n ho\0103\0323c thay \0111\00F4\0309i URL cu\0309a ba\0323')
||'n.'
,p_version_scn=>2705870
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144062140199752895)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.USER_IS_NOT_DEVELOPER'
,p_message_language=>'vi'
,p_message_text=>unistr('Ta\0300i khoa\0309n "%0" cu\0309a ba\0323n kh\00F4ng co\0301 ca\0301c \0111\0103\0323c quy\00EA\0300n pha\0301t tri\00EA\0309n c\00E2\0300n thi\00EA\0301t (DB_DEVELOPER ho\0103\0323c DB_ADMINISTRATOR)<br/>\0111\00F4\0301i v\01A1\0301i kh\00F4ng gian la\0300m vi\00EA\0323c "%1"! Ha\0303y <a href="&LOGOUT_URL.">\0111\0103ng nh\00E2\0323p la\0323i</a> sau khi \0111\01B0\01A1\0323c c\00E2\0301p ca\0301c \0111\0103\0323c quy\00EA\0300n.')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144058752071752894)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.WRONG_GROUP_NAME'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00EAn \0111\00F4\0301i t\01B0\01A1\0323ng thu\00EA do Oracle Cloud Identity Management tra\0309 v\00EA\0300 kh\00F4ng \0111\01B0\01A1\0323c u\0309y quy\00EA\0300n \0111\00F4\0301i v\01A1\0301i kh\00F4ng gian la\0300m vi\00EA\0323c hi\00EA\0323n ta\0323i!<br/>Ha\0303y <a href="&LOGOUT_URL.">\0111\0103ng nh\00E2\0323p la\0323i</a> va\0300 chi\0309 \0111i\0323nh m\00F4\0323t t\00EAn \0111\00F4\0301i t\01B0\01A1\0323ng thu\00EA \0111\01B0\01A1\0323c u\0309y quy\00EA\0300n.')
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144062233711752895)
,p_name=>'APEX.AUTHENTICATION.HOST_PREFIX_MISMATCH'
,p_message_language=>'vi'
,p_message_text=>unistr('V\00EC l\00FD do b\1EA3o m\1EADt, kh\00F4ng \0111\01B0\1EE3c ph\00E9p ch\1EA1y c\00E1c \1EE9ng d\1EE5ng c\1EE7a kh\00F4ng gian l\00E0m vi\1EC7c n\00E0y th\00F4ng qua mi\1EC1n trong URL.')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144083782792752902)
,p_name=>'APEX.AUTHENTICATION.LDAP.DBMS_LDAP.ASK_FOR_INSTALLATION'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0303y \0111\00EA\0300 nghi\0323 ng\01B0\01A1\0300i qua\0309n tri\0323 c\01A1 s\01A1\0309 d\01B0\0303 li\00EA\0323u cu\0309a ba\0323n cha\0323y $OH/rdbms/admin/catldap.sql.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144083657781752902)
,p_name=>'APEX.AUTHENTICATION.LDAP.DBMS_LDAP.MISSING'
,p_message_language=>'vi'
,p_message_text=>unistr('Go\0301i SYS.DBMS_LDAP kh\00F4ng t\00F4\0300n ta\0323i ho\0103\0323c kh\00F4ng h\01A1\0323p l\00EA\0323.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144083578956752901)
,p_name=>'APEX.AUTHENTICATION.LDAP.EDIT_USER_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\1ED7i khi x\1EED l\00FD ha\0300m ch\1EC9nh s\1EEDa ng\01B0\1EDDi d\00F9ng LDAP.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144083884804752902)
,p_name=>'APEX.AUTHENTICATION.LDAP.UNHANDLED_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i khi x\01B0\0309 ly\0301 xa\0301c th\01B0\0323c LDAP.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144084660727752902)
,p_name=>'APEX.AUTHENTICATION.LOGIN.ILLEGAL_PAGE_ARG'
,p_message_language=>'vi'
,p_message_text=>unistr('L\1ED7i trong \0111\1ED1i s\1ED1 p_flow_page \0111\1ED1i v\1EDBi quy tri\0300nh login_page.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144084273719752902)
,p_name=>'APEX.AUTHENTICATION.LOGIN.INVALID_ARG'
,p_message_language=>'vi'
,p_message_text=>unistr('p_session kh\00F4ng h\01A1\0323p l\00EA\0323 trong wwv_flow_custom_auth_std.login--p_flow_page:%0 p_session_id:%1.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144135547206752917)
,p_name=>'APEX.AUTHENTICATION.LOGIN.MALFORMED_ARGS'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\1ED1i s\1ED1 kh\00F4ng \0111\00FAng \0111\1ECBnh d\1EA1ng cho wwv_flow_custom_auth_std.login--p_flow_page:p_session_id:p_entry_point:%0:%1:%2.')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144084397701752902)
,p_name=>'APEX.AUTHENTICATION.LOGIN.NULL_USER'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 chuy\00EA\0309n t\00EAn ng\01B0\01A1\0300i du\0300ng bi\0323 r\00F4\0303ng cho quy tri\0300nh \0111\0103ng nh\00E2\0323p.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144071144650752898)
,p_name=>'APEX.AUTHENTICATION.LOGIN_THROTTLE.COUNTER'
,p_message_language=>'vi'
,p_message_text=>unistr('Vui lo\0300ng \0111\01A1\0323i <span id="apex_login_throttle_sec">%0</span> gi\00E2y \0111\00EA\0309 \0111\0103ng nh\00E2\0323p la\0323i.')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144072490261752898)
,p_name=>'APEX.AUTHENTICATION.LOGIN_THROTTLE.ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('N\1ED7 l\1EF1c \0111\0103ng nh\1EADp \0111\00E3 b\1ECB ch\1EB7n.')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144133257431752916)
,p_name=>'APEX.AUTHENTICATION.NOT_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng ti\0300m th\00E2\0301y ph\00E2\0300n xa\0301c th\01B0\0323c "%0"')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144072912359752898)
,p_name=>'APEX.AUTHENTICATION.NO_SECURITY_GROUP_ID'
,p_message_language=>'vi'
,p_message_text=>unistr('Ma\0303 nho\0301m ba\0309o m\00E2\0323t bi\0323 r\00F4\0303ng.')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144084184694752902)
,p_name=>'APEX.AUTHENTICATION.POST_AUTH_PROC.UNHANDLED_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\1ED7i khi th\01B0\0323c thi quy tr\00ECnh h\00E2\0323u x\00E1c th\1EF1c.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144083967765752902)
,p_name=>'APEX.AUTHENTICATION.PRE_AUTH_PROC.UNHANDLED_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\1ED7i khi x\1EED l\00FD quy tr\00ECnh ti\00EA\0300n x\00E1c th\1EF1c.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144085635046752902)
,p_name=>'APEX.AUTHENTICATION.RESET_PASSWORD.INSTRUCTIONS'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Ha\0303y m\1EDF URL trong c\00F9ng m\00F4\0323t tr\00ECnh duy\1EC7t m\00E0 b\1EA1n du\0300ng \0111\00EA\0309 kh\01A1\0309i ta\0323o y\00EAu c\1EA7u \0110\1EB7t l\1EA1i m\1EADt kh\1EA9u. N\1EBFu b\1EA1n nh\1EA5p v\00E0o URL \0111\1EB7t l\1EA1i m\1EADt kh\1EA9u v\00E0 \0111\01B0\1EE3c chuy\1EC3n h\01B0\01A1\0301ng \0111\1EBFn'),
unistr('trang \0111\0103ng nh\1EADp, ha\0303y kh\01A1\0309i ta\0323o l\1EA1i y\00EAu c\00E2\0300u \0110\1EB7t l\1EA1i m\1EADt kh\1EA9u v\00E0 \0111\1EC3 m\01A1\0309'),
unistr('tr\00ECnh duy\1EC7t na\0300y.')))
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144235440662752947)
,p_name=>'APEX.AUTHENTICATION.RESET_PASSWORD_URL'
,p_message_language=>'vi'
,p_message_text=>unistr('URL \0111\0103\0323t la\0323i m\00E2\0323t kh\00E2\0309u')
,p_version_scn=>2705869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144062428881752895)
,p_name=>'APEX.AUTHENTICATION.RM_GROUP_NOT_GRANTED'
,p_message_language=>'vi'
,p_message_text=>unistr('Nho\0301m \01B0\0301ng du\0323ng du\0300ng Tri\0300nh qua\0309n ly\0301 ta\0300i nguy\00EAn %0 ch\01B0a \0111\01B0\01A1\0323c c\00E2\0301p quy\00EA\0300n %1')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144062577107752895)
,p_name=>'APEX.AUTHENTICATION.RM_INFO_TO_GRANT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0303y s\01B0\0309 du\0323ng DBMS_RESOURCE_MANAGER_PRIVS.GRANT_SWITCH_CONSUMER_GROUP \0111\00EA\0309 c\00E2\0301p \0111\0103\0323c quy\00EA\0300n co\0300n thi\00EA\0301u.')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144097133452752906)
,p_name=>'APEX.AUTHENTICATION.SESSION_SENTRY_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\1ED7i khi x\1EED l\00FD ch\1EE9c n\0103ng theo do\0303i phi\00EAn.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144097234159752906)
,p_name=>'APEX.AUTHENTICATION.SESSION_VERIFY_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\1ED7i khi x\1EED l\00FD ch\1EE9c n\0103ng x\00E1c minh phi\00EAn.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144097470266752906)
,p_name=>'APEX.AUTHENTICATION.SSO.ASK_FOR_INSTALLATION'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0303y y\00EAu c\1EA7u ng\01B0\01A1\0300i qu\1EA3n tr\1ECB %0 c\1EE7a b\1EA1n \0111\1ECBnh c\1EA5u h\00ECnh c\00F4ng c\1EE5 cho quy tri\0300nh \0110\0103ng nh\1EADp m\1ED9t l\1EA7n (SSO) tr\00EAn Oracle Application Server.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144107872284752909)
,p_name=>'APEX.AUTHENTICATION.SSO.BAD_URLC'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng h\01A1\0323p l\00EA\0323 trong ma\0303 th\00F4ng ba\0301o %1 do sso tra\0309 v\00EA\0300.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144084575575752902)
,p_name=>'APEX.AUTHENTICATION.SSO.FIX_PARTNER_APP'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0303y chi\0309nh s\01B0\0309a l\01B0\01A1\0323c \0111\00F4\0300 xa\0301c th\01B0\0323c va\0300 th\00EAm t\00EAn \01B0\0301ng du\0323ng.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144107579273752909)
,p_name=>'APEX.AUTHENTICATION.SSO.ILLEGAL_CALLER'
,p_message_language=>'vi'
,p_message_text=>unistr('Tri\0300nh go\0323i kh\00F4ng h\01A1\0323p l\00EA\0323 cu\0309a quy tri\0300nh %0:')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144107739854752909)
,p_name=>'APEX.AUTHENTICATION.SSO.INVALID_APP_SESSION'
,p_message_language=>'vi'
,p_message_text=>unistr('Phi\00EAn \01B0\0301ng du\0323ng kh\00F4ng h\01A1\0323p l\00EA\0323 trong m\00E3 th\00F4ng b\00E1o urlc: %0')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144107396634752909)
,p_name=>'APEX.AUTHENTICATION.SSO.MISSING_APP_REGISTRATION'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i trong portal_sso_redirect: thi\00EA\0301u th\00F4ng tin \0111\0103ng ky\0301 \01B0\0301ng du\0323ng: %0')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144097355483752906)
,p_name=>'APEX.AUTHENTICATION.SSO.PACKAGE_MISSING'
,p_message_language=>'vi'
,p_message_text=>unistr('Go\0301i WWSEC_SSO_ENABLER_PRIVATE kh\00F4ng t\00F4\0300n ta\0323i ho\0103\0323c kh\00F4ng h\01A1\0323p l\00EA\0323.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144084484983752902)
,p_name=>'APEX.AUTHENTICATION.SSO.PARTNER_APP_IS_NULL'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\1EC3 t\00ECm th\1EA5y t\00EAn \1EE9ng d\1EE5ng \0111\1ED1i t\00E1c \0111\00E3 \0111\0103ng k\00FD trong l\01B0\01A1\0323c \0111\1ED3 x\00E1c th\1EF1c.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144107434031752909)
,p_name=>'APEX.AUTHENTICATION.SSO.REGISTER_APP'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0303y \0111\0103ng ky\0301 \01B0\0301ng du\0323ng na\0300y nh\01B0 m\00F4 ta\0309 trong h\01B0\01A1\0301ng d\00E2\0303n ca\0300i \0111\0103\0323t.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144097501453752906)
,p_name=>'APEX.AUTHENTICATION.SSO.UNHANDLED_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i khi x\01B0\0309 ly\0301 xa\0301c th\01B0\0323c SSO.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144210821781752940)
,p_name=>'APEX.AUTHENTICATION.UNAUTHORIZED_URL'
,p_message_language=>'vi'
,p_message_text=>unistr('URL tr\00E1i ph\00E9p: %0')
,p_version_scn=>2705865
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144096983030752905)
,p_name=>'APEX.AUTHENTICATION.UNHANDLED_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i khi x\01B0\0309 ly\0301 xa\0301c th\01B0\0323c.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144062351469752895)
,p_name=>'APEX.AUTHENTICATION.WORKSPACE_NOT_ASSIGNED'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng gian l\00E0m vi\1EC7c "%0" kh\00F4ng ho\1EA1t \0111\1ED9ng. Ha\0303y li\00EAn h\00EA\0323 ng\01B0\01A1\0300i qu\1EA3n tr\1ECB.')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144063052184752895)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED'
,p_message_language=>'vi'
,p_message_text=>'%0'
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144072117370752898)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED.APPLICATION'
,p_message_language=>'vi'
,p_message_text=>unistr('Quy\1EC1n truy c\1EADp b\1ECB quy tri\0300nh ki\1EC3m tra b\1EA3o m\1EADt \1EE9ng d\1EE5ng t\1EEB ch\1ED1i')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144072219435752898)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED.PAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('Quy\1EC1n truy c\1EADp b\1ECB quy tri\0300nh ki\1EC3m tra b\1EA3o m\1EADt trang t\1EEB ch\1ED1i')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144072358532752898)
,p_name=>'APEX.AUTHORIZATION.UNHANDLED_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i khi x\01B0\0309 ly\0301 u\0309y quy\00EA\0300n.')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144141433017752919)
,p_name=>'APEX.BUILT_WITH_LOVE_USING_APEX'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\01B0\01A1\0323c ta\0323o n\00EAn t\01B0\0300 %0 b\0103\0300ng %1')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144141527680752919)
,p_name=>'APEX.BUILT_WITH_LOVE_USING_APEX.ACCESSIBLE.LOVE'
,p_message_language=>'vi'
,p_message_text=>unistr('ti\0300nh y\00EAu')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144201389509752937)
,p_name=>'APEX.CALENDAR.EVENT_DESCRIPTION'
,p_message_language=>'vi'
,p_message_text=>unistr('M\00F4 t\1EA3 s\1EF1 ki\1EC7n')
,p_is_js_message=>true
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144201130214752937)
,p_name=>'APEX.CALENDAR.EVENT_END'
,p_message_language=>'vi'
,p_message_text=>unistr('Nga\0300y k\00EA\0301t thu\0301c')
,p_is_js_message=>true
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144201496819752937)
,p_name=>'APEX.CALENDAR.EVENT_ID'
,p_message_language=>'vi'
,p_message_text=>unistr('Ma\0303 s\01B0\0323 ki\00EA\0323n')
,p_is_js_message=>true
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144201075097752937)
,p_name=>'APEX.CALENDAR.EVENT_START'
,p_message_language=>'vi'
,p_message_text=>unistr('Nga\0300y b\0103\0301t \0111\00E2\0300u')
,p_is_js_message=>true
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144201201680752937)
,p_name=>'APEX.CALENDAR.EVENT_TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\00EAu \0111\00EA\0300 s\01B0\0323 ki\00EA\0323n')
,p_is_js_message=>true
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144043851636752890)
,p_name=>'APEX.CARD'
,p_message_language=>'vi'
,p_message_text=>unistr('The\0309')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144044055652752890)
,p_name=>'APEX.CARD.CARD_ACTION'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0300nh \0111\00F4\0323ng \0111\00F4\0301i v\01A1\0301i the\0309')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144084778545752902)
,p_name=>'APEX.CHECKBOX.VISUALLY_HIDDEN_CHECKBOX'
,p_message_language=>'vi'
,p_message_text=>unistr('H\00F4\0323p cho\0323n kh\00F4ng hi\00EA\0309n thi\0323')
,p_is_js_message=>true
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144086670079752902)
,p_name=>'APEX.CHECKSUM.CONTENT_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i n\00F4\0323i dung t\00F4\0309ng ki\00EA\0309m')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144086529029752902)
,p_name=>'APEX.CHECKSUM.FORMAT_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i \0111i\0323nh da\0323ng t\00F4\0309ng ki\00EA\0309m')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144156481885752923)
,p_name=>'APEX.CLIPBOARD.COPIED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 sao che\0301p va\0300o ba\0309ng ghi ta\0323m.')
,p_is_js_message=>true
,p_version_scn=>2705854
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144155931281752923)
,p_name=>'APEX.CLIPBOARD.NOTSUP'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\00ECnh duy\1EC7t n\00E0y kh\00F4ng h\1ED7 tr\1EE3 sao ch\00E9p t\1EEB m\00F4\0323t n\00FAt ho\1EB7c tri\0300nh \0111\01A1n. H\00E3y th\1EED du\0300ng t\00F4\0309 h\01A1\0323p phi\0301m Ctrl+C ho\1EB7c Command+C.')
,p_version_scn=>2705854
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144142129672752919)
,p_name=>'APEX.CLOSE_NOTIFICATION'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110o\0301ng')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144020525526752883)
,p_name=>'APEX.CODE_EDITOR.MAXIMUM_LENGTH_EXCEEDED'
,p_message_language=>'vi'
,p_message_text=>unistr('N\00F4\0323i dung cu\0309a Tri\0300nh chi\0309nh s\01B0\0309a ma\0303 v\01B0\01A1\0323t qua\0301 \0111\00F4\0323 da\0300i t\00F4\0301i \0111a cu\0309a mu\0323c (th\01B0\0323c t\00EA\0301 la\0300 %0, \0111\01B0\01A1\0323c phe\0301p co\0301 %1 ky\0301 t\01B0\0323)')
,p_is_js_message=>true
,p_version_scn=>2705835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144200606274752936)
,p_name=>'APEX.COLOR_PICKER.CONTRAST'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\1ED9 t\01B0\01A1ng ph\1EA3n')
,p_is_js_message=>true
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144195199670752935)
,p_name=>'APEX.COLOR_PICKER.CURRENT'
,p_message_language=>'vi'
,p_message_text=>unistr('Hi\00EA\0323n ta\0323i')
,p_is_js_message=>true
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144195024789752935)
,p_name=>'APEX.COLOR_PICKER.INITIAL'
,p_message_language=>'vi'
,p_message_text=>unistr('Ban \0111\00E2\0300u')
,p_is_js_message=>true
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144199234876752936)
,p_name=>'APEX.COLOR_PICKER.INVALID_COLOR'
,p_message_language=>'vi'
,p_message_text=>unistr('#LABEL# pha\0309i la\0300 ma\0300u h\01A1\0323p l\00EA\0323. Vi\0301 du\0323: %0')
,p_is_js_message=>true
,p_version_scn=>2705863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144061678976752895)
,p_name=>'APEX.COLOR_PICKER.MORE_PRESET_COLORS'
,p_message_language=>'vi'
,p_message_text=>unistr('Ma\0300u kha\0301c')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144061796452752895)
,p_name=>'APEX.COLOR_PICKER.OPEN'
,p_message_language=>'vi'
,p_message_text=>unistr('M\01A1\0309 b\00F4\0323 cho\0323n ma\0300u')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144018878966752882)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.ALPHA_SLIDER'
,p_message_language=>'vi'
,p_message_text=>unistr('Thanh tr\01B0\1EE3t alpha, thanh tr\01B0\1EE3t ngang. S\1EED d\1EE5ng c\00E1c ph\00EDm m\0169i t\00EAn \0111\1EC3 \0111i\1EC1u h\01B0\1EDBng.')
,p_is_js_message=>true
,p_version_scn=>2705835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144018513909752882)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.COLOR_SPECTRUM'
,p_message_language=>'vi'
,p_message_text=>unistr('Thanh tr\01B0\01A1\0323t 4 h\01B0\01A1\0301ng \0111i\00EA\0300u chi\0309nh ph\00F4\0309 ma\0300u. S\01B0\0309 du\0323ng ca\0301c phi\0301m mu\0303i t\00EAn \0111\00EA\0309 \0111i\00EA\0300u h\01B0\01A1\0301ng.')
,p_is_js_message=>true
,p_version_scn=>2705835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144018650524752882)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.HUE_SLIDER'
,p_message_language=>'vi'
,p_message_text=>unistr('Thanh tr\01B0\1EE3t ma\0300u s\0103\0301c, thanh tr\01B0\1EE3t d\1ECDc. S\1EED d\1EE5ng c\00E1c ph\00EDm m\0169i t\00EAn \0111\1EC3 \0111i\1EC1u h\01B0\1EDBng.')
,p_is_js_message=>true
,p_version_scn=>2705835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144194985747752935)
,p_name=>'APEX.COLOR_PICKER.TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho\0323n ma\0300u')
,p_is_js_message=>true
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144195220163752935)
,p_name=>'APEX.COLOR_PICKER.TOGGLE_TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Thay \0111\00F4\0309i \0111i\0323nh da\0323ng ma\0300u')
,p_is_js_message=>true
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144233192345752946)
,p_name=>'APEX.COMBOBOX.LIST_OF_VALUES'
,p_message_language=>'vi'
,p_message_text=>unistr('Danh sa\0301ch gia\0301 tri\0323')
,p_is_js_message=>true
,p_version_scn=>2705868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144233255885752946)
,p_name=>'APEX.COMBOBOX.SHOW_ALL_VALUES'
,p_message_language=>'vi'
,p_message_text=>unistr('M\01A1\0309 danh sa\0301ch cho: %0')
,p_is_js_message=>true
,p_version_scn=>2705868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144213533423752940)
,p_name=>'APEX.COMPLETED_STATE'
,p_message_language=>'vi'
,p_message_text=>unistr('(\0110a\0303 hoa\0300n th\00E0nh)')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144102457671752907)
,p_name=>'APEX.CONTACT_ADMIN'
,p_message_language=>'vi'
,p_message_text=>unistr('H\00E3y li\00EAn h\1EC7 ng\01B0\01A1\0300i qua\0309n tri\0323 \01B0\0301ng du\0323ng cu\0309a ba\0323n.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144117976610752912)
,p_name=>'APEX.CONTACT_ADMIN.DEBUG'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Ha\0303y li\00EAn h\1EC7 ng\01B0\01A1\0300i qu\1EA3n tr\1ECB \1EE9ng d\1EE5ng c\1EE7a b\1EA1n.'),
unistr('Ba\0323n co\0301 th\00EA\0309 xem th\00F4ng tin chi ti\1EBFt v\1EC1 s\1EF1 c\1ED1 n\00E0y th\00F4ng qua ma\0303 g\1EE1 l\1ED7i "%0".')))
,p_version_scn=>2705848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144199596154752936)
,p_name=>'APEX.CORRECT_ERRORS'
,p_message_language=>'vi'
,p_message_text=>unistr('S\1EEDa l\1ED7i tr\01B0\1EDBc khi l\01B0u.')
,p_is_js_message=>true
,p_version_scn=>2705863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144044809891752890)
,p_name=>'APEX.CS.ACTIVE_VALUE_CHIP'
,p_message_language=>'vi'
,p_message_text=>unistr('%0. Nh\00E2\0301n phi\0301m Backspace \0111\00EA\0309 xo\0301a.')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144143080779752919)
,p_name=>'APEX.CS.MATCHES_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\0300m th\00E2\0301y %0 k\00EA\0301t qua\0309 phu\0300 h\01A1\0323p')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144024938588752884)
,p_name=>'APEX.CS.MATCH_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\0300m th\00E2\0301y 1 k\00EA\0301t qua\0309 phu\0300 h\01A1\0323p')
,p_is_js_message=>true
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144142959874752919)
,p_name=>'APEX.CS.NO_MATCHES'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng ti\0300m th\00E2\0301y k\00EA\0301t qua\0309 phu\0300 h\01A1\0323p')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144019372520752882)
,p_name=>'APEX.CS.OTHERS_GROUP'
,p_message_language=>'vi'
,p_message_text=>unistr('Kha\0301c')
,p_is_js_message=>true
,p_version_scn=>2705835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144019281850752882)
,p_name=>'APEX.CS.SELECTED_VALUES_COUNTER'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 cho\0323n %0 gia\0301 tri\0323')
,p_is_js_message=>true
,p_version_scn=>2705835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144214051077752940)
,p_name=>'APEX.CURRENT_PROGRESS'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\00EA\0301n \0111\00F4\0323 hi\00EA\0323n ta\0323i')
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144199929925752936)
,p_name=>'APEX.DATA.LOAD.FILE_DOES_NOT_EXIST'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00E2\0323p tin \0111a\0303 chi\0309 \0111i\0323nh trong mu\0323c %0 kh\00F4ng t\00F4\0300n ta\0323i trong APEX_APPLICATION_TEMP_FILES.')
,p_version_scn=>2705863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144188477377752933)
,p_name=>'APEX.DATA_HAS_CHANGED'
,p_message_language=>'vi'
,p_message_text=>unistr('Phi\00EAn b\1EA3n hi\1EC7n t\1EA1i c\1EE7a d\1EEF li\1EC7u trong c\01A1 s\1EDF d\1EEF li\1EC7u \0111\00E3 thay \0111\1ED5i k\1EC3 t\1EEB khi ng\01B0\1EDDi d\00F9ng kh\01A1\0309i cha\0323y quy tr\00ECnh c\1EADp nh\1EADt.')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144157580614752924)
,p_name=>'APEX.DATA_LOAD.DO_NOT_LOAD'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng ta\0309i')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144203858083752937)
,p_name=>'APEX.DATA_LOAD.FAILED'
,p_message_language=>'vi'
,p_message_text=>unistr('L\1ED7i ti\1EC1n x\1EED l\00FD')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144203670936752937)
,p_name=>'APEX.DATA_LOAD.INSERT'
,p_message_language=>'vi'
,p_message_text=>unistr('Che\0300n ha\0300ng')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144217289845752941)
,p_name=>'APEX.DATA_LOAD.SEQUENCE_ACTION'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\01B0\0301 t\01B0\0323: Ha\0300nh \0111\00F4\0323ng')
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144203711744752937)
,p_name=>'APEX.DATA_LOAD.UPDATE'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00E2\0323p nh\00E2\0323t ha\0300ng')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144032215017752886)
,p_name=>'APEX.DATEPICKER.ACTIONS'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0300nh \0111\00F4\0323ng')
,p_is_js_message=>true
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144059857399752894)
,p_name=>'APEX.DATEPICKER.AM_PM'
,p_message_language=>'vi'
,p_message_text=>'AM/PM'
,p_is_js_message=>true
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144045925711752890)
,p_name=>'APEX.DATEPICKER.BOUNDARY_ITEM_FORMAT_INVALID'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 pha\0309i la\0300 m\00F4\0323t b\00F4\0323 cho\0323n nga\0300y ho\0103\0323c m\00F4\0323t nga\0300y h\01A1\0323p l\00EA\0323, vi\0301 du\0323: %1.')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144155107928752923)
,p_name=>'APEX.DATEPICKER.CLEAR'
,p_message_language=>'vi'
,p_message_text=>unistr('Xo\0301a')
,p_is_js_message=>true
,p_version_scn=>2705852
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144063357491752895)
,p_name=>'APEX.DATEPICKER.DONE'
,p_message_language=>'vi'
,p_message_text=>unistr('Hoa\0300n t\00E2\0301t')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144074362555752899)
,p_name=>'APEX.DATEPICKER.FORMAT_NOT_SUPPORTED'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 c\00F3 c\00E1c ph\1EA7n kh\00F4ng \0111\01B0\1EE3c h\1ED7 tr\1EE3 trong c\00E2\0301u tru\0301c \0111\1ECBnh d\1EA1ng: %1')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144059508401752894)
,p_name=>'APEX.DATEPICKER.HOUR'
,p_message_language=>'vi'
,p_message_text=>unistr('Gi\01A1\0300')
,p_is_js_message=>true
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144143452774752919)
,p_name=>'APEX.DATEPICKER.ICON_TEXT'
,p_message_language=>'vi'
,p_message_text=>unistr('Li\0323ch b\00E2\0323t l\00EAn: %0')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144059360649752894)
,p_name=>'APEX.DATEPICKER.ISO_WEEK'
,p_message_language=>'vi'
,p_message_text=>unistr('Tu\1EA7n')
,p_is_js_message=>true
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144059416845752894)
,p_name=>'APEX.DATEPICKER.ISO_WEEK_ABBR'
,p_message_language=>'vi'
,p_message_text=>'WK'
,p_is_js_message=>true
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144059780643752894)
,p_name=>'APEX.DATEPICKER.MINUTES'
,p_message_language=>'vi'
,p_message_text=>unistr('Ph\00FAt')
,p_is_js_message=>true
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144059962271752894)
,p_name=>'APEX.DATEPICKER.MONTH'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\00E1ng')
,p_is_js_message=>true
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144060341004752895)
,p_name=>'APEX.DATEPICKER.NEXT_MONTH'
,p_message_language=>'vi'
,p_message_text=>unistr('Tha\0301ng sau')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144029958720752886)
,p_name=>'APEX.DATEPICKER.POPUP'
,p_message_language=>'vi'
,p_message_text=>unistr('C\01B0\0309a s\00F4\0309 b\00E2\0323t l\00EAn cho %0')
,p_is_js_message=>true
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144060218136752895)
,p_name=>'APEX.DATEPICKER.PREVIOUS_MONTH'
,p_message_language=>'vi'
,p_message_text=>unistr('Tha\0301ng tr\01B0\01A1\0301c')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144152758080752922)
,p_name=>'APEX.DATEPICKER.READONLY_DATEPICKER'
,p_message_language=>'vi'
,p_message_text=>unistr('B\00F4\0323 cho\0323n nga\0300y chi\0309 \0111o\0323c')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144061169931752895)
,p_name=>'APEX.DATEPICKER.SELECT_DATE'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho\0323n nga\0300y')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144030090057752886)
,p_name=>'APEX.DATEPICKER.SELECT_DATE_AND_TIME'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho\0323n nga\0300y va\0300 gi\01A1\0300')
,p_is_js_message=>true
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144027208465752885)
,p_name=>'APEX.DATEPICKER.SELECT_DAY'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho\0323n nga\0300y')
,p_is_js_message=>true
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144030623390752886)
,p_name=>'APEX.DATEPICKER.SELECT_MONTH_AND_YEAR'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\1ECDn th\00E1ng v\00E0 n\0103m')
,p_is_js_message=>true
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144027420822752885)
,p_name=>'APEX.DATEPICKER.SELECT_TIME'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho\0323n th\01A1\0300i gian')
,p_is_js_message=>true
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144027990350752885)
,p_name=>'APEX.DATEPICKER.TODAY'
,p_message_language=>'vi'
,p_message_text=>unistr('H\00F4m nay')
,p_is_js_message=>true
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144045522578752890)
,p_name=>'APEX.DATEPICKER.VALUE_INVALID'
,p_message_language=>'vi'
,p_message_text=>unistr('#LABEL# pha\0309i la\0300 m\00F4\0323t nga\0300y h\01A1\0323p l\00EA\0323, vi\0301 du\0323: %0.')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144045263072752890)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_BETWEEN'
,p_message_language=>'vi'
,p_message_text=>unistr('#LABEL# pha\0309i n\0103\0300m trong khoa\0309ng t\01B0\0300 %0 \0111\00EA\0301n %1.')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144045356030752890)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_ON_OR_AFTER'
,p_message_language=>'vi'
,p_message_text=>unistr('#LABEL# pha\0309i tru\0300ng v\01A1\0301i ho\0103\0323c sau %0.')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144045415022752890)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_ON_OR_BEFORE'
,p_message_language=>'vi'
,p_message_text=>unistr('#LABEL# pha\0309i tru\0300ng v\01A1\0301i ho\0103\0323c tr\01B0\01A1\0301c %0.')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144036880624752888)
,p_name=>'APEX.DATEPICKER.VISUALLY_HIDDEN_EDIT'
,p_message_language=>'vi'
,p_message_text=>unistr('Mu\0323c kh\00F4ng hi\00EA\0309n thi\0323 nh\01B0ng co\0301 th\00EA\0309 chi\0309nh s\01B0\0309a')
,p_is_js_message=>true
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144060143452752895)
,p_name=>'APEX.DATEPICKER.YEAR'
,p_message_language=>'vi'
,p_message_text=>unistr('N\0103m')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144147126583752920)
,p_name=>'APEX.DATEPICKER_VALUE_GREATER_MAX_DATE'
,p_message_language=>'vi'
,p_message_text=>unistr('#LABEL# l\01A1\0301n h\01A1n nga\0300y t\00F4\0301i \0111a \0111a\0303 chi\0309 \0111i\0323nh %0.')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144147517444752921)
,p_name=>'APEX.DATEPICKER_VALUE_INVALID'
,p_message_language=>'vi'
,p_message_text=>unistr('#LABEL# kh\00F4ng kh\01A1\0301p v\01A1\0301i \0111i\0323nh da\0323ng %0.')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144147006525752920)
,p_name=>'APEX.DATEPICKER_VALUE_LESS_MIN_DATE'
,p_message_language=>'vi'
,p_message_text=>unistr('#LABEL# nho\0309 h\01A1n nga\0300y t\00F4\0301i thi\00EA\0309u \0111a\0303 chi\0309 \0111i\0323nh %0.')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144147289028752920)
,p_name=>'APEX.DATEPICKER_VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'vi'
,p_message_text=>unistr('#LABEL# kh\00F4ng thu\00F4\0323c ph\1EA1m vi h\1EE3p l\1EC7 t\1EEB %0 \0111\1EBFn %1.')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144147431430752921)
,p_name=>'APEX.DATEPICKER_VALUE_NOT_IN_YEAR_RANGE'
,p_message_language=>'vi'
,p_message_text=>unistr('#LABEL# kh\00F4ng thu\00F4\0323c ph\1EA1m vi n\0103m h\1EE3p l\1EC7 t\1EEB %0 \0111\1EBFn %1.')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144039294248752888)
,p_name=>'APEX.DBMS_CLOUD_INT.DBMS_CLOUD_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 xa\0309y ra l\00F4\0303i n\00F4\0323i b\00F4\0323 trong khi x\01B0\0309 ly\0301 y\00EAu c\00E2\0300u DBMS_CLOUD.')
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144199834711752936)
,p_name=>'APEX.DIALOG.CANCEL'
,p_message_language=>'vi'
,p_message_text=>unistr('Hu\0309y')
,p_is_js_message=>true
,p_version_scn=>2705863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144225713861752944)
,p_name=>'APEX.DIALOG.CLOSE'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110o\0301ng')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144086954384752902)
,p_name=>'APEX.DIALOG.CONFIRMATION'
,p_message_language=>'vi'
,p_message_text=>unistr('X\00E1c nh\00E2\0323n')
,p_is_js_message=>true
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144227793528752945)
,p_name=>'APEX.DIALOG.HELP'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\01A1\0323 giu\0301p')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144199608512752936)
,p_name=>'APEX.DIALOG.OK'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\00D4\0300NG Y\0301')
,p_is_js_message=>true
,p_version_scn=>2705863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144199776933752936)
,p_name=>'APEX.DIALOG.SAVE'
,p_message_language=>'vi'
,p_message_text=>unistr('L\01B0u')
,p_is_js_message=>true
,p_version_scn=>2705863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144067496471752897)
,p_name=>'APEX.DIALOG.TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\00EAu \0111\00EA\0300 h\00F4\0323p thoa\0323i')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144107149727752908)
,p_name=>'APEX.DIALOG.VISUALLY_HIDDEN_TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\00EAu \0111\00EA\0300 h\00F4\0323p thoa\0323i kh\00F4ng hi\00EA\0309n thi\0323')
,p_is_js_message=>true
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144028259565752885)
,p_name=>'APEX.DOCGEN'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\01B0\0301c n\0103ng ti\0301ch h\01A1\0323p s\0103\0303n cu\0309a Oracle Document Generator')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144039063808752888)
,p_name=>'APEX.DOCGEN.DBMS_CLOUD_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i khi in ta\0300i li\00EA\0323u.')
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144016226494752882)
,p_name=>'APEX.DOCGEN.INVALID_OUTPUT_TYPE'
,p_message_language=>'vi'
,p_message_text=>unistr('%s kh\00F4ng h\00F4\0303 tr\01A1\0323 %1 la\0300m \0111\00E2\0300u ra.')
,p_version_scn=>2705834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144028174156752885)
,p_name=>'APEX.DOCGEN.INVOKE_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i "%0" khi go\0323i ch\01B0\0301c n\0103ng ti\0301ch h\01A1\0323p s\0103\0303n cu\0309a Oracle Document Generator:')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144019613433752883)
,p_name=>'APEX.DOCGEN.TEMPLATE_REQUIRED'
,p_message_language=>'vi'
,p_message_text=>unistr('Y\00EAu c\00E2\0300u co\0301 m\00E2\0303u.')
,p_version_scn=>2705835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144045055702752890)
,p_name=>'APEX.DOWNLOAD.ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i trong khi ta\0309i t\00E2\0323p tin xu\00F4\0301ng.')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144044940894752890)
,p_name=>'APEX.DOWNLOAD.NO_DATA_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng ti\0300m th\00E2\0301y d\01B0\0303 li\00EA\0323u co\0301 th\00EA\0309 ta\0309i xu\00F4\0301ng.')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144048565645752891)
,p_name=>'APEX.ENVIRONMENT.RUNTIME_ONLY'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\0301nh n\0103ng na\0300y kh\00F4ng kha\0309 du\0323ng tr\00EAn m\00F4i tr\01B0\01A1\0300ng Chi\0309 th\01A1\0300i gian cha\0323y.')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144101321108752907)
,p_name=>'APEX.ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i')
,p_is_js_message=>true
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144061250426752895)
,p_name=>'APEX.ERROR.CALLBACK_FAILED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\00E3 x\1EA3y ra l\1ED7i sau \0111\00E2y khi th\1EF1c thi l\1EC7nh g\1ECDi l\1EA1i x\1EED l\00FD l\1ED7i: %0')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144073867778752899)
,p_name=>'APEX.ERROR.ERROR_PAGE.UNHANDLED_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\00E3 x\1EA3y ra l\1ED7i khi v\1EBD trang l\1ED7i: %0')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144062955307752895)
,p_name=>'APEX.ERROR.INTERNAL'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i n\00F4\0323i b\00F4\0323')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144212644650752940)
,p_name=>'APEX.ERROR.INTERNAL.CONTACT_ADMINISTRATOR'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Ha\0303y li\00EAn h\1EC7 ng\01B0\01A1\0300i qu\1EA3n tr\1ECB.'),
unistr('Ba\0323n co\0301 th\00EA\0309 xem th\00F4ng tin chi ti\1EBFt v\1EC1 s\1EF1 c\1ED1 n\00E0y th\00F4ng qua ma\0303 g\1EE1 l\1ED7i "%0".')))
,p_version_scn=>2705866
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144207243198752938)
,p_name=>'APEX.ERROR.ORA-16000'
,p_message_language=>'vi'
,p_message_text=>unistr('C\01A1 s\1EDF d\1EEF li\1EC7u na\0300y m\1EDF \0111\1EC3 truy c\1EADp \01A1\0309 ch\00EA\0301 \0111\00F4\0323 ch\1EC9 \0111\1ECDc.')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144237397923752947)
,p_name=>'APEX.ERROR.ORA-28353'
,p_message_language=>'vi'
,p_message_text=>unistr('ORA-28353: Kh\00F4ng m\01A1\0309 \0111\01B0\01A1\0323c vi\0301. Hi\00EA\0323n kh\00F4ng th\00EA\0309 truy c\00E2\0323p d\01B0\0303 li\00EA\0323u \01B0\0301ng du\0323ng.')
,p_version_scn=>2705870
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144207309395752938)
,p_name=>'APEX.ERROR.PAGE_NOT_AVAILABLE'
,p_message_language=>'vi'
,p_message_text=>unistr('R\00E2\0301t ti\00EA\0301c, trang na\0300y kh\00F4ng kha\0309 du\0323ng')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144065977072752896)
,p_name=>'APEX.ERROR.TECHNICAL_INFO'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\00F4ng tin k\1EF9 thu\1EADt (ch\1EC9 d\00E0nh cho nh\00E0 ph\00E1t tri\1EC3n)')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144171861453752928)
,p_name=>'APEX.ERROR_MESSAGE_HEADING'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\00F4ng ba\0301o l\00F4\0303i')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144185796765752932)
,p_name=>'APEX.EXPECTED_FORMAT'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110i\0323nh da\0323ng d\01B0\0323 ki\00EA\0301n: %0')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144150695916752921)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.ALREADY_IN_ACL'
,p_message_language=>'vi'
,p_message_text=>unistr('Ng\01B0\01A1\0300i du\0300ng \0111a\0303 co\0301 t\00EAn trong Danh sa\0301ch ki\00EA\0309m soa\0301t truy c\00E2\0323p')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144150523739752921)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.CREATE_CONFIRM'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0303y xa\0301c nh\00E2\0323n vi\00EA\0323c th\00EAm %0 ng\01B0\01A1\0300i du\0300ng sau \0111\00E2y va\0300o danh sa\0301ch ki\00EA\0309m soa\0301t truy c\00E2\0323p <strong>%1</strong>.')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144151078858752922)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.DUPLICATE_USER'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00F4\0300n ta\0323i ng\01B0\1EDDi d\00F9ng tru\0300ng l\1EB7p')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144150751924752921)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.MISSING_AT_SIGN'
,p_message_language=>'vi'
,p_message_text=>unistr('Thi\00EA\0301u ky\0301 hi\00EA\0323u at (@) trong \0111i\0323a chi\0309 email')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144150823935752922)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.MISSING_DOT'
,p_message_language=>'vi'
,p_message_text=>unistr('Thi\00EA\0301u d\00E2\0301u ch\00E2\0301m (.) trong \0111i\0323a chi\0309 email')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144150910282752922)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.USERNAME_TOO_LONG'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00EAn ng\01B0\01A1\0300i du\0300ng qua\0301 da\0300i')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144151254099752922)
,p_name=>'APEX.FEATURE.ACL.INFO.ACL_ONLY'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\1EC9 nh\1EEFng ng\01B0\1EDDi d\00F9ng \0111\01B0\1EE3c x\00E1c \0111\1ECBnh trong danh s\00E1ch ki\1EC3m so\00E1t truy c\1EADp \1EE9ng d\1EE5ng m\1EDBi c\00F3 th\1EC3 truy c\1EADp \1EE9ng d\1EE5ng n\00E0y')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144151310113752922)
,p_name=>'APEX.FEATURE.ACL.INFO.ACL_VALUE_INVALID'
,p_message_language=>'vi'
,p_message_text=>unistr('Gi\00E1 tr\1ECB c\00E0i \0111\1EB7t ki\1EC3m so\00E1t truy c\1EADp kh\00F4ng mong \0111\1EE3i: %0')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144151151631752922)
,p_name=>'APEX.FEATURE.ACL.INFO.ALL_USERS'
,p_message_language=>'vi'
,p_message_text=>unistr('Mo\0323i ng\01B0\1EDDi d\00F9ng \0111\01B0\1EE3c x\00E1c th\1EF1c \0111\1EC1u c\00F3 th\1EC3 truy c\1EADp \1EE9ng d\1EE5ng n\00E0y')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144195684559752935)
,p_name=>'APEX.FEATURE.CONFIG.DISABLED'
,p_message_language=>'vi'
,p_message_text=>unistr('Bi\0323 v\00F4 hi\00EA\0323u ho\0301a')
,p_is_js_message=>true
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144195557189752935)
,p_name=>'APEX.FEATURE.CONFIG.ENABLED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 k\00EDch ho\1EA1t')
,p_is_js_message=>true
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144195868793752935)
,p_name=>'APEX.FEATURE.CONFIG.IS_DISABLED'
,p_message_language=>'vi'
,p_message_text=>unistr('%0: Bi\0323 v\00F4 hi\00EA\0323u ho\0301a')
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144195752108752935)
,p_name=>'APEX.FEATURE.CONFIG.IS_ENABLED'
,p_message_language=>'vi'
,p_message_text=>unistr('%0: \0110\01B0\01A1\0323c ki\0301ch hoa\0323t')
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144044347334752890)
,p_name=>'APEX.FEATURE.CONFIG.NOT_SUPPORTED'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng \0111\01B0\01A1\0323c h\00F4\0303 tr\01A1\0323')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144105530900752908)
,p_name=>'APEX.FEATURE.CONFIG.OFF'
,p_message_language=>'vi'
,p_message_text=>unistr('T\1EAFt')
,p_is_js_message=>true
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144105457583752908)
,p_name=>'APEX.FEATURE.CONFIG.ON'
,p_message_language=>'vi'
,p_message_text=>unistr('B\00E2\0323t')
,p_is_js_message=>true
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144195464350752935)
,p_name=>'APEX.FEATURE.TOP_USERS.USERNAME.NOT_IDENTIFIED'
,p_message_language=>'vi'
,p_message_text=>unistr('kh\00F4ng x\00E1c \0111\1ECBnh')
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144035979344752887)
,p_name=>'APEX.FILESIZE.BYTES'
,p_message_language=>'vi'
,p_message_text=>'%0 byte'
,p_is_js_message=>true
,p_version_scn=>2705837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144036452280752887)
,p_name=>'APEX.FILESIZE.GB'
,p_message_language=>'vi'
,p_message_text=>'%0 GB'
,p_is_js_message=>true
,p_version_scn=>2705837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144036180638752887)
,p_name=>'APEX.FILESIZE.KB'
,p_message_language=>'vi'
,p_message_text=>'%0 KB'
,p_is_js_message=>true
,p_version_scn=>2705837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144036354073752887)
,p_name=>'APEX.FILESIZE.MB'
,p_message_language=>'vi'
,p_message_text=>'%0 MB'
,p_is_js_message=>true
,p_version_scn=>2705837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144188673839752933)
,p_name=>'APEX.FILE_BROWSE.DOWNLOAD_LINK_TEXT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ta\0309i xu\00F4\0301ng')
,p_is_js_message=>true
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144041762694752889)
,p_name=>'APEX.FS.ACTIONS_MENU_BUTTON_LABEL'
,p_message_language=>'vi'
,p_message_text=>unistr('Tu\0300y cho\0323n')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144041406922752889)
,p_name=>'APEX.FS.ACTIONS_MENU_FILTER'
,p_message_language=>'vi'
,p_message_text=>unistr('B\00F4\0323 lo\0323c')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144041681750752889)
,p_name=>'APEX.FS.ACTIONS_MENU_HIDE'
,p_message_language=>'vi'
,p_message_text=>unistr('\00C2\0309n thu\1ED9c t\00EDnh')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144066307227752896)
,p_name=>'APEX.FS.ADD_FILTER'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\00EAm b\00F4\0323 lo\0323c')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144142686982752919)
,p_name=>'APEX.FS.APPLIED_FACET'
,p_message_language=>'vi'
,p_message_text=>unistr('B\00F4\0323 lo\0323c \0111a\0303 a\0301p %0')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144067051971752897)
,p_name=>'APEX.FS.APPLY'
,p_message_language=>'vi'
,p_message_text=>unistr('\00C1p du\0323ng')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144186202589752932)
,p_name=>'APEX.FS.BATCH_APPLY'
,p_message_language=>'vi'
,p_message_text=>unistr('\00C1p du\0323ng')
,p_is_js_message=>true
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144067132620752897)
,p_name=>'APEX.FS.CANCEL'
,p_message_language=>'vi'
,p_message_text=>unistr('Hu\0309y')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144050945485752892)
,p_name=>'APEX.FS.CHART_BAR'
,p_message_language=>'vi'
,p_message_text=>unistr('Bi\00EA\0309u \0111\00F4\0300 thanh')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144198960321752936)
,p_name=>'APEX.FS.CHART_OTHERS'
,p_message_language=>'vi'
,p_message_text=>unistr('Kha\0301c')
,p_is_js_message=>true
,p_version_scn=>2705863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144051017698752892)
,p_name=>'APEX.FS.CHART_PIE'
,p_message_language=>'vi'
,p_message_text=>unistr('Bi\00EA\0309u \0111\00F4\0300 hi\0300nh tro\0300n')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144197541214752936)
,p_name=>'APEX.FS.CHART_TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Bi\00EA\0309u \0111\00F4\0300')
,p_is_js_message=>true
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144050767055752892)
,p_name=>'APEX.FS.CHART_VALUE_LABEL'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\00EA\0301m')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144186748303752932)
,p_name=>'APEX.FS.CLEAR'
,p_message_language=>'vi'
,p_message_text=>unistr('Xo\0301a')
,p_is_js_message=>true
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144186865236752932)
,p_name=>'APEX.FS.CLEAR_ALL'
,p_message_language=>'vi'
,p_message_text=>unistr('Xo\0301a t\1EA5t c\1EA3')
,p_is_js_message=>true
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144186919687752932)
,p_name=>'APEX.FS.CLEAR_VALUE'
,p_message_language=>'vi'
,p_message_text=>unistr('Xo\0301a %0')
,p_is_js_message=>true
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144203480227752937)
,p_name=>'APEX.FS.COLUMN_UNAUTHORIZED'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00F4\0323t %1, \0111\01B0\01A1\0323c thu\1ED9c t\00EDnh %0 tham chi\00EA\0301u, kh\00F4ng kha\0309 du\0323ng ho\0103\0323c kh\00F4ng \0111\01B0\01A1\0323c u\0309y quy\00EA\0300n.')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144014164192752881)
,p_name=>'APEX.FS.CONFIG_TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho\0323n b\00F4\0323 lo\0323c se\0303 hi\00EA\0309n thi\0323')
,p_is_js_message=>true
,p_version_scn=>2705833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144140689436752919)
,p_name=>'APEX.FS.COUNT_RESULTS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 k\00EA\0301t qua\0309')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144140723568752919)
,p_name=>'APEX.FS.COUNT_SELECTED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 cho\0323n %0')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144143556132752919)
,p_name=>'APEX.FS.CUR_FILTERS_LM'
,p_message_language=>'vi'
,p_message_text=>unistr('B\00F4\0323 lo\0323c hi\00EA\0323n ta\0323i')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144019186635752882)
,p_name=>'APEX.FS.FACETED_SEARCH_NEEDS_REGION_QUERY'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00ECm ki\1EBFm theo thu\00F4\0323c ti\0301nh y\00EAu c\1EA7u pha\0309i co\0301 Ngu\1ED3n d\1EEF li\1EC7u \1EDF c\1EA5p vu\0300ng.')
,p_version_scn=>2705835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144022816131752883)
,p_name=>'APEX.FS.FACETS_LIST'
,p_message_language=>'vi'
,p_message_text=>unistr('Danh sa\0301ch b\00F4\0323 lo\0323c')
,p_is_js_message=>true
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144201972385752937)
,p_name=>'APEX.FS.FACET_VALUE_LIMIT_EXCEEDED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\00E3 v\01B0\1EE3t qu\00E1 gi\1EDBi h\1EA1n gi\00E1 tr\1ECB ri\00EAng bi\1EC7t (%0) cho thu\1ED9c t\00EDnh %1.')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144188213364752933)
,p_name=>'APEX.FS.FC_TYPE_UNSUPPORTED_FOR_DATE_COLUMNS'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng h\1ED7 tr\1EE3 thu\00F4\0323c ti\0301nh %0 \0111\00F4\0301i v\01A1\0301i ca\0301c c\00F4\0323t DATE ho\0103\0323c TIMESTAMP.')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144186338362752932)
,p_name=>'APEX.FS.FILTER'
,p_message_language=>'vi'
,p_message_text=>unistr('Lo\0323c %0')
,p_is_js_message=>true
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144060907335752895)
,p_name=>'APEX.FS.FILTER_APPLIED'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 (\0110a\0303 a\0301p du\0323ng b\00F4\0323 lo\0323c)')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144186496781752932)
,p_name=>'APEX.FS.GO'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110i')
,p_is_js_message=>true
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144056489011752893)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_C'
,p_message_language=>'vi'
,p_message_text=>unistr('ch\01B0\0301a %0')
,p_is_js_message=>true
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144187881570752933)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_EQ'
,p_message_language=>'vi'
,p_message_text=>unistr('b\0103\0300ng %0')
,p_is_js_message=>true
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144056197605752893)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_GT'
,p_message_language=>'vi'
,p_message_text=>unistr('l\01A1\0301n h\01A1n %0')
,p_is_js_message=>true
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144056235720752893)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_GTE'
,p_message_language=>'vi'
,p_message_text=>unistr('l\01A1\0301n h\01A1n ho\0103\0323c b\0103\0300ng %0')
,p_is_js_message=>true
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144055857289752893)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_LT'
,p_message_language=>'vi'
,p_message_text=>unistr('nho\0309 h\01A1n %0')
,p_is_js_message=>true
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144056019206752893)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_LTE'
,p_message_language=>'vi'
,p_message_text=>unistr('nho\0309 h\01A1n ho\0103\0323c b\0103\0300ng %0')
,p_is_js_message=>true
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144055357152752893)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NC'
,p_message_language=>'vi'
,p_message_text=>unistr('kh\00F4ng ch\01B0\0301a %0')
,p_is_js_message=>true
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144041198574752889)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NEQ'
,p_message_language=>'vi'
,p_message_text=>unistr('kh\00F4ng b\0103\0300ng %0')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144055456562752893)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NSTARTS'
,p_message_language=>'vi'
,p_message_text=>unistr('kh\00F4ng b\0103\0301t \0111\00E2\0300u b\0103\0300ng %0')
,p_is_js_message=>true
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144056358734752893)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_STARTS'
,p_message_language=>'vi'
,p_message_text=>unistr('b\0103\0301t \0111\00E2\0300u b\0103\0300ng %0')
,p_is_js_message=>true
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144054430885752893)
,p_name=>'APEX.FS.INPUT_FACET_SELECTOR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\01B0\0323a cho\0323n thu\00F4\0323c ti\0301nh')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144030203049752886)
,p_name=>'APEX.FS.INPUT_INVALID_FILTER_PREFIX'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\1EC1n t\1ED1 b\1ED9 l\1ECDc "%0" kh\00F4ng h\1EE3p l\1EC7 \0111\1ED1i v\1EDBi thu\1ED9c t\00EDnh "%1".')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144028611366752885)
,p_name=>'APEX.FS.INPUT_MISSING_FILTER_PREFIX'
,p_message_language=>'vi'
,p_message_text=>unistr('Thi\00EA\0301u ti\00EA\0300n t\00F4\0301 b\00F4\0323 lo\0323c cho thu\1ED9c t\00EDnh "%0".')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144062802589752895)
,p_name=>'APEX.FS.INPUT_OPERATOR'
,p_message_language=>'vi'
,p_message_text=>unistr('Toa\0301n t\01B0\0309')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144044707133752890)
,p_name=>'APEX.FS.INPUT_OPERATOR.C'
,p_message_language=>'vi'
,p_message_text=>unistr('ch\01B0\0301a')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144043768295752890)
,p_name=>'APEX.FS.INPUT_OPERATOR.EQ'
,p_message_language=>'vi'
,p_message_text=>unistr('b\0103\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144044483402752890)
,p_name=>'APEX.FS.INPUT_OPERATOR.GT'
,p_message_language=>'vi'
,p_message_text=>unistr('l\01A1\0301n h\01A1n')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144044536902752890)
,p_name=>'APEX.FS.INPUT_OPERATOR.GTE'
,p_message_language=>'vi'
,p_message_text=>unistr('l\01A1\0301n h\01A1n ho\0103\0323c b\0103\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144044125211752890)
,p_name=>'APEX.FS.INPUT_OPERATOR.LT'
,p_message_language=>'vi'
,p_message_text=>unistr('nho\0309 h\01A1n')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144044203987752890)
,p_name=>'APEX.FS.INPUT_OPERATOR.LTE'
,p_message_language=>'vi'
,p_message_text=>unistr('nho\0309 h\01A1n ho\0103\0323c b\0103\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144055271774752893)
,p_name=>'APEX.FS.INPUT_OPERATOR.NC'
,p_message_language=>'vi'
,p_message_text=>unistr('kh\00F4ng ch\01B0\0301a')
,p_is_js_message=>true
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144043965024752890)
,p_name=>'APEX.FS.INPUT_OPERATOR.NEQ'
,p_message_language=>'vi'
,p_message_text=>unistr('kh\00F4ng b\0103\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144055161296752893)
,p_name=>'APEX.FS.INPUT_OPERATOR.NSTARTS'
,p_message_language=>'vi'
,p_message_text=>unistr('kh\00F4ng b\0103\0301t \0111\00E2\0300u b\0103\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144044628211752890)
,p_name=>'APEX.FS.INPUT_OPERATOR.STARTS'
,p_message_language=>'vi'
,p_message_text=>unistr('b\0103\0301t \0111\00E2\0300u b\0103\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144063205581752895)
,p_name=>'APEX.FS.INPUT_UNSUPPORTED_DATA_TYPE'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng h\00F4\0303 tr\01A1\0323 loa\0323i d\01B0\0303 li\00EA\0323u %0 (%1) \0111\00F4\0301i v\01A1\0301i thu\1ED9c t\00EDnh Tr\01B0\01A1\0300ng \0111\00E2\0300u va\0300o.')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144030146431752886)
,p_name=>'APEX.FS.INPUT_UNSUPPORTED_FILTER_FOR_DATA_TYPE'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng h\1ED7 tr\1EE3 b\1ED9 l\1ECDc "%0" \0111\1ED1i v\1EDBi thu\1ED9c t\00EDnh "%1" (lo\1EA1i d\1EEF li\1EC7u %2).')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144062718630752895)
,p_name=>'APEX.FS.INPUT_VALUE'
,p_message_language=>'vi'
,p_message_text=>unistr('Gia\0301 tri\0323')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144188057366752933)
,p_name=>'APEX.FS.NO_SEARCH_COLUMNS_PROVIDED'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\01B0a cung c\00E2\0301p c\00F4\0323t ti\0300m ki\00EA\0301m cho thu\1ED9c t\00EDnh %0')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144014244461752881)
,p_name=>'APEX.FS.OPEN_CONFIG'
,p_message_language=>'vi'
,p_message_text=>unistr('B\00F4\0323 lo\0323c kha\0301c')
,p_is_js_message=>true
,p_version_scn=>2705833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144140879371752919)
,p_name=>'APEX.FS.RANGE_BEGIN'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110i\00EA\0309m b\0103\0301t \0111\00E2\0300u khoa\0309ng')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144187544957752933)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 \0111\00EA\0301n %1')
,p_is_js_message=>true
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144187604991752933)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL_OPEN_HI'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\00EAn %0')
,p_is_js_message=>true
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144187771533752933)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL_OPEN_LO'
,p_message_language=>'vi'
,p_message_text=>unistr('D\01B0\01A1\0301i %0')
,p_is_js_message=>true
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144140953942752919)
,p_name=>'APEX.FS.RANGE_END'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110i\00EA\0309m k\00EA\0301t thu\0301c khoa\0309ng')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144205504611752938)
,p_name=>'APEX.FS.RANGE_LOV_ITEM_INVALID'
,p_message_language=>'vi'
,p_message_text=>unistr('Mu\0323c danh sa\0301ch gia\0301 tri\0323 #%2 ("%1") cho thu\1ED9c t\00EDnh pha\0323m vi %0 kh\00F4ng h\01A1\0323p l\00EA\0323 (thi\00EA\0301u d\00E2\0301u ph\00E2n ca\0301ch "|").')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144187974291752933)
,p_name=>'APEX.FS.RANGE_MANUAL_NOT_SUPPORTED'
,p_message_language=>'vi'
,p_message_text=>unistr('Hi\00EA\0323n kh\00F4ng h\00F4\0303 tr\01A1\0323 ti\0301nh n\0103ng nh\00E2\0323p thu\0309 c\00F4ng \0111\00F4\0301i v\01A1\0301i thu\1ED9c t\00EDnh Pha\0323m vi %0, vi\0300 c\00F4\0323t la\0300 DATE ho\0103\0323c TIMESTAMP.')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144187246171752932)
,p_name=>'APEX.FS.RANGE_TEXT'
,p_message_language=>'vi'
,p_message_text=>unistr('\0111\00EA\0301n')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144050808109752892)
,p_name=>'APEX.FS.REMOVE_CHART'
,p_message_language=>'vi'
,p_message_text=>unistr('Xo\0301a bi\00EA\0309u \0111\00F4\0300')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144137248843752918)
,p_name=>'APEX.FS.RESET'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\0103\0323t la\0323i')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144186601705752932)
,p_name=>'APEX.FS.SEARCH_LABEL'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00ECm ki\1EBFm')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144186575674752932)
,p_name=>'APEX.FS.SEARCH_PLACEHOLDER'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00ECm ki\1EBFm...')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144187474984752933)
,p_name=>'APEX.FS.SELECT_PLACEHOLDER'
,p_message_language=>'vi'
,p_message_text=>unistr('- Cho\0323n -')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144050681699752892)
,p_name=>'APEX.FS.SHOW_CHART'
,p_message_language=>'vi'
,p_message_text=>unistr('Hi\00EA\0309n thi\0323 bi\00EA\0309u \0111\00F4\0300')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144187024771752932)
,p_name=>'APEX.FS.SHOW_LESS'
,p_message_language=>'vi'
,p_message_text=>unistr('\00C2\0309n b\01A1\0301t')
,p_is_js_message=>true
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144187195563752932)
,p_name=>'APEX.FS.SHOW_MORE'
,p_message_language=>'vi'
,p_message_text=>unistr('Hi\00EA\0309n thi\0323 t\00E2\0301t ca\0309')
,p_is_js_message=>true
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144187381549752933)
,p_name=>'APEX.FS.STAR_RATING_LABEL'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 sao tr\01A1\0309 l\00EAn')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144142502806752919)
,p_name=>'APEX.FS.SUGGESTIONS'
,p_message_language=>'vi'
,p_message_text=>unistr('G\1EE3i \00FD b\1ED9 l\1ECDc')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144188163497752933)
,p_name=>'APEX.FS.TEXT_FIELD_ONLY_FOR_NUMBER_COLUMNS'
,p_message_language=>'vi'
,p_message_text=>unistr('Hi\00EA\0323n chi\0309 h\00F4\0303 tr\01A1\0323 thu\00F4\0323c ti\0301nh Tr\01B0\01A1\0300ng v\0103n ba\0309n %0 \0111\00F4\0301i v\01A1\0301i ca\0301c c\00F4\0323t NUMBER.')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144013670832752881)
,p_name=>'APEX.FS.TOTAL_ROW_COUNT_LABEL'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00F4\0309ng s\00F4\0301 ha\0300ng')
,p_version_scn=>2705833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144203523795752937)
,p_name=>'APEX.FS.UNSUPPORTED_DATA_TYPE'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng h\00F4\0303 tr\01A1\0323 loa\0323i d\01B0\0303 li\00EA\0323u %0 (%1) \0111\00F4\0301i v\01A1\0301i ti\0300m ki\00EA\0301m theo thu\00F4\0323c ti\0301nh.')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144133741724752916)
,p_name=>'APEX.FS.VISUALLY_HIDDEN_HEADING'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\00EAu \0111\00EA\0300 kh\00F4ng hi\00EA\0309n thi\0323')
,p_is_js_message=>true
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144196042618752935)
,p_name=>'APEX.GO_TO_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('Chuy\00EA\0309n \0111\1EBFn l\1ED7i')
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144152045371752922)
,p_name=>'APEX.GV.AGG_CONTEXT'
,p_message_language=>'vi'
,p_message_text=>unistr('T\1ED5ng h\01A1\0323p.')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144079979043752900)
,p_name=>'APEX.GV.BLANK_HEADING'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\00EAu \0111\1EC1 tr\1ED1ng')
,p_is_js_message=>true
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144161373245752925)
,p_name=>'APEX.GV.BREAK_COLLAPSE'
,p_message_language=>'vi'
,p_message_text=>unistr('Thu go\0323n d\00E2\0301u ng\0103\0301t \0111i\00EA\0300u khi\00EA\0309n')
,p_is_js_message=>true
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144152128624752922)
,p_name=>'APEX.GV.BREAK_CONTEXT'
,p_message_language=>'vi'
,p_message_text=>unistr('D\00E2\0301u ng\0103\0301t \0111i\00EA\0300u khi\00EA\0309n.')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144161274286752925)
,p_name=>'APEX.GV.BREAK_EXPAND'
,p_message_language=>'vi'
,p_message_text=>unistr('M\01A1\0309 r\00F4\0323ng d\00E2\0301u ng\0103\0301t \0111i\00EA\0300u khi\00EA\0309n')
,p_is_js_message=>true
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144161027626752925)
,p_name=>'APEX.GV.DELETED_COUNT'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 xo\0301a %0 ha\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144230170084752945)
,p_name=>'APEX.GV.DUP_REC_ID'
,p_message_language=>'vi'
,p_message_text=>unistr('Sao che\0301p danh ti\0301nh')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144023073029752884)
,p_name=>'APEX.GV.ENTER_EDIT_MODE'
,p_message_language=>'vi'
,p_message_text=>unistr('Chuy\00EA\0309n sang ch\00EA\0301 \0111\00F4\0323 chi\0309nh s\01B0\0309a')
,p_is_js_message=>true
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144148950258752921)
,p_name=>'APEX.GV.FIRST_PAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\00E2\0300u ti\00EAn')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144021866167752883)
,p_name=>'APEX.GV.FLOATING_ITEM.DIALOG.HIDE_DIALOG'
,p_message_language=>'vi'
,p_message_text=>unistr('\00C2\0309n h\00F4\0323p thoa\0323i')
,p_is_js_message=>true
,p_version_scn=>2705835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144020898607752883)
,p_name=>'APEX.GV.FLOATING_ITEM.DIALOG.TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('N\1ED9i dung \00F4 tr\00E0n n\1ED5i')
,p_is_js_message=>true
,p_version_scn=>2705835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144022136531752883)
,p_name=>'APEX.GV.FLOATING_ITEM.SHOW_DIALOG'
,p_message_language=>'vi'
,p_message_text=>unistr('Hi\00EA\0309n thi\0323 n\00F4\0323i dung tra\0300n')
,p_is_js_message=>true
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144096340134752905)
,p_name=>'APEX.GV.FOOTER_LANDMARK'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\00E2n trang cho l\01B0\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144152338632752922)
,p_name=>'APEX.GV.GROUP_CONTEXT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\00EAu \0111\1EC1 nho\0301m')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144152216103752922)
,p_name=>'APEX.GV.HEADER_CONTEXT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\00EAu \0111\00EA\0300.')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144149070527752921)
,p_name=>'APEX.GV.LAST_PAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('Cu\00F4\0301i cu\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144023297100752884)
,p_name=>'APEX.GV.LEAVE_EDIT_MODE'
,p_message_language=>'vi'
,p_message_text=>unistr('R\01A1\0300i kho\0309i ch\00EA\0301 \0111\00F4\0323 chi\0309nh s\01B0\0309a')
,p_is_js_message=>true
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144047991160752891)
,p_name=>'APEX.GV.LOAD_ALL'
,p_message_language=>'vi'
,p_message_text=>unistr('T\1EA3i t\1EA5t c\1EA3')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144170872685752928)
,p_name=>'APEX.GV.LOAD_MORE'
,p_message_language=>'vi'
,p_message_text=>unistr('Hi\00EA\0309n thi\0323 th\00EAm')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144148769867752921)
,p_name=>'APEX.GV.NEXT_PAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\00EA\0301p theo')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144152499108752922)
,p_name=>'APEX.GV.PAGE_RANGE'
,p_message_language=>'vi'
,p_message_text=>unistr('S\00F4\0301 ha\0300ng cu\0309a trang')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144061587961752895)
,p_name=>'APEX.GV.PAGE_RANGE_ENTITY'
,p_message_language=>'vi'
,p_message_text=>'Trang %0'
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144149140897752921)
,p_name=>'APEX.GV.PAGE_RANGE_XY'
,p_message_language=>'vi'
,p_message_text=>'%0 - %1'
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144149252134752921)
,p_name=>'APEX.GV.PAGE_RANGE_XYZ'
,p_message_language=>'vi'
,p_message_text=>'%0 - %1/%2'
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144206181311752938)
,p_name=>'APEX.GV.PAGE_SELECTION'
,p_message_language=>'vi'
,p_message_text=>unistr('L\01B0\0323a cho\0323n trang')
,p_is_js_message=>true
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144096662339752905)
,p_name=>'APEX.GV.PAGINATION_LANDMARK'
,p_message_language=>'vi'
,p_message_text=>unistr('Ph\00E2n trang')
,p_is_js_message=>true
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144148829612752921)
,p_name=>'APEX.GV.PREV_PAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\01B0\01A1\0301c')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144046852909752891)
,p_name=>'APEX.GV.RANGE_DISPLAY'
,p_message_language=>'vi'
,p_message_text=>unistr('Hi\00EA\0309n thi\0323 khoa\0309ng')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144080243149752901)
,p_name=>'APEX.GV.ROWS_SELECTION'
,p_message_language=>'vi'
,p_message_text=>unistr('L\01B0\0323a cho\0323n ca\0301c ha\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144229921831752945)
,p_name=>'APEX.GV.ROW_ADDED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\00E3 th\00EAm')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144230016847752945)
,p_name=>'APEX.GV.ROW_CHANGED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 thay \0111\00F4\0309i')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144238372899752948)
,p_name=>'APEX.GV.ROW_COLUMN_CONTEXT'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\01B0\0301 t\01B0\0323 cu\0309a ha\0300ng trong l\01B0\01A1\0301i %0, c\00F4\0323t %1.')
,p_is_js_message=>true
,p_version_scn=>2705870
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144238407856752948)
,p_name=>'APEX.GV.ROW_CONTEXT'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\01B0\0301 t\01B0\0323 cu\0309a ha\0300ng trong l\01B0\01A1\0301i %0.')
,p_is_js_message=>true
,p_version_scn=>2705870
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144229873378752945)
,p_name=>'APEX.GV.ROW_DELETED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\00E3 x\00F3a')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144152690820752922)
,p_name=>'APEX.GV.ROW_HEADER'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\00EAu \0111\00EA\0300 ha\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144080144310752900)
,p_name=>'APEX.GV.ROW_SELECTION'
,p_message_language=>'vi'
,p_message_text=>unistr('L\01B0\0323a cho\0323n ha\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144048092496752891)
,p_name=>'APEX.GV.SELECTED_ENTITY_COUNT'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 cho\0323n %0 %1')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144148171055752921)
,p_name=>'APEX.GV.SELECTION_CELL_COUNT'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 cho\0323n %0 \00F4')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144149327122752921)
,p_name=>'APEX.GV.SELECTION_COUNT'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 cho\0323n %0 ha\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144191404742752934)
,p_name=>'APEX.GV.SELECT_ALL'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho\0323n t\00E2\0301t ca\0309')
,p_is_js_message=>true
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144084903223752902)
,p_name=>'APEX.GV.SELECT_ALL_ROWS'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho\0323n t\00E2\0301t ca\0309 ca\0301c ha\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144161158790752925)
,p_name=>'APEX.GV.SELECT_PAGE_N'
,p_message_language=>'vi'
,p_message_text=>'Trang %0'
,p_is_js_message=>true
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144152508777752922)
,p_name=>'APEX.GV.SELECT_ROW'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho\0323n ha\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144152846982752922)
,p_name=>'APEX.GV.SORTED_ASCENDING'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 s\0103\0301p x\00EA\0301p theo th\01B0\0301 t\01B0\0323 t\0103ng d\00E2\0300n %0')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144152907758752922)
,p_name=>'APEX.GV.SORTED_DESCENDING'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 s\0103\0301p x\00EA\0301p theo th\01B0\0301 t\01B0\0323 gia\0309m d\00E2\0300n %0')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144148221624752921)
,p_name=>'APEX.GV.SORT_ASCENDING'
,p_message_language=>'vi'
,p_message_text=>unistr('S\0103\0301p x\00EA\0301p theo th\01B0\0301 t\01B0\0323 t\0103ng d\00E2\0300n')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144148557909752921)
,p_name=>'APEX.GV.SORT_ASCENDING_ORDER'
,p_message_language=>'vi'
,p_message_text=>unistr('S\0103\0301p x\00EA\0301p theo th\01B0\0301 t\01B0\0323 t\0103ng d\00E2\0300n %0')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144148399446752921)
,p_name=>'APEX.GV.SORT_DESCENDING'
,p_message_language=>'vi'
,p_message_text=>unistr('S\0103\0301p x\00EA\0301p theo th\01B0\0301 t\01B0\0323 gia\0309m d\00E2\0300n')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144148622530752921)
,p_name=>'APEX.GV.SORT_DESCENDING_ORDER'
,p_message_language=>'vi'
,p_message_text=>unistr('S\0103\0301p x\00EA\0301p theo th\01B0\0301 t\01B0\0323 gia\0309m d\00E2\0300n %0')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144148468257752921)
,p_name=>'APEX.GV.SORT_OFF'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng s\0103\0301p x\00EA\0301p')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144014009459752881)
,p_name=>'APEX.GV.SORT_OPTIONS'
,p_message_language=>'vi'
,p_message_text=>unistr('Tu\0300y cho\0323n s\0103\0301p x\00EA\0301p')
,p_is_js_message=>true
,p_version_scn=>2705833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144096479079752905)
,p_name=>'APEX.GV.STATE_ICONS_LANDMARK'
,p_message_language=>'vi'
,p_message_text=>unistr('Bi\00EA\0309u t\01B0\01A1\0323ng tra\0323ng tha\0301i')
,p_is_js_message=>true
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144096514937752905)
,p_name=>'APEX.GV.STATUS_LANDMARK'
,p_message_language=>'vi'
,p_message_text=>unistr('Tra\0323ng tha\0301i l\01B0\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144026341927752884)
,p_name=>'APEX.GV.TOTAL_ENTITY_PLURAL'
,p_message_language=>'vi'
,p_message_text=>'%0 %1'
,p_is_js_message=>true
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144026076612752884)
,p_name=>'APEX.GV.TOTAL_ENTITY_SINGULAR'
,p_message_language=>'vi'
,p_message_text=>'1 %0'
,p_is_js_message=>true
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144160951558752925)
,p_name=>'APEX.GV.TOTAL_PAGES'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00F4\0309ng c\00F4\0323ng %0')
,p_is_js_message=>true
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144079776279752900)
,p_name=>'APEX.HTTP.REQUEST_FAILED'
,p_message_language=>'vi'
,p_message_text=>unistr('Y\00EAu c\00E2\0300u HTTP t\01A1\0301i "%0" kh\00F4ng tha\0300nh c\00F4ng.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144081314473752901)
,p_name=>'APEX.ICON_LIST.COLUMN'
,p_message_language=>'vi'
,p_message_text=>unistr('C\1ED9t %0')
,p_is_js_message=>true
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144081597240752901)
,p_name=>'APEX.ICON_LIST.COLUMN_AND_ROW'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00F4\0323t %0 va\0300 ha\0300ng %1')
,p_is_js_message=>true
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144081823039752901)
,p_name=>'APEX.ICON_LIST.FIRST_COLUMN'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 \0111\00EA\0301n c\00F4\0323t \0111\00E2\0300u ti\00EAn. C\00F4\0323t %0 va\0300 ha\0300ng %1')
,p_is_js_message=>true
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144081703190752901)
,p_name=>'APEX.ICON_LIST.FIRST_ROW'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 \0111\00EA\0301n ha\0300ng \0111\00E2\0300u ti\00EAn. C\00F4\0323t %0 va\0300 ha\0300ng %1')
,p_is_js_message=>true
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144227342148752944)
,p_name=>'APEX.ICON_LIST.GRID_DIM'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 xu\00E2\0301t hi\00EA\0323n trong %0 c\00F4\0323t va\0300 %1 ha\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144081981664752901)
,p_name=>'APEX.ICON_LIST.LAST_COLUMN'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 \0111\00EA\0301n c\00F4\0323t cu\00F4\0301i cu\0300ng. C\00F4\0323t %0 va\0300 ha\0300ng %1')
,p_is_js_message=>true
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144081609706752901)
,p_name=>'APEX.ICON_LIST.LAST_ROW'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 \0111\00EA\0301n ha\0300ng cu\00F4\0301i cu\0300ng. C\00F4\0323t %0 va\0300 ha\0300ng %1')
,p_is_js_message=>true
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144160833764752925)
,p_name=>'APEX.ICON_LIST.LIST_DIM'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 xu\00E2\0301t hi\00EA\0323n trong %0 ha\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144081457972752901)
,p_name=>'APEX.ICON_LIST.ROW'
,p_message_language=>'vi'
,p_message_text=>unistr('H\00E0ng %0')
,p_is_js_message=>true
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144238135421752948)
,p_name=>'APEX.IG.ACC_LABEL'
,p_message_language=>'vi'
,p_message_text=>unistr('L\01B0\01A1\0301i t\01B0\01A1ng ta\0301c %0')
,p_version_scn=>2705870
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144145228714752920)
,p_name=>'APEX.IG.ACTIONS'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0300nh \0111\00F4\0323ng')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144146224238752920)
,p_name=>'APEX.IG.ADD'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\00EAm')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144146120240752920)
,p_name=>'APEX.IG.ADD_ROW'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\00EAm ha\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144231793378752946)
,p_name=>'APEX.IG.AGGREGATE'
,p_message_language=>'vi'
,p_message_text=>unistr('T\1ED5ng h\01A1\0323p')
,p_is_js_message=>true
,p_version_scn=>2705868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144217354933752941)
,p_name=>'APEX.IG.AGGREGATION'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00F4\0309ng h\01A1\0323p')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144219017055752942)
,p_name=>'APEX.IG.ALL'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00E2\0301t ca\0309')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144176670432752929)
,p_name=>'APEX.IG.ALL_TEXT_COLUMNS'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00E2\0301t ca\0309 ca\0301c c\00F4\0323t v\0103n ba\0309n')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144177895137752930)
,p_name=>'APEX.IG.ALTERNATIVE'
,p_message_language=>'vi'
,p_message_text=>unistr('Thay th\00EA\0301')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144178979130752930)
,p_name=>'APEX.IG.AND'
,p_message_language=>'vi'
,p_message_text=>unistr('va\0300')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144198392466752936)
,p_name=>'APEX.IG.APPROX_COUNT_DISTINCT'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\00EA\0301m gia\0301 tri\0323 ri\00EAng bi\00EA\0323t x\00E2\0301p xi\0309')
,p_is_js_message=>true
,p_version_scn=>2705863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144232728998752946)
,p_name=>'APEX.IG.APPROX_COUNT_DISTINCT_OVERALL'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00F4\0309ng gia\0301 tri\0323 ri\00EAng bi\00EA\0323t x\00E2\0301p xi\0309')
,p_is_js_message=>true
,p_version_scn=>2705868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144215911453752941)
,p_name=>'APEX.IG.AREA'
,p_message_language=>'vi'
,p_message_text=>unistr('V\00F9ng')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144217836379752942)
,p_name=>'APEX.IG.ASCENDING'
,p_message_language=>'vi'
,p_message_text=>unistr('T\0103ng d\00E2\0300n')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144177960938752930)
,p_name=>'APEX.IG.AUTHORIZATION'
,p_message_language=>'vi'
,p_message_text=>unistr('U\0309y quy\00EA\0300n')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144231870788752946)
,p_name=>'APEX.IG.AUTO'
,p_message_language=>'vi'
,p_message_text=>unistr('T\01B0\0323 \0111\00F4\0323ng')
,p_is_js_message=>true
,p_version_scn=>2705868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144198704082752936)
,p_name=>'APEX.IG.AVG'
,p_message_language=>'vi'
,p_message_text=>unistr('Trung bi\0300nh')
,p_is_js_message=>true
,p_version_scn=>2705863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144232443166752946)
,p_name=>'APEX.IG.AVG_OVERALL'
,p_message_language=>'vi'
,p_message_text=>unistr('Trung bi\0300nh t\00F4\0309ng')
,p_is_js_message=>true
,p_version_scn=>2705868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144215481323752941)
,p_name=>'APEX.IG.AXIS_LABEL_TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\00EAu \0111\00EA\0300 tru\0323c nha\0303n')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144215690018752941)
,p_name=>'APEX.IG.AXIS_VALUE_DECIMAL'
,p_message_language=>'vi'
,p_message_text=>unistr('S\00F4\0301 ch\01B0\0303 s\00F4\0301 th\00E2\0323p ph\00E2n')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144215519210752941)
,p_name=>'APEX.IG.AXIS_VALUE_TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\00EAu \0111\00EA\0300 tru\0323c gia\0301 tri')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144221670300752943)
,p_name=>'APEX.IG.BACKGROUND_COLOR'
,p_message_language=>'vi'
,p_message_text=>unistr('Ma\0300u n\00EA\0300n')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144216072570752941)
,p_name=>'APEX.IG.BAR'
,p_message_language=>'vi'
,p_message_text=>'Thanh'
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144173206597752928)
,p_name=>'APEX.IG.BETWEEN'
,p_message_language=>'vi'
,p_message_text=>unistr('trong khoa\0309ng')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144222830417752943)
,p_name=>'APEX.IG.BOTH'
,p_message_language=>'vi'
,p_message_text=>unistr('Ca\0309 hai')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144216106181752941)
,p_name=>'APEX.IG.BUBBLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Bong bo\0301ng')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144146487924752920)
,p_name=>'APEX.IG.CANCEL'
,p_message_language=>'vi'
,p_message_text=>unistr('Hu\0309y')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144178874439752930)
,p_name=>'APEX.IG.CASE_SENSITIVE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ph\00E2n bi\00EA\0323t ch\01B0\0303 hoa ch\01B0\0303 th\01B0\01A1\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144233311879752946)
,p_name=>'APEX.IG.CASE_SENSITIVE_WITH_BRACKETS'
,p_message_language=>'vi'
,p_message_text=>unistr('(Ph\00E2n bi\00EA\0323t ch\01B0\0303 hoa ch\01B0\0303 th\01B0\01A1\0300ng)')
,p_is_js_message=>true
,p_version_scn=>2705868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144204651647752938)
,p_name=>'APEX.IG.CHANGES_SAVED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 l\01B0u ca\0301c thay \0111\00F4\0309i')
,p_is_js_message=>true
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144146811911752920)
,p_name=>'APEX.IG.CHANGE_VIEW'
,p_message_language=>'vi'
,p_message_text=>unistr('Thay \0111\00F4\0309i ch\00EA\0301 \0111\00F4\0323 xem')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144179979838752930)
,p_name=>'APEX.IG.CHART'
,p_message_language=>'vi'
,p_message_text=>unistr('Bi\00EA\0309u \0111\00F4\0300')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144176466452752929)
,p_name=>'APEX.IG.CHART_MAX_DATAPOINT_CNT'
,p_message_language=>'vi'
,p_message_text=>unistr('Truy v\00E2\0301n cu\0309a ba\0323n v\01B0\01A1\0323t qua\0301 s\00F4\0301 \0111i\00EA\0309m d\01B0\0303 li\00EA\0323u t\00F4\0301i \0111a la\0300 %0 tr\00EAn m\00F4\0303i bi\00EA\0309u \0111\00F4\0300. Ha\0303y a\0301p du\0323ng b\00F4\0323 lo\0323c \0111\00EA\0309 gia\0309m s\00F4\0301 l\01B0\01A1\0323ng d\01B0\0303 li\00EA\0323u trong truy v\00E2\0301n c\01A1 s\01A1\0309 cu\0309a ba\0323n.')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144145111619752920)
,p_name=>'APEX.IG.CHART_VIEW'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\00EA\0301 \0111\00F4\0323 xem bi\00EA\0309u \0111\00F4\0300')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144153548786752922)
,p_name=>'APEX.IG.CLEAR'
,p_message_language=>'vi'
,p_message_text=>unistr('Xo\0301a')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144214955042752941)
,p_name=>'APEX.IG.CLOSE_COLUMN'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110o\0301ng')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144221886722752943)
,p_name=>'APEX.IG.COLORS'
,p_message_language=>'vi'
,p_message_text=>unistr('Ma\0300u s\0103\0301c')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144199151222752936)
,p_name=>'APEX.IG.COLOR_PREVIEW'
,p_message_language=>'vi'
,p_message_text=>unistr('Xem tr\01B0\01A1\0301c')
,p_is_js_message=>true
,p_version_scn=>2705863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144178270300752930)
,p_name=>'APEX.IG.COLUMN'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00F4\0323t')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144145311177752920)
,p_name=>'APEX.IG.COLUMNS'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00F4\0323t')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144107297932752909)
,p_name=>'APEX.IG.COLUMN_HEADER_ACTIONS'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0300nh \0111\00F4\0323ng \0111\00F4\0301i v\01A1\0301i c\00F4\0323t')
,p_is_js_message=>true
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144107022747752908)
,p_name=>'APEX.IG.COLUMN_HEADER_ACTIONS_FOR'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0300nh \0111\00F4\0323ng \0111\00F4\0301i v\01A1\0301i c\00F4\0323t "%0"')
,p_is_js_message=>true
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144223633990752943)
,p_name=>'APEX.IG.COLUMN_TYPE'
,p_message_language=>'vi'
,p_message_text=>unistr('Mu\0323c \0111i\0301ch cu\0309a c\00F4\0323t')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144178375661752930)
,p_name=>'APEX.IG.COMPLEX'
,p_message_language=>'vi'
,p_message_text=>unistr('Ph\01B0\0301c ta\0323p')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144145599090752920)
,p_name=>'APEX.IG.COMPUTE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\0301nh toa\0301n')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144173878712752928)
,p_name=>'APEX.IG.CONTAINS'
,p_message_language=>'vi'
,p_message_text=>unistr('ch\01B0\0301a')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144180142056752930)
,p_name=>'APEX.IG.CONTROL_BREAK'
,p_message_language=>'vi'
,p_message_text=>unistr('D\00E2\0301u ng\0103\0301t \0111i\00EA\0300u khi\00EA\0309n')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144153398006752922)
,p_name=>'APEX.IG.COPY_CB'
,p_message_language=>'vi'
,p_message_text=>unistr('Sao che\0301p sang ba\0309ng ghi ta\0323m')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144153456827752922)
,p_name=>'APEX.IG.COPY_DOWN'
,p_message_language=>'vi'
,p_message_text=>unistr('Sao ch\00E9p xu\1ED1ng d\01B0\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144198186191752936)
,p_name=>'APEX.IG.COUNT'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\00EA\0301m')
,p_is_js_message=>true
,p_version_scn=>2705863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144198273720752936)
,p_name=>'APEX.IG.COUNT_DISTINCT'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\00EA\0301m gia\0301 tri\0323 ri\00EAng bi\00EA\0323t')
,p_is_js_message=>true
,p_version_scn=>2705863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144232679100752946)
,p_name=>'APEX.IG.COUNT_DISTINCT_OVERALL'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00F4\0309ng gia\0301 tri\0323 ri\00EAng bi\00EA\0323t')
,p_is_js_message=>true
,p_version_scn=>2705868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144232577666752946)
,p_name=>'APEX.IG.COUNT_OVERALL'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00F4\0309ng s\1ED1 l\01B0\1EE3ng')
,p_is_js_message=>true
,p_version_scn=>2705868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144230275124752945)
,p_name=>'APEX.IG.CREATE_X'
,p_message_language=>'vi'
,p_message_text=>unistr('Ta\0323o %0')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144176887196752929)
,p_name=>'APEX.IG.DATA'
,p_message_language=>'vi'
,p_message_text=>unistr('D\1EEF li\1EC7u')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144223470154752943)
,p_name=>'APEX.IG.DATA_TYPE'
,p_message_language=>'vi'
,p_message_text=>unistr('Loa\0323i d\01B0\0303 li\00EA\0323u')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144223091169752943)
,p_name=>'APEX.IG.DATE'
,p_message_language=>'vi'
,p_message_text=>unistr('Nga\0300y')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144204483612752938)
,p_name=>'APEX.IG.DATE_INVALID_VALUE'
,p_message_language=>'vi'
,p_message_text=>unistr('Gi\00E1 tr\1ECB ng\00E0y kh\00F4ng h\1EE3p l\1EC7')
,p_is_js_message=>true
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144174596977752929)
,p_name=>'APEX.IG.DAYS'
,p_message_language=>'vi'
,p_message_text=>unistr('nga\0300y')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144177534604752930)
,p_name=>'APEX.IG.DEFAULT_SETTINGS'
,p_message_language=>'vi'
,p_message_text=>unistr('Ca\0300i \0111\0103\0323t m\0103\0323c \0111i\0323nh')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144177334685752930)
,p_name=>'APEX.IG.DEFAULT_TYPE'
,p_message_language=>'vi'
,p_message_text=>unistr('Lo\1EA1i m\1EB7c \0111\1ECBnh')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144146321871752920)
,p_name=>'APEX.IG.DELETE'
,p_message_language=>'vi'
,p_message_text=>unistr('Xo\0301a')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144224501142752944)
,p_name=>'APEX.IG.DELETE_REPORT_CONFIRM'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0323n co\0301 ch\0103\0301c ch\0103\0301n mu\00F4\0301n xo\0301a ba\0301o ca\0301o na\0300y kh\00F4ng?')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144181912956752931)
,p_name=>'APEX.IG.DELETE_ROW'
,p_message_language=>'vi'
,p_message_text=>unistr('Xo\0301a ha\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144180787679752931)
,p_name=>'APEX.IG.DELETE_ROWS'
,p_message_language=>'vi'
,p_message_text=>unistr('Xo\0301a ha\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144217902944752942)
,p_name=>'APEX.IG.DESCENDING'
,p_message_language=>'vi'
,p_message_text=>unistr('Gia\0309m d\00E2\0300n')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144179604794752930)
,p_name=>'APEX.IG.DETAIL'
,p_message_language=>'vi'
,p_message_text=>unistr('Chi ti\00EA\0301t')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144144829703752920)
,p_name=>'APEX.IG.DETAIL_VIEW'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\00EA\0301 \0111\00F4\0323 xem chi ti\00EA\0301t')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144206995975752938)
,p_name=>'APEX.IG.DIRECTION'
,p_message_language=>'vi'
,p_message_text=>unistr('H\01B0\1EDBng')
,p_is_js_message=>true
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144179346121752930)
,p_name=>'APEX.IG.DISABLED'
,p_message_language=>'vi'
,p_message_text=>unistr('Bi\0323 v\00F4 hi\00EA\0323u ho\0301a')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144173965936752929)
,p_name=>'APEX.IG.DOES_NOT_CONTAIN'
,p_message_language=>'vi'
,p_message_text=>unistr('kh\00F4ng ch\01B0\0301a')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144174172619752929)
,p_name=>'APEX.IG.DOES_NOT_START_WITH'
,p_message_language=>'vi'
,p_message_text=>unistr('kh\00F4ng b\0103\0301t \0111\00E2\0300u b\0103\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144216227342752941)
,p_name=>'APEX.IG.DONUT'
,p_message_language=>'vi'
,p_message_text=>unistr('Vo\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144180377607752930)
,p_name=>'APEX.IG.DOWNLOAD'
,p_message_language=>'vi'
,p_message_text=>unistr('Ta\0309i xu\00F4\0301ng')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144070641446752898)
,p_name=>'APEX.IG.DOWNLOAD_DATA_ONLY'
,p_message_language=>'vi'
,p_message_text=>unistr('Chi\0309 d\01B0\0303 li\00EA\0323u')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144225500376752944)
,p_name=>'APEX.IG.DOWNLOAD_FORMAT'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho\0323n \0111i\0323nh da\0323ng')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144085724997752902)
,p_name=>'APEX.IG.DOWNLOAD_FORMAT_NOT_ENABLED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110i\0323nh da\0323ng ta\0309i xu\00F4\0301ng %0 kh\00F4ng \0111\01B0\01A1\0323c cho phe\0301p.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144218648061752942)
,p_name=>'APEX.IG.DUPLICATE_AGGREGATION'
,p_message_language=>'vi'
,p_message_text=>unistr('Sao che\0301p mu\0323c t\00F4\0309ng h\01A1\0323p')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144218799883752942)
,p_name=>'APEX.IG.DUPLICATE_CONTROLBREAK'
,p_message_language=>'vi'
,p_message_text=>unistr('Sao che\0301p d\00E2\0301u ng\0103\0301t \0111i\00EA\0300u khi\00EA\0309n')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144181844143752931)
,p_name=>'APEX.IG.DUPLICATE_ROW'
,p_message_language=>'vi'
,p_message_text=>unistr('Sao che\0301p ha\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144180643583752931)
,p_name=>'APEX.IG.DUPLICATE_ROWS'
,p_message_language=>'vi'
,p_message_text=>unistr('Sao che\0301p ha\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144145965695752920)
,p_name=>'APEX.IG.EDIT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\1EC9nh s\1EEDa')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144217714583752942)
,p_name=>'APEX.IG.EDIT_CHART'
,p_message_language=>'vi'
,p_message_text=>unistr('Chi\0309nh s\01B0\0309a bi\00EA\0309u \0111\00F4\0300')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144098211563752906)
,p_name=>'APEX.IG.EDIT_CONTROL'
,p_message_language=>'vi'
,p_message_text=>unistr('Chi\0309nh s\01B0\0309a %0')
,p_is_js_message=>true
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144229122866752945)
,p_name=>'APEX.IG.EDIT_GROUP_BY'
,p_message_language=>'vi'
,p_message_text=>unistr('Chi\0309nh s\01B0\0309a mu\0323c ph\00E2n nh\00F3m theo')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144136391956752917)
,p_name=>'APEX.IG.EDIT_MODE'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 \01A1\0309 ch\00EA\0301 \0111\00F4\0323 chi\0309nh s\01B0\0309a')
,p_is_js_message=>true
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144111971422752910)
,p_name=>'APEX.IG.EDIT_MODE_DESCRIPTION'
,p_message_language=>'vi'
,p_message_text=>unistr('L\01B0\01A1\0301i \01A1\0309 ch\00EA\0301 \0111\00F4\0323 chi\0309nh s\01B0\0309a, ha\0303y nha\0309 \0111\00EA\0309 chuy\00EA\0309n sang ch\00EA\0301 \0111\00F4\0323 xem')
,p_is_js_message=>true
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144225147343752944)
,p_name=>'APEX.IG.EMAIL_BCC'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\00F4\0300ng g\01B0\0309i, \00E2\0309n \0111i\0323a chi\0309 (bcc)')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144225319469752944)
,p_name=>'APEX.IG.EMAIL_BODY'
,p_message_language=>'vi'
,p_message_text=>unistr('N\00F4\0323i dung')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144225043143752944)
,p_name=>'APEX.IG.EMAIL_CC'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\00F4\0300ng g\01B0\0309i (cc)')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144224754794752944)
,p_name=>'APEX.IG.EMAIL_SENT'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 g\01B0\0309i email.')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144225217211752944)
,p_name=>'APEX.IG.EMAIL_SUBJECT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\00EAu \0111\00EA\0300')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144224962514752944)
,p_name=>'APEX.IG.EMAIL_TO'
,p_message_language=>'vi'
,p_message_text=>unistr('Ng\01B0\01A1\0300i nh\00E2\0323n (\0111\00EA\0301n)')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144179087079752930)
,p_name=>'APEX.IG.ENABLED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 k\00EDch ho\1EA1t')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144172212510752928)
,p_name=>'APEX.IG.EQUALS'
,p_message_language=>'vi'
,p_message_text=>unistr('b\0103\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144179112071752930)
,p_name=>'APEX.IG.EXPRESSION'
,p_message_language=>'vi'
,p_message_text=>unistr('Bi\00EA\0309u th\01B0\0301c')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144224199096752943)
,p_name=>'APEX.IG.FD_TYPE'
,p_message_language=>'vi'
,p_message_text=>unistr('Loa\0323i')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144191394586752934)
,p_name=>'APEX.IG.FILE_PREPARED'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00E2\0323p tin \0111a\0303 s\0103\0303n sa\0300ng. \0110ang b\1EAFt \0111\1EA7u t\1EA3i xu\00F4\0301ng.')
,p_is_js_message=>true
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144153655959752922)
,p_name=>'APEX.IG.FILL'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00F4 ma\0300u')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144155864083752923)
,p_name=>'APEX.IG.FILL_LABEL'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00F4 l\01B0\0323a cho\0323n b\0103\0300ng ma\0300u')
,p_is_js_message=>true
,p_version_scn=>2705854
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144155716807752923)
,p_name=>'APEX.IG.FILL_TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00F4 ma\0300u l\01B0\0323a cho\0323n')
,p_is_js_message=>true
,p_version_scn=>2705854
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144145403602752920)
,p_name=>'APEX.IG.FILTER'
,p_message_language=>'vi'
,p_message_text=>unistr('L\1ECDc')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144178498963752930)
,p_name=>'APEX.IG.FILTERS'
,p_message_language=>'vi'
,p_message_text=>unistr('B\00F4\0323 lo\0323c')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144232195490752946)
,p_name=>'APEX.IG.FILTER_WITH_DOTS'
,p_message_language=>'vi'
,p_message_text=>unistr('L\1ECDc...')
,p_is_js_message=>true
,p_version_scn=>2705868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144218105008752942)
,p_name=>'APEX.IG.FIRST'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\00E2\0300u ti\00EAn')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144145617246752920)
,p_name=>'APEX.IG.FLASHBACK'
,p_message_language=>'vi'
,p_message_text=>unistr('H\00F4\0300i t\01B0\01A1\0309ng')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144176920015752929)
,p_name=>'APEX.IG.FORMAT'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110i\0323nh da\0323ng')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144222774937752943)
,p_name=>'APEX.IG.FORMATMASK'
,p_message_language=>'vi'
,p_message_text=>unistr('C\1EA5u tr\00FAc \0111i\0323nh da\0323ng')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144224475484752944)
,p_name=>'APEX.IG.FORMAT_CSV'
,p_message_language=>'vi'
,p_message_text=>'CSV'
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144224348908752944)
,p_name=>'APEX.IG.FORMAT_HTML'
,p_message_language=>'vi'
,p_message_text=>'HTML'
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144135482967752917)
,p_name=>'APEX.IG.FORMAT_PDF'
,p_message_language=>'vi'
,p_message_text=>'PDF'
,p_is_js_message=>true
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144069304098752897)
,p_name=>'APEX.IG.FORMAT_XLSX'
,p_message_language=>'vi'
,p_message_text=>'Excel'
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144181560487752931)
,p_name=>'APEX.IG.FREEZE'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110o\0301ng b\0103ng')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144179275484752930)
,p_name=>'APEX.IG.FUNCTIONS_AND_OPERATORS'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0300m va\0300 toa\0301n t\01B0\0309')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144216346774752941)
,p_name=>'APEX.IG.FUNNEL'
,p_message_language=>'vi'
,p_message_text=>unistr('Ph\00EA\0303u')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144198077153752936)
,p_name=>'APEX.IG.GO'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110i')
,p_is_js_message=>true
,p_version_scn=>2705863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144172818504752928)
,p_name=>'APEX.IG.GREATER_THAN'
,p_message_language=>'vi'
,p_message_text=>unistr('l\01A1\0301n h\01A1n')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144172911515752928)
,p_name=>'APEX.IG.GREATER_THAN_OR_EQUALS'
,p_message_language=>'vi'
,p_message_text=>unistr('l\01A1\0301n h\01A1n ho\0103\0323c b\0103\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144179514532752930)
,p_name=>'APEX.IG.GRID'
,p_message_language=>'vi'
,p_message_text=>unistr('L\01B0\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144144644097752920)
,p_name=>'APEX.IG.GRID_VIEW'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\00EA\0301 \0111\00F4\0323 xem l\01B0\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144218973672752942)
,p_name=>'APEX.IG.GROUP'
,p_message_language=>'vi'
,p_message_text=>unistr('Nh\00F3m')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144179752751752930)
,p_name=>'APEX.IG.GROUP_BY'
,p_message_language=>'vi'
,p_message_text=>unistr('Ph\00E2n nho\0301m theo')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144144967827752920)
,p_name=>'APEX.IG.GROUP_BY_VIEW'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\00EA\0301 \0111\00F4\0323 xem ph\00E2n nh\00F3m theo')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144223325277752943)
,p_name=>'APEX.IG.HD_TYPE'
,p_message_language=>'vi'
,p_message_text=>unistr('Loa\0323i \0111i\00EA\0300u ki\00EA\0323n')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144222294449752943)
,p_name=>'APEX.IG.HEADING'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\00EAu \0111\00EA\0300')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144222428923752943)
,p_name=>'APEX.IG.HEADING_ALIGN'
,p_message_language=>'vi'
,p_message_text=>unistr('C\0103n chi\0309nh ti\00EAu \0111\00EA\0300')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144232038309752946)
,p_name=>'APEX.IG.HELP'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\01A1\0323 giu\0301p')
,p_is_js_message=>true
,p_version_scn=>2705868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144227528491752944)
,p_name=>'APEX.IG.HELP.ACTIONS.EDITING'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>B\1EA1n c\00F3 th\1EC3 ch\00E8n, c\1EADp nh\1EADt v\00E0 x\00F3a d\1EEF li\1EC7u tr\1EF1c ti\1EBFp trong l\01B0\1EDBi t\01B0\01A1ng t\00E1c n\00E0y.</p>'),
'',
unistr('<p>Ch\00E8n h\00E0ng m\1EDBi b\1EB1ng c\00E1ch nh\1EA5p v\00E0o n\00FAt Th\00EAm h\00E0ng.</p>'),
'',
unistr('<p>Ch\1EC9nh s\1EEDa d\1EEF li\1EC7u hi\1EC7n c\00F3 b\1EB1ng c\00E1ch nh\1EA5p \0111\00FAp v\00E0o m\1ED9t \00F4 c\1EE5 th\1EC3. \0110\1ED1i v\1EDBi c\00F4ng vi\1EC7c ch\1EC9nh s\1EEDa l\1EDBn h\01A1n, h\00E3y nh\1EA5p v\00E0o Ch\1EC9nh s\1EEDa \0111\1EC3 chuy\00EA\0309n sang ch\1EBF \0111\1ED9 ch\1EC9nh s\1EEDa. \1EDE ch\1EBF \0111\1ED9 ch\1EC9nh s\1EEDa, b\1EA1n c\00F3 th\1EC3 nh\1EA5p m\1ED9t l\1EA7n ho\1EB7c s\1EED d\1EE5ng b\00E0n ph\00EDm \0111\1EC3 ch\1EC9nh s\1EEDa c\00E1c \00F4 c\1EE5 th')
||unistr('\1EC3.</p>'),
'',
unistr('<p>S\1EED d\1EE5ng tri\0300nh \0111\01A1n Thay \0111\1ED5i \0111\1EC3 sao ch\00E9p v\00E0 x\00F3a c\00E1c h\00E0ng. \0110\1EC3 ki\0301ch hoa\0323t tri\0300nh \0111\01A1n Thay \0111\1ED5i, h\00E3y s\1EED d\1EE5ng h\1ED9p cho\0323n \0111\1EC3 ch\1ECDn m\1ED9t ho\1EB7c nhi\1EC1u h\00E0ng.</p>'),
'',
unistr('<p>Sao ch\00E9p h\00E0ng \0111\00E3 ch\1ECDn b\1EB1ng c\00E1ch nh\1EA5p v\00E0o tri\0300nh \0111\01A1n Thay \0111\1ED5i v\00E0 ch\1ECDn Sao che\0301p h\00E0ng. X\00F3a h\00E0ng \0111\00E3 ch\1ECDn b\1EB1ng c\00E1ch nh\1EA5p v\00E0o tri\0300nh \0111\01A1n Thay \0111\1ED5i v\00E0 ch\1ECDn X\00F3a h\00E0ng.</p>')))
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144229687775752945)
,p_name=>'APEX.IG.HELP.ACTIONS.EDITING_HEADING'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\0301nh n\0103ng chi\0309nh s\01B0\0309a')
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144229720194752945)
,p_name=>'APEX.IG.HELP.ACTIONS.INTRO'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>L\01B0\1EDBi t\01B0\01A1ng t\00E1c tr\00ECnh b\00E0y m\1ED9t t\00E2\0323p d\1EEF li\1EC7u trong m\1ED9t b\00E1o c\00E1o c\00F3 th\1EC3 ti\0300m ki\00EA\0301m va\0300 t\00F9y ch\1EC9nh. B\1EA1n c\00F3 th\1EC3 th\1EF1c hi\1EC7n nhi\1EC1u thao t\00E1c \0111\1EC3 gi\01A1\0301i h\1EA1n s\1ED1 l\01B0\01A1\0323ng d\01B0\0303 li\00EA\0323u \0111\01B0\1EE3c tr\1EA3 v\1EC1 v\00E0 thay \0111\1ED5i c\00E1ch hi\1EC3n th\1ECB d\1EEF li\1EC7u.</p>'),
'',
unistr('<p>S\1EED d\1EE5ng tr\01B0\1EDDng T\00ECm ki\1EBFm \0111\1EC3 l\1ECDc c\00E1c d\01B0\0303 li\00EA\0323u \0111\01B0\1EE3c tr\1EA3 v\1EC1. Nh\1EA5p v\00E0o H\00E0nh \0111\1ED9ng \0111\1EC3 truy c\1EADp nhi\1EC1u t\00F9y ch\1ECDn s\1EEDa \0111\1ED5i b\1ED1 c\1EE5c b\00E1o c\00E1o ho\1EB7c s\1EED d\1EE5ng tri\0300nh \0111\01A1n Ti\00EAu \0111\1EC1 c\1ED9t tr\00EAn c\00E1c c\1ED9t \0111\01B0\1EE3c hi\1EC3n th\1ECB.</p>'),
'',
unistr('<p>S\1EED d\1EE5ng C\00E0i \0111\1EB7t b\00E1o c\00E1o \0111\1EC3 l\01B0u c\00E1c mu\0323c t\00F9y ch\1EC9nh c\1EE7a b\1EA1n v\00E0o b\00E1o c\00E1o. B\1EA1n c\0169ng c\00F3 th\1EC3 t\1EA3i d\1EEF li\1EC7u t\1EEB b\00E1o c\00E1o xu\1ED1ng m\00F4\0323t t\00E2\0323p tin b\00EAn ngo\00E0i ho\1EB7c g\1EEDi d\1EEF li\1EC7u qua email cho ch\00EDnh m\00ECnh ho\1EB7c ng\01B0\1EDDi kh\00E1c.</p>'),
'',
unistr('<p>\0110\1EC3 t\00ECm hi\1EC3u th\00EAm, h\00E3y xem ph\00E2\0300n "S\1EED d\1EE5ng l\01B0\1EDBi t\01B0\01A1ng t\00E1c" trong <em>H\01B0\1EDBng d\1EABn c\1EE7a Oracle APEX d\00E0nh cho ng\01B0\1EDDi d\00F9ng cu\1ED1i</em>.')))
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144229426706752945)
,p_name=>'APEX.IG.HELP.ACTIONS.INTRO_HEADING'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00F4\0309ng quan')
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144227419326752944)
,p_name=>'APEX.IG.HELP.ACTIONS.REPORTING'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>B\1EA1n c\00F3 th\1EC3 t\00F9y ch\1EC9nh l\01B0\1EDBi t\01B0\01A1ng t\00E1c \0111\1EC3 hi\1EC3n th\1ECB d\1EEF li\1EC7u theo nhi\1EC1u c\00E1ch kh\00E1c nhau b\1EB1ng c\00E1ch s\1EED d\1EE5ng c\00E1c t\00EDnh n\0103ng t\00EDch h\1EE3p s\1EB5n.</p>'),
'',
unistr('<p>S\1EED d\1EE5ng tri\0300nh \0111\01A1n Ti\00EAu \0111\1EC1 c\1ED9t ho\1EB7c tri\0300nh \0111\01A1n Ha\0300nh \0111\00F4\0323ng \0111\1EC3 x\00E1c \0111\1ECBnh nh\01B0\0303ng c\1ED9t n\00E0o s\1EBD hi\1EC3n th\1ECB, theo th\01B0\0301 t\1EF1 n\00E0o v\00E0 \0111o\0301ng b\0103ng ca\0301c c\1ED9t. B\1EA1n c\0169ng c\00F3 th\1EC3 x\00E1c \0111\1ECBnh c\00E1c b\1ED9 l\1ECDc d\1EEF li\1EC7u kh\00E1c nhau v\00E0 s\1EAFp x\1EBFp d\1EEF li\1EC7u \0111\01B0\1EE3c tr\1EA3 v\1EC1.</p>'),
'',
unistr('<p>S\1EED d\1EE5ng n\00FAt Xem (li\1EC1n k\1EC1 tr\01B0\1EDDng T\00ECm ki\1EBFm) \0111\1EC3 truy c\1EADp c\00E1c ch\1EBF \0111\1ED9 xem d\1EEF li\1EC7u kh\00E1c c\00F3 th\1EC3 \0111\00E3 \0111\01B0\1EE3c nh\00E0 ph\00E1t tri\1EC3n \1EE9ng d\1EE5ng x\00E1c \0111\1ECBnh. B\1EA1n c\0169ng c\00F3 th\1EC3 t\1EA1o bi\1EC3u \0111\1ED3 ho\1EB7c xem bi\1EC3u \0111\1ED3 hi\1EC7n c\00F3.</p>'),
'',
unistr('<p><em>L\01B0u \00FD: Nh\1EA5p v\00E0o <strong>Tr\1EE3 gi\00FAp</strong> trong h\1ED9p tho\1EA1i l\01B0\1EDBi t\01B0\01A1ng t\00E1c \0111\1EC3 nh\00E2\0323n th\00EAm th\00F4ng tin chi ti\1EBFt v\1EC1 ch\1EE9c n\0103ng \0111\00E3 ch\1ECDn.</em></p>')))
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144229528805752945)
,p_name=>'APEX.IG.HELP.ACTIONS.REPORTING_HEADING'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\0301nh n\0103ng ba\0301o ca\0301o')
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144180580877752930)
,p_name=>'APEX.IG.HELP.ACTIONS_TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\01A1\0323 giu\0301p l\01B0\01A1\0301i t\01B0\01A1ng ta\0301c')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144226306656752944)
,p_name=>'APEX.IG.HELP.AGGREGATE'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>S\1EED d\1EE5ng h\1ED9p tho\1EA1i n\00E0y \0111\1EC3 t\1ED5ng h\1EE3p c\00E1c c\1ED9t. C\00E1c gi\00E1 tr\1ECB t\1ED5ng h\1EE3p hi\1EC3n th\1ECB \1EDF cu\1ED1i d\1EEF li\1EC7u ho\1EB7c \1EDF cu\1ED1i m\1ED7i d\1EA5u ng\1EAFt n\1EBFu D\1EA5u ng\1EAFt \0111i\1EC1u khi\1EC3n \0111\01B0\1EE3c x\00E1c \0111\1ECBnh.</p>'),
'',
unistr('<p><strong>Danh s\00E1ch t\1ED5ng h\1EE3p</strong><br>'),
unistr('Danh s\00E1ch t\00F4\0309ng h\1EE3p hi\1EC3n th\1ECB c\00E1c mu\0323c t\00F4\0309ng h\1EE3p \0111\01B0\1EE3c x\00E1c \0111\1ECBnh. V\00F4 hi\1EC7u h\00F3a m\1ED9t mu\0323c t\00F4\0309ng h\1EE3p hi\1EC7n c\00F3 b\1EB1ng c\00E1ch b\1ECF ch\1ECDn mu\0323c \0111\00F3.<br>'),
unistr('Nh\1EA5p v\00E0o Th\00EAm ( &plus; ) \0111\1EC3 t\1EA1o mu\0323c t\00F4\0309ng h\1EE3p m\1EDBi ho\1EB7c nh\00E2\0301p va\0300o X\00F3a ( &minus; ) \0111\1EC3 x\00F3a mu\0323c t\00F4\0309ng h\1EE3p hi\1EC7n c\00F3.</p>'),
'',
unistr('<p><strong>C\00E0i \0111\1EB7t mu\0323c t\1ED5ng h\1EE3p</strong><br>'),
unistr('S\1EED d\1EE5ng bi\1EC3u m\1EABu \01A1\0309 b\00EAn ph\1EA3i \0111\1EC3 x\00E1c \0111\1ECBnh mu\0323c t\1ED5ng h\1EE3p.<br>'),
unistr('Ch\1ECDn T\00EAn c\1ED9t v\00E0 Lo\1EA1i t\00F4\0309ng h\1EE3p.<br>'),
unistr('N\00EA\0301u mu\00F4\0301n, b\1EA1n c\00F3 th\1EC3 nh\1EADp ch\00FA gi\1EA3i c\00F4ng c\1EE5 cho mu\0323c t\1ED5ng h\1EE3p \0111o\0301.<br>'),
unistr('N\1EBFu b\1EA1n \0111\00E3 x\00E1c \0111\1ECBnh D\00E2\0301u ng\1EAFt \0111i\00EA\0300u khi\00EA\0309n, vi\1EC7c ch\1ECDn <strong>Hi\1EC3n th\1ECB gi\00E1 tr\1ECB t\1ED5ng th\1EC3</strong> s\1EBD hi\1EC3n th\1ECB gi\00E1 tr\1ECB trung b\00ECnh, t\1ED5ng ho\1EB7c gi\00E1 tr\1ECB t\01B0\01A1ng t\1EF1 t\1ED5ng th\1EC3 \1EDF cu\1ED1i d\1EEF li\1EC7u.</p>'),
'',
unistr('<p><em>L\01B0u \00FD: Truy c\1EADp h\1ED9p tho\1EA1i Mu\0323c t\1ED5ng h\1EE3p trong tri\0300nh \0111\01A1n H\00E0nh \0111\1ED9ng ho\1EB7c b\0103\0300ng ca\0301ch nh\1EA5p v\00E0o ti\00EAu \0111\1EC1 c\1ED9t v\00E0 t\1ED5ng ( &sum; ).</em></p>')))
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144228597798752945)
,p_name=>'APEX.IG.HELP.AGGREGATE_TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\01A1\0323 giu\0301p t\00F4\0309ng h\01A1\0323p')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144227018206752944)
,p_name=>'APEX.IG.HELP.CHART'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>S\1EED d\1EE5ng h\1ED9p tho\1EA1i n\00E0y \0111\1EC3 x\00E1c \0111\1ECBnh m\00F4\0323t bi\1EC3u \0111\1ED3 se\0303 hi\1EC3n th\1ECB d\01B0\1EDBi d\1EA1ng ch\1EBF \0111\1ED9 xem d\1EEF li\1EC7u ri\00EAng bi\1EC7t.<br>'),
unistr('Ch\1ECDn m\00F4\0323t Lo\1EA1i bi\1EC3u \0111\1ED3 v\00E0 ca\0301c thu\1ED9c t\00EDnh bi\1EC3u \0111\1ED3.</p>'),
unistr('<p><strong>Thu\1ED9c t\00EDnh bi\1EC3u \0111\1ED3</strong><br>'),
unistr('C\00E1c thu\1ED9c t\00EDnh bi\1EC3u \0111\1ED3 c\00F3 s\1EB5n s\1EBD kh\00E1c nhau t\00F9y thu\1ED9c v\00E0o lo\1EA1i bi\1EC3u \0111\1ED3.</p>'),
'<p>',
'<ul>',
unistr('   <li>Ch\1ECDn c\1ED9t ch\1EE9a gi\00E1 tr\1ECB cho thu\1ED9c t\00EDnh:'),
'     <ul>',
unistr('       <li>Nh\00E3n - V\0103n b\1EA3n cho t\1EEBng \0111i\1EC3m d\1EEF li\1EC7u.</li>'),
unistr('       <li>Gi\00E1 tr\1ECB - D\1EEF li\1EC7u se\0303 \0111\01B0\1EE3c v\1EBD bi\00EA\0309u \0111\00F4\0300.</li>'),
unistr('       <li>Chu\1ED7i - \0110\1EC3 x\00E1c \0111\1ECBnh truy v\1EA5n \0111\1ED9ng g\00F4\0300m nhi\1EC1u chu\1ED7i c\1EE7a b\1EA1n.</li>'),
unistr('       <li>M\1EDF - Gi\00E1 m\1EDF c\1EEDa cu\0309a c\00F4\0309 phi\00EA\0301u h\00E0ng ng\00E0y (Ch\1EC9 c\00F4\0309 phi\00EA\0301u).</li>'),
unistr('       <li>\0110\00F3ng - Gi\00E1 \0111\00F3ng c\01B0\0309a cu\0309a c\1ED5 phi\1EBFu h\00E0ng ng\00E0y (Ch\1EC9 c\1ED5 phi\1EBFu).</li>'),
unistr('       <li>Cao - Gi\00E1 tr\1ECB cao (Ch\1EC9 Ph\1EA1m vi v\00E0 C\00F4\0309 phi\00EA\0301u).</li>'),
unistr('       <li>Th\1EA5p - Gi\00E1 tr\1ECB th\1EA5p (Ch\1EC9 Ph\1EA1m vi v\00E0 C\00F4\0309 phi\00EA\0301u).</li>'),
unistr('       <li>Kh\00F4\0301i l\01B0\1EE3ng - Kh\00F4\0301i l\01B0\1EE3ng c\00F4\0309 phi\00EA\0301u ha\0300ng ng\00E0y (Ch\1EC9 c\00F4\0309 phi\00EA\0301u).</li>'),
unistr('       <li>Mu\0323c ti\00EAu - Gi\00E1 tr\1ECB mu\0323c ti\00EAu (ch\1EC9 Ph\00EA\0303u).</li>'),
unistr('       <li>X - Gi\00E1 tr\1ECB tr\1EE5c x (ch\1EC9 Bong b\00F3ng v\00E0 Ph\00E2n t\00E1n).</li>'),
unistr('       <li>Y - Gi\00E1 tr\1ECB tr\1EE5c y (ch\1EC9 Bong b\00F3ng v\00E0 Ph\00E2n t\00E1n).</li>'),
unistr('       <li>Z - Chi\1EC1u r\1ED9ng thanh ho\1EB7c b\00E1n k\00EDnh bong b\00F3ng (Ch\1EC9 Thanh, Bong b\00F3ng v\00E0 Ph\1EA1m vi).</li>'),
'     </ul>',
'   </li>',
unistr('   <li>H\01B0\1EDBng - D\1ECDc ho\1EB7c ngang.</li>'),
unistr('   <li>T\1ED5ng h\1EE3p - Ch\1ECDn c\00E1ch t\1ED5ng h\1EE3p c\00E1c gi\00E1 tr\1ECB bi\1EC3u \0111\1ED3.</li>'),
unistr('   <li>Ng\0103n x\00EA\0301p - Ch\1EC9 \0111\1ECBnh li\00EA\0323u c\00E1c m\1EE5c d\1EEF li\1EC7u c\00F3 \0111\01B0\1EE3c x\1EBFp ch\1ED3ng hay kh\00F4ng.</li>'),
unistr('   <li>S\1EAFp x\1EBFp theo - S\1EAFp x\1EBFp theo nh\00E3n ho\1EB7c (c\00E1c) gi\00E1 tr\1ECB.'),
'     <ul>',
unistr('       <li>H\01B0\01A1\0301ng - S\1EAFp x\1EBFp theo gi\00E1 tr\1ECB t\0103ng d\1EA7n ho\0103\0323c gi\1EA3m d\1EA7n.</li>'),
unistr('       <li>Gia\0301 tri\0323 r\00F4\0303ng - Ch\1EC9 \0111\1ECBnh c\00E1ch s\1EAFp x\1EBFp c\00E1c d\01B0\0303 li\00EA\0323u c\00F3 gi\00E1 tr\1ECB r\00F4\0303ng so v\1EDBi c\00E1c d\01B0\0303 li\00EA\0323u c\00F3 gi\00E1 tr\1ECB kh\00F4ng r\00F4\0303ng.</li>'),
'     </ul>',
'   </li>',
unistr('   <li>S\1ED1 l\01B0\01A1\0323ng ch\01B0\0303 s\00F4\0301 th\1EADp ph\00E2n</li>'),
unistr('   <li>Ti\00EAu \0111\1EC1 tr\1EE5c nh\00E3n</li>'),
unistr('   <li>Ti\00EAu \0111\1EC1 tr\1EE5c gi\00E1 tr\1ECB</li>'),
'</ul>',
'</p>'))
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144228979167752945)
,p_name=>'APEX.IG.HELP.CHART_TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\01A1\0323 giu\0301p bi\00EA\0309u \0111\00F4\0300')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144226055161752944)
,p_name=>'APEX.IG.HELP.COLUMNS'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>S\1EED d\1EE5ng h\1ED9p tho\1EA1i n\00E0y \0111\1EC3 ch\1ECDn nh\01B0\0303ng c\1ED9t na\0300o se\0303 hi\1EC3n th\1ECB v\00E0 theo th\1EE9 t\1EF1 na\0300o.</p>'),
'',
unistr('<p>\1EA8n m\1ED9t c\1ED9t b\1EB1ng c\00E1ch b\1ECF ch\1ECDn c\1ED9t \0111\00F3.<br>'),
unistr('S\1EAFp x\1EBFp l\1EA1i c\00E1c c\1ED9t b\1EB1ng c\00E1ch nh\1EA5p v\00E0o Di chuy\1EC3n l\00EAn ( &uarr; ) ho\1EB7c Di chuy\1EC3n xu\1ED1ng ( &darr; ).<br>'),
unistr('S\1EED d\1EE5ng b\1ED9 ch\1ECDn th\1EA3 xu\1ED1ng \0111\1EC3 li\1EC7t k\00EA T\1EA5t c\1EA3 c\00E1c c\1ED9t, C\1ED9t \0111\01B0\1EE3c hi\1EC3n th\1ECB ho\1EB7c C\1ED9t kh\00F4ng \0111\01B0\1EE3c hi\1EC3n th\1ECB.</p>'),
'',
unistr('<p>N\00EA\0301u mu\00F4\0301n, ba\0323n co\0301 th\00EA\0309 s\1EED d\1EE5ng bi\1EC3u m\1EABu \0111\1EC3 ch\1EC9 \0111\1ECBnh chi\1EC1u r\1ED9ng t\1ED1i thi\1EC3u c\1EE7a c\1ED9t t\00EDnh b\1EB1ng pixel.</p>'),
'',
unistr('<p><em>L\01B0u \00FD: B\1EA1n c\0169ng c\00F3 th\1EC3 s\1EAFp x\1EBFp l\1EA1i c\00E1c c\1ED9t \0111\01B0\1EE3c hi\1EC3n th\1ECB b\1EB1ng c\00E1ch nh\1EA5p v\00E0o ch\1ED1t k\00E9o (\1EDF \0111\1EA7u ti\00EAu \0111\1EC1 c\1ED9t) v\00E0 k\00E9o c\1ED9t sang tr\00E1i ho\1EB7c ph\1EA3i. B\1EA1n c\0169ng c\00F3 th\1EC3 thay \0111\1ED5i \0111\1ED9 r\1ED9ng c\1ED9t c\1EE7a c\00E1c c\1ED9t \0111\01B0\1EE3c hi\1EC3n th\1ECB b\1EB1ng c\00E1ch ch\1ECDn d\1EA5u ph\00E2n c\00E1ch c\1ED9t, gi\1EEFa c\00E1c ')
||unistr('ti\00EAu \0111\1EC1 v\00E0 di chuy\1EC3n sang tr\00E1i ho\1EB7c sang ph\1EA3i.</em></p>')))
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144228846578752945)
,p_name=>'APEX.IG.HELP.COLUMNS_TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\01A1\0323 giu\0301p c\00F4\0323t')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144226485104752944)
,p_name=>'APEX.IG.HELP.COMPUTE'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>S\1EED d\1EE5ng h\1ED9p tho\1EA1i n\00E0y \0111\1EC3 x\00E1c \0111\1ECBnh nh\01B0\0303ng c\1ED9t b\1ED5 sung d\1EF1a tr\00EAn ph\00E9p t\00EDnh to\00E1n h\1ECDc v\00E0 ha\0300m \0111\01B0\1EE3c th\1EF1c hi\1EC7n \0111\1ED1i v\1EDBi c\00E1c c\1ED9t hi\1EC7n c\00F3.</p>'),
'',
unistr('<p><strong>Danh s\00E1ch phe\0301p t\00EDnh</strong><br>'),
unistr('Danh s\00E1ch phe\0301p t\00EDnh hi\1EC3n th\1ECB c\00E1c phe\0301p t\00EDnh \0111\01B0\1EE3c x\00E1c \0111\1ECBnh. T\1EAFt m\00F4\0323t phe\0301p t\00EDnh hi\1EC7n c\00F3 b\1EB1ng c\00E1ch b\1ECF ch\1ECDn phe\0301p ti\0301nh \0111\00F3.<br>'),
unistr('Nh\1EA5p v\00E0o Th\00EAm ( &plus; ) \0111\1EC3 th\00EAm ph\00E9p t\00EDnh m\1EDBi ho\1EB7c nh\00E2\0301p va\0300o X\00F3a ( &minus; ) \0111\1EC3 x\00F3a ph\00E9p t\00EDnh hi\1EC7n c\00F3.</p>'),
'',
unistr('<p><strong>C\00E0i \0111\1EB7t phe\0301p t\00EDnh</strong><br>'),
unistr('S\1EED d\1EE5ng bi\1EC3u m\1EABu \0111\1EC3 x\00E1c \0111\1ECBnh ph\00E9p t\00EDnh.<br>'),
unistr('Nh\1EADp c\00E1c chi ti\1EBFt c\1ED9t nh\01B0 ti\00EAu \0111\1EC1, nh\00E3n v\00E0 ch\1ECDn c\00E0i \0111\1EB7t c\0103n ch\1EC9nh.<br>'),
unistr('S\1EED d\1EE5ng v\00F9ng v\0103n b\1EA3n Bi\1EC3u th\1EE9c \0111\1EC3 nh\1EADp (c\00E1c) c\1ED9t v\00E0 c\00E1c h\00E0m li\00EAn quan cho ph\00E9p t\00EDnh.<br>'),
unistr('Ch\1ECDn lo\1EA1i d\1EEF li\1EC7u th\00EDch h\1EE3p v\00E0 c\00E2\0301u tru\0301c \0111\1ECBnh d\1EA1ng (n\00EA\0301u mu\00F4\0301n) cho c\1ED9t m\1EDBi.</p>')))
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144228453248752945)
,p_name=>'APEX.IG.HELP.COMPUTE_TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\01A1\0323 giu\0301p ti\0301nh toa\0301n')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144226795022752944)
,p_name=>'APEX.IG.HELP.CONTROL_BREAK'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>S\1EED d\1EE5ng h\1ED9p tho\1EA1i n\00E0y \0111\1EC3 x\00E1c \0111\1ECBnh d\00E2\0301u ng\1EAFt \0111i\00EA\0300u khi\00EA\0309n tr\00EAn m\1ED9t ho\1EB7c nhi\1EC1u c\1ED9t.</p>'),
'',
unistr('<p><strong>Danh s\00E1ch d\00E2\0301u ng\1EAFt \0111i\00EA\0300u khi\00EA\0309n</strong><br>'),
unistr('Danh s\00E1ch d\00E2\0301u ng\0103\0301t \0111i\00EA\0300u khi\00EA\0309n hi\1EC3n th\1ECB c\00E1c d\00E2\0301u ng\1EAFt \0111i\00EA\0300u khi\00EA\0309n \0111\01B0\1EE3c x\00E1c \0111\1ECBnh. T\1EAFt m\00F4\0323t c\1ED9t d\00E2\0301u ng\1EAFt \0111i\00EA\0300u khi\00EA\0309n hi\1EC7n c\00F3 b\1EB1ng c\00E1ch b\1ECF ch\1ECDn c\1ED9t \0111\00F3.<br>'),
unistr('Nh\1EA5p v\00E0o Th\00EAm ( &plus; ) \0111\1EC3 \0111\01B0a c\1ED9t m\1EDBi v\00E0o d\1EA5u ng\1EAFt \0111i\00EA\0300u khi\00EA\0309n ho\1EB7c nh\00E2\0301p va\0300o X\00F3a ( &minus; ) \0111\1EC3 x\00F3a c\1ED9t hi\1EC7n c\00F3 kh\1ECFi d\1EA5u ng\1EAFt \0111i\00EA\0300u khi\00EA\0309n.<br>'),
unistr('\0110\1EC3 s\1EAFp x\1EBFp l\1EA1i c\00E1c c\1ED9t, h\00E3y nh\1EA5p v\00E0o Di chuy\1EC3n l\00EAn ( &uarr; ) ho\1EB7c Di chuy\1EC3n xu\1ED1ng ( &darr; ) \0111\1EC3 di chuy\1EC3n c\1ED9t \0111\00E3 ch\1ECDn l\00EAn v\00E0 xu\1ED1ng so v\1EDBi c\00E1c c\1ED9t kh\00E1c.</p>'),
'',
unistr('<p><strong>C\00E0i \0111\1EB7t d\00E2\0301u ng\1EAFt \0111i\00EA\0300u khi\00EA\0309n</strong><br>'),
unistr('S\1EED d\1EE5ng bi\1EC3u m\1EABu \0111\1EC3 x\00E1c \0111\1ECBnh c\1ED9t d\00E2\0301u ng\1EAFt \0111i\00EA\0300u khi\00EA\0309n.<br>'),
unistr('Ch\1ECDn m\00F4\0323t c\1ED9t d\00E2\0301u ng\1EAFt \0111i\00EA\0300u khi\00EA\0309n, h\01B0\01A1\0301ng s\1EAFp x\1EBFp v\00E0 c\00E1ch s\1EAFp x\1EBFp c\00E1c c\1ED9t r\1ED7ng (c\1ED9t kh\00F4ng c\00F3 gi\00E1 tr\1ECB).</p>'),
'',
unistr('<p><em>L\01B0u \00FD: Khi xem l\01B0\1EDBi t\01B0\01A1ng t\00E1c, b\1EA1n c\00F3 th\1EC3 x\00E1c \0111\1ECBnh d\1EA5u ng\1EAFt \0111i\00EA\0300u khi\00EA\0309n b\1EB1ng c\00E1ch nh\1EA5p v\00E0o Ti\00EAu \0111\1EC1 c\1ED9t v\00E0 ch\1ECDn bi\1EC3u t\01B0\1EE3ng d\1EA5u ng\1EAFt \0111i\00EA\0300u khi\00EA\0309n.</em></p>')))
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144228169825752945)
,p_name=>'APEX.IG.HELP.CONTROL_BREAK_TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\01A1\0323 giu\0301p d\00E2\0301u ng\0103\0301t \0111i\00EA\0300u khi\00EA\0309n')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144226949852752944)
,p_name=>'APEX.IG.HELP.DOWNLOAD'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>S\1EED d\1EE5ng h\1ED9p tho\1EA1i n\00E0y \0111\1EC3 t\1EA3i mo\0323i h\00E0ng hi\1EC7n t\1EA1i xu\1ED1ng m\1ED9t t\00E2\0323p tin b\00EAn ngo\00E0i. T\00E2\0323p tin s\1EBD ch\1EC9 ch\1EE9a c\00E1c c\1ED9t hi\1EC7n \0111\01B0\1EE3c hi\1EC3n th\1ECB, s\1EED d\1EE5ng b\1EA5t k\1EF3 b\1ED9 l\1ECDc v\00E0 ca\0301ch s\1EAFp x\1EBFp n\00E0o \0111\01B0\1EE3c \00E1p d\1EE5ng cho d\1EEF li\1EC7u.</p>'),
'',
unistr('<p>Ch\1ECDn \0111\1ECBnh d\1EA1ng t\00E2\0323p tin v\00E0 nh\1EA5p v\00E0o T\1EA3i xu\1ED1ng.<br>'),
unistr('L\01B0u \00FD: CSV s\1EBD kh\00F4ng bao g\1ED3m \0111\1ECBnh d\1EA1ng v\0103n b\1EA3n nh\01B0 mu\0323c t\1ED5ng h\1EE3p v\00E0 d\00E2\0301u ng\1EAFt \0111i\00EA\0300u khi\00EA\0309n.</p>'),
'',
unistr('<p>\0110\1EC3 g\1EEDi t\00E2\0323p tin qua email, h\00E3y ch\1ECDn G\1EEDi d\01B0\1EDBi d\1EA1ng email v\00E0 nh\1EADp chi ti\1EBFt email (Ng\01B0\1EDDi nh\1EADn, Ti\00EAu \0111\1EC1 v\00E0 N\00F4\0323i dung).</p>')))
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144227903880752945)
,p_name=>'APEX.IG.HELP.DOWNLOAD_TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\01A1\0323 giu\0301p ta\0309i xu\00F4\0301ng')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144226169560752944)
,p_name=>'APEX.IG.HELP.FILTER'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>S\1EED d\1EE5ng h\1ED9p tho\1EA1i n\00E0y \0111\1EC3 \0111\1ECBnh c\1EA5u h\00ECnh ca\0301c b\1ED9 l\1ECDc d\1EEF li\1EC7u se\0303 gi\1EDBi h\1EA1n s\1ED1 h\00E0ng \0111\01B0\1EE3c tr\1EA3 v\1EC1.</p>'),
'',
unistr('<p><strong>Danh s\00E1ch b\1ED9 l\1ECDc</strong><br>'),
unistr('Danh s\00E1ch b\1ED9 l\1ECDc hi\1EC3n th\1ECB c\00E1c b\1ED9 l\1ECDc \0111\01B0\1EE3c x\00E1c \0111\1ECBnh. T\1EAFt b\1ED9 l\1ECDc hi\1EC7n c\00F3 b\1EB1ng c\00E1ch b\1ECF ch\1ECDn b\00F4\0323 lo\0323c \0111\00F3.</p>'),
unistr('Nh\1EA5p v\00E0o Th\00EAm ( &plus; ) \0111\1EC3 t\1EA1o b\1ED9 l\1ECDc m\1EDBi ho\1EB7c nh\00E2\0301p va\0300o X\00F3a ( &minus; ) \0111\1EC3 x\00F3a b\1ED9 l\1ECDc hi\1EC7n c\00F3.</p>'),
'',
unistr('<p><strong>C\00E0i \0111\1EB7t b\1ED9 l\1ECDc</strong><br>'),
unistr('S\1EED d\1EE5ng bi\1EC3u m\1EABu \0111\1EC3 x\00E1c \0111\1ECBnh ca\0301c thu\1ED9c t\00EDnh b\1ED9 l\1ECDc.<br>'),
unistr('Ch\1ECDn lo\1EA1i b\1ED9 l\1ECDc th\00EDch h\1EE3p:<br>'),
unistr('&nbsp;&nbsp;&nbsp;H\00E0ng - l\1ECDc m\1ED9t cu\0323m t\01B0\0300 trong b\1EA5t k\1EF3 c\1ED9t c\00F3 th\1EC3 l\1ECDc n\00E0o.<br>'),
unistr('&nbsp;&nbsp;&nbsp;C\1ED9t - l\1ECDc m\1ED9t c\1ED9t c\1EE5 th\1EC3 v\1EDBi to\00E1n t\1EED v\00E0 gi\00E1 tr\1ECB \0111\01B0\1EE3c ch\1EC9 \0111\1ECBnh.</p>'),
'',
unistr('<p><em>L\01B0u \00FD: Khi xem l\01B0\1EDBi t\01B0\01A1ng t\00E1c, b\1EA1n c\00F3 th\1EC3 x\00E1c \0111\1ECBnh b\1ED9 l\1ECDc h\00E0ng b\1EB1ng c\00E1ch nh\1EADp tr\1EF1c ti\1EBFp v\00E0o tr\01B0\1EDDng T\00ECm ki\1EBFm. Nh\00E2\0301p va\0300o Ch\1ECDn c\1ED9t c\00E2\0300n t\00ECm ki\1EBFm \0111\1EC3 gi\1EDBi h\1EA1n t\00ECm ki\1EBFm \01A1\0309 m\1ED9t c\1ED9t c\1EE5 th\1EC3. Ho\0103\0323c m\1EDF tri\0300nh \0111\01A1n Ti\00EAu \0111\1EC1 c\1ED9t v\00E0 ch\1ECDn m\1ED9t gi\00E1 tr\1ECB \0111\1EC3 t\1EA1o b')
||unistr('\1ED9 l\1ECDc c\1ED9t.</em></p>')))
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144228788173752945)
,p_name=>'APEX.IG.HELP.FILTER_TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\01A1\0323 giu\0301p lo\0323c')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144226572764752944)
,p_name=>'APEX.IG.HELP.FLASHBACK'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>S\1EED d\1EE5ng h\1ED9p tho\1EA1i n\00E0y \0111\1EC3 xem d\1EEF li\1EC7u nh\01B0 \0111\00E3 t\1ED3n t\1EA1i \1EDF th\1EDDi \0111i\1EC3m tr\01B0\1EDBc \0111\00F3.</p>'),
unistr('<p>Nh\1EADp s\1ED1 ph\00FAt trong qu\00E1 kh\1EE9 \0111\1EC3 th\1EF1c hi\1EC7n truy v\1EA5n h\1ED3i t\01B0\1EDFng.</p>')))
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144228399897752945)
,p_name=>'APEX.IG.HELP.FLASHBACK_TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\01A1\0323 giu\0301p h\00F4\0300i t\01B0\01A1\0309ng')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144229021850752945)
,p_name=>'APEX.IG.HELP.GROUP_BY_TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\01A1\0323 giu\0301p ph\00E2n nho\0301m theo')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144226695910752944)
,p_name=>'APEX.IG.HELP.HIGHLIGHT'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>S\1EED d\1EE5ng h\1ED9p tho\1EA1i n\00E0y \0111\1EC3 \0111\00E1nh d\1EA5u c\00E1c h\00E0ng ho\1EB7c c\1ED9t d\1EEF li\1EC7u d\1EF1a tr\00EAn \0111i\1EC1u ki\1EC7n \0111\00E3 nh\1EADp.</p>'),
'',
unistr('<p><strong>Danh s\00E1ch \0111\00E1nh d\1EA5u</strong><br>'),
unistr('Danh s\00E1ch \0111\00E1nh d\1EA5u hi\1EC3n th\1ECB c\00E1c ph\00E2\0300n \0111a\0301nh d\00E2\0301u \0111a\0303 x\00E1c \0111\1ECBnh. T\1EAFt m\00F4\0323t ph\00E2\0300n \0111\00E1nh d\1EA5u hi\1EC7n c\00F3 b\1EB1ng c\00E1ch b\1ECF ch\1ECDn ph\00E2\0300n \0111\00F3.<br>'),
unistr('Nh\1EA5p v\00E0o Th\00EAm ( &plus; ) \0111\1EC3 t\1EA1o ph\00E2\0300n \0111\00E1nh d\1EA5u m\1EDBi ho\1EB7c nh\00E2\0301p va\0300o X\00F3a ( &minus; ) \0111\1EC3 x\00F3a ph\00E2\0300n \0111\00E1nh d\1EA5u hi\1EC7n c\00F3.</p>'),
'',
unistr('<p><strong>C\00E0i \0111\1EB7t \0111\00E1nh d\1EA5u</strong><br>'),
unistr('S\1EED d\1EE5ng bi\1EC3u m\1EABu \0111\1EC3 x\00E1c \0111\1ECBnh ca\0301c thu\1ED9c t\00EDnh \0111\00E1nh d\1EA5u.<br>'),
unistr('Nh\1EADp t\00EAn, ch\1ECDn H\00E0ng ho\1EB7c C\1ED9t r\1ED3i ch\1ECDn m\00E3 m\00E0u HTML cho n\1EC1n v\00E0 v\0103n b\1EA3n.<br>'),
unistr('Ch\1ECDn <strong>Lo\1EA1i \0111i\1EC1u ki\1EC7n</strong> th\00EDch h\1EE3p \0111\1EC3 \0111a\0301nh d\00E2\0301u d\1EEF li\1EC7u c\1EE5 th\1EC3:<br>'),
unistr('&nbsp;&nbsp;&nbsp;H\00E0ng - \0111\00E1nh d\1EA5u c\1EE5m t\1EEB trong b\1EA5t k\1EF3 c\1ED9t n\00E0o.<br>'),
unistr('&nbsp;&nbsp;&nbsp;C\1ED9t - \0111\00E1nh d\1EA5u trong m\1ED9t c\1ED9t c\1EE5 th\1EC3 d\1EF1a tr\00EAn to\00E1n t\1EED v\00E0 gi\00E1 tr\1ECB \0111\01B0\1EE3c ch\1EC9 \0111\1ECBnh.</p>')))
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144228252636752945)
,p_name=>'APEX.IG.HELP.HIGHLIGHT_TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\01A1\0323 giu\0301p \0111a\0301nh d\00E2\0301u')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144226891890752944)
,p_name=>'APEX.IG.HELP.REPORT'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>S\1EED d\1EE5ng h\1ED9p tho\1EA1i n\00E0y \0111\1EC3 l\01B0u c\00E1c thay \0111\1ED5i b\1EA1n \0111\00E3 th\1EF1c hi\1EC7n \0111\1ED1i v\1EDBi c\1EA5u h\00ECnh v\00E0 b\1ED1 c\1EE5c l\01B0\1EDBi hi\1EC7n t\1EA1i.<br>'),
unistr('Nh\00E0 ph\00E1t tri\1EC3n \1EE9ng d\1EE5ng c\00F3 th\1EC3 x\00E1c \0111\1ECBnh nhi\1EC1u b\1ED1 c\1EE5c b\00E1o c\00E1o thay th\1EBF. N\1EBFu \0111\01B0\1EE3c ph\00E9p, b\1EA1n v\00E0 nh\1EEFng ng\01B0\1EDDi d\00F9ng cu\1ED1i kh\00E1c c\00F3 th\1EC3 l\01B0u b\00E1o c\00E1o \1EDF d\1EA1ng C\00F4ng khai, nh\01A1\0300 v\00E2\0323y ma\0300 t\1EA5t c\1EA3 nh\01B0\0303ng ng\01B0\1EDDi d\00F9ng kh\00E1c c\1EE7a l\01B0\1EDBi \0111\00EA\0300u xem \0111\01B0\01A1\0323c ba\0301o ca\0301o. B\1EA1n c\0169ng c\00F3 th')
||unistr('\1EC3 l\01B0u b\00E1o c\00E1o d\01B0\1EDBi d\1EA1ng B\00E1o c\00E1o ri\00EAng t\01B0 m\00E0 ch\1EC9 b\1EA1n m\1EDBi c\00F3 th\1EC3 xem.</p>'),
unistr('<p>Ch\1ECDn trong s\00F4\0301 c\00E1c lo\1EA1i s\1EB5n co\0301 v\00E0 nh\1EADp t\00EAn cho b\00E1o c\00E1o \0111a\0303 l\01B0u.</p>')))
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144228034611752945)
,p_name=>'APEX.IG.HELP.REPORT_TITLE'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Tr\01A1\0323 giu\0301p ba\0301o ca\0301o'),
''))
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144226217782752944)
,p_name=>'APEX.IG.HELP.SORT'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>S\1EED d\1EE5ng h\1ED9p tho\1EA1i n\00E0y \0111\1EC3 \0111\1EB7t th\1EE9 t\1EF1 hi\1EC3n th\1ECB.</p>'),
'',
unistr('<p><strong>Danh s\00E1ch s\1EAFp x\1EBFp</strong><br>'),
unistr('H\1ED9p tho\1EA1i S\1EAFp x\1EBFp hi\1EC3n th\1ECB danh s\00E1ch c\00E1c quy t\1EAFc s\1EAFp x\1EBFp \0111a\0303 \0111\1ECBnh c\1EA5u h\00ECnh.<br>'),
unistr('Nh\1EA5p v\00E0o Th\00EAm ( &plus; ) \0111\1EC3 t\1EA1o c\1ED9t s\1EAFp x\1EBFp ho\1EB7c nh\00E2\0301p va\0300o X\00F3a ( &minus; ) \0111\1EC3 x\00F3a c\1ED9t s\1EAFp x\1EBFp.<br>'),
unistr('Nh\1EA5p v\00E0o Di chuy\1EC3n l\00EAn ( &uarr; ) v\00E0 Di chuy\1EC3n xu\1ED1ng ( &darr; ) \0111\1EC3 di chuy\1EC3n c\1ED9t s\1EAFp x\1EBFp \0111\00E3 ch\1ECDn l\00EAn v\00E0 xu\1ED1ng so v\1EDBi c\00E1c c\1ED9t s\1EAFp x\1EBFp kh\00E1c.</p>'),
'',
unistr('<p><strong>C\00E0i \0111\1EB7t s\1EAFp x\1EBFp</strong><br>'),
unistr('Ch\1ECDn c\1ED9t s\1EAFp x\1EBFp, h\01B0\01A1\0301ng s\1EAFp x\1EBFp v\00E0 c\00E1ch s\1EAFp x\1EBFp c\00E1c c\1ED9t r\1ED7ng (c\1ED9t kh\00F4ng c\00F3 gi\00E1 tr\1ECB).</p>'),
'',
unistr('<p><em>L\01B0u \00FD: Co\0301 th\00EA\0309 s\0103\0301p x\00EA\0301p d\1EEF li\1EC7u theo c\00E1c c\1ED9t kh\00F4ng hi\1EC3n th\1ECB. Tuy nhi\00EAn, kh\00F4ng ph\1EA3i c\1ED9t na\0300o cu\0303ng s\1EAFp x\1EBFp \0111\01B0\1EE3c.</em><br>'),
unistr('<em>Co\0301 th\00EA\0309 s\0103\0301p x\00EA\0301p c\00E1c c\1ED9t \0111\01B0\1EE3c hi\1EC3n th\1ECB b\1EB1ng c\00E1ch nh\1EA5n va\0300o m\0169i t\00EAn l\00EAn (t\0103ng d\1EA7n) ho\1EB7c xu\1ED1ng (gi\1EA3m d\1EA7n) \1EDF cu\1ED1i ti\00EAu \0111\1EC1 c\1ED9t. \0110\1EC3 th\00EAm c\1ED9t ti\1EBFp theo v\00E0o c\00E1ch s\1EAFp x\1EBFp hi\1EC7n c\00F3, h\00E3y gi\1EEF ph\00EDm Shift r\00F4\0300i nh\1EA5p v\00E0o m\0169i t\00EAn l\00EAn ho\1EB7c xu\1ED1ng.</em></p>')))
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144228642600752945)
,p_name=>'APEX.IG.HELP.SORT_TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\01A1\0323 giu\0301p s\0103\0301p x\00EA\0301p')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144227859867752945)
,p_name=>'APEX.IG.HELP.SUBSCRIPTION_TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\01A1\0323 giu\0301p \0111\0103ng ky\0301')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144181400633752931)
,p_name=>'APEX.IG.HIDE'
,p_message_language=>'vi'
,p_message_text=>unistr('\00C2\0309n')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144145871042752920)
,p_name=>'APEX.IG.HIGHLIGHT'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0301nh d\00E2\0301u')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144215031671752941)
,p_name=>'APEX.IG.HIGH_COLUMN'
,p_message_language=>'vi'
,p_message_text=>'Cao'
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144215808922752941)
,p_name=>'APEX.IG.HORIZONTAL'
,p_message_language=>'vi'
,p_message_text=>'Ngang'
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144174423327752929)
,p_name=>'APEX.IG.HOURS'
,p_message_language=>'vi'
,p_message_text=>unistr('gi\01A1\0300')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144179412245752930)
,p_name=>'APEX.IG.ICON'
,p_message_language=>'vi'
,p_message_text=>unistr('Bi\00EA\0309u t\01B0\01A1\0323ng')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144144706498752920)
,p_name=>'APEX.IG.ICON_VIEW'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\00EA\0301 \0111\00F4\0323 xem bi\00EA\0309u t\01B0\01A1\0323ng')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144172629145752928)
,p_name=>'APEX.IG.IN'
,p_message_language=>'vi'
,p_message_text=>unistr('thu\00F4\0323c')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144181085738752931)
,p_name=>'APEX.IG.INACTIVE_SETTING'
,p_message_language=>'vi'
,p_message_text=>unistr('Ca\0300i \0111\0103\0323t kh\00F4ng hoa\0323t \0111\00F4\0323ng')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144181162110752931)
,p_name=>'APEX.IG.INACTIVE_SETTINGS'
,p_message_language=>'vi'
,p_message_text=>unistr('Ca\0300i \0111\0103\0323t kh\00F4ng hoa\0323t \0111\00F4\0323ng')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144188729640752933)
,p_name=>'APEX.IG.INTERNAL_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 xa\0309y ra l\00F4\0303i n\00F4\0323i b\00F4\0323 trong khi x\01B0\0309 ly\0301 y\00EAu c\00E2\0300u L\01B0\01A1\0301i t\01B0\01A1ng ta\0301c.')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144076694561752899)
,p_name=>'APEX.IG.INVALID_COLUMN_FILTER_TYPE'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng h\1ED7 tr\1EE3 loa\0323i b\00F4\0323 lo\0323c c\00F4\0323t "%0" \0111\00F4\0301i v\01A1\0301i c\00F4\0323t "%1".')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144227666619752944)
,p_name=>'APEX.IG.INVALID_DATE_FORMAT'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110i\0323nh da\0323ng nga\0300y kh\00F4ng h\01A1\0323p l\00EA\0323')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144202499450752937)
,p_name=>'APEX.IG.INVALID_FILTER_COLUMN'
,p_message_language=>'vi'
,p_message_text=>unistr('L\01B0\01A1\0301i t\01B0\01A1ng ta\0301c kh\00F4ng h\00F4\0303 tr\01A1\0323 xa\0301c \0111i\0323nh b\00F4\0323 lo\0323c tr\00EAn c\00F4\0323t %0.')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144202344086752937)
,p_name=>'APEX.IG.INVALID_FILTER_OPERATOR'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng pha\0309i la\0300 loa\0323i b\00F4\0323 lo\0323c h\01A1\0323p l\00EA\0323 \0111\00EA\0309 xa\0301c \0111i\0323nh b\00F4\0323 lo\0323c L\01B0\01A1\0301i t\01B0\01A1ng ta\0301c.')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144083251072752901)
,p_name=>'APEX.IG.INVALID_NUMBER_FORMAT'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110i\0323nh da\0323ng s\00F4\0301 kh\00F4ng h\01A1\0323p l\00EA\0323')
,p_is_js_message=>true
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144230390738752945)
,p_name=>'APEX.IG.INVALID_SETTING'
,p_message_language=>'vi'
,p_message_text=>unistr('Ca\0300i \0111\0103\0323t kh\00F4ng h\01A1\0323p l\00EA\0323')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144230481507752945)
,p_name=>'APEX.IG.INVALID_SETTINGS'
,p_message_language=>'vi'
,p_message_text=>unistr('Ca\0300i \0111\0103\0323t kh\00F4ng h\01A1\0323p l\00EA\0323')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144221590786752943)
,p_name=>'APEX.IG.INVALID_SORT_BY'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 \0111\0103\0323t tu\0300y cho\0323n S\0103\0301p x\00EA\0301p theo tha\0300nh %0, nh\01B0ng ch\01B0a cho\0323n c\00F4\0323t na\0300o cho %0.')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144218852244752942)
,p_name=>'APEX.IG.INVALID_VALUE'
,p_message_language=>'vi'
,p_message_text=>unistr('Gia\0301 tri\0323 kh\00F4ng h\01A1\0323p l\00EA\0323')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144213965332752940)
,p_name=>'APEX.IG.INVISIBLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng \0111\01B0\01A1\0323c hi\00EA\0309n thi\0323')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144173475535752928)
,p_name=>'APEX.IG.IN_THE_LAST'
,p_message_language=>'vi'
,p_message_text=>unistr('trong th\01A1\0300i gian qua')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144173600164752928)
,p_name=>'APEX.IG.IN_THE_NEXT'
,p_message_language=>'vi'
,p_message_text=>unistr('trong th\01A1\0300i gian t\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144172592441752928)
,p_name=>'APEX.IG.IS_NOT_NULL'
,p_message_language=>'vi'
,p_message_text=>unistr('kh\00F4ng tr\00F4\0301ng')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144172495260752928)
,p_name=>'APEX.IG.IS_NULL'
,p_message_language=>'vi'
,p_message_text=>unistr('bi\0323 tr\00F4\0301ng')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144222305994752943)
,p_name=>'APEX.IG.LABEL'
,p_message_language=>'vi'
,p_message_text=>unistr('Nha\0303n')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144214395917752941)
,p_name=>'APEX.IG.LABEL_COLUMN'
,p_message_language=>'vi'
,p_message_text=>unistr('Nha\0303n')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144218202453752942)
,p_name=>'APEX.IG.LAST'
,p_message_language=>'vi'
,p_message_text=>unistr('Cu\00F4\0301i cu\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144162746280752925)
,p_name=>'APEX.IG.LAST.DAY'
,p_message_language=>'vi'
,p_message_text=>unistr('Nga\0300y qua')
,p_is_js_message=>true
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144162981316752925)
,p_name=>'APEX.IG.LAST.HOUR'
,p_message_language=>'vi'
,p_message_text=>unistr('Gi\01A1\0300 qua')
,p_is_js_message=>true
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144163439519752925)
,p_name=>'APEX.IG.LAST.MINUTE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ph\00FAt qua')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144162466763752925)
,p_name=>'APEX.IG.LAST.MONTH'
,p_message_language=>'vi'
,p_message_text=>unistr('Tha\0301ng tr\01B0\01A1\0301c')
,p_is_js_message=>true
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144162555256752925)
,p_name=>'APEX.IG.LAST.WEEK'
,p_message_language=>'vi'
,p_message_text=>unistr('Tu\00E2\0300n tr\01B0\01A1\0301c')
,p_is_js_message=>true
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144162696264752925)
,p_name=>'APEX.IG.LAST.X_DAYS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 nga\0300y qua')
,p_is_js_message=>true
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144162838718752925)
,p_name=>'APEX.IG.LAST.X_HOURS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 gi\01A1\0300 qua')
,p_is_js_message=>true
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144163552605752925)
,p_name=>'APEX.IG.LAST.X_MINUTES'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 ph\00FAt qua')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144163319030752925)
,p_name=>'APEX.IG.LAST.X_MONTHS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 tha\0301ng qua')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144163219710752925)
,p_name=>'APEX.IG.LAST.X_WEEKS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 tu\00E2\0300n qua')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144162295884752925)
,p_name=>'APEX.IG.LAST.X_YEARS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 n\0103m qua')
,p_is_js_message=>true
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144162301368752925)
,p_name=>'APEX.IG.LAST.YEAR'
,p_message_language=>'vi'
,p_message_text=>unistr('N\0103m ngoa\0301i')
,p_is_js_message=>true
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144222539511752943)
,p_name=>'APEX.IG.LAYOUT_ALIGN'
,p_message_language=>'vi'
,p_message_text=>unistr('C\0103n chi\0309nh \00F4')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144222625427752943)
,p_name=>'APEX.IG.LAYOUT_USEGROUPFOR'
,p_message_language=>'vi'
,p_message_text=>unistr('S\1EED d\1EE5ng nho\0301m cho')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144173013578752928)
,p_name=>'APEX.IG.LESS_THAN'
,p_message_language=>'vi'
,p_message_text=>unistr('nho\0309 h\01A1n')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144173107421752928)
,p_name=>'APEX.IG.LESS_THAN_OR_EQUALS'
,p_message_language=>'vi'
,p_message_text=>unistr('nho\0309 h\01A1n ho\0103\0323c b\0103\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144216450938752941)
,p_name=>'APEX.IG.LINE'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\01B0\01A1\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144216507215752941)
,p_name=>'APEX.IG.LINE_WITH_AREA'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\01B0\01A1\0300ng co\0301 di\00EA\0323n ti\0301ch')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144222941258752943)
,p_name=>'APEX.IG.LISTAGG'
,p_message_language=>'vi'
,p_message_text=>'Listagg'
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144215106857752941)
,p_name=>'APEX.IG.LOW_COLUMN'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\00E2\0301p')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144225411611752944)
,p_name=>'APEX.IG.MAILADDRESSES_COMMASEP'
,p_message_language=>'vi'
,p_message_text=>unistr('Ph\00E2n ta\0301ch nhi\00EA\0300u \0111i\0323a chi\0309 b\0103\0300ng d\00E2\0301u ph\00E2\0309y')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144174262754752929)
,p_name=>'APEX.IG.MATCHES_REGULAR_EXPRESSION'
,p_message_language=>'vi'
,p_message_text=>unistr('kh\01A1\0301p v\01A1\0301i bi\00EA\0309u th\01B0\0301c chi\0301nh quy')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144198661034752936)
,p_name=>'APEX.IG.MAX'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00F4\0301i \0111a')
,p_is_js_message=>true
,p_version_scn=>2705863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144232927907752946)
,p_name=>'APEX.IG.MAX_OVERALL'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00F4\0301i \0111a chung')
,p_is_js_message=>true
,p_version_scn=>2705868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144198833208752936)
,p_name=>'APEX.IG.MEDIAN'
,p_message_language=>'vi'
,p_message_text=>unistr('Trung vi\0323')
,p_is_js_message=>true
,p_version_scn=>2705863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144233085476752946)
,p_name=>'APEX.IG.MEDIAN_OVERALL'
,p_message_language=>'vi'
,p_message_text=>unistr('Trung vi\0323 chung')
,p_is_js_message=>true
,p_version_scn=>2705868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144198570810752936)
,p_name=>'APEX.IG.MIN'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00F4\0301i thi\00EA\0309u')
,p_is_js_message=>true
,p_version_scn=>2705863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144174303361752929)
,p_name=>'APEX.IG.MINUTES'
,p_message_language=>'vi'
,p_message_text=>unistr('phu\0301t')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144199300438752936)
,p_name=>'APEX.IG.MINUTES_AGO'
,p_message_language=>'vi'
,p_message_text=>unistr('Phu\0301t tr\01B0\01A1\0301c')
,p_is_js_message=>true
,p_version_scn=>2705863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144232879784752946)
,p_name=>'APEX.IG.MIN_OVERALL'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00F4\0301i thi\00EA\0309u chung')
,p_is_js_message=>true
,p_version_scn=>2705868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144174722629752929)
,p_name=>'APEX.IG.MONTHS'
,p_message_language=>'vi'
,p_message_text=>unistr('tha\0301ng')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144181335557752931)
,p_name=>'APEX.IG.MORE_DATA_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('D\1EEF li\1EC7u ch\1EE9a h\01A1n %0 h\00E0ng, v\01B0\1EE3t qu\00E1 m\1EE9c t\1ED1i \0111a cho ph\00E9p. Ha\0303y \00E1p d\1EE5ng c\00E1c b\1ED9 l\1ECDc b\1ED5 sung \0111\1EC3 xem k\1EBFt qu\1EA3.')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144207107314752938)
,p_name=>'APEX.IG.MULTIIG_PAGE_REGION_STATIC_ID_REQUIRED'
,p_message_language=>'vi'
,p_message_text=>unistr('Pha\0309i chi\0309 \0111i\0323nh Ma\0303 ti\0303nh cu\0309a vu\0300ng vi\0300 trang ch\01B0\0301a nhi\00EA\0300u L\01B0\01A1\0301i t\01B0\01A1ng ta\0301c.')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144177423063752930)
,p_name=>'APEX.IG.NAME'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00EAn')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144177673711752930)
,p_name=>'APEX.IG.NAMED_REPORT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0301o ca\0301o \0111\01B0\1EE3c \0111\1EB7t t\00EAn')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144161683278752925)
,p_name=>'APEX.IG.NEXT.DAY'
,p_message_language=>'vi'
,p_message_text=>unistr('Nga\0300y t\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144161425258752925)
,p_name=>'APEX.IG.NEXT.HOUR'
,p_message_language=>'vi'
,p_message_text=>unistr('Gi\01A1\0300 t\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144163617968752925)
,p_name=>'APEX.IG.NEXT.MINUTE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ph\00FAt t\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144161941872752925)
,p_name=>'APEX.IG.NEXT.MONTH'
,p_message_language=>'vi'
,p_message_text=>unistr('Tha\0301ng sau')
,p_is_js_message=>true
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144161839901752925)
,p_name=>'APEX.IG.NEXT.WEEK'
,p_message_language=>'vi'
,p_message_text=>unistr('Tu\00E2\0300n sau')
,p_is_js_message=>true
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144161752485752925)
,p_name=>'APEX.IG.NEXT.X_DAYS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 ng\00E0y t\1EDBi')
,p_is_js_message=>true
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144161543060752925)
,p_name=>'APEX.IG.NEXT.X_HOURS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 gi\01A1\0300 t\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144163727608752925)
,p_name=>'APEX.IG.NEXT.X_MINUTES'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 ph\00FAt t\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144163083874752925)
,p_name=>'APEX.IG.NEXT.X_MONTHS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 tha\0301ng t\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144163140326752925)
,p_name=>'APEX.IG.NEXT.X_WEEKS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 tu\00E2\0300n t\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144162151840752925)
,p_name=>'APEX.IG.NEXT.X_YEARS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 n\0103m t\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144162006980752925)
,p_name=>'APEX.IG.NEXT.YEAR'
,p_message_language=>'vi'
,p_message_text=>unistr('N\0103m sau')
,p_is_js_message=>true
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144173384739752928)
,p_name=>'APEX.IG.NOT_BETWEEN'
,p_message_language=>'vi'
,p_message_text=>unistr('kh\00F4ng n\0103\0300m trong khoa\0309ng')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144172329372752928)
,p_name=>'APEX.IG.NOT_EQUALS'
,p_message_language=>'vi'
,p_message_text=>unistr('kh\00F4ng b\0103\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144237170565752947)
,p_name=>'APEX.IG.NOT_EXIST'
,p_message_language=>'vi'
,p_message_text=>unistr('Vu\0300ng co\0301 ma\0303 %0 kh\00F4ng pha\0309i la\0300 vu\0300ng L\01B0\01A1\0301i t\01B0\01A1ng ta\0301c ho\0103\0323c kh\00F4ng t\00F4\0300n ta\0323i trong \01B0\0301ng du\0323ng %1.')
,p_version_scn=>2705870
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144172720351752928)
,p_name=>'APEX.IG.NOT_IN'
,p_message_language=>'vi'
,p_message_text=>unistr('kh\00F4ng thu\00F4\0323c')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144173574340752928)
,p_name=>'APEX.IG.NOT_IN_THE_LAST'
,p_message_language=>'vi'
,p_message_text=>unistr('kh\00F4ng di\00EA\0303n ra trong th\01A1\0300i gian qua')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144173706013752928)
,p_name=>'APEX.IG.NOT_IN_THE_NEXT'
,p_message_language=>'vi'
,p_message_text=>unistr('kh\00F4ng di\00EA\0303n ra trong th\01A1\0300i gian t\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144181274905752931)
,p_name=>'APEX.IG.NO_DATA_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng ti\0300m th\00E2\0301y d\01B0\0303 li\00EA\0323u')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144218072855752942)
,p_name=>'APEX.IG.NULLS'
,p_message_language=>'vi'
,p_message_text=>unistr('Gia\0301 tri\0323 r\00F4\0303ng')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144223187503752943)
,p_name=>'APEX.IG.NUMBER'
,p_message_language=>'vi'
,p_message_text=>unistr('S\00F4\0301')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144218360955752942)
,p_name=>'APEX.IG.OFF'
,p_message_language=>'vi'
,p_message_text=>unistr('T\1EAFt')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144218409266752942)
,p_name=>'APEX.IG.ON'
,p_message_language=>'vi'
,p_message_text=>unistr('B\00E2\0323t')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144171573063752928)
,p_name=>'APEX.IG.ONE_MINUTE_AGO'
,p_message_language=>'vi'
,p_message_text=>unistr('1 phu\0301t tr\01B0\01A1\0301c')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144225969394752944)
,p_name=>'APEX.IG.OPEN_COLORPICKER'
,p_message_language=>'vi'
,p_message_text=>unistr('M\01A1\0309 b\00F4\0323 cho\0323n ma\0300u: %0')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144214817038752941)
,p_name=>'APEX.IG.OPEN_COLUMN'
,p_message_language=>'vi'
,p_message_text=>unistr('M\01A1\0309')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144178560908752930)
,p_name=>'APEX.IG.OPERATOR'
,p_message_language=>'vi'
,p_message_text=>unistr('Toa\0301n t\01B0\0309')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144214275371752941)
,p_name=>'APEX.IG.ORIENTATION'
,p_message_language=>'vi'
,p_message_text=>unistr('H\01B0\01A1\0301ng')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144216619708752941)
,p_name=>'APEX.IG.PIE'
,p_message_language=>'vi'
,p_message_text=>unistr('Hi\0300nh tro\0300n')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144179805474752930)
,p_name=>'APEX.IG.PIVOT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0309ng t\00F4\0309ng h\01A1\0323p')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144145053098752920)
,p_name=>'APEX.IG.PIVOT_VIEW'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\00EA\0301 \0111\00F4\0323 xem ba\0309ng t\00F4\0309ng h\01A1\0323p')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144225814487752944)
,p_name=>'APEX.IG.PLACEHOLDER_INVALUES'
,p_message_language=>'vi'
,p_message_text=>unistr('Ph\00E2n ta\0301ch ca\0301c gia\0301 tri\0323 b\0103\0300ng "%0"')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144216702719752941)
,p_name=>'APEX.IG.POLAR'
,p_message_language=>'vi'
,p_message_text=>unistr('C\01B0\0323c')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144222037312752943)
,p_name=>'APEX.IG.POSITION_CENTER'
,p_message_language=>'vi'
,p_message_text=>unistr('Gi\01B0\0303a')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144222191256752943)
,p_name=>'APEX.IG.POSITION_END'
,p_message_language=>'vi'
,p_message_text=>unistr('K\00EA\0301t thu\0301c')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144221916474752943)
,p_name=>'APEX.IG.POSITION_START'
,p_message_language=>'vi'
,p_message_text=>unistr('B\0103\0301t \0111\00E2\0300u')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144177796197752930)
,p_name=>'APEX.IG.PRIMARY'
,p_message_language=>'vi'
,p_message_text=>unistr('Chi\0301nh')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144178097843752930)
,p_name=>'APEX.IG.PRIMARY_DEFAULT'
,p_message_language=>'vi'
,p_message_text=>unistr('M\0103\0323c \0111i\0323nh chi\0301nh')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144194576980752935)
,p_name=>'APEX.IG.PRIMARY_REPORT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0301o ca\0301o chi\0301nh')
,p_is_js_message=>true
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144068140588752897)
,p_name=>'APEX.IG.PRINT_ACCESSIBLE.PROMPT'
,p_message_language=>'vi'
,p_message_text=>unistr('Bao g\1ED3m c\00E1c th\1EBB tr\1EE3 n\0103ng')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144065548651752896)
,p_name=>'APEX.IG.PRINT_ORIENTATION.LOV.HORIZONTAL.D'
,p_message_language=>'vi'
,p_message_text=>'Ngang'
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144065668513752896)
,p_name=>'APEX.IG.PRINT_ORIENTATION.LOV.VERTICAL.D'
,p_message_language=>'vi'
,p_message_text=>unistr('Do\0323c')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144065451289752896)
,p_name=>'APEX.IG.PRINT_ORIENTATION.PROMPT'
,p_message_language=>'vi'
,p_message_text=>unistr('H\01B0\1EDBng trang')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144065336388752896)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.A3.D'
,p_message_language=>'vi'
,p_message_text=>'A3'
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144065293469752896)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.A4.D'
,p_message_language=>'vi'
,p_message_text=>'A4'
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144068367365752897)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.CUSTOM.D'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00F9y ch\1EC9nh')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144065030902752896)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.LEGAL.D'
,p_message_language=>'vi'
,p_message_text=>unistr('Pha\0301p ly\0301')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144064942614752896)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.LETTER.D'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\01B0')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144065149915752896)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.TABLOID.D'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0301o kh\00F4\0309 nho\0309')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144064834308752896)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.PROMPT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ki\0301ch c\01A1\0303 trang')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144030457673752886)
,p_name=>'APEX.IG.PRINT_STRIP_RICH_TEXT.PROMPT'
,p_message_language=>'vi'
,p_message_text=>unistr('Loa\0323i bo\0309 v\0103n ba\0309n \0111a da\0323ng th\01B0\0301c')
,p_is_js_message=>true
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144216888807752941)
,p_name=>'APEX.IG.RADAR'
,p_message_language=>'vi'
,p_message_text=>'Radar'
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144216925400752941)
,p_name=>'APEX.IG.RANGE'
,p_message_language=>'vi'
,p_message_text=>unistr('Pha\0323m vi')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144227130455752944)
,p_name=>'APEX.IG.REFRESH'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00E0m m\1EDBi')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144182034897752931)
,p_name=>'APEX.IG.REFRESH_ROW'
,p_message_language=>'vi'
,p_message_text=>unistr('La\0300m m\01A1\0301i ha\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144180895615752931)
,p_name=>'APEX.IG.REFRESH_ROWS'
,p_message_language=>'vi'
,p_message_text=>unistr('La\0300m m\01A1\0301i ha\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144186056722752932)
,p_name=>'APEX.IG.REGION_NOT_EXIST'
,p_message_language=>'vi'
,p_message_text=>unistr('Vu\0300ng l\01B0\01A1\0301i t\01B0\01A1ng ta\0301c kh\00F4ng t\00F4\0300n ta\0323i trong \01B0\0301ng du\0323ng %0, trang %1 va\0300 vu\0300ng %2.')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144146500060752920)
,p_name=>'APEX.IG.REMOVE_CONTROL'
,p_message_language=>'vi'
,p_message_text=>unistr('Xo\0301a %0')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144177134365752929)
,p_name=>'APEX.IG.REPORT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0301o ca\0301o')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144236325163752947)
,p_name=>'APEX.IG.REPORT.DELETED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\00E3 x\00F3a b\00E1o c\00E1o')
,p_is_js_message=>true
,p_version_scn=>2705870
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144236002932752947)
,p_name=>'APEX.IG.REPORT.SAVED.ALTERNATIVE'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 l\01B0u ba\0301o ca\0301o thay th\00EA\0301 cho t\00E2\0301t ca\0309 ng\01B0\1EDDi d\00F9ng')
,p_is_js_message=>true
,p_version_scn=>2705869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144235995616752947)
,p_name=>'APEX.IG.REPORT.SAVED.DEFAULT'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 l\01B0u ba\0301o ca\0301o m\0103\0323c \0111i\0323nh cho t\00E2\0301t ca\0309 ng\01B0\1EDDi d\00F9ng')
,p_is_js_message=>true
,p_version_scn=>2705869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144236236124752947)
,p_name=>'APEX.IG.REPORT.SAVED.PRIVATE'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 l\01B0u ba\0301o ca\0301o ri\00EAng t\01B0')
,p_is_js_message=>true
,p_version_scn=>2705870
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144236154133752947)
,p_name=>'APEX.IG.REPORT.SAVED.PUBLIC'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 l\01B0u ba\0301o ca\0301o c\00F4ng khai cho t\00E2\0301t ca\0309 ng\01B0\1EDDi d\00F9ng')
,p_is_js_message=>true
,p_version_scn=>2705869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144186168748752932)
,p_name=>'APEX.IG.REPORT_ALIAS_DOES_NOT_EXIST'
,p_message_language=>'vi'
,p_message_text=>unistr('L\01B0\01A1\0301i t\01B0\01A1ng ta\0301c \0111a\0303 l\01B0u v\01A1\0301i t\00EAn %0 kh\00F4ng t\00F4\0300n ta\0323i.')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144171462409752928)
,p_name=>'APEX.IG.REPORT_DATA_AS_OF.X.MINUTES_AGO'
,p_message_language=>'vi'
,p_message_text=>unistr('D\01B0\0303 li\00EA\0323u l\01B0\01A1\0301i k\00EA\0309 t\01B0\0300 %0 phu\0301t tr\01B0\01A1\0301c')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144171332478752928)
,p_name=>'APEX.IG.REPORT_DATA_AS_OF_ONE_MINUTE_AGO'
,p_message_language=>'vi'
,p_message_text=>unistr('D\01B0\0303 li\00EA\0323u l\01B0\01A1\0301i k\00EA\0309 t\01B0\0300 1 phu\0301t tr\01B0\01A1\0301c')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144106803512752908)
,p_name=>'APEX.IG.REPORT_DOES_NOT_EXIST'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0301o ca\0301o l\01B0\01A1\0301i t\01B0\01A1ng ta\0301c kh\00F4ng t\00F4\0300n ta\0323i.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144229381316752945)
,p_name=>'APEX.IG.REPORT_EDIT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0301o ca\0301o - Chi\0309nh s\01B0\0309a')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144185936207752932)
,p_name=>'APEX.IG.REPORT_ID_DOES_NOT_EXIST'
,p_message_language=>'vi'
,p_message_text=>unistr('L\01B0\01A1\0301i t\01B0\01A1ng ta\0301c \0111a\0303 l\01B0u v\01A1\0301i ma\0303 %0 kh\00F4ng t\00F4\0300n ta\0323i.')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144229224893752945)
,p_name=>'APEX.IG.REPORT_SAVE_AS'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0301o ca\0301o - L\01B0u d\01B0\01A1\0301i da\0323ng')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144146633509752920)
,p_name=>'APEX.IG.REPORT_SETTINGS'
,p_message_language=>'vi'
,p_message_text=>unistr('Ca\0300i \0111\0103\0323t l\01B0\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144237207083752947)
,p_name=>'APEX.IG.REPORT_STATIC_ID_DOES_NOT_EXIST'
,p_message_language=>'vi'
,p_message_text=>unistr('L\01B0\01A1\0301i t\01B0\01A1ng ta\0301c \0111a\0303 l\01B0u v\01A1\0301i ma\0303 ti\0303nh %0 kh\00F4ng t\00F4\0300n ta\0323i.')
,p_version_scn=>2705870
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144232218464752946)
,p_name=>'APEX.IG.REPORT_VIEW'
,p_message_language=>'vi'
,p_message_text=>unistr('Xem ba\0301o ca\0301o')
,p_is_js_message=>true
,p_version_scn=>2705868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144145761128752920)
,p_name=>'APEX.IG.RESET'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\0103\0323t la\0323i')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144182122606752931)
,p_name=>'APEX.IG.REVERT_CHANGES'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4i phu\0323c thay \0111\00F4\0309i')
,p_is_js_message=>true
,p_version_scn=>2705858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144180984946752931)
,p_name=>'APEX.IG.REVERT_ROWS'
,p_message_language=>'vi'
,p_message_text=>unistr('Hoa\0300n nguy\00EAn ha\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144178104733752930)
,p_name=>'APEX.IG.ROW'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144177064348752929)
,p_name=>'APEX.IG.ROWS_PER_PAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0300ng m\00F4\0303i trang')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144236869233752947)
,p_name=>'APEX.IG.ROW_ACTIONS'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0300nh \0111\00F4\0323ng \0111\00F4\0301i v\01A1\0301i ha\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705870
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144238086761752948)
,p_name=>'APEX.IG.ROW_ACTIONS_FOR'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0300nh \0111\00F4\0323ng \0111\00F4\0301i v\01A1\0301i ha\0300ng %0')
,p_is_js_message=>true
,p_version_scn=>2705870
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144146063333752920)
,p_name=>'APEX.IG.SAVE'
,p_message_language=>'vi'
,p_message_text=>unistr('L\01B0u')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144191155024752934)
,p_name=>'APEX.IG.SAVED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0111\00E3 l\01B0u')
,p_is_js_message=>true
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144095720050752905)
,p_name=>'APEX.IG.SAVED_REPORT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0301o ca\0301o \0111a\0303 l\01B0u: %0')
,p_is_js_message=>true
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144144283536752920)
,p_name=>'APEX.IG.SAVED_REPORTS'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0301o ca\0301o \0111a\0303 l\01B0u')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144144397159752920)
,p_name=>'APEX.IG.SAVED_REPORT_DEFAULT'
,p_message_language=>'vi'
,p_message_text=>unistr('M\0103\0323c \0111i\0323nh')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144117884372752912)
,p_name=>'APEX.IG.SAVED_REPORT_EXISTS'
,p_message_language=>'vi'
,p_message_text=>unistr('M\00F4\0323t ba\0301o ca\0301o \0111\01B0\01A1\0323c l\01B0u co\0301 t\00EAn %0 \0111a\0303 t\00F4\0300n ta\0323i. Ha\0303y nh\00E2\0323p t\00EAn m\01A1\0301i.')
,p_version_scn=>2705848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144144405360752920)
,p_name=>'APEX.IG.SAVED_REPORT_PRIVATE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ri\00EAng t\01B0')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144144565555752920)
,p_name=>'APEX.IG.SAVED_REPORT_PUBLIC'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00F4ng khai')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144231952901752946)
,p_name=>'APEX.IG.SAVE_AS'
,p_message_language=>'vi'
,p_message_text=>unistr('L\01B0u d\01B0\01A1\0301i da\0323ng')
,p_is_js_message=>true
,p_version_scn=>2705868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144180247288752930)
,p_name=>'APEX.IG.SAVE_REPORT_SETTINGS'
,p_message_language=>'vi'
,p_message_text=>unistr('L\01B0u ca\0300i \0111\0103\0323t ba\0301o ca\0301o')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144217049681752941)
,p_name=>'APEX.IG.SCATTER'
,p_message_language=>'vi'
,p_message_text=>unistr('Ph\00E2n ta\0301n')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144144103827752920)
,p_name=>'APEX.IG.SEARCH'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00ECm ki\1EBFm')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144224294307752943)
,p_name=>'APEX.IG.SEARCH.ALL_COLUMNS'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\0300m ki\00EA\0301m: T\00E2\0301t ca\0309 ca\0301c c\00F4\0323t v\0103n ba\0309n')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144144097059752920)
,p_name=>'APEX.IG.SEARCH.COLUMN'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\0300m ki\00EA\0301m: %0')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144223552219752943)
,p_name=>'APEX.IG.SEARCH.ORACLE_TEXT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\0300m ki\00EA\0301m: V\0103n ba\0309n \0111\00E2\0300y \0111u\0309')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144171298830752928)
,p_name=>'APEX.IG.SEARCH_FOR.X'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\0300m ki\00EA\0301m ''%0''')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144213616884752940)
,p_name=>'APEX.IG.SELECT'
,p_message_language=>'vi'
,p_message_text=>unistr('- Cho\0323n -')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144153703075752922)
,p_name=>'APEX.IG.SELECTION'
,p_message_language=>'vi'
,p_message_text=>unistr('L\01B0\0323a cho\0323n')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144206861210752938)
,p_name=>'APEX.IG.SELECT_1_ROW_IN_MASTER'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho\0323n 1 ha\0300ng trong vu\0300ng chi\0301nh')
,p_is_js_message=>true
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144143929347752919)
,p_name=>'APEX.IG.SELECT_COLUMNS_TO_SEARCH'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho\0323n ca\0301c c\00F4\0323t c\00E2\0300n ti\0300m ki\00EA\0301m')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144236502476752947)
,p_name=>'APEX.IG.SEL_ACTIONS'
,p_message_language=>'vi'
,p_message_text=>unistr('H\00E0nh \0111\1ED9ng l\01B0\0323a ch\1ECDn')
,p_is_js_message=>true
,p_version_scn=>2705870
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144153993606752922)
,p_name=>'APEX.IG.SEL_MODE_CELL'
,p_message_language=>'vi'
,p_message_text=>unistr('L\01B0\0323a cho\0323n \00F4')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144153861676752922)
,p_name=>'APEX.IG.SEL_MODE_ROW'
,p_message_language=>'vi'
,p_message_text=>unistr('L\01B0\0323a cho\0323n ha\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144224859127752944)
,p_name=>'APEX.IG.SEND_AS_EMAIL'
,p_message_language=>'vi'
,p_message_text=>unistr('G\01B0\0309i d\01B0\01A1\0301i da\0323ng email')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144217402246752941)
,p_name=>'APEX.IG.SERIES_COLUMN'
,p_message_language=>'vi'
,p_message_text=>unistr('Chu\1ED7i')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144141601421752919)
,p_name=>'APEX.IG.SHOW'
,p_message_language=>'vi'
,p_message_text=>unistr('Hi\00EA\0309n thi\0323')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144196888575752935)
,p_name=>'APEX.IG.SHOW_OVERALL_VALUE'
,p_message_language=>'vi'
,p_message_text=>unistr('Hi\1EC3n th\1ECB gi\00E1 tr\1ECB t\1ED5ng th\1EC3')
,p_is_js_message=>true
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144181760875752931)
,p_name=>'APEX.IG.SINGLE_ROW_VIEW'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\00EA\0301 \0111\00F4\0323 xem m\00F4\0323t h\00E0ng')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144180038664752930)
,p_name=>'APEX.IG.SORT'
,p_message_language=>'vi'
,p_message_text=>unistr('S\0103\0301p x\00EA\0301p')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144217545024752942)
,p_name=>'APEX.IG.SORT_BY'
,p_message_language=>'vi'
,p_message_text=>unistr('S\0103\0301p x\00EA\0301p theo')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144236937443752947)
,p_name=>'APEX.IG.SORT_ONLY_ONE_PER_COLUMN'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0323n chi\0309 co\0301 th\00EA\0309 xa\0301c \0111i\0323nh m\00F4\0323t ki\00EA\0309u s\0103\0301p x\00EA\0301p cho m\00F4\0303i c\00F4\0323t.')
,p_is_js_message=>true
,p_version_scn=>2705870
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144236702264752947)
,p_name=>'APEX.IG.SRV_CHANGE_MENU'
,p_message_language=>'vi'
,p_message_text=>unistr('Thay \0111\00F4\0309i')
,p_is_js_message=>true
,p_version_scn=>2705870
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144218552771752942)
,p_name=>'APEX.IG.STACK'
,p_message_language=>'vi'
,p_message_text=>unistr('Ng\0103n x\00EA\0301p')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144174083336752929)
,p_name=>'APEX.IG.STARTS_WITH'
,p_message_language=>'vi'
,p_message_text=>unistr('b\0103\0301t \0111\00E2\0300u b\0103\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144217162085752941)
,p_name=>'APEX.IG.STOCK'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00F4\0309 phi\00EA\0301u')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144136402620752917)
,p_name=>'APEX.IG.STRETCH_COLUMNS'
,p_message_language=>'vi'
,p_message_text=>unistr('K\00E9o d\00E3n chi\1EC1u r\1ED9ng c\1ED9t')
,p_is_js_message=>true
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144180434038752930)
,p_name=>'APEX.IG.SUBSCRIPTION'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\0103ng ky\0301')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144198489385752936)
,p_name=>'APEX.IG.SUM'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00F4\0309ng')
,p_is_js_message=>true
,p_version_scn=>2705863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144238217878752948)
,p_name=>'APEX.IG.SUMMARY'
,p_message_language=>'vi'
,p_message_text=>unistr('L\01B0\01A1\0301i t\01B0\01A1ng ta\0301c. Ba\0301o ca\0301o: %0, Xem: %1.')
,p_is_js_message=>true
,p_version_scn=>2705870
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144232342801752946)
,p_name=>'APEX.IG.SUM_OVERALL'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00F4\0309ng chung')
,p_is_js_message=>true
,p_version_scn=>2705868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144215343053752941)
,p_name=>'APEX.IG.TARGET_COLUMN'
,p_message_language=>'vi'
,p_message_text=>unistr('Mu\0323c ti\00EAu')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144221777835752943)
,p_name=>'APEX.IG.TEXT_COLOR'
,p_message_language=>'vi'
,p_message_text=>unistr('Ma\0300u v\0103n ba\0309n')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144146747312752920)
,p_name=>'APEX.IG.TOGGLE'
,p_message_language=>'vi'
,p_message_text=>unistr('B\00E2\0323t/t\0103\0301t')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144028845737752885)
,p_name=>'APEX.IG.TOOLBAR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\01B0\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144196732253752935)
,p_name=>'APEX.IG.TOOLTIP'
,p_message_language=>'vi'
,p_message_text=>unistr('Chu\0301 gia\0309i c\00F4ng cu\0323')
,p_is_js_message=>true
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144177210198752929)
,p_name=>'APEX.IG.TYPE'
,p_message_language=>'vi'
,p_message_text=>unistr('Loa\0323i')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144181608664752931)
,p_name=>'APEX.IG.UNFREEZE'
,p_message_language=>'vi'
,p_message_text=>unistr('Bo\0309 \0111o\0301ng b\0103ng')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144178787990752930)
,p_name=>'APEX.IG.UNIT'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\01A1n vi\0323')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144224629304752944)
,p_name=>'APEX.IG.UNSAVED_CHANGES_CONTINUE_CONFIRM'
,p_message_language=>'vi'
,p_message_text=>unistr('Co\0301 nh\01B0\0303ng thay \0111\00F4\0309i ch\01B0a \0111\01B0\01A1\0323c l\01B0u. Ba\0323n co\0301 mu\00F4\0301n ti\00EA\0301p tu\0323c kh\00F4ng?')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144178649032752930)
,p_name=>'APEX.IG.VALUE'
,p_message_language=>'vi'
,p_message_text=>unistr('Gia\0301 tri\0323')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144214471508752941)
,p_name=>'APEX.IG.VALUE_COLUMN'
,p_message_language=>'vi'
,p_message_text=>unistr('Gia\0301 tri\0323')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144219390748752942)
,p_name=>'APEX.IG.VALUE_REQUIRED'
,p_message_language=>'vi'
,p_message_text=>unistr('B\0103\0301t bu\00F4\0323c co\0301 m\00F4\0323t gia\0301 tri\0323.')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144204594520752938)
,p_name=>'APEX.IG.VALUE_TIMESTAMP_TZ'
,p_message_language=>'vi'
,p_message_text=>unistr('Gia\0301 tri\0323 (kh\00F4ng th\00EA\0309 thay \0111\00F4\0309i mu\0301i gi\01A1\0300)')
,p_is_js_message=>true
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144223236522752943)
,p_name=>'APEX.IG.VARCHAR2'
,p_message_language=>'vi'
,p_message_text=>unistr('V\0103n ba\0309n')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144215765136752941)
,p_name=>'APEX.IG.VERTICAL'
,p_message_language=>'vi'
,p_message_text=>unistr('Do\0323c')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144176700485752929)
,p_name=>'APEX.IG.VIEW'
,p_message_language=>'vi'
,p_message_text=>'Xem'
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144111869085752910)
,p_name=>'APEX.IG.VIEW_MODE_DESCRIPTION'
,p_message_language=>'vi'
,p_message_text=>unistr('L\01B0\01A1\0301i \01A1\0309 ch\00EA\0301 \0111\00F4\0323 xem, ha\0303y nh\00E2\0301n \0111\00EA\0309 chi\0309nh s\01B0\0309a')
,p_is_js_message=>true
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144213719188752940)
,p_name=>'APEX.IG.VISIBLE'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 hi\00EA\0309n thi\0323')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144215249642752941)
,p_name=>'APEX.IG.VOLUME_COLUMN'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4\0301i l\01B0\01A1\0323ng')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144174648377752929)
,p_name=>'APEX.IG.WEEKS'
,p_message_language=>'vi'
,p_message_text=>unistr('tu\00E2\0300n')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144213876129752940)
,p_name=>'APEX.IG.WIDTH'
,p_message_language=>'vi'
,p_message_text=>unistr('Chi\00EA\0300u r\00F4\0323ng c\00F4\0323t t\00F4\0301i thi\00EA\0309u (pixel)')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144165863776752926)
,p_name=>'APEX.IG.X.BETWEEN.Y.AND.Z'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 trong khoa\0309ng t\01B0\0300 %1 \0111\00EA\0301n %2')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144165553439752926)
,p_name=>'APEX.IG.X.CONTAINS.Y'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 ch\1EE9a %1')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144165627483752926)
,p_name=>'APEX.IG.X.DOES_NOT_CONTAIN.Y'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng ch\01B0\0301a %1')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144141086323752919)
,p_name=>'APEX.IG.X.DOES_NOT_START_WITH.Y'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng b\0103\0301t \0111\00E2\0300u b\0103\0300ng %1')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144164355478752926)
,p_name=>'APEX.IG.X.EQUALS.Y'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 b\0103\0300ng %1')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144164580841752926)
,p_name=>'APEX.IG.X.GREATER_THAN.Y'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 l\01A1\0301n h\01A1n %1')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144164609644752926)
,p_name=>'APEX.IG.X.GREATER_THAN_OR_EQUALS.Y'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 l\01A1\0301n h\01A1n ho\0103\0323c b\0103\0300ng %1')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144165373417752926)
,p_name=>'APEX.IG.X.IN.Y'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 n\0103\0300m trong %1')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144166514014752926)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.DAYS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 trong %1 nga\0300y qua')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144166396141752926)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.HOURS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 trong %1 gi\01A1\0300 qua')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144166133888752926)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.MINUTES'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 trong %1 phu\0301t qua')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144166991948752926)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.MONTHS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 trong %1 tha\0301ng qua')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144166728643752926)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.WEEKS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 trong %1 tu\00E2\0300n qua')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144167139853752926)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.YEARS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 trong %1 n\0103m qua')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144166490724752926)
,p_name=>'APEX.IG.X.IN_THE_LAST_DAY'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 trong nga\0300y qua')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144166239451752926)
,p_name=>'APEX.IG.X.IN_THE_LAST_HOUR'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 trong gi\01A1\0300 qua')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144166075235752926)
,p_name=>'APEX.IG.X.IN_THE_LAST_MINUTE'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 trong phu\0301t qua')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144166876507752926)
,p_name=>'APEX.IG.X.IN_THE_LAST_MONTH'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 trong tha\0301ng qua')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144166686905752926)
,p_name=>'APEX.IG.X.IN_THE_LAST_WEEK'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 trong tu\00E2\0300n qua')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144167066293752926)
,p_name=>'APEX.IG.X.IN_THE_LAST_YEAR'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 trong n\0103m qua')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144168929883752927)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.DAYS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 trong %1 nga\0300y t\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144168755022752927)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.HOURS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 trong %1 gi\01A1\0300 t\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144168574309752927)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.MINUTES'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 trong %1 phu\0301t t\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144169354597752927)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.MONTHS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 trong %1 tha\0301ng t\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144169152968752927)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.WEEKS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 trong %1 tu\00E2\0300n t\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144169551230752927)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.YEARS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 trong %1 n\0103m t\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144168845279752927)
,p_name=>'APEX.IG.X.IN_THE_NEXT_DAY'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 trong nga\0300y t\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144168640934752927)
,p_name=>'APEX.IG.X.IN_THE_NEXT_HOUR'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 trong gi\01A1\0300 t\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144168415168752927)
,p_name=>'APEX.IG.X.IN_THE_NEXT_MINUTE'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 trong phu\0301t t\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144169299841752927)
,p_name=>'APEX.IG.X.IN_THE_NEXT_MONTH'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 trong tha\0301ng t\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144169015942752927)
,p_name=>'APEX.IG.X.IN_THE_NEXT_WEEK'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 trong tu\00E2\0300n t\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144169464616752927)
,p_name=>'APEX.IG.X.IN_THE_NEXT_YEAR'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 trong n\0103m t\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144165019202752926)
,p_name=>'APEX.IG.X.IS_NOT_NULL'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng tr\00F4\0301ng')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144164925494752926)
,p_name=>'APEX.IG.X.IS_NULL'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 bi\0323 tr\00F4\0301ng')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144164707061752926)
,p_name=>'APEX.IG.X.LESS_THAN.Y'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 nho\0309 h\01A1n %1')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144164803099752926)
,p_name=>'APEX.IG.X.LESS_THAN_OR_EQUALS.Y'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 nho\0309 h\01A1n ho\0103\0323c b\0103\0300ng %1')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144165180893752926)
,p_name=>'APEX.IG.X.LIKE.Y'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 gi\00F4\0301ng %1')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144165798217752926)
,p_name=>'APEX.IG.X.MATCHES_REGULAR_EXPRESSION.Y'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\01A1\0301p v\01A1\0301i bi\00EA\0309u th\01B0\0301c chi\0301nh quy %1')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144171633502752928)
,p_name=>'APEX.IG.X.MINUTES_AGO'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 phu\0301t tr\01B0\01A1\0301c')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144165969592752926)
,p_name=>'APEX.IG.X.NOT_BETWEEN.Y.AND.Z'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng n\0103\0300m trong khoa\0309ng t\01B0\0300 %1 \0111\00EA\0301n %2')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144164472545752926)
,p_name=>'APEX.IG.X.NOT_EQUALS.Y'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng b\0103\0300ng %1')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144165452779752926)
,p_name=>'APEX.IG.X.NOT_IN.Y'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng n\0103\0300m trong %1')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144167759038752927)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.DAYS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng di\00EA\0303n ra trong %1 nga\0300y qua')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144167589528752927)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.HOURS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng di\00EA\0303n ra trong %1 gi\01A1\0300 qua')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144167341879752927)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.MINUTES'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng di\00EA\0303n ra trong %1 phu\0301t qua')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144168163698752927)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.MONTHS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng di\00EA\0303n ra trong %1 tha\0301ng qua')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144167959979752927)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.WEEKS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng di\00EA\0303n ra trong %1 tu\00E2\0300n qua')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144168362980752927)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.YEARS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng di\00EA\0303n ra trong %1 n\0103m qua')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144167686039752927)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_DAY'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng di\00EA\0303n ra trong nga\0300y qua')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144167486953752927)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_HOUR'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng di\00EA\0303n ra trong gi\01A1\0300 qua')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144167205950752927)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_MINUTE'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng di\00EA\0303n ra trong phu\0301t qua')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144168093023752927)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_MONTH'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng di\00EA\0303n ra trong tha\0301ng qua')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144167869841752927)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_WEEK'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng di\00EA\0303n ra trong tu\00E2\0300n qua')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144168243632752927)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_YEAR'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng di\00EA\0303n ra trong n\0103m qua')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144170105591752927)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.DAYS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng di\00EA\0303n ra trong %1 nga\0300y t\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144169991760752927)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.HOURS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng di\00EA\0303n ra trong %1 gi\01A1\0300 t\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144169742721752927)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.MINUTES'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng di\00EA\0303n ra trong %1 phu\0301t t\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144170585057752927)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.MONTHS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng di\00EA\0303n ra trong %1 tha\0301ng t\01A1\0301i ')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144170342814752927)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.WEEKS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng di\00EA\0303n ra trong %1 tu\00E2\0300n t\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144170780494752928)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.YEARS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng di\00EA\0303n ra trong %1 n\0103m t\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144170014133752927)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_DAY'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng di\00EA\0303n ra trong nga\0300y t\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144169802735752927)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_HOUR'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng di\00EA\0303n ra trong gi\01A1\0300 t\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144169680027752927)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_MINUTE'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng di\00EA\0303n ra trong phu\0301t t\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144170415892752927)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_MONTH'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng di\00EA\0303n ra trong tha\0301ng t\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144170220121752927)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_WEEK'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng di\00EA\0303n ra trong tu\00E2\0300n t\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144170635976752928)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_YEAR'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng di\00EA\0303n ra trong n\0103m t\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144165217781752926)
,p_name=>'APEX.IG.X.NOT_LIKE.Y'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng gi\00F4\0301ng %1')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144172109908752928)
,p_name=>'APEX.IG.X.STARTS_WITH.Y'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 b\0103\0301t \0111\00E2\0300u b\0103\0300ng %1')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144214546174752941)
,p_name=>'APEX.IG.X_COLUMN'
,p_message_language=>'vi'
,p_message_text=>'X'
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144174817637752929)
,p_name=>'APEX.IG.YEARS'
,p_message_language=>'vi'
,p_message_text=>unistr('n\0103m')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144214689922752941)
,p_name=>'APEX.IG.Y_COLUMN'
,p_message_language=>'vi'
,p_message_text=>'Y'
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144214720131752941)
,p_name=>'APEX.IG.Z_COLUMN'
,p_message_language=>'vi'
,p_message_text=>'Z'
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144223705869752943)
,p_name=>'APEX.IG_FORMAT_SAMPLE_1'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\01B0\0301 Hai, nga\0300y 12 tha\0301ng 1 n\0103m 2016')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144223882542752943)
,p_name=>'APEX.IG_FORMAT_SAMPLE_2'
,p_message_language=>'vi'
,p_message_text=>unistr('Tha\0301ng 1')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144223951521752943)
,p_name=>'APEX.IG_FORMAT_SAMPLE_3'
,p_message_language=>'vi'
,p_message_text=>unistr('16 gi\01A1\0300 tr\01B0\01A1\0301c')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144224035686752943)
,p_name=>'APEX.IG_FORMAT_SAMPLE_4'
,p_message_language=>'vi'
,p_message_text=>unistr('trong 16 gi\1EDD')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144042038640752889)
,p_name=>'APEX.ITEM.CROPPER.APPLY'
,p_message_language=>'vi'
,p_message_text=>unistr('\00C1p du\0323ng')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144034090435752887)
,p_name=>'APEX.ITEM.CROPPER.HELP.TEXT'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>K\00E9o h\00ECnh \1EA3nh c\1EE7a b\1EA1n v\00E0 s\1EED d\1EE5ng thanh tr\01B0\1EE3t thu ph\00F3ng \0111\1EC3 \0111\0103\0323t la\0323i v\1ECB tri\0301 h\00ECnh \1EA3nh \0111\00F3 trong khung.</p>'),
'',
unistr('<p>Khi t\1EADp trung v\00E0o tr\00ECnh c\1EAFt hi\0300nh \1EA3nh, ba\0323n co\0301 th\00EA\0309 s\01B0\0309 du\0323ng c\00E1c ph\00EDm t\0103\0301t sau \0111\00E2y:</p>'),
'<ul>',
unistr('     <li>M\0169i t\00EAn tr\00E1i: Di chuy\1EC3n h\00ECnh \1EA3nh sang tr\00E1i*</li>'),
unistr('     <li>M\0169i t\00EAn l\00EAn: Di chuy\1EC3n h\00ECnh \1EA3nh l\00EAn tr\00EAn*</li>'),
unistr('     <li>M\0169i t\00EAn ph\1EA3i: Di chuy\1EC3n h\00ECnh \1EA3nh sang ph\1EA3i*</li>'),
unistr('     <li>M\0169i t\00EAn xu\1ED1ng: Di chuy\1EC3n h\00ECnh \1EA3nh xu\1ED1ng d\01B0\01A1\0301i*</li>'),
unistr('     <li>I: Ph\00F3ng to</li>'),
unistr('     <li>O: Thu nh\1ECF</li>'),
unistr('     <li>L: Xoay tr\00E1i</li>'),
unistr('     <li>R: Xoay ph\1EA3i</li>'),
'</ul>',
'',
unistr('<p class="margin-top-md"><em>*Gi\1EEF phi\0301m Shift \0111\1EC3 di chuy\1EC3n nhanh h\01A1n</em></p>')))
,p_is_js_message=>true
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144034259786752887)
,p_name=>'APEX.ITEM.CROPPER.HELP.TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\01A1\0323 giu\0301p c\0103\0301t hi\0300nh a\0309nh')
,p_is_js_message=>true
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144042186248752889)
,p_name=>'APEX.ITEM.CROPPER.RESET'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\0103\0323t la\0323i')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144034513388752887)
,p_name=>'APEX.ITEM.CROPPER.TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('C\0103\0301t hi\0300nh a\0309nh')
,p_is_js_message=>true
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144042298755752889)
,p_name=>'APEX.ITEM.CROPPER.ZOOM_SLIDER_LABEL'
,p_message_language=>'vi'
,p_message_text=>unistr('Di chuy\1EC3n thanh tr\01B0\1EE3t \0111\1EC3 \0111i\1EC1u ch\1EC9nh m\1EE9c thu ph\00F3ng')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144071885089752898)
,p_name=>'APEX.ITEM.FILE.ACCEPTED_TYPES'
,p_message_language=>'vi'
,p_message_text=>unistr('Loa\0323i t\00E2\0323p tin kh\00F4ng h\01A1\0323p l\00EA\0323. Ca\0301c loa\0323i t\00E2\0323p tin \0111\01B0\01A1\0323c h\00F4\0303 tr\01A1\0323 %0.')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144206298811752938)
,p_name=>'APEX.ITEM.FILE.BROWSE'
,p_message_language=>'vi'
,p_message_text=>unistr('Duy\00EA\0323t')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144205973167752938)
,p_name=>'APEX.ITEM.FILE.CHOOSE_FILE'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho\0323n t\00E2\0323p tin')
,p_is_js_message=>true
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144206000105752938)
,p_name=>'APEX.ITEM.FILE.CHOOSE_FILES'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho\0323n t\00E2\0323p tin')
,p_is_js_message=>true
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144071687190752898)
,p_name=>'APEX.ITEM.FILE.DROP_FILE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ke\0301o va\0300 tha\0309')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144072063235752898)
,p_name=>'APEX.ITEM.FILE.DROP_FILES'
,p_message_language=>'vi'
,p_message_text=>unistr('Ke\0301o va\0300 tha\0309 ca\0301c t\00E2\0323p tin')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144073487276752898)
,p_name=>'APEX.ITEM.FILE.DROP_OR_CHOOSE_FILE'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho\0323n t\00E2\0323p tin ho\0103\0323c tha\0309 m\00F4\0323t t\00E2\0323p tin va\0300o \0111\00E2y.')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144073599687752898)
,p_name=>'APEX.ITEM.FILE.DROP_OR_CHOOSE_FILES'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho\0323n ho\0103\0323c tha\0309 ca\0301c t\00E2\0323p tin va\0300o \0111\00E2y.')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144073656367752899)
,p_name=>'APEX.ITEM.FILE.DROP_OR_SELECT_FILE'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho\0323n t\00E2\0323p tin ho\0103\0323c tha\0309 m\00F4\0323t t\00E2\0323p tin va\0300o \0111\00E2y.')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144073737183752899)
,p_name=>'APEX.ITEM.FILE.DROP_OR_SELECT_FILES'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho\0323n ho\0103\0323c tha\0309 ca\0301c t\00E2\0323p tin va\0300o \0111\00E2y.')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144071907051752898)
,p_name=>'APEX.ITEM.FILE.FILES_WITH_COUNT'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 t\00E2\0323p tin')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144071724406752898)
,p_name=>'APEX.ITEM.FILE.MAX_FILE_SIZE'
,p_message_language=>'vi'
,p_message_text=>unistr('T\1EADp tin qu\00E1 l\1EDBn. K\00EDch c\01A1\0303 t\00E2\0323p tin t\1ED1i \0111a l\00E0 %0.')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144052227130752892)
,p_name=>'APEX.ITEM.FILE.MULTIPLE_FILES_NOT_SUPPORTED'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng h\00F4\0303 tr\01A1\0323 ta\0309i l\00EAn nhi\00EA\0300u t\00E2\0323p tin.')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144035123705752887)
,p_name=>'APEX.ITEM.FILE.REMOVE'
,p_message_language=>'vi'
,p_message_text=>unistr('Xo\0301a')
,p_version_scn=>2705837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144040656686752889)
,p_name=>'APEX.ITEM.GEOCODE.ADDRESS_REQUIRED'
,p_message_language=>'vi'
,p_message_text=>unistr('B\0103\0301t bu\00F4\0323c co\0301 \0111i\0323a chi\0309.')
,p_is_js_message=>true
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144039571692752888)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_CITY'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\00E0nh ph\1ED1')
,p_is_js_message=>true
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144039905730752889)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_COUNTRY'
,p_message_language=>'vi'
,p_message_text=>unistr('Ma\0303 qu\00F4\0301c gia')
,p_is_js_message=>true
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144039604508752888)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_HOUSENUMBER'
,p_message_language=>'vi'
,p_message_text=>unistr('S\1ED1 nh\00E0')
,p_is_js_message=>true
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144040553254752889)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_LATITUDE'
,p_message_language=>'vi'
,p_message_text=>unistr('V\0129 \0111\1ED9')
,p_is_js_message=>true
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144040420266752889)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_LONGITUDE'
,p_message_language=>'vi'
,p_message_text=>unistr('Kinh \0111\1ED9')
,p_is_js_message=>true
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144040339440752889)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_MAPLINK'
,p_message_language=>'vi'
,p_message_text=>unistr('Hi\00EA\0309n thi\0323 tr\00EAn ba\0309n \0111\00F4\0300')
,p_is_js_message=>true
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144040000322752889)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_MATCHSCORE'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110i\00EA\0309m')
,p_is_js_message=>true
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144039758788752888)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_POSTALCODE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ma\0303 b\01B0u chi\0301nh')
,p_is_js_message=>true
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144039827245752888)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_STATE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\00EA\0309u bang')
,p_is_js_message=>true
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144039483332752888)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_STREET'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\01B0\01A1\0300ng')
,p_is_js_message=>true
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144039398400752888)
,p_name=>'APEX.ITEM.GEOCODE.DIALOG_TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('K\1EBFt qu\1EA3 m\00E3 h\00F3a \0111\1ECBa l\00FD')
,p_is_js_message=>true
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144070858726752898)
,p_name=>'APEX.ITEM.GEOCODE.GEOCODING_DONE'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\01B0\01A1\0323c m\00E3 h\00F3a \0111\1ECBa l\00FD')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144070941191752898)
,p_name=>'APEX.ITEM.GEOCODE.GEOCODING_OPEN'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng \0111\01B0\01A1\0323c m\00E3 h\00F3a \0111\1ECBa l\00FD')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144040253419752889)
,p_name=>'APEX.ITEM.GEOCODE.MAP_DIALOG_TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0309n \0111\00F4\0300')
,p_is_js_message=>true
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144040173221752889)
,p_name=>'APEX.ITEM.GEOCODE.NO_DATA_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng ti\0300m th\00E2\0301y \0111i\0323a chi\0309.')
,p_is_js_message=>true
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144040734841752889)
,p_name=>'APEX.ITEM.GEOCODE.REQUIRED'
,p_message_language=>'vi'
,p_message_text=>unistr('B\0103\0301t bu\00F4\0323c co\0301 %0.')
,p_is_js_message=>true
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144146981323752920)
,p_name=>'APEX.ITEM.GEOCODE.REQUIRED_MULTIPLE'
,p_message_language=>'vi'
,p_message_text=>unistr('B\0103\0301t bu\00F4\0323c co\0301 %0 ho\0103\0323c %1.')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144236422967752947)
,p_name=>'APEX.ITEM.HELP_TEXT'
,p_message_language=>'vi'
,p_message_text=>unistr('Xem v\0103n ba\0309n tr\01A1\0323 giu\0301p cho %0.')
,p_is_js_message=>true
,p_version_scn=>2705870
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144042431339752889)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.CHOOSE_FILE'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho\0323n hi\0300nh a\0309nh')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144042598462752889)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.CHOOSE_FILES'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho\0323n hi\0300nh a\0309nh')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144042300424752889)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DOWNLOAD_LINK_TEXT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ta\0309i xu\00F4\0301ng')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144042675071752889)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_FILE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ke\0301o va\0300 tha\0309')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144042755397752889)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_FILES'
,p_message_language=>'vi'
,p_message_text=>unistr('Ke\0301o va\0300 tha\0309 hi\0300nh a\0309nh')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144042895160752889)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_CHOOSE_FILE'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho\0323n hi\0300nh a\0309nh ho\0103\0323c tha\0309 m\00F4\0323t hi\0300nh a\0309nh va\0300o \0111\00E2y.')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144042962461752889)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_CHOOSE_FILES'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho\0323n ho\0103\0323c tha\0309 ca\0301c hi\0300nh a\0309nh va\0300o \0111\00E2y.')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144043041990752889)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_SELECT_FILE'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho\0323n hi\0300nh a\0309nh ho\0103\0323c tha\0309 m\00F4\0323t hi\0300nh a\0309nh va\0300o \0111\00E2y.')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144043126696752889)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_SELECT_FILES'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho\0323n ho\0103\0323c tha\0309 ca\0301c hi\0300nh a\0309nh va\0300o \0111\00E2y.')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144127861436752915)
,p_name=>'APEX.ITEM_TYPE.CHECKBOX.CHECKED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 cho\0323n')
,p_is_js_message=>true
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144127911166752915)
,p_name=>'APEX.ITEM_TYPE.CHECKBOX.UNCHECKED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 bo\0309 cho\0323n')
,p_is_js_message=>true
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144155427583752923)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.EMPTY_READONLY_COMBOBOX'
,p_message_language=>'vi'
,p_message_text=>unistr('H\00F4\0323p t\00F4\0309 h\01A1\0323p chi\0309 \0111o\0323c bi\0323 tr\00F4\0301ng')
,p_version_scn=>2705852
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144153227069752922)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.EMPTY_READONLY_LISTBOX'
,p_message_language=>'vi'
,p_message_text=>unistr('H\00F4\0323p danh sa\0301ch chi\0309 \0111o\0323c bi\0323 tr\00F4\0301ng')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144153077343752922)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.READONLY_COMBOBOX'
,p_message_language=>'vi'
,p_message_text=>unistr('H\00F4\0323p t\00F4\0309 h\01A1\0323p chi\0309 \0111o\0323c')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144153162157752922)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.READONLY_LISTBOX'
,p_message_language=>'vi'
,p_message_text=>unistr('H\00F4\0323p danh sa\0301ch chi\0309 \0111o\0323c')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144068896100752897)
,p_name=>'APEX.ITEM_TYPE.SLIDER.VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'vi'
,p_message_text=>unistr('#LABEL# kh\00F4ng thu\00F4\0323c ph\1EA1m vi h\1EE3p l\1EC7 t\1EEB %0 \0111\1EBFn %1.')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144068907336752897)
,p_name=>'APEX.ITEM_TYPE.SLIDER.VALUE_NOT_MULTIPLE_OF_STEP'
,p_message_language=>'vi'
,p_message_text=>unistr('#LABEL# kh\00F4ng ph\1EA3i l\00E0 b\1ED9i s\1ED1 c\1EE7a %0.')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144156242904752923)
,p_name=>'APEX.ITEM_TYPE.SWITCH.READONLY_SWITCH'
,p_message_language=>'vi'
,p_message_text=>unistr('Chuy\00EA\0309n \0111\00F4\0309i ch\00EA\0301 \0111\00F4\0323 chi\0309 \0111o\0323c')
,p_version_scn=>2705854
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144096873491752905)
,p_name=>'APEX.ITEM_TYPE.TEXT.READONLY_WITH_LINK'
,p_message_language=>'vi'
,p_message_text=>unistr('Mu\0323c kh\00F4ng th\00EA\0309 chi\0309nh s\01B0\0309a co\0301 li\00EAn k\00EA\0301t')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144068484456752897)
,p_name=>'APEX.ITEM_TYPE.YES_NO.INVALID_VALUE'
,p_message_language=>'vi'
,p_message_text=>unistr('#LABEL# pha\0309i kh\01A1\0301p v\01A1\0301i ca\0301c gia\0301 tri\0323 %0 va\0300 %1.')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144068695280752897)
,p_name=>'APEX.ITEM_TYPE.YES_NO.NO_LABEL'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144154900543752923)
,p_name=>'APEX.ITEM_TYPE.YES_NO.OFF_LABEL'
,p_message_language=>'vi'
,p_message_text=>unistr('T\1EAFt')
,p_version_scn=>2705852
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144155028243752923)
,p_name=>'APEX.ITEM_TYPE.YES_NO.ON_LABEL'
,p_message_language=>'vi'
,p_message_text=>unistr('B\00E2\0323t')
,p_version_scn=>2705852
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144068502012752897)
,p_name=>'APEX.ITEM_TYPE.YES_NO.YES_LABEL'
,p_message_language=>'vi'
,p_message_text=>unistr('Co\0301')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144076486209752899)
,p_name=>'APEX.LANGUAGE_SELECTOR'
,p_message_language=>'vi'
,p_message_text=>unistr('B\00F4\0323 cho\0323n ng\00F4n ng\01B0\0303')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144012891589752880)
,p_name=>'APEX.LIST_MANAGER.ADD_ENTRY'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\00EAm mu\0323c nh\00E2\0323p')
,p_version_scn=>2705833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144189639150752933)
,p_name=>'APEX.LIST_MANAGER.BUTTON_ADD'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\00EAm')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144189777643752933)
,p_name=>'APEX.LIST_MANAGER.BUTTON_REMOVE'
,p_message_language=>'vi'
,p_message_text=>unistr('Xo\0301a')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144012973855752881)
,p_name=>'APEX.LIST_MANAGER.SELECTED_ENTRY'
,p_message_language=>'vi'
,p_message_text=>unistr('Mu\0323c nh\00E2\0323p \0111a\0303 cho\0323n')
,p_version_scn=>2705833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144193446755752934)
,p_name=>'APEX.LTO.ADVANCED'
,p_message_language=>'vi'
,p_message_text=>unistr('N\00E2ng cao')
,p_version_scn=>2705861
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144193721336752934)
,p_name=>'APEX.LTO.CANCEL'
,p_message_language=>'vi'
,p_message_text=>unistr('Hu\0309y')
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144193517055752934)
,p_name=>'APEX.LTO.COMMON'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\00F4ng th\01B0\01A1\0300ng')
,p_version_scn=>2705861
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144193828802752934)
,p_name=>'APEX.LTO.LIVE_TEMPLATE_OPTIONS'
,p_message_language=>'vi'
,p_message_text=>unistr('Tu\0300y cho\0323n m\00E2\0303u tr\01B0\0323c ti\00EA\0301p')
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144194456657752935)
,p_name=>'APEX.LTO.NOT_APPLICABLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ca\0301c t\00F9y ch\1ECDn m\1EABu kh\00F4ng s\1EB5n co\0301 v\00EC th\00E0nh ph\1EA7n n\00E0y kh\00F4ng \0111\01B0\1EE3c hi\1EC3n th\1ECB tr\00EAn trang.')
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144193373075752934)
,p_name=>'APEX.LTO.NO_OPTIONS_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng ti\0300m th\00E2\0301y tu\0300y cho\0323n m\00E2\0303u.')
,p_version_scn=>2705861
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144193617280752934)
,p_name=>'APEX.LTO.SAVE'
,p_message_language=>'vi'
,p_message_text=>unistr('L\01B0u')
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144047448372752891)
,p_name=>'APEX.MAPS.CLEAR_CIRCLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Xo\0301a hi\0300nh tro\0300n')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144049898764752891)
,p_name=>'APEX.MAPS.CUSTOM_STYLES_INVALID_JSON'
,p_message_language=>'vi'
,p_message_text=>unistr('Ki\1EC3u t\00F9y ch\1EC9nh kh\00F4ng ph\1EA3i l\00E0 JSON h\1EE3p l\1EC7.')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144047735087752891)
,p_name=>'APEX.MAPS.DISTANCE_TOOL'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00F4ng c\1EE5 kho\1EA3ng c\00E1ch')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144047524210752891)
,p_name=>'APEX.MAPS.DRAW_CIRCLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ve\0303 hi\0300nh tro\0300n')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144027312668752885)
,p_name=>'APEX.MAPS.FIND_MY_LOCATION'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110i\0323a \0111i\00EA\0309m hi\00EA\0323n ta\0323i')
,p_is_js_message=>true
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144033707384752887)
,p_name=>'APEX.MAPS.INIT_POINT_COORDINATES_INVALID'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00E1c t\1ECDa \0111\1ED9 c\1EE7a v\1ECB tr\00ED ban \0111\1EA7u kh\00F4ng h\1EE3p l\1EC7.')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144022754645752883)
,p_name=>'APEX.MAPS.INIT_POINT_GEOMETRY_REQUIRED'
,p_message_language=>'vi'
,p_message_text=>unistr('V\1ECB tr\00ED ban \0111\1EA7u ph\1EA3i l\00E0 h\00ECnh h\1ECDc \0111i\1EC3m.')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144031399380752886)
,p_name=>'APEX.MAPS.KM'
,p_message_language=>'vi'
,p_message_text=>'km'
,p_is_js_message=>true
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144026505441752885)
,p_name=>'APEX.MAPS.LAYER'
,p_message_language=>'vi'
,p_message_text=>unistr('L\01A1\0301p')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144196955955752935)
,p_name=>'APEX.MAPS.LAYER_NAME'
,p_message_language=>'vi'
,p_message_text=>unistr('L\01A1\0301p: %0')
,p_is_js_message=>true
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144045731653752890)
,p_name=>'APEX.MAPS.MAP'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0309n \0111\00F4\0300')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144015434145752881)
,p_name=>'APEX.MAPS.MAP_MESSAGES'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\00F4ng b\00E1o')
,p_is_js_message=>true
,p_version_scn=>2705834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144031520254752886)
,p_name=>'APEX.MAPS.MILES'
,p_message_language=>'vi'
,p_message_text=>unistr('d\0103\0323m')
,p_is_js_message=>true
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144195974955752935)
,p_name=>'APEX.MAPS.MORE_DATA_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('D\1EEF li\1EC7u ch\1EE9a h\01A1n %0 h\00E0ng, v\01B0\1EE3t qu\00E1 m\1EE9c t\1ED1i \0111a cho ph\00E9p.')
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144025827728752884)
,p_name=>'APEX.MAPS.ORACLE_MAP_COPYRIGHT'
,p_message_language=>'vi'
,p_message_text=>unistr('&copy; 2022 Oracle Corporation &nbsp;&nbsp; <a rel="noopener noreferrer" target="_blank" href="https://elocation.oracle.com/elocation/legal.html">\0110i\00EA\0300u khoa\0309n</a> &nbsp;&nbsp; D\01B0\0303 li\00EA\0323u ba\0309n \0111\00F4\0300 &copy; 2021 HERE')
,p_is_js_message=>true
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144022465917752883)
,p_name=>'APEX.MAPS.ORACLE_SDO_GEOMETRY_NOT_AVAILABLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng du\0300ng \0111\01B0\01A1\0323c lo\1EA1i d\1EEF li\1EC7u SDO_GEOMETRY trong c\01A1 s\01A1\0309 d\01B0\0303 li\00EA\0323u n\00E0y.')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144025910241752884)
,p_name=>'APEX.MAPS.OSM_MAP_COPYRIGHT'
,p_message_language=>'vi'
,p_message_text=>unistr('<a rel="noopener noreferrer" target="_blank" href="http://openmaptiles.org"> &copy; OpenMapTiles </a> &nbsp; <a rel="noopener noreferrer" target="_blank" href="https://www.openstreetmap.org/copyright"> &copy; C\00F4\0323ng ta\0301c vi\00EAn OpenStreetMap </a>')
,p_is_js_message=>true
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144050579112752892)
,p_name=>'APEX.MAPS.OSM_VECTOR_MAP_COPYRIGHT'
,p_message_language=>'vi'
,p_message_text=>unistr('<a rel="noopener noreferrer" target="blank" href="https://www.maptiler.com/copyright"> &copy; MapTiler</a> &nbsp; <a rel="noopener noreferrer" target="_blank" href="https://www.openstreetmap.org/copyright"> &copy; C\00F4\0323ng ta\0301c vi\00EAn OpenStreetMap </a>')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144026750653752885)
,p_name=>'APEX.MAPS.POINTS'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110i\00EA\0309m')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144197050940752935)
,p_name=>'APEX.MAPS.POINTS_COUNT'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 \0111i\00EA\0309m')
,p_is_js_message=>true
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144047684782752891)
,p_name=>'APEX.MAPS.RECTANGLE_ZOOM'
,p_message_language=>'vi'
,p_message_text=>unistr('Thu ph\00F3ng h\00ECnh ch\1EEF nh\1EADt')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144047333450752891)
,p_name=>'APEX.MAPS.REMOVE_MESSAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('Xo\0301a')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144027145216752885)
,p_name=>'APEX.MAPS.RESET_BEARING_TO_NORTH'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\0103\0323t la\0323i Ph\01B0\01A1ng vi\0323 la\0300 B\0103\0301c')
,p_is_js_message=>true
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144141999372752919)
,p_name=>'APEX.MAPS.TOGGLE_2D_MODE'
,p_message_language=>'vi'
,p_message_text=>unistr('Chuy\00EA\0309n sang ch\00EA\0301 \0111\00F4\0323 2D')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144142042833752919)
,p_name=>'APEX.MAPS.TOGGLE_3D_MODE'
,p_message_language=>'vi'
,p_message_text=>unistr('Chuy\00EA\0309n sang ch\00EA\0301 \0111\00F4\0323 3D')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144047296993752891)
,p_name=>'APEX.MAPS.TOGGLE_COPYRIGHT'
,p_message_language=>'vi'
,p_message_text=>unistr('B\00E2\0323t/t\0103\0301t th\00F4ng ba\0301o ba\0309n quy\00EA\0300n')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144047863449752891)
,p_name=>'APEX.MAPS.TOTAL_DISTANCE'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00F4\0309ng khoa\0309ng ca\0301ch')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144026836406752885)
,p_name=>'APEX.MAPS.ZOOM_IN'
,p_message_language=>'vi'
,p_message_text=>unistr('Pho\0301ng to')
,p_is_js_message=>true
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144027086567752885)
,p_name=>'APEX.MAPS.ZOOM_OUT'
,p_message_language=>'vi'
,p_message_text=>unistr('Thu nho\0309')
,p_is_js_message=>true
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144191548881752934)
,p_name=>'APEX.MARKDOWN.BOLD'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\00E2\0323m')
,p_is_js_message=>true
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144192426838752934)
,p_name=>'APEX.MARKDOWN.IMAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('H\00ECnh \1EA3nh')
,p_is_js_message=>true
,p_version_scn=>2705861
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144192074290752934)
,p_name=>'APEX.MARKDOWN.INLINE_CODE'
,p_message_language=>'vi'
,p_message_text=>unistr('M\00E3 n\1ED9i tuy\1EBFn')
,p_is_js_message=>true
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144204756047752938)
,p_name=>'APEX.MARKDOWN.INSERT_IMAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('Che\0300n hi\0300nh a\0309nh')
,p_is_js_message=>true
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144204843084752938)
,p_name=>'APEX.MARKDOWN.INSERT_LINK'
,p_message_language=>'vi'
,p_message_text=>unistr('Che\0300n li\00EAn k\00EA\0301t')
,p_is_js_message=>true
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144191657297752934)
,p_name=>'APEX.MARKDOWN.ITALIC'
,p_message_language=>'vi'
,p_message_text=>unistr('Nghi\00EAng')
,p_is_js_message=>true
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144205496220752938)
,p_name=>'APEX.MARKDOWN.LINK'
,p_message_language=>'vi'
,p_message_text=>unistr('Li\00EAn k\1EBFt')
,p_is_js_message=>true
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144192329438752934)
,p_name=>'APEX.MARKDOWN.LIST'
,p_message_language=>'vi'
,p_message_text=>unistr('Danh sa\0301ch')
,p_is_js_message=>true
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144192270365752934)
,p_name=>'APEX.MARKDOWN.ORDERED_LIST'
,p_message_language=>'vi'
,p_message_text=>unistr('Danh s\00E1ch c\00F3 th\1EE9 t\1EF1')
,p_is_js_message=>true
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144191773793752934)
,p_name=>'APEX.MARKDOWN.PREVIEW'
,p_message_language=>'vi'
,p_message_text=>unistr('Xem tr\01B0\01A1\0301c')
,p_is_js_message=>true
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144191883357752934)
,p_name=>'APEX.MARKDOWN.PREVIEW_EMPTY'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng c\00F3 g\00EC \0111\1EC3 xem tr\01B0\1EDBc')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144191925756752934)
,p_name=>'APEX.MARKDOWN.STRIKETHROUGH'
,p_message_language=>'vi'
,p_message_text=>unistr('Ga\0323ch ngang ch\01B0\0303')
,p_is_js_message=>true
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144192185545752934)
,p_name=>'APEX.MARKDOWN.UNORDERED_LIST'
,p_message_language=>'vi'
,p_message_text=>unistr('Danh s\00E1ch kh\00F4ng c\00F3 th\1EE9 t\1EF1')
,p_is_js_message=>true
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144171060265752928)
,p_name=>'APEX.MENU.CURRENT_MENU'
,p_message_language=>'vi'
,p_message_text=>unistr('hi\00EA\0323n ta\0323i')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144227272903752944)
,p_name=>'APEX.MENU.OVERFLOW_LABEL'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00E1c...')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144170959310752928)
,p_name=>'APEX.MENU.PROCESSING'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110ang ta\0309i')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144085141221752902)
,p_name=>'APEX.MENU.SPLIT_BUTTON'
,p_message_language=>'vi'
,p_message_text=>unistr('Nu\0301t chia ta\0301ch')
,p_is_js_message=>true
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144085038716752902)
,p_name=>'APEX.MENU.SPLIT_MENU'
,p_message_language=>'vi'
,p_message_text=>unistr('Tri\0300nh \0111\01A1n chia ta\0301ch')
,p_is_js_message=>true
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144202027028752937)
,p_name=>'APEX.NOTIFICATION_MESSAGE_HEADING'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\01B0 th\00F4ng ba\0301o')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144026128095752884)
,p_name=>'APEX.NO_DATA_FOUND_ENTITY'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng t\00ECm th\1EA5y %0')
,p_is_js_message=>true
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144176073174752929)
,p_name=>'APEX.NUMBER_FIELD.VALUE_GREATER_MAX_VALUE'
,p_message_language=>'vi'
,p_message_text=>unistr('#LABEL# pha\0309i la\0300 s\00F4\0301 nho\0309 h\01A1n ho\0103\0323c b\0103\0300ng %0.')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144176189783752929)
,p_name=>'APEX.NUMBER_FIELD.VALUE_INVALID'
,p_message_language=>'vi'
,p_message_text=>unistr('#LABEL# pha\0309i la\0300 m\00F4\0323t s\00F4\0301 h\01A1\0323p l\00EA\0323.')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144176285433752929)
,p_name=>'APEX.NUMBER_FIELD.VALUE_INVALID2'
,p_message_language=>'vi'
,p_message_text=>unistr('#LABEL# kh\00F4ng kh\01A1\0301p v\01A1\0301i \0111i\0323nh da\0323ng s\00F4\0301 %0 (Vi\0301 du\0323: %1).')
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144175946723752929)
,p_name=>'APEX.NUMBER_FIELD.VALUE_LESS_MIN_VALUE'
,p_message_language=>'vi'
,p_message_text=>unistr('#LABEL# pha\0309i la\0300 s\00F4\0301 l\01A1\0301n h\01A1n ho\0103\0323c b\0103\0300ng %0.')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144175803896752929)
,p_name=>'APEX.NUMBER_FIELD.VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'vi'
,p_message_text=>unistr('#LABEL# pha\0309i la\0300 s\00F4\0301 n\0103\0300m trong khoa\0309ng t\01B0\0300 %0 \0111\00EA\0301n %1.')
,p_is_js_message=>true
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144171197040752928)
,p_name=>'APEX.OPENS_IN_NEW_WINDOW_LOWER'
,p_message_language=>'vi'
,p_message_text=>unistr('m\01A1\0309 trong c\01B0\0309a s\00F4\0309 m\01A1\0301i')
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144120957960752913)
,p_name=>'APEX.PAGE.DUPLICATE_SUBMIT'
,p_message_language=>'vi'
,p_message_text=>unistr('Trang n\00E0y \0111\00E3 \0111\01B0\1EE3c g\1EEDi v\00E0 kh\00F4ng th\1EC3 g\1EEDi l\1EA1i.')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144102314925752907)
,p_name=>'APEX.PAGE.NOT_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng ti\0300m th\00E2\0301y \01B0\0301ng du\0323ng "%0" trang "%1".')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144137887888752918)
,p_name=>'APEX.PAGE_ITEM_IS_REQUIRED'
,p_message_language=>'vi'
,p_message_text=>unistr('#LABEL# pha\0309i co\0301 gia\0301 tri\0323 na\0300o \0111o\0301.')
,p_is_js_message=>true
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144028552207752885)
,p_name=>'APEX.PASSWORD.HIDE_PASSWORD'
,p_message_language=>'vi'
,p_message_text=>unistr('\00C2\0309n m\00E2\0323t kh\00E2\0309u')
,p_is_js_message=>true
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144028487821752885)
,p_name=>'APEX.PASSWORD.SHOW_PASSWORD'
,p_message_language=>'vi'
,p_message_text=>unistr('Hi\00EA\0309n thi\0323 m\00E2\0323t kh\00E2\0309u')
,p_is_js_message=>true
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144076044179752899)
,p_name=>'APEX.POPUP.SEARCH'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00ECm ki\1EBFm')
,p_is_js_message=>true
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144190025272752933)
,p_name=>'APEX.POPUP_LOV.BUTTON_CLOSE'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110o\0301ng')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144189990759752933)
,p_name=>'APEX.POPUP_LOV.BUTTON_FIND'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\0300m%0')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144190269778752933)
,p_name=>'APEX.POPUP_LOV.BUTTON_NEXT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\00EA\0301p theo')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144190161605752933)
,p_name=>'APEX.POPUP_LOV.BUTTON_PREV'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\01B0\01A1\0301c')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144066823167752896)
,p_name=>'APEX.POPUP_LOV.FILTER_REQ'
,p_message_language=>'vi'
,p_message_text=>unistr('Nh\00E2\0323p m\00F4\0323t cu\0323m t\01B0\0300 ti\0300m ki\00EA\0301m ch\01B0\0301a i\0301t nh\00E2\0301t %0 ky\0301 t\01B0\0323.')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144143123447752919)
,p_name=>'APEX.POPUP_LOV.ICON_TEXT'
,p_message_language=>'vi'
,p_message_text=>unistr('Danh s\00E1ch gi\00E1 tr\1ECB b\1EADt l\00EAn: %0')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144066919867752897)
,p_name=>'APEX.POPUP_LOV.INITIAL_FILTER_REQ'
,p_message_language=>'vi'
,p_message_text=>unistr('Nh\00E2\0323p cu\0323m t\01B0\0300 ti\0300m ki\00EA\0301m.')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144013932467752881)
,p_name=>'APEX.POPUP_LOV.LIST_OF_VALUES'
,p_message_language=>'vi'
,p_message_text=>unistr('Danh sa\0301ch gia\0301 tri\0323')
,p_is_js_message=>true
,p_version_scn=>2705833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144066732737752896)
,p_name=>'APEX.POPUP_LOV.NO_RESULTS'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng t\00ECm th\1EA5y k\1EBFt qu\1EA3.')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144066618085752896)
,p_name=>'APEX.POPUP_LOV.REMOVE_VALUE'
,p_message_language=>'vi'
,p_message_text=>unistr('Xo\0301a %0')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144163800380752925)
,p_name=>'APEX.POPUP_LOV.SEARCH'
,p_message_language=>'vi'
,p_message_text=>unistr('Cu\0323m t\01B0\0300 ti\0300m ki\00EA\0301m')
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144189816587752933)
,p_name=>'APEX.POPUP_LOV.TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00ECm ki\1EBFm')
,p_is_js_message=>true
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144016094128752881)
,p_name=>'APEX.PRINT.DOCGEN_REQUIRED'
,p_message_language=>'vi'
,p_message_text=>unistr('Y\00EAu c\00E2\0300u %0.')
,p_version_scn=>2705834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144028378367752885)
,p_name=>'APEX.PRINT_REPORT.ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\1ED7i trong khi in b\00E1o c\00E1o.')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144039162729752888)
,p_name=>'APEX.PRINT_UTIL.UNABLE_TO_PRINT'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\00EA\0309 tin ta\0300i li\00EA\0323u b\0103\0300ng ma\0301y chu\0309 in \0111a\0303 \0111i\0323nh c\00E2\0301u hi\0300nh.')
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144061823270752895)
,p_name=>'APEX.PROCESS.INVOKE_API.PARAMETER_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\1ED7i trong qua\0301 tri\0300nh \0111\00E1nh gi\00E1 tham s\1ED1 %0 khi g\1ECDi %1. Ha\0303y xem ba\0309n ghi l\1ED7i \0111\1EC3 bi\1EBFt chi ti\1EBFt.')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144200554492752936)
,p_name=>'APEX.PROCESSING'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110ang x\1EED l\00FD')
,p_is_js_message=>true
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144059673367752894)
,p_name=>'APEX.PWA.DIALOG.HIDE.INSTRUCTIONS'
,p_message_language=>'vi'
,p_message_text=>unistr('Quay la\0323i')
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144060791485752895)
,p_name=>'APEX.PWA.DIALOG.INTRO'
,p_message_language=>'vi'
,p_message_text=>unistr('Trang web n\00E0y c\00F3 ch\1EE9c n\0103ng \1EE9ng d\1EE5ng. H\00E3y c\00E0i \0111\1EB7t \01B0\0301ng du\0323ng \0111\00F3 tr\00EAn thi\1EBFt b\1ECB c\1EE7a b\1EA1n \0111\1EC3 c\00F3 tr\1EA3i nghi\1EC7m t\1ED1t nh\1EA5t.')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144062053128752895)
,p_name=>'APEX.PWA.DIALOG.SHOW.INSTRUCTIONS'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\1EBFp theo')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144063624927752896)
,p_name=>'APEX.PWA.DIALOG.TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ca\0300i \0111\0103\0323t \01B0\0301ng du\0323ng na\0300y')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144048478322752891)
,p_name=>'APEX.PWA.INSTRUCTIONS'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00F3 v\1EBB nh\01B0 thi\1EBFt b\1ECB ho\1EB7c tr\00ECnh duy\1EC7t c\1EE7a b\1EA1n hi\1EC7n kh\00F4ng h\1ED7 tr\1EE3 c\00E0i \0111\1EB7t \1EE8ng d\1EE5ng web l\0169y ti\1EBFn.')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144043515100752890)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP1'
,p_message_language=>'vi'
,p_message_text=>unistr('1. Nh\00E2\0301n va\0300o bi\00EA\0309u t\01B0\01A1\0323ng <strong>Chia se\0309</strong>')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144043602120752890)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP2'
,p_message_language=>'vi'
,p_message_text=>unistr('2. Cu\00F4\0323n xu\00F4\0301ng va\0300 nh\00E2\0301n va\0300o <strong>Th\00EAm va\0300o ma\0300n hi\0300nh chi\0301nh</strong>')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144060081678752894)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP3'
,p_message_language=>'vi'
,p_message_text=>unistr('3. Nh\00E2\0301n va\0300o <strong style="color:#007AE1;">Th\00EAm</strong> \0111\00EA\0309 xa\0301c nh\00E2\0323n')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144059185268752894)
,p_name=>'APEX.PWA.OFFLINE.BODY'
,p_message_language=>'vi'
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
unistr('    <h1>Kh\00F4ng th\00EA\0309 k\00EA\0301t n\00F4\0301i</h1>'),
unistr('    <p>C\00F3 v\1EBB nh\01B0 c\00F3 s\1EF1 c\1ED1 m\1EA1ng. H\00E3y ki\1EC3m tra k\1EBFt n\1ED1i c\1EE7a b\1EA1n r\00F4\0300i th\1EED l\1EA1i.</p>'),
unistr('    <button type="button">Th\01B0\0309 la\0323i</button>'),
'</main>',
'',
'<script>',
'    document.querySelector("button").addEventListener("click", () => {',
'        window.location.reload();',
'    });',
'</script>'))
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144059057309752894)
,p_name=>'APEX.PWA.OFFLINE.TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\00EA\0309 k\00EA\0301t n\00F4\0301i')
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144105657370752908)
,p_name=>'APEX.PWA.PUSH.SUBSCRIPTION_FAILED'
,p_message_language=>'vi'
,p_message_text=>unistr('Thi\00EA\0301t bi\0323 na\0300y kh\00F4ng ki\0301ch hoa\0323t \0111\01B0\01A1\0323c th\00F4ng ba\0301o \0111\00E2\0309y.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144111165825752910)
,p_name=>'APEX.QUICK_PICK.GROUP_LABEL'
,p_message_language=>'vi'
,p_message_text=>unistr('Mu\0323c ch\1ECDn nhanh cho %0')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144111048250752910)
,p_name=>'APEX.QUICK_PICK.LINK_ROLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Li\00EAn k\00EA\0301t cho\0323n nhanh')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144084829798752902)
,p_name=>'APEX.RADIO.VISUALLY_HIDDEN_RADIO'
,p_message_language=>'vi'
,p_message_text=>unistr('Nu\0301t radio kh\00F4ng hi\00EA\0309n thi\0323')
,p_is_js_message=>true
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144028992458752885)
,p_name=>'APEX.RECORD_VIEW.TOOLBAR'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\00EA\0301 \0111\00F4\0323 xem m\00F4\0323t h\00E0ng')
,p_is_js_message=>true
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144211677334752940)
,p_name=>'APEX.REGION.CSSCALENDAR.ADD'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\00EAm')
,p_version_scn=>2705865
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144156909822752923)
,p_name=>'APEX.REGION.CSSCALENDAR.ALL_DAY'
,p_message_language=>'vi'
,p_message_text=>unistr('Ca\0309 nga\0300y')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144234566697752947)
,p_name=>'APEX.REGION.CSSCALENDAR.BUTTON.SENDEMAIL'
,p_message_language=>'vi'
,p_message_text=>unistr('G\1EEDi l\1EDDi m\1EDDi')
,p_version_scn=>2705869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144234312266752946)
,p_name=>'APEX.REGION.CSSCALENDAR.CHOOSE_ACTION'
,p_message_language=>'vi'
,p_message_text=>unistr('Tu\0300y cho\0323n')
,p_version_scn=>2705869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144158724758752924)
,p_name=>'APEX.REGION.CSSCALENDAR.DAILY_ALLDAY'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\00EA\0301 \0111\00F4\0323 xem h\00E0ng nga\0300y cho ca\0309 nga\0300y ')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144158541872752924)
,p_name=>'APEX.REGION.CSSCALENDAR.DAILY_TIME_SPECIFIC'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\00EA\0301 \0111\00F4\0323 xem h\00E0ng nga\0300y cho d\1EEF li\1EC7u co\0301 th\1EDDi gian ')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144202797690752937)
,p_name=>'APEX.REGION.CSSCALENDAR.DAY'
,p_message_language=>'vi'
,p_message_text=>unistr('Ng\00E0y')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144197744090752936)
,p_name=>'APEX.REGION.CSSCALENDAR.DESCRIPTION'
,p_message_language=>'vi'
,p_message_text=>unistr('M\00F4 ta\0309')
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144081215264752901)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.CSV'
,p_message_language=>'vi'
,p_message_text=>'CSV'
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144081038538752901)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.ICALENDAR'
,p_message_language=>'vi'
,p_message_text=>'iCal'
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144080905186752901)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.PDF'
,p_message_language=>'vi'
,p_message_text=>'PDF'
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144081179755752901)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.XML'
,p_message_language=>'vi'
,p_message_text=>'XML'
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144080612643752901)
,p_name=>'APEX.REGION.CSSCALENDAR.ENDDATE'
,p_message_language=>'vi'
,p_message_text=>unistr('Nga\0300y k\00EA\0301t thu\0301c')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144080837613752901)
,p_name=>'APEX.REGION.CSSCALENDAR.EVENTNAME'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00EAn s\01B0\0323 ki\00EA\0323n')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144234449418752947)
,p_name=>'APEX.REGION.CSSCALENDAR.INVITATION'
,p_message_language=>'vi'
,p_message_text=>unistr('L\01A1\0300i m\01A1\0300i')
,p_version_scn=>2705869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144202873032752937)
,p_name=>'APEX.REGION.CSSCALENDAR.LIST'
,p_message_language=>'vi'
,p_message_text=>unistr('Danh sa\0301ch')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144202547220752937)
,p_name=>'APEX.REGION.CSSCALENDAR.MONTH'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\00E1ng')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144205187830752938)
,p_name=>'APEX.REGION.CSSCALENDAR.NEXT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\00EA\0301p theo')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144219187245752942)
,p_name=>'APEX.REGION.CSSCALENDAR.NOEVENTS'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng co\0301 s\01B0\0323 ki\00EA\0323n')
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144234737305752947)
,p_name=>'APEX.REGION.CSSCALENDAR.OPTION.FORM'
,p_message_language=>'vi'
,p_message_text=>unistr('Chi\0309nh s\01B0\0309a s\01B0\0323 ki\00EA\0323n hi\00EA\0323n co\0301.')
,p_version_scn=>2705869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144234605768752947)
,p_name=>'APEX.REGION.CSSCALENDAR.OPTION.SEND'
,p_message_language=>'vi'
,p_message_text=>unistr('G\01B0\0309i l\01A1\0300i m\01A1\0300i qua email.')
,p_version_scn=>2705869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144205221298752938)
,p_name=>'APEX.REGION.CSSCALENDAR.PREVIOUS'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\01B0\01A1\0301c')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144212936796752940)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL'
,p_message_language=>'vi'
,p_message_text=>unistr('G\01B0\0309i email')
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144212736024752940)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.BUTTON'
,p_message_language=>'vi'
,p_message_text=>unistr('G\01B0\0309i email')
,p_version_scn=>2705866
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144235315976752947)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.DIALOG.REQUIRED'
,p_message_language=>'vi'
,p_message_text=>unistr('Mo\0323i tr\01B0\01A1\0300ng \0111\00EA\0300u b\0103\0301t bu\00F4\0323c.')
,p_version_scn=>2705869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144235251047752947)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.DIALOG.TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('G\1EEDi l\1EDDi m\1EDDi')
,p_version_scn=>2705869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144234293844752946)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.SUBJECT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\00EAu \0111\00EA\0300')
,p_version_scn=>2705869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144212831849752940)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.TO'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\00EA\0301n')
,p_version_scn=>2705866
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144080779039752901)
,p_name=>'APEX.REGION.CSSCALENDAR.STARTDATE'
,p_message_language=>'vi'
,p_message_text=>unistr('Nga\0300y b\0103\0301t \0111\00E2\0300u')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144210939064752940)
,p_name=>'APEX.REGION.CSSCALENDAR.TABLEFORM'
,p_message_language=>'vi'
,p_message_text=>unistr('Bi\1EC3u m\1EABu tr\00EAn %0')
,p_version_scn=>2705865
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144158382831752924)
,p_name=>'APEX.REGION.CSSCALENDAR.TIME'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\01A1\0300i gian')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144205384461752938)
,p_name=>'APEX.REGION.CSSCALENDAR.TODAY'
,p_message_language=>'vi'
,p_message_text=>unistr('H\00F4m nay')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144203329496752937)
,p_name=>'APEX.REGION.CSSCALENDAR.VIEW'
,p_message_language=>'vi'
,p_message_text=>'Xem'
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144202662219752937)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEK'
,p_message_language=>'vi'
,p_message_text=>unistr('Tu\1EA7n')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144158653711752924)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEKLY_ALLDAY'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\00EA\0301 \0111\00F4\0323 xem h\00E0ng tu\1EA7n cho ca\0309 nga\0300y')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144158407533752924)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEKLY_TIME_SPECIFIC'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\00EA\0301 \0111\00F4\0323 xem h\00E0ng tu\1EA7n cho d\1EEF li\1EC7u co\0301 th\1EDDi gian')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144203215445752937)
,p_name=>'APEX.REGION.CSSCALENDAR.YEAR'
,p_message_language=>'vi'
,p_message_text=>unistr('N\0103m')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144202996908752937)
,p_name=>'APEX.REGION.JQM_COLUMN_TOGGLE.COLUMNS'
,p_message_language=>'vi'
,p_message_text=>unistr('C\1ED9t...')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144203029505752937)
,p_name=>'APEX.REGION.JQM_COLUMN_TOGGLE.LOAD_MORE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ta\0309i th\00EAm...')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144132418094752916)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.BACK'
,p_message_language=>'vi'
,p_message_text=>unistr('Quay la\0323i')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144073944949752899)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.LOAD_MORE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ta\0309i th\00EAm...')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144076272070752899)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.SEARCH'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00ECm ki\1EBFm...')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144203145508752937)
,p_name=>'APEX.REGION.JQM_REFLOW.LOAD_MORE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ta\0309i th\00EAm...')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144205081722752938)
,p_name=>'APEX.REGION.NOT_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng ti\0300m th\00E2\0301y ma\0303 vu\0300ng %0.')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144076188371752899)
,p_name=>'APEX.REGION.NO_DATA_FOUND_MESSAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng ti\0300m th\00E2\0301y d\01B0\0303 li\00EA\0323u')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144103604851752907)
,p_name=>'APEX.REGION.PAGINATION.RESET_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\00EA\0309 \0111\1EB7t l\1EA1i ph\00E2n trang cho vu\0300ng.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144067308817752897)
,p_name=>'APEX.REGION.PAGINATION.UNHANDLED_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\1ED7i khi thi\1EBFt l\1EADp ph\00E2n trang cho vu\0300ng.')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144197130535752935)
,p_name=>'APEX.REGION.RESPONSIVE_TABLE.COLUMNS'
,p_message_language=>'vi'
,p_message_text=>unistr('C\1ED9t...')
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144051680583752892)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.LAZY_LOADING_INCOMPATIBLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\0301nh n\0103ng ta\0309i khi c\00E2\0300n kh\00F4ng t\01B0\01A1ng thi\0301ch v\01A1\0301i ca\0301c vi\0323 tri\0301 trong %0, la\0300 vu\0300ng duy nh\00E2\0301t (m\00F4\0323t ph\00E2\0300n). Ba\0323n n\00EAn v\00F4 hi\00EA\0323u ho\0301a ti\0301nh n\0103ng ta\0309i khi c\00E2\0300n cho vu\0300ng na\0300y ho\0103\0323c di chuy\00EA\0309n ca\0301c tha\0300nh ph\00E2\0300n vi\0323 tri\0301 sang m\00F4\0323t vu\0300ng kha\0301c.')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144046972135752891)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.NO_GROUP_TEMPLATE'
,p_message_language=>'vi'
,p_message_text=>unistr('Thi\00EA\0301u m\00E2\0303u nho\0301m trong tha\0300nh ph\00E2\0300n m\00E2\0303u cho %0.')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144041915827752889)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.TOO_MANY_ROWS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 l\00E0 m\1ED9t v\00F9ng \0111\01A1n le\0309 (m\1ED9t ph\1EA7n) v\00E0 \0111a\0303 tr\1EA3 v\1EC1 nhi\1EC1u h\00E0ng.')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144204972953752938)
,p_name=>'APEX.REGION.TYPE_NOT_SUPPORTED'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng h\00F4\0303 tr\01A1\0323 loa\0323i vu\0300ng %0.')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144067205372752897)
,p_name=>'APEX.REGION.UNHANDLED_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\1ED7i khi hi\1EC3n th\1ECB vu\0300ng "#COMPONENT_NAME#".')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144137954042752918)
,p_name=>'APEX.REGION_COLUMN_IS_REQUIRED'
,p_message_language=>'vi'
,p_message_text=>unistr('#COLUMN_HEADER# pha\0309i co\0301 gia\0301 tri\0323 na\0300o \0111o\0301.')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144019586510752882)
,p_name=>'APEX.REPORT_QUERY.LAYOUT_REQUIRED'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0323n pha\0309i chi\0309 \0111i\0323nh b\00F4\0301 cu\0323c ba\0301o ca\0301o.')
,p_version_scn=>2705835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144233890786752946)
,p_name=>'APEX.RICH_TEXT_EDITOR.ACCESSIBLE_LABEL'
,p_message_language=>'vi'
,p_message_text=>unistr('%0, tri\0300nh soa\0323n tha\0309o v\0103n ba\0309n \0111a da\0323ng th\01B0\0301c')
,p_is_js_message=>true
,p_version_scn=>2705868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144140032676752918)
,p_name=>'APEX.RICH_TEXT_EDITOR.MAXIMUM_LENGTH_EXCEEDED'
,p_message_language=>'vi'
,p_message_text=>unistr('Ph\00E2\0300n \0111\00E1nh d\1EA5u HTML v\0103n b\1EA3n \0111a d\1EA1ng th\1EE9c v\01B0\1EE3t qu\00E1 \0111\1ED9 d\00E0i t\1ED1i \0111a c\1EE7a m\1EE5c (th\1EF1c t\1EBF la\0300 %0, \0111\01B0\01A1\0323c ph\00E9p co\0301 %1 k\00FD t\1EF1)')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144049474613752891)
,p_name=>'APEX.RTE.READ_ONLY_RICH_TEXT_EDITOR'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\00ECnh so\1EA1n th\1EA3o v\0103n b\1EA3n \0111a d\1EA1ng th\1EE9c \01A1\0309 ch\00EA\0301 \0111\00F4\0323 ch\1EC9 \0111\1ECDc')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144049315924752891)
,p_name=>'APEX.RTE.RICH_TEXT_EDITOR'
,p_message_language=>'vi'
,p_message_text=>unistr('Tri\0300nh soa\0323n tha\0309o v\0103n ba\0309n \0111a da\0323ng th\01B0\0301c')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144049186782752891)
,p_name=>'APEX.RTE.TOOLBAR_ALIGNMENT'
,p_message_language=>'vi'
,p_message_text=>unistr('C\0103n chi\0309nh')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144049250654752891)
,p_name=>'APEX.RTE.TOOLBAR_EXTRAS'
,p_message_language=>'vi'
,p_message_text=>unistr('B\00F4\0309 sung')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144048926627752891)
,p_name=>'APEX.RTE.TOOLBAR_FONT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ph\00F4ng ch\01B0\0303')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144048843375752891)
,p_name=>'APEX.RTE.TOOLBAR_FORMATTING'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\1ECBnh d\1EA1ng')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144049056635752891)
,p_name=>'APEX.RTE.TOOLBAR_LISTS'
,p_message_language=>'vi'
,p_message_text=>unistr('Danh sa\0301ch')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144202131312752937)
,p_name=>'APEX.RV.DELETE'
,p_message_language=>'vi'
,p_message_text=>unistr('Xo\0301a')
,p_is_js_message=>true
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144194642317752935)
,p_name=>'APEX.RV.DUPLICATE'
,p_message_language=>'vi'
,p_message_text=>unistr('Sao che\0301p')
,p_is_js_message=>true
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144192978236752934)
,p_name=>'APEX.RV.EXCLUDE_HIDDEN'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00F4\0323t \0111a\0303 hi\00EA\0309n thi\0323')
,p_is_js_message=>true
,p_version_scn=>2705861
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144192850252752934)
,p_name=>'APEX.RV.EXCLUDE_NULL'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng bao g\00F4\0300m gia\0301 tri\0323 r\00F4\0303ng')
,p_is_js_message=>true
,p_version_scn=>2705861
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144202203680752937)
,p_name=>'APEX.RV.INSERT'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\00EAm')
,p_is_js_message=>true
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144156504526752923)
,p_name=>'APEX.RV.MOVE_DOWN'
,p_message_language=>'vi'
,p_message_text=>unistr('Di chuy\1EC3n xu\1ED1ng')
,p_is_js_message=>true
,p_version_scn=>2705854
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144156618802752923)
,p_name=>'APEX.RV.MOVE_UP'
,p_message_language=>'vi'
,p_message_text=>unistr('Di chuy\1EC3n l\00EAn')
,p_is_js_message=>true
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144192603650752934)
,p_name=>'APEX.RV.NEXT_RECORD'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\00EA\0301p theo')
,p_is_js_message=>true
,p_version_scn=>2705861
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144193225489752934)
,p_name=>'APEX.RV.NOT_GROUPED_LABEL'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00F4\0323t kha\0301c')
,p_is_js_message=>true
,p_version_scn=>2705861
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144192724488752934)
,p_name=>'APEX.RV.PREV_RECORD'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\01B0\01A1\0301c')
,p_is_js_message=>true
,p_version_scn=>2705861
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144193062377752934)
,p_name=>'APEX.RV.REC_X'
,p_message_language=>'vi'
,p_message_text=>unistr('H\00E0ng %0')
,p_is_js_message=>true
,p_version_scn=>2705861
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144193198214752934)
,p_name=>'APEX.RV.REC_XY'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0300ng %0/%1')
,p_is_js_message=>true
,p_version_scn=>2705861
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144194792063752935)
,p_name=>'APEX.RV.REFRESH'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00E0m m\1EDBi')
,p_is_js_message=>true
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144194852869752935)
,p_name=>'APEX.RV.REVERT'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4i phu\0323c thay \0111\00F4\0309i')
,p_is_js_message=>true
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144192500732752934)
,p_name=>'APEX.RV.SETTINGS_MENU'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00E0i \0111\1EB7t')
,p_is_js_message=>true
,p_version_scn=>2705861
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144151736972752922)
,p_name=>'APEX.SAMPLE_FORMAT'
,p_message_language=>'vi'
,p_message_text=>unistr('Vi\0301 du\0323: %0')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144156059739752923)
,p_name=>'APEX.SAMPLE_FORMAT_SHORT'
,p_message_language=>'vi'
,p_message_text=>unistr('Vi\0301 du\0323: %0')
,p_is_js_message=>true
,p_version_scn=>2705854
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144068778183752897)
,p_name=>'APEX.SEARCH.1_RESULT_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('1 k\00EA\0301t qua\0309')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144065819660752896)
,p_name=>'APEX.SEARCH.N_RESULTS_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 k\00EA\0301t qua\0309')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144117640891752912)
,p_name=>'APEX.SEARCH.PAGINATION'
,p_message_language=>'vi'
,p_message_text=>unistr('Ph\00E2n trang')
,p_is_js_message=>true
,p_version_scn=>2705848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144117758511752912)
,p_name=>'APEX.SEARCH.RESULTS_X_TO_Y'
,p_message_language=>'vi'
,p_message_text=>unistr('K\00EA\0301t qua\0309, %0 \0111\00EA\0301n %1')
,p_is_js_message=>true
,p_version_scn=>2705848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144013456389752881)
,p_name=>'APEX.SESSION.ALERT.CREATE_NEW'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\0103ng nh\00E2\0323p la\0323i')
,p_is_js_message=>true
,p_version_scn=>2705833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144013351850752881)
,p_name=>'APEX.SESSION.ALERT.EXPIRED'
,p_message_language=>'vi'
,p_message_text=>unistr('Phi\00EAn cu\0309a ba\0323n \0111a\0303 k\00EA\0301t thu\0301c')
,p_is_js_message=>true
,p_version_scn=>2705833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144013500636752881)
,p_name=>'APEX.SESSION.ALERT.EXTEND'
,p_message_language=>'vi'
,p_message_text=>unistr('Gia ha\0323n')
,p_is_js_message=>true
,p_version_scn=>2705833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144013101126752881)
,p_name=>'APEX.SESSION.ALERT.IDLE_WARN'
,p_message_language=>'vi'
,p_message_text=>unistr('Phi\00EAn cu\0309a ba\0323n se\0303 k\00EA\0301t thu\0301c lu\0301c %0. Ba\0323n co\0301 mu\00F4\0301n gia ha\0323n phi\00EAn \0111o\0301 kh\00F4ng?')
,p_is_js_message=>true
,p_version_scn=>2705833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144013234392752881)
,p_name=>'APEX.SESSION.ALERT.MAX_WARN'
,p_message_language=>'vi'
,p_message_text=>unistr('Phi\00EAn c\1EE7a b\1EA1n s\1EBD k\1EBFt th\00FAc l\00FAc %0 v\00E0 kh\00F4ng th\1EC3 gia h\1EA1n. H\00E3y l\01B0u ngay m\1ECDi c\00F4ng vi\1EC7c \0111\1EC3 tr\00E1nh m\1EA5t d\1EEF li\1EC7u')
,p_is_js_message=>true
,p_version_scn=>2705833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144212550111752940)
,p_name=>'APEX.SESSION.DB_SESSION_CLEANUP.UNHANDLED_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i khi x\01B0\0309 ly\0301 ma\0303 do\0323n de\0323p phi\00EAn c\01A1 s\01A1\0309 d\01B0\0303 li\00EA\0323u.')
,p_version_scn=>2705865
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144102252599752907)
,p_name=>'APEX.SESSION.DB_SESSION_INIT.UNHANDLED_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i khi x\01B0\0309 ly\0301 ma\0303 thi\00EA\0301t l\00E2\0323p phi\00EAn c\01A1 s\01A1\0309 d\01B0\0303 li\00EA\0323u.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144072660597752898)
,p_name=>'APEX.SESSION.EXPIRED'
,p_message_language=>'vi'
,p_message_text=>unistr('Phi\00EAn cu\0309a ba\0323n \0111a\0303 k\00EA\0301t thu\0301c.')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144211778831752940)
,p_name=>'APEX.SESSION.EXPIRED.CLOSE_DIALOG'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0303y \0111\00F3ng h\1ED9p tho\1EA1i n\00E0y v\00E0 nh\1EA5n n\00FAt t\1EA3i l\1EA1i tr\00EAn tr\00ECnh duy\1EC7t c\1EE7a b\1EA1n \0111\1EC3 nh\00E2\0323n \0111\01B0\01A1\0323c phi\00EAn m\1EDBi.')
,p_version_scn=>2705865
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144230663482752945)
,p_name=>'APEX.SESSION.EXPIRED.NEW_SESSION'
,p_message_language=>'vi'
,p_message_text=>unistr('<a href="%0">\0110\0103ng nh\00E2\0323p</a> la\0323i \0111\00EA\0309 ta\0323o m\00F4\0323t phi\00EAn m\01A1\0301i.')
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144114924198752911)
,p_name=>'APEX.SESSION.NOT_VALID'
,p_message_language=>'vi'
,p_message_text=>unistr('Phi\00EAn kh\00F4ng h\01A1\0323p l\00EA\0323')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144158094136752924)
,p_name=>'APEX.SESSION.RAS.NO_DYNAMIC_ROLES'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\00EA\0309 ki\0301ch hoa\0323t Vai tr\00F2 \0111\1ED9ng trong phi\00EAn B\1EA3o m\1EADt \1EE9ng d\1EE5ng th\1EF1c cho ng\01B0\1EDDi d\00F9ng "%0".')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144100133085752906)
,p_name=>'APEX.SESSION.UNHANDLED_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('ERR-99900 Kh\00F4ng th\00EA\0309 ta\0323o ma\0303 phi\00EAn duy nh\00E2\0301t: %0')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144029257377752885)
,p_name=>'APEX.SESSION_STATE.CLOB_NOT_ALLOWED'
,p_message_language=>'vi'
,p_message_text=>unistr('Loa\0323i d\1EEF li\1EC7u tr\1EA1ng th\00E1i phi\00EAn CLOB kh\00F4ng \0111\01B0\1EE3c ph\00E9p \0111\00F4\0301i v\01A1\0301i m\1EE5c %0.')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144048654122752891)
,p_name=>'APEX.SESSION_STATE.CLOB_SUBSTITUTION_NOT_ALLOWED'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng h\1ED7 tr\1EE3 thay th\1EBF c\00E1c m\1EE5c c\1EE7a loa\0323i d\1EEF li\1EC7u tr\1EA1ng th\00E1i phi\00EAn CLOB.')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144117491532752912)
,p_name=>'APEX.SESSION_STATE.ITEM_VALUE_PROTECTION'
,p_message_language=>'vi'
,p_message_text=>unistr('Vi ph\1EA1m ti\0301nh n\0103ng b\1EA3o v\1EC7 tr\1EA1ng th\00E1i phi\00EAn: Nguy\00EAn nh\00E2n c\00F3 th\1EC3 la\0300 do thay \0111\1ED5i th\1EE7 c\00F4ng m\1EE5c trang \0111\01B0\1EE3c b\1EA3o v\1EC7 %0. N\1EBFu b\1EA1n kh\00F4ng bi\00EA\0301t ch\1EAFc nguy\00EAn nh\00E2n g\00E2y ra l\1ED7i n\00E0y, ha\0303y li\00EAn h\1EC7 ng\01B0\01A1\0300i qu\1EA3n tr\1ECB \1EE9ng d\1EE5ng \0111\1EC3 \0111\01B0\1EE3c h\1ED7 tr\1EE3.')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144238639533752948)
,p_name=>'APEX.SESSION_STATE.PAGE_PROTECTION'
,p_message_language=>'vi'
,p_message_text=>unistr('Vi ph\1EA1m ti\0301nh n\0103ng b\1EA3o v\1EC7 trang: Nguy\00EAn nh\00E2n c\00F3 th\1EC3 la\0300 do g\1EEDi m\1ED9t trang ch\01B0a t\1EA3i xong ho\1EB7c do thay \0111\1ED5i th\1EE7 c\00F4ng c\00E1c m\1EE5c trang \0111\01B0\1EE3c b\1EA3o v\1EC7. \0110\1EC3 \0111\01B0\1EE3c h\1ED7 tr\1EE3 th\00EAm, ha\0303y li\00EAn h\1EC7 ng\01B0\01A1\0300i qu\1EA3n tr\1ECB \1EE9ng d\1EE5ng.')
,p_version_scn=>2705870
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144237704182752948)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.NO_SPECIAL_CHAR'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 ch\01B0\0301a m\00F4\0323t trong s\00F4\0301 ca\0301c ky\0301 t\01B0\0323 kh\00F4ng h\01A1\0323p l\00EA\0323 sau \0111\00E2y &<>"/;,*|=% ho\0103\0323c --')
,p_version_scn=>2705870
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144237873791752948)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.NO_SPECIAL_CHAR_NL'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 ch\01B0\0301a m\00F4\0323t trong s\00F4\0301 ca\0301c ky\0301 t\01B0\0323 kh\00F4ng h\01A1\0323p l\00EA\0323 sau \0111\00E2y &<>"/;,*|=% ho\0103\0323c -- ho\0103\0323c do\0300ng m\01A1\0301i.')
,p_version_scn=>2705870
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144237520373752947)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.US_ONLY'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 ch\01B0\0301a ky\0301 t\01B0\0323 \0111\0103\0323c bi\00EA\0323t. Chi\0309 cho phe\0301p ca\0301c ky\0301 t\01B0\0323 a-Z, 0-9 va\0300 d\00E2\0301u ca\0301ch.')
,p_version_scn=>2705870
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144237678698752947)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 ch\01B0\0301a <, > ho\0103\0323c " la\0300 ca\0301c ky\0301 t\01B0\0323 kh\00F4ng h\01A1\0323p l\00EA\0323.')
,p_version_scn=>2705870
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144075014416752899)
,p_name=>'APEX.SESSION_STATE.SSP_CHECKSUM_MISSING'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng c\00F3 gia\0301 tri\0323 t\1ED5ng ki\1EC3m n\00E0o \0111\01B0\1EE3c cung c\1EA5p \0111\1EC3 hi\1EC3n th\1ECB qu\00E1 tr\00ECnh x\1EED l\00FD cho m\1ED9t trang y\00EAu c\1EA7u gia\0301 tri\0323 t\1ED5ng ki\1EC3m khi m\1ED9t ho\1EB7c nhi\1EC1u gi\00E1 tr\1ECB y\00EAu c\1EA7u, x\00F3a b\1ED9 nh\1EDB \0111\1EC7m ho\1EB7c \0111\1ED1i s\1ED1 \0111\01B0\1EE3c chuy\1EC3n d\01B0\1EDBi d\1EA1ng tham s\1ED1.')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144112347844752910)
,p_name=>'APEX.SESSION_STATE.SSP_VIOLATION'
,p_message_language=>'vi'
,p_message_text=>unistr('Vi ph\1EA1m ti\0301nh n\0103ng b\1EA3o v\1EC7 tr\1EA1ng th\00E1i phi\00EAn: Nguy\00EAn nh\00E2n c\00F3 th\1EC3 la\0300 do thay \0111\1ED5i th\1EE7 c\00F4ng m\00F4\0323t URL co\0301 ch\01B0\0301a gia\0301 tri\0323 t\00F4\0309ng ki\00EA\0309m ho\0103\0323c do s\01B0\0309 du\0323ng li\00EAn k\00EA\0301t co\0301 gia\0301 tri\0323 t\00F4\0309ng ki\00EA\0309m kh\00F4ng chi\0301nh xa\0301c ho\0103\0323c bi\0323 thi\00EA\0301u. N\1EBFu b\1EA1n kh\00F4ng bi\00EA\0301t ch\1EAFc nguy\00EA')
||unistr('n nh\00E2n g\00E2y ra l\1ED7i n\00E0y, ha\0303y li\00EAn h\1EC7 ng\01B0\01A1\0300i qu\1EA3n tr\1ECB \1EE9ng d\1EE5ng \0111\1EC3 \0111\01B0\1EE3c h\1ED7 tr\1EE3.')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144193985197752934)
,p_name=>'APEX.SET_HIGH_CONTRAST_MODE_OFF'
,p_message_language=>'vi'
,p_message_text=>unistr('T\1EAFt ch\1EBF \0111\1ED9 t\01B0\01A1ng ph\1EA3n cao')
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144194057226752935)
,p_name=>'APEX.SET_HIGH_CONTRAST_MODE_ON'
,p_message_language=>'vi'
,p_message_text=>unistr('B\00E2\0323t ch\1EBF \0111\1ED9 t\01B0\01A1ng ph\1EA3n cao')
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144058458794752894)
,p_name=>'APEX.SET_VALUE_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\00EA\0309 c\00E2\0323p nh\00E2\0323t ca\0300i \0111\0103\0323t \01B0\0301ng du\0323ng %0 vi\0300 ca\0300i \0111\0103\0323t na\0300y \0111\01B0\01A1\0323c \0111\0103ng ky\0301 t\01B0\0300 m\00F4\0323t \01B0\0301ng du\0323ng kha\0301c.')
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144108770276752909)
,p_name=>'APEX.SHUTTLE.CONTROL_BOTTOM'
,p_message_language=>'vi'
,p_message_text=>unistr('D\01B0\1EDBi c\00F9ng')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144108909865752909)
,p_name=>'APEX.SHUTTLE.CONTROL_DOWN'
,p_message_language=>'vi'
,p_message_text=>unistr('Xu\00F4\0301ng')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144109061596752909)
,p_name=>'APEX.SHUTTLE.CONTROL_MOVE'
,p_message_language=>'vi'
,p_message_text=>unistr('Di chuy\00EA\0309n')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144109180289752909)
,p_name=>'APEX.SHUTTLE.CONTROL_MOVE_ALL'
,p_message_language=>'vi'
,p_message_text=>unistr('Di chuy\00EA\0309n t\00E2\0301t ca\0309')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144109281847752909)
,p_name=>'APEX.SHUTTLE.CONTROL_REMOVE'
,p_message_language=>'vi'
,p_message_text=>unistr('Xo\0301a')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144109373557752909)
,p_name=>'APEX.SHUTTLE.CONTROL_REMOVE_ALL'
,p_message_language=>'vi'
,p_message_text=>unistr('Xo\0301a t\00E2\0301t ca\0309')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144109485878752909)
,p_name=>'APEX.SHUTTLE.CONTROL_RESET'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\0103\0323t la\0323i')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144108685481752909)
,p_name=>'APEX.SHUTTLE.CONTROL_TOP'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\00EAn cu\0300ng')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144108882780752909)
,p_name=>'APEX.SHUTTLE.CONTROL_UP'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00EAn')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144220445009752942)
,p_name=>'APEX.SINCE.SHORT.DAYS_AGO'
,p_message_language=>'vi'
,p_message_text=>'%0d'
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144221166619752943)
,p_name=>'APEX.SINCE.SHORT.DAYS_FROM_NOW'
,p_message_language=>'vi'
,p_message_text=>unistr('trong %0 nga\0300y')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144220349050752942)
,p_name=>'APEX.SINCE.SHORT.HOURS_AGO'
,p_message_language=>'vi'
,p_message_text=>'%0h'
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144221212463752943)
,p_name=>'APEX.SINCE.SHORT.HOURS_FROM_NOW'
,p_message_language=>'vi'
,p_message_text=>unistr('trong %0 gi\1EDD')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144220102426752942)
,p_name=>'APEX.SINCE.SHORT.MINUTES_AGO'
,p_message_language=>'vi'
,p_message_text=>'%0m'
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144221360448752943)
,p_name=>'APEX.SINCE.SHORT.MINUTES_FROM_NOW'
,p_message_language=>'vi'
,p_message_text=>unistr('trong %0 ph\00FAt')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144220723388752942)
,p_name=>'APEX.SINCE.SHORT.MONTHS_AGO'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 tha\0301ng')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144220987229752943)
,p_name=>'APEX.SINCE.SHORT.MONTHS_FROM_NOW'
,p_message_language=>'vi'
,p_message_text=>unistr('trong %0 tha\0301ng')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144220272894752942)
,p_name=>'APEX.SINCE.SHORT.SECONDS_AGO'
,p_message_language=>'vi'
,p_message_text=>'%0s'
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144221043751752943)
,p_name=>'APEX.SINCE.SHORT.SECONDS_FROM_NOW'
,p_message_language=>'vi'
,p_message_text=>unistr('trong %0 gi\00E2y')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144220579762752942)
,p_name=>'APEX.SINCE.SHORT.WEEKS_AGO'
,p_message_language=>'vi'
,p_message_text=>'%0w'
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144221447303752943)
,p_name=>'APEX.SINCE.SHORT.WEEKS_FROM_NOW'
,p_message_language=>'vi'
,p_message_text=>unistr('trong %0 tu\00E2\0300n')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144220604086752942)
,p_name=>'APEX.SINCE.SHORT.YEARS_AGO'
,p_message_language=>'vi'
,p_message_text=>'%0y'
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144220820642752942)
,p_name=>'APEX.SINCE.SHORT.YEARS_FROM_NOW'
,p_message_language=>'vi'
,p_message_text=>unistr('trong %0 n\0103m')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144021700718752883)
,p_name=>'APEX.SPATIAL.GEOMETRY.LINE'
,p_message_language=>'vi'
,p_message_text=>unistr('[\0110\01B0\1EDDng]')
,p_version_scn=>2705835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144022319689752883)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTILINE'
,p_message_language=>'vi'
,p_message_text=>unistr('[Nhi\1EC1u \0111\01B0\1EDDng]')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144022072760752883)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTIPOINT'
,p_message_language=>'vi'
,p_message_text=>unistr('[Nhi\1EC1u \0111i\1EC3m]')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144022570215752883)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTIPOLYGON'
,p_message_language=>'vi'
,p_message_text=>unistr('[Nhi\1EC1u \0111a gi\00E1c]')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144022624811752883)
,p_name=>'APEX.SPATIAL.GEOMETRY.OTHER'
,p_message_language=>'vi'
,p_message_text=>unistr('[\0110\1ED1i t\01B0\1EE3ng h\00ECnh h\1ECDc]')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144021608665752883)
,p_name=>'APEX.SPATIAL.GEOMETRY.POINT'
,p_message_language=>'vi'
,p_message_text=>unistr('[\0110i\00EA\0309m (%0,%1)]')
,p_version_scn=>2705835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144021910783752883)
,p_name=>'APEX.SPATIAL.GEOMETRY.POLYGON'
,p_message_language=>'vi'
,p_message_text=>unistr('[\0110a gi\00E1c]')
,p_version_scn=>2705835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144021125578752883)
,p_name=>'APEX.SPLITTER.COLLAPSED_REGION'
,p_message_language=>'vi'
,p_message_text=>unistr('Vu\0300ng \0111a\0303 thu go\0323n: %0')
,p_is_js_message=>true
,p_version_scn=>2705835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144136235642752917)
,p_name=>'APEX.SPLITTER.COLLAPSE_TEXT'
,p_message_language=>'vi'
,p_message_text=>unistr('Thu g\1ECDn')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144020146821752883)
,p_name=>'APEX.SPLITTER.HORIZ_CANNOT_LEFT_RIGHT'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\00EA\0309 di chuy\00EA\0309n b\1ED9 chia \0111\1ECBnh h\01B0\1EDBng theo chi\1EC1u ngang sang tra\0301i ho\0103\0323c pha\0309i')
,p_is_js_message=>true
,p_version_scn=>2705835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144020383865752883)
,p_name=>'APEX.SPLITTER.MAX_SIZE_REACHED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 \0111a\0323t \0111\00EA\0301n ki\0301ch th\01B0\01A1\0301c t\00F4\0301i \0111a la\0300 %0px')
,p_is_js_message=>true
,p_version_scn=>2705835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144021347951752883)
,p_name=>'APEX.SPLITTER.MIN_SIZE_REACHED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 \0111a\0323t \0111\00EA\0301n ki\0301ch th\01B0\01A1\0301c t\00F4\0301i thi\00EA\0309u la\0300 %0px')
,p_is_js_message=>true
,p_version_scn=>2705835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144021277750752883)
,p_name=>'APEX.SPLITTER.REGION_IS_COLLAPSED'
,p_message_language=>'vi'
,p_message_text=>unistr('Vu\0300ng \0111\01B0\01A1\0323c thu go\0323n')
,p_is_js_message=>true
,p_version_scn=>2705835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144021014384752883)
,p_name=>'APEX.SPLITTER.REGION_IS_RESTORED'
,p_message_language=>'vi'
,p_message_text=>unistr('Vu\0300ng \0111\01B0\01A1\0323c kh\00F4i phu\0323c')
,p_is_js_message=>true
,p_version_scn=>2705835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144020797897752883)
,p_name=>'APEX.SPLITTER.RESIZED_TO'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 thay \0111\00F4\0309i ki\0301ch th\01B0\01A1\0301c tha\0300nh %0px')
,p_is_js_message=>true
,p_version_scn=>2705835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144020959770752883)
,p_name=>'APEX.SPLITTER.RESTORED_REGION'
,p_message_language=>'vi'
,p_message_text=>unistr('V\00F9ng \0111\00E3 kh\00F4i ph\1EE5c: %0')
,p_is_js_message=>true
,p_version_scn=>2705835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144136189821752917)
,p_name=>'APEX.SPLITTER.RESTORE_TEXT'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4i phu\0323c')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144020208550752883)
,p_name=>'APEX.SPLITTER.VERTICAL_CANNOT_UP_DOWN'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\00EA\0309 di chuy\00EA\0309n b\1ED9 chia \0111\1ECBnh h\01B0\1EDBng theo chi\1EC1u do\0323c l\00EAn tr\00EAn ho\0103\0323c xu\00F4\0301ng d\01B0\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144185637185752932)
,p_name=>'APEX.STAR_RATING.CLEAR_RATING'
,p_message_language=>'vi'
,p_message_text=>unistr('Xo\0301a m\01B0\0301c x\00EA\0301p loa\0323i')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144175567380752929)
,p_name=>'APEX.STAR_RATING.INVALID_RATING_RANGE'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng thu\00F4\0323c pha\0323m vi x\00EA\0301p loa\0323i h\01A1\0323p l\00EA\0323 t\01B0\0300 1 - %1')
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144175618935752929)
,p_name=>'APEX.STAR_RATING.IS_NOT_NUMERIC'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng pha\0309i la\0300 s\00F4\0301')
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144171707670752928)
,p_name=>'APEX.SUCCESS_MESSAGE_HEADING'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\00F4ng ba\0301o tha\0300nh c\00F4ng')
,p_is_js_message=>true
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144233521990752946)
,p_name=>'APEX.TABS.NEXT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\00EA\0301p theo')
,p_is_js_message=>true
,p_version_scn=>2705868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144233483845752946)
,p_name=>'APEX.TABS.PREVIOUS'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\01B0\01A1\0301c')
,p_is_js_message=>true
,p_version_scn=>2705868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144143661071752919)
,p_name=>'APEX.TASK.ACTION.DATA_NOT_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng t\00ECm th\1EA5y h\1EC7 th\1ED1ng d\01B0\0303 li\00EA\0323u li\00EAn k\00EA\0301t v\01A1\0301i th\01B0\0323c th\00EA\0309 t\00E1c v\1EE5 n\00E0y')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144151967546752922)
,p_name=>'APEX.TASK.ACTION.ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('Vi\00EA\0323c th\01B0\0323c hi\00EA\0323n ha\0300nh \0111\00F4\0323ng \0111\00F4\0301i v\01A1\0301i ta\0301c vu\0323 %0 kh\00F4ng tha\0300nh c\00F4ng - ta\0301c vu\0323 \0111\01B0\01A1\0323c \0111\0103\0323t \01A1\0309 tra\0323ng tha\0301i bi\0323 l\00F4\0303i, ha\0303y ki\00EA\0309m tra ma\0303 ha\0300nh \0111\00F4\0323ng \0111\00F4\0301i v\01A1\0301i ta\0301c vu\0323')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144032109499752886)
,p_name=>'APEX.TASK.ADD_COMMENT_NOT_AUTHORIZED'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\00EAm ch\00FA th\00EDch: Kh\00F4ng \0111\01B0\1EE3c \1EE7y quy\1EC1n')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144031408671752886)
,p_name=>'APEX.TASK.ALREADY_ASSIGNED'
,p_message_language=>'vi'
,p_message_text=>unistr('Ta\0301c vu\0323 \0111a\0303 \0111\01B0\01A1\0323c ga\0301n')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144024878378752884)
,p_name=>'APEX.TASK.ASSIGNED_TO_USER'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 ga\0301n cho %0')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144031159167752886)
,p_name=>'APEX.TASK.CANCEL_TASK_NOT_AUTHORIZED'
,p_message_language=>'vi'
,p_message_text=>unistr('H\1EE7y t\00E1c v\1EE5: Kh\00F4ng \0111\01B0\1EE3c \1EE7y quy\1EC1n')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144046704897752891)
,p_name=>'APEX.TASK.CANNOT_REMOVE_OWNER'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\00EA\0309 xo\0301a ng\01B0\01A1\0300i phu\0323 tra\0301ch th\01B0\0323c t\00EA\0301 cu\0309a ta\0301c vu\0323 na\0300y. Ha\0303y u\0309y quy\00EA\0300n ta\0301c vu\0323 cho m\00F4\0323t ng\01B0\01A1\0300i tham gia kha\0301c tr\01B0\01A1\0301c khi th\01B0\0309 la\0323i thao ta\0301c na\0300y.')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144030752842752886)
,p_name=>'APEX.TASK.CLAIM_TASK_NOT_AUTHORIZED'
,p_message_language=>'vi'
,p_message_text=>unistr('X\00E1c nh\1EADn t\00E1c v\1EE5: Kh\00F4ng \0111\01B0\1EE3c \1EE7y quy\1EC1n')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144030827976752886)
,p_name=>'APEX.TASK.COMPLETE_TASK_NOT_AUTHORIZED'
,p_message_language=>'vi'
,p_message_text=>unistr('Ho\00E0n th\00E0nh t\00E1c v\1EE5: Kh\00F4ng \0111\01B0\1EE3c \1EE7y quy\1EC1n')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144030967918752886)
,p_name=>'APEX.TASK.DELEGATE_TASK_NOT_AUTHORIZED'
,p_message_language=>'vi'
,p_message_text=>unistr('\1EE6y quy\1EC1n t\00E1c v\1EE5: Kh\00F4ng \0111\01B0\1EE3c \1EE7y quy\1EC1n')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144029356045752885)
,p_name=>'APEX.TASK.DUE_DATE_IN_PAST'
,p_message_language=>'vi'
,p_message_text=>unistr('Nga\0300y \0111\00EA\0301n ha\0323n cu\0309a ta\0301c vu\0323 kh\00F4ng \0111\01B0\01A1\0323c la\0300 nga\0300y trong qua\0301 kh\01B0\0301.')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144024698807752884)
,p_name=>'APEX.TASK.DUE_SINCE'
,p_message_language=>'vi'
,p_message_text=>unistr('Nga\0300y \0111\00EA\0301n ha\0323n %0')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144025041438752884)
,p_name=>'APEX.TASK.EVENT.ACTION.ERROR_MESSAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('H\00E0nh \0111\1ED9ng \0111\1ED1i v\1EDBi t\00E1c v\1EE5 %1 kh\00F4ng th\00E0nh c\00F4ng. Th\00F4ng b\00E1o l\1ED7i - %0')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144024784411752884)
,p_name=>'APEX.TASK.EVENT.ACTION.FAILURE'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng tha\0300nh c\00F4ng')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144024361401752884)
,p_name=>'APEX.TASK.EVENT.ACTION.SUCCESS'
,p_message_language=>'vi'
,p_message_text=>unistr('Tha\0300nh c\00F4ng')
,p_is_js_message=>true
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144024555223752884)
,p_name=>'APEX.TASK.EVENT.ACTION.SUCCESS_MESSAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('H\00E0nh \0111\1ED9ng %1 \0111\00E3 th\00E0nh c\00F4ng v\1EDBi th\00F4ng b\00E1o %0')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144027803317752885)
,p_name=>'APEX.TASK.EVENT.BEFORE_EXPIRE'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\01B0\1EDBc khi h\1EBFt h\1EA1n')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144053414975752893)
,p_name=>'APEX.TASK.EVENT.CANCEL'
,p_message_language=>'vi'
,p_message_text=>unistr('Hu\0309y')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144052983709752892)
,p_name=>'APEX.TASK.EVENT.CANCEL_MESSAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 hu\0309y ta\0301c vu\0323')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144053583731752893)
,p_name=>'APEX.TASK.EVENT.CANCEL_NOT_ALLOWED'
,p_message_language=>'vi'
,p_message_text=>unistr('Ng\01B0\1EDDi tham gia kh\00F4ng \0111\01B0\1EE3c ph\00E9p h\1EE7y ta\0301c vu\0323 na\0300y')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144052850835752892)
,p_name=>'APEX.TASK.EVENT.CLAIM'
,p_message_language=>'vi'
,p_message_text=>unistr('Xa\0301c nh\00E2\0323n')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144053272936752892)
,p_name=>'APEX.TASK.EVENT.CLAIM_ALREADY_CLAIMED'
,p_message_language=>'vi'
,p_message_text=>unistr('Ta\0301c vu\0323 \0111\00E3 \0111\01B0\1EE3c ng\01B0\1EDDi d\00F9ng kh\00E1c x\00E1c nh\1EADn ho\1EB7c ng\01B0\1EDDi tham gia kh\00F4ng c\00F3 quy\1EC1n xa\0301c nh\1EADn ta\0301c vu\0323 n\00E0y')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144053082695752892)
,p_name=>'APEX.TASK.EVENT.CLAIM_MESSAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ta\0301c vu\0323 \0111a\0303 \0111\01B0\01A1\0323c %0 xa\0301c nh\00E2\0323n')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144154189940752922)
,p_name=>'APEX.TASK.EVENT.COMPLETE'
,p_message_language=>'vi'
,p_message_text=>unistr('Hoa\0300n th\00E0nh')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144052658363752892)
,p_name=>'APEX.TASK.EVENT.COMPLETE_MESSAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 hoa\0300n tha\0300nh ta\0301c vu\0323 v\01A1\0301i k\00EA\0301t qua\0309 %0')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144053948869752893)
,p_name=>'APEX.TASK.EVENT.COMPLETE_NOT_ALLOWED'
,p_message_language=>'vi'
,p_message_text=>unistr('Ta\0301c vu\0323 na\0300y kh\00F4ng \0111\01B0\01A1\0323c ga\0301n ho\0103\0323c ng\01B0\01A1\0300i tham gia kh\00F4ng \0111\01B0\01A1\0323c phe\0301p hoa\0300n tha\0300nh ta\0301c vu\0323 na\0300y')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144014302222752881)
,p_name=>'APEX.TASK.EVENT.COMPLETE_NO_OUTCOME'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 hoa\0300n tha\0300nh ta\0301c vu\0323 ma\0300 kh\00F4ng co\0301 k\00EA\0301t qua\0309')
,p_version_scn=>2705833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144154231074752923)
,p_name=>'APEX.TASK.EVENT.CREATE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ta\0323o')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144047122337752891)
,p_name=>'APEX.TASK.EVENT.CREATE_MESSAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 ta\0323o ta\0301c vu\0323 v\01A1\0301i ma\0303 %0')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144154306038752923)
,p_name=>'APEX.TASK.EVENT.DELEGATE'
,p_message_language=>'vi'
,p_message_text=>unistr('U\0309y quy\00EA\0300n')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144052713975752892)
,p_name=>'APEX.TASK.EVENT.DELEGATE_MESSAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 u\0309y quy\00EA\0300n ta\0301c vu\0323 cho ng\01B0\01A1\0300i phu\0323 tra\0301ch ti\00EA\0300m n\0103ng %0')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144053389640752892)
,p_name=>'APEX.TASK.EVENT.DELEGATE_NOT_ALLOWED'
,p_message_language=>'vi'
,p_message_text=>unistr('Ng\01B0\1EDDi tham gia kh\00F4ng c\00F3 quy\1EC1n ho\1EB7c ng\01B0\1EDDi tham gia m\1EDBi kh\00F4ng ph\1EA3i l\00E0 ng\01B0\01A1\0300i phu\0323 tra\0301ch ti\1EC1m n\0103ng c\1EE7a ta\0301c vu\0323 n\00E0y')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144026440110752885)
,p_name=>'APEX.TASK.EVENT.EXPIRE'
,p_message_language=>'vi'
,p_message_text=>unistr('La\0300m h\00EA\0301t ha\0323n')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144027594316752885)
,p_name=>'APEX.TASK.EVENT.EXPIRED_MESSAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00E1c v\1EE5 \0111a\0303 h\00EA\0301t ha\0323n.')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144154434595752923)
,p_name=>'APEX.TASK.EVENT.FAIL'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng tha\0300nh c\00F4ng')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144023109923752884)
,p_name=>'APEX.TASK.EVENT.INFO_REQUEST.NOT_ALLOWED'
,p_message_language=>'vi'
,p_message_text=>unistr('Ta\0301c vu\0323 na\0300y kh\00F4ng \0111\01B0\01A1\0323c ga\0301n ho\0103\0323c ng\01B0\01A1\0300i tham gia kh\00F4ng \0111\01B0\01A1\0323c phe\0301p y\00EAu c\00E2\0300u th\00F4ng tin cho ta\0301c vu\0323 na\0300y')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144023364451752884)
,p_name=>'APEX.TASK.EVENT.INFO_SUBMIT.NOT_ALLOWED'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\01B0a co\0301 th\00F4ng tin na\0300o \0111\01B0\01A1\0323c y\00EAu c\00E2\0300u cho ta\0301c vu\0323 na\0300y ho\0103\0323c ng\01B0\01A1\0300i tham gia kh\00F4ng \0111\01B0\01A1\0323c phe\0301p g\01B0\0309i th\00F4ng tin cho ta\0301c vu\0323 na\0300y.')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144026957769752885)
,p_name=>'APEX.TASK.EVENT.MAXRENEW_EXPIRED_MESSAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('La\0300m cho ta\0301c vu\0323 h\00EA\0301t ha\0323n vi\0300 \0111a\0303 \0111a\0323t t\01A1\0301i s\00F4\0301 l\00E2\0300n gia ha\0323n t\00F4\0301i \0111a la\0300 %0.')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144054269193752893)
,p_name=>'APEX.TASK.EVENT.NOT_ALLOWED_BUSINESS_ADMIN'
,p_message_language=>'vi'
,p_message_text=>unistr('Ta\0301c vu\0323 \01A1\0309 tra\0323ng tha\0301i kh\00F4ng chi\0301nh xa\0301c ho\0103\0323c ng\01B0\01A1\0300i tham gia kh\00F4ng pha\0309i la\0300 ng\01B0\1EDDi qu\1EA3n tr\1ECB kinh doanh cu\0309a ta\0301c vu\0323 na\0300y')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144054319115752893)
,p_name=>'APEX.TASK.EVENT.NOT_APPLICABLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Thao ta\0301c %0 kh\00F4ng xa\0301c \0111i\0323nh ho\0103\0323c kh\00F4ng a\0301p du\0323ng cho ta\0301c vu\0323 na\0300y')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144154559202752923)
,p_name=>'APEX.TASK.EVENT.RELEASE'
,p_message_language=>'vi'
,p_message_text=>unistr('Gia\0309i pho\0301ng')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144140263925752918)
,p_name=>'APEX.TASK.EVENT.RELEASE_MESSAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ta\0301c vu\0323 \0111a\0303 \0111\01B0\01A1\0323c gia\0309i pho\0301ng, nh\01B0\0303ng ng\01B0\01A1\0300i kha\0301c co\0301 th\00EA\0309 xa\0301c nh\00E2\0323n b\00E2y gi\01A1\0300')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144033139369752886)
,p_name=>'APEX.TASK.EVENT.RELEASE_NOT_ALLOWED'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng cho phe\0301p gia\0309i pho\0301ng ta\0301c vu\0323 - ng\01B0\01A1\0300i du\0300ng kh\00F4ng pha\0309i la\0300 ng\01B0\01A1\0300i phu\0323 tra\0301ch ta\0301c vu\0323 na\0300y')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144050189883752892)
,p_name=>'APEX.TASK.EVENT.REMOVE_OWNER'
,p_message_language=>'vi'
,p_message_text=>unistr('Xo\0301a ng\01B0\01A1\0300i phu\0323 tra\0301ch')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144050350013752892)
,p_name=>'APEX.TASK.EVENT.REMOVE_OWNER_MESSAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 xo\0301a ng\01B0\01A1\0300i tham gia %0 kho\0309i ta\0301c vu\0323 na\0300y')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144027788869752885)
,p_name=>'APEX.TASK.EVENT.RENEW'
,p_message_language=>'vi'
,p_message_text=>unistr('Gia ha\0323n')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144026674500752885)
,p_name=>'APEX.TASK.EVENT.RENEW_EXPIRED_MESSAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 gia ha\0323n ta\0301c vu\0323 v\01A1\0301i ma\0303 %0, s\00F4\0301 l\00E2\0300n gia ha\0323n t\00F4\0301i \0111a co\0300n la\0323i tr\01B0\01A1\0301c khi h\00EA\0301t ha\0323n la\0300 %1.')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144027623343752885)
,p_name=>'APEX.TASK.EVENT.RENEW_MESSAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 gia ha\0323n ma\0303 ta\0301c vu\0323 %0 v\01A1\0301i ma\0303 ta\0301c vu\0323 %1')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144023615046752884)
,p_name=>'APEX.TASK.EVENT.REQUEST_INFO'
,p_message_language=>'vi'
,p_message_text=>unistr('Y\00EAu c\00E2\0300u th\00F4ng tin')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144023544818752884)
,p_name=>'APEX.TASK.EVENT.REQUEST_INFO_MESSAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 y\00EAu c\00E2\0300u %0 cung c\00E2\0301p th\00EAm th\00F4ng tin: %1')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144021420047752883)
,p_name=>'APEX.TASK.EVENT.SET_INITIATOR_CAN_COMPLETE_MESSAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\0103\0323t gia\0301 tri\0323 %0 cho tu\0300y cho\0323n Tri\0300nh kh\01A1\0309i ta\0323o co\0301 th\00EA\0309 hoa\0300n tha\0300nh')
,p_version_scn=>2705835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144023738149752884)
,p_name=>'APEX.TASK.EVENT.SUBMIT_INFO'
,p_message_language=>'vi'
,p_message_text=>unistr('G\01B0\0309i th\00F4ng tin')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144023473390752884)
,p_name=>'APEX.TASK.EVENT.SUBMIT_INFO_MESSAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\00E3 g\1EEDi th\00F4ng tin \0111\01B0\1EE3c y\00EAu c\1EA7u cho %0: %1')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144154665259752923)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00E2\0323p nh\00E2\0323t chu\0301 thi\0301ch')
,p_version_scn=>2705852
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144051164895752892)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT_MESSAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\00EAm chu\0301 thi\0301ch: %0')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144054078849752893)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT_NOT_ALLOWED'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\1EA1ng th\00E1i cu\0309a ta\0301c vu\0323 kh\00F4ng cho ph\00E9p c\00F3 chu\0301 thi\0301ch')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144061309013752895)
,p_name=>'APEX.TASK.EVENT.UPDATE_DUE_DATE_MESSAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\1EB7t ng\00E0y \0111\1EBFn h\1EA1n t\00E1c v\1EE5 l\00E0 %0')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144019456300752882)
,p_name=>'APEX.TASK.EVENT.UPDATE_DUE_ON'
,p_message_language=>'vi'
,p_message_text=>unistr('Nga\0300y \0111\1EBFn h\1EA1n c\1EADp nh\1EADt')
,p_version_scn=>2705835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144154761092752923)
,p_name=>'APEX.TASK.EVENT.UPDATE_OWNER'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00E2\0323p nh\00E2\0323t ng\01B0\01A1\0300i phu\0323 tra\0301ch')
,p_version_scn=>2705852
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144052436630752892)
,p_name=>'APEX.TASK.EVENT.UPDATE_OWNER_MESSAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\00EAm ng\01B0\01A1\0300i phu\0323 tra\0301ch ti\00EA\0300m n\0103ng %0 va\0300o danh sa\0301ch ng\01B0\01A1\0300i tham gia ta\0301c vu\0323')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144051517626752892)
,p_name=>'APEX.TASK.EVENT.UPDATE_PARAM'
,p_message_language=>'vi'
,p_message_text=>unistr('C\1EADp nh\1EADt tham s\1ED1')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144154833460752923)
,p_name=>'APEX.TASK.EVENT.UPDATE_PRIORITY'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00E2\0323p nh\00E2\0323t m\01B0\0301c \01B0u ti\00EAn')
,p_version_scn=>2705852
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144053172682752892)
,p_name=>'APEX.TASK.EVENT.UPDATE_PRIORITY_MESSAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\0103\0323t m\01B0\0301c \01B0u ti\00EAn cho ta\0301c vu\0323 la\0300 %0')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144050408762752892)
,p_name=>'APEX.TASK.EVENT.UPD_PARAMETER_MESSAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 c\1EADp nh\1EADt tham s\1ED1 "%0" t\1EEB "%1" th\00E0nh "%2".')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144033986738752887)
,p_name=>'APEX.TASK.EVENT.WF_CANCEL_MESSAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 hu\0309y t\00E1c v\1EE5 v\00EC th\01B0\0323c th\00EA\0309 lu\00F4\0300ng c\00F4ng vi\1EC7c t\01B0\01A1ng \1EE9ng \0111\00E3 b\1ECB ch\1EA5m d\1EE9t.')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144031094380752886)
,p_name=>'APEX.TASK.FORWARD_TASK_NOT_AUTHORIZED'
,p_message_language=>'vi'
,p_message_text=>unistr('Chuy\1EC3n ti\1EBFp t\00E1c v\1EE5: Kh\00F4ng \0111\01B0\1EE3c \1EE7y quy\1EC1n')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144024477671752884)
,p_name=>'APEX.TASK.INITIATED_BY_USER_SINCE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ng\01B0\01A1\0300i kh\01A1\0309i ta\0323o %0 %1')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144033333034752887)
,p_name=>'APEX.TASK.INTERNAL_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 xa\0309y ra l\00F4\0303i n\00F4\0323i b\00F4\0323 kh\00F4ng mong \0111\01A1\0323i')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144031635039752886)
,p_name=>'APEX.TASK.NOT_APPLICABLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng a\0301p du\0323ng thao ta\0301c cho ta\0301c vu\0323')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144057277897752894)
,p_name=>'APEX.TASK.NO_POTENTIAL_OWNER'
,p_message_language=>'vi'
,p_message_text=>unistr('Chu\0309 s\01A1\0309 h\01B0\0303u ti\00EA\0300m n\0103ng na\0300y kh\00F4ng t\00F4\0300n ta\0323i.')
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144032960877752886)
,p_name=>'APEX.TASK.OUTCOME.APPROVED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\00E3 ph\00EA duy\1EC7t')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144033096116752886)
,p_name=>'APEX.TASK.OUTCOME.REJECTED'
,p_message_language=>'vi'
,p_message_text=>unistr('Bi\0323 t\01B0\0300 ch\00F4\0301i')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144014438910752881)
,p_name=>'APEX.TASK.OUTCOME_MISSING'
,p_message_language=>'vi'
,p_message_text=>unistr('Y\00EAu c\00E2\0300u pha\0309i co\0301 k\00EA\0301t qua\0309 khi hoa\0300n tha\0300nh ta\0301c vu\0323')
,p_version_scn=>2705833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144014607447752881)
,p_name=>'APEX.TASK.OUTCOME_NOT_ALLOWED'
,p_message_language=>'vi'
,p_message_text=>unistr('Ta\0301c vu\0323 kh\00F4ng \0111\01B0\01A1\0323c phe\0301p co\0301 k\00EA\0301t qua\0309')
,p_version_scn=>2705833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144050224853752892)
,p_name=>'APEX.TASK.PARAM_NOT_UPDATABLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\00EA\0309 c\00E2\0323p nh\00E2\0323t tham s\00F4\0301 %0.')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144046544239752890)
,p_name=>'APEX.TASK.PARTICIPANT_EXISTS'
,p_message_language=>'vi'
,p_message_text=>unistr('Ng\01B0\01A1\0300i tham gia \0111a\0303 t\00F4\0300n ta\0323i cho th\01B0\0323c th\00EA\0309 ta\0301c vu\0323 na\0300y.')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144148068517752921)
,p_name=>'APEX.TASK.PRIORITY.1'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00E2\0309n c\00E2\0301p')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144025150193752884)
,p_name=>'APEX.TASK.PRIORITY.1.DESCRIPTION'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00E2\0309n c\00E2\0301p')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144147981905752921)
,p_name=>'APEX.TASK.PRIORITY.2'
,p_message_language=>'vi'
,p_message_text=>'Cao'
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144025232449752884)
,p_name=>'APEX.TASK.PRIORITY.2.DESCRIPTION'
,p_message_language=>'vi'
,p_message_text=>unistr('M\01B0\0301c \01B0u ti\00EAn cao')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144147886855752921)
,p_name=>'APEX.TASK.PRIORITY.3'
,p_message_language=>'vi'
,p_message_text=>unistr('Trung bi\0300nh')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144025309359752884)
,p_name=>'APEX.TASK.PRIORITY.3.DESCRIPTION'
,p_message_language=>'vi'
,p_message_text=>unistr('M\01B0\0301c \01B0u ti\00EAn trung bi\0300nh')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144147759866752921)
,p_name=>'APEX.TASK.PRIORITY.4'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\00E2\0301p')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144025417740752884)
,p_name=>'APEX.TASK.PRIORITY.4.DESCRIPTION'
,p_message_language=>'vi'
,p_message_text=>unistr('M\01B0\0301c \01B0u ti\00EAn th\00E2\0301p')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144147622706752921)
,p_name=>'APEX.TASK.PRIORITY.5'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\00E2\0301p nh\00E2\0301t')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144025531959752884)
,p_name=>'APEX.TASK.PRIORITY.5.DESCRIPTION'
,p_message_language=>'vi'
,p_message_text=>unistr('M\01B0\0301c \01B0u ti\00EAn th\00E2\0301p nh\00E2\0301t')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144031232191752886)
,p_name=>'APEX.TASK.SET_PRIORITY_NOT_AUTHORIZED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\1EB7t m\1EE9c \01B0u ti\00EAn cho t\00E1c v\1EE5: Kh\00F4ng \0111\01B0\1EE3c \1EE7y quy\1EC1n')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144032406265752886)
,p_name=>'APEX.TASK.STATE.ASSIGNED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\00E3 g\00E1n')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144032895863752886)
,p_name=>'APEX.TASK.STATE.CANCELLED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 hu\0309y')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144032531180752886)
,p_name=>'APEX.TASK.STATE.COMPLETED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 hoa\0300n th\00E0nh')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144032769465752886)
,p_name=>'APEX.TASK.STATE.ERRORED'
,p_message_language=>'vi'
,p_message_text=>unistr('Bi\0323 l\00F4\0303i')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144026284901752884)
,p_name=>'APEX.TASK.STATE.EXPIRED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 h\00EA\0301t ha\0323n')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144032657039752886)
,p_name=>'APEX.TASK.STATE.FAILED'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng tha\0300nh c\00F4ng')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144022967123752884)
,p_name=>'APEX.TASK.STATE.INFO_REQUESTED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 y\00EAu c\00E2\0300u th\00F4ng tin')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144032325446752886)
,p_name=>'APEX.TASK.STATE.UNASSIGNED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 bo\0309 ga\0301n')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144054705891752893)
,p_name=>'APEX.TASK.TASK_CREATE_ERROR'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Vi\00EA\0323c ta\0323o ta\0301c vu\0323 m\01A1\0301i cho \0111i\0323nh nghi\0303a ta\0301c vu\0323 %0 trong \01B0\0301ng du\0323ng %1 kh\00F4ng tha\0300nh c\00F4ng.'),
'SQLCODE: %2'))
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144054675188752893)
,p_name=>'APEX.TASK.TASK_CREATE_NO_POTENTIAL_OWNER'
,p_message_language=>'vi'
,p_message_text=>unistr('N\1ED7 l\1EF1c t\1EA1o ta\0301c v\1EE5 cho \0111\1ECBnh ngh\0129a ta\0301c v\1EE5 %0 trong \1EE9ng d\1EE5ng %1 kh\00F4ng th\00E0nh c\00F4ng v\00EC \0111\1ECBnh ngh\0129a ta\0301c v\1EE5 kh\00F4ng ch\1EE9a b\1EA5t k\1EF3 ng\01B0\01A1\0300i phu\0323 tra\0301ch ti\1EC1m n\0103ng n\00E0o - ha\0303y ch\1EC9nh s\1EEDa \0111\1ECBnh ngh\0129a ta\0301c v\1EE5 v\00E0 th\00EAm \00EDt nh\1EA5t 1 ng\01B0\1EDDi tham gia thu\1ED9c lo\1EA1i ng\01B0\01A1\0300i phu\0323 tra\0301c')
||unistr('h ti\1EC1m n\0103ng')
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144031900208752886)
,p_name=>'APEX.TASK.TASK_DEFINITION_NOT_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng ti\0300m th\00E2\0301y \0111\1ECBnh ngh\0129a ta\0301c vu\0323')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144031876025752886)
,p_name=>'APEX.TASK.TASK_DEF_PARTICIPANTS_NOT_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng ti\0300m th\00E2\0301y ng\01B0\01A1\0300i tham gia cho ta\0301c vu\0323 na\0300y')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144033227155752887)
,p_name=>'APEX.TASK.TASK_ID_PK_VIOLATION'
,p_message_language=>'vi'
,p_message_text=>unistr('Co\0301 nhi\00EA\0300u ta\0301c vu\0323 cho ma\0303 ta\0301c vu\0323 \0111a\0303 cung c\00E2\0301p - ha\0303y ki\00EA\0309m tra v\01A1\0301i ng\01B0\1EDDi qu\1EA3n tr\1ECB c\01A1 s\01A1\0309 d\01B0\0303 li\00EA\0323u cu\0309a ba\0323n')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144032080393752886)
,p_name=>'APEX.TASK.TASK_NOT_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng ti\0300m th\00E2\0301y ta\0301c vu\0323')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144031795537752886)
,p_name=>'APEX.TASK.TASK_PARAMETER_NOT_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng ti\0300m th\00E2\0301y tham s\00F4\0301 t\00E1c v\1EE5')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144068056267752897)
,p_name=>'APEX.TASK.TYPE.ACTION'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0300nh \0111\00F4\0323ng')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144067933963752897)
,p_name=>'APEX.TASK.TYPE.APPROVAL'
,p_message_language=>'vi'
,p_message_text=>unistr('Ph\00EA duy\00EA\0323t')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144015385967752881)
,p_name=>'APEX.TASK.VACATION_RULE_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\01B0\0323c thi \0111\01B0\01A1\0323c quy tri\0300nh a\0301p quy t\0103\0301c ky\0300 nghi\0309 %2 cho \0111i\0323nh nghi\0303a ta\0301c vu\0323 %0 trong \01B0\0301ng du\0323ng %1.')
,p_version_scn=>2705834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144015589297752881)
,p_name=>'APEX.TASK.VACATION_RULE_MESSAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 th\00EAm ng\01B0\1EDDi tham gia %1 \0111\1EC3 thay th\1EBF cho ng\01B0\1EDDi tham gia %0 . L\00FD do - %2 .')
,p_version_scn=>2705834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144219299794752942)
,p_name=>'APEX.TB.TOOLBAR'
,p_message_language=>'vi'
,p_message_text=>unistr('Thanh c\00F4ng cu\0323')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144072745807752898)
,p_name=>'APEX.TEMPLATE.APPLICATION'
,p_message_language=>'vi'
,p_message_text=>unistr('\01AF\0301ng du\0323ng')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144233901869752946)
,p_name=>'APEX.TEMPLATE.EXPAND_COLLAPSE_NAV_LABEL'
,p_message_language=>'vi'
,p_message_text=>unistr('M\01A1\0309 r\00F4\0323ng/thu go\0323n \0111i\00EA\0300u h\01B0\01A1\0301ng')
,p_version_scn=>2705869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144234052820752946)
,p_name=>'APEX.TEMPLATE.EXPAND_COLLAPSE_SIDE_COL_LABEL'
,p_message_language=>'vi'
,p_message_text=>unistr('M\01A1\0309 r\00F4\0323ng/thu go\0323n c\00F4\0323t b\00EAn')
,p_version_scn=>2705869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144142463644752919)
,p_name=>'APEX.TEMPLATE.MAIN_NAV_LABEL'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110i\1EC1u h\01B0\1EDBng ch\00EDnh')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144043226548752890)
,p_name=>'APEX.TEMPLATE_DIRECTIVE.INVALID_PLACEHOLDER_NAME'
,p_message_language=>'vi'
,p_message_text=>unistr('"%0" la\0300 t\00EAn ph\1EA7n gi\1EEF ch\1ED7 kh\00F4ng h\01A1\0323p l\00EA\0323.')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144150186136752921)
,p_name=>'APEX.TIME.DAY'
,p_message_language=>'vi'
,p_message_text=>unistr('1 nga\0300y')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144149917175752921)
,p_name=>'APEX.TIME.HOUR'
,p_message_language=>'vi'
,p_message_text=>unistr('1 gi\01A1\0300')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144150251930752921)
,p_name=>'APEX.TIME.N_DAYS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 nga\0300y')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144150071957752921)
,p_name=>'APEX.TIME.N_HOURS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 gi\01A1\0300')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144149892363752921)
,p_name=>'APEX.TIME.N_MINUTES'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 phu\0301t')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144150449350752921)
,p_name=>'APEX.TIME.N_WEEKS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 tu\00E2\0300n')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144150369173752921)
,p_name=>'APEX.TIME.WEEK'
,p_message_language=>'vi'
,p_message_text=>unistr('1 tu\00E2\0300n')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144048198005752891)
,p_name=>'APEX.TMV.SELECTION_COUNT'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 cho\0323n %0 mu\0323c')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144048311261752891)
,p_name=>'APEX.TMV.SELECTOR_LABEL'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho\0323n mu\0323c')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144048235585752891)
,p_name=>'APEX.TMV.SELECTOR_LABEL_1'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho\0323n %0')
,p_is_js_message=>true
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144237097853752947)
,p_name=>'APEX.UI.BACK_TO_TOP'
,p_message_language=>'vi'
,p_message_text=>unistr('B\0103\0301t \0111\00E2\0300u trang')
,p_is_js_message=>true
,p_version_scn=>2705870
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144094647834752905)
,p_name=>'APEX.UI.ENABLED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 k\00EDch ho\1EA1t')
,p_is_js_message=>true
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144063172367752895)
,p_name=>'APEX.UNHANDLED_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i khi x\01B0\0309 ly\0301 y\00EAu c\00E2\0300u.')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144048797906752891)
,p_name=>'APEX.UPDATE_MESSAGE_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\1EC3 c\1EADp nh\1EADt tin nh\1EAFn v\0103n b\1EA3n %0 v\00EC tin nh\0103\0301n na\0300y \0111\01B0\1EE3c \0111\0103ng k\00FD t\1EEB m\1ED9t \1EE9ng d\1EE5ng kh\00E1c.')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144151866279752922)
,p_name=>'APEX.VALUE_REQUIRED'
,p_message_language=>'vi'
,p_message_text=>unistr('Y\00EAu c\00E2\0300u co\0301 gia\0301 tri\0323')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144068212432752897)
,p_name=>'APEX.VISUALLY_HIDDEN_HEADING'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00E2\0301p \0111\00F4\0323 ti\00EAu \0111\00EA\0300 %0, bi\0323 \00E2\0309n')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144196647585752935)
,p_name=>'APEX.WARN_ON_UNSAVED_CHANGES'
,p_message_language=>'vi'
,p_message_text=>unistr('Trang n\00E0y c\00F3 nh\1EEFng thay \0111\1ED5i ch\01B0a l\01B0u.')
,p_is_js_message=>true
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144058211243752894)
,p_name=>'APEX.WF.NAVIGATOR'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00F4ng cu\0323 \0111i\00EA\0300u h\01B0\01A1\0301ng')
,p_is_js_message=>true
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144057912407752894)
,p_name=>'APEX.WF.ZOOM_IN'
,p_message_language=>'vi'
,p_message_text=>unistr('Pho\0301ng to')
,p_is_js_message=>true
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144058981520752894)
,p_name=>'APEX.WF.ZOOM_LEVEL'
,p_message_language=>'vi'
,p_message_text=>unistr('M\01B0\0301c thu pho\0301ng {0}%')
,p_is_js_message=>true
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144058050426752894)
,p_name=>'APEX.WF.ZOOM_OUT'
,p_message_language=>'vi'
,p_message_text=>unistr('Thu nho\0309')
,p_is_js_message=>true
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144058103911752894)
,p_name=>'APEX.WF.ZOOM_RESET'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\0103\0323t la\0323i m\01B0\0301c thu pho\0301ng')
,p_is_js_message=>true
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144033653420752887)
,p_name=>'APEX.WF_DIAGRAM.ARIA_DESC'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\00EA\0309 truy c\00E2\0323p s\01A1 \0111\00F4\0300 lu\00F4\0300ng c\00F4ng vi\00EA\0323c va\0300o lu\0301c na\0300y.')
,p_is_js_message=>true
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144033553400752887)
,p_name=>'APEX.WF_DIAGRAM.ARIA_LABEL'
,p_message_language=>'vi'
,p_message_text=>unistr('S\01A1 \0111\00F4\0300 lu\00F4\0300ng c\00F4ng vi\00EA\0323c')
,p_is_js_message=>true
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144035482230752887)
,p_name=>'APEX.WORKFLOW.ACTION_NOT_ALLOWED'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\01B0\0323c th\00EA\0309 lu\00F4\0300ng c\00F4ng vi\00EA\0323c %0 \0111ang \01A1\0309 tra\0323ng tha\0301i %1. Vi\0300 v\00E2\0323y, kh\00F4ng cho phe\0301p th\01B0\0323c hi\00EA\0323n thao ta\0301c na\0300y')
,p_version_scn=>2705837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144038089847752888)
,p_name=>'APEX.WORKFLOW.ACTIVITY.COMPLETED'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\01B0\0323c th\00EA\0309 %1 cu\0309a hoa\0323t \0111\00F4\0323ng %2 trong lu\00F4\0300ng c\00F4ng vi\00EA\0323c %0 \0111a\0303 hoa\0300n tha\0300nh')
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144037823813752888)
,p_name=>'APEX.WORKFLOW.ACTIVITY.CREATED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\00E3 t\1EA1o th\01B0\0323c th\00EA\0309 m\1EDBi %1 c\1EE7a ho\1EA1t \0111\1ED9ng %2 trong lu\00F4\0300ng c\00F4ng vi\00EA\0323c %0')
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144029640226752885)
,p_name=>'APEX.WORKFLOW.ACTIVITY.DATA_NOT_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng ti\0300m th\00E2\0301y ha\0300ng d\01B0\0303 li\00EA\0323u b\00F4\0309 sung \0111\01B0\01A1\0323c li\00EAn k\00EA\0301t v\01A1\0301i th\01B0\0323c th\00EA\0309 hoa\0323t \0111\00F4\0323ng cu\0309a lu\00F4\0300ng c\00F4ng vi\00EA\0323c na\0300y')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144037933093752888)
,p_name=>'APEX.WORKFLOW.ACTIVITY.RETRIED'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\01B0\0323c th\00EA\0309 bi\0323 l\00F4\0303i %1 cu\0309a hoa\0323t \0111\00F4\0323ng %2 trong lu\00F4\0300ng c\00F4ng vi\00EA\0323c %0 \0111a\0303 \0111\01B0\01A1\0323c th\01B0\0309 la\0323i')
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144019967321752883)
,p_name=>'APEX.WORKFLOW.ACTIVITY.TERMINATED'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\01B0\0323c th\00EA\0309 hoa\0323t \0111\00F4\0323ng %1 trong lu\00F4\0300ng c\00F4ng vi\00EA\0323c %0 \0111a\0303 bi\0323 ch\00E2\0301m d\01B0\0301t')
,p_version_scn=>2705835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144053784891752893)
,p_name=>'APEX.WORKFLOW.ACTIVITY.TIMEOUT'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\01B0\0323c th\00EA\0309 hoa\0323t \0111\00F4\0323ng %1 trong lu\00F4\0300ng c\00F4ng vi\00EA\0323c %0 \0111a\0303 h\00EA\0301t th\01A1\0300i gian ch\01A1\0300 va\0300 bi\0323 ch\00E2\0301m d\01B0\0301t.')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144038145233752888)
,p_name=>'APEX.WORKFLOW.ACTIVITY.WAITING'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\01B0\0323c th\00EA\0309 %1 cu\0309a hoa\0323t \0111\00F4\0323ng %2 trong lu\00F4\0300ng c\00F4ng vi\00EA\0323c %0 \01A1\0309 tra\0323ng tha\0301i \0110ang ch\01A1\0300')
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144019745777752883)
,p_name=>'APEX.WORKFLOW.ALTERED_AND_RESUMED'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\01B0\0323c th\00EA\0309 %0 cu\0309a lu\00F4\0300ng c\00F4ng vi\00EA\0323c \0111a\0303 \0111\01B0\01A1\0323c thay \0111\00F4\0309i va\0300 ti\00EA\0301p tu\0323c ta\0323i hoa\0323t \0111\00F4\0323ng %1')
,p_version_scn=>2705835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144037117115752888)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.COMPLETED'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\01B0\0323c th\00EA\0309 \0111ang ch\01A1\0300 %1 cu\0309a hoa\0323t \0111\00F4\0323ng %2 trong lu\00F4\0300ng c\00F4ng vi\00EA\0323c %0 \0111a\0303 hoa\0300n tha\0300nh tha\0300nh c\00F4ng')
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144036920942752888)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.FAULTED'
,p_message_language=>'vi'
,p_message_text=>unistr('Hoa\0323t \0111\00F4\0323ng \0111ang ch\01A1\0300 %1 bi\0323 l\00F4\0303i vi\0300 lu\00F4\0300ng c\00F4ng vi\00EA\0323c %0 \0111a\0303 \01A1\0309 tra\0323ng tha\0301i Bi\0323 l\00F4\0303i tr\01B0\01A1\0301c khi hoa\0323t \0111\00F4\0323ng na\0300y hoa\0300n tha\0300nh')
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144037035090752888)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.TERMINATED'
,p_message_language=>'vi'
,p_message_text=>unistr('Hoa\0323t \0111\00F4\0323ng \0111ang ch\01A1\0300 %1 \0111a\0303 bi\0323 ch\00E2\0301m d\01B0\0301t vi\0300 lu\00F4\0300ng c\00F4ng vi\00EA\0323c %0 \0111a\0303 \01A1\0309 tra\0323ng tha\0301i \0110a\0303 ch\00E2\0301m d\01B0\0301t tr\01B0\01A1\0301c khi hoa\0323t \0111\00F4\0323ng na\0300y hoa\0300n tha\0300nh')
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144020024883752883)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.TERMINATE_FAILED'
,p_message_language=>'vi'
,p_message_text=>unistr('Vi\00EA\0323c ch\00E2\0301m d\01B0\0301t hoa\0323t \0111\00F4\0323ng %1 trong lu\00F4\0300ng c\00F4ng vi\00EA\0323c %0 kh\00F4ng tha\0300nh c\00F4ng do ngoa\0323i l\00EA\0323 - %2')
,p_version_scn=>2705835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144035673195752887)
,p_name=>'APEX.WORKFLOW.BUSY'
,p_message_language=>'vi'
,p_message_text=>unistr('Lu\1ED3ng c\00F4ng vi\1EC7c hi\1EC7n \0111ang b\1EADn ho\00E0n th\00E0nh thao t\00E1c tr\01B0\1EDBc \0111\00F3. Ha\0303y th\1EED l\1EA1i sau')
,p_version_scn=>2705837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144051718075752892)
,p_name=>'APEX.WORKFLOW.COMPLETED_SINCE'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 hoa\0300n th\00E0nh %0')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144034769944752887)
,p_name=>'APEX.WORKFLOW.CONTINUE.NOT_ALLOWED'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\00EA\0309 ti\00EA\0301p tu\0323c lu\00F4\0300ng c\00F4ng vi\00EA\0323c %0 vi\0300 lu\00F4\0300ng c\00F4ng vi\00EA\0323c na\0300y hi\00EA\0323n \0111ang \01A1\0309 Hoa\0323t \0111\00F4\0323ng %1 kh\00F4ng \01A1\0309 tra\0323ng tha\0301i \0110ang ch\01A1\0300')
,p_version_scn=>2705837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144046639730752891)
,p_name=>'APEX.WORKFLOW.CORRELATION_CONTEXT_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng ph\1EA3i l\00E0 ng\01B0\0303 c\1EA3nh t\01B0\01A1ng quan lu\00F4\0300ng c\00F4ng vi\1EC7c h\1EE3p l\1EC7 cho quy tr\00ECnh \0111ang \0111\01B0\1EE3c Ho\1EA1t \0111\1ED9ng cu\0309a lu\00F4\0300ng c\00F4ng vi\00EA\0323c n\00E0y th\1EF1c thi. Ng\1EEF c\1EA3nh t\01B0\01A1ng quan ph\1EA3i l\00E0 v\0103n b\1EA3n \0111\01B0\1EE3c ph\00E2n c\00E1ch b\1EB1ng d\1EA5u hai ch\1EA5m ch\1EE9a APEX_APPL_WORKFLOW theo sau l\00E0 Ma\0303 th\01B0\0323c th')
||unistr('\00EA\0309 lu\1ED3ng c\00F4ng vi\1EC7c v\00E0 Ma\0303 th\01B0\0323c th\00EA\0309 ho\1EA1t \0111\1ED9ng.')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144037380197752888)
,p_name=>'APEX.WORKFLOW.CREATED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\00E3 t\1EA1o th\01B0\0323c th\00EA\0309 m\1EDBi %0 c\1EE7a lu\00F4\0300ng c\00F4ng vi\00EA\0323c %1, phi\00EAn b\1EA3n %2')
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144029427448752885)
,p_name=>'APEX.WORKFLOW.DATA_NOT_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng ti\0300m th\00E2\0301y ha\0300ng d\01B0\0303 li\00EA\0323u b\00F4\0309 sung \0111\01B0\01A1\0323c li\00EAn k\00EA\0301t v\01A1\0301i th\01B0\0323c th\00EA\0309 lu\00F4\0300ng c\00F4ng vi\00EA\0323c na\0300y')
,p_version_scn=>2705836
);
end;
/
begin
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144051999769752892)
,p_name=>'APEX.WORKFLOW.DUE_SINCE'
,p_message_language=>'vi'
,p_message_text=>unistr('Nga\0300y \0111\00EA\0301n ha\0323n %0')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144037254957752888)
,p_name=>'APEX.WORKFLOW.END'
,p_message_language=>'vi'
,p_message_text=>unistr('Lu\1ED3ng c\00F4ng vi\1EC7c %0 \0111\00E3 k\1EBFt th\00FAc v\1EDBi tr\1EA1ng th\00E1i %1')
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144034472720752887)
,p_name=>'APEX.WORKFLOW.INCOMPATIBLE_DATA_TYPE'
,p_message_language=>'vi'
,p_message_text=>unistr('Loa\0323i d\01B0\0303 li\00EA\0323u %1 cho ca\0301c \0111i\00EA\0300u ki\00EA\0323n \0111\01B0\01A1\0323c so sa\0301nh trong ti\0301nh n\0103ng Chuy\00EA\0309n \0111\00F4\0309i hoa\0323t \0111\00F4\0323ng cu\0309a lu\00F4\0300ng c\00F4ng vi\00EA\0323c %0 kh\00F4ng t\01B0\01A1ng thi\0301ch v\01A1\0301i toa\0301n t\01B0\0309 \0111i\00EA\0300u ki\00EA\0323n')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144024287731752884)
,p_name=>'APEX.WORKFLOW.INITIATED_BY_USER_SINCE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ng\01B0\01A1\0300i kh\01A1\0309i ta\0323o %0 %1')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144047071048752891)
,p_name=>'APEX.WORKFLOW.INVOKED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 ta\0323o th\01B0\0323c th\00EA\0309 m\01A1\0301i %0 cu\0309a lu\00F4\0300ng c\00F4ng vi\00EA\0323c %1, phi\00EAn ba\0309n %2 - \0111\01B0\01A1\0323c go\0323i t\01B0\0300 th\01B0\0323c th\00EA\0309 hoa\0323t \0111\00F4\0323ng %4 cu\0309a th\01B0\0323c th\00EA\0309 lu\00F4\0300ng c\00F4ng vi\00EA\0323c %3')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144019895501752883)
,p_name=>'APEX.WORKFLOW.NO_ACTIVITY_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('Hoa\0323t \0111\00F4\0323ng co\0301 ma\0303 ti\0303nh %1 kh\00F4ng pha\0309i la\0300 hoa\0323t \0111\00F4\0323ng trong lu\00F4\0300ng c\00F4ng vi\00EA\0323c %0. Ha\0303y ki\00EA\0309m tra ma\0303 ti\0303nh cu\0309a hoa\0323t \0111\00F4\0323ng cho Phi\00EAn ba\0309n lu\00F4\0300ng c\00F4ng vi\00EA\0323c t\01B0\01A1ng \01B0\0301ng.')
,p_version_scn=>2705835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144045147883752890)
,p_name=>'APEX.WORKFLOW.REQUIRED_PARAM_MISSING'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 la\0300 tham s\00F4\0301 b\0103\0301t bu\00F4\0323c \0111\00F4\0301i v\01A1\0301i lu\00F4\0300ng c\00F4ng vi\00EA\0323c na\0300y va\0300 kh\00F4ng \0111\01B0\01A1\0323c \0111\00EA\0309 TR\00D4\0301NG.')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144037712098752888)
,p_name=>'APEX.WORKFLOW.RESUMED'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\01B0\0323c th\00EA\0309 %0 cu\0309a lu\00F4\0300ng c\00F4ng vi\00EA\0323c \0111a\0303 \0111\01B0\01A1\0323c ti\00EA\0301p tu\0323c')
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144037655245752888)
,p_name=>'APEX.WORKFLOW.RETRIED'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\01B0\0323c th\00EA\0309 %0 cu\0309a lu\00F4\0300ng c\00F4ng vi\00EA\0323c \0111a\0303 \0111\01B0\01A1\0323c th\01B0\0309 la\0323i')
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144052024910752892)
,p_name=>'APEX.WORKFLOW.RETRY_COUNT.EQUALS_ONE'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 l\00E2\0300n th\01B0\0309 la\0323i')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144052183941752892)
,p_name=>'APEX.WORKFLOW.RETRY_COUNT.NOT_EQUALS_ONE'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 l\00E2\0300n th\01B0\0309 la\0323i')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144051884654752892)
,p_name=>'APEX.WORKFLOW.STARTED_SINCE'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\00E3 b\1EAFt \0111\1EA7u %0')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144046041075752890)
,p_name=>'APEX.WORKFLOW.STATE.ACTIVE'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110ang ho\1EA1t \0111\1ED9ng')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144046296352752890)
,p_name=>'APEX.WORKFLOW.STATE.COMPLETED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 hoa\0300n th\00E0nh')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144046356311752890)
,p_name=>'APEX.WORKFLOW.STATE.FAULTED'
,p_message_language=>'vi'
,p_message_text=>unistr('B\1ECB l\1ED7i')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144046409147752890)
,p_name=>'APEX.WORKFLOW.STATE.SUSPENDED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 ta\0323m ng\01B0\0300ng')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144046121526752890)
,p_name=>'APEX.WORKFLOW.STATE.TERMINATED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 ch\00E2\0301m d\01B0\0301t')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144061480794752895)
,p_name=>'APEX.WORKFLOW.STATE.WAITING'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110ang ch\01A1\0300')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144037436754752888)
,p_name=>'APEX.WORKFLOW.SUSPENDED'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\01B0\0323c th\00EA\0309 %0 c\1EE7a lu\1ED3ng c\00F4ng vi\1EC7c \0111\00E3 b\1ECB t\1EA1m ng\01B0\0300ng')
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144043364006752890)
,p_name=>'APEX.WORKFLOW.SWITCH.BRANCH_NOT_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\00EA\0309 xa\0301c \0111i\0323nh hoa\0323t \0111\00F4\0323ng ti\00EA\0301p theo cho Th\01B0\0323c th\00EA\0309 lu\00F4\0300ng c\00F4ng vi\00EA\0323c %0. Ha\0303y xa\0301c minh va\0300 chi\0309nh s\01B0\0309a ca\0301c \0111i\00EA\0300u ki\00EA\0323n \0111a\0303 xa\0301c \0111i\0323nh cho hoa\0323t \0111\00F4\0323ng chuy\00EA\0309n \0111\00F4\0309i hi\00EA\0323n ta\0323i tr\01B0\01A1\0301c khi th\01B0\0309 la\0323i lu\00F4\0300ng c\00F4ng vi\00EA\0323c.')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144037540332752888)
,p_name=>'APEX.WORKFLOW.TERMINATED'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\01B0\0323c th\00EA\0309 %0 cu\0309a lu\00F4\0300ng c\00F4ng vi\00EA\0323c \0111a\0303 bi\0323 ch\00E2\0301m d\01B0\0301t')
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144036608423752888)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_RESUME'
,p_message_language=>'vi'
,p_message_text=>unistr('Chi\0309 ng\01B0\1EDDi qu\1EA3n tr\1ECB kinh doanh cu\0309a lu\00F4\0300ng c\00F4ng vi\00EA\0323c %0 m\01A1\0301i co\0301 th\00EA\0309 ti\00EA\0301p tu\0323c lu\00F4\0300ng c\00F4ng vi\00EA\0323c na\0300y')
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144036793637752888)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_RETRY'
,p_message_language=>'vi'
,p_message_text=>unistr('Chi\0309 ng\01B0\1EDDi qu\1EA3n tr\1ECB kinh doanh va\0300/ho\0103\0323c ng\01B0\01A1\0300i phu\0323 tra\0301ch m\01A1\0301i co\0301 th\00EA\0309 th\01B0\0309 la\0323i lu\00F4\0300ng c\00F4ng vi\00EA\0323c %0')
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144036281044752887)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_SUSPEND'
,p_message_language=>'vi'
,p_message_text=>unistr('Chi\0309 ng\01B0\1EDDi qu\1EA3n tr\1ECB kinh doanh cu\0309a lu\00F4\0300ng c\00F4ng vi\00EA\0323c na\0300y m\01A1\0301i co\0301 th\00EA\0309 ta\0323m ng\01B0\0300ng th\01B0\0323c th\00EA\0309 lu\00F4\0300ng c\00F4ng vi\00EA\0323c %0')
,p_version_scn=>2705837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144036566699752887)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_TERMINATE'
,p_message_language=>'vi'
,p_message_text=>unistr('Chi\0309 ng\01B0\01A1\0300i phu\0323 tra\0301ch va\0300 ng\01B0\1EDDi qu\1EA3n tr\1ECB kinh doanh cu\0309a th\01B0\0323c th\00EA\0309 lu\00F4\0300ng c\00F4ng vi\00EA\0323c %0 m\01A1\0301i co\0301 th\00EA\0309 ch\00E2\0301m d\01B0\0301ng lu\00F4\0300ng c\00F4ng vi\00EA\0323c na\0300y')
,p_version_scn=>2705837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144034986609752887)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_UPDATE'
,p_message_language=>'vi'
,p_message_text=>unistr('Chi\0309 ng\01B0\1EDDi qu\1EA3n tr\1ECB kinh doanh \0111\01B0\01A1\0323c xa\0301c \0111i\0323nh cho lu\00F4\0300ng c\00F4ng vi\00EA\0323c na\0300y m\01A1\0301i co\0301 th\00EA\0309 c\00E2\0323p nh\00E2\0323t ca\0301c bi\00EA\0301n cu\0309a lu\00F4\0300ng c\00F4ng vi\00EA\0323c %0')
,p_version_scn=>2705837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144049596695752891)
,p_name=>'APEX.WORKFLOW.UPDATE,NOT_ALLOWED'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\01B0\0323c th\00EA\0309 lu\00F4\0300ng c\00F4ng vi\00EA\0323c %0 pha\0309i \01A1\0309 tra\0323ng tha\0301i Bi\0323 l\00F4\0303i ho\0103\0323c \0110a\0303 ta\0323m ng\01B0\0300ng thi\0300 m\01A1\0301i co\0301 th\00EA\0309 c\00E2\0323p nh\00E2\0323t ca\0301c bi\00EA\0301n cu\0309a no\0301.')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144041017892752889)
,p_name=>'APEX.WORKFLOW.UPDATED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 c\00E2\0323p nh\00E2\0323t gia\0301 tri\0323 bi\00EA\0301n %0 cu\0309a lu\00F4\0300ng c\00F4ng vi\00EA\0323c tha\0300nh %1')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144051235829752892)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_ACTIVE'
,p_message_language=>'vi'
,p_message_text=>unistr('Lu\00F4\0300ng c\00F4ng vi\00EA\0323c %0 kh\00F4ng co\0301 phi\00EAn ba\0309n na\0300o \0110ang hoa\0323t \0111\00F4\0323ng')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144051392830752892)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_DEV'
,p_message_language=>'vi'
,p_message_text=>unistr('Lu\00F4\0300ng c\00F4ng vi\00EA\0323c %0 kh\00F4ng co\0301 phi\00EAn ba\0309n na\0300o \0110ang pha\0301t tri\00EA\0309n')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144051460731752892)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('Lu\00F4\0300ng c\00F4ng vi\00EA\0323c %0 kh\00F4ng co\0301 phi\00EAn ba\0309n na\0300o \0110ang hoa\0323t \0111\00F4\0323ng ho\0103\0323c \0110ang pha\0301t tri\00EA\0309n')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144034313150752887)
,p_name=>'APEX.WORKFLOW.WORKFLOW_ACT_INSTANCE_NOT_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng ti\0300m th\00E2\0301y th\01B0\0323c th\00EA\0309 hoa\0323t \0111\00F4\0323ng %1 cho th\01B0\0323c th\00EA\0309 lu\00F4\0300ng c\00F4ng vi\00EA\0323c %0')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144034164921752887)
,p_name=>'APEX.WORKFLOW.WORKFLOW_INSTANCE_NOT_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng ti\0300m th\00E2\0301y th\01B0\0323c th\00EA\0309 lu\00F4\0300ng c\00F4ng vi\00EA\0323c %0')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144069237684752897)
,p_name=>'APEX.XLSX.ERROR.NO_ACTIVE_WORKSHEET'
,p_message_language=>'vi'
,p_message_text=>unistr('S\00F4\0309 la\0300m vi\00EA\0323c na\0300y kh\00F4ng co\0301 ba\0309ng ti\0301nh na\0300o \0111ang ho\1EA1t \0111\1ED9ng.')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144069112935752897)
,p_name=>'APEX.XLSX.ERROR.WORKBOOK_NOT_INITIALIZED'
,p_message_language=>'vi'
,p_message_text=>unistr('S\00F4\0309 la\0300m vi\00EA\0323c na\0300y kh\00F4ng \0111\01B0\01A1\0323c kh\01A1\0309i cha\0323y.')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144069063843752897)
,p_name=>'APEX.XLSX.INTERNAL_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\00E3 x\1EA3y ra l\1ED7i n\1ED9i b\1ED9 trong khi t\1EA1o t\00E2\0323p tin XLSX.')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144071597917752898)
,p_name=>'APEX.XLSX.SHEET'
,p_message_language=>'vi'
,p_message_text=>unistr('Trang ti\0301nh')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144082191937752901)
,p_name=>'APEX.XLSX.SHEET_NAME_TAKEN'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00EAn ba\0309ng ti\0301nh "%0" \0111a\0303 \0111\01B0\01A1\0323c du\0300ng. Ha\0303y th\01B0\0309 m\00F4\0323t t\00EAn kha\0301c.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144210753753752939)
,p_name=>'APEXIR_ACTIONS'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0300nh \0111\00F4\0323ng')
,p_version_scn=>2705865
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144125776407752914)
,p_name=>'APEXIR_ACTIONS_MENU'
,p_message_language=>'vi'
,p_message_text=>unistr('Tri\0300nh \0111\01A1n ha\0300nh \0111\00F4\0323ng')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144121488436752913)
,p_name=>'APEXIR_ADD_FUNCTION'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\00EAm ha\0300m')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144121365041752913)
,p_name=>'APEXIR_ADD_GROUP_BY_COLUMN'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\00EAm c\00F4\0323t ph\00E2n nho\0301m theo')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144158980885752924)
,p_name=>'APEXIR_ADD_PIVOT_COLUMN'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\00EAm c\00F4\0323t ba\0309ng t\00F4\0309ng h\01A1\0323p')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144159023061752924)
,p_name=>'APEXIR_ADD_ROW_COLUMN'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\00EAm c\00F4\0323t ha\0300ng')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144093448758752904)
,p_name=>'APEXIR_AGGREGATE'
,p_message_language=>'vi'
,p_message_text=>unistr('T\1ED5ng h\01A1\0323p')
,p_is_js_message=>true
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144131943270752916)
,p_name=>'APEXIR_AGGREGATION'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00F4\0309ng h\01A1\0323p')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144112874048752910)
,p_name=>'APEXIR_AGG_AVG'
,p_message_language=>'vi'
,p_message_text=>unistr('Trung bi\0300nh')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144117137421752911)
,p_name=>'APEXIR_AGG_COUNT'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\00EA\0301m')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144112992527752910)
,p_name=>'APEXIR_AGG_MAX'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00F4\0301i \0111a')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144113196602752910)
,p_name=>'APEXIR_AGG_MEDIAN'
,p_message_language=>'vi'
,p_message_text=>unistr('Trung vi\0323')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144113050194752910)
,p_name=>'APEXIR_AGG_MIN'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00F4\0301i thi\00EA\0309u')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144112720158752910)
,p_name=>'APEXIR_AGG_SUM'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00F4\0309ng %0')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144113854649752911)
,p_name=>'APEXIR_ALL'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00E2\0301t ca\0309')
,p_is_js_message=>true
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144092739188752904)
,p_name=>'APEXIR_ALL_COLUMNS'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00E2\0301t ca\0309 ca\0301c c\00F4\0323t')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144072844977752898)
,p_name=>'APEXIR_ALL_ROWS'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00E2\0301t ca\0309 ca\0301c ha\0300ng')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144207793931752939)
,p_name=>'APEXIR_ALTERNATIVE'
,p_message_language=>'vi'
,p_message_text=>unistr('Thay th\00EA\0301')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144209356713752939)
,p_name=>'APEXIR_ALTERNATIVE_DEFAULT_NAME'
,p_message_language=>'vi'
,p_message_text=>unistr('M\0103\0323c \0111i\0323nh thay th\1EBF:  %0 ')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144106920393752908)
,p_name=>'APEXIR_AND'
,p_message_language=>'vi'
,p_message_text=>unistr('va\0300')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144141701056752919)
,p_name=>'APEXIR_API.IMPORT_CONTENT_CORRUPTED'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\1EC3 nh\1EADp b\00E1o c\00E1o \0111\00E3 l\01B0u. N\1ED9i dung b\1ECB h\1ECFng.')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144141899324752919)
,p_name=>'APEXIR_API.IMPORT_CONTENT_EMPTY'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\1EC3 nh\1EADp b\00E1o c\00E1o \0111\00E3 l\01B0u. N\1ED9i dung b\1ECB tr\00F4\0301ng.')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144094902351752905)
,p_name=>'APEXIR_APPLY'
,p_message_language=>'vi'
,p_message_text=>unistr('\00C1p du\0323ng')
,p_is_js_message=>true
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144088588173752903)
,p_name=>'APEXIR_ASCENDING'
,p_message_language=>'vi'
,p_message_text=>unistr('T\0103ng d\00E2\0300n')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144110060073752909)
,p_name=>'APEXIR_AS_OF'
,p_message_language=>'vi'
,p_message_text=>unistr('K\00EA\0309 t\01B0\0300 %0')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144209998766752939)
,p_name=>'APEXIR_AVERAGE_X'
,p_message_language=>'vi'
,p_message_text=>unistr('Trung bi\0300nh %0')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144201507124752937)
,p_name=>'APEXIR_BAR'
,p_message_language=>'vi'
,p_message_text=>'Thanh'
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144094205784752905)
,p_name=>'APEXIR_BETWEEN'
,p_message_language=>'vi'
,p_message_text=>unistr('trong khoa\0309ng')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144087351599752903)
,p_name=>'APEXIR_BGCOLOR'
,p_message_language=>'vi'
,p_message_text=>unistr('Ma\0300u n\00EA\0300n')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144089207081752903)
,p_name=>'APEXIR_BLUE'
,p_message_language=>'vi'
,p_message_text=>unistr('xanh d\01B0\01A1ng')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144123352328752913)
,p_name=>'APEXIR_BOTTOM'
,p_message_language=>'vi'
,p_message_text=>unistr('D\01B0\1EDBi c\00F9ng')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144054154750752893)
,p_name=>'APEXIR_BTNS_NEXT_TO_SEARCH_OF'
,p_message_language=>'vi'
,p_message_text=>unistr('Ca\0301c nu\0301t b\00EAn ca\0323nh thanh ti\0300m ki\00EA\0301m cu\0309a %0')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144089825098752903)
,p_name=>'APEXIR_CANCEL'
,p_message_language=>'vi'
,p_message_text=>unistr('Hu\0309y')
,p_is_js_message=>true
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144096174423752905)
,p_name=>'APEXIR_CATEGORY'
,p_message_language=>'vi'
,p_message_text=>unistr('Danh mu\0323c')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144087299101752903)
,p_name=>'APEXIR_CELL'
,p_message_language=>'vi'
,p_message_text=>unistr('\00D4')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144113781306752910)
,p_name=>'APEXIR_CHART'
,p_message_language=>'vi'
,p_message_text=>unistr('Bi\00EA\0309u \0111\00F4\0300')
,p_is_js_message=>true
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144124258090752914)
,p_name=>'APEXIR_CHART_INITIALIZING'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110ang kh\01A1\0309i ta\0323o...')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144163946457752926)
,p_name=>'APEXIR_CHART_LABEL_NOT_NULL'
,p_message_language=>'vi'
,p_message_text=>unistr('Ph\1EA3i ch\1EC9 \0111\1ECBnh nha\0303n bi\00EA\0309u \0111\00F4\0300.')
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144176331416752929)
,p_name=>'APEXIR_CHART_MAX_DATAPOINT_CNT'
,p_message_language=>'vi'
,p_message_text=>unistr('Truy v\00E2\0301n cu\0309a ba\0323n v\01B0\01A1\0323t qua\0301 s\00F4\0301 \0111i\00EA\0309m d\01B0\0303 li\00EA\0323u t\00F4\0301i \0111a la\0300 %0 tr\00EAn m\00F4\0303i bi\00EA\0309u \0111\00F4\0300. Ha\0303y a\0301p du\0323ng b\00F4\0323 lo\0323c \0111\00EA\0309 gia\0309m s\00F4\0301 l\01B0\01A1\0323ng d\01B0\0303 li\00EA\0323u trong truy v\00E2\0301n c\01A1 s\01A1\0309 cu\0309a ba\0323n.')
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144175211843752929)
,p_name=>'APEXIR_CHART_MAX_ROW_CNT'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('S\00F4\0301 l\01B0\01A1\0323ng ha\0300ng t\00F4\0301i \0111a cho m\00F4\0323t truy v\00E2\0301n Bi\00EA\0309u \0111\00F4\0300 se\0303 gi\01A1\0301i ha\0323n s\00F4\0301 l\01B0\01A1\0323ng ha\0300ng trong truy v\00E2\0301n c\01A1 s\01A1\0309, ch\01B0\0301 kh\00F4ng pha\0309i s\00F4\0301 l\01B0\01A1\0323ng ha\0300ng hi\00EA\0309n thi\0323.  '),
unistr('Truy v\00E2\0301n c\01A1 s\01A1\0309 cu\0309a ba\0323n v\01B0\01A1\0323t qua\0301 s\00F4\0301 l\01B0\01A1\0323ng ha\0300ng t\00F4\0301i \0111a la\0300 %0. Ha\0303y a\0301p du\0323ng b\00F4\0323 lo\0323c \0111\00EA\0309 gia\0309m s\00F4\0301 l\01B0\01A1\0323ng d\01B0\0303 li\00EA\0323u trong truy v\00E2\0301n c\01A1 s\01A1\0309 cu\0309a ba\0323n.')))
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144092880531752904)
,p_name=>'APEXIR_CHART_TYPE'
,p_message_language=>'vi'
,p_message_text=>unistr('Loa\0323i bi\00EA\0309u \0111\00F4\0300')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144056789690752893)
,p_name=>'APEXIR_CHART_VIEW_OF'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\00EA\0301 \0111\00F4\0323 xem bi\00EA\0309u \0111\00F4\0300 cu\0309a %0')
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144171968249752928)
,p_name=>'APEXIR_CHECK_ALL'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho\0323n t\00E2\0301t ca\0309')
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144110453213752909)
,p_name=>'APEXIR_CHOOSE_DOWNLOAD_FORMAT'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho\0323n \0111i\0323nh da\0323ng ba\0301o ca\0301o')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144118299479752912)
,p_name=>'APEXIR_CLEAR'
,p_message_language=>'vi'
,p_message_text=>unistr('xo\0301a')
,p_version_scn=>2705848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144089747950752903)
,p_name=>'APEXIR_COLUMN'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00F4\0323t')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144129506580752915)
,p_name=>'APEXIR_COLUMNS'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00F4\0323t')
,p_is_js_message=>true
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144096750919752905)
,p_name=>'APEXIR_COLUMN_ALIASES'
,p_message_language=>'vi'
,p_message_text=>unistr('Bi\0301 danh c\00F4\0323t')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144204309108752938)
,p_name=>'APEXIR_COLUMN_FILTER'
,p_message_language=>'vi'
,p_message_text=>unistr('L\1ECDc...')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144064590302752896)
,p_name=>'APEXIR_COLUMN_HEADER'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\00EAu \0111\00EA\0300 c\00F4\0323t')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144078615643752900)
,p_name=>'APEXIR_COLUMN_HEADER_ACTIONS'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0300nh \0111\00F4\0323ng \0111\00F4\0301i v\01A1\0301i c\00F4\0323t')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144078971836752900)
,p_name=>'APEXIR_COLUMN_HEADER_ACTIONS_FOR'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0300nh \0111\00F4\0323ng \0111\00F4\0301i v\01A1\0301i c\00F4\0323t "%0"')
,p_is_js_message=>true
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144120336829752912)
,p_name=>'APEXIR_COLUMN_HEADING_MENU'
,p_message_language=>'vi'
,p_message_text=>unistr('Tri\0300nh \0111\01A1n ti\00EAu \0111\00EA\0300 c\00F4\0323t')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144124016676752914)
,p_name=>'APEXIR_COLUMN_INFO'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\00F4ng tin c\00F4\0323t')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144206652999752938)
,p_name=>'APEXIR_COLUMN_LABEL'
,p_message_language=>'vi'
,p_message_text=>unistr('Nha\0303n c\00F4\0323t')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144121722841752913)
,p_name=>'APEXIR_COLUMN_N'
,p_message_language=>'vi'
,p_message_text=>unistr('C\1ED9t %0')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144104629512752908)
,p_name=>'APEXIR_COMPARISON_CONTAINS'
,p_message_language=>'vi'
,p_message_text=>unistr('ch\01B0\0301a')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144105987440752908)
,p_name=>'APEXIR_COMPARISON_DOESNOT_CONTAIN'
,p_message_language=>'vi'
,p_message_text=>unistr('kh\00F4ng ch\01B0\0301a')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144088286766752903)
,p_name=>'APEXIR_COMPARISON_IN'
,p_message_language=>'vi'
,p_message_text=>unistr('thu\00F4\0323c')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144106158936752908)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_LAST'
,p_message_language=>'vi'
,p_message_text=>unistr('kh\00F4ng di\00EA\0303n ra trong th\01A1\0300i gian qua')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144115236603752911)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_NEXT'
,p_message_language=>'vi'
,p_message_text=>unistr('kh\00F4ng di\00EA\0303n ra trong th\01A1\0300i gian t\01A1\0301i')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144106026204752908)
,p_name=>'APEXIR_COMPARISON_IS_IN_LAST'
,p_message_language=>'vi'
,p_message_text=>unistr('trong th\01A1\0300i gian qua')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144115142936752911)
,p_name=>'APEXIR_COMPARISON_IS_IN_NEXT'
,p_message_language=>'vi'
,p_message_text=>unistr('trong th\01A1\0300i gian t\01A1\0301i')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144088162402752903)
,p_name=>'APEXIR_COMPARISON_IS_NOT_NULL'
,p_message_language=>'vi'
,p_message_text=>unistr('kh\00F4ng bi\0323 r\00F4\0303ng')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144088058027752903)
,p_name=>'APEXIR_COMPARISON_IS_NULL'
,p_message_language=>'vi'
,p_message_text=>unistr('bi\0323 r\1ED7ng')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144087808503752903)
,p_name=>'APEXIR_COMPARISON_LIKE'
,p_message_language=>'vi'
,p_message_text=>unistr('gi\00F4\0301ng')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144088338828752903)
,p_name=>'APEXIR_COMPARISON_NOT_IN'
,p_message_language=>'vi'
,p_message_text=>unistr('kh\00F4ng thu\00F4\0323c')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144087941128752903)
,p_name=>'APEXIR_COMPARISON_NOT_LIKE'
,p_message_language=>'vi'
,p_message_text=>unistr('kh\00F4ng gi\00F4\0301ng')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144104917509752908)
,p_name=>'APEXIR_COMPARISON_REGEXP_LIKE'
,p_message_language=>'vi'
,p_message_text=>unistr('kh\01A1\0301p v\01A1\0301i bi\00EA\0309u th\01B0\0301c chi\0301nh quy')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144110337598752909)
,p_name=>'APEXIR_COMPUTATION'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\0301nh toa\0301n')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144174990134752929)
,p_name=>'APEXIR_COMPUTATION_EXPRESSION'
,p_message_language=>'vi'
,p_message_text=>unistr('Bi\00EA\0309u th\01B0\0301c ti\0301nh')
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144129893845752915)
,p_name=>'APEXIR_COMPUTATION_FOOTER'
,p_message_language=>'vi'
,p_message_text=>unistr('Ta\0323o phe\0301p ti\0301nh b\0103\0300ng bi\0301 danh c\00F4\0323t.')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144129947966752915)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E1'
,p_message_language=>'vi'
,p_message_text=>'(B+C)*100'
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144130010189752915)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E2'
,p_message_language=>'vi'
,p_message_text=>'INITCAP(B)||'', ''||INITCAP(C)'
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144130132017752915)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E3'
,p_message_language=>'vi'
,p_message_text=>'CASE WHEN A = 10 THEN B + C ELSE B END'
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144071017902752898)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E4'
,p_message_language=>'vi'
,p_message_text=>'ROUND(C / 1000000)'
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144114508497752911)
,p_name=>'APEXIR_COMPUTE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\0301nh toa\0301n')
,p_is_js_message=>true
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144122371263752913)
,p_name=>'APEXIR_CONTROL_BREAK'
,p_message_language=>'vi'
,p_message_text=>unistr('D\00E2\0301u ng\0103\0301t \0111i\00EA\0300u khi\00EA\0309n')
,p_is_js_message=>true
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144125331411752914)
,p_name=>'APEXIR_CONTROL_BREAKS'
,p_message_language=>'vi'
,p_message_text=>unistr('D\00E2\0301u ng\0103\0301t \0111i\00EA\0300u khi\00EA\0309n')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144211962805752940)
,p_name=>'APEXIR_CONTROL_BREAK_COLUMNS'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00F4\0323t d\00E2\0301u ng\0103\0301t \0111i\00EA\0300u khi\00EA\0309n')
,p_version_scn=>2705865
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144067712565752897)
,p_name=>'APEXIR_COUNT_DISTINCT'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\00EA\0301m gia\0301 tri\0323 ri\00EAng bi\00EA\0323t')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144210451746752939)
,p_name=>'APEXIR_COUNT_DISTINCT_X'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\00EA\0301m gia\0301 tri\0323 ri\00EAng bi\00EA\0323t')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144210329449752939)
,p_name=>'APEXIR_COUNT_X'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\1EBFm %0')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144183388720752931)
,p_name=>'APEXIR_DAILY'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0300ng nga\0300y')
,p_version_scn=>2705858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144236670512752947)
,p_name=>'APEXIR_DATA'
,p_message_language=>'vi'
,p_message_text=>unistr('D\1EEF li\1EC7u')
,p_is_js_message=>true
,p_version_scn=>2705870
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144124151819752914)
,p_name=>'APEXIR_DATA_AS_OF'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0301o ca\0301o d\01B0\0303 li\00EA\0323u k\00EA\0309 t\01B0\0300 %0 phu\0301t tr\01B0\01A1\0301c.')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144057180502752894)
,p_name=>'APEXIR_DATA_VIEW_OF'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\00EA\0301 \0111\00F4\0323 xem d\01B0\0303 li\00EA\0323u cu\0309a %0')
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144093565120752904)
,p_name=>'APEXIR_DATE'
,p_message_language=>'vi'
,p_message_text=>unistr('Nga\0300y')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144128054091752915)
,p_name=>'APEXIR_DEFAULT'
,p_message_language=>'vi'
,p_message_text=>unistr('M\0103\0323c \0111i\0323nh')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144207524421752939)
,p_name=>'APEXIR_DEFAULT_REPORT_TYPE'
,p_message_language=>'vi'
,p_message_text=>unistr('Loa\0323i ba\0301o ca\0301o m\0103\0323c \0111i\0323nh')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144089927578752903)
,p_name=>'APEXIR_DELETE'
,p_message_language=>'vi'
,p_message_text=>unistr('Xo\0301a')
,p_is_js_message=>true
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144093874486752905)
,p_name=>'APEXIR_DELETE_CONFIRM'
,p_message_language=>'vi'
,p_message_text=>unistr('B\1EA1n c\00F3 mu\1ED1n x\00F3a c\00E1c c\00E0i \0111\1EB7t b\00E1o c\00E1o n\00E0y kh\00F4ng?')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144194391584752935)
,p_name=>'APEXIR_DELETE_DEFAULT_REPORT'
,p_message_language=>'vi'
,p_message_text=>unistr('Xo\0301a ba\0301o ca\0301o m\0103\0323c \0111i\0323nh')
,p_is_js_message=>true
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144122077009752913)
,p_name=>'APEXIR_DELETE_REPORT'
,p_message_language=>'vi'
,p_message_text=>unistr('Xo\0301a ba\0301o ca\0301o')
,p_is_js_message=>true
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144088604310752903)
,p_name=>'APEXIR_DESCENDING'
,p_message_language=>'vi'
,p_message_text=>unistr('Gia\0309m d\00E2\0300n')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144096266140752905)
,p_name=>'APEXIR_DESCRIPTION'
,p_message_language=>'vi'
,p_message_text=>unistr('M\00F4 ta\0309')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144120220803752912)
,p_name=>'APEXIR_DETAIL_VIEW'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\00EA\0301 \0111\00F4\0323 xem m\00F4\0323t h\00E0ng')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144128547754752915)
,p_name=>'APEXIR_DIRECTION'
,p_message_language=>'vi'
,p_message_text=>unistr('H\01B0\1EDBng %0')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144129426690752915)
,p_name=>'APEXIR_DISABLED'
,p_message_language=>'vi'
,p_message_text=>unistr('Bi\0323 v\00F4 hi\00EA\0323u ho\0301a')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144089445462752903)
,p_name=>'APEXIR_DISPLAYED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 hi\00EA\0309n thi\0323')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144092639671752904)
,p_name=>'APEXIR_DISPLAYED_COLUMNS'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00F4\0323t \0111a\0303 hi\00EA\0309n thi\0323')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144128444427752915)
,p_name=>'APEXIR_DISPLAY_IN_REPORT'
,p_message_language=>'vi'
,p_message_text=>unistr('Hi\00EA\0309n thi\0323 trong ba\0301o ca\0301o')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144123274370752913)
,p_name=>'APEXIR_DOWN'
,p_message_language=>'vi'
,p_message_text=>unistr('Xu\00F4\0301ng')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144114601885752911)
,p_name=>'APEXIR_DOWNLOAD'
,p_message_language=>'vi'
,p_message_text=>unistr('Ta\0309i xu\00F4\0301ng')
,p_is_js_message=>true
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144128395899752915)
,p_name=>'APEXIR_DO_NOT_DISPLAY'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng hi\00EA\0309n thi\0323')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144197679578752936)
,p_name=>'APEXIR_DUPLICATE_HIGHLIGHT_COND'
,p_message_language=>'vi'
,p_message_text=>unistr('Ph\00E2\0300n \0111a\0301nh d\00E2\0301u co\0301 cu\0300ng \0111i\00EA\0300u ki\00EA\0323n \0111a\0303 t\00F4\0300n ta\0323i.')
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144212136281752940)
,p_name=>'APEXIR_DUPLICATE_PIVOT_COLUMN'
,p_message_language=>'vi'
,p_message_text=>unistr('C\1ED9t ba\0309ng t\00F4\0309ng h\01A1\0323p bi\0323 tr\00F9ng l\1EB7p. Danh s\00E1ch c\1ED9t ba\0309ng t\00F4\0309ng h\01A1\0323p ph\1EA3i l\00E0 duy nh\1EA5t.')
,p_version_scn=>2705865
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144212396074752940)
,p_name=>'APEXIR_EDIT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\1EC9nh s\1EEDa')
,p_version_scn=>2705865
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144124379987752914)
,p_name=>'APEXIR_EDIT_CHART'
,p_message_language=>'vi'
,p_message_text=>unistr('Chi\0309nh s\01B0\0309a ca\0300i \0111\0103\0323t bi\00EA\0309u \0111\00F4\0300')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144130905149752916)
,p_name=>'APEXIR_EDIT_CHART2'
,p_message_language=>'vi'
,p_message_text=>unistr('Chi\0309nh s\01B0\0309a bi\00EA\0309u \0111\00F4\0300')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144094868166752905)
,p_name=>'APEXIR_EDIT_CONTROL_BREAK'
,p_message_language=>'vi'
,p_message_text=>unistr('Chi\0309nh s\01B0\0309a d\00E2\0301u ng\0103\0301t \0111i\00EA\0300u khi\00EA\0309n')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144131309974752916)
,p_name=>'APEXIR_EDIT_FILTER'
,p_message_language=>'vi'
,p_message_text=>unistr('Chi\0309nh s\01B0\0309a b\00F4\0323 lo\0323c')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144097845336752906)
,p_name=>'APEXIR_EDIT_FLASHBACK'
,p_message_language=>'vi'
,p_message_text=>unistr('Chi\0309nh s\01B0\0309a mu\0323c h\00F4\0300i t\01B0\01A1\0309ng')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144189120226752933)
,p_name=>'APEXIR_EDIT_GROUP_BY'
,p_message_language=>'vi'
,p_message_text=>unistr('Chi\0309nh s\01B0\0309a mu\0323c ph\00E2n nh\00F3m theo')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144131289022752916)
,p_name=>'APEXIR_EDIT_HIGHLIGHT'
,p_message_language=>'vi'
,p_message_text=>unistr('Chi\0309nh s\01B0\0309a ph\00E2\0300n \0111a\0301nh d\00E2\0301u')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144159290169752924)
,p_name=>'APEXIR_EDIT_PIVOT'
,p_message_language=>'vi'
,p_message_text=>unistr('Chi\0309nh s\01B0\0309a ba\0309ng t\00F4\0309ng h\01A1\0323p')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144118646001752912)
,p_name=>'APEXIR_EDIT_REPORT'
,p_message_language=>'vi'
,p_message_text=>unistr('Chi\0309nh s\01B0\0309a ba\0301o ca\0301o')
,p_version_scn=>2705848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144207875434752939)
,p_name=>'APEXIR_EMAIL'
,p_message_language=>'vi'
,p_message_text=>'Email'
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144080037356752900)
,p_name=>'APEXIR_EMAIL_ADDRESS'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110i\0323a chi\0309 email')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144208186194752939)
,p_name=>'APEXIR_EMAIL_BCC'
,p_message_language=>'vi'
,p_message_text=>'Bcc'
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144208344847752939)
,p_name=>'APEXIR_EMAIL_BODY'
,p_message_language=>'vi'
,p_message_text=>unistr('N\00F4\0323i dung')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144208096300752939)
,p_name=>'APEXIR_EMAIL_CC'
,p_message_language=>'vi'
,p_message_text=>'Cc'
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144208855891752939)
,p_name=>'APEXIR_EMAIL_FREQUENCY'
,p_message_language=>'vi'
,p_message_text=>unistr('T\1EA7n su\1EA5t')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144085222139752902)
,p_name=>'APEXIR_EMAIL_NOT_CONFIGURED'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\01B0a \0111i\0323nh c\00E2\0301u hi\0300nh email cho \01B0\0301ng du\0323ng na\0300y.  Ha\0303y li\00EAn h\00EA\0323 ng\01B0\1EDDi qu\1EA3n tr\1ECB.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144182678513752931)
,p_name=>'APEXIR_EMAIL_REQUIRED'
,p_message_language=>'vi'
,p_message_text=>unistr('Ph\1EA3i ch\1EC9 \0111\1ECBnh \0111i\0323a chi\0309 email.')
,p_version_scn=>2705858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144208402927752939)
,p_name=>'APEXIR_EMAIL_SEE_ATTACHED'
,p_message_language=>'vi'
,p_message_text=>unistr('Xem ph\00E2\0300n \0111i\0301nh ke\0300m')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144208249940752939)
,p_name=>'APEXIR_EMAIL_SUBJECT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\00EAu \0111\00EA\0300')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144183696887752931)
,p_name=>'APEXIR_EMAIL_SUBJECT_REQUIRED'
,p_message_language=>'vi'
,p_message_text=>unistr('Ph\1EA3i ch\1EC9 \0111\1ECBnh ti\00EAu \0111\00EA\0300 email.')
,p_version_scn=>2705858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144207950371752939)
,p_name=>'APEXIR_EMAIL_TO'
,p_message_language=>'vi'
,p_message_text=>unistr('Ng\01B0\01A1\0300i nh\00E2\0323n')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144087024456752903)
,p_name=>'APEXIR_ENABLED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 k\00EDch ho\1EA1t')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144131169689752916)
,p_name=>'APEXIR_ENABLE_DISABLE_ALT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ki\0301ch hoa\0323t/V\00F4 hi\00EA\0323u ho\0301a')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144130686362752916)
,p_name=>'APEXIR_ERROR_LANDMARK'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i! %0')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144130234474752915)
,p_name=>'APEXIR_EXAMPLES'
,p_message_language=>'vi'
,p_message_text=>unistr('Vi\0301 du\0323')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144131038970752916)
,p_name=>'APEXIR_EXAMPLES_WITH_COLON'
,p_message_language=>'vi'
,p_message_text=>unistr('Vi\0301 du\0323:')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144092515501752904)
,p_name=>'APEXIR_EXCLUDE_NULL'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng bao g\00F4\0300m gia\0301 tri\0323 r\00F4\0303ng')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144131616712752916)
,p_name=>'APEXIR_EXPAND_COLLAPSE_ALT'
,p_message_language=>'vi'
,p_message_text=>unistr('M\01A1\0309 r\00F4\0323ng/Thu go\0323n')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144129288734752915)
,p_name=>'APEXIR_EXPRESSION'
,p_message_language=>'vi'
,p_message_text=>unistr('Bi\00EA\0309u th\01B0\0301c')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144114190124752911)
,p_name=>'APEXIR_FILTER'
,p_message_language=>'vi'
,p_message_text=>unistr('L\1ECDc')
,p_is_js_message=>true
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144125202350752914)
,p_name=>'APEXIR_FILTERS'
,p_message_language=>'vi'
,p_message_text=>unistr('B\00F4\0323 lo\0323c')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144135913500752917)
,p_name=>'APEXIR_FILTER_EXPRESSION'
,p_message_language=>'vi'
,p_message_text=>unistr('Bi\00EA\0309u th\01B0\0301c lo\0323c')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144234110023752946)
,p_name=>'APEXIR_FILTER_EXPR_TOO_LONG'
,p_message_language=>'vi'
,p_message_text=>unistr('Bi\00EA\0309u th\01B0\0301c lo\0323c qua\0301 da\0300i.')
,p_version_scn=>2705869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144078829919752900)
,p_name=>'APEXIR_FILTER_SUGGESTIONS'
,p_message_language=>'vi'
,p_message_text=>unistr('G\1EE3i \00FD b\1ED9 l\1ECDc')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144135873650752917)
,p_name=>'APEXIR_FILTER_TYPE'
,p_message_language=>'vi'
,p_message_text=>unistr('Loa\0323i b\1ED9 lo\0323c')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144131830862752916)
,p_name=>'APEXIR_FINDER_ALT'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho\0323n c\00F4\0323t \0111\00EA\0309 ti\0300m ki\00EA\0301m')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144114462673752911)
,p_name=>'APEXIR_FLASHBACK'
,p_message_language=>'vi'
,p_message_text=>unistr('H\00F4\0300i t\01B0\01A1\0309ng')
,p_is_js_message=>true
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144129070045752915)
,p_name=>'APEXIR_FLASHBACK_DESCRIPTION'
,p_message_language=>'vi'
,p_message_text=>unistr('Truy v\1EA5n h\1ED3i t\01B0\1EDFng cho ph\00E9p b\1EA1n xem d\1EEF li\1EC7u nh\01B0 \0111a\0303 t\1ED3n t\1EA1i \1EDF th\1EDDi \0111i\1EC3m tr\01B0\1EDBc \0111\00F3.')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144183094760752931)
,p_name=>'APEXIR_FLASHBACK_LABEL'
,p_message_language=>'vi'
,p_message_text=>unistr('Khoa\0309ng th\1EDDi gian h\1ED3i t\01B0\1EDFng')
,p_version_scn=>2705858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144184433122752932)
,p_name=>'APEXIR_FORMAT'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110i\0323nh da\0323ng')
,p_is_js_message=>true
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144110284483752909)
,p_name=>'APEXIR_FORMAT_MASK'
,p_message_language=>'vi'
,p_message_text=>unistr('C\1EA5u tr\00FAc \0111i\0323nh da\0323ng %0')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144121913225752913)
,p_name=>'APEXIR_FUNCTION'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0300m')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144129755175752915)
,p_name=>'APEXIR_FUNCTIONS'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0300m %0')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144207467700752939)
,p_name=>'APEXIR_FUNCTIONS_OPERATORS'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0300m/toa\0301n t\01B0\0309')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144121686643752913)
,p_name=>'APEXIR_FUNCTION_N'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0300m %0')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144113999197752911)
,p_name=>'APEXIR_GO'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110i')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144087503091752903)
,p_name=>'APEXIR_GREEN'
,p_message_language=>'vi'
,p_message_text=>unistr('xanh lu\0323c')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144132515039752916)
,p_name=>'APEXIR_GROUPBY_COLUMNS'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00F4\0323t ph\00E2n nh\00F3m theo')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144132642780752916)
,p_name=>'APEXIR_GROUPBY_FUNCTIONS'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0300m ph\00E2n nho\0301m theo')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144067803795752897)
,p_name=>'APEXIR_GROUP_BY'
,p_message_language=>'vi'
,p_message_text=>unistr('Ph\00E2n nho\0301m theo')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144208562742752939)
,p_name=>'APEXIR_GROUP_BY_COLUMN'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00F4\0323t ph\00E2n nh\00F3m theo %0')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144164092425752926)
,p_name=>'APEXIR_GROUP_BY_COL_NOT_NULL'
,p_message_language=>'vi'
,p_message_text=>unistr('Pha\0309i chi\0309 \0111i\0323nh c\00F4\0323t ph\00E2n nho\0301m theo.')
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144175193063752929)
,p_name=>'APEXIR_GROUP_BY_MAX_ROW_CNT'
,p_message_language=>'vi'
,p_message_text=>unistr('S\00F4\0301 l\01B0\01A1\0323ng ha\0300ng t\00F4\0301i \0111a cho m\00F4\0323t truy v\00E2\0301n Ph\00E2n nho\0301m theo se\0303 gi\01A1\0301i ha\0323n s\00F4\0301 l\01B0\01A1\0323ng ha\0300ng trong truy v\00E2\0301n c\01A1 s\01A1\0309, ch\01B0\0301 kh\00F4ng pha\0309i s\00F4\0301 l\01B0\01A1\0323ng ha\0300ng hi\00EA\0309n thi\0323. Truy v\00E2\0301n c\01A1 s\01A1\0309 cu\0309a ba\0323n v\01B0\01A1\0323t qua\0301 s\00F4\0301 l\01B0\01A1\0323ng ha\0300ng t\00F4\0301i \0111a la\0300 %0. Ha\0303y a\0301p du\0323ng b\00F4')
||unistr('\0323 lo\0323c \0111\00EA\0309 gia\0309m s\00F4\0301 l\01B0\01A1\0323ng d\01B0\0303 li\00EA\0323u trong truy v\00E2\0301n c\01A1 s\01A1\0309 cu\0309a ba\0323n.')
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144155374525752923)
,p_name=>'APEXIR_GROUP_BY_SORT'
,p_message_language=>'vi'
,p_message_text=>unistr('S\0103\0301p x\00EA\0301p mu\0323c ph\00E2n nh\00F3m theo')
,p_is_js_message=>true
,p_version_scn=>2705852
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144212062003752940)
,p_name=>'APEXIR_GROUP_BY_SORT_ORDER'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\01B0\0301 t\01B0\0323 s\0103\0301p x\00EA\0301p mu\0323c ph\00E2n nho\0301m theo')
,p_version_scn=>2705865
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144056938364752894)
,p_name=>'APEXIR_GROUP_BY_VIEW_OF'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\00EA\0301 \0111\00F4\0323 xem ph\00E2n nho\0301m theo cu\0309a %0')
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144092955641752904)
,p_name=>'APEXIR_HCOLUMN'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00F4\0323t ngang')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144126998945752914)
,p_name=>'APEXIR_HELP'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\01A1\0323 giu\0301p')
,p_is_js_message=>true
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144118722710752912)
,p_name=>'APEXIR_HELP_01'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('B\00E1o c\00E1o t\01B0\01A1ng t\00E1c cho ph\00E9p ng\01B0\1EDDi d\00F9ng cu\1ED1i t\00F9y ch\1EC9nh b\00E1o c\00E1o. Ng\01B0\1EDDi d\00F9ng c\00F3 th\1EC3 thay \0111\1ED5i b\1ED1 c\1EE5c d\1EEF li\1EC7u b\00E1o c\00E1o b\1EB1ng c\00E1ch ch\1ECDn c\1ED9t, \00E1p d\1EE5ng b\1ED9 l\1ECDc, \0111\00E1nh d\1EA5u v\00E0 s\1EAFp x\1EBFp. Ng\01B0\1EDDi d\00F9ng c\0169ng c\00F3 th\1EC3 x\00E1c \0111\1ECBnh c\00E1c d\00E2\0301u ng\1EAFt, ph\00E2\0300n t\00F4\0309ng h\1EE3p, bi\1EC3u \0111\1ED3, mu\0323c ph\00E2')
||unistr('n nh\00F3m theo v\00E0 th\00EAm c\00E1c ph\00E9p t\00EDnh c\1EE7a ri\00EAng mi\0300nh. Ng\01B0\1EDDi d\00F9ng c\0169ng c\00F3 th\1EC3 thi\1EBFt l\1EADp go\0301i \0111\0103ng k\00FD \0111\1EC3 phi\00EAn b\1EA3n HTML c\1EE7a b\00E1o c\00E1o s\1EBD \0111\01B0\1EE3c g\1EEDi qua email cho h\1ECD v\00E0o kho\1EA3ng th\1EDDi gian \0111\01B0\1EE3c ch\1EC9 \0111\1ECBnh. Ng\01B0\1EDDi d\00F9ng c\00F3 th\1EC3 t\1EA1o nhi\1EC1u bi\1EBFn th\1EC3 c\1EE7a m\1ED9t b\00E1o c\00E1o v\00E0 l\01B0')
||unistr('u ch\00FAng d\01B0\1EDBi d\1EA1ng b\00E1o c\00E1o \0111\01B0\1EE3c \0111\1EB7t t\00EAn \0111\1EC3 xem \01A1\0309 ch\00EA\0301 \0111\00F4\0323 c\00F4ng khai ho\1EB7c ri\00EAng t\01B0.'),
'<p/>',
unistr('C\00E1c ph\1EA7n ti\1EBFp theo t\00F3m t\1EAFt nh\01B0\0303ng c\00E1ch giu\0301p ba\0323n t\00F9y ch\1EC9nh b\00E1o c\00E1o t\01B0\01A1ng t\00E1c. \0110\1EC3 t\00ECm hi\1EC3u th\00EAm, h\00E3y xem ph\00E2\0300n "S\1EED d\1EE5ng b\00E1o c\00E1o t\01B0\01A1ng t\00E1c" trong <i>H\01B0\1EDBng d\1EABn cu\0309a Oracle APEX d\00E0nh cho ng\01B0\1EDDi d\00F9ng cu\1ED1i</i>.')))
,p_version_scn=>2705848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144125876891752914)
,p_name=>'APEXIR_HELP_ACTIONS_MENU'
,p_message_language=>'vi'
,p_message_text=>unistr('Tri\0300nh \0111\01A1n Ha\0300nh \0111\00F4\0323ng xu\00E2\0301t hi\00EA\0323n \01A1\0309 b\00EAn pha\0309i nu\0301t \0110i tr\00EAn thanh Ti\0300m ki\00EA\0301m. Ha\0303y s\01B0\0309 du\0323ng tri\0300nh \0111\01A1n na\0300y \0111\00EA\0309 tu\0300y chi\0309nh m\00F4\0323t ba\0301o ca\0301o t\01B0\01A1ng ta\0301c.')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144119523098752912)
,p_name=>'APEXIR_HELP_AGGREGATE'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('T\1ED5ng h\1EE3p l\00E0 c\00E1c ph\00E9p t\00EDnh to\00E1n h\1ECDc \0111\01B0\1EE3c th\1EF1c hi\1EC7n \0111\1ED1i v\1EDBi m\1ED9t c\1ED9t. C\00E1c mu\0323c t\1ED5ng h\1EE3p hi\1EC3n th\1ECB sau m\1ED7i d\00E2\0301u ng\1EAFt \0111i\1EC1u khi\1EC3n v\00E0 \1EDF cu\1ED1i b\00E1o c\00E1o trong c\1ED9t m\00E0 ch\00FAng \0111\01B0\1EE3c x\00E1c \0111\1ECBnh. C\00E1c t\00F9y ch\1ECDn bao g\00F4\0300m:'),
'<p>',
'</p><ul>',
unistr('<li><strong>Mu\0323c t\00F4\0309ng h\1EE3p</strong> cho ph\00E9p b\1EA1n ch\1ECDn mu\0323c t\00E2\0323p h\01A1\0323p'),
unistr('\0111a\0303 x\00E1c \0111\1ECBnh tr\01B0\01A1\0301c \0111o\0301 \0111\1EC3 ch\1EC9nh s\1EEDa.</li>'),
unistr('<li><strong>H\00E0m</strong> l\00E0 h\00E0m c\1EA7n th\1EF1c hi\1EC7n (v\00ED d\1EE5: SUM, MIN).</li>'),
unistr('<li><strong>C\1ED9t</strong> du\0300ng \0111\1EC3 ch\1ECDn c\1ED9t se\0303 \0111\01B0\01A1\0323c \00E1p h\00E0m to\00E1n h\1ECDc. Ch\1EC9 ca\0301c c\00F4\0323t'),
unistr('s\00F4\0301 m\01A1\0301i hi\1EC3n th\1ECB.</li>'),
'</ul>'))
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144119615142752912)
,p_name=>'APEXIR_HELP_CHART'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('B\1EA1n c\00F3 th\1EC3 x\00E1c \0111\1ECBnh m\1ED9t bi\1EC3u \0111\1ED3 cho m\1ED7i b\00E1o c\00E1o \0111a\0303 l\01B0u. Sau khi'),
unistr('x\00E1c \0111\1ECBnh, b\1EA1n c\00F3 th\1EC3 chuy\1EC3n \0111\1ED5i gi\1EEFa ca\0301c ch\1EBF \0111\1ED9 xem bi\1EC3u \0111\1ED3 v\00E0 b\00E1o c\00E1o b\1EB1ng c\00E1ch s\1EED d\1EE5ng ca\0301c bi\1EC3u t\01B0\1EE3ng ch\1EBF \0111\1ED9 xem trong thanh T\00ECm ki\1EBFm.'),
unistr('C\00E1c t\00F9y ch\1ECDn bao g\00F4\0300m:'),
'<p>',
'</p><ul>',
unistr('<li><strong>Lo\1EA1i bi\1EC3u \0111\1ED3</strong> x\00E1c \0111\1ECBnh lo\1EA1i bi\1EC3u \0111\1ED3 c\1EA7n \0111\01B0a v\00E0o.'),
unistr('Ch\1ECDn trong s\00F4\0301 ca\0301c loa\0323i sau: thanh ngang, thanh d\1ECDc, h\00ECnh tr\00F2n ho\1EB7c \0111\01B0\1EDDng.</li>'),
'',
unistr('\005C<li><strong>Nh\00E3n</strong> cho ph\00E9p b\1EA1n ch\1ECDn c\1ED9t s\1EBD d\00F9ng l\00E0m nh\00E3n.</li>'),
unistr('<li><strong>Ti\00EAu \0111\1EC1 tr\1EE5c cho nh\00E3n</strong> l\00E0 ti\00EAu \0111\1EC1 hi\1EC3n th\1ECB tr\00EAn tr\1EE5c li\00EAn k\1EBFt v\1EDBi c\1ED9t \0111\01B0\1EE3c ch\1ECDn cho'),
unistr('Nh\00E3n. Tu\0300y cho\0323n n\00E0y kh\00F4ng kha\0309 du\0323ng cho bi\1EC3u \0111\1ED3 h\00ECnh tr\00F2n.</li>'),
unistr('<li><strong>Gi\00E1 tr\1ECB</strong> cho ph\00E9p b\1EA1n ch\1ECDn c\1ED9t c\00E2\0300n du\0300ng l\00E0m gi\00E1 tr\1ECB. N\1EBFu ha\0300m c\1EE7a b\1EA1n'),
unistr('l\00E0 COUNT, ba\0323n kh\00F4ng c\1EA7n ph\1EA3i ch\1ECDn Gi\00E1 tr\1ECB.</li>'),
unistr('<li><strong>Ti\00EAu \0111\1EC1 tr\1EE5c cho gi\00E1 tr\1ECB</strong> l\00E0 ti\00EAu \0111\1EC1 hi\1EC3n th\1ECB tr\00EAn tr\1EE5c li\00EAn k\1EBFt v\1EDBi c\1ED9t \0111\01B0\1EE3c ch\1ECDn cho'),
unistr('Gi\00E1 tr\1ECB. Tu\0300y cho\0323n n\00E0y kh\00F4ng kha\0309 du\0323ng cho bi\1EC3u \0111\1ED3 h\00ECnh tr\00F2n.</li>'),
unistr('<li><strong>H\00E0m</strong> l\00E0 m\1ED9t h\00E0m t\00F9y ch\1ECDn se\0303 th\1EF1c hi\1EC7n tr\00EAn c\1ED9t \0111\01B0\1EE3c ch\1ECDn cho Gi\00E1 tr\1ECB.</li>'),
unistr('<li><strong>S\1EAFp x\1EBFp</strong> cho ph\00E9p b\1EA1n s\1EAFp x\1EBFp loa\0323t k\1EBFt qu\1EA3 c\1EE7a m\00ECnh.</li></ul>')))
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144118911133752912)
,p_name=>'APEXIR_HELP_COLUMN_HEADING_MENU'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('M\00F4\0323t tri\0300nh \0111\01A1n ti\00EAu \0111\00EA\0300 c\00F4\0323t se\0303 hi\00EA\0309n thi\0323 khi ba\0323n nh\00E2\0301p va\0300o ti\00EAu \0111\00EA\0300 c\00F4\0323t b\00E2\0301t ky\0300. Ca\0301c tu\0300y cho\0323n bao g\00F4\0300m:'),
'<p></p>',
'<ul>',
unistr('Bi\00EA\0309u t\01B0\01A1\0323ng <li><strong>S\0103\0301p x\00EA\0301p theo th\01B0\0301 t\01B0\0323 t\0103ng d\00E2\0300n</strong> se\0303 s\0103\0301p x\00EA\0301p ba\0301o ca\0301o theo th\01B0\0301 t\01B0\0323 c\00F4\0323t t\0103ng d\00E2\0300n.</li>'),
unistr('Bi\00EA\0309u t\01B0\01A1\0323ng <li><strong>S\0103\0301p x\00EA\0301p theo th\01B0\0301 t\01B0\0323 gia\0309m d\00E2\0300n</strong> se\0303 s\0103\0301p x\00EA\0301p ba\0301o ca\0301o theo th\01B0\0301 t\01B0\0323 c\00F4\0323t gia\0309m d\00E2\0300n.</li>'),
unistr('<li><strong>\00C2\0309n c\00F4\0323t</strong> se\0303 \00E2\0309n c\00F4\0323t. Kh\00F4ng pha\0309i c\00F4\0323t na\0300o cu\0303ng \00E2\0309n \0111\01B0\01A1\0323c. N\00EA\0301u kh\00F4ng th\00EA\0309 \00E2\0309n m\00F4\0323t c\00F4\0323t, se\0303 kh\00F4ng co\0301 bi\00EA\0309u t\01B0\01A1\0323ng \00C2\0309n c\00F4\0323t.</li>'),
unistr('<li><strong>Ng\0103\0301t c\00F4\0323t</strong> se\0303 ta\0323o m\00F4\0323t nho\0301m d\00E2\0301u ng\0103\0301t \01A1\0309 tr\00EAn c\00F4\0323t. Thao ta\0301c na\0300y se\0303 ke\0301o c\00F4\0323t ra kho\0309i ba\0301o ca\0301o d\01B0\01A1\0301i da\0323ng d\01B0\0303 li\00EA\0323u chi\0301nh.</li>'),
unistr('<li><strong>Th\00F4ng tin v\00EA\0300 c\00F4\0323t</strong> se\0303 hi\00EA\0309n thi\0323 v\0103n ba\0309n tr\01A1\0323 giu\0301p v\00EA\0300 c\00F4\0323t, n\00EA\0301u co\0301.</li>'),
unistr('<li><strong>Vu\0300ng v\0103n ba\0309n</strong> \0111\01B0\01A1\0323c du\0300ng \0111\00EA\0309 nh\00E2\0323p ca\0301c ti\00EAu chi\0301 ti\0300m ki\00EA\0301m kh\00F4ng ph\00E2n bi\1EC7t ch\1EEF hoa ch\1EEF th\01B0\1EDDng'),
unistr('(kh\00F4ng c\00E2\0300n thi\00EA\0301t \0111\00F4\0301i v\01A1\0301i ky\0301 t\01B0\0323 \0111a\0323i di\00EA\0323n). Vi\00EA\0323c nh\00E2\0323p m\00F4\0323t gia\0301 tri\0323 se\0303 la\0300m gia\0309m danh sa\0301ch'),
unistr('gia\0301 tri\0323 \01A1\0309 cu\00F4\0301i tri\0300nh \0111\01A1n. Sau \0111o\0301, ba\0323n co\0301 th\00EA\0309 cho\0323n m\00F4\0323t gia\0301 tri\0323 t\01B0\0300'),
unistr('d\01B0\01A1\0301i cu\0300ng va\0300 gia\0301 tri\0323 \0111a\0303 cho\0323n se\0303 \0111\01B0\01A1\0323c ta\0323o la\0300m b\00F4\0323 lo\0323c b\0103\0300ng d\00E2\0301u ''='''),
unistr('(vi\0301 du\0323: <code>column = ''ABC''</code>). Ho\0103\0323c ba\0323n co\0301 th\00EA\0309 nh\00E2\0301p va\0300o bi\00EA\0309u t\01B0\01A1\0323ng \0110e\0300n pin r\00F4\0300i nh\00E2\0323p m\00F4\0323t gia\0301 tri\0323 c\00E2\0300n ta\0323o la\0300m b\00F4\0323 lo\0323c b\0103\0300ng b\00F4\0309 ng\01B0\0303 ''LIKE'''),
unistr('(vi\0301 du\0323: <code>column LIKE ''%ABC%''</code>).</li>'),
unistr('<li><strong>Danh sa\0301ch gia\0301 tri\0323 duy nh\00E2\0301t</strong> ch\01B0\0301a 500 gia\0301 tri\0323 duy nh\00E2\0301t \0111\00E2\0300u ti\00EAn'),
unistr('\0111a\0301p \01B0\0301ng ca\0301c ti\00EAu chi\0301 b\00F4\0323 lo\0323c cu\0309a ba\0323n. N\00EA\0301u c\00F4\0323t la\0300 nga\0300y, m\00F4\0323t danh sa\0301ch khoa\0309ng'),
unistr('nga\0300y se\0303 hi\00EA\0309n thi\0323. N\00EA\0301u ba\0323n cho\0323n m\00F4\0323t gia\0301 tri\0323, m\00F4\0323t b\00F4\0323 lo\0323c se\0303 \0111\01B0\01A1\0323c'),
unistr('ta\0323o b\0103\0300ng d\00E2\0301u ''='' (vi\0301 du\0323: <code>column = ''ABC''</code>).</li>'),
'</ul>'))
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144119430024752912)
,p_name=>'APEXIR_HELP_COMPUTE'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Cho ph\00E9p b\1EA1n th\00EAm c\00E1c c\1ED9t \0111\01B0\1EE3c t\00EDnh to\00E1n v\00E0o b\00E1o c\00E1o c\1EE7a m\00ECnh. \0110\00E2y c\00F3 th\1EC3 l\00E0 c\00E1c ph\00E9p t\00EDnh to\00E1n h\1ECDc (v\00ED d\1EE5: <code>NBR_HOURS/24</code>) ho\1EB7c c\00E1c h\00E0m ti\00EAu chu\1EA9n'),
unistr('cu\0309a Oracle \00E1p d\1EE5ng cho nh\01B0\0303ng c\1ED9t hi\1EC7n c\00F3. M\1ED9t s\1ED1 c\00F4\0323t hi\1EC3n th\1ECB d\01B0\1EDBi d\1EA1ng v\00ED d\1EE5 v\00E0 m\1ED9t s\1ED1 kh\00E1c (ch\1EB3ng h\1EA1n nh\01B0 <code>TO_DATE)</code> c\0169ng c\00F3 th\1EC3 \0111\01B0\1EE3c s\1EED d\1EE5ng). C\00E1c t\00F9y ch\1ECDn bao g\00F4\0300m:'),
'<p></p>',
'<ul>',
unistr('<li><strong>Phe\0301p t\00EDnh</strong> cho ph\00E9p b\1EA1n ch\1ECDn m\1ED9t ph\00E9p t\00EDnh \0111\01B0\1EE3c x\00E1c \0111\1ECBnh tr\01B0\1EDBc \0111\00F3 \0111\1EC3 ch\1EC9nh s\1EEDa.</li>'),
unistr('<li><strong>Ti\00EAu \0111\1EC1 c\1ED9t</strong> l\00E0 ti\00EAu \0111\1EC1 c\1ED9t cho c\1ED9t m\1EDBi.</li>'),
unistr('<li><strong>C\00E2\0301u tru\0301c \0111\1ECBnh d\1EA1ng</strong> l\00E0 c\00E2\0301u tru\0301c \0111\1ECBnh d\1EA1ng cu\0309a Oracle \0111\01B0\1EE3c \00E1p d\1EE5ng cho c\1ED9t (v\00ED d\1EE5: S9999).</li>'),
unistr('<li><strong>Phe\0301p t\00EDnh</strong> l\00E0 ph\00E9p t\00EDnh se\0303 \0111\01B0\1EE3c th\1EF1c hi\1EC7n. Trong qu\00E1 tr\00ECnh t\00EDnh to\00E1n, c\00E1c c\1ED9t \0111\01B0\1EE3c tham chi\1EBFu b\1EB1ng b\00ED danh \0111\01B0\1EE3c hi\1EC3n th\1ECB.</li>'),
'</ul>',
unistr('<p>B\00EAn d\01B0\1EDBi phe\0301p t\00EDnh, c\00E1c c\1ED9t trong truy v\1EA5n c\1EE7a b\1EA1n se\0303 hi\1EC3n th\1ECB v\1EDBi'),
unistr('b\00ED danh \0111\01B0\01A1\0323c li\00EAn k\00EA\0301t. Vi\00EA\0323c nh\00E2\0301p v\00E0o t\00EAn c\1ED9t ho\1EB7c b\00ED danh se\0303 \0111\01B0a'),
unistr('ch\00FAng va\0300o phe\0301p t\00EDnh. B\00EAn c\1EA1nh C\1ED9t l\00E0 b\00E0n ph\00EDm s\00F4\0301. B\00E0n ph\00EDm s\00F4\0301 n\00E0y co\0301 ta\0301c du\0323ng nh\01B0'),
unistr('m\00F4\0323t l\1ED1i t\1EAFt \0111\1EBFn c\00E1c ph\00EDm th\01B0\1EDDng d\00F9ng. \1EDE phi\0301a ngo\00E0i b\00EAn ph\1EA3i l\00E0 H\00E0m.</p>'),
unistr('<p>Phe\0301p ti\0301nh m\00E2\0303u sau \0111\00E2y minh h\1ECDa c\00E1ch hi\1EC3n th\1ECB t\1ED5ng l\01B0\01A1ng th\01B0\01A1\0309ng:</p>'),
'<pre>CASE WHEN A = ''SALES'' THEN B + C ELSE B END</pre>',
unistr('(trong \0111\00F3 A l\00E0 T\1ED4 CH\1EE8C, B l\00E0 L\01AF\01A0NG v\00E0 C l\00E0 HOA H\1ED2NG)'),
''))
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144125953668752914)
,p_name=>'APEXIR_HELP_CONTROL_BREAK'
,p_message_language=>'vi'
,p_message_text=>unistr('D\00F9ng \0111\1EC3 t\1EA1o nh\00F3m d\00E2\0301u ng\1EAFt tr\00EAn m\1ED9t ho\1EB7c nhi\1EC1u c\1ED9t. Thao t\00E1c n\00E0y s\1EBD k\00E9o c\00E1c c\1ED9t ra kh\1ECFi b\00E1o c\00E1o t\01B0\01A1ng t\00E1c v\00E0 hi\1EC3n th\1ECB ch\00FAng d\01B0\1EDBi d\1EA1ng d\01B0\0303 li\00EA\0323u ch\00EDnh.')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144120115189752912)
,p_name=>'APEXIR_HELP_DETAIL_VIEW'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\1EC3 xem chi ti\1EBFt t\1EEBng h\00E0ng m\1ED9t, h\00E3y nh\1EA5p v\00E0o bi\1EC3u t\01B0\1EE3ng ch\00EA\0301 \0111\00F4\0323 xem m\1ED9t h\00E0ng tr\00EAn h\00E0ng b\1EA1n mu\1ED1n xem. N\1EBFu c\00F3, ch\1EBF \0111\1ED9 xem m\1ED9t h\00E0ng s\1EBD lu\00F4n l\00E0 c\1ED9t \0111\1EA7u ti\00EAn. T\00F9y thu\1ED9c v\00E0o ca\0301ch t\00F9y ch\1EC9nh b\00E1o c\00E1o t\01B0\01A1ng t\00E1c, ch\1EBF \0111\1ED9 xem m\00F4\0323t h\00E0ng c\00F3 th\1EC3 l\00E0 ch\1EBF \0111\1ED9 xem ti\00EAu ')
||unistr('chu\1EA9n ho\1EB7c m\00F4\0323t trang t\00F9y ch\1EC9nh c\00F3 th\1EC3 cho ph\00E9p c\1EADp nh\1EADt.')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144120094381752912)
,p_name=>'APEXIR_HELP_DOWNLOAD'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho ph\00E9p t\1EA3i xu\1ED1ng loa\0323t k\1EBFt qu\1EA3 hi\1EC7n t\1EA1i. C\00E1c \0111\1ECBnh d\1EA1ng t\1EA3i xu\1ED1ng bao g\1ED3m PDF, Excel, HTML v\00E0 CSV. C\00E1c t\00F9y ch\1ECDn t\1EA3i xu\1ED1ng se\0303 kh\00E1c nhau t\00F9y thu\1ED9c v\00E0o \0111\1ECBnh d\1EA1ng \0111\00E3 ch\1ECDn. Ba\0323n cu\0303ng co\0301 th\00EA\0309 g\01B0\0309i t\1EA5t c\1EA3 \0111\1ECBnh d\1EA1ng na\0300y d\01B0\1EDBi d\1EA1ng email.')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144119173325752912)
,p_name=>'APEXIR_HELP_FILTER'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('T\1EADp trung v\00E0o b\00E1o c\00E1o b\1EB1ng c\00E1ch th\00EAm ho\1EB7c s\1EEDa \0111\1ED5i m\1EC7nh \0111\1EC1 <code>WHERE</code> tr\00EAn truy v\1EA5n. B\1EA1n c\00F3 th\1EC3 l\1ECDc theo c\1ED9t ho\1EB7c theo h\00E0ng.  '),
unistr('<p>N\1EBFu b\1EA1n l\1ECDc theo c\1ED9t, h\00E3y ch\1ECDn m\1ED9t c\1ED9t (kh\00F4ng c\1EA7n pha\0309i'),
unistr('l\00E0 c\00F4\0323t hi\1EC3n th\1ECB), ch\1ECDn to\00E1n t\1EED Oracle ti\00EAu chu\1EA9n (=, !=, kh\00F4ng n\0103\0300m trong, trong khoa\0309ng) v\00E0 nh\1EADp bi\1EC3u th\1EE9c \0111\1EC3 so s\00E1nh. Bi\1EC3u th\1EE9c c\00F3 ph\00E2n bi\1EC7t ch\1EEF hoa ch\1EEF th\01B0\1EDDng. S\1EED d\1EE5ng % l\00E0m k\00FD t\1EF1 \0111\1EA1i di\1EC7n (v\00ED d\1EE5: <code>STATE_NAME'),
unistr('nh\01B0 A%)</code>.</p>'),
unistr('<p>N\1EBFu l\1ECDc theo h\00E0ng, b\1EA1n c\00F3 th\1EC3 t\1EA1o c\00E1c m\1EC7nh \0111\1EC1 <code>WHERE</code> ph\1EE9c t\1EA1p b\1EB1ng c\00E1ch s\1EED d\1EE5ng'),
unistr('b\00ED danh c\1ED9t v\00E0 b\00E2\0301t ky\0300 h\00E0m ho\1EB7c to\00E1n t\1EED na\0300o cu\0309a Oracle (v\00ED d\1EE5: <code>G = ''VA'' ho\1EB7c G = ''CT''</code>, trong \0111\00F3'),
unistr('<code>G</code> l\00E0 b\00ED danh c\1EE7a <code>CUSTOMER_STATE</code>).</p>'),
''))
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144119788000752912)
,p_name=>'APEXIR_HELP_FLASHBACK'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Truy v\1EA5n h\1ED3i t\01B0\1EDFng cho ph\00E9p b\1EA1n xem d\1EEF li\1EC7u nh\01B0 \0111\00E3 t\1ED3n t\1EA1i \1EDF th\1EDDi \0111i\1EC3m'),
unistr('tr\01B0\1EDBc \0111\00F3. Kho\1EA3ng th\1EDDi gian m\1EB7c \0111\1ECBnh m\00E0 b\1EA1n c\00F3 th\1EC3 h\1ED3i t\01B0\1EDFng l\00E0 3 gi\1EDD (ho\1EB7c 180'),
unistr('ph\00FAt) nh\01B0ng s\1ED1 l\01B0\1EE3ng th\1EF1c t\1EBF s\1EBD kh\00E1c nhau \0111\1ED1i v\1EDBi m\1ED7i c\01A1 s\1EDF d\1EEF li\1EC7u.')))
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144184352547752932)
,p_name=>'APEXIR_HELP_FORMAT'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\0110\1ECBnh d\1EA1ng cho ph\00E9p b\1EA1n t\00F9y ch\1EC9nh c\00E1ch hi\1EC3n th\1ECB b\00E1o c\00E1o.'),
unistr('\0110\1ECBnh d\1EA1ng ch\1EE9a tri\0300nh \0111\01A1n phu\0323 sau:</p>'),
unistr('<ul><li>S\1EAFp x\1EBFp</li>'),
unistr('<li>D\00E2\0301u ng\0103\0301t \0111i\00EA\0300u khi\00EA\0309n</li>'),
unistr('<li>\0110\00E1nh d\1EA5u</li>'),
unistr('<li>T\00EDnh to\00E1n</li>'),
unistr('<li>T\1ED5ng h\1EE3p</li>'),
unistr('<li>Bi\1EC3u \0111\1ED3</li>'),
unistr('<li>Ph\00E2n nh\00F3m theo</li>'),
unistr('<li>Ba\0309ng t\00F4\0309ng h\01A1\0323p</li>'),
'</ul>'))
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144182599435752931)
,p_name=>'APEXIR_HELP_GROUP_BY'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Ba\0323n co\0301 th\00EA\0309 xa\0301c \0111i\0323nh m\00F4\0323t ch\00EA\0301 \0111\00F4\0323 xem Ph\00E2n nho\0301m theo tr\00EAn m\00F4\0303i ba\0301o ca\0301o'),
unistr('\0111a\0303 l\01B0u. Sau khi xa\0301c \0111i\0323nh, ba\0323n co\0301 th\00EA\0309 chuy\00EA\0309n \0111\00F4\0309i gi\01B0\0303a ca\0301c ch\00EA\0301 \0111\00F4\0323 xem ph\00E2n nho\0301m theo va\0300 ba\0301o ca\0301o'),
unistr('b\0103\0300ng ca\0301c bi\00EA\0309u t\01B0\01A1\0323ng xem tr\00EAn thanh Ti\0300m ki\00EA\0301m. \0110\00EA\0309 ta\0323o m\00F4\0323t ch\00EA\0301 \0111\00F4\0323 xem Ph\00E2n nho\0301m theo,'),
unistr('ba\0323n cho\0323n:'),
'<p></p><ul>',
unistr('<li>ca\0301c c\00F4\0323t se\0303 du\0300ng \0111\00EA\0309 nho\0301m</li>'),
unistr('<li>ca\0301c c\00F4\0323t se\0303 t\00F4\0309ng h\01A1\0323p cu\0300ng v\01A1\0301i ha\0300m se\0303 \0111\01B0\01A1\0323c th\01B0\0323c hi\00EA\0323n (trung bi\0300nh, t\00F4\0309ng, \0111\00EA\0301m, v.v.)</li>'),
'</ul>'))
,p_version_scn=>2705858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144119305290752912)
,p_name=>'APEXIR_HELP_HIGHLIGHT'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Cho phe\0301p ba\0323n xa\0301c \0111i\0323nh m\00F4\0323t b\00F4\0323 lo\0323c. Ca\0301c ha\0300ng \0111a\0301p \01B0\0301ng ti\00EAu chi\0301 lo\0323c se\0303 hi\00EA\0309n thi\0323 nh\01B0 \0111\01B0\01A1\0323c \0111a\0301nh d\00E2\0301u theo ca\0301c \0111\0103\0323c \0111i\00EA\0309m \0111\01B0\01A1\0323c li\00EAn k\00EA\0301t v\01A1\0301i b\00F4\0323 lo\0323c. Ca\0301c tu\0300y cho\0323n bao g\00F4\0300m:</p>'),
'<ul>',
unistr('<li><strong>T\00EAn</strong> chi\0309 \0111\01B0\01A1\0323c du\0300ng \0111\00EA\0309 hi\00EA\0309n thi\0323.</li>'),
unistr('<li><strong>Th\01B0\0301 t\01B0\0323</strong> xa\0301c \0111i\0323nh th\01B0\0301 t\01B0\0323 se\0303 du\0300ng \0111\00EA\0309 \0111a\0301nh gia\0301 ca\0301c quy t\0103\0301c.</li>'),
unistr('<li><strong>\0110\01B0\01A1\0323c ki\0301ch hoa\0323t</strong> xa\0301c \0111i\0323nh li\00EA\0323u m\00F4\0323t quy t\0103\0301c \0111\01B0\01A1\0323c ki\0301ch hoa\0323t hay bi\0323 v\00F4 hi\00EA\0323u ho\0301a.</li>'),
unistr('<li><strong>Loa\0323i \0111a\0301nh d\00E2\0301u</strong> xa\0301c \0111i\0323nh li\00EA\0323u ha\0300ng ho\0103\0323c \00F4 co\0301 \0111\01B0\01A1\0323c \0111a\0301nh d\00E2\0301u'),
unistr('hay kh\00F4ng. N\00EA\0301u cho\0323n \00F4 thi\0300 c\00F4\0323t \0111\01B0\01A1\0323c tham chi\00EA\0301u trong'),
unistr('\0110i\00EA\0300u ki\00EA\0323n \0111a\0301nh d\00E2\0301u se\0303 \0111\01B0\01A1\0323c \0111a\0301nh d\00E2\0301u.</li>'),
unistr('<li><strong>Ma\0300u n\00EA\0300n</strong> la\0300 ma\0300u m\01A1\0301i cho n\00EA\0300n cu\0309a vu\0300ng \0111\01B0\01A1\0323c \0111a\0301nh d\00E2\0301u.</li>'),
unistr('<li><strong>Ma\0300u v\0103n ba\0309n</strong> la\0300 ma\0300u m\01A1\0301i cho v\0103n ba\0309n trong vu\0300ng \0111\01B0\01A1\0323c \0111a\0301nh d\00E2\0301u.</li>'),
unistr('<li><strong>\0110i\00EA\0300u ki\00EA\0323n \0111a\0301nh d\00E2\0301u</strong> xa\0301c \0111i\0323nh \0111i\00EA\0300u ki\00EA\0323n b\00F4\0323 lo\0323c cu\0309a ba\0323n.</li>'),
'</ul>',
''))
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144012761081752880)
,p_name=>'APEXIR_HELP_PIVOT'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Ba\0323n co\0301 th\00EA\0309 xa\0301c \0111i\0323nh m\00F4\0323t ch\00EA\0301 \0111\00F4\0323 xem ba\0309ng t\00F4\0309ng h\01A1\0323p tr\00EAn m\00F4\0303i ba\0301o ca\0301o \0111\01B0\01A1\0323c l\01B0u. Sau khi xa\0301c \0111i\0323nh, ba\0323n co\0301 th\00EA\0309 chuy\00EA\0309n \0111\00F4\0309i gi\01B0\0303a ca\0301c ch\00EA\0301 \0111\00F4\0323 xem ba\0309ng t\00F4\0309ng h\01A1\0323p va\0300 ba\0301o ca\0301o b\0103\0300ng bi\00EA\0309u t\01B0\01A1\0323ng ch\00EA\0301 \0111\00F4\0323 xem tr\00EAn thanh Ti\0300m ki\00EA\0301m. \0110\00EA')
||unistr('\0309 ta\0323o m\00F4\0323t ch\00EA\0301 \0111\00F4\0323 xem ba\0309ng t\00F4\0309ng h\01A1\0323p, ba\0323n cho\0323n: '),
'<p></p>',
'<ul>',
unistr('<li>ca\0301c c\00F4\0323t se\0303 a\0301p ba\0309ng t\00F4\0309ng h\01A1\0323p</li>'),
unistr('<li>ca\0301c c\00F4\0323t se\0303 hi\00EA\0309n thi\0323 d\01B0\01A1\0301i da\0323ng ha\0300ng</li>'),
unistr('<li>ca\0301c c\00F4\0323t se\0303 t\00F4\0309ng h\01A1\0323p cu\0300ng v\01A1\0301i ha\0300m c\00E2\0300n th\01B0\0323c hi\00EA\0323n (trung bi\0300nh, t\00F4\0309ng, \0111\00EA\0301m, v.v.)</li>'),
'</ul>'))
,p_version_scn=>2705833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144130423776752915)
,p_name=>'APEXIR_HELP_REPORT_SETTINGS'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('N\1EBFu b\1EA1n t\00F9y ch\1EC9nh b\00E1o c\00E1o t\01B0\01A1ng t\00E1c, c\00E0i \0111\1EB7t b\00E1o c\00E1o s\1EBD hi\1EC3n th\1ECB'),
unistr('b\00EAn d\01B0\1EDBi thanh T\00ECm ki\1EBFm v\00E0 ph\00EDa tr\00EAn b\00E1o c\00E1o. C\00F3 th\1EC3 thu g\1ECDn v\00E0 m\1EDF r\1ED9ng vu\0300ng na\0300y b\1EB1ng bi\1EC3u t\01B0\1EE3ng \01A1\0309 b\00EAn tr\00E1i.'),
'<p>',
unistr('\0110\1ED1i v\1EDBi m\1ED7i c\00E0i \0111\1EB7t b\00E1o c\00E1o, b\1EA1n c\00F3 th\1EC3:'),
'</p><ul>',
unistr('<li>Ch\1EC9nh s\1EEDa c\00E0i \0111\1EB7t b\1EB1ng c\00E1ch nh\1EA5p v\00E0o t\00EAn.</li>'),
unistr('<li>T\1EAFt/B\1EADt c\00E0i \0111\1EB7t b\1EB1ng c\00E1ch b\1ECF ch\1ECDn ho\1EB7c ch\1ECDn h\1ED9p cho\0323n B\1EADt/T\1EAFt. S\1EED d\1EE5ng mu\0323c \0111i\1EC1u khi\1EC3n n\00E0y \0111\1EC3 t\1EA1m th\1EDDi t\1EAFt v\00E0 b\1EADt m\1ED9t c\00E0i \0111\1EB7t.</li>'),
unistr('<li>X\00F3a mu\0323c c\00E0i \0111\1EB7t b\1EB1ng c\00E1ch nh\1EA5p v\00E0o bi\1EC3u t\01B0\1EE3ng X\00F3a.</li>'),
'</ul>',
unistr('<p>N\1EBFu \0111\00E3 t\1EA1o bi\1EC3u \0111\1ED3, mu\0323c ph\00E2n nh\00F3m theo ho\1EB7c ba\0309ng t\00F4\0309ng h\01A1\0323p, b\1EA1n c\00F3 th\1EC3 chuy\1EC3n \0111\1ED5i gi\1EEFa ch\00FAng'),
unistr('v\00E0 b\00E1o c\00E1o c\01A1 s\1EDF b\1EB1ng c\00E1ch s\1EED d\1EE5ng ca\0301c li\00EAn k\00EA\0301t Ch\1EBF \0111\1ED9 xem b\00E1o c\00E1o, Ch\1EBF \0111\1ED9 xem bi\1EC3u \0111\1ED3, Ch\1EBF \0111\1ED9 xem ph\00E2n nh\00F3m theo v\00E0 Ch\1EBF \0111\1ED9 xem ba\0309ng t\00F4\0309ng h\01A1\0323p'),
unistr('hi\1EC3n th\1ECB \01A1\0309 b\00EAn ph\1EA3i. N\1EBFu \0111ang xem bi\1EC3u \0111\1ED3, mu\0323c ph\00E2n nh\00F3m theo ho\1EB7c ba\0309ng t\00F4\0309ng h\01A1\0323p, b\1EA1n'),
unistr('c\0169ng c\00F3 th\1EC3 s\1EED d\1EE5ng li\00EAn k\1EBFt Ch\1EC9nh s\1EEDa \0111\1EC3 ch\1EC9nh s\1EEDa c\00E0i \0111\1EB7t.</p>'),
''))
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144119950907752912)
,p_name=>'APEXIR_HELP_RESET'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\1EB7t l\1EA1i b\00E1o c\00E1o v\1EC1 c\00E0i \0111\1EB7t m\1EB7c \0111\1ECBnh, x\00F3a m\1ECDi mu\0323c t\00F9y ch\1EC9nh m\00E0 b\1EA1n \0111\00E3 th\1EF1c hi\1EC7n.')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144184606276752932)
,p_name=>'APEXIR_HELP_ROWS_PER_PAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\1EB7t s\1ED1 l\01B0\1EE3ng d\01B0\0303 li\00EA\0323u se\0303 hi\1EC3n th\1ECB tr\00EAn m\1ED7i trang.')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144119801918752912)
,p_name=>'APEXIR_HELP_SAVE_REPORT'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>L\01B0u b\00E1o c\00E1o \0111a\0303 t\00F9y ch\1EC9nh \0111\1EC3 s\1EED d\1EE5ng trong t\01B0\01A1ng lai. B\1EA1n cung c\1EA5p t\00EAn v\00E0 n\00F4\0323i dung m\00F4 t\1EA3 kh\00F4ng b\0103\0301t bu\00F4\0323c, \0111\1ED3ng th\1EDDi c\00F3 th\1EC3 \0111\0103\0323t b\00E1o c\00E1o \01A1\0309 ch\00EA\0301 \0111\00F4\0323 c\00F4ng khai (ngh\0129a l\00E0 t\1EA5t c\1EA3 ng\01B0\1EDDi d\00F9ng \0111\00EA\0300u c\00F3 th\1EC3 truy c\1EADp v\00E0o b\00E1o c\00E1o m\1EB7c \0111\1ECBnh ch\00EDnh). B\1EA1n c\00F3 th')
||unistr('\1EC3 l\01B0u 4 lo\1EA1i b\00E1o c\00E1o t\01B0\01A1ng t\00E1c:</p>'),
'<ul>',
unistr('<li><strong>M\1EB7c \0111\1ECBnh ch\00EDnh</strong> (Ch\1EC9 d\00E0nh cho nh\00E0 ph\00E1t tri\1EC3n). M\1EB7c \0111\1ECBnh ch\00EDnh l\00E0 b\00E1o c\00E1o hi\1EC3n th\1ECB ban \0111\1EA7u. Ba\0323n kh\00F4ng th\1EC3 \0111\1ED5i t\00EAn hay x\00F3a ca\0301c b\00E1o c\00E1o M\1EB7c \0111\1ECBnh ch\00EDnh.</li>'),
unistr('<li><strong>B\00E1o c\00E1o thay th\1EBF</strong> (Ch\1EC9 d\00E0nh cho nh\00E0 ph\00E1t tri\1EC3n). Cho ph\00E9p nh\00E0 ph\00E1t tri\1EC3n t\1EA1o nhi\1EC1u b\1ED1 c\1EE5c b\00E1o c\00E1o. Ch\1EC9 nh\00E0 ph\00E1t tri\1EC3n m\1EDBi c\00F3 th\1EC3 l\01B0u, \0111\1ED5i t\00EAn ho\1EB7c x\00F3a B\00E1o c\00E1o thay th\1EBF.</li>'),
unistr('<li><strong>B\00E1o c\00E1o c\00F4ng khai</strong> (Ng\01B0\1EDDi d\00F9ng cu\1ED1i). Ng\01B0\1EDDi d\00F9ng cu\1ED1i t\1EA1o ba\0301o ca\0301o c\00F3 th\1EC3 l\01B0u, \0111\1ED5i t\00EAn ho\1EB7c x\00F3a ba\0301o ca\0301o \0111o\0301. Nh\1EEFng ng\01B0\1EDDi d\00F9ng kh\00E1c c\00F3 th\1EC3 xem v\00E0 l\01B0u b\1ED1 c\1EE5c d\01B0\1EDBi d\1EA1ng m\1ED9t b\00E1o c\00E1o kh\00E1c.</li>'),
unistr('<li><strong>B\00E1o c\00E1o ri\00EAng t\01B0</strong> (Ng\01B0\1EDDi d\00F9ng cu\1ED1i). Ch\1EC9 ng\01B0\1EDDi d\00F9ng cu\1ED1i t\1EA1o b\00E1o c\00E1o m\1EDBi c\00F3 th\1EC3 xem, l\01B0u, \0111\1ED5i t\00EAn ho\1EB7c x\00F3a b\00E1o c\00E1o.</li>'),
'</ul>',
unistr('<p>N\1EBFu b\1EA1n l\01B0u b\00E1o c\00E1o \0111a\0303 t\00F9y ch\1EC9nh, b\1ED9 ch\1ECDn B\00E1o c\00E1o s\1EBD hi\1EC3n th\1ECB trong thanh T\00ECm ki\1EBFm \1EDF b\00EAn tr\00E1i b\1ED9 ch\1ECDn H\00E0ng (n\1EBFu t\00EDnh n\0103ng n\00E0y \0111\01B0\1EE3c b\1EADt).</p>')))
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144118866006752912)
,p_name=>'APEXIR_HELP_SEARCH_BAR'
,p_message_language=>'vi'
,p_message_text=>unistr('\01A0\0309 \0111\00E2\0300u m\00F4\0303i trang ba\0301o ca\0301o la\0300 m\00F4\0323t vu\0300ng ti\0300m ki\00EA\0301m. Vu\0300ng (hay thanh Ti\0300m ki\00EA\0301m) na\0300y cung c\00E2\0301p ca\0301c ti\0301nh n\0103ng sau:')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144185246105752932)
,p_name=>'APEXIR_HELP_SEARCH_BAR_ACTIONS_MENU'
,p_message_language=>'vi'
,p_message_text=>unistr('<li><strong>Tri\0300nh \0111\01A1n ha\0300nh \0111\00F4\0323ng</strong> cho phe\0301p ba\0323n tu\0300y chi\0309nh ba\0301o ca\0301o. Ha\0303y xem ca\0301c ph\00E2\0300n sau \0111\00E2y.</li>')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144184780826752932)
,p_name=>'APEXIR_HELP_SEARCH_BAR_FINDER'
,p_message_language=>'vi'
,p_message_text=>unistr('<li><strong>Bi\1EC3u t\01B0\1EE3ng Ch\1ECDn c\1ED9t</strong> cho ph\00E9p b\1EA1n x\00E1c \0111\1ECBnh c\1ED9t n\00E0o c\1EA7n t\00ECm ki\1EBFm (ho\1EB7c t\1EA5t c\1EA3).</li>')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144185085748752932)
,p_name=>'APEXIR_HELP_SEARCH_BAR_REPORTS'
,p_message_language=>'vi'
,p_message_text=>unistr('<li><strong>Ba\0301o ca\0301o</strong> hi\00EA\0309n thi\0323 ca\0301c ba\0301o ca\0301o m\0103\0323c \0111i\0323nh thay th\00EA\0301 va\0300 ba\0301o ca\0301o ri\00EAng t\01B0 ho\0103\0323c c\00F4ng khai \0111a\0303 l\01B0u.</li>')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144184924763752932)
,p_name=>'APEXIR_HELP_SEARCH_BAR_ROWS'
,p_message_language=>'vi'
,p_message_text=>unistr('<li><strong>H\00E0ng</strong> \0111\1EB7t s\1ED1 l\01B0\1EE3ng d\01B0\0303 li\00EA\0323u se\0303 hi\1EC3n th\1ECB tr\00EAn m\1ED7i trang.</li>')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144184864845752932)
,p_name=>'APEXIR_HELP_SEARCH_BAR_TEXTBOX'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<li><strong>V\00F9ng v\0103n b\1EA3n</strong> cho ph\00E9p b\1EA1n nh\1EADp ti\00EAu ch\00ED t\00ECm ki\1EBFm kh\00F4ng ph\00E2n bi\1EC7t ch\1EEF hoa ch\1EEF th\01B0\1EDDng (ng\1EE5 \00FD c\00E1c k\00FD t\1EF1 \0111\1EA1i di\1EC7n).</li>'),
unistr('<li><strong>N\00FAt \0110i</strong> th\1EF1c hi\1EC7n t\00ECm ki\1EBFm. Vi\00EA\0323c nh\1EA5n ph\00EDm enter c\0169ng s\1EBD th\1EF1c hi\1EC7n t\00ECm ki\1EBFm khi con tr\1ECF \1EDF trong v\00F9ng v\0103n b\1EA3n t\00ECm ki\1EBFm.</li>')))
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144185121388752932)
,p_name=>'APEXIR_HELP_SEARCH_BAR_VIEW'
,p_message_language=>'vi'
,p_message_text=>unistr('<li><strong>Bi\00EA\0309u t\01B0\01A1\0323ng ch\00EA\0301 \0111\00F4\0323 xem</strong> chuy\00EA\0309n \0111\00F4\0309i gi\01B0\0303a ca\0301c ch\00EA\0301 \0111\00F4\0323 xem bi\00EA\0309u t\01B0\01A1\0323ng, ba\0301o ca\0301o, chi ti\00EA\0301t, bi\00EA\0309u \0111\00F4\0300, ph\00E2n nho\0301m theo va\0300 ba\0309ng t\00F4\0309ng h\01A1\0323p cu\0309a ba\0301o ca\0301o n\00EA\0301u \0111\01B0\01A1\0323c xa\0301c \0111i\0323nh.</li>')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144119081096752912)
,p_name=>'APEXIR_HELP_SELECT_COLUMNS'
,p_message_language=>'vi'
,p_message_text=>unistr('Du\0300ng \0111\1EC3 s\1EEDa \0111\1ED5i c\00E1c c\1ED9t \0111\01B0\1EE3c hi\1EC3n th\1ECB. C\00E1c c\1ED9t \1EDF b\00EAn ph\1EA3i se\0303 hi\00EA\0309n thi\0323. C\00E1c c\1ED9t \01A1\0309 b\00EAn tr\00E1i b\1ECB \1EA9n. B\1EA1n c\00F3 th\1EC3 s\1EAFp x\1EBFp l\1EA1i c\00E1c c\1ED9t \0111\01B0\1EE3c hi\1EC3n th\1ECB b\1EB1ng m\0169i t\00EAn \1EDF ph\00EDa ngoa\0300i b\00EAn ph\1EA3i. C\00E1c c\1ED9t \0111\01B0\1EE3c t\00EDnh to\00E1n c\00F3 ti\1EC1n t\1ED1 <strong>**</strong>.')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144119270295752912)
,p_name=>'APEXIR_HELP_SORT'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Du\0300ng \0111\00EA\0309 thay \0111\00F4\0309i ca\0301c c\00F4\0323t c\00E2\0300n s\0103\0301p x\00EA\0301p va\0300 xa\0301c \0111i\0323nh li\00EA\0323u'),
unistr('se\0303 s\0103\0301p x\00EA\0301p theo th\01B0\0301 t\01B0\0323 t\0103ng d\00E2\0300n hay gia\0309m d\00E2\0300n. Ba\0323n cu\0303ng co\0301 th\00EA\0309 chi\0309 \0111i\0323nh ca\0301ch x\01B0\0309 ly\0301 ca\0301c gia\0301 tri\0323'),
unistr('<code>NULL</code>. Ca\0300i \0111\0103\0323t m\0103\0323c \0111i\0323nh lu\00F4n hi\00EA\0309n thi\0323 ca\0301c gia\0301 tri\0323 <code>NULL</code> \01A1\0309 vi\0323 tri\0301 cu\00F4\0301i cu\0300ng ho\0103\0323c lu\00F4n hi\00EA\0309n thi\0323 chu\0301ng \01A1\0309 vi\0323 tri\0301 \0111\00E2\0300u ti\00EAn. Ca\0301ch s\0103\0301p x\00EA\0301p \0111\01B0\01A1\0323c xa\0301c \0111i\0323nh se\0303 hi\00EA\0309n thi\0323 \01A1\0309 b\00EAn pha\0309i'),
unistr('ca\0301c ti\00EAu \0111\00EA\0300 c\00F4\0323t trong ba\0301o ca\0301o.</p>')))
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144182300903752931)
,p_name=>'APEXIR_HELP_SUBSCRIPTION'
,p_message_language=>'vi'
,p_message_text=>unistr('Khi th\00EAm go\0301i \0111\0103ng k\00FD, b\1EA1n cung c\1EA5p m\00F4\0323t \0111\1ECBa ch\1EC9 email (ho\1EB7c nhi\1EC1u \0111\1ECBa ch\1EC9 email, \0111\01B0\1EE3c ph\00E2n t\00E1ch b\1EB1ng d\1EA5u ph\1EA9y), ti\00EAu \0111\1EC1 email, t\1EA7n su\1EA5t c\0169ng nh\01B0 ng\00E0y b\1EAFt \0111\1EA7u v\00E0 ng\00E0y k\1EBFt th\00FAc. C\00E1c email nh\00E2\0323n \0111\01B0\01A1\0323c se\0303 bao g\1ED3m phi\00EAn b\1EA3n \0111\00E3 xu\1EA5t (PDF, Excel, HTML ho\1EB7')
||unistr('c CSV) c\1EE7a b\00E1o c\00E1o t\01B0\01A1ng t\00E1c ch\1EE9a d\1EEF li\1EC7u hi\1EC7n t\1EA1i b\1EB1ng c\00E1ch s\1EED d\1EE5ng c\00E0i \0111\1EB7t b\00E1o c\00E1o c\00F3 s\1EB5n khi th\00EAm go\0301i \0111\0103ng k\00FD.')
,p_version_scn=>2705858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144123937561752914)
,p_name=>'APEXIR_HIDE_COLUMN'
,p_message_language=>'vi'
,p_message_text=>unistr('\00C2\0309n c\00F4\0323t')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144114329155752911)
,p_name=>'APEXIR_HIGHLIGHT'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0301nh d\00E2\0301u')
,p_is_js_message=>true
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144125418826752914)
,p_name=>'APEXIR_HIGHLIGHTS'
,p_message_language=>'vi'
,p_message_text=>unistr('Ph\1EA7n \0111\00E1nh d\1EA5u')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144095610338752905)
,p_name=>'APEXIR_HIGHLIGHT_CELL_WITH_COLORS'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0301nh d\00E2\0301u \00F4, %0 tr\00EAn %1')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144130550921752916)
,p_name=>'APEXIR_HIGHLIGHT_CONDITION'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110i\00EA\0300u ki\00EA\0323n \0111a\0301nh d\00E2\0301u')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144095538811752905)
,p_name=>'APEXIR_HIGHLIGHT_ROW_WITH_COLORS'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0301nh d\00E2\0301u ha\0300ng, %0 tr\00EAn %1')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144182986167752931)
,p_name=>'APEXIR_HIGHLIGHT_STYLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ki\00EA\0309u \0111a\0301nh d\00E2\0301u')
,p_version_scn=>2705858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144087180449752903)
,p_name=>'APEXIR_HIGHLIGHT_TYPE'
,p_message_language=>'vi'
,p_message_text=>unistr('Loa\0323i \0111a\0301nh d\00E2\0301u')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144201790423752937)
,p_name=>'APEXIR_HORIZONTAL'
,p_message_language=>'vi'
,p_message_text=>'Ngang'
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144230705672752945)
,p_name=>'APEXIR_INACTIVE_SETTING'
,p_message_language=>'vi'
,p_message_text=>unistr('1 mu\0323c ca\0300i \0111\0103\0323t kh\00F4ng hoa\0323t \0111\00F4\0323ng')
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144230875893752945)
,p_name=>'APEXIR_INACTIVE_SETTINGS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 mu\0323c ca\0300i \0111\0103\0323t kh\00F4ng hoa\0323t \0111\00F4\0323ng')
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144120543832752913)
,p_name=>'APEXIR_INTERACTIVE_REPORT_HELP'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\01A1\0323 giu\0301p ba\0301o ca\0301o t\01B0\01A1ng ta\0301c')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144131544858752916)
,p_name=>'APEXIR_INVALID'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng h\01A1\0323p l\00EA\0323')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144124983827752914)
,p_name=>'APEXIR_INVALID_COMPUTATION'
,p_message_language=>'vi'
,p_message_text=>unistr('Bi\00EA\0309u th\01B0\0301c ti\0301nh kh\00F4ng h\01A1\0323p l\00EA\0323. %0')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144080524015752901)
,p_name=>'APEXIR_INVALID_END_DATE'
,p_message_language=>'vi'
,p_message_text=>unistr('Nga\0300y k\00EA\0301t thu\0301c pha\0309i sau nga\0300y b\0103\0301t \0111\00E2\0300u.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144139731322752918)
,p_name=>'APEXIR_INVALID_FILTER'
,p_message_language=>'vi'
,p_message_text=>unistr('Bi\00EA\0309u th\01B0\0301c lo\0323c kh\00F4ng h\01A1\0323p l\00EA\0323. %0')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144209501976752939)
,p_name=>'APEXIR_INVALID_FILTER_QUERY'
,p_message_language=>'vi'
,p_message_text=>unistr('Truy v\00E2\0301n lo\0323c kh\00F4ng h\01A1\0323p l\00EA\0323')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144230991738752945)
,p_name=>'APEXIR_INVALID_SETTING'
,p_message_language=>'vi'
,p_message_text=>unistr('1 mu\0323c ca\0300i \0111\0103\0323t kh\00F4ng h\01A1\0323p l\00EA\0323')
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144231028326752945)
,p_name=>'APEXIR_INVALID_SETTINGS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 mu\0323c ca\0300i \0111\0103\0323t kh\00F4ng h\01A1\0323p l\00EA\0323')
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144183136058752931)
,p_name=>'APEXIR_IN_MINUTES'
,p_message_language=>'vi'
,p_message_text=>unistr('(ti\0301nh b\1EB1ng ph\00FAt)')
,p_version_scn=>2705858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144200128761752936)
,p_name=>'APEXIR_IS_IN_THE_LAST'
,p_message_language=>'vi'
,p_message_text=>'%0 trong %1 qua'
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144200314577752936)
,p_name=>'APEXIR_IS_IN_THE_NEXT'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 trong %1 t\01A1\0301i')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144200240275752936)
,p_name=>'APEXIR_IS_NOT_IN_THE_LAST'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng di\00EA\0303n ra trong %1 qua')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144200445155752936)
,p_name=>'APEXIR_IS_NOT_IN_THE_NEXT'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 kh\00F4ng di\00EA\0303n ra trong %1 t\01A1\0301i')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144129699567752915)
,p_name=>'APEXIR_KEYPAD'
,p_message_language=>'vi'
,p_message_text=>unistr('B\00E0n ph\00EDm s\00F4\0301')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144093378368752904)
,p_name=>'APEXIR_LABEL'
,p_message_language=>'vi'
,p_message_text=>unistr('Nha\0303n %0')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144123587507752913)
,p_name=>'APEXIR_LABEL_AXIS_TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\00EAu \0111\00EA\0300 tru\0323c cho nha\0303n')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144115845245752911)
,p_name=>'APEXIR_LAST_DAY'
,p_message_language=>'vi'
,p_message_text=>unistr('Nga\0300y qua')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144116097469752911)
,p_name=>'APEXIR_LAST_HOUR'
,p_message_language=>'vi'
,p_message_text=>unistr('Gi\01A1\0300 qua')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144115592896752911)
,p_name=>'APEXIR_LAST_MONTH'
,p_message_language=>'vi'
,p_message_text=>unistr('Tha\0301ng tr\01B0\01A1\0301c')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144115604005752911)
,p_name=>'APEXIR_LAST_WEEK'
,p_message_language=>'vi'
,p_message_text=>unistr('Tu\00E2\0300n tr\01B0\01A1\0301c')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144115777281752911)
,p_name=>'APEXIR_LAST_X_DAYS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 nga\0300y qua')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144115967267752911)
,p_name=>'APEXIR_LAST_X_HOURS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 gi\01A1\0300 qua')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144115377890752911)
,p_name=>'APEXIR_LAST_X_YEARS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 n\0103m qua')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144115436684752911)
,p_name=>'APEXIR_LAST_YEAR'
,p_message_language=>'vi'
,p_message_text=>unistr('N\0103m ngoa\0301i')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144093206823752904)
,p_name=>'APEXIR_LINE'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\01B0\01A1\0300ng')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144090002441752903)
,p_name=>'APEXIR_LINE_WITH_AREA'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\01B0\01A1\0300ng co\0301 di\00EA\0323n ti\0301ch')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144209460238752939)
,p_name=>'APEXIR_MAP_IT'
,p_message_language=>'vi'
,p_message_text=>unistr('Xem tr\00EAn ba\0309n \0111\00F4\0300')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144124434216752914)
,p_name=>'APEXIR_MAX_QUERY_COST'
,p_message_language=>'vi'
,p_message_text=>unistr('Theo \01B0\01A1\0301c ti\0301nh, truy v\1EA5n se\0303 v\01B0\1EE3t qu\00E1 s\00F4\0301 l\01B0\01A1\0323ng t\00E0i nguy\00EAn t\1ED1i \0111a \0111\01B0\1EE3c ph\00E9p. Ha\0303y s\1EEDa \0111\1ED5i c\00E0i \0111\1EB7t b\00E1o c\00E1o c\1EE7a b\1EA1n r\00F4\0300i th\1EED l\1EA1i.')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144105800970752908)
,p_name=>'APEXIR_MAX_ROW_CNT'
,p_message_language=>'vi'
,p_message_text=>unistr('S\00F4\0301 l\01B0\01A1\0323ng ha\0300ng t\00F4\0301i \0111a cho ba\0301o ca\0301o na\0300y la\0300 %0 ha\0300ng. Ha\0303y a\0301p du\0323ng b\00F4\0323 lo\0323c \0111\00EA\0309 gia\0309m s\00F4\0301 l\01B0\01A1\0323ng d\01B0\0303 li\00EA\0323u trong truy v\00E2\0301n cu\0309a ba\0323n.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144210055369752939)
,p_name=>'APEXIR_MAX_X'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00F4\0301i \0111a %0')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144210283515752939)
,p_name=>'APEXIR_MEDIAN_X'
,p_message_language=>'vi'
,p_message_text=>unistr('Trung vi\0323 %0')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144052529871752892)
,p_name=>'APEXIR_MESSAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\00F4ng ba\0301o')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144110166552752909)
,p_name=>'APEXIR_MIN_AGO'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 phu\0301t tr\01B0\01A1\0301c')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144210185517752939)
,p_name=>'APEXIR_MIN_X'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00F4\0301i thi\00EA\0309u %0')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144209167022752939)
,p_name=>'APEXIR_MONTH'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\00E1ng')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144183552081752931)
,p_name=>'APEXIR_MONTHLY'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0300ng tha\0301ng')
,p_version_scn=>2705858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144122740911752913)
,p_name=>'APEXIR_MOVE'
,p_message_language=>'vi'
,p_message_text=>unistr('Di chuy\00EA\0309n')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144122663462752913)
,p_name=>'APEXIR_MOVE_ALL'
,p_message_language=>'vi'
,p_message_text=>unistr('Di chuy\00EA\0309n t\00E2\0301t ca\0309')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144235800538752947)
,p_name=>'APEXIR_MULTIIR_PAGE_REGION_STATIC_ID_REQUIRED'
,p_message_language=>'vi'
,p_message_text=>unistr('Pha\0309i chi\0309 \0111i\0323nh Ma\0303 ti\0303nh cu\0309a vu\0300ng vi\0300 trang ch\01B0\0301a nhi\00EA\0300u ba\0301o ca\0301o t\01B0\01A1ng ta\0301c.')
,p_version_scn=>2705869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144088764293752903)
,p_name=>'APEXIR_NAME'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00EAn')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144118466832752912)
,p_name=>'APEXIR_NEW_AGGREGATION'
,p_message_language=>'vi'
,p_message_text=>unistr('Mu\0323c t\00F4\0309ng h\01A1\0323p m\01A1\0301i')
,p_version_scn=>2705848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144231687311752946)
,p_name=>'APEXIR_NEW_CATEGORY_LABEL'
,p_message_language=>'vi'
,p_message_text=>unistr('Danh mu\0323c m\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144118547196752912)
,p_name=>'APEXIR_NEW_COMPUTATION'
,p_message_language=>'vi'
,p_message_text=>unistr('Mu\0323c ti\0301nh toa\0301n m\01A1\0301i')
,p_version_scn=>2705848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144113207654752910)
,p_name=>'APEXIR_NEXT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\1EBFp theo')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144116340979752911)
,p_name=>'APEXIR_NEXT_DAY'
,p_message_language=>'vi'
,p_message_text=>unistr('Nga\0300y t\01A1\0301i')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144116159478752911)
,p_name=>'APEXIR_NEXT_HOUR'
,p_message_language=>'vi'
,p_message_text=>unistr('Gi\01A1\0300 t\01A1\0301i')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144116671065752911)
,p_name=>'APEXIR_NEXT_MONTH'
,p_message_language=>'vi'
,p_message_text=>unistr('Tha\0301ng sau')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144116559191752911)
,p_name=>'APEXIR_NEXT_WEEK'
,p_message_language=>'vi'
,p_message_text=>unistr('Tu\00E2\0300n sau')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144116476506752911)
,p_name=>'APEXIR_NEXT_X_DAYS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 ng\00E0y t\1EDBi')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144116219056752911)
,p_name=>'APEXIR_NEXT_X_HOURS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 gi\01A1\0300 t\01A1\0301i')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144116800630752911)
,p_name=>'APEXIR_NEXT_X_YEARS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 n\0103m sau')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144116757376752911)
,p_name=>'APEXIR_NEXT_YEAR'
,p_message_language=>'vi'
,p_message_text=>unistr('N\0103m sau')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144089005370752903)
,p_name=>'APEXIR_NO'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144131730634752916)
,p_name=>'APEXIR_NONE'
,p_message_language=>'vi'
,p_message_text=>unistr('- Kh\00F4ng co\0301 -')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144182716873752931)
,p_name=>'APEXIR_NOT_VALID_EMAIL'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110i\0323a chi\0309 email kh\00F4ng h\01A1\0323p l\00EA\0323.')
,p_version_scn=>2705858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144054804134752893)
,p_name=>'APEXIR_NO_COLUMNS_SELECTED'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng c\00F3 c\1ED9t n\00E0o \0111\01B0\1EE3c ch\1ECDn \0111\1EC3 hi\1EC3n th\1ECB. Ha\0303y s\1EED d\1EE5ng <strong>C\1ED9t</strong> trong tr\00ECnh \0111\01A1n Ha\0300nh \0111\00F4\0323ng \0111\1EC3 hi\1EC3n th\1ECB c\00E1c c\1ED9t.')
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144128215616752915)
,p_name=>'APEXIR_NULLS_ALWAYS_FIRST'
,p_message_language=>'vi'
,p_message_text=>unistr('Gia\0301 tri\0323 r\00F4\0303ng lu\00F4n \01A1\0309 vi\0323 tri\0301 \0111\00E2\0300u ti\00EAn')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144128186582752915)
,p_name=>'APEXIR_NULLS_ALWAYS_LAST'
,p_message_language=>'vi'
,p_message_text=>unistr('Gia\0301 tri\0323 r\00F4\0303ng lu\00F4n \01A1\0309 vi\0323 tri\0301 cu\00F4\0301i cu\0300ng')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144128652342752915)
,p_name=>'APEXIR_NULL_SORTING'
,p_message_language=>'vi'
,p_message_text=>unistr('S\0103\0301p x\00EA\0301p gia\0301 tri\0323 r\00F4\0303ng %0')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144125047706752914)
,p_name=>'APEXIR_NUMERIC_FLASHBACK_TIME'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\01A1\0300i gian h\00F4\0300i t\01B0\01A1\0309ng pha\0309i \01A1\0309 \0111i\0323nh da\0323ng s\00F4\0301.')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144124628179752914)
,p_name=>'APEXIR_NUMERIC_SEQUENCE'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\01B0\0301 t\01B0\0323 pha\0309i la\0300 s\00F4\0301.')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144129143853752915)
,p_name=>'APEXIR_OPERATOR'
,p_message_language=>'vi'
,p_message_text=>unistr('Toa\0301n t\01B0\0309')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144087693768752903)
,p_name=>'APEXIR_ORANGE'
,p_message_language=>'vi'
,p_message_text=>'cam'
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144201688833752937)
,p_name=>'APEXIR_ORIENTATION'
,p_message_language=>'vi'
,p_message_text=>unistr('H\01B0\01A1\0301ng')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144089504604752903)
,p_name=>'APEXIR_OTHER'
,p_message_language=>'vi'
,p_message_text=>unistr('Kha\0301c')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144055774003752893)
,p_name=>'APEXIR_PAGINATION_OF'
,p_message_language=>'vi'
,p_message_text=>unistr('Ph\00E2n trang c\1EE7a %0')
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144069762574752897)
,p_name=>'APEXIR_PDF_ORIENTATION'
,p_message_language=>'vi'
,p_message_text=>unistr('H\01B0\1EDBng trang')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144070466213752898)
,p_name=>'APEXIR_PDF_ORIENTATION_HORIZONTAL'
,p_message_language=>'vi'
,p_message_text=>'Ngang'
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144070557313752898)
,p_name=>'APEXIR_PDF_ORIENTATION_VERTICAL'
,p_message_language=>'vi'
,p_message_text=>unistr('Do\0323c')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144069600642752897)
,p_name=>'APEXIR_PDF_PAGE_SIZE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ki\0301ch c\01A1\0303 trang')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144070253129752898)
,p_name=>'APEXIR_PDF_PAGE_SIZE_A3'
,p_message_language=>'vi'
,p_message_text=>'A3'
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144070182119752897)
,p_name=>'APEXIR_PDF_PAGE_SIZE_A4'
,p_message_language=>'vi'
,p_message_text=>'A4'
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144070302168752898)
,p_name=>'APEXIR_PDF_PAGE_SIZE_CUSTOM'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00F9y ch\1EC9nh')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144069921497752897)
,p_name=>'APEXIR_PDF_PAGE_SIZE_LEGAL'
,p_message_language=>'vi'
,p_message_text=>unistr('Pha\0301p ly\0301')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144069844004752897)
,p_name=>'APEXIR_PDF_PAGE_SIZE_LETTER'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\01B0')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144070063241752897)
,p_name=>'APEXIR_PDF_PAGE_SIZE_TABLOID'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0301o kh\00F4\0309 nho\0309')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144210567383752939)
,p_name=>'APEXIR_PERCENT_OF_TOTAL_COUNT_X'
,p_message_language=>'vi'
,p_message_text=>unistr('Ph\00E2\0300n tr\0103m tr\00EAn t\00F4\0309ng s\00F4\0301 l\01B0\01A1\0323ng %0 (%)')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144209727695752939)
,p_name=>'APEXIR_PERCENT_OF_TOTAL_SUM_X'
,p_message_language=>'vi'
,p_message_text=>unistr('Ph\00E2\0300n tr\0103m tr\00EAn t\00F4\0309ng c\00F4\0323ng %0 (%)')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144208748220752939)
,p_name=>'APEXIR_PERCENT_TOTAL_COUNT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ph\00E2\0300n tr\0103m tr\00EAn t\00F4\0309ng s\00F4\0301 l\01B0\01A1\0323ng')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144208636190752939)
,p_name=>'APEXIR_PERCENT_TOTAL_SUM'
,p_message_language=>'vi'
,p_message_text=>unistr('Ph\00E2\0300n tr\0103m tr\00EAn t\00F4\0309ng c\00F4\0323ng')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144093174447752904)
,p_name=>'APEXIR_PIE'
,p_message_language=>'vi'
,p_message_text=>unistr('Hi\0300nh tro\0300n')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144158813439752924)
,p_name=>'APEXIR_PIVOT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0309ng t\00F4\0309ng h\01A1\0323p')
,p_is_js_message=>true
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144160347799752924)
,p_name=>'APEXIR_PIVOT_AGG_NOT_NULL'
,p_message_language=>'vi'
,p_message_text=>unistr('Pha\0309i chi\0309 \0111i\0323nh mu\0323c t\00F4\0309ng h\01A1\0323p.')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144160591004752925)
,p_name=>'APEXIR_PIVOT_AGG_NOT_ON_ROW_COL'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0323n kh\00F4ng th\00EA\0309 t\00F4\0309ng h\01A1\0323p tr\00EAn m\00F4\0323t c\00F4\0323t \0111\01B0\01A1\0323c cho\0323n la\0300m c\00F4\0323t ha\0300ng.')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144159795577752924)
,p_name=>'APEXIR_PIVOT_COLUMNS'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00F4\0323t ba\0309ng t\00F4\0309ng h\01A1\0323p')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144159503297752924)
,p_name=>'APEXIR_PIVOT_COLUMN_N'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00F4\0323t ba\0309ng t\00F4\0309ng h\01A1\0323p %0')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144160112878752924)
,p_name=>'APEXIR_PIVOT_COLUMN_NOT_NULL'
,p_message_language=>'vi'
,p_message_text=>unistr('Pha\0309i chi\0309 \0111i\0323nh c\00F4\0323t ba\0309ng t\00F4\0309ng h\01A1\0323p.')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144012648675752880)
,p_name=>'APEXIR_PIVOT_MAX_ROW_CNT'
,p_message_language=>'vi'
,p_message_text=>unistr('S\00F4\0301 l\01B0\01A1\0323ng ha\0300ng t\00F4\0301i \0111a cho m\00F4\0323t truy v\00E2\0301n ba\0309ng t\00F4\0309ng h\01A1\0323p se\0303 gi\01A1\0301i ha\0323n s\00F4\0301 l\01B0\01A1\0323ng ha\0300ng trong truy v\00E2\0301n c\01A1 s\01A1\0309, ch\01B0\0301 kh\00F4ng pha\0309i s\00F4\0301 l\01B0\01A1\0323ng ha\0300ng hi\00EA\0309n thi\0323. Truy v\00E2\0301n c\01A1 s\01A1\0309 cu\0309a ba\0323n v\01B0\01A1\0323t qua\0301 s\00F4\0301 l\01B0\01A1\0323ng ha\0300ng t\00F4\0301i \0111a la\0300 %0. Ha\0303y a\0301p du\0323ng b')
||unistr('\00F4\0323 lo\0323c \0111\00EA\0309 gia\0309m s\00F4\0301 l\01B0\01A1\0323ng d\01B0\0303 li\00EA\0323u trong truy v\00E2\0301n c\01A1 s\01A1\0309 cu\0309a ba\0323n.')
,p_version_scn=>2705833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144160095300752924)
,p_name=>'APEXIR_PIVOT_SORT'
,p_message_language=>'vi'
,p_message_text=>unistr('S\0103\0301p x\00EA\0301p ba\0309ng t\00F4\0309ng h\01A1\0323p')
,p_is_js_message=>true
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144126043123752914)
,p_name=>'APEXIR_PIVOT_TOO_MANY_VALUES'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00F4\0323t ba\0309ng t\00F4\0309ng h\01A1\0323p ch\01B0\0301a qua\0301 nhi\00EA\0300u gia\0301 tri\0323 ri\00EAng bi\00EA\0323t - kh\00F4ng th\00EA\0309 ta\0323o SQL ba\0309ng t\00F4\0309ng h\01A1\0323p.')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144057043547752894)
,p_name=>'APEXIR_PIVOT_VIEW_OF'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\00EA\0301 \0111\00F4\0323 xem ba\0309ng t\00F4\0309ng h\01A1\0323p cu\0309a %0')
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144182809413752931)
,p_name=>'APEXIR_PREVIEW'
,p_message_language=>'vi'
,p_message_text=>unistr('Xem tr\01B0\01A1\0301c')
,p_version_scn=>2705858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144113335367752910)
,p_name=>'APEXIR_PREVIOUS'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\01B0\01A1\0301c')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144207665704752939)
,p_name=>'APEXIR_PRIMARY'
,p_message_language=>'vi'
,p_message_text=>unistr('Chi\0301nh')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144183852462752931)
,p_name=>'APEXIR_PRIMARY_REPORT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0301o ca\0301o chi\0301nh')
,p_version_scn=>2705859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144069596848752897)
,p_name=>'APEXIR_PRINT_ACCESSIBLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Bao g\1ED3m c\00E1c th\1EBB tr\1EE3 n\0103ng')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144030330719752886)
,p_name=>'APEXIR_PRINT_STRIP_RICH_TEXT'
,p_message_language=>'vi'
,p_message_text=>unistr('Loa\0323i bo\0309 v\0103n ba\0309n \0111a da\0323ng th\01B0\0301c')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144138767569752918)
,p_name=>'APEXIR_PRIVATE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ri\00EAng t\01B0')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144093741599752904)
,p_name=>'APEXIR_PUBLIC'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00F4ng khai')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144089393505752903)
,p_name=>'APEXIR_RED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0111o\0309')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144235794086752947)
,p_name=>'APEXIR_REGION_STATIC_ID_DOES_NOT_EXIST'
,p_message_language=>'vi'
,p_message_text=>unistr('Ma\0303 ti\0303nh cu\0309a vu\0300ng %0 kh\00F4ng t\00F4\0300n ta\0323i.')
,p_version_scn=>2705869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144122865437752913)
,p_name=>'APEXIR_REMOVE'
,p_message_language=>'vi'
,p_message_text=>unistr('Xo\0301a')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144122987683752913)
,p_name=>'APEXIR_REMOVE_ALL'
,p_message_language=>'vi'
,p_message_text=>unistr('Xo\0301a t\00E2\0301t ca\0309')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144231150495752946)
,p_name=>'APEXIR_REMOVE_CHART'
,p_message_language=>'vi'
,p_message_text=>unistr('Xo\0301a bi\00EA\0309u \0111\00F4\0300')
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144122448846752913)
,p_name=>'APEXIR_REMOVE_CONTROL_BREAK'
,p_message_language=>'vi'
,p_message_text=>unistr('Xo\0301a d\00E2\0301u ng\0103\0301t \0111i\00EA\0300u khi\00EA\0309n')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144122142770752913)
,p_name=>'APEXIR_REMOVE_FILTER'
,p_message_language=>'vi'
,p_message_text=>unistr('Xo\0301a b\00F4\0323 lo\0323c')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144122232511752913)
,p_name=>'APEXIR_REMOVE_FLASHBACK'
,p_message_language=>'vi'
,p_message_text=>unistr('X\00F3a mu\0323c h\1ED3i t\01B0\1EDFng')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144231239819752946)
,p_name=>'APEXIR_REMOVE_GROUP_BY'
,p_message_language=>'vi'
,p_message_text=>unistr('X\00F3a mu\0323c ph\00E2n nh\00F3m theo')
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144122586849752913)
,p_name=>'APEXIR_REMOVE_HIGHLIGHT'
,p_message_language=>'vi'
,p_message_text=>unistr('Xo\0301a ph\00E2\0300n \0111a\0301nh d\00E2\0301u')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144231365108752946)
,p_name=>'APEXIR_REMOVE_PIVOT'
,p_message_language=>'vi'
,p_message_text=>unistr('Xo\0301a ba\0309ng t\00F4\0309ng h\01A1\0323p')
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144212443604752940)
,p_name=>'APEXIR_REMOVE_REPORT'
,p_message_language=>'vi'
,p_message_text=>unistr('Xo\0301a ba\0301o ca\0301o')
,p_version_scn=>2705865
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144194223718752935)
,p_name=>'APEXIR_RENAME_DEFAULT_REPORT'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\00F4\0309i t\00EAn ba\0301o ca\0301o m\0103\0323c \0111i\0323nh')
,p_is_js_message=>true
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144132058764752916)
,p_name=>'APEXIR_RENAME_REPORT'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\00F4\0309i t\00EAn ba\0301o ca\0301o')
,p_is_js_message=>true
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144113625912752910)
,p_name=>'APEXIR_REPORT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0301o ca\0301o')
,p_is_js_message=>true
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144210617457752939)
,p_name=>'APEXIR_REPORTS'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0301o ca\0301o')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144085885363752902)
,p_name=>'APEXIR_REPORT_ALIAS_DOES_NOT_EXIST'
,p_message_language=>'vi'
,p_message_text=>unistr('B\00E1o c\00E1o t\01B0\01A1ng t\00E1c \0111\00E3 l\01B0u v\1EDBi b\00ED danh %0 kh\00F4ng t\1ED3n t\1EA1i.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144139035032752918)
,p_name=>'APEXIR_REPORT_DOES_NOT_EXIST'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0301o ca\0301o kh\00F4ng t\00F4\0300n ta\0323i.')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144085996834752902)
,p_name=>'APEXIR_REPORT_ID_DOES_NOT_EXIST'
,p_message_language=>'vi'
,p_message_text=>unistr('Ma\0303 b\00E1o c\00E1o t\01B0\01A1ng t\00E1c \0111\00E3 l\01B0u %0 kh\00F4ng t\1ED3n t\1EA1i.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144130322329752915)
,p_name=>'APEXIR_REPORT_SETTINGS'
,p_message_language=>'vi'
,p_message_text=>unistr('Ca\0300i \0111\0103\0323t ba\0301o ca\0301o')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144054584252752893)
,p_name=>'APEXIR_REPORT_SETTINGS_OF'
,p_message_language=>'vi'
,p_message_text=>unistr('Ca\0300i \0111\0103\0323t ba\0301o ca\0301o cu\0309a %0')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144110646877752910)
,p_name=>'APEXIR_REPORT_VIEW'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\00EA\0301 \0111\00F4\0323 xem ba\0301o ca\0301o')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144114832114752911)
,p_name=>'APEXIR_RESET'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\0103\0323t la\0323i')
,p_is_js_message=>true
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144093968994752905)
,p_name=>'APEXIR_RESET_CONFIRM'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4i ph\1EE5c b\00E1o c\00E1o v\1EC1 c\00E0i \0111\1EB7t m\1EB7c \0111\1ECBnh.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144089192348752903)
,p_name=>'APEXIR_ROW'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0300ng')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144206783956752938)
,p_name=>'APEXIR_ROWID_NOT_SUPPORTED_FOR_WEBSOURCE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0323n kh\00F4ng th\00EA\0309 s\01B0\0309 du\0323ng ROWID la\0300m c\00F4\0323t ma\0303 chi\0301nh cho Ngu\00F4\0300n d\01B0\0303 li\00EA\0323u REST.')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144121555853752913)
,p_name=>'APEXIR_ROWS'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0300ng')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144184549231752932)
,p_name=>'APEXIR_ROWS_PER_PAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0300ng m\00F4\0303i trang')
,p_is_js_message=>true
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144159840136752924)
,p_name=>'APEXIR_ROW_COLUMNS'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00F4\0323t ha\0300ng')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144159693647752924)
,p_name=>'APEXIR_ROW_COLUMN_N'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00F4\0323t ha\0300ng %0')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144160278160752924)
,p_name=>'APEXIR_ROW_COLUMN_NOT_NULL'
,p_message_language=>'vi'
,p_message_text=>unistr('Pha\0309i chi\0309 \0111i\0323nh c\00F4\0323t ha\0300ng.')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144160481236752924)
,p_name=>'APEXIR_ROW_COL_DIFF_FROM_PIVOT_COL'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00F4\0323t ha\0300ng pha\0309i kha\0301c v\01A1\0301i c\00F4\0323t ba\0309ng t\00F4\0309ng h\01A1\0323p.')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144136065833752917)
,p_name=>'APEXIR_ROW_FILTER'
,p_message_language=>'vi'
,p_message_text=>unistr('B\00F4\0323 l\1ECDc ha\0300ng')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144110782795752910)
,p_name=>'APEXIR_ROW_OF'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0300ng %0/%1')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144115042095752911)
,p_name=>'APEXIR_ROW_TEXT_CONTAINS'
,p_message_language=>'vi'
,p_message_text=>unistr('V\0103n ba\0309n ha\0300ng ch\01B0\0301a')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144088479770752903)
,p_name=>'APEXIR_SAVE'
,p_message_language=>'vi'
,p_message_text=>unistr('L\01B0u')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144125640264752914)
,p_name=>'APEXIR_SAVED_REPORT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0301o ca\0301o \0111a\0303 l\01B0u')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144125593225752914)
,p_name=>'APEXIR_SAVED_REPORT_MSG'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0301o ca\0301o \0111a\0303 l\01B0u = "%0"')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144127770941752915)
,p_name=>'APEXIR_SAVE_DEFAULT_CONFIRM'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00E0i \0111\1EB7t b\00E1o c\00E1o hi\1EC7n t\1EA1i s\1EBD \0111\01B0\1EE3c du\0300ng l\00E0m m\1EB7c \0111\1ECBnh cho t\1EA5t c\1EA3 ng\01B0\1EDDi d\00F9ng.')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144194117653752935)
,p_name=>'APEXIR_SAVE_DEFAULT_REPORT'
,p_message_language=>'vi'
,p_message_text=>unistr('L\01B0u ba\0301o ca\0301o m\0103\0323c \0111i\0323nh')
,p_is_js_message=>true
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144114741000752911)
,p_name=>'APEXIR_SAVE_REPORT'
,p_message_language=>'vi'
,p_message_text=>unistr('L\01B0u ba\0301o ca\0301o')
,p_is_js_message=>true
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144231554288752946)
,p_name=>'APEXIR_SAVE_REPORT_DEFAULT'
,p_message_language=>'vi'
,p_message_text=>unistr('L\01B0u ba\0301o ca\0301o*')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144185518649752932)
,p_name=>'APEXIR_SEARCH'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00ECm ki\1EBFm')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144120412931752913)
,p_name=>'APEXIR_SEARCH_BAR'
,p_message_language=>'vi'
,p_message_text=>unistr('Thanh ti\0300m ki\00EA\0301m')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144053842882752893)
,p_name=>'APEXIR_SEARCH_BAR_OF'
,p_message_language=>'vi'
,p_message_text=>unistr('Thanh ti\0300m ki\00EA\0301m cu\0309a %0')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144231450301752946)
,p_name=>'APEXIR_SEARCH_COLUMN'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\0300m ki\00EA\0301m: %0')
,p_is_js_message=>true
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144191018169752934)
,p_name=>'APEXIR_SEARCH_REPORT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\0300m ki\00EA\0301m ba\0301o ca\0301o')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144175029068752929)
,p_name=>'APEXIR_SELECTED_COLUMNS'
,p_message_language=>'vi'
,p_message_text=>unistr('C\1ED9t \0111\00E3 ch\1ECDn')
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144090104945752903)
,p_name=>'APEXIR_SELECT_COLUMN'
,p_message_language=>'vi'
,p_message_text=>unistr('- Cho\0323n c\00F4\0323t -')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144114064686752911)
,p_name=>'APEXIR_SELECT_COLUMNS'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho\0323n c\00F4\0323t')
,p_is_js_message=>true
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144093630599752904)
,p_name=>'APEXIR_SELECT_FUNCTION'
,p_message_language=>'vi'
,p_message_text=>unistr('- Cho\0323n ha\0300m -')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144121244970752913)
,p_name=>'APEXIR_SELECT_GROUP_BY_COLUMN'
,p_message_language=>'vi'
,p_message_text=>unistr('- Cho\0323n c\00F4\0323t ph\00E2n nho\0301m theo -')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144159346303752924)
,p_name=>'APEXIR_SELECT_PIVOT_COLUMN'
,p_message_language=>'vi'
,p_message_text=>unistr('- Cho\0323n c\00F4\0323t ba\0309ng t\00F4\0309ng h\01A1\0323p -')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144209663148752939)
,p_name=>'APEXIR_SELECT_ROW'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho\0323n ha\0300ng')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144159451851752924)
,p_name=>'APEXIR_SELECT_ROW_COLUMN'
,p_message_language=>'vi'
,p_message_text=>unistr('- Cho\0323n c\00F4\0323t ha\0300ng -')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144040936509752889)
,p_name=>'APEXIR_SEND'
,p_message_language=>'vi'
,p_message_text=>unistr('G\01B0\0309i')
,p_is_js_message=>true
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144063432370752896)
,p_name=>'APEXIR_SEND_AS_EMAIL'
,p_message_language=>'vi'
,p_message_text=>unistr('G\01B0\0309i d\01B0\01A1\0301i da\0323ng email')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144088852392752903)
,p_name=>'APEXIR_SEQUENCE'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\01B0\0301 t\01B0\0323')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144114278607752911)
,p_name=>'APEXIR_SORT'
,p_message_language=>'vi'
,p_message_text=>unistr('S\0103\0301p x\00EA\0301p')
,p_is_js_message=>true
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144123755662752913)
,p_name=>'APEXIR_SORT_ASCENDING'
,p_message_language=>'vi'
,p_message_text=>unistr('S\0103\0301p x\00EA\0301p theo th\01B0\0301 t\01B0\0323 t\0103ng d\00E2\0300n')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144123897788752914)
,p_name=>'APEXIR_SORT_DESCENDING'
,p_message_language=>'vi'
,p_message_text=>unistr('S\0103\0301p x\00EA\0301p theo th\01B0\0301 t\01B0\0323 gia\0309m d\00E2\0300n')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144211891025752940)
,p_name=>'APEXIR_SORT_ORDER'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\1EE9 t\1EF1 s\1EAFp x\1EBFp')
,p_version_scn=>2705865
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144118163652752912)
,p_name=>'APEXIR_SPACE_AS_IN_ONE_EMPTY_STRING'
,p_message_language=>'vi'
,p_message_text=>unistr('d\1EA5u c\00E1ch')
,p_version_scn=>2705848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144129387286752915)
,p_name=>'APEXIR_STATUS'
,p_message_language=>'vi'
,p_message_text=>unistr('Tra\0323ng tha\0301i %0')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144183206141752931)
,p_name=>'APEXIR_SUBSCRIPTION'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\0103ng ky\0301')
,p_is_js_message=>true
,p_version_scn=>2705858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144209066665752939)
,p_name=>'APEXIR_SUBSCRIPTION_ENDING'
,p_message_language=>'vi'
,p_message_text=>unistr('K\00EA\0301t thu\0301c')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144028020419752885)
,p_name=>'APEXIR_SUBSCRIPTION_SKIP_IF_NDF'
,p_message_language=>'vi'
,p_message_text=>unistr('B\1ECF qua n\1EBFu kh\00F4ng t\00ECm th\1EA5y d\1EEF li\1EC7u')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144208921642752939)
,p_name=>'APEXIR_SUBSCRIPTION_STARTING_FROM'
,p_message_language=>'vi'
,p_message_text=>unistr('B\0103\0301t \0111\00E2\0300u t\01B0\0300')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144209895889752939)
,p_name=>'APEXIR_SUM_X'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00F4\0309ng %0')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144200733967752937)
,p_name=>'APEXIR_TABLE_SUMMARY'
,p_message_language=>'vi'
,p_message_text=>unistr('%0, Ba\0301o ca\0301o = %1, Xem = %2')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144087740730752903)
,p_name=>'APEXIR_TEXT_COLOR'
,p_message_language=>'vi'
,p_message_text=>unistr('Ma\0300u v\0103n ba\0309n')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144106441212752908)
,p_name=>'APEXIR_TIME_DAYS'
,p_message_language=>'vi'
,p_message_text=>unistr('nga\0300y')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144106341547752908)
,p_name=>'APEXIR_TIME_HOURS'
,p_message_language=>'vi'
,p_message_text=>unistr('gi\01A1\0300')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144106274798752908)
,p_name=>'APEXIR_TIME_MINS'
,p_message_language=>'vi'
,p_message_text=>unistr('phu\0301t')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144106602326752908)
,p_name=>'APEXIR_TIME_MONTHS'
,p_message_language=>'vi'
,p_message_text=>unistr('tha\0301ng')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144106552541752908)
,p_name=>'APEXIR_TIME_WEEKS'
,p_message_language=>'vi'
,p_message_text=>unistr('tu\00E2\0300n')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144106732427752908)
,p_name=>'APEXIR_TIME_YEARS'
,p_message_language=>'vi'
,p_message_text=>unistr('n\0103m')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144212289298752940)
,p_name=>'APEXIR_TOGGLE'
,p_message_language=>'vi'
,p_message_text=>unistr('B\00E2\0323t/t\0103\0301t')
,p_version_scn=>2705865
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144123036217752913)
,p_name=>'APEXIR_TOP'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\00EAn cu\0300ng')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144205711747752938)
,p_name=>'APEXIR_UNGROUPED_COLUMN'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00F4\0323t \0111a\0303 ta\0301ch nho\0301m')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144124550974752914)
,p_name=>'APEXIR_UNIQUE_HIGHLIGHT_NAME'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00EAn ph\00E2\0300n \0111a\0301nh d\00E2\0301u pha\0309i la\0300 duy nh\00E2\0301t.')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144092439693752904)
,p_name=>'APEXIR_UNSUPPORTED_DATA_TYPE'
,p_message_language=>'vi'
,p_message_text=>unistr('loa\0323i d\01B0\0303 li\00EA\0323u kh\00F4ng \0111\01B0\01A1\0323c h\00F4\0303 tr\01A1\0323')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144123121977752913)
,p_name=>'APEXIR_UP'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00EAn')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144124747777752914)
,p_name=>'APEXIR_VALID_COLOR'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0303y nh\00E2\0323p m\00F4\0323t ma\0300u h\01A1\0323p l\00EA\0323.')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144124805736752914)
,p_name=>'APEXIR_VALID_FORMAT_MASK'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0303y nh\00E2\0323p m\00F4\0323t c\00E2\0301u tru\0301c \0111i\0323nh da\0323ng h\01A1\0323p l\00EA\0323.')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144089604597752903)
,p_name=>'APEXIR_VALUE'
,p_message_language=>'vi'
,p_message_text=>unistr('Gia\0301 tri\0323')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144123651387752913)
,p_name=>'APEXIR_VALUE_AXIS_TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\00EAu \0111\00EA\0300 tru\0323c cho gia\0301 tri\0323')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144131491851752916)
,p_name=>'APEXIR_VALUE_REQUIRED'
,p_message_language=>'vi'
,p_message_text=>unistr('Y\00EAu c\00E2\0300u co\0301 gia\0301 tri\0323')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144093089681752904)
,p_name=>'APEXIR_VCOLUMN'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00F4\0323t do\0323c')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144201833384752937)
,p_name=>'APEXIR_VERTICAL'
,p_message_language=>'vi'
,p_message_text=>unistr('Do\0323c')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144130779993752916)
,p_name=>'APEXIR_VIEW_CHART'
,p_message_language=>'vi'
,p_message_text=>unistr('Xem bi\00EA\0309u \0111\00F4\0300')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144189340299752933)
,p_name=>'APEXIR_VIEW_DETAIL'
,p_message_language=>'vi'
,p_message_text=>unistr('Xem chi ti\00EA\0301t')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144233633881752946)
,p_name=>'APEXIR_VIEW_DOES_NOT_EXIST'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0301o ca\0301o ch\01B0a \0111\01B0\01A1\0323c xa\0301c \0111i\0323nh ch\00EA\0301 \0111\00F4\0323 xem %0.')
,p_version_scn=>2705868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144189410845752933)
,p_name=>'APEXIR_VIEW_GROUP_BY'
,p_message_language=>'vi'
,p_message_text=>unistr('Xem mu\0323c ph\00E2n nh\00F3m theo')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144189298830752933)
,p_name=>'APEXIR_VIEW_ICONS'
,p_message_language=>'vi'
,p_message_text=>unistr('Bi\00EA\0309u t\01B0\01A1\0323ng ch\00EA\0301 \0111\00F4\0323 xem')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144159157916752924)
,p_name=>'APEXIR_VIEW_PIVOT'
,p_message_language=>'vi'
,p_message_text=>unistr('Xem ba\0309ng t\00F4\0309ng h\01A1\0323p')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144130848417752916)
,p_name=>'APEXIR_VIEW_REPORT'
,p_message_language=>'vi'
,p_message_text=>unistr('Xem b\00E1o c\00E1o')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144183430582752931)
,p_name=>'APEXIR_WEEKLY'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0300ng tu\00E2\0300n')
,p_version_scn=>2705858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144113544942752910)
,p_name=>'APEXIR_WORKING_REPORT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0301o ca\0301o \0111ang x\01B0\0309 ly\0301')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144211220572752940)
,p_name=>'APEXIR_X_DAYS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 nga\0300y')
,p_version_scn=>2705865
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144211138597752940)
,p_name=>'APEXIR_X_HOURS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 gi\01A1\0300')
,p_version_scn=>2705865
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144211033238752940)
,p_name=>'APEXIR_X_MINS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 phu\0301t')
,p_version_scn=>2705865
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144211475199752940)
,p_name=>'APEXIR_X_MONTHS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 tha\0301ng')
,p_version_scn=>2705865
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144211355984752940)
,p_name=>'APEXIR_X_WEEKS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 tu\00E2\0300n')
,p_version_scn=>2705865
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144211517116752940)
,p_name=>'APEXIR_X_YEARS'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 n\0103m')
,p_version_scn=>2705865
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144209213290752939)
,p_name=>'APEXIR_YEAR'
,p_message_language=>'vi'
,p_message_text=>unistr('N\0103m')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144087482774752903)
,p_name=>'APEXIR_YELLOW'
,p_message_language=>'vi'
,p_message_text=>unistr('va\0300ng')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144088951451752903)
,p_name=>'APEXIR_YES'
,p_message_language=>'vi'
,p_message_text=>unistr('Co\0301')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144123416371752913)
,p_name=>'APEX_GROUP.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 ch\01B0\0301a < or > la\0300 ca\0301c ky\0301 t\01B0\0323 kh\00F4ng h\01A1\0323p l\00EA\0323.')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144147300599752920)
,p_name=>'APEX_REGION'
,p_message_language=>'vi'
,p_message_text=>unistr('Vu\0300ng')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144038446175752888)
,p_name=>'APEX_ZIP.EXTRACT_FAILED'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\00EA\0309 tri\0301ch xu\00E2\0301t t\00E2\0323p tin ZIP.')
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144038383953752888)
,p_name=>'APEX_ZIP.INVALID_ZIPFILE'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng t\00ECm th\1EA5y ch\1EEF k\00FD cu\1ED1i th\01B0 m\1EE5c trung t\00E2m. T\00E2\0323p tin n\00E0y kh\00F4ng ph\1EA3i l\00E0 t\00E2\0323p tin ZIP.')
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144069412715752897)
,p_name=>'API_PRECONDITION_VIOLATED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 vi pha\0323m \0111i\1EC1u ki\1EC7n ti\00EAn quy\1EBFt c\1EE7a API')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144091500985752904)
,p_name=>'APP.SETTING.CANNOT.GET'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\00EA\0309 l\00E2\0301y gia\0301 tri\0323 cho Ca\0300i \0111\0103\0323t \01B0\0301ng du\0323ng %0 vi\0300 tu\0300y cho\0323n ba\0309n d\01B0\0323ng \0111\01B0\01A1\0323c li\00EAn k\00EA\0301t bi\0323 v\00F4 hi\00EA\0323u ho\0301a.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144091490344752904)
,p_name=>'APP.SETTING.CANNOT.SET'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\00EA\0309 \0111\0103\0323t gia\0301 tri\0323 cho Ca\0300i \0111\0103\0323t \01B0\0301ng du\0323ng %0 vi\0300 tu\0300y cho\0323n ba\0309n d\01B0\0323ng \0111\01B0\01A1\0323c li\00EAn k\00EA\0301t bi\0323 v\00F4 hi\00EA\0323u ho\0301a.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144204066344752937)
,p_name=>'APP.SETTING.INVALID.VALUE'
,p_message_language=>'vi'
,p_message_text=>unistr('Gia\0301 tri\0323 ca\0300i \0111\0103\0323t \01B0\0301ng du\0323ng %0 kh\00F4ng h\01A1\0323p l\00EA\0323')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144203995457752937)
,p_name=>'APP.SETTING.NOT.DEFINED'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\01B0a xa\0301c \0111i\0323nh c\00E0i \0111\1EB7t \1EE9ng d\1EE5ng \0111\01B0\1EE3c y\00EAu c\1EA7u %0')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144204159303752938)
,p_name=>'APP.SETTING.VALUE.NOT.NULL'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\00EA\0309 \0111\0103\0323t gia\0301 tri\0323 r\00F4\0303ng cho ca\0300i \0111\0103\0323t \01B0\0301ng du\0323ng %0')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144078049611752900)
,p_name=>'BACK'
,p_message_language=>'vi'
,p_message_text=>unistr('Quay la\0323i')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144060487073752895)
,p_name=>'BUILDER'
,p_message_language=>'vi'
,p_message_text=>unistr('Tri\0300nh ta\0323o')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144134062814752917)
,p_name=>'BUTTON LABEL'
,p_message_language=>'vi'
,p_message_text=>unistr('Nha\0303n nu\0301t')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144057367581752894)
,p_name=>'BUTTON_CSS_CLASSES'
,p_message_language=>'vi'
,p_message_text=>unistr('Nho\0301m CSS cu\0309a nu\0301t')
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144095809932752905)
,p_name=>'BUTTON_ID'
,p_message_language=>'vi'
,p_message_text=>unistr('Ma\0303 nu\0301t \0111a\0303 ta\0323o se\0303 la\0300 Ma\0303 ti\0303nh cu\0309a nu\0301t n\00EA\0301u \0111\01B0\01A1\0323c xa\0301c \0111i\0323nh. N\00EA\0301u kh\00F4ng ma\0303 se\0303 la\0300 ma\0303 \0111\01B0\01A1\0323c ta\0323o n\00F4\0323i b\00F4\0323 \01A1\0309 \0111i\0323nh da\0323ng ''B'' || [Ma\0303 nu\0301t n\00F4\0323i b\00F4\0323]')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144029895258752886)
,p_name=>'CANDLESTICK'
,p_message_language=>'vi'
,p_message_text=>unistr('Hi\0300nh n\00EA\0301n')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144143872958752919)
,p_name=>'CENTER'
,p_message_language=>'vi'
,p_message_text=>unistr('Gi\01B0\0303a')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144090450721752904)
,p_name=>'CHANGE_PW_REQUEST'
,p_message_language=>'vi'
,p_message_text=>unistr('Y\00EAu c\00E2\0300u %0')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144080479790752901)
,p_name=>'CHECK$'
,p_message_language=>'vi'
,p_message_text=>unistr('b\1ED9 ch\1ECDn h\00E0ng')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144205864301752938)
,p_name=>'CHECKED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0111a\0303 cho\0323n')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144182267183752931)
,p_name=>'COLUMN'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00F4\0323t')
,p_version_scn=>2705858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144139813766752918)
,p_name=>'COMMENTS'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\00FA th\00EDch')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144120858656752913)
,p_name=>'CONTINUE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\00EA\0301p tu\0323c')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144078327817752900)
,p_name=>'COPYRIGHT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0309n quy\00EA\0300n &copy; 1999, %0, Oracle va\0300/ho\0103\0323c ca\0301c c\00F4ng ty li\00EAn k\00EA\0301t cu\0309a Oracle.')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144126532738752914)
,p_name=>'COUNT'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\00EA\0301m')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144133510004752916)
,p_name=>'CREATE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ta\0323o')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144188944413752933)
,p_name=>'CREATED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 ta\0323o')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144189018257752933)
,p_name=>'CREATED_BY'
,p_message_language=>'vi'
,p_message_text=>unistr('Ng\01B0\01A1\0300i ta\0323o')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144109904835752909)
,p_name=>'CREATED_ON'
,p_message_language=>'vi'
,p_message_text=>unistr('Nga\0300y ta\0323o')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144121041724752913)
,p_name=>'CUSTOM'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00F9y ch\1EC9nh')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144132258048752916)
,p_name=>'CUSTOMIZE'
,p_message_language=>'vi'
,p_message_text=>unistr('Tu\0300y chi\0309nh')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144134292777752917)
,p_name=>'CUSTOMIZE.USER_PAGE_PREFS_RESET'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 \0111\1EB7t l\1EA1i ca\0301c tu\0300y cho\0323n trang cho ng\01B0\1EDDi d\00F9ng %0.')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144134391758752917)
,p_name=>'CUSTOMIZE.USER_PREFS_CHANGED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 thay \0111\00F4\0309i ca\0301c tu\0300y cho\0323n cho ng\01B0\1EDDi d\00F9ng %0.')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144134122344752917)
,p_name=>'CUSTOMIZE.USER_PREFS_RESET'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 \0111\1EB7t l\1EA1i ca\0301c tu\0300y cho\0323n trang cho ng\01B0\1EDDi d\00F9ng %0.')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144095201464752905)
,p_name=>'DAILY'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0300ng nga\0300y')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144058696163752894)
,p_name=>'DATA.LOAD.INVALID_FILE'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00E2\0323p tin \0111a\0303 ta\0309i l\00EAn kh\00F4ng h\01A1\0323p l\00EA\0323 ho\0103\0323c co\0301 \0111u\00F4i kh\00F4ng chi\0301nh xa\0301c.')
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144090680711752904)
,p_name=>'DATA.LOAD.INVALID_SELECTOR'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 s\01B0\0309 du\0323ng b\00F4\0323 cho\0323n XML ho\0103\0323c JSON kh\00F4ng h\01A1\0323p l\00EA\0323.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144035752242752887)
,p_name=>'DATA.LOAD.NO_COMMON_COLUMNS'
,p_message_language=>'vi'
,p_message_text=>unistr('H\00F4\0300 s\01A1 d\01B0\0303 li\00EA\0323u va\0300 t\00E2\0323p tin \0111a\0303 ta\0309i l\00EAn kh\00F4ng ch\01B0\0301a b\00E2\0301t ky\0300 c\00F4\0323t na\0300o cu\0309a ba\0309ng \0111i\0301ch.')
,p_version_scn=>2705837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144149632822752921)
,p_name=>'DATA.LOAD.NO_FILE_CONTENTS'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng ti\0300m th\00E2\0301y d\01B0\0303 li\00EA\0323u trong t\00E2\0323p tin \0111a\0303 ta\0309i l\00EAn.')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144149787684752921)
,p_name=>'DATA.LOAD.NO_WORKSHEET_CONTENTS'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng ti\0300m th\00E2\0301y d\01B0\0303 li\00EA\0323u trong ba\0309ng ti\0301nh "%0".')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144055559045752893)
,p_name=>'DATA.LOAD.NO_XLSX_FILE'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00E2\0323p tin \0111a\0303 chi\0309 \0111i\0323nh kh\00F4ng pha\0309i la\0300 t\00E2\0323p tin XLSX.')
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144021576608752883)
,p_name=>'DATA.LOAD.ROWS_PROCESSED'
,p_message_language=>'vi'
,p_message_text=>unistr('Qu\00E1 tr\00ECnh t\1EA3i d\1EEF li\1EC7u \0111\00E3 ho\00E0n t\1EA5t: \0111\00E3 x\1EED l\00FD %0 h\00E0ng.')
,p_version_scn=>2705835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144023856468752884)
,p_name=>'DATA.LOAD.ROWS_PROCESSED_W_ERROR_ROW'
,p_message_language=>'vi'
,p_message_text=>unistr('Qu\00E1 tr\00ECnh t\1EA3i d\1EEF li\1EC7u \0111\00E3 ho\00E0n t\1EA5t: \0111\00E3 x\1EED l\00FD %0 h\00E0ng nh\01B0ng co\0301 1 l\1ED7i.')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144024117860752884)
,p_name=>'DATA.LOAD.ROWS_PROCESSED_W_ERROR_ROWS'
,p_message_language=>'vi'
,p_message_text=>unistr('Qu\00E1 tr\00ECnh t\1EA3i d\1EEF li\1EC7u \0111\00E3 ho\00E0n t\1EA5t: \0111\00E3 x\1EED l\00FD %0 h\00E0ng nh\01B0ng co\0301 %1 l\1ED7i.')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144023904765752884)
,p_name=>'DATA.LOAD.ROW_PROCESSED'
,p_message_language=>'vi'
,p_message_text=>unistr('Qu\00E1 tr\00ECnh t\1EA3i d\1EEF li\1EC7u \0111\00E3 ho\00E0n t\1EA5t: \0111\00E3 x\1EED l\00FD 1 h\00E0ng.')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144038212408752888)
,p_name=>'DATA.LOAD.ROW_PROCESSED_W_ERROR_ROW'
,p_message_language=>'vi'
,p_message_text=>unistr('Qu\00E1 tr\00ECnh t\1EA3i d\1EEF li\1EC7u \0111\00E3 ho\00E0n t\1EA5t: \0111\00E3 x\1EED l\00FD 1 h\00E0ng nh\01B0ng co\0301 l\1ED7i.')
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144024068223752884)
,p_name=>'DATA.LOAD.ROW_PROCESSED_W_ERROR_ROWS'
,p_message_language=>'vi'
,p_message_text=>unistr('Qu\00E1 tr\00ECnh t\1EA3i d\1EEF li\1EC7u \0111\00E3 ho\00E0n t\1EA5t: \0111\00E3 x\1EED l\00FD 1 h\00E0ng ma\0300 kh\00F4ng c\00F3 l\1ED7i.')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144156708723752923)
,p_name=>'DATA_LOAD.COLUMN_NAMES_MAPPING'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00F4\0323t \0111i\0301ch')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144063933309752896)
,p_name=>'DATA_LOAD.DO_NOT_LOAD'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng ta\0309i')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144064089098752896)
,p_name=>'DATA_LOAD.FAILED'
,p_message_language=>'vi'
,p_message_text=>unistr('L\1ED7i ti\1EC1n x\1EED l\00FD')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144156836669752923)
,p_name=>'DATA_LOAD.FIRST_COLUMN_NAMES'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00F4\0323t ngu\00F4\0300n')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144157642618752924)
,p_name=>'DATA_LOAD.FORMAT'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110i\0323nh da\0323ng nga\0300y/s\00F4\0301')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144063766190752896)
,p_name=>'DATA_LOAD.INSERT'
,p_message_language=>'vi'
,p_message_text=>unistr('Che\0300n ha\0300ng')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144219876410752942)
,p_name=>'DATA_LOAD.LOOKUP_FAILED'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng truy lu\0323c \0111\01B0\01A1\0323c gi\00E1 tr\1ECB ti\0300m ki\00EA\0301m.')
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144189568424752933)
,p_name=>'DATA_LOAD.MAPPING'
,p_message_language=>'vi'
,p_message_text=>unistr('Chu\00E2\0309n kh\01A1\0301p d\01B0\0303 li\00EA\0323u/ba\0309ng')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144157775931752924)
,p_name=>'DATA_LOAD.ROW'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0300ng')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144064125924752896)
,p_name=>'DATA_LOAD.SEQUENCE_ACTION'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\01B0\0301 t\01B0\0323: Ha\0300nh \0111\00F4\0323ng')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144151433345752922)
,p_name=>'DATA_LOAD.TRANSFORMATION_FAILED'
,p_message_language=>'vi'
,p_message_text=>unistr('Quy t\1EAFc chuy\1EC3n \0111\1ED5i kh\00F4ng th\00E0nh c\00F4ng')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144063828492752896)
,p_name=>'DATA_LOAD.UPDATE'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00E2\0323p nh\00E2\0323t ha\0300ng')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144126142354752914)
,p_name=>'DATE'
,p_message_language=>'vi'
,p_message_text=>unistr('Nga\0300y')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144099064036752906)
,p_name=>'DAY'
,p_message_language=>'vi'
,p_message_text=>unistr('nga\0300y')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144099104288752906)
,p_name=>'DAYS'
,p_message_language=>'vi'
,p_message_text=>unistr('nga\0300y')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144139524321752918)
,p_name=>'DEBUGGING_OFF'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\0301nh n\0103ng g\01A1\0303 l\00F4\0303i kh\00F4ng \0111\01B0\01A1\0323c ki\0301ch hoa\0323t cho \01B0\0301ng du\0323ng na\0300y.')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144191219243752934)
,p_name=>'DEFAULT'
,p_message_language=>'vi'
,p_message_text=>unistr('M\0103\0323c \0111i\0323nh')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144099864362752906)
,p_name=>'DELETE'
,p_message_language=>'vi'
,p_message_text=>unistr('xo\0301a')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144075413919752899)
,p_name=>'DELETE_MSG'
,p_message_language=>'vi'
,p_message_text=>unistr('B\1EA1n c\00F3 mu\1ED1n th\1EF1c hi\1EC7n h\00E0nh \0111\1ED9ng x\00F3a n\00E0y kh\00F4ng?')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144055021366752893)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES'
,p_message_language=>'vi'
,p_message_text=>unistr('Mu\0323c ghi \0111e\0300 phi\00EAn')
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144055952981752893)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ENABLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho phe\0301p ghi \0111e\0300 phi\00EAn')
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144056817662752894)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ERROR_LOAD'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 xa\0309y ra l\00F4\0303i khi ta\0309i ca\0301c mu\0323c ghi \0111e\0300 phi\00EAn.')
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144056634443752893)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ERROR_SAVE'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 xa\0309y ra l\00F4\0303i khi l\01B0u ca\0301c mu\0323c ghi \0111e\0300 phi\00EAn.')
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144056591946752893)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_SAVED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 l\01B0u ca\0301c mu\0323c ghi \0111e\0300 phi\00EAn. Ha\0303y \0111o\0301ng h\00F4\0323p thoa\0323i na\0300y \0111\00EA\0309 xem ca\0301c thay \0111\00F4\0309i.')
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144029792379752885)
,p_name=>'DIAL_PCT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0309ng chia \0111\00F4\0323 (Ph\00E2\0300n tr\0103m)')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144070792129752898)
,p_name=>'DOWNLOAD'
,p_message_language=>'vi'
,p_message_text=>unistr('Ta\0309i xu\00F4\0301ng')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144190305217752933)
,p_name=>'DUP_USER'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00EAn ng\01B0\01A1\0300i du\0300ng bi\0323 tru\0300ng l\0103\0323p trong danh sa\0301ch.')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144079128615752900)
,p_name=>'EDIT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\1EC9nh s\1EEDa')
,p_is_js_message=>true
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144090351952752903)
,p_name=>'EMAIL_NOT_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng ti\0300m th\00E2\0301y \0111i\0323a chi\0309 email "%0".')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144073090755752898)
,p_name=>'EMAIL_SENT_BY'
,p_message_language=>'vi'
,p_message_text=>unistr('Email na\0300y do %0 g\01B0\0309i.')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144190586435752933)
,p_name=>'EMAIL_TOO_LONG'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110i\0323a chi\0309 email qua\0301 da\0300i. Gi\01A1\0301i ha\0323n la\0300 240 ky\0301 t\01B0\0323.')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144120791563752913)
,p_name=>'ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144151596828752922)
,p_name=>'ERROR_SET_ITEM_STATE_FOR_PPR_REGION'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\1EC3 \0111\1EB7t gi\00E1 tr\1ECB ngu\1ED3n m\1EE5c trang cho v\00F9ng l\00E0m m\1EDBi m\1ED9t ph\1EA7n trang')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144112051677752910)
,p_name=>'F4500_P10_CREATED_BY'
,p_message_language=>'vi'
,p_message_text=>unistr('Ng\01B0\01A1\0300i ta\0323o')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144073369717752898)
,p_name=>'F4500_P2613_EXPIRED'
,p_message_language=>'vi'
,p_message_text=>unistr('M\00E2\0323t kh\00E2\0309u \0111a\0303 h\00EA\0301t ha\0323n')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144065753938752896)
,p_name=>'FILE_EMPTY'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00E2\0323p tin bi\0323 tr\00F4\0301ng.')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144155597611752923)
,p_name=>'FILE_TOO_LARGE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ki\0301ch c\01A1\0303 cu\0309a t\00E2\0323p tin \0111a\0303 ta\0309i l\00EAn v\01B0\01A1\0323t qua\0301 %0 MB. Ha\0303y ta\0309i t\00E2\0323p tin nho\0309 h\01A1n l\00EAn.')
,p_version_scn=>2705852
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144075669074752899)
,p_name=>'FILE_UPLOAD_AUTHENTICATION_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('X\00E1c th\1EF1c ng\01B0\1EDDi d\00F9ng kh\00F4ng th\00E0nh c\00F4ng v\00E0 m\1ED9t ho\1EB7c nhi\1EC1u t\00E2\0323p tin kh\00F4ng \0111\01B0\1EE3c t\1EA3i l\00EAn.')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144075757268752899)
,p_name=>'FILE_UPLOAD_PUBLICUSER_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\01B0\0323c th\00EA\0309 n\00E0y kh\00F4ng cho ph\00E9p ng\01B0\1EDDi d\00F9ng ch\01B0a \0111\01B0\1EE3c x\00E1c th\1EF1c t\1EA3i t\00E2\0323p tin l\00EAn.')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144155685675752923)
,p_name=>'FILTERS'
,p_message_language=>'vi'
,p_message_text=>unistr('B\00F4\0323 lo\0323c')
,p_version_scn=>2705853
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144133684970752916)
,p_name=>'FLOW.SINGLE_VALIDATION_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 xa\0309y ra 1 l\00F4\0303i')
,p_is_js_message=>true
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144132819900752916)
,p_name=>'FLOW.VALIDATION_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 xa\0309y ra %0 l\00F4\0303i')
,p_is_js_message=>true
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144078239112752900)
,p_name=>'FORM_OF'
,p_message_language=>'vi'
,p_message_text=>'%0/%1'
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144117212431752912)
,p_name=>'GO'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110i')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144219480708752942)
,p_name=>'HELP'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\01A1\0323 giu\0301p')
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144060540611752895)
,p_name=>'HOME'
,p_message_language=>'vi'
,p_message_text=>unistr('Trang ch\1EE7')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144098883436752906)
,p_name=>'HOUR'
,p_message_language=>'vi'
,p_message_text=>unistr('gi\01A1\0300')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144098968066752906)
,p_name=>'HOURS'
,p_message_language=>'vi'
,p_message_text=>unistr('gi\01A1\0300')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144080337004752901)
,p_name=>'ICON'
,p_message_language=>'vi'
,p_message_text=>unistr('Bi\00EA\0309u t\01B0\01A1\0323ng %0')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144057616710752894)
,p_name=>'ICON.EDITOR.CROP.HELP'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\01A1\0323 giu\0301p c\0103\0301t bi\00EA\0309u t\01B0\01A1\0323ng')
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144058884626752894)
,p_name=>'ICON.EDITOR.CROPPER.HELPTEXT'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>K\00E9o bi\00EA\0309u t\01B0\01A1\0323ng c\1EE7a b\1EA1n v\00E0 s\1EED d\1EE5ng thanh tr\01B0\1EE3t thu ph\00F3ng \0111\1EC3 \0111\0103\0323t la\0323i v\1ECB tri\0301 bi\00EA\0309u t\01B0\01A1\0323ng \0111\00F3 trong khung.</p>'),
'',
unistr('<p>Khi ta\0309i m\00F4\0323t bi\00EA\0309u t\01B0\01A1\0323ng m\01A1\0301i l\00EAn, bi\00EA\0309u t\01B0\01A1\0323ng \0111o\0301 se\0303 \0111\01B0\01A1\0323c chi\0309nh la\0323i c\01A1\0303 cho v\01B0\0300a v\01A1\0301i 3 \0111i\0323nh da\0323ng: bi\00EA\0309u t\01B0\01A1\0323ng y\00EAu thi\0301ch, nho\0309 va\0300 l\01A1\0301n.</p>'),
'',
unistr('<p>Khi t\1EADp trung v\00E0o tr\00ECnh c\1EAFt bi\00EA\0309u t\01B0\01A1\0323ng, ba\0323n co\0301 th\00EA\0309 s\01B0\0309 du\0323ng c\00E1c ph\00EDm t\0103\0301t sau \0111\00E2y:</p>'),
'<ul>',
unistr('    <li>M\0169i t\00EAn tr\00E1i: Di chuy\1EC3n h\00ECnh \1EA3nh sang tr\00E1i*</li>'),
unistr('     <li>M\0169i t\00EAn l\00EAn: Di chuy\1EC3n h\00ECnh \1EA3nh l\00EAn tr\00EAn*</li>'),
unistr('     <li>M\0169i t\00EAn ph\1EA3i: Di chuy\1EC3n h\00ECnh \1EA3nh sang ph\1EA3i*</li>'),
unistr('     <li>M\0169i t\00EAn xu\1ED1ng: Di chuy\1EC3n h\00ECnh \1EA3nh xu\1ED1ng d\01B0\01A1\0301i*</li>'),
unistr('     <li>I: Ph\00F3ng to</li>'),
unistr('     <li>O: Thu nh\1ECF</li>'),
unistr('     <li>L: Xoay tr\00E1i</li>'),
unistr('     <li>R: Xoay ph\1EA3i</li>'),
'</ul>',
'',
unistr('<p class="margin-top-md"><em>*Gi\1EEF phi\0301m Shift \0111\1EC3 di chuy\1EC3n nhanh h\01A1n</em></p>')))
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144064382022752896)
,p_name=>'ICON.EDITOR.CROPPER.SUBTITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('K\00E9o \0111\1EC3 \0111\1EB7t l\1EA1i v\1ECB tr\00ED bi\1EC3u t\01B0\1EE3ng')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144064416604752896)
,p_name=>'ICON.EDITOR.CROPPER.ZOOM_SLIDER_LABEL'
,p_message_language=>'vi'
,p_message_text=>unistr('Di chuy\1EC3n thanh tr\01B0\1EE3t \0111\1EC3 \0111i\1EC1u ch\1EC9nh m\1EE9c thu ph\00F3ng')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144057419682752894)
,p_name=>'ICON.EDITOR.DIALOG.TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Chi\0309nh s\01B0\0309a bi\00EA\0309u t\01B0\01A1\0323ng \01B0\0301ng du\0323ng')
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144057753079752894)
,p_name=>'ICON.EDITOR.ERROR.SAVING'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i khi l\01B0u bi\00EA\0309u t\01B0\01A1\0323ng')
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144140151245752918)
,p_name=>'ICON.EDITOR.LEGACY_DATA'
,p_message_language=>'vi'
,p_message_text=>unistr('<p><span class="a-Icon icon-tr-warning"></span> \01AF\0301ng du\0323ng na\0300y s\01B0\0309 du\0323ng ca\0301c bi\00EA\0309u t\01B0\01A1\0323ng cu\0303. Vi\00EA\0323c ta\0309i bi\00EA\0309u t\01B0\01A1\0323ng m\01A1\0301i l\00EAn se\0303 thay th\00EA\0301 mo\0323i bi\00EA\0309u t\01B0\01A1\0323ng cu\0303.</p>')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144058384364752894)
,p_name=>'ICON.EDITOR.UPLOAD.ICON'
,p_message_language=>'vi'
,p_message_text=>unistr('Ta\0309i bi\00EA\0309u t\01B0\01A1\0323ng m\01A1\0301i l\00EAn')
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144134531022752917)
,p_name=>'INVALID_CREDENTIALS'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\00F4ng tin xa\0301c th\01B0\0323c \0111\0103ng nh\00E2\0323p kh\00F4ng h\01A1\0323p l\00EA\0323')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144235605124752947)
,p_name=>'INVALID_VALUE_FOR_PARAMETER'
,p_message_language=>'vi'
,p_message_text=>unistr('Gia\0301 tri\0323 kh\00F4ng h\01A1\0323p l\00EA\0323 cho tham s\00F4\0301: %0')
,p_version_scn=>2705869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144128891351752915)
,p_name=>'IR_AS_DEFAULT_REPORT_SETTING'
,p_message_language=>'vi'
,p_message_text=>unistr('D\01B0\01A1\0301i da\0323ng ca\0300i \0111\0103\0323t ba\0301o ca\0301o m\0103\0323c \0111i\0323nh')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144128935333752915)
,p_name=>'IR_AS_NAMED_REPORT'
,p_message_language=>'vi'
,p_message_text=>unistr('D\01B0\01A1\0301i da\0323ng ba\0301o ca\0301o \0111\01B0\1EE3c \0111\1EB7t t\00EAn')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144110882610752910)
,p_name=>'IR_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i %0. %1')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144110520423752909)
,p_name=>'IR_FRM_NAV_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\1EC3 t\00EDnh to\00E1n m\01B0\0301c \0111i\1EC1u h\01B0\1EDBng bi\1EC3u m\1EABu. %0')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144086195233752902)
,p_name=>'IR_NOT_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng ti\0300m th\00E2\0301y ba\0301o ca\0301o t\01B0\01A1ng ta\0301c.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144085578209752902)
,p_name=>'IR_REGION_NOT_EXIST'
,p_message_language=>'vi'
,p_message_text=>unistr('Vu\0300ng ba\0301o ca\0301o t\01B0\01A1ng ta\0301c kh\00F4ng t\00F4\0300n ta\0323i trong \01B0\0301ng du\0323ng %0, trang %1 va\0300 vu\0300ng %2.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144128740692752915)
,p_name=>'IR_STAR'
,p_message_language=>'vi'
,p_message_text=>unistr('Chi\0309 hi\00EA\0309n thi\0323 cho nha\0300 pha\0301t tri\00EA\0309n')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144116925877752911)
,p_name=>'IR_UNIQUE_KEY_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('Truy v\00E2\0301n ba\0301o ca\0301o c\00E2\0300n co\0301 ma\0303 duy nh\00E2\0301t \0111\00EA\0309 xa\0301c \0111i\0323nh m\00F4\0303i ha\0300ng. Kh\00F4ng th\00EA\0309 s\01B0\0309 du\0323ng ma\0303 \0111a\0303 cung c\00E2\0301p cho truy v\00E2\0301n na\0300y. Ha\0303y xa\0301c \0111i\0323nh m\00F4\0323t c\00F4\0323t ma\0303 duy nh\00E2\0301t. %0')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144117009627752911)
,p_name=>'IR_UNIQUE_KEY_ERROR2'
,p_message_language=>'vi'
,p_message_text=>unistr('Truy v\00E2\0301n ba\0301o ca\0301o c\00E2\0300n co\0301 ma\0303 duy nh\00E2\0301t \0111\00EA\0309 xa\0301c \0111i\0323nh m\00F4\0303i ha\0300ng. Kh\00F4ng th\00EA\0309 s\01B0\0309 du\0323ng ma\0303 \0111a\0303 cung c\00E2\0301p cho truy v\00E2\0301n na\0300y. Ha\0303y chi\0309nh s\01B0\0309a ca\0301c thu\00F4\0323c ti\0301nh ba\0301o ca\0301o \0111\00EA\0309 xa\0301c \0111i\0323nh m\00F4\0323t c\00F4\0323t ma\0303 duy nh\00E2\0301t. %0')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144157944368752924)
,p_name=>'ITEM.FILE_UPLOAD.CHOOSE_FILE'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho\0323n t\00E2\0323p tin')
,p_is_js_message=>true
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144157803289752924)
,p_name=>'ITEM.FILE_UPLOAD.DRAG_DROP_FILE_HERE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ke\0301o va\0300 tha\0309 t\00E2\0323p tin va\0300o \0111\00E2y ho\0103\0323c')
,p_is_js_message=>true
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144078556648752900)
,p_name=>'ITEMS'
,p_message_language=>'vi'
,p_message_text=>unistr('Mu\0323c')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144112291528752910)
,p_name=>'ITEM_VALUE'
,p_message_language=>'vi'
,p_message_text=>unistr('Gia\0301 tri\0323 mu\0323c')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144126859810752914)
,p_name=>'LABEL'
,p_message_language=>'vi'
,p_message_text=>unistr('Nha\0303n')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144139474772752918)
,p_name=>'LANGUAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ng\00F4n ng\01B0\0303')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144099550772752906)
,p_name=>'LAST'
,p_message_language=>'vi'
,p_message_text=>unistr('sau c\00F9ng')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144075570283752899)
,p_name=>'LENGTH'
,p_message_language=>'vi'
,p_message_text=>unistr('Chi\00EA\0300u da\0300i')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144133856153752916)
,p_name=>'LOGIN'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\0103ng nh\1EADp')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144175413809752929)
,p_name=>'MANAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('Qua\0309n ly\0301')
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144238545896752948)
,p_name=>'MAXIMIZE'
,p_message_language=>'vi'
,p_message_text=>unistr('Pho\0301ng to')
,p_is_js_message=>true
,p_version_scn=>2705870
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144098627315752906)
,p_name=>'MINUTE'
,p_message_language=>'vi'
,p_message_text=>unistr('phu\0301t')
,p_version_scn=>2705844
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144098752338752906)
,p_name=>'MINUTES'
,p_message_language=>'vi'
,p_message_text=>unistr('phu\0301t')
,p_version_scn=>2705844
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144190786018752934)
,p_name=>'MISSING_AT'
,p_message_language=>'vi'
,p_message_text=>unistr('Thi\00EA\0301u ky\0301 hi\00EA\0323u "@" trong \0111i\0323a chi\0309 email.')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144190913501752934)
,p_name=>'MISSING_DIALOG_PAGE_TEMPLATE_WARNING'
,p_message_language=>'vi'
,p_message_text=>unistr('C\1EA3nh b\00E1o: Ch\01B0a xa\0301c \0111i\0323nh m\1EABu Trang h\1ED9p tho\1EA1i cho trang H\1ED9p tho\1EA1i %0 trong \1EE9ng d\1EE5ng %1.')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144190620757752933)
,p_name=>'MISSING_DOT'
,p_message_language=>'vi'
,p_message_text=>unistr('Thi\00EA\0301u d\00E2\0301u "." trong mi\00EA\0300n \0111i\0323a chi\0309 email.')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144136974954752917)
,p_name=>'MODULE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ph\00E2n h\00EA\0323')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144091122400752904)
,p_name=>'MONTH'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\00E1ng')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144095016443752905)
,p_name=>'MONTHLY'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0300ng tha\0301ng')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144091202551752904)
,p_name=>'MONTHS'
,p_message_language=>'vi'
,p_message_text=>unistr('tha\0301ng')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144126437805752914)
,p_name=>'MOVE'
,p_message_language=>'vi'
,p_message_text=>unistr('Di chuy\00EA\0309n')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144197245761752935)
,p_name=>'MOVE_FROM'
,p_message_language=>'vi'
,p_message_text=>unistr('Di chuy\00EA\0309n t\01B0\0300')
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144197303764752935)
,p_name=>'MOVE_TO'
,p_message_language=>'vi'
,p_message_text=>unistr('Di chuy\00EA\0309n \0111\00EA\0301n')
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144113437600752910)
,p_name=>'MRU.ERROR_IN_MRD'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i khi th\01B0\0323c hi\00EA\0323n thao ta\0301c xo\0301a nhi\00EA\0300u ha\0300ng: ha\0300ng= %0, %1, %2')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144112413940752910)
,p_name=>'MUST_NOT_BE_PUBLIC_USER'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng \0111\01B0\01A1\0323c la\0300 ng\01B0\01A1\0300i du\0300ng th\00F4ng th\01B0\01A1\0300ng')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144061009836752895)
,p_name=>'NAME'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00EAn')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144126628638752914)
,p_name=>'NEW'
,p_message_language=>'vi'
,p_message_text=>unistr('Ta\0323o m\01A1\0301i')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144090996792752904)
,p_name=>'NEW_ACCOUNT_LOGIN_INSTRUCTIONS'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0323n co\0301 th\00EA\0309 \0111\0103ng nh\00E2\0323p va\0300o %0 b\0103\0300ng ca\0301ch chuy\00EA\0309n \0111\00EA\0301n:')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144091005977752904)
,p_name=>'NEW_ACCOUNT_NOTIFICATION'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\00F4ng ba\0301o ta\0300i khoa\0309n %0 m\01A1\0301i')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144219670126752942)
,p_name=>'NEXT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\00EA\0301p theo')
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144136887431752917)
,p_name=>'NO'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144233746052752946)
,p_name=>'NOBODY'
,p_message_language=>'vi'
,p_message_text=>unistr('kh\00F4ng co\0301 ai')
,p_version_scn=>2705868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144099963114752906)
,p_name=>'NOT'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng pha\0309i')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144142821934752919)
,p_name=>'NOT_NULL'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng pha\0309i gia\0301 tri\0323 r\00F4\0303ng')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144112549759752910)
,p_name=>'NOT_W_ARGUMENT'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng pha\0309i %0')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144132387723752916)
,p_name=>'NO_DATA_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('kh\00F4ng ti\0300m th\00E2\0301y d\01B0\0303 li\00EA\0323u')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144142311651752919)
,p_name=>'NO_UPDATEABLE_REPORT_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng ti\0300m th\00E2\0301y ba\0301o ca\0301o co\0301 th\00EA\0309 c\00E2\0323p nh\00E2\0323t. Chi\0309 co\0301 th\00EA\0309 th\01B0\0323c hi\00EA\0323n ca\0301c thao ta\0301c c\00E2\0323p nh\00E2\0323t va\0300 xo\0301a nhi\00EA\0300u ha\0300ng tr\00EAn bi\00EA\0309u m\00E2\0303u da\0323ng ba\0309ng thu\00F4\0323c loa\0323i "Ba\0301o ca\0301o co\0301 th\00EA\0309 c\00E2\0323p nh\00E2\0323t".')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144143202988752919)
,p_name=>'OK'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\1ED3ng \00FD')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144138598599752918)
,p_name=>'ORACLE_APPLICATION_EXPRESS'
,p_message_language=>'vi'
,p_message_text=>'Oracle APEX'
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144237424459752947)
,p_name=>'ORA_06550'
,p_message_language=>'vi'
,p_message_text=>unistr('ORA-06550: do\0300ng %0, c\00F4\0323t %1')
,p_version_scn=>2705870
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144188317564752933)
,p_name=>'OUTDATED_BROWSER'
,p_message_language=>'vi'
,p_message_text=>unistr('B\1EA1n \0111ang s\1EED d\1EE5ng tr\00ECnh duy\1EC7t web \0111a\0303 l\1ED7i th\1EDDi. \0110\1EC3 bi\1EBFt danh s\00E1ch c\00E1c tr\00ECnh duy\1EC7t \0111\01B0\1EE3c h\1ED7 tr\1EE3, ha\0303y tham kh\1EA3o H\01B0\1EDBng d\1EABn c\00E0i \0111\1EB7t Oracle APEX.')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144083377313752901)
,p_name=>'OUT_OF_RANGE'
,p_message_language=>'vi'
,p_message_text=>unistr('Loa\0323t h\00E0ng \0111\01B0\1EE3c y\00EAu c\1EA7u kh\00F4ng h\1EE3p l\1EC7, d\1EEF li\1EC7u ngu\1ED3n c\1EE7a b\00E1o c\00E1o \0111\00E3 \0111\01B0\1EE3c s\1EEDa \0111\1ED5i.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144105350249752908)
,p_name=>'P.VALID_PAGE_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('Pha\0309i chi\0309 \0111i\0323nh s\00F4\0301 trang h\01A1\0323p l\00EA\0323, vi\0301 du\0323: p?n=1234.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144109501386752909)
,p_name=>'PAGINATION.NEXT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\1EBFp theo')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144109608941752909)
,p_name=>'PAGINATION.NEXT_SET'
,p_message_language=>'vi'
,p_message_text=>unistr('Loa\0323t ti\00EA\0301p theo')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144109753158752909)
,p_name=>'PAGINATION.PREVIOUS'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\01B0\01A1\0301c')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144109886405752909)
,p_name=>'PAGINATION.PREVIOUS_SET'
,p_message_language=>'vi'
,p_message_text=>unistr('Loa\0323t tr\01B0\01A1\0301c')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144219552694752942)
,p_name=>'PAGINATION.SELECT'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho\0323n ph\00E2n trang')
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144149575312752921)
,p_name=>'PASSWORD'
,p_message_language=>'vi'
,p_message_text=>unistr('M\00E2\0323t kh\00E2\0309u')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144090266717752903)
,p_name=>'PASSWORD_CHANGED'
,p_message_language=>'vi'
,p_message_text=>unistr('M\00E2\0323t kh\00E2\0309u cu\0309a ba\0323n cho %0 \0111a\0303 \0111\01B0\01A1\0323c thay \0111\00F4\0309i.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144077968643752900)
,p_name=>'PASSWORD_COMPLEXITY_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('M\1EADt kh\1EA9u kh\00F4ng tu\00E2n thu\0309 c\00E1c quy t\1EAFc v\1EC1 \0111\00F4\0323 ph\01B0\0301c ta\0323p cu\0309a m\1EADt kh\1EA9u tr\00EAn trang web n\00E0y.')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144077076403752900)
,p_name=>'PASSWORD_DIFFERS_BY_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('M\00E2\0323t kh\00E2\0309u m\01A1\0301i pha\0309i ch\00EAnh l\00EA\0323ch i\0301t nh\00E2\0301t %0 ky\0301 t\01B0\0323 so v\01A1\0301i m\00E2\0323t kh\00E2\0309u cu\0303.')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144077685690752900)
,p_name=>'PASSWORD_LIKE_USERNAME_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('M\00E2\0323t kh\00E2\0309u kh\00F4ng \0111\01B0\01A1\0323c ch\01B0\0301a t\00EAn ng\01B0\01A1\0300i du\0300ng.')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144077832142752900)
,p_name=>'PASSWORD_LIKE_WORDS_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('M\1EADt kh\1EA9u ch\1EE9a m\1ED9t t\1EEB \0111\01A1n gi\1EA3n b\1ECB c\1EA5m.')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144077741322752900)
,p_name=>'PASSWORD_LIKE_WORKSPACE_NAME_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('M\00E2\0323t kh\00E2\0309u kh\00F4ng \0111\01B0\01A1\0323c ch\01B0\0301a t\00EAn kh\00F4ng gian la\0300m vi\00EA\0323c.')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144076906671752900)
,p_name=>'PASSWORD_MIN_LEN_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('M\00E2\0323t kh\00E2\0309u pha\0309i ch\01B0\0301a i\0301t nh\00E2\0301t %0 ky\0301 t\01B0\0323.')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144077130393752900)
,p_name=>'PASSWORD_ONE_ALPHA_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('M\00E2\0323t kh\00E2\0309u pha\0309i ch\01B0\0301a i\0301t nh\00E2\0301t m\00F4\0323t ky\0301 t\01B0\0323 ba\0309ng ch\01B0\0303 ca\0301i (%0).')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144077509131752900)
,p_name=>'PASSWORD_ONE_LOWER_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('M\00E2\0323t kh\00E2\0309u pha\0309i ch\01B0\0301a i\0301t nh\00E2\0301t m\00F4\0323t ky\0301 t\01B0\0323 ch\01B0\0303 th\01B0\01A1\0300ng theo ba\0309ng ch\01B0\0303 ca\0301i.')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144077282677752900)
,p_name=>'PASSWORD_ONE_NUMERIC_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('M\1EADt kh\1EA9u ph\1EA3i ch\1EE9a \00EDt nh\1EA5t m\1ED9t k\00FD t\1EF1 s\1ED1 (0123456789).')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144077329548752900)
,p_name=>'PASSWORD_ONE_PUNCTUATION_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('M\00E2\0323t kh\00E2\0309u pha\0309i ch\01B0\0301a i\0301t nh\00E2\0301t m\00F4\0323t ky\0301 t\01B0\0323 d\00E2\0301u c\00E2u (%0).')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144077492820752900)
,p_name=>'PASSWORD_ONE_UPPER_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('M\00E2\0323t kh\00E2\0309u pha\0309i ch\01B0\0301a i\0301t nh\00E2\0301t m\00F4\0323t ky\0301 t\01B0\0323 ch\01B0\0303 hoa theo ba\0309ng ch\01B0\0303 ca\0301i.')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144090744899752904)
,p_name=>'PASSWORD_RESET_NOTIFICATION'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\00F4ng ba\0301o \0111\0103\0323t la\0323i m\00E2\0323t kh\00E2\0309u')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144075834001752899)
,p_name=>'PASSWORD_REUSE_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\00EA\0309 s\01B0\0309 du\0323ng m\1EADt kh\1EA9u na\0300y vi\0300 m\00E2\0323t kh\00E2\0309u \0111a\0303 \0111\01B0\1EE3c s\1EED d\1EE5ng trong v\00F2ng %0 ng\00E0y qua.')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144072569982752898)
,p_name=>'PCT_GRAPH_ARIA_LABEL'
,p_message_language=>'vi'
,p_message_text=>unistr('Bi\1EC3u \0111\1ED3 ph\1EA7n tr\0103m')
,p_is_js_message=>true
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144164102339752926)
,p_name=>'PE.COMPONEN.TYPE.PAGE_ITEM.PLURAL'
,p_message_language=>'vi'
,p_message_text=>unistr('Mu\0323c')
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144164286798752926)
,p_name=>'PE.COMPONEN.TYPE.PAGE_ITEM.SINGULAR'
,p_message_language=>'vi'
,p_message_text=>unistr('M\1EE5c')
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144138388560752918)
,p_name=>'PERCENT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ph\00E2\0300n tr\0103m')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144107637040752909)
,p_name=>'PLEASE_CONTACT_ADMINISTRATOR'
,p_message_language=>'vi'
,p_message_text=>unistr('Vui lo\0300ng li\00EAn h\00EA\0323 ng\01B0\01A1\0300i qua\0309n tri\0323.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144219755680752942)
,p_name=>'PREVIOUS'
,p_message_language=>'vi'
,p_message_text=>unistr('Tr\01B0\01A1\0301c')
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144156366953752923)
,p_name=>'PRINT'
,p_message_language=>'vi'
,p_message_text=>'In'
,p_version_scn=>2705854
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144137100171752917)
,p_name=>'PRIVILEGES'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\0103\0323c quy\00EA\0300n')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144105745458752908)
,p_name=>'REGIOIN_REFERENCES'
,p_message_language=>'vi'
,p_message_text=>unistr('Tham chi\00EA\0301u vu\0300ng')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144126717918752914)
,p_name=>'REPORT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0301o ca\0301o')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144137009892752917)
,p_name=>'REPORTING_PERIOD'
,p_message_language=>'vi'
,p_message_text=>unistr('Ky\0300 ba\0301o ca\0301o')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144219929946752942)
,p_name=>'REPORT_LABEL'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0301o ca\0301o: %0')
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144137769167752918)
,p_name=>'REPORT_TOTAL'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00F4\0309ng s\00F4\0301 tr\00EAn ba\0301o ca\0301o')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144083420187752901)
,p_name=>'RESET'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\0103\0323t la\0323i ph\00E2n trang')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144112117358752910)
,p_name=>'RESET_PAGINATION'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\0103\0323t la\0323i ph\00E2n trang')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144142259696752919)
,p_name=>'RESET_PASSWORD'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\0103\0323t la\0323i m\00E2\0323t kh\00E2\0309u')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144118031459752912)
,p_name=>'RESTORE'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4i phu\0323c')
,p_is_js_message=>true
,p_version_scn=>2705848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144151688166752922)
,p_name=>'RESULTS'
,p_message_language=>'vi'
,p_message_text=>unistr('K\00EA\0301t qua\0309')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144143393154752919)
,p_name=>'RETURN_TO_APPLICATION'
,p_message_language=>'vi'
,p_message_text=>unistr('Quay la\0323i \01B0\0301ng du\0323ng.')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144143749148752919)
,p_name=>'RIGHT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ph\1EA3i')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144175722587752929)
,p_name=>'ROW'
,p_message_language=>'vi'
,p_message_text=>unistr('H\00E0ng %0')
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144126348470752914)
,p_name=>'ROW_COUNT'
,p_message_language=>'vi'
,p_message_text=>unistr('S\00F4\0301 l\01B0\01A1\0323ng ha\0300ng')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144016178953752881)
,p_name=>'RW_AO_ASK_ORACLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ho\0309i Oracle')
,p_is_js_message=>true
,p_version_scn=>2705834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144016479242752882)
,p_name=>'RW_AO_CLOSE_ASK_ORACLE'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110o\0301ng Ask Oracle')
,p_is_js_message=>true
,p_version_scn=>2705834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144016718877752882)
,p_name=>'RW_AO_NOTIFICATIONS_LIST'
,p_message_language=>'vi'
,p_message_text=>unistr('Danh sa\0301ch th\00F4ng ba\0301o')
,p_is_js_message=>true
,p_version_scn=>2705834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144016328242752882)
,p_name=>'RW_AO_OPEN_ASK_ORACLE'
,p_message_language=>'vi'
,p_message_text=>unistr('M\01A1\0309 Ask Oracle')
,p_is_js_message=>true
,p_version_scn=>2705834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144016646266752882)
,p_name=>'RW_AO_PRODUCT_MAP'
,p_message_language=>'vi'
,p_message_text=>unistr('S\01A1 \0111\00F4\0300 s\1EA3n ph\1EA9m')
,p_is_js_message=>true
,p_version_scn=>2705834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144016522710752882)
,p_name=>'RW_AO_SUGGESTIONS_LIST'
,p_message_language=>'vi'
,p_message_text=>unistr('Danh s\00E1ch g\1EE3i \00FD')
,p_is_js_message=>true
,p_version_scn=>2705834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144017400537752882)
,p_name=>'RW_CLEAR'
,p_message_language=>'vi'
,p_message_text=>unistr('Xo\0301a')
,p_is_js_message=>true
,p_version_scn=>2705834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144017364792752882)
,p_name=>'RW_CLOSE'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110o\0301ng')
,p_is_js_message=>true
,p_version_scn=>2705834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144017182659752882)
,p_name=>'RW_FO_VIEW_MORE'
,p_message_language=>'vi'
,p_message_text=>unistr('Xem th\00EAm')
,p_is_js_message=>true
,p_version_scn=>2705834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144017555048752882)
,p_name=>'RW_GO_TO'
,p_message_language=>'vi'
,p_message_text=>unistr('Chuy\00EA\0309n \0111\00EA\0301n')
,p_is_js_message=>true
,p_version_scn=>2705834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144016913404752882)
,p_name=>'RW_GP_STEP'
,p_message_language=>'vi'
,p_message_text=>unistr('B\01B0\01A1\0301c')
,p_version_scn=>2705834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144017014094752882)
,p_name=>'RW_GP_STEP_OF'
,p_message_language=>'vi'
,p_message_text=>'/'
,p_version_scn=>2705834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144016868053752882)
,p_name=>'RW_GP_TOGGLE_STEPS'
,p_message_language=>'vi'
,p_message_text=>unistr('B\00E2\0323t t\0103\0301t ch\00EA\0301 \0111\00F4\0323 hi\00EA\0309n thi\0323 b\01B0\01A1\0301c')
,p_version_scn=>2705834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144015960006752881)
,p_name=>'RW_HIDE_PASSWORD'
,p_message_language=>'vi'
,p_message_text=>unistr('\00C2\0309n m\00E2\0323t kh\00E2\0309u')
,p_is_js_message=>true
,p_version_scn=>2705834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144017263872752882)
,p_name=>'RW_OPEN'
,p_message_language=>'vi'
,p_message_text=>unistr('M\01A1\0309')
,p_is_js_message=>true
,p_version_scn=>2705834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144015721069752881)
,p_name=>'RW_ORACLE'
,p_message_language=>'vi'
,p_message_text=>'Oracle'
,p_is_js_message=>true
,p_version_scn=>2705834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144015815622752881)
,p_name=>'RW_SHOW_PASSWORD'
,p_message_language=>'vi'
,p_message_text=>unistr('Hi\00EA\0309n thi\0323 m\00E2\0323t kh\00E2\0309u')
,p_is_js_message=>true
,p_version_scn=>2705834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144017663614752882)
,p_name=>'RW_START'
,p_message_language=>'vi'
,p_message_text=>unistr('B\0103\0301t \0111\00E2\0300u')
,p_is_js_message=>true
,p_version_scn=>2705834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144142750773752919)
,p_name=>'SAVE'
,p_message_language=>'vi'
,p_message_text=>unistr('L\01B0u')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144138954760752918)
,p_name=>'SAVED_REPORTS.ALTERNATIVE.DEFAULT'
,p_message_language=>'vi'
,p_message_text=>unistr('M\0103\0323c \0111i\0323nh thay th\1EBF')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144139302205752918)
,p_name=>'SAVED_REPORTS.DESCRIPTION'
,p_message_language=>'vi'
,p_message_text=>unistr('M\00F4 ta\0309')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144138890541752918)
,p_name=>'SAVED_REPORTS.PRIMARY.DEFAULT'
,p_message_language=>'vi'
,p_message_text=>unistr('M\0103\0323c \0111i\0323nh chi\0301nh')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144139628086752918)
,p_name=>'SC_REPORT_ROWS'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00F3 s\1EB5n h\01A1n %0 h\00E0ng. Ha\0303y t\0103ng b\1ED9 ch\1ECDn h\00E0ng \0111\1EC3 xem nhi\1EC1u h\00E0ng h\01A1n.')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144207072054752938)
,p_name=>'SEARCH'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00ECm ki\1EBFm')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144098515433752906)
,p_name=>'SECONDS'
,p_message_language=>'vi'
,p_message_text=>unistr('gi\00E2y')
,p_version_scn=>2705844
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144138424575752918)
,p_name=>'SEE_ATTACHED'
,p_message_language=>'vi'
,p_message_text=>unistr('Xem ph\00E2\0300n \0111i\0301nh ke\0300m')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144199093442752936)
,p_name=>'SELECT_ROW'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho\0323n ha\0300ng')
,p_version_scn=>2705863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144138165598752918)
,p_name=>'SET_SCREEN_READER_MODE_OFF'
,p_message_language=>'vi'
,p_message_text=>unistr('T\0103\0301t ch\00EA\0301 \0111\00F4\0323 tri\0300nh \0111o\0323c ma\0300n hi\0300nh')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144138272222752918)
,p_name=>'SET_SCREEN_READER_MODE_ON'
,p_message_language=>'vi'
,p_message_text=>unistr('B\00E2\0323t ch\00EA\0301 \0111\00F4\0323 tri\0300nh \0111o\0323c ma\0300n hi\0300nh')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144134492804752917)
,p_name=>'SHOW'
,p_message_language=>'vi'
,p_message_text=>unistr('Hi\00EA\0309n thi\0323')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144200889393752937)
,p_name=>'SHOW_ALL'
,p_message_language=>'vi'
,p_message_text=>unistr('Hi\00EA\0309n thi\0323 t\00E2\0301t ca\0309')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144225666347752944)
,p_name=>'SIGN_IN'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\0103ng nh\00E2\0323p')
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144176561797752929)
,p_name=>'SIGN_OUT'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\0103ng xu\00E2\0301t')
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144127398838752915)
,p_name=>'SINCE_DAYS_AGO'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 nga\0300y tr\01B0\01A1\0301c')
,p_is_js_message=>true
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144134991500752917)
,p_name=>'SINCE_DAYS_FROM_NOW'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 nga\0300y k\00EA\0309 t\01B0\0300 b\00E2y gi\01A1\0300')
,p_is_js_message=>true
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144127290441752915)
,p_name=>'SINCE_HOURS_AGO'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 gi\01A1\0300 tr\01B0\01A1\0301c')
,p_is_js_message=>true
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144134803565752917)
,p_name=>'SINCE_HOURS_FROM_NOW'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 gi\01A1\0300 k\00EA\0309 t\01B0\0300 b\00E2y gi\01A1\0300')
,p_is_js_message=>true
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144127174094752915)
,p_name=>'SINCE_MINUTES_AGO'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 phu\0301t tr\01B0\01A1\0301c')
,p_is_js_message=>true
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144134789323752917)
,p_name=>'SINCE_MINUTES_FROM_NOW'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 phu\0301t k\00EA\0309 t\01B0\0300 b\00E2y gi\01A1\0300')
,p_is_js_message=>true
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144127502946752915)
,p_name=>'SINCE_MONTHS_AGO'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 tha\0301ng tr\01B0\01A1\0301c')
,p_is_js_message=>true
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144135165421752917)
,p_name=>'SINCE_MONTHS_FROM_NOW'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 tha\0301ng k\00EA\0309 t\01B0\0300 b\00E2y gi\01A1\0300')
,p_is_js_message=>true
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144135323348752917)
,p_name=>'SINCE_NOW'
,p_message_language=>'vi'
,p_message_text=>unistr('B\00E2y gi\01A1\0300')
,p_is_js_message=>true
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144127009480752914)
,p_name=>'SINCE_SECONDS_AGO'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 gi\00E2y tr\01B0\01A1\0301c')
,p_is_js_message=>true
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144134621426752917)
,p_name=>'SINCE_SECONDS_FROM_NOW'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 gi\00E2y k\00EA\0309 t\01B0\0300 b\00E2y gi\01A1\0300')
,p_is_js_message=>true
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144127493444752915)
,p_name=>'SINCE_WEEKS_AGO'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 tu\00E2\0300n tr\01B0\01A1\0301c')
,p_is_js_message=>true
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144135042644752917)
,p_name=>'SINCE_WEEKS_FROM_NOW'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 tu\00E2\0300n k\00EA\0309 t\01B0\0300 b\00E2y gi\01A1\0300')
,p_is_js_message=>true
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144127601326752915)
,p_name=>'SINCE_YEARS_AGO'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 n\0103m tr\01B0\01A1\0301c')
,p_is_js_message=>true
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144135231690752917)
,p_name=>'SINCE_YEARS_FROM_NOW'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 n\0103m k\00EA\0309 t\01B0\0300 b\00E2y gi\01A1\0300')
,p_is_js_message=>true
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144121149711752913)
,p_name=>'STANDARD'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\00EAu chu\00E2\0309n')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144138001004752918)
,p_name=>'START_DATE'
,p_message_language=>'vi'
,p_message_text=>unistr('Nga\0300y b\0103\0301t \0111\00E2\0300u')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144073218427752898)
,p_name=>'SUBSCRIPTION_CREATED_BY'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0323n nh\00E2\0323n \0111\01B0\01A1\0323c email na\0300y t\01B0\0300 go\0301i \0111\0103ng ky\0301 ba\0301o ca\0301o t\01B0\01A1ng ta\0301c do %0 ta\0323o.')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144234816855752947)
,p_name=>'SUBSCRIPTION_REFERENCES'
,p_message_language=>'vi'
,p_message_text=>unistr('Go\0301i \0111\0103ng ky\0301')
,p_version_scn=>2705869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144184256465752932)
,p_name=>'TAB'
,p_message_language=>'vi'
,p_message_text=>'Tab'
,p_version_scn=>2705859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144098487860752906)
,p_name=>'TITLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ti\00EAu \0111\00EA\0300')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144078188999752900)
,p_name=>'TODAY'
,p_message_language=>'vi'
,p_message_text=>unistr('H\00F4m nay')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144137678283752918)
,p_name=>'TOTAL'
,p_message_language=>'vi'
,p_message_text=>unistr('T\1ED5ng')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144079434777752900)
,p_name=>'TO_MANY_COLUMNS_SELECTED'
,p_message_language=>'vi'
,p_message_text=>unistr('Co\0301 th\00EA\0309 cho\0323n t\00F4\0301i \0111a %0 c\00F4\0323t.')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144035222922752887)
,p_name=>'TREE.COLLAPSE_ALL'
,p_message_language=>'vi'
,p_message_text=>unistr('Thu go\0323n t\00E2\0301t ca\0309')
,p_is_js_message=>true
,p_version_scn=>2705837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144035814613752887)
,p_name=>'TREE.COLLAPSE_ALL_BELOW'
,p_message_language=>'vi'
,p_message_text=>unistr('Thu go\0323n t\00E2\0301t ca\0309 mu\0323c b\00EAn d\01B0\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144034866089752887)
,p_name=>'TREE.EXPAND_ALL'
,p_message_language=>'vi'
,p_message_text=>unistr('M\01A1\0309 r\00F4\0323ng t\00E2\0301t ca\0309')
,p_is_js_message=>true
,p_version_scn=>2705837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144035508004752887)
,p_name=>'TREE.EXPAND_ALL_BELOW'
,p_message_language=>'vi'
,p_message_text=>unistr('M\01A1\0309 r\00F4\0323ng t\00E2\0301t ca\0309 mu\0323c b\00EAn d\01B0\01A1\0301i')
,p_is_js_message=>true
,p_version_scn=>2705837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144036065723752887)
,p_name=>'TREE.REPARENT'
,p_message_language=>'vi'
,p_message_text=>unistr('Thay \0111\00F4\0309i tha\0300nh ph\00E2\0300n cha')
,p_is_js_message=>true
,p_version_scn=>2705837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144158102142752924)
,p_name=>'TREES'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00E2y')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144200901876752937)
,p_name=>'UI.FORM.REQUIRED'
,p_message_language=>'vi'
,p_message_text=>unistr('B\0103\0301t bu\00F4\0323c')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144121847823752913)
,p_name=>'UNAUTHORIZED'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng \0111\01B0\01A1\0323c u\0309y quy\00EA\0300n')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144172032918752928)
,p_name=>'UNAVAILABLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng s\0103\0303n co\0301')
,p_version_scn=>2705856
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144135781633752917)
,p_name=>'UNKNOWN'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng xa\0301c \0111i\0323nh')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144074153425752899)
,p_name=>'UNKNOWN_AUTHENTICATION_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\00E3 x\1EA3y ra l\1ED7i x\00E1c th\1EF1c kh\00F4ng \0111\01B0\1EE3c nh\1EADn d\1EA1ng.')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144076398703752899)
,p_name=>'UNSUBSCRIBE_SUBSCRIPTION_MSG_HTML'
,p_message_language=>'vi'
,p_message_text=>unistr('N\00EA\0301u ba\0323n kh\00F4ng mu\00F4\0301n nh\00E2\0323n email n\01B0\0303a, ha\0303y nh\00E2\0301p va\0300o <a href="%0">hu\0309y \0111\0103ng ky\0301</a> \0111\00EA\0309 qua\0309n ly\0301 go\0301i \0111\0103ng ky\0301 cu\0309a ba\0323n.')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144073174283752898)
,p_name=>'UNSUBSCRIBE_SUBSCRIPTION_MSG_TXT'
,p_message_language=>'vi'
,p_message_text=>unistr('N\00EA\0301u ba\0323n kh\00F4ng mu\00F4\0301n nh\00E2\0323n email n\01B0\0303a, ha\0303y truy c\00E2\0323p va\0300o URL sau \0111\00E2y \0111\00EA\0309 qua\0309n ly\0301 go\0301i \0111\0103ng ky\0301 cu\0309a ba\0323n:')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144112695638752910)
,p_name=>'UNSUPPORTED_DATA_TYPE'
,p_message_language=>'vi'
,p_message_text=>unistr('loa\0323i d\01B0\0303 li\00EA\0323u kh\00F4ng \0111\01B0\01A1\0323c h\00F4\0303 tr\01A1\0323')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144099745199752906)
,p_name=>'UPDATE'
,p_message_language=>'vi'
,p_message_text=>unistr('c\00E2\0323p nh\00E2\0323t')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144098341410752906)
,p_name=>'UPDATED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\00E3 c\1EADp nh\1EADt')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144041598625752889)
,p_name=>'UPGRADE_IN_PROGRESS'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110ang n\00E2ng c\00E2\0301p')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144041849188752889)
,p_name=>'UPGRADE_IN_PROGRESS_DETAIL'
,p_message_language=>'vi'
,p_message_text=>unistr('Oracle APEX \0111ang \0111\01B0\01A1\0323c n\00E2ng c\00E2\0301p l\00EAn phi\00EAn ba\0309n m\01A1\0301i h\01A1n. Qua\0301 tri\0300nh na\0300y th\01B0\01A1\0300ng m\00E2\0301t t\00F4\0301i \0111a 3 phu\0301t.')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144105182119752908)
,p_name=>'URL_PROHIBITED'
,p_message_language=>'vi'
,p_message_text=>unistr('URL \0111\01B0\01A1\0323c y\00EAu c\00E2\0300u \0111a\0303 bi\0323 c\00E2\0301m. Ha\0303y li\00EAn h\00EA\0323 ng\01B0\01A1\0300i qu\1EA3n tr\1ECB.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144126232833752914)
,p_name=>'USER'
,p_message_language=>'vi'
,p_message_text=>unistr('Ng\01B0\01A1\0300i du\0300ng')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144149453147752921)
,p_name=>'USERNAME'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00EAn ng\01B0\01A1\0300i du\0300ng')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144190894990752934)
,p_name=>'USERNAME_TOO_LONG'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00EAn ng\01B0\01A1\0300i du\0300ng qua\0301 da\0300i. Gi\01A1\0301i ha\0323n la\0300 %0 ky\0301 t\01B0\0323.')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144133304140752916)
,p_name=>'USERS'
,p_message_language=>'vi'
,p_message_text=>unistr('ng\01B0\01A1\0300i du\0300ng')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144190478578752933)
,p_name=>'USER_EXISTS'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00EAn ng\01B0\01A1\0300i du\0300ng \0111a\0303 t\00F4\0300n ta\0323i.')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144204270340752938)
,p_name=>'USER_PROFILE_IMAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('Hi\0300nh a\0309nh h\00F4\0300 s\01A1 cho ng\01B0\1EDDi d\00F9ng %0')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144066165274752896)
,p_name=>'UTILIZATION_REPORTS.AUTOMATION'
,p_message_language=>'vi'
,p_message_text=>unistr('T\01B0\0323 \0111\00F4\0323ng ho\0301a - %0')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144064624968752896)
,p_name=>'UTILIZATION_REPORTS.PAGE'
,p_message_language=>'vi'
,p_message_text=>'Trang %0 - %1 '
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144067535124752897)
,p_name=>'UTILIZATION_REPORTS.PLUG_NAME'
,p_message_language=>'vi'
,p_message_text=>'%0 - %1'
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144067685158752897)
,p_name=>'UTILIZATION_REPORTS.PROCESS_NAME'
,p_message_language=>'vi'
,p_message_text=>'%0 - %1'
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144066548060752896)
,p_name=>'UTILIZATION_REPORTS.SEARCH_CONFIG'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00E2\0301u hi\0300nh ti\0300m ki\00EA\0301m - %0')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144066410536752896)
,p_name=>'UTILIZATION_REPORTS.SHARED_DYNAMIC_LOV'
,p_message_language=>'vi'
,p_message_text=>unistr('Danh sa\0301ch gia\0301 tri\0323 \0111\00F4\0323ng du\0300ng chung - %0')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144066288197752896)
,p_name=>'UTILIZATION_REPORTS.TASK_DEFINITION'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110i\0323nh nghi\0303a c\00F4ng vi\00EA\0323c - %0')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144064724897752896)
,p_name=>'UTILIZATION_REPORTS.WORKFLOW'
,p_message_language=>'vi'
,p_message_text=>unistr('Lu\00F4\0300ng c\00F4ng vi\00EA\0323c - %0 ')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144086833477752902)
,p_name=>'VALID'
,p_message_language=>'vi'
,p_message_text=>unistr('H\01A1\0323p l\00EA\0323')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144078441101752900)
,p_name=>'VALIDATIONS'
,p_message_language=>'vi'
,p_message_text=>unistr('Ki\00EA\0309m duy\00EA\0323t')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144139138504752918)
,p_name=>'VALUE_MUST_BE_SPECIFIED'
,p_message_language=>'vi'
,p_message_text=>unistr('Pha\0309i chi\0309 \0111i\0323nh gia\0301 tri\0323')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144185425377752932)
,p_name=>'VALUE_MUST_BE_SPECIFIED_FOR'
,p_message_language=>'vi'
,p_message_text=>unistr('Pha\0309i chi\0309 \0111i\0323nh gia\0301 tri\0323 cho %0')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144108022215752909)
,p_name=>'VERTICAL'
,p_message_language=>'vi'
,p_message_text=>unistr('do\0323c')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144099653805752906)
,p_name=>'VIEW'
,p_message_language=>'vi'
,p_message_text=>'xem'
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144133499657752916)
,p_name=>'VIEWS'
,p_message_language=>'vi'
,p_message_text=>unistr('ch\00EA\0301 \0111\00F4\0323 xem')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144139909734752918)
,p_name=>'VIEW_ALL'
,p_message_language=>'vi'
,p_message_text=>unistr('Xem t\00E2\0301t ca\0309')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144079861660752900)
,p_name=>'VISUALLY_HIDDEN_LINK'
,p_message_language=>'vi'
,p_message_text=>unistr('Li\00EAn k\1EBFt kh\00F4ng hi\00EA\0309n thi\0323')
,p_is_js_message=>true
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144120616731752913)
,p_name=>'WARNING'
,p_message_language=>'vi'
,p_message_text=>unistr('Ca\0309nh ba\0301o')
,p_is_js_message=>true
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144099283394752906)
,p_name=>'WEEK'
,p_message_language=>'vi'
,p_message_text=>unistr('tu\00E2\0300n')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144095142449752905)
,p_name=>'WEEKLY'
,p_message_language=>'vi'
,p_message_text=>unistr('Ha\0300ng tu\00E2\0300n')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144099355446752906)
,p_name=>'WEEKS'
,p_message_language=>'vi'
,p_message_text=>unistr('tu\00E2\0300n')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144139210868752918)
,p_name=>'WELCOME_USER'
,p_message_language=>'vi'
,p_message_text=>unistr('Cha\0300o m\01B0\0300ng: %0')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144137457945752918)
,p_name=>'WWV_DBMS_SQL.INVALID_CLOB'
,p_message_language=>'vi'
,p_message_text=>unistr('Pha\0301t hi\00EA\0323n th\1EA5y gi\00E1 tr\1ECB kh\00F4ng h\1EE3p l\1EC7, ha\0303y x\00E1c minh d\01B0\0303 li\00EA\0323u \0111a\0303 nh\00E2\0323p.')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144137506759752918)
,p_name=>'WWV_DBMS_SQL.INVALID_DATATYPE'
,p_message_language=>'vi'
,p_message_text=>unistr('Pha\0301t hi\00EA\0323n th\1EA5y gi\00E1 tr\1ECB kh\00F4ng h\1EE3p l\1EC7, ha\0303y x\00E1c minh d\01B0\0303 li\00EA\0323u \0111a\0303 nh\00E2\0323p.')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144075348046752899)
,p_name=>'WWV_DBMS_SQL.INVALID_DATE'
,p_message_language=>'vi'
,p_message_text=>unistr('Pha\0301t hi\00EA\0323n th\1EA5y gi\00E1 tr\1ECB ng\00E0y kh\00F4ng h\1EE3p l\1EC7, ha\0303y x\00E1c minh \0111\1ECBnh d\1EA1ng ng\00E0y.')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144137397651752918)
,p_name=>'WWV_DBMS_SQL.INVALID_NUMBER'
,p_message_language=>'vi'
,p_message_text=>unistr('Pha\0301t hi\00EA\0323n th\1EA5y gi\00E1 tr\1ECB s\00F4\0301 kh\00F4ng h\1EE3p l\1EC7, ha\0303y x\00E1c minh \0111\1ECBnh d\1EA1ng s\00F4\0301.')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144086451697752902)
,p_name=>'WWV_DBMS_SQL.INVALID_TIMESTAMP'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00ECm th\1EA5y gi\00E1 tr\1ECB nha\0303n th\01A1\0300i gian kh\00F4ng h\1EE3p l\1EC7, vui l\00F2ng x\00E1c minh \0111\1ECBnh d\1EA1ng nha\0303n th\01A1\0300i gian.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144110956269752910)
,p_name=>'WWV_DBMS_SQL.UNABLE_TO_BIND_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\1EC3 li\00EAn k\1EBFt "%0". Ha\0303y s\1EED d\1EE5ng d\1EA5u ngo\1EB7c k\00E9p cho c\00E1c m\1EE5c nhi\1EC1u byte ho\1EB7c x\00E1c minh r\0103\0300ng \0111\1ED9 d\00E0i c\1EE7a m\1EE5c kh\00F4ng v\01B0\01A1\0323t qua\0301 30 byte. S\1EED d\1EE5ng c\00FA ph\00E1p v() \0111\1EC3 tham chi\1EBFu c\00E1c m\1EE5c d\00E0i qua\0301 30 byte.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144100715516752907)
,p_name=>'WWV_FLOW.ACCESS_DENIED'
,p_message_language=>'vi'
,p_message_text=>unistr('Quy\1EC1n truy c\1EADp b\1ECB quy tri\0300nh ki\1EC3m tra b\1EA3o m\1EADt %0 t\1EEB ch\1ED1i')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144103299067752907)
,p_name=>'WWV_FLOW.APP_NOT_AVAILABLE'
,p_message_language=>'vi'
,p_message_text=>unistr('\01AF\0301ng du\0323ng kh\00F4ng kha\0309 du\0323ng')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144101639687752907)
,p_name=>'WWV_FLOW.APP_NOT_FOUND_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng ti\0300m th\00E2\0301y \01B0\0301ng du\0323ng.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144101731267752907)
,p_name=>'WWV_FLOW.APP_NOT_FOUND_FOOTER_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('\01B0\0301ng du\0323ng=%0 kh\00F4ng gian la\0300m vi\00EA\0323c=%1')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144102128221752907)
,p_name=>'WWV_FLOW.APP_RESTRICTED'
,p_message_language=>'vi'
,p_message_text=>unistr('Quy\00EA\0300n truy c\00E2\0323p va\0300o \01B0\0301ng du\0323ng na\0300y bi\0323 ha\0323n ch\00EA\0301, vui lo\0300ng th\01B0\0309 la\0323i sau.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144102097724752907)
,p_name=>'WWV_FLOW.APP_RESTRICTED_TO_DEV'
,p_message_language=>'vi'
,p_message_text=>unistr('Chi\0309 ca\0301c nha\0300 pha\0301t tri\00EA\0309n \01B0\0301ng du\0323ng m\01A1\0301i co\0301 quy\00EA\0300n truy c\00E2\0323p va\0300o \01B0\0301ng du\0323ng na\0300y, vui lo\0300ng th\01B0\0309 la\0323i sau.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144101285548752907)
,p_name=>'WWV_FLOW.BRANCH_FUNC_RETURNING_URL_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('ERR-7744 Kh\00F4ng th\1EC3 x\1EED l\00FD nh\00E1nh \0111\00EA\0301n h\00E0m tr\1EA3 v\1EC1 URL.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144101160027752907)
,p_name=>'WWV_FLOW.BRANCH_TO_FUNCT_RET_PAGE_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('ERR-7744 Kh\00F4ng th\1EC3 x\1EED l\00FD nh\00E1nh \0111\00EA\0301n h\00E0m tr\1EA3 v\1EC1 trang.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144101442402752907)
,p_name=>'WWV_FLOW.CALL_TO_SHOW_FROM_PROC_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('ERR-1430 Kh\00F4ng h\00F4\0303 tr\01A1\0323 quy tri\0300nh go\0323i \0111\00EA\0309 hi\00EA\0309n thi\0323 t\01B0\0300 trang: G_FLOW_STEP_ID (%0).')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144102500591752907)
,p_name=>'WWV_FLOW.CLEAR_STEP_CACHE_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('ERR-1018 L\00F4\0303i khi xo\0301a b\00F4\0323 nh\01A1\0301 \0111\00EA\0323m b\01B0\01A1\0301c.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144100987274752907)
,p_name=>'WWV_FLOW.COMP_UNKNOWN_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('ERR-1005 Loa\0323i ti\0301nh toa\0301n kh\00F4ng xa\0301c \0111i\0323nh.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144101801585752907)
,p_name=>'WWV_FLOW.CUSTOM_AUTH_SESSION_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('ERR-1201 Ma\0303 phi\00EAn kh\00F4ng \0111\01B0\01A1\0323c \0111\0103\0323t cho xa\0301c th\01B0\0323c tu\0300y chi\0309nh.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144101994752752907)
,p_name=>'WWV_FLOW.CUSTOM_AUTH_SESSION_FOOTER_ERR'
,p_message_language=>'vi'
,p_message_text=>'trang=%0'
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144101517505752907)
,p_name=>'WWV_FLOW.DET_COMPANY_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('ERR-7620 Kh\00F4ng th\00EA\0309 xa\0301c \0111i\0323nh kh\00F4ng gian la\0300m vi\00EA\0323c cho \01B0\0301ng du\0323ng (%0).')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144082067048752901)
,p_name=>'WWV_FLOW.EDIT'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\1EC9nh s\1EEDa')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144100664899752907)
,p_name=>'WWV_FLOW.FIND_ITEM_ERR2'
,p_message_language=>'vi'
,p_message_text=>unistr('ERR-1802 Kh\00F4ng th\00EA\0309 ti\0300m th\00E2\0301y ma\0303 mu\0323c "%0"')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144100375495752906)
,p_name=>'WWV_FLOW.FIND_ITEM_ID_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('ERR-1002 Kh\00F4ng th\00EA\0309 ti\0300m th\00E2\0301y ma\0303 mu\0323c cho mu\0323c "%0" trong \01B0\0301ng du\0323ng "%1".')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144100407753752907)
,p_name=>'WWV_FLOW.FIND_ITEM_ID_ERR2'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i kh\00F4ng mong \0111\01A1\0323i, kh\00F4ng th\00EA\0309 ti\0300m th\00E2\0301y t\00EAn mu\0323c \01A1\0309 c\00E2\0301p \0111\00F4\0323 \01B0\0301ng du\0323ng ho\0103\0323c trang.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144100865297752907)
,p_name=>'WWV_FLOW.FIRST_PAGE_DATA_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0323n \0111a\0303 \01A1\0309 trang \0111\00E2\0300u ti\00EAn cu\0309a d\01B0\0303 li\00EA\0323u.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144117317984752912)
,p_name=>'WWV_FLOW.ITEM_POSTING_VIOLATION'
,p_message_language=>'vi'
,p_message_text=>unistr('Ma\0303 mu\0323c (%0) kh\00F4ng pha\0309i la\0300 mu\0323c \0111\01B0\01A1\0323c xa\0301c \0111i\0323nh tr\00EAn trang hi\00EA\0323n ta\0323i.')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144074939791752899)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.INTERNAL_ONLY'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\00EA\0309 \0111\0103\0323t m\1EE5c b\1EB1ng c\00E1ch chuy\1EC3n ca\0301c \0111\1ED1i s\1ED1 sang \1EE9ng d\1EE5ng.')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144075236624752899)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.NO_CHECKSUM'
,p_message_language=>'vi'
,p_message_text=>unistr('(Kh\00F4ng co\0301 gia\0301 tri\0323 t\00F4\0309ng ki\00EA\0309m na\0300o \0111\01B0\01A1\0323c cung c\00E2\0301p)')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144074756425752899)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.PRIVATE_BOOKMARK'
,p_message_language=>'vi'
,p_message_text=>unistr('M\1EE5c c\00F3 th\1EC3 \0111\01B0\1EE3c \0111\1EB7t khi \0111i k\00E8m m\00F4\0323t gia\0301 tri\0323 t\1ED5ng ki\1EC3m "d\1EA5u trang c\1EA5p ng\01B0\01A1\0300i du\0300ng".')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144074673330752899)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.PUBLIC_BOOKMARK'
,p_message_language=>'vi'
,p_message_text=>unistr('M\1EE5c c\00F3 th\1EC3 \0111\01B0\1EE3c \0111\1EB7t khi \0111i k\00E8m m\00F4\0323t gia\0301 tri\0323 t\1ED5ng ki\1EC3m "d\1EA5u trang c\1EA5p \1EE9ng d\1EE5ng".')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144074828818752899)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.SESSION'
,p_message_language=>'vi'
,p_message_text=>unistr('M\1EE5c c\00F3 th\1EC3 \0111\01B0\1EE3c \0111\1EB7t khi \0111i k\00E8m m\00F4\0323t gia\0301 tri\0323 t\1ED5ng ki\1EC3m "phi\00EAn".')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144074586023752899)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.UNPROTECTED'
,p_message_language=>'vi'
,p_message_text=>unistr('Mu\0323c kh\00F4ng \0111\01B0\01A1\0323c ba\0309o v\00EA\0323.')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144102638485752907)
,p_name=>'WWV_FLOW.NO_PAGE_HELP'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng co\0301 tr\01A1\0323 giu\0301p tr\00EAn trang.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144090593784752904)
,p_name=>'WWV_FLOW.NO_PRIV_ON_SCHEMA'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng gian l\00E0m vi\1EC7c %0 kh\00F4ng c\00F3 \0111\1EB7c quy\1EC1n ph\00E2n ta\0301ch d\01B0\1EDBi d\1EA1ng gia\0309n \0111\1ED3 %1.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144101026986752907)
,p_name=>'WWV_FLOW.PAGE_ACCEPT_RECUR_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('ERR-1010 \0110a\0303 v\01B0\1EE3t qu\00E1 gi\1EDBi h\1EA1n \0111\1EC7 quy x\1EED l\00FD ch\00E2\0301p nh\00E2\0323n nha\0301nh \0111\00EA\0301n trang. %0')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144057507158752894)
,p_name=>'WWV_FLOW.PAGE_PATTERN_NOT_RUNNABLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Trang kh\00F4ng kha\0309 du\0323ng, ba\0323n kh\00F4ng th\00EA\0309 cha\0323y m\00E2\0303u trang.')
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144075177813752899)
,p_name=>'WWV_FLOW.PAGE_PROTECTION.SHOW_NO_URL_ALLOWED'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\00EA\0309 go\0323i trang na\0300y b\0103\0300ng URL ho\0103\0323c b\0103\0300ng l\00EA\0323nh GET hay POST \0111\00F4\0301i v\01A1\0301i quy tri\0300nh hi\00EA\0309n thi\0323, ma\0300 pha\0309i go\0323i trang na\0300y b\0103\0300ng loa\0323i nha\0301nh "Nha\0301nh \0111\00EA\0301n trang".')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144159903654752924)
,p_name=>'WWV_FLOW.SAVE_ROUTINE_NUMERIC_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\1ED7i khi c\00F4\0301 l\01B0u gi\00E1 tr\1ECB kh\00F4ng ph\1EA3i s\1ED1 v\00E0o m\1EE5c %0. ')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144092236440752904)
,p_name=>'WWV_FLOW.SCHEMA_NOT_EXISTS'
,p_message_language=>'vi'
,p_message_text=>unistr('Gia\0309n \0111\1ED3 ph\00E2n ta\0301ch c\1EE7a \1EE9ng d\1EE5ng "%0" kh\00F4ng t\1ED3n t\1EA1i trong c\01A1 s\1EDF d\1EEF li\1EC7u.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144092369675752904)
,p_name=>'WWV_FLOW.SERVICE_ADMIN_LINK'
,p_message_language=>'vi'
,p_message_text=>unistr('Chi\0309 co\0301 th\00EA\0309 s\01B0\0309 du\0323ng ca\0301c ta\0300i khoa\0309n trong kh\00F4ng gian la\0300m vi\00EA\0323c INTERNAL \0111\00EA\0309 truy c\00E2\0323p &PRODUCT_NAME. <a href="%0">Di\0323ch vu\0323 qua\0309n tri\0323</a>.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144100271264752906)
,p_name=>'WWV_FLOW.SESSION_INFO_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('ERR-1029 Kh\00F4ng th\00EA\0309 l\01B0u tr\01B0\0303 th\00F4ng tin phi\00EAn. phi\00EAn=%0 mu\0323c=%1')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144103303583752907)
,p_name=>'WWV_FLOW.UNABLE_TO_STOP_TRACE_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\1EC3 d\1EEBng do\0300 ti\0300m: %0')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144100530006752907)
,p_name=>'WWV_FLOW.UNEXPECTED_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i kh\00F4ng mong \0111\01A1\0323i')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144111370172752910)
,p_name=>'WWV_FLOW.UPDATE_SUB_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i trong update_substitution_cache: %0')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144103437649752907)
,p_name=>'WWV_FLOW.VIEW_HELP_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('Pha\0309i cung c\00E2\0301p \01B0\0301ng du\0323ng va\0300 trang \0111\00EA\0309 xem tr\01A1\0323 giu\0301p.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144125154674752914)
,p_name=>'WWV_FLOW_AUTOMATION.AUTOMATION_NOT_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng ti\0300m th\00E2\0301y mu\0323c t\01B0\0323 \0111\00F4\0323ng.')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144060607717752895)
,p_name=>'WWV_FLOW_AUTOMATION.QUERY_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i truy v\00E2\0301n t\01B0\0323 \0111\00F4\0323ng: %0')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144104589711752908)
,p_name=>'WWV_FLOW_CACHE.PURGE_SESSION'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 sa\0300ng lo\0323c %0 phi\00EAn.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144045880722752890)
,p_name=>'WWV_FLOW_CODE_EXEC_MLE.LANGUAGE_NOT_SUPPORTED'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\1EC3 th\1EF1c thi m\00E3 %0! Ma\0303 na\0300y kh\00F4ng \0111\01B0\1EE3c c\01A1 s\1EDF d\1EEF li\1EC7u h\1ED7 tr\1EE3 ho\1EB7c kh\00F4ng \0111\01B0\1EE3c k\00EDch ho\1EA1t b\0103\0300ng tham s\1ED1 th\01B0\0323c th\00EA\0309 MLE_LANGUAGES.')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144043496089752890)
,p_name=>'WWV_FLOW_CODE_EXEC_MLE.MLE_NOT_SUPPORTED'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng du\0300ng \0111\01B0\01A1\0323c c\00F4ng c\1EE5 \0111a ng\00F4n ng\1EEF tr\00EAn phi\00EAn b\1EA3n c\01A1 s\1EDF d\1EEF li\1EC7u n\00E0y!')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144082648155752901)
,p_name=>'WWV_FLOW_COLLECTION.ARRAY_NOT_NULL'
,p_message_language=>'vi'
,p_message_text=>unistr('Ma\0309ng t\00E2\0323p h\01A1\0323p \01B0\0301ng du\0323ng kh\00F4ng \0111\01B0\01A1\0323c r\00F4\0303ng')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144082463348752901)
,p_name=>'WWV_FLOW_COLLECTION.ATTRIBUTE_NUMBER_OUTSIDE_RANGE'
,p_message_language=>'vi'
,p_message_text=>unistr('S\1ED1 thu\1ED9c t\00EDnh th\00E0nh ph\00E2\0300n \0111\01B0\1EE3c ch\1EC9 \0111\1ECBnh %0 kh\00F4ng h\1EE3p l\1EC7. S\1ED1 thu\1ED9c t\00EDnh ph\1EA3i n\1EB1m trong kho\1EA3ng t\1EEB 1 \0111\1EBFn %1')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144082916566752901)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_EXISTS'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00E2\0323p h\01A1\0323p \01B0\0301ng du\0323ng \0111a\0303 t\00F4\0300n ta\0323i')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144082755553752901)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NAME_NOT_NULL'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00EAn t\00E2\0323p h\01A1\0323p kh\00F4ng \0111\01B0\01A1\0323c r\00F4\0303ng')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144082855548752901)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NAME_TOO_LARGE'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00EAn t\00E2\0323p h\01A1\0323p kh\00F4ng \0111\01B0\01A1\0323c da\0300i qua\0301 255 ky\0301 t\01B0\0323')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144082273144752901)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NOT_EXIST'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00E2\0323p h\01A1\0323p \01B0\0301ng du\0323ng %0 kh\00F4ng t\00F4\0300n ta\0323i')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144083069972752901)
,p_name=>'WWV_FLOW_COLLECTION.CURSOR_NOT_OPEN'
,p_message_language=>'vi'
,p_message_text=>unistr('Con tr\1ECF v\1EABn ch\01B0a m\1EDF')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144082390973752901)
,p_name=>'WWV_FLOW_COLLECTION.MEMBER_NOT_EXIST'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Th\01B0\0301 t\01B0\0323 tha\0300nh ph\00E2\0300n %0 kh\00F4ng t\00F4\0300n ta\0323i trong t\00E2\0323p h\01A1\0323p \01B0\0301ng du\0323ng %1'),
''))
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144082559825752901)
,p_name=>'WWV_FLOW_COLLECTION.MEMBER_SEQUENCE_NUMBER_INVALID'
,p_message_language=>'vi'
,p_message_text=>unistr('Th\01B0\0301 t\01B0\0323 tha\0300nh ph\00E2\0300n %0 kh\00F4ng t\00F4\0300n ta\0323i trong t\00E2\0323p h\01A1\0323p \01B0\0301ng du\0323ng "%1"')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144035305888752887)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_ALGORITHM'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng h\00F4\0303 tr\01A1\0323 thu\1EADt to\00E1n %0 \0111\1ED1i v\1EDBi ECDSA.')
,p_version_scn=>2705837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144035053468752887)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_EC_CURVE'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng h\00F4\0303 tr\01A1\0323 \0111\01B0\01A1\0300ng cong elip %0.')
,p_version_scn=>2705837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144160727392752925)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_FUNCTION'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng h\1ED7 tr\1EE3 ch\1EE9c n\0103ng m\1EADt m\00E3 "%0" tr\00EAn h\1EC7 th\1ED1ng n\00E0y.')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144213063743752940)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_ACCESSIBLE'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\00E3 ki\1EC3m tra kh\1EA3 n\0103ng truy c\1EADp')
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144104060555752908)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_CLOSE'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110o\0301ng')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144104126848752908)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_CUST_OPT'
,p_message_language=>'vi'
,p_message_text=>unistr('Tu\0300y cho\0323n tu\0300y chi\0309nh trang')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144104226881752908)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_DEFAULT'
,p_message_language=>'vi'
,p_message_text=>unistr('M\0103\0323c \0111i\0323nh')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144104386585752908)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_DISP'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 hi\00EA\0309n thi\0323')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144104489851752908)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_HIDDEN'
,p_message_language=>'vi'
,p_message_text=>unistr('Bi\0323 \00E2\0309n')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144103854744752908)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE1'
,p_message_language=>'vi'
,p_message_text=>unistr('Cho\0323n ca\0301c vu\0300ng ba\0323n mu\00F4\0301n \0111\01B0a va\0300o trang na\0300y. Ca\0301c vu\0300ng \0111\01B0\01A1\0323c cho\0323n co\0301 th\00EA\0309 kh\00F4ng hi\00EA\0309n thi\0323 n\00EA\0301u ba\0323n \01A1\0309 ng\01B0\0303 ca\0309nh \01B0\0301ng du\0323ng kh\00F4ng phu\0300 h\01A1\0323p ho\0103\0323c kh\00F4ng co\0301 ca\0301c \0111\0103\0323c quy\00EA\0300n thi\0301ch h\01A1\0323p.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144103992369752908)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE2'
,p_message_language=>'vi'
,p_message_text=>unistr('Trang n\00E0y kh\00F4ng th\00EA\0309 tu\0300y chi\0309nh.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144213375778752940)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE3'
,p_message_language=>'vi'
,p_message_text=>unistr('B\1EA1n c\00F3 th\1EC3 c\00E1 nh\00E2n h\00F3a giao di\1EC7n c\1EE7a \1EE9ng d\1EE5ng n\00E0y b\1EB1ng c\00E1ch thay \0111\1ED5i Ki\1EC3u ch\1EE7 \0111\1EC1. Ha\0303y ch\1ECDn Ki\1EC3u ch\1EE7 \0111\1EC1 t\1EEB danh s\00E1ch b\00EAn d\01B0\1EDBi r\00F4\0300i nh\1EA5p v\00E0o \00C1p d\1EE5ng thay \0111\1ED5i.')
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144214135418752941)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_REGION_DISP'
,p_message_language=>'vi'
,p_message_text=>unistr('Hi\00EA\0309n thi\0323 vu\0300ng')
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144213274463752940)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_REMOVE_STYLE'
,p_message_language=>'vi'
,p_message_text=>unistr('S\01B0\0309 du\0323ng ki\00EA\0309u m\0103\0323c \0111i\0323nh cu\0309a \01B0\0301ng du\0323ng')
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144213115897752940)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_THEME_STYLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Giao di\00EA\0323n ')
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144157312408752924)
,p_name=>'WWV_FLOW_DATA_EXPORT.AGG_COLUMN_IDX_NOT_EXIST'
,p_message_language=>'vi'
,p_message_text=>unistr('Chi\0309 mu\0323c c\00F4\0323t \0111\01B0\01A1\0323c tham chi\00EA\0301u trong ph\00E2\0300n t\00F4\0309ng h\01A1\0323p %0 kh\00F4ng t\00F4\0300n ta\0323i.')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144050098851752892)
,p_name=>'WWV_FLOW_DATA_EXPORT.APPEND_NOT_SUPPORTED'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng h\00F4\0303 tr\01A1\0323 th\00EAm ta\0301c vu\0323 xu\1EA5t d\1EEF li\1EC7u cho \0111\1ECBnh d\1EA1ng %0.')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144013010827752881)
,p_name=>'WWV_FLOW_DATA_EXPORT.CLOB_NOT_SUPPORTED'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng h\1ED7 tr\1EE3 \0111\1EA7u ra CLOB \0111\1ED1i v\1EDBi \0111\1ECBnh d\1EA1ng %0.')
,p_version_scn=>2705833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144157096600752923)
,p_name=>'WWV_FLOW_DATA_EXPORT.COLUMN_BREAK_MUST_BE_IN_THE_BEGGINING'
,p_message_language=>'vi'
,p_message_text=>unistr('D\1EA5u ng\1EAFt c\1ED9t c\00E2\0300n ph\1EA3i \1EDF \0111\1EA7u m\1EA3ng c\1ED9t.')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144157132162752924)
,p_name=>'WWV_FLOW_DATA_EXPORT.COLUMN_GROUP_IDX_NOT_EXIST'
,p_message_language=>'vi'
,p_message_text=>unistr('Chi\0309 mu\0323c nho\0301m c\00F4\0323t \0111\01B0\01A1\0323c tham chi\00EA\0301u trong %0 kh\00F4ng t\00F4\0300n ta\0323i.')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144064275819752896)
,p_name=>'WWV_FLOW_DATA_EXPORT.EXPORT'
,p_message_language=>'vi'
,p_message_text=>unistr('xu\00E2\0301t')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144071408903752898)
,p_name=>'WWV_FLOW_DATA_EXPORT.FORMAT_MUST_BE_XML'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110i\0323nh da\0323ng xu\00E2\0301t pha\0309i la\0300 XML v\01A1\0301i Ma\0301y chu\0309 in la\0300 ORDS.')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144157471002752924)
,p_name=>'WWV_FLOW_DATA_EXPORT.HIGHLIGHT_COLUMN_IDX_NOT_EXIST'
,p_message_language=>'vi'
,p_message_text=>unistr('Chi\0309 mu\0323c c\00F4\0323t \0111\01B0\01A1\0323c tham chi\00EA\0301u trong ph\00E2\0300n \0111a\0301nh d\00E2\0301u %0 kh\00F4ng t\00F4\0300n ta\0323i.')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144060867814752895)
,p_name=>'WWV_FLOW_DATA_EXPORT.INVALID_FORMAT'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110i\0323nh da\0323ng xu\00E2\0301t kh\00F4ng h\01A1\0323p l\00EA\0323: %0')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144157217620752924)
,p_name=>'WWV_FLOW_DATA_EXPORT.PARENT_GROUP_IDX_NOT_EXIST'
,p_message_language=>'vi'
,p_message_text=>unistr('Chi\0309 mu\0323c nho\0301m chi\0301nh \0111\01B0\01A1\0323c tham chi\00EA\0301u trong %0 kh\00F4ng t\00F4\0300n ta\0323i.')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144182462502752931)
,p_name=>'WWV_FLOW_DATA_LOADER.CANNOT_LOAD_INTO_GENERATED_ALWAYS_COLUMN'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00F4\0323t %1 cu\0309a ba\0309ng %0 la\0300 c\00F4\0323t danh ti\0301nh "GENERATED ALWAYS". Ha\0303y \0111a\0309m ba\0309o r\0103\0300ng kh\00F4ng co\0301 c\00F4\0323t ngu\00F4\0300n na\0300o \0111\01B0\01A1\0323c chu\00E2\0309n kh\01A1\0301p v\01A1\0301i c\00F4\0323t %1 trong h\00F4\0323p thoa\0323i \0110i\0323nh c\00E2\0301u hi\0300nh.')
,p_version_scn=>2705858
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144094034252752905)
,p_name=>'WWV_FLOW_DATA_LOADER.COMMIT_INTERVAL_TOO_LOW'
,p_message_language=>'vi'
,p_message_text=>unistr('Kho\1EA3ng th\1EDDi gian g\01B0\0309i \0111a\0303 ch\1EC9 \0111\1ECBnh qu\00E1 th\1EA5p.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144094107743752905)
,p_name=>'WWV_FLOW_DATA_LOADER.NO_COLUMNS_PROVIDED'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\01B0a c\00F3 c\1ED9t n\00E0o \0111\01B0\1EE3c cung c\1EA5p \0111\1EC3 t\1EA3i d\1EEF li\1EC7u.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144095449741752905)
,p_name=>'WWV_FLOW_DATA_PARSER.NO_COLUMNS_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng t\00ECm th\1EA5y c\1ED9t n\00E0o cho b\1ED9 ch\1ECDn h\00E0ng "%0". Ha\0303y th\01B0\0309 t\1EF1 \0111\1ED9ng ph\00E1t hi\1EC7n ho\1EB7c ki\00EA\0309m tra c\1EA5u tr\00FAc JSON.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144104842551752908)
,p_name=>'WWV_FLOW_DATA_PARSER.NO_WORKSHEETS_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng ti\0300m th\00E2\0301y ba\0309ng ti\0301nh trong t\00E2\0323p tin XLSX.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144049927579752891)
,p_name=>'WWV_FLOW_DATA_PARSER.REQUESTED_HIERARCHY_LEVELS_EXCEED_MAXIMUM'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00E1c c\00E2\0301p \0111\01B0\1EE3c y\00EAu c\1EA7u cu\0309a h\00EA\0323 th\00F4\0301ng c\00E2\0301p b\00E2\0323c \0111\1EC3 kh\00E1m ph\00E1 (%0) v\01B0\1EE3t qu\00E1 gia\0301 tri\0323 t\1ED1i \0111a la\0300 %1.')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144104755518752908)
,p_name=>'WWV_FLOW_DATA_PARSER.WORKSHEET_DOES_NOT_EXIST'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0309ng ti\0301nh \0111a\0303 chi\0309 \0111i\0323nh kh\00F4ng t\00F4\0300n ta\0323i trong t\00E2\0323p tin XLSX.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144083112558752901)
,p_name=>'WWV_FLOW_DML.VERSION_OF_DATA_CHANGED'
,p_message_language=>'vi'
,p_message_text=>unistr('Phi\00EAn b\1EA3n hi\1EC7n t\1EA1i c\1EE7a d\1EEF li\1EC7u trong c\01A1 s\1EDF d\1EEF li\1EC7u \0111\00E3 thay \0111\1ED5i k\1EC3 t\1EEB khi ng\01B0\1EDDi d\00F9ng kh\01A1\0309i cha\0323y quy tr\00ECnh c\1EADp nh\1EADt.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144086025982752902)
,p_name=>'WWV_FLOW_EDIT_REPORT.ERR_UPDATING_COLS'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i khi c\00E2\0323p nh\00E2\0323t ca\0301c c\00F4\0323t ba\0301o ca\0301o: %0')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144196580840752935)
,p_name=>'WWV_FLOW_EXEC.CANNOT_CONVERT_TO_SDOGEOMETRY'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\00EA\0309 chuy\00EA\0309n \0111\00F4\0309i %0 sang SDO_GEOMETRY.')
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144133045289752916)
,p_name=>'WWV_FLOW_EXEC.CAN_NOT_CONVERT_TO_VARCHAR2'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\00EA\0309 chuy\00EA\0309n \0111\00F4\0309i c\00F4\0323t %0 thu\00F4\0323c loa\0323i d\01B0\0303 li\00EA\0323u %1 sang VARCHAR2!')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144140494237752918)
,p_name=>'WWV_FLOW_EXEC.COLUMN_NOT_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng ti\0300m th\00E2\0301y c\00F4\0323t "%0" \0111a\0303 chi\0309 \0111i\0323nh cho thu\00F4\0323c ti\0301nh "%1" trong ngu\00F4\0300n d\01B0\0303 li\00EA\0323u!')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144076509181752899)
,p_name=>'WWV_FLOW_EXEC.FILTER_NOT_SUPPORTED_WITH_MULTIPLE_VALUES'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng h\1ED7 tr\1EE3 loa\0323i b\00F4\0323 lo\0323c %0 \0111\00F4\0301i v\01A1\0301i ca\0301c c\00F4\0323t nhi\00EA\0300u gia\0301 tri\0323.')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144200034001752936)
,p_name=>'WWV_FLOW_EXEC.INVALID_BETWEEN_FILTER'
,p_message_language=>'vi'
,p_message_text=>unistr('B\00F4\0323 lo\0323c "trong khoa\0309ng" kh\00F4ng h\01A1\0323p l\00EA\0323.')
,p_version_scn=>2705863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144055633640752893)
,p_name=>'WWV_FLOW_EXEC.INVALID_COLUMN_OR_ROW_DATATYPE'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng ti\0300m th\00E2\0301y gia\0301 tri\0323 %2 trong c\00F4\0323t %0, ha\0300ng #%1.')
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144052314683752892)
,p_name=>'WWV_FLOW_EXEC.INVALID_COLUMN_OR_ROW_REFERENCE'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00F4\0323t %0 ho\0103\0323c ha\0300ng #%1 kh\00F4ng t\00F4\0300n ta\0323i.')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144038980407752888)
,p_name=>'WWV_FLOW_EXEC.INVALID_LOV_SPECIFICATION'
,p_message_language=>'vi'
,p_message_text=>unistr('Lo\1EA1i danh sa\0301ch gia\0301 tri\0323 \0111\01B0\1EE3c ch\1EC9 \0111\1ECBnh kh\00F4ng h\1EE3p l\1EC7.')
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144038873819752888)
,p_name=>'WWV_FLOW_EXEC.INVALID_QUERY_TYPE'
,p_message_language=>'vi'
,p_message_text=>unistr('Lo\1EA1i truy v\1EA5n kh\00F4ng h\1EE3p l\1EC7. Lo\1EA1i truy v\1EA5n ph\1EA3i l\00E0 B\1EA3ng, Truy v\1EA5n SQL ho\1EB7c H\00E0m PL/SQL tr\1EA3 v\1EC1 Truy v\1EA5n SQL.')
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144133115075752916)
,p_name=>'WWV_FLOW_EXEC.INVALID_SQL_QUERY'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Kh\00F4ng ph\00E2n ta\0301ch \0111\01B0\01A1\0323c truy v\00E2\0301n SQL!'),
'%0'))
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144140596497752918)
,p_name=>'WWV_FLOW_EXEC.LEGACY_COLUMN_NOT_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng ti\0300m th\00E2\0301y vi\0323 tri\0301 c\00F4\0323t \0111a\0303 chi\0309 \0111i\0323nh %0 cho thu\00F4\0323c ti\0301nh "%1" trong c\00E2u l\00EA\0323nh SQL!')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144030550762752886)
,p_name=>'WWV_FLOW_EXEC.MULTI_VALUE_TOO_MANY_ITEMS'
,p_message_language=>'vi'
,p_message_text=>unistr('Qua\0301 nhi\00EA\0300u mu\0323c \0111\01B0\01A1\0323c s\01B0\0309 du\0323ng trong b\00F4\0323 lo\0323c Nhi\00EA\0300u gi\00E1 tr\1ECB.')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144140380345752918)
,p_name=>'WWV_FLOW_EXEC.NO_COLUMN_FOR_ATTRIBUTE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\01B0a chi\0309 \0111i\0323nh c\00F4\0323t cho thu\00F4\0323c ti\0301nh "%0".')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144038704555752888)
,p_name=>'WWV_FLOW_EXEC.NULL_QUERY_RETURNED_BY_FUNCTION'
,p_message_language=>'vi'
,p_message_text=>unistr('N\1ED9i dung h\00E0m PL/SQL kh\00F4ng tr\1EA3 v\1EC1 gi\00E1 tr\1ECB.')
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144156121530752923)
,p_name=>'WWV_FLOW_EXEC.OPERATION_NOT_PRESENT_IN_WEB_SRC_MODULE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ngu\1ED3n d\1EEF li\1EC7u REST kh\00F4ng ch\1EE9a Thao t\00E1c \0111\1EC3 x\1EED l\00FD h\00E0nh \0111\1ED9ng DML \0111\01B0\1EE3c y\00EAu c\1EA7u.')
,p_version_scn=>2705854
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144197825181752936)
,p_name=>'WWV_FLOW_EXEC.RANGE_BUCKET.NOT.SUPPORTED'
,p_message_language=>'vi'
,p_message_text=>unistr('B\1ED9 l\1ECDc ph\1EA1m vi ch\1EC9 \0111\01B0\1EE3c h\1ED7 tr\1EE3 \0111\1ED1i v\1EDBi c\00E1c lo\1EA1i d\1EEF li\1EC7u NUMBER, DATE ho\1EB7c TIMESTAMP.')
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144018738935752882)
,p_name=>'WWV_FLOW_EXEC.REST_REQUEST_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('Y\00EAu c\00E2\0300u kh\00F4ng tha\0300nh c\00F4ng v\01A1\0301i %0')
,p_version_scn=>2705835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144022213736752883)
,p_name=>'WWV_FLOW_EXEC.SPATIAL_JSON_NOT_AVAILABLE'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng du\0300ng \0111\01B0\01A1\0323c t\00EDnh n\0103ng chuy\1EC3n \0111\1ED5i t\1EEB GeoJSON sang SDO_GEOMETRY (c\1ED9t %0) trong c\01A1 s\1EDF d\1EEF li\1EC7u n\00E0y.')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144025666124752884)
,p_name=>'WWV_FLOW_EXEC.SPATIAL_NOT_SUPPORTED_FOR_XML'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng h\1ED7 tr\1EE3 t\00EDnh n\0103ng chuy\1EC3n \0111\1ED5i SDO_GEOMETRY (c\1ED9t %0) \0111\1ED1i v\1EDBi c\00E1c ngu\1ED3n d\1EEF li\1EC7u XML.')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144049717443752891)
,p_name=>'WWV_FLOW_EXEC.UNSUPPPORTED_MULTI_VALUE_SEPARATOR'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng h\1ED7 tr\1EE3 k\00FD t\1EF1 %0 d\01B0\1EDBi d\1EA1ng d\1EA5u ph\00E2n c\00E1ch nhi\1EC1u gi\00E1 tr\1ECB.')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144197954418752936)
,p_name=>'WWV_FLOW_EXEC.WRONG_CONTEXT_TYPE'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\00EA\0309 s\01B0\0309 du\0323ng ha\0300m na\0300y tr\00EAn Ng\01B0\0303 ca\0309nh truy v\00E2\0301n.')
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144025743991752884)
,p_name=>'WWV_FLOW_EXEC_API.INVALID_DATA_TYPE'
,p_message_language=>'vi'
,p_message_text=>unistr('Loa\0323i d\01B0\0303 li\00EA\0323u c\00F4\0323t kh\00F4ng kh\1EDBp.')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144059228027752894)
,p_name=>'WWV_FLOW_EXEC_DOC_SRC.REMOTE_MULTI_ROW_DML_NOT_SUPPORTED_WITHOUT_JSON_BINDS'
,p_message_language=>'vi'
,p_message_text=>unistr('Ngu\00F4\0300n d\01B0\0303 li\00EA\0323u na\0300y kh\00F4ng h\00F4\0303 tr\01A1\0323 thay \0111\00F4\0309i nhi\00EA\0300u ha\0300ng.')
,p_version_scn=>2705840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144038668390752888)
,p_name=>'WWV_FLOW_EXEC_REMOTE.ORDS_OUT_BIND_LIMIT_EXCEEDED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\00E3 v\01B0\1EE3t qu\00E1 gi\1EDBi h\1EA1n Li\00EAn k\1EBFt ORDS OUT n\1ED9i b\1ED9. Ha\0303y gi\1EA3m s\1ED1 l\01B0\1EE3ng h\00E0ng DML.')
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144141313693752919)
,p_name=>'WWV_FLOW_EXEC_REMOTE.RESPONSE_PARSING_ERROR'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Kh\00F4ng th\1EC3 ph\00E2n ta\0301ch ph\1EA3n h\1ED3i JSON t\1EEB m\00E1y ch\1EE7 t\1EEB xa: '),
'%0'))
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144038500092752888)
,p_name=>'WWV_FLOW_EXEC_REMOTE.RUN_PLSQL_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('Loa\0323i ng\01B0\0303 ca\0309nh kh\00F4ng xa\0301c \0111i\0323nh ho\0103\0323c kh\00F4ng chi\0301nh xa\0301c.')
,p_version_scn=>2705838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144062624517752895)
,p_name=>'WWV_FLOW_EXPORT_INT.UNSUPPORTED_READABLE_EXPORT'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00E1c th\00E0nh ph\1EA7n kh\00F4ng \0111\01B0\1EE3c h\1ED7 tr\1EE3 \0111\00F4\0301i v\01A1\0301i n\00F4\0323i dung xu\1EA5t c\00F3 th\1EC3 \0111\1ECDc: %0')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144160655292752925)
,p_name=>'WWV_FLOW_FILE_PARSER.UNKNOWN_FILE_TYPE'
,p_message_language=>'vi'
,p_message_text=>unistr('Tri\0300nh ph\00E2n ta\0301ch kh\00F4ng h\00F4\0303 tr\01A1\0323 loa\0323i t\00E2\0323p tin na\0300y.')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144111427176752910)
,p_name=>'WWV_FLOW_FND_DEVELOPER_API.CREDENTIALS_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('Truy c\00E2\0323p tra\0301i phe\0301p (wwv_flow_api.set_credentials kh\00F4ng \0111\01B0\01A1\0323c \0111\0103\0323t).')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144086382281752902)
,p_name=>'WWV_FLOW_FND_USER_API.CREATE_COMPANY'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng gian la\0300m vi\00EA\0323c kh\00F4ng ta\0323o \0111\01B0\01A1\0323c vi\0300 \0111a\0303 t\00F4\0300n ta\0323i.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144086254876752902)
,p_name=>'WWV_FLOW_FND_USER_API.CREATE_USER_GROUP'
,p_message_language=>'vi'
,p_message_text=>unistr('Nho\0301m ng\01B0\1EDDi d\00F9ng kh\00F4ng ta\0323o \0111\01B0\01A1\0323c vi\0300 \0111a\0303 t\00F4\0300n ta\0323i.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144097653591752906)
,p_name=>'WWV_FLOW_FND_USER_API.DUP_USER'
,p_message_language=>'vi'
,p_message_text=>unistr('Pha\0301t hi\00EA\0323n th\00E2\0301y t\00EAn ng\01B0\01A1\0300i du\0300ng tru\0300ng l\0103\0323p cho %0.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144097715976752906)
,p_name=>'WWV_FLOW_FND_USER_API.LOAD_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i khi ta\0309i ng\01B0\1EDDi d\00F9ng. Kh\00F4ng ta\0309i \0111\01B0\01A1\0323c ng\01B0\1EDDi d\00F9ng %0.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144108593298752909)
,p_name=>'WWV_FLOW_FND_USER_API.T_MESSAGE'
,p_message_language=>'vi'
,p_message_text=>unistr('Co\0301 le\0303 \0111a\0303 ta\0309i %0 ng\01B0\01A1\0300i du\0300ng.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144108318323752909)
,p_name=>'WWV_FLOW_FND_USER_API.T_PASSWORD'
,p_message_language=>'vi'
,p_message_text=>unistr('M\00E2\0323t kh\00E2\0309u')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144108439560752909)
,p_name=>'WWV_FLOW_FND_USER_API.T_PRIVILEGE'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\0103\0323c quy\00EA\0300n')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144108196850752909)
,p_name=>'WWV_FLOW_FND_USER_API.T_USERNAME'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00EAn ng\01B0\1EDDi d\00F9ng')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144188513823752933)
,p_name=>'WWV_FLOW_FORM.UNHANDLED_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i trong khi hi\00EA\0309n thi\0323 mu\0323c trang #COMPONENT_NAME#.')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144103500420752907)
,p_name=>'WWV_FLOW_FORMS.FORM_NOT_OPEN_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\00EA\0309 hi\00EA\0309n thi\0323 mu\0323c trang vi\0300 bi\00EA\0309u m\00E2\0303u HTML ch\01B0a \0111\01B0\01A1\0323c m\01A1\0309.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144061925059752895)
,p_name=>'WWV_FLOW_FORMS.ITEM_DEFAULT_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i khi ti\0301nh gia\0301 tri\0323 m\0103\0323c \0111i\0323nh cu\0309a mu\0323c cho mu\0323c trang #COMPONENT_NAME#.')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144102874900752907)
,p_name=>'WWV_FLOW_FORMS.ITEM_POST_CALC_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\1ED7i khi th\01B0\0323c hi\00EA\0323n sau t\00EDnh to\00E1n m\1EE5c cho m\1EE5c trang #COMPONENT_NAME#.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144102715264752907)
,p_name=>'WWV_FLOW_FORMS.ITEM_SOURCE_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i khi ti\0301nh gia\0301 tri\0323 ngu\00F4\0300n cu\0309a mu\0323c cho mu\0323c trang #COMPONENT_NAME#.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144079572687752900)
,p_name=>'WWV_FLOW_HELP.UNAUTHORIZED'
,p_message_language=>'vi'
,p_message_text=>unistr('Truy c\00E2\0323p tra\0301i phe\0301p.')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144029079927752885)
,p_name=>'WWV_FLOW_INTERACTIVE_GRID.INVALID_JSON_ARRAY'
,p_message_language=>'vi'
,p_message_text=>unistr('Gia\0301 tri\0323 %0 cu\0309a %1 kh\00F4ng pha\0309i la\0300 ma\0309ng JSON h\01A1\0323p l\00EA\0323.')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144103040653752907)
,p_name=>'WWV_FLOW_ITEM.JS_NOT_SUPPORTED'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng h\00F4\0303 tr\01A1\0323 JavaScript.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144103116096752907)
,p_name=>'WWV_FLOW_ITEM.LIST'
,p_message_language=>'vi'
,p_message_text=>unistr('Danh sa\0301ch')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144103742635752907)
,p_name=>'WWV_FLOW_ITEM.UNABLE_INIT_QUERY'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\00EA\0309 kh\01A1\0309i ta\0323o truy v\00E2\0301n.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144111781950752910)
,p_name=>'WWV_FLOW_ITEM.UPDATE_NOT_SUPPORTED_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng h\00F4\0303 tr\01A1\0323 c\1EADp nh\1EADt %0.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144105276698752908)
,p_name=>'WWV_FLOW_ITEM_HELP.INVALID_ITEM_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('Ma\0303 mu\0323c kh\00F4ng h\01A1\0323p l\00EA\0323: %0 ')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144132918679752916)
,p_name=>'WWV_FLOW_ITEM_HELP.NO_HELP_EXISTS'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng co\0301 tr\01A1\0323 giu\0301p cho mu\0323c na\0300y.')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144094770036752905)
,p_name=>'WWV_FLOW_JET_CHART.QUERY_GENERATION_FAILED'
,p_message_language=>'vi'
,p_message_text=>unistr('Ta\0323o truy v\00E2\0301n bi\00EA\0309u \0111\00F4\0300 kh\00F4ng tha\0300nh c\00F4ng. Ha\0303y ki\00EA\0309m tra ca\0300i \0111\0103\0323t Chu\00E2\0309n kh\01A1\0301p ngu\00F4\0300n va\0300 c\00F4\0323t.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144096089867752905)
,p_name=>'WWV_FLOW_MAIL.ADD_ATTACHMENT.INVALID_MAIL_ID'
,p_message_language=>'vi'
,p_message_text=>unistr('Gia\0301 tri\0323 kh\00F4ng h\01A1\0323p l\00EA\0323 cho tham s\00F4\0301 p_mail_id: %0')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144132735349752916)
,p_name=>'WWV_FLOW_MAIL.CANNOT_USE_TO_OR_REPLYTO_AS_FROM'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\00EA\0309 s\01B0\0309 du\0323ng tr\01B0\01A1\0300ng "Ng\01B0\01A1\0300i nh\00E2\0323n" ho\0103\0323c "Ng\01B0\01A1\0300i nh\00E2\0323n th\01B0 tra\0309 l\01A1\0300i" la\0300m \0111i\0323a chi\0309 "Ng\01B0\01A1\0300i g\01B0\0309i", vi\0300 ca\0301c tr\01B0\01A1\0300ng na\0300y ch\01B0\0301a nhi\00EA\0300u \0111i\0323a chi\0309 email.')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144217628803752942)
,p_name=>'WWV_FLOW_MAIL.EMAIL_LIMIT_EXCEEDED'
,p_message_language=>'vi'
,p_message_text=>unistr('Ba\0323n \0111a\0303 v\01B0\01A1\0323t qua\0301 s\00F4\0301 l\01B0\01A1\0323ng email t\00F4\0301i \0111a tr\00EAn m\00F4\0303i kh\00F4ng gian la\0300m vi\00EA\0323c. Ha\0303y li\00EAn h\00EA\0323 ng\01B0\01A1\0300i qua\0309n tri\0323.')
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144074257431752899)
,p_name=>'WWV_FLOW_MAIL.INVALID_CONTEXT'
,p_message_language=>'vi'
,p_message_text=>unistr('Quy tri\0300nh n\00E0y ph\1EA3i \0111\01B0\1EE3c g\1ECDi t\1EEB b\00EAn trong m\1ED9t phi\00EAn \1EE9ng d\1EE5ng.')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144095977784752905)
,p_name=>'WWV_FLOW_MAIL.PARAMETER_NULL'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 cung c\00E2\0301p gi\00E1 tr\1ECB r\00F4\0303ng cho tham s\1ED1 %0.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144154067939752922)
,p_name=>'WWV_FLOW_MAIL.PREPARE_TEMPLATE.NO_DATA_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng ti\0300m th\00E2\0301y m\00E2\0303u email "%0" trong \01B0\0301ng du\0323ng %1.')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144230545861752945)
,p_name=>'WWV_FLOW_MAIL.SMTP_HOST_ADDRESS_REQUIRED'
,p_message_language=>'vi'
,p_message_text=>unistr('Pha\0309i \0111\0103\0323t tham s\00F4\0301 th\01B0\0323c th\00EA\0309 SMTP_HOST_ADDRESS \0111\00EA\0309 g\01B0\0309i th\01B0.')
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144095357928752905)
,p_name=>'WWV_FLOW_MAIL.TO_IS_REQUIRED'
,p_message_language=>'vi'
,p_message_text=>unistr('B\1EA1n ph\1EA3i cung c\1EA5p ng\01B0\1EDDi nh\00E2\0323n th\01B0 \0111\1EC3 g\1EEDi th\01B0.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144220027419752942)
,p_name=>'WWV_FLOW_MAIL.UNABLE_TO_OPEN_SMTP_CONNECTION'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\1EC3 thi\1EBFt l\1EADp k\1EBFt n\1ED1i SMTP v\01A1\0301i m\00E1y ch\1EE7 email \0111a\0303 \0111i\0323nh c\00E2\0301u hi\0300nh.')
,p_version_scn=>2705867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144195314897752935)
,p_name=>'WWV_FLOW_PLUGIN.INVALID_AJAX_CALL'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00EA\0323nh go\0323i Ajax kh\00F4ng h\01A1\0323p l\00EA\0323!')
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144079261227752900)
,p_name=>'WWV_FLOW_PLUGIN.NO_AJAX_FUNCTION'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\01B0a xa\0301c \0111i\0323nh ha\0300m Ajax na\0300o cho tri\0300nh b\00F4\0309 tr\01A1\0323 %0')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144185854883752932)
,p_name=>'WWV_FLOW_PLUGIN.NO_EXECUTION_FUNCTION'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\01B0a xa\0301c \0111i\0323nh ha\0300m th\01B0\0323c thi na\0300o cho tri\0300nh b\00F4\0309 tr\01A1\0323 %0')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144079390991752900)
,p_name=>'WWV_FLOW_PLUGIN.NO_RENDER_FUNCTION'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\01B0a xa\0301c \0111i\0323nh ha\0300m hi\00EA\0309n thi\0323 na\0300o cho tri\0300nh b\00F4\0309 tr\01A1\0323 %0')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144196214552752935)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_CAPABILITIES_FUNCTION'
,p_message_language=>'vi'
,p_message_text=>unistr('Tri\0300nh b\00F4\0309 tr\01A1\0323 ngu\00F4\0300n d\01B0\0303 li\00EA\0323u REST "%0" kh\00F4ng ch\01B0\0301a ha\0300m "Capabilities".')
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144196122348752935)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_DML_FUNCTION'
,p_message_language=>'vi'
,p_message_text=>unistr('Tri\0300nh b\00F4\0309 tr\01A1\0323 ngu\00F4\0300n d\01B0\0303 li\00EA\0323u REST "%0" kh\00F4ng ch\01B0\0301a ha\0300m DML.')
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144196358657752935)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_EXECUTE_FUNCTION'
,p_message_language=>'vi'
,p_message_text=>unistr('Tri\0300nh b\00F4\0309 tr\01A1\0323 ngu\00F4\0300n d\01B0\0303 li\00EA\0323u REST "%0" kh\00F4ng ch\01B0\0301a ha\0300m th\01B0\0323c thi.')
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144196485584752935)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_FETCH_FUNCTION'
,p_message_language=>'vi'
,p_message_text=>unistr('Tri\0300nh b\00F4\0309 tr\01A1\0323 ngu\00F4\0300n d\01B0\0303 li\00EA\0323u REST "%0" kh\00F4ng ch\01B0\0301a ha\0300m ti\0300m na\0323p.')
,p_version_scn=>2705862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144076753554752899)
,p_name=>'WWV_FLOW_PLUGIN.RUN_PLSQL_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 pha\0301t sinh l\00F4\0303i \01A1\0309 ma\0303 PLSQL trong khi x\01B0\0309 ly\0301 tri\0300nh b\00F4\0309 tr\01A1\0323.')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144085338146752902)
,p_name=>'WWV_FLOW_PLUGIN_DEV.IS_REQUIRED'
,p_message_language=>'vi'
,p_message_text=>unistr('Pha\0309i chi\0309 \0111i\0323nh gia\0301 tri\0323.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144118348469752912)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.CANT_CONVERT_TO_VARCHAR2'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\00EA\0309 chuy\00EA\0309n \0111\00F4\0309i loa\0323i d\01B0\0303 li\00EA\0323u %0 sang VARCHAR2!')
,p_version_scn=>2705848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144206573405752938)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.COLUMN_NOT_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng ti\0300m th\00E2\0301y c\00F4\0323t "%0" \0111a\0303 chi\0309 \0111i\0323nh cho thu\00F4\0323c ti\0301nh "%1" trong c\00E2u l\00EA\0323nh SQL!')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144033895785752887)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.INVALID_JSON_ARRAY'
,p_message_language=>'vi'
,p_message_text=>unistr('Gia\0301 tri\0323 %0 cu\0309a %1 kh\00F4ng pha\0309i la\0300 ma\0309ng JSON h\01A1\0323p l\00EA\0323.')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144183738941752931)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.LOV_REQUIRED'
,p_message_language=>'vi'
,p_message_text=>unistr('Pha\0309i chi\0309 \0111i\0323nh truy v\1EA5n danh s\00E1ch gi\00E1 tr\1ECB (LOV) ho\1EB7c danh s\00E1ch gi\00E1 tr\1ECB \0111\01B0\1EE3c \0111\1EB7t t\00EAn cho %0.')
,p_version_scn=>2705859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144185343583752932)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.LOV_SQL_WRONG_COLUMN_COUNT'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110a\0303 cho\0323n s\00F4\0301 l\01B0\01A1\0323ng c\00F4\0323t kh\00F4ng chi\0301nh xa\0301c trong truy v\00E2\0301n SQL LOV cho %0. Ha\0303y xem vi\0301 du\0323 \0111\00EA\0309 bi\00EA\0301t ca\0301c c\00E2u l\00EA\0323nh h\01A1\0323p l\00EA\0323.')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144206321194752938)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.NO_COLUMN_FOR_ATTRIBUTE'
,p_message_language=>'vi'
,p_message_text=>unistr('Ch\01B0a chi\0309 \0111i\0323nh c\00F4\0323t cho thu\00F4\0323c ti\0301nh "%0".')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144235538116752947)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.NUMBER_ATTRIBUTE_VALUE_INVALID'
,p_message_language=>'vi'
,p_message_text=>unistr('Gia\0301 tri\0323 \0111a\0303 nh\00E2\0323p %0 cho thu\00F4\0323c ti\0301nh "%1" kh\00F4ng pha\0309i la\0300 s\00F4\0301.')
,p_version_scn=>2705869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144188803908752933)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.SQL_WRONG_DATA_TYPE'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 co\0301 loa\0323i d\01B0\0303 li\00EA\0323u kh\00F4ng chi\0301nh xa\0301c trong c\00E2u l\00EA\0323nh SQL. C\00F4\0323t # %1 la\0300 %2 nh\01B0ng theo d\01B0\0323 ki\00EA\0301n pha\0309i la\0300 %3.')
,p_version_scn=>2705860
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144206453286752938)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.WRONG_COLUMN_DATA_TYPE'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00F4\0323t "%0" \0111\01B0\01A1\0323c chi\0309 \0111i\0323nh cho thu\00F4\0323c ti\0301nh "%1" co\0301 loa\0323i d\01B0\0303 li\00EA\0323u %2 nh\01B0ng pha\0309i co\0301 %3.')
,p_version_scn=>2705864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144075982962752899)
,p_name=>'WWV_FLOW_PRINT_UTIL.REPORT_LAYOUT_NOT_FOUND'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\00EA\0309 t\00ECm th\1EA5y b\00F4\0301 cu\0323c b\00E1o c\00E1o.')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144063587769752896)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTIONS_LIMIT_EXCEEDED'
,p_message_language=>'vi'
,p_message_text=>unistr('\0110\00E3 v\01B0\1EE3t qu\00E1 Gi\1EDBi h\1EA1n th\1EF1c thi trong n\1EC1n cho %0.')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144013805167752881)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTION_ALREADY_RUNNING'
,p_message_language=>'vi'
,p_message_text=>unistr('M\00F4\0323t ta\0301c vu\0323 th\01B0\0323c thi kha\0301c cu\0309a %0 \0111ang cha\0323y.')
,p_version_scn=>2705833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144013782150752881)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTION_ALREADY_RUNNING_CTX'
,p_message_language=>'vi'
,p_message_text=>unistr('M\00F4\0323t ta\0301c vu\0323 th\01B0\0323c thi kha\0301c cu\0309a %0 \0111ang cha\0323y cho ng\01B0\0303 ca\0309nh %1.')
,p_version_scn=>2705833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144028770861752885)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.FILES_NOT_VISIBLE_IN_WORKING_SESSION'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00E1c t\00E2\0323p tin \0111\00E3 t\1EA3i l\00EAn kh\00F4ng hi\1EC3n th\1ECB trong phi\00EAn l\00E0m vi\1EC7c \0111\1ED1i v\1EDBi ta\0301c vu\0323 th\1EF1c thi cu\0309a %0.')
,p_version_scn=>2705836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144141286903752919)
,p_name=>'WWV_FLOW_RENDER_REPORT3.COMPUTE_SUM_NOT_SUPPORTED_FOR_WEB_SOURCES'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\1EC3 s\1EED d\1EE5ng t\00EDnh n\0103ng T\00EDnh t\1ED5ng cho c\00E1c b\00E1o c\00E1o d\1EF1a tr\00EAn Ngu\1ED3n d\1EEF li\1EC7u REST.')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144102924476752907)
,p_name=>'WWV_FLOW_RENDER_SHORTCUT.UNABLE_SET_SHORT_VAL_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('ERR-2904 Kh\00F4ng th\00EA\0309 \0111\0103\0323t gia\0301 tri\0323 l\00F4\0301i t\0103\0301t.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144107977083752909)
,p_name=>'WWV_FLOW_RENDER_SHORTCUT.UNKNOWN_TYPE_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i: Loa\0323i l\00F4\0301i t\0103\0301t kh\00F4ng xa\0301c \0111i\0323nh.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144045617975752890)
,p_name=>'WWV_FLOW_SEARCH_API.TEXT_QUERY_TOO_LONG'
,p_message_language=>'vi'
,p_message_text=>unistr('Truy v\00E2\0301n ti\0300m ki\00EA\0301m qua\0301 da\0300i.')
,p_version_scn=>2705839
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144097061151752905)
,p_name=>'WWV_FLOW_SECURITY.AUTH_SCHEME_FETCH_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\00EA\0309 ti\0300m na\0323p authentication_scheme trong \01B0\0301ng du\0323ng %0.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144105074657752908)
,p_name=>'WWV_FLOW_SECURITY.COMPONENT_FETCH_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\00EA\0309 ti\0300m na\0323p tha\0300nh ph\00E2\0300n %0.')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144175347747752929)
,p_name=>'WWV_FLOW_SESSION_API.TENANT_ID_EXISTS'
,p_message_language=>'vi'
,p_message_text=>unistr('Ma\0303 \0111\00F4\0301i t\01B0\01A1\0323ng thu\00EA \0111a\0303 t\00F4\0300n ta\0323i cho phi\00EAn hi\00EA\0323n ta\0323i.')
,p_version_scn=>2705857
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144108278946752909)
,p_name=>'WWV_FLOW_USER_API.T_EMAIL'
,p_message_language=>'vi'
,p_message_text=>'Email'
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144235028868752947)
,p_name=>'WWV_FLOW_WEB_SERVICES.AUTHENTICATION_FAILED'
,p_message_language=>'vi'
,p_message_text=>unistr('Xa\0301c th\01B0\0323c kh\00F4ng tha\0300nh c\00F4ng.')
,p_version_scn=>2705869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144135692150752917)
,p_name=>'WWV_FLOW_WEB_SERVICES.COOKIE_INVALID'
,p_message_language=>'vi'
,p_message_text=>unistr('M\00F4\0323t ho\0103\0323c nhi\00EA\0300u cookie \0111a\0303 \0111\0103\0323t trong apex_util.g_request_cookies ch\01B0\0301a gia\0301 tri\0323 kh\00F4ng h\01A1\0323p l\00EA\0323.')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144117507072752912)
,p_name=>'WWV_FLOW_WEB_SERVICES.INVALID_UDDI_RESPONSE'
,p_message_language=>'vi'
,p_message_text=>unistr('Pha\0309n h\00F4\0300i t\01B0\0300 s\00F4\0309 \0111\0103ng ky\0301 UDDI kh\00F4ng h\01A1\0323p l\00EA\0323.')
,p_version_scn=>2705847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144076819080752899)
,p_name=>'WWV_FLOW_WEB_SERVICES.INVALID_WSDL'
,p_message_language=>'vi'
,p_message_text=>unistr('URL \0111a\0303 cung c\00E2\0301p kh\00F4ng tra\0309 v\00EA\0300 ta\0300i li\00EA\0323u WSDL h\01A1\0323p l\00EA\0323.')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144079655995752900)
,p_name=>'WWV_FLOW_WEB_SERVICES.MULTIPLE_SOAP'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00E0i li\1EC7u WSDL ch\1EE9a nhi\1EC1u li\00EAn k\00EA\0301t SOAP. &PRODUCT_NAME. ch\1EC9 h\1ED7 tr\1EE3 ta\0300i li\00EA\0323u WSDL co\0301 m\1ED9t li\00EAn k\00EA\0301t SOAP. Ha\0303y nh\1EA5p v\00E0o T\1EA1o tham chi\1EBFu d\1ECBch v\1EE5 web theo c\00E1ch th\1EE7 c\00F4ng \0111\1EC3 ti\1EBFp t\1EE5c t\1EA1o tham chi\1EBFu cho d\1ECBch v\1EE5 n\00E0y.')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144155227916752923)
,p_name=>'WWV_FLOW_WEB_SERVICES.NOT_XML'
,p_message_language=>'vi'
,p_message_text=>unistr('Pha\0309n h\00F4\0300i t\01B0\0300 di\0323ch vu\0323 kh\00F4ng pha\0309i la\0300 XML.')
,p_version_scn=>2705852
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144234909233752947)
,p_name=>'WWV_FLOW_WEB_SERVICES.NO_VALID_OAUTH_TOKEN'
,p_message_language=>'vi'
,p_message_text=>unistr('Ma\0303 th\00F4ng b\00E1o truy c\00E2\0323p OAuth kh\00F4ng kha\0309 du\0323ng ho\0103\0323c \0111a\0303 h\00EA\0301t ha\0323n.')
,p_version_scn=>2705869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144199417335752936)
,p_name=>'WWV_FLOW_WEB_SERVICES.REQUEST_LIMIT_EXCEEDED'
,p_message_language=>'vi'
,p_message_text=>unistr('B\1EA1n \0111\00E3 v\01B0\1EE3t qu\00E1 s\1ED1 l\01B0\1EE3ng y\00EAu c\1EA7u d\1ECBch v\1EE5 web t\1ED1i \0111a cho m\1ED7i kh\00F4ng gian l\00E0m vi\1EC7c. Ha\0303y li\00EAn h\1EC7 ng\01B0\01A1\0300i qu\1EA3n tr\1ECB.')
,p_version_scn=>2705863
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144235119306752947)
,p_name=>'WWV_FLOW_WEB_SERVICES.UNSUPPORTED_OAUTH_TOKEN'
,p_message_language=>'vi'
,p_message_text=>unistr('M\00E1y ch\1EE7 \0111a\0303 ph\1EA3n h\1ED3i b\1EB1ng lo\1EA1i m\00E3 th\00F4ng b\00E1o OAuth kh\00F4ng \0111\01B0\1EE3c h\1ED7 tr\1EE3.')
,p_version_scn=>2705869
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144079061305752900)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_NO_SOAP'
,p_message_language=>'vi'
,p_message_text=>unistr('T\00E0i li\1EC7u WSDL kh\00F4ng ch\1EE9a li\00EAn k\00EA\0301t cho SOAP. \0110\00E2y la\0300 \0111i\00EA\0300u b\0103\0301t bu\00F4\0323c \0111\1EC3 th\00EAm tham chi\1EBFu.')
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144074490881752899)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_REQUIRES_AUTH'
,p_message_language=>'vi'
,p_message_text=>unistr('WSDL na\0300y y\00EAu c\00E2\0300u pha\0309i co\0301 th\00F4ng tin xa\0301c th\01B0\0323c. Ha\0303y cung c\00E2\0301p t\00EAn ng\01B0\01A1\0300i du\0300ng va\0300 m\00E2\0323t kh\00E2\0309u \01A1\0309 b\00EAn d\01B0\01A1\0301i.')
,p_version_scn=>2705841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144085416728752902)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_UNHANDLED'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00F4ng cu\0323 hi\00EA\0309n thi\0323 kh\00F4ng th\00EA\0309 hi\00EA\0309u t\00E0i li\1EC7u WSDL na\0300y. Ha\0303y nh\1EA5p v\00E0o T\1EA1o tham chi\1EBFu d\1ECBch v\1EE5 web theo c\00E1ch th\1EE7 c\00F4ng \0111\1EC3 ti\1EBFp t\1EE5c t\1EA1o tham chi\1EBFu cho d\1ECBch v\1EE5 n\00E0y.')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144158290826752924)
,p_name=>'WWV_FLOW_WIZARD_API.UPDATE_ERROR'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng th\00EA\0309 x\01B0\0309 ly\0301 c\00E2\0323p nh\00E2\0323t.')
,p_version_scn=>2705855
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144184095145752932)
,p_name=>'WWV_FLOW_WORKSHEET.LOV_DISPLAY_AND_RETURN_COLUMN_EQUAL'
,p_message_language=>'vi'
,p_message_text=>unistr('C\00F4\0323t tra\0309 v\00EA\0300 va\0300 c\00F4\0323t hi\00EA\0309n thi\0323 Danh sa\0301ch gia\0301 tri\0323 gi\00F4\0301ng nhau!')
,p_version_scn=>2705859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144183990247752931)
,p_name=>'WWV_FLOW_WORKSHEET.LOV_NO_RETURN_COLUMN'
,p_message_language=>'vi'
,p_message_text=>unistr('Danh sa\0301ch gia\0301 tri\0323 kh\00F4ng co\0301 c\00F4\0323t tra\0309 v\00EA\0300.')
,p_version_scn=>2705859
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144111646928752910)
,p_name=>'WWV_RENDER_REPORT3.COLUMN_VALUE_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i khi ti\0300m na\0323p gia\0301 tri\0323 c\00F4\0323t: %0')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144136579510752917)
,p_name=>'WWV_RENDER_REPORT3.DATA_TOO_OLD'
,p_message_language=>'vi'
,p_message_text=>unistr('D\1EEF li\1EC7u bi\1EC3u m\1EABu d\1EA1ng b\1EA3ng hi\1EC7n t\1EA1i qu\00E1 c\0169; d\1EEF li\1EC7u ngu\1ED3n \0111\00E3 \0111\01B0\1EE3c s\1EEDa \0111\1ED5i.<br/> Ha\0303y nh\1EA5p v\00E0o <strong><a href="%0">\0111\00E2y</a></strong> \0111\1EC3 lo\1EA1i b\1ECF c\00E1c thay \0111\1ED5i c\1EE7a b\1EA1n v\00E0 t\1EA3i l\1EA1i d\1EEF li\1EC7u t\1EEB c\01A1 s\1EDF d\1EEF li\1EC7u.')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144091732919752904)
,p_name=>'WWV_RENDER_REPORT3.ERR_DETERMINE_PAGINATION'
,p_message_language=>'vi'
,p_message_text=>unistr('L\1ED7i khi x\00E1c \0111\1ECBnh chu\1ED7i ph\00E2n trang')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144091656062752904)
,p_name=>'WWV_RENDER_REPORT3.ERR_DETERMINE_QUERY_HEADINGS'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('kh\00F4ng th\00EA\0309 xa\0301c \0111i\0323nh ti\00EAu \0111\00EA\0300 truy v\00E2\0301n:'),
'%0'))
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144091894359752904)
,p_name=>'WWV_RENDER_REPORT3.ERR_REPORT_FOOTER'
,p_message_language=>'vi'
,p_message_text=>unistr('l\1ED7i khi th\1EF1c hi\1EC7n thay th\1EBF ch\00E2n trang b\00E1o c\00E1o')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144091977332752904)
,p_name=>'WWV_RENDER_REPORT3.FAILED_PARSING_QUERY'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('kh\00F4ng ph\00E2n ta\0301ch \0111\01B0\01A1\0323c truy v\00E2\0301n SQL:'),
'%0',
'%1'))
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144098024655752906)
,p_name=>'WWV_RENDER_REPORT3.FOUND_BUT_NOT_DISPLAYED'
,p_message_language=>'vi'
,p_message_text=>unistr('S\00F4\0301 ha\0300ng t\00F4\0301i thi\00EA\0309u \0111a\0303 y\00EAu c\00E2\0300u: %0, s\00F4\0301 ha\0300ng \0111a\0303 ti\0300m th\00E2\0301y nh\01B0ng kh\00F4ng hi\00EA\0309n thi\0323: %1')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144094469629752905)
,p_name=>'WWV_RENDER_REPORT3.HTML_USE_COLUMN_ALIAS'
,p_message_language=>'vi'
,p_message_text=>unistr('c\1ED9t truy v\1EA5n #%0 (%1) kh\00F4ng h\1EE3p l\1EC7, c\00E1c c\1ED9t s\1EED d\1EE5ng HTML c\1EA7n c\00F3 t\00EAn b\00ED danh')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144111520407752910)
,p_name=>'WWV_RENDER_REPORT3.QUERY_HEADING_ERR'
,p_message_language=>'vi'
,p_message_text=>unistr('L\00F4\0303i khi l\00E2\0301y ti\00EAu \0111\00EA\0300 truy v\00E2\0301n: %0')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144092003543752904)
,p_name=>'WWV_RENDER_REPORT3.REPORT_ERROR'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('ba\0301o ca\0301o l\00F4\0303i:'),
'%0'))
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144132135335752916)
,p_name=>'WWV_RENDER_REPORT3.SORT_BY_THIS_COLUMN'
,p_message_language=>'vi'
,p_message_text=>unistr('S\0103\0301p x\00EA\0301p theo c\00F4\0323t na\0300y')
,p_version_scn=>2705849
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144094583032752905)
,p_name=>'WWV_RENDER_REPORT3.SYNTAX_ERROR'
,p_message_language=>'vi'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Kh\00F4ng th\1EC3 ph\00E2n ta\0301ch truy v\1EA5n, ha\0303y ki\1EC3m tra c\00FA ph\00E1p truy v\1EA5n c\1EE7a b\1EA1n.'),
'(%0)',
'</p>'))
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144136684107752917)
,p_name=>'WWV_RENDER_REPORT3.UNSAVED_DATA'
,p_message_language=>'vi'
,p_message_text=>unistr('Bi\1EC3u m\1EABu n\00E0y ch\1EE9a c\00E1c thay \0111\1ED5i ch\01B0a l\01B0u. Ha\0303y nh\1EA5n va\0300o "\0110\00F4\0300ng y\0301" \0111\1EC3 ti\1EBFp t\1EE5c m\00E0 kh\00F4ng l\01B0u c\00E1c thay \0111\1ED5i c\1EE7a b\1EA1n. ')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144141128829752919)
,p_name=>'WWV_RENDER_REPORT3.UNSUPPORTED_PAGINATION_SCHEME'
,p_message_language=>'vi'
,p_message_text=>unistr('Kh\00F4ng h\1ED7 tr\1EE3 gia\0309n \0111\1ED3 ph\00E2n trang b\00E1o c\00E1o (%0) v\1EDBi ngu\1ED3n d\1EEF li\1EC7u \0111\00E3 ch\1ECDn.')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144094348511752905)
,p_name=>'WWV_RENDER_REPORT3.USE_COLUMN_ALIAS'
,p_message_language=>'vi'
,p_message_text=>unistr('c\00F4\0323t truy v\00E2\0301n #%0 (%1) kh\00F4ng h\01A1\0323p l\00EA\0323, ha\0303y s\01B0\0309 du\0323ng b\00ED danh c\00F4\0323t')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144098140757752906)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_MORE_THAN_Z'
,p_message_language=>'vi'
,p_message_text=>unistr('ha\0300ng %0 - %1 trong s\00F4\0301 h\01A1n %2')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144138653565752918)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_MORE_THAN_Z_2'
,p_message_language=>'vi'
,p_message_text=>unistr('%0 - %1 trong s\00F4\0301 h\01A1n %2')
,p_version_scn=>2705851
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144097947936752906)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z'
,p_message_language=>'vi'
,p_message_text=>unistr('ha\0300ng %0 - %1 trong s\00F4\0301 %2')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144078796009752900)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z_2'
,p_message_language=>'vi'
,p_message_text=>'%0 - %1/%2'
,p_version_scn=>2705842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144092128781752904)
,p_name=>'Y'
,p_message_language=>'vi'
,p_message_text=>'Y'
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144099432832752906)
,p_name=>'YEAR'
,p_message_language=>'vi'
,p_message_text=>unistr('n\0103m')
,p_version_scn=>2705845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144091344649752904)
,p_name=>'YEARS'
,p_message_language=>'vi'
,p_message_text=>unistr('n\0103m')
,p_version_scn=>2705843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144136727535752917)
,p_name=>'YES'
,p_message_language=>'vi'
,p_message_text=>unistr('Co\0301')
,p_version_scn=>2705851
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
 p_id=>wwv_flow_imp.id(109678305570583962.4547)
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
 p_id=>1.4547
,p_name=>unistr('Th\00F4ng b\00E1o')
,p_alias=>'MESSAGES'
,p_step_title=>unistr('Th\00F4ng b\00E1o')
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
