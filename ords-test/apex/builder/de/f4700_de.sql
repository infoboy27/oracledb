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
,p_default_application_id=>4703
,p_default_id_offset=>0
,p_default_owner=>'APEX_240200'
);
end;
/
 
prompt APPLICATION 4703 - Oracle APEX New Service Signup
--
-- Application Export:
--   Application:     4703
--   Name:            Oracle APEX New Service Signup
--   Exported By:     APEX_240200
--   Flashback:       0
--   Export Type:     Application Export
--     Pages:                     10
--       Items:                   54
--       Computations:            11
--       Validations:             41
--       Processes:                6
--       Regions:                 63
--       Buttons:                 23
--       Dynamic Actions:          2
--     Shared Components:
--       Logic:
--         Items:                 36
--         Computations:           3
--         Build Options:          1
--       Navigation:
--         Parent Tabs:            1
--         Lists:                  1
--       Security:
--         Authentication:         2
--         Authorization:          3
--       User Interface:
--         Templates:
--           Page:                 5
--           Region:              14
--           Label:                8
--           List:                 3
--           Popup LOV:            1
--           Button:               9
--         LOVs:                   4
--         Shortcuts:              1
--         Plug-ins:               8
--       PWA:
--       Globalization:
--         Messages:               1
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
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Oracle APEX New Service Signup')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'A128600169007716015')
,p_page_view_logging=>'YES'
,p_charset=>'utf-8'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt_last_reset=>'20250422175112'
,p_bookmark_checksum_function=>'SH1'
,p_compatibility_mode=>'24.2'
,p_session_state_commits=>'IMMEDIATE'
,p_flow_language=>'de'
,p_flow_language_derived_from=>'SESSION'
,p_date_format=>'&DATE_FORMAT.'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(108165525079033088.4703)
,p_populate_roles=>'A'
,p_application_tab_set=>1
,p_logo_type=>'T'
,p_logo_text=>'Oracle APEX'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'&PRODUCT_NAME. 24.2.0'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_runtime_api_usage=>'O'
,p_security_scheme=>wwv_flow_imp.id(510672326686703270)
,p_authorize_public_pages_yn=>'Y'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_error_handling_function=>'wwv_flow_error_dev.internal_error_handler'
,p_default_error_display_loc=>'INLINE_WITH_FIELD'
,p_substitution_string_01=>'PRODUCT_NAME'
,p_substitution_value_01=>'Oracle APEX'
,p_substitution_string_02=>'DONE'
,p_substitution_value_02=>'Fertig'
,p_substitution_string_03=>'MSG_COMPANY'
,p_substitution_value_03=>'Workspace: &COMPANY.'
,p_substitution_string_04=>'CLOSE'
,p_substitution_value_04=>unistr('Schlie\00DFen')
,p_substitution_string_05=>'DATE_FORMAT'
,p_substitution_value_05=>'dd.mm.rr'
,p_substitution_string_06=>'LONG_DATE_FORMAT'
,p_substitution_value_06=>'fmDay, dd. Month yyyy'
,p_substitution_string_07=>'TIME_FORMAT'
,p_substitution_value_07=>'hh24:mi:ss'
,p_substitution_string_08=>'DATE_TIME_FORMAT'
,p_substitution_value_08=>'dd.mm.rr hh24:mi:ss'
,p_substitution_string_09=>'RETURN_TO_APPLICATION'
,p_substitution_value_09=>unistr('Zur\00FCck zu Anwendung')
,p_substitution_string_10=>'MSG_LANGUAGE'
,p_substitution_value_10=>'Sprache'
,p_substitution_string_11=>'PRODUCT_TYPE'
,p_substitution_value_11=>'Workspace anfordern'
,p_substitution_string_12=>'MSG_COPYRIGHT'
,p_substitution_value_12=>'Copyright &copy; 1999, 2024, Oracle und/oder verbundene Unternehmen.'
,p_substitution_string_13=>'MSG_JSCRIPT'
,p_substitution_value_13=>unistr('Wenn Sie dieses Produkt ausf\00FChren, muss JavaScript aktiviert sein.')
,p_substitution_string_14=>'MSG_WORKSPACE'
,p_substitution_value_14=>'Workspace'
,p_substitution_string_15=>'MSG_USER'
,p_substitution_value_15=>'Benutzer'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_version_scn=>2514416
,p_print_server_type=>'INSTANCE'
,p_file_storage=>'DB'
,p_is_pwa=>'N'
);
end;
/
prompt --application/user_interfaces
begin
wwv_flow_imp_shared.create_user_interface(
 p_id=>wwv_flow_imp.id(4703)
,p_theme_id=>3
,p_home_url=>'f?p=4700:2:&SESSION.'
,p_login_url=>'f?p=4550:1:&SESSION.'
,p_theme_style_by_user_pref=>false
,p_global_page_id=>.4703
,p_nav_list_template_options=>'#DEFAULT#'
,p_include_legacy_javascript=>'PRE18:18'
,p_nav_bar_type=>'NAVBAR'
,p_nav_bar_template_options=>'#DEFAULT#'
);
end;
/
prompt --application/shared_components/navigation/lists/provisionnewservice
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(4762183464.4703)
,p_name=>'ProvisionNewService'
,p_list_status=>'PUBLIC'
,p_version_scn=>75557994
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(4770195076.4703)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'ID'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(4836827003.4703)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Schema'
,p_list_item_link_target=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.::::'
,p_list_item_disp_cond_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_list_item_disp_condition=>'SHOW_SCHEMA_YN'
,p_list_item_disp_condition2=>'Y'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'25,26,40'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(25699022299795195.4703)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Umfrage'
,p_list_item_link_target=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.::::'
,p_list_item_disp_cond_type=>'EXISTS'
,p_list_item_disp_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where nvl(SURVEY_ENABLED_YN,''N'') = ''Y'' and id = 1'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(109218886058.4703)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>unistr('Begr\00FCndung')
,p_list_item_link_target=>'f?p=&APP_ID.:27:&SESSION.::&DEBUG.::::'
,p_list_item_disp_cond_type=>'EXISTS'
,p_list_item_disp_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where nvl(JUSTIFICATION_REQUIRED_YN,''Y'') = ''Y'''
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'27'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(80382420312008140.4703)
,p_list_item_display_sequence=>65
,p_list_item_link_text=>'Vereinbarung'
,p_list_item_link_target=>'f?p=&APP_ID.:28:&SESSION.::&DEBUG.::::'
,p_list_item_disp_cond_type=>'EXISTS'
,p_list_item_disp_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where nvl(AGREEMENT_ENABLED_YN,''N'') = ''Y'' and id = 1'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(4764187459.4703)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>unistr('Best\00E4tigung')
,p_list_item_link_target=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'30,3'
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
 p_id=>wwv_flow_imp.id(925952726466721.4703)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'default_icon', 'fa-star',
  'tooltip', '#VALUE#')).to_clob
,p_version_scn=>7007818
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1297112882451329.4703)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SELECT_MANY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_values_as', 'separated')).to_clob
,p_version_scn=>7007816
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1303143975778395.4703)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'NATIVE_OPEN_AI_ASSISTANT'
,p_version_scn=>16259647
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1327407257185562.4703)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_BOSS'
,p_version_scn=>243439631
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(3216298345137227.4703)
,p_plugin_type=>'PROCESS TYPE'
,p_plugin=>'NATIVE_GEOCODING'
,p_attribute_01=>'RELAX_HOUSE_NUMBER'
,p_version_scn=>117643222
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(14848914952940932.4703)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_style', 'SWITCH_CB',
  'off_value', 'N',
  'on_value', 'Y')).to_clob
,p_version_scn=>6539585
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(99821530050888928.4703)
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
 p_id=>wwv_flow_imp.id(118451238301833015.4703)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_MAP_REGION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_vector_tile_layers', 'Y')).to_clob
,p_version_scn=>1088662546
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(123182871270478451.4703)
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
 p_id=>wwv_flow_imp.id(124362535886989292.4703)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_ADFBC'
,p_version_scn=>37165931336888
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(176118302419506807.4703)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N')).to_clob
,p_version_scn=>7007823
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1765072946679712055.4703)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'include_slider', 'N')).to_clob
,p_version_scn=>1088662546
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1831722819976993878.4703)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'actions_menu_structure', 'IG')).to_clob
,p_version_scn=>1088662546
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1917634925946939898.4703)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'mode', 'FULL')).to_clob
,p_version_scn=>7007824
);
end;
/
prompt --application/shared_components/security/authorizations/sso_authentication
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(116607181908334943.4703)
,p_name=>'SSO authentication'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return wwv_flow_authentication_dev.get_internal_authentication not in (''APEX'',''CLOUD_IDM'',''LDAP'',''DB'');'
,p_error_message=>'Builder-SSO ist nicht aktiviert'
,p_version_scn=>2609965
,p_caching=>'BY_USER_BY_SESSION'
);
end;
/
prompt --application/shared_components/security/authorizations/workspace_requests_enabled
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(510672326686703270.4703)
,p_name=>'Workspace Requests Enabled'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if nvl(wwv_flow_platform.get_preference(''SERVICE_REQUEST_FLOW''),''MANUAL'') in (''EMAIL'',''4700'', ''AUTO'') then',
'    return TRUE;',
'else',
'    return FALSE;',
'end if;'))
,p_error_message=>'Workspace-Anforderungen sind nicht aktiviert.'
,p_version_scn=>2609965
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/security/authorizations/display_usage_info_questions
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(825492061062393977.4703)
,p_name=>'Display Usage Info Questions'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if coalesce( wwv_flow_platform.get_preference(''WS_REQUEST_USAGE_Q''), ''N'' ) = ''Y'' then',
'    return true;',
'else',
'    return false;',
'end if;'))
,p_error_message=>'Anzeige von Fragen zu Verwendungsinformationen nicht aktiviert.'
,p_version_scn=>2609965
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
null;
end;
/
prompt --application/shared_components/logic/application_items/a1
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(25713507070566709.4703)
,p_name=>'A1'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/a10
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(25715301313574483.4703)
,p_name=>'A10'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/a2
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(25713709840567432.4703)
,p_name=>'A2'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/a3
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(25713912264568155.4703)
,p_name=>'A3'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/a4
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(25714115727569121.4703)
,p_name=>'A4'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/a5
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(25714319190570197.4703)
,p_name=>'A5'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/a6
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(25714521961570954.4703)
,p_name=>'A6'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/a7
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(25714725078571880.4703)
,p_name=>'A7'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/a8
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(25714927155572445.4703)
,p_name=>'A8'
,p_protection_level=>'N'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/a9
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(25715129580573146.4703)
,p_name=>'A9'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/agreement_accepted
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(144047527689955702.4703)
,p_name=>'AGREEMENT_ACCEPTED'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/f4700_req_new_schema
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(103247625354177724.4703)
,p_name=>'F4700_REQ_NEW_SCHEMA'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/help_page
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(318946157429.4703)
,p_name=>'HELP_PAGE'
,p_escape_on_http_output=>'N'
,p_item_comment=>'flow page that you would like help for.'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/login_message
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(8584002656832123.4703)
,p_name=>'LOGIN_MESSAGE'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/lov_1
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(25782509996254728.4703)
,p_name=>'LOV_1'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/lov_10
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(25794005175480492.4703)
,p_name=>'LOV_10'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/lov_2
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(25792324437476584.4703)
,p_name=>'LOV_2'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/lov_3
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(25792625823477001.4703)
,p_name=>'LOV_3'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/lov_4
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(25792827554477507.4703)
,p_name=>'LOV_4'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/lov_5
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(25793029286478012.4703)
,p_name=>'LOV_5'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/lov_6
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(25793231017478467.4703)
,p_name=>'LOV_6'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/lov_7
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(25793400327479065.4703)
,p_name=>'LOV_7'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/lov_8
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(25793602058479541.4703)
,p_name=>'LOV_8'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/lov_9
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(25793803790480026.4703)
,p_name=>'LOV_9'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/pages_visited
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(8632704676428693.4703)
,p_name=>'PAGES_VISITED'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/q1
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(25700525687890714.4703)
,p_name=>'Q1'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/q10
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(25702323047899430.4703)
,p_name=>'Q10'
,p_protection_level=>'N'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/q2
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(25700729496891839.4703)
,p_name=>'Q2'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/q3
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(25700931920892551.4703)
,p_name=>'Q3'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/q4
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(25701102269893436.4703)
,p_name=>'Q4'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/q5
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(25701305386894398.4703)
,p_name=>'Q5'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/q6
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(25701515775897352.4703)
,p_name=>'Q6'
,p_protection_level=>'N'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/q7
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(25701717506897886.4703)
,p_name=>'Q7'
,p_protection_level=>'N'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/q8
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(25701919238898391.4703)
,p_name=>'Q8'
,p_protection_level=>'N'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/q9
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(25702120970898892.4703)
,p_name=>'Q9'
,p_protection_level=>'N'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/show_schema_yn
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(70976882659217226.4703)
,p_name=>'SHOW_SCHEMA_YN'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_computations/pages_visited
begin
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(8650202046513064.4703)
,p_computation_sequence=>1
,p_computation_item=>'PAGES_VISITED'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if instr(:PAGES_VISITED,'':''||wwv_flow.g_flow_step_id) > 0 then',
'   return :PAGES_VISITED;',
'else',
'   return :PAGES_VISITED||'':''||wwv_flow.g_flow_step_id;',
'end if;'))
,p_version_scn=>37165770887460
);
end;
/
prompt --application/shared_components/logic/application_computations/show_schema_yn
begin
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(70977000257223302.4703)
,p_computation_sequence=>10
,p_computation_item=>'SHOW_SCHEMA_YN'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'select show_schema_yn from wwv_flow_prov_signup_q'
,p_version_scn=>37165770887460
);
end;
/
prompt --application/shared_components/logic/application_computations/f4700_req_new_schema
begin
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(103248202067189926.4703)
,p_computation_sequence=>10
,p_computation_item=>'F4700_REQ_NEW_SCHEMA'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'wwv_flow_platform.get_preference(''REQ_NEW_SCHEMA'')'
,p_compute_when=>'nvl(wwv_flow_platform.get_preference(''SERVICE_REQUEST_FLOW''),''MANUAL'') <> ''MANUAL'''
,p_compute_when_text=>'PLSQL'
,p_compute_when_type=>'EXPRESSION'
,p_version_scn=>37165770887460
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
null;
end;
/
prompt --application/shared_components/navigation/tabs/parent
begin
wwv_flow_imp_shared.create_toplevel_tab(
 p_id=>wwv_flow_imp.id(11450003334894502.4703)
,p_tab_set=>'TOP'
,p_tab_sequence=>20
,p_tab_name=>'T_TOP'
,p_tab_text=>'&PRODUCT_NAME.'
,p_tab_target=>'f?p=4700:10:&SESSION.:'
,p_current_on_tabset=>'HOME'
);
end;
/
prompt --application/shared_components/user_interface/lovs/countries
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(823478261872577596.4703)
,p_lov_name=>'COUNTRIES'
,p_lov_query=>'.'||wwv_flow_imp.id(823478261872577596)||'.'
,p_location=>'STATIC'
,p_version_scn=>75558000
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(823478579527577599.4703)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Afghanistan'
,p_lov_return_value=>'AFG'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824143289933039249.4703)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Albanien'
,p_lov_return_value=>'ALB'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824143661180039254.4703)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Algerien'
,p_lov_return_value=>'DZA'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824144090492039259.4703)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Amerikanisch-Samoa'
,p_lov_return_value=>'ASM'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824144465808039263.4703)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'Andorra'
,p_lov_return_value=>'AND'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824144840858039268.4703)
,p_lov_disp_sequence=>6
,p_lov_disp_value=>'Angola'
,p_lov_return_value=>'AGO'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824145206949039273.4703)
,p_lov_disp_sequence=>7
,p_lov_disp_value=>'Anguilla'
,p_lov_return_value=>'AIA'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824145537327039278.4703)
,p_lov_disp_sequence=>8
,p_lov_disp_value=>'Antarktis'
,p_lov_return_value=>'ATA'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824145913938039283.4703)
,p_lov_disp_sequence=>9
,p_lov_disp_value=>'Antigua und Barbuda'
,p_lov_return_value=>'ATG'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824146303479039287.4703)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Argentinien'
,p_lov_return_value=>'ARG'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824146767443039292.4703)
,p_lov_disp_sequence=>11
,p_lov_disp_value=>'Armenien'
,p_lov_return_value=>'ARM'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824147194532039297.4703)
,p_lov_disp_sequence=>12
,p_lov_disp_value=>'Aruba'
,p_lov_return_value=>'ABW'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824147548141039302.4703)
,p_lov_disp_sequence=>13
,p_lov_disp_value=>'Australien'
,p_lov_return_value=>'AUS'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824147941823039307.4703)
,p_lov_disp_sequence=>14
,p_lov_disp_value=>unistr('\00D6sterreich')
,p_lov_return_value=>'AUT'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824148385733039312.4703)
,p_lov_disp_sequence=>15
,p_lov_disp_value=>'Aserbaidschan'
,p_lov_return_value=>'AZE'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824148758358039316.4703)
,p_lov_disp_sequence=>16
,p_lov_disp_value=>'Bahamas'
,p_lov_return_value=>'BHS'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824149199217039322.4703)
,p_lov_disp_sequence=>17
,p_lov_disp_value=>'Bahrain'
,p_lov_return_value=>'BHR'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824149507221039326.4703)
,p_lov_disp_sequence=>18
,p_lov_disp_value=>'Bangladesch'
,p_lov_return_value=>'BGD'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824149927526039331.4703)
,p_lov_disp_sequence=>19
,p_lov_disp_value=>'Barbados'
,p_lov_return_value=>'BRB'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824150360126039336.4703)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Belarus'
,p_lov_return_value=>'BLR'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824150773820039341.4703)
,p_lov_disp_sequence=>21
,p_lov_disp_value=>'Belgien'
,p_lov_return_value=>'BEL'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824151102399039345.4703)
,p_lov_disp_sequence=>22
,p_lov_disp_value=>'Belize'
,p_lov_return_value=>'BLZ'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824151574155039350.4703)
,p_lov_disp_sequence=>23
,p_lov_disp_value=>'Benin'
,p_lov_return_value=>'BEN'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824151987035039355.4703)
,p_lov_disp_sequence=>24
,p_lov_disp_value=>'Bermuda'
,p_lov_return_value=>'BMU'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824152325866039360.4703)
,p_lov_disp_sequence=>25
,p_lov_disp_value=>'Bhutan'
,p_lov_return_value=>'BTN'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824152787845039365.4703)
,p_lov_disp_sequence=>26
,p_lov_disp_value=>'Bolivien (Plurinationaler Staat)'
,p_lov_return_value=>'BOL'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824153167556039370.4703)
,p_lov_disp_sequence=>27
,p_lov_disp_value=>'Bonaire, Sint Eustatius und Saba'
,p_lov_return_value=>'BES'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824153561740039375.4703)
,p_lov_disp_sequence=>28
,p_lov_disp_value=>'Bosnien und Herzegowina'
,p_lov_return_value=>'BIH'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824154021065039379.4703)
,p_lov_disp_sequence=>29
,p_lov_disp_value=>'Botswana'
,p_lov_return_value=>'BWA'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824154759578039384.4703)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'Bouvetinsel'
,p_lov_return_value=>'BVT'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824155184809039389.4703)
,p_lov_disp_sequence=>31
,p_lov_disp_value=>'Brasilien'
,p_lov_return_value=>'BRA'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824155531817039394.4703)
,p_lov_disp_sequence=>32
,p_lov_disp_value=>'Britisches Territorium im Indischen Ozean'
,p_lov_return_value=>'IOT'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824155917819039400.4703)
,p_lov_disp_sequence=>33
,p_lov_disp_value=>'Brunei Darussalam'
,p_lov_return_value=>'BRN'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824156356286039404.4703)
,p_lov_disp_sequence=>34
,p_lov_disp_value=>'Bulgarien'
,p_lov_return_value=>'BGR'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824156744089039409.4703)
,p_lov_disp_sequence=>35
,p_lov_disp_value=>'Burkina Faso'
,p_lov_return_value=>'BFA'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824157113717039414.4703)
,p_lov_disp_sequence=>36
,p_lov_disp_value=>'Burundi'
,p_lov_return_value=>'BDI'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824157569621039419.4703)
,p_lov_disp_sequence=>37
,p_lov_disp_value=>'Kap Verde'
,p_lov_return_value=>'CPV'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824157985211039424.4703)
,p_lov_disp_sequence=>38
,p_lov_disp_value=>'Kambodscha'
,p_lov_return_value=>'KHM'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824158324108039429.4703)
,p_lov_disp_sequence=>39
,p_lov_disp_value=>'Kamerun'
,p_lov_return_value=>'CMR'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824158766990039434.4703)
,p_lov_disp_sequence=>40
,p_lov_disp_value=>'Kanada'
,p_lov_return_value=>'CAN'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824159117308039438.4703)
,p_lov_disp_sequence=>41
,p_lov_disp_value=>'Kaimaninseln'
,p_lov_return_value=>'CYM'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824159592937039443.4703)
,p_lov_disp_sequence=>42
,p_lov_disp_value=>'Zentralafrikanische Republik'
,p_lov_return_value=>'CAF'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824159964540039448.4703)
,p_lov_disp_sequence=>43
,p_lov_disp_value=>'Tschad'
,p_lov_return_value=>'TCD'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824160345441039453.4703)
,p_lov_disp_sequence=>44
,p_lov_disp_value=>'Chile'
,p_lov_return_value=>'CHL'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824160755378039457.4703)
,p_lov_disp_sequence=>45
,p_lov_disp_value=>'China'
,p_lov_return_value=>'CHN'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824161181568039462.4703)
,p_lov_disp_sequence=>46
,p_lov_disp_value=>'Weihnachtsinsel'
,p_lov_return_value=>'CXR'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824161513302039467.4703)
,p_lov_disp_sequence=>47
,p_lov_disp_value=>'Kokosinseln (Keeling)'
,p_lov_return_value=>'CCK'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824161976195039472.4703)
,p_lov_disp_sequence=>48
,p_lov_disp_value=>'Kolumbien'
,p_lov_return_value=>'COL'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824162318849039477.4703)
,p_lov_disp_sequence=>49
,p_lov_disp_value=>'Komoren'
,p_lov_return_value=>'COM'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824162659027039482.4703)
,p_lov_disp_sequence=>50
,p_lov_disp_value=>'Kongo'
,p_lov_return_value=>'COG'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824163068869039487.4703)
,p_lov_disp_sequence=>51
,p_lov_disp_value=>'Kongo, Demokratische Republik'
,p_lov_return_value=>'COD'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824163467630039492.4703)
,p_lov_disp_sequence=>52
,p_lov_disp_value=>'Cookinseln'
,p_lov_return_value=>'COK'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824163859361039497.4703)
,p_lov_disp_sequence=>53
,p_lov_disp_value=>'Costa Rica'
,p_lov_return_value=>'CRI'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824164207335039502.4703)
,p_lov_disp_sequence=>54
,p_lov_disp_value=>'Kroatien'
,p_lov_return_value=>'HRV'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824164608813039507.4703)
,p_lov_disp_sequence=>55
,p_lov_disp_value=>'Kuba'
,p_lov_return_value=>'CUB'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824165091155039511.4703)
,p_lov_disp_sequence=>56
,p_lov_disp_value=>unistr('Cura\00E7ao')
,p_lov_return_value=>'CUW'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824165452808039517.4703)
,p_lov_disp_sequence=>57
,p_lov_disp_value=>'Zypern'
,p_lov_return_value=>'CYP'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824165810913039521.4703)
,p_lov_disp_sequence=>58
,p_lov_disp_value=>'Tschechien'
,p_lov_return_value=>'CZE'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824166275284039526.4703)
,p_lov_disp_sequence=>59
,p_lov_disp_value=>unistr('Elfenbeink\00FCste')
,p_lov_return_value=>'CIV'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824166649759039531.4703)
,p_lov_disp_sequence=>60
,p_lov_disp_value=>unistr('D\00E4nemark')
,p_lov_return_value=>'DNK'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824167091955039536.4703)
,p_lov_disp_sequence=>61
,p_lov_disp_value=>'Dschibuti'
,p_lov_return_value=>'DJI'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824167432207039540.4703)
,p_lov_disp_sequence=>62
,p_lov_disp_value=>'Dominica'
,p_lov_return_value=>'DMA'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824167874106039545.4703)
,p_lov_disp_sequence=>63
,p_lov_disp_value=>'Dominikanische Republik'
,p_lov_return_value=>'DOM'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824168240526039550.4703)
,p_lov_disp_sequence=>64
,p_lov_disp_value=>'Ecuador'
,p_lov_return_value=>'ECU'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824168658094039555.4703)
,p_lov_disp_sequence=>65
,p_lov_disp_value=>unistr('\00C4gypten')
,p_lov_return_value=>'EGY'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824169018249039559.4703)
,p_lov_disp_sequence=>66
,p_lov_disp_value=>'El Salvador'
,p_lov_return_value=>'SLV'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824169470333039564.4703)
,p_lov_disp_sequence=>67
,p_lov_disp_value=>unistr('\00C4quatorialguinea')
,p_lov_return_value=>'GNQ'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824169852776039569.4703)
,p_lov_disp_sequence=>68
,p_lov_disp_value=>'Eritrea'
,p_lov_return_value=>'ERI'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824170241369039576.4703)
,p_lov_disp_sequence=>69
,p_lov_disp_value=>'Estland'
,p_lov_return_value=>'EST'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824170556111039580.4703)
,p_lov_disp_sequence=>70
,p_lov_disp_value=>'Eswatini'
,p_lov_return_value=>'SWZ'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824170935274039585.4703)
,p_lov_disp_sequence=>71
,p_lov_disp_value=>unistr('\00C4thiopien')
,p_lov_return_value=>'ETH'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824171301854039590.4703)
,p_lov_disp_sequence=>72
,p_lov_disp_value=>'Falklandinseln (Malwinen)'
,p_lov_return_value=>'FLK'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824171769336039595.4703)
,p_lov_disp_sequence=>73
,p_lov_disp_value=>unistr('F\00E4r\00F6er')
,p_lov_return_value=>'FRO'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824172115476039599.4703)
,p_lov_disp_sequence=>74
,p_lov_disp_value=>'Fidschi'
,p_lov_return_value=>'FJI'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824172506566039604.4703)
,p_lov_disp_sequence=>75
,p_lov_disp_value=>'Finnland'
,p_lov_return_value=>'FIN'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824172964667039609.4703)
,p_lov_disp_sequence=>76
,p_lov_disp_value=>'Frankreich'
,p_lov_return_value=>'FRA'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824173333310039614.4703)
,p_lov_disp_sequence=>77
,p_lov_disp_value=>unistr('Franz\00F6sisch-Guayana')
,p_lov_return_value=>'GUF'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824173722536039619.4703)
,p_lov_disp_sequence=>78
,p_lov_disp_value=>unistr('Franz\00F6sisch-Polynesien')
,p_lov_return_value=>'PYF'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824174127989039624.4703)
,p_lov_disp_sequence=>79
,p_lov_disp_value=>unistr('Franz\00F6sische S\00FCdgebiete')
,p_lov_return_value=>'ATF'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824174509650039629.4703)
,p_lov_disp_sequence=>80
,p_lov_disp_value=>'Gabun'
,p_lov_return_value=>'GAB'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824174933703039634.4703)
,p_lov_disp_sequence=>81
,p_lov_disp_value=>'Gambia'
,p_lov_return_value=>'GMB'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824175371819039638.4703)
,p_lov_disp_sequence=>82
,p_lov_disp_value=>'Georgien'
,p_lov_return_value=>'GEO'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824175797087039643.4703)
,p_lov_disp_sequence=>83
,p_lov_disp_value=>'Deutschland'
,p_lov_return_value=>'DEU'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824176105610039648.4703)
,p_lov_disp_sequence=>84
,p_lov_disp_value=>'Ghana'
,p_lov_return_value=>'GHA'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824176557598039652.4703)
,p_lov_disp_sequence=>85
,p_lov_disp_value=>'Gibraltar'
,p_lov_return_value=>'GIB'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824176939297039657.4703)
,p_lov_disp_sequence=>86
,p_lov_disp_value=>'Griechenland'
,p_lov_return_value=>'GRC'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824177324405039662.4703)
,p_lov_disp_sequence=>87
,p_lov_disp_value=>unistr('Gr\00F6nland')
,p_lov_return_value=>'GRL'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824177704043039667.4703)
,p_lov_disp_sequence=>88
,p_lov_disp_value=>'Grenada'
,p_lov_return_value=>'GRD'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824178145529039672.4703)
,p_lov_disp_sequence=>89
,p_lov_disp_value=>'Guadeloupe'
,p_lov_return_value=>'GLP'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824178557303039677.4703)
,p_lov_disp_sequence=>90
,p_lov_disp_value=>'Guam'
,p_lov_return_value=>'GUM'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824178897828039682.4703)
,p_lov_disp_sequence=>91
,p_lov_disp_value=>'Guatemala'
,p_lov_return_value=>'GTM'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824179214159039686.4703)
,p_lov_disp_sequence=>92
,p_lov_disp_value=>'Guernsey'
,p_lov_return_value=>'GGY'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824179699484039691.4703)
,p_lov_disp_sequence=>93
,p_lov_disp_value=>'Guinea'
,p_lov_return_value=>'GIN'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824180062358039696.4703)
,p_lov_disp_sequence=>94
,p_lov_disp_value=>'Guinea-Bissau'
,p_lov_return_value=>'GNB'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824180406269039701.4703)
,p_lov_disp_sequence=>95
,p_lov_disp_value=>'Guyana'
,p_lov_return_value=>'GUY'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824180839883039705.4703)
,p_lov_disp_sequence=>96
,p_lov_disp_value=>'Haiti'
,p_lov_return_value=>'HTI'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824181202939039710.4703)
,p_lov_disp_sequence=>97
,p_lov_disp_value=>'Heard- und McDonaldinseln'
,p_lov_return_value=>'HMD'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824181650040039715.4703)
,p_lov_disp_sequence=>98
,p_lov_disp_value=>'Heiliger Stuhl (Vatikanstadt)'
,p_lov_return_value=>'VAT'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824182018552039720.4703)
,p_lov_disp_sequence=>99
,p_lov_disp_value=>'Honduras'
,p_lov_return_value=>'HND'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824182486368039725.4703)
,p_lov_disp_sequence=>100
,p_lov_disp_value=>'Hongkong'
,p_lov_return_value=>'HKG'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824182815248039730.4703)
,p_lov_disp_sequence=>101
,p_lov_disp_value=>'Ungarn'
,p_lov_return_value=>'HUN'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824183270757039734.4703)
,p_lov_disp_sequence=>102
,p_lov_disp_value=>'Island'
,p_lov_return_value=>'ISL'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824183653975039739.4703)
,p_lov_disp_sequence=>103
,p_lov_disp_value=>'Indien'
,p_lov_return_value=>'IND'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824184097465039744.4703)
,p_lov_disp_sequence=>104
,p_lov_disp_value=>'Indonesien'
,p_lov_return_value=>'IDN'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824184440467039748.4703)
,p_lov_disp_sequence=>105
,p_lov_disp_value=>'Iran (Islamische Republik)'
,p_lov_return_value=>'IRN'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824184895912039753.4703)
,p_lov_disp_sequence=>106
,p_lov_disp_value=>'Irak'
,p_lov_return_value=>'IRQ'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824185254165039758.4703)
,p_lov_disp_sequence=>107
,p_lov_disp_value=>'Irland'
,p_lov_return_value=>'IRL'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824185658713039762.4703)
,p_lov_disp_sequence=>108
,p_lov_disp_value=>'Isle of Man'
,p_lov_return_value=>'IMN'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824186050349039767.4703)
,p_lov_disp_sequence=>109
,p_lov_disp_value=>'Israel'
,p_lov_return_value=>'ISR'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824186421362039772.4703)
,p_lov_disp_sequence=>110
,p_lov_disp_value=>'Italien'
,p_lov_return_value=>'ITA'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824186841443039777.4703)
,p_lov_disp_sequence=>111
,p_lov_disp_value=>'Jamaika'
,p_lov_return_value=>'JAM'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824187167656039782.4703)
,p_lov_disp_sequence=>112
,p_lov_disp_value=>'Japan'
,p_lov_return_value=>'JPN'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824187582112039787.4703)
,p_lov_disp_sequence=>113
,p_lov_disp_value=>'Jersey'
,p_lov_return_value=>'JEY'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824187938400039792.4703)
,p_lov_disp_sequence=>114
,p_lov_disp_value=>'Jordanien'
,p_lov_return_value=>'JOR'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824188398508039796.4703)
,p_lov_disp_sequence=>115
,p_lov_disp_value=>'Kasachstan'
,p_lov_return_value=>'KAZ'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824188767332039801.4703)
,p_lov_disp_sequence=>116
,p_lov_disp_value=>'Kenia'
,p_lov_return_value=>'KEN'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824189189188039806.4703)
,p_lov_disp_sequence=>117
,p_lov_disp_value=>'Kiribati'
,p_lov_return_value=>'KIR'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824189521667039811.4703)
,p_lov_disp_sequence=>118
,p_lov_disp_value=>'Kuwait'
,p_lov_return_value=>'KWT'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824189902733039815.4703)
,p_lov_disp_sequence=>119
,p_lov_disp_value=>'Kirgisistan'
,p_lov_return_value=>'KGZ'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824190399290039821.4703)
,p_lov_disp_sequence=>120
,p_lov_disp_value=>'Demokratische Volksrepublik Laos'
,p_lov_return_value=>'LAO'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824190796580039826.4703)
,p_lov_disp_sequence=>121
,p_lov_disp_value=>'Lettland'
,p_lov_return_value=>'LVA'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824191126746039830.4703)
,p_lov_disp_sequence=>122
,p_lov_disp_value=>'Libanon'
,p_lov_return_value=>'LBN'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824191505534039835.4703)
,p_lov_disp_sequence=>123
,p_lov_disp_value=>'Lesotho'
,p_lov_return_value=>'LSO'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824191995602039840.4703)
,p_lov_disp_sequence=>124
,p_lov_disp_value=>'Liberia'
,p_lov_return_value=>'LBR'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824192339533039845.4703)
,p_lov_disp_sequence=>125
,p_lov_disp_value=>'Libyen'
,p_lov_return_value=>'LBY'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824192750154039849.4703)
,p_lov_disp_sequence=>126
,p_lov_disp_value=>'Liechtenstein'
,p_lov_return_value=>'LIE'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824193192147039854.4703)
,p_lov_disp_sequence=>127
,p_lov_disp_value=>'Litauen'
,p_lov_return_value=>'LTU'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824193542324039859.4703)
,p_lov_disp_sequence=>128
,p_lov_disp_value=>'Luxemburg'
,p_lov_return_value=>'LUX'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824193976386039863.4703)
,p_lov_disp_sequence=>129
,p_lov_disp_value=>'Macao'
,p_lov_return_value=>'MAC'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824194385416039868.4703)
,p_lov_disp_sequence=>130
,p_lov_disp_value=>'Madagaskar'
,p_lov_return_value=>'MDG'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824194754466039874.4703)
,p_lov_disp_sequence=>131
,p_lov_disp_value=>'Malawi'
,p_lov_return_value=>'MWI'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824195061916039878.4703)
,p_lov_disp_sequence=>132
,p_lov_disp_value=>'Malaysia'
,p_lov_return_value=>'MYS'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824195458252039883.4703)
,p_lov_disp_sequence=>133
,p_lov_disp_value=>'Malediven'
,p_lov_return_value=>'MDV'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824195826525039888.4703)
,p_lov_disp_sequence=>134
,p_lov_disp_value=>'Mali'
,p_lov_return_value=>'MLI'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824196286157039893.4703)
,p_lov_disp_sequence=>135
,p_lov_disp_value=>'Malta'
,p_lov_return_value=>'MLT'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824196692891039898.4703)
,p_lov_disp_sequence=>136
,p_lov_disp_value=>'Marshallinseln'
,p_lov_return_value=>'MHL'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824197043836039902.4703)
,p_lov_disp_sequence=>137
,p_lov_disp_value=>'Martinique'
,p_lov_return_value=>'MTQ'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824197462014039907.4703)
,p_lov_disp_sequence=>138
,p_lov_disp_value=>'Mauretanien'
,p_lov_return_value=>'MRT'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824197868846039912.4703)
,p_lov_disp_sequence=>139
,p_lov_disp_value=>'Mauritius'
,p_lov_return_value=>'MUS'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824198222840039917.4703)
,p_lov_disp_sequence=>140
,p_lov_disp_value=>'Mayotte'
,p_lov_return_value=>'MYT'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824198626928039921.4703)
,p_lov_disp_sequence=>141
,p_lov_disp_value=>'Mexiko'
,p_lov_return_value=>'MEX'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824199026329039927.4703)
,p_lov_disp_sequence=>142
,p_lov_disp_value=>unistr('Mikronesien (F\00F6derierte Staaten)')
,p_lov_return_value=>'FSM'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824199454247039932.4703)
,p_lov_disp_sequence=>143
,p_lov_disp_value=>'Moldau, Repulik'
,p_lov_return_value=>'MDA'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824199861141039936.4703)
,p_lov_disp_sequence=>144
,p_lov_disp_value=>'Monaco'
,p_lov_return_value=>'MCO'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824200247174039941.4703)
,p_lov_disp_sequence=>145
,p_lov_disp_value=>'Mongolei'
,p_lov_return_value=>'MNG'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824200620797039946.4703)
,p_lov_disp_sequence=>146
,p_lov_disp_value=>'Montenegro'
,p_lov_return_value=>'MNE'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824201056397039951.4703)
,p_lov_disp_sequence=>147
,p_lov_disp_value=>'Montserrat'
,p_lov_return_value=>'MSR'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824201436210039956.4703)
,p_lov_disp_sequence=>148
,p_lov_disp_value=>'Marokko'
,p_lov_return_value=>'MAR'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824201856487039960.4703)
,p_lov_disp_sequence=>149
,p_lov_disp_value=>'Mosambik'
,p_lov_return_value=>'MOZ'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824202242934039965.4703)
,p_lov_disp_sequence=>150
,p_lov_disp_value=>'Myanmar'
,p_lov_return_value=>'MMR'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824202662131039970.4703)
,p_lov_disp_sequence=>151
,p_lov_disp_value=>'Namibia'
,p_lov_return_value=>'NAM'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824203014160039975.4703)
,p_lov_disp_sequence=>152
,p_lov_disp_value=>'Nauru'
,p_lov_return_value=>'NRU'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824203352960039980.4703)
,p_lov_disp_sequence=>153
,p_lov_disp_value=>'Nepal'
,p_lov_return_value=>'NPL'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824203760226039985.4703)
,p_lov_disp_sequence=>154
,p_lov_disp_value=>'Niederlande'
,p_lov_return_value=>'NLD'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824204154757039990.4703)
,p_lov_disp_sequence=>155
,p_lov_disp_value=>'Neukaledonien'
,p_lov_return_value=>'NCL'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824204517683039995.4703)
,p_lov_disp_sequence=>156
,p_lov_disp_value=>'Neuseeland'
,p_lov_return_value=>'NZL'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824204959877040000.4703)
,p_lov_disp_sequence=>157
,p_lov_disp_value=>'Nicaragua'
,p_lov_return_value=>'NIC'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824205348746040005.4703)
,p_lov_disp_sequence=>158
,p_lov_disp_value=>'Niger'
,p_lov_return_value=>'NER'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824205748763040009.4703)
,p_lov_disp_sequence=>159
,p_lov_disp_value=>'Nigeria'
,p_lov_return_value=>'NGA'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824206167179040014.4703)
,p_lov_disp_sequence=>160
,p_lov_disp_value=>'Niue'
,p_lov_return_value=>'NIU'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824206565429040019.4703)
,p_lov_disp_sequence=>161
,p_lov_disp_value=>'Norfolkinsel'
,p_lov_return_value=>'NFK'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824206943433040024.4703)
,p_lov_disp_sequence=>162
,p_lov_disp_value=>'Nordkorea (Demokratische Volksrepublik)'
,p_lov_return_value=>'PRK'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824207387143040028.4703)
,p_lov_disp_sequence=>163
,p_lov_disp_value=>'Nordmazedonien'
,p_lov_return_value=>'MKD'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824207783126040033.4703)
,p_lov_disp_sequence=>164
,p_lov_disp_value=>unistr('N\00F6rdliche Marianen')
,p_lov_return_value=>'MNP'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824208161555040038.4703)
,p_lov_disp_sequence=>165
,p_lov_disp_value=>'Norwegen'
,p_lov_return_value=>'NOR'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824208513033040043.4703)
,p_lov_disp_sequence=>166
,p_lov_disp_value=>'Oman'
,p_lov_return_value=>'OMN'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824208968260040048.4703)
,p_lov_disp_sequence=>167
,p_lov_disp_value=>'Pakistan'
,p_lov_return_value=>'PAK'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824209356965040052.4703)
,p_lov_disp_sequence=>168
,p_lov_disp_value=>'Palau'
,p_lov_return_value=>'PLW'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824209706547040057.4703)
,p_lov_disp_sequence=>169
,p_lov_disp_value=>unistr('Pal\00E4stina, Staat')
,p_lov_return_value=>'PSE'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824210135909040062.4703)
,p_lov_disp_sequence=>170
,p_lov_disp_value=>'Panama'
,p_lov_return_value=>'PAN'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824210508653040067.4703)
,p_lov_disp_sequence=>171
,p_lov_disp_value=>'Papua-Neuguinea'
,p_lov_return_value=>'PNG'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824210959245040071.4703)
,p_lov_disp_sequence=>172
,p_lov_disp_value=>'Paraguay'
,p_lov_return_value=>'PRY'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824211375561040076.4703)
,p_lov_disp_sequence=>173
,p_lov_disp_value=>'Peru'
,p_lov_return_value=>'PER'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824211667800040081.4703)
,p_lov_disp_sequence=>174
,p_lov_disp_value=>'Philippinen'
,p_lov_return_value=>'PHL'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824212017395040086.4703)
,p_lov_disp_sequence=>175
,p_lov_disp_value=>'Pitcairn'
,p_lov_return_value=>'PCN'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824212432128040091.4703)
,p_lov_disp_sequence=>176
,p_lov_disp_value=>'Polen'
,p_lov_return_value=>'POL'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824212892941040096.4703)
,p_lov_disp_sequence=>177
,p_lov_disp_value=>'Portugal'
,p_lov_return_value=>'PRT'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824213237691040101.4703)
,p_lov_disp_sequence=>178
,p_lov_disp_value=>'Puerto Rico'
,p_lov_return_value=>'PRI'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824213628322040105.4703)
,p_lov_disp_sequence=>179
,p_lov_disp_value=>'Katar'
,p_lov_return_value=>'QAT'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824214045494040110.4703)
,p_lov_disp_sequence=>180
,p_lov_disp_value=>unistr('Rum\00E4nien')
,p_lov_return_value=>'ROU'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824214477087040115.4703)
,p_lov_disp_sequence=>181
,p_lov_disp_value=>unistr('Russische F\00F6deration')
,p_lov_return_value=>'RUS'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824214828213040120.4703)
,p_lov_disp_sequence=>182
,p_lov_disp_value=>'Ruanda'
,p_lov_return_value=>'RWA'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824215282184040124.4703)
,p_lov_disp_sequence=>183
,p_lov_disp_value=>unistr('R\00E9union')
,p_lov_return_value=>'REU'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824215625743040129.4703)
,p_lov_disp_sequence=>184
,p_lov_disp_value=>unistr('St. Barth\00E9lemy')
,p_lov_return_value=>'BLM'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824216035692040134.4703)
,p_lov_disp_sequence=>185
,p_lov_disp_value=>'Sankt Helena, Ascension Island und Tristan da Cunha Archipel'
,p_lov_return_value=>'SHN'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824216419070040138.4703)
,p_lov_disp_sequence=>186
,p_lov_disp_value=>'St. Kitts und Nevis'
,p_lov_return_value=>'KNA'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824216890396040143.4703)
,p_lov_disp_sequence=>187
,p_lov_disp_value=>'St. Lucia'
,p_lov_return_value=>'LCA'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824217282638040149.4703)
,p_lov_disp_sequence=>188
,p_lov_disp_value=>unistr('Saint Martin (Franz\00F6sischer Teil)')
,p_lov_return_value=>'MAF'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824217628811040153.4703)
,p_lov_disp_sequence=>189
,p_lov_disp_value=>'St. Pierre und Miquelon'
,p_lov_return_value=>'SPM'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824218024054040158.4703)
,p_lov_disp_sequence=>190
,p_lov_disp_value=>'Saint Vincent und die Grenadinen'
,p_lov_return_value=>'VCT'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824218450726040163.4703)
,p_lov_disp_sequence=>191
,p_lov_disp_value=>'Samoa'
,p_lov_return_value=>'WSM'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824218890357040167.4703)
,p_lov_disp_sequence=>192
,p_lov_disp_value=>'San Marino'
,p_lov_return_value=>'SMR'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824219203141040172.4703)
,p_lov_disp_sequence=>193
,p_lov_disp_value=>unistr('S\00E3o Tom\00E9 und Pr\00EDncipe')
,p_lov_return_value=>'STP'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824219664100040177.4703)
,p_lov_disp_sequence=>194
,p_lov_disp_value=>'Saudi-Arabien'
,p_lov_return_value=>'SAU'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824219910146040182.4703)
,p_lov_disp_sequence=>195
,p_lov_disp_value=>'Senegal'
,p_lov_return_value=>'SEN'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824220335238040186.4703)
,p_lov_disp_sequence=>196
,p_lov_disp_value=>'Serbien'
,p_lov_return_value=>'SRB'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824220730515040191.4703)
,p_lov_disp_sequence=>197
,p_lov_disp_value=>'Seychellen'
,p_lov_return_value=>'SYC'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824221164669040195.4703)
,p_lov_disp_sequence=>198
,p_lov_disp_value=>'Sierra Leone'
,p_lov_return_value=>'SLE'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824221555171040200.4703)
,p_lov_disp_sequence=>199
,p_lov_disp_value=>'Singapur'
,p_lov_return_value=>'SGP'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824221979517040205.4703)
,p_lov_disp_sequence=>200
,p_lov_disp_value=>unistr('Sint Maarten (Niederl\00E4ndischer Teil)')
,p_lov_return_value=>'SXM'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824222343418040209.4703)
,p_lov_disp_sequence=>201
,p_lov_disp_value=>'Slowakei'
,p_lov_return_value=>'SVK'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824222742416040214.4703)
,p_lov_disp_sequence=>202
,p_lov_disp_value=>'Slowenien'
,p_lov_return_value=>'SVN'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824223178434040219.4703)
,p_lov_disp_sequence=>203
,p_lov_disp_value=>'Salomonen'
,p_lov_return_value=>'SLB'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824223529714040223.4703)
,p_lov_disp_sequence=>204
,p_lov_disp_value=>'Somalia'
,p_lov_return_value=>'SOM'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824223979093040228.4703)
,p_lov_disp_sequence=>205
,p_lov_disp_value=>unistr('S\00FCdafrika')
,p_lov_return_value=>'ZAF'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824224354986040232.4703)
,p_lov_disp_sequence=>206
,p_lov_disp_value=>unistr('S\00FCdgeorgien und die S\00FCdlichen Sandwichinseln')
,p_lov_return_value=>'SGS'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824224795028040237.4703)
,p_lov_disp_sequence=>207
,p_lov_disp_value=>unistr('S\00FCdkorea (Republik)')
,p_lov_return_value=>'KOR'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824225184295040241.4703)
,p_lov_disp_sequence=>208
,p_lov_disp_value=>unistr('S\00FCdsudan')
,p_lov_return_value=>'SSD'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824225597343040246.4703)
,p_lov_disp_sequence=>209
,p_lov_disp_value=>'Spanien'
,p_lov_return_value=>'ESP'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824225920869040250.4703)
,p_lov_disp_sequence=>210
,p_lov_disp_value=>'Sri Lanka'
,p_lov_return_value=>'LKA'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824226350700040255.4703)
,p_lov_disp_sequence=>211
,p_lov_disp_value=>'Sudan'
,p_lov_return_value=>'SDN'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824226760685040260.4703)
,p_lov_disp_sequence=>212
,p_lov_disp_value=>'Suriname'
,p_lov_return_value=>'SUR'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824227110257040264.4703)
,p_lov_disp_sequence=>213
,p_lov_disp_value=>'Svalbard und Jan Mayen'
,p_lov_return_value=>'SJM'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824227559092040269.4703)
,p_lov_disp_sequence=>214
,p_lov_disp_value=>'Schweden'
,p_lov_return_value=>'SWE'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824227981168040274.4703)
,p_lov_disp_sequence=>215
,p_lov_disp_value=>'Schweiz'
,p_lov_return_value=>'CHE'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824228267412040279.4703)
,p_lov_disp_sequence=>216
,p_lov_disp_value=>'Syrien, Arabische Republik'
,p_lov_return_value=>'SYR'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824228672432040283.4703)
,p_lov_disp_sequence=>217
,p_lov_disp_value=>'Taiwan (Provinz von China)'
,p_lov_return_value=>'TWN'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824229068608040288.4703)
,p_lov_disp_sequence=>218
,p_lov_disp_value=>'Tadschikistan'
,p_lov_return_value=>'TJK'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824229461777040293.4703)
,p_lov_disp_sequence=>219
,p_lov_disp_value=>'Tansania (Vereinigte Republik)'
,p_lov_return_value=>'TZA'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824229879017040298.4703)
,p_lov_disp_sequence=>220
,p_lov_disp_value=>'Thailand'
,p_lov_return_value=>'THA'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824230252868040302.4703)
,p_lov_disp_sequence=>221
,p_lov_disp_value=>'Osttimor'
,p_lov_return_value=>'TLS'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824230627563040307.4703)
,p_lov_disp_sequence=>222
,p_lov_disp_value=>'Togo'
,p_lov_return_value=>'TGO'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824231089167040312.4703)
,p_lov_disp_sequence=>223
,p_lov_disp_value=>'Tokelau'
,p_lov_return_value=>'TKL'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824231429479040317.4703)
,p_lov_disp_sequence=>224
,p_lov_disp_value=>'Tonga'
,p_lov_return_value=>'TON'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824231839788040322.4703)
,p_lov_disp_sequence=>225
,p_lov_disp_value=>'Trinidad und Tobago'
,p_lov_return_value=>'TTO'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824232259416040327.4703)
,p_lov_disp_sequence=>226
,p_lov_disp_value=>'Tunesien'
,p_lov_return_value=>'TUN'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824232681326040331.4703)
,p_lov_disp_sequence=>227
,p_lov_disp_value=>unistr('T\00FCrkei')
,p_lov_return_value=>'TUR'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824233010783040336.4703)
,p_lov_disp_sequence=>228
,p_lov_disp_value=>'Turkmenistan'
,p_lov_return_value=>'TKM'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824233487085040340.4703)
,p_lov_disp_sequence=>229
,p_lov_disp_value=>'Turks- und Caicosinseln'
,p_lov_return_value=>'TCA'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824233880593040345.4703)
,p_lov_disp_sequence=>230
,p_lov_disp_value=>'Tuvalu'
,p_lov_return_value=>'TUV'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824234219912040350.4703)
,p_lov_disp_sequence=>231
,p_lov_disp_value=>'Uganda'
,p_lov_return_value=>'UGA'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824234640790040355.4703)
,p_lov_disp_sequence=>232
,p_lov_disp_value=>'Ukraine'
,p_lov_return_value=>'UKR'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824235022516040359.4703)
,p_lov_disp_sequence=>233
,p_lov_disp_value=>'Vereinigte Arabische Emirate'
,p_lov_return_value=>'ARE'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824235413266040364.4703)
,p_lov_disp_sequence=>234
,p_lov_disp_value=>unistr('Vereinigtes K\00F6nigreich Gro\00DFbritannien und Nordirland')
,p_lov_return_value=>'GBR'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824235898318040370.4703)
,p_lov_disp_sequence=>235
,p_lov_disp_value=>'Amerikanisch-Ozeanien'
,p_lov_return_value=>'UMI'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824236251901040374.4703)
,p_lov_disp_sequence=>236
,p_lov_disp_value=>'Vereinigte Staaten von Amerika'
,p_lov_return_value=>'USA'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824236528753040379.4703)
,p_lov_disp_sequence=>237
,p_lov_disp_value=>'Uruguay'
,p_lov_return_value=>'URY'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824236994052040384.4703)
,p_lov_disp_sequence=>238
,p_lov_disp_value=>'Usbekistan'
,p_lov_return_value=>'UZB'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824237304166040388.4703)
,p_lov_disp_sequence=>239
,p_lov_disp_value=>'Vanuatu'
,p_lov_return_value=>'VUT'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824237773816040393.4703)
,p_lov_disp_sequence=>240
,p_lov_disp_value=>'Venezuela (Bolivarische Republik)'
,p_lov_return_value=>'VEN'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824238191827040398.4703)
,p_lov_disp_sequence=>241
,p_lov_disp_value=>'Vietnam'
,p_lov_return_value=>'VNM'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824238589489040403.4703)
,p_lov_disp_sequence=>242
,p_lov_disp_value=>'Jungferninseln (Britisch)'
,p_lov_return_value=>'VGB'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824238926608040407.4703)
,p_lov_disp_sequence=>243
,p_lov_disp_value=>'Jungferninseln (Amerikanisch)'
,p_lov_return_value=>'VIR'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824239380281040412.4703)
,p_lov_disp_sequence=>244
,p_lov_disp_value=>'Wallis und Futuna'
,p_lov_return_value=>'WLF'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824239765313040417.4703)
,p_lov_disp_sequence=>245
,p_lov_disp_value=>'Westsahara'
,p_lov_return_value=>'ESH'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824240139823040421.4703)
,p_lov_disp_sequence=>246
,p_lov_disp_value=>'Jemen'
,p_lov_return_value=>'YEM'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824240529218040427.4703)
,p_lov_disp_sequence=>247
,p_lov_disp_value=>'Sambia'
,p_lov_return_value=>'ZMB'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824240904886040432.4703)
,p_lov_disp_sequence=>248
,p_lov_disp_value=>'Simbabwe'
,p_lov_return_value=>'ZWE'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824241383447040436.4703)
,p_lov_disp_sequence=>249
,p_lov_disp_value=>unistr('\00C5land-Inseln')
,p_lov_return_value=>'ALA'
);
end;
/
prompt --application/shared_components/user_interface/lovs/new_or_existing_schema
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(150771414457811401.4703)
,p_lov_name=>'NEW_OR_EXISTING_SCHEMA'
,p_lov_query=>'.'||wwv_flow_imp.id(150771414457811401)||'.'
,p_location=>'STATIC'
,p_version_scn=>75558012
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(150771902162811402.4703)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Neues Schema anfordern'
,p_lov_return_value=>'YES'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(150771702466811402.4703)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Vorhandenes Schema aus der Datenbank verwenden'
,p_lov_return_value=>'NO'
,p_lov_disp_cond_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_lov_disp_cond=>'F4700_REQ_NEW_SCHEMA'
,p_lov_disp_cond2=>'Y'
);
end;
/
prompt --application/shared_components/user_interface/lovs/usage_type
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(824610978117256327.4703)
,p_lov_name=>'USAGE_TYPE'
,p_lov_query=>'.'||wwv_flow_imp.id(824610978117256327)||'.'
,p_location=>'STATIC'
,p_version_scn=>75558013
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824611611527256327.4703)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>unistr('Pers\00F6nlich')
,p_lov_return_value=>'PERSONAL'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(824611248260256327.4703)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Organisation'
,p_lov_return_value=>'ORG'
);
end;
/
prompt --application/shared_components/user_interface/lovs/workspace_type
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(728312584834618523.4703)
,p_lov_name=>'WORKSPACE_TYPE'
,p_lov_query=>'.'||wwv_flow_imp.id(728312584834618523)||'.'
,p_location=>'STATIC'
,p_version_scn=>75558013
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(728312822592618530.4703)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Anwendungsentwicklung'
,p_lov_return_value=>'BUILDER'
,p_lov_template=>'#DISPLAY_VALUE#| gi-icon-app-builder'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(728313109611618535.4703)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>unistr('Nur Produktivit\00E4ts-Apps')
,p_lov_return_value=>'APPS'
,p_lov_template=>'#DISPLAY_VALUE#| gi-icon-pkg-apps'
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
prompt --application/shared_components/user_interface/templates/page/printerfriendly
begin
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(4674102852.4703)
,p_theme_id=>3
,p_name=>'printer-friendly.de'
,p_internal_name=>'PRINTERFRIENDLY'
,p_is_popup=>false
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">',
'',
'<head>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<title>#TITLE#</title><link rel="shortcut icon" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon.ico">',
'<link rel="icon" sizes="16x16" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-16x16.png">',
'<link rel="icon" sizes="32x32" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-32x32.png">',
'<link rel="apple-touch-icon" sizes="180x180" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-180x180.png">#APEX_CSS#',
'#APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#HEAD#',
'</head><body class="#PAGE_CSS_CLASSES#" #ONLOAD#><noscript>&MSG_JSCRIPT.</noscript>',
'#ENVIRONMENT_BANNER#',
'#FORM_OPEN#'))
,p_box=>'<br />#BODY#'
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
,p_success_message=>'<div class="htmldbSuccessMessage" id="MESSAGE" role="alert"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>'
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h2 class="hideMeButHearMe">#NOTIFICATION_MESSAGE_HEADING#</h2>',
'<div class="htmldbNotification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="2" width="100%"'
,p_theme_class_id=>5
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
 p_id=>wwv_flow_imp.id(140045294411349498.4703)
,p_page_template_id=>wwv_flow_imp.id(4674102852.4703)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/eba_wizard
begin
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(18107622439281852.4703)
,p_theme_id=>3
,p_name=>'[EBA] Wizard.de'
,p_internal_name=>'[EBA]_WIZARD'
,p_is_popup=>false
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:apex="http://apex.oracle.com">',
'<head>',
'	<title>#TITLE#</title>',
'	<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge" /><![endif]-->',
'	<link rel="shortcut icon" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon.ico">',
'<link rel="icon" sizes="16x16" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-16x16.png">',
'<link rel="icon" sizes="32x32" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-32x32.png">',
'<link rel="apple-touch-icon" sizes="180x180" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-180x180.png">',
'	',
'	<link rel="stylesheet" href="#IMAGE_PREFIX#eba/css/eba_uniframe.css" type="text/css" />',
'	<!--[if IE 7]>',
'	<link rel="stylesheet" href="#IMAGE_PREFIX#eba/css/eba_uniframe_ie7.css" type="text/css" />',
'	<![endif]-->',
'	<!--[if IE 8]>',
'	<link rel="stylesheet" href="#IMAGE_PREFIX#eba/css/eba_uniframe_ie8.css" type="text/css" />',
'	<![endif]-->',
'#APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#HEAD#',
'</head>',
'<body class="#PAGE_CSS_CLASSES#" #ONLOAD#>',
'<noscript>&MSG_JSCRIPT.</noscript>',
'	<!--[if lte IE 8]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'	',
'#ENVIRONMENT_BANNER#',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'#REGION_POSITION_01#',
'<div class="ebaFrame ebaWizardFrame ebaSmallWizard">',
'<div class="ebaFrameHeader">',
'		<h1 class="oracleLogo">',
'			#LOGO#',
'		</h1>',
'		<div class="ebaProgressBar">',
'#REGION_POSITION_02#',
'		</div>',
'</div> <!-- End .ebaFrameHeader -->',
'<div class="ebaContentContainer">',
'#REGION_POSITION_03#',
'	<div class="ebaContent">',
'#BODY#',
'	</div> <!-- End .ebaContent -->',
'</div> <!-- End .ebaContentContainer -->',
'	<div class="ebaFrameFooter">',
'#REGION_POSITION_04#',
'#REGION_POSITION_05#',
'	</div>',
'</div> <!-- End .ebaFrame -->',
'#REGION_POSITION_06#',
'#REGION_POSITION_07#',
'#REGION_POSITION_08#'))
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
'<div class="htmldbSuccessMessage" id="MESSAGE">',
'<h2 class="visuallyhidden" role="alert">#SUCCESS_MESSAGE_HEADING#</h2>',
'<img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="#CLOSE_NOTIFICATION#" />#SUCCESS_MESSAGE#</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="htmldbNotification" id="MESSAGE" role="alert">',
'<h2 class="visuallyhidden">#ERROR_MESSAGE_HEADING#</h2>',
'<img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="#CLOSE_NOTIFICATION#" />#MESSAGE#</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="2" width="100%"'
,p_theme_class_id=>6
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
 p_id=>wwv_flow_imp.id(140045371814349497.4703)
,p_page_template_id=>wwv_flow_imp.id(18107622439281852.4703)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140045463101349495.4703)
,p_page_template_id=>wwv_flow_imp.id(18107622439281852.4703)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140045568641349495.4703)
,p_page_template_id=>wwv_flow_imp.id(18107622439281852.4703)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140045696148349495.4703)
,p_page_template_id=>wwv_flow_imp.id(18107622439281852.4703)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140045705910349495.4703)
,p_page_template_id=>wwv_flow_imp.id(18107622439281852.4703)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140045841273349495.4703)
,p_page_template_id=>wwv_flow_imp.id(18107622439281852.4703)
,p_name=>'Page Position 5'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140045988449349495.4703)
,p_page_template_id=>wwv_flow_imp.id(18107622439281852.4703)
,p_name=>'Page Position 6'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140046040073349495.4703)
,p_page_template_id=>wwv_flow_imp.id(18107622439281852.4703)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140046137068349494.4703)
,p_page_template_id=>wwv_flow_imp.id(18107622439281852.4703)
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
prompt --application/shared_components/user_interface/templates/page/apex_5_0_sign_up_wizard
begin
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(728298792391563586.4703)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Sign Up Wizard.de'
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
 p_id=>wwv_flow_imp.id(115218801923289458.4703)
,p_page_template_id=>wwv_flow_imp.id(728298792391563586.4703)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115219385115289458.4703)
,p_page_template_id=>wwv_flow_imp.id(728298792391563586.4703)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115219889935289459.4703)
,p_page_template_id=>wwv_flow_imp.id(728298792391563586.4703)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115220395009289459.4703)
,p_page_template_id=>wwv_flow_imp.id(728298792391563586.4703)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115220894282289459.4703)
,p_page_template_id=>wwv_flow_imp.id(728298792391563586.4703)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115221312980289460.4703)
,p_page_template_id=>wwv_flow_imp.id(728298792391563586.4703)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115221898616289460.4703)
,p_page_template_id=>wwv_flow_imp.id(728298792391563586.4703)
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
 p_id=>wwv_flow_imp.id(728299018883563592.4703)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Wizard Page.de'
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
 p_id=>wwv_flow_imp.id(1536977403875382.4703)
,p_page_template_id=>wwv_flow_imp.id(728299018883563592.4703)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1537404988875382.4703)
,p_page_template_id=>wwv_flow_imp.id(728299018883563592.4703)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1537944468875382.4703)
,p_page_template_id=>wwv_flow_imp.id(728299018883563592.4703)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1538418261875382.4703)
,p_page_template_id=>wwv_flow_imp.id(728299018883563592.4703)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1538999226875382.4703)
,p_page_template_id=>wwv_flow_imp.id(728299018883563592.4703)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1539485775875383.4703)
,p_page_template_id=>wwv_flow_imp.id(728299018883563592.4703)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1539944815875383.4703)
,p_page_template_id=>wwv_flow_imp.id(728299018883563592.4703)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1540468825875383.4703)
,p_page_template_id=>wwv_flow_imp.id(728299018883563592.4703)
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
prompt --application/shared_components/user_interface/templates/page/apex_5_0_wizard_dialog
begin
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(728303139008563600.4703)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Wizard Dialog.de'
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
 p_id=>wwv_flow_imp.id(293540632026992208.4703)
,p_page_template_id=>wwv_flow_imp.id(728303139008563600.4703)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293541186357992209.4703)
,p_page_template_id=>wwv_flow_imp.id(728303139008563600.4703)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293541640513992209.4703)
,p_page_template_id=>wwv_flow_imp.id(728303139008563600.4703)
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
prompt --application/shared_components/user_interface/templates/button/eba_button
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(18109103748352135.4703)
,p_template_name=>'[EBA] Button'
,p_internal_name=>'[EBA]_BUTTON'
,p_template=>'<a href="#LINK#" class="ebaButton" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#>#LABEL!HTML#</a>'
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
end;
/
prompt --application/shared_components/user_interface/templates/button/eba_hot_button
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(18109222795357646.4703)
,p_template_name=>'[EBA] Hot Button'
,p_internal_name=>'[EBA]_HOT_BUTTON'
,p_template=>'<a href="#LINK#" class="ebaHotButton" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#>#LABEL!HTML#</a>'
,p_translate_this_template=>'N'
,p_theme_class_id=>4
,p_theme_id=>3
);
end;
/
prompt --application/shared_components/user_interface/templates/button/eba_hot_button_next
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(18109301108360805.4703)
,p_template_name=>'[EBA] Hot Button (Next)'
,p_internal_name=>'[EBA]_HOT_BUTTON_NEXT'
,p_template=>'<a href="#LINK#" class="ebaHotButton ebaNextButton" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#>#LABEL!HTML#<img src="#IMAGE_PREFIX#f_spacer.gif" alt=""/></a>'
,p_translate_this_template=>'N'
,p_theme_class_id=>4
,p_theme_id=>3
);
end;
/
prompt --application/shared_components/user_interface/templates/button/eba_button_previous
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(18109418424365879.4703)
,p_template_name=>'[EBA] Button (Previous)'
,p_internal_name=>'[EBA]_BUTTON_PREVIOUS'
,p_template=>'<a href="#LINK#" class="ebaButton ebaPrevButton" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#><img src="#IMAGE_PREFIX#f_spacer.gif" alt=""/>#LABEL!HTML#</a>'
,p_translate_this_template=>'N'
,p_theme_class_id=>4
,p_theme_id=>3
);
end;
/
prompt --application/shared_components/user_interface/templates/button/apex_5_0_button
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(481975242743888810.4703)
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
prompt --application/shared_components/user_interface/templates/button/apex_5_0_button_with_icon
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(481975658518888812.4703)
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
prompt --application/shared_components/user_interface/templates/button/apex_5_0_icon_menu_button
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(481975923749888812.4703)
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
 p_id=>wwv_flow_imp.id(481976264382888813.4703)
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
prompt --application/shared_components/user_interface/templates/button/html_button_legacy_apex_5_migration
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(516411350946385636.4703)
,p_template_name=>'HTML button (legacy - APEX 5 migration)'
,p_internal_name=>'HTML_BUTTON_LEGACY_APEX_5_MIGRATION'
,p_template=>'<input type="button" value="#LABEL!ATTR#" onclick="#JAVASCRIPT#" id="#BUTTON_ID#" class="#BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#/>'
,p_hot_template=>'<input type="button" value="#LABEL!ATTR#" onclick="#JAVASCRIPT#" id="#BUTTON_ID#" class="#BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#/>'
,p_translate_this_template=>'N'
,p_theme_class_id=>13
,p_theme_id=>3
);
end;
/
prompt --application/shared_components/user_interface/templates/region/eba_wizard_buttons
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(18108515260336521.4703)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#CLOSE#<span>#PREVIOUS##NEXT##CREATE#</span>',
''))
,p_page_plug_template_name=>'[EBA] Wizard Buttons'
,p_internal_name=>'[EBA]_WIZARD_BUTTONS'
,p_theme_id=>3
,p_theme_class_id=>17
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140589729503344419.4703)
,p_plug_template_id=>wwv_flow_imp.id(18108515260336521.4703)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140589837075344418.4703)
,p_plug_template_id=>wwv_flow_imp.id(18108515260336521.4703)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140589919306344418.4703)
,p_plug_template_id=>wwv_flow_imp.id(18108515260336521.4703)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140590092278344418.4703)
,p_plug_template_id=>wwv_flow_imp.id(18108515260336521.4703)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140590123579344418.4703)
,p_plug_template_id=>wwv_flow_imp.id(18108515260336521.4703)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140590250558344418.4703)
,p_plug_template_id=>wwv_flow_imp.id(18108515260336521.4703)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/eba_form_region
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(18113207959457422.4703)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ebaWizardText ebaFormTable" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'#BODY#',
'</div>'))
,p_page_plug_template_name=>'[EBA] Form Region'
,p_internal_name=>'[EBA]_FORM_REGION'
,p_theme_id=>3
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140590318049344418.4703)
,p_plug_template_id=>wwv_flow_imp.id(18113207959457422.4703)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140590406705344418.4703)
,p_plug_template_id=>wwv_flow_imp.id(18113207959457422.4703)
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
prompt --application/shared_components/user_interface/templates/region/apex_4_0_div_with_id
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(29133613931545850.4703)
,p_layout=>'TABLE'
,p_template=>'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>#BODY#</div>'
,p_page_plug_template_name=>'APEX 4.0 - DIV with ID'
,p_internal_name=>'APEX_4.0_DIV_WITH_ID'
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
 p_id=>wwv_flow_imp.id(140590559109344418.4703)
,p_plug_template_id=>wwv_flow_imp.id(29133613931545850.4703)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140590657613344418.4703)
,p_plug_template_id=>wwv_flow_imp.id(29133613931545850.4703)
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
 p_id=>wwv_flow_imp.id(481965601614717220.4703)
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
 p_id=>wwv_flow_imp.id(32615856998747570.4703)
,p_plug_template_id=>wwv_flow_imp.id(481965601614717220.4703)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32616300362747570.4703)
,p_plug_template_id=>wwv_flow_imp.id(481965601614717220.4703)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32616860498747571.4703)
,p_plug_template_id=>wwv_flow_imp.id(481965601614717220.4703)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32617312976747571.4703)
,p_plug_template_id=>wwv_flow_imp.id(481965601614717220.4703)
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
prompt --application/shared_components/user_interface/templates/region/apex_5_0_wizard_progress_buttons
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(481969298650741033.4703)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Wizard-controls u-Table #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_LANDMARK_ATTRIBUTES# #REGION_ATTRIBUTES#>',
'  <div class="u-Table-fit u-textLeft a-Wizard-buttons">',
'  #PREVIOUS#',
'  </div>',
'  <div class="u-Table-fill">',
'    <div class="a-Wizard-steps">',
'      #BODY#',
'    </div>',
'    #CREATE#',
'  </div>',
'  <div class="u-Table-fit u-textRight a-Wizard-buttons">',
'  #NEXT#',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'APEX 5.0 - Wizard Progress + Buttons'
,p_internal_name=>'APEX_5.0_WIZARD_PROGRESS_+_BUTTONS'
,p_theme_id=>3
,p_theme_class_id=>12
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140591114954344417.4703)
,p_plug_template_id=>wwv_flow_imp.id(481969298650741033.4703)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140591206251344417.4703)
,p_plug_template_id=>wwv_flow_imp.id(481969298650741033.4703)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140591396875344417.4703)
,p_plug_template_id=>wwv_flow_imp.id(481969298650741033.4703)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140591408515344417.4703)
,p_plug_template_id=>wwv_flow_imp.id(481969298650741033.4703)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140591525805344417.4703)
,p_plug_template_id=>wwv_flow_imp.id(481969298650741033.4703)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/apex_5_0_wizard
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(481970015003751305.4703)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Wizard #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_LANDMARK_ATTRIBUTES# #REGION_ATTRIBUTES#>',
'  <h1 class="a-Wizard-title" id="#REGION_STATIC_ID#_TITLE">#TITLE#</h1>',
'  #BODY#',
'</div>'))
,p_page_plug_template_name=>'APEX 5.0 - Wizard'
,p_internal_name=>'APEX_5.0_WIZARD'
,p_theme_id=>3
,p_theme_class_id=>12
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_default_landmark_type=>'region'
,p_region_title_dom_id=>'#REGION_STATIC_ID#_TITLE'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140591624773344417.4703)
,p_plug_template_id=>wwv_flow_imp.id(481970015003751305.4703)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140591745863344416.4703)
,p_plug_template_id=>wwv_flow_imp.id(481970015003751305.4703)
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
 p_id=>wwv_flow_imp.id(728272729796557092.4703)
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
 p_id=>wwv_flow_imp.id(2279638100232365.4703)
,p_plug_template_id=>wwv_flow_imp.id(728272729796557092.4703)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2280174205232365.4703)
,p_plug_template_id=>wwv_flow_imp.id(728272729796557092.4703)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2280639297232365.4703)
,p_plug_template_id=>wwv_flow_imp.id(728272729796557092.4703)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2281145196232366.4703)
,p_plug_template_id=>wwv_flow_imp.id(728272729796557092.4703)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2281674011232366.4703)
,p_plug_template_id=>wwv_flow_imp.id(728272729796557092.4703)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2282180090232366.4703)
,p_plug_template_id=>wwv_flow_imp.id(728272729796557092.4703)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2282617165232366.4703)
,p_plug_template_id=>wwv_flow_imp.id(728272729796557092.4703)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2283169776232366.4703)
,p_plug_template_id=>wwv_flow_imp.id(728272729796557092.4703)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2283602548232366.4703)
,p_plug_template_id=>wwv_flow_imp.id(728272729796557092.4703)
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
prompt --application/shared_components/user_interface/templates/region/new_apex_5_0_div_with_id_class_and_region_attributes
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(728279364278557123.4703)
,p_layout=>'TABLE'
,p_template=>'<div id="#REGION_STATIC_ID#" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>#PREVIOUS##BODY##NEXT#</div>'
,p_page_plug_template_name=>'New APEX 5.0 - Div with ID, Class, and Region Attributes'
,p_internal_name=>'NEW_APEX_5.0_DIV_WITH_ID,_CLASS,_AND_REGION_ATTRIBUTES'
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
 p_id=>wwv_flow_imp.id(140592784021344415.4703)
,p_plug_template_id=>wwv_flow_imp.id(728279364278557123.4703)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140592807833344415.4703)
,p_plug_template_id=>wwv_flow_imp.id(728279364278557123.4703)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140592959588344415.4703)
,p_plug_template_id=>wwv_flow_imp.id(728279364278557123.4703)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140593092669344415.4703)
,p_plug_template_id=>wwv_flow_imp.id(728279364278557123.4703)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/apex_5_0_hide_show_region
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(728280005939557124.4703)
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
 p_id=>wwv_flow_imp.id(2816540422491372.4703)
,p_plug_template_id=>wwv_flow_imp.id(728280005939557124.4703)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2817065201491372.4703)
,p_plug_template_id=>wwv_flow_imp.id(728280005939557124.4703)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2817526560491372.4703)
,p_plug_template_id=>wwv_flow_imp.id(728280005939557124.4703)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2818088247491372.4703)
,p_plug_template_id=>wwv_flow_imp.id(728280005939557124.4703)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2818522726491372.4703)
,p_plug_template_id=>wwv_flow_imp.id(728280005939557124.4703)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2819071208491372.4703)
,p_plug_template_id=>wwv_flow_imp.id(728280005939557124.4703)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2819511997491372.4703)
,p_plug_template_id=>wwv_flow_imp.id(728280005939557124.4703)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2820043835491372.4703)
,p_plug_template_id=>wwv_flow_imp.id(728280005939557124.4703)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2820585132491373.4703)
,p_plug_template_id=>wwv_flow_imp.id(728280005939557124.4703)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2821064684491373.4703)
,p_plug_template_id=>wwv_flow_imp.id(728280005939557124.4703)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2821574759491373.4703)
,p_plug_template_id=>wwv_flow_imp.id(728280005939557124.4703)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2822001222491373.4703)
,p_plug_template_id=>wwv_flow_imp.id(728280005939557124.4703)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2822588006491373.4703)
,p_plug_template_id=>wwv_flow_imp.id(728280005939557124.4703)
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
 p_id=>wwv_flow_imp.id(728292067255557137.4703)
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
 p_id=>wwv_flow_imp.id(3295428515506007.4703)
,p_plug_template_id=>wwv_flow_imp.id(728292067255557137.4703)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3295905523506007.4703)
,p_plug_template_id=>wwv_flow_imp.id(728292067255557137.4703)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3296473011506007.4703)
,p_plug_template_id=>wwv_flow_imp.id(728292067255557137.4703)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3296917603506007.4703)
,p_plug_template_id=>wwv_flow_imp.id(728292067255557137.4703)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3297453322506007.4703)
,p_plug_template_id=>wwv_flow_imp.id(728292067255557137.4703)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3297984775506007.4703)
,p_plug_template_id=>wwv_flow_imp.id(728292067255557137.4703)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3298481323506007.4703)
,p_plug_template_id=>wwv_flow_imp.id(728292067255557137.4703)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3298973290506008.4703)
,p_plug_template_id=>wwv_flow_imp.id(728292067255557137.4703)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3299491762506008.4703)
,p_plug_template_id=>wwv_flow_imp.id(728292067255557137.4703)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3299989051506008.4703)
,p_plug_template_id=>wwv_flow_imp.id(728292067255557137.4703)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3300408358506008.4703)
,p_plug_template_id=>wwv_flow_imp.id(728292067255557137.4703)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3300902630506008.4703)
,p_plug_template_id=>wwv_flow_imp.id(728292067255557137.4703)
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
 p_id=>wwv_flow_imp.id(728292709128557138.4703)
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
 p_id=>wwv_flow_imp.id(88195249341816933.4703)
,p_plug_template_id=>wwv_flow_imp.id(728292709128557138.4703)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(88195763484816933.4703)
,p_plug_template_id=>wwv_flow_imp.id(728292709128557138.4703)
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
 p_id=>wwv_flow_imp.id(728293431473557139.4703)
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
 p_id=>wwv_flow_imp.id(3360941751508594.4703)
,p_plug_template_id=>wwv_flow_imp.id(728293431473557139.4703)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3361429491508594.4703)
,p_plug_template_id=>wwv_flow_imp.id(728293431473557139.4703)
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
 p_id=>wwv_flow_imp.id(728294112567557139.4703)
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
 p_id=>wwv_flow_imp.id(3387462433510522.4703)
,p_plug_template_id=>wwv_flow_imp.id(728294112567557139.4703)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3387938416510522.4703)
,p_plug_template_id=>wwv_flow_imp.id(728294112567557139.4703)
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
prompt --application/shared_components/user_interface/templates/region/eba_success_region
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(860617531457119334.4703)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="successRegion">',
'<h1>#TITLE#</h1>',
'#BODY#',
'</div>'))
,p_page_plug_template_name=>'[EBA] Success Region'
,p_internal_name=>'[EBA]_SUCCESS_REGION'
,p_theme_id=>3
,p_theme_class_id=>12
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140596204722344412.4703)
,p_plug_template_id=>wwv_flow_imp.id(860617531457119334.4703)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140596300021344412.4703)
,p_plug_template_id=>wwv_flow_imp.id(860617531457119334.4703)
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
prompt --application/shared_components/user_interface/templates/list/standard_list_c_htmldbstandardlist_from_4999
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(4794278052.4703)
,p_list_template_current=>'<tr><td class="htmldbStandardList1"><a href="#LINK#" class="itemLink" title="#TEXT_ESC_SC#">#TEXT#</a></td></tr>'
,p_list_template_noncurrent=>'<tr><td class="htmldbStandardList2"><a href="#LINK#" class="itemLink" title="#TEXT_ESC_SC#">#TEXT#</a></td></tr>'
,p_list_template_name=>'Standard List (c:htmldbStandardList) From 4999'
,p_internal_name=>'STANDARD_LIST_C:HTMLDBSTANDARDLIST_FROM_4999'
,p_theme_id=>3
,p_theme_class_id=>0
,p_list_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table class="htmldbStandardList" cellpadding="0" cellspacing="0" border="0" summary="">',
'<tbody>'))
,p_list_template_after_rows=>'</tbody></table>'
);
end;
/
prompt --application/shared_components/user_interface/templates/list/eba_wizard_progress
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(18108230235321990.4703)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	<li class="currentStep #LIST_STATUS#">',
'		<span></span>',
'	</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	<li class="#LIST_STATUS#">',
'		<span></span>',
'	</li>'))
,p_list_template_name=>'[EBA] Wizard Progress'
,p_internal_name=>'[EBA]_WIZARD_PROGRESS'
,p_theme_id=>3
,p_theme_class_id=>17
,p_list_template_before_rows=>'<ul class="ebaProgressWizard">'
,p_list_template_after_rows=>' </ul>'
);
end;
/
prompt --application/shared_components/user_interface/templates/list/apex_5_0_wizard_progress
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(481972912021825750.4703)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="a-WizardSteps-step is-active" aria-current="step">',
'  <div class="a-WizardSteps-wrap">',
'    <span class="a-WizardSteps-marker" aria-hidden="true"><span class="a-Icon icon-wizard-step-complete"></span></span>',
'    <span class="a-WizardSteps-label">#TEXT#</span>',
'  </div>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="a-WizardSteps-step">',
'  <div class="a-WizardSteps-wrap">',
'    <span class="a-WizardSteps-marker" aria-hidden="true"><span class="a-Icon icon-wizard-step-complete"></span></span>',
'    <span class="a-WizardSteps-label">#TEXT#</span>',
'  </div>',
'</li>'))
,p_list_template_name=>'APEX 5.0 - Wizard Progress'
,p_internal_name=>'APEX_5.0_WIZARD_PROGRESS'
,p_theme_id=>3
,p_theme_class_id=>17
,p_list_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul aria-label="#CURRENT_PROGRESS#" class="a-WizardSteps #COMPONENT_CSS_CLASSES#">',
''))
,p_list_template_after_rows=>'</ul>'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/eba_optional_w_help
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(18117622573511758.4703)
,p_template_name=>'[EBA] Optional w/ Help'
,p_internal_name=>'[EBA]_OPTIONAL_W/_HELP'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="ebaOptional"><a href="javascript:void(0)" tabindex="999" class="helpTip" data-item-id="#CURRENT_ITEM_ID#" data-session="&SESSION.">'
,p_template_body2=>'</a></label>'
,p_theme_id=>3
,p_theme_class_id=>1
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/eba_required_w_help
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(18117725602511758.4703)
,p_template_name=>'[EBA] Required w/ Help'
,p_internal_name=>'[EBA]_REQUIRED_W/_HELP'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="ebaRequired"><a href="javascript:void(0)" tabindex="999" class="helpTip" data-item-id="#CURRENT_ITEM_ID#" data-session="&SESSION.">'
,p_template_body2=>'</a></label>'
,p_on_error_after_label=>'<span class="ebaLabelError">#ERROR_MESSAGE#</span>'
,p_theme_id=>3
,p_theme_class_id=>4
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/no_label
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(18341322111783282.4703)
,p_template_name=>'No Label'
,p_internal_name=>'NO_LABEL'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="ebaNoLabel">'
,p_template_body2=>'</label>'
,p_theme_id=>3
,p_theme_class_id=>1
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/apex_5_0_optional_label
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(481972669929805619.4703)
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
prompt --application/shared_components/user_interface/templates/label/apex_5_0_required_label
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(481972771960821314.4703)
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
prompt --application/shared_components/user_interface/templates/label/apex_5_0_optional_label_above
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(516405744549268368.4703)
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
prompt --application/shared_components/user_interface/templates/label/apex_5_0_required_label_above
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(516405998930268369.4703)
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
prompt --application/shared_components/user_interface/templates/label/apex_5_0_hidden_label
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(805564588331659193.4703)
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
prompt --application/shared_components/user_interface/templates/popuplov
begin
wwv_flow_imp_shared.create_popup_lov_template(
 p_id=>wwv_flow_imp.id(14663214008465131.4703)
,p_page_name=>'winlov'
,p_page_title=>'Suchdialog'
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
,p_find_button_text=>'Suche'
,p_find_button_attr=>'class="a-Button a-Button--hot a-Button--padLeft"'
,p_close_button_text=>unistr('Schlie\00DFen')
,p_close_button_attr=>'class="a-Button u-pullRight"'
,p_next_button_text=>'Weiter &gt;'
,p_next_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_prev_button_text=>unistr('&lt; Zur\00FCck')
,p_prev_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'380'
,p_height=>'480'
,p_result_row_x_of_y=>'<div class="a-PopupLOV-pagination">Zeilen #FIRST_ROW# - #LAST_ROW#</div>'
,p_result_rows_per_pg=>200
,p_before_result_set=>'<div class="a-PopupLOV-links">'
,p_theme_id=>3
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
 p_id=>wwv_flow_imp.id(72333216619538152.4703)
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
 p_id=>wwv_flow_imp.id(204024310335769388.4703)
,p_theme_id=>3
,p_name=>'STANDARD'
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#apex_ui/css/Core#MIN#.css',
'#IMAGE_PREFIX#apex_ui/css/Theme-Standard#MIN#.css'))
,p_is_public=>false
,p_is_accessible=>false
,p_theme_roller_read_only=>false
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(556402214051120170.4703)
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
 p_id=>wwv_flow_imp.id(556402525655120954.4703)
,p_theme_id=>3
,p_name=>'STANDARD_AUTO'
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
 p_id=>wwv_flow_imp.id(2346703868041176.4703)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL'
,p_display_name=>'Heading Level'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(728273198308557106.4703)
,p_theme_id=>3
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(728273812208557117.4703)
,p_theme_id=>3
,p_name=>'REGION_PADDING'
,p_display_name=>'Region Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Padding'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(728274811074557119.4703)
,p_theme_id=>3
,p_name=>'REGION_STYLE'
,p_display_name=>'Region Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Style'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(728281789702557125.4703)
,p_theme_id=>3
,p_name=>'REGION_OVERFLOW'
,p_display_name=>'Region Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(728282779546557126.4703)
,p_theme_id=>3
,p_name=>'DISPLAY'
,p_display_name=>'Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(728284958660557127.4703)
,p_theme_id=>3
,p_name=>'REGION_POSITION'
,p_display_name=>'Region Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(746434995533421149.4703)
,p_theme_id=>3
,p_name=>'HEIGHT'
,p_display_name=>'Height'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(746436279201421149.4703)
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
 p_id=>wwv_flow_imp.id(746436594439421149.4703)
,p_theme_id=>3
,p_name=>'FORM_LABEL_WIDTH'
,p_display_name=>'Form Label Width'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(746436840999421149.4703)
,p_theme_id=>3
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Not Part of Button Set'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(746437988722421151.4703)
,p_theme_id=>3
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>1
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(746438219342421151.4703)
,p_theme_id=>3
,p_name=>'FORM_LABEL_POSITION'
,p_display_name=>'Form Label Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(746438589659421151.4703)
,p_theme_id=>3
,p_name=>'BUTTON_SIZE'
,p_display_name=>'Button Size'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Button Size'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(746438816241421151.4703)
,p_theme_id=>3
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing left'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Left Spacing'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(746439137924421151.4703)
,p_theme_id=>3
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Right Spacing'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(746439645845421152.4703)
,p_theme_id=>3
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Icon on Right'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(746439918130421152.4703)
,p_theme_id=>3
,p_name=>'BUTTON_TYPE'
,p_display_name=>'Button Type'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
end;
/
prompt --application/shared_components/user_interface/template_options
begin
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2347056978052005.4703)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H1'
,p_display_name=>'H1'
,p_display_sequence=>10
,p_css_classes=>'js-headingLevel-1'
,p_group_id=>wwv_flow_imp.id(2346703868041176.4703)
,p_template_types=>'REGION'
,p_help_text=>'H1'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2347349517052005.4703)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H2'
,p_display_name=>'H2'
,p_display_sequence=>20
,p_css_classes=>'js-headingLevel-2'
,p_group_id=>wwv_flow_imp.id(2346703868041176.4703)
,p_template_types=>'REGION'
,p_help_text=>'H2'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2347793139052005.4703)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H3'
,p_display_name=>'H3'
,p_display_sequence=>30
,p_css_classes=>'js-headingLevel-3'
,p_group_id=>wwv_flow_imp.id(2346703868041176.4703)
,p_template_types=>'REGION'
,p_help_text=>'H3'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2348168091052005.4703)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H4'
,p_display_name=>'H4'
,p_display_sequence=>40
,p_css_classes=>'js-headingLevel-4'
,p_group_id=>wwv_flow_imp.id(2346703868041176.4703)
,p_template_types=>'REGION'
,p_help_text=>'H4'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2348559807052005.4703)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H5'
,p_display_name=>'H5'
,p_display_sequence=>50
,p_css_classes=>'js-headingLevel-5'
,p_group_id=>wwv_flow_imp.id(2346703868041176.4703)
,p_template_types=>'REGION'
,p_help_text=>'H5'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2348991248052005.4703)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H6'
,p_display_name=>'H6'
,p_display_sequence=>60
,p_css_classes=>'js-headingLevel-6'
,p_group_id=>wwv_flow_imp.id(2346703868041176.4703)
,p_template_types=>'REGION'
,p_help_text=>'H6'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(728276986572557122.4703)
,p_theme_id=>3
,p_name=>'REGIONCONTAINSITEMSTEXT'
,p_display_name=>'Region Contains Items / Text'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(728272729796557092.4703)
,p_css_classes=>'a-ButtonRegion--withItems'
,p_template_types=>'REGION'
,p_help_text=>'Check this option if this region contains items or text.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(728277248569557122.4703)
,p_theme_id=>3
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(728272729796557092.4703)
,p_css_classes=>'a-ButtonRegion--noUI'
,p_group_id=>wwv_flow_imp.id(728274811074557119.4703)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(728277525479557122.4703)
,p_theme_id=>3
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(728272729796557092.4703)
,p_css_classes=>'a-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_imp.id(728274811074557119.4703)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(728277818941557122.4703)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(728272729796557092.4703)
,p_css_classes=>'a-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_imp.id(728273812208557117.4703)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(728278146450557122.4703)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(728272729796557092.4703)
,p_css_classes=>'a-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_imp.id(728273812208557117.4703)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(728278498295557123.4703)
,p_theme_id=>3
,p_name=>'WIZARDDIALOG'
,p_display_name=>'Used for Wizard Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(728272729796557092.4703)
,p_css_classes=>'a-ButtonRegion--wizard'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(728278798769557123.4703)
,p_theme_id=>3
,p_name=>'VISIBLE'
,p_display_name=>'Visible'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(728272729796557092.4703)
,p_css_classes=>'a-ButtonRegion--showTitle'
,p_group_id=>wwv_flow_imp.id(728273198308557106.4703)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(728279089427557123.4703)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(728272729796557092.4703)
,p_css_classes=>'a-ButtonRegion--accessibleTitle'
,p_group_id=>wwv_flow_imp.id(728273198308557106.4703)
,p_template_types=>'REGION'
,p_help_text=>'Use this option to add a visually hidden heading which is accessible for screen readers, but otherwise not visible to users.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746435033845421149.4703)
,p_theme_id=>3
,p_name=>'180PX'
,p_display_name=>'180px'
,p_display_sequence=>10
,p_css_classes=>'h180'
,p_group_id=>wwv_flow_imp.id(746434995533421149.4703)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746435216989421149.4703)
,p_theme_id=>3
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>20
,p_css_classes=>'h240'
,p_group_id=>wwv_flow_imp.id(746434995533421149.4703)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746435405988421149.4703)
,p_theme_id=>3
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>30
,p_css_classes=>'h320'
,p_group_id=>wwv_flow_imp.id(746434995533421149.4703)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746435656825421149.4703)
,p_theme_id=>3
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>50
,p_css_classes=>'h480'
,p_group_id=>wwv_flow_imp.id(746434995533421149.4703)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746435848002421149.4703)
,p_theme_id=>3
,p_name=>'540PX'
,p_display_name=>'540px'
,p_display_sequence=>60
,p_css_classes=>'h540'
,p_group_id=>wwv_flow_imp.id(746434995533421149.4703)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746436091506421149.4703)
,p_theme_id=>3
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>70
,p_css_classes=>'h640'
,p_group_id=>wwv_flow_imp.id(746434995533421149.4703)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746436368676421149.4703)
,p_theme_id=>3
,p_name=>'ALIGNLABELSLEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Form--leftLabels'
,p_group_id=>wwv_flow_imp.id(746436279201421149.4703)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746436678574421149.4703)
,p_theme_id=>3
,p_name=>'AUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form--autoWidthLabels'
,p_group_id=>wwv_flow_imp.id(746436594439421149.4703)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746436965719421149.4703)
,p_theme_id=>3
,p_name=>'FIRSTBUTTON'
,p_display_name=>'First Button'
,p_display_sequence=>1
,p_css_classes=>'a-Button--pillStart'
,p_group_id=>wwv_flow_imp.id(746436840999421149.4703)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746437112234421149.4703)
,p_theme_id=>3
,p_name=>'FIXEDLARGE'
,p_display_name=>'Fixed (Large Width)'
,p_display_sequence=>30
,p_css_classes=>'a-Form-fixedLabelsLarge'
,p_group_id=>wwv_flow_imp.id(746436594439421149.4703)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746437368469421149.4703)
,p_theme_id=>3
,p_name=>'FIXEDMEDIUM'
,p_display_name=>'Fixed (Medium Width)'
,p_display_sequence=>20
,p_css_classes=>'a-Form-fixedLabelsMed'
,p_group_id=>wwv_flow_imp.id(746436594439421149.4703)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746437581881421150.4703)
,p_theme_id=>3
,p_name=>'FIXEDWIDTH'
,p_display_name=>'Fixed'
,p_display_sequence=>10
,p_css_classes=>'a-Form--fixedLabels'
,p_group_id=>wwv_flow_imp.id(746436594439421149.4703)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746437748876421150.4703)
,p_theme_id=>3
,p_name=>'INNERBUTTON'
,p_display_name=>'Inner Button'
,p_display_sequence=>2
,p_css_classes=>'a-Button--pill'
,p_group_id=>wwv_flow_imp.id(746436840999421149.4703)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746438058857421151.4703)
,p_theme_id=>3
,p_name=>'LABELAUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--autoLabelWidth'
,p_group_id=>wwv_flow_imp.id(746437988722421151.4703)
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746438384706421151.4703)
,p_theme_id=>3
,p_name=>'LABELSABOVE'
,p_display_name=>'Labels Above'
,p_display_sequence=>1
,p_css_classes=>'a-Form--labelsAbove'
,p_group_id=>wwv_flow_imp.id(746438219342421151.4703)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746438655416421151.4703)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>3
,p_css_classes=>'a-Button--large'
,p_group_id=>wwv_flow_imp.id(746438589659421151.4703)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746438901201421151.4703)
,p_theme_id=>3
,p_name=>'LARGELEFT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapLeft'
,p_group_id=>wwv_flow_imp.id(746438816241421151.4703)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746439281590421151.4703)
,p_theme_id=>3
,p_name=>'LARGERIGHT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapRight'
,p_group_id=>wwv_flow_imp.id(746439137924421151.4703)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746439479283421151.4703)
,p_theme_id=>3
,p_name=>'LASTBUTTON'
,p_display_name=>'Last Button'
,p_display_sequence=>3
,p_css_classes=>'a-Button--pillEnd'
,p_group_id=>wwv_flow_imp.id(746436840999421149.4703)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746439725429421152.4703)
,p_theme_id=>3
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(746439645845421152.4703)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746440034159421152.4703)
,p_theme_id=>3
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>1
,p_css_classes=>'a-Button--primary'
,p_group_id=>wwv_flow_imp.id(746439918130421152.4703)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746440162594421152.4703)
,p_theme_id=>3
,p_name=>'REGIONHEADERBUTTON'
,p_display_name=>'Button in Region Header'
,p_display_sequence=>1
,p_css_classes=>'a-Button--regionHeader'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746440362741421152.4703)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--small'
,p_group_id=>wwv_flow_imp.id(746438589659421151.4703)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746440520463421152.4703)
,p_theme_id=>3
,p_name=>'SMALLLEFT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padLeft'
,p_group_id=>wwv_flow_imp.id(746438816241421151.4703)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746440758010421152.4703)
,p_theme_id=>3
,p_name=>'SMALLRIGHT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padRight'
,p_group_id=>wwv_flow_imp.id(746439137924421151.4703)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746440822788421152.4703)
,p_theme_id=>3
,p_name=>'STRETCHFORMFIELD'
,p_display_name=>'Stretch Form Field'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--stretch'
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746440925815421152.4703)
,p_theme_id=>3
,p_name=>'STRONGBUTTONLABEL'
,p_display_name=>'Strong Button Label'
,p_display_sequence=>1
,p_css_classes=>'a-Button--strongLabel'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1199561525047032426.4703)
,p_theme_id=>3
,p_name=>'LEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_button_template_id=>wwv_flow_imp.id(481975658518888812.4703)
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(746439645845421152.4703)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554852920727542292.4703)
,p_theme_id=>3
,p_name=>'FLUSHREGION'
,p_display_name=>'Flush Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(728280005939557124.4703)
,p_css_classes=>'a-Region--flush'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554853081668542293.4703)
,p_theme_id=>3
,p_name=>'STACKEDREGION'
,p_display_name=>'Stacked Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(728280005939557124.4703)
,p_css_classes=>'a-Region--stacked'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554853269909542294.4703)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(728280005939557124.4703)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_imp.id(728273812208557117.4703)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554853498802542294.4703)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(728280005939557124.4703)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_imp.id(728273812208557117.4703)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554853672639542294.4703)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(728280005939557124.4703)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_imp.id(728284958660557127.4703)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554853833133542294.4703)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(728280005939557124.4703)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(728274811074557119.4703)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554854022496542294.4703)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(728280005939557124.4703)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_imp.id(728281789702557125.4703)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554854201680542294.4703)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(728280005939557124.4703)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_imp.id(728281789702557125.4703)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554854474957542294.4703)
,p_theme_id=>3
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>.1
,p_region_template_id=>wwv_flow_imp.id(728280005939557124.4703)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_imp.id(728282779546557126.4703)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554854632648542294.4703)
,p_theme_id=>3
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(728280005939557124.4703)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_imp.id(728282779546557126.4703)
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
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(46948758488708852.4703)
,p_build_option_name=>'company address'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>37165770887393
,p_build_option_comment=>'we can avoid asking internal Oracle folks for address info'
);
end;
/
prompt --application/shared_components/globalization/messages
begin
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(121161551456667899)
,p_name=>'APEX.PAGE_ITEM_IS_REQUIRED'
,p_message_language=>'de'
,p_message_text=>'#LABEL# ist erforderlich.'
,p_version_scn=>2566415
);
end;
/
prompt --application/shared_components/globalization/dyntranslations
begin
null;
end;
/
prompt --application/shared_components/user_interface/shortcuts/item_help
begin
wwv_flow_imp_shared.create_shortcut(
 p_id=>wwv_flow_imp.id(187203309767569784.4703)
,p_shortcut_name=>'ITEM_HELP'
,p_shortcut_type=>'HTML_TEXT'
,p_error_text=>unistr('Anzeigen der Hilfe nicht m\00F6glich.')
,p_version_scn=>2609964
,p_shortcut=>'<a href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999" title="Hilfe zu diesem Element."><img src="#IMAGE_PREFIX#infoicon_status_gray.gif" width="16" height="16" /></a>'
);
end;
/
prompt --application/shared_components/security/authentications/database
begin
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(108165525079033088.4703)
,p_name=>'Database'
,p_scheme_type=>'NATIVE_DAD'
,p_cookie_name=>'ORA_WWV_USER_&INSTANCE_ID.'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_version_scn=>75558022
,p_comments=>'Based on authentication scheme from gallery:No Authentication (using DAD)'
);
end;
/
prompt --application/shared_components/security/authentications/internal_authentication
begin
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(766219159606055235.4703)
,p_name=>'Internal Authentication'
,p_scheme_type=>'PLUGIN_COM.ORACLE.APEX.AUTHN.INTERNAL.APEX'
,p_invalid_session_type=>'LOGIN'
,p_logout_url=>'f?p=4550:8:&SESSION.'
,p_cookie_name=>'ORA_WWV_USER_&INSTANCE_ID.'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_version_scn=>2609965
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_social
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(118592600337930248.4703)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.SOCIAL'
,p_display_name=>'INTERNAL - Social Sign-In'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.SOCIAL'),'')
,p_api_version=>2
,p_ajax_function=>'wwv_flow_authentication_dev.plugin_callback_social'
,p_session_sentry_function=>'wwv_flow_authentication_dev.plugin_sentry_social'
,p_invalid_session_function=>'wwv_flow_authentication_dev.plugin_invalid_session_social'
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_social'
,p_post_logout_function=>'wwv_flow_authentication_dev.plugin_post_logout_social'
,p_substitute_attributes=>true
,p_version_scn=>2609964
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(416848730038942515.4703)
,p_plugin_id=>wwv_flow_imp.id(118592600337930248.4703)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Authentication Provider'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'OPENID_CONNECT'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(416849148847942516.4703)
,p_plugin_attribute_id=>wwv_flow_imp.id(416848730038942515.4703)
,p_display_sequence=>10
,p_display_value=>'OpenID Connect Provider'
,p_return_value=>'OPENID_CONNECT'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(416849661785942516.4703)
,p_plugin_attribute_id=>wwv_flow_imp.id(416848730038942515.4703)
,p_display_sequence=>20
,p_display_value=>'Generic OAuth2 Provider'
,p_return_value=>'OAUTH2'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(416850170886942516.4703)
,p_plugin_attribute_id=>wwv_flow_imp.id(416848730038942515.4703)
,p_display_sequence=>30
,p_display_value=>'Google'
,p_return_value=>'GOOGLE'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(416850699117942517.4703)
,p_plugin_attribute_id=>wwv_flow_imp.id(416848730038942515.4703)
,p_display_sequence=>40
,p_display_value=>'Facebook'
,p_return_value=>'FACEBOOK'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(416851189591942517.4703)
,p_plugin_id=>wwv_flow_imp.id(118592600337930248.4703)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Discovery URL'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(416848730038942515.4703)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'OPENID_CONNECT'
,p_examples=>'https://accounts.example.com/.well-known/openid-configuration'
,p_help_text=>'Enter the OpenID Connect provider''s discovery URL.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(416851551045942517.4703)
,p_plugin_id=>wwv_flow_imp.id(118592600337930248.4703)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Authorization Endpoint URL'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(416848730038942515.4703)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'OAUTH2'
,p_help_text=>'Enter the OAuth2 provider''s authorization endpoint URL.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(416851957058942518.4703)
,p_plugin_id=>wwv_flow_imp.id(118592600337930248.4703)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Token Endpoint URL'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(416848730038942515.4703)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'OAUTH2'
,p_help_text=>'Enter the OAuth2 provider''s token endpoint URL.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(416852302749942518.4703)
,p_plugin_id=>wwv_flow_imp.id(118592600337930248.4703)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'User Info Endpoint URL'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(416848730038942515.4703)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'OAUTH2'
,p_help_text=>'Enter the OAuth2 provider''s user info endpoint URL.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(416852784836942518.4703)
,p_plugin_id=>wwv_flow_imp.id(118592600337930248.4703)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Scope'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'profile'
,p_is_translatable=>false
,p_help_text=>'Enter a comma separated list of permissions to request for the user who is logging in. The acceptable values depend on your authentication provider. For OpenID Connect and Google, Oracle APEX automatically adds the "openid" scope. The authentication '
||'provider returns user attributes based on these permissions. You can use a Post Authentication procedure to process these attributes, using the APEX_JSON.GET_% functions.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(416853131571942518.4703)
,p_plugin_id=>wwv_flow_imp.id(118592600337930248.4703)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Authentication URI Parameters'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'Enter optional parameters for the authentication URI. Consult the authentication provider''s documentation for supported parameters.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(416853561778942519.4703)
,p_plugin_id=>wwv_flow_imp.id(118592600337930248.4703)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_prompt=>'Username Attribute'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'email'
,p_is_translatable=>false
,p_help_text=>'Enter the attribute which contains the username. Consult the authentication provider''s documentation for supported attributes.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(416853905557942519.4703)
,p_plugin_id=>wwv_flow_imp.id(118592600337930248.4703)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>100
,p_prompt=>'Additional User Attributes'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'Enter a comma separated list of additional user data attributes. Consult the authentication provider''s documentation for supported attributes.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(416854358382942519.4703)
,p_plugin_id=>wwv_flow_imp.id(118592600337930248.4703)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>110
,p_prompt=>'Logout URL'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Use this attribute to specify a URL to log out from your authentication provider.',
'For <em>OpenID Connect</em>, &PRODUCT_NAME. automatically uses the <em>end_session</em> endpoint, if that is defined in the <em>Discovery URL</em>.',
'For others, you can use #ID_TOKEN# and #REDIRECT_URI# in the URL, to substitute the ID token that was returned when logging in and the full URL to /apex on your instance, e.g. https://www.example.com/apex/apex.',
'Note that the redirect URI often has to be registered with your authentication provider.'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(416854770075942519.4703)
,p_plugin_id=>wwv_flow_imp.id(118592600337930248.4703)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>65
,p_prompt=>'Token Authentication Method'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'BASIC_AND_CLID'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(416848730038942515.4703)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'OAUTH2'
,p_lov_type=>'STATIC'
,p_help_text=>'Enter how the credential''s client ID and client secret should be passed to the server.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(416855148060942520.4703)
,p_plugin_attribute_id=>wwv_flow_imp.id(416854770075942519.4703)
,p_display_sequence=>10
,p_display_value=>'Basic Authentication'
,p_return_value=>'BASIC'
,p_help_text=>'Send client id and client secret in a Basic Authentication header.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(416855638295942520.4703)
,p_plugin_attribute_id=>wwv_flow_imp.id(416854770075942519.4703)
,p_display_sequence=>20
,p_display_value=>'Basic Authentication and Client ID in Body'
,p_return_value=>'BASIC_AND_CLID'
,p_help_text=>'Send client id and client secret in a Basic Authentication header, but also send client it in the request body.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(416856100635942520.4703)
,p_plugin_attribute_id=>wwv_flow_imp.id(416854770075942519.4703)
,p_display_sequence=>30
,p_display_value=>'Client ID and Client Secret in Body'
,p_return_value=>'BODY'
,p_help_text=>'Send client id and client secret in the request body.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(416856612426942521.4703)
,p_plugin_attribute_id=>wwv_flow_imp.id(416854770075942519.4703)
,p_display_sequence=>40
,p_display_value=>'Client ID in Body'
,p_return_value=>'CLID'
,p_help_text=>'Only send client id in the request body.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(416857126648942521.4703)
,p_plugin_id=>wwv_flow_imp.id(118592600337930248.4703)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>13
,p_display_sequence=>91
,p_prompt=>'Verify Username'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>true
,p_default_value=>'Y'
,p_is_translatable=>false
,p_help_text=>'If enabled, &PRODUCT_NAME. will look for an attribute "#username#_verified" (for example, "email_verified" for Username Attribute "email"). If the value of this attribute is set to "false", the username will not be accepted.'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_apex
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(766196516105997136.4703)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.APEX'
,p_display_name=>'INTERNAL - Oracle APEX-Accounts'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.APEX'),'')
,p_api_version=>1
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_apex'
,p_standard_attributes=>'INVALID_SESSION:LOGIN_PAGE'
,p_substitute_attributes=>true
,p_version_scn=>2609964
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_db
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(766196759876997170.4703)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.DB'
,p_display_name=>'INTERNAL - Datenbankaccounts'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.DB'),'')
,p_api_version=>1
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_db'
,p_standard_attributes=>'LOGIN_PAGE'
,p_substitute_attributes=>true
,p_version_scn=>2609964
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_header
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(766197021878997171.4703)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.HEADER'
,p_display_name=>'INTERNAL - HTTP-Headervariable'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.HEADER'),'')
,p_api_version=>1
,p_ajax_function=>'wwv_flow_authentication_dev.plugin_callback_header'
,p_session_sentry_function=>'wwv_flow_authentication_dev.plugin_sentry_header'
,p_invalid_session_function=>'wwv_flow_authentication_dev.plugin_invalid_session_header'
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_header'
,p_post_logout_function=>'wwv_flow_authentication_dev.plugin_post_logout_header'
,p_standard_attributes=>'LOGIN_PAGE'
,p_substitute_attributes=>true
,p_version_scn=>2609964
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(308190528687529862.4703)
,p_plugin_id=>wwv_flow_imp.id(766197021878997171.4703)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'HTTP Header Variable Name'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'OAM_REMOTE_USER'
,p_display_length=>30
,p_max_length=>255
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Specifies the name of the HTTP header variable which contains the username.',
'The default OAM_REMOTE_USER is used by Oracle Access Manager and has to be changed',
'if another authentication provider is used.</p>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(308190917299529862.4703)
,p_plugin_id=>wwv_flow_imp.id(766197021878997171.4703)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Action if Username is Empty'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'BUILTIN_URL'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'Specifies the action which should be performed if the username stored in the HTTP header variable is empty. The following options are available:',
'</p>',
'<p>',
'<ul>',
'  <li><strong>Redirect to Built-In URL</strong> to initiate a login by the web server. This Built-In URL has to be setup to be protected by the web server, in order to force a login when called. After login, the web server must store the validated us'
||'ername in the HTTP header variable, so it is available to the authentication scheme. The Built-In URL is',
'<pre>/apex/apex_authentication.callback</pre>',
'The prefix <code>/apex/</code> depends on your server configuration.',
'</li>',
'  <li><strong>Redirect to URL</strong> to initiate a login on an external server which then sets the validated username in the HTTP header variable. The external server should redirect back to the application using the URL generated by the <code>#CAL'
||'LBACK#</code> placeholder to complete authentication in the application.</li>',
'  <li><strong>Display Error</strong> will display the specified error message and no login will be performed in the application.</li>',
'</ul>',
'</p>'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(308191304782529863.4703)
,p_plugin_attribute_id=>wwv_flow_imp.id(308190917299529862.4703)
,p_display_sequence=>10
,p_display_value=>'Redirect to Built-In URL'
,p_return_value=>'BUILTIN_URL'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(308191848079529863.4703)
,p_plugin_attribute_id=>wwv_flow_imp.id(308190917299529862.4703)
,p_display_sequence=>20
,p_display_value=>'Redirect to URL'
,p_return_value=>'URL'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(308192371618529863.4703)
,p_plugin_attribute_id=>wwv_flow_imp.id(308190917299529862.4703)
,p_display_sequence=>30
,p_display_value=>'Display Error'
,p_return_value=>'ERROR'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(308192860636529864.4703)
,p_plugin_id=>wwv_flow_imp.id(766197021878997171.4703)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'URL'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>60
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(308190917299529862.4703)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'URL'
,p_examples=>'http://sso.example.com/?success=#CALLBACK#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'Specifies the URL of an external login server which sets the validated username in the HTTP header variable. The external server should redirect back to the application using the URL generated by the <code>#CALLBACK#</code> placeholder to complete au'
||'thentication in the application.',
'</p>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(308193214032529864.4703)
,p_plugin_id=>wwv_flow_imp.id(766197021878997171.4703)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Error Message'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>true
,p_display_length=>60
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_imp.id(308190917299529862.4703)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'ERROR'
,p_help_text=>'Specifies the error message to be displayed if the HTTP header variable does not contain a value or the HTTP header variable does not exist.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(308193698677529864.4703)
,p_plugin_id=>wwv_flow_imp.id(766197021878997171.4703)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Verify Username'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'ALWAYS'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'Specifies how often the username stored in the HTTP header variable is verified. The following options are available:',
'</p>',
'<p>',
'<ul>',
'  <li><strong>Each Request</strong> will expect that the CGI variable is always set as soon as the login has been performed by the web server. If the username is not identical to the one stored in the current &PRODUCT_NAME. session, the session will '
||'be invalidated and a new login will be initiated. This is the most secure option because it detects logouts or username changes.',
'  </li>',
'  <li><strong>After Login</strong> will only verify and store the username in the &PRODUCT_NAME. session after the web server has performed the login and calls the callback to complete authentication in the application. For callback see "Action if Us'
||'ername is Empty" configuration.',
'  </li>',
'</ul>',
'</p>'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(308194046037529865.4703)
,p_plugin_attribute_id=>wwv_flow_imp.id(308193698677529864.4703)
,p_display_sequence=>10
,p_display_value=>'Each Request'
,p_return_value=>'ALWAYS'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(308194566576529865.4703)
,p_plugin_attribute_id=>wwv_flow_imp.id(308193698677529864.4703)
,p_display_sequence=>20
,p_display_value=>'After Login'
,p_return_value=>'CALLBACK'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(308195031696529865.4703)
,p_plugin_id=>wwv_flow_imp.id(766197021878997171.4703)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Logout URL of SSO Server'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'If the authentication scheme is based on Oracle Access Manager or similar servers,',
'you can use this attribute to specify a URL to log out of the central single sign-on server.',
'<p/>',
'For Oracle Access Manager based SSO, enter for example',
'<pre>',
'/oamsso/logout.html?end_url=%POST_LOGOUT_URL%',
'</pre>',
'The substitution parameter <strong>%POST_LOGOUT_URL%</strong> will be replaced by an encoded URL to the login page of your application.'))
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_ldap
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(766203167836997187.4703)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.LDAP'
,p_display_name=>'INTERNAL - LDAP-Verzeichnis'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.LDAP'),'')
,p_api_version=>1
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_ldap'
,p_standard_attributes=>'INVALID_SESSION:LOGIN_PAGE'
,p_substitute_attributes=>true
,p_version_scn=>2609964
,p_subscribe_plugin_settings=>true
,p_help_text=>unistr('<p>Geben Sie den Benutzernamen und das Kennwort f\00FCr die Authentifizierung beim LDAP-Verzeichnis ein, das auf der Anmeldeseite angegeben wird. Beachten Sie, dass bei der Kennworteingabe m\00F6glicherweise zwischen Gro\00DF- und Kleinschreibung unterschieden w')
||'ird.</p>'
,p_version_identifier=>'1.0'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(766203355186997187.4703)
,p_plugin_id=>wwv_flow_imp.id(766203167836997187.4703)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Host'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>40
,p_max_length=>255
,p_is_translatable=>false
,p_help_text=>'The hostname of your LDAP directory server.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(766203742780997187.4703)
,p_plugin_id=>wwv_flow_imp.id(766203167836997187.4703)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Port'
,p_attribute_type=>'INTEGER'
,p_is_required=>false
,p_display_length=>6
,p_max_length=>10
,p_is_translatable=>false
,p_help_text=>'The port number of your LDAP directory host. The default is 389.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(766204192689997188.4703)
,p_plugin_id=>wwv_flow_imp.id(766203167836997187.4703)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Use SSL'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'NO_SSL'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Choose whether to use SSL to bind to the LDAP directory. If SSL with Authentication is chosen, a wallet must be configured for the &PRODUCT_NAME. instance.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(766204501729997188.4703)
,p_plugin_attribute_id=>wwv_flow_imp.id(766204192689997188.4703)
,p_display_sequence=>10
,p_display_value=>'SSL'
,p_return_value=>'SSL'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(766205090281997190.4703)
,p_plugin_attribute_id=>wwv_flow_imp.id(766204192689997188.4703)
,p_display_sequence=>20
,p_display_value=>'SSL with Authentication'
,p_return_value=>'SSL_AUTH'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(766205526368997190.4703)
,p_plugin_attribute_id=>wwv_flow_imp.id(766204192689997188.4703)
,p_display_sequence=>30
,p_display_value=>'No SSL'
,p_return_value=>'NO_SSL'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(766206087018997190.4703)
,p_plugin_id=>wwv_flow_imp.id(766203167836997187.4703)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Distinguished Name (DN) String'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>40
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter the pattern used to construct the fully qualified distinguished name (DN) string to DBMS_LDAP.SIMPLE_BIND_S if using exact DN or the search base if using non-exact DN. Use <strong>%LDAP_USER%</strong> as a placeholder for the username.  For exa'
||'mple:',
'<p>',
'<strong>Exact DN</strong>',
'</p>',
'<p>',
'cn=%LDAP_USER%,l=amer,dc=yourdomain,dc=com',
'</p>',
'<p>',
'<strong>Non-Exact DN (Search Base)</strong>',
'</p>',
'<p>',
'dc=yourdomain,dc=com',
'</p>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(766206425955997191.4703)
,p_plugin_id=>wwv_flow_imp.id(766203167836997187.4703)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Use Exact Distinguished Name (DN)'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
,p_help_text=>'Choose whether the LDAP Distinguished Name (DN) String is exact or non-exact. If non-exact, LDAP Distinguished Name (DN) is the search base and you must supply a Search Filter.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(766206835038997191.4703)
,p_plugin_id=>wwv_flow_imp.id(766203167836997187.4703)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Search Filter'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>40
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(766206425955997191.4703)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'N'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Enter the search filter when not using an exact distinguished name (DN). Use <strong>%LDAP_USER%</strong> as a place-holder for the username. For example:',
'</p>',
'<p><pre>cn=%LDAP_USER%</pre></p>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(766207286081997191.4703)
,p_plugin_id=>wwv_flow_imp.id(766203167836997187.4703)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'LDAP Username Edit Function'
,p_attribute_type=>'PLSQL FUNCTION BODY'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'You may provide additional code to be executed to transform the username into a format perfectly suited to the LDAP directory entry or LDAP username.',
'The bind variable :USERNAME contains the name the end user specified.',
'For example, the following code calls a function which replaces all "."''s with "_"''s in the DN string:</p>',
'',
'<p><pre>',
'return apex_custom_auth.ldap_dnprep(p_username => :USERNAME);',
'</pre></p>',
'',
'<p>&PRODUCT_NAME. will escape the returned username based on the authentication attribute <strong>Username Escaping</strong>.'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(766207666923997191.4703)
,p_plugin_id=>wwv_flow_imp.id(766203167836997187.4703)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Username Escaping'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'STD'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Before replacing <strong>%LDAP_USER%</strong> in the LDAP distinguished name and search string,',
'&PRODUCT_NAME. can automatically escape special characters in the username.',
'<p/>',
'The possible rules for escaping are:',
'<ul>',
'<li><strong>Standard</strong>:',
'Escape special characters based on RFC 4514 (for distinguished names) and RFC 4515 (for search strings).',
'Additionally, escape unicode characters.',
'This is the most secure setting, but may cause problems with some LDAP servers.</li>',
'<li><strong>Only special characters</strong>:',
'Escape special characters based on RFC 4514 (for distinguished names) and RFC 4515 (for search strings).',
'Do not escape unicode characters.</li>',
'<li><strong>No escaping</strong>:',
'Do not escape any characters.',
'This setting is potentially insecure,',
'unless a <strong>Username Edit Function</strong> is employed that already',
'escapes the username (for example with apex_escape.ldap_dn or apex_escape.ldap_search_filter).</li>',
'</ul>'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(766208002519997192.4703)
,p_plugin_attribute_id=>wwv_flow_imp.id(766207666923997191.4703)
,p_display_sequence=>10
,p_display_value=>'Standard'
,p_return_value=>'STD'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(766208532334997192.4703)
,p_plugin_attribute_id=>wwv_flow_imp.id(766207666923997191.4703)
,p_display_sequence=>20
,p_display_value=>'Only special characters'
,p_return_value=>'ONLY'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(766209088734997192.4703)
,p_plugin_attribute_id=>wwv_flow_imp.id(766207666923997191.4703)
,p_display_sequence=>30
,p_display_value=>'No Escaping'
,p_return_value=>'NO'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_sso
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(766209839828997194.4703)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.SSO'
,p_display_name=>'INTERNAL - Oracle Application Server Single Sign-On'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.SSO'),'')
,p_api_version=>1
,p_ajax_function=>'wwv_flow_authentication_dev.plugin_callback_osso'
,p_session_sentry_function=>'wwv_flow_authentication_dev.plugin_sentry_osso'
,p_invalid_session_function=>'wwv_flow_authentication_dev.plugin_invalid_session_osso'
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_osso'
,p_post_logout_function=>'wwv_flow_authentication_dev.plugin_post_logout_osso'
,p_standard_attributes=>'INVALID_SESSION:LOGIN_PAGE'
,p_substitute_attributes=>true
,p_version_scn=>2609964
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_cloud_idm
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(766210172744997195.4703)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.CLOUD_IDM'
,p_display_name=>'INTERNAL - Oracle Cloud Identity Management'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.CLOUD_IDM'),'')
,p_api_version=>1
,p_ajax_function=>'wwv_flow_authentication_dev.plugin_callback_cloud'
,p_session_sentry_function=>'wwv_flow_authentication_dev.plugin_sentry_cloud'
,p_invalid_session_function=>'wwv_flow_authentication_dev.plugin_invalid_session_cloud'
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_cloud'
,p_post_logout_function=>'wwv_flow_authentication_dev.plugin_post_logout_cloud'
,p_standard_attributes=>'LOGIN_PAGE'
,p_substitute_attributes=>true
,p_version_scn=>2609964
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/shared_components/plugins/item_type/com_oracle_apex_wizard_selection
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(805561388021651744.4703)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'COM.ORACLE.APEX.WIZARD_SELECTION'
,p_display_name=>'Assistentenauswahl'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('ITEM TYPE','COM.ORACLE.APEX.WIZARD_SELECTION'),'')
,p_api_version=>1
,p_render_function=>'wwv_flow_f4000_plugins.render_wizard_selection'
,p_ajax_function=>'wwv_flow_f4000_plugins.ajax_wizard_selection'
,p_standard_attributes=>'VISIBLE:SESSION_STATE:SOURCE:ELEMENT:LOV:CASCADING_LOV'
,p_substitute_attributes=>true
,p_version_scn=>2609964
,p_subscribe_plugin_settings=>true
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(805561682413651902.4703)
,p_plugin_id=>wwv_flow_imp.id(805561388021651744.4703)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_static_id=>'attribute_01'
,p_prompt=>'Icon Size'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'S'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(805562091226651903.4703)
,p_plugin_attribute_id=>wwv_flow_imp.id(805561682413651902.4703)
,p_display_sequence=>10
,p_display_value=>'Small'
,p_return_value=>'S'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(805562552885651903.4703)
,p_plugin_attribute_id=>wwv_flow_imp.id(805561682413651902.4703)
,p_display_sequence=>20
,p_display_value=>'Medium'
,p_return_value=>'M'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(805563001543651903.4703)
,p_plugin_attribute_id=>wwv_flow_imp.id(805561682413651902.4703)
,p_display_sequence=>30
,p_display_value=>'Large'
,p_return_value=>'L'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(805563507507651905.4703)
,p_plugin_id=>wwv_flow_imp.id(805561388021651744.4703)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_static_id=>'attribute_02'
,p_prompt=>'Submit Page'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
,p_help_text=>'Select whether or not to submit the page when making a selection'
);
wwv_flow_imp_shared.create_plugin_std_attribute(
 p_id=>wwv_flow_imp.id(845155894988834530.4703)
,p_plugin_id=>wwv_flow_imp.id(805561388021651744.4703)
,p_name=>'LOV'
,p_sql_min_column_count=>2
,p_sql_max_column_count=>2
);
end;
/
prompt --application/user_interfaces/combined_files
begin
null;
end;
/
prompt --application/pages/page_00000
begin
wwv_flow_imp_page.create_page(
 p_id=>.4703
,p_name=>'0'
,p_step_title=>'0'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_step_template=>wwv_flow_imp.id(728298792391563586.4703)
,p_page_template_options=>'#DEFAULT#'
,p_nav_list_template_options=>'#DEFAULT#'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(384692482059932839.4703)
,p_plug_name=>'APEX 5 - Header'
,p_region_css_classes=>'a-Header'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481965601614717220.4703)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_07'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="f?p=4000:1500:&APP_SESSION." class="a-Header-logo" title="Home">',
'  <span role="img" aria-label="Oracle APEX" class="a-Header-apexLogo"></span>',
'</a>'))
,p_translate_title=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
end;
/
prompt --application/pages/page_00002
begin
wwv_flow_imp_page.create_page(
 p_id=>2.4703
,p_name=>'Workspace anfordern - Zweite Seite'
,p_alias=>'REQUEST-WORKSPACE'
,p_step_title=>'Workspace anfordern - &PRODUCT_NAME.'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_step_template=>wwv_flow_imp.id(728298792391563586.4703)
,p_page_css_classes=>'a-Page--requestWorkspace'
,p_page_template_options=>'#DEFAULT#'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(624348233786280075.4703)
,p_plug_name=>'Workspace anfordern'
,p_region_css_classes=>'a-Wizard--requestWorkspace'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481970015003751305.4703)
,p_plug_display_sequence=>10
,p_landmark_label=>'Workspace-Assistenten anfordern'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(624348462275280075.4703)
,p_plug_name=>'Assistentenfortschrittsleiste'
,p_parent_plug_id=>wwv_flow_imp.id(624348233786280075.4703)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481969298650741033.4703)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_landmark_type=>'navigation'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(624348630378280075.4703)
,p_plug_name=>'Wizard Progress List'
,p_parent_plug_id=>wwv_flow_imp.id(624348462275280075.4703)
,p_region_sub_css_classes=>'a-WizardSteps--displayCurrentLabelOnly'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_list_id=>wwv_flow_imp.id(4762183464.4703)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(481972912021825750.4703)
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(624348871164280076.4703)
,p_plug_name=>'Wizard Form'
,p_parent_plug_id=>wwv_flow_imp.id(624348233786280075.4703)
,p_region_css_classes=>'a-Wizard-body a-Form a-Form--large'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481965601614717220.4703)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'BELOW'
,p_translate_title=>'N'
,p_landmark_type=>'form'
,p_landmark_label=>'ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(825273288998768702.4703)
,p_plug_name=>'Basic Info'
,p_parent_plug_id=>wwv_flow_imp.id(624348871164280076.4703)
,p_region_css_classes=>'region-basic-info'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481965601614717220.4703)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(825273361595768703.4703)
,p_plug_name=>'Usage Info'
,p_parent_plug_id=>wwv_flow_imp.id(624348871164280076.4703)
,p_region_css_classes=>'region-usage-info'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481965601614717220.4703)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>'sys.htp.p(''<div class="a-Request-privacyPolicy">''||wwv_flow_lang.system_message(''WS_SIGNUP.PRIVACY_POLICY'')||''</div>'');'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_imp.id(825492061062393977)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(825273467161768704.4703)
,p_plug_name=>'Terms of Use'
,p_parent_plug_id=>wwv_flow_imp.id(624348871164280076.4703)
,p_region_css_classes=>'region-terms-of-use'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481965601614717220.4703)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(624350429513280083.4703)
,p_plug_name=>unistr('Assistentenschaltfl\00E4chen')
,p_parent_plug_id=>wwv_flow_imp.id(624348233786280075.4703)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481969298650741033.4703)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(624350696578280086.4703)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(624350429513280083.4703)
,p_button_name=>'P2_NEXT'
,p_button_static_id=>'P2_NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(481975658518888812.4703)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Weiter'
,p_button_position=>'NEXT'
,p_button_css_classes=>'a-Button--large a-Button--largeIcon a-Button--strongLabel'
,p_icon_css_classes=>'icon-right-chevron'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(624391705621329097.4703)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(624350429513280083.4703)
,p_button_name=>'P2_PREVIOUS'
,p_button_static_id=>'P2_PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(481976264382888813.4703)
,p_button_image_alt=>unistr('Zur\00FCck')
,p_button_position=>'PREVIOUS'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from wwv_flow_prov_signup_q',
'where pkg_app_only_ws_yn = ''N'''))
,p_button_condition_type=>'NOT_EXISTS'
,p_button_css_classes=>'a-Button--large a-Button--largeIcon a-Button--padRight'
,p_icon_css_classes=>'icon-left-chevron'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(624350869612280090.4703)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(624350429513280083.4703)
,p_button_name=>'P2_CANCEL'
,p_button_static_id=>'P2_CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(481975242743888810.4703)
,p_button_image_alt=>'Abbrechen'
,p_button_position=>'PREVIOUS'
,p_button_execute_validations=>'N'
,p_button_css_classes=>'a-Button--large'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(624352524796280096.4703)
,p_branch_name=>'Go To Page 25 (Schema)'
,p_branch_action=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(624350696578280086.4703)
,p_branch_sequence=>10
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'SHOW_SCHEMA_YN'
,p_branch_condition_text=>'Y'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(74099388176078401.4703)
,p_branch_name=>'Go to Page 24 (Survey)'
,p_branch_action=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(624350696578280086.4703)
,p_branch_sequence=>20
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where SURVEY_ENABLED_YN = ''Y'''
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(825273520608768705.4703)
,p_branch_name=>'Got to Page 27 (Justification)'
,p_branch_action=>'f?p=&APP_ID.:27:&SESSION.::&DEBUG.:RP,::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(624350696578280086.4703)
,p_branch_sequence=>40
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where nvl(JUSTIFICATION_REQUIRED_YN,''N'') = ''Y'' and id = 1'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(711861644632245744.4703)
,p_branch_name=>'Got to Page 28 (Terms)'
,p_branch_action=>'f?p=&APP_ID.:28:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(624350696578280086.4703)
,p_branch_sequence=>50
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where nvl(AGREEMENT_ENABLED_YN,''N'') = ''Y'' and id = 1'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(711861279470245740.4703)
,p_branch_name=>'Go to Page 30 (confirmation)'
,p_branch_action=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(624350696578280086.4703)
,p_branch_sequence=>60
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'SHOW_SCHEMA_YN'
,p_branch_condition_text=>'N'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(624392091754336529.4703)
,p_branch_name=>'Go to Page 1'
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(624391705621329097.4703)
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(741644387803197176.4703)
,p_branch_name=>'Redirect to Login Page'
,p_branch_action=>'f?p=4550:1'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(624350869612280090.4703)
,p_branch_sequence=>30
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2001116307897507.4703)
,p_name=>'ADMIN_USERNAME'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(825273288998768702.4703)
,p_prompt=>'Admin-Benutzername'
,p_source=>'lower(:APP_USER)'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>255
,p_tag_attributes=>'autocomplete="username"'
,p_field_template=>wwv_flow_imp.id(481972669929805619.4703)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_security_scheme=>wwv_flow_imp.id(116607181908334943)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'send_on_page_submit', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(624349012704280076.4703)
,p_name=>'ADMIN_FIRST_NAME'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(825273288998768702.4703)
,p_prompt=>'Vorname'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>255
,p_tag_attributes=>'autocomplete="given-name"'
,p_field_template=>wwv_flow_imp.id(481972669929805619.4703)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'send_on_page_submit', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(624349255885280079.4703)
,p_name=>'ADMIN_LAST_NAME'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(825273288998768702.4703)
,p_prompt=>'Nachname'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>255
,p_tag_attributes=>'autocomplete="family-name"'
,p_field_template=>wwv_flow_imp.id(481972669929805619.4703)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'send_on_page_submit', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(624349478067280079.4703)
,p_name=>'ADMIN_EMAIL'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(825273288998768702.4703)
,p_prompt=>'E-Mail'
,p_post_element_text=>'<p class="a-Form-postTextInlineHelp">Ein Link zur Aktivierung des Workspace wird an diese E-Mail-Adresse gesendet.</p>'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'case',
'when instr(:APP_USER, ''@'') > 0 then lower(:APP_USER)',
'end'))
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>255
,p_tag_attributes=>'autocomplete="email"'
,p_field_template=>wwv_flow_imp.id(481972669929805619.4703)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'send_on_page_submit', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(624349967806280083.4703)
,p_name=>'COMPANY_NAME'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(825273288998768702.4703)
,p_prompt=>'Workspace'
,p_post_element_text=>'<p class="a-Form-postTextInlineHelp">Dieser Workspace-Name identifiziert Ihre Entwicklungsumgebung eindeutig und wird bei der Anmeldung verwendet.</p>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>128
,p_tag_css_classes=>'a-Form-field u-textUpper'
,p_field_template=>wwv_flow_imp.id(481972669929805619.4703)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'send_on_page_submit', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_item_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter the workspace name you would like to have.  When your workspace is provisioned, you will login using a workspace / username / password combination.',
'',
'<p class="a-Form-postTextInlineHelp">',
'The workspace name is a unique identifier for your service. For example, <code>jane_doe_dev</code>, <code>go_live_project</code>, <code>db_class_101</code>.',
'<br/><br/>',
'When your workspace is created, you will login using your workspace name, email, and password combination.',
'</p>'))
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(662393664144758438.4703)
,p_name=>'P2_COUNTRY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(825273361595768703.4703)
,p_prompt=>'Land'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'COUNTRIES'
,p_lov=>'.'||wwv_flow_imp.id(823478261872577596)||'.'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'autocomplete="country-name"'
,p_field_template=>wwv_flow_imp.id(481972669929805619.4703)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'   options.defaultIconListOptions = {',
'       pagination: {',
'           scroll: true,',
'           loadMore: false',
'       }',
'   }',
'   return options;',
'}'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(662393758741758439.4703)
,p_name=>'P2_USAGE_TYPE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(825273361595768703.4703)
,p_item_default=>'PERSONAL'
,p_prompt=>'Verwendung'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'USAGE_TYPE'
,p_lov=>'.'||wwv_flow_imp.id(824610978117256327)||'.'
,p_field_template=>wwv_flow_imp.id(481972669929805619.4703)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(662393808220758440.4703)
,p_name=>'P2_ORG_NAME'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(825273361595768703.4703)
,p_prompt=>'Organisation'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>255
,p_tag_attributes=>'autocomplete="organization"'
,p_field_template=>wwv_flow_imp.id(481972669929805619.4703)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'send_on_page_submit', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1267106306489305003.4703)
,p_name=>'P2_TERMS_OF_USE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(825273467161768704.4703)
,p_prompt=>'Nutzungsbedingungen'
,p_source=>'wwv_flow_lang.system_message(''WS_SIGNUP.TERMS'')'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(481972669929805619.4703)
,p_item_css_classes=>'a-Request-TermsOfUse'
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'HTML',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(624351113308280091.4703)
,p_computation_sequence=>20
,p_computation_item=>'COMPANY_NAME'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'trim(:COMPANY_NAME)'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(711861350344245741.4703)
,p_computation_sequence=>30
,p_computation_item=>'SCHEMA_NAME'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'substr(wwv_flow_platform.get_preference(''SELF_SERVICE_SCHEMA_PREFIX'')||wwv_flow_provisioning.generate_schema_for_workspace(:COMPANY_NAME),1,128)'
,p_compute_when=>'SHOW_SCHEMA_YN'
,p_compute_when_text=>'N'
,p_compute_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(711861471568245742.4703)
,p_computation_sequence=>40
,p_computation_item=>'DATABASE_SIZE'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'    l_db_size number := 50;',
'',
'begin',
'',
'    for c in (',
'        select req_size from wwv_flow_workspace_req_size where request_type = ''N'' and default_size = ''Y''',
'    ) loop',
'        l_db_size := c.req_size;',
'    end loop;    ',
'    ',
'    return l_db_size;',
'',
'end;    ',
''))
,p_compute_when=>'SHOW_SCHEMA_YN'
,p_compute_when_text=>'N'
,p_compute_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(711861526274245743.4703)
,p_computation_sequence=>50
,p_computation_item=>'NEW_SCHEMA'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'YES'
,p_compute_when=>'SHOW_SCHEMA_YN'
,p_compute_when_text=>'N'
,p_compute_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(624352336404280096.4703)
,p_validation_name=>'ADMIN_EMAIL must be valid'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_at number;',
'  l_dot number;',
'begin',
'  l_at := instr(nvl(:ADMIN_EMAIL,''x''),''@'');',
'  l_dot := instr(nvl(:ADMIN_EMAIL,''x''),''.'',l_at);',
'  return l_at > 1 and l_dot > 1 and (l_dot - l_at) > 1;',
'end;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('Ung\00FCltige E-Mail')
,p_validation_condition=>'ADMIN_EMAIL'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_imp.id(624350696578280086.4703)
,p_associated_item=>wwv_flow_imp.id(624349478067280079.4703)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(624351399015280093.4703)
,p_validation_name=>'company doesn''t already exist'
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Company name must be unique even if previous request was declined, since',
'-- it is possible to reactivate declined requests (and there is a unique index',
'-- on the company name).',
'for c1 in (select null',
'             from wwv_flow_provision_company',
'            where company_name = upper(:COMPANY_NAME)',
'              --and project_status not in (''DECLINED'', ''TERMINATED'')',
') loop',
'    return false;',
'end loop;',
'',
'for c1 in (select null',
'             from wwv_flow_companies',
'            where short_name = upper(:COMPANY_NAME)',
') loop',
'    return false;',
'end loop;',
'',
'return true;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Geben Sie einen anderen Workspace-Namen ein.'
,p_when_button_pressed=>wwv_flow_imp.id(624350696578280086.4703)
,p_associated_item=>wwv_flow_imp.id(624349967806280083.4703)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(624351561451280095.4703)
,p_validation_name=>'Invalid characters in workspace name'
,p_validation_sequence=>60
,p_validation=>'COMPANY_NAME'
,p_validation2=>' <>:/'
,p_validation_type=>'ITEM_IN_VALIDATION_CONTAINS_NO_CHAR_IN_STRING2'
,p_error_message=>unistr('Ung\00FCltiger Workspace-Name.')
,p_when_button_pressed=>wwv_flow_imp.id(624350696578280086.4703)
,p_associated_item=>wwv_flow_imp.id(624349967806280083.4703)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(662394350651758445.4703)
,p_validation_name=>'country required if display usage question'
,p_validation_sequence=>80
,p_validation=>'P2_COUNTRY'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# ist erforderlich.'
,p_error_display_location=>'INLINE_WITH_FIELD'
,p_security_scheme=>wwv_flow_imp.id(825492061062393977)
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(662394450664758446.4703)
,p_validation_name=>'org name required if use for organization'
,p_validation_sequence=>90
,p_validation=>'P2_ORG_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# ist erforderlich.'
,p_validation_condition=>'P2_USAGE_TYPE'
,p_validation_condition2=>'ORG'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_error_display_location=>'INLINE_WITH_FIELD'
,p_security_scheme=>wwv_flow_imp.id(825492061062393977)
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(19981431654203440.4703)
,p_validation_name=>'Email must be valid'
,p_validation_sequence=>100
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- If we are auto-provisioning workspaces, reject blocked email addresses.',
'if wwv_flow_platform.get_preference( p_preference_name => ''SERVICE_REQUEST_FLOW'' ) = ''AUTO''',
'    and not wwv_flow_instance_admin.is_valid_provisioning_email(:ADMIN_EMAIL)',
'    then return false;',
'else return true;',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('Die E-Mail-Adresse weist ein blockiertes Muster auf. Geben Sie eine g\00FCltige E-Mail-Adresse an, um das Provisioning des Workspace fortzusetzen.')
,p_associated_item=>wwv_flow_imp.id(624349478067280079.4703)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(662393984631758441.4703)
,p_name=>'show company name'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2_USAGE_TYPE'
,p_condition_element=>'P2_USAGE_TYPE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'ORG'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(662394055847758442.4703)
,p_event_id=>wwv_flow_imp.id(662393984631758441.4703)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2_ORG_NAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(662394133246758443.4703)
,p_event_id=>wwv_flow_imp.id(662393984631758441.4703)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2_ORG_NAME'
);
end;
/
prompt --application/pages/page_00003
begin
wwv_flow_imp_page.create_page(
 p_id=>3.4703
,p_name=>unistr('Workspace anfordern - Best\00E4tigung')
,p_alias=>'REQUEST-WORKSPACE-CONFIRMATION'
,p_step_title=>'Workspace angefordert - &PRODUCT_NAME.'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_step_template=>wwv_flow_imp.id(728298792391563586.4703)
,p_page_css_classes=>'a-Page--finalWizardStep a-Page--requestWorkspace'
,p_page_template_options=>'#DEFAULT#'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(26270707309302905.4703)
,p_plug_name=>'Workspace angefordert.'
,p_region_css_classes=>'a-Wizard--requestWorkspace'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481970015003751305.4703)
,p_plug_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(516145500301081707.4703)
,p_plug_name=>'Wizard Body'
,p_parent_plug_id=>wwv_flow_imp.id(26270707309302905.4703)
,p_region_css_classes=>'a-Wizard-body'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481965601614717220.4703)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sys.htp.prn(''<div class="a-Wizard-success">'');',
'sys.htp.prn(''<div class="a-Wizard-icon"><span class="a-Icon a-Icon--xl icon-check" role="img" ''|| wwv_flow_plugin_util.get_html_attr(''aria-label'', wwv_flow_lang_dev.builder_message(''SUCCESS'')) ||''></span></div>'');',
'sys.htp.prn(''<h2 class="a-Wizard-subTitle a-Wizard-subTitle--success u-textCenter">'');',
'sys.htp.prn(wwv_flow_lang_dev.builder_message(''WORKSPACE_SIGNUP_SUCCESS_01''));',
'sys.htp.prn(''</h2>'');',
'',
'for c1 in (select REQUEST_SUCCESS_MSG from WWV_FLOW_PROV_SIGNUP_Q where REQUEST_SUCCESS_MSG is not null ) loop',
'    sys.htp.prn(''<p class="a-Wizard-successCustomMessage u-textCenter">''||wwv_flow_escape.html(c1.REQUEST_SUCCESS_MSG)||''</p>'');',
'end loop;',
'',
'sys.htp.prn(''</div>'');'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(235693425700565320.4703)
,p_name=>'P3_COMPANY_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(26270707309302905.4703)
,p_display_as=>'NATIVE_HIDDEN'
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(235693721602567173.4703)
,p_name=>'P3_ADMIN_EMAIL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(26270707309302905.4703)
,p_display_as=>'NATIVE_HIDDEN'
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
end;
/
prompt --application/pages/page_00024
begin
wwv_flow_imp_page.create_page(
 p_id=>24.4703
,p_name=>'Fragen der Umfrage'
,p_alias=>'SURVEY-QUESTIONS'
,p_step_title=>'Workspace anfordern - Umfrage - &PRODUCT_NAME.'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_step_template=>wwv_flow_imp.id(728298792391563586.4703)
,p_page_css_classes=>'a-Page--requestWorkspace'
,p_page_template_options=>'#DEFAULT#'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(25696603898761468.4703)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(18108515260336521.4703)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_item_display_point=>'BELOW'
,p_translate_title=>'N'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(516394643687212836.4703)
,p_plug_name=>'Workspace anfordern'
,p_region_css_classes=>'a-Wizard--requestWorkspace'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481970015003751305.4703)
,p_plug_display_sequence=>10
,p_plug_query_num_rows=>15
,p_landmark_label=>'Workspace-Assistenten anfordern'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(516394851182212837.4703)
,p_plug_name=>'Assistentenfortschrittsleiste'
,p_parent_plug_id=>wwv_flow_imp.id(516394643687212836.4703)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481969298650741033.4703)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_num_rows=>15
,p_landmark_type=>'navigation'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(516145498582081706.4703)
,p_plug_name=>'Wizard Progress List'
,p_parent_plug_id=>wwv_flow_imp.id(516394851182212837.4703)
,p_region_sub_css_classes=>'a-WizardSteps--displayCurrentLabelOnly'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_list_id=>wwv_flow_imp.id(4762183464.4703)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(481972912021825750.4703)
,p_translate_title=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(516395010313212838.4703)
,p_plug_name=>'Wizard Form'
,p_parent_plug_id=>wwv_flow_imp.id(516394643687212836.4703)
,p_region_css_classes=>'a-Wizard-body a-Form'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481965601614717220.4703)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_translate_title=>'N'
,p_plug_query_num_rows=>15
,p_landmark_type=>'form'
,p_landmark_label=>'Umfrage'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(25696432164760206.4703)
,p_plug_name=>'&PRODUCT_NAME.-Registrierung'
,p_parent_plug_id=>wwv_flow_imp.id(516395010313212838.4703)
,p_region_css_classes=>'a-Form a-Form--large'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481965601614717220.4703)
,p_plug_display_sequence=>15
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(26648304716757938.4703)
,p_plug_name=>'Pre Text'
,p_parent_plug_id=>wwv_flow_imp.id(516395010313212838.4703)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481965601614717220.4703)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'for c1 in (select PRE_SURVEY_TEXT from WWV_FLOW_PROV_SIGNUP_Q where id = 1 and PRE_SURVEY_TEXT is not null) loop',
'   sys.htp.prn(''<p class="a-Wizard-text a-Wizard-text--pre">'');',
'   sys.htp.prn(c1.PRE_SURVEY_TEXT);',
'   sys.htp.prn(''</p>'');',
'end loop;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(26648804847767366.4703)
,p_plug_name=>'Post Text'
,p_parent_plug_id=>wwv_flow_imp.id(516395010313212838.4703)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481965601614717220.4703)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'for c1 in (select POST_SURVEY_TEXT from WWV_FLOW_PROV_SIGNUP_Q where id = 1 and POST_SURVEY_TEXT is not null) loop',
'   sys.htp.prn(''<p class="a-Wizard-text a-Wizard-text--post">'');',
'   sys.htp.prn(c1.POST_SURVEY_TEXT);',
'   sys.htp.prn(''</p>'');',
'end loop;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(516395225562212838.4703)
,p_plug_name=>unistr('Assistentenschaltfl\00E4chen')
,p_parent_plug_id=>wwv_flow_imp.id(516394643687212836.4703)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481969298650741033.4703)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_num_rows=>15
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(25697412694761472.4703)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(516395225562212838.4703)
,p_button_name=>'Proceed'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(481975658518888812.4703)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Weiter'
,p_button_position=>'NEXT'
,p_button_css_classes=>'a-Button--large a-Button--largeIcon a-Button--strongLabel'
,p_icon_css_classes=>'icon-right-chevron'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(25697023233761471.4703)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(516395225562212838.4703)
,p_button_name=>'BACK'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(481976264382888813.4703)
,p_button_image_alt=>unistr('Zur\00FCck')
,p_button_position=>'PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:::'
,p_button_condition=>'SHOW_SCHEMA_YN'
,p_button_condition2=>'Y'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_button_css_classes=>'a-Button--large a-Button--largeIcon'
,p_icon_css_classes=>'icon-left-chevron'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(64572886936929402.4703)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(516395225562212838.4703)
,p_button_name=>'BACK2'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(481976264382888813.4703)
,p_button_image_alt=>unistr('Zur\00FCck')
,p_button_position=>'PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::'
,p_button_condition=>'SHOW_SCHEMA_YN'
,p_button_condition2=>'N'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_button_css_classes=>'a-Button--large a-Button--largeIcon'
,p_icon_css_classes=>'icon-left-chevron'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(25696820320761471.4703)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(516395225562212838.4703)
,p_button_name=>'Cancel'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(481975242743888810.4703)
,p_button_image_alt=>'Abbrechen'
,p_button_position=>'PREVIOUS'
,p_button_redirect_url=>'f?p=4550:1'
,p_button_css_classes=>'a-Button--large a-Button--padLeft'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(25698009916772677.4703)
,p_branch_action=>'f?p=&APP_ID.:27:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(25697412694761472.4703)
,p_branch_sequence=>10
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where nvl(JUSTIFICATION_REQUIRED_YN,''Y'') = ''Y'''
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(517470352545983375.4703)
,p_branch_action=>'f?p=&APP_ID.:28:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(25697412694761472.4703)
,p_branch_sequence=>20
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where nvl(AGREEMENT_ENABLED_YN,''N'') = ''Y'' and id = 1'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(517470693841985745.4703)
,p_branch_action=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(25697412694761472.4703)
,p_branch_sequence=>30
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25699805554856566.4703)
,p_name=>'P24_Q1'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(25696432164760206.4703)
,p_prompt=>'&Q1.'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov_language=>'PLSQL'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin return :LOV_1; end;',
''))
,p_tag_css_classes=>'a-Form-radio a-Form-radio--longLabels'
,p_display_when=>'Q1'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(516405998930268369.4703)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25702726426919309.4703)
,p_name=>'P24_Q2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(25696432164760206.4703)
,p_prompt=>'&Q2.'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov_language=>'PLSQL'
,p_lov=>'begin return :LOV_2; end;'
,p_tag_css_classes=>'a-Form-radio a-Form-radio--longLabels'
,p_display_when=>'Q2'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(516405998930268369.4703)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25703326211928720.4703)
,p_name=>'P24_Q3'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(25696432164760206.4703)
,p_prompt=>'&Q3.'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov_language=>'PLSQL'
,p_lov=>'begin return :LOV_3; end;'
,p_tag_css_classes=>'a-Form-radio a-Form-radio--longLabels'
,p_display_when=>'Q3'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(516405998930268369.4703)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25703724011994311.4703)
,p_name=>'P24_Q4'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(25696432164760206.4703)
,p_prompt=>'&Q4.'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov_language=>'PLSQL'
,p_lov=>'begin return :LOV_4; end;'
,p_tag_css_classes=>'a-Form-radio a-Form-radio--longLabels'
,p_display_when=>'Q4'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(516405998930268369.4703)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25777606991111943.4703)
,p_name=>'P24_Q5'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(25696432164760206.4703)
,p_prompt=>'&Q5.'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov_language=>'PLSQL'
,p_lov=>'begin return :LOV_5; end;'
,p_tag_css_classes=>'a-Form-radio a-Form-radio--longLabels'
,p_display_when=>'Q5'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(516405998930268369.4703)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25778026731117668.4703)
,p_name=>'P24_Q6'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(25696432164760206.4703)
,p_prompt=>'&Q6.'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov_language=>'PLSQL'
,p_lov=>'begin return :LOV_6; end;'
,p_tag_css_classes=>'a-Form-radio a-Form-radio--longLabels'
,p_display_when=>'Q6'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(516405998930268369.4703)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25778229501118422.4703)
,p_name=>'P24_Q7'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(25696432164760206.4703)
,p_prompt=>'&Q7.'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov_language=>'PLSQL'
,p_lov=>'begin return :LOV_7; end;'
,p_tag_css_classes=>'a-Form-radio a-Form-radio--longLabels'
,p_display_when=>'Q7'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(516405998930268369.4703)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25778431925119147.4703)
,p_name=>'P24_Q8'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(25696432164760206.4703)
,p_prompt=>'&Q8.'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov_language=>'PLSQL'
,p_lov=>'begin return :LOV_8; end;'
,p_tag_css_classes=>'a-Form-radio a-Form-radio--longLabels'
,p_display_when=>'Q8'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(516405998930268369.4703)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25778601582119878.4703)
,p_name=>'P24_Q9'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(25696432164760206.4703)
,p_prompt=>'&Q9.'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov_language=>'PLSQL'
,p_lov=>'begin return :LOV_9; end;'
,p_tag_css_classes=>'a-Form-radio a-Form-radio--longLabels'
,p_display_when=>'Q9'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(516405998930268369.4703)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25778810239122410.4703)
,p_name=>'P24_Q10'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(25696432164760206.4703)
,p_prompt=>'&Q10.'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov_language=>'PLSQL'
,p_lov=>'begin return :LOV_10; end;'
,p_tag_css_classes=>'a-Form-radio a-Form-radio--longLabels'
,p_display_when=>'Q10'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(516405998930268369.4703)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(517957195019106801.4703)
,p_validation_name=>'P24_Q1'
,p_validation_sequence=>10
,p_validation=>'P24_Q1'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Erforderlich'
,p_validation_condition=>'Q1'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_imp.id(25697412694761472.4703)
,p_associated_item=>wwv_flow_imp.id(25699805554856566.4703)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(517957657444109073.4703)
,p_validation_name=>'P24_Q2'
,p_validation_sequence=>20
,p_validation=>'P24_Q2'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Erforderlich'
,p_validation_condition=>'Q2'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_imp.id(25697412694761472.4703)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(517958236752112011.4703)
,p_validation_name=>'P24_Q3'
,p_validation_sequence=>30
,p_validation=>'P24_Q3'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Erforderlich'
,p_validation_condition=>'Q3'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_imp.id(25697412694761472.4703)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(517958400795112554.4703)
,p_validation_name=>'P24_Q4'
,p_validation_sequence=>40
,p_validation=>'P24_Q4'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Erforderlich'
,p_validation_condition=>'Q4'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_imp.id(25697412694761472.4703)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(517958664493113319.4703)
,p_validation_name=>'P24_Q5'
,p_validation_sequence=>50
,p_validation=>'P24_Q5'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Erforderlich'
,p_validation_condition=>'Q5'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_imp.id(25697412694761472.4703)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(517958828394113925.4703)
,p_validation_name=>'P24_Q6'
,p_validation_sequence=>60
,p_validation=>'P24_Q6'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Erforderlich'
,p_validation_condition=>'Q6'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_imp.id(25697412694761472.4703)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(517959294776114427.4703)
,p_validation_name=>'P24_Q7'
,p_validation_sequence=>70
,p_validation=>'P24_Q7'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Erforderlich'
,p_validation_condition=>'Q7'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_imp.id(25697412694761472.4703)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(517959538183114913.4703)
,p_validation_name=>'P24_Q8'
,p_validation_sequence=>80
,p_validation=>'P24_Q8'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Erforderlich'
,p_validation_condition=>'Q8'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_imp.id(25697412694761472.4703)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(517959792447115409.4703)
,p_validation_name=>'P24_Q9'
,p_validation_sequence=>90
,p_validation=>'P24_Q9'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Erforderlich'
,p_validation_condition=>'Q9'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_imp.id(25697412694761472.4703)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(517959974835115917.4703)
,p_validation_name=>'P24_Q10'
,p_validation_sequence=>100
,p_validation=>'P24_Q10'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Erforderlich'
,p_validation_condition=>'Q10'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_imp.id(25697412694761472.4703)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(25700112527886954.4703)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set questions'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   l_vc_arr2   wwv_flow_global.vc_arr2; ',
'   l_Lov varchar2(4000);',
'   function get_query (p_question in varchar2 default null) return varchar2',
'   is',
'   begin',
'      if p_question is null then return null; else',
'      l_vc_arr2 :=HTMLDB_UTIL.STRING_TO_TABLE(p_separator=>chr(10),p_string=>replace(replace(p_question,'''''''',''''''''''''),chr(13),null));',
'      l_Lov := ''select x d, x r from ('';',
'      for i in 1..l_vc_arr2.count loop',
'         l_Lov := l_Lov||'' select ''''''||l_vc_arr2(i)||'''''' x from dual union all'';',
'      end loop;',
'      l_lov := l_lov ||'' select ''''a'''' x from dual where 1 = 2)'';',
'      return l_lov;',
'      end if;',
'   end;',
'begin',
'for c1 in (select * from WWV_FLOW_PROV_SIGNUP_Q where id = 1) loop',
':Q1 := c1.SURVEY_QUESTION_01; :LOV_1 := get_query(c1.SURVEY_ANSWER_01);',
':Q2 := c1.SURVEY_QUESTION_02; :LOV_2 := get_query(c1.SURVEY_ANSWER_02);',
':Q3 := c1.SURVEY_QUESTION_03; :LOV_3 := get_query(c1.SURVEY_ANSWER_03);',
':Q4 := c1.SURVEY_QUESTION_04; :LOV_4 := get_query(c1.SURVEY_ANSWER_04);',
':Q5 := c1.SURVEY_QUESTION_05; :LOV_5 := get_query(c1.SURVEY_ANSWER_05);',
':Q6 := c1.SURVEY_QUESTION_06; :LOV_6 := get_query(c1.SURVEY_ANSWER_06);',
':Q7 := c1.SURVEY_QUESTION_07; :LOV_7 := get_query(c1.SURVEY_ANSWER_07);',
':Q8 := c1.SURVEY_QUESTION_08; :LOV_8 := get_query(c1.SURVEY_ANSWER_08);',
':Q9 := c1.SURVEY_QUESTION_09; :LOV_9 := get_query(c1.SURVEY_ANSWER_09);',
':Q10 := c1.SURVEY_QUESTION_10; :LOV_10 := get_query(c1.SURVEY_ANSWER_10);',
'end loop;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>25700112527886954.4703
);
end;
/
prompt --application/pages/page_00025
begin
wwv_flow_imp_page.create_page(
 p_id=>25.4703
,p_tab_set=>'HOME'
,p_name=>'Workspace anfordern - Schema angeben'
,p_alias=>'REQUEST-WORKSPACE-IDENTIFY-SCHEMA'
,p_step_title=>'Workspace anfordern - Schema - &PRODUCT_NAME.'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_step_template=>wwv_flow_imp.id(728298792391563586.4703)
,p_page_css_classes=>'a-Page--requestWorkspace'
,p_page_template_options=>'#DEFAULT#'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(4863831037.4703)
,p_plug_name=>'Workspace anfordern'
,p_region_css_classes=>'a-Wizard--requestWorkspace'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481970015003751305.4703)
,p_plug_display_sequence=>10
,p_landmark_label=>'Workspace-Assistenten anfordern'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(29261829463725446.4703)
,p_plug_name=>unistr('Assistentenschaltfl\00E4chen')
,p_parent_plug_id=>wwv_flow_imp.id(4863831037.4703)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481969298650741033.4703)
,p_plug_display_sequence=>100
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'BELOW'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(516145120027081703.4703)
,p_plug_name=>'Assistentenfortschrittsleiste'
,p_parent_plug_id=>wwv_flow_imp.id(4863831037.4703)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481969298650741033.4703)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_landmark_type=>'navigation'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(516145206173081704.4703)
,p_plug_name=>'Wizard Progress List'
,p_parent_plug_id=>wwv_flow_imp.id(516145120027081703.4703)
,p_region_sub_css_classes=>'a-WizardSteps--displayCurrentLabelOnly'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_list_id=>wwv_flow_imp.id(4762183464.4703)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(481972912021825750.4703)
,p_translate_title=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(516145337648081705.4703)
,p_plug_name=>'Wizard Form'
,p_parent_plug_id=>wwv_flow_imp.id(4863831037.4703)
,p_region_css_classes=>'a-Wizard-body a-Form a-Form--large'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481965601614717220.4703)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'BELOW'
,p_translate_title=>'N'
,p_landmark_type=>'form'
,p_landmark_label=>'Schema'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(18350230104012648.4703)
,p_plug_name=>'Hidden Items'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_08'
,p_plug_item_display_point=>'BELOW'
,p_translate_title=>'N'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(4841831018.4703)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(29261829463725446.4703)
,p_button_name=>'Proceed'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(481975658518888812.4703)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Weiter'
,p_button_position=>'NEXT'
,p_button_css_classes=>'a-Button--large a-Button--largeIcon a-Button--strongLabel'
,p_icon_css_classes=>'icon-right-chevron'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(4893430263.4703)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(29261829463725446.4703)
,p_button_name=>'Back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(481976264382888813.4703)
,p_button_image_alt=>unistr('Zur\00FCck')
,p_button_position=>'PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::'
,p_button_condition=>'F4700_REQ_NEW_SCHEMA'
,p_button_condition2=>'Y'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_button_css_classes=>'a-Button--large a-Button--largeIcon'
,p_icon_css_classes=>'icon-left-chevron'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(4839831015.4703)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(29261829463725446.4703)
,p_button_name=>'Cancel'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(481975242743888810.4703)
,p_button_image_alt=>'Abbrechen'
,p_button_position=>'PREVIOUS'
,p_button_redirect_url=>'f?p=4550:1'
,p_button_css_classes=>'a-Button--large a-Button--padLeft'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(177096326383922599.4703)
,p_branch_action=>'f?p=&APP_ID.:26:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(4841831018.4703)
,p_branch_sequence=>10
,p_branch_condition_type=>'FUNCTION_BODY'
,p_branch_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :NEW_SCHEMA = ''YES'' then',
'  return false;',
'else',
'  for c1 in (select 1 from dual where',
' wwv_flow_provisioning.restricted_schema_i(:P25_SCHEMA,:COMPANY_NAME) = ''1''',
'union all ',
'select 1 from wwv_flow_company_schemas where schema = :P25_SCHEMA) loop',
'  return true;',
'  end loop;',
'  return false;',
'end if;'))
,p_branch_condition_text=>'PLSQL'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(25800727750666745.4703)
,p_branch_action=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(4841831018.4703)
,p_branch_sequence=>20
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where SURVEY_ENABLED_YN = ''Y'''
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(66700008567178536.4703)
,p_branch_action=>'f?p=&APP_ID.:27:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where nvl(JUSTIFICATION_REQUIRED_YN,''Y'') = ''Y'''
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(881357448284941741.4703)
,p_branch_name=>'Go To Page 28'
,p_branch_action=>'f?p=&APP_ID.:28:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(4841831018.4703)
,p_branch_sequence=>40
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where nvl(AGREEMENT_ENABLED_YN,''N'') = ''Y'' and id = 1'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(517333648995125819.4703)
,p_branch_name=>'Go To Page 30'
,p_branch_action=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(4841831018.4703)
,p_branch_sequence=>50
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(1617426846755257730.4703)
,p_branch_action=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'NEW_SCHEMA'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4849831028.4703)
,p_name=>'DATABASE_SIZE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(516145337648081705.4703)
,p_prompt=>'Speicherplatzzuweisung'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select req_size||'' MB'' d, req_size r',
'  from wwv_flow_workspace_req_size',
' where request_type = ''N''',
'   and display = ''Y''',
' order by to_number(req_size)'))
,p_cHeight=>1
,p_tag_attributes2=>'class="instructiontext"'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_count number;',
'begin    ',
'    if :NEW_SCHEMA = ''YES'' then',
'        select count(*) into l_count ',
'          from wwv_flow_workspace_req_size',
'         where request_type = ''N''',
'           and display = ''Y'';',
'        --',
'        -- If only one size specified for workspace requests,',
'        -- then don''t show selection',
'        if l_count = 1 then',
'            return FALSE;',
'        else',
'            return TRUE;',
'        end if;',
'    else ',
'        return FALSE;',
'    end if;',
'end;'))
,p_display_when2=>'PLSQL'
,p_display_when_type=>'FUNCTION_BODY'
,p_field_template=>wwv_flow_imp.id(481972669929805619.4703)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_protection_level=>'S'
,p_escape_on_http_input=>'Y'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>unistr('W\00E4hlen Sie den ben\00F6tigten Speicherplatz. Nachdem das Schema erstellt wurde, k\00F6nnen Sie gegebenenfalls zus\00E4tzlichen Speicherplatz anfordern.')
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(320269887457.4703)
,p_name=>'SCHEMA_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(516145337648081705.4703)
,p_prompt=>'Schemaname'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>128
,p_display_when=>'NEW_SCHEMA'
,p_display_when2=>'YES'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(481972771960821314.4703)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_escape_on_http_input=>'Y'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Der Schemaname ist der Benutzer der Oracle-Datenbank, dem Ihre Datenbankobjekte geh\00F6ren. W\00E4hlen Sie den Namen sorgf\00E4ltig aus. Wenn Ihr Service durch Provisioning bereitgestellt wird, erhalten Sie das Kennwort f\00FCr das Schema und die Anmeldung. Nachdem')
||unistr(' Ihr Workspace erstellt wurde, k\00F6nnen Sie dort zus\00E4tzliche Schemas hinzuf\00FCgen. '),
unistr('G\00FCltige Schemanamen m\00FCssen folgenden Richtlinien entsprechen:'),
'',
'',
'',
unistr('- Sie m\00FCssen zwischen 1 und 30 Byte lang sein'),
'',
unistr('- Sie d\00FCrfen keine Anf\00FChrungszeichen enthalten'),
'',
unistr(' - Sie m\00FCssen mit einem Buchstaben beginnen'),
'',
unistr('- Sie d\00FCrfen mit Ausnahme folgender Zeichen nur alphanumerische Zeichen enthalten:'),
'',
'Unterstriche (_), Dollar-Zeichen ($) und Nummernzeichen (#).',
'',
unistr('- Verwenden Sie keine f\00FCr Oracle reservierten W\00F6rter'),
'',
' - Verwenden Sie nicht den internen Tabellennamen DUAL'))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'send_on_page_submit', 'N',
  'submit_when_enter_pressed', 'Y',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11472001772984287.4703)
,p_name=>'EXISTING_SCHEMA_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(516145337648081705.4703)
,p_prompt=>'Vorhandenes Schema'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_display_when=>'NEW_SCHEMA'
,p_display_when2=>'NO'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(481972771960821314.4703)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_escape_on_http_input=>'Y'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Geben Sie den Namen des Schemas ein, das Sie f\00FCr den neuen &PRODUCT_NAME.-Workspace zur Verf\00FCgung stellen m\00F6chten. Nachdem der Workspace erstellt wurde, k\00F6nnen Sie dort zus\00E4tzliche Schemas hinzuf\00FCgen.'),
''))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'send_on_page_submit', 'N',
  'submit_when_enter_pressed', 'Y',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(36459510251028490.4703)
,p_name=>'NEW_SCHEMA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(516145337648081705.4703)
,p_item_default=>'YES'
,p_prompt=>'Konfiguration'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'NEW_OR_EXISTING_SCHEMA'
,p_lov=>'.'||wwv_flow_imp.id(150771414457811401)||'.'
,p_lov_translated=>'Y'
,p_display_when=>'F4700_REQ_NEW_SCHEMA'
,p_display_when2=>'Y'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(481972669929805619.4703)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_protection_level=>'S'
,p_escape_on_http_output=>'N'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>unistr('W\00E4hlen Sie, ob Sie ein neues Datenbankschema erstellen oder ein vorhandenes Datenbankschema f\00FCr den neuen Workspace konfigurieren m\00F6chten.')
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'execute_validations', 'Y',
  'number_of_columns', '1',
  'page_action_on_selection', 'SUBMIT')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(172217307242398784.4703)
,p_name=>'NEW_SCHEMA_HINT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(516145337648081705.4703)
,p_source=>'wwv_flow_lang.system_message(''F4700.NEW_SCHEMA_HINT'')'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'a-Wizard-text'
,p_display_when=>'NEW_SCHEMA'
,p_display_when2=>'YES'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(18341322111783282.4703)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_escape_on_http_input=>'Y'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(172222728497414363.4703)
,p_name=>'EXISTING_SCHEMA_HINT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(516145337648081705.4703)
,p_source=>'wwv_flow_lang.system_message(''F4700.EXISTING_SCHEMA_HINT'')'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'a-Wizard-text'
,p_display_when=>'NEW_SCHEMA'
,p_display_when2=>'NO'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(18341322111783282.4703)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_escape_on_http_input=>'Y'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(177097216171957551.4703)
,p_name=>'P25_SCHEMA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(18350230104012648.4703)
,p_display_as=>'NATIVE_HIDDEN'
,p_escape_on_http_input=>'Y'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(177098721282977925.4703)
,p_computation_sequence=>10
,p_computation_item=>'P25_SCHEMA'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'nvl(upper(:EXISTING_SCHEMA_NAME), upper(:SCHEMA_NAME))'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(1701190835973401.4703)
,p_computation_sequence=>20
,p_computation_item=>'SCHEMA_NAME'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'substr(wwv_flow_platform.get_preference(''SELF_SERVICE_SCHEMA_PREFIX'')||:SCHEMA_NAME,1,128)'
,p_compute_when=>'wwv_flow_platform.get_preference(''SELF_SERVICE_SCHEMA_PREFIX'') is not null'
,p_compute_when_text=>'PLSQL'
,p_compute_when_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(241344206807542545.4703)
,p_computation_sequence=>20
,p_computation_item=>'NEW_SCHEMA'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if nvl(:F4700_REQ_NEW_SCHEMA,''Y'') = ''Y''',
'   then return ''YES'';',
'else ',
'    return ''NO'';',
'end if;'))
,p_compute_when=>'NEW_SCHEMA'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(4348304649326378516.4703)
,p_computation_sequence=>30
,p_computation_item=>'DATABASE_SIZE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_default number;',
'begin',
'    for c1 in (select req_size',
'                 from wwv_flow_workspace_req_size',
'                where request_type = ''N''',
'                  and default_size = ''Y'') loop',
'        l_default := c1.req_size;',
'        exit;',
'    end loop;',
'    return l_default;',
'end;'))
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(174995802627402506.4703)
,p_validation_name=>'new schema name not null'
,p_validation_sequence=>10
,p_validation=>'SCHEMA_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Der Schemaname muss angegeben werden.'
,p_validation_condition=>':NEW_SCHEMA = ''YES'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_associated_item=>wwv_flow_imp.id(320269887457.4703)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(174996724098408796.4703)
,p_validation_name=>'existing schema name not null'
,p_validation_sequence=>20
,p_validation=>'EXISTING_SCHEMA_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Der Schemaname muss angegeben werden.'
,p_validation_condition=>':NEW_SCHEMA = ''NO'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_associated_item=>wwv_flow_imp.id(11472001772984287.4703)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(16910421773188557.4703)
,p_validation_name=>'schema exists'
,p_validation_sequence=>30
,p_validation=>'wwv_flow_security.exists_db_user(upper(:EXISTING_SCHEMA_NAME))'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'Das Schema &EXISTING_SCHEMA_NAME. ist nicht vorhanden.'
,p_validation_condition=>':NEW_SCHEMA = ''NO'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_associated_item=>wwv_flow_imp.id(11472001772984287.4703)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(31864751459513493.4703)
,p_validation_name=>'new schema does not exist'
,p_validation_sequence=>50
,p_validation=>'wwv_flow_security.get_db_user_or_role(upper(:SCHEMA_NAME)) is null'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'Geben Sie einen anderen Schemanamen ein.'
,p_validation_condition=>':NEW_SCHEMA = ''YES'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_associated_item=>wwv_flow_imp.id(320269887457.4703)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(31865013913542993.4703)
,p_validation_name=>'no spaces in name'
,p_validation_sequence=>70
,p_validation=>'SCHEMA_NAME'
,p_validation_type=>'ITEM_CONTAINS_NO_SPACES'
,p_error_message=>'Der Schemaname darf keine Leerzeichen enthalten.'
,p_validation_condition=>':NEW_SCHEMA = ''YES'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_associated_item=>wwv_flow_imp.id(320269887457.4703)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(47216914721574906.4703)
,p_validation_name=>'schema name cant contain quotes'
,p_validation_sequence=>80
,p_validation=>'instr(:SCHEMA_NAME,'''''''')+instr(:SCHEMA_NAME,''"'') = 0'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>unistr('Der Schemaname darf keine Anf\00FChrungszeichen enthalten.')
,p_validation_condition=>':NEW_SCHEMA = ''YES'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_associated_item=>wwv_flow_imp.id(320269887457.4703)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(47217711926597880.4703)
,p_validation_name=>'cannot be an oracle reserved word'
,p_validation_sequence=>90
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'wwv_flow_provision.schema_name_valid(',
'    p_schema            => :SCHEMA_NAME,',
'    p_workspace_name    => :COMPANY_NAME);'))
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>unistr('Schemaname (&SCHEMA_NAME.) ist reserviert oder eingeschr\00E4nkt. Geben Sie ein anderes Schema an.')
,p_validation_condition=>':NEW_SCHEMA = ''YES'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_associated_item=>wwv_flow_imp.id(320269887457.4703)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(59988904879054677.4703)
,p_validation_name=>'schema name is valid'
,p_validation_sequence=>100
,p_validation=>'wwv_flow_utilities.is_valid_identifier(:SCHEMA_NAME)'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>unistr('Der Schemaname ist nicht g\00FCltig. Geben Sie einen anderen Namen an.')
,p_validation_condition=>':NEW_SCHEMA = ''YES'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_associated_item=>wwv_flow_imp.id(320269887457.4703)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(175009024256995482.4703)
,p_validation_name=>'new schema not used in existing workspace'
,p_validation_sequence=>110
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from wwv_flow_company_schemas',
' where schema = upper(:SCHEMA_NAME)',
'   and not exists (',
'           -- Exclude earlier validation to avoid duplicate error messages',
'           select null from sys.all_users where username = upper(:SCHEMA_NAME)',
'       )'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'Geben Sie einen anderen Schemanamen ein.'
,p_validation_condition=>':NEW_SCHEMA = ''YES'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_associated_item=>wwv_flow_imp.id(320269887457.4703)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(426906789735388104.4703)
,p_validation_name=>'valid database size'
,p_validation_sequence=>120
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select req_size r',
'  from wwv_flow_workspace_req_size',
' where request_type = ''N''',
'   and display = ''Y''',
'   and req_size = :DATABASE_SIZE'))
,p_validation_type=>'EXISTS'
,p_error_message=>unistr('Ung\00FCltige Speicherplatzzuordnung ausgew\00E4hlt.')
,p_validation_condition=>'NEW_SCHEMA'
,p_validation_condition2=>'YES'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_imp.id(4849831028.4703)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(13059725120036431.4703)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'remove bad char from schema name'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':schema_name := trim(replace(:schema_name,''-'',''_''));',
':schema_name := replace(:schema_name,''&'','''');',
':schema_name := replace(:schema_name,''\'','''');',
':schema_name := replace(:schema_name,''/'','''');',
':schema_name := replace(:schema_name,''['','''');',
':schema_name := replace(:schema_name,'']'','''');',
':schema_name := replace(:schema_name,''('','''');',
':schema_name := replace(:schema_name,'')'','''');',
':schema_name := replace(:schema_name,''&'','''');',
':schema_name := replace(:schema_name,''\'','''');',
':schema_name := replace(:schema_name,''/'','''');',
':schema_name := replace(:schema_name,''+'','''');',
':schema_name := replace(:schema_name,''='','''');',
':schema_name := replace(:schema_name,''*'','''');',
':schema_name := replace(:schema_name,''&'','''');',
':schema_name := replace(:schema_name,''$'','''');',
':schema_name := replace(:schema_name,''&'','''');',
':schema_name := replace(:schema_name,'';'','''');',
':schema_name := replace(:schema_name,''%'','''');',
':schema_name := replace(:schema_name,''#'','''');',
':schema_name := replace(:schema_name,''@'','''');',
':schema_name := replace(:schema_name,''!'','''');',
':schema_name := replace(:schema_name,''~'','''');',
':schema_name := replace(:schema_name,''`'','''');',
':schema_name := replace(:schema_name,'''''''','''');',
':schema_name := replace(:schema_name,'':'','''');',
':schema_name := replace(:schema_name,''"'','''');',
':schema_name := replace(:schema_name,''?'','''');',
':schema_name := replace(:schema_name,''<'','''');',
':schema_name := replace(:schema_name,''>'','''');',
':schema_name := replace(:schema_name,''{'','''');',
':schema_name := replace(:schema_name,''}'','''');',
':schema_name := replace(:schema_name,''.'','''');',
':schema_name := replace(:schema_name,'','','''');',
':schema_name := replace(:schema_name,''^'','''');'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>13059725120036431.4703
);
end;
/
prompt --application/pages/page_00026
begin
wwv_flow_imp_page.create_page(
 p_id=>26.4703
,p_name=>'Workspace anfordern - Schemawarnungen'
,p_alias=>'REQUEST-WORKSPACE-SCHEMA-WARNINGS'
,p_step_title=>'Workspace anfordern - Schemawarnung - &PRODUCT_NAME.'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_step_template=>wwv_flow_imp.id(728298792391563586.4703)
,p_page_css_classes=>'a-Page--requestWorkspace'
,p_page_template_options=>'#DEFAULT#'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(177082418885844385.4703)
,p_plug_name=>'Warnung'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(18113207959457422.4703)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(195695513611201651.4703)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(18108515260336521.4703)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_item_display_point=>'BELOW'
,p_translate_title=>'N'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(517949648797931799.4703)
,p_plug_name=>'Workspace anfordern'
,p_region_css_classes=>'a-Wizard--requestWorkspace'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481970015003751305.4703)
,p_plug_display_sequence=>40
,p_landmark_label=>'Workspace-Assistenten anfordern'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(517949851182931801.4703)
,p_plug_name=>'Assistentenfortschrittsleiste'
,p_parent_plug_id=>wwv_flow_imp.id(517949648797931799.4703)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481969298650741033.4703)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_landmark_type=>'navigation'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(517950053089931801.4703)
,p_plug_name=>'Wizard Progress List'
,p_parent_plug_id=>wwv_flow_imp.id(517949851182931801.4703)
,p_region_sub_css_classes=>'a-WizardSteps--displayCurrentLabelOnly'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_list_id=>wwv_flow_imp.id(4762183464.4703)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(481972912021825750.4703)
,p_translate_title=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(517950234959931802.4703)
,p_plug_name=>'Wizard Form'
,p_parent_plug_id=>wwv_flow_imp.id(517949648797931799.4703)
,p_region_css_classes=>'a-Wizard-body a-Form'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481965601614717220.4703)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'BELOW'
,p_translate_title=>'N'
,p_landmark_type=>'region'
,p_landmark_label=>'Schemawarnung'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(517952931820969756.4703)
,p_plug_name=>'Shared Schema Warning'
,p_parent_plug_id=>wwv_flow_imp.id(517950234959931802.4703)
,p_region_css_classes=>'a-Wizard-warning'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481965601614717220.4703)
,p_plug_display_sequence=>310
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sys.htp.p(',
'    ''<div class="a-Wizard-icon"><span role="img"'' ||',
'    wwv_flow_plugin_util.get_html_attr(',
'        p_name  => ''aria-label'',',
'        p_value => wwv_flow_lang.runtime_message( ''WARNING'' ) ) ||',
'    '' class="a-Icon a-Icon--xl icon-warning"></span></div>'' );',
'sys.htp.p( ''<p class="a-Wizard-text">'' );',
'sys.htp.p(',
'    wwv_flow_escape.html(',
'        wwv_flow_lang.system_message(',
'            p_name => ''F4700.P26_WARN_SHARED_SCHEMA'',',
'            p0 => v( ''PRODUCT_NAME'' ) ) ) );',
'sys.htp.p( ''</p>'' );'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_num_rows=>15
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>'select 1 from wwv_flow_company_schemas where schema = upper(:P25_SCHEMA)'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'N',
  'attribute_02', 'HTML',
  'attribute_03', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(517953857557021232.4703)
,p_plug_name=>'Restricted Schema Warning'
,p_parent_plug_id=>wwv_flow_imp.id(517950234959931802.4703)
,p_region_css_classes=>'a-Wizard-warning'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481965601614717220.4703)
,p_plug_display_sequence=>320
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sys.htp.p(',
'    ''<div class="a-Wizard-icon"><span role="img"'' ||',
'    wwv_flow_plugin_util.get_html_attr(',
'        p_name  => ''aria-label'',',
'        p_value => wwv_flow_lang.runtime_message( ''WARNING'' ) ) ||',
'    '' class="a-Icon a-Icon--xl icon-warning"></span></div>'' );',
'sys.htp.p( ''<p class="a-Wizard-text">'' );',
'sys.htp.p(',
'    wwv_flow_escape.html(',
'        wwv_flow_lang.system_message(',
'            p_name => ''F4700.P26_WARN_RESTRICTED_SCHEMA'',',
'            p0 => v( ''PRODUCT_NAME'' ) ) ) );',
'sys.htp.p( ''</p>'' );'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_num_rows=>15
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from dual where',
' wwv_flow_provisioning.restricted_schema_i(:P25_SCHEMA,:COMPANY_NAME) = ''1'''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'N',
  'attribute_02', 'HTML',
  'attribute_03', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(517950490437931802.4703)
,p_plug_name=>unistr('Assistentenschaltfl\00E4chen')
,p_parent_plug_id=>wwv_flow_imp.id(517949648797931799.4703)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481969298650741033.4703)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(752122034442695897.4703)
,p_plug_name=>'Workspace anfordern'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'DEFAULT'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(728294112567557139.4703)
,p_plug_display_sequence=>10
,p_plug_new_grid_column=>false
,p_plug_display_point=>'REGION_POSITION_02'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(177082802719844403.4703)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(517950490437931802.4703)
,p_button_name=>'Proceed'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(481975658518888812.4703)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Weiter'
,p_button_position=>'NEXT'
,p_button_css_classes=>'a-Button--large a-Button--largeIcon a-Button--strongLabel'
,p_icon_css_classes=>'icon-right-chevron'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(177083008639844403.4703)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(517950490437931802.4703)
,p_button_name=>'Back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(481976264382888813.4703)
,p_button_image_alt=>unistr('Zur\00FCck')
,p_button_position=>'PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:::'
,p_button_css_classes=>'a-Button--large a-Button--largeIcon'
,p_icon_css_classes=>'icon-left-chevron'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(177082609759844393.4703)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(517950490437931802.4703)
,p_button_name=>'Cancel'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(481975242743888810.4703)
,p_button_image_alt=>'Abbrechen'
,p_button_position=>'PREVIOUS'
,p_button_redirect_url=>'f?p=4550:1'
,p_button_css_classes=>'a-Button--large a-Button--padLeft'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(66706514632218067.4703)
,p_branch_action=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(177082802719844403.4703)
,p_branch_sequence=>10
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where SURVEY_ENABLED_YN = ''Y'''
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(25801706888679653.4703)
,p_branch_action=>'f?p=&APP_ID.:27:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(177082802719844403.4703)
,p_branch_sequence=>20
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where nvl(JUSTIFICATION_REQUIRED_YN,''Y'') = ''Y'''
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(517472394235011586.4703)
,p_branch_action=>'f?p=&APP_ID.:28:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(177082802719844403.4703)
,p_branch_sequence=>30
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where nvl(AGREEMENT_ENABLED_YN,''N'') = ''Y'' and id = 1'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(517472886591015296.4703)
,p_branch_action=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(177082802719844403.4703)
,p_branch_sequence=>40
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(177095520711911576.4703)
,p_name=>'P26_SCHEMA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(517950234959931802.4703)
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_input=>'Y'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
end;
/
prompt --application/pages/page_00027
begin
wwv_flow_imp_page.create_page(
 p_id=>27.4703
,p_tab_set=>'HOME'
,p_name=>'Workspace anfordern - Projektbeschreibung'
,p_alias=>'REQUEST-WORKSPACE-PROJECT-DESCRIPTION'
,p_step_title=>unistr('Workspace anfordern - Begr\00FCndung - &PRODUCT_NAME.')
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_step_template=>wwv_flow_imp.id(728298792391563586.4703)
,p_page_css_classes=>'a-Page--requestWorkspace'
,p_page_template_options=>'#DEFAULT#'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(516408864658385622.4703)
,p_plug_name=>'Workspace anfordern'
,p_region_css_classes=>'a-Wizard--requestWorkspace'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481970015003751305.4703)
,p_plug_display_sequence=>40
,p_landmark_label=>'Workspace-Assistenten anfordern'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(516409065144385626.4703)
,p_plug_name=>'Assistentenfortschrittsleiste'
,p_parent_plug_id=>wwv_flow_imp.id(516408864658385622.4703)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481969298650741033.4703)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_landmark_type=>'navigation'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(516409204387385627.4703)
,p_plug_name=>'Wizard Progress List'
,p_parent_plug_id=>wwv_flow_imp.id(516409065144385626.4703)
,p_region_sub_css_classes=>'a-WizardSteps--displayCurrentLabelOnly'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_list_id=>wwv_flow_imp.id(4762183464.4703)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(481972912021825750.4703)
,p_translate_title=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(516409441539385628.4703)
,p_plug_name=>'Wizard Form'
,p_parent_plug_id=>wwv_flow_imp.id(516408864658385622.4703)
,p_region_css_classes=>'a-Wizard-body a-Form a-Form--large'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481965601614717220.4703)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p class="a-Wizard-text">Mit diesen Informationen kann der &PRODUCT_NAME.-Administrator ermitteln, wozu dieser Service ben\00F6tigt wird.</p>'),
'<p class="a-Wizard-text">&P27_MORE_JUSTIFICATION.</p>',
'',
''))
,p_translate_title=>'N'
,p_landmark_type=>'form'
,p_landmark_label=>unistr('Begr\00FCndung')
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(516411073780385633.4703)
,p_plug_name=>unistr('Assistentenschaltfl\00E4chen')
,p_parent_plug_id=>wwv_flow_imp.id(516408864658385622.4703)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481969298650741033.4703)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(516411245858385636.4703)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(516411073780385633.4703)
,p_button_name=>'Proceed'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(481975658518888812.4703)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Weiter'
,p_button_position=>'NEXT'
,p_button_css_classes=>'a-Button--large a-Button--largeIcon a-Button--strongLabel'
,p_icon_css_classes=>'icon-right-chevron'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(109157847214.4703)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(516411073780385633.4703)
,p_button_name=>'Back'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(481976264382888813.4703)
,p_button_image_alt=>unistr('Zur\00FCck')
,p_button_position=>'PREVIOUS'
,p_button_css_classes=>'a-Button--large a-Button--largeIcon'
,p_icon_css_classes=>'icon-left-chevron'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(516411647143385640.4703)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(516411073780385633.4703)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(481975242743888810.4703)
,p_button_image_alt=>'Abbrechen'
,p_button_position=>'PREVIOUS'
,p_button_redirect_url=>'f?p=4550:1'
,p_button_css_classes=>'a-Button--large a-Button--padLeft'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(516362650992934299.4703)
,p_branch_action=>'f?p=&APP_ID.:28:&SESSION.::&DEBUG.:28::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where nvl(AGREEMENT_ENABLED_YN,''N'') = ''Y'''
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(66702007660187721.4703)
,p_branch_action=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(516411245858385636.4703)
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(825273683475768706.4703)
,p_branch_name=>'Go to Page 2 (Request Page)'
,p_branch_action=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(109157847214.4703)
,p_branch_sequence=>10
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where SHOW_SCHEMA_YN = ''N'' and SURVEY_ENABLED_YN = ''N'''
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(25802015676691687.4703)
,p_branch_name=>'Go To Page 24 (Survey)'
,p_branch_action=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:::'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(109157847214.4703)
,p_branch_sequence=>20
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where SURVEY_ENABLED_YN = ''Y'''
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(25802200570696805.4703)
,p_branch_name=>'Go To Page 25 (Schema Selection)'
,p_branch_action=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:::'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(109157847214.4703)
,p_branch_sequence=>30
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where SHOW_SCHEMA_YN = ''Y'''
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(109173847225.4703)
,p_name=>'PROJECT_DESCRIPTION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(516409441539385628.4703)
,p_prompt=>'Warum fordern Sie diesen Service an?'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cMaxlength=>32767
,p_cHeight=>10
,p_field_template=>wwv_flow_imp.id(516405998930268369.4703)
,p_item_template_options=>'#DEFAULT#:a-Form-fieldContainer--stretch'
,p_escape_on_http_input=>'Y'
,p_help_text=>unistr('Geben Sie den Grund f\00FCr den Service Request ein. Diese Informationen werden vom &PRODUCT_NAME.-Administrator verwendet.')
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(109175847225.4703)
,p_name=>'PROJECT_JUSTIFICATION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(516409441539385628.4703)
,p_prompt=>unistr('Begr\00FCndung f\00FCr den Service Request, optional')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>70
,p_cMaxlength=>32767
,p_cHeight=>8
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_imp.id(516405744549268368.4703)
,p_item_template_options=>'#DEFAULT#:a-Form-fieldContainer--stretch'
,p_escape_on_http_input=>'Y'
,p_help_text=>unistr('Wenn Sie laut Ihrer Firmen- oder Servicevereinbarung verpflichtet sind, Ihre Anforderung zu begr\00FCnden, geben Sie die Begr\00FCndung an.')
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(177451430104093580.4703)
,p_name=>'P27_MORE_JUSTIFICATION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(516409441539385628.4703)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_imp.id(516405744549268368.4703)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_input=>'Y'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'HTML',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(177458508913257768.4703)
,p_computation_sequence=>10
,p_computation_item=>'P27_MORE_JUSTIFICATION'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare x varchar2(32767) := null;',
'begin',
'    if wwv_flow_provisioning.restricted_schema_i(:P25_SCHEMA,:COMPANY_NAME) = ''1'' then',
'      x := wwv_flow_lang.system_message(''F4700.P26_JUSTIFY_RESTRICTED_SCHEMA'');',
'    end if;      ',
'    for c1 in (select 1 from wwv_flow_company_schemas ',
'        where schema = :P25_SCHEMA) loop',
'      x := x||wwv_flow_lang.system_message(''F4700.P26_JUSTIFY_SHARED_SCHEMA'');',
'      exit;',
'    end loop;',
'    return x;',
'end;'))
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(109236958762.4703)
,p_validation_name=>'PROJECT_DESCRIPTION Not Null'
,p_validation_sequence=>10
,p_validation=>'PROJECT_DESCRIPTION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Sie m\00FCssen erl\00E4utern, warum Sie diesen Service anfordern.')
,p_associated_item=>wwv_flow_imp.id(109173847225.4703)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_validation_comment=>'generated 23-FEB-2001 12:53'
);
end;
/
prompt --application/pages/page_00028
begin
wwv_flow_imp_page.create_page(
 p_id=>28.4703
,p_name=>'Servicevereinbarung'
,p_alias=>'SERVICE-AGREEMENT'
,p_step_title=>'Workspace anfordern - Servicevereinbarung - &PRODUCT_NAME.'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_step_template=>wwv_flow_imp.id(728298792391563586.4703)
,p_page_css_classes=>'a-Page--requestWorkspace'
,p_page_template_options=>'#DEFAULT#'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(80230402173993477.4703)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(18108515260336521.4703)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_item_display_point=>'BELOW'
,p_translate_title=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(517967421599265744.4703)
,p_plug_name=>'Workspace anfordern'
,p_region_css_classes=>'a-Wizard--requestWorkspace'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481970015003751305.4703)
,p_plug_display_sequence=>50
,p_landmark_label=>'Workspace-Assistenten anfordern'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(517967654884265745.4703)
,p_plug_name=>'Assistentenfortschrittsleiste'
,p_parent_plug_id=>wwv_flow_imp.id(517967421599265744.4703)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481969298650741033.4703)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_landmark_type=>'navigation'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(517967892852265745.4703)
,p_plug_name=>'Wizard Progress List'
,p_parent_plug_id=>wwv_flow_imp.id(517967654884265745.4703)
,p_region_sub_css_classes=>'a-WizardSteps--displayCurrentLabelOnly'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_list_id=>wwv_flow_imp.id(4762183464.4703)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(481972912021825750.4703)
,p_translate_title=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(517968022564265746.4703)
,p_plug_name=>'Wizard Form'
,p_parent_plug_id=>wwv_flow_imp.id(517967421599265744.4703)
,p_region_css_classes=>'a-Wizard-body a-Form'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481965601614717220.4703)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'BELOW'
,p_translate_title=>'N'
,p_landmark_type=>'form'
,p_landmark_label=>'Vereinbarung'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(80170923513990161.4703)
,p_plug_name=>'Agreement'
,p_parent_plug_id=>wwv_flow_imp.id(517968022564265746.4703)
,p_region_css_classes=>'a-Wizard-agreement'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481965601614717220.4703)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   l_clob      clob;',
'   c             pls_integer := 0;',
'   l_amount number;',
'   l_offset    number;',
'   l_buffer    varchar2(32767);',
'begin',
'   for c1 in (select AGREEMENT_TEXT from WWV_FLOW_PROV_SIGNUP_Q where id = 1) loop',
'   l_clob := c1.AGREEMENT_TEXT;',
'   if sys.dbms_lob.getlength(l_clob) > 0 then',
'        l_amount := 4000;',
'        l_offset := 1;',
'        begin',
'            loop',
'                sys.dbms_lob.read( l_clob, l_amount, l_offset, l_buffer );',
'                sys.htp.prn( replace(l_buffer,chr(10),''<br />'') );',
'                l_offset := l_offset + l_amount;',
'                l_amount := 32000;',
'            end loop;',
'        exception',
'            when no_data_found then',
'                null;',
'        end;',
'    end if;',
'    end loop;',
'end;',
'',
' '))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(81409728268284890.4703)
,p_plug_name=>'Accept terms'
,p_parent_plug_id=>wwv_flow_imp.id(517968022564265746.4703)
,p_region_css_classes=>'a-Form a-Form--large'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481965601614717220.4703)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_translate_title=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(517968214545265746.4703)
,p_plug_name=>unistr('Assistentenschaltfl\00E4chen')
,p_parent_plug_id=>wwv_flow_imp.id(517967421599265744.4703)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481969298650741033.4703)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(80231020051993478.4703)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(517968214545265746.4703)
,p_button_name=>'Proceed'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(481975658518888812.4703)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Weiter'
,p_button_position=>'NEXT'
,p_button_css_classes=>'a-Button--large a-Button--largeIcon a-Button--strongLabel'
,p_icon_css_classes=>'icon-right-chevron'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(80230815227993478.4703)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(517968214545265746.4703)
,p_button_name=>'Back'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(481976264382888813.4703)
,p_button_image_alt=>unistr('Zur\00FCck')
,p_button_position=>'PREVIOUS'
,p_button_css_classes=>'a-Button--large a-Button--largeIcon'
,p_icon_css_classes=>'icon-left-chevron'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(80230614027993477.4703)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(517968214545265746.4703)
,p_button_name=>'Cancel'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(481975242743888810.4703)
,p_button_image_alt=>'Abbrechen'
,p_button_position=>'PREVIOUS'
,p_button_redirect_url=>'f?p=4550:1'
,p_button_css_classes=>'a-Button--large a-Button--padLeft'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(80315521913999183.4703)
,p_branch_action=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(80231020051993478.4703)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(517475649795114509.4703)
,p_branch_action=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(80230815227993478.4703)
,p_branch_sequence=>30
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where nvl(SURVEY_ENABLED_YN,''N'') = ''Y'''
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(517475870611116622.4703)
,p_branch_name=>'Go To Page 25'
,p_branch_action=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(80230815227993478.4703)
,p_branch_sequence=>50
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'SHOW_SCHEMA_YN'
,p_branch_condition_text=>'Y'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(64572937523929403.4703)
,p_branch_name=>'Go to Page 2'
,p_branch_action=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(80230815227993478.4703)
,p_branch_sequence=>60
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(517475139255103367.4703)
,p_branch_action=>'f?p=&APP_ID.:27:&SESSION.::&DEBUG.:::'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(80230815227993478.4703)
,p_branch_sequence=>20
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where nvl(JUSTIFICATION_REQUIRED_YN,''Y'') = ''Y'''
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(80434718366017037.4703)
,p_name=>'P28_ACCEPT_TERMS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(81409728268284890.4703)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Ich akzeptiere die Bedingungen'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_field_template=>wwv_flow_imp.id(805564588331659193.4703)
,p_item_template_options=>'#DEFAULT#:a-Form-fieldContainer--autoLabelWidth'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(144094305310958675.4703)
,p_computation_sequence=>10
,p_computation_item=>'AGREEMENT_ACCEPTED'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'P28_ACCEPT_TERMS'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(247493906498726082.4703)
,p_validation_name=>'terms accepted'
,p_validation_sequence=>10
,p_validation=>'P28_ACCEPT_TERMS'
,p_validation2=>'Y'
,p_validation_type=>'ITEM_IN_VALIDATION_EQ_STRING2'
,p_error_message=>unistr('Sie m\00FCssen die Bedingungen akzeptieren, um fortzufahren.')
,p_when_button_pressed=>wwv_flow_imp.id(80231020051993478.4703)
,p_associated_item=>wwv_flow_imp.id(80434718366017037.4703)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
end;
/
prompt --application/pages/page_00030
begin
wwv_flow_imp_page.create_page(
 p_id=>30.4703
,p_tab_set=>'HOME'
,p_name=>unistr('Workspace anfordern - Best\00E4tigung')
,p_alias=>'REQUEST-WORKSPACE-CONFIRMATION1'
,p_step_title=>unistr('Workspace anfordern - Best\00E4tigung - &PRODUCT_NAME.')
,p_allow_duplicate_submissions=>'N'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_step_template=>wwv_flow_imp.id(728298792391563586.4703)
,p_page_css_classes=>'a-Page--requestWorkspace'
,p_page_template_options=>'#DEFAULT#'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(516416294096463438.4703)
,p_plug_name=>'Workspace anfordern'
,p_region_css_classes=>'a-Wizard--requestWorkspace'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481970015003751305.4703)
,p_plug_display_sequence=>60
,p_landmark_label=>'Workspace-Assistenten anfordern'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(94840826419648214.4703)
,p_plug_name=>'Wizard Body'
,p_parent_plug_id=>wwv_flow_imp.id(516416294096463438.4703)
,p_region_css_classes=>'a-Wizard-body a-Form a-Form--large'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481965601614717220.4703)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'BELOW'
,p_translate_title=>'N'
,p_landmark_type=>'region'
,p_landmark_label=>unistr('Best\00E4tigung')
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_plug_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'code remove for justification',
'htp.p(''<tr>'');',
'htp.p(''<td>''||wwv_flow_lang.system_message(p_name=>''SERVICE_SIGNUP.JUSTIFICATION'')||''</td>'');',
'htp.p(''<td class="htmldbFDB">''||htf.escape_sc(substr(:PROJECT_JUSTIFICATION,1,50))||''...</td>'');',
'htp.p(''</tr>'');'))
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(662394585165758447.4703)
,p_plug_name=>'Basic Info'
,p_parent_plug_id=>wwv_flow_imp.id(94840826419648214.4703)
,p_region_css_classes=>'region-basic-info'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481965601614717220.4703)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_translate_title=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(662394649248758448.4703)
,p_plug_name=>'Usage Info'
,p_parent_plug_id=>wwv_flow_imp.id(94840826419648214.4703)
,p_region_css_classes=>'region-usage-info'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481965601614717220.4703)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_translate_title=>'N'
,p_plug_required_role=>wwv_flow_imp.id(825492061062393977)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(516416468522463439.4703)
,p_plug_name=>'Assistentenfortschrittsleiste'
,p_parent_plug_id=>wwv_flow_imp.id(516416294096463438.4703)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481969298650741033.4703)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_landmark_type=>'navigation'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(516416609246463439.4703)
,p_plug_name=>'Wizard Progress List'
,p_parent_plug_id=>wwv_flow_imp.id(516416468522463439.4703)
,p_region_sub_css_classes=>'a-WizardSteps--displayCurrentLabelOnly'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_list_id=>wwv_flow_imp.id(4762183464.4703)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(481972912021825750.4703)
,p_translate_title=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(516418271756463442.4703)
,p_plug_name=>unistr('Assistentenschaltfl\00E4chen')
,p_parent_plug_id=>wwv_flow_imp.id(516416294096463438.4703)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481969298650741033.4703)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(318141939408.4703)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(516418271756463442.4703)
,p_button_name=>'Accept'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(481975242743888810.4703)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Anforderung weiterleiten'
,p_button_position=>'NEXT'
,p_button_css_classes=>'a-Button--large a-Button--strongLabel'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(318938118262.4703)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(516418271756463442.4703)
,p_button_name=>'Back_button'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(481976264382888813.4703)
,p_button_image_alt=>unistr('Zur\00FCck')
,p_button_position=>'PREVIOUS'
,p_button_css_classes=>'a-Button--large a-Button--largeIcon'
,p_icon_css_classes=>'icon-left-chevron'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(516418625242463444.4703)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(516418271756463442.4703)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(481975242743888810.4703)
,p_button_image_alt=>'Abbrechen'
,p_button_position=>'PREVIOUS'
,p_button_redirect_url=>'f?p=4550:1'
,p_button_css_classes=>'a-Button--large a-Button--padLeft'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(60145132142214439.4703)
,p_branch_action=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(318141939408.4703)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(517468015163944139.4703)
,p_branch_action=>'f?p=&APP_ID.:28:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(318938118262.4703)
,p_branch_sequence=>15
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where nvl(AGREEMENT_ENABLED_YN,''N'') = ''Y'''
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(388346306877278713.4703)
,p_branch_action=>'f?p=&APP_ID.:27:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(318938118262.4703)
,p_branch_sequence=>20
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where nvl(JUSTIFICATION_REQUIRED_YN,''Y'') = ''Y'''
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(517414131433361542.4703)
,p_branch_action=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(318938118262.4703)
,p_branch_sequence=>30
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where SURVEY_ENABLED_YN = ''Y'''
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(517415202755367631.4703)
,p_branch_name=>'Go To Page 25 (Schema Selection)'
,p_branch_action=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(318938118262.4703)
,p_branch_sequence=>40
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where SHOW_SCHEMA_YN = ''Y'''
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(825273817288768708.4703)
,p_branch_name=>'Go To Page 2 (Identification)'
,p_branch_action=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(318938118262.4703)
,p_branch_sequence=>50
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2001296539897508.4703)
,p_name=>'P30_ADMIN_USERNAME'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(662394585165758447.4703)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Admin-Benutzername'
,p_source=>'ADMIN_USERNAME'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'a-Form-field a-Form-field--readOnly'
,p_field_template=>wwv_flow_imp.id(481972669929805619.4703)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_security_scheme=>wwv_flow_imp.id(116607181908334943)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(26273021255363662.4703)
,p_name=>'P30_WORKSPACE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(662394585165758447.4703)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Workspace'
,p_source=>'COMPANY_NAME'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'a-Form-field a-Form-field--readOnly'
,p_field_template=>wwv_flow_imp.id(481972669929805619.4703)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(26401719484160967.4703)
,p_name=>'P30_WORKSPACE_DESC'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(662394585165758447.4703)
,p_use_cache_before_default=>'NO'
,p_source=>'PROJECT_DESCRIPTION'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(26402116498169624.4703)
,p_name=>'P30_FIRST_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(662394585165758447.4703)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Vorname'
,p_source=>'ADMIN_FIRST_NAME'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'a-Form-field a-Form-field--readOnly'
,p_field_template=>wwv_flow_imp.id(481972669929805619.4703)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(26402322731171379.4703)
,p_name=>'P30_LAST_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(662394585165758447.4703)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Nachname'
,p_source=>'ADMIN_LAST_NAME'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'a-Form-field a-Form-field--readOnly'
,p_field_template=>wwv_flow_imp.id(481972669929805619.4703)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(26402504854175640.4703)
,p_name=>'P30_ADMIN_EMAIL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(662394585165758447.4703)
,p_use_cache_before_default=>'NO'
,p_prompt=>'E-Mail'
,p_source=>'ADMIN_EMAIL'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'a-Form-field a-Form-field--readOnly'
,p_field_template=>wwv_flow_imp.id(481972669929805619.4703)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(26402731520183408.4703)
,p_name=>'P30_USE_EXISTING_SCHEMA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(662394585165758447.4703)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Vorhandenes Schema verwenden'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :NEW_SCHEMA = ''NO'' then',
'  return wwv_flow_lang.system_message(p_name=>''SERVICE_SIGNUP.YES'');',
'else',
' return wwv_flow_lang.system_message(p_name=>''SERVICE_SIGNUP.NO'');',
'end if;'))
,p_source_type=>'FUNCTION_BODY'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'a-Form-field a-Form-field--readOnly'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_imp.id(481972669929805619.4703)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(26403006848195226.4703)
,p_name=>'P30_SCHEMA_NAME'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(662394585165758447.4703)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Schemaname'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :NEW_SCHEMA = ''YES'' then',
'    return :SCHEMA_NAME;',
'else',
'    return :EXISTING_SCHEMA_NAME;',
'end if;'))
,p_source_type=>'FUNCTION_BODY'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'a-Form-field a-Form-field--readOnly'
,p_display_when=>'SHOW_SCHEMA_YN'
,p_display_when2=>'Y'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(481972669929805619.4703)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(26403223124199902.4703)
,p_name=>'P30_DB_SIZE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(662394585165758447.4703)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Datenbankgr\00F6\00DFe (MB)')
,p_source=>'DATABASE_SIZE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'a-Form-field a-Form-field--readOnly'
,p_display_when=>'SHOW_SCHEMA_YN'
,p_display_when2=>'YES'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(481972669929805619.4703)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(662394782361758449.4703)
,p_name=>'P30_COUNTRY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(662394649248758448.4703)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Land'
,p_source=>'P2_COUNTRY'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'COUNTRIES'
,p_lov=>'.'||wwv_flow_imp.id(823478261872577596)||'.'
,p_field_template=>wwv_flow_imp.id(481972669929805619.4703)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'LOV',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(662394824050758450.4703)
,p_name=>'P30_USAGE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(662394649248758448.4703)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Verwendung'
,p_source=>'P2_USAGE_TYPE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'USAGE_TYPE'
,p_lov=>'.'||wwv_flow_imp.id(824610978117256327)||'.'
,p_field_template=>wwv_flow_imp.id(481972669929805619.4703)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'LOV',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(825539283026735501.4703)
,p_name=>'P30_ORG_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(662394649248758448.4703)
,p_item_default=>'P2_ORG_NAME'
,p_item_default_type=>'ITEM'
,p_prompt=>'Organisation'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P2_USAGE_TYPE'
,p_display_when2=>'ORG'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(481972669929805619.4703)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(143943821324944409.4703)
,p_validation_name=>'values exist'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'trim(:COMPANY_NAME) is not null',
'and trim(:ADMIN_EMAIL) is not null'))
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>unistr('Nicht alle Werte sind ordnungsgem\00E4\00DF festgelegt. Starten Sie den Workspace-Anforderungsprozess erneut.')
,p_when_button_pressed=>wwv_flow_imp.id(318141939408.4703)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(247624218797767424.4703)
,p_validation_name=>'terms accepted'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_AGREEMENT_ENABLED_YN varchar2(1) := ''N'';',
'begin',
'    for c1 in (',
'        select AGREEMENT_ENABLED_YN ',
'          from WWV_FLOW_PROV_SIGNUP_Q ',
'         where id = 1',
'    ) loop',
'        l_AGREEMENT_ENABLED_YN := nvl(c1.AGREEMENT_ENABLED_YN, ''N'');',
'    end loop;',
'',
'    if l_AGREEMENT_ENABLED_YN != ''Y'' then',
'        return true;',
'    elsif l_AGREEMENT_ENABLED_YN = ''Y'' and :AGREEMENT_ACCEPTED = ''Y'' then',
'        return true;',
'    else',
'        return false;',
'    end if;',
'end;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('Bedingungen wurden nicht ordnungsgem\00E4\00DF akzeptiert.')
,p_when_button_pressed=>wwv_flow_imp.id(318141939408.4703)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(2184197002254427848.4703)
,p_validation_name=>'new schema name not null'
,p_validation_sequence=>40
,p_validation=>'SCHEMA_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Der Schemaname muss angegeben werden.'
,p_validation_condition=>':NEW_SCHEMA = ''YES'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_when_button_pressed=>wwv_flow_imp.id(318141939408.4703)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(2184242065158429229.4703)
,p_validation_name=>'existing schema name not null'
,p_validation_sequence=>50
,p_validation=>'EXISTING_SCHEMA_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Der Schemaname muss angegeben werden.'
,p_validation_condition=>':NEW_SCHEMA = ''NO'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_when_button_pressed=>wwv_flow_imp.id(318141939408.4703)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(2184242341374430656.4703)
,p_validation_name=>'schema exists'
,p_validation_sequence=>60
,p_validation=>'wwv_flow_security.exists_db_user(upper(:EXISTING_SCHEMA_NAME))'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'Das Schema &EXISTING_SCHEMA_NAME. ist nicht vorhanden.'
,p_validation_condition=>':NEW_SCHEMA = ''NO'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_when_button_pressed=>wwv_flow_imp.id(318141939408.4703)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(2184242602392431985.4703)
,p_validation_name=>'new schema does not exist'
,p_validation_sequence=>70
,p_validation=>'wwv_flow_security.get_db_user_or_role(upper(:SCHEMA_NAME)) is null'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'Geben Sie einen anderen Schemanamen ein.'
,p_validation_condition=>':NEW_SCHEMA = ''YES'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_when_button_pressed=>wwv_flow_imp.id(318141939408.4703)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(2184247877095437803.4703)
,p_validation_name=>'no spaces in name'
,p_validation_sequence=>80
,p_validation=>'SCHEMA_NAME'
,p_validation_type=>'ITEM_CONTAINS_NO_SPACES'
,p_error_message=>'Der Schemaname darf keine Leerzeichen enthalten.'
,p_validation_condition=>':NEW_SCHEMA = ''YES'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_when_button_pressed=>wwv_flow_imp.id(318141939408.4703)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(2184248749119438943.4703)
,p_validation_name=>'schema name cant contain quotes'
,p_validation_sequence=>90
,p_validation=>'instr(:SCHEMA_NAME,'''''''')+instr(:SCHEMA_NAME,''"'') = 0'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>unistr('Der Schemaname darf keine Anf\00FChrungszeichen enthalten.')
,p_validation_condition=>':NEW_SCHEMA = ''YES'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_when_button_pressed=>wwv_flow_imp.id(318141939408.4703)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(2184249045719440018.4703)
,p_validation_name=>'cannot be an oracle reserved word'
,p_validation_sequence=>100
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'wwv_flow_provision.schema_name_valid(',
'    p_schema            => :SCHEMA_NAME,',
'    p_workspace_name    => :COMPANY_NAME);'))
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>unistr('Schemaname (&SCHEMA_NAME.) ist reserviert oder eingeschr\00E4nkt. Geben Sie ein anderes Schema an.')
,p_validation_condition=>':NEW_SCHEMA = ''YES'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_when_button_pressed=>wwv_flow_imp.id(318141939408.4703)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(2184249340031441378.4703)
,p_validation_name=>'schema name is valid'
,p_validation_sequence=>110
,p_validation=>'wwv_flow_utilities.is_valid_identifier(:SCHEMA_NAME)'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>unistr('Der Schemaname ist nicht g\00FCltig. Geben Sie einen anderen Namen an.')
,p_validation_condition=>':NEW_SCHEMA = ''YES'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_when_button_pressed=>wwv_flow_imp.id(318141939408.4703)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(2184249626926442496.4703)
,p_validation_name=>'new schema not used in existing workspace'
,p_validation_sequence=>120
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from wwv_flow_company_schemas',
' where schema = upper(:SCHEMA_NAME)',
'   and not exists (',
'           -- Exclude earlier validation to avoid duplicate error messages',
'           select null from sys.all_users where username = upper(:SCHEMA_NAME)',
'       )'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'Geben Sie einen anderen Schemanamen ein.'
,p_validation_condition=>':NEW_SCHEMA = ''YES'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_when_button_pressed=>wwv_flow_imp.id(318141939408.4703)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(16952718581632268.4703)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Submit request'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_schema        wwv_flow_provision_company.schema_name%type;',
'    l_database_size varchar2(1000);',
'begin',
'    if :NEW_SCHEMA = ''YES'' then',
'        l_schema := :SCHEMA_NAME;',
'        l_database_size := :DATABASE_SIZE;',
'    else',
'        l_schema := :EXISTING_SCHEMA_NAME;',
'    end if;',
'',
'    wwv_flow_provisioning.make_request (',
'        p_COMPANY_NAME          => :COMPANY_NAME,',
'        p_ADMIN_FIRST_NAME      => :ADMIN_FIRST_NAME,',
'        p_ADMIN_LAST_NAME       => :ADMIN_LAST_NAME,',
'        p_ADMIN_EMAIL           => :ADMIN_EMAIL,',
'        p_ADMIN_PHONE           => null,',
'        p_ADMIN_USERID          => nvl(:ADMIN_USERNAME, :ADMIN_EMAIL),',
'        p_COMPANY_ADDRESS       => null,',
'        p_CITY                  => null,',
'        p_STATE                 => null,',
'        p_ZIP                   => null,',
'        p_COUNTRY               => :P2_COUNTRY,',
'        p_usage_type            => :P2_USAGE_TYPE,',
'        p_org_name              => :P2_ORG_NAME,',
'        p_COMPANY_TYPE          => null,',
'        p_COMPANY_PHONE         => null,',
'        p_COMPANY_FAX           => null,',
'        p_DATABASE_SIZE         => l_database_size,',
'        p_SCHEMA_NAME           => l_schema,',
'        p_project_description   => :PROJECT_DESCRIPTION,',
'        p_project_justification => :PROJECT_JUSTIFICATION,',
'        p_workspace_type        => ''BUILDER'',',
'        p_question_1            => :Q1,',
'        p_answer_1              => :P24_Q1,',
'        p_question_2            => :Q2,',
'        p_answer_2              => :P24_Q2,',
'        p_question_3            => :Q3,',
'        p_answer_3              => :P24_Q3,',
'        p_question_4            => :Q4,',
'        p_answer_4              => :P24_Q4,',
'        p_question_5            => :Q5,',
'        p_answer_5              => :P24_Q5,',
'        p_question_6            => :Q6,',
'        p_answer_6              => :P24_Q6,',
'        p_question_7            => :Q7,',
'        p_answer_7              => :P24_Q7,',
'        p_question_8            => :Q8,',
'        p_answer_8              => :P24_Q8,',
'        p_question_9            => :Q9,',
'        p_answer_9              => :P24_Q9,',
'        p_question_10           => :Q10,',
'        p_answer_10             => :P24_Q10,',
'        --',
'        p_ip_address            => wwv_flow_cgi.get_remote_addr',
'    );',
'    --',
'    wwv_flow_mail.push_queue_background();',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'Fehler beim Anfordern von &MSG_COMPANY..'
,p_process_when_button_id=>wwv_flow_imp.id(318141939408.4703)
,p_internal_uid=>16952718581632268.4703
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(235706412746607558.4703)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Clear cache'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    c_company_name constant wwv_flow_provision_company.company_name%type := :COMPANY_NAME;',
'    c_admin_email  constant wwv_flow_provision_company.admin_email%type := :ADMIN_EMAIL;',
'begin',
'    wwv_flow_session_state.clear_state_for_application(:APP_ID);',
'',
'    htmldb_util.set_session_state(',
'        p_name  => ''P3_COMPANY_NAME'',',
'        p_value => c_company_name',
'    );',
'    htmldb_util.set_session_state(',
'        p_name  => ''P3_ADMIN_EMAIL'',',
'        p_value => c_admin_email',
'    );',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(318141939408.4703)
,p_internal_uid=>235706412746607558.4703
);
end;
/
prompt --application/pages/page_00073
begin
wwv_flow_imp_page.create_page(
 p_id=>73.4703
,p_name=>'Erstellen von &PRODUCT_NAME.-Workspace'
,p_alias=>'WORKSPACE-CREATION'
,p_step_title=>'Workspace wird erstellt - &PRODUCT_NAME.'
,p_allow_duplicate_submissions=>'N'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function showLoading(){',
'    window.setTimeout( function(){ doSubmit(''CREATE_WORKSPACE'') }, 100);',
'    window.setTimeout( function(){ $x("loadingIcon").src = $x("loadingIcon").src }, 100);',
'}'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-Form-labelContainer {',
'    width: 40% !important;',
'}',
'',
'.a-Page--simpleWizard.a-Page--requestWorkspace .a-Wizard-subTitle {',
'    margin-left: auto;',
'    margin-right: auto;',
'}',
'',
'.a-Page--simpleWizard.a-Page--requestWorkspace .a-Form-fieldContainer:not(.a-Form-fieldContainer--stacked) .a-Form-labelContainer {',
'    padding-top: 12px;',
'    padding-bottom: 12px;',
'}',
'',
'.a-Wizard-steps {',
'    text-align: center;',
'}'))
,p_step_template=>wwv_flow_imp.id(728298792391563586.4703)
,p_page_css_classes=>'a-Page--requestWorkspace'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_help_text=>'AEADM/aadm_hm.htm'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(698805774605413350.4703)
,p_plug_name=>'Workspace anfordern'
,p_region_css_classes=>'a-Wizard--requestWorkspace'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481970015003751305.4703)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_landmark_label=>'Workspace-Assistenten anfordern'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(785007731946389617.4703)
,p_plug_name=>'Approval Status'
,p_parent_plug_id=>wwv_flow_imp.id(698805774605413350.4703)
,p_region_css_classes=>'a-Wizard-body'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481965601614717220.4703)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sys.htp.p(''<div class="a-Wizard-success">'');',
'sys.htp.p(''<h2 class="a-Wizard-subTitle u-tC">'');',
'sys.htp.prn(wwv_flow_lang.system_message(''F4350.CREATING_WORKSPACE''));',
'sys.htp.p(''...</h2>'');',
'sys.htp.p(''<div class="a-ProcessingRegion a-ProcessingRegion--dialog"><span class="u-Processing"><span class="u-Processing-spinner"></span></span></div>'');',
'sys.htp.p(''</div>'');'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P73_STATUS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(785007904613389618.4703)
,p_plug_name=>'Workspace Creation Status'
,p_parent_plug_id=>wwv_flow_imp.id(698805774605413350.4703)
,p_region_css_classes=>'a-Wizard-body'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481965601614717220.4703)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'SUB_REGIONS'
,p_translate_title=>'N'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P73_STATUS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2002492859897520.4703)
,p_plug_name=>'Datenbankkennwort'
,p_parent_plug_id=>wwv_flow_imp.id(785007904613389618.4703)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481965601614717220.4703)
,p_plug_display_sequence=>15
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_required_role=>wwv_flow_imp.id(116607181908334943)
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'wwv_flow_global.g_cloud = true'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(416033801984152703.4703)
,p_plug_name=>'Workspace Creation Disabled'
,p_parent_plug_id=>wwv_flow_imp.id(785007904613389618.4703)
,p_region_css_classes=>'a-Wizard-success'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481965601614717220.4703)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>'sys.htp.p(''<div class="a-Wizard-text">''||:P73_STATUS||''</div>'');'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P73_WS_PROV_DISABLED'
,p_plug_display_when_cond2=>'Y'
,p_plug_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div role="img" aria-label="&P73_SUCCESS_ICON_LABEL." class="a-Wizard-icon"><span class="a-Icon a-Icon--xl icon-check"></span></div>',
'<h2 class="a-Wizard-subTitle">Erstellen von Workspace deaktiviert</h2>'))
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(825233966004277601.4703)
,p_plug_name=>'Workspace Successfully Created'
,p_parent_plug_id=>wwv_flow_imp.id(785007904613389618.4703)
,p_region_css_classes=>'a-Wizard-success u-tC'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481965601614717220.4703)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>'sys.htp.p(''<div class="a-Wizard-text u-tC">''||:P73_STATUS||''</div>'');'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P73_WS_PROV_DISABLED'
,p_plug_display_when_cond2=>'N'
,p_plug_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div role="img" aria-label="&P73_SUCCESS_ICON_LABEL." class="a-Wizard-icon"><span class="a-Icon a-Icon--xl icon-check"></span></div>',
'<h2 class="a-Wizard-subTitle">Workspace erfolgreich erstellt</h2>'))
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(861065721162173096.4703)
,p_plug_name=>'Buttons'
,p_parent_plug_id=>wwv_flow_imp.id(698805774605413350.4703)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(481969298650741033.4703)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'BELOW'
,p_translate_title=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(861008913543170914.4703)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(861065721162173096.4703)
,p_button_name=>'FINISH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(481975658518888812.4703)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Mit Anmeldebildschirm fortfahren'
,p_button_condition=>'P73_STATUS'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'icon-right-chevron'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(2002948647897525.4703)
,p_branch_name=>'Go to sign-in URL'
,p_branch_action=>'&P73_SIGN_IN_URL.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(861008913543170914.4703)
,p_branch_sequence=>5
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(785009012421389623.4703)
,p_branch_action=>'f?p=&APP_ID.:73:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2002595423897521.4703)
,p_name=>'P73_WKSP_PASSWORD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(2002492859897520.4703)
,p_prompt=>'Datenbankkennwort'
,p_placeholder=>'Datenbankkennwort'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(481972669929805619.4703)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Geben Sie ein Kennwort f\00FCr das mit dem Workspace verkn\00FCpfte Datenbankschema ein.')
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2002666835897522.4703)
,p_name=>'P73_WKSP_CONFIRM_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(2002492859897520.4703)
,p_prompt=>unistr('Datenbankkennwort best\00E4tigen')
,p_placeholder=>unistr('Datenbankkennwort best\00E4tigen')
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(481972669929805619.4703)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Best\00E4tigen Sie das Kennwort f\00FCr das mit dem Workspace verkn\00FCpfte Datenbankschema.')
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2003023714897526.4703)
,p_name=>'P73_USER_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(2002492859897520.4703)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(79232294700259812.4703)
,p_name=>'P73_SUCCESS_ICON_LABEL'
,p_item_sequence=>55
,p_item_plug_id=>wwv_flow_imp.id(785007904613389618.4703)
,p_source=>'wwv_flow_lang.runtime_message( ''SUCCESS'' )'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_protection_level=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(416033622824152701.4703)
,p_name=>'P73_WS_PROV_DISABLED'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(698805774605413350.4703)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(416033983865152704.4703)
,p_name=>'P73_STATUS_1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(416033801984152703.4703)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(785008112786389619.4703)
,p_name=>'P73_STATUS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(825233966004277601.4703)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(785603515624489906.4703)
,p_name=>'PROVISION_ID'
,p_item_sequence=>35
,p_item_plug_id=>wwv_flow_imp.id(785007904613389618.4703)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2210612504487687901.4703)
,p_name=>'P73_SIGN_IN_URL'
,p_item_sequence=>45
,p_item_plug_id=>wwv_flow_imp.id(785007904613389618.4703)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(416033728614152702.4703)
,p_computation_sequence=>10
,p_computation_item=>'P73_WS_PROV_DISABLED'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>'return nvl(wwv_flow_platform.get_preference(''DISABLE_WS_PROV''),''N'');'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(2002710211897523.4703)
,p_validation_name=>'wksp pwd = confirm wksp pwd'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P73_WKSP_PASSWORD != :P73_WKSP_CONFIRM_PASSWORD then',
'  :P73_WKSP_PASSWORD := null;',
'  :P73_WKSP_CONFIRM_PASSWORD := null;',
'  return false;',
'else',
'  return true;',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('Die Kennwortbest\00E4tigung stimmt nicht mit dem Kennwort \00FCberein.')
,p_validation_condition=>'P73_WKSP_PASSWORD'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_associated_item=>wwv_flow_imp.id(2002666835897522.4703)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(2002865550897524.4703)
,p_validation_name=>'Validate DB Password'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return wwv_flow_security.password_validation (',
'           p_username => :P73_USER_NAME,',
'           p_password => :P73_WKSP_PASSWORD );'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('Das Kennwort entspricht nicht den Komplexit\00E4tsregeln f\00FCr Kennw\00F6rter der Datenbank.')
,p_validation_condition=>'P73_WKSP_PASSWORD'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_associated_item=>wwv_flow_imp.id(2002595423897521.4703)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(107287619660340910.4703)
,p_name=>'Page Load'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P73_STATUS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(107287728097340911.4703)
,p_event_id=>wwv_flow_imp.id(107287619660340910.4703)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'addLoadEvent(showLoading);'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(785008723931389621.4703)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Provision workspace'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    wwv_flow_fnd_developer_api.f4700_73_provision_workspace(',
'        p_provision_id => :PROVISION_ID,',
'        p_sign_in_url  => :P73_SIGN_IN_URL,',
'        p_msg          => :P73_STATUS );',
'',
'    for c1 in (select schema_name',
'                 from wwv_flow_provision_company',
'                where id = :PROVISION_ID ) loop',
'        :P73_USER_NAME := c1.schema_name;',
'    end loop;',
'end;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_process_when=>'CREATE_WORKSPACE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>785008723931389621.4703
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(2003128521897527.4703)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DB User Management'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_wkspsch_asserted  varchar2(4000) := wwv_flow_assert.enquote_name(:P73_USER_NAME);',
'    l_wksppass_asserted varchar2(4000) := wwv_flow_assert.enquote_name(:P73_WKSP_PASSWORD);',
'    l_sql               varchar2(32767);',
'begin',
'    --',
'    --Modify workspace user password     ',
'    --',
'    l_sql := ''alter user ''||l_wkspsch_asserted||'' identified by ''||l_wksppass_asserted;',
'',
'    execute immediate l_sql;',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':P73_WKSP_PASSWORD is not null and wwv_flow_global.g_cloud = true'
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
,p_security_scheme=>wwv_flow_imp.id(116607181908334943)
,p_internal_uid=>2003128521897527.4703
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
