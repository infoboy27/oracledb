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
,p_default_application_id=>4555
,p_default_id_offset=>0
,p_default_owner=>'APEX_240200'
);
end;
/
 
prompt APPLICATION 4555 - Oracle APEX Workspace / INTERNAL Login
--
-- Application Export:
--   Application:     4555
--   Name:            Oracle APEX Workspace / INTERNAL Login
--   Exported By:     APEX_240200
--   Flashback:       0
--   Export Type:     Application Export
--     Pages:                      8
--       Items:                   24
--       Computations:             4
--       Validations:              7
--       Processes:               10
--       Regions:                 33
--       Buttons:                 17
--       Dynamic Actions:          6
--     Shared Components:
--       Logic:
--         Items:                  7
--         Computations:           2
--         Build Options:          4
--       Navigation:
--         Lists:                  5
--       Security:
--         Authentication:         1
--         Authorization:          1
--       User Interface:
--         Templates:
--           Page:                 3
--           Region:               6
--           Label:                4
--           List:                 3
--           Popup LOV:            1
--           Button:               8
--           Report:               2
--         LOVs:                   4
--         Shortcuts:              3
--         Plug-ins:               8
--       PWA:
--       Globalization:
--         Messages:               4
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
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Oracle APEX Workspace / INTERNAL Login')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'A136000253731738748')
,p_page_view_logging=>'YES'
,p_charset=>'utf-8'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt_last_reset=>'20250422175137'
,p_bookmark_checksum_function=>'SH1'
,p_compatibility_mode=>'24.2'
,p_session_state_commits=>'IMMEDIATE'
,p_flow_language=>'pt-br'
,p_flow_language_derived_from=>'SESSION'
,p_date_format=>'&DATE_FORMAT.'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(540118315091694248.4555)
,p_populate_roles=>'A'
,p_application_tab_set=>1
,p_logo_type=>'C'
,p_logo=>'<img src="#IMAGE_PREFIX#apex_ui/apexlogo.png" width="280" height="20" alt="&PRODUCT_NAME." />'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'&PRODUCT_NAME.'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_authorize_public_pages_yn=>'Y'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_error_handling_function=>'wwv_flow_error_dev.internal_error_handler'
,p_substitution_string_01=>'PRODUCT_NAME'
,p_substitution_value_01=>'Oracle APEX'
,p_substitution_string_02=>'REGISTER_LINK'
,p_substitution_value_02=>'development_service_signup'
,p_substitution_string_03=>'CLOSE'
,p_substitution_value_03=>'Fechar'
,p_substitution_string_04=>'DATE_FORMAT'
,p_substitution_value_04=>'dd/mm/rr'
,p_substitution_string_05=>'LONG_DATE_FORMAT'
,p_substitution_value_05=>'fmDay dd "de" Month "de" yyyy'
,p_substitution_string_06=>'TIME_FORMAT'
,p_substitution_value_06=>'hh24:mi:ss'
,p_substitution_string_07=>'DATE_TIME_FORMAT'
,p_substitution_value_07=>'dd/mm/rr hh24:mi:ss'
,p_substitution_string_08=>'RETURN_TO_APPLICATION'
,p_substitution_value_08=>'Retornar ao Aplicativo'
,p_substitution_string_09=>'MSG_LANGUAGE'
,p_substitution_value_09=>'Idioma'
,p_substitution_string_10=>'MSG_COMPANY'
,p_substitution_value_10=>unistr('Espa\00E7o de Trabalho: &COMPANY.')
,p_substitution_string_11=>'MSG_COPYRIGHT'
,p_substitution_value_11=>unistr('Copyright \00A9 1999, 2024, Oracle e/ou suas empresas afiliadas.')
,p_substitution_string_12=>'VIEW'
,p_substitution_value_12=>'Exibir'
,p_substitution_string_13=>'MSG_JSCRIPT'
,p_substitution_value_13=>unistr('Voc\00EA deve executar este produto com o JavaScript ativado.')
,p_substitution_string_14=>'MSG_WORKSPACE'
,p_substitution_value_14=>unistr('Espa\00E7o de Trabalho')
,p_substitution_string_15=>'MSG_USER'
,p_substitution_value_15=>unistr('Usu\00E1rio')
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_version_scn=>2516487
,p_print_server_type=>'INSTANCE'
,p_file_storage=>'DB'
,p_is_pwa=>'N'
);
end;
/
prompt --application/user_interfaces
begin
wwv_flow_imp_shared.create_user_interface(
 p_id=>wwv_flow_imp.id(4555)
,p_theme_id=>3
,p_home_url=>'f?p=4100:1:&SESSION.'
,p_login_url=>'f?p=4550:1:&SESSION.'
,p_theme_style_by_user_pref=>false
,p_global_page_id=>.4555
,p_navigation_list_position=>'SIDE'
,p_include_legacy_javascript=>'PRE18:18'
,p_nav_bar_type=>'NAVBAR'
,p_nav_bar_template_options=>'#DEFAULT#'
);
end;
/
prompt --application/shared_components/navigation/lists/more_information
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(8560508234436339.4555)
,p_name=>'More Information'
,p_list_status=>'PUBLIC'
,p_version_scn=>75557508
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8561519934534279.4555)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>unistr('F\00F3rum de Discuss\00E3o')
,p_list_item_link_target=>'https://apex.oracle.com/forum'
,p_list_item_icon_attributes=>' alt=""'
,p_list_text_01=>unistr('Obtenha suporte gratuito orientado \00E0 comunidade para esclarecer suas d\00FAvidas sobre o Oracle APEX no f\00F3rum de discuss\00F5es do OTN. ')
,p_list_text_03=>'target="_blank"'
,p_translate_list_text_y_n=>'Y'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8565818427600114.4555)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Comunidade do Oracle APEX'
,p_list_item_link_target=>'https://apex.oracle.com/community'
,p_list_item_icon_attributes=>'alt=""'
,p_list_text_01=>unistr('Revisar refer\00EAncias, aplicativos, consultando empresas, hospedando empresas e muito mais.')
,p_list_text_03=>'target="_blank"'
,p_translate_list_text_y_n=>'Y'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8561901018538328.4555)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Atalhos do Oracle APEX'
,p_list_item_link_target=>'https://apex.oracle.com/shortcuts'
,p_list_item_icon_attributes=>'alt=""'
,p_list_text_01=>unistr('Uma cole\00E7\00E3o de URLs curtas e memor\00E1veis, que voc\00EA pode usar para navegar rapidamente para recursos APEX usados \200B\200Bcom frequ\00EAncia.')
,p_list_text_03=>'target="_blank"'
,p_translate_list_text_y_n=>'Y'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
end;
/
prompt --application/shared_components/navigation/lists/getting_started
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(8566004359605487.4555)
,p_name=>'Getting Started'
,p_list_status=>'PUBLIC'
,p_version_scn=>75557508
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8567403776605488.4555)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Saiba Mais'
,p_list_item_link_target=>'https://apex.oracle.com/learnmore'
,p_list_text_01=>unistr('Uma p\00E1gina para aqueles que s\00E3o iniciantes ou querem saber mais sobre o Oracle APEX.')
,p_list_text_03=>'rel="noopener noreferrer"'
,p_translate_list_text_y_n=>'Y'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8567723889605492.4555)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'apex.oracle.com'
,p_list_item_link_target=>'https://apex.oracle.com'
,p_list_item_icon_attributes=>'alt=""'
,p_list_text_01=>unistr('Um servi\00E7o hospedado gratuito no qual voc\00EA pode testar a vers\00E3o mais recente do Oracle APEX.')
,p_list_text_03=>'rel="noopener noreferrer"'
,p_translate_list_text_y_n=>'Y'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8568019160605492.4555)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Oracle Learning Library'
,p_list_item_link_target=>'https://oracle.com/oll'
,p_list_item_icon_attributes=>'alt=""'
,p_list_text_01=>unistr('O Oracle by Examples (OBEs) fornece arquivos de pr\00E9-requisitos e instru\00E7\00F5es passo a passo com capturas de tela que o conduzem pela cria\00E7\00E3o de v\00E1rios componentes do aplicativo.')
,p_list_text_03=>'rel="noopener noreferrer"'
,p_translate_list_text_y_n=>'Y'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
end;
/
prompt --application/shared_components/navigation/lists/tasks
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(115315832368341144.4555)
,p_name=>'Tasks'
,p_list_status=>'PUBLIC'
,p_version_scn=>75557508
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(155871030948668683.4555)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Redefinir Senha'
,p_list_item_link_target=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.::::'
,p_list_item_disp_cond_type=>'EXPRESSION'
,p_list_item_disp_condition=>'wwv_flow_authentication_dev.get_internal_authentication = ''APEX'''
,p_list_item_disp_condition2=>'PLSQL'
,p_list_text_01=>unistr('N\00E3o \00E9 poss\00EDvel acessar o seu espa\00E7o de trabalho? Tente redefinir sua senha aqui.')
,p_translate_list_text_y_n=>'Y'
,p_security_scheme=>'!'||wwv_flow_imp.id(6153929631135099)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(22951230716918778.4555)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>unistr('Localizar Meu Espa\00E7o de Trabalho')
,p_list_item_link_target=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.::::'
,p_list_text_01=>unistr('N\00E3o lembra a quais espa\00E7os de trabalho voc\00EA est\00E1 associado? Localize-os aqui.')
,p_translate_list_text_y_n=>'Y'
,p_security_scheme=>'!'||wwv_flow_imp.id(6153929631135099)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6096909608250810.4555)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>unistr('Administra\00E7\00E3o')
,p_list_item_link_target=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.::::'
,p_list_item_disp_cond_type=>'EXPRESSION'
,p_list_item_disp_condition=>'not wwv_flow_security.disable_admin_login'
,p_list_item_disp_condition2=>'PLSQL'
,p_list_text_01=>unistr('Acesse os Servi\00E7os de Administra\00E7\00E3o.')
,p_translate_list_text_y_n=>'Y'
,p_security_scheme=>'!'||wwv_flow_imp.id(6153929631135099)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11365419809816264.4555)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>unistr('Solicitar um Espa\00E7o de Trabalho')
,p_list_item_link_target=>'&F4550_SERVICE_REQUEST_URL.'
,p_list_item_disp_cond_type=>'EXPRESSION'
,p_list_item_disp_condition=>'wwv_flow_platform.get_preference( p_preference_name => ''SERVICE_REQUEST_FLOW'' ) <> ''MANUAL'''
,p_list_item_disp_condition2=>'PLSQL'
,p_list_text_01=>unistr('Conclua este assistente para solicitar seu pr\00F3prio espa\00E7o de trabalho.')
,p_list_text_10=>'javascript:popUp2(''&F4550_SERVICE_REQUEST_URL.'',''1000'',''600'');'
,p_translate_list_text_y_n=>'Y'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
end;
/
prompt --application/shared_components/navigation/lists/site_specific_tasks
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(787389949330441085.4555)
,p_name=>'Site Specific Tasks'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1, task_name label, ',
'       nvl(task_link,''#'')            target, ',
'       null             is_current_list_entry,',
'       null             image, ',
'       null             image_attribute,',
'       null             image_alt_attribute,',
'       null             attribute1,',
'       null             attribute2,',
'       null             attribute3,',
'       null             attribute4,',
'       null             attribute5,',
'       null             attribute6,',
'       null             attribute7,',
'       null             attribute8,',
'       null             attribute9,',
'       null             attribute10',
'from wwv_flow_customized_tasks ',
'where displayed = ''Y'' and display_location = ''WORKSPACE_LOGIN'' and',
'      task_name is not null',
'order by display_sequence'))
,p_list_status=>'PUBLIC'
,p_version_scn=>75557508
);
end;
/
prompt --application/shared_components/navigation/lists/list_of_workspaces
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(788072921346081694.4555)
,p_name=>'List of Workspaces'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1,',
'       case when workspace_short_name = ''INTERNAL'' then',
'           wwv_flow_lang.message(''WORKSPACE_INTERNAL'')',
'       else',
'           nvl(workspace_display_name,workspace_short_name)',
'       end label,',
'       ''javascript:apex.submit(''''GO_WORKSPACE ''||wwv_flow_escape.js_literal(workspace_short_name,null)||'''''');'' target,',
'       null is_current_list_entry,',
'       case when workspace_short_name = ''INTERNAL'' then',
'           ''icon-util-font-apex''',
'       else',
'           ''icon-login-workspace''',
'       end image,',
'       null image_attribute,',
'       null image_alt_attribute,',
'       wwv_flow_lang.system_message(''LAST_LOGIN'')||'' ''||nvl(htmldb_util.get_since(last_login),wwv_flow_lang.system_message(''UNKNOWN'')) attribute1,',
'       developer_role attribute2,',
'       null attribute3,',
'       null attribute4,',
'       null attribute5,',
'       null attribute6,',
'       null attribute7,',
'       null attribute8,',
'       null attribute9,',
'       null attribute10',
'  from wwv_flow_developer_workspaces',
' where developer_name   = :APP_USER',
'   and workspace_status = ''ASSIGNED''',
' order by workspace_display_name'))
,p_list_status=>'PUBLIC'
,p_version_scn=>75557508
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
 p_id=>wwv_flow_imp.id(904950677464426.4555)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'default_icon', 'fa-star',
  'tooltip', '#VALUE#')).to_clob
,p_version_scn=>7007818
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1278956154450573.4555)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SELECT_MANY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_values_as', 'separated')).to_clob
,p_version_scn=>7007816
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1284667310777249.4555)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'NATIVE_OPEN_AI_ASSISTANT'
,p_version_scn=>16259055
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1308659493186468.4555)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_BOSS'
,p_version_scn=>243439152
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(3198333543136453.4555)
,p_plugin_type=>'PROCESS TYPE'
,p_plugin=>'NATIVE_GEOCODING'
,p_attribute_01=>'RELAX_HOUSE_NUMBER'
,p_version_scn=>117642695
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(14859123746941041.4555)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_style', 'SWITCH_CB',
  'off_value', 'N',
  'on_value', 'Y')).to_clob
,p_version_scn=>6539585
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(99844960795888905.4555)
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
 p_id=>wwv_flow_imp.id(118481343090833028.4555)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_MAP_REGION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_vector_tile_layers', 'Y')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(123214141121478467.4555)
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
 p_id=>wwv_flow_imp.id(124389883386989299.4555)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_ADFBC'
,p_version_scn=>37165931336889
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(176129140563506820.4555)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N')).to_clob
,p_version_scn=>7007823
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1765072874220712055.4555)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'include_slider', 'N')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1831780317545994155.4555)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'actions_menu_structure', 'IG')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1917654134230939994.4555)
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
 p_id=>wwv_flow_imp.id(6153929631135099.4555)
,p_name=>'SSO authentication'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return wwv_flow_authentication_dev.get_internal_authentication not in (''APEX'',''CLOUD_IDM'',''LDAP'',''DB'');'
,p_error_message=>unistr('O SSO do Builder n\00E3o est\00E1 ativado')
,p_version_scn=>2621731
,p_caching=>'BY_USER_BY_SESSION'
);
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
null;
end;
/
prompt --application/shared_components/logic/application_items/company
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(387608696699373799.4555)
,p_name=>'COMPANY'
,p_scope=>'GLOBAL'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/error_occurred
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(47291523209584096.4555)
,p_name=>'ERROR_OCCURRED'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/f4550_service_request_url
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(16763020509404219.4555)
,p_name=>'F4550_SERVICE_REQUEST_URL'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/fsp_after_login_url
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(510231751281890.4555)
,p_name=>'FSP_AFTER_LOGIN_URL'
,p_escape_on_http_output=>'N'
,p_item_comment=>'Used by Custom2 authentication for deep linking support'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/g_cloud_return_url
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(1788752932141210549.4555)
,p_name=>'G_CLOUD_RETURN_URL'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/login_message
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(6109409795714510.4555)
,p_name=>'LOGIN_MESSAGE'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_items/product_type
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(5714319922471249.4555)
,p_name=>'PRODUCT_TYPE'
,p_protection_level=>'N'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887405
);
end;
/
prompt --application/shared_components/logic/application_computations/company
begin
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(387608942992380280.4555)
,p_computation_sequence=>10
,p_computation_item=>'COMPANY'
,p_computation_point=>'AFTER_LOGIN'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'wwv_flow.get_company_name;'
,p_computation_error_message=>unistr('N\00E3o \00E9 poss\00EDvel calcular o nome do espa\00E7o de trabalho.')
,p_version_scn=>37165770887460
);
end;
/
prompt --application/shared_components/logic/application_computations/f4550_service_request_url
begin
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(16766113976430755.4555)
,p_computation_sequence=>10
,p_computation_item=>'F4550_SERVICE_REQUEST_URL'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_url varchar2(255) := null;',
'begin',
'    l_url := wwv_flow_platform.get_preference(''SERVICE_REQUEST_FLOW'');',
'    if l_url in (''EMAIL'', ''AUTO'') then',
'        l_url := ''4700'';',
'    end if;',
'',
'    return ''f?p='' || l_url || '':2:'' || :APP_SESSION;',
'end;'))
,p_compute_when=>'nvl(wwv_flow_platform.get_preference(''SERVICE_REQUEST_FLOW''),''MANUAL'') <> ''MANUAL'''
,p_compute_when_text=>'PLSQL'
,p_compute_when_type=>'EXPRESSION'
,p_computation_error_message=>unistr('Erro no c\00E1lculo de F4550_SERVICE_REQUEST_URL: #SQLERRM#')
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
null;
end;
/
prompt --application/shared_components/user_interface/lovs/hr_or_new
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(20203615154961597.4555)
,p_lov_name=>'HR_OR_NEW'
,p_lov_query=>'.'||wwv_flow_imp.id(20203615154961597)||'.'
,p_location=>'STATIC'
,p_version_scn=>75557508
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(20203830364961608.4555)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>unistr('Desbloquear o exemplo de conta do usu\00E1rio HR')
,p_lov_return_value=>'HR'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(20204016953961621.4555)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>unistr('Criar uma nova conta de usu\00E1rio')
,p_lov_return_value=>'NEW'
);
end;
/
prompt --application/shared_components/user_interface/lovs/language_pref
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(91126801753691270.4555)
,p_lov_name=>'LANGUAGE_PREF'
,p_lov_query=>'.'||wwv_flow_imp.id(91126801753691270)||'.'
,p_location=>'STATIC'
,p_version_scn=>75557508
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(91127127653691273.4555)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>unistr('Chin\00EAs (China)')
,p_lov_return_value=>'zh-cn'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(91127305990691273.4555)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>unistr('Chin\00EAs (Taiwan)')
,p_lov_return_value=>'zh-tw'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(91127504317691273.4555)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>unistr('Ingl\00EAs')
,p_lov_return_value=>'en'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(91127702350691274.4555)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>unistr('Franc\00EAs')
,p_lov_return_value=>'fr'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(91127924193691274.4555)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>unistr('Alem\00E3o')
,p_lov_return_value=>'de'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(91128105057691274.4555)
,p_lov_disp_sequence=>6
,p_lov_disp_value=>'Italiano'
,p_lov_return_value=>'it'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(91128314741691274.4555)
,p_lov_disp_sequence=>7
,p_lov_disp_value=>unistr('Japon\00EAs')
,p_lov_return_value=>'ja'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(91128529839691275.4555)
,p_lov_disp_sequence=>8
,p_lov_disp_value=>'Coreano'
,p_lov_return_value=>'ko'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(91128730790691277.4555)
,p_lov_disp_sequence=>9
,p_lov_disp_value=>unistr('Portugu\00EAs (Brasil)')
,p_lov_return_value=>'pt-br'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(91128912347691277.4555)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Espanhol'
,p_lov_return_value=>'es'
);
end;
/
prompt --application/shared_components/user_interface/lovs/remember_workspace_username
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(176634981412406067.4555)
,p_lov_name=>'REMEMBER_WORKSPACE_USERNAME'
,p_lov_query=>'.'||wwv_flow_imp.id(176634981412406067)||'.'
,p_location=>'STATIC'
,p_version_scn=>75557508
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(176635264449406069.4555)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>unistr('Lembrar espa\00E7o de trabalho e nome do usu\00E1rio')
,p_lov_return_value=>'Y'
);
end;
/
prompt --application/shared_components/user_interface/lovs/roles
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(20420213496266810.4555)
,p_lov_name=>'ROLES'
,p_lov_query=>'.'||wwv_flow_imp.id(20420213496266810)||'.'
,p_location=>'STATIC'
,p_version_scn=>75557508
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(20420400631266813.4555)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Desenvolvimento de Banco de Dados (RECURSO)'
,p_lov_return_value=>'RESOURCE'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(20420610391266814.4555)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Administrativo (DBA)'
,p_lov_return_value=>'DBA'
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
prompt --application/shared_components/user_interface/templates/page/apex_5_0_workspace_login
begin
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(781636565276262406.4555)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Workspace Login.pt-br'
,p_internal_name=>'APEX_5.0_WORKSPACE_LOGIN'
,p_is_popup=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(function() {',
'  $(''a.a-Login-slideNavLink[href*="#"]:not([href="#"])'').click(function() {',
'    var target = $(this.hash);',
'    target = target.length ? target : $(''[name='' + this.hash.slice(1) +'']'');',
'    if (target.length) {',
'      $(''html,body'').animate({',
'        scrollTop: target.offset().top',
'      }, 500);',
'      return false;',
'    }',
'  });',
'});'))
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
'<body class="a-Page--login #PAGE_CSS_CLASSES#" #ONLOAD#>',
'<noscript>&MSG_JSCRIPT.</noscript>',
'#ENVIRONMENT_BANNER#',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<header>',
'#REGION_POSITION_07#',
'#REGION_POSITION_08#',
'#REGION_POSITION_01#',
'</header>',
'<main class="u-Layout u-Layout--centerVertically a-Login-slide" id="top">',
'  #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'  <div class="a-Login-container">',
'  #BODY#',
'  </div>',
'  <div class="a-Login-slideNav a-Login-slideNav--down">',
'    <a href="#info" aria-label="&APP_TEXT$APEX_SCROLL_DOWN." title="&APP_TEXT$APEX_SCROLL_DOWN." class="a-Login-slideNavLink"><span class="a-Icon icon-shuttle-down"></span></a>',
'  </div>',
'</main>',
'<aside class="u-Layout u-Layout--centerVertically a-Login-slide a-Login-slide--secondary" id="info">',
'  <div class="a-Login-secondaryContent">',
'  #REGION_POSITION_03#',
'  </div>',
'  <div class="a-Login-slideNav  a-Login-slideNav--up">',
'    <a href="#top" aria-label="&APP_TEXT$APEX_SCROLL_TO_TOP." title="&APP_TEXT$APEX_SCROLL_TO_TOP." class="a-Login-slideNavLink"><span class="a-Icon icon-shuttle-up"></span></a>',
'  </div>',
'</aside>'))
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
'<div class="a-AlertMessages a-AlertMessages--page" id="sucessMsg" role="region" aria-labelledby="successMsg-Heading">',
' <div class="a-AlertMessages-item">',
'  <div class="a-MediaBlock a-AlertMessages-message is-success">',
'    <div class="a-MediaBlock-graphic">',
'      <span class="a-Icon a-Icon--medium icon-check" role="img" aria-label=''&"APP_TEXT$APEXDEV.ICON_LABEL.SUCCESS"!HTML.''></span> ',
'    </div>',
'    <div class="a-MediaBlock-content">',
'      <h2 id="successMsg-Heading" class="u-vh">#SUCCESS_MESSAGE_HEADING#</h2>',
'      <div class="a-AlertMessages-messageTitle" id="sucessMsg-Message" role="alert">#SUCCESS_MESSAGE#</div>',
'      <button id="sucessMsg-Close" class="a-Button a-Button--small a-Button--noUI a-Button--noLabel a-Button--withIcon a-Button--alertMessages" type="button" title="#CLOSE_NOTIFICATION#" aria-label="#CLOSE_NOTIFICATION#" onclick="$x_Remove(''sucessMsg'
||''');return false;"><span class="a-Icon icon-remove"></span></button>',
'    </div>',
'  </div>',
' </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-AlertMessages a-AlertMessages--page" role="region" aria-labelledby="errorMsg-Heading" id="errorMsg">',
' <div class="a-AlertMessages-item">',
'  <div class="a-MediaBlock a-AlertMessages-message is-error">',
'    <div class="a-MediaBlock-graphic" role="img" aria-label=''&"APP_TEXT$APEXDEV.ICON_LABEL.WARNING"!HTML.''>',
'      <span class="a-Icon a-Icon--medium icon-remove"></span> ',
'    </div>',
'    <div class="a-MediaBlock-content">',
'      <h2 class="u-vh" id="errorMsg-Heading" class="a-Alert-title">#ERROR_MESSAGE_HEADING#</h2>',
'      <div role="alert" class="a-AlertMessages-messageTitle" id="errorMsg-Message">#MESSAGE#</div>',
'      <button id="errorMsg-Close" class="a-Button a-Button--small a-Button--noUI a-Button--noLabel a-Button--withIcon a-Button--alertMessages" type="button" title="#CLOSE_NOTIFICATION#" aria-label="#CLOSE_NOTIFICATION#" onclick="$x_Remove(''errorMsg'')'
||';return false;"><span class="a-Icon icon-remove"></span></button>',
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
 p_id=>wwv_flow_imp.id(4067279651618676.4555)
,p_page_template_id=>wwv_flow_imp.id(781636565276262406.4555)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(4067731833618677.4555)
,p_page_template_id=>wwv_flow_imp.id(781636565276262406.4555)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(4068232621618677.4555)
,p_page_template_id=>wwv_flow_imp.id(781636565276262406.4555)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(4068730226618677.4555)
,p_page_template_id=>wwv_flow_imp.id(781636565276262406.4555)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(4069204973618677.4555)
,p_page_template_id=>wwv_flow_imp.id(781636565276262406.4555)
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
prompt --application/shared_components/user_interface/templates/page/apex_5_0_workspace_login_secondary_page
begin
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(787783544361971642.4555)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Workspace Login Secondary Page.pt-br'
,p_internal_name=>'APEX_5.0_WORKSPACE_LOGIN_SECONDARY_PAGE'
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
'<body class="a-Page--login #PAGE_CSS_CLASSES#" #ONLOAD#>',
'<noscript>&MSG_JSCRIPT.</noscript>',
'#ENVIRONMENT_BANNER#',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<header>',
'#REGION_POSITION_07#',
'#REGION_POSITION_08#',
'#REGION_POSITION_01#',
'</header>',
'<main class="u-Layout u-Layout--centerVertically a-Login-slide" id="top">',
'  #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'  <div class="a-Login-container">',
'  #BODY#',
'  </div>',
'</main>',
'#REGION_POSITION_03#',
''))
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
'<div class="a-AlertMessages a-AlertMessages--page" id="sucessMsg" role="region" aria-labelledby="successMsg-Heading">',
' <div class="a-AlertMessages-item">',
'  <div class="a-MediaBlock a-AlertMessages-message is-success">',
'    <div class="a-MediaBlock-graphic">',
'      <span class="a-Icon a-Icon--medium icon-check" role="img" aria-label=''&"APP_TEXT$APEXDEV.ICON_LABEL.SUCCESS"!HTML.''></span> ',
'    </div>',
'    <div class="a-MediaBlock-content">',
'      <h2 id="successMsg-Heading" class="u-vh">#SUCCESS_MESSAGE_HEADING#</h2>',
'      <div class="a-AlertMessages-messageTitle" id="sucessMsg-Message" role="alert">#SUCCESS_MESSAGE#</div>',
'      <button id="sucessMsg-Close" class="a-Button a-Button--small a-Button--noUI a-Button--noLabel a-Button--withIcon a-Button--alertMessages" type="button" title="#CLOSE_NOTIFICATION#" aria-label="#CLOSE_NOTIFICATION#" onclick="$x_Remove(''sucessMsg'
||''');return false;"><span class="a-Icon icon-remove"></span></button>',
'    </div>',
'  </div>',
' </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-AlertMessages a-AlertMessages--page" role="region" aria-labelledby="errorMsg-Heading" id="errorMsg">',
' <div class="a-AlertMessages-item">',
'  <div class="a-MediaBlock a-AlertMessages-message is-error">',
'    <div class="a-MediaBlock-graphic" role="img" aria-label=''&"APP_TEXT$APEXDEV.ICON_LABEL.WARNING"!HTML.''>',
'      <span class="a-Icon a-Icon--medium icon-remove"></span> ',
'    </div>',
'    <div class="a-MediaBlock-content">',
'      <h2 class="u-vh" id="errorMsg-Heading" class="a-Alert-title">#ERROR_MESSAGE_HEADING#</h2>',
'      <div role="alert" class="a-AlertMessages-messageTitle" id="errorMsg-Message">#MESSAGE#</div>',
'      <button id="errorMsg-Close" class="a-Button a-Button--small a-Button--noUI a-Button--noLabel a-Button--withIcon a-Button--alertMessages" type="button" title="#CLOSE_NOTIFICATION#" aria-label="#CLOSE_NOTIFICATION#" onclick="$x_Remove(''errorMsg'')'
||';return false;"><span class="a-Icon icon-remove"></span></button>',
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
 p_id=>wwv_flow_imp.id(140035631980349510.4555)
,p_page_template_id=>wwv_flow_imp.id(787783544361971642.4555)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140035749708349510.4555)
,p_page_template_id=>wwv_flow_imp.id(787783544361971642.4555)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140035873933349510.4555)
,p_page_template_id=>wwv_flow_imp.id(787783544361971642.4555)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140035946892349510.4555)
,p_page_template_id=>wwv_flow_imp.id(787783544361971642.4555)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140036091738349510.4555)
,p_page_template_id=>wwv_flow_imp.id(787783544361971642.4555)
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
 p_id=>wwv_flow_imp.id(788153963797526843.4555)
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
 p_id=>wwv_flow_imp.id(1514771211875371.4555)
,p_page_template_id=>wwv_flow_imp.id(788153963797526843.4555)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1515285207875372.4555)
,p_page_template_id=>wwv_flow_imp.id(788153963797526843.4555)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1515772780875372.4555)
,p_page_template_id=>wwv_flow_imp.id(788153963797526843.4555)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1516299556875372.4555)
,p_page_template_id=>wwv_flow_imp.id(788153963797526843.4555)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1516741080875372.4555)
,p_page_template_id=>wwv_flow_imp.id(788153963797526843.4555)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1517237038875372.4555)
,p_page_template_id=>wwv_flow_imp.id(788153963797526843.4555)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1517794074875373.4555)
,p_page_template_id=>wwv_flow_imp.id(788153963797526843.4555)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1518213018875373.4555)
,p_page_template_id=>wwv_flow_imp.id(788153963797526843.4555)
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
prompt --application/shared_components/user_interface/templates/button/a_button_login_page_only
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(20301506730451152.4555)
,p_template_name=>'<a> button login page only'
,p_internal_name=>'<A>_BUTTON_LOGIN_PAGE_ONLY'
,p_template=>'<a href="#LINK#" title="#LABEL!ATTR#" style="text-align:center;font-size:10px;display:block;margin:2px;">#LABEL!HTML#</a>'
,p_translate_this_template=>'N'
,p_theme_class_id=>0
,p_template_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table class="xpbutton" cellspacing="0" cellpadding="0" border="0"  summary="">',
'<tbody class="FFFFFF">',
'<tr>',
'<td class="L" width="4"><img src="#IMAGE_PREFIX#1px_trans.gif" alt="" height="1" width="4"/></td>',
'<td class="C"><a href="#LINK#">#LABEL#</a></td>',
'<td class="R" width="4"><img src="#IMAGE_PREFIX#1px_trans.gif" alt="" height="1" width="4"/></td>',
'</tr>',
'</tbody>',
'</table>'))
,p_theme_id=>3
);
end;
/
prompt --application/shared_components/user_interface/templates/button/apex_4_1_button
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(300732121515523410.4555)
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
,p_theme_id=>3
);
end;
/
prompt --application/shared_components/user_interface/templates/button/html_button_legacy_apex_5_migration
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(629209698915957087.4555)
,p_template_name=>'HTML button (legacy - APEX 5 migration)'
,p_internal_name=>'HTML_BUTTON_LEGACY_APEX_5_MIGRATION'
,p_template=>'<input type="button" value="#LABEL!ATTR#" onclick="#JAVASCRIPT#" id="#BUTTON_ID#" class="#BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#/>'
,p_hot_template=>'<input type="button" value="#LABEL!ATTR#" onclick="#JAVASCRIPT#" id="#BUTTON_ID#" class="#BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#/>'
,p_translate_this_template=>'N'
,p_theme_class_id=>13
,p_template_comment=>'5.0 upgrade'
,p_theme_id=>3
);
end;
/
prompt --application/shared_components/user_interface/templates/button/apex_5_0_text_link
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(781649650278313424.4555)
,p_template_name=>'APEX 5.0 - Text Link'
,p_internal_name=>'APEX_5.0_TEXT_LINK'
,p_template=>'<a href="#LINK#" class="#BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL!HTML#</a>'
,p_hot_template=>'<a href="#LINK#" class="#BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL!HTML#</a>'
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
end;
/
prompt --application/shared_components/user_interface/templates/button/apex_5_0_button
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(781653829819356486.4555)
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
 p_id=>wwv_flow_imp.id(781654005571356486.4555)
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
 p_id=>wwv_flow_imp.id(781654809938356489.4555)
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
 p_id=>wwv_flow_imp.id(781655181102356490.4555)
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
prompt --application/shared_components/user_interface/templates/region/apex_4_0_underlined_title
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(5717529496540150.4555)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'<div style="float:left;width:98%;padding:4px;border-bottom: 1px solid #cccccc;">',
'<div style="float:left;font-size:16px;color:#808080;"><h2 data-apex-heading>#TITLE#</h2></div>',
'<div style="float:left">#CLOSE#&nbsp;&nbsp;#EDIT##DELETE##CREATE##CREATE2#<img src="#IMAGE_PREFIX#htmldb/builder/1px_trans.gif" alt="" height="1" width="5" />#PREVIOUS##NEXT#</div></div>',
'<div style="float:left;padding:4px;">#BODY#</div>',
'</div>'))
,p_page_plug_template_name=>'[x] APEX 4.0 - Underlined Title'
,p_internal_name=>'APEX_4.0_UNDERLINED_TITLE'
,p_plug_table_bgcolor=>'#FFFFFF'
,p_theme_id=>3
,p_theme_class_id=>0
,p_plug_heading_bgcolor=>'#FFFFFF'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_form_table_attr=>'class="instructiontext"'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2172150847470763.4555)
,p_plug_template_id=>wwv_flow_imp.id(5717529496540150.4555)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2172630852470763.4555)
,p_plug_template_id=>wwv_flow_imp.id(5717529496540150.4555)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2173123325470763.4555)
,p_plug_template_id=>wwv_flow_imp.id(5717529496540150.4555)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2173680411470763.4555)
,p_plug_template_id=>wwv_flow_imp.id(5717529496540150.4555)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2174031857470763.4555)
,p_plug_template_id=>wwv_flow_imp.id(5717529496540150.4555)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2174575466470763.4555)
,p_plug_template_id=>wwv_flow_imp.id(5717529496540150.4555)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2175083419470764.4555)
,p_plug_template_id=>wwv_flow_imp.id(5717529496540150.4555)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2175537420470764.4555)
,p_plug_template_id=>wwv_flow_imp.id(5717529496540150.4555)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2176073507470764.4555)
,p_plug_template_id=>wwv_flow_imp.id(5717529496540150.4555)
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
prompt --application/shared_components/user_interface/templates/region/apex_4_1_button_region
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(355286322831861132.4555)
,p_layout=>'TABLE'
,p_template=>'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>#BODY#</div>'
,p_page_plug_template_name=>'APEX 4.1 - Button Region'
,p_internal_name=>'APEX_4.1_BUTTON_REGION'
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
 p_id=>wwv_flow_imp.id(140528869799344485.4555)
,p_plug_template_id=>wwv_flow_imp.id(355286322831861132.4555)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140528984905344484.4555)
,p_plug_template_id=>wwv_flow_imp.id(355286322831861132.4555)
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
prompt --application/shared_components/user_interface/templates/region/apex_5_0_workspace_login_region
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(781646415851311877.4555)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Login-region a-Form--stretchInputs #REGION_CSS_CLASSES#" id="#REGION_ID#" #REGION_LANDMARK_ATTRIBUTES# #REGION_ATTRIBUTES#>',
'  <div class="a-Login-header">',
'    <span class="a-Login-logo gi-icon-apex-logo-icon" aria-hidden="true"></span>',
'    <h1 class="a-Login-title" id="#REGION_STATIC_ID#_TITLE" data-apex-heading>#TITLE#</h1>',
'  </div>',
'  <div class="a-Login-body">',
'    #BODY#',
'  </div>',
'  <div class="a-Login-buttons">',
'    #NEXT#',
'  </div>',
'  <div class="a-Login-links">',
'    #EDIT##CREATE#',
'  </div>',
'  #SUB_REGIONS#',
'</div>'))
,p_page_plug_template_name=>'APEX 5.0 - Workspace Login Region'
,p_internal_name=>'APEX_5.0_WORKSPACE_LOGIN_REGION'
,p_theme_id=>3
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_default_landmark_type=>'form'
,p_region_title_dom_id=>'#REGION_STATIC_ID#_TITLE'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1729010960431753.4555)
,p_plug_template_id=>wwv_flow_imp.id(781646415851311877.4555)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1729572738431753.4555)
,p_plug_template_id=>wwv_flow_imp.id(781646415851311877.4555)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1730035090431753.4555)
,p_plug_template_id=>wwv_flow_imp.id(781646415851311877.4555)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1730592292431753.4555)
,p_plug_template_id=>wwv_flow_imp.id(781646415851311877.4555)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1731002738431754.4555)
,p_plug_template_id=>wwv_flow_imp.id(781646415851311877.4555)
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
 p_id=>wwv_flow_imp.id(781705991385407800.4555)
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
 p_id=>wwv_flow_imp.id(32604437290747559.4555)
,p_plug_template_id=>wwv_flow_imp.id(781705991385407800.4555)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32604969565747559.4555)
,p_plug_template_id=>wwv_flow_imp.id(781705991385407800.4555)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32605476440747560.4555)
,p_plug_template_id=>wwv_flow_imp.id(781705991385407800.4555)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32605983280747560.4555)
,p_plug_template_id=>wwv_flow_imp.id(781705991385407800.4555)
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
prompt --application/shared_components/user_interface/templates/region/apex_5_0_workspace_login_content_region
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(781720832587518133.4555)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Login-infoRegion #REGION_CSS_CLASSES#" id="#REGION_ID#" #REGION_LANDMARK_ATTRIBUTES# #REGION_ATTRIBUTES#>',
'  <div class="a-Login-infoRegion-header">',
'    <h2 class="a-Login-infoRegion-title" id="#REGION_STATIC_ID#_TITLE" data-apex-heading>#TITLE#</h2>',
'  </div>',
'  <div class="a-Login-infoRegion-body">',
'  #BODY#',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'[x] APEX 5.0 - Workspace Login Content Region'
,p_internal_name=>'APEX_5.0_WORKSPACE_LOGIN_CONTENT_REGION'
,p_theme_id=>3
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_default_landmark_type=>'region'
,p_region_title_dom_id=>'#REGION_STATIC_ID#_TITLE'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3399904465512369.4555)
,p_plug_template_id=>wwv_flow_imp.id(781720832587518133.4555)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3400417092512369.4555)
,p_plug_template_id=>wwv_flow_imp.id(781720832587518133.4555)
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
prompt --application/shared_components/user_interface/templates/region/apex_5_0_workspace_selection_region
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(788096697713098503.4555)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Login-region a-Form--stretchInputs #REGION_CSS_CLASSES#" id="#REGION_ID#" #REGION_ATTRIBUTES#>',
'  <div class="a-Login-header">',
'    <span class="a-Login-logo gi-icon-apex-logo-icon"></span>',
'    <h1 class="a-Login-title">#TITLE#</h1>',
'  </div>',
'  <div class="a-Login-body">',
'    #BODY#',
'    #SUB_REGIONS#',
'  </div>',
'  <div class="a-Login-buttons">',
'    #NEXT#',
'  </div>',
'  <div class="a-Login-links">',
'    #EDIT##CREATE#',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'APEX 5.0 - Workspace Selection Region'
,p_internal_name=>'APEX_5.0_WORKSPACE_SELECTION_REGION'
,p_theme_id=>3
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140530140399344483.4555)
,p_plug_template_id=>wwv_flow_imp.id(788096697713098503.4555)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140530202610344483.4555)
,p_plug_template_id=>wwv_flow_imp.id(788096697713098503.4555)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140530304076344483.4555)
,p_plug_template_id=>wwv_flow_imp.id(788096697713098503.4555)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140530400077344483.4555)
,p_plug_template_id=>wwv_flow_imp.id(788096697713098503.4555)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140530517407344483.4555)
,p_plug_template_id=>wwv_flow_imp.id(788096697713098503.4555)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/list/simple_image_list
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(5724325438599633.4555)
,p_list_template_current=>'<li><a href="#LINK#" title="#TEXT#">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#" title="#TEXT#">#TEXT#</a></li>'
,p_list_template_name=>'Simple Image List'
,p_internal_name=>'SIMPLE_IMAGE_LIST'
,p_theme_id=>3
,p_theme_class_id=>0
,p_list_template_before_rows=>'<ul class="listwithicon">'
,p_list_template_after_rows=>'</ul>'
,p_list_template_comment=>'<img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# />'
);
end;
/
prompt --application/shared_components/user_interface/templates/list/apex_5_0_links_list
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(85971030932131423.4555)
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
prompt --application/shared_components/user_interface/templates/list/apex_5_0_media_list
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(781726379075536728.4555)
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
prompt --application/shared_components/user_interface/templates/report/workspace_selection_4550_20
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(3698594943076.4555)
,p_row_template_name=>'Workspace Selection (4550:20)'
,p_internal_name=>'WORKSPACE_SELECTION_4550:20'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li>',
'  <a id="WORKSPACE-#ROWNUM#" href="javascript:apex.submit(''GO_WORKSPACE #WORKSPACE_SHORT_NAME#'');" class="workspaceInfo" style="padding: 10px 10px; width: 100%;">',
'    <h2>#WORKSPACE_DISPLAY_NAME#</h2>',
'    <h3>',
'      <strong style="font-size:11px;">#DEVELOPER_ROLE#</strong><br/>',
'      #LAST_LOGIN_MSG#: #LAST_LOGIN#',
'    </h3>',
'  </a>',
'  <div class="clear"></div>',
'</li>'))
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li>',
'  <a href="javascript:apex.submit(''GO_WORKSPACE #WORKSPACE_SHORT_NAME#'');" class="workspaceImage">',
'    <img src="#WORKSPACE_IMAGE_URL#" alt="" />',
'  </a>',
'  <a href="javascript:apex.submit(''GO_WORKSPACE #WORKSPACE_SHORT_NAME#'');" class="workspaceInfo" style="width: 75%;">',
'    <h2>#WORKSPACE_DISPLAY_NAME#</h2>',
'    <h3>',
'      <strong style="font-size:11px;">#DEVELOPER_ROLE#</strong><br/>',
'      <span class="workspaceDescription">#WORKSPACE_DESCRIPTION#</span>',
'    </h3>',
'  </a>',
'  <div class="clear"></div>',
'</li>'))
,p_row_template_before_rows=>' <ul class="workspacesList">'
,p_row_template_after_rows=>' </ul>'
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
prompt --application/shared_components/user_interface/templates/report/apex_4_2_unordered_list
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(232064200547094797.4555)
,p_row_template_name=>'APEX 4.2 - Unordered List'
,p_internal_name=>'APEX_4.2_UNORDERED_LIST'
,p_row_template1=>'<li>#COLUMN_VALUE#</li>'
,p_row_template_before_rows=>'<ul #REPORT_ATTRIBUTES#>'
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
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/formfield_required
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(14882217773748275.4555)
,p_template_name=>'FormField_Required'
,p_internal_name=>'FORMFIELD_REQUIRED'
,p_template_body1=>'<em>*</em><label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="aLabel aRequired"><a href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'',''&CLOSE.'')" tabindex="999">'
,p_template_body2=>' <span class="hideMeButHearMe">(#VALUE_REQUIRED#)</span></a></label>'
,p_on_error_after_label=>'<small class="aError">#ERROR_MESSAGE#</small>'
,p_theme_id=>3
,p_theme_class_id=>2
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/formfield_optional
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(44225917854582269.4555)
,p_template_name=>'FormField_Optional'
,p_internal_name=>'FORMFIELD_OPTIONAL'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="aLabel aOptional"><a href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'',''&CLOSE.'')" tabindex="999">'
,p_template_body2=>'</a></label>'
,p_on_error_after_label=>'<small class="aError">#ERROR_MESSAGE#</small>'
,p_theme_id=>3
,p_theme_class_id=>1
,p_translate_this_template=>'N'
,p_template_comment=>'<label for="#CURRENT_ITEM_NAME#"><a class="htmldbLabelOptional" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'',''&CLOSE.'')" tabindex="999">'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/apex_5_0_workspace_login_hidden_label
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(176608736253329086.4555)
,p_template_name=>'APEX 5.0 - Workspace Login Hidden Label'
,p_internal_name=>'APEX_5.0_-_WORKSPACE_LOGIN_HIDDEN_LABEL'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="a-Icon a-Login-iconLabel a-Login-hiddenLabel u-VisuallyHidden">'
,p_template_body2=>'</label>'
,p_before_item=>'<div class="a-Form-fieldContainer a-Form-fieldContainer--hiddenLabel #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#"><div class="a-Form-inputContainer">'
,p_after_item=>'#HELP_TEMPLATE#</div></div>'
,p_after_element=>'#ERROR_TEMPLATE#'
,p_help_link=>'<button class="a-Button a-Button--noUI a-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help"></span><span class="u-VisuallyHidden">#CURRENT_ITE'
||'M_HELP_LABEL#</span></button>'
,p_error_template=>'<span class="a-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>3
,p_theme_class_id=>4
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/apex_5_0_workspace_login_label
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(781639159048309153.4555)
,p_template_name=>'APEX 5.0 - Workspace Login Label'
,p_internal_name=>'APEX_5.0_WORKSPACE_LOGIN_LABEL'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="a-Icon a-Login-iconLabel" aria-hidden="true"></span>',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="u-vh">'))
,p_template_body2=>'</label>'
,p_before_item=>'<div class="a-Form-fieldContainer #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#"><div class="a-Form-inputContainer">'
,p_after_item=>'</div></div>'
,p_after_element=>'<span class="a-Login-iconValidation a-Icon icon-check" aria-hidden="true"></span>#ERROR_TEMPLATE#'
,p_help_link=>'<button class="a-Button a-Button--noUI a-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help"></span><span class="u-VisuallyHidden">#CURRENT_ITE'
||'M_HELP_LABEL#</span></button>'
,p_error_template=>'<span class="a-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>3
,p_theme_class_id=>4
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/popuplov
begin
wwv_flow_imp_shared.create_popup_lov_template(
 p_id=>wwv_flow_imp.id(14576615815371062.4555)
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
prompt --application/shared_components/user_interface/themes
begin
null;
end;
/
prompt --application/shared_components/user_interface/theme_style
begin
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(72332775553531661.4555)
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
 p_id=>wwv_flow_imp.id(204024031242767851.4555)
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
 p_id=>wwv_flow_imp.id(556400313932111365.4555)
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
 p_id=>wwv_flow_imp.id(556400768767112539.4555)
,p_theme_id=>3
,p_name=>'DARK_AUTO'
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#apex_ui/css/Core#MIN#.css',
'#IMAGE_PREFIX#apex_ui/css/Theme-Dark#MIN#.css'))
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
 p_id=>wwv_flow_imp.id(2341568577013151.4555)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL'
,p_display_name=>'Heading Level'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(697232742091708847.4555)
,p_theme_id=>3
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default - No Icons'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(746428295086414612.4555)
,p_theme_id=>3
,p_name=>'HEIGHT'
,p_display_name=>'Height'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(746429553628414613.4555)
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
 p_id=>wwv_flow_imp.id(746429875641414613.4555)
,p_theme_id=>3
,p_name=>'FORM_LABEL_WIDTH'
,p_display_name=>'Form Label Width'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(746430157627414613.4555)
,p_theme_id=>3
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Not Part of Button Set'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(746431250391414613.4555)
,p_theme_id=>3
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>1
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(746431589295414613.4555)
,p_theme_id=>3
,p_name=>'FORM_LABEL_POSITION'
,p_display_name=>'Form Label Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(746431892249414614.4555)
,p_theme_id=>3
,p_name=>'BUTTON_SIZE'
,p_display_name=>'Button Size'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Button Size'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(746432147133414614.4555)
,p_theme_id=>3
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing left'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Left Spacing'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(746432402204414614.4555)
,p_theme_id=>3
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Right Spacing'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(746432988180414614.4555)
,p_theme_id=>3
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Icon on Right'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(746433200088414615.4555)
,p_theme_id=>3
,p_name=>'BUTTON_TYPE'
,p_display_name=>'Button Type'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(781726734648536732.4555)
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
 p_id=>wwv_flow_imp.id(2341867746022904.4555)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H1'
,p_display_name=>'H1'
,p_display_sequence=>10
,p_css_classes=>'js-headingLevel-1'
,p_group_id=>wwv_flow_imp.id(2341568577013151.4555)
,p_template_types=>'REGION'
,p_help_text=>'H1'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2342130339022904.4555)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H2'
,p_display_name=>'H2'
,p_display_sequence=>20
,p_css_classes=>'js-headingLevel-2'
,p_group_id=>wwv_flow_imp.id(2341568577013151.4555)
,p_template_types=>'REGION'
,p_help_text=>'H2'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2342533595022905.4555)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H3'
,p_display_name=>'H3'
,p_display_sequence=>30
,p_css_classes=>'js-headingLevel-3'
,p_group_id=>wwv_flow_imp.id(2341568577013151.4555)
,p_template_types=>'REGION'
,p_help_text=>'H3'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2342923142022905.4555)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H4'
,p_display_name=>'H4'
,p_display_sequence=>40
,p_css_classes=>'js-headingLevel-4'
,p_group_id=>wwv_flow_imp.id(2341568577013151.4555)
,p_template_types=>'REGION'
,p_help_text=>'H4'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2343381249022905.4555)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H5'
,p_display_name=>'H5'
,p_display_sequence=>50
,p_css_classes=>'js-headingLevel-5'
,p_group_id=>wwv_flow_imp.id(2341568577013151.4555)
,p_template_types=>'REGION'
,p_help_text=>'H5'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2343726901022905.4555)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H6'
,p_display_name=>'H6'
,p_display_sequence=>60
,p_css_classes=>'js-headingLevel-6'
,p_group_id=>wwv_flow_imp.id(2341568577013151.4555)
,p_template_types=>'REGION'
,p_help_text=>'H6'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746428338221414612.4555)
,p_theme_id=>3
,p_name=>'180PX'
,p_display_name=>'180px'
,p_display_sequence=>10
,p_css_classes=>'h180'
,p_group_id=>wwv_flow_imp.id(746428295086414612.4555)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746428558714414612.4555)
,p_theme_id=>3
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>20
,p_css_classes=>'h240'
,p_group_id=>wwv_flow_imp.id(746428295086414612.4555)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746428773348414612.4555)
,p_theme_id=>3
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>30
,p_css_classes=>'h320'
,p_group_id=>wwv_flow_imp.id(746428295086414612.4555)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746428915729414613.4555)
,p_theme_id=>3
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>50
,p_css_classes=>'h480'
,p_group_id=>wwv_flow_imp.id(746428295086414612.4555)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746429163650414613.4555)
,p_theme_id=>3
,p_name=>'540PX'
,p_display_name=>'540px'
,p_display_sequence=>60
,p_css_classes=>'h540'
,p_group_id=>wwv_flow_imp.id(746428295086414612.4555)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746429366543414613.4555)
,p_theme_id=>3
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>70
,p_css_classes=>'h640'
,p_group_id=>wwv_flow_imp.id(746428295086414612.4555)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746429653045414613.4555)
,p_theme_id=>3
,p_name=>'ALIGNLABELSLEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Form--leftLabels'
,p_group_id=>wwv_flow_imp.id(746429553628414613.4555)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746429958855414613.4555)
,p_theme_id=>3
,p_name=>'AUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form--autoWidthLabels'
,p_group_id=>wwv_flow_imp.id(746429875641414613.4555)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746430220624414613.4555)
,p_theme_id=>3
,p_name=>'FIRSTBUTTON'
,p_display_name=>'First Button'
,p_display_sequence=>1
,p_css_classes=>'a-Button--pillStart'
,p_group_id=>wwv_flow_imp.id(746430157627414613.4555)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746430482398414613.4555)
,p_theme_id=>3
,p_name=>'FIXEDLARGE'
,p_display_name=>'Fixed (Large Width)'
,p_display_sequence=>30
,p_css_classes=>'a-Form-fixedLabelsLarge'
,p_group_id=>wwv_flow_imp.id(746429875641414613.4555)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746430657805414613.4555)
,p_theme_id=>3
,p_name=>'FIXEDMEDIUM'
,p_display_name=>'Fixed (Medium Width)'
,p_display_sequence=>20
,p_css_classes=>'a-Form-fixedLabelsMed'
,p_group_id=>wwv_flow_imp.id(746429875641414613.4555)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746430847159414613.4555)
,p_theme_id=>3
,p_name=>'FIXEDWIDTH'
,p_display_name=>'Fixed'
,p_display_sequence=>10
,p_css_classes=>'a-Form--fixedLabels'
,p_group_id=>wwv_flow_imp.id(746429875641414613.4555)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746431042745414613.4555)
,p_theme_id=>3
,p_name=>'INNERBUTTON'
,p_display_name=>'Inner Button'
,p_display_sequence=>2
,p_css_classes=>'a-Button--pill'
,p_group_id=>wwv_flow_imp.id(746430157627414613.4555)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746431384717414613.4555)
,p_theme_id=>3
,p_name=>'LABELAUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--autoLabelWidth'
,p_group_id=>wwv_flow_imp.id(746431250391414613.4555)
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746431600411414613.4555)
,p_theme_id=>3
,p_name=>'LABELSABOVE'
,p_display_name=>'Labels Above'
,p_display_sequence=>1
,p_css_classes=>'a-Form--labelsAbove'
,p_group_id=>wwv_flow_imp.id(746431589295414613.4555)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746431947434414614.4555)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>3
,p_css_classes=>'a-Button--large'
,p_group_id=>wwv_flow_imp.id(746431892249414614.4555)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746432282865414614.4555)
,p_theme_id=>3
,p_name=>'LARGELEFT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapLeft'
,p_group_id=>wwv_flow_imp.id(746432147133414614.4555)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746432501781414614.4555)
,p_theme_id=>3
,p_name=>'LARGERIGHT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapRight'
,p_group_id=>wwv_flow_imp.id(746432402204414614.4555)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746432705519414614.4555)
,p_theme_id=>3
,p_name=>'LASTBUTTON'
,p_display_name=>'Last Button'
,p_display_sequence=>3
,p_css_classes=>'a-Button--pillEnd'
,p_group_id=>wwv_flow_imp.id(746430157627414613.4555)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746433079620414614.4555)
,p_theme_id=>3
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(746432988180414614.4555)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746433329167414615.4555)
,p_theme_id=>3
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>1
,p_css_classes=>'a-Button--primary'
,p_group_id=>wwv_flow_imp.id(746433200088414615.4555)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746433496690414615.4555)
,p_theme_id=>3
,p_name=>'REGIONHEADERBUTTON'
,p_display_name=>'Button in Region Header'
,p_display_sequence=>1
,p_css_classes=>'a-Button--regionHeader'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746433643645414615.4555)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--small'
,p_group_id=>wwv_flow_imp.id(746431892249414614.4555)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746433877160414615.4555)
,p_theme_id=>3
,p_name=>'SMALLLEFT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padLeft'
,p_group_id=>wwv_flow_imp.id(746432147133414614.4555)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746434030153414615.4555)
,p_theme_id=>3
,p_name=>'SMALLRIGHT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padRight'
,p_group_id=>wwv_flow_imp.id(746432402204414614.4555)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746434121281414615.4555)
,p_theme_id=>3
,p_name=>'STRETCHFORMFIELD'
,p_display_name=>'Stretch Form Field'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--stretch'
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(746434226618414615.4555)
,p_theme_id=>3
,p_name=>'STRONGBUTTONLABEL'
,p_display_name=>'Strong Button Label'
,p_display_sequence=>1
,p_css_classes=>'a-Button--strongLabel'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(781728246980536738.4555)
,p_theme_id=>3
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(781726379075536728.4555)
,p_css_classes=>'a-MediaList--cols a-MediaList--2cols'
,p_group_id=>wwv_flow_imp.id(781726734648536732.4555)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(781728430077536738.4555)
,p_theme_id=>3
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(781726379075536728.4555)
,p_css_classes=>'a-MediaList--cols a-MediaList--3cols'
,p_group_id=>wwv_flow_imp.id(781726734648536732.4555)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(781728646908536739.4555)
,p_theme_id=>3
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(781726379075536728.4555)
,p_css_classes=>'a-MediaList--cols a-MediaList--4cols'
,p_group_id=>wwv_flow_imp.id(781726734648536732.4555)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(781728899483536739.4555)
,p_theme_id=>3
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(781726379075536728.4555)
,p_css_classes=>'a-MediaList--cols a-MediaList--5cols'
,p_group_id=>wwv_flow_imp.id(781726734648536732.4555)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(781729002341536739.4555)
,p_theme_id=>3
,p_name=>'SPANHORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(781726379075536728.4555)
,p_css_classes=>'a-MediaList--horizontal'
,p_group_id=>wwv_flow_imp.id(781726734648536732.4555)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(781729164307536739.4555)
,p_theme_id=>3
,p_name=>'HIDEBADGE'
,p_display_name=>'Hide Badge'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(781726379075536728.4555)
,p_css_classes=>'a-MediaList--noBadge'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(781729218881536739.4555)
,p_theme_id=>3
,p_name=>'HIDEDESCRIPTION'
,p_display_name=>'Hide Description'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(781726379075536728.4555)
,p_css_classes=>'a-MediaList--noDesc'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(781729383509536739.4555)
,p_theme_id=>3
,p_name=>'HIDETITLE'
,p_display_name=>'Hide Title'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(781726379075536728.4555)
,p_css_classes=>'a-MediaList--noTitle'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(781729426857536739.4555)
,p_theme_id=>3
,p_name=>'HIDEICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(781726379075536728.4555)
,p_css_classes=>'a-MediaList--noIcons'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(781729513060536739.4555)
,p_theme_id=>3
,p_name=>'SLIMLIST'
,p_display_name=>'Slim List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(781726379075536728.4555)
,p_css_classes=>'a-MediaList--slim'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1199562975588032438.4555)
,p_theme_id=>3
,p_name=>'LEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_button_template_id=>wwv_flow_imp.id(781654005571356486.4555)
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(746432988180414614.4555)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1525652253865182060.4555)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(85971030932131423.4555)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1525652342428182060.4555)
,p_theme_id=>3
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(85971030932131423.4555)
,p_css_classes=>'a-LinksList--showBadge'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1525652435549182060.4555)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(85971030932131423.4555)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1525652539590182060.4555)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(85971030932131423.4555)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1525652722059182061.4555)
,p_theme_id=>3
,p_name=>'FORTOPLEVELONLY'
,p_display_name=>'For top level only'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(85971030932131423.4555)
,p_css_classes=>'a-LinksList--showTopIcons'
,p_group_id=>wwv_flow_imp.id(697232742091708847.4555)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1525652918075182061.4555)
,p_theme_id=>3
,p_name=>'FORALLITEMS'
,p_display_name=>'For all items'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(85971030932131423.4555)
,p_css_classes=>'a-LinksList--showIcons'
,p_group_id=>wwv_flow_imp.id(697232742091708847.4555)
,p_template_types=>'LIST'
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
 p_id=>wwv_flow_imp.id(9152708051846605.4555)
,p_build_option_name=>'XE'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>37165770887393
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(182282109124837150.4555)
,p_build_option_name=>'USG Ack Dialog'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>37165770887393
,p_default_on_export=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(388938859612826437.4555)
,p_build_option_name=>'Commented Out'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>37165770887393
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(836093046470445605.4555)
,p_build_option_name=>'Enable APEX Internal Feedback'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>37165770887393
,p_default_on_export=>'EXCLUDE'
);
end;
/
prompt --application/shared_components/globalization/messages
begin
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(121680678574671283)
,p_name=>'USERNAME'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Nome do Usu\00E1rio')
,p_version_scn=>2566749
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(121680766437671284)
,p_name=>'USERNAME_DB'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Nome do Usu\00E1rio do Banco de Dados')
,p_version_scn=>2566749
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(121680825157671284)
,p_name=>'USERNAME_LDAP'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Nome de Usu\00E1rio LDAP')
,p_version_scn=>2566749
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(121680569995671283)
,p_name=>'WORKSPACE_INTERNAL'
,p_message_language=>'pt-br'
,p_message_text=>unistr('Servi\00E7os de Administra\00E7\00E3o')
,p_version_scn=>2566749
);
end;
/
prompt --application/shared_components/globalization/dyntranslations
begin
null;
end;
/
prompt --application/shared_components/user_interface/shortcuts/thedate
begin
wwv_flow_imp_shared.create_shortcut(
 p_id=>wwv_flow_imp.id(174421670078.4555)
,p_shortcut_name=>'THEDATE'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut_language=>'PLSQL'
,p_version_scn=>75557518
,p_shortcut=>'return to_char(sysdate, ''MM.DD.YYYY'')'
);
end;
/
prompt --application/shared_components/user_interface/shortcuts/item_help
begin
wwv_flow_imp_shared.create_shortcut(
 p_id=>wwv_flow_imp.id(14805026971629745.4555)
,p_shortcut_name=>'ITEM_HELP'
,p_shortcut_type=>'HTML_TEXT'
,p_error_text=>unistr('N\00E3o \00E9 poss\00EDvel mostrar a ajuda.')
,p_version_scn=>2621729
,p_shortcut=>'<a href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION'')" tabindex="999"><img src="#IMAGE_PREFIX#infoicon_status_gray.gif" width="16" height="16" /></a>'
);
end;
/
prompt --application/shared_components/user_interface/shortcuts/welcometext
begin
wwv_flow_imp_shared.create_shortcut(
 p_id=>wwv_flow_imp.id(47306820184100081.4555)
,p_shortcut_name=>'WELCOMETEXT'
,p_shortcut_type=>'HTML_TEXT'
,p_version_scn=>75557518
,p_shortcut=>unistr('Obtenha acesso instant\00E2neo a um conjunto on-line integrado para desenvolvimento de aplicativos. O &PRODUCT_NAME. permite criar aplicativos web din\00E2micos e robustos e aproveitar todo o potencial do banco de dados Oracle, tudo isso com o seu browser fa')
||'vorito.'
);
end;
/
prompt --application/shared_components/security/authentications/internal_authentication
begin
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(540118315091694248.4555)
,p_name=>'Internal Authentication'
,p_scheme_type=>'PLUGIN_COM.ORACLE.APEX.AUTHN.INTERNAL.APEX'
,p_invalid_session_type=>'LOGIN'
,p_logout_url=>'f?p=4550:8:&SESSION.'
,p_cookie_name=>'ORA_WWV_USER_&INSTANCE_ID.'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_version_scn=>2621730
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_saml
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(44506453957251870.4555)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.SAML'
,p_display_name=>'INTERNAL SAML'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.SAML'),'')
,p_api_version=>2
,p_ajax_function=>'wwv_flow_authentication_dev.plugin_callback_saml'
,p_session_sentry_function=>'wwv_flow_authentication_dev.plugin_sentry_saml'
,p_invalid_session_function=>'wwv_flow_authentication_dev.plugin_invalid_session_saml'
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_saml'
,p_post_logout_function=>'wwv_flow_authentication_dev.plugin_post_logout_saml'
,p_substitute_attributes=>true
,p_version_scn=>2621729
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_apex
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(113745616947665430.4555)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.APEX'
,p_display_name=>'INTERNAL - Contas do Oracle APEX'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.APEX'),'')
,p_api_version=>1
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_apex'
,p_standard_attributes=>'INVALID_SESSION:LOGIN_PAGE'
,p_substitute_attributes=>true
,p_version_scn=>2621729
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_social
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(118585628825926737.4555)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.SOCIAL'
,p_display_name=>'INTERNAL Acesso Social'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.SOCIAL'),'')
,p_api_version=>2
,p_ajax_function=>'wwv_flow_authentication_dev.plugin_callback_social'
,p_session_sentry_function=>'wwv_flow_authentication_dev.plugin_sentry_social'
,p_invalid_session_function=>'wwv_flow_authentication_dev.plugin_invalid_session_social'
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_social'
,p_post_logout_function=>'wwv_flow_authentication_dev.plugin_post_logout_social'
,p_substitute_attributes=>true
,p_version_scn=>2621729
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(416890623720942548.4555)
,p_plugin_id=>wwv_flow_imp.id(118585628825926737.4555)
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
 p_id=>wwv_flow_imp.id(416891007519942548.4555)
,p_plugin_attribute_id=>wwv_flow_imp.id(416890623720942548.4555)
,p_display_sequence=>10
,p_display_value=>'OpenID Connect Provider'
,p_return_value=>'OPENID_CONNECT'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(416891574580942549.4555)
,p_plugin_attribute_id=>wwv_flow_imp.id(416890623720942548.4555)
,p_display_sequence=>20
,p_display_value=>'Generic OAuth2 Provider'
,p_return_value=>'OAUTH2'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(416892035992942549.4555)
,p_plugin_attribute_id=>wwv_flow_imp.id(416890623720942548.4555)
,p_display_sequence=>30
,p_display_value=>'Google'
,p_return_value=>'GOOGLE'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(416892506735942549.4555)
,p_plugin_attribute_id=>wwv_flow_imp.id(416890623720942548.4555)
,p_display_sequence=>40
,p_display_value=>'Facebook'
,p_return_value=>'FACEBOOK'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(416893097085942550.4555)
,p_plugin_id=>wwv_flow_imp.id(118585628825926737.4555)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Discovery URL'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(416890623720942548.4555)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'OPENID_CONNECT'
,p_examples=>'https://accounts.example.com/.well-known/openid-configuration'
,p_help_text=>'Enter the OpenID Connect provider''s discovery URL.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(416893435415942550.4555)
,p_plugin_id=>wwv_flow_imp.id(118585628825926737.4555)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Authorization Endpoint URL'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(416890623720942548.4555)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'OAUTH2'
,p_help_text=>'Enter the OAuth2 provider''s authorization endpoint URL.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(416893858115942550.4555)
,p_plugin_id=>wwv_flow_imp.id(118585628825926737.4555)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Token Endpoint URL'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(416890623720942548.4555)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'OAUTH2'
,p_help_text=>'Enter the OAuth2 provider''s token endpoint URL.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(416894223203942551.4555)
,p_plugin_id=>wwv_flow_imp.id(118585628825926737.4555)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'User Info Endpoint URL'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(416890623720942548.4555)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'OAUTH2'
,p_help_text=>'Enter the OAuth2 provider''s user info endpoint URL.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(416894668838942551.4555)
,p_plugin_id=>wwv_flow_imp.id(118585628825926737.4555)
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
 p_id=>wwv_flow_imp.id(416895087659942551.4555)
,p_plugin_id=>wwv_flow_imp.id(118585628825926737.4555)
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
 p_id=>wwv_flow_imp.id(416895431641942551.4555)
,p_plugin_id=>wwv_flow_imp.id(118585628825926737.4555)
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
 p_id=>wwv_flow_imp.id(416895828896942552.4555)
,p_plugin_id=>wwv_flow_imp.id(118585628825926737.4555)
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
 p_id=>wwv_flow_imp.id(416896262542942552.4555)
,p_plugin_id=>wwv_flow_imp.id(118585628825926737.4555)
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
 p_id=>wwv_flow_imp.id(416896604536942552.4555)
,p_plugin_id=>wwv_flow_imp.id(118585628825926737.4555)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>65
,p_prompt=>'Token Authentication Method'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'BASIC_AND_CLID'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(416890623720942548.4555)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'OAUTH2'
,p_lov_type=>'STATIC'
,p_help_text=>'Enter how the credential''s client ID and client secret should be passed to the server.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(416897007831942552.4555)
,p_plugin_attribute_id=>wwv_flow_imp.id(416896604536942552.4555)
,p_display_sequence=>10
,p_display_value=>'Basic Authentication'
,p_return_value=>'BASIC'
,p_help_text=>'Send client id and client secret in a Basic Authentication header.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(416897545222942553.4555)
,p_plugin_attribute_id=>wwv_flow_imp.id(416896604536942552.4555)
,p_display_sequence=>20
,p_display_value=>'Basic Authentication and Client ID in Body'
,p_return_value=>'BASIC_AND_CLID'
,p_help_text=>'Send client id and client secret in a Basic Authentication header, but also send client it in the request body.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(416898021695942553.4555)
,p_plugin_attribute_id=>wwv_flow_imp.id(416896604536942552.4555)
,p_display_sequence=>30
,p_display_value=>'Client ID and Client Secret in Body'
,p_return_value=>'BODY'
,p_help_text=>'Send client id and client secret in the request body.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(416898559929942553.4555)
,p_plugin_attribute_id=>wwv_flow_imp.id(416896604536942552.4555)
,p_display_sequence=>40
,p_display_value=>'Client ID in Body'
,p_return_value=>'CLID'
,p_help_text=>'Only send client id in the request body.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(416899083792942554.4555)
,p_plugin_id=>wwv_flow_imp.id(118585628825926737.4555)
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
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_cloud_idm
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(356673124532447685.4555)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.CLOUD_IDM'
,p_display_name=>'INTERNAL Oracle Cloud Identity Management'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.CLOUD_IDM'),'')
,p_api_version=>1
,p_ajax_function=>'wwv_flow_authentication_dev.plugin_callback_cloud'
,p_session_sentry_function=>'wwv_flow_authentication_dev.plugin_sentry_cloud'
,p_invalid_session_function=>'wwv_flow_authentication_dev.plugin_invalid_session_cloud'
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_cloud'
,p_post_logout_function=>'wwv_flow_authentication_dev.plugin_post_logout_cloud'
,p_standard_attributes=>'LOGIN_PAGE'
,p_substitute_attributes=>true
,p_version_scn=>2621729
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_db
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(356675509593447689.4555)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.DB'
,p_display_name=>'INTERNAL Contas de Banco de Dados'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.DB'),'')
,p_api_version=>1
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_db'
,p_standard_attributes=>'LOGIN_PAGE'
,p_substitute_attributes=>true
,p_version_scn=>2621729
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_header
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(356684625134447706.4555)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.HEADER'
,p_display_name=>unistr('INTERNAL Vari\00E1vel de Cabe\00E7alho HTTP')
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.HEADER'),'')
,p_api_version=>1
,p_ajax_function=>'wwv_flow_authentication_dev.plugin_callback_header'
,p_session_sentry_function=>'wwv_flow_authentication_dev.plugin_sentry_header'
,p_invalid_session_function=>'wwv_flow_authentication_dev.plugin_invalid_session_header'
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_header'
,p_post_logout_function=>'wwv_flow_authentication_dev.plugin_post_logout_header'
,p_standard_attributes=>'LOGIN_PAGE'
,p_substitute_attributes=>true
,p_version_scn=>2621729
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(308151366761529813.4555)
,p_plugin_id=>wwv_flow_imp.id(356684625134447706.4555)
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
 p_id=>wwv_flow_imp.id(308151742324529813.4555)
,p_plugin_id=>wwv_flow_imp.id(356684625134447706.4555)
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
 p_id=>wwv_flow_imp.id(308152140224529813.4555)
,p_plugin_attribute_id=>wwv_flow_imp.id(308151742324529813.4555)
,p_display_sequence=>10
,p_display_value=>'Redirect to Built-In URL'
,p_return_value=>'BUILTIN_URL'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(308152687711529814.4555)
,p_plugin_attribute_id=>wwv_flow_imp.id(308151742324529813.4555)
,p_display_sequence=>20
,p_display_value=>'Redirect to URL'
,p_return_value=>'URL'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(308153147681529814.4555)
,p_plugin_attribute_id=>wwv_flow_imp.id(308151742324529813.4555)
,p_display_sequence=>30
,p_display_value=>'Display Error'
,p_return_value=>'ERROR'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(308153659452529814.4555)
,p_plugin_id=>wwv_flow_imp.id(356684625134447706.4555)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'URL'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>60
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(308151742324529813.4555)
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
 p_id=>wwv_flow_imp.id(308154012920529816.4555)
,p_plugin_id=>wwv_flow_imp.id(356684625134447706.4555)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Error Message'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>true
,p_display_length=>60
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_imp.id(308151742324529813.4555)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'ERROR'
,p_help_text=>'Specifies the error message to be displayed if the HTTP header variable does not contain a value or the HTTP header variable does not exist.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(308154473304529817.4555)
,p_plugin_id=>wwv_flow_imp.id(356684625134447706.4555)
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
 p_id=>wwv_flow_imp.id(308154871585529817.4555)
,p_plugin_attribute_id=>wwv_flow_imp.id(308154473304529817.4555)
,p_display_sequence=>10
,p_display_value=>'Each Request'
,p_return_value=>'ALWAYS'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(308155341792529817.4555)
,p_plugin_attribute_id=>wwv_flow_imp.id(308154473304529817.4555)
,p_display_sequence=>20
,p_display_value=>'After Login'
,p_return_value=>'CALLBACK'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(308155882020529817.4555)
,p_plugin_id=>wwv_flow_imp.id(356684625134447706.4555)
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
 p_id=>wwv_flow_imp.id(356751824591447757.4555)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.LDAP'
,p_display_name=>unistr('INTERNAL Diret\00F3rio LDAP')
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.LDAP'),'')
,p_api_version=>1
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_ldap'
,p_standard_attributes=>'INVALID_SESSION:LOGIN_PAGE'
,p_substitute_attributes=>true
,p_version_scn=>2621729
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Informe o nome de usu\00E1rio e a senha para autentica\00E7\00E3o no diret\00F3rio LDAP identificado na p\00E1gina de log-in. Lembre-se de que as senhas podem fazer distin\00E7\00E3o entre mai\00FAsculas e min\00FAsculas.</p>'),
''))
,p_version_identifier=>'1.0'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(356752109391447757.4555)
,p_plugin_id=>wwv_flow_imp.id(356751824591447757.4555)
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
 p_id=>wwv_flow_imp.id(356752525978447757.4555)
,p_plugin_id=>wwv_flow_imp.id(356751824591447757.4555)
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
 p_id=>wwv_flow_imp.id(356752909762447757.4555)
,p_plugin_id=>wwv_flow_imp.id(356751824591447757.4555)
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
 p_id=>wwv_flow_imp.id(356753326801447757.4555)
,p_plugin_attribute_id=>wwv_flow_imp.id(356752909762447757.4555)
,p_display_sequence=>10
,p_display_value=>'SSL'
,p_return_value=>'SSL'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(356753802092447757.4555)
,p_plugin_attribute_id=>wwv_flow_imp.id(356752909762447757.4555)
,p_display_sequence=>20
,p_display_value=>'SSL with Authentication'
,p_return_value=>'SSL_AUTH'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(356754317185447758.4555)
,p_plugin_attribute_id=>wwv_flow_imp.id(356752909762447757.4555)
,p_display_sequence=>30
,p_display_value=>'No SSL'
,p_return_value=>'NO_SSL'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(356754811521447759.4555)
,p_plugin_id=>wwv_flow_imp.id(356751824591447757.4555)
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
 p_id=>wwv_flow_imp.id(356755216699447759.4555)
,p_plugin_id=>wwv_flow_imp.id(356751824591447757.4555)
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
 p_id=>wwv_flow_imp.id(356755624517447759.4555)
,p_plugin_id=>wwv_flow_imp.id(356751824591447757.4555)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Search Filter'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>40
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(356755216699447759.4555)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'N'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Enter the search filter when not using an exact distinguished name (DN). Use <strong>%LDAP_USER%</strong> as a place-holder for the username. For example:',
'</p>',
'<p><pre>cn=%LDAP_USER%</pre></p>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(356756013940447759.4555)
,p_plugin_id=>wwv_flow_imp.id(356751824591447757.4555)
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
 p_id=>wwv_flow_imp.id(356756416287447760.4555)
,p_plugin_id=>wwv_flow_imp.id(356751824591447757.4555)
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
 p_id=>wwv_flow_imp.id(356756825663447760.4555)
,p_plugin_attribute_id=>wwv_flow_imp.id(356756416287447760.4555)
,p_display_sequence=>10
,p_display_value=>'Standard'
,p_return_value=>'STD'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(356757310563447761.4555)
,p_plugin_attribute_id=>wwv_flow_imp.id(356756416287447760.4555)
,p_display_sequence=>20
,p_display_value=>'Only special characters'
,p_return_value=>'ONLY'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(356757815197447761.4555)
,p_plugin_attribute_id=>wwv_flow_imp.id(356756416287447760.4555)
,p_display_sequence=>30
,p_display_value=>'No Escaping'
,p_return_value=>'NO'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_sso
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(356819703353447808.4555)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.SSO'
,p_display_name=>'INTERNAL SSO do Oracle Application Server'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.SSO'),'')
,p_api_version=>1
,p_ajax_function=>'wwv_flow_authentication_dev.plugin_callback_osso'
,p_session_sentry_function=>'wwv_flow_authentication_dev.plugin_sentry_osso'
,p_invalid_session_function=>'wwv_flow_authentication_dev.plugin_invalid_session_osso'
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_osso'
,p_post_logout_function=>'wwv_flow_authentication_dev.plugin_post_logout_osso'
,p_standard_attributes=>'LOGIN_PAGE'
,p_substitute_attributes=>true
,p_version_scn=>2621729
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
prompt --application/pages/page_00000
begin
wwv_flow_imp_page.create_page(
 p_id=>.4555
,p_name=>unistr('P\00E1gina Global - Desktop')
,p_alias=>'GLOBAL-PAGE-DESKTOP'
,p_step_title=>unistr('P\00E1gina Global - Desktop')
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_protection_level=>'D'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(787803699949238365.4555)
,p_plug_name=>'Header'
,p_region_css_classes=>'a-Header a-Header--login'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(781705991385407800.4555)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="f?p=4550:1:&APP_SESSION." class="a-Header-logo" title="Oracle APEX">',
'  <span role="img" aria-label="Oracle APEX" class="a-Header-apexLogo"></span>',
'</a>'))
,p_translate_title=>'N'
,p_plug_query_num_rows=>15
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(878526882713395746.4555)
,p_plug_name=>'USG Acknowledgement'
,p_region_name=>'usg_dialog'
,p_region_css_classes=>'js-regionDialog js-modal js-dialog-size720x460'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="display:none"'
,p_plug_template=>wwv_flow_imp.id(781705991385407800.4555)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Note: We intentionally don''t translate this message',
'sys.htp.p(''<div id="usg_message">'');',
'sys.htp.p(''<p>You are accessing a U.S. Government (USG) Information System (IS) that is provided for USG-authorized use only.</p>'');',
'sys.htp.p(''<p>By using this IS (which includes any device attached to this IS), you consent to the following conditions:</p>'');',
'sys.htp.p(''<p>-The USG routinely intercepts and monitors communications on this IS for purposes including, but not limited to, penetration testing, COMSEC monitoring, network operations and defense, personnel misconduct (PM), law enforcement (LE), an'
||'d counterintelligence (CI) investigations.</p>'');',
'sys.htp.p(''<p>-At any time, the USG may inspect and seize data stored on this IS.</p>'');',
'sys.htp.p(''<p>-Communications using, or data stored on, this IS are not private, are subject to routine monitoring, interception, and search, and may be disclosed or used for any USG-authorized purpose.</p>'');',
'sys.htp.p(''<p>-This IS includes security measures (e.g., authentication and access controls) to protect USG interests-not for your personal benefit or privacy.</p>'');',
'sys.htp.p(''<p>-Notwithstanding the above, using this IS does not constitute consent to PM, LE or CI investigative searching or monitoring of the content of privileged communications, or work product, related to personal representation or services by '
||'attorneys, psychotherapists, or clergy, and their assistants. Such communications and work product are private and confidential. See User Agreement for details.</p>'');',
'sys.htp.p(''</div>'');',
'sys.htp.p(''<style>'');',
'sys.htp.p(''div[aria-describedby="usg_dialog"] .ui-dialog-titlebar { display: none; }'');',
'sys.htp.p(''#usg_message { font-size: 14px; line-height: 1.5; margin: 12px 12px 16px 12px;}'');',
'sys.htp.p(''#usg_button { margin: auto; display: block; }'');',
'sys.htp.p(''</style>'');'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_display_condition_type=>'CURRENT_PAGE_IN_CONDITION'
,p_plug_display_when_condition=>'1,10'
,p_required_patch=>wwv_flow_imp.id(182282109124837150.4555)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(878526953365395747.4555)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(878526882713395746.4555)
,p_button_name=>'ACKNOWLEDGE'
,p_button_static_id=>'usg_button'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:a-Button--large'
,p_button_template_id=>wwv_flow_imp.id(781653829819356486.4555)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Confirmar'
,p_button_alignment=>'LEFT-CENTER'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(878527063282395748.4555)
,p_name=>'Close USG Ack Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(878526953365395747.4555)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'CURRENT_PAGE_IN_CONDITION'
,p_display_when_cond=>'1,10'
,p_required_patch=>wwv_flow_imp.id(182282109124837150.4555)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(878527178035395749.4555)
,p_event_id=>wwv_flow_imp.id(878527063282395748.4555)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(878526882713395746.4555)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(878527289716395750.4555)
,p_name=>'Display USG Ack Dialog'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'CURRENT_PAGE_IN_CONDITION'
,p_display_when_cond=>'1,10'
,p_required_patch=>wwv_flow_imp.id(182282109124837150.4555)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(182275284387854301.4555)
,p_event_id=>wwv_flow_imp.id(878527289716395750.4555)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.jQuery("#usg_dialog").dialog({closeOnEscape: false}).dialog("open");'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'apex.jQuery("#errorMsg-Message").length === 0'
);
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_imp_page.create_page(
 p_id=>1.4555
,p_name=>'Oracle APEX - Acessar'
,p_alias=>'ORACLE-APEX-SIGN-IN'
,p_step_title=>'&PRODUCT_NAME. - Acessar'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(222575208632450607)
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.jQuery( "#req_workspace" ).wrap( "<span>" )',
'    .parent()',
'    .attr( "role", "region" )',
'    .attr( "aria-labelledby", "req_workspace" );',
''))
,p_step_template=>wwv_flow_imp.id(781636565276262406.4555)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_deep_linking=>'Y'
,p_help_text=>'start_login.htm'
,p_page_comment=>'intro_login'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5734329754154454.4555)
,p_plug_name=>'Tarefas'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:a-MediaList--noIcons'
,p_plug_template=>wwv_flow_imp.id(781720832587518133.4555)
,p_plug_display_sequence=>60
,p_plug_new_grid_row=>false
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_imp.id(115315832368341144.4555)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(781726379075536728.4555)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(28278406447321936.4555)
,p_plug_name=>unistr('An\00FAncios')
,p_region_css_classes=>'a-Login-message'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(781705991385407800.4555)
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'sys.htp.prn( wwv_flow_platform.get_preference( p_preference_name => ''LOGIN_MESSAGE''));'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_display_condition_type=>'FUNCTION_BODY'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if wwv_flow_platform.get_preference( p_preference_name => ''LOGIN_MESSAGE'') is null then',
'  return false;',
'else',
'  return true;',
'end if;'))
,p_plug_display_when_cond2=>'PLSQL'
,p_landmark_type=>'region'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(28357414269339279.4555)
,p_plug_name=>unistr('Mais Informa\00E7\00F5es')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:a-MediaList--noIcons'
,p_plug_template=>wwv_flow_imp.id(781720832587518133.4555)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_imp.id(8560508234436339.4555)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(781726379075536728.4555)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(28359019857369284.4555)
,p_plug_name=>unistr('Conceitos B\00E1sicos')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:a-MediaList--noIcons'
,p_plug_template=>wwv_flow_imp.id(781720832587518133.4555)
,p_plug_display_sequence=>40
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_imp.id(8566004359605487.4555)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(781726379075536728.4555)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(30251320176465048.4555)
,p_plug_name=>'&PRODUCT_NAME.'
,p_region_template_options=>'#DEFAULT#:a-Form--labelsAbove'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(781646415851311877.4555)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'BELOW'
,p_landmark_label=>'Log-in'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(201971822038420445.4555)
,p_plug_name=>'Languages'
,p_parent_plug_id=>wwv_flow_imp.id(30251320176465048.4555)
,p_region_css_classes=>'a-Login-links a-Login-links--languages'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(781705991385407800.4555)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'sys.htp.p( wwv_flow_lang.get_language_selector_list );'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'wwv_flow_4000_ui.is_translation_installed( p_flow_id => 4000 )'
,p_plug_display_when_cond2=>'PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(59842604093647546.4555)
,p_plug_name=>'Recursos'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:a-MediaList--noDesc:a-MediaList--noIcons'
,p_plug_template=>wwv_flow_imp.id(781720832587518133.4555)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_imp.id(787389949330441085.4555)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(781726379075536728.4555)
,p_plug_query_row_template=>wwv_flow_imp.id(232064200547094797.4555)
,p_plug_query_num_rows_type=>'0'
,p_plug_query_show_nulls_as=>' - '
,p_plug_query_break_cols=>'0'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>'select 1 from wwv_flow_customized_tasks where displayed = ''Y'' and display_location = ''WORKSPACE_LOGIN'''
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(327446700231264735.4555)
,p_plug_name=>'Social Networking Links'
,p_region_css_classes=>'a-Login-social mxw400 margin-auto'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(781705991385407800.4555)
,p_plug_display_sequence=>70
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sys.htp.p(',
'   ''<h2 class="u-VisuallyHidden">Social</h2>''',
'|| ''<ul class="a-Login-socialLinks">''',
'|| ''  <li class="a-Login-socialLinks-item">''',
'|| ''    <a rel="noopener noreferrer" href="https://apex.oracle.com/twitter" target="_blank" class="a-Login-socialLinks-link">''',
'|| ''      <span class="a-Icon icon-xcom" aria-hidden="true"></span>''',
'|| ''      <span class="u-VisuallyHidden">X.com</span>''',
'|| ''    </a>''',
'|| ''  </li>''',
'|| ''  <li class="a-Login-socialLinks-item">''',
'|| ''    <a rel="noopener noreferrer" href="https://apex.oracle.com/linkedin" target="_blank" class="a-Login-socialLinks-link">''',
'|| ''      <span class="a-Icon icon-linkedin" aria-hidden="true"></span>''',
'|| ''      <span class="u-VisuallyHidden">LinkedIn</span>''',
'|| ''    </a>''',
'|| ''  </li>''',
'|| ''  <li class="a-Login-socialLinks-item">''',
'|| ''    <a rel="noopener noreferrer" href="https://apex.oracle.com/facebook" target="_blank" class="a-Login-socialLinks-link">''',
'|| ''      <span class="a-Icon icon-facebook" aria-hidden="true"></span>''',
'|| ''      <span class="u-VisuallyHidden">Facebook</span>''',
'|| ''    </a>''',
'|| ''  </li>''',
'|| ''  <li class="a-Login-socialLinks-item">''',
'|| ''    <a rel="noopener noreferrer" href="https://apex.oracle.com/youtube" target="_blank" class="a-Login-socialLinks-link">''',
'|| ''      <span class="a-Icon icon-youtube" aria-hidden="true"></span>''',
'|| ''      <span class="u-VisuallyHidden">YouTube</span>''',
'|| ''    </a>''',
'|| ''  </li>''',
'|| ''</ul>''',
');'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_landmark_type=>'region'
,p_landmark_label=>'Rede Social'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(698802056584413313.4555)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(30251320176465048.4555)
,p_button_name=>'REQUEST_WORKSPACE'
,p_button_static_id=>'req_workspace'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(781649650278313424.4555)
,p_button_image_alt=>unistr('Solicitar um Espa\00E7o de Trabalho')
,p_button_position=>'CREATE'
,p_button_redirect_url=>'f?p=4700:2:&SESSION.::&DEBUG.:RP,::'
,p_button_condition=>'wwv_flow_platform.get_preference( p_preference_name => ''SERVICE_REQUEST_FLOW'' ) <> ''MANUAL'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(275885678018243453.4555)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(30251320176465048.4555)
,p_button_name=>'APEX_ADMIN'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(781649650278313424.4555)
,p_button_image_alt=>unistr('Servi\00E7os de Administra\00E7\00E3o')
,p_button_position=>'CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:::'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'wwv_flow_global.g_cloud and ',
'wwv_flow_authentication_dev.get_internal_authentication = ''DB'' and ',
'not wwv_flow_security.disable_admin_login'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>'!'||wwv_flow_imp.id(6153929631135099)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(206357695649953049.4555)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(30251320176465048.4555)
,p_button_name=>'GET_STARTED'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(781649650278313424.4555)
,p_button_image_alt=>unistr('Conceitos B\00E1sicos')
,p_button_position=>'CREATE'
,p_button_redirect_url=>'javascript:void(apex.navigation.openInNewWindow(''&P1_GET_STARTED_URL!JS.''));'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P1_GET_STARTED_URL is not null',
'and wwv_flow_global.g_cloud',
'and wwv_flow_authentication_dev.get_internal_authentication = ''DB'''))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(698801968369413312.4555)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(30251320176465048.4555)
,p_button_name=>'RESET_PASS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(781649650278313424.4555)
,p_button_image_alt=>'Redefinir Senha'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:RP::'
,p_button_condition=>'wwv_flow_authentication_dev.get_internal_authentication = ''APEX'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(47399509230712591.4555)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(30251320176465048.4555)
,p_button_name=>'P1_LOGIN'
,p_button_static_id=>'P1_LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(300732121515523410.4555)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Log-in'
,p_button_position=>'NEXT'
,p_button_condition_type=>'NEVER'
,p_request_source=>'LOGIN_BUTTON'
,p_request_source_type=>'STATIC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(232005500580944564.4555)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(30251320176465048.4555)
,p_button_name=>'LOGIN_BUTTON'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:a-Button--large'
,p_button_template_id=>wwv_flow_imp.id(781653829819356486.4555)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Acessar'
,p_button_position=>'NEXT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(9141131880673724.4555)
,p_branch_action=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:::'
,p_branch_point=>'BEFORE_HEADER'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_required_patch=>wwv_flow_imp.id(9152708051846605.4555)
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(17417718747637820.4555)
,p_branch_action=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:::'
,p_branch_point=>'BEFORE_HEADER'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_security_scheme=>wwv_flow_imp.id(6153929631135099)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9960412406494902.4555)
,p_name=>'P1_USERNAME_LABEL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(30251320176465048.4555)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'wwv_flow_lang.message(',
'    p_name => case wwv_flow_platform.get_preference(''APEX_BUILDER_AUTHENTICATION'')',
'                   when ''DB'' then ''USERNAME_DB''',
'                   when ''LDAP'' then ''USERNAME_LDAP''',
'                   else ''USERNAME''',
'              end',
')'))
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30250621039456935.4555)
,p_name=>'F4550_P1_COMPANY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(30251320176465048.4555)
,p_prompt=>unistr('Espa\00E7o de Trabalho')
,p_placeholder=>unistr('Espa\00E7o de Trabalho')
,p_source=>'wwv_flow_utilities.get_company_from_cookie;'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>2000
,p_tag_attributes=>'required'
,p_field_template=>wwv_flow_imp.id(781639159048309153.4555)
,p_item_css_classes=>'icon-login-workspace'
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_input=>'N'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<div class="htmldbInfoBodyP">Informe seu espa\00E7o de trabalho. O atributo de espa\00E7o de trabalho n\00E3o faz distin\00E7\00E3o entre mai\00FAsculas e min\00FAsculas.</div>'),
unistr('<div class="htmldbInfoBodyP">Este \00E9 um servi\00E7o de desenvolvimento on-line que permite acesso a um banco de dados privado virtual. Como o mesmo nome de usu\00E1rio pode existir em v\00E1rios espa\00E7os de trabalho, voc\00EA dever\00E1 informar seu espa\00E7o de trabalho ao ')
||unistr('usar este servi\00E7o.</div>')))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'send_on_page_submit', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30251012844458645.4555)
,p_name=>'F4550_P1_USERNAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(30251320176465048.4555)
,p_prompt=>'&P1_USERNAME_LABEL.'
,p_placeholder=>'&P1_USERNAME_LABEL.'
,p_source=>'wwv_flow_utilities.get_un_from_cookie'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>2000
,p_tag_attributes=>'autocomplete="username" required'
,p_field_template=>wwv_flow_imp.id(781639159048309153.4555)
,p_item_css_classes=>'icon-login-username'
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<div class="htmldbInfoBodyP">Informe seu nome de usu\00E1rio. O nome de usu\00E1rio n\00E3o faz distin\00E7\00E3o entre mai\00FAsculas e min\00FAsculas.</div>'),
unistr('<div class="htmldbInfoBodyP">Depois que voc\00EA estiver autenticado e partindo do pressuposto de que voc\00EA possui as credenciais apropriadas, ser\00E1 poss\00EDvel criar usu\00E1rios adicionais.</div>')))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'send_on_page_submit', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30251520608467092.4555)
,p_name=>'F4550_P1_PASSWORD'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(30251320176465048.4555)
,p_prompt=>'Senha'
,p_placeholder=>'Senha'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_tag_attributes=>'autocomplete="current-password" required'
,p_field_template=>wwv_flow_imp.id(781639159048309153.4555)
,p_item_css_classes=>'icon-login-password'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_escape_on_http_input=>'Y'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<div class="htmldbInfoBodyP">Informe sua senha. Senhas fazem distin\00E7\00E3o entre mai\00FAsculas e min\00FAsculas. Essa senha \00E9 espec\00EDfica para esse servi\00E7o. Observe que cada espa\00E7o de trabalho pode ter v\00E1rios usu\00E1rios.</div>'),
'<div class="htmldbInfoBodyP">Se esquecer sua senha, selecione <span class="fielddatabold">Redefinir Senha</span>.</div>'))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(95189738956614247.4555)
,p_name=>'F4550_P1_REMEMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(30251320176465048.4555)
,p_prompt=>unistr('Lembrar Espa\00E7o de Trabalho e Nome do Usu\00E1rio')
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'case',
'when wwv_flow_utilities.get_company_from_cookie is not null',
'then ''Y''',
'end'))
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'wwv_flow_authentication_api.persistent_cookies_enabled',
''))
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(176608736253329086.4555)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
unistr('Se voc\00EA marcar esta caixa de sele\00E7\00E3o, o &PRODUCT_NAME. salvar\00E1 seu espa\00E7o de trabalho e nome de usu\00E1rio em um cookie de browser persistente chamado <code>ORA_WWV_REMEMBER_UN</code>. Quando voc\00EA for at\00E9 a p\00E1gina de log-in na pr\00F3xima vez, os campos de ')
||unistr('espa\00E7o de trabalho e nome do usu\00E1rio ser\00E3o preenchidos automaticamente com esses valores.'),
'</p>',
'<p>',
unistr('Se voc\00EA desmarcar esta caixa de sele\00E7\00E3o e o nome do espa\00E7o de trabalho e o seu nome de usu\00E1rio j\00E1 estiverem salvos no cookie, o &PRODUCT_NAME. o substituir\00E1 por um valor vazio. Voc\00EA tamb\00E9m pode usar as ferramentas de desenvolvedor do seu browser para')
||' remover completamente o cookie a qualquer momento.',
'</p>'))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
,p_item_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'case',
'when wwv_flow_utilities.get_company_from_cookie is null',
'then ''N''',
'else ''Y''',
'end'))
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(232291604030150875.4555)
,p_name=>'P1_RESET_PASSWORD_LABEL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(30251320176465048.4555)
,p_source=>'wwv_flow_lang.system_message(''RESET_PASSWORD'');'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(279105542919806103.4555)
,p_name=>'P1_GET_STARTED_URL'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(30251320176465048.4555)
,p_source=>'wwv_flow_platform.get_preference(''GET_STARTED_URL'')'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1778434620188603210.4555)
,p_name=>'P1_NEXT_APP'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(30251320176465048.4555)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1778434823687603211.4555)
,p_name=>'P1_NEXT_PAGE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(30251320176465048.4555)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1778435028760603211.4555)
,p_name=>'P1_NEXT_ITEMS'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(30251320176465048.4555)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1778435208234603211.4555)
,p_name=>'P1_NEXT_VALUES'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(30251320176465048.4555)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(5714811395478232.4555)
,p_computation_sequence=>10
,p_computation_item=>'PRODUCT_TYPE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>'return wwv_flow_lang.system_message(''APPLICATION_DEVELOPMENT'');'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(14794408194619070.4555)
,p_validation_name=>'F4550_P1_COMPANY Not Null'
,p_validation_sequence=>10
,p_validation=>'F4550_P1_COMPANY'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Informe um nome de espa\00E7o de trabalho')
,p_associated_item=>wwv_flow_imp.id(30250621039456935.4555)
,p_error_display_location=>'INLINE_WITH_FIELD'
,p_validation_comment=>'generated 06-MAY-2002 18:28'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(14794718743619076.4555)
,p_validation_name=>'F4550_P1_USERNAME Not Null'
,p_validation_sequence=>20
,p_validation=>'F4550_P1_USERNAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Informe seu nome do usu\00E1rio')
,p_associated_item=>wwv_flow_imp.id(30251012844458645.4555)
,p_error_display_location=>'INLINE_WITH_FIELD'
,p_validation_comment=>'generated 06-MAY-2002 18:28'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(14795009696619077.4555)
,p_validation_name=>'F4550_P1_PASSWORD Not Null'
,p_validation_sequence=>30
,p_validation=>'F4550_P1_PASSWORD'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Digite sua senha'
,p_associated_item=>wwv_flow_imp.id(30251520608467092.4555)
,p_error_display_location=>'INLINE_WITH_FIELD'
,p_validation_comment=>'generated 06-MAY-2002 18:28'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(698802352859413316.4555)
,p_name=>'Focus on Workspace'
,p_event_sequence=>1
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$("#F4550_P1_COMPANY").val().length < 1 && $("#F4550_P1_USERNAME").val().length < 1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(698802474866413317.4555)
,p_event_id=>wwv_flow_imp.id(698802352859413316.4555)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'F4550_P1_COMPANY'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(698802512740413318.4555)
,p_name=>'Focus on Username'
,p_event_sequence=>2
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$("#F4550_P1_COMPANY").val().length > 0 && $("#F4550_P1_USERNAME").val().length < 1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(698802638841413319.4555)
,p_event_id=>wwv_flow_imp.id(698802512740413318.4555)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'F4550_P1_USERNAME'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(698802182978413314.4555)
,p_name=>'Focus on Password'
,p_event_sequence=>10
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$("#F4550_P1_COMPANY").val().length > 0 && $("#F4550_P1_USERNAME").val().length > 0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(698802286696413315.4555)
,p_event_id=>wwv_flow_imp.id(698802182978413314.4555)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'F4550_P1_PASSWORD'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(359371008265397285.4555)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'wwv_flow_login.builder (',
'    p_workspace                 => :F4550_P1_COMPANY,',
'    p_username                  => :F4550_P1_USERNAME,',
'    p_password                  => :F4550_P1_PASSWORD,',
'    p_send_builder_login_cookie => :F4550_P1_REMEMBER = ''Y'' );'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>359371008265397285.4555
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(491225097024458.4555)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'clear'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'1'
,p_internal_uid=>491225097024458.4555
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(28292524174506792.4555)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'null pw'
,p_process_sql_clob=>':F4550_P1_PASSWORD := null;'
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>28292524174506792.4555
);
end;
/
prompt --application/pages/page_00002
begin
wwv_flow_imp_page.create_page(
 p_id=>2.4555
,p_name=>'Nenhum Cookie'
,p_alias=>'NOCOOKIE'
,p_step_title=>'Nenhum Cookie'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_step_template=>wwv_flow_imp.id(788153963797526843.4555)
,p_page_template_options=>'#DEFAULT#'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(134636703889796037.4555)
,p_plug_name=>'No Cookies'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_translate_title=>'N'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
end;
/
prompt --application/pages/page_00004
begin
wwv_flow_imp_page.create_page(
 p_id=>4.4555
,p_name=>unistr('Localizar Meu Espa\00E7o de Trabalho')
,p_alias=>'FIND-MY-WORKSPACE'
,p_step_title=>unistr('Localizar Meu Espa\00E7o de Trabalho')
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_step_template=>wwv_flow_imp.id(787783544361971642.4555)
,p_page_template_options=>'#DEFAULT#'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(22878608880410975.4555)
,p_plug_name=>unistr('Localizar Meu Espa\00E7o de Trabalho')
,p_region_template_options=>'#DEFAULT#:a-Form--labelsAbove'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(781646415851311877.4555)
,p_plug_display_sequence=>10
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(26487014153670357.4555)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(22878608880410975.4555)
,p_button_name=>'CREATE'
,p_button_static_id=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:a-Button--large'
,p_button_template_id=>wwv_flow_imp.id(781653829819356486.4555)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Localizar Espa\00E7o de Trabalho')
,p_button_position=>'NEXT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(22883630052445491.4555)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(22878608880410975.4555)
,p_button_name=>'CANCEL'
,p_button_static_id=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:a-Button--large'
,p_button_template_id=>wwv_flow_imp.id(781653829819356486.4555)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'NEXT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(26487310047670358.4555)
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:4::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(26487014153670357.4555)
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(22891903920551475.4555)
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(22883630052445491.4555)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(17445301703727502.4555)
,p_branch_action=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:::'
,p_branch_point=>'BEFORE_HEADER'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>40
,p_security_scheme=>wwv_flow_imp.id(6153929631135099)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22881822648433869.4555)
,p_name=>'F4550_P4_EMAIL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(22878608880410975.4555)
,p_prompt=>unistr('Endere\00E7o de E-mail')
,p_placeholder=>unistr('Endere\00E7o de E-mail')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>2000
,p_tag_attributes=>'autocomplete="email"'
,p_field_template=>wwv_flow_imp.id(781639159048309153.4555)
,p_item_css_classes=>'icon-login-email'
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Informe o endere\00E7o de e-mail associado ao seu espa\00E7o de trabalho. Iremos enviar o nome do espa\00E7o de trabalho para este e-mail.')
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'send_on_page_submit', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_item_comment=>'<small>Your email address in our database</small>'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(5717205948533393.4555)
,p_computation_sequence=>30
,p_computation_item=>'PRODUCT_TYPE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>'return wwv_flow_lang.system_message(''APPLICATION_DEVELOPMENT'');'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(22955710724969695.4555)
,p_validation_name=>'F4550_P4_EMAIL must be valid'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_at number;',
'  l_dot number;',
'begin',
'  l_at := instr(nvl(:F4550_P4_EMAIL,''x''),''@'');',
'  l_dot := instr(nvl(:F4550_P4_EMAIL,''x''),''.'',l_at);',
'  return l_at > 1 and l_dot > 1 and (l_dot - l_at) > 1;',
'end;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('Endere\00E7o de e-mail inv\00E1lido')
,p_when_button_pressed=>wwv_flow_imp.id(26487014153670357.4555)
,p_associated_item=>wwv_flow_imp.id(22881822648433869.4555)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(22891011754544211.4555)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'send workspace name'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'wwv_flow_fnd_developer_api.f4550_send_workspace (',
'   p_email_address => :F4550_P4_EMAIL );'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'Erro'
,p_process_when_button_id=>wwv_flow_imp.id(26487014153670357.4555)
,p_process_success_message=>unistr('Se &F4550_P4_EMAIL. j\00E1 existir em nossos registros, enviaremos os nomes de espa\00E7os de trabalho associados a este endere\00E7o de e-mail. Se tiver problemas para receber os nomes de espa\00E7os de trabalho, entre em contato com o administrador.')
,p_internal_uid=>22891011754544211.4555
);
end;
/
prompt --application/pages/page_00007
begin
wwv_flow_imp_page.create_page(
 p_id=>7.4555
,p_name=>'Redefinir Senha'
,p_alias=>'RESET-PASSWORD'
,p_step_title=>'Redefinir Senha'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(222577907724459883)
,p_step_template=>wwv_flow_imp.id(787783544361971642.4555)
,p_page_template_options=>'#DEFAULT#'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8570511463645379.4555)
,p_plug_name=>'Hidden Items'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'AFTER_HEADER'
,p_translate_title=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(47285769528327391.4555)
,p_plug_name=>'Redefinir Senha'
,p_region_template_options=>'#DEFAULT#:a-Form--labelsAbove'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(781646415851311877.4555)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(47286811980358498.4555)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(47285769528327391.4555)
,p_button_name=>'resetpassword'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:a-Button--large'
,p_button_template_id=>wwv_flow_imp.id(781653829819356486.4555)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Redefinir Senha'
,p_button_position=>'NEXT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(14635328375431475.4555)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(47285769528327391.4555)
,p_button_name=>'Cancel'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:a-Button--large'
,p_button_template_id=>wwv_flow_imp.id(781653829819356486.4555)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_button_css_classes=>'a-Button--full'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(60120000609053928.4555)
,p_branch_name=>'Go To Page 7'
,p_branch_action=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:7::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'ITEM_IS_NOT_NULL'
,p_branch_condition=>'ERROR_OCCURRED'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(60096028904579631.4555)
,p_branch_name=>'Go To Page 1'
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:7::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22923025971699756.4555)
,p_name=>'F4550_P7_ERROR_TEXT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(47285769528327391.4555)
,p_prompt=>unistr('<span class="instructiontext">Voc\00EA n\00E3o forneceu uma combina\00E7\00E3o v\00E1lida de nome de espa\00E7o de trabalho e endere\00E7o de e-mail.</span>')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'ERROR_OCCURRED'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_protection_level=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'HTML',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(47286220449334625.4555)
,p_name=>'F4550_P7_COMPANY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(47285769528327391.4555)
,p_prompt=>unistr('Espa\00E7o de Trabalho')
,p_placeholder=>unistr('Espa\00E7o de Trabalho')
,p_post_element_text=>'<small><a href="f?p=4550:4:&APP_SESSION.">&P7_FIND_MY_WORKSPACE_LABEL.</a></small>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_field_template=>wwv_flow_imp.id(781639159048309153.4555)
,p_item_css_classes=>'icon-login-workspace'
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_input=>'N'
,p_help_text=>unistr('Informe o espa\00E7o de trabalho.  Caso n\00E3o saiba qual \00E9 o seu espa\00E7o de trabalho, use o link Localizar Meu Espa\00E7o de Trabalho.')
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'send_on_page_submit', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(47286414702337991.4555)
,p_name=>'F4550_P7_EMAIL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(47285769528327391.4555)
,p_prompt=>unistr('Endere\00E7o de E-mail')
,p_placeholder=>unistr('Endere\00E7o de E-mail')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_tag_attributes=>'autocomplete="email"'
,p_field_template=>wwv_flow_imp.id(781639159048309153.4555)
,p_item_css_classes=>'icon-login-email'
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Informe seu endere\00E7o de e-mail para que possamos enviar a senha.')
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'send_on_page_submit', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_item_comment=>'<small>Your email address in our database</small>'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(232259213858994463.4555)
,p_name=>'P7_FIND_MY_WORKSPACE_LABEL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(8570511463645379.4555)
,p_use_cache_before_default=>'NO'
,p_source=>'wwv_flow_lang.system_message(''FIND_MY_WORKSPACE'');'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(22910528694672171.4555)
,p_computation_sequence=>10
,p_computation_item=>'ERROR_OCCURRED'
,p_computation_point=>'AFTER_FOOTER'
,p_computation_type=>'STATIC_ASSIGNMENT'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(74605102595685181.4555)
,p_validation_name=>'F4550_P7_EMAIL Not Null'
,p_validation_sequence=>10
,p_validation=>'F4550_P7_EMAIL'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('O e-mail n\00E3o pode ficar em branco')
,p_associated_item=>wwv_flow_imp.id(47286414702337991.4555)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_validation_comment=>'generated 23-JAN-2007 07:29'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(74605307525685181.4555)
,p_validation_name=>'F4550_P7_COMPANY Not Null'
,p_validation_sequence=>20
,p_validation=>'F4550_P7_COMPANY'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('O espa\00E7o de trabalho n\00E3o pode ficar em branco')
,p_associated_item=>wwv_flow_imp.id(47286220449334625.4555)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_validation_comment=>'generated 23-JAN-2007 07:29'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(359674223295887132.4555)
,p_validation_name=>'do not allow internal'
,p_validation_sequence=>30
,p_validation=>'nvl(upper(:F4550_P7_COMPANY),''x'') != ''INTERNAL'''
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>unistr('Opera\00E7\00E3o de redefini\00E7\00E3o de senha n\00E3o suportada para o espa\00E7o de trabalho INTERNAL.')
,p_associated_item=>wwv_flow_imp.id(47286220449334625.4555)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(47291128490577452.4555)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'change password'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'wwv_flow_fnd_developer_api.f4550_reset_password (',
'  p_email_address=> :F4550_P7_EMAIL,',
'  p_workspace_name=> :F4550_P7_COMPANY );'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>unistr('N\00E3o foi poss\00EDvel redefinir a senha.')
,p_process_when_button_id=>wwv_flow_imp.id(47286811980358498.4555)
,p_process_success_message=>unistr('A solicita\00E7\00E3o redefinir senha foi enviada para processamento.')
,p_internal_uid=>47291128490577452.4555
);
end;
/
prompt --application/pages/page_00008
begin
wwv_flow_imp_page.create_page(
 p_id=>8.4555
,p_name=>unistr('Confirma\00E7\00E3o de Log-out')
,p_alias=>'LOGOUT-CONFIRMATION'
,p_step_title=>unistr('Confirma\00E7\00E3o de Log-out')
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(222579123308464377)
,p_step_template=>wwv_flow_imp.id(787783544361971642.4555)
,p_page_template_options=>'#DEFAULT#'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(47289611174520429.4555)
,p_plug_name=>'Saiu com sucesso'
,p_region_template_options=>'#DEFAULT#:a-Form--labelsAbove'
,p_plug_template=>wwv_flow_imp.id(781646415851311877.4555)
,p_plug_display_sequence=>10
,p_landmark_type=>'exclude_landmark'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
,p_plug_comment=>'sys.htp.p(''<h2 class="unAuthed">'' || wwv_flow_lang.system_message(''YOU_ARE_NOW_LOGGED_OUT'') || ''</h2>'');'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(235943023326098156.4555)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(47289611174520429.4555)
,p_button_name=>'LOGIN'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:a-Button--large'
,p_button_template_id=>wwv_flow_imp.id(781653829819356486.4555)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Retornar \00E0 P\00E1gina de Acesso')
,p_button_position=>'NEXT'
,p_button_redirect_url=>'apex'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(17445927460744406.4555)
,p_branch_action=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:::'
,p_branch_point=>'BEFORE_HEADER'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>60
,p_security_scheme=>wwv_flow_imp.id(6153929631135099)
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(47290514531564696.4555)
,p_branch_action=>'&P8_NEXTPAGE.'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(72005820105419587.4555)
,p_name=>'P8_NEXTPAGE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(47289611174520429.4555)
,p_item_default=>'1'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(698805599458413348.4555)
,p_name=>'Focus on Button'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(698805641444413349.4555)
,p_event_id=>wwv_flow_imp.id(698805599458413348.4555)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(235943023326098156.4555)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(48179495483070440.4555)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'clean up session state'
,p_process_sql_clob=>'delete from wwv_flow_sessions$ where id = :flow_session;'
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>48179495483070440.4555
);
end;
/
prompt --application/pages/page_00010
begin
wwv_flow_imp_page.create_page(
 p_id=>10.4555
,p_name=>unistr('Servi\00E7os de Administra\00E7\00E3o - Acesso')
,p_alias=>'ADMINISTRATION-SIGN-IN'
,p_step_title=>unistr('&PRODUCT_NAME. - Servi\00E7os de Administra\00E7\00E3o')
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(222575208632450607)
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-Login-body p {',
'    color: #707070;',
'    font-size: 1.4rem;',
'    padding: 8px;',
'}'))
,p_step_template=>wwv_flow_imp.id(787783544361971642.4555)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1043922209309491.4555)
,p_plug_name=>unistr('Servi\00E7os de Administra\00E7\00E3o')
,p_region_template_options=>'#DEFAULT#:a-Form--labelsAbove'
,p_plug_template=>wwv_flow_imp.id(781646415851311877.4555)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if wwv_flow_global.g_cloud and wwv_flow_authentication_dev.get_internal_authentication = ''DB'' then',
'    sys.htp.p(''<p>'' ||',
'              wwv_flow_session_state.do_html_substitutions(wwv_flow_lang.system_message(''F4550.WELCOME_TO_APEX_ADB'')) ||',
'              ''</p>'');',
'end if;'))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(694607830412810101.4555)
,p_plug_name=>'Language Selector'
,p_parent_plug_id=>wwv_flow_imp.id(1043922209309491.4555)
,p_region_css_classes=>'a-Login-links a-Login-links--languages'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(781705991385407800.4555)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'sys.htp.p( wwv_flow_lang.get_language_selector_list );'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'wwv_flow_4000_ui.is_translation_installed( p_flow_id => 4000 )'
,p_plug_display_when_cond2=>'PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(23205800319914944.4555)
,p_plug_name=>'init'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'AFTER_HEADER'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P10_PASSWORD := null;',
'',
'wwv_flow_authentication.add_login_throttle_onload_code;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1334523559929118455.4555)
,p_plug_name=>'Announcements'
,p_region_css_classes=>'a-Login-message'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(781705991385407800.4555)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'sys.htp.prn( wwv_flow_platform.get_preference( p_preference_name => ''LOGIN_MESSAGE''));'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_display_condition_type=>'FUNCTION_BODY'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if wwv_flow_platform.get_preference( p_preference_name => ''LOGIN_MESSAGE'') is null then',
'  return false;',
'else',
'  return true;',
'end if;'))
,p_plug_display_when_cond2=>'PLSQL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(206357726853953050.4555)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1043922209309491.4555)
,p_button_name=>'WORKSPACE_LOGIN'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(781649650278313424.4555)
,p_button_image_alt=>unistr('Acesso ao Espa\00E7o de Trabalho')
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:SESSION::'
,p_button_condition=>'not wwv_flow_security.disable_workspace_login'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(275884985213232933.4555)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(1043922209309491.4555)
,p_button_name=>'GET_STARTED'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(781649650278313424.4555)
,p_button_image_alt=>unistr('Conceitos B\00E1sicos')
,p_button_position=>'EDIT'
,p_button_redirect_url=>'javascript:void(apex.navigation.openInNewWindow(''&P10_GET_STARTED_URL!JS.''));'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P10_GET_STARTED_URL is not null',
'and wwv_flow_global.g_cloud',
'and wwv_flow_authentication_dev.get_internal_authentication = ''DB'''))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(232279713795102725.4555)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(1043922209309491.4555)
,p_button_name=>'LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:a-Button--large'
,p_button_template_id=>wwv_flow_imp.id(781653829819356486.4555)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Acessar Administra\00E7\00E3o')
,p_button_position=>'NEXT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(17446617202750916.4555)
,p_branch_action=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:::'
,p_branch_point=>'BEFORE_HEADER'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_security_scheme=>wwv_flow_imp.id(6153929631135099)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1046305318309559.4555)
,p_name=>'P10_USERNAME'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1043922209309491.4555)
,p_prompt=>'&P10_USERNAME_LABEL.'
,p_placeholder=>'&P10_USERNAME_LABEL.'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_cMaxlength=>2000
,p_tag_attributes=>'autocomplete="username"'
,p_display_when=>'P10_SHOW_USERNAME'
,p_display_when2=>'Y'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(781639159048309153.4555)
,p_item_css_classes=>'icon-login-username'
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Informe seu nome do usu\00E1rio. O nome do usu\00E1rio faz distin\00E7\00E3o entre mai\00FAsculas e min\00FAsculas. Recebida a autentica\00E7\00E3o e presumindo-se que voc\00EA tenha as credenciais corretas, voc\00EA pode criar nomes de usu\00E1rio adicionais.')
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'send_on_page_submit', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1046904764309561.4555)
,p_name=>'P10_PASSWORD'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1043922209309491.4555)
,p_prompt=>'Senha'
,p_placeholder=>'Senha'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>25
,p_cMaxlength=>2000
,p_tag_attributes=>'autocomplete="current-password"'
,p_field_template=>wwv_flow_imp.id(781639159048309153.4555)
,p_item_css_classes=>'icon-login-password'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_escape_on_http_input=>'Y'
,p_help_text=>unistr('Informe sua senha. As senhas fazem distin\00E7\00E3o entre mai\00FAsculas e min\00FAsculas. Se voc\00EA esquecer a senha, clique no link "esqueceu sua senha". Observe que cada espa\00E7o de trabalho pode ter v\00E1rios usu\00E1rios.')
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9960755203494905.4555)
,p_name=>'P10_USERNAME_LABEL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1043922209309491.4555)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'wwv_flow_lang.message(',
'    p_name => case wwv_flow_platform.get_preference(''APEX_BUILDER_AUTHENTICATION'')',
'                   when ''DB'' then ''USERNAME_DB''',
'                   when ''LDAP'' then ''USERNAME_LDAP''',
'                   else ''USERNAME''',
'              end',
')'))
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22928644002012305.4555)
,p_name=>'P10_SHOW_USERNAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1043922209309491.4555)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_admins number;',
'    l_show   varchar2(30) := ''Y'';',
'begin',
'    if (wwv_flow_global.g_cloud and wwv_flow_authentication_dev.get_internal_authentication = ''DB'') then',
'',
'        select count(*) into l_admins',
'          from wwv_flow_developers',
'         where userid <> ''ADMIN'' ',
'           and security_group_id = 10;',
'',
'        if l_admins = 0 then',
'            l_show := ''N'';',
'        end if;',
'    end if;',
'    return l_show;',
'end;'))
,p_source_type=>'FUNCTION_BODY'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(279105468975806102.4555)
,p_name=>'P10_GET_STARTED_URL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1043922209309491.4555)
,p_source=>'wwv_flow_platform.get_preference(''GET_STARTED_URL'')'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(5714704123476099.4555)
,p_computation_sequence=>10
,p_computation_item=>'PRODUCT_TYPE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>'return wwv_flow_lang.system_message(''APEX_ADMIN_SERVICES'');'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(359608213674439626.4555)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'wwv_flow_login.administrator (',
'    p_username => case when :P10_SHOW_USERNAME = ''N'' then ''ADMIN'' else :P10_USERNAME end,',
'    p_password => :P10_PASSWORD);'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>359608213674439626.4555
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1048720322309594.4555)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'clear Items on this page'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'10'
,p_internal_uid=>1048720322309594.4555
);
end;
/
prompt --application/pages/page_00020
begin
wwv_flow_imp_page.create_page(
 p_id=>20.4555
,p_name=>unistr('Selecionar um Espa\00E7o de Trabalho')
,p_alias=>'SELECT-WORKSPACE'
,p_step_title=>unistr('&PRODUCT_NAME. - Selecionar um Espa\00E7o de Trabalho')
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_javascript_code_onload=>'apex.jQuery("#WORKSPACE-1").focus();'
,p_step_template=>wwv_flow_imp.id(781636565276262406.4555)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(6153929631135099)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(355244609672857359.4555)
,p_plug_name=>'Workspace Selection Items'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_translate_title=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(356825125052947229.4555)
,p_plug_name=>unistr('An\00FAncios')
,p_region_css_classes=>'a-Login-message'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(781705991385407800.4555)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'sys.htp.prn( wwv_flow_platform.get_preference( p_preference_name => ''LOGIN_MESSAGE''));'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_display_condition_type=>'FUNCTION_BODY'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if wwv_flow_platform.get_preference( p_preference_name => ''LOGIN_MESSAGE'') is null then',
'  return false;',
'else',
'  return true;',
'end if;'))
,p_plug_display_when_cond2=>'PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(788148989693515940.4555)
,p_plug_name=>unistr('Tarefas Espec\00EDficas de Site')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:a-MediaList--noDesc:a-MediaList--noIcons'
,p_plug_template=>wwv_flow_imp.id(781720832587518133.4555)
,p_plug_display_sequence=>90
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_imp.id(787389949330441085.4555)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(781726379075536728.4555)
,p_plug_query_row_template=>wwv_flow_imp.id(232064200547094797.4555)
,p_plug_query_num_rows_type=>'0'
,p_plug_query_show_nulls_as=>' - '
,p_plug_query_break_cols=>'0'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>'select 1 from wwv_flow_customized_tasks where displayed = ''Y'' and display_location = ''WORKSPACE_LOGIN'''
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(788149141438516546.4555)
,p_plug_name=>unistr('Conceitos B\00E1sicos')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:a-MediaList--noIcons'
,p_plug_template=>wwv_flow_imp.id(781720832587518133.4555)
,p_plug_display_sequence=>100
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_imp.id(8566004359605487.4555)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(781726379075536728.4555)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(788149365141517128.4555)
,p_plug_name=>unistr('Mais Informa\00E7\00F5es')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:a-MediaList--noIcons'
,p_plug_template=>wwv_flow_imp.id(781720832587518133.4555)
,p_plug_display_sequence=>110
,p_plug_new_grid_row=>false
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_imp.id(8560508234436339.4555)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(781726379075536728.4555)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(788149510285517814.4555)
,p_plug_name=>'Social Networking Links'
,p_region_css_classes=>'a-Login-social'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(781705991385407800.4555)
,p_plug_display_sequence=>120
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="a-Login-socialLinks">',
'  <li class="a-Login-socialLinks-item">',
'    <a rel="noopener noreferrer" href="https://apex.oracle.com/twitter" target="_blank" class="a-Login-socialLinks-link">',
'      <span class="a-Icon icon-twitter"></span>',
'      <span class="u-VisuallyHidden">Twitter</span>',
'    </a>',
'  </li>',
'  <li class="a-Login-socialLinks-item">',
'    <a rel="noopener noreferrer" href="https://apex.oracle.com/linkedin" target="_blank" class="a-Login-socialLinks-link">',
'      <span class="a-Icon icon-linkedin"></span>',
'      <span class="u-VisuallyHidden">LinkedIn</span>',
'    </a>',
'  </li>',
'  <li class="a-Login-socialLinks-item">',
'    <a rel="noopener noreferrer" href="https://apex.oracle.com/facebook" target="_blank" class="a-Login-socialLinks-link">',
'      <span class="a-Icon icon-facebook"></span>',
'      <span class="u-VisuallyHidden">Facebook</span>',
'    </a>',
'  </li>',
'  <li class="a-Login-socialLinks-item">',
'    <a rel="noopener noreferrer" href="https://apex.oracle.com/youtube" target="_blank" class="a-Login-socialLinks-link">',
'      <span class="a-Icon icon-youtube"></span>',
'      <span class="u-VisuallyHidden">YouTube</span>',
'    </a>',
'  </li>',
'</ul>'))
,p_translate_title=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(788149776764518791.4555)
,p_plug_name=>'Tarefas'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:a-MediaList--noIcons'
,p_plug_template=>wwv_flow_imp.id(781720832587518133.4555)
,p_plug_display_sequence=>130
,p_plug_new_grid_row=>false
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_imp.id(115315832368341144.4555)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(781726379075536728.4555)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1903077399430433037.4555)
,p_plug_name=>'Container'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(781705991385407800.4555)
,p_plug_display_sequence=>10
,p_translate_title=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(788098255248103123.4555)
,p_plug_name=>'&PRODUCT_NAME.'
,p_parent_plug_id=>wwv_flow_imp.id(1903077399430433037.4555)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(781646415851311877.4555)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_count number;',
'begin',
'    sys.htp.p(''<h2 class="a-Login-subTitle"><span class="a-Icon icon-login-username"></span> ''||lower(:APP_USER)||''</h2>'');',
'',
'    select count(*)',
'      into l_count',
'      from wwv_flow_developer_workspaces',
'     where developer_name   = :APP_USER',
'       and workspace_status = ''ASSIGNED'';',
'',
'    if l_count > 0 then',
'        sys.htp.p(''<p class="a-Login-text">''||wwv_flow_lang.system_message(''PLEASE_SELECT_A_WORKSPACE'')||''</p>'');',
'    end if;',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(784426701644840009.4555)
,p_plug_name=>unistr('Informa\00E7\00F5es Adicionais Obrigat\00F3rias')
,p_parent_plug_id=>wwv_flow_imp.id(788098255248103123.4555)
,p_region_css_classes=>'a-Login-message'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(781705991385407800.4555)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Uma ou mais entradas de feedback que voc\00EA inseriu tem um status de ''Informa\00E7\00F5es adicionais solicitadas''! Selecione um espa\00E7o de trabalho e depois v\00E1 para o aplicativo Early Adopter Public Feedback para analisar o feedback.</p>'),
unistr('<p><em>Observa\00E7\00E3o: Esta advert\00EAncia ser\00E1 exibida at\00E9 que voc\00EA tenha inserido seu follow-up sobre as entradas de feedback.</em></p>')))
,p_plug_display_condition_type=>'FUNCTION_BODY'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'for c1 in (select ff.created_by',
'           from wwv_flow_feedback f',
'           ,    wwv_flow_feedback_followup ff',
'           where ff.feedback_id = f.id',
'           and f.application_id between 4000 and 4999',
'           and f.security_group_id = 10',
'           and f.feedback_status = 2',
'           and f.created_by = :app_user',
'           order by ff.created_on desc',
'          ) loop',
'  if :app_user = c1.created_by then',
'    return FALSE;',
'  else',
'    return TRUE;',
'  end if;',
'end loop;',
'return FALSE;'))
,p_plug_display_when_cond2=>'PLSQL'
,p_required_patch=>wwv_flow_imp.id(836093046470445605.4555)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(788095677913088930.4555)
,p_plug_name=>'List of Workspaces'
,p_parent_plug_id=>wwv_flow_imp.id(788098255248103123.4555)
,p_component_template_options=>'a-MediaList--slim'
,p_plug_display_sequence=>50
,p_list_id=>wwv_flow_imp.id(788072921346081694.4555)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(781726379075536728.4555)
,p_translate_title=>'N'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select *',
'  from wwv_flow_developer_workspaces',
' where developer_name   = :APP_USER',
'   and workspace_status = ''ASSIGNED'''))
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(825234084074277602.4555)
,p_plug_name=>'No Rows Returned'
,p_parent_plug_id=>wwv_flow_imp.id(788098255248103123.4555)
,p_plug_display_sequence=>60
,p_translate_title=>'N'
,p_plug_display_condition_type=>'NOT_EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from wwv_flow_developer_workspaces',
' where developer_name   = :APP_USER',
'   and workspace_status = ''ASSIGNED''',
'union all',
'select null',
'  from wwv_flow_provision_company',
' where admin_userid   = :APP_USER',
'   and project_status in (''REQUESTED'',''ACCEPTED'')'))
,p_plug_header=>'<p class="a-Login-text a-Login-text--notFoundMessage">There are no workspaces associated with your account.</p>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1959512182339704219.4555)
,p_plug_name=>'Languages'
,p_parent_plug_id=>wwv_flow_imp.id(788098255248103123.4555)
,p_region_css_classes=>'a-Login-links a-Login-links--languages'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(781705991385407800.4555)
,p_plug_display_sequence=>100
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'sys.htp.p( wwv_flow_lang.get_language_selector_list );'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'wwv_flow_4000_ui.is_translation_installed( p_flow_id => 4000 )'
,p_plug_display_when_cond2=>'PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2024382717374138701.4555)
,p_plug_name=>'Pending Workspace Requests'
,p_parent_plug_id=>wwv_flow_imp.id(788098255248103123.4555)
,p_plug_display_sequence=>70
,p_translate_title=>'N'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'     from wwv_flow_provision_company',
'    where admin_userid   = :APP_USER',
'      and project_status in (''REQUESTED'',''ACCEPTED'')'))
,p_plug_header=>'<p class="a-Login-text a-Login-text--workspaceRequest">You have workspace requests pending approval. Further instructions will be provided via email.</p>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(355343217768869136.4555)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(788098255248103123.4555)
,p_button_name=>'NEW_WORKSPACE'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:a-Button--large'
,p_button_template_id=>wwv_flow_imp.id(781653829819356486.4555)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Solicitar um Novo Espa\00E7o de Trabalho')
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=4700:2:&SESSION.::&DEBUG.:RP,::'
,p_button_condition=>'wwv_flow_platform.get_preference( p_preference_name => ''SERVICE_REQUEST_FLOW'' ) <> ''MANUAL'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(787948171855029003.4555)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(788098255248103123.4555)
,p_button_name=>'SIGNOUT'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:a-Button--large'
,p_button_template_id=>wwv_flow_imp.id(781653829819356486.4555)
,p_button_image_alt=>'Sair'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'&LOGOUT_URL.'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20780723786489096.4555)
,p_name=>'P20_WORKSPACE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(355244609672857359.4555)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(23554931773705253.4555)
,p_name=>'P20_AUTO_LOGIN_OCCURRED'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(355244609672857359.4555)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5499919566405279.4555)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'go workspace'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--',
'-- log user into workspace. this immediately re-directs, no branch necessary.',
'--',
'wwv_flow_login.builder (',
'     p_workspace => regexp_replace(:REQUEST ,''^GO_WORKSPACE '', null),',
'     p_username  => :APP_USER );'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':REQUEST like ''GO_WORKSPACE %'''
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'SQL'
,p_internal_uid=>5499919566405279.4555
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(17346400590121618.4555)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Auto-login'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_workspace_name varchar2(32767);',
'begin',
'    --',
'    -- bail out if we are in a cycle',
'    --',
'    if :P20_AUTO_LOGIN_OCCURRED = ''Y'' then return; end if;',
'',
'    --',
'    -- get a workspace name',
'    -- clear the item, so an error in login+redirect does not lead to a cycle',
'    --',
'    l_workspace_name := :P20_WORKSPACE;',
'    wwv_flow.update_cache_with_write (',
'         p_name  => ''P20_WORKSPACE'',',
'         p_value => null );',
'    --',
'    -- the user only has access to 1 workspace or provided one in the URL: ',
'    -- automatically login and redirect.',
'    -- this stops processing of the rest of the page.',
'    --',
'    wwv_flow_debug.trace(''... auto-login into %s'',l_workspace_name);',
'    wwv_flow_login.builder (',
'        p_workspace => l_workspace_name,',
'        p_username  => :APP_USER );',
'    --',
'    -- prevent a cycle on login errors',
'    --',
'    :P20_AUTO_LOGIN_OCCURRED := ''Y'';',
'    :P20_WORKSPACE           := null;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>'P20_WORKSPACE'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_internal_uid=>17346400590121618.4555
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
