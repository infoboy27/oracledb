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
,p_default_application_id=>4474
,p_default_id_offset=>0
,p_default_owner=>'APEX_240200'
);
end;
/
 
prompt APPLICATION 4474 - Oracle APEX Runtime Messages
--
-- Application Export:
--   Application:     4474
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
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'A144692282816757619')
,p_page_view_logging=>'YES'
,p_charset=>'utf-8'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt_last_reset=>'20250422180859'
,p_bookmark_checksum_function=>'SH1'
,p_compatibility_mode=>'24.2'
,p_session_state_commits=>'IMMEDIATE'
,p_flow_language=>'it'
,p_flow_language_derived_from=>'SESSION'
,p_date_format=>'&DATE_FORMAT.'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(109678305570583962.4474)
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
 p_id=>wwv_flow_imp.id(4474)
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
 p_id=>wwv_flow_imp.id(728504220438374.4474)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SELECT_MANY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_values_as', 'separated')).to_clob
,p_version_scn=>7007816
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(736540203200530.4474)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_BOSS'
,p_version_scn=>243430877
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(800575880762576.4474)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'NATIVE_OPEN_AI_ASSISTANT'
,p_version_scn=>15457644
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2657043006125217.4474)
,p_plugin_type=>'PROCESS TYPE'
,p_plugin=>'NATIVE_GEOCODING'
,p_attribute_01=>'RELAX_HOUSE_NUMBER'
,p_version_scn=>117636987
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(110599941590099161.4474)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'default_icon', 'fa-star',
  'tooltip', '#VALUE#')).to_clob
,p_version_scn=>7007818
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(118481226255833028.4474)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_MAP_REGION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_vector_tile_layers', 'Y')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(123214098089478467.4474)
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
 p_id=>wwv_flow_imp.id(124389732573989299.4474)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_ADFBC'
,p_version_scn=>37165931336889
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(209516503264520988.4474)
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
 p_id=>wwv_flow_imp.id(285800719532138903.4474)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N')).to_clob
,p_version_scn=>7007823
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(649595203182764436.4474)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_style', 'SWITCH_CB',
  'off_value', 'N',
  'on_value', 'Y')).to_clob
,p_version_scn=>6539584
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1874744429444344138.4474)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'include_slider', 'N')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1941451863897626238.4474)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'actions_menu_structure', 'IG')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2027366558906572283.4474)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'mode', 'FULL')).to_clob
,p_version_scn=>7007824
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2120597162971751123.4474)
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
 p_id=>wwv_flow_imp.id(649613204592764515.4474)
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
 p_id=>wwv_flow_imp.id(850359229090693491.4474)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Wizard Dialog.it'
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
 p_id=>wwv_flow_imp.id(293526110820992194.4474)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4474)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293526630547992195.4474)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4474)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293527171164992195.4474)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4474)
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
 p_id=>wwv_flow_imp.id(851037359784626333.4474)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Dialog.it'
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
 p_id=>wwv_flow_imp.id(293473352245977306.4474)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4474)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293473882718977306.4474)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4474)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293474370844977307.4474)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4474)
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
 p_id=>wwv_flow_imp.id(851037631091626378.4474)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Edit Screen.it'
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
 p_id=>wwv_flow_imp.id(2495515088702127.4474)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4474)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2496016567702127.4474)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4474)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2496522618702127.4474)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4474)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2497097895702127.4474)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4474)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2497562953702128.4474)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4474)
,p_name=>'Edit Screen Header'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2498085850702128.4474)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4474)
,p_name=>'Page Position 5'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2498553894702128.4474)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4474)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2499023066702128.4474)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4474)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2499516729702128.4474)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4474)
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
 p_id=>wwv_flow_imp.id(851039898661626389.4474)
,p_theme_id=>3
,p_name=>'APEX 5.0 - No Side Bar.it'
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
 p_id=>wwv_flow_imp.id(2418665544706094.4474)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4474)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2419139140706094.4474)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4474)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2419660231706094.4474)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4474)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2420136000706094.4474)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4474)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2420617033706094.4474)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4474)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2421142368706094.4474)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4474)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2421629849706095.4474)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4474)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2422132460706095.4474)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4474)
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
 p_id=>wwv_flow_imp.id(851040471818626394.4474)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Right Side Bar.it'
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
 p_id=>wwv_flow_imp.id(1537388880131854.4474)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4474)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1537880270131855.4474)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4474)
,p_name=>'Page Header (Position 3)'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1538315330131855.4474)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4474)
,p_name=>'Page Header (Position 4)'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1538840638131855.4474)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4474)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1539339441131855.4474)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4474)
,p_name=>'After Body'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1539830162131855.4474)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4474)
,p_name=>'Page Header (Position 1)'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1540338421131855.4474)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4474)
,p_name=>'Page Header (Position 2)'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1540832064131856.4474)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4474)
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
 p_id=>wwv_flow_imp.id(851041812938626395.4474)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Sign Up Wizard.it'
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
 p_id=>wwv_flow_imp.id(115212309210289451.4474)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4474)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115212857712289451.4474)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4474)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115213340345289452.4474)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4474)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115213804331289452.4474)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4474)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115214317592289452.4474)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4474)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115214875819289453.4474)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4474)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115215325320289453.4474)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4474)
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
 p_id=>wwv_flow_imp.id(851042476105626395.4474)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Wizard Page.it'
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
 p_id=>wwv_flow_imp.id(1485266589875353.4474)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4474)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1485734308875353.4474)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4474)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1486237142875354.4474)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4474)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1486735024875354.4474)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4474)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1487219028875354.4474)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4474)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1487770987875354.4474)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4474)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1488272041875354.4474)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4474)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1488725778875354.4474)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4474)
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
 p_id=>wwv_flow_imp.id(514381861202541059.4474)
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
 p_id=>wwv_flow_imp.id(514382190540541061.4474)
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
 p_id=>wwv_flow_imp.id(514382538845541061.4474)
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
 p_id=>wwv_flow_imp.id(620629666890811728.4474)
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
 p_id=>wwv_flow_imp.id(620629778318811745.4474)
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
 p_id=>wwv_flow_imp.id(868252865986181054.4474)
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
 p_id=>wwv_flow_imp.id(514338947870435171.4474)
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
 p_id=>wwv_flow_imp.id(2962385277500935.4474)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4474)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2962865718500935.4474)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4474)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2963338641500935.4474)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4474)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2963894582500935.4474)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4474)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2964329937500935.4474)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4474)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2964897214500936.4474)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4474)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2965324003500936.4474)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4474)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2965838011500936.4474)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4474)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2966328405500936.4474)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4474)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2966823859500936.4474)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4474)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2967325351500936.4474)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4474)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2967812485500936.4474)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4474)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2968377768500937.4474)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4474)
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
 p_id=>wwv_flow_imp.id(514343873675436760.4474)
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
 p_id=>wwv_flow_imp.id(32585474981747544.4474)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4474)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32585915750747544.4474)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4474)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32586471989747545.4474)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4474)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32586972270747545.4474)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4474)
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
 p_id=>wwv_flow_imp.id(771803843049318447.4474)
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
 p_id=>wwv_flow_imp.id(3207496127505978.4474)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4474)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3207907805505978.4474)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4474)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3208484941505978.4474)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4474)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3208991047505978.4474)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4474)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3209402462505979.4474)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4474)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3209972507505979.4474)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4474)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3210460159505979.4474)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4474)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3210935368505979.4474)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4474)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3211466566505979.4474)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4474)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3211956312505979.4474)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4474)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3212461962505979.4474)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4474)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3212966370505980.4474)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4474)
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
 p_id=>wwv_flow_imp.id(850406444708718383.4474)
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
 p_id=>wwv_flow_imp.id(2204663592232325.4474)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4474)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2205135519232325.4474)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4474)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2205694824232325.4474)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4474)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2206129075232325.4474)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4474)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2206618558232325.4474)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4474)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2207115910232326.4474)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4474)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2207688896232326.4474)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4474)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2208160700232326.4474)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4474)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2208614050232326.4474)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4474)
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
 p_id=>wwv_flow_imp.id(850442966147812557.4474)
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
 p_id=>wwv_flow_imp.id(3346988371508588.4474)
,p_plug_template_id=>wwv_flow_imp.id(850442966147812557.4474)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3347426198508588.4474)
,p_plug_template_id=>wwv_flow_imp.id(850442966147812557.4474)
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
 p_id=>wwv_flow_imp.id(856206049762521193.4474)
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
 p_id=>wwv_flow_imp.id(2526185270486606.4474)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4474)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2526610033486606.4474)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4474)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2527184084486606.4474)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4474)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2527626846486607.4474)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4474)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2528141078486607.4474)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4474)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2528637911486607.4474)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4474)
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
 p_id=>wwv_flow_imp.id(914802799655239969.4474)
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
 p_id=>wwv_flow_imp.id(88183211858816924.4474)
,p_plug_template_id=>wwv_flow_imp.id(914802799655239969.4474)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(88183732152816924.4474)
,p_plug_template_id=>wwv_flow_imp.id(914802799655239969.4474)
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
 p_id=>wwv_flow_imp.id(914803495164240003.4474)
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
 p_id=>wwv_flow_imp.id(3373447170510516.4474)
,p_plug_template_id=>wwv_flow_imp.id(914803495164240003.4474)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3373993086510516.4474)
,p_plug_template_id=>wwv_flow_imp.id(914803495164240003.4474)
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
 p_id=>wwv_flow_imp.id(915210356236972585.4474)
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
 p_id=>wwv_flow_imp.id(2899946654493378.4474)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4474)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2900442121493378.4474)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4474)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2900949359493378.4474)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4474)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2901467944493378.4474)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4474)
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
 p_id=>wwv_flow_imp.id(915371118115573423.4474)
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
 p_id=>wwv_flow_imp.id(2695578355491332.4474)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4474)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2696079816491332.4474)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4474)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2696558276491332.4474)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4474)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2697055726491332.4474)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4474)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2697581510491332.4474)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4474)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2698048732491333.4474)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4474)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2698576547491333.4474)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4474)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2699004772491333.4474)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4474)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2699557295491333.4474)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4474)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2700035673491333.4474)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4474)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2700500589491333.4474)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4474)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2701097053491333.4474)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4474)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2701554382491334.4474)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4474)
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
 p_id=>wwv_flow_imp.id(1274355059486017828.4474)
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
 p_id=>wwv_flow_imp.id(61232728057733462.4474)
,p_plug_template_id=>wwv_flow_imp.id(1274355059486017828.4474)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(61233207886733462.4474)
,p_plug_template_id=>wwv_flow_imp.id(1274355059486017828.4474)
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
 p_id=>wwv_flow_imp.id(514332014414430986.4474)
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
 p_id=>wwv_flow_imp.id(514332292784430987.4474)
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
 p_id=>wwv_flow_imp.id(860563697365629462.4474)
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
 p_id=>wwv_flow_imp.id(865273508717512144.4474)
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
 p_id=>wwv_flow_imp.id(908020362212234651.4474)
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
 p_id=>wwv_flow_imp.id(914818080687341593.4474)
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
 p_id=>wwv_flow_imp.id(851049711466639395.4474)
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
 p_id=>wwv_flow_imp.id(851054516889639461.4474)
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
 p_id=>wwv_flow_imp.id(851055225644639463.4474)
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
 p_id=>wwv_flow_imp.id(851056531929639482.4474)
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
 p_id=>wwv_flow_imp.id(914792024808213039.4474)
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
 p_id=>wwv_flow_imp.id(914792322768213043.4474)
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
 p_id=>wwv_flow_imp.id(915377874236666939.4474)
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
 p_id=>wwv_flow_imp.id(1041941432531249038.4474)
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
 p_id=>wwv_flow_imp.id(850683711614406253.4474)
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
 p_id=>wwv_flow_imp.id(851047536471633848.4474)
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
 p_id=>wwv_flow_imp.id(851047676005633854.4474)
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
 p_id=>wwv_flow_imp.id(851047684809633856.4474)
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
 p_id=>wwv_flow_imp.id(851047795461633856.4474)
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
 p_id=>wwv_flow_imp.id(860542631889572088.4474)
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
 p_id=>wwv_flow_imp.id(1321751941832424103.4474)
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
 p_id=>wwv_flow_imp.id(514333590213433126.4474)
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
 p_id=>wwv_flow_imp.id(649611704621764507.4474)
,p_page_name=>'winlov'
,p_page_title=>'Finestra di dialogo di ricerca'
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
,p_find_button_text=>'Cerca'
,p_find_button_attr=>'class="a-Button a-Button--hot a-Button--padLeft"'
,p_close_button_text=>'Chiudi'
,p_close_button_attr=>'class="a-Button u-pullRight"'
,p_next_button_text=>'Successivo &gt;'
,p_next_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_prev_button_text=>'&lt; Precedente'
,p_prev_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'380'
,p_height=>'480'
,p_result_row_x_of_y=>'<div class="a-PopupLOV-pagination">Righe #FIRST_ROW# - #LAST_ROW#</div>'
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
 p_id=>wwv_flow_imp.id(649611609668764506.4474)
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
 p_id=>wwv_flow_imp.id(182005134783173294.4474)
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
 p_id=>wwv_flow_imp.id(666074212329754757.4474)
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
 p_id=>wwv_flow_imp.id(666074525535755551.4474)
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
 p_id=>wwv_flow_imp.id(717250289307903026.4474)
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
 p_id=>wwv_flow_imp.id(2336377640986141.4474)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL'
,p_display_name=>'Heading Level'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(806925000765340952.4474)
,p_theme_id=>3
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default - No Icons'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808380142596819918.4474)
,p_theme_id=>3
,p_name=>'ALTERNATING_TABLE_ROWS'
,p_display_name=>'Alternating Table Rows'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Enable'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808380828683819918.4474)
,p_theme_id=>3
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Disable'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808381542095819918.4474)
,p_theme_id=>3
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default Border'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808383088145819924.4474)
,p_theme_id=>3
,p_name=>'REPORT_WIDTH'
,p_display_name=>'Report Width'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850406791580718389.4474)
,p_theme_id=>3
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850407096779718396.4474)
,p_theme_id=>3
,p_name=>'REGION_PADDING'
,p_display_name=>'Region Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Padding'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850407509193718398.4474)
,p_theme_id=>3
,p_name=>'REGION_STYLE'
,p_display_name=>'Region Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Style'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(851050160062639437.4474)
,p_theme_id=>3
,p_name=>'BADGE_LAYOUT'
,p_display_name=>'Badge Layout'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(851051045625639457.4474)
,p_theme_id=>3
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856113214217058023.4474)
,p_theme_id=>3
,p_name=>'HEIGHT'
,p_display_name=>'Height'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856114568019058024.4474)
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
 p_id=>wwv_flow_imp.id(856114830529058024.4474)
,p_theme_id=>3
,p_name=>'FORM_LABEL_WIDTH'
,p_display_name=>'Form Label Width'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856115135223058024.4474)
,p_theme_id=>3
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Not Part of Button Set'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116214022058024.4474)
,p_theme_id=>3
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>1
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116523282058024.4474)
,p_theme_id=>3
,p_name=>'FORM_LABEL_POSITION'
,p_display_name=>'Form Label Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116798725058025.4474)
,p_theme_id=>3
,p_name=>'BUTTON_SIZE'
,p_display_name=>'Button Size'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Button Size'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117102944058028.4474)
,p_theme_id=>3
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing left'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Left Spacing'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117454663058028.4474)
,p_theme_id=>3
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Right Spacing'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117908453058029.4474)
,p_theme_id=>3
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Icon on Right'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856118261810058029.4474)
,p_theme_id=>3
,p_name=>'BUTTON_TYPE'
,p_display_name=>'Button Type'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856206461450521195.4474)
,p_theme_id=>3
,p_name=>'ALERT_TYPE'
,p_display_name=>'Alert Type'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856206736628521198.4474)
,p_theme_id=>3
,p_name=>'DISPLAY'
,p_display_name=>'Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(860570508910721307.4474)
,p_theme_id=>3
,p_name=>'REGION_POSITION'
,p_display_name=>'Region Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(860571060920721309.4474)
,p_theme_id=>3
,p_name=>'REGION_OVERFLOW'
,p_display_name=>'Region Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(908020718209234676.4474)
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
 p_id=>wwv_flow_imp.id(1487577187426769.4474)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden to Assistive Tech'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4474)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4474)
,p_template_types=>'REGION'
,p_help_text=>'By default, region title is hidden but accessible, use this option to remove the header from accessible interface'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2336635141996782.4474)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H1'
,p_display_name=>'H1'
,p_display_sequence=>10
,p_css_classes=>'js-headingLevel-1'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4474)
,p_template_types=>'REGION'
,p_help_text=>'H1'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2336917964996782.4474)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H2'
,p_display_name=>'H2'
,p_display_sequence=>20
,p_css_classes=>'js-headingLevel-2'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4474)
,p_template_types=>'REGION'
,p_help_text=>'H2'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2337368425996782.4474)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H3'
,p_display_name=>'H3'
,p_display_sequence=>30
,p_css_classes=>'js-headingLevel-3'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4474)
,p_template_types=>'REGION'
,p_help_text=>'H3'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2337706283996782.4474)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H4'
,p_display_name=>'H4'
,p_display_sequence=>40
,p_css_classes=>'js-headingLevel-4'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4474)
,p_template_types=>'REGION'
,p_help_text=>'H4'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2338144805996782.4474)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H5'
,p_display_name=>'H5'
,p_display_sequence=>50
,p_css_classes=>'js-headingLevel-5'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4474)
,p_template_types=>'REGION'
,p_help_text=>'H5'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2338562059996782.4474)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H6'
,p_display_name=>'H6'
,p_display_sequence=>60
,p_css_classes=>'js-headingLevel-6'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4474)
,p_template_types=>'REGION'
,p_help_text=>'H6'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134384175764258.4474)
,p_theme_id=>3
,p_name=>'LARGELEFT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapLeft'
,p_group_id=>wwv_flow_imp.id(856117102944058028.4474)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134654971764258.4474)
,p_theme_id=>3
,p_name=>'LARGERIGHT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapRight'
,p_group_id=>wwv_flow_imp.id(856117454663058028.4474)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134823880764258.4474)
,p_theme_id=>3
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(856117908453058029.4474)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135009020764258.4474)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>3
,p_css_classes=>'a-Button--large'
,p_group_id=>wwv_flow_imp.id(856116798725058025.4474)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135269851764258.4474)
,p_theme_id=>3
,p_name=>'SMALLLEFT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padLeft'
,p_group_id=>wwv_flow_imp.id(856117102944058028.4474)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135477215764258.4474)
,p_theme_id=>3
,p_name=>'SMALLRIGHT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padRight'
,p_group_id=>wwv_flow_imp.id(856117454663058028.4474)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135634744764258.4474)
,p_theme_id=>3
,p_name=>'INNERBUTTON'
,p_display_name=>'Inner Button'
,p_display_sequence=>2
,p_css_classes=>'a-Button--pill'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4474)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135785730764258.4474)
,p_theme_id=>3
,p_name=>'LASTBUTTON'
,p_display_name=>'Last Button'
,p_display_sequence=>3
,p_css_classes=>'a-Button--pillEnd'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4474)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136068296764258.4474)
,p_theme_id=>3
,p_name=>'FIRSTBUTTON'
,p_display_name=>'First Button'
,p_display_sequence=>1
,p_css_classes=>'a-Button--pillStart'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4474)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136225140764258.4474)
,p_theme_id=>3
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>1
,p_css_classes=>'a-Button--primary'
,p_group_id=>wwv_flow_imp.id(856118261810058029.4474)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136360666764258.4474)
,p_theme_id=>3
,p_name=>'REGIONHEADERBUTTON'
,p_display_name=>'Button in Region Header'
,p_display_sequence=>1
,p_css_classes=>'a-Button--regionHeader'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136507481764259.4474)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--small'
,p_group_id=>wwv_flow_imp.id(856116798725058025.4474)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136620486764259.4474)
,p_theme_id=>3
,p_name=>'STRONGBUTTONLABEL'
,p_display_name=>'Strong Button Label'
,p_display_sequence=>1
,p_css_classes=>'a-Button--strongLabel'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136861925764259.4474)
,p_theme_id=>3
,p_name=>'AUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form--autoWidthLabels'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4474)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137023291764259.4474)
,p_theme_id=>3
,p_name=>'FIXEDWIDTH'
,p_display_name=>'Fixed'
,p_display_sequence=>10
,p_css_classes=>'a-Form--fixedLabels'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4474)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137193234764259.4474)
,p_theme_id=>3
,p_name=>'LABELSABOVE'
,p_display_name=>'Labels Above'
,p_display_sequence=>1
,p_css_classes=>'a-Form--labelsAbove'
,p_group_id=>wwv_flow_imp.id(856116523282058024.4474)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137470293764259.4474)
,p_theme_id=>3
,p_name=>'ALIGNLABELSLEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Form--leftLabels'
,p_group_id=>wwv_flow_imp.id(856114568019058024.4474)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137586003764259.4474)
,p_theme_id=>3
,p_name=>'LABELAUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--autoLabelWidth'
,p_group_id=>wwv_flow_imp.id(856116214022058024.4474)
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137737661764259.4474)
,p_theme_id=>3
,p_name=>'STRETCHFORMFIELD'
,p_display_name=>'Stretch Form Field'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--stretch'
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137933035764259.4474)
,p_theme_id=>3
,p_name=>'FIXEDLARGE'
,p_display_name=>'Fixed (Large Width)'
,p_display_sequence=>30
,p_css_classes=>'a-Form-fixedLabelsLarge'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4474)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138175863764259.4474)
,p_theme_id=>3
,p_name=>'FIXEDMEDIUM'
,p_display_name=>'Fixed (Medium Width)'
,p_display_sequence=>20
,p_css_classes=>'a-Form-fixedLabelsMed'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4474)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138340877764259.4474)
,p_theme_id=>3
,p_name=>'180PX'
,p_display_name=>'180px'
,p_display_sequence=>10
,p_css_classes=>'h180'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4474)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138553321764259.4474)
,p_theme_id=>3
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>20
,p_css_classes=>'h240'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4474)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138777457764259.4474)
,p_theme_id=>3
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>30
,p_css_classes=>'h320'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4474)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138891974764260.4474)
,p_theme_id=>3
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>50
,p_css_classes=>'h480'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4474)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857139153872764260.4474)
,p_theme_id=>3
,p_name=>'540PX'
,p_display_name=>'540px'
,p_display_sequence=>60
,p_css_classes=>'h540'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4474)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857139375337764260.4474)
,p_theme_id=>3
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>70
,p_css_classes=>'h640'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4474)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145206107768768.4474)
,p_theme_id=>3
,p_name=>'USE_COLORED_BACKGROUND'
,p_display_name=>'Use Colored Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4474)
,p_css_classes=>'a-Alert--colorBG'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145328630768768.4474)
,p_theme_id=>3
,p_name=>'USE_DEFAULT_ICONS'
,p_display_name=>'Use Default Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4474)
,p_css_classes=>'a-Alert--defaultIcons'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145505007768768.4474)
,p_theme_id=>3
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4474)
,p_css_classes=>'a-Alert--warning'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4474)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145725778768768.4474)
,p_theme_id=>3
,p_name=>'ERROR'
,p_display_name=>'Error'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4474)
,p_css_classes=>'a-Alert--danger'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4474)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145892117768768.4474)
,p_theme_id=>3
,p_name=>'INFORMATIONAL'
,p_display_name=>'Informational'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4474)
,p_css_classes=>'a-Alert--info'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4474)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146085228768768.4474)
,p_theme_id=>3
,p_name=>'HORIZONTAL'
,p_display_name=>'Horizontal'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4474)
,p_css_classes=>'a-Alert--horizontal'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4474)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146322225768769.4474)
,p_theme_id=>3
,p_name=>'WIZARD'
,p_display_name=>'Wizard'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4474)
,p_css_classes=>'a-Alert--wizard'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4474)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146393064768769.4474)
,p_theme_id=>3
,p_name=>'REMOVE_ICON'
,p_display_name=>'Remove Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4474)
,p_css_classes=>'a-Alert--noIcon'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146615368768769.4474)
,p_theme_id=>3
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4474)
,p_css_classes=>'a-Alert--success'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4474)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147042367768771.4474)
,p_theme_id=>3
,p_name=>'REGIONCONTAINSITEMSTEXT'
,p_display_name=>'Region Contains Items / Text'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4474)
,p_css_classes=>'a-ButtonRegion--withItems'
,p_template_types=>'REGION'
,p_help_text=>'Check this option if this region contains items or text.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147189725768771.4474)
,p_theme_id=>3
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4474)
,p_css_classes=>'a-ButtonRegion--noUI'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4474)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147385795768771.4474)
,p_theme_id=>3
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4474)
,p_css_classes=>'a-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4474)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147655668768771.4474)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4474)
,p_css_classes=>'a-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4474)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147872948768771.4474)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4474)
,p_css_classes=>'a-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4474)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147976018768771.4474)
,p_theme_id=>3
,p_name=>'WIZARDDIALOG'
,p_display_name=>'Used for Wizard Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4474)
,p_css_classes=>'a-ButtonRegion--wizard'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857148162424768771.4474)
,p_theme_id=>3
,p_name=>'VISIBLE'
,p_display_name=>'Visible'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4474)
,p_css_classes=>'a-ButtonRegion--showTitle'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4474)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857148341454768771.4474)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4474)
,p_css_classes=>'a-ButtonRegion--accessibleTitle'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4474)
,p_template_types=>'REGION'
,p_help_text=>'Use this option to add a visually hidden heading which is accessible for screen readers, but otherwise not visible to users.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149438708768778.4474)
,p_theme_id=>3
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4474)
,p_css_classes=>'a-BadgeList--float'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4474)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149614105768778.4474)
,p_theme_id=>3
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4474)
,p_css_classes=>'a-BadgeList--fixed'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4474)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149843563768778.4474)
,p_theme_id=>3
,p_name=>'STACKEDVERTICALLY'
,p_display_name=>'Stacked Vertically'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4474)
,p_css_classes=>'a-BadgeList--stacked'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4474)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149998210768778.4474)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'32px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4474)
,p_css_classes=>'a-BadgeList--small'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4474)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150194417768778.4474)
,p_theme_id=>3
,p_name=>'MEDIUM'
,p_display_name=>'48px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4474)
,p_css_classes=>'a-BadgeList--medium'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4474)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150439507768778.4474)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'64px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4474)
,p_css_classes=>'a-BadgeList--large'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4474)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150608654768780.4474)
,p_theme_id=>3
,p_name=>'XLARGE'
,p_display_name=>'96px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4474)
,p_css_classes=>'a-BadgeList--xlarge'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4474)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150792333768780.4474)
,p_theme_id=>3
,p_name=>'XXLARGE'
,p_display_name=>'128px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4474)
,p_css_classes=>'a-BadgeList--xxlarge'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4474)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151008734768780.4474)
,p_theme_id=>3
,p_name=>'2COLUMNNGRID'
,p_display_name=>'2 Columnn Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4474)
,p_css_classes=>'a-BadgeList--cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4474)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151259777768780.4474)
,p_theme_id=>3
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4474)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--3cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4474)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151408063768780.4474)
,p_theme_id=>3
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4474)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--4cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4474)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151643103768780.4474)
,p_theme_id=>3
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4474)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--5cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4474)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151861194768780.4474)
,p_theme_id=>3
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4474)
,p_css_classes=>'a-BadgeList--flex'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4474)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896798730495581814.4474)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4474)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(808380142596819918.4474)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896798963380581814.4474)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4474)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(808380828683819918.4474)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799089194581814.4474)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4474)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4474)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799349986581814.4474)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4474)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4474)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799577541581814.4474)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4474)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4474)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799637215581814.4474)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4474)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799807498581814.4474)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4474)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_imp.id(808383088145819924.4474)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022191342234716.4474)
,p_theme_id=>3
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4474)
,p_css_classes=>'a-MediaList--cols a-MediaList--2cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4474)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022392217234716.4474)
,p_theme_id=>3
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4474)
,p_css_classes=>'a-MediaList--cols a-MediaList--3cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4474)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022597980234716.4474)
,p_theme_id=>3
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4474)
,p_css_classes=>'a-MediaList--cols a-MediaList--4cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4474)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022867300234717.4474)
,p_theme_id=>3
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4474)
,p_css_classes=>'a-MediaList--cols a-MediaList--5cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4474)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023065592234717.4474)
,p_theme_id=>3
,p_name=>'SPANHORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4474)
,p_css_classes=>'a-MediaList--horizontal'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4474)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023131122234717.4474)
,p_theme_id=>3
,p_name=>'HIDEBADGE'
,p_display_name=>'Hide Badge'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4474)
,p_css_classes=>'a-MediaList--noBadge'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023191297234717.4474)
,p_theme_id=>3
,p_name=>'HIDEDESCRIPTION'
,p_display_name=>'Hide Description'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4474)
,p_css_classes=>'a-MediaList--noDesc'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023315038234717.4474)
,p_theme_id=>3
,p_name=>'HIDETITLE'
,p_display_name=>'Hide Title'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4474)
,p_css_classes=>'a-MediaList--noTitle'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023432264234717.4474)
,p_theme_id=>3
,p_name=>'HIDEICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4474)
,p_css_classes=>'a-MediaList--noIcons'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023494059234717.4474)
,p_theme_id=>3
,p_name=>'SLIMLIST'
,p_display_name=>'Slim List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4474)
,p_css_classes=>'a-MediaList--slim'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378094918666945.4474)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4474)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(808380142596819918.4474)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378225037666947.4474)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4474)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(808380828683819918.4474)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378370589666947.4474)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4474)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4474)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378467813666947.4474)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4474)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378526097666947.4474)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4474)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4474)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378615102666947.4474)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4474)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_imp.id(808383088145819924.4474)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378735377666947.4474)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4474)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4474)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1036071796325339624.4474)
,p_theme_id=>3
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(514332292784430987.4474)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1036071972285339624.4474)
,p_theme_id=>3
,p_name=>'ADD_SLIDE_ANIMATION'
,p_display_name=>'Add Slide Animation'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(514332292784430987.4474)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1050367122398973653.4474)
,p_theme_id=>3
,p_name=>'SLIMPROGRESSLIST'
,p_display_name=>'Slim Progress List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(865273508717512144.4474)
,p_css_classes=>'a-WizardSteps--slim'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1309233880682664517.4474)
,p_theme_id=>3
,p_name=>'LEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_button_template_id=>wwv_flow_imp.id(868252865986181054.4474)
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(856117908453058029.4474)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1351338307429029043.4474)
,p_theme_id=>3
,p_name=>'USED_IN_DIALOG'
,p_display_name=>'Used in Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1274355059486017828.4474)
,p_css_classes=>'a-ProcessingRegion--dialog'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333722717814196.4474)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4474)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333859287814196.4474)
,p_theme_id=>3
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4474)
,p_css_classes=>'a-LinksList--showBadge'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333887728814196.4474)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4474)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334039640814196.4474)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4474)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334247146814196.4474)
,p_theme_id=>3
,p_name=>'FORTOPLEVELONLY'
,p_display_name=>'For top level only'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4474)
,p_css_classes=>'a-LinksList--showTopIcons'
,p_group_id=>wwv_flow_imp.id(806925000765340952.4474)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334455135814196.4474)
,p_theme_id=>3
,p_name=>'FORALLITEMS'
,p_display_name=>'For all items'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4474)
,p_css_classes=>'a-LinksList--showIcons'
,p_group_id=>wwv_flow_imp.id(806925000765340952.4474)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491342397110118.4474)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4474)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491390428110118.4474)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4474)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491480011110118.4474)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4474)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664488722406040473.4474)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4474)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4474)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664488933681040473.4474)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4474)
,p_css_classes=>'a-Region--accessibleHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4474)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489165994040473.4474)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4474)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4474)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489304869040473.4474)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4474)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4474)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489519844040473.4474)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4474)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_imp.id(860570508910721307.4474)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489753255040473.4474)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4474)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4474)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489941797040473.4474)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4474)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4474)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490153471040473.4474)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4474)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4474)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490336091040473.4474)
,p_theme_id=>3
,p_name=>'DEFAULTPADDING'
,p_display_name=>'Default Padding'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4474)
,p_css_classes=>'a-Region--paddedBody'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4474)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490377667040473.4474)
,p_theme_id=>3
,p_name=>'REMOVE_TOP_BORDER'
,p_display_name=>'Remove Top Border'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4474)
,p_css_classes=>'a-Region--noTopBorder'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490659850040473.4474)
,p_theme_id=>3
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4474)
,p_css_classes=>'a-Region--simple'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4474)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664501980442158869.4474)
,p_theme_id=>3
,p_name=>'RESPONSIVEICONCOLUMNS'
,p_display_name=>'Responsive Icon Columns'
,p_display_sequence=>2
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4474)
,p_css_classes=>'a-IRR-region--responsiveIconView'
,p_template_types=>'REGION'
,p_help_text=>'Automatically increases number of icon columns to show based on screen resolution.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664502160891158869.4474)
,p_theme_id=>3
,p_name=>'ICONLABELSRIGHT'
,p_display_name=>'Icon Labels on Right'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4474)
,p_css_classes=>'a-IRR-region--iconLabelsRight'
,p_template_types=>'REGION'
,p_help_text=>'Shows labels in Icon View to the right of the icon.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664502181188158869.4474)
,p_theme_id=>3
,p_name=>'REMOVEOUTERBORDERS'
,p_display_name=>'Remove Outer Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4474)
,p_css_classes=>'a-IRR-region--noOuterBorders'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508367504174332.4474)
,p_theme_id=>3
,p_name=>'FLUSHREGION'
,p_display_name=>'Flush Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4474)
,p_css_classes=>'a-Region--flush'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508426350174332.4474)
,p_theme_id=>3
,p_name=>'STACKEDREGION'
,p_display_name=>'Stacked Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4474)
,p_css_classes=>'a-Region--stacked'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508588305174332.4474)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4474)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4474)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508810521174332.4474)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4474)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4474)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509005841174332.4474)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4474)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_imp.id(860570508910721307.4474)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509270186174332.4474)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4474)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4474)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509448573174333.4474)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4474)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4474)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509659839174333.4474)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4474)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4474)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509822387174334.4474)
,p_theme_id=>3
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>.1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4474)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4474)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664510028962174334.4474)
,p_theme_id=>3
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4474)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4474)
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
 p_id=>wwv_flow_imp.id(140016911983751627)
,p_name=>'4150_COLUMN_NUMBER'
,p_message_language=>'it'
,p_message_text=>'Colonna %0'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140001542484751623)
,p_name=>'ACCESS_CONTROL_ADMIN'
,p_message_language=>'it'
,p_message_text=>'Amministratore'
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140001432043751623)
,p_name=>'ACCESS_CONTROL_USERNAME'
,p_message_language=>'it'
,p_message_text=>'Nome utente'
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140064126082751641)
,p_name=>'ACCESS_DENIED_SIMPLE'
,p_message_language=>'it'
,p_message_text=>'Accesso negato'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140021058768751628)
,p_name=>'ACCOUNT_HAS_BEEN_CREATED'
,p_message_language=>'it'
,p_message_text=>unistr('L''account %0 \00E8 stato creato.')
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140004255633751623)
,p_name=>'ACCOUNT_LOCKED'
,p_message_language=>'it'
,p_message_text=>unistr('L''account \00E8 bloccato.')
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139988724172751619)
,p_name=>'AM_PM'
,p_message_language=>'it'
,p_message_text=>'AM / PM'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139971525359751614)
,p_name=>'APEX.ACTIONS.ACTION_LINK'
,p_message_language=>'it'
,p_message_text=>'collegamento all''azione'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139971412411751614)
,p_name=>'APEX.ACTIONS.DIALOG_LINK'
,p_message_language=>'it'
,p_message_text=>'collegamento alla finestra di dialogo'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140135852945751662)
,p_name=>'APEX.ACTIONS.TOGGLE'
,p_message_language=>'it'
,p_message_text=>'Attiva/disattiva %0'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140143662069751665)
,p_name=>'APEX.ACTIVE_STATE'
,p_message_language=>'it'
,p_message_text=>'(Attivo)'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139948491995751607)
,p_name=>'APEX.AI.CHAT_CLEARED'
,p_message_language=>'it'
,p_message_text=>'Chat cancellata'
,p_is_js_message=>true
,p_version_scn=>2705025
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139948369721751607)
,p_name=>'APEX.AI.CLEAR_CHAT'
,p_message_language=>'it'
,p_message_text=>'Cancella chat'
,p_is_js_message=>true
,p_version_scn=>2705025
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139944946204751606)
,p_name=>'APEX.AI.CONSENT_ACCEPT'
,p_message_language=>'it'
,p_message_text=>'Accetta'
,p_is_js_message=>true
,p_version_scn=>2705023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139945019083751606)
,p_name=>'APEX.AI.CONSENT_DENY'
,p_message_language=>'it'
,p_message_text=>'Nega'
,p_is_js_message=>true
,p_version_scn=>2705023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139944761647751606)
,p_name=>'APEX.AI.CONVERSATION_HISTORY'
,p_message_language=>'it'
,p_message_text=>'Cronologia conversazioni'
,p_is_js_message=>true
,p_version_scn=>2705023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139948157089751607)
,p_name=>'APEX.AI.COPIED'
,p_message_language=>'it'
,p_message_text=>'Copiato'
,p_is_js_message=>true
,p_version_scn=>2705025
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139948282954751607)
,p_name=>'APEX.AI.COPIED_TO_CLIPBOARD'
,p_message_language=>'it'
,p_message_text=>'Copiato negli Appunti'
,p_is_js_message=>true
,p_version_scn=>2705025
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139947995589751607)
,p_name=>'APEX.AI.COPY'
,p_message_language=>'it'
,p_message_text=>'Copia'
,p_is_js_message=>true
,p_version_scn=>2705025
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139948049321751607)
,p_name=>'APEX.AI.COPY_TO_CLIPBOARD'
,p_message_language=>'it'
,p_message_text=>'Copia negli Appunti'
,p_is_js_message=>true
,p_version_scn=>2705025
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139945455590751606)
,p_name=>'APEX.AI.DIALOG_TITLE'
,p_message_language=>'it'
,p_message_text=>'Assistente'
,p_is_js_message=>true
,p_version_scn=>2705023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139945821592751606)
,p_name=>'APEX.AI.DISABLED'
,p_message_language=>'it'
,p_message_text=>'AI disabilitata nell''area di lavoro o a livello di istanza.'
,p_version_scn=>2705024
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139985151321751618)
,p_name=>'APEX.AI.GET_SERVER_ID_OR_STATIC_ID'
,p_message_language=>'it'
,p_message_text=>'Servizio AI generativa con l''ID fornito o l''ID statico non trovato.'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139983863939751617)
,p_name=>'APEX.AI.HTTP_4013_ERROR'
,p_message_language=>'it'
,p_message_text=>'Errore di autenticazione o accesso vietato (HTTP-%1) per l''URL %0. Controllare la configurazione del servizio AI generativa %2.'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139963685789751611)
,p_name=>'APEX.AI.HTTP_ERROR'
,p_message_language=>'it'
,p_message_text=>'Richiesta HTTP inviata al servizio AI generativa in %0 non riuscita con HTTP-%1: %2'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139988069677751619)
,p_name=>'APEX.AI.HTTP_FRIENDLY_ERROR'
,p_message_language=>'it'
,p_message_text=>unistr('Errore nella richiesta HTTP inviata al servizio AI generativa per il plugin %0 in modalit\00E0 %1. Controllare la configurazione del servizio AI generativa.')
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139950828105751608)
,p_name=>'APEX.AI.MAIN_QUICK_ACTIONS_ARIA_LABEL'
,p_message_language=>'it'
,p_message_text=>'Esempi'
,p_is_js_message=>true
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139949207031751607)
,p_name=>'APEX.AI.NAME_ASSISTANT'
,p_message_language=>'it'
,p_message_text=>'Assistente'
,p_is_js_message=>true
,p_version_scn=>2705025
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139950651873751608)
,p_name=>'APEX.AI.NAME_COMMA_MESSAGE'
,p_message_language=>'it'
,p_message_text=>'%0,%1'
,p_is_js_message=>true
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139949144350751607)
,p_name=>'APEX.AI.NAME_USER'
,p_message_language=>'it'
,p_message_text=>'Utente corrente'
,p_is_js_message=>true
,p_version_scn=>2705025
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139979854267751616)
,p_name=>'APEX.AI.OCI_CHAT_NOT_SUPPORTED'
,p_message_language=>'it'
,p_message_text=>unistr('Il servizio AI generativa OCI attualmente non supporta l''esperienza di chat con pi\00F9 messaggi.')
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139959710947751610)
,p_name=>'APEX.AI.PROMPT_ENRICHMENT_ERROR'
,p_message_language=>'it'
,p_message_text=>unistr('Errore durante l''elaborazione del prompt %0 per l''applicazione %1. Controllare se App Builder \00E8 disponibile in questa istanza.')
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139964806808751612)
,p_name=>'APEX.AI.RESPONSE_ERROR'
,p_message_language=>'it'
,p_message_text=>'Impossibile elaborare la risposta per il servizio AI %0, risposta %1'
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139971017093751614)
,p_name=>'APEX.AI.SEND_MESSAGE'
,p_message_language=>'it'
,p_message_text=>'Invia messaggio'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139959360508751610)
,p_name=>'APEX.AI.SERVICE_ERROR'
,p_message_language=>'it'
,p_message_text=>'Errore nel servizio AI backend %0'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139945188749751606)
,p_name=>'APEX.AI.TEXTAREA_LABEL'
,p_message_language=>'it'
,p_message_text=>'Messaggio'
,p_is_js_message=>true
,p_version_scn=>2705023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139945293585751606)
,p_name=>'APEX.AI.TEXTAREA_PLACEHOLDER'
,p_message_language=>'it'
,p_message_text=>'Digitare il messaggio qui'
,p_is_js_message=>true
,p_version_scn=>2705023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139948503764751607)
,p_name=>'APEX.AI.USER_AVATAR'
,p_message_language=>'it'
,p_message_text=>'Usa avatar'
,p_is_js_message=>true
,p_version_scn=>2705025
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139948640233751607)
,p_name=>'APEX.AI.USE_THIS'
,p_message_language=>'it'
,p_message_text=>'Usa questo testo/messaggio'
,p_is_js_message=>true
,p_version_scn=>2705025
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139945300138751606)
,p_name=>'APEX.AI.WARN_UNSENT_MESSAGE'
,p_message_language=>'it'
,p_message_text=>unistr('\00C8 presente un messaggio non inviato. Procedere?')
,p_is_js_message=>true
,p_version_scn=>2705023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140114377780751656)
,p_name=>'APEX.AJAX_SERVER_ERROR'
,p_message_language=>'it'
,p_message_text=>'La chiamata Ajax ha restituito un errore del server %0 per %1.'
,p_version_scn=>2705058
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140041470925751634)
,p_name=>'APEX.APPLICATION.ALIAS.NON_UNIQUE'
,p_message_language=>'it'
,p_message_text=>'Impossibile convertire l''alias di applicazione "%0" in un ID di applicazione univoco.'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140030216681751631)
,p_name=>'APEX.APPLICATION.ALIAS.UNHANDLED_ERROR'
,p_message_language=>'it'
,p_message_text=>'ERR-1816 Errore imprevisto durante la conversione dell''alias di applicazione p_flow_alias_or_id (%0).'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140127675134751660)
,p_name=>'APEX.APPLICATION.CHECKSUM.DESCRIPTION'
,p_message_language=>'it'
,p_message_text=>unistr('Il checksum dell''applicazione offre un metodo semplice per stabilire se la stessa applicazione viene distribuita nelle varie aree di lavoro. \00C8 possibile confrontare questo checksum per verificare l''eventuale presenza di una corrispondenza. ')
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140014289685751626)
,p_name=>'APEX.AUTHENTICATION.AUTH_FUNC.UNHANDLED_ERROR'
,p_message_language=>'it'
,p_message_text=>'Errore durante l''elaborazione della funzione di autenticazione.'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139996251710751621)
,p_name=>'APEX.AUTHENTICATION.AUTH_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'it'
,p_message_text=>'Errore durante l''elaborazione della funzione di autenticazione.'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140168152847751672)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.HOST_PREFIX_MISMATCH'
,p_message_language=>'it'
,p_message_text=>unistr('Il nome tenant %0 restituito da Oracle Cloud Identity Management non \00E8 autorizzato per il dominio %1.<br/><a href="&LOGOUT_URL.">Eseguire di nuovo il login</a> e specificare un nome tenant autorizzato oppure modificare l''URL.')
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139992309283751620)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.USER_IS_NOT_DEVELOPER'
,p_message_language=>'it'
,p_message_text=>'L''account "%0" non dispone dei privilegi di sviluppo necessari (DB_DEVELOPER o DB_ADMINISTRATOR)<br/>per l''area di lavoro "%1". <a href="&LOGOUT_URL.">Eseguire di nuovo il login</a> dopo aver ottenuto i privilegi.'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139988926515751619)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.WRONG_GROUP_NAME'
,p_message_language=>'it'
,p_message_text=>unistr('Il nome tenant restituito da Oracle Cloud Identity Management non \00E8 autorizzato per l''area di lavoro corrente.<br/><a href="&LOGOUT_URL.">Eseguire di nuovo il login</a> e specificare un nome tenant autorizzato.')
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139992464039751620)
,p_name=>'APEX.AUTHENTICATION.HOST_PREFIX_MISMATCH'
,p_message_language=>'it'
,p_message_text=>unistr('Per motivi di sicurezza, l''esecuzione delle applicazioni di questa area di lavoro tramite il dominio nell''URL non \00E8 consentita.')
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140013901279751626)
,p_name=>'APEX.AUTHENTICATION.LDAP.DBMS_LDAP.ASK_FOR_INSTALLATION'
,p_message_language=>'it'
,p_message_text=>'Chiedere al proprio DBA di eseguire $OH/rdbms/admin/catldap.sql.'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140013820758751626)
,p_name=>'APEX.AUTHENTICATION.LDAP.DBMS_LDAP.MISSING'
,p_message_language=>'it'
,p_message_text=>unistr('Il package SYS.DBMS_LDAP non esiste o non \00E8 valido.')
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140013706381751626)
,p_name=>'APEX.AUTHENTICATION.LDAP.EDIT_USER_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'it'
,p_message_text=>'Errore durante l''elaborazione della funzione di modifica utente LDAP.'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140014083548751626)
,p_name=>'APEX.AUTHENTICATION.LDAP.UNHANDLED_ERROR'
,p_message_language=>'it'
,p_message_text=>'Errore durante l''elaborazione dell''autenticazione LDAP.'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140014895574751627)
,p_name=>'APEX.AUTHENTICATION.LOGIN.ILLEGAL_PAGE_ARG'
,p_message_language=>'it'
,p_message_text=>'Errore nell''argomento p_flow_page per la procedura login_page.'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140014488931751626)
,p_name=>'APEX.AUTHENTICATION.LOGIN.INVALID_ARG'
,p_message_language=>'it'
,p_message_text=>'p_session non valido in wwv_flow_custom_auth_std.login--p_flow_page:%0 p_session_id:%1.'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140065724388751642)
,p_name=>'APEX.AUTHENTICATION.LOGIN.MALFORMED_ARGS'
,p_message_language=>'it'
,p_message_text=>'Argomento con formato non valido per wwv_flow_custom_auth_std.login--p_flow_page:p_session_id:p_entry_point:%0:%1:%2.'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140014519501751626)
,p_name=>'APEX.AUTHENTICATION.LOGIN.NULL_USER'
,p_message_language=>'it'
,p_message_text=>'Nome utente nullo passato alla procedura di login.'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140001384521751623)
,p_name=>'APEX.AUTHENTICATION.LOGIN_THROTTLE.COUNTER'
,p_message_language=>'it'
,p_message_text=>'Attendere <span id="apex_login_throttle_sec">%0</span> secondi prima di tentare di nuovo la connessione.'
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140002614097751623)
,p_name=>'APEX.AUTHENTICATION.LOGIN_THROTTLE.ERROR'
,p_message_language=>'it'
,p_message_text=>unistr('Il tentativo di login \00E8 stato bloccato.')
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140063463029751641)
,p_name=>'APEX.AUTHENTICATION.NOT_FOUND'
,p_message_language=>'it'
,p_message_text=>'Autenticazione "%0" non trovata'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140003183153751623)
,p_name=>'APEX.AUTHENTICATION.NO_SECURITY_GROUP_ID'
,p_message_language=>'it'
,p_message_text=>'ID gruppo di sicurezza nullo.'
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140014305801751626)
,p_name=>'APEX.AUTHENTICATION.POST_AUTH_PROC.UNHANDLED_ERROR'
,p_message_language=>'it'
,p_message_text=>'Errore durante l''esecuzione del processo di post-autenticazione.'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140014173279751626)
,p_name=>'APEX.AUTHENTICATION.PRE_AUTH_PROC.UNHANDLED_ERROR'
,p_message_language=>'it'
,p_message_text=>'Errore durante l''elaborazione del processo di pre-autenticazione.'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140015858503751627)
,p_name=>'APEX.AUTHENTICATION.RESET_PASSWORD.INSTRUCTIONS'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Aprire l''URL nello stesso browser in cui \00E8 stata avviata la richiesta di reimpostazione della password. Se si fa clic sul pulsante Reimposta URL password e si viene reindirizzati alla'),
'pagina di login, avviare di nuovo la reimpostazione della password e lasciare il',
'browser aperto.'))
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140165682725751671)
,p_name=>'APEX.AUTHENTICATION.RESET_PASSWORD_URL'
,p_message_language=>'it'
,p_message_text=>'Reimposta URL password'
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139992606093751620)
,p_name=>'APEX.AUTHENTICATION.RM_GROUP_NOT_GRANTED'
,p_message_language=>'it'
,p_message_text=>unistr('Il gruppo di consumer di Resource Manager %0 non \00E8 stato concesso a %1')
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139992782825751620)
,p_name=>'APEX.AUTHENTICATION.RM_INFO_TO_GRANT'
,p_message_language=>'it'
,p_message_text=>'Usare DBMS_RESOURCE_MANAGER_PRIVS.GRANT_SWITCH_CONSUMER_GROUP per concedere il privilegio mancante.'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140027349087751630)
,p_name=>'APEX.AUTHENTICATION.SESSION_SENTRY_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'it'
,p_message_text=>'Errore durante l''elaborazione della funzione sentry della sessione.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140027407453751630)
,p_name=>'APEX.AUTHENTICATION.SESSION_VERIFY_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'it'
,p_message_text=>'Errore durante l''elaborazione della funzione di verifica della sessione.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140027679051751630)
,p_name=>'APEX.AUTHENTICATION.SSO.ASK_FOR_INSTALLATION'
,p_message_language=>'it'
,p_message_text=>'Chiedere all''amministratore di %0 di configurare il motore per Oracle Application Server Single Sign-On.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140038045310751633)
,p_name=>'APEX.AUTHENTICATION.SSO.BAD_URLC'
,p_message_language=>'it'
,p_message_text=>'%0 non valido nel token %1 restituito da SSO.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140014720332751627)
,p_name=>'APEX.AUTHENTICATION.SSO.FIX_PARTNER_APP'
,p_message_language=>'it'
,p_message_text=>'Modificare lo schema di autenticazione e aggiungere il nome dell''applicazione.'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140037788925751633)
,p_name=>'APEX.AUTHENTICATION.SSO.ILLEGAL_CALLER'
,p_message_language=>'it'
,p_message_text=>'Chiamante non valido della procedura %0:'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140037930366751633)
,p_name=>'APEX.AUTHENTICATION.SSO.INVALID_APP_SESSION'
,p_message_language=>'it'
,p_message_text=>'Sessione di applicazione non valida nel token URLC: %0'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140037589587751633)
,p_name=>'APEX.AUTHENTICATION.SSO.MISSING_APP_REGISTRATION'
,p_message_language=>'it'
,p_message_text=>'Errore in portal_sso_redirect: informazioni sulla registrazione dell''applicazione mancanti: %0'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140027503477751630)
,p_name=>'APEX.AUTHENTICATION.SSO.PACKAGE_MISSING'
,p_message_language=>'it'
,p_message_text=>unistr('Il package WWSEC_SSO_ENABLER_PRIVATE non esiste o non \00E8 valido.')
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140014626472751626)
,p_name=>'APEX.AUTHENTICATION.SSO.PARTNER_APP_IS_NULL'
,p_message_language=>'it'
,p_message_text=>'Impossibile trovare il nome di applicazione partner registrato nello schema di autenticazione.'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140037629742751633)
,p_name=>'APEX.AUTHENTICATION.SSO.REGISTER_APP'
,p_message_language=>'it'
,p_message_text=>'Registrare questa applicazione come descritto nella guida all''installazione.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140027752324751630)
,p_name=>'APEX.AUTHENTICATION.SSO.UNHANDLED_ERROR'
,p_message_language=>'it'
,p_message_text=>'Errore durante l''elaborazione dell''autenticazione SSO.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140141093254751664)
,p_name=>'APEX.AUTHENTICATION.UNAUTHORIZED_URL'
,p_message_language=>'it'
,p_message_text=>'URL non autorizzato: %0'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140027109856751630)
,p_name=>'APEX.AUTHENTICATION.UNHANDLED_ERROR'
,p_message_language=>'it'
,p_message_text=>'Errore durante l''elaborazione dell''autenticazione.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139992502529751620)
,p_name=>'APEX.AUTHENTICATION.WORKSPACE_NOT_ASSIGNED'
,p_message_language=>'it'
,p_message_text=>unistr('L''area di lavoro "%0" \00E8 inattiva. Contattare l''amministratore.')
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139993293838751620)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED'
,p_message_language=>'it'
,p_message_text=>'%0'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140002394169751623)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED.APPLICATION'
,p_message_language=>'it'
,p_message_text=>'Accesso negato dal controllo di sicurezza dell''applicazione'
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140002497713751623)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED.PAGE'
,p_message_language=>'it'
,p_message_text=>'Accesso negato dal controllo di sicurezza della pagina'
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140002523478751623)
,p_name=>'APEX.AUTHORIZATION.UNHANDLED_ERROR'
,p_message_language=>'it'
,p_message_text=>'Errore durante l''elaborazione dell''autorizzazione.'
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140071686879751643)
,p_name=>'APEX.BUILT_WITH_LOVE_USING_APEX'
,p_message_language=>'it'
,p_message_text=>'Creato con %0 utilizzando %1'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140071762156751643)
,p_name=>'APEX.BUILT_WITH_LOVE_USING_APEX.ACCESSIBLE.LOVE'
,p_message_language=>'it'
,p_message_text=>'love'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140131587640751661)
,p_name=>'APEX.CALENDAR.EVENT_DESCRIPTION'
,p_message_language=>'it'
,p_message_text=>'Descrizione evento'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140131372969751661)
,p_name=>'APEX.CALENDAR.EVENT_END'
,p_message_language=>'it'
,p_message_text=>'Data di fine'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140131667691751661)
,p_name=>'APEX.CALENDAR.EVENT_ID'
,p_message_language=>'it'
,p_message_text=>'ID evento'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140131292949751661)
,p_name=>'APEX.CALENDAR.EVENT_START'
,p_message_language=>'it'
,p_message_text=>'Data di inizio'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140131438586751661)
,p_name=>'APEX.CALENDAR.EVENT_TITLE'
,p_message_language=>'it'
,p_message_text=>'Titolo evento'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139974030509751614)
,p_name=>'APEX.CARD'
,p_message_language=>'it'
,p_message_text=>'Scheda'
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139974208826751615)
,p_name=>'APEX.CARD.CARD_ACTION'
,p_message_language=>'it'
,p_message_text=>'Azione scheda'
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140014916665751627)
,p_name=>'APEX.CHECKBOX.VISUALLY_HIDDEN_CHECKBOX'
,p_message_language=>'it'
,p_message_text=>'Casella di controllo nascosta'
,p_is_js_message=>true
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140016832719751627)
,p_name=>'APEX.CHECKSUM.CONTENT_ERROR'
,p_message_language=>'it'
,p_message_text=>'Errore di contenuto checksum'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140016752209751627)
,p_name=>'APEX.CHECKSUM.FORMAT_ERROR'
,p_message_language=>'it'
,p_message_text=>'Errore di formato checksum'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140086643492751648)
,p_name=>'APEX.CLIPBOARD.COPIED'
,p_message_language=>'it'
,p_message_text=>'Copiato negli Appunti.'
,p_is_js_message=>true
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140086150660751648)
,p_name=>'APEX.CLIPBOARD.NOTSUP'
,p_message_language=>'it'
,p_message_text=>'Questo browser non supporta la copia da un pulsante o da un menu. Provare con Ctrl+C o Comando+C.'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140072343376751644)
,p_name=>'APEX.CLOSE_NOTIFICATION'
,p_message_language=>'it'
,p_message_text=>'Chiudi'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139950761171751608)
,p_name=>'APEX.CODE_EDITOR.MAXIMUM_LENGTH_EXCEEDED'
,p_message_language=>'it'
,p_message_text=>'I contenuti dell''editor di codice superano la lunghezza massima dell''elemento (caratteri effettivi: %0, caratteri consentiti: %1)'
,p_is_js_message=>true
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140130832217751661)
,p_name=>'APEX.COLOR_PICKER.CONTRAST'
,p_message_language=>'it'
,p_message_text=>'Contrasto'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140125358599751659)
,p_name=>'APEX.COLOR_PICKER.CURRENT'
,p_message_language=>'it'
,p_message_text=>'Corrente'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140125241548751659)
,p_name=>'APEX.COLOR_PICKER.INITIAL'
,p_message_language=>'it'
,p_message_text=>'Iniziale'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140129409947751661)
,p_name=>'APEX.COLOR_PICKER.INVALID_COLOR'
,p_message_language=>'it'
,p_message_text=>'#LABEL# deve essere un colore valido. Esempio: %0'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139991858595751620)
,p_name=>'APEX.COLOR_PICKER.MORE_PRESET_COLORS'
,p_message_language=>'it'
,p_message_text=>'Altri colori'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139991936547751620)
,p_name=>'APEX.COLOR_PICKER.OPEN'
,p_message_language=>'it'
,p_message_text=>'Apri selettore colori'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139949018829751607)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.ALPHA_SLIDER'
,p_message_language=>'it'
,p_message_text=>'Dispositivo di scorrimento alpha, dispositivo di scorrimento orizzontale. Usare i tasti freccia per navigare.'
,p_is_js_message=>true
,p_version_scn=>2705025
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139948782969751607)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.COLOR_SPECTRUM'
,p_message_language=>'it'
,p_message_text=>'Spettro di colori, dispositivo di scorrimento quadridirezionale. Usare i tasti freccia per navigare.'
,p_is_js_message=>true
,p_version_scn=>2705025
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139948869502751607)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.HUE_SLIDER'
,p_message_language=>'it'
,p_message_text=>unistr('Dispositivo di scorrimento della tonalit\00E0, dispositivo di scorrimento verticale. Usare i tasti freccia per navigare.')
,p_is_js_message=>true
,p_version_scn=>2705025
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140125102723751659)
,p_name=>'APEX.COLOR_PICKER.TITLE'
,p_message_language=>'it'
,p_message_text=>'Scegli un colore'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140125412707751659)
,p_name=>'APEX.COLOR_PICKER.TOGGLE_TITLE'
,p_message_language=>'it'
,p_message_text=>'Modifica formato colore'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140163344818751670)
,p_name=>'APEX.COMBOBOX.LIST_OF_VALUES'
,p_message_language=>'it'
,p_message_text=>'Lista di valori'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140163456666751670)
,p_name=>'APEX.COMBOBOX.SHOW_ALL_VALUES'
,p_message_language=>'it'
,p_message_text=>'Apri lista per: %0'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140143718797751665)
,p_name=>'APEX.COMPLETED_STATE'
,p_message_language=>'it'
,p_message_text=>'(Completato)'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140032685567751632)
,p_name=>'APEX.CONTACT_ADMIN'
,p_message_language=>'it'
,p_message_text=>'Rivolgersi all''amministratore delle applicazioni.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140048143434751636)
,p_name=>'APEX.CONTACT_ADMIN.DEBUG'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Contattare l''amministratore dell''applicazione.',
'I dettagli relativi all''incidente sono disponibili tramite l''ID debug "%0".'))
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140129775238751661)
,p_name=>'APEX.CORRECT_ERRORS'
,p_message_language=>'it'
,p_message_text=>'Correggere gli errori prima di salvare'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139975051747751615)
,p_name=>'APEX.CS.ACTIVE_VALUE_CHIP'
,p_message_language=>'it'
,p_message_text=>'%0. Premere il tasto Backspace per eliminare.'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140073224445751644)
,p_name=>'APEX.CS.MATCHES_FOUND'
,p_message_language=>'it'
,p_message_text=>'%0 corrispondenze trovate'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139955152671751609)
,p_name=>'APEX.CS.MATCH_FOUND'
,p_message_language=>'it'
,p_message_text=>'1 corrispondenza trovata'
,p_is_js_message=>true
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140073122200751644)
,p_name=>'APEX.CS.NO_MATCHES'
,p_message_language=>'it'
,p_message_text=>'Nessuna corrispondenza trovata'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139949546954751607)
,p_name=>'APEX.CS.OTHERS_GROUP'
,p_message_language=>'it'
,p_message_text=>'Altri'
,p_is_js_message=>true
,p_version_scn=>2705025
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139949489586751607)
,p_name=>'APEX.CS.SELECTED_VALUES_COUNTER'
,p_message_language=>'it'
,p_message_text=>'%0 valori selezionati'
,p_is_js_message=>true
,p_version_scn=>2705025
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140144285017751665)
,p_name=>'APEX.CURRENT_PROGRESS'
,p_message_language=>'it'
,p_message_text=>'Avanzamento corrente'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140130123280751661)
,p_name=>'APEX.DATA.LOAD.FILE_DOES_NOT_EXIST'
,p_message_language=>'it'
,p_message_text=>'Il file specificato nell''elemento %0 non esiste in APEX_APPLICATION_TEMP_FILES.'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140118611756751657)
,p_name=>'APEX.DATA_HAS_CHANGED'
,p_message_language=>'it'
,p_message_text=>unistr('La versione corrente dei dati nel database \00E8 cambiata da quando l''utente ha iniziato il processo di aggiornamento.')
,p_version_scn=>2705059
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140087702149751648)
,p_name=>'APEX.DATA_LOAD.DO_NOT_LOAD'
,p_message_language=>'it'
,p_message_text=>'Non caricare'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140134097439751662)
,p_name=>'APEX.DATA_LOAD.FAILED'
,p_message_language=>'it'
,p_message_text=>'Errore di pre-elaborazione'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140133841903751662)
,p_name=>'APEX.DATA_LOAD.INSERT'
,p_message_language=>'it'
,p_message_text=>'Inserisci riga'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140147418133751666)
,p_name=>'APEX.DATA_LOAD.SEQUENCE_ACTION'
,p_message_language=>'it'
,p_message_text=>'Sequenza: azione'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140133956109751662)
,p_name=>'APEX.DATA_LOAD.UPDATE'
,p_message_language=>'it'
,p_message_text=>'Aggiorna riga'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139962457742751611)
,p_name=>'APEX.DATEPICKER.ACTIONS'
,p_message_language=>'it'
,p_message_text=>'Azioni'
,p_is_js_message=>true
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139990074857751619)
,p_name=>'APEX.DATEPICKER.AM_PM'
,p_message_language=>'it'
,p_message_text=>'AM/PM'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139976185332751615)
,p_name=>'APEX.DATEPICKER.BOUNDARY_ITEM_FORMAT_INVALID'
,p_message_language=>'it'
,p_message_text=>'%0 deve essere un selettore data o una data valida, ad esempio %1.'
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140085356987751647)
,p_name=>'APEX.DATEPICKER.CLEAR'
,p_message_language=>'it'
,p_message_text=>'Cancella'
,p_is_js_message=>true
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139993571952751620)
,p_name=>'APEX.DATEPICKER.DONE'
,p_message_language=>'it'
,p_message_text=>'Fine'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140004509740751624)
,p_name=>'APEX.DATEPICKER.FORMAT_NOT_SUPPORTED'
,p_message_language=>'it'
,p_message_text=>'Il formato di visualizzazione di %0 contiene parti non supportate: %1'
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139989734679751619)
,p_name=>'APEX.DATEPICKER.HOUR'
,p_message_language=>'it'
,p_message_text=>'Ora'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140073650631751644)
,p_name=>'APEX.DATEPICKER.ICON_TEXT'
,p_message_language=>'it'
,p_message_text=>'Calendario popup: %0'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139989555120751619)
,p_name=>'APEX.DATEPICKER.ISO_WEEK'
,p_message_language=>'it'
,p_message_text=>'Settimana'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139989604070751619)
,p_name=>'APEX.DATEPICKER.ISO_WEEK_ABBR'
,p_message_language=>'it'
,p_message_text=>'WK'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139989934235751619)
,p_name=>'APEX.DATEPICKER.MINUTES'
,p_message_language=>'it'
,p_message_text=>'Minuti'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139990115673751619)
,p_name=>'APEX.DATEPICKER.MONTH'
,p_message_language=>'it'
,p_message_text=>'Mese'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139990535300751619)
,p_name=>'APEX.DATEPICKER.NEXT_MONTH'
,p_message_language=>'it'
,p_message_text=>'Mese successivo'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139960197174751610)
,p_name=>'APEX.DATEPICKER.POPUP'
,p_message_language=>'it'
,p_message_text=>'Popup per %0'
,p_is_js_message=>true
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139990460063751619)
,p_name=>'APEX.DATEPICKER.PREVIOUS_MONTH'
,p_message_language=>'it'
,p_message_text=>'Mese precedente'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140082992461751647)
,p_name=>'APEX.DATEPICKER.READONLY_DATEPICKER'
,p_message_language=>'it'
,p_message_text=>'Selettore data di sola lettura'
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139991365247751620)
,p_name=>'APEX.DATEPICKER.SELECT_DATE'
,p_message_language=>'it'
,p_message_text=>'Seleziona data'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139960279578751610)
,p_name=>'APEX.DATEPICKER.SELECT_DATE_AND_TIME'
,p_message_language=>'it'
,p_message_text=>'Seleziona data e ora'
,p_is_js_message=>true
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139957432143751610)
,p_name=>'APEX.DATEPICKER.SELECT_DAY'
,p_message_language=>'it'
,p_message_text=>'Seleziona giorno'
,p_is_js_message=>true
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139960812834751611)
,p_name=>'APEX.DATEPICKER.SELECT_MONTH_AND_YEAR'
,p_message_language=>'it'
,p_message_text=>'Seleziona mese e anno'
,p_is_js_message=>true
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139957612244751610)
,p_name=>'APEX.DATEPICKER.SELECT_TIME'
,p_message_language=>'it'
,p_message_text=>'Seleziona ora'
,p_is_js_message=>true
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139958135316751610)
,p_name=>'APEX.DATEPICKER.TODAY'
,p_message_language=>'it'
,p_message_text=>'Oggi'
,p_is_js_message=>true
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139975794082751615)
,p_name=>'APEX.DATEPICKER.VALUE_INVALID'
,p_message_language=>'it'
,p_message_text=>'#LABEL# deve essere una data valida, ad esempio %0.'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139975441412751615)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_BETWEEN'
,p_message_language=>'it'
,p_message_text=>'#LABEL# deve essere compresa tra %0 e %1.'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139975528164751615)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_ON_OR_AFTER'
,p_message_language=>'it'
,p_message_text=>'#LABEL# deve essere uguale o successiva a %0.'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139975690462751615)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_ON_OR_BEFORE'
,p_message_language=>'it'
,p_message_text=>'#LABEL# deve essere uguale o precedente a %0.'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139967052270751612)
,p_name=>'APEX.DATEPICKER.VISUALLY_HIDDEN_EDIT'
,p_message_language=>'it'
,p_message_text=>'Modifica nascosta'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139990349647751619)
,p_name=>'APEX.DATEPICKER.YEAR'
,p_message_language=>'it'
,p_message_text=>'Anno'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140077306743751645)
,p_name=>'APEX.DATEPICKER_VALUE_GREATER_MAX_DATE'
,p_message_language=>'it'
,p_message_text=>unistr('Il valore di #LABEL# \00E8 maggiore della data massima specificata %0.')
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140077752528751645)
,p_name=>'APEX.DATEPICKER_VALUE_INVALID'
,p_message_language=>'it'
,p_message_text=>'Il valore di #LABEL# non corrisponde al formato %0.'
,p_is_js_message=>true
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140077280770751645)
,p_name=>'APEX.DATEPICKER_VALUE_LESS_MIN_DATE'
,p_message_language=>'it'
,p_message_text=>unistr('Il valore di #LABEL# \00E8 minore della data minima specificata %0.')
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140077405786751645)
,p_name=>'APEX.DATEPICKER_VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'it'
,p_message_text=>'#LABEL# non rientra nell''intervallo valido compreso tra %0 e %1.'
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140077698977751645)
,p_name=>'APEX.DATEPICKER_VALUE_NOT_IN_YEAR_RANGE'
,p_message_language=>'it'
,p_message_text=>unistr('Il valore di #LABEL# non \00E8 compreso nell''intervallo valido di anni tra %0 e %1.')
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139969488739751613)
,p_name=>'APEX.DBMS_CLOUD_INT.DBMS_CLOUD_ERROR'
,p_message_language=>'it'
,p_message_text=>unistr('Si \00E8 verificato un errore interno durante l''elaborazione della richiesta DBMS_CLOUD.')
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140130062826751661)
,p_name=>'APEX.DIALOG.CANCEL'
,p_message_language=>'it'
,p_message_text=>'Annulla'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140155954559751668)
,p_name=>'APEX.DIALOG.CLOSE'
,p_message_language=>'it'
,p_message_text=>'Chiudi'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140017170744751627)
,p_name=>'APEX.DIALOG.CONFIRMATION'
,p_message_language=>'it'
,p_message_text=>'Conferma'
,p_is_js_message=>true
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140157966593751669)
,p_name=>'APEX.DIALOG.HELP'
,p_message_language=>'it'
,p_message_text=>'Guida'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140129864876751661)
,p_name=>'APEX.DIALOG.OK'
,p_message_language=>'it'
,p_message_text=>'OK'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140129904835751661)
,p_name=>'APEX.DIALOG.SAVE'
,p_message_language=>'it'
,p_message_text=>'Salva'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139997699643751621)
,p_name=>'APEX.DIALOG.TITLE'
,p_message_language=>'it'
,p_message_text=>'Titolo finestra di dialogo'
,p_is_js_message=>true
,p_version_scn=>2705035
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140037362324751633)
,p_name=>'APEX.DIALOG.VISUALLY_HIDDEN_TITLE'
,p_message_language=>'it'
,p_message_text=>'Titolo finestra di dialogo nascosto'
,p_is_js_message=>true
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139958423773751610)
,p_name=>'APEX.DOCGEN'
,p_message_language=>'it'
,p_message_text=>'Funzione pregenerata Generatore di documenti Oracle'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139969278810751613)
,p_name=>'APEX.DOCGEN.DBMS_CLOUD_ERROR'
,p_message_language=>'it'
,p_message_text=>'Errore durante la stampa di un documento.'
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139946454237751606)
,p_name=>'APEX.DOCGEN.INVALID_OUTPUT_TYPE'
,p_message_language=>'it'
,p_message_text=>'%s non supporta %1 come output.'
,p_version_scn=>2705024
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139958338478751610)
,p_name=>'APEX.DOCGEN.INVOKE_ERROR'
,p_message_language=>'it'
,p_message_text=>'Errore "%0" durante il richiamo della funzione pregenerata Generatore di documenti Oracle:'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139949856485751607)
,p_name=>'APEX.DOCGEN.TEMPLATE_REQUIRED'
,p_message_language=>'it'
,p_message_text=>'Modello obbligatorio.'
,p_version_scn=>2705025
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139975252844751615)
,p_name=>'APEX.DOWNLOAD.ERROR'
,p_message_language=>'it'
,p_message_text=>'Errore durante il download del file.'
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139975138832751615)
,p_name=>'APEX.DOWNLOAD.NO_DATA_FOUND'
,p_message_language=>'it'
,p_message_text=>'Nessun dato scaricabile trovato.'
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139978722996751616)
,p_name=>'APEX.ENVIRONMENT.RUNTIME_ONLY'
,p_message_language=>'it'
,p_message_text=>unistr('Questa funzionalit\00E0 non \00E8 disponibile nell''ambiente solo di runtime.')
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140031574559751631)
,p_name=>'APEX.ERROR'
,p_message_language=>'it'
,p_message_text=>'Errore'
,p_is_js_message=>true
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139991474314751620)
,p_name=>'APEX.ERROR.CALLBACK_FAILED'
,p_message_language=>'it'
,p_message_text=>unistr('Durante il callback di gestione degli errori si \00E8 verificato l''errore seguente: %0')
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140004013164751623)
,p_name=>'APEX.ERROR.ERROR_PAGE.UNHANDLED_ERROR'
,p_message_language=>'it'
,p_message_text=>unistr('Si \00E8 verificato un errore durante la pittura della pagina di errore: %0')
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139993193721751620)
,p_name=>'APEX.ERROR.INTERNAL'
,p_message_language=>'it'
,p_message_text=>'Errore interno'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140142810770751664)
,p_name=>'APEX.ERROR.INTERNAL.CONTACT_ADMINISTRATOR'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Contattare l''amministratore.',
'I dettagli relativi all''incidente sono disponibili tramite l''ID debug "%0".'))
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140137439617751663)
,p_name=>'APEX.ERROR.ORA-16000'
,p_message_language=>'it'
,p_message_text=>unistr('Il database \00E8 aperto per l''accesso in sola lettura.')
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140167551341751672)
,p_name=>'APEX.ERROR.ORA-28353'
,p_message_language=>'it'
,p_message_text=>'ORA-28353: apertura del wallet non riuscita. Dati dell''applicazione attualmente non accessibili.'
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140137567544751663)
,p_name=>'APEX.ERROR.PAGE_NOT_AVAILABLE'
,p_message_language=>'it'
,p_message_text=>unistr('Questa pagina non \00E8 disponibile')
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139996123238751621)
,p_name=>'APEX.ERROR.TECHNICAL_INFO'
,p_message_language=>'it'
,p_message_text=>'Informazioni tecniche (disponibili solo per gli sviluppatori)'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140102037381751652)
,p_name=>'APEX.ERROR_MESSAGE_HEADING'
,p_message_language=>'it'
,p_message_text=>'Messaggio di errore'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140115984199751656)
,p_name=>'APEX.EXPECTED_FORMAT'
,p_message_language=>'it'
,p_message_text=>'Formato previsto: %0'
,p_version_scn=>2705058
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140080831391751646)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.ALREADY_IN_ACL'
,p_message_language=>'it'
,p_message_text=>unistr('L''utente \00E8 gi\00E0 definito nella lista di controllo dell''accesso')
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140080754574751646)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.CREATE_CONFIRM'
,p_message_language=>'it'
,p_message_text=>'Confermare l''aggiunta di %0 utente/i seguenti alla lista di controllo dell''accesso <strong>%1</strong>.'
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140081238479751646)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.DUPLICATE_USER'
,p_message_language=>'it'
,p_message_text=>'Esiste un utente duplicato'
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140080949821751646)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.MISSING_AT_SIGN'
,p_message_language=>'it'
,p_message_text=>'Chiocciola (@) mancante nell''indirizzo di posta elettronica'
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140081079575751646)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.MISSING_DOT'
,p_message_language=>'it'
,p_message_text=>'Punto (.) mancante nell''indirizzo di posta elettronica'
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140081143944751646)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.USERNAME_TOO_LONG'
,p_message_language=>'it'
,p_message_text=>unistr('Il nome utente \00E8 troppo lungo')
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140081480810751646)
,p_name=>'APEX.FEATURE.ACL.INFO.ACL_ONLY'
,p_message_language=>'it'
,p_message_text=>'Solo gli utenti definiti nella lista di controllo dell''accesso dell''applicazione possono accedere a questa applicazione'
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140081536235751646)
,p_name=>'APEX.FEATURE.ACL.INFO.ACL_VALUE_INVALID'
,p_message_language=>'it'
,p_message_text=>'Valore di impostazione del controllo dell''accesso imprevisto: %0'
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140081361951751646)
,p_name=>'APEX.FEATURE.ACL.INFO.ALL_USERS'
,p_message_language=>'it'
,p_message_text=>'Tutti gli utenti autenticati possono accedere a questa applicazione'
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140125801200751659)
,p_name=>'APEX.FEATURE.CONFIG.DISABLED'
,p_message_language=>'it'
,p_message_text=>'Disabilitato'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140125757878751659)
,p_name=>'APEX.FEATURE.CONFIG.ENABLED'
,p_message_language=>'it'
,p_message_text=>'Abilitato'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140126081902751660)
,p_name=>'APEX.FEATURE.CONFIG.IS_DISABLED'
,p_message_language=>'it'
,p_message_text=>unistr('%0: \00C8 disabilitato')
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140125934059751659)
,p_name=>'APEX.FEATURE.CONFIG.IS_ENABLED'
,p_message_language=>'it'
,p_message_text=>unistr('%0: \00C8 abilitato')
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139974531935751615)
,p_name=>'APEX.FEATURE.CONFIG.NOT_SUPPORTED'
,p_message_language=>'it'
,p_message_text=>'Non supportato'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140035763419751633)
,p_name=>'APEX.FEATURE.CONFIG.OFF'
,p_message_language=>'it'
,p_message_text=>'Non attivo'
,p_is_js_message=>true
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140035633720751633)
,p_name=>'APEX.FEATURE.CONFIG.ON'
,p_message_language=>'it'
,p_message_text=>'Attivo'
,p_is_js_message=>true
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140125615791751659)
,p_name=>'APEX.FEATURE.TOP_USERS.USERNAME.NOT_IDENTIFIED'
,p_message_language=>'it'
,p_message_text=>'non identificato'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139966139553751612)
,p_name=>'APEX.FILESIZE.BYTES'
,p_message_language=>'it'
,p_message_text=>'%0 byte'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139966692903751612)
,p_name=>'APEX.FILESIZE.GB'
,p_message_language=>'it'
,p_message_text=>'%0 GB'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139966341707751612)
,p_name=>'APEX.FILESIZE.KB'
,p_message_language=>'it'
,p_message_text=>'%0 KB'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139966524488751612)
,p_name=>'APEX.FILESIZE.MB'
,p_message_language=>'it'
,p_message_text=>'%0 MB'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140118811388751657)
,p_name=>'APEX.FILE_BROWSE.DOWNLOAD_LINK_TEXT'
,p_message_language=>'it'
,p_message_text=>'Scarica'
,p_is_js_message=>true
,p_version_scn=>2705059
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139971991653751614)
,p_name=>'APEX.FS.ACTIONS_MENU_BUTTON_LABEL'
,p_message_language=>'it'
,p_message_text=>'Opzioni'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139971631766751614)
,p_name=>'APEX.FS.ACTIONS_MENU_FILTER'
,p_message_language=>'it'
,p_message_text=>'Filtra'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139971866258751614)
,p_name=>'APEX.FS.ACTIONS_MENU_HIDE'
,p_message_language=>'it'
,p_message_text=>'Nascondi facet'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139996522995751621)
,p_name=>'APEX.FS.ADD_FILTER'
,p_message_language=>'it'
,p_message_text=>'Aggiungi filtro'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140072869446751644)
,p_name=>'APEX.FS.APPLIED_FACET'
,p_message_language=>'it'
,p_message_text=>'Filtro applicato %0'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139997296503751621)
,p_name=>'APEX.FS.APPLY'
,p_message_language=>'it'
,p_message_text=>'Applica'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140116413082751657)
,p_name=>'APEX.FS.BATCH_APPLY'
,p_message_language=>'it'
,p_message_text=>'Applica'
,p_is_js_message=>true
,p_version_scn=>2705059
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139997396360751621)
,p_name=>'APEX.FS.CANCEL'
,p_message_language=>'it'
,p_message_text=>'Annulla'
,p_is_js_message=>true
,p_version_scn=>2705035
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139981110141751617)
,p_name=>'APEX.FS.CHART_BAR'
,p_message_language=>'it'
,p_message_text=>'Grafico a barre'
,p_is_js_message=>true
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140129141025751660)
,p_name=>'APEX.FS.CHART_OTHERS'
,p_message_language=>'it'
,p_message_text=>'Altri'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139981291153751617)
,p_name=>'APEX.FS.CHART_PIE'
,p_message_language=>'it'
,p_message_text=>'Grafico a torta'
,p_is_js_message=>true
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140127797375751660)
,p_name=>'APEX.FS.CHART_TITLE'
,p_message_language=>'it'
,p_message_text=>'Grafico'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139980940075751617)
,p_name=>'APEX.FS.CHART_VALUE_LABEL'
,p_message_language=>'it'
,p_message_text=>'Conteggio'
,p_is_js_message=>true
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140116997990751657)
,p_name=>'APEX.FS.CLEAR'
,p_message_language=>'it'
,p_message_text=>'Cancella'
,p_is_js_message=>true
,p_version_scn=>2705059
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140117033929751657)
,p_name=>'APEX.FS.CLEAR_ALL'
,p_message_language=>'it'
,p_message_text=>'Cancella tutto'
,p_is_js_message=>true
,p_version_scn=>2705059
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140117103745751657)
,p_name=>'APEX.FS.CLEAR_VALUE'
,p_message_language=>'it'
,p_message_text=>'Cancella %0'
,p_is_js_message=>true
,p_version_scn=>2705059
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140133639183751662)
,p_name=>'APEX.FS.COLUMN_UNAUTHORIZED'
,p_message_language=>'it'
,p_message_text=>unistr('La colonna %1, a cui fa riferimento il facet %0, non \00E8 disponibile o non \00E8 autorizzata.')
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139944362167751606)
,p_name=>'APEX.FS.CONFIG_TITLE'
,p_message_language=>'it'
,p_message_text=>'Scegliere i filtri da mostrare'
,p_is_js_message=>true
,p_version_scn=>2705023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140070875332751643)
,p_name=>'APEX.FS.COUNT_RESULTS'
,p_message_language=>'it'
,p_message_text=>'%0 risultati'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140070966843751643)
,p_name=>'APEX.FS.COUNT_SELECTED'
,p_message_language=>'it'
,p_message_text=>'%0 selezionati'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140073750471751644)
,p_name=>'APEX.FS.CUR_FILTERS_LM'
,p_message_language=>'it'
,p_message_text=>'Filtri correnti'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139949380005751607)
,p_name=>'APEX.FS.FACETED_SEARCH_NEEDS_REGION_QUERY'
,p_message_language=>'it'
,p_message_text=>'La ricerca con facet richiede un''origine dati a livello di area.'
,p_version_scn=>2705025
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139953057339751608)
,p_name=>'APEX.FS.FACETS_LIST'
,p_message_language=>'it'
,p_message_text=>'Lista di filtri'
,p_is_js_message=>true
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140132113892751661)
,p_name=>'APEX.FS.FACET_VALUE_LIMIT_EXCEEDED'
,p_message_language=>'it'
,p_message_text=>'Limite del valore distinto (%0) superato per il facet %1.'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140118428344751657)
,p_name=>'APEX.FS.FC_TYPE_UNSUPPORTED_FOR_DATE_COLUMNS'
,p_message_language=>'it'
,p_message_text=>unistr('Il facet %0 non \00E8 supportato per le colonne DATE o TIMESTAMP.')
,p_version_scn=>2705059
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140116594409751657)
,p_name=>'APEX.FS.FILTER'
,p_message_language=>'it'
,p_message_text=>'Filtra %0'
,p_is_js_message=>true
,p_version_scn=>2705059
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139991153158751620)
,p_name=>'APEX.FS.FILTER_APPLIED'
,p_message_language=>'it'
,p_message_text=>'%0 (filtro applicato)'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140116672022751657)
,p_name=>'APEX.FS.GO'
,p_message_language=>'it'
,p_message_text=>'Vai'
,p_is_js_message=>true
,p_version_scn=>2705059
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139986603189751618)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_C'
,p_message_language=>'it'
,p_message_text=>'contiene %0'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140118033583751657)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_EQ'
,p_message_language=>'it'
,p_message_text=>'uguale a %0'
,p_is_js_message=>true
,p_version_scn=>2705059
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139986331604751618)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_GT'
,p_message_language=>'it'
,p_message_text=>'maggiore di %0'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139986483350751618)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_GTE'
,p_message_language=>'it'
,p_message_text=>'maggiore o uguale a %0'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139986072119751618)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_LT'
,p_message_language=>'it'
,p_message_text=>'minore di %0'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139986229451751618)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_LTE'
,p_message_language=>'it'
,p_message_text=>'minore o uguale a %0'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139985575498751618)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NC'
,p_message_language=>'it'
,p_message_text=>'non contiene %0'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139971384330751614)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NEQ'
,p_message_language=>'it'
,p_message_text=>'non uguale a %0'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139985688077751618)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NSTARTS'
,p_message_language=>'it'
,p_message_text=>'non inizia con %0'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139986514939751618)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_STARTS'
,p_message_language=>'it'
,p_message_text=>'inizia con %0'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139984624752751618)
,p_name=>'APEX.FS.INPUT_FACET_SELECTOR'
,p_message_language=>'it'
,p_message_text=>'Selezione facet'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139960425000751611)
,p_name=>'APEX.FS.INPUT_INVALID_FILTER_PREFIX'
,p_message_language=>'it'
,p_message_text=>unistr('Il prefisso del filtro "%0" non \00E8 valido per il facet "%1".')
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139958882495751610)
,p_name=>'APEX.FS.INPUT_MISSING_FILTER_PREFIX'
,p_message_language=>'it'
,p_message_text=>'Prefisso del filtro mancante per il facet "%0".'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139993008435751620)
,p_name=>'APEX.FS.INPUT_OPERATOR'
,p_message_language=>'it'
,p_message_text=>'Operatore'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139974908824751615)
,p_name=>'APEX.FS.INPUT_OPERATOR.C'
,p_message_language=>'it'
,p_message_text=>'contiene'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139973972130751614)
,p_name=>'APEX.FS.INPUT_OPERATOR.EQ'
,p_message_language=>'it'
,p_message_text=>'uguale a'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139974617288751615)
,p_name=>'APEX.FS.INPUT_OPERATOR.GT'
,p_message_language=>'it'
,p_message_text=>'maggiore di'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139974740095751615)
,p_name=>'APEX.FS.INPUT_OPERATOR.GTE'
,p_message_language=>'it'
,p_message_text=>'maggiore o uguale a'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139974347316751615)
,p_name=>'APEX.FS.INPUT_OPERATOR.LT'
,p_message_language=>'it'
,p_message_text=>'minore di'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139974443258751615)
,p_name=>'APEX.FS.INPUT_OPERATOR.LTE'
,p_message_language=>'it'
,p_message_text=>'minore o uguale a'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139985412565751618)
,p_name=>'APEX.FS.INPUT_OPERATOR.NC'
,p_message_language=>'it'
,p_message_text=>'non contiene'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139974155092751615)
,p_name=>'APEX.FS.INPUT_OPERATOR.NEQ'
,p_message_language=>'it'
,p_message_text=>'non uguale a'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139985325484751618)
,p_name=>'APEX.FS.INPUT_OPERATOR.NSTARTS'
,p_message_language=>'it'
,p_message_text=>'non inizia con'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139974873066751615)
,p_name=>'APEX.FS.INPUT_OPERATOR.STARTS'
,p_message_language=>'it'
,p_message_text=>'inizia con'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139993405901751620)
,p_name=>'APEX.FS.INPUT_UNSUPPORTED_DATA_TYPE'
,p_message_language=>'it'
,p_message_text=>unistr('Il tipo di dati %0 (%1) non \00E8 supportato per il facet Campo di input.')
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139960378101751610)
,p_name=>'APEX.FS.INPUT_UNSUPPORTED_FILTER_FOR_DATA_TYPE'
,p_message_language=>'it'
,p_message_text=>unistr('Il filtro "%0" non \00E8 supportato per il facet "%1" (tipo di dati %2).')
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139992993052751620)
,p_name=>'APEX.FS.INPUT_VALUE'
,p_message_language=>'it'
,p_message_text=>'Valore'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140118272557751657)
,p_name=>'APEX.FS.NO_SEARCH_COLUMNS_PROVIDED'
,p_message_language=>'it'
,p_message_text=>'Nessuna colonna di ricerca fornita per il facet %0'
,p_version_scn=>2705059
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139944494809751606)
,p_name=>'APEX.FS.OPEN_CONFIG'
,p_message_language=>'it'
,p_message_text=>'Altri filtri'
,p_is_js_message=>true
,p_version_scn=>2705023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140071008291751643)
,p_name=>'APEX.FS.RANGE_BEGIN'
,p_message_language=>'it'
,p_message_text=>'Inizio intervallo'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140117780953751657)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL'
,p_message_language=>'it'
,p_message_text=>'Da %0 a %1'
,p_is_js_message=>true
,p_version_scn=>2705059
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140117821180751657)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL_OPEN_HI'
,p_message_language=>'it'
,p_message_text=>'Al di sopra di %0'
,p_is_js_message=>true
,p_version_scn=>2705059
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140117963175751657)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL_OPEN_LO'
,p_message_language=>'it'
,p_message_text=>'Al di sotto di %0'
,p_is_js_message=>true
,p_version_scn=>2705059
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140071199979751643)
,p_name=>'APEX.FS.RANGE_END'
,p_message_language=>'it'
,p_message_text=>'Fine intervallo'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140135769836751662)
,p_name=>'APEX.FS.RANGE_LOV_ITEM_INVALID'
,p_message_language=>'it'
,p_message_text=>unistr('L''elemento LOV #%2 ("%1") per il facet Intervallo %0 non \00E8 valido (separatore "|" mancante).')
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140118198276751657)
,p_name=>'APEX.FS.RANGE_MANUAL_NOT_SUPPORTED'
,p_message_language=>'it'
,p_message_text=>unistr('Attualmente l''input manuale per il facet Intervallo %0 non \00E8 supportato perch\00E9 la colonna \00E8 del tipo DATE o TIMESTAMP.')
,p_version_scn=>2705059
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140117440286751657)
,p_name=>'APEX.FS.RANGE_TEXT'
,p_message_language=>'it'
,p_message_text=>'a'
,p_version_scn=>2705059
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139981087302751617)
,p_name=>'APEX.FS.REMOVE_CHART'
,p_message_language=>'it'
,p_message_text=>'Rimuovi grafico'
,p_is_js_message=>true
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140067434356751642)
,p_name=>'APEX.FS.RESET'
,p_message_language=>'it'
,p_message_text=>'Reimposta'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140116867834751657)
,p_name=>'APEX.FS.SEARCH_LABEL'
,p_message_language=>'it'
,p_message_text=>'Cerca'
,p_version_scn=>2705059
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140116783621751657)
,p_name=>'APEX.FS.SEARCH_PLACEHOLDER'
,p_message_language=>'it'
,p_message_text=>'Cerca...'
,p_version_scn=>2705059
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140117600980751657)
,p_name=>'APEX.FS.SELECT_PLACEHOLDER'
,p_message_language=>'it'
,p_message_text=>'- Seleziona -'
,p_version_scn=>2705059
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139980881793751617)
,p_name=>'APEX.FS.SHOW_CHART'
,p_message_language=>'it'
,p_message_text=>'Mostra grafico'
,p_is_js_message=>true
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140117253820751657)
,p_name=>'APEX.FS.SHOW_LESS'
,p_message_language=>'it'
,p_message_text=>'Mostra meno'
,p_is_js_message=>true
,p_version_scn=>2705059
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140117363852751657)
,p_name=>'APEX.FS.SHOW_MORE'
,p_message_language=>'it'
,p_message_text=>'Mostra tutto'
,p_is_js_message=>true
,p_version_scn=>2705059
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140117588850751657)
,p_name=>'APEX.FS.STAR_RATING_LABEL'
,p_message_language=>'it'
,p_message_text=>'%0 stelle e oltre'
,p_version_scn=>2705059
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140072756168751644)
,p_name=>'APEX.FS.SUGGESTIONS'
,p_message_language=>'it'
,p_message_text=>'Filtra suggerimenti'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140118360631751657)
,p_name=>'APEX.FS.TEXT_FIELD_ONLY_FOR_NUMBER_COLUMNS'
,p_message_language=>'it'
,p_message_text=>'Attualmente il facet Campo di testo %0 u supportato solo per le colonne NUMBER.'
,p_version_scn=>2705059
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139943848024751606)
,p_name=>'APEX.FS.TOTAL_ROW_COUNT_LABEL'
,p_message_language=>'it'
,p_message_text=>'Conteggio righe totali'
,p_version_scn=>2705023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140133763845751662)
,p_name=>'APEX.FS.UNSUPPORTED_DATA_TYPE'
,p_message_language=>'it'
,p_message_text=>unistr('Il tipo di dati %0 (%1) non \00E8 supportato per la ricerca con facet.')
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140063977723751641)
,p_name=>'APEX.FS.VISUALLY_HIDDEN_HEADING'
,p_message_language=>'it'
,p_message_text=>'Intestazione nascosta'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140126294210751660)
,p_name=>'APEX.GO_TO_ERROR'
,p_message_language=>'it'
,p_message_text=>'Vai a errore'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140082207343751646)
,p_name=>'APEX.GV.AGG_CONTEXT'
,p_message_language=>'it'
,p_message_text=>'Aggregato.'
,p_is_js_message=>true
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140010198118751625)
,p_name=>'APEX.GV.BLANK_HEADING'
,p_message_language=>'it'
,p_message_text=>'Intestazione vuota'
,p_is_js_message=>true
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140091512314751649)
,p_name=>'APEX.GV.BREAK_COLLAPSE'
,p_message_language=>'it'
,p_message_text=>'Comprimi interruzione di controllo'
,p_is_js_message=>true
,p_version_scn=>2705049
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140082394959751646)
,p_name=>'APEX.GV.BREAK_CONTEXT'
,p_message_language=>'it'
,p_message_text=>'Interruzione di controllo.'
,p_is_js_message=>true
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140091484174751649)
,p_name=>'APEX.GV.BREAK_EXPAND'
,p_message_language=>'it'
,p_message_text=>'Espandi interruzione di controllo'
,p_is_js_message=>true
,p_version_scn=>2705049
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140091286706751649)
,p_name=>'APEX.GV.DELETED_COUNT'
,p_message_language=>'it'
,p_message_text=>'%0 righe eliminate'
,p_is_js_message=>true
,p_version_scn=>2705049
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140160373283751670)
,p_name=>'APEX.GV.DUP_REC_ID'
,p_message_language=>'it'
,p_message_text=>unistr('Identit\00E0 duplicata')
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139953281011751608)
,p_name=>'APEX.GV.ENTER_EDIT_MODE'
,p_message_language=>'it'
,p_message_text=>unistr('Attivazione della modalit\00E0 di modifica')
,p_is_js_message=>true
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140079150471751646)
,p_name=>'APEX.GV.FIRST_PAGE'
,p_message_language=>'it'
,p_message_text=>'All''inizio'
,p_is_js_message=>true
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139952085514751608)
,p_name=>'APEX.GV.FLOATING_ITEM.DIALOG.HIDE_DIALOG'
,p_message_language=>'it'
,p_message_text=>'Nascondi finestra di dialogo'
,p_is_js_message=>true
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139951041183751608)
,p_name=>'APEX.GV.FLOATING_ITEM.DIALOG.TITLE'
,p_message_language=>'it'
,p_message_text=>'Contenuto cella overflow mobile'
,p_is_js_message=>true
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139952327140751608)
,p_name=>'APEX.GV.FLOATING_ITEM.SHOW_DIALOG'
,p_message_language=>'it'
,p_message_text=>'Mostra contenuto overflow'
,p_is_js_message=>true
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140026512810751630)
,p_name=>'APEX.GV.FOOTER_LANDMARK'
,p_message_language=>'it'
,p_message_text=>unistr('Pi\00E8 di pagina griglia')
,p_is_js_message=>true
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140082575901751647)
,p_name=>'APEX.GV.GROUP_CONTEXT'
,p_message_language=>'it'
,p_message_text=>'Intestazione gruppo'
,p_is_js_message=>true
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140082406839751646)
,p_name=>'APEX.GV.HEADER_CONTEXT'
,p_message_language=>'it'
,p_message_text=>'Intestazione.'
,p_is_js_message=>true
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140079218505751646)
,p_name=>'APEX.GV.LAST_PAGE'
,p_message_language=>'it'
,p_message_text=>'Alla fine'
,p_is_js_message=>true
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139953483698751608)
,p_name=>'APEX.GV.LEAVE_EDIT_MODE'
,p_message_language=>'it'
,p_message_text=>unistr('Uscita dalla modalit\00E0 di modifica')
,p_is_js_message=>true
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139978149150751616)
,p_name=>'APEX.GV.LOAD_ALL'
,p_message_language=>'it'
,p_message_text=>'Carica tutto'
,p_is_js_message=>true
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140101079259751652)
,p_name=>'APEX.GV.LOAD_MORE'
,p_message_language=>'it'
,p_message_text=>'Mostra altro'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140078986354751645)
,p_name=>'APEX.GV.NEXT_PAGE'
,p_message_language=>'it'
,p_message_text=>'Successivo'
,p_is_js_message=>true
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140082675442751647)
,p_name=>'APEX.GV.PAGE_RANGE'
,p_message_language=>'it'
,p_message_text=>'Righe di pagina'
,p_is_js_message=>true
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139991787220751620)
,p_name=>'APEX.GV.PAGE_RANGE_ENTITY'
,p_message_language=>'it'
,p_message_text=>'Pagina %0'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140079332400751646)
,p_name=>'APEX.GV.PAGE_RANGE_XY'
,p_message_language=>'it'
,p_message_text=>'%0 - %1'
,p_is_js_message=>true
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140079427429751646)
,p_name=>'APEX.GV.PAGE_RANGE_XYZ'
,p_message_language=>'it'
,p_message_text=>'%0 - %1 di %2'
,p_is_js_message=>true
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140136302789751663)
,p_name=>'APEX.GV.PAGE_SELECTION'
,p_message_language=>'it'
,p_message_text=>'Selezione pagina'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140026867819751630)
,p_name=>'APEX.GV.PAGINATION_LANDMARK'
,p_message_language=>'it'
,p_message_text=>'Impaginazione'
,p_is_js_message=>true
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140079050742751646)
,p_name=>'APEX.GV.PREV_PAGE'
,p_message_language=>'it'
,p_message_text=>'Precedente'
,p_is_js_message=>true
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139977041602751615)
,p_name=>'APEX.GV.RANGE_DISPLAY'
,p_message_language=>'it'
,p_message_text=>'Visualizzazione intervallo'
,p_is_js_message=>true
,p_version_scn=>2705031
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140010481667751625)
,p_name=>'APEX.GV.ROWS_SELECTION'
,p_message_language=>'it'
,p_message_text=>'Selezione righe'
,p_is_js_message=>true
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140160199242751670)
,p_name=>'APEX.GV.ROW_ADDED'
,p_message_language=>'it'
,p_message_text=>'Aggiunto'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140160209701751670)
,p_name=>'APEX.GV.ROW_CHANGED'
,p_message_language=>'it'
,p_message_text=>'Modificato'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140168514290751672)
,p_name=>'APEX.GV.ROW_COLUMN_CONTEXT'
,p_message_language=>'it'
,p_message_text=>'Sequenza di righe della griglia %0, colonna %1.'
,p_is_js_message=>true
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140168606520751672)
,p_name=>'APEX.GV.ROW_CONTEXT'
,p_message_language=>'it'
,p_message_text=>'Sequenza di righe della griglia %0.'
,p_is_js_message=>true
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140160058187751669)
,p_name=>'APEX.GV.ROW_DELETED'
,p_message_language=>'it'
,p_message_text=>'Eliminato'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140082812114751647)
,p_name=>'APEX.GV.ROW_HEADER'
,p_message_language=>'it'
,p_message_text=>'Intestazione riga'
,p_is_js_message=>true
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140010354369751625)
,p_name=>'APEX.GV.ROW_SELECTION'
,p_message_language=>'it'
,p_message_text=>'Selezione righe'
,p_is_js_message=>true
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139978292815751616)
,p_name=>'APEX.GV.SELECTED_ENTITY_COUNT'
,p_message_language=>'it'
,p_message_text=>'Elementi selezionati: %0 %1'
,p_is_js_message=>true
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140078361229751645)
,p_name=>'APEX.GV.SELECTION_CELL_COUNT'
,p_message_language=>'it'
,p_message_text=>'%0 celle selezionate'
,p_is_js_message=>true
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140079569490751646)
,p_name=>'APEX.GV.SELECTION_COUNT'
,p_message_language=>'it'
,p_message_text=>'%0 righe selezionate'
,p_is_js_message=>true
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140121644400751658)
,p_name=>'APEX.GV.SELECT_ALL'
,p_message_language=>'it'
,p_message_text=>'Seleziona tutto'
,p_is_js_message=>true
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140015140121751627)
,p_name=>'APEX.GV.SELECT_ALL_ROWS'
,p_message_language=>'it'
,p_message_text=>'Seleziona tutte le righe'
,p_is_js_message=>true
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140091326362751649)
,p_name=>'APEX.GV.SELECT_PAGE_N'
,p_message_language=>'it'
,p_message_text=>'Pagina %0'
,p_is_js_message=>true
,p_version_scn=>2705049
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140082720883751647)
,p_name=>'APEX.GV.SELECT_ROW'
,p_message_language=>'it'
,p_message_text=>'Seleziona riga'
,p_is_js_message=>true
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140083006168751647)
,p_name=>'APEX.GV.SORTED_ASCENDING'
,p_message_language=>'it'
,p_message_text=>'Con ordinamento crescente %0'
,p_is_js_message=>true
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140083113847751647)
,p_name=>'APEX.GV.SORTED_DESCENDING'
,p_message_language=>'it'
,p_message_text=>'Con ordinamento decrescente %0'
,p_is_js_message=>true
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140078427935751645)
,p_name=>'APEX.GV.SORT_ASCENDING'
,p_message_language=>'it'
,p_message_text=>'Ordinamento crescente'
,p_is_js_message=>true
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140078789404751645)
,p_name=>'APEX.GV.SORT_ASCENDING_ORDER'
,p_message_language=>'it'
,p_message_text=>'Ordinamento crescente %0'
,p_is_js_message=>true
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140078565211751645)
,p_name=>'APEX.GV.SORT_DESCENDING'
,p_message_language=>'it'
,p_message_text=>'Ordinamento decrescente'
,p_is_js_message=>true
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140078897961751645)
,p_name=>'APEX.GV.SORT_DESCENDING_ORDER'
,p_message_language=>'it'
,p_message_text=>'Ordinamento decrescente %0'
,p_is_js_message=>true
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140078683959751645)
,p_name=>'APEX.GV.SORT_OFF'
,p_message_language=>'it'
,p_message_text=>'Non ordinare'
,p_is_js_message=>true
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139944271224751606)
,p_name=>'APEX.GV.SORT_OPTIONS'
,p_message_language=>'it'
,p_message_text=>'Opzioni di ordinamento'
,p_is_js_message=>true
,p_version_scn=>2705023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140026606362751630)
,p_name=>'APEX.GV.STATE_ICONS_LANDMARK'
,p_message_language=>'it'
,p_message_text=>'Icone di stato'
,p_is_js_message=>true
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140026793323751630)
,p_name=>'APEX.GV.STATUS_LANDMARK'
,p_message_language=>'it'
,p_message_text=>'Stato griglia'
,p_is_js_message=>true
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139956582608751609)
,p_name=>'APEX.GV.TOTAL_ENTITY_PLURAL'
,p_message_language=>'it'
,p_message_text=>'%0 %1'
,p_is_js_message=>true
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139956224504751609)
,p_name=>'APEX.GV.TOTAL_ENTITY_SINGULAR'
,p_message_language=>'it'
,p_message_text=>'1 %0'
,p_is_js_message=>true
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140091192624751649)
,p_name=>'APEX.GV.TOTAL_PAGES'
,p_message_language=>'it'
,p_message_text=>'Totale %0'
,p_is_js_message=>true
,p_version_scn=>2705049
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140009936116751625)
,p_name=>'APEX.HTTP.REQUEST_FAILED'
,p_message_language=>'it'
,p_message_text=>'Richiesta HTTP per "%0" non riuscita.'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140011590891751626)
,p_name=>'APEX.ICON_LIST.COLUMN'
,p_message_language=>'it'
,p_message_text=>'Colonna %0'
,p_is_js_message=>true
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140011750883751626)
,p_name=>'APEX.ICON_LIST.COLUMN_AND_ROW'
,p_message_language=>'it'
,p_message_text=>'Colonna %0 e riga %1'
,p_is_js_message=>true
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140012047944751626)
,p_name=>'APEX.ICON_LIST.FIRST_COLUMN'
,p_message_language=>'it'
,p_message_text=>unistr('Gi\00E0 nella prima colonna. Colonna %0 e riga %1')
,p_is_js_message=>true
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140011957986751626)
,p_name=>'APEX.ICON_LIST.FIRST_ROW'
,p_message_language=>'it'
,p_message_text=>unistr('Gi\00E0 nella prima riga. Colonna %0 e riga %1')
,p_is_js_message=>true
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140157544773751669)
,p_name=>'APEX.ICON_LIST.GRID_DIM'
,p_message_language=>'it'
,p_message_text=>'Presentato in %0 colonne e %1 righe'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140012147267751626)
,p_name=>'APEX.ICON_LIST.LAST_COLUMN'
,p_message_language=>'it'
,p_message_text=>unistr('Gi\00E0 nell''ultima colonna. Colonna %0 e riga %1')
,p_is_js_message=>true
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140011890082751626)
,p_name=>'APEX.ICON_LIST.LAST_ROW'
,p_message_language=>'it'
,p_message_text=>unistr('Gi\00E0 nell''ultima riga. Colonna %0 e riga %1')
,p_is_js_message=>true
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140091024575751649)
,p_name=>'APEX.ICON_LIST.LIST_DIM'
,p_message_language=>'it'
,p_message_text=>'Presentato in %0 righe'
,p_is_js_message=>true
,p_version_scn=>2705049
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140011650601751626)
,p_name=>'APEX.ICON_LIST.ROW'
,p_message_language=>'it'
,p_message_text=>'Riga %0'
,p_is_js_message=>true
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140168342635751672)
,p_name=>'APEX.IG.ACC_LABEL'
,p_message_language=>'it'
,p_message_text=>'Griglia interattiva %0'
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140075410100751644)
,p_name=>'APEX.IG.ACTIONS'
,p_message_language=>'it'
,p_message_text=>'Azioni'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140076424977751645)
,p_name=>'APEX.IG.ADD'
,p_message_language=>'it'
,p_message_text=>'Aggiungi'
,p_is_js_message=>true
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140076356091751645)
,p_name=>'APEX.IG.ADD_ROW'
,p_message_language=>'it'
,p_message_text=>'Aggiungi riga'
,p_is_js_message=>true
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140161968180751670)
,p_name=>'APEX.IG.AGGREGATE'
,p_message_language=>'it'
,p_message_text=>'Aggregato'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140147593651751666)
,p_name=>'APEX.IG.AGGREGATION'
,p_message_language=>'it'
,p_message_text=>'Aggregazione'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140149234865751666)
,p_name=>'APEX.IG.ALL'
,p_message_language=>'it'
,p_message_text=>'Tutto'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140106858659751654)
,p_name=>'APEX.IG.ALL_TEXT_COLUMNS'
,p_message_language=>'it'
,p_message_text=>'Tutte le colonne di testo'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140108046856751654)
,p_name=>'APEX.IG.ALTERNATIVE'
,p_message_language=>'it'
,p_message_text=>'Alternativo'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140109151771751654)
,p_name=>'APEX.IG.AND'
,p_message_language=>'it'
,p_message_text=>'e'
,p_is_js_message=>true
,p_version_scn=>2705055
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140128527910751660)
,p_name=>'APEX.IG.APPROX_COUNT_DISTINCT'
,p_message_language=>'it'
,p_message_text=>'Conteggio distinti appross.'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140162964156751670)
,p_name=>'APEX.IG.APPROX_COUNT_DISTINCT_OVERALL'
,p_message_language=>'it'
,p_message_text=>'Conteggio distinti appross. globale'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140146106671751665)
,p_name=>'APEX.IG.AREA'
,p_message_language=>'it'
,p_message_text=>'Ad aree'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140148092182751666)
,p_name=>'APEX.IG.ASCENDING'
,p_message_language=>'it'
,p_message_text=>'Crescente'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140108119953751654)
,p_name=>'APEX.IG.AUTHORIZATION'
,p_message_language=>'it'
,p_message_text=>'Autorizzazione'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140162021270751670)
,p_name=>'APEX.IG.AUTO'
,p_message_language=>'it'
,p_message_text=>'Automatico'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140128944639751660)
,p_name=>'APEX.IG.AVG'
,p_message_language=>'it'
,p_message_text=>'Media'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140162650604751670)
,p_name=>'APEX.IG.AVG_OVERALL'
,p_message_language=>'it'
,p_message_text=>'Media globale'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140145630171751665)
,p_name=>'APEX.IG.AXIS_LABEL_TITLE'
,p_message_language=>'it'
,p_message_text=>'Titolo asse etichetta'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140145845343751665)
,p_name=>'APEX.IG.AXIS_VALUE_DECIMAL'
,p_message_language=>'it'
,p_message_text=>'Posizioni decimali'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140145746413751665)
,p_name=>'APEX.IG.AXIS_VALUE_TITLE'
,p_message_language=>'it'
,p_message_text=>'Titolo asse valori'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140151872125751667)
,p_name=>'APEX.IG.BACKGROUND_COLOR'
,p_message_language=>'it'
,p_message_text=>'Colore sfondo'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140146219268751665)
,p_name=>'APEX.IG.BAR'
,p_message_language=>'it'
,p_message_text=>'A barre'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140103419677751653)
,p_name=>'APEX.IG.BETWEEN'
,p_message_language=>'it'
,p_message_text=>'tra'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140153074751751667)
,p_name=>'APEX.IG.BOTH'
,p_message_language=>'it'
,p_message_text=>'Entrambi'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140146342942751665)
,p_name=>'APEX.IG.BUBBLE'
,p_message_language=>'it'
,p_message_text=>'A bolle'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140076677659751645)
,p_name=>'APEX.IG.CANCEL'
,p_message_language=>'it'
,p_message_text=>'Annulla'
,p_is_js_message=>true
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140109033868751654)
,p_name=>'APEX.IG.CASE_SENSITIVE'
,p_message_language=>'it'
,p_message_text=>'Con distinzione tra maiuscole e minuscole'
,p_is_js_message=>true
,p_version_scn=>2705055
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140163526430751671)
,p_name=>'APEX.IG.CASE_SENSITIVE_WITH_BRACKETS'
,p_message_language=>'it'
,p_message_text=>'(Con distinzione tra maiuscole e minuscole)'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140134817441751662)
,p_name=>'APEX.IG.CHANGES_SAVED'
,p_message_language=>'it'
,p_message_text=>'Modifiche salvate'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140077059694751645)
,p_name=>'APEX.IG.CHANGE_VIEW'
,p_message_language=>'it'
,p_message_text=>'Modifica vista'
,p_is_js_message=>true
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140110191373751655)
,p_name=>'APEX.IG.CHART'
,p_message_language=>'it'
,p_message_text=>'Grafico'
,p_is_js_message=>true
,p_version_scn=>2705055
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140106622473751654)
,p_name=>'APEX.IG.CHART_MAX_DATAPOINT_CNT'
,p_message_language=>'it'
,p_message_text=>'La query supera il numero massimo di %0 datapoint per grafico. Applicare un filtro per ridurre il numero di record nella query di base.'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140075372532751644)
,p_name=>'APEX.IG.CHART_VIEW'
,p_message_language=>'it'
,p_message_text=>'Vista grafico'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140083748258751647)
,p_name=>'APEX.IG.CLEAR'
,p_message_language=>'it'
,p_message_text=>'Cancella'
,p_is_js_message=>true
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140145170220751665)
,p_name=>'APEX.IG.CLOSE_COLUMN'
,p_message_language=>'it'
,p_message_text=>'Chiudi'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140152030376751667)
,p_name=>'APEX.IG.COLORS'
,p_message_language=>'it'
,p_message_text=>'Colori'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140129343543751660)
,p_name=>'APEX.IG.COLOR_PREVIEW'
,p_message_language=>'it'
,p_message_text=>'Anteprima'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140108408501751654)
,p_name=>'APEX.IG.COLUMN'
,p_message_language=>'it'
,p_message_text=>'Colonna'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140075535981751644)
,p_name=>'APEX.IG.COLUMNS'
,p_message_language=>'it'
,p_message_text=>'Colonne'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140037446380751633)
,p_name=>'APEX.IG.COLUMN_HEADER_ACTIONS'
,p_message_language=>'it'
,p_message_text=>'Azioni colonna'
,p_is_js_message=>true
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140037289104751633)
,p_name=>'APEX.IG.COLUMN_HEADER_ACTIONS_FOR'
,p_message_language=>'it'
,p_message_text=>'Azioni per la colonna "%0"'
,p_is_js_message=>true
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140153831563751668)
,p_name=>'APEX.IG.COLUMN_TYPE'
,p_message_language=>'it'
,p_message_text=>'Scopo colonna'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140108579105751654)
,p_name=>'APEX.IG.COMPLEX'
,p_message_language=>'it'
,p_message_text=>'Complesso'
,p_is_js_message=>true
,p_version_scn=>2705055
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140075747976751645)
,p_name=>'APEX.IG.COMPUTE'
,p_message_language=>'it'
,p_message_text=>'Calcola'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140104044986751653)
,p_name=>'APEX.IG.CONTAINS'
,p_message_language=>'it'
,p_message_text=>'contiene'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140110314380751655)
,p_name=>'APEX.IG.CONTROL_BREAK'
,p_message_language=>'it'
,p_message_text=>'Interruzione di controllo'
,p_is_js_message=>true
,p_version_scn=>2705055
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140083577186751647)
,p_name=>'APEX.IG.COPY_CB'
,p_message_language=>'it'
,p_message_text=>'Copia negli Appunti'
,p_is_js_message=>true
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140083634689751647)
,p_name=>'APEX.IG.COPY_DOWN'
,p_message_language=>'it'
,p_message_text=>'Copia in basso'
,p_is_js_message=>true
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140128366439751660)
,p_name=>'APEX.IG.COUNT'
,p_message_language=>'it'
,p_message_text=>'Conteggio'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140128418849751660)
,p_name=>'APEX.IG.COUNT_DISTINCT'
,p_message_language=>'it'
,p_message_text=>'Conteggio distinti'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140162877948751670)
,p_name=>'APEX.IG.COUNT_DISTINCT_OVERALL'
,p_message_language=>'it'
,p_message_text=>'Conteggio distinti globale'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140162780507751670)
,p_name=>'APEX.IG.COUNT_OVERALL'
,p_message_language=>'it'
,p_message_text=>'Conteggio globale'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140160476610751670)
,p_name=>'APEX.IG.CREATE_X'
,p_message_language=>'it'
,p_message_text=>'Crea %0'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140107000560751654)
,p_name=>'APEX.IG.DATA'
,p_message_language=>'it'
,p_message_text=>'Dati'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140153628864751668)
,p_name=>'APEX.IG.DATA_TYPE'
,p_message_language=>'it'
,p_message_text=>'Tipo di dati'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140153236904751667)
,p_name=>'APEX.IG.DATE'
,p_message_language=>'it'
,p_message_text=>'Data'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140134600734751662)
,p_name=>'APEX.IG.DATE_INVALID_VALUE'
,p_message_language=>'it'
,p_message_text=>'Valore della data non valido'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140104773076751653)
,p_name=>'APEX.IG.DAYS'
,p_message_language=>'it'
,p_message_text=>'giorni'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140107712673751654)
,p_name=>'APEX.IG.DEFAULT_SETTINGS'
,p_message_language=>'it'
,p_message_text=>'Impostazioni predefinite'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140107507512751654)
,p_name=>'APEX.IG.DEFAULT_TYPE'
,p_message_language=>'it'
,p_message_text=>'Tipo predefinito'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140076558087751645)
,p_name=>'APEX.IG.DELETE'
,p_message_language=>'it'
,p_message_text=>'Elimina'
,p_is_js_message=>true
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140154765854751668)
,p_name=>'APEX.IG.DELETE_REPORT_CONFIRM'
,p_message_language=>'it'
,p_message_text=>unistr('Si \00E8 certi di voler eliminare questo report?')
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140112125852751655)
,p_name=>'APEX.IG.DELETE_ROW'
,p_message_language=>'it'
,p_message_text=>'Elimina riga'
,p_is_js_message=>true
,p_version_scn=>2705056
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140110990553751655)
,p_name=>'APEX.IG.DELETE_ROWS'
,p_message_language=>'it'
,p_message_text=>'Elimina righe'
,p_is_js_message=>true
,p_version_scn=>2705055
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140148137610751666)
,p_name=>'APEX.IG.DESCENDING'
,p_message_language=>'it'
,p_message_text=>'Decrescente'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140109832700751655)
,p_name=>'APEX.IG.DETAIL'
,p_message_language=>'it'
,p_message_text=>'Dettaglio'
,p_is_js_message=>true
,p_version_scn=>2705055
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140075003471751644)
,p_name=>'APEX.IG.DETAIL_VIEW'
,p_message_language=>'it'
,p_message_text=>'Vista dettagli'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140137165069751663)
,p_name=>'APEX.IG.DIRECTION'
,p_message_language=>'it'
,p_message_text=>'Direzione'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140109527810751654)
,p_name=>'APEX.IG.DISABLED'
,p_message_language=>'it'
,p_message_text=>'Disabilitato'
,p_is_js_message=>true
,p_version_scn=>2705055
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140104145241751653)
,p_name=>'APEX.IG.DOES_NOT_CONTAIN'
,p_message_language=>'it'
,p_message_text=>'non contiene'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140104302765751653)
,p_name=>'APEX.IG.DOES_NOT_START_WITH'
,p_message_language=>'it'
,p_message_text=>'non inizia con'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140146463779751665)
,p_name=>'APEX.IG.DONUT'
,p_message_language=>'it'
,p_message_text=>'A ciambella'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140110553494751655)
,p_name=>'APEX.IG.DOWNLOAD'
,p_message_language=>'it'
,p_message_text=>'Scarica'
,p_is_js_message=>true
,p_version_scn=>2705055
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140000870591751622)
,p_name=>'APEX.IG.DOWNLOAD_DATA_ONLY'
,p_message_language=>'it'
,p_message_text=>'Solo dati'
,p_is_js_message=>true
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140155752254751668)
,p_name=>'APEX.IG.DOWNLOAD_FORMAT'
,p_message_language=>'it'
,p_message_text=>'Scegliere un formato'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140015949858751627)
,p_name=>'APEX.IG.DOWNLOAD_FORMAT_NOT_ENABLED'
,p_message_language=>'it'
,p_message_text=>'Formato di download %0 non abilitato.'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140148883377751666)
,p_name=>'APEX.IG.DUPLICATE_AGGREGATION'
,p_message_language=>'it'
,p_message_text=>'Aggregazione duplicata'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140148952027751666)
,p_name=>'APEX.IG.DUPLICATE_CONTROLBREAK'
,p_message_language=>'it'
,p_message_text=>'Interruzione di controllo duplicata'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140112098900751655)
,p_name=>'APEX.IG.DUPLICATE_ROW'
,p_message_language=>'it'
,p_message_text=>'Duplica riga'
,p_is_js_message=>true
,p_version_scn=>2705056
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140110812395751655)
,p_name=>'APEX.IG.DUPLICATE_ROWS'
,p_message_language=>'it'
,p_message_text=>'Duplica righe'
,p_is_js_message=>true
,p_version_scn=>2705055
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140076180131751645)
,p_name=>'APEX.IG.EDIT'
,p_message_language=>'it'
,p_message_text=>'Modifica'
,p_is_js_message=>true
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140147977424751666)
,p_name=>'APEX.IG.EDIT_CHART'
,p_message_language=>'it'
,p_message_text=>'Modifica grafico'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140028401848751631)
,p_name=>'APEX.IG.EDIT_CONTROL'
,p_message_language=>'it'
,p_message_text=>'Modifica %0'
,p_is_js_message=>true
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140159311438751669)
,p_name=>'APEX.IG.EDIT_GROUP_BY'
,p_message_language=>'it'
,p_message_text=>'Modifica raggruppamento'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140066553493751642)
,p_name=>'APEX.IG.EDIT_MODE'
,p_message_language=>'it'
,p_message_text=>unistr('%0 in modalit\00E0 di modifica')
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140042177760751635)
,p_name=>'APEX.IG.EDIT_MODE_DESCRIPTION'
,p_message_language=>'it'
,p_message_text=>unistr('Griglia in modalit\00E0 di modifica. Deselezionare per passare alla modalit\00E0 di visualizzazione')
,p_is_js_message=>true
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140155321228751668)
,p_name=>'APEX.IG.EMAIL_BCC'
,p_message_language=>'it'
,p_message_text=>'Copia nascosta (Ccn)'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140155588096751668)
,p_name=>'APEX.IG.EMAIL_BODY'
,p_message_language=>'it'
,p_message_text=>'Messaggio'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140155288996751668)
,p_name=>'APEX.IG.EMAIL_CC'
,p_message_language=>'it'
,p_message_text=>'Copia (Cc)'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140154965636751668)
,p_name=>'APEX.IG.EMAIL_SENT'
,p_message_language=>'it'
,p_message_text=>'Posta elettronica inviata.'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140155405447751668)
,p_name=>'APEX.IG.EMAIL_SUBJECT'
,p_message_language=>'it'
,p_message_text=>'Oggetto'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140155169263751668)
,p_name=>'APEX.IG.EMAIL_TO'
,p_message_language=>'it'
,p_message_text=>'Destinatario (A)'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140109215260751654)
,p_name=>'APEX.IG.ENABLED'
,p_message_language=>'it'
,p_message_text=>'Abilitato'
,p_is_js_message=>true
,p_version_scn=>2705055
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140102441228751652)
,p_name=>'APEX.IG.EQUALS'
,p_message_language=>'it'
,p_message_text=>'uguale a'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140109300357751654)
,p_name=>'APEX.IG.EXPRESSION'
,p_message_language=>'it'
,p_message_text=>'Espressione'
,p_is_js_message=>true
,p_version_scn=>2705055
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140154373580751668)
,p_name=>'APEX.IG.FD_TYPE'
,p_message_language=>'it'
,p_message_text=>'Tipo'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140121592600751658)
,p_name=>'APEX.IG.FILE_PREPARED'
,p_message_language=>'it'
,p_message_text=>'File preparato. Avvio del download in corso.'
,p_is_js_message=>true
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140083878640751647)
,p_name=>'APEX.IG.FILL'
,p_message_language=>'it'
,p_message_text=>'Riempimento'
,p_is_js_message=>true
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140086024392751648)
,p_name=>'APEX.IG.FILL_LABEL'
,p_message_language=>'it'
,p_message_text=>'Riempi selezione con'
,p_is_js_message=>true
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140085914326751648)
,p_name=>'APEX.IG.FILL_TITLE'
,p_message_language=>'it'
,p_message_text=>'Riempi selezione'
,p_is_js_message=>true
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140075684776751645)
,p_name=>'APEX.IG.FILTER'
,p_message_language=>'it'
,p_message_text=>'Filtra'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140108659081751654)
,p_name=>'APEX.IG.FILTERS'
,p_message_language=>'it'
,p_message_text=>'Filtri'
,p_is_js_message=>true
,p_version_scn=>2705055
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140162367339751670)
,p_name=>'APEX.IG.FILTER_WITH_DOTS'
,p_message_language=>'it'
,p_message_text=>'Filtra...'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140148390000751666)
,p_name=>'APEX.IG.FIRST'
,p_message_language=>'it'
,p_message_text=>'All''inizio'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140075874323751645)
,p_name=>'APEX.IG.FLASHBACK'
,p_message_language=>'it'
,p_message_text=>'Flashback'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140107135524751654)
,p_name=>'APEX.IG.FORMAT'
,p_message_language=>'it'
,p_message_text=>'Formato'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140152964159751667)
,p_name=>'APEX.IG.FORMATMASK'
,p_message_language=>'it'
,p_message_text=>'Formato di visualizzazione'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140154651123751668)
,p_name=>'APEX.IG.FORMAT_CSV'
,p_message_language=>'it'
,p_message_text=>'CSV'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140154505907751668)
,p_name=>'APEX.IG.FORMAT_HTML'
,p_message_language=>'it'
,p_message_text=>'HTML'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140065606172751642)
,p_name=>'APEX.IG.FORMAT_PDF'
,p_message_language=>'it'
,p_message_text=>'PDF'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139999515099751622)
,p_name=>'APEX.IG.FORMAT_XLSX'
,p_message_language=>'it'
,p_message_text=>'Excel'
,p_is_js_message=>true
,p_version_scn=>2705035
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140111733730751655)
,p_name=>'APEX.IG.FREEZE'
,p_message_language=>'it'
,p_message_text=>'Blocca'
,p_is_js_message=>true
,p_version_scn=>2705056
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140109469493751654)
,p_name=>'APEX.IG.FUNCTIONS_AND_OPERATORS'
,p_message_language=>'it'
,p_message_text=>'Funzioni e operatori'
,p_is_js_message=>true
,p_version_scn=>2705055
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140146578127751666)
,p_name=>'APEX.IG.FUNNEL'
,p_message_language=>'it'
,p_message_text=>'A imbuto'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140128206987751660)
,p_name=>'APEX.IG.GO'
,p_message_language=>'it'
,p_message_text=>'Vai'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140103028140751653)
,p_name=>'APEX.IG.GREATER_THAN'
,p_message_language=>'it'
,p_message_text=>'maggiore di'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140103169052751653)
,p_name=>'APEX.IG.GREATER_THAN_OR_EQUALS'
,p_message_language=>'it'
,p_message_text=>'maggiore o uguale a'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140109771171751655)
,p_name=>'APEX.IG.GRID'
,p_message_language=>'it'
,p_message_text=>'Griglia'
,p_is_js_message=>true
,p_version_scn=>2705055
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140074860821751644)
,p_name=>'APEX.IG.GRID_VIEW'
,p_message_language=>'it'
,p_message_text=>'Vista griglia'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140149117060751666)
,p_name=>'APEX.IG.GROUP'
,p_message_language=>'it'
,p_message_text=>'Gruppo'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140109961669751655)
,p_name=>'APEX.IG.GROUP_BY'
,p_message_language=>'it'
,p_message_text=>'Raggruppa per'
,p_is_js_message=>true
,p_version_scn=>2705055
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140075137223751644)
,p_name=>'APEX.IG.GROUP_BY_VIEW'
,p_message_language=>'it'
,p_message_text=>'Vista Raggruppa per'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140153525994751668)
,p_name=>'APEX.IG.HD_TYPE'
,p_message_language=>'it'
,p_message_text=>'Tipo di condizione'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140152474014751667)
,p_name=>'APEX.IG.HEADING'
,p_message_language=>'it'
,p_message_text=>'Intestazione'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140152602020751667)
,p_name=>'APEX.IG.HEADING_ALIGN'
,p_message_language=>'it'
,p_message_text=>'Allineamento intestazione'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140162225018751670)
,p_name=>'APEX.IG.HELP'
,p_message_language=>'it'
,p_message_text=>'Guida'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140157742017751669)
,p_name=>'APEX.IG.HELP.ACTIONS.EDITING'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\00C8 possibile inserire, aggiornare ed eliminare i dati direttamente all''interno di questa griglia interattiva.</p>'),
'',
'<p>Per inserire una nuova riga, fare clic sul pulsante Aggiungi riga.</p>',
'',
unistr('<p>Per modificare i dati esistenti, fare doppio clic su una cella specifica. Per interventi di modifica pi\00F9 ampi, fare clic su Modifica per attivare la modalit\00E0 di modifica. Nella modalit\00E0 di modifica \00E8 possibile fare clic una sola volta oppure usare')
||' la tastiera per modificare le celle specifiche.</p>',
'',
unistr('<p>Usare il menu Modifica per duplicare e eliminare le righe. Per abilitare il menu Modifica, usare le caselle di controllo per selezionare una o pi\00F9 righe.</p>'),
'',
'<p>Per duplicare una riga selezionata, fare clic sul menu Modifica e selezionare Duplica righe. Per eliminare una riga selezionata, fare clic sul menu Modifica e selezionare Elimina riga.</p>'))
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140159808979751669)
,p_name=>'APEX.IG.HELP.ACTIONS.EDITING_HEADING'
,p_message_language=>'it'
,p_message_text=>unistr('Capacit\00E0 di modifica')
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140159968719751669)
,p_name=>'APEX.IG.HELP.ACTIONS.INTRO'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Una griglia interattiva presenta un set di dati in un report abilitato per le ricerche e personalizzabile. \00C8 possibile eseguire varie operazioni per limitare il numero dei record restituiti e modificare le modalit\00E0 di visualizzazione dei dati.</p>'),
'',
'<p>Usare il campo Cerca per filtrare i record restituiti. Fare clic su Azioni per accedere a varie opzioni per la modifica del layout del report oppure usare i menu Intestazione colonna nelle colonne visualizzate.</p>',
'',
unistr('<p>Usare Impostazioni report per salvare le personalizzazioni apportate a un report. \00C8 inoltre possibile scaricare i dati dal report in un file esterno oppure inviare i dati mediante posta elettronica a se stessi o ad altre persone.</p>'),
'',
'<p>Per ulteriori informazioni, vedere "Uso delle griglie interattive" nella <em>Guida per l''utente finale di Oracle APEX</em>.'))
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140159651375751669)
,p_name=>'APEX.IG.HELP.ACTIONS.INTRO_HEADING'
,p_message_language=>'it'
,p_message_text=>'Panoramica'
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140157662129751669)
,p_name=>'APEX.IG.HELP.ACTIONS.REPORTING'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\00C8 possibile personalizzare la griglia interattiva per visualizzare i dati in vari modi diversi mediante le capacit\00E0 incorporate disponibili.</p>'),
'',
unistr('<p>Usare i menu Intestazione colonna o i menu Azione per determinare le colonne da visualizzare, scegliere la sequenza di visualizzazione e bloccare le colonne. \00C8 inoltre possibile definire vari filtri di dati e ordinare i dati restituiti.</p>'),
'',
unistr('<p>Usare il pulsante Visualizza, situato accanto al campo di ricerca, per accedere alle eventuali altre viste dati definite dallo sviluppatore dell''applicazione. \00C8 inoltre possibile creare un grafico o visualizzare un grafico esistente.</p> '),
'',
unistr('<p><em>Nota: per ottenere informazioni pi\00F9 dettagliate sulla funzione selezionata, fare clic su <strong>?</strong> nelle finestre di dialogo della griglia interattiva.</em></p>')))
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140159781484751669)
,p_name=>'APEX.IG.HELP.ACTIONS.REPORTING_HEADING'
,p_message_language=>'it'
,p_message_text=>unistr('Capacit\00E0 di report')
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140110770704751655)
,p_name=>'APEX.IG.HELP.ACTIONS_TITLE'
,p_message_language=>'it'
,p_message_text=>'Guida della griglia interattiva'
,p_is_js_message=>true
,p_version_scn=>2705055
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140156540097751668)
,p_name=>'APEX.IG.HELP.AGGREGATE'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Usare questa finestra di dialogo per aggregare le colonne. I valori aggregati vengono visualizzati sotto i dati oppure, se sono state definite le interruzioni di controllo, sotto ogni interruzione.</p>',
'',
'<p><strong>Lista Aggregazione</strong><br>',
'Nella lista Aggregazione vengono visualizzate le aggregazioni definite. Per disabilitare un''aggregazione esistente, deselezionarla.<br>',
'Fare clic su Aggiungi (&plus;) per creare una nuova aggregazione oppure su Elimina (&minus;) per rimuovere un''aggregazione esistente.</p>',
'',
'<p><strong>Impostazioni di aggregazione</strong><br>',
'Usare il form a destra per definire l''aggregazione.<br>',
'Selezionare il nome della colonna e il tipo di aggregazione.<br>',
'Se necessario, immettere una descrizione comandi per l''aggregazione.<br>',
unistr('Se \00E8 stata definita un''interruzione di controllo, la selezione di <strong>Mostra valore globale</strong> comporta la visualizzazione della media complessiva, del totale o di un altro valore simile sotto i dati.</p>'),
'',
'<p><em>Nota: per accedere alla finestra di dialogo Aggregazione, utilizzare il menu Azioni oppure fare clic sull''intestazione e sulla somma (&sum;) della colonna.</em></p>'))
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140158705010751669)
,p_name=>'APEX.IG.HELP.AGGREGATE_TITLE'
,p_message_language=>'it'
,p_message_text=>'Guida di Aggregazione'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140157236025751669)
,p_name=>'APEX.IG.HELP.CHART'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Usare questa finestra di dialogo per definire un grafico visualizzato come vista dati distinta.<br>',
'Selezionare un tipo di grafico e gli attributi del grafico.</p>',
'<p><strong>Attributi grafico</strong><br>',
'Gli attributi disponibili variano a seconda del tipo di grafico.</p>',
'<p>',
'<ul>',
'  <li>Selezionare la colonna contenente il valore dell''attributo.',
'    <ul>',
'      <li>Etichetta: il testo per ogni datapoint.</li>',
'      <li>Valore: i dati da rappresentare.</li>',
unistr('      <li>Serie: consente di definire la query dinamica a pi\00F9 serie.</li>'),
'      <li>Apertura: prezzo di apertura giornaliero delle azioni (solo per il grafico Borsistico).</li>',
'      <li>Chiusura: prezzo di chiusura giornaliero delle azioni (solo per il grafico Borsistico).</li>',
'      <li>Valore massimo: il valore massimo (solo per i grafici Intervallo e Borsistico).</li>',
'      <li>Valore minimo: il valore minimo (solo per i grafici Con Intervallo e Borsistico).</li>',
'      <li>Volume: il volume di azioni giornaliero (solo per il grafico Borsistico).</li>',
'      <li>Destinazione: il valore di destinazione (solo grafico a imbuto).</li>',
'      <li>X: il valore dell''asse X (solo grafici A bolle e A dispersione).</li>',
'      <li>Y: il valore dell''asse Y (solo grafici A bolle e A dispersione).</li>',
'      <li>Z: la larghezza della barra o il raggio della bolla (solo grafici A barre, A bolle e Intervallo).</li>',
'    </ul>',
'  </li>',
'  <li>Orientamento: Verticale oppure Orizzontale.</li>',
unistr('  <li>Aggregazione: selezionare le modalit\00E0 di aggregazione dei valori del grafico.</li>'),
'  <li>In pila: specificare se gli elementi dati devono essere visualizzati in pila.</li>',
unistr('  <li>Ordina per: indicare se il grafico deve essere ordinato in base all''etichetta o a uno o pi\00F9 valori.'),
'    <ul>',
'      <li>Direzione: specificare se i dati devono essere ordinati in ordine crescente o decrescente.</li>',
unistr('      <li>Valori nulli: specificare le modalit\00E0 di ordinamento dei record con valori nulli rispetto ai record con valori non nulli.</li>'),
'    </ul>',
'  </li>',
'  <li>Posizioni decimali</li>',
'  <li>Titolo asse etichetta</li>',
'  <li>Titolo asse valori</li>',
'</ul>',
'</p>'))
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140159177102751669)
,p_name=>'APEX.IG.HELP.CHART_TITLE'
,p_message_language=>'it'
,p_message_text=>'Guida di Grafico'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140156237594751668)
,p_name=>'APEX.IG.HELP.COLUMNS'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Usare questa finestra di dialogo per scegliere le colonne da visualizzare e l''ordine di visualizzazione delle colonne.</p>',
'',
'<p>Per nascondere una colonna, deselezionarla.<br>',
'Per riordinare le colonne, fare clic su Sposta in alto (&uarr;) o su Sposta in basso (&darr;).<br>',
'Usare il selettore a discesa per elencare tutte le colonne, le colonne visualizzate o le colonne non visualizzate.</p>',
'',
'<p>Facoltativamente, usare il form per specificare la larghezza minima di una colonna in pixel.</p>',
'',
unistr('<p><em>Nota: \00E8 possibile riordinare le colonne visualizzate anche facendo clic sul quadratino di trascinamento (all''inizio dell''intestazione della colonna) e trascinando la colonna a sinistra o a destra. \00C8 possibile modificare la larghezza delle colo')
||'nne visualizzate anche selezionando il separatore delle colonne, tra le intestazioni, e spostandolo a sinistra o a destra.</em></p>'))
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140159038692751669)
,p_name=>'APEX.IG.HELP.COLUMNS_TITLE'
,p_message_language=>'it'
,p_message_text=>'Guida sulle colonne'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140156686924751668)
,p_name=>'APEX.IG.HELP.COMPUTE'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Usare questa finestra di dialogo per definire colonne aggiuntive in base ai calcoli matematici e funzionali eseguiti sulle colonne esistenti.</p>',
'',
'<p><strong>Lista Calcolo</strong><br>',
'Nella lista Calcolo vengono visualizzati i calcoli definiti. Per disabilitare un calcolo esistente, deselezionarlo.<br>',
'Fare clic su Aggiungi (&plus;) per aggiungere un nuovo calcolo oppure su Elimina (&minus;) per rimuovere un calcolo esistente.</p>',
'',
'<p><strong>Impostazioni di calcolo</strong><br>',
'Usare il form per definire il calcolo.<br>',
'Immettere i dettagli di colonna, ovvero l''intestazione e l''etichetta, quindi selezionare le impostazioni di allineamento.<br> ',
'Usare l''area di testo Espressione per immettere la colonna o le colonne e le funzioni associate per il calcolo.<br>',
'Selezionare il tipo di dati appropriato e, facoltativamente, un formato di visualizzazione, per la nuova colonna.</p>'))
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140158678346751669)
,p_name=>'APEX.IG.HELP.COMPUTE_TITLE'
,p_message_language=>'it'
,p_message_text=>'Guida di Calcola'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140156937426751669)
,p_name=>'APEX.IG.HELP.CONTROL_BREAK'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Usare questa finestra di dialogo per definire un''interruzione di controllo in una o pi\00F9 colonne.</p>'),
'',
'<p><strong>Lista Interruzione di controllo</strong><br>',
'Nella lista Interruzione di controllo vengono visualizzate le interruzioni di controllo definite. Per disabilitare una colonna di interruzione di controllo esistente, deselezionarla.<br>',
'Fare clic su Aggiungi (&plus;) per includere una nuova colonna nell''interruzione di controllo oppure su Elimina (&minus;) per rimuovere una colonna esistente dall''interruzione di controllo.<br>',
'Per riordinare le colonne, fare clic su Sposta in alto (&uarr;) o su Sposta in basso (&darr;) per spostare la colonna selezionata verso l''alto o verso il basso rispetto alle altre colonne.</p>',
'',
'<p><strong>Impostazioni di interruzione di controllo</strong><br>',
'Usare il form per definire la colonna dell''interruzione di controllo.<br>',
unistr('Selezionare una colonna di interruzione di controllo, la direzione dell''ordinamento e le modalit\00E0 di ordinamento delle colonne nulle (le colonne prive di valori).</p>'),
'',
unistr('<p><em>Nota: durante la visualizzazione della griglia interattiva, \00E8 possibile definire un''interruzione di controllo facendo clic sull''intestazione di una colonna e selezionando l''icona Interruzione di controllo.</em></p>')))
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140158309028751669)
,p_name=>'APEX.IG.HELP.CONTROL_BREAK_TITLE'
,p_message_language=>'it'
,p_message_text=>'Guida di Interruzione di controllo'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140157138766751669)
,p_name=>'APEX.IG.HELP.DOWNLOAD'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Usare questa finestra di dialogo per scaricare tutte le righe correnti in un file esterno. Il file conterr\00E0 solo le colonne visualizzate al momento in base ai filtri e all''ordinamento applicati ai dati.</p>'),
'',
'<p>Selezionare il formato del file e fare clic su Scarica.<br>',
'Nota: con il formato CSV i dettagli di formattazione del testo, quali le aggregazioni e le interruzioni di controllo, non vengono inclusi.</p>',
'',
'<p>Per inviare il file tramite posta elettronica, selezionare Invia come posta elettronica e immettere i dettagli dell''invio (Destinatario, Oggetto e Messaggio).</p>'))
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140158116375751669)
,p_name=>'APEX.IG.HELP.DOWNLOAD_TITLE'
,p_message_language=>'it'
,p_message_text=>'Guida di Scarica'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140156372419751668)
,p_name=>'APEX.IG.HELP.FILTER'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Usare questa finestra di dialogo per configurare i filtri dei dati che limitano il numero delle righe restituite.</p>',
'',
'<p><strong>Lista Filtro</strong><br>',
'La lista Filtro contiene i filtri definiti. Per disabilitare un filtro esistente, deselezionarlo.<br>',
'Fare clic su Aggiungi (&plus;) per creare un nuovo filtro o su Elimina (&minus;) per rimuovere un filtro esistente.</p>',
'',
'<p><strong>Impostazioni di filtro</strong><br>',
unistr('Usare il form per definire le propriet\00E0 del filtro.<br>'),
'Selezionare il tipo di filtro appropriato:<br>',
'&nbsp;&nbsp;&nbsp;Riga: filtro per un termine in qualsiasi colonna filtrabile.<br>',
'&nbsp;&nbsp;&nbsp;Colonna: filtra una colonna specifica con l''operatore e il valore specificati.</p>',
'',
unistr('<p><em>Nota: durante la visualizzazione della griglia interattiva, \00E8 possibile definire i filtri Riga digitando direttamente nel campo di ricerca. Fare clic su Selezionare le colonne in cui cercare per limitare la ricerca a una colonna specifica. In ')
||'alternativa, aprire un menu Intestazione colonna e selezionare un valore per creare un filtro Colonna.</em></p>'))
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140158910263751669)
,p_name=>'APEX.IG.HELP.FILTER_TITLE'
,p_message_language=>'it'
,p_message_text=>'Guida di Filtra'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140156757043751668)
,p_name=>'APEX.IG.HELP.FLASHBACK'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Usare questa finestra di dialogo per visualizzare i dati cos\00EC come si presentavano in un point-in-time precedente.</p>'),
'<p>Immettere il numero di minuti nel passato per eseguire la funzione Flashback query.</p>'))
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140158572773751669)
,p_name=>'APEX.IG.HELP.FLASHBACK_TITLE'
,p_message_language=>'it'
,p_message_text=>'Guida di Flashback'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140159299944751669)
,p_name=>'APEX.IG.HELP.GROUP_BY_TITLE'
,p_message_language=>'it'
,p_message_text=>'Guida di Raggruppa per'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140156860738751669)
,p_name=>'APEX.IG.HELP.HIGHLIGHT'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Usare questa finestra di dialogo per evidenziare le righe o le colonne di dati in base alla condizione immessa.</p>',
'',
'<p><strong>Lista Evidenzia</strong><br>',
'Nella lista Evidenzia vengono visualizzate le evidenziazioni definite. Per disabilitare un''evidenziazione esistente, deselezionarla.<br>',
'Fare clic su Aggiungi (&plus;) per creare una nuova evidenziazione oppure su Elimina (&minus;) per rimuovere un''evidenziazione esistente.</p>',
'',
'<p><strong>Impostazioni di evidenziazione</strong><br>',
unistr('Usare il form per definire le propriet\00E0 di evidenziazione.<br>'),
'Immettere il nome, selezionare Riga o Colonna, quindi selezionare i codici di colore HTML per lo sfondo e il testo.<br>',
'Selezionare il <strong>tipo di condizione</strong> appropriato per evidenziare dati specifici:<br>',
'&nbsp;&nbsp;&nbsp;Riga: evidenzia un termine in qualsiasi colonna.<br>',
'&nbsp;&nbsp;&nbsp;Colonna: applica l''evidenziazione in una colonna specifica in base all''operatore e valore specificati.</p>'))
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140158404060751669)
,p_name=>'APEX.IG.HELP.HIGHLIGHT_TITLE'
,p_message_language=>'it'
,p_message_text=>'Guida di Evidenzia'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140157077143751669)
,p_name=>'APEX.IG.HELP.REPORT'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Usare questa finestra di dialogo per salvare le modifiche apportate al layout e alla configurazione della griglia corrente.<br>',
unistr('Gli sviluppatori di applicazioni possono definire pi\00F9 layout di report alternativi. Laddove si \00E8 autorizzati a farlo, \00E8 possibile salvare un report come Pubblico, ovvero renderlo disponibile per tutti gli altri utenti della griglia. \00C8 inoltre possibi')
||unistr('le salvare un report come Privato, in modo da essere l''unica persona che potr\00E0 visualizzarne il contenuto.</p>'),
'<p>Effettuare la selezione nei tipi disponibili e immettere un nome per il report salvato.</p>'))
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140158216162751669)
,p_name=>'APEX.IG.HELP.REPORT_TITLE'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Guida di Report',
''))
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140156486096751668)
,p_name=>'APEX.IG.HELP.SORT'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Usare questa finestra di dialogo per impostare l''ordine di visualizzazione.</p>',
'',
'<p><strong>Lista Ordina</strong><br>',
'La finestra di dialogo Ordina visualizza la lista delle regole di ordinamento configurate.<br>',
'Fare clic su Aggiungi (&plus;) per creare una colonna di ordinamento oppure su Elimina (&minus;) per rimuovere una colonna di ordinamento.<br>',
'Fare clic su Sposta in alto (&uarr;) e su Sposta in basso (&darr;) per spostare la colonna di ordinamento selezionata verso l''alto e verso il basso rispetto alle altre colonne di ordinamento.</p>',
'',
'<p><strong>Impostazioni di ordinamento</strong><br>',
unistr('Selezionare una colonna di ordinamento, la direzione dell''ordinamento e le modalit\00E0 di ordinamento delle colonne nulle (le colonne prive di valori).</p>'),
'',
'<p><em>Nota: i dati possono essere ordinati in base a colonne non visualizzate, ma non tutte le colonne sono ordinabili.</em><br>',
unistr('<em>Le colonne visualizzate possono essere ordinate facendo clic sulla freccia su (ordine crescente) o sulla freccia gi\00F9 (ordine decrescente) alla fine delle intestazioni delle colonne. Per aggiungere un''ulteriore colonna a un ordinamento esistente, ')
||unistr('tenere premuto il tasto Maiusc e premere Freccia SU o Freccia GI\00D9.</em></p>')))
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140158815779751669)
,p_name=>'APEX.IG.HELP.SORT_TITLE'
,p_message_language=>'it'
,p_message_text=>'Guida di Ordina'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140158059688751669)
,p_name=>'APEX.IG.HELP.SUBSCRIPTION_TITLE'
,p_message_language=>'it'
,p_message_text=>'Guida di Sottoscrizione'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140111634280751655)
,p_name=>'APEX.IG.HIDE'
,p_message_language=>'it'
,p_message_text=>'Nascondi'
,p_is_js_message=>true
,p_version_scn=>2705056
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140076081826751645)
,p_name=>'APEX.IG.HIGHLIGHT'
,p_message_language=>'it'
,p_message_text=>'Evidenzia'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140145272583751665)
,p_name=>'APEX.IG.HIGH_COLUMN'
,p_message_language=>'it'
,p_message_text=>'Valore massimo'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140146048490751665)
,p_name=>'APEX.IG.HORIZONTAL'
,p_message_language=>'it'
,p_message_text=>'Orizzontale'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140104637176751653)
,p_name=>'APEX.IG.HOURS'
,p_message_language=>'it'
,p_message_text=>'ore'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140109644763751655)
,p_name=>'APEX.IG.ICON'
,p_message_language=>'it'
,p_message_text=>'Icona'
,p_is_js_message=>true
,p_version_scn=>2705055
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140074937751751644)
,p_name=>'APEX.IG.ICON_VIEW'
,p_message_language=>'it'
,p_message_text=>'Vista icone'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140102810071751653)
,p_name=>'APEX.IG.IN'
,p_message_language=>'it'
,p_message_text=>'in'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140111209929751655)
,p_name=>'APEX.IG.INACTIVE_SETTING'
,p_message_language=>'it'
,p_message_text=>'Impostazione non attiva'
,p_is_js_message=>true
,p_version_scn=>2705055
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140111340957751655)
,p_name=>'APEX.IG.INACTIVE_SETTINGS'
,p_message_language=>'it'
,p_message_text=>'Impostazioni non attive'
,p_is_js_message=>true
,p_version_scn=>2705055
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140118955104751657)
,p_name=>'APEX.IG.INTERNAL_ERROR'
,p_message_language=>'it'
,p_message_text=>unistr('Si \00E8 verificato un errore interno durante l''elaborazione della richiesta della griglia interattiva.')
,p_version_scn=>2705059
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140006871824751624)
,p_name=>'APEX.IG.INVALID_COLUMN_FILTER_TYPE'
,p_message_language=>'it'
,p_message_text=>unistr('Il tipo di filtro colonna "%0" non \00E8 supportato per la colonna "%1".')
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140157898438751669)
,p_name=>'APEX.IG.INVALID_DATE_FORMAT'
,p_message_language=>'it'
,p_message_text=>'Formato data non valido'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140132697257751661)
,p_name=>'APEX.IG.INVALID_FILTER_COLUMN'
,p_message_language=>'it'
,p_message_text=>'La griglia interattiva non supporta la definizione di un filtro sulla colonna %0.'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140132575110751661)
,p_name=>'APEX.IG.INVALID_FILTER_OPERATOR'
,p_message_language=>'it'
,p_message_text=>unistr('%0 non \00E8 un tipo di filtro valido per la definizione di un filtro di griglia interattiva.')
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140013404069751626)
,p_name=>'APEX.IG.INVALID_NUMBER_FORMAT'
,p_message_language=>'it'
,p_message_text=>'Formato numerico non valido'
,p_is_js_message=>true
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140160580846751670)
,p_name=>'APEX.IG.INVALID_SETTING'
,p_message_language=>'it'
,p_message_text=>'Impostazione non valida'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140160622703751670)
,p_name=>'APEX.IG.INVALID_SETTINGS'
,p_message_language=>'it'
,p_message_text=>'Impostazioni non valide'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140151776447751667)
,p_name=>'APEX.IG.INVALID_SORT_BY'
,p_message_language=>'it'
,p_message_text=>unistr('L''opzione Ordina per \00E8 stata impostata su %0, ma non \00E8 stata selezionata alcuna colonna per %0.')
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140149054618751666)
,p_name=>'APEX.IG.INVALID_VALUE'
,p_message_language=>'it'
,p_message_text=>'Valore non valido'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140144144843751665)
,p_name=>'APEX.IG.INVISIBLE'
,p_message_language=>'it'
,p_message_text=>'Non visualizzato'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140103603549751653)
,p_name=>'APEX.IG.IN_THE_LAST'
,p_message_language=>'it'
,p_message_text=>'negli/lle ultimi/e'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140103815922751653)
,p_name=>'APEX.IG.IN_THE_NEXT'
,p_message_language=>'it'
,p_message_text=>'nei seguenti'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140102790773751652)
,p_name=>'APEX.IG.IS_NOT_NULL'
,p_message_language=>'it'
,p_message_text=>unistr('non \00E8 vuoto')
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140102624081751652)
,p_name=>'APEX.IG.IS_NULL'
,p_message_language=>'it'
,p_message_text=>unistr('\00E8 vuoto')
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140152533086751667)
,p_name=>'APEX.IG.LABEL'
,p_message_language=>'it'
,p_message_text=>'Etichetta'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140144533363751665)
,p_name=>'APEX.IG.LABEL_COLUMN'
,p_message_language=>'it'
,p_message_text=>'Etichetta'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140148402612751666)
,p_name=>'APEX.IG.LAST'
,p_message_language=>'it'
,p_message_text=>'Alla fine'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140092936475751650)
,p_name=>'APEX.IG.LAST.DAY'
,p_message_language=>'it'
,p_message_text=>'Ultimo giorno'
,p_is_js_message=>true
,p_version_scn=>2705049
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140093190901751650)
,p_name=>'APEX.IG.LAST.HOUR'
,p_message_language=>'it'
,p_message_text=>'Ultima ora'
,p_is_js_message=>true
,p_version_scn=>2705049
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140093689759751650)
,p_name=>'APEX.IG.LAST.MINUTE'
,p_message_language=>'it'
,p_message_text=>'Ultimo minuto'
,p_is_js_message=>true
,p_version_scn=>2705049
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140092653431751649)
,p_name=>'APEX.IG.LAST.MONTH'
,p_message_language=>'it'
,p_message_text=>'Mese scorso'
,p_is_js_message=>true
,p_version_scn=>2705049
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140092749722751650)
,p_name=>'APEX.IG.LAST.WEEK'
,p_message_language=>'it'
,p_message_text=>'Settimana scorsa'
,p_is_js_message=>true
,p_version_scn=>2705049
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140092855386751650)
,p_name=>'APEX.IG.LAST.X_DAYS'
,p_message_language=>'it'
,p_message_text=>'Ultimi %0 giorni'
,p_is_js_message=>true
,p_version_scn=>2705049
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140093085686751650)
,p_name=>'APEX.IG.LAST.X_HOURS'
,p_message_language=>'it'
,p_message_text=>'Ultime %0 ore'
,p_is_js_message=>true
,p_version_scn=>2705049
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140093704320751650)
,p_name=>'APEX.IG.LAST.X_MINUTES'
,p_message_language=>'it'
,p_message_text=>'Ultimi %0 minuti'
,p_is_js_message=>true
,p_version_scn=>2705049
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140093590102751650)
,p_name=>'APEX.IG.LAST.X_MONTHS'
,p_message_language=>'it'
,p_message_text=>'Ultimi %0 mesi'
,p_is_js_message=>true
,p_version_scn=>2705049
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140093441470751650)
,p_name=>'APEX.IG.LAST.X_WEEKS'
,p_message_language=>'it'
,p_message_text=>'Ultime %0 settimane'
,p_is_js_message=>true
,p_version_scn=>2705049
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140092431788751649)
,p_name=>'APEX.IG.LAST.X_YEARS'
,p_message_language=>'it'
,p_message_text=>'Ultimi %0 anni'
,p_is_js_message=>true
,p_version_scn=>2705049
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140092535845751649)
,p_name=>'APEX.IG.LAST.YEAR'
,p_message_language=>'it'
,p_message_text=>'Anno scorso'
,p_is_js_message=>true
,p_version_scn=>2705049
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140152762863751667)
,p_name=>'APEX.IG.LAYOUT_ALIGN'
,p_message_language=>'it'
,p_message_text=>'Allineamento cella'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140152837910751667)
,p_name=>'APEX.IG.LAYOUT_USEGROUPFOR'
,p_message_language=>'it'
,p_message_text=>'Usa gruppo per'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140103225240751653)
,p_name=>'APEX.IG.LESS_THAN'
,p_message_language=>'it'
,p_message_text=>'minore di'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140103319474751653)
,p_name=>'APEX.IG.LESS_THAN_OR_EQUALS'
,p_message_language=>'it'
,p_message_text=>'minore o uguale a'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140146690791751666)
,p_name=>'APEX.IG.LINE'
,p_message_language=>'it'
,p_message_text=>'A linee'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140146763792751666)
,p_name=>'APEX.IG.LINE_WITH_AREA'
,p_message_language=>'it'
,p_message_text=>'A linee con area'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140153177301751667)
,p_name=>'APEX.IG.LISTAGG'
,p_message_language=>'it'
,p_message_text=>'Listagg'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140145320649751665)
,p_name=>'APEX.IG.LOW_COLUMN'
,p_message_language=>'it'
,p_message_text=>'Valore minimo'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140155691383751668)
,p_name=>'APEX.IG.MAILADDRESSES_COMMASEP'
,p_message_language=>'it'
,p_message_text=>unistr('Separare pi\00F9 indirizzi con virgole')
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140104478218751653)
,p_name=>'APEX.IG.MATCHES_REGULAR_EXPRESSION'
,p_message_language=>'it'
,p_message_text=>'corrisponde all''espressione regolare'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140128865821751660)
,p_name=>'APEX.IG.MAX'
,p_message_language=>'it'
,p_message_text=>'Massimo'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140163185781751670)
,p_name=>'APEX.IG.MAX_OVERALL'
,p_message_language=>'it'
,p_message_text=>'Massimo globale'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140129056886751660)
,p_name=>'APEX.IG.MEDIAN'
,p_message_language=>'it'
,p_message_text=>'Mediana'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140163244193751670)
,p_name=>'APEX.IG.MEDIAN_OVERALL'
,p_message_language=>'it'
,p_message_text=>'Mediana globale'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140128776815751660)
,p_name=>'APEX.IG.MIN'
,p_message_language=>'it'
,p_message_text=>'Minimo'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140104599130751653)
,p_name=>'APEX.IG.MINUTES'
,p_message_language=>'it'
,p_message_text=>'minuti'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140129511366751661)
,p_name=>'APEX.IG.MINUTES_AGO'
,p_message_language=>'it'
,p_message_text=>'Minuti fa'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140163039374751670)
,p_name=>'APEX.IG.MIN_OVERALL'
,p_message_language=>'it'
,p_message_text=>'Minimo globale'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140104991206751653)
,p_name=>'APEX.IG.MONTHS'
,p_message_language=>'it'
,p_message_text=>'mesi'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140111502083751655)
,p_name=>'APEX.IG.MORE_DATA_FOUND'
,p_message_language=>'it'
,p_message_text=>unistr('I dati contengono pi\00F9 di %0 righe. Questo valore supera il limite massimo consentito. Applicare ulteriori filtri per visualizzare i risultati.')
,p_is_js_message=>true
,p_version_scn=>2705056
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140137355705751663)
,p_name=>'APEX.IG.MULTIIG_PAGE_REGION_STATIC_ID_REQUIRED'
,p_message_language=>'it'
,p_message_text=>unistr('\00C8 necessario specificare l''ID statico area poich\00E9 la pagina contiene pi\00F9 griglie interattive.')
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140107666332751654)
,p_name=>'APEX.IG.NAME'
,p_message_language=>'it'
,p_message_text=>'Nome'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140107883164751654)
,p_name=>'APEX.IG.NAMED_REPORT'
,p_message_language=>'it'
,p_message_text=>'Report denominato'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140091871556751649)
,p_name=>'APEX.IG.NEXT.DAY'
,p_message_language=>'it'
,p_message_text=>'Giorno successivo'
,p_is_js_message=>true
,p_version_scn=>2705049
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140091620150751649)
,p_name=>'APEX.IG.NEXT.HOUR'
,p_message_language=>'it'
,p_message_text=>'Ora successiva'
,p_is_js_message=>true
,p_version_scn=>2705049
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140093897424751650)
,p_name=>'APEX.IG.NEXT.MINUTE'
,p_message_language=>'it'
,p_message_text=>'Minuto successivo'
,p_is_js_message=>true
,p_version_scn=>2705049
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140092186879751649)
,p_name=>'APEX.IG.NEXT.MONTH'
,p_message_language=>'it'
,p_message_text=>'Mese successivo'
,p_is_js_message=>true
,p_version_scn=>2705049
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140092052202751649)
,p_name=>'APEX.IG.NEXT.WEEK'
,p_message_language=>'it'
,p_message_text=>'Settimana successiva'
,p_is_js_message=>true
,p_version_scn=>2705049
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140091983843751649)
,p_name=>'APEX.IG.NEXT.X_DAYS'
,p_message_language=>'it'
,p_message_text=>'%0 giorni successivi'
,p_is_js_message=>true
,p_version_scn=>2705049
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140091790119751649)
,p_name=>'APEX.IG.NEXT.X_HOURS'
,p_message_language=>'it'
,p_message_text=>'%0 ore successive'
,p_is_js_message=>true
,p_version_scn=>2705049
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140093934842751650)
,p_name=>'APEX.IG.NEXT.X_MINUTES'
,p_message_language=>'it'
,p_message_text=>'%0 minuti successivi'
,p_is_js_message=>true
,p_version_scn=>2705049
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140093282200751650)
,p_name=>'APEX.IG.NEXT.X_MONTHS'
,p_message_language=>'it'
,p_message_text=>'%0 mesi successivi'
,p_is_js_message=>true
,p_version_scn=>2705049
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140093386826751650)
,p_name=>'APEX.IG.NEXT.X_WEEKS'
,p_message_language=>'it'
,p_message_text=>'%0 settimane successive'
,p_is_js_message=>true
,p_version_scn=>2705049
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140092312552751649)
,p_name=>'APEX.IG.NEXT.X_YEARS'
,p_message_language=>'it'
,p_message_text=>'%0 anni successivi'
,p_is_js_message=>true
,p_version_scn=>2705049
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140092292319751649)
,p_name=>'APEX.IG.NEXT.YEAR'
,p_message_language=>'it'
,p_message_text=>'Anno successivo'
,p_is_js_message=>true
,p_version_scn=>2705049
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140103561985751653)
,p_name=>'APEX.IG.NOT_BETWEEN'
,p_message_language=>'it'
,p_message_text=>'non tra'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140102569632751652)
,p_name=>'APEX.IG.NOT_EQUALS'
,p_message_language=>'it'
,p_message_text=>'non uguale a'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140167312282751672)
,p_name=>'APEX.IG.NOT_EXIST'
,p_message_language=>'it'
,p_message_text=>unistr('L''area con ID %0 non \00E8 di tipo Griglia interattiva oppure non esiste nell''applicazione %1.')
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140102980004751653)
,p_name=>'APEX.IG.NOT_IN'
,p_message_language=>'it'
,p_message_text=>'non in'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140103734240751653)
,p_name=>'APEX.IG.NOT_IN_THE_LAST'
,p_message_language=>'it'
,p_message_text=>'non negli/lle ultimi/e'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140103930970751653)
,p_name=>'APEX.IG.NOT_IN_THE_NEXT'
,p_message_language=>'it'
,p_message_text=>'non nei/lle seguenti'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140111440284751655)
,p_name=>'APEX.IG.NO_DATA_FOUND'
,p_message_language=>'it'
,p_message_text=>'Nessun dato trovato'
,p_is_js_message=>true
,p_version_scn=>2705056
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140148236841751666)
,p_name=>'APEX.IG.NULLS'
,p_message_language=>'it'
,p_message_text=>'Valori nulli'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140153363852751667)
,p_name=>'APEX.IG.NUMBER'
,p_message_language=>'it'
,p_message_text=>'Numerico'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140148579595751666)
,p_name=>'APEX.IG.OFF'
,p_message_language=>'it'
,p_message_text=>'Non attivo'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140148640517751666)
,p_name=>'APEX.IG.ON'
,p_message_language=>'it'
,p_message_text=>'Attivo'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140101742147751652)
,p_name=>'APEX.IG.ONE_MINUTE_AGO'
,p_message_language=>'it'
,p_message_text=>'1 minuto fa'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140156159859751668)
,p_name=>'APEX.IG.OPEN_COLORPICKER'
,p_message_language=>'it'
,p_message_text=>'Apri selettore colori: %0'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140145060134751665)
,p_name=>'APEX.IG.OPEN_COLUMN'
,p_message_language=>'it'
,p_message_text=>'Apri'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140108707355751654)
,p_name=>'APEX.IG.OPERATOR'
,p_message_language=>'it'
,p_message_text=>'Operatore'
,p_is_js_message=>true
,p_version_scn=>2705055
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140144429812751665)
,p_name=>'APEX.IG.ORIENTATION'
,p_message_language=>'it'
,p_message_text=>'Orientamento'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140146807888751666)
,p_name=>'APEX.IG.PIE'
,p_message_language=>'it'
,p_message_text=>'A torta'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140110074430751655)
,p_name=>'APEX.IG.PIVOT'
,p_message_language=>'it'
,p_message_text=>'Pivot'
,p_is_js_message=>true
,p_version_scn=>2705055
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140075268153751644)
,p_name=>'APEX.IG.PIVOT_VIEW'
,p_message_language=>'it'
,p_message_text=>'Vista pivot'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140156039983751668)
,p_name=>'APEX.IG.PLACEHOLDER_INVALUES'
,p_message_language=>'it'
,p_message_text=>'Separare i valori con "%0"'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140146911094751666)
,p_name=>'APEX.IG.POLAR'
,p_message_language=>'it'
,p_message_text=>'Polare'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140152243064751667)
,p_name=>'APEX.IG.POSITION_CENTER'
,p_message_language=>'it'
,p_message_text=>'Al centro'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140152393640751667)
,p_name=>'APEX.IG.POSITION_END'
,p_message_language=>'it'
,p_message_text=>'Fine'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140152129455751667)
,p_name=>'APEX.IG.POSITION_START'
,p_message_language=>'it'
,p_message_text=>'Inizio'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140107961799751654)
,p_name=>'APEX.IG.PRIMARY'
,p_message_language=>'it'
,p_message_text=>'Primario'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140108216293751654)
,p_name=>'APEX.IG.PRIMARY_DEFAULT'
,p_message_language=>'it'
,p_message_text=>'Predefinito primario'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140124746385751659)
,p_name=>'APEX.IG.PRIMARY_REPORT'
,p_message_language=>'it'
,p_message_text=>'Report primario'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139998322737751622)
,p_name=>'APEX.IG.PRINT_ACCESSIBLE.PROMPT'
,p_message_language=>'it'
,p_message_text=>'Includi tag di accesso facilitato'
,p_is_js_message=>true
,p_version_scn=>2705035
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139995745024751621)
,p_name=>'APEX.IG.PRINT_ORIENTATION.LOV.HORIZONTAL.D'
,p_message_language=>'it'
,p_message_text=>'Orizzontale'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139995855538751621)
,p_name=>'APEX.IG.PRINT_ORIENTATION.LOV.VERTICAL.D'
,p_message_language=>'it'
,p_message_text=>'Verticale'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139995641727751621)
,p_name=>'APEX.IG.PRINT_ORIENTATION.PROMPT'
,p_message_language=>'it'
,p_message_text=>'Orientamento pagina'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139995585844751621)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.A3.D'
,p_message_language=>'it'
,p_message_text=>'A3'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139995449102751621)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.A4.D'
,p_message_language=>'it'
,p_message_text=>'A4'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139998597952751622)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.CUSTOM.D'
,p_message_language=>'it'
,p_message_text=>'Personalizzato'
,p_is_js_message=>true
,p_version_scn=>2705035
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139995254389751621)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.LEGAL.D'
,p_message_language=>'it'
,p_message_text=>'Legale'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139995130336751621)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.LETTER.D'
,p_message_language=>'it'
,p_message_text=>'Lettera'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139995373369751621)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.TABLOID.D'
,p_message_language=>'it'
,p_message_text=>'Tabloid'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139995049120751621)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.PROMPT'
,p_message_language=>'it'
,p_message_text=>'Dimensione pagina'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139960672526751611)
,p_name=>'APEX.IG.PRINT_STRIP_RICH_TEXT.PROMPT'
,p_message_language=>'it'
,p_message_text=>'Rimuovi formattazione dal testo'
,p_is_js_message=>true
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140147050991751666)
,p_name=>'APEX.IG.RADAR'
,p_message_language=>'it'
,p_message_text=>'Radar'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140147111204751666)
,p_name=>'APEX.IG.RANGE'
,p_message_language=>'it'
,p_message_text=>'A intervalli'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140157355697751669)
,p_name=>'APEX.IG.REFRESH'
,p_message_language=>'it'
,p_message_text=>'Aggiorna'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140112270026751655)
,p_name=>'APEX.IG.REFRESH_ROW'
,p_message_language=>'it'
,p_message_text=>'Aggiorna riga'
,p_is_js_message=>true
,p_version_scn=>2705056
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140111033041751655)
,p_name=>'APEX.IG.REFRESH_ROWS'
,p_message_language=>'it'
,p_message_text=>'Aggiorna righe'
,p_is_js_message=>true
,p_version_scn=>2705055
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140116276176751657)
,p_name=>'APEX.IG.REGION_NOT_EXIST'
,p_message_language=>'it'
,p_message_text=>'L''area Griglia interattiva non esiste nell''applicazione %0, pagina %1 e area %2.'
,p_version_scn=>2705058
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140076760790751645)
,p_name=>'APEX.IG.REMOVE_CONTROL'
,p_message_language=>'it'
,p_message_text=>'Rimuovi %0'
,p_is_js_message=>true
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140107326114751654)
,p_name=>'APEX.IG.REPORT'
,p_message_language=>'it'
,p_message_text=>'Report'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140166559934751671)
,p_name=>'APEX.IG.REPORT.DELETED'
,p_message_language=>'it'
,p_message_text=>'Report eliminato'
,p_is_js_message=>true
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140166218572751671)
,p_name=>'APEX.IG.REPORT.SAVED.ALTERNATIVE'
,p_message_language=>'it'
,p_message_text=>'Report alternativo salvato per tutti gli utenti'
,p_is_js_message=>true
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140166169204751671)
,p_name=>'APEX.IG.REPORT.SAVED.DEFAULT'
,p_message_language=>'it'
,p_message_text=>'Report predefinito salvato per tutti gli utenti'
,p_is_js_message=>true
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140166487173751671)
,p_name=>'APEX.IG.REPORT.SAVED.PRIVATE'
,p_message_language=>'it'
,p_message_text=>'Report privato salvato'
,p_is_js_message=>true
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140166398964751671)
,p_name=>'APEX.IG.REPORT.SAVED.PUBLIC'
,p_message_language=>'it'
,p_message_text=>'Report pubblico salvato per tutti gli utenti'
,p_is_js_message=>true
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140116311380751657)
,p_name=>'APEX.IG.REPORT_ALIAS_DOES_NOT_EXIST'
,p_message_language=>'it'
,p_message_text=>'La griglia interattiva salvata con nome %0 non esiste.'
,p_version_scn=>2705059
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140101665915751652)
,p_name=>'APEX.IG.REPORT_DATA_AS_OF.X.MINUTES_AGO'
,p_message_language=>'it'
,p_message_text=>unistr('Dati della griglia cos\00EC come si presentavano %0 minuti fa')
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140101546438751652)
,p_name=>'APEX.IG.REPORT_DATA_AS_OF_ONE_MINUTE_AGO'
,p_message_language=>'it'
,p_message_text=>unistr('Dati della griglia cos\00EC come si presentavano 1 minuto fa')
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140037009037751633)
,p_name=>'APEX.IG.REPORT_DOES_NOT_EXIST'
,p_message_language=>'it'
,p_message_text=>'Il report della griglia interattiva non esiste.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140159534719751669)
,p_name=>'APEX.IG.REPORT_EDIT'
,p_message_language=>'it'
,p_message_text=>'Report - Modifica'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140116190134751656)
,p_name=>'APEX.IG.REPORT_ID_DOES_NOT_EXIST'
,p_message_language=>'it'
,p_message_text=>'La griglia interattiva salvata con ID %0 non esiste.'
,p_version_scn=>2705058
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140159440777751669)
,p_name=>'APEX.IG.REPORT_SAVE_AS'
,p_message_language=>'it'
,p_message_text=>'Report - Salva con nome'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140076873915751645)
,p_name=>'APEX.IG.REPORT_SETTINGS'
,p_message_language=>'it'
,p_message_text=>'Impostazioni griglia'
,p_is_js_message=>true
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140167413280751672)
,p_name=>'APEX.IG.REPORT_STATIC_ID_DOES_NOT_EXIST'
,p_message_language=>'it'
,p_message_text=>'La griglia interattiva salvata con ID statico %0 non esiste.'
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140162466365751670)
,p_name=>'APEX.IG.REPORT_VIEW'
,p_message_language=>'it'
,p_message_text=>'Vista report'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140075940362751645)
,p_name=>'APEX.IG.RESET'
,p_message_language=>'it'
,p_message_text=>'Reimposta'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140112307896751655)
,p_name=>'APEX.IG.REVERT_CHANGES'
,p_message_language=>'it'
,p_message_text=>'Annulla modifiche'
,p_is_js_message=>true
,p_version_scn=>2705056
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140111113392751655)
,p_name=>'APEX.IG.REVERT_ROWS'
,p_message_language=>'it'
,p_message_text=>'Ripristina righe'
,p_is_js_message=>true
,p_version_scn=>2705055
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140108327852751654)
,p_name=>'APEX.IG.ROW'
,p_message_language=>'it'
,p_message_text=>'Riga'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140107265507751654)
,p_name=>'APEX.IG.ROWS_PER_PAGE'
,p_message_language=>'it'
,p_message_text=>'Righe per pagina'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140167023489751672)
,p_name=>'APEX.IG.ROW_ACTIONS'
,p_message_language=>'it'
,p_message_text=>'Azioni riga'
,p_is_js_message=>true
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140168277337751672)
,p_name=>'APEX.IG.ROW_ACTIONS_FOR'
,p_message_language=>'it'
,p_message_text=>'Azioni per la riga %0'
,p_is_js_message=>true
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140076252232751645)
,p_name=>'APEX.IG.SAVE'
,p_message_language=>'it'
,p_message_text=>'Salva'
,p_is_js_message=>true
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140121310774751658)
,p_name=>'APEX.IG.SAVED'
,p_message_language=>'it'
,p_message_text=>'salvato'
,p_is_js_message=>true
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140025923536751630)
,p_name=>'APEX.IG.SAVED_REPORT'
,p_message_language=>'it'
,p_message_text=>'Report salvato: %0'
,p_is_js_message=>true
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140074469262751644)
,p_name=>'APEX.IG.SAVED_REPORTS'
,p_message_language=>'it'
,p_message_text=>'Report salvati'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140074590865751644)
,p_name=>'APEX.IG.SAVED_REPORT_DEFAULT'
,p_message_language=>'it'
,p_message_text=>'Predefinito'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140048029362751636)
,p_name=>'APEX.IG.SAVED_REPORT_EXISTS'
,p_message_language=>'it'
,p_message_text=>unistr('Un report salvato denominato %0 esiste gi\00E0. Immettere un nuovo nome.')
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140074694818751644)
,p_name=>'APEX.IG.SAVED_REPORT_PRIVATE'
,p_message_language=>'it'
,p_message_text=>'Privato'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140074763207751644)
,p_name=>'APEX.IG.SAVED_REPORT_PUBLIC'
,p_message_language=>'it'
,p_message_text=>'Pubblico'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140162137733751670)
,p_name=>'APEX.IG.SAVE_AS'
,p_message_language=>'it'
,p_message_text=>'Salva con nome'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140110488033751655)
,p_name=>'APEX.IG.SAVE_REPORT_SETTINGS'
,p_message_language=>'it'
,p_message_text=>'Salva impostazioni report'
,p_is_js_message=>true
,p_version_scn=>2705055
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140147267611751666)
,p_name=>'APEX.IG.SCATTER'
,p_message_language=>'it'
,p_message_text=>'A dispersione'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140074353333751644)
,p_name=>'APEX.IG.SEARCH'
,p_message_language=>'it'
,p_message_text=>'Cerca'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140154402136751668)
,p_name=>'APEX.IG.SEARCH.ALL_COLUMNS'
,p_message_language=>'it'
,p_message_text=>'Cerca: Tutte le colonne di testo'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140074251439751644)
,p_name=>'APEX.IG.SEARCH.COLUMN'
,p_message_language=>'it'
,p_message_text=>'Cerca: %0'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140153798425751668)
,p_name=>'APEX.IG.SEARCH.ORACLE_TEXT'
,p_message_language=>'it'
,p_message_text=>'Cerca: Testo completo'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140101462068751652)
,p_name=>'APEX.IG.SEARCH_FOR.X'
,p_message_language=>'it'
,p_message_text=>'Cerca ''%0'''
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140143805271751665)
,p_name=>'APEX.IG.SELECT'
,p_message_language=>'it'
,p_message_text=>'- Seleziona -'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140083946678751647)
,p_name=>'APEX.IG.SELECTION'
,p_message_language=>'it'
,p_message_text=>'Selezione'
,p_is_js_message=>true
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140137081588751663)
,p_name=>'APEX.IG.SELECT_1_ROW_IN_MASTER'
,p_message_language=>'it'
,p_message_text=>'Selezionare 1 riga nell''area padre'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140074121441751644)
,p_name=>'APEX.IG.SELECT_COLUMNS_TO_SEARCH'
,p_message_language=>'it'
,p_message_text=>'Selezionare le colonne in cui cercare'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140166709859751672)
,p_name=>'APEX.IG.SEL_ACTIONS'
,p_message_language=>'it'
,p_message_text=>'Azioni selezione'
,p_is_js_message=>true
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140084190545751647)
,p_name=>'APEX.IG.SEL_MODE_CELL'
,p_message_language=>'it'
,p_message_text=>'Selezione celle'
,p_is_js_message=>true
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140084095788751647)
,p_name=>'APEX.IG.SEL_MODE_ROW'
,p_message_language=>'it'
,p_message_text=>'Selezione righe'
,p_is_js_message=>true
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140155015380751668)
,p_name=>'APEX.IG.SEND_AS_EMAIL'
,p_message_language=>'it'
,p_message_text=>'Invia come posta elettronica'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140147644041751666)
,p_name=>'APEX.IG.SERIES_COLUMN'
,p_message_language=>'it'
,p_message_text=>'Serie'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140071841012751643)
,p_name=>'APEX.IG.SHOW'
,p_message_language=>'it'
,p_message_text=>'Mostra'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140127019432751660)
,p_name=>'APEX.IG.SHOW_OVERALL_VALUE'
,p_message_language=>'it'
,p_message_text=>'Mostra valore globale'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140111955675751655)
,p_name=>'APEX.IG.SINGLE_ROW_VIEW'
,p_message_language=>'it'
,p_message_text=>'Vista a riga singola'
,p_is_js_message=>true
,p_version_scn=>2705056
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140110263312751655)
,p_name=>'APEX.IG.SORT'
,p_message_language=>'it'
,p_message_text=>'Ordina'
,p_is_js_message=>true
,p_version_scn=>2705055
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140147769078751666)
,p_name=>'APEX.IG.SORT_BY'
,p_message_language=>'it'
,p_message_text=>'Ordina per'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140167171176751672)
,p_name=>'APEX.IG.SORT_ONLY_ONE_PER_COLUMN'
,p_message_language=>'it'
,p_message_text=>unistr('\00C8 possibile definire solo un ordinamento per colonna.')
,p_is_js_message=>true
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140166949434751672)
,p_name=>'APEX.IG.SRV_CHANGE_MENU'
,p_message_language=>'it'
,p_message_text=>'Modifica'
,p_is_js_message=>true
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140148792332751666)
,p_name=>'APEX.IG.STACK'
,p_message_language=>'it'
,p_message_text=>'In pila'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140104290610751653)
,p_name=>'APEX.IG.STARTS_WITH'
,p_message_language=>'it'
,p_message_text=>'inizia con'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140147303098751666)
,p_name=>'APEX.IG.STOCK'
,p_message_language=>'it'
,p_message_text=>'Borsistico'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140066663833751642)
,p_name=>'APEX.IG.STRETCH_COLUMNS'
,p_message_language=>'it'
,p_message_text=>'Estendi larghezza colonne'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140110646692751655)
,p_name=>'APEX.IG.SUBSCRIPTION'
,p_message_language=>'it'
,p_message_text=>'Sottoscrizione'
,p_is_js_message=>true
,p_version_scn=>2705055
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140128613352751660)
,p_name=>'APEX.IG.SUM'
,p_message_language=>'it'
,p_message_text=>'Somma'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140168411084751672)
,p_name=>'APEX.IG.SUMMARY'
,p_message_language=>'it'
,p_message_text=>'Griglia interattiva. Report: %0, vista: %1.'
,p_is_js_message=>true
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140162573038751670)
,p_name=>'APEX.IG.SUM_OVERALL'
,p_message_language=>'it'
,p_message_text=>'Somma globale'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140145592499751665)
,p_name=>'APEX.IG.TARGET_COLUMN'
,p_message_language=>'it'
,p_message_text=>'Destinazione'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140151950930751667)
,p_name=>'APEX.IG.TEXT_COLOR'
,p_message_language=>'it'
,p_message_text=>'Colore testo'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140076966997751645)
,p_name=>'APEX.IG.TOGGLE'
,p_message_language=>'it'
,p_message_text=>'Attiva/disattiva'
,p_is_js_message=>true
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139959052062751610)
,p_name=>'APEX.IG.TOOLBAR'
,p_message_language=>'it'
,p_message_text=>'Griglia'
,p_is_js_message=>true
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140126984182751660)
,p_name=>'APEX.IG.TOOLTIP'
,p_message_language=>'it'
,p_message_text=>'Descrizione comando'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140107443366751654)
,p_name=>'APEX.IG.TYPE'
,p_message_language=>'it'
,p_message_text=>'Tipo'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140111892041751655)
,p_name=>'APEX.IG.UNFREEZE'
,p_message_language=>'it'
,p_message_text=>'Sblocca'
,p_is_js_message=>true
,p_version_scn=>2705056
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140108994652751654)
,p_name=>'APEX.IG.UNIT'
,p_message_language=>'it'
,p_message_text=>unistr('Unit\00E0')
,p_is_js_message=>true
,p_version_scn=>2705055
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140154871470751668)
,p_name=>'APEX.IG.UNSAVED_CHANGES_CONTINUE_CONFIRM'
,p_message_language=>'it'
,p_message_text=>'Esistono modifiche non salvate. Continuare?'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140108888780751654)
,p_name=>'APEX.IG.VALUE'
,p_message_language=>'it'
,p_message_text=>'Valore'
,p_is_js_message=>true
,p_version_scn=>2705055
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140144601609751665)
,p_name=>'APEX.IG.VALUE_COLUMN'
,p_message_language=>'it'
,p_message_text=>'Valore'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140149524977751666)
,p_name=>'APEX.IG.VALUE_REQUIRED'
,p_message_language=>'it'
,p_message_text=>unistr('\00C8 richiesto un valore.')
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140134748520751662)
,p_name=>'APEX.IG.VALUE_TIMESTAMP_TZ'
,p_message_language=>'it'
,p_message_text=>'Valore (impossibile modificare il fuso orario)'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140153407428751668)
,p_name=>'APEX.IG.VARCHAR2'
,p_message_language=>'it'
,p_message_text=>'Testo'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140145924333751665)
,p_name=>'APEX.IG.VERTICAL'
,p_message_language=>'it'
,p_message_text=>'Verticale'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140106985619751654)
,p_name=>'APEX.IG.VIEW'
,p_message_language=>'it'
,p_message_text=>'Visualizza'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140042067276751635)
,p_name=>'APEX.IG.VIEW_MODE_DESCRIPTION'
,p_message_language=>'it'
,p_message_text=>unistr('Griglia in modalit\00E0 di visualizzazione. Premere per modificare')
,p_is_js_message=>true
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140143939918751665)
,p_name=>'APEX.IG.VISIBLE'
,p_message_language=>'it'
,p_message_text=>'Visualizzato'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140145451480751665)
,p_name=>'APEX.IG.VOLUME_COLUMN'
,p_message_language=>'it'
,p_message_text=>'Volume'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140104819966751653)
,p_name=>'APEX.IG.WEEKS'
,p_message_language=>'it'
,p_message_text=>'settimane'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140144011326751665)
,p_name=>'APEX.IG.WIDTH'
,p_message_language=>'it'
,p_message_text=>'Larghezza colonna minima (pixel)'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140096084272751651)
,p_name=>'APEX.IG.X.BETWEEN.Y.AND.Z'
,p_message_language=>'it'
,p_message_text=>'%0 tra %1 e %2'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140095705932751650)
,p_name=>'APEX.IG.X.CONTAINS.Y'
,p_message_language=>'it'
,p_message_text=>'%0 contiene %1'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140095860929751650)
,p_name=>'APEX.IG.X.DOES_NOT_CONTAIN.Y'
,p_message_language=>'it'
,p_message_text=>'%0 non contiene %1'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140071219930751643)
,p_name=>'APEX.IG.X.DOES_NOT_START_WITH.Y'
,p_message_language=>'it'
,p_message_text=>'%0 non inizia con %1'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140094521080751650)
,p_name=>'APEX.IG.X.EQUALS.Y'
,p_message_language=>'it'
,p_message_text=>'%0 uguale a %1'
,p_is_js_message=>true
,p_version_scn=>2705053
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140094713558751650)
,p_name=>'APEX.IG.X.GREATER_THAN.Y'
,p_message_language=>'it'
,p_message_text=>'%0 maggiore di %1'
,p_is_js_message=>true
,p_version_scn=>2705053
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140094887999751650)
,p_name=>'APEX.IG.X.GREATER_THAN_OR_EQUALS.Y'
,p_message_language=>'it'
,p_message_text=>'%0 maggiore o uguale a %1'
,p_is_js_message=>true
,p_version_scn=>2705053
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140095516938751650)
,p_name=>'APEX.IG.X.IN.Y'
,p_message_language=>'it'
,p_message_text=>'%0 in %1'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140096751258751651)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.DAYS'
,p_message_language=>'it'
,p_message_text=>'%0 negli ultimi %1 giorni'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140096558131751651)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.HOURS'
,p_message_language=>'it'
,p_message_text=>'%0 nelle ultime %1 ore'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140096355805751651)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.MINUTES'
,p_message_language=>'it'
,p_message_text=>'%0 negli ultimi %1 minuti'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140097179479751651)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.MONTHS'
,p_message_language=>'it'
,p_message_text=>'%0 negli ultimi %1 mesi'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140096975589751651)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.WEEKS'
,p_message_language=>'it'
,p_message_text=>'%0 nelle ultime %1 settimane'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140097371336751651)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.YEARS'
,p_message_language=>'it'
,p_message_text=>'%0 negli ultimi %1 anni'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140096684779751651)
,p_name=>'APEX.IG.X.IN_THE_LAST_DAY'
,p_message_language=>'it'
,p_message_text=>'%0 nell''ultimo giorno'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140096452313751651)
,p_name=>'APEX.IG.X.IN_THE_LAST_HOUR'
,p_message_language=>'it'
,p_message_text=>'%0 nell''ultima ora'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140096255323751651)
,p_name=>'APEX.IG.X.IN_THE_LAST_MINUTE'
,p_message_language=>'it'
,p_message_text=>'%0 nell''ultimo minuto'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140097026613751651)
,p_name=>'APEX.IG.X.IN_THE_LAST_MONTH'
,p_message_language=>'it'
,p_message_text=>'%0 nell''ultimo mese'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140096813771751651)
,p_name=>'APEX.IG.X.IN_THE_LAST_WEEK'
,p_message_language=>'it'
,p_message_text=>'%0 nell''ultima settimana'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140097282170751651)
,p_name=>'APEX.IG.X.IN_THE_LAST_YEAR'
,p_message_language=>'it'
,p_message_text=>'%0 nell''ultimo anno'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140099102517751651)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.DAYS'
,p_message_language=>'it'
,p_message_text=>'%0 nei %1 giorni successivi'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140098929151751651)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.HOURS'
,p_message_language=>'it'
,p_message_text=>'%0 nelle %1 ore successive'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140098744037751651)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.MINUTES'
,p_message_language=>'it'
,p_message_text=>'%0 nei %1 minuti successivi'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140099551884751652)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.MONTHS'
,p_message_language=>'it'
,p_message_text=>'%0 nei %1 mesi successivi'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140099317237751652)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.WEEKS'
,p_message_language=>'it'
,p_message_text=>'%0 nelle %1 settimane successive'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140099757215751652)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.YEARS'
,p_message_language=>'it'
,p_message_text=>'%0 nei %1 anni successivi'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140099031023751651)
,p_name=>'APEX.IG.X.IN_THE_NEXT_DAY'
,p_message_language=>'it'
,p_message_text=>'%0 nel giorno successivo'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140098808767751651)
,p_name=>'APEX.IG.X.IN_THE_NEXT_HOUR'
,p_message_language=>'it'
,p_message_text=>'%0 nell''ora successiva'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140098625551751651)
,p_name=>'APEX.IG.X.IN_THE_NEXT_MINUTE'
,p_message_language=>'it'
,p_message_text=>'%0 nel minuto successivo'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140099475220751652)
,p_name=>'APEX.IG.X.IN_THE_NEXT_MONTH'
,p_message_language=>'it'
,p_message_text=>'%0 nel mese successivo'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140099248285751651)
,p_name=>'APEX.IG.X.IN_THE_NEXT_WEEK'
,p_message_language=>'it'
,p_message_text=>'%0 nella settimana successiva'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140099605689751652)
,p_name=>'APEX.IG.X.IN_THE_NEXT_YEAR'
,p_message_language=>'it'
,p_message_text=>'%0 nell''anno successivo'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140095236088751650)
,p_name=>'APEX.IG.X.IS_NOT_NULL'
,p_message_language=>'it'
,p_message_text=>unistr('%0 non \00E8 vuoto')
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140095164822751650)
,p_name=>'APEX.IG.X.IS_NULL'
,p_message_language=>'it'
,p_message_text=>unistr('%0 \00E8 vuoto')
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140094955653751650)
,p_name=>'APEX.IG.X.LESS_THAN.Y'
,p_message_language=>'it'
,p_message_text=>'%0 minore di %1'
,p_is_js_message=>true
,p_version_scn=>2705053
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140095064285751650)
,p_name=>'APEX.IG.X.LESS_THAN_OR_EQUALS.Y'
,p_message_language=>'it'
,p_message_text=>'%0 minore o uguale a %1'
,p_is_js_message=>true
,p_version_scn=>2705053
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140095359910751650)
,p_name=>'APEX.IG.X.LIKE.Y'
,p_message_language=>'it'
,p_message_text=>'%0 simile a %1'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140095951030751651)
,p_name=>'APEX.IG.X.MATCHES_REGULAR_EXPRESSION.Y'
,p_message_language=>'it'
,p_message_text=>'%0 corrisponde all''espressione regolare %1'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140101808642751652)
,p_name=>'APEX.IG.X.MINUTES_AGO'
,p_message_language=>'it'
,p_message_text=>'%0 minuti fa'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140096121912751651)
,p_name=>'APEX.IG.X.NOT_BETWEEN.Y.AND.Z'
,p_message_language=>'it'
,p_message_text=>'%0 non compreso tra %1 e %2'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140094695283751650)
,p_name=>'APEX.IG.X.NOT_EQUALS.Y'
,p_message_language=>'it'
,p_message_text=>'%0 diverso da %1'
,p_is_js_message=>true
,p_version_scn=>2705053
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140095648999751650)
,p_name=>'APEX.IG.X.NOT_IN.Y'
,p_message_language=>'it'
,p_message_text=>'%0 non in %1'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140097929245751651)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.DAYS'
,p_message_language=>'it'
,p_message_text=>'%0 non negli ultimi %1 giorni'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140097738647751651)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.HOURS'
,p_message_language=>'it'
,p_message_text=>'%0 non nelle ultime %1 ore'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140097575976751651)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.MINUTES'
,p_message_language=>'it'
,p_message_text=>'%0 non negli ultimi %1 minuti'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140098347617751651)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.MONTHS'
,p_message_language=>'it'
,p_message_text=>'%0 non negli ultimi %1 mesi'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140098177569751651)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.WEEKS'
,p_message_language=>'it'
,p_message_text=>'%0 non nelle ultime %1 settimane'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140098562177751651)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.YEARS'
,p_message_language=>'it'
,p_message_text=>'%0 non negli ultimi %1 anni'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140097873297751651)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_DAY'
,p_message_language=>'it'
,p_message_text=>'%0 non nell''ultimo giorno'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140097621829751651)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_HOUR'
,p_message_language=>'it'
,p_message_text=>'%0 non nell''ultima ora'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140097485606751651)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_MINUTE'
,p_message_language=>'it'
,p_message_text=>'%0 non nell''ultimo minuto'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140098299138751651)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_MONTH'
,p_message_language=>'it'
,p_message_text=>'%0 non nell''ultimo mese'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140098064547751651)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_WEEK'
,p_message_language=>'it'
,p_message_text=>'%0 non nell''ultima settimana'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140098441509751651)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_YEAR'
,p_message_language=>'it'
,p_message_text=>'%0 non nell''ultimo anno'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140100370313751652)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.DAYS'
,p_message_language=>'it'
,p_message_text=>'%0 non nei %1 giorni successivi'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140100184713751652)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.HOURS'
,p_message_language=>'it'
,p_message_text=>'%0 non nelle %1 ore successive'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140099915797751652)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.MINUTES'
,p_message_language=>'it'
,p_message_text=>'%0 non nei %1 minuti successivi'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140100781787751652)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.MONTHS'
,p_message_language=>'it'
,p_message_text=>'%0 non nei %1 mesi successivi '
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140100508751751652)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.WEEKS'
,p_message_language=>'it'
,p_message_text=>'%0 non nelle %1 settimane successive'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140100982277751652)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.YEARS'
,p_message_language=>'it'
,p_message_text=>'%0 non nei %1 anni successivi'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140100276959751652)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_DAY'
,p_message_language=>'it'
,p_message_text=>'%0 non nel giorno successivo'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140100016739751652)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_HOUR'
,p_message_language=>'it'
,p_message_text=>'%0 non nell''ora successiva'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140099844802751652)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_MINUTE'
,p_message_language=>'it'
,p_message_text=>'%0 non nel minuto successivo'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140100633249751652)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_MONTH'
,p_message_language=>'it'
,p_message_text=>'%0 non nel mese successivo'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140100467735751652)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_WEEK'
,p_message_language=>'it'
,p_message_text=>'%0 non nella settimana successiva'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140100815060751652)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_YEAR'
,p_message_language=>'it'
,p_message_text=>'%0 non nell''anno successivo'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140095437264751650)
,p_name=>'APEX.IG.X.NOT_LIKE.Y'
,p_message_language=>'it'
,p_message_text=>'%0 non simile a %1'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140102336985751652)
,p_name=>'APEX.IG.X.STARTS_WITH.Y'
,p_message_language=>'it'
,p_message_text=>'%0 inizia con %1'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140144748723751665)
,p_name=>'APEX.IG.X_COLUMN'
,p_message_language=>'it'
,p_message_text=>'X'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140105045614751653)
,p_name=>'APEX.IG.YEARS'
,p_message_language=>'it'
,p_message_text=>'anni'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140144802810751665)
,p_name=>'APEX.IG.Y_COLUMN'
,p_message_language=>'it'
,p_message_text=>'Y'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140144952431751665)
,p_name=>'APEX.IG.Z_COLUMN'
,p_message_language=>'it'
,p_message_text=>'Z'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140153961272751668)
,p_name=>'APEX.IG_FORMAT_SAMPLE_1'
,p_message_language=>'it'
,p_message_text=>unistr('Luned\00EC 12 gennaio 2016')
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140154093502751668)
,p_name=>'APEX.IG_FORMAT_SAMPLE_2'
,p_message_language=>'it'
,p_message_text=>'Gennaio'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140154113883751668)
,p_name=>'APEX.IG_FORMAT_SAMPLE_3'
,p_message_language=>'it'
,p_message_text=>'16 ore fa'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140154256312751668)
,p_name=>'APEX.IG_FORMAT_SAMPLE_4'
,p_message_language=>'it'
,p_message_text=>'tra 16 ore'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139972247086751614)
,p_name=>'APEX.ITEM.CROPPER.APPLY'
,p_message_language=>'it'
,p_message_text=>'Applica'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139964275289751612)
,p_name=>'APEX.ITEM.CROPPER.HELP.TEXT'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Trascinare l''immagine e utilizzare il dispositivo di scorrimento dello zoom per riposizionarla nel riquadro.</p>',
'',
unistr('<p>Quando lo strumento di ritaglio dell''immagine \00E8 attivo, sono disponibili i collegamenti da tastiera riportati di seguito.</p>'),
'<ul>',
'    <li>Freccia sinistra: sposta l''immagine a sinistra*</li>',
'    <li>Freccia SU: sposta l''immagine in alto*</li>',
'    <li>Freccia destra: sposta l''immagine a destra*</li>',
unistr('    <li>Freccia GI\00D9: sposta l''immagine in basso*</li>'),
'    <li>I: ingrandisce</li>',
'    <li>O: riduce</li>',
'    <li>L: ruota a sinistra</li>',
'    <li>R: ruota a destra</li>',
'</ul>',
'',
unistr('<p class="margin-top-md"><em>*Tenere premuto Maiusc per eseguire lo spostamento pi\00F9 rapidamente</em></p>')))
,p_is_js_message=>true
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139964477739751612)
,p_name=>'APEX.ITEM.CROPPER.HELP.TITLE'
,p_message_language=>'it'
,p_message_text=>'Guida per il ritaglio dell''immagine'
,p_is_js_message=>true
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139972390217751614)
,p_name=>'APEX.ITEM.CROPPER.RESET'
,p_message_language=>'it'
,p_message_text=>'Reimposta'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139964735143751612)
,p_name=>'APEX.ITEM.CROPPER.TITLE'
,p_message_language=>'it'
,p_message_text=>'Ritaglia immagine'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139972486401751614)
,p_name=>'APEX.ITEM.CROPPER.ZOOM_SLIDER_LABEL'
,p_message_language=>'it'
,p_message_text=>'Spostare il dispositivo di scorrimento per regolare il livello di zoom'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140002020054751623)
,p_name=>'APEX.ITEM.FILE.ACCEPTED_TYPES'
,p_message_language=>'it'
,p_message_text=>'Tipo di file non valido. Tipi di file supportati: %0.'
,p_is_js_message=>true
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140136447893751663)
,p_name=>'APEX.ITEM.FILE.BROWSE'
,p_message_language=>'it'
,p_message_text=>'Sfoglia'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140136144917751662)
,p_name=>'APEX.ITEM.FILE.CHOOSE_FILE'
,p_message_language=>'it'
,p_message_text=>'Scegli file'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140136217196751663)
,p_name=>'APEX.ITEM.FILE.CHOOSE_FILES'
,p_message_language=>'it'
,p_message_text=>'Scegli file'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140001846724751623)
,p_name=>'APEX.ITEM.FILE.DROP_FILE'
,p_message_language=>'it'
,p_message_text=>'Trascinamento della selezione'
,p_is_js_message=>true
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140002290535751623)
,p_name=>'APEX.ITEM.FILE.DROP_FILES'
,p_message_language=>'it'
,p_message_text=>'Trascinamento file selezionati'
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140003691482751623)
,p_name=>'APEX.ITEM.FILE.DROP_OR_CHOOSE_FILE'
,p_message_language=>'it'
,p_message_text=>'Selezionare un file o rilasciarne uno qui.'
,p_is_js_message=>true
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140003763248751623)
,p_name=>'APEX.ITEM.FILE.DROP_OR_CHOOSE_FILES'
,p_message_language=>'it'
,p_message_text=>'Selezionare o rilasciare i file qui.'
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140003873585751623)
,p_name=>'APEX.ITEM.FILE.DROP_OR_SELECT_FILE'
,p_message_language=>'it'
,p_message_text=>'Selezionare un file o rilasciarne uno qui.'
,p_is_js_message=>true
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140003970135751623)
,p_name=>'APEX.ITEM.FILE.DROP_OR_SELECT_FILES'
,p_message_language=>'it'
,p_message_text=>'Selezionare o rilasciare i file qui.'
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140002145512751623)
,p_name=>'APEX.ITEM.FILE.FILES_WITH_COUNT'
,p_message_language=>'it'
,p_message_text=>'%0 file'
,p_is_js_message=>true
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140001967857751623)
,p_name=>'APEX.ITEM.FILE.MAX_FILE_SIZE'
,p_message_language=>'it'
,p_message_text=>unistr('File troppo grande. La dimensione file massima \00E8 di %0.')
,p_is_js_message=>true
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139982483805751617)
,p_name=>'APEX.ITEM.FILE.MULTIPLE_FILES_NOT_SUPPORTED'
,p_message_language=>'it'
,p_message_text=>unistr('Pi\00F9 caricamenti di file non sono supportati.')
,p_is_js_message=>true
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139965373555751612)
,p_name=>'APEX.ITEM.FILE.REMOVE'
,p_message_language=>'it'
,p_message_text=>'Rimuovi'
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139970827818751614)
,p_name=>'APEX.ITEM.GEOCODE.ADDRESS_REQUIRED'
,p_message_language=>'it'
,p_message_text=>'Indirizzo obbligatorio.'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139969714031751613)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_CITY'
,p_message_language=>'it'
,p_message_text=>unistr('Citt\00E0')
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139970174261751613)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_COUNTRY'
,p_message_language=>'it'
,p_message_text=>'Codice paese'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139969898719751613)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_HOUSENUMBER'
,p_message_language=>'it'
,p_message_text=>'Numero civico'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139970793668751614)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_LATITUDE'
,p_message_language=>'it'
,p_message_text=>'Latitudine'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139970683779751614)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_LONGITUDE'
,p_message_language=>'it'
,p_message_text=>'Longitudine'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139970518072751613)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_MAPLINK'
,p_message_language=>'it'
,p_message_text=>'Mostra su mappa'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139970266429751613)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_MATCHSCORE'
,p_message_language=>'it'
,p_message_text=>'Punteggio'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139969943112751613)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_POSTALCODE'
,p_message_language=>'it'
,p_message_text=>'Codice postale'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139970082356751613)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_STATE'
,p_message_language=>'it'
,p_message_text=>'Stato'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139969688596751613)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_STREET'
,p_message_language=>'it'
,p_message_text=>'Via'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139969557479751613)
,p_name=>'APEX.ITEM.GEOCODE.DIALOG_TITLE'
,p_message_language=>'it'
,p_message_text=>'Risultati della codifica geografica'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140001013614751623)
,p_name=>'APEX.ITEM.GEOCODE.GEOCODING_DONE'
,p_message_language=>'it'
,p_message_text=>'Con codifica geografica'
,p_is_js_message=>true
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140001121822751623)
,p_name=>'APEX.ITEM.GEOCODE.GEOCODING_OPEN'
,p_message_language=>'it'
,p_message_text=>'Senza codifica geografica'
,p_is_js_message=>true
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139970440036751613)
,p_name=>'APEX.ITEM.GEOCODE.MAP_DIALOG_TITLE'
,p_message_language=>'it'
,p_message_text=>'Mappa'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139970316047751613)
,p_name=>'APEX.ITEM.GEOCODE.NO_DATA_FOUND'
,p_message_language=>'it'
,p_message_text=>'Nessun indirizzo trovato.'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139970910496751614)
,p_name=>'APEX.ITEM.GEOCODE.REQUIRED'
,p_message_language=>'it'
,p_message_text=>'%0 obbligatorio.'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140077154975751645)
,p_name=>'APEX.ITEM.GEOCODE.REQUIRED_MULTIPLE'
,p_message_language=>'it'
,p_message_text=>unistr('%0 o %1 \00E8 obbligatorio.')
,p_is_js_message=>true
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140166600280751671)
,p_name=>'APEX.ITEM.HELP_TEXT'
,p_message_language=>'it'
,p_message_text=>'Visualizza testo Guida per %0.'
,p_is_js_message=>true
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139972603747751614)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.CHOOSE_FILE'
,p_message_language=>'it'
,p_message_text=>'Scegli immagine'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139972753862751614)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.CHOOSE_FILES'
,p_message_language=>'it'
,p_message_text=>'Scegli immagini'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139972512519751614)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DOWNLOAD_LINK_TEXT'
,p_message_language=>'it'
,p_message_text=>'Scarica'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139972839949751614)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_FILE'
,p_message_language=>'it'
,p_message_text=>'Trascinamento della selezione'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139972960342751614)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_FILES'
,p_message_language=>'it'
,p_message_text=>'Trascina immagini'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139973082069751614)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_CHOOSE_FILE'
,p_message_language=>'it'
,p_message_text=>'Selezionare un''immagine o rilasciarne una qui.'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139973165694751614)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_CHOOSE_FILES'
,p_message_language=>'it'
,p_message_text=>'Selezionare o rilasciare le immagini qui.'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139973275794751614)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_SELECT_FILE'
,p_message_language=>'it'
,p_message_text=>'Selezionare un''immagine o rilasciarne una qui.'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139973331922751614)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_SELECT_FILES'
,p_message_language=>'it'
,p_message_text=>'Selezionare o rilasciare le immagini qui.'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140058042180751639)
,p_name=>'APEX.ITEM_TYPE.CHECKBOX.CHECKED'
,p_message_language=>'it'
,p_message_text=>'Selezionato'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140058146612751639)
,p_name=>'APEX.ITEM_TYPE.CHECKBOX.UNCHECKED'
,p_message_language=>'it'
,p_message_text=>'Deselezionato'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140085685876751647)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.EMPTY_READONLY_COMBOBOX'
,p_message_language=>'it'
,p_message_text=>'Casella combinata di sola lettura vuota'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140083434196751647)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.EMPTY_READONLY_LISTBOX'
,p_message_language=>'it'
,p_message_text=>'Casella di riepilogo di sola lettura vuota'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140083248348751647)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.READONLY_COMBOBOX'
,p_message_language=>'it'
,p_message_text=>'Casella combinata di sola lettura'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140083399268751647)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.READONLY_LISTBOX'
,p_message_language=>'it'
,p_message_text=>'Casella di riepilogo di sola lettura'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139999038791751622)
,p_name=>'APEX.ITEM_TYPE.SLIDER.VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'it'
,p_message_text=>'#LABEL# non rientra nell''intervallo valido compreso tra %0 e %1.'
,p_version_scn=>2705035
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139999177009751622)
,p_name=>'APEX.ITEM_TYPE.SLIDER.VALUE_NOT_MULTIPLE_OF_STEP'
,p_message_language=>'it'
,p_message_text=>unistr('#LABEL# non \00E8 multiplo di %0.')
,p_version_scn=>2705035
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140086450451751648)
,p_name=>'APEX.ITEM_TYPE.SWITCH.READONLY_SWITCH'
,p_message_language=>'it'
,p_message_text=>'Parametro di sola lettura'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140027017510751630)
,p_name=>'APEX.ITEM_TYPE.TEXT.READONLY_WITH_LINK'
,p_message_language=>'it'
,p_message_text=>'Modifica di sola lettura con un collegamento'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139998682349751622)
,p_name=>'APEX.ITEM_TYPE.YES_NO.INVALID_VALUE'
,p_message_language=>'it'
,p_message_text=>'#LABEL# deve corrispondere ai valori %0 e %1.'
,p_version_scn=>2705035
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139998836537751622)
,p_name=>'APEX.ITEM_TYPE.YES_NO.NO_LABEL'
,p_message_language=>'it'
,p_message_text=>'No'
,p_version_scn=>2705035
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140085175547751647)
,p_name=>'APEX.ITEM_TYPE.YES_NO.OFF_LABEL'
,p_message_language=>'it'
,p_message_text=>'Non attivo'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140085266140751647)
,p_name=>'APEX.ITEM_TYPE.YES_NO.ON_LABEL'
,p_message_language=>'it'
,p_message_text=>'Attivo'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139998785328751622)
,p_name=>'APEX.ITEM_TYPE.YES_NO.YES_LABEL'
,p_message_language=>'it'
,p_message_text=>unistr('S\00EC')
,p_version_scn=>2705035
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140006633751751624)
,p_name=>'APEX.LANGUAGE_SELECTOR'
,p_message_language=>'it'
,p_message_text=>'Selettore lingue'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139943075727751605)
,p_name=>'APEX.LIST_MANAGER.ADD_ENTRY'
,p_message_language=>'it'
,p_message_text=>'Aggiungi voce'
,p_version_scn=>2705023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140119829689751658)
,p_name=>'APEX.LIST_MANAGER.BUTTON_ADD'
,p_message_language=>'it'
,p_message_text=>'Aggiungi'
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140119943270751658)
,p_name=>'APEX.LIST_MANAGER.BUTTON_REMOVE'
,p_message_language=>'it'
,p_message_text=>'Rimuovi'
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139943189893751605)
,p_name=>'APEX.LIST_MANAGER.SELECTED_ENTRY'
,p_message_language=>'it'
,p_message_text=>'Voci selezionate'
,p_version_scn=>2705023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140123683768751659)
,p_name=>'APEX.LTO.ADVANCED'
,p_message_language=>'it'
,p_message_text=>'Avanzate'
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140123916997751659)
,p_name=>'APEX.LTO.CANCEL'
,p_message_language=>'it'
,p_message_text=>'Annulla'
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140123787898751659)
,p_name=>'APEX.LTO.COMMON'
,p_message_language=>'it'
,p_message_text=>'Comune'
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140124036790751659)
,p_name=>'APEX.LTO.LIVE_TEMPLATE_OPTIONS'
,p_message_language=>'it'
,p_message_text=>'Opzioni modello attive'
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140124659529751659)
,p_name=>'APEX.LTO.NOT_APPLICABLE'
,p_message_language=>'it'
,p_message_text=>unistr('Opzioni modello non disponibili: questo componente non \00E8 visualizzato nella pagina.')
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140123530718751659)
,p_name=>'APEX.LTO.NO_OPTIONS_FOUND'
,p_message_language=>'it'
,p_message_text=>'Nessuna opzione modello trovata.'
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140123832057751659)
,p_name=>'APEX.LTO.SAVE'
,p_message_language=>'it'
,p_message_text=>'Salva'
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139977659098751616)
,p_name=>'APEX.MAPS.CLEAR_CIRCLE'
,p_message_language=>'it'
,p_message_text=>'Cancella cerchio'
,p_is_js_message=>true
,p_version_scn=>2705031
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139980003744751616)
,p_name=>'APEX.MAPS.CUSTOM_STYLES_INVALID_JSON'
,p_message_language=>'it'
,p_message_text=>'Gli stili personalizzati non sono JSON validi.'
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139977965330751616)
,p_name=>'APEX.MAPS.DISTANCE_TOOL'
,p_message_language=>'it'
,p_message_text=>'Strumento Distanza'
,p_is_js_message=>true
,p_version_scn=>2705031
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139977758528751616)
,p_name=>'APEX.MAPS.DRAW_CIRCLE'
,p_message_language=>'it'
,p_message_text=>'Disegna cerchio'
,p_is_js_message=>true
,p_version_scn=>2705031
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139957509451751610)
,p_name=>'APEX.MAPS.FIND_MY_LOCATION'
,p_message_language=>'it'
,p_message_text=>'Posizione corrente'
,p_is_js_message=>true
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139963986695751612)
,p_name=>'APEX.MAPS.INIT_POINT_COORDINATES_INVALID'
,p_message_language=>'it'
,p_message_text=>'Le coordinate della posizione iniziale non sono valide.'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139952912884751608)
,p_name=>'APEX.MAPS.INIT_POINT_GEOMETRY_REQUIRED'
,p_message_language=>'it'
,p_message_text=>'La posizione iniziale deve essere una geometria di punti.'
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139961526924751611)
,p_name=>'APEX.MAPS.KM'
,p_message_language=>'it'
,p_message_text=>'km'
,p_is_js_message=>true
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139956713523751609)
,p_name=>'APEX.MAPS.LAYER'
,p_message_language=>'it'
,p_message_text=>'Layer'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140127198643751660)
,p_name=>'APEX.MAPS.LAYER_NAME'
,p_message_language=>'it'
,p_message_text=>'Layer: %0'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139975950557751615)
,p_name=>'APEX.MAPS.MAP'
,p_message_language=>'it'
,p_message_text=>'Mappa'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139945652124751606)
,p_name=>'APEX.MAPS.MAP_MESSAGES'
,p_message_language=>'it'
,p_message_text=>'Messaggi'
,p_is_js_message=>true
,p_version_scn=>2705023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139961747283751611)
,p_name=>'APEX.MAPS.MILES'
,p_message_language=>'it'
,p_message_text=>'miglia'
,p_is_js_message=>true
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140126149909751660)
,p_name=>'APEX.MAPS.MORE_DATA_FOUND'
,p_message_language=>'it'
,p_message_text=>unistr('I dati contengono pi\00F9 di %0 righe. Questo valore supera il limite massimo consentito.')
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139956089599751609)
,p_name=>'APEX.MAPS.ORACLE_MAP_COPYRIGHT'
,p_message_language=>'it'
,p_message_text=>unistr('\00A9 2022 Oracle Corporation &nbsp;&nbsp; <a rel="noopener noreferrer" target="_blank" href="https://elocation.oracle.com/elocation/legal.html">Termini</a> &nbsp;&nbsp; Dati mappa &copy; 2021 QUI')
,p_is_js_message=>true
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139952621167751608)
,p_name=>'APEX.MAPS.ORACLE_SDO_GEOMETRY_NOT_AVAILABLE'
,p_message_language=>'it'
,p_message_text=>unistr('Il tipo di dati SDO_GEOMETRY non \00E8 disponibile in questo database.')
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139956187152751609)
,p_name=>'APEX.MAPS.OSM_MAP_COPYRIGHT'
,p_message_language=>'it'
,p_message_text=>'<a rel="noopener noreferrer" target="_blank" href="http://openmaptiles.org"> &copy; OpenMapTiles </a> &nbsp; <a rel="noopener noreferrer" target="_blank" href="https://www.openstreetmap.org/copyright"> &copy; Redattori di OpenStreetMap </a>'
,p_is_js_message=>true
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139980758148751616)
,p_name=>'APEX.MAPS.OSM_VECTOR_MAP_COPYRIGHT'
,p_message_language=>'it'
,p_message_text=>'<a rel="noopener noreferrer" target="blank" href="https://www.maptiler.com/copyright"> &copy; MapTiler</a> &nbsp; <a rel="noopener noreferrer" target="_blank" href="https://www.openstreetmap.org/copyright"> &copy; Redattori di OpenStreetMap </a>'
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139956973532751609)
,p_name=>'APEX.MAPS.POINTS'
,p_message_language=>'it'
,p_message_text=>'Punti'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140127274515751660)
,p_name=>'APEX.MAPS.POINTS_COUNT'
,p_message_language=>'it'
,p_message_text=>'%0 punti'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139977839467751616)
,p_name=>'APEX.MAPS.RECTANGLE_ZOOM'
,p_message_language=>'it'
,p_message_text=>'Zoom rettangolo'
,p_is_js_message=>true
,p_version_scn=>2705031
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139977553448751616)
,p_name=>'APEX.MAPS.REMOVE_MESSAGE'
,p_message_language=>'it'
,p_message_text=>'Rimuovi'
,p_is_js_message=>true
,p_version_scn=>2705031
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139957340514751610)
,p_name=>'APEX.MAPS.RESET_BEARING_TO_NORTH'
,p_message_language=>'it'
,p_message_text=>'Ripristina orientamento nord'
,p_is_js_message=>true
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140072144301751643)
,p_name=>'APEX.MAPS.TOGGLE_2D_MODE'
,p_message_language=>'it'
,p_message_text=>unistr('Attiva modalit\00E0 2D')
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140072238872751644)
,p_name=>'APEX.MAPS.TOGGLE_3D_MODE'
,p_message_language=>'it'
,p_message_text=>unistr('Attiva modalit\00E0 3D')
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139977468091751616)
,p_name=>'APEX.MAPS.TOGGLE_COPYRIGHT'
,p_message_language=>'it'
,p_message_text=>'Attiva/disattiva informativa sul copyright'
,p_is_js_message=>true
,p_version_scn=>2705031
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139978006219751616)
,p_name=>'APEX.MAPS.TOTAL_DISTANCE'
,p_message_language=>'it'
,p_message_text=>'Distanza totale'
,p_is_js_message=>true
,p_version_scn=>2705031
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139957084226751609)
,p_name=>'APEX.MAPS.ZOOM_IN'
,p_message_language=>'it'
,p_message_text=>'Ingrandisci'
,p_is_js_message=>true
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139957228761751610)
,p_name=>'APEX.MAPS.ZOOM_OUT'
,p_message_language=>'it'
,p_message_text=>'Riduci'
,p_is_js_message=>true
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140121733315751658)
,p_name=>'APEX.MARKDOWN.BOLD'
,p_message_language=>'it'
,p_message_text=>'Grassetto'
,p_is_js_message=>true
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140122686261751658)
,p_name=>'APEX.MARKDOWN.IMAGE'
,p_message_language=>'it'
,p_message_text=>'Immagine'
,p_is_js_message=>true
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140122250870751658)
,p_name=>'APEX.MARKDOWN.INLINE_CODE'
,p_message_language=>'it'
,p_message_text=>'Codice in linea'
,p_is_js_message=>true
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140134980050751662)
,p_name=>'APEX.MARKDOWN.INSERT_IMAGE'
,p_message_language=>'it'
,p_message_text=>'Inserisci immagine'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140135026406751662)
,p_name=>'APEX.MARKDOWN.INSERT_LINK'
,p_message_language=>'it'
,p_message_text=>'Inserisci collegamento'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140121897655751658)
,p_name=>'APEX.MARKDOWN.ITALIC'
,p_message_language=>'it'
,p_message_text=>'Corsivo'
,p_is_js_message=>true
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140135687420751662)
,p_name=>'APEX.MARKDOWN.LINK'
,p_message_language=>'it'
,p_message_text=>'Collega'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140122535058751658)
,p_name=>'APEX.MARKDOWN.LIST'
,p_message_language=>'it'
,p_message_text=>'Lista'
,p_is_js_message=>true
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140122464617751658)
,p_name=>'APEX.MARKDOWN.ORDERED_LIST'
,p_message_language=>'it'
,p_message_text=>'Lista ordinata'
,p_is_js_message=>true
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140121996585751658)
,p_name=>'APEX.MARKDOWN.PREVIEW'
,p_message_language=>'it'
,p_message_text=>'Anteprima'
,p_is_js_message=>true
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140122005411751658)
,p_name=>'APEX.MARKDOWN.PREVIEW_EMPTY'
,p_message_language=>'it'
,p_message_text=>'Nessun elemento da visualizzare in anteprima'
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140122170521751658)
,p_name=>'APEX.MARKDOWN.STRIKETHROUGH'
,p_message_language=>'it'
,p_message_text=>'Barrato'
,p_is_js_message=>true
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140122308532751658)
,p_name=>'APEX.MARKDOWN.UNORDERED_LIST'
,p_message_language=>'it'
,p_message_text=>'Lista non ordinata'
,p_is_js_message=>true
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140101212622751652)
,p_name=>'APEX.MENU.CURRENT_MENU'
,p_message_language=>'it'
,p_message_text=>'corrente'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140157476863751669)
,p_name=>'APEX.MENU.OVERFLOW_LABEL'
,p_message_language=>'it'
,p_message_text=>'Altro...'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140101116391751652)
,p_name=>'APEX.MENU.PROCESSING'
,p_message_language=>'it'
,p_message_text=>'Caricamento'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140015358079751627)
,p_name=>'APEX.MENU.SPLIT_BUTTON'
,p_message_language=>'it'
,p_message_text=>'Pulsante Dividi'
,p_is_js_message=>true
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140015291580751627)
,p_name=>'APEX.MENU.SPLIT_MENU'
,p_message_language=>'it'
,p_message_text=>'Menu Dividi'
,p_is_js_message=>true
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140132238832751661)
,p_name=>'APEX.NOTIFICATION_MESSAGE_HEADING'
,p_message_language=>'it'
,p_message_text=>'Messaggio di notifica'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139956352313751609)
,p_name=>'APEX.NO_DATA_FOUND_ENTITY'
,p_message_language=>'it'
,p_message_text=>'Nessun %0 trovato'
,p_is_js_message=>true
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140106290150751654)
,p_name=>'APEX.NUMBER_FIELD.VALUE_GREATER_MAX_VALUE'
,p_message_language=>'it'
,p_message_text=>'#LABEL# deve essere un numero minore o uguale a %0.'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140106364027751654)
,p_name=>'APEX.NUMBER_FIELD.VALUE_INVALID'
,p_message_language=>'it'
,p_message_text=>'#LABEL# deve essere un numero valido.'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140106470363751654)
,p_name=>'APEX.NUMBER_FIELD.VALUE_INVALID2'
,p_message_language=>'it'
,p_message_text=>'Il valore di #LABEL# non corrisponde al formato numerico %0 (ad esempio %1).'
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140106122995751653)
,p_name=>'APEX.NUMBER_FIELD.VALUE_LESS_MIN_VALUE'
,p_message_language=>'it'
,p_message_text=>'#LABEL# deve essere un numero maggiore o uguale a %0.'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140106025952751653)
,p_name=>'APEX.NUMBER_FIELD.VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'it'
,p_message_text=>'Il valore di #LABEL# deve essere un numero compreso tra %0 e %1.'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140101305571751652)
,p_name=>'APEX.OPENS_IN_NEW_WINDOW_LOWER'
,p_message_language=>'it'
,p_message_text=>'si apre in una nuova finestra'
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140051160358751637)
,p_name=>'APEX.PAGE.DUPLICATE_SUBMIT'
,p_message_language=>'it'
,p_message_text=>unistr('Questa pagina \00E8 stata gi\00E0 sottomessa e non pu\00F2 essere sottomessa nuovamente.')
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140032568096751632)
,p_name=>'APEX.PAGE.NOT_FOUND'
,p_message_language=>'it'
,p_message_text=>'Applicazione "%0": pagina "%1" non trovata.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140068038704751642)
,p_name=>'APEX.PAGE_ITEM_IS_REQUIRED'
,p_message_language=>'it'
,p_message_text=>'Specificare un valore per #LABEL#.'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139958781041751610)
,p_name=>'APEX.PASSWORD.HIDE_PASSWORD'
,p_message_language=>'it'
,p_message_text=>'Nascondi password'
,p_is_js_message=>true
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139958636526751610)
,p_name=>'APEX.PASSWORD.SHOW_PASSWORD'
,p_message_language=>'it'
,p_message_text=>'Mostra password'
,p_is_js_message=>true
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140006230128751624)
,p_name=>'APEX.POPUP.SEARCH'
,p_message_language=>'it'
,p_message_text=>'Cerca'
,p_is_js_message=>true
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140120281746751658)
,p_name=>'APEX.POPUP_LOV.BUTTON_CLOSE'
,p_message_language=>'it'
,p_message_text=>'Chiudi'
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140120194800751658)
,p_name=>'APEX.POPUP_LOV.BUTTON_FIND'
,p_message_language=>'it'
,p_message_text=>'Trova %0'
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140120429410751658)
,p_name=>'APEX.POPUP_LOV.BUTTON_NEXT'
,p_message_language=>'it'
,p_message_text=>'Successivo'
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140120398841751658)
,p_name=>'APEX.POPUP_LOV.BUTTON_PREV'
,p_message_language=>'it'
,p_message_text=>'Precedente'
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139997013696751621)
,p_name=>'APEX.POPUP_LOV.FILTER_REQ'
,p_message_language=>'it'
,p_message_text=>'Immettere un termine di ricerca di almeno %0 caratteri.'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140073328412751644)
,p_name=>'APEX.POPUP_LOV.ICON_TEXT'
,p_message_language=>'it'
,p_message_text=>'Lista di valori popup: %0'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139997153860751621)
,p_name=>'APEX.POPUP_LOV.INITIAL_FILTER_REQ'
,p_message_language=>'it'
,p_message_text=>'Immettere il termine di ricerca.'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139944103218751606)
,p_name=>'APEX.POPUP_LOV.LIST_OF_VALUES'
,p_message_language=>'it'
,p_message_text=>'Lista di valori'
,p_is_js_message=>true
,p_version_scn=>2705023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139996950324751621)
,p_name=>'APEX.POPUP_LOV.NO_RESULTS'
,p_message_language=>'it'
,p_message_text=>'Nessun risultato trovato.'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139996864378751621)
,p_name=>'APEX.POPUP_LOV.REMOVE_VALUE'
,p_message_language=>'it'
,p_message_text=>'Rimuovi %0'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140094070469751650)
,p_name=>'APEX.POPUP_LOV.SEARCH'
,p_message_language=>'it'
,p_message_text=>'Termine di ricerca'
,p_version_scn=>2705051
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140120035912751658)
,p_name=>'APEX.POPUP_LOV.TITLE'
,p_message_language=>'it'
,p_message_text=>'Cerca'
,p_is_js_message=>true
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139946280560751606)
,p_name=>'APEX.PRINT.DOCGEN_REQUIRED'
,p_message_language=>'it'
,p_message_text=>'Richiede %0.'
,p_version_scn=>2705024
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139958528226751610)
,p_name=>'APEX.PRINT_REPORT.ERROR'
,p_message_language=>'it'
,p_message_text=>'Errore durante la stampa del report.'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139969337574751613)
,p_name=>'APEX.PRINT_UTIL.UNABLE_TO_PRINT'
,p_message_language=>'it'
,p_message_text=>'Impossibile stampare il documento utilizzando il server di stampa configurato.'
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139992071858751620)
,p_name=>'APEX.PROCESS.INVOKE_API.PARAMETER_ERROR'
,p_message_language=>'it'
,p_message_text=>'Errore durante la valutazione del parametro %0 durante la chiamata di %1. Per i dettagli, vedere il log degli errori.'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140130787593751661)
,p_name=>'APEX.PROCESSING'
,p_message_language=>'it'
,p_message_text=>'In fase di elaborazione'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139989842264751619)
,p_name=>'APEX.PWA.DIALOG.HIDE.INSTRUCTIONS'
,p_message_language=>'it'
,p_message_text=>'Indietro'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139990962271751620)
,p_name=>'APEX.PWA.DIALOG.INTRO'
,p_message_language=>'it'
,p_message_text=>unistr('Questo sito Web offre le funzionalit\00E0 di un''applicazione. Per un''esperienza ottimale, installarlo sul dispositivo.')
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139992295312751620)
,p_name=>'APEX.PWA.DIALOG.SHOW.INSTRUCTIONS'
,p_message_language=>'it'
,p_message_text=>'Successivo'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139993877930751620)
,p_name=>'APEX.PWA.DIALOG.TITLE'
,p_message_language=>'it'
,p_message_text=>'Installa questa applicazione'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139978683608751616)
,p_name=>'APEX.PWA.INSTRUCTIONS'
,p_message_language=>'it'
,p_message_text=>'Il dispositivo o il browser non sembra supportare l''installazione delle applicazioni Web progressive in questo momento.'
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139973711088751614)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP1'
,p_message_language=>'it'
,p_message_text=>'1. Toccare l''icona <strong>Condividi</strong>'
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139973806424751614)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP2'
,p_message_language=>'it'
,p_message_text=>'2. Scorrere verso il basso e toccare <strong>Aggiungi a schermata home</strong>'
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139990249936751619)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP3'
,p_message_language=>'it'
,p_message_text=>'3. Toccare <strong style="color:#007AE1;">Aggiungi</strong> per confermare'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139989396747751619)
,p_name=>'APEX.PWA.OFFLINE.BODY'
,p_message_language=>'it'
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
'    <h1>Impossibile connettersi</h1>',
unistr('    <p>\00C8 possibile che si sia verificato un problema di rete. Controllare la connessione e riprovare.</p>'),
'    <button type="button">Riprova</button>',
'</main>',
'',
'<script>',
'    document.querySelector("button").addEventListener("click", () => {',
'        window.location.reload();',
'    });',
'</script>'))
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139989226466751619)
,p_name=>'APEX.PWA.OFFLINE.TITLE'
,p_message_language=>'it'
,p_message_text=>'Impossibile connettersi'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140035813951751633)
,p_name=>'APEX.PWA.PUSH.SUBSCRIPTION_FAILED'
,p_message_language=>'it'
,p_message_text=>unistr('Questo dispositivo non \00E8 stato in grado di abilitare le notifiche push.')
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140041332368751634)
,p_name=>'APEX.QUICK_PICK.GROUP_LABEL'
,p_message_language=>'it'
,p_message_text=>'Selezioni rapide per %0'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140041296019751634)
,p_name=>'APEX.QUICK_PICK.LINK_ROLE'
,p_message_language=>'it'
,p_message_text=>'Collegamento di selezione rapida'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140015082021751627)
,p_name=>'APEX.RADIO.VISUALLY_HIDDEN_RADIO'
,p_message_language=>'it'
,p_message_text=>'Pulsante di scelta nascosto'
,p_is_js_message=>true
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139959179560751610)
,p_name=>'APEX.RECORD_VIEW.TOOLBAR'
,p_message_language=>'it'
,p_message_text=>'Vista a riga singola'
,p_is_js_message=>true
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140141804729751664)
,p_name=>'APEX.REGION.CSSCALENDAR.ADD'
,p_message_language=>'it'
,p_message_text=>'Aggiungi'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140087199842751648)
,p_name=>'APEX.REGION.CSSCALENDAR.ALL_DAY'
,p_message_language=>'it'
,p_message_text=>'Giornata intera'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140164717768751671)
,p_name=>'APEX.REGION.CSSCALENDAR.BUTTON.SENDEMAIL'
,p_message_language=>'it'
,p_message_text=>'Invia invito'
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140164507219751671)
,p_name=>'APEX.REGION.CSSCALENDAR.CHOOSE_ACTION'
,p_message_language=>'it'
,p_message_text=>'Opzioni'
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140088983321751648)
,p_name=>'APEX.REGION.CSSCALENDAR.DAILY_ALLDAY'
,p_message_language=>'it'
,p_message_text=>'Vista giornaliera per tutto il giorno '
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140088704791751648)
,p_name=>'APEX.REGION.CSSCALENDAR.DAILY_TIME_SPECIFIC'
,p_message_language=>'it'
,p_message_text=>'Vista giornaliera per dati con ora '
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140132953607751662)
,p_name=>'APEX.REGION.CSSCALENDAR.DAY'
,p_message_language=>'it'
,p_message_text=>'Giorno'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140127996461751660)
,p_name=>'APEX.REGION.CSSCALENDAR.DESCRIPTION'
,p_message_language=>'it'
,p_message_text=>'Descrizione'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140011485604751626)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.CSV'
,p_message_language=>'it'
,p_message_text=>'CSV'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140011228510751625)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.ICALENDAR'
,p_message_language=>'it'
,p_message_text=>'iCal'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140011186270751625)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.PDF'
,p_message_language=>'it'
,p_message_text=>'PDF'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140011300893751626)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.XML'
,p_message_language=>'it'
,p_message_text=>'XML'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140010852833751625)
,p_name=>'APEX.REGION.CSSCALENDAR.ENDDATE'
,p_message_language=>'it'
,p_message_text=>'Data di fine'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140011064552751625)
,p_name=>'APEX.REGION.CSSCALENDAR.EVENTNAME'
,p_message_language=>'it'
,p_message_text=>'Nome evento'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140164670473751671)
,p_name=>'APEX.REGION.CSSCALENDAR.INVITATION'
,p_message_language=>'it'
,p_message_text=>'Invito'
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140133000076751662)
,p_name=>'APEX.REGION.CSSCALENDAR.LIST'
,p_message_language=>'it'
,p_message_text=>'Lista'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140132763222751661)
,p_name=>'APEX.REGION.CSSCALENDAR.MONTH'
,p_message_language=>'it'
,p_message_text=>'Mese'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140135341461751662)
,p_name=>'APEX.REGION.CSSCALENDAR.NEXT'
,p_message_language=>'it'
,p_message_text=>'Successivo'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140149328453751666)
,p_name=>'APEX.REGION.CSSCALENDAR.NOEVENTS'
,p_message_language=>'it'
,p_message_text=>'Nessun evento'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140164940190751671)
,p_name=>'APEX.REGION.CSSCALENDAR.OPTION.FORM'
,p_message_language=>'it'
,p_message_text=>'Modifica un evento esistente.'
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140164807865751671)
,p_name=>'APEX.REGION.CSSCALENDAR.OPTION.SEND'
,p_message_language=>'it'
,p_message_text=>'Invio di un invito mediante posta elettronica.'
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140135459164751662)
,p_name=>'APEX.REGION.CSSCALENDAR.PREVIOUS'
,p_message_language=>'it'
,p_message_text=>'Precedente'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140143178440751665)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL'
,p_message_language=>'it'
,p_message_text=>'Invia messaggio di posta elettronica'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140142959201751664)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.BUTTON'
,p_message_language=>'it'
,p_message_text=>'Invia messaggio di posta elettronica'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140165585812751671)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.DIALOG.REQUIRED'
,p_message_language=>'it'
,p_message_text=>'Tutti i campi sono obbligatori.'
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140165455665751671)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.DIALOG.TITLE'
,p_message_language=>'it'
,p_message_text=>'Invia invito'
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140164426798751671)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.SUBJECT'
,p_message_language=>'it'
,p_message_text=>'Oggetto'
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140143017448751665)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.TO'
,p_message_language=>'it'
,p_message_text=>'A'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140010905228751625)
,p_name=>'APEX.REGION.CSSCALENDAR.STARTDATE'
,p_message_language=>'it'
,p_message_text=>'Data di inizio'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140141114653751664)
,p_name=>'APEX.REGION.CSSCALENDAR.TABLEFORM'
,p_message_language=>'it'
,p_message_text=>'Form su %0'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140088578184751648)
,p_name=>'APEX.REGION.CSSCALENDAR.TIME'
,p_message_language=>'it'
,p_message_text=>'Quando'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140135583718751662)
,p_name=>'APEX.REGION.CSSCALENDAR.TODAY'
,p_message_language=>'it'
,p_message_text=>'Oggi'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140133573128751662)
,p_name=>'APEX.REGION.CSSCALENDAR.VIEW'
,p_message_language=>'it'
,p_message_text=>'Visualizza'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140132800191751662)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEK'
,p_message_language=>'it'
,p_message_text=>'Settimana'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140088851931751648)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEKLY_ALLDAY'
,p_message_language=>'it'
,p_message_text=>'Vista settimanale per tutto il giorno'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140088639913751648)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEKLY_TIME_SPECIFIC'
,p_message_language=>'it'
,p_message_text=>'Vista settimanale per dati con ora'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140133484966751662)
,p_name=>'APEX.REGION.CSSCALENDAR.YEAR'
,p_message_language=>'it'
,p_message_text=>'Anno'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140133136158751662)
,p_name=>'APEX.REGION.JQM_COLUMN_TOGGLE.COLUMNS'
,p_message_language=>'it'
,p_message_text=>'Colonne...'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140133230585751662)
,p_name=>'APEX.REGION.JQM_COLUMN_TOGGLE.LOAD_MORE'
,p_message_language=>'it'
,p_message_text=>'Carica altro...'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140062683182751641)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.BACK'
,p_message_language=>'it'
,p_message_text=>'Indietro'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140004119959751623)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.LOAD_MORE'
,p_message_language=>'it'
,p_message_text=>'Carica altro...'
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140006471616751624)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.SEARCH'
,p_message_language=>'it'
,p_message_text=>'Cerca...'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140133353175751662)
,p_name=>'APEX.REGION.JQM_REFLOW.LOAD_MORE'
,p_message_language=>'it'
,p_message_text=>'Carica altro...'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140135230599751662)
,p_name=>'APEX.REGION.NOT_FOUND'
,p_message_language=>'it'
,p_message_text=>'ID area %0 non trovato.'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140006392616751624)
,p_name=>'APEX.REGION.NO_DATA_FOUND_MESSAGE'
,p_message_language=>'it'
,p_message_text=>'Nessun dato trovato'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140033803986751632)
,p_name=>'APEX.REGION.PAGINATION.RESET_ERROR'
,p_message_language=>'it'
,p_message_text=>'Impossibile reimpostare l''impaginazione per l''area.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139997594534751621)
,p_name=>'APEX.REGION.PAGINATION.UNHANDLED_ERROR'
,p_message_language=>'it'
,p_message_text=>'Errore durante l''impostazione dell''impaginazione dell''area.'
,p_version_scn=>2705035
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140127325154751660)
,p_name=>'APEX.REGION.RESPONSIVE_TABLE.COLUMNS'
,p_message_language=>'it'
,p_message_text=>'Colonne...'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139981806988751617)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.LAZY_LOADING_INCOMPATIBLE'
,p_message_language=>'it'
,p_message_text=>unistr('Il caricamento lento non \00E8 compatibile con gli slot in %0, che \00E8 una singola area (parziale). \00C8 necessario disabilitare il caricamento lento per questa area oppure spostare i componenti degli slot in un''altra area.')
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139977123057751615)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.NO_GROUP_TEMPLATE'
,p_message_language=>'it'
,p_message_text=>'Modello di gruppo mancante nel componente del modello per %0.'
,p_version_scn=>2705031
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139972140711751614)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.TOO_MANY_ROWS'
,p_message_language=>'it'
,p_message_text=>unistr('%0 \00E8 una singola area (parziale) e ha restituito pi\00F9 righe.')
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140135119130751662)
,p_name=>'APEX.REGION.TYPE_NOT_SUPPORTED'
,p_message_language=>'it'
,p_message_text=>unistr('Il tipo di area %0 non \00E8 supportato.')
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139997466163751621)
,p_name=>'APEX.REGION.UNHANDLED_ERROR'
,p_message_language=>'it'
,p_message_text=>'Errore durante la presentazione dell''area "#COMPONENT_NAME#".'
,p_version_scn=>2705035
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140068184538751642)
,p_name=>'APEX.REGION_COLUMN_IS_REQUIRED'
,p_message_language=>'it'
,p_message_text=>'Specificare un valore per #COLUMN_HEADER#.'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139949706756751607)
,p_name=>'APEX.REPORT_QUERY.LAYOUT_REQUIRED'
,p_message_language=>'it'
,p_message_text=>'Specificare un layout del report.'
,p_version_scn=>2705025
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140164085349751671)
,p_name=>'APEX.RICH_TEXT_EDITOR.ACCESSIBLE_LABEL'
,p_message_language=>'it'
,p_message_text=>'%0, Rich Text Editor'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140070237339751643)
,p_name=>'APEX.RICH_TEXT_EDITOR.MAXIMUM_LENGTH_EXCEEDED'
,p_message_language=>'it'
,p_message_text=>'Il markup HTML Rich Text supera la lunghezza massima dell''elemento (caratteri effettivi: %0, caratteri consentiti: %1)'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139979683139751616)
,p_name=>'APEX.RTE.READ_ONLY_RICH_TEXT_EDITOR'
,p_message_language=>'it'
,p_message_text=>'Rich Text Editor di sola lettura'
,p_is_js_message=>true
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139979554766751616)
,p_name=>'APEX.RTE.RICH_TEXT_EDITOR'
,p_message_language=>'it'
,p_message_text=>'Rich Text Editor'
,p_is_js_message=>true
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139979309956751616)
,p_name=>'APEX.RTE.TOOLBAR_ALIGNMENT'
,p_message_language=>'it'
,p_message_text=>'Allineamento'
,p_is_js_message=>true
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139979491736751616)
,p_name=>'APEX.RTE.TOOLBAR_EXTRAS'
,p_message_language=>'it'
,p_message_text=>'Extra'
,p_is_js_message=>true
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139979125741751616)
,p_name=>'APEX.RTE.TOOLBAR_FONT'
,p_message_language=>'it'
,p_message_text=>'Carattere'
,p_is_js_message=>true
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139979030855751616)
,p_name=>'APEX.RTE.TOOLBAR_FORMATTING'
,p_message_language=>'it'
,p_message_text=>'Formattazione'
,p_is_js_message=>true
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139979295833751616)
,p_name=>'APEX.RTE.TOOLBAR_LISTS'
,p_message_language=>'it'
,p_message_text=>'Liste'
,p_is_js_message=>true
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140132363546751661)
,p_name=>'APEX.RV.DELETE'
,p_message_language=>'it'
,p_message_text=>'Elimina'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140124816674751659)
,p_name=>'APEX.RV.DUPLICATE'
,p_message_language=>'it'
,p_message_text=>'Duplica'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140123173117751659)
,p_name=>'APEX.RV.EXCLUDE_HIDDEN'
,p_message_language=>'it'
,p_message_text=>'Colonne visualizzate'
,p_is_js_message=>true
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140123013750751659)
,p_name=>'APEX.RV.EXCLUDE_NULL'
,p_message_language=>'it'
,p_message_text=>'Escludi valori nulli'
,p_is_js_message=>true
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140132419311751661)
,p_name=>'APEX.RV.INSERT'
,p_message_language=>'it'
,p_message_text=>'Aggiungi'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140086748706751648)
,p_name=>'APEX.RV.MOVE_DOWN'
,p_message_language=>'it'
,p_message_text=>'Sposta in basso'
,p_is_js_message=>true
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140086847872751648)
,p_name=>'APEX.RV.MOVE_UP'
,p_message_language=>'it'
,p_message_text=>'Sposta in alto'
,p_is_js_message=>true
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140122825723751659)
,p_name=>'APEX.RV.NEXT_RECORD'
,p_message_language=>'it'
,p_message_text=>'Successivo'
,p_is_js_message=>true
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140123456967751659)
,p_name=>'APEX.RV.NOT_GROUPED_LABEL'
,p_message_language=>'it'
,p_message_text=>'Altre colonne'
,p_is_js_message=>true
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140122948295751659)
,p_name=>'APEX.RV.PREV_RECORD'
,p_message_language=>'it'
,p_message_text=>'Precedente'
,p_is_js_message=>true
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140123232802751659)
,p_name=>'APEX.RV.REC_X'
,p_message_language=>'it'
,p_message_text=>'Riga %0'
,p_is_js_message=>true
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140123314800751659)
,p_name=>'APEX.RV.REC_XY'
,p_message_language=>'it'
,p_message_text=>'Riga %0 di %1'
,p_is_js_message=>true
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140124984576751659)
,p_name=>'APEX.RV.REFRESH'
,p_message_language=>'it'
,p_message_text=>'Aggiorna'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140125006616751659)
,p_name=>'APEX.RV.REVERT'
,p_message_language=>'it'
,p_message_text=>'Annulla modifiche'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140122776189751659)
,p_name=>'APEX.RV.SETTINGS_MENU'
,p_message_language=>'it'
,p_message_text=>'Impostazioni'
,p_is_js_message=>true
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140081900981751646)
,p_name=>'APEX.SAMPLE_FORMAT'
,p_message_language=>'it'
,p_message_text=>'Ad esempio, %0'
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140086251166751648)
,p_name=>'APEX.SAMPLE_FORMAT_SHORT'
,p_message_language=>'it'
,p_message_text=>'Esempio: %0'
,p_is_js_message=>true
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139998992035751622)
,p_name=>'APEX.SEARCH.1_RESULT_FOUND'
,p_message_language=>'it'
,p_message_text=>'1 risultato'
,p_is_js_message=>true
,p_version_scn=>2705035
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139996076080751621)
,p_name=>'APEX.SEARCH.N_RESULTS_FOUND'
,p_message_language=>'it'
,p_message_text=>'%0 risultati'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140047885865751636)
,p_name=>'APEX.SEARCH.PAGINATION'
,p_message_language=>'it'
,p_message_text=>'Impaginazione'
,p_is_js_message=>true
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140047942739751636)
,p_name=>'APEX.SEARCH.RESULTS_X_TO_Y'
,p_message_language=>'it'
,p_message_text=>'Risultati: da %0 a %1'
,p_is_js_message=>true
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139943679221751606)
,p_name=>'APEX.SESSION.ALERT.CREATE_NEW'
,p_message_language=>'it'
,p_message_text=>'Connetti di nuovo'
,p_is_js_message=>true
,p_version_scn=>2705023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139943570310751605)
,p_name=>'APEX.SESSION.ALERT.EXPIRED'
,p_message_language=>'it'
,p_message_text=>unistr('La sessione \00E8 terminata')
,p_is_js_message=>true
,p_version_scn=>2705023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139943793250751606)
,p_name=>'APEX.SESSION.ALERT.EXTEND'
,p_message_language=>'it'
,p_message_text=>'Estendi'
,p_is_js_message=>true
,p_version_scn=>2705023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139943386114751605)
,p_name=>'APEX.SESSION.ALERT.IDLE_WARN'
,p_message_language=>'it'
,p_message_text=>unistr('La sessione terminer\00E0 alle %0. Estenderla?')
,p_is_js_message=>true
,p_version_scn=>2705023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139943458057751605)
,p_name=>'APEX.SESSION.ALERT.MAX_WARN'
,p_message_language=>'it'
,p_message_text=>unistr('La sessione terminer\00E0 alle %0 e non pu\00F2 essere estesa. Salvare il lavoro ora per evitare di perdere dati.')
,p_is_js_message=>true
,p_version_scn=>2705023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140142706124751664)
,p_name=>'APEX.SESSION.DB_SESSION_CLEANUP.UNHANDLED_ERROR'
,p_message_language=>'it'
,p_message_text=>'Errore durante l''elaborazione del codice di cleanup della sessione del database.'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140032476059751632)
,p_name=>'APEX.SESSION.DB_SESSION_INIT.UNHANDLED_ERROR'
,p_message_language=>'it'
,p_message_text=>'Errore durante l''elaborazione del codice di impostazione della sessione del database.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140002877487751623)
,p_name=>'APEX.SESSION.EXPIRED'
,p_message_language=>'it'
,p_message_text=>unistr('La sessione \00E8 terminata.')
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140141988713751664)
,p_name=>'APEX.SESSION.EXPIRED.CLOSE_DIALOG'
,p_message_language=>'it'
,p_message_text=>'Chiudere questa finestra di dialogo e fare clic sul pulsante di ricaricamento del browser per ottenere una nuova sessione.'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140160823312751670)
,p_name=>'APEX.SESSION.EXPIRED.NEW_SESSION'
,p_message_language=>'it'
,p_message_text=>'<a href="%0">Connettersi</a> di nuovo per creare una nuova sessione.'
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140045178152751635)
,p_name=>'APEX.SESSION.NOT_VALID'
,p_message_language=>'it'
,p_message_text=>'Sessione non valida'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140088208609751648)
,p_name=>'APEX.SESSION.RAS.NO_DYNAMIC_ROLES'
,p_message_language=>'it'
,p_message_text=>unistr('Non \00E8 stato possibile abilitare alcun ruolo dinamico nella sessione Real Application Security per l''utente "%0".')
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140030318628751631)
,p_name=>'APEX.SESSION.UNHANDLED_ERROR'
,p_message_language=>'it'
,p_message_text=>'ERR-99900 Impossibile creare un ID sessione univoco: %0'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139959465593751610)
,p_name=>'APEX.SESSION_STATE.CLOB_NOT_ALLOWED'
,p_message_language=>'it'
,p_message_text=>unistr('Il tipo di dati dello stato sessione CLOB non \00E8 consentito per l''elemento %0.')
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139978829059751616)
,p_name=>'APEX.SESSION_STATE.CLOB_SUBSTITUTION_NOT_ALLOWED'
,p_message_language=>'it'
,p_message_text=>unistr('La sostituzione di elementi del tipo di dati dello stato sessione CLOB non \00E8 supportata.')
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140047624505751636)
,p_name=>'APEX.SESSION_STATE.ITEM_VALUE_PROTECTION'
,p_message_language=>'it'
,p_message_text=>unistr('Violazione della protezione dello stato sessione. Ci\00F2 potrebbe essere causato dalla modifica manuale dell''elemento di pagina protetto %0. Se non si \00E8 certi della causa dell''errore, contattare l''amministratore dell''applicazione per assistenza.')
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140168814765751672)
,p_name=>'APEX.SESSION_STATE.PAGE_PROTECTION'
,p_message_language=>'it'
,p_message_text=>unistr('Violazione della protezione della pagina. Ci\00F2 potrebbe essere causato dalla sottomissione di una pagina il cui caricamento era ancora in corso oppure dalla modifica manuale degli elementi di pagina protetti. Contattare l''amministratore dell''applicazi')
||'one per assistenza.'
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140167996210751672)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.NO_SPECIAL_CHAR'
,p_message_language=>'it'
,p_message_text=>'%0 contiene uno dei caratteri non validi seguenti: &<>"/;,*|=% o --'
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140168042047751672)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.NO_SPECIAL_CHAR_NL'
,p_message_language=>'it'
,p_message_text=>'%0 contiene uno dei caratteri non validi seguenti: &<>"/;,*|=% o -- o nuova riga.'
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140167769960751672)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.US_ONLY'
,p_message_language=>'it'
,p_message_text=>'%0 contiene caratteri speciali. Sono consentiti solo i caratteri a-Z, 0-9 e gli spazi.'
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140167872529751672)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE'
,p_message_language=>'it'
,p_message_text=>'%0 contiene <, > o ", ovvero caratteri non validi.'
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140005262763751624)
,p_name=>'APEX.SESSION_STATE.SSP_CHECKSUM_MISSING'
,p_message_language=>'it'
,p_message_text=>unistr('Non \00E8 stato fornito nessun checksum per visualizzare l''elaborazione di una pagina che richiede un checksum se vengono passati valori di richiesta, di svuotamento di cache o di argomento come parametri.')
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140042500378751635)
,p_name=>'APEX.SESSION_STATE.SSP_VIOLATION'
,p_message_language=>'it'
,p_message_text=>unistr('Violazione della protezione dello stato sessione. Ci\00F2 potrebbe esse causato da una modifica manuale di un URL che contiene un checksum o dall''utilizzo di un collegamento con un checksum errato o mancante. Se non si \00E8 certi della causa dell''errore, co')
||'ntattare l''amministratore dell''applicazione per assistenza.'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140124119516751659)
,p_name=>'APEX.SET_HIGH_CONTRAST_MODE_OFF'
,p_message_language=>'it'
,p_message_text=>unistr('Disattiva modalit\00E0 contrasto elevato')
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140124257663751659)
,p_name=>'APEX.SET_HIGH_CONTRAST_MODE_ON'
,p_message_language=>'it'
,p_message_text=>unistr('Attiva modalit\00E0 contrasto elevato')
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139988674856751619)
,p_name=>'APEX.SET_VALUE_ERROR'
,p_message_language=>'it'
,p_message_text=>unistr('Impossibile aggiornare l''impostazione dell''applicazione %0 poich\00E9 \00E8 sottoscritta da un''altra applicazione.')
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140038959166751634)
,p_name=>'APEX.SHUTTLE.CONTROL_BOTTOM'
,p_message_language=>'it'
,p_message_text=>'In basso'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140039151732751634)
,p_name=>'APEX.SHUTTLE.CONTROL_DOWN'
,p_message_language=>'it'
,p_message_text=>unistr('Gi\00F9')
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140039290976751634)
,p_name=>'APEX.SHUTTLE.CONTROL_MOVE'
,p_message_language=>'it'
,p_message_text=>'Sposta'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140039327260751634)
,p_name=>'APEX.SHUTTLE.CONTROL_MOVE_ALL'
,p_message_language=>'it'
,p_message_text=>'Sposta tutto'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140039416835751634)
,p_name=>'APEX.SHUTTLE.CONTROL_REMOVE'
,p_message_language=>'it'
,p_message_text=>'Rimuovi'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140039502889751634)
,p_name=>'APEX.SHUTTLE.CONTROL_REMOVE_ALL'
,p_message_language=>'it'
,p_message_text=>'Rimuovi tutto'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140039667724751634)
,p_name=>'APEX.SHUTTLE.CONTROL_RESET'
,p_message_language=>'it'
,p_message_text=>'Reimposta'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140038816530751634)
,p_name=>'APEX.SHUTTLE.CONTROL_TOP'
,p_message_language=>'it'
,p_message_text=>'In alto'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140039019909751634)
,p_name=>'APEX.SHUTTLE.CONTROL_UP'
,p_message_language=>'it'
,p_message_text=>'Su'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140150608831751667)
,p_name=>'APEX.SINCE.SHORT.DAYS_AGO'
,p_message_language=>'it'
,p_message_text=>'%0d'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140151316445751667)
,p_name=>'APEX.SINCE.SHORT.DAYS_FROM_NOW'
,p_message_language=>'it'
,p_message_text=>'tra %0 giorno/i'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140150506274751667)
,p_name=>'APEX.SINCE.SHORT.HOURS_AGO'
,p_message_language=>'it'
,p_message_text=>'%0h'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140151408815751667)
,p_name=>'APEX.SINCE.SHORT.HOURS_FROM_NOW'
,p_message_language=>'it'
,p_message_text=>'tra %0 ora/e'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140150333249751667)
,p_name=>'APEX.SINCE.SHORT.MINUTES_AGO'
,p_message_language=>'it'
,p_message_text=>'%0m'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140151575428751667)
,p_name=>'APEX.SINCE.SHORT.MINUTES_FROM_NOW'
,p_message_language=>'it'
,p_message_text=>'tra %0 mese/i'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140150989262751667)
,p_name=>'APEX.SINCE.SHORT.MONTHS_AGO'
,p_message_language=>'it'
,p_message_text=>'%0 mese/i'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140151101537751667)
,p_name=>'APEX.SINCE.SHORT.MONTHS_FROM_NOW'
,p_message_language=>'it'
,p_message_text=>'tra %0 mese/i'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140150493694751667)
,p_name=>'APEX.SINCE.SHORT.SECONDS_AGO'
,p_message_language=>'it'
,p_message_text=>'%0s'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140151291375751667)
,p_name=>'APEX.SINCE.SHORT.SECONDS_FROM_NOW'
,p_message_language=>'it'
,p_message_text=>'tra %0 secondo/i'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140150759791751667)
,p_name=>'APEX.SINCE.SHORT.WEEKS_AGO'
,p_message_language=>'it'
,p_message_text=>'%0w'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140151617990751667)
,p_name=>'APEX.SINCE.SHORT.WEEKS_FROM_NOW'
,p_message_language=>'it'
,p_message_text=>'tra %0 settimana/e'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140150828830751667)
,p_name=>'APEX.SINCE.SHORT.YEARS_AGO'
,p_message_language=>'it'
,p_message_text=>'%0y'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140151099023751667)
,p_name=>'APEX.SINCE.SHORT.YEARS_FROM_NOW'
,p_message_language=>'it'
,p_message_text=>'tra %0 anno/i'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139951972307751608)
,p_name=>'APEX.SPATIAL.GEOMETRY.LINE'
,p_message_language=>'it'
,p_message_text=>'[Linea]'
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139952571996751608)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTILINE'
,p_message_language=>'it'
,p_message_text=>'[Linee multiple]'
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139952296179751608)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTIPOINT'
,p_message_language=>'it'
,p_message_text=>'[Punti multipli]'
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139952750777751608)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTIPOLYGON'
,p_message_language=>'it'
,p_message_text=>'[Poligoni multipli]'
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139952808337751608)
,p_name=>'APEX.SPATIAL.GEOMETRY.OTHER'
,p_message_language=>'it'
,p_message_text=>'[Oggetto geometria]'
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139951824113751608)
,p_name=>'APEX.SPATIAL.GEOMETRY.POINT'
,p_message_language=>'it'
,p_message_text=>'[Punto (%0,%1)]'
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139952113620751608)
,p_name=>'APEX.SPATIAL.GEOMETRY.POLYGON'
,p_message_language=>'it'
,p_message_text=>'[Poligono]'
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139951305561751608)
,p_name=>'APEX.SPLITTER.COLLAPSED_REGION'
,p_message_language=>'it'
,p_message_text=>'Area compressa: %0'
,p_is_js_message=>true
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140066433234751642)
,p_name=>'APEX.SPLITTER.COLLAPSE_TEXT'
,p_message_language=>'it'
,p_message_text=>'Comprimi'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139950305001751608)
,p_name=>'APEX.SPLITTER.HORIZ_CANNOT_LEFT_RIGHT'
,p_message_language=>'it'
,p_message_text=>'Impossibile spostare a sinistra o a destra il separatore con orientamento orizzontale'
,p_is_js_message=>true
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139950504968751608)
,p_name=>'APEX.SPLITTER.MAX_SIZE_REACHED'
,p_message_language=>'it'
,p_message_text=>'Raggiunta la dimensione massima di %0 px'
,p_is_js_message=>true
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139951583908751608)
,p_name=>'APEX.SPLITTER.MIN_SIZE_REACHED'
,p_message_language=>'it'
,p_message_text=>'Raggiunta la dimensione minima di %0 px'
,p_is_js_message=>true
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139951433305751608)
,p_name=>'APEX.SPLITTER.REGION_IS_COLLAPSED'
,p_message_language=>'it'
,p_message_text=>unistr('L''area \00E8 stata compressa')
,p_is_js_message=>true
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139951228941751608)
,p_name=>'APEX.SPLITTER.REGION_IS_RESTORED'
,p_message_language=>'it'
,p_message_text=>unistr('L''area \00E8 stata ripristinata')
,p_is_js_message=>true
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139950937950751608)
,p_name=>'APEX.SPLITTER.RESIZED_TO'
,p_message_language=>'it'
,p_message_text=>'Ridimensionato a %0 px'
,p_is_js_message=>true
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139951167744751608)
,p_name=>'APEX.SPLITTER.RESTORED_REGION'
,p_message_language=>'it'
,p_message_text=>'Area ripristinata: %0'
,p_is_js_message=>true
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140066304955751642)
,p_name=>'APEX.SPLITTER.RESTORE_TEXT'
,p_message_language=>'it'
,p_message_text=>'Ripristina'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139950465929751608)
,p_name=>'APEX.SPLITTER.VERTICAL_CANNOT_UP_DOWN'
,p_message_language=>'it'
,p_message_text=>'Impossibile spostare verso l''alto o il basso il separatore con orientamento verticale'
,p_is_js_message=>true
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140115860349751656)
,p_name=>'APEX.STAR_RATING.CLEAR_RATING'
,p_message_language=>'it'
,p_message_text=>'Cancella valutazione'
,p_version_scn=>2705058
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140105795630751653)
,p_name=>'APEX.STAR_RATING.INVALID_RATING_RANGE'
,p_message_language=>'it'
,p_message_text=>unistr('%0 non \00E8 compreso nell''intervallo di valutazione 1 - %1 valido')
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140105812181751653)
,p_name=>'APEX.STAR_RATING.IS_NOT_NUMERIC'
,p_message_language=>'it'
,p_message_text=>unistr('%0 non \00E8 numerico')
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140101903635751652)
,p_name=>'APEX.SUCCESS_MESSAGE_HEADING'
,p_message_language=>'it'
,p_message_text=>'Messaggio di operazione riuscita'
,p_is_js_message=>true
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140163732044751671)
,p_name=>'APEX.TABS.NEXT'
,p_message_language=>'it'
,p_message_text=>'Successivo'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140163678654751671)
,p_name=>'APEX.TABS.PREVIOUS'
,p_message_language=>'it'
,p_message_text=>'Precedente'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140073806157751644)
,p_name=>'APEX.TASK.ACTION.DATA_NOT_FOUND'
,p_message_language=>'it'
,p_message_text=>unistr('Il sistema di record associato a questa istanza del task non \00E8 stato trovato')
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140082144450751646)
,p_name=>'APEX.TASK.ACTION.ERROR'
,p_message_language=>'it'
,p_message_text=>unistr('L''esecuzione dell''azione task %0 non \00E8 riuscita: il task \00E8 impostato sullo stato con errori. Controllare il codice dell''azione task.')
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139962336644751611)
,p_name=>'APEX.TASK.ADD_COMMENT_NOT_AUTHORIZED'
,p_message_language=>'it'
,p_message_text=>'Aggiungi commento: non si dispone dell''autorizzazione'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139961612474751611)
,p_name=>'APEX.TASK.ALREADY_ASSIGNED'
,p_message_language=>'it'
,p_message_text=>unistr('Task gi\00E0 assegnato')
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139955011259751609)
,p_name=>'APEX.TASK.ASSIGNED_TO_USER'
,p_message_language=>'it'
,p_message_text=>'Assegnato a %0'
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139961339776751611)
,p_name=>'APEX.TASK.CANCEL_TASK_NOT_AUTHORIZED'
,p_message_language=>'it'
,p_message_text=>'Annulla task: non si dispone dell''autorizzazione'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139976962328751615)
,p_name=>'APEX.TASK.CANNOT_REMOVE_OWNER'
,p_message_language=>'it'
,p_message_text=>'Impossibile rimuovere il proprietario effettivo di questo task. Delegare il task a un altro partecipante prima di riprovare questa operazione.'
,p_version_scn=>2705031
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139960961275751611)
,p_name=>'APEX.TASK.CLAIM_TASK_NOT_AUTHORIZED'
,p_message_language=>'it'
,p_message_text=>'Prendi in carico task: non si dispone dell''autorizzazione'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139961070948751611)
,p_name=>'APEX.TASK.COMPLETE_TASK_NOT_AUTHORIZED'
,p_message_language=>'it'
,p_message_text=>'Completa task: non si dispone dell''autorizzazione'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139961172694751611)
,p_name=>'APEX.TASK.DELEGATE_TASK_NOT_AUTHORIZED'
,p_message_language=>'it'
,p_message_text=>'Delega task: non si dispone dell''autorizzazione'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139959575073751610)
,p_name=>'APEX.TASK.DUE_DATE_IN_PAST'
,p_message_language=>'it'
,p_message_text=>unistr('La data di scadenza del task non pu\00F2 essere nel passato.')
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139954871145751609)
,p_name=>'APEX.TASK.DUE_SINCE'
,p_message_language=>'it'
,p_message_text=>'Scaduto %0'
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139955241965751609)
,p_name=>'APEX.TASK.EVENT.ACTION.ERROR_MESSAGE'
,p_message_language=>'it'
,p_message_text=>'Azione task %1 non riuscita. Messaggio di errore - %0'
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139954941793751609)
,p_name=>'APEX.TASK.EVENT.ACTION.FAILURE'
,p_message_language=>'it'
,p_message_text=>'Non riuscito'
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139954594306751609)
,p_name=>'APEX.TASK.EVENT.ACTION.SUCCESS'
,p_message_language=>'it'
,p_message_text=>'Operazione completata'
,p_is_js_message=>true
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139954720545751609)
,p_name=>'APEX.TASK.EVENT.ACTION.SUCCESS_MESSAGE'
,p_message_language=>'it'
,p_message_text=>'Azione %1 completata con il messaggio %0'
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139958051901751610)
,p_name=>'APEX.TASK.EVENT.BEFORE_EXPIRE'
,p_message_language=>'it'
,p_message_text=>'Prima della scadenza'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139983673295751617)
,p_name=>'APEX.TASK.EVENT.CANCEL'
,p_message_language=>'it'
,p_message_text=>'Annulla'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139983196609751617)
,p_name=>'APEX.TASK.EVENT.CANCEL_MESSAGE'
,p_message_language=>'it'
,p_message_text=>'Task annullato'
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139983755509751617)
,p_name=>'APEX.TASK.EVENT.CANCEL_NOT_ALLOWED'
,p_message_language=>'it'
,p_message_text=>unistr('Al partecipante non \00E8 consentito annullare il task')
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139983029294751617)
,p_name=>'APEX.TASK.EVENT.CLAIM'
,p_message_language=>'it'
,p_message_text=>'Prendi in carico'
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139983443192751617)
,p_name=>'APEX.TASK.EVENT.CLAIM_ALREADY_CLAIMED'
,p_message_language=>'it'
,p_message_text=>unistr('Il task \00E8 gi\00E0 preso in carico da un altro utente oppure il partecipante non \00E8 autorizzato a prendere in carico questo task')
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139983204597751617)
,p_name=>'APEX.TASK.EVENT.CLAIM_MESSAGE'
,p_message_language=>'it'
,p_message_text=>'Task preso in carico da %0'
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140084343342751647)
,p_name=>'APEX.TASK.EVENT.COMPLETE'
,p_message_language=>'it'
,p_message_text=>'Completa'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139982855024751617)
,p_name=>'APEX.TASK.EVENT.COMPLETE_MESSAGE'
,p_message_language=>'it'
,p_message_text=>'Task completato con risultato %0'
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139984114875751617)
,p_name=>'APEX.TASK.EVENT.COMPLETE_NOT_ALLOWED'
,p_message_language=>'it'
,p_message_text=>unistr('Il task non \00E8 assegnato o al partecipante non \00E8 consentito completare il task')
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139944596047751606)
,p_name=>'APEX.TASK.EVENT.COMPLETE_NO_OUTCOME'
,p_message_language=>'it'
,p_message_text=>'Task completato senza risultato'
,p_version_scn=>2705023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140084484563751647)
,p_name=>'APEX.TASK.EVENT.CREATE'
,p_message_language=>'it'
,p_message_text=>'Crea'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139977373163751615)
,p_name=>'APEX.TASK.EVENT.CREATE_MESSAGE'
,p_message_language=>'it'
,p_message_text=>'Task creato con ID %0'
,p_version_scn=>2705031
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140084515227751647)
,p_name=>'APEX.TASK.EVENT.DELEGATE'
,p_message_language=>'it'
,p_message_text=>'Delega'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139982956187751617)
,p_name=>'APEX.TASK.EVENT.DELEGATE_MESSAGE'
,p_message_language=>'it'
,p_message_text=>'Task delegato al proprietario potenziale %0'
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139983535380751617)
,p_name=>'APEX.TASK.EVENT.DELEGATE_NOT_ALLOWED'
,p_message_language=>'it'
,p_message_text=>unistr('Il partecipante non \00E8 autorizzato o il nuovo partecipante non \00E8 un proprietario potenziale di questo task')
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139956637388751609)
,p_name=>'APEX.TASK.EVENT.EXPIRE'
,p_message_language=>'it'
,p_message_text=>'Scadenza'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139957758996751610)
,p_name=>'APEX.TASK.EVENT.EXPIRED_MESSAGE'
,p_message_language=>'it'
,p_message_text=>'Task scaduto.'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140084633455751647)
,p_name=>'APEX.TASK.EVENT.FAIL'
,p_message_language=>'it'
,p_message_text=>'Non riuscito'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139953325535751608)
,p_name=>'APEX.TASK.EVENT.INFO_REQUEST.NOT_ALLOWED'
,p_message_language=>'it'
,p_message_text=>unistr('Il task non \00E8 assegnato o al partecipante non \00E8 consentito richiedere informazioni per il task')
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139953546665751608)
,p_name=>'APEX.TASK.EVENT.INFO_SUBMIT.NOT_ALLOWED'
,p_message_language=>'it'
,p_message_text=>unistr('Non sono state richieste informazioni per il task o al partecipante non \00E8 consentito sottomettere informazioni per il task.')
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139957137960751610)
,p_name=>'APEX.TASK.EVENT.MAXRENEW_EXPIRED_MESSAGE'
,p_message_language=>'it'
,p_message_text=>unistr('Scadenza task perch\00E9 \00E8 stato raggiunto il numero massimo di rinnovi (%0).')
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139984486524751618)
,p_name=>'APEX.TASK.EVENT.NOT_ALLOWED_BUSINESS_ADMIN'
,p_message_language=>'it'
,p_message_text=>unistr('Lo stato del task non \00E8 corretto o il partecipante non \00E8 un amministratore business per questo task')
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139984555275751618)
,p_name=>'APEX.TASK.EVENT.NOT_APPLICABLE'
,p_message_language=>'it'
,p_message_text=>unistr('L''operazione %0 \00E8 sconosciuta o non \00E8 applicabile per questo task.')
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140084775023751647)
,p_name=>'APEX.TASK.EVENT.RELEASE'
,p_message_language=>'it'
,p_message_text=>'Rilascia'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140070482789751643)
,p_name=>'APEX.TASK.EVENT.RELEASE_MESSAGE'
,p_message_language=>'it'
,p_message_text=>unistr('Task rilasciato. Ora pu\00F2 essere preso in carico da altri.')
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139963362025751611)
,p_name=>'APEX.TASK.EVENT.RELEASE_NOT_ALLOWED'
,p_message_language=>'it'
,p_message_text=>unistr('Il rilascio del task non \00E8 consentito: l''utente non \00E8 il proprietario del task')
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139980335506751616)
,p_name=>'APEX.TASK.EVENT.REMOVE_OWNER'
,p_message_language=>'it'
,p_message_text=>'Rimuovi proprietario'
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139980589752751616)
,p_name=>'APEX.TASK.EVENT.REMOVE_OWNER_MESSAGE'
,p_message_language=>'it'
,p_message_text=>'Partecipante %0 rimosso dal task'
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139957959946751610)
,p_name=>'APEX.TASK.EVENT.RENEW'
,p_message_language=>'it'
,p_message_text=>'Rinnova'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139956896488751609)
,p_name=>'APEX.TASK.EVENT.RENEW_EXPIRED_MESSAGE'
,p_message_language=>'it'
,p_message_text=>unistr('Task rinnovato con ID %0. Il numero massimo rimanente di rinnovi prima della scadenza \00E8 %1.')
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139957818887751610)
,p_name=>'APEX.TASK.EVENT.RENEW_MESSAGE'
,p_message_language=>'it'
,p_message_text=>'ID task %0 rinnovato con ID task %1'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139953892361751609)
,p_name=>'APEX.TASK.EVENT.REQUEST_INFO'
,p_message_language=>'it'
,p_message_text=>'Richiedi informazioni'
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139953721579751609)
,p_name=>'APEX.TASK.EVENT.REQUEST_INFO_MESSAGE'
,p_message_language=>'it'
,p_message_text=>'Richieste ulteriori informazioni da %0: %1'
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139951681256751608)
,p_name=>'APEX.TASK.EVENT.SET_INITIATOR_CAN_COMPLETE_MESSAGE'
,p_message_language=>'it'
,p_message_text=>unistr('Imposta Il responsabile avvio pu\00F2 eseguire il completamento su %0')
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139953916223751609)
,p_name=>'APEX.TASK.EVENT.SUBMIT_INFO'
,p_message_language=>'it'
,p_message_text=>'Sottometti informazioni'
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139953607077751608)
,p_name=>'APEX.TASK.EVENT.SUBMIT_INFO_MESSAGE'
,p_message_language=>'it'
,p_message_text=>'Informazioni richieste sottomesse a %0: %1'
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140084865094751647)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT'
,p_message_language=>'it'
,p_message_text=>'Aggiorna commento'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139981320329751617)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT_MESSAGE'
,p_message_language=>'it'
,p_message_text=>'Aggiungi commento: %0'
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139984208621751618)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT_NOT_ALLOWED'
,p_message_language=>'it'
,p_message_text=>'Lo stato del task non consente commenti'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139991595386751620)
,p_name=>'APEX.TASK.EVENT.UPDATE_DUE_DATE_MESSAGE'
,p_message_language=>'it'
,p_message_text=>'Imposta data di scadenza del task su %0'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139949617329751607)
,p_name=>'APEX.TASK.EVENT.UPDATE_DUE_ON'
,p_message_language=>'it'
,p_message_text=>'Data scadenza aggiornamento'
,p_version_scn=>2705025
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140084930825751647)
,p_name=>'APEX.TASK.EVENT.UPDATE_OWNER'
,p_message_language=>'it'
,p_message_text=>'Aggiorna proprietario'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139982636726751617)
,p_name=>'APEX.TASK.EVENT.UPDATE_OWNER_MESSAGE'
,p_message_language=>'it'
,p_message_text=>'Aggiungi proprietario potenziale %0 ai partecipanti del task'
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139981713134751617)
,p_name=>'APEX.TASK.EVENT.UPDATE_PARAM'
,p_message_language=>'it'
,p_message_text=>'Aggiorna parametri'
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140085035284751647)
,p_name=>'APEX.TASK.EVENT.UPDATE_PRIORITY'
,p_message_language=>'it'
,p_message_text=>unistr('Aggiorna priorit\00E0')
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139983308422751617)
,p_name=>'APEX.TASK.EVENT.UPDATE_PRIORITY_MESSAGE'
,p_message_language=>'it'
,p_message_text=>unistr('Impostare priorit\00E0 task su %0')
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139980638376751616)
,p_name=>'APEX.TASK.EVENT.UPD_PARAMETER_MESSAGE'
,p_message_language=>'it'
,p_message_text=>'Parametro "%0" aggiornato da "%1" a "%2".'
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139964191859751612)
,p_name=>'APEX.TASK.EVENT.WF_CANCEL_MESSAGE'
,p_message_language=>'it'
,p_message_text=>unistr('Task annullato perch\00E9 l''istanza del workflow corrispondente \00E8 stata terminata.')
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139961281278751611)
,p_name=>'APEX.TASK.FORWARD_TASK_NOT_AUTHORIZED'
,p_message_language=>'it'
,p_message_text=>'Inoltra task: non si dispone dell''autorizzazione'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139954697831751609)
,p_name=>'APEX.TASK.INITIATED_BY_USER_SINCE'
,p_message_language=>'it'
,p_message_text=>'Avviato da %0 %1'
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139963585294751611)
,p_name=>'APEX.TASK.INTERNAL_ERROR'
,p_message_language=>'it'
,p_message_text=>unistr('Si \00E8 verificato un errore interno imprevisto')
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139961846551751611)
,p_name=>'APEX.TASK.NOT_APPLICABLE'
,p_message_language=>'it'
,p_message_text=>'Operazione task non applicabile'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139987405668751618)
,p_name=>'APEX.TASK.NO_POTENTIAL_OWNER'
,p_message_language=>'it'
,p_message_text=>'Questo proprietario potenziale non esiste.'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139963178153751611)
,p_name=>'APEX.TASK.OUTCOME.APPROVED'
,p_message_language=>'it'
,p_message_text=>'Approvato'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139963257956751611)
,p_name=>'APEX.TASK.OUTCOME.REJECTED'
,p_message_language=>'it'
,p_message_text=>'Rifiutato'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139944691615751606)
,p_name=>'APEX.TASK.OUTCOME_MISSING'
,p_message_language=>'it'
,p_message_text=>unistr('Per il completamento del task \00E8 richiesto un risultato')
,p_version_scn=>2705023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139944893114751606)
,p_name=>'APEX.TASK.OUTCOME_NOT_ALLOWED'
,p_message_language=>'it'
,p_message_text=>unistr('Al task non \00E8 consentito avere un risultato')
,p_version_scn=>2705023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139980465864751616)
,p_name=>'APEX.TASK.PARAM_NOT_UPDATABLE'
,p_message_language=>'it'
,p_message_text=>'Impossibile aggiornare il parametro %0.'
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139976786109751615)
,p_name=>'APEX.TASK.PARTICIPANT_EXISTS'
,p_message_language=>'it'
,p_message_text=>unistr('Il partecipante esiste gi\00E0 per questa istanza dell''attivit\00E0.')
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140078282369751645)
,p_name=>'APEX.TASK.PRIORITY.1'
,p_message_language=>'it'
,p_message_text=>'Urgente'
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139955329608751609)
,p_name=>'APEX.TASK.PRIORITY.1.DESCRIPTION'
,p_message_language=>'it'
,p_message_text=>'Urgente'
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140078132063751645)
,p_name=>'APEX.TASK.PRIORITY.2'
,p_message_language=>'it'
,p_message_text=>'Massima'
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139955437893751609)
,p_name=>'APEX.TASK.PRIORITY.2.DESCRIPTION'
,p_message_language=>'it'
,p_message_text=>unistr('Priorit\00E0 alta')
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140078033481751645)
,p_name=>'APEX.TASK.PRIORITY.3'
,p_message_language=>'it'
,p_message_text=>'Media'
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139955514323751609)
,p_name=>'APEX.TASK.PRIORITY.3.DESCRIPTION'
,p_message_language=>'it'
,p_message_text=>unistr('Priorit\00E0 media')
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140077989214751645)
,p_name=>'APEX.TASK.PRIORITY.4'
,p_message_language=>'it'
,p_message_text=>'Bassa'
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139955666676751609)
,p_name=>'APEX.TASK.PRIORITY.4.DESCRIPTION'
,p_message_language=>'it'
,p_message_text=>unistr('Priorit\00E0 bassa')
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140077824469751645)
,p_name=>'APEX.TASK.PRIORITY.5'
,p_message_language=>'it'
,p_message_text=>'Minima'
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139955726258751609)
,p_name=>'APEX.TASK.PRIORITY.5.DESCRIPTION'
,p_message_language=>'it'
,p_message_text=>unistr('Priorit\00E0 minima')
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139961443188751611)
,p_name=>'APEX.TASK.SET_PRIORITY_NOT_AUTHORIZED'
,p_message_language=>'it'
,p_message_text=>unistr('Imposta priorit\00E0 task: non si dispone dell''autorizzazione')
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139962693635751611)
,p_name=>'APEX.TASK.STATE.ASSIGNED'
,p_message_language=>'it'
,p_message_text=>'Assegnato'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139963087886751611)
,p_name=>'APEX.TASK.STATE.CANCELLED'
,p_message_language=>'it'
,p_message_text=>'Annullato'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139962712909751611)
,p_name=>'APEX.TASK.STATE.COMPLETED'
,p_message_language=>'it'
,p_message_text=>'Completato'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139962977138751611)
,p_name=>'APEX.TASK.STATE.ERRORED'
,p_message_language=>'it'
,p_message_text=>'Con errori'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139956492172751609)
,p_name=>'APEX.TASK.STATE.EXPIRED'
,p_message_language=>'it'
,p_message_text=>'Scaduto'
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139962859989751611)
,p_name=>'APEX.TASK.STATE.FAILED'
,p_message_language=>'it'
,p_message_text=>'Non riuscito'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139953137912751608)
,p_name=>'APEX.TASK.STATE.INFO_REQUESTED'
,p_message_language=>'it'
,p_message_text=>'Informazioni richieste'
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139962542798751611)
,p_name=>'APEX.TASK.STATE.UNASSIGNED'
,p_message_language=>'it'
,p_message_text=>'Non assegnato'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139984927990751618)
,p_name=>'APEX.TASK.TASK_CREATE_ERROR'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Creazione di un nuovo task per la definizione task %0 nell''applicazione %1 non riuscita.',
'SQLCODE: %2'))
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139984807501751618)
,p_name=>'APEX.TASK.TASK_CREATE_NO_POTENTIAL_OWNER'
,p_message_language=>'it'
,p_message_text=>unistr('Il tentativo di creare un task per la definizione task %0 nell''applicazione %1 non \00E8 riuscito perch\00E9 la definizione del task non contiene proprietari potenziali: modificare la definizione del task e aggiungere almeno un partecipante di tipo Proprieta')
||'rio potenziale'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139962128742751611)
,p_name=>'APEX.TASK.TASK_DEFINITION_NOT_FOUND'
,p_message_language=>'it'
,p_message_text=>'Definizione task non trovata'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139962019376751611)
,p_name=>'APEX.TASK.TASK_DEF_PARTICIPANTS_NOT_FOUND'
,p_message_language=>'it'
,p_message_text=>'Partecipanti non trovati per il task'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139963418258751611)
,p_name=>'APEX.TASK.TASK_ID_PK_VIOLATION'
,p_message_language=>'it'
,p_message_text=>unistr('Pi\00F9 task per l''ID task specificato: consultare l''amministratore del database.')
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139962296291751611)
,p_name=>'APEX.TASK.TASK_NOT_FOUND'
,p_message_language=>'it'
,p_message_text=>'Task non trovato'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139961908078751611)
,p_name=>'APEX.TASK.TASK_PARAMETER_NOT_FOUND'
,p_message_language=>'it'
,p_message_text=>'Parametro del task non trovato'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139998286244751622)
,p_name=>'APEX.TASK.TYPE.ACTION'
,p_message_language=>'it'
,p_message_text=>'Azione'
,p_version_scn=>2705035
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139998174760751622)
,p_name=>'APEX.TASK.TYPE.APPROVAL'
,p_message_language=>'it'
,p_message_text=>'Approvazione'
,p_version_scn=>2705035
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139945588730751606)
,p_name=>'APEX.TASK.VACATION_RULE_ERROR'
,p_message_language=>'it'
,p_message_text=>'Esecuzione della procedura per la regola di ferie %2 non riuscita per la definizione task %0 nell''applicazione %1.'
,p_version_scn=>2705023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139945778895751606)
,p_name=>'APEX.TASK.VACATION_RULE_MESSAGE'
,p_message_language=>'it'
,p_message_text=>'Partecipante %1 aggiunto come sostituto del partecipante %0 . Motivo: %2.'
,p_version_scn=>2705024
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140149443791751666)
,p_name=>'APEX.TB.TOOLBAR'
,p_message_language=>'it'
,p_message_text=>'Barra degli strumenti'
,p_is_js_message=>true
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140002985523751623)
,p_name=>'APEX.TEMPLATE.APPLICATION'
,p_message_language=>'it'
,p_message_text=>'Applicazione'
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140164105840751671)
,p_name=>'APEX.TEMPLATE.EXPAND_COLLAPSE_NAV_LABEL'
,p_message_language=>'it'
,p_message_text=>'Espandi/comprimi navigazione'
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140164286029751671)
,p_name=>'APEX.TEMPLATE.EXPAND_COLLAPSE_SIDE_COL_LABEL'
,p_message_language=>'it'
,p_message_text=>'Espandi/comprimi colonna laterale'
,p_version_scn=>2705066
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140072611288751644)
,p_name=>'APEX.TEMPLATE.MAIN_NAV_LABEL'
,p_message_language=>'it'
,p_message_text=>'Navigazione principale'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139973400529751614)
,p_name=>'APEX.TEMPLATE_DIRECTIVE.INVALID_PLACEHOLDER_NAME'
,p_message_language=>'it'
,p_message_text=>unistr('"%0" \00E8 un nome segnaposto non valido.')
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140080322197751646)
,p_name=>'APEX.TIME.DAY'
,p_message_language=>'it'
,p_message_text=>'1 giorno'
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140080121169751646)
,p_name=>'APEX.TIME.HOUR'
,p_message_language=>'it'
,p_message_text=>'1 ora'
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140080403081751646)
,p_name=>'APEX.TIME.N_DAYS'
,p_message_language=>'it'
,p_message_text=>'%0 giorni'
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140080248572751646)
,p_name=>'APEX.TIME.N_HOURS'
,p_message_language=>'it'
,p_message_text=>'%0 ore'
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140080051158751646)
,p_name=>'APEX.TIME.N_MINUTES'
,p_message_language=>'it'
,p_message_text=>'%0 minuti'
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140080673538751646)
,p_name=>'APEX.TIME.N_WEEKS'
,p_message_language=>'it'
,p_message_text=>'%0 settimane'
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140080518548751646)
,p_name=>'APEX.TIME.WEEK'
,p_message_language=>'it'
,p_message_text=>'1 settimana'
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139978303796751616)
,p_name=>'APEX.TMV.SELECTION_COUNT'
,p_message_language=>'it'
,p_message_text=>'%0 elementi selezionati'
,p_is_js_message=>true
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139978534279751616)
,p_name=>'APEX.TMV.SELECTOR_LABEL'
,p_message_language=>'it'
,p_message_text=>'Seleziona elemento'
,p_is_js_message=>true
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139978495206751616)
,p_name=>'APEX.TMV.SELECTOR_LABEL_1'
,p_message_language=>'it'
,p_message_text=>'Seleziona %0'
,p_is_js_message=>true
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140167289111751672)
,p_name=>'APEX.UI.BACK_TO_TOP'
,p_message_language=>'it'
,p_message_text=>'Inizio della pagina'
,p_is_js_message=>true
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140024875058751629)
,p_name=>'APEX.UI.ENABLED'
,p_message_language=>'it'
,p_message_text=>'Abilitato'
,p_is_js_message=>true
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139993336021751620)
,p_name=>'APEX.UNHANDLED_ERROR'
,p_message_language=>'it'
,p_message_text=>'Errore durante l''elaborazione della richiesta.'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139978980857751616)
,p_name=>'APEX.UPDATE_MESSAGE_ERROR'
,p_message_language=>'it'
,p_message_text=>unistr('Impossibile aggiornare il messaggio di testo %0 poich\00E9 \00E8 sottoscritto da un''altra applicazione.')
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140082026367751646)
,p_name=>'APEX.VALUE_REQUIRED'
,p_message_language=>'it'
,p_message_text=>'Valore obbligatorio'
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139998401273751622)
,p_name=>'APEX.VISUALLY_HIDDEN_HEADING'
,p_message_language=>'it'
,p_message_text=>'Livello intestazione %0, nascosto'
,p_is_js_message=>true
,p_version_scn=>2705035
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140126823780751660)
,p_name=>'APEX.WARN_ON_UNSAVED_CHANGES'
,p_message_language=>'it'
,p_message_text=>'Questa pagina contiene modifiche non salvate.'
,p_is_js_message=>true
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139988427049751619)
,p_name=>'APEX.WF.NAVIGATOR'
,p_message_language=>'it'
,p_message_text=>'Navigator'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139988198331751619)
,p_name=>'APEX.WF.ZOOM_IN'
,p_message_language=>'it'
,p_message_text=>'Ingrandisci'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139989114098751619)
,p_name=>'APEX.WF.ZOOM_LEVEL'
,p_message_language=>'it'
,p_message_text=>'Livello di zoom {0}%'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139988274655751619)
,p_name=>'APEX.WF.ZOOM_OUT'
,p_message_language=>'it'
,p_message_text=>'Riduci'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139988352511751619)
,p_name=>'APEX.WF.ZOOM_RESET'
,p_message_language=>'it'
,p_message_text=>'Reimpostazione zoom'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139963858322751611)
,p_name=>'APEX.WF_DIAGRAM.ARIA_DESC'
,p_message_language=>'it'
,p_message_text=>unistr('Il diagramma del workflow non \00E8 accessibile al momento.')
,p_is_js_message=>true
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139963780044751611)
,p_name=>'APEX.WF_DIAGRAM.ARIA_LABEL'
,p_message_language=>'it'
,p_message_text=>'Diagramma workflow'
,p_is_js_message=>true
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139965607721751612)
,p_name=>'APEX.WORKFLOW.ACTION_NOT_ALLOWED'
,p_message_language=>'it'
,p_message_text=>unistr('L''istanza del workflow %0 \00E8 attualmente nello stato %1. Pertanto l''operazione non \00E8 consentita')
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139968270153751613)
,p_name=>'APEX.WORKFLOW.ACTIVITY.COMPLETED'
,p_message_language=>'it'
,p_message_text=>unistr('L''istanza %1 dell''attivit\00E0 %2 nel workflow %0 \00E8 stata completata')
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139968038780751613)
,p_name=>'APEX.WORKFLOW.ACTIVITY.CREATED'
,p_message_language=>'it'
,p_message_text=>unistr('Creata nuova istanza %1 dell''attivit\00E0 %2 nel workflow %0')
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139959812229751610)
,p_name=>'APEX.WORKFLOW.ACTIVITY.DATA_NOT_FOUND'
,p_message_language=>'it'
,p_message_text=>unistr('La riga di dati aggiuntiva associata a questa istanza dell''attivit\00E0 del workflow non \00E8 stata trovata')
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139968137386751613)
,p_name=>'APEX.WORKFLOW.ACTIVITY.RETRIED'
,p_message_language=>'it'
,p_message_text=>unistr('L''istanza %1 non riuscita dell''attivit\00E0 %2 nel workflow %0 \00E8 stata ritentata')
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139950175713751607)
,p_name=>'APEX.WORKFLOW.ACTIVITY.TERMINATED'
,p_message_language=>'it'
,p_message_text=>unistr('L''istanza dell''attivit\00E0 %1 nel workflow %0 \00E8 stata terminata')
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139983951861751617)
,p_name=>'APEX.WORKFLOW.ACTIVITY.TIMEOUT'
,p_message_language=>'it'
,p_message_text=>unistr('Timeout dell''istanza dell''attivit\00E0 %1 nel workflow %0. L''istanza \00E8 stata terminata.')
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139968308997751613)
,p_name=>'APEX.WORKFLOW.ACTIVITY.WAITING'
,p_message_language=>'it'
,p_message_text=>unistr('L''istanza %1 dell''attivit\00E0 %2 nel workflow %0 \00E8 nello stato In attesa')
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139949916294751607)
,p_name=>'APEX.WORKFLOW.ALTERED_AND_RESUMED'
,p_message_language=>'it'
,p_message_text=>unistr('L''istanza del workflow %0 \00E8 stata modificata e ripresa nell''attivit\00E0 %1')
,p_version_scn=>2705025
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139967389794751613)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.COMPLETED'
,p_message_language=>'it'
,p_message_text=>unistr('Istanza in attesa %1 dell''attivit\00E0 %2 nel workflow %0 completata e riuscita')
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139967137651751612)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.FAULTED'
,p_message_language=>'it'
,p_message_text=>unistr('L''attivit\00E0 in attesa %1 \00E8 stata impostata su Non riuscita perch\00E9 il workflow %0 era gi\00E0 nello stato Non riuscito prima del completamento dell''attivit\00E0')
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139967206353751612)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.TERMINATED'
,p_message_language=>'it'
,p_message_text=>unistr('L''attivit\00E0 in attesa %1 \00E8 stata interrotta perch\00E9 il workflow %0 era gi\00E0 nello stato Terminato prima del completamento dell''attivit\00E0')
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139950227992751608)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.TERMINATE_FAILED'
,p_message_language=>'it'
,p_message_text=>unistr('Interruzione dell''attivit\00E0 %1 nel workflow %0 non riuscita a causa dell''eccezione: %2')
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139965880016751612)
,p_name=>'APEX.WORKFLOW.BUSY'
,p_message_language=>'it'
,p_message_text=>unistr('Il workflow \00E8 attualmente impegnato nel completamento di un''operazione precedente. Riprovare pi\00F9 tardi')
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139981911061751617)
,p_name=>'APEX.WORKFLOW.COMPLETED_SINCE'
,p_message_language=>'it'
,p_message_text=>'Completato %0'
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139964929255751612)
,p_name=>'APEX.WORKFLOW.CONTINUE.NOT_ALLOWED'
,p_message_language=>'it'
,p_message_text=>unistr('Impossibile continuare l''esecuzione del workflow %0 poich\00E9 attualmente si trova all''attivit\00E0 %1 che non \00E8 in uno stato di attesa')
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139976829753751615)
,p_name=>'APEX.WORKFLOW.CORRELATION_CONTEXT_ERROR'
,p_message_language=>'it'
,p_message_text=>unistr('%0 non \00E8 un contesto di correlazione del workflow valido per il processo eseguito da questa attivit\00E0 del workflow. Il contesto di correlazione deve essere costituito da un testo delimitato da due punti contenente APEX_APPL_WORKFLOW seguito dall''ID is')
||unistr('tanza workflow e dall''ID istanza attivit\00E0.')
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139967508665751613)
,p_name=>'APEX.WORKFLOW.CREATED'
,p_message_language=>'it'
,p_message_text=>'Creata nuova istanza %0 del workflow %1, versione %2'
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139959681802751610)
,p_name=>'APEX.WORKFLOW.DATA_NOT_FOUND'
,p_message_language=>'it'
,p_message_text=>unistr('La riga di dati aggiuntiva associata a questa istanza del workflow non \00E8 stata trovata')
,p_version_scn=>2705028
);
end;
/
begin
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139982163492751617)
,p_name=>'APEX.WORKFLOW.DUE_SINCE'
,p_message_language=>'it'
,p_message_text=>'Scaduto %0'
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139967464363751613)
,p_name=>'APEX.WORKFLOW.END'
,p_message_language=>'it'
,p_message_text=>'Workflow %0 terminato con lo stato %1'
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139964600266751612)
,p_name=>'APEX.WORKFLOW.INCOMPATIBLE_DATA_TYPE'
,p_message_language=>'it'
,p_message_text=>unistr('Il tipo dati %1 per le condizioni confrontate nell''attivit\00E0 cambio (switch) del workflow %0 non \00E8 compatibile con l''operatore di condizione')
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139954436119751609)
,p_name=>'APEX.WORKFLOW.INITIATED_BY_USER_SINCE'
,p_message_language=>'it'
,p_message_text=>'Avviato da %0 %1'
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139977240986751615)
,p_name=>'APEX.WORKFLOW.INVOKED'
,p_message_language=>'it'
,p_message_text=>unistr('Creata la nuova istanza %0 del workflow %1, versione %2 - invocata dall''istanza dell''attivit\00E0 %4 dell''istanza del workflow %3')
,p_version_scn=>2705031
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139950075259751607)
,p_name=>'APEX.WORKFLOW.NO_ACTIVITY_FOUND'
,p_message_language=>'it'
,p_message_text=>unistr('L''attivit\00E0 con ID statico %1 non \00E8 un''attivit\00E0 nel workflow %0. Controllare l''ID statico dell''attivit\00E0 della versione del workflow corrispondente.')
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139975364184751615)
,p_name=>'APEX.WORKFLOW.REQUIRED_PARAM_MISSING'
,p_message_language=>'it'
,p_message_text=>unistr('%0 \00E8 un parametro obbligatorio per questo workflow e non deve essere NULL.')
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139967941347751613)
,p_name=>'APEX.WORKFLOW.RESUMED'
,p_message_language=>'it'
,p_message_text=>unistr('L''istanza del workflow %0 \00E8 stata ripresa')
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139967849304751613)
,p_name=>'APEX.WORKFLOW.RETRIED'
,p_message_language=>'it'
,p_message_text=>unistr('L''istanza del workflow %0 \00E8 stata ritentata')
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139982250418751617)
,p_name=>'APEX.WORKFLOW.RETRY_COUNT.EQUALS_ONE'
,p_message_language=>'it'
,p_message_text=>'%0 nuovo tentativo'
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139982346732751617)
,p_name=>'APEX.WORKFLOW.RETRY_COUNT.NOT_EQUALS_ONE'
,p_message_language=>'it'
,p_message_text=>'%0 nuovi tentativi'
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139982060336751617)
,p_name=>'APEX.WORKFLOW.STARTED_SINCE'
,p_message_language=>'it'
,p_message_text=>'Avviato %0'
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139976287256751615)
,p_name=>'APEX.WORKFLOW.STATE.ACTIVE'
,p_message_language=>'it'
,p_message_text=>'Attivo'
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139976400543751615)
,p_name=>'APEX.WORKFLOW.STATE.COMPLETED'
,p_message_language=>'it'
,p_message_text=>'Completato'
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139976579045751615)
,p_name=>'APEX.WORKFLOW.STATE.FAULTED'
,p_message_language=>'it'
,p_message_text=>'Non riuscito'
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139976611062751615)
,p_name=>'APEX.WORKFLOW.STATE.SUSPENDED'
,p_message_language=>'it'
,p_message_text=>'Sospeso'
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139976325169751615)
,p_name=>'APEX.WORKFLOW.STATE.TERMINATED'
,p_message_language=>'it'
,p_message_text=>'Terminato'
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139991670375751620)
,p_name=>'APEX.WORKFLOW.STATE.WAITING'
,p_message_language=>'it'
,p_message_text=>'In attesa'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139967644782751613)
,p_name=>'APEX.WORKFLOW.SUSPENDED'
,p_message_language=>'it'
,p_message_text=>unistr('L''istanza del workflow %0 \00E8 stata sospesa')
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139973528771751614)
,p_name=>'APEX.WORKFLOW.SWITCH.BRANCH_NOT_FOUND'
,p_message_language=>'it'
,p_message_text=>unistr('Impossibile determinare l''attivit\00E0 successiva per l''istanza del workflow %0. Verificare e correggere le condizioni definite per l''attivit\00E0 cambio (switch) corrente prima di provare a rieseguire il workflow.')
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139967750506751613)
,p_name=>'APEX.WORKFLOW.TERMINATED'
,p_message_language=>'it'
,p_message_text=>unistr('L''istanza del workflow %0 \00E8 stata terminata')
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139966806754751612)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_RESUME'
,p_message_language=>'it'
,p_message_text=>unistr('Solo l''amministratore business del workflow %0 pu\00F2 riprendere il workflow')
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139966972903751612)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_RETRY'
,p_message_language=>'it'
,p_message_text=>unistr('Il workflow %0 pu\00F2 essere ritentato solo da un amministratore business e/o da un proprietario')
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139966493240751612)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_SUSPEND'
,p_message_language=>'it'
,p_message_text=>unistr('L''istanza del workflow %0 pu\00F2 essere sospesa solo da un amministratore business del workflow')
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139966784252751612)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_TERMINATE'
,p_message_language=>'it'
,p_message_text=>'Solo i proprietari e gli amministratori business dell''istanza del workflow %0 possono terminare il workflow'
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139965168453751612)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_UPDATE'
,p_message_language=>'it'
,p_message_text=>'Le variabili del workflow %0 possono essere aggiornate solo da un amministratore business definito per il workflow'
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139979727662751616)
,p_name=>'APEX.WORKFLOW.UPDATE,NOT_ALLOWED'
,p_message_language=>'it'
,p_message_text=>'L''istanza del workflow %0 deve avere lo stato Non riuscito o Sospeso prima che le relative variabili possano essere aggiornate.'
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139971235366751614)
,p_name=>'APEX.WORKFLOW.UPDATED'
,p_message_language=>'it'
,p_message_text=>'Valore della variabile del workflow %0 aggiornato a %1'
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139981438916751617)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_ACTIVE'
,p_message_language=>'it'
,p_message_text=>'Il workflow %0 non ha una versione attiva'
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139981509883751617)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_DEV'
,p_message_language=>'it'
,p_message_text=>'Il workflow %0 non ha una versione in fase di sviluppo'
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139981605094751617)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_FOUND'
,p_message_language=>'it'
,p_message_text=>unistr('Il workflow %0 non ha una versione attiva n\00E9 in fase di sviluppo')
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139964519165751612)
,p_name=>'APEX.WORKFLOW.WORKFLOW_ACT_INSTANCE_NOT_FOUND'
,p_message_language=>'it'
,p_message_text=>unistr('L''istanza dell''attivit\00E0 %1 per l''istanza del workflow %0 non \00E8 stata trovata')
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139964364430751612)
,p_name=>'APEX.WORKFLOW.WORKFLOW_INSTANCE_NOT_FOUND'
,p_message_language=>'it'
,p_message_text=>unistr('L''istanza del workflow %0 non \00E8 stata trovata')
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139999483222751622)
,p_name=>'APEX.XLSX.ERROR.NO_ACTIVE_WORKSHEET'
,p_message_language=>'it'
,p_message_text=>'La cartella di lavoro non ha un foglio di lavoro attivo.'
,p_version_scn=>2705035
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139999309700751622)
,p_name=>'APEX.XLSX.ERROR.WORKBOOK_NOT_INITIALIZED'
,p_message_language=>'it'
,p_message_text=>unistr('La cartella di lavoro non \00E8 stata inizializzata.')
,p_version_scn=>2705035
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139999288970751622)
,p_name=>'APEX.XLSX.INTERNAL_ERROR'
,p_message_language=>'it'
,p_message_text=>unistr('Si \00E8 verificato un errore interno durante la creazione del file XLSX.')
,p_version_scn=>2705035
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140001736588751623)
,p_name=>'APEX.XLSX.SHEET'
,p_message_language=>'it'
,p_message_text=>'Foglio'
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140012320619751626)
,p_name=>'APEX.XLSX.SHEET_NAME_TAKEN'
,p_message_language=>'it'
,p_message_text=>unistr('Il nome del foglio di lavoro "%0" \00E8 gi\00E0 utilizzato. Provare un nome diverso.')
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140140911667751664)
,p_name=>'APEXIR_ACTIONS'
,p_message_language=>'it'
,p_message_text=>'Azioni'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140055909557751639)
,p_name=>'APEXIR_ACTIONS_MENU'
,p_message_language=>'it'
,p_message_text=>'Menu Azioni'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140051633916751637)
,p_name=>'APEXIR_ADD_FUNCTION'
,p_message_language=>'it'
,p_message_text=>'Aggiungi funzione'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140051591296751637)
,p_name=>'APEXIR_ADD_GROUP_BY_COLUMN'
,p_message_language=>'it'
,p_message_text=>'Aggiungi colonna Raggruppa per'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140089170949751648)
,p_name=>'APEXIR_ADD_PIVOT_COLUMN'
,p_message_language=>'it'
,p_message_text=>'Aggiungi colonna pivot'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140089264657751648)
,p_name=>'APEXIR_ADD_ROW_COLUMN'
,p_message_language=>'it'
,p_message_text=>'Aggiungi colonna righe'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140023680453751629)
,p_name=>'APEXIR_AGGREGATE'
,p_message_language=>'it'
,p_message_text=>'Aggregato'
,p_is_js_message=>true
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140062106701751641)
,p_name=>'APEXIR_AGGREGATION'
,p_message_language=>'it'
,p_message_text=>'Aggregazione'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140043007833751635)
,p_name=>'APEXIR_AGG_AVG'
,p_message_language=>'it'
,p_message_text=>'Media'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140047329460751636)
,p_name=>'APEXIR_AGG_COUNT'
,p_message_language=>'it'
,p_message_text=>'Conteggio'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140043158342751635)
,p_name=>'APEXIR_AGG_MAX'
,p_message_language=>'it'
,p_message_text=>'Massimo'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140043345788751635)
,p_name=>'APEXIR_AGG_MEDIAN'
,p_message_language=>'it'
,p_message_text=>'Mediana'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140043255194751635)
,p_name=>'APEXIR_AGG_MIN'
,p_message_language=>'it'
,p_message_text=>'Minimo'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140042940259751635)
,p_name=>'APEXIR_AGG_SUM'
,p_message_language=>'it'
,p_message_text=>'Somma %0'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140044034393751635)
,p_name=>'APEXIR_ALL'
,p_message_language=>'it'
,p_message_text=>'Tutto'
,p_is_js_message=>true
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140022914463751629)
,p_name=>'APEXIR_ALL_COLUMNS'
,p_message_language=>'it'
,p_message_text=>'Tutte le colonne'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140003008958751623)
,p_name=>'APEXIR_ALL_ROWS'
,p_message_language=>'it'
,p_message_text=>'Tutte le righe'
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140137969316751663)
,p_name=>'APEXIR_ALTERNATIVE'
,p_message_language=>'it'
,p_message_text=>'Alternativo'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140139558545751663)
,p_name=>'APEXIR_ALTERNATIVE_DEFAULT_NAME'
,p_message_language=>'it'
,p_message_text=>'Predefinito alternativo:  %0 '
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140037198460751633)
,p_name=>'APEXIR_AND'
,p_message_language=>'it'
,p_message_text=>'e'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140071963838751643)
,p_name=>'APEXIR_API.IMPORT_CONTENT_CORRUPTED'
,p_message_language=>'it'
,p_message_text=>unistr('Impossibile importare il report salvato. Il contenuto \00E8 danneggiato.')
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140072070619751643)
,p_name=>'APEXIR_API.IMPORT_CONTENT_EMPTY'
,p_message_language=>'it'
,p_message_text=>unistr('Impossibile importare il report salvato. Il contenuto \00E8 vuoto.')
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140025131016751630)
,p_name=>'APEXIR_APPLY'
,p_message_language=>'it'
,p_message_text=>'Applica'
,p_is_js_message=>true
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140018701164751628)
,p_name=>'APEXIR_ASCENDING'
,p_message_language=>'it'
,p_message_text=>'Crescente'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140040299362751634)
,p_name=>'APEXIR_AS_OF'
,p_message_language=>'it'
,p_message_text=>'A partire da %0'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140140109751751664)
,p_name=>'APEXIR_AVERAGE_X'
,p_message_language=>'it'
,p_message_text=>'Media %0'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140131780174751661)
,p_name=>'APEXIR_BAR'
,p_message_language=>'it'
,p_message_text=>'A barre'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140024419254751629)
,p_name=>'APEXIR_BETWEEN'
,p_message_language=>'it'
,p_message_text=>'tra'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140017597289751627)
,p_name=>'APEXIR_BGCOLOR'
,p_message_language=>'it'
,p_message_text=>'Colore sfondo'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140019440729751628)
,p_name=>'APEXIR_BLUE'
,p_message_language=>'it'
,p_message_text=>'blu'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140053520082751638)
,p_name=>'APEXIR_BOTTOM'
,p_message_language=>'it'
,p_message_text=>'In basso'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139984392292751618)
,p_name=>'APEXIR_BTNS_NEXT_TO_SEARCH_OF'
,p_message_language=>'it'
,p_message_text=>'Pulsanti accanto alla barra di ricerca di %0'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140020087347751628)
,p_name=>'APEXIR_CANCEL'
,p_message_language=>'it'
,p_message_text=>'Annulla'
,p_is_js_message=>true
,p_version_scn=>2705040
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140026362296751630)
,p_name=>'APEXIR_CATEGORY'
,p_message_language=>'it'
,p_message_text=>'Categoria'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140017473141751627)
,p_name=>'APEXIR_CELL'
,p_message_language=>'it'
,p_message_text=>'Cella'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140043962602751635)
,p_name=>'APEXIR_CHART'
,p_message_language=>'it'
,p_message_text=>'Grafico'
,p_is_js_message=>true
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140054481717751638)
,p_name=>'APEXIR_CHART_INITIALIZING'
,p_message_language=>'it'
,p_message_text=>'Inizializzazione in corso...'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140094192737751650)
,p_name=>'APEXIR_CHART_LABEL_NOT_NULL'
,p_message_language=>'it'
,p_message_text=>'Specificare l''etichetta del grafico.'
,p_version_scn=>2705051
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140106532356751654)
,p_name=>'APEXIR_CHART_MAX_DATAPOINT_CNT'
,p_message_language=>'it'
,p_message_text=>'La query supera il numero massimo di %0 datapoint per grafico. Applicare un filtro per ridurre il numero di record nella query di base.'
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140105495225751653)
,p_name=>'APEXIR_CHART_MAX_ROW_CNT'
,p_message_language=>'it'
,p_message_text=>'Il conteggio massimo di righe per una query di tipo Grafico limita il numero di righe nella query di base, non il numero di righe visualizzate. La query di base supera il conteggio massimo di righe pari a %0 righe. Applicare un filtro per ridurre il '
||'numero di record nella query di base.'
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140023068984751629)
,p_name=>'APEXIR_CHART_TYPE'
,p_message_language=>'it'
,p_message_text=>'Tipo di grafico'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139986949509751618)
,p_name=>'APEXIR_CHART_VIEW_OF'
,p_message_language=>'it'
,p_message_text=>'Vista grafico di %0'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140102193300751652)
,p_name=>'APEXIR_CHECK_ALL'
,p_message_language=>'it'
,p_message_text=>'Seleziona tutto'
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140040616407751634)
,p_name=>'APEXIR_CHOOSE_DOWNLOAD_FORMAT'
,p_message_language=>'it'
,p_message_text=>'Scegliere il formato del report'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140048466801751636)
,p_name=>'APEXIR_CLEAR'
,p_message_language=>'it'
,p_message_text=>'cancellare'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140019996021751628)
,p_name=>'APEXIR_COLUMN'
,p_message_language=>'it'
,p_message_text=>'Colonna'
,p_version_scn=>2705040
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140059784103751640)
,p_name=>'APEXIR_COLUMNS'
,p_message_language=>'it'
,p_message_text=>'Colonne'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140026975722751630)
,p_name=>'APEXIR_COLUMN_ALIASES'
,p_message_language=>'it'
,p_message_text=>'Alias colonne'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140134539206751662)
,p_name=>'APEXIR_COLUMN_FILTER'
,p_message_language=>'it'
,p_message_text=>'Filtra...'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139994792048751621)
,p_name=>'APEXIR_COLUMN_HEADER'
,p_message_language=>'it'
,p_message_text=>'Intestazione colonna'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140008801753751625)
,p_name=>'APEXIR_COLUMN_HEADER_ACTIONS'
,p_message_language=>'it'
,p_message_text=>'Azioni colonna'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140009133679751625)
,p_name=>'APEXIR_COLUMN_HEADER_ACTIONS_FOR'
,p_message_language=>'it'
,p_message_text=>'Azioni per la colonna "%0"'
,p_is_js_message=>true
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140050583630751637)
,p_name=>'APEXIR_COLUMN_HEADING_MENU'
,p_message_language=>'it'
,p_message_text=>'Menu Intestazione colonna'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140054265741751638)
,p_name=>'APEXIR_COLUMN_INFO'
,p_message_language=>'it'
,p_message_text=>'Informazioni colonna'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140136829177751663)
,p_name=>'APEXIR_COLUMN_LABEL'
,p_message_language=>'it'
,p_message_text=>'Etichetta colonna'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140051983921751638)
,p_name=>'APEXIR_COLUMN_N'
,p_message_language=>'it'
,p_message_text=>'Colonna %0'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140034826349751632)
,p_name=>'APEXIR_COMPARISON_CONTAINS'
,p_message_language=>'it'
,p_message_text=>'contiene'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140036157089751633)
,p_name=>'APEXIR_COMPARISON_DOESNOT_CONTAIN'
,p_message_language=>'it'
,p_message_text=>'non contiene'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140018454607751628)
,p_name=>'APEXIR_COMPARISON_IN'
,p_message_language=>'it'
,p_message_text=>'in'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140036324578751633)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_LAST'
,p_message_language=>'it'
,p_message_text=>unistr('non \00E8 negli ultimi')
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140045457970751636)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_NEXT'
,p_message_language=>'it'
,p_message_text=>unistr('non \00E8 nei prossimi')
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140036262634751633)
,p_name=>'APEXIR_COMPARISON_IS_IN_LAST'
,p_message_language=>'it'
,p_message_text=>unistr('\00E8 negli ultimi')
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140045372406751636)
,p_name=>'APEXIR_COMPARISON_IS_IN_NEXT'
,p_message_language=>'it'
,p_message_text=>unistr('\00E8 nei prossimi')
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140018387285751628)
,p_name=>'APEXIR_COMPARISON_IS_NOT_NULL'
,p_message_language=>'it'
,p_message_text=>unistr('non \00E8 nullo')
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140018298286751628)
,p_name=>'APEXIR_COMPARISON_IS_NULL'
,p_message_language=>'it'
,p_message_text=>unistr('\00E8 nullo')
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140018004070751627)
,p_name=>'APEXIR_COMPARISON_LIKE'
,p_message_language=>'it'
,p_message_text=>'simile a'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140018520404751628)
,p_name=>'APEXIR_COMPARISON_NOT_IN'
,p_message_language=>'it'
,p_message_text=>'non in'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140018193089751628)
,p_name=>'APEXIR_COMPARISON_NOT_LIKE'
,p_message_language=>'it'
,p_message_text=>'non simile a'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140035135953751633)
,p_name=>'APEXIR_COMPARISON_REGEXP_LIKE'
,p_message_language=>'it'
,p_message_text=>'corrisponde all''espressione regolare'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140040595538751634)
,p_name=>'APEXIR_COMPUTATION'
,p_message_language=>'it'
,p_message_text=>'Calcolo'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140105106385751653)
,p_name=>'APEXIR_COMPUTATION_EXPRESSION'
,p_message_language=>'it'
,p_message_text=>'Espressione di calcolo'
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140060039075751640)
,p_name=>'APEXIR_COMPUTATION_FOOTER'
,p_message_language=>'it'
,p_message_text=>'Creare un calcolo utilizzando alias di colonna.'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140060112101751640)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E1'
,p_message_language=>'it'
,p_message_text=>'(B+C)*100'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140060200572751640)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E2'
,p_message_language=>'it'
,p_message_text=>'INITCAP(B)||'', ''||INITCAP(C)'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140060343984751640)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E3'
,p_message_language=>'it'
,p_message_text=>'CASE WHEN A = 10 THEN B + C ELSE B END'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140001282961751623)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E4'
,p_message_language=>'it'
,p_message_text=>'ROUND(C / 1000000)'
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140044785077751635)
,p_name=>'APEXIR_COMPUTE'
,p_message_language=>'it'
,p_message_text=>'Calcola'
,p_is_js_message=>true
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140052553716751638)
,p_name=>'APEXIR_CONTROL_BREAK'
,p_message_language=>'it'
,p_message_text=>'Interruzione di controllo'
,p_is_js_message=>true
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140055523537751639)
,p_name=>'APEXIR_CONTROL_BREAKS'
,p_message_language=>'it'
,p_message_text=>'Interruzioni di controllo'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140142189245751664)
,p_name=>'APEXIR_CONTROL_BREAK_COLUMNS'
,p_message_language=>'it'
,p_message_text=>'Colonne di interruzione controllo'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139997905861751622)
,p_name=>'APEXIR_COUNT_DISTINCT'
,p_message_language=>'it'
,p_message_text=>'Conteggio distinti'
,p_version_scn=>2705035
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140140611936751664)
,p_name=>'APEXIR_COUNT_DISTINCT_X'
,p_message_language=>'it'
,p_message_text=>'Conteggio distinti'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140140542864751664)
,p_name=>'APEXIR_COUNT_X'
,p_message_language=>'it'
,p_message_text=>'Conteggio %0'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140113588788751656)
,p_name=>'APEXIR_DAILY'
,p_message_language=>'it'
,p_message_text=>'Giornaliero'
,p_version_scn=>2705058
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140166878136751672)
,p_name=>'APEXIR_DATA'
,p_message_language=>'it'
,p_message_text=>'Dati'
,p_is_js_message=>true
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140054334096751638)
,p_name=>'APEXIR_DATA_AS_OF'
,p_message_language=>'it'
,p_message_text=>unistr('Dati del report cos\00EC come si presentavano %0 minuti fa.')
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139987328111751618)
,p_name=>'APEXIR_DATA_VIEW_OF'
,p_message_language=>'it'
,p_message_text=>'Vista dati di %0'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140023749515751629)
,p_name=>'APEXIR_DATE'
,p_message_language=>'it'
,p_message_text=>'Data'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140058204329751639)
,p_name=>'APEXIR_DEFAULT'
,p_message_language=>'it'
,p_message_text=>'Predefinito'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140137704669751663)
,p_name=>'APEXIR_DEFAULT_REPORT_TYPE'
,p_message_language=>'it'
,p_message_text=>'Tipo di report predefinito'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140020179238751628)
,p_name=>'APEXIR_DELETE'
,p_message_language=>'it'
,p_message_text=>'Elimina'
,p_is_js_message=>true
,p_version_scn=>2705040
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140024010300751629)
,p_name=>'APEXIR_DELETE_CONFIRM'
,p_message_language=>'it'
,p_message_text=>'Eliminare queste impostazioni di report?'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140124518924751659)
,p_name=>'APEXIR_DELETE_DEFAULT_REPORT'
,p_message_language=>'it'
,p_message_text=>'Elimina report predefinito'
,p_is_js_message=>true
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140052274781751638)
,p_name=>'APEXIR_DELETE_REPORT'
,p_message_language=>'it'
,p_message_text=>'Elimina report'
,p_is_js_message=>true
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140018845239751628)
,p_name=>'APEXIR_DESCENDING'
,p_message_language=>'it'
,p_message_text=>'Decrescente'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140026491064751630)
,p_name=>'APEXIR_DESCRIPTION'
,p_message_language=>'it'
,p_message_text=>'Descrizione'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140050444322751637)
,p_name=>'APEXIR_DETAIL_VIEW'
,p_message_language=>'it'
,p_message_text=>'Vista a riga singola'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140058775830751640)
,p_name=>'APEXIR_DIRECTION'
,p_message_language=>'it'
,p_message_text=>'Direzione %0'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140059631182751640)
,p_name=>'APEXIR_DISABLED'
,p_message_language=>'it'
,p_message_text=>'Disabilitato'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140019646367751628)
,p_name=>'APEXIR_DISPLAYED'
,p_message_language=>'it'
,p_message_text=>'Visualizzato'
,p_version_scn=>2705040
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140022803596751629)
,p_name=>'APEXIR_DISPLAYED_COLUMNS'
,p_message_language=>'it'
,p_message_text=>'Colonne visualizzate'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140058686445751640)
,p_name=>'APEXIR_DISPLAY_IN_REPORT'
,p_message_language=>'it'
,p_message_text=>'Visualizza nel report'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140053463198751638)
,p_name=>'APEXIR_DOWN'
,p_message_language=>'it'
,p_message_text=>unistr('Gi\00F9')
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140044854635751635)
,p_name=>'APEXIR_DOWNLOAD'
,p_message_language=>'it'
,p_message_text=>'Scarica'
,p_is_js_message=>true
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140058513378751640)
,p_name=>'APEXIR_DO_NOT_DISPLAY'
,p_message_language=>'it'
,p_message_text=>'Non visualizzare'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140127840875751660)
,p_name=>'APEXIR_DUPLICATE_HIGHLIGHT_COND'
,p_message_language=>'it'
,p_message_text=>unistr('L''evidenziazione con la stessa condizione esiste gi\00E0.')
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140142388145751664)
,p_name=>'APEXIR_DUPLICATE_PIVOT_COLUMN'
,p_message_language=>'it'
,p_message_text=>'Colonna pivot duplicata. La colonna pivot deve essere univoca.'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140142536986751664)
,p_name=>'APEXIR_EDIT'
,p_message_language=>'it'
,p_message_text=>'Modifica'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140054571435751638)
,p_name=>'APEXIR_EDIT_CHART'
,p_message_language=>'it'
,p_message_text=>'Modifica impostazioni grafico'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140061128685751640)
,p_name=>'APEXIR_EDIT_CHART2'
,p_message_language=>'it'
,p_message_text=>'Modifica grafico'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140025000234751630)
,p_name=>'APEXIR_EDIT_CONTROL_BREAK'
,p_message_language=>'it'
,p_message_text=>'Modifica interruzione di controllo'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140061541260751640)
,p_name=>'APEXIR_EDIT_FILTER'
,p_message_language=>'it'
,p_message_text=>'Modifica filtro'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140028066329751630)
,p_name=>'APEXIR_EDIT_FLASHBACK'
,p_message_language=>'it'
,p_message_text=>'Modifica flashback'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140119376127751657)
,p_name=>'APEXIR_EDIT_GROUP_BY'
,p_message_language=>'it'
,p_message_text=>'Modifica raggruppamento'
,p_version_scn=>2705059
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140061400062751640)
,p_name=>'APEXIR_EDIT_HIGHLIGHT'
,p_message_language=>'it'
,p_message_text=>'Modifica evidenziazione'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140089423527751649)
,p_name=>'APEXIR_EDIT_PIVOT'
,p_message_language=>'it'
,p_message_text=>'Modifica pivot'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140048826944751637)
,p_name=>'APEXIR_EDIT_REPORT'
,p_message_language=>'it'
,p_message_text=>'Modifica report'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140138088328751663)
,p_name=>'APEXIR_EMAIL'
,p_message_language=>'it'
,p_message_text=>'Posta elettronica'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140010207981751625)
,p_name=>'APEXIR_EMAIL_ADDRESS'
,p_message_language=>'it'
,p_message_text=>'Indirizzo di posta elettronica'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140138389433751663)
,p_name=>'APEXIR_EMAIL_BCC'
,p_message_language=>'it'
,p_message_text=>'Ccn'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140138596916751663)
,p_name=>'APEXIR_EMAIL_BODY'
,p_message_language=>'it'
,p_message_text=>'Corpo'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140138296736751663)
,p_name=>'APEXIR_EMAIL_CC'
,p_message_language=>'it'
,p_message_text=>'Cc'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140139022944751663)
,p_name=>'APEXIR_EMAIL_FREQUENCY'
,p_message_language=>'it'
,p_message_text=>'Frequenza'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140015450119751627)
,p_name=>'APEXIR_EMAIL_NOT_CONFIGURED'
,p_message_language=>'it'
,p_message_text=>'Posta elettronica non configurata per questa applicazione. Contattare l''amministratore.'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140112862412751655)
,p_name=>'APEXIR_EMAIL_REQUIRED'
,p_message_language=>'it'
,p_message_text=>'Specificare l''indirizzo di posta elettronica.'
,p_version_scn=>2705056
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140138681034751663)
,p_name=>'APEXIR_EMAIL_SEE_ATTACHED'
,p_message_language=>'it'
,p_message_text=>'Vedere l''allegato'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140138429285751663)
,p_name=>'APEXIR_EMAIL_SUBJECT'
,p_message_language=>'it'
,p_message_text=>'Oggetto'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140113889443751656)
,p_name=>'APEXIR_EMAIL_SUBJECT_REQUIRED'
,p_message_language=>'it'
,p_message_text=>'Specificare l''oggetto del messaggio di posta elettronica.'
,p_version_scn=>2705058
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140138134773751663)
,p_name=>'APEXIR_EMAIL_TO'
,p_message_language=>'it'
,p_message_text=>'A'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140017232906751627)
,p_name=>'APEXIR_ENABLED'
,p_message_language=>'it'
,p_message_text=>'Abilitato'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140061377208751640)
,p_name=>'APEXIR_ENABLE_DISABLE_ALT'
,p_message_language=>'it'
,p_message_text=>'Abilita/disabilita'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140060833422751640)
,p_name=>'APEXIR_ERROR_LANDMARK'
,p_message_language=>'it'
,p_message_text=>'Errore. %0'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140060467930751640)
,p_name=>'APEXIR_EXAMPLES'
,p_message_language=>'it'
,p_message_text=>'Esempi'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140061253110751640)
,p_name=>'APEXIR_EXAMPLES_WITH_COLON'
,p_message_language=>'it'
,p_message_text=>'Esempi:'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140022723819751629)
,p_name=>'APEXIR_EXCLUDE_NULL'
,p_message_language=>'it'
,p_message_text=>'Escludi valori nulli'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140061850008751640)
,p_name=>'APEXIR_EXPAND_COLLAPSE_ALT'
,p_message_language=>'it'
,p_message_text=>'Espandi/comprimi'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140059493406751640)
,p_name=>'APEXIR_EXPRESSION'
,p_message_language=>'it'
,p_message_text=>'Espressione'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140044371232751635)
,p_name=>'APEXIR_FILTER'
,p_message_language=>'it'
,p_message_text=>'Filtra'
,p_is_js_message=>true
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140055432150751639)
,p_name=>'APEXIR_FILTERS'
,p_message_language=>'it'
,p_message_text=>'Filtri'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140066174275751642)
,p_name=>'APEXIR_FILTER_EXPRESSION'
,p_message_language=>'it'
,p_message_text=>'Espressione di filtro'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140164319067751671)
,p_name=>'APEXIR_FILTER_EXPR_TOO_LONG'
,p_message_language=>'it'
,p_message_text=>unistr('L''espressione di filtro \00E8 troppo lunga.')
,p_version_scn=>2705066
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140009058865751625)
,p_name=>'APEXIR_FILTER_SUGGESTIONS'
,p_message_language=>'it'
,p_message_text=>'Filtra suggerimenti'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140066087096751642)
,p_name=>'APEXIR_FILTER_TYPE'
,p_message_language=>'it'
,p_message_text=>'Tipo di filtro'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140062045737751641)
,p_name=>'APEXIR_FINDER_ALT'
,p_message_language=>'it'
,p_message_text=>'Selezionare le colonne in cui cercare'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140044682309751635)
,p_name=>'APEXIR_FLASHBACK'
,p_message_language=>'it'
,p_message_text=>'Flashback'
,p_is_js_message=>true
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140059256430751640)
,p_name=>'APEXIR_FLASHBACK_DESCRIPTION'
,p_message_language=>'it'
,p_message_text=>unistr('La funzione Flashback query consente di visualizzare i dati cos\00EC come si presentavano in un precedente point-in-time.')
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140113252804751656)
,p_name=>'APEXIR_FLASHBACK_LABEL'
,p_message_language=>'it'
,p_message_text=>'Durata flashback'
,p_version_scn=>2705058
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140114628235751656)
,p_name=>'APEXIR_FORMAT'
,p_message_language=>'it'
,p_message_text=>'Formato'
,p_is_js_message=>true
,p_version_scn=>2705058
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140040419137751634)
,p_name=>'APEXIR_FORMAT_MASK'
,p_message_language=>'it'
,p_message_text=>'Formato di visualizzazione %0'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140052197275751638)
,p_name=>'APEXIR_FUNCTION'
,p_message_language=>'it'
,p_message_text=>'Funzione'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140059965686751640)
,p_name=>'APEXIR_FUNCTIONS'
,p_message_language=>'it'
,p_message_text=>'Funzioni %0'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140137662698751663)
,p_name=>'APEXIR_FUNCTIONS_OPERATORS'
,p_message_language=>'it'
,p_message_text=>'Funzioni/operatori'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140051848007751637)
,p_name=>'APEXIR_FUNCTION_N'
,p_message_language=>'it'
,p_message_text=>'Funzione %0'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140044109769751635)
,p_name=>'APEXIR_GO'
,p_message_language=>'it'
,p_message_text=>'Vai'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140017790754751627)
,p_name=>'APEXIR_GREEN'
,p_message_language=>'it'
,p_message_text=>'verde'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140062778372751641)
,p_name=>'APEXIR_GROUPBY_COLUMNS'
,p_message_language=>'it'
,p_message_text=>'Raggruppa per colonne'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140062879619751641)
,p_name=>'APEXIR_GROUPBY_FUNCTIONS'
,p_message_language=>'it'
,p_message_text=>'Funzioni di raggruppamento'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139998075846751622)
,p_name=>'APEXIR_GROUP_BY'
,p_message_language=>'it'
,p_message_text=>'Raggruppa per '
,p_is_js_message=>true
,p_version_scn=>2705035
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140138793982751663)
,p_name=>'APEXIR_GROUP_BY_COLUMN'
,p_message_language=>'it'
,p_message_text=>'Raggruppa per colonna %0'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140094258405751650)
,p_name=>'APEXIR_GROUP_BY_COL_NOT_NULL'
,p_message_language=>'it'
,p_message_text=>'Specificare la colonna Raggruppa per.'
,p_version_scn=>2705051
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140105313668751653)
,p_name=>'APEXIR_GROUP_BY_MAX_ROW_CNT'
,p_message_language=>'it'
,p_message_text=>'Il conteggio massimo di righe per una query di tipo Raggruppa per limita il numero di righe nella query di base, non il numero di righe visualizzate. La query di base supera il conteggio massimo di righe pari a %0 righe. Applicare un filtro per ridur'
||'re il numero di record nella query di base.'
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140085577035751647)
,p_name=>'APEXIR_GROUP_BY_SORT'
,p_message_language=>'it'
,p_message_text=>'Raggruppa per ordinamento'
,p_is_js_message=>true
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140142270131751664)
,p_name=>'APEXIR_GROUP_BY_SORT_ORDER'
,p_message_language=>'it'
,p_message_text=>'Raggruppa per criterio ordinamento'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139987159192751618)
,p_name=>'APEXIR_GROUP_BY_VIEW_OF'
,p_message_language=>'it'
,p_message_text=>'Vista Raggruppa per di %0'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140023194849751629)
,p_name=>'APEXIR_HCOLUMN'
,p_message_language=>'it'
,p_message_text=>'A colonne orizzontali'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140057164640751639)
,p_name=>'APEXIR_HELP'
,p_message_language=>'it'
,p_message_text=>'Guida'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140048903678751637)
,p_name=>'APEXIR_HELP_01'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('I report interattivi consentono agli utenti finali di personalizzare i report. \00C8 possibile modificare il layout dei dati del report selezionando le colonne desiderate, applicando filtri, evidenziando e ordinando gli elementi. Gli utenti possono inolt')
||unistr('re definire interruzioni, aggregazioni, grafici e raggruppamenti nonch\00E9 aggiungere calcoli. \00C8 inoltre possibile impostare una sottoscrizione per inviare via posta elettronica una versione HTML del report in base all''intervallo specificato. Gli utenti')
||' possono creare varie versioni di un report e salvarle come report denominati, visualizzabili pubblicamente o privatamente. ',
'<p/>',
unistr('Le sezioni seguenti contengono il riepilogo delle varie modalit\00E0 di personalizzazione di un report interattivo. Per ulteriori informazioni, vedere "Uso dei report interattivi" nella <i>Guida per l''utente finale di Oracle APEX</i>.')))
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140056098277751639)
,p_name=>'APEXIR_HELP_ACTIONS_MENU'
,p_message_language=>'it'
,p_message_text=>unistr('Il menu Azioni \00E8 visualizzato a destra del pulsante Vai nella barra di ricerca. Utilizzare questo menu per personalizzare un report interattivo.')
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140049771854751637)
,p_name=>'APEXIR_HELP_AGGREGATE'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Gli aggregati sono calcoli matematici eseguiti su una colonna. Gli aggregati vengono visualizzati dopo ogni interruzione di controllo e alla fine del report all''interno della colonna in cui sono definiti. Opzioni disponibili:',
'<p>',
'</p><ul>',
'<li><strong>Aggregazione</strong>: consente di selezionare un''aggregazione definita',
'in precedenza per modificarla.</li>',
'<li><strong>Funzione</strong>: la funzione da eseguire (ad esempio SUM, MIN).</li>',
'<li><strong>Colonna</strong>: consente di selezionare la colonna a cui applicare la funzione matematica. Verranno visualizzate solo le',
'colonne numeriche.</li>',
'</ul>'))
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140049834360751637)
,p_name=>'APEXIR_HELP_CHART'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\00C8 possibile definire un grafico per report salvato. Dopo'),
unistr('aver definito il grafico, \00E8 possibile alternare le viste grafico e report utilizzando le icone specifiche della barra di ricerca.'),
'Di seguito sono riportate le opzioni disponibili.',
'<p>',
'</p><ul>',
'<li><strong>Tipo di grafico</strong>: identifica il tipo di grafico da includere.',
'Selezionare tra grafico a barre orizzontali, a barre verticali, a torta o a linee.</li>',
'<li><strong>Etichetta</strong>: consente di selezionare la colonna da utilizzare come etichetta.</li>',
unistr('<li><strong>Titolo asse per etichetta</strong>: il titolo che verr\00E0 visualizzato sull''asse associato alla colonna selezionata'),
'per Etichetta. Non disponibile per il grafico a torta.</li>',
'<li><strong>Valore</strong>: consente di selezionare la colonna da utilizzare come valore. Se la funzione',
unistr('\00E8 COUNT, non \00E8 necessario selezionare un valore.</li>'),
unistr('<li><strong>Titolo asse per valore</strong>: il titolo che verr\00E0 visualizzato sull''asse associato alla colonna selezionata'),
'per Valore. Non disponibile per il grafico a torta.</li>',
'<li><strong>Funzione</strong>: funzione facoltativa da eseguire sulla colonna selezionata per Valore.</li>',
'<li><strong>Ordina</strong>: consente di ordinare il set di risultati.</li></ul>'))
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140049192215751637)
,p_name=>'APEXIR_HELP_COLUMN_HEADING_MENU'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Quando si fa clic su un''intestazione di colonna qualsiasi viene visualizzato un menu Intestazione colonna. Opzioni disponibili:',
'<p></p>',
'<ul>',
'<li><strong>Icona Ordinamento crescente</strong>: ordina il report in base alla colonna con ordinamento crescente.</li>',
'<li><strong>Icona Ordinamento decrescente</strong>: ordina il report in base alla colonna con ordinamento decrescente.</li>',
unistr('<li><strong>Nascondi colonna</strong>: nasconde la colonna. Non tutte le colonne possono essere nascoste. Se non \00E8 possibile nascondere una colonna, non sar\00E0 presente l''icona Nascondi colonna.</li>'),
'<li><strong>Colonna di interruzione</strong>: crea un gruppo di interruzione sulla colonna. La colonna viene estratta dal report e visualizzata come record principale.</li>',
'<li><strong>Informazioni colonna</strong>: visualizza il testo della Guida relativo alla colonna, se disponibile.</li>',
'<li><strong>Area di testo</strong>: questa voce di menu viene utilizzata per l''immissione di criteri',
unistr('di ricerca senza distinzione tra maiuscole e minuscole (non occorrono caratteri jolly). L''immissione di un valore comporta la riduzione della lista di valori alla fine del menu. \00C8 quindi possibile selezionare un valore'),
unistr('nella parte inferiore e il valore selezionato verr\00E0 creato come filtro con l''operatore ''='''),
unistr('(ad esempio, <code>column = ''ABC''</code>). In alternativa \00E8 possibile fare clic sull''icona a forma di torcia elettrica e immettere un valore da creare come filtro con'),
'il modificatore ''LIKE'' (ad esempio, <code>column LIKE ''%ABC%''</code>).</li>',
'<li><strong>Lista di valori univoci</strong> contiene i primi 500 valori univoci',
unistr('che soddisfano i criteri di filtro. Se la colonna \00E8 di tipo data, viene'),
'visualizzata una lista di intervalli di date. Se si seleziona un valore,',
unistr('verr\00E0 creato un filtro con l''operatore ''='' (ad esempio, <code>column = ''ABC''</code>).</li>'),
'</ul>'))
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140049672522751637)
,p_name=>'APEXIR_HELP_COMPUTE'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Consente di aggiungere colonne calcolate al report. Pu\00F2 trattarsi di calcoli matematici (ad esempio <code>NBR_HOURS/24</code>) o di funzioni Oracle'),
unistr('standard applicate a colonne esistenti (alcune sono state visualizzate ed \00E8 possibile utilizzarne altre, ad esempio <code>TO_DATE)</code>). Opzioni disponibili:'),
'<p></p>',
'<ul>',
'<li><strong>Calcolo</strong>: consente di selezionare un calcolo definito in precedenza per modificarlo.</li>',
'<li><strong>Intestazione colonna</strong>: l''intestazione della nuova colonna.</li>',
'<li><strong>Formato di visualizzazione</strong>: il formato di visualizzazione Oracle da applicare alla colonna (ad esempio S9999).</li>',
'<li><strong>Calcolo</strong>: il calcolo da eseguire. All''interno del calcolo per fare riferimento alle colonne si utilizzano gli alias visualizzati.</li>',
'</ul>',
'<p>Sotto il calcolo vengono visualizzate le colonne della query con',
'i rispettivi alias associati. Quando si fa clic sul nome o l''alias della colonna, ',
unistr('gli elementi vengono scritti nel calcolo. Accanto alle colonne \00E8 disponibile un tastierino,'),
unistr('che funge da scelta rapida per i tasti pi\00F9 utilizzati. A destra si trovano le funzioni.</p>'),
'<p>Di seguito viene riportato un esempio di calcolo del compenso totale:</p>',
'<pre>CASE WHEN A = ''SALES'' THEN B + C ELSE B END</pre>',
unistr('(dove A \00E8 l''ORGANIZZAZIONE, B \00E8 lo STIPENDIO e C \00E8 la COMMISSIONE)'),
''))
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140056189656751639)
,p_name=>'APEXIR_HELP_CONTROL_BREAK'
,p_message_language=>'it'
,p_message_text=>unistr('Consente di creare un gruppo di interruzione su una o pi\00F9 colonne. Questa operazione comporta l''estrazione delle colonne dal report interattivo e la loro visualizzazione come record principale.')
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140050370034751637)
,p_name=>'APEXIR_HELP_DETAIL_VIEW'
,p_message_language=>'it'
,p_message_text=>unistr('Per visualizzare i dettagli di una sola riga alla volta, fare clic sull''icona della vista a riga singola sulla riga da visualizzare. Se disponibile, la vista a riga singola sar\00E0 sempre la prima colonna. A seconda della personalizzazione del report in')
||unistr('terattivo, la vista a riga singola pu\00F2 essere la vista standard oppure una pagina personalizzata che consente l''aggiornamento.')
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140050210901751637)
,p_name=>'APEXIR_HELP_DOWNLOAD'
,p_message_language=>'it'
,p_message_text=>'Abilita il download del set di risultati corrente. I formati di download includono PDF, Excel, HTML e CSV. Le opzioni di download variano a seconda del formato selezionato. Tutti i formati possono essere inviati anche come Posta elettronica.'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140049321129751637)
,p_name=>'APEXIR_HELP_FILTER'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Specifica ulteriormente il report aggiungendo o modificando la clausola <code>WHERE</code> nella query. \00C8 possibile applicare un filtro per colonna o per riga.  '),
'<p/>Se si applica il filtro per colonna, selezionare una colonna (non necessariamente quella',
'visualizzata), selezionare un operatore Oracle standard (=, !=, not in, between) e infine immettere un''espressione di confronto. Le espressioni distinguono tra maiuscole e minuscole. Utilizzare % come carattere jolly (ad esempio <code>STATE_NAME',
'like A%)<code>.</p>',
unistr('<p>Se si applica un filtro per riga, \00E8 possibile creare clausole <code>WHERE</code> complesse utilizzando'),
'alias di colonna e qualsiasi funzione o operatore Oracle (ad esempio <code>G = ''VA'' o G = ''CT''</code>, dove',
unistr('<code>G</code> \00E8 l''alias per <code>CUSTOMER_STATE</code>).</p>')))
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140049936350751637)
,p_name=>'APEXIR_HELP_FLASHBACK'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Una funzione Flashback query consente di visualizzare i dati cos\00EC come si presentavano in un precedente'),
unistr('point in time. La quantit\00E0 di tempo massima presa in considerazione dalla funzione \00E8 pari a 3 ore (o 180'),
unistr('minuti) ma la quantit\00E0 effettiva varia a seconda del database.')))
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140114523265751656)
,p_name=>'APEXIR_HELP_FORMAT'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>L''opzione Formato consente di personalizzare la visualizzazione del report.',
'L''opzione Formato contiene i sottomenu seguenti:</p>',
'<ul><li>Ordina</li>',
'<li>Interruzione di controllo</li>',
'<li>Evidenzia</li>',
'<li>Calcola</li>',
'<li>Aggrega</li>',
'<li>Grafico</li>',
'<li>Raggruppa per</li>',
'<li>Pivot</li>',
'</ul>',
''))
,p_version_scn=>2705058
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140112704143751655)
,p_name=>'APEXIR_HELP_GROUP_BY'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\00C8 possibile definire una sola vista di raggruppamento per report salvato.'),
unistr('Dopo averla definita, \00E8 possibile alternare le viste di raggruppamento e report'),
'utilizzando le icone vista della barra di ricerca. Per creare una vista Raggruppa per',
unistr('\00E8 necessario selezionare:'),
'<p></p><ul>',
'<li>le colonne su cui basare il raggruppamento</li>',
unistr('<li>le colonne da aggregare insieme alla funzione da eseguire (media, somma, conteggio e cos\00EC via)</li>'),
'</ul>'))
,p_version_scn=>2705056
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140049565317751637)
,p_name=>'APEXIR_HELP_HIGHLIGHT'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Consente di definire un filtro. Le righe che soddisfano i criteri del filtro vengono evidenziate mediante caratteristiche associate al filtro. Opzioni disponibili:</p>',
'<ul>',
'<li><strong>Nome</strong>: utilizzato solo per la visualizzazione.</li>',
'<li><strong>Sequenza</strong> : identifica la sequenza in cui verranno valutate le regole.</li>',
unistr('<li><strong>Abilitato</strong>: indica se la regola \00E8 abilitata o disabilitata.</li>'),
'<li><strong>Tipo di evidenziazione</strong>: indica se deve essere evidenziata la riga o',
'una cella. Se si seleziona Cella, viene evidenziata la colonna a cui si fa riferimento in Condizione di evidenziazione.</li>',
'<li><strong>Colore sfondo</strong>: il nuovo colore per lo sfondo dell''area evidenziata.</li>',
'<li><strong>Colore testo</strong>: il nuovo colore per il testo dell''area evidenziata.</li>',
'<li><strong>Condizione di evidenziazione</strong>: definisce la condizione del filtro.</li>',
'</ul>',
''))
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139942956766751605)
,p_name=>'APEXIR_HELP_PIVOT'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\00C8 possibile definire una sola vista pivot per report salvato. Dopo averla definita, \00E8 possibile alternare le viste pivot e report utilizzando le icone vista nella barra di ricerca. Per creare una vista pivot \00E8 necessario selezionare:'),
'<p></p>',
'<ul>',
'<li>le colonne su cui eseguire il pivot</li>',
'<li>le colonne da visualizzare come righe</li>',
unistr('<li>le colonne da aggregare insieme alla funzione da eseguire (media, somma, conteggio e cos\00EC via)</li>'),
'</ul>'))
,p_version_scn=>2705023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140060687017751640)
,p_name=>'APEXIR_HELP_REPORT_SETTINGS'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Se si personalizza un report interattivo, le impostazioni del report verranno visualizzate',
unistr('sotto la barra di ricerca e sopra il report. Quest''area pu\00F2 essere compressa ed espansa utilizzando l''icona a sinistra.'),
'<p>',
unistr('Per ogni impostazione del report \00E8 possibile effettuare le operazioni riportate di seguito'),
'.</p><ul>',
'<li>Modificare un''impostazione facendo clic sul nome.</li>',
'<li>Disabilitare/abilitare un''impostazione deselezionando o selezionando la casella di controllo Abilita/disabilita. Questa casella di controllo consente di disattivare temporaneamente e riattivare l''impostazione.</li>',
'<li>Rimuovere un''impostazione facendo clic sull''icona Rimuovi.</li>',
'</ul>',
unistr('<p>Se \00E8 stato creato un grafico, un raggruppamento o una tabella pivot, \00E8 possibile alternarli'),
'con il report di base utilizzando i collegamenti Vista report, Vista grafico, Vista Raggruppa per e Vista pivot,',
unistr('mostrati a destra. Quando si visualizza il grafico, il raggruppamento o la tabella pivot, \00E8 possibile'),
'anche utilizzare il collegamento Modifica per modificare le impostazioni.</p>',
''))
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140050116988751637)
,p_name=>'APEXIR_HELP_RESET'
,p_message_language=>'it'
,p_message_text=>'Ripristina i valori predefiniti del report rimuovendo tutte le personalizzazioni effettuate dall''utente.'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140114834476751656)
,p_name=>'APEXIR_HELP_ROWS_PER_PAGE'
,p_message_language=>'it'
,p_message_text=>'Imposta il numero di record da visualizzare per pagina.'
,p_version_scn=>2705058
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140050083656751637)
,p_name=>'APEXIR_HELP_SAVE_REPORT'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Salva il report personalizzato per poterlo utilizzare in futuro. Occorre fornire un nome e una descrizione facoltativa. \00C8 possibile fare in modo che il report sia accessibile pubblicamente, ovvero da parte di tutti gli utenti che possono accedere ')
||unistr('al report primario predefinito. \00C8 possibile salvare quattro tipi di report interattivo:</p>'),
'<ul>',
unistr('<li><strong>Predefinito primario</strong> (solo sviluppatori). Il report predefinito primario \00E8 quello visualizzato inizialmente. I report di questo tipo non possono essere rinominati o eliminati.</li>'),
unistr('<li><strong>Report alternativo</strong> (solo sviluppatori). Consente agli sviluppatori di creare pi\00F9 layout di report. Solo gli sviluppatori possono salvare, rinominare o eliminare un report alternativo.</li>'),
unistr('<li><strong>Report pubblico</strong> (utenti finali). Pu\00F2 essere salvato, rinominato o eliminato solo dall''utente finale che lo ha creato. Gli altri utenti possono visualizzare e salvare il layout come report diverso.</li>'),
unistr('<li><strong>Report privato</strong> (utenti finali). Solo l''utente finale che crea il report pu\00F2 visualizzare, salvare, rinominare o eliminare il report.</li>'),
'</ul>',
'<p>Se si salvano report personalizzati, viene visualizzato un selettore dei report nella barra di ricerca, a sinistra del selettore delle righe (qualora questa funzione sia abilitata).</p>',
''))
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140049068886751637)
,p_name=>'APEXIR_HELP_SEARCH_BAR'
,p_message_language=>'it'
,p_message_text=>unistr('Nella parte superiore di ogni pagina di report \00E8 presente un''area di ricerca. Questa area o barra di ricerca dispone delle seguenti funzioni:')
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140115448310751656)
,p_name=>'APEXIR_HELP_SEARCH_BAR_ACTIONS_MENU'
,p_message_language=>'it'
,p_message_text=>'<li>Il menu <strong>Azioni</strong> consente di personalizzare un report. Vedere le sezioni seguenti.</li>'
,p_version_scn=>2705058
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140114924570751656)
,p_name=>'APEXIR_HELP_SEARCH_BAR_FINDER'
,p_message_language=>'it'
,p_message_text=>'<li>L''<strong>icona di selezione delle colonne</strong> consente di specificare una o tutte le colonne in cui eseguire la ricerca.</li>'
,p_version_scn=>2705058
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140115282712751656)
,p_name=>'APEXIR_HELP_SEARCH_BAR_REPORTS'
,p_message_language=>'it'
,p_message_text=>'<li><strong>Report</strong> mostra un valore predefinito alternativo e salva i report pubblici o privati.</li>'
,p_version_scn=>2705058
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140115123433751656)
,p_name=>'APEXIR_HELP_SEARCH_BAR_ROWS'
,p_message_language=>'it'
,p_message_text=>'<li><strong>Righe</strong> imposta il numero di record da visualizzare per pagina.</li>'
,p_version_scn=>2705058
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140115077142751656)
,p_name=>'APEXIR_HELP_SEARCH_BAR_TEXTBOX'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li>L''<strong>area di testo</strong> consente di immettere criteri di ricerca senza distinzione tra maiuscole e minuscole (i caratteri jolly sono impliciti).</li>',
unistr('<li>Il pulsante <strong>Vai</strong> esegue la ricerca. Quando il cursore si trova nell''area del testo di ricerca, la ricerca verr\00E0 eseguita anche premendo il tasto Invio.</li>')))
,p_version_scn=>2705058
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140115399451751656)
,p_name=>'APEXIR_HELP_SEARCH_BAR_VIEW'
,p_message_language=>'it'
,p_message_text=>'<li><strong>Visualizza icone</strong> alterna le viste a icone, report, dei dettagli, di grafico, di raggruppamento e pivot  del report, qualora siano definite.</li>'
,p_version_scn=>2705058
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140049200207751637)
,p_name=>'APEXIR_HELP_SELECT_COLUMNS'
,p_message_language=>'it'
,p_message_text=>unistr('Utilizzato per modificare le colonne visualizzate. Le colonne a destra vengono visualizzate, mentre le colonne a sinistra vengono nascoste. \00C8 possibile riordinare le colonne visualizzate utilizzando le frecce a destra. Le colonne calcolate sono contr')
||'addistinte dal prefisso <strong>**</strong>.'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140049414179751637)
,p_name=>'APEXIR_HELP_SORT'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Utilizzato per modificare le colonne da ordinare e per indicare se',
unistr('il tipo di ordinamento \00E8 crescente o decrescente. \00C8 inoltre possibile specificare le modalit\00E0 di gestione'),
'dei valori <code>NULL</code>. L''impostazione predefinita visualizza i valori <code>NULL</code> sempre per ultimi o per primi. L''ordinamento finale viene visualizzato a destra delle',
'intestazioni di colonna nel report.</p>'))
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140112538461751655)
,p_name=>'APEXIR_HELP_SUBSCRIPTION'
,p_message_language=>'it'
,p_message_text=>unistr('Quando si aggiunge una sottoscrizione, specificare un indirizzo di posta elettronica (o pi\00F9 indirizzi di posta elettronica separati da virgole), l''oggetto del messaggio, la frequenza e le date di inizio e di fine. I messaggi di posta elettronica risu')
||'ltanti includono una versione esportata (PDF, Excel, HTML o CSV) del report interattivo che contiene i dati correnti utilizzando l''impostazione del report presente al momento dell''aggiunta della sottoscrizione.'
,p_version_scn=>2705056
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140054170148751638)
,p_name=>'APEXIR_HIDE_COLUMN'
,p_message_language=>'it'
,p_message_text=>'Nascondi colonna'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140044559875751635)
,p_name=>'APEXIR_HIGHLIGHT'
,p_message_language=>'it'
,p_message_text=>'Evidenzia'
,p_is_js_message=>true
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140055612089751639)
,p_name=>'APEXIR_HIGHLIGHTS'
,p_message_language=>'it'
,p_message_text=>'Evidenziazioni'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140025859948751630)
,p_name=>'APEXIR_HIGHLIGHT_CELL_WITH_COLORS'
,p_message_language=>'it'
,p_message_text=>'Evidenzia cella, %0 in %1'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140060794912751640)
,p_name=>'APEXIR_HIGHLIGHT_CONDITION'
,p_message_language=>'it'
,p_message_text=>'Condizione di evidenziazione'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140025707147751630)
,p_name=>'APEXIR_HIGHLIGHT_ROW_WITH_COLORS'
,p_message_language=>'it'
,p_message_text=>'Evidenzia riga, %0 in %1'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140113101877751656)
,p_name=>'APEXIR_HIGHLIGHT_STYLE'
,p_message_language=>'it'
,p_message_text=>'Stile evidenziazione'
,p_version_scn=>2705058
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140017307830751627)
,p_name=>'APEXIR_HIGHLIGHT_TYPE'
,p_message_language=>'it'
,p_message_text=>'Tipo di evidenziazione'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140131972536751661)
,p_name=>'APEXIR_HORIZONTAL'
,p_message_language=>'it'
,p_message_text=>'Orizzontale'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140160992824751670)
,p_name=>'APEXIR_INACTIVE_SETTING'
,p_message_language=>'it'
,p_message_text=>'1 impostazione non attiva'
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140161082176751670)
,p_name=>'APEXIR_INACTIVE_SETTINGS'
,p_message_language=>'it'
,p_message_text=>'%0 impostazioni non attive'
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140050722374751637)
,p_name=>'APEXIR_INTERACTIVE_REPORT_HELP'
,p_message_language=>'it'
,p_message_text=>'Guida del report interattivo'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140061726113751640)
,p_name=>'APEXIR_INVALID'
,p_message_language=>'it'
,p_message_text=>'Non valido'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140055155251751638)
,p_name=>'APEXIR_INVALID_COMPUTATION'
,p_message_language=>'it'
,p_message_text=>'Espressione di calcolo non valida. %0'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140010755526751625)
,p_name=>'APEXIR_INVALID_END_DATE'
,p_message_language=>'it'
,p_message_text=>'La data di fine deve essere successiva alla data di inizio.'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140069971464751643)
,p_name=>'APEXIR_INVALID_FILTER'
,p_message_language=>'it'
,p_message_text=>'Espressione di filtro non valida. %0'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140139705411751664)
,p_name=>'APEXIR_INVALID_FILTER_QUERY'
,p_message_language=>'it'
,p_message_text=>'Query di filtro non valida'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140161153379751670)
,p_name=>'APEXIR_INVALID_SETTING'
,p_message_language=>'it'
,p_message_text=>'1 impostazione non valida'
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140161233520751670)
,p_name=>'APEXIR_INVALID_SETTINGS'
,p_message_language=>'it'
,p_message_text=>'%0 impostazioni non valide'
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140113331857751656)
,p_name=>'APEXIR_IN_MINUTES'
,p_message_language=>'it'
,p_message_text=>'(in minuti)'
,p_version_scn=>2705058
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140130376560751661)
,p_name=>'APEXIR_IS_IN_THE_LAST'
,p_message_language=>'it'
,p_message_text=>'%0 rientra nell''ultimo %1'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140130576076751661)
,p_name=>'APEXIR_IS_IN_THE_NEXT'
,p_message_language=>'it'
,p_message_text=>'%0 rientra nel prossimo %1'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140130444037751661)
,p_name=>'APEXIR_IS_NOT_IN_THE_LAST'
,p_message_language=>'it'
,p_message_text=>'%0 non rientra nell''ultimo %1'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140130635420751661)
,p_name=>'APEXIR_IS_NOT_IN_THE_NEXT'
,p_message_language=>'it'
,p_message_text=>'%0 non rientra nel prossimo %1'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140059826135751640)
,p_name=>'APEXIR_KEYPAD'
,p_message_language=>'it'
,p_message_text=>'Tastierino'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140023579383751629)
,p_name=>'APEXIR_LABEL'
,p_message_language=>'it'
,p_message_text=>'Etichetta %0'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140053762972751638)
,p_name=>'APEXIR_LABEL_AXIS_TITLE'
,p_message_language=>'it'
,p_message_text=>'Titolo asse per etichetta'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140046073787751636)
,p_name=>'APEXIR_LAST_DAY'
,p_message_language=>'it'
,p_message_text=>'Ultimo giorno'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140046276674751636)
,p_name=>'APEXIR_LAST_HOUR'
,p_message_language=>'it'
,p_message_text=>'Ultima ora'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140045709786751636)
,p_name=>'APEXIR_LAST_MONTH'
,p_message_language=>'it'
,p_message_text=>'Mese scorso'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140045813745751636)
,p_name=>'APEXIR_LAST_WEEK'
,p_message_language=>'it'
,p_message_text=>'Settimana scorsa'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140045973194751636)
,p_name=>'APEXIR_LAST_X_DAYS'
,p_message_language=>'it'
,p_message_text=>'Ultimi %0 giorni'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140046110215751636)
,p_name=>'APEXIR_LAST_X_HOURS'
,p_message_language=>'it'
,p_message_text=>'Ultime %0 ore'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140045516480751636)
,p_name=>'APEXIR_LAST_X_YEARS'
,p_message_language=>'it'
,p_message_text=>'Ultimi %0 anni'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140045695568751636)
,p_name=>'APEXIR_LAST_YEAR'
,p_message_language=>'it'
,p_message_text=>'Anno scorso'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140023472518751629)
,p_name=>'APEXIR_LINE'
,p_message_language=>'it'
,p_message_text=>'A linee'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140020255078751628)
,p_name=>'APEXIR_LINE_WITH_AREA'
,p_message_language=>'it'
,p_message_text=>'A linee con area'
,p_version_scn=>2705040
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140139641959751664)
,p_name=>'APEXIR_MAP_IT'
,p_message_language=>'it'
,p_message_text=>'Mappa'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140054622889751638)
,p_name=>'APEXIR_MAX_QUERY_COST'
,p_message_language=>'it'
,p_message_text=>'Secondo le stime la query supera il numero massimo di risorse consentito. Modificare le impostazioni del report e riprovare.'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140036033490751633)
,p_name=>'APEXIR_MAX_ROW_CNT'
,p_message_language=>'it'
,p_message_text=>unistr('Il conteggio massimo di righe per questo report \00E8 %0 righe. Applicare un filtro per ridurre il numero di record nella query.')
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140140231373751664)
,p_name=>'APEXIR_MAX_X'
,p_message_language=>'it'
,p_message_text=>'Massimo %0'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140140461554751664)
,p_name=>'APEXIR_MEDIAN_X'
,p_message_language=>'it'
,p_message_text=>'Mediana %0'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139982761429751617)
,p_name=>'APEXIR_MESSAGE'
,p_message_language=>'it'
,p_message_text=>'Messaggio'
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140040374825751634)
,p_name=>'APEXIR_MIN_AGO'
,p_message_language=>'it'
,p_message_text=>'%0 minuti fa'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140140324602751664)
,p_name=>'APEXIR_MIN_X'
,p_message_language=>'it'
,p_message_text=>'Minimo %0'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140139350493751663)
,p_name=>'APEXIR_MONTH'
,p_message_language=>'it'
,p_message_text=>'Mese'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140113754046751656)
,p_name=>'APEXIR_MONTHLY'
,p_message_language=>'it'
,p_message_text=>'Mensile'
,p_version_scn=>2705058
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140052956215751638)
,p_name=>'APEXIR_MOVE'
,p_message_language=>'it'
,p_message_text=>'Sposta'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140052845628751638)
,p_name=>'APEXIR_MOVE_ALL'
,p_message_language=>'it'
,p_message_text=>'Sposta tutto'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140166073313751671)
,p_name=>'APEXIR_MULTIIR_PAGE_REGION_STATIC_ID_REQUIRED'
,p_message_language=>'it'
,p_message_text=>unistr('\00C8 necessario specificare l''ID statico area poich\00E9 la pagina contiene pi\00F9 report interattivi.')
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140018928259751628)
,p_name=>'APEXIR_NAME'
,p_message_language=>'it'
,p_message_text=>'Nome'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140048684400751637)
,p_name=>'APEXIR_NEW_AGGREGATION'
,p_message_language=>'it'
,p_message_text=>'Nuova aggregazione'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140161832083751670)
,p_name=>'APEXIR_NEW_CATEGORY_LABEL'
,p_message_language=>'it'
,p_message_text=>'Nuova categoria'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140048733394751637)
,p_name=>'APEXIR_NEW_COMPUTATION'
,p_message_language=>'it'
,p_message_text=>'Nuovo calcolo'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140043403235751635)
,p_name=>'APEXIR_NEXT'
,p_message_language=>'it'
,p_message_text=>'Successivo'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140046524682751636)
,p_name=>'APEXIR_NEXT_DAY'
,p_message_language=>'it'
,p_message_text=>'Giorno successivo'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140046337177751636)
,p_name=>'APEXIR_NEXT_HOUR'
,p_message_language=>'it'
,p_message_text=>'Ora successiva'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140046869574751636)
,p_name=>'APEXIR_NEXT_MONTH'
,p_message_language=>'it'
,p_message_text=>'Mese successivo'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140046743568751636)
,p_name=>'APEXIR_NEXT_WEEK'
,p_message_language=>'it'
,p_message_text=>'Settimana successiva'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140046655903751636)
,p_name=>'APEXIR_NEXT_X_DAYS'
,p_message_language=>'it'
,p_message_text=>'%0 giorni successivi'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140046434119751636)
,p_name=>'APEXIR_NEXT_X_HOURS'
,p_message_language=>'it'
,p_message_text=>'%0 ore successive'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140047066989751636)
,p_name=>'APEXIR_NEXT_X_YEARS'
,p_message_language=>'it'
,p_message_text=>'%0 anni successivi'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140046916235751636)
,p_name=>'APEXIR_NEXT_YEAR'
,p_message_language=>'it'
,p_message_text=>'Anno successivo'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140019299831751628)
,p_name=>'APEXIR_NO'
,p_message_language=>'it'
,p_message_text=>'No'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140061984655751640)
,p_name=>'APEXIR_NONE'
,p_message_language=>'it'
,p_message_text=>'- Nessuno -'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140112947760751656)
,p_name=>'APEXIR_NOT_VALID_EMAIL'
,p_message_language=>'it'
,p_message_text=>unistr('Non \00E8 un indirizzo di posta elettronica valido.')
,p_version_scn=>2705056
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139985008826751618)
,p_name=>'APEXIR_NO_COLUMNS_SELECTED'
,p_message_language=>'it'
,p_message_text=>'Nessuna colonna selezionata per la visualizzazione. Utilizzare <strong>Colonne</strong> nel menu Azioni per rendere visibili le colonne.'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140058432521751639)
,p_name=>'APEXIR_NULLS_ALWAYS_FIRST'
,p_message_language=>'it'
,p_message_text=>'Valori nulli sempre per primi'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140058310680751639)
,p_name=>'APEXIR_NULLS_ALWAYS_LAST'
,p_message_language=>'it'
,p_message_text=>'Valori nulli sempre per ultimi'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140058866817751640)
,p_name=>'APEXIR_NULL_SORTING'
,p_message_language=>'it'
,p_message_text=>'Ordinamento valori nulli %0'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140055269564751639)
,p_name=>'APEXIR_NUMERIC_FLASHBACK_TIME'
,p_message_language=>'it'
,p_message_text=>'Il valore di tempo Flashback deve essere numerico.'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140054805760751638)
,p_name=>'APEXIR_NUMERIC_SEQUENCE'
,p_message_language=>'it'
,p_message_text=>'La sequenza deve essere numerica.'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140059310514751640)
,p_name=>'APEXIR_OPERATOR'
,p_message_language=>'it'
,p_message_text=>'Operatore'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140017851188751627)
,p_name=>'APEXIR_ORANGE'
,p_message_language=>'it'
,p_message_text=>'arancione'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140131886756751661)
,p_name=>'APEXIR_ORIENTATION'
,p_message_language=>'it'
,p_message_text=>'Orientamento'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140019796429751628)
,p_name=>'APEXIR_OTHER'
,p_message_language=>'it'
,p_message_text=>'Altro'
,p_version_scn=>2705040
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139985924390751618)
,p_name=>'APEXIR_PAGINATION_OF'
,p_message_language=>'it'
,p_message_text=>'Impaginazione di %0'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139999968244751622)
,p_name=>'APEXIR_PDF_ORIENTATION'
,p_message_language=>'it'
,p_message_text=>'Orientamento pagina'
,p_version_scn=>2705035
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140000692060751622)
,p_name=>'APEXIR_PDF_ORIENTATION_HORIZONTAL'
,p_message_language=>'it'
,p_message_text=>'Orizzontale'
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140000716837751622)
,p_name=>'APEXIR_PDF_ORIENTATION_VERTICAL'
,p_message_language=>'it'
,p_message_text=>'Verticale'
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139999830834751622)
,p_name=>'APEXIR_PDF_PAGE_SIZE'
,p_message_language=>'it'
,p_message_text=>'Dimensione pagina'
,p_version_scn=>2705035
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140000436351751622)
,p_name=>'APEXIR_PDF_PAGE_SIZE_A3'
,p_message_language=>'it'
,p_message_text=>'A3'
,p_version_scn=>2705037
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140000374401751622)
,p_name=>'APEXIR_PDF_PAGE_SIZE_A4'
,p_message_language=>'it'
,p_message_text=>'A4'
,p_version_scn=>2705037
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140000535674751622)
,p_name=>'APEXIR_PDF_PAGE_SIZE_CUSTOM'
,p_message_language=>'it'
,p_message_text=>'Personalizzato'
,p_version_scn=>2705037
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140000126238751622)
,p_name=>'APEXIR_PDF_PAGE_SIZE_LEGAL'
,p_message_language=>'it'
,p_message_text=>'Legale'
,p_version_scn=>2705036
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140000016317751622)
,p_name=>'APEXIR_PDF_PAGE_SIZE_LETTER'
,p_message_language=>'it'
,p_message_text=>'Lettera'
,p_version_scn=>2705035
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140000286968751622)
,p_name=>'APEXIR_PDF_PAGE_SIZE_TABLOID'
,p_message_language=>'it'
,p_message_text=>'Tabloid'
,p_version_scn=>2705037
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140140768633751664)
,p_name=>'APEXIR_PERCENT_OF_TOTAL_COUNT_X'
,p_message_language=>'it'
,p_message_text=>'Percentuale del conteggio totale %0 (%)'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140139948262751664)
,p_name=>'APEXIR_PERCENT_OF_TOTAL_SUM_X'
,p_message_language=>'it'
,p_message_text=>'Percentuale della somma totale %0 (%)'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140138989234751663)
,p_name=>'APEXIR_PERCENT_TOTAL_COUNT'
,p_message_language=>'it'
,p_message_text=>'Percentuale del conteggio totale'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140138853194751663)
,p_name=>'APEXIR_PERCENT_TOTAL_SUM'
,p_message_language=>'it'
,p_message_text=>'Percentuale della somma totale'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140023350275751629)
,p_name=>'APEXIR_PIE'
,p_message_language=>'it'
,p_message_text=>'A torta'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140089025307751648)
,p_name=>'APEXIR_PIVOT'
,p_message_language=>'it'
,p_message_text=>'Pivot'
,p_is_js_message=>true
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140090509004751649)
,p_name=>'APEXIR_PIVOT_AGG_NOT_NULL'
,p_message_language=>'it'
,p_message_text=>'Specificare l''aggregato.'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140090782469751649)
,p_name=>'APEXIR_PIVOT_AGG_NOT_ON_ROW_COL'
,p_message_language=>'it'
,p_message_text=>'Impossibile aggregare una colonna selezionata come colonna righe.'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140089998356751649)
,p_name=>'APEXIR_PIVOT_COLUMNS'
,p_message_language=>'it'
,p_message_text=>'Colonne pivot'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140089785608751649)
,p_name=>'APEXIR_PIVOT_COLUMN_N'
,p_message_language=>'it'
,p_message_text=>'Colonna pivot %0'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140090333314751649)
,p_name=>'APEXIR_PIVOT_COLUMN_NOT_NULL'
,p_message_language=>'it'
,p_message_text=>'Specificare la colonna pivot.'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139942876953751605)
,p_name=>'APEXIR_PIVOT_MAX_ROW_CNT'
,p_message_language=>'it'
,p_message_text=>'Il numero massimo di righe per una query di tipo Pivot limita il numero di righe nella query di base, non il numero di righe visualizzate. La query di base supera il numero massimo di righe di %0 righe. Applicare un filtro per ridurre il numero di re'
||'cord nella query di base.'
,p_version_scn=>2705023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140090297819751649)
,p_name=>'APEXIR_PIVOT_SORT'
,p_message_language=>'it'
,p_message_text=>'Ordinamento pivot'
,p_is_js_message=>true
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140056209548751639)
,p_name=>'APEXIR_PIVOT_TOO_MANY_VALUES'
,p_message_language=>'it'
,p_message_text=>'La colonna pivot contiene troppi valori distinti: impossibile generare il codice SQL pivot.'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139987288591751618)
,p_name=>'APEXIR_PIVOT_VIEW_OF'
,p_message_language=>'it'
,p_message_text=>'Vista pivot di %0'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140113000897751656)
,p_name=>'APEXIR_PREVIEW'
,p_message_language=>'it'
,p_message_text=>'Anteprima'
,p_version_scn=>2705056
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140043554707751635)
,p_name=>'APEXIR_PREVIOUS'
,p_message_language=>'it'
,p_message_text=>'Precedente'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140137882955751663)
,p_name=>'APEXIR_PRIMARY'
,p_message_language=>'it'
,p_message_text=>'Primario'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140114066358751656)
,p_name=>'APEXIR_PRIMARY_REPORT'
,p_message_language=>'it'
,p_message_text=>'Report primario'
,p_version_scn=>2705058
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139999778907751622)
,p_name=>'APEXIR_PRINT_ACCESSIBLE'
,p_message_language=>'it'
,p_message_text=>'Includi tag di accesso facilitato'
,p_version_scn=>2705035
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139960590537751611)
,p_name=>'APEXIR_PRINT_STRIP_RICH_TEXT'
,p_message_language=>'it'
,p_message_text=>'Rimuovi formattazione dal testo'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140068996443751643)
,p_name=>'APEXIR_PRIVATE'
,p_message_language=>'it'
,p_message_text=>'Privato'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140023972778751629)
,p_name=>'APEXIR_PUBLIC'
,p_message_language=>'it'
,p_message_text=>'Pubblico'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140019584576751628)
,p_name=>'APEXIR_RED'
,p_message_language=>'it'
,p_message_text=>'rosso'
,p_version_scn=>2705040
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140165912038751671)
,p_name=>'APEXIR_REGION_STATIC_ID_DOES_NOT_EXIST'
,p_message_language=>'it'
,p_message_text=>'L''ID statico area %0 non esiste.'
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140053062179751638)
,p_name=>'APEXIR_REMOVE'
,p_message_language=>'it'
,p_message_text=>'Rimuovi'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140053137404751638)
,p_name=>'APEXIR_REMOVE_ALL'
,p_message_language=>'it'
,p_message_text=>'Rimuovi tutto'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140161360556751670)
,p_name=>'APEXIR_REMOVE_CHART'
,p_message_language=>'it'
,p_message_text=>'Rimuovi grafico'
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140052656472751638)
,p_name=>'APEXIR_REMOVE_CONTROL_BREAK'
,p_message_language=>'it'
,p_message_text=>'Rimuovi interruzione di controllo'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140052341306751638)
,p_name=>'APEXIR_REMOVE_FILTER'
,p_message_language=>'it'
,p_message_text=>'Rimuovi filtro'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140052404906751638)
,p_name=>'APEXIR_REMOVE_FLASHBACK'
,p_message_language=>'it'
,p_message_text=>'Rimuovi Flashback'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140161433280751670)
,p_name=>'APEXIR_REMOVE_GROUP_BY'
,p_message_language=>'it'
,p_message_text=>'Rimuovi raggruppamento per'
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140052733379751638)
,p_name=>'APEXIR_REMOVE_HIGHLIGHT'
,p_message_language=>'it'
,p_message_text=>'Rimuovi evidenziazione'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140161520325751670)
,p_name=>'APEXIR_REMOVE_PIVOT'
,p_message_language=>'it'
,p_message_text=>'Rimuovi pivot'
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140142662120751664)
,p_name=>'APEXIR_REMOVE_REPORT'
,p_message_language=>'it'
,p_message_text=>'Rimuovi report'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140124439727751659)
,p_name=>'APEXIR_RENAME_DEFAULT_REPORT'
,p_message_language=>'it'
,p_message_text=>'Rinomina report predefinito'
,p_is_js_message=>true
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140062213338751641)
,p_name=>'APEXIR_RENAME_REPORT'
,p_message_language=>'it'
,p_message_text=>'Rinomina report'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140043837969751635)
,p_name=>'APEXIR_REPORT'
,p_message_language=>'it'
,p_message_text=>'Report'
,p_is_js_message=>true
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140140867806751664)
,p_name=>'APEXIR_REPORTS'
,p_message_language=>'it'
,p_message_text=>'Report'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140016042231751627)
,p_name=>'APEXIR_REPORT_ALIAS_DOES_NOT_EXIST'
,p_message_language=>'it'
,p_message_text=>'Il report interattivo salvato con l''alias %0 non esiste.'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140069256388751643)
,p_name=>'APEXIR_REPORT_DOES_NOT_EXIST'
,p_message_language=>'it'
,p_message_text=>'Report inesistente.'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140016181870751627)
,p_name=>'APEXIR_REPORT_ID_DOES_NOT_EXIST'
,p_message_language=>'it'
,p_message_text=>'L''ID report interattivo salvato %0 non esiste.'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140060589282751640)
,p_name=>'APEXIR_REPORT_SETTINGS'
,p_message_language=>'it'
,p_message_text=>'Impostazioni report'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139984781734751618)
,p_name=>'APEXIR_REPORT_SETTINGS_OF'
,p_message_language=>'it'
,p_message_text=>'Impostazioni report di %0'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140040884290751634)
,p_name=>'APEXIR_REPORT_VIEW'
,p_message_language=>'it'
,p_message_text=>'Vista report'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140045057524751635)
,p_name=>'APEXIR_RESET'
,p_message_language=>'it'
,p_message_text=>'Reimposta'
,p_is_js_message=>true
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140024172210751629)
,p_name=>'APEXIR_RESET_CONFIRM'
,p_message_language=>'it'
,p_message_text=>'Ripristina le impostazioni predefinite del report.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140019354600751628)
,p_name=>'APEXIR_ROW'
,p_message_language=>'it'
,p_message_text=>'Riga'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140136937106751663)
,p_name=>'APEXIR_ROWID_NOT_SUPPORTED_FOR_WEBSOURCE'
,p_message_language=>'it'
,p_message_text=>'Impossibile utilizzare ROWID come colonna chiave primaria per un''origine dati REST.'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140051789681751637)
,p_name=>'APEXIR_ROWS'
,p_message_language=>'it'
,p_message_text=>'Righe'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140114797072751656)
,p_name=>'APEXIR_ROWS_PER_PAGE'
,p_message_language=>'it'
,p_message_text=>'Righe per pagina'
,p_is_js_message=>true
,p_version_scn=>2705058
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140090030025751649)
,p_name=>'APEXIR_ROW_COLUMNS'
,p_message_language=>'it'
,p_message_text=>'Colonne righe'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140089860849751649)
,p_name=>'APEXIR_ROW_COLUMN_N'
,p_message_language=>'it'
,p_message_text=>'Colonna righe %0'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140090494496751649)
,p_name=>'APEXIR_ROW_COLUMN_NOT_NULL'
,p_message_language=>'it'
,p_message_text=>'Specificare la colonna righe.'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140090651699751649)
,p_name=>'APEXIR_ROW_COL_DIFF_FROM_PIVOT_COL'
,p_message_language=>'it'
,p_message_text=>'La colonna righe deve essere diversa dalla colonna pivot.'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140066235575751642)
,p_name=>'APEXIR_ROW_FILTER'
,p_message_language=>'it'
,p_message_text=>'Filtro righe'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140040972308751634)
,p_name=>'APEXIR_ROW_OF'
,p_message_language=>'it'
,p_message_text=>'Riga %0 di %1'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140045265673751636)
,p_name=>'APEXIR_ROW_TEXT_CONTAINS'
,p_message_language=>'it'
,p_message_text=>'La riga di testo contiene'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140018626185751628)
,p_name=>'APEXIR_SAVE'
,p_message_language=>'it'
,p_message_text=>'Salva'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140055859918751639)
,p_name=>'APEXIR_SAVED_REPORT'
,p_message_language=>'it'
,p_message_text=>'Report salvato'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140055743510751639)
,p_name=>'APEXIR_SAVED_REPORT_MSG'
,p_message_language=>'it'
,p_message_text=>'Report salvato = "%0"'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140057903147751639)
,p_name=>'APEXIR_SAVE_DEFAULT_CONFIRM'
,p_message_language=>'it'
,p_message_text=>'Le impostazioni di report correnti verranno utilizzate come predefinite per tutti gli utenti.'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140124312025751659)
,p_name=>'APEXIR_SAVE_DEFAULT_REPORT'
,p_message_language=>'it'
,p_message_text=>'Salva report predefinito'
,p_is_js_message=>true
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140044932320751635)
,p_name=>'APEXIR_SAVE_REPORT'
,p_message_language=>'it'
,p_message_text=>'Salva report'
,p_is_js_message=>true
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140161741780751670)
,p_name=>'APEXIR_SAVE_REPORT_DEFAULT'
,p_message_language=>'it'
,p_message_text=>'Salva report *'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140115739129751656)
,p_name=>'APEXIR_SEARCH'
,p_message_language=>'it'
,p_message_text=>'Cerca'
,p_version_scn=>2705058
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140050672575751637)
,p_name=>'APEXIR_SEARCH_BAR'
,p_message_language=>'it'
,p_message_text=>'Barra di ricerca'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139984083789751617)
,p_name=>'APEXIR_SEARCH_BAR_OF'
,p_message_language=>'it'
,p_message_text=>'Barra di ricerca di %0'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140161629992751670)
,p_name=>'APEXIR_SEARCH_COLUMN'
,p_message_language=>'it'
,p_message_text=>'Cerca: %0'
,p_is_js_message=>true
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140121223307751658)
,p_name=>'APEXIR_SEARCH_REPORT'
,p_message_language=>'it'
,p_message_text=>'Report di ricerca'
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140105263835751653)
,p_name=>'APEXIR_SELECTED_COLUMNS'
,p_message_language=>'it'
,p_message_text=>'Colonne selezionate'
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140020353454751628)
,p_name=>'APEXIR_SELECT_COLUMN'
,p_message_language=>'it'
,p_message_text=>'- Seleziona colonna -'
,p_version_scn=>2705040
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140044257983751635)
,p_name=>'APEXIR_SELECT_COLUMNS'
,p_message_language=>'it'
,p_message_text=>'Seleziona colonne'
,p_is_js_message=>true
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140023899430751629)
,p_name=>'APEXIR_SELECT_FUNCTION'
,p_message_language=>'it'
,p_message_text=>'- Seleziona funzione -'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140051489235751637)
,p_name=>'APEXIR_SELECT_GROUP_BY_COLUMN'
,p_message_language=>'it'
,p_message_text=>'- Seleziona colonna Raggruppa per -'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140089540188751649)
,p_name=>'APEXIR_SELECT_PIVOT_COLUMN'
,p_message_language=>'it'
,p_message_text=>'- Seleziona colonna pivot -'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140139831496751664)
,p_name=>'APEXIR_SELECT_ROW'
,p_message_language=>'it'
,p_message_text=>'Seleziona riga'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140089652028751649)
,p_name=>'APEXIR_SELECT_ROW_COLUMN'
,p_message_language=>'it'
,p_message_text=>'- Seleziona colonna righe -'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139971116648751614)
,p_name=>'APEXIR_SEND'
,p_message_language=>'it'
,p_message_text=>'Invia'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139993617578751620)
,p_name=>'APEXIR_SEND_AS_EMAIL'
,p_message_language=>'it'
,p_message_text=>'Invia come posta elettronica'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140019096208751628)
,p_name=>'APEXIR_SEQUENCE'
,p_message_language=>'it'
,p_message_text=>'Sequenza'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140044495453751635)
,p_name=>'APEXIR_SORT'
,p_message_language=>'it'
,p_message_text=>'Ordina'
,p_is_js_message=>true
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140053988128751638)
,p_name=>'APEXIR_SORT_ASCENDING'
,p_message_language=>'it'
,p_message_text=>'Ordinamento crescente'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140054019860751638)
,p_name=>'APEXIR_SORT_DESCENDING'
,p_message_language=>'it'
,p_message_text=>'Ordinamento decrescente'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140142073940751664)
,p_name=>'APEXIR_SORT_ORDER'
,p_message_language=>'it'
,p_message_text=>'Criterio di ordinamento'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140048336863751636)
,p_name=>'APEXIR_SPACE_AS_IN_ONE_EMPTY_STRING'
,p_message_language=>'it'
,p_message_text=>'spazio'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140059548645751640)
,p_name=>'APEXIR_STATUS'
,p_message_language=>'it'
,p_message_text=>'Stato %0'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140113409415751656)
,p_name=>'APEXIR_SUBSCRIPTION'
,p_message_language=>'it'
,p_message_text=>'Sottoscrizione'
,p_is_js_message=>true
,p_version_scn=>2705058
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140139207532751663)
,p_name=>'APEXIR_SUBSCRIPTION_ENDING'
,p_message_language=>'it'
,p_message_text=>'Fine'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139958272072751610)
,p_name=>'APEXIR_SUBSCRIPTION_SKIP_IF_NDF'
,p_message_language=>'it'
,p_message_text=>'Salta se nessun dato trovato'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140139165860751663)
,p_name=>'APEXIR_SUBSCRIPTION_STARTING_FROM'
,p_message_language=>'it'
,p_message_text=>'A partire da'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140140026117751664)
,p_name=>'APEXIR_SUM_X'
,p_message_language=>'it'
,p_message_text=>'Somma %0'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140130978042751661)
,p_name=>'APEXIR_TABLE_SUMMARY'
,p_message_language=>'it'
,p_message_text=>'%0, report = %1, vista = %2'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140017963304751627)
,p_name=>'APEXIR_TEXT_COLOR'
,p_message_language=>'it'
,p_message_text=>'Colore testo'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140036686579751633)
,p_name=>'APEXIR_TIME_DAYS'
,p_message_language=>'it'
,p_message_text=>'giorni'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140036541930751633)
,p_name=>'APEXIR_TIME_HOURS'
,p_message_language=>'it'
,p_message_text=>'ore'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140036467203751633)
,p_name=>'APEXIR_TIME_MINS'
,p_message_language=>'it'
,p_message_text=>'minuti'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140036895605751633)
,p_name=>'APEXIR_TIME_MONTHS'
,p_message_language=>'it'
,p_message_text=>'mesi'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140036753413751633)
,p_name=>'APEXIR_TIME_WEEKS'
,p_message_language=>'it'
,p_message_text=>'settimane'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140036960987751633)
,p_name=>'APEXIR_TIME_YEARS'
,p_message_language=>'it'
,p_message_text=>'anni'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140142416431751664)
,p_name=>'APEXIR_TOGGLE'
,p_message_language=>'it'
,p_message_text=>'Attiva/disattiva'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140053257581751638)
,p_name=>'APEXIR_TOP'
,p_message_language=>'it'
,p_message_text=>'In alto'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140135925995751662)
,p_name=>'APEXIR_UNGROUPED_COLUMN'
,p_message_language=>'it'
,p_message_text=>'Colonna non raggruppata'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140054708656751638)
,p_name=>'APEXIR_UNIQUE_HIGHLIGHT_NAME'
,p_message_language=>'it'
,p_message_text=>'Il nome dell''evidenziazione deve essere univoco.'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140022616961751629)
,p_name=>'APEXIR_UNSUPPORTED_DATA_TYPE'
,p_message_language=>'it'
,p_message_text=>'tipo di dati non supportato'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140053394945751638)
,p_name=>'APEXIR_UP'
,p_message_language=>'it'
,p_message_text=>'Su'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140054933849751638)
,p_name=>'APEXIR_VALID_COLOR'
,p_message_language=>'it'
,p_message_text=>'Immettere un colore valido.'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140055021983751638)
,p_name=>'APEXIR_VALID_FORMAT_MASK'
,p_message_language=>'it'
,p_message_text=>'Immettere un formato di visualizzazione valido.'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140019827427751628)
,p_name=>'APEXIR_VALUE'
,p_message_language=>'it'
,p_message_text=>'Valore'
,p_version_scn=>2705040
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140053866479751638)
,p_name=>'APEXIR_VALUE_AXIS_TITLE'
,p_message_language=>'it'
,p_message_text=>'Titolo asse per valore'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140061661587751640)
,p_name=>'APEXIR_VALUE_REQUIRED'
,p_message_language=>'it'
,p_message_text=>'Valore obbligatorio'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140023223230751629)
,p_name=>'APEXIR_VCOLUMN'
,p_message_language=>'it'
,p_message_text=>'A colonne verticali'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140132045462751661)
,p_name=>'APEXIR_VERTICAL'
,p_message_language=>'it'
,p_message_text=>'Verticale'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140060946878751640)
,p_name=>'APEXIR_VIEW_CHART'
,p_message_language=>'it'
,p_message_text=>'Visualizza grafico'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140119544339751658)
,p_name=>'APEXIR_VIEW_DETAIL'
,p_message_language=>'it'
,p_message_text=>'Visualizza dettaglio'
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140163809203751671)
,p_name=>'APEXIR_VIEW_DOES_NOT_EXIST'
,p_message_language=>'it'
,p_message_text=>'Nessun vista %0 definita per il report.'
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140119695060751658)
,p_name=>'APEXIR_VIEW_GROUP_BY'
,p_message_language=>'it'
,p_message_text=>'Visualizza raggruppamento'
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140119447768751657)
,p_name=>'APEXIR_VIEW_ICONS'
,p_message_language=>'it'
,p_message_text=>'Visualizza icone'
,p_version_scn=>2705059
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140089377275751649)
,p_name=>'APEXIR_VIEW_PIVOT'
,p_message_language=>'it'
,p_message_text=>'Visualizza pivot'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140061028216751640)
,p_name=>'APEXIR_VIEW_REPORT'
,p_message_language=>'it'
,p_message_text=>'Visualizza report'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140113603010751656)
,p_name=>'APEXIR_WEEKLY'
,p_message_language=>'it'
,p_message_text=>'Settimanale'
,p_version_scn=>2705058
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140043733979751635)
,p_name=>'APEXIR_WORKING_REPORT'
,p_message_language=>'it'
,p_message_text=>'Report di lavoro'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140141435865751664)
,p_name=>'APEXIR_X_DAYS'
,p_message_language=>'it'
,p_message_text=>'%0 giorni'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140141347054751664)
,p_name=>'APEXIR_X_HOURS'
,p_message_language=>'it'
,p_message_text=>'%0 ore'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140141292093751664)
,p_name=>'APEXIR_X_MINS'
,p_message_language=>'it'
,p_message_text=>'%0 minuti'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140141652711751664)
,p_name=>'APEXIR_X_MONTHS'
,p_message_language=>'it'
,p_message_text=>'%0 mesi'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140141525609751664)
,p_name=>'APEXIR_X_WEEKS'
,p_message_language=>'it'
,p_message_text=>'%0 settimane'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140141711171751664)
,p_name=>'APEXIR_X_YEARS'
,p_message_language=>'it'
,p_message_text=>'%0 anni'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140139466119751663)
,p_name=>'APEXIR_YEAR'
,p_message_language=>'it'
,p_message_text=>'Anno'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140017673157751627)
,p_name=>'APEXIR_YELLOW'
,p_message_language=>'it'
,p_message_text=>'giallo'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140019189949751628)
,p_name=>'APEXIR_YES'
,p_message_language=>'it'
,p_message_text=>unistr('S\00EC')
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140053601030751638)
,p_name=>'APEX_GROUP.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE'
,p_message_language=>'it'
,p_message_text=>'%0 contiene < o >, che sono caratteri non validi.'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140077578650751645)
,p_name=>'APEX_REGION'
,p_message_language=>'it'
,p_message_text=>'Area'
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139968606977751613)
,p_name=>'APEX_ZIP.EXTRACT_FAILED'
,p_message_language=>'it'
,p_message_text=>'Impossibile estrarre un file ZIP.'
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139968560543751613)
,p_name=>'APEX_ZIP.INVALID_ZIPFILE'
,p_message_language=>'it'
,p_message_text=>unistr('Firma di end-of-central-directory non trovata. Questo file non \00E8 un file ZIP.')
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139999652650751622)
,p_name=>'API_PRECONDITION_VIOLATED'
,p_message_language=>'it'
,p_message_text=>'Precondizione interfaccia API violata'
,p_version_scn=>2705035
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140021748763751629)
,p_name=>'APP.SETTING.CANNOT.GET'
,p_message_language=>'it'
,p_message_text=>unistr('Impossibile ottenere il valore per l''impostazione applicazione %0 perch\00E9 l''opzione di creazione associata \00E8 disabilitata.')
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140021654409751629)
,p_name=>'APP.SETTING.CANNOT.SET'
,p_message_language=>'it'
,p_message_text=>unistr('Impossibile impostare il valore per l''impostazione applicazione %0 perch\00E9 l''opzione di creazione associata \00E8 disabilitata.')
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140134254512751662)
,p_name=>'APP.SETTING.INVALID.VALUE'
,p_message_language=>'it'
,p_message_text=>unistr('Il valore dell''impostazione applicazione %0 non \00E8 valido')
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140134184021751662)
,p_name=>'APP.SETTING.NOT.DEFINED'
,p_message_language=>'it'
,p_message_text=>unistr('L''impostazione applicazione %0 richiesta non \00E8 definita')
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140134362553751662)
,p_name=>'APP.SETTING.VALUE.NOT.NULL'
,p_message_language=>'it'
,p_message_text=>unistr('L''impostazione applicazione %0 non pu\00F2 essereimpostata su un valore nullo')
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140008279092751625)
,p_name=>'BACK'
,p_message_language=>'it'
,p_message_text=>'Indietro'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139990637206751619)
,p_name=>'BUILDER'
,p_message_language=>'it'
,p_message_text=>'Builder'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140064290904751641)
,p_name=>'BUTTON LABEL'
,p_message_language=>'it'
,p_message_text=>'Etichetta pulsante'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139987550494751618)
,p_name=>'BUTTON_CSS_CLASSES'
,p_message_language=>'it'
,p_message_text=>'Classi CSS pulsanti'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140026082735751630)
,p_name=>'BUTTON_ID'
,p_message_language=>'it'
,p_message_text=>unistr('L''ID pulsante generato sar\00E0 l''ID statico del pulsante se definito oppure in caso contrario sar\00E0 un ID generato internamente nel formato ''B'' || [ID pulsante interno]')
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139960001894751610)
,p_name=>'CANDLESTICK'
,p_message_language=>'it'
,p_message_text=>'A canne d''organo'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140074072894751644)
,p_name=>'CENTER'
,p_message_language=>'it'
,p_message_text=>'Al centro'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140020697145751628)
,p_name=>'CHANGE_PW_REQUEST'
,p_message_language=>'it'
,p_message_text=>'%0 richiesta'
,p_version_scn=>2705040
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140010661608751625)
,p_name=>'CHECK$'
,p_message_language=>'it'
,p_message_text=>'selettore di righe'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140136086241751662)
,p_name=>'CHECKED'
,p_message_language=>'it'
,p_message_text=>'selezionato'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140112457484751655)
,p_name=>'COLUMN'
,p_message_language=>'it'
,p_message_text=>'Colonna'
,p_version_scn=>2705056
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140070086277751643)
,p_name=>'COMMENTS'
,p_message_language=>'it'
,p_message_text=>'Commenti'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140051015337751637)
,p_name=>'CONTINUE'
,p_message_language=>'it'
,p_message_text=>'Continua'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140008542689751625)
,p_name=>'COPYRIGHT'
,p_message_language=>'it'
,p_message_text=>unistr('Copyright \00A9 1999-%0, Oracle e/o relative consociate.')
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140056730904751639)
,p_name=>'COUNT'
,p_message_language=>'it'
,p_message_text=>'Conteggio'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140063740168751641)
,p_name=>'CREATE'
,p_message_language=>'it'
,p_message_text=>'Crea'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140119162211751657)
,p_name=>'CREATED'
,p_message_language=>'it'
,p_message_text=>'Data creazione'
,p_version_scn=>2705059
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140119226440751657)
,p_name=>'CREATED_BY'
,p_message_language=>'it'
,p_message_text=>'Creazione di'
,p_version_scn=>2705059
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140040133455751634)
,p_name=>'CREATED_ON'
,p_message_language=>'it'
,p_message_text=>'Data creazione'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140051295853751637)
,p_name=>'CUSTOM'
,p_message_language=>'it'
,p_message_text=>'Personalizzato'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140062425168751641)
,p_name=>'CUSTOMIZE'
,p_message_language=>'it'
,p_message_text=>'Personalizza'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140064403772751641)
,p_name=>'CUSTOMIZE.USER_PAGE_PREFS_RESET'
,p_message_language=>'it'
,p_message_text=>'Preferenze di pagina reimpostate per l''utente %0.'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140064523940751641)
,p_name=>'CUSTOMIZE.USER_PREFS_CHANGED'
,p_message_language=>'it'
,p_message_text=>'Preferenze modificate per l''utente %0.'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140064317487751641)
,p_name=>'CUSTOMIZE.USER_PREFS_RESET'
,p_message_language=>'it'
,p_message_text=>'Preferenze di pagina reimpostate per l''utente %0.'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140025457967751630)
,p_name=>'DAILY'
,p_message_language=>'it'
,p_message_text=>'Giornaliero'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139988884079751619)
,p_name=>'DATA.LOAD.INVALID_FILE'
,p_message_language=>'it'
,p_message_text=>unistr('Il file caricato non \00E8 valido oppure l''estensione \00E8 errata.')
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140020872488751628)
,p_name=>'DATA.LOAD.INVALID_SELECTOR'
,p_message_language=>'it'
,p_message_text=>'Utilizzato selettore XML o JSON non valido.'
,p_version_scn=>2705040
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139965991337751612)
,p_name=>'DATA.LOAD.NO_COMMON_COLUMNS'
,p_message_language=>'it'
,p_message_text=>'Il profilo dati e il file caricato non contengono alcuna colonna della tabella di destinazione.'
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140079890674751646)
,p_name=>'DATA.LOAD.NO_FILE_CONTENTS'
,p_message_language=>'it'
,p_message_text=>'Nessun dato trovato nel file caricato.'
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140079912730751646)
,p_name=>'DATA.LOAD.NO_WORKSHEET_CONTENTS'
,p_message_language=>'it'
,p_message_text=>'Nessun dato trovato nel foglio di lavoro "%0".'
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139985778593751618)
,p_name=>'DATA.LOAD.NO_XLSX_FILE'
,p_message_language=>'it'
,p_message_text=>unistr('Il file specificato non \00E8 un file XLSX.')
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139951767605751608)
,p_name=>'DATA.LOAD.ROWS_PROCESSED'
,p_message_language=>'it'
,p_message_text=>'Caricamento dati terminato: %0 righe elaborate.'
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139954024864751609)
,p_name=>'DATA.LOAD.ROWS_PROCESSED_W_ERROR_ROW'
,p_message_language=>'it'
,p_message_text=>'Caricamento dati terminato: %0 righe elaborate con 1 errore.'
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139954386057751609)
,p_name=>'DATA.LOAD.ROWS_PROCESSED_W_ERROR_ROWS'
,p_message_language=>'it'
,p_message_text=>'Caricamento dati terminato: %0 righe elaborate con %1 errori.'
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139954125711751609)
,p_name=>'DATA.LOAD.ROW_PROCESSED'
,p_message_language=>'it'
,p_message_text=>'Caricamento dati terminato: 1 riga elaborata.'
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139968441594751613)
,p_name=>'DATA.LOAD.ROW_PROCESSED_W_ERROR_ROW'
,p_message_language=>'it'
,p_message_text=>'Caricamento dati terminato: 1 riga elaborata con errori.'
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139954274728751609)
,p_name=>'DATA.LOAD.ROW_PROCESSED_W_ERROR_ROWS'
,p_message_language=>'it'
,p_message_text=>'Caricamento dati terminato: 1 riga elaborata senza errori.'
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140086957253751648)
,p_name=>'DATA_LOAD.COLUMN_NAMES_MAPPING'
,p_message_language=>'it'
,p_message_text=>'Colonna di destinazione'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139994187689751620)
,p_name=>'DATA_LOAD.DO_NOT_LOAD'
,p_message_language=>'it'
,p_message_text=>'Non caricare'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139994236438751620)
,p_name=>'DATA_LOAD.FAILED'
,p_message_language=>'it'
,p_message_text=>'Errore di pre-elaborazione'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140087034782751648)
,p_name=>'DATA_LOAD.FIRST_COLUMN_NAMES'
,p_message_language=>'it'
,p_message_text=>'Colonna di origine'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140087869609751648)
,p_name=>'DATA_LOAD.FORMAT'
,p_message_language=>'it'
,p_message_text=>'Formato data/numero'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139993903406751620)
,p_name=>'DATA_LOAD.INSERT'
,p_message_language=>'it'
,p_message_text=>'Inserisci riga'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140150033028751667)
,p_name=>'DATA_LOAD.LOOKUP_FAILED'
,p_message_language=>'it'
,p_message_text=>'Recupero del valore di ricerca non riuscito.'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140119715754751658)
,p_name=>'DATA_LOAD.MAPPING'
,p_message_language=>'it'
,p_message_text=>'Mapping dati/tabella'
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140087989874751648)
,p_name=>'DATA_LOAD.ROW'
,p_message_language=>'it'
,p_message_text=>'Riga'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139994338065751620)
,p_name=>'DATA_LOAD.SEQUENCE_ACTION'
,p_message_language=>'it'
,p_message_text=>'Sequenza: azione'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140081658265751646)
,p_name=>'DATA_LOAD.TRANSFORMATION_FAILED'
,p_message_language=>'it'
,p_message_text=>'Errore della regola di trasformazione'
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139994022892751620)
,p_name=>'DATA_LOAD.UPDATE'
,p_message_language=>'it'
,p_message_text=>'Aggiorna riga'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140056338770751639)
,p_name=>'DATE'
,p_message_language=>'it'
,p_message_text=>'Data'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140029207637751631)
,p_name=>'DAY'
,p_message_language=>'it'
,p_message_text=>'giorno'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140029397890751631)
,p_name=>'DAYS'
,p_message_language=>'it'
,p_message_text=>'giorni'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140069701736751643)
,p_name=>'DEBUGGING_OFF'
,p_message_language=>'it'
,p_message_text=>'Debug non abilitato per questa applicazione.'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140121468029751658)
,p_name=>'DEFAULT'
,p_message_language=>'it'
,p_message_text=>'Predefinito'
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140030056316751631)
,p_name=>'DELETE'
,p_message_language=>'it'
,p_message_text=>'eliminazione'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140005678826751624)
,p_name=>'DELETE_MSG'
,p_message_language=>'it'
,p_message_text=>'Eseguire questa azione di eliminazione?'
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139985246139751618)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES'
,p_message_language=>'it'
,p_message_text=>'Sostituzioni sessioni'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139986116382751618)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ENABLE'
,p_message_language=>'it'
,p_message_text=>'Abilita sostituzioni sessioni'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139987051694751618)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ERROR_LOAD'
,p_message_language=>'it'
,p_message_text=>unistr('Si \00E8 verificato un errore durante il caricamento delle sostituzioni delle sessioni.')
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139986861051751618)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ERROR_SAVE'
,p_message_language=>'it'
,p_message_text=>unistr('Si \00E8 verificato un errore durante il salvataggio delle sostituzioni delle sessioni.')
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139986736006751618)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_SAVED'
,p_message_language=>'it'
,p_message_text=>'Sostituzioni delle sessioni salvate. Chiudere questa finestra di dialogo per visualizzare le modifiche.'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139959935265751610)
,p_name=>'DIAL_PCT'
,p_message_language=>'it'
,p_message_text=>'Quadrante (Percentuale)'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140000914043751622)
,p_name=>'DOWNLOAD'
,p_message_language=>'it'
,p_message_text=>'Scarica'
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140120556064751658)
,p_name=>'DUP_USER'
,p_message_language=>'it'
,p_message_text=>'Nome utente duplicato nella lista.'
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140009357615751625)
,p_name=>'EDIT'
,p_message_language=>'it'
,p_message_text=>'Modifica'
,p_is_js_message=>true
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140020524507751628)
,p_name=>'EMAIL_NOT_FOUND'
,p_message_language=>'it'
,p_message_text=>'Indirizzo di posta elettronica "%0" non trovato.'
,p_version_scn=>2705040
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140003298833751623)
,p_name=>'EMAIL_SENT_BY'
,p_message_language=>'it'
,p_message_text=>unistr('Questo messaggio di posta elettronica \00E8 stato inviato da %0.')
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140120703677751658)
,p_name=>'EMAIL_TOO_LONG'
,p_message_language=>'it'
,p_message_text=>unistr('Indirizzo di posta elettronica troppo lungo. Il limite \00E8 di 240 caratteri.')
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140050993637751637)
,p_name=>'ERROR'
,p_message_language=>'it'
,p_message_text=>'Errore'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140081771592751646)
,p_name=>'ERROR_SET_ITEM_STATE_FOR_PPR_REGION'
,p_message_language=>'it'
,p_message_text=>'Impossibile impostare il valore di origine dell''elemento di pagina per l''area di aggiornamento di pagina parziale.'
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140042249821751635)
,p_name=>'F4500_P10_CREATED_BY'
,p_message_language=>'it'
,p_message_text=>'Creazione di'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140003546796751623)
,p_name=>'F4500_P2613_EXPIRED'
,p_message_language=>'it'
,p_message_text=>'Password scaduta'
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139995984407751621)
,p_name=>'FILE_EMPTY'
,p_message_language=>'it'
,p_message_text=>unistr('Il file \00E8 vuoto.')
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140085786343751647)
,p_name=>'FILE_TOO_LARGE'
,p_message_language=>'it'
,p_message_text=>unistr('La dimensione del file caricato \00E8 superiore a %0 MB. Caricare un file pi\00F9 piccolo.')
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140005851333751624)
,p_name=>'FILE_UPLOAD_AUTHENTICATION_ERR'
,p_message_language=>'it'
,p_message_text=>unistr('Autenticazione utente non riuscita. Uno o pi\00F9 file non caricati.')
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140005912070751624)
,p_name=>'FILE_UPLOAD_PUBLICUSER_ERR'
,p_message_language=>'it'
,p_message_text=>'Questa istanza non consente il caricamento dei file agli utenti non autenticati.'
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140085823936751647)
,p_name=>'FILTERS'
,p_message_language=>'it'
,p_message_text=>'Filtri'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140063804396751641)
,p_name=>'FLOW.SINGLE_VALIDATION_ERROR'
,p_message_language=>'it'
,p_message_text=>unistr('Si \00E8 verificato 1 errore')
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140063078567751641)
,p_name=>'FLOW.VALIDATION_ERROR'
,p_message_language=>'it'
,p_message_text=>'Si sono verificati %0 errori'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140008460048751625)
,p_name=>'FORM_OF'
,p_message_language=>'it'
,p_message_text=>'%0 di %1'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140047450281751636)
,p_name=>'GO'
,p_message_language=>'it'
,p_message_text=>'Vai'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140149675843751666)
,p_name=>'HELP'
,p_message_language=>'it'
,p_message_text=>'Guida'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139990760349751619)
,p_name=>'HOME'
,p_message_language=>'it'
,p_message_text=>'Home'
,p_is_js_message=>true
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140029048242751631)
,p_name=>'HOUR'
,p_message_language=>'it'
,p_message_text=>'ora'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140029139744751631)
,p_name=>'HOURS'
,p_message_language=>'it'
,p_message_text=>'ore'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140010595723751625)
,p_name=>'ICON'
,p_message_language=>'it'
,p_message_text=>'Icona %0'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139987897011751619)
,p_name=>'ICON.EDITOR.CROP.HELP'
,p_message_language=>'it'
,p_message_text=>'Guida per il ritaglio dell''icona'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139989074942751619)
,p_name=>'ICON.EDITOR.CROPPER.HELPTEXT'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Trascinare l''icona e utilizzare il dispositivo di scorrimento dello zoom per riposizionarla nel riquadro.</p>',
'',
'<p>In fase di caricamento, la nuova icona viene ridimensionata in base a tre formati: favicon, icona piccola e icona grande.</p>',
'',
'<p>Quando si attiva lo strumento di ritaglio dell''icona, sono disponibili i seguenti collegamenti da tastiera:</p>',
'<ul>',
'    <li>Freccia sinistra: sposta l''immagine a sinistra*</li>',
'    <li>Freccia su: sposta l''immagine in alto*</li>',
'    <li>Freccia a destra: sposta l''immagine a destra*</li>',
unistr('    <li>Freccia gi\00F9: sposta l''immagine in basso*</li>'),
'    <li>I: ingrandisce</li>',
'    <li>O: riduce</li>',
'    <li>L: ruota a sinistra</li>',
'    <li>R: ruota a destra</li>',
'</ul>',
'',
unistr('<p class="margin-top-md"><em>*Tenere premuto Maiusc per eseguire lo spostamento pi\00F9 rapidamente</em></p>')))
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139994530081751621)
,p_name=>'ICON.EDITOR.CROPPER.SUBTITLE'
,p_message_language=>'it'
,p_message_text=>'Trascinare per riposizionare l''icona'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139994627416751621)
,p_name=>'ICON.EDITOR.CROPPER.ZOOM_SLIDER_LABEL'
,p_message_language=>'it'
,p_message_text=>'Spostare il dispositivo di scorrimento per regolare il livello di zoom'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139987669559751619)
,p_name=>'ICON.EDITOR.DIALOG.TITLE'
,p_message_language=>'it'
,p_message_text=>'Modifica icona applicazione'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139987959854751619)
,p_name=>'ICON.EDITOR.ERROR.SAVING'
,p_message_language=>'it'
,p_message_text=>'Errore durante il salvataggio dell''icona'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140070386628751643)
,p_name=>'ICON.EDITOR.LEGACY_DATA'
,p_message_language=>'it'
,p_message_text=>'<p><span class="a-Icon icon-tr-warning"></span> Questa applicazione utilizza icone precedenti. Se si carica una nuova icona, tutte le icone precedenti verranno sostituite.</p>'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139988522106751619)
,p_name=>'ICON.EDITOR.UPLOAD.ICON'
,p_message_language=>'it'
,p_message_text=>'Carica una nuova icona'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140064767482751641)
,p_name=>'INVALID_CREDENTIALS'
,p_message_language=>'it'
,p_message_text=>'Credenziali di login non valide'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140165832327751671)
,p_name=>'INVALID_VALUE_FOR_PARAMETER'
,p_message_language=>'it'
,p_message_text=>'Valore non valido per il parametro: %0'
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140059053818751640)
,p_name=>'IR_AS_DEFAULT_REPORT_SETTING'
,p_message_language=>'it'
,p_message_text=>'Come impostazioni predefinite report'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140059128196751640)
,p_name=>'IR_AS_NAMED_REPORT'
,p_message_language=>'it'
,p_message_text=>'Come report denominato'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140041053780751634)
,p_name=>'IR_ERROR'
,p_message_language=>'it'
,p_message_text=>'Errore %0. %1'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140040743949751634)
,p_name=>'IR_FRM_NAV_ERROR'
,p_message_language=>'it'
,p_message_text=>'Impossibile eseguire il calcolo dalla navigazione. %0'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140016347912751627)
,p_name=>'IR_NOT_FOUND'
,p_message_language=>'it'
,p_message_text=>'Report interattivo non trovato.'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140015780249751627)
,p_name=>'IR_REGION_NOT_EXIST'
,p_message_language=>'it'
,p_message_text=>'L''area report interattivo non esiste nell''applicazione %0, pagina %1 e area %2.'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140058905173751640)
,p_name=>'IR_STAR'
,p_message_language=>'it'
,p_message_text=>'Visualizzato solo per gli sviluppatori'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140047110441751636)
,p_name=>'IR_UNIQUE_KEY_ERROR'
,p_message_language=>'it'
,p_message_text=>unistr('La query di report deve avere una chiave univoca che identifica ogni riga. La chiave specificata non pu\00F2 essere utilizzata per questa query. Definire una colonna con chiave univoca. %0')
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140047210304751636)
,p_name=>'IR_UNIQUE_KEY_ERROR2'
,p_message_language=>'it'
,p_message_text=>unistr('La query di report deve avere una chiave univoca che identifica ogni riga. La chiave specificata non pu\00F2 essere utilizzata per questa query. Modificare gli attributi del report per definire una colonna con chiave univoca. %0')
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140088192396751648)
,p_name=>'ITEM.FILE_UPLOAD.CHOOSE_FILE'
,p_message_language=>'it'
,p_message_text=>'Scegli file'
,p_is_js_message=>true
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140088033303751648)
,p_name=>'ITEM.FILE_UPLOAD.DRAG_DROP_FILE_HERE'
,p_message_language=>'it'
,p_message_text=>'Trascinare i file qui oppure'
,p_is_js_message=>true
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140008795524751625)
,p_name=>'ITEMS'
,p_message_language=>'it'
,p_message_text=>'Elementi'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140042462987751635)
,p_name=>'ITEM_VALUE'
,p_message_language=>'it'
,p_message_text=>'Valore elemento'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140057059170751639)
,p_name=>'LABEL'
,p_message_language=>'it'
,p_message_text=>'Etichetta'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140069678870751643)
,p_name=>'LANGUAGE'
,p_message_language=>'it'
,p_message_text=>'Lingua'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140029779067751631)
,p_name=>'LAST'
,p_message_language=>'it'
,p_message_text=>'ultimo'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140005730118751624)
,p_name=>'LENGTH'
,p_message_language=>'it'
,p_message_text=>'Lunghezza'
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140064063574751641)
,p_name=>'LOGIN'
,p_message_language=>'it'
,p_message_text=>'Esegui login'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140105613675751653)
,p_name=>'MANAGE'
,p_message_language=>'it'
,p_message_text=>'Gestisci'
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140168763860751672)
,p_name=>'MAXIMIZE'
,p_message_language=>'it'
,p_message_text=>'Ingrandisci'
,p_is_js_message=>true
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140028823545751631)
,p_name=>'MINUTE'
,p_message_language=>'it'
,p_message_text=>'minuto'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140028915200751631)
,p_name=>'MINUTES'
,p_message_language=>'it'
,p_message_text=>'minuti'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140120955177751658)
,p_name=>'MISSING_AT'
,p_message_language=>'it'
,p_message_text=>'"@" mancante nell''indirizzo di posta elettronica.'
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140121153216751658)
,p_name=>'MISSING_DIALOG_PAGE_TEMPLATE_WARNING'
,p_message_language=>'it'
,p_message_text=>unistr('Avvertenza: non \00E8 stato definito alcun modello Pagina finestra di dialogo per la pagina di finestra di dialogo %0 nell''applicazione %1.')
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140120863823751658)
,p_name=>'MISSING_DOT'
,p_message_language=>'it'
,p_message_text=>'"." mancante nel dominio dell''indirizzo di posta elettronica.'
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140067170353751642)
,p_name=>'MODULE'
,p_message_language=>'it'
,p_message_text=>'Modulo'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140021376264751628)
,p_name=>'MONTH'
,p_message_language=>'it'
,p_message_text=>'Mese'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140025272288751630)
,p_name=>'MONTHLY'
,p_message_language=>'it'
,p_message_text=>'Mensile'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140021493982751628)
,p_name=>'MONTHS'
,p_message_language=>'it'
,p_message_text=>'mesi'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140056670515751639)
,p_name=>'MOVE'
,p_message_language=>'it'
,p_message_text=>'Sposta'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140127441403751660)
,p_name=>'MOVE_FROM'
,p_message_language=>'it'
,p_message_text=>'Sposta da'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140127534486751660)
,p_name=>'MOVE_TO'
,p_message_language=>'it'
,p_message_text=>'Sposta in'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140043636610751635)
,p_name=>'MRU.ERROR_IN_MRD'
,p_message_language=>'it'
,p_message_text=>unistr('Errore nell''operazione di eliminazione di pi\00F9 righe: riga= %0, %1, %2')
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140042681759751635)
,p_name=>'MUST_NOT_BE_PUBLIC_USER'
,p_message_language=>'it'
,p_message_text=>'Non deve essere un utente pubblico'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139991211044751620)
,p_name=>'NAME'
,p_message_language=>'it'
,p_message_text=>'Nome'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140056817230751639)
,p_name=>'NEW'
,p_message_language=>'it'
,p_message_text=>'Nuovo'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140021140441751628)
,p_name=>'NEW_ACCOUNT_LOGIN_INSTRUCTIONS'
,p_message_language=>'it'
,p_message_text=>unistr('\00C8 possibile eseguire il login a %0 andando al seguente indirizzo:')
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140021258642751628)
,p_name=>'NEW_ACCOUNT_NOTIFICATION'
,p_message_language=>'it'
,p_message_text=>'Notifica nuovo account %0'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140149806637751666)
,p_name=>'NEXT'
,p_message_language=>'it'
,p_message_text=>'Successivo'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140067017574751642)
,p_name=>'NO'
,p_message_language=>'it'
,p_message_text=>'No'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140163962077751671)
,p_name=>'NOBODY'
,p_message_language=>'it'
,p_message_text=>'nessuno'
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140030128636751631)
,p_name=>'NOT'
,p_message_language=>'it'
,p_message_text=>'Non'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140073087716751644)
,p_name=>'NOT_NULL'
,p_message_language=>'it'
,p_message_text=>'Non nullo'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140042767086751635)
,p_name=>'NOT_W_ARGUMENT'
,p_message_language=>'it'
,p_message_text=>'Non %0'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140062572081751641)
,p_name=>'NO_DATA_FOUND'
,p_message_language=>'it'
,p_message_text=>'nessun dato trovato'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140072551539751644)
,p_name=>'NO_UPDATEABLE_REPORT_FOUND'
,p_message_language=>'it'
,p_message_text=>unistr('Nessun report aggiornabile trovato. Le operazioni di aggiornamento ed eliminazione di pi\00F9 righe possono essere eseguite solo su form tabulari di tipo ''report aggiornabile''.')
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140073414493751644)
,p_name=>'OK'
,p_message_language=>'it'
,p_message_text=>'OK'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140068704778751642)
,p_name=>'ORACLE_APPLICATION_EXPRESS'
,p_message_language=>'it'
,p_message_text=>'Oracle APEX'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140167653438751672)
,p_name=>'ORA_06550'
,p_message_language=>'it'
,p_message_text=>'ORA-06550: riga %0, colonna %1'
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140118578152751657)
,p_name=>'OUTDATED_BROWSER'
,p_message_language=>'it'
,p_message_text=>'Si sta usando un browser Web obsoleto. Per conoscere la lista dei browser supportati, consultare la Guida all''installazione di Oracle APEX.'
,p_version_scn=>2705059
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140013522039751626)
,p_name=>'OUT_OF_RANGE'
,p_message_language=>'it'
,p_message_text=>'Richiesto set di righe non valido, i dati di origine del report sono stati modificati.'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140035590360751633)
,p_name=>'P.VALID_PAGE_ERR'
,p_message_language=>'it'
,p_message_text=>'Specificare un numero di pagina valido, ad esempio p?n=1234.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140039718344751634)
,p_name=>'PAGINATION.NEXT'
,p_message_language=>'it'
,p_message_text=>'Successivo'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140039828348751634)
,p_name=>'PAGINATION.NEXT_SET'
,p_message_language=>'it'
,p_message_text=>'Set successivo'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140039936339751634)
,p_name=>'PAGINATION.PREVIOUS'
,p_message_language=>'it'
,p_message_text=>'Precedente'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140040022234751634)
,p_name=>'PAGINATION.PREVIOUS_SET'
,p_message_language=>'it'
,p_message_text=>'Set precedente'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140149710027751666)
,p_name=>'PAGINATION.SELECT'
,p_message_language=>'it'
,p_message_text=>'Seleziona impaginazione'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140079732296751646)
,p_name=>'PASSWORD'
,p_message_language=>'it'
,p_message_text=>'Password'
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140020491439751628)
,p_name=>'PASSWORD_CHANGED'
,p_message_language=>'it'
,p_message_text=>unistr('La password per %0 \00E8 stata modificata.')
,p_version_scn=>2705040
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140008111023751625)
,p_name=>'PASSWORD_COMPLEXITY_ERROR'
,p_message_language=>'it'
,p_message_text=>unistr('La password non \00E8 conforme alle regole di complessit\00E0 password di questo sito.')
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140007275858751624)
,p_name=>'PASSWORD_DIFFERS_BY_ERR'
,p_message_language=>'it'
,p_message_text=>'La nuova password deve differire dalla vecchia di almeno %0 caratteri.'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140007868298751625)
,p_name=>'PASSWORD_LIKE_USERNAME_ERR'
,p_message_language=>'it'
,p_message_text=>'La password non deve contenere il nome utente.'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140008060192751625)
,p_name=>'PASSWORD_LIKE_WORDS_ERR'
,p_message_language=>'it'
,p_message_text=>'La password contiene una parola semplice non consentita.'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140007967094751625)
,p_name=>'PASSWORD_LIKE_WORKSPACE_NAME_ERR'
,p_message_language=>'it'
,p_message_text=>'La password non deve contenere il nome dell''area di lavoro.'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140007149023751624)
,p_name=>'PASSWORD_MIN_LEN_ERR'
,p_message_language=>'it'
,p_message_text=>'La password deve contenere almeno %0 caratteri.'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140007306794751624)
,p_name=>'PASSWORD_ONE_ALPHA_ERR'
,p_message_language=>'it'
,p_message_text=>'La password deve contenere almeno un carattere alfabetico (%0).'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140007715856751624)
,p_name=>'PASSWORD_ONE_LOWER_ERR'
,p_message_language=>'it'
,p_message_text=>'La password deve contenere almeno un carattere alfabetico minuscolo.'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140007487448751624)
,p_name=>'PASSWORD_ONE_NUMERIC_ERR'
,p_message_language=>'it'
,p_message_text=>'La password deve contenere almeno un carattere numerico (0123456789).'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140007516155751624)
,p_name=>'PASSWORD_ONE_PUNCTUATION_ERR'
,p_message_language=>'it'
,p_message_text=>'La password deve contenere almeno un carattere di punteggiatura (%0).'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140007638252751624)
,p_name=>'PASSWORD_ONE_UPPER_ERR'
,p_message_language=>'it'
,p_message_text=>'La password deve contenere almeno un carattere alfabetico maiuscolo.'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140020998381751628)
,p_name=>'PASSWORD_RESET_NOTIFICATION'
,p_message_language=>'it'
,p_message_text=>'Notifica di reimpostazione password'
,p_version_scn=>2705040
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140006013310751624)
,p_name=>'PASSWORD_REUSE_ERROR'
,p_message_language=>'it'
,p_message_text=>unistr('\00C8 possibile che la password non possa essere utilizzata perch\00E9 utilizzata negli ultimi %0 giorni.')
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140002771924751623)
,p_name=>'PCT_GRAPH_ARIA_LABEL'
,p_message_language=>'it'
,p_message_text=>'Grafico di percentuale'
,p_is_js_message=>true
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140094384252751650)
,p_name=>'PE.COMPONEN.TYPE.PAGE_ITEM.PLURAL'
,p_message_language=>'it'
,p_message_text=>'Elementi'
,p_version_scn=>2705053
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140094496274751650)
,p_name=>'PE.COMPONEN.TYPE.PAGE_ITEM.SINGULAR'
,p_message_language=>'it'
,p_message_text=>'Elemento'
,p_version_scn=>2705053
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140068502411751642)
,p_name=>'PERCENT'
,p_message_language=>'it'
,p_message_text=>'Percentuale'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140037804491751633)
,p_name=>'PLEASE_CONTACT_ADMINISTRATOR'
,p_message_language=>'it'
,p_message_text=>'Contattare l''amministratore.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140149955556751667)
,p_name=>'PREVIOUS'
,p_message_language=>'it'
,p_message_text=>'Precedente'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140086576101751648)
,p_name=>'PRINT'
,p_message_language=>'it'
,p_message_text=>'Stampa'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140067343400751642)
,p_name=>'PRIVILEGES'
,p_message_language=>'it'
,p_message_text=>'Privilegi'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140035993326751633)
,p_name=>'REGIOIN_REFERENCES'
,p_message_language=>'it'
,p_message_text=>'Riferimenti delle aree'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140056943901751639)
,p_name=>'REPORT'
,p_message_language=>'it'
,p_message_text=>'Report'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140067227807751642)
,p_name=>'REPORTING_PERIOD'
,p_message_language=>'it'
,p_message_text=>'Periodo report'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140150146514751667)
,p_name=>'REPORT_LABEL'
,p_message_language=>'it'
,p_message_text=>'Report: %0'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140067948970751642)
,p_name=>'REPORT_TOTAL'
,p_message_language=>'it'
,p_message_text=>'Totale report'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140013647884751626)
,p_name=>'RESET'
,p_message_language=>'it'
,p_message_text=>'Reimposta impaginazione'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140042374925751635)
,p_name=>'RESET_PAGINATION'
,p_message_language=>'it'
,p_message_text=>'Reimposta impaginazione'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140072479146751644)
,p_name=>'RESET_PASSWORD'
,p_message_language=>'it'
,p_message_text=>'Reimposta password'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140048285502751636)
,p_name=>'RESTORE'
,p_message_language=>'it'
,p_message_text=>'Ripristina'
,p_is_js_message=>true
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140081877142751646)
,p_name=>'RESULTS'
,p_message_language=>'it'
,p_message_text=>'Risultati'
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140073568789751644)
,p_name=>'RETURN_TO_APPLICATION'
,p_message_language=>'it'
,p_message_text=>'Torna all''applicazione.'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140073991002751644)
,p_name=>'RIGHT'
,p_message_language=>'it'
,p_message_text=>'A destra'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140105935536751653)
,p_name=>'ROW'
,p_message_language=>'it'
,p_message_text=>'Riga %0'
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140056597869751639)
,p_name=>'ROW_COUNT'
,p_message_language=>'it'
,p_message_text=>'Conteggio righe'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139946338091751606)
,p_name=>'RW_AO_ASK_ORACLE'
,p_message_language=>'it'
,p_message_text=>'Chiedi a Oracle'
,p_is_js_message=>true
,p_version_scn=>2705024
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139946634064751606)
,p_name=>'RW_AO_CLOSE_ASK_ORACLE'
,p_message_language=>'it'
,p_message_text=>'Chiudi Chiedi a Oracle'
,p_is_js_message=>true
,p_version_scn=>2705024
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139946936425751607)
,p_name=>'RW_AO_NOTIFICATIONS_LIST'
,p_message_language=>'it'
,p_message_text=>'Lista di notifiche'
,p_is_js_message=>true
,p_version_scn=>2705024
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139946543311751606)
,p_name=>'RW_AO_OPEN_ASK_ORACLE'
,p_message_language=>'it'
,p_message_text=>'Apri Chiedi a Oracle'
,p_is_js_message=>true
,p_version_scn=>2705024
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139946836530751606)
,p_name=>'RW_AO_PRODUCT_MAP'
,p_message_language=>'it'
,p_message_text=>'Mappa del prodotto'
,p_is_js_message=>true
,p_version_scn=>2705024
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139946728741751606)
,p_name=>'RW_AO_SUGGESTIONS_LIST'
,p_message_language=>'it'
,p_message_text=>'Lista di suggerimenti'
,p_is_js_message=>true
,p_version_scn=>2705024
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139947658140751607)
,p_name=>'RW_CLEAR'
,p_message_language=>'it'
,p_message_text=>'Cancella'
,p_is_js_message=>true
,p_version_scn=>2705025
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139947555480751607)
,p_name=>'RW_CLOSE'
,p_message_language=>'it'
,p_message_text=>'Chiudi'
,p_is_js_message=>true
,p_version_scn=>2705025
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139947390854751607)
,p_name=>'RW_FO_VIEW_MORE'
,p_message_language=>'it'
,p_message_text=>'Visualizza altro'
,p_is_js_message=>true
,p_version_scn=>2705024
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139947786084751607)
,p_name=>'RW_GO_TO'
,p_message_language=>'it'
,p_message_text=>'Vai a'
,p_is_js_message=>true
,p_version_scn=>2705025
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139947137523751607)
,p_name=>'RW_GP_STEP'
,p_message_language=>'it'
,p_message_text=>'Passo'
,p_version_scn=>2705024
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139947287545751607)
,p_name=>'RW_GP_STEP_OF'
,p_message_language=>'it'
,p_message_text=>'di'
,p_version_scn=>2705024
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139947001985751607)
,p_name=>'RW_GP_TOGGLE_STEPS'
,p_message_language=>'it'
,p_message_text=>'Attiva/disattiva visualizzazione passi'
,p_version_scn=>2705024
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139946136898751606)
,p_name=>'RW_HIDE_PASSWORD'
,p_message_language=>'it'
,p_message_text=>'Nascondi password'
,p_is_js_message=>true
,p_version_scn=>2705024
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139947421059751607)
,p_name=>'RW_OPEN'
,p_message_language=>'it'
,p_message_text=>'Apri'
,p_is_js_message=>true
,p_version_scn=>2705025
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139945979812751606)
,p_name=>'RW_ORACLE'
,p_message_language=>'it'
,p_message_text=>'Oracle'
,p_is_js_message=>true
,p_version_scn=>2705024
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139946059027751606)
,p_name=>'RW_SHOW_PASSWORD'
,p_message_language=>'it'
,p_message_text=>'Mostra password'
,p_is_js_message=>true
,p_version_scn=>2705024
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139947800198751607)
,p_name=>'RW_START'
,p_message_language=>'it'
,p_message_text=>'Inizio'
,p_is_js_message=>true
,p_version_scn=>2705025
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140072935409751644)
,p_name=>'SAVE'
,p_message_language=>'it'
,p_message_text=>'Salva'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140069171411751643)
,p_name=>'SAVED_REPORTS.ALTERNATIVE.DEFAULT'
,p_message_language=>'it'
,p_message_text=>'Predefinito alternativo'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140069586857751643)
,p_name=>'SAVED_REPORTS.DESCRIPTION'
,p_message_language=>'it'
,p_message_text=>'Descrizione'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140069001607751643)
,p_name=>'SAVED_REPORTS.PRIMARY.DEFAULT'
,p_message_language=>'it'
,p_message_text=>'Predefinito primario'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140069879193751643)
,p_name=>'SC_REPORT_ROWS'
,p_message_language=>'it'
,p_message_text=>'Oltre %0 righe disponibili. Aumentare il selettore di righe per visualizzare altre righe.'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140137269621751663)
,p_name=>'SEARCH'
,p_message_language=>'it'
,p_message_text=>'Cerca'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140028757222751631)
,p_name=>'SECONDS'
,p_message_language=>'it'
,p_message_text=>'secondi'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140068605220751642)
,p_name=>'SEE_ATTACHED'
,p_message_language=>'it'
,p_message_text=>'Vedere l''allegato'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140129292312751660)
,p_name=>'SELECT_ROW'
,p_message_language=>'it'
,p_message_text=>'Seleziona riga'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140068318736751642)
,p_name=>'SET_SCREEN_READER_MODE_OFF'
,p_message_language=>'it'
,p_message_text=>unistr('Disattiva modalit\00E0 lettore di schermo')
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140068497254751642)
,p_name=>'SET_SCREEN_READER_MODE_ON'
,p_message_language=>'it'
,p_message_text=>unistr('Attiva modalit\00E0 lettore di schermo')
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140064661414751641)
,p_name=>'SHOW'
,p_message_language=>'it'
,p_message_text=>'Mostra'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140131052510751661)
,p_name=>'SHOW_ALL'
,p_message_language=>'it'
,p_message_text=>'Mostra tutto'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140155896740751668)
,p_name=>'SIGN_IN'
,p_message_language=>'it'
,p_message_text=>'Connetti'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140106776542751654)
,p_name=>'SIGN_OUT'
,p_message_language=>'it'
,p_message_text=>'Scollega'
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140057585871751639)
,p_name=>'SINCE_DAYS_AGO'
,p_message_language=>'it'
,p_message_text=>'%0 giorni fa'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140065197284751641)
,p_name=>'SINCE_DAYS_FROM_NOW'
,p_message_language=>'it'
,p_message_text=>'%0 giorni da adesso'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140057449589751639)
,p_name=>'SINCE_HOURS_AGO'
,p_message_language=>'it'
,p_message_text=>'%0 ore fa'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140065041249751641)
,p_name=>'SINCE_HOURS_FROM_NOW'
,p_message_language=>'it'
,p_message_text=>'%0 ore da adesso'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140057342483751639)
,p_name=>'SINCE_MINUTES_AGO'
,p_message_language=>'it'
,p_message_text=>'%0 minuti fa'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140064953040751641)
,p_name=>'SINCE_MINUTES_FROM_NOW'
,p_message_language=>'it'
,p_message_text=>'%0 minuti da adesso'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140057756668751639)
,p_name=>'SINCE_MONTHS_AGO'
,p_message_language=>'it'
,p_message_text=>'%0 mesi fa'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140065358735751641)
,p_name=>'SINCE_MONTHS_FROM_NOW'
,p_message_language=>'it'
,p_message_text=>'%0 mesi da adesso'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140065529388751642)
,p_name=>'SINCE_NOW'
,p_message_language=>'it'
,p_message_text=>'Ora'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140057245663751639)
,p_name=>'SINCE_SECONDS_AGO'
,p_message_language=>'it'
,p_message_text=>'%0 secondi fa'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140064897754751641)
,p_name=>'SINCE_SECONDS_FROM_NOW'
,p_message_language=>'it'
,p_message_text=>'%0 secondi da adesso'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140057637767751639)
,p_name=>'SINCE_WEEKS_AGO'
,p_message_language=>'it'
,p_message_text=>'%0 settimane fa'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140065236682751641)
,p_name=>'SINCE_WEEKS_FROM_NOW'
,p_message_language=>'it'
,p_message_text=>'%0 settimane da adesso'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140057868347751639)
,p_name=>'SINCE_YEARS_AGO'
,p_message_language=>'it'
,p_message_text=>'%0 anni fa'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140065457093751642)
,p_name=>'SINCE_YEARS_FROM_NOW'
,p_message_language=>'it'
,p_message_text=>'%0 anni da adesso'
,p_is_js_message=>true
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140051371811751637)
,p_name=>'STANDARD'
,p_message_language=>'it'
,p_message_text=>'Standard'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140068255369751642)
,p_name=>'START_DATE'
,p_message_language=>'it'
,p_message_text=>'Data di inizio'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140003421374751623)
,p_name=>'SUBSCRIPTION_CREATED_BY'
,p_message_language=>'it'
,p_message_text=>unistr('Il mittente di questo messaggio di posta elettronica \00E8 la sottoscrizione a report interattivo creata da %0.')
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140165011835751671)
,p_name=>'SUBSCRIPTION_REFERENCES'
,p_message_language=>'it'
,p_message_text=>'Sottoscrizioni'
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140114441397751656)
,p_name=>'TAB'
,p_message_language=>'it'
,p_message_text=>'Scheda'
,p_version_scn=>2705058
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140028659587751631)
,p_name=>'TITLE'
,p_message_language=>'it'
,p_message_text=>'Titolo'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140008342384751625)
,p_name=>'TODAY'
,p_message_language=>'it'
,p_message_text=>'Oggi'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140067810047751642)
,p_name=>'TOTAL'
,p_message_language=>'it'
,p_message_text=>'Totale'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140009686588751625)
,p_name=>'TO_MANY_COLUMNS_SELECTED'
,p_message_language=>'it'
,p_message_text=>unistr('\00C8 possibile selezionare un massimo di %0 colonne.')
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139965421162751612)
,p_name=>'TREE.COLLAPSE_ALL'
,p_message_language=>'it'
,p_message_text=>'Comprimi tutto'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139966055350751612)
,p_name=>'TREE.COLLAPSE_ALL_BELOW'
,p_message_language=>'it'
,p_message_text=>'Comprimi tutto in basso'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139965061450751612)
,p_name=>'TREE.EXPAND_ALL'
,p_message_language=>'it'
,p_message_text=>'Espandi tutto'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139965789895751612)
,p_name=>'TREE.EXPAND_ALL_BELOW'
,p_message_language=>'it'
,p_message_text=>'Espandi tutto in basso'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139966282430751612)
,p_name=>'TREE.REPARENT'
,p_message_language=>'it'
,p_message_text=>'Assegna a livello padre differente'
,p_is_js_message=>true
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140088372979751648)
,p_name=>'TREES'
,p_message_language=>'it'
,p_message_text=>'Strutture'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140131177532751661)
,p_name=>'UI.FORM.REQUIRED'
,p_message_language=>'it'
,p_message_text=>'Obbligatorio'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140052066007751638)
,p_name=>'UNAUTHORIZED'
,p_message_language=>'it'
,p_message_text=>'Non autorizzato'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140102237090751652)
,p_name=>'UNAVAILABLE'
,p_message_language=>'it'
,p_message_text=>'Non disponibile'
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140065939028751642)
,p_name=>'UNKNOWN'
,p_message_language=>'it'
,p_message_text=>'Sconosciuto'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140004384034751623)
,p_name=>'UNKNOWN_AUTHENTICATION_ERROR'
,p_message_language=>'it'
,p_message_text=>unistr('Si \00E8 verificato un errore di autenticazione non riconosciuto.')
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140006519725751624)
,p_name=>'UNSUBSCRIBE_SUBSCRIPTION_MSG_HTML'
,p_message_language=>'it'
,p_message_text=>unistr('Se non si desidera ricevere pi\00F9 i messaggi di posta elettronica, fare clic su <a href="%0">Annulla sottoscrizione</a> per gestire la sottoscrizione.')
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140003376317751623)
,p_name=>'UNSUBSCRIBE_SUBSCRIPTION_MSG_TXT'
,p_message_language=>'it'
,p_message_text=>unistr('Se non si desidera pi\00F9 ricevere i messaggi di posta elettronica, andare all''URL riportato di seguito per gestire la propria sottoscrizione:')
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140042890778751635)
,p_name=>'UNSUPPORTED_DATA_TYPE'
,p_message_language=>'it'
,p_message_text=>'tipo di dati non supportato'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140029995599751631)
,p_name=>'UPDATE'
,p_message_language=>'it'
,p_message_text=>'aggiornamento'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140028560737751631)
,p_name=>'UPDATED'
,p_message_language=>'it'
,p_message_text=>'Aggiornato'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139971709544751614)
,p_name=>'UPGRADE_IN_PROGRESS'
,p_message_language=>'it'
,p_message_text=>'Upgrade in corso'
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139972052787751614)
,p_name=>'UPGRADE_IN_PROGRESS_DETAIL'
,p_message_language=>'it'
,p_message_text=>unistr('\00C8 in corso l''upgrade di Oracle APEX a una versione pi\00F9 recente. Questo processo richiede generalmente fino a 3 minuti.')
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140035338425751633)
,p_name=>'URL_PROHIBITED'
,p_message_language=>'it'
,p_message_text=>unistr('L''URL richiesto \00E8 stato proibito. Contattare l''amministratore.')
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140056444712751639)
,p_name=>'USER'
,p_message_language=>'it'
,p_message_text=>'Utente'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140079646369751646)
,p_name=>'USERNAME'
,p_message_language=>'it'
,p_message_text=>'Nome utente'
,p_version_scn=>2705047
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140121034123751658)
,p_name=>'USERNAME_TOO_LONG'
,p_message_language=>'it'
,p_message_text=>unistr('Nome utente troppo lungo. Il limite \00E8 di %0 caratteri.')
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140063582840751641)
,p_name=>'USERS'
,p_message_language=>'it'
,p_message_text=>'utenti'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140120617765751658)
,p_name=>'USER_EXISTS'
,p_message_language=>'it'
,p_message_text=>unistr('Il nome utente esiste gi\00E0.')
,p_version_scn=>2705060
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140134457159751662)
,p_name=>'USER_PROFILE_IMAGE'
,p_message_language=>'it'
,p_message_text=>'Immagine profilo per l''utente %0'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139996341121751621)
,p_name=>'UTILIZATION_REPORTS.AUTOMATION'
,p_message_language=>'it'
,p_message_text=>'Automazione - %0'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139994812584751621)
,p_name=>'UTILIZATION_REPORTS.PAGE'
,p_message_language=>'it'
,p_message_text=>'Pagina %0 - %1 '
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139997775568751622)
,p_name=>'UTILIZATION_REPORTS.PLUG_NAME'
,p_message_language=>'it'
,p_message_text=>'%0 - %1'
,p_version_scn=>2705035
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139997881343751622)
,p_name=>'UTILIZATION_REPORTS.PROCESS_NAME'
,p_message_language=>'it'
,p_message_text=>'%0 - %1'
,p_version_scn=>2705035
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139996793506751621)
,p_name=>'UTILIZATION_REPORTS.SEARCH_CONFIG'
,p_message_language=>'it'
,p_message_text=>'Configurazione di ricerca - %0'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139996661643751621)
,p_name=>'UTILIZATION_REPORTS.SHARED_DYNAMIC_LOV'
,p_message_language=>'it'
,p_message_text=>'LOV dinamica condivisa - %0'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139996499961751621)
,p_name=>'UTILIZATION_REPORTS.TASK_DEFINITION'
,p_message_language=>'it'
,p_message_text=>'Definizione task - %0'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139994903502751621)
,p_name=>'UTILIZATION_REPORTS.WORKFLOW'
,p_message_language=>'it'
,p_message_text=>'Workflow - %0 '
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140017098338751627)
,p_name=>'VALID'
,p_message_language=>'it'
,p_message_text=>'Valido'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140008666658751625)
,p_name=>'VALIDATIONS'
,p_message_language=>'it'
,p_message_text=>'Convalide'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140069358551751643)
,p_name=>'VALUE_MUST_BE_SPECIFIED'
,p_message_language=>'it'
,p_message_text=>'Specificare un valore'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140115620464751656)
,p_name=>'VALUE_MUST_BE_SPECIFIED_FOR'
,p_message_language=>'it'
,p_message_text=>'Specificare un valore per %0.'
,p_version_scn=>2705058
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140038283044751633)
,p_name=>'VERTICAL'
,p_message_language=>'it'
,p_message_text=>'verticale'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140029899043751631)
,p_name=>'VIEW'
,p_message_language=>'it'
,p_message_text=>'visualizzazione'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140063614185751641)
,p_name=>'VIEWS'
,p_message_language=>'it'
,p_message_text=>'viste'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140070110368751643)
,p_name=>'VIEW_ALL'
,p_message_language=>'it'
,p_message_text=>'Visualizza tutto'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140010044554751625)
,p_name=>'VISUALLY_HIDDEN_LINK'
,p_message_language=>'it'
,p_message_text=>'Collegamento nascosto'
,p_is_js_message=>true
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140050845232751637)
,p_name=>'WARNING'
,p_message_language=>'it'
,p_message_text=>'Avvertenza'
,p_is_js_message=>true
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140029401673751631)
,p_name=>'WEEK'
,p_message_language=>'it'
,p_message_text=>'settimana'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140025371672751630)
,p_name=>'WEEKLY'
,p_message_language=>'it'
,p_message_text=>'Settimanale'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140029563923751631)
,p_name=>'WEEKS'
,p_message_language=>'it'
,p_message_text=>'settimane'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140069487248751643)
,p_name=>'WELCOME_USER'
,p_message_language=>'it'
,p_message_text=>'Benvenuto/a: %0'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140067662743751642)
,p_name=>'WWV_DBMS_SQL.INVALID_CLOB'
,p_message_language=>'it'
,p_message_text=>unistr('\00C8 stato trovato un valore non valido. Verificare i dati immessi.')
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140067715241751642)
,p_name=>'WWV_DBMS_SQL.INVALID_DATATYPE'
,p_message_language=>'it'
,p_message_text=>unistr('\00C8 stato trovato un valore non valido. Verificare i dati immessi.')
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140005533132751624)
,p_name=>'WWV_DBMS_SQL.INVALID_DATE'
,p_message_language=>'it'
,p_message_text=>unistr('\00C8 stato trovato un valore di data non valido. Verificare il formato della data.')
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140067514928751642)
,p_name=>'WWV_DBMS_SQL.INVALID_NUMBER'
,p_message_language=>'it'
,p_message_text=>unistr('\00C8 stato trovato un valore numerico non valido. Verificare il formato numerico.')
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140016617419751627)
,p_name=>'WWV_DBMS_SQL.INVALID_TIMESTAMP'
,p_message_language=>'it'
,p_message_text=>unistr('\00C8 stato trovato un valore di indicatore orario non valido. Verificare il formato di indicatore orario.')
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140041182862751634)
,p_name=>'WWV_DBMS_SQL.UNABLE_TO_BIND_ERR'
,p_message_language=>'it'
,p_message_text=>unistr('Impossibile associare "%0". Usare le virgolette per gli elementi a pi\00F9 byte oppure verificare che la lunghezza dell''elemento sia pari a 30 byte al massimo. Usare la sintassi v() per fare riferimento agli elementi con lunghezza superiore a 30 byte.')
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140030946654751631)
,p_name=>'WWV_FLOW.ACCESS_DENIED'
,p_message_language=>'it'
,p_message_text=>'Accesso negato dal controllo di sicurezza %0'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140033486917751632)
,p_name=>'WWV_FLOW.APP_NOT_AVAILABLE'
,p_message_language=>'it'
,p_message_text=>'Applicazione non disponibile'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140031873890751632)
,p_name=>'WWV_FLOW.APP_NOT_FOUND_ERR'
,p_message_language=>'it'
,p_message_text=>'Applicazione non trovata.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140031925487751632)
,p_name=>'WWV_FLOW.APP_NOT_FOUND_FOOTER_ERR'
,p_message_language=>'it'
,p_message_text=>'applicazione=%0 area di lavoro=%1'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140032371024751632)
,p_name=>'WWV_FLOW.APP_RESTRICTED'
,p_message_language=>'it'
,p_message_text=>unistr('L''accesso a questa applicazione \00E8 limitato. Riprovare in seguito.')
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140032202717751632)
,p_name=>'WWV_FLOW.APP_RESTRICTED_TO_DEV'
,p_message_language=>'it'
,p_message_text=>unistr('L''accesso a questa applicazione \00E8 limitato agli sviluppatori di applicazioni. Riprovare in seguito.')
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140031450018751631)
,p_name=>'WWV_FLOW.BRANCH_FUNC_RETURNING_URL_ERROR'
,p_message_language=>'it'
,p_message_text=>'ERR-7744 Impossibile elaborare la diramazione alla funzione che restituisce l''URL.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140031330049751631)
,p_name=>'WWV_FLOW.BRANCH_TO_FUNCT_RET_PAGE_ERR'
,p_message_language=>'it'
,p_message_text=>'ERR-7744 Impossibile elaborare la diramazione alla funzione che restituisce la pagina.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140031643221751632)
,p_name=>'WWV_FLOW.CALL_TO_SHOW_FROM_PROC_ERR'
,p_message_language=>'it'
,p_message_text=>'ERR-1430 Chiamata per la visualizzazione dal processo di pagina non supportata: G_FLOW_STEP_ID (%0).'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140032796297751632)
,p_name=>'WWV_FLOW.CLEAR_STEP_CACHE_ERR'
,p_message_language=>'it'
,p_message_text=>'ERR-1018 Errore durante la cancellazione della cache step.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140031133253751631)
,p_name=>'WWV_FLOW.COMP_UNKNOWN_ERR'
,p_message_language=>'it'
,p_message_text=>'ERR-1005 Tipo di calcolo sconosciuto.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140032090493751632)
,p_name=>'WWV_FLOW.CUSTOM_AUTH_SESSION_ERR'
,p_message_language=>'it'
,p_message_text=>'ERR-1201 ID sessione non impostato nell''autenticazione personalizzata.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140032138430751632)
,p_name=>'WWV_FLOW.CUSTOM_AUTH_SESSION_FOOTER_ERR'
,p_message_language=>'it'
,p_message_text=>'pagina=%0'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140031728510751632)
,p_name=>'WWV_FLOW.DET_COMPANY_ERR'
,p_message_language=>'it'
,p_message_text=>'ERR-7620 Impossibile determinare l''area di lavoro per l''applicazione (%0).'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140012216950751626)
,p_name=>'WWV_FLOW.EDIT'
,p_message_language=>'it'
,p_message_text=>'Modifica'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140030885710751631)
,p_name=>'WWV_FLOW.FIND_ITEM_ERR2'
,p_message_language=>'it'
,p_message_text=>'ERR-1802 Impossibile trovare l''ID elemento "%0"'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140030577012751631)
,p_name=>'WWV_FLOW.FIND_ITEM_ID_ERR'
,p_message_language=>'it'
,p_message_text=>'ERR-1002 Impossibile trovare l''ID elemento per l''elemento "%0" nell''applicazione "%1".'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140030693770751631)
,p_name=>'WWV_FLOW.FIND_ITEM_ID_ERR2'
,p_message_language=>'it'
,p_message_text=>'Errore imprevisto. Impossibile trovare il nome dell''elemento a livello di applicazione o pagina.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140031076208751631)
,p_name=>'WWV_FLOW.FIRST_PAGE_DATA_ERR'
,p_message_language=>'it'
,p_message_text=>unistr('Si \00E8 gi\00E0 nella prima pagina di dati.')
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140047516306751636)
,p_name=>'WWV_FLOW.ITEM_POSTING_VIOLATION'
,p_message_language=>'it'
,p_message_text=>'L''ID di elemento (%0) non corrisponde a un elemento definito nella pagina corrente.'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140005107434751624)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.INTERNAL_ONLY'
,p_message_language=>'it'
,p_message_text=>unistr('L''elemento non pu\00F2 essere impostato passando argomenti all''applicazione.')
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140005455534751624)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.NO_CHECKSUM'
,p_message_language=>'it'
,p_message_text=>'(nessun checksum fornito)'
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140004943903751624)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.PRIVATE_BOOKMARK'
,p_message_language=>'it'
,p_message_text=>unistr('L''elemento pu\00F2 essere impostato se accompagnato da un checksum di tipo "segnalibro a livello di utente".')
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140004865149751624)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.PUBLIC_BOOKMARK'
,p_message_language=>'it'
,p_message_text=>unistr('L''elemento pu\00F2 essere impostato se accompagnato da un checksum di tipo "segnalibro a livello di applicazione".')
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140005057242751624)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.SESSION'
,p_message_language=>'it'
,p_message_text=>unistr('L''elemento pu\00F2 essere impostato se accompagnato da un checksum di tipo "sessione".')
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140004710387751624)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.UNPROTECTED'
,p_message_language=>'it'
,p_message_text=>unistr('L''elemento non \00E8 protetto.')
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140032816863751632)
,p_name=>'WWV_FLOW.NO_PAGE_HELP'
,p_message_language=>'it'
,p_message_text=>'Nessuna Guida di pagina disponibile.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140020725439751628)
,p_name=>'WWV_FLOW.NO_PRIV_ON_SCHEMA'
,p_message_language=>'it'
,p_message_text=>'L''area di lavoro %0 non dispone dei privilegi per eseguire l''analisi come schema %1.'
,p_version_scn=>2705040
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140031228882751631)
,p_name=>'WWV_FLOW.PAGE_ACCEPT_RECUR_ERR'
,p_message_language=>'it'
,p_message_text=>unistr('ERR-1010 Superato il limite di ricorsivit\00E0 della diramazione all''elaborazione PAGE ACCEPT. %0')
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139987772717751619)
,p_name=>'WWV_FLOW.PAGE_PATTERN_NOT_RUNNABLE'
,p_message_language=>'it'
,p_message_text=>'Pagina non disponibile. Impossibile eseguire un pattern della pagina.'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140005362273751624)
,p_name=>'WWV_FLOW.PAGE_PROTECTION.SHOW_NO_URL_ALLOWED'
,p_message_language=>'it'
,p_message_text=>unistr('Questa pagina non pu\00F2 essere richiamata utilizzando un URL o istruzioni GET o POST per la procedura di visualizzazione, ma deve essere richiamata mediante una diramazione di tipo "Dirama a pagina".')
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140090127853751649)
,p_name=>'WWV_FLOW.SAVE_ROUTINE_NUMERIC_ERR'
,p_message_language=>'it'
,p_message_text=>'Errore durante il tentativo di salvataggio di un valore non numerico nell''elemento %0. '
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140022417526751629)
,p_name=>'WWV_FLOW.SCHEMA_NOT_EXISTS'
,p_message_language=>'it'
,p_message_text=>'Lo schema di analisi dell''applicazione "%0" non esiste nel database.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140022563615751629)
,p_name=>'WWV_FLOW.SERVICE_ADMIN_LINK'
,p_message_language=>'it'
,p_message_text=>'Gli account nell''area di lavoro INTERNAL possono essere utilizzati solo per accedere ai <a href="%0">servizi di amministrazione</a> di &PRODUCT_NAME..'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140030449707751631)
,p_name=>'WWV_FLOW.SESSION_INFO_ERR'
,p_message_language=>'it'
,p_message_text=>'ERR-1029 Impossibile memorizzare le informazioni sulla sessione. Sessione=%0 elemento=%1'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140033583769751632)
,p_name=>'WWV_FLOW.UNABLE_TO_STOP_TRACE_ERR'
,p_message_language=>'it'
,p_message_text=>'Impossibile interrompere il trace: %0'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140030756042751631)
,p_name=>'WWV_FLOW.UNEXPECTED_ERR'
,p_message_language=>'it'
,p_message_text=>'Errore imprevisto'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140041588289751634)
,p_name=>'WWV_FLOW.UPDATE_SUB_ERR'
,p_message_language=>'it'
,p_message_text=>'Errore in update_substitution_cache: %0'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140033610515751632)
,p_name=>'WWV_FLOW.VIEW_HELP_ERR'
,p_message_language=>'it'
,p_message_text=>'Fornire l''applicazione e la pagina per visualizzare la Guida.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140055396551751639)
,p_name=>'WWV_FLOW_AUTOMATION.AUTOMATION_NOT_FOUND'
,p_message_language=>'it'
,p_message_text=>'Automazione non trovata.'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139990865130751619)
,p_name=>'WWV_FLOW_AUTOMATION.QUERY_ERROR'
,p_message_language=>'it'
,p_message_text=>'Errore query di automazione: %0'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140034791738751632)
,p_name=>'WWV_FLOW_CACHE.PURGE_SESSION'
,p_message_language=>'it'
,p_message_text=>'%0 sessioni eliminate.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139976045226751615)
,p_name=>'WWV_FLOW_CODE_EXEC_MLE.LANGUAGE_NOT_SUPPORTED'
,p_message_language=>'it'
,p_message_text=>unistr('Impossibile eseguire il codice %0 in quanto non \00E8 supportato dal database o non \00E8 abilitato dal parametro MLE_LANGUAGES dell''istanza.')
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139973647315751614)
,p_name=>'WWV_FLOW_CODE_EXEC_MLE.MLE_NOT_SUPPORTED'
,p_message_language=>'it'
,p_message_text=>unistr('Multilingual Engine non \00E8 disponibile in questa versione del database.')
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140012858115751626)
,p_name=>'WWV_FLOW_COLLECTION.ARRAY_NOT_NULL'
,p_message_language=>'it'
,p_message_text=>'L''array collection di applicazioni non deve essere nullo'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140012624838751626)
,p_name=>'WWV_FLOW_COLLECTION.ATTRIBUTE_NUMBER_OUTSIDE_RANGE'
,p_message_language=>'it'
,p_message_text=>unistr('Il numero di attributi del membro specificato %0 non \00E8 valido. Il numero di attributi deve essere compreso tra 1 e %1')
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140013130376751626)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_EXISTS'
,p_message_language=>'it'
,p_message_text=>'Collection di applicazioni esistente'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140012957674751626)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NAME_NOT_NULL'
,p_message_language=>'it'
,p_message_text=>unistr('Il nome della collection non pu\00F2 essere nullo')
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140013042642751626)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NAME_TOO_LARGE'
,p_message_language=>'it'
,p_message_text=>unistr('Il nome della collection non pu\00F2 superare i 255 caratteri')
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140012419790751626)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NOT_EXIST'
,p_message_language=>'it'
,p_message_text=>'La collection di applicazioni %0 non esiste'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140013216784751626)
,p_name=>'WWV_FLOW_COLLECTION.CURSOR_NOT_OPEN'
,p_message_language=>'it'
,p_message_text=>'Cursore non ancora aperto'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140012513886751626)
,p_name=>'WWV_FLOW_COLLECTION.MEMBER_NOT_EXIST'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'La sequenza di membri %0 non esiste nella collection di applicazioni %1',
''))
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140012787758751626)
,p_name=>'WWV_FLOW_COLLECTION.MEMBER_SEQUENCE_NUMBER_INVALID'
,p_message_language=>'it'
,p_message_text=>'La sequenza di membri %0 non esiste nella collection di applicazioni "%1"'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139965501730751612)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_ALGORITHM'
,p_message_language=>'it'
,p_message_text=>unistr('L''algoritmo %0 non \00E8 supportato per ECDSA.')
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139965202833751612)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_EC_CURVE'
,p_message_language=>'it'
,p_message_text=>unistr('La curva ellittica %0 non \00E8 supportata.')
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140090986533751649)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_FUNCTION'
,p_message_language=>'it'
,p_message_text=>unistr('La funzione di crittografia "%0" non \00E8 supportata su questo sistema.')
,p_version_scn=>2705049
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140143230805751665)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_ACCESSIBLE'
,p_message_language=>'it'
,p_message_text=>'Test accesso facilitato eseguito'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140034245751751632)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_CLOSE'
,p_message_language=>'it'
,p_message_text=>'Chiudi'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140034389588751632)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_CUST_OPT'
,p_message_language=>'it'
,p_message_text=>'Opzioni di personalizzazione della pagina'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140034460751751632)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_DEFAULT'
,p_message_language=>'it'
,p_message_text=>'Predefinito'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140034558278751632)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_DISP'
,p_message_language=>'it'
,p_message_text=>'Visualizzato'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140034676633751632)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_HIDDEN'
,p_message_language=>'it'
,p_message_text=>'Nascosto'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140034020333751632)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE1'
,p_message_language=>'it'
,p_message_text=>unistr('Controllare le aree che si desidera includere in questa pagina. \00C8 possibile che le aree controllate non vengano visualizzate se non ci si trova nel contesto dell''applicazione corretto oppure se non si dispone dei privilegi adeguati.')
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140034120002751632)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE2'
,p_message_language=>'it'
,p_message_text=>unistr('Questa pagina non \00E8 personalizzabile.')
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140143502037751665)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE3'
,p_message_language=>'it'
,p_message_text=>unistr('\00C8 possibile personalizzare l''aspetto di questa applicazione modificando lo stile del tema. Selezionare uno stile di tema dalla lista sottostante e fare clic su Applica modifiche.')
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140144358581751665)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_REGION_DISP'
,p_message_language=>'it'
,p_message_text=>'Visualizzazione area'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140143478723751665)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_REMOVE_STYLE'
,p_message_language=>'it'
,p_message_text=>'Usa stile predefinito applicazione'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140143336839751665)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_THEME_STYLE'
,p_message_language=>'it'
,p_message_text=>'Aspetto '
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140087579866751648)
,p_name=>'WWV_FLOW_DATA_EXPORT.AGG_COLUMN_IDX_NOT_EXIST'
,p_message_language=>'it'
,p_message_text=>'L''indice colonna a cui viene fatto riferimento nell''aggregato %0 non esiste.'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139980225769751616)
,p_name=>'WWV_FLOW_DATA_EXPORT.APPEND_NOT_SUPPORTED'
,p_message_language=>'it'
,p_message_text=>unistr('L''aggiunta dell''esportazione dei dati non \00E8 supportata per il formato %0.')
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139943223867751605)
,p_name=>'WWV_FLOW_DATA_EXPORT.CLOB_NOT_SUPPORTED'
,p_message_language=>'it'
,p_message_text=>unistr('L''output CLOB non \00E8 supportato per il formato %0.')
,p_version_scn=>2705023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140087241011751648)
,p_name=>'WWV_FLOW_DATA_EXPORT.COLUMN_BREAK_MUST_BE_IN_THE_BEGGINING'
,p_message_language=>'it'
,p_message_text=>'L''interruzione di colonna deve trovarsi all''inizio dell''array di colonne.'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140087361775751648)
,p_name=>'WWV_FLOW_DATA_EXPORT.COLUMN_GROUP_IDX_NOT_EXIST'
,p_message_language=>'it'
,p_message_text=>'L''indice gruppo di colonne a cui viene fatto riferimento in %0 non esiste.'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139994406766751621)
,p_name=>'WWV_FLOW_DATA_EXPORT.EXPORT'
,p_message_language=>'it'
,p_message_text=>'esportazione'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140001624481751623)
,p_name=>'WWV_FLOW_DATA_EXPORT.FORMAT_MUST_BE_XML'
,p_message_language=>'it'
,p_message_text=>'Il formato di esportazione deve essere XML utilizzando ORDS come server di stampa.'
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140087636197751648)
,p_name=>'WWV_FLOW_DATA_EXPORT.HIGHLIGHT_COLUMN_IDX_NOT_EXIST'
,p_message_language=>'it'
,p_message_text=>'L''indice colonna a cui viene fatto riferimento nell''evidenziazione %0 non esiste.'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139991014826751620)
,p_name=>'WWV_FLOW_DATA_EXPORT.INVALID_FORMAT'
,p_message_language=>'it'
,p_message_text=>'Formato di esportazione non valido: %0'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140087496470751648)
,p_name=>'WWV_FLOW_DATA_EXPORT.PARENT_GROUP_IDX_NOT_EXIST'
,p_message_language=>'it'
,p_message_text=>'L''indice gruppo padre a cui viene fatto riferimento in %0 non esiste.'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140112676706751655)
,p_name=>'WWV_FLOW_DATA_LOADER.CANNOT_LOAD_INTO_GENERATED_ALWAYS_COLUMN'
,p_message_language=>'it'
,p_message_text=>unistr('La colonna %1 della tabella %0 \00E8 una colonna di identit\00E0 "GENERATED ALWAYS". Assicurarsi che non vi siano colonne di origine mappate alla colonna %1 nella finestra di dialogo Configura.')
,p_version_scn=>2705056
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140024224527751629)
,p_name=>'WWV_FLOW_DATA_LOADER.COMMIT_INTERVAL_TOO_LOW'
,p_message_language=>'it'
,p_message_text=>unistr('L''intervallo di commit specificato \00E8 troppo basso.')
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140024310553751629)
,p_name=>'WWV_FLOW_DATA_LOADER.NO_COLUMNS_PROVIDED'
,p_message_language=>'it'
,p_message_text=>'Non sono state fornite colonne per il caricamento dei dati.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140025623205751630)
,p_name=>'WWV_FLOW_DATA_PARSER.NO_COLUMNS_FOUND'
,p_message_language=>'it'
,p_message_text=>'Nessuna colonna trovata per il selettore di righe "%0". Provare a rilevare automaticamente oppure a controllare la struttura JSON.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140035076397751633)
,p_name=>'WWV_FLOW_DATA_PARSER.NO_WORKSHEETS_FOUND'
,p_message_language=>'it'
,p_message_text=>'Nessun foglio di lavoro trovato nel file XLSX.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139980135610751616)
,p_name=>'WWV_FLOW_DATA_PARSER.REQUESTED_HIERARCHY_LEVELS_EXCEED_MAXIMUM'
,p_message_language=>'it'
,p_message_text=>'I livelli di gerarchia richiesti per la ricerca automatica (%0) superano il limite massimo di %1.'
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140034934781751632)
,p_name=>'WWV_FLOW_DATA_PARSER.WORKSHEET_DOES_NOT_EXIST'
,p_message_language=>'it'
,p_message_text=>'Il foglio di lavoro specificato non esiste nel file XLSX.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140013393102751626)
,p_name=>'WWV_FLOW_DML.VERSION_OF_DATA_CHANGED'
,p_message_language=>'it'
,p_message_text=>unistr('La versione corrente dei dati nel database \00E8 cambiata da quando l''utente ha iniziato il processo di aggiornamento.')
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140016294331751627)
,p_name=>'WWV_FLOW_EDIT_REPORT.ERR_UPDATING_COLS'
,p_message_language=>'it'
,p_message_text=>'Errore durante l''aggiornamento delle colonne di report: %0'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140126794099751660)
,p_name=>'WWV_FLOW_EXEC.CANNOT_CONVERT_TO_SDOGEOMETRY'
,p_message_language=>'it'
,p_message_text=>'Impossibile convertire %0 in SDO_GEOMETRY.'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140063210755751641)
,p_name=>'WWV_FLOW_EXEC.CAN_NOT_CONVERT_TO_VARCHAR2'
,p_message_language=>'it'
,p_message_text=>'Impossibile convertire in VARCHAR2 la colonna %0 del tipo di dati %1.'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140070645030751643)
,p_name=>'WWV_FLOW_EXEC.COLUMN_NOT_FOUND'
,p_message_language=>'it'
,p_message_text=>'Colonna "%0" specificata per l''attributo "%1" non trovata nell''origine dati.'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140006774993751624)
,p_name=>'WWV_FLOW_EXEC.FILTER_NOT_SUPPORTED_WITH_MULTIPLE_VALUES'
,p_message_language=>'it'
,p_message_text=>unistr('Il tipo di filtro %0 non \00E8 supportato per le colonne con pi\00F9 valori.')
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140130236170751661)
,p_name=>'WWV_FLOW_EXEC.INVALID_BETWEEN_FILTER'
,p_message_language=>'it'
,p_message_text=>'Filtro "between" non valido.'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139985892111751618)
,p_name=>'WWV_FLOW_EXEC.INVALID_COLUMN_OR_ROW_DATATYPE'
,p_message_language=>'it'
,p_message_text=>'Nessun valore %2 trovato nella colonna %0, riga #%1.'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139982511945751617)
,p_name=>'WWV_FLOW_EXEC.INVALID_COLUMN_OR_ROW_REFERENCE'
,p_message_language=>'it'
,p_message_text=>'La colonna %0 o la riga #%1 non esiste.'
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139969180870751613)
,p_name=>'WWV_FLOW_EXEC.INVALID_LOV_SPECIFICATION'
,p_message_language=>'it'
,p_message_text=>'Specificato tipo di LOV non valido.'
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139969034651751613)
,p_name=>'WWV_FLOW_EXEC.INVALID_QUERY_TYPE'
,p_message_language=>'it'
,p_message_text=>'Tipo di query non valida. Il tipo di query deve essere una tabella, una query SQL o una funzione PL/SQL che restituisce una query SQL.'
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140063386584751641)
,p_name=>'WWV_FLOW_EXEC.INVALID_SQL_QUERY'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Analisi della query SQL non riuscita.',
'%0'))
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140070790598751643)
,p_name=>'WWV_FLOW_EXEC.LEGACY_COLUMN_NOT_FOUND'
,p_message_language=>'it'
,p_message_text=>'Posizione colonna %0 specificata per l''attributo "%1" non trovata nell''istruzione SQL.'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139960703319751611)
,p_name=>'WWV_FLOW_EXEC.MULTI_VALUE_TOO_MANY_ITEMS'
,p_message_language=>'it'
,p_message_text=>unistr('Troppi elementi utilizzati nel filtro con pi\00F9 valori.')
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140070503827751643)
,p_name=>'WWV_FLOW_EXEC.NO_COLUMN_FOR_ATTRIBUTE'
,p_message_language=>'it'
,p_message_text=>'Nessuna colonna specificata per l''attributo "%0".'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139968984117751613)
,p_name=>'WWV_FLOW_EXEC.NULL_QUERY_RETURNED_BY_FUNCTION'
,p_message_language=>'it'
,p_message_text=>'Il corpo della funzione PL/SQL non ha restituito un valore.'
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140086363002751648)
,p_name=>'WWV_FLOW_EXEC.OPERATION_NOT_PRESENT_IN_WEB_SRC_MODULE'
,p_message_language=>'it'
,p_message_text=>'L''origine dati REST non contiene un''operazione per gestire l''azione DML richiesta.'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140128005268751660)
,p_name=>'WWV_FLOW_EXEC.RANGE_BUCKET.NOT.SUPPORTED'
,p_message_language=>'it'
,p_message_text=>'I filtri di intervallo sono supportati solo per i tipi di dati NUMBER, DATE o TIMESTAMP.'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139948945742751607)
,p_name=>'WWV_FLOW_EXEC.REST_REQUEST_ERROR'
,p_message_language=>'it'
,p_message_text=>'Richiesta non riuscita con %0'
,p_version_scn=>2705025
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139952455552751608)
,p_name=>'WWV_FLOW_EXEC.SPATIAL_JSON_NOT_AVAILABLE'
,p_message_language=>'it'
,p_message_text=>unistr('La conversione da GeoJSON a SDO_GEOMETRY (colonna %0) non \00E8 disponibile in questo database.')
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139955872060751609)
,p_name=>'WWV_FLOW_EXEC.SPATIAL_NOT_SUPPORTED_FOR_XML'
,p_message_language=>'it'
,p_message_text=>unistr('La conversione SDO_GEOMETRY (colonna %0) non \00E8 supportata per le origini dati XML.')
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139979937079751616)
,p_name=>'WWV_FLOW_EXEC.UNSUPPPORTED_MULTI_VALUE_SEPARATOR'
,p_message_language=>'it'
,p_message_text=>unistr('Il carattere %0 non \00E8 supportato come separatore di pi\00F9 valori.')
,p_version_scn=>2705032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140128157779751660)
,p_name=>'WWV_FLOW_EXEC.WRONG_CONTEXT_TYPE'
,p_message_language=>'it'
,p_message_text=>unistr('Questa funzione non pu\00F2 essere utilizzata nel contesto di una query.')
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139955996135751609)
,p_name=>'WWV_FLOW_EXEC_API.INVALID_DATA_TYPE'
,p_message_language=>'it'
,p_message_text=>'Mancata corrispondenza del tipo di dati della colonna.'
,p_version_scn=>2705026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139989450714751619)
,p_name=>'WWV_FLOW_EXEC_DOC_SRC.REMOTE_MULTI_ROW_DML_NOT_SUPPORTED_WITHOUT_JSON_BINDS'
,p_message_language=>'it'
,p_message_text=>unistr('Questa origine dati non supporta la modifica di pi\00F9 righe.')
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139968853500751613)
,p_name=>'WWV_FLOW_EXEC_REMOTE.ORDS_OUT_BIND_LIMIT_EXCEEDED'
,p_message_language=>'it'
,p_message_text=>unistr('Superati i limiti della bind variable OUT di ORDS interna. Ridurre la quantit\00E0 di righe DML.')
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140071555169751643)
,p_name=>'WWV_FLOW_EXEC_REMOTE.RESPONSE_PARSING_ERROR'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Impossibile analizzare la risposta JSON proveniente dal server remoto: ',
'%0'))
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139968701557751613)
,p_name=>'WWV_FLOW_EXEC_REMOTE.RUN_PLSQL_ERR'
,p_message_language=>'it'
,p_message_text=>'Tipo di contesto sconosciuto o errato.'
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139992856196751620)
,p_name=>'WWV_FLOW_EXPORT_INT.UNSUPPORTED_READABLE_EXPORT'
,p_message_language=>'it'
,p_message_text=>'Componenti non supportati per l''esportazione leggibile: %0'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140090801604751649)
,p_name=>'WWV_FLOW_FILE_PARSER.UNKNOWN_FILE_TYPE'
,p_message_language=>'it'
,p_message_text=>unistr('Questo tipo di file non \00E8 supportato dal parser.')
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140041653002751634)
,p_name=>'WWV_FLOW_FND_DEVELOPER_API.CREDENTIALS_ERR'
,p_message_language=>'it'
,p_message_text=>'Accesso non autorizzato (wwv_flow_api.set_credentials non impostato).'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140016581124751627)
,p_name=>'WWV_FLOW_FND_USER_API.CREATE_COMPANY'
,p_message_language=>'it'
,p_message_text=>unistr('L''area di lavoro non \00E8 stata creata perch\00E9 esiste gi\00E0.')
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140016432793751627)
,p_name=>'WWV_FLOW_FND_USER_API.CREATE_USER_GROUP'
,p_message_language=>'it'
,p_message_text=>unistr('Il gruppo di utenti non \00E8 stato creato perch\00E9 esiste gi\00E0.')
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140027829634751630)
,p_name=>'WWV_FLOW_FND_USER_API.DUP_USER'
,p_message_language=>'it'
,p_message_text=>'Nome utente duplicato trovato per %0.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140027962572751630)
,p_name=>'WWV_FLOW_FND_USER_API.LOAD_ERR'
,p_message_language=>'it'
,p_message_text=>unistr('Errore durante il caricamento degli utenti. L''errore si \00E8 verificato in corrispondenza dell''utente %0.')
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140038780628751634)
,p_name=>'WWV_FLOW_FND_USER_API.T_MESSAGE'
,p_message_language=>'it'
,p_message_text=>'Potenziale caricamento di %0 utenti.'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140038504177751634)
,p_name=>'WWV_FLOW_FND_USER_API.T_PASSWORD'
,p_message_language=>'it'
,p_message_text=>'Password'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140038697387751634)
,p_name=>'WWV_FLOW_FND_USER_API.T_PRIVILEGE'
,p_message_language=>'it'
,p_message_text=>'Privilegi'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140038382310751633)
,p_name=>'WWV_FLOW_FND_USER_API.T_USERNAME'
,p_message_language=>'it'
,p_message_text=>'Nome utente'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140118785362751657)
,p_name=>'WWV_FLOW_FORM.UNHANDLED_ERROR'
,p_message_language=>'it'
,p_message_text=>'Errore durante la presentazione dell''elemento di pagina "#COMPONENT_NAME#".'
,p_version_scn=>2705059
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140033703135751632)
,p_name=>'WWV_FLOW_FORMS.FORM_NOT_OPEN_ERR'
,p_message_language=>'it'
,p_message_text=>unistr('Impossibile visualizzare l''elemento di pagina perch\00E9 il form HTML non era ancora stato aperto.')
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139992107908751620)
,p_name=>'WWV_FLOW_FORMS.ITEM_DEFAULT_ERR'
,p_message_language=>'it'
,p_message_text=>'Errore durante il calcolo del valore predefinito per l''elemento di pagina #COMPONENT_NAME#.'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140033051805751632)
,p_name=>'WWV_FLOW_FORMS.ITEM_POST_CALC_ERR'
,p_message_language=>'it'
,p_message_text=>'Errore nel calcolo successivo dell''elemento per l''elemento di pagina #COMPONENT_NAME#.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140032988339751632)
,p_name=>'WWV_FLOW_FORMS.ITEM_SOURCE_ERR'
,p_message_language=>'it'
,p_message_text=>'Errore durante il calcolo del valore di origine per l''elemento di pagina #COMPONENT_NAME#.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140009742506751625)
,p_name=>'WWV_FLOW_HELP.UNAUTHORIZED'
,p_message_language=>'it'
,p_message_text=>'Accesso non autorizzato.'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139959265536751610)
,p_name=>'WWV_FLOW_INTERACTIVE_GRID.INVALID_JSON_ARRAY'
,p_message_language=>'it'
,p_message_text=>unistr('Il valore %0 di %1 non \00E8 un array JSON valido.')
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140033268837751632)
,p_name=>'WWV_FLOW_ITEM.JS_NOT_SUPPORTED'
,p_message_language=>'it'
,p_message_text=>'JavaScript non supportato.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140033358662751632)
,p_name=>'WWV_FLOW_ITEM.LIST'
,p_message_language=>'it'
,p_message_text=>'Lista'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140033929640751632)
,p_name=>'WWV_FLOW_ITEM.UNABLE_INIT_QUERY'
,p_message_language=>'it'
,p_message_text=>'Impossibile inizializzare la query.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140041912479751635)
,p_name=>'WWV_FLOW_ITEM.UPDATE_NOT_SUPPORTED_ERR'
,p_message_language=>'it'
,p_message_text=>unistr('L''aggiornamento di %0 non \00E8 supportato.')
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140035489264751633)
,p_name=>'WWV_FLOW_ITEM_HELP.INVALID_ITEM_ERR'
,p_message_language=>'it'
,p_message_text=>'ID elemento non valido: %0 '
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140063197021751641)
,p_name=>'WWV_FLOW_ITEM_HELP.NO_HELP_EXISTS'
,p_message_language=>'it'
,p_message_text=>'Per questo elemento non esiste la Guida.'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140024903147751630)
,p_name=>'WWV_FLOW_JET_CHART.QUERY_GENERATION_FAILED'
,p_message_language=>'it'
,p_message_text=>'Generazione della query su grafico non riuscita. Controllare le impostazioni di origine e del mapping colonne.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140026294648751630)
,p_name=>'WWV_FLOW_MAIL.ADD_ATTACHMENT.INVALID_MAIL_ID'
,p_message_language=>'it'
,p_message_text=>'Valore non valido per il parametro p_mail_id: %0'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140062992397751641)
,p_name=>'WWV_FLOW_MAIL.CANNOT_USE_TO_OR_REPLYTO_AS_FROM'
,p_message_language=>'it'
,p_message_text=>unistr('Impossibile utilizzare l''indirizzo nel campo "A" o "Rispondi a" come indirizzo del mittente, perch\00E9 questi campi contengono pi\00F9 indirizzi di posta elettronica.')
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140147832442751666)
,p_name=>'WWV_FLOW_MAIL.EMAIL_LIMIT_EXCEEDED'
,p_message_language=>'it'
,p_message_text=>unistr('\00C8 stato superato il numero massimo di messaggi di posta elettronica per area di lavoro. Contattare l''amministratore.')
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140004425976751623)
,p_name=>'WWV_FLOW_MAIL.INVALID_CONTEXT'
,p_message_language=>'it'
,p_message_text=>'Questa procedura deve essere richiamata da una sessione dell''applicazione.'
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140026114373751630)
,p_name=>'WWV_FLOW_MAIL.PARAMETER_NULL'
,p_message_language=>'it'
,p_message_text=>'Specificato valore nullo per il parametro %0.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140084264983751647)
,p_name=>'WWV_FLOW_MAIL.PREPARE_TEMPLATE.NO_DATA_FOUND'
,p_message_language=>'it'
,p_message_text=>'Modello di posta elettronica "%0" non trovato nell''applicazione %1.'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140160790995751670)
,p_name=>'WWV_FLOW_MAIL.SMTP_HOST_ADDRESS_REQUIRED'
,p_message_language=>'it'
,p_message_text=>'Il parametro di istanza SMTP_HOST_ADDRESS deve essere impostato per l''invio di messaggi di posta elettronica'
,p_version_scn=>2705064
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140025587654751630)
,p_name=>'WWV_FLOW_MAIL.TO_IS_REQUIRED'
,p_message_language=>'it'
,p_message_text=>'Specificare un destinatario per inviare il messaggio.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140150253532751667)
,p_name=>'WWV_FLOW_MAIL.UNABLE_TO_OPEN_SMTP_CONNECTION'
,p_message_language=>'it'
,p_message_text=>'Impossibile stabilire la connessione SMTP con il server di posta elettronica configurato.'
,p_version_scn=>2705063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140125564161751659)
,p_name=>'WWV_FLOW_PLUGIN.INVALID_AJAX_CALL'
,p_message_language=>'it'
,p_message_text=>'Chiamata Ajax non valida.'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140009438944751625)
,p_name=>'WWV_FLOW_PLUGIN.NO_AJAX_FUNCTION'
,p_message_language=>'it'
,p_message_text=>'Nessuna funzione Ajax definita per il plugin %0'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140116078518751656)
,p_name=>'WWV_FLOW_PLUGIN.NO_EXECUTION_FUNCTION'
,p_message_language=>'it'
,p_message_text=>'Nessuna funzione di esecuzione definita per il plugin %0'
,p_version_scn=>2705058
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140009528719751625)
,p_name=>'WWV_FLOW_PLUGIN.NO_RENDER_FUNCTION'
,p_message_language=>'it'
,p_message_text=>'Nessuna funzione di visualizzazione definita per il plugin %0'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140126454771751660)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_CAPABILITIES_FUNCTION'
,p_message_language=>'it'
,p_message_text=>'Il plugin di origine dati REST "%0" non contiene una funzione "Capabilities".'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140126341023751660)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_DML_FUNCTION'
,p_message_language=>'it'
,p_message_text=>'Il plugin di origine dati REST "%0" non contiene una funzione DML.'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140126587692751660)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_EXECUTE_FUNCTION'
,p_message_language=>'it'
,p_message_text=>'Il plugin di origine dati REST "%0" non contiene una funzione Execute.'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140126691188751660)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_FETCH_FUNCTION'
,p_message_language=>'it'
,p_message_text=>'Il plugin di origine dati REST "%0" non contiene una funzione Fetch.'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140006940016751624)
,p_name=>'WWV_FLOW_PLUGIN.RUN_PLSQL_ERR'
,p_message_language=>'it'
,p_message_text=>'Errore nel codice PLSQL durante l''elaborazione del plugin.'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140015580625751627)
,p_name=>'WWV_FLOW_PLUGIN_DEV.IS_REQUIRED'
,p_message_language=>'it'
,p_message_text=>'Specificare un valore.'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140048550318751637)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.CANT_CONVERT_TO_VARCHAR2'
,p_message_language=>'it'
,p_message_text=>'Impossibile convertire il tipo di dati %0 in VARCHAR2.'
,p_version_scn=>2705045
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140136751215751663)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.COLUMN_NOT_FOUND'
,p_message_language=>'it'
,p_message_text=>'Colonna "%0" specificata per l''attributo "%1" non trovata nell''istruzione SQL.'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139964064495751612)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.INVALID_JSON_ARRAY'
,p_message_language=>'it'
,p_message_text=>unistr('Il valore %0 di %1 non \00E8 un array JSON valido.')
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140113967317751656)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.LOV_REQUIRED'
,p_message_language=>'it'
,p_message_text=>'Specificare un valore per Query lista di valori (LOV) o Lista di valori denominata per %0.'
,p_version_scn=>2705058
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140115517947751656)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.LOV_SQL_WRONG_COLUMN_COUNT'
,p_message_language=>'it'
,p_message_text=>unistr('\00C8 stato selezionato un numero errato di colonne nella query SQL LOV per %0. Vedere gli esempi di istruzioni valide.')
,p_version_scn=>2705058
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140136537876751663)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.NO_COLUMN_FOR_ATTRIBUTE'
,p_message_language=>'it'
,p_message_text=>'Nessuna colonna specificata per l''attributo "%0".'
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140165702519751671)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.NUMBER_ATTRIBUTE_VALUE_INVALID'
,p_message_language=>'it'
,p_message_text=>unistr('Il valore immesso %0 per l''attributo "%1" non \00E8 numerico.')
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140119064475751657)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.SQL_WRONG_DATA_TYPE'
,p_message_language=>'it'
,p_message_text=>unistr('Il tipo di dati di %0 nell''istruzione SQL \00E8 errato. Il numero della colonna %1 \00E8 %2 mentre era previsto %3.')
,p_version_scn=>2705059
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140136607978751663)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.WRONG_COLUMN_DATA_TYPE'
,p_message_language=>'it'
,p_message_text=>unistr('La colonna "%0" specificata per l''attributo "%1" dispone del tipo di dati %2 mentre il tipo di dati previsto \00E8 %3.')
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140006176903751624)
,p_name=>'WWV_FLOW_PRINT_UTIL.REPORT_LAYOUT_NOT_FOUND'
,p_message_language=>'it'
,p_message_text=>'Impossibile trovare il layout del report.'
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139993720546751620)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTIONS_LIMIT_EXCEEDED'
,p_message_language=>'it'
,p_message_text=>'Limite delle esecuzioni in background superato per %0.'
,p_version_scn=>2705033
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139944039477751606)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTION_ALREADY_RUNNING'
,p_message_language=>'it'
,p_message_text=>unistr('Un''altra esecuzione di %0 \00E8 gi\00E0 in esecuzione.')
,p_version_scn=>2705023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139943967211751606)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTION_ALREADY_RUNNING_CTX'
,p_message_language=>'it'
,p_message_text=>unistr('Un''altra esecuzione di %0 \00E8 gi\00E0 in esecuzione per il contesto %1.')
,p_version_scn=>2705023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139958932706751610)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.FILES_NOT_VISIBLE_IN_WORKING_SESSION'
,p_message_language=>'it'
,p_message_text=>'I file caricati non sono visibili nella sessione di lavoro per l''esecuzione di %0.'
,p_version_scn=>2705028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140071471717751643)
,p_name=>'WWV_FLOW_RENDER_REPORT3.COMPUTE_SUM_NOT_SUPPORTED_FOR_WEB_SOURCES'
,p_message_language=>'it'
,p_message_text=>'Impossibile utilizzare la funzione Calcola somma per i report basati su un''origine dati REST.'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140033137210751632)
,p_name=>'WWV_FLOW_RENDER_SHORTCUT.UNABLE_SET_SHORT_VAL_ERR'
,p_message_language=>'it'
,p_message_text=>'ERR-2904 Impossibile impostare il valore della scorciatoia.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140038116127751633)
,p_name=>'WWV_FLOW_RENDER_SHORTCUT.UNKNOWN_TYPE_ERR'
,p_message_language=>'it'
,p_message_text=>'Errore: tipo di scorciatoia sconosciuto.'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139975822050751615)
,p_name=>'WWV_FLOW_SEARCH_API.TEXT_QUERY_TOO_LONG'
,p_message_language=>'it'
,p_message_text=>unistr('La query di ricerca \00E8 troppo lunga.')
,p_version_scn=>2705029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140027271528751630)
,p_name=>'WWV_FLOW_SECURITY.AUTH_SCHEME_FETCH_ERR'
,p_message_language=>'it'
,p_message_text=>'Impossibile recuperare authentication_scheme nell''applicazione %0.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140035220212751633)
,p_name=>'WWV_FLOW_SECURITY.COMPONENT_FETCH_ERR'
,p_message_language=>'it'
,p_message_text=>'Impossibile recuperare il componente %0.'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140105555269751653)
,p_name=>'WWV_FLOW_SESSION_API.TENANT_ID_EXISTS'
,p_message_language=>'it'
,p_message_text=>unistr('L''ID tenant esiste gi\00E0 per la sessione corrente.')
,p_version_scn=>2705054
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140038457312751634)
,p_name=>'WWV_FLOW_USER_API.T_EMAIL'
,p_message_language=>'it'
,p_message_text=>'Posta elettronica'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140165224826751671)
,p_name=>'WWV_FLOW_WEB_SERVICES.AUTHENTICATION_FAILED'
,p_message_language=>'it'
,p_message_text=>'Autenticazione non riuscita.'
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140065897057751642)
,p_name=>'WWV_FLOW_WEB_SERVICES.COOKIE_INVALID'
,p_message_language=>'it'
,p_message_text=>unistr('Uno o pi\00F9 cookie impostati in apex_util.g_request_cookies contengono un valore non valido.')
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140047787590751636)
,p_name=>'WWV_FLOW_WEB_SERVICES.INVALID_UDDI_RESPONSE'
,p_message_language=>'it'
,p_message_text=>'Risposta non valida dal registro UDDI.'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140007003056751624)
,p_name=>'WWV_FLOW_WEB_SERVICES.INVALID_WSDL'
,p_message_language=>'it'
,p_message_text=>'L''URL fornito non ha restituito un documento WSDL valido.'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140009827422751625)
,p_name=>'WWV_FLOW_WEB_SERVICES.MULTIPLE_SOAP'
,p_message_language=>'it'
,p_message_text=>unistr('Il documento WSDL contiene pi\00F9 associazioni SOAP. &PRODUCT_NAME. supporta solo documenti WSDL con una associazione SOAP. Per procedere con la creazione di un riferimento per questo servizio, fare clic su Crea riferimento a Web Service manualmente.')
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140085421724751647)
,p_name=>'WWV_FLOW_WEB_SERVICES.NOT_XML'
,p_message_language=>'it'
,p_message_text=>unistr('La risposta dal servizio non \00E8 in formato XML.')
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140165198870751671)
,p_name=>'WWV_FLOW_WEB_SERVICES.NO_VALID_OAUTH_TOKEN'
,p_message_language=>'it'
,p_message_text=>'Token di accesso OAuth non disponibile o scaduto.'
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140129626856751661)
,p_name=>'WWV_FLOW_WEB_SERVICES.REQUEST_LIMIT_EXCEEDED'
,p_message_language=>'it'
,p_message_text=>unistr('\00C8 stato superato il numero massimo di richieste Web Service per area di lavoro. Contattare l''amministratore.')
,p_version_scn=>2705062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140165340516751671)
,p_name=>'WWV_FLOW_WEB_SERVICES.UNSUPPORTED_OAUTH_TOKEN'
,p_message_language=>'it'
,p_message_text=>'Il server ha risposto con un tipo di token OAuth non supportato.'
,p_version_scn=>2705067
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140009239948751625)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_NO_SOAP'
,p_message_language=>'it'
,p_message_text=>'Il documento WSDL non conteneva un''associazione per il protocollo SOAP, richiesto per poter aggiungere il riferimento.'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140004687288751624)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_REQUIRES_AUTH'
,p_message_language=>'it'
,p_message_text=>'Questo WSDL richiede credenziali di autenticazione. Fornire di seguito nome utente e password.'
,p_version_scn=>2705038
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140015631841751627)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_UNHANDLED'
,p_message_language=>'it'
,p_message_text=>'Motore di visualizzazione non in grado di interpretare il documento WSDL. Per procedere con la creazione di un riferimento per questo servizio, fare clic su Crea riferimento a Web Service manualmente.'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140088470311751648)
,p_name=>'WWV_FLOW_WIZARD_API.UPDATE_ERROR'
,p_message_language=>'it'
,p_message_text=>'Impossibile elaborare l''aggiornamento.'
,p_version_scn=>2705048
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140114297019751656)
,p_name=>'WWV_FLOW_WORKSHEET.LOV_DISPLAY_AND_RETURN_COLUMN_EQUAL'
,p_message_language=>'it'
,p_message_text=>'La colonna restituita e quella di visualizzazione della lista di valori sono uguali.'
,p_version_scn=>2705058
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140114169503751656)
,p_name=>'WWV_FLOW_WORKSHEET.LOV_NO_RETURN_COLUMN'
,p_message_language=>'it'
,p_message_text=>'La lista di valori non dispone di una colonna restituita.'
,p_version_scn=>2705058
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140041837659751635)
,p_name=>'WWV_RENDER_REPORT3.COLUMN_VALUE_ERR'
,p_message_language=>'it'
,p_message_text=>'Errore durante il recupero del valore della colonna: %0'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140066710126751642)
,p_name=>'WWV_RENDER_REPORT3.DATA_TOO_OLD'
,p_message_language=>'it'
,p_message_text=>'I dati correnti del form tabulare sono troppo vecchi. I dati di origine sono stati modificati.<br/> Fare clic <strong><a href="%0">qui</a></strong> per annullare le modifiche e ricaricare i dati dal database.'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140021977764751629)
,p_name=>'WWV_RENDER_REPORT3.ERR_DETERMINE_PAGINATION'
,p_message_language=>'it'
,p_message_text=>'Errore durante la determinazione della stringa di impaginazione'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140021885676751629)
,p_name=>'WWV_RENDER_REPORT3.ERR_DETERMINE_QUERY_HEADINGS'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'impossibile determinare le intestazioni delle query:',
'%0'))
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140022043963751629)
,p_name=>'WWV_RENDER_REPORT3.ERR_REPORT_FOOTER'
,p_message_language=>'it'
,p_message_text=>unistr('Errore durante l''esecuzione delle sostituzioni dei pi\00E8 di pagina del report')
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140022115678751629)
,p_name=>'WWV_RENDER_REPORT3.FAILED_PARSING_QUERY'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'impossibile analizzare la query SQL:',
'%0',
'%1'))
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140028201987751631)
,p_name=>'WWV_RENDER_REPORT3.FOUND_BUT_NOT_DISPLAYED'
,p_message_language=>'it'
,p_message_text=>'Numero minimo di righe richieste: %0, righe trovate ma non visualizzate: %1'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140024631840751629)
,p_name=>'WWV_RENDER_REPORT3.HTML_USE_COLUMN_ALIAS'
,p_message_language=>'it'
,p_message_text=>unistr('la colonna di query n. %0 (%1) non \00E8 valida. Le colonne che utilizzano HTML devono disporre di nomi di alias')
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140041782662751634)
,p_name=>'WWV_RENDER_REPORT3.QUERY_HEADING_ERR'
,p_message_language=>'it'
,p_message_text=>'Errore durante il recupero delle intestazioni della query: %0'
,p_version_scn=>2705043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140022289914751629)
,p_name=>'WWV_RENDER_REPORT3.REPORT_ERROR'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'errore nel report:',
'%0'))
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140062392013751641)
,p_name=>'WWV_RENDER_REPORT3.SORT_BY_THIS_COLUMN'
,p_message_language=>'it'
,p_message_text=>'Ordina per questa colonna'
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140024748395751629)
,p_name=>'WWV_RENDER_REPORT3.SYNTAX_ERROR'
,p_message_language=>'it'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Impossibile analizzare la query. Controllare la sintassi della query.',
'(%0)',
'</p>'))
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140066860050751642)
,p_name=>'WWV_RENDER_REPORT3.UNSAVED_DATA'
,p_message_language=>'it'
,p_message_text=>'Questo form contiene modifiche non salvate. Fare clic su "OK" per proseguire senza salvare le modifiche. '
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140071321631751643)
,p_name=>'WWV_RENDER_REPORT3.UNSUPPORTED_PAGINATION_SCHEME'
,p_message_language=>'it'
,p_message_text=>unistr('Lo schema di impaginazione report (%0) non \00E8 supportato con l''origine dati scelta.')
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140024532569751629)
,p_name=>'WWV_RENDER_REPORT3.USE_COLUMN_ALIAS'
,p_message_language=>'it'
,p_message_text=>unistr('la colonna di query n. %0 (%1) non \00E8 valida. Utilizzare alias di colonna.')
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140028307783751631)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_MORE_THAN_Z'
,p_message_language=>'it'
,p_message_text=>unistr('riga/e %0 - %1 di pi\00F9 di %2')
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140068870981751643)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_MORE_THAN_Z_2'
,p_message_language=>'it'
,p_message_text=>unistr('%0-%1 di pi\00F9 di %2')
,p_version_scn=>2705046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140028110242751630)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z'
,p_message_language=>'it'
,p_message_text=>'riga/e: %0 - %1 di %2'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140008935651751625)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z_2'
,p_message_language=>'it'
,p_message_text=>'%0 - %1 di %2'
,p_version_scn=>2705039
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140022336304751629)
,p_name=>'Y'
,p_message_language=>'it'
,p_message_text=>'Y'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140029675158751631)
,p_name=>'YEAR'
,p_message_language=>'it'
,p_message_text=>'anno'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140021568659751629)
,p_name=>'YEARS'
,p_message_language=>'it'
,p_message_text=>'anni'
,p_version_scn=>2705042
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(140066960893751642)
,p_name=>'YES'
,p_message_language=>'it'
,p_message_text=>unistr('S\00EC')
,p_version_scn=>2705046
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
 p_id=>wwv_flow_imp.id(109678305570583962.4474)
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
 p_id=>1.4474
,p_name=>'Messaggi'
,p_alias=>'MESSAGES'
,p_step_title=>'Messaggi'
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
