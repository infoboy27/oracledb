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
,p_default_application_id=>4164
,p_default_id_offset=>0
,p_default_owner=>'APEX_240200'
);
end;
/
 
prompt APPLICATION 4164 - Scheme Authentication Login
--
-- Application Export:
--   Application:     4164
--   Name:            Scheme Authentication Login
--   Exported By:     APEX_240200
--   Flashback:       0
--   Export Type:     Application Export
--     Pages:                      5
--       Items:                   34
--       Computations:             1
--       Validations:              7
--       Processes:                9
--       Regions:                 25
--       Buttons:                  5
--     Shared Components:
--       Logic:
--         Items:                  1
--       Navigation:
--         Parent Tabs:            4
--         Tab Sets:               1
--           Tabs:                 1
--       Security:
--         Authentication:         1
--         Authorization:          1
--       User Interface:
--         Templates:
--           Page:                 2
--           Region:               9
--           Label:                4
--           Popup LOV:            1
--           Button:               3
--         Plug-ins:               1
--       PWA:
--       Globalization:
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
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Scheme Authentication Login')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'A122401200331687746')
,p_page_view_logging=>'YES'
,p_charset=>'utf-8'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt_last_reset=>'20250422175036'
,p_bookmark_checksum_function=>'SH1'
,p_compatibility_mode=>'24.2'
,p_session_state_commits=>'IMMEDIATE'
,p_flow_language=>'ja'
,p_flow_language_derived_from=>'SESSION'
,p_date_format=>'&DATE_FORMAT.'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(655487206132077960.4164)
,p_populate_roles=>'A'
,p_application_tab_set=>1
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'&PRODUCT_NAME. 24.2.0'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_deep_linking=>'Y'
,p_authorize_public_pages_yn=>'Y'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_substitution_string_01=>'PRODUCT_NAME'
,p_substitution_value_01=>'Oracle APEX'
,p_substitution_string_02=>'APPLICATION_ICON'
,p_substitution_value_02=>'oracle_platform_white.gif'
,p_substitution_string_03=>'MSG_COMPANY'
,p_substitution_value_03=>unistr('\30EF\30FC\30AF\30B9\30DA\30FC\30B9: &COMPANY.')
,p_substitution_string_04=>'MSG_LANGUAGE'
,p_substitution_value_04=>unistr('\8A00\8A9E')
,p_substitution_string_05=>'MSG_COPYRIGHT'
,p_substitution_value_05=>'Copyright &copy; 1999, 2024, Oracle and/or its affiliates.'
,p_substitution_string_06=>'MSG_USER'
,p_substitution_value_06=>unistr('\30E6\30FC\30B6\30FC')
,p_substitution_string_07=>'MSG_JSCRIPT'
,p_substitution_value_07=>unistr('\3053\306E\88FD\54C1\306F\3001JavaScript\304C\6709\52B9\306A\72B6\614B\3067\5B9F\884C\3059\308B\5FC5\8981\304C\3042\308A\307E\3059\3002')
,p_substitution_string_08=>'MSG_TBL_SUMMARY'
,p_substitution_value_08=>unistr('\30DA\30FC\30B8\30FB\30EC\30A4\30A2\30A6\30C8\8868')
,p_substitution_string_09=>'CLOSE'
,p_substitution_value_09=>unistr('\9589\3058\308B')
,p_substitution_string_10=>'DATE_FORMAT'
,p_substitution_value_10=>'rr-mm-dd'
,p_substitution_string_11=>'LONG_DATE_FORMAT'
,p_substitution_value_11=>'yyyy mm dd fmDay'
,p_substitution_string_12=>'TIME_FORMAT'
,p_substitution_value_12=>'hh24:mi:ss'
,p_substitution_string_13=>'DATE_TIME_FORMAT'
,p_substitution_value_13=>'rr-mm-dd hh24:mi:ss'
,p_substitution_string_14=>'RETURN_TO_APPLICATION'
,p_substitution_value_14=>unistr('\30A2\30D7\30EA\30B1\30FC\30B7\30E7\30F3\306B\623B\308B')
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_version_scn=>2512302
,p_print_server_type=>'INSTANCE'
,p_file_storage=>'DB'
,p_is_pwa=>'N'
);
end;
/
prompt --application/user_interfaces
begin
wwv_flow_imp_shared.create_user_interface(
 p_id=>wwv_flow_imp.id(4164)
,p_theme_id=>101
,p_home_url=>'f?p=4155:1:&SESSION.'
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
 p_id=>wwv_flow_imp.id(214728703440958.4164)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'default_icon', 'fa-star',
  'tooltip', '#VALUE#')).to_clob
,p_version_scn=>7007817
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(729705784761864.4164)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'NATIVE_OPEN_AI_ASSISTANT'
,p_version_scn=>16254507
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(729973388438584.4164)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SELECT_MANY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_values_as', 'separated')).to_clob
,p_version_scn=>7007816
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(738148027200247.4164)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_BOSS'
,p_version_scn=>243431110
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2658383525125448.4164)
,p_plugin_type=>'PROCESS TYPE'
,p_plugin=>'NATIVE_GEOCODING'
,p_attribute_01=>'RELAX_HOUSE_NUMBER'
,p_version_scn=>117637388
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(14858802044941038.4164)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_style', 'SWITCH_CB',
  'off_value', 'N',
  'on_value', 'Y')).to_clob
,p_version_scn=>6539585
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(99844666838888905.4164)
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
 p_id=>wwv_flow_imp.id(118480913244833028.4164)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_MAP_REGION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_vector_tile_layers', 'Y')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(123213782349478467.4164)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_DATE_PICKER_APEX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'appearance_behavior', 'MONTH-PICKER:YEAR-PICKER',
  'days_outside_month', 'VISIBLE',
  'show_on', 'FOCUS',
  'time_increment', '15')).to_clob
,p_version_scn=>7007820
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(124389475140989299.4164)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_ADFBC'
,p_version_scn=>37165931336889
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(176128720275506818.4164)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N')).to_clob
,p_version_scn=>7007822
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1765072259284712054.4164)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'include_slider', 'N')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1831780000720994153.4164)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'actions_menu_structure', 'IG')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1917632860486939887.4164)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'mode', 'FULL')).to_clob
,p_version_scn=>7007823
);
end;
/
prompt --application/shared_components/security/authorizations/sso_authentication
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(2001350114556715.4164)
,p_name=>'SSO authentication'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return wwv_flow_authentication_dev.get_internal_authentication not in (''APEX'',''CLOUD_IDM'',''LDAP'',''DB'');'
,p_error_message=>unistr('\30D3\30EB\30C0\30FCSSO\304C\6709\52B9\306B\306A\3063\3066\3044\307E\305B\3093')
,p_version_scn=>75567706
,p_caching=>'BY_USER_BY_SESSION'
);
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
null;
end;
/
prompt --application/shared_components/logic/application_items/fsp_after_login_url
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(26310914319937994.4164)
,p_name=>'FSP_AFTER_LOGIN_URL'
,p_scope=>'GLOBAL'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_settings
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/standard
begin
wwv_flow_imp_shared.create_tab(
 p_id=>wwv_flow_imp.id(519013824056522.4164)
,p_tab_set=>'One'
,p_tab_sequence=>1
,p_tab_name=>'T_PAGE_1'
,p_tab_text=>unistr('1\30DA\30FC\30B8')
,p_tab_step=>1
,p_tab_parent_tabset=>'main'
,p_tab_comment=>'Tab generated by create flow wizard'
);
end;
/
prompt --application/shared_components/navigation/tabs/parent
begin
wwv_flow_imp_shared.create_toplevel_tab(
 p_id=>wwv_flow_imp.id(519104518056523.4164)
,p_tab_set=>'main'
,p_tab_sequence=>1
,p_tab_name=>'One'
,p_tab_text=>'1'
,p_tab_target=>'f?p=4155:1:&SESSION'
,p_current_on_tabset=>'One'
);
wwv_flow_imp_shared.create_toplevel_tab(
 p_id=>wwv_flow_imp.id(519229449056523.4164)
,p_tab_set=>'main'
,p_tab_sequence=>2
,p_tab_name=>'Two'
,p_tab_text=>'2'
,p_tab_target=>'f?p=4155:10:&SESSION'
,p_current_on_tabset=>'Two'
);
wwv_flow_imp_shared.create_toplevel_tab(
 p_id=>wwv_flow_imp.id(519313755056523.4164)
,p_tab_set=>'main'
,p_tab_sequence=>3
,p_tab_name=>'Three'
,p_tab_text=>'3'
,p_tab_target=>'f?p=4155:10:&SESSION'
,p_current_on_tabset=>'Three'
);
wwv_flow_imp_shared.create_toplevel_tab(
 p_id=>wwv_flow_imp.id(519415313056523.4164)
,p_tab_set=>'main'
,p_tab_sequence=>4
,p_tab_name=>'Four'
,p_tab_text=>'4'
,p_tab_target=>'f?p=4155:10:&SESSION'
,p_current_on_tabset=>'Four'
);
end;
/
prompt --application/pages/page_groups
begin
null;
end;
/
prompt --application/shared_components/navigation/breadcrumbentry
begin
null;
end;
/
prompt --application/shared_components/user_interface/templates/page/done_popup
begin
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(24029824597247454.4164)
,p_theme_id=>101
,p_name=>'[x] Popup.ja'
,p_internal_name=>'DONE_POPUP'
,p_is_popup=>false
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!--[if HTML5]><![endif]-->',
'<!doctype html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<!--[if lt IE 7 ]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7 ]>    <html class="no-js lt-ie9 lt-ie8 ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8 ]>    <html class="no-js lt-ie9 ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9 ]>    <html class="no-js ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if (gt IE 9)|!(IE)]><!--> <html class="no-js page-&APP_PAGE_ID. app-&APP_ID." lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'',
'  <meta charset="UTF-8">',
'    <title>#TITLE#</title>',
'    <link rel="shortcut icon" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon.ico">',
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
'<body #ONLOAD# class="aPopupPage">',
'    <noscript>&MSG_JSCRIPT.</noscript>#FORM_OPEN#<a name="PAGETOP"></a>'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="htmldbMessageHolder">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>',
'<div>#REGION_POSITION_02##REGION_POSITION_03##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##BODY#</div>',
'<div style="text-align:middle;">#REGION_POSITION_08#</div>'))
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
'<div class="aNotification success" id="MESSAGE">',
'  <div class="aNotificationText">',
'    <h2 class="visuallyhidden" role="alert">#SUCCESS_MESSAGE_HEADING#</h2>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" class="iconMedium success"/>',
'    <p>#SUCCESS_MESSAGE#</p>',
'    <a href="#" class="closeMessage" onclick="$x_Remove(''MESSAGE'');return false;"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="#CLOSE_NOTIFICATION#" class="iconSmall close"/></a>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="aNotification warning" id="MESSAGE">',
'  <div class="aNotificationText">',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" class="iconMedium warning"/>',
'    <div class="warningMessage">',
'      <h2 class="visuallyhidden">#ERROR_MESSAGE_HEADING#</h2>',
'      #MESSAGE#',
'    </div>',
'    <a href="#" class="closeMessage" onclick="$x_Remove(''MESSAGE'');return false;"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="#CLOSE_NOTIFICATION#" class="iconSmall close"/></a>',
'  </div>',
'</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="2" width="100%"'
,p_theme_class_id=>4
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br />',
'<br />',
'<pre>#MESSAGE#</pre>',
'<a href="#BACK_LINK#">#RETURN_TO_APPLICATION#</a>'))
,p_grid_type=>'TABLE'
,p_grid_always_use_max_columns=>false
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_dialog_browser_frame=>'MODAL'
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(72728360925039215.4164)
,p_page_template_id=>wwv_flow_imp.id(24029824597247454.4164)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(72728876711039216.4164)
,p_page_template_id=>wwv_flow_imp.id(24029824597247454.4164)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(72729330291039216.4164)
,p_page_template_id=>wwv_flow_imp.id(24029824597247454.4164)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(72729853624039217.4164)
,p_page_template_id=>wwv_flow_imp.id(24029824597247454.4164)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(72730323826039217.4164)
,p_page_template_id=>wwv_flow_imp.id(24029824597247454.4164)
,p_name=>'Page Position 5'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(72730870062039218.4164)
,p_page_template_id=>wwv_flow_imp.id(24029824597247454.4164)
,p_name=>'Page Position 6'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(72731313676039218.4164)
,p_page_template_id=>wwv_flow_imp.id(24029824597247454.4164)
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
 p_id=>wwv_flow_imp.id(1146777630795684705.4164)
,p_theme_id=>101
,p_name=>'Init 101 - Wizard Page.ja'
,p_internal_name=>'APEX_5.0_WIZARD_PAGE'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.builder.initWizardProgressBar();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!--[if HTML5]><![endif]-->',
'<!doctype html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<!--[if lt IE 7 ]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7 ]>    <html class="no-js lt-ie9 lt-ie8 ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8 ]>    <html class="no-js lt-ie9 ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9 ]>    <html class="no-js ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if (gt IE 9)|!(IE)]><!--> <html class="no-js page-&APP_PAGE_ID. app-&APP_ID." lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'',
'  <meta charset="UTF-8" />',
'  <title>#TITLE#</title>',
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon.ico">',
'<link rel="icon" sizes="16x16" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-16x16.png">',
'<link rel="icon" sizes="32x32" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-32x32.png">',
'<link rel="apple-touch-icon" sizes="180x180" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-180x180.png">',
'  ',
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
'#REGION_POSITION_07#',
'#REGION_POSITION_08#',
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'<div class="u-Layout u-Layout--centerVertically">',
'  <div class="a-Wizard a-Wizard--default">',
'    #REGION_POSITION_02#',
'    <div class="a-Wizard-controls">#REGION_POSITION_01#</div>',
'    <div class="a-Wizard-body">#BODY#</div>',
'    <div class="a-Wizard-buttons">#REGION_POSITION_03#</div>',
'  </div>',
'</div>',
'#REGION_POSITION_04#'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<footer class="a-Footer">',
'',
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
 p_id=>wwv_flow_imp.id(140000736737349573.4164)
,p_page_template_id=>wwv_flow_imp.id(1146777630795684705.4164)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140000865476349569.4164)
,p_page_template_id=>wwv_flow_imp.id(1146777630795684705.4164)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140000946667349569.4164)
,p_page_template_id=>wwv_flow_imp.id(1146777630795684705.4164)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140001066237349569.4164)
,p_page_template_id=>wwv_flow_imp.id(1146777630795684705.4164)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140001170251349569.4164)
,p_page_template_id=>wwv_flow_imp.id(1146777630795684705.4164)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140001263551349569.4164)
,p_page_template_id=>wwv_flow_imp.id(1146777630795684705.4164)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140001364638349569.4164)
,p_page_template_id=>wwv_flow_imp.id(1146777630795684705.4164)
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
prompt --application/shared_components/user_interface/templates/button/html_button_legacy_apex_5_migration
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(3791751542872.4164)
,p_template_name=>'HTML button (legacy - APEX 5 migration)'
,p_internal_name=>'HTML_BUTTON_LEGACY_APEX_5_MIGRATION'
,p_template=>'<input type="button" value="#LABEL!ATTR#" onclick="#JAVASCRIPT#" id="#BUTTON_ID#" class="#BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#/>'
,p_hot_template=>'<input type="button" value="#LABEL!ATTR#" onclick="#JAVASCRIPT#" id="#BUTTON_ID#" class="#BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#/>'
,p_translate_this_template=>'N'
,p_theme_class_id=>13
,p_template_comment=>'5.0 upgrade'
,p_theme_id=>101
);
end;
/
prompt --application/shared_components/user_interface/templates/button/apex_4_1_button
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(297140727685898042.4164)
,p_template_name=>'APEX 4.1 - Button'
,p_internal_name=>'APEX_4.1_BUTTON'
,p_template=>'<button class="aButton" onclick="#LINK#" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#" type="button"><span>#LABEL!HTML#</span></button> '
,p_hot_template=>'<button class="aButton hotButton" onclick="#LINK#" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#" type="button"><span>#LABEL!HTML#</span></button> '
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_template_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="button-gray" role="button" title="#LABEL#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#><span>#LABEL#</span></a> ',
'',
'',
'<a href="#LINK#" class="button-orange" role="button" title="#LABEL#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#><span>#LABEL#</span></a> '))
,p_theme_id=>101
);
end;
/
prompt --application/shared_components/user_interface/templates/button/apex_5_0_button
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(1146918375616882531.4164)
,p_template_name=>'APEX 5.0 - Button'
,p_internal_name=>'APEX_5.0_BUTTON'
,p_template=>'<button onclick="#JAVASCRIPT#" class="a-Button #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL!HTML#</button>'
,p_hot_template=>'<button onclick="#JAVASCRIPT#" class="a-Button a-Button--hot #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL!HTML#</button>'
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>101
);
end;
/
prompt --application/shared_components/user_interface/templates/region/apex_4_2_action_box
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(517201101056507.4164)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<section class="aRegion aActionRegion #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="aRegionHeading">',
'    <h1 data-apex-heading>#TITLE#</h1>',
'  </div>',
'  <div class="aRegionContent clearfix">',
'    #BODY#',
'  </div>',
'  <span class="aButtonContainer">',
'    #CLOSE##DELETE##EDIT##CHANGE##PREVIOUS##NEXT##CREATE#',
'  </span>',
'</section>'))
,p_page_plug_template_name=>'[x] APEX 4.2 - Action Box'
,p_internal_name=>'APEX_4.2_ACTION_BOX'
,p_theme_id=>101
,p_theme_class_id=>12
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2215041129476413.4164)
,p_plug_template_id=>wwv_flow_imp.id(517201101056507.4164)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2215527167476413.4164)
,p_plug_template_id=>wwv_flow_imp.id(517201101056507.4164)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2216042234476413.4164)
,p_plug_template_id=>wwv_flow_imp.id(517201101056507.4164)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2216504575476413.4164)
,p_plug_template_id=>wwv_flow_imp.id(517201101056507.4164)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2217084962476413.4164)
,p_plug_template_id=>wwv_flow_imp.id(517201101056507.4164)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2217506554476414.4164)
,p_plug_template_id=>wwv_flow_imp.id(517201101056507.4164)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2218055132476414.4164)
,p_plug_template_id=>wwv_flow_imp.id(517201101056507.4164)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2218552890476414.4164)
,p_plug_template_id=>wwv_flow_imp.id(517201101056507.4164)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2219033408476414.4164)
,p_plug_template_id=>wwv_flow_imp.id(517201101056507.4164)
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
prompt --application/shared_components/user_interface/templates/region/apex_4_0_action_box_warning
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(498992332002296754.4164)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<section class="aRegion aActionRegion warningRegion #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="aRegionHeading">',
'    <h1 data-apex-heading>#TITLE#</h1>',
'  </div>',
'  <div class="aRegionContent clearfix">',
'    <div class="aActionRegionIcon">',
'      <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" />',
'    </div>',
'    #BODY#',
'  </div>',
'  <span class="aButtonContainer">',
'    #CLOSE##DELETE##EDIT##CHANGE##PREVIOUS##NEXT##CREATE#',
'  </span>',
'</section>'))
,p_page_plug_template_name=>'[x] APEX 4.0 - Action Box / Wizard Box (Warning)'
,p_internal_name=>'APEX_4.0_ACTION_BOX_WARNING'
,p_theme_id=>101
,p_theme_class_id=>12
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1740330628446135.4164)
,p_plug_template_id=>wwv_flow_imp.id(498992332002296754.4164)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1740827628446136.4164)
,p_plug_template_id=>wwv_flow_imp.id(498992332002296754.4164)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1741391521446136.4164)
,p_plug_template_id=>wwv_flow_imp.id(498992332002296754.4164)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1741895363446136.4164)
,p_plug_template_id=>wwv_flow_imp.id(498992332002296754.4164)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1742395931446136.4164)
,p_plug_template_id=>wwv_flow_imp.id(498992332002296754.4164)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1742896231446136.4164)
,p_plug_template_id=>wwv_flow_imp.id(498992332002296754.4164)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1743362700446136.4164)
,p_plug_template_id=>wwv_flow_imp.id(498992332002296754.4164)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1743898517446136.4164)
,p_plug_template_id=>wwv_flow_imp.id(498992332002296754.4164)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1744376232446136.4164)
,p_plug_template_id=>wwv_flow_imp.id(498992332002296754.4164)
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
 p_id=>wwv_flow_imp.id(1146723779286487855.4164)
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
,p_theme_id=>101
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
 p_id=>wwv_flow_imp.id(2536211860486609.4164)
,p_plug_template_id=>wwv_flow_imp.id(1146723779286487855.4164)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2536743325486610.4164)
,p_plug_template_id=>wwv_flow_imp.id(1146723779286487855.4164)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2537292037486610.4164)
,p_plug_template_id=>wwv_flow_imp.id(1146723779286487855.4164)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2537709426486610.4164)
,p_plug_template_id=>wwv_flow_imp.id(1146723779286487855.4164)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2538299282486610.4164)
,p_plug_template_id=>wwv_flow_imp.id(1146723779286487855.4164)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2538786661486610.4164)
,p_plug_template_id=>wwv_flow_imp.id(1146723779286487855.4164)
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
 p_id=>wwv_flow_imp.id(1146753630500658875.4164)
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
,p_theme_id=>101
,p_theme_class_id=>21
,p_default_template_options=>'a-ButtonRegion--wizard'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_default_landmark_type=>'region'
,p_region_title_dom_id=>'#REGION_STATIC_ID#_TITLE'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2217162739232335.4164)
,p_plug_template_id=>wwv_flow_imp.id(1146753630500658875.4164)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2217682972232335.4164)
,p_plug_template_id=>wwv_flow_imp.id(1146753630500658875.4164)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2218186498232335.4164)
,p_plug_template_id=>wwv_flow_imp.id(1146753630500658875.4164)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2218624330232335.4164)
,p_plug_template_id=>wwv_flow_imp.id(1146753630500658875.4164)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2219115152232335.4164)
,p_plug_template_id=>wwv_flow_imp.id(1146753630500658875.4164)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2219697118232335.4164)
,p_plug_template_id=>wwv_flow_imp.id(1146753630500658875.4164)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2220127729232336.4164)
,p_plug_template_id=>wwv_flow_imp.id(1146753630500658875.4164)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2220668832232336.4164)
,p_plug_template_id=>wwv_flow_imp.id(1146753630500658875.4164)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2221156155232336.4164)
,p_plug_template_id=>wwv_flow_imp.id(1146753630500658875.4164)
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
prompt --application/shared_components/user_interface/templates/region/apex_5_0_region
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(1146757828351658890.4164)
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
,p_theme_id=>101
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
 p_id=>wwv_flow_imp.id(2980501821500941.4164)
,p_plug_template_id=>wwv_flow_imp.id(1146757828351658890.4164)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2981059332500941.4164)
,p_plug_template_id=>wwv_flow_imp.id(1146757828351658890.4164)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2981517806500941.4164)
,p_plug_template_id=>wwv_flow_imp.id(1146757828351658890.4164)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2982076945500941.4164)
,p_plug_template_id=>wwv_flow_imp.id(1146757828351658890.4164)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2982580614500941.4164)
,p_plug_template_id=>wwv_flow_imp.id(1146757828351658890.4164)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2983067930500942.4164)
,p_plug_template_id=>wwv_flow_imp.id(1146757828351658890.4164)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2983505583500942.4164)
,p_plug_template_id=>wwv_flow_imp.id(1146757828351658890.4164)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2984018080500942.4164)
,p_plug_template_id=>wwv_flow_imp.id(1146757828351658890.4164)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2984545795500942.4164)
,p_plug_template_id=>wwv_flow_imp.id(1146757828351658890.4164)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2985064312500942.4164)
,p_plug_template_id=>wwv_flow_imp.id(1146757828351658890.4164)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2985552919500942.4164)
,p_plug_template_id=>wwv_flow_imp.id(1146757828351658890.4164)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2986080343500942.4164)
,p_plug_template_id=>wwv_flow_imp.id(1146757828351658890.4164)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2986567494500943.4164)
,p_plug_template_id=>wwv_flow_imp.id(1146757828351658890.4164)
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
 p_id=>wwv_flow_imp.id(1146833868130703375.4164)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="wizardHeader" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  #BODY#',
'</div>'))
,p_page_plug_template_name=>'[x] APEX 5.0 - Wizard Header'
,p_internal_name=>'APEX_5.0_WIZARD_HEADER'
,p_theme_id=>101
,p_theme_class_id=>12
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(88181214486816922.4164)
,p_plug_template_id=>wwv_flow_imp.id(1146833868130703375.4164)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(88181795297816922.4164)
,p_plug_template_id=>wwv_flow_imp.id(1146833868130703375.4164)
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
 p_id=>wwv_flow_imp.id(1146834495802703415.4164)
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
,p_theme_id=>101
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_default_landmark_type=>'region'
,p_region_title_dom_id=>'#REGION_STATIC_ID#_TITLE'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3348953398508588.4164)
,p_plug_template_id=>wwv_flow_imp.id(1146834495802703415.4164)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3349463369508589.4164)
,p_plug_template_id=>wwv_flow_imp.id(1146834495802703415.4164)
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
 p_id=>wwv_flow_imp.id(1146873381156733851.4164)
,p_layout=>'TABLE'
,p_template=>'<div class="#REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#><h1 class="a-Wizard-title" data-apex-heading>#TITLE#</h1></div>'
,p_page_plug_template_name=>'[x] APEX 5.0 - Wizard Title Region'
,p_internal_name=>'APEX_5.0_WIZARD_TITLE_REGION'
,p_plug_table_bgcolor=>'#FFFFFF'
,p_theme_id=>101
,p_theme_class_id=>0
,p_plug_heading_bgcolor=>'#FFFFFF'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_form_table_attr=>'class="htmldbInstruct"'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3375472609510517.4164)
,p_plug_template_id=>wwv_flow_imp.id(1146873381156733851.4164)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3375920234510517.4164)
,p_plug_template_id=>wwv_flow_imp.id(1146873381156733851.4164)
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
 p_id=>wwv_flow_imp.id(1147008167971256777.4164)
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
,p_theme_id=>101
,p_theme_class_id=>12
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3218497363505982.4164)
,p_plug_template_id=>wwv_flow_imp.id(1147008167971256777.4164)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3218920376505982.4164)
,p_plug_template_id=>wwv_flow_imp.id(1147008167971256777.4164)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3219452134505982.4164)
,p_plug_template_id=>wwv_flow_imp.id(1147008167971256777.4164)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3219932417505982.4164)
,p_plug_template_id=>wwv_flow_imp.id(1147008167971256777.4164)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3220401325505982.4164)
,p_plug_template_id=>wwv_flow_imp.id(1147008167971256777.4164)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3220999613505982.4164)
,p_plug_template_id=>wwv_flow_imp.id(1147008167971256777.4164)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3221415442505982.4164)
,p_plug_template_id=>wwv_flow_imp.id(1147008167971256777.4164)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3221997967505983.4164)
,p_plug_template_id=>wwv_flow_imp.id(1147008167971256777.4164)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3222426479505983.4164)
,p_plug_template_id=>wwv_flow_imp.id(1147008167971256777.4164)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3222900779505983.4164)
,p_plug_template_id=>wwv_flow_imp.id(1147008167971256777.4164)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3223423656505983.4164)
,p_plug_template_id=>wwv_flow_imp.id(1147008167971256777.4164)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3223959907505983.4164)
,p_plug_template_id=>wwv_flow_imp.id(1147008167971256777.4164)
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
prompt --application/shared_components/user_interface/templates/label/formfield_optional
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(517018400056507.4164)
,p_template_name=>'FormField_Optional'
,p_internal_name=>'FORMFIELD_OPTIONAL'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="aLabel aOptional"><a href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'',''&CLOSE.'')" tabindex="999">'
,p_template_body2=>'</a></label>'
,p_on_error_after_label=>'<small class="aError">#ERROR_MESSAGE#</small>'
,p_theme_id=>101
,p_theme_class_id=>1
,p_translate_this_template=>'N'
,p_template_comment=>'<label for="#CURRENT_ITEM_NAME#"><a class="htmldbLabelOptional" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'',''&CLOSE.'')" tabindex="999">'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/formfield_required
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(107535106471295136.4164)
,p_template_name=>'FormField_Required'
,p_internal_name=>'FORMFIELD_REQUIRED'
,p_template_body1=>'<em>*</em><label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="aLabel aRequired"><a href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'',''&CLOSE.'')" tabindex="999">'
,p_template_body2=>' <span class="hideMeButHearMe">(#VALUE_REQUIRED#)</span></a></label>'
,p_on_error_after_label=>'<small class="aError">#ERROR_MESSAGE#</small>'
,p_theme_id=>101
,p_theme_class_id=>2
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/apex_5_0_optional_label
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(1146837484282708152.4164)
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
,p_theme_id=>101
,p_theme_class_id=>4
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/apex_5_0_required_label
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(1146837615734708160.4164)
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
,p_theme_id=>101
,p_theme_class_id=>4
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/popuplov
begin
wwv_flow_imp_shared.create_popup_lov_template(
 p_id=>wwv_flow_imp.id(518927322056521.4164)
,p_page_name=>'winlov'
,p_page_title=>unistr('\691C\7D22\30C0\30A4\30A2\30ED\30B0')
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
,p_find_button_text=>unistr('\691C\7D22')
,p_find_button_attr=>'class="a-Button a-Button--hot a-Button--padLeft"'
,p_close_button_text=>unistr('\9589\3058\308B')
,p_close_button_attr=>'class="a-Button u-pullRight"'
,p_next_button_text=>unistr('\6B21 &gt;')
,p_next_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_prev_button_text=>unistr('&lt; \623B\308B')
,p_prev_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'380'
,p_height=>'480'
,p_result_row_x_of_y=>unistr('<div class="a-PopupLOV-pagination">\884C#FIRST_ROW# - #LAST_ROW#</div>')
,p_result_rows_per_pg=>200
,p_before_result_set=>'<div class="a-PopupLOV-links">'
,p_theme_id=>101
,p_theme_class_id=>1
,p_translate_this_template=>'N'
,p_after_result_set=>'</div>'
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
 p_id=>wwv_flow_imp.id(204026132314798041.4164)
,p_theme_id=>101
,p_name=>'Standard'
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
 p_id=>wwv_flow_imp.id(1146724143104487863.4164)
,p_theme_id=>101
,p_name=>'ALERT_TYPE'
,p_display_name=>'Alert Type'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(1146724462659487863.4164)
,p_theme_id=>101
,p_name=>'DISPLAY'
,p_display_name=>'Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(1146754092014658878.4164)
,p_theme_id=>101
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(1146754358989658879.4164)
,p_theme_id=>101
,p_name=>'REGION_PADDING'
,p_display_name=>'Region Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Padding'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(1146754729789658879.4164)
,p_theme_id=>101
,p_name=>'REGION_STYLE'
,p_display_name=>'Region Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Style'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(1146758446175658891.4164)
,p_theme_id=>101
,p_name=>'REGION_OVERFLOW'
,p_display_name=>'Region Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(1146759398601658893.4164)
,p_theme_id=>101
,p_name=>'REGION_POSITION'
,p_display_name=>'Region Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
end;
/
prompt --application/shared_components/user_interface/template_options
begin
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1146725670811487866.4164)
,p_theme_id=>101
,p_name=>'USE_COLORED_BACKGROUND'
,p_display_name=>'Use Colored Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1146723779286487855.4164)
,p_css_classes=>'a-Alert--colorBG'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1146725750422487866.4164)
,p_theme_id=>101
,p_name=>'USE_DEFAULT_ICONS'
,p_display_name=>'Use Default Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1146723779286487855.4164)
,p_css_classes=>'a-Alert--defaultIcons'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1146725914274487866.4164)
,p_theme_id=>101
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1146723779286487855.4164)
,p_css_classes=>'a-Alert--warning'
,p_group_id=>wwv_flow_imp.id(1146724143104487863.4164)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1146726163815487867.4164)
,p_theme_id=>101
,p_name=>'ERROR'
,p_display_name=>'Error'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1146723779286487855.4164)
,p_css_classes=>'a-Alert--danger'
,p_group_id=>wwv_flow_imp.id(1146724143104487863.4164)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1146726316311487867.4164)
,p_theme_id=>101
,p_name=>'INFORMATIONAL'
,p_display_name=>'Informational'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1146723779286487855.4164)
,p_css_classes=>'a-Alert--info'
,p_group_id=>wwv_flow_imp.id(1146724143104487863.4164)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1146726506076487867.4164)
,p_theme_id=>101
,p_name=>'HORIZONTAL'
,p_display_name=>'Horizontal'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1146723779286487855.4164)
,p_css_classes=>'a-Alert--horizontal'
,p_group_id=>wwv_flow_imp.id(1146724462659487863.4164)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1146726718245487867.4164)
,p_theme_id=>101
,p_name=>'WIZARD'
,p_display_name=>'Wizard'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1146723779286487855.4164)
,p_css_classes=>'a-Alert--wizard'
,p_group_id=>wwv_flow_imp.id(1146724462659487863.4164)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1146726819613487867.4164)
,p_theme_id=>101
,p_name=>'REMOVE_ICON'
,p_display_name=>'Remove Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1146723779286487855.4164)
,p_css_classes=>'a-Alert--noIcon'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1146727036922487867.4164)
,p_theme_id=>101
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1146723779286487855.4164)
,p_css_classes=>'a-Alert--success'
,p_group_id=>wwv_flow_imp.id(1146724143104487863.4164)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1146755698969658883.4164)
,p_theme_id=>101
,p_name=>'REGIONCONTAINSITEMSTEXT'
,p_display_name=>'Region Contains Items / Text'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1146753630500658875.4164)
,p_css_classes=>'a-ButtonRegion--withItems'
,p_template_types=>'REGION'
,p_help_text=>'Check this option if this region contains items or text.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1146755801158658885.4164)
,p_theme_id=>101
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1146753630500658875.4164)
,p_css_classes=>'a-ButtonRegion--noUI'
,p_group_id=>wwv_flow_imp.id(1146754729789658879.4164)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1146756082978658885.4164)
,p_theme_id=>101
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1146753630500658875.4164)
,p_css_classes=>'a-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_imp.id(1146754729789658879.4164)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1146756265184658888.4164)
,p_theme_id=>101
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1146753630500658875.4164)
,p_css_classes=>'a-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_imp.id(1146754358989658879.4164)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1146756454000658889.4164)
,p_theme_id=>101
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1146753630500658875.4164)
,p_css_classes=>'a-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_imp.id(1146754358989658879.4164)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1146756528427658889.4164)
,p_theme_id=>101
,p_name=>'WIZARDDIALOG'
,p_display_name=>'Used for Wizard Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1146753630500658875.4164)
,p_css_classes=>'a-ButtonRegion--wizard'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1146756794417658889.4164)
,p_theme_id=>101
,p_name=>'VISIBLE'
,p_display_name=>'Visible'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1146753630500658875.4164)
,p_css_classes=>'a-ButtonRegion--showTitle'
,p_group_id=>wwv_flow_imp.id(1146754092014658878.4164)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1146756999993658889.4164)
,p_theme_id=>101
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1146753630500658875.4164)
,p_css_classes=>'a-ButtonRegion--accessibleTitle'
,p_group_id=>wwv_flow_imp.id(1146754092014658878.4164)
,p_template_types=>'REGION'
,p_help_text=>'Use this option to add a visually hidden heading which is accessible for screen readers, but otherwise not visible to users.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554803565325408341.4164)
,p_theme_id=>101
,p_name=>'HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1146757828351658890.4164)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(1146754092014658878.4164)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554803717040408342.4164)
,p_theme_id=>101
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1146757828351658890.4164)
,p_css_classes=>'a-Region--accessibleHeader'
,p_group_id=>wwv_flow_imp.id(1146754092014658878.4164)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554803989855408342.4164)
,p_theme_id=>101
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(1146757828351658890.4164)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_imp.id(1146754358989658879.4164)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554804189766408342.4164)
,p_theme_id=>101
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1146757828351658890.4164)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_imp.id(1146754358989658879.4164)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554804330090408342.4164)
,p_theme_id=>101
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1146757828351658890.4164)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_imp.id(1146759398601658893.4164)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554804537318408342.4164)
,p_theme_id=>101
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1146757828351658890.4164)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(1146754729789658879.4164)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554804780569408343.4164)
,p_theme_id=>101
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1146757828351658890.4164)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_imp.id(1146758446175658891.4164)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554804971600408343.4164)
,p_theme_id=>101
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1146757828351658890.4164)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_imp.id(1146758446175658891.4164)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554805190489408343.4164)
,p_theme_id=>101
,p_name=>'DEFAULTPADDING'
,p_display_name=>'Default Padding'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(1146757828351658890.4164)
,p_css_classes=>'a-Region--paddedBody'
,p_group_id=>wwv_flow_imp.id(1146754358989658879.4164)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554805239267408343.4164)
,p_theme_id=>101
,p_name=>'REMOVE_TOP_BORDER'
,p_display_name=>'Remove Top Border'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1146757828351658890.4164)
,p_css_classes=>'a-Region--noTopBorder'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554805471106408343.4164)
,p_theme_id=>101
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1146757828351658890.4164)
,p_css_classes=>'a-Region--simple'
,p_group_id=>wwv_flow_imp.id(1146754729789658879.4164)
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
null;
end;
/
prompt --application/shared_components/globalization/dyntranslations
begin
null;
end;
/
prompt --application/shared_components/security/authentications/authentication
begin
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(655487206132077960.4164)
,p_name=>'Authentication'
,p_scheme_type=>'PLUGIN_COM.ORACLE.AUTHENTICATION.4155'
,p_invalid_session_type=>'URL'
,p_invalid_session_url=>'null'
,p_cookie_name=>'-NO_COOKIE-'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_version_scn=>75553175
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_authentication_4155
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(1025089530051554947.4164)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.AUTHENTICATION.4155'
,p_display_name=>unistr('\5185\90E8\30ED\30B0\30A4\30F3\8A8D\8A3C')
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.AUTHENTICATION.4155'),'')
,p_api_version=>1
,p_session_sentry_function=>'wwv_flow_4155_ui.session_sentry'
,p_standard_attributes=>'LOGIN_PAGE'
,p_substitute_attributes=>true
,p_version_scn=>75553176
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
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
 p_id=>1.4164
,p_name=>unistr('\30ED\30B0\30A2\30A6\30C8\7528\306E\30D1\30D6\30EA\30C3\30AF\30FB\30DA\30FC\30B8')
,p_alias=>'PUBLIC_PAGE'
,p_step_title=>unistr('\30ED\30B0\30A2\30A6\30C8\7528\306E\30D1\30D6\30EA\30C3\30AF\30FB\30DA\30FC\30B8')
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_html_page_header=>'<meta name="viewport" content="width=device-width, initial-scale=1.0" />'
,p_step_template=>wwv_flow_imp.id(1146777630795684705.4164)
,p_page_template_options=>'#DEFAULT#'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7642519848874484.4164)
,p_plug_name=>unistr('\6B63\5E38\306B\30ED\30B0\30A2\30A6\30C8\3057\307E\3057\305F\3002')
,p_region_template_options=>'a-Alert--defaultIcons:a-Alert--success:a-Alert--wizard'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1146723779286487855.4164)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\8A8D\8A3C\30B9\30AD\30FC\30E0\306E\30ED\30B0\30A2\30A6\30C8\30FB\30EA\30F3\30AF\3092\4F7F\7528\3057\305F\5F8C\3001\3053\306E\30DA\30FC\30B8\306B\30EA\30C0\30A4\30EC\30AF\30C8\3055\308C\307E\3057\305F\3002\30A2\30D7\30EA\30B1\30FC\30B7\30E7\30F3\306E\30DA\30FC\30B8\306B\30EA\30C0\30A4\30EC\30AF\30C8\3059\308B\5834\5408\306F\3001\6B21\306E\3053\3068\3092\5B9F\884C\3057\307E\3059\3002'),
'<ul>',
unistr('<li>\3054\4F7F\7528\306E\30A2\30D7\30EA\30B1\30FC\30B7\30E7\30F3\306B\30DA\30FC\30B8\3092\4F5C\6210\3057\3001\305D\306E\30DA\30FC\30B8\306B\5225\540DPUBLIC_PAGE\3092\6307\5B9A\3057\307E\3059\3002'),
unistr('<li>\30D3\30EB\30C0\30FC\30FB\30DA\30FC\30B8\306E\5C5E\6027\30DA\30FC\30B8\3067\3001\300C\306F\3044 - \3053\306E\30DA\30FC\30B8\306F\30D1\30D6\30EA\30C3\30AF\3067\3059\300D\30D1\30D6\30EA\30C3\30AF\30FB\30DA\30FC\30B8\5C5E\6027\3092\9078\629E\3057\307E\3059\3002'),
unistr('<li>\8A8D\8A3C\30B9\30AD\30FC\30E0\3067\30ED\30B0\30A2\30A6\30C8URL\3092\5909\66F4\3057\3001\30ED\30B0\30A2\30A6\30C8\30FB\30D7\30ED\30B7\30FC\30B8\30E3\306E\5B9F\884C\5F8C\306B\3001\3053\306E\65B0\3057\3044\30DA\30FC\30B8\306B\30EA\30C0\30A4\30EC\30AF\30C8\3057\307E\3059\3002\305F\3068\3048\3070\3001\6B21\306E\3088\3046\306A\30ED\30B0\30A2\30A6\30C8URL\3092\4F7F\7528\3057\307E\3059\3002<p>'),
'<pre>f?p=&amp;APP_ID.:PUBLIC_PAGE:&amp;SESSION.</pre>',
'<p>',
'</ul>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
end;
/
prompt --application/pages/page_00050
begin
wwv_flow_imp_page.create_page(
 p_id=>50.4164
,p_name=>unistr('\30A8\30F3\30C9\30FB\30E6\30FC\30B6\30FC\30FB\30D1\30B9\30EF\30FC\30C9\306E\5909\66F4')
,p_alias=>'CHANGE-END-USER-PASSWORD'
,p_step_title=>unistr('\30A8\30F3\30C9\30FB\30E6\30FC\30B6\30FC\30FB\30D1\30B9\30EF\30FC\30C9\306E\5909\66F4')
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(1146777630795684705.4164)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8191525547492034.4164)
,p_plug_name=>'reset'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'AFTER_HEADER'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P50_PASSWORD := null;',
':P50_CONFIRM_PASSWORD := null;',
':P50_ENTER_CURRENT_PASSWORD := null;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8191706236492034.4164)
,p_plug_name=>unistr('\30D1\30B9\30EF\30FC\30C9\306E\5909\66F4 - \672C\4F53')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1146834495802703415.4164)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_query_row_template=>wwv_flow_imp.id(1939532588110833.4164)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(923579772962744043.4164)
,p_plug_name=>unistr('\30D1\30B9\30EF\30FC\30C9\306E\5909\66F4')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1146873381156733851.4164)
,p_plug_display_sequence=>21
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(923580432969744050.4164)
,p_plug_name=>unistr('\30D1\30B9\30EF\30FC\30C9\306E\5909\66F4 - \30DC\30BF\30F3')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1146753630500658875.4164)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1146875645787737806.4164)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(923580432969744050.4164)
,p_button_name=>'Save'
,p_button_static_id=>'Save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(1146918375616882531.4164)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('\5909\66F4\306E\9069\7528')
,p_button_position=>'NEXT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8192329780492035.4164)
,p_name=>'P50_USER_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8191706236492034.4164)
,p_prompt=>unistr('\30E6\30FC\30B6\30FC\540D')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'fielddatabold'
,p_field_template=>wwv_flow_imp.id(1146837615734708160.4164)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'I'
,p_help_text=>unistr('\30D1\30B9\30EF\30FC\30C9\304C\5909\66F4\3055\308C\308B\30E6\30FC\30B6\30FC\306E\540D\524D')
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'format', 'HTML',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8192820569492035.4164)
,p_name=>'P50_PASSWORD'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8191706236492034.4164)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\65B0\898F\30D1\30B9\30EF\30FC\30C9\306E\5165\529B')
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_field_template=>wwv_flow_imp.id(1146837615734708160.4164)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_help_text=>unistr('\65B0\898F\30D1\30B9\30EF\30FC\30C9\306E\5165\529B')
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8193305833492036.4164)
,p_name=>'P50_CONFIRM_PASSWORD'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(8191706236492034.4164)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\65B0\898F\30D1\30B9\30EF\30FC\30C9\306E\78BA\8A8D')
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_field_template=>wwv_flow_imp.id(1146837615734708160.4164)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_help_text=>unistr('\65B0\898F\30D1\30B9\30EF\30FC\30C9\3092\518D\5165\529B')
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8193806723492036.4164)
,p_name=>'P50_ENTER_CURRENT_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8191706236492034.4164)
,p_prompt=>unistr('\73FE\884C\306E\30D1\30B9\30EF\30FC\30C9\306E\5165\529B')
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(1146837615734708160.4164)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_help_text=>unistr('\73FE\884C\306E\30D1\30B9\30EF\30FC\30C9\3092\5165\529B\3057\3066\304F\3060\3055\3044\3002')
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'N')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(12378622409765411.4164)
,p_computation_sequence=>20
,p_computation_item=>'P50_USER_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>'return wwv_flow_4155_ui.get_expired_user_name;'
,p_compute_when=>'CONFIRM'
,p_compute_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8194403614492037.4164)
,p_validation_name=>'P50_ENTER_CURRENT_PASSWORD'
,p_validation_sequence=>.5
,p_validation=>'P50_ENTER_CURRENT_PASSWORD'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('\30D1\30B9\30EF\30FC\30C9\3092\6307\5B9A\3059\308B\5FC5\8981\304C\3042\308A\307E\3059\3002')
,p_associated_item=>wwv_flow_imp.id(8193806723492036.4164)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8194629425492037.4164)
,p_validation_name=>'P50_PASSWORD Not Null'
,p_validation_sequence=>1
,p_validation=>'P50_PASSWORD'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('\30D1\30B9\30EF\30FC\30C9\3092\6307\5B9A\3059\308B\5FC5\8981\304C\3042\308A\307E\3059\3002')
,p_associated_item=>wwv_flow_imp.id(8192820569492035.4164)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_validation_comment=>'generated 07-AUG-2002 16:59'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8194822652492037.4164)
,p_validation_name=>'P50_CONFIRM_PASSWORD Not Null'
,p_validation_sequence=>2
,p_validation=>'P50_CONFIRM_PASSWORD'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('\300C\30D1\30B9\30EF\30FC\30C9\306E\78BA\8A8D\300D\306B\5024\3092\6307\5B9A\3059\308B\5FC5\8981\304C\3042\308A\307E\3059\3002')
,p_associated_item=>wwv_flow_imp.id(8193305833492036.4164)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_validation_comment=>'generated 07-AUG-2002 16:59'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8195026061492037.4164)
,p_validation_name=>'passwd = confirm passwd'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P50_PASSWORD != :P50_CONFIRM_PASSWORD then',
'    :P50_PASSWORD := null;',
'    :P50_CONFIRM_PASSWORD := null;',
'    return false;',
'else',
'    return true;',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('\78BA\8A8D\7528\30D1\30B9\30EF\30FC\30C9\3068\30D1\30B9\30EF\30FC\30C9\304C\4E00\81F4\3057\307E\305B\3093\3067\3057\305F\3002')
,p_validation_condition=>':P50_PASSWORD is not null and :P50_CONFIRM_PASSWORD is not null'
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_associated_item=>wwv_flow_imp.id(8193305833492036.4164)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8195417294492037.4164)
,p_validation_name=>'Validate Current Password'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return wwv_flow_user_api.is_login_password_valid(',
'    p_username=>:P50_USER_NAME,',
'    p_password=>:P50_ENTER_CURRENT_PASSWORD);'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('\7121\52B9\306A\30D1\30B9\30EF\30FC\30C9')
,p_validation_condition=>'P50_ENTER_CURRENT_PASSWORD'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_associated_item=>wwv_flow_imp.id(8193806723492036.4164)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(25690303485866343.4164)
,p_validation_name=>'strong password verification'
,p_validation_sequence=>102
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return wwv_flow_security.strong_password_validation(',
'    p_username       => :P50_USER_NAME,',
'    p_password       => :P50_PASSWORD,',
'    p_old_password   => :P50_ENTER_CURRENT_PASSWORD,',
'    p_workspace_name => wwv_flow_security.find_company_name(:WORKSPACE_ID));'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_error_message=>unistr('\30A8\30E9\30FC')
,p_validation_condition=>'P50_ENTER_CURRENT_PASSWORD'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8195726390492038.4164)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'change password and redirect'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'wwv_flow_4155_ui.change_password_and_redirect (',
'    p_password_item_name => ''P50_PASSWORD'' );'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>unistr('\30D1\30B9\30EF\30FC\30C9\306E\5909\66F4\4E2D\306B\30A8\30E9\30FC\304C\767A\751F\3057\307E\3057\305F\3002')
,p_process_when=>':P50_PASSWORD = :P50_CONFIRM_PASSWORD'
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
,p_process_success_message=>unistr('\30D1\30B9\30EF\30FC\30C9\304C\5909\66F4\3055\308C\307E\3057\305F\3002')
,p_internal_uid=>8195726390492038.4164
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12382112282781418.4164)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set notification'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if nvl(:REQUEST,''xy5993-'') <> ''CONFIRM'' then ',
'    wwv_flow.g_notification := wwv_flow_lang.system_message(''PASSWORD_MUST_BE_CHANGED'');',
'end if;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>12382112282781418.4164
);
end;
/
prompt --application/pages/page_00099
begin
wwv_flow_imp_page.create_page(
 p_id=>99.4164
,p_name=>unistr('&PRODUCT_NAME.\306E\975E\30A2\30AF\30C6\30A3\30D6\306A\30EF\30FC\30AF\30B9\30DA\30FC\30B9')
,p_alias=>'INACTIVE-WORKSPACE'
,p_step_title=>unistr('&PRODUCT_NAME.\306E\975E\30A2\30AF\30C6\30A3\30D6\306A\30EF\30FC\30AF\30B9\30DA\30FC\30B9')
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_html_page_header=>'<meta name="viewport" content="width=device-width, initial-scale=1.0" />'
,p_step_template=>wwv_flow_imp.id(1146777630795684705.4164)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(498926816038101235.4164)
,p_plug_name=>unistr('\30EF\30FC\30AF\30B9\30DA\30FC\30B9')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1146834495802703415.4164)
,p_plug_display_sequence=>60
,p_plug_item_display_point=>'BELOW'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P99_SGID'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(498929027949101251.4164)
,p_plug_name=>'Do Not Purge Workspace'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1146834495802703415.4164)
,p_plug_display_sequence=>30
,p_plug_source=>unistr('<p><strong>\300C\30EF\30FC\30AF\30B9\30DA\30FC\30B9\3092\30D1\30FC\30B8\3057\306A\3044\300D</strong>\3092\30AF\30EA\30C3\30AF\3057\3066\3001\30EF\30FC\30AF\30B9\30DA\30FC\30B9&P99_WORKSPACE_NAME.\3092\524A\9664\3059\308B\5FC5\8981\304C\306A\3044\3053\3068\3092\30EA\30AF\30A8\30B9\30C8\3057\307E\3059\3002<strong>\30EF\30FC\30AF\30B9\30DA\30FC\30B9&P99_WORKSPACE_NAME.\3092\524A\9664\3057\306A\3044\305F\3081\306B\306F\3053\306E\30A2\30AF\30B7\30E7\30F3\3092\5B9F\884C\3059\308B\5FC5\8981\304C\3042\308A\307E\3059\3002</strong></p>')
,p_translate_title=>'N'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P99_SGID is not null and :P99_RID is not null and :P99_EID is not null and :P99_OK_TO_DELETE = ''Y'' and :P99_DATE_PURGED is null'
,p_plug_display_when_cond2=>'PLSQL'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'Y',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(498929409062101254.4164)
,p_plug_name=>'Purge Workspace'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1146834495802703415.4164)
,p_plug_display_sequence=>40
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>&P99_LAST_UPDATED_BY.\306F\30EF\30FC\30AF\30B9\30DA\30FC\30B9&P99_WORKSPACE_NAME.\306E\30EF\30FC\30AF\30B9\30DA\30FC\30B9\7BA1\7406\8005\3067\3001\3053\306E\30EF\30FC\30AF\30B9\30DA\30FC\30B9\3092\30D1\30FC\30B8\3057\306A\3044\3088\3046\306B\6307\5B9A\3057\3066\3044\307E\3059\3002\3053\308C\306F\3001&P99_LAST_UPDATED.\306B&P99_LAST_UPDATED_BY.\306B\3088\3063\3066\66F4\65B0\3055\308C\307E\3057\305F\3002</p>'),
'',
unistr('<p>\3053\306E\30EF\30FC\30AF\30B9\30DA\30FC\30B9\304C\4E0D\8981\306B\306A\3063\305F\5834\5408\3001<strong>\300C\8A2D\5B9A\306E\5909\66F4 - \30EF\30FC\30AF\30B9\30DA\30FC\30B9\3092\30D1\30FC\30B8\3057\3066\304F\3060\3055\3044\300D</strong>\3092\30AF\30EA\30C3\30AF\3059\308B\3068\3001\30EF\30FC\30AF\30B9\30DA\30FC\30B9\306F<span class="u-danger-text"><strong>&P99_DATE_TO_BE_PURGED.</strong></span>\4EE5\964D\81EA\52D5\7684\306B\30D1\30FC\30B8\3055\308C\307E\3059\3002</p>')))
,p_translate_title=>'N'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P99_SGID is not null and :P99_RID is not null and :P99_EID is not null and :P99_OK_TO_DELETE = ''N'' and :P99_DATE_PURGED is null'
,p_plug_display_when_cond2=>'PLSQL'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(498929808292101255.4164)
,p_plug_name=>unistr('\7121\52B9\306A\30EA\30AF\30A8\30B9\30C8')
,p_region_template_options=>'#DEFAULT#:a-Alert--warning:a-Alert--wizard'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1146723779286487855.4164)
,p_plug_display_sequence=>70
,p_plug_source=>unistr('\3053\306E\30A2\30D7\30EA\30B1\30FC\30B7\30E7\30F3\306F&P99_APEX_URL.\306E\30EF\30FC\30AF\30B9\30DA\30FC\30B9\306E\4F7F\7528\72B6\6CC1\3092\78BA\8A8D\3059\308B\305F\3081\306B\4F7F\7528\3055\308C\307E\3059\3002\3053\306E\30A2\30D7\30EA\30B1\30FC\30B7\30E7\30F3\307E\305F\306F\30D1\30FC\30B8\30FB\30D7\30ED\30BB\30B9\306B\3064\3044\3066\8CEA\554F\304C\3042\308B\5834\5408\306F\3001<a href="mailto:&P99_PURGE_ADMIN_EMAIL.">&P99_PURGE_ADMIN_EMAIL.</a>\306B\96FB\5B50\30E1\30FC\30EB\3067\8CEA\554F\3092\9001\4FE1\3057\3066\304F\3060\3055\3044\3002')
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P99_SGID'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(498930028451101256.4164)
,p_plug_name=>unistr('&PRODUCT_NAME.\306E\30EF\30FC\30AF\30B9\30DA\30FC\30B9\306E\30D1\30FC\30B8')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1146873381156733851.4164)
,p_plug_display_sequence=>5
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'BELOW'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P99_SGID is not null and :P99_RID is not null and :P99_EID is not null and :P99_DATE_PURGED is null'
,p_plug_display_when_cond2=>'PLSQL'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'Y',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(498930208776101256.4164)
,p_plug_name=>unistr('&PRODUCT_NAME.\3092\3054\5229\7528\3044\305F\3060\304D\3001\3042\308A\304C\3068\3046\3054\3056\3044\307E\3059 - \30EF\30FC\30AF\30B9\30DA\30FC\30B9\306F\30D1\30FC\30B8\3055\308C\307E\3057\305F')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1146873381156733851.4164)
,p_plug_display_sequence=>25
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'BELOW'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P99_SGID is not null and :P99_RID is not null and :P99_EID is not null and :P99_DATE_PURGED is not null'
,p_plug_display_when_cond2=>'PLSQL'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'Y',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1146878093898737830.4164)
,p_plug_name=>'Workspace Purge - Info'
,p_region_css_classes=>'margin-bottom-md'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1146834495802703415.4164)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>unistr('<p>\975E\30A2\30AF\30C6\30A3\30D6\306A\30EF\30FC\30AF\30B9\30DA\30FC\30B9&P99_WORKSPACE_NAME.\306F\3001&P99_DATE_TO_BE_PURGED.\306B\524A\9664\3059\308B\3088\3046\30B9\30B1\30B8\30E5\30FC\30EB\3055\308C\3066\3044\307E\3059\3002</p>')
,p_translate_title=>'N'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P99_SGID is not null and :P99_RID is not null and :P99_EID is not null and :P99_DATE_PURGED is null'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'Y',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1146878195005737831.4164)
,p_plug_name=>'Workspace Purged  - Info'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1146834495802703415.4164)
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\30EF\30FC\30AF\30B9\30DA\30FC\30B9<strong>&P99_WORKSPACE_NAME.</strong>\306F<strong>&P99_DATE_PURGED.</strong>\306B\30D1\30FC\30B8\3055\308C\307E\3057\305F\3002</p>'),
unistr('<p>&P99_APEX_URL.\306E&PRODUCT_NAME.\3092\3054\5229\7528\3044\305F\3060\304D\3001\3042\308A\304C\3068\3046\3054\3056\3044\307E\3059\3002</p>')))
,p_translate_title=>'N'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P99_SGID is not null and :P99_RID is not null and :P99_EID is not null and :P99_DATE_PURGED is not null'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'Y',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1146878222526737832.4164)
,p_plug_name=>'Buttons'
,p_plug_display_sequence=>35
,p_plug_display_point=>'REGION_POSITION_03'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(498929226472101252.4164)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1146878222526737832.4164)
,p_button_name=>'DONTPURGE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(1146918375616882531.4164)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('\30EF\30FC\30AF\30B9\30DA\30FC\30B9\3092\30D1\30FC\30B8\3057\306A\3044')
,p_button_condition=>':P99_OK_TO_DELETE = ''Y'' and :P99_DATE_PURGED is null'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(498929614547101255.4164)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(1146878222526737832.4164)
,p_button_name=>'PURGE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(1146918375616882531.4164)
,p_button_image_alt=>unistr('\8A2D\5B9A\306E\5909\66F4 - \30EF\30FC\30AF\30B9\30DA\30FC\30B9\3092\30D1\30FC\30B8\3057\3066\304F\3060\3055\3044')
,p_button_condition=>':P99_OK_TO_DELETE = ''N'' and :P99_DATE_PURGED is null'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_button_css_classes=>'a-Button--danger'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(498931017585101269.4164)
,p_branch_action=>'f?p=&APP_ID.:99:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(498927015083101242.4164)
,p_name=>'P99_EID'
,p_item_sequence=>25
,p_item_plug_id=>wwv_flow_imp.id(498926816038101235.4164)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(498927201924101248.4164)
,p_name=>'P99_DATE_TO_BE_PURGED'
,p_item_sequence=>95
,p_item_plug_id=>wwv_flow_imp.id(498926816038101235.4164)
,p_prompt=>unistr('\30BF\30FC\30B2\30C3\30C8\30D1\30FC\30B8\65E5')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'fielddatabold'
,p_field_template=>wwv_flow_imp.id(1146837484282708152.4164)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_input=>'Y'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'HTML',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(498927400231101248.4164)
,p_name=>'P99_LAST_UPDATED_BY'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(498926816038101235.4164)
,p_prompt=>unistr('\66F4\65B0\8005')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'fielddatabold'
,p_field_template=>wwv_flow_imp.id(1146837484282708152.4164)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(498927620508101249.4164)
,p_name=>'P99_SGID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(498926816038101235.4164)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(498927813465101249.4164)
,p_name=>'P99_RID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(498926816038101235.4164)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(498928004161101250.4164)
,p_name=>'P99_WORKSPACE_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(498926816038101235.4164)
,p_prompt=>unistr('\30EF\30FC\30AF\30B9\30DA\30FC\30B9\540D')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'fielddatabold'
,p_field_template=>wwv_flow_imp.id(1146837484282708152.4164)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_input=>'Y'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(498928221678101250.4164)
,p_name=>'P99_ADMIN_EMAIL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(498926816038101235.4164)
,p_prompt=>unistr('\6700\521D\306E\30EF\30FC\30AF\30B9\30DA\30FC\30B9\30FB\30EA\30AF\30A8\30B9\30C8\8005')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'fielddatabold'
,p_field_template=>wwv_flow_imp.id(1146837484282708152.4164)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_input=>'Y'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(498928405763101250.4164)
,p_name=>'P99_OK_TO_DELETE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(498926816038101235.4164)
,p_prompt=>unistr('\30EF\30FC\30AF\30B9\30DA\30FC\30B9\3092\30D1\30FC\30B8\3057\307E\3059\304B\3002')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_lov=>'STATIC:Yes;Y,No;N'
,p_tag_css_classes=>'fielddatabold'
,p_field_template=>wwv_flow_imp.id(1146837484282708152.4164)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_input=>'Y'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'LOV',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(498928608702101251.4164)
,p_name=>'P99_LAST_UPDATED'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(498926816038101235.4164)
,p_prompt=>unistr('\66F4\65B0')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'fielddatabold'
,p_field_template=>wwv_flow_imp.id(1146837484282708152.4164)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_input=>'Y'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'HTML',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(498928817636101251.4164)
,p_name=>'P99_DATE_PURGED'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(498926816038101235.4164)
,p_prompt=>unistr('\30D1\30FC\30B8\65E5')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'fielddatabold'
,p_display_when=>'P99_DATE_PURGED'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(1146837484282708152.4164)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'HTML',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(502441507830936748.4164)
,p_name=>'P99_APEX_URL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(498926816038101235.4164)
,p_prompt=>unistr('\30EF\30FC\30AF\30B9\30DA\30FC\30B9URL')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'fielddatabold'
,p_field_template=>wwv_flow_imp.id(1146837484282708152.4164)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(504639132530012441.4164)
,p_name=>'P99_PURGE_ADMIN_EMAIL'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(498926816038101235.4164)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(504753932501485476.4164)
,p_name=>'P99_WORKSPACE_ADMINS'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(498926816038101235.4164)
,p_prompt=>unistr('\30EF\30FC\30AF\30B9\30DA\30FC\30B9\7BA1\7406\8005')
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_return_val varchar2(32767);',
'begin',
'    for c1 in (select distinct email from wwv_purge_emails where security_group_id = :P99_SGID order by 1) loop',
'        l_return_val := l_return_val || c1.email || '', '';',
'    end loop;',
'    return substr(l_return_val, 1, length(l_return_val)-2);',
'end;'))
,p_source_type=>'FUNCTION_BODY'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'fielddatabold'
,p_field_template=>wwv_flow_imp.id(1146837484282708152.4164)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(498930401204101258.4164)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Retain workspace'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'wwv_purge.save_response( ',
'    p_purge_email_id => :P99_EID,',
'    p_response_code  => ''RETAIN'' );',
'commit;'))
,p_process_clob_language=>'PLSQL'
,p_process_when_button_id=>wwv_flow_imp.id(498929226472101252.4164)
,p_process_success_message=>unistr('\30EF\30FC\30AF\30B9\30DA\30FC\30B9&P99_WORKSPACE_NAME.\306F\30D1\30FC\30B8\3055\308C\307E\305B\3093\3002')
,p_internal_uid=>498930401204101258.4164
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(498930608172101261.4164)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Purge Workspace'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'wwv_purge.save_response( ',
'    p_purge_email_id => :P99_EID,',
'    p_response_code  => ''PURGE'' );',
'commit;'))
,p_process_clob_language=>'PLSQL'
,p_process_when_button_id=>wwv_flow_imp.id(498929614547101255.4164)
,p_process_success_message=>unistr('\30EF\30FC\30AF\30B9\30DA\30FC\30B9&P99_WORKSPACE_NAME.\306F&P99_DATE_TO_BE_PURGED.\4EE5\964D\30D1\30FC\30B8\3055\308C\307E\3059\3002')
,p_internal_uid=>498930608172101261.4164
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(498930813327101266.4164)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Fetch workspace details'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_found boolean := FALSE;',
'begin',
'    :P99_APEX_URL := wwv_flow_utilities.host_url( ''SCRIPT'' );',
'    :P99_PURGE_ADMIN_EMAIL := wwv_flow_platform.get_preference( p_preference_name => ''PURGE_ADMIN_EMAIL'' );',
'',
'    for c1 in (select w.workspace_name, w.date_to_purge, w.purged_ts, w.admin_email, w.security_group_id, w.id',
'                 from wwv_purge_workspaces w, wwv_purge_emails e',
'                where e.purge_workspace_id = w.id',
'                  and e.security_group_id = w.security_group_id',
'                  and e.id = :P99_EID) loop',
'        :P99_WORKSPACE_NAME    := c1.workspace_name;',
'        :P99_ADMIN_EMAIL       := c1.admin_email;',
'        :P99_DATE_PURGED       := to_char(c1.purged_ts, ''Month fmDDfm, YYYY HH24:MI'');',
'        :P99_DATE_TO_BE_PURGED := to_char(c1.date_to_purge, ''Month fmDD, YYYY'');',
'        :P99_OK_TO_DELETE      := ''Y'';',
'        :P99_SGID              := c1.security_group_id;',
'        :P99_RID               := c1.id;',
'        --',
'        for c2 in (select r.response_code, r.created_ts, e.email',
'                     from wwv_purge_workspace_responses r, wwv_purge_emails e',
'                    where e.security_group_id = c1.security_group_id',
'                      and e.id = r.purge_email_id',
'                      and r.created_ts = (select max(r2.created_ts) ',
'                                          from wwv_purge_workspace_responses r2, wwv_purge_emails e2',
'                                         where e2.id = r2.purge_email_id',
'                                           and e2.security_group_id = c1.security_group_id)) loop',
'            if c2.response_code = ''PURGE'' then',
'                :P99_OK_TO_DELETE := ''Y'';',
'            else',
'                :P99_OK_TO_DELETE := ''N'';',
'            end if;',
'            :P99_LAST_UPDATED := to_char(c2.created_ts, ''Month fmDDfm, YYYY HH24:MI'' );',
'            :P99_LAST_UPDATED_BY := c2.email;',
'        end loop;',
'        --',
'        l_found := TRUE;',
'        exit;',
'    end loop;',
'    --',
'    if l_found = FALSE then',
'        :P99_WORKSPACE_NAME    := null;',
'        :P99_ADMIN_EMAIL       := null;',
'        :P99_SGID              := null;',
'        :P99_RID               := null;',
'        :P99_EID               := null;',
'        :P99_DATE_TO_BE_PURGED := null;',
'        :P99_LAST_UPDATED      := null;',
'        :P99_LAST_UPDATED_BY   := null;',
'        :P99_APEX_URL          := null;',
'    end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>unistr('\7121\52B9\306A\30EF\30FC\30AF\30B9\30DA\30FC\30B9\304A\3088\3073\30EA\30AF\30A8\30B9\30C8\8B58\5225\5B50\3067\3059\3002')
,p_internal_uid=>498930813327101266.4164
);
end;
/
prompt --application/pages/page_00200
begin
wwv_flow_imp_page.create_page(
 p_id=>200.4164
,p_name=>unistr('\5BFE\8A71\30E2\30FC\30C9\30FB\30EC\30DD\30FC\30C8\306E\30B5\30D6\30B9\30AF\30EA\30D7\30B7\30E7\30F3\306E\89E3\9664')
,p_alias=>'UNSUBSCRIBE-INTERACTIVE-REPORT-SUBSCRIPTION'
,p_step_title=>unistr('\5BFE\8A71\30E2\30FC\30C9\30FB\30EC\30DD\30FC\30C8\306E\30B5\30D6\30B9\30AF\30EA\30D7\30B7\30E7\30F3\306E\89E3\9664')
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_step_template=>wwv_flow_imp.id(1146777630795684705.4164)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_help_text=>'No help is available for this page.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(23238304177115429.4164)
,p_plug_name=>'Unsubscribe - Body'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1146834495802703415.4164)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>unistr('\73FE\5728\3001\6B21\306E\30EC\30DD\30FC\30C8\306B<strong>&P200_EMAIL.</strong>\3068\3057\3066\30B5\30D6\30B9\30AF\30E9\30A4\30D6\3057\3066\3044\307E\3059\3002\3053\306E\96FB\5B50\30E1\30FC\30EB\30FB\30A2\30C9\30EC\30B9\3067\4ECA\5F8C\30E1\30FC\30EB\306E\53D7\4FE1\3092\5E0C\671B\3057\306A\3044\5834\5408\306F\3001\6B21\306E<strong>\300C\30B5\30D6\30B9\30AF\30E9\30A4\30D6\89E3\9664\300D</strong>\3092\30AF\30EA\30C3\30AF\3057\3066\304F\3060\3055\3044\3002')
,p_translate_title=>'N'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P200_ID is not null and :P200_SGID is not null and :P200_RID is not null'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(24076722086058097.4164)
,p_plug_name=>unistr('\3042\308A\304C\3068\3046\3054\3056\3044\307E\3059\3002\30B5\30D6\30B9\30AF\30E9\30A4\30D6\89E3\9664\3057\307E\3057\305F')
,p_region_template_options=>'#DEFAULT#:a-Alert--success:a-Alert--wizard'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1146723779286487855.4164)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>unistr('\3042\308A\304C\3068\3046\3054\3056\3044\307E\3059\3002\30EC\30DD\30FC\30C8\30FB\30B5\30D6\30B9\30AF\30EA\30D7\30B7\30E7\30F3\306E\96FB\5B50\30E1\30FC\30EB\304B\3089\30B5\30D6\30B9\30AF\30E9\30A4\30D6\89E3\9664\3055\308C\307E\3057\305F\3002  ')
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P200_ID is null and :P200_SGID is null and :P200_RID is null and :P200_UNSUBSCRIBED = ''Y'''
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(24076913092131160.4164)
,p_plug_name=>unistr('\7121\52B9\306A\30EA\30AF\30A8\30B9\30C8')
,p_region_template_options=>'#DEFAULT#:a-Alert--warning:a-Alert--wizard'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1146723779286487855.4164)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>unistr('\3053\306E\30A2\30D7\30EA\30B1\30FC\30B7\30E7\30F3\306F\3001\30EC\30DD\30FC\30C8\30FB\30B5\30D6\30B9\30AF\30EA\30D7\30B7\30E7\30F3\306E\30B5\30D6\30B9\30AF\30E9\30A4\30D6\89E3\9664\306B\4F7F\7528\3055\308C\307E\3059\3002\7121\52B9\306AURL\3067\3053\306E\30DA\30FC\30B8\306B\30A2\30AF\30BB\30B9\3057\3066\3044\307E\3059\3002')
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P200_SGID is null and :P200_RID is null and :P200_UNSUBSCRIBED is null'
,p_plug_display_when_cond2=>'PLSQL'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(24078523883238409.4164)
,p_plug_name=>'Report'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_item_display_point=>'BELOW'
,p_translate_title=>'N'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P200_RID'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1146878390734737833.4164)
,p_plug_name=>unistr('\30B5\30D6\30B9\30AF\30E9\30A4\30D6\89E3\9664')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1146873381156733851.4164)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'BELOW'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P200_ID is not null and :P200_SGID is not null and :P200_RID is not null'
,p_plug_display_when_cond2=>'PLSQL'
,p_plug_footer=>'<br/><br/>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1146878524267737835.4164)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1146753630500658875.4164)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_translate_title=>'N'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P200_RID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(23241020416235620.4164)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1146878524267737835.4164)
,p_button_name=>'UNSUBSCRIBE'
,p_button_action=>'SUBMIT'
,p_button_template_id=>wwv_flow_imp.id(1146918375616882531.4164)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('\30B5\30D6\30B9\30AF\30E9\30A4\30D6\89E3\9664')
,p_button_position=>'NEXT'
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(24075027356965025.4164)
,p_branch_action=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(23239325947161488.4164)
,p_name=>'P200_EMAIL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(24078523883238409.4164)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(23240324656217886.4164)
,p_name=>'P200_APPLICATION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(24078523883238409.4164)
,p_prompt=>unistr('\30A2\30D7\30EA\30B1\30FC\30B7\30E7\30F3:')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(1146837484282708152.4164)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('\30A2\30D7\30EA\30B1\30FC\30B7\30E7\30F3\306E\540D\524D\3002')
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(23240509896223103.4164)
,p_name=>'P200_PAGE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(24078523883238409.4164)
,p_prompt=>unistr('\30DA\30FC\30B8:')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(1146837484282708152.4164)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('\30DA\30FC\30B8\306E\540D\524D\3002')
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(23240719592225871.4164)
,p_name=>'P200_REPORT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(24078523883238409.4164)
,p_prompt=>unistr('\30EC\30DD\30FC\30C8:')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(1146837484282708152.4164)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('\30B5\30D6\30B9\30AF\30E9\30A4\30D6\3057\3066\3044\308B\30EC\30DD\30FC\30C8\306E\540D\524D\3002')
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(23240927557228254.4164)
,p_name=>'P200_ID'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(24078523883238409.4164)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(23241516784272398.4164)
,p_name=>'P200_SGID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(24078523883238409.4164)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(24080425624314564.4164)
,p_name=>'P200_UNSUBSCRIBED'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(24078523883238409.4164)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(24084004265516600.4164)
,p_name=>'P200_RID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(24078523883238409.4164)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(24070713831809643.4164)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'remove subscription'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'wwv_flow_ir.builder_unsubscribe_email(',
'    p_subscription_id => :P200_ID,',
'    p_workspace_id    => :P200_SGID,',
'    p_email           => :P200_EMAIL );',
':P200_UNSUBSCRIBED := ''Y'';'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(23241020416235620.4164)
,p_process_success_message=>unistr('\30B5\30D6\30B9\30AF\30E9\30A4\30D6\89E3\9664\3057\307E\3057\305F\3002\3042\308A\304C\3068\3046\3054\3056\3044\307E\3059\3002')
,p_internal_uid=>24070713831809643.4164
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(24059901749058684.4164)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'fetch subscription info'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_found boolean := FALSE;',
'begin',
'    for c1 in (select ',
'               n.security_group_id,',
'               n.email_address,',
'               n.report_id,',
'               (select c.short_name from wwv_flow_companies c where c.provisioning_company_id = n.security_group_id) workspace_name,',
'               (select f.id||'' - ''||f.name from wwv_flows f where f.id = w.flow_id) app_name,',
'               (select p.id||'' - ''||p.name from wwv_flow_steps p where p.id = w.page_id and p.flow_id = w.flow_id) page_name,',
'               r.name||',
'               (case when r.is_default = ''Y'' and r.application_user=''APXWS_DEFAULT'' then',
'                       wwv_flow_lang.system_message(''APEXIR_PRIMARY_REPORT'')',
'                     when r.is_default = ''Y'' and r.application_user=''APXWS_ALTERNATIVE'' then',
'                       '' (''||wwv_flow_lang.system_message(''SAVED_REPORTS.ALTERNATIVE.DEFAULT'')||'')''',
'                     when r.session_id is null and r.status=''PUBLIC'' then',
'                       '' (''||wwv_flow_lang.system_message(''APEXIR_PUBLIC'')||'')''',
'                     when r.session_id is null and r.status=''PRIVATE'' then',
'                       '' (''||wwv_flow_lang.system_message(''APEXIR_PRIVATE'')||'')''',
'               end) report_name',
'               from wwv_flow_worksheet_notify n, wwv_flow_worksheets w, wwv_flow_worksheet_rpts r',
'               where n.worksheet_id = w.id',
'               and n.report_id = r.id',
'               and w.id = r.worksheet_id',
'               and n.id = :P200_ID',
'               and (instr(n.email_address, :P200_EMAIL) > 0 or :P200_EMAIL is null)',
'               )',
'    loop',
'        if :P200_EMAIL is null then',
'            :P200_EMAIL := c1.email_address;',
'        end if;',
'        :P200_APPLICATION   := c1.app_name;',
'        :P200_PAGE          := c1.page_name;',
'        :P200_REPORT        := c1.report_name;',
'        :P200_RID           := c1.report_id;',
'        :P200_SGID          := c1.security_group_id;',
'        l_found := TRUE;',
'        exit;',
'    end loop;',
'    --',
'    if l_found = FALSE then',
'        :P200_EMAIL         := null;',
'        :P200_APPLICATION   := null;',
'        :P200_PAGE          := null;',
'        :P200_REPORT        := null;',
'        :P200_RID           := null;',
'        :P200_SGID          := null;',
'        :P200_ID            := null;',
'    end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>unistr('\30B5\30D6\30B9\30AF\30EA\30D7\30B7\30E7\30F3\3068\30EA\30AF\30A8\30B9\30C8\8B58\5225\5B50\304C\7121\52B9\3067\3059\3002')
,p_internal_uid=>24059901749058684.4164
);
end;
/
prompt --application/pages/page_01000
begin
wwv_flow_imp_page.create_page(
 p_id=>1000.4164
,p_name=>unistr('\30ED\30B0\30A4\30F3')
,p_alias=>'LOGIN'
,p_step_title=>unistr('\30ED\30B0\30A4\30F3')
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_html_page_header=>'<meta name="viewport" content="width=device-width, initial-scale=1.0" />'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.builder.initWizardProgressBar = function() {',
'    apex.theme.initWizardProgressBar( "a-WizardSteps" );',
'};'))
,p_step_template=>wwv_flow_imp.id(1146777630795684705.4164)
,p_page_template_options=>'#DEFAULT#'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1402815470381580.4164)
,p_plug_name=>'Tips'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1146834495802703415.4164)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>unistr('\3053\306E\30D5\30A9\30FC\30E0\306B\8CC7\683C\8A3C\660E\3092\5165\529B\3057\3001\3053\306E&PRODUCT_NAME.\30A2\30D7\30EA\30B1\30FC\30B7\30E7\30F3\3067\65B0\3057\3044\30BB\30C3\30B7\30E7\30F3\3092\8D77\52D5\3057\307E\3059\3002')
,p_translate_title=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(57075215208721471.4164)
,p_plug_name=>'login body'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1146834495802703415.4164)
,p_plug_display_sequence=>20
,p_translate_title=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_plug_comment=>'Region generated by create flow wizard'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(643964332163437775.4164)
,p_plug_name=>'Help'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1146834495802703415.4164)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    procedure p(p_str in varchar2)',
'    is',
'    begin',
'        -- sys.htp.p(''<p>'');',
'        sys.htp.p(wwv_flow.do_substitutions(regexp_replace(p_str,''&amp;([A-Z0-9_]+\.)'',''&\1'')));',
'        -- sys.htp.p(''</p>'');',
'    end;',
'begin',
'    p(:F4155_AUTHENTICATION_HELP_TEXT);',
'    p(:F4155_PLUGIN_HELP_TEXT);',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1146876836521737818.4164)
,p_plug_name=>'login buttons'
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_plug_comment=>'Region generated by create flow wizard'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1146877779285737827.4164)
,p_plug_name=>unistr('\30A2\30D7\30EA\30B1\30FC\30B7\30E7\30F3&F4155_P1000_APP_ID.\306B\30ED\30B0\30A4\30F3\3057\307E\3059\3002')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1146873381156733851.4164)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_02'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(57079816296853917.4164)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1146876836521737818.4164)
,p_button_name=>'LOGIN_BUTTON'
,p_button_static_id=>'LOGIN_BUTTON'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(1146918375616882531.4164)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('\30ED\30B0\30A4\30F3')
,p_button_cattributes=>'class="button10"'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(34456324362177919.4164)
,p_branch_action=>'1000'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_sequence=>10
,p_branch_condition_type=>'EXPRESSION'
,p_branch_condition=>'wwv_flow.g_notification is not null'
,p_branch_condition_text=>'PLSQL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(476622691412236.4164)
,p_name=>'F4155_P1000_USERNAME'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(57075215208721471.4164)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\30E6\30FC\30B6\30FC\540D')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_tag_attributes=>'tabindex="1"'
,p_field_template=>wwv_flow_imp.id(1146837615734708160.4164)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'send_on_page_submit', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(477505160416649.4164)
,p_name=>'F4155_P1000_PASSWORD'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(57075215208721471.4164)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\30D1\30B9\30EF\30FC\30C9')
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_tag_attributes=>'tabindex="2"'
,p_display_when=>'F4155_P1000_NEEDS_PASSWORD_YN'
,p_display_when2=>'Y'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(1146837615734708160.4164)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(485932199001641.4164)
,p_name=>'F4155_P1000_FLOW_PAGE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(57075215208721471.4164)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1441703804737288.4164)
,p_name=>'F4155_P1000_SETUP_ID'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(57075215208721471.4164)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(643811309110241934.4164)
,p_name=>'F4155_PLUGIN_HELP_TEXT'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(1402815470381580.4164)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(643833917075244221.4164)
,p_name=>'F4155_AUTHENTICATION_HELP_TEXT'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(1402815470381580.4164)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(643856524001246239.4164)
,p_name=>'F4155_WORKSPACE_NAME'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(1402815470381580.4164)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(644127827193502573.4164)
,p_name=>'F4155_P1000_NEEDS_PASSWORD_YN'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(57075215208721471.4164)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1146877882588737828.4164)
,p_name=>'F4155_P1000_APP_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1146877779285737827.4164)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(57188216053643298.4164)
,p_validation_name=>'pass req'
,p_validation_sequence=>10
,p_validation=>'F4155_P1000_PASSWORD'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('\30D1\30B9\30EF\30FC\30C9\3092\6307\5B9A\3057\3066\304F\3060\3055\3044\3002')
,p_validation_condition=>'F4155_P1000_NEEDS_PASSWORD_YN'
,p_validation_condition2=>'Y'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(475708492408121.4164)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'login'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_flow_page varchar2(4000);',
'begin',
'    wwv_flow_custom_auth_std.login(',
'        p_uname=>wwv_flow_escape.html(:F4155_P1000_USERNAME),',
'        p_password=>:F4155_P1000_PASSWORD,',
'        p_session_id=>:FLOW_SESSION,',
'        p_flow_page=>:F4155_P1000_FLOW_PAGE);',
'',
'    l_flow_page := :F4155_P1000_FLOW_PAGE;',
'    wwv_flow.clear_page_cache (',
'        p_flow_page_id => wwv_flow.g_flow_step_id );',
'    wwv_flow_session_state.save_by_name (',
'        p_item_name  => ''F4155_P1000_FLOW_PAGE'',',
'        p_item_value => l_flow_page );',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>475708492408121.4164
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(643777621100235936.4164)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'get_login_help_for_app'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_app_str           varchar2(80);',
'    l_app_id            number;',
'begin',
'    l_app_str := regexp_substr(:F4155_P1000_FLOW_PAGE,''\d+([,.]\d+)?'');',
'    begin',
'        l_app_id := to_number(replace(l_app_str,'','',''.''));',
'    exception when VALUE_ERROR then',
'        l_app_id := to_number(replace(l_app_str,''.'','',''));',
'    end;',
'',
'    wwv_flow_authentication_dev.get_login_help_for_app (',
'        p_app_id                   => l_app_id,',
'        p_plugin_help_text         => :F4155_PLUGIN_HELP_TEXT,',
'        p_authentication_help_text => :F4155_AUTHENTICATION_HELP_TEXT,',
'        p_workspace_name           => :F4155_WORKSPACE_NAME,',
'        p_needs_password_yn        => :F4155_P1000_NEEDS_PASSWORD_YN );',
'    :F4155_P1000_APP_ID := l_app_str;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>643777621100235936.4164
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
