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
,p_default_application_id=>4475
,p_default_id_offset=>0
,p_default_owner=>'APEX_240200'
);
end;
/
 
prompt APPLICATION 4475 - Oracle APEX Runtime Messages
--
-- Application Export:
--   Application:     4475
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
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'A144692928097760102')
,p_page_view_logging=>'YES'
,p_charset=>'utf-8'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt_last_reset=>'20250422180859'
,p_bookmark_checksum_function=>'SH1'
,p_compatibility_mode=>'24.2'
,p_session_state_commits=>'IMMEDIATE'
,p_flow_language=>'pt-br'
,p_flow_language_derived_from=>'SESSION'
,p_date_format=>'&DATE_FORMAT.'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(109678305570583962.4475)
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
 p_id=>wwv_flow_imp.id(4475)
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
 p_id=>wwv_flow_imp.id(728504220438374.4475)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SELECT_MANY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_values_as', 'separated')).to_clob
,p_version_scn=>7007816
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(736540203200530.4475)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_BOSS'
,p_version_scn=>243430877
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(800575880762576.4475)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'NATIVE_OPEN_AI_ASSISTANT'
,p_version_scn=>15457644
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2657043006125217.4475)
,p_plugin_type=>'PROCESS TYPE'
,p_plugin=>'NATIVE_GEOCODING'
,p_attribute_01=>'RELAX_HOUSE_NUMBER'
,p_version_scn=>117636987
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(110599941590099161.4475)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'default_icon', 'fa-star',
  'tooltip', '#VALUE#')).to_clob
,p_version_scn=>7007818
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(118481226255833028.4475)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_MAP_REGION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_vector_tile_layers', 'Y')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(123214098089478467.4475)
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
 p_id=>wwv_flow_imp.id(124389732573989299.4475)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_ADFBC'
,p_version_scn=>37165931336889
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(209516503264520988.4475)
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
 p_id=>wwv_flow_imp.id(285800719532138903.4475)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N')).to_clob
,p_version_scn=>7007823
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(649595203182764436.4475)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_style', 'SWITCH_CB',
  'off_value', 'N',
  'on_value', 'Y')).to_clob
,p_version_scn=>6539584
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1874744429444344138.4475)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'include_slider', 'N')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1941451863897626238.4475)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'actions_menu_structure', 'IG')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2027366558906572283.4475)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'mode', 'FULL')).to_clob
,p_version_scn=>7007824
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2120597162971751123.4475)
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
 p_id=>wwv_flow_imp.id(649613204592764515.4475)
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
 p_id=>wwv_flow_imp.id(850359229090693491.4475)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Wizard Dialog.pt-br'
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
 p_id=>wwv_flow_imp.id(293526110820992194.4475)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4475)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293526630547992195.4475)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4475)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293527171164992195.4475)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4475)
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
 p_id=>wwv_flow_imp.id(851037359784626333.4475)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Dialog.pt-br'
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
 p_id=>wwv_flow_imp.id(293473352245977306.4475)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4475)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293473882718977306.4475)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4475)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293474370844977307.4475)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4475)
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
 p_id=>wwv_flow_imp.id(851037631091626378.4475)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Edit Screen.pt-br'
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
 p_id=>wwv_flow_imp.id(2495515088702127.4475)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4475)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2496016567702127.4475)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4475)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2496522618702127.4475)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4475)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2497097895702127.4475)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4475)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2497562953702128.4475)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4475)
,p_name=>'Edit Screen Header'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2498085850702128.4475)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4475)
,p_name=>'Page Position 5'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2498553894702128.4475)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4475)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2499023066702128.4475)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4475)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2499516729702128.4475)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4475)
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
 p_id=>wwv_flow_imp.id(851039898661626389.4475)
,p_theme_id=>3
,p_name=>'APEX 5.0 - No Side Bar.pt-br'
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
 p_id=>wwv_flow_imp.id(2418665544706094.4475)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4475)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2419139140706094.4475)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4475)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2419660231706094.4475)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4475)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2420136000706094.4475)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4475)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2420617033706094.4475)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4475)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2421142368706094.4475)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4475)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2421629849706095.4475)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4475)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2422132460706095.4475)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4475)
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
 p_id=>wwv_flow_imp.id(851040471818626394.4475)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Right Side Bar.pt-br'
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
 p_id=>wwv_flow_imp.id(1537388880131854.4475)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4475)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1537880270131855.4475)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4475)
,p_name=>'Page Header (Position 3)'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1538315330131855.4475)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4475)
,p_name=>'Page Header (Position 4)'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1538840638131855.4475)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4475)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1539339441131855.4475)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4475)
,p_name=>'After Body'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1539830162131855.4475)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4475)
,p_name=>'Page Header (Position 1)'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1540338421131855.4475)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4475)
,p_name=>'Page Header (Position 2)'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1540832064131856.4475)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4475)
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
 p_id=>wwv_flow_imp.id(851041812938626395.4475)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Sign Up Wizard.pt-br'
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
 p_id=>wwv_flow_imp.id(115212309210289451.4475)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4475)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115212857712289451.4475)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4475)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115213340345289452.4475)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4475)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115213804331289452.4475)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4475)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115214317592289452.4475)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4475)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115214875819289453.4475)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4475)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115215325320289453.4475)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4475)
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
 p_id=>wwv_flow_imp.id(851042476105626395.4475)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Wizard Page.pt-br'
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
 p_id=>wwv_flow_imp.id(1485266589875353.4475)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4475)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1485734308875353.4475)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4475)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1486237142875354.4475)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4475)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1486735024875354.4475)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4475)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1487219028875354.4475)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4475)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1487770987875354.4475)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4475)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1488272041875354.4475)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4475)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1488725778875354.4475)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4475)
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
 p_id=>wwv_flow_imp.id(514381861202541059.4475)
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
 p_id=>wwv_flow_imp.id(514382190540541061.4475)
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
 p_id=>wwv_flow_imp.id(514382538845541061.4475)
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
 p_id=>wwv_flow_imp.id(620629666890811728.4475)
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
 p_id=>wwv_flow_imp.id(620629778318811745.4475)
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
 p_id=>wwv_flow_imp.id(868252865986181054.4475)
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
 p_id=>wwv_flow_imp.id(514338947870435171.4475)
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
 p_id=>wwv_flow_imp.id(2962385277500935.4475)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4475)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2962865718500935.4475)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4475)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2963338641500935.4475)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4475)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2963894582500935.4475)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4475)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2964329937500935.4475)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4475)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2964897214500936.4475)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4475)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2965324003500936.4475)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4475)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2965838011500936.4475)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4475)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2966328405500936.4475)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4475)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2966823859500936.4475)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4475)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2967325351500936.4475)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4475)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2967812485500936.4475)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4475)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2968377768500937.4475)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4475)
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
 p_id=>wwv_flow_imp.id(514343873675436760.4475)
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
 p_id=>wwv_flow_imp.id(32585474981747544.4475)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4475)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32585915750747544.4475)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4475)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32586471989747545.4475)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4475)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32586972270747545.4475)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4475)
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
 p_id=>wwv_flow_imp.id(771803843049318447.4475)
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
 p_id=>wwv_flow_imp.id(3207496127505978.4475)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4475)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3207907805505978.4475)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4475)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3208484941505978.4475)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4475)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3208991047505978.4475)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4475)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3209402462505979.4475)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4475)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3209972507505979.4475)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4475)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3210460159505979.4475)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4475)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3210935368505979.4475)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4475)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3211466566505979.4475)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4475)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3211956312505979.4475)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4475)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3212461962505979.4475)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4475)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3212966370505980.4475)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4475)
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
 p_id=>wwv_flow_imp.id(850406444708718383.4475)
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
 p_id=>wwv_flow_imp.id(2204663592232325.4475)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4475)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2205135519232325.4475)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4475)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2205694824232325.4475)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4475)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2206129075232325.4475)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4475)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2206618558232325.4475)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4475)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2207115910232326.4475)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4475)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2207688896232326.4475)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4475)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2208160700232326.4475)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4475)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2208614050232326.4475)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4475)
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
 p_id=>wwv_flow_imp.id(850442966147812557.4475)
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
 p_id=>wwv_flow_imp.id(3346988371508588.4475)
,p_plug_template_id=>wwv_flow_imp.id(850442966147812557.4475)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3347426198508588.4475)
,p_plug_template_id=>wwv_flow_imp.id(850442966147812557.4475)
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
 p_id=>wwv_flow_imp.id(856206049762521193.4475)
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
 p_id=>wwv_flow_imp.id(2526185270486606.4475)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4475)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2526610033486606.4475)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4475)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2527184084486606.4475)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4475)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2527626846486607.4475)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4475)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2528141078486607.4475)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4475)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2528637911486607.4475)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4475)
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
 p_id=>wwv_flow_imp.id(914802799655239969.4475)
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
 p_id=>wwv_flow_imp.id(88183211858816924.4475)
,p_plug_template_id=>wwv_flow_imp.id(914802799655239969.4475)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(88183732152816924.4475)
,p_plug_template_id=>wwv_flow_imp.id(914802799655239969.4475)
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
 p_id=>wwv_flow_imp.id(914803495164240003.4475)
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
 p_id=>wwv_flow_imp.id(3373447170510516.4475)
,p_plug_template_id=>wwv_flow_imp.id(914803495164240003.4475)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3373993086510516.4475)
,p_plug_template_id=>wwv_flow_imp.id(914803495164240003.4475)
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
 p_id=>wwv_flow_imp.id(915210356236972585.4475)
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
 p_id=>wwv_flow_imp.id(2899946654493378.4475)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4475)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2900442121493378.4475)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4475)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2900949359493378.4475)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4475)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2901467944493378.4475)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4475)
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
 p_id=>wwv_flow_imp.id(915371118115573423.4475)
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
 p_id=>wwv_flow_imp.id(2695578355491332.4475)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4475)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2696079816491332.4475)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4475)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2696558276491332.4475)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4475)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2697055726491332.4475)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4475)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2697581510491332.4475)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4475)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2698048732491333.4475)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4475)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2698576547491333.4475)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4475)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2699004772491333.4475)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4475)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2699557295491333.4475)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4475)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2700035673491333.4475)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4475)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2700500589491333.4475)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4475)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2701097053491333.4475)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4475)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2701554382491334.4475)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4475)
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
 p_id=>wwv_flow_imp.id(1274355059486017828.4475)
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
 p_id=>wwv_flow_imp.id(61232728057733462.4475)
,p_plug_template_id=>wwv_flow_imp.id(1274355059486017828.4475)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(61233207886733462.4475)
,p_plug_template_id=>wwv_flow_imp.id(1274355059486017828.4475)
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
 p_id=>wwv_flow_imp.id(514332014414430986.4475)
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
 p_id=>wwv_flow_imp.id(514332292784430987.4475)
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
 p_id=>wwv_flow_imp.id(860563697365629462.4475)
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
 p_id=>wwv_flow_imp.id(865273508717512144.4475)
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
 p_id=>wwv_flow_imp.id(908020362212234651.4475)
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
 p_id=>wwv_flow_imp.id(914818080687341593.4475)
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
 p_id=>wwv_flow_imp.id(851049711466639395.4475)
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
 p_id=>wwv_flow_imp.id(851054516889639461.4475)
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
 p_id=>wwv_flow_imp.id(851055225644639463.4475)
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
 p_id=>wwv_flow_imp.id(851056531929639482.4475)
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
 p_id=>wwv_flow_imp.id(914792024808213039.4475)
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
 p_id=>wwv_flow_imp.id(914792322768213043.4475)
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
 p_id=>wwv_flow_imp.id(915377874236666939.4475)
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
 p_id=>wwv_flow_imp.id(1041941432531249038.4475)
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
 p_id=>wwv_flow_imp.id(850683711614406253.4475)
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
 p_id=>wwv_flow_imp.id(851047536471633848.4475)
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
 p_id=>wwv_flow_imp.id(851047676005633854.4475)
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
 p_id=>wwv_flow_imp.id(851047684809633856.4475)
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
 p_id=>wwv_flow_imp.id(851047795461633856.4475)
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
 p_id=>wwv_flow_imp.id(860542631889572088.4475)
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
 p_id=>wwv_flow_imp.id(1321751941832424103.4475)
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
 p_id=>wwv_flow_imp.id(514333590213433126.4475)
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
 p_id=>wwv_flow_imp.id(649611704621764507.4475)
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
,p_next_button_text=>unistr('Pr\00F3ximo &gt;')
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
 p_id=>wwv_flow_imp.id(649611609668764506.4475)
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
 p_id=>wwv_flow_imp.id(182005134783173294.4475)
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
 p_id=>wwv_flow_imp.id(666074212329754757.4475)
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
 p_id=>wwv_flow_imp.id(666074525535755551.4475)
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
 p_id=>wwv_flow_imp.id(717250289307903026.4475)
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
 p_id=>wwv_flow_imp.id(2336377640986141.4475)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL'
,p_display_name=>'Heading Level'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(806925000765340952.4475)
,p_theme_id=>3
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default - No Icons'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808380142596819918.4475)
,p_theme_id=>3
,p_name=>'ALTERNATING_TABLE_ROWS'
,p_display_name=>'Alternating Table Rows'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Enable'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808380828683819918.4475)
,p_theme_id=>3
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Disable'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808381542095819918.4475)
,p_theme_id=>3
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default Border'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808383088145819924.4475)
,p_theme_id=>3
,p_name=>'REPORT_WIDTH'
,p_display_name=>'Report Width'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850406791580718389.4475)
,p_theme_id=>3
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850407096779718396.4475)
,p_theme_id=>3
,p_name=>'REGION_PADDING'
,p_display_name=>'Region Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Padding'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850407509193718398.4475)
,p_theme_id=>3
,p_name=>'REGION_STYLE'
,p_display_name=>'Region Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Style'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(851050160062639437.4475)
,p_theme_id=>3
,p_name=>'BADGE_LAYOUT'
,p_display_name=>'Badge Layout'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(851051045625639457.4475)
,p_theme_id=>3
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856113214217058023.4475)
,p_theme_id=>3
,p_name=>'HEIGHT'
,p_display_name=>'Height'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856114568019058024.4475)
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
 p_id=>wwv_flow_imp.id(856114830529058024.4475)
,p_theme_id=>3
,p_name=>'FORM_LABEL_WIDTH'
,p_display_name=>'Form Label Width'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856115135223058024.4475)
,p_theme_id=>3
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Not Part of Button Set'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116214022058024.4475)
,p_theme_id=>3
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>1
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116523282058024.4475)
,p_theme_id=>3
,p_name=>'FORM_LABEL_POSITION'
,p_display_name=>'Form Label Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116798725058025.4475)
,p_theme_id=>3
,p_name=>'BUTTON_SIZE'
,p_display_name=>'Button Size'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Button Size'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117102944058028.4475)
,p_theme_id=>3
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing left'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Left Spacing'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117454663058028.4475)
,p_theme_id=>3
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Right Spacing'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117908453058029.4475)
,p_theme_id=>3
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Icon on Right'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856118261810058029.4475)
,p_theme_id=>3
,p_name=>'BUTTON_TYPE'
,p_display_name=>'Button Type'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856206461450521195.4475)
,p_theme_id=>3
,p_name=>'ALERT_TYPE'
,p_display_name=>'Alert Type'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856206736628521198.4475)
,p_theme_id=>3
,p_name=>'DISPLAY'
,p_display_name=>'Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(860570508910721307.4475)
,p_theme_id=>3
,p_name=>'REGION_POSITION'
,p_display_name=>'Region Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(860571060920721309.4475)
,p_theme_id=>3
,p_name=>'REGION_OVERFLOW'
,p_display_name=>'Region Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(908020718209234676.4475)
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
 p_id=>wwv_flow_imp.id(1487577187426769.4475)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden to Assistive Tech'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4475)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4475)
,p_template_types=>'REGION'
,p_help_text=>'By default, region title is hidden but accessible, use this option to remove the header from accessible interface'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2336635141996782.4475)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H1'
,p_display_name=>'H1'
,p_display_sequence=>10
,p_css_classes=>'js-headingLevel-1'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4475)
,p_template_types=>'REGION'
,p_help_text=>'H1'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2336917964996782.4475)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H2'
,p_display_name=>'H2'
,p_display_sequence=>20
,p_css_classes=>'js-headingLevel-2'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4475)
,p_template_types=>'REGION'
,p_help_text=>'H2'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2337368425996782.4475)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H3'
,p_display_name=>'H3'
,p_display_sequence=>30
,p_css_classes=>'js-headingLevel-3'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4475)
,p_template_types=>'REGION'
,p_help_text=>'H3'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2337706283996782.4475)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H4'
,p_display_name=>'H4'
,p_display_sequence=>40
,p_css_classes=>'js-headingLevel-4'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4475)
,p_template_types=>'REGION'
,p_help_text=>'H4'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2338144805996782.4475)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H5'
,p_display_name=>'H5'
,p_display_sequence=>50
,p_css_classes=>'js-headingLevel-5'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4475)
,p_template_types=>'REGION'
,p_help_text=>'H5'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2338562059996782.4475)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H6'
,p_display_name=>'H6'
,p_display_sequence=>60
,p_css_classes=>'js-headingLevel-6'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4475)
,p_template_types=>'REGION'
,p_help_text=>'H6'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134384175764258.4475)
,p_theme_id=>3
,p_name=>'LARGELEFT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapLeft'
,p_group_id=>wwv_flow_imp.id(856117102944058028.4475)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134654971764258.4475)
,p_theme_id=>3
,p_name=>'LARGERIGHT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapRight'
,p_group_id=>wwv_flow_imp.id(856117454663058028.4475)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134823880764258.4475)
,p_theme_id=>3
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(856117908453058029.4475)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135009020764258.4475)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>3
,p_css_classes=>'a-Button--large'
,p_group_id=>wwv_flow_imp.id(856116798725058025.4475)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135269851764258.4475)
,p_theme_id=>3
,p_name=>'SMALLLEFT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padLeft'
,p_group_id=>wwv_flow_imp.id(856117102944058028.4475)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135477215764258.4475)
,p_theme_id=>3
,p_name=>'SMALLRIGHT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padRight'
,p_group_id=>wwv_flow_imp.id(856117454663058028.4475)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135634744764258.4475)
,p_theme_id=>3
,p_name=>'INNERBUTTON'
,p_display_name=>'Inner Button'
,p_display_sequence=>2
,p_css_classes=>'a-Button--pill'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4475)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135785730764258.4475)
,p_theme_id=>3
,p_name=>'LASTBUTTON'
,p_display_name=>'Last Button'
,p_display_sequence=>3
,p_css_classes=>'a-Button--pillEnd'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4475)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136068296764258.4475)
,p_theme_id=>3
,p_name=>'FIRSTBUTTON'
,p_display_name=>'First Button'
,p_display_sequence=>1
,p_css_classes=>'a-Button--pillStart'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4475)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136225140764258.4475)
,p_theme_id=>3
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>1
,p_css_classes=>'a-Button--primary'
,p_group_id=>wwv_flow_imp.id(856118261810058029.4475)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136360666764258.4475)
,p_theme_id=>3
,p_name=>'REGIONHEADERBUTTON'
,p_display_name=>'Button in Region Header'
,p_display_sequence=>1
,p_css_classes=>'a-Button--regionHeader'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136507481764259.4475)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--small'
,p_group_id=>wwv_flow_imp.id(856116798725058025.4475)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136620486764259.4475)
,p_theme_id=>3
,p_name=>'STRONGBUTTONLABEL'
,p_display_name=>'Strong Button Label'
,p_display_sequence=>1
,p_css_classes=>'a-Button--strongLabel'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136861925764259.4475)
,p_theme_id=>3
,p_name=>'AUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form--autoWidthLabels'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4475)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137023291764259.4475)
,p_theme_id=>3
,p_name=>'FIXEDWIDTH'
,p_display_name=>'Fixed'
,p_display_sequence=>10
,p_css_classes=>'a-Form--fixedLabels'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4475)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137193234764259.4475)
,p_theme_id=>3
,p_name=>'LABELSABOVE'
,p_display_name=>'Labels Above'
,p_display_sequence=>1
,p_css_classes=>'a-Form--labelsAbove'
,p_group_id=>wwv_flow_imp.id(856116523282058024.4475)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137470293764259.4475)
,p_theme_id=>3
,p_name=>'ALIGNLABELSLEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Form--leftLabels'
,p_group_id=>wwv_flow_imp.id(856114568019058024.4475)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137586003764259.4475)
,p_theme_id=>3
,p_name=>'LABELAUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--autoLabelWidth'
,p_group_id=>wwv_flow_imp.id(856116214022058024.4475)
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137737661764259.4475)
,p_theme_id=>3
,p_name=>'STRETCHFORMFIELD'
,p_display_name=>'Stretch Form Field'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--stretch'
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137933035764259.4475)
,p_theme_id=>3
,p_name=>'FIXEDLARGE'
,p_display_name=>'Fixed (Large Width)'
,p_display_sequence=>30
,p_css_classes=>'a-Form-fixedLabelsLarge'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4475)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138175863764259.4475)
,p_theme_id=>3
,p_name=>'FIXEDMEDIUM'
,p_display_name=>'Fixed (Medium Width)'
,p_display_sequence=>20
,p_css_classes=>'a-Form-fixedLabelsMed'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4475)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138340877764259.4475)
,p_theme_id=>3
,p_name=>'180PX'
,p_display_name=>'180px'
,p_display_sequence=>10
,p_css_classes=>'h180'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4475)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138553321764259.4475)
,p_theme_id=>3
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>20
,p_css_classes=>'h240'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4475)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138777457764259.4475)
,p_theme_id=>3
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>30
,p_css_classes=>'h320'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4475)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138891974764260.4475)
,p_theme_id=>3
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>50
,p_css_classes=>'h480'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4475)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857139153872764260.4475)
,p_theme_id=>3
,p_name=>'540PX'
,p_display_name=>'540px'
,p_display_sequence=>60
,p_css_classes=>'h540'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4475)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857139375337764260.4475)
,p_theme_id=>3
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>70
,p_css_classes=>'h640'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4475)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145206107768768.4475)
,p_theme_id=>3
,p_name=>'USE_COLORED_BACKGROUND'
,p_display_name=>'Use Colored Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4475)
,p_css_classes=>'a-Alert--colorBG'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145328630768768.4475)
,p_theme_id=>3
,p_name=>'USE_DEFAULT_ICONS'
,p_display_name=>'Use Default Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4475)
,p_css_classes=>'a-Alert--defaultIcons'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145505007768768.4475)
,p_theme_id=>3
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4475)
,p_css_classes=>'a-Alert--warning'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4475)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145725778768768.4475)
,p_theme_id=>3
,p_name=>'ERROR'
,p_display_name=>'Error'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4475)
,p_css_classes=>'a-Alert--danger'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4475)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145892117768768.4475)
,p_theme_id=>3
,p_name=>'INFORMATIONAL'
,p_display_name=>'Informational'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4475)
,p_css_classes=>'a-Alert--info'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4475)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146085228768768.4475)
,p_theme_id=>3
,p_name=>'HORIZONTAL'
,p_display_name=>'Horizontal'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4475)
,p_css_classes=>'a-Alert--horizontal'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4475)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146322225768769.4475)
,p_theme_id=>3
,p_name=>'WIZARD'
,p_display_name=>'Wizard'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4475)
,p_css_classes=>'a-Alert--wizard'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4475)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146393064768769.4475)
,p_theme_id=>3
,p_name=>'REMOVE_ICON'
,p_display_name=>'Remove Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4475)
,p_css_classes=>'a-Alert--noIcon'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146615368768769.4475)
,p_theme_id=>3
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4475)
,p_css_classes=>'a-Alert--success'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4475)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147042367768771.4475)
,p_theme_id=>3
,p_name=>'REGIONCONTAINSITEMSTEXT'
,p_display_name=>'Region Contains Items / Text'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4475)
,p_css_classes=>'a-ButtonRegion--withItems'
,p_template_types=>'REGION'
,p_help_text=>'Check this option if this region contains items or text.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147189725768771.4475)
,p_theme_id=>3
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4475)
,p_css_classes=>'a-ButtonRegion--noUI'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4475)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147385795768771.4475)
,p_theme_id=>3
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4475)
,p_css_classes=>'a-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4475)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147655668768771.4475)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4475)
,p_css_classes=>'a-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4475)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147872948768771.4475)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4475)
,p_css_classes=>'a-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4475)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147976018768771.4475)
,p_theme_id=>3
,p_name=>'WIZARDDIALOG'
,p_display_name=>'Used for Wizard Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4475)
,p_css_classes=>'a-ButtonRegion--wizard'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857148162424768771.4475)
,p_theme_id=>3
,p_name=>'VISIBLE'
,p_display_name=>'Visible'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4475)
,p_css_classes=>'a-ButtonRegion--showTitle'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4475)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857148341454768771.4475)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4475)
,p_css_classes=>'a-ButtonRegion--accessibleTitle'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4475)
,p_template_types=>'REGION'
,p_help_text=>'Use this option to add a visually hidden heading which is accessible for screen readers, but otherwise not visible to users.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149438708768778.4475)
,p_theme_id=>3
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4475)
,p_css_classes=>'a-BadgeList--float'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4475)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149614105768778.4475)
,p_theme_id=>3
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4475)
,p_css_classes=>'a-BadgeList--fixed'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4475)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149843563768778.4475)
,p_theme_id=>3
,p_name=>'STACKEDVERTICALLY'
,p_display_name=>'Stacked Vertically'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4475)
,p_css_classes=>'a-BadgeList--stacked'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4475)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149998210768778.4475)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'32px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4475)
,p_css_classes=>'a-BadgeList--small'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4475)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150194417768778.4475)
,p_theme_id=>3
,p_name=>'MEDIUM'
,p_display_name=>'48px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4475)
,p_css_classes=>'a-BadgeList--medium'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4475)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150439507768778.4475)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'64px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4475)
,p_css_classes=>'a-BadgeList--large'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4475)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150608654768780.4475)
,p_theme_id=>3
,p_name=>'XLARGE'
,p_display_name=>'96px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4475)
,p_css_classes=>'a-BadgeList--xlarge'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4475)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150792333768780.4475)
,p_theme_id=>3
,p_name=>'XXLARGE'
,p_display_name=>'128px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4475)
,p_css_classes=>'a-BadgeList--xxlarge'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4475)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151008734768780.4475)
,p_theme_id=>3
,p_name=>'2COLUMNNGRID'
,p_display_name=>'2 Columnn Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4475)
,p_css_classes=>'a-BadgeList--cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4475)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151259777768780.4475)
,p_theme_id=>3
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4475)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--3cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4475)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151408063768780.4475)
,p_theme_id=>3
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4475)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--4cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4475)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151643103768780.4475)
,p_theme_id=>3
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4475)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--5cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4475)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151861194768780.4475)
,p_theme_id=>3
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4475)
,p_css_classes=>'a-BadgeList--flex'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4475)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896798730495581814.4475)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4475)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(808380142596819918.4475)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896798963380581814.4475)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4475)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(808380828683819918.4475)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799089194581814.4475)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4475)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4475)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799349986581814.4475)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4475)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4475)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799577541581814.4475)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4475)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4475)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799637215581814.4475)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4475)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799807498581814.4475)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4475)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_imp.id(808383088145819924.4475)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022191342234716.4475)
,p_theme_id=>3
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4475)
,p_css_classes=>'a-MediaList--cols a-MediaList--2cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4475)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022392217234716.4475)
,p_theme_id=>3
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4475)
,p_css_classes=>'a-MediaList--cols a-MediaList--3cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4475)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022597980234716.4475)
,p_theme_id=>3
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4475)
,p_css_classes=>'a-MediaList--cols a-MediaList--4cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4475)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022867300234717.4475)
,p_theme_id=>3
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4475)
,p_css_classes=>'a-MediaList--cols a-MediaList--5cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4475)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023065592234717.4475)
,p_theme_id=>3
,p_name=>'SPANHORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4475)
,p_css_classes=>'a-MediaList--horizontal'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4475)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023131122234717.4475)
,p_theme_id=>3
,p_name=>'HIDEBADGE'
,p_display_name=>'Hide Badge'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4475)
,p_css_classes=>'a-MediaList--noBadge'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023191297234717.4475)
,p_theme_id=>3
,p_name=>'HIDEDESCRIPTION'
,p_display_name=>'Hide Description'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4475)
,p_css_classes=>'a-MediaList--noDesc'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023315038234717.4475)
,p_theme_id=>3
,p_name=>'HIDETITLE'
,p_display_name=>'Hide Title'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4475)
,p_css_classes=>'a-MediaList--noTitle'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023432264234717.4475)
,p_theme_id=>3
,p_name=>'HIDEICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4475)
,p_css_classes=>'a-MediaList--noIcons'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023494059234717.4475)
,p_theme_id=>3
,p_name=>'SLIMLIST'
,p_display_name=>'Slim List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4475)
,p_css_classes=>'a-MediaList--slim'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378094918666945.4475)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4475)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(808380142596819918.4475)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378225037666947.4475)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4475)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(808380828683819918.4475)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378370589666947.4475)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4475)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4475)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378467813666947.4475)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4475)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378526097666947.4475)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4475)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4475)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378615102666947.4475)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4475)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_imp.id(808383088145819924.4475)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378735377666947.4475)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4475)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4475)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1036071796325339624.4475)
,p_theme_id=>3
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(514332292784430987.4475)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1036071972285339624.4475)
,p_theme_id=>3
,p_name=>'ADD_SLIDE_ANIMATION'
,p_display_name=>'Add Slide Animation'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(514332292784430987.4475)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1050367122398973653.4475)
,p_theme_id=>3
,p_name=>'SLIMPROGRESSLIST'
,p_display_name=>'Slim Progress List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(865273508717512144.4475)
,p_css_classes=>'a-WizardSteps--slim'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1309233880682664517.4475)
,p_theme_id=>3
,p_name=>'LEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_button_template_id=>wwv_flow_imp.id(868252865986181054.4475)
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(856117908453058029.4475)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1351338307429029043.4475)
,p_theme_id=>3
,p_name=>'USED_IN_DIALOG'
,p_display_name=>'Used in Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1274355059486017828.4475)
,p_css_classes=>'a-ProcessingRegion--dialog'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333722717814196.4475)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4475)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333859287814196.4475)
,p_theme_id=>3
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4475)
,p_css_classes=>'a-LinksList--showBadge'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333887728814196.4475)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4475)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334039640814196.4475)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4475)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334247146814196.4475)
,p_theme_id=>3
,p_name=>'FORTOPLEVELONLY'
,p_display_name=>'For top level only'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4475)
,p_css_classes=>'a-LinksList--showTopIcons'
,p_group_id=>wwv_flow_imp.id(806925000765340952.4475)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334455135814196.4475)
,p_theme_id=>3
,p_name=>'FORALLITEMS'
,p_display_name=>'For all items'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4475)
,p_css_classes=>'a-LinksList--showIcons'
,p_group_id=>wwv_flow_imp.id(806925000765340952.4475)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491342397110118.4475)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4475)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491390428110118.4475)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4475)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491480011110118.4475)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4475)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664488722406040473.4475)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4475)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4475)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664488933681040473.4475)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4475)
,p_css_classes=>'a-Region--accessibleHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4475)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489165994040473.4475)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4475)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4475)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489304869040473.4475)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4475)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4475)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489519844040473.4475)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4475)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_imp.id(860570508910721307.4475)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489753255040473.4475)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4475)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4475)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489941797040473.4475)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4475)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4475)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490153471040473.4475)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4475)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4475)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490336091040473.4475)
,p_theme_id=>3
,p_name=>'DEFAULTPADDING'
,p_display_name=>'Default Padding'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4475)
,p_css_classes=>'a-Region--paddedBody'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4475)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490377667040473.4475)
,p_theme_id=>3
,p_name=>'REMOVE_TOP_BORDER'
,p_display_name=>'Remove Top Border'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4475)
,p_css_classes=>'a-Region--noTopBorder'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490659850040473.4475)
,p_theme_id=>3
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4475)
,p_css_classes=>'a-Region--simple'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4475)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664501980442158869.4475)
,p_theme_id=>3
,p_name=>'RESPONSIVEICONCOLUMNS'
,p_display_name=>'Responsive Icon Columns'
,p_display_sequence=>2
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4475)
,p_css_classes=>'a-IRR-region--responsiveIconView'
,p_template_types=>'REGION'
,p_help_text=>'Automatically increases number of icon columns to show based on screen resolution.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664502160891158869.4475)
,p_theme_id=>3
,p_name=>'ICONLABELSRIGHT'
,p_display_name=>'Icon Labels on Right'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4475)
,p_css_classes=>'a-IRR-region--iconLabelsRight'
,p_template_types=>'REGION'
,p_help_text=>'Shows labels in Icon View to the right of the icon.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664502181188158869.4475)
,p_theme_id=>3
,p_name=>'REMOVEOUTERBORDERS'
,p_display_name=>'Remove Outer Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4475)
,p_css_classes=>'a-IRR-region--noOuterBorders'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508367504174332.4475)
,p_theme_id=>3
,p_name=>'FLUSHREGION'
,p_display_name=>'Flush Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4475)
,p_css_classes=>'a-Region--flush'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508426350174332.4475)
,p_theme_id=>3
,p_name=>'STACKEDREGION'
,p_display_name=>'Stacked Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4475)
,p_css_classes=>'a-Region--stacked'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508588305174332.4475)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4475)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4475)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508810521174332.4475)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4475)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4475)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509005841174332.4475)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4475)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_imp.id(860570508910721307.4475)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509270186174332.4475)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4475)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4475)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509448573174333.4475)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4475)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4475)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509659839174333.4475)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4475)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4475)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509822387174334.4475)
,p_theme_id=>3
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>.1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4475)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4475)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664510028962174334.4475)
,p_theme_id=>3
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4475)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4475)
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
 p_id=>wwv_flow_imp.id(141599633735752121)
,p_name=>'4150_COLUMN_NUMBER'
,p_message_language=>'pt-br'
,p_message_text=>'Coluna %0'
,p_version_scn=>2705352
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141584243428752117)
,p_name=>'ACCESS_CONTROL_ADMIN'
,p_message_language=>'pt-br'
,p_message_text=>'Administrador'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141584105254752117)
,p_name=>'ACCESS_CONTROL_USERNAME'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Nome do usu\00E1rio')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141646840591752135)
,p_name=>'ACCESS_DENIED_SIMPLE'
,p_message_language=>'pt-br'
,p_message_text=>'Acesso Negado'
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141603748013752123)
,p_name=>'ACCOUNT_HAS_BEEN_CREATED'
,p_message_language=>'pt-br'
,p_message_text=>'Sua conta %0 foi criada.'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141586951625752118)
,p_name=>'ACCOUNT_LOCKED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A conta est\00E1 bloqueada.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141571494872752113)
,p_name=>'AM_PM'
,p_message_language=>'pt-br'
,p_message_text=>'AM / PM'
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141554214007752108)
,p_name=>'APEX.ACTIONS.ACTION_LINK'
,p_message_language=>'pt-br'
,p_message_text=>unistr('link de a\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141554135030752108)
,p_name=>'APEX.ACTIONS.DIALOG_LINK'
,p_message_language=>'pt-br'
,p_message_text=>unistr('link de caixa de di\00E1logo')
,p_is_js_message=>true
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141718552941752156)
,p_name=>'APEX.ACTIONS.TOGGLE'
,p_message_language=>'pt-br'
,p_message_text=>'Alternar %0'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141726331659752159)
,p_name=>'APEX.ACTIVE_STATE'
,p_message_language=>'pt-br'
,p_message_text=>'(Ativo)'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141531143594752101)
,p_name=>'APEX.AI.CHAT_CLEARED'
,p_message_language=>'pt-br'
,p_message_text=>'Chat removido'
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141531032677752101)
,p_name=>'APEX.AI.CLEAR_CHAT'
,p_message_language=>'pt-br'
,p_message_text=>'Remover chat'
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141527646924752100)
,p_name=>'APEX.AI.CONSENT_ACCEPT'
,p_message_language=>'pt-br'
,p_message_text=>'Aceitar'
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141527711698752100)
,p_name=>'APEX.AI.CONSENT_DENY'
,p_message_language=>'pt-br'
,p_message_text=>'Negar'
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141527448715752100)
,p_name=>'APEX.AI.CONVERSATION_HISTORY'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Hist\00F3rico da Conversa\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141530840377752101)
,p_name=>'APEX.AI.COPIED'
,p_message_language=>'pt-br'
,p_message_text=>'Copiado'
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141530900631752101)
,p_name=>'APEX.AI.COPIED_TO_CLIPBOARD'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Copiado para a \00E1rea de transfer\00EAncia')
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141530606969752101)
,p_name=>'APEX.AI.COPY'
,p_message_language=>'pt-br'
,p_message_text=>'Copiar'
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141530727957752101)
,p_name=>'APEX.AI.COPY_TO_CLIPBOARD'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Copiar para a \00E1rea de transfer\00EAncia')
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141528177653752100)
,p_name=>'APEX.AI.DIALOG_TITLE'
,p_message_language=>'pt-br'
,p_message_text=>'Assistente'
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141528581727752100)
,p_name=>'APEX.AI.DISABLED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A IA est\00E1 desativada no n\00EDvel do espa\00E7o de trabalho ou da inst\00E2ncia.')
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141567804080752112)
,p_name=>'APEX.AI.GET_SERVER_ID_OR_STATIC_ID'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Servi\00E7o Generative AI com o ID fornecido ou est\00E1tico n\00E3o encontrado.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141566542675752112)
,p_name=>'APEX.AI.HTTP_4013_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro de autentica\00E7\00E3o ou acesso proibido (HTTP-%1) para o URL %0. Verifique a configura\00E7\00E3o do Generative AI Service %2.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141546308597752106)
,p_name=>'APEX.AI.HTTP_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Houve falha na solicita\00E7\00E3o HTTP ao Servi\00E7o Generative AI em %0 com HTTP-%1: %2')
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141570746069752113)
,p_name=>'APEX.AI.HTTP_FRIENDLY_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro na solicita\00E7\00E3o HTTP para o Generative AI Service para o plug-in %0 no modo %1. Verifique a configura\00E7\00E3o do Generative AI Service.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141533584020752102)
,p_name=>'APEX.AI.MAIN_QUICK_ACTIONS_ARIA_LABEL'
,p_message_language=>'pt-br'
,p_message_text=>'Exemplos'
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141531938868752101)
,p_name=>'APEX.AI.NAME_ASSISTANT'
,p_message_language=>'pt-br'
,p_message_text=>'Assistente'
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141533345336752102)
,p_name=>'APEX.AI.NAME_COMMA_MESSAGE'
,p_message_language=>'pt-br'
,p_message_text=>'%0,%1'
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141531869221752101)
,p_name=>'APEX.AI.NAME_USER'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Voc\00EA')
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141562527714752110)
,p_name=>'APEX.AI.OCI_CHAT_NOT_SUPPORTED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('No momento, n\00E3o h\00E1 suporte no OCI Generative AI para a experi\00EAncia de chat com v\00E1rias mensagens..')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141542449083752105)
,p_name=>'APEX.AI.PROMPT_ENRICHMENT_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro ao processar o prompt %0 para o aplicativo %1. Verifique se o App Builder est\00E1 dispon\00EDvel nesta inst\00E2ncia.')
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141547565747752106)
,p_name=>'APEX.AI.RESPONSE_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel processar a resposta para o Servi\00E7o de IA %0; resposta %1')
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141553737400752108)
,p_name=>'APEX.AI.SEND_MESSAGE'
,p_message_language=>'pt-br'
,p_message_text=>'Enviar Mensagem'
,p_is_js_message=>true
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141542052249752104)
,p_name=>'APEX.AI.SERVICE_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro no Servi\00E7o de IA de backend %0')
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141527831870752100)
,p_name=>'APEX.AI.TEXTAREA_LABEL'
,p_message_language=>'pt-br'
,p_message_text=>'Mensagem'
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141527914897752100)
,p_name=>'APEX.AI.TEXTAREA_PLACEHOLDER'
,p_message_language=>'pt-br'
,p_message_text=>'Digite sua mensagem aqui'
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141531241572752101)
,p_name=>'APEX.AI.USER_AVATAR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Avatar do usu\00E1rio')
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141531301352752101)
,p_name=>'APEX.AI.USE_THIS'
,p_message_language=>'pt-br'
,p_message_text=>'Use este(a)'
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141528026457752100)
,p_name=>'APEX.AI.WARN_UNSENT_MESSAGE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Voc\00EA tem uma mensagem n\00E3o enviada. Tem certeza?')
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141697025081752150)
,p_name=>'APEX.AJAX_SERVER_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>'A chamada do Ajax retornou o erro de servidor %0 para %1.'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141624165774752129)
,p_name=>'APEX.APPLICATION.ALIAS.NON_UNIQUE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O alias do aplicativo "%0" n\00E3o pode ser convertido em um ID de aplicativo \00FAnico.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141612965389752125)
,p_name=>'APEX.APPLICATION.ALIAS.UNHANDLED_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>'ERR-1816 Erro inesperado ao converter o alias de aplicativo p_flow_alias_or_id (%0).'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141710329789752154)
,p_name=>'APEX.APPLICATION.CHECKSUM.DESCRIPTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A soma de verifica\00E7\00E3o do aplicativo fornece uma maneira f\00E1cil de determinar se o mesmo aplicativo \00E9 implantado nos espa\00E7os de trabalho. Voc\00EA pode comparar essa soma de verifica\00E7\00E3o para determinar se h\00E1 uma correspond\00EAncia. ')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141596930273752121)
,p_name=>'APEX.AUTHENTICATION.AUTH_FUNC.UNHANDLED_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro ao processar fun\00E7\00E3o de autentica\00E7\00E3o.')
,p_version_scn=>2705352
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141578925040752115)
,p_name=>'APEX.AUTHENTICATION.AUTH_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro ao processar fun\00E7\00E3o de autentica\00E7\00E3o.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141750847219752166)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.HOST_PREFIX_MISMATCH'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O Nome do Tenant %0 retornado pelo Oracle Cloud Identity Management n\00E3o foi autorizado pelo dom\00EDnio %1!<br/><a href="&LOGOUT_URL.">Fa\00E7a log-in novamente</a> e especifique um nome de tenant autorizado ou altere seu URL.')
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141575020648752114)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.USER_IS_NOT_DEVELOPER'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Sua conta "%0" n\00E3o tem os privil\00E9gios de desenvolvimento necess\00E1rios (DB_DEVELOPER ou DB_ADMINISTRATOR)<br/> para o espa\00E7o de trabalho "%1"! <a href="&LOGOUT_URL.">Fa\00E7a log-in novamente</a> ap\00F3s os privil\00E9gios serem fornecidos.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141571605709752113)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.WRONG_GROUP_NAME'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O Nome do Tenant retornado pelo Oracle Cloud Identity Management n\00E3o foi autorizado pelo espa\00E7o de trabalho atual! <br/><a href="&LOGOUT_URL.">re-login</a> e especifique um nome de tenant autorizado.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141575174237752114)
,p_name=>'APEX.AUTHENTICATION.HOST_PREFIX_MISMATCH'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Por motivos de seguran\00E7a, n\00E3o s\00E3o permitidos aplicativos em execu\00E7\00E3o deste espa\00E7o de trabalho por meio do dom\00EDnio do URL.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141596661503752120)
,p_name=>'APEX.AUTHENTICATION.LDAP.DBMS_LDAP.ASK_FOR_INSTALLATION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Pe\00E7a ao DBA que execute $OH/rdbms/admin/catldap.sql.')
,p_version_scn=>2705351
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141596541556752120)
,p_name=>'APEX.AUTHENTICATION.LDAP.DBMS_LDAP.MISSING'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O pacote SYS.DBMS_LDAP n\00E3o existe ou \00E9 inv\00E1lido.')
,p_version_scn=>2705351
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141596470957752120)
,p_name=>'APEX.AUTHENTICATION.LDAP.EDIT_USER_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro ao processar fun\00E7\00E3o de edi\00E7\00E3o do usu\00E1rio LDAP.')
,p_version_scn=>2705351
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141596714898752121)
,p_name=>'APEX.AUTHENTICATION.LDAP.UNHANDLED_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro ao processar autentica\00E7\00E3o LDAP.')
,p_version_scn=>2705352
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141597589272752121)
,p_name=>'APEX.AUTHENTICATION.LOGIN.ILLEGAL_PAGE_ARG'
,p_message_language=>'pt-br'
,p_message_text=>'Erro no argumento p_flow_page para o procedimento log-in_page.'
,p_version_scn=>2705352
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141597166246752121)
,p_name=>'APEX.AUTHENTICATION.LOGIN.INVALID_ARG'
,p_message_language=>'pt-br'
,p_message_text=>unistr('p_session inv\00E1lido em wwv_flow_custom_auth_std.log-in--p_flow_page:%0 p_session_id:%1.')
,p_version_scn=>2705352
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141648493120752136)
,p_name=>'APEX.AUTHENTICATION.LOGIN.MALFORMED_ARGS'
,p_message_language=>'pt-br'
,p_message_text=>'Argumento incorreto para wwv_flow_custom_auth_std.log-in--p_flow_page:p_session_id:p_entry_point:%0:%1:%2.'
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141597234970752121)
,p_name=>'APEX.AUTHENTICATION.LOGIN.NULL_USER'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Nome de usu\00E1rio nulo passado para o procedimento de log-in.')
,p_version_scn=>2705352
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141584010918752117)
,p_name=>'APEX.AUTHENTICATION.LOGIN_THROTTLE.COUNTER'
,p_message_language=>'pt-br'
,p_message_text=>'Aguarde <span id="apex_login_throttle_sec">%0</span> segundos para acessar o sistema novamente.'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141585336396752117)
,p_name=>'APEX.AUTHENTICATION.LOGIN_THROTTLE.ERROR'
,p_message_language=>'pt-br'
,p_message_text=>'A tentativa de log-in foi bloqueada.'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141646187994752135)
,p_name=>'APEX.AUTHENTICATION.NOT_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Autentica\00E7\00E3o "%0" n\00E3o encontrada')
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141585836081752117)
,p_name=>'APEX.AUTHENTICATION.NO_SECURITY_GROUP_ID'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O ID do grupo se seguran\00E7a \00E9 nulo.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141597016832752121)
,p_name=>'APEX.AUTHENTICATION.POST_AUTH_PROC.UNHANDLED_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro ao executar o processo de p\00F3s-autentica\00E7\00E3o.')
,p_version_scn=>2705352
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141596854346752121)
,p_name=>'APEX.AUTHENTICATION.PRE_AUTH_PROC.UNHANDLED_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro ao executar o processo de pr\00E9-autentica\00E7\00E3o.')
,p_version_scn=>2705352
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141598588929752121)
,p_name=>'APEX.AUTHENTICATION.RESET_PASSWORD.INSTRUCTIONS'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Abra o URL no mesmo  browser em que iniciou a solicita\00E7\00E3o de Redefini\00E7\00E3o de Senha.  Se voc\00EA clicar no URL de Redefini\00E7\00E3o de Senha e for redirecionado para'),
unistr('a p\00E1gina de log-in, inicie a Redefini\00E7\00E3o de Senha novamente e saia do'),
'browser aberto.'))
,p_version_scn=>2705352
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141748348338752165)
,p_name=>'APEX.AUTHENTICATION.RESET_PASSWORD_URL'
,p_message_language=>'pt-br'
,p_message_text=>'Redefinir URL da Senha'
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141575321326752114)
,p_name=>'APEX.AUTHENTICATION.RM_GROUP_NOT_GRANTED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O grupo de consumidores do Resource Manager %0 n\00E3o foi concedido para %1')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141575426282752114)
,p_name=>'APEX.AUTHENTICATION.RM_INFO_TO_GRANT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Use DBMS_RESOURCE_MANAGER_PRIVS.GRANT_SWITCH_CONSUMER_GROUP para conceder o privil\00E9gio n\00E3o encontrado.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141610095144752124)
,p_name=>'APEX.AUTHENTICATION.SESSION_SENTRY_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro ao processar fun\00E7\00E3o de sentinela da sess\00E3o.')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141610134043752124)
,p_name=>'APEX.AUTHENTICATION.SESSION_VERIFY_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro ao processar fun\00E7\00E3o de verifica\00E7\00E3o da sess\00E3o.')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141610368741752125)
,p_name=>'APEX.AUTHENTICATION.SSO.ASK_FOR_INSTALLATION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Pe\00E7a ao administrador do %0 que configure o mecanismo para o SSO do Oracle Application Server.')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141620775923752128)
,p_name=>'APEX.AUTHENTICATION.SSO.BAD_URLC'
,p_message_language=>'pt-br'
,p_message_text=>'%0 ilegal no token %1 retornado por sso.'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141597480132752121)
,p_name=>'APEX.AUTHENTICATION.SSO.FIX_PARTNER_APP'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Edite o esquema de autentica\00E7\00E3o e adicione o nome do aplicativo.')
,p_version_scn=>2705352
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141620496765752128)
,p_name=>'APEX.AUTHENTICATION.SSO.ILLEGAL_CALLER'
,p_message_language=>'pt-br'
,p_message_text=>'Chamador ilegal do procedimento %0:'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141620660588752128)
,p_name=>'APEX.AUTHENTICATION.SSO.INVALID_APP_SESSION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Sess\00E3o de aplicativo inv\00E1lida em token de urlc: %0')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141620215674752127)
,p_name=>'APEX.AUTHENTICATION.SSO.MISSING_APP_REGISTRATION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro em portal_sso_redirect: faltando informa\00E7\00F5es de registro do aplicativo: %0')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141610275516752124)
,p_name=>'APEX.AUTHENTICATION.SSO.PACKAGE_MISSING'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O pacote WWSEC_SSO_ENABLER_PRIVATE n\00E3o existe ou \00E9 inv\00E1lido.')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141597313594752121)
,p_name=>'APEX.AUTHENTICATION.SSO.PARTNER_APP_IS_NULL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o foi poss\00EDvel localizar no esquema de autentica\00E7\00E3o o nome do aplicativo parceiro registrado.')
,p_version_scn=>2705352
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141620307678752128)
,p_name=>'APEX.AUTHENTICATION.SSO.REGISTER_APP'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Registre este aplicativo conforme descrito no guia de instala\00E7\00E3o.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141610467764752125)
,p_name=>'APEX.AUTHENTICATION.SSO.UNHANDLED_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro ao processar autentica\00E7\00E3o SSO.')
,p_version_scn=>2705354
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141723773009752158)
,p_name=>'APEX.AUTHENTICATION.UNAUTHORIZED_URL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('URL N\00E3o Autorizado: %0')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141609814565752124)
,p_name=>'APEX.AUTHENTICATION.UNHANDLED_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro ao processar autentica\00E7\00E3o.')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141575219234752114)
,p_name=>'APEX.AUTHENTICATION.WORKSPACE_NOT_ASSIGNED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O Espa\00E7o de Trabalho "%0" est\00E1 inativo. Entre em contato com o administrador.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141575980494752114)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED'
,p_message_language=>'pt-br'
,p_message_text=>'%0'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141585075042752117)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED.APPLICATION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Acesso negado pela verifica\00E7\00E3o de seguran\00E7a do Aplicativo')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141585113583752117)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED.PAGE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Acesso negado pela verifica\00E7\00E3o de seguran\00E7a da P\00E1gina')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141585243736752117)
,p_name=>'APEX.AUTHORIZATION.UNHANDLED_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro ao processar autoriza\00E7\00E3o.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141654379529752138)
,p_name=>'APEX.BUILT_WITH_LOVE_USING_APEX'
,p_message_language=>'pt-br'
,p_message_text=>'Criado com %0 usando %1'
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141654460343752138)
,p_name=>'APEX.BUILT_WITH_LOVE_USING_APEX.ACCESSIBLE.LOVE'
,p_message_language=>'pt-br'
,p_message_text=>'amor'
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141714220481752155)
,p_name=>'APEX.CALENDAR.EVENT_DESCRIPTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Descri\00E7\00E3o do Evento')
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141714054493752155)
,p_name=>'APEX.CALENDAR.EVENT_END'
,p_message_language=>'pt-br'
,p_message_text=>'Data Final'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141714312347752155)
,p_name=>'APEX.CALENDAR.EVENT_ID'
,p_message_language=>'pt-br'
,p_message_text=>'ID do Evento'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141713968750752155)
,p_name=>'APEX.CALENDAR.EVENT_START'
,p_message_language=>'pt-br'
,p_message_text=>'Data Inicial'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141714110569752155)
,p_name=>'APEX.CALENDAR.EVENT_TITLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('T\00EDtulo do Evento')
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141556713805752109)
,p_name=>'APEX.CARD'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Cart\00E3o')
,p_version_scn=>2705345
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141556936679752109)
,p_name=>'APEX.CARD.CARD_ACTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A\00E7\00E3o do Cart\00E3o')
,p_version_scn=>2705345
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141597637421752121)
,p_name=>'APEX.CHECKBOX.VISUALLY_HIDDEN_CHECKBOX'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Caixa de sele\00E7\00E3o visualmente oculta')
,p_is_js_message=>true
,p_version_scn=>2705352
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141599531206752121)
,p_name=>'APEX.CHECKSUM.CONTENT_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro no conte\00FAdo da soma de verifica\00E7\00E3o')
,p_version_scn=>2705352
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141599479348752121)
,p_name=>'APEX.CHECKSUM.FORMAT_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro no formato da soma de verifica\00E7\00E3o')
,p_version_scn=>2705352
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141669380556752142)
,p_name=>'APEX.CLIPBOARD.COPIED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Copiado para a \00E1rea de transfer\00EAncia.')
,p_is_js_message=>true
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141668812192752142)
,p_name=>'APEX.CLIPBOARD.NOTSUP'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Este browser n\00E3o suporta c\00F3pia de um bot\00E3o ou menu. Tente Ctrl+C ou Comando+C.')
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141655085600752138)
,p_name=>'APEX.CLOSE_NOTIFICATION'
,p_message_language=>'pt-br'
,p_message_text=>'Fechar'
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141533447056752102)
,p_name=>'APEX.CODE_EDITOR.MAXIMUM_LENGTH_EXCEEDED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O conte\00FAdo do Editor de C\00F3digo excede o tamanho m\00E1ximo do item (real %0, permitido %1 caracteres)')
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141713589861752155)
,p_name=>'APEX.COLOR_PICKER.CONTRAST'
,p_message_language=>'pt-br'
,p_message_text=>'Contraste'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141708028688752153)
,p_name=>'APEX.COLOR_PICKER.CURRENT'
,p_message_language=>'pt-br'
,p_message_text=>'Atual'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141707932613752153)
,p_name=>'APEX.COLOR_PICKER.INITIAL'
,p_message_language=>'pt-br'
,p_message_text=>'Inicial'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141712194494752155)
,p_name=>'APEX.COLOR_PICKER.INVALID_COLOR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('#LABEL# deve ser uma cor v\00E1lida. Exemplo: %0')
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141574529484752114)
,p_name=>'APEX.COLOR_PICKER.MORE_PRESET_COLORS'
,p_message_language=>'pt-br'
,p_message_text=>'Mais cores'
,p_is_js_message=>true
,p_version_scn=>2705348
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141574606209752114)
,p_name=>'APEX.COLOR_PICKER.OPEN'
,p_message_language=>'pt-br'
,p_message_text=>'Abrir seletor de cores'
,p_is_js_message=>true
,p_version_scn=>2705348
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141531756419752101)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.ALPHA_SLIDER'
,p_message_language=>'pt-br'
,p_message_text=>'Controle deslizante horizontal Alfa. Use as teclas de seta para navegar.'
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141531481938752101)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.COLOR_SPECTRUM'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Controle deslizante com quatro dire\00E7\00F5es para Espectro de Cores. Use as teclas de seta para navegar.')
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141531562255752101)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.HUE_SLIDER'
,p_message_language=>'pt-br'
,p_message_text=>'Controle deslizante vertical para Matiz. Use as teclas de seta para navegar.'
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141707878082752153)
,p_name=>'APEX.COLOR_PICKER.TITLE'
,p_message_language=>'pt-br'
,p_message_text=>'Escolha uma cor'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141708113354752153)
,p_name=>'APEX.COLOR_PICKER.TOGGLE_TITLE'
,p_message_language=>'pt-br'
,p_message_text=>'Alterar o formato da cor'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141746020241752165)
,p_name=>'APEX.COMBOBOX.LIST_OF_VALUES'
,p_message_language=>'pt-br'
,p_message_text=>'Lista de Valores'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141746199294752165)
,p_name=>'APEX.COMBOBOX.SHOW_ALL_VALUES'
,p_message_language=>'pt-br'
,p_message_text=>'Lista de abertura para: %0'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141726443535752159)
,p_name=>'APEX.COMPLETED_STATE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('(Conclu\00EDdo)')
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141615395277752126)
,p_name=>'APEX.CONTACT_ADMIN'
,p_message_language=>'pt-br'
,p_message_text=>'Entre em contato com o administrador do seu aplicativo.'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141630831860752131)
,p_name=>'APEX.CONTACT_ADMIN.DEBUG'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Entre em contato com o administrador do seu aplicativo.',
unistr('Os detalhes sobre este incidente est\00E3o dispon\00EDveis via id de depura\00E7\00E3o "%0".')))
,p_version_scn=>2705359
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141712426752752155)
,p_name=>'APEX.CORRECT_ERRORS'
,p_message_language=>'pt-br'
,p_message_text=>'Corrija os erros antes de salvar.'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141557704853752109)
,p_name=>'APEX.CS.ACTIVE_VALUE_CHIP'
,p_message_language=>'pt-br'
,p_message_text=>'%0. Pressione Backspace para excluir.'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141655915159752138)
,p_name=>'APEX.CS.MATCHES_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 correspond\00EAncias encontradas')
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141537893259752103)
,p_name=>'APEX.CS.MATCH_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>unistr('1 correspond\00EAncia encontrada')
,p_is_js_message=>true
,p_version_scn=>2705339
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141655815609752138)
,p_name=>'APEX.CS.NO_MATCHES'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Nenhuma correspond\00EAncia encontrada')
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141532293996752102)
,p_name=>'APEX.CS.OTHERS_GROUP'
,p_message_language=>'pt-br'
,p_message_text=>'Outros'
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141532126785752102)
,p_name=>'APEX.CS.SELECTED_VALUES_COUNTER'
,p_message_language=>'pt-br'
,p_message_text=>'%0 valores selecionados'
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141726965006752159)
,p_name=>'APEX.CURRENT_PROGRESS'
,p_message_language=>'pt-br'
,p_message_text=>'Andamento Atual'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141712852979752155)
,p_name=>'APEX.DATA.LOAD.FILE_DOES_NOT_EXIST'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O arquivo especificado no item %0 n\00E3o existe em APEX_APPLICATION_TEMP_FILES.')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141701348157752151)
,p_name=>'APEX.DATA_HAS_CHANGED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A vers\00E3o atual dos dados contidos no banco de dados foi alterada desde que o usu\00E1rio iniciou o processo de atualiza\00E7\00E3o.')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141670487127752142)
,p_name=>'APEX.DATA_LOAD.DO_NOT_LOAD'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o Carregar')
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141716739522752156)
,p_name=>'APEX.DATA_LOAD.FAILED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro de pr\00E9-processamento')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141716594717752156)
,p_name=>'APEX.DATA_LOAD.INSERT'
,p_message_language=>'pt-br'
,p_message_text=>'Inserir linha'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141730179195752160)
,p_name=>'APEX.DATA_LOAD.SEQUENCE_ACTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Sequ\00EAncia: A\00E7\00E3o')
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141716698971752156)
,p_name=>'APEX.DATA_LOAD.UPDATE'
,p_message_language=>'pt-br'
,p_message_text=>'Atualizar linha'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141545142799752105)
,p_name=>'APEX.DATEPICKER.ACTIONS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A\00E7\00F5es')
,p_is_js_message=>true
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141572789317752113)
,p_name=>'APEX.DATEPICKER.AM_PM'
,p_message_language=>'pt-br'
,p_message_text=>'AM/PM'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141558860543752109)
,p_name=>'APEX.DATEPICKER.BOUNDARY_ITEM_FORMAT_INVALID'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 deve ser um seletor de data ou uma data v\00E1lida, por exemplo, %1.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141668096541752142)
,p_name=>'APEX.DATEPICKER.CLEAR'
,p_message_language=>'pt-br'
,p_message_text=>'Remover'
,p_is_js_message=>true
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141576262757752115)
,p_name=>'APEX.DATEPICKER.DONE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Conclu\00EDdo')
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141587276657752118)
,p_name=>'APEX.DATEPICKER.FORMAT_NOT_SUPPORTED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 tem partes sem suporte na m\00E1scara de formato: %1')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141572448008752113)
,p_name=>'APEX.DATEPICKER.HOUR'
,p_message_language=>'pt-br'
,p_message_text=>'Hora'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141656339521752138)
,p_name=>'APEX.DATEPICKER.ICON_TEXT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Calend\00E1rio Popup: %0')
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141572253373752113)
,p_name=>'APEX.DATEPICKER.ISO_WEEK'
,p_message_language=>'pt-br'
,p_message_text=>'Semana'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141572357306752113)
,p_name=>'APEX.DATEPICKER.ISO_WEEK_ABBR'
,p_message_language=>'pt-br'
,p_message_text=>'WK'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141572630365752113)
,p_name=>'APEX.DATEPICKER.MINUTES'
,p_message_language=>'pt-br'
,p_message_text=>'Minutos'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141572896779752113)
,p_name=>'APEX.DATEPICKER.MONTH'
,p_message_language=>'pt-br'
,p_message_text=>unistr('M\00EAs')
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141573251107752114)
,p_name=>'APEX.DATEPICKER.NEXT_MONTH'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Pr\00F3ximo M\00EAs')
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141542872377752105)
,p_name=>'APEX.DATEPICKER.POPUP'
,p_message_language=>'pt-br'
,p_message_text=>'Popup para %0'
,p_is_js_message=>true
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141573198752752114)
,p_name=>'APEX.DATEPICKER.PREVIOUS_MONTH'
,p_message_language=>'pt-br'
,p_message_text=>unistr('M\00EAs Anterior')
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141665614821752141)
,p_name=>'APEX.DATEPICKER.READONLY_DATEPICKER'
,p_message_language=>'pt-br'
,p_message_text=>'Seletor de data somente para leitura'
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141574046757752114)
,p_name=>'APEX.DATEPICKER.SELECT_DATE'
,p_message_language=>'pt-br'
,p_message_text=>'Selecionar Data'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141542921740752105)
,p_name=>'APEX.DATEPICKER.SELECT_DATE_AND_TIME'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Selecionar Data e Hor\00E1rio')
,p_is_js_message=>true
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141540181416752104)
,p_name=>'APEX.DATEPICKER.SELECT_DAY'
,p_message_language=>'pt-br'
,p_message_text=>'Selecionar Dia'
,p_is_js_message=>true
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141543589727752105)
,p_name=>'APEX.DATEPICKER.SELECT_MONTH_AND_YEAR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Selecionar M\00EAs e Ano')
,p_is_js_message=>true
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141540343881752104)
,p_name=>'APEX.DATEPICKER.SELECT_TIME'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Selecionar Hor\00E1rio')
,p_is_js_message=>true
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141540877545752104)
,p_name=>'APEX.DATEPICKER.TODAY'
,p_message_language=>'pt-br'
,p_message_text=>'Hoje'
,p_is_js_message=>true
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141558449320752109)
,p_name=>'APEX.DATEPICKER.VALUE_INVALID'
,p_message_language=>'pt-br'
,p_message_text=>unistr('#LABEL# deve ser uma data v\00E1lida, por exemplo, %0.')
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141558147028752109)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_BETWEEN'
,p_message_language=>'pt-br'
,p_message_text=>'#LABEL# deve estar entre %0 e %1.'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141558290871752109)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_ON_OR_AFTER'
,p_message_language=>'pt-br'
,p_message_text=>'#LABEL# deve ser igual ou posterior a %0.'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141558393030752109)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_ON_OR_BEFORE'
,p_message_language=>'pt-br'
,p_message_text=>'#LABEL# deve ser igual ou anterior a %0.'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141549773955752107)
,p_name=>'APEX.DATEPICKER.VISUALLY_HIDDEN_EDIT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Edi\00E7\00E3o Visualmente Oculta')
,p_is_js_message=>true
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141573068881752114)
,p_name=>'APEX.DATEPICKER.YEAR'
,p_message_language=>'pt-br'
,p_message_text=>'Ano'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141660031646752139)
,p_name=>'APEX.DATEPICKER_VALUE_GREATER_MAX_DATE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('#LABEL# \00E9 posterior \00E0 data m\00E1xima especificada %0.')
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141660440648752139)
,p_name=>'APEX.DATEPICKER_VALUE_INVALID'
,p_message_language=>'pt-br'
,p_message_text=>unistr('#LABEL# n\00E3o corresponde ao formato %0.')
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141659935177752139)
,p_name=>'APEX.DATEPICKER_VALUE_LESS_MIN_DATE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('#LABEL# \00E9 anterior \00E0 data m\00EDnima especificada %0.')
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141660126087752139)
,p_name=>'APEX.DATEPICKER_VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'pt-br'
,p_message_text=>unistr('#LABEL# n\00E3o est\00E1 na faixa v\00E1lida de %0 a %1.')
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141660362884752139)
,p_name=>'APEX.DATEPICKER_VALUE_NOT_IN_YEAR_RANGE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('#LABEL# n\00E3o est\00E1 dentro da faixa de anos v\00E1lida de %0 e %1.')
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141552154983752107)
,p_name=>'APEX.DBMS_CLOUD_INT.DBMS_CLOUD_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro interno durante o processamento da solicita\00E7\00E3o DBMS_CLOUD.')
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141712760381752155)
,p_name=>'APEX.DIALOG.CANCEL'
,p_message_language=>'pt-br'
,p_message_text=>'Cancelar'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141738673472752162)
,p_name=>'APEX.DIALOG.CLOSE'
,p_message_language=>'pt-br'
,p_message_text=>'Fechar'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141599825737752121)
,p_name=>'APEX.DIALOG.CONFIRMATION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Confirma\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705352
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141740613864752163)
,p_name=>'APEX.DIALOG.HELP'
,p_message_language=>'pt-br'
,p_message_text=>'Ajuda'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141712524516752155)
,p_name=>'APEX.DIALOG.OK'
,p_message_language=>'pt-br'
,p_message_text=>'OK'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141712601689752155)
,p_name=>'APEX.DIALOG.SAVE'
,p_message_language=>'pt-br'
,p_message_text=>'Salvar'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141580369175752116)
,p_name=>'APEX.DIALOG.TITLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('T\00EDtulo do Di\00E1logo')
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141620088058752127)
,p_name=>'APEX.DIALOG.VISUALLY_HIDDEN_TITLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('T\00EDtulo da caixa de Di\00E1logo visualmente oculto')
,p_is_js_message=>true
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141541150422752104)
,p_name=>'APEX.DOCGEN'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Fun\00E7\00E3o Predefinida do Oracle Document Generator')
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141551980487752107)
,p_name=>'APEX.DOCGEN.DBMS_CLOUD_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro ao durante a impress\00E3o de um documento.')
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141529145203752101)
,p_name=>'APEX.DOCGEN.INVALID_OUTPUT_TYPE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%s n\00E3o suporta %1 como sa\00EDda.')
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141541066703752104)
,p_name=>'APEX.DOCGEN.INVOKE_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro "%0" ao chamar a Fun\00E7\00E3o Predefinida do Oracle Document Generator:')
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141532564861752102)
,p_name=>'APEX.DOCGEN.TEMPLATE_REQUIRED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Um modelo \00E9 obrigat\00F3rio.')
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141557986427752109)
,p_name=>'APEX.DOWNLOAD.ERROR'
,p_message_language=>'pt-br'
,p_message_text=>'Erro durante o download do arquivo.'
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141557859514752109)
,p_name=>'APEX.DOWNLOAD.NO_DATA_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o foram encontrados dados que possam ser baixados.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141561445437752110)
,p_name=>'APEX.ENVIRONMENT.RUNTIME_ONLY'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Este recurso n\00E3o est\00E1 dispon\00EDvel em um ambiente Somente Runtime.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141614234496752126)
,p_name=>'APEX.ERROR'
,p_message_language=>'pt-br'
,p_message_text=>'Erro'
,p_is_js_message=>true
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141574188628752114)
,p_name=>'APEX.ERROR.CALLBACK_FAILED'
,p_message_language=>'pt-br'
,p_message_text=>'Ocorreu o seguinte erro ao executar o callback de tratamento de erro: %0'
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141586712999752118)
,p_name=>'APEX.ERROR.ERROR_PAGE.UNHANDLED_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Ocorreu erro durante a pintura da p\00E1gina de erro: %0')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141575826688752114)
,p_name=>'APEX.ERROR.INTERNAL'
,p_message_language=>'pt-br'
,p_message_text=>'Erro Interno'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141725573537752159)
,p_name=>'APEX.ERROR.INTERNAL.CONTACT_ADMINISTRATOR'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Entre em contato com o administrador.',
unistr('Os detalhes sobre este incidente est\00E3o dispon\00EDveis via id de depura\00E7\00E3o "%0".')))
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141720178206752157)
,p_name=>'APEX.ERROR.ORA-16000'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O banco de dados est\00E1 aberto para acesso somente para leitura.')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141750200427752166)
,p_name=>'APEX.ERROR.ORA-28353'
,p_message_language=>'pt-br'
,p_message_text=>unistr('ORA-28353: Falha ao abrir a wallet. Dados do aplicativo n\00E3o acess\00EDveis atualmente.')
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141720202526752157)
,p_name=>'APEX.ERROR.PAGE_NOT_AVAILABLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Desculpe, esta p\00E1gina n\00E3o est\00E1 dispon\00EDvel')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141578810902752115)
,p_name=>'APEX.ERROR.TECHNICAL_INFO'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Informa\00E7\00F5es T\00E9cnicas (dispon\00EDvel somente para desenvolvedores)')
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141684761193752147)
,p_name=>'APEX.ERROR_MESSAGE_HEADING'
,p_message_language=>'pt-br'
,p_message_text=>'Mensagem de Erro'
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141698697520752151)
,p_name=>'APEX.EXPECTED_FORMAT'
,p_message_language=>'pt-br'
,p_message_text=>'Formato esperado: %0'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141663501573752140)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.ALREADY_IN_ACL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O usu\00E1rio j\00E1 est\00E1 na Lista de Controle de Acesso')
,p_version_scn=>2705365
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141663417140752140)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.CREATE_CONFIRM'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Confirme a adi\00E7\00E3o do(s) seguinte(s) %0 usu\00E1rio(s) \00E0 lista de controle de acesso <strong>%1</strong>.')
,p_version_scn=>2705365
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141663922174752140)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.DUPLICATE_USER'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Usu\00E1rio duplicado')
,p_version_scn=>2705366
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141663671920752140)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.MISSING_AT_SIGN'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Falta uma arroba (@) no Endere\00E7o de e-mail')
,p_version_scn=>2705365
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141663756092752140)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.MISSING_DOT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Falta um ponto (.) no Endere\00E7o de e-mail')
,p_version_scn=>2705365
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141663809299752140)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.USERNAME_TOO_LONG'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Nome do usu\00E1rio muito longo')
,p_version_scn=>2705365
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141664113295752140)
,p_name=>'APEX.FEATURE.ACL.INFO.ACL_ONLY'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Somente usu\00E1rios definidos na lista de controle de acesso do aplicativo podem acessar este aplicativo')
,p_version_scn=>2705366
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141664201713752141)
,p_name=>'APEX.FEATURE.ACL.INFO.ACL_VALUE_INVALID'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Valor de Defini\00E7\00E3o de Controle de Acesso Inesperado: %0')
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141664080480752140)
,p_name=>'APEX.FEATURE.ACL.INFO.ALL_USERS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Todos os usu\00E1rios autenticados podem acessar este aplicativo')
,p_version_scn=>2705366
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141708510034752154)
,p_name=>'APEX.FEATURE.CONFIG.DISABLED'
,p_message_language=>'pt-br'
,p_message_text=>'Desativado'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141708468750752154)
,p_name=>'APEX.FEATURE.CONFIG.ENABLED'
,p_message_language=>'pt-br'
,p_message_text=>'Ativado'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141708770210752154)
,p_name=>'APEX.FEATURE.CONFIG.IS_DISABLED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0: Est\00E1 Desativado')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141708601951752154)
,p_name=>'APEX.FEATURE.CONFIG.IS_ENABLED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0: Est\00E1 Ativado')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141557289027752109)
,p_name=>'APEX.FEATURE.CONFIG.NOT_SUPPORTED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o Suportado')
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141618469655752127)
,p_name=>'APEX.FEATURE.CONFIG.OFF'
,p_message_language=>'pt-br'
,p_message_text=>'Desativado'
,p_is_js_message=>true
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141618372474752127)
,p_name=>'APEX.FEATURE.CONFIG.ON'
,p_message_language=>'pt-br'
,p_message_text=>'Ativado'
,p_is_js_message=>true
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141708350369752153)
,p_name=>'APEX.FEATURE.TOP_USERS.USERNAME.NOT_IDENTIFIED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('n\00E3o identificado')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141548881293752106)
,p_name=>'APEX.FILESIZE.BYTES'
,p_message_language=>'pt-br'
,p_message_text=>'%0 Bytes'
,p_is_js_message=>true
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141549344039752107)
,p_name=>'APEX.FILESIZE.GB'
,p_message_language=>'pt-br'
,p_message_text=>'%0 GB'
,p_is_js_message=>true
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141549041740752106)
,p_name=>'APEX.FILESIZE.KB'
,p_message_language=>'pt-br'
,p_message_text=>'%0 KB'
,p_is_js_message=>true
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141549245459752107)
,p_name=>'APEX.FILESIZE.MB'
,p_message_language=>'pt-br'
,p_message_text=>'%0 MB'
,p_is_js_message=>true
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141701533250752151)
,p_name=>'APEX.FILE_BROWSE.DOWNLOAD_LINK_TEXT'
,p_message_language=>'pt-br'
,p_message_text=>'Fazer Download'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141554601182752108)
,p_name=>'APEX.FS.ACTIONS_MENU_BUTTON_LABEL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Op\00E7\00F5es')
,p_is_js_message=>true
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141554305043752108)
,p_name=>'APEX.FS.ACTIONS_MENU_FILTER'
,p_message_language=>'pt-br'
,p_message_text=>'Filtrar'
,p_is_js_message=>true
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141554570200752108)
,p_name=>'APEX.FS.ACTIONS_MENU_HIDE'
,p_message_language=>'pt-br'
,p_message_text=>'Ocultar Faceta'
,p_is_js_message=>true
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141579297452752115)
,p_name=>'APEX.FS.ADD_FILTER'
,p_message_language=>'pt-br'
,p_message_text=>'Adicionar Filtro'
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141655553067752138)
,p_name=>'APEX.FS.APPLIED_FACET'
,p_message_language=>'pt-br'
,p_message_text=>'Filtro Aplicado %0'
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141579912553752116)
,p_name=>'APEX.FS.APPLY'
,p_message_language=>'pt-br'
,p_message_text=>'Aplicar'
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141699128023752151)
,p_name=>'APEX.FS.BATCH_APPLY'
,p_message_language=>'pt-br'
,p_message_text=>'Aplicar'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141580067388752116)
,p_name=>'APEX.FS.CANCEL'
,p_message_language=>'pt-br'
,p_message_text=>'Cancelar'
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141563858278752111)
,p_name=>'APEX.FS.CHART_BAR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Gr\00E1fico de Barras')
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141711841461752155)
,p_name=>'APEX.FS.CHART_OTHERS'
,p_message_language=>'pt-br'
,p_message_text=>'Outros'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141563973348752111)
,p_name=>'APEX.FS.CHART_PIE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Gr\00E1fico de Pizza')
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141710466944752154)
,p_name=>'APEX.FS.CHART_TITLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Gr\00E1fico')
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141563695454752111)
,p_name=>'APEX.FS.CHART_VALUE_LABEL'
,p_message_language=>'pt-br'
,p_message_text=>'Contagem'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141699621695752151)
,p_name=>'APEX.FS.CLEAR'
,p_message_language=>'pt-br'
,p_message_text=>'Remover'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141699716820752151)
,p_name=>'APEX.FS.CLEAR_ALL'
,p_message_language=>'pt-br'
,p_message_text=>'Remover Tudo'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141699889116752151)
,p_name=>'APEX.FS.CLEAR_VALUE'
,p_message_language=>'pt-br'
,p_message_text=>'Remover %0'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141716378938752156)
,p_name=>'APEX.FS.COLUMN_UNAUTHORIZED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A coluna %1, referenciada pela faceta %0, est\00E1 indispon\00EDvel ou n\00E3o est\00E1 autorizada.')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141527032583752100)
,p_name=>'APEX.FS.CONFIG_TITLE'
,p_message_language=>'pt-br'
,p_message_text=>'Escolher Filtros a serem mostrados'
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141653521881752137)
,p_name=>'APEX.FS.COUNT_RESULTS'
,p_message_language=>'pt-br'
,p_message_text=>'%0 resultados'
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141653658280752137)
,p_name=>'APEX.FS.COUNT_SELECTED'
,p_message_language=>'pt-br'
,p_message_text=>'%0 selecionado(s)'
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141656481281752138)
,p_name=>'APEX.FS.CUR_FILTERS_LM'
,p_message_language=>'pt-br'
,p_message_text=>'Filtros atuais'
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141532055890752101)
,p_name=>'APEX.FS.FACETED_SEARCH_NEEDS_REGION_QUERY'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A Pesquisa Facetada requer uma Origem de Dados no n\00EDvel de regi\00E3o.')
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141535768192752103)
,p_name=>'APEX.FS.FACETS_LIST'
,p_message_language=>'pt-br'
,p_message_text=>'Lista de filtros'
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141714848867752155)
,p_name=>'APEX.FS.FACET_VALUE_LIMIT_EXCEEDED'
,p_message_language=>'pt-br'
,p_message_text=>'Limite de valor distinto (%0) excedido para a faceta %1.'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141701163893752151)
,p_name=>'APEX.FS.FC_TYPE_UNSUPPORTED_FOR_DATE_COLUMNS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o h\00E1 suporte para a faceta %0 em colunas DATE ou TIMESTAMP.')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141699294185752151)
,p_name=>'APEX.FS.FILTER'
,p_message_language=>'pt-br'
,p_message_text=>'Filtrar %0'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141573860535752114)
,p_name=>'APEX.FS.FILTER_APPLIED'
,p_message_language=>'pt-br'
,p_message_text=>'%0 (Filtro Aplicado)'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141699309608752151)
,p_name=>'APEX.FS.GO'
,p_message_language=>'pt-br'
,p_message_text=>'Ir'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141569370461752112)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_C'
,p_message_language=>'pt-br'
,p_message_text=>unistr('cont\00E9m %0')
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141700752427752151)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_EQ'
,p_message_language=>'pt-br'
,p_message_text=>'igual a %0'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141569031288752112)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_GT'
,p_message_language=>'pt-br'
,p_message_text=>'maior que %0'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141569166860752112)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_GTE'
,p_message_language=>'pt-br'
,p_message_text=>'maior ou igual a %0'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141568722176752112)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_LT'
,p_message_language=>'pt-br'
,p_message_text=>'menor que %0'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141568994642752112)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_LTE'
,p_message_language=>'pt-br'
,p_message_text=>'menor ou igual a %0'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141568291008752112)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NC'
,p_message_language=>'pt-br'
,p_message_text=>unistr('n\00E3o cont\00E9m %0')
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141554016437752108)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NEQ'
,p_message_language=>'pt-br'
,p_message_text=>unistr('\00E9 diferente de %0')
,p_is_js_message=>true
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141568340300752112)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NSTARTS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('n\00E3o come\00E7a com %0')
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141569249211752112)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_STARTS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('come\00E7a com %0')
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141567319895752112)
,p_name=>'APEX.FS.INPUT_FACET_SELECTOR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Sele\00E7\00E3o de Faceta')
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141543149272752105)
,p_name=>'APEX.FS.INPUT_INVALID_FILTER_PREFIX'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O prefixo do filtro "%0" \00E9 inv\00E1lido para a faceta "%1".')
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141541526149752104)
,p_name=>'APEX.FS.INPUT_MISSING_FILTER_PREFIX'
,p_message_language=>'pt-br'
,p_message_text=>'Falta o prefixo do filtro para a faceta "%0".'
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141575734940752114)
,p_name=>'APEX.FS.INPUT_OPERATOR'
,p_message_language=>'pt-br'
,p_message_text=>'Operador'
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141557648046752109)
,p_name=>'APEX.FS.INPUT_OPERATOR.C'
,p_message_language=>'pt-br'
,p_message_text=>unistr('cont\00E9m')
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141556643038752109)
,p_name=>'APEX.FS.INPUT_OPERATOR.EQ'
,p_message_language=>'pt-br'
,p_message_text=>'igual a'
,p_is_js_message=>true
,p_version_scn=>2705345
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141557341974752109)
,p_name=>'APEX.FS.INPUT_OPERATOR.GT'
,p_message_language=>'pt-br'
,p_message_text=>'maior que'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141557441119752109)
,p_name=>'APEX.FS.INPUT_OPERATOR.GTE'
,p_message_language=>'pt-br'
,p_message_text=>'maior que ou igual a'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141557007340752109)
,p_name=>'APEX.FS.INPUT_OPERATOR.LT'
,p_message_language=>'pt-br'
,p_message_text=>'menor que'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141557146485752109)
,p_name=>'APEX.FS.INPUT_OPERATOR.LTE'
,p_message_language=>'pt-br'
,p_message_text=>'menor que ou igual a'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141568151584752112)
,p_name=>'APEX.FS.INPUT_OPERATOR.NC'
,p_message_language=>'pt-br'
,p_message_text=>unistr('n\00E3o cont\00E9m')
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141556847246752109)
,p_name=>'APEX.FS.INPUT_OPERATOR.NEQ'
,p_message_language=>'pt-br'
,p_message_text=>unistr('n\00E3o igual a')
,p_is_js_message=>true
,p_version_scn=>2705345
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141568025403752112)
,p_name=>'APEX.FS.INPUT_OPERATOR.NSTARTS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('n\00E3o come\00E7a com')
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141557527162752109)
,p_name=>'APEX.FS.INPUT_OPERATOR.STARTS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('come\00E7a com')
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141576189908752114)
,p_name=>'APEX.FS.INPUT_UNSUPPORTED_DATA_TYPE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o h\00E1 suporte para o tipo de dados %0 (%1) na faceta Campo de Entrada.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141543091968752105)
,p_name=>'APEX.FS.INPUT_UNSUPPORTED_FILTER_FOR_DATA_TYPE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o h\00E1 suporte para o filtro "%0" da faceta "%1" (tipo de dados %2).')
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141575698123752114)
,p_name=>'APEX.FS.INPUT_VALUE'
,p_message_language=>'pt-br'
,p_message_text=>'Valor'
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141700956771752151)
,p_name=>'APEX.FS.NO_SEARCH_COLUMNS_PROVIDED'
,p_message_language=>'pt-br'
,p_message_text=>'Nenhuma coluna de pesquisa foi fornecida para a faceta %0'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141527186023752100)
,p_name=>'APEX.FS.OPEN_CONFIG'
,p_message_language=>'pt-br'
,p_message_text=>'Mais Filtros'
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141653776790752137)
,p_name=>'APEX.FS.RANGE_BEGIN'
,p_message_language=>'pt-br'
,p_message_text=>unistr('In\00EDcio do Intervalo')
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141700446775752151)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL'
,p_message_language=>'pt-br'
,p_message_text=>'%0 a %1'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141700523121752151)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL_OPEN_HI'
,p_message_language=>'pt-br'
,p_message_text=>'Acima de %0'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141700667705752151)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL_OPEN_LO'
,p_message_language=>'pt-br'
,p_message_text=>'Abaixo de %0'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141653841973752137)
,p_name=>'APEX.FS.RANGE_END'
,p_message_language=>'pt-br'
,p_message_text=>'Fim da Faixa'
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141718483648752156)
,p_name=>'APEX.FS.RANGE_LOV_ITEM_INVALID'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O item #%2 ("%1") da LOV para a faceta de intervalo %0 \00E9 inv\00E1lido (falta o separador "|").')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141700849751752151)
,p_name=>'APEX.FS.RANGE_MANUAL_NOT_SUPPORTED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('No momento n\00E3o h\00E1 suporte para Entrada Manual para a faceta de Faixa %0, pois a coluna \00E9 DATE ou TIMESTAMP.')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141700183093752151)
,p_name=>'APEX.FS.RANGE_TEXT'
,p_message_language=>'pt-br'
,p_message_text=>'a'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141563741338752111)
,p_name=>'APEX.FS.REMOVE_CHART'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Remover Gr\00E1fico')
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141650127808752136)
,p_name=>'APEX.FS.RESET'
,p_message_language=>'pt-br'
,p_message_text=>'Redefinir'
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141699531322752151)
,p_name=>'APEX.FS.SEARCH_LABEL'
,p_message_language=>'pt-br'
,p_message_text=>'Pesquisar'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141699477838752151)
,p_name=>'APEX.FS.SEARCH_PLACEHOLDER'
,p_message_language=>'pt-br'
,p_message_text=>'Pesquisar...'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141700353039752151)
,p_name=>'APEX.FS.SELECT_PLACEHOLDER'
,p_message_language=>'pt-br'
,p_message_text=>'- Selecionar -'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141563589870752111)
,p_name=>'APEX.FS.SHOW_CHART'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Mostrar Gr\00E1fico')
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141699972565752151)
,p_name=>'APEX.FS.SHOW_LESS'
,p_message_language=>'pt-br'
,p_message_text=>'Mostrar Menos'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141700004298752151)
,p_name=>'APEX.FS.SHOW_MORE'
,p_message_language=>'pt-br'
,p_message_text=>'Mostrar Tudo'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141700230863752151)
,p_name=>'APEX.FS.STAR_RATING_LABEL'
,p_message_language=>'pt-br'
,p_message_text=>'%0 estrelas ou mais'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141655472622752138)
,p_name=>'APEX.FS.SUGGESTIONS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Filtrar sugest\00F5es')
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141701023808752151)
,p_name=>'APEX.FS.TEXT_FIELD_ONLY_FOR_NUMBER_COLUMNS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('No momento, s\00F3 h\00E1 suporte para a faceta %0 em colunas NUMBER.')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141526586608752100)
,p_name=>'APEX.FS.TOTAL_ROW_COUNT_LABEL'
,p_message_language=>'pt-br'
,p_message_text=>'Contagem Total de Linhas'
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141716494976752156)
,p_name=>'APEX.FS.UNSUPPORTED_DATA_TYPE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o h\00E1 suporte para o tipo de dados %0 (%1) na pesquisa facetada.')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141646687431752135)
,p_name=>'APEX.FS.VISUALLY_HIDDEN_HEADING'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Cabe\00E7alho visualmente oculto')
,p_is_js_message=>true
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141708986305752154)
,p_name=>'APEX.GO_TO_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>'Ir para o erro'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141664968549752141)
,p_name=>'APEX.GV.AGG_CONTEXT'
,p_message_language=>'pt-br'
,p_message_text=>'Agregar.'
,p_is_js_message=>true
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141592818397752119)
,p_name=>'APEX.GV.BLANK_HEADING'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Cabe\00E7alho em branco')
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141674260998752143)
,p_name=>'APEX.GV.BREAK_COLLAPSE'
,p_message_language=>'pt-br'
,p_message_text=>'Contrair controle de quebra'
,p_is_js_message=>true
,p_version_scn=>2705370
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141665009893752141)
,p_name=>'APEX.GV.BREAK_CONTEXT'
,p_message_language=>'pt-br'
,p_message_text=>'Control-break.'
,p_is_js_message=>true
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141674124455752143)
,p_name=>'APEX.GV.BREAK_EXPAND'
,p_message_language=>'pt-br'
,p_message_text=>'Expandir controle de quebra'
,p_is_js_message=>true
,p_version_scn=>2705370
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141673937240752143)
,p_name=>'APEX.GV.DELETED_COUNT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 linhas exclu\00EDdas')
,p_is_js_message=>true
,p_version_scn=>2705370
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141743068341752164)
,p_name=>'APEX.GV.DUP_REC_ID'
,p_message_language=>'pt-br'
,p_message_text=>'Identidade duplicada'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141535988085752103)
,p_name=>'APEX.GV.ENTER_EDIT_MODE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Entrando no modo de edi\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141661814610752140)
,p_name=>'APEX.GV.FIRST_PAGE'
,p_message_language=>'pt-br'
,p_message_text=>'Primeiro'
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141534786337752102)
,p_name=>'APEX.GV.FLOATING_ITEM.DIALOG.HIDE_DIALOG'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Ocultar caixa de di\00E1logo')
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141533701875752102)
,p_name=>'APEX.GV.FLOATING_ITEM.DIALOG.TITLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Conte\00FAdo de c\00E9lula em excesso flutuante')
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141535004760752102)
,p_name=>'APEX.GV.FLOATING_ITEM.SHOW_DIALOG'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Mostrar conte\00FAdo em excesso')
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141609266821752124)
,p_name=>'APEX.GV.FOOTER_LANDMARK'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Rodap\00E9 da Grade')
,p_is_js_message=>true
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141665227540752141)
,p_name=>'APEX.GV.GROUP_CONTEXT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Cabe\00E7alho do grupo')
,p_is_js_message=>true
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141665187222752141)
,p_name=>'APEX.GV.HEADER_CONTEXT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Cabe\00E7alho.')
,p_is_js_message=>true
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141661985984752140)
,p_name=>'APEX.GV.LAST_PAGE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('\00DAltimo(a)')
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141536175728752103)
,p_name=>'APEX.GV.LEAVE_EDIT_MODE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Saindo do modo de edi\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141560843539752110)
,p_name=>'APEX.GV.LOAD_ALL'
,p_message_language=>'pt-br'
,p_message_text=>'Carregar Tudo'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141683760003752146)
,p_name=>'APEX.GV.LOAD_MORE'
,p_message_language=>'pt-br'
,p_message_text=>'Mostrar Mais'
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141661654871752140)
,p_name=>'APEX.GV.NEXT_PAGE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Pr\00F3ximo')
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141665362354752141)
,p_name=>'APEX.GV.PAGE_RANGE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Linhas da p\00E1gina')
,p_is_js_message=>true
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141574420917752114)
,p_name=>'APEX.GV.PAGE_RANGE_ENTITY'
,p_message_language=>'pt-br'
,p_message_text=>unistr('P\00E1gina %0')
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141662098080752140)
,p_name=>'APEX.GV.PAGE_RANGE_XY'
,p_message_language=>'pt-br'
,p_message_text=>'%0 - %1'
,p_is_js_message=>true
,p_version_scn=>2705365
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141662122209752140)
,p_name=>'APEX.GV.PAGE_RANGE_XYZ'
,p_message_language=>'pt-br'
,p_message_text=>'%0 - %1 de %2'
,p_is_js_message=>true
,p_version_scn=>2705365
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141719032015752157)
,p_name=>'APEX.GV.PAGE_SELECTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Sele\00E7\00E3o de P\00E1gina')
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141609514544752124)
,p_name=>'APEX.GV.PAGINATION_LANDMARK'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Pagina\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141661713425752140)
,p_name=>'APEX.GV.PREV_PAGE'
,p_message_language=>'pt-br'
,p_message_text=>'Anterior'
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141559768977752110)
,p_name=>'APEX.GV.RANGE_DISPLAY'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Exibi\00E7\00E3o da Faixa')
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141593165963752119)
,p_name=>'APEX.GV.ROWS_SELECTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Sele\00E7\00E3o de Linhas')
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141742889233752164)
,p_name=>'APEX.GV.ROW_ADDED'
,p_message_language=>'pt-br'
,p_message_text=>'Adicionado'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141742932055752164)
,p_name=>'APEX.GV.ROW_CHANGED'
,p_message_language=>'pt-br'
,p_message_text=>'Alterado'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141751209530752166)
,p_name=>'APEX.GV.ROW_COLUMN_CONTEXT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Sequ\00EAncia de linha de grade %0, Coluna %1.')
,p_is_js_message=>true
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141751332297752166)
,p_name=>'APEX.GV.ROW_CONTEXT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Sequ\00EAncia de linha de grade %0.')
,p_is_js_message=>true
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141742745601752164)
,p_name=>'APEX.GV.ROW_DELETED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Exclu\00EDdo')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141665506798752141)
,p_name=>'APEX.GV.ROW_HEADER'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Cabe\00E7alho de linha')
,p_is_js_message=>true
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141593001064752119)
,p_name=>'APEX.GV.ROW_SELECTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Sele\00E7\00E3o de Linhas')
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141560921243752110)
,p_name=>'APEX.GV.SELECTED_ENTITY_COUNT'
,p_message_language=>'pt-br'
,p_message_text=>'%0 %1 selecionado'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141661019715752140)
,p_name=>'APEX.GV.SELECTION_CELL_COUNT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 c\00E9lulas selecionadas')
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141662257020752140)
,p_name=>'APEX.GV.SELECTION_COUNT'
,p_message_language=>'pt-br'
,p_message_text=>'%0 linhas selecionadas'
,p_is_js_message=>true
,p_version_scn=>2705365
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141704374182752152)
,p_name=>'APEX.GV.SELECT_ALL'
,p_message_language=>'pt-br'
,p_message_text=>'Selecionar Tudo'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141597899449752121)
,p_name=>'APEX.GV.SELECT_ALL_ROWS'
,p_message_language=>'pt-br'
,p_message_text=>'Selecionar Todas as Linhas'
,p_is_js_message=>true
,p_version_scn=>2705352
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141674085166752143)
,p_name=>'APEX.GV.SELECT_PAGE_N'
,p_message_language=>'pt-br'
,p_message_text=>unistr('P\00E1gina %0')
,p_is_js_message=>true
,p_version_scn=>2705370
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141665413824752141)
,p_name=>'APEX.GV.SELECT_ROW'
,p_message_language=>'pt-br'
,p_message_text=>'Selecionar Linha'
,p_is_js_message=>true
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141665743810752141)
,p_name=>'APEX.GV.SORTED_ASCENDING'
,p_message_language=>'pt-br'
,p_message_text=>'Classificado em Ordem Crescente %0'
,p_is_js_message=>true
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141665851294752141)
,p_name=>'APEX.GV.SORTED_DESCENDING'
,p_message_language=>'pt-br'
,p_message_text=>'Classificado em Ordem Decrescente %0'
,p_is_js_message=>true
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141661100609752140)
,p_name=>'APEX.GV.SORT_ASCENDING'
,p_message_language=>'pt-br'
,p_message_text=>'Classificar por Ordem Crescente'
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141661434767752140)
,p_name=>'APEX.GV.SORT_ASCENDING_ORDER'
,p_message_language=>'pt-br'
,p_message_text=>'Classificar em Ordem Crescente %0'
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141661208137752140)
,p_name=>'APEX.GV.SORT_DESCENDING'
,p_message_language=>'pt-br'
,p_message_text=>'Classificar por Ordem Decrescente'
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141661573918752140)
,p_name=>'APEX.GV.SORT_DESCENDING_ORDER'
,p_message_language=>'pt-br'
,p_message_text=>'Classificar em Ordem Decrescente %0'
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141661342754752140)
,p_name=>'APEX.GV.SORT_OFF'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o Classificar')
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141526994363752100)
,p_name=>'APEX.GV.SORT_OPTIONS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Op\00E7\00F5es de classifica\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141609390098752124)
,p_name=>'APEX.GV.STATE_ICONS_LANDMARK'
,p_message_language=>'pt-br'
,p_message_text=>unistr('\00CDcones de Estado')
,p_is_js_message=>true
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141609419989752124)
,p_name=>'APEX.GV.STATUS_LANDMARK'
,p_message_language=>'pt-br'
,p_message_text=>'Status da Grade'
,p_is_js_message=>true
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141539265288752104)
,p_name=>'APEX.GV.TOTAL_ENTITY_PLURAL'
,p_message_language=>'pt-br'
,p_message_text=>'%0 %1'
,p_is_js_message=>true
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141538977460752104)
,p_name=>'APEX.GV.TOTAL_ENTITY_SINGULAR'
,p_message_language=>'pt-br'
,p_message_text=>'1 %0'
,p_is_js_message=>true
,p_version_scn=>2705339
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141673834940752143)
,p_name=>'APEX.GV.TOTAL_PAGES'
,p_message_language=>'pt-br'
,p_message_text=>'Total %0'
,p_is_js_message=>true
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141592694848752119)
,p_name=>'APEX.HTTP.REQUEST_FAILED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Houve falha na solicita\00E7\00E3o HTTP para "%0".')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141594289006752120)
,p_name=>'APEX.ICON_LIST.COLUMN'
,p_message_language=>'pt-br'
,p_message_text=>'Coluna %0'
,p_is_js_message=>true
,p_version_scn=>2705351
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141594413226752120)
,p_name=>'APEX.ICON_LIST.COLUMN_AND_ROW'
,p_message_language=>'pt-br'
,p_message_text=>'Coluna %0 e linha %1'
,p_is_js_message=>true
,p_version_scn=>2705351
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141594751933752120)
,p_name=>'APEX.ICON_LIST.FIRST_COLUMN'
,p_message_language=>'pt-br'
,p_message_text=>unistr('J\00E1 na primeira coluna. Coluna %0 e linha %1')
,p_is_js_message=>true
,p_version_scn=>2705351
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141594609674752120)
,p_name=>'APEX.ICON_LIST.FIRST_ROW'
,p_message_language=>'pt-br'
,p_message_text=>unistr('J\00E1 na primeira linha. Coluna %0 e linha %1')
,p_is_js_message=>true
,p_version_scn=>2705351
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141740230052752163)
,p_name=>'APEX.ICON_LIST.GRID_DIM'
,p_message_language=>'pt-br'
,p_message_text=>'Apresentado em %0 colunas e %1 linhas'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141594855893752120)
,p_name=>'APEX.ICON_LIST.LAST_COLUMN'
,p_message_language=>'pt-br'
,p_message_text=>unistr('J\00E1 na \00FAltima coluna. Coluna %0 e linha %1')
,p_is_js_message=>true
,p_version_scn=>2705351
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141594559111752120)
,p_name=>'APEX.ICON_LIST.LAST_ROW'
,p_message_language=>'pt-br'
,p_message_text=>unistr('J\00E1 na \00FAltima linha. Coluna %0 e linha %1')
,p_is_js_message=>true
,p_version_scn=>2705351
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141673740438752143)
,p_name=>'APEX.ICON_LIST.LIST_DIM'
,p_message_language=>'pt-br'
,p_message_text=>'Apresentado em %0 linhas'
,p_is_js_message=>true
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141594394693752120)
,p_name=>'APEX.ICON_LIST.ROW'
,p_message_language=>'pt-br'
,p_message_text=>'Linha %0'
,p_is_js_message=>true
,p_version_scn=>2705351
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141751091110752166)
,p_name=>'APEX.IG.ACC_LABEL'
,p_message_language=>'pt-br'
,p_message_text=>'Grade Interativa %0'
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141658160897752139)
,p_name=>'APEX.IG.ACTIONS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A\00E7\00F5es')
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141659197236752139)
,p_name=>'APEX.IG.ADD'
,p_message_language=>'pt-br'
,p_message_text=>'Adicionar'
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141659096531752139)
,p_name=>'APEX.IG.ADD_ROW'
,p_message_language=>'pt-br'
,p_message_text=>'Adicionar Linha'
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141744631784752164)
,p_name=>'APEX.IG.AGGREGATE'
,p_message_language=>'pt-br'
,p_message_text=>'Agregar'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141730235719752160)
,p_name=>'APEX.IG.AGGREGATION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Agrega\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141731929484752161)
,p_name=>'APEX.IG.ALL'
,p_message_language=>'pt-br'
,p_message_text=>'Tudo'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141689553348752148)
,p_name=>'APEX.IG.ALL_TEXT_COLUMNS'
,p_message_language=>'pt-br'
,p_message_text=>'Todas as Colunas de Texto'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141690762297752148)
,p_name=>'APEX.IG.ALTERNATIVE'
,p_message_language=>'pt-br'
,p_message_text=>'Alternativo'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141691876670752149)
,p_name=>'APEX.IG.AND'
,p_message_language=>'pt-br'
,p_message_text=>'e'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141711249571752154)
,p_name=>'APEX.IG.APPROX_COUNT_DISTINCT'
,p_message_language=>'pt-br'
,p_message_text=>'Contagem Aproximada de Itens Diferentes'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141745673711752165)
,p_name=>'APEX.IG.APPROX_COUNT_DISTINCT_OVERALL'
,p_message_language=>'pt-br'
,p_message_text=>'Contagem Geral Aproximada de Itens Distintos'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141728857618752160)
,p_name=>'APEX.IG.AREA'
,p_message_language=>'pt-br'
,p_message_text=>unistr('\00C1reas')
,p_is_js_message=>true
,p_version_scn=>2705376
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141730780213752160)
,p_name=>'APEX.IG.ASCENDING'
,p_message_language=>'pt-br'
,p_message_text=>'Crescente'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141690846392752148)
,p_name=>'APEX.IG.AUTHORIZATION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Autoriza\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141744726597752164)
,p_name=>'APEX.IG.AUTO'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Autom\00E1tico')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141711603182752154)
,p_name=>'APEX.IG.AVG'
,p_message_language=>'pt-br'
,p_message_text=>unistr('M\00E9dia')
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141745319857752164)
,p_name=>'APEX.IG.AVG_OVERALL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('M\00E9dia Geral')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141728306704752159)
,p_name=>'APEX.IG.AXIS_LABEL_TITLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('T\00EDtulo do Eixo de Label')
,p_is_js_message=>true
,p_version_scn=>2705376
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141728571291752159)
,p_name=>'APEX.IG.AXIS_VALUE_DECIMAL'
,p_message_language=>'pt-br'
,p_message_text=>'Casas Decimais'
,p_is_js_message=>true
,p_version_scn=>2705376
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141728478440752159)
,p_name=>'APEX.IG.AXIS_VALUE_TITLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('T\00EDtulo do Eixo de Valor')
,p_is_js_message=>true
,p_version_scn=>2705376
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141734553424752161)
,p_name=>'APEX.IG.BACKGROUND_COLOR'
,p_message_language=>'pt-br'
,p_message_text=>'Cor de Fundo'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141728913281752160)
,p_name=>'APEX.IG.BAR'
,p_message_language=>'pt-br'
,p_message_text=>'Barras'
,p_is_js_message=>true
,p_version_scn=>2705376
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141686180887752147)
,p_name=>'APEX.IG.BETWEEN'
,p_message_language=>'pt-br'
,p_message_text=>'entre'
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141735735141752162)
,p_name=>'APEX.IG.BOTH'
,p_message_language=>'pt-br'
,p_message_text=>'Ambos'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141729082904752160)
,p_name=>'APEX.IG.BUBBLE'
,p_message_language=>'pt-br'
,p_message_text=>'Bolhas'
,p_is_js_message=>true
,p_version_scn=>2705376
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141659383190752139)
,p_name=>'APEX.IG.CANCEL'
,p_message_language=>'pt-br'
,p_message_text=>'Cancelar'
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141691715257752149)
,p_name=>'APEX.IG.CASE_SENSITIVE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Distin\00E7\00E3o entre Mai\00FAsculas e Min\00FAsculas')
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141746291310752165)
,p_name=>'APEX.IG.CASE_SENSITIVE_WITH_BRACKETS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('(Distin\00E7\00E3o entre Mai\00FAsculas e Min\00FAsculas)')
,p_is_js_message=>true
,p_version_scn=>2705379
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141717594831752156)
,p_name=>'APEX.IG.CHANGES_SAVED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Altera\00E7\00F5es salvas')
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141659729831752139)
,p_name=>'APEX.IG.CHANGE_VIEW'
,p_message_language=>'pt-br'
,p_message_text=>'Alterar View'
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141692820179752149)
,p_name=>'APEX.IG.CHART'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Gr\00E1fico')
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141689371866752148)
,p_name=>'APEX.IG.CHART_MAX_DATAPOINT_CNT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Sua consulta ultrapassa o n\00FAmero m\00E1ximo de %0 pontos de dados por gr\00E1fico. Aplique um filtro para reduzir o n\00FAmero de registros de sua consulta base.')
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141658037745752139)
,p_name=>'APEX.IG.CHART_VIEW'
,p_message_language=>'pt-br'
,p_message_text=>unistr('View de Gr\00E1fico')
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141666440308752141)
,p_name=>'APEX.IG.CLEAR'
,p_message_language=>'pt-br'
,p_message_text=>'Remover'
,p_is_js_message=>true
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141727839543752159)
,p_name=>'APEX.IG.CLOSE_COLUMN'
,p_message_language=>'pt-br'
,p_message_text=>'Fechamento'
,p_is_js_message=>true
,p_version_scn=>2705376
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141734733304752161)
,p_name=>'APEX.IG.COLORS'
,p_message_language=>'pt-br'
,p_message_text=>'Cores'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141712030956752155)
,p_name=>'APEX.IG.COLOR_PREVIEW'
,p_message_language=>'pt-br'
,p_message_text=>'Visualizar'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141691129840752148)
,p_name=>'APEX.IG.COLUMN'
,p_message_language=>'pt-br'
,p_message_text=>'Coluna'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141658245895752139)
,p_name=>'APEX.IG.COLUMNS'
,p_message_language=>'pt-br'
,p_message_text=>'Colunas'
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141620199452752127)
,p_name=>'APEX.IG.COLUMN_HEADER_ACTIONS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A\00E7\00F5es da Coluna')
,p_is_js_message=>true
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141619956710752127)
,p_name=>'APEX.IG.COLUMN_HEADER_ACTIONS_FOR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A\00E7\00F5es da coluna "%0"')
,p_is_js_message=>true
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141736558491752162)
,p_name=>'APEX.IG.COLUMN_TYPE'
,p_message_language=>'pt-br'
,p_message_text=>'Finalidade da Coluna'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141691229831752148)
,p_name=>'APEX.IG.COMPLEX'
,p_message_language=>'pt-br'
,p_message_text=>'Complexo(a)'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141658429507752139)
,p_name=>'APEX.IG.COMPUTE'
,p_message_language=>'pt-br'
,p_message_text=>'Calcular'
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141686776382752147)
,p_name=>'APEX.IG.CONTAINS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('cont\00E9m')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141693023915752149)
,p_name=>'APEX.IG.CONTROL_BREAK'
,p_message_language=>'pt-br'
,p_message_text=>'Quebra de Controle'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141666232485752141)
,p_name=>'APEX.IG.COPY_CB'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Copiar para \00C1rea de Transfer\00EAncia')
,p_is_js_message=>true
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141666391077752141)
,p_name=>'APEX.IG.COPY_DOWN'
,p_message_language=>'pt-br'
,p_message_text=>'Copiar'
,p_is_js_message=>true
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141711098758752154)
,p_name=>'APEX.IG.COUNT'
,p_message_language=>'pt-br'
,p_message_text=>'Contagem'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141711199575752154)
,p_name=>'APEX.IG.COUNT_DISTINCT'
,p_message_language=>'pt-br'
,p_message_text=>'Contar Diferentes'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141745522853752164)
,p_name=>'APEX.IG.COUNT_DISTINCT_OVERALL'
,p_message_language=>'pt-br'
,p_message_text=>'Contagem Geral de Itens Distintos'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141745464795752164)
,p_name=>'APEX.IG.COUNT_OVERALL'
,p_message_language=>'pt-br'
,p_message_text=>'Contagem Global'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141743194573752164)
,p_name=>'APEX.IG.CREATE_X'
,p_message_language=>'pt-br'
,p_message_text=>'Criar %0'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141689774620752148)
,p_name=>'APEX.IG.DATA'
,p_message_language=>'pt-br'
,p_message_text=>'Dados'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141736378024752162)
,p_name=>'APEX.IG.DATA_TYPE'
,p_message_language=>'pt-br'
,p_message_text=>'Tipo de Dados'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141735970097752162)
,p_name=>'APEX.IG.DATE'
,p_message_language=>'pt-br'
,p_message_text=>'Data'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141717372263752156)
,p_name=>'APEX.IG.DATE_INVALID_VALUE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Valor de Data Inv\00E1lido')
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141687428198752147)
,p_name=>'APEX.IG.DAYS'
,p_message_language=>'pt-br'
,p_message_text=>'dias'
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141690463418752148)
,p_name=>'APEX.IG.DEFAULT_SETTINGS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Defini\00E7\00F5es Padr\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141690221373752148)
,p_name=>'APEX.IG.DEFAULT_TYPE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Tipo Padr\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141659241852752139)
,p_name=>'APEX.IG.DELETE'
,p_message_language=>'pt-br'
,p_message_text=>'Excluir'
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141737466224752162)
,p_name=>'APEX.IG.DELETE_REPORT_CONFIRM'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Tem certeza de que deseja excluir este relat\00F3rio?')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141694871958752150)
,p_name=>'APEX.IG.DELETE_ROW'
,p_message_language=>'pt-br'
,p_message_text=>'Excluir Linha'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141693624800752149)
,p_name=>'APEX.IG.DELETE_ROWS'
,p_message_language=>'pt-br'
,p_message_text=>'Excluir Linhas'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141730849758752160)
,p_name=>'APEX.IG.DESCENDING'
,p_message_language=>'pt-br'
,p_message_text=>'Decrescente'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141692556908752149)
,p_name=>'APEX.IG.DETAIL'
,p_message_language=>'pt-br'
,p_message_text=>'Detalhe'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141657747239752139)
,p_name=>'APEX.IG.DETAIL_VIEW'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Exibi\00E7\00E3o Detalhada')
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141719825838752157)
,p_name=>'APEX.IG.DIRECTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Dire\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141692244723752149)
,p_name=>'APEX.IG.DISABLED'
,p_message_language=>'pt-br'
,p_message_text=>'Desativado'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141686807033752147)
,p_name=>'APEX.IG.DOES_NOT_CONTAIN'
,p_message_language=>'pt-br'
,p_message_text=>unistr('n\00E3o cont\00E9m')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141687009965752147)
,p_name=>'APEX.IG.DOES_NOT_START_WITH'
,p_message_language=>'pt-br'
,p_message_text=>unistr('n\00E3o come\00E7a com')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141729121936752160)
,p_name=>'APEX.IG.DONUT'
,p_message_language=>'pt-br'
,p_message_text=>'Rosca'
,p_is_js_message=>true
,p_version_scn=>2705376
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141693259929752149)
,p_name=>'APEX.IG.DOWNLOAD'
,p_message_language=>'pt-br'
,p_message_text=>'Fazer Download'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141583549834752117)
,p_name=>'APEX.IG.DOWNLOAD_DATA_ONLY'
,p_message_language=>'pt-br'
,p_message_text=>'Somente Dados'
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141738460662752162)
,p_name=>'APEX.IG.DOWNLOAD_FORMAT'
,p_message_language=>'pt-br'
,p_message_text=>'Escolher Formato'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141598676377752121)
,p_name=>'APEX.IG.DOWNLOAD_FORMAT_NOT_ENABLED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O Formato de Download %0 n\00E3o est\00E1 ativado.')
,p_version_scn=>2705352
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141731525255752160)
,p_name=>'APEX.IG.DUPLICATE_AGGREGATION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Agrega\00E7\00E3o Duplicada')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141731637781752160)
,p_name=>'APEX.IG.DUPLICATE_CONTROLBREAK'
,p_message_language=>'pt-br'
,p_message_text=>'Quebra de Controle Duplicada'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141694702551752149)
,p_name=>'APEX.IG.DUPLICATE_ROW'
,p_message_language=>'pt-br'
,p_message_text=>'Linha Duplicada'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141693505103752149)
,p_name=>'APEX.IG.DUPLICATE_ROWS'
,p_message_language=>'pt-br'
,p_message_text=>'Linhas Duplicadas'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141658810996752139)
,p_name=>'APEX.IG.EDIT'
,p_message_language=>'pt-br'
,p_message_text=>'Editar'
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141730638717752160)
,p_name=>'APEX.IG.EDIT_CHART'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Editar Gr\00E1fico')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141611168612752125)
,p_name=>'APEX.IG.EDIT_CONTROL'
,p_message_language=>'pt-br'
,p_message_text=>'Editar %0'
,p_is_js_message=>true
,p_version_scn=>2705356
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141742056302752163)
,p_name=>'APEX.IG.EDIT_GROUP_BY'
,p_message_language=>'pt-br'
,p_message_text=>'Editar Grupo por'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141649221113752136)
,p_name=>'APEX.IG.EDIT_MODE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 no modo de edi\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141624885882752129)
,p_name=>'APEX.IG.EDIT_MODE_DESCRIPTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A grade est\00E1 no modo de edi\00E7\00E3o; pare de pressionar para alternar para o modo de exibi\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141738032856752162)
,p_name=>'APEX.IG.EMAIL_BCC'
,p_message_language=>'pt-br'
,p_message_text=>unistr('C\00F3pia Oculta (bcc)')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141738257766752162)
,p_name=>'APEX.IG.EMAIL_BODY'
,p_message_language=>'pt-br'
,p_message_text=>'Mensagem'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141737907347752162)
,p_name=>'APEX.IG.EMAIL_CC'
,p_message_language=>'pt-br'
,p_message_text=>unistr('C\00F3pia (cc)')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141737641145752162)
,p_name=>'APEX.IG.EMAIL_SENT'
,p_message_language=>'pt-br'
,p_message_text=>'E-mail enviado.'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141738174205752162)
,p_name=>'APEX.IG.EMAIL_SUBJECT'
,p_message_language=>'pt-br'
,p_message_text=>'Assunto'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141737843548752162)
,p_name=>'APEX.IG.EMAIL_TO'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Destinat\00E1rio (para)')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141691945553752149)
,p_name=>'APEX.IG.ENABLED'
,p_message_language=>'pt-br'
,p_message_text=>'Ativado'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141685166611752147)
,p_name=>'APEX.IG.EQUALS'
,p_message_language=>'pt-br'
,p_message_text=>'igual a'
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141692084451752149)
,p_name=>'APEX.IG.EXPRESSION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Express\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141737034614752162)
,p_name=>'APEX.IG.FD_TYPE'
,p_message_language=>'pt-br'
,p_message_text=>'Tipo'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141704219813752152)
,p_name=>'APEX.IG.FILE_PREPARED'
,p_message_language=>'pt-br'
,p_message_text=>'Arquivo preparado. Iniciando o download.'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141666557391752141)
,p_name=>'APEX.IG.FILL'
,p_message_language=>'pt-br'
,p_message_text=>'Preencher'
,p_is_js_message=>true
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141668725595752142)
,p_name=>'APEX.IG.FILL_LABEL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Sele\00E7\00E3o de preenchimento com')
,p_is_js_message=>true
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141668682262752142)
,p_name=>'APEX.IG.FILL_TITLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Sele\00E7\00E3o de Preenchimento')
,p_is_js_message=>true
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141658323256752139)
,p_name=>'APEX.IG.FILTER'
,p_message_language=>'pt-br'
,p_message_text=>'Filtro'
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141691366618752148)
,p_name=>'APEX.IG.FILTERS'
,p_message_language=>'pt-br'
,p_message_text=>'Filtros'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141745059395752164)
,p_name=>'APEX.IG.FILTER_WITH_DOTS'
,p_message_language=>'pt-br'
,p_message_text=>'Filtrar...'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141731074576752160)
,p_name=>'APEX.IG.FIRST'
,p_message_language=>'pt-br'
,p_message_text=>'Primeiro'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141658521557752139)
,p_name=>'APEX.IG.FLASHBACK'
,p_message_language=>'pt-br'
,p_message_text=>'Flashback'
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141689803446752148)
,p_name=>'APEX.IG.FORMAT'
,p_message_language=>'pt-br'
,p_message_text=>'Formato'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141735625947752162)
,p_name=>'APEX.IG.FORMATMASK'
,p_message_language=>'pt-br'
,p_message_text=>unistr('M\00E1scara de Formato')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141737318600752162)
,p_name=>'APEX.IG.FORMAT_CSV'
,p_message_language=>'pt-br'
,p_message_text=>'CSV'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141737238701752162)
,p_name=>'APEX.IG.FORMAT_HTML'
,p_message_language=>'pt-br'
,p_message_text=>'HTML'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141648350254752136)
,p_name=>'APEX.IG.FORMAT_PDF'
,p_message_language=>'pt-br'
,p_message_text=>'PDF'
,p_is_js_message=>true
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141582264346752116)
,p_name=>'APEX.IG.FORMAT_XLSX'
,p_message_language=>'pt-br'
,p_message_text=>'Excel'
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141694465206752149)
,p_name=>'APEX.IG.FREEZE'
,p_message_language=>'pt-br'
,p_message_text=>'Congelar'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141692151787752149)
,p_name=>'APEX.IG.FUNCTIONS_AND_OPERATORS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Fun\00E7\00F5es e Operadores')
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141729240115752160)
,p_name=>'APEX.IG.FUNNEL'
,p_message_language=>'pt-br'
,p_message_text=>'Funil'
,p_is_js_message=>true
,p_version_scn=>2705376
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141710964938752154)
,p_name=>'APEX.IG.GO'
,p_message_language=>'pt-br'
,p_message_text=>'Ir'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141685704780752147)
,p_name=>'APEX.IG.GREATER_THAN'
,p_message_language=>'pt-br'
,p_message_text=>'maior que'
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141685811781752147)
,p_name=>'APEX.IG.GREATER_THAN_OR_EQUALS'
,p_message_language=>'pt-br'
,p_message_text=>'Maior ou igual a'
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141692418771752149)
,p_name=>'APEX.IG.GRID'
,p_message_language=>'pt-br'
,p_message_text=>'Grade'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141657514675752139)
,p_name=>'APEX.IG.GRID_VIEW'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Exibi\00E7\00E3o em Grade')
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141731879570752160)
,p_name=>'APEX.IG.GROUP'
,p_message_language=>'pt-br'
,p_message_text=>'Agrupar'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141692685659752149)
,p_name=>'APEX.IG.GROUP_BY'
,p_message_language=>'pt-br'
,p_message_text=>'Agrupar por'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141657864895752139)
,p_name=>'APEX.IG.GROUP_BY_VIEW'
,p_message_language=>'pt-br'
,p_message_text=>'View Agrupar Por'
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141736215868752162)
,p_name=>'APEX.IG.HD_TYPE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Tipo de Condi\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141735179756752161)
,p_name=>'APEX.IG.HEADING'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Cabe\00E7alho')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141735318874752161)
,p_name=>'APEX.IG.HEADING_ALIGN'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Alinhamento do Cabe\00E7alho')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141744958054752164)
,p_name=>'APEX.IG.HELP'
,p_message_language=>'pt-br'
,p_message_text=>'Ajuda'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141740448886752163)
,p_name=>'APEX.IG.HELP.ACTIONS.EDITING'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Voc\00EA pode inserir, atualizar e excluir dados diretamente dentro desta grade interativa.</p>'),
'',
unistr('<p>Insira uma nova linha clicando no bot\00E3o Adicionar Linha.</p>'),
'',
unistr('<p>Edite dados existentes clicando duas vezes em uma c\00E9lula espec\00EDfica. Para um trabalho de edi\00E7\00E3o de maior porte, clique em Editar para entrar no modo de edi\00E7\00E3o. No modo de edi\00E7\00E3o, voc\00EA pode clicar uma vez ou usar o teclado para editar c\00E9lulas espec')
||unistr('\00EDficas.</p>'),
'',
unistr('<p>Use o menu Alterar para duplicar e excluir linhas. Para ativar o menu Alterar, use as caixas de sele\00E7\00E3o para selecionar uma ou mais linhas.</p>'),
'',
'<p>Duplique uma linha selecionada clicando no menu Alterar e selecionando Duplicar Linhas. Exclua uma linha selecionada clicando no menu Alterar e selecionando Excluir Linha.</p>'))
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141742535446752164)
,p_name=>'APEX.IG.HELP.ACTIONS.EDITING_HEADING'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Recursos de Edi\00E7\00E3o')
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141742676222752164)
,p_name=>'APEX.IG.HELP.ACTIONS.INTRO'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Uma grade interativa apresenta um conjunto de dados em um relat\00F3rio personaliz\00E1vel que pode ser pesquisado. Voc\00EA pode executar v\00E1rias opera\00E7\00F5es para limitar os registros retornados, e alterar a forma de exibi\00E7\00E3o dos dados.</p>'),
'',
unistr('<p>Use o campo Pesquisar para filtrar os registros retornados. Clique em A\00E7\00F5es para acessar v\00E1rias op\00E7\00F5es de modifica\00E7\00E3o do layout do relat\00F3rio, ou use os menus Cabe\00E7alho de Coluna nas colunas exibidas.</p>'),
'',
unistr('<p>Use Defini\00E7\00F5es de Relat\00F3rio para salvar suas personaliza\00E7\00F5es em um relat\00F3rio. Voc\00EA tamb\00E9m pode fazer download dos dados do relat\00F3rio para um arquivo externo ou enviar os dados por e-mail para voc\00EA mesmo ou outras pessoas.</p>'),
'',
'<p>Para saber mais, consulte "Using Interactive Grids" no <em>Oracle APEX End User''s Guide</em>.'))
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141742343345752164)
,p_name=>'APEX.IG.HELP.ACTIONS.INTRO_HEADING'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Vis\00E3o Geral')
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141740348373752163)
,p_name=>'APEX.IG.HELP.ACTIONS.REPORTING'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Voc\00EA pode personalizar a grade interativa para exibir dados de v\00E1rias formas diferentes, usando os recursos incorporados.</p>'),
'',
unistr('<p>Use os menus de Cabe\00E7alho de Coluna ou o menu A\00E7\00F5es para determinar quais colunas ser\00E3o exibidas, em que sequ\00EAncia e as que ser\00E3o congeladas. Voc\00EA tamb\00E9m pode definir v\00E1rios filtros de dados e classificar os dados retornados.</p>'),
'',
unistr('<p>Use o bot\00E3o Exibir (adjacente ao campo Pesquisar) para acessar outras views de dados que podem ter sido definidas pelo desenvolvedor do aplicativo. Voc\00EA tamb\00E9m pode criar um gr\00E1fico ou ver um existente.</p>  '),
'',
unistr('<p><em>Observa\00E7\00E3o: Clique em <strong>Ajuda</strong> nas caixas de di\00E1logo da grade interativa para obter mais informa\00E7\00F5es detalhadas sobre a fun\00E7\00E3o selecionada.</em></p>')))
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141742407541752164)
,p_name=>'APEX.IG.HELP.ACTIONS.REPORTING_HEADING'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Recursos de Gera\00E7\00E3o de Relat\00F3rios')
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141693435681752149)
,p_name=>'APEX.IG.HELP.ACTIONS_TITLE'
,p_message_language=>'pt-br'
,p_message_text=>'Ajuda da Grade Interativa'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141739262966752163)
,p_name=>'APEX.IG.HELP.AGGREGATE'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Use essa caixa de di\00E1logo para agregar colunas. Os valores agregados aparecem na parte inferior dos dados, ou ent\00E3o, caso as Quebras de Controle estejam definidas, na parte de baixo de cada quebra.</p>'),
'',
unistr('<p><strong>Lista de Agrega\00E7\00E3o</strong><br>'),
unistr('A lista de Agrega\00E7\00E3o exibe as agrega\00E7\00F5es definidas. Desative uma agrega\00E7\00E3o existente desmarcando-a.<br>'),
unistr('Clique em Adicionar ( &plus; ) para criar uma nova agrega\00E7\00E3o, ou em Excluir ( &minus; ) para remover uma agrega\00E7\00E3o existente.</p>'),
'',
unistr('<p><strong>Defini\00E7\00F5es de Agrega\00E7\00E3o</strong><br>'),
unistr('Use o form \00E0 direita para definir a agrega\00E7\00E3o.<br>'),
unistr('Selecione o nome da Coluna e o tipo de Agrega\00E7\00E3o.<br>'),
unistr('Opcionalmente, digite uma dica de ferramenta para a agrega\00E7\00E3o.<br>'),
unistr('Caso voc\00EA tenha definido uma Interrup\00E7\00E3o de Controle, a sele\00E7\00E3o de <strong>Mostrar Valor Geral</strong> exibir\00E1 o valor m\00E9dio, total ou similar geral, na parte de baixo dos dados.</p>'),
'',
unistr('<p><em>Observa\00E7\00E3o: Acesse a caixa de di\00E1logo Agrega\00E7\00E3o no menu A\00E7\00F5es ou clicando no cabe\00E7alho e na soma da coluna ( &sum; ).</em></p>')))
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141741455449752163)
,p_name=>'APEX.IG.HELP.AGGREGATE_TITLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Ajuda de Agrega\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141739940525752163)
,p_name=>'APEX.IG.HELP.CHART'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Use essa caixa de di\00E1logo para definir um gr\00E1fico exibido como uma view de dados separada.<br>'),
unistr('Selecione um Tipo de gr\00E1fico e os atributos do gr\00E1fico.</p>'),
unistr('<p><strong>Atributos do Gr\00E1fico</strong><br>'),
unistr('Os atributos de gr\00E1fico dispon\00EDveis variam, dependendo do tipo de gr\00E1fico.</p>'),
'<p>',
'<ul>',
unistr('  <li>Selecione a coluna que cont\00E9m o valor para o atributo:'),
'    <ul>',
'      <li>Label - O texto para cada ponto de dados.</li>',
'      <li>Valor - Os dados a serem plotados.</li>',
unistr('      <li>S\00E9rie - Para definir sua consulta din\00E2mica multiss\00E9rie.</li>'),
unistr('      <li>Abertura - O pre\00E7o das a\00E7\00F5es na abertura do dia (Apenas a\00E7\00F5es).</li>'),
unistr('      <li>Fechamento - O pre\00E7o das a\00E7\00F5es no fechamento do dia (Apenas a\00E7\00F5es).</li>'),
unistr('      <li>Alta - O valor na alta (Apenas Intervalos e A\00E7\00F5es).</li>'),
unistr('      <li>Baixa - O valor na baixa (Apenas Intervalos e A\00E7\00F5es).</li>'),
unistr('      <li>Volume - O volume de a\00E7\00F5es di\00E1rio (Apenas a\00E7\00F5es).</li>'),
'      <li>Destino - O valor de destino (Apenas funil).</li>',
unistr('      <li>X - O valor do eixo x (Apenas Bolhas e Dispers\00E3o).</li>'),
unistr('      <li>Y - O valor do eixo y (Apenas Bolhas e Dispers\00E3o).'),
'      <li>Z - A largura da barra ou o raio da bolha (Apenas Barras, Bolhas e Intervalo).</li>',
'    </ul>',
'  </li>',
unistr('  <li>Orienta\00E7\00E3o - Vertical ou Horizontal.</li>'),
unistr('  <li>Agrega\00E7\00E3o - Selecione como agregar os valores do gr\00E1fico.</li>'),
unistr('  <li>Pilha - Especifique se os itens de dados s\00E3o empilhados.</li>'),
'  <li>Classificar por - Classificar pelo label ou pelo(s) valor(es).',
'    <ul>',
unistr('      <li>Dire\00E7\00E3o - Classificar em valores crescentes ou decrescentes.</li>'),
unistr('      <li>Nulos - Especifique como classificar registros com valores nulos em rela\00E7\00E3o a registros com valores n\00E3o nulos.</li>'),
'    </ul>',
'  </li>',
'  <li>Casas Decimais</li>',
unistr('  <li>T\00EDtulo do Eixo do Label</li>'),
unistr('  <li>T\00EDtulo do Eixo de Valores</li>'),
'</ul>',
'</p>'))
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141741830823752163)
,p_name=>'APEX.IG.HELP.CHART_TITLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Ajuda de Gr\00E1ficos')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141738936068752163)
,p_name=>'APEX.IG.HELP.COLUMNS'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Use essa caixa de di\00E1logo para escolher quais colunas aparecer\00E3o e em que ordem.</p>'),
'',
unistr('<p>Oculte uma coluna cancelando sua sele\00E7\00E3o.<br>'),
'Reordene colunas clicando em Mover para Cima ( &uarr; ) ou Mover para Baixo ( &darr; ).<br>',
unistr('Use o seletor drop down para listar Todas as colunas, Colunas exibidas ou Colunas n\00E3o exibidas.</p>'),
'',
unistr('<p>Opcionalmente, use o form para especificar a largura m\00EDnima de uma coluna em pixels.</p>'),
'',
unistr('<p><em>Observa\00E7\00E3o: Voc\00EA tamb\00E9m pode reordenar colunas exibidas, clicando na al\00E7a de arrastar (no in\00EDcio do t\00EDtulo da coluna) e arrastando a coluna para a esquerda ou para a direita. Tamb\00E9m \00E9 poss\00EDvel alterar a largura de colunas exibidas, selecionand')
||unistr('o o separador de coluna, entre os t\00EDtulos, e movendo-o para a esquerda ou para a direita.</em></p>')))
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141741711946752163)
,p_name=>'APEX.IG.HELP.COLUMNS_TITLE'
,p_message_language=>'pt-br'
,p_message_text=>'Ajuda de Colunas'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141739331401752163)
,p_name=>'APEX.IG.HELP.COMPUTE'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Use essa caixa de di\00E1logo para definir colunas adicionais com base em c\00E1lculos matem\00E1ticos e funcionais executados com colunas existentes.</p>'),
'',
unistr('<p><strong>Lista de C\00E1lculos</strong><br>'),
unistr('A lista de C\00E1lculos exibe c\00E1lculos definidos. Desative um c\00E1lculo existente desmarcando-o.<br>'),
unistr('Clique em Adicionar ( &plus; ) para adicionar um novo c\00E1lculo ou em Excluir ( &minus; ) para remover um c\00E1lculo existente.</p>'),
'',
unistr('<p><strong>Defini\00E7\00F5es de C\00E1lculo</strong><br>'),
unistr('Use o form para definir o c\00E1lculo.<br>'),
unistr('Informe os detalhes da coluna, como cabe\00E7alho e label, e selecione as defini\00E7\00F5es de alinhamento.<br> '),
unistr('Use a \00E1rea de texto Express\00E3o para inserir a(s) coluna(s) e fun\00E7\00F5es associadas para o c\00E1lculo.<br>'),
unistr('Selecione o tipo de dados apropriado e, opcionalmente, uma m\00E1scara de formato, para a nova coluna.</p>')))
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141741339882752163)
,p_name=>'APEX.IG.HELP.COMPUTE_TITLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Ajuda de C\00E1lculo')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141739604282752163)
,p_name=>'APEX.IG.HELP.CONTROL_BREAK'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Use esta caixa de di\00E1logo para definir uma quebra de controle em uma ou mais colunas.</p>'),
'',
'<p><strong>Lista de Quebras de Controle</strong><br>',
'A lista de Quebras de Controle exibe as quebras de controle definidas. Desative uma coluna de quebra de controle existente desmarcando-a.<br>',
'Clique em Adicionar ( &plus; ) para incluir uma nova coluna na quebra de controle ou em Excluir ( &minus; ) para remover uma coluna existente da quebra de controle.<br>',
unistr('Para reordenar colunas, clique em Mover para Cima ( &uarr; ) ou Mover para Baixo ( &darr; ) para mover a coluna selecionada para cima e para baixo em rela\00E7\00E3o \00E0s outras colunas.</p>'),
'',
unistr('<p><strong>Defini\00E7\00F5es da Quebra de Controle</strong><br>'),
'Use o form para definir a coluna de quebra de controle.<br>',
unistr('Selecione uma coluna de quebra de controle, a dire\00E7\00E3o de classifica\00E7\00E3o e como ordenar colunas nulas (colunas sem valor).</p>'),
'',
unistr('<p><em>Observa\00E7\00E3o: Ao visualizar a grade interativa, voc\00EA pode definir uma quebra de controle clicando em um Cabe\00E7alho de Coluna e selecionando o \00EDcone de quebra de controle.</em></p>')))
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141741093737752163)
,p_name=>'APEX.IG.HELP.CONTROL_BREAK_TITLE'
,p_message_language=>'pt-br'
,p_message_text=>'Ajuda de Quebra de Controle'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141739816004752163)
,p_name=>'APEX.IG.HELP.DOWNLOAD'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Use essa caixa de di\00E1logo para fazer download de todas as linhas atuais para um arquivo externo. O arquivo s\00F3 conter\00E1 as colunas exibidas no momento, usando quaisquer filtros e classifica\00E7\00F5es aplicados aos dados.</p>'),
'',
'<p>Selecione o formato do arquivo e clique em Fazer Download.<br>',
unistr('Observa\00E7\00E3o: O arquivo CSV n\00E3o inclui formata\00E7\00E3o de texto como agregados e quebras de controle.</p>'),
'',
unistr('<p>Para enviar o arquivo por e-mail, selecione Enviar como E-mail e digite os detalhes do e-mail (Destinat\00E1rio, Assunto e Mensagem).</p>')))
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141740802304752163)
,p_name=>'APEX.IG.HELP.DOWNLOAD_TITLE'
,p_message_language=>'pt-br'
,p_message_text=>'Ajuda de Download'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141739040913752163)
,p_name=>'APEX.IG.HELP.FILTER'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Use essa caixa de di\00E1logo para configurar filtros de dados que limitem as linhas retornadas.</p>'),
'',
'<p><strong>Lista de Filtros</strong><br>',
'A lista de Filtros exibe os filtros definidos. Desative um filtro existente desmarcando-o.<br>',
'Clique em Adicionar ( &plus; ) para criar um novo filtro, ou em Excluir ( &minus; ) para remover um filtro existente.</p>',
'',
unistr('<p><strong>Defini\00E7\00F5es de Filtro</strong><br>'),
'Use o form para definir as propriedades do filtro.<br>',
'Selecione o tipo de filtro apropriado:<br>',
unistr('&nbsp;&nbsp;&nbsp;Linha - filtra um termo em qualquer coluna filtr\00E1vel.<br>'),
'&nbsp;&nbsp;&nbsp;Coluna - filtra uma determinada coluna com um operador e valor especificados.<br>',
'',
unistr('<p><em>Observa\00E7\00E3o: ao exibir a grade interativa, voc\00EA pode definir filtros de linha digitando diretamente no campo Pesquisar. Clique em Selecionar Colunas a Serem Pesquisadas para limitar a pesquisa a uma coluna espec\00EDfica. Como alternativa, abra um ')
||unistr('menu Cabe\00E7alho da Coluna e selecione um valor para criar um filtro de coluna.</em></p>')))
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141741622892752163)
,p_name=>'APEX.IG.HELP.FILTER_TITLE'
,p_message_language=>'pt-br'
,p_message_text=>'Ajuda de Filtros'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141739400610752163)
,p_name=>'APEX.IG.HELP.FLASHBACK'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Use essa caixa de di\00E1logo para ver os dados conforme existiam em um momento passado.</p>'),
unistr('<p>Insira o n\00FAmero de minutos no passado para executar a consulta de flashback.</p>')))
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141741237827752163)
,p_name=>'APEX.IG.HELP.FLASHBACK_TITLE'
,p_message_language=>'pt-br'
,p_message_text=>'Ajuda de Flashback'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141741910975752163)
,p_name=>'APEX.IG.HELP.GROUP_BY_TITLE'
,p_message_language=>'pt-br'
,p_message_text=>'Ajuda de Grupamento por'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141739513418752163)
,p_name=>'APEX.IG.HELP.HIGHLIGHT'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Use essa caixa de di\00E1logo para destacar linhas ou colunas de dados com base na condi\00E7\00E3o informada.</p>'),
'',
'<p><strong>Lista de Destaque</strong><br>',
'A lista de Destaque exibe destaques definidos. Desative um destaque existente desmarcando-o.<br>',
'Clique em Adicionar ( &plus; ) para criar um novo destaque ou em Excluir ( &minus; ) para remover um destaque existente.</p>',
'',
unistr('<p><strong>Defini\00E7\00F5es de Destaque</strong><br>'),
'Use o form para definir as propriedades de destaque.<br>',
unistr('Informe o nome, selecione Linha ou Coluna e selecione os c\00F3digos de cor HTML para o plano de fundo e o texto.<br>'),
unistr('Selecione o <strong>Tipo de Condi\00E7\00E3o</strong> apropriado para destacar dados espec\00EDficos:<br>'),
'&nbsp;&nbsp;&nbsp;Linha - destaca o termo em qualquer coluna.<br>',
unistr('&nbsp;&nbsp;&nbsp;Coluna - destaca dentro de uma coluna espec\00EDfica com base no operador e valor especificados.<br>')))
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141741179722752163)
,p_name=>'APEX.IG.HELP.HIGHLIGHT_TITLE'
,p_message_language=>'pt-br'
,p_message_text=>'Ajuda de Destaque'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141739771512752163)
,p_name=>'APEX.IG.HELP.REPORT'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Use essa caixa de di\00E1logo para salvar altera\00E7\00F5es feitas no layout e na configura\00E7\00E3o da grade atual.<br>'),
unistr('Os desenvolvedores de aplicativos podem definir v\00E1rios layouts de relat\00F3rio alternativos. Onde for permitido, voc\00EA e outros usu\00E1rios finais podem salvar um relat\00F3rio como P\00FAblico, o que o disponibiliza para todos os outros usu\00E1rios da grade. Voc\00EA tam')
||unistr('b\00E9m pode salvar um relat\00F3rio como Privado, o qual somente voc\00EA possa ver.</p>'),
unistr('<p>Selecione entre os tipos dispon\00EDveis e digite um nome para o relat\00F3rio salvo.</p>')))
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141740930450752163)
,p_name=>'APEX.IG.HELP.REPORT_TITLE'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Ajuda de Relat\00F3rio'),
''))
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141739173547752163)
,p_name=>'APEX.IG.HELP.SORT'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Use essa caixa de di\00E1logo para definir a ordem de exibi\00E7\00E3o.</p>'),
'',
unistr('<p><strong>Lista de Classifica\00E7\00E3o</strong><br>'),
unistr('A caixa de di\00E1logo Classificar exibe uma lista de regras de classifica\00E7\00E3o configuradas.<br>'),
unistr('Clique em Adicionar ( &plus; ) para criar uma coluna de classifica\00E7\00E3o ou em Excluir ( &minus; ) para remover uma coluna de classifica\00E7\00E3o.<br>'),
unistr('Clique em Mover para Cima ( &uarr; ) e Mover para Baixo ( &darr; ) para mover a coluna de classifica\00E7\00E3o selecionada para cima e para baixo em rela\00E7\00E3o \00E0s outras colunas de classifica\00E7\00E3o.</p>'),
'',
unistr('<p><strong>Defini\00E7\00F5es de Classifica\00E7\00E3o</strong><br>'),
unistr('Selecione uma coluna de classifica\00E7\00E3o, a dire\00E7\00E3o de classifica\00E7\00E3o e como ordenar as colunas nulas (colunas sem valor).</p>'),
'',
unistr('<p><em>Observa\00E7\00E3o: Os dados podem ser classificados por colunas que n\00E3o s\00E3o exibidas; todavia, nem todas as colunas podem ser classific\00E1veis.</em><br>'),
unistr('<em>As colunas exibidas podem ser classificadas pressionando as setas para cima (crescente) ou para baixo (decrescente) no final dos cabe\00E7alhos de coluna. Para adicionar uma coluna subsequente a uma classifica\00E7\00E3o existente, mantenha a tecla Shift pre')
||'ssionada e clique na seta para cima ou para baixo.</em></p>'))
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141741574902752163)
,p_name=>'APEX.IG.HELP.SORT_TITLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Ajuda de Classifica\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141740781176752163)
,p_name=>'APEX.IG.HELP.SUBSCRIPTION_TITLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Ajuda de Inscri\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141694394037752149)
,p_name=>'APEX.IG.HIDE'
,p_message_language=>'pt-br'
,p_message_text=>'Ocultar'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141658749063752139)
,p_name=>'APEX.IG.HIGHLIGHT'
,p_message_language=>'pt-br'
,p_message_text=>'Destacar'
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141727940196752159)
,p_name=>'APEX.IG.HIGH_COLUMN'
,p_message_language=>'pt-br'
,p_message_text=>'Alta'
,p_is_js_message=>true
,p_version_scn=>2705376
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141728744890752160)
,p_name=>'APEX.IG.HORIZONTAL'
,p_message_language=>'pt-br'
,p_message_text=>'Horizontal'
,p_is_js_message=>true
,p_version_scn=>2705376
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141687369542752147)
,p_name=>'APEX.IG.HOURS'
,p_message_language=>'pt-br'
,p_message_text=>'horas'
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141692322229752149)
,p_name=>'APEX.IG.ICON'
,p_message_language=>'pt-br'
,p_message_text=>unistr('\00CDcone')
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141657610291752139)
,p_name=>'APEX.IG.ICON_VIEW'
,p_message_language=>'pt-br'
,p_message_text=>unistr('View do \00CDcone')
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141685531767752147)
,p_name=>'APEX.IG.IN'
,p_message_language=>'pt-br'
,p_message_text=>'em'
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141693935900752149)
,p_name=>'APEX.IG.INACTIVE_SETTING'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Defini\00E7\00E3o Inativa')
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141694081253752149)
,p_name=>'APEX.IG.INACTIVE_SETTINGS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Defini\00E7\00F5es Inativas')
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141701630641752152)
,p_name=>'APEX.IG.INTERNAL_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro interno durante o processamento da solicita\00E7\00E3o da Grade Interativa.')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141589596840752118)
,p_name=>'APEX.IG.INVALID_COLUMN_FILTER_TYPE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o h\00E1 suporte para o Tipo de Filtro de Coluna "%0" na coluna "%1".')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141740567055752163)
,p_name=>'APEX.IG.INVALID_DATE_FORMAT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Formato de Data Inv\00E1lido')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141715342793752156)
,p_name=>'APEX.IG.INVALID_FILTER_COLUMN'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A Grade Interativa n\00E3o suporta a defini\00E7\00E3o de um filtro na coluna %0.')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141715281846752156)
,p_name=>'APEX.IG.INVALID_FILTER_OPERATOR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 n\00E3o \00E9 um tipo de filtro v\00E1lido para definir um filtro de Grade Interativa.')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141596182121752120)
,p_name=>'APEX.IG.INVALID_NUMBER_FORMAT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Formato de N\00FAmero Inv\00E1lido')
,p_is_js_message=>true
,p_version_scn=>2705351
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141743265324752164)
,p_name=>'APEX.IG.INVALID_SETTING'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Defini\00E7\00E3o Inv\00E1lida')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141743398243752164)
,p_name=>'APEX.IG.INVALID_SETTINGS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Defini\00E7\00F5es Inv\00E1lidas')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141734423722752161)
,p_name=>'APEX.IG.INVALID_SORT_BY'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A op\00E7\00E3o Classificar por foi definida como %0, mas nenhuma coluna foi selecionada para %0.')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141731710497752160)
,p_name=>'APEX.IG.INVALID_VALUE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Valor Inv\00E1lido')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141726852509752159)
,p_name=>'APEX.IG.INVISIBLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o Exibido')
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141686371378752147)
,p_name=>'APEX.IG.IN_THE_LAST'
,p_message_language=>'pt-br'
,p_message_text=>unistr('no/a(s) \00FAltimo/a(s)')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141686586222752147)
,p_name=>'APEX.IG.IN_THE_NEXT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('no(s) pr\00F3ximo(s)')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141685418925752147)
,p_name=>'APEX.IG.IS_NOT_NULL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('n\00E3o est\00E1 vazio')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141685307664752147)
,p_name=>'APEX.IG.IS_NULL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('est\00E1 vazio')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141735296712752161)
,p_name=>'APEX.IG.LABEL'
,p_message_language=>'pt-br'
,p_message_text=>'Label'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141727285921752159)
,p_name=>'APEX.IG.LABEL_COLUMN'
,p_message_language=>'pt-br'
,p_message_text=>'Label'
,p_is_js_message=>true
,p_version_scn=>2705376
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141731128732752160)
,p_name=>'APEX.IG.LAST'
,p_message_language=>'pt-br'
,p_message_text=>unistr('\00DAltimo(a)')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141675606154752144)
,p_name=>'APEX.IG.LAST.DAY'
,p_message_language=>'pt-br'
,p_message_text=>unistr('\00DAltimo Dia')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141675880699752144)
,p_name=>'APEX.IG.LAST.HOUR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('\00DAltima Hora')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141676313964752144)
,p_name=>'APEX.IG.LAST.MINUTE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('\00DAltimo Minuto')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141675307889752144)
,p_name=>'APEX.IG.LAST.MONTH'
,p_message_language=>'pt-br'
,p_message_text=>unistr('M\00EAs Passado')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141675417664752144)
,p_name=>'APEX.IG.LAST.WEEK'
,p_message_language=>'pt-br'
,p_message_text=>'Semana Passada'
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141675569573752144)
,p_name=>'APEX.IG.LAST.X_DAYS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('\00DAltimos %0 Dias')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141675797937752144)
,p_name=>'APEX.IG.LAST.X_HOURS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('\00DAltimas %0 Horas')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141676476976752144)
,p_name=>'APEX.IG.LAST.X_MINUTES'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 \00DAltimos Minutos')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141676222272752144)
,p_name=>'APEX.IG.LAST.X_MONTHS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 \00DAltimos Meses')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141676185345752144)
,p_name=>'APEX.IG.LAST.X_WEEKS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 \00DAltimas Semanas')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141675109215752144)
,p_name=>'APEX.IG.LAST.X_YEARS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('\00DAltimos %0 Anos')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141675282599752144)
,p_name=>'APEX.IG.LAST.YEAR'
,p_message_language=>'pt-br'
,p_message_text=>'Ano Passado'
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141735498908752162)
,p_name=>'APEX.IG.LAYOUT_ALIGN'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Alinhamento de C\00E9lulas')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141735535598752162)
,p_name=>'APEX.IG.LAYOUT_USEGROUPFOR'
,p_message_language=>'pt-br'
,p_message_text=>'Usar Grupo para'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141685965414752147)
,p_name=>'APEX.IG.LESS_THAN'
,p_message_language=>'pt-br'
,p_message_text=>'menor que'
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141686040723752147)
,p_name=>'APEX.IG.LESS_THAN_OR_EQUALS'
,p_message_language=>'pt-br'
,p_message_text=>'Menor ou igual a'
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141729304932752160)
,p_name=>'APEX.IG.LINE'
,p_message_language=>'pt-br'
,p_message_text=>'Linhas'
,p_is_js_message=>true
,p_version_scn=>2705376
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141729453427752160)
,p_name=>'APEX.IG.LINE_WITH_AREA'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Linha com \00C1rea')
,p_is_js_message=>true
,p_version_scn=>2705376
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141735800897752162)
,p_name=>'APEX.IG.LISTAGG'
,p_message_language=>'pt-br'
,p_message_text=>'Listagg'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141728045598752159)
,p_name=>'APEX.IG.LOW_COLUMN'
,p_message_language=>'pt-br'
,p_message_text=>'Baixa'
,p_is_js_message=>true
,p_version_scn=>2705376
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141738334039752162)
,p_name=>'APEX.IG.MAILADDRESSES_COMMASEP'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Separe v\00E1rios endere\00E7os com v\00EDrgulas')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141687134689752147)
,p_name=>'APEX.IG.MATCHES_REGULAR_EXPRESSION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('corresponde \00E0 express\00E3o regular')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141711522434752154)
,p_name=>'APEX.IG.MAX'
,p_message_language=>'pt-br'
,p_message_text=>unistr('M\00E1ximo')
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141745856483752165)
,p_name=>'APEX.IG.MAX_OVERALL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('M\00E1ximo Geral')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141711710744752154)
,p_name=>'APEX.IG.MEDIAN'
,p_message_language=>'pt-br'
,p_message_text=>'Mediano'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141745981485752165)
,p_name=>'APEX.IG.MEDIAN_OVERALL'
,p_message_language=>'pt-br'
,p_message_text=>'Mediano Geral'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141711494848752154)
,p_name=>'APEX.IG.MIN'
,p_message_language=>'pt-br'
,p_message_text=>unistr('M\00EDnimo')
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141687262984752147)
,p_name=>'APEX.IG.MINUTES'
,p_message_language=>'pt-br'
,p_message_text=>'minutos'
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141712284249752155)
,p_name=>'APEX.IG.MINUTES_AGO'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Minutos atr\00E1s')
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141745744761752165)
,p_name=>'APEX.IG.MIN_OVERALL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('M\00EDnimo Geral')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141687661777752147)
,p_name=>'APEX.IG.MONTHS'
,p_message_language=>'pt-br'
,p_message_text=>'meses'
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141694227197752149)
,p_name=>'APEX.IG.MORE_DATA_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Os dados cont\00EAm mais de %0 linhas, o que ultrapassa o m\00E1ximo permitido. Aplique filtros adicionais para ver os resultados.')
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141720001080752157)
,p_name=>'APEX.IG.MULTIIG_PAGE_REGION_STATIC_ID_REQUIRED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O ID Est\00E1tico da Regi\00E3o deve ser especificado porque a p\00E1gina cont\00E9m diversas Grades Interativas.')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141690390320752148)
,p_name=>'APEX.IG.NAME'
,p_message_language=>'pt-br'
,p_message_text=>'Nome'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141690598843752148)
,p_name=>'APEX.IG.NAMED_REPORT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Relat\00F3rio Nomeado')
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141674578163752144)
,p_name=>'APEX.IG.NEXT.DAY'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Pr\00F3ximo Dia')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141674347771752144)
,p_name=>'APEX.IG.NEXT.HOUR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Pr\00F3xima Hora')
,p_is_js_message=>true
,p_version_scn=>2705370
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141676567435752144)
,p_name=>'APEX.IG.NEXT.MINUTE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Pr\00F3ximo Minuto')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141674818771752144)
,p_name=>'APEX.IG.NEXT.MONTH'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Pr\00F3ximo M\00EAs')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141674797174752144)
,p_name=>'APEX.IG.NEXT.WEEK'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Pr\00F3xima Semana')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141674608275752144)
,p_name=>'APEX.IG.NEXT.X_DAYS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Pr\00F3ximos %0 Dias')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141674408370752144)
,p_name=>'APEX.IG.NEXT.X_HOURS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Pr\00F3ximas %0 Horas')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141676672928752144)
,p_name=>'APEX.IG.NEXT.X_MINUTES'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 Pr\00F3ximos Minutos')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141675942176752144)
,p_name=>'APEX.IG.NEXT.X_MONTHS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 Pr\00F3ximos Meses')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141676032056752144)
,p_name=>'APEX.IG.NEXT.X_WEEKS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 Pr\00F3ximas Semanas')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141675033416752144)
,p_name=>'APEX.IG.NEXT.X_YEARS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Pr\00F3ximos %0 Anos')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141674950955752144)
,p_name=>'APEX.IG.NEXT.YEAR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Pr\00F3ximo Ano')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141686297205752147)
,p_name=>'APEX.IG.NOT_BETWEEN'
,p_message_language=>'pt-br'
,p_message_text=>unistr('n\00E3o est\00E1 entre')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141685232023752147)
,p_name=>'APEX.IG.NOT_EQUALS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('n\00E3o igual a')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141750032603752166)
,p_name=>'APEX.IG.NOT_EXIST'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A regi\00E3o com o ID %0 n\00E3o \00E9 uma regi\00E3o de Grade Interativa ou n\00E3o existe no aplicativo %1.')
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141685658760752147)
,p_name=>'APEX.IG.NOT_IN'
,p_message_language=>'pt-br'
,p_message_text=>unistr('n\00E3o contido em')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141686434961752147)
,p_name=>'APEX.IG.NOT_IN_THE_LAST'
,p_message_language=>'pt-br'
,p_message_text=>unistr('n\00E3o est\00E1 no/a(s) \00FAltimo/a(s)')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141686658551752147)
,p_name=>'APEX.IG.NOT_IN_THE_NEXT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('n\00E3o est\00E1 no(s) pr\00F3ximo(s)')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141694198696752149)
,p_name=>'APEX.IG.NO_DATA_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>'Nenhum dado encontrado'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141730981055752160)
,p_name=>'APEX.IG.NULLS'
,p_message_language=>'pt-br'
,p_message_text=>'Nulos'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141736092418752162)
,p_name=>'APEX.IG.NUMBER'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Num\00E9rico')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141731240162752160)
,p_name=>'APEX.IG.OFF'
,p_message_language=>'pt-br'
,p_message_text=>'Desativado'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141731312056752160)
,p_name=>'APEX.IG.ON'
,p_message_language=>'pt-br'
,p_message_text=>'Ativado'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141684495853752146)
,p_name=>'APEX.IG.ONE_MINUTE_AGO'
,p_message_language=>'pt-br'
,p_message_text=>unistr('H\00E1 1 minuto')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141738888862752163)
,p_name=>'APEX.IG.OPEN_COLORPICKER'
,p_message_language=>'pt-br'
,p_message_text=>'Abrir Seletor de Cores: %0'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141727711805752159)
,p_name=>'APEX.IG.OPEN_COLUMN'
,p_message_language=>'pt-br'
,p_message_text=>'Abertura'
,p_is_js_message=>true
,p_version_scn=>2705376
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141691433257752149)
,p_name=>'APEX.IG.OPERATOR'
,p_message_language=>'pt-br'
,p_message_text=>'Operador'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141727194683752159)
,p_name=>'APEX.IG.ORIENTATION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Orienta\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141729577170752160)
,p_name=>'APEX.IG.PIE'
,p_message_language=>'pt-br'
,p_message_text=>'Pizza'
,p_is_js_message=>true
,p_version_scn=>2705376
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141692752854752149)
,p_name=>'APEX.IG.PIVOT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Tabela Din\00E2mica')
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141657933654752139)
,p_name=>'APEX.IG.PIVOT_VIEW'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Exibi\00E7\00E3o de Tabela Din\00E2mica')
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141738735641752162)
,p_name=>'APEX.IG.PLACEHOLDER_INVALUES'
,p_message_language=>'pt-br'
,p_message_text=>'Separe os valores com por "%0"'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141729613072752160)
,p_name=>'APEX.IG.POLAR'
,p_message_language=>'pt-br'
,p_message_text=>'Polar'
,p_is_js_message=>true
,p_version_scn=>2705376
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141734926346752161)
,p_name=>'APEX.IG.POSITION_CENTER'
,p_message_language=>'pt-br'
,p_message_text=>'Centro'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141735070218752161)
,p_name=>'APEX.IG.POSITION_END'
,p_message_language=>'pt-br'
,p_message_text=>'Fim'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141734896882752161)
,p_name=>'APEX.IG.POSITION_START'
,p_message_language=>'pt-br'
,p_message_text=>unistr('In\00EDcio')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141690629112752148)
,p_name=>'APEX.IG.PRIMARY'
,p_message_language=>'pt-br'
,p_message_text=>'Principal'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141690958583752148)
,p_name=>'APEX.IG.PRIMARY_DEFAULT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Padr\00E3o Prim\00E1rio')
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141707492544752153)
,p_name=>'APEX.IG.PRIMARY_REPORT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Relat\00F3rio Prim\00E1rio')
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141581045184752116)
,p_name=>'APEX.IG.PRINT_ACCESSIBLE.PROMPT'
,p_message_language=>'pt-br'
,p_message_text=>'Incluir Tags de Acessibilidade'
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141578455132752115)
,p_name=>'APEX.IG.PRINT_ORIENTATION.LOV.HORIZONTAL.D'
,p_message_language=>'pt-br'
,p_message_text=>'Paisagem'
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141578532670752115)
,p_name=>'APEX.IG.PRINT_ORIENTATION.LOV.VERTICAL.D'
,p_message_language=>'pt-br'
,p_message_text=>'Retrato'
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141578365989752115)
,p_name=>'APEX.IG.PRINT_ORIENTATION.PROMPT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Orienta\00E7\00E3o da p\00E1gina')
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141578248779752115)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.A3.D'
,p_message_language=>'pt-br'
,p_message_text=>'A3'
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141578150022752115)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.A4.D'
,p_message_language=>'pt-br'
,p_message_text=>'A4'
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141581231672752116)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.CUSTOM.D'
,p_message_language=>'pt-br'
,p_message_text=>'Personalizado'
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141577962500752115)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.LEGAL.D'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Of\00EDcio')
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141577872001752115)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.LETTER.D'
,p_message_language=>'pt-br'
,p_message_text=>'Carta'
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141578032483752115)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.TABLOID.D'
,p_message_language=>'pt-br'
,p_message_text=>'Tabloide'
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141577739858752115)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.PROMPT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Tamanho da p\00E1gina')
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141543307065752105)
,p_name=>'APEX.IG.PRINT_STRIP_RICH_TEXT.PROMPT'
,p_message_language=>'pt-br'
,p_message_text=>'Remover RTF (Rich Text Format)'
,p_is_js_message=>true
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141729777623752160)
,p_name=>'APEX.IG.RADAR'
,p_message_language=>'pt-br'
,p_message_text=>'Radar'
,p_is_js_message=>true
,p_version_scn=>2705376
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141729879682752160)
,p_name=>'APEX.IG.RANGE'
,p_message_language=>'pt-br'
,p_message_text=>'Intervalo'
,p_is_js_message=>true
,p_version_scn=>2705376
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141740026223752163)
,p_name=>'APEX.IG.REFRESH'
,p_message_language=>'pt-br'
,p_message_text=>'Atualizar'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141694916053752150)
,p_name=>'APEX.IG.REFRESH_ROW'
,p_message_language=>'pt-br'
,p_message_text=>'Atualizar Linha'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141693763640752149)
,p_name=>'APEX.IG.REFRESH_ROWS'
,p_message_language=>'pt-br'
,p_message_text=>'Atualizar Linhas'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141698930368752151)
,p_name=>'APEX.IG.REGION_NOT_EXIST'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A regi\00E3o da Grade Interativa n\00E3o existe no aplicativo %0, p\00E1gina %1 e regi\00E3o %2.')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141659407524752139)
,p_name=>'APEX.IG.REMOVE_CONTROL'
,p_message_language=>'pt-br'
,p_message_text=>'Remover %0'
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141690088194752148)
,p_name=>'APEX.IG.REPORT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Relat\00F3rio')
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141749298130752166)
,p_name=>'APEX.IG.REPORT.DELETED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Relat\00F3rio exclu\00EDdo')
,p_is_js_message=>true
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141748945344752166)
,p_name=>'APEX.IG.REPORT.SAVED.ALTERNATIVE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Relat\00F3rio alternativo salvo para todos os usu\00E1rios')
,p_is_js_message=>true
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141748891671752166)
,p_name=>'APEX.IG.REPORT.SAVED.DEFAULT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Relat\00F3rio padr\00E3o salvo para todos os usu\00E1rios')
,p_is_js_message=>true
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141749155142752166)
,p_name=>'APEX.IG.REPORT.SAVED.PRIVATE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Relat\00F3rio privado salvo')
,p_is_js_message=>true
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141749009800752166)
,p_name=>'APEX.IG.REPORT.SAVED.PUBLIC'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Relat\00F3rio p\00FAblico salvo para todos os usu\00E1rios')
,p_is_js_message=>true
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141699094466752151)
,p_name=>'APEX.IG.REPORT_ALIAS_DOES_NOT_EXIST'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A Grade Interativa salva com o nome %0 n\00E3o existe.')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141684313356752146)
,p_name=>'APEX.IG.REPORT_DATA_AS_OF.X.MINUTES_AGO'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Dados da grade de %0 minutos atr\00E1s')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141684259181752146)
,p_name=>'APEX.IG.REPORT_DATA_AS_OF_ONE_MINUTE_AGO'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Dados da grade de 1 minuto atr\00E1s')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141619786322752127)
,p_name=>'APEX.IG.REPORT_DOES_NOT_EXIST'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O Relat\00F3rio da Grade Interativa n\00E3o existe.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141742219493752164)
,p_name=>'APEX.IG.REPORT_EDIT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Relat\00F3rio - Editar')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141698887429752151)
,p_name=>'APEX.IG.REPORT_ID_DOES_NOT_EXIST'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A Grade Interativa salva com o ID %0 n\00E3o existe.')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141742178307752163)
,p_name=>'APEX.IG.REPORT_SAVE_AS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Relat\00F3rio - Salvar como')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141659503043752139)
,p_name=>'APEX.IG.REPORT_SETTINGS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Defini\00E7\00F5es da Grade')
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141750185279752166)
,p_name=>'APEX.IG.REPORT_STATIC_ID_DOES_NOT_EXIST'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A Grade Interativa salva com o ID est\00E1tico %0 n\00E3o existe.')
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141745113434752164)
,p_name=>'APEX.IG.REPORT_VIEW'
,p_message_language=>'pt-br'
,p_message_text=>unistr('View de Relat\00F3rio')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141658644184752139)
,p_name=>'APEX.IG.RESET'
,p_message_language=>'pt-br'
,p_message_text=>'Redefinir'
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141695087893752150)
,p_name=>'APEX.IG.REVERT_CHANGES'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Reverter Altera\00E7\00F5es')
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141693838501752149)
,p_name=>'APEX.IG.REVERT_ROWS'
,p_message_language=>'pt-br'
,p_message_text=>'Reverter Linhas'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141691053854752148)
,p_name=>'APEX.IG.ROW'
,p_message_language=>'pt-br'
,p_message_text=>'Linha'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141689909292752148)
,p_name=>'APEX.IG.ROWS_PER_PAGE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Linhas Por P\00E1gina')
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141749707909752166)
,p_name=>'APEX.IG.ROW_ACTIONS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A\00E7\00F5es de Linha')
,p_is_js_message=>true
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141750910800752166)
,p_name=>'APEX.IG.ROW_ACTIONS_FOR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A\00E7\00F5es da linha %0')
,p_is_js_message=>true
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141658973197752139)
,p_name=>'APEX.IG.SAVE'
,p_message_language=>'pt-br'
,p_message_text=>'Salvar'
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141704080470752152)
,p_name=>'APEX.IG.SAVED'
,p_message_language=>'pt-br'
,p_message_text=>'salvo'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141608617593752124)
,p_name=>'APEX.IG.SAVED_REPORT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Relat\00F3rio salvo: %0')
,p_is_js_message=>true
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141657190036752138)
,p_name=>'APEX.IG.SAVED_REPORTS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Relat\00F3rios Salvos')
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141657217362752138)
,p_name=>'APEX.IG.SAVED_REPORT_DEFAULT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Padr\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141630764933752131)
,p_name=>'APEX.IG.SAVED_REPORT_EXISTS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('J\00E1 existe um relat\00F3rio salvo chamado %0. Digite um novo nome.')
,p_version_scn=>2705359
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141657398887752139)
,p_name=>'APEX.IG.SAVED_REPORT_PRIVATE'
,p_message_language=>'pt-br'
,p_message_text=>'Privado'
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141657496860752139)
,p_name=>'APEX.IG.SAVED_REPORT_PUBLIC'
,p_message_language=>'pt-br'
,p_message_text=>unistr('P\00FAblico')
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141744896602752164)
,p_name=>'APEX.IG.SAVE_AS'
,p_message_language=>'pt-br'
,p_message_text=>'Salvar como'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141693114359752149)
,p_name=>'APEX.IG.SAVE_REPORT_SETTINGS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Salvar Defini\00E7\00F5es do Relat\00F3rio')
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141729985377752160)
,p_name=>'APEX.IG.SCATTER'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Dispers\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705376
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141657089523752138)
,p_name=>'APEX.IG.SEARCH'
,p_message_language=>'pt-br'
,p_message_text=>'Pesquisar'
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141737187198752162)
,p_name=>'APEX.IG.SEARCH.ALL_COLUMNS'
,p_message_language=>'pt-br'
,p_message_text=>'Pesquisa: Todas as Colunas de Texto'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141656920399752138)
,p_name=>'APEX.IG.SEARCH.COLUMN'
,p_message_language=>'pt-br'
,p_message_text=>'Pesquisar: %0'
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141736467301752162)
,p_name=>'APEX.IG.SEARCH.ORACLE_TEXT'
,p_message_language=>'pt-br'
,p_message_text=>'Pesquisa: Texto Completo'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141684153699752146)
,p_name=>'APEX.IG.SEARCH_FOR.X'
,p_message_language=>'pt-br'
,p_message_text=>'Procurar ''%0'''
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141726524762752159)
,p_name=>'APEX.IG.SELECT'
,p_message_language=>'pt-br'
,p_message_text=>'- Selecionar -'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141666622765752141)
,p_name=>'APEX.IG.SELECTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Sele\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141719713376752157)
,p_name=>'APEX.IG.SELECT_1_ROW_IN_MASTER'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Selecionar 1 linha na regi\00E3o principal')
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141656894562752138)
,p_name=>'APEX.IG.SELECT_COLUMNS_TO_SEARCH'
,p_message_language=>'pt-br'
,p_message_text=>'Selecionar colunas para pesquisa'
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141749473142752166)
,p_name=>'APEX.IG.SEL_ACTIONS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A\00E7\00F5es de Sele\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141666832384752141)
,p_name=>'APEX.IG.SEL_MODE_CELL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Sele\00E7\00E3o de C\00E9lula')
,p_is_js_message=>true
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141666748254752141)
,p_name=>'APEX.IG.SEL_MODE_ROW'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Sele\00E7\00E3o de Linhas')
,p_is_js_message=>true
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141737748340752162)
,p_name=>'APEX.IG.SEND_AS_EMAIL'
,p_message_language=>'pt-br'
,p_message_text=>'Enviar como E-mail'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141730321937752160)
,p_name=>'APEX.IG.SERIES_COLUMN'
,p_message_language=>'pt-br'
,p_message_text=>unistr('S\00E9rie')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141654572145752138)
,p_name=>'APEX.IG.SHOW'
,p_message_language=>'pt-br'
,p_message_text=>'Mostrar'
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141709740961752154)
,p_name=>'APEX.IG.SHOW_OVERALL_VALUE'
,p_message_language=>'pt-br'
,p_message_text=>'Mostrar Valor Geral'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141694605021752149)
,p_name=>'APEX.IG.SINGLE_ROW_VIEW'
,p_message_language=>'pt-br'
,p_message_text=>'View de Uma Linha'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141692968837752149)
,p_name=>'APEX.IG.SORT'
,p_message_language=>'pt-br'
,p_message_text=>'Classificar'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141730428044752160)
,p_name=>'APEX.IG.SORT_BY'
,p_message_language=>'pt-br'
,p_message_text=>'Classificar por'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141749813259752166)
,p_name=>'APEX.IG.SORT_ONLY_ONE_PER_COLUMN'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Voc\00EA s\00F3 pode definir uma classifica\00E7\00E3o por coluna.')
,p_is_js_message=>true
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141749653126752166)
,p_name=>'APEX.IG.SRV_CHANGE_MENU'
,p_message_language=>'pt-br'
,p_message_text=>'Alterar'
,p_is_js_message=>true
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141731432593752160)
,p_name=>'APEX.IG.STACK'
,p_message_language=>'pt-br'
,p_message_text=>'Pilha'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141686999127752147)
,p_name=>'APEX.IG.STARTS_WITH'
,p_message_language=>'pt-br'
,p_message_text=>unistr('come\00E7a com')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141730023017752160)
,p_name=>'APEX.IG.STOCK'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A\00E7\00F5es')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141649311262752136)
,p_name=>'APEX.IG.STRETCH_COLUMNS'
,p_message_language=>'pt-br'
,p_message_text=>'Estender Largura de Colunas'
,p_is_js_message=>true
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141693305896752149)
,p_name=>'APEX.IG.SUBSCRIPTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Inscri\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141711306543752154)
,p_name=>'APEX.IG.SUM'
,p_message_language=>'pt-br'
,p_message_text=>'Soma'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141751129066752166)
,p_name=>'APEX.IG.SUMMARY'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Grade Interativa. Relat\00F3rio: %0, View: %1.')
,p_is_js_message=>true
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141745262202752164)
,p_name=>'APEX.IG.SUM_OVERALL'
,p_message_language=>'pt-br'
,p_message_text=>'Soma Geral'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141728278142752159)
,p_name=>'APEX.IG.TARGET_COLUMN'
,p_message_language=>'pt-br'
,p_message_text=>'Destino'
,p_is_js_message=>true
,p_version_scn=>2705376
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141734624812752161)
,p_name=>'APEX.IG.TEXT_COLOR'
,p_message_language=>'pt-br'
,p_message_text=>'Cor do Texto'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141659621618752139)
,p_name=>'APEX.IG.TOGGLE'
,p_message_language=>'pt-br'
,p_message_text=>'Alternar'
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141541783021752104)
,p_name=>'APEX.IG.TOOLBAR'
,p_message_language=>'pt-br'
,p_message_text=>'Grade'
,p_is_js_message=>true
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141709619298752154)
,p_name=>'APEX.IG.TOOLTIP'
,p_message_language=>'pt-br'
,p_message_text=>'Dica de Ferramenta'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141690111727752148)
,p_name=>'APEX.IG.TYPE'
,p_message_language=>'pt-br'
,p_message_text=>'Tipo'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141694572942752149)
,p_name=>'APEX.IG.UNFREEZE'
,p_message_language=>'pt-br'
,p_message_text=>'Descongelar'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141691608816752149)
,p_name=>'APEX.IG.UNIT'
,p_message_language=>'pt-br'
,p_message_text=>'Unidade'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141737575682752162)
,p_name=>'APEX.IG.UNSAVED_CHANGES_CONTINUE_CONFIRM'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Existem altera\00E7\00F5es n\00E3o salvas. Deseja continuar?')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141691576854752149)
,p_name=>'APEX.IG.VALUE'
,p_message_language=>'pt-br'
,p_message_text=>'Valor'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141727332693752159)
,p_name=>'APEX.IG.VALUE_COLUMN'
,p_message_language=>'pt-br'
,p_message_text=>'Valor'
,p_is_js_message=>true
,p_version_scn=>2705376
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141732253942752161)
,p_name=>'APEX.IG.VALUE_REQUIRED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('\00C9 obrigat\00F3rio um valor.')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141717447077752156)
,p_name=>'APEX.IG.VALUE_TIMESTAMP_TZ'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Valor (o fuso hor\00E1rio n\00E3o pode ser alterado)')
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141736135168752162)
,p_name=>'APEX.IG.VARCHAR2'
,p_message_language=>'pt-br'
,p_message_text=>'Texto'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141728691485752159)
,p_name=>'APEX.IG.VERTICAL'
,p_message_language=>'pt-br'
,p_message_text=>'Vertical'
,p_is_js_message=>true
,p_version_scn=>2705376
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141689617661752148)
,p_name=>'APEX.IG.VIEW'
,p_message_language=>'pt-br'
,p_message_text=>'Exibir'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141624767131752129)
,p_name=>'APEX.IG.VIEW_MODE_DESCRIPTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Grade em modo de exibi\00E7\00E3o - pressione para editar')
,p_is_js_message=>true
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141726673833752159)
,p_name=>'APEX.IG.VISIBLE'
,p_message_language=>'pt-br'
,p_message_text=>'Exibido'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141728196619752159)
,p_name=>'APEX.IG.VOLUME_COLUMN'
,p_message_language=>'pt-br'
,p_message_text=>'Volume'
,p_is_js_message=>true
,p_version_scn=>2705376
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141687586480752147)
,p_name=>'APEX.IG.WEEKS'
,p_message_language=>'pt-br'
,p_message_text=>'semanas'
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141726714957752159)
,p_name=>'APEX.IG.WIDTH'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Largura M\00EDnima da Coluna (Pixel)')
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141678750398752145)
,p_name=>'APEX.IG.X.BETWEEN.Y.AND.Z'
,p_message_language=>'pt-br'
,p_message_text=>'%0 entre %1 e %2'
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141678446942752145)
,p_name=>'APEX.IG.X.CONTAINS.Y'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 cont\00E9m %1')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141678590409752145)
,p_name=>'APEX.IG.X.DOES_NOT_CONTAIN.Y'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 n\00E3o cont\00E9m %1')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141653912287752138)
,p_name=>'APEX.IG.X.DOES_NOT_START_WITH.Y'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 n\00E3o come\00E7a com %1')
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141677227756752144)
,p_name=>'APEX.IG.X.EQUALS.Y'
,p_message_language=>'pt-br'
,p_message_text=>'%0 igual a %1'
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141677436194752144)
,p_name=>'APEX.IG.X.GREATER_THAN.Y'
,p_message_language=>'pt-br'
,p_message_text=>'%0 maior que %1'
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141677546880752144)
,p_name=>'APEX.IG.X.GREATER_THAN_OR_EQUALS.Y'
,p_message_language=>'pt-br'
,p_message_text=>'%0 maior que ou igual a %1'
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141678248032752145)
,p_name=>'APEX.IG.X.IN.Y'
,p_message_language=>'pt-br'
,p_message_text=>'%0 em %1'
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141679443571752145)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.DAYS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 nos %1 \00FAltimos dias')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141679212958752145)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.HOURS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 nas %1 \00FAltimas horas')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141679022501752145)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.MINUTES'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 nos %1 \00FAltimos minutos')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141679805006752145)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.MONTHS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 nos %1 \00FAltimos meses')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141679679360752145)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.WEEKS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 nas %1 \00FAltimas semanas')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141680064797752145)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.YEARS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 nos %1 \00FAltimos anos')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141679374820752145)
,p_name=>'APEX.IG.X.IN_THE_LAST_DAY'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 no \00FAltimo dia')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141679130962752145)
,p_name=>'APEX.IG.X.IN_THE_LAST_HOUR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 na \00FAltima hora')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141678979929752145)
,p_name=>'APEX.IG.X.IN_THE_LAST_MINUTE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 no \00FAltimo minuto')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141679792160752145)
,p_name=>'APEX.IG.X.IN_THE_LAST_MONTH'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 no \00FAltimo m\00EAs')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141679537000752145)
,p_name=>'APEX.IG.X.IN_THE_LAST_WEEK'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 na \00FAltima semana')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141679994635752145)
,p_name=>'APEX.IG.X.IN_THE_LAST_YEAR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 no \00FAltimo ano')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141681805605752146)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.DAYS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 nos %1 pr\00F3ximos dias')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141681658877752146)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.HOURS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 nas %1 pr\00F3ximas horas')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141681448256752146)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.MINUTES'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 nos %1 pr\00F3ximos minutos')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141682295279752146)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.MONTHS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 nos %1 pr\00F3ximos meses')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141682021591752146)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.WEEKS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 nas %1 pr\00F3ximas semanas')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141682489772752146)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.YEARS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 nos %1 pr\00F3ximos anos')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141681743517752146)
,p_name=>'APEX.IG.X.IN_THE_NEXT_DAY'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 no pr\00F3ximo dia')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141681523472752146)
,p_name=>'APEX.IG.X.IN_THE_NEXT_HOUR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 na pr\00F3xima hora')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141681349788752146)
,p_name=>'APEX.IG.X.IN_THE_NEXT_MINUTE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 no pr\00F3ximo minuto')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141682124741752146)
,p_name=>'APEX.IG.X.IN_THE_NEXT_MONTH'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 no pr\00F3ximo m\00EAs')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141681910316752146)
,p_name=>'APEX.IG.X.IN_THE_NEXT_WEEK'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 na pr\00F3xima semana')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141682306580752146)
,p_name=>'APEX.IG.X.IN_THE_NEXT_YEAR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 no pr\00F3ximo ano')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141677987324752145)
,p_name=>'APEX.IG.X.IS_NOT_NULL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 n\00E3o est\00E1 vazio(a)')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141677885863752145)
,p_name=>'APEX.IG.X.IS_NULL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 est\00E1 vazio(a)')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141677665165752144)
,p_name=>'APEX.IG.X.LESS_THAN.Y'
,p_message_language=>'pt-br'
,p_message_text=>'%0 menor que %1'
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141677739010752145)
,p_name=>'APEX.IG.X.LESS_THAN_OR_EQUALS.Y'
,p_message_language=>'pt-br'
,p_message_text=>'%0 menor que ou igual a %1'
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141678097502752145)
,p_name=>'APEX.IG.X.LIKE.Y'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 \00E9 semelhante a %1')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141678653772752145)
,p_name=>'APEX.IG.X.MATCHES_REGULAR_EXPRESSION.Y'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 corresponde \00E0 express\00E3o regular %1')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141684564480752146)
,p_name=>'APEX.IG.X.MINUTES_AGO'
,p_message_language=>'pt-br'
,p_message_text=>unistr('H\00E1 %0 minutos')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141678863541752145)
,p_name=>'APEX.IG.X.NOT_BETWEEN.Y.AND.Z'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 n\00E3o est\00E1 entre %1 e %2')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141677364038752144)
,p_name=>'APEX.IG.X.NOT_EQUALS.Y'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 \00E9 diferente de %1')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141678312093752145)
,p_name=>'APEX.IG.X.NOT_IN.Y'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 n\00E3o em %1')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141680606254752145)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.DAYS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 n\00E3o est\00E1 nos %1 \00FAltimos dias')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141680421168752145)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.HOURS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 n\00E3o est\00E1 nas %1 \00FAltimas horas')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141680263001752145)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.MINUTES'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 n\00E3o est\00E1 nos %1 \00FAltimos minutos')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141681075738752145)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.MONTHS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 n\00E3o est\00E1 nos %1 \00FAltimos meses')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141680835146752145)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.WEEKS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 n\00E3o est\00E1 nas %1 \00FAltimas semanas')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141681259881752146)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.YEARS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 n\00E3o est\00E1 nos %1 \00FAltimos anos')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141680508951752145)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_DAY'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 n\00E3o est\00E1 no \00FAltimo dia')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141680330886752145)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_HOUR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 n\00E3o est\00E1 na \00FAltima hora')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141680182208752145)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_MINUTE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 n\00E3o est\00E1 no \00FAltimo minuto')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141680954924752145)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_MONTH'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 n\00E3o est\00E1 no \00FAltimo m\00EAs')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141680771449752145)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_WEEK'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 n\00E3o est\00E1 na \00FAltima semana')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141681188411752146)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_YEAR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 n\00E3o est\00E1 no \00FAltimo ano')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141683089346752146)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.DAYS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 n\00E3o est\00E1 nos %1 pr\00F3ximos dias')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141682818459752146)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.HOURS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 n\00E3o est\00E1 nas %1 pr\00F3ximas horas')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141682657646752146)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.MINUTES'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 n\00E3o est\00E1 nos %1 pr\00F3ximos minutos')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141683454328752146)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.MONTHS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 n\00E3o est\00E1 nos %1 pr\00F3ximos meses ')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141683235921752146)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.WEEKS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 n\00E3o est\00E1 nas %1 pr\00F3ximas semanas')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141683687454752146)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.YEARS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 n\00E3o est\00E1 nos %1 pr\00F3ximos anos')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141682974342752146)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_DAY'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 n\00E3o est\00E1 no pr\00F3ximo dia')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141682730324752146)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_HOUR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 n\00E3o est\00E1 na \00FAltima hora')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141682532694752146)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_MINUTE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 n\00E3o est\00E1 no pr\00F3ximo minuto')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141683302941752146)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_MONTH'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 n\00E3o est\00E1 no \00FAltimo m\00EAs')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141683175319752146)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_WEEK'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 n\00E3o est\00E1 na pr\00F3xima semana')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141683548503752146)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_YEAR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 n\00E3o est\00E1 no pr\00F3ximo ano')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141678106689752145)
,p_name=>'APEX.IG.X.NOT_LIKE.Y'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 n\00E3o \00E9 semelhante a %1')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141685095847752147)
,p_name=>'APEX.IG.X.STARTS_WITH.Y'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 come\00E7a com %1')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141727417099752159)
,p_name=>'APEX.IG.X_COLUMN'
,p_message_language=>'pt-br'
,p_message_text=>'X'
,p_is_js_message=>true
,p_version_scn=>2705376
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141687723088752147)
,p_name=>'APEX.IG.YEARS'
,p_message_language=>'pt-br'
,p_message_text=>'anos'
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141727546489752159)
,p_name=>'APEX.IG.Y_COLUMN'
,p_message_language=>'pt-br'
,p_message_text=>'Y'
,p_is_js_message=>true
,p_version_scn=>2705376
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141727657844752159)
,p_name=>'APEX.IG.Z_COLUMN'
,p_message_language=>'pt-br'
,p_message_text=>'Z'
,p_is_js_message=>true
,p_version_scn=>2705376
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141736629709752162)
,p_name=>'APEX.IG_FORMAT_SAMPLE_1'
,p_message_language=>'pt-br'
,p_message_text=>'Segunda-feira, 12 de janeiro de 2016'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141736724513752162)
,p_name=>'APEX.IG_FORMAT_SAMPLE_2'
,p_message_language=>'pt-br'
,p_message_text=>'Janeiro'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141736859441752162)
,p_name=>'APEX.IG_FORMAT_SAMPLE_3'
,p_message_language=>'pt-br'
,p_message_text=>unistr('16 horas atr\00E1s')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141736918082752162)
,p_name=>'APEX.IG_FORMAT_SAMPLE_4'
,p_message_language=>'pt-br'
,p_message_text=>'em 16h'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141554977511752108)
,p_name=>'APEX.ITEM.CROPPER.APPLY'
,p_message_language=>'pt-br'
,p_message_text=>'Aplicar'
,p_is_js_message=>true
,p_version_scn=>2705344
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141546942876752106)
,p_name=>'APEX.ITEM.CROPPER.HELP.TEXT'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Arraste sua imagem e use o controle deslizante de zoom para reposicion\00E1-la no quadro.</p>'),
'',
unistr('<p>Quando focado na ferramenta de recorte de \00EDcone de atalho, os seguintes atalhos de teclado estar\00E3o dispon\00EDveis:</p>'),
'<ul>',
'    <li>Seta para a Esquerda: Mover imagem para a esquerda*</li>',
'    <li>Seta para Cima: Mover imagem para cima*</li>',
'    <li>Seta para a Direita: Mover imagem para a direita*</li>',
'    <li>Seta para Baixo: Mover imagem para baixo*</li>',
'    <li>I: Ampliar</li>',
'    <li>O: Reduzir</li>',
'    <li>L: Girar para a esquerda</li>',
'    <li>R: Girar para a direita</li>',
'</ul>',
'',
unistr('<p class="margin-top-md"><em>*Manter a tecla Shift pressionada para mover mais r\00E1pido</em></p>')))
,p_is_js_message=>true
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141547126645752106)
,p_name=>'APEX.ITEM.CROPPER.HELP.TITLE'
,p_message_language=>'pt-br'
,p_message_text=>'Ajuda para Recortar Imagem'
,p_is_js_message=>true
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141555066906752108)
,p_name=>'APEX.ITEM.CROPPER.RESET'
,p_message_language=>'pt-br'
,p_message_text=>'Redefinir'
,p_is_js_message=>true
,p_version_scn=>2705344
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141547443153752106)
,p_name=>'APEX.ITEM.CROPPER.TITLE'
,p_message_language=>'pt-br'
,p_message_text=>'Recortar Imagem'
,p_is_js_message=>true
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141555162036752108)
,p_name=>'APEX.ITEM.CROPPER.ZOOM_SLIDER_LABEL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Mover barra deslizante para ajustar n\00EDvel de zoom')
,p_is_js_message=>true
,p_version_scn=>2705344
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141584781903752117)
,p_name=>'APEX.ITEM.FILE.ACCEPTED_TYPES'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Tipo de arquivo inv\00E1lido. Tipos de arquivos suportados: %0.')
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141719119167752157)
,p_name=>'APEX.ITEM.FILE.BROWSE'
,p_message_language=>'pt-br'
,p_message_text=>'Navegar'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141718832648752157)
,p_name=>'APEX.ITEM.FILE.CHOOSE_FILE'
,p_message_language=>'pt-br'
,p_message_text=>'Escolher Arquivo'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141718986206752157)
,p_name=>'APEX.ITEM.FILE.CHOOSE_FILES'
,p_message_language=>'pt-br'
,p_message_text=>'Escolher Arquivos'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141584552929752117)
,p_name=>'APEX.ITEM.FILE.DROP_FILE'
,p_message_language=>'pt-br'
,p_message_text=>'Arrastar e Soltar'
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141584971076752117)
,p_name=>'APEX.ITEM.FILE.DROP_FILES'
,p_message_language=>'pt-br'
,p_message_text=>'Arrastar e Soltar Arquivos'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141586310687752117)
,p_name=>'APEX.ITEM.FILE.DROP_OR_CHOOSE_FILE'
,p_message_language=>'pt-br'
,p_message_text=>'Selecione um arquivo ou solte um aqui.'
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141586453875752117)
,p_name=>'APEX.ITEM.FILE.DROP_OR_CHOOSE_FILES'
,p_message_language=>'pt-br'
,p_message_text=>'Selecione ou solte arquivos aqui.'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141586582251752118)
,p_name=>'APEX.ITEM.FILE.DROP_OR_SELECT_FILE'
,p_message_language=>'pt-br'
,p_message_text=>'Selecione um arquivo ou solte um aqui.'
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141586645974752118)
,p_name=>'APEX.ITEM.FILE.DROP_OR_SELECT_FILES'
,p_message_language=>'pt-br'
,p_message_text=>'Selecione ou solte arquivos aqui.'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141584831071752117)
,p_name=>'APEX.ITEM.FILE.FILES_WITH_COUNT'
,p_message_language=>'pt-br'
,p_message_text=>'%0 arquivos'
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141584667864752117)
,p_name=>'APEX.ITEM.FILE.MAX_FILE_SIZE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O arquivo \00E9 muito grande. O tamanho m\00E1ximo \00E9 de %0.')
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141565150276752111)
,p_name=>'APEX.ITEM.FILE.MULTIPLE_FILES_NOT_SUPPORTED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o h\00E1 suporte para diversos uploads de arquivo.')
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141548011242752106)
,p_name=>'APEX.ITEM.FILE.REMOVE'
,p_message_language=>'pt-br'
,p_message_text=>'Remover'
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141553527655752108)
,p_name=>'APEX.ITEM.GEOCODE.ADDRESS_REQUIRED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Endere\00E7o obrigat\00F3rio.')
,p_is_js_message=>true
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141552407926752107)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_CITY'
,p_message_language=>'pt-br'
,p_message_text=>'Cidade'
,p_is_js_message=>true
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141552871193752108)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_COUNTRY'
,p_message_language=>'pt-br'
,p_message_text=>unistr('C\00F3digo do Pa\00EDs')
,p_is_js_message=>true
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141552514747752107)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_HOUSENUMBER'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00FAmero da Casa')
,p_is_js_message=>true
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141553437106752108)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_LATITUDE'
,p_message_language=>'pt-br'
,p_message_text=>'Latitude'
,p_is_js_message=>true
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141553302975752108)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_LONGITUDE'
,p_message_language=>'pt-br'
,p_message_text=>'Longitude'
,p_is_js_message=>true
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141553276279752108)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_MAPLINK'
,p_message_language=>'pt-br'
,p_message_text=>'Mostrar no Mapa'
,p_is_js_message=>true
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141552976057752108)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_MATCHSCORE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Pontua\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141552630839752108)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_POSTALCODE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('C\00F3digo Postal')
,p_is_js_message=>true
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141552719410752108)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_STATE'
,p_message_language=>'pt-br'
,p_message_text=>'Estado'
,p_is_js_message=>true
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141552308786752107)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_STREET'
,p_message_language=>'pt-br'
,p_message_text=>'Rua'
,p_is_js_message=>true
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141552283522752107)
,p_name=>'APEX.ITEM.GEOCODE.DIALOG_TITLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Resultados da Geocodifica\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141583701437752117)
,p_name=>'APEX.ITEM.GEOCODE.GEOCODING_DONE'
,p_message_language=>'pt-br'
,p_message_text=>'Geocodificado'
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141583871697752117)
,p_name=>'APEX.ITEM.GEOCODE.GEOCODING_OPEN'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o Geocodificado')
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141553118814752108)
,p_name=>'APEX.ITEM.GEOCODE.MAP_DIALOG_TITLE'
,p_message_language=>'pt-br'
,p_message_text=>'Mapa'
,p_is_js_message=>true
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141553091039752108)
,p_name=>'APEX.ITEM.GEOCODE.NO_DATA_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Nenhum endere\00E7o foi encontrado.')
,p_is_js_message=>true
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141553682207752108)
,p_name=>'APEX.ITEM.GEOCODE.REQUIRED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 \00E9 obrigat\00F3rio.')
,p_is_js_message=>true
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141659852367752139)
,p_name=>'APEX.ITEM.GEOCODE.REQUIRED_MULTIPLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 ou %1 \00E9 obrigat\00F3rio.')
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141749303260752166)
,p_name=>'APEX.ITEM.HELP_TEXT'
,p_message_language=>'pt-br'
,p_message_text=>'Exiba o texto de ajuda para %0.'
,p_is_js_message=>true
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141555306078752108)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.CHOOSE_FILE'
,p_message_language=>'pt-br'
,p_message_text=>'Escolher Imagem'
,p_is_js_message=>true
,p_version_scn=>2705344
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141555490088752108)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.CHOOSE_FILES'
,p_message_language=>'pt-br'
,p_message_text=>'Escolher Imagens'
,p_is_js_message=>true
,p_version_scn=>2705344
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141555280052752108)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DOWNLOAD_LINK_TEXT'
,p_message_language=>'pt-br'
,p_message_text=>'Fazer Download'
,p_is_js_message=>true
,p_version_scn=>2705344
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141555581778752108)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_FILE'
,p_message_language=>'pt-br'
,p_message_text=>'Arrastar e Soltar'
,p_is_js_message=>true
,p_version_scn=>2705345
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141555641401752108)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_FILES'
,p_message_language=>'pt-br'
,p_message_text=>'Arrastar e Soltar Imagens'
,p_is_js_message=>true
,p_version_scn=>2705345
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141555769029752108)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_CHOOSE_FILE'
,p_message_language=>'pt-br'
,p_message_text=>'Selecione uma imagem ou solte uma aqui.'
,p_is_js_message=>true
,p_version_scn=>2705345
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141555812434752108)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_CHOOSE_FILES'
,p_message_language=>'pt-br'
,p_message_text=>'Selecione ou solte imagens aqui.'
,p_is_js_message=>true
,p_version_scn=>2705345
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141555906379752109)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_SELECT_FILE'
,p_message_language=>'pt-br'
,p_message_text=>'Selecione uma imagem ou solte uma aqui.'
,p_is_js_message=>true
,p_version_scn=>2705345
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141556058744752109)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_SELECT_FILES'
,p_message_language=>'pt-br'
,p_message_text=>'Selecione ou solte imagens aqui.'
,p_is_js_message=>true
,p_version_scn=>2705345
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141640704056752134)
,p_name=>'APEX.ITEM_TYPE.CHECKBOX.CHECKED'
,p_message_language=>'pt-br'
,p_message_text=>'Marcado'
,p_is_js_message=>true
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141640854705752134)
,p_name=>'APEX.ITEM_TYPE.CHECKBOX.UNCHECKED'
,p_message_language=>'pt-br'
,p_message_text=>'Desmarcado'
,p_is_js_message=>true
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141668306752752142)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.EMPTY_READONLY_COMBOBOX'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A caixa de combina\00E7\00E3o somente para leitura est\00E1 vazia')
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141666148924752141)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.EMPTY_READONLY_LISTBOX'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A caixa de listagem somente para leitura est\00E1 vazia')
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141665911240752141)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.READONLY_COMBOBOX'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Caixa de combina\00E7\00E3o somente para leitura')
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141666019189752141)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.READONLY_LISTBOX'
,p_message_language=>'pt-br'
,p_message_text=>'Caixa de listagem somente para leitura'
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141581764264752116)
,p_name=>'APEX.ITEM_TYPE.SLIDER.VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'pt-br'
,p_message_text=>unistr('#LABEL# n\00E3o est\00E1 na faixa v\00E1lida de %0 a %1.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141581833183752116)
,p_name=>'APEX.ITEM_TYPE.SLIDER.VALUE_NOT_MULTIPLE_OF_STEP'
,p_message_language=>'pt-br'
,p_message_text=>unistr('#LABEL# n\00E3o \00E9 m\00FAltiplo de %0.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141669130352752142)
,p_name=>'APEX.ITEM_TYPE.SWITCH.READONLY_SWITCH'
,p_message_language=>'pt-br'
,p_message_text=>'Switch somente para leitura'
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141609749045752124)
,p_name=>'APEX.ITEM_TYPE.TEXT.READONLY_WITH_LINK'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Edi\00E7\00E3o somente para leitura com um link')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141581392361752116)
,p_name=>'APEX.ITEM_TYPE.YES_NO.INVALID_VALUE'
,p_message_language=>'pt-br'
,p_message_text=>'#LABEL# deve corresponder aos valores %0 e %1.'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141581522585752116)
,p_name=>'APEX.ITEM_TYPE.YES_NO.NO_LABEL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141667805769752142)
,p_name=>'APEX.ITEM_TYPE.YES_NO.OFF_LABEL'
,p_message_language=>'pt-br'
,p_message_text=>'Desativado'
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141667984075752142)
,p_name=>'APEX.ITEM_TYPE.YES_NO.ON_LABEL'
,p_message_language=>'pt-br'
,p_message_text=>'Ativado'
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141581416602752116)
,p_name=>'APEX.ITEM_TYPE.YES_NO.YES_LABEL'
,p_message_language=>'pt-br'
,p_message_text=>'Sim'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141589312481752118)
,p_name=>'APEX.LANGUAGE_SELECTOR'
,p_message_language=>'pt-br'
,p_message_text=>'Seletor de idioma'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141525751407752100)
,p_name=>'APEX.LIST_MANAGER.ADD_ENTRY'
,p_message_language=>'pt-br'
,p_message_text=>'Adicionar Entrada'
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141702538700752152)
,p_name=>'APEX.LIST_MANAGER.BUTTON_ADD'
,p_message_language=>'pt-br'
,p_message_text=>'Adicionar'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141702669177752152)
,p_name=>'APEX.LIST_MANAGER.BUTTON_REMOVE'
,p_message_language=>'pt-br'
,p_message_text=>'Remover'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141525872028752100)
,p_name=>'APEX.LIST_MANAGER.SELECTED_ENTRY'
,p_message_language=>'pt-br'
,p_message_text=>'Entradas selecionadas'
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141706370005752153)
,p_name=>'APEX.LTO.ADVANCED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Avan\00E7ado')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141706612446752153)
,p_name=>'APEX.LTO.CANCEL'
,p_message_language=>'pt-br'
,p_message_text=>'Cancelar'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141706413679752153)
,p_name=>'APEX.LTO.COMMON'
,p_message_language=>'pt-br'
,p_message_text=>'Comum'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141706720199752153)
,p_name=>'APEX.LTO.LIVE_TEMPLATE_OPTIONS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Op\00E7\00F5es de Modelo ao Vivo')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141707348139752153)
,p_name=>'APEX.LTO.NOT_APPLICABLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('As Op\00E7\00F5es de Modelo n\00E3o est\00E3o dispon\00EDveis porque este componente n\00E3o foi processado na p\00E1gina.')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141706231391752153)
,p_name=>'APEX.LTO.NO_OPTIONS_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Nenhuma Op\00E7\00E3o de Modelo encontrada.')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141706534976752153)
,p_name=>'APEX.LTO.SAVE'
,p_message_language=>'pt-br'
,p_message_text=>'Salvar'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141560347849752110)
,p_name=>'APEX.MAPS.CLEAR_CIRCLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Remover C\00EDrculo')
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141562703021752111)
,p_name=>'APEX.MAPS.CUSTOM_STYLES_INVALID_JSON'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Os Estilos Personalizados n\00E3o s\00E3o JSON v\00E1lidos.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141560615886752110)
,p_name=>'APEX.MAPS.DISTANCE_TOOL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Ferramenta de Dist\00E2ncia')
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141560453167752110)
,p_name=>'APEX.MAPS.DRAW_CIRCLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Desenhar C\00EDrculo')
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141540260210752104)
,p_name=>'APEX.MAPS.FIND_MY_LOCATION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Localiza\00E7\00E3o Atual')
,p_is_js_message=>true
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141546662555752106)
,p_name=>'APEX.MAPS.INIT_POINT_COORDINATES_INVALID'
,p_message_language=>'pt-br'
,p_message_text=>unistr('As coordenadas da posi\00E7\00E3o inicial s\00E3o inv\00E1lidas.')
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141535674351752103)
,p_name=>'APEX.MAPS.INIT_POINT_GEOMETRY_REQUIRED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A posi\00E7\00E3o inicial deve ser uma geometria de ponto.')
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141544275399752105)
,p_name=>'APEX.MAPS.KM'
,p_message_language=>'pt-br'
,p_message_text=>'km'
,p_is_js_message=>true
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141539489412752104)
,p_name=>'APEX.MAPS.LAYER'
,p_message_language=>'pt-br'
,p_message_text=>'Camada'
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141709887702752154)
,p_name=>'APEX.MAPS.LAYER_NAME'
,p_message_language=>'pt-br'
,p_message_text=>'Camada: %0'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141558610881752109)
,p_name=>'APEX.MAPS.MAP'
,p_message_language=>'pt-br'
,p_message_text=>'Mapa'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141528319206752100)
,p_name=>'APEX.MAPS.MAP_MESSAGES'
,p_message_language=>'pt-br'
,p_message_text=>'Mensagens'
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141544438522752105)
,p_name=>'APEX.MAPS.MILES'
,p_message_language=>'pt-br'
,p_message_text=>'milhas'
,p_is_js_message=>true
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141708864301752154)
,p_name=>'APEX.MAPS.MORE_DATA_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Os dados cont\00EAm mais de %0 linhas, o que ultrapassa o m\00E1ximo permitido.')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141538795062752103)
,p_name=>'APEX.MAPS.ORACLE_MAP_COPYRIGHT'
,p_message_language=>'pt-br'
,p_message_text=>'&copy; 2022 Oracle Corporation &nbsp;&nbsp; <a rel="noopener noreferrer" target="_blank" href="https://elocation.oracle.com/elocation/legal.html">Termos</a> &nbsp;&nbsp; Dados do mapa &copy; 2021 AQUI'
,p_is_js_message=>true
,p_version_scn=>2705339
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141535374473752102)
,p_name=>'APEX.MAPS.ORACLE_SDO_GEOMETRY_NOT_AVAILABLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O tipo de dados SDO_GEOMETRY n\00E3o est\00E1 dispon\00EDvel neste banco de dados.')
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141538858272752103)
,p_name=>'APEX.MAPS.OSM_MAP_COPYRIGHT'
,p_message_language=>'pt-br'
,p_message_text=>'<a rel="noopener noreferrer" target="_blank" href="http://openmaptiles.org"> &copy; OpenMapTiles </a> &nbsp; <a rel="noopener noreferrer" target="_blank" href="https://www.openstreetmap.org/copyright"> &copy; Colaboradores OpenStreetMap </a>'
,p_is_js_message=>true
,p_version_scn=>2705339
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141563421217752111)
,p_name=>'APEX.MAPS.OSM_VECTOR_MAP_COPYRIGHT'
,p_message_language=>'pt-br'
,p_message_text=>'<a rel="noopener noreferrer" target="blank" href="https://www.maptiler.com/copyright"> &copy; MapTiler</a> &nbsp; <a rel="noopener noreferrer" target="_blank" href="https://www.openstreetmap.org/copyright"> &copy; Colaboradores OpenStreetMap </a>'
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141539607259752104)
,p_name=>'APEX.MAPS.POINTS'
,p_message_language=>'pt-br'
,p_message_text=>'Pontos'
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141709953684752154)
,p_name=>'APEX.MAPS.POINTS_COUNT'
,p_message_language=>'pt-br'
,p_message_text=>'%0 Pontos'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141560550132752110)
,p_name=>'APEX.MAPS.RECTANGLE_ZOOM'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Zoom com Ret\00E2ngulo')
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141560224379752110)
,p_name=>'APEX.MAPS.REMOVE_MESSAGE'
,p_message_language=>'pt-br'
,p_message_text=>'Remover'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141540072711752104)
,p_name=>'APEX.MAPS.RESET_BEARING_TO_NORTH'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Redefinir Dire\00E7\00E3o para Norte')
,p_is_js_message=>true
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141654817074752138)
,p_name=>'APEX.MAPS.TOGGLE_2D_MODE'
,p_message_language=>'pt-br'
,p_message_text=>'Alternar para o modo 2D'
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141654927117752138)
,p_name=>'APEX.MAPS.TOGGLE_3D_MODE'
,p_message_language=>'pt-br'
,p_message_text=>'Alternar para o modo 3D'
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141560120835752110)
,p_name=>'APEX.MAPS.TOGGLE_COPYRIGHT'
,p_message_language=>'pt-br'
,p_message_text=>'Alternar Aviso de Copyright'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141560733302752110)
,p_name=>'APEX.MAPS.TOTAL_DISTANCE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Dist\00E2ncia Total')
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141539732377752104)
,p_name=>'APEX.MAPS.ZOOM_IN'
,p_message_language=>'pt-br'
,p_message_text=>'Ampliar'
,p_is_js_message=>true
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141539915197752104)
,p_name=>'APEX.MAPS.ZOOM_OUT'
,p_message_language=>'pt-br'
,p_message_text=>'Reduzir'
,p_is_js_message=>true
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141704413062752152)
,p_name=>'APEX.MARKDOWN.BOLD'
,p_message_language=>'pt-br'
,p_message_text=>'Negrito'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141705386866752153)
,p_name=>'APEX.MARKDOWN.IMAGE'
,p_message_language=>'pt-br'
,p_message_text=>'Imagem'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141704907935752152)
,p_name=>'APEX.MARKDOWN.INLINE_CODE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('C\00F3digo em Linha')
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141717667122752156)
,p_name=>'APEX.MARKDOWN.INSERT_IMAGE'
,p_message_language=>'pt-br'
,p_message_text=>'Inserir Imagem'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141717718522752156)
,p_name=>'APEX.MARKDOWN.INSERT_LINK'
,p_message_language=>'pt-br'
,p_message_text=>'Inserir Link'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141704521701752152)
,p_name=>'APEX.MARKDOWN.ITALIC'
,p_message_language=>'pt-br'
,p_message_text=>unistr('It\00E1lico')
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141718300424752156)
,p_name=>'APEX.MARKDOWN.LINK'
,p_message_language=>'pt-br'
,p_message_text=>'Link'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141705274231752153)
,p_name=>'APEX.MARKDOWN.LIST'
,p_message_language=>'pt-br'
,p_message_text=>'Lista'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141705126860752153)
,p_name=>'APEX.MARKDOWN.ORDERED_LIST'
,p_message_language=>'pt-br'
,p_message_text=>'Lista Ordenada'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141704629913752152)
,p_name=>'APEX.MARKDOWN.PREVIEW'
,p_message_language=>'pt-br'
,p_message_text=>'Visualizar'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141704794533752152)
,p_name=>'APEX.MARKDOWN.PREVIEW_EMPTY'
,p_message_language=>'pt-br'
,p_message_text=>'Nada a Ser Visualizado'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141704849746752152)
,p_name=>'APEX.MARKDOWN.STRIKETHROUGH'
,p_message_language=>'pt-br'
,p_message_text=>'Tachado'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141705047591752153)
,p_name=>'APEX.MARKDOWN.UNORDERED_LIST'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Lista N\00E3o Ordenada')
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141683988225752146)
,p_name=>'APEX.MENU.CURRENT_MENU'
,p_message_language=>'pt-br'
,p_message_text=>'atual'
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141740116497752163)
,p_name=>'APEX.MENU.OVERFLOW_LABEL'
,p_message_language=>'pt-br'
,p_message_text=>'Mais...'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141683866775752146)
,p_name=>'APEX.MENU.PROCESSING'
,p_message_language=>'pt-br'
,p_message_text=>'Carregando'
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141598089627752121)
,p_name=>'APEX.MENU.SPLIT_BUTTON'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Dividir Bot\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705352
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141597946647752121)
,p_name=>'APEX.MENU.SPLIT_MENU'
,p_message_language=>'pt-br'
,p_message_text=>'Dividir Menu'
,p_is_js_message=>true
,p_version_scn=>2705352
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141714985192752155)
,p_name=>'APEX.NOTIFICATION_MESSAGE_HEADING'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Mensagem de Notifica\00E7\00E3o')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141539045506752104)
,p_name=>'APEX.NO_DATA_FOUND_ENTITY'
,p_message_language=>'pt-br'
,p_message_text=>'Nenhum(a) %0 encontrado(a)'
,p_is_js_message=>true
,p_version_scn=>2705339
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141688963563752148)
,p_name=>'APEX.NUMBER_FIELD.VALUE_GREATER_MAX_VALUE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('#LABEL# deve ser um n\00FAmero menor ou igual a %0.')
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141689013084752148)
,p_name=>'APEX.NUMBER_FIELD.VALUE_INVALID'
,p_message_language=>'pt-br'
,p_message_text=>unistr('#LABEL# deve ser um n\00FAmero v\00E1lido.')
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141689132009752148)
,p_name=>'APEX.NUMBER_FIELD.VALUE_INVALID2'
,p_message_language=>'pt-br'
,p_message_text=>unistr('#LABEL# n\00E3o corresponde ao formato de n\00FAmero %0 (Exemplo: %1).')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141688865328752148)
,p_name=>'APEX.NUMBER_FIELD.VALUE_LESS_MIN_VALUE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('#LABEL# deve ser um n\00FAmero maior ou igual a %0.')
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141688748502752148)
,p_name=>'APEX.NUMBER_FIELD.VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'pt-br'
,p_message_text=>unistr('#LABEL# deve ser um n\00FAmero entre %0 e %1.')
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141684067769752146)
,p_name=>'APEX.OPENS_IN_NEW_WINDOW_LOWER'
,p_message_language=>'pt-br'
,p_message_text=>'aberta em nova janela'
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141633877699752132)
,p_name=>'APEX.PAGE.DUPLICATE_SUBMIT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Esta p\00E1gina j\00E1 foi submetida e n\00E3o pode ser ressubmetida.')
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141615292093752126)
,p_name=>'APEX.PAGE.NOT_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Aplicativo "%0" P\00E1gina "%1" n\00E3o encontradas.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141650707013752137)
,p_name=>'APEX.PAGE_ITEM_IS_REQUIRED'
,p_message_language=>'pt-br'
,p_message_text=>'#LABEL# deve ter algum valor.'
,p_is_js_message=>true
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141541435305752104)
,p_name=>'APEX.PASSWORD.HIDE_PASSWORD'
,p_message_language=>'pt-br'
,p_message_text=>'Ocultar Senha'
,p_is_js_message=>true
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141541350575752104)
,p_name=>'APEX.PASSWORD.SHOW_PASSWORD'
,p_message_language=>'pt-br'
,p_message_text=>'Mostrar Senha'
,p_is_js_message=>true
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141588999225752118)
,p_name=>'APEX.POPUP.SEARCH'
,p_message_language=>'pt-br'
,p_message_text=>'Pesquisar'
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141702917725752152)
,p_name=>'APEX.POPUP_LOV.BUTTON_CLOSE'
,p_message_language=>'pt-br'
,p_message_text=>'Fechar'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141702807159752152)
,p_name=>'APEX.POPUP_LOV.BUTTON_FIND'
,p_message_language=>'pt-br'
,p_message_text=>'Localizar%0'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141703197984752152)
,p_name=>'APEX.POPUP_LOV.BUTTON_NEXT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Pr\00F3ximo')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141703080856752152)
,p_name=>'APEX.POPUP_LOV.BUTTON_PREV'
,p_message_language=>'pt-br'
,p_message_text=>'Anterior'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141579742774752116)
,p_name=>'APEX.POPUP_LOV.FILTER_REQ'
,p_message_language=>'pt-br'
,p_message_text=>'Digite um termo de pesquisa com pelo menos %0 caracteres.'
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141656079628752138)
,p_name=>'APEX.POPUP_LOV.ICON_TEXT'
,p_message_language=>'pt-br'
,p_message_text=>'Lista de Valores Popup: %0'
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141579829803752116)
,p_name=>'APEX.POPUP_LOV.INITIAL_FILTER_REQ'
,p_message_language=>'pt-br'
,p_message_text=>'Digite um termo para pesquisa.'
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141526805771752100)
,p_name=>'APEX.POPUP_LOV.LIST_OF_VALUES'
,p_message_language=>'pt-br'
,p_message_text=>'Lista de valores'
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141579642535752116)
,p_name=>'APEX.POPUP_LOV.NO_RESULTS'
,p_message_language=>'pt-br'
,p_message_text=>'Nenhum resultado encontrado.'
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141579525358752115)
,p_name=>'APEX.POPUP_LOV.REMOVE_VALUE'
,p_message_language=>'pt-br'
,p_message_text=>'Remover %0'
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141676768966752144)
,p_name=>'APEX.POPUP_LOV.SEARCH'
,p_message_language=>'pt-br'
,p_message_text=>'Pesquisar Termo'
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141702781422752152)
,p_name=>'APEX.POPUP_LOV.TITLE'
,p_message_language=>'pt-br'
,p_message_text=>'Pesquisar'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141528928957752101)
,p_name=>'APEX.PRINT.DOCGEN_REQUIRED'
,p_message_language=>'pt-br'
,p_message_text=>'Requer %0.'
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141541295153752104)
,p_name=>'APEX.PRINT_REPORT.ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro durante a impress\00E3o do relat\00F3rio.')
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141552036084752107)
,p_name=>'APEX.PRINT_UTIL.UNABLE_TO_PRINT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel imprimir o documento usando o servidor de impress\00E3o configurado.')
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141574785288752114)
,p_name=>'APEX.PROCESS.INVOKE_API.PARAMETER_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro durante a avalia\00E7\00E3o do par\00E2metro %0 ao chamar %1. Consulte o log de erros para ver detalhes.')
,p_version_scn=>2705348
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141713438227752155)
,p_name=>'APEX.PROCESSING'
,p_message_language=>'pt-br'
,p_message_text=>'Processando'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141572505008752113)
,p_name=>'APEX.PWA.DIALOG.HIDE.INSTRUCTIONS'
,p_message_language=>'pt-br'
,p_message_text=>'Voltar'
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141573693246752114)
,p_name=>'APEX.PWA.DIALOG.INTRO'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Este site tem funcionalidade de aplicativo. Instale-o no seu dispositivo para obter a melhor experi\00EAncia.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141574909450752114)
,p_name=>'APEX.PWA.DIALOG.SHOW.INSTRUCTIONS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Pr\00F3ximo')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141576560579752115)
,p_name=>'APEX.PWA.DIALOG.TITLE'
,p_message_language=>'pt-br'
,p_message_text=>'Instalar este aplicativo'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141561341552752110)
,p_name=>'APEX.PWA.INSTRUCTIONS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('No momento, parece que seu dispositivo ou browser n\00E3o suporta a instala\00E7\00E3o de Aplicativos Web Progressivos.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141556410561752109)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP1'
,p_message_language=>'pt-br'
,p_message_text=>unistr('1. Toque no \00EDcone <strong>Compartilhar</strong>')
,p_version_scn=>2705345
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141556531152752109)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP2'
,p_message_language=>'pt-br'
,p_message_text=>'2. Role para baixo e toque em <strong>Add to Home Screen</strong>'
,p_version_scn=>2705345
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141572977885752114)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP3'
,p_message_language=>'pt-br'
,p_message_text=>'3. Toque em <strong style="color:#007AE1;">Add</strong> para confirmar'
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141572004243752113)
,p_name=>'APEX.PWA.OFFLINE.BODY'
,p_message_language=>'pt-br'
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
||'57 13.413 13.413c.08.08.08.158.158.158l.158.158 2.761 2.762-13.097 13.255z" fill="#FFF"/',
'      </g>',
'    </svg>',
unistr('    <h1>N\00E3o \00E9 poss\00EDvel estabelecer conex\00E3o</h1>'),
unistr('    <p>Parece que h\00E1 um problema na rede. Verifique sua conex\00E3o e tente novamente.</p>'),
'    <button type="button">Tentar Novamente</button>',
'</main>',
'',
'<script>',
'    document.querySelector("button").addEventListener("click", () => {',
'        window.location.reload();',
'    });',
'</script>'))
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141571903541752113)
,p_name=>'APEX.PWA.OFFLINE.TITLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel estabelecer conex\00E3o')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141618502818752127)
,p_name=>'APEX.PWA.PUSH.SUBSCRIPTION_FAILED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Falha ao ativar as notifica\00E7\00F5es por push neste dispositivo.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141624069038752129)
,p_name=>'APEX.QUICK_PICK.GROUP_LABEL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Sele\00E7\00F5es R\00E1pidas de %0')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141623988012752129)
,p_name=>'APEX.QUICK_PICK.LINK_ROLE'
,p_message_language=>'pt-br'
,p_message_text=>'Link Quick Pick'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141597713578752121)
,p_name=>'APEX.RADIO.VISUALLY_HIDDEN_RADIO'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Bot\00E3o de op\00E7\00E3o visualmente oculto')
,p_is_js_message=>true
,p_version_scn=>2705352
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141541889715752104)
,p_name=>'APEX.RECORD_VIEW.TOOLBAR'
,p_message_language=>'pt-br'
,p_message_text=>'View de Uma Linha'
,p_is_js_message=>true
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141724528922752158)
,p_name=>'APEX.REGION.CSSCALENDAR.ADD'
,p_message_language=>'pt-br'
,p_message_text=>'Adicionar'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141669821393752142)
,p_name=>'APEX.REGION.CSSCALENDAR.ALL_DAY'
,p_message_language=>'pt-br'
,p_message_text=>'Um Dia Inteiro'
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141747430322752165)
,p_name=>'APEX.REGION.CSSCALENDAR.BUTTON.SENDEMAIL'
,p_message_language=>'pt-br'
,p_message_text=>'Enviar Convite'
,p_version_scn=>2705379
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141747229754752165)
,p_name=>'APEX.REGION.CSSCALENDAR.CHOOSE_ACTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Op\00E7\00F5es')
,p_version_scn=>2705379
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141671620989752143)
,p_name=>'APEX.REGION.CSSCALENDAR.DAILY_ALLDAY'
,p_message_language=>'pt-br'
,p_message_text=>unistr('View di\00E1ria para o dia todo ')
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141671493066752143)
,p_name=>'APEX.REGION.CSSCALENDAR.DAILY_TIME_SPECIFIC'
,p_message_language=>'pt-br'
,p_message_text=>unistr('View Di\00E1ria de dados com hora ')
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141715690580752156)
,p_name=>'APEX.REGION.CSSCALENDAR.DAY'
,p_message_language=>'pt-br'
,p_message_text=>'Dia'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141710643934752154)
,p_name=>'APEX.REGION.CSSCALENDAR.DESCRIPTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Descri\00E7\00E3o')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141594179333752120)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.CSV'
,p_message_language=>'pt-br'
,p_message_text=>'CSV'
,p_version_scn=>2705351
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141593974786752120)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.ICALENDAR'
,p_message_language=>'pt-br'
,p_message_text=>'iCal'
,p_version_scn=>2705351
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141593808416752120)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.PDF'
,p_message_language=>'pt-br'
,p_message_text=>'PDF'
,p_version_scn=>2705351
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141594053280752120)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.XML'
,p_message_language=>'pt-br'
,p_message_text=>'XML'
,p_version_scn=>2705351
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141593557202752120)
,p_name=>'APEX.REGION.CSSCALENDAR.ENDDATE'
,p_message_language=>'pt-br'
,p_message_text=>'Data Final'
,p_version_scn=>2705351
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141593721447752120)
,p_name=>'APEX.REGION.CSSCALENDAR.EVENTNAME'
,p_message_language=>'pt-br'
,p_message_text=>'Nome do Evento'
,p_version_scn=>2705351
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141747368386752165)
,p_name=>'APEX.REGION.CSSCALENDAR.INVITATION'
,p_message_language=>'pt-br'
,p_message_text=>'Convite'
,p_version_scn=>2705379
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141715799359752156)
,p_name=>'APEX.REGION.CSSCALENDAR.LIST'
,p_message_language=>'pt-br'
,p_message_text=>'Lista'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141715401096752156)
,p_name=>'APEX.REGION.CSSCALENDAR.MONTH'
,p_message_language=>'pt-br'
,p_message_text=>unistr('M\00EAs')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141718015336752156)
,p_name=>'APEX.REGION.CSSCALENDAR.NEXT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Pr\00F3ximo')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141732014612752161)
,p_name=>'APEX.REGION.CSSCALENDAR.NOEVENTS'
,p_message_language=>'pt-br'
,p_message_text=>'Nenhum Evento'
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141747638004752165)
,p_name=>'APEX.REGION.CSSCALENDAR.OPTION.FORM'
,p_message_language=>'pt-br'
,p_message_text=>'Edite um Evento Existente.'
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141747530071752165)
,p_name=>'APEX.REGION.CSSCALENDAR.OPTION.SEND'
,p_message_language=>'pt-br'
,p_message_text=>'Enviando um convite por e-mail.'
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141718196559752156)
,p_name=>'APEX.REGION.CSSCALENDAR.PREVIOUS'
,p_message_language=>'pt-br'
,p_message_text=>'Anterior'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141725857706752159)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL'
,p_message_language=>'pt-br'
,p_message_text=>'Enviar E-mail'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141725607039752159)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.BUTTON'
,p_message_language=>'pt-br'
,p_message_text=>'Enviar E-mail'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141748223668752165)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.DIALOG.REQUIRED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Todos os campos s\00E3o obrigat\00F3rios.')
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141748125973752165)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.DIALOG.TITLE'
,p_message_language=>'pt-br'
,p_message_text=>'Enviar Convite'
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141747125587752165)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.SUBJECT'
,p_message_language=>'pt-br'
,p_message_text=>'Assunto'
,p_version_scn=>2705379
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141725743418752159)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.TO'
,p_message_language=>'pt-br'
,p_message_text=>'Para'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141593624627752120)
,p_name=>'APEX.REGION.CSSCALENDAR.STARTDATE'
,p_message_language=>'pt-br'
,p_message_text=>'Data Inicial'
,p_version_scn=>2705351
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141723875453752158)
,p_name=>'APEX.REGION.CSSCALENDAR.TABLEFORM'
,p_message_language=>'pt-br'
,p_message_text=>'Form em %0'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141671211724752143)
,p_name=>'APEX.REGION.CSSCALENDAR.TIME'
,p_message_language=>'pt-br'
,p_message_text=>'Tempo'
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141718254321752156)
,p_name=>'APEX.REGION.CSSCALENDAR.TODAY'
,p_message_language=>'pt-br'
,p_message_text=>'Hoje'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141716278411752156)
,p_name=>'APEX.REGION.CSSCALENDAR.VIEW'
,p_message_language=>'pt-br'
,p_message_text=>'Exibir'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141715573568752156)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEK'
,p_message_language=>'pt-br'
,p_message_text=>'Semana'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141671554481752143)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEKLY_ALLDAY'
,p_message_language=>'pt-br'
,p_message_text=>'View semanal para o dia todo'
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141671394279752143)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEKLY_TIME_SPECIFIC'
,p_message_language=>'pt-br'
,p_message_text=>'View Semanal de dados com hora'
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141716179056752156)
,p_name=>'APEX.REGION.CSSCALENDAR.YEAR'
,p_message_language=>'pt-br'
,p_message_text=>'Ano'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141715823521752156)
,p_name=>'APEX.REGION.JQM_COLUMN_TOGGLE.COLUMNS'
,p_message_language=>'pt-br'
,p_message_text=>'Colunas...'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141715971705752156)
,p_name=>'APEX.REGION.JQM_COLUMN_TOGGLE.LOAD_MORE'
,p_message_language=>'pt-br'
,p_message_text=>'Carregar mais...'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141645390222752135)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.BACK'
,p_message_language=>'pt-br'
,p_message_text=>'Voltar'
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141586871936752118)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.LOAD_MORE'
,p_message_language=>'pt-br'
,p_message_text=>'Carregar mais...'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141589121151752118)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.SEARCH'
,p_message_language=>'pt-br'
,p_message_text=>'Pesquisar...'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141716054576752156)
,p_name=>'APEX.REGION.JQM_REFLOW.LOAD_MORE'
,p_message_language=>'pt-br'
,p_message_text=>'Carregar mais...'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141717933608752156)
,p_name=>'APEX.REGION.NOT_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>unistr('ID de Regi\00E3o %0 n\00E3o encontrado.')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141589062193752118)
,p_name=>'APEX.REGION.NO_DATA_FOUND_MESSAGE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Dados N\00E3o Encontrados')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141616505711752126)
,p_name=>'APEX.REGION.PAGINATION.RESET_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o foi poss\00EDvel redefinir pagina\00E7\00E3o de regi\00F5es.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141580252359752116)
,p_name=>'APEX.REGION.PAGINATION.UNHANDLED_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro ao definir pagina\00E7\00E3o da regi\00E3o.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141710085949752154)
,p_name=>'APEX.REGION.RESPONSIVE_TABLE.COLUMNS'
,p_message_language=>'pt-br'
,p_message_text=>'Colunas...'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141564576935752111)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.LAZY_LOADING_INCOMPATIBLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O carregamento lento \00E9 incompat\00EDvel com os slots de %0, que \00E9 uma regi\00E3o \00FAnica (parcial). Voc\00EA deve desativar o carregamento lento dessa regi\00E3o ou mudar os componentes do slot para outra regi\00E3o.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141559871358752110)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.NO_GROUP_TEMPLATE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Est\00E1 faltando o Modelo de Grupo no Componente de Modelo para %0.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141554836168752108)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.TOO_MANY_ROWS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 \00E9 uma regi\00E3o \00FAnica (parcial) e retornou v\00E1rias linhas.')
,p_version_scn=>2705344
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141717847642752156)
,p_name=>'APEX.REGION.TYPE_NOT_SUPPORTED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o h\00E1 suporte para o Tipo de Regi\00E3o %0.')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141580189211752116)
,p_name=>'APEX.REGION.UNHANDLED_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro ao renderizar a regi\00E3o "#COMPONENT_NAME#".')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141650839720752137)
,p_name=>'APEX.REGION_COLUMN_IS_REQUIRED'
,p_message_language=>'pt-br'
,p_message_text=>'#COLUMN_HEADER# deve ter algum valor.'
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141532435888752102)
,p_name=>'APEX.REPORT_QUERY.LAYOUT_REQUIRED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Voc\00EA deve especificar um Layout de Relat\00F3rio.')
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141746707245752165)
,p_name=>'APEX.RICH_TEXT_EDITOR.ACCESSIBLE_LABEL'
,p_message_language=>'pt-br'
,p_message_text=>'%0, editor RTF'
,p_is_js_message=>true
,p_version_scn=>2705379
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141652952683752137)
,p_name=>'APEX.RICH_TEXT_EDITOR.MAXIMUM_LENGTH_EXCEEDED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A marca\00E7\00E3o HTML Rich Text excede o tamanho m\00E1ximo do item (real %0, permitido %1 caracteres)')
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141562390018752110)
,p_name=>'APEX.RTE.READ_ONLY_RICH_TEXT_EDITOR'
,p_message_language=>'pt-br'
,p_message_text=>'Editor RTF somente para Leitura'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141562283278752110)
,p_name=>'APEX.RTE.RICH_TEXT_EDITOR'
,p_message_language=>'pt-br'
,p_message_text=>'Editor de Formato Rich Text'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141562072331752110)
,p_name=>'APEX.RTE.TOOLBAR_ALIGNMENT'
,p_message_language=>'pt-br'
,p_message_text=>'Alinhamento'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141562197123752110)
,p_name=>'APEX.RTE.TOOLBAR_EXTRAS'
,p_message_language=>'pt-br'
,p_message_text=>'Extras'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141561832910752110)
,p_name=>'APEX.RTE.TOOLBAR_FONT'
,p_message_language=>'pt-br'
,p_message_text=>'Fonte'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141561702653752110)
,p_name=>'APEX.RTE.TOOLBAR_FORMATTING'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Formata\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141561988611752110)
,p_name=>'APEX.RTE.TOOLBAR_LISTS'
,p_message_language=>'pt-br'
,p_message_text=>'Listas'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141715079887752155)
,p_name=>'APEX.RV.DELETE'
,p_message_language=>'pt-br'
,p_message_text=>'Excluir'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141707588460752153)
,p_name=>'APEX.RV.DUPLICATE'
,p_message_language=>'pt-br'
,p_message_text=>'Duplicar'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141705862312752153)
,p_name=>'APEX.RV.EXCLUDE_HIDDEN'
,p_message_language=>'pt-br'
,p_message_text=>'Colunas Exibidas'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141705757238752153)
,p_name=>'APEX.RV.EXCLUDE_NULL'
,p_message_language=>'pt-br'
,p_message_text=>'Excluir Valores Nulos'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141715138103752155)
,p_name=>'APEX.RV.INSERT'
,p_message_language=>'pt-br'
,p_message_text=>'Adicionar'
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141669468687752142)
,p_name=>'APEX.RV.MOVE_DOWN'
,p_message_language=>'pt-br'
,p_message_text=>'Mover para Baixo'
,p_is_js_message=>true
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141669520656752142)
,p_name=>'APEX.RV.MOVE_UP'
,p_message_language=>'pt-br'
,p_message_text=>'Mover para Cima'
,p_is_js_message=>true
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141705545060752153)
,p_name=>'APEX.RV.NEXT_RECORD'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Pr\00F3ximo')
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141706145196752153)
,p_name=>'APEX.RV.NOT_GROUPED_LABEL'
,p_message_language=>'pt-br'
,p_message_text=>'Outras Colunas'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141705680530752153)
,p_name=>'APEX.RV.PREV_RECORD'
,p_message_language=>'pt-br'
,p_message_text=>'Anterior'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141705943493752153)
,p_name=>'APEX.RV.REC_X'
,p_message_language=>'pt-br'
,p_message_text=>'Linha %0'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141706066358752153)
,p_name=>'APEX.RV.REC_XY'
,p_message_language=>'pt-br'
,p_message_text=>'Linha %0 de %1'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141707635908752153)
,p_name=>'APEX.RV.REFRESH'
,p_message_language=>'pt-br'
,p_message_text=>'Atualizar'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141707797747752153)
,p_name=>'APEX.RV.REVERT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Reverter Altera\00E7\00F5es')
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141705410138752153)
,p_name=>'APEX.RV.SETTINGS_MENU'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Defini\00E7\00F5es')
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141664620696752141)
,p_name=>'APEX.SAMPLE_FORMAT'
,p_message_language=>'pt-br'
,p_message_text=>'Por exemplo, %0'
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141668934784752142)
,p_name=>'APEX.SAMPLE_FORMAT_SHORT'
,p_message_language=>'pt-br'
,p_message_text=>'Exemplo: %0'
,p_is_js_message=>true
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141581612221752116)
,p_name=>'APEX.SEARCH.1_RESULT_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>'1 resultado'
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141578763042752115)
,p_name=>'APEX.SEARCH.N_RESULTS_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>'%0 resultados'
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141630598521752131)
,p_name=>'APEX.SEARCH.PAGINATION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Pagina\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705359
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141630611740752131)
,p_name=>'APEX.SEARCH.RESULTS_X_TO_Y'
,p_message_language=>'pt-br'
,p_message_text=>'Resultados, %0 a %1'
,p_is_js_message=>true
,p_version_scn=>2705359
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141526345959752100)
,p_name=>'APEX.SESSION.ALERT.CREATE_NEW'
,p_message_language=>'pt-br'
,p_message_text=>'Acessar Novamente'
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141526262165752100)
,p_name=>'APEX.SESSION.ALERT.EXPIRED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('sua sess\00E3o foi finalizada')
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141526497284752100)
,p_name=>'APEX.SESSION.ALERT.EXTEND'
,p_message_language=>'pt-br'
,p_message_text=>'Estender'
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141526019089752100)
,p_name=>'APEX.SESSION.ALERT.IDLE_WARN'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Sua sess\00E3o vai terminar \00E0s %0. Deseja estend\00EA-la?')
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141526179366752100)
,p_name=>'APEX.SESSION.ALERT.MAX_WARN'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Sua sess\00E3o vai terminar \00E0s %0 e n\00E3o pode ser estendida. Salve todos os trabalhos agora para evitar perda de dados.')
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141725461691752159)
,p_name=>'APEX.SESSION.DB_SESSION_CLEANUP.UNHANDLED_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro ao processar c\00F3digo de limpeza de sess\00E3o do banco de dados.')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141615189362752126)
,p_name=>'APEX.SESSION.DB_SESSION_INIT.UNHANDLED_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro ao processar c\00F3digo de configura\00E7\00E3o de sess\00E3o do banco de dados.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141585585762752117)
,p_name=>'APEX.SESSION.EXPIRED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('sua sess\00E3o foi finalizada.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141724677705752158)
,p_name=>'APEX.SESSION.EXPIRED.CLOSE_DIALOG'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Feche esta caixa de di\00E1logo e pressione o bot\00E3o de recarregar o seu browser para obter uma nova sess\00E3o.')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141743525742752164)
,p_name=>'APEX.SESSION.EXPIRED.NEW_SESSION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('<a href="%0">Acesse</a> novamente para criar uma nova sess\00E3o.')
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141627869902752130)
,p_name=>'APEX.SESSION.NOT_VALID'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Sess\00E3o N\00E3o V\00E1lida')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141670997763752143)
,p_name=>'APEX.SESSION.RAS.NO_DYNAMIC_ROLES'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Nenhuma Atribui\00E7\00E3o Din\00E2mica poder ser ativada na sess\00E3o Seguran\00E7a Real do Aplicativo para o usu\00E1rio "%0".')
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141613027739752125)
,p_name=>'APEX.SESSION.UNHANDLED_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('ERR-99900 N\00E3o foi poss\00EDvel criar ID de sess\00E3o \00FAnico: %0')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141542144522752104)
,p_name=>'APEX.SESSION_STATE.CLOB_NOT_ALLOWED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O tipo de dados CLOB do estado da sess\00E3o n\00E3o \00E9 permitido para o item %0.')
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141561567244752110)
,p_name=>'APEX.SESSION_STATE.CLOB_SUBSTITUTION_NOT_ALLOWED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o h\00E1 suporte para a substitui\00E7\00E3o de itens do tipo de dados CLOB do estado da sess\00E3o.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141630351633752131)
,p_name=>'APEX.SESSION_STATE.ITEM_VALUE_PROTECTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Viola\00E7\00E3o de prote\00E7\00E3o de estado de sess\00E3o. Isso pode ser causado por uma altera\00E7\00E3o manual do item %0 de p\00E1gina protegido. Se n\00E3o estiver certo quanto ao que causou este erro, entre em contato com o administrador da publica\00E7\00E3o para obter ajuda.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141751598831752166)
,p_name=>'APEX.SESSION_STATE.PAGE_PROTECTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Viola\00E7\00E3o de prote\00E7\00E3o da p\00E1gina: isso pode ser causado pela submiss\00E3o de uma p\00E1gina que ainda n\00E3o tinha terminado de carregar ou pela altera\00E7\00E3o manual de itens de p\00E1gina protegidos. Para obter ajuda, entre em contato com o administrador do aplicativo.')
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141750645759752166)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.NO_SPECIAL_CHAR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 cont\00E9m um dos seguintes caracteres inv\00E1lidos &<>"/;,*|=% ou --')
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141750708611752166)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.NO_SPECIAL_CHAR_NL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 cont\00E9m um dos seguintes caracteres inv\00E1lidos &<>"/;,*|=% ou -- ou nova linha.')
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141750420799752166)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.US_ONLY'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 cont\00E9m caracteres especiais. Somente os caracteres de a-Z, 0-9 e espa\00E7os s\00E3o permitidos.')
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141750507935752166)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 cont\00E9m <, > ou " que s\00E3o caracteres inv\00E1lidos.')
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141587974573752118)
,p_name=>'APEX.SESSION_STATE.SSP_CHECKSUM_MISSING'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o foi fornecida uma checksum para o procedimento de exibi\00E7\00E3o de uma p\00E1gina que requer uma checksum quando um ou mais valores de solicita\00E7\00E3o, limpeza de cache ou argumento s\00E3o especificados como argumentos.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141625277191752129)
,p_name=>'APEX.SESSION_STATE.SSP_VIOLATION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Viola\00E7\00E3o de prote\00E7\00E3o de estado de sess\00E3o. Isso pode ser causado por uma altera\00E7\00E3o manual de um URL que cont\00E9m uma checksum ou pela utiliza\00E7\00E3o de um link com uma checksum incorreta ou que n\00E3o foi encontrada. Se n\00E3o estiver certo quanto ao que causou e')
||unistr('ste erro, entre em contato com o administrador da publica\00E7\00E3o para obter ajuda.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141706837561752153)
,p_name=>'APEX.SET_HIGH_CONTRAST_MODE_OFF'
,p_message_language=>'pt-br'
,p_message_text=>'Desativar Modo de Contraste Elevado'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141706977054752153)
,p_name=>'APEX.SET_HIGH_CONTRAST_MODE_ON'
,p_message_language=>'pt-br'
,p_message_text=>'Ativar Modo de Contraste Elevado'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141571319057752113)
,p_name=>'APEX.SET_VALUE_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel atualizar a defini\00E7\00E3o de aplicativo %0, porque foi assinada em outro aplicativo.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141621667774752128)
,p_name=>'APEX.SHUTTLE.CONTROL_BOTTOM'
,p_message_language=>'pt-br'
,p_message_text=>'Inferior'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141621862335752128)
,p_name=>'APEX.SHUTTLE.CONTROL_DOWN'
,p_message_language=>'pt-br'
,p_message_text=>'Para Baixo'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141621998061752128)
,p_name=>'APEX.SHUTTLE.CONTROL_MOVE'
,p_message_language=>'pt-br'
,p_message_text=>'Mover'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141622038432752128)
,p_name=>'APEX.SHUTTLE.CONTROL_MOVE_ALL'
,p_message_language=>'pt-br'
,p_message_text=>'Mover Tudo'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141622148287752128)
,p_name=>'APEX.SHUTTLE.CONTROL_REMOVE'
,p_message_language=>'pt-br'
,p_message_text=>'Remover'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141622242305752128)
,p_name=>'APEX.SHUTTLE.CONTROL_REMOVE_ALL'
,p_message_language=>'pt-br'
,p_message_text=>'Remover Tudo'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141622366807752128)
,p_name=>'APEX.SHUTTLE.CONTROL_RESET'
,p_message_language=>'pt-br'
,p_message_text=>'Redefinir'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141621592282752128)
,p_name=>'APEX.SHUTTLE.CONTROL_TOP'
,p_message_language=>'pt-br'
,p_message_text=>'Superior'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141621783829752128)
,p_name=>'APEX.SHUTTLE.CONTROL_UP'
,p_message_language=>'pt-br'
,p_message_text=>'Para Cima'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141733365390752161)
,p_name=>'APEX.SINCE.SHORT.DAYS_AGO'
,p_message_language=>'pt-br'
,p_message_text=>'%0d'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141734062673752161)
,p_name=>'APEX.SINCE.SHORT.DAYS_FROM_NOW'
,p_message_language=>'pt-br'
,p_message_text=>'em %0d'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141733233065752161)
,p_name=>'APEX.SINCE.SHORT.HOURS_AGO'
,p_message_language=>'pt-br'
,p_message_text=>'%0h'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141734153775752161)
,p_name=>'APEX.SINCE.SHORT.HOURS_FROM_NOW'
,p_message_language=>'pt-br'
,p_message_text=>'em %0h'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141733080752752161)
,p_name=>'APEX.SINCE.SHORT.MINUTES_AGO'
,p_message_language=>'pt-br'
,p_message_text=>'%0m'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141734250162752161)
,p_name=>'APEX.SINCE.SHORT.MINUTES_FROM_NOW'
,p_message_language=>'pt-br'
,p_message_text=>'em %0m'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141733610211752161)
,p_name=>'APEX.SINCE.SHORT.MONTHS_AGO'
,p_message_language=>'pt-br'
,p_message_text=>'%0mo'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141733828679752161)
,p_name=>'APEX.SINCE.SHORT.MONTHS_FROM_NOW'
,p_message_language=>'pt-br'
,p_message_text=>'em %0mo'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141733130544752161)
,p_name=>'APEX.SINCE.SHORT.SECONDS_AGO'
,p_message_language=>'pt-br'
,p_message_text=>'%0s'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141733976395752161)
,p_name=>'APEX.SINCE.SHORT.SECONDS_FROM_NOW'
,p_message_language=>'pt-br'
,p_message_text=>'em %0s'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141733427656752161)
,p_name=>'APEX.SINCE.SHORT.WEEKS_AGO'
,p_message_language=>'pt-br'
,p_message_text=>'%0w'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141734327769752161)
,p_name=>'APEX.SINCE.SHORT.WEEKS_FROM_NOW'
,p_message_language=>'pt-br'
,p_message_text=>'em %0w'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141733586003752161)
,p_name=>'APEX.SINCE.SHORT.YEARS_AGO'
,p_message_language=>'pt-br'
,p_message_text=>'%0y'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141733785560752161)
,p_name=>'APEX.SINCE.SHORT.YEARS_FROM_NOW'
,p_message_language=>'pt-br'
,p_message_text=>'em %0y'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141534671346752102)
,p_name=>'APEX.SPATIAL.GEOMETRY.LINE'
,p_message_language=>'pt-br'
,p_message_text=>'[Linha]'
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141535222254752102)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTILINE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('[V\00E1rias Linhas]')
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141534989559752102)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTIPOINT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('[V\00E1rios Pontos]')
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141535404283752102)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTIPOLYGON'
,p_message_language=>'pt-br'
,p_message_text=>unistr('[V\00E1rios Pol\00EDgonos]')
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141535576568752102)
,p_name=>'APEX.SPATIAL.GEOMETRY.OTHER'
,p_message_language=>'pt-br'
,p_message_text=>'[Objeto de Geometria]'
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141534574352752102)
,p_name=>'APEX.SPATIAL.GEOMETRY.POINT'
,p_message_language=>'pt-br'
,p_message_text=>'[Ponto (%0,%1)]'
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141534888405752102)
,p_name=>'APEX.SPATIAL.GEOMETRY.POLYGON'
,p_message_language=>'pt-br'
,p_message_text=>unistr('[Pol\00EDgono]')
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141534099210752102)
,p_name=>'APEX.SPLITTER.COLLAPSED_REGION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Regi\00E3o contra\00EDda: %0')
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141649126652752136)
,p_name=>'APEX.SPLITTER.COLLAPSE_TEXT'
,p_message_language=>'pt-br'
,p_message_text=>'Contrair'
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141533093127752102)
,p_name=>'APEX.SPLITTER.HORIZ_CANNOT_LEFT_RIGHT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Um divisor orientado horizontalmente n\00E3o pode ser movido para a esquerda ou para a direita')
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141533264467752102)
,p_name=>'APEX.SPLITTER.MAX_SIZE_REACHED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Tamanho m\00E1ximo de %0px atingido')
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141534262161752102)
,p_name=>'APEX.SPLITTER.MIN_SIZE_REACHED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Tamanho m\00EDnimo de %0px atingido')
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141534103497752102)
,p_name=>'APEX.SPLITTER.REGION_IS_COLLAPSED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A regi\00E3o est\00E1 contra\00EDda')
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141533905518752102)
,p_name=>'APEX.SPLITTER.REGION_IS_RESTORED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A regi\00E3o est\00E1 restaurada')
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141533680157752102)
,p_name=>'APEX.SPLITTER.RESIZED_TO'
,p_message_language=>'pt-br'
,p_message_text=>'Redimensionado para %0px'
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141533835446752102)
,p_name=>'APEX.SPLITTER.RESTORED_REGION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Regi\00E3o restaurada: %0')
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141649023772752136)
,p_name=>'APEX.SPLITTER.RESTORE_TEXT'
,p_message_language=>'pt-br'
,p_message_text=>'Restaurar'
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141533119342752102)
,p_name=>'APEX.SPLITTER.VERTICAL_CANNOT_UP_DOWN'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Um divisor orientado verticalmente n\00E3o pode ser movido para cima ou para baixo')
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141698563228752151)
,p_name=>'APEX.STAR_RATING.CLEAR_RATING'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Apagar Classifica\00E7\00E3o')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141688483324752148)
,p_name=>'APEX.STAR_RATING.INVALID_RATING_RANGE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 n\00E3o est\00E1 na faixa de classifica\00E7\00E3o v\00E1lida de 1 a %1')
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141688583081752148)
,p_name=>'APEX.STAR_RATING.IS_NOT_NUMERIC'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 n\00E3o \00E9 num\00E9rico')
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141684607026752147)
,p_name=>'APEX.SUCCESS_MESSAGE_HEADING'
,p_message_language=>'pt-br'
,p_message_text=>'Mensagem de Sucesso'
,p_is_js_message=>true
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141746482577752165)
,p_name=>'APEX.TABS.NEXT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Pr\00F3ximo')
,p_is_js_message=>true
,p_version_scn=>2705379
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141746321560752165)
,p_name=>'APEX.TABS.PREVIOUS'
,p_message_language=>'pt-br'
,p_message_text=>'Anterior'
,p_is_js_message=>true
,p_version_scn=>2705379
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141656582970752138)
,p_name=>'APEX.TASK.ACTION.DATA_NOT_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O sistema de registro(s) associado(s) a esta inst\00E2ncia de tarefa n\00E3o foi encontrado')
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141664848520752141)
,p_name=>'APEX.TASK.ACTION.ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A execu\00E7\00E3o da a\00E7\00E3o de tarefa %0 falhou - a tarefa est\00E1 definida para o estado com erro, verifique o c\00F3digo de a\00E7\00E3o da tarefa')
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141545052698752105)
,p_name=>'APEX.TASK.ADD_COMMENT_NOT_AUTHORIZED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Adicionar Coment\00E1rio: N\00E3o autorizado')
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141544367299752105)
,p_name=>'APEX.TASK.ALREADY_ASSIGNED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A tarefa j\00E1 foi designada')
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141537712190752103)
,p_name=>'APEX.TASK.ASSIGNED_TO_USER'
,p_message_language=>'pt-br'
,p_message_text=>'Designado a %0'
,p_version_scn=>2705339
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141544068717752105)
,p_name=>'APEX.TASK.CANCEL_TASK_NOT_AUTHORIZED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Cancelar Tarefa: N\00E3o autorizado')
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141559601893752110)
,p_name=>'APEX.TASK.CANNOT_REMOVE_OWNER'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel remover o propriet\00E1rio real desta tarefa. Delegue a tarefa a outro participante antes de tentar executar novamente esta opera\00E7\00E3o.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141543603756752105)
,p_name=>'APEX.TASK.CLAIM_TASK_NOT_AUTHORIZED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Reivindicar Tarefa: N\00E3o autorizado')
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141543703080752105)
,p_name=>'APEX.TASK.COMPLETE_TASK_NOT_AUTHORIZED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Concluir Tarefa: N\00E3o autorizado')
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141543866556752105)
,p_name=>'APEX.TASK.DELEGATE_TASK_NOT_AUTHORIZED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Delegar Tarefa: N\00E3o autorizado')
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141542234900752104)
,p_name=>'APEX.TASK.DUE_DATE_IN_PAST'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A Data de Vencimento da tarefa n\00E3o pode estar no passado')
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141537507623752103)
,p_name=>'APEX.TASK.DUE_SINCE'
,p_message_language=>'pt-br'
,p_message_text=>'Vencido %0'
,p_version_scn=>2705339
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141537914849752103)
,p_name=>'APEX.TASK.EVENT.ACTION.ERROR_MESSAGE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Falha da A\00E7\00E3o de Tarefa %1. Mensagem de erro - %0')
,p_version_scn=>2705339
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141537681365752103)
,p_name=>'APEX.TASK.EVENT.ACTION.FAILURE'
,p_message_language=>'pt-br'
,p_message_text=>'Com Falha'
,p_version_scn=>2705339
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141537299694752103)
,p_name=>'APEX.TASK.EVENT.ACTION.SUCCESS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Opera\00E7\00E3o bem-sucedida')
,p_is_js_message=>true
,p_version_scn=>2705339
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141537442768752103)
,p_name=>'APEX.TASK.EVENT.ACTION.SUCCESS_MESSAGE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A\00E7\00E3o %1 bem-sucedida com a mensagem %0')
,p_version_scn=>2705339
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141540730728752104)
,p_name=>'APEX.TASK.EVENT.BEFORE_EXPIRE'
,p_message_language=>'pt-br'
,p_message_text=>'Antes de Expirar'
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141566349359752112)
,p_name=>'APEX.TASK.EVENT.CANCEL'
,p_message_language=>'pt-br'
,p_message_text=>'Cancelar'
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141565894070752111)
,p_name=>'APEX.TASK.EVENT.CANCEL_MESSAGE'
,p_message_language=>'pt-br'
,p_message_text=>'Tarefa cancelada'
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141566405468752112)
,p_name=>'APEX.TASK.EVENT.CANCEL_NOT_ALLOWED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O participante n\00E3o tem permiss\00E3o para cancelar a tarefa')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141565734989752111)
,p_name=>'APEX.TASK.EVENT.CLAIM'
,p_message_language=>'pt-br'
,p_message_text=>'Reivindicar'
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141566193772752112)
,p_name=>'APEX.TASK.EVENT.CLAIM_ALREADY_CLAIMED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A tarefa j\00E1 foi reivindicada por outro usu\00E1rio ou o participante n\00E3o tem o direito de reivindicar essa tarefa')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141565902276752111)
,p_name=>'APEX.TASK.EVENT.CLAIM_MESSAGE'
,p_message_language=>'pt-br'
,p_message_text=>'Tarefa reivindicada por %0'
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141667043481752141)
,p_name=>'APEX.TASK.EVENT.COMPLETE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Conclu\00EDda')
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141565592061752111)
,p_name=>'APEX.TASK.EVENT.COMPLETE_MESSAGE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Tarefa conclu\00EDda com resultado %0')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141566861733752112)
,p_name=>'APEX.TASK.EVENT.COMPLETE_NOT_ALLOWED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A Tarefa n\00E3o foi designada ou o participante n\00E3o tem permiss\00E3o para concluir a tarefa')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141527280915752100)
,p_name=>'APEX.TASK.EVENT.COMPLETE_NO_OUTCOME'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Tarefa conclu\00EDda sem resultado')
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141667109203752141)
,p_name=>'APEX.TASK.EVENT.CREATE'
,p_message_language=>'pt-br'
,p_message_text=>'Criar'
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141560013399752110)
,p_name=>'APEX.TASK.EVENT.CREATE_MESSAGE'
,p_message_language=>'pt-br'
,p_message_text=>'Tarefa criada com ID %0'
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141667225137752141)
,p_name=>'APEX.TASK.EVENT.DELEGATE'
,p_message_language=>'pt-br'
,p_message_text=>'Delegada'
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141565603839752111)
,p_name=>'APEX.TASK.EVENT.DELEGATE_MESSAGE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Tarefa delegada ao poss\00EDvel propriet\00E1rio %0')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141566235621752112)
,p_name=>'APEX.TASK.EVENT.DELEGATE_NOT_ALLOWED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O participante n\00E3o tem o direito ou o novo participante n\00E3o \00E9 um poss\00EDvel propriet\00E1rio desta tarefa')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141539363523752104)
,p_name=>'APEX.TASK.EVENT.EXPIRE'
,p_message_language=>'pt-br'
,p_message_text=>'Expirar'
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141540424880752104)
,p_name=>'APEX.TASK.EVENT.EXPIRED_MESSAGE'
,p_message_language=>'pt-br'
,p_message_text=>'Tarefa expirada.'
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141667358705752141)
,p_name=>'APEX.TASK.EVENT.FAIL'
,p_message_language=>'pt-br'
,p_message_text=>'Falhou'
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141536059120752103)
,p_name=>'APEX.TASK.EVENT.INFO_REQUEST.NOT_ALLOWED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A Tarefa n\00E3o foi designada ou o participante n\00E3o tem permiss\00E3o para solicitar informa\00E7\00F5es da tarefa')
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141536277252752103)
,p_name=>'APEX.TASK.EVENT.INFO_SUBMIT.NOT_ALLOWED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Nenhuma informa\00E7\00E3o da tarefa foi solicitada ou o participante n\00E3o tem permiss\00E3o para submeter informa\00E7\00F5es da tarefa.')
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141539892383752104)
,p_name=>'APEX.TASK.EVENT.MAXRENEW_EXPIRED_MESSAGE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Expirar a tarefa conforme a contagem m\00E1xima de %0 renova\00E7\00F5es for atingida.')
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141567148549752112)
,p_name=>'APEX.TASK.EVENT.NOT_ALLOWED_BUSINESS_ADMIN'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A Tarefa n\00E3o est\00E1 no estado correto ou o participante n\00E3o \00E9 um administrador de neg\00F3cios para esta tarefa')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141567257728752112)
,p_name=>'APEX.TASK.EVENT.NOT_APPLICABLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A opera\00E7\00E3o %0 \00E9 desconhecida ou n\00E3o se aplica a esta tarefa')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141667443436752141)
,p_name=>'APEX.TASK.EVENT.RELEASE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Libera\00E7\00E3o')
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141653123779752137)
,p_name=>'APEX.TASK.EVENT.RELEASE_MESSAGE'
,p_message_language=>'pt-br'
,p_message_text=>'Tarefa liberada; agora pode ser reivindicada por outras pessoas'
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141546006703752106)
,p_name=>'APEX.TASK.EVENT.RELEASE_NOT_ALLOWED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A libera\00E7\00E3o da tarefa n\00E3o \00E9 permitida - o usu\00E1rio n\00E3o \00E9 o propriet\00E1rio da tarefa')
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141563068201752111)
,p_name=>'APEX.TASK.EVENT.REMOVE_OWNER'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Remover Propriet\00E1rio')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141563237667752111)
,p_name=>'APEX.TASK.EVENT.REMOVE_OWNER_MESSAGE'
,p_message_language=>'pt-br'
,p_message_text=>'Participante %0 removido da tarefa'
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141540647729752104)
,p_name=>'APEX.TASK.EVENT.RENEW'
,p_message_language=>'pt-br'
,p_message_text=>'Renovar'
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141539516190752104)
,p_name=>'APEX.TASK.EVENT.RENEW_EXPIRED_MESSAGE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Tarefa renovada com o ID %0. O n\00FAmero m\00E1ximo restante de renova\00E7\00F5es antes da expira\00E7\00E3o \00E9 %1.')
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141540595946752104)
,p_name=>'APEX.TASK.EVENT.RENEW_MESSAGE'
,p_message_language=>'pt-br'
,p_message_text=>'ID de Tarefa %0 renovado com o ID de tarefa %1'
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141536561223752103)
,p_name=>'APEX.TASK.EVENT.REQUEST_INFO'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Solicitar informa\00E7\00F5es')
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141536498936752103)
,p_name=>'APEX.TASK.EVENT.REQUEST_INFO_MESSAGE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Solicitou %0 para obter mais informa\00E7\00F5es: %1')
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141534328764752102)
,p_name=>'APEX.TASK.EVENT.SET_INITIATOR_CAN_COMPLETE_MESSAGE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Iniciador Definido Pode Concluir at\00E9 %0')
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141536655221752103)
,p_name=>'APEX.TASK.EVENT.SUBMIT_INFO'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Submeter Informa\00E7\00F5es')
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141536302101752103)
,p_name=>'APEX.TASK.EVENT.SUBMIT_INFO_MESSAGE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Informa\00E7\00F5es solicitadas submetidas a %0: %1')
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141667597097752142)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Atualizar Coment\00E1rio')
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141564056838752111)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT_MESSAGE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Adicionar coment\00E1rio: %0')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141566927674752112)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT_NOT_ALLOWED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O estado da tarefa n\00E3o permite coment\00E1rios')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141574211754752114)
,p_name=>'APEX.TASK.EVENT.UPDATE_DUE_DATE_MESSAGE'
,p_message_language=>'pt-br'
,p_message_text=>'Definir data de vencimento da tarefa como %0'
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141532304401752102)
,p_name=>'APEX.TASK.EVENT.UPDATE_DUE_ON'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Atualiza\00E7\00E3o Vencida em')
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141667679999752142)
,p_name=>'APEX.TASK.EVENT.UPDATE_OWNER'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Atualizar Propriet\00E1rio')
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141565331703752111)
,p_name=>'APEX.TASK.EVENT.UPDATE_OWNER_MESSAGE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Adicione o poss\00EDvel propriet\00E1rio %0 aos participantes da tarefa')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141564406802752111)
,p_name=>'APEX.TASK.EVENT.UPDATE_PARAM'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Par\00E2metros de Atualiza\00E7\00E3o')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141667711141752142)
,p_name=>'APEX.TASK.EVENT.UPDATE_PRIORITY'
,p_message_language=>'pt-br'
,p_message_text=>'Atualizar a Prioridade'
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141566011235752111)
,p_name=>'APEX.TASK.EVENT.UPDATE_PRIORITY_MESSAGE'
,p_message_language=>'pt-br'
,p_message_text=>'Definir prioridade da tarefa como %0'
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141563346374752111)
,p_name=>'APEX.TASK.EVENT.UPD_PARAMETER_MESSAGE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Par\00E2metro "%0" atualizado de "%1" para "%2".')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141546827567752106)
,p_name=>'APEX.TASK.EVENT.WF_CANCEL_MESSAGE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Tarefa cancelada, pois a inst\00E2ncia do workflow correspondente foi encerrada.')
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141543942375752105)
,p_name=>'APEX.TASK.FORWARD_TASK_NOT_AUTHORIZED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Encaminhar Tarefa: N\00E3o autorizado')
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141537376326752103)
,p_name=>'APEX.TASK.INITIATED_BY_USER_SINCE'
,p_message_language=>'pt-br'
,p_message_text=>'Iniciado(a) por %0 %1'
,p_version_scn=>2705339
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141546216373752106)
,p_name=>'APEX.TASK.INTERNAL_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>'Ocorreu um erro interno inesperado'
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141544501927752105)
,p_name=>'APEX.TASK.NOT_APPLICABLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Opera\00E7\00E3o da tarefa n\00E3o aplic\00E1vel')
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141570184350752113)
,p_name=>'APEX.TASK.NO_POTENTIAL_OWNER'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Este poss\00EDvel propriet\00E1rio n\00E3o existe.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141545863256752106)
,p_name=>'APEX.TASK.OUTCOME.APPROVED'
,p_message_language=>'pt-br'
,p_message_text=>'Aprovada'
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141545975606752106)
,p_name=>'APEX.TASK.OUTCOME.REJECTED'
,p_message_language=>'pt-br'
,p_message_text=>'Rejeitada'
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141527329093752100)
,p_name=>'APEX.TASK.OUTCOME_MISSING'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A conclus\00E3o da tarefa requer um resultado')
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141527537862752100)
,p_name=>'APEX.TASK.OUTCOME_NOT_ALLOWED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o \00E9 permitido que a tarefa tenha um resultado')
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141563181790752111)
,p_name=>'APEX.TASK.PARAM_NOT_UPDATABLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel atualizar o par\00E2metro %0.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141559434466752110)
,p_name=>'APEX.TASK.PARTICIPANT_EXISTS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O participante j\00E1 existe para esta inst\00E2ncia de tarefa.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141660974920752140)
,p_name=>'APEX.TASK.PRIORITY.1'
,p_message_language=>'pt-br'
,p_message_text=>'Urgente'
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141538061378752103)
,p_name=>'APEX.TASK.PRIORITY.1.DESCRIPTION'
,p_message_language=>'pt-br'
,p_message_text=>'Urgente'
,p_version_scn=>2705339
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141660855829752140)
,p_name=>'APEX.TASK.PRIORITY.2'
,p_message_language=>'pt-br'
,p_message_text=>'Alta'
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141538139888752103)
,p_name=>'APEX.TASK.PRIORITY.2.DESCRIPTION'
,p_message_language=>'pt-br'
,p_message_text=>'Alta prioridade'
,p_version_scn=>2705339
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141660758246752139)
,p_name=>'APEX.TASK.PRIORITY.3'
,p_message_language=>'pt-br'
,p_message_text=>unistr('M\00E9dio')
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141538291707752103)
,p_name=>'APEX.TASK.PRIORITY.3.DESCRIPTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Prioridade m\00E9dia')
,p_version_scn=>2705339
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141660636917752139)
,p_name=>'APEX.TASK.PRIORITY.4'
,p_message_language=>'pt-br'
,p_message_text=>'Baixa'
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141538352854752103)
,p_name=>'APEX.TASK.PRIORITY.4.DESCRIPTION'
,p_message_language=>'pt-br'
,p_message_text=>'Baixa prioridade'
,p_version_scn=>2705339
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141660597329752139)
,p_name=>'APEX.TASK.PRIORITY.5'
,p_message_language=>'pt-br'
,p_message_text=>'Mais baixa'
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141538429082752103)
,p_name=>'APEX.TASK.PRIORITY.5.DESCRIPTION'
,p_message_language=>'pt-br'
,p_message_text=>'Prioridade mais baixa'
,p_version_scn=>2705339
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141544175238752105)
,p_name=>'APEX.TASK.SET_PRIORITY_NOT_AUTHORIZED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Definir Prioridade da Tarefa: N\00E3o autorizado')
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141545363527752105)
,p_name=>'APEX.TASK.STATE.ASSIGNED'
,p_message_language=>'pt-br'
,p_message_text=>'Designada'
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141545732828752106)
,p_name=>'APEX.TASK.STATE.CANCELLED'
,p_message_language=>'pt-br'
,p_message_text=>'Cancelada'
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141545439324752105)
,p_name=>'APEX.TASK.STATE.COMPLETED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Conclu\00EDda')
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141545686718752105)
,p_name=>'APEX.TASK.STATE.ERRORED'
,p_message_language=>'pt-br'
,p_message_text=>'Com Erro'
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141539185679752104)
,p_name=>'APEX.TASK.STATE.EXPIRED'
,p_message_language=>'pt-br'
,p_message_text=>'Expirado'
,p_version_scn=>2705339
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141545569026752105)
,p_name=>'APEX.TASK.STATE.FAILED'
,p_message_language=>'pt-br'
,p_message_text=>'Com Falha'
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141535891687752103)
,p_name=>'APEX.TASK.STATE.INFO_REQUESTED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Informa\00E7\00F5es Solicitadas')
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141545200639752105)
,p_name=>'APEX.TASK.STATE.UNASSIGNED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o Designada')
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141567687760752112)
,p_name=>'APEX.TASK.TASK_CREATE_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('A cria\00E7\00E3o de uma nova Tarefa para a Defini\00E7\00E3o de Tarefa %0 no aplicativo %1 falhou.'),
'SQLCODE: %2'))
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141567568752752112)
,p_name=>'APEX.TASK.TASK_CREATE_NO_POTENTIAL_OWNER'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Uma tentativa de criar uma tarefa para a defini\00E7\00E3o de tarefa %0 no aplicativo %1 falhou porque a defini\00E7\00E3o de tarefa n\00E3o cont\00E9m nenhum poss\00EDvel propriet\00E1rio - edite a defini\00E7\00E3o de tarefa e adicione pelo menos um participante do tipo poss\00EDvel propriet')
||unistr('\00E1rio')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141544840508752105)
,p_name=>'APEX.TASK.TASK_DEFINITION_NOT_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Defini\00E7\00E3o da tarefa n\00E3o encontrada')
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141544792415752105)
,p_name=>'APEX.TASK.TASK_DEF_PARTICIPANTS_NOT_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Os participantes da tarefa n\00E3o foram encontrados')
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141546121792752106)
,p_name=>'APEX.TASK.TASK_ID_PK_VIOLATION'
,p_message_language=>'pt-br'
,p_message_text=>'Mais de uma tarefa para o id de tarefa fornecido. Verifique com o administrador do banco de dados'
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141544923209752105)
,p_name=>'APEX.TASK.TASK_NOT_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Tarefa N\00E3o Encontrada')
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141544682936752105)
,p_name=>'APEX.TASK.TASK_PARAMETER_NOT_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Par\00E2metro da tarefa n\00E3o encontrado')
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141580986149752116)
,p_name=>'APEX.TASK.TYPE.ACTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A\00E7\00E3o')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141580848543752116)
,p_name=>'APEX.TASK.TYPE.APPROVAL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Aprova\00E7\00E3o')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141528268791752100)
,p_name=>'APEX.TASK.VACATION_RULE_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Houve falha na execu\00E7\00E3o do Procedimento de Regra de F\00E9rias %2 para a defini\00E7\00E3o de tarefa %0 no aplicativo %1.')
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141528492515752100)
,p_name=>'APEX.TASK.VACATION_RULE_MESSAGE'
,p_message_language=>'pt-br'
,p_message_text=>'Participante %1 adicionado como substituto para o participante %0 . Motivo - %2 .'
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141732187025752161)
,p_name=>'APEX.TB.TOOLBAR'
,p_message_language=>'pt-br'
,p_message_text=>'Barra de Ferramentas'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141585684674752117)
,p_name=>'APEX.TEMPLATE.APPLICATION'
,p_message_language=>'pt-br'
,p_message_text=>'Aplicativo'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141746801565752165)
,p_name=>'APEX.TEMPLATE.EXPAND_COLLAPSE_NAV_LABEL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Expandir / Recolher Navega\00E7\00E3o')
,p_version_scn=>2705379
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141746977728752165)
,p_name=>'APEX.TEMPLATE.EXPAND_COLLAPSE_SIDE_COL_LABEL'
,p_message_language=>'pt-br'
,p_message_text=>'Expandir / Recolher Coluna Lateral'
,p_version_scn=>2705379
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141655315141752138)
,p_name=>'APEX.TEMPLATE.MAIN_NAV_LABEL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Navega\00E7\00E3o Principal')
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141556188049752109)
,p_name=>'APEX.TEMPLATE_DIRECTIVE.INVALID_PLACEHOLDER_NAME'
,p_message_language=>'pt-br'
,p_message_text=>unistr('"%0" \00E9 um nome de placeholder inv\00E1lido.')
,p_version_scn=>2705345
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141663012942752140)
,p_name=>'APEX.TIME.DAY'
,p_message_language=>'pt-br'
,p_message_text=>'1 dia'
,p_version_scn=>2705365
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141662847309752140)
,p_name=>'APEX.TIME.HOUR'
,p_message_language=>'pt-br'
,p_message_text=>'1 hora'
,p_version_scn=>2705365
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141663145460752140)
,p_name=>'APEX.TIME.N_DAYS'
,p_message_language=>'pt-br'
,p_message_text=>'%0 dias'
,p_version_scn=>2705365
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141662902681752140)
,p_name=>'APEX.TIME.N_HOURS'
,p_message_language=>'pt-br'
,p_message_text=>'%0 horas'
,p_version_scn=>2705365
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141662772276752140)
,p_name=>'APEX.TIME.N_MINUTES'
,p_message_language=>'pt-br'
,p_message_text=>'%0 minutos'
,p_version_scn=>2705365
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141663304009752140)
,p_name=>'APEX.TIME.N_WEEKS'
,p_message_language=>'pt-br'
,p_message_text=>'%0 semanas'
,p_version_scn=>2705365
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141663278923752140)
,p_name=>'APEX.TIME.WEEK'
,p_message_language=>'pt-br'
,p_message_text=>'1 semana'
,p_version_scn=>2705365
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141561028249752110)
,p_name=>'APEX.TMV.SELECTION_COUNT'
,p_message_language=>'pt-br'
,p_message_text=>'%0 itens selecionados'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141561239946752110)
,p_name=>'APEX.TMV.SELECTOR_LABEL'
,p_message_language=>'pt-br'
,p_message_text=>'Selecionar Item'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141561138304752110)
,p_name=>'APEX.TMV.SELECTOR_LABEL_1'
,p_message_language=>'pt-br'
,p_message_text=>'Selecione %0'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141749931295752166)
,p_name=>'APEX.UI.BACK_TO_TOP'
,p_message_language=>'pt-br'
,p_message_text=>unistr('In\00EDcio da p\00E1gina')
,p_is_js_message=>true
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141607512100752124)
,p_name=>'APEX.UI.ENABLED'
,p_message_language=>'pt-br'
,p_message_text=>'Ativado'
,p_is_js_message=>true
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141576057978752114)
,p_name=>'APEX.UNHANDLED_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro ao processar solicita\00E7\00E3o.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141561631144752110)
,p_name=>'APEX.UPDATE_MESSAGE_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A mensagem de texto %0 n\00E3o pode ser atualizada porque foi assinada de outro aplicativo.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141664712819752141)
,p_name=>'APEX.VALUE_REQUIRED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Valor Obrigat\00F3rio')
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141581161518752116)
,p_name=>'APEX.VISUALLY_HIDDEN_HEADING'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00EDvel de cabe\00E7alho %0, oculto')
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141709553375752154)
,p_name=>'APEX.WARN_ON_UNSAVED_CHANGES'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Esta p\00E1gina tem altera\00E7\00F5es n\00E3o salvas.')
,p_is_js_message=>true
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141571174552752113)
,p_name=>'APEX.WF.NAVIGATOR'
,p_message_language=>'pt-br'
,p_message_text=>'Navegador'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141570882085752113)
,p_name=>'APEX.WF.ZOOM_IN'
,p_message_language=>'pt-br'
,p_message_text=>'Ampliar'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141571832809752113)
,p_name=>'APEX.WF.ZOOM_LEVEL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('{0}% de n\00EDvel de zoom')
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141570931502752113)
,p_name=>'APEX.WF.ZOOM_OUT'
,p_message_language=>'pt-br'
,p_message_text=>'Reduzir'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141571085759752113)
,p_name=>'APEX.WF.ZOOM_RESET'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Redefini\00E7\00E3o de Zoom')
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141546569594752106)
,p_name=>'APEX.WF_DIAGRAM.ARIA_DESC'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O diagrama do workflow n\00E3o est\00E1 acess\00EDvel neste momento.')
,p_is_js_message=>true
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141546460341752106)
,p_name=>'APEX.WF_DIAGRAM.ARIA_LABEL'
,p_message_language=>'pt-br'
,p_message_text=>'Diagrama do Workflow'
,p_is_js_message=>true
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141548351699752106)
,p_name=>'APEX.WORKFLOW.ACTION_NOT_ALLOWED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('No momento, a Inst\00E2ncia de Workflow %0 est\00E1 no estado %1. Portanto, a opera\00E7\00E3o n\00E3o \00E9 permitida')
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141550983341752107)
,p_name=>'APEX.WORKFLOW.ACTIVITY.COMPLETED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A inst\00E2ncia %1 da Atividade %2 no Workflow %0 foi conclu\00EDda')
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141550784125752107)
,p_name=>'APEX.WORKFLOW.ACTIVITY.CREATED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Nova Inst\00E2ncia %1 da Atividade %2 no Workflow %0')
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141542558557752105)
,p_name=>'APEX.WORKFLOW.ACTIVITY.DATA_NOT_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A linha de dados adicionais associada a esta inst\00E2ncia de atividade do workflow n\00E3o foi encontrada')
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141550863526752107)
,p_name=>'APEX.WORKFLOW.ACTIVITY.RETRIED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A inst\00E2ncia %1 com falha da atividade %2 no Workflow %0 foi repetida')
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141532816353752102)
,p_name=>'APEX.WORKFLOW.ACTIVITY.TERMINATED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A inst\00E2ncia %1 da Atividade no Workflow %0 foi conclu\00EDda')
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141566619331752112)
,p_name=>'APEX.WORKFLOW.ACTIVITY.TIMEOUT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A inst\00E2ncia %1 da atividade no Workflow %0 expirou e foi encerrada.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141551084575752107)
,p_name=>'APEX.WORKFLOW.ACTIVITY.WAITING'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A inst\00E2ncia %1 da Atividade %2 no Workflow %0 est\00E1 no estado de Espera')
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141532609241752102)
,p_name=>'APEX.WORKFLOW.ALTERED_AND_RESUMED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A Inst\00E2ncia do Workflow %0 foi alterada e retomada na atividade %1')
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141550074438752107)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.COMPLETED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A Inst\00E2ncia em Espera %1 da Atividade %2 no Workflow %0 foi conclu\00EDda com sucesso')
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141549809450752107)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.FAULTED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Esperando que a atividade %1 fosse definida como Com Falha, porque o Workflow %0 j\00E1 estava no estado Com Falha antes de a Atividade ser conclu\00EDda')
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141549925203752107)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.TERMINATED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A Atividade de Espera %1 foi Encerrada porque o Workflow %0 j\00E1 estava no estado Encerrado antes de a Atividade ser conclu\00EDda')
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141532922667752102)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.TERMINATE_FAILED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Houve falha ao concluir a Atividade %1 no Workflow %0 por causa de uma exce\00E7\00E3o - %2')
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141548593177752106)
,p_name=>'APEX.WORKFLOW.BUSY'
,p_message_language=>'pt-br'
,p_message_text=>unistr('No momento, o Workflow est\00E1 ocupado concluindo uma opera\00E7\00E3o anterior. Tente mais tarde')
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141564658568752111)
,p_name=>'APEX.WORKFLOW.COMPLETED_SINCE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Conclu\00EDdo %0 ')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141547635762752106)
,p_name=>'APEX.WORKFLOW.CONTINUE.NOT_ALLOWED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel continuar o Workflow %0, pois est\00E1 atualmente na Atividade %1 que n\00E3o est\00E1 no estado de Espera')
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141559503442752110)
,p_name=>'APEX.WORKFLOW.CORRELATION_CONTEXT_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 n\00E3o \00E9 um contexto de correla\00E7\00E3o de workflow v\00E1lido para o processo que est\00E1 sendo executado por esta Atividade de Workflow. O contexto de correla\00E7\00E3o deve ser um texto delimitado por dois-pontos contendo APEX_APPL_WORKFLOW seguido pelo ID da Inst\00E2n')
||unistr('cia do Workflow e pelo ID da Inst\00E2ncia da Atividade.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141550273351752107)
,p_name=>'APEX.WORKFLOW.CREATED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Nova Inst\00E2ncia %0 do Workflow %1 criada, Vers\00E3o %2')
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141542388514752105)
,p_name=>'APEX.WORKFLOW.DATA_NOT_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A linha de dados adicionais associada a esta inst\00E2ncia do workflow n\00E3o foi encontrada')
,p_version_scn=>2705341
);
end;
/
begin
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141564838361752111)
,p_name=>'APEX.WORKFLOW.DUE_SINCE'
,p_message_language=>'pt-br'
,p_message_text=>'Vencido %0'
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141550190347752107)
,p_name=>'APEX.WORKFLOW.END'
,p_message_language=>'pt-br'
,p_message_text=>'Workflow %0 finalizado com o estado %1'
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141547332782752106)
,p_name=>'APEX.WORKFLOW.INCOMPATIBLE_DATA_TYPE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O tipo de dados %1 para as condi\00E7\00F5es que est\00E3o sendo comparadas na Atividade de Altern\00E2ncia do Workflow %0 n\00E3o \00E9 compat\00EDvel com o operador de condi\00E7\00E3o')
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141537172803752103)
,p_name=>'APEX.WORKFLOW.INITIATED_BY_USER_SINCE'
,p_message_language=>'pt-br'
,p_message_text=>'Iniciado(a) por %0 %1'
,p_version_scn=>2705339
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141559988717752110)
,p_name=>'APEX.WORKFLOW.INVOKED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Nova Inst\00E2ncia %0 do Workflow %1 criada, Vers\00E3o %2 - chamada pela inst\00E2ncia de atividade %4 da inst\00E2ncia de workflow %3')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141532742812752102)
,p_name=>'APEX.WORKFLOW.NO_ACTIVITY_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A atividade com o ID est\00E1tico %1 n\00E3o \00E9 uma atividade no Workflow %0. Verifique os IDs est\00E1ticos da atividade da correspondente Vers\00E3o do Workflow.')
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141558099158752109)
,p_name=>'APEX.WORKFLOW.REQUIRED_PARAM_MISSING'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 \00E9 um par\00E2metro obrigat\00F3rio para este workflow e n\00E3o deve ser NULL.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141550686414752107)
,p_name=>'APEX.WORKFLOW.RESUMED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A Inst\00E2ncia do Workflow %0 foi retomada')
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141550577183752107)
,p_name=>'APEX.WORKFLOW.RETRIED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A Inst\00E2ncia do Workflow %0 foi repetida')
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141564927638752111)
,p_name=>'APEX.WORKFLOW.RETRY_COUNT.EQUALS_ONE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 de repeti\00E7\00E3o')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141565069106752111)
,p_name=>'APEX.WORKFLOW.RETRY_COUNT.NOT_EQUALS_ONE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 de repeti\00E7\00F5es')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141564765897752111)
,p_name=>'APEX.WORKFLOW.STARTED_SINCE'
,p_message_language=>'pt-br'
,p_message_text=>'Iniciado %0'
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141558998336752109)
,p_name=>'APEX.WORKFLOW.STATE.ACTIVE'
,p_message_language=>'pt-br'
,p_message_text=>'Ativo'
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141559160451752109)
,p_name=>'APEX.WORKFLOW.STATE.COMPLETED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Conclu\00EDda')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141559294556752109)
,p_name=>'APEX.WORKFLOW.STATE.FAULTED'
,p_message_language=>'pt-br'
,p_message_text=>'Com Falha'
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141559300824752110)
,p_name=>'APEX.WORKFLOW.STATE.SUSPENDED'
,p_message_language=>'pt-br'
,p_message_text=>'Supenso'
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141559019447752109)
,p_name=>'APEX.WORKFLOW.STATE.TERMINATED'
,p_message_language=>'pt-br'
,p_message_text=>'Encerrado'
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141574353600752114)
,p_name=>'APEX.WORKFLOW.STATE.WAITING'
,p_message_language=>'pt-br'
,p_message_text=>'Em Espera'
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141550330189752107)
,p_name=>'APEX.WORKFLOW.SUSPENDED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A Inst\00E2ncia do Workflow %0 foi suspensa')
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141556256662752109)
,p_name=>'APEX.WORKFLOW.SWITCH.BRANCH_NOT_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel determinar a pr\00F3xima atividade para a Inst\00E2ncia de Workflow %0. Verifique e corrija as condi\00E7\00F5es definidas para a atividade de altern\00E2ncia antes de repetir o workflow.')
,p_version_scn=>2705345
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141550468818752107)
,p_name=>'APEX.WORKFLOW.TERMINATED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A Inst\00E2ncia do Workflow %0 foi encerrada')
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141549550482752107)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_RESUME'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Somente o Administrador de Neg\00F3cios do Workflow %0 pode retomar o Workflow')
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141549620286752107)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_RETRY'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Somente um Administrador de Neg\00F3cios e/ou um Propriet\00E1rio pode repetir o Workflow %0')
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141549189264752107)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_SUSPEND'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A Inst\00E2ncia de Workflow %0 s\00F3 pode ser suspensa por um Administrador de Neg\00F3cios do workflow')
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141549439317752107)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_TERMINATE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Somente Propriet\00E1rios e Administradores de Neg\00F3cios da Inst\00E2ncia de Workflow %0 podem encerrar o workflow')
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141547872298752106)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_UPDATE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('As vari\00E1veis do Workflow %0 s\00F3 podem ser atualizadas por um Administrador de Neg\00F3cios definido para o workflow')
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141562488628752110)
,p_name=>'APEX.WORKFLOW.UPDATE,NOT_ALLOWED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A inst\00E2ncia de workflow %0 deve estar no estado Com Falha ou Suspensa para que suas vari\00E1veis possam ser atualizadas.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141553936998752108)
,p_name=>'APEX.WORKFLOW.UPDATED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O Valor da Vari\00E1vel de Workflow %0 foi atualizado para %1')
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141564121585752111)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_ACTIVE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O Workflow %0 n\00E3o tem uma vers\00E3o Ativa')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141564297447752111)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_DEV'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O Workflow %0 n\00E3o tem uma vers\00E3o Em Desenvolvimento')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141564301718752111)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O Workflow %0 n\00E3o tem uma vers\00E3o Ativa ou Em Desenvolvimento')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141547245635752106)
,p_name=>'APEX.WORKFLOW.WORKFLOW_ACT_INSTANCE_NOT_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel encontrar a Inst\00E2ncia de Atividade %1 para a Inst\00E2ncia de Workflow %0')
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141547020751752106)
,p_name=>'APEX.WORKFLOW.WORKFLOW_INSTANCE_NOT_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel encontrar a inst\00E2ncia de workflow %0')
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141582102323752116)
,p_name=>'APEX.XLSX.ERROR.NO_ACTIVE_WORKSHEET'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A pasta de trabalho n\00E3o tem uma planilha ativa.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141582038325752116)
,p_name=>'APEX.XLSX.ERROR.WORKBOOK_NOT_INITIALIZED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A pasta de trabalho n\00E3o foi inicializada.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141581942084752116)
,p_name=>'APEX.XLSX.INTERNAL_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>'Erro interno ao criar o arquivo XLSX.'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141584428156752117)
,p_name=>'APEX.XLSX.SHEET'
,p_message_language=>'pt-br'
,p_message_text=>'Folha'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141595062039752120)
,p_name=>'APEX.XLSX.SHEET_NAME_TAKEN'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O nome de planilha "%0" j\00E1 est\00E1 em uso. Tente outro nome.')
,p_version_scn=>2705351
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141723649151752158)
,p_name=>'APEXIR_ACTIONS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A\00E7\00F5es')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141638643470752133)
,p_name=>'APEXIR_ACTIONS_MENU'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Menu A\00E7\00F5es')
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141634332904752132)
,p_name=>'APEXIR_ADD_FUNCTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Adicionar Fun\00E7\00E3o')
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141634228212752132)
,p_name=>'APEXIR_ADD_GROUP_BY_COLUMN'
,p_message_language=>'pt-br'
,p_message_text=>'Adicionar Grupo por Coluna'
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141671850617752143)
,p_name=>'APEXIR_ADD_PIVOT_COLUMN'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Adicionar Coluna Piv\00F4')
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141671930688752143)
,p_name=>'APEXIR_ADD_ROW_COLUMN'
,p_message_language=>'pt-br'
,p_message_text=>'Adicionar Coluna de Linhas'
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141606321838752123)
,p_name=>'APEXIR_AGGREGATE'
,p_message_language=>'pt-br'
,p_message_text=>'Agregar'
,p_is_js_message=>true
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141644897121752135)
,p_name=>'APEXIR_AGGREGATION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Agrega\00E7\00E3o')
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141625743527752129)
,p_name=>'APEXIR_AGG_AVG'
,p_message_language=>'pt-br'
,p_message_text=>unistr('M\00E9dia')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141630022355752130)
,p_name=>'APEXIR_AGG_COUNT'
,p_message_language=>'pt-br'
,p_message_text=>'Contagem'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141625852125752129)
,p_name=>'APEXIR_AGG_MAX'
,p_message_language=>'pt-br'
,p_message_text=>unistr('M\00E1ximo')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141626076227752129)
,p_name=>'APEXIR_AGG_MEDIAN'
,p_message_language=>'pt-br'
,p_message_text=>'Mediana'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141625987141752129)
,p_name=>'APEXIR_AGG_MIN'
,p_message_language=>'pt-br'
,p_message_text=>unistr('M\00EDnimo')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141625607034752129)
,p_name=>'APEXIR_AGG_SUM'
,p_message_language=>'pt-br'
,p_message_text=>'Soma %0'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141626703931752129)
,p_name=>'APEXIR_ALL'
,p_message_language=>'pt-br'
,p_message_text=>'Tudo'
,p_is_js_message=>true
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141605602421752123)
,p_name=>'APEXIR_ALL_COLUMNS'
,p_message_language=>'pt-br'
,p_message_text=>'Todas as Colunas'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141585701650752117)
,p_name=>'APEXIR_ALL_ROWS'
,p_message_language=>'pt-br'
,p_message_text=>'Todas as Linhas'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141720613038752157)
,p_name=>'APEXIR_ALTERNATIVE'
,p_message_language=>'pt-br'
,p_message_text=>'Alternativo'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141722256860752158)
,p_name=>'APEXIR_ALTERNATIVE_DEFAULT_NAME'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Padr\00E3o Alternativo: %0 ')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141619896444752127)
,p_name=>'APEXIR_AND'
,p_message_language=>'pt-br'
,p_message_text=>'e'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141654603074752138)
,p_name=>'APEXIR_API.IMPORT_CONTENT_CORRUPTED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel importar o relat\00F3rio salvo. O conte\00FAdo est\00E1 corrompido.')
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141654732788752138)
,p_name=>'APEXIR_API.IMPORT_CONTENT_EMPTY'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel importar o relat\00F3rio salvo. O conte\00FAdo est\00E1 vazio.')
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141607832635752124)
,p_name=>'APEXIR_APPLY'
,p_message_language=>'pt-br'
,p_message_text=>'Aplicar'
,p_is_js_message=>true
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141601453390752122)
,p_name=>'APEXIR_ASCENDING'
,p_message_language=>'pt-br'
,p_message_text=>'Crescente'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141622919575752128)
,p_name=>'APEXIR_AS_OF'
,p_message_language=>'pt-br'
,p_message_text=>'A partir de %0'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141722869677752158)
,p_name=>'APEXIR_AVERAGE_X'
,p_message_language=>'pt-br'
,p_message_text=>unistr('M\00E9dia %0')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141714462249752155)
,p_name=>'APEXIR_BAR'
,p_message_language=>'pt-br'
,p_message_text=>'Barras'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141607149853752124)
,p_name=>'APEXIR_BETWEEN'
,p_message_language=>'pt-br'
,p_message_text=>'entre'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141600216532752122)
,p_name=>'APEXIR_BGCOLOR'
,p_message_language=>'pt-br'
,p_message_text=>'Cor de Fundo'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141602149720752122)
,p_name=>'APEXIR_BLUE'
,p_message_language=>'pt-br'
,p_message_text=>'azul'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141636208539752132)
,p_name=>'APEXIR_BOTTOM'
,p_message_language=>'pt-br'
,p_message_text=>'Inferior'
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141567044851752112)
,p_name=>'APEXIR_BTNS_NEXT_TO_SEARCH_OF'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Bot\00F5es ao lado da barra de pesquisa de %0')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141602768690752122)
,p_name=>'APEXIR_CANCEL'
,p_message_language=>'pt-br'
,p_message_text=>'Cancelar'
,p_is_js_message=>true
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141609033862752124)
,p_name=>'APEXIR_CATEGORY'
,p_message_language=>'pt-br'
,p_message_text=>'Categoria'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141600139026752122)
,p_name=>'APEXIR_CELL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('C\00E9lula')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141626617602752129)
,p_name=>'APEXIR_CHART'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Gr\00E1fico')
,p_is_js_message=>true
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141637169158752133)
,p_name=>'APEXIR_CHART_INITIALIZING'
,p_message_language=>'pt-br'
,p_message_text=>'Inicializando...'
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141676889249752144)
,p_name=>'APEXIR_CHART_LABEL_NOT_NULL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('\00C9 necess\00E1rio especificar o label do gr\00E1fico.')
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141689211083752148)
,p_name=>'APEXIR_CHART_MAX_DATAPOINT_CNT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Sua consulta ultrapassa o n\00FAmero m\00E1ximo de %0 pontos de dados por gr\00E1fico. Aplique um filtro para reduzir o n\00FAmero de registros de sua consulta base.')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141688193838752148)
,p_name=>'APEXIR_CHART_MAX_ROW_CNT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A contagem m\00E1xima de linha de uma consulta do Gr\00E1fico limita o n\00FAmero de linhas na consulta-base, n\00E3o o n\00FAmero de linhas exibidas. Sua consulta-base excede a contagem de linhas m\00E1xima de %0. Aplique um filtro para reduzir o n\00FAmero de registros em sua')
||' consulta-base.'
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141605725299752123)
,p_name=>'APEXIR_CHART_TYPE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Tipo de Gr\00E1fico')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141569614045752113)
,p_name=>'APEXIR_CHART_VIEW_OF'
,p_message_language=>'pt-br'
,p_message_text=>unistr('View gr\00E1fica de %0')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141684854291752147)
,p_name=>'APEXIR_CHECK_ALL'
,p_message_language=>'pt-br'
,p_message_text=>'Marcar Tudo'
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141623352275752128)
,p_name=>'APEXIR_CHOOSE_DOWNLOAD_FORMAT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Escolher formato do relat\00F3rio')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141631121361752131)
,p_name=>'APEXIR_CLEAR'
,p_message_language=>'pt-br'
,p_message_text=>'remover'
,p_version_scn=>2705359
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141602646656752122)
,p_name=>'APEXIR_COLUMN'
,p_message_language=>'pt-br'
,p_message_text=>'Coluna'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141642474469752134)
,p_name=>'APEXIR_COLUMNS'
,p_message_language=>'pt-br'
,p_message_text=>'Colunas'
,p_is_js_message=>true
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141609600974752124)
,p_name=>'APEXIR_COLUMN_ALIASES'
,p_message_language=>'pt-br'
,p_message_text=>'Apelidos de Colunas'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141717232373752156)
,p_name=>'APEXIR_COLUMN_FILTER'
,p_message_language=>'pt-br'
,p_message_text=>'Filtrar...'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141577405042752115)
,p_name=>'APEXIR_COLUMN_HEADER'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Cabe\00E7alho de Coluna')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141591545900752119)
,p_name=>'APEXIR_COLUMN_HEADER_ACTIONS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A\00E7\00F5es da Coluna')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141591841495752119)
,p_name=>'APEXIR_COLUMN_HEADER_ACTIONS_FOR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A\00E7\00F5es da coluna "%0"')
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141633241262752131)
,p_name=>'APEXIR_COLUMN_HEADING_MENU'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Menu de Cabe\00E7alho de Coluna')
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141636908445752132)
,p_name=>'APEXIR_COLUMN_INFO'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Informa\00E7\00F5es da Coluna')
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141719530586752157)
,p_name=>'APEXIR_COLUMN_LABEL'
,p_message_language=>'pt-br'
,p_message_text=>'Label de Coluna'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141634637556752132)
,p_name=>'APEXIR_COLUMN_N'
,p_message_language=>'pt-br'
,p_message_text=>'Coluna %0'
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141617501111752127)
,p_name=>'APEXIR_COMPARISON_CONTAINS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('cont\00E9m')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141618816930752127)
,p_name=>'APEXIR_COMPARISON_DOESNOT_CONTAIN'
,p_message_language=>'pt-br'
,p_message_text=>unistr('n\00E3o cont\00E9m')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141601165849752122)
,p_name=>'APEXIR_COMPARISON_IN'
,p_message_language=>'pt-br'
,p_message_text=>'em'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141619028763752127)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_LAST'
,p_message_language=>'pt-br'
,p_message_text=>unistr('n\00E3o est\00E1 no \00FAltimo')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141628179614752130)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_NEXT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('n\00E3o est\00E1 no pr\00F3ximo')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141618974782752127)
,p_name=>'APEXIR_COMPARISON_IS_IN_LAST'
,p_message_language=>'pt-br'
,p_message_text=>unistr('est\00E1 no \00FAltimo')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141628068099752130)
,p_name=>'APEXIR_COMPARISON_IS_IN_NEXT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('est\00E1 no pr\00F3ximo')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141601042454752122)
,p_name=>'APEXIR_COMPARISON_IS_NOT_NULL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('n\00E3o \00E9 nulo')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141600937132752122)
,p_name=>'APEXIR_COMPARISON_IS_NULL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('\00E9 nulo')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141600738529752122)
,p_name=>'APEXIR_COMPARISON_LIKE'
,p_message_language=>'pt-br'
,p_message_text=>'como'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141601267341752122)
,p_name=>'APEXIR_COMPARISON_NOT_IN'
,p_message_language=>'pt-br'
,p_message_text=>unistr('n\00E3o contido em')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141600810909752122)
,p_name=>'APEXIR_COMPARISON_NOT_LIKE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('n\00E3o \00E9 semelhante')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141617879176752127)
,p_name=>'APEXIR_COMPARISON_REGEXP_LIKE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('corresponde \00E0 express\00E3o regular')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141623264891752128)
,p_name=>'APEXIR_COMPUTATION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('C\00E1lculo')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141687841012752147)
,p_name=>'APEXIR_COMPUTATION_EXPRESSION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Express\00E3o de C\00E1lculo')
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141642787570752134)
,p_name=>'APEXIR_COMPUTATION_FOOTER'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Cria um c\00E1lculo usando aliases de coluna.')
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141642836169752134)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E1'
,p_message_language=>'pt-br'
,p_message_text=>'(B+C)*100'
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141642901979752134)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E2'
,p_message_language=>'pt-br'
,p_message_text=>'INITCAP(B)||'', ''||INITCAP(C)'
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141643034849752134)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E3'
,p_message_language=>'pt-br'
,p_message_text=>'CASE WHEN A = 10 THEN B + C ELSE B END'
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141583998911752117)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E4'
,p_message_language=>'pt-br'
,p_message_text=>'ROUND(C / 1000000)'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141627495257752130)
,p_name=>'APEXIR_COMPUTE'
,p_message_language=>'pt-br'
,p_message_text=>'Calcular'
,p_is_js_message=>true
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141635278240752132)
,p_name=>'APEXIR_CONTROL_BREAK'
,p_message_language=>'pt-br'
,p_message_text=>'Quebra de Controle'
,p_is_js_message=>true
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141638248748752133)
,p_name=>'APEXIR_CONTROL_BREAKS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Interrup\00E7\00F5es de Controle')
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141724891661752158)
,p_name=>'APEXIR_CONTROL_BREAK_COLUMNS'
,p_message_language=>'pt-br'
,p_message_text=>'Colunas de Quebra de Controle'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141580654168752116)
,p_name=>'APEXIR_COUNT_DISTINCT'
,p_message_language=>'pt-br'
,p_message_text=>'Contar Diferentes'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141723377151752158)
,p_name=>'APEXIR_COUNT_DISTINCT_X'
,p_message_language=>'pt-br'
,p_message_text=>'Contar Diferentes'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141723210358752158)
,p_name=>'APEXIR_COUNT_X'
,p_message_language=>'pt-br'
,p_message_text=>'Contagem %0'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141696240139752150)
,p_name=>'APEXIR_DAILY'
,p_message_language=>'pt-br'
,p_message_text=>'Diariamente'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141749554577752166)
,p_name=>'APEXIR_DATA'
,p_message_language=>'pt-br'
,p_message_text=>'Dados'
,p_is_js_message=>true
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141637071821752133)
,p_name=>'APEXIR_DATA_AS_OF'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Dados do relat\00F3rio %0 minutos atr\00E1s.')
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141570063463752113)
,p_name=>'APEXIR_DATA_VIEW_OF'
,p_message_language=>'pt-br'
,p_message_text=>'View de dados de %0'
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141606489913752123)
,p_name=>'APEXIR_DATE'
,p_message_language=>'pt-br'
,p_message_text=>'Data'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141640931378752134)
,p_name=>'APEXIR_DEFAULT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Padr\00E3o')
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141720417594752157)
,p_name=>'APEXIR_DEFAULT_REPORT_TYPE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Tipo de Relat\00F3rio Padr\00E3o')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141602809801752122)
,p_name=>'APEXIR_DELETE'
,p_message_language=>'pt-br'
,p_message_text=>'Excluir'
,p_is_js_message=>true
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141606704973752123)
,p_name=>'APEXIR_DELETE_CONFIRM'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Deseja excluir essas defini\00E7\00F5es de relat\00F3rio?')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141707299945752153)
,p_name=>'APEXIR_DELETE_DEFAULT_REPORT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Excluir Relat\00F3rio Padr\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141634978488752132)
,p_name=>'APEXIR_DELETE_REPORT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Excluir Relat\00F3rio')
,p_is_js_message=>true
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141601568936752122)
,p_name=>'APEXIR_DESCENDING'
,p_message_language=>'pt-br'
,p_message_text=>'Decrescente'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141609173197752124)
,p_name=>'APEXIR_DESCRIPTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Descri\00E7\00E3o')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141633114249752131)
,p_name=>'APEXIR_DETAIL_VIEW'
,p_message_language=>'pt-br'
,p_message_text=>'View de Uma Linha'
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141641487348752134)
,p_name=>'APEXIR_DIRECTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Dire\00E7\00E3o %0')
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141642307428752134)
,p_name=>'APEXIR_DISABLED'
,p_message_language=>'pt-br'
,p_message_text=>'Desativado'
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141602307866752122)
,p_name=>'APEXIR_DISPLAYED'
,p_message_language=>'pt-br'
,p_message_text=>'Exibido'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141605522655752123)
,p_name=>'APEXIR_DISPLAYED_COLUMNS'
,p_message_language=>'pt-br'
,p_message_text=>'Colunas Exibidas'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141641332055752134)
,p_name=>'APEXIR_DISPLAY_IN_REPORT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Exibir no Relat\00F3rio')
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141636163694752132)
,p_name=>'APEXIR_DOWN'
,p_message_language=>'pt-br'
,p_message_text=>'Para Baixo'
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141627569155752130)
,p_name=>'APEXIR_DOWNLOAD'
,p_message_language=>'pt-br'
,p_message_text=>'Fazer Download'
,p_is_js_message=>true
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141641283601752134)
,p_name=>'APEXIR_DO_NOT_DISPLAY'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o Exibir')
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141710551355752154)
,p_name=>'APEXIR_DUPLICATE_HIGHLIGHT_COND'
,p_message_language=>'pt-br'
,p_message_text=>unistr('J\00E1 existe um destaque com a mesma condi\00E7\00E3o.')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141725098880752158)
,p_name=>'APEXIR_DUPLICATE_PIVOT_COLUMN'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Coluna piv\00F4 duplicada. A lista de colunas piv\00F4 deve ser exclusiva.')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141725278371752158)
,p_name=>'APEXIR_EDIT'
,p_message_language=>'pt-br'
,p_message_text=>'Editar'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141637279656752133)
,p_name=>'APEXIR_EDIT_CHART'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Editar Defini\00E7\00F5es de Gr\00E1fico')
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141643855352752135)
,p_name=>'APEXIR_EDIT_CHART2'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Editar Gr\00E1fico')
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141607753316752124)
,p_name=>'APEXIR_EDIT_CONTROL_BREAK'
,p_message_language=>'pt-br'
,p_message_text=>'Editar Control Break'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141644258206752135)
,p_name=>'APEXIR_EDIT_FILTER'
,p_message_language=>'pt-br'
,p_message_text=>'Editar Filtro'
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141610711362752125)
,p_name=>'APEXIR_EDIT_FLASHBACK'
,p_message_language=>'pt-br'
,p_message_text=>'Editar Flashback'
,p_version_scn=>2705356
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141702005849752152)
,p_name=>'APEXIR_EDIT_GROUP_BY'
,p_message_language=>'pt-br'
,p_message_text=>'Editar Grupo por'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141644143796752135)
,p_name=>'APEXIR_EDIT_HIGHLIGHT'
,p_message_language=>'pt-br'
,p_message_text=>'Editar Destaque'
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141672146843752143)
,p_name=>'APEXIR_EDIT_PIVOT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Editar Tabela Din\00E2mica')
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141631592560752131)
,p_name=>'APEXIR_EDIT_REPORT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Editar Relat\00F3rio')
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141720725434752157)
,p_name=>'APEXIR_EMAIL'
,p_message_language=>'pt-br'
,p_message_text=>'E-mail'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141592997229752119)
,p_name=>'APEXIR_EMAIL_ADDRESS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Endere\00E7o de E-mail')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141721030204752157)
,p_name=>'APEXIR_EMAIL_BCC'
,p_message_language=>'pt-br'
,p_message_text=>'Cco'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141721207033752157)
,p_name=>'APEXIR_EMAIL_BODY'
,p_message_language=>'pt-br'
,p_message_text=>'Corpo'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141720974349752157)
,p_name=>'APEXIR_EMAIL_CC'
,p_message_language=>'pt-br'
,p_message_text=>'Cc'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141721794059752157)
,p_name=>'APEXIR_EMAIL_FREQUENCY'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Frequ\00EAncia')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141598148802752121)
,p_name=>'APEXIR_EMAIL_NOT_CONFIGURED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O e-mail n\00E3o foi configurado para este aplicativo. Entre em contato com o administrador.')
,p_version_scn=>2705352
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141695587864752150)
,p_name=>'APEXIR_EMAIL_REQUIRED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O Endere\00E7o de E-mail deve ser especificado.')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141721333266752157)
,p_name=>'APEXIR_EMAIL_SEE_ATTACHED'
,p_message_language=>'pt-br'
,p_message_text=>'Consulte anexo'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141721133213752157)
,p_name=>'APEXIR_EMAIL_SUBJECT'
,p_message_language=>'pt-br'
,p_message_text=>'Assunto'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141696540818752150)
,p_name=>'APEXIR_EMAIL_SUBJECT_REQUIRED'
,p_message_language=>'pt-br'
,p_message_text=>'O Assunto do E-mail deve ser especificado.'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141720837341752157)
,p_name=>'APEXIR_EMAIL_TO'
,p_message_language=>'pt-br'
,p_message_text=>'Para'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141599921121752121)
,p_name=>'APEXIR_ENABLED'
,p_message_language=>'pt-br'
,p_message_text=>'Ativado'
,p_version_scn=>2705352
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141644023283752135)
,p_name=>'APEXIR_ENABLE_DISABLE_ALT'
,p_message_language=>'pt-br'
,p_message_text=>'Ativar/Desativar'
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141643551896752134)
,p_name=>'APEXIR_ERROR_LANDMARK'
,p_message_language=>'pt-br'
,p_message_text=>'Erro! %0'
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141643138995752134)
,p_name=>'APEXIR_EXAMPLES'
,p_message_language=>'pt-br'
,p_message_text=>'Exemplos'
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141643984170752135)
,p_name=>'APEXIR_EXAMPLES_WITH_COLON'
,p_message_language=>'pt-br'
,p_message_text=>'Exemplos:'
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141605455821752123)
,p_name=>'APEXIR_EXCLUDE_NULL'
,p_message_language=>'pt-br'
,p_message_text=>'Excluir Valores Nulos'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141644557639752135)
,p_name=>'APEXIR_EXPAND_COLLAPSE_ALT'
,p_message_language=>'pt-br'
,p_message_text=>'Expandir/Contrair'
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141642131162752134)
,p_name=>'APEXIR_EXPRESSION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Express\00E3o')
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141627092772752129)
,p_name=>'APEXIR_FILTER'
,p_message_language=>'pt-br'
,p_message_text=>'Filtrar'
,p_is_js_message=>true
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141638131278752133)
,p_name=>'APEXIR_FILTERS'
,p_message_language=>'pt-br'
,p_message_text=>'Filtros'
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141648820195752136)
,p_name=>'APEXIR_FILTER_EXPRESSION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Express\00E3o de Filtro')
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141747065711752165)
,p_name=>'APEXIR_FILTER_EXPR_TOO_LONG'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A express\00E3o de filtro \00E9 muito longa.')
,p_version_scn=>2705379
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141591749289752119)
,p_name=>'APEXIR_FILTER_SUGGESTIONS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Filtrar sugest\00F5es')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141648764183752136)
,p_name=>'APEXIR_FILTER_TYPE'
,p_message_language=>'pt-br'
,p_message_text=>'Tipo de Filtro'
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141644779295752135)
,p_name=>'APEXIR_FINDER_ALT'
,p_message_language=>'pt-br'
,p_message_text=>'Selecionar colunas para pesquisa'
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141627357301752130)
,p_name=>'APEXIR_FLASHBACK'
,p_message_language=>'pt-br'
,p_message_text=>'Flashback'
,p_is_js_message=>true
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141641944628752134)
,p_name=>'APEXIR_FLASHBACK_DESCRIPTION'
,p_message_language=>'pt-br'
,p_message_text=>'Uma consulta de flashback permite exibir os dados conforme existiam em um momento anterior.'
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141695942939752150)
,p_name=>'APEXIR_FLASHBACK_LABEL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Dura\00E7\00E3o do Flashback')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141697388916752150)
,p_name=>'APEXIR_FORMAT'
,p_message_language=>'pt-br'
,p_message_text=>'Formato'
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141623122613752128)
,p_name=>'APEXIR_FORMAT_MASK'
,p_message_language=>'pt-br'
,p_message_text=>unistr('M\00E1scara de Formato %0')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141634865837752132)
,p_name=>'APEXIR_FUNCTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Fun\00E7\00E3o')
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141642691327752134)
,p_name=>'APEXIR_FUNCTIONS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Fun\00E7\00F5es %0')
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141720336593752157)
,p_name=>'APEXIR_FUNCTIONS_OPERATORS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Fun\00E7\00F5es / Operadores')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141634505340752132)
,p_name=>'APEXIR_FUNCTION_N'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Fun\00E7\00E3o %0')
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141626887330752129)
,p_name=>'APEXIR_GO'
,p_message_language=>'pt-br'
,p_message_text=>'Ir'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141600471406752122)
,p_name=>'APEXIR_GREEN'
,p_message_language=>'pt-br'
,p_message_text=>'verde'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141645431820752135)
,p_name=>'APEXIR_GROUPBY_COLUMNS'
,p_message_language=>'pt-br'
,p_message_text=>'Agrupar por Colunas'
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141645596233752135)
,p_name=>'APEXIR_GROUPBY_FUNCTIONS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Agrupar por Fun\00E7\00F5es')
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141580751873752116)
,p_name=>'APEXIR_GROUP_BY'
,p_message_language=>'pt-br'
,p_message_text=>'Agrupar por'
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141721480384752157)
,p_name=>'APEXIR_GROUP_BY_COLUMN'
,p_message_language=>'pt-br'
,p_message_text=>'Agrupar por Coluna %0'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141676972154752144)
,p_name=>'APEXIR_GROUP_BY_COL_NOT_NULL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('\00C9 necess\00E1rio especificar a coluna Agrupar por.')
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141688066760752148)
,p_name=>'APEXIR_GROUP_BY_MAX_ROW_CNT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A contagem m\00E1xima de linha de uma consulta Agrupar por limita o n\00FAmero de linhas na consulta-base, n\00E3o o n\00FAmero de linhas exibidas. Sua consulta-base excede a contagem de linhas m\00E1xima de %0. Aplique um filtro para reduzir o n\00FAmero de registros em su')
||'a consulta-base.'
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141668266039752142)
,p_name=>'APEXIR_GROUP_BY_SORT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Agrupar por Classifica\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141724930926752158)
,p_name=>'APEXIR_GROUP_BY_SORT_ORDER'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Agrupar por Ordem de Classifica\00E7\00E3o')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141569841969752113)
,p_name=>'APEXIR_GROUP_BY_VIEW_OF'
,p_message_language=>'pt-br'
,p_message_text=>'View Agrupar por de %0'
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141605864229752123)
,p_name=>'APEXIR_HCOLUMN'
,p_message_language=>'pt-br'
,p_message_text=>'Coluna Horizontal'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141639846412752133)
,p_name=>'APEXIR_HELP'
,p_message_language=>'pt-br'
,p_message_text=>'Ajuda'
,p_is_js_message=>true
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141631601319752131)
,p_name=>'APEXIR_HELP_01'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Os relat\00F3rios interativos permitem que os usu\00E1rios finais personalizem os relat\00F3rios. Os usu\00E1rios podem alterar o layout de dados do relat\00F3rio, selecionando colunas, aplicando filtros, destacando e classificando. Os usu\00E1rios tamb\00E9m podem definir queb')
||unistr('ras, agrega\00E7\00F5es, gr\00E1ficos, agrupar por e adicionar seus pr\00F3prios c\00E1lculos. Os usu\00E1rios tamb\00E9m podem configurar uma inscri\00E7\00E3o, de forma que uma vers\00E3o HTML do relat\00F3rio seja enviada por e-mail para eles em um intervalo designado. Os usu\00E1rios podem cri')
||unistr('ar diversas varia\00E7\00F5es de um relat\00F3rio e salv\00E1-las como relat\00F3rios nomeados, para visualiza\00E7\00E3o p\00FAblica ou privada.'),
'<p/>',
unistr('As se\00E7\00F5es a seguir resumem formas de personalizar um relat\00F3rio interativo. Para saber mais, consulte "Using Interactive Reports" no <i>Oracle APEX End User''s Guide</i>.')))
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141638720722752133)
,p_name=>'APEXIR_HELP_ACTIONS_MENU'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O menu A\00E7\00F5es aparece \00E0 direita do bot\00E3o Ir na barra de Pesquisa. Use este menu para personalizar um relat\00F3rio interativo.')
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141632423012752131)
,p_name=>'APEXIR_HELP_AGGREGATE'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Agregados s\00E3o c\00E1lculos matem\00E1ticos realizados em uma coluna. Os agregados s\00E3o exibidos depois de cada interrup\00E7\00E3o de controle e no final do relat\00F3rio na coluna onde s\00E3o definidos. As op\00E7\00F5es incluem:'),
'<p>',
'</p><ul>',
unistr('<li><strong>Agrega\00E7\00E3o</strong> permite selecionar uma agrega\00E7\00E3o previamente definida para editar.</li>'),
unistr('<li><strong>Fun\00E7\00E3o</strong> \00E9 a fun\00E7\00E3o a realizar (por exemplo, SUM, MIN).</li>'),
unistr('<li><strong>Coluna</strong> \00E9 usado para selecionar a coluna \00E0 qual aplicar a fun\00E7\00E3o'),
unistr(' matem\00E1tica. S\00F3 s\00E3o exibidas colunas num\00E9ricas.</li>'),
'</ul>'))
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141632528911752131)
,p_name=>'APEXIR_HELP_CHART'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Voc\00EA pode definir um gr\00E1fico por relat\00F3rio salvo. Depois'),
unistr(' de definido, voc\00EA pode alternar entre as views de gr\00E1fico e de relat\00F3rio, usando os \00EDcones de view da barra de Pesquisa.'),
unistr('As op\00E7\00F5es incluem:'),
'<p>',
'</p><ul>',
unistr('O <li><strong>Tipo de Gr\00E1fico</strong> identifica o tipo de gr\00E1fico a incluir.'),
'Selecione entre barras horizontais barras verticais, pizza ou linhas.</li>',
'<li><strong>Label</strong> permite selecionar a coluna a ser usada como label.</li>',
unistr('<li><strong>T\00EDtulo do Eixo do Label</strong> \00E9 o t\00EDtulo exibido no eixo associado \00E0 coluna selecionada para'),
unistr(' o Label. Essa op\00E7\00E3o n\00E3o est\00E1 dispon\00EDvel para gr\00E1fico de pizza.</li>'),
'<li><strong>Valor</strong> permite selecionar a coluna a usar como o valor. Se sua',
unistr(' fun\00E7\00E3o for COUNT, n\00E3o \00E9 necess\00E1rio selecionar um Valor.</li>'),
unistr('<li><strong>T\00EDtulo do Eixo do Valor</strong> \00E9 o t\00EDtulo exibido no eixo associado \00E0'),
unistr(' coluna selecionada para Valor. Indispon\00EDvel para gr\00E1fico de pizza.</li>'),
unistr('<li><strong>Fun\00E7\00E3o</strong> \00E9 uma fun\00E7\00E3o opcional a ser executada na coluna selecionada para Valor.</li>'),
unistr('<li><strong>Classifica\00E7\00E3o</strong> permite classificar o conjunto de resultados.</li></ul>')))
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141631812616752131)
,p_name=>'APEXIR_HELP_COLUMN_HEADING_MENU'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Clicar em qualquer cabe\00E7alho de coluna exp\00F5e um menu do cabe\00E7alho de coluna. As op\00E7\00F5es incluem:'),
'<p></p>',
'<ul>',
unistr('O \00EDcone <li><strong>Classificar por Ordem Crescente</strong> ordena o relat\00F3rio pela coluna em ordem crescente.</li>'),
unistr('O \00EDcone <li><strong>Classificar por Ordem Decrescente</strong> ordena o relat\00F3rio pela coluna em ordem decrescente.</li>'),
unistr('A op\00E7\00E3o <li><strong>Ocultar Coluna</strong> oculta a coluna. Nem todas as colunas podem ser ocultadas. Se uma coluna n\00E3o puder ser ocultada, n\00E3o haver\00E1 \00EDcone Ocultar Coluna.</li>'),
unistr('A op\00E7\00E3o <li><strong>Quebrar Coluna</strong> cria um grupo de quebra na coluna. Com isso, a coluna \00E9 retirada do relat\00F3rio como um registro-mestre.</li>'),
unistr('A op\00E7\00E3o <li><strong>Informa\00E7\00F5es da Coluna</strong> exibe texto de ajuda sobre a coluna, se dispon\00EDvel.</li>'),
unistr('A op\00E7\00E3o <li><strong>\00C1rea de Texto</strong> \00E9 usada para informar crit\00E9rios de pesquisa que n\00E3o diferenciam mai\00FAsculas de min\00FAsculas'),
unistr('(n\00E3o h\00E1 necessidade de caracteres curinga). A inser\00E7\00E3o de um valor reduz a lista de'),
unistr('valores na parte inferior do menu. Voc\00EA pode ent\00E3o selecionar um valor na'),
unistr('parte inferior e o valor selecionado ser\00E1 criado como um filtro usando ''='''),
unistr('(por exemplo, <code>column = ''ABC''</code>). Como alternativa, voc\00EA poder\00E1 clicar no \00EDcone da Lanterna e informar um valor que ser\00E1 criado como um filtro com o modificador ''LIKE'''),
'(por exemplo, <code>column LIKE ''%ABC%''</code>).</li>',
unistr('A op\00E7\00E3o <li><strong>Lista de Valores \00DAnicos</strong> cont\00E9m os 500 primeiros valores \00FAnicos'),
unistr('que atendem a seus crit\00E9rios de filtro. Se a primeira coluna for uma data, ser\00E1'),
unistr('exibida uma lista de faixas de datas. Se voc\00EA selecionar um valor, ser\00E1 criado um'),
'filtro usando ''='' (por exemplo, <code>column = ''ABC''</code>).</li>',
'</ul>'))
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141632364683752131)
,p_name=>'APEXIR_HELP_COMPUTE'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Permite que voc\00EA adicione colunas calculadas a seu relat\00F3rio. Podem ser c\00E1lculos matem\00E1ticos (por exemplo, <code>NBR_HOURS/24</code>) ou fun\00E7\00F5es padr\00E3o do sistema Oracle'),
unistr('aplicadas a colunas existentes. Algumas s\00E3o exibidas como exemplo; outras (como <code>TO_DATE)</code>, tamb\00E9m podem ser usadas). As op\00E7\00F5es incluem:'),
'<p></p>',
'<ul>',
unistr('<li><strong>C\00E1lculo</strong> permite selecionar um c\00E1lculo previamente definido para editar.</li>'),
unistr('<li><strong>Cabe\00E7alho da Coluna</strong> \00E9 o cabe\00E7alho da nova coluna.</li>'),
unistr('<li><strong>M\00E1scara de Formato</strong> \00E9 uma m\00E1scara de formato do sistema Oracle a ser aplicada \00E0 coluna (por exemplo,S9999).</li>'),
unistr('<li><strong>C\00E1lculo</strong> \00E9 o c\00E1lculo a ser feito, no qual as colunas s\00E3o referenciadas usando os aliases exibidos.</li>'),
'</ul>',
unistr('<p>Abaixo do c\00E1lculo, as colunas em sua consulta s\00E3o exibidas com'),
unistr('seus aliases associados. Clicar no nome ou no alias da coluna a incluir\00E1'),
unistr('no C\00E1lculo. Junto \00E0s Colunas est\00E1 um teclado. Ele funciona como'),
unistr('um atalho para as teclas mais usadas. \00C0 extrema direita est\00E3o as Fun\00E7\00F5es.</p>'),
unistr('<p>O seguinte exemplo de c\00E1lculo demonstra como exibir a remunera\00E7\00E3o total:</p>'),
'<pre>CASE WHEN A = ''SALES'' THEN B + C ELSE B END</pre>',
unistr('(em que A \00E9 ORGANIZATION, B \00E9 SALARY e C \00E9 COMMISSION)'),
''))
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141638885378752133)
,p_name=>'APEXIR_HELP_CONTROL_BREAK'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Usado para criar um grupo de interrup\00E7\00E3o em uma ou mais colunas. Isso retira as colunas do relat\00F3rio interativo e as exibe como um registro mestre.')
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141633076863752131)
,p_name=>'APEXIR_HELP_DETAIL_VIEW'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Para exibir os detalhes de uma linha por vez, clique no \00EDcone view de uma linha na linha que deseja exibir. Se estiver dispon\00EDvel, a view de uma linha sempre ser\00E1 a primeira coluna. Dependendo da personaliza\00E7\00E3o do relat\00F3rio interativo, a view de uma ')
||unistr('linha poder\00E1 ser a view padr\00E3o ou uma p\00E1gina personalizada que permita atualiza\00E7\00E3o.')
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141632907972752131)
,p_name=>'APEXIR_HELP_DOWNLOAD'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Permite fazer download do atual conjunto de resultados. Os formatos de download incluem PDF, Excel, HTML e CSV. Dependendo do formato selecionado, as op\00E7\00F5es de download ser\00E3o diferentes. Todos os formatos tamb\00E9m podem ser enviados como E-Mail.')
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141632002218752131)
,p_name=>'APEXIR_HELP_FILTER'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Foca o relat\00F3rio adicionando ou modificando a cl\00E1usula <code>WHERE</code> na consulta. Voc\00EA pode filtrar por coluna ou por linha.  '),
unistr('<p>Se filtrar por coluna, selecione uma coluna (n\00E3o precisa ser a que est\00E1 exibida), selecione um operador Oracle padr\00E3o  (=, !=, n\00E3o em, entre) e informe uma express\00E3o a ser comparada. As express\00F5es n\00E3o diferenciam mai\00FAsculas e min\00FAsculas. Use  % co')
||'mo curinga (por exemplo, <code>STATE_NAME',
'like A%)</code>.</p>',
unistr('<p>Se voc\00EA filtrar por linha, voc\00EA pode criar cl\00E1usulas <code>WHERE</code> complexas usando aliases da coluna e quaisquer fun\00E7\00F5es ou operadores Oracle (por exemplo, <code>G = ''VA'' ou G = ''CT''</code>, onde'),
unistr('<code>G</code> \00E9 o alias de <code>CUSTOMER_STATE</code>).</p>'),
''))
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141632657989752131)
,p_name=>'APEXIR_HELP_FLASHBACK'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Uma consulta de flashback permite exibir os dados conforme existiam em um momento anterior. O per\00EDodo padr\00E3o de flashback \00E9 de 3 horas (ou 180 minutos) mas o valor real difere de cada banco de dados.')
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141697208448752150)
,p_name=>'APEXIR_HELP_FORMAT'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>O formato permite personalizar a exibi\00E7\00E3o do relat\00F3rio.'),
unistr('O formato cont\00E9m o seguinte submenu:</p>'),
'<ul><li>Classificar</li>',
'<li>Quebras de Controle</li>',
'<li>Destaque</li>',
'<li>Calcular</li>',
'<li>Agregar</li>',
unistr('<li>Gr\00E1fico</li>'),
'<li>Agrupar por</li>',
unistr('<li>Piv\00F4</li>'),
'</ul>',
''))
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141695465335752150)
,p_name=>'APEXIR_HELP_GROUP_BY'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Voc\00EA pode definir uma view Agrupar por para cada relat\00F3rio salvo.'),
unistr('Depois de definido, \00E9 poss\00EDvel alternar entre as views e relat\00F3rios Agrupar por'),
unistr('usando \00EDcones de views da barra de Pesquisa. Para criar uma view Agrupar por,'),
'selecione:',
'<p></p><ul>',
unistr('<li>as colunas nas quais ser\00E3o agrupadas</li>'),
unistr('<li>as colunas a serem agregadas com a fun\00E7\00E3o a ser executada (m\00E9dia, soma, contagem etc.)</li>'),
'</ul>'))
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141632216544752131)
,p_name=>'APEXIR_HELP_HIGHLIGHT'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Permite que voc\00EA defina um filtro. As linhas que atendem ao crit\00E9rio do filtro s\00E3o destacadas usando as caracter\00EDsticas associadas ao filtro. As op\00E7\00F5es incluem:</p>'),
'<ul>',
unistr('<li><strong>Nome</strong> \00E9 usado apenas para exibi\00E7\00E3o.</li>'),
unistr('<li><strong>Sequ\00EAncia</strong> identifica a sequ\00EAncia na qual as regras s\00E3o avaliadas.</li>'),
unistr('<li><strong>Ativado</strong> identifica se uma regra est\00E1 ativada ou desativada.</li>'),
unistr('<li><strong>Tipo de Destaque</strong> identifica se a linha ou c\00E9lula deve ser'),
unistr('destacada. Se a C\00E9lula for selecionada, a coluna referenciada na'),
unistr('Condi\00E7\00E3o de Destaque ser\00E1 destacada.</li>'),
unistr('<li><strong>Cor de Fundo</strong> \00E9 a nova cor do fundo da \00E1rea destacada.</li>'),
unistr('<li><strong>Cor do Texto</strong> \00E9 a nova cor do texto na \00E1rea destacada.</li>'),
unistr('<li><strong>Condi\00E7\00E3o de Destaque</strong> define sua condi\00E7\00E3o de filtro.</li>'),
'</ul>',
''))
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141525685830752100)
,p_name=>'APEXIR_HELP_PIVOT'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Voc\00EA pode definir uma view Piv\00F4 por relat\00F3rio salvo. Depois de definido, \00E9 poss\00EDvel alternar entre as views de relat\00F3rio e piv\00F4 usando \00EDcones de views da barra de Pesquisa. Para criar uma view Piv\00F4, selecione:'),
'<p></p>',
'<ul>',
unistr('<li>as colunas para criar uma view din\00E2mica</li>'),
'<li>as colunas a serem exibidas como linhas</li>',
unistr('<li>as colunas a serem agregadas com a fun\00E7\00E3o a ser executada (m\00E9dia, soma, contagem etc.)</li>'),
'</ul>'))
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141643347692752134)
,p_name=>'APEXIR_HELP_REPORT_SETTINGS'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Se voc\00EA personalizar um relat\00F3rio interativo, as configura\00E7\00F5es do relat\00F3rio ser\00E3o exibidas'),
unistr('abaixo da barra de Pesquisa e acima do relat\00F3rio. Essa \00E1rea pode ser contra\00EDda e expandida usando o \00EDcone \00E0 esquerda.'),
'<p>',
unistr('Para cada defini\00E7\00E3o de relat\00F3rio, \00E9 poss\00EDvel:'),
'</p><ul>',
unistr('<li>Editar uma defini\00E7\00E3o clicando no nome.</li>'),
unistr('<li>Desativar/Ativar uma defini\00E7\00E3o, desmarcando ou marcando a caixa de sele\00E7\00E3o Ativar/Desativar. Isso \00E9 usado para ativar/desativar temporariamente uma defini\00E7\00E3o.</li>'),
unistr('<li>Remover uma defini\00E7\00E3o clicando no \00EDcone Remover.</li>'),
'</ul>',
unistr('<p>Se voc\00EA criou um gr\00E1fico ou agrupamento, poder\00E1 alternar entre eles'),
unistr(' e o relat\00F3rio de base usando os links View de Relat\00F3rio, View de Gr\00E1fico, Piv\00F4 e'),
unistr(' Agrupar por mostrados \00E0 direita. Se estiver exibindo um gr\00E1fico ou'),
unistr(' agrupamento, tamb\00E9m poder\00E1 usar o link Editar para editar as defini\00E7\00F5es.</p>'),
''))
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141632806918752131)
,p_name=>'APEXIR_HELP_RESET'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Redefine o relat\00F3rio \00E0s configura\00E7\00F5es padr\00E3o, removendo qualquer personaliza\00E7\00E3o realizada.')
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141697539602752150)
,p_name=>'APEXIR_HELP_ROWS_PER_PAGE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Define o n\00FAmero de registros para exibi\00E7\00E3o por p\00E1gina.')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141632730146752131)
,p_name=>'APEXIR_HELP_SAVE_REPORT'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Salva o relat\00F3rio personalizado para uso futuro. Voc\00EA fornece um nome e uma descri\00E7\00E3o opcional e pode tornar o relat\00F3rio acess\00EDvel ao p\00FAblico (isto \00E9, todos os usu\00E1rios que podem acessar o relat\00F3rio padr\00E3o). Voc\00EA pode salvar quatro tipos de relat\00F3')
||'rios interativos:</p>',
'<ul>',
unistr('<li><strong>Padr\00E3o Principal</strong> (Somente Desenvolvedor). O Padr\00E3o Principal \00E9 o relat\00F3rio que \00E9 exibido inicialmente. Os relat\00F3rios Padr\00E3o Principal n\00E3o podem ser renomeados ou exclu\00EDdos.</li>'),
unistr('<li><strong>Relat\00F3rio Alternativo</strong> (Somente Desenvolvedor). Permite que os desenvolvedores criem v\00E1rios layouts de relat\00F3rio. Somente os desenvolvedores podem salvar, renomear ou excluir um Relat\00F3rio Alternativo.</li>'),
unistr('<li><strong>Relat\00F3rio P\00FAblico</strong> (Usu\00E1rio final). Pode ser salvo, renomeado ou exclu\00EDdo pelo usu\00E1rio final que o criou. Outros usu\00E1rios podem exibir e salvar o relat\00F3rio como outro relat\00F3rio.</li>'),
unistr('<li><strong>Relat\00F3rio Privado</strong> (Usu\00E1rio final). Somente o usu\00E1rio final que criou o relat\00F3rio pode exibir, salvar, renomear ou excluir o relat\00F3rio.</li>'),
'</ul>',
unistr('<p>Se voc\00EA salvar os relat\00F3rios personalizados, um selector de Relat\00F3rios \00E9 exibido na barra de Pesquisa \00E0 esquerda do selector de Linhas (se este recurso for ativado).</p>'),
''))
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141631794478752131)
,p_name=>'APEXIR_HELP_SEARCH_BAR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Na parte superior de cada p\00E1gina do relat\00F3rio, h\00E1 uma regi\00E3o de pesquisa. A regi\00E3o (ou barra de Pesquisa) apresenta os seguintes recursos:')
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141698118556752151)
,p_name=>'APEXIR_HELP_SEARCH_BAR_ACTIONS_MENU'
,p_message_language=>'pt-br'
,p_message_text=>unistr('<li><strong>Menu A\00E7\00F5es</strong> permite que voc\00EA personalize um relat\00F3rio. Consulte as se\00E7\00F5es as seguir.</li>')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141697696510752150)
,p_name=>'APEXIR_HELP_SEARCH_BAR_FINDER'
,p_message_language=>'pt-br'
,p_message_text=>unistr('<li><strong>\00CDcone Selecionar colunas</strong> permite que voc\00EA identifique qual coluna pesquisar (ou todas).</li>')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141697994498752150)
,p_name=>'APEXIR_HELP_SEARCH_BAR_REPORTS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('<li><strong>Relat\00F3rios</strong> exibe relat\00F3rios privados ou p\00FAblicos padr\00E3o e salvos alternativos.</li>')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141697810940752150)
,p_name=>'APEXIR_HELP_SEARCH_BAR_ROWS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('<li><strong>Linhas</strong> define o n\00FAmero de registros para exibi\00E7\00E3o por p\00E1gina.</li>')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141697738906752150)
,p_name=>'APEXIR_HELP_SEARCH_BAR_TEXTBOX'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<li><strong>\00C1rea de texto</strong> permite que voc\00EA digite os crit\00E9rios de pesquisa que n\00E3o distinguem mai\00FAsculas e min\00FAsculas (caracteres curinga s\00E3o utilizados).</li>'),
unistr('<li><strong>Bot\00E3o Ir</strong> executa a pesquisa. Pressione a tecla Enter para executar tamb\00E9m a pesquisa quando o cursor estiver na \00E1rea de texto da pesquisa.</li>')))
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141698037366752150)
,p_name=>'APEXIR_HELP_SEARCH_BAR_VIEW'
,p_message_language=>'pt-br'
,p_message_text=>unistr('<li><strong>\00CDcones de Exibi\00E7\00E3o</strong> alternam entre as exibi\00E7\00F5es de \00EDcone, relat\00F3rio, detalhes, gr\00E1ficos, agrupar por e piv\00F4 do relat\00F3rio, caso tenham sido definidos.</li>')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141631932938752131)
,p_name=>'APEXIR_HELP_SELECT_COLUMNS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Usado para modificar as colunas exibidas. As colunas \00E0 direita s\00E3o exibidas. As colunas \00E0 esquerda s\00E3o ocultas. Voc\00EA poder\00E1 reordenar as colunas exibidas usando as setas na extremidade direita. As colunas calculadas recebem o prefixo <strong>**</stro')
||'ng>.'
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141632170283752131)
,p_name=>'APEXIR_HELP_SORT'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Usado para alterar a(s) coluna(s) a classificar e determina se',
unistr(' a classifica\00E7\00E3o ser\00E1 em ordem crescente ou decrescente. Tamb\00E9m \00E9 poss\00EDvel especificar como tratar'),
unistr(' os <code>NULOs</code>. A configura\00E7\00E3o padr\00E3o sempre exibe os <code>NULOs</code> por \00FAltimo ou primeiro. A classifica\00E7\00E3o resultante \00E9 exibida \00E0 direita'),
unistr(' dos cabe\00E7alhos das colunas no relat\00F3rio.</p>')))
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141695261086752150)
,p_name=>'APEXIR_HELP_SUBSCRIPTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Ao adicionar uma inscri\00E7\00E3o, voc\00EA fornece um endere\00E7o de e-mail (ou diversos endere\00E7os de e-mail, separados por v\00EDrgulas), o assunto do e-mail, a frequ\00EAncia e as datas inicial e final. Os e-mails resultantes incluem uma vers\00E3o exportada (PDF, Excel, H')
||unistr('TML ou CSV) do relat\00F3rio interativo contendo os dados atuais que usam a defini\00E7\00E3o de relat\00F3rio que estava presente quando a inscri\00E7\00E3o foi adicionada.')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141636810380752132)
,p_name=>'APEXIR_HIDE_COLUMN'
,p_message_language=>'pt-br'
,p_message_text=>'Ocultar Coluna'
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141627281632752130)
,p_name=>'APEXIR_HIGHLIGHT'
,p_message_language=>'pt-br'
,p_message_text=>'Destacar'
,p_is_js_message=>true
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141638333811752133)
,p_name=>'APEXIR_HIGHLIGHTS'
,p_message_language=>'pt-br'
,p_message_text=>'Destaques'
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141608572356752124)
,p_name=>'APEXIR_HIGHLIGHT_CELL_WITH_COLORS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Destacar C\00E9lula, %0 em %1')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141643421936752134)
,p_name=>'APEXIR_HIGHLIGHT_CONDITION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Condi\00E7\00E3o do Destaque')
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141608449573752124)
,p_name=>'APEXIR_HIGHLIGHT_ROW_WITH_COLORS'
,p_message_language=>'pt-br'
,p_message_text=>'Destacar Linha, %0 em %1'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141695814032752150)
,p_name=>'APEXIR_HIGHLIGHT_STYLE'
,p_message_language=>'pt-br'
,p_message_text=>'Estilo do Destaque'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141600058637752121)
,p_name=>'APEXIR_HIGHLIGHT_TYPE'
,p_message_language=>'pt-br'
,p_message_text=>'Tipo de Destaque'
,p_version_scn=>2705352
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141714619635752155)
,p_name=>'APEXIR_HORIZONTAL'
,p_message_language=>'pt-br'
,p_message_text=>'Horizontal'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141743674416752164)
,p_name=>'APEXIR_INACTIVE_SETTING'
,p_message_language=>'pt-br'
,p_message_text=>unistr('1 defini\00E7\00E3o inativa')
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141743714283752164)
,p_name=>'APEXIR_INACTIVE_SETTINGS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 defini\00E7\00F5es inativas')
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141633499319752131)
,p_name=>'APEXIR_INTERACTIVE_REPORT_HELP'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Ajuda de Relat\00F3rio Interativo')
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141644480021752135)
,p_name=>'APEXIR_INVALID'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Inv\00E1lido')
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141637861662752133)
,p_name=>'APEXIR_INVALID_COMPUTATION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Express\00E3o de c\00E1lculo inv\00E1lida. %0')
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141593402440752120)
,p_name=>'APEXIR_INVALID_END_DATE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A data de t\00E9rmino deve ser posterior \00E0 data de in\00EDcio.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141652698971752137)
,p_name=>'APEXIR_INVALID_FILTER'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Express\00E3o de filtro inv\00E1lida. %0')
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141722493762752158)
,p_name=>'APEXIR_INVALID_FILTER_QUERY'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Consulta de filtro inv\00E1lida')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141743818598752164)
,p_name=>'APEXIR_INVALID_SETTING'
,p_message_language=>'pt-br'
,p_message_text=>unistr('1 defini\00E7\00E3o inv\00E1lida')
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141743974019752164)
,p_name=>'APEXIR_INVALID_SETTINGS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 defini\00E7\00F5es inv\00E1lidas')
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141696095370752150)
,p_name=>'APEXIR_IN_MINUTES'
,p_message_language=>'pt-br'
,p_message_text=>'(em minutos)'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141713082310752155)
,p_name=>'APEXIR_IS_IN_THE_LAST'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 est\00E1 no/a(s) \00FAltimo/a(s) %1')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141713249080752155)
,p_name=>'APEXIR_IS_IN_THE_NEXT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 est\00E1 no/a(s) pr\00F3ximo/a(s) %1')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141713118422752155)
,p_name=>'APEXIR_IS_NOT_IN_THE_LAST'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 n\00E3o est\00E1 no/a(s) \00FAltimo/a(s) %1')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141713346012752155)
,p_name=>'APEXIR_IS_NOT_IN_THE_NEXT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 n\00E3o est\00E1 no pr\00F3ximo %1')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141642500754752134)
,p_name=>'APEXIR_KEYPAD'
,p_message_language=>'pt-br'
,p_message_text=>'Teclado'
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141606265307752123)
,p_name=>'APEXIR_LABEL'
,p_message_language=>'pt-br'
,p_message_text=>'Label %0'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141636457634752132)
,p_name=>'APEXIR_LABEL_AXIS_TITLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('T\00EDtulo do Eixo para Label')
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141628797650752130)
,p_name=>'APEXIR_LAST_DAY'
,p_message_language=>'pt-br'
,p_message_text=>unistr('\00DAltimo Dia')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141628949467752130)
,p_name=>'APEXIR_LAST_HOUR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('\00DAltima Hora')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141628424926752130)
,p_name=>'APEXIR_LAST_MONTH'
,p_message_language=>'pt-br'
,p_message_text=>unistr('M\00EAs Passado')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141628528803752130)
,p_name=>'APEXIR_LAST_WEEK'
,p_message_language=>'pt-br'
,p_message_text=>'Semana Passada'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141628692048752130)
,p_name=>'APEXIR_LAST_X_DAYS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('\00DAltimos %0 Dias')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141628860599752130)
,p_name=>'APEXIR_LAST_X_HOURS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('\00DAltimas %0 Horas')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141628291554752130)
,p_name=>'APEXIR_LAST_X_YEARS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('\00DAltimos %0 Anos')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141628369255752130)
,p_name=>'APEXIR_LAST_YEAR'
,p_message_language=>'pt-br'
,p_message_text=>'Ano Passado'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141606159723752123)
,p_name=>'APEXIR_LINE'
,p_message_language=>'pt-br'
,p_message_text=>'Linhas'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141602981512752122)
,p_name=>'APEXIR_LINE_WITH_AREA'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Linha com \00C1rea')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141722334055752158)
,p_name=>'APEXIR_MAP_IT'
,p_message_language=>'pt-br'
,p_message_text=>'Mapear'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141637347667752133)
,p_name=>'APEXIR_MAX_QUERY_COST'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A consulta \00E9 prevista para exceder os recursos m\00E1ximos permitidos. Modifique as configura\00E7\00F5es do relat\00F3rio e tente novamente.')
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141618740865752127)
,p_name=>'APEXIR_MAX_ROW_CNT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A contagem m\00E1xima de linhas deste relat\00F3rio \00E9 %0 linhas. Aplique um filtro para reduzir o n\00FAmero de registros em sua consulta.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141722953988752158)
,p_name=>'APEXIR_MAX_X'
,p_message_language=>'pt-br'
,p_message_text=>unistr('M\00E1ximo %0')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141723146983752158)
,p_name=>'APEXIR_MEDIAN_X'
,p_message_language=>'pt-br'
,p_message_text=>'Mediana %0'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141565469459752111)
,p_name=>'APEXIR_MESSAGE'
,p_message_language=>'pt-br'
,p_message_text=>'Mensagem'
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141623043341752128)
,p_name=>'APEXIR_MIN_AGO'
,p_message_language=>'pt-br'
,p_message_text=>unistr('H\00E1 %0 minutos')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141723041333752158)
,p_name=>'APEXIR_MIN_X'
,p_message_language=>'pt-br'
,p_message_text=>unistr('M\00EDnimo %0')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141722038525752158)
,p_name=>'APEXIR_MONTH'
,p_message_language=>'pt-br'
,p_message_text=>unistr('M\00EAs')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141696488569752150)
,p_name=>'APEXIR_MONTHLY'
,p_message_language=>'pt-br'
,p_message_text=>'Mensalmente'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141635604401752132)
,p_name=>'APEXIR_MOVE'
,p_message_language=>'pt-br'
,p_message_text=>'Mover'
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141635555336752132)
,p_name=>'APEXIR_MOVE_ALL'
,p_message_language=>'pt-br'
,p_message_text=>'Mover Tudo'
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141748746199752165)
,p_name=>'APEXIR_MULTIIR_PAGE_REGION_STATIC_ID_REQUIRED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O ID Est\00E1tico da Regi\00E3o deve ser especificado porque a p\00E1gina cont\00E9m diversos relat\00F3rios interativos.')
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141601626982752122)
,p_name=>'APEXIR_NAME'
,p_message_language=>'pt-br'
,p_message_text=>'Nome'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141631373572752131)
,p_name=>'APEXIR_NEW_AGGREGATION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Nova Agrega\00E7\00E3o')
,p_version_scn=>2705359
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141744576894752164)
,p_name=>'APEXIR_NEW_CATEGORY_LABEL'
,p_message_language=>'pt-br'
,p_message_text=>'Nova Categoria'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141631462231752131)
,p_name=>'APEXIR_NEW_COMPUTATION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Novo C\00E1lculo')
,p_version_scn=>2705359
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141626134957752129)
,p_name=>'APEXIR_NEXT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Pr\00F3ximo')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141629227467752130)
,p_name=>'APEXIR_NEXT_DAY'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Pr\00F3ximo Dia')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141629016042752130)
,p_name=>'APEXIR_NEXT_HOUR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Pr\00F3xima Hora')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141629542325752130)
,p_name=>'APEXIR_NEXT_MONTH'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Pr\00F3ximo M\00EAs')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141629425055752130)
,p_name=>'APEXIR_NEXT_WEEK'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Pr\00F3xima Semana')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141629338766752130)
,p_name=>'APEXIR_NEXT_X_DAYS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Pr\00F3ximos %0 Dias')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141629152708752130)
,p_name=>'APEXIR_NEXT_X_HOURS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Pr\00F3ximas %0 Horas')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141629746489752130)
,p_name=>'APEXIR_NEXT_X_YEARS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Pr\00F3ximos %0 Anos')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141629653040752130)
,p_name=>'APEXIR_NEXT_YEAR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Pr\00F3ximo Ano')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141601955826752122)
,p_name=>'APEXIR_NO'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141644631412752135)
,p_name=>'APEXIR_NONE'
,p_message_language=>'pt-br'
,p_message_text=>'- Nenhum -'
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141695683312752150)
,p_name=>'APEXIR_NOT_VALID_EMAIL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o \00E9 um endere\00E7o de e-mail v\00E1lido.')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141567743377752112)
,p_name=>'APEXIR_NO_COLUMNS_SELECTED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Nenhuma coluna foi selecionada para exibi\00E7\00E3o. Use <strong>Colunas</strong> no Menu A\00E7\00F5es para tornar as colunas vis\00EDveis.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141641120500752134)
,p_name=>'APEXIR_NULLS_ALWAYS_FIRST'
,p_message_language=>'pt-br'
,p_message_text=>'Nulos Sempre em Primeiro'
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141641018735752134)
,p_name=>'APEXIR_NULLS_ALWAYS_LAST'
,p_message_language=>'pt-br'
,p_message_text=>'Nulos Sempre no Final'
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141641516357752134)
,p_name=>'APEXIR_NULL_SORTING'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Classifica\00E7\00E3o Nula %0')
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141637966105752133)
,p_name=>'APEXIR_NUMERIC_FLASHBACK_TIME'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O tempo de flashback deve ser num\00E9rico.')
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141637597103752133)
,p_name=>'APEXIR_NUMERIC_SEQUENCE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A sequ\00EAncia deve ser num\00E9rica.')
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141642082108752134)
,p_name=>'APEXIR_OPERATOR'
,p_message_language=>'pt-br'
,p_message_text=>'Operador'
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141600503514752122)
,p_name=>'APEXIR_ORANGE'
,p_message_language=>'pt-br'
,p_message_text=>'laranja'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141714571712752155)
,p_name=>'APEXIR_ORIENTATION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Orienta\00E7\00E3o')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141602457111752122)
,p_name=>'APEXIR_OTHER'
,p_message_language=>'pt-br'
,p_message_text=>'Outro'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141568605589752112)
,p_name=>'APEXIR_PAGINATION_OF'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Pagina\00E7\00E3o de %0')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141582630070752116)
,p_name=>'APEXIR_PDF_ORIENTATION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Orienta\00E7\00E3o da p\00E1gina')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141583366373752117)
,p_name=>'APEXIR_PDF_ORIENTATION_HORIZONTAL'
,p_message_language=>'pt-br'
,p_message_text=>'Paisagem'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141583408548752117)
,p_name=>'APEXIR_PDF_ORIENTATION_VERTICAL'
,p_message_language=>'pt-br'
,p_message_text=>'Retrato'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141582560582752116)
,p_name=>'APEXIR_PDF_PAGE_SIZE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Tamanho da p\00E1gina')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141583166710752117)
,p_name=>'APEXIR_PDF_PAGE_SIZE_A3'
,p_message_language=>'pt-br'
,p_message_text=>'A3'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141583039291752116)
,p_name=>'APEXIR_PDF_PAGE_SIZE_A4'
,p_message_language=>'pt-br'
,p_message_text=>'A4'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141583265024752117)
,p_name=>'APEXIR_PDF_PAGE_SIZE_CUSTOM'
,p_message_language=>'pt-br'
,p_message_text=>'Personalizado'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141582855409752116)
,p_name=>'APEXIR_PDF_PAGE_SIZE_LEGAL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Of\00EDcio')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141582733300752116)
,p_name=>'APEXIR_PDF_PAGE_SIZE_LETTER'
,p_message_language=>'pt-br'
,p_message_text=>'Carta'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141582956444752116)
,p_name=>'APEXIR_PDF_PAGE_SIZE_TABLOID'
,p_message_language=>'pt-br'
,p_message_text=>'Tabloide'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141723402146752158)
,p_name=>'APEXIR_PERCENT_OF_TOTAL_COUNT_X'
,p_message_language=>'pt-br'
,p_message_text=>'Percentual da Contagem Total %0 (%)'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141722609693752158)
,p_name=>'APEXIR_PERCENT_OF_TOTAL_SUM_X'
,p_message_language=>'pt-br'
,p_message_text=>'Percentual da Soma Total %0 (%)'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141721640625752157)
,p_name=>'APEXIR_PERCENT_TOTAL_COUNT'
,p_message_language=>'pt-br'
,p_message_text=>'Percentual da Contagem Total'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141721545165752157)
,p_name=>'APEXIR_PERCENT_TOTAL_SUM'
,p_message_language=>'pt-br'
,p_message_text=>'Percentual da Soma Total'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141606029766752123)
,p_name=>'APEXIR_PIE'
,p_message_language=>'pt-br'
,p_message_text=>'Pizza'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141671770728752143)
,p_name=>'APEXIR_PIVOT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Tabela Din\00E2mica')
,p_is_js_message=>true
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141673262064752143)
,p_name=>'APEXIR_PIVOT_AGG_NOT_NULL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('\00C9 necess\00E1rio especificar a coluna Agregados.')
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141673495239752143)
,p_name=>'APEXIR_PIVOT_AGG_NOT_ON_ROW_COL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel agregar em uma coluna selecionada como coluna de linha.')
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141672670718752143)
,p_name=>'APEXIR_PIVOT_COLUMNS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Colunas Din\00E2micas')
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141672498271752143)
,p_name=>'APEXIR_PIVOT_COLUMN_N'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Coluna Din\00E2mica %0')
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141673036640752143)
,p_name=>'APEXIR_PIVOT_COLUMN_NOT_NULL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('\00C9 necess\00E1rio especificar a coluna Piv\00F4.')
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141525584208752100)
,p_name=>'APEXIR_PIVOT_MAX_ROW_CNT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A contagem m\00E1xima de linhas de uma consulta de Piv\00F4 limita o n\00FAmero de linhas na consulta-base, n\00E3o o n\00FAmero de linhas exibidas. Sua consulta-base excede a contagem de linhas m\00E1xima de %0. Aplique um filtro para reduzir o n\00FAmero de registros em sua c')
||'onsulta-base.'
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141672924208752143)
,p_name=>'APEXIR_PIVOT_SORT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Classifica\00E7\00E3o Din\00E2mica')
,p_is_js_message=>true
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141638984022752133)
,p_name=>'APEXIR_PIVOT_TOO_MANY_VALUES'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A coluna din\00E2mica cont\00E9m muitos valores distintos - n\00E3o \00E9 poss\00EDvel gerar SQL din\00E2mica.')
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141569944110752113)
,p_name=>'APEXIR_PIVOT_VIEW_OF'
,p_message_language=>'pt-br'
,p_message_text=>unistr('View de tabela din\00E2mica de %0')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141695733294752150)
,p_name=>'APEXIR_PREVIEW'
,p_message_language=>'pt-br'
,p_message_text=>'Visualizar'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141626244500752129)
,p_name=>'APEXIR_PREVIOUS'
,p_message_language=>'pt-br'
,p_message_text=>'Anterior'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141720579350752157)
,p_name=>'APEXIR_PRIMARY'
,p_message_language=>'pt-br'
,p_message_text=>'Principal'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141696766743752150)
,p_name=>'APEXIR_PRIMARY_REPORT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Relat\00F3rio Prim\00E1rio')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141582464393752116)
,p_name=>'APEXIR_PRINT_ACCESSIBLE'
,p_message_language=>'pt-br'
,p_message_text=>'Incluir Tags de Acessibilidade'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141543273690752105)
,p_name=>'APEXIR_PRINT_STRIP_RICH_TEXT'
,p_message_language=>'pt-br'
,p_message_text=>'Remover RTF (Rich Text Format)'
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141651636965752137)
,p_name=>'APEXIR_PRIVATE'
,p_message_language=>'pt-br'
,p_message_text=>'Privado'
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141606634594752123)
,p_name=>'APEXIR_PUBLIC'
,p_message_language=>'pt-br'
,p_message_text=>unistr('P\00FAblico')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141602263535752122)
,p_name=>'APEXIR_RED'
,p_message_language=>'pt-br'
,p_message_text=>'vermelho'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141748627308752165)
,p_name=>'APEXIR_REGION_STATIC_ID_DOES_NOT_EXIST'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O ID Est\00E1tico %0 da Regi\00E3o n\00E3o existe.')
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141635729700752132)
,p_name=>'APEXIR_REMOVE'
,p_message_language=>'pt-br'
,p_message_text=>'Remover'
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141635810273752132)
,p_name=>'APEXIR_REMOVE_ALL'
,p_message_language=>'pt-br'
,p_message_text=>'Remover Tudo'
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141744026251752164)
,p_name=>'APEXIR_REMOVE_CHART'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Remover Gr\00E1fico')
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141635326796752132)
,p_name=>'APEXIR_REMOVE_CONTROL_BREAK'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Remover Interrup\00E7\00E3o de Controle')
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141635014494752132)
,p_name=>'APEXIR_REMOVE_FILTER'
,p_message_language=>'pt-br'
,p_message_text=>'Remover Filtro'
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141635166136752132)
,p_name=>'APEXIR_REMOVE_FLASHBACK'
,p_message_language=>'pt-br'
,p_message_text=>'Remover Flashback'
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141744131122752164)
,p_name=>'APEXIR_REMOVE_GROUP_BY'
,p_message_language=>'pt-br'
,p_message_text=>'Remover Grupo Por'
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141635459281752132)
,p_name=>'APEXIR_REMOVE_HIGHLIGHT'
,p_message_language=>'pt-br'
,p_message_text=>'Remover Destaque'
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141744280400752164)
,p_name=>'APEXIR_REMOVE_PIVOT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Remover Tabela Din\00E2mica')
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141725375013752158)
,p_name=>'APEXIR_REMOVE_REPORT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Remover Relat\00F3rio')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141707103451752153)
,p_name=>'APEXIR_RENAME_DEFAULT_REPORT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Renomear Relat\00F3rio Padr\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141644921047752135)
,p_name=>'APEXIR_RENAME_REPORT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Renomear Relat\00F3rio')
,p_is_js_message=>true
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141626510141752129)
,p_name=>'APEXIR_REPORT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Relat\00F3rio')
,p_is_js_message=>true
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141723552312752158)
,p_name=>'APEXIR_REPORTS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Relat\00F3rios')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141598733365752121)
,p_name=>'APEXIR_REPORT_ALIAS_DOES_NOT_EXIST'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O relat\00F3rio Interativo salvo com o alias %0 n\00E3o existe.')
,p_version_scn=>2705352
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141651971990752137)
,p_name=>'APEXIR_REPORT_DOES_NOT_EXIST'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O relat\00F3rio n\00E3o existe.')
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141598883596752121)
,p_name=>'APEXIR_REPORT_ID_DOES_NOT_EXIST'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O ID do Relat\00F3rio Interativo Salvo %0 n\00E3o existe.')
,p_version_scn=>2705352
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141643297437752134)
,p_name=>'APEXIR_REPORT_SETTINGS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Defini\00E7\00F5es do Relat\00F3rio')
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141567464251752112)
,p_name=>'APEXIR_REPORT_SETTINGS_OF'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Defini\00E7\00F5es de relat\00F3rio de %0')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141623516255752128)
,p_name=>'APEXIR_REPORT_VIEW'
,p_message_language=>'pt-br'
,p_message_text=>unistr('View de Relat\00F3rio')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141627731712752130)
,p_name=>'APEXIR_RESET'
,p_message_language=>'pt-br'
,p_message_text=>'Redefinir'
,p_is_js_message=>true
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141606813707752124)
,p_name=>'APEXIR_RESET_CONFIRM'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Restaurar o relat\00F3rio para as configura\00E7\00F5es padr\00E3o.')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141602050223752122)
,p_name=>'APEXIR_ROW'
,p_message_language=>'pt-br'
,p_message_text=>'Linha'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141719677451752157)
,p_name=>'APEXIR_ROWID_NOT_SUPPORTED_FOR_WEBSOURCE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Voc\00EA n\00E3o pode usar ROWID como a coluna de chave prim\00E1ria para uma Origem de Dados REST.')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141634461463752132)
,p_name=>'APEXIR_ROWS'
,p_message_language=>'pt-br'
,p_message_text=>'Linhas'
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141697485368752150)
,p_name=>'APEXIR_ROWS_PER_PAGE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Linhas Por P\00E1gina')
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141672733082752143)
,p_name=>'APEXIR_ROW_COLUMNS'
,p_message_language=>'pt-br'
,p_message_text=>'Colunas de Linhas'
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141672533484752143)
,p_name=>'APEXIR_ROW_COLUMN_N'
,p_message_language=>'pt-br'
,p_message_text=>'Coluna de Linha %0'
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141673135686752143)
,p_name=>'APEXIR_ROW_COLUMN_NOT_NULL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('\00C9 necess\00E1rio especificar a coluna Linhas.')
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141673376942752143)
,p_name=>'APEXIR_ROW_COL_DIFF_FROM_PIVOT_COL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A coluna de linhas deve ser diferente da coluna de piv\00F4s.')
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141648934798752136)
,p_name=>'APEXIR_ROW_FILTER'
,p_message_language=>'pt-br'
,p_message_text=>'Filtro de Linha'
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141623671213752128)
,p_name=>'APEXIR_ROW_OF'
,p_message_language=>'pt-br'
,p_message_text=>'Linha %0 de %1'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141627961638752130)
,p_name=>'APEXIR_ROW_TEXT_CONTAINS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Texto da linha cont\00E9m')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141601381465752122)
,p_name=>'APEXIR_SAVE'
,p_message_language=>'pt-br'
,p_message_text=>'Salvar'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141638544957752133)
,p_name=>'APEXIR_SAVED_REPORT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Relat\00F3rio Salvo')
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141638424288752133)
,p_name=>'APEXIR_SAVED_REPORT_MSG'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Relat\00F3rio Salvo = "%0"')
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141640691278752134)
,p_name=>'APEXIR_SAVE_DEFAULT_CONFIRM'
,p_message_language=>'pt-br'
,p_message_text=>unistr('As configura\00E7\00F5es atuais do relat\00F3rio ser\00E3o usadas como padr\00E3o para todos os usu\00E1rios.')
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141707030503752153)
,p_name=>'APEXIR_SAVE_DEFAULT_REPORT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Salvar Relat\00F3rio Padr\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141627624840752130)
,p_name=>'APEXIR_SAVE_REPORT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Salvar Relat\00F3rio')
,p_is_js_message=>true
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141744422992752164)
,p_name=>'APEXIR_SAVE_REPORT_DEFAULT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Salvar Relat\00F3rio*')
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141698476989752151)
,p_name=>'APEXIR_SEARCH'
,p_message_language=>'pt-br'
,p_message_text=>'Pesquisar'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141633354195752131)
,p_name=>'APEXIR_SEARCH_BAR'
,p_message_language=>'pt-br'
,p_message_text=>'Barra de Pesquisa'
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141566784131752112)
,p_name=>'APEXIR_SEARCH_BAR_OF'
,p_message_language=>'pt-br'
,p_message_text=>'Barra de pesquisa de %0'
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141744327324752164)
,p_name=>'APEXIR_SEARCH_COLUMN'
,p_message_language=>'pt-br'
,p_message_text=>'Pesquisar: %0'
,p_is_js_message=>true
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141703954243752152)
,p_name=>'APEXIR_SEARCH_REPORT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Relat\00F3rio de Pesquisa')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141687961249752147)
,p_name=>'APEXIR_SELECTED_COLUMNS'
,p_message_language=>'pt-br'
,p_message_text=>'Colunas Selecionadas'
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141603031990752122)
,p_name=>'APEXIR_SELECT_COLUMN'
,p_message_language=>'pt-br'
,p_message_text=>'- Selecionar Coluna -'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141626935552752129)
,p_name=>'APEXIR_SELECT_COLUMNS'
,p_message_language=>'pt-br'
,p_message_text=>'Selecionar Colunas'
,p_is_js_message=>true
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141606570062752123)
,p_name=>'APEXIR_SELECT_FUNCTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('- Selecionar Fun\00E7\00E3o -')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141634177709752132)
,p_name=>'APEXIR_SELECT_GROUP_BY_COLUMN'
,p_message_language=>'pt-br'
,p_message_text=>'- Selecionar Grupo por Coluna -'
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141672201238752143)
,p_name=>'APEXIR_SELECT_PIVOT_COLUMN'
,p_message_language=>'pt-br'
,p_message_text=>unistr('- Selecionar Coluna por Piv\00F4 -')
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141722528569752158)
,p_name=>'APEXIR_SELECT_ROW'
,p_message_language=>'pt-br'
,p_message_text=>'Selecionar Linha'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141672350946752143)
,p_name=>'APEXIR_SELECT_ROW_COLUMN'
,p_message_language=>'pt-br'
,p_message_text=>'- Selecionar Coluna de Linha -'
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141553876107752108)
,p_name=>'APEXIR_SEND'
,p_message_language=>'pt-br'
,p_message_text=>'Enviar'
,p_is_js_message=>true
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141576393319752115)
,p_name=>'APEXIR_SEND_AS_EMAIL'
,p_message_language=>'pt-br'
,p_message_text=>'Enviar como E-mail'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141601733025752122)
,p_name=>'APEXIR_SEQUENCE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Sequ\00EAncia')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141627168705752130)
,p_name=>'APEXIR_SORT'
,p_message_language=>'pt-br'
,p_message_text=>'Classificar'
,p_is_js_message=>true
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141636697158752132)
,p_name=>'APEXIR_SORT_ASCENDING'
,p_message_language=>'pt-br'
,p_message_text=>'Classificar por Ordem Crescente'
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141636702437752132)
,p_name=>'APEXIR_SORT_DESCENDING'
,p_message_language=>'pt-br'
,p_message_text=>'Classificar por Ordem Decrescente'
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141724739524752158)
,p_name=>'APEXIR_SORT_ORDER'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Ordem de Classifica\00E7\00E3o')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141631086309752131)
,p_name=>'APEXIR_SPACE_AS_IN_ONE_EMPTY_STRING'
,p_message_language=>'pt-br'
,p_message_text=>unistr('espa\00E7o')
,p_version_scn=>2705359
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141642286831752134)
,p_name=>'APEXIR_STATUS'
,p_message_language=>'pt-br'
,p_message_text=>'Status %0'
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141696140622752150)
,p_name=>'APEXIR_SUBSCRIPTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Inscri\00E7\00E3o')
,p_is_js_message=>true
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141721976254752157)
,p_name=>'APEXIR_SUBSCRIPTION_ENDING'
,p_message_language=>'pt-br'
,p_message_text=>'Terminando'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141540970446752104)
,p_name=>'APEXIR_SUBSCRIPTION_SKIP_IF_NDF'
,p_message_language=>'pt-br'
,p_message_text=>'Ignorar se Nenhum Dado For Encontrado'
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141721827691752157)
,p_name=>'APEXIR_SUBSCRIPTION_STARTING_FROM'
,p_message_language=>'pt-br'
,p_message_text=>'Iniciando de'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141722754187752158)
,p_name=>'APEXIR_SUM_X'
,p_message_language=>'pt-br'
,p_message_text=>'Soma %0'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141713636075752155)
,p_name=>'APEXIR_TABLE_SUMMARY'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0, Relat\00F3rio = %1, View = %2')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141600695318752122)
,p_name=>'APEXIR_TEXT_COLOR'
,p_message_language=>'pt-br'
,p_message_text=>'Cor do Texto'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141619338702752127)
,p_name=>'APEXIR_TIME_DAYS'
,p_message_language=>'pt-br'
,p_message_text=>'dias'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141619209070752127)
,p_name=>'APEXIR_TIME_HOURS'
,p_message_language=>'pt-br'
,p_message_text=>'horas'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141619122769752127)
,p_name=>'APEXIR_TIME_MINS'
,p_message_language=>'pt-br'
,p_message_text=>'minutos'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141619525893752127)
,p_name=>'APEXIR_TIME_MONTHS'
,p_message_language=>'pt-br'
,p_message_text=>'meses'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141619477991752127)
,p_name=>'APEXIR_TIME_WEEKS'
,p_message_language=>'pt-br'
,p_message_text=>'semanas'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141619694475752127)
,p_name=>'APEXIR_TIME_YEARS'
,p_message_language=>'pt-br'
,p_message_text=>'anos'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141725134802752158)
,p_name=>'APEXIR_TOGGLE'
,p_message_language=>'pt-br'
,p_message_text=>'Alternar'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141635921720752132)
,p_name=>'APEXIR_TOP'
,p_message_language=>'pt-br'
,p_message_text=>'Superior'
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141718675848752157)
,p_name=>'APEXIR_UNGROUPED_COLUMN'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Coluna N\00E3o Agrupada')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141637494164752133)
,p_name=>'APEXIR_UNIQUE_HIGHLIGHT_NAME'
,p_message_language=>'pt-br'
,p_message_text=>'O Nome do Destaque deve ser exclusivo.'
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141605320214752123)
,p_name=>'APEXIR_UNSUPPORTED_DATA_TYPE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('tipo de dados n\00E3o suportado')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141636032503752132)
,p_name=>'APEXIR_UP'
,p_message_language=>'pt-br'
,p_message_text=>'Para Cima'
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141637637175752133)
,p_name=>'APEXIR_VALID_COLOR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Informe uma cor v\00E1lida.')
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141637751980752133)
,p_name=>'APEXIR_VALID_FORMAT_MASK'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Informe uma m\00E1scara de formato v\00E1lida.')
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141602546539752122)
,p_name=>'APEXIR_VALUE'
,p_message_language=>'pt-br'
,p_message_text=>'Valor'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141636554499752132)
,p_name=>'APEXIR_VALUE_AXIS_TITLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('T\00EDtulo do Eixo para Valor')
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141644385312752135)
,p_name=>'APEXIR_VALUE_REQUIRED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Valor Obrigat\00F3rio')
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141605977692752123)
,p_name=>'APEXIR_VCOLUMN'
,p_message_language=>'pt-br'
,p_message_text=>'Coluna Vertical'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141714735810752155)
,p_name=>'APEXIR_VERTICAL'
,p_message_language=>'pt-br'
,p_message_text=>'Vertical'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141643669483752134)
,p_name=>'APEXIR_VIEW_CHART'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Exibir Gr\00E1fico')
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141702245730752152)
,p_name=>'APEXIR_VIEW_DETAIL'
,p_message_language=>'pt-br'
,p_message_text=>'Exibir Detalhe'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141746511886752165)
,p_name=>'APEXIR_VIEW_DOES_NOT_EXIST'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O relat\00F3rio n\00E3o tem a view %0 definida.')
,p_version_scn=>2705379
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141702318953752152)
,p_name=>'APEXIR_VIEW_GROUP_BY'
,p_message_language=>'pt-br'
,p_message_text=>'Exibir Grupo Por'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141702146458752152)
,p_name=>'APEXIR_VIEW_ICONS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Exibir \00CDcones')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141672000939752143)
,p_name=>'APEXIR_VIEW_PIVOT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Exibir Tabela Din\00E2mica')
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141643711311752134)
,p_name=>'APEXIR_VIEW_REPORT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Exibir Relat\00F3rio')
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141696355275752150)
,p_name=>'APEXIR_WEEKLY'
,p_message_language=>'pt-br'
,p_message_text=>'Semanalmente'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141626421756752129)
,p_name=>'APEXIR_WORKING_REPORT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Relat\00F3rio Funcional')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141724103028752158)
,p_name=>'APEXIR_X_DAYS'
,p_message_language=>'pt-br'
,p_message_text=>'%0 dias'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141724047816752158)
,p_name=>'APEXIR_X_HOURS'
,p_message_language=>'pt-br'
,p_message_text=>'%0 horas'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141723980483752158)
,p_name=>'APEXIR_X_MINS'
,p_message_language=>'pt-br'
,p_message_text=>'%0 minutos'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141724300300752158)
,p_name=>'APEXIR_X_MONTHS'
,p_message_language=>'pt-br'
,p_message_text=>'%0 meses'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141724245212752158)
,p_name=>'APEXIR_X_WEEKS'
,p_message_language=>'pt-br'
,p_message_text=>'%0 semanas'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141724439220752158)
,p_name=>'APEXIR_X_YEARS'
,p_message_language=>'pt-br'
,p_message_text=>'%0 anos'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141722183496752158)
,p_name=>'APEXIR_YEAR'
,p_message_language=>'pt-br'
,p_message_text=>'Ano'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141600353891752122)
,p_name=>'APEXIR_YELLOW'
,p_message_language=>'pt-br'
,p_message_text=>'amarelo'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141601843643752122)
,p_name=>'APEXIR_YES'
,p_message_language=>'pt-br'
,p_message_text=>'Sim'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141636320504752132)
,p_name=>'APEX_GROUP.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 cont\00E9m < ou > que s\00E3o caracteres inv\00E1lidos.')
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141660267876752139)
,p_name=>'APEX_REGION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Regi\00E3o')
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141551343056752107)
,p_name=>'APEX_ZIP.EXTRACT_FAILED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel extrair o arquivo ZIP.')
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141551270326752107)
,p_name=>'APEX_ZIP.INVALID_ZIPFILE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Assinatura de fim de diret\00F3rio central n\00E3o encontrada. Este arquivo n\00E3o \00E9 um arquivo ZIP.')
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141582364679752116)
,p_name=>'API_PRECONDITION_VIOLATED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Pr\00E9-condi\00E7\00E3o da API violada')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141604440726752123)
,p_name=>'APP.SETTING.CANNOT.GET'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel obter o valor para a Defini\00E7\00E3o de Aplicativo %0, pois a op\00E7\00E3o de build est\00E1 desativada.')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141604329636752123)
,p_name=>'APP.SETTING.CANNOT.SET'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel definir o valor para a Defini\00E7\00E3o de Aplicativo %0, pois a op\00E7\00E3o de build est\00E1 desativada.')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141716907983752156)
,p_name=>'APP.SETTING.INVALID.VALUE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O valor %0 da Defini\00E7\00E3o de Aplicativo \00E9 inv\00E1lido')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141716862100752156)
,p_name=>'APP.SETTING.NOT.DEFINED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A Defini\00E7\00E3o %0 de Aplicativo Solicitada n\00E3o foi configurada')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141717010516752156)
,p_name=>'APP.SETTING.VALUE.NOT.NULL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A Defini\00E7\00E3o de Aplicativo %0 n\00E3o pode ser definido como um valor nulo')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141590956705752119)
,p_name=>'BACK'
,p_message_language=>'pt-br'
,p_message_text=>'Voltar'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141573366277752114)
,p_name=>'BUILDER'
,p_message_language=>'pt-br'
,p_message_text=>'Builder'
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141646942797752135)
,p_name=>'BUTTON LABEL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Label de Bot\00E3o')
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141570230459752113)
,p_name=>'BUTTON_CSS_CLASSES'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Classes CSS do Bot\00E3o')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141608704679752124)
,p_name=>'BUTTON_ID'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O ID de bot\00E3o gerado ser\00E1 o ID Est\00E1tico do bot\00E3o, se definido; sen\00E3o, ser\00E1 um ID gerado internamente no formato ''B'' || [ID de Bot\00E3o Interno]')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141542701827752105)
,p_name=>'CANDLESTICK'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Casti\00E7al')
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141656739050752138)
,p_name=>'CENTER'
,p_message_language=>'pt-br'
,p_message_text=>'Centro'
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141603385995752122)
,p_name=>'CHANGE_PW_REQUEST'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Solicita\00E7\00E3o %0')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141593380997752120)
,p_name=>'CHECK$'
,p_message_language=>'pt-br'
,p_message_text=>'seletor de linhas'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141718721387752157)
,p_name=>'CHECKED'
,p_message_language=>'pt-br'
,p_message_text=>'marcado'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141695174765752150)
,p_name=>'COLUMN'
,p_message_language=>'pt-br'
,p_message_text=>'Coluna'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141652759947752137)
,p_name=>'COMMENTS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Coment\00E1rios')
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141633748961752132)
,p_name=>'CONTINUE'
,p_message_language=>'pt-br'
,p_message_text=>'Continuar'
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141591289133752119)
,p_name=>'COPYRIGHT'
,p_message_language=>'pt-br'
,p_message_text=>'Copyright &copy; 1999, %0, Oracle e/ou suas empresas afiliadas.'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141639459519752133)
,p_name=>'COUNT'
,p_message_language=>'pt-br'
,p_message_text=>'Contagem'
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141646426214752135)
,p_name=>'CREATE'
,p_message_language=>'pt-br'
,p_message_text=>'Criar'
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141701880247752152)
,p_name=>'CREATED'
,p_message_language=>'pt-br'
,p_message_text=>'Criado'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141701969352752152)
,p_name=>'CREATED_BY'
,p_message_language=>'pt-br'
,p_message_text=>'Criado por'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141622872945752128)
,p_name=>'CREATED_ON'
,p_message_language=>'pt-br'
,p_message_text=>'Criado em'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141633939782752132)
,p_name=>'CUSTOM'
,p_message_language=>'pt-br'
,p_message_text=>'Personalizado'
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141645148020752135)
,p_name=>'CUSTOMIZE'
,p_message_language=>'pt-br'
,p_message_text=>'Personalizar'
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141647181501752135)
,p_name=>'CUSTOMIZE.USER_PAGE_PREFS_RESET'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Prefer\00EAncias de p\00E1gina redefinidas para o usu\00E1rio %0.')
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141647264391752136)
,p_name=>'CUSTOMIZE.USER_PREFS_CHANGED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Prefer\00EAncias alteradas para o usu\00E1rio %0.')
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141647012642752135)
,p_name=>'CUSTOMIZE.USER_PREFS_RESET'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Prefer\00EAncias de p\00E1gina redefinidas para o usu\00E1rio %0.')
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141608197207752124)
,p_name=>'DAILY'
,p_message_language=>'pt-br'
,p_message_text=>'Diariamente'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141571535740752113)
,p_name=>'DATA.LOAD.INVALID_FILE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O arquivo transferido por upload \00E9 inv\00E1lido ou sua extens\00E3o est\00E1 incorreta.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141603596086752123)
,p_name=>'DATA.LOAD.INVALID_SELECTOR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Seletor de XML ou JSON inv\00E1lido utilizado.')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141548628556752106)
,p_name=>'DATA.LOAD.NO_COMMON_COLUMNS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O perfil de dados e o arquivo submetido a upload n\00E3o cont\00EAm nenhuma coluna da tabela de destino.')
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141662586917752140)
,p_name=>'DATA.LOAD.NO_FILE_CONTENTS'
,p_message_language=>'pt-br'
,p_message_text=>'Nenhum dado encontrado no arquivo submetido a upload.'
,p_version_scn=>2705365
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141662612683752140)
,p_name=>'DATA.LOAD.NO_WORKSHEET_CONTENTS'
,p_message_language=>'pt-br'
,p_message_text=>'Nenhum dado encontrado na planilha "%0".'
,p_version_scn=>2705365
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141568499733752112)
,p_name=>'DATA.LOAD.NO_XLSX_FILE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O arquivo especificado n\00E3o \00E9 um arquivo XLSX.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141534434092752102)
,p_name=>'DATA.LOAD.ROWS_PROCESSED'
,p_message_language=>'pt-br'
,p_message_text=>'Carga de dados finalizada: %0 linhas processadas.'
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141536732478752103)
,p_name=>'DATA.LOAD.ROWS_PROCESSED_W_ERROR_ROW'
,p_message_language=>'pt-br'
,p_message_text=>'Carga de dados finalizada: %0 linhas processadas com 1 erro.'
,p_version_scn=>2705339
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141537008064752103)
,p_name=>'DATA.LOAD.ROWS_PROCESSED_W_ERROR_ROWS'
,p_message_language=>'pt-br'
,p_message_text=>'Carga de dados finalizada: %0 linhas processadas com %1 erros.'
,p_version_scn=>2705339
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141536879864752103)
,p_name=>'DATA.LOAD.ROW_PROCESSED'
,p_message_language=>'pt-br'
,p_message_text=>'Carga de dados finalizada: 1 linha processada.'
,p_version_scn=>2705339
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141551108850752107)
,p_name=>'DATA.LOAD.ROW_PROCESSED_W_ERROR_ROW'
,p_message_language=>'pt-br'
,p_message_text=>'Carga de dados finalizada: 1 linha processada com erro.'
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141536975395752103)
,p_name=>'DATA.LOAD.ROW_PROCESSED_W_ERROR_ROWS'
,p_message_language=>'pt-br'
,p_message_text=>'Carga de dados finalizada: 1 linha processada sem erro.'
,p_version_scn=>2705339
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141669619232752142)
,p_name=>'DATA_LOAD.COLUMN_NAMES_MAPPING'
,p_message_language=>'pt-br'
,p_message_text=>'Coluna de Destino'
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141576876538752115)
,p_name=>'DATA_LOAD.DO_NOT_LOAD'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o Carregar')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141576994582752115)
,p_name=>'DATA_LOAD.FAILED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro de pr\00E9-processamento')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141669728334752142)
,p_name=>'DATA_LOAD.FIRST_COLUMN_NAMES'
,p_message_language=>'pt-br'
,p_message_text=>'Coluna de Origem'
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141670565919752142)
,p_name=>'DATA_LOAD.FORMAT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Formato de Data/N\00FAmero')
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141576613624752115)
,p_name=>'DATA_LOAD.INSERT'
,p_message_language=>'pt-br'
,p_message_text=>'Inserir linha'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141732731019752161)
,p_name=>'DATA_LOAD.LOOKUP_FAILED'
,p_message_language=>'pt-br'
,p_message_text=>'Falha ao recuperar o valor de consulta'
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141702414334752152)
,p_name=>'DATA_LOAD.MAPPING'
,p_message_language=>'pt-br'
,p_message_text=>'Mapeamento de Dados / Tabela'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141670682807752142)
,p_name=>'DATA_LOAD.ROW'
,p_message_language=>'pt-br'
,p_message_text=>'Linha'
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141577080535752115)
,p_name=>'DATA_LOAD.SEQUENCE_ACTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Sequ\00EAncia: A\00E7\00E3o')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141664382548752141)
,p_name=>'DATA_LOAD.TRANSFORMATION_FAILED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Falha na regra de transforma\00E7\00E3o')
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141576744643752115)
,p_name=>'DATA_LOAD.UPDATE'
,p_message_language=>'pt-br'
,p_message_text=>'Atualizar linha'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141639032148752133)
,p_name=>'DATE'
,p_message_language=>'pt-br'
,p_message_text=>'Data'
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141611976622752125)
,p_name=>'DAY'
,p_message_language=>'pt-br'
,p_message_text=>'dia'
,p_version_scn=>2705356
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141612007997752125)
,p_name=>'DAYS'
,p_message_language=>'pt-br'
,p_message_text=>'dias'
,p_version_scn=>2705356
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141652491612752137)
,p_name=>'DEBUGGING_OFF'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A depura\00E7\00E3o n\00E3o est\00E1 ativada para este aplicativo.')
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141704135182752152)
,p_name=>'DEFAULT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Padr\00E3o')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141612712057752125)
,p_name=>'DELETE'
,p_message_language=>'pt-br'
,p_message_text=>'excluir'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141588381604752118)
,p_name=>'DELETE_MSG'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Gostaria de executar esta a\00E7\00E3o de exclus\00E3o?')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141567917139752112)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Substitui\00E7\00F5es de Sess\00E3o')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141568867006752112)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ENABLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Ativar Substitui\00E7\00F5es de Sess\00E3o')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141569760554752113)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ERROR_LOAD'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro ao carregar as substitui\00E7\00F5es de sess\00E3o.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141569566184752113)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ERROR_SAVE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro ao salvar as substitui\00E7\00F5es de sess\00E3o.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141569410506752112)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_SAVED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Substitui\00E7\00F5es de sess\00E3o salvas. Feche esta caixa de di\00E1logo para ver as altera\00E7\00F5es.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141542689722752105)
,p_name=>'DIAL_PCT'
,p_message_language=>'pt-br'
,p_message_text=>'Quadrante (Percentual)'
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141583610671752117)
,p_name=>'DOWNLOAD'
,p_message_language=>'pt-br'
,p_message_text=>'Fazer Download'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141703251430752152)
,p_name=>'DUP_USER'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Nome do Usu\00E1rio Duplicado na lista.')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141592054051752119)
,p_name=>'EDIT'
,p_message_language=>'pt-br'
,p_message_text=>'Editar'
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141603290932752122)
,p_name=>'EMAIL_NOT_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O endere\00E7o de e-mail "%0" n\00E3o foi encontrado.')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141585997060752117)
,p_name=>'EMAIL_SENT_BY'
,p_message_language=>'pt-br'
,p_message_text=>'Este e-mail foi enviado por %0.'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141703477186752152)
,p_name=>'EMAIL_TOO_LONG'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O Endere\00E7o de E-mail \00E9 muito longo. O limite \00E9 240 caracteres.')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141633614414752132)
,p_name=>'ERROR'
,p_message_language=>'pt-br'
,p_message_text=>'Erro'
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141664425913752141)
,p_name=>'ERROR_SET_ITEM_STATE_FOR_PPR_REGION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel definir o valor de origem do item de p\00E1gina para atualiza\00E7\00E3o parcial da regi\00E3o da p\00E1gina')
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141624933313752129)
,p_name=>'F4500_P10_CREATED_BY'
,p_message_language=>'pt-br'
,p_message_text=>'Criado por'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141586213969752117)
,p_name=>'F4500_P2613_EXPIRED'
,p_message_language=>'pt-br'
,p_message_text=>'Senha Expirada'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141578674792752115)
,p_name=>'FILE_EMPTY'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O arquivo est\00E1 vazio.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141668493473752142)
,p_name=>'FILE_TOO_LARGE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O tamanho do arquivo submetido a upload era maior que %0 MB. Fa\00E7a upload de um arquivo menor.')
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141588561861752118)
,p_name=>'FILE_UPLOAD_AUTHENTICATION_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Falha na autentica\00E7\00E3o do usu\00E1rio e um ou mais arquivos n\00E3o foram transferidos por upload.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141588671872752118)
,p_name=>'FILE_UPLOAD_PUBLICUSER_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Esta inst\00E2ncia n\00E3o permite que usu\00E1rios n\00E3o autenticados fa\00E7am upload de arquivos.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141668548370752142)
,p_name=>'FILTERS'
,p_message_language=>'pt-br'
,p_message_text=>'Filtros'
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141646553112752135)
,p_name=>'FLOW.SINGLE_VALIDATION_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>'Ocorreu 1 erro'
,p_is_js_message=>true
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141645772681752135)
,p_name=>'FLOW.VALIDATION_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>'%0 erros ocorreram'
,p_is_js_message=>true
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141591165790752119)
,p_name=>'FORM_OF'
,p_message_language=>'pt-br'
,p_message_text=>'%0 de %1'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141630184300752130)
,p_name=>'GO'
,p_message_language=>'pt-br'
,p_message_text=>'Ir'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141732349472752161)
,p_name=>'HELP'
,p_message_language=>'pt-br'
,p_message_text=>'Ajuda'
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141573432827752114)
,p_name=>'HOME'
,p_message_language=>'pt-br'
,p_message_text=>'Home'
,p_is_js_message=>true
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141611746313752125)
,p_name=>'HOUR'
,p_message_language=>'pt-br'
,p_message_text=>'hora'
,p_version_scn=>2705356
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141611814767752125)
,p_name=>'HOURS'
,p_message_language=>'pt-br'
,p_message_text=>'horas'
,p_version_scn=>2705356
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141593206682752119)
,p_name=>'ICON'
,p_message_language=>'pt-br'
,p_message_text=>unistr('\00CDcone %0')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141570550458752113)
,p_name=>'ICON.EDITOR.CROP.HELP'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Ajuda do \00CDcone Cortar')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141571788835752113)
,p_name=>'ICON.EDITOR.CROPPER.HELPTEXT'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Arraste o \00EDcone e use a barra deslizante de zoom para reposicion\00E1-lo no quadro.</p>'),
'',
unistr('<p>Ao fazer upload de um novo \00EDcone, ele ser\00E1 redimensionado para se ajustar a tr\00EAs formatos: favorito, pequeno e grande.</p>'),
'',
unistr('<p>Quando focado no cortador de \00EDcone, os seguintes atalhos do teclado estar\00E3o dispon\00EDveis:</p>'),
'<ul>',
'    <li>Seta para a Esquerda: Mover imagem para a esquerda*</li>',
'    <li>Seta para Cima: Mover imagem para cima*</li>',
'    <li>Seta para a Direita: Mover imagem para a direita*</li>',
'    <li>Seta para Baixo: Mover imagem para baixo*</li>',
'    <li>I: Diminuir o zoom</li>',
'    <li>O: Aumentar o zoom</li>',
'    <li>L: Girar para a esquerda</li>',
'    <li>R: Girar para a direita</li>',
'</ul>',
'',
unistr('<p class="margin-top-md"><em>*Manter tecla Shift pressionada para mover mais r\00E1pido</em></p>')))
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141577229461752115)
,p_name=>'ICON.EDITOR.CROPPER.SUBTITLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Arrastar para reposicionar \00EDcone')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141577333034752115)
,p_name=>'ICON.EDITOR.CROPPER.ZOOM_SLIDER_LABEL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Mover barra deslizante para ajustar n\00EDvel de zoom')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141570350461752113)
,p_name=>'ICON.EDITOR.DIALOG.TITLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('\00CDcone Editar Aplicativo')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141570633332752113)
,p_name=>'ICON.EDITOR.ERROR.SAVING'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro ao salvar \00EDcone')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141653090829752137)
,p_name=>'ICON.EDITOR.LEGACY_DATA'
,p_message_language=>'pt-br'
,p_message_text=>unistr('<p><span class="a-Icon icon-tr-warning"></span> Este aplicativo usa \00EDcones legados. O upload de um novo \00EDcone substituir\00E1 todos os \00EDcones legados.</p>')
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141571203883752113)
,p_name=>'ICON.EDITOR.UPLOAD.ICON'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Fazer upload de um novo \00EDcone')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141647425544752136)
,p_name=>'INVALID_CREDENTIALS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Credenciais de Log-in Inv\00E1lidas')
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141748546647752165)
,p_name=>'INVALID_VALUE_FOR_PARAMETER'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Valor inv\00E1lido para o par\00E2metro: %0')
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141641719294752134)
,p_name=>'IR_AS_DEFAULT_REPORT_SETTING'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Como Configura\00E7\00F5es Padr\00E3o do Relat\00F3rio')
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141641881858752134)
,p_name=>'IR_AS_NAMED_REPORT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Como Relat\00F3rio Nomeado')
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141623754269752129)
,p_name=>'IR_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>'Erro de %0. %1'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141623416444752128)
,p_name=>'IR_FRM_NAV_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel calcular navega\00E7\00E3o do form. %0')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141599027643752121)
,p_name=>'IR_NOT_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Relat\00F3rio Interativo n\00E3o encontrado.')
,p_version_scn=>2705352
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141598408224752121)
,p_name=>'IR_REGION_NOT_EXIST'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A regi\00E3o do relat\00F3rio Interativo n\00E3o existe no aplicativo %0, p\00E1gina %1 e regi\00E3o %2.')
,p_version_scn=>2705352
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141641693660752134)
,p_name=>'IR_STAR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('S\00F3 exibido para desenvolvedores')
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141629832531752130)
,p_name=>'IR_UNIQUE_KEY_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A consulta do relat\00F3rio precisa de uma chave exclusiva para identificar cada linha. A chave fornecida n\00E3o pode ser usada para esta consulta. Defina uma coluna para a chave exclusiva. %0')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141629940334752130)
,p_name=>'IR_UNIQUE_KEY_ERROR2'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A consulta do relat\00F3rio precisa de uma chave exclusiva para identificar cada linha. A chave fornecida n\00E3o pode ser usada para esta consulta. Edite os atributos de relat\00F3rio para definir uma coluna para a chave exclusiva. %0')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141670825697752142)
,p_name=>'ITEM.FILE_UPLOAD.CHOOSE_FILE'
,p_message_language=>'pt-br'
,p_message_text=>'Escolher Arquivo'
,p_is_js_message=>true
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141670716173752142)
,p_name=>'ITEM.FILE_UPLOAD.DRAG_DROP_FILE_HERE'
,p_message_language=>'pt-br'
,p_message_text=>'Arraste e solte o arquivo aqui ou'
,p_is_js_message=>true
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141591412260752119)
,p_name=>'ITEMS'
,p_message_language=>'pt-br'
,p_message_text=>'Itens'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141625167552752129)
,p_name=>'ITEM_VALUE'
,p_message_language=>'pt-br'
,p_message_text=>'Valor do Item'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141639733452752133)
,p_name=>'LABEL'
,p_message_language=>'pt-br'
,p_message_text=>'Label'
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141652378917752137)
,p_name=>'LANGUAGE'
,p_message_language=>'pt-br'
,p_message_text=>'Idioma'
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141612437378752125)
,p_name=>'LAST'
,p_message_language=>'pt-br'
,p_message_text=>unistr('\00FAltimo(a)')
,p_version_scn=>2705356
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141588426695752118)
,p_name=>'LENGTH'
,p_message_language=>'pt-br'
,p_message_text=>'Tamanho'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141646772413752135)
,p_name=>'LOGIN'
,p_message_language=>'pt-br'
,p_message_text=>'Fazer Log-in'
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141688314167752148)
,p_name=>'MANAGE'
,p_message_language=>'pt-br'
,p_message_text=>'Gerenciar'
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141751439568752166)
,p_name=>'MAXIMIZE'
,p_message_language=>'pt-br'
,p_message_text=>'Maximizar'
,p_is_js_message=>true
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141611520066752125)
,p_name=>'MINUTE'
,p_message_language=>'pt-br'
,p_message_text=>'minuto'
,p_version_scn=>2705356
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141611655318752125)
,p_name=>'MINUTES'
,p_message_language=>'pt-br'
,p_message_text=>'minutos'
,p_version_scn=>2705356
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141703664910752152)
,p_name=>'MISSING_AT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('"@" N\00E3o Encontrado no Endere\00E7o de E-mail.')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141703806161752152)
,p_name=>'MISSING_DIALOG_PAGE_TEMPLATE_WARNING'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Advert\00EAncia: Nenhum modelo de P\00E1gina da Caixa de Di\00E1logo foi definido para a p\00E1gina de Caixa de Di\00E1logo %0 no aplicativo %1.')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141703545815752152)
,p_name=>'MISSING_DOT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('"." N\00E3o Encontrado no dom\00EDnio do Endere\00E7o de E-mail.')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141649848325752136)
,p_name=>'MODULE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('M\00F3dulo')
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141604049870752123)
,p_name=>'MONTH'
,p_message_language=>'pt-br'
,p_message_text=>unistr('M\00EAs')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141607997574752124)
,p_name=>'MONTHLY'
,p_message_language=>'pt-br'
,p_message_text=>'Mensalmente'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141604154485752123)
,p_name=>'MONTHS'
,p_message_language=>'pt-br'
,p_message_text=>'meses'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141639355908752133)
,p_name=>'MOVE'
,p_message_language=>'pt-br'
,p_message_text=>'Mover'
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141710155033752154)
,p_name=>'MOVE_FROM'
,p_message_language=>'pt-br'
,p_message_text=>'Mover de'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141710258064752154)
,p_name=>'MOVE_TO'
,p_message_language=>'pt-br'
,p_message_text=>'Mover para'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141626375782752129)
,p_name=>'MRU.ERROR_IN_MRD'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro na opera\00E7\00E3o de exclus\00E3o de v\00E1rias linhas: linha= %0, %1, %2')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141625354441752129)
,p_name=>'MUST_NOT_BE_PUBLIC_USER'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o Deve Ser Usu\00E1rio P\00FAblico')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141573904898752114)
,p_name=>'NAME'
,p_message_language=>'pt-br'
,p_message_text=>'Nome'
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141639544621752133)
,p_name=>'NEW'
,p_message_language=>'pt-br'
,p_message_text=>'Novo'
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141603826177752123)
,p_name=>'NEW_ACCOUNT_LOGIN_INSTRUCTIONS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Voc\00EA pode fazer log-in para %0 indo para:')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141603905585752123)
,p_name=>'NEW_ACCOUNT_NOTIFICATION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Nova Notifica\00E7\00E3o de Conta %0')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141732545777752161)
,p_name=>'NEXT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Pr\00F3ximo')
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141649780479752136)
,p_name=>'NO'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o')
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141746639792752165)
,p_name=>'NOBODY'
,p_message_language=>'pt-br'
,p_message_text=>unistr('ningu\00E9m')
,p_version_scn=>2705379
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141612880211752125)
,p_name=>'NOT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141655781438752138)
,p_name=>'NOT_NULL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o Nulo')
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141625479995752129)
,p_name=>'NOT_W_ARGUMENT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o %0')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141645227989752135)
,p_name=>'NO_DATA_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>unistr('dados n\00E3o encontrados')
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141655211666752138)
,p_name=>'NO_UPDATEABLE_REPORT_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o foram encontrados relat\00F3rios atualiz\00E1veis. As opera\00E7\00F5es de exclus\00E3o e v\00E1rias linhas atualizadas s\00F3 podem ser executadas em forms tabulares do tipo ''Relat\00F3rio Atualiz\00E1vel''.')
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141656118842752138)
,p_name=>'OK'
,p_message_language=>'pt-br'
,p_message_text=>'OK'
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141651464474752137)
,p_name=>'ORACLE_APPLICATION_EXPRESS'
,p_message_language=>'pt-br'
,p_message_text=>'Oracle APEX'
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141750317417752166)
,p_name=>'ORA_06550'
,p_message_language=>'pt-br'
,p_message_text=>'ORA-06550: linha %0, coluna %1'
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141701262303752151)
,p_name=>'OUTDATED_BROWSER'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Voc\00EA est\00E1 usando um web browser desatualizado. Para obter uma lista de browsers suportados, consulte o Oracle APEX Installation Guide.')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141596241879752120)
,p_name=>'OUT_OF_RANGE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Conjunto inv\00E1lido de linhas solicitado. Os dados de origem do relat\00F3rio foram modificados.')
,p_version_scn=>2705351
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141618296394752127)
,p_name=>'P.VALID_PAGE_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Deve ser especificado um n\00FAmero de p\00E1gina v\00E1lido, por exemplo p?n=1234.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141622452113752128)
,p_name=>'PAGINATION.NEXT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Pr\00F3ximo')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141622502231752128)
,p_name=>'PAGINATION.NEXT_SET'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Pr\00F3ximo Conjunto')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141622649221752128)
,p_name=>'PAGINATION.PREVIOUS'
,p_message_language=>'pt-br'
,p_message_text=>'Anterior'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141622799816752128)
,p_name=>'PAGINATION.PREVIOUS_SET'
,p_message_language=>'pt-br'
,p_message_text=>'Conjunto Anterior'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141732411875752161)
,p_name=>'PAGINATION.SELECT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Selecionar Pagina\00E7\00E3o')
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141662415058752140)
,p_name=>'PASSWORD'
,p_message_language=>'pt-br'
,p_message_text=>'Senha'
,p_version_scn=>2705365
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141603160349752122)
,p_name=>'PASSWORD_CHANGED'
,p_message_language=>'pt-br'
,p_message_text=>'Sua senha para %0 foi alterada.'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141590847655752119)
,p_name=>'PASSWORD_COMPLEXITY_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A senha n\00E3o \00E9 compat\00EDvel com as regras de complexidade de senha deste site.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141589976446752119)
,p_name=>'PASSWORD_DIFFERS_BY_ERR'
,p_message_language=>'pt-br'
,p_message_text=>'A nova senha deve ser diferente da antiga senha em pelo menos %0 caracteres.'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141590599762752119)
,p_name=>'PASSWORD_LIKE_USERNAME_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A senha n\00E3o deve conter o nome do usu\00E1rio.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141590705334752119)
,p_name=>'PASSWORD_LIKE_WORDS_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A senha cont\00E9m uma palavra simples proibida.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141590653610752119)
,p_name=>'PASSWORD_LIKE_WORKSPACE_NAME_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A senha n\00E3o deve conter o nome do espa\00E7o de trabalho.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141589893158752118)
,p_name=>'PASSWORD_MIN_LEN_ERR'
,p_message_language=>'pt-br'
,p_message_text=>'A senha deve conter pelo menos %0 caracteres.'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141590092541752119)
,p_name=>'PASSWORD_ONE_ALPHA_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A senha deve conter pelo menos uma caractere alfab\00E9tico (%0).')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141590420428752119)
,p_name=>'PASSWORD_ONE_LOWER_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A senha deve conter pelo menos um caractere de letra min\00FAscula.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141590100550752119)
,p_name=>'PASSWORD_ONE_NUMERIC_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A senha deve conter pelo menos um caractere num\00E9rico (0123456789).')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141590280433752119)
,p_name=>'PASSWORD_ONE_PUNCTUATION_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A senha deve conter pelo menos caractere de pontua\00E7\00E3o (%0).')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141590302746752119)
,p_name=>'PASSWORD_ONE_UPPER_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A senha deve conter pelo menos um caractere em mai\00FAscula.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141603641095752123)
,p_name=>'PASSWORD_RESET_NOTIFICATION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Notifica\00E7\00E3o de Redefini\00E7\00E3o de Senha')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141588788411752118)
,p_name=>'PASSWORD_REUSE_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A senha n\00E3o pode ser usada porque ela foi usada nos %0 \00FAltimos dias.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141585495369752117)
,p_name=>'PCT_GRAPH_ARIA_LABEL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Gr\00E1fico de Percentual')
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141677074876752144)
,p_name=>'PE.COMPONEN.TYPE.PAGE_ITEM.PLURAL'
,p_message_language=>'pt-br'
,p_message_text=>'Itens'
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141677154118752144)
,p_name=>'PE.COMPONEN.TYPE.PAGE_ITEM.SINGULAR'
,p_message_language=>'pt-br'
,p_message_text=>'Item'
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141651231374752137)
,p_name=>'PERCENT'
,p_message_language=>'pt-br'
,p_message_text=>'Percentual'
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141620578685752128)
,p_name=>'PLEASE_CONTACT_ADMINISTRATOR'
,p_message_language=>'pt-br'
,p_message_text=>'Entre em contato com o administrador.'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141732679892752161)
,p_name=>'PREVIOUS'
,p_message_language=>'pt-br'
,p_message_text=>'Anterior'
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141669279972752142)
,p_name=>'PRINT'
,p_message_language=>'pt-br'
,p_message_text=>'Imprimir'
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141650026836752136)
,p_name=>'PRIVILEGES'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Privil\00E9gios')
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141618679786752127)
,p_name=>'REGIOIN_REFERENCES'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Refer\00EAncias de Regi\00E3o')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141639680948752133)
,p_name=>'REPORT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Relat\00F3rio')
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141649968820752136)
,p_name=>'REPORTING_PERIOD'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Per\00EDodo do Relat\00F3rio')
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141732885920752161)
,p_name=>'REPORT_LABEL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Relat\00F3rio: %0')
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141650668059752137)
,p_name=>'REPORT_TOTAL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Total do Relat\00F3rio')
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141596338136752120)
,p_name=>'RESET'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Redefinir Pagina\00E7\00E3o')
,p_version_scn=>2705351
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141625027639752129)
,p_name=>'RESET_PAGINATION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Redefinir Pagina\00E7\00E3o')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141655102026752138)
,p_name=>'RESET_PASSWORD'
,p_message_language=>'pt-br'
,p_message_text=>'Redefinir Senha'
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141630958642752131)
,p_name=>'RESTORE'
,p_message_language=>'pt-br'
,p_message_text=>'Restaurar'
,p_is_js_message=>true
,p_version_scn=>2705359
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141664552857752141)
,p_name=>'RESULTS'
,p_message_language=>'pt-br'
,p_message_text=>'Resultados'
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141656214275752138)
,p_name=>'RETURN_TO_APPLICATION'
,p_message_language=>'pt-br'
,p_message_text=>'Retornar ao aplicativo.'
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141656602650752138)
,p_name=>'RIGHT'
,p_message_language=>'pt-br'
,p_message_text=>'Direita'
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141688665159752148)
,p_name=>'ROW'
,p_message_language=>'pt-br'
,p_message_text=>'Linha %0'
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141639292541752133)
,p_name=>'ROW_COUNT'
,p_message_language=>'pt-br'
,p_message_text=>'Contagem de Linhas'
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141529051327752101)
,p_name=>'RW_AO_ASK_ORACLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Pergunte \00E0 Oracle')
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141529345525752101)
,p_name=>'RW_AO_CLOSE_ASK_ORACLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Fechar Pergunte \00E0 Oracle')
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141529655779752101)
,p_name=>'RW_AO_NOTIFICATIONS_LIST'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Lista de Notifica\00E7\00F5es')
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141529272245752101)
,p_name=>'RW_AO_OPEN_ASK_ORACLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Abrir Pergunte \00E0 Oracle')
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141529517274752101)
,p_name=>'RW_AO_PRODUCT_MAP'
,p_message_language=>'pt-br'
,p_message_text=>'Mapa de Produto'
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141529485164752101)
,p_name=>'RW_AO_SUGGESTIONS_LIST'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Lista de Sugest\00F5es')
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141530398816752101)
,p_name=>'RW_CLEAR'
,p_message_language=>'pt-br'
,p_message_text=>'Remover'
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141530248660752101)
,p_name=>'RW_CLOSE'
,p_message_language=>'pt-br'
,p_message_text=>'Fechar'
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141530097967752101)
,p_name=>'RW_FO_VIEW_MORE'
,p_message_language=>'pt-br'
,p_message_text=>'Exibir Mais'
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141530450369752101)
,p_name=>'RW_GO_TO'
,p_message_language=>'pt-br'
,p_message_text=>'Ir para'
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141529827606752101)
,p_name=>'RW_GP_STEP'
,p_message_language=>'pt-br'
,p_message_text=>'Etapa'
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141529955922752101)
,p_name=>'RW_GP_STEP_OF'
,p_message_language=>'pt-br'
,p_message_text=>'de'
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141529741051752101)
,p_name=>'RW_GP_TOGGLE_STEPS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Alternar exibi\00E7\00E3o de etapas')
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141528803053752101)
,p_name=>'RW_HIDE_PASSWORD'
,p_message_language=>'pt-br'
,p_message_text=>'Ocultar Senha'
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141530142497752101)
,p_name=>'RW_OPEN'
,p_message_language=>'pt-br'
,p_message_text=>'Abertura'
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141528645835752100)
,p_name=>'RW_ORACLE'
,p_message_language=>'pt-br'
,p_message_text=>'Oracle'
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141528747473752101)
,p_name=>'RW_SHOW_PASSWORD'
,p_message_language=>'pt-br'
,p_message_text=>'Mostrar Senha'
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141530583307752101)
,p_name=>'RW_START'
,p_message_language=>'pt-br'
,p_message_text=>unistr('In\00EDcio')
,p_is_js_message=>true
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141655621911752138)
,p_name=>'SAVE'
,p_message_language=>'pt-br'
,p_message_text=>'Salvar'
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141651899823752137)
,p_name=>'SAVED_REPORTS.ALTERNATIVE.DEFAULT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Padr\00E3o Alternativo')
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141652243284752137)
,p_name=>'SAVED_REPORTS.DESCRIPTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Descri\00E7\00E3o')
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141651796329752137)
,p_name=>'SAVED_REPORTS.PRIMARY.DEFAULT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Padr\00E3o Prim\00E1rio')
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141652550203752137)
,p_name=>'SC_REPORT_ROWS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('H\00E1 mais de %0 linhas dispon\00EDveis. Aumente o seletor de linhas para ver mais linhas.')
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141719980119752157)
,p_name=>'SEARCH'
,p_message_language=>'pt-br'
,p_message_text=>'Pesquisar'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141611443972752125)
,p_name=>'SECONDS'
,p_message_language=>'pt-br'
,p_message_text=>'segundos'
,p_version_scn=>2705356
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141651314638752137)
,p_name=>'SEE_ATTACHED'
,p_message_language=>'pt-br'
,p_message_text=>'Consulte anexo'
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141711913897752155)
,p_name=>'SELECT_ROW'
,p_message_language=>'pt-br'
,p_message_text=>'Selecionar Linha'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141651005733752137)
,p_name=>'SET_SCREEN_READER_MODE_OFF'
,p_message_language=>'pt-br'
,p_message_text=>'Desativar Modo de Leitor de Tela'
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141651130046752137)
,p_name=>'SET_SCREEN_READER_MODE_ON'
,p_message_language=>'pt-br'
,p_message_text=>'Ativar Modo de Leitor de Tela'
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141647368015752136)
,p_name=>'SHOW'
,p_message_language=>'pt-br'
,p_message_text=>'Mostrar'
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141713720192752155)
,p_name=>'SHOW_ALL'
,p_message_language=>'pt-br'
,p_message_text=>'Mostrar Tudo'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141738595036752162)
,p_name=>'SIGN_IN'
,p_message_language=>'pt-br'
,p_message_text=>'Acessar'
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141689477596752148)
,p_name=>'SIGN_OUT'
,p_message_language=>'pt-br'
,p_message_text=>'Sair'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141640237485752133)
,p_name=>'SINCE_DAYS_AGO'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 dias atr\00E1s')
,p_is_js_message=>true
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141647873680752136)
,p_name=>'SINCE_DAYS_FROM_NOW'
,p_message_language=>'pt-br'
,p_message_text=>'%0 dias a partir de agora'
,p_is_js_message=>true
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141640110793752133)
,p_name=>'SINCE_HOURS_AGO'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 horas atr\00E1s')
,p_is_js_message=>true
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141647738490752136)
,p_name=>'SINCE_HOURS_FROM_NOW'
,p_message_language=>'pt-br'
,p_message_text=>'%0 horas a partir de agora'
,p_is_js_message=>true
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141640065625752133)
,p_name=>'SINCE_MINUTES_AGO'
,p_message_language=>'pt-br'
,p_message_text=>unistr('H\00E1 %0 minutos')
,p_is_js_message=>true
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141647685699752136)
,p_name=>'SINCE_MINUTES_FROM_NOW'
,p_message_language=>'pt-br'
,p_message_text=>'%0 minutos a partir de agora'
,p_is_js_message=>true
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141640469675752134)
,p_name=>'SINCE_MONTHS_AGO'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 meses atr\00E1s')
,p_is_js_message=>true
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141648084944752136)
,p_name=>'SINCE_MONTHS_FROM_NOW'
,p_message_language=>'pt-br'
,p_message_text=>'%0 meses a partir de agora'
,p_is_js_message=>true
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141648222157752136)
,p_name=>'SINCE_NOW'
,p_message_language=>'pt-br'
,p_message_text=>'Agora'
,p_is_js_message=>true
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141639982725752133)
,p_name=>'SINCE_SECONDS_AGO'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 segundos atr\00E1s')
,p_is_js_message=>true
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141647545365752136)
,p_name=>'SINCE_SECONDS_FROM_NOW'
,p_message_language=>'pt-br'
,p_message_text=>'%0 segundos a partir de agora'
,p_is_js_message=>true
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141640390714752134)
,p_name=>'SINCE_WEEKS_AGO'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 semanas atr\00E1s')
,p_is_js_message=>true
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141647918705752136)
,p_name=>'SINCE_WEEKS_FROM_NOW'
,p_message_language=>'pt-br'
,p_message_text=>'%0 semanas a partir de agora'
,p_is_js_message=>true
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141640510074752134)
,p_name=>'SINCE_YEARS_AGO'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 anos atr\00E1s')
,p_is_js_message=>true
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141648101092752136)
,p_name=>'SINCE_YEARS_FROM_NOW'
,p_message_language=>'pt-br'
,p_message_text=>'%0 anos a partir de agora'
,p_is_js_message=>true
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141634003635752132)
,p_name=>'STANDARD'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Padr\00E3o')
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141650943033752137)
,p_name=>'START_DATE'
,p_message_language=>'pt-br'
,p_message_text=>'Data Inicial'
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141586168814752117)
,p_name=>'SUBSCRIPTION_CREATED_BY'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Voc\00EA est\00E1 recebendo este e-mail da inscri\00E7\00E3o de relat\00F3rio Interativo criada por %0.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141747731225752165)
,p_name=>'SUBSCRIPTION_REFERENCES'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Inscri\00E7\00F5es')
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141697155746752150)
,p_name=>'TAB'
,p_message_language=>'pt-br'
,p_message_text=>'Guia'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141611303456752125)
,p_name=>'TITLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('T\00EDtulo')
,p_version_scn=>2705356
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141591017053752119)
,p_name=>'TODAY'
,p_message_language=>'pt-br'
,p_message_text=>'Hoje'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141650545650752137)
,p_name=>'TOTAL'
,p_message_language=>'pt-br'
,p_message_text=>'Total'
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141592359335752119)
,p_name=>'TO_MANY_COLUMNS_SELECTED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('\00C9 poss\00EDvel selecionar no m\00E1ximo %0 colunas.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141548129691752106)
,p_name=>'TREE.COLLAPSE_ALL'
,p_message_language=>'pt-br'
,p_message_text=>'Contrair Tudo'
,p_is_js_message=>true
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141548739374752106)
,p_name=>'TREE.COLLAPSE_ALL_BELOW'
,p_message_language=>'pt-br'
,p_message_text=>'Contrair Todos os Itens a Seguir'
,p_is_js_message=>true
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141547700800752106)
,p_name=>'TREE.EXPAND_ALL'
,p_message_language=>'pt-br'
,p_message_text=>'Expandir Tudo'
,p_is_js_message=>true
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141548443990752106)
,p_name=>'TREE.EXPAND_ALL_BELOW'
,p_message_language=>'pt-br'
,p_message_text=>'Expandir Todos os Itens a Seguir'
,p_is_js_message=>true
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141548942258752106)
,p_name=>'TREE.REPARENT'
,p_message_language=>'pt-br'
,p_message_text=>'Alterar os pais'
,p_is_js_message=>true
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141671052936752143)
,p_name=>'TREES'
,p_message_language=>'pt-br'
,p_message_text=>unistr('\00C1rvores')
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141713821900752155)
,p_name=>'UI.FORM.REQUIRED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Obrigat\00F3rio')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141634746691752132)
,p_name=>'UNAUTHORIZED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o Autorizado')
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141684985276752147)
,p_name=>'UNAVAILABLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Indispon\00EDvel')
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141648634214752136)
,p_name=>'UNKNOWN'
,p_message_language=>'pt-br'
,p_message_text=>'Desconhecido'
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141587075741752118)
,p_name=>'UNKNOWN_AUTHENTICATION_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Ocorreu um erro de autentica\00E7\00E3o n\00E3o reconhecido.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141589234934752118)
,p_name=>'UNSUBSCRIBE_SUBSCRIPTION_MSG_HTML'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Se voc\00EA n\00E3o quiser mais receber e-mails, clique em <a href="%0">cancelar inscri\00E7\00E3o</a> para gerenciar sua inscri\00E7\00E3o.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141586036142752117)
,p_name=>'UNSUBSCRIBE_SUBSCRIPTION_MSG_TXT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Se voc\00EA n\00E3o quiser mais receber e-mails, v\00E1 para o seguinte URL para gerenciar sua inscri\00E7\00E3o:')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141625587806752129)
,p_name=>'UNSUPPORTED_DATA_TYPE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('tipo de dados n\00E3o suportado')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141612672325752125)
,p_name=>'UPDATE'
,p_message_language=>'pt-br'
,p_message_text=>'atualizar'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141611227396752125)
,p_name=>'UPDATED'
,p_message_language=>'pt-br'
,p_message_text=>'Atualizado'
,p_version_scn=>2705356
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141554429685752108)
,p_name=>'UPGRADE_IN_PROGRESS'
,p_message_language=>'pt-br'
,p_message_text=>'Upgrade em Andamento'
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141554772700752108)
,p_name=>'UPGRADE_IN_PROGRESS_DETAIL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O upgrade do Oracle APEX para uma vers\00E3o mais nova est\00E1 sendo feito. Esse processo geralmente dura at\00E9 3 minutos.')
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141618028416752127)
,p_name=>'URL_PROHIBITED'
,p_message_language=>'pt-br'
,p_message_text=>'O URL solicitado foi proibido. Entre em contato com o administrador.'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141639186551752133)
,p_name=>'USER'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Usu\00E1rio')
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141662375439752140)
,p_name=>'USERNAME'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Nome do Usu\00E1rio')
,p_version_scn=>2705365
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141703738683752152)
,p_name=>'USERNAME_TOO_LONG'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O nome do usu\00E1rio \00E9 muito grande. O limite \00E9 de %0 caracteres.')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141646250777752135)
,p_name=>'USERS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('usu\00E1rios')
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141703352911752152)
,p_name=>'USER_EXISTS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O Nome do usu\00E1rio j\00E1 existe.')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141717166904752156)
,p_name=>'USER_PROFILE_IMAGE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Imagem de perfil do usu\00E1rio %0')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141579094839752115)
,p_name=>'UTILIZATION_REPORTS.AUTOMATION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Automa\00E7\00E3o- %0')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141577544380752115)
,p_name=>'UTILIZATION_REPORTS.PAGE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('P\00E1gina %0 - %1 ')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141580487881752116)
,p_name=>'UTILIZATION_REPORTS.PLUG_NAME'
,p_message_language=>'pt-br'
,p_message_text=>'%0 - %1'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141580558194752116)
,p_name=>'UTILIZATION_REPORTS.PROCESS_NAME'
,p_message_language=>'pt-br'
,p_message_text=>'%0 - %1'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141579466177752115)
,p_name=>'UTILIZATION_REPORTS.SEARCH_CONFIG'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Configura\00E7\00E3o de Pesquisa - %0')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141579392652752115)
,p_name=>'UTILIZATION_REPORTS.SHARED_DYNAMIC_LOV'
,p_message_language=>'pt-br'
,p_message_text=>unistr('LOV Din\00E2mica Compartilhada - %0')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141579138354752115)
,p_name=>'UTILIZATION_REPORTS.TASK_DEFINITION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Defini\00E7\00E3o de Tarefa - %0')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141577698375752115)
,p_name=>'UTILIZATION_REPORTS.WORKFLOW'
,p_message_language=>'pt-br'
,p_message_text=>'Workflow - %0 '
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141599797536752121)
,p_name=>'VALID'
,p_message_language=>'pt-br'
,p_message_text=>unistr('V\00E1lido')
,p_version_scn=>2705352
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141591307358752119)
,p_name=>'VALIDATIONS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Valida\00E7\00F5es')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141652069430752137)
,p_name=>'VALUE_MUST_BE_SPECIFIED'
,p_message_language=>'pt-br'
,p_message_text=>'O valor deve ser especificado.'
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141698367557752151)
,p_name=>'VALUE_MUST_BE_SPECIFIED_FOR'
,p_message_language=>'pt-br'
,p_message_text=>'O valor deve ser especificado para %0'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141620976011752128)
,p_name=>'VERTICAL'
,p_message_language=>'pt-br'
,p_message_text=>'vertical'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141612594781752125)
,p_name=>'VIEW'
,p_message_language=>'pt-br'
,p_message_text=>'exibir'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141646317244752135)
,p_name=>'VIEWS'
,p_message_language=>'pt-br'
,p_message_text=>'views'
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141652886740752137)
,p_name=>'VIEW_ALL'
,p_message_language=>'pt-br'
,p_message_text=>'Exibir Tudo'
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141592794077752119)
,p_name=>'VISUALLY_HIDDEN_LINK'
,p_message_language=>'pt-br'
,p_message_text=>'Link visualmente oculto'
,p_is_js_message=>true
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141633543260752131)
,p_name=>'WARNING'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Advert\00EAncia')
,p_is_js_message=>true
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141612178884752125)
,p_name=>'WEEK'
,p_message_language=>'pt-br'
,p_message_text=>'semana'
,p_version_scn=>2705356
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141608006345752124)
,p_name=>'WEEKLY'
,p_message_language=>'pt-br'
,p_message_text=>'Semanalmente'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141612222861752125)
,p_name=>'WEEKS'
,p_message_language=>'pt-br'
,p_message_text=>'semanas'
,p_version_scn=>2705356
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141652162868752137)
,p_name=>'WELCOME_USER'
,p_message_language=>'pt-br'
,p_message_text=>'Bem-vindo: %0'
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141650397046752136)
,p_name=>'WWV_DBMS_SQL.INVALID_CLOB'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Foi encontrado valor inv\00E1lido. Verifique os dados informados.')
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141650421045752136)
,p_name=>'WWV_DBMS_SQL.INVALID_DATATYPE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Foi encontrado valor inv\00E1lido. Verifique os dados informados.')
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141588201336752118)
,p_name=>'WWV_DBMS_SQL.INVALID_DATE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Valor de data inv\00E1lido encontrado. Verifique o formato da data.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141650275153752136)
,p_name=>'WWV_DBMS_SQL.INVALID_NUMBER'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Foi encontrado valor de n\00FAmero inv\00E1lido. Verifique o formato do n\00FAmero.')
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141599316358752121)
,p_name=>'WWV_DBMS_SQL.INVALID_TIMESTAMP'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Foi encontrado um valor de timestamp inv\00E1lido. Verifique o formato do timestamp.')
,p_version_scn=>2705352
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141623819236752129)
,p_name=>'WWV_DBMS_SQL.UNABLE_TO_BIND_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel associar %0. Use aspas para itens com v\00E1rios bytes ou verifique se o comprimento do item tem 30 bytes ou menos. Use a sintaxe v() para referenciar itens com mais de 30 bytes.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141613609540752126)
,p_name=>'WWV_FLOW.ACCESS_DENIED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Acesso negado pela verifica\00E7\00E3o de seguran\00E7a %0')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141616126873752126)
,p_name=>'WWV_FLOW.APP_NOT_AVAILABLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Aplicativo N\00E3o Dispon\00EDvel')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141614548798752126)
,p_name=>'WWV_FLOW.APP_NOT_FOUND_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Aplicativo n\00E3o encontrado.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141614641276752126)
,p_name=>'WWV_FLOW.APP_NOT_FOUND_FOOTER_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('aplicativo=%0  espa\00E7o de trabalho=%1')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141615036655752126)
,p_name=>'WWV_FLOW.APP_RESTRICTED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O acesso a este aplicativo \00E9 restrito; tente novamente mais tarde.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141614908322752126)
,p_name=>'WWV_FLOW.APP_RESTRICTED_TO_DEV'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O acesso a este aplicativo \00E9 restrito a desenvolvedores de aplicativos; tente novamente mais tarde.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141614120096752126)
,p_name=>'WWV_FLOW.BRANCH_FUNC_RETURNING_URL_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('ERR-7744 N\00E3o foi poss\00EDvel processar ramifica\00E7\00E3o para URL de retorno da fun\00E7\00E3o.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141614011066752126)
,p_name=>'WWV_FLOW.BRANCH_TO_FUNCT_RET_PAGE_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('ERR-7744 N\00E3o foi poss\00EDvel processar ramifica\00E7\00E3o para p\00E1gina de retorno da fun\00E7\00E3o.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141614386198752126)
,p_name=>'WWV_FLOW.CALL_TO_SHOW_FROM_PROC_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('ERR-1430 Chamada para mostrar usando processo de p\00E1gina n\00E3o suportada: G_FLOW_STEP_ID (%0).')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141615474129752126)
,p_name=>'WWV_FLOW.CLEAR_STEP_CACHE_ERR'
,p_message_language=>'pt-br'
,p_message_text=>'ERR-1018 Erro ao limpar cache da etapa.'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141613824591752126)
,p_name=>'WWV_FLOW.COMP_UNKNOWN_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('ERR-1005 Tipo de c\00E1lculo desconhecido.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141614769169752126)
,p_name=>'WWV_FLOW.CUSTOM_AUTH_SESSION_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('ERR-1201 ID de sess\00E3o n\00E3o definido na autentica\00E7\00E3o da sess\00E3o.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141614819451752126)
,p_name=>'WWV_FLOW.CUSTOM_AUTH_SESSION_FOOTER_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('p\00E1gina=%0')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141614405568752126)
,p_name=>'WWV_FLOW.DET_COMPANY_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('ERR-7620 N\00E3o foi poss\00EDvel determinar o espa\00E7o de trabalho do aplicativo (%0).')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141594922449752120)
,p_name=>'WWV_FLOW.EDIT'
,p_message_language=>'pt-br'
,p_message_text=>'Editar'
,p_version_scn=>2705351
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141613561634752126)
,p_name=>'WWV_FLOW.FIND_ITEM_ERR2'
,p_message_language=>'pt-br'
,p_message_text=>unistr('ERR-1802 N\00E3o foi poss\00EDvel encontrar id do item "%0"')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141613233264752125)
,p_name=>'WWV_FLOW.FIND_ITEM_ID_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('ERR-1002 N\00E3o foi poss\00EDvel localizar o ID do item "%0" no aplicativo "%1".')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141613361077752125)
,p_name=>'WWV_FLOW.FIND_ITEM_ID_ERR2'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro inesperado, n\00E3o foi poss\00EDvel localizar o nome do item no n\00EDvel do aplicativo ou p\00E1gina.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141613739802752126)
,p_name=>'WWV_FLOW.FIRST_PAGE_DATA_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Voc\00EA j\00E1 est\00E1 na primeira p\00E1gina de dados.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141630277204752130)
,p_name=>'WWV_FLOW.ITEM_POSTING_VIOLATION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O ID de item (%0) n\00E3o \00E9 um item definido na p\00E1gina atual.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141587835199752118)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.INTERNAL_ONLY'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Item n\00E3o pode ser definido por meio da especifica\00E7\00E3o de argumentos para o aplicativo.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141588191979752118)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.NO_CHECKSUM'
,p_message_language=>'pt-br'
,p_message_text=>'(Nenhuma checksum foi fornecida)'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141587623752752118)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.PRIVATE_BOOKMARK'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Item pode ser definido quando acompanhado por uma checksum de "marcador de n\00EDvel de usu\00E1rio".')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141587500522752118)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.PUBLIC_BOOKMARK'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Item pode ser definido quando acompanhado por uma checksum de "marcador de n\00EDvel de aplicativo".')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141587795426752118)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.SESSION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Item pode ser definido quando acompanhado por uma checksum de "sess\00E3o".')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141587475040752118)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.UNPROTECTED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Item n\00E3o tem prote\00E7\00E3o.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141615524009752126)
,p_name=>'WWV_FLOW.NO_PAGE_HELP'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o h\00E1 ajuda da p\00E1gina dispon\00EDvel.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141603445564752123)
,p_name=>'WWV_FLOW.NO_PRIV_ON_SCHEMA'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O espa\00E7o de trabalho %0 n\00E3o possui privil\00E9gios para fazer parsing como o esquema %1.')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141613915692752126)
,p_name=>'WWV_FLOW.PAGE_ACCEPT_RECUR_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('ERR-1010 Excedido limite de recurs\00E3o no processamento de aceita\00E7\00E3o de ramifica\00E7\00E3o para p\00E1gina. %0')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141570477619752113)
,p_name=>'WWV_FLOW.PAGE_PATTERN_NOT_RUNNABLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('P\00E1gina indispon\00EDvel; n\00E3o \00E9 poss\00EDvel executar um padr\00E3o de p\00E1gina.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141588067072752118)
,p_name=>'WWV_FLOW.PAGE_PROTECTION.SHOW_NO_URL_ALLOWED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Esta p\00E1gina n\00E3o pode ser chamada com um URL ou com um comando GET ou POST pelo procedimento de exibi\00E7\00E3o; ela deve ser chamada com um tipo de ramifica\00E7\00E3o "Ramificar para P\00E1gina"')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141672838237752143)
,p_name=>'WWV_FLOW.SAVE_ROUTINE_NUMERIC_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro ao tentar salvar valor n\00E3o num\00E9rico no item %0. ')
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141605157075752123)
,p_name=>'WWV_FLOW.SCHEMA_NOT_EXISTS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O esquema de parsing "%0" do aplicativo n\00E3o existe no banco de dados.')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141605226115752123)
,p_name=>'WWV_FLOW.SERVICE_ADMIN_LINK'
,p_message_language=>'pt-br'
,p_message_text=>unistr('As contas no espa\00E7o de trabalho INTERNO s\00F3 podem ser usadas para acessar os <a href="%0">Servi\00E7os de Administra\00E7\00E3o</a> do &PRODUCT_NAME..')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141613123729752125)
,p_name=>'WWV_FLOW.SESSION_INFO_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('ERR-1029 N\00E3o foi poss\00EDvel armazenar informa\00E7\00F5es sobre a sess\00E3o.  sess\00E3o=%0 item=%1')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141616225600752126)
,p_name=>'WWV_FLOW.UNABLE_TO_STOP_TRACE_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o foi poss\00EDvel interromper rastreamento: %0')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141613420190752125)
,p_name=>'WWV_FLOW.UNEXPECTED_ERR'
,p_message_language=>'pt-br'
,p_message_text=>'Erro inesperado'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141624216134752129)
,p_name=>'WWV_FLOW.UPDATE_SUB_ERR'
,p_message_language=>'pt-br'
,p_message_text=>'Erro em update_substitution_cache: %0'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141616388090752126)
,p_name=>'WWV_FLOW.VIEW_HELP_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Aplicativo e p\00E1gina devem ser fornecidas para exibir a ajuda.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141638026964752133)
,p_name=>'WWV_FLOW_AUTOMATION.AUTOMATION_NOT_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Automa\00E7\00E3o n\00E3o encontrada.')
,p_version_scn=>2705360
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141573565235752114)
,p_name=>'WWV_FLOW_AUTOMATION.QUERY_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro de Consulta de Automa\00E7\00E3o: %0')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141617429726752127)
,p_name=>'WWV_FLOW_CACHE.PURGE_SESSION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Foram expurgadas %0 sess\00F5es.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141558734580752109)
,p_name=>'WWV_FLOW_CODE_EXEC_MLE.LANGUAGE_NOT_SUPPORTED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel executar o c\00F3digo %0! N\00E3o h\00E1 suporte para ele no banco de dados ou ele n\00E3o foi ativado pelo par\00E2metro de inst\00E2ncia MLE_LANGUAGES.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141556305543752109)
,p_name=>'WWV_FLOW_CODE_EXEC_MLE.MLE_NOT_SUPPORTED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O Multi Lingual Engine n\00E3o est\00E1 dispon\00EDvel nesta vers\00E3o do banco de dados!')
,p_version_scn=>2705345
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141595591549752120)
,p_name=>'WWV_FLOW_COLLECTION.ARRAY_NOT_NULL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O array do conjunto de aplicativos n\00E3o deve ser nulo')
,p_version_scn=>2705351
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141595371917752120)
,p_name=>'WWV_FLOW_COLLECTION.ATTRIBUTE_NUMBER_OUTSIDE_RANGE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O atributo de membro especificado n\00FAmero %0 \00E9 inv\00E1lido. O n\00FAmero do atributo deve estar entre 1 e %1')
,p_version_scn=>2705351
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141595803735752120)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_EXISTS'
,p_message_language=>'pt-br'
,p_message_text=>'O conjunto de aplicativos existe'
,p_version_scn=>2705351
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141595608172752120)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NAME_NOT_NULL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O nome do conjunto n\00E3o pode ser nulo')
,p_version_scn=>2705351
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141595799592752120)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NAME_TOO_LARGE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O nome do conjunto n\00E3o pode ter mais de 255 caracteres')
,p_version_scn=>2705351
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141595158851752120)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NOT_EXIST'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O conjunto de aplicativos %0 n\00E3o existe')
,p_version_scn=>2705351
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141595948438752120)
,p_name=>'WWV_FLOW_COLLECTION.CURSOR_NOT_OPEN'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O cursor ainda n\00E3o est\00E1 aberto')
,p_version_scn=>2705351
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141595287585752120)
,p_name=>'WWV_FLOW_COLLECTION.MEMBER_NOT_EXIST'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('A sequ\00EAncia de membros %0 n\00E3o existe no conjunto de Aplicativos %1'),
''))
,p_version_scn=>2705351
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141595424596752120)
,p_name=>'WWV_FLOW_COLLECTION.MEMBER_SEQUENCE_NUMBER_INVALID'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A sequ\00EAncia de membros %0 n\00E3o existe no conjunto de aplicativos "%1"')
,p_version_scn=>2705351
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141548280632752106)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_ALGORITHM'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o h\00E1 suporte para o algoritmo %0 para ECDSA.')
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141547946639752106)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_EC_CURVE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o h\00E1 suporte para a curva el\00EDptica %0.')
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141673679723752143)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_FUNCTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A fun\00E7\00E3o de criptografia "%0" n\00E3o \00E9 compat\00EDvel com este sistema.')
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141725953516752159)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_ACCESSIBLE'
,p_message_language=>'pt-br'
,p_message_text=>'Acessibilidade Testada'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141616991956752127)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_CLOSE'
,p_message_language=>'pt-br'
,p_message_text=>'Fechar'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141617095066752127)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_CUST_OPT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Op\00E7\00F5es de Personaliza\00E7\00E3o de P\00E1gina')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141617104167752127)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_DEFAULT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Padr\00E3o')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141617249236752127)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_DISP'
,p_message_language=>'pt-br'
,p_message_text=>'Exibido'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141617360954752127)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_HIDDEN'
,p_message_language=>'pt-br'
,p_message_text=>'Oculto'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141616799588752126)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE1'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Marque as regi\00F5es que voc\00EA deseja que sejam inclu\00EDdas nesta p\00E1gina. As regi\00F5es marcadas poder\00E3o n\00E3o ser exibidas se voc\00EA n\00E3o estiver no contexto do aplicativo correto ou se n\00E3o tiver os privil\00E9gios adequados.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141616856231752126)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE2'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Esta p\00E1gina n\00E3o \00E9 personaliz\00E1vel.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141726278208752159)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE3'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Voc\00EA pode personalizar a apar\00EAncia desse aplicativo alterando o Estilo do Tema. Selecione um Estilo de Tema na lista abaixo e clique em Aplicar Altera\00E7\00F5es.')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141727061958752159)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_REGION_DISP'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Exibi\00E7\00E3o de Regi\00E3o')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141726181062752159)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_REMOVE_STYLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Usar Estilo Padr\00E3o do Aplicativo')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141726004137752159)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_THEME_STYLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Apar\00EAncia ')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141670254128752142)
,p_name=>'WWV_FLOW_DATA_EXPORT.AGG_COLUMN_IDX_NOT_EXIST'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O \00EDndice de coluna referenciado no agregado %0 n\00E3o existe.')
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141562991069752111)
,p_name=>'WWV_FLOW_DATA_EXPORT.APPEND_NOT_SUPPORTED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o h\00E1 suporte no formato %0 para anexar a exporta\00E7\00E3o de dados.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141525967088752100)
,p_name=>'WWV_FLOW_DATA_EXPORT.CLOB_NOT_SUPPORTED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o h\00E1 suporte para a sa\00EDda do CLOB no formato %0.')
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141669981522752142)
,p_name=>'WWV_FLOW_DATA_EXPORT.COLUMN_BREAK_MUST_BE_IN_THE_BEGGINING'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A quebra de coluna precisa estar no in\00EDcio do array de colunas.')
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141670064646752142)
,p_name=>'WWV_FLOW_DATA_EXPORT.COLUMN_GROUP_IDX_NOT_EXIST'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O \00EDndice do grupo de colunas referenciado em %0 n\00E3o existe.')
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141577130591752115)
,p_name=>'WWV_FLOW_DATA_EXPORT.EXPORT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('exporta\00E7\00E3o')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141584360431752117)
,p_name=>'WWV_FLOW_DATA_EXPORT.FORMAT_MUST_BE_XML'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O formato de exporta\00E7\00E3o deve ser XML usando o ORDS como Servidor de Impress\00E3o.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141670355296752142)
,p_name=>'WWV_FLOW_DATA_EXPORT.HIGHLIGHT_COLUMN_IDX_NOT_EXIST'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O \00EDndice de coluna referenciado no destaque %0 n\00E3o existe.')
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141573755874752114)
,p_name=>'WWV_FLOW_DATA_EXPORT.INVALID_FORMAT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Formato de Exporta\00E7\00E3o Inv\00E1lido: %0')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141670103623752142)
,p_name=>'WWV_FLOW_DATA_EXPORT.PARENT_GROUP_IDX_NOT_EXIST'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O \00EDndice do grupo pai referenciado em %0 n\00E3o existe.')
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141695380504752150)
,p_name=>'WWV_FLOW_DATA_LOADER.CANNOT_LOAD_INTO_GENERATED_ALWAYS_COLUMN'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A coluna %1 da tabela %0 \00E9 uma coluna de identidade "GENERATED ALWAYS". Certifique-se de que nenhuma coluna de origem seja mapeada para a coluna %1 na caixa de di\00E1logo Configurar.')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141606922579752124)
,p_name=>'WWV_FLOW_DATA_LOADER.COMMIT_INTERVAL_TOO_LOW'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O intervalo de confirma\00E7\00E3o especificado \00E9 muito baixo.')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141607018466752124)
,p_name=>'WWV_FLOW_DATA_LOADER.NO_COLUMNS_PROVIDED'
,p_message_language=>'pt-br'
,p_message_text=>'Nenhuma coluna foi informada para carregamento de dados.'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141608383026752124)
,p_name=>'WWV_FLOW_DATA_PARSER.NO_COLUMNS_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o foram encontradas colunas para o seletor de linha "%0". Tente detectar automaticamente ou revise a estrutura de JSON.')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141617787949752127)
,p_name=>'WWV_FLOW_DATA_PARSER.NO_WORKSHEETS_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>'Nenhuma planilha encontrada no arquivo XLSX.'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141562861572752111)
,p_name=>'WWV_FLOW_DATA_PARSER.REQUESTED_HIERARCHY_LEVELS_EXCEED_MAXIMUM'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Os n\00EDveis de hierarquia solicitados para descobrir (%0) excedem o m\00E1ximo de %1.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141617694009752127)
,p_name=>'WWV_FLOW_DATA_PARSER.WORKSHEET_DOES_NOT_EXIST'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A planilha especificada n\00E3o existe no arquivo XLSX.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141596096229752120)
,p_name=>'WWV_FLOW_DML.VERSION_OF_DATA_CHANGED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A vers\00E3o atual dos dados contidos no banco de dados foi alterada desde que o usu\00E1rio iniciou o processo de atualiza\00E7\00E3o.')
,p_version_scn=>2705351
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141598919161752121)
,p_name=>'WWV_FLOW_EDIT_REPORT.ERR_UPDATING_COLS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro ao atualizar colunas do relat\00F3rio: %0')
,p_version_scn=>2705352
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141709458911752154)
,p_name=>'WWV_FLOW_EXEC.CANNOT_CONVERT_TO_SDOGEOMETRY'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel converter %0 em SDO_GEOMETRY.')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141645938238752135)
,p_name=>'WWV_FLOW_EXEC.CAN_NOT_CONVERT_TO_VARCHAR2'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A coluna %0 que \00E9 do tipo de dados %1 n\00E3o pode ser convertida em VARCHAR2!')
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141653383007752137)
,p_name=>'WWV_FLOW_EXEC.COLUMN_NOT_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A coluna "%0" especificada para o atributo "%1" n\00E3o foi encontrada na origem de dados!')
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141589412578752118)
,p_name=>'WWV_FLOW_EXEC.FILTER_NOT_SUPPORTED_WITH_MULTIPLE_VALUES'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o h\00E1 suporte para o tipo de filtro %0 em colunas com diversos valores.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141712961768752155)
,p_name=>'WWV_FLOW_EXEC.INVALID_BETWEEN_FILTER'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Filtro "entre" inv\00E1lido.')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141568536187752112)
,p_name=>'WWV_FLOW_EXEC.INVALID_COLUMN_OR_ROW_DATATYPE'
,p_message_language=>'pt-br'
,p_message_text=>'Nenhum valor %2 encontrado na coluna %0, linha #%1.'
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141565249186752111)
,p_name=>'WWV_FLOW_EXEC.INVALID_COLUMN_OR_ROW_REFERENCE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A coluna %0 ou a linha #%1 n\00E3o existe.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141551867814752107)
,p_name=>'WWV_FLOW_EXEC.INVALID_LOV_SPECIFICATION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Tipo de LOV inv\00E1lido especificado.')
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141551752623752107)
,p_name=>'WWV_FLOW_EXEC.INVALID_QUERY_TYPE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Tipo de consulta inv\00E1lido. O tipo de consulta deve ser Tabela, consulta SQL ou Fun\00E7\00E3o PL/SQL que retorne uma Consulta SQL.')
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141646082985752135)
,p_name=>'WWV_FLOW_EXEC.INVALID_SQL_QUERY'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Falha ao fazer parsing de consulta SQL!',
'%0'))
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141653410097752137)
,p_name=>'WWV_FLOW_EXEC.LEGACY_COLUMN_NOT_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A posi\00E7\00E3o especificada %0 da coluna para o atributo "%1" n\00E3o foi encontrada na instru\00E7\00E3o SQL!')
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141543422709752105)
,p_name=>'WWV_FLOW_EXEC.MULTI_VALUE_TOO_MANY_ITEMS'
,p_message_language=>'pt-br'
,p_message_text=>'Muitos itens usados no filtro Diversos Valores.'
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141653299545752137)
,p_name=>'WWV_FLOW_EXEC.NO_COLUMN_FOR_ATTRIBUTE'
,p_message_language=>'pt-br'
,p_message_text=>'Nenhuma coluna especificada para o atributo "%0".'
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141551601015752107)
,p_name=>'WWV_FLOW_EXEC.NULL_QUERY_RETURNED_BY_FUNCTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O corpo da fun\00E7\00E3o PL/SQL n\00E3o retornou um valor.')
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141669027118752142)
,p_name=>'WWV_FLOW_EXEC.OPERATION_NOT_PRESENT_IN_WEB_SRC_MODULE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A Origem de Dados REST n\00E3o cont\00E9m uma Opera\00E7\00E3o para tratar a a\00E7\00E3o do DML solicitada.')
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141710702172752154)
,p_name=>'WWV_FLOW_EXEC.RANGE_BUCKET.NOT.SUPPORTED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('S\00F3 h\00E1 suporte para os filtros de intervalo nos tipos de dados NUMBER, DATE ou TIMESTAMP.')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141531640029752101)
,p_name=>'WWV_FLOW_EXEC.REST_REQUEST_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Falha na solicita\00E7\00E3o com %0')
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141535138860752102)
,p_name=>'WWV_FLOW_EXEC.SPATIAL_JSON_NOT_AVAILABLE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A convers\00E3o de GeoJSON em SDO_GEOMETRY (coluna %0) n\00E3o est\00E1 dispon\00EDvel neste banco de dados.')
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141538569085752103)
,p_name=>'WWV_FLOW_EXEC.SPATIAL_NOT_SUPPORTED_FOR_XML'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A convers\00E3o SDO_GEOMETRY (coluna %0) n\00E3o \00E9 suportada para origens de dados XML.')
,p_version_scn=>2705339
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141562684615752111)
,p_name=>'WWV_FLOW_EXEC.UNSUPPPORTED_MULTI_VALUE_SEPARATOR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o h\00E1 suporte para o caractere %0 como um separador de v\00E1rios valores.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141710891859752154)
,p_name=>'WWV_FLOW_EXEC.WRONG_CONTEXT_TYPE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Esta fun\00E7\00E3o n\00E3o pode ser usada em um Contexto de Consulta.')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141538641221752103)
,p_name=>'WWV_FLOW_EXEC_API.INVALID_DATA_TYPE'
,p_message_language=>'pt-br'
,p_message_text=>'Incompatibilidade de Tipo de Dados da Coluna.'
,p_version_scn=>2705339
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141572163924752113)
,p_name=>'WWV_FLOW_EXEC_DOC_SRC.REMOTE_MULTI_ROW_DML_NOT_SUPPORTED_WITHOUT_JSON_BINDS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Esta origem de dados n\00E3o suporta a altera\00E7\00E3o de v\00E1rias linhas.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141551528041752107)
,p_name=>'WWV_FLOW_EXEC_REMOTE.ORDS_OUT_BIND_LIMIT_EXCEEDED'
,p_message_language=>'pt-br'
,p_message_text=>'Limites de Binding ORDS OUT excedidos. Reduza a quantidade de linhas DML.'
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141654204786752138)
,p_name=>'WWV_FLOW_EXEC_REMOTE.RESPONSE_PARSING_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('N\00E3o foi poss\00EDvel fazer parsing da resposta JSON do servidor remoto: '),
'%0'))
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141551413683752107)
,p_name=>'WWV_FLOW_EXEC_REMOTE.RUN_PLSQL_ERR'
,p_message_language=>'pt-br'
,p_message_text=>'Tipo de contexto desconhecido ou incorreto.'
,p_version_scn=>2705343
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141575583632752114)
,p_name=>'WWV_FLOW_EXPORT_INT.UNSUPPORTED_READABLE_EXPORT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Componentes sem suporte para exporta\00E7\00E3o leg\00EDvel: %0')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141673580099752143)
,p_name=>'WWV_FLOW_FILE_PARSER.UNKNOWN_FILE_TYPE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Este tipo de arquivo n\00E3o \00E9 suportado pelo parser.')
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141624384608752129)
,p_name=>'WWV_FLOW_FND_DEVELOPER_API.CREDENTIALS_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Acesso n\00E3o autorizado (wwv_flow_api.set_credentials n\00E3o definido).')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141599296652752121)
,p_name=>'WWV_FLOW_FND_USER_API.CREATE_COMPANY'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O espa\00E7o de trabalho n\00E3o foi criado porque j\00E1 existe.')
,p_version_scn=>2705352
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141599103664752121)
,p_name=>'WWV_FLOW_FND_USER_API.CREATE_USER_GROUP'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O grupo de usu\00E1rios n\00E3o foi criado porque j\00E1 existe.')
,p_version_scn=>2705352
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141610521023752125)
,p_name=>'WWV_FLOW_FND_USER_API.DUP_USER'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Encontrado nome de usu\00E1rio duplicado para %0.')
,p_version_scn=>2705356
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141610638794752125)
,p_name=>'WWV_FLOW_FND_USER_API.LOAD_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro ao carregar usu\00E1rios. Falha no usu\00E1rio %0.')
,p_version_scn=>2705356
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141621454047752128)
,p_name=>'WWV_FLOW_FND_USER_API.T_MESSAGE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Teriam carregado %0 usu\00E1rios.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141621299714752128)
,p_name=>'WWV_FLOW_FND_USER_API.T_PASSWORD'
,p_message_language=>'pt-br'
,p_message_text=>'Senha'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141621364720752128)
,p_name=>'WWV_FLOW_FND_USER_API.T_PRIVILEGE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Privil\00E9gios')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141621053725752128)
,p_name=>'WWV_FLOW_FND_USER_API.T_USERNAME'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Nome do usu\00E1rio')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141701495584752151)
,p_name=>'WWV_FLOW_FORM.UNHANDLED_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro ao renderizar o item de p\00E1gina #COMPONENT_NAME#.')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141616467053752126)
,p_name=>'WWV_FLOW_FORMS.FORM_NOT_OPEN_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel exibir o item de p\00E1gina porque o form HTML n\00E3o foi aberto ainda.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141574893785752114)
,p_name=>'WWV_FLOW_FORMS.ITEM_DEFAULT_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro ao calcular o valor padr\00E3o do item de p\00E1gina #COMPONENT_NAME#.')
,p_version_scn=>2705348
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141615783129752126)
,p_name=>'WWV_FLOW_FORMS.ITEM_POST_CALC_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro de p\00F3s-c\00E1lculo do item de p\00E1gina #COMPONENT_NAME#.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141615645685752126)
,p_name=>'WWV_FLOW_FORMS.ITEM_SOURCE_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro ao calcular o valor de origem do item de p\00E1gina #COMPONENT_NAME#.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141592405448752119)
,p_name=>'WWV_FLOW_HELP.UNAUTHORIZED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Acesso n\00E3o autorizado.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141541997423752104)
,p_name=>'WWV_FLOW_INTERACTIVE_GRID.INVALID_JSON_ARRAY'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O valor %0 de %1 n\00E3o \00E9 um array JSON v\00E1lido.')
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141615932437752126)
,p_name=>'WWV_FLOW_ITEM.JS_NOT_SUPPORTED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('JavaScript n\00E3o suportado.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141616097583752126)
,p_name=>'WWV_FLOW_ITEM.LIST'
,p_message_language=>'pt-br'
,p_message_text=>'Listar'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141616679366752126)
,p_name=>'WWV_FLOW_ITEM.UNABLE_INIT_QUERY'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o foi poss\00EDvel inicializar consulta.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141624699519752129)
,p_name=>'WWV_FLOW_ITEM.UPDATE_NOT_SUPPORTED_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A atualiza\00E7\00E3o de %0 n\00E3o \00E9 suportada.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141618189003752127)
,p_name=>'WWV_FLOW_ITEM_HELP.INVALID_ITEM_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('ID do item inv\00E1lido: %0 ')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141645835067752135)
,p_name=>'WWV_FLOW_ITEM_HELP.NO_HELP_EXISTS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o h\00E1 ajuda para este item.')
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141607681352752124)
,p_name=>'WWV_FLOW_JET_CHART.QUERY_GENERATION_FAILED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Falha na gera\00E7\00E3o de consultas do gr\00E1fico. Verifique as configura\00E7\00F5es de Mapeamento da Origem e da Coluna.')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141608966741752124)
,p_name=>'WWV_FLOW_MAIL.ADD_ATTACHMENT.INVALID_MAIL_ID'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Valor inv\00E1lido para o par\00E2metro p_mail_id: %0')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141645682023752135)
,p_name=>'WWV_FLOW_MAIL.CANNOT_USE_TO_OR_REPLYTO_AS_FROM'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel usar "Para" ou "Responder" como endere\00E7o "De" porque eles cont\00EAm diversos endere\00E7os de e-mail.')
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141730590113752160)
,p_name=>'WWV_FLOW_MAIL.EMAIL_LIMIT_EXCEEDED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Voc\00EA excedeu o n\00FAmero m\00E1ximo de mensagens de e-mail por espa\00E7o de trabalho. Entre em contato com seu administrador.')
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141587126624752118)
,p_name=>'WWV_FLOW_MAIL.INVALID_CONTEXT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Este procedimento deve ser chamado a partir de uma sess\00E3o de aplicativo.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141608858886752124)
,p_name=>'WWV_FLOW_MAIL.PARAMETER_NULL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Valor nulo fornecido para o par\00E2metro %0.')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141666926962752141)
,p_name=>'WWV_FLOW_MAIL.PREPARE_TEMPLATE.NO_DATA_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Modelo de e-mail "%0" n\00E3o encontrado no aplicativo %1.')
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141743403143752164)
,p_name=>'WWV_FLOW_MAIL.SMTP_HOST_ADDRESS_REQUIRED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O par\00E2metro da inst\00E2ncia SMTP_HOST_ADDRESS deve ser definido para enviar e-mails.')
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141608234988752124)
,p_name=>'WWV_FLOW_MAIL.TO_IS_REQUIRED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Forne\00E7a um destinat\00E1rio da mensagem para enviar o e-mail.')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141732959163752161)
,p_name=>'WWV_FLOW_MAIL.UNABLE_TO_OPEN_SMTP_CONNECTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel estabelecer conex\00E3o SMTP com o servidor de e-mail configurado.')
,p_version_scn=>2705378
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141708295200752153)
,p_name=>'WWV_FLOW_PLUGIN.INVALID_AJAX_CALL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Chamada do Ajax inv\00E1lida!')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141592173209752119)
,p_name=>'WWV_FLOW_PLUGIN.NO_AJAX_FUNCTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Nenhuma fun\00E7\00E3o do Ajax foi definida para o plug-in %0')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141698781065752151)
,p_name=>'WWV_FLOW_PLUGIN.NO_EXECUTION_FUNCTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Nenhuma fun\00E7\00E3o de execu\00E7\00E3o foi definida para o plug-in %0')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141592278748752119)
,p_name=>'WWV_FLOW_PLUGIN.NO_RENDER_FUNCTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Nenhuma fun\00E7\00E3o de renderiza\00E7\00E3o foi definida para o plug-in %0')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141709114195752154)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_CAPABILITIES_FUNCTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O Plug-In da Origem de Dados REST "%0" n\00E3o cont\00E9m uma fun\00E7\00E3o "Recursos".')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141709049439752154)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_DML_FUNCTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O Plug-In da Origem de Dados REST "%0" n\00E3o cont\00E9m uma fun\00E7\00E3o DML.')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141709215370752154)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_EXECUTE_FUNCTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O Plug-In da Origem de Dados REST "%0" n\00E3o cont\00E9m uma fun\00E7\00E3o de execu\00E7\00E3o.')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141709353122752154)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_FETCH_FUNCTION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O Plug-In da Origem de Dados REST "%0" n\00E3o cont\00E9m uma fun\00E7\00E3o de extra\00E7\00E3o.')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141589699003752118)
,p_name=>'WWV_FLOW_PLUGIN.RUN_PLSQL_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro no c\00F3digo PLSQL emitido durante o processamento do plug-in.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141598207604752121)
,p_name=>'WWV_FLOW_PLUGIN_DEV.IS_REQUIRED'
,p_message_language=>'pt-br'
,p_message_text=>'O valor deve ser especificado.'
,p_version_scn=>2705352
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141631230912752131)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.CANT_CONVERT_TO_VARCHAR2'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O tipo de dados %0 n\00E3o pode ser convertido em VARCHAR2!')
,p_version_scn=>2705359
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141719450517752157)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.COLUMN_NOT_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A coluna "%0" especificada para o atributo "%1" n\00E3o foi encontrada na instru\00E7\00E3o SQL!')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141546707067752106)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.INVALID_JSON_ARRAY'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O valor %0 de %1 n\00E3o \00E9 um array JSON v\00E1lido.')
,p_version_scn=>2705342
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141696605363752150)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.LOV_REQUIRED'
,p_message_language=>'pt-br'
,p_message_text=>'Uma consulta de lista de valores (LOV) ou uma lista de valores Nomeados deve ser especificada para %0.'
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141698277953752151)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.LOV_SQL_WRONG_COLUMN_COUNT'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00FAmero incorreto de colunas selecionado na consulta SQL da LOV para %0. Veja exemplos de instru\00E7\00F5es v\00E1lidas.')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141719271122752157)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.NO_COLUMN_FOR_ATTRIBUTE'
,p_message_language=>'pt-br'
,p_message_text=>'Nenhuma coluna especificada para o atributo "%0".'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141748464775752165)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.NUMBER_ATTRIBUTE_VALUE_INVALID'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O valor informado %0 do atributo "%1" n\00E3o \00E9 num\00E9rico.')
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141701719811752152)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.SQL_WRONG_DATA_TYPE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('%0 tem um tipo de dados incorreto na instru\00E7\00E3o SQL. A coluna #  %1 \00E9 %2 mas esperava %3.')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141719390867752157)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.WRONG_COLUMN_DATA_TYPE'
,p_message_language=>'pt-br'
,p_message_text=>'A coluna "%0" especificada para o atributo "%1" tem o tipo de dados %2, mas deveria ter %3.'
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141588810543752118)
,p_name=>'WWV_FLOW_PRINT_UTIL.REPORT_LAYOUT_NOT_FOUND'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel encontrar o layout do relat\00F3rio.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141576437738752115)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTIONS_LIMIT_EXCEEDED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O Limite de Execu\00E7\00F5es em Segundo Plano foi excedido para %0.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141526726355752100)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTION_ALREADY_RUNNING'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Outra Execu\00E7\00E3o de %0 j\00E1 est\00E1 em processamento.')
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141526661854752100)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTION_ALREADY_RUNNING_CTX'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Outra Execu\00E7\00E3o de %0 j\00E1 est\00E1 em processamento para o contexto %1.')
,p_version_scn=>2705338
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141541694732752104)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.FILES_NOT_VISIBLE_IN_WORKING_SESSION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Os arquivos submetidos a upload n\00E3o s\00E3o vis\00EDveis na sess\00E3o de trabalho para a Execu\00E7\00E3o de %0.')
,p_version_scn=>2705341
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141654138917752138)
,p_name=>'WWV_FLOW_RENDER_REPORT3.COMPUTE_SUM_NOT_SUPPORTED_FOR_WEB_SOURCES'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A funcionalidade Calcular Soma n\00E3o pode ser usada em relat\00F3rios baseados em uma Origem de Dados REST.')
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141615804037752126)
,p_name=>'WWV_FLOW_RENDER_SHORTCUT.UNABLE_SET_SHORT_VAL_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('ERR-2904 N\00E3o foi poss\00EDvel definir valor de atalho.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141620811603752128)
,p_name=>'WWV_FLOW_RENDER_SHORTCUT.UNKNOWN_TYPE_ERR'
,p_message_language=>'pt-br'
,p_message_text=>'Erro: Tipo de atalho desconhecido.'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141558512722752109)
,p_name=>'WWV_FLOW_SEARCH_API.TEXT_QUERY_TOO_LONG'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A consulta da pesquisa \00E9 muito longa.')
,p_version_scn=>2705347
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141609934192752124)
,p_name=>'WWV_FLOW_SECURITY.AUTH_SCHEME_FETCH_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o foi poss\00EDvel extrair authentication_scheme no aplicativo %0.')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141617973962752127)
,p_name=>'WWV_FLOW_SECURITY.COMPONENT_FETCH_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o \00E9 poss\00EDvel extrair o componente %0.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141688240184752148)
,p_name=>'WWV_FLOW_SESSION_API.TENANT_ID_EXISTS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O id do tenant j\00E1 existe para a sess\00E3o atual.')
,p_version_scn=>2705372
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141621170967752128)
,p_name=>'WWV_FLOW_USER_API.T_EMAIL'
,p_message_language=>'pt-br'
,p_message_text=>'E-Mail'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141747965364752165)
,p_name=>'WWV_FLOW_WEB_SERVICES.AUTHENTICATION_FAILED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Falha na autentica\00E7\00E3o.')
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141648586770752136)
,p_name=>'WWV_FLOW_WEB_SERVICES.COOKIE_INVALID'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Um ou mais cookies definidos em apex_util.g_request_cookies cont\00EAm um valor inv\00E1lido.')
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141630481768752131)
,p_name=>'WWV_FLOW_WEB_SERVICES.INVALID_UDDI_RESPONSE'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A resposta do registro UDDI foi inv\00E1lida.')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141589709149752118)
,p_name=>'WWV_FLOW_WEB_SERVICES.INVALID_WSDL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O URL fornecido n\00E3o retornou um documento WSDL v\00E1lido.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141592516836752119)
,p_name=>'WWV_FLOW_WEB_SERVICES.MULTIPLE_SOAP'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O documento WSDL cont\00E9m v\00E1rias associa\00E7\00F5es SOAP. O &PRODUCT_NAME. suporta somente WSDL''s com uma associa\00E7\00E3o SOAP. Clique em Criar Refer\00EAncia de Web Service Manualmente para configurar a cria\00E7\00E3o de uma refer\00EAncia para esse servi\00E7o.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141668111280752142)
,p_name=>'WWV_FLOW_WEB_SERVICES.NOT_XML'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A resposta do servi\00E7o n\00E3o era XML.')
,p_version_scn=>2705368
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141747890961752165)
,p_name=>'WWV_FLOW_WEB_SERVICES.NO_VALID_OAUTH_TOKEN'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Token de acesso do OAuth n\00E3o dispon\00EDvel ou expirado.')
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141712349590752155)
,p_name=>'WWV_FLOW_WEB_SERVICES.REQUEST_LIMIT_EXCEEDED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Voc\00EA excedeu o n\00FAmero m\00E1ximo de mensagens de solicita\00E7\00F5es de servi\00E7o Web por espa\00E7o de trabalho. Entre em contato com seu administrador.')
,p_version_scn=>2705374
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141748028931752165)
,p_name=>'WWV_FLOW_WEB_SERVICES.UNSUPPORTED_OAUTH_TOKEN'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O servidor respondeu com um tipo de token OAuth n\00E3o suportado.')
,p_version_scn=>2705380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141591926205752119)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_NO_SOAP'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O documento WSDL n\00E3o continha um bind para SOAP que \00E9 necess\00E1rio para adicionar a refer\00EAncia.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141587328641752118)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_REQUIRES_AUTH'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Este WSDL requer credenciais de autentica\00E7\00E3o. Forne\00E7a o nome de usu\00E1rio e a senha abaixo.')
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141598378015752121)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_UNHANDLED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O documento WSDL n\00E3o p\00F4de ser compreendido pelo mecanismo de convers\00E3o. Clique em Criar Refer\00EAncia de Web Service Manualmente para continuar criando uma refer\00EAncia para esse servi\00E7o.')
,p_version_scn=>2705352
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141671175527752143)
,p_name=>'WWV_FLOW_WIZARD_API.UPDATE_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('N\00E3o foi poss\00EDvel processar a atualiza\00E7\00E3o.')
,p_version_scn=>2705369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141696986524752150)
,p_name=>'WWV_FLOW_WORKSHEET.LOV_DISPLAY_AND_RETURN_COLUMN_EQUAL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('As colunas de retorno e de exibi\00E7\00E3o da Lista de Valores s\00E3o iguais!')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141696844715752150)
,p_name=>'WWV_FLOW_WORKSHEET.LOV_NO_RETURN_COLUMN'
,p_message_language=>'pt-br'
,p_message_text=>unistr('A Lista de Valores n\00E3o possui uma coluna de retorno.')
,p_version_scn=>2705373
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141624551709752129)
,p_name=>'WWV_RENDER_REPORT3.COLUMN_VALUE_ERR'
,p_message_language=>'pt-br'
,p_message_text=>'Erro ao extrair valor de coluna: %0'
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141649482590752136)
,p_name=>'WWV_RENDER_REPORT3.DATA_TOO_OLD'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Os dados atuais do form tabular s\00E3o muito antigos.<br/> Clique <strong><a href="%0">aqui</a></strong> para descartar suas altera\00E7\00F5es e recarregue os dados do banco de dados.')
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141604649793752123)
,p_name=>'WWV_RENDER_REPORT3.ERR_DETERMINE_PAGINATION'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro ao determinar string de pagina\00E7\00E3o')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141604540245752123)
,p_name=>'WWV_RENDER_REPORT3.ERR_DETERMINE_QUERY_HEADINGS'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('n\00E3o foi poss\00EDvel determinar cabe\00E7alhos de consulta:'),
'%0'))
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141604714748752123)
,p_name=>'WWV_RENDER_REPORT3.ERR_REPORT_FOOTER'
,p_message_language=>'pt-br'
,p_message_text=>unistr('erro ao executar substitui\00E7\00F5es de rodap\00E9 de relat\00F3rio')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141604876250752123)
,p_name=>'WWV_RENDER_REPORT3.FAILED_PARSING_QUERY'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'falha ao fazer parsing de consulta SQL:',
'%0',
'%1'))
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141610999163752125)
,p_name=>'WWV_RENDER_REPORT3.FOUND_BUT_NOT_DISPLAYED'
,p_message_language=>'pt-br'
,p_message_text=>unistr('M\00EDnimo de linhas solicitado: %0, linhas encontradas mas n\00E3o exibidas: %1')
,p_version_scn=>2705356
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141607374769752124)
,p_name=>'WWV_RENDER_REPORT3.HTML_USE_COLUMN_ALIAS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('a coluna #%0 (%1) da consulta \00E9 inv\00E1lida; as colunas que usam HTML necessitam de nomes de aliases')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141624494630752129)
,p_name=>'WWV_RENDER_REPORT3.QUERY_HEADING_ERR'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Erro ao obter cabe\00E7alhos de consulta: %0')
,p_version_scn=>2705357
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141604918411752123)
,p_name=>'WWV_RENDER_REPORT3.REPORT_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'reportar erro:',
'%0'))
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141645066080752135)
,p_name=>'WWV_RENDER_REPORT3.SORT_BY_THIS_COLUMN'
,p_message_language=>'pt-br'
,p_message_text=>'Classificar por esta coluna'
,p_version_scn=>2705362
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141607433078752124)
,p_name=>'WWV_RENDER_REPORT3.SYNTAX_ERROR'
,p_message_language=>'pt-br'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>A consulta n\00E3o pode ser submetida a parse; verifique a sintaxe de sua consulta.'),
'(%0)',
'</p>'))
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141649556099752136)
,p_name=>'WWV_RENDER_REPORT3.UNSAVED_DATA'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Este form cont\00E9m altera\00E7\00F5es n\00E3o salvas. Pressione "Ok" para prosseguir sem salvar suas altera\00E7\00F5es. ')
,p_version_scn=>2705363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141654029726752138)
,p_name=>'WWV_RENDER_REPORT3.UNSUPPORTED_PAGINATION_SCHEME'
,p_message_language=>'pt-br'
,p_message_text=>unistr('O esquema de pagina\00E7\00E3o do relat\00F3rio (%0) n\00E3o \00E9 suportado com a origem de dados escolhida.')
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141607262796752124)
,p_name=>'WWV_RENDER_REPORT3.USE_COLUMN_ALIAS'
,p_message_language=>'pt-br'
,p_message_text=>unistr('a coluna #%0 (%1) da consulta \00E9 inv\00E1lida, use alias de coluna')
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141611093353752125)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_MORE_THAN_Z'
,p_message_language=>'pt-br'
,p_message_text=>'linha(s) %0 - %1 de mais do que %2'
,p_version_scn=>2705356
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141651573262752137)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_MORE_THAN_Z_2'
,p_message_language=>'pt-br'
,p_message_text=>'%0 - %1 de mais de %2'
,p_version_scn=>2705364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141610890862752125)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z'
,p_message_language=>'pt-br'
,p_message_text=>'linha(s) %0 - %1 de %2'
,p_version_scn=>2705356
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141591652859752119)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z_2'
,p_message_language=>'pt-br'
,p_message_text=>'%0 - %1 de %2'
,p_version_scn=>2705350
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141605097089752123)
,p_name=>'Y'
,p_message_language=>'pt-br'
,p_message_text=>'S'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141612300883752125)
,p_name=>'YEAR'
,p_message_language=>'pt-br'
,p_message_text=>'ano'
,p_version_scn=>2705356
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141604262170752123)
,p_name=>'YEARS'
,p_message_language=>'pt-br'
,p_message_text=>'anos'
,p_version_scn=>2705353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141649657609752136)
,p_name=>'YES'
,p_message_language=>'pt-br'
,p_message_text=>'Sim'
,p_version_scn=>2705363
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
 p_id=>wwv_flow_imp.id(109678305570583962.4475)
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
 p_id=>1.4475
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
