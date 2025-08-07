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
,p_default_application_id=>4483
,p_default_id_offset=>0
,p_default_owner=>'APEX_240200'
);
end;
/
 
prompt APPLICATION 4483 - Oracle APEX Runtime Messages
--
-- Application Export:
--   Application:     4483
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
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'A144692691093759081')
,p_page_view_logging=>'YES'
,p_charset=>'utf-8'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt_last_reset=>'20250422180859'
,p_bookmark_checksum_function=>'SH1'
,p_compatibility_mode=>'24.2'
,p_session_state_commits=>'IMMEDIATE'
,p_flow_language=>'no'
,p_flow_language_derived_from=>'SESSION'
,p_date_format=>'&DATE_FORMAT.'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(109678305570583962.4483)
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
 p_id=>wwv_flow_imp.id(4483)
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
 p_id=>wwv_flow_imp.id(728504220438374.4483)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SELECT_MANY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_values_as', 'separated')).to_clob
,p_version_scn=>7007816
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(736540203200530.4483)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_BOSS'
,p_version_scn=>243430877
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(800575880762576.4483)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'NATIVE_OPEN_AI_ASSISTANT'
,p_version_scn=>15457644
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2657043006125217.4483)
,p_plugin_type=>'PROCESS TYPE'
,p_plugin=>'NATIVE_GEOCODING'
,p_attribute_01=>'RELAX_HOUSE_NUMBER'
,p_version_scn=>117636987
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(110599941590099161.4483)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'default_icon', 'fa-star',
  'tooltip', '#VALUE#')).to_clob
,p_version_scn=>7007818
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(118481226255833028.4483)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_MAP_REGION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_vector_tile_layers', 'Y')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(123214098089478467.4483)
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
 p_id=>wwv_flow_imp.id(124389732573989299.4483)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_ADFBC'
,p_version_scn=>37165931336889
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(209516503264520988.4483)
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
 p_id=>wwv_flow_imp.id(285800719532138903.4483)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N')).to_clob
,p_version_scn=>7007823
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(649595203182764436.4483)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_style', 'SWITCH_CB',
  'off_value', 'N',
  'on_value', 'Y')).to_clob
,p_version_scn=>6539584
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1874744429444344138.4483)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'include_slider', 'N')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1941451863897626238.4483)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'actions_menu_structure', 'IG')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2027366558906572283.4483)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'mode', 'FULL')).to_clob
,p_version_scn=>7007824
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2120597162971751123.4483)
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
 p_id=>wwv_flow_imp.id(649613204592764515.4483)
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
 p_id=>wwv_flow_imp.id(850359229090693491.4483)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Wizard Dialog.no'
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
 p_id=>wwv_flow_imp.id(293526110820992194.4483)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4483)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293526630547992195.4483)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4483)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293527171164992195.4483)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4483)
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
 p_id=>wwv_flow_imp.id(851037359784626333.4483)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Dialog.no'
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
 p_id=>wwv_flow_imp.id(293473352245977306.4483)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4483)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293473882718977306.4483)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4483)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293474370844977307.4483)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4483)
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
 p_id=>wwv_flow_imp.id(851037631091626378.4483)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Edit Screen.no'
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
 p_id=>wwv_flow_imp.id(2495515088702127.4483)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4483)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2496016567702127.4483)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4483)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2496522618702127.4483)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4483)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2497097895702127.4483)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4483)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2497562953702128.4483)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4483)
,p_name=>'Edit Screen Header'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2498085850702128.4483)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4483)
,p_name=>'Page Position 5'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2498553894702128.4483)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4483)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2499023066702128.4483)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4483)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2499516729702128.4483)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4483)
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
 p_id=>wwv_flow_imp.id(851039898661626389.4483)
,p_theme_id=>3
,p_name=>'APEX 5.0 - No Side Bar.no'
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
 p_id=>wwv_flow_imp.id(2418665544706094.4483)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4483)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2419139140706094.4483)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4483)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2419660231706094.4483)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4483)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2420136000706094.4483)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4483)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2420617033706094.4483)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4483)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2421142368706094.4483)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4483)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2421629849706095.4483)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4483)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2422132460706095.4483)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4483)
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
 p_id=>wwv_flow_imp.id(851040471818626394.4483)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Right Side Bar.no'
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
 p_id=>wwv_flow_imp.id(1537388880131854.4483)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4483)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1537880270131855.4483)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4483)
,p_name=>'Page Header (Position 3)'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1538315330131855.4483)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4483)
,p_name=>'Page Header (Position 4)'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1538840638131855.4483)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4483)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1539339441131855.4483)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4483)
,p_name=>'After Body'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1539830162131855.4483)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4483)
,p_name=>'Page Header (Position 1)'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1540338421131855.4483)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4483)
,p_name=>'Page Header (Position 2)'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1540832064131856.4483)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4483)
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
 p_id=>wwv_flow_imp.id(851041812938626395.4483)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Sign Up Wizard.no'
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
 p_id=>wwv_flow_imp.id(115212309210289451.4483)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4483)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115212857712289451.4483)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4483)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115213340345289452.4483)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4483)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115213804331289452.4483)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4483)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115214317592289452.4483)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4483)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115214875819289453.4483)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4483)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115215325320289453.4483)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4483)
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
 p_id=>wwv_flow_imp.id(851042476105626395.4483)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Wizard Page.no'
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
 p_id=>wwv_flow_imp.id(1485266589875353.4483)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4483)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1485734308875353.4483)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4483)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1486237142875354.4483)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4483)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1486735024875354.4483)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4483)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1487219028875354.4483)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4483)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1487770987875354.4483)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4483)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1488272041875354.4483)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4483)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1488725778875354.4483)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4483)
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
 p_id=>wwv_flow_imp.id(514381861202541059.4483)
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
 p_id=>wwv_flow_imp.id(514382190540541061.4483)
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
 p_id=>wwv_flow_imp.id(514382538845541061.4483)
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
 p_id=>wwv_flow_imp.id(620629666890811728.4483)
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
 p_id=>wwv_flow_imp.id(620629778318811745.4483)
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
 p_id=>wwv_flow_imp.id(868252865986181054.4483)
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
 p_id=>wwv_flow_imp.id(514338947870435171.4483)
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
 p_id=>wwv_flow_imp.id(2962385277500935.4483)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4483)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2962865718500935.4483)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4483)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2963338641500935.4483)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4483)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2963894582500935.4483)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4483)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2964329937500935.4483)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4483)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2964897214500936.4483)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4483)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2965324003500936.4483)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4483)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2965838011500936.4483)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4483)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2966328405500936.4483)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4483)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2966823859500936.4483)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4483)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2967325351500936.4483)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4483)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2967812485500936.4483)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4483)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2968377768500937.4483)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4483)
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
 p_id=>wwv_flow_imp.id(514343873675436760.4483)
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
 p_id=>wwv_flow_imp.id(32585474981747544.4483)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4483)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32585915750747544.4483)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4483)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32586471989747545.4483)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4483)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32586972270747545.4483)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4483)
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
 p_id=>wwv_flow_imp.id(771803843049318447.4483)
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
 p_id=>wwv_flow_imp.id(3207496127505978.4483)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4483)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3207907805505978.4483)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4483)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3208484941505978.4483)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4483)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3208991047505978.4483)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4483)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3209402462505979.4483)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4483)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3209972507505979.4483)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4483)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3210460159505979.4483)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4483)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3210935368505979.4483)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4483)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3211466566505979.4483)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4483)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3211956312505979.4483)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4483)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3212461962505979.4483)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4483)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3212966370505980.4483)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4483)
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
 p_id=>wwv_flow_imp.id(850406444708718383.4483)
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
 p_id=>wwv_flow_imp.id(2204663592232325.4483)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4483)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2205135519232325.4483)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4483)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2205694824232325.4483)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4483)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2206129075232325.4483)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4483)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2206618558232325.4483)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4483)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2207115910232326.4483)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4483)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2207688896232326.4483)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4483)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2208160700232326.4483)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4483)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2208614050232326.4483)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4483)
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
 p_id=>wwv_flow_imp.id(850442966147812557.4483)
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
 p_id=>wwv_flow_imp.id(3346988371508588.4483)
,p_plug_template_id=>wwv_flow_imp.id(850442966147812557.4483)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3347426198508588.4483)
,p_plug_template_id=>wwv_flow_imp.id(850442966147812557.4483)
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
 p_id=>wwv_flow_imp.id(856206049762521193.4483)
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
 p_id=>wwv_flow_imp.id(2526185270486606.4483)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4483)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2526610033486606.4483)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4483)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2527184084486606.4483)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4483)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2527626846486607.4483)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4483)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2528141078486607.4483)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4483)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2528637911486607.4483)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4483)
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
 p_id=>wwv_flow_imp.id(914802799655239969.4483)
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
 p_id=>wwv_flow_imp.id(88183211858816924.4483)
,p_plug_template_id=>wwv_flow_imp.id(914802799655239969.4483)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(88183732152816924.4483)
,p_plug_template_id=>wwv_flow_imp.id(914802799655239969.4483)
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
 p_id=>wwv_flow_imp.id(914803495164240003.4483)
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
 p_id=>wwv_flow_imp.id(3373447170510516.4483)
,p_plug_template_id=>wwv_flow_imp.id(914803495164240003.4483)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3373993086510516.4483)
,p_plug_template_id=>wwv_flow_imp.id(914803495164240003.4483)
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
 p_id=>wwv_flow_imp.id(915210356236972585.4483)
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
 p_id=>wwv_flow_imp.id(2899946654493378.4483)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4483)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2900442121493378.4483)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4483)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2900949359493378.4483)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4483)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2901467944493378.4483)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4483)
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
 p_id=>wwv_flow_imp.id(915371118115573423.4483)
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
 p_id=>wwv_flow_imp.id(2695578355491332.4483)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4483)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2696079816491332.4483)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4483)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2696558276491332.4483)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4483)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2697055726491332.4483)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4483)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2697581510491332.4483)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4483)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2698048732491333.4483)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4483)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2698576547491333.4483)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4483)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2699004772491333.4483)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4483)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2699557295491333.4483)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4483)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2700035673491333.4483)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4483)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2700500589491333.4483)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4483)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2701097053491333.4483)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4483)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2701554382491334.4483)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4483)
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
 p_id=>wwv_flow_imp.id(1274355059486017828.4483)
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
 p_id=>wwv_flow_imp.id(61232728057733462.4483)
,p_plug_template_id=>wwv_flow_imp.id(1274355059486017828.4483)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(61233207886733462.4483)
,p_plug_template_id=>wwv_flow_imp.id(1274355059486017828.4483)
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
 p_id=>wwv_flow_imp.id(514332014414430986.4483)
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
 p_id=>wwv_flow_imp.id(514332292784430987.4483)
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
 p_id=>wwv_flow_imp.id(860563697365629462.4483)
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
 p_id=>wwv_flow_imp.id(865273508717512144.4483)
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
 p_id=>wwv_flow_imp.id(908020362212234651.4483)
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
 p_id=>wwv_flow_imp.id(914818080687341593.4483)
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
 p_id=>wwv_flow_imp.id(851049711466639395.4483)
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
 p_id=>wwv_flow_imp.id(851054516889639461.4483)
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
 p_id=>wwv_flow_imp.id(851055225644639463.4483)
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
 p_id=>wwv_flow_imp.id(851056531929639482.4483)
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
 p_id=>wwv_flow_imp.id(914792024808213039.4483)
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
 p_id=>wwv_flow_imp.id(914792322768213043.4483)
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
 p_id=>wwv_flow_imp.id(915377874236666939.4483)
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
 p_id=>wwv_flow_imp.id(1041941432531249038.4483)
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
 p_id=>wwv_flow_imp.id(850683711614406253.4483)
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
 p_id=>wwv_flow_imp.id(851047536471633848.4483)
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
 p_id=>wwv_flow_imp.id(851047676005633854.4483)
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
 p_id=>wwv_flow_imp.id(851047684809633856.4483)
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
 p_id=>wwv_flow_imp.id(851047795461633856.4483)
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
 p_id=>wwv_flow_imp.id(860542631889572088.4483)
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
 p_id=>wwv_flow_imp.id(1321751941832424103.4483)
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
 p_id=>wwv_flow_imp.id(514333590213433126.4483)
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
 p_id=>wwv_flow_imp.id(649611704621764507.4483)
,p_page_name=>'winlov'
,p_page_title=>unistr('S\00F8kedialogboks')
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
,p_find_button_text=>unistr('S\00F8k')
,p_find_button_attr=>'class="a-Button a-Button--hot a-Button--padLeft"'
,p_close_button_text=>'Lukk'
,p_close_button_attr=>'class="a-Button u-pullRight"'
,p_next_button_text=>'Neste &gt;'
,p_next_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_prev_button_text=>'&lt; Forrige'
,p_prev_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'380'
,p_height=>'480'
,p_result_row_x_of_y=>'<div class="a-PopupLOV-pagination">Rad #FIRST_ROW#-#LAST_ROW#</div>'
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
 p_id=>wwv_flow_imp.id(649611609668764506.4483)
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
 p_id=>wwv_flow_imp.id(182005134783173294.4483)
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
 p_id=>wwv_flow_imp.id(666074212329754757.4483)
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
 p_id=>wwv_flow_imp.id(666074525535755551.4483)
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
 p_id=>wwv_flow_imp.id(717250289307903026.4483)
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
 p_id=>wwv_flow_imp.id(2336377640986141.4483)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL'
,p_display_name=>'Heading Level'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(806925000765340952.4483)
,p_theme_id=>3
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default - No Icons'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808380142596819918.4483)
,p_theme_id=>3
,p_name=>'ALTERNATING_TABLE_ROWS'
,p_display_name=>'Alternating Table Rows'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Enable'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808380828683819918.4483)
,p_theme_id=>3
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Disable'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808381542095819918.4483)
,p_theme_id=>3
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default Border'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808383088145819924.4483)
,p_theme_id=>3
,p_name=>'REPORT_WIDTH'
,p_display_name=>'Report Width'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850406791580718389.4483)
,p_theme_id=>3
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850407096779718396.4483)
,p_theme_id=>3
,p_name=>'REGION_PADDING'
,p_display_name=>'Region Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Padding'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850407509193718398.4483)
,p_theme_id=>3
,p_name=>'REGION_STYLE'
,p_display_name=>'Region Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Style'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(851050160062639437.4483)
,p_theme_id=>3
,p_name=>'BADGE_LAYOUT'
,p_display_name=>'Badge Layout'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(851051045625639457.4483)
,p_theme_id=>3
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856113214217058023.4483)
,p_theme_id=>3
,p_name=>'HEIGHT'
,p_display_name=>'Height'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856114568019058024.4483)
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
 p_id=>wwv_flow_imp.id(856114830529058024.4483)
,p_theme_id=>3
,p_name=>'FORM_LABEL_WIDTH'
,p_display_name=>'Form Label Width'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856115135223058024.4483)
,p_theme_id=>3
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Not Part of Button Set'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116214022058024.4483)
,p_theme_id=>3
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>1
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116523282058024.4483)
,p_theme_id=>3
,p_name=>'FORM_LABEL_POSITION'
,p_display_name=>'Form Label Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116798725058025.4483)
,p_theme_id=>3
,p_name=>'BUTTON_SIZE'
,p_display_name=>'Button Size'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Button Size'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117102944058028.4483)
,p_theme_id=>3
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing left'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Left Spacing'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117454663058028.4483)
,p_theme_id=>3
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Right Spacing'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117908453058029.4483)
,p_theme_id=>3
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Icon on Right'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856118261810058029.4483)
,p_theme_id=>3
,p_name=>'BUTTON_TYPE'
,p_display_name=>'Button Type'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856206461450521195.4483)
,p_theme_id=>3
,p_name=>'ALERT_TYPE'
,p_display_name=>'Alert Type'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856206736628521198.4483)
,p_theme_id=>3
,p_name=>'DISPLAY'
,p_display_name=>'Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(860570508910721307.4483)
,p_theme_id=>3
,p_name=>'REGION_POSITION'
,p_display_name=>'Region Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(860571060920721309.4483)
,p_theme_id=>3
,p_name=>'REGION_OVERFLOW'
,p_display_name=>'Region Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(908020718209234676.4483)
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
 p_id=>wwv_flow_imp.id(1487577187426769.4483)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden to Assistive Tech'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4483)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4483)
,p_template_types=>'REGION'
,p_help_text=>'By default, region title is hidden but accessible, use this option to remove the header from accessible interface'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2336635141996782.4483)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H1'
,p_display_name=>'H1'
,p_display_sequence=>10
,p_css_classes=>'js-headingLevel-1'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4483)
,p_template_types=>'REGION'
,p_help_text=>'H1'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2336917964996782.4483)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H2'
,p_display_name=>'H2'
,p_display_sequence=>20
,p_css_classes=>'js-headingLevel-2'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4483)
,p_template_types=>'REGION'
,p_help_text=>'H2'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2337368425996782.4483)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H3'
,p_display_name=>'H3'
,p_display_sequence=>30
,p_css_classes=>'js-headingLevel-3'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4483)
,p_template_types=>'REGION'
,p_help_text=>'H3'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2337706283996782.4483)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H4'
,p_display_name=>'H4'
,p_display_sequence=>40
,p_css_classes=>'js-headingLevel-4'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4483)
,p_template_types=>'REGION'
,p_help_text=>'H4'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2338144805996782.4483)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H5'
,p_display_name=>'H5'
,p_display_sequence=>50
,p_css_classes=>'js-headingLevel-5'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4483)
,p_template_types=>'REGION'
,p_help_text=>'H5'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2338562059996782.4483)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H6'
,p_display_name=>'H6'
,p_display_sequence=>60
,p_css_classes=>'js-headingLevel-6'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4483)
,p_template_types=>'REGION'
,p_help_text=>'H6'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134384175764258.4483)
,p_theme_id=>3
,p_name=>'LARGELEFT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapLeft'
,p_group_id=>wwv_flow_imp.id(856117102944058028.4483)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134654971764258.4483)
,p_theme_id=>3
,p_name=>'LARGERIGHT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapRight'
,p_group_id=>wwv_flow_imp.id(856117454663058028.4483)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134823880764258.4483)
,p_theme_id=>3
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(856117908453058029.4483)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135009020764258.4483)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>3
,p_css_classes=>'a-Button--large'
,p_group_id=>wwv_flow_imp.id(856116798725058025.4483)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135269851764258.4483)
,p_theme_id=>3
,p_name=>'SMALLLEFT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padLeft'
,p_group_id=>wwv_flow_imp.id(856117102944058028.4483)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135477215764258.4483)
,p_theme_id=>3
,p_name=>'SMALLRIGHT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padRight'
,p_group_id=>wwv_flow_imp.id(856117454663058028.4483)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135634744764258.4483)
,p_theme_id=>3
,p_name=>'INNERBUTTON'
,p_display_name=>'Inner Button'
,p_display_sequence=>2
,p_css_classes=>'a-Button--pill'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4483)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135785730764258.4483)
,p_theme_id=>3
,p_name=>'LASTBUTTON'
,p_display_name=>'Last Button'
,p_display_sequence=>3
,p_css_classes=>'a-Button--pillEnd'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4483)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136068296764258.4483)
,p_theme_id=>3
,p_name=>'FIRSTBUTTON'
,p_display_name=>'First Button'
,p_display_sequence=>1
,p_css_classes=>'a-Button--pillStart'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4483)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136225140764258.4483)
,p_theme_id=>3
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>1
,p_css_classes=>'a-Button--primary'
,p_group_id=>wwv_flow_imp.id(856118261810058029.4483)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136360666764258.4483)
,p_theme_id=>3
,p_name=>'REGIONHEADERBUTTON'
,p_display_name=>'Button in Region Header'
,p_display_sequence=>1
,p_css_classes=>'a-Button--regionHeader'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136507481764259.4483)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--small'
,p_group_id=>wwv_flow_imp.id(856116798725058025.4483)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136620486764259.4483)
,p_theme_id=>3
,p_name=>'STRONGBUTTONLABEL'
,p_display_name=>'Strong Button Label'
,p_display_sequence=>1
,p_css_classes=>'a-Button--strongLabel'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136861925764259.4483)
,p_theme_id=>3
,p_name=>'AUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form--autoWidthLabels'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4483)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137023291764259.4483)
,p_theme_id=>3
,p_name=>'FIXEDWIDTH'
,p_display_name=>'Fixed'
,p_display_sequence=>10
,p_css_classes=>'a-Form--fixedLabels'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4483)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137193234764259.4483)
,p_theme_id=>3
,p_name=>'LABELSABOVE'
,p_display_name=>'Labels Above'
,p_display_sequence=>1
,p_css_classes=>'a-Form--labelsAbove'
,p_group_id=>wwv_flow_imp.id(856116523282058024.4483)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137470293764259.4483)
,p_theme_id=>3
,p_name=>'ALIGNLABELSLEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Form--leftLabels'
,p_group_id=>wwv_flow_imp.id(856114568019058024.4483)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137586003764259.4483)
,p_theme_id=>3
,p_name=>'LABELAUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--autoLabelWidth'
,p_group_id=>wwv_flow_imp.id(856116214022058024.4483)
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137737661764259.4483)
,p_theme_id=>3
,p_name=>'STRETCHFORMFIELD'
,p_display_name=>'Stretch Form Field'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--stretch'
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137933035764259.4483)
,p_theme_id=>3
,p_name=>'FIXEDLARGE'
,p_display_name=>'Fixed (Large Width)'
,p_display_sequence=>30
,p_css_classes=>'a-Form-fixedLabelsLarge'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4483)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138175863764259.4483)
,p_theme_id=>3
,p_name=>'FIXEDMEDIUM'
,p_display_name=>'Fixed (Medium Width)'
,p_display_sequence=>20
,p_css_classes=>'a-Form-fixedLabelsMed'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4483)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138340877764259.4483)
,p_theme_id=>3
,p_name=>'180PX'
,p_display_name=>'180px'
,p_display_sequence=>10
,p_css_classes=>'h180'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4483)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138553321764259.4483)
,p_theme_id=>3
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>20
,p_css_classes=>'h240'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4483)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138777457764259.4483)
,p_theme_id=>3
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>30
,p_css_classes=>'h320'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4483)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138891974764260.4483)
,p_theme_id=>3
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>50
,p_css_classes=>'h480'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4483)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857139153872764260.4483)
,p_theme_id=>3
,p_name=>'540PX'
,p_display_name=>'540px'
,p_display_sequence=>60
,p_css_classes=>'h540'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4483)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857139375337764260.4483)
,p_theme_id=>3
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>70
,p_css_classes=>'h640'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4483)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145206107768768.4483)
,p_theme_id=>3
,p_name=>'USE_COLORED_BACKGROUND'
,p_display_name=>'Use Colored Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4483)
,p_css_classes=>'a-Alert--colorBG'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145328630768768.4483)
,p_theme_id=>3
,p_name=>'USE_DEFAULT_ICONS'
,p_display_name=>'Use Default Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4483)
,p_css_classes=>'a-Alert--defaultIcons'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145505007768768.4483)
,p_theme_id=>3
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4483)
,p_css_classes=>'a-Alert--warning'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4483)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145725778768768.4483)
,p_theme_id=>3
,p_name=>'ERROR'
,p_display_name=>'Error'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4483)
,p_css_classes=>'a-Alert--danger'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4483)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145892117768768.4483)
,p_theme_id=>3
,p_name=>'INFORMATIONAL'
,p_display_name=>'Informational'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4483)
,p_css_classes=>'a-Alert--info'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4483)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146085228768768.4483)
,p_theme_id=>3
,p_name=>'HORIZONTAL'
,p_display_name=>'Horizontal'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4483)
,p_css_classes=>'a-Alert--horizontal'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4483)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146322225768769.4483)
,p_theme_id=>3
,p_name=>'WIZARD'
,p_display_name=>'Wizard'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4483)
,p_css_classes=>'a-Alert--wizard'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4483)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146393064768769.4483)
,p_theme_id=>3
,p_name=>'REMOVE_ICON'
,p_display_name=>'Remove Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4483)
,p_css_classes=>'a-Alert--noIcon'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146615368768769.4483)
,p_theme_id=>3
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4483)
,p_css_classes=>'a-Alert--success'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4483)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147042367768771.4483)
,p_theme_id=>3
,p_name=>'REGIONCONTAINSITEMSTEXT'
,p_display_name=>'Region Contains Items / Text'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4483)
,p_css_classes=>'a-ButtonRegion--withItems'
,p_template_types=>'REGION'
,p_help_text=>'Check this option if this region contains items or text.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147189725768771.4483)
,p_theme_id=>3
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4483)
,p_css_classes=>'a-ButtonRegion--noUI'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4483)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147385795768771.4483)
,p_theme_id=>3
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4483)
,p_css_classes=>'a-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4483)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147655668768771.4483)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4483)
,p_css_classes=>'a-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4483)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147872948768771.4483)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4483)
,p_css_classes=>'a-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4483)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147976018768771.4483)
,p_theme_id=>3
,p_name=>'WIZARDDIALOG'
,p_display_name=>'Used for Wizard Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4483)
,p_css_classes=>'a-ButtonRegion--wizard'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857148162424768771.4483)
,p_theme_id=>3
,p_name=>'VISIBLE'
,p_display_name=>'Visible'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4483)
,p_css_classes=>'a-ButtonRegion--showTitle'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4483)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857148341454768771.4483)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4483)
,p_css_classes=>'a-ButtonRegion--accessibleTitle'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4483)
,p_template_types=>'REGION'
,p_help_text=>'Use this option to add a visually hidden heading which is accessible for screen readers, but otherwise not visible to users.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149438708768778.4483)
,p_theme_id=>3
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4483)
,p_css_classes=>'a-BadgeList--float'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4483)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149614105768778.4483)
,p_theme_id=>3
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4483)
,p_css_classes=>'a-BadgeList--fixed'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4483)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149843563768778.4483)
,p_theme_id=>3
,p_name=>'STACKEDVERTICALLY'
,p_display_name=>'Stacked Vertically'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4483)
,p_css_classes=>'a-BadgeList--stacked'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4483)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149998210768778.4483)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'32px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4483)
,p_css_classes=>'a-BadgeList--small'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4483)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150194417768778.4483)
,p_theme_id=>3
,p_name=>'MEDIUM'
,p_display_name=>'48px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4483)
,p_css_classes=>'a-BadgeList--medium'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4483)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150439507768778.4483)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'64px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4483)
,p_css_classes=>'a-BadgeList--large'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4483)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150608654768780.4483)
,p_theme_id=>3
,p_name=>'XLARGE'
,p_display_name=>'96px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4483)
,p_css_classes=>'a-BadgeList--xlarge'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4483)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150792333768780.4483)
,p_theme_id=>3
,p_name=>'XXLARGE'
,p_display_name=>'128px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4483)
,p_css_classes=>'a-BadgeList--xxlarge'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4483)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151008734768780.4483)
,p_theme_id=>3
,p_name=>'2COLUMNNGRID'
,p_display_name=>'2 Columnn Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4483)
,p_css_classes=>'a-BadgeList--cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4483)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151259777768780.4483)
,p_theme_id=>3
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4483)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--3cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4483)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151408063768780.4483)
,p_theme_id=>3
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4483)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--4cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4483)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151643103768780.4483)
,p_theme_id=>3
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4483)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--5cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4483)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151861194768780.4483)
,p_theme_id=>3
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4483)
,p_css_classes=>'a-BadgeList--flex'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4483)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896798730495581814.4483)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4483)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(808380142596819918.4483)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896798963380581814.4483)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4483)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(808380828683819918.4483)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799089194581814.4483)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4483)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4483)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799349986581814.4483)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4483)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4483)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799577541581814.4483)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4483)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4483)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799637215581814.4483)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4483)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799807498581814.4483)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4483)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_imp.id(808383088145819924.4483)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022191342234716.4483)
,p_theme_id=>3
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4483)
,p_css_classes=>'a-MediaList--cols a-MediaList--2cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4483)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022392217234716.4483)
,p_theme_id=>3
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4483)
,p_css_classes=>'a-MediaList--cols a-MediaList--3cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4483)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022597980234716.4483)
,p_theme_id=>3
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4483)
,p_css_classes=>'a-MediaList--cols a-MediaList--4cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4483)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022867300234717.4483)
,p_theme_id=>3
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4483)
,p_css_classes=>'a-MediaList--cols a-MediaList--5cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4483)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023065592234717.4483)
,p_theme_id=>3
,p_name=>'SPANHORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4483)
,p_css_classes=>'a-MediaList--horizontal'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4483)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023131122234717.4483)
,p_theme_id=>3
,p_name=>'HIDEBADGE'
,p_display_name=>'Hide Badge'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4483)
,p_css_classes=>'a-MediaList--noBadge'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023191297234717.4483)
,p_theme_id=>3
,p_name=>'HIDEDESCRIPTION'
,p_display_name=>'Hide Description'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4483)
,p_css_classes=>'a-MediaList--noDesc'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023315038234717.4483)
,p_theme_id=>3
,p_name=>'HIDETITLE'
,p_display_name=>'Hide Title'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4483)
,p_css_classes=>'a-MediaList--noTitle'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023432264234717.4483)
,p_theme_id=>3
,p_name=>'HIDEICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4483)
,p_css_classes=>'a-MediaList--noIcons'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023494059234717.4483)
,p_theme_id=>3
,p_name=>'SLIMLIST'
,p_display_name=>'Slim List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4483)
,p_css_classes=>'a-MediaList--slim'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378094918666945.4483)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4483)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(808380142596819918.4483)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378225037666947.4483)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4483)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(808380828683819918.4483)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378370589666947.4483)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4483)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4483)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378467813666947.4483)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4483)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378526097666947.4483)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4483)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4483)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378615102666947.4483)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4483)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_imp.id(808383088145819924.4483)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378735377666947.4483)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4483)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4483)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1036071796325339624.4483)
,p_theme_id=>3
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(514332292784430987.4483)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1036071972285339624.4483)
,p_theme_id=>3
,p_name=>'ADD_SLIDE_ANIMATION'
,p_display_name=>'Add Slide Animation'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(514332292784430987.4483)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1050367122398973653.4483)
,p_theme_id=>3
,p_name=>'SLIMPROGRESSLIST'
,p_display_name=>'Slim Progress List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(865273508717512144.4483)
,p_css_classes=>'a-WizardSteps--slim'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1309233880682664517.4483)
,p_theme_id=>3
,p_name=>'LEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_button_template_id=>wwv_flow_imp.id(868252865986181054.4483)
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(856117908453058029.4483)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1351338307429029043.4483)
,p_theme_id=>3
,p_name=>'USED_IN_DIALOG'
,p_display_name=>'Used in Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1274355059486017828.4483)
,p_css_classes=>'a-ProcessingRegion--dialog'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333722717814196.4483)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4483)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333859287814196.4483)
,p_theme_id=>3
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4483)
,p_css_classes=>'a-LinksList--showBadge'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333887728814196.4483)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4483)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334039640814196.4483)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4483)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334247146814196.4483)
,p_theme_id=>3
,p_name=>'FORTOPLEVELONLY'
,p_display_name=>'For top level only'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4483)
,p_css_classes=>'a-LinksList--showTopIcons'
,p_group_id=>wwv_flow_imp.id(806925000765340952.4483)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334455135814196.4483)
,p_theme_id=>3
,p_name=>'FORALLITEMS'
,p_display_name=>'For all items'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4483)
,p_css_classes=>'a-LinksList--showIcons'
,p_group_id=>wwv_flow_imp.id(806925000765340952.4483)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491342397110118.4483)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4483)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491390428110118.4483)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4483)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491480011110118.4483)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4483)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664488722406040473.4483)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4483)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4483)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664488933681040473.4483)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4483)
,p_css_classes=>'a-Region--accessibleHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4483)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489165994040473.4483)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4483)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4483)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489304869040473.4483)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4483)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4483)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489519844040473.4483)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4483)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_imp.id(860570508910721307.4483)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489753255040473.4483)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4483)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4483)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489941797040473.4483)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4483)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4483)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490153471040473.4483)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4483)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4483)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490336091040473.4483)
,p_theme_id=>3
,p_name=>'DEFAULTPADDING'
,p_display_name=>'Default Padding'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4483)
,p_css_classes=>'a-Region--paddedBody'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4483)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490377667040473.4483)
,p_theme_id=>3
,p_name=>'REMOVE_TOP_BORDER'
,p_display_name=>'Remove Top Border'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4483)
,p_css_classes=>'a-Region--noTopBorder'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490659850040473.4483)
,p_theme_id=>3
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4483)
,p_css_classes=>'a-Region--simple'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4483)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664501980442158869.4483)
,p_theme_id=>3
,p_name=>'RESPONSIVEICONCOLUMNS'
,p_display_name=>'Responsive Icon Columns'
,p_display_sequence=>2
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4483)
,p_css_classes=>'a-IRR-region--responsiveIconView'
,p_template_types=>'REGION'
,p_help_text=>'Automatically increases number of icon columns to show based on screen resolution.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664502160891158869.4483)
,p_theme_id=>3
,p_name=>'ICONLABELSRIGHT'
,p_display_name=>'Icon Labels on Right'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4483)
,p_css_classes=>'a-IRR-region--iconLabelsRight'
,p_template_types=>'REGION'
,p_help_text=>'Shows labels in Icon View to the right of the icon.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664502181188158869.4483)
,p_theme_id=>3
,p_name=>'REMOVEOUTERBORDERS'
,p_display_name=>'Remove Outer Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4483)
,p_css_classes=>'a-IRR-region--noOuterBorders'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508367504174332.4483)
,p_theme_id=>3
,p_name=>'FLUSHREGION'
,p_display_name=>'Flush Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4483)
,p_css_classes=>'a-Region--flush'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508426350174332.4483)
,p_theme_id=>3
,p_name=>'STACKEDREGION'
,p_display_name=>'Stacked Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4483)
,p_css_classes=>'a-Region--stacked'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508588305174332.4483)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4483)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4483)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508810521174332.4483)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4483)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4483)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509005841174332.4483)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4483)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_imp.id(860570508910721307.4483)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509270186174332.4483)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4483)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4483)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509448573174333.4483)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4483)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4483)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509659839174333.4483)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4483)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4483)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509822387174334.4483)
,p_theme_id=>3
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>.1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4483)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4483)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664510028962174334.4483)
,p_theme_id=>3
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4483)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4483)
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
 p_id=>wwv_flow_imp.id(140921322443751909)
,p_name=>'4150_COLUMN_NUMBER'
,p_message_language=>'no'
,p_message_text=>'Kolonne - %0'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140905980029751905)
,p_name=>'ACCESS_CONTROL_ADMIN'
,p_message_language=>'no'
,p_message_text=>'Administrator'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140905879669751905)
,p_name=>'ACCESS_CONTROL_USERNAME'
,p_message_language=>'no'
,p_message_text=>'Brukernavn'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140968519826751924)
,p_name=>'ACCESS_DENIED_SIMPLE'
,p_message_language=>'no'
,p_message_text=>'Ingen tilgang'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140925411439751911)
,p_name=>'ACCOUNT_HAS_BEEN_CREATED'
,p_message_language=>'no'
,p_message_text=>'%0-kontoen er opprettet.'
,p_version_scn=>2705228
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140908638744751906)
,p_name=>'ACCOUNT_LOCKED'
,p_message_language=>'no'
,p_message_text=>unistr('Kontoen er l\00E5st.')
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140893119055751901)
,p_name=>'AM_PM'
,p_message_language=>'no'
,p_message_text=>'AM / PM'
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140875908506751896)
,p_name=>'APEX.ACTIONS.ACTION_LINK'
,p_message_language=>'no'
,p_message_text=>'handlingskobling'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140875815372751896)
,p_name=>'APEX.ACTIONS.DIALOG_LINK'
,p_message_language=>'no'
,p_message_text=>'dialogbokskobling'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141040241304751945)
,p_name=>'APEX.ACTIONS.TOGGLE'
,p_message_language=>'no'
,p_message_text=>unistr('Sl\00E5 p\00E5/av %0')
,p_is_js_message=>true
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141048093958751947)
,p_name=>'APEX.ACTIVE_STATE'
,p_message_language=>'no'
,p_message_text=>'(Aktiv)'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140852864867751889)
,p_name=>'APEX.AI.CHAT_CLEARED'
,p_message_language=>'no'
,p_message_text=>'Nettprat nullstilt'
,p_is_js_message=>true
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140852764321751889)
,p_name=>'APEX.AI.CLEAR_CHAT'
,p_message_language=>'no'
,p_message_text=>'Nullstill nettprat'
,p_is_js_message=>true
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140849394463751888)
,p_name=>'APEX.AI.CONSENT_ACCEPT'
,p_message_language=>'no'
,p_message_text=>'Godta'
,p_is_js_message=>true
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140849476206751888)
,p_name=>'APEX.AI.CONSENT_DENY'
,p_message_language=>'no'
,p_message_text=>'Nekt'
,p_is_js_message=>true
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140849135549751888)
,p_name=>'APEX.AI.CONVERSATION_HISTORY'
,p_message_language=>'no'
,p_message_text=>'Konversasjonshistorikk'
,p_is_js_message=>true
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140852539037751889)
,p_name=>'APEX.AI.COPIED'
,p_message_language=>'no'
,p_message_text=>'Kopiert'
,p_is_js_message=>true
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140852691262751889)
,p_name=>'APEX.AI.COPIED_TO_CLIPBOARD'
,p_message_language=>'no'
,p_message_text=>'Kopiert til utklippstavlen'
,p_is_js_message=>true
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140852310052751889)
,p_name=>'APEX.AI.COPY'
,p_message_language=>'no'
,p_message_text=>'Kopier'
,p_is_js_message=>true
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140852423847751889)
,p_name=>'APEX.AI.COPY_TO_CLIPBOARD'
,p_message_language=>'no'
,p_message_text=>'Kopier til utklippstavle'
,p_is_js_message=>true
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140849807563751888)
,p_name=>'APEX.AI.DIALOG_TITLE'
,p_message_language=>'no'
,p_message_text=>'Assistent'
,p_is_js_message=>true
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140850229608751889)
,p_name=>'APEX.AI.DISABLED'
,p_message_language=>'no'
,p_message_text=>unistr('KI er deaktivert p\00E5 arbeidsomr\00E5de- eller forekomstniv\00E5.')
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140889593799751900)
,p_name=>'APEX.AI.GET_SERVER_ID_OR_STATIC_ID'
,p_message_language=>'no'
,p_message_text=>'Finner ikke tjenesten for generativ KI med angitt ID eller statisk ID.'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140888295163751900)
,p_name=>'APEX.AI.HTTP_4013_ERROR'
,p_message_language=>'no'
,p_message_text=>'Autentiseringsfeil eller ingen tilgang (HTTP-%1) for URL-adresse %0. Se konfigurasjonen til tjenesten for kunstig intelligens %2.'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140868063875751894)
,p_name=>'APEX.AI.HTTP_ERROR'
,p_message_language=>'no'
,p_message_text=>unistr('HTTP-foresp\00F8rselen til tjenesten for generativ KI p\00E5 %0 mislyktes med HTTP-%1: %2')
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140892463436751901)
,p_name=>'APEX.AI.HTTP_FRIENDLY_ERROR'
,p_message_language=>'no'
,p_message_text=>unistr('Feil i HTTP-foresp\00F8rsel til tjeneste for kunstig intelligens for innpluggingsmodul %0 i modus %1. Se konfigurasjonen til tjenesten for kunstig intelligens.')
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140855253022751890)
,p_name=>'APEX.AI.MAIN_QUICK_ACTIONS_ARIA_LABEL'
,p_message_language=>'no'
,p_message_text=>'Eksempler'
,p_is_js_message=>true
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140853651036751890)
,p_name=>'APEX.AI.NAME_ASSISTANT'
,p_message_language=>'no'
,p_message_text=>'Assistent'
,p_is_js_message=>true
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140855073635751890)
,p_name=>'APEX.AI.NAME_COMMA_MESSAGE'
,p_message_language=>'no'
,p_message_text=>'%0,%1'
,p_is_js_message=>true
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140853590390751890)
,p_name=>'APEX.AI.NAME_USER'
,p_message_language=>'no'
,p_message_text=>'Du'
,p_is_js_message=>true
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140884289030751899)
,p_name=>'APEX.AI.OCI_CHAT_NOT_SUPPORTED'
,p_message_language=>'no'
,p_message_text=>unistr('OCI for generativ kunstig intelligens st\00F8tter for \00F8yeblikket ikke nettpratopplevelse med flere meldinger.')
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140864137651751893)
,p_name=>'APEX.AI.PROMPT_ENRICHMENT_ERROR'
,p_message_language=>'no'
,p_message_text=>'Feil ved behandling av ledeteksten %0 for applikasjonen %1. Kontroller om appbyggeren er tilgjengelig i denne forekomsten.'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140869286214751894)
,p_name=>'APEX.AI.RESPONSE_ERROR'
,p_message_language=>'no'
,p_message_text=>unistr('Kan ikke behandle svaret for KI-tjenesten %0, svar \2013 %1')
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140875426335751896)
,p_name=>'APEX.AI.SEND_MESSAGE'
,p_message_language=>'no'
,p_message_text=>'Send melding'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140863788500751893)
,p_name=>'APEX.AI.SERVICE_ERROR'
,p_message_language=>'no'
,p_message_text=>unistr('Feil i bakre KI-tjeneste \2013 %0')
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140849539170751888)
,p_name=>'APEX.AI.TEXTAREA_LABEL'
,p_message_language=>'no'
,p_message_text=>'Melding'
,p_is_js_message=>true
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140849664322751888)
,p_name=>'APEX.AI.TEXTAREA_PLACEHOLDER'
,p_message_language=>'no'
,p_message_text=>'Skriv meldingen her'
,p_is_js_message=>true
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140852939836751889)
,p_name=>'APEX.AI.USER_AVATAR'
,p_message_language=>'no'
,p_message_text=>'Brukeravatar'
,p_is_js_message=>true
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140853044394751889)
,p_name=>'APEX.AI.USE_THIS'
,p_message_language=>'no'
,p_message_text=>'Bruk dette'
,p_is_js_message=>true
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140849723935751888)
,p_name=>'APEX.AI.WARN_UNSENT_MESSAGE'
,p_message_language=>'no'
,p_message_text=>'Du har en usendt melding. Er du sikker?'
,p_is_js_message=>true
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141018778105751938)
,p_name=>'APEX.AJAX_SERVER_ERROR'
,p_message_language=>'no'
,p_message_text=>'Ajax-kallet returnerte tjenerfeilen %0 for %1.'
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140945800886751917)
,p_name=>'APEX.APPLICATION.ALIAS.NON_UNIQUE'
,p_message_language=>'no'
,p_message_text=>'Applikasjonsaliaset %0 kan ikke konverteres til en unik applikasjons-ID.'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140934635141751913)
,p_name=>'APEX.APPLICATION.ALIAS.UNHANDLED_ERROR'
,p_message_language=>'no'
,p_message_text=>'ERR-1816 Uventet feil ved konvertering av applikasjonsaliaset p_flow_alias_or_id (%0).'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141032061124751942)
,p_name=>'APEX.APPLICATION.CHECKSUM.DESCRIPTION'
,p_message_language=>'no'
,p_message_text=>unistr('Applikasjonskontrollsummen gir en enkel metode for \00E5 finne ut om samme applikasjon er implementert p\00E5 tvers av arbeidsomr\00E5der. Du kan sammenligne denne kontrollsummen og finne ut om det finnes samsvar. ')
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140918641510751909)
,p_name=>'APEX.AUTHENTICATION.AUTH_FUNC.UNHANDLED_ERROR'
,p_message_language=>'no'
,p_message_text=>'Feil ved behandling av autentiseringsfunksjon.'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140900688234751903)
,p_name=>'APEX.AUTHENTICATION.AUTH_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'no'
,p_message_text=>'Feil ved behandling av autentiseringsfunksjon.'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141072589851751955)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.HOST_PREFIX_MISMATCH'
,p_message_language=>'no'
,p_message_text=>unistr('Leiernavnet %0 som ble returnert av Oracle Cloud Identity Management, er ikke autorisert for domenet %1.<br/><a href="&LOGOUT_URL.">Logg p\00E5 p\00E5 nytt</a>, og angi et autorisert leiernavn, eller endre URL-adressen.')
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140896715241751902)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.USER_IS_NOT_DEVELOPER'
,p_message_language=>'no'
,p_message_text=>unistr('Kontoen %0 har ikke de n\00F8dvendige utviklingsprivilegiene (DB_DEVELOPER eller DB_ADMINISTRATOR)<br/>for arbeidsomr\00E5det %1. <a href="&LOGOUT_URL.">Logg p\00E5 p\00E5 nytt</a> n\00E5r privilegiene er angitt.')
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140893353582751901)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.WRONG_GROUP_NAME'
,p_message_language=>'no'
,p_message_text=>unistr('Leiernavnet som ble returnert av Oracle Cloud Identity Management, er ikke autorisert for det gjeldende arbeidsomr\00E5det.<br/><a href="&LOGOUT_URL.">Logg p\00E5 p\00E5 nytt</a>, og angi et autorisert leiernavn.')
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140896861376751902)
,p_name=>'APEX.AUTHENTICATION.HOST_PREFIX_MISMATCH'
,p_message_language=>'no'
,p_message_text=>unistr('Av sikkerhetshensyn er det ikke tillatt \00E5 kj\00F8re applikasjoner i dette arbeidsomr\00E5det via domenet i URL-adressen.')
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140918388734751909)
,p_name=>'APEX.AUTHENTICATION.LDAP.DBMS_LDAP.ASK_FOR_INSTALLATION'
,p_message_language=>'no'
,p_message_text=>unistr('Be databaseadministratoren om \00E5 kj\00F8re $OH/rdbms/admin/catldap.sql.')
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140918288044751909)
,p_name=>'APEX.AUTHENTICATION.LDAP.DBMS_LDAP.MISSING'
,p_message_language=>'no'
,p_message_text=>'Pakken SYS.DBMS_LDAP finnes ikke, eller den er ugyldig.'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140918197396751909)
,p_name=>'APEX.AUTHENTICATION.LDAP.EDIT_USER_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'no'
,p_message_text=>'Feil ved behandling av brukerfunksjon for redigering av LDAP.'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140918494119751909)
,p_name=>'APEX.AUTHENTICATION.LDAP.UNHANDLED_ERROR'
,p_message_language=>'no'
,p_message_text=>'Feil ved behandling av LDAP-autentisering.'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140919269411751909)
,p_name=>'APEX.AUTHENTICATION.LOGIN.ILLEGAL_PAGE_ARG'
,p_message_language=>'no'
,p_message_text=>'Feil i argumentet p_flow_page til prosedyren login_page.'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140918878720751909)
,p_name=>'APEX.AUTHENTICATION.LOGIN.INVALID_ARG'
,p_message_language=>'no'
,p_message_text=>'Ugyldig p_session i wwv_flow_custom_auth_std.login--p_flow_page:%0 p_session_id:%1.'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140970154890751924)
,p_name=>'APEX.AUTHENTICATION.LOGIN.MALFORMED_ARGS'
,p_message_language=>'no'
,p_message_text=>'Misformet argument til wwv_flow_custom_auth_std.login--p_flow_page:p_session_id:p_entry_point:%0:%1:%2.'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140918939464751909)
,p_name=>'APEX.AUTHENTICATION.LOGIN.NULL_USER'
,p_message_language=>'no'
,p_message_text=>unistr('Null-brukernavn ble sendt til p\00E5loggingsprosedyren.')
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140905752741751905)
,p_name=>'APEX.AUTHENTICATION.LOGIN_THROTTLE.COUNTER'
,p_message_language=>'no'
,p_message_text=>unistr('Vent <span id="apex_login_throttle_sec">%0</span> sekunder f\00F8r du logger p\00E5 p\00E5 nytt.')
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140907002622751905)
,p_name=>'APEX.AUTHENTICATION.LOGIN_THROTTLE.ERROR'
,p_message_language=>'no'
,p_message_text=>unistr('P\00E5loggingsfors\00F8ket ble blokkert.')
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140967848369751923)
,p_name=>'APEX.AUTHENTICATION.NOT_FOUND'
,p_message_language=>'no'
,p_message_text=>'Finner ikke autentiseringen %0'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140907537939751905)
,p_name=>'APEX.AUTHENTICATION.NO_SECURITY_GROUP_ID'
,p_message_language=>'no'
,p_message_text=>'ID-en for sikkerhetsgruppen er null.'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140918752938751909)
,p_name=>'APEX.AUTHENTICATION.POST_AUTH_PROC.UNHANDLED_ERROR'
,p_message_language=>'no'
,p_message_text=>unistr('Feil ved utf\00F8relse av prosess etter autentisering.')
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140918577279751909)
,p_name=>'APEX.AUTHENTICATION.PRE_AUTH_PROC.UNHANDLED_ERROR'
,p_message_language=>'no'
,p_message_text=>unistr('Feil ved behandling av prosess f\00F8r autentisering.')
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140920231643751909)
,p_name=>'APEX.AUTHENTICATION.RESET_PASSWORD.INSTRUCTIONS'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\00C5pne URL-adressen i samme nettleser som du startet foresp\00F8rselen om tilbakestilling av passord i. Hvis du klikker p\00E5 URL-adressen Tilbakestill passord og blir omdirigert til'),
unistr('p\00E5loggingssiden, starter du Tilbakestill passord p\00E5 nytt og lar'),
unistr('nettleseren v\00E6re \00E5pen.')))
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141070081486751954)
,p_name=>'APEX.AUTHENTICATION.RESET_PASSWORD_URL'
,p_message_language=>'no'
,p_message_text=>'URL-adresse for tilbakestilling av passord'
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140897052127751902)
,p_name=>'APEX.AUTHENTICATION.RM_GROUP_NOT_GRANTED'
,p_message_language=>'no'
,p_message_text=>'Forbrukergruppen %0 for ressursstyreren er ikke tildelt til %1'
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140897197716751902)
,p_name=>'APEX.AUTHENTICATION.RM_INFO_TO_GRANT'
,p_message_language=>'no'
,p_message_text=>unistr('Bruk DBMS_RESOURCE_MANAGER_PRIVS.GRANT_SWITCH_CONSUMER_GROUP til \00E5 tildele det manglende privilegiet.')
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140931733186751913)
,p_name=>'APEX.AUTHENTICATION.SESSION_SENTRY_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'no'
,p_message_text=>unistr('Feil ved behandling av Sentry-funksjon for \00F8kt.')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140931840786751913)
,p_name=>'APEX.AUTHENTICATION.SESSION_VERIFY_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'no'
,p_message_text=>unistr('Feil ved behandling av \00F8ktverifiseringsfunksjon.')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140932051822751913)
,p_name=>'APEX.AUTHENTICATION.SSO.ASK_FOR_INSTALLATION'
,p_message_language=>'no'
,p_message_text=>unistr('Be administratoren for %0 om \00E5 konfigurere motoren for Oracle Application Server Single Sign-On.')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140942496425751916)
,p_name=>'APEX.AUTHENTICATION.SSO.BAD_URLC'
,p_message_language=>'no'
,p_message_text=>unistr('Ugyldig %0 i symbolet %1 som ble returnert ved engangsp\00E5logging.')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140919134127751909)
,p_name=>'APEX.AUTHENTICATION.SSO.FIX_PARTNER_APP'
,p_message_language=>'no'
,p_message_text=>'Rediger autentiseringsskjemaet, og legg til applikasjonsnavnet.'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140942138571751916)
,p_name=>'APEX.AUTHENTICATION.SSO.ILLEGAL_CALLER'
,p_message_language=>'no'
,p_message_text=>'Ugyldig anroper for prosedyren %0:'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140942382655751916)
,p_name=>'APEX.AUTHENTICATION.SSO.INVALID_APP_SESSION'
,p_message_language=>'no'
,p_message_text=>unistr('Ugyldig app\00F8kt i URLC-symbolet: %0')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140941987944751916)
,p_name=>'APEX.AUTHENTICATION.SSO.MISSING_APP_REGISTRATION'
,p_message_language=>'no'
,p_message_text=>'Feil i portal_sso_redirect: Opplysninger for applikasjonsregistering mangler: %0'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140931971742751913)
,p_name=>'APEX.AUTHENTICATION.SSO.PACKAGE_MISSING'
,p_message_language=>'no'
,p_message_text=>'Pakken WWSEC_SSO_ENABLER_PRIVATE finnes ikke, eller den er ugyldig.'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140919085947751909)
,p_name=>'APEX.AUTHENTICATION.SSO.PARTNER_APP_IS_NULL'
,p_message_language=>'no'
,p_message_text=>unistr('Finner ikke registrert navn p\00E5 partnerapplikasjon i autentiseringsskjemaet.')
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140942090226751916)
,p_name=>'APEX.AUTHENTICATION.SSO.REGISTER_APP'
,p_message_language=>'no'
,p_message_text=>'Registrer denne applikasjonen som beskrevet i installasjonsveiledningen.'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140932109869751913)
,p_name=>'APEX.AUTHENTICATION.SSO.UNHANDLED_ERROR'
,p_message_language=>'no'
,p_message_text=>unistr('Feil ved behandling av autentisering av engangsp\00E5logging.')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141045493846751946)
,p_name=>'APEX.AUTHENTICATION.UNAUTHORIZED_URL'
,p_message_language=>'no'
,p_message_text=>'Uautorisert URL-adresse: %0'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140931511894751913)
,p_name=>'APEX.AUTHENTICATION.UNHANDLED_ERROR'
,p_message_language=>'no'
,p_message_text=>'Feil ved behandling av autentisering.'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140896923354751902)
,p_name=>'APEX.AUTHENTICATION.WORKSPACE_NOT_ASSIGNED'
,p_message_language=>'no'
,p_message_text=>unistr('Arbeidsomr\00E5det %0 er inaktivt. Kontakt administratoren.')
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140897663288751903)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED'
,p_message_language=>'no'
,p_message_text=>'%0'
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140906719010751905)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED.APPLICATION'
,p_message_language=>'no'
,p_message_text=>'Tilgang ble nektet av sikkerhetskontroll for applikasjonen'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140906832210751905)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED.PAGE'
,p_message_language=>'no'
,p_message_text=>'Tilgang ble nektet av sikkerhetskontroll for siden'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140906961554751905)
,p_name=>'APEX.AUTHORIZATION.UNHANDLED_ERROR'
,p_message_language=>'no'
,p_message_text=>'Feil ved behandling av autorisasjonen.'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140976013257751926)
,p_name=>'APEX.BUILT_WITH_LOVE_USING_APEX'
,p_message_language=>'no'
,p_message_text=>'Bygget med %0 ved hjelp av %1'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140976151669751926)
,p_name=>'APEX.BUILT_WITH_LOVE_USING_APEX.ACCESSIBLE.LOVE'
,p_message_language=>'no'
,p_message_text=>'hjerte'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141035924874751943)
,p_name=>'APEX.CALENDAR.EVENT_DESCRIPTION'
,p_message_language=>'no'
,p_message_text=>'Hendelsesbeskrivelse'
,p_is_js_message=>true
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141035702896751943)
,p_name=>'APEX.CALENDAR.EVENT_END'
,p_message_language=>'no'
,p_message_text=>'Sluttdato'
,p_is_js_message=>true
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141036016659751943)
,p_name=>'APEX.CALENDAR.EVENT_ID'
,p_message_language=>'no'
,p_message_text=>'Hendelses-ID'
,p_is_js_message=>true
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141035671746751943)
,p_name=>'APEX.CALENDAR.EVENT_START'
,p_message_language=>'no'
,p_message_text=>'Startdato'
,p_is_js_message=>true
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141035819991751943)
,p_name=>'APEX.CALENDAR.EVENT_TITLE'
,p_message_language=>'no'
,p_message_text=>'Hendelsestittel'
,p_is_js_message=>true
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140878402073751897)
,p_name=>'APEX.CARD'
,p_message_language=>'no'
,p_message_text=>'Kort'
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140878650413751897)
,p_name=>'APEX.CARD.CARD_ACTION'
,p_message_language=>'no'
,p_message_text=>'Korthandling'
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140919331402751909)
,p_name=>'APEX.CHECKBOX.VISUALLY_HIDDEN_CHECKBOX'
,p_message_language=>'no'
,p_message_text=>unistr('Visuelt skjult \2013 avmerkingsboks')
,p_is_js_message=>true
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140921248443751909)
,p_name=>'APEX.CHECKSUM.CONTENT_ERROR'
,p_message_language=>'no'
,p_message_text=>'Innholdsfeil i kontrollsum'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140921194936751909)
,p_name=>'APEX.CHECKSUM.FORMAT_ERROR'
,p_message_language=>'no'
,p_message_text=>'Formatfeil i kontrollsum'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140991024709751930)
,p_name=>'APEX.CLIPBOARD.COPIED'
,p_message_language=>'no'
,p_message_text=>'Kopiert til utklippstavlen.'
,p_is_js_message=>true
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140990563961751930)
,p_name=>'APEX.CLIPBOARD.NOTSUP'
,p_message_language=>'no'
,p_message_text=>unistr('Denne nettleseren st\00F8tter ikke kopiering fra en knapp eller meny. Pr\00F8v Ctrl+C eller Command+C.')
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140976748542751926)
,p_name=>'APEX.CLOSE_NOTIFICATION'
,p_message_language=>'no'
,p_message_text=>'Lukk'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140855140659751890)
,p_name=>'APEX.CODE_EDITOR.MAXIMUM_LENGTH_EXCEEDED'
,p_message_language=>'no'
,p_message_text=>unistr('Innholdet i koderedigeringsprogrammet overskrider elementets maksimumslengde (antall tegn \2013 faktisk: %0, tillatt: %1)')
,p_is_js_message=>true
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141035220342751943)
,p_name=>'APEX.COLOR_PICKER.CONTRAST'
,p_message_language=>'no'
,p_message_text=>'Kontrast'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141029747629751942)
,p_name=>'APEX.COLOR_PICKER.CURRENT'
,p_message_language=>'no'
,p_message_text=>'Gjeldende'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141029685289751942)
,p_name=>'APEX.COLOR_PICKER.INITIAL'
,p_message_language=>'no'
,p_message_text=>'Opprinnelig'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141033843742751943)
,p_name=>'APEX.COLOR_PICKER.INVALID_COLOR'
,p_message_language=>'no'
,p_message_text=>unistr('#LABEL# m\00E5 v\00E6re en gyldig farge. Eksempel: %0')
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140896244320751902)
,p_name=>'APEX.COLOR_PICKER.MORE_PRESET_COLORS'
,p_message_language=>'no'
,p_message_text=>'Flere farger'
,p_is_js_message=>true
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140896361375751902)
,p_name=>'APEX.COLOR_PICKER.OPEN'
,p_message_language=>'no'
,p_message_text=>unistr('\00C5pne fargevelger')
,p_is_js_message=>true
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140853419703751889)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.ALPHA_SLIDER'
,p_message_language=>'no'
,p_message_text=>unistr('Alfa-glidebryter, horisontal glidebryter. Bruk piltastene til \00E5 navigere.')
,p_is_js_message=>true
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140853113984751889)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.COLOR_SPECTRUM'
,p_message_language=>'no'
,p_message_text=>unistr('Fargespektrum, fireveis glidebryter. Bruk piltastene til \00E5 navigere.')
,p_is_js_message=>true
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140853203167751889)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.HUE_SLIDER'
,p_message_language=>'no'
,p_message_text=>unistr('Glidebryter for nyanse, vertikal glidebryter. Bruk piltastene til \00E5 navigere.')
,p_is_js_message=>true
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141029564298751942)
,p_name=>'APEX.COLOR_PICKER.TITLE'
,p_message_language=>'no'
,p_message_text=>'Velg en farge'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141029827386751942)
,p_name=>'APEX.COLOR_PICKER.TOGGLE_TITLE'
,p_message_language=>'no'
,p_message_text=>'Endre fargeformat'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141067716306751954)
,p_name=>'APEX.COMBOBOX.LIST_OF_VALUES'
,p_message_language=>'no'
,p_message_text=>'Verdiliste'
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141067850365751954)
,p_name=>'APEX.COMBOBOX.SHOW_ALL_VALUES'
,p_message_language=>'no'
,p_message_text=>unistr('\00C5pne liste for: %0')
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141048104348751947)
,p_name=>'APEX.COMPLETED_STATE'
,p_message_language=>'no'
,p_message_text=>unistr('(Fullf\00F8rt)')
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140937033253751914)
,p_name=>'APEX.CONTACT_ADMIN'
,p_message_language=>'no'
,p_message_text=>'Kontakt applikasjonsadministrator.'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140952554467751919)
,p_name=>'APEX.CONTACT_ADMIN.DEBUG'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Kontakt applikasjonsadministratoren.',
'Detaljer om denne hendelsen er tilgjengelige via feilletings-ID-en %0.'))
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141034153878751943)
,p_name=>'APEX.CORRECT_ERRORS'
,p_message_language=>'no'
,p_message_text=>unistr('Rett feilene f\00F8r du lagrer.')
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140879420249751897)
,p_name=>'APEX.CS.ACTIVE_VALUE_CHIP'
,p_message_language=>'no'
,p_message_text=>unistr('%0. Trykk p\00E5 Tilbake-tasten for \00E5 slette.')
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140977676151751926)
,p_name=>'APEX.CS.MATCHES_FOUND'
,p_message_language=>'no'
,p_message_text=>'Finner %0 treff'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140859566266751891)
,p_name=>'APEX.CS.MATCH_FOUND'
,p_message_language=>'no'
,p_message_text=>'1 treff funnet'
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140977594777751926)
,p_name=>'APEX.CS.NO_MATCHES'
,p_message_language=>'no'
,p_message_text=>'Finner ingen treff'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140853935111751890)
,p_name=>'APEX.CS.OTHERS_GROUP'
,p_message_language=>'no'
,p_message_text=>'Andre'
,p_is_js_message=>true
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140853811017751890)
,p_name=>'APEX.CS.SELECTED_VALUES_COUNTER'
,p_message_language=>'no'
,p_message_text=>'%0 verdier er valgt'
,p_is_js_message=>true
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141048697294751947)
,p_name=>'APEX.CURRENT_PROGRESS'
,p_message_language=>'no'
,p_message_text=>'Fremdrift hittil'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141034506761751943)
,p_name=>'APEX.DATA.LOAD.FILE_DOES_NOT_EXIST'
,p_message_language=>'no'
,p_message_text=>'Filen som er angitt i elementet %0, finnes ikke i APEX_APPLICATION_TEMP_FILES.'
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141023034898751940)
,p_name=>'APEX.DATA_HAS_CHANGED'
,p_message_language=>'no'
,p_message_text=>'Gjeldende versjon av data i databasen er endret siden brukeren initierte oppdateringsprosessen.'
,p_version_scn=>2705245
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140992193682751930)
,p_name=>'APEX.DATA_LOAD.DO_NOT_LOAD'
,p_message_language=>'no'
,p_message_text=>'Ikke last'
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141038412967751944)
,p_name=>'APEX.DATA_LOAD.FAILED'
,p_message_language=>'no'
,p_message_text=>'Feil i forbehandling'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141038228655751944)
,p_name=>'APEX.DATA_LOAD.INSERT'
,p_message_language=>'no'
,p_message_text=>'Sett inn rad'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141051863352751948)
,p_name=>'APEX.DATA_LOAD.SEQUENCE_ACTION'
,p_message_language=>'no'
,p_message_text=>unistr('Rekkef\00F8lge : Handling')
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141038338501751944)
,p_name=>'APEX.DATA_LOAD.UPDATE'
,p_message_language=>'no'
,p_message_text=>'Oppdater rad'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140866848434751893)
,p_name=>'APEX.DATEPICKER.ACTIONS'
,p_message_language=>'no'
,p_message_text=>'Handlinger'
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140894404649751902)
,p_name=>'APEX.DATEPICKER.AM_PM'
,p_message_language=>'no'
,p_message_text=>'AM/PM'
,p_is_js_message=>true
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140880554862751897)
,p_name=>'APEX.DATEPICKER.BOUNDARY_ITEM_FORMAT_INVALID'
,p_message_language=>'no'
,p_message_text=>unistr('%0 m\00E5 v\00E6re en datovelger eller en gyldig dato, for eksempel %1.')
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140989750092751930)
,p_name=>'APEX.DATEPICKER.CLEAR'
,p_message_language=>'no'
,p_message_text=>'Nullstill'
,p_is_js_message=>true
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140897921427751903)
,p_name=>'APEX.DATEPICKER.DONE'
,p_message_language=>'no'
,p_message_text=>'Ferdig'
,p_is_js_message=>true
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140908977474751906)
,p_name=>'APEX.DATEPICKER.FORMAT_NOT_SUPPORTED'
,p_message_language=>'no'
,p_message_text=>unistr('%0 har ikke-st\00F8ttede deler i formatmasken: %1')
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140894161742751901)
,p_name=>'APEX.DATEPICKER.HOUR'
,p_message_language=>'no'
,p_message_text=>'Time'
,p_is_js_message=>true
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140978075720751926)
,p_name=>'APEX.DATEPICKER.ICON_TEXT'
,p_message_language=>'no'
,p_message_text=>'Hurtigkalender: %0'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140893912872751901)
,p_name=>'APEX.DATEPICKER.ISO_WEEK'
,p_message_language=>'no'
,p_message_text=>'Uke'
,p_is_js_message=>true
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140894083217751901)
,p_name=>'APEX.DATEPICKER.ISO_WEEK_ABBR'
,p_message_language=>'no'
,p_message_text=>'Uke'
,p_is_js_message=>true
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140894331160751902)
,p_name=>'APEX.DATEPICKER.MINUTES'
,p_message_language=>'no'
,p_message_text=>'Minutter'
,p_is_js_message=>true
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140894528835751902)
,p_name=>'APEX.DATEPICKER.MONTH'
,p_message_language=>'no'
,p_message_text=>unistr('M\00E5ned')
,p_is_js_message=>true
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140894975387751902)
,p_name=>'APEX.DATEPICKER.NEXT_MONTH'
,p_message_language=>'no'
,p_message_text=>unistr('Neste m\00E5ned')
,p_is_js_message=>true
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140864537857751893)
,p_name=>'APEX.DATEPICKER.POPUP'
,p_message_language=>'no'
,p_message_text=>'Hurtigvindu for %0'
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140894808160751902)
,p_name=>'APEX.DATEPICKER.PREVIOUS_MONTH'
,p_message_language=>'no'
,p_message_text=>unistr('Forrige m\00E5ned')
,p_is_js_message=>true
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140987343805751929)
,p_name=>'APEX.DATEPICKER.READONLY_DATEPICKER'
,p_message_language=>'no'
,p_message_text=>unistr('Skrivebeskyttet \2013 datovelger')
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140895775035751902)
,p_name=>'APEX.DATEPICKER.SELECT_DATE'
,p_message_language=>'no'
,p_message_text=>'Velg dato'
,p_is_js_message=>true
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140864627299751893)
,p_name=>'APEX.DATEPICKER.SELECT_DATE_AND_TIME'
,p_message_language=>'no'
,p_message_text=>'Velg dato og klokkeslett'
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140861842868751892)
,p_name=>'APEX.DATEPICKER.SELECT_DAY'
,p_message_language=>'no'
,p_message_text=>'Velg dag'
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140865273974751893)
,p_name=>'APEX.DATEPICKER.SELECT_MONTH_AND_YEAR'
,p_message_language=>'no'
,p_message_text=>unistr('Velg m\00E5ned og \00E5r')
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140862011664751892)
,p_name=>'APEX.DATEPICKER.SELECT_TIME'
,p_message_language=>'no'
,p_message_text=>'Velg klokkeslett'
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140862576571751892)
,p_name=>'APEX.DATEPICKER.TODAY'
,p_message_language=>'no'
,p_message_text=>'I dag'
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140880126717751897)
,p_name=>'APEX.DATEPICKER.VALUE_INVALID'
,p_message_language=>'no'
,p_message_text=>unistr('#LABEL# m\00E5 v\00E6re en gyldig dato, for eksempel %0.')
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140879832415751897)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_BETWEEN'
,p_message_language=>'no'
,p_message_text=>unistr('#LABEL# m\00E5 v\00E6re mellom %0 og %1.')
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140879992067751897)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_ON_OR_AFTER'
,p_message_language=>'no'
,p_message_text=>unistr('#LABEL# m\00E5 v\00E6re p\00E5 eller etter %0.')
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140880003658751897)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_ON_OR_BEFORE'
,p_message_language=>'no'
,p_message_text=>unistr('#LABEL# m\00E5 v\00E6re p\00E5 eller f\00F8r %0.')
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140871432403751895)
,p_name=>'APEX.DATEPICKER.VISUALLY_HIDDEN_EDIT'
,p_message_language=>'no'
,p_message_text=>unistr('Visuelt skjult \2013 redigering')
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140894720599751902)
,p_name=>'APEX.DATEPICKER.YEAR'
,p_message_language=>'no'
,p_message_text=>unistr('\00C5r')
,p_is_js_message=>true
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140981753659751927)
,p_name=>'APEX.DATEPICKER_VALUE_GREATER_MAX_DATE'
,p_message_language=>'no'
,p_message_text=>'#LABEL# er senere enn den angitte seneste datoen %0.'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140982129755751928)
,p_name=>'APEX.DATEPICKER_VALUE_INVALID'
,p_message_language=>'no'
,p_message_text=>'#LABEL# samsvarer ikke med formatet %0.'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140981642963751927)
,p_name=>'APEX.DATEPICKER_VALUE_LESS_MIN_DATE'
,p_message_language=>'no'
,p_message_text=>'#LABEL# er tidligere enn den angitte tidligste datoen %0.'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140981802552751927)
,p_name=>'APEX.DATEPICKER_VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'no'
,p_message_text=>unistr('#LABEL# er ikke innenfor det gyldige omr\00E5det fra %0 til %1.')
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140982032021751927)
,p_name=>'APEX.DATEPICKER_VALUE_NOT_IN_YEAR_RANGE'
,p_message_language=>'no'
,p_message_text=>unistr('#LABEL# er ikke innenfor det gyldige \00E5rsomr\00E5det %0 og %1.')
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140873839025751895)
,p_name=>'APEX.DBMS_CLOUD_INT.DBMS_CLOUD_ERROR'
,p_message_language=>'no'
,p_message_text=>unistr('Det oppstod en intern feil ved behandling av DBMS_CLOUD-foresp\00F8rselen.')
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141034404875751943)
,p_name=>'APEX.DIALOG.CANCEL'
,p_message_language=>'no'
,p_message_text=>'Avbryt'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141060332329751951)
,p_name=>'APEX.DIALOG.CLOSE'
,p_message_language=>'no'
,p_message_text=>'Lukk'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140921517441751910)
,p_name=>'APEX.DIALOG.CONFIRMATION'
,p_message_language=>'no'
,p_message_text=>'Bekreftelse'
,p_is_js_message=>true
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141062351241751952)
,p_name=>'APEX.DIALOG.HELP'
,p_message_language=>'no'
,p_message_text=>'Hjelp'
,p_is_js_message=>true
,p_version_scn=>2705252
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141034284778751943)
,p_name=>'APEX.DIALOG.OK'
,p_message_language=>'no'
,p_message_text=>'OK'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141034346191751943)
,p_name=>'APEX.DIALOG.SAVE'
,p_message_language=>'no'
,p_message_text=>'Lagre'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140902043869751904)
,p_name=>'APEX.DIALOG.TITLE'
,p_message_language=>'no'
,p_message_text=>'Dialogbokstittel'
,p_is_js_message=>true
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140941712128751916)
,p_name=>'APEX.DIALOG.VISUALLY_HIDDEN_TITLE'
,p_message_language=>'no'
,p_message_text=>'Visuelt skjult dialogbokstittel'
,p_is_js_message=>true
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140862828751751892)
,p_name=>'APEX.DOCGEN'
,p_message_language=>'no'
,p_message_text=>unistr('Forh\00E5ndsbygd funksjon med Oracle Document Generator')
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140873694208751895)
,p_name=>'APEX.DOCGEN.DBMS_CLOUD_ERROR'
,p_message_language=>'no'
,p_message_text=>'Feil ved utskrift av et dokument.'
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140850839431751889)
,p_name=>'APEX.DOCGEN.INVALID_OUTPUT_TYPE'
,p_message_language=>'no'
,p_message_text=>unistr('%s st\00F8tter ikke %1 som utdata.')
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140862718245751892)
,p_name=>'APEX.DOCGEN.INVOKE_ERROR'
,p_message_language=>'no'
,p_message_text=>unistr('Feil: "%0" ved start av forh\00E5ndsbygd funksjon med Oracle Document Generator:')
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140854253993751890)
,p_name=>'APEX.DOCGEN.TEMPLATE_REQUIRED'
,p_message_language=>'no'
,p_message_text=>unistr('En mal er n\00F8dvendig.')
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140879670135751897)
,p_name=>'APEX.DOWNLOAD.ERROR'
,p_message_language=>'no'
,p_message_text=>'Feil under filnedlasting.'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140879591193751897)
,p_name=>'APEX.DOWNLOAD.NO_DATA_FOUND'
,p_message_language=>'no'
,p_message_text=>'Finner ingen nedlastbare data.'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140883166752751898)
,p_name=>'APEX.ENVIRONMENT.RUNTIME_ONLY'
,p_message_language=>'no'
,p_message_text=>unistr('Denne funksjonen er ikke tilgjengelig i et rent kj\00F8retidsmilj\00F8.')
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140935996197751914)
,p_name=>'APEX.ERROR'
,p_message_language=>'no'
,p_message_text=>'Feil'
,p_is_js_message=>true
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140895848290751902)
,p_name=>'APEX.ERROR.CALLBACK_FAILED'
,p_message_language=>'no'
,p_message_text=>unistr('F\00F8lgende feil oppstod ved utf\00F8relse av tilbakekall for feilh\00E5ndtering: %0')
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140908450248751906)
,p_name=>'APEX.ERROR.ERROR_PAGE.UNHANDLED_ERROR'
,p_message_language=>'no'
,p_message_text=>'Det oppstod en feil ved maling av feilside: %0'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140897592313751902)
,p_name=>'APEX.ERROR.INTERNAL'
,p_message_language=>'no'
,p_message_text=>'Intern feil'
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141047262721751947)
,p_name=>'APEX.ERROR.INTERNAL.CONTACT_ADMINISTRATOR'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Kontakt administratoren.',
'Detaljer om denne hendelsen er tilgjengelige via feilletings-ID-en %0.'))
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141041883993751945)
,p_name=>'APEX.ERROR.ORA-16000'
,p_message_language=>'no'
,p_message_text=>unistr('Databasen er \00E5pen med lesetilgang.')
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141071978664751955)
,p_name=>'APEX.ERROR.ORA-28353'
,p_message_language=>'no'
,p_message_text=>unistr('ORA-28353: Kan ikke \00E5pne lommeboken. Applikasjonsdataene er ikke tilgjengelige for \00F8yeblikket.')
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141041930986751945)
,p_name=>'APEX.ERROR.PAGE_NOT_AVAILABLE'
,p_message_language=>'no'
,p_message_text=>'Denne siden er ikke tilgjengelig'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140900558153751903)
,p_name=>'APEX.ERROR.TECHNICAL_INFO'
,p_message_language=>'no'
,p_message_text=>'Teknisk info (bare tilgjengelig for utviklere)'
,p_is_js_message=>true
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141006493917751935)
,p_name=>'APEX.ERROR_MESSAGE_HEADING'
,p_message_language=>'no'
,p_message_text=>'Feilmelding'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141020349576751939)
,p_name=>'APEX.EXPECTED_FORMAT'
,p_message_language=>'no'
,p_message_text=>'Forventet format: %0'
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140985222442751928)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.ALREADY_IN_ACL'
,p_message_language=>'no'
,p_message_text=>'Brukeren finnes allerede i tilgangskontrollisten'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140985181234751928)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.CREATE_CONFIRM'
,p_message_language=>'no'
,p_message_text=>unistr('Bekreft at du vil legge til f\00F8lgende %0 bruker(e) i tilgangskontrollisten for <strong>%1</strong>.')
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140985642848751929)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.DUPLICATE_USER'
,p_message_language=>'no'
,p_message_text=>'Det finnes en duplisert bruker'
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140985323446751928)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.MISSING_AT_SIGN'
,p_message_language=>'no'
,p_message_text=>unistr('Mangler kr\00F8llalfa (@) i e-postadressen')
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140985440171751928)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.MISSING_DOT'
,p_message_language=>'no'
,p_message_text=>'Mangler punktum (.) i e-postadressen'
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140985549880751929)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.USERNAME_TOO_LONG'
,p_message_language=>'no'
,p_message_text=>'Brukernavnet er for langt'
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140985878498751929)
,p_name=>'APEX.FEATURE.ACL.INFO.ACL_ONLY'
,p_message_language=>'no'
,p_message_text=>unistr('Bare brukere som er definert i tilgangskontrollisten for applikasjonen, kan f\00E5 tilgang til denne applikasjonen')
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140985981813751929)
,p_name=>'APEX.FEATURE.ACL.INFO.ACL_VALUE_INVALID'
,p_message_language=>'no'
,p_message_text=>'Uventet verdi for tilgangskontrollinnstilling: %0'
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140985751291751929)
,p_name=>'APEX.FEATURE.ACL.INFO.ALL_USERS'
,p_message_language=>'no'
,p_message_text=>'Alle autentiserte brukere har tilgang til denne applikasjonen'
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141030298302751942)
,p_name=>'APEX.FEATURE.CONFIG.DISABLED'
,p_message_language=>'no'
,p_message_text=>'Deaktivert'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141030128927751942)
,p_name=>'APEX.FEATURE.CONFIG.ENABLED'
,p_message_language=>'no'
,p_message_text=>'Aktivert'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141030478137751942)
,p_name=>'APEX.FEATURE.CONFIG.IS_DISABLED'
,p_message_language=>'no'
,p_message_text=>'%0 er deaktivert'
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141030316947751942)
,p_name=>'APEX.FEATURE.CONFIG.IS_ENABLED'
,p_message_language=>'no'
,p_message_text=>'%0 er aktivert'
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140878951858751897)
,p_name=>'APEX.FEATURE.CONFIG.NOT_SUPPORTED'
,p_message_language=>'no'
,p_message_text=>unistr('St\00F8ttes ikke')
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140940130319751915)
,p_name=>'APEX.FEATURE.CONFIG.OFF'
,p_message_language=>'no'
,p_message_text=>'Av'
,p_is_js_message=>true
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140940061480751915)
,p_name=>'APEX.FEATURE.CONFIG.ON'
,p_message_language=>'no'
,p_message_text=>unistr('P\00E5')
,p_is_js_message=>true
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141030096177751942)
,p_name=>'APEX.FEATURE.TOP_USERS.USERNAME.NOT_IDENTIFIED'
,p_message_language=>'no'
,p_message_text=>'ikke identifisert'
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140870543759751894)
,p_name=>'APEX.FILESIZE.BYTES'
,p_message_language=>'no'
,p_message_text=>'%0 byte'
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140871053457751895)
,p_name=>'APEX.FILESIZE.GB'
,p_message_language=>'no'
,p_message_text=>'%0 GB'
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140870731831751895)
,p_name=>'APEX.FILESIZE.KB'
,p_message_language=>'no'
,p_message_text=>'%0 KB'
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140870987403751895)
,p_name=>'APEX.FILESIZE.MB'
,p_message_language=>'no'
,p_message_text=>'%0 MB'
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141023246508751940)
,p_name=>'APEX.FILE_BROWSE.DOWNLOAD_LINK_TEXT'
,p_message_language=>'no'
,p_message_text=>'Last ned'
,p_is_js_message=>true
,p_version_scn=>2705245
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140876368399751896)
,p_name=>'APEX.FS.ACTIONS_MENU_BUTTON_LABEL'
,p_message_language=>'no'
,p_message_text=>'Valg'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140876045147751896)
,p_name=>'APEX.FS.ACTIONS_MENU_FILTER'
,p_message_language=>'no'
,p_message_text=>'Filtrer'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140876282276751896)
,p_name=>'APEX.FS.ACTIONS_MENU_HIDE'
,p_message_language=>'no'
,p_message_text=>'Skjul fasett'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140900919656751903)
,p_name=>'APEX.FS.ADD_FILTER'
,p_message_language=>'no'
,p_message_text=>'Legg til filter'
,p_is_js_message=>true
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140977218215751926)
,p_name=>'APEX.FS.APPLIED_FACET'
,p_message_language=>'no'
,p_message_text=>'Brukt filter %0'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140901669339751904)
,p_name=>'APEX.FS.APPLY'
,p_message_language=>'no'
,p_message_text=>'Bruk'
,p_is_js_message=>true
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141020827039751939)
,p_name=>'APEX.FS.BATCH_APPLY'
,p_message_language=>'no'
,p_message_text=>'Bruk'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140901792200751904)
,p_name=>'APEX.FS.CANCEL'
,p_message_language=>'no'
,p_message_text=>'Avbryt'
,p_is_js_message=>true
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140885584347751899)
,p_name=>'APEX.FS.CHART_BAR'
,p_message_language=>'no'
,p_message_text=>'Stolpediagram'
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141033511816751943)
,p_name=>'APEX.FS.CHART_OTHERS'
,p_message_language=>'no'
,p_message_text=>'Andre'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140885692661751899)
,p_name=>'APEX.FS.CHART_PIE'
,p_message_language=>'no'
,p_message_text=>'Sektordiagram'
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141032138796751942)
,p_name=>'APEX.FS.CHART_TITLE'
,p_message_language=>'no'
,p_message_text=>'Diagram'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140885357293751899)
,p_name=>'APEX.FS.CHART_VALUE_LABEL'
,p_message_language=>'no'
,p_message_text=>'Antall'
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141021354346751939)
,p_name=>'APEX.FS.CLEAR'
,p_message_language=>'no'
,p_message_text=>'Nullstill'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141021481599751939)
,p_name=>'APEX.FS.CLEAR_ALL'
,p_message_language=>'no'
,p_message_text=>'Nullstill alle'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141021576447751939)
,p_name=>'APEX.FS.CLEAR_VALUE'
,p_message_language=>'no'
,p_message_text=>'Nullstill %0'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141038029797751944)
,p_name=>'APEX.FS.COLUMN_UNAUTHORIZED'
,p_message_language=>'no'
,p_message_text=>'Kolonnen %1, som fasetten %0 refererer til, er utilgjengelig eller ikke autorisert.'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140848744524751888)
,p_name=>'APEX.FS.CONFIG_TITLE'
,p_message_language=>'no'
,p_message_text=>'Velg filtre som skal vises'
,p_is_js_message=>true
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140975243567751925)
,p_name=>'APEX.FS.COUNT_RESULTS'
,p_message_language=>'no'
,p_message_text=>'%0 resultater'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140975308360751925)
,p_name=>'APEX.FS.COUNT_SELECTED'
,p_message_language=>'no'
,p_message_text=>'%0 valgt'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140978195180751926)
,p_name=>'APEX.FS.CUR_FILTERS_LM'
,p_message_language=>'no'
,p_message_text=>'Gjeldende filtre'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140853765176751890)
,p_name=>'APEX.FS.FACETED_SEARCH_NEEDS_REGION_QUERY'
,p_message_language=>'no'
,p_message_text=>unistr('Fasettert s\00F8k trenger en datakilde p\00E5 omr\00E5deniv\00E5.')
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140857489155751891)
,p_name=>'APEX.FS.FACETS_LIST'
,p_message_language=>'no'
,p_message_text=>'Filterliste'
,p_is_js_message=>true
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141036566855751944)
,p_name=>'APEX.FS.FACET_VALUE_LIMIT_EXCEEDED'
,p_message_language=>'no'
,p_message_text=>'Unik verdigrense (%0) overskredet for fasetten %1.'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141022865718751940)
,p_name=>'APEX.FS.FC_TYPE_UNSUPPORTED_FOR_DATE_COLUMNS'
,p_message_language=>'no'
,p_message_text=>unistr('Fasetten %0 st\00F8ttes ikke for kolonner av typen DATE eller TIMESTAMP.')
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141020975141751939)
,p_name=>'APEX.FS.FILTER'
,p_message_language=>'no'
,p_message_text=>'Filtrer %0'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140895598928751902)
,p_name=>'APEX.FS.FILTER_APPLIED'
,p_message_language=>'no'
,p_message_text=>'%0 (filter brukt)'
,p_is_js_message=>true
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141021008298751939)
,p_name=>'APEX.FS.GO'
,p_message_language=>'no'
,p_message_text=>unistr('S\00F8k')
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140891058169751901)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_C'
,p_message_language=>'no'
,p_message_text=>'inneholder %0'
,p_is_js_message=>true
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141022492191751939)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_EQ'
,p_message_language=>'no'
,p_message_text=>'er lik %0'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140890742370751900)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_GT'
,p_message_language=>'no'
,p_message_text=>unistr('st\00F8rre enn %0')
,p_is_js_message=>true
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140890808043751901)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_GTE'
,p_message_language=>'no'
,p_message_text=>unistr('st\00F8rre enn eller lik %0')
,p_is_js_message=>true
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140890472354751900)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_LT'
,p_message_language=>'no'
,p_message_text=>'mindre enn %0'
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140890676651751900)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_LTE'
,p_message_language=>'no'
,p_message_text=>'mindre enn eller lik %0'
,p_is_js_message=>true
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140889961875751900)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NC'
,p_message_language=>'no'
,p_message_text=>'inneholder ikke %0'
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140875730963751896)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NEQ'
,p_message_language=>'no'
,p_message_text=>'er ikke lik %0'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140890056347751900)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NSTARTS'
,p_message_language=>'no'
,p_message_text=>'begynner ikke med %0'
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140890911924751901)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_STARTS'
,p_message_language=>'no'
,p_message_text=>'begynner med %0'
,p_is_js_message=>true
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140889071542751900)
,p_name=>'APEX.FS.INPUT_FACET_SELECTOR'
,p_message_language=>'no'
,p_message_text=>'Fasettvalg'
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140864812487751893)
,p_name=>'APEX.FS.INPUT_INVALID_FILTER_PREFIX'
,p_message_language=>'no'
,p_message_text=>'Filterprefikset %0 er ugyldig for fasetten %1.'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140863271687751892)
,p_name=>'APEX.FS.INPUT_MISSING_FILTER_PREFIX'
,p_message_language=>'no'
,p_message_text=>'Filterprefiks mangler for fasetten %0.'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140897472967751902)
,p_name=>'APEX.FS.INPUT_OPERATOR'
,p_message_language=>'no'
,p_message_text=>'Operator'
,p_is_js_message=>true
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140879314865751897)
,p_name=>'APEX.FS.INPUT_OPERATOR.C'
,p_message_language=>'no'
,p_message_text=>'inneholder'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140878326582751897)
,p_name=>'APEX.FS.INPUT_OPERATOR.EQ'
,p_message_language=>'no'
,p_message_text=>'er lik'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140879002458751897)
,p_name=>'APEX.FS.INPUT_OPERATOR.GT'
,p_message_language=>'no'
,p_message_text=>unistr('st\00F8rre enn')
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140879191124751897)
,p_name=>'APEX.FS.INPUT_OPERATOR.GTE'
,p_message_language=>'no'
,p_message_text=>unistr('st\00F8rre enn eller lik')
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140878797885751897)
,p_name=>'APEX.FS.INPUT_OPERATOR.LT'
,p_message_language=>'no'
,p_message_text=>'mindre enn'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140878824601751897)
,p_name=>'APEX.FS.INPUT_OPERATOR.LTE'
,p_message_language=>'no'
,p_message_text=>'mindre enn eller lik'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140889829733751900)
,p_name=>'APEX.FS.INPUT_OPERATOR.NC'
,p_message_language=>'no'
,p_message_text=>'inneholder ikke'
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140878509029751897)
,p_name=>'APEX.FS.INPUT_OPERATOR.NEQ'
,p_message_language=>'no'
,p_message_text=>'er ikke lik'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140889728190751900)
,p_name=>'APEX.FS.INPUT_OPERATOR.NSTARTS'
,p_message_language=>'no'
,p_message_text=>'begynner ikke med'
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140879292235751897)
,p_name=>'APEX.FS.INPUT_OPERATOR.STARTS'
,p_message_language=>'no'
,p_message_text=>'begynner med'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140897848176751903)
,p_name=>'APEX.FS.INPUT_UNSUPPORTED_DATA_TYPE'
,p_message_language=>'no'
,p_message_text=>unistr('Datatypen %0 (%1) st\00F8ttes ikke for fasetten Inndatafelt.')
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140864700670751893)
,p_name=>'APEX.FS.INPUT_UNSUPPORTED_FILTER_FOR_DATA_TYPE'
,p_message_language=>'no'
,p_message_text=>unistr('Filteret %0 st\00F8ttes ikke for fasetten %1 (datatypen %2).')
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140897391096751902)
,p_name=>'APEX.FS.INPUT_VALUE'
,p_message_language=>'no'
,p_message_text=>'Verdi'
,p_is_js_message=>true
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141022691048751939)
,p_name=>'APEX.FS.NO_SEARCH_COLUMNS_PROVIDED'
,p_message_language=>'no'
,p_message_text=>unistr('Ingen s\00F8kekolonner er angitt for fasetten %0')
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140848832851751888)
,p_name=>'APEX.FS.OPEN_CONFIG'
,p_message_language=>'no'
,p_message_text=>'Flere filtre'
,p_is_js_message=>true
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140975489874751926)
,p_name=>'APEX.FS.RANGE_BEGIN'
,p_message_language=>'no'
,p_message_text=>'Intervallet starter'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141022188568751939)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL'
,p_message_language=>'no'
,p_message_text=>'%0 til %1'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141022262343751939)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL_OPEN_HI'
,p_message_language=>'no'
,p_message_text=>'Over %0'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141022300344751939)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL_OPEN_LO'
,p_message_language=>'no'
,p_message_text=>'Under %0'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140975573681751926)
,p_name=>'APEX.FS.RANGE_END'
,p_message_language=>'no'
,p_message_text=>'Intervallet slutter'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141040104415751945)
,p_name=>'APEX.FS.RANGE_LOV_ITEM_INVALID'
,p_message_language=>'no'
,p_message_text=>unistr('Verdilisteelement nr. %2 (%1) for omr\00E5defasetten %0 er ugyldig (mangler skilletegnet |).')
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141022586836751939)
,p_name=>'APEX.FS.RANGE_MANUAL_NOT_SUPPORTED'
,p_message_language=>'no'
,p_message_text=>unistr('Manuelle inndata for omr\00E5defasetten %0 st\00F8ttes ikke for \00F8yeblikket, ettersom kolonnen er av typen DATE eller TIMESTAMP.')
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141021866680751939)
,p_name=>'APEX.FS.RANGE_TEXT'
,p_message_language=>'no'
,p_message_text=>'til'
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140885454766751899)
,p_name=>'APEX.FS.REMOVE_CHART'
,p_message_language=>'no'
,p_message_text=>'Fjern diagram'
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140971810347751924)
,p_name=>'APEX.FS.RESET'
,p_message_language=>'no'
,p_message_text=>'Tilbakestill'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141021210046751939)
,p_name=>'APEX.FS.SEARCH_LABEL'
,p_message_language=>'no'
,p_message_text=>unistr('S\00F8k')
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141021114266751939)
,p_name=>'APEX.FS.SEARCH_PLACEHOLDER'
,p_message_language=>'no'
,p_message_text=>unistr('S\00F8k ...')
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141022072616751939)
,p_name=>'APEX.FS.SELECT_PLACEHOLDER'
,p_message_language=>'no'
,p_message_text=>'- Velg -'
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140885227502751899)
,p_name=>'APEX.FS.SHOW_CHART'
,p_message_language=>'no'
,p_message_text=>'Vis diagram'
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141021612040751939)
,p_name=>'APEX.FS.SHOW_LESS'
,p_message_language=>'no'
,p_message_text=>unistr('Vis f\00E6rre')
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141021754082751939)
,p_name=>'APEX.FS.SHOW_MORE'
,p_message_language=>'no'
,p_message_text=>'Vis alle'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141021970747751939)
,p_name=>'APEX.FS.STAR_RATING_LABEL'
,p_message_language=>'no'
,p_message_text=>unistr('%0 stjerner og h\00F8yere')
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140977139563751926)
,p_name=>'APEX.FS.SUGGESTIONS'
,p_message_language=>'no'
,p_message_text=>'Filterforslag'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141022708926751939)
,p_name=>'APEX.FS.TEXT_FIELD_ONLY_FOR_NUMBER_COLUMNS'
,p_message_language=>'no'
,p_message_text=>unistr('Tekstfeltfasetten %0 st\00F8ttes for \00F8yeblikket bare for kolonner av typen NUMBER.')
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140848264480751888)
,p_name=>'APEX.FS.TOTAL_ROW_COUNT_LABEL'
,p_message_language=>'no'
,p_message_text=>'Totalt radantall'
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141038119512751944)
,p_name=>'APEX.FS.UNSUPPORTED_DATA_TYPE'
,p_message_language=>'no'
,p_message_text=>unistr('Datatypen %0 (%1) st\00F8ttes ikke for fasettert s\00F8k.')
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140968386038751923)
,p_name=>'APEX.FS.VISUALLY_HIDDEN_HEADING'
,p_message_language=>'no'
,p_message_text=>unistr('Visuelt skjult \2013 overskrift')
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141030647059751942)
,p_name=>'APEX.GO_TO_ERROR'
,p_message_language=>'no'
,p_message_text=>unistr('G\00E5 til feil')
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140986688204751929)
,p_name=>'APEX.GV.AGG_CONTEXT'
,p_message_language=>'no'
,p_message_text=>'Aggreger.'
,p_is_js_message=>true
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140914502337751907)
,p_name=>'APEX.GV.BLANK_HEADING'
,p_message_language=>'no'
,p_message_text=>'Tom overskrift'
,p_is_js_message=>true
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140995921353751932)
,p_name=>'APEX.GV.BREAK_COLLAPSE'
,p_message_language=>'no'
,p_message_text=>'Trekk sammen kontrollskift'
,p_is_js_message=>true
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140986799200751929)
,p_name=>'APEX.GV.BREAK_CONTEXT'
,p_message_language=>'no'
,p_message_text=>'Kontrollskift.'
,p_is_js_message=>true
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140995828874751932)
,p_name=>'APEX.GV.BREAK_EXPAND'
,p_message_language=>'no'
,p_message_text=>'Utvid kontrollskift'
,p_is_js_message=>true
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140995602820751932)
,p_name=>'APEX.GV.DELETED_COUNT'
,p_message_language=>'no'
,p_message_text=>'%0 rader er slettet'
,p_is_js_message=>true
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141064743677751952)
,p_name=>'APEX.GV.DUP_REC_ID'
,p_message_language=>'no'
,p_message_text=>'Duplisert identitet'
,p_is_js_message=>true
,p_version_scn=>2705254
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140857640770751891)
,p_name=>'APEX.GV.ENTER_EDIT_MODE'
,p_message_language=>'no'
,p_message_text=>unistr('\00C5pner redigeringsmodus')
,p_is_js_message=>true
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140983525884751928)
,p_name=>'APEX.GV.FIRST_PAGE'
,p_message_language=>'no'
,p_message_text=>unistr('F\00F8rst')
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140856424734751890)
,p_name=>'APEX.GV.FLOATING_ITEM.DIALOG.HIDE_DIALOG'
,p_message_language=>'no'
,p_message_text=>'Skjul dialogboks'
,p_is_js_message=>true
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140855410123751890)
,p_name=>'APEX.GV.FLOATING_ITEM.DIALOG.TITLE'
,p_message_language=>'no'
,p_message_text=>'Flytende overflytcelleinnhold'
,p_is_js_message=>true
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140856750997751890)
,p_name=>'APEX.GV.FLOATING_ITEM.SHOW_DIALOG'
,p_message_language=>'no'
,p_message_text=>'Vis overflytinnhold'
,p_is_js_message=>true
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140930911989751912)
,p_name=>'APEX.GV.FOOTER_LANDMARK'
,p_message_language=>'no'
,p_message_text=>'Bunntekst for rutenett'
,p_is_js_message=>true
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140986959954751929)
,p_name=>'APEX.GV.GROUP_CONTEXT'
,p_message_language=>'no'
,p_message_text=>'Gruppeoverskrift'
,p_is_js_message=>true
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140986870240751929)
,p_name=>'APEX.GV.HEADER_CONTEXT'
,p_message_language=>'no'
,p_message_text=>'Overskrift.'
,p_is_js_message=>true
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140983626137751928)
,p_name=>'APEX.GV.LAST_PAGE'
,p_message_language=>'no'
,p_message_text=>'Siste'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140857828360751891)
,p_name=>'APEX.GV.LEAVE_EDIT_MODE'
,p_message_language=>'no'
,p_message_text=>'Lukker redigeringsmodus'
,p_is_js_message=>true
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140882524848751898)
,p_name=>'APEX.GV.LOAD_ALL'
,p_message_language=>'no'
,p_message_text=>'Last alle'
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141005405808751934)
,p_name=>'APEX.GV.LOAD_MORE'
,p_message_language=>'no'
,p_message_text=>'Vis flere'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140983312729751928)
,p_name=>'APEX.GV.NEXT_PAGE'
,p_message_language=>'no'
,p_message_text=>'Neste'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140987028021751929)
,p_name=>'APEX.GV.PAGE_RANGE'
,p_message_language=>'no'
,p_message_text=>'Siderader'
,p_is_js_message=>true
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140896196953751902)
,p_name=>'APEX.GV.PAGE_RANGE_ENTITY'
,p_message_language=>'no'
,p_message_text=>'Side %0'
,p_is_js_message=>true
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140983743800751928)
,p_name=>'APEX.GV.PAGE_RANGE_XY'
,p_message_language=>'no'
,p_message_text=>'%0 - %1'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140983891501751928)
,p_name=>'APEX.GV.PAGE_RANGE_XYZ'
,p_message_language=>'no'
,p_message_text=>'%0-%1 av %2'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141040767508751945)
,p_name=>'APEX.GV.PAGE_SELECTION'
,p_message_language=>'no'
,p_message_text=>'Sidevalg'
,p_is_js_message=>true
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140931252511751912)
,p_name=>'APEX.GV.PAGINATION_LANDMARK'
,p_message_language=>'no'
,p_message_text=>'Paginering'
,p_is_js_message=>true
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140983496860751928)
,p_name=>'APEX.GV.PREV_PAGE'
,p_message_language=>'no'
,p_message_text=>'Forrige'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140881413580751898)
,p_name=>'APEX.GV.RANGE_DISPLAY'
,p_message_language=>'no'
,p_message_text=>'Intervallvisning'
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140914849323751908)
,p_name=>'APEX.GV.ROWS_SELECTION'
,p_message_language=>'no'
,p_message_text=>'Radutvalg'
,p_is_js_message=>true
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141064529948751952)
,p_name=>'APEX.GV.ROW_ADDED'
,p_message_language=>'no'
,p_message_text=>'Lagt til'
,p_is_js_message=>true
,p_version_scn=>2705254
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141064602103751952)
,p_name=>'APEX.GV.ROW_CHANGED'
,p_message_language=>'no'
,p_message_text=>'Endret'
,p_is_js_message=>true
,p_version_scn=>2705254
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141072958450751955)
,p_name=>'APEX.GV.ROW_COLUMN_CONTEXT'
,p_message_language=>'no'
,p_message_text=>'Rutenettradsekvens: %0, kolonne: %1.'
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141073050964751955)
,p_name=>'APEX.GV.ROW_CONTEXT'
,p_message_language=>'no'
,p_message_text=>'Rutenettradsekvens: %0.'
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141064480936751952)
,p_name=>'APEX.GV.ROW_DELETED'
,p_message_language=>'no'
,p_message_text=>'Slettet'
,p_is_js_message=>true
,p_version_scn=>2705254
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140987290302751929)
,p_name=>'APEX.GV.ROW_HEADER'
,p_message_language=>'no'
,p_message_text=>'Radoverskrift'
,p_is_js_message=>true
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140914704612751908)
,p_name=>'APEX.GV.ROW_SELECTION'
,p_message_language=>'no'
,p_message_text=>'Radvalg'
,p_is_js_message=>true
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140882612639751898)
,p_name=>'APEX.GV.SELECTED_ENTITY_COUNT'
,p_message_language=>'no'
,p_message_text=>'%0 %1 valgt'
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140982739793751928)
,p_name=>'APEX.GV.SELECTION_CELL_COUNT'
,p_message_language=>'no'
,p_message_text=>'%0 celler er valgt'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140983996428751928)
,p_name=>'APEX.GV.SELECTION_COUNT'
,p_message_language=>'no'
,p_message_text=>'%0 rader er valgt'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141026020619751940)
,p_name=>'APEX.GV.SELECT_ALL'
,p_message_language=>'no'
,p_message_text=>'Velg alle'
,p_is_js_message=>true
,p_version_scn=>2705246
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140919550428751909)
,p_name=>'APEX.GV.SELECT_ALL_ROWS'
,p_message_language=>'no'
,p_message_text=>'Velg alle rader'
,p_is_js_message=>true
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140995779673751932)
,p_name=>'APEX.GV.SELECT_PAGE_N'
,p_message_language=>'no'
,p_message_text=>'Side %0'
,p_is_js_message=>true
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140987122546751929)
,p_name=>'APEX.GV.SELECT_ROW'
,p_message_language=>'no'
,p_message_text=>'Velg rad'
,p_is_js_message=>true
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140987420169751929)
,p_name=>'APEX.GV.SORTED_ASCENDING'
,p_message_language=>'no'
,p_message_text=>'Sortert stigende - %0'
,p_is_js_message=>true
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140987529080751929)
,p_name=>'APEX.GV.SORTED_DESCENDING'
,p_message_language=>'no'
,p_message_text=>'Sortert synkende - %0'
,p_is_js_message=>true
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140982803574751928)
,p_name=>'APEX.GV.SORT_ASCENDING'
,p_message_language=>'no'
,p_message_text=>'Sorter stigende'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140983102446751928)
,p_name=>'APEX.GV.SORT_ASCENDING_ORDER'
,p_message_language=>'no'
,p_message_text=>'Sorter stigende - %0'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140982981207751928)
,p_name=>'APEX.GV.SORT_DESCENDING'
,p_message_language=>'no'
,p_message_text=>'Sorter synkende'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140983203495751928)
,p_name=>'APEX.GV.SORT_DESCENDING_ORDER'
,p_message_language=>'no'
,p_message_text=>'Sorter synkende - %0'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140983096040751928)
,p_name=>'APEX.GV.SORT_OFF'
,p_message_language=>'no'
,p_message_text=>'Ikke sorter'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140848674529751888)
,p_name=>'APEX.GV.SORT_OPTIONS'
,p_message_language=>'no'
,p_message_text=>'Sorteringsvalg'
,p_is_js_message=>true
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140931028511751912)
,p_name=>'APEX.GV.STATE_ICONS_LANDMARK'
,p_message_language=>'no'
,p_message_text=>'Tilstandsikoner'
,p_is_js_message=>true
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140931189817751912)
,p_name=>'APEX.GV.STATUS_LANDMARK'
,p_message_language=>'no'
,p_message_text=>'Status for rutenett'
,p_is_js_message=>true
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140860917137751892)
,p_name=>'APEX.GV.TOTAL_ENTITY_PLURAL'
,p_message_language=>'no'
,p_message_text=>'%0 %1'
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140860697577751892)
,p_name=>'APEX.GV.TOTAL_ENTITY_SINGULAR'
,p_message_language=>'no'
,p_message_text=>'1 %0'
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140995589075751931)
,p_name=>'APEX.GV.TOTAL_PAGES'
,p_message_language=>'no'
,p_message_text=>'Totalt %0'
,p_is_js_message=>true
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140914362873751907)
,p_name=>'APEX.HTTP.REQUEST_FAILED'
,p_message_language=>'no'
,p_message_text=>unistr('HTTP-foresp\00F8rselen til %0 mislyktes.')
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140915905492751908)
,p_name=>'APEX.ICON_LIST.COLUMN'
,p_message_language=>'no'
,p_message_text=>'Kolonne - %0'
,p_is_js_message=>true
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140916179432751908)
,p_name=>'APEX.ICON_LIST.COLUMN_AND_ROW'
,p_message_language=>'no'
,p_message_text=>'Kolonne %0 og rad %1'
,p_is_js_message=>true
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140916413452751908)
,p_name=>'APEX.ICON_LIST.FIRST_COLUMN'
,p_message_language=>'no'
,p_message_text=>unistr('P\00E5 f\00F8rste kolonne allerede. Kolonne %0 og rad %1')
,p_is_js_message=>true
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140916365984751908)
,p_name=>'APEX.ICON_LIST.FIRST_ROW'
,p_message_language=>'no'
,p_message_text=>unistr('P\00E5 f\00F8rste rad allerede. Kolonne %0 og rad %1')
,p_is_js_message=>true
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141061939581751951)
,p_name=>'APEX.ICON_LIST.GRID_DIM'
,p_message_language=>'no'
,p_message_text=>'Presentert i %0 kolonner og %1 rader'
,p_is_js_message=>true
,p_version_scn=>2705252
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140916585948751908)
,p_name=>'APEX.ICON_LIST.LAST_COLUMN'
,p_message_language=>'no'
,p_message_text=>unistr('P\00E5 siste kolonne allerede. Kolonne %0 og rad %1')
,p_is_js_message=>true
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140916259619751908)
,p_name=>'APEX.ICON_LIST.LAST_ROW'
,p_message_language=>'no'
,p_message_text=>unistr('P\00E5 siste rad allerede. Kolonne %0 og rad %1')
,p_is_js_message=>true
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140995417009751931)
,p_name=>'APEX.ICON_LIST.LIST_DIM'
,p_message_language=>'no'
,p_message_text=>'Presentert i %0 rader'
,p_is_js_message=>true
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140916038055751908)
,p_name=>'APEX.ICON_LIST.ROW'
,p_message_language=>'no'
,p_message_text=>'Rad - %0'
,p_is_js_message=>true
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141072726775751955)
,p_name=>'APEX.IG.ACC_LABEL'
,p_message_language=>'no'
,p_message_text=>'Interaktivt rutenett %0'
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140979882818751927)
,p_name=>'APEX.IG.ACTIONS'
,p_message_language=>'no'
,p_message_text=>'Handlinger'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140980891169751927)
,p_name=>'APEX.IG.ADD'
,p_message_language=>'no'
,p_message_text=>'Legg til'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140980743839751927)
,p_name=>'APEX.IG.ADD_ROW'
,p_message_language=>'no'
,p_message_text=>'Legg til rad'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141066343822751953)
,p_name=>'APEX.IG.AGGREGATE'
,p_message_language=>'no'
,p_message_text=>'Aggreger'
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141051917352751948)
,p_name=>'APEX.IG.AGGREGATION'
,p_message_language=>'no'
,p_message_text=>'Aggregering'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141053657635751949)
,p_name=>'APEX.IG.ALL'
,p_message_language=>'no'
,p_message_text=>'Alle'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141011238466751936)
,p_name=>'APEX.IG.ALL_TEXT_COLUMNS'
,p_message_language=>'no'
,p_message_text=>'Alle tekstkolonner'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141012411338751936)
,p_name=>'APEX.IG.ALTERNATIVE'
,p_message_language=>'no'
,p_message_text=>'Alternativ'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141013541565751937)
,p_name=>'APEX.IG.AND'
,p_message_language=>'no'
,p_message_text=>'og'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141032938701751943)
,p_name=>'APEX.IG.APPROX_COUNT_DISTINCT'
,p_message_language=>'no'
,p_message_text=>unistr('Tiln\00E6rmet antall unike')
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141067330355751954)
,p_name=>'APEX.IG.APPROX_COUNT_DISTINCT_OVERALL'
,p_message_language=>'no'
,p_message_text=>'Samlet omtrentlig antall unike'
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141050573516751948)
,p_name=>'APEX.IG.AREA'
,p_message_language=>'no'
,p_message_text=>'Areal '
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141052457737751948)
,p_name=>'APEX.IG.ASCENDING'
,p_message_language=>'no'
,p_message_text=>'Stigende'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141012520419751936)
,p_name=>'APEX.IG.AUTHORIZATION'
,p_message_language=>'no'
,p_message_text=>'Autorisering'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141066445410751953)
,p_name=>'APEX.IG.AUTO'
,p_message_language=>'no'
,p_message_text=>'Automatisk'
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141033320693751943)
,p_name=>'APEX.IG.AVG'
,p_message_language=>'no'
,p_message_text=>'Gjennomsnitt'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141067016867751953)
,p_name=>'APEX.IG.AVG_OVERALL'
,p_message_language=>'no'
,p_message_text=>'Samlet gjennomsnitt'
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141050058091751948)
,p_name=>'APEX.IG.AXIS_LABEL_TITLE'
,p_message_language=>'no'
,p_message_text=>unistr('Tittel p\00E5 etikettakse')
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141050236873751948)
,p_name=>'APEX.IG.AXIS_VALUE_DECIMAL'
,p_message_language=>'no'
,p_message_text=>'Desimalplasser'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141050155183751948)
,p_name=>'APEX.IG.AXIS_VALUE_TITLE'
,p_message_language=>'no'
,p_message_text=>unistr('Tittel p\00E5 verdiakse')
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141056202774751949)
,p_name=>'APEX.IG.BACKGROUND_COLOR'
,p_message_language=>'no'
,p_message_text=>'Bakgrunnsfarge'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141050659490751948)
,p_name=>'APEX.IG.BAR'
,p_message_language=>'no'
,p_message_text=>'Stolpe'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141007825425751935)
,p_name=>'APEX.IG.BETWEEN'
,p_message_language=>'no'
,p_message_text=>'mellom'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141057402716751950)
,p_name=>'APEX.IG.BOTH'
,p_message_language=>'no'
,p_message_text=>'Begge'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141050758140751948)
,p_name=>'APEX.IG.BUBBLE'
,p_message_language=>'no'
,p_message_text=>'Boble'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140981037788751927)
,p_name=>'APEX.IG.CANCEL'
,p_message_language=>'no'
,p_message_text=>'Avbryt'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141013477620751937)
,p_name=>'APEX.IG.CASE_SENSITIVE'
,p_message_language=>'no'
,p_message_text=>unistr('Skill mellom store og sm\00E5 bokstaver')
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141067904422751954)
,p_name=>'APEX.IG.CASE_SENSITIVE_WITH_BRACKETS'
,p_message_language=>'no'
,p_message_text=>unistr('(Skiller mellom store og sm\00E5 bokstaver)')
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141039299586751944)
,p_name=>'APEX.IG.CHANGES_SAVED'
,p_message_language=>'no'
,p_message_text=>'Endringene er lagret'
,p_is_js_message=>true
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140981447092751927)
,p_name=>'APEX.IG.CHANGE_VIEW'
,p_message_language=>'no'
,p_message_text=>'Endre visning'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141014547827751937)
,p_name=>'APEX.IG.CHART'
,p_message_language=>'no'
,p_message_text=>'Diagram'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141011059883751936)
,p_name=>'APEX.IG.CHART_MAX_DATAPOINT_CNT'
,p_message_language=>'no'
,p_message_text=>unistr('Sp\00F8rringen har overskredet maksimum, som er %0 datapunkt per diagram. Bruk et filter for \00E5 redusere antall poster i basissp\00F8rringen.')
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140979762079751927)
,p_name=>'APEX.IG.CHART_VIEW'
,p_message_language=>'no'
,p_message_text=>'Diagramvisning'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140988130831751929)
,p_name=>'APEX.IG.CLEAR'
,p_message_language=>'no'
,p_message_text=>'Nullstill'
,p_is_js_message=>true
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141049569814751947)
,p_name=>'APEX.IG.CLOSE_COLUMN'
,p_message_language=>'no'
,p_message_text=>'Lukk'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141056475786751949)
,p_name=>'APEX.IG.COLORS'
,p_message_language=>'no'
,p_message_text=>'Farger'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141033701457751943)
,p_name=>'APEX.IG.COLOR_PREVIEW'
,p_message_language=>'no'
,p_message_text=>unistr('Forh\00E5ndsvis')
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141012860445751937)
,p_name=>'APEX.IG.COLUMN'
,p_message_language=>'no'
,p_message_text=>'Kolonne'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140979974795751927)
,p_name=>'APEX.IG.COLUMNS'
,p_message_language=>'no'
,p_message_text=>'Kolonner'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140941895609751916)
,p_name=>'APEX.IG.COLUMN_HEADER_ACTIONS'
,p_message_language=>'no'
,p_message_text=>'Kolonnehandlinger'
,p_is_js_message=>true
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140941657730751915)
,p_name=>'APEX.IG.COLUMN_HEADER_ACTIONS_FOR'
,p_message_language=>'no'
,p_message_text=>'Handlinger for kolonnen %0'
,p_is_js_message=>true
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141058201496751950)
,p_name=>'APEX.IG.COLUMN_TYPE'
,p_message_language=>'no'
,p_message_text=>unistr('Kolonne - form\00E5l')
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141012918085751937)
,p_name=>'APEX.IG.COMPLEX'
,p_message_language=>'no'
,p_message_text=>'Kompleks'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140980178962751927)
,p_name=>'APEX.IG.COMPUTE'
,p_message_language=>'no'
,p_message_text=>'Beregn'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141008459999751935)
,p_name=>'APEX.IG.CONTAINS'
,p_message_language=>'no'
,p_message_text=>'inneholder'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141014774635751937)
,p_name=>'APEX.IG.CONTROL_BREAK'
,p_message_language=>'no'
,p_message_text=>'Kontrollskift'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140987976593751929)
,p_name=>'APEX.IG.COPY_CB'
,p_message_language=>'no'
,p_message_text=>'Kopier til utklippstavle'
,p_is_js_message=>true
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140988053586751929)
,p_name=>'APEX.IG.COPY_DOWN'
,p_message_language=>'no'
,p_message_text=>'Kopier ned'
,p_is_js_message=>true
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141032725051751942)
,p_name=>'APEX.IG.COUNT'
,p_message_language=>'no'
,p_message_text=>'Antall'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141032841928751943)
,p_name=>'APEX.IG.COUNT_DISTINCT'
,p_message_language=>'no'
,p_message_text=>'Antall unike'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141067286864751953)
,p_name=>'APEX.IG.COUNT_DISTINCT_OVERALL'
,p_message_language=>'no'
,p_message_text=>'Samlet antall unike'
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141067184987751953)
,p_name=>'APEX.IG.COUNT_OVERALL'
,p_message_language=>'no'
,p_message_text=>'Samlet antall'
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141064886219751953)
,p_name=>'APEX.IG.CREATE_X'
,p_message_language=>'no'
,p_message_text=>'Opprett %0'
,p_is_js_message=>true
,p_version_scn=>2705254
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141011412414751936)
,p_name=>'APEX.IG.DATA'
,p_message_language=>'no'
,p_message_text=>'Data'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141058005483751950)
,p_name=>'APEX.IG.DATA_TYPE'
,p_message_language=>'no'
,p_message_text=>'Datatype'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141057611379751950)
,p_name=>'APEX.IG.DATE'
,p_message_language=>'no'
,p_message_text=>'Dato'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141039005359751944)
,p_name=>'APEX.IG.DATE_INVALID_VALUE'
,p_message_language=>'no'
,p_message_text=>'Ugyldig datoverdi'
,p_is_js_message=>true
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141009148017751935)
,p_name=>'APEX.IG.DAYS'
,p_message_language=>'no'
,p_message_text=>'dager'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141012102874751936)
,p_name=>'APEX.IG.DEFAULT_SETTINGS'
,p_message_language=>'no'
,p_message_text=>'Standardinnstillinger'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141011977476751936)
,p_name=>'APEX.IG.DEFAULT_TYPE'
,p_message_language=>'no'
,p_message_text=>'Standardtype'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140980927066751927)
,p_name=>'APEX.IG.DELETE'
,p_message_language=>'no'
,p_message_text=>'Slett'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141059161653751950)
,p_name=>'APEX.IG.DELETE_REPORT_CONFIRM'
,p_message_language=>'no'
,p_message_text=>unistr('Er du sikker p\00E5 at du vil slette denne rapporten?')
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141016563893751938)
,p_name=>'APEX.IG.DELETE_ROW'
,p_message_language=>'no'
,p_message_text=>'Slett rad'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141015312579751937)
,p_name=>'APEX.IG.DELETE_ROWS'
,p_message_language=>'no'
,p_message_text=>'Slett rader'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141052564863751948)
,p_name=>'APEX.IG.DESCENDING'
,p_message_language=>'no'
,p_message_text=>'Synkende'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141014229912751937)
,p_name=>'APEX.IG.DETAIL'
,p_message_language=>'no'
,p_message_text=>'Detalj'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140979472213751927)
,p_name=>'APEX.IG.DETAIL_VIEW'
,p_message_language=>'no'
,p_message_text=>'Detaljvisning'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141041567420751945)
,p_name=>'APEX.IG.DIRECTION'
,p_message_language=>'no'
,p_message_text=>'Retning'
,p_is_js_message=>true
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141013961767751937)
,p_name=>'APEX.IG.DISABLED'
,p_message_language=>'no'
,p_message_text=>'Deaktivert'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141008506270751935)
,p_name=>'APEX.IG.DOES_NOT_CONTAIN'
,p_message_language=>'no'
,p_message_text=>'inneholder ikke'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141008799568751935)
,p_name=>'APEX.IG.DOES_NOT_START_WITH'
,p_message_language=>'no'
,p_message_text=>'begynner ikke med'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141050841820751948)
,p_name=>'APEX.IG.DONUT'
,p_message_language=>'no'
,p_message_text=>'Hjul'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141014923636751937)
,p_name=>'APEX.IG.DOWNLOAD'
,p_message_language=>'no'
,p_message_text=>'Last ned'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140905297963751905)
,p_name=>'APEX.IG.DOWNLOAD_DATA_ONLY'
,p_message_language=>'no'
,p_message_text=>'Bare data'
,p_is_js_message=>true
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141060167765751951)
,p_name=>'APEX.IG.DOWNLOAD_FORMAT'
,p_message_language=>'no'
,p_message_text=>'Velg format'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140920398251751909)
,p_name=>'APEX.IG.DOWNLOAD_FORMAT_NOT_ENABLED'
,p_message_language=>'no'
,p_message_text=>'Nedlastingsformatet %0 er ikke aktivert.'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141053265359751948)
,p_name=>'APEX.IG.DUPLICATE_AGGREGATION'
,p_message_language=>'no'
,p_message_text=>'Duplisert aggregering'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141053361876751949)
,p_name=>'APEX.IG.DUPLICATE_CONTROLBREAK'
,p_message_language=>'no'
,p_message_text=>'Duplisert kontrollskift'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141016441985751938)
,p_name=>'APEX.IG.DUPLICATE_ROW'
,p_message_language=>'no'
,p_message_text=>'Dupliser rad'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141015290181751937)
,p_name=>'APEX.IG.DUPLICATE_ROWS'
,p_message_language=>'no'
,p_message_text=>'Dupliserte rader'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140980596436751927)
,p_name=>'APEX.IG.EDIT'
,p_message_language=>'no'
,p_message_text=>'Rediger'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141052377469751948)
,p_name=>'APEX.IG.EDIT_CHART'
,p_message_language=>'no'
,p_message_text=>'Rediger diagram'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140932847640751913)
,p_name=>'APEX.IG.EDIT_CONTROL'
,p_message_language=>'no'
,p_message_text=>'Rediger %0'
,p_is_js_message=>true
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141063744296751952)
,p_name=>'APEX.IG.EDIT_GROUP_BY'
,p_message_language=>'no'
,p_message_text=>'Rediger Grupper etter'
,p_is_js_message=>true
,p_version_scn=>2705252
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140970910103751924)
,p_name=>'APEX.IG.EDIT_MODE'
,p_message_language=>'no'
,p_message_text=>'%0 i redigeringsmodus'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140946516817751917)
,p_name=>'APEX.IG.EDIT_MODE_DESCRIPTION'
,p_message_language=>'no'
,p_message_text=>'Rutenett i redigeringsmodus, opphev trykk hvis du vil bytte til visningsmodus'
,p_is_js_message=>true
,p_version_scn=>2705233
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141059740024751950)
,p_name=>'APEX.IG.EMAIL_BCC'
,p_message_language=>'no'
,p_message_text=>'Blindkopi'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141059909761751951)
,p_name=>'APEX.IG.EMAIL_BODY'
,p_message_language=>'no'
,p_message_text=>'Melding'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141059644293751950)
,p_name=>'APEX.IG.EMAIL_CC'
,p_message_language=>'no'
,p_message_text=>'Kopi'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141059381886751950)
,p_name=>'APEX.IG.EMAIL_SENT'
,p_message_language=>'no'
,p_message_text=>'E-post er sendt.'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141059834416751951)
,p_name=>'APEX.IG.EMAIL_SUBJECT'
,p_message_language=>'no'
,p_message_text=>'Emne'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141059565500751950)
,p_name=>'APEX.IG.EMAIL_TO'
,p_message_language=>'no'
,p_message_text=>'Mottaker (til)'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141013630177751937)
,p_name=>'APEX.IG.ENABLED'
,p_message_language=>'no'
,p_message_text=>'Aktivert'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141006824024751935)
,p_name=>'APEX.IG.EQUALS'
,p_message_language=>'no'
,p_message_text=>'er lik'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141013733780751937)
,p_name=>'APEX.IG.EXPRESSION'
,p_message_language=>'no'
,p_message_text=>'Uttrykk'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141058719503751950)
,p_name=>'APEX.IG.FD_TYPE'
,p_message_language=>'no'
,p_message_text=>'Type'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141025993765751940)
,p_name=>'APEX.IG.FILE_PREPARED'
,p_message_language=>'no'
,p_message_text=>'Filen er klargjort. Starter nedlasting.'
,p_is_js_message=>true
,p_version_scn=>2705246
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140988228533751929)
,p_name=>'APEX.IG.FILL'
,p_message_language=>'no'
,p_message_text=>'Fyll'
,p_is_js_message=>true
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140990432158751930)
,p_name=>'APEX.IG.FILL_LABEL'
,p_message_language=>'no'
,p_message_text=>'Fyll ut utvalg med'
,p_is_js_message=>true
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140990327637751930)
,p_name=>'APEX.IG.FILL_TITLE'
,p_message_language=>'no'
,p_message_text=>'Fyll ut utvalg'
,p_is_js_message=>true
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140980014607751927)
,p_name=>'APEX.IG.FILTER'
,p_message_language=>'no'
,p_message_text=>'Filtrer'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141013032439751937)
,p_name=>'APEX.IG.FILTERS'
,p_message_language=>'no'
,p_message_text=>'Filtre'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141066789021751953)
,p_name=>'APEX.IG.FILTER_WITH_DOTS'
,p_message_language=>'no'
,p_message_text=>'Filtrer ...'
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141052725468751948)
,p_name=>'APEX.IG.FIRST'
,p_message_language=>'no'
,p_message_text=>unistr('F\00F8rst')
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140980265632751927)
,p_name=>'APEX.IG.FLASHBACK'
,p_message_language=>'no'
,p_message_text=>'Flashback'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141011576251751936)
,p_name=>'APEX.IG.FORMAT'
,p_message_language=>'no'
,p_message_text=>'Formater'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141057387895751950)
,p_name=>'APEX.IG.FORMATMASK'
,p_message_language=>'no'
,p_message_text=>'Formatmaske'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141059037129751950)
,p_name=>'APEX.IG.FORMAT_CSV'
,p_message_language=>'no'
,p_message_text=>'CSV'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141058904423751950)
,p_name=>'APEX.IG.FORMAT_HTML'
,p_message_language=>'no'
,p_message_text=>'HTML'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140970028810751924)
,p_name=>'APEX.IG.FORMAT_PDF'
,p_message_language=>'no'
,p_message_text=>'PDF'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140903970844751904)
,p_name=>'APEX.IG.FORMAT_XLSX'
,p_message_language=>'no'
,p_message_text=>'Excel'
,p_is_js_message=>true
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141016109067751938)
,p_name=>'APEX.IG.FREEZE'
,p_message_language=>'no'
,p_message_text=>unistr('L\00E5s')
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141013827869751937)
,p_name=>'APEX.IG.FUNCTIONS_AND_OPERATORS'
,p_message_language=>'no'
,p_message_text=>'Funksjoner og operatorer'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141050909870751948)
,p_name=>'APEX.IG.FUNNEL'
,p_message_language=>'no'
,p_message_text=>'Trakt'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141032621690751942)
,p_name=>'APEX.IG.GO'
,p_message_language=>'no'
,p_message_text=>unistr('S\00F8k')
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141007486665751935)
,p_name=>'APEX.IG.GREATER_THAN'
,p_message_language=>'no'
,p_message_text=>unistr('st\00F8rre enn')
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141007564959751935)
,p_name=>'APEX.IG.GREATER_THAN_OR_EQUALS'
,p_message_language=>'no'
,p_message_text=>unistr('st\00F8rre enn eller lik')
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141014113647751937)
,p_name=>'APEX.IG.GRID'
,p_message_language=>'no'
,p_message_text=>'Rutenett'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140979254663751927)
,p_name=>'APEX.IG.GRID_VIEW'
,p_message_language=>'no'
,p_message_text=>'Rutenettvisning'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141053555973751949)
,p_name=>'APEX.IG.GROUP'
,p_message_language=>'no'
,p_message_text=>'Gruppe'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141014314332751937)
,p_name=>'APEX.IG.GROUP_BY'
,p_message_language=>'no'
,p_message_text=>'Grupper etter'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140979515567751927)
,p_name=>'APEX.IG.GROUP_BY_VIEW'
,p_message_language=>'no'
,p_message_text=>'Grupper etter-visning'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141057901103751950)
,p_name=>'APEX.IG.HD_TYPE'
,p_message_language=>'no'
,p_message_text=>'Betingelsestype'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141056869386751950)
,p_name=>'APEX.IG.HEADING'
,p_message_language=>'no'
,p_message_text=>'Overskrift'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141057004637751950)
,p_name=>'APEX.IG.HEADING_ALIGN'
,p_message_language=>'no'
,p_message_text=>'Overskriftsjustering'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141066652004751953)
,p_name=>'APEX.IG.HELP'
,p_message_language=>'no'
,p_message_text=>'Hjelp'
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141062196565751951)
,p_name=>'APEX.IG.HELP.ACTIONS.EDITING'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Du kan sette inn, oppdatere og slette data direkte i dette interaktive rutenettet.</p>',
'',
unistr('<p>Sett inn en ny rad ved \00E5 klikke p\00E5 knappen Legg til rad.</p>'),
'',
unistr('<p>Rediger eksisterende data ved \00E5 dobbeltklikke i en bestemt celle. Ved st\00F8rre redigeringsarbeid klikker du p\00E5 Rediger for \00E5 g\00E5 inn i redigeringsmodus. I redigeringsmodus kan du klikke \00E9n gang eller bruke tastaturet til \00E5 redigere bestemte celler.</')
||'p>',
'',
unistr('<p>Bruk menyen Endre til \00E5 duplisere og slette rader. Du aktiverer menyen Endre ved \00E5 bruke avmerkingsboksene til \00E5 velge \00E9n eller flere rader.</p>'),
'',
unistr('<p>Dupliser en valgt rad ved \00E5 klikke p\00E5 menyen Endre og velge Dupliserte rader. Slett en valgt rad ved \00E5 klikke p\00E5 menyen Endre og velge Slett rad.</p>')))
,p_version_scn=>2705252
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141064256158751952)
,p_name=>'APEX.IG.HELP.ACTIONS.EDITING_HEADING'
,p_message_language=>'no'
,p_message_text=>'Redigeringsfunksjoner'
,p_version_scn=>2705254
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141064331526751952)
,p_name=>'APEX.IG.HELP.ACTIONS.INTRO'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Et interaktivt rutenett presenterer et sett med data i en rapport som kan tilpasses og s\00F8kes i. Du kan utf\00F8re flere operasjoner som begrenser postene som returneres, og du kan endre hvordan dataene vises.</p>'),
'',
unistr('<p>Bruk s\00F8kefeltet til \00E5 filtrere postene som returneres. Klikk p\00E5 Handlinger for \00E5 \00E5pne flere valg for endring av rapportoppsettet, eller bruk kolonneoverskriftsmenyene i viste kolonner.</p>'),
'',
unistr('<p>Bruk Rapportinnstillinger til \00E5 lagre tilpasningene av en rapport. Du kan ogs\00E5 laste ned dataene fra rapporten til en ekstern fil eller sende dataene via e-post til deg selv eller andre.</p>'),
'',
unistr('<p>Hvis du vil l\00E6re mer, kan du se delen om bruk av interaktive rutenett i <em>Oracle APEX End User''s Guide</em>.')))
,p_version_scn=>2705254
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141064014602751952)
,p_name=>'APEX.IG.HELP.ACTIONS.INTRO_HEADING'
,p_message_language=>'no'
,p_message_text=>'Oversikt'
,p_version_scn=>2705254
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141062079786751951)
,p_name=>'APEX.IG.HELP.ACTIONS.REPORTING'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Du kan tilpasse det interaktive rutenettet til \00E5 vise data p\00E5 ulike m\00E5ter ved hjelp av de innebygde funksjonene.</p>'),
'',
unistr('<p>Bruk kolonneoverskriftmenyene eller menyen Handlinger til \00E5 fastsette hvilke kolonner som skal vises, i hvilken rekkef\00F8lge de skal vises, og hvilke kolonner som skal l\00E5ses. Du kan ogs\00E5 definere ulike datafiltre og sortere dataene som returneres.</')
||'p>',
'',
unistr('<p>Bruk knappen Vis (ved siden av feltet S\00F8k) til \00E5 f\00E5 tilgang til andre datavisninger som kan v\00E6re definert av applikasjonsutvikleren. Du kan ogs\00E5 opprette et diagram eller vise et eksisterende diagram.</p>  '),
'',
unistr('<p><em>Merknad: Klikk p\00E5 <strong>Hjelp</strong> i dialogboksen for det interaktive rutenettet hvis du vil vise mer detaljerte opplysninger om den valgte funksjonen.</em></p>')))
,p_version_scn=>2705252
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141064178528751952)
,p_name=>'APEX.IG.HELP.ACTIONS.REPORTING_HEADING'
,p_message_language=>'no'
,p_message_text=>'Rapporteringsfunksjoner'
,p_version_scn=>2705254
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141015165796751937)
,p_name=>'APEX.IG.HELP.ACTIONS_TITLE'
,p_message_language=>'no'
,p_message_text=>'Hjelp til interaktive rutenett'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141060966962751951)
,p_name=>'APEX.IG.HELP.AGGREGATE'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Bruk denne dialogboksen til \00E5 aggregere kolonner. Aggregerte verdier vises nederst i dataene. Hvis kontrollskift er definert, vises de nederst i hvert enkelt skift.</p>'),
'',
'<p><strong>Aggregeringsliste</strong><br>',
unistr('Aggregeringslisten viser definerte aggregeringer. Deaktiver en eksisterende aggregering ved \00E5 oppheve valget av den.<br>'),
unistr('Klikk p\00E5 Legg til ( &plus; ) hvis du vil opprette en ny aggregering, eller klikk p\00E5 Slett ( &minus; ) hvis du vil fjerne en eksisterende aggregering.</p>'),
'',
'<p><strong>Aggregeringsinnstillinger</strong><br>',
unistr('Bruk skjemaet til h\00F8yre til \00E5 definere aggregeringen.<br>'),
'Velg kolonnenavnet og aggregeringstypen.<br>',
unistr('Du kan velge \00E5 angi et verkt\00F8ytips for aggregeringen.<br>'),
'Hvis du har definert et kontrollskift, vil valg av <strong>Vis total verdi</strong> vise det totale gjennomsnittet, totalsummen eller en lignende verdi nederst i dataene.</p>',
'',
unistr('<p><em>Merknad: \00C5pne dialogboksen Aggregering p\00E5 menyen Handlinger eller ved \00E5 klikke p\00E5 kolonneoverskriften og sum ( &sum; ).</em></p>')))
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141063182790751952)
,p_name=>'APEX.IG.HELP.AGGREGATE_TITLE'
,p_message_language=>'no'
,p_message_text=>'Hjelp til aggregering'
,p_is_js_message=>true
,p_version_scn=>2705252
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141061666736751951)
,p_name=>'APEX.IG.HELP.CHART'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Bruk denne dialogboksen til \00E5 definere et diagram som skal vises som en separat datavisning.<br>'),
'Velg en diagramtype og diagramattributter.</p>',
'<p><strong>Diagramattributter</strong><br>',
'Hvilke diagramattributter som er tilgjengelige, varierer etter diagramtype.</p>',
'<p>',
'<ul>',
'  <li>Velg kolonnen som inneholder verdien for attributtet:',
'    <ul>',
unistr('      <li>Etikett \2013 Tekst for hvert datapunkt.</li>'),
unistr('      <li>Verdi \2013 Data som skal plottes.</li>'),
unistr('      <li>Serie \2013 For \00E5 definere en dynamisk sp\00F8rring med flere serier.</li>'),
unistr('      <li>\00C5pning \2013 Daglig \00E5pningskurs (bare Aksje).</li>'),
unistr('      <li>Lukking \2013 Daglig lukkingskurs (bare Aksje).</li>'),
unistr('      <li>H\00F8y \2013 H\00F8y verdi (bare Intervall og Aksje).</li>'),
unistr('      <li>Lav \2013 Lav verdi (bare Intervall og Aksje).</li>'),
unistr('      <li>Volum \2013 Daglig aksjevolum (bare Aksje).</li>'),
unistr('      <li>M\00E5l \2013 M\00E5lverdi (bare Trakt).</li>'),
unistr('      <li>X \2013 X-akseverdi (bare Boble og Punkt).</li>'),
unistr('      <li>Y \2013 Y-akseverdi (bare Boble og Punkt).</li>'),
unistr('      <li>Z \2013 Stolpebredde eller bobleradius (bare Stolpe, Boble og Intervall).</li>'),
'    </ul>',
'  </li>',
unistr('  <li>Retning \2013 Loddrett eller vannrett.</li>'),
unistr('  <li>Aggregering \2013 Velg hvordan diagramverdiene skal aggregeres.</li>'),
unistr('  <li>Stablet \2013 Angi om dataelementene skal v\00E6re stablet.</li>'),
unistr('  <li>Sorter etter \2013 Sorter etter etiketten eller verdien(e).'),
'    <ul>',
unistr('      <li>Retning \2013 Sortering i stigende eller synkende verdier.</li>'),
unistr('      <li>Nullverdier \2013 Angi hvordan poster med nullverdier skal sorteres i forhold til poster med ikke-nullverdier.</li>'),
'    </ul>',
'  </li>',
'  <li>Desimalplasser</li>',
unistr('  <li>Tittel p\00E5 etikettakse</li>'),
unistr('  <li>Tittel p\00E5 verdiakse</li>'),
'</ul>',
'</p>'))
,p_version_scn=>2705252
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141063573630751952)
,p_name=>'APEX.IG.HELP.CHART_TITLE'
,p_message_language=>'no'
,p_message_text=>'Hjelp til diagram'
,p_is_js_message=>true
,p_version_scn=>2705252
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141060690977751951)
,p_name=>'APEX.IG.HELP.COLUMNS'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Bruk denne dialogboksen til \00E5 velge hvilke kolonner som skal vises, og i hvilken rekkef\00F8lge.</p>'),
'',
unistr('<p>Skjul en kolonne ved \00E5 oppheve valget av den.<br>'),
unistr('Endre rekkef\00F8lgen p\00E5 kolonner ved \00E5 klikke p\00E5 Flytt opp ( &uarr; ) eller Flytt ned ( &darr; ).<br>'),
unistr('Bruk rullegardinvelgeren til \00E5 vise alle kolonner, viste kolonner eller ikke viste kolonner.</p>'),
'',
unistr('<p>Du kan ogs\00E5 bruke skjermbildet til \00E5 angi minimumsbredden for en kolonne i piksler.</p>'),
'',
unistr('<p><em>Merknad: Du kan ogs\00E5 endre rekkef\00F8lgen p\00E5 viste kolonner ved \00E5 klikke p\00E5 drah\00E5ndtaket (ved starten av kolonneoverskriften) og dra kolonnen mot venstre eller h\00F8yre. Du kan ogs\00E5 endre kolonnebredden for viste kolonner ved \00E5 velge kolonneskillete')
||unistr('gnet mellom overskrifter og flytte det mot venstre eller h\00F8yre.</em></p>')))
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141063435312751952)
,p_name=>'APEX.IG.HELP.COLUMNS_TITLE'
,p_message_language=>'no'
,p_message_text=>'Hjelp for kolonner'
,p_is_js_message=>true
,p_version_scn=>2705252
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141061078402751951)
,p_name=>'APEX.IG.HELP.COMPUTE'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Bruk denne dialogboksen til \00E5 definere flere kolonner basert p\00E5 matematiske og funksjonelle beregninger som utf\00F8res mot eksisterende kolonner.</p>'),
'',
'<p><strong>Beregningsliste</strong><br>',
unistr('Beregningslisten viser definerte beregninger. Deaktiver en eksisterende beregning ved \00E5 oppheve valget av den.<br>'),
unistr('Klikk p\00E5 Legg til ( &plus; ) hvis du vil legge til en ny beregning, eller klikk p\00E5 Slett ( &minus; ) hvis du vil fjerne en eksisterende beregning.</p>'),
'',
'<p><strong>Beregningsinnstillinger</strong><br>',
unistr('Bruk skjemaet til \00E5 definere beregningen.<br>'),
'Angi kolonnedetaljene, for eksempel overskrift og etikett, og velg justeringsinnstillinger.<br> ',
unistr('Bruk tekstomr\00E5det Uttrykk til \00E5 angi kolonnen(e) og de tilknyttede funksjonene for beregningen.<br>'),
'Velg den egnede datatypen, og eventuelt en formatmaske, for den nye kolonnen.</p>'))
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141063022091751952)
,p_name=>'APEX.IG.HELP.COMPUTE_TITLE'
,p_message_language=>'no'
,p_message_text=>'Hjelp til beregning'
,p_is_js_message=>true
,p_version_scn=>2705252
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141061322752751951)
,p_name=>'APEX.IG.HELP.CONTROL_BREAK'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Bruk denne dialogboksen til \00E5 definere et kontrollskift i \00E9n eller flere kolonner.</p>'),
'',
'<p><strong>Kontrollskiftliste</strong><br>',
unistr('Kontrollskiftlisten viser definerte kontrollskift. Deaktiver en eksisterende kontrollskiftkolonne ved \00E5 oppheve valget av den.<br>'),
unistr('Klikk p\00E5 Legg til ( &plus; ) hvis du vil inkludere en ny kolonne i kontrollskiftet, eller klikk p\00E5 Slett ( &minus; ) hvis du vil fjerne en eksisterende kolonne fra kontrollskiftet.<br>'),
unistr('Hvis du vil endre rekkef\00F8lgen p\00E5 kolonner, klikker du p\00E5 Flytt opp ( &uarr; ) eller Flytt ned ( &darr; ) for \00E5 flytte den valgte kolonne opp eller ned i forhold til andre kolonner.</p>'),
'',
'<p><strong>Kontrollskiftinnstillinger</strong><br>',
unistr('Bruk skjemaet til \00E5 definere kontrollskiftkolonnen.<br>'),
'Velg en kontrollskiftkolonne, sorteringsretningen og hvordan nullkolonner (kolonner uten verdier) skal sorteres.</p>',
'',
unistr('<p><em>Merknad: N\00E5r du viser det interaktive rutenettet, kan du definere et kontrollskift ved \00E5 klikke p\00E5 en kolonneoverskrift og velge kontrollskiftikonet.</em></p>')))
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141062754885751952)
,p_name=>'APEX.IG.HELP.CONTROL_BREAK_TITLE'
,p_message_language=>'no'
,p_message_text=>'Hjelp til kontrollskift'
,p_is_js_message=>true
,p_version_scn=>2705252
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141061525868751951)
,p_name=>'APEX.IG.HELP.DOWNLOAD'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Bruk denne dialogboksen til \00E5 laste ned alle de gjeldende radene i en ekstern fil. Filen inneholder bare de gjeldende viste kolonnene, ved hjelp av eventuelle filtre og sorteringer som er brukt p\00E5 dataene.</p>'),
'',
unistr('<p>Velg filformatet, og klikk p\00E5 Last ned.<br>'),
'Merknad: CSV inkluderer ikke tekstformatering som aggregater og kontrollskift.</p>',
'',
'<p>Hvis du vil sende filen via e-post, velger du Send som e-post og angir e-postdetaljene (mottaker, emne og melding).</p>'))
,p_version_scn=>2705252
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141062530720751952)
,p_name=>'APEX.IG.HELP.DOWNLOAD_TITLE'
,p_message_language=>'no'
,p_message_text=>'Hjelp til nedlasting'
,p_is_js_message=>true
,p_version_scn=>2705252
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141060786019751951)
,p_name=>'APEX.IG.HELP.FILTER'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Bruk denne dialogboksen til \00E5 konfigurere datafiltre som begrenser radene som returneres.</p>'),
'',
'<p><strong>Filterliste</strong><br>',
unistr('Filterlisten viser definerte filtre. Deaktiver et eksisterende filter ved \00E5 oppheve valget av det.<br>'),
unistr('Klikk p\00E5 Legg til ( &plus; ) hvis du vil opprette et nytt filter, eller klikk p\00E5 Slett ( &minus; ) hvis du vil fjerne et eksisterende filter.</p>'),
'',
'<p><strong>Filterinnstillinger</strong><br>',
unistr('Bruk skjemaet til \00E5 definere filteregenskapene.<br>'),
'Velg den egnede filtertypen:<br>',
'&nbsp;&nbsp;&nbsp;Rad - filtrer etter et begrep i hvilken som helst kolonne som kan filtreres.<br>',
'&nbsp;&nbsp;&nbsp;Kolonne - filtrer en bestemt kolonne med en angitt operator og verdi.</p>',
'',
unistr('<p><em>Merknad: N\00E5r du viser det interaktive rutenettet, kan du definere radfiltre ved \00E5 skrive direkte inn i feltet S\00F8k. Klikk p\00E5 Velg kolonner for s\00F8king hvis du vil begrense s\00F8ket til en bestemt kolonne. Du kan ogs\00E5 \00E5pne en kolonneoverskriftmeny o')
||unistr('g velge en verdi for \00E5 opprette et kolonnefilter.</em></p>')))
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141063316405751952)
,p_name=>'APEX.IG.HELP.FILTER_TITLE'
,p_message_language=>'no'
,p_message_text=>'Hjelp til filter'
,p_is_js_message=>true
,p_version_scn=>2705252
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141061115525751951)
,p_name=>'APEX.IG.HELP.FLASHBACK'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Bruk denne dialogboksen til \00E5 vise dataene slik de var p\00E5 et tidligere tidspunkt.</p>'),
unistr('<p>Angi hvor mange minutter tidligere Flashback-sp\00F8rringen skal utf\00F8res.</p>')))
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141062941051751952)
,p_name=>'APEX.IG.HELP.FLASHBACK_TITLE'
,p_message_language=>'no'
,p_message_text=>'Hjelp til flashback'
,p_is_js_message=>true
,p_version_scn=>2705252
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141063644796751952)
,p_name=>'APEX.IG.HELP.GROUP_BY_TITLE'
,p_message_language=>'no'
,p_message_text=>'Hjelp til Grupper etter'
,p_is_js_message=>true
,p_version_scn=>2705252
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141061284767751951)
,p_name=>'APEX.IG.HELP.HIGHLIGHT'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Bruk denne dialogboksen til \00E5 utheve rader eller kolonner med data basert p\00E5 den angitte betingelsen.</p>'),
'',
'<p><strong>Uthevingsliste</strong><br>',
unistr('Uthevingslisten viser definerte uthevinger. Deaktiver en eksisterende utheving ved \00E5 oppheve valget av den.<br>'),
unistr('Klikk p\00E5 Legg til ( &plus; ) hvis du vil opprette en ny utheving, eller klikk p\00E5 Slett ( &minus; ) hvis du vil fjerne en eksisterende utheving.</p>'),
'',
'<p><strong>Uthevingsinnstillinger</strong><br>',
unistr('Bruk skjemaet til \00E5 definere uthevingsegenskapene.<br>'),
'Angi navnet, velg Rad eller Kolonne, og velg HTML-fargekodene for bakgrunnen og teksten.<br>',
unistr('Angi et egnet valg for <strong>Betingelsestype</strong> for \00E5 utheve bestemte data:<br>'),
'&nbsp;&nbsp;&nbsp;Rad - uthev begrepet i hvilken som helst kolonne.<br>',
unistr('&nbsp;&nbsp;&nbsp;Kolonne - uthev i en bestemt kolonne, basert p\00E5 den angitte operatoren og verdien.</p>')))
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141062860435751952)
,p_name=>'APEX.IG.HELP.HIGHLIGHT_TITLE'
,p_message_language=>'no'
,p_message_text=>'Hjelp til utheving'
,p_is_js_message=>true
,p_version_scn=>2705252
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141061454036751951)
,p_name=>'APEX.IG.HELP.REPORT'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Bruk denne dialogboksen til \00E5 lagre endringene du har gjort i gjeldende oppsett og konfigurasjon.<br>'),
unistr('Applikasjonsutviklere kan definere flere alternative rapportoppsett. N\00E5r det er tillatt, kan du og andre sluttbrukere lagre en rapport som Offentlig, noe som gj\00F8r rapporten tilgjengelig for alle andre brukere av rutenettet. Du kan ogs\00E5 lagre en rappo')
||'rt som en privat rapport som bare du kan vise.</p>',
'<p>Velg mellom de tilgjengelige typene, og angi et navn for den lagrede rapporten.</p>'))
,p_version_scn=>2705252
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141062694593751952)
,p_name=>'APEX.IG.HELP.REPORT_TITLE'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Hjelp til rapporter',
''))
,p_is_js_message=>true
,p_version_scn=>2705252
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141060823652751951)
,p_name=>'APEX.IG.HELP.SORT'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Bruk denne dialogboksen til \00E5 angi visningsrekkef\00F8lgen.</p>'),
'',
'<p><strong>Sorteringsliste</strong><br>',
'Dialogboksen Sorter viser en liste over konfigurerte sorteringsregler.<br>',
unistr('Klikk p\00E5 Legg til ( &plus; ) hvis du vil opprette en sorteringskolonne, eller klikk p\00E5 Slett ( &minus; ) hvis du vil fjerne en sorteringskolonne.<br>'),
unistr('Klikk p\00E5 Flytt opp ( &uarr; ) og Flytt ned ( &darr; ) hvis du vil flytte den valgte sorteringskolonnen opp og ned i forhold til andre sorteringskolonner.</p>'),
'',
'<p><strong>Sorteringsinnstillinger</strong><br>',
unistr('Velg en sorteringskolonne, sorteringsretningen og hvilke rekkef\00F8lge nullkolonnene (kolonner uten verdier) skal ha.</p>'),
'',
'<p><em>Merknad: Data kan sorteres etter kolonner som ikke vises, men det kan hende at ikke alle kolonner kan sorteres.</em><br>',
unistr('<em>Viste kolonner kan sorteres ved \00E5 trykke p\00E5 pil opp (stigende) eller pil ned (synkende) p\00E5 slutten av kolonneoverskriftene. Hvis du vil legge til en etterf\00F8lgende kolonne i en eksisterende sortering, holder du inne tasten Skift og klikker p\00E5 pil ')
||'opp eller pil ned.</em></p>'))
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141063251022751952)
,p_name=>'APEX.IG.HELP.SORT_TITLE'
,p_message_language=>'no'
,p_message_text=>'Hjelp til sortering'
,p_is_js_message=>true
,p_version_scn=>2705252
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141062406294751952)
,p_name=>'APEX.IG.HELP.SUBSCRIPTION_TITLE'
,p_message_language=>'no'
,p_message_text=>'Hjelp til abonnement'
,p_is_js_message=>true
,p_version_scn=>2705252
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141016069564751937)
,p_name=>'APEX.IG.HIDE'
,p_message_language=>'no'
,p_message_text=>'Skjul'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140980485459751927)
,p_name=>'APEX.IG.HIGHLIGHT'
,p_message_language=>'no'
,p_message_text=>'Uthev'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141049631669751947)
,p_name=>'APEX.IG.HIGH_COLUMN'
,p_message_language=>'no'
,p_message_text=>unistr('H\00F8y')
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141050467360751948)
,p_name=>'APEX.IG.HORIZONTAL'
,p_message_language=>'no'
,p_message_text=>'Vannrett'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141009035493751935)
,p_name=>'APEX.IG.HOURS'
,p_message_language=>'no'
,p_message_text=>'timer'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141014045800751937)
,p_name=>'APEX.IG.ICON'
,p_message_language=>'no'
,p_message_text=>'Ikon'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140979366395751927)
,p_name=>'APEX.IG.ICON_VIEW'
,p_message_language=>'no'
,p_message_text=>'Ikonvisning'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141007288662751935)
,p_name=>'APEX.IG.IN'
,p_message_language=>'no'
,p_message_text=>'i'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141015614627751937)
,p_name=>'APEX.IG.INACTIVE_SETTING'
,p_message_language=>'no'
,p_message_text=>'Inaktiv innstilling'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141015785312751937)
,p_name=>'APEX.IG.INACTIVE_SETTINGS'
,p_message_language=>'no'
,p_message_text=>'Inaktive innstillinger'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141023320782751940)
,p_name=>'APEX.IG.INTERNAL_ERROR'
,p_message_language=>'no'
,p_message_text=>unistr('Det oppstod en intern feil ved behandling av foresp\00F8rselen om interaktivt rutenett.')
,p_version_scn=>2705245
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140911295059751907)
,p_name=>'APEX.IG.INVALID_COLUMN_FILTER_TYPE'
,p_message_language=>'no'
,p_message_text=>unistr('Kolonnefiltertypen %0 st\00F8ttes ikke for kolonnen %1.')
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141062217301751951)
,p_name=>'APEX.IG.INVALID_DATE_FORMAT'
,p_message_language=>'no'
,p_message_text=>'Ugyldig datoformat'
,p_is_js_message=>true
,p_version_scn=>2705252
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141037001900751944)
,p_name=>'APEX.IG.INVALID_FILTER_COLUMN'
,p_message_language=>'no'
,p_message_text=>unistr('Interaktivt rutenett st\00F8tter ikke definisjon av et filter i kolonnen %0.')
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141036976381751944)
,p_name=>'APEX.IG.INVALID_FILTER_OPERATOR'
,p_message_language=>'no'
,p_message_text=>'%0 er ikke en gyldig filtertype for definisjon av et filter for interaktivt rutenett.'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140917898510751908)
,p_name=>'APEX.IG.INVALID_NUMBER_FORMAT'
,p_message_language=>'no'
,p_message_text=>'Ugyldig tallformat'
,p_is_js_message=>true
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141064950451751953)
,p_name=>'APEX.IG.INVALID_SETTING'
,p_message_language=>'no'
,p_message_text=>'Ugyldig innstilling'
,p_is_js_message=>true
,p_version_scn=>2705254
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141065070746751953)
,p_name=>'APEX.IG.INVALID_SETTINGS'
,p_message_language=>'no'
,p_message_text=>'Ugyldige innstillinger'
,p_is_js_message=>true
,p_version_scn=>2705254
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141056138671751949)
,p_name=>'APEX.IG.INVALID_SORT_BY'
,p_message_language=>'no'
,p_message_text=>'Sorter etter er satt til %0, men ingen kolonne er valgt for %0.'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141053487316751949)
,p_name=>'APEX.IG.INVALID_VALUE'
,p_message_language=>'no'
,p_message_text=>'Ugyldig verdi'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141048561906751947)
,p_name=>'APEX.IG.INVISIBLE'
,p_message_language=>'no'
,p_message_text=>'Vises ikke'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141008076201751935)
,p_name=>'APEX.IG.IN_THE_LAST'
,p_message_language=>'no'
,p_message_text=>unistr('er i l\00F8pet av siste')
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141008282234751935)
,p_name=>'APEX.IG.IN_THE_NEXT'
,p_message_language=>'no'
,p_message_text=>'i neste'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141007100307751935)
,p_name=>'APEX.IG.IS_NOT_NULL'
,p_message_language=>'no'
,p_message_text=>'er ikke tom'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141007018052751935)
,p_name=>'APEX.IG.IS_NULL'
,p_message_language=>'no'
,p_message_text=>'er tom'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141056909502751950)
,p_name=>'APEX.IG.LABEL'
,p_message_language=>'no'
,p_message_text=>'Etikett'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141048992842751947)
,p_name=>'APEX.IG.LABEL_COLUMN'
,p_message_language=>'no'
,p_message_text=>'Etikett'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141052899248751948)
,p_name=>'APEX.IG.LAST'
,p_message_language=>'no'
,p_message_text=>'Sist'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140997397419751932)
,p_name=>'APEX.IG.LAST.DAY'
,p_message_language=>'no'
,p_message_text=>'Siste dag'
,p_is_js_message=>true
,p_version_scn=>2705241
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140997532843751932)
,p_name=>'APEX.IG.LAST.HOUR'
,p_message_language=>'no'
,p_message_text=>'Siste time'
,p_is_js_message=>true
,p_version_scn=>2705241
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140998005603751932)
,p_name=>'APEX.IG.LAST.MINUTE'
,p_message_language=>'no'
,p_message_text=>'Siste minutt'
,p_is_js_message=>true
,p_version_scn=>2705241
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140997023975751932)
,p_name=>'APEX.IG.LAST.MONTH'
,p_message_language=>'no'
,p_message_text=>unistr('Siste m\00E5ned')
,p_is_js_message=>true
,p_version_scn=>2705241
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140997150273751932)
,p_name=>'APEX.IG.LAST.WEEK'
,p_message_language=>'no'
,p_message_text=>'Siste uke'
,p_is_js_message=>true
,p_version_scn=>2705241
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140997232021751932)
,p_name=>'APEX.IG.LAST.X_DAYS'
,p_message_language=>'no'
,p_message_text=>'Siste %0 dager'
,p_is_js_message=>true
,p_version_scn=>2705241
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140997445137751932)
,p_name=>'APEX.IG.LAST.X_HOURS'
,p_message_language=>'no'
,p_message_text=>'Siste %0 timer'
,p_is_js_message=>true
,p_version_scn=>2705241
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140998164522751932)
,p_name=>'APEX.IG.LAST.X_MINUTES'
,p_message_language=>'no'
,p_message_text=>'Siste %0 minutter'
,p_is_js_message=>true
,p_version_scn=>2705241
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140997985149751932)
,p_name=>'APEX.IG.LAST.X_MONTHS'
,p_message_language=>'no'
,p_message_text=>unistr('Siste %0 m\00E5neder')
,p_is_js_message=>true
,p_version_scn=>2705241
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140997806572751932)
,p_name=>'APEX.IG.LAST.X_WEEKS'
,p_message_language=>'no'
,p_message_text=>'Siste %0 uker'
,p_is_js_message=>true
,p_version_scn=>2705241
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140996870886751932)
,p_name=>'APEX.IG.LAST.X_YEARS'
,p_message_language=>'no'
,p_message_text=>unistr('Siste %0 \00E5r')
,p_is_js_message=>true
,p_version_scn=>2705241
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140996921704751932)
,p_name=>'APEX.IG.LAST.YEAR'
,p_message_language=>'no'
,p_message_text=>unistr('Siste \00E5r')
,p_is_js_message=>true
,p_version_scn=>2705241
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141057162219751950)
,p_name=>'APEX.IG.LAYOUT_ALIGN'
,p_message_language=>'no'
,p_message_text=>'Cellejustering'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141057218841751950)
,p_name=>'APEX.IG.LAYOUT_USEGROUPFOR'
,p_message_language=>'no'
,p_message_text=>'Bruk gruppe for'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141007677121751935)
,p_name=>'APEX.IG.LESS_THAN'
,p_message_language=>'no'
,p_message_text=>'mindre enn'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141007757667751935)
,p_name=>'APEX.IG.LESS_THAN_OR_EQUALS'
,p_message_language=>'no'
,p_message_text=>'mindre enn eller lik'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141051006589751948)
,p_name=>'APEX.IG.LINE'
,p_message_language=>'no'
,p_message_text=>'Linje'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141051154461751948)
,p_name=>'APEX.IG.LINE_WITH_AREA'
,p_message_language=>'no'
,p_message_text=>'Linje med areal'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141057503666751950)
,p_name=>'APEX.IG.LISTAGG'
,p_message_language=>'no'
,p_message_text=>'Listagg'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141049763395751947)
,p_name=>'APEX.IG.LOW_COLUMN'
,p_message_language=>'no'
,p_message_text=>'Lav'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141060034420751951)
,p_name=>'APEX.IG.MAILADDRESSES_COMMASEP'
,p_message_language=>'no'
,p_message_text=>'Skill flere adresser med komma'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141008826996751935)
,p_name=>'APEX.IG.MATCHES_REGULAR_EXPRESSION'
,p_message_language=>'no'
,p_message_text=>unistr('samsvarer med regul\00E6rt uttrykk')
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141033208622751943)
,p_name=>'APEX.IG.MAX'
,p_message_language=>'no'
,p_message_text=>'Maksimum'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141067549359751954)
,p_name=>'APEX.IG.MAX_OVERALL'
,p_message_language=>'no'
,p_message_text=>'Samlet maksimum'
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141033479418751943)
,p_name=>'APEX.IG.MEDIAN'
,p_message_language=>'no'
,p_message_text=>'Median'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141067624090751954)
,p_name=>'APEX.IG.MEDIAN_OVERALL'
,p_message_language=>'no'
,p_message_text=>'Samlet median'
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141033190698751943)
,p_name=>'APEX.IG.MIN'
,p_message_language=>'no'
,p_message_text=>'Minimum'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141008904284751935)
,p_name=>'APEX.IG.MINUTES'
,p_message_language=>'no'
,p_message_text=>'minutter'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141033931497751943)
,p_name=>'APEX.IG.MINUTES_AGO'
,p_message_language=>'no'
,p_message_text=>'minutter siden'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141067437724751954)
,p_name=>'APEX.IG.MIN_OVERALL'
,p_message_language=>'no'
,p_message_text=>'Samlet minimum'
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141009333170751936)
,p_name=>'APEX.IG.MONTHS'
,p_message_language=>'no'
,p_message_text=>unistr('m\00E5neder')
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141015915098751937)
,p_name=>'APEX.IG.MORE_DATA_FOUND'
,p_message_language=>'no'
,p_message_text=>unistr('Dataene inneholder mer enn %0 rader. Det overskrider maksimum. Du m\00E5 bruke tilleggsfiltre n\00E5r du skal vise resultatene.')
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141041765813751945)
,p_name=>'APEX.IG.MULTIIG_PAGE_REGION_STATIC_ID_REQUIRED'
,p_message_language=>'no'
,p_message_text=>unistr('Statisk ID for omr\00E5det m\00E5 angis fordi siden inneholder flere interaktive rutenett.')
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141012094908751936)
,p_name=>'APEX.IG.NAME'
,p_message_language=>'no'
,p_message_text=>'Navn'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141012224043751936)
,p_name=>'APEX.IG.NAMED_REPORT'
,p_message_language=>'no'
,p_message_text=>'Navngitt rapport'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140996299341751932)
,p_name=>'APEX.IG.NEXT.DAY'
,p_message_language=>'no'
,p_message_text=>'Neste dag'
,p_is_js_message=>true
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140996077539751932)
,p_name=>'APEX.IG.NEXT.HOUR'
,p_message_language=>'no'
,p_message_text=>'Neste time'
,p_is_js_message=>true
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140998212819751932)
,p_name=>'APEX.IG.NEXT.MINUTE'
,p_message_language=>'no'
,p_message_text=>'Neste minutt'
,p_is_js_message=>true
,p_version_scn=>2705241
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140996552386751932)
,p_name=>'APEX.IG.NEXT.MONTH'
,p_message_language=>'no'
,p_message_text=>unistr('Neste m\00E5ned')
,p_is_js_message=>true
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140996400202751932)
,p_name=>'APEX.IG.NEXT.WEEK'
,p_message_language=>'no'
,p_message_text=>'Neste uke'
,p_is_js_message=>true
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140996381886751932)
,p_name=>'APEX.IG.NEXT.X_DAYS'
,p_message_language=>'no'
,p_message_text=>'Neste %0 dager'
,p_is_js_message=>true
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140996129112751932)
,p_name=>'APEX.IG.NEXT.X_HOURS'
,p_message_language=>'no'
,p_message_text=>'Neste %0 timer'
,p_is_js_message=>true
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140998308103751932)
,p_name=>'APEX.IG.NEXT.X_MINUTES'
,p_message_language=>'no'
,p_message_text=>'Neste %0 minutter'
,p_is_js_message=>true
,p_version_scn=>2705241
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140997694367751932)
,p_name=>'APEX.IG.NEXT.X_MONTHS'
,p_message_language=>'no'
,p_message_text=>unistr('Neste %0 m\00E5neder')
,p_is_js_message=>true
,p_version_scn=>2705241
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140997709329751932)
,p_name=>'APEX.IG.NEXT.X_WEEKS'
,p_message_language=>'no'
,p_message_text=>'Neste %0 uker'
,p_is_js_message=>true
,p_version_scn=>2705241
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140996723081751932)
,p_name=>'APEX.IG.NEXT.X_YEARS'
,p_message_language=>'no'
,p_message_text=>unistr('Neste %0 \00E5r')
,p_is_js_message=>true
,p_version_scn=>2705241
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140996680985751932)
,p_name=>'APEX.IG.NEXT.YEAR'
,p_message_language=>'no'
,p_message_text=>unistr('Neste \00E5r')
,p_is_js_message=>true
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141007926747751935)
,p_name=>'APEX.IG.NOT_BETWEEN'
,p_message_language=>'no'
,p_message_text=>'ikke mellom'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141006900361751935)
,p_name=>'APEX.IG.NOT_EQUALS'
,p_message_language=>'no'
,p_message_text=>'er ikke lik'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141071786243751955)
,p_name=>'APEX.IG.NOT_EXIST'
,p_message_language=>'no'
,p_message_text=>unistr('Omr\00E5det med ID-en %0 er ikke et omr\00E5de med interaktivt rutenett, eller det finnes ikke i applikasjonen %1.')
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141007322961751935)
,p_name=>'APEX.IG.NOT_IN'
,p_message_language=>'no'
,p_message_text=>'ikke i'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141008165388751935)
,p_name=>'APEX.IG.NOT_IN_THE_LAST'
,p_message_language=>'no'
,p_message_text=>unistr('er ikke i l\00F8pet av siste')
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141008369765751935)
,p_name=>'APEX.IG.NOT_IN_THE_NEXT'
,p_message_language=>'no'
,p_message_text=>unistr('er ikke i l\00F8pet av neste')
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141015826233751937)
,p_name=>'APEX.IG.NO_DATA_FOUND'
,p_message_language=>'no'
,p_message_text=>'Ingen data funnet'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141052683631751948)
,p_name=>'APEX.IG.NULLS'
,p_message_language=>'no'
,p_message_text=>'Nullverdier'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141057708658751950)
,p_name=>'APEX.IG.NUMBER'
,p_message_language=>'no'
,p_message_text=>'Numerisk'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141052952570751948)
,p_name=>'APEX.IG.OFF'
,p_message_language=>'no'
,p_message_text=>'Av'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141053097560751948)
,p_name=>'APEX.IG.ON'
,p_message_language=>'no'
,p_message_text=>unistr('P\00E5')
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141006153033751935)
,p_name=>'APEX.IG.ONE_MINUTE_AGO'
,p_message_language=>'no'
,p_message_text=>'For 1 minutt siden'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141060552825751951)
,p_name=>'APEX.IG.OPEN_COLORPICKER'
,p_message_language=>'no'
,p_message_text=>unistr('\00C5pne fargevelger: %0')
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141049454103751947)
,p_name=>'APEX.IG.OPEN_COLUMN'
,p_message_language=>'no'
,p_message_text=>unistr('\00C5pne')
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141013142423751937)
,p_name=>'APEX.IG.OPERATOR'
,p_message_language=>'no'
,p_message_text=>'Operator'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141048880625751947)
,p_name=>'APEX.IG.ORIENTATION'
,p_message_language=>'no'
,p_message_text=>'Retning'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141051265193751948)
,p_name=>'APEX.IG.PIE'
,p_message_language=>'no'
,p_message_text=>'Sektor'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141014461219751937)
,p_name=>'APEX.IG.PIVOT'
,p_message_language=>'no'
,p_message_text=>'Pivoter'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140979637117751927)
,p_name=>'APEX.IG.PIVOT_VIEW'
,p_message_language=>'no'
,p_message_text=>'Pivotvisning'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141060458303751951)
,p_name=>'APEX.IG.PLACEHOLDER_INVALUES'
,p_message_language=>'no'
,p_message_text=>'Skill verdier med %0'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141051354181751948)
,p_name=>'APEX.IG.POLAR'
,p_message_language=>'no'
,p_message_text=>'Polar'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141056664115751949)
,p_name=>'APEX.IG.POSITION_CENTER'
,p_message_language=>'no'
,p_message_text=>'Midtstilt'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141056769828751950)
,p_name=>'APEX.IG.POSITION_END'
,p_message_language=>'no'
,p_message_text=>'Slutt'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141056502820751949)
,p_name=>'APEX.IG.POSITION_START'
,p_message_language=>'no'
,p_message_text=>'Start'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141012339219751936)
,p_name=>'APEX.IG.PRIMARY'
,p_message_language=>'no'
,p_message_text=>unistr('Prim\00E6r')
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141012673965751937)
,p_name=>'APEX.IG.PRIMARY_DEFAULT'
,p_message_language=>'no'
,p_message_text=>unistr('Prim\00E6r standard')
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141029153440751941)
,p_name=>'APEX.IG.PRIMARY_REPORT'
,p_message_language=>'no'
,p_message_text=>unistr('Prim\00E6r rapport')
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140902729647751904)
,p_name=>'APEX.IG.PRINT_ACCESSIBLE.PROMPT'
,p_message_language=>'no'
,p_message_text=>'Inkluder tilgjengelighetskoder'
,p_is_js_message=>true
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140900171430751903)
,p_name=>'APEX.IG.PRINT_ORIENTATION.LOV.HORIZONTAL.D'
,p_message_language=>'no'
,p_message_text=>'Liggende '
,p_is_js_message=>true
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140900206082751903)
,p_name=>'APEX.IG.PRINT_ORIENTATION.LOV.VERTICAL.D'
,p_message_language=>'no'
,p_message_text=>unistr('St\00E5ende')
,p_is_js_message=>true
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140900024016751903)
,p_name=>'APEX.IG.PRINT_ORIENTATION.PROMPT'
,p_message_language=>'no'
,p_message_text=>'Sideretning'
,p_is_js_message=>true
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140899947902751903)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.A3.D'
,p_message_language=>'no'
,p_message_text=>'A3'
,p_is_js_message=>true
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140899897667751903)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.A4.D'
,p_message_language=>'no'
,p_message_text=>'A4'
,p_is_js_message=>true
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140902961492751904)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.CUSTOM.D'
,p_message_language=>'no'
,p_message_text=>'Egendefinert'
,p_is_js_message=>true
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140899628410751903)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.LEGAL.D'
,p_message_language=>'no'
,p_message_text=>'Legal'
,p_is_js_message=>true
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140899550265751903)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.LETTER.D'
,p_message_language=>'no'
,p_message_text=>'Letter'
,p_is_js_message=>true
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140899726770751903)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.TABLOID.D'
,p_message_language=>'no'
,p_message_text=>'Tabloid'
,p_is_js_message=>true
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140899415953751903)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.PROMPT'
,p_message_language=>'no'
,p_message_text=>unistr('Sidest\00F8rrelse')
,p_is_js_message=>true
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140865074665751893)
,p_name=>'APEX.IG.PRINT_STRIP_RICH_TEXT.PROMPT'
,p_message_language=>'no'
,p_message_text=>'Fjern rik tekst'
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141051477299751948)
,p_name=>'APEX.IG.RADAR'
,p_message_language=>'no'
,p_message_text=>'Radar'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141051574254751948)
,p_name=>'APEX.IG.RANGE'
,p_message_language=>'no'
,p_message_text=>'Intervall'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141061735722751951)
,p_name=>'APEX.IG.REFRESH'
,p_message_language=>'no'
,p_message_text=>'Oppfrisk'
,p_is_js_message=>true
,p_version_scn=>2705252
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141016656785751938)
,p_name=>'APEX.IG.REFRESH_ROW'
,p_message_language=>'no'
,p_message_text=>'Oppfrisk rad'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141015427825751937)
,p_name=>'APEX.IG.REFRESH_ROWS'
,p_message_language=>'no'
,p_message_text=>'Oppfrisk rader'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141020682360751939)
,p_name=>'APEX.IG.REGION_NOT_EXIST'
,p_message_language=>'no'
,p_message_text=>unistr('Omr\00E5de for interaktivt rutenett finnes ikke i applikasjonen %0, siden %1 og omr\00E5det %2.')
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140981184994751927)
,p_name=>'APEX.IG.REMOVE_CONTROL'
,p_message_language=>'no'
,p_message_text=>'Fjern %0'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141011758023751936)
,p_name=>'APEX.IG.REPORT'
,p_message_language=>'no'
,p_message_text=>'Rapport'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141070989342751955)
,p_name=>'APEX.IG.REPORT.DELETED'
,p_message_language=>'no'
,p_message_text=>'Rapporten er slettet'
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141070607427751955)
,p_name=>'APEX.IG.REPORT.SAVED.ALTERNATIVE'
,p_message_language=>'no'
,p_message_text=>'Alternativ rapport som er lagret for alle brukere'
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141070563562751955)
,p_name=>'APEX.IG.REPORT.SAVED.DEFAULT'
,p_message_language=>'no'
,p_message_text=>'Standardrapport som er lagret for alle brukere'
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141070881573751955)
,p_name=>'APEX.IG.REPORT.SAVED.PRIVATE'
,p_message_language=>'no'
,p_message_text=>'Privat rapport er lagret'
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141070746249751955)
,p_name=>'APEX.IG.REPORT.SAVED.PUBLIC'
,p_message_language=>'no'
,p_message_text=>'Offentlig rapport som er lagret for alle brukere'
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141020758169751939)
,p_name=>'APEX.IG.REPORT_ALIAS_DOES_NOT_EXIST'
,p_message_language=>'no'
,p_message_text=>'Lagret interaktivt rutenett med navnet %0 finnes ikke.'
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141006025673751935)
,p_name=>'APEX.IG.REPORT_DATA_AS_OF.X.MINUTES_AGO'
,p_message_language=>'no'
,p_message_text=>'Rutenettdata for %0 minutter siden'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141005993557751935)
,p_name=>'APEX.IG.REPORT_DATA_AS_OF_ONE_MINUTE_AGO'
,p_message_language=>'no'
,p_message_text=>'Rutenettdata for 1 minutt siden'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140941491579751915)
,p_name=>'APEX.IG.REPORT_DOES_NOT_EXIST'
,p_message_language=>'no'
,p_message_text=>'Den interaktive rutenettrapporten finnes ikke.'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141063947074751952)
,p_name=>'APEX.IG.REPORT_EDIT'
,p_message_language=>'no'
,p_message_text=>'Rapport - Rediger'
,p_is_js_message=>true
,p_version_scn=>2705254
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141020554002751939)
,p_name=>'APEX.IG.REPORT_ID_DOES_NOT_EXIST'
,p_message_language=>'no'
,p_message_text=>'Lagret interaktivt rutenett med ID-en %0 finnes ikke.'
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141063871928751952)
,p_name=>'APEX.IG.REPORT_SAVE_AS'
,p_message_language=>'no'
,p_message_text=>'Rapport - Lagre som'
,p_is_js_message=>true
,p_version_scn=>2705252
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140981259865751927)
,p_name=>'APEX.IG.REPORT_SETTINGS'
,p_message_language=>'no'
,p_message_text=>'Rutenettinnstillinger'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141071837591751955)
,p_name=>'APEX.IG.REPORT_STATIC_ID_DOES_NOT_EXIST'
,p_message_language=>'no'
,p_message_text=>'Lagret interaktivt rutenett med den statiske ID-en %0 finnes ikke.'
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141066898943751953)
,p_name=>'APEX.IG.REPORT_VIEW'
,p_message_language=>'no'
,p_message_text=>'Rapportvisning'
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140980315135751927)
,p_name=>'APEX.IG.RESET'
,p_message_language=>'no'
,p_message_text=>'Tilbakestill'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141016703242751938)
,p_name=>'APEX.IG.REVERT_CHANGES'
,p_message_language=>'no'
,p_message_text=>'Tilbakestill endringer'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141015567904751937)
,p_name=>'APEX.IG.REVERT_ROWS'
,p_message_language=>'no'
,p_message_text=>'Tilbakestill rader'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141012760070751937)
,p_name=>'APEX.IG.ROW'
,p_message_language=>'no'
,p_message_text=>'Rad'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141011649490751936)
,p_name=>'APEX.IG.ROWS_PER_PAGE'
,p_message_language=>'no'
,p_message_text=>'Rader per side'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141071419446751955)
,p_name=>'APEX.IG.ROW_ACTIONS'
,p_message_language=>'no'
,p_message_text=>'Radhandlinger'
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141072655250751955)
,p_name=>'APEX.IG.ROW_ACTIONS_FOR'
,p_message_language=>'no'
,p_message_text=>'Handlinger for raden %0'
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140980690321751927)
,p_name=>'APEX.IG.SAVE'
,p_message_language=>'no'
,p_message_text=>'Lagre'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141025776128751940)
,p_name=>'APEX.IG.SAVED'
,p_message_language=>'no'
,p_message_text=>'lagret'
,p_is_js_message=>true
,p_version_scn=>2705246
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140930338604751912)
,p_name=>'APEX.IG.SAVED_REPORT'
,p_message_language=>'no'
,p_message_text=>'Lagret rapport: %0'
,p_is_js_message=>true
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140978828690751927)
,p_name=>'APEX.IG.SAVED_REPORTS'
,p_message_language=>'no'
,p_message_text=>'Lagrede rapporter'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140978959516751927)
,p_name=>'APEX.IG.SAVED_REPORT_DEFAULT'
,p_message_language=>'no'
,p_message_text=>'Standard'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140952482314751919)
,p_name=>'APEX.IG.SAVED_REPORT_EXISTS'
,p_message_language=>'no'
,p_message_text=>'Det finnes allerede en lagret rapport med navnet %0. Angi et nytt navn.'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140979007005751927)
,p_name=>'APEX.IG.SAVED_REPORT_PRIVATE'
,p_message_language=>'no'
,p_message_text=>'Privat'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140979106479751927)
,p_name=>'APEX.IG.SAVED_REPORT_PUBLIC'
,p_message_language=>'no'
,p_message_text=>'Offentlig'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141066542873751953)
,p_name=>'APEX.IG.SAVE_AS'
,p_message_language=>'no'
,p_message_text=>'Lagre som'
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141014825293751937)
,p_name=>'APEX.IG.SAVE_REPORT_SETTINGS'
,p_message_language=>'no'
,p_message_text=>'Lagre rapportinnstillinger'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141051606705751948)
,p_name=>'APEX.IG.SCATTER'
,p_message_language=>'no'
,p_message_text=>'Punkt'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140978792146751927)
,p_name=>'APEX.IG.SEARCH'
,p_message_language=>'no'
,p_message_text=>unistr('S\00F8k')
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141058870835751950)
,p_name=>'APEX.IG.SEARCH.ALL_COLUMNS'
,p_message_language=>'no'
,p_message_text=>unistr('S\00F8k: Alle tekstkolonner')
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140978614786751926)
,p_name=>'APEX.IG.SEARCH.COLUMN'
,p_message_language=>'no'
,p_message_text=>unistr('S\00F8k etter: %0')
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141058114234751950)
,p_name=>'APEX.IG.SEARCH.ORACLE_TEXT'
,p_message_language=>'no'
,p_message_text=>unistr('S\00F8k: Fullstendig tekst')
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141005864815751935)
,p_name=>'APEX.IG.SEARCH_FOR.X'
,p_message_language=>'no'
,p_message_text=>unistr('S\00F8k etter %0')
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141048241952751947)
,p_name=>'APEX.IG.SELECT'
,p_message_language=>'no'
,p_message_text=>'- Velg -'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140988305510751929)
,p_name=>'APEX.IG.SELECTION'
,p_message_language=>'no'
,p_message_text=>'Utvalg'
,p_is_js_message=>true
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141041460649751945)
,p_name=>'APEX.IG.SELECT_1_ROW_IN_MASTER'
,p_message_language=>'no'
,p_message_text=>unistr('Velg 1 rad i overordnet omr\00E5de')
,p_is_js_message=>true
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140978539740751926)
,p_name=>'APEX.IG.SELECT_COLUMNS_TO_SEARCH'
,p_message_language=>'no'
,p_message_text=>unistr('Velg kolonner for s\00F8k')
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141071133296751955)
,p_name=>'APEX.IG.SEL_ACTIONS'
,p_message_language=>'no'
,p_message_text=>'Handlinger i utvalget'
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140988554393751929)
,p_name=>'APEX.IG.SEL_MODE_CELL'
,p_message_language=>'no'
,p_message_text=>'Celleutvalg'
,p_is_js_message=>true
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140988487328751929)
,p_name=>'APEX.IG.SEL_MODE_ROW'
,p_message_language=>'no'
,p_message_text=>'Radvalg'
,p_is_js_message=>true
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141059463644751950)
,p_name=>'APEX.IG.SEND_AS_EMAIL'
,p_message_language=>'no'
,p_message_text=>'Send som e-post'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141052089140751948)
,p_name=>'APEX.IG.SERIES_COLUMN'
,p_message_language=>'no'
,p_message_text=>'Serie'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140976277175751926)
,p_name=>'APEX.IG.SHOW'
,p_message_language=>'no'
,p_message_text=>'Vis'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141031417676751942)
,p_name=>'APEX.IG.SHOW_OVERALL_VALUE'
,p_message_language=>'no'
,p_message_text=>'Vis samlet verdi'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141016308382751938)
,p_name=>'APEX.IG.SINGLE_ROW_VIEW'
,p_message_language=>'no'
,p_message_text=>'Enkeltradvisning'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141014684714751937)
,p_name=>'APEX.IG.SORT'
,p_message_language=>'no'
,p_message_text=>'Sorter'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141052153428751948)
,p_name=>'APEX.IG.SORT_BY'
,p_message_language=>'no'
,p_message_text=>'Sorter etter'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141071522091751955)
,p_name=>'APEX.IG.SORT_ONLY_ONE_PER_COLUMN'
,p_message_language=>'no'
,p_message_text=>unistr('Du kan bare definere \00E9n sortering per kolonne.')
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141071321250751955)
,p_name=>'APEX.IG.SRV_CHANGE_MENU'
,p_message_language=>'no'
,p_message_text=>'Endre'
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141053159836751948)
,p_name=>'APEX.IG.STACK'
,p_message_language=>'no'
,p_message_text=>'Stakk'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141008664492751935)
,p_name=>'APEX.IG.STARTS_WITH'
,p_message_language=>'no'
,p_message_text=>'begynner med'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141051796533751948)
,p_name=>'APEX.IG.STOCK'
,p_message_language=>'no'
,p_message_text=>'Aksje'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140971046759751924)
,p_name=>'APEX.IG.STRETCH_COLUMNS'
,p_message_language=>'no'
,p_message_text=>'Strekk kolonnebredder'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141015077085751937)
,p_name=>'APEX.IG.SUBSCRIPTION'
,p_message_language=>'no'
,p_message_text=>'Abonnement'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141033083397751943)
,p_name=>'APEX.IG.SUM'
,p_message_language=>'no'
,p_message_text=>'Sum'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141072841853751955)
,p_name=>'APEX.IG.SUMMARY'
,p_message_language=>'no'
,p_message_text=>'Interaktivt rutenett. Rapport: %0, visning: %1.'
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141066929391751953)
,p_name=>'APEX.IG.SUM_OVERALL'
,p_message_language=>'no'
,p_message_text=>'Samlet sum'
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141049984455751948)
,p_name=>'APEX.IG.TARGET_COLUMN'
,p_message_language=>'no'
,p_message_text=>unistr('M\00E5l')
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141056358362751949)
,p_name=>'APEX.IG.TEXT_COLOR'
,p_message_language=>'no'
,p_message_text=>'Tekstfarge'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140981302189751927)
,p_name=>'APEX.IG.TOGGLE'
,p_message_language=>'no'
,p_message_text=>unistr('Sl\00E5 p\00E5/av')
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140863445139751892)
,p_name=>'APEX.IG.TOOLBAR'
,p_message_language=>'no'
,p_message_text=>'Rutenett'
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141031392469751942)
,p_name=>'APEX.IG.TOOLTIP'
,p_message_language=>'no'
,p_message_text=>unistr('Verkt\00F8ytips')
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141011813545751936)
,p_name=>'APEX.IG.TYPE'
,p_message_language=>'no'
,p_message_text=>'Type'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141016252898751938)
,p_name=>'APEX.IG.UNFREEZE'
,p_message_language=>'no'
,p_message_text=>unistr('L\00E5s opp')
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141013383043751937)
,p_name=>'APEX.IG.UNIT'
,p_message_language=>'no'
,p_message_text=>'Enhet'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141059213081751950)
,p_name=>'APEX.IG.UNSAVED_CHANGES_CONTINUE_CONFIRM'
,p_message_language=>'no'
,p_message_text=>'Det finnes ulagrede endringer. Vil du fortsette?'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141013227340751937)
,p_name=>'APEX.IG.VALUE'
,p_message_language=>'no'
,p_message_text=>'Verdi'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141049005673751947)
,p_name=>'APEX.IG.VALUE_COLUMN'
,p_message_language=>'no'
,p_message_text=>'Verdi'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141053945870751949)
,p_name=>'APEX.IG.VALUE_REQUIRED'
,p_message_language=>'no'
,p_message_text=>unistr('Det m\00E5 angis en verdi.')
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141039103802751944)
,p_name=>'APEX.IG.VALUE_TIMESTAMP_TZ'
,p_message_language=>'no'
,p_message_text=>'Verdi (tidssone kan ikke endres)'
,p_is_js_message=>true
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141057820125751950)
,p_name=>'APEX.IG.VARCHAR2'
,p_message_language=>'no'
,p_message_text=>'Tekst'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141050380104751948)
,p_name=>'APEX.IG.VERTICAL'
,p_message_language=>'no'
,p_message_text=>'Loddrett'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141011382353751936)
,p_name=>'APEX.IG.VIEW'
,p_message_language=>'no'
,p_message_text=>'Vis'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140946404736751917)
,p_name=>'APEX.IG.VIEW_MODE_DESCRIPTION'
,p_message_language=>'no'
,p_message_text=>'Rutenett i visningsmodus, trykk hvis du vil redigere'
,p_is_js_message=>true
,p_version_scn=>2705233
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141048304983751947)
,p_name=>'APEX.IG.VISIBLE'
,p_message_language=>'no'
,p_message_text=>'Vist'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141049846204751947)
,p_name=>'APEX.IG.VOLUME_COLUMN'
,p_message_language=>'no'
,p_message_text=>'Volum'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141009248419751936)
,p_name=>'APEX.IG.WEEKS'
,p_message_language=>'no'
,p_message_text=>'uker'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141048444677751947)
,p_name=>'APEX.IG.WIDTH'
,p_message_language=>'no'
,p_message_text=>'Minste kolonnebredde (piksel)'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141000447430751933)
,p_name=>'APEX.IG.X.BETWEEN.Y.AND.Z'
,p_message_language=>'no'
,p_message_text=>'%0 er mellom %1 og %2'
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141000173425751933)
,p_name=>'APEX.IG.X.CONTAINS.Y'
,p_message_language=>'no'
,p_message_text=>'%0 inneholder %1'
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141000202112751933)
,p_name=>'APEX.IG.X.DOES_NOT_CONTAIN.Y'
,p_message_language=>'no'
,p_message_text=>'%0 inneholder ikke %1'
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140975660049751926)
,p_name=>'APEX.IG.X.DOES_NOT_START_WITH.Y'
,p_message_language=>'no'
,p_message_text=>'%0 begynner ikke med %1'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140998990471751932)
,p_name=>'APEX.IG.X.EQUALS.Y'
,p_message_language=>'no'
,p_message_text=>'%0 er lik %1'
,p_is_js_message=>true
,p_version_scn=>2705241
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140999105528751933)
,p_name=>'APEX.IG.X.GREATER_THAN.Y'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er st\00F8rre enn %1')
,p_is_js_message=>true
,p_version_scn=>2705241
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140999271395751933)
,p_name=>'APEX.IG.X.GREATER_THAN_OR_EQUALS.Y'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er st\00F8rre enn eller lik %1')
,p_is_js_message=>true
,p_version_scn=>2705241
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140999906941751933)
,p_name=>'APEX.IG.X.IN.Y'
,p_message_language=>'no'
,p_message_text=>'%0 er i %1'
,p_is_js_message=>true
,p_version_scn=>2705241
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141001186202751933)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.DAYS'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er i l\00F8pet av de siste %1 dagene')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141000906642751933)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.HOURS'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er i l\00F8pet av de siste %1 timene')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141000773905751933)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.MINUTES'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er i l\00F8pet av de siste %1 minuttene')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141001532810751933)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.MONTHS'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er i l\00F8pet av de siste %1 m\00E5nedene')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141001394148751933)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.WEEKS'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er i l\00F8pet av de siste %1 ukene')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141001789245751933)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.YEARS'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er i l\00F8pet av de siste %1 \00E5rene')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141001051044751933)
,p_name=>'APEX.IG.X.IN_THE_LAST_DAY'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er i l\00F8pet av den siste dagen')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141000834932751933)
,p_name=>'APEX.IG.X.IN_THE_LAST_HOUR'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er i l\00F8pet av den siste timen')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141000626990751933)
,p_name=>'APEX.IG.X.IN_THE_LAST_MINUTE'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er i l\00F8pet av det siste minuttet')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141001400370751933)
,p_name=>'APEX.IG.X.IN_THE_LAST_MONTH'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er i l\00F8pet av den siste m\00E5neden')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141001212073751933)
,p_name=>'APEX.IG.X.IN_THE_LAST_WEEK'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er i l\00F8pet av den siste uken')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141001655660751933)
,p_name=>'APEX.IG.X.IN_THE_LAST_YEAR'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er i l\00F8pet av det siste \00E5ret')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141003543923751934)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.DAYS'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er i l\00F8pet av de neste %1 dagene')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141003350382751934)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.HOURS'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er i l\00F8pet av de neste %1 timene')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141003161557751934)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.MINUTES'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er i l\00F8pet av de neste %1 minuttene')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141003941882751934)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.MONTHS'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er i l\00F8pet av de neste %1 m\00E5nedene')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141003790291751934)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.WEEKS'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er i l\00F8pet av de neste %1 ukene')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141004192158751934)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.YEARS'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er i l\00F8pet av de neste %1 \00E5rene')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141003421954751934)
,p_name=>'APEX.IG.X.IN_THE_NEXT_DAY'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er i l\00F8pet av den neste dagen')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141003244659751934)
,p_name=>'APEX.IG.X.IN_THE_NEXT_HOUR'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er i l\00F8pet av den neste timen')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141003013563751934)
,p_name=>'APEX.IG.X.IN_THE_NEXT_MINUTE'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er i l\00F8pet av det neste minuttet')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141003864788751934)
,p_name=>'APEX.IG.X.IN_THE_NEXT_MONTH'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er i l\00F8pet av den neste m\00E5neden')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141003605817751934)
,p_name=>'APEX.IG.X.IN_THE_NEXT_WEEK'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er i l\00F8pet av den neste uken')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141004010820751934)
,p_name=>'APEX.IG.X.IN_THE_NEXT_YEAR'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er i l\00F8pet av det neste \00E5ret')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140999644046751933)
,p_name=>'APEX.IG.X.IS_NOT_NULL'
,p_message_language=>'no'
,p_message_text=>'%0 er ikke tom'
,p_is_js_message=>true
,p_version_scn=>2705241
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140999570467751933)
,p_name=>'APEX.IG.X.IS_NULL'
,p_message_language=>'no'
,p_message_text=>'%0 er tom'
,p_is_js_message=>true
,p_version_scn=>2705241
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140999323251751933)
,p_name=>'APEX.IG.X.LESS_THAN.Y'
,p_message_language=>'no'
,p_message_text=>'%0 er mindre enn %1'
,p_is_js_message=>true
,p_version_scn=>2705241
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140999470401751933)
,p_name=>'APEX.IG.X.LESS_THAN_OR_EQUALS.Y'
,p_message_language=>'no'
,p_message_text=>'%0 er mindre enn eller lik %1'
,p_is_js_message=>true
,p_version_scn=>2705241
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140999749278751933)
,p_name=>'APEX.IG.X.LIKE.Y'
,p_message_language=>'no'
,p_message_text=>'%0 ligner %1'
,p_is_js_message=>true
,p_version_scn=>2705241
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141000360391751933)
,p_name=>'APEX.IG.X.MATCHES_REGULAR_EXPRESSION.Y'
,p_message_language=>'no'
,p_message_text=>unistr('%0 samsvarer med det regul\00E6re uttrykket %1')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141006298279751935)
,p_name=>'APEX.IG.X.MINUTES_AGO'
,p_message_language=>'no'
,p_message_text=>'For %0 minutter siden'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141000505098751933)
,p_name=>'APEX.IG.X.NOT_BETWEEN.Y.AND.Z'
,p_message_language=>'no'
,p_message_text=>'%0 er ikke mellom %1 og %2'
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140999035035751933)
,p_name=>'APEX.IG.X.NOT_EQUALS.Y'
,p_message_language=>'no'
,p_message_text=>'%0 er ikke lik %1'
,p_is_js_message=>true
,p_version_scn=>2705241
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141000013996751933)
,p_name=>'APEX.IG.X.NOT_IN.Y'
,p_message_language=>'no'
,p_message_text=>'%0 er ikke i %1'
,p_is_js_message=>true
,p_version_scn=>2705241
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141002343881751934)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.DAYS'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er ikke i l\00F8pet av de siste %1 dagene')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141002105767751933)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.HOURS'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er ikke i l\00F8pet av de siste %1 timene')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141001931319751933)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.MINUTES'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er ikke i l\00F8pet av de siste %1 minuttene')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141002712257751934)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.MONTHS'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er ikke i l\00F8pet av de siste %1 m\00E5nedene')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141002594505751934)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.WEEKS'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er ikke i l\00F8pet av de siste %1 ukene')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141002950826751934)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.YEARS'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er ikke i l\00F8pet av de siste %1 \00E5rene')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141002225773751933)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_DAY'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er ikke i l\00F8pet av den siste dagen')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141002025948751933)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_HOUR'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er ikke i l\00F8pet av den siste timen')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141001889503751933)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_MINUTE'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er ikke i l\00F8pet av det siste minuttet')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141002649371751934)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_MONTH'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er ikke i l\00F8pet av den siste m\00E5neden')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141002475037751934)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_WEEK'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er ikke i l\00F8pet av den siste uken')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141002822792751934)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_YEAR'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er ikke i l\00F8pet av det siste \00E5ret')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141004740669751934)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.DAYS'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er ikke i l\00F8pet av de neste %1 dagene')
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141004539570751934)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.HOURS'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er ikke i l\00F8pet av de neste %1 timene')
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141004394350751934)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.MINUTES'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er ikke i l\00F8pet av de neste %1 minuttene')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141005117632751934)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.MONTHS'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er ikke i l\00F8pet av de neste %1 m\00E5nedene')
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141004996503751934)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.WEEKS'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er ikke i l\00F8pet av de neste %1 ukene')
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141005352318751934)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.YEARS'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er ikke i l\00F8pet av de neste %1 \00E5rene')
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141004606392751934)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_DAY'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er ikke i l\00F8pet av den neste dagen')
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141004412364751934)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_HOUR'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er ikke i l\00F8pet av den neste timen')
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141004274083751934)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_MINUTE'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er ikke i l\00F8pet av det neste minuttet')
,p_is_js_message=>true
,p_version_scn=>2705242
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141005000250751934)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_MONTH'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er ikke i l\00F8pet av den neste m\00E5neden')
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141004863010751934)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_WEEK'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er ikke i l\00F8pet av den neste uken')
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141005285640751934)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_YEAR'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er ikke i l\00F8pet av det neste \00E5ret')
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140999826781751933)
,p_name=>'APEX.IG.X.NOT_LIKE.Y'
,p_message_language=>'no'
,p_message_text=>'%0 ligner ikke %1'
,p_is_js_message=>true
,p_version_scn=>2705241
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141006710779751935)
,p_name=>'APEX.IG.X.STARTS_WITH.Y'
,p_message_language=>'no'
,p_message_text=>'%0 begynner med %1'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141049187958751947)
,p_name=>'APEX.IG.X_COLUMN'
,p_message_language=>'no'
,p_message_text=>'X'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141009488966751936)
,p_name=>'APEX.IG.YEARS'
,p_message_language=>'no'
,p_message_text=>unistr('\00E5r')
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141049233194751947)
,p_name=>'APEX.IG.Y_COLUMN'
,p_message_language=>'no'
,p_message_text=>'Y'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141049303092751947)
,p_name=>'APEX.IG.Z_COLUMN'
,p_message_language=>'no'
,p_message_text=>'Z'
,p_is_js_message=>true
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141058357468751950)
,p_name=>'APEX.IG_FORMAT_SAMPLE_1'
,p_message_language=>'no'
,p_message_text=>'Mandag 12. januar 2016'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141058491481751950)
,p_name=>'APEX.IG_FORMAT_SAMPLE_2'
,p_message_language=>'no'
,p_message_text=>'Januar'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141058546336751950)
,p_name=>'APEX.IG_FORMAT_SAMPLE_3'
,p_message_language=>'no'
,p_message_text=>'16 timer siden'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141058655425751950)
,p_name=>'APEX.IG_FORMAT_SAMPLE_4'
,p_message_language=>'no'
,p_message_text=>'om 16 t'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140876605119751896)
,p_name=>'APEX.ITEM.CROPPER.APPLY'
,p_message_language=>'no'
,p_message_text=>'Bruk'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140868611228751894)
,p_name=>'APEX.ITEM.CROPPER.HELP.TEXT'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Dra bildet, og bruk zoomglidebryteren hvis du vil omplassere det inne i rammen.</p>',
'',
unistr('<p>N\00E5r fokus er p\00E5 bildebeskj\00E6ringsverkt\00F8yet, er f\00F8lgende tastatursnarveier tilgjengelige:</p>'),
'<ul>',
'    <li>Pil venstre: Flytt bilde mot venstre*</li>',
'    <li>Pil opp: Flytt bilde opp*</li>',
unistr('    <li>Pil h\00F8yre: Flytt bilde mot h\00F8yre*</li>'),
'    <li>Pil ned: Flytt bilde ned*</li>',
'    <li>I: Zoom inn</li>',
'    <li>O: Zoom ut</li>',
'    <li>L: Roter mot venstre</li>',
unistr('    <li>R: Roter mot h\00F8yre</li>'),
'</ul>',
'',
'<p class="margin-top-md"><em>*Hold Skift hvis du vil flytte raskere</em></p>'))
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140868896872751894)
,p_name=>'APEX.ITEM.CROPPER.HELP.TITLE'
,p_message_language=>'no'
,p_message_text=>unistr('Hjelp til beskj\00E6ring av bilde')
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140876764065751896)
,p_name=>'APEX.ITEM.CROPPER.RESET'
,p_message_language=>'no'
,p_message_text=>'Tilbakestill'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140869144796751894)
,p_name=>'APEX.ITEM.CROPPER.TITLE'
,p_message_language=>'no'
,p_message_text=>unistr('Beskj\00E6r bilde')
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140876898013751896)
,p_name=>'APEX.ITEM.CROPPER.ZOOM_SLIDER_LABEL'
,p_message_language=>'no'
,p_message_text=>unistr('Flytt glidebryteren hvis du vil justere zoomniv\00E5et')
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140906471610751905)
,p_name=>'APEX.ITEM.FILE.ACCEPTED_TYPES'
,p_message_language=>'no'
,p_message_text=>unistr('Ugyldig filtype. St\00F8ttede filtyper: %0.')
,p_is_js_message=>true
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141040857427751945)
,p_name=>'APEX.ITEM.FILE.BROWSE'
,p_message_language=>'no'
,p_message_text=>'Bla gjennom'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141040524748751945)
,p_name=>'APEX.ITEM.FILE.CHOOSE_FILE'
,p_message_language=>'no'
,p_message_text=>'Velg fil'
,p_is_js_message=>true
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141040646351751945)
,p_name=>'APEX.ITEM.FILE.CHOOSE_FILES'
,p_message_language=>'no'
,p_message_text=>'Velg filer'
,p_is_js_message=>true
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140906204819751905)
,p_name=>'APEX.ITEM.FILE.DROP_FILE'
,p_message_language=>'no'
,p_message_text=>'Dra og slipp'
,p_is_js_message=>true
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140906692749751905)
,p_name=>'APEX.ITEM.FILE.DROP_FILES'
,p_message_language=>'no'
,p_message_text=>'Dra og slipp filer'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140908044813751906)
,p_name=>'APEX.ITEM.FILE.DROP_OR_CHOOSE_FILE'
,p_message_language=>'no'
,p_message_text=>'Velg en fil, eller slipp en fil her.'
,p_is_js_message=>true
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140908152249751906)
,p_name=>'APEX.ITEM.FILE.DROP_OR_CHOOSE_FILES'
,p_message_language=>'no'
,p_message_text=>'Velg eller slipp filer her.'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140908277649751906)
,p_name=>'APEX.ITEM.FILE.DROP_OR_SELECT_FILE'
,p_message_language=>'no'
,p_message_text=>'Velg en fil, eller slipp en fil her.'
,p_is_js_message=>true
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140908334553751906)
,p_name=>'APEX.ITEM.FILE.DROP_OR_SELECT_FILES'
,p_message_language=>'no'
,p_message_text=>'Velg eller slipp filer her.'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140906563408751905)
,p_name=>'APEX.ITEM.FILE.FILES_WITH_COUNT'
,p_message_language=>'no'
,p_message_text=>'%0 filer'
,p_is_js_message=>true
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140906333967751905)
,p_name=>'APEX.ITEM.FILE.MAX_FILE_SIZE'
,p_message_language=>'no'
,p_message_text=>unistr('Filen er for stor. Maksimal filst\00F8rrelse er %0.')
,p_is_js_message=>true
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140886842607751899)
,p_name=>'APEX.ITEM.FILE.MULTIPLE_FILES_NOT_SUPPORTED'
,p_message_language=>'no'
,p_message_text=>unistr('Flere fillastinger st\00F8ttes ikke.')
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140869755357751894)
,p_name=>'APEX.ITEM.FILE.REMOVE'
,p_message_language=>'no'
,p_message_text=>'Fjern'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140875228873751896)
,p_name=>'APEX.ITEM.GEOCODE.ADDRESS_REQUIRED'
,p_message_language=>'no'
,p_message_text=>'Adresse er obligatorisk.'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140874186938751896)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_CITY'
,p_message_language=>'no'
,p_message_text=>'By'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140874516155751896)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_COUNTRY'
,p_message_language=>'no'
,p_message_text=>'Landskode'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140874203385751896)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_HOUSENUMBER'
,p_message_language=>'no'
,p_message_text=>'Husnummer'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140875105295751896)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_LATITUDE'
,p_message_language=>'no'
,p_message_text=>'Breddegrad'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140875095427751896)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_LONGITUDE'
,p_message_language=>'no'
,p_message_text=>'Lengdegrad'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140874971973751896)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_MAPLINK'
,p_message_language=>'no'
,p_message_text=>unistr('Vis p\00E5 kart')
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140874671320751896)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_MATCHSCORE'
,p_message_language=>'no'
,p_message_text=>'Poeng'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140874360384751896)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_POSTALCODE'
,p_message_language=>'no'
,p_message_text=>'Postnummer'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140874446644751896)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_STATE'
,p_message_language=>'no'
,p_message_text=>'Delstat'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140874097832751896)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_STREET'
,p_message_language=>'no'
,p_message_text=>'Gate'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140873946171751895)
,p_name=>'APEX.ITEM.GEOCODE.DIALOG_TITLE'
,p_message_language=>'no'
,p_message_text=>'Resultater av geokoding'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140905466194751905)
,p_name=>'APEX.ITEM.GEOCODE.GEOCODING_DONE'
,p_message_language=>'no'
,p_message_text=>'Geokodet'
,p_is_js_message=>true
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140905594918751905)
,p_name=>'APEX.ITEM.GEOCODE.GEOCODING_OPEN'
,p_message_language=>'no'
,p_message_text=>'Ikke geokodet'
,p_is_js_message=>true
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140874811314751896)
,p_name=>'APEX.ITEM.GEOCODE.MAP_DIALOG_TITLE'
,p_message_language=>'no'
,p_message_text=>'Kart'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140874786243751896)
,p_name=>'APEX.ITEM.GEOCODE.NO_DATA_FOUND'
,p_message_language=>'no'
,p_message_text=>'Finner ingen adresser.'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140875355007751896)
,p_name=>'APEX.ITEM.GEOCODE.REQUIRED'
,p_message_language=>'no'
,p_message_text=>'%0 er obligatorisk.'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140981529795751927)
,p_name=>'APEX.ITEM.GEOCODE.REQUIRED_MULTIPLE'
,p_message_language=>'no'
,p_message_text=>'%0 eller %1 er obligatorisk.'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141071066749751955)
,p_name=>'APEX.ITEM.HELP_TEXT'
,p_message_language=>'no'
,p_message_text=>'Vis hjelpetekst for %0.'
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140877038341751896)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.CHOOSE_FILE'
,p_message_language=>'no'
,p_message_text=>'Velg bilde'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140877110080751896)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.CHOOSE_FILES'
,p_message_language=>'no'
,p_message_text=>'Velg bilder'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140876994411751896)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DOWNLOAD_LINK_TEXT'
,p_message_language=>'no'
,p_message_text=>'Last ned'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140877270986751896)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_FILE'
,p_message_language=>'no'
,p_message_text=>'Dra og slipp'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140877362524751896)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_FILES'
,p_message_language=>'no'
,p_message_text=>'Dra og slipp bilder'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140877419397751897)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_CHOOSE_FILE'
,p_message_language=>'no'
,p_message_text=>'Velg et bilde, eller slipp et bilde her.'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140877568610751897)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_CHOOSE_FILES'
,p_message_language=>'no'
,p_message_text=>'Velg bilder, eller slipp bilder her.'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140877602454751897)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_SELECT_FILE'
,p_message_language=>'no'
,p_message_text=>'Velg et bilde, eller slipp et bilde her.'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140877759282751897)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_SELECT_FILES'
,p_message_language=>'no'
,p_message_text=>'Velg bilder, eller slipp bilder her.'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140962452863751922)
,p_name=>'APEX.ITEM_TYPE.CHECKBOX.CHECKED'
,p_message_language=>'no'
,p_message_text=>'Merket av'
,p_is_js_message=>true
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140962546465751922)
,p_name=>'APEX.ITEM_TYPE.CHECKBOX.UNCHECKED'
,p_message_language=>'no'
,p_message_text=>'Ikke merket av'
,p_is_js_message=>true
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140990009386751930)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.EMPTY_READONLY_COMBOBOX'
,p_message_language=>'no'
,p_message_text=>unistr('Tom, skrivebeskyttet \2013 kombinasjonsboks')
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140987859970751929)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.EMPTY_READONLY_LISTBOX'
,p_message_language=>'no'
,p_message_text=>unistr('Tom, skrivebeskyttet \2013 listeboks')
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140987621841751929)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.READONLY_COMBOBOX'
,p_message_language=>'no'
,p_message_text=>unistr('Skrivebeskyttet \2013 kombinasjonsboks')
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140987735878751929)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.READONLY_LISTBOX'
,p_message_language=>'no'
,p_message_text=>unistr('Skrivebeskyttet \2013 listeboks')
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140903439779751904)
,p_name=>'APEX.ITEM_TYPE.SLIDER.VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'no'
,p_message_text=>unistr('#LABEL# er ikke innenfor det gyldige omr\00E5det fra %0 til %1.')
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140903557689751904)
,p_name=>'APEX.ITEM_TYPE.SLIDER.VALUE_NOT_MULTIPLE_OF_STEP'
,p_message_language=>'no'
,p_message_text=>'#LABEL# er ikke et multiplum av %0.'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140990891740751930)
,p_name=>'APEX.ITEM_TYPE.SWITCH.READONLY_SWITCH'
,p_message_language=>'no'
,p_message_text=>unistr('Skrivebeskyttet \2013 bryter')
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140931470215751913)
,p_name=>'APEX.ITEM_TYPE.TEXT.READONLY_WITH_LINK'
,p_message_language=>'no'
,p_message_text=>unistr('Skrivebeskyttet \2013 rediger med en kobling')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140903096945751904)
,p_name=>'APEX.ITEM_TYPE.YES_NO.INVALID_VALUE'
,p_message_language=>'no'
,p_message_text=>unistr('#LABEL# m\00E5 samsvare med verdiene %0 og %1.')
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140903269104751904)
,p_name=>'APEX.ITEM_TYPE.YES_NO.NO_LABEL'
,p_message_language=>'no'
,p_message_text=>'Nei'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140989534279751930)
,p_name=>'APEX.ITEM_TYPE.YES_NO.OFF_LABEL'
,p_message_language=>'no'
,p_message_text=>'Av'
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140989624085751930)
,p_name=>'APEX.ITEM_TYPE.YES_NO.ON_LABEL'
,p_message_language=>'no'
,p_message_text=>unistr('P\00E5')
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140903143771751904)
,p_name=>'APEX.ITEM_TYPE.YES_NO.YES_LABEL'
,p_message_language=>'no'
,p_message_text=>'Ja'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140911032865751906)
,p_name=>'APEX.LANGUAGE_SELECTOR'
,p_message_language=>'no'
,p_message_text=>unistr('Spr\00E5kvelger')
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140847452453751888)
,p_name=>'APEX.LIST_MANAGER.ADD_ENTRY'
,p_message_language=>'no'
,p_message_text=>unistr('Legg til oppf\00F8ring')
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141024272623751940)
,p_name=>'APEX.LIST_MANAGER.BUTTON_ADD'
,p_message_language=>'no'
,p_message_text=>'Legg til'
,p_version_scn=>2705246
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141024364746751940)
,p_name=>'APEX.LIST_MANAGER.BUTTON_REMOVE'
,p_message_language=>'no'
,p_message_text=>'Fjern'
,p_version_scn=>2705246
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140847558944751888)
,p_name=>'APEX.LIST_MANAGER.SELECTED_ENTRY'
,p_message_language=>'no'
,p_message_text=>unistr('Valgte oppf\00F8ringer')
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141028077300751941)
,p_name=>'APEX.LTO.ADVANCED'
,p_message_language=>'no'
,p_message_text=>'Avansert'
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141028383250751941)
,p_name=>'APEX.LTO.CANCEL'
,p_message_language=>'no'
,p_message_text=>'Avbryt'
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141028134218751941)
,p_name=>'APEX.LTO.COMMON'
,p_message_language=>'no'
,p_message_text=>'Felles'
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141028424533751941)
,p_name=>'APEX.LTO.LIVE_TEMPLATE_OPTIONS'
,p_message_language=>'no'
,p_message_text=>'Valg for direktemaler'
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141029092805751941)
,p_name=>'APEX.LTO.NOT_APPLICABLE'
,p_message_language=>'no'
,p_message_text=>unistr('Malvalg er ikke tilgjengelige fordi denne komponenten ikke er gjengitt p\00E5 siden.')
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141027980973751941)
,p_name=>'APEX.LTO.NO_OPTIONS_FOUND'
,p_message_language=>'no'
,p_message_text=>'Finner ingen malvalg.'
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141028226196751941)
,p_name=>'APEX.LTO.SAVE'
,p_message_language=>'no'
,p_message_text=>'Lagre'
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140882035114751898)
,p_name=>'APEX.MAPS.CLEAR_CIRCLE'
,p_message_language=>'no'
,p_message_text=>'Nullstill sirkel'
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140884449389751899)
,p_name=>'APEX.MAPS.CUSTOM_STYLES_INVALID_JSON'
,p_message_language=>'no'
,p_message_text=>'Egendefinerte stiler har ikke gyldig JSON-format.'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140882316963751898)
,p_name=>'APEX.MAPS.DISTANCE_TOOL'
,p_message_language=>'no'
,p_message_text=>unistr('Avstandsverkt\00F8y')
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140882120110751898)
,p_name=>'APEX.MAPS.DRAW_CIRCLE'
,p_message_language=>'no'
,p_message_text=>'Tegn sirkel'
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140861950244751892)
,p_name=>'APEX.MAPS.FIND_MY_LOCATION'
,p_message_language=>'no'
,p_message_text=>'Gjeldende plassering'
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140868366078751894)
,p_name=>'APEX.MAPS.INIT_POINT_COORDINATES_INVALID'
,p_message_language=>'no'
,p_message_text=>unistr('Koordinatene i f\00F8rste posisjon er ugyldige.')
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140857368160751891)
,p_name=>'APEX.MAPS.INIT_POINT_GEOMETRY_REQUIRED'
,p_message_language=>'no'
,p_message_text=>unistr('F\00F8rste posisjon m\00E5 v\00E6re en punktgeometri.')
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140865929833751893)
,p_name=>'APEX.MAPS.KM'
,p_message_language=>'no'
,p_message_text=>'km'
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140861101082751892)
,p_name=>'APEX.MAPS.LAYER'
,p_message_language=>'no'
,p_message_text=>'Lag'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141031524377751942)
,p_name=>'APEX.MAPS.LAYER_NAME'
,p_message_language=>'no'
,p_message_text=>'Lag: %0'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140880334392751897)
,p_name=>'APEX.MAPS.MAP'
,p_message_language=>'no'
,p_message_text=>'Kart'
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140850085548751888)
,p_name=>'APEX.MAPS.MAP_MESSAGES'
,p_message_language=>'no'
,p_message_text=>'Meldinger'
,p_is_js_message=>true
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140866176070751893)
,p_name=>'APEX.MAPS.MILES'
,p_message_language=>'no'
,p_message_text=>'miles'
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141030576254751942)
,p_name=>'APEX.MAPS.MORE_DATA_FOUND'
,p_message_language=>'no'
,p_message_text=>'Dataene inneholder flere enn %0 rader, noe som overskrider den tillatte maksimumsverdien.'
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140860429156751892)
,p_name=>'APEX.MAPS.ORACLE_MAP_COPYRIGHT'
,p_message_language=>'no'
,p_message_text=>'&copy; 2022 Oracle Corporation &nbsp;&nbsp; <a rel="noopener noreferrer" target="_blank" href="https://elocation.oracle.com/elocation/legal.html">Betingelser</a> &nbsp;&nbsp; Kartdata &copy; 2021 HER'
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140857046824751891)
,p_name=>'APEX.MAPS.ORACLE_SDO_GEOMETRY_NOT_AVAILABLE'
,p_message_language=>'no'
,p_message_text=>'Datatypen SDO_GEOMETRY er ikke tilgjengelig i denne databasen.'
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140860536692751892)
,p_name=>'APEX.MAPS.OSM_MAP_COPYRIGHT'
,p_message_language=>'no'
,p_message_text=>'<a rel="noopener noreferrer" target="_blank" href="http://openmaptiles.org"> &copy; OpenMapTiles </a> &nbsp; <a rel="noopener noreferrer" target="_blank" href="https://www.openstreetmap.org/copyright"> &copy; Bidragsytere til OpenStreetMap </a>'
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140885182262751899)
,p_name=>'APEX.MAPS.OSM_VECTOR_MAP_COPYRIGHT'
,p_message_language=>'no'
,p_message_text=>'<a rel="noopener noreferrer" target="blank" href="https://www.maptiler.com/copyright"> &copy; MapTiler</a> &nbsp; <a rel="noopener noreferrer" target="_blank" href="https://www.openstreetmap.org/copyright"> &copy; Bidragsytere til OpenStreetMap </a>'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140861339643751892)
,p_name=>'APEX.MAPS.POINTS'
,p_message_language=>'no'
,p_message_text=>'Punkt'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141031652297751942)
,p_name=>'APEX.MAPS.POINTS_COUNT'
,p_message_language=>'no'
,p_message_text=>'%0 punkt'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140882233194751898)
,p_name=>'APEX.MAPS.RECTANGLE_ZOOM'
,p_message_language=>'no'
,p_message_text=>'Rektangelzoom'
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140881933044751898)
,p_name=>'APEX.MAPS.REMOVE_MESSAGE'
,p_message_language=>'no'
,p_message_text=>'Fjern'
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140861762903751892)
,p_name=>'APEX.MAPS.RESET_BEARING_TO_NORTH'
,p_message_language=>'no'
,p_message_text=>'Tilbakestill peiling nordover'
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140976514305751926)
,p_name=>'APEX.MAPS.TOGGLE_2D_MODE'
,p_message_language=>'no'
,p_message_text=>'Bytt til 2D-modus'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140976633204751926)
,p_name=>'APEX.MAPS.TOGGLE_3D_MODE'
,p_message_language=>'no'
,p_message_text=>'Bytt til 3D-modus'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140881837784751898)
,p_name=>'APEX.MAPS.TOGGLE_COPYRIGHT'
,p_message_language=>'no'
,p_message_text=>unistr('Vis/skjul opphavsrettserkl\00E6ring')
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140882423760751898)
,p_name=>'APEX.MAPS.TOTAL_DISTANCE'
,p_message_language=>'no'
,p_message_text=>'Total avstand'
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140861406402751892)
,p_name=>'APEX.MAPS.ZOOM_IN'
,p_message_language=>'no'
,p_message_text=>'Zoom inn'
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140861619317751892)
,p_name=>'APEX.MAPS.ZOOM_OUT'
,p_message_language=>'no'
,p_message_text=>'Zoom ut'
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141026141816751941)
,p_name=>'APEX.MARKDOWN.BOLD'
,p_message_language=>'no'
,p_message_text=>'Fet'
,p_is_js_message=>true
,p_version_scn=>2705246
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141027072050751941)
,p_name=>'APEX.MARKDOWN.IMAGE'
,p_message_language=>'no'
,p_message_text=>'Bilde'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141026642636751941)
,p_name=>'APEX.MARKDOWN.INLINE_CODE'
,p_message_language=>'no'
,p_message_text=>'Innebygd kode'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141039336863751944)
,p_name=>'APEX.MARKDOWN.INSERT_IMAGE'
,p_message_language=>'no'
,p_message_text=>'Sett inn bilde'
,p_is_js_message=>true
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141039419598751944)
,p_name=>'APEX.MARKDOWN.INSERT_LINK'
,p_message_language=>'no'
,p_message_text=>'Sett inn kobling'
,p_is_js_message=>true
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141026283048751941)
,p_name=>'APEX.MARKDOWN.ITALIC'
,p_message_language=>'no'
,p_message_text=>'Kursiv'
,p_is_js_message=>true
,p_version_scn=>2705246
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141040070918751945)
,p_name=>'APEX.MARKDOWN.LINK'
,p_message_language=>'no'
,p_message_text=>'Kobling'
,p_is_js_message=>true
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141026947501751941)
,p_name=>'APEX.MARKDOWN.LIST'
,p_message_language=>'no'
,p_message_text=>'Liste'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141026894769751941)
,p_name=>'APEX.MARKDOWN.ORDERED_LIST'
,p_message_language=>'no'
,p_message_text=>'Sortert liste'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141026322621751941)
,p_name=>'APEX.MARKDOWN.PREVIEW'
,p_message_language=>'no'
,p_message_text=>unistr('Forh\00E5ndsvis')
,p_is_js_message=>true
,p_version_scn=>2705246
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141026409534751941)
,p_name=>'APEX.MARKDOWN.PREVIEW_EMPTY'
,p_message_language=>'no'
,p_message_text=>unistr('Ingenting \00E5 forh\00E5ndsvise')
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141026562977751941)
,p_name=>'APEX.MARKDOWN.STRIKETHROUGH'
,p_message_language=>'no'
,p_message_text=>'Gjennomstreking'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141026752016751941)
,p_name=>'APEX.MARKDOWN.UNORDERED_LIST'
,p_message_language=>'no'
,p_message_text=>'Usortert liste'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141005685210751934)
,p_name=>'APEX.MENU.CURRENT_MENU'
,p_message_language=>'no'
,p_message_text=>'gjeldende'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141061834492751951)
,p_name=>'APEX.MENU.OVERFLOW_LABEL'
,p_message_language=>'no'
,p_message_text=>'Mer ...'
,p_is_js_message=>true
,p_version_scn=>2705252
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141005595781751934)
,p_name=>'APEX.MENU.PROCESSING'
,p_message_language=>'no'
,p_message_text=>'Laster'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140919737494751909)
,p_name=>'APEX.MENU.SPLIT_BUTTON'
,p_message_language=>'no'
,p_message_text=>'Knappen Del opp'
,p_is_js_message=>true
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140919644716751909)
,p_name=>'APEX.MENU.SPLIT_MENU'
,p_message_language=>'no'
,p_message_text=>'Menyen Del opp'
,p_is_js_message=>true
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141036619569751944)
,p_name=>'APEX.NOTIFICATION_MESSAGE_HEADING'
,p_message_language=>'no'
,p_message_text=>'Varselmelding'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140860737978751892)
,p_name=>'APEX.NO_DATA_FOUND_ENTITY'
,p_message_language=>'no'
,p_message_text=>'Finner ingen %0'
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141010675047751936)
,p_name=>'APEX.NUMBER_FIELD.VALUE_GREATER_MAX_VALUE'
,p_message_language=>'no'
,p_message_text=>unistr('#LABEL# m\00E5 v\00E6re et tall som er mindre enn eller lik %0.')
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141010738387751936)
,p_name=>'APEX.NUMBER_FIELD.VALUE_INVALID'
,p_message_language=>'no'
,p_message_text=>unistr('#LABEL# m\00E5 v\00E6re et gyldig tall.')
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141010817451751936)
,p_name=>'APEX.NUMBER_FIELD.VALUE_INVALID2'
,p_message_language=>'no'
,p_message_text=>'#LABEL# samsvarer ikke med tallformatet %0 (eksempel: %1).'
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141010591268751936)
,p_name=>'APEX.NUMBER_FIELD.VALUE_LESS_MIN_VALUE'
,p_message_language=>'no'
,p_message_text=>unistr('#LABEL# m\00E5 v\00E6re et tall som er st\00F8rre enn eller lik %0.')
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141010415051751936)
,p_name=>'APEX.NUMBER_FIELD.VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'no'
,p_message_text=>unistr('#LABEL# m\00E5 v\00E6re et tall mellom %0 og %1.')
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141005738732751935)
,p_name=>'APEX.OPENS_IN_NEW_WINDOW_LOWER'
,p_message_language=>'no'
,p_message_text=>unistr('\00E5pnes i et nytt vindu')
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140955538667751920)
,p_name=>'APEX.PAGE.DUPLICATE_SUBMIT'
,p_message_language=>'no'
,p_message_text=>unistr('Denne siden er allerede sendt inn og kan ikke sendes inn p\00E5 nytt.')
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140936941954751914)
,p_name=>'APEX.PAGE.NOT_FOUND'
,p_message_language=>'no'
,p_message_text=>'Finner ikke siden %1 i applikasjonen %0.'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140972464285751925)
,p_name=>'APEX.PAGE_ITEM_IS_REQUIRED'
,p_message_language=>'no'
,p_message_text=>unistr('#LABEL# m\00E5 ha verdi.')
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140863181544751892)
,p_name=>'APEX.PASSWORD.HIDE_PASSWORD'
,p_message_language=>'no'
,p_message_text=>'Skjul passord'
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140863080630751892)
,p_name=>'APEX.PASSWORD.SHOW_PASSWORD'
,p_message_language=>'no'
,p_message_text=>'Vis passord'
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140910668427751906)
,p_name=>'APEX.POPUP.SEARCH'
,p_message_language=>'no'
,p_message_text=>unistr('S\00F8k')
,p_is_js_message=>true
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141024698714751940)
,p_name=>'APEX.POPUP_LOV.BUTTON_CLOSE'
,p_message_language=>'no'
,p_message_text=>'Lukk'
,p_version_scn=>2705246
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141024508674751940)
,p_name=>'APEX.POPUP_LOV.BUTTON_FIND'
,p_message_language=>'no'
,p_message_text=>unistr('S\00F8k etter %0')
,p_version_scn=>2705246
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141024862867751940)
,p_name=>'APEX.POPUP_LOV.BUTTON_NEXT'
,p_message_language=>'no'
,p_message_text=>'Neste'
,p_version_scn=>2705246
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141024751696751940)
,p_name=>'APEX.POPUP_LOV.BUTTON_PREV'
,p_message_language=>'no'
,p_message_text=>'Forrige'
,p_version_scn=>2705246
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140901481491751904)
,p_name=>'APEX.POPUP_LOV.FILTER_REQ'
,p_message_language=>'no'
,p_message_text=>unistr('Angi et s\00F8kebegrep med minst %0 tegn.')
,p_is_js_message=>true
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140977743600751926)
,p_name=>'APEX.POPUP_LOV.ICON_TEXT'
,p_message_language=>'no'
,p_message_text=>'Hurtigliste med verdier: %0'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140901588406751904)
,p_name=>'APEX.POPUP_LOV.INITIAL_FILTER_REQ'
,p_message_language=>'no'
,p_message_text=>unistr('Angi et s\00F8kebegrep.')
,p_is_js_message=>true
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140848591726751888)
,p_name=>'APEX.POPUP_LOV.LIST_OF_VALUES'
,p_message_language=>'no'
,p_message_text=>'Verdiliste'
,p_is_js_message=>true
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140901335537751904)
,p_name=>'APEX.POPUP_LOV.NO_RESULTS'
,p_message_language=>'no'
,p_message_text=>'Finner ingen resultater.'
,p_is_js_message=>true
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140901270812751904)
,p_name=>'APEX.POPUP_LOV.REMOVE_VALUE'
,p_message_language=>'no'
,p_message_text=>'Fjern %0'
,p_is_js_message=>true
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140998462962751932)
,p_name=>'APEX.POPUP_LOV.SEARCH'
,p_message_language=>'no'
,p_message_text=>unistr('S\00F8kebegrep')
,p_version_scn=>2705241
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141024437803751940)
,p_name=>'APEX.POPUP_LOV.TITLE'
,p_message_language=>'no'
,p_message_text=>unistr('S\00F8k')
,p_is_js_message=>true
,p_version_scn=>2705246
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140850600343751889)
,p_name=>'APEX.PRINT.DOCGEN_REQUIRED'
,p_message_language=>'no'
,p_message_text=>'Forutsetter %0.'
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140862900145751892)
,p_name=>'APEX.PRINT_REPORT.ERROR'
,p_message_language=>'no'
,p_message_text=>'Feil ved rapportutskrift.'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140873711040751895)
,p_name=>'APEX.PRINT_UTIL.UNABLE_TO_PRINT'
,p_message_language=>'no'
,p_message_text=>'Kan ikke skrive ut dokumentet med den konfigurerte utskriftstjeneren.'
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140896491802751902)
,p_name=>'APEX.PROCESS.INVOKE_API.PARAMETER_ERROR'
,p_message_language=>'no'
,p_message_text=>'Feil under evaluering av parameteren %0 ved kall av %1. Se feilloggen hvis du vil ha detaljer.'
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141035141641751943)
,p_name=>'APEX.PROCESSING'
,p_message_language=>'no'
,p_message_text=>'Behandler'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140894292247751901)
,p_name=>'APEX.PWA.DIALOG.HIDE.INSTRUCTIONS'
,p_message_language=>'no'
,p_message_text=>'Tilbake'
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140895396074751902)
,p_name=>'APEX.PWA.DIALOG.INTRO'
,p_message_language=>'no'
,p_message_text=>unistr('Dette Web-omr\00E5det har appfunksjonalitet. Installer det p\00E5 enheten, slik at du f\00E5r en best mulig opplevelse.')
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140896680538751902)
,p_name=>'APEX.PWA.DIALOG.SHOW.INSTRUCTIONS'
,p_message_language=>'no'
,p_message_text=>'Neste'
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140898285148751903)
,p_name=>'APEX.PWA.DIALOG.TITLE'
,p_message_language=>'no'
,p_message_text=>'Installer denne appen'
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140883093313751898)
,p_name=>'APEX.PWA.INSTRUCTIONS'
,p_message_language=>'no'
,p_message_text=>unistr('Det ser ut til at enheten eller nettleseren for \00F8yeblikket ikke st\00F8tter installasjon av progressive Web-apper.')
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140878179656751897)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP1'
,p_message_language=>'no'
,p_message_text=>unistr('1. Trykk p\00E5 ikonet <strong>Del</strong>')
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140878293109751897)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP2'
,p_message_language=>'no'
,p_message_text=>unistr('2. Rull ned, og trykk p\00E5 <strong>Legg til p\00E5 Hjem-skjermen</strong>')
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140894616650751902)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP3'
,p_message_language=>'no'
,p_message_text=>unistr('3. Trykk p\00E5 <strong style="color:#007AE1;">Legg til</strong> for \00E5 bekrefte')
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140893797687751901)
,p_name=>'APEX.PWA.OFFLINE.BODY'
,p_message_language=>'no'
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
'    <h1>Kan ikke koble til</h1>',
unistr('    <p>Det ser ut til at det har oppst\00E5tt et nettverksproblem. Kontroller tilkoblingen, og pr\00F8v p\00E5 nytt.</p>'),
unistr('    <button type="button">Pr\00F8v p\00E5 nytt</button>'),
'</main>',
'',
'<script>',
'    document.querySelector("button").addEventListener("click", () => {',
'        window.location.reload();',
'    });',
'</script>'))
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140893690345751901)
,p_name=>'APEX.PWA.OFFLINE.TITLE'
,p_message_language=>'no'
,p_message_text=>'Kan ikke koble til'
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140940296493751915)
,p_name=>'APEX.PWA.PUSH.SUBSCRIPTION_FAILED'
,p_message_language=>'no'
,p_message_text=>'Push-varslinger kan ikke aktiveres for denne enheten.'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140945729339751917)
,p_name=>'APEX.QUICK_PICK.GROUP_LABEL'
,p_message_language=>'no'
,p_message_text=>'Hurtigvalg for %0'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140945603841751917)
,p_name=>'APEX.QUICK_PICK.LINK_ROLE'
,p_message_language=>'no'
,p_message_text=>'Kobling for hurtigvalg'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140919497098751909)
,p_name=>'APEX.RADIO.VISUALLY_HIDDEN_RADIO'
,p_message_language=>'no'
,p_message_text=>unistr('Visuelt skjult \2013 alternativknapp')
,p_is_js_message=>true
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140863562319751892)
,p_name=>'APEX.RECORD_VIEW.TOOLBAR'
,p_message_language=>'no'
,p_message_text=>'Enkeltradvisning'
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141046206830751946)
,p_name=>'APEX.REGION.CSSCALENDAR.ADD'
,p_message_language=>'no'
,p_message_text=>'Legg til'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140991548637751930)
,p_name=>'APEX.REGION.CSSCALENDAR.ALL_DAY'
,p_message_language=>'no'
,p_message_text=>'Hele dagen'
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141069199401751954)
,p_name=>'APEX.REGION.CSSCALENDAR.BUTTON.SENDEMAIL'
,p_message_language=>'no'
,p_message_text=>'Send invitasjon'
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141068939617751954)
,p_name=>'APEX.REGION.CSSCALENDAR.CHOOSE_ACTION'
,p_message_language=>'no'
,p_message_text=>'Valg'
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140993344175751931)
,p_name=>'APEX.REGION.CSSCALENDAR.DAILY_ALLDAY'
,p_message_language=>'no'
,p_message_text=>'Daglig visning for hele dagen '
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140993154135751931)
,p_name=>'APEX.REGION.CSSCALENDAR.DAILY_TIME_SPECIFIC'
,p_message_language=>'no'
,p_message_text=>'Daglig visning for data med tidspunkt '
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141037398299751944)
,p_name=>'APEX.REGION.CSSCALENDAR.DAY'
,p_message_language=>'no'
,p_message_text=>'Dag'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141032344467751942)
,p_name=>'APEX.REGION.CSSCALENDAR.DESCRIPTION'
,p_message_language=>'no'
,p_message_text=>'Beskrivelse'
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140915841584751908)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.CSV'
,p_message_language=>'no'
,p_message_text=>'CSV'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140915623114751908)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.ICALENDAR'
,p_message_language=>'no'
,p_message_text=>'iCal'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140915544858751908)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.PDF'
,p_message_language=>'no'
,p_message_text=>'PDF'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140915788589751908)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.XML'
,p_message_language=>'no'
,p_message_text=>'XML'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140915213087751908)
,p_name=>'APEX.REGION.CSSCALENDAR.ENDDATE'
,p_message_language=>'no'
,p_message_text=>'Sluttdato'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140915410076751908)
,p_name=>'APEX.REGION.CSSCALENDAR.EVENTNAME'
,p_message_language=>'no'
,p_message_text=>'Hendelsesnavn'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141069003971751954)
,p_name=>'APEX.REGION.CSSCALENDAR.INVITATION'
,p_message_language=>'no'
,p_message_text=>'Invitasjon'
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141037498673751944)
,p_name=>'APEX.REGION.CSSCALENDAR.LIST'
,p_message_language=>'no'
,p_message_text=>'Liste'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141037127161751944)
,p_name=>'APEX.REGION.CSSCALENDAR.MONTH'
,p_message_language=>'no'
,p_message_text=>unistr('M\00E5ned')
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141039745299751945)
,p_name=>'APEX.REGION.CSSCALENDAR.NEXT'
,p_message_language=>'no'
,p_message_text=>'Neste'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141053780891751949)
,p_name=>'APEX.REGION.CSSCALENDAR.NOEVENTS'
,p_message_language=>'no'
,p_message_text=>'Ingen hendelser'
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141069319237751954)
,p_name=>'APEX.REGION.CSSCALENDAR.OPTION.FORM'
,p_message_language=>'no'
,p_message_text=>'Rediger en eksisterende hendelse.'
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141069259324751954)
,p_name=>'APEX.REGION.CSSCALENDAR.OPTION.SEND'
,p_message_language=>'no'
,p_message_text=>'Sender en invitasjon via e-post.'
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141039859072751945)
,p_name=>'APEX.REGION.CSSCALENDAR.PREVIOUS'
,p_message_language=>'no'
,p_message_text=>'Forrige'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141047513289751947)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL'
,p_message_language=>'no'
,p_message_text=>'Send e-post'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141047300841751947)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.BUTTON'
,p_message_language=>'no'
,p_message_text=>'Send e-post'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141069972839751954)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.DIALOG.REQUIRED'
,p_message_language=>'no'
,p_message_text=>'Alle felt er obligatoriske.'
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141069881801751954)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.DIALOG.TITLE'
,p_message_language=>'no'
,p_message_text=>'Send invitasjon'
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141068889626751954)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.SUBJECT'
,p_message_language=>'no'
,p_message_text=>'Emne'
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141047440061751947)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.TO'
,p_message_language=>'no'
,p_message_text=>'Til'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140915380882751908)
,p_name=>'APEX.REGION.CSSCALENDAR.STARTDATE'
,p_message_language=>'no'
,p_message_text=>'Startdato'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141045568627751946)
,p_name=>'APEX.REGION.CSSCALENDAR.TABLEFORM'
,p_message_language=>'no'
,p_message_text=>unistr('Skjema p\00E5 %0')
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140992932240751931)
,p_name=>'APEX.REGION.CSSCALENDAR.TIME'
,p_message_language=>'no'
,p_message_text=>'Tidspunkt'
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141039949317751945)
,p_name=>'APEX.REGION.CSSCALENDAR.TODAY'
,p_message_language=>'no'
,p_message_text=>'I dag'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141037929915751944)
,p_name=>'APEX.REGION.CSSCALENDAR.VIEW'
,p_message_language=>'no'
,p_message_text=>'Vis'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141037269184751944)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEK'
,p_message_language=>'no'
,p_message_text=>'Uke'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140993260407751931)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEKLY_ALLDAY'
,p_message_language=>'no'
,p_message_text=>'Ukentlig visning for hele dagen'
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140993061147751931)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEKLY_TIME_SPECIFIC'
,p_message_language=>'no'
,p_message_text=>'Ukentlig visning for data med tidspunkt'
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141037875115751944)
,p_name=>'APEX.REGION.CSSCALENDAR.YEAR'
,p_message_language=>'no'
,p_message_text=>unistr('\00C5r')
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141037512667751944)
,p_name=>'APEX.REGION.JQM_COLUMN_TOGGLE.COLUMNS'
,p_message_language=>'no'
,p_message_text=>'Kolonner ...'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141037603841751944)
,p_name=>'APEX.REGION.JQM_COLUMN_TOGGLE.LOAD_MORE'
,p_message_language=>'no'
,p_message_text=>'Last flere ...'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140967044927751923)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.BACK'
,p_message_language=>'no'
,p_message_text=>'Tilbake'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140908515839751906)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.LOAD_MORE'
,p_message_language=>'no'
,p_message_text=>'Last flere ...'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140910861629751906)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.SEARCH'
,p_message_language=>'no'
,p_message_text=>unistr('S\00F8k ...')
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141037722487751944)
,p_name=>'APEX.REGION.JQM_REFLOW.LOAD_MORE'
,p_message_language=>'no'
,p_message_text=>'Last flere ...'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141039606951751944)
,p_name=>'APEX.REGION.NOT_FOUND'
,p_message_language=>'no'
,p_message_text=>unistr('Finner ikke omr\00E5de-ID-en %0.')
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140910760659751906)
,p_name=>'APEX.REGION.NO_DATA_FOUND_MESSAGE'
,p_message_language=>'no'
,p_message_text=>'Finner ingen data'
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140938275249751915)
,p_name=>'APEX.REGION.PAGINATION.RESET_ERROR'
,p_message_language=>'no'
,p_message_text=>unistr('Kan ikke tilbakestille omr\00E5depagineringen.')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140901946156751904)
,p_name=>'APEX.REGION.PAGINATION.UNHANDLED_ERROR'
,p_message_language=>'no'
,p_message_text=>unistr('Feil ved angivelse av omr\00E5depaginering.')
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141031757296751942)
,p_name=>'APEX.REGION.RESPONSIVE_TABLE.COLUMNS'
,p_message_language=>'no'
,p_message_text=>'Kolonner ...'
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140886220315751899)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.LAZY_LOADING_INCOMPATIBLE'
,p_message_language=>'no'
,p_message_text=>unistr('Avventende lasting kan ikke brukes med flater i %0, som er et enkelt (bestemt) omr\00E5de. Du m\00E5 enten deaktivere avventende lasting for dette omr\00E5det eller flytte flatekomponentene til et annet omr\00E5de.')
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140881503032751898)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.NO_GROUP_TEMPLATE'
,p_message_language=>'no'
,p_message_text=>'Gruppemal mangler i malkomponenten for %0.'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140876551460751896)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.TOO_MANY_ROWS'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er et enkelt (bestemt) omr\00E5de, og har returnert flere rader.')
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141039557357751944)
,p_name=>'APEX.REGION.TYPE_NOT_SUPPORTED'
,p_message_language=>'no'
,p_message_text=>unistr('Omr\00E5detypen %0 st\00F8ttes ikke.')
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140901836035751904)
,p_name=>'APEX.REGION.UNHANDLED_ERROR'
,p_message_language=>'no'
,p_message_text=>unistr('Feil ved gjengivelse av omr\00E5det #COMPONENT_NAME#.')
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140972596483751925)
,p_name=>'APEX.REGION_COLUMN_IS_REQUIRED'
,p_message_language=>'no'
,p_message_text=>unistr('#COLUMN_HEADER# m\00E5 ha verdi.')
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140854177750751890)
,p_name=>'APEX.REPORT_QUERY.LAYOUT_REQUIRED'
,p_message_language=>'no'
,p_message_text=>unistr('Du m\00E5 angi et rapportoppsett.')
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141068438885751954)
,p_name=>'APEX.RICH_TEXT_EDITOR.ACCESSIBLE_LABEL'
,p_message_language=>'no'
,p_message_text=>'%0, redigeringsprogram for rik tekst'
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140974683594751925)
,p_name=>'APEX.RICH_TEXT_EDITOR.MAXIMUM_LENGTH_EXCEEDED'
,p_message_language=>'no'
,p_message_text=>'HTML-koden for rik tekst overskrider elementets maksimumslengde (faktisk %0, tillatt %1 tegn)'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140884000774751898)
,p_name=>'APEX.RTE.READ_ONLY_RICH_TEXT_EDITOR'
,p_message_language=>'no'
,p_message_text=>'Skrivebeskyttet redigeringsprogram for rik tekst'
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140883910233751898)
,p_name=>'APEX.RTE.RICH_TEXT_EDITOR'
,p_message_language=>'no'
,p_message_text=>'Redigeringsprogram for rik tekst'
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140883747696751898)
,p_name=>'APEX.RTE.TOOLBAR_ALIGNMENT'
,p_message_language=>'no'
,p_message_text=>'Justering'
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140883852243751898)
,p_name=>'APEX.RTE.TOOLBAR_EXTRAS'
,p_message_language=>'no'
,p_message_text=>'Ekstra'
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140883516264751898)
,p_name=>'APEX.RTE.TOOLBAR_FONT'
,p_message_language=>'no'
,p_message_text=>'Skrift'
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140883440685751898)
,p_name=>'APEX.RTE.TOOLBAR_FORMATTING'
,p_message_language=>'no'
,p_message_text=>'Formatering'
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140883679280751898)
,p_name=>'APEX.RTE.TOOLBAR_LISTS'
,p_message_language=>'no'
,p_message_text=>'Lister'
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141036788280751944)
,p_name=>'APEX.RV.DELETE'
,p_message_language=>'no'
,p_message_text=>'Slett'
,p_is_js_message=>true
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141029208765751941)
,p_name=>'APEX.RV.DUPLICATE'
,p_message_language=>'no'
,p_message_text=>'Dupliser'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141027585344751941)
,p_name=>'APEX.RV.EXCLUDE_HIDDEN'
,p_message_language=>'no'
,p_message_text=>'Viste kolonner'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141027407888751941)
,p_name=>'APEX.RV.EXCLUDE_NULL'
,p_message_language=>'no'
,p_message_text=>'Utelat nullverdier'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141036897318751944)
,p_name=>'APEX.RV.INSERT'
,p_message_language=>'no'
,p_message_text=>'Legg til'
,p_is_js_message=>true
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140991107032751930)
,p_name=>'APEX.RV.MOVE_DOWN'
,p_message_language=>'no'
,p_message_text=>'Flytt ned'
,p_is_js_message=>true
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140991298881751930)
,p_name=>'APEX.RV.MOVE_UP'
,p_message_language=>'no'
,p_message_text=>'Flytt opp'
,p_is_js_message=>true
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141027266671751941)
,p_name=>'APEX.RV.NEXT_RECORD'
,p_message_language=>'no'
,p_message_text=>'Neste'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141027864466751941)
,p_name=>'APEX.RV.NOT_GROUPED_LABEL'
,p_message_language=>'no'
,p_message_text=>'Andre kolonner'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141027314036751941)
,p_name=>'APEX.RV.PREV_RECORD'
,p_message_language=>'no'
,p_message_text=>'Forrige'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141027689623751941)
,p_name=>'APEX.RV.REC_X'
,p_message_language=>'no'
,p_message_text=>'Rad - %0'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141027731974751941)
,p_name=>'APEX.RV.REC_XY'
,p_message_language=>'no'
,p_message_text=>'Rad %0 av %1'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141029310988751941)
,p_name=>'APEX.RV.REFRESH'
,p_message_language=>'no'
,p_message_text=>'Oppfrisk'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141029413305751942)
,p_name=>'APEX.RV.REVERT'
,p_message_language=>'no'
,p_message_text=>'Tilbakestill endringer'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141027160436751941)
,p_name=>'APEX.RV.SETTINGS_MENU'
,p_message_language=>'no'
,p_message_text=>'Innstillinger'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140986321220751929)
,p_name=>'APEX.SAMPLE_FORMAT'
,p_message_language=>'no'
,p_message_text=>'Eksempel: %0'
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140990635289751930)
,p_name=>'APEX.SAMPLE_FORMAT_SHORT'
,p_message_language=>'no'
,p_message_text=>'Eksempel: %0'
,p_is_js_message=>true
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140903398530751904)
,p_name=>'APEX.SEARCH.1_RESULT_FOUND'
,p_message_language=>'no'
,p_message_text=>'1 resultat'
,p_is_js_message=>true
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140900428002751903)
,p_name=>'APEX.SEARCH.N_RESULTS_FOUND'
,p_message_language=>'no'
,p_message_text=>'%0 resultater'
,p_is_js_message=>true
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140952209329751919)
,p_name=>'APEX.SEARCH.PAGINATION'
,p_message_language=>'no'
,p_message_text=>'Paginering'
,p_is_js_message=>true
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140952390842751919)
,p_name=>'APEX.SEARCH.RESULTS_X_TO_Y'
,p_message_language=>'no'
,p_message_text=>'Resultater, %0 til %1'
,p_is_js_message=>true
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140848020316751888)
,p_name=>'APEX.SESSION.ALERT.CREATE_NEW'
,p_message_language=>'no'
,p_message_text=>unistr('Logg p\00E5 igjen')
,p_is_js_message=>true
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140847971275751888)
,p_name=>'APEX.SESSION.ALERT.EXPIRED'
,p_message_language=>'no'
,p_message_text=>unistr('\00D8kten er avsluttet')
,p_is_js_message=>true
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140848187811751888)
,p_name=>'APEX.SESSION.ALERT.EXTEND'
,p_message_language=>'no'
,p_message_text=>'Forleng'
,p_is_js_message=>true
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140847736510751888)
,p_name=>'APEX.SESSION.ALERT.IDLE_WARN'
,p_message_language=>'no'
,p_message_text=>unistr('\00D8kten blir avsluttet %0. Vil du forlenge den?')
,p_is_js_message=>true
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140847823477751888)
,p_name=>'APEX.SESSION.ALERT.MAX_WARN'
,p_message_language=>'no'
,p_message_text=>unistr('\00D8kten blir avsluttet %0, og den kan ikke forlenges. Lagre arbeidet n\00E5, slik at du unng\00E5r \00E5 miste noen data')
,p_is_js_message=>true
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141047140697751947)
,p_name=>'APEX.SESSION.DB_SESSION_CLEANUP.UNHANDLED_ERROR'
,p_message_language=>'no'
,p_message_text=>unistr('Feil ved behandling av oppryddingskode for database\00F8kt.')
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140936842237751914)
,p_name=>'APEX.SESSION.DB_SESSION_INIT.UNHANDLED_ERROR'
,p_message_language=>'no'
,p_message_text=>unistr('Feil ved behandling av oppsettskode for database\00F8kt.')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140907231169751905)
,p_name=>'APEX.SESSION.EXPIRED'
,p_message_language=>'no'
,p_message_text=>unistr('\00D8kten er avsluttet.')
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141046348493751946)
,p_name=>'APEX.SESSION.EXPIRED.CLOSE_DIALOG'
,p_message_language=>'no'
,p_message_text=>unistr('Lukk denne dialogboksen og trykk p\00E5 knappen for ny lasting i nettleseren for \00E5 hente en ny \00F8kt.')
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141065266786751953)
,p_name=>'APEX.SESSION.EXPIRED.NEW_SESSION'
,p_message_language=>'no'
,p_message_text=>unistr('<a href="%0">Logg p\00E5</a> igjen hvis du vil opprette en ny \00F8kt.')
,p_version_scn=>2705254
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140949593672751918)
,p_name=>'APEX.SESSION.NOT_VALID'
,p_message_language=>'no'
,p_message_text=>unistr('\00D8kten er ikke gyldig')
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140992610656751931)
,p_name=>'APEX.SESSION.RAS.NO_DYNAMIC_ROLES'
,p_message_language=>'no'
,p_message_text=>unistr('Kan ikke aktivere noen dynamiske roller i Real Application Security-\00F8kten for brukeren %0.')
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140934777532751913)
,p_name=>'APEX.SESSION.UNHANDLED_ERROR'
,p_message_language=>'no'
,p_message_text=>unistr('ERR-99900 Kan ikke opprette unik \00F8kt-ID: %0')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140863802464751893)
,p_name=>'APEX.SESSION_STATE.CLOB_NOT_ALLOWED'
,p_message_language=>'no'
,p_message_text=>unistr('Datatypen CLOB for \00F8kttilstand er ikke tillatt for elementet %0.')
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140883299498751898)
,p_name=>'APEX.SESSION_STATE.CLOB_SUBSTITUTION_NOT_ALLOWED'
,p_message_language=>'no'
,p_message_text=>unistr('Erstatning av elementer med datatypen CLOB for \00F8kttilstand st\00F8ttes ikke.')
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140952056034751919)
,p_name=>'APEX.SESSION_STATE.ITEM_VALUE_PROTECTION'
,p_message_language=>'no'
,p_message_text=>unistr('Brudd p\00E5 beskyttelse av \00F8kttilstand: Dette kan skyldes manuell endring av det beskyttede sideelementet %0. Hvis du er usikker p\00E5 hva feilen skyldes, kontakter du applikasjonsadministratoren for \00E5 f\00E5 hjelp.')
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141073242775751955)
,p_name=>'APEX.SESSION_STATE.PAGE_PROTECTION'
,p_message_language=>'no'
,p_message_text=>unistr('Brudd p\00E5 sidebeskyttelse: Dette kan skyldes innsending av en side som ikke var fullstendig lastet, eller manuell endring av beskyttede sideelementer. Hvis du trenger mer hjelp, kontakter du applikasjonsadministratoren.')
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141072382127751955)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.NO_SPECIAL_CHAR'
,p_message_language=>'no'
,p_message_text=>unistr('%0 inneholder ett av f\00F8lgende ugyldige tegn: &<>"/;,*|=% eller --')
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141072452086751955)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.NO_SPECIAL_CHAR_NL'
,p_message_language=>'no'
,p_message_text=>unistr('%0 inneholder ett av f\00F8lgende ugyldige tegn: &<>"/;,*|=% eller -- eller en ny linje.')
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141072122595751955)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.US_ONLY'
,p_message_language=>'no'
,p_message_text=>unistr('%0 inneholder spesialtegn. Bare tegnene a-\00E5, 0-9 og mellomrom er tillatt.')
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141072209038751955)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE'
,p_message_language=>'no'
,p_message_text=>'%0 inneholder <, > eller ", som er ugyldige tegn.'
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140909631475751906)
,p_name=>'APEX.SESSION_STATE.SSP_CHECKSUM_MISSING'
,p_message_language=>'no'
,p_message_text=>unistr('Det ble ikke angitt noen kontrollsum for \00E5 vise behandling for en side som trenger en kontrollsum n\00E5r \00E9n eller flere verdier for foresp\00F8rsler, nullstilt hurtigbuffer eller argument sendes som parametre.')
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140946950376751917)
,p_name=>'APEX.SESSION_STATE.SSP_VIOLATION'
,p_message_language=>'no'
,p_message_text=>unistr('Brudd p\00E5 beskyttelse av \00F8kttilstand: Dette kan skyldes manuell endring av en URL-adresse som inneholder en kontrollsom, eller bruk av en kobling med feil eller manglende kontrollsum. Hvis du er usikker p\00E5 hva feilen skyldes, kontakter du applikasjons')
||unistr('administratoren for \00E5 f\00E5 hjelp.')
,p_version_scn=>2705233
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141028543934751941)
,p_name=>'APEX.SET_HIGH_CONTRAST_MODE_OFF'
,p_message_language=>'no'
,p_message_text=>unistr('Sl\00E5 av modusen H\00F8y kontrast')
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141028679880751941)
,p_name=>'APEX.SET_HIGH_CONTRAST_MODE_ON'
,p_message_language=>'no'
,p_message_text=>unistr('Sl\00E5 p\00E5 modusen H\00F8y kontrast')
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140893077567751901)
,p_name=>'APEX.SET_VALUE_ERROR'
,p_message_language=>'no'
,p_message_text=>unistr('Applikasjonsinnstillingen %0 kan ikke oppdateres fordi abonnementet p\00E5 den er fra en annen applikasjon.')
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140943390685751916)
,p_name=>'APEX.SHUTTLE.CONTROL_BOTTOM'
,p_message_language=>'no'
,p_message_text=>'Nederst'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140943544645751916)
,p_name=>'APEX.SHUTTLE.CONTROL_DOWN'
,p_message_language=>'no'
,p_message_text=>'Ned'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140943610330751916)
,p_name=>'APEX.SHUTTLE.CONTROL_MOVE'
,p_message_language=>'no'
,p_message_text=>'Flytt'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140943742965751916)
,p_name=>'APEX.SHUTTLE.CONTROL_MOVE_ALL'
,p_message_language=>'no'
,p_message_text=>'Flytt alle'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140943812934751916)
,p_name=>'APEX.SHUTTLE.CONTROL_REMOVE'
,p_message_language=>'no'
,p_message_text=>'Fjern'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140943928001751916)
,p_name=>'APEX.SHUTTLE.CONTROL_REMOVE_ALL'
,p_message_language=>'no'
,p_message_text=>'Fjern alle'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140944021284751916)
,p_name=>'APEX.SHUTTLE.CONTROL_RESET'
,p_message_language=>'no'
,p_message_text=>'Tilbakestill'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140943268653751916)
,p_name=>'APEX.SHUTTLE.CONTROL_TOP'
,p_message_language=>'no'
,p_message_text=>unistr('\00D8verst')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140943411947751916)
,p_name=>'APEX.SHUTTLE.CONTROL_UP'
,p_message_language=>'no'
,p_message_text=>'Opp'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141055003964751949)
,p_name=>'APEX.SINCE.SHORT.DAYS_AGO'
,p_message_language=>'no'
,p_message_text=>'%0d'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141055725448751949)
,p_name=>'APEX.SINCE.SHORT.DAYS_FROM_NOW'
,p_message_language=>'no'
,p_message_text=>'i %0d'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141054939745751949)
,p_name=>'APEX.SINCE.SHORT.HOURS_AGO'
,p_message_language=>'no'
,p_message_text=>'%0h'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141055850456751949)
,p_name=>'APEX.SINCE.SHORT.HOURS_FROM_NOW'
,p_message_language=>'no'
,p_message_text=>'i %0h'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141054765465751949)
,p_name=>'APEX.SINCE.SHORT.MINUTES_AGO'
,p_message_language=>'no'
,p_message_text=>'%0m'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141055942976751949)
,p_name=>'APEX.SINCE.SHORT.MINUTES_FROM_NOW'
,p_message_language=>'no'
,p_message_text=>'i %0m'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141055314258751949)
,p_name=>'APEX.SINCE.SHORT.MONTHS_AGO'
,p_message_language=>'no'
,p_message_text=>'%0mo'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141055544566751949)
,p_name=>'APEX.SINCE.SHORT.MONTHS_FROM_NOW'
,p_message_language=>'no'
,p_message_text=>'i %0mo'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141054823702751949)
,p_name=>'APEX.SINCE.SHORT.SECONDS_AGO'
,p_message_language=>'no'
,p_message_text=>'%0s'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141055637312751949)
,p_name=>'APEX.SINCE.SHORT.SECONDS_FROM_NOW'
,p_message_language=>'no'
,p_message_text=>'i %0s'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141055125841751949)
,p_name=>'APEX.SINCE.SHORT.WEEKS_AGO'
,p_message_language=>'no'
,p_message_text=>'%0w'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141056016928751949)
,p_name=>'APEX.SINCE.SHORT.WEEKS_FROM_NOW'
,p_message_language=>'no'
,p_message_text=>'i %0w'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141055237248751949)
,p_name=>'APEX.SINCE.SHORT.YEARS_AGO'
,p_message_language=>'no'
,p_message_text=>'%0y'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141055458991751949)
,p_name=>'APEX.SINCE.SHORT.YEARS_FROM_NOW'
,p_message_language=>'no'
,p_message_text=>'i %0y'
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140856311179751890)
,p_name=>'APEX.SPATIAL.GEOMETRY.LINE'
,p_message_language=>'no'
,p_message_text=>'[Linje]'
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140856921508751891)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTILINE'
,p_message_language=>'no'
,p_message_text=>'[Flere linjer]'
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140856684753751890)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTIPOINT'
,p_message_language=>'no'
,p_message_text=>'[Flere punkt]'
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140857185274751891)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTIPOLYGON'
,p_message_language=>'no'
,p_message_text=>'[Flere polygoner]'
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140857254231751891)
,p_name=>'APEX.SPATIAL.GEOMETRY.OTHER'
,p_message_language=>'no'
,p_message_text=>'[Geometriobjekt]'
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140856208084751890)
,p_name=>'APEX.SPATIAL.GEOMETRY.POINT'
,p_message_language=>'no'
,p_message_text=>'[Punkt (%0,%1)]'
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140856587539751890)
,p_name=>'APEX.SPATIAL.GEOMETRY.POLYGON'
,p_message_language=>'no'
,p_message_text=>'[Polygon]'
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140855720906751890)
,p_name=>'APEX.SPLITTER.COLLAPSED_REGION'
,p_message_language=>'no'
,p_message_text=>unistr('Sammentrukket omr\00E5de: %0')
,p_is_js_message=>true
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140970849020751924)
,p_name=>'APEX.SPLITTER.COLLAPSE_TEXT'
,p_message_language=>'no'
,p_message_text=>'Trekk sammen'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140854774168751890)
,p_name=>'APEX.SPLITTER.HORIZ_CANNOT_LEFT_RIGHT'
,p_message_language=>'no'
,p_message_text=>unistr('En vannrett splitter kan ikke flyttes mot venstre eller h\00F8yre')
,p_is_js_message=>true
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140854904943751890)
,p_name=>'APEX.SPLITTER.MAX_SIZE_REACHED'
,p_message_language=>'no'
,p_message_text=>unistr('Maksimumsst\00F8rrelsen p\00E5 %0 piksler er n\00E5dd')
,p_is_js_message=>true
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140855989537751890)
,p_name=>'APEX.SPLITTER.MIN_SIZE_REACHED'
,p_message_language=>'no'
,p_message_text=>unistr('Minimumsst\00F8rrelsen p\00E5 %0 piksler er n\00E5dd')
,p_is_js_message=>true
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140855811008751890)
,p_name=>'APEX.SPLITTER.REGION_IS_COLLAPSED'
,p_message_language=>'no'
,p_message_text=>unistr('Omr\00E5det er sammentrukket')
,p_is_js_message=>true
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140855661593751890)
,p_name=>'APEX.SPLITTER.REGION_IS_RESTORED'
,p_message_language=>'no'
,p_message_text=>unistr('Omr\00E5det er gjenopprettet')
,p_is_js_message=>true
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140855369766751890)
,p_name=>'APEX.SPLITTER.RESIZED_TO'
,p_message_language=>'no'
,p_message_text=>unistr('Ny st\00F8rrelse er %0 piksler')
,p_is_js_message=>true
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140855558225751890)
,p_name=>'APEX.SPLITTER.RESTORED_REGION'
,p_message_language=>'no'
,p_message_text=>unistr('Gjenopprettet omr\00E5de: %0')
,p_is_js_message=>true
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140970761060751924)
,p_name=>'APEX.SPLITTER.RESTORE_TEXT'
,p_message_language=>'no'
,p_message_text=>'Gjenopprett'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140854820800751890)
,p_name=>'APEX.SPLITTER.VERTICAL_CANNOT_UP_DOWN'
,p_message_language=>'no'
,p_message_text=>'En loddrett splitter kan ikke flyttes opp eller ned'
,p_is_js_message=>true
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141020286783751939)
,p_name=>'APEX.STAR_RATING.CLEAR_RATING'
,p_message_language=>'no'
,p_message_text=>'Fjern vurdering'
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141010164383751936)
,p_name=>'APEX.STAR_RATING.INVALID_RATING_RANGE'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er ikke innenfor det gyldige vurderingsomr\00E5det fra 1 til %1')
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141010217056751936)
,p_name=>'APEX.STAR_RATING.IS_NOT_NUMERIC'
,p_message_language=>'no'
,p_message_text=>'%0 er ikke numerisk'
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141006335975751935)
,p_name=>'APEX.SUCCESS_MESSAGE_HEADING'
,p_message_language=>'no'
,p_message_text=>'Meldingen Vellykket'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141068121286751954)
,p_name=>'APEX.TABS.NEXT'
,p_message_language=>'no'
,p_message_text=>'Neste'
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141068044884751954)
,p_name=>'APEX.TABS.PREVIOUS'
,p_message_language=>'no'
,p_message_text=>'Forrige'
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140978243489751926)
,p_name=>'APEX.TASK.ACTION.DATA_NOT_FOUND'
,p_message_language=>'no'
,p_message_text=>unistr('Finner ikke noe system med \00E9n eller flere poster knyttet til denne oppgaveforekomsten')
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140986505150751929)
,p_name=>'APEX.TASK.ACTION.ERROR'
,p_message_language=>'no'
,p_message_text=>unistr('Utf\00F8relsen av oppgavehandlingen %0 mislyktes \2013 oppgaven er satt til statusen Med feil, kontroller oppgavehandlingskoden')
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140866753590751893)
,p_name=>'APEX.TASK.ADD_COMMENT_NOT_AUTHORIZED'
,p_message_language=>'no'
,p_message_text=>'Legg til kommentar: ikke autorisert'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140866018061751893)
,p_name=>'APEX.TASK.ALREADY_ASSIGNED'
,p_message_language=>'no'
,p_message_text=>'Oppgaven er allerede tilordnet'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140859423876751891)
,p_name=>'APEX.TASK.ASSIGNED_TO_USER'
,p_message_language=>'no'
,p_message_text=>'Tilordnet til %0'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140865716118751893)
,p_name=>'APEX.TASK.CANCEL_TASK_NOT_AUTHORIZED'
,p_message_language=>'no'
,p_message_text=>'Avbryt oppgave: ikke autorisert'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140881395950751898)
,p_name=>'APEX.TASK.CANNOT_REMOVE_OWNER'
,p_message_language=>'no'
,p_message_text=>unistr('Kan ikke fjerne den faktiske eieren av denne oppgaven. Deleger oppgaven til en annen deltaker f\00F8r du pr\00F8ver \00E5 utf\00F8re denne operasjonen p\00E5 nytt.')
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140865377756751893)
,p_name=>'APEX.TASK.CLAIM_TASK_NOT_AUTHORIZED'
,p_message_language=>'no'
,p_message_text=>'Reserver oppgave: ikke autorisert'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140865438126751893)
,p_name=>'APEX.TASK.COMPLETE_TASK_NOT_AUTHORIZED'
,p_message_language=>'no'
,p_message_text=>unistr('Fullf\00F8r oppgave: ikke autorisert')
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140865549268751893)
,p_name=>'APEX.TASK.DELEGATE_TASK_NOT_AUTHORIZED'
,p_message_language=>'no'
,p_message_text=>'Deleger oppgave: ikke autorisert'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140863978024751893)
,p_name=>'APEX.TASK.DUE_DATE_IN_PAST'
,p_message_language=>'no'
,p_message_text=>unistr('Forfallsdato for oppgaven kan ikke v\00E6re i fortiden.')
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140859257849751891)
,p_name=>'APEX.TASK.DUE_SINCE'
,p_message_language=>'no'
,p_message_text=>'Forfaller %0'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140859678637751891)
,p_name=>'APEX.TASK.EVENT.ACTION.ERROR_MESSAGE'
,p_message_language=>'no'
,p_message_text=>unistr('Oppgavehandlingen %1 er ikke utf\00F8rt. Feilmelding \2013 %0')
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140859303978751891)
,p_name=>'APEX.TASK.EVENT.ACTION.FAILURE'
,p_message_language=>'no'
,p_message_text=>'Mislykket'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140858936753751891)
,p_name=>'APEX.TASK.EVENT.ACTION.SUCCESS'
,p_message_language=>'no'
,p_message_text=>unistr('Utf\00F8rt')
,p_is_js_message=>true
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140859107745751891)
,p_name=>'APEX.TASK.EVENT.ACTION.SUCCESS_MESSAGE'
,p_message_language=>'no'
,p_message_text=>unistr('Handlingen %1 er utf\00F8rt med meldingen %0')
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140862488601751892)
,p_name=>'APEX.TASK.EVENT.BEFORE_EXPIRE'
,p_message_language=>'no'
,p_message_text=>unistr('F\00F8r utl\00F8p')
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140888070062751900)
,p_name=>'APEX.TASK.EVENT.CANCEL'
,p_message_language=>'no'
,p_message_text=>'Avbryt'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140887522312751900)
,p_name=>'APEX.TASK.EVENT.CANCEL_MESSAGE'
,p_message_language=>'no'
,p_message_text=>'Oppgaven er avbrutt'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140888130163751900)
,p_name=>'APEX.TASK.EVENT.CANCEL_NOT_ALLOWED'
,p_message_language=>'no'
,p_message_text=>unistr('Deltakeren har ikke tillatelse til \00E5 avbryte oppgaven')
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140887499856751899)
,p_name=>'APEX.TASK.EVENT.CLAIM'
,p_message_language=>'no'
,p_message_text=>'Reserver'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140887837709751900)
,p_name=>'APEX.TASK.EVENT.CLAIM_ALREADY_CLAIMED'
,p_message_language=>'no'
,p_message_text=>unistr('Oppgaven er allerede reservert av en annen bruker, eller deltakeren er ikke berettiget til \00E5 reservere denne oppgaven')
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140887680333751900)
,p_name=>'APEX.TASK.EVENT.CLAIM_MESSAGE'
,p_message_language=>'no'
,p_message_text=>'Oppgaven er reservert av %0'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140988795843751929)
,p_name=>'APEX.TASK.EVENT.COMPLETE'
,p_message_language=>'no'
,p_message_text=>unistr('Fullf\00F8r')
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140887296343751899)
,p_name=>'APEX.TASK.EVENT.COMPLETE_MESSAGE'
,p_message_language=>'no'
,p_message_text=>unistr('Oppgaven er fullf\00F8rt med resultatet %0')
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140888505922751900)
,p_name=>'APEX.TASK.EVENT.COMPLETE_NOT_ALLOWED'
,p_message_language=>'no'
,p_message_text=>unistr('Oppgaven er ikke tilordnet, eller deltakeren har ikke tillatelse til \00E5 fullf\00F8re oppgaven')
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140848978886751888)
,p_name=>'APEX.TASK.EVENT.COMPLETE_NO_OUTCOME'
,p_message_language=>'no'
,p_message_text=>unistr('Oppgaven er fullf\00F8rt uten resultat')
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140988809645751929)
,p_name=>'APEX.TASK.EVENT.CREATE'
,p_message_language=>'no'
,p_message_text=>'Opprett'
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140881732824751898)
,p_name=>'APEX.TASK.EVENT.CREATE_MESSAGE'
,p_message_language=>'no'
,p_message_text=>'Oppgaven er opprettet med ID-en %0'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140988942197751930)
,p_name=>'APEX.TASK.EVENT.DELEGATE'
,p_message_language=>'no'
,p_message_text=>'Deleger'
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140887304041751899)
,p_name=>'APEX.TASK.EVENT.DELEGATE_MESSAGE'
,p_message_language=>'no'
,p_message_text=>'Oppgaven er delegert til den potensielle eieren %0'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140887926827751900)
,p_name=>'APEX.TASK.EVENT.DELEGATE_NOT_ALLOWED'
,p_message_language=>'no'
,p_message_text=>'Deltakeren er ikke berettiget, eller den nye deltakeren er ikke en potensiell eier av denne oppgaven'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140861007983751892)
,p_name=>'APEX.TASK.EVENT.EXPIRE'
,p_message_language=>'no'
,p_message_text=>unistr('Angi som utl\00F8pt')
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140862144194751892)
,p_name=>'APEX.TASK.EVENT.EXPIRED_MESSAGE'
,p_message_language=>'no'
,p_message_text=>unistr('Oppgaven er utl\00F8pt.')
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140989013849751930)
,p_name=>'APEX.TASK.EVENT.FAIL'
,p_message_language=>'no'
,p_message_text=>'Sett til Mislykket'
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140857782353751891)
,p_name=>'APEX.TASK.EVENT.INFO_REQUEST.NOT_ALLOWED'
,p_message_language=>'no'
,p_message_text=>unistr('Oppgaven er ikke tilordnet, eller deltakeren har ikke tillatelse til \00E5 be om opplysninger for oppgaven')
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140857939963751891)
,p_name=>'APEX.TASK.EVENT.INFO_SUBMIT.NOT_ALLOWED'
,p_message_language=>'no'
,p_message_text=>unistr('Det er ikke bedt om opplysninger for oppgaven, eller deltakeren har ikke tillatelse til \00E5 sende opplysninger for oppgaven.')
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140861576890751892)
,p_name=>'APEX.TASK.EVENT.MAXRENEW_EXPIRED_MESSAGE'
,p_message_language=>'no'
,p_message_text=>unistr('Angi oppgave som utl\00F8pt n\00E5r maksimalt antall fornyelser, %0, er n\00E5dd.')
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140888895654751900)
,p_name=>'APEX.TASK.EVENT.NOT_ALLOWED_BUSINESS_ADMIN'
,p_message_language=>'no'
,p_message_text=>'Oppgaven har ikke riktig status, eller deltakeren er ikke virksomhetsadministrator for denne oppgaven'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140888921814751900)
,p_name=>'APEX.TASK.EVENT.NOT_APPLICABLE'
,p_message_language=>'no'
,p_message_text=>'Operasjonen %0 er ukjent eller kan ikke brukes for denne oppgaven'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140989119465751930)
,p_name=>'APEX.TASK.EVENT.RELEASE'
,p_message_language=>'no'
,p_message_text=>'Frigi'
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140974871536751925)
,p_name=>'APEX.TASK.EVENT.RELEASE_MESSAGE'
,p_message_language=>'no'
,p_message_text=>unistr('Oppgaven er frigitt, og kan n\00E5 reserveres av andre')
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140867773082751894)
,p_name=>'APEX.TASK.EVENT.RELEASE_NOT_ALLOWED'
,p_message_language=>'no'
,p_message_text=>unistr('Oppgavefrigivelse er ikke tillatt \2013 brukeren er ikke eier av oppgaven')
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140884700710751899)
,p_name=>'APEX.TASK.EVENT.REMOVE_OWNER'
,p_message_language=>'no'
,p_message_text=>'Fjern eier'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140884934721751899)
,p_name=>'APEX.TASK.EVENT.REMOVE_OWNER_MESSAGE'
,p_message_language=>'no'
,p_message_text=>'Deltakeren %0 er fjernet fra oppgaven'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140862387517751892)
,p_name=>'APEX.TASK.EVENT.RENEW'
,p_message_language=>'no'
,p_message_text=>'Forny'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140861298241751892)
,p_name=>'APEX.TASK.EVENT.RENEW_EXPIRED_MESSAGE'
,p_message_language=>'no'
,p_message_text=>unistr('Oppgaven er fornyet med ID-en %0. Maksimalt antall gjenv\00E6rende fornyelser f\00F8r utl\00F8p er %1.')
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140862263225751892)
,p_name=>'APEX.TASK.EVENT.RENEW_MESSAGE'
,p_message_language=>'no'
,p_message_text=>'Oppgave-ID-en %0 er fornyet med oppgave-ID-en %1'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140858255178751891)
,p_name=>'APEX.TASK.EVENT.REQUEST_INFO'
,p_message_language=>'no'
,p_message_text=>'Be om opplysninger'
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140858118068751891)
,p_name=>'APEX.TASK.EVENT.REQUEST_INFO_MESSAGE'
,p_message_language=>'no'
,p_message_text=>'Bad %0 om flere opplysninger: %1'
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140856089038751890)
,p_name=>'APEX.TASK.EVENT.SET_INITIATOR_CAN_COMPLETE_MESSAGE'
,p_message_language=>'no'
,p_message_text=>unistr('Angitt initiativtaker kan fullf\00F8re \2013 %0')
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140858399749751891)
,p_name=>'APEX.TASK.EVENT.SUBMIT_INFO'
,p_message_language=>'no'
,p_message_text=>'Send opplysninger'
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140858027989751891)
,p_name=>'APEX.TASK.EVENT.SUBMIT_INFO_MESSAGE'
,p_message_language=>'no'
,p_message_text=>unistr('\00D8nskede opplysninger er sendt til %0: %1')
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140989296760751930)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT'
,p_message_language=>'no'
,p_message_text=>'Oppdater kommentar'
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140885757062751899)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT_MESSAGE'
,p_message_language=>'no'
,p_message_text=>'Legg til kommentar: %0'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140888657405751900)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT_NOT_ALLOWED'
,p_message_language=>'no'
,p_message_text=>'Oppgavestatusen tillater ikke kommentarer'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140895930579751902)
,p_name=>'APEX.TASK.EVENT.UPDATE_DUE_DATE_MESSAGE'
,p_message_language=>'no'
,p_message_text=>'Sett forfallsdato for oppgave til %0'
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140854010209751890)
,p_name=>'APEX.TASK.EVENT.UPDATE_DUE_ON'
,p_message_language=>'no'
,p_message_text=>'Oppdater forfallsdato'
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140989337462751930)
,p_name=>'APEX.TASK.EVENT.UPDATE_OWNER'
,p_message_language=>'no'
,p_message_text=>'Oppdater eier'
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140887029985751899)
,p_name=>'APEX.TASK.EVENT.UPDATE_OWNER_MESSAGE'
,p_message_language=>'no'
,p_message_text=>'Legg til den potensielle eieren %0 blant oppgavedeltakerne'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140886144214751899)
,p_name=>'APEX.TASK.EVENT.UPDATE_PARAM'
,p_message_language=>'no'
,p_message_text=>'Oppdater parametre'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140989414947751930)
,p_name=>'APEX.TASK.EVENT.UPDATE_PRIORITY'
,p_message_language=>'no'
,p_message_text=>'Oppdater prioritet'
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140887793418751900)
,p_name=>'APEX.TASK.EVENT.UPDATE_PRIORITY_MESSAGE'
,p_message_language=>'no'
,p_message_text=>'Sett oppgaveprioriteten til %0'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140885052738751899)
,p_name=>'APEX.TASK.EVENT.UPD_PARAMETER_MESSAGE'
,p_message_language=>'no'
,p_message_text=>'Oppdaterte parameteren %0 fra %1 til %2.'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140868503401751894)
,p_name=>'APEX.TASK.EVENT.WF_CANCEL_MESSAGE'
,p_message_language=>'no'
,p_message_text=>'Oppgaven er avbrutt fordi tilsvarende arbeidsflytforekomst ble avsluttet.'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140865684964751893)
,p_name=>'APEX.TASK.FORWARD_TASK_NOT_AUTHORIZED'
,p_message_language=>'no'
,p_message_text=>'Videresend oppgave: ikke autorisert'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140859016549751891)
,p_name=>'APEX.TASK.INITIATED_BY_USER_SINCE'
,p_message_language=>'no'
,p_message_text=>'Startet av %0 %1'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140867947879751894)
,p_name=>'APEX.TASK.INTERNAL_ERROR'
,p_message_language=>'no'
,p_message_text=>'Det oppstod en uventet intern feil'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140866226229751893)
,p_name=>'APEX.TASK.NOT_APPLICABLE'
,p_message_language=>'no'
,p_message_text=>'Oppgaveoperasjonen kan ikke brukes'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140891801277751901)
,p_name=>'APEX.TASK.NO_POTENTIAL_OWNER'
,p_message_language=>'no'
,p_message_text=>'Denne potensielle eieren finnes ikke.'
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140867560233751894)
,p_name=>'APEX.TASK.OUTCOME.APPROVED'
,p_message_language=>'no'
,p_message_text=>'Godkjent'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140867629317751894)
,p_name=>'APEX.TASK.OUTCOME.REJECTED'
,p_message_language=>'no'
,p_message_text=>'Avvist'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140849032904751888)
,p_name=>'APEX.TASK.OUTCOME_MISSING'
,p_message_language=>'no'
,p_message_text=>unistr('Oppgavefullf\00F8ring forutsetter et resultat')
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140849281248751888)
,p_name=>'APEX.TASK.OUTCOME_NOT_ALLOWED'
,p_message_language=>'no'
,p_message_text=>'Oppgaven kan ikke ha et resultat'
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140884895573751899)
,p_name=>'APEX.TASK.PARAM_NOT_UPDATABLE'
,p_message_language=>'no'
,p_message_text=>'Kan ikke oppdatere parameteren %0.'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140881190248751898)
,p_name=>'APEX.TASK.PARTICIPANT_EXISTS'
,p_message_language=>'no'
,p_message_text=>'Deltakeren finnes allerede for denne oppgaveforekomsten.'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140982608698751928)
,p_name=>'APEX.TASK.PRIORITY.1'
,p_message_language=>'no'
,p_message_text=>'Haster'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140859726901751891)
,p_name=>'APEX.TASK.PRIORITY.1.DESCRIPTION'
,p_message_language=>'no'
,p_message_text=>'Haster'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140982594338751928)
,p_name=>'APEX.TASK.PRIORITY.2'
,p_message_language=>'no'
,p_message_text=>unistr('H\00F8y')
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140859885571751891)
,p_name=>'APEX.TASK.PRIORITY.2.DESCRIPTION'
,p_message_language=>'no'
,p_message_text=>unistr('H\00F8y prioritet')
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140982457962751928)
,p_name=>'APEX.TASK.PRIORITY.3'
,p_message_language=>'no'
,p_message_text=>'Middels'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140859964357751891)
,p_name=>'APEX.TASK.PRIORITY.3.DESCRIPTION'
,p_message_language=>'no'
,p_message_text=>'Middels prioritet'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140982325471751928)
,p_name=>'APEX.TASK.PRIORITY.4'
,p_message_language=>'no'
,p_message_text=>'Lav'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140860024143751891)
,p_name=>'APEX.TASK.PRIORITY.4.DESCRIPTION'
,p_message_language=>'no'
,p_message_text=>'Lav prioritet'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140982286855751928)
,p_name=>'APEX.TASK.PRIORITY.5'
,p_message_language=>'no'
,p_message_text=>'Lavest'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140860158690751891)
,p_name=>'APEX.TASK.PRIORITY.5.DESCRIPTION'
,p_message_language=>'no'
,p_message_text=>'Laveste prioritet'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140865857268751893)
,p_name=>'APEX.TASK.SET_PRIORITY_NOT_AUTHORIZED'
,p_message_language=>'no'
,p_message_text=>'Angi oppgaveprioritet: ikke autorisert'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140867028333751893)
,p_name=>'APEX.TASK.STATE.ASSIGNED'
,p_message_language=>'no'
,p_message_text=>'Tilordnet'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140867403961751894)
,p_name=>'APEX.TASK.STATE.CANCELLED'
,p_message_language=>'no'
,p_message_text=>'Avbrutt'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140867138116751893)
,p_name=>'APEX.TASK.STATE.COMPLETED'
,p_message_language=>'no'
,p_message_text=>unistr('Fullf\00F8rt')
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140867396909751894)
,p_name=>'APEX.TASK.STATE.ERRORED'
,p_message_language=>'no'
,p_message_text=>'Med feil'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140860822975751892)
,p_name=>'APEX.TASK.STATE.EXPIRED'
,p_message_language=>'no'
,p_message_text=>unistr('Utl\00F8pt')
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140867271834751894)
,p_name=>'APEX.TASK.STATE.FAILED'
,p_message_language=>'no'
,p_message_text=>'Mislykket'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140857575008751891)
,p_name=>'APEX.TASK.STATE.INFO_REQUESTED'
,p_message_language=>'no'
,p_message_text=>unistr('\00D8nsker opplysninger')
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140866988744751893)
,p_name=>'APEX.TASK.STATE.UNASSIGNED'
,p_message_language=>'no'
,p_message_text=>'Ikke tilordnet'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140889366605751900)
,p_name=>'APEX.TASK.TASK_CREATE_ERROR'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Opprettelsen av en ny oppgave for oppgavedefinisjonen %0 i applikasjonen %1 mislyktes.',
'SQLCODE: %2'))
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140889243781751900)
,p_name=>'APEX.TASK.TASK_CREATE_NO_POTENTIAL_OWNER'
,p_message_language=>'no'
,p_message_text=>unistr('Et fors\00F8k p\00E5 \00E5 opprette en oppgave for oppgavedefinisjonen %0 i applikasjonen %1 mislyktes fordi oppgavedefinisjonen ikke inneholder noen potensielle eiere \2013 rediger oppgavedefinisjonen, og legg til minst \00E9n deltaker av typen "potensiell eier"')
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140866529795751893)
,p_name=>'APEX.TASK.TASK_DEFINITION_NOT_FOUND'
,p_message_language=>'no'
,p_message_text=>'Finner ikke oppgavedefinisjonen'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140866475116751893)
,p_name=>'APEX.TASK.TASK_DEF_PARTICIPANTS_NOT_FOUND'
,p_message_language=>'no'
,p_message_text=>'Finner ikke deltakere for oppgaven'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140867803710751894)
,p_name=>'APEX.TASK.TASK_ID_PK_VIOLATION'
,p_message_language=>'no'
,p_message_text=>unistr('Mer enn \00E9n oppgave for den angitte oppgave-ID-en \2013 kontakt databaseadministratoren')
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140866639197751893)
,p_name=>'APEX.TASK.TASK_NOT_FOUND'
,p_message_language=>'no'
,p_message_text=>'Finner ikke oppgaven'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140866304877751893)
,p_name=>'APEX.TASK.TASK_PARAMETER_NOT_FOUND'
,p_message_language=>'no'
,p_message_text=>'Finner ikke oppgaveparameteren'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140902651664751904)
,p_name=>'APEX.TASK.TYPE.ACTION'
,p_message_language=>'no'
,p_message_text=>'Handling'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140902563606751904)
,p_name=>'APEX.TASK.TYPE.APPROVAL'
,p_message_language=>'no'
,p_message_text=>'Godkjenning'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140849922735751888)
,p_name=>'APEX.TASK.VACATION_RULE_ERROR'
,p_message_language=>'no'
,p_message_text=>unistr('Ferieregelprosedyren %2 ble ikke utf\00F8rt for oppgavedefinisjonen %0 i applikasjonen %1.')
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140850108959751889)
,p_name=>'APEX.TASK.VACATION_RULE_MESSAGE'
,p_message_language=>'no'
,p_message_text=>unistr('Deltakeren %1 er lagt til som stedfortreder for deltakeren %0. \00C5rsak \2013 %2.')
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141053829984751949)
,p_name=>'APEX.TB.TOOLBAR'
,p_message_language=>'no'
,p_message_text=>unistr('Verkt\00F8ylinje')
,p_is_js_message=>true
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140907323241751905)
,p_name=>'APEX.TEMPLATE.APPLICATION'
,p_message_language=>'no'
,p_message_text=>'Applikasjon'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141068581924751954)
,p_name=>'APEX.TEMPLATE.EXPAND_COLLAPSE_NAV_LABEL'
,p_message_language=>'no'
,p_message_text=>'Utvid / trekk sammen navigering'
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141068688611751954)
,p_name=>'APEX.TEMPLATE.EXPAND_COLLAPSE_SIDE_COL_LABEL'
,p_message_language=>'no'
,p_message_text=>'Utvid / trekk sammen sidekolonne'
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140977059389751926)
,p_name=>'APEX.TEMPLATE.MAIN_NAV_LABEL'
,p_message_language=>'no'
,p_message_text=>'Hovednavigering'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140877836324751897)
,p_name=>'APEX.TEMPLATE_DIRECTIVE.INVALID_PLACEHOLDER_NAME'
,p_message_language=>'no'
,p_message_text=>'%0 er et ugyldig plassholdernavn.'
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140984751561751928)
,p_name=>'APEX.TIME.DAY'
,p_message_language=>'no'
,p_message_text=>'1 dag'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140984574033751928)
,p_name=>'APEX.TIME.HOUR'
,p_message_language=>'no'
,p_message_text=>'1 time'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140984869022751928)
,p_name=>'APEX.TIME.N_DAYS'
,p_message_language=>'no'
,p_message_text=>'%0 dager'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140984684205751928)
,p_name=>'APEX.TIME.N_HOURS'
,p_message_language=>'no'
,p_message_text=>'%0 timer'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140984474989751928)
,p_name=>'APEX.TIME.N_MINUTES'
,p_message_language=>'no'
,p_message_text=>'%0 minutter'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140985017683751928)
,p_name=>'APEX.TIME.N_WEEKS'
,p_message_language=>'no'
,p_message_text=>'%0 uker'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140984905924751928)
,p_name=>'APEX.TIME.WEEK'
,p_message_language=>'no'
,p_message_text=>'1 uke'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140882741874751898)
,p_name=>'APEX.TMV.SELECTION_COUNT'
,p_message_language=>'no'
,p_message_text=>'%0 elementer er valgt'
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140882925913751898)
,p_name=>'APEX.TMV.SELECTOR_LABEL'
,p_message_language=>'no'
,p_message_text=>'Velg element'
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140882828275751898)
,p_name=>'APEX.TMV.SELECTOR_LABEL_1'
,p_message_language=>'no'
,p_message_text=>'Velg %0'
,p_is_js_message=>true
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141071613545751955)
,p_name=>'APEX.UI.BACK_TO_TOP'
,p_message_language=>'no'
,p_message_text=>'Begynnelsen av siden'
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140929228117751912)
,p_name=>'APEX.UI.ENABLED'
,p_message_language=>'no'
,p_message_text=>'Aktivert'
,p_is_js_message=>true
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140897702656751903)
,p_name=>'APEX.UNHANDLED_ERROR'
,p_message_language=>'no'
,p_message_text=>unistr('Feil ved behandling av foresp\00F8rselen.')
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140883320331751898)
,p_name=>'APEX.UPDATE_MESSAGE_ERROR'
,p_message_language=>'no'
,p_message_text=>unistr('Tekstmeldingen %0 kan ikke oppdateres fordi abonnementet p\00E5 den er fra en annen applikasjon.')
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140986417074751929)
,p_name=>'APEX.VALUE_REQUIRED'
,p_message_language=>'no'
,p_message_text=>unistr('N\00F8dvendig verdi')
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140902803087751904)
,p_name=>'APEX.VISUALLY_HIDDEN_HEADING'
,p_message_language=>'no'
,p_message_text=>unistr('Overskriftsniv\00E5 %0, skjult')
,p_is_js_message=>true
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141031243942751942)
,p_name=>'APEX.WARN_ON_UNSAVED_CHANGES'
,p_message_language=>'no'
,p_message_text=>'Denne siden har ulagrede endringer.'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140892861119751901)
,p_name=>'APEX.WF.NAVIGATOR'
,p_message_language=>'no'
,p_message_text=>'Navigator'
,p_is_js_message=>true
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140892535881751901)
,p_name=>'APEX.WF.ZOOM_IN'
,p_message_language=>'no'
,p_message_text=>'Zoom inn'
,p_is_js_message=>true
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140893502904751901)
,p_name=>'APEX.WF.ZOOM_LEVEL'
,p_message_language=>'no'
,p_message_text=>unistr('Zoomniv\00E5 \2013 {0} %')
,p_is_js_message=>true
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140892686010751901)
,p_name=>'APEX.WF.ZOOM_OUT'
,p_message_language=>'no'
,p_message_text=>'Zoom ut'
,p_is_js_message=>true
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140892741209751901)
,p_name=>'APEX.WF.ZOOM_RESET'
,p_message_language=>'no'
,p_message_text=>'Tilbakestill zoom'
,p_is_js_message=>true
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140868299781751894)
,p_name=>'APEX.WF_DIAGRAM.ARIA_DESC'
,p_message_language=>'no'
,p_message_text=>unistr('Arbeidsflytdiagrammet er ikke tilgjengelig n\00E5.')
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140868114120751894)
,p_name=>'APEX.WF_DIAGRAM.ARIA_LABEL'
,p_message_language=>'no'
,p_message_text=>'Arbeidsflytdiagram'
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140870049582751894)
,p_name=>'APEX.WORKFLOW.ACTION_NOT_ALLOWED'
,p_message_language=>'no'
,p_message_text=>unistr('Arbeidsflytforekomsten %0 har for \00F8yeblikket statusen %1. Operasjonen er derfor ikke tillatt')
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140872632697751895)
,p_name=>'APEX.WORKFLOW.ACTIVITY.COMPLETED'
,p_message_language=>'no'
,p_message_text=>unistr('Forekomsten %1 for aktiviteten %2 i arbeidsflyten %0 ble fullf\00F8rt')
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140872421073751895)
,p_name=>'APEX.WORKFLOW.ACTIVITY.CREATED'
,p_message_language=>'no'
,p_message_text=>'Opprettet en ny forekomst, %1, av aktiviteten %2 i arbeidsflyten %0'
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140864256464751893)
,p_name=>'APEX.WORKFLOW.ACTIVITY.DATA_NOT_FOUND'
,p_message_language=>'no'
,p_message_text=>'Finner ingen ekstra datarad knyttet til denne arbeidsflytaktivitetsforekomsten'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140872532420751895)
,p_name=>'APEX.WORKFLOW.ACTIVITY.RETRIED'
,p_message_language=>'no'
,p_message_text=>unistr('Den mislykkede forekomsten %1 for aktiviteten %2 i arbeidsflyten %0 ble pr\00F8vd p\00E5 nytt')
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140854596953751890)
,p_name=>'APEX.WORKFLOW.ACTIVITY.TERMINATED'
,p_message_language=>'no'
,p_message_text=>'Aktivitetsforekomsten %1 i arbeidsflyten %0 ble avsluttet'
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140888303301751900)
,p_name=>'APEX.WORKFLOW.ACTIVITY.TIMEOUT'
,p_message_language=>'no'
,p_message_text=>'Aktivitetsforekomsten %1 i arbeidsflyten %0 ble tidsavbrutt og deretter avsluttet.'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140872704144751895)
,p_name=>'APEX.WORKFLOW.ACTIVITY.WAITING'
,p_message_language=>'no'
,p_message_text=>'Forekomsten %1 for aktiviteten %2 i arbeidsflyten %0 har statusen Venter'
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140854333555751890)
,p_name=>'APEX.WORKFLOW.ALTERED_AND_RESUMED'
,p_message_language=>'no'
,p_message_text=>'Arbeidsflytforekomsten %0 ble endret og gjenopptatt ved aktiviteten %1'
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140871778741751895)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.COMPLETED'
,p_message_language=>'no'
,p_message_text=>unistr('Den ventende forekomsten %1 for aktiviteten %2 i arbeidsflyten %0 ble fullf\00F8rt')
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140871582475751895)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.FAULTED'
,p_message_language=>'no'
,p_message_text=>unistr('Den ventende aktiviteten %1 er satt til Mislyktes fordi arbeidsflyten %0 allerede hadde statusen Mislyktes f\00F8r aktiviteten ble fullf\00F8rt')
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140871653489751895)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.TERMINATED'
,p_message_language=>'no'
,p_message_text=>unistr('Den ventende aktiviteten %1 ble avsluttet fordi arbeidsflyten %0 allerede hadde statusen Avsluttet f\00F8r aktiviteten ble fullf\00F8rt')
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140854686127751890)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.TERMINATE_FAILED'
,p_message_language=>'no'
,p_message_text=>unistr('Avslutningen av aktiviteten %1 i arbeidsflyten %0 mislyktes p\00E5 grunn av et unntak \2013 %2')
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140870274227751894)
,p_name=>'APEX.WORKFLOW.BUSY'
,p_message_language=>'no'
,p_message_text=>unistr('Arbeidsflyten er for \00F8yeblikket opptatt med \00E5 fullf\00F8re en foreg\00E5ende operasjon. Pr\00F8v p\00E5 nytt senere')
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140886334197751899)
,p_name=>'APEX.WORKFLOW.COMPLETED_SINCE'
,p_message_language=>'no'
,p_message_text=>unistr('Fullf\00F8rt %0')
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140869327185751894)
,p_name=>'APEX.WORKFLOW.CONTINUE.NOT_ALLOWED'
,p_message_language=>'no'
,p_message_text=>unistr('Arbeidsflyten %0 kan ikke fortsettes fordi den for \00F8yeblikket er i aktiviteten %1, som ikke har statusen Venter')
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140881265342751898)
,p_name=>'APEX.WORKFLOW.CORRELATION_CONTEXT_ERROR'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er ikke en gyldig arbeidsflytkorrelasjonskontekst for prosessen som utf\00F8res med denne arbeidsflytaktiviteten. Korrelasjonskonteksten m\00E5 v\00E6re en kolondelt tekst som inneholder APEX_APPL_WORKFLOW etterfulgt av arbeidsflytforekomst-ID-en og aktivitet')
||'sforekomst-ID-en.'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140871970081751895)
,p_name=>'APEX.WORKFLOW.CREATED'
,p_message_language=>'no'
,p_message_text=>'Opprettet en ny forekomst, %0, av arbeidsflyten %1, versjon %2'
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140864063821751893)
,p_name=>'APEX.WORKFLOW.DATA_NOT_FOUND'
,p_message_language=>'no'
,p_message_text=>'Finner ingen ekstra datarad knyttet til denne arbeidsflytforekomsten'
,p_version_scn=>2705215
);
end;
/
begin
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140886524922751899)
,p_name=>'APEX.WORKFLOW.DUE_SINCE'
,p_message_language=>'no'
,p_message_text=>'Forfaller %0'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140871829459751895)
,p_name=>'APEX.WORKFLOW.END'
,p_message_language=>'no'
,p_message_text=>'Arbeidsflyten %0 ble avsluttet med statusen %1'
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140869032070751894)
,p_name=>'APEX.WORKFLOW.INCOMPATIBLE_DATA_TYPE'
,p_message_language=>'no'
,p_message_text=>'Datatypen %1 for betingelsene som sammenlignes i vekselaktiviteten for arbeidsflyten %0, er ikke kompatibel med betingelsesoperatoren'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140858895867751891)
,p_name=>'APEX.WORKFLOW.INITIATED_BY_USER_SINCE'
,p_message_language=>'no'
,p_message_text=>'Startet av %0 %1'
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140881634671751898)
,p_name=>'APEX.WORKFLOW.INVOKED'
,p_message_language=>'no'
,p_message_text=>'Opprettet en ny forekomst, %0, av arbeidsflyten %1, versjon %2 - startet fra aktivitetsforekomst %4 av arbeidsflytforekomst %3'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140854406241751890)
,p_name=>'APEX.WORKFLOW.NO_ACTIVITY_FOUND'
,p_message_language=>'no'
,p_message_text=>'Aktiviteten med den statiske ID-en %1 er ikke en aktivitet i arbeidsflyten %0. Kontroller de statiske ID-ene for aktivitet for tilsvarende arbeidsflytversjon.'
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140879716877751897)
,p_name=>'APEX.WORKFLOW.REQUIRED_PARAM_MISSING'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er en obligatorisk parameter for denne arbeidsflyten og kan ikke v\00E6re NULL.')
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140872323035751895)
,p_name=>'APEX.WORKFLOW.RESUMED'
,p_message_language=>'no'
,p_message_text=>'Arbeidsflytforekomsten %0 ble gjenopptatt'
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140872255674751895)
,p_name=>'APEX.WORKFLOW.RETRIED'
,p_message_language=>'no'
,p_message_text=>unistr('Arbeidsflytforekomsten %0 ble pr\00F8vd p\00E5 nytt')
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140886604963751899)
,p_name=>'APEX.WORKFLOW.RETRY_COUNT.EQUALS_ONE'
,p_message_language=>'no'
,p_message_text=>unistr('%0 nytt fors\00F8k')
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140886796956751899)
,p_name=>'APEX.WORKFLOW.RETRY_COUNT.NOT_EQUALS_ONE'
,p_message_language=>'no'
,p_message_text=>unistr('%0 nye fors\00F8k')
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140886492911751899)
,p_name=>'APEX.WORKFLOW.STARTED_SINCE'
,p_message_language=>'no'
,p_message_text=>'Startet %0'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140880620108751897)
,p_name=>'APEX.WORKFLOW.STATE.ACTIVE'
,p_message_language=>'no'
,p_message_text=>'Aktiv'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140880806446751898)
,p_name=>'APEX.WORKFLOW.STATE.COMPLETED'
,p_message_language=>'no'
,p_message_text=>unistr('Fullf\00F8rt')
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140880971978751898)
,p_name=>'APEX.WORKFLOW.STATE.FAULTED'
,p_message_language=>'no'
,p_message_text=>'Mislyktes'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140881019061751898)
,p_name=>'APEX.WORKFLOW.STATE.SUSPENDED'
,p_message_language=>'no'
,p_message_text=>'Innstilt'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140880762950751897)
,p_name=>'APEX.WORKFLOW.STATE.TERMINATED'
,p_message_language=>'no'
,p_message_text=>'Avsluttet'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140896084008751902)
,p_name=>'APEX.WORKFLOW.STATE.WAITING'
,p_message_language=>'no'
,p_message_text=>'Venter'
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140872091895751895)
,p_name=>'APEX.WORKFLOW.SUSPENDED'
,p_message_language=>'no'
,p_message_text=>'Arbeidsflytforekomsten %0 ble innstilt'
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140877948799751897)
,p_name=>'APEX.WORKFLOW.SWITCH.BRANCH_NOT_FOUND'
,p_message_language=>'no'
,p_message_text=>unistr('Neste aktivitet for arbeidsflytforekomst %0 kan ikke fastsl\00E5s. Verifiser og korriger de definerte betingelsene for gjeldende vekselaktivitet f\00F8r du pr\00F8ver arbeidsflyten p\00E5 nytt.')
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140872118237751895)
,p_name=>'APEX.WORKFLOW.TERMINATED'
,p_message_language=>'no'
,p_message_text=>'Arbeidsflytforekomsten %0 ble avsluttet'
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140871294397751895)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_RESUME'
,p_message_language=>'no'
,p_message_text=>'Bare virksomhetsadministratoren for arbeidsflyten %0 kan gjenoppta arbeidsflyten'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140871325213751895)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_RETRY'
,p_message_language=>'no'
,p_message_text=>unistr('Arbeidsflyten %0 kan bare pr\00F8ves p\00E5 nytt av en virksomhetsadministrator og/eller en eier')
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140870803745751895)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_SUSPEND'
,p_message_language=>'no'
,p_message_text=>'Arbeidsflytforekomsten %0 kan bare innstilles av en virksomhetsadministrator for arbeidsflyten'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140871191235751895)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_TERMINATE'
,p_message_language=>'no'
,p_message_text=>'Bare eiere og virksomhetsadministratorer for arbeidsflytforekomsten %0 kan avslutte arbeidsflyten'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140869566146751894)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_UPDATE'
,p_message_language=>'no'
,p_message_text=>'Variabler for arbeidsflyten %0 kan bare oppdateres av en virksomhetsadministrator som er definert for arbeidsflyten'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140884120196751898)
,p_name=>'APEX.WORKFLOW.UPDATE,NOT_ALLOWED'
,p_message_language=>'no'
,p_message_text=>unistr('Arbeidsflytforekomst %0 m\00E5 v\00E6re i statusen Mislyktes eller Innstilt f\00F8r variablene kan oppdateres.')
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140875694363751896)
,p_name=>'APEX.WORKFLOW.UPDATED'
,p_message_language=>'no'
,p_message_text=>'Verdien for arbeidsflytvariabelen %0 er oppdatert til %1'
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140885812306751899)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_ACTIVE'
,p_message_language=>'no'
,p_message_text=>'Arbeidsflyten %0 har ingen Aktiv-versjon'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140885919222751899)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_DEV'
,p_message_language=>'no'
,p_message_text=>'Arbeidsflyten %0 har ingen Under utvikling-versjon'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140886081776751899)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_FOUND'
,p_message_language=>'no'
,p_message_text=>'Arbeidsflyten %0 har ingen Aktiv- eller Under utvikling-versjon'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140868967313751894)
,p_name=>'APEX.WORKFLOW.WORKFLOW_ACT_INSTANCE_NOT_FOUND'
,p_message_language=>'no'
,p_message_text=>'Finner ikke aktivitetsforekomsten %1 for arbeidsflytforekomsten %0'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140868772455751894)
,p_name=>'APEX.WORKFLOW.WORKFLOW_INSTANCE_NOT_FOUND'
,p_message_language=>'no'
,p_message_text=>'Finner ikke arbeidsflytforekomsten %0'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140903845254751904)
,p_name=>'APEX.XLSX.ERROR.NO_ACTIVE_WORKSHEET'
,p_message_language=>'no'
,p_message_text=>'Arbeidsboken har ingen aktive regneark.'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140903701466751904)
,p_name=>'APEX.XLSX.ERROR.WORKBOOK_NOT_INITIALIZED'
,p_message_language=>'no'
,p_message_text=>'Arbeidsboken er ikke initialisert.'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140903638790751904)
,p_name=>'APEX.XLSX.INTERNAL_ERROR'
,p_message_language=>'no'
,p_message_text=>'Det oppstod en intern feil ved opprettelse av XLSX-filen.'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140906126932751905)
,p_name=>'APEX.XLSX.SHEET'
,p_message_language=>'no'
,p_message_text=>'Ark'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140916756657751908)
,p_name=>'APEX.XLSX.SHEET_NAME_TAKEN'
,p_message_language=>'no'
,p_message_text=>unistr('Regnearknavnet "%0" er allerede i bruk. Pr\00F8v et annet.')
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141045372880751946)
,p_name=>'APEXIR_ACTIONS'
,p_message_language=>'no'
,p_message_text=>'Handlinger'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140960381303751921)
,p_name=>'APEXIR_ACTIONS_MENU'
,p_message_language=>'no'
,p_message_text=>'Menyen Handlinger'
,p_version_scn=>2705235
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140956021415751920)
,p_name=>'APEXIR_ADD_FUNCTION'
,p_message_language=>'no'
,p_message_text=>'Legg til funksjon'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140955933289751920)
,p_name=>'APEXIR_ADD_GROUP_BY_COLUMN'
,p_message_language=>'no'
,p_message_text=>'Legg til Grupper etter-kolonne'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140993544768751931)
,p_name=>'APEXIR_ADD_PIVOT_COLUMN'
,p_message_language=>'no'
,p_message_text=>'Legg til pivotkolonne'
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140993693834751931)
,p_name=>'APEXIR_ADD_ROW_COLUMN'
,p_message_language=>'no'
,p_message_text=>'Legg til radkolonne'
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140928043372751911)
,p_name=>'APEXIR_AGGREGATE'
,p_message_language=>'no'
,p_message_text=>'Aggreger'
,p_is_js_message=>true
,p_version_scn=>2705229
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140966588355751923)
,p_name=>'APEXIR_AGGREGATION'
,p_message_language=>'no'
,p_message_text=>'Aggregering'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140947491850751917)
,p_name=>'APEXIR_AGG_AVG'
,p_message_language=>'no'
,p_message_text=>'Gjennomsnitt'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140951768154751919)
,p_name=>'APEXIR_AGG_COUNT'
,p_message_language=>'no'
,p_message_text=>'Antall'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140947587661751917)
,p_name=>'APEXIR_AGG_MAX'
,p_message_language=>'no'
,p_message_text=>'Maksimum'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140947779332751917)
,p_name=>'APEXIR_AGG_MEDIAN'
,p_message_language=>'no'
,p_message_text=>'Median'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140947691469751917)
,p_name=>'APEXIR_AGG_MIN'
,p_message_language=>'no'
,p_message_text=>'Minimum'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140947350289751917)
,p_name=>'APEXIR_AGG_SUM'
,p_message_language=>'no'
,p_message_text=>'Sum - %0'
,p_version_scn=>2705233
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140948490826751918)
,p_name=>'APEXIR_ALL'
,p_message_language=>'no'
,p_message_text=>'Alle'
,p_is_js_message=>true
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140927382451751911)
,p_name=>'APEXIR_ALL_COLUMNS'
,p_message_language=>'no'
,p_message_text=>'Alle kolonner'
,p_version_scn=>2705229
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140907425679751905)
,p_name=>'APEXIR_ALL_ROWS'
,p_message_language=>'no'
,p_message_text=>'Alle rader'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141042300415751945)
,p_name=>'APEXIR_ALTERNATIVE'
,p_message_language=>'no'
,p_message_text=>'Alternativ'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141043936131751946)
,p_name=>'APEXIR_ALTERNATIVE_DEFAULT_NAME'
,p_message_language=>'no'
,p_message_text=>'Alternativ standard - %0 '
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140941504129751915)
,p_name=>'APEXIR_AND'
,p_message_language=>'no'
,p_message_text=>'og'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140976328069751926)
,p_name=>'APEXIR_API.IMPORT_CONTENT_CORRUPTED'
,p_message_language=>'no'
,p_message_text=>'Kan ikke importere den lagrede rapporten. Innholdet er skadet.'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140976447957751926)
,p_name=>'APEXIR_API.IMPORT_CONTENT_EMPTY'
,p_message_language=>'no'
,p_message_text=>'Kan ikke importere den lagrede rapporten. Innholdet er tomt.'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140929578602751912)
,p_name=>'APEXIR_APPLY'
,p_message_language=>'no'
,p_message_text=>'Bruk'
,p_is_js_message=>true
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140923125471751910)
,p_name=>'APEXIR_ASCENDING'
,p_message_language=>'no'
,p_message_text=>'Stigende'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140944634817751916)
,p_name=>'APEXIR_AS_OF'
,p_message_language=>'no'
,p_message_text=>'For %0'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141044518235751946)
,p_name=>'APEXIR_AVERAGE_X'
,p_message_language=>'no'
,p_message_text=>'Gjennomsnitt - %0'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141036126263751943)
,p_name=>'APEXIR_BAR'
,p_message_language=>'no'
,p_message_text=>'Stolpe'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140928885119751912)
,p_name=>'APEXIR_BETWEEN'
,p_message_language=>'no'
,p_message_text=>'mellom'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140921985341751910)
,p_name=>'APEXIR_BGCOLOR'
,p_message_language=>'no'
,p_message_text=>'Bakgrunnsfarge'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140923846621751910)
,p_name=>'APEXIR_BLUE'
,p_message_language=>'no'
,p_message_text=>unistr('bl\00E5')
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140957915021751920)
,p_name=>'APEXIR_BOTTOM'
,p_message_language=>'no'
,p_message_text=>'Nederst'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140888773236751900)
,p_name=>'APEXIR_BTNS_NEXT_TO_SEARCH_OF'
,p_message_language=>'no'
,p_message_text=>unistr('Knapper ved siden av s\00F8kelinje for %0')
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140924434233751910)
,p_name=>'APEXIR_CANCEL'
,p_message_language=>'no'
,p_message_text=>'Avbryt'
,p_is_js_message=>true
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140930700950751912)
,p_name=>'APEXIR_CATEGORY'
,p_message_language=>'no'
,p_message_text=>'Kategori'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140921819744751910)
,p_name=>'APEXIR_CELL'
,p_message_language=>'no'
,p_message_text=>'Celle'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140948365790751918)
,p_name=>'APEXIR_CHART'
,p_message_language=>'no'
,p_message_text=>'Diagram'
,p_is_js_message=>true
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140958848075751921)
,p_name=>'APEXIR_CHART_INITIALIZING'
,p_message_language=>'no'
,p_message_text=>'Initialiserer ...'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140998589301751932)
,p_name=>'APEXIR_CHART_LABEL_NOT_NULL'
,p_message_language=>'no'
,p_message_text=>unistr('Diagrametikett m\00E5 angis.')
,p_version_scn=>2705241
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141010920320751936)
,p_name=>'APEXIR_CHART_MAX_DATAPOINT_CNT'
,p_message_language=>'no'
,p_message_text=>unistr('Sp\00F8rringen har overskredet maksimum, som er %0 datapunkt per diagram. Bruk et filter for \00E5 redusere antall poster i basissp\00F8rringen.')
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141009830892751936)
,p_name=>'APEXIR_CHART_MAX_ROW_CNT'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Maksimalt antall rader for en diagramsp\00F8rring begrenser antall rader i basissp\00F8rringen, ikke antall viste rader.  '),
unistr('Basissp\00F8rringen overskrider maksimalt antall rader, som er %0. Bruk et filter for \00E5 redusere antall poster i basissp\00F8rringen.')))
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140927459605751911)
,p_name=>'APEXIR_CHART_TYPE'
,p_message_language=>'no'
,p_message_text=>'Diagramtype'
,p_version_scn=>2705229
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140891330403751901)
,p_name=>'APEXIR_CHART_VIEW_OF'
,p_message_language=>'no'
,p_message_text=>'Diagramvisning for %0'
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141006574105751935)
,p_name=>'APEXIR_CHECK_ALL'
,p_message_language=>'no'
,p_message_text=>'Merk alle'
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140945043540751916)
,p_name=>'APEXIR_CHOOSE_DOWNLOAD_FORMAT'
,p_message_language=>'no'
,p_message_text=>'Velg rapportformat'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140952843714751919)
,p_name=>'APEXIR_CLEAR'
,p_message_language=>'no'
,p_message_text=>'nullstill'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140924384293751910)
,p_name=>'APEXIR_COLUMN'
,p_message_language=>'no'
,p_message_text=>'Kolonne'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140964120696751922)
,p_name=>'APEXIR_COLUMNS'
,p_message_language=>'no'
,p_message_text=>'Kolonner'
,p_is_js_message=>true
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140931330624751912)
,p_name=>'APEXIR_COLUMN_ALIASES'
,p_message_language=>'no'
,p_message_text=>'Kolonnealiaser'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141038929067751944)
,p_name=>'APEXIR_COLUMN_FILTER'
,p_message_language=>'no'
,p_message_text=>'Filtrer ...'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140899167164751903)
,p_name=>'APEXIR_COLUMN_HEADER'
,p_message_language=>'no'
,p_message_text=>'Kolonneoverskrift'
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140913245961751907)
,p_name=>'APEXIR_COLUMN_HEADER_ACTIONS'
,p_message_language=>'no'
,p_message_text=>'Kolonnehandlinger'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140913585305751907)
,p_name=>'APEXIR_COLUMN_HEADER_ACTIONS_FOR'
,p_message_language=>'no'
,p_message_text=>'Handlinger for kolonnen %0'
,p_is_js_message=>true
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140954904260751920)
,p_name=>'APEXIR_COLUMN_HEADING_MENU'
,p_message_language=>'no'
,p_message_text=>'Kolonneoverskriftsmenyen'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140958642077751921)
,p_name=>'APEXIR_COLUMN_INFO'
,p_message_language=>'no'
,p_message_text=>'Kolonneopplysninger'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141041226243751945)
,p_name=>'APEXIR_COLUMN_LABEL'
,p_message_language=>'no'
,p_message_text=>'Kolonneetikett'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140956308360751920)
,p_name=>'APEXIR_COLUMN_N'
,p_message_language=>'no'
,p_message_text=>'Kolonne - %0'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140939252222751915)
,p_name=>'APEXIR_COMPARISON_CONTAINS'
,p_message_language=>'no'
,p_message_text=>'inneholder'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140940559408751915)
,p_name=>'APEXIR_COMPARISON_DOESNOT_CONTAIN'
,p_message_language=>'no'
,p_message_text=>'inneholder ikke'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140922866215751910)
,p_name=>'APEXIR_COMPARISON_IN'
,p_message_language=>'no'
,p_message_text=>'i'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140940762639751915)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_LAST'
,p_message_language=>'no'
,p_message_text=>unistr('er ikke i l\00F8pet av siste')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140949849546751918)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_NEXT'
,p_message_language=>'no'
,p_message_text=>unistr('er ikke i l\00F8pet av neste')
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140940670069751915)
,p_name=>'APEXIR_COMPARISON_IS_IN_LAST'
,p_message_language=>'no'
,p_message_text=>unistr('er i l\00F8pet av siste')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140949758004751918)
,p_name=>'APEXIR_COMPARISON_IS_IN_NEXT'
,p_message_language=>'no'
,p_message_text=>unistr('er i l\00F8pet av neste')
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140922798385751910)
,p_name=>'APEXIR_COMPARISON_IS_NOT_NULL'
,p_message_language=>'no'
,p_message_text=>'er ikke null'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140922681532751910)
,p_name=>'APEXIR_COMPARISON_IS_NULL'
,p_message_language=>'no'
,p_message_text=>'er null'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140922474593751910)
,p_name=>'APEXIR_COMPARISON_LIKE'
,p_message_language=>'no'
,p_message_text=>'ligner'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140922977620751910)
,p_name=>'APEXIR_COMPARISON_NOT_IN'
,p_message_language=>'no'
,p_message_text=>'ikke i'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140922501531751910)
,p_name=>'APEXIR_COMPARISON_NOT_LIKE'
,p_message_language=>'no'
,p_message_text=>'ligner ikke'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140939580782751915)
,p_name=>'APEXIR_COMPARISON_REGEXP_LIKE'
,p_message_language=>'no'
,p_message_text=>unistr('samsvarer med regul\00E6rt uttrykk')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140944974120751916)
,p_name=>'APEXIR_COMPUTATION'
,p_message_language=>'no'
,p_message_text=>'Beregning'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141009531283751936)
,p_name=>'APEXIR_COMPUTATION_EXPRESSION'
,p_message_language=>'no'
,p_message_text=>'Beregningsuttrykk'
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140964438298751922)
,p_name=>'APEXIR_COMPUTATION_FOOTER'
,p_message_language=>'no'
,p_message_text=>'Opprett en beregning ved hjelp av kolonnealiaser.'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140964569000751922)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E1'
,p_message_language=>'no'
,p_message_text=>'(B+C)*100'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140964607671751922)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E2'
,p_message_language=>'no'
,p_message_text=>'INITCAP(B)||'', ''||INITCAP(C)'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140964789324751922)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E3'
,p_message_language=>'no'
,p_message_text=>'CASE WHEN A = 10 THEN B + C ELSE B END'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140905641053751905)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E4'
,p_message_language=>'no'
,p_message_text=>'ROUND(C / 1000000)'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140949106404751918)
,p_name=>'APEXIR_COMPUTE'
,p_message_language=>'no'
,p_message_text=>'Beregn'
,p_is_js_message=>true
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140956999382751920)
,p_name=>'APEXIR_CONTROL_BREAK'
,p_message_language=>'no'
,p_message_text=>'Kontrollskift'
,p_is_js_message=>true
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140959997715751921)
,p_name=>'APEXIR_CONTROL_BREAKS'
,p_message_language=>'no'
,p_message_text=>'Kontrollskift'
,p_version_scn=>2705235
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141046545840751947)
,p_name=>'APEXIR_CONTROL_BREAK_COLUMNS'
,p_message_language=>'no'
,p_message_text=>'Kontrollskiftkolonner'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140902324170751904)
,p_name=>'APEXIR_COUNT_DISTINCT'
,p_message_language=>'no'
,p_message_text=>'Antall unike'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141045039676751946)
,p_name=>'APEXIR_COUNT_DISTINCT_X'
,p_message_language=>'no'
,p_message_text=>'Antall unike'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141044926310751946)
,p_name=>'APEXIR_COUNT_X'
,p_message_language=>'no'
,p_message_text=>'Antall - %0'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141017938172751938)
,p_name=>'APEXIR_DAILY'
,p_message_language=>'no'
,p_message_text=>'Daglig'
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141071270979751955)
,p_name=>'APEXIR_DATA'
,p_message_language=>'no'
,p_message_text=>'Data'
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140958768246751921)
,p_name=>'APEXIR_DATA_AS_OF'
,p_message_language=>'no'
,p_message_text=>'Rapportdata for %0 minutter siden.'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140891729896751901)
,p_name=>'APEXIR_DATA_VIEW_OF'
,p_message_language=>'no'
,p_message_text=>'Datavisning for %0'
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140928113432751912)
,p_name=>'APEXIR_DATE'
,p_message_language=>'no'
,p_message_text=>'Dato'
,p_version_scn=>2705229
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140962605570751922)
,p_name=>'APEXIR_DEFAULT'
,p_message_language=>'no'
,p_message_text=>'Standard'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141042166899751945)
,p_name=>'APEXIR_DEFAULT_REPORT_TYPE'
,p_message_language=>'no'
,p_message_text=>'Standard rapporttype'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140924523614751910)
,p_name=>'APEXIR_DELETE'
,p_message_language=>'no'
,p_message_text=>'Slett'
,p_is_js_message=>true
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140928432224751912)
,p_name=>'APEXIR_DELETE_CONFIRM'
,p_message_language=>'no'
,p_message_text=>'Vil du slette disse rapportinnstillingene?'
,p_version_scn=>2705230
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141028929740751941)
,p_name=>'APEXIR_DELETE_DEFAULT_REPORT'
,p_message_language=>'no'
,p_message_text=>'Slett standardrapport'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140956657796751920)
,p_name=>'APEXIR_DELETE_REPORT'
,p_message_language=>'no'
,p_message_text=>'Slett rapport'
,p_is_js_message=>true
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140923240494751910)
,p_name=>'APEXIR_DESCENDING'
,p_message_language=>'no'
,p_message_text=>'Synkende'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140930809889751912)
,p_name=>'APEXIR_DESCRIPTION'
,p_message_language=>'no'
,p_message_text=>'Beskrivelse'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140954800372751919)
,p_name=>'APEXIR_DETAIL_VIEW'
,p_message_language=>'no'
,p_message_text=>'Enkeltradvisning'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140963104665751922)
,p_name=>'APEXIR_DIRECTION'
,p_message_language=>'no'
,p_message_text=>'Retning - %0'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140964055106751922)
,p_name=>'APEXIR_DISABLED'
,p_message_language=>'no'
,p_message_text=>'Deaktivert'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140924066817751910)
,p_name=>'APEXIR_DISPLAYED'
,p_message_language=>'no'
,p_message_text=>'Vist'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140927293888751911)
,p_name=>'APEXIR_DISPLAYED_COLUMNS'
,p_message_language=>'no'
,p_message_text=>'Viste kolonner'
,p_version_scn=>2705229
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140963011515751922)
,p_name=>'APEXIR_DISPLAY_IN_REPORT'
,p_message_language=>'no'
,p_message_text=>'Vis i rapport'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140957834526751920)
,p_name=>'APEXIR_DOWN'
,p_message_language=>'no'
,p_message_text=>'Ned'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140949219063751918)
,p_name=>'APEXIR_DOWNLOAD'
,p_message_language=>'no'
,p_message_text=>'Last ned'
,p_is_js_message=>true
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140962903498751922)
,p_name=>'APEXIR_DO_NOT_DISPLAY'
,p_message_language=>'no'
,p_message_text=>'Ikke vis'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141032282367751942)
,p_name=>'APEXIR_DUPLICATE_HIGHLIGHT_COND'
,p_message_language=>'no'
,p_message_text=>'Utheving med samme betingelse finnes allerede.'
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141046709616751947)
,p_name=>'APEXIR_DUPLICATE_PIVOT_COLUMN'
,p_message_language=>'no'
,p_message_text=>unistr('Duplisert pivotkolonne. Listen over pivotkolonner m\00E5 v\00E6re unik.')
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141046943628751947)
,p_name=>'APEXIR_EDIT'
,p_message_language=>'no'
,p_message_text=>'Rediger'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140958944011751921)
,p_name=>'APEXIR_EDIT_CHART'
,p_message_language=>'no'
,p_message_text=>'Rediger diagraminnstillinger'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140965524176751923)
,p_name=>'APEXIR_EDIT_CHART2'
,p_message_language=>'no'
,p_message_text=>'Rediger diagram'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140929418306751912)
,p_name=>'APEXIR_EDIT_CONTROL_BREAK'
,p_message_language=>'no'
,p_message_text=>'Rediger kontrollskift'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140965965696751923)
,p_name=>'APEXIR_EDIT_FILTER'
,p_message_language=>'no'
,p_message_text=>'Rediger filter'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140932405974751913)
,p_name=>'APEXIR_EDIT_FLASHBACK'
,p_message_language=>'no'
,p_message_text=>'Rediger flashback'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141023707377751940)
,p_name=>'APEXIR_EDIT_GROUP_BY'
,p_message_language=>'no'
,p_message_text=>'Rediger Grupper etter'
,p_version_scn=>2705246
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140965856056751923)
,p_name=>'APEXIR_EDIT_HIGHLIGHT'
,p_message_language=>'no'
,p_message_text=>'Rediger utheving'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140993815595751931)
,p_name=>'APEXIR_EDIT_PIVOT'
,p_message_language=>'no'
,p_message_text=>'Rediger pivotering'
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140953213800751919)
,p_name=>'APEXIR_EDIT_REPORT'
,p_message_language=>'no'
,p_message_text=>'Rediger rapport'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141042465183751945)
,p_name=>'APEXIR_EMAIL'
,p_message_language=>'no'
,p_message_text=>'E-post'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140914692772751908)
,p_name=>'APEXIR_EMAIL_ADDRESS'
,p_message_language=>'no'
,p_message_text=>'E-postadresse'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141042779755751945)
,p_name=>'APEXIR_EMAIL_BCC'
,p_message_language=>'no'
,p_message_text=>'Blindkopi'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141042929150751945)
,p_name=>'APEXIR_EMAIL_BODY'
,p_message_language=>'no'
,p_message_text=>'Tekst'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141042693331751945)
,p_name=>'APEXIR_EMAIL_CC'
,p_message_language=>'no'
,p_message_text=>'Kopi'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141043482595751946)
,p_name=>'APEXIR_EMAIL_FREQUENCY'
,p_message_language=>'no'
,p_message_text=>'Hyppighet'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140919845225751909)
,p_name=>'APEXIR_EMAIL_NOT_CONFIGURED'
,p_message_language=>'no'
,p_message_text=>'E-post er ikke konfigurert for denne applikasjonen. Ta kontakt med administratoren.'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141017228235751938)
,p_name=>'APEXIR_EMAIL_REQUIRED'
,p_message_language=>'no'
,p_message_text=>unistr('E-postadresse m\00E5 angis.')
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141043057581751945)
,p_name=>'APEXIR_EMAIL_SEE_ATTACHED'
,p_message_language=>'no'
,p_message_text=>'Se vedlegg'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141042804106751945)
,p_name=>'APEXIR_EMAIL_SUBJECT'
,p_message_language=>'no'
,p_message_text=>'Emne'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141018260909751938)
,p_name=>'APEXIR_EMAIL_SUBJECT_REQUIRED'
,p_message_language=>'no'
,p_message_text=>unistr('E-postemne m\00E5 angis.')
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141042550238751945)
,p_name=>'APEXIR_EMAIL_TO'
,p_message_language=>'no'
,p_message_text=>'Til'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140921699341751910)
,p_name=>'APEXIR_ENABLED'
,p_message_language=>'no'
,p_message_text=>'Aktivert'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140965716493751923)
,p_name=>'APEXIR_ENABLE_DISABLE_ALT'
,p_message_language=>'no'
,p_message_text=>'Aktiver/deaktiver'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140965210419751923)
,p_name=>'APEXIR_ERROR_LANDMARK'
,p_message_language=>'no'
,p_message_text=>'Feil! %0'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140964821307751922)
,p_name=>'APEXIR_EXAMPLES'
,p_message_language=>'no'
,p_message_text=>'Eksempler'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140965665170751923)
,p_name=>'APEXIR_EXAMPLES_WITH_COLON'
,p_message_language=>'no'
,p_message_text=>'Eksempler:'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140927107255751911)
,p_name=>'APEXIR_EXCLUDE_NULL'
,p_message_language=>'no'
,p_message_text=>'Utelat nullverdier'
,p_version_scn=>2705229
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140966245103751923)
,p_name=>'APEXIR_EXPAND_COLLAPSE_ALT'
,p_message_language=>'no'
,p_message_text=>'Utvid / trekk sammen'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140963811190751922)
,p_name=>'APEXIR_EXPRESSION'
,p_message_language=>'no'
,p_message_text=>'Uttrykk'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140948735934751918)
,p_name=>'APEXIR_FILTER'
,p_message_language=>'no'
,p_message_text=>'Filtrer'
,p_is_js_message=>true
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140959877282751921)
,p_name=>'APEXIR_FILTERS'
,p_message_language=>'no'
,p_message_text=>'Filtre'
,p_version_scn=>2705235
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140970561827751924)
,p_name=>'APEXIR_FILTER_EXPRESSION'
,p_message_language=>'no'
,p_message_text=>'Filteruttrykk'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141068763237751954)
,p_name=>'APEXIR_FILTER_EXPR_TOO_LONG'
,p_message_language=>'no'
,p_message_text=>'Filteruttrykket er for langt.'
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140913484920751907)
,p_name=>'APEXIR_FILTER_SUGGESTIONS'
,p_message_language=>'no'
,p_message_text=>'Filterforslag'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140970466020751924)
,p_name=>'APEXIR_FILTER_TYPE'
,p_message_language=>'no'
,p_message_text=>'Filtertype'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140966448499751923)
,p_name=>'APEXIR_FINDER_ALT'
,p_message_language=>'no'
,p_message_text=>unistr('Velg kolonner for s\00F8k')
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140949050278751918)
,p_name=>'APEXIR_FLASHBACK'
,p_message_language=>'no'
,p_message_text=>'Flashback'
,p_is_js_message=>true
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140963637450751922)
,p_name=>'APEXIR_FLASHBACK_DESCRIPTION'
,p_message_language=>'no'
,p_message_text=>unistr('Med en flashback-sp\00F8rring kan du vise dataene som fantes p\00E5 et tidligere tidspunkt.')
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141017604785751938)
,p_name=>'APEXIR_FLASHBACK_LABEL'
,p_message_language=>'no'
,p_message_text=>'Varighet for flashback'
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141019041895751938)
,p_name=>'APEXIR_FORMAT'
,p_message_language=>'no'
,p_message_text=>'Formater'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140944867773751916)
,p_name=>'APEXIR_FORMAT_MASK'
,p_message_language=>'no'
,p_message_text=>'Formatmaske - %0'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140956545080751920)
,p_name=>'APEXIR_FUNCTION'
,p_message_language=>'no'
,p_message_text=>'Funksjon'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140964345193751922)
,p_name=>'APEXIR_FUNCTIONS'
,p_message_language=>'no'
,p_message_text=>'Funksjoner - %0'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141042092852751945)
,p_name=>'APEXIR_FUNCTIONS_OPERATORS'
,p_message_language=>'no'
,p_message_text=>'Funksjoner/operatorer'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140956220605751920)
,p_name=>'APEXIR_FUNCTION_N'
,p_message_language=>'no'
,p_message_text=>'Funksjon - %0'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140948540762751918)
,p_name=>'APEXIR_GO'
,p_message_language=>'no'
,p_message_text=>unistr('S\00F8k')
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140922136390751910)
,p_name=>'APEXIR_GREEN'
,p_message_language=>'no'
,p_message_text=>unistr('gr\00F8nn')
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140967113327751923)
,p_name=>'APEXIR_GROUPBY_COLUMNS'
,p_message_language=>'no'
,p_message_text=>'Grupper etter kolonner'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140967297335751923)
,p_name=>'APEXIR_GROUPBY_FUNCTIONS'
,p_message_language=>'no'
,p_message_text=>'Grupper etter funksjoner'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140902412324751904)
,p_name=>'APEXIR_GROUP_BY'
,p_message_language=>'no'
,p_message_text=>'Grupper etter'
,p_is_js_message=>true
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141043162301751946)
,p_name=>'APEXIR_GROUP_BY_COLUMN'
,p_message_language=>'no'
,p_message_text=>'Grupper etter-kolonne - %0'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140998667486751932)
,p_name=>'APEXIR_GROUP_BY_COL_NOT_NULL'
,p_message_language=>'no'
,p_message_text=>unistr('Grupper etter-kolonne m\00E5 angis.')
,p_version_scn=>2705241
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141009717558751936)
,p_name=>'APEXIR_GROUP_BY_MAX_ROW_CNT'
,p_message_language=>'no'
,p_message_text=>unistr('Maksimalt antall rader for en Grupper etter-sp\00F8rring begrenser antall rader i basissp\00F8rringen, ikke antall viste rader. Basissp\00F8rringen overskrider maksimalt antall rader, som er %0. Bruk et filter for \00E5 redusere antall poster i basissp\00F8rringen.')
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140989981255751930)
,p_name=>'APEXIR_GROUP_BY_SORT'
,p_message_language=>'no'
,p_message_text=>'Grupper etter-sortering'
,p_is_js_message=>true
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141046601831751947)
,p_name=>'APEXIR_GROUP_BY_SORT_ORDER'
,p_message_language=>'no'
,p_message_text=>unistr('Sorteringsrekkef\00F8lge for Grupper etter')
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140891562661751901)
,p_name=>'APEXIR_GROUP_BY_VIEW_OF'
,p_message_language=>'no'
,p_message_text=>'Grupper etter-visning for %0'
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140927589425751911)
,p_name=>'APEXIR_HCOLUMN'
,p_message_language=>'no'
,p_message_text=>'Vannrett kolonne'
,p_version_scn=>2705229
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140961568384751921)
,p_name=>'APEXIR_HELP'
,p_message_language=>'no'
,p_message_text=>'Hjelp'
,p_is_js_message=>true
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140953359260751919)
,p_name=>'APEXIR_HELP_01'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Ved hjelp av interaktive rapporter kan sluttbrukere tilpasse rapporter. Brukerne kan endre oppsettet for rapportdata ved \00E5 velge kolonner, bruke filtre, utheve og sortere. Brukerne kan ogs\00E5 definere skift, aggregeringer, diagrammer og grupperinger og')
||unistr(' legge til egne beregninger. De kan ogs\00E5 sette opp et abonnement, slik at en HTML-versjon av rapporten blir sendt med e-post til dem med bestemte intervaller. Brukerne kan opprette flere varianter av en rapport og lagre dem som navngitte rapporter, f')
||'or enten offentlig eller privat visning. ',
'<p/>',
unistr('De f\00F8lgende avsnittene oppsummerer hvordan du kan tilpasse en interaktiv rapport. Hvis du vil l\00E6re mer, kan du se delen om bruk av interaktive rapporter i <i>Oracle APEX End User''s Guide</i>.')))
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140960496342751921)
,p_name=>'APEXIR_HELP_ACTIONS_MENU'
,p_message_language=>'no'
,p_message_text=>unistr('Menyen Handlinger vises til h\00F8yre for knappen S\00F8k p\00E5 s\00F8kelinjen. Bruk denne menyen til \00E5 tilpasse en interaktiv rapport.')
,p_version_scn=>2705235
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140954124009751919)
,p_name=>'APEXIR_HELP_AGGREGATE'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Aggregeringer er matematiske beregninger som er utf\00F8rt mot en kolonne. Aggregeringer vises etter hvert kontrollskift og p\00E5 slutten av rapporten i kolonnen der de er definert. Valgene omfatter f\00F8lgende:'),
'<p>',
'</p><ul>',
'<li>Med <strong>Aggregering</strong> kan du velge en tidligere',
'definert aggregering du vil redigere.</li>',
unistr('<li><strong>Funksjon</strong> er funksjonen som skal utf\00F8res (for eksempel SUM, MIN).</li>'),
unistr('<li><strong>Kolonne</strong> brukes til \00E5 velge kolonnen den matematiske funksjonen skal brukes p\00E5. Bare numeriske'),
'kolonner vises.</li>',
'</ul>'))
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140954255698751919)
,p_name=>'APEXIR_HELP_CHART'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Du kan definere ett diagram per lagret rapport. N\00E5r dette er'),
unistr('definert, kan du veksle mellom diagram- og rapportvisning ved hjelp av visningsikonene p\00E5 s\00F8kelinjen.'),
unistr('Valgene omfatter f\00F8lgende:  '),
'<p>',
'</p><ul>',
'<li><strong>Diagramtype</strong> identifiserer diagramtypen som skal inkluderes.',
'Velg mellom vannrett stolpe, loddrett stolpe, sektor eller linje.</li>',
'<li>Med <strong>Etikett</strong> kan du velge kolonnen som skal brukes som etikett.</li>',
unistr('<li><strong>Aksetittel for etikett</strong> er tittelen som vises p\00E5 aksen som er knyttet til kolonnen som er valgt for'),
'etiketten. Dette er ikke tilgjengelig for et sektordiagram.</li>',
'<li>Med <strong>Verdi</strong> kan du velge kolonnen som skal brukes som verdi. Hvis funksjonen',
unistr('er COUNT, trenger du ikke \00E5 velge en verdi.</li>'),
unistr('<li><strong>Aksetittel for verdi</strong> er tittelen som vises p\00E5 aksen som er knyttet til kolonnen som er valgt for'),
'verdien. Dette er ikke tilgjengelig for et sektordiagram.</li>',
unistr('<li><strong>Funksjon</strong> er en valgfri funksjon som skal utf\00F8res p\00E5 kolonnen som er valgt for verdien.</li>'),
'<li>Med <strong>Sorter</strong> kan du sortere resultatsettet.</li></ul>'))
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140953570458751919)
,p_name=>'APEXIR_HELP_COLUMN_HEADING_MENU'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Hvis du klikker p\00E5 en hvilken som helst kolonneoverskrift, vises en kolonneoverskriftsmeny. Valgene omfatter f\00F8lgende:'),
'<p></p>',
'<ul>',
unistr('<li>Ikonet <strong>Sorter stigende</strong> sorterer rapporten etter kolonnen i stigende rekkef\00F8lge.</li>'),
unistr('<li>Ikonet <strong>Sorter synkende</strong> sorterer rapporten etter kolonnen i synkende rekkef\00F8lge.</li>'),
'<li><strong>Skjul kolonne</strong> skjuler kolonnen. Ikke alle kolonner kan skjules. Hvis en kolonne ikke kan skjules, finnes det ikke noe Skjul kolonne-ikon.</li>',
unistr('<li><strong>Bryt kolonne</strong> oppretter en bruddgruppe p\00E5 kolonnen. Kolonnen trekkes ut av rapporten som en hovedpost.</li>'),
'<li><strong>Kolonneopplysninger</strong> viser hjelpetekst om kolonnen, hvis tilgjengelig.</li>',
unistr('<li><strong>Tekstomr\00E5de</strong> brukes til \00E5 angi s\00F8kekriterier som ikke skiller mellom sm\00E5 og store bokstaver'),
'(ikke behov for jokertegn). Hvis du angir en verdi, reduseres listen over',
'verdier nederst i menyen. Du kan da velge en verdi fra',
'bunnen, og den valgte verdien blir opprettet som et filter ved hjelp av =',
unistr('(for eksempel <code>column = ''ABC''</code>). Du kan ogs\00E5 klikke p\00E5 lommelyktikonet og angi en verdi som skal opprettes som et filter med modifikatoren LIKE'),
'(for eksempel <code>column LIKE ''%ABC%''</code>).</li>',
unistr('<li><strong>Liste over unike verdier</strong> inneholder de f\00F8rste 500 unike'),
'verdiene som oppfyller filterkriteriene. Hvis det er en datokolonne, vises en liste over datointervaller',
'i stedet. Hvis du velger en verdi, blir det opprettet et filter',
'ved hjelp av = (for eksempel <code>column = ''ABC''</code>).</li>',
'</ul>'))
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140954031521751919)
,p_name=>'APEXIR_HELP_COMPUTE'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Gj\00F8r at du kan legge til beregnede kolonner i rapporten. Disse kan v\00E6re matematiske beregninger (for eksempel <code>NBR_HOURS/24</code>) eller standard'),
unistr('Oracle-funksjoner som er brukt p\00E5 eksisterende kolonner. Noen vises som eksempler, og andre (som <code>TO_DATE)</code> kan ogs\00E5 brukes. Valgene omfatter f\00F8lgende:'),
'<p></p>',
'<ul>',
'<li>Med <strong>Beregning</strong> kan du velge en tidligere definert beregning du vil redigere.</li>',
'<li><strong>Kolonneoverskrift</strong> er kolonneoverskriften for den nye kolonnen.</li>',
'<li><strong>Formatmaske</strong> er en Oracle-formatmaske som kan brukes mot kolonnen (for eksempel S9999).</li>',
unistr('<li><strong>Beregning</strong> er beregningen som skal utf\00F8res. I beregningen refereres det til kolonner ved hjelp av de viste aliasene.</li>'),
'</ul>',
unistr('<p>Under Beregning vises kolonnene i sp\00F8rringen med tilknyttede'),
unistr('aliaser. Hvis du klikker p\00E5 kolonnenavnet eller aliaset, inkluderes de'),
'i beregningen. Ved siden av Kolonner vises et tastatur. Dette tastaturet fungerer som',
unistr('en snarvei til taster som brukes ofte. Lengst til h\00F8yre ser du Funksjoner.</p>'),
unistr('<p>F\00F8lgende eksempel p\00E5 beregning viser hvordan total kompensasjon skal vises:</p>'),
'<pre>CASE WHEN A = ''SALES'' THEN B + C ELSE B END</pre>',
'(der A er ORGANIZATION, B er SALARY og C er COMMISSION)',
''))
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140960561385751921)
,p_name=>'APEXIR_HELP_CONTROL_BREAK'
,p_message_language=>'no'
,p_message_text=>unistr('Brukes til \00E5 opprette en bruddgruppe i \00E9n eller flere kolonner. Kolonnene trekkes ut av den interaktive rapporten og vises som en hovedpost.')
,p_version_scn=>2705235
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140954768439751919)
,p_name=>'APEXIR_HELP_DETAIL_VIEW'
,p_message_language=>'no'
,p_message_text=>unistr('Hvis du vil vise detaljene for en enkelt rad om gangen, klikker du p\00E5 ikonet for enkeltradvisning i raden du vil vise. Hvis den er tilgjengelig, er enkeltradvisningen alltid f\00F8rste kolonne. Avhengig av tilpasningen av den interaktive rapporten kan en')
||unistr('keltradvisningen v\00E6re standardvisningen eller en egendefinert side som kan tillate oppdatering.')
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140954603140751919)
,p_name=>'APEXIR_HELP_DOWNLOAD'
,p_message_language=>'no'
,p_message_text=>unistr('Gj\00F8r at det gjeldende resultatsettet kan lastes ned. Nedlastingsformatene omfatter PDF, Excel, HTML og CSV. Nedlastingsvalgene er forskjellige avhengig av valgt format. Alle formater kan ogs\00E5 sendes som e-post.')
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140953710797751919)
,p_name=>'APEXIR_HELP_FILTER'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Fokuserer rapporten ved \00E5 legge til eller endre <code>WHERE</code>-leddet i sp\00F8rringen. Du kan filtrere p\00E5 en kolonne eller etter rad. '),
unistr('<p>Hvis du filtrerer etter kolonne, velger du en kolonne (det trenger ikke \00E5 v\00E6re'),
unistr('den som vises), velger en standard Oracle-operator (=, !=, not in, between) og angir et uttrykk for sammenligning. Det skilles mellom sm\00E5 og store bokstaver i uttrykk. Bruk % som jokertegn (for eksempel <code>STATE_NAME'),
'som A%)</code>.</p>',
'<p>Hvis du filtrerer etter rad, kan du opprette komplekse <code>WHERE</code>-ledd ved hjelp av',
'kolonnealiaser og hvilke som helst Oracle-funksjoner eller -operatorer (for eksempel <code>G = ''VA'' eller G = ''CT''</code>, der',
'<code>G</code> er alias for <code>CUSTOMER_STATE</code>).</p>',
''))
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140954379913751919)
,p_name=>'APEXIR_HELP_FLASHBACK'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Med en flashback-sp\00F8rring kan du vise data slik de var p\00E5 et tidligere'),
'tidspunkt. Standardtiden i en flashback er 3 timer (eller 180',
'minutter), men den faktiske tiden er forskjellig for hver database.'))
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141018975011751938)
,p_name=>'APEXIR_HELP_FORMAT'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Med Formater kan du tilpasse visningen av rapporten.',
unistr('Formater inneholder f\00F8lgende undermeny:</p>'),
'<ul><li>Sorter</li>',
'<li>Kontrollskift</li>',
'<li>Uthev</li>',
'<li>Beregn</li>',
'<li>Aggreger</li>',
'<li>Diagram</li>',
'<li>Grupper etter</li>',
'<li>Pivoter</li>',
'</ul>',
''))
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141017183918751938)
,p_name=>'APEXIR_HELP_GROUP_BY'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Du kan definere \00E9n Grupper etter-visning per lagret'),
unistr('rapport. N\00E5r den er definert, kan du veksle mellom Grupper etter- og rapportvisningen'),
unistr('ved hjelp av visningsikoner p\00E5 s\00F8kelinjen. N\00E5r du skal opprette en Grupper etter-visning, velger du'),
'<p></p>',
'<ul>',
'<li>kolonnene du vil gruppere i</li>',
unistr('<li>kolonnene som skal aggregeres, sammen med funksjonen som skal utf\00F8res (gjennomsnitt, sum, antall osv.)</li>'),
'</ul>'))
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140953905390751919)
,p_name=>'APEXIR_HELP_HIGHLIGHT'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Gj\00F8r at du kan definere et filter. Radene som oppfyller filterkriteriene, vises som uthevet med kjennetegnene som er knyttet til filteret. Valgene omfatter f\00F8lgende:</p>'),
'<ul>',
'<li><strong>Navn</strong> brukes bare til visning.</li>',
unistr('<li><strong>Rekkef\00F8lge</strong> identifiserer rekkef\00F8lgen som reglene evalueres i.</li>'),
'<li><strong>Aktivert</strong> identifiserer om en regel er aktivert eller deaktivert.</li>',
unistr('<li><strong>Uthevingstype</strong> identifiserer om raden eller cellen skal v\00E6re'),
'uthevet. Hvis Celle er valgt, utheves kolonnen det refereres til i',
'Betingelse for utheving.</li>',
unistr('<li><strong>Bakgrunnsfarge</strong> er den nye fargen for bakgrunnen til det uthevede omr\00E5det.</li>'),
unistr('<li><strong>Tekstfarge</strong> er den nye fargen for teksten i det uthevede omr\00E5det.</li>'),
'<li><strong>Betingelse for utheving</strong> definerer filterbetingelsen.</li>',
'</ul>',
''))
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140847359215751888)
,p_name=>'APEXIR_HELP_PIVOT'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Du kan definere \00E9n pivotvisning per lagret rapport. N\00E5r den er definert, kan du veksle mellom pivot- og rapportvisningen ved hjelp av visningsikoner p\00E5 s\00F8kelinjen. N\00E5r du skal opprette en pivotvisning, velger du '),
'<p></p>',
'<ul>',
'<li>kolonnene du vil pivotere i</li>',
'<li>kolonnene som skal vises som rader</li>',
unistr('<li>kolonnene som skal aggregeres, sammen med funksjonen som skal utf\00F8res (gjennomsnitt, sum, antall osv.)</li>'),
'</ul>'))
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140965080015751922)
,p_name=>'APEXIR_HELP_REPORT_SETTINGS'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Hvis du tilpasser en interaktiv rapport, vises rapportinnstillingene under',
unistr('s\00F8kelinjen og over rapporten. Dette omr\00E5det kan trekkes sammen og utvides ved hjelp av ikonet til venstre.'),
'<p>',
unistr('For hver rapportinnstilling kan du gj\00F8re f\00F8lgende:'),
'</p><ul>',
unistr('<li>Redigere en innstilling ved \00E5 klikke p\00E5 navnet.</li>'),
unistr('<li>Deaktivere/aktivere en innstilling ved \00E5 merke av eller fjerne merket i avmerkingsboksen Aktiver/Deaktiver. Bruk denne kontrollen til \00E5 sl\00E5 en innstilling midlertidig av og p\00E5.</li>'),
unistr('<li>Fjerne en innstilling ved \00E5 klikke p\00E5 ikonet Fjern.</li>'),
'</ul>',
'<p>Hvis du har opprettet et diagram, en gruppering eller en pivotering, kan du veksle mellom dem',
'og basisrapporten ved hjelp av koblingene for Rapport-, Diagram-, Grupper etter- og Pivot-visningen',
unistr('som vises til h\00F8yre. Hvis du viser diagrammet, grupperingen eller pivoteringen, kan du'),
unistr('ogs\00E5 redigere innstillingene ved hjelp av redigeringskoblingen.</p>'),
''))
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140954589921751919)
,p_name=>'APEXIR_HELP_RESET'
,p_message_language=>'no'
,p_message_text=>'Tilbakestiller rapporten til standardinnstillingene og fjerner alle tilpasninger du har gjort.'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141019268435751938)
,p_name=>'APEXIR_HELP_ROWS_PER_PAGE'
,p_message_language=>'no'
,p_message_text=>'Angir antall poster som skal vises per side.'
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140954448878751919)
,p_name=>'APEXIR_HELP_SAVE_REPORT'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Lagrer den tilpassede rapporten for fremtidig bruk. Du angir et navn og en valgfri beskrivelse, og du kan gj\00F8re rapporten offentlig tilgjengelig (det vil si for alle brukere som har tilgang til den prim\00E6re standardrapporten). Du kan lagre fire typ')
||'er interaktive rapporter:</p>',
'<ul>',
unistr('<li><strong>Prim\00E6r standard</strong> (bare utviklere). Prim\00E6r standard er rapporten som vises f\00F8rst. Det er ikke mulig \00E5 gi nytt navn til eller slette rapporter av typen Prim\00E6r standard.</li>'),
unistr('<li><strong>Alternativ rapport</strong> (bare utviklere). Gj\00F8r det mulig for utviklere \00E5 opprette flere rapportoppsett. Bare utviklere kan lagre, gi nytt navn til eller slette en alternativ rapport.</li>'),
unistr('<li><strong>Offentlig rapport</strong> (sluttbrukere). Kan lagres, f\00E5 nytt navn eller slettes av sluttbrukeren som opprettet den. Andre brukere kan vise og lagre oppsettet som en annen rapport.</li>'),
'<li><strong>Privat rapport</strong> (sluttbrukere). Bare sluttbrukeren som opprettet rapporten, kan vise, lagre, gi nytt navn til eller slette rapporten.</li>',
'</ul>',
unistr('<p>Hvis du lagrer tilpassede rapporter, vises en rapportvelger p\00E5 s\00F8kelinjen til venstre for radvelgeren (hvis denne funksjonen er aktivert).</p>'),
''))
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140953404364751919)
,p_name=>'APEXIR_HELP_SEARCH_BAR'
,p_message_language=>'no'
,p_message_text=>unistr('\00D8verst p\00E5 hver rapportside finnes et s\00F8keomr\00E5de. Dette omr\00E5det (eller s\00F8kelinjen) har f\00F8lgende funksjoner:')
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141019842506751939)
,p_name=>'APEXIR_HELP_SEARCH_BAR_ACTIONS_MENU'
,p_message_language=>'no'
,p_message_text=>unistr('<li>Med menyen <strong>Handlinger</strong> kan du tilpasse en rapport. Se f\00F8lgende avsnitt.</li>')
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141019312583751938)
,p_name=>'APEXIR_HELP_SEARCH_BAR_FINDER'
,p_message_language=>'no'
,p_message_text=>unistr('<li>Med ikonet <strong>Velg kolonner</strong> kan du identifisere hvilken kolonne det skal s\00F8kes i (eller alle).</li>')
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141019624004751939)
,p_name=>'APEXIR_HELP_SEARCH_BAR_REPORTS'
,p_message_language=>'no'
,p_message_text=>'<li><strong>Rapporter</strong> viser alternativ standard og lagrede private eller offentlige rapporter.</li>'
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141019577685751939)
,p_name=>'APEXIR_HELP_SEARCH_BAR_ROWS'
,p_message_language=>'no'
,p_message_text=>'<li><strong>Rader</strong> angir antall poster som skal vises per side.</li>'
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141019479107751939)
,p_name=>'APEXIR_HELP_SEARCH_BAR_TEXTBOX'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<li>Med <strong>Tekstomr\00E5de</strong> kan du angi s\00F8kekriterier som ikke skiller mellom sm\00E5 og store bokstaver (jokertegn er underforst\00E5tt).</li>'),
unistr('S\00F8ket startes med <li>knappen <strong>S\00F8k</strong>. Hvis du trykker p\00E5 Enter, blir s\00F8ket ogs\00E5 utf\00F8rt n\00E5r mark\00F8ren er i s\00F8ketekstomr\00E5det.</li>')))
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141019792479751939)
,p_name=>'APEXIR_HELP_SEARCH_BAR_VIEW'
,p_message_language=>'no'
,p_message_text=>'<li><strong>Visningsikoner</strong> bytter mellom ikon-, rapport-, detalj-, diagram-, Grupper etter- og pivotvisningen av rapporten, hvis definert.</li>'
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140953604017751919)
,p_name=>'APEXIR_HELP_SELECT_COLUMNS'
,p_message_language=>'no'
,p_message_text=>unistr('Brukes til \00E5 endre de viste kolonnene. Kolonnene til h\00F8yre vises. Kolonnene til venstre er skjult. Du kan endre rekkef\00F8lgen p\00E5 de viste kolonnene ved hjelp av pilene lengst til h\00F8yre. Beregnede kolonner f\00E5r prefikset <strong>**</strong>.')
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140953813592751919)
,p_name=>'APEXIR_HELP_SORT'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Brukes til \00E5 endre kolonnene det skal sorteres etter, og bestemmer om'),
unistr('det skal sorteres i stigende eller synkende rekkef\00F8lge. Du kan ogs\00E5 angi hvordan du vil h\00E5ndtere'),
unistr('<code>NULL</code>-verdier. Med standardinnstillingen vises alltid <code>NULL</code>-verdier sist, eller de kan vises alltid f\00F8rst. Den resulterende sorteringsrekkef\00F8lgen'),
unistr('vises til h\00F8yre for kolonneoverskriftene i rapporten.</p>')))
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141016939173751938)
,p_name=>'APEXIR_HELP_SUBSCRIPTION'
,p_message_language=>'no'
,p_message_text=>unistr('N\00E5r du legger til et abonnement, angir du en e-postadresse (eller flere e-postadresser atskilt med komma), et e-postemne, hyppighet og start- og sluttdato. De resulterende e-postene omfatter en eksportert versjon (PDF, Excel, HTML eller CSV) av den i')
||'nteraktive rapporten som inneholder de gjeldende dataene med rapportinnstillingen som fantes da abonnementet ble lagt til.'
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140958543176751921)
,p_name=>'APEXIR_HIDE_COLUMN'
,p_message_language=>'no'
,p_message_text=>'Skjul kolonne'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140948986968751918)
,p_name=>'APEXIR_HIGHLIGHT'
,p_message_language=>'no'
,p_message_text=>'Uthev'
,p_is_js_message=>true
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140960065845751921)
,p_name=>'APEXIR_HIGHLIGHTS'
,p_message_language=>'no'
,p_message_text=>'Uthevinger'
,p_version_scn=>2705235
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140930222707751912)
,p_name=>'APEXIR_HIGHLIGHT_CELL_WITH_COLORS'
,p_message_language=>'no'
,p_message_text=>unistr('Uthev celle, %0 \2013 %1')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140965144849751923)
,p_name=>'APEXIR_HIGHLIGHT_CONDITION'
,p_message_language=>'no'
,p_message_text=>'Betingelse for utheving'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140930165583751912)
,p_name=>'APEXIR_HIGHLIGHT_ROW_WITH_COLORS'
,p_message_language=>'no'
,p_message_text=>unistr('Uthev rad, %0 \2013 %1')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141017504180751938)
,p_name=>'APEXIR_HIGHLIGHT_STYLE'
,p_message_language=>'no'
,p_message_text=>'Uthevingsstil'
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140921731614751910)
,p_name=>'APEXIR_HIGHLIGHT_TYPE'
,p_message_language=>'no'
,p_message_text=>'Uthevingstype'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141036331365751944)
,p_name=>'APEXIR_HORIZONTAL'
,p_message_language=>'no'
,p_message_text=>'Vannrett'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141065327565751953)
,p_name=>'APEXIR_INACTIVE_SETTING'
,p_message_language=>'no'
,p_message_text=>'1 inaktiv innstilling'
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141065474991751953)
,p_name=>'APEXIR_INACTIVE_SETTINGS'
,p_message_language=>'no'
,p_message_text=>'%0 inaktive innstillinger'
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140955156512751920)
,p_name=>'APEXIR_INTERACTIVE_REPORT_HELP'
,p_message_language=>'no'
,p_message_text=>'Hjelp til interaktive rapporter'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140966118978751923)
,p_name=>'APEXIR_INVALID'
,p_message_language=>'no'
,p_message_text=>'Ugyldig'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140959543240751921)
,p_name=>'APEXIR_INVALID_COMPUTATION'
,p_message_language=>'no'
,p_message_text=>'Ugyldig beregningsuttrykk. %0'
,p_version_scn=>2705235
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140915146377751908)
,p_name=>'APEXIR_INVALID_END_DATE'
,p_message_language=>'no'
,p_message_text=>unistr('Sluttdatoen m\00E5 v\00E6re senere enn startdatoen.')
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140974339064751925)
,p_name=>'APEXIR_INVALID_FILTER'
,p_message_language=>'no'
,p_message_text=>'Ugyldig filteruttrykk. %0'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141044128400751946)
,p_name=>'APEXIR_INVALID_FILTER_QUERY'
,p_message_language=>'no'
,p_message_text=>unistr('Ugyldig filtersp\00F8rring')
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141065500947751953)
,p_name=>'APEXIR_INVALID_SETTING'
,p_message_language=>'no'
,p_message_text=>'1 ugyldig innstilling'
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141065606853751953)
,p_name=>'APEXIR_INVALID_SETTINGS'
,p_message_language=>'no'
,p_message_text=>'%0 ugyldige innstillinger'
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141017719169751938)
,p_name=>'APEXIR_IN_MINUTES'
,p_message_language=>'no'
,p_message_text=>'(i minutter)'
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141034728954751943)
,p_name=>'APEXIR_IS_IN_THE_LAST'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er i l\00F8pet av de siste %1')
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141034934713751943)
,p_name=>'APEXIR_IS_IN_THE_NEXT'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er i l\00F8pet av de neste %1')
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141034891295751943)
,p_name=>'APEXIR_IS_NOT_IN_THE_LAST'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er ikke i l\00F8pet av de siste %1')
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141035020356751943)
,p_name=>'APEXIR_IS_NOT_IN_THE_NEXT'
,p_message_language=>'no'
,p_message_text=>unistr('%0 er ikke i l\00F8pet av de neste %1')
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140964236612751922)
,p_name=>'APEXIR_KEYPAD'
,p_message_language=>'no'
,p_message_text=>'Tastatur'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140927925124751911)
,p_name=>'APEXIR_LABEL'
,p_message_language=>'no'
,p_message_text=>'Etiketten %0'
,p_version_scn=>2705229
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140958145117751920)
,p_name=>'APEXIR_LABEL_AXIS_TITLE'
,p_message_language=>'no'
,p_message_text=>'Aksetittel for etikett'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140950475943751918)
,p_name=>'APEXIR_LAST_DAY'
,p_message_language=>'no'
,p_message_text=>'Siste dag'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140950632965751918)
,p_name=>'APEXIR_LAST_HOUR'
,p_message_language=>'no'
,p_message_text=>'Siste time'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140950153528751918)
,p_name=>'APEXIR_LAST_MONTH'
,p_message_language=>'no'
,p_message_text=>unistr('Siste m\00E5ned')
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140950290953751918)
,p_name=>'APEXIR_LAST_WEEK'
,p_message_language=>'no'
,p_message_text=>'Siste uke'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140950390436751918)
,p_name=>'APEXIR_LAST_X_DAYS'
,p_message_language=>'no'
,p_message_text=>'Siste %0 dager'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140950510864751918)
,p_name=>'APEXIR_LAST_X_HOURS'
,p_message_language=>'no'
,p_message_text=>'Siste %0 timer'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140949946297751918)
,p_name=>'APEXIR_LAST_X_YEARS'
,p_message_language=>'no'
,p_message_text=>unistr('Siste %0 \00E5r')
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140950009653751918)
,p_name=>'APEXIR_LAST_YEAR'
,p_message_language=>'no'
,p_message_text=>unistr('Siste \00E5r')
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140927832659751911)
,p_name=>'APEXIR_LINE'
,p_message_language=>'no'
,p_message_text=>'Linje'
,p_version_scn=>2705229
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140924602121751910)
,p_name=>'APEXIR_LINE_WITH_AREA'
,p_message_language=>'no'
,p_message_text=>'Linje med areal'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141044080135751946)
,p_name=>'APEXIR_MAP_IT'
,p_message_language=>'no'
,p_message_text=>unistr('Utf\00F8r tilordning')
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140959093279751921)
,p_name=>'APEXIR_MAX_QUERY_COST'
,p_message_language=>'no'
,p_message_text=>unistr('Det er estimert at sp\00F8rringen overskrider maksimumsressursene. Endre rapportinnstillingene, og pr\00F8v p\00E5 nytt.')
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140940478985751915)
,p_name=>'APEXIR_MAX_ROW_CNT'
,p_message_language=>'no'
,p_message_text=>unistr('Maksimalt antall rader for denne rapporten er %0. Bruk et filter for \00E5 redusere antall poster i sp\00F8rringen.')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141044601736751946)
,p_name=>'APEXIR_MAX_X'
,p_message_language=>'no'
,p_message_text=>'Maksimum - %0'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141044849569751946)
,p_name=>'APEXIR_MEDIAN_X'
,p_message_language=>'no'
,p_message_text=>'Median - %0'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140887119596751899)
,p_name=>'APEXIR_MESSAGE'
,p_message_language=>'no'
,p_message_text=>'Melding'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140944781042751916)
,p_name=>'APEXIR_MIN_AGO'
,p_message_language=>'no'
,p_message_text=>'%0 minutter siden'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141044709114751946)
,p_name=>'APEXIR_MIN_X'
,p_message_language=>'no'
,p_message_text=>'Minimum - %0'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141043770280751946)
,p_name=>'APEXIR_MONTH'
,p_message_language=>'no'
,p_message_text=>unistr('M\00E5ned')
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141018175572751938)
,p_name=>'APEXIR_MONTHLY'
,p_message_language=>'no'
,p_message_text=>unistr('M\00E5nedlig')
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140957305379751920)
,p_name=>'APEXIR_MOVE'
,p_message_language=>'no'
,p_message_text=>'Flytt'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140957256457751920)
,p_name=>'APEXIR_MOVE_ALL'
,p_message_language=>'no'
,p_message_text=>'Flytt alle'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141070414613751955)
,p_name=>'APEXIR_MULTIIR_PAGE_REGION_STATIC_ID_REQUIRED'
,p_message_language=>'no'
,p_message_text=>unistr('Statisk ID for omr\00E5det m\00E5 angis fordi siden inneholder flere interaktive rapporter.')
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140923344914751910)
,p_name=>'APEXIR_NAME'
,p_message_language=>'no'
,p_message_text=>'Navn'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140953049276751919)
,p_name=>'APEXIR_NEW_AGGREGATION'
,p_message_language=>'no'
,p_message_text=>'Ny aggregering'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141066294140751953)
,p_name=>'APEXIR_NEW_CATEGORY_LABEL'
,p_message_language=>'no'
,p_message_text=>'Ny kategori'
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140953105183751919)
,p_name=>'APEXIR_NEW_COMPUTATION'
,p_message_language=>'no'
,p_message_text=>'Ny beregning'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140947893014751917)
,p_name=>'APEXIR_NEXT'
,p_message_language=>'no'
,p_message_text=>'Neste'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140950963751751918)
,p_name=>'APEXIR_NEXT_DAY'
,p_message_language=>'no'
,p_message_text=>'Neste dag'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140950787609751918)
,p_name=>'APEXIR_NEXT_HOUR'
,p_message_language=>'no'
,p_message_text=>'Neste time'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140951291372751918)
,p_name=>'APEXIR_NEXT_MONTH'
,p_message_language=>'no'
,p_message_text=>unistr('Neste m\00E5ned')
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140951178361751918)
,p_name=>'APEXIR_NEXT_WEEK'
,p_message_language=>'no'
,p_message_text=>'Neste uke'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140951031176751918)
,p_name=>'APEXIR_NEXT_X_DAYS'
,p_message_language=>'no'
,p_message_text=>'Neste %0 dager'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140950804781751918)
,p_name=>'APEXIR_NEXT_X_HOURS'
,p_message_language=>'no'
,p_message_text=>'Neste %0 timer'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140951485541751918)
,p_name=>'APEXIR_NEXT_X_YEARS'
,p_message_language=>'no'
,p_message_text=>unistr('Neste %0 \00E5r')
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140951320282751918)
,p_name=>'APEXIR_NEXT_YEAR'
,p_message_language=>'no'
,p_message_text=>unistr('Neste \00E5r')
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140923667120751910)
,p_name=>'APEXIR_NO'
,p_message_language=>'no'
,p_message_text=>'Nei'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140966332907751923)
,p_name=>'APEXIR_NONE'
,p_message_language=>'no'
,p_message_text=>'- Ingen -'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141017311174751938)
,p_name=>'APEXIR_NOT_VALID_EMAIL'
,p_message_language=>'no'
,p_message_text=>'Ikke en gyldig e-postadresse.'
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140889437903751900)
,p_name=>'APEXIR_NO_COLUMNS_SELECTED'
,p_message_language=>'no'
,p_message_text=>unistr('Ingen kolonner er valgt for visning. Bruk <strong>Kolonner</strong> p\00E5 menyen Handlinger hvis du vil gj\00F8re kolonner synlige.')
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140962823337751922)
,p_name=>'APEXIR_NULLS_ALWAYS_FIRST'
,p_message_language=>'no'
,p_message_text=>unistr('Nullverdier alltid f\00F8rst')
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140962783418751922)
,p_name=>'APEXIR_NULLS_ALWAYS_LAST'
,p_message_language=>'no'
,p_message_text=>'Nullverdier alltid sist'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140963222145751922)
,p_name=>'APEXIR_NULL_SORTING'
,p_message_language=>'no'
,p_message_text=>'Nullsortering - %0'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140959684055751921)
,p_name=>'APEXIR_NUMERIC_FLASHBACK_TIME'
,p_message_language=>'no'
,p_message_text=>unistr('Flashback-tiden m\00E5 v\00E6re numerisk.')
,p_version_scn=>2705235
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140959205867751921)
,p_name=>'APEXIR_NUMERIC_SEQUENCE'
,p_message_language=>'no'
,p_message_text=>unistr('Rekkef\00F8lgen m\00E5 v\00E6re numerisk.')
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140963706160751922)
,p_name=>'APEXIR_OPERATOR'
,p_message_language=>'no'
,p_message_text=>'Operator'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140922286461751910)
,p_name=>'APEXIR_ORANGE'
,p_message_language=>'no'
,p_message_text=>'oransje'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141036233884751943)
,p_name=>'APEXIR_ORIENTATION'
,p_message_language=>'no'
,p_message_text=>'Retning'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140924165019751910)
,p_name=>'APEXIR_OTHER'
,p_message_language=>'no'
,p_message_text=>'Annet'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140890351153751900)
,p_name=>'APEXIR_PAGINATION_OF'
,p_message_language=>'no'
,p_message_text=>'Paginering for %0'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140904329762751904)
,p_name=>'APEXIR_PDF_ORIENTATION'
,p_message_language=>'no'
,p_message_text=>'Sideretning'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140905049567751905)
,p_name=>'APEXIR_PDF_ORIENTATION_HORIZONTAL'
,p_message_language=>'no'
,p_message_text=>'Liggende'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140905131775751905)
,p_name=>'APEXIR_PDF_ORIENTATION_VERTICAL'
,p_message_language=>'no'
,p_message_text=>unistr('St\00E5ende')
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140904205472751904)
,p_name=>'APEXIR_PDF_PAGE_SIZE'
,p_message_language=>'no'
,p_message_text=>unistr('Sidest\00F8rrelse')
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140904800133751905)
,p_name=>'APEXIR_PDF_PAGE_SIZE_A3'
,p_message_language=>'no'
,p_message_text=>'A3'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140904739139751905)
,p_name=>'APEXIR_PDF_PAGE_SIZE_A4'
,p_message_language=>'no'
,p_message_text=>'A4'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140904902584751905)
,p_name=>'APEXIR_PDF_PAGE_SIZE_CUSTOM'
,p_message_language=>'no'
,p_message_text=>'Egendefinert'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140904543585751905)
,p_name=>'APEXIR_PDF_PAGE_SIZE_LEGAL'
,p_message_language=>'no'
,p_message_text=>'Legal'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140904425551751905)
,p_name=>'APEXIR_PDF_PAGE_SIZE_LETTER'
,p_message_language=>'no'
,p_message_text=>'Letter'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140904662805751905)
,p_name=>'APEXIR_PDF_PAGE_SIZE_TABLOID'
,p_message_language=>'no'
,p_message_text=>'Tabloid'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141045119355751946)
,p_name=>'APEXIR_PERCENT_OF_TOTAL_COUNT_X'
,p_message_language=>'no'
,p_message_text=>'Prosent av totalt antall - %0 (%)'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141044351726751946)
,p_name=>'APEXIR_PERCENT_OF_TOTAL_SUM_X'
,p_message_language=>'no'
,p_message_text=>'Prosent av totalsum %0 (%)'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141043381753751946)
,p_name=>'APEXIR_PERCENT_TOTAL_COUNT'
,p_message_language=>'no'
,p_message_text=>'Prosent av totalt antall'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141043220746751946)
,p_name=>'APEXIR_PERCENT_TOTAL_SUM'
,p_message_language=>'no'
,p_message_text=>'Prosent av totalsum'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140927768568751911)
,p_name=>'APEXIR_PIE'
,p_message_language=>'no'
,p_message_text=>'Sektor'
,p_version_scn=>2705229
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140993446858751931)
,p_name=>'APEXIR_PIVOT'
,p_message_language=>'no'
,p_message_text=>'Pivoter'
,p_is_js_message=>true
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140994963146751931)
,p_name=>'APEXIR_PIVOT_AGG_NOT_NULL'
,p_message_language=>'no'
,p_message_text=>unistr('Aggregering m\00E5 angis.')
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140995121449751931)
,p_name=>'APEXIR_PIVOT_AGG_NOT_ON_ROW_COL'
,p_message_language=>'no'
,p_message_text=>unistr('Du kan ikke aggregere p\00E5 en kolonne som er valgt som radkolonne.')
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140994392170751931)
,p_name=>'APEXIR_PIVOT_COLUMNS'
,p_message_language=>'no'
,p_message_text=>'Pivotkolonner'
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140994110068751931)
,p_name=>'APEXIR_PIVOT_COLUMN_N'
,p_message_language=>'no'
,p_message_text=>'Pivotkolonne - %0'
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140994709778751931)
,p_name=>'APEXIR_PIVOT_COLUMN_NOT_NULL'
,p_message_language=>'no'
,p_message_text=>unistr('Pivotkolonne m\00E5 angis.')
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140847276844751888)
,p_name=>'APEXIR_PIVOT_MAX_ROW_CNT'
,p_message_language=>'no'
,p_message_text=>unistr('Maksimalt antall rader for en pivotsp\00F8rring begrenser antall rader i basissp\00F8rringen, ikke antall viste rader. Basissp\00F8rringen overskrider maksimalt antall rader, som er %0. Bruk et filter for \00E5 redusere antall poster i basissp\00F8rringen.')
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140994633924751931)
,p_name=>'APEXIR_PIVOT_SORT'
,p_message_language=>'no'
,p_message_text=>'Pivotsortering'
,p_is_js_message=>true
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140960697090751921)
,p_name=>'APEXIR_PIVOT_TOO_MANY_VALUES'
,p_message_language=>'no'
,p_message_text=>'Pivotkolonnen inneholder for mange unike verdier - kan ikke generere pivot-SQL.'
,p_version_scn=>2705235
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140891680062751901)
,p_name=>'APEXIR_PIVOT_VIEW_OF'
,p_message_language=>'no'
,p_message_text=>'Pivotvisning for %0'
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141017461375751938)
,p_name=>'APEXIR_PREVIEW'
,p_message_language=>'no'
,p_message_text=>unistr('Forh\00E5ndsvis')
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140947979763751917)
,p_name=>'APEXIR_PREVIOUS'
,p_message_language=>'no'
,p_message_text=>'Forrige'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141042256658751945)
,p_name=>'APEXIR_PRIMARY'
,p_message_language=>'no'
,p_message_text=>unistr('Prim\00E6r')
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141018429318751938)
,p_name=>'APEXIR_PRIMARY_REPORT'
,p_message_language=>'no'
,p_message_text=>unistr('Prim\00E6r rapport')
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140904147012751904)
,p_name=>'APEXIR_PRINT_ACCESSIBLE'
,p_message_language=>'no'
,p_message_text=>'Inkluder tilgjengelighetskoder'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140864961100751893)
,p_name=>'APEXIR_PRINT_STRIP_RICH_TEXT'
,p_message_language=>'no'
,p_message_text=>'Fjern rik tekst'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140973321578751925)
,p_name=>'APEXIR_PRIVATE'
,p_message_language=>'no'
,p_message_text=>'Privat'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140928371153751912)
,p_name=>'APEXIR_PUBLIC'
,p_message_language=>'no'
,p_message_text=>'Offentlig'
,p_version_scn=>2705229
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140923900686751910)
,p_name=>'APEXIR_RED'
,p_message_language=>'no'
,p_message_text=>unistr('r\00F8d')
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141070343206751954)
,p_name=>'APEXIR_REGION_STATIC_ID_DOES_NOT_EXIST'
,p_message_language=>'no'
,p_message_text=>unistr('Den statiske ID-en %0 for omr\00E5det finnes ikke.')
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140957468647751920)
,p_name=>'APEXIR_REMOVE'
,p_message_language=>'no'
,p_message_text=>'Fjern'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140957547887751920)
,p_name=>'APEXIR_REMOVE_ALL'
,p_message_language=>'no'
,p_message_text=>'Fjern alle'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141065715608751953)
,p_name=>'APEXIR_REMOVE_CHART'
,p_message_language=>'no'
,p_message_text=>'Fjern diagram'
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140957093894751920)
,p_name=>'APEXIR_REMOVE_CONTROL_BREAK'
,p_message_language=>'no'
,p_message_text=>'Fjern kontrollskift'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140956720027751920)
,p_name=>'APEXIR_REMOVE_FILTER'
,p_message_language=>'no'
,p_message_text=>'Fjern filter'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140956842091751920)
,p_name=>'APEXIR_REMOVE_FLASHBACK'
,p_message_language=>'no'
,p_message_text=>'Fjern flashback'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141065898829751953)
,p_name=>'APEXIR_REMOVE_GROUP_BY'
,p_message_language=>'no'
,p_message_text=>'Fjern Grupper etter'
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140957191652751920)
,p_name=>'APEXIR_REMOVE_HIGHLIGHT'
,p_message_language=>'no'
,p_message_text=>'Fjern utheving'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141065913630751953)
,p_name=>'APEXIR_REMOVE_PIVOT'
,p_message_language=>'no'
,p_message_text=>'Fjern pivotering'
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141047048505751947)
,p_name=>'APEXIR_REMOVE_REPORT'
,p_message_language=>'no'
,p_message_text=>'Fjern rapport'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141028837546751941)
,p_name=>'APEXIR_RENAME_DEFAULT_REPORT'
,p_message_language=>'no'
,p_message_text=>'Gi nytt navn til standardrapport'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140966632561751923)
,p_name=>'APEXIR_RENAME_REPORT'
,p_message_language=>'no'
,p_message_text=>'Gi nytt navn til rapport'
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140948209646751917)
,p_name=>'APEXIR_REPORT'
,p_message_language=>'no'
,p_message_text=>'Rapport'
,p_is_js_message=>true
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141045265358751946)
,p_name=>'APEXIR_REPORTS'
,p_message_language=>'no'
,p_message_text=>'Rapporter'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140920487217751909)
,p_name=>'APEXIR_REPORT_ALIAS_DOES_NOT_EXIST'
,p_message_language=>'no'
,p_message_text=>'Lagret interaktiv rapport med aliaset %0 finnes ikke.'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140973680934751925)
,p_name=>'APEXIR_REPORT_DOES_NOT_EXIST'
,p_message_language=>'no'
,p_message_text=>'Rapporten finnes ikke.'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140920553489751909)
,p_name=>'APEXIR_REPORT_ID_DOES_NOT_EXIST'
,p_message_language=>'no'
,p_message_text=>'ID-en %0 for lagret interaktiv rapport finnes ikke.'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140964967954751922)
,p_name=>'APEXIR_REPORT_SETTINGS'
,p_message_language=>'no'
,p_message_text=>'Rapportinnstillinger'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140889101162751900)
,p_name=>'APEXIR_REPORT_SETTINGS_OF'
,p_message_language=>'no'
,p_message_text=>'Rapportinnstillinger for %0'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140945233734751917)
,p_name=>'APEXIR_REPORT_VIEW'
,p_message_language=>'no'
,p_message_text=>'Rapportvisning'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140949454167751918)
,p_name=>'APEXIR_RESET'
,p_message_language=>'no'
,p_message_text=>'Tilbakestill'
,p_is_js_message=>true
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140928569984751912)
,p_name=>'APEXIR_RESET_CONFIRM'
,p_message_language=>'no'
,p_message_text=>'Gjenopprett rapporten til standardinnstillingene.'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140923751600751910)
,p_name=>'APEXIR_ROW'
,p_message_language=>'no'
,p_message_text=>'Rad'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141041363855751945)
,p_name=>'APEXIR_ROWID_NOT_SUPPORTED_FOR_WEBSOURCE'
,p_message_language=>'no'
,p_message_text=>unistr('Du kan ikke bruke ROWID som prim\00E6rn\00F8kkelkolonne for en REST-datakilde.')
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140956173045751920)
,p_name=>'APEXIR_ROWS'
,p_message_language=>'no'
,p_message_text=>'Rader'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141019130706751938)
,p_name=>'APEXIR_ROWS_PER_PAGE'
,p_message_language=>'no'
,p_message_text=>'Rader per side'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140994452075751931)
,p_name=>'APEXIR_ROW_COLUMNS'
,p_message_language=>'no'
,p_message_text=>'Radkolonner'
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140994244970751931)
,p_name=>'APEXIR_ROW_COLUMN_N'
,p_message_language=>'no'
,p_message_text=>'Radkolonne - %0'
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140994871340751931)
,p_name=>'APEXIR_ROW_COLUMN_NOT_NULL'
,p_message_language=>'no'
,p_message_text=>unistr('Radkolonne m\00E5 angis.')
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140995060836751931)
,p_name=>'APEXIR_ROW_COL_DIFF_FROM_PIVOT_COL'
,p_message_language=>'no'
,p_message_text=>unistr('Radkolonnen m\00E5 v\00E6re forskjellig fra pivotkolonnen.')
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140970641760751924)
,p_name=>'APEXIR_ROW_FILTER'
,p_message_language=>'no'
,p_message_text=>'Radfilter'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140945320925751917)
,p_name=>'APEXIR_ROW_OF'
,p_message_language=>'no'
,p_message_text=>'Rad %0 av %1'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140949685991751918)
,p_name=>'APEXIR_ROW_TEXT_CONTAINS'
,p_message_language=>'no'
,p_message_text=>'Radteksten inneholder'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140923096798751910)
,p_name=>'APEXIR_SAVE'
,p_message_language=>'no'
,p_message_text=>'Lagre'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140960295239751921)
,p_name=>'APEXIR_SAVED_REPORT'
,p_message_language=>'no'
,p_message_text=>'Lagret rapport'
,p_version_scn=>2705235
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140960158876751921)
,p_name=>'APEXIR_SAVED_REPORT_MSG'
,p_message_language=>'no'
,p_message_text=>'Lagret rapport = %0'
,p_version_scn=>2705235
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140962331923751922)
,p_name=>'APEXIR_SAVE_DEFAULT_CONFIRM'
,p_message_language=>'no'
,p_message_text=>'De gjeldende rapportinnstillingene blir brukt som standard for alle brukere.'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141028750623751941)
,p_name=>'APEXIR_SAVE_DEFAULT_REPORT'
,p_message_language=>'no'
,p_message_text=>'Lagre standardrapport'
,p_is_js_message=>true
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140949387864751918)
,p_name=>'APEXIR_SAVE_REPORT'
,p_message_language=>'no'
,p_message_text=>'Lagre rapport'
,p_is_js_message=>true
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141066102546751953)
,p_name=>'APEXIR_SAVE_REPORT_DEFAULT'
,p_message_language=>'no'
,p_message_text=>'Lagre rapport *'
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141020191800751939)
,p_name=>'APEXIR_SEARCH'
,p_message_language=>'no'
,p_message_text=>unistr('S\00F8k')
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140955064233751920)
,p_name=>'APEXIR_SEARCH_BAR'
,p_message_language=>'no'
,p_message_text=>unistr('S\00F8kelinje')
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140888455041751900)
,p_name=>'APEXIR_SEARCH_BAR_OF'
,p_message_language=>'no'
,p_message_text=>unistr('S\00F8kelinje for %0')
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141066035305751953)
,p_name=>'APEXIR_SEARCH_COLUMN'
,p_message_language=>'no'
,p_message_text=>unistr('S\00F8k etter: %0')
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141025608043751940)
,p_name=>'APEXIR_SEARCH_REPORT'
,p_message_language=>'no'
,p_message_text=>unistr('S\00F8kerapport')
,p_version_scn=>2705246
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141009663543751936)
,p_name=>'APEXIR_SELECTED_COLUMNS'
,p_message_language=>'no'
,p_message_text=>'Valgte kolonner'
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140924731810751910)
,p_name=>'APEXIR_SELECT_COLUMN'
,p_message_language=>'no'
,p_message_text=>'- Velg kolonne -'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140948657402751918)
,p_name=>'APEXIR_SELECT_COLUMNS'
,p_message_language=>'no'
,p_message_text=>'Velg kolonner'
,p_is_js_message=>true
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140928207336751912)
,p_name=>'APEXIR_SELECT_FUNCTION'
,p_message_language=>'no'
,p_message_text=>'- Velg funksjon -'
,p_version_scn=>2705229
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140955810093751920)
,p_name=>'APEXIR_SELECT_GROUP_BY_COLUMN'
,p_message_language=>'no'
,p_message_text=>'- Velg Grupper etter-kolonne -'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140993956759751931)
,p_name=>'APEXIR_SELECT_PIVOT_COLUMN'
,p_message_language=>'no'
,p_message_text=>'- Velg pivotkolonne -'
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141044204608751946)
,p_name=>'APEXIR_SELECT_ROW'
,p_message_language=>'no'
,p_message_text=>'Velg rad'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140994091059751931)
,p_name=>'APEXIR_SELECT_ROW_COLUMN'
,p_message_language=>'no'
,p_message_text=>'- Velg radkolonne -'
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140875528066751896)
,p_name=>'APEXIR_SEND'
,p_message_language=>'no'
,p_message_text=>'Send'
,p_is_js_message=>true
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140898066644751903)
,p_name=>'APEXIR_SEND_AS_EMAIL'
,p_message_language=>'no'
,p_message_text=>'Send som e-post'
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140923488305751910)
,p_name=>'APEXIR_SEQUENCE'
,p_message_language=>'no'
,p_message_text=>unistr('Rekkef\00F8lge')
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140948874230751918)
,p_name=>'APEXIR_SORT'
,p_message_language=>'no'
,p_message_text=>'Sorter'
,p_is_js_message=>true
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140958374182751921)
,p_name=>'APEXIR_SORT_ASCENDING'
,p_message_language=>'no'
,p_message_text=>'Sorter stigende'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140958488989751921)
,p_name=>'APEXIR_SORT_DESCENDING'
,p_message_language=>'no'
,p_message_text=>'Sorter synkende'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141046432927751946)
,p_name=>'APEXIR_SORT_ORDER'
,p_message_language=>'no'
,p_message_text=>unistr('Sorteringsrekkef\00F8lge')
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140952788703751919)
,p_name=>'APEXIR_SPACE_AS_IN_ONE_EMPTY_STRING'
,p_message_language=>'no'
,p_message_text=>'mellomrom'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140963998483751922)
,p_name=>'APEXIR_STATUS'
,p_message_language=>'no'
,p_message_text=>'Status - %0'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141017810547751938)
,p_name=>'APEXIR_SUBSCRIPTION'
,p_message_language=>'no'
,p_message_text=>'Abonnement'
,p_is_js_message=>true
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141043641989751946)
,p_name=>'APEXIR_SUBSCRIPTION_ENDING'
,p_message_language=>'no'
,p_message_text=>'Slutter'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140862653774751892)
,p_name=>'APEXIR_SUBSCRIPTION_SKIP_IF_NDF'
,p_message_language=>'no'
,p_message_text=>'Hopp over hvis ingen data blir funnet'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141043591417751946)
,p_name=>'APEXIR_SUBSCRIPTION_STARTING_FROM'
,p_message_language=>'no'
,p_message_text=>'Starter fra'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141044458381751946)
,p_name=>'APEXIR_SUM_X'
,p_message_language=>'no'
,p_message_text=>'Sum - %0'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141035356098751943)
,p_name=>'APEXIR_TABLE_SUMMARY'
,p_message_language=>'no'
,p_message_text=>'%0, rapport = %1, visning = %2'
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140922358655751910)
,p_name=>'APEXIR_TEXT_COLOR'
,p_message_language=>'no'
,p_message_text=>'Tekstfarge'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140941025397751915)
,p_name=>'APEXIR_TIME_DAYS'
,p_message_language=>'no'
,p_message_text=>'dager'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140940940513751915)
,p_name=>'APEXIR_TIME_HOURS'
,p_message_language=>'no'
,p_message_text=>'timer'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140940803567751915)
,p_name=>'APEXIR_TIME_MINS'
,p_message_language=>'no'
,p_message_text=>'minutter'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140941224372751915)
,p_name=>'APEXIR_TIME_MONTHS'
,p_message_language=>'no'
,p_message_text=>unistr('m\00E5neder')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140941118635751915)
,p_name=>'APEXIR_TIME_WEEKS'
,p_message_language=>'no'
,p_message_text=>'uker'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140941397259751915)
,p_name=>'APEXIR_TIME_YEARS'
,p_message_language=>'no'
,p_message_text=>unistr('\00E5r')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141046803872751947)
,p_name=>'APEXIR_TOGGLE'
,p_message_language=>'no'
,p_message_text=>unistr('Sl\00E5 p\00E5/av')
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140957670884751920)
,p_name=>'APEXIR_TOP'
,p_message_language=>'no'
,p_message_text=>unistr('\00D8verst')
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141040397898751945)
,p_name=>'APEXIR_UNGROUPED_COLUMN'
,p_message_language=>'no'
,p_message_text=>'Ugruppert kolonne'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140959160039751921)
,p_name=>'APEXIR_UNIQUE_HIGHLIGHT_NAME'
,p_message_language=>'no'
,p_message_text=>unistr('Uthevingsnavn m\00E5 v\00E6re unikt.')
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140927078019751911)
,p_name=>'APEXIR_UNSUPPORTED_DATA_TYPE'
,p_message_language=>'no'
,p_message_text=>unistr('ikke-st\00F8ttet datatype')
,p_version_scn=>2705229
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140957781879751920)
,p_name=>'APEXIR_UP'
,p_message_language=>'no'
,p_message_text=>'Opp'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140959303115751921)
,p_name=>'APEXIR_VALID_COLOR'
,p_message_language=>'no'
,p_message_text=>'Angi en gyldig farge.'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140959457813751921)
,p_name=>'APEXIR_VALID_FORMAT_MASK'
,p_message_language=>'no'
,p_message_text=>'Angi en gyldig formatmaske.'
,p_version_scn=>2705235
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140924271085751910)
,p_name=>'APEXIR_VALUE'
,p_message_language=>'no'
,p_message_text=>'Verdi'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140958212771751920)
,p_name=>'APEXIR_VALUE_AXIS_TITLE'
,p_message_language=>'no'
,p_message_text=>'Aksetittel for verdi'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140966018043751923)
,p_name=>'APEXIR_VALUE_REQUIRED'
,p_message_language=>'no'
,p_message_text=>unistr('N\00F8dvendig verdi')
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140927618297751911)
,p_name=>'APEXIR_VCOLUMN'
,p_message_language=>'no'
,p_message_text=>'Loddrett kolonne'
,p_version_scn=>2705229
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141036402631751944)
,p_name=>'APEXIR_VERTICAL'
,p_message_language=>'no'
,p_message_text=>'Loddrett'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140965362395751923)
,p_name=>'APEXIR_VIEW_CHART'
,p_message_language=>'no'
,p_message_text=>'Vis diagram'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141023956356751940)
,p_name=>'APEXIR_VIEW_DETAIL'
,p_message_language=>'no'
,p_message_text=>'Vis detaljer'
,p_version_scn=>2705246
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141068242720751954)
,p_name=>'APEXIR_VIEW_DOES_NOT_EXIST'
,p_message_language=>'no'
,p_message_text=>'Rapporten har ikke %0-visning som er definert.'
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141024061315751940)
,p_name=>'APEXIR_VIEW_GROUP_BY'
,p_message_language=>'no'
,p_message_text=>'Vis Grupper etter'
,p_version_scn=>2705246
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141023812369751940)
,p_name=>'APEXIR_VIEW_ICONS'
,p_message_language=>'no'
,p_message_text=>'Visningsikoner'
,p_version_scn=>2705246
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140993764307751931)
,p_name=>'APEXIR_VIEW_PIVOT'
,p_message_language=>'no'
,p_message_text=>'Vis pivotering'
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140965457288751923)
,p_name=>'APEXIR_VIEW_REPORT'
,p_message_language=>'no'
,p_message_text=>'Vis rapport'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141018069170751938)
,p_name=>'APEXIR_WEEKLY'
,p_message_language=>'no'
,p_message_text=>'Ukentlig'
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140948101621751917)
,p_name=>'APEXIR_WORKING_REPORT'
,p_message_language=>'no'
,p_message_text=>'Arbeidsrapport'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141045889263751946)
,p_name=>'APEXIR_X_DAYS'
,p_message_language=>'no'
,p_message_text=>'%0 dager'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141045766930751946)
,p_name=>'APEXIR_X_HOURS'
,p_message_language=>'no'
,p_message_text=>'%0 timer'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141045657641751946)
,p_name=>'APEXIR_X_MINS'
,p_message_language=>'no'
,p_message_text=>'%0 minutter'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141046088415751946)
,p_name=>'APEXIR_X_MONTHS'
,p_message_language=>'no'
,p_message_text=>unistr('%0 m\00E5neder')
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141045998776751946)
,p_name=>'APEXIR_X_WEEKS'
,p_message_language=>'no'
,p_message_text=>'%0 uker'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141046174812751946)
,p_name=>'APEXIR_X_YEARS'
,p_message_language=>'no'
,p_message_text=>unistr('%0 \00E5r')
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141043862206751946)
,p_name=>'APEXIR_YEAR'
,p_message_language=>'no'
,p_message_text=>unistr('\00C5r')
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140922025971751910)
,p_name=>'APEXIR_YELLOW'
,p_message_language=>'no'
,p_message_text=>'gul'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140923598362751910)
,p_name=>'APEXIR_YES'
,p_message_language=>'no'
,p_message_text=>'Ja'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140958042672751920)
,p_name=>'APEX_GROUP.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE'
,p_message_language=>'no'
,p_message_text=>'%0 inneholder < eller >, som er ugyldige tegn.'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140981941427751927)
,p_name=>'APEX_REGION'
,p_message_language=>'no'
,p_message_text=>unistr('Omr\00E5de')
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140873072645751895)
,p_name=>'APEX_ZIP.EXTRACT_FAILED'
,p_message_language=>'no'
,p_message_text=>'Kan ikke pakke ut ZIP-filen.'
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140872902371751895)
,p_name=>'APEX_ZIP.INVALID_ZIPFILE'
,p_message_language=>'no'
,p_message_text=>'Finner ikke signaturen for slutten av sentral katalog. Denne filen er ikke en ZIP-fil.'
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140904018303751904)
,p_name=>'API_PRECONDITION_VIOLATED'
,p_message_language=>'no'
,p_message_text=>unistr('Brudd p\00E5 API-forh\00E5ndsbetingelse')
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140926154530751911)
,p_name=>'APP.SETTING.CANNOT.GET'
,p_message_language=>'no'
,p_message_text=>'Kan ikke hente verdi for applikasjonsinnstillingen %0 fordi tilknyttet byggevalg er deaktivert.'
,p_version_scn=>2705229
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140926043244751911)
,p_name=>'APP.SETTING.CANNOT.SET'
,p_message_language=>'no'
,p_message_text=>'Kan ikke angi verdi for applikasjonsinnstillingen %0 fordi tilknyttet byggevalg er deaktivert.'
,p_version_scn=>2705229
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141038648188751944)
,p_name=>'APP.SETTING.INVALID.VALUE'
,p_message_language=>'no'
,p_message_text=>'Verdien %0 for applikasjonsinnstillingen er ugyldig'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141038542431751944)
,p_name=>'APP.SETTING.NOT.DEFINED'
,p_message_language=>'no'
,p_message_text=>'Den forespurte applikasjonsinnstillingen, %0, er ikke definert'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141038757549751944)
,p_name=>'APP.SETTING.VALUE.NOT.NULL'
,p_message_language=>'no'
,p_message_text=>'Applikasjonsinnstillingen %0 kan ikke settes til en nullverdi'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140912660460751907)
,p_name=>'BACK'
,p_message_language=>'no'
,p_message_text=>'Tilbake'
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140895068169751902)
,p_name=>'BUILDER'
,p_message_language=>'no'
,p_message_text=>'Bygger'
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140968640893751924)
,p_name=>'BUTTON LABEL'
,p_message_language=>'no'
,p_message_text=>'Knappeetikett'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140891934146751901)
,p_name=>'BUTTON_CSS_CLASSES'
,p_message_language=>'no'
,p_message_text=>'CSS-klasser for knapp'
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140930492571751912)
,p_name=>'BUTTON_ID'
,p_message_language=>'no'
,p_message_text=>'Den genererte knappe-ID-en er enten knappens statiske ID, hvis definert, eller, hvis ikke, en internt generert ID i formatet ''B'' || [intern knappe-ID]'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140864413652751893)
,p_name=>'CANDLESTICK'
,p_message_language=>'no'
,p_message_text=>'Lysestakediagram'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140978458142751926)
,p_name=>'CENTER'
,p_message_language=>'no'
,p_message_text=>'Midtstilt'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140925057359751911)
,p_name=>'CHANGE_PW_REQUEST'
,p_message_language=>'no'
,p_message_text=>unistr('Foresp\00F8rsel om %0')
,p_version_scn=>2705228
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140915017998751908)
,p_name=>'CHECK$'
,p_message_language=>'no'
,p_message_text=>'radvelger'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141040456667751945)
,p_name=>'CHECKED'
,p_message_language=>'no'
,p_message_text=>'avmerket'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141016847799751938)
,p_name=>'COLUMN'
,p_message_language=>'no'
,p_message_text=>'Kolonne'
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140974472180751925)
,p_name=>'COMMENTS'
,p_message_language=>'no'
,p_message_text=>'Kommentarer'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140955418046751920)
,p_name=>'CONTINUE'
,p_message_language=>'no'
,p_message_text=>'Fortsett'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140912923678751907)
,p_name=>'COPYRIGHT'
,p_message_language=>'no'
,p_message_text=>'Copyright &copy; 1999, %0, Oracle og/eller tilknyttede selskaper.'
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140961190795751921)
,p_name=>'COUNT'
,p_message_language=>'no'
,p_message_text=>'Antall'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140968112121751923)
,p_name=>'CREATE'
,p_message_language=>'no'
,p_message_text=>'Opprett'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141023553446751940)
,p_name=>'CREATED'
,p_message_language=>'no'
,p_message_text=>'Opprettet'
,p_version_scn=>2705246
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141023698306751940)
,p_name=>'CREATED_BY'
,p_message_language=>'no'
,p_message_text=>'Opprettet av'
,p_version_scn=>2705246
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140944572103751916)
,p_name=>'CREATED_ON'
,p_message_language=>'no'
,p_message_text=>'Opprettet den'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140955687073751920)
,p_name=>'CUSTOM'
,p_message_language=>'no'
,p_message_text=>'Egendefinert'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140966873560751923)
,p_name=>'CUSTOMIZE'
,p_message_language=>'no'
,p_message_text=>'Tilpass'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140968854670751924)
,p_name=>'CUSTOMIZE.USER_PAGE_PREFS_RESET'
,p_message_language=>'no'
,p_message_text=>'Sidepreferanser er tilbakestilt for brukeren %0.'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140968992069751924)
,p_name=>'CUSTOMIZE.USER_PREFS_CHANGED'
,p_message_language=>'no'
,p_message_text=>'Preferanser er endret for brukeren %0.'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140968764626751924)
,p_name=>'CUSTOMIZE.USER_PREFS_RESET'
,p_message_language=>'no'
,p_message_text=>'Sidepreferanser er tilbakestilt for brukeren %0.'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140929838518751912)
,p_name=>'DAILY'
,p_message_language=>'no'
,p_message_text=>'Daglig'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140893249922751901)
,p_name=>'DATA.LOAD.INVALID_FILE'
,p_message_language=>'no'
,p_message_text=>'Den lastede filen er ugyldig, eller den har feil filtype.'
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140925246172751911)
,p_name=>'DATA.LOAD.INVALID_SELECTOR'
,p_message_language=>'no'
,p_message_text=>'Ugyldig XML- eller JSON-velger er brukt.'
,p_version_scn=>2705228
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140870308028751894)
,p_name=>'DATA.LOAD.NO_COMMON_COLUMNS'
,p_message_language=>'no'
,p_message_text=>unistr('Dataprofil og lastet fil inneholder ikke noen m\00E5ltabellkolonne.')
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140984219266751928)
,p_name=>'DATA.LOAD.NO_FILE_CONTENTS'
,p_message_language=>'no'
,p_message_text=>'Finner ingen data i lastet fil.'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140984367688751928)
,p_name=>'DATA.LOAD.NO_WORKSHEET_CONTENTS'
,p_message_language=>'no'
,p_message_text=>'Finner ingen data i regnearket %0.'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140890121774751900)
,p_name=>'DATA.LOAD.NO_XLSX_FILE'
,p_message_language=>'no'
,p_message_text=>'Den angitte filen er ikke en XLSX-fil.'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140856100814751890)
,p_name=>'DATA.LOAD.ROWS_PROCESSED'
,p_message_language=>'no'
,p_message_text=>unistr('Datalasting er fullf\00F8rt. %0 rader er behandlet.')
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140858434409751891)
,p_name=>'DATA.LOAD.ROWS_PROCESSED_W_ERROR_ROW'
,p_message_language=>'no'
,p_message_text=>unistr('Datalasting er fullf\00F8rt. %0 rader er behandlet med 1 feil.')
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140858749626751891)
,p_name=>'DATA.LOAD.ROWS_PROCESSED_W_ERROR_ROWS'
,p_message_language=>'no'
,p_message_text=>unistr('Datalasting er fullf\00F8rt. %0 rader er behandlet med %1 feil.')
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140858585874751891)
,p_name=>'DATA.LOAD.ROW_PROCESSED'
,p_message_language=>'no'
,p_message_text=>unistr('Datalasting er fullf\00F8rt. 1 rad er behandlet.')
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140872846004751895)
,p_name=>'DATA.LOAD.ROW_PROCESSED_W_ERROR_ROW'
,p_message_language=>'no'
,p_message_text=>unistr('Datalasting er fullf\00F8rt. 1 rad er behandlet med feil.')
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140858670253751891)
,p_name=>'DATA.LOAD.ROW_PROCESSED_W_ERROR_ROWS'
,p_message_language=>'no'
,p_message_text=>unistr('Datalasting er fullf\00F8rt. 1 rad er behandlet uten feil.')
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140991310683751930)
,p_name=>'DATA_LOAD.COLUMN_NAMES_MAPPING'
,p_message_language=>'no'
,p_message_text=>unistr('M\00E5lkolonne')
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140898563483751903)
,p_name=>'DATA_LOAD.DO_NOT_LOAD'
,p_message_language=>'no'
,p_message_text=>'Ikke last'
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140898691483751903)
,p_name=>'DATA_LOAD.FAILED'
,p_message_language=>'no'
,p_message_text=>'Feil i forbehandling'
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140991434283751930)
,p_name=>'DATA_LOAD.FIRST_COLUMN_NAMES'
,p_message_language=>'no'
,p_message_text=>'Kildekolonne'
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140992202338751931)
,p_name=>'DATA_LOAD.FORMAT'
,p_message_language=>'no'
,p_message_text=>'Dato- /tallformat'
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140898348487751903)
,p_name=>'DATA_LOAD.INSERT'
,p_message_language=>'no'
,p_message_text=>'Sett inn rad'
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141054411309751949)
,p_name=>'DATA_LOAD.LOOKUP_FAILED'
,p_message_language=>'no'
,p_message_text=>'Kan ikke hente oppslagsverdien.'
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141024194398751940)
,p_name=>'DATA_LOAD.MAPPING'
,p_message_language=>'no'
,p_message_text=>'Data-/tabelltilordning'
,p_version_scn=>2705246
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140992319875751931)
,p_name=>'DATA_LOAD.ROW'
,p_message_language=>'no'
,p_message_text=>'Rad'
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140898791072751903)
,p_name=>'DATA_LOAD.SEQUENCE_ACTION'
,p_message_language=>'no'
,p_message_text=>unistr('Rekkef\00F8lge : Handling')
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140986044178751929)
,p_name=>'DATA_LOAD.TRANSFORMATION_FAILED'
,p_message_language=>'no'
,p_message_text=>'Transformeringsregelen mislyktes'
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140898467550751903)
,p_name=>'DATA_LOAD.UPDATE'
,p_message_language=>'no'
,p_message_text=>'Oppdater rad'
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140960766893751921)
,p_name=>'DATE'
,p_message_language=>'no'
,p_message_text=>'Dato'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140933643711751913)
,p_name=>'DAY'
,p_message_language=>'no'
,p_message_text=>'dag'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140933759367751913)
,p_name=>'DAYS'
,p_message_language=>'no'
,p_message_text=>'dager'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140974192127751925)
,p_name=>'DEBUGGING_OFF'
,p_message_language=>'no'
,p_message_text=>'Feilleting er ikke aktivert for denne applikasjonen.'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141025875980751940)
,p_name=>'DEFAULT'
,p_message_language=>'no'
,p_message_text=>'Standard'
,p_version_scn=>2705246
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140934465682751913)
,p_name=>'DELETE'
,p_message_language=>'no'
,p_message_text=>'slett'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140910033226751906)
,p_name=>'DELETE_MSG'
,p_message_language=>'no'
,p_message_text=>unistr('Vil du utf\00F8re denne slettehandlingen?')
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140889662466751900)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES'
,p_message_language=>'no'
,p_message_text=>unistr('\00D8ktoverstyringer')
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140890503214751900)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ENABLE'
,p_message_language=>'no'
,p_message_text=>unistr('Aktiver \00F8ktoverstyringer')
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140891416079751901)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ERROR_LOAD'
,p_message_language=>'no'
,p_message_text=>unistr('Det oppstod en feil under lasting av \00F8ktoverstyringene.')
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140891254523751901)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ERROR_SAVE'
,p_message_language=>'no'
,p_message_text=>unistr('Det oppstod en feil under lagring av \00F8ktoverstyringene.')
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140891150325751901)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_SAVED'
,p_message_language=>'no'
,p_message_text=>unistr('\00D8ktoverstyringene er lagret. Endringene vises n\00E5r du har lukket denne dialogboksen.')
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140864392281751893)
,p_name=>'DIAL_PCT'
,p_message_language=>'no'
,p_message_text=>'Skive (prosent)'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140905393989751905)
,p_name=>'DOWNLOAD'
,p_message_language=>'no'
,p_message_text=>'Last ned'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141024982559751940)
,p_name=>'DUP_USER'
,p_message_language=>'no'
,p_message_text=>'Duplisert brukernavn i listen.'
,p_version_scn=>2705246
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140913701582751907)
,p_name=>'EDIT'
,p_message_language=>'no'
,p_message_text=>'Rediger'
,p_is_js_message=>true
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140924988492751911)
,p_name=>'EMAIL_NOT_FOUND'
,p_message_language=>'no'
,p_message_text=>'Finner ikke e-postadressen %0.'
,p_version_scn=>2705228
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140907615829751905)
,p_name=>'EMAIL_SENT_BY'
,p_message_language=>'no'
,p_message_text=>'Denne e-posten er sendt av %0.'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141025153419751940)
,p_name=>'EMAIL_TOO_LONG'
,p_message_language=>'no'
,p_message_text=>'E-postadressen er for lang. Grensen er 240 tegn.'
,p_version_scn=>2705246
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140955384742751920)
,p_name=>'ERROR'
,p_message_language=>'no'
,p_message_text=>'Feil'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140986190454751929)
,p_name=>'ERROR_SET_ITEM_STATE_FOR_PPR_REGION'
,p_message_language=>'no'
,p_message_text=>unistr('Kan ikke angi kildeverdi for sideelement for et bestemt sideoppfriskingsomr\00E5de')
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140946696952751917)
,p_name=>'F4500_P10_CREATED_BY'
,p_message_language=>'no'
,p_message_text=>'Opprettet av'
,p_version_scn=>2705233
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140907900863751906)
,p_name=>'F4500_P2613_EXPIRED'
,p_message_language=>'no'
,p_message_text=>unistr('Passordet er utl\00F8pt')
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140900339873751903)
,p_name=>'FILE_EMPTY'
,p_message_language=>'no'
,p_message_text=>'Filen er tom.'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140990175717751930)
,p_name=>'FILE_TOO_LARGE'
,p_message_language=>'no'
,p_message_text=>unistr('St\00F8rrelsen p\00E5 den lastede filen var over %0 MB. Last en mindre fil.')
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140910248954751906)
,p_name=>'FILE_UPLOAD_AUTHENTICATION_ERR'
,p_message_language=>'no'
,p_message_text=>unistr('Brukerautentisering mislyktes, og \00E9n eller flere filer er ikke lastet.')
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140910312989751906)
,p_name=>'FILE_UPLOAD_PUBLICUSER_ERR'
,p_message_language=>'no'
,p_message_text=>'Denne forekomsten tillater ikke at uautentiserte brukere laster filer.'
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140990257435751930)
,p_name=>'FILTERS'
,p_message_language=>'no'
,p_message_text=>'Filtre'
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140968216127751923)
,p_name=>'FLOW.SINGLE_VALIDATION_ERROR'
,p_message_language=>'no'
,p_message_text=>unistr('Det har oppst\00E5tt 1 feil')
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140967476065751923)
,p_name=>'FLOW.VALIDATION_ERROR'
,p_message_language=>'no'
,p_message_text=>unistr('Det har oppst\00E5tt %0 feil')
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140912819639751907)
,p_name=>'FORM_OF'
,p_message_language=>'no'
,p_message_text=>'%0 av %1'
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140951820594751919)
,p_name=>'GO'
,p_message_language=>'no'
,p_message_text=>unistr('S\00F8k')
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141054079882751949)
,p_name=>'HELP'
,p_message_language=>'no'
,p_message_text=>'Hjelp'
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140895123043751902)
,p_name=>'HOME'
,p_message_language=>'no'
,p_message_text=>'Start'
,p_is_js_message=>true
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140933496874751913)
,p_name=>'HOUR'
,p_message_language=>'no'
,p_message_text=>'time'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140933513570751913)
,p_name=>'HOURS'
,p_message_language=>'no'
,p_message_text=>'timer'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140914943953751908)
,p_name=>'ICON'
,p_message_language=>'no'
,p_message_text=>'Ikonet %0'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140892215547751901)
,p_name=>'ICON.EDITOR.CROP.HELP'
,p_message_language=>'no'
,p_message_text=>unistr('Hjelp til beskj\00E6ring av ikon')
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140893420311751901)
,p_name=>'ICON.EDITOR.CROPPER.HELPTEXT'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Dra ikonet, og bruk zoomglidebryteren hvis du vil omplassere det inne i rammen.</p>',
'',
unistr('<p>N\00E5r et nytt ikon lastes, endres st\00F8rrelsen p\00E5 det slik at det passer til tre formater: favorittikon, lite ikon og stort ikon.</p>'),
'',
unistr('<p>N\00E5r fokus er p\00E5 ikonbeskj\00E6ringsverkt\00F8yet, er f\00F8lgende tastatursnarveier tilgjengelige:</p>'),
'<ul>',
'    <li>Pil venstre: Flytt bilde mot venstre*</li>',
'    <li>Pil opp: Flytt bilde opp*</li>',
unistr('    <li>Pil h\00F8yre: Flytt bilde mot h\00F8yre*</li>'),
'    <li>Pil ned: Flytt bilde ned*</li>',
'    <li>I: Zoom inn</li>',
'    <li>O: Zoom ut</li>',
'    <li>L: Roter mot venstre</li>',
unistr('    <li>R: Roter mot h\00F8yre</li>'),
'</ul>',
'',
'<p class="margin-top-md"><em>*Hold Skift hvis du vil flytte raskere</em></p>'))
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140898976553751903)
,p_name=>'ICON.EDITOR.CROPPER.SUBTITLE'
,p_message_language=>'no'
,p_message_text=>'Dra hvis du vil omplassere ikonet'
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140899099075751903)
,p_name=>'ICON.EDITOR.CROPPER.ZOOM_SLIDER_LABEL'
,p_message_language=>'no'
,p_message_text=>unistr('Flytt glidebryteren hvis du vil justere zoomniv\00E5et')
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140892082994751901)
,p_name=>'ICON.EDITOR.DIALOG.TITLE'
,p_message_language=>'no'
,p_message_text=>'Rediger applikasjonsikon'
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140892335577751901)
,p_name=>'ICON.EDITOR.ERROR.SAVING'
,p_message_language=>'no'
,p_message_text=>'Feil ved lagring av ikon'
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140974761499751925)
,p_name=>'ICON.EDITOR.LEGACY_DATA'
,p_message_language=>'no'
,p_message_text=>'<p><span class="a-Icon icon-tr-warning"></span> Denne applikasjonen bruker eldre ikoner. Hvis et nytt ikon lastes, erstattes alle eldre ikoner.</p>'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140892980409751901)
,p_name=>'ICON.EDITOR.UPLOAD.ICON'
,p_message_language=>'no'
,p_message_text=>'Last et nytt ikon'
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140969180245751924)
,p_name=>'INVALID_CREDENTIALS'
,p_message_language=>'no'
,p_message_text=>unistr('Ugyldige p\00E5loggingsopplysninger')
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141070217551751954)
,p_name=>'INVALID_VALUE_FOR_PARAMETER'
,p_message_language=>'no'
,p_message_text=>'Ugyldig verdi for parameteren: %0'
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140963471489751922)
,p_name=>'IR_AS_DEFAULT_REPORT_SETTING'
,p_message_language=>'no'
,p_message_text=>'Som standardrapportinnstillinger'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140963539060751922)
,p_name=>'IR_AS_NAMED_REPORT'
,p_message_language=>'no'
,p_message_text=>'Som navngitt rapport'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140945411727751917)
,p_name=>'IR_ERROR'
,p_message_language=>'no'
,p_message_text=>'%0-feil. %1'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140945169373751917)
,p_name=>'IR_FRM_NAV_ERROR'
,p_message_language=>'no'
,p_message_text=>'Kan ikke beregne skjermbildenavigering. %0'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140920752820751909)
,p_name=>'IR_NOT_FOUND'
,p_message_language=>'no'
,p_message_text=>'Finner ikke interaktiv rapport.'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140920146006751909)
,p_name=>'IR_REGION_NOT_EXIST'
,p_message_language=>'no'
,p_message_text=>unistr('Omr\00E5de for interaktiv rapport finnes ikke i applikasjonen %0, side %1 og omr\00E5det %2.')
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140963303746751922)
,p_name=>'IR_STAR'
,p_message_language=>'no'
,p_message_text=>'Vises bare for utviklere'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140951568267751918)
,p_name=>'IR_UNIQUE_KEY_ERROR'
,p_message_language=>'no'
,p_message_text=>unistr('Rapportsp\00F8rringen m\00E5 ha en unik n\00F8kkel for identifikasjon av hver rad. Den angitte n\00F8kkelen kan ikke brukes til denne sp\00F8rringen. Definer en kolonne for unik n\00F8kkel. %0')
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140951626377751919)
,p_name=>'IR_UNIQUE_KEY_ERROR2'
,p_message_language=>'no'
,p_message_text=>unistr('Rapportsp\00F8rringen m\00E5 ha en unik n\00F8kkel for identifikasjon av hver rad. Den angitte n\00F8kkelen kan ikke brukes til denne sp\00F8rringen. Rediger rapportattributtene slik at du definerer en kolonne for unik n\00F8kkel. %0')
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140992597987751931)
,p_name=>'ITEM.FILE_UPLOAD.CHOOSE_FILE'
,p_message_language=>'no'
,p_message_text=>'Velg fil'
,p_is_js_message=>true
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140992451845751931)
,p_name=>'ITEM.FILE_UPLOAD.DRAG_DROP_FILE_HERE'
,p_message_language=>'no'
,p_message_text=>'Dra filen og slipp den her eller'
,p_is_js_message=>true
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140913116468751907)
,p_name=>'ITEMS'
,p_message_language=>'no'
,p_message_text=>'Elementer'
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140946827299751917)
,p_name=>'ITEM_VALUE'
,p_message_language=>'no'
,p_message_text=>'Elementverdi'
,p_version_scn=>2705233
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140961410397751921)
,p_name=>'LABEL'
,p_message_language=>'no'
,p_message_text=>'Etikett'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140974007077751925)
,p_name=>'LANGUAGE'
,p_message_language=>'no'
,p_message_text=>unistr('Spr\00E5k')
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140934100192751913)
,p_name=>'LAST'
,p_message_language=>'no'
,p_message_text=>'siste'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140910168682751906)
,p_name=>'LENGTH'
,p_message_language=>'no'
,p_message_text=>'Lengde'
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140968419015751923)
,p_name=>'LOGIN'
,p_message_language=>'no'
,p_message_text=>unistr('Logg p\00E5')
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141010006397751936)
,p_name=>'MANAGE'
,p_message_language=>'no'
,p_message_text=>'Administrer'
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141073163605751955)
,p_name=>'MAXIMIZE'
,p_message_language=>'no'
,p_message_text=>'Maksimer'
,p_is_js_message=>true
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140933223334751913)
,p_name=>'MINUTE'
,p_message_language=>'no'
,p_message_text=>'minutt'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140933354159751913)
,p_name=>'MINUTES'
,p_message_language=>'no'
,p_message_text=>'minutter'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141025323915751940)
,p_name=>'MISSING_AT'
,p_message_language=>'no'
,p_message_text=>'Mangler "@" i e-postadressen.'
,p_version_scn=>2705246
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141025536626751940)
,p_name=>'MISSING_DIALOG_PAGE_TEMPLATE_WARNING'
,p_message_language=>'no'
,p_message_text=>'Advarsel: Det er ikke definert noen mal for dialogbokssider for dialogbokssiden %0 i applikasjonen %1.'
,p_version_scn=>2705246
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141025212003751940)
,p_name=>'MISSING_DOT'
,p_message_language=>'no'
,p_message_text=>'Mangler "." i e-postadressedomenet.'
,p_version_scn=>2705246
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140971539054751924)
,p_name=>'MODULE'
,p_message_language=>'no'
,p_message_text=>'Modul'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140925737727751911)
,p_name=>'MONTH'
,p_message_language=>'no'
,p_message_text=>unistr('M\00E5ned')
,p_version_scn=>2705229
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140929631334751912)
,p_name=>'MONTHLY'
,p_message_language=>'no'
,p_message_text=>unistr('M\00E5nedlig')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140925827759751911)
,p_name=>'MONTHS'
,p_message_language=>'no'
,p_message_text=>unistr('m\00E5neder')
,p_version_scn=>2705229
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140961002399751921)
,p_name=>'MOVE'
,p_message_language=>'no'
,p_message_text=>'Flytt'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141031883389751942)
,p_name=>'MOVE_FROM'
,p_message_language=>'no'
,p_message_text=>'Flytt fra'
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141031926904751942)
,p_name=>'MOVE_TO'
,p_message_language=>'no'
,p_message_text=>'Flytt til'
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140948015571751917)
,p_name=>'MRU.ERROR_IN_MRD'
,p_message_language=>'no'
,p_message_text=>'Feil i sletteoperasjon for flere rader: rad = %0, %1, %2'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140947038320751917)
,p_name=>'MUST_NOT_BE_PUBLIC_USER'
,p_message_language=>'no'
,p_message_text=>unistr('Kan ikke v\00E6re offentlig bruker')
,p_version_scn=>2705233
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140895671666751902)
,p_name=>'NAME'
,p_message_language=>'no'
,p_message_text=>'Navn'
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140961290994751921)
,p_name=>'NEW'
,p_message_language=>'no'
,p_message_text=>'Ny(tt)'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140925591752751911)
,p_name=>'NEW_ACCOUNT_LOGIN_INSTRUCTIONS'
,p_message_language=>'no'
,p_message_text=>unistr('Du kan logge p\00E5 %0 ved \00E5 g\00E5 til:')
,p_version_scn=>2705229
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140925612240751911)
,p_name=>'NEW_ACCOUNT_NOTIFICATION'
,p_message_language=>'no'
,p_message_text=>'Varsling om ny %0-konto'
,p_version_scn=>2705229
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141054277260751949)
,p_name=>'NEXT'
,p_message_language=>'no'
,p_message_text=>'Neste'
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140971452828751924)
,p_name=>'NO'
,p_message_language=>'no'
,p_message_text=>'Nei'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141068325383751954)
,p_name=>'NOBODY'
,p_message_language=>'no'
,p_message_text=>'ingen'
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140934571377751913)
,p_name=>'NOT'
,p_message_language=>'no'
,p_message_text=>'Ikke'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140977406749751926)
,p_name=>'NOT_NULL'
,p_message_language=>'no'
,p_message_text=>'Ikke null'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140947177112751917)
,p_name=>'NOT_W_ARGUMENT'
,p_message_language=>'no'
,p_message_text=>'Ikke %0'
,p_version_scn=>2705233
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140966919981751923)
,p_name=>'NO_DATA_FOUND'
,p_message_language=>'no'
,p_message_text=>'ingen data funnet'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140976905031751926)
,p_name=>'NO_UPDATEABLE_REPORT_FOUND'
,p_message_language=>'no'
,p_message_text=>unistr('Finner ingen rapport som kan oppdateres. Operasjoner med oppdatering og sletting av flere rader kan bare utf\00F8res p\00E5 tabellskjermbilder av typen Oppdaterbar rapport.')
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140977832509751926)
,p_name=>'OK'
,p_message_language=>'no'
,p_message_text=>'OK'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140973133431751925)
,p_name=>'ORACLE_APPLICATION_EXPRESS'
,p_message_language=>'no'
,p_message_text=>'Oracle APEX'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141072071512751955)
,p_name=>'ORA_06550'
,p_message_language=>'no'
,p_message_text=>'ORA-06550: linje %0, kolonne %1'
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141022998818751940)
,p_name=>'OUTDATED_BROWSER'
,p_message_language=>'no'
,p_message_text=>unistr('Du bruker en foreldet nettleser. Hvis du vil ha en liste over st\00F8ttede nettlesere, kan du se Oracle APEX Installation Guide.')
,p_version_scn=>2705245
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140917938284751908)
,p_name=>'OUT_OF_RANGE'
,p_message_language=>'no'
,p_message_text=>'Et ugyldig sett av rader er forespurt. Kildedataene for rapporten er endret.'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140939928186751915)
,p_name=>'P.VALID_PAGE_ERR'
,p_message_language=>'no'
,p_message_text=>unistr('Du m\00E5 angi et gyldig sidetall, for eksempel p?n=1234.')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140944122109751916)
,p_name=>'PAGINATION.NEXT'
,p_message_language=>'no'
,p_message_text=>'Neste'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140944240247751916)
,p_name=>'PAGINATION.NEXT_SET'
,p_message_language=>'no'
,p_message_text=>'Neste sett'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140944306891751916)
,p_name=>'PAGINATION.PREVIOUS'
,p_message_language=>'no'
,p_message_text=>'Forrige'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140944458354751916)
,p_name=>'PAGINATION.PREVIOUS_SET'
,p_message_language=>'no'
,p_message_text=>'Forrige sett'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141054131398751949)
,p_name=>'PAGINATION.SELECT'
,p_message_language=>'no'
,p_message_text=>'Velg paginering'
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140984113065751928)
,p_name=>'PASSWORD'
,p_message_language=>'no'
,p_message_text=>'Passord'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140924808593751911)
,p_name=>'PASSWORD_CHANGED'
,p_message_language=>'no'
,p_message_text=>'Passordet for %0 er endret.'
,p_version_scn=>2705228
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140912577727751907)
,p_name=>'PASSWORD_COMPLEXITY_ERROR'
,p_message_language=>'no'
,p_message_text=>'Passordet oppfyller ikke dette nettstedets regler for passordkompleksitet.'
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140911604081751907)
,p_name=>'PASSWORD_DIFFERS_BY_ERR'
,p_message_language=>'no'
,p_message_text=>unistr('Nytt passord m\00E5 ha minst %0 tegn som er forskjellige fra gammelt passord.')
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140912230490751907)
,p_name=>'PASSWORD_LIKE_USERNAME_ERR'
,p_message_language=>'no'
,p_message_text=>'Passordet kan ikke inneholde brukernavnet.'
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140912452114751907)
,p_name=>'PASSWORD_LIKE_WORDS_ERR'
,p_message_language=>'no'
,p_message_text=>'Passordet inneholder et forbudt enkelt ord.'
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140912366020751907)
,p_name=>'PASSWORD_LIKE_WORKSPACE_NAME_ERR'
,p_message_language=>'no'
,p_message_text=>unistr('Passordet kan ikke inneholde navnet p\00E5 arbeidsomr\00E5det.')
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140911584353751907)
,p_name=>'PASSWORD_MIN_LEN_ERR'
,p_message_language=>'no'
,p_message_text=>unistr('Passordet m\00E5 inneholde minst %0 tegn.')
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140911701809751907)
,p_name=>'PASSWORD_ONE_ALPHA_ERR'
,p_message_language=>'no'
,p_message_text=>unistr('Passordet m\00E5 inneholde minst ett alfabetisk tegn (%0).')
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140912123901751907)
,p_name=>'PASSWORD_ONE_LOWER_ERR'
,p_message_language=>'no'
,p_message_text=>unistr('Passordet m\00E5 inneholde minst \00E9n liten bokstav.')
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140911824766751907)
,p_name=>'PASSWORD_ONE_NUMERIC_ERR'
,p_message_language=>'no'
,p_message_text=>unistr('Passordet m\00E5 inneholde minst ett numerisk tegn (0123456789).')
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140911945767751907)
,p_name=>'PASSWORD_ONE_PUNCTUATION_ERR'
,p_message_language=>'no'
,p_message_text=>unistr('Passordet m\00E5 inneholde minst ett skilletegn (%0).')
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140912021471751907)
,p_name=>'PASSWORD_ONE_UPPER_ERR'
,p_message_language=>'no'
,p_message_text=>unistr('Passordet m\00E5 inneholde minst \00E9n stor bokstav.')
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140925360903751911)
,p_name=>'PASSWORD_RESET_NOTIFICATION'
,p_message_language=>'no'
,p_message_text=>'Varsling om tilbakestilling av passord'
,p_version_scn=>2705228
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140910428347751906)
,p_name=>'PASSWORD_REUSE_ERROR'
,p_message_language=>'no'
,p_message_text=>unistr('Passordet kan ikke brukes fordi det er brukt i l\00F8pet av de siste %0 dagene.')
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140907109354751905)
,p_name=>'PCT_GRAPH_ARIA_LABEL'
,p_message_language=>'no'
,p_message_text=>'Prosentdiagram'
,p_is_js_message=>true
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140998746678751932)
,p_name=>'PE.COMPONEN.TYPE.PAGE_ITEM.PLURAL'
,p_message_language=>'no'
,p_message_text=>'Elementer'
,p_version_scn=>2705241
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140998857920751932)
,p_name=>'PE.COMPONEN.TYPE.PAGE_ITEM.SINGULAR'
,p_message_language=>'no'
,p_message_text=>'Element'
,p_version_scn=>2705241
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140972940814751925)
,p_name=>'PERCENT'
,p_message_language=>'no'
,p_message_text=>'Prosent'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140942231026751916)
,p_name=>'PLEASE_CONTACT_ADMINISTRATOR'
,p_message_language=>'no'
,p_message_text=>'Ta kontakt med administratoren.'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141054303973751949)
,p_name=>'PREVIOUS'
,p_message_language=>'no'
,p_message_text=>'Forrige'
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140990913610751930)
,p_name=>'PRINT'
,p_message_language=>'no'
,p_message_text=>'Skriv ut'
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140971775009751924)
,p_name=>'PRIVILEGES'
,p_message_language=>'no'
,p_message_text=>'Privilegier'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140940364049751915)
,p_name=>'REGIOIN_REFERENCES'
,p_message_language=>'no'
,p_message_text=>unistr('Omr\00E5dereferanser')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140961343541751921)
,p_name=>'REPORT'
,p_message_language=>'no'
,p_message_text=>'Rapport'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140971608134751924)
,p_name=>'REPORTING_PERIOD'
,p_message_language=>'no'
,p_message_text=>'Rapporteringsperiode'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141054540164751949)
,p_name=>'REPORT_LABEL'
,p_message_language=>'no'
,p_message_text=>'Rapport: %0'
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140972325172751925)
,p_name=>'REPORT_TOTAL'
,p_message_language=>'no'
,p_message_text=>'Rapportsum'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140918089857751909)
,p_name=>'RESET'
,p_message_language=>'no'
,p_message_text=>'Tilbakestill paginering'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140946731601751917)
,p_name=>'RESET_PAGINATION'
,p_message_language=>'no'
,p_message_text=>'Tilbakestill paginering'
,p_version_scn=>2705233
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140976820423751926)
,p_name=>'RESET_PASSWORD'
,p_message_language=>'no'
,p_message_text=>'Tilbakestill passord'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140952644489751919)
,p_name=>'RESTORE'
,p_message_language=>'no'
,p_message_text=>'Gjenopprett'
,p_is_js_message=>true
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140986285972751929)
,p_name=>'RESULTS'
,p_message_language=>'no'
,p_message_text=>'Resultater'
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140977937252751926)
,p_name=>'RETURN_TO_APPLICATION'
,p_message_language=>'no'
,p_message_text=>unistr('G\00E5 tilbake til applikasjonen.')
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140978372860751926)
,p_name=>'RIGHT'
,p_message_language=>'no'
,p_message_text=>unistr('H\00F8yre')
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141010392510751936)
,p_name=>'ROW'
,p_message_language=>'no'
,p_message_text=>'Rad - %0'
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140960939156751921)
,p_name=>'ROW_COUNT'
,p_message_language=>'no'
,p_message_text=>'Antall rader'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140850760997751889)
,p_name=>'RW_AO_ASK_ORACLE'
,p_message_language=>'no'
,p_message_text=>unistr('Sp\00F8r Oracle')
,p_is_js_message=>true
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140851033311751889)
,p_name=>'RW_AO_CLOSE_ASK_ORACLE'
,p_message_language=>'no'
,p_message_text=>unistr('Lukk Sp\00F8r Oracle')
,p_is_js_message=>true
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140851384699751889)
,p_name=>'RW_AO_NOTIFICATIONS_LIST'
,p_message_language=>'no'
,p_message_text=>'Varslingsliste'
,p_is_js_message=>true
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140850942786751889)
,p_name=>'RW_AO_OPEN_ASK_ORACLE'
,p_message_language=>'no'
,p_message_text=>unistr('\00C5pne Sp\00F8r Oracle')
,p_is_js_message=>true
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140851258705751889)
,p_name=>'RW_AO_PRODUCT_MAP'
,p_message_language=>'no'
,p_message_text=>'Produktkart'
,p_is_js_message=>true
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140851150656751889)
,p_name=>'RW_AO_SUGGESTIONS_LIST'
,p_message_language=>'no'
,p_message_text=>'Forslagsliste'
,p_is_js_message=>true
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140852072342751889)
,p_name=>'RW_CLEAR'
,p_message_language=>'no'
,p_message_text=>'Nullstill'
,p_is_js_message=>true
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140851901979751889)
,p_name=>'RW_CLOSE'
,p_message_language=>'no'
,p_message_text=>'Lukk'
,p_is_js_message=>true
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140851739973751889)
,p_name=>'RW_FO_VIEW_MORE'
,p_message_language=>'no'
,p_message_text=>'Vis mer'
,p_is_js_message=>true
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140852194136751889)
,p_name=>'RW_GO_TO'
,p_message_language=>'no'
,p_message_text=>unistr('G\00E5 til')
,p_is_js_message=>true
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140851596470751889)
,p_name=>'RW_GP_STEP'
,p_message_language=>'no'
,p_message_text=>'Trinn'
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140851673323751889)
,p_name=>'RW_GP_STEP_OF'
,p_message_language=>'no'
,p_message_text=>'av'
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140851490755751889)
,p_name=>'RW_GP_TOGGLE_STEPS'
,p_message_language=>'no'
,p_message_text=>'Vis/skjul trinn'
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140850506509751889)
,p_name=>'RW_HIDE_PASSWORD'
,p_message_language=>'no'
,p_message_text=>'Skjul passord'
,p_is_js_message=>true
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140851807735751889)
,p_name=>'RW_OPEN'
,p_message_language=>'no'
,p_message_text=>unistr('\00C5pne')
,p_is_js_message=>true
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140850392013751889)
,p_name=>'RW_ORACLE'
,p_message_language=>'no'
,p_message_text=>'Oracle'
,p_is_js_message=>true
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140850490681751889)
,p_name=>'RW_SHOW_PASSWORD'
,p_message_language=>'no'
,p_message_text=>'Vis passord'
,p_is_js_message=>true
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140852252626751889)
,p_name=>'RW_START'
,p_message_language=>'no'
,p_message_text=>'Start'
,p_is_js_message=>true
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140977381950751926)
,p_name=>'SAVE'
,p_message_language=>'no'
,p_message_text=>'Lagre'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140973544841751925)
,p_name=>'SAVED_REPORTS.ALTERNATIVE.DEFAULT'
,p_message_language=>'no'
,p_message_text=>'Alternativ standard'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140973993070751925)
,p_name=>'SAVED_REPORTS.DESCRIPTION'
,p_message_language=>'no'
,p_message_text=>'Beskrivelse'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140973427430751925)
,p_name=>'SAVED_REPORTS.PRIMARY.DEFAULT'
,p_message_language=>'no'
,p_message_text=>unistr('Prim\00E6r standard')
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140974236276751925)
,p_name=>'SC_REPORT_ROWS'
,p_message_language=>'no'
,p_message_text=>unistr('Mer enn %0 rader er tilgjengelige. \00D8k radvelgeren hvis du vil vise flere rader.')
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141041676137751945)
,p_name=>'SEARCH'
,p_message_language=>'no'
,p_message_text=>unistr('S\00F8k')
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140933184229751913)
,p_name=>'SECONDS'
,p_message_language=>'no'
,p_message_text=>'sekunder'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140973066942751925)
,p_name=>'SEE_ATTACHED'
,p_message_language=>'no'
,p_message_text=>'Se vedlegg'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141033636407751943)
,p_name=>'SELECT_ROW'
,p_message_language=>'no'
,p_message_text=>'Velg rad'
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140972773647751925)
,p_name=>'SET_SCREEN_READER_MODE_OFF'
,p_message_language=>'no'
,p_message_text=>unistr('Sl\00E5 av skjermlesermodus')
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140972817050751925)
,p_name=>'SET_SCREEN_READER_MODE_ON'
,p_message_language=>'no'
,p_message_text=>unistr('Sl\00E5 p\00E5 skjermlesermodus')
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140969077659751924)
,p_name=>'SHOW'
,p_message_language=>'no'
,p_message_text=>'Vis'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141035452625751943)
,p_name=>'SHOW_ALL'
,p_message_language=>'no'
,p_message_text=>'Vis alle'
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141060267148751951)
,p_name=>'SIGN_IN'
,p_message_language=>'no'
,p_message_text=>unistr('Logg p\00E5')
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141011123544751936)
,p_name=>'SIGN_OUT'
,p_message_language=>'no'
,p_message_text=>'Logg av'
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140961969991751922)
,p_name=>'SINCE_DAYS_AGO'
,p_message_language=>'no'
,p_message_text=>'For %0 dager siden'
,p_is_js_message=>true
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140969587411751924)
,p_name=>'SINCE_DAYS_FROM_NOW'
,p_message_language=>'no'
,p_message_text=>unistr('%0 dager fra n\00E5')
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140961804531751922)
,p_name=>'SINCE_HOURS_AGO'
,p_message_language=>'no'
,p_message_text=>'For %0 timer siden'
,p_is_js_message=>true
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140969477868751924)
,p_name=>'SINCE_HOURS_FROM_NOW'
,p_message_language=>'no'
,p_message_text=>unistr('%0 timer fra n\00E5')
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140961762016751922)
,p_name=>'SINCE_MINUTES_AGO'
,p_message_language=>'no'
,p_message_text=>'For %0 minutter siden'
,p_is_js_message=>true
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140969328614751924)
,p_name=>'SINCE_MINUTES_FROM_NOW'
,p_message_language=>'no'
,p_message_text=>unistr('%0 minutter fra n\00E5')
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140962102742751922)
,p_name=>'SINCE_MONTHS_AGO'
,p_message_language=>'no'
,p_message_text=>unistr('For %0 m\00E5neder siden')
,p_is_js_message=>true
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140969747177751924)
,p_name=>'SINCE_MONTHS_FROM_NOW'
,p_message_language=>'no'
,p_message_text=>unistr('%0 m\00E5neder fra n\00E5')
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140969982314751924)
,p_name=>'SINCE_NOW'
,p_message_language=>'no'
,p_message_text=>unistr('N\00E5')
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140961646015751921)
,p_name=>'SINCE_SECONDS_AGO'
,p_message_language=>'no'
,p_message_text=>'For %0 sekunder siden'
,p_is_js_message=>true
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140969239386751924)
,p_name=>'SINCE_SECONDS_FROM_NOW'
,p_message_language=>'no'
,p_message_text=>unistr('%0 sekunder fra n\00E5')
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140962046207751922)
,p_name=>'SINCE_WEEKS_AGO'
,p_message_language=>'no'
,p_message_text=>'For %0 uker siden'
,p_is_js_message=>true
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140969671091751924)
,p_name=>'SINCE_WEEKS_FROM_NOW'
,p_message_language=>'no'
,p_message_text=>unistr('%0 uker fra n\00E5')
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140962236150751922)
,p_name=>'SINCE_YEARS_AGO'
,p_message_language=>'no'
,p_message_text=>unistr('For %0 \00E5r siden')
,p_is_js_message=>true
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140969807016751924)
,p_name=>'SINCE_YEARS_FROM_NOW'
,p_message_language=>'no'
,p_message_text=>unistr('%0 \00E5r fra n\00E5')
,p_is_js_message=>true
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140955716781751920)
,p_name=>'STANDARD'
,p_message_language=>'no'
,p_message_text=>'Standard'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140972628668751925)
,p_name=>'START_DATE'
,p_message_language=>'no'
,p_message_text=>'Startdato'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140907884258751905)
,p_name=>'SUBSCRIPTION_CREATED_BY'
,p_message_language=>'no'
,p_message_text=>'Du mottar denne e-posten fra et abonnement for interaktive rapporter opprettet av %0.'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141069463940751954)
,p_name=>'SUBSCRIPTION_REFERENCES'
,p_message_language=>'no'
,p_message_text=>'Abonnementer'
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141018852206751938)
,p_name=>'TAB'
,p_message_language=>'no'
,p_message_text=>'Tabulator'
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140933049322751913)
,p_name=>'TITLE'
,p_message_language=>'no'
,p_message_text=>'Tittel'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140912716454751907)
,p_name=>'TODAY'
,p_message_language=>'no'
,p_message_text=>'I dag'
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140972205449751925)
,p_name=>'TOTAL'
,p_message_language=>'no'
,p_message_text=>'Totalt'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140914058342751907)
,p_name=>'TO_MANY_COLUMNS_SELECTED'
,p_message_language=>'no'
,p_message_text=>'Maksimalt %0 kolonner kan velges.'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140869826512751894)
,p_name=>'TREE.COLLAPSE_ALL'
,p_message_language=>'no'
,p_message_text=>'Trekk sammen alle'
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140870489259751894)
,p_name=>'TREE.COLLAPSE_ALL_BELOW'
,p_message_language=>'no'
,p_message_text=>'Trekk sammen alle nedenfor'
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140869499359751894)
,p_name=>'TREE.EXPAND_ALL'
,p_message_language=>'no'
,p_message_text=>'Utvid alle'
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140870106939751894)
,p_name=>'TREE.EXPAND_ALL_BELOW'
,p_message_language=>'no'
,p_message_text=>'Utvid alle nedenfor'
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140870610484751895)
,p_name=>'TREE.REPARENT'
,p_message_language=>'no'
,p_message_text=>unistr('Overordne p\00E5 nytt')
,p_is_js_message=>true
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140992797677751931)
,p_name=>'TREES'
,p_message_language=>'no'
,p_message_text=>unistr('Tr\00E6r')
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141035566924751943)
,p_name=>'UI.FORM.REQUIRED'
,p_message_language=>'no'
,p_message_text=>'Obligatorisk'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140956421726751920)
,p_name=>'UNAUTHORIZED'
,p_message_language=>'no'
,p_message_text=>'Uautorisert'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141006607058751935)
,p_name=>'UNAVAILABLE'
,p_message_language=>'no'
,p_message_text=>'Utilgjengelig'
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140970308401751924)
,p_name=>'UNKNOWN'
,p_message_language=>'no'
,p_message_text=>'Ukjent'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140908790787751906)
,p_name=>'UNKNOWN_AUTHENTICATION_ERROR'
,p_message_language=>'no'
,p_message_text=>unistr('Det har oppst\00E5tt en ukjent autentiseringsfeil.')
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140910970356751906)
,p_name=>'UNSUBSCRIBE_SUBSCRIPTION_MSG_HTML'
,p_message_language=>'no'
,p_message_text=>unistr('Hvis du ikke lenger \00F8nsker \00E5 motta e-postmeldinger, kan du klikke p\00E5 <a href="%0">Avslutt abonnement</a> og administrere abonnementet.')
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140907740292751905)
,p_name=>'UNSUBSCRIBE_SUBSCRIPTION_MSG_TXT'
,p_message_language=>'no'
,p_message_text=>unistr('Hvis du ikke lenger \00F8nsker \00E5 motta e-postmeldinger, kan du g\00E5 til f\00F8lgende URL-adresse og administrere abonnementet:')
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140947256010751917)
,p_name=>'UNSUPPORTED_DATA_TYPE'
,p_message_language=>'no'
,p_message_text=>unistr('ikke-st\00F8ttet datatype')
,p_version_scn=>2705233
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140934300435751913)
,p_name=>'UPDATE'
,p_message_language=>'no'
,p_message_text=>'oppdater'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140932933169751913)
,p_name=>'UPDATED'
,p_message_language=>'no'
,p_message_text=>'Oppdatert'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140876192753751896)
,p_name=>'UPGRADE_IN_PROGRESS'
,p_message_language=>'no'
,p_message_text=>unistr('Oppgradering p\00E5g\00E5r')
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140876474596751896)
,p_name=>'UPGRADE_IN_PROGRESS_DETAIL'
,p_message_language=>'no'
,p_message_text=>unistr('Oracle APEX er i ferd med \00E5 bli oppgradert til en nyere versjon. Denne prosessen kan ta opptil tre minutter.')
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140939723965751915)
,p_name=>'URL_PROHIBITED'
,p_message_language=>'no'
,p_message_text=>'Den forespurte URL-adressen kan ikke brukes. Ta kontakt med administratoren.'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140960894726751921)
,p_name=>'USER'
,p_message_language=>'no'
,p_message_text=>'Bruker'
,p_version_scn=>2705236
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140984015424751928)
,p_name=>'USERNAME'
,p_message_language=>'no'
,p_message_text=>'Brukernavn'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141025458307751940)
,p_name=>'USERNAME_TOO_LONG'
,p_message_language=>'no'
,p_message_text=>'Brukernavnet er for langt. Grensen er %0 tegn.'
,p_version_scn=>2705246
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140967963294751923)
,p_name=>'USERS'
,p_message_language=>'no'
,p_message_text=>'brukere'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141025060292751940)
,p_name=>'USER_EXISTS'
,p_message_language=>'no'
,p_message_text=>'Brukernavnet finnes allerede.'
,p_version_scn=>2705246
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141038839910751944)
,p_name=>'USER_PROFILE_IMAGE'
,p_message_language=>'no'
,p_message_text=>'Profilbilde for brukeren %0'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140900760219751903)
,p_name=>'UTILIZATION_REPORTS.AUTOMATION'
,p_message_language=>'no'
,p_message_text=>'Automatisering - %0'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140899218786751903)
,p_name=>'UTILIZATION_REPORTS.PAGE'
,p_message_language=>'no'
,p_message_text=>'Side %0 - %1 '
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140902132637751904)
,p_name=>'UTILIZATION_REPORTS.PLUG_NAME'
,p_message_language=>'no'
,p_message_text=>'%0 - %1'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140902266121751904)
,p_name=>'UTILIZATION_REPORTS.PROCESS_NAME'
,p_message_language=>'no'
,p_message_text=>'%0 - %1'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140901173813751904)
,p_name=>'UTILIZATION_REPORTS.SEARCH_CONFIG'
,p_message_language=>'no'
,p_message_text=>unistr('S\00F8kekonfigurasjon - %0')
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140901056564751904)
,p_name=>'UTILIZATION_REPORTS.SHARED_DYNAMIC_LOV'
,p_message_language=>'no'
,p_message_text=>'Delt dynamisk verdiliste - %0'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140900863098751903)
,p_name=>'UTILIZATION_REPORTS.TASK_DEFINITION'
,p_message_language=>'no'
,p_message_text=>unistr('Oppgavedefinisjon \2013 %0')
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140899309873751903)
,p_name=>'UTILIZATION_REPORTS.WORKFLOW'
,p_message_language=>'no'
,p_message_text=>'Arbeidsflyt - %0 '
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140921480702751910)
,p_name=>'VALID'
,p_message_language=>'no'
,p_message_text=>'Gyldig'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140913005179751907)
,p_name=>'VALIDATIONS'
,p_message_language=>'no'
,p_message_text=>'Valideringer'
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140973778899751925)
,p_name=>'VALUE_MUST_BE_SPECIFIED'
,p_message_language=>'no'
,p_message_text=>unistr('Verdi m\00E5 angis')
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141020036894751939)
,p_name=>'VALUE_MUST_BE_SPECIFIED_FOR'
,p_message_language=>'no'
,p_message_text=>unistr('Du m\00E5 angi en verdi for %0')
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140942696111751916)
,p_name=>'VERTICAL'
,p_message_language=>'no'
,p_message_text=>'loddrett'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140934216989751913)
,p_name=>'VIEW'
,p_message_language=>'no'
,p_message_text=>'vis'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140968071709751923)
,p_name=>'VIEWS'
,p_message_language=>'no'
,p_message_text=>'visninger'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140974563677751925)
,p_name=>'VIEW_ALL'
,p_message_language=>'no'
,p_message_text=>'Vis alle'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140914453114751907)
,p_name=>'VISUALLY_HIDDEN_LINK'
,p_message_language=>'no'
,p_message_text=>unistr('Visuelt skjult \2013 kobling')
,p_is_js_message=>true
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140955297442751920)
,p_name=>'WARNING'
,p_message_language=>'no'
,p_message_text=>'Advarsel'
,p_is_js_message=>true
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140933897077751913)
,p_name=>'WEEK'
,p_message_language=>'no'
,p_message_text=>'uke'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140929788582751912)
,p_name=>'WEEKLY'
,p_message_language=>'no'
,p_message_text=>'Ukentlig'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140933929931751913)
,p_name=>'WEEKS'
,p_message_language=>'no'
,p_message_text=>'uker'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140973883834751925)
,p_name=>'WELCOME_USER'
,p_message_language=>'no'
,p_message_text=>'Velkommen: %0'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140972022473751925)
,p_name=>'WWV_DBMS_SQL.INVALID_CLOB'
,p_message_language=>'no'
,p_message_text=>'Fant en ugyldig verdi, verifiser de angitte dataene.'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140972140306751925)
,p_name=>'WWV_DBMS_SQL.INVALID_DATATYPE'
,p_message_language=>'no'
,p_message_text=>'Fant en ugyldig verdi, verifiser de angitte dataene.'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140909942500751906)
,p_name=>'WWV_DBMS_SQL.INVALID_DATE'
,p_message_language=>'no'
,p_message_text=>'Fant en ugyldig datoverdi, verifiser datoformatet.'
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140971912481751925)
,p_name=>'WWV_DBMS_SQL.INVALID_NUMBER'
,p_message_language=>'no'
,p_message_text=>'Fant en ugyldig tallverdi, verifiser tallformatet.'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140921093007751909)
,p_name=>'WWV_DBMS_SQL.INVALID_TIMESTAMP'
,p_message_language=>'no'
,p_message_text=>'Fant en ugyldig tidsstempelverdi, verifiser tidsstempelformatet.'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140945513311751917)
,p_name=>'WWV_DBMS_SQL.UNABLE_TO_BIND_ERR'
,p_message_language=>'no'
,p_message_text=>unistr('Kan ikke binde %0. Bruk doble anf\00F8rselstegn for elementer med flere byte, eller verifiser at lengden p\00E5 elementet er 30 byte eller mindre. Bruk syntaksen v() for \00E5 referere til elementer som er lengre enn 30 byte.')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140935339404751914)
,p_name=>'WWV_FLOW.ACCESS_DENIED'
,p_message_language=>'no'
,p_message_text=>'Tilgang ble nektet av sikkerhetskontroll for %0'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140937824853751914)
,p_name=>'WWV_FLOW.APP_NOT_AVAILABLE'
,p_message_language=>'no'
,p_message_text=>'Applikasjonen er ikke tilgjengelig'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140936294078751914)
,p_name=>'WWV_FLOW.APP_NOT_FOUND_ERR'
,p_message_language=>'no'
,p_message_text=>'Finner ikke applikasjonen.'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140936365759751914)
,p_name=>'WWV_FLOW.APP_NOT_FOUND_FOOTER_ERR'
,p_message_language=>'no'
,p_message_text=>unistr('applikasjon=%0 arbeidsomr\00E5de=%1')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140936794607751914)
,p_name=>'WWV_FLOW.APP_RESTRICTED'
,p_message_language=>'no'
,p_message_text=>unistr('Tilgang til denne applikasjonen er begrenset. Pr\00F8v p\00E5 nytt senere.')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140936695828751914)
,p_name=>'WWV_FLOW.APP_RESTRICTED_TO_DEV'
,p_message_language=>'no'
,p_message_text=>unistr('Tilgang til denne applikasjonen er begrenset til applikasjonsutviklere. Pr\00F8v p\00E5 nytt senere.')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140935841826751914)
,p_name=>'WWV_FLOW.BRANCH_FUNC_RETURNING_URL_ERROR'
,p_message_language=>'no'
,p_message_text=>'ERR-7744 Kan ikke behandle retur-URL for forgrening til funksjon.'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140935700343751914)
,p_name=>'WWV_FLOW.BRANCH_TO_FUNCT_RET_PAGE_ERR'
,p_message_language=>'no'
,p_message_text=>'ERR-7744 Kan ikke behandle returside for forgrening til funksjon.'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140936071989751914)
,p_name=>'WWV_FLOW.CALL_TO_SHOW_FROM_PROC_ERR'
,p_message_language=>'no'
,p_message_text=>unistr('ERR-1430 Ikke-st\00F8ttet prosess for kall om visning fra side: G_FLOW_STEP_ID (%0).')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140937133162751914)
,p_name=>'WWV_FLOW.CLEAR_STEP_CACHE_ERR'
,p_message_language=>'no'
,p_message_text=>'ERR-1018 Feil ved nullstilling av trinnhurtigbuffer.'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140935566520751914)
,p_name=>'WWV_FLOW.COMP_UNKNOWN_ERR'
,p_message_language=>'no'
,p_message_text=>'ERR-1005 Ukjent beregningstype.'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140936441557751914)
,p_name=>'WWV_FLOW.CUSTOM_AUTH_SESSION_ERR'
,p_message_language=>'no'
,p_message_text=>unistr('ERR-1201 \00D8kt-ID er ikke angitt for egendefinert autentisering.')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140936583226751914)
,p_name=>'WWV_FLOW.CUSTOM_AUTH_SESSION_FOOTER_ERR'
,p_message_language=>'no'
,p_message_text=>'side=%0'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140936124808751914)
,p_name=>'WWV_FLOW.DET_COMPANY_ERR'
,p_message_language=>'no'
,p_message_text=>unistr('ERR-7620 Kan ikke bestemme arbeidsomr\00E5de for applikasjon (%0).')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140916613401751908)
,p_name=>'WWV_FLOW.EDIT'
,p_message_language=>'no'
,p_message_text=>'Rediger'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140935269390751914)
,p_name=>'WWV_FLOW.FIND_ITEM_ERR2'
,p_message_language=>'no'
,p_message_text=>'ERR-1802 Finner ikke element-ID-en %0'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140934905449751914)
,p_name=>'WWV_FLOW.FIND_ITEM_ID_ERR'
,p_message_language=>'no'
,p_message_text=>'ERR-1002 Finner ikke element-ID for elementet %0 i applikasjonen %1.'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140935056298751914)
,p_name=>'WWV_FLOW.FIND_ITEM_ID_ERR2'
,p_message_language=>'no'
,p_message_text=>unistr('Uventet feil. Finner ikke elementnavn p\00E5 applikasjons- eller sideniv\00E5.')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140935469850751914)
,p_name=>'WWV_FLOW.FIRST_PAGE_DATA_ERR'
,p_message_language=>'no'
,p_message_text=>unistr('Du er allerede p\00E5 f\00F8rste side av dataene.')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140951980389751919)
,p_name=>'WWV_FLOW.ITEM_POSTING_VIOLATION'
,p_message_language=>'no'
,p_message_text=>unistr('Element-ID-en (%0) viser ikke til et element som er definert p\00E5 den gjeldende siden.')
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140909528300751906)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.INTERNAL_ONLY'
,p_message_language=>'no'
,p_message_text=>unistr('Elementet kan ikke angis ved \00E5 sende argumenter til applikasjonen.')
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140909878250751906)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.NO_CHECKSUM'
,p_message_language=>'no'
,p_message_text=>'(Ingen kontrollsum er angitt)'
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140909386482751906)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.PRIVATE_BOOKMARK'
,p_message_language=>'no'
,p_message_text=>unistr('Elementet kan angis n\00E5r det finnes en kontrollsum av typen bokmerke p\00E5 brukerniv\00E5.')
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140909256335751906)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.PUBLIC_BOOKMARK'
,p_message_language=>'no'
,p_message_text=>unistr('Elementet kan angis n\00E5r det finnes en kontrollsum av typen bokmerke p\00E5 applikasjonsniv\00E5.')
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140909458076751906)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.SESSION'
,p_message_language=>'no'
,p_message_text=>unistr('Elementet kan angis n\00E5r det finnes en kontrollsum av typen \00F8kt.')
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140909135628751906)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.UNPROTECTED'
,p_message_language=>'no'
,p_message_text=>'Elementet har ingen beskyttelse.'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140937264608751914)
,p_name=>'WWV_FLOW.NO_PAGE_HELP'
,p_message_language=>'no'
,p_message_text=>'Ingen sidehjelp er tilgjengelig.'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140925162918751911)
,p_name=>'WWV_FLOW.NO_PRIV_ON_SCHEMA'
,p_message_language=>'no'
,p_message_text=>unistr('Arbeidsomr\00E5det %0 har ingen privilegier som skal analyseres som skjemaet %1.')
,p_version_scn=>2705228
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140935650709751914)
,p_name=>'WWV_FLOW.PAGE_ACCEPT_RECUR_ERR'
,p_message_language=>'no'
,p_message_text=>'ERR-1010 Overskredet grense for godtatt behandlingsrekursjon ved forgrening til side. %0'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140892155461751901)
,p_name=>'WWV_FLOW.PAGE_PATTERN_NOT_RUNNABLE'
,p_message_language=>'no'
,p_message_text=>unistr('Siden er utilgjengelig. Du kan ikke kj\00F8re et sidem\00F8nster.')
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140909758064751906)
,p_name=>'WWV_FLOW.PAGE_PROTECTION.SHOW_NO_URL_ALLOWED'
,p_message_language=>'no'
,p_message_text=>unistr('Denne siden kan ikke \00E5pnes ved hjelp av en URL-adresse eller ved \00E5 bruke GET eller POST til visningsprosedyren. Den m\00E5 anropes ved hjelp av forgreningstypen Forgren til side.')
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140994593038751931)
,p_name=>'WWV_FLOW.SAVE_ROUTINE_NUMERIC_ERR'
,p_message_language=>'no'
,p_message_text=>unistr('Feil ved fors\00F8k p\00E5 \00E5 lagre en ikke-numerisk verdi i elementet %0. ')
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140926857045751911)
,p_name=>'WWV_FLOW.SCHEMA_NOT_EXISTS'
,p_message_language=>'no'
,p_message_text=>'Applikasjonens analyseskjema, %0, finnes ikke i databasen.'
,p_version_scn=>2705229
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140926902315751911)
,p_name=>'WWV_FLOW.SERVICE_ADMIN_LINK'
,p_message_language=>'no'
,p_message_text=>unistr('Konti i INTERNAL-arbeidsomr\00E5det kan bare brukes til \00E5 f\00E5 tilgang til &PRODUCT_NAME. <a href="%0">Administration Services</a>.')
,p_version_scn=>2705229
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140934868984751914)
,p_name=>'WWV_FLOW.SESSION_INFO_ERR'
,p_message_language=>'no'
,p_message_text=>unistr('ERR-1029 Kan ikke lagre \00F8ktopplysninger. \00F8kt=%0 element=%1')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140937953616751914)
,p_name=>'WWV_FLOW.UNABLE_TO_STOP_TRACE_ERR'
,p_message_language=>'no'
,p_message_text=>'Kan ikke stoppe sporing: %0'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140935132581751914)
,p_name=>'WWV_FLOW.UNEXPECTED_ERR'
,p_message_language=>'no'
,p_message_text=>'Uventet feil'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140945977959751917)
,p_name=>'WWV_FLOW.UPDATE_SUB_ERR'
,p_message_language=>'no'
,p_message_text=>'Feil i update_substitution_cache: %0'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140938038951751914)
,p_name=>'WWV_FLOW.VIEW_HELP_ERR'
,p_message_language=>'no'
,p_message_text=>unistr('Applikasjon og side m\00E5 angis hvis du skal vise hjelp.')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140959794404751921)
,p_name=>'WWV_FLOW_AUTOMATION.AUTOMATION_NOT_FOUND'
,p_message_language=>'no'
,p_message_text=>'Finner ikke automatisering.'
,p_version_scn=>2705235
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140895293609751902)
,p_name=>'WWV_FLOW_AUTOMATION.QUERY_ERROR'
,p_message_language=>'no'
,p_message_text=>unistr('Feil i automatiseringssp\00F8rring: %0')
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140939137853751915)
,p_name=>'WWV_FLOW_CACHE.PURGE_SESSION'
,p_message_language=>'no'
,p_message_text=>unistr('Ryddet %0 \00F8kter.')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140880440000751897)
,p_name=>'WWV_FLOW_CODE_EXEC_MLE.LANGUAGE_NOT_SUPPORTED'
,p_message_language=>'no'
,p_message_text=>unistr('Kan ikke utf\00F8re %0-kode. Den st\00F8ttes ikke av databasen, eller den er ikke aktivert av forekomstparameteren MLE_LANGUAGES.')
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140878009747751897)
,p_name=>'WWV_FLOW_CODE_EXEC_MLE.MLE_NOT_SUPPORTED'
,p_message_language=>'no'
,p_message_text=>'Multilingual Engine er ikke tilgjengelig i denne databaseversjonen.'
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140917244175751908)
,p_name=>'WWV_FLOW_COLLECTION.ARRAY_NOT_NULL'
,p_message_language=>'no'
,p_message_text=>unistr('Applikasjonssamlingsmatrise kan ikke v\00E6re null')
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140917087062751908)
,p_name=>'WWV_FLOW_COLLECTION.ATTRIBUTE_NUMBER_OUTSIDE_RANGE'
,p_message_language=>'no'
,p_message_text=>unistr('Angitt medlemsattributtnummer, %0, er ugyldig. Attributtnumre m\00E5 v\00E6re mellom 1 og %1')
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140917547792751908)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_EXISTS'
,p_message_language=>'no'
,p_message_text=>'Applikasjonssamlingen finnes'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140917343414751908)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NAME_NOT_NULL'
,p_message_language=>'no'
,p_message_text=>unistr('Samlingsnavn kan ikke v\00E6re null')
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140917440901751908)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NAME_TOO_LARGE'
,p_message_language=>'no'
,p_message_text=>unistr('Navnet p\00E5 samlingen kan ikke v\00E6re st\00F8rre enn 255 tegn')
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140916828471751908)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NOT_EXIST'
,p_message_language=>'no'
,p_message_text=>'Applikasjonssamlingen %0 finnes ikke'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140917612047751908)
,p_name=>'WWV_FLOW_COLLECTION.CURSOR_NOT_OPEN'
,p_message_language=>'no'
,p_message_text=>unistr('Mark\00F8ren er ikke \00E5pen enn\00E5')
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140916908646751908)
,p_name=>'WWV_FLOW_COLLECTION.MEMBER_NOT_EXIST'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Medlemssekvensen %0 finnes ikke i applikasjonssamlingen %1',
''))
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140917177783751908)
,p_name=>'WWV_FLOW_COLLECTION.MEMBER_SEQUENCE_NUMBER_INVALID'
,p_message_language=>'no'
,p_message_text=>'Medlemssekvensen %0 finnes ikke i applikasjonssamlingen %1'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140869957256751894)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_ALGORITHM'
,p_message_language=>'no'
,p_message_text=>unistr('Algoritme, %0, st\00F8ttes ikke for ECDSA.')
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140869631664751894)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_EC_CURVE'
,p_message_language=>'no'
,p_message_text=>unistr('Elliptisk kurve, %0, st\00F8ttes ikke.')
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140995378554751931)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_FUNCTION'
,p_message_language=>'no'
,p_message_text=>unistr('Den kryptografiske funksjonen %0 st\00F8ttes ikke p\00E5 dette systemet.')
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141047631613751947)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_ACCESSIBLE'
,p_message_language=>'no'
,p_message_text=>'Tilgjengelighet er testet'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140938618998751915)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_CLOSE'
,p_message_language=>'no'
,p_message_text=>'Lukk'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140938759971751915)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_CUST_OPT'
,p_message_language=>'no'
,p_message_text=>'Valg for sidetilpasning'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140938837030751915)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_DEFAULT'
,p_message_language=>'no'
,p_message_text=>'Standard'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140938932243751915)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_DISP'
,p_message_language=>'no'
,p_message_text=>'Vist'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140939023341751915)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_HIDDEN'
,p_message_language=>'no'
,p_message_text=>'Skjult'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140938415360751915)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE1'
,p_message_language=>'no'
,p_message_text=>unistr('Merk av for omr\00E5dene du vil inkludere p\00E5 denne siden. Avmerkede omr\00E5der blir kanskje ikke vist hvis du ikke er i riktig applikasjonskontekst eller ikke har tilstrekkelige privilegier.')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140938595829751915)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE2'
,p_message_language=>'no'
,p_message_text=>'Denne siden kan ikke tilpasses.'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141047906844751947)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE3'
,p_message_language=>'no'
,p_message_text=>unistr('Du kan tilpasse utseendet p\00E5 denne applikasjonen ved \00E5 bytte temastil. Velg en temastil fra listen nedenfor, og klikk p\00E5 Bruk endringer.')
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141048758194751947)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_REGION_DISP'
,p_message_language=>'no'
,p_message_text=>unistr('Omr\00E5devisning')
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141047852779751947)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_REMOVE_STYLE'
,p_message_language=>'no'
,p_message_text=>'Bruk standardstil for applikasjonen'
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141047712914751947)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_THEME_STYLE'
,p_message_language=>'no'
,p_message_text=>'Utseende '
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140991955352751930)
,p_name=>'WWV_FLOW_DATA_EXPORT.AGG_COLUMN_IDX_NOT_EXIST'
,p_message_language=>'no'
,p_message_text=>'Kolonneindeksen det refereres til i aggregeringen %0, finnes ikke.'
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140884649568751899)
,p_name=>'WWV_FLOW_DATA_EXPORT.APPEND_NOT_SUPPORTED'
,p_message_language=>'no'
,p_message_text=>unistr('Tilf\00F8yelse av dataeksporten st\00F8ttes ikke for %0-format.')
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140847608753751888)
,p_name=>'WWV_FLOW_DATA_EXPORT.CLOB_NOT_SUPPORTED'
,p_message_language=>'no'
,p_message_text=>unistr('CLOB-utdata st\00F8ttes ikke for %0-format.')
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140991652554751930)
,p_name=>'WWV_FLOW_DATA_EXPORT.COLUMN_BREAK_MUST_BE_IN_THE_BEGGINING'
,p_message_language=>'no'
,p_message_text=>unistr('Kolonneskiftet m\00E5 v\00E6re i begynnelsen av kolonnematrisen.')
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140991738425751930)
,p_name=>'WWV_FLOW_DATA_EXPORT.COLUMN_GROUP_IDX_NOT_EXIST'
,p_message_language=>'no'
,p_message_text=>'Kolonnegruppeindeksen det refereres til i %0, finnes ikke.'
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140898899676751903)
,p_name=>'WWV_FLOW_DATA_EXPORT.EXPORT'
,p_message_language=>'no'
,p_message_text=>'eksport'
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140906074585751905)
,p_name=>'WWV_FLOW_DATA_EXPORT.FORMAT_MUST_BE_XML'
,p_message_language=>'no'
,p_message_text=>unistr('Eksportformatet m\00E5 v\00E6re XML med ORDS som utskriftstjener.')
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140992074346751930)
,p_name=>'WWV_FLOW_DATA_EXPORT.HIGHLIGHT_COLUMN_IDX_NOT_EXIST'
,p_message_language=>'no'
,p_message_text=>'Kolonneindeksen det refereres til i uthevingen %0, finnes ikke.'
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140895441035751902)
,p_name=>'WWV_FLOW_DATA_EXPORT.INVALID_FORMAT'
,p_message_language=>'no'
,p_message_text=>'Ugyldig eksportformat: %0'
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140991891048751930)
,p_name=>'WWV_FLOW_DATA_EXPORT.PARENT_GROUP_IDX_NOT_EXIST'
,p_message_language=>'no'
,p_message_text=>'Den overordnede gruppeindeksen det refereres til i %0, finnes ikke.'
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141017050909751938)
,p_name=>'WWV_FLOW_DATA_LOADER.CANNOT_LOAD_INTO_GENERATED_ALWAYS_COLUMN'
,p_message_language=>'no'
,p_message_text=>'Kolonnen %1 i tabellen %0 er en identitetskolonne av typen GENERATED ALWAYS. Forsikre deg om at ingen kildekolonne er tilordnet til kolonnen %1 i dialogboksen Konfigurer.'
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140928634651751912)
,p_name=>'WWV_FLOW_DATA_LOADER.COMMIT_INTERVAL_TOO_LOW'
,p_message_language=>'no'
,p_message_text=>'Det angitte lagringsintervallet er for lavt.'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140928717619751912)
,p_name=>'WWV_FLOW_DATA_LOADER.NO_COLUMNS_PROVIDED'
,p_message_language=>'no'
,p_message_text=>'Ingen kolonner er angitt for datalasting.'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140930033899751912)
,p_name=>'WWV_FLOW_DATA_PARSER.NO_COLUMNS_FOUND'
,p_message_language=>'no'
,p_message_text=>unistr('Finner ingen kolonner for radvelgeren %0. Pr\00F8v \00E5 finne dem automatisk eller se gjennom JSON-strukturen.')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140939405553751915)
,p_name=>'WWV_FLOW_DATA_PARSER.NO_WORKSHEETS_FOUND'
,p_message_language=>'no'
,p_message_text=>'Finner ingen regneark i XLSX-filen.'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140884571754751899)
,p_name=>'WWV_FLOW_DATA_PARSER.REQUESTED_HIERARCHY_LEVELS_EXCEED_MAXIMUM'
,p_message_language=>'no'
,p_message_text=>unistr('Antall forespurte hierarkiniv\00E5er for oppdagelse (%0) overskrider maksimumsverdien p\00E5 %1.')
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140939391658751915)
,p_name=>'WWV_FLOW_DATA_PARSER.WORKSHEET_DOES_NOT_EXIST'
,p_message_language=>'no'
,p_message_text=>'Det angitte regnearket finnes ikke i XLSX-filen.'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140917741121751908)
,p_name=>'WWV_FLOW_DML.VERSION_OF_DATA_CHANGED'
,p_message_language=>'no'
,p_message_text=>'Gjeldende versjon av data i databasen er endret siden brukeren initierte oppdateringsprosessen.'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140920609731751909)
,p_name=>'WWV_FLOW_EDIT_REPORT.ERR_UPDATING_COLS'
,p_message_language=>'no'
,p_message_text=>'Feil ved oppdatering av rapportkolonner: %0'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141031125360751942)
,p_name=>'WWV_FLOW_EXEC.CANNOT_CONVERT_TO_SDOGEOMETRY'
,p_message_language=>'no'
,p_message_text=>'Kan ikke konvertere %0 til SDO_GEOMETRY.'
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140967656861751923)
,p_name=>'WWV_FLOW_EXEC.CAN_NOT_CONVERT_TO_VARCHAR2'
,p_message_language=>'no'
,p_message_text=>'Kolonnen %0, som har datatypen %1, kan ikke konverteres til VARCHAR2.'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140975090768751925)
,p_name=>'WWV_FLOW_EXEC.COLUMN_NOT_FOUND'
,p_message_language=>'no'
,p_message_text=>'Kolonnen %0, som er angitt for attributtet %1, ble ikke funnet i datakilden.'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140911185031751906)
,p_name=>'WWV_FLOW_EXEC.FILTER_NOT_SUPPORTED_WITH_MULTIPLE_VALUES'
,p_message_language=>'no'
,p_message_text=>unistr('Filtertypen %0 st\00F8ttes ikke for flerverdikolonner.')
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141034688102751943)
,p_name=>'WWV_FLOW_EXEC.INVALID_BETWEEN_FILTER'
,p_message_language=>'no'
,p_message_text=>'Ugyldig "between"-filter.'
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140890276147751900)
,p_name=>'WWV_FLOW_EXEC.INVALID_COLUMN_OR_ROW_DATATYPE'
,p_message_language=>'no'
,p_message_text=>'Finner ingen %2-verdi i kolonne %0, rad %1.'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140886974761751899)
,p_name=>'WWV_FLOW_EXEC.INVALID_COLUMN_OR_ROW_REFERENCE'
,p_message_language=>'no'
,p_message_text=>'Kolonne %0 eller rad %1 finnes ikke.'
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140873562037751895)
,p_name=>'WWV_FLOW_EXEC.INVALID_LOV_SPECIFICATION'
,p_message_language=>'no'
,p_message_text=>'Ugyldig verdilistetype er angitt.'
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140873416601751895)
,p_name=>'WWV_FLOW_EXEC.INVALID_QUERY_TYPE'
,p_message_language=>'no'
,p_message_text=>unistr('Ugyldig sp\00F8rringstype. Sp\00F8rringstypen m\00E5 v\00E6re Tabell, SQL-sp\00F8rring eller PL/SQL-funksjon som returnerer SQL-sp\00F8rring.')
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140967769590751923)
,p_name=>'WWV_FLOW_EXEC.INVALID_SQL_QUERY'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Kan ikke analysere SQL-sp\00F8rringen.'),
'%0'))
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140975170386751925)
,p_name=>'WWV_FLOW_EXEC.LEGACY_COLUMN_NOT_FOUND'
,p_message_language=>'no'
,p_message_text=>'Den angitte kolonneposisjonen %0 for attributtet %1 ble ikke funnet i SQL-setningen.'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140865153529751893)
,p_name=>'WWV_FLOW_EXEC.MULTI_VALUE_TOO_MANY_ITEMS'
,p_message_language=>'no'
,p_message_text=>'For mange elementer er brukt i filter for flere verdier.'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140974945765751925)
,p_name=>'WWV_FLOW_EXEC.NO_COLUMN_FOR_ATTRIBUTE'
,p_message_language=>'no'
,p_message_text=>'Det er ikke angitt noen kolonne for attributtet %0.'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140873366943751895)
,p_name=>'WWV_FLOW_EXEC.NULL_QUERY_RETURNED_BY_FUNCTION'
,p_message_language=>'no'
,p_message_text=>'Hoveddelen av PL/SQL-funksjonen returnerte ikke en verdi.'
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140990751789751930)
,p_name=>'WWV_FLOW_EXEC.OPERATION_NOT_PRESENT_IN_WEB_SRC_MODULE'
,p_message_language=>'no'
,p_message_text=>unistr('REST-datakilden inneholder ikke en operasjon for h\00E5ndtering av den forespurte DML-handlingen.')
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141032402499751942)
,p_name=>'WWV_FLOW_EXEC.RANGE_BUCKET.NOT.SUPPORTED'
,p_message_language=>'no'
,p_message_text=>unistr('Intervallfiltre st\00F8ttes bare for datatypene NUMBER, DATE og TIMESTAMP.')
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140853326857751889)
,p_name=>'WWV_FLOW_EXEC.REST_REQUEST_ERROR'
,p_message_language=>'no'
,p_message_text=>unistr('Foresp\00F8rselen mislyktes med %0')
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140856825018751890)
,p_name=>'WWV_FLOW_EXEC.SPATIAL_JSON_NOT_AVAILABLE'
,p_message_language=>'no'
,p_message_text=>'Konvertering fra GeoJSON til SDO_GEOMETRY (kolonnen %0) er ikke tilgjengelig i denne databasen.'
,p_version_scn=>2705213
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140860259231751891)
,p_name=>'WWV_FLOW_EXEC.SPATIAL_NOT_SUPPORTED_FOR_XML'
,p_message_language=>'no'
,p_message_text=>unistr('SDO_GEOMETRY-konvertering (kolonnen %0) st\00F8ttes ikke for XML-datakilder.')
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140884328857751899)
,p_name=>'WWV_FLOW_EXEC.UNSUPPPORTED_MULTI_VALUE_SEPARATOR'
,p_message_language=>'no'
,p_message_text=>unistr('Tegnet %0 st\00F8ttes ikke som et flerverdiskilletegn.')
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141032577611751942)
,p_name=>'WWV_FLOW_EXEC.WRONG_CONTEXT_TYPE'
,p_message_language=>'no'
,p_message_text=>unistr('Denne funksjonen kan ikke brukes i en sp\00F8rringskontekst.')
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140860344729751892)
,p_name=>'WWV_FLOW_EXEC_API.INVALID_DATA_TYPE'
,p_message_language=>'no'
,p_message_text=>'Ikke samsvarende kolonnedatatype.'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140893803181751901)
,p_name=>'WWV_FLOW_EXEC_DOC_SRC.REMOTE_MULTI_ROW_DML_NOT_SUPPORTED_WITHOUT_JSON_BINDS'
,p_message_language=>'no'
,p_message_text=>unistr('Denne datakilden st\00F8tter ikke endring av flere rader.')
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140873235701751895)
,p_name=>'WWV_FLOW_EXEC_REMOTE.ORDS_OUT_BIND_LIMIT_EXCEEDED'
,p_message_language=>'no'
,p_message_text=>'Interne bindingsgrenser for ORDS OUT er overskredet. Reduser mengden DML-rader.'
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140975902682751926)
,p_name=>'WWV_FLOW_EXEC_REMOTE.RESPONSE_PARSING_ERROR'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'JSON-svaret fra den eksterne tjeneren kan ikke analyseres: ',
'%0'))
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140873174500751895)
,p_name=>'WWV_FLOW_EXEC_REMOTE.RUN_PLSQL_ERR'
,p_message_language=>'no'
,p_message_text=>'Ukjent eller feil konteksttype.'
,p_version_scn=>2705216
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140897237121751902)
,p_name=>'WWV_FLOW_EXPORT_INT.UNSUPPORTED_READABLE_EXPORT'
,p_message_language=>'no'
,p_message_text=>unistr('Komponenter som ikke st\00F8ttes for lesbar eksport: %0')
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140995280423751931)
,p_name=>'WWV_FLOW_FILE_PARSER.UNKNOWN_FILE_TYPE'
,p_message_language=>'no'
,p_message_text=>unistr('Denne filtypen st\00F8ttes ikke av analysatoren.')
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140946059194751917)
,p_name=>'WWV_FLOW_FND_DEVELOPER_API.CREDENTIALS_ERR'
,p_message_language=>'no'
,p_message_text=>'Uautorisert tilgang (wwv_flow_api.set_credentials er ikke angitt).'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140920952903751909)
,p_name=>'WWV_FLOW_FND_USER_API.CREATE_COMPANY'
,p_message_language=>'no'
,p_message_text=>unistr('Arbeidsomr\00E5det ble ikke opprettet fordi det allerede finnes.')
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140920850273751909)
,p_name=>'WWV_FLOW_FND_USER_API.CREATE_USER_GROUP'
,p_message_language=>'no'
,p_message_text=>'Brukergruppen ble ikke opprettet fordi den allerede finnes.'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140932249386751913)
,p_name=>'WWV_FLOW_FND_USER_API.DUP_USER'
,p_message_language=>'no'
,p_message_text=>'Fant et duplisert brukernavn for %0.'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140932358146751913)
,p_name=>'WWV_FLOW_FND_USER_API.LOAD_ERR'
,p_message_language=>'no'
,p_message_text=>'Feil ved lasting av brukere. Mislyktes for brukeren %0.'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140943167681751916)
,p_name=>'WWV_FLOW_FND_USER_API.T_MESSAGE'
,p_message_language=>'no'
,p_message_text=>'Ville lastet %0 brukere.'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140942918393751916)
,p_name=>'WWV_FLOW_FND_USER_API.T_PASSWORD'
,p_message_language=>'no'
,p_message_text=>'Passord'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140943083032751916)
,p_name=>'WWV_FLOW_FND_USER_API.T_PRIVILEGE'
,p_message_language=>'no'
,p_message_text=>'Privilegier'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140942798091751916)
,p_name=>'WWV_FLOW_FND_USER_API.T_USERNAME'
,p_message_language=>'no'
,p_message_text=>'Brukernavn'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141023175410751940)
,p_name=>'WWV_FLOW_FORM.UNHANDLED_ERROR'
,p_message_language=>'no'
,p_message_text=>'Feil ved gjengivelse av sideelementet #COMPONENT_NAME#.'
,p_version_scn=>2705245
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140938100438751914)
,p_name=>'WWV_FLOW_FORMS.FORM_NOT_OPEN_ERR'
,p_message_language=>'no'
,p_message_text=>unistr('Kan ikke vise sideelementet fordi HTML-skjermbildet ikke er \00E5pnet enn\00E5.')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140896554130751902)
,p_name=>'WWV_FLOW_FORMS.ITEM_DEFAULT_ERR'
,p_message_language=>'no'
,p_message_text=>'Feil ved beregning av standardelementverdi for sideelementet #COMPONENT_NAME#.'
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140937402982751914)
,p_name=>'WWV_FLOW_FORMS.ITEM_POST_CALC_ERR'
,p_message_language=>'no'
,p_message_text=>'Feil i elementetterberegning for sideelementet #COMPONENT_NAME#.'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140937339215751914)
,p_name=>'WWV_FLOW_FORMS.ITEM_SOURCE_ERR'
,p_message_language=>'no'
,p_message_text=>'Feil ved beregning av kildeelementverdi for sideelementet #COMPONENT_NAME#.'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140914126438751907)
,p_name=>'WWV_FLOW_HELP.UNAUTHORIZED'
,p_message_language=>'no'
,p_message_text=>'Uautorisert tilgang.'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140863648714751892)
,p_name=>'WWV_FLOW_INTERACTIVE_GRID.INVALID_JSON_ARRAY'
,p_message_language=>'no'
,p_message_text=>'Verdi %0 av %1 er ikke en gyldig JSON-matrise.'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140937621241751914)
,p_name=>'WWV_FLOW_ITEM.JS_NOT_SUPPORTED'
,p_message_language=>'no'
,p_message_text=>unistr('JavaScript st\00F8ttes ikke.')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140937710032751914)
,p_name=>'WWV_FLOW_ITEM.LIST'
,p_message_language=>'no'
,p_message_text=>'Liste'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140938375061751915)
,p_name=>'WWV_FLOW_ITEM.UNABLE_INIT_QUERY'
,p_message_language=>'no'
,p_message_text=>unistr('Kan ikke initialisere sp\00F8rring.')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140946390113751917)
,p_name=>'WWV_FLOW_ITEM.UPDATE_NOT_SUPPORTED_ERR'
,p_message_language=>'no'
,p_message_text=>unistr('Oppdatering av %0 st\00F8ttes ikke.')
,p_version_scn=>2705233
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140939846043751915)
,p_name=>'WWV_FLOW_ITEM_HELP.INVALID_ITEM_ERR'
,p_message_language=>'no'
,p_message_text=>'Ugyldig element-ID: %0 '
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140967567061751923)
,p_name=>'WWV_FLOW_ITEM_HELP.NO_HELP_EXISTS'
,p_message_language=>'no'
,p_message_text=>'Det finnes ingen hjelp for dette elementet.'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140929323905751912)
,p_name=>'WWV_FLOW_JET_CHART.QUERY_GENERATION_FAILED'
,p_message_language=>'no'
,p_message_text=>unistr('Generering av diagramsp\00F8rring mislyktes. Kontroller innstillingene for kilde- og kolonnetilordning.')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140930682625751912)
,p_name=>'WWV_FLOW_MAIL.ADD_ATTACHMENT.INVALID_MAIL_ID'
,p_message_language=>'no'
,p_message_text=>'Ugyldig verdi for parameteren p_mail_id: %0'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140967378034751923)
,p_name=>'WWV_FLOW_MAIL.CANNOT_USE_TO_OR_REPLYTO_AS_FROM'
,p_message_language=>'no'
,p_message_text=>'Kan ikke bruke Til eller Svar til som Fra-adresse, ettersom disse feltene inneholder flere e-postadresser.'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141052220106751948)
,p_name=>'WWV_FLOW_MAIL.EMAIL_LIMIT_EXCEEDED'
,p_message_language=>'no'
,p_message_text=>unistr('Du har overskredet maksimalt antall e-postmeldinger per arbeidsomr\00E5de. Ta kontakt med administratoren.')
,p_version_scn=>2705250
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140908848386751906)
,p_name=>'WWV_FLOW_MAIL.INVALID_CONTEXT'
,p_message_language=>'no'
,p_message_text=>unistr('Denne prosedyren m\00E5 startes i en applikasjons\00F8kt.')
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140930588832751912)
,p_name=>'WWV_FLOW_MAIL.PARAMETER_NULL'
,p_message_language=>'no'
,p_message_text=>'Nullverdi er angitt for parameteren %0.'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140988626829751929)
,p_name=>'WWV_FLOW_MAIL.PREPARE_TEMPLATE.NO_DATA_FOUND'
,p_message_language=>'no'
,p_message_text=>'Finner ikke e-postmalen %0 i applikasjonen %1.'
,p_version_scn=>2705238
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141065123992751953)
,p_name=>'WWV_FLOW_MAIL.SMTP_HOST_ADDRESS_REQUIRED'
,p_message_language=>'no'
,p_message_text=>unistr('Forekomstparameteren SMTP_HOST_ADDRESS m\00E5 settes til sending av e-post.')
,p_version_scn=>2705254
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140929964691751912)
,p_name=>'WWV_FLOW_MAIL.TO_IS_REQUIRED'
,p_message_language=>'no'
,p_message_text=>unistr('Du m\00E5 angi en meldingsmottaker hvis du skal sende e-post.')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141054664967751949)
,p_name=>'WWV_FLOW_MAIL.UNABLE_TO_OPEN_SMTP_CONNECTION'
,p_message_language=>'no'
,p_message_text=>'Kan ikke opprette SMTP-tilkobling med den konfigurerte e-posttjeneren.'
,p_version_scn=>2705251
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141029922522751942)
,p_name=>'WWV_FLOW_PLUGIN.INVALID_AJAX_CALL'
,p_message_language=>'no'
,p_message_text=>'Ugyldig Ajax-kall.'
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140913810009751907)
,p_name=>'WWV_FLOW_PLUGIN.NO_AJAX_FUNCTION'
,p_message_language=>'no'
,p_message_text=>'Ingen Ajax-funksjon er definert for innpluggingsmodulen %0'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141020419535751939)
,p_name=>'WWV_FLOW_PLUGIN.NO_EXECUTION_FUNCTION'
,p_message_language=>'no'
,p_message_text=>unistr('Ingen utf\00F8relsesfunksjon er definert for innpluggingsmodulen %0')
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140913954591751907)
,p_name=>'WWV_FLOW_PLUGIN.NO_RENDER_FUNCTION'
,p_message_language=>'no'
,p_message_text=>'Ingen gjengivelsesfunksjon er definert for innpluggingsmodulen %0'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141030878467751942)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_CAPABILITIES_FUNCTION'
,p_message_language=>'no'
,p_message_text=>'Innpluggingsmodulen %0 for REST-datakilden inneholder ikke en mulighetsfunksjon.'
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141030753103751942)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_DML_FUNCTION'
,p_message_language=>'no'
,p_message_text=>'Innpluggingsmodulen %0 for REST-datakilden inneholder ikke en DML-funksjon.'
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141030995474751942)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_EXECUTE_FUNCTION'
,p_message_language=>'no'
,p_message_text=>unistr('Innpluggingsmodulen %0 for REST-datakilden inneholder ikke en utf\00F8relsesfunksjon.')
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141031030849751942)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_FETCH_FUNCTION'
,p_message_language=>'no'
,p_message_text=>'Innpluggingsmodulen %0 for REST-datakilden inneholder ikke en hentefunksjon.'
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140911361348751907)
,p_name=>'WWV_FLOW_PLUGIN.RUN_PLSQL_ERR'
,p_message_language=>'no'
,p_message_text=>'Det oppstod feil i PLSQL-kode under behandling av innpluggingsmodulen.'
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140919958221751909)
,p_name=>'WWV_FLOW_PLUGIN_DEV.IS_REQUIRED'
,p_message_language=>'no'
,p_message_text=>unistr('Verdi m\00E5 angis.')
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140952970237751919)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.CANT_CONVERT_TO_VARCHAR2'
,p_message_language=>'no'
,p_message_text=>'Datatypen %0 kan ikke konverteres til VARCHAR2.'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141041105576751945)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.COLUMN_NOT_FOUND'
,p_message_language=>'no'
,p_message_text=>'Kolonnen %0, som er angitt for attributtet %1, ble ikke funnet i SQL-setningen.'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140868473023751894)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.INVALID_JSON_ARRAY'
,p_message_language=>'no'
,p_message_text=>'Verdi %0 av %1 er ikke en gyldig JSON-matrise.'
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141018314947751938)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.LOV_REQUIRED'
,p_message_language=>'no'
,p_message_text=>unistr('En verdilistesp\00F8rring eller en navngitt verdiliste m\00E5 angis for %0.')
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141019928438751939)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.LOV_SQL_WRONG_COLUMN_COUNT'
,p_message_language=>'no'
,p_message_text=>unistr('Feil antall kolonner er valgt i SQL-verdilistesp\00F8rringen for %0. Se eksemplene for gyldige setninger.')
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141040936676751945)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.NO_COLUMN_FOR_ATTRIBUTE'
,p_message_language=>'no'
,p_message_text=>'Det er ikke angitt noen kolonne for attributtet %0.'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141070118500751954)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.NUMBER_ATTRIBUTE_VALUE_INVALID'
,p_message_language=>'no'
,p_message_text=>'Den angitte verdien %0 for attributtet %1 er ikke numerisk.'
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141023465221751940)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.SQL_WRONG_DATA_TYPE'
,p_message_language=>'no'
,p_message_text=>'%0 har en feilaktig datatype i SQL-setningen. Kolonne nr. %1 er %2, men %3 er forventet.'
,p_version_scn=>2705246
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141041044616751945)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.WRONG_COLUMN_DATA_TYPE'
,p_message_language=>'no'
,p_message_text=>'Kolonnen %0, som er angitt for attributtet %1, har datatypen %2, men burde hatt %3.'
,p_version_scn=>2705249
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140910581405751906)
,p_name=>'WWV_FLOW_PRINT_UTIL.REPORT_LAYOUT_NOT_FOUND'
,p_message_language=>'no'
,p_message_text=>'Finner ikke rapportoppsettet.'
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140898103017751903)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTIONS_LIMIT_EXCEEDED'
,p_message_language=>'no'
,p_message_text=>unistr('Grensen for bakgrunnsutf\00F8relser er overskredet for %0.')
,p_version_scn=>2705222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140848417298751888)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTION_ALREADY_RUNNING'
,p_message_language=>'no'
,p_message_text=>unistr('En annen utf\00F8relse av %0 kj\00F8rer allerede.')
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140848320507751888)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTION_ALREADY_RUNNING_CTX'
,p_message_language=>'no'
,p_message_text=>unistr('En annen utf\00F8relse av %0 kj\00F8rer allerede for konteksten %1.')
,p_version_scn=>2705212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140863372228751892)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.FILES_NOT_VISIBLE_IN_WORKING_SESSION'
,p_message_language=>'no'
,p_message_text=>unistr('Lastede filer er ikke synlige i arbeids\00F8kten for utf\00F8relsen av %0.')
,p_version_scn=>2705215
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140975894911751926)
,p_name=>'WWV_FLOW_RENDER_REPORT3.COMPUTE_SUM_NOT_SUPPORTED_FOR_WEB_SOURCES'
,p_message_language=>'no'
,p_message_text=>unistr('Funksjonen Beregn sum kan ikke brukes for rapporter som er basert p\00E5 en REST-datakilde.')
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140937581991751914)
,p_name=>'WWV_FLOW_RENDER_SHORTCUT.UNABLE_SET_SHORT_VAL_ERR'
,p_message_language=>'no'
,p_message_text=>'ERR-2904 Kan ikke angi snarveisverdi.'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140942598792751916)
,p_name=>'WWV_FLOW_RENDER_SHORTCUT.UNKNOWN_TYPE_ERR'
,p_message_language=>'no'
,p_message_text=>'Feil: Ukjent snarveistype.'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140880246276751897)
,p_name=>'WWV_FLOW_SEARCH_API.TEXT_QUERY_TOO_LONG'
,p_message_language=>'no'
,p_message_text=>unistr('S\00F8kesp\00F8rringen er for lang.')
,p_version_scn=>2705218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140931669504751913)
,p_name=>'WWV_FLOW_SECURITY.AUTH_SCHEME_FETCH_ERR'
,p_message_language=>'no'
,p_message_text=>'Kan ikke hente authentication_scheme i applikasjonen %0.'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140939647399751915)
,p_name=>'WWV_FLOW_SECURITY.COMPONENT_FETCH_ERR'
,p_message_language=>'no'
,p_message_text=>'Kan ikke hente komponenten %0.'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141009961411751936)
,p_name=>'WWV_FLOW_SESSION_API.TENANT_ID_EXISTS'
,p_message_language=>'no'
,p_message_text=>unistr('Leier-ID-en finnes allerede for den gjeldende \00F8kten.')
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140942850171751916)
,p_name=>'WWV_FLOW_USER_API.T_EMAIL'
,p_message_language=>'no'
,p_message_text=>'E-post'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141069665921751954)
,p_name=>'WWV_FLOW_WEB_SERVICES.AUTHENTICATION_FAILED'
,p_message_language=>'no'
,p_message_text=>'Autentiseringen mislyktes.'
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140970299334751924)
,p_name=>'WWV_FLOW_WEB_SERVICES.COOKIE_INVALID'
,p_message_language=>'no'
,p_message_text=>unistr('\00C9n eller flere informasjonskapsler som er angitt i apex_util.g_request_cookies, inneholder en ugyldig verdi.')
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140952142831751919)
,p_name=>'WWV_FLOW_WEB_SERVICES.INVALID_UDDI_RESPONSE'
,p_message_language=>'no'
,p_message_text=>'Svaret fra UDDI-registeret var ugyldig.'
,p_version_scn=>2705234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140911487361751907)
,p_name=>'WWV_FLOW_WEB_SERVICES.INVALID_WSDL'
,p_message_language=>'no'
,p_message_text=>'Den angitte URL-adressen returnerte ikke et gyldig WSDL-dokument.'
,p_version_scn=>2705225
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140914280202751907)
,p_name=>'WWV_FLOW_WEB_SERVICES.MULTIPLE_SOAP'
,p_message_language=>'no'
,p_message_text=>unistr('WSDL-dokumentet inneholder flere SOAP-bindinger. &PRODUCT_NAME. st\00F8tter bare WSDL-er med \00E9n SOAP-binding. Klikk p\00E5 Opprett Web-tjenestereferanse manuelt hvis du vil fortsette \00E5 opprette en referanse for denne tjenesten.')
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140989870386751930)
,p_name=>'WWV_FLOW_WEB_SERVICES.NOT_XML'
,p_message_language=>'no'
,p_message_text=>'Svaret fra tjenesten var ikke XML.'
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141069520637751954)
,p_name=>'WWV_FLOW_WEB_SERVICES.NO_VALID_OAUTH_TOKEN'
,p_message_language=>'no'
,p_message_text=>unistr('OAuth-tilgangssymbolet er ikke tilgjengelig, eller det er utl\00F8pt.')
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141034002539751943)
,p_name=>'WWV_FLOW_WEB_SERVICES.REQUEST_LIMIT_EXCEEDED'
,p_message_language=>'no'
,p_message_text=>unistr('Du har overskredet maksimalt antall Web-tjenesteforesp\00F8rsler per arbeidsomr\00E5de. Ta kontakt med administratoren.')
,p_version_scn=>2705248
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141069706650751954)
,p_name=>'WWV_FLOW_WEB_SERVICES.UNSUPPORTED_OAUTH_TOKEN'
,p_message_language=>'no'
,p_message_text=>unistr('Tjeneren svarte med ikke-st\00F8ttet OAuth-symboltype.')
,p_version_scn=>2705256
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140913656709751907)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_NO_SOAP'
,p_message_language=>'no'
,p_message_text=>unistr('WSDL-dokumentet inneholdt ikke en binding for SOAP, noe som er n\00F8dvendig for at referansen skal kunne legges til.')
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140909021633751906)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_REQUIRES_AUTH'
,p_message_language=>'no'
,p_message_text=>'WSDL forutsetter autentisering her. Angi brukernavn og passord nedenfor.'
,p_version_scn=>2705224
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140920028669751909)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_UNHANDLED'
,p_message_language=>'no'
,p_message_text=>unistr('WSDL-dokumentet ble ikke forst\00E5tt av gjengivelsesmotoren. Klikk p\00E5 Opprett Web-tjenestereferanse manuelt hvis du vil fortsette \00E5 opprette en referanse for denne tjenesten.')
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140992824796751931)
,p_name=>'WWV_FLOW_WIZARD_API.UPDATE_ERROR'
,p_message_language=>'no'
,p_message_text=>'Kan ikke behandle oppdateringen.'
,p_version_scn=>2705239
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141018664502751938)
,p_name=>'WWV_FLOW_WORKSHEET.LOV_DISPLAY_AND_RETURN_COLUMN_EQUAL'
,p_message_language=>'no'
,p_message_text=>'Verdilisteretur og visningskolonne er identisk.'
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141018570815751938)
,p_name=>'WWV_FLOW_WORKSHEET.LOV_NO_RETURN_COLUMN'
,p_message_language=>'no'
,p_message_text=>'Verdilisten har ikke en returkolonne.'
,p_version_scn=>2705243
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140946243927751917)
,p_name=>'WWV_RENDER_REPORT3.COLUMN_VALUE_ERR'
,p_message_language=>'no'
,p_message_text=>'Feil ved henting av kolonneverdi: %0'
,p_version_scn=>2705233
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140971161801751924)
,p_name=>'WWV_RENDER_REPORT3.DATA_TOO_OLD'
,p_message_language=>'no'
,p_message_text=>unistr('De gjeldende tabellskjermbildedataene er for gamle. Kildedataene er endret.<br/> Klikk <strong><a href="%0">her</a></strong> hvis du vil forkaste endringene og laste dataene fra databasen p\00E5 nytt.')
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140926341349751911)
,p_name=>'WWV_RENDER_REPORT3.ERR_DETERMINE_PAGINATION'
,p_message_language=>'no'
,p_message_text=>unistr('Feil ved fors\00F8k p\00E5 \00E5 bestemme pagineringsstreng')
,p_version_scn=>2705229
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140926204732751911)
,p_name=>'WWV_RENDER_REPORT3.ERR_DETERMINE_QUERY_HEADINGS'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('kan ikke bestemme sp\00F8rringsoverskrifter:'),
'%0'))
,p_version_scn=>2705229
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140926448021751911)
,p_name=>'WWV_RENDER_REPORT3.ERR_REPORT_FOOTER'
,p_message_language=>'no'
,p_message_text=>'feil ved erstatning av rapportbunntekst'
,p_version_scn=>2705229
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140926529782751911)
,p_name=>'WWV_RENDER_REPORT3.FAILED_PARSING_QUERY'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('kan ikke analysere SQL-sp\00F8rringen:'),
'%0',
'%1'))
,p_version_scn=>2705229
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140932633043751913)
,p_name=>'WWV_RENDER_REPORT3.FOUND_BUT_NOT_DISPLAYED'
,p_message_language=>'no'
,p_message_text=>'Minste antall rader forespurt: %0, rader funnet, men ikke vist: %1'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140929045420751912)
,p_name=>'WWV_RENDER_REPORT3.HTML_USE_COLUMN_ALIAS'
,p_message_language=>'no'
,p_message_text=>unistr('sp\00F8rringskolonne nr. %0 (%1) er ugyldig, kolonner som bruker HTML, m\00E5 ha aliasnavn')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140946160732751917)
,p_name=>'WWV_RENDER_REPORT3.QUERY_HEADING_ERR'
,p_message_language=>'no'
,p_message_text=>unistr('Feil ved henting av sp\00F8rringsoverskrifter: %0')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140926650535751911)
,p_name=>'WWV_RENDER_REPORT3.REPORT_ERROR'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'rapportfeil:',
'%0'))
,p_version_scn=>2705229
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140966746198751923)
,p_name=>'WWV_RENDER_REPORT3.SORT_BY_THIS_COLUMN'
,p_message_language=>'no'
,p_message_text=>'Sorter etter denne kolonnen'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140929125980751912)
,p_name=>'WWV_RENDER_REPORT3.SYNTAX_ERROR'
,p_message_language=>'no'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Kan ikke analysere sp\00F8rringen, kontroller syntaksen i sp\00F8rringen.'),
'(%0)',
'</p>'))
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140971262861751924)
,p_name=>'WWV_RENDER_REPORT3.UNSAVED_DATA'
,p_message_language=>'no'
,p_message_text=>unistr('Dette skjermbildet inneholder ulagrede endringer. Velg OK hvis du vil fortsette uten \00E5 lagre endringene. ')
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140975767895751926)
,p_name=>'WWV_RENDER_REPORT3.UNSUPPORTED_PAGINATION_SCHEME'
,p_message_language=>'no'
,p_message_text=>unistr('Pagineringsplanen for rapporten (%0) st\00F8ttes ikke med den valgte datakilden.')
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140928965884751912)
,p_name=>'WWV_RENDER_REPORT3.USE_COLUMN_ALIAS'
,p_message_language=>'no'
,p_message_text=>unistr('sp\00F8rringskolonne nr. %0 (%1) er ugyldig, bruk kolonnealias')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140932726617751913)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_MORE_THAN_Z'
,p_message_language=>'no'
,p_message_text=>'rad %0-%1 av mer enn %2'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140973248857751925)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_MORE_THAN_Z_2'
,p_message_language=>'no'
,p_message_text=>'%0-%1 av mer enn %2'
,p_version_scn=>2705237
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140932571242751913)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z'
,p_message_language=>'no'
,p_message_text=>'rad %0-%1 av %2'
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140913307952751907)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z_2'
,p_message_language=>'no'
,p_message_text=>'%0-%1 av %2'
,p_version_scn=>2705226
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140926767153751911)
,p_name=>'Y'
,p_message_language=>'no'
,p_message_text=>'Y'
,p_version_scn=>2705229
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140934079441751913)
,p_name=>'YEAR'
,p_message_language=>'no'
,p_message_text=>unistr('\00E5r')
,p_version_scn=>2705231
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140925984452751911)
,p_name=>'YEARS'
,p_message_language=>'no'
,p_message_text=>unistr('\00E5r')
,p_version_scn=>2705229
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140971377548751924)
,p_name=>'YES'
,p_message_language=>'no'
,p_message_text=>'Ja'
,p_version_scn=>2705237
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
 p_id=>wwv_flow_imp.id(109678305570583962.4483)
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
 p_id=>1.4483
,p_name=>'Meldinger'
,p_alias=>'MESSAGES'
,p_step_title=>'Meldinger'
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
