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
,p_default_application_id=>4103
,p_default_id_offset=>0
,p_default_owner=>'APEX_240200'
);
end;
/
 
prompt APPLICATION 4103 - Oracle APEX Home
--
-- Application Export:
--   Application:     4103
--   Name:            Oracle APEX Home
--   Exported By:     APEX_240200
--   Flashback:       0
--   Export Type:     Application Export
--     Pages:                      5
--       Items:                    8
--       Computations:             2
--       Processes:                4
--       Regions:                 35
--       Buttons:                 14
--       Dynamic Actions:          5
--     Shared Components:
--       Logic:
--         Items:                  1
--         Processes:              1
--         Build Options:          1
--       Navigation:
--         Parent Tabs:            4
--         Lists:                  6
--       Security:
--         Authentication:         1
--         Authorization:         12
--       User Interface:
--         Templates:
--           Page:                 4
--           Region:               6
--           Label:                1
--           List:                 4
--           Popup LOV:            1
--           Calendar:             1
--           Breadcrumb:           1
--           Button:               4
--           Report:               3
--         LOVs:                   2
--         Plug-ins:               9
--       PWA:
--       Globalization:
--         Messages:               5
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
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Oracle APEX Home')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'A132800166480728517')
,p_page_view_logging=>'YES'
,p_charset=>'utf-8'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt_last_reset=>'20250422175128'
,p_bookmark_checksum_function=>'SH1'
,p_compatibility_mode=>'24.2'
,p_session_state_commits=>'IMMEDIATE'
,p_flow_language=>'de'
,p_flow_language_derived_from=>'SESSION'
,p_date_format=>'&DATE_FORMAT.'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(1477739433453980.4103)
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
,p_substitution_value_03=>'Workspace: &COMPANY.'
,p_substitution_string_04=>'MSG_LANGUAGE'
,p_substitution_value_04=>'Sprache'
,p_substitution_string_05=>'MSG_COPYRIGHT'
,p_substitution_value_05=>'Copyright &copy; 1999, 2024, Oracle und/oder verbundene Unternehmen.'
,p_substitution_string_06=>'MSG_USER'
,p_substitution_value_06=>'Benutzer'
,p_substitution_string_07=>'MSG_JSCRIPT'
,p_substitution_value_07=>unistr('Wenn Sie dieses Produkt ausf\00FChren, muss JavaScript aktiviert sein.')
,p_substitution_string_08=>'MSG_TBL_SUMMARY'
,p_substitution_value_08=>unistr('Tabelle f\00FCr das Seitenlayout')
,p_substitution_string_09=>'CLOSE'
,p_substitution_value_09=>unistr('Schlie\00DFen')
,p_substitution_string_10=>'DATE_FORMAT'
,p_substitution_value_10=>'dd.mm.rr'
,p_substitution_string_11=>'LONG_DATE_FORMAT'
,p_substitution_value_11=>'fmDay, dd. Month yyyy'
,p_substitution_string_12=>'TIME_FORMAT'
,p_substitution_value_12=>'hh24:mi:ss'
,p_substitution_string_13=>'DATE_TIME_FORMAT'
,p_substitution_value_13=>'dd.mm.rr hh24:mi:ss'
,p_substitution_string_14=>'RETURN_TO_APPLICATION'
,p_substitution_value_14=>unistr('Zur\00FCck zu Anwendung')
,p_substitution_string_15=>'MSG_WORKSPACE'
,p_substitution_value_15=>'Workspace'
,p_substitution_string_16=>'TOP'
,p_substitution_value_16=>'Oben'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_version_scn=>2515840
,p_print_server_type=>'INSTANCE'
,p_file_storage=>'DB'
,p_is_pwa=>'N'
);
end;
/
prompt --application/user_interfaces
begin
wwv_flow_imp_shared.create_user_interface(
 p_id=>wwv_flow_imp.id(4103)
,p_theme_id=>3
,p_home_url=>'f?p=&APP_ID.:1:&SESSION.'
,p_login_url=>'f?p=4550:1:&SESSION.'
,p_theme_style_by_user_pref=>false
,p_global_page_id=>.4103
,p_nav_list_template_options=>'#DEFAULT#'
,p_include_legacy_javascript=>'PRE18:18'
,p_nav_bar_type=>'NAVBAR'
,p_nav_bar_template_options=>'#DEFAULT#'
);
end;
/
prompt --application/shared_components/navigation/lists/extension_links_menu
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(1617849920194181.4103)
,p_name=>'Extension Links Menu'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select lev,',
'       label,',
'       target,',
'       null     as is_current,',
'       null     as image,',
'       null     as image_attrib,',
'       null     as image_alt_attribute,',
'       null     as attribute1,',
'       null     as attribute2,',
'       null     as attribute3,',
'       null     as attribute4,',
'       null     as attribute5,',
'       ''_blank'' as attribute6,',
'       null     as attribute7,',
'       null     as attribute8,',
'       null     as attribute9,',
'       null     as attribute10',
'  from (',
'          select 1                          as lev,',
'                 name                       as label,',
'                 wwv_extension.get_url(url) as target,',
'                 null                       as wsname,',
'                 display_sequence',
'            from wwv_extension_links',
'           where security_group_id = :workspace_id',
'          union all',
'          select 1                                           as lev,',
'                 nvl(eg.menu_label, initcap(c.display_name)) as label,',
'                 null                                        as target,',
'                 c.display_name                              as wsname,',
'                 0                                           as display_sequence',
'            from wwv_extension_grants eg, wwv_flow_companies c',
'           where eg.security_group_id           = :workspace_id',
'             and eg.extension_security_group_id = c.provisioning_company_id',
'             and c.is_extension_yn in (''Y'', ''A'')',
'             and exists (',
'                   select 1',
'                     from wwv_extension_links l',
'                    where l.security_group_id = eg.extension_security_group_id',
'                      and is_public           = ''Y'' )',
'          union all',
'          select 2                             as lev,',
'                 name                          as label,',
'                 wwv_extension.get_url(el.url) as target,',
'                 eg.wsname                     as wsname,',
'                 el.display_sequence',
'            from (',
'                    select eg.*,',
'                           c.display_name as wsname',
'                      from wwv_extension_grants eg, wwv_flow_companies c',
'                     where eg.security_group_id           = :workspace_id',
'                       and eg.extension_security_group_id = c.provisioning_company_id',
'                       and c.is_extension_yn in (''Y'', ''A'')',
'                 )                         eg, wwv_extension_links el',
'           where el.security_group_id = eg.extension_security_group_id',
'             and el.is_public         = ''Y''',
'       )',
' order by wsname nulls first, lev, display_sequence, label'))
,p_list_status=>'PUBLIC'
,p_version_scn=>73375486
);
end;
/
prompt --application/shared_components/navigation/lists/apex_5_administration_header
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(1618455056194184.4103)
,p_name=>'APEX 5 - Administration (Header)'
,p_list_status=>'PUBLIC'
,p_version_scn=>75558566
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1618783082194184.4103)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Administration'
,p_list_item_link_target=>'f?p=4350:1:&APP_SESSION.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1619173198194185.4103)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'------'
,p_list_item_link_target=>'separator'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1619525076194185.4103)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Service verwalten'
,p_security_scheme=>wwv_flow_imp.id(2232502732209663)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1619987530194185.4103)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'Service verwalten'
,p_list_item_link_target=>'f?p=4350:21:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(1619525076194185.4103)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1620329248194185.4103)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'------'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_imp.id(1619525076194185.4103)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1620710462194185.4103)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'Serviceanforderung senden'
,p_list_item_link_target=>'f?p=4350:96:&SESSION.::NO:49::'
,p_list_item_disp_cond_type=>'EXPRESSION'
,p_list_item_disp_condition=>'wwv_flow_platform.get_preference(''SERVICE_REQUESTS_ENABLED'') = ''Y'''
,p_list_item_disp_condition2=>'PLSQL'
,p_parent_list_item_id=>wwv_flow_imp.id(1619525076194185.4103)
,p_security_scheme=>wwv_flow_imp.id(2232502732209663)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1621148075194186.4103)
,p_list_item_display_sequence=>110
,p_list_item_link_text=>'Workspace-Voreinstellungen festlegen'
,p_list_item_link_target=>'f?p=4350:17:&SESSION.::NO:RP::'
,p_parent_list_item_id=>wwv_flow_imp.id(1619525076194185.4103)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1621594633194186.4103)
,p_list_item_display_sequence=>120
,p_list_item_link_text=>'Workspace-Nachricht definieren'
,p_list_item_link_target=>'f?p=4350:35:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(1619525076194185.4103)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1621946860194186.4103)
,p_list_item_display_sequence=>130
,p_list_item_link_text=>'Umgebungsbanner definieren'
,p_list_item_link_target=>'f?p=4350:105:&SESSION.:::105:P105_LAST_APP_ID,P105_LAST_PAGE_ID:&APP_ID.,&APP_PAGE_ID.'
,p_parent_list_item_id=>wwv_flow_imp.id(1619525076194185.4103)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1622378322194186.4103)
,p_list_item_display_sequence=>140
,p_list_item_link_text=>'Workspace-Nutzung'
,p_list_item_link_target=>'f?p=4350:101:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(1619525076194185.4103)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1622789414194186.4103)
,p_list_item_display_sequence=>150
,p_list_item_link_text=>'Erweiterungslinks verwalten'
,p_list_item_link_target=>'f?p=4350:110:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(1619525076194185.4103)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1623111874194186.4103)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Benutzer und Gruppen verwalten'
,p_list_item_link_target=>'f?p=4350:55:&SESSION.'
,p_security_scheme=>wwv_flow_imp.id(2232502732209663)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1623530036194186.4103)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>unistr('Aktivit\00E4t \00FCberwachen')
,p_list_item_link_target=>'f?p=4350:22:&SESSION.'
,p_security_scheme=>wwv_flow_imp.id(1601594384779894)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1623931361194186.4103)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Dashboards'
,p_list_item_link_target=>'f?p=4350:33:&SESSION.'
,p_security_scheme=>wwv_flow_imp.id(1601594384779894)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1624363378194187.4103)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>unistr('Mein Kennwort \00E4ndern')
,p_list_item_link_target=>'f?p=4350:3:&SESSION.::&DEBUG.:3#pwd'
,p_list_item_disp_cond_type=>'EXPRESSION'
,p_list_item_disp_condition=>'wwv_flow_authentication_dev.can_edit_builder_users'
,p_list_item_disp_condition2=>'PLSQL'
,p_security_scheme=>wwv_flow_imp.id(1601594384779894)
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/navigation/lists/apex_5_help
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(1627426286194188.4103)
,p_name=>'APEX 5 - Help'
,p_list_status=>'PUBLIC'
,p_version_scn=>75558566
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1627759179194188.4103)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Dokumentation'
,p_list_item_link_target=>'&SYSTEM_HELP_URL.'
,p_list_text_01=>'helpLinkDocLib'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1628124395194188.4103)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Diskussionsforum'
,p_list_item_link_target=>'https://apex.oracle.com/forum'
,p_list_text_01=>'helpLinkForum'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1628537632194188.4103)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Weitere Informationen zu Oracle APEX'
,p_list_item_link_target=>'https://apex.oracle.com'
,p_list_text_01=>'helpLinkOTN'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1628923818194189.4103)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'---'
,p_list_item_link_target=>'separator'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1629305193194189.4103)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Info'
,p_list_item_link_target=>'f?p=4350:9:&SESSION.'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
end;
/
prompt --application/shared_components/navigation/lists/apex_shared_navigation_menu
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(1630037294194189.4103)
,p_name=>'APEX Shared Navigation Menu'
,p_list_status=>'PUBLIC'
,p_version_scn=>117449631
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2403843244227546.4103)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'App Builder'
,p_list_item_link_target=>'f?p=4000:1500:&SESSION.::&DEBUG.::::'
,p_list_item_icon_alt_attribute=>'App Builder Drilldown'
,p_list_text_01=>'tab-app-builder'
,p_security_scheme=>wwv_flow_imp.id(1605452165888276)
,p_list_item_current_type=>'EXPRESSION'
,p_list_item_current_for_pages=>':APP_ID in ( 4000, 4020 )'
,p_list_item_current_language=>'PLSQL'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2404237488227546.4103)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Erstellen'
,p_list_item_link_target=>'f?p=4000:56:&SESSION.::&DEBUG.:56,103,104,106,130,131,35,227,3020,3000,3001:FB_FLOW_ID,FB_FLOW_PAGE_ID::'
,p_parent_list_item_id=>wwv_flow_imp.id(2403843244227546.4103)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2404619537227546.4103)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Importieren'
,p_list_item_link_target=>'f?p=4000:460:&SESSION.::&DEBUG.:460:P460_FILE_TYPE:FLOW_EXPORT:'
,p_parent_list_item_id=>wwv_flow_imp.id(2403843244227546.4103)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2405089679227547.4103)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Exportieren'
,p_list_item_link_target=>'f?p=4000:4900:&SESSION.::&DEBUG.:4900:FB_FLOW_ID,FB_FLOW_PAGE_ID::'
,p_parent_list_item_id=>wwv_flow_imp.id(2403843244227546.4103)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2405403074227547.4103)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'-----'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_imp.id(2403843244227546.4103)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2405818423227547.4103)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'Workspace-Utilitys'
,p_parent_list_item_id=>wwv_flow_imp.id(2403843244227546.4103)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2406216522227547.4103)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'Alle Workspace-Utilitys'
,p_list_item_link_target=>'f?p=4000:182:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_imp.id(2405818423227547.4103)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2406696349227547.4103)
,p_list_item_display_sequence=>110
,p_list_item_link_text=>'-----'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_imp.id(2405818423227547.4103)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2407043537227547.4103)
,p_list_item_display_sequence=>120
,p_list_item_link_text=>'Workspace Themes'
,p_list_item_link_target=>'f?p=4000:763:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_imp.id(2405818423227547.4103)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2407462853227547.4103)
,p_list_item_display_sequence=>130
,p_list_item_link_text=>'Anwendungsgruppen'
,p_list_item_link_target=>'f?p=4000:722:&SESSION.::&DEBUG.:RP'
,p_parent_list_item_id=>wwv_flow_imp.id(2405818423227547.4103)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2407880221227547.4103)
,p_list_item_display_sequence=>140
,p_list_item_link_text=>'&PRODUCT_NAME.-Ansichten'
,p_list_item_link_target=>'f?p=4000:714:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_imp.id(2405818423227547.4103)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2408244733227547.4103)
,p_list_item_display_sequence=>150
,p_list_item_link_text=>unistr('Anwendungs\00FCbergreifende Berichte')
,p_list_item_link_target=>'f?p=4000:9009:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_imp.id(2405818423227547.4103)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2408689689227548.4103)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'SQL Workshop'
,p_list_item_link_target=>'f?p=4500:3002:&SESSION.'
,p_list_item_icon_alt_attribute=>'SQL Workshop Drilldown'
,p_list_text_01=>'tab-sql-workshop'
,p_security_scheme=>wwv_flow_imp.id(1602976254825538)
,p_list_item_current_type=>'EXPRESSION'
,p_list_item_current_for_pages=>'( :APP_ID = 4500 and :APP_PAGE_ID not in ( ''1000'',''8000'',''35'', ''900'' ) ) or :APP_ID in ( 4850, 4300 )'
,p_list_item_current_language=>'PLSQL'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2409068298227548.4103)
,p_list_item_display_sequence=>160
,p_list_item_link_text=>'Objektbrowser'
,p_list_item_link_target=>'f?p=4500:2000:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(2408689689227548.4103)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2409468379227548.4103)
,p_list_item_display_sequence=>170
,p_list_item_link_text=>'SQL-Befehle'
,p_list_item_link_target=>'f?p=4500:1003:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(2408689689227548.4103)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2409858431227548.4103)
,p_list_item_display_sequence=>180
,p_list_item_link_text=>'SQL-Skripte'
,p_list_item_link_target=>'f?p=4500:1004:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(2408689689227548.4103)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2410231181227548.4103)
,p_list_item_display_sequence=>190
,p_list_item_link_text=>'Utilitys'
,p_parent_list_item_id=>wwv_flow_imp.id(2408689689227548.4103)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2410677438227548.4103)
,p_list_item_display_sequence=>220
,p_list_item_link_text=>'Alle Utilitys'
,p_list_item_link_target=>'f?p=4500:1005:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(2410231181227548.4103)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2411077057227548.4103)
,p_list_item_display_sequence=>230
,p_list_item_link_text=>'-----'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_imp.id(2410231181227548.4103)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2411410188227548.4103)
,p_list_item_display_sequence=>240
,p_list_item_link_text=>'Data Workshop'
,p_list_item_link_target=>'f?p=4300:1:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(2410231181227548.4103)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2411849897227548.4103)
,p_list_item_display_sequence=>250
,p_list_item_link_text=>'Datengenerator'
,p_list_item_link_target=>'f?p=4500:4000:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(2410231181227548.4103)
,p_security_scheme=>wwv_flow_imp.id(1606732058896590)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2412280619227549.4103)
,p_list_item_display_sequence=>260
,p_list_item_link_text=>'Query Builder'
,p_list_item_link_target=>'f?p=4500:1002:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(2410231181227548.4103)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2412626517227549.4103)
,p_list_item_display_sequence=>270
,p_list_item_link_text=>'Quick SQL'
,p_list_item_link_target=>'f?p=4500:1100:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(2410231181227548.4103)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2413096377227549.4103)
,p_list_item_display_sequence=>280
,p_list_item_link_text=>'Beispiel-Datasets'
,p_list_item_link_target=>'f?p=4300:100:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(2410231181227548.4103)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2413408594227549.4103)
,p_list_item_display_sequence=>290
,p_list_item_link_text=>'DDL generieren'
,p_list_item_link_target=>'f?p=4500:12:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(2410231181227548.4103)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2413851734227549.4103)
,p_list_item_display_sequence=>300
,p_list_item_link_text=>'UI-Standards'
,p_list_item_link_target=>'f?p=4500:813:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(2410231181227548.4103)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2414238158227549.4103)
,p_list_item_display_sequence=>310
,p_list_item_link_text=>'Schemavergleich'
,p_list_item_link_target=>'f?p=4500:1350:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(2410231181227548.4103)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2414683084227549.4103)
,p_list_item_display_sequence=>320
,p_list_item_link_text=>'Methoden auf Tabellen'
,p_list_item_link_target=>'f?p=4500:120:&SESSION.:'
,p_parent_list_item_id=>wwv_flow_imp.id(2410231181227548.4103)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2415007234227549.4103)
,p_list_item_display_sequence=>330
,p_list_item_link_text=>'Papierkorb'
,p_list_item_link_target=>'f?p=4500:1070:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(2410231181227548.4103)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2415477456227549.4103)
,p_list_item_display_sequence=>340
,p_list_item_link_text=>'Objektberichte'
,p_list_item_link_target=>'f?p=4500:1042:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(2410231181227548.4103)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2415817620227550.4103)
,p_list_item_display_sequence=>350
,p_list_item_link_text=>'Info zur Datenbank'
,p_list_item_link_target=>'f?p=4500:36:&SESSION.'
,p_list_item_disp_cond_type=>'EXPRESSION'
,p_list_item_disp_condition=>'wwv_flow_platform.get_preference(''ALLOW_DB_MONITOR'') = ''Y'''
,p_list_item_disp_condition2=>'PLSQL'
,p_parent_list_item_id=>wwv_flow_imp.id(2410231181227548.4103)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2416260382227550.4103)
,p_list_item_display_sequence=>360
,p_list_item_link_text=>unistr('Datenbank\00FCberwachung')
,p_list_item_link_target=>'f?p=4500:11:&SESSION.'
,p_list_item_disp_cond_type=>'EXPRESSION'
,p_list_item_disp_condition=>'wwv_flow_platform.get_preference(''ALLOW_DB_MONITOR'') = ''Y'''
,p_list_item_disp_condition2=>'PLSQL'
,p_parent_list_item_id=>wwv_flow_imp.id(2410231181227548.4103)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2416601343227550.4103)
,p_list_item_display_sequence=>200
,p_list_item_link_text=>'RESTful Services'
,p_list_item_link_target=>'f?p=4850:100:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(2408689689227548.4103)
,p_security_scheme=>wwv_flow_imp.id(1605994067894491)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2417049908227550.4103)
,p_list_item_display_sequence=>210
,p_list_item_link_text=>'SQL Developer Web'
,p_list_item_link_target=>'f?p=4500:64:&SESSION.::&DEBUG.:64:::'
,p_parent_list_item_id=>wwv_flow_imp.id(2408689689227548.4103)
,p_security_scheme=>wwv_flow_imp.id(1606493727894491)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2417408089227550.4103)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Team Development'
,p_list_item_link_target=>'f?p=4600:1:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon_alt_attribute=>'Team Development Drilldown'
,p_list_text_01=>'tab-team-dev'
,p_security_scheme=>wwv_flow_imp.id(2233317028209664)
,p_list_item_current_type=>'EXPRESSION'
,p_list_item_current_for_pages=>':APP_ID in ( 4600, 4650 )'
,p_list_item_current_language=>'PLSQL'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2417833728227550.4103)
,p_list_item_display_sequence=>370
,p_list_item_link_text=>'Labels'
,p_list_item_link_target=>'f?p=4600:300:&SESSION.::&DEBUG.:RP:::'
,p_parent_list_item_id=>wwv_flow_imp.id(2417408089227550.4103)
,p_security_scheme=>wwv_flow_imp.id(2224190594209629)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2418247493227550.4103)
,p_list_item_display_sequence=>380
,p_list_item_link_text=>'Meilensteine'
,p_list_item_link_target=>'f?p=4600:200:&SESSION.::&DEBUG.:RP:::'
,p_parent_list_item_id=>wwv_flow_imp.id(2417408089227550.4103)
,p_security_scheme=>wwv_flow_imp.id(2224190594209629)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2418608489227550.4103)
,p_list_item_display_sequence=>390
,p_list_item_link_text=>'Templates'
,p_list_item_link_target=>'f?p=4600:1000:&SESSION.::&DEBUG.:RP:::'
,p_parent_list_item_id=>wwv_flow_imp.id(2417408089227550.4103)
,p_security_scheme=>wwv_flow_imp.id(2224190594209629)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2419002732227551.4103)
,p_list_item_display_sequence=>400
,p_list_item_link_text=>'Utilitys'
,p_list_item_link_target=>'f?p=4600:2000:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_imp.id(2417408089227550.4103)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2419414186227551.4103)
,p_list_item_display_sequence=>410
,p_list_item_link_text=>'-----'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_imp.id(2417408089227550.4103)
,p_security_scheme=>wwv_flow_imp.id(2224190594209629)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2419881466227551.4103)
,p_list_item_display_sequence=>420
,p_list_item_link_text=>'Feedback'
,p_list_item_link_target=>'f?p=4650:8012:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_imp.id(2417408089227550.4103)
,p_security_scheme=>wwv_flow_imp.id(2224190594209629)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2420256494227551.4103)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Galerie'
,p_list_item_link_target=>'f?p=4750:50:&SESSION.'
,p_list_text_01=>'tab-apps'
,p_security_scheme=>wwv_flow_imp.id(2224190594209629)
,p_list_item_current_type=>'EXPRESSION'
,p_list_item_current_for_pages=>':APP_ID = 4750'
,p_list_item_current_language=>'PLSQL'
);
end;
/
prompt --application/shared_components/navigation/lists/apex_5_0_homepage_large_icons
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(2218105708209619.4103)
,p_name=>'APEX 5.0 - Homepage Large Icons'
,p_list_status=>'PUBLIC'
,p_version_scn=>75558571
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2218444371209623.4103)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'App Builder'
,p_list_item_link_target=>'f?p=4000:1500:&SESSION.:::'
,p_list_item_icon=>'app-builder'
,p_list_item_disp_cond_type=>'EXISTS'
,p_list_item_disp_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''x''',
'from WWV_FLOW_COMPANIES',
'where provisioning_company_id = :flow_security_group_id',
'and   NVL(allow_app_building_yn,''Y'') = ''Y'''))
,p_list_text_01=>'app-builder'
,p_security_scheme=>wwv_flow_imp.id(2224190594209629)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2218846300209623.4103)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'SQL Workshop'
,p_list_item_link_target=>'f?p=4500:3002:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'sql-workshop'
,p_list_item_icon_attributes=>'width="128" height="128" alt=""'
,p_list_item_disp_cond_type=>'EXISTS'
,p_list_item_disp_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''x''',
'from WWV_FLOW_COMPANIES',
'where provisioning_company_id = :flow_security_group_id',
'and   NVL(allow_sql_workshop_yn,''Y'') = ''Y'''))
,p_list_text_01=>'sql-workshop'
,p_security_scheme=>wwv_flow_imp.id(1602976254825538)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2219293910209624.4103)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Team Development'
,p_list_item_link_target=>'f?p=4600:1:&SESSION.:::'
,p_list_item_icon=>'issues'
,p_list_item_icon_attributes=>'width="128" height="128" alt=""'
,p_list_text_01=>'issues'
,p_security_scheme=>wwv_flow_imp.id(2233317028209664)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2220037679209624.4103)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Galerie'
,p_list_item_link_target=>'f?p=4750:50:&APP_SESSION.:::50'
,p_list_item_icon=>'pkg-apps'
,p_list_item_icon_attributes=>'width="128" height="128" alt=""'
,p_list_text_01=>'pkg-apps'
,p_security_scheme=>wwv_flow_imp.id(2224190594209629)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
end;
/
prompt --application/shared_components/navigation/lists/home_resources_links
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(2220705999209625.4103)
,p_name=>'HOME RESOURCES LINKS'
,p_list_status=>'PUBLIC'
,p_version_scn=>75558571
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2221029322209625.4103)
,p_list_item_display_sequence=>1
,p_list_item_link_text=>'APEX-Website'
,p_list_item_link_target=>'https://apex.oracle.com'
,p_list_text_02=>'rel="noopener noreferrer" target="_blank"'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2221466786209625.4103)
,p_list_item_display_sequence=>2
,p_list_item_link_text=>'Blog'
,p_list_item_link_target=>'https://apex.oracle.com/blog'
,p_list_text_02=>'rel="noopener noreferrer" target="_blank"'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2221896356209625.4103)
,p_list_item_display_sequence=>3
,p_list_item_link_text=>'Tutorials'
,p_list_item_link_target=>'https://apex.oracle.com/hols'
,p_list_text_02=>'rel="noopener noreferrer" target="_blank"'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2222240011209625.4103)
,p_list_item_display_sequence=>4
,p_list_item_link_text=>'Videos'
,p_list_item_link_target=>'https://apex.oracle.com/videos'
,p_list_text_02=>'rel="noopener noreferrer" target="_blank"'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2222649130209626.4103)
,p_list_item_display_sequence=>5
,p_list_item_link_text=>'Schulungsressourcen'
,p_list_item_link_target=>'https://apex.oracle.com/en/learn/training'
,p_list_text_02=>'rel="noopener noreferrer" target="_blank"'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2223026857209626.4103)
,p_list_item_display_sequence=>6
,p_list_item_link_text=>'Ideen und Featureanfragen'
,p_list_item_link_target=>'https://apex.oracle.com/ideas'
,p_list_text_02=>'rel="noopener noreferrer" target="_blank"'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2223485071209626.4103)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'apex.world'
,p_list_item_link_target=>'https://apex.oracle.com/apex.world'
,p_list_text_02=>'rel="noopener noreferrer" target="_blank"'
,p_list_text_03=>'is-external-link'
,p_list_item_current_type=>'TARGET_PAGE'
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
 p_id=>wwv_flow_imp.id(1379109302453695.4103)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SELECT_MANY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_values_as', 'separated')).to_clob
,p_version_scn=>7007816
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1385696208781672.4103)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'NATIVE_OPEN_AI_ASSISTANT'
,p_version_scn=>16260374
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1410424097182729.4103)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_BOSS'
,p_version_scn=>243440456
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1815858492262215.4103)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'default_icon', 'fa-star',
  'tooltip', '#VALUE#')).to_clob
,p_version_scn=>7007817
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(3297538466139501.4103)
,p_plugin_type=>'PROCESS TYPE'
,p_plugin=>'NATIVE_GEOCODING'
,p_attribute_01=>'RELAX_HOUSE_NUMBER'
,p_version_scn=>117643876
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(16459931833762295.4103)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_style', 'SWITCH_CB',
  'off_value', 'N',
  'on_value', 'Y')).to_clob
,p_version_scn=>6539585
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(101445796627710162.4103)
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
 p_id=>wwv_flow_imp.id(120082043033654285.4103)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_MAP_REGION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_vector_tile_layers', 'Y')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(124814912138299724.4103)
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
 p_id=>wwv_flow_imp.id(125990604929810556.4103)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_ADFBC'
,p_version_scn=>37165931336889
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(177729850064328075.4103)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N')).to_clob
,p_version_scn=>7007822
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1766673389073533311.4103)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'include_slider', 'N')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1833381130509815410.4103)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'actions_menu_structure', 'IG')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1919233990275761144.4103)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'mode', 'FULL')).to_clob
,p_version_scn=>7007823
);
end;
/
prompt --application/shared_components/security/authorizations/dashboard_access
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(1601594384779894.4103)
,p_name=>'Dashboard access'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return',
'    wwv_flow_authorization.is_authorized_developer(',
'        p_developer_authorization => ''ADMIN''',
'    )',
'    or wwv_flow_authorization.is_authorized_developer(',
'        p_developer_authorization => ''EDIT''',
'    );'))
,p_error_message=>unistr('Sie sind nicht autorisiert, auf Dashboards zuzugreifen und die Aktivit\00E4t zu \00FCberwachen.')
,p_version_scn=>2617546
,p_caching=>'BY_USER_BY_SESSION'
);
end;
/
prompt --application/shared_components/security/authorizations/apex_5_0_sql_workshop_enabled
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(1602976254825538.4103)
,p_name=>'APEX 5.0 SQL Workshop Enabled'
,p_scheme_type=>'PLUGIN_COM.ORACLE.APEX.DEVELOPER_AUTHORIZATION'
,p_attribute_01=>'SQL'
,p_error_message=>'Sie sind nicht berechtigt, SQL Workshop zu verwenden.'
,p_version_scn=>2617546
,p_caching=>'BY_USER_BY_SESSION'
);
end;
/
prompt --application/shared_components/security/authorizations/apex_5_0_app_builder_enabled
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(1605452165888276.4103)
,p_name=>'APEX 5.0 App Builder Enabled'
,p_scheme_type=>'PLUGIN_COM.ORACLE.APEX.DEVELOPER_AUTHORIZATION'
,p_attribute_01=>'EDIT'
,p_error_message=>unistr('Keine Berechtigung f\00FCr versuchten Vorgang')
,p_version_scn=>2617546
,p_caching=>'BY_USER_BY_SESSION'
);
end;
/
prompt --application/shared_components/security/authorizations/flow_restful
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(1605994067894491.4103)
,p_name=>'Flow: RESTFUL'
,p_scheme_type=>'PLUGIN_COM.ORACLE.APEX.DEVELOPER_AUTHORIZATION'
,p_attribute_01=>'RESTFUL'
,p_error_message=>unistr('Keine Berechtigung f\00FCr versuchten Vorgang')
,p_version_scn=>2617546
,p_caching=>'BY_USER_BY_SESSION'
);
end;
/
prompt --application/shared_components/security/authorizations/sql_developer_web_enabled
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(1606493727894491.4103)
,p_name=>'SQL Developer Web enabled'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    return wwv_flow_listener.sql_developer_web_enabled;',
'end;'))
,p_error_message=>unistr('SQL Developer Web-Link ist f\00FCr diese Instanz nicht aktiviert.')
,p_version_scn=>2617546
,p_caching=>'BY_USER_BY_SESSION'
);
end;
/
prompt --application/shared_components/security/authorizations/flow_data_generator
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(1606732058896590.4103)
,p_name=>'Flow: DATA_GENERATOR'
,p_scheme_type=>'PLUGIN_COM.ORACLE.APEX.DEVELOPER_AUTHORIZATION'
,p_attribute_01=>'DATA_GENERATOR'
,p_error_message=>'Sie sind nicht berechtigt, den Datengenerator in SQL Workshop zu verwenden'
,p_version_scn=>2617546
,p_caching=>'BY_USER_BY_SESSION'
);
end;
/
prompt --application/shared_components/security/authorizations/sso_authentication
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(2000440587529722.4103)
,p_name=>'SSO authentication'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return wwv_flow_authentication_dev.get_internal_authentication not in (''APEX'',''CLOUD_IDM'',''LDAP'',''DB'');'
,p_error_message=>'Builder-SSO ist nicht aktiviert'
,p_version_scn=>75567706
,p_caching=>'BY_USER_BY_SESSION'
);
end;
/
prompt --application/shared_components/security/authorizations/flow_edit
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(2224190594209629.4103)
,p_name=>'Flow: EDIT'
,p_scheme_type=>'PLUGIN_COM.ORACLE.APEX.DEVELOPER_AUTHORIZATION'
,p_attribute_01=>'EDIT'
,p_error_message=>unistr('Sie sind nicht f\00FCr das Bearbeiten von Anwendungen autorisiert:')
,p_version_scn=>2617546
,p_caching=>'BY_USER_BY_SESSION'
);
end;
/
prompt --application/shared_components/security/authorizations/flow_admin
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(2232502732209663.4103)
,p_name=>'Flow: ADMIN'
,p_scheme_type=>'PLUGIN_COM.ORACLE.APEX.DEVELOPER_AUTHORIZATION'
,p_attribute_01=>'ADMIN'
,p_error_message=>unistr('Sie sind nicht f\00FCr das Verwalten von Anwendungen autorisiert:')
,p_version_scn=>2617546
,p_caching=>'BY_USER_BY_SESSION'
);
end;
/
prompt --application/shared_components/security/authorizations/apex_5_0_team_development_enabled
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(2233317028209664.4103)
,p_name=>'APEX 5.0 Team development enabled'
,p_scheme_type=>'NATIVE_EXISTS'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from wwv_flow_companies w, ',
'        wwv_flow_fnd_user u',
'where nvl(w.ALLOW_TEAM_DEVELOPMENT_YN,''Y'') = ''Y'' and ',
'      w.PROVISIONING_COMPANY_ID = :flow_security_group_id and',
'      u.security_group_id = :flow_security_group_id and',
'      u.USER_NAME = upper(:app_user) and',
'      nvl(u.ALLOW_TEAM_DEVELOPMENT_YN,''Y'') = ''Y'''))
,p_error_message=>unistr('Team Development ist f\00FCr diesen Workspace nicht aktiviert')
,p_version_scn=>2617546
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/security/authorizations/flow_sql
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(2611096505029836.4103)
,p_name=>'Flow: SQL'
,p_scheme_type=>'PLUGIN_COM.ORACLE.APEX.DEVELOPER_AUTHORIZATION'
,p_attribute_01=>'SQL'
,p_error_message=>'Sie sind nicht berechtigt, SQL Workshop zu verwenden.'
,p_version_scn=>2617548
,p_caching=>'BY_USER_BY_SESSION'
);
end;
/
prompt --application/shared_components/security/authorizations/extension_links_exist
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(3600276725917337.4103)
,p_name=>'Extension Links Exist'
,p_scheme_type=>'NATIVE_EXISTS'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from wwv_extension_links',
' where security_group_id = :workspace_id',
'union all',
'select 1',
'  from wwv_extension_links el, wwv_extension_grants eg, wwv_flow_companies cp',
' where eg.security_group_id           = :workspace_id',
'   and eg.extension_security_group_id = el.security_group_id',
'   and el.is_public                   = ''Y''',
'   and el.security_group_id           = cp.provisioning_company_id',
'   and cp.is_extension_yn in (''Y'', ''A'')'))
,p_version_scn=>87913674
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
null;
end;
/
prompt --application/shared_components/logic/application_processes/spotlightindex
begin
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(3218774193006818.4103)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'spotlightIndex'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'wwv_flow_spotlight_dev.emit_spotlight_search_index(',
'    p_app_id          => wwv_flow.g_x01,',
'    p_advanced_search => wwv_flow.g_x02);'))
,p_process_clob_language=>'PLSQL'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_version_scn=>36493210
);
end;
/
prompt --application/shared_components/logic/application_items/company
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(1601366600985622.4103)
,p_name=>'COMPANY'
,p_scope=>'GLOBAL'
,p_escape_on_http_output=>'N'
,p_version_scn=>4950514
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
 p_id=>wwv_flow_imp.id(2120234306877780.4103)
,p_tab_set=>'main'
,p_tab_sequence=>1
,p_tab_name=>'One'
,p_tab_text=>'Eins'
,p_tab_target=>'f?p=&APP_ID.:1:&SESSION'
,p_current_on_tabset=>'One'
);
wwv_flow_imp_shared.create_toplevel_tab(
 p_id=>wwv_flow_imp.id(2120359237877780.4103)
,p_tab_set=>'main'
,p_tab_sequence=>2
,p_tab_name=>'Two'
,p_tab_text=>'Zwei'
,p_tab_target=>'f?p=&APP_ID.:10:&SESSION'
,p_current_on_tabset=>'Two'
);
wwv_flow_imp_shared.create_toplevel_tab(
 p_id=>wwv_flow_imp.id(2120443543877780.4103)
,p_tab_set=>'main'
,p_tab_sequence=>3
,p_tab_name=>'Three'
,p_tab_text=>'Drei'
,p_tab_target=>'f?p=&APP_ID.:10:&SESSION'
,p_current_on_tabset=>'Three'
);
wwv_flow_imp_shared.create_toplevel_tab(
 p_id=>wwv_flow_imp.id(2120545101877780.4103)
,p_tab_set=>'main'
,p_tab_sequence=>4
,p_tab_name=>'Four'
,p_tab_text=>'Vier'
,p_tab_target=>'f?p=&APP_ID.:10:&SESSION'
,p_current_on_tabset=>'Four'
);
end;
/
prompt --application/shared_components/user_interface/lovs/p3_timeframe
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(3012084751088963.4103)
,p_lov_name=>'P3_TIMEFRAME'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d, to_char(t) t',
'from (',
'select ''10 ''||wwv_flow_lang.system_message(initcap(''SECONDS'')) d, 10 t from sys.dual union all',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''MINUTE'')) d, 60 t from sys.dual union all',
'select ''5 ''||wwv_flow_lang.system_message(initcap(''MINUTES'')) d, 5*60 t from sys.dual union all',
'select ''15 ''||wwv_flow_lang.system_message(initcap(''MINUTES'')) d, 15*60 t from sys.dual union all',
'select ''30 ''||wwv_flow_lang.system_message(initcap(''MINUTES'')) d, 30*60 t from sys.dual union all',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''HOUR'')) d, 3600 t from sys.dual union all',
'select ''2 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 2*3600  t from sys.dual union all',
'select ''3 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 3*3600  t from sys.dual union all',
'select ''4 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 4*3600  t from sys.dual union all',
'select ''6 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 6*3600 t from sys.dual union all',
'select ''8 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 8*3600 t from sys.dual union all',
'select ''12 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 12*3600 t from sys.dual union all',
'select ''18 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 18*3600 t from sys.dual union all',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''DAY'')) d, 1*24*60*60 t from sys.dual union all',
'select ''2 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, 2*24*60*60 t from sys.dual union all',
'select ''3 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, 3*24*60*60 t from sys.dual union all',
'select ''4 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, 4*24*60*60 t from sys.dual union all',
'select ''5 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, 5*24*60*60 t from sys.dual union all',
'select ''6 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, 6*24*60*60 t from sys.dual union all',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''WEEK'')) d, 7*24*60*60 t  from sys.dual',
') q'))
,p_source_type=>'LEGACY_SQL'
,p_location=>'LOCAL'
,p_version_scn=>75558571
);
end;
/
prompt --application/shared_components/user_interface/lovs/yes_no_returns_y_n
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(3026135455596117.4103)
,p_lov_name=>'YES.NO.RETURNS.Y.N'
,p_lov_query=>'.'||wwv_flow_imp.id(3026135455596117)||'.'
,p_location=>'STATIC'
,p_version_scn=>75558573
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(3026546251596121.4103)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Ja'
,p_lov_return_value=>'Y'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(3026941068596121.4103)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Nein'
,p_lov_return_value=>'N'
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
prompt --application/shared_components/user_interface/templates/page/apex_5_0_dialog
begin
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(123406906725078162.4103)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Dialog.de'
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
 p_id=>wwv_flow_imp.id(1802292231311016.4103)
,p_page_template_id=>wwv_flow_imp.id(123406906725078162.4103)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1802738969311016.4103)
,p_page_template_id=>wwv_flow_imp.id(123406906725078162.4103)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1803232667311016.4103)
,p_page_template_id=>wwv_flow_imp.id(123406906725078162.4103)
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
prompt --application/shared_components/user_interface/templates/page/apex_5_0_right_side_bar
begin
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(389474351319109454.4103)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Right Side Bar.de'
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
 p_id=>wwv_flow_imp.id(1611259698131892.4103)
,p_page_template_id=>wwv_flow_imp.id(389474351319109454.4103)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1611725721131892.4103)
,p_page_template_id=>wwv_flow_imp.id(389474351319109454.4103)
,p_name=>'Page Header (Position 3)'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1612290535131892.4103)
,p_page_template_id=>wwv_flow_imp.id(389474351319109454.4103)
,p_name=>'Page Header (Position 4)'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1612732660131892.4103)
,p_page_template_id=>wwv_flow_imp.id(389474351319109454.4103)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1613214988131893.4103)
,p_page_template_id=>wwv_flow_imp.id(389474351319109454.4103)
,p_name=>'After Body'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1613777858131893.4103)
,p_page_template_id=>wwv_flow_imp.id(389474351319109454.4103)
,p_name=>'Page Header (Position 1)'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1614229176131893.4103)
,p_page_template_id=>wwv_flow_imp.id(389474351319109454.4103)
,p_name=>'Page Header (Position 2)'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1614731065131893.4103)
,p_page_template_id=>wwv_flow_imp.id(389474351319109454.4103)
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
prompt --application/shared_components/user_interface/templates/page/apex_5_0_wizard_dialog
begin
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(691639526441810142.4103)
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
 p_id=>wwv_flow_imp.id(1805260100311015.4103)
,p_page_template_id=>wwv_flow_imp.id(691639526441810142.4103)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1805722909311015.4103)
,p_page_template_id=>wwv_flow_imp.id(691639526441810142.4103)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1806222055311015.4103)
,p_page_template_id=>wwv_flow_imp.id(691639526441810142.4103)
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
prompt --application/shared_components/user_interface/templates/page/apex_5_0_wizard_page
begin
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(705262749447911709.4103)
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
 p_id=>wwv_flow_imp.id(1573939793875402.4103)
,p_page_template_id=>wwv_flow_imp.id(705262749447911709.4103)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1574498382875402.4103)
,p_page_template_id=>wwv_flow_imp.id(705262749447911709.4103)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1574975563875402.4103)
,p_page_template_id=>wwv_flow_imp.id(705262749447911709.4103)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1575408320875402.4103)
,p_page_template_id=>wwv_flow_imp.id(705262749447911709.4103)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1575992253875402.4103)
,p_page_template_id=>wwv_flow_imp.id(705262749447911709.4103)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1576489306875403.4103)
,p_page_template_id=>wwv_flow_imp.id(705262749447911709.4103)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1576918475875403.4103)
,p_page_template_id=>wwv_flow_imp.id(705262749447911709.4103)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1577486896875403.4103)
,p_page_template_id=>wwv_flow_imp.id(705262749447911709.4103)
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
prompt --application/shared_components/user_interface/templates/button/apex_5_0_icon_menu_button
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(2582194691768847.4103)
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
prompt --application/shared_components/user_interface/templates/button/apex_5_0_button
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(177329393740370707.4103)
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
prompt --application/shared_components/user_interface/templates/button/apex_5_0_icon_only_button
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(356399210687168533.4103)
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
prompt --application/shared_components/user_interface/templates/button/apex_5_0_button_with_icon
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(407467631666671465.4103)
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
 p_id=>wwv_flow_imp.id(177327211140356819.4103)
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
 p_id=>wwv_flow_imp.id(3180613577501013.4103)
,p_plug_template_id=>wwv_flow_imp.id(177327211140356819.4103)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3181113419501014.4103)
,p_plug_template_id=>wwv_flow_imp.id(177327211140356819.4103)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3181626149501014.4103)
,p_plug_template_id=>wwv_flow_imp.id(177327211140356819.4103)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3182174665501014.4103)
,p_plug_template_id=>wwv_flow_imp.id(177327211140356819.4103)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3182609277501014.4103)
,p_plug_template_id=>wwv_flow_imp.id(177327211140356819.4103)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3183174058501014.4103)
,p_plug_template_id=>wwv_flow_imp.id(177327211140356819.4103)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3183628103501014.4103)
,p_plug_template_id=>wwv_flow_imp.id(177327211140356819.4103)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3184159871501014.4103)
,p_plug_template_id=>wwv_flow_imp.id(177327211140356819.4103)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3184609861501015.4103)
,p_plug_template_id=>wwv_flow_imp.id(177327211140356819.4103)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3185172586501015.4103)
,p_plug_template_id=>wwv_flow_imp.id(177327211140356819.4103)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3185609802501015.4103)
,p_plug_template_id=>wwv_flow_imp.id(177327211140356819.4103)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3186131484501015.4103)
,p_plug_template_id=>wwv_flow_imp.id(177327211140356819.4103)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3186607361501015.4103)
,p_plug_template_id=>wwv_flow_imp.id(177327211140356819.4103)
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
prompt --application/shared_components/user_interface/templates/region/apex_5_0_region_dialog
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(431176191030605311.4103)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#"  class="a-DialogRegion js-regionDialog #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES# style="display:none" title="#TITLE#">',
'  <div class="a-DialogRegion-body">',
'#BODY#',
'  </div>',
'  <div class="a-DialogRegion-buttons">',
'     <div class="a-ButtonRegion a-ButtonRegion--dialogRegion">',
'       <div class="a-ButtonRegion-wrap">',
'         <div class="a-ButtonRegion-col a-ButtonRegion-col--left"><div class="a-ButtonRegion-buttons">#PREVIOUS##DELETE##CLOSE#</div></div>',
'         <div class="a-ButtonRegion-col a-ButtonRegion-col--right"><div class="a-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'       </div>',
'     </div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'[x] APEX 5.0 - Region Dialog'
,p_internal_name=>'APEX_5.0_REGION_DIALOG'
,p_theme_id=>3
,p_theme_class_id=>21
,p_default_template_options=>'js-draggable:js-resizable:js-modal'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1855331088310993.4103)
,p_plug_template_id=>wwv_flow_imp.id(431176191030605311.4103)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1855879072310993.4103)
,p_plug_template_id=>wwv_flow_imp.id(431176191030605311.4103)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1856351730310993.4103)
,p_plug_template_id=>wwv_flow_imp.id(431176191030605311.4103)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1856818750310993.4103)
,p_plug_template_id=>wwv_flow_imp.id(431176191030605311.4103)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1857397455310993.4103)
,p_plug_template_id=>wwv_flow_imp.id(431176191030605311.4103)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1857867496310992.4103)
,p_plug_template_id=>wwv_flow_imp.id(431176191030605311.4103)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1858369180310992.4103)
,p_plug_template_id=>wwv_flow_imp.id(431176191030605311.4103)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1858844776310992.4103)
,p_plug_template_id=>wwv_flow_imp.id(431176191030605311.4103)
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
 p_id=>wwv_flow_imp.id(689731959698504608.4103)
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
 p_id=>wwv_flow_imp.id(2342114575232392.4103)
,p_plug_template_id=>wwv_flow_imp.id(689731959698504608.4103)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2342635925232392.4103)
,p_plug_template_id=>wwv_flow_imp.id(689731959698504608.4103)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2343101102232392.4103)
,p_plug_template_id=>wwv_flow_imp.id(689731959698504608.4103)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2343698204232392.4103)
,p_plug_template_id=>wwv_flow_imp.id(689731959698504608.4103)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2344168466232392.4103)
,p_plug_template_id=>wwv_flow_imp.id(689731959698504608.4103)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2344663901232392.4103)
,p_plug_template_id=>wwv_flow_imp.id(689731959698504608.4103)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2345146063232393.4103)
,p_plug_template_id=>wwv_flow_imp.id(689731959698504608.4103)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2345608769232393.4103)
,p_plug_template_id=>wwv_flow_imp.id(689731959698504608.4103)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2346107904232393.4103)
,p_plug_template_id=>wwv_flow_imp.id(689731959698504608.4103)
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
 p_id=>wwv_flow_imp.id(705356091066836147.4103)
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
 p_id=>wwv_flow_imp.id(3370958198508598.4103)
,p_plug_template_id=>wwv_flow_imp.id(705356091066836147.4103)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3371492470508598.4103)
,p_plug_template_id=>wwv_flow_imp.id(705356091066836147.4103)
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
 p_id=>wwv_flow_imp.id(719473716690283992.4103)
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
 p_id=>wwv_flow_imp.id(1831423363311006.4103)
,p_plug_template_id=>wwv_flow_imp.id(719473716690283992.4103)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1831977568311005.4103)
,p_plug_template_id=>wwv_flow_imp.id(719473716690283992.4103)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1832447570311005.4103)
,p_plug_template_id=>wwv_flow_imp.id(719473716690283992.4103)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1832925515311005.4103)
,p_plug_template_id=>wwv_flow_imp.id(719473716690283992.4103)
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
 p_id=>wwv_flow_imp.id(748940840395094996.4103)
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
 p_id=>wwv_flow_imp.id(2627160804486641.4103)
,p_plug_template_id=>wwv_flow_imp.id(748940840395094996.4103)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2627605140486641.4103)
,p_plug_template_id=>wwv_flow_imp.id(748940840395094996.4103)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2628132482486641.4103)
,p_plug_template_id=>wwv_flow_imp.id(748940840395094996.4103)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2628615909486641.4103)
,p_plug_template_id=>wwv_flow_imp.id(748940840395094996.4103)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2629137582486641.4103)
,p_plug_template_id=>wwv_flow_imp.id(748940840395094996.4103)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2629674370486641.4103)
,p_plug_template_id=>wwv_flow_imp.id(748940840395094996.4103)
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
prompt --application/shared_components/user_interface/templates/list/apex_5_0_links_list
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(62797997509026315.4103)
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
prompt --application/shared_components/user_interface/templates/list/apex_5_0_image_navigation
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(483868913244428740.4103)
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
prompt --application/shared_components/user_interface/templates/list/apex_5_0_navigation_list
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(576186007498036655.4103)
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
 p_id=>wwv_flow_imp.id(750166499508430361.4103)
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
prompt --application/shared_components/user_interface/templates/report/apex_5_0_links_list
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(19962201430770078.4103)
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
prompt --application/shared_components/user_interface/templates/report/apex_5_0_portlet_column_template
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(45598789574081657.4103)
,p_row_template_name=>'APEX 5.0 - Portlet Column Template'
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
prompt --application/shared_components/user_interface/templates/report/apex_5_0_standard_report
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(126304304235156391.4103)
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
prompt --application/shared_components/user_interface/templates/label/apex_5_0_optional_label
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(490022788869589047.4103)
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
prompt --application/shared_components/user_interface/templates/breadcrumb/done_breadcrumbs
begin
wwv_flow_imp_shared.create_menu_template(
 p_id=>wwv_flow_imp.id(62693790206705397.4103)
,p_name=>'(Done) Breadcrumbs'
,p_internal_name=>'DONE_BREADCRUMBS'
,p_current_page_option=>'<span class="htmldbBreadcrumb">#NAME#</span>'
,p_non_current_page_option=>'<a href="#LINK#" class="htmldbBreadcrumb" title="#NAME#">#NAME#</a>'
,p_between_levels=>'<span class="htmldbBreadcrumbSep"><img alt="" src="#IMAGE_PREFIX#apex/apex_top_sep.gif"></span>'
,p_max_levels=>12
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
 p_id=>wwv_flow_imp.id(19921604347467104.4103)
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
,p_find_button_text=>'Suchen'
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
prompt --application/shared_components/user_interface/templates/calendar/default_calander
begin
wwv_flow_imp_shared.create_calendar_template(
 p_id=>wwv_flow_imp.id(356488392221240483.4103)
,p_cal_template_name=>'Default Calander'
,p_internal_name=>'DEFAULT_CALANDER'
,p_day_of_week_format=>'<th scope="col" width="14%">#IDAY#</th>'
,p_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table> ',
' <tr>',
'   <td> ',
'     <table width="100%" class="htmldbGrayBox" cellspacing="0" cellpadding="0" border="0" summary="layout">',
'       <tr><td align="center" class="htmldbGrayBoxHeader">#IMONTH#</td></td></tr>',
'     </table>',
'   </td>',
' </tr>'))
,p_month_open_format=>'<table summary="#CALENDAR_TITLE# #IMONTH# #YYYY#"  border="0" cellpadding="0" cellspacing="0" class="htmldbRowWithBorders" width="100%"><tr>'
,p_month_close_format=>'</tr></table></table>'
,p_day_title_format=>'<div class="calday">#DD#</div>'
,p_day_open_format=>'<td valign="top" class="calweekday">#TITLE_FORMAT##DATA#'
,p_day_close_format=>'</td>'
,p_today_open_format=>'<td valign="top" class="caltoday" style="background:#c5d5c5">#TITLE_FORMAT##DATA#'
,p_weekend_title_format=>'<div class="calday">#DD#</div>'
,p_weekend_open_format=>'<td valign="top" class="calweekend">#TITLE_FORMAT##DATA#'
,p_weekend_close_format=>'</td>'
,p_nonday_title_format=>'&nbsp;'
,p_nonday_open_format=>'<td class="calnotmonth">'
,p_nonday_close_format=>'</td>'
,p_week_open_format=>'<tr>'
,p_week_close_format=>'</td></tr>'
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
 p_id=>wwv_flow_imp.id(74913758140436872.4103)
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
 p_id=>wwv_flow_imp.id(206603805592668941.4103)
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
 p_id=>wwv_flow_imp.id(558983391492013378.4103)
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
 p_id=>wwv_flow_imp.id(558983737888014296.4103)
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
 p_id=>wwv_flow_imp.id(2331115830942766.4103)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL'
,p_display_name=>'Heading Level'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(43714721750457965.4103)
,p_theme_id=>3
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>1
,p_template_types=>'PAGE'
,p_null_text=>'Default Size'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(43715061334460957.4103)
,p_theme_id=>3
,p_name=>'POSITION'
,p_display_name=>'Position'
,p_display_sequence=>1
,p_template_types=>'PAGE'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(43728767467520495.4103)
,p_theme_id=>3
,p_name=>'POSITION'
,p_display_name=>'Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(43729028014521705.4103)
,p_theme_id=>3
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(691610009132341687.4103)
,p_theme_id=>3
,p_name=>'REGION_STYLE'
,p_display_name=>'Region Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Style'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(691610992308352426.4103)
,p_theme_id=>3
,p_name=>'REGION_PADDING'
,p_display_name=>'Region Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Padding'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(691614934496412684.4103)
,p_theme_id=>3
,p_name=>'REGION_POSITION'
,p_display_name=>'Region Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(691616973788448155.4103)
,p_theme_id=>3
,p_name=>'REGION_OVERFLOW'
,p_display_name=>'Region Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(691619708705485573.4103)
,p_theme_id=>3
,p_name=>'HEIGHT'
,p_display_name=>'Height'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(691620535991491777.4103)
,p_theme_id=>3
,p_name=>'MIN_HEIGHT'
,p_display_name=>'Min Height'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'No Min Height'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(691620827929493147.4103)
,p_theme_id=>3
,p_name=>'MAX_HEIGHT'
,p_display_name=>'Max Height'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'No Max Height'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(691629687688573743.4103)
,p_theme_id=>3
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default Border'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(691629899553589712.4103)
,p_theme_id=>3
,p_name=>'ALTERNATING_TABLE_ROWS'
,p_display_name=>'Alternating Table Rows'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Enable'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(691630283009598174.4103)
,p_theme_id=>3
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Disable'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(691632805063632016.4103)
,p_theme_id=>3
,p_name=>'REPORT_WIDTH'
,p_display_name=>'Report Width'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(691634866703732289.4103)
,p_theme_id=>3
,p_name=>'BADGE_LAYOUT'
,p_display_name=>'Badge Layout'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(691635167633733230.4103)
,p_theme_id=>3
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(692166612263600144.4103)
,p_theme_id=>3
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Not Part of Button Set'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(692167000894602128.4103)
,p_theme_id=>3
,p_name=>'BUTTON_SIZE'
,p_display_name=>'Button Size'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Button Size'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(692167571247604773.4103)
,p_theme_id=>3
,p_name=>'BUTTON_TYPE'
,p_display_name=>'Button Type'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(692167828637612722.4103)
,p_theme_id=>3
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing left'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Left Spacing'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(692168169601613874.4103)
,p_theme_id=>3
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Right Spacing'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(692541160455046908.4103)
,p_theme_id=>3
,p_name=>'DISPLAY'
,p_display_name=>'Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(695298623325664539.4103)
,p_theme_id=>3
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(699194246855963220.4103)
,p_theme_id=>3
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(699801854632577609.4103)
,p_theme_id=>3
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default - No Icons'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(705257415511784923.4103)
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
 p_id=>wwv_flow_imp.id(705257788687787397.4103)
,p_theme_id=>3
,p_name=>'FORM_LABEL_WIDTH'
,p_display_name=>'Form Label Width'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(705258067077791834.4103)
,p_theme_id=>3
,p_name=>'FORM_LABEL_POSITION'
,p_display_name=>'Form Label Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(705259938635865472.4103)
,p_theme_id=>3
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>1
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(705260442622868445.4103)
,p_theme_id=>3
,p_name=>'TEXT_ALIGNMENT'
,p_display_name=>'Text Alignment'
,p_display_sequence=>1
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(748946183635152772.4103)
,p_theme_id=>3
,p_name=>'ALERT_TYPE'
,p_display_name=>'Alert Type'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(973241007478085524.4103)
,p_theme_id=>3
,p_name=>'FORM_ITEM_ALIGNMENT'
,p_display_name=>'Form Item Alignment'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'This option controls how form items are aligned.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(1144032929399219984.4103)
,p_theme_id=>3
,p_name=>'DIALOG_SIZE'
,p_display_name=>'Dialog Size'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Predefined dialog sizes'
,p_null_text=>'Default Size'
,p_is_advanced=>'N'
);
end;
/
prompt --application/shared_components/user_interface/template_options
begin
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2331409322953323.4103)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H1'
,p_display_name=>'H1'
,p_display_sequence=>10
,p_css_classes=>'js-headingLevel-1'
,p_group_id=>wwv_flow_imp.id(2331115830942766.4103)
,p_template_types=>'REGION'
,p_help_text=>'H1'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2331780264953323.4103)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H2'
,p_display_name=>'H2'
,p_display_sequence=>20
,p_css_classes=>'js-headingLevel-2'
,p_group_id=>wwv_flow_imp.id(2331115830942766.4103)
,p_template_types=>'REGION'
,p_help_text=>'H2'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2332111475953323.4103)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H3'
,p_display_name=>'H3'
,p_display_sequence=>30
,p_css_classes=>'js-headingLevel-3'
,p_group_id=>wwv_flow_imp.id(2331115830942766.4103)
,p_template_types=>'REGION'
,p_help_text=>'H3'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2332514641953323.4103)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H4'
,p_display_name=>'H4'
,p_display_sequence=>40
,p_css_classes=>'js-headingLevel-4'
,p_group_id=>wwv_flow_imp.id(2331115830942766.4103)
,p_template_types=>'REGION'
,p_help_text=>'H4'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2332971622953323.4103)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H5'
,p_display_name=>'H5'
,p_display_sequence=>50
,p_css_classes=>'js-headingLevel-5'
,p_group_id=>wwv_flow_imp.id(2331115830942766.4103)
,p_template_types=>'REGION'
,p_help_text=>'H5'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2333391540953323.4103)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H6'
,p_display_name=>'H6'
,p_display_sequence=>60
,p_css_classes=>'js-headingLevel-6'
,p_group_id=>wwv_flow_imp.id(2331115830942766.4103)
,p_template_types=>'REGION'
,p_help_text=>'H6'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(691608851221337889.4103)
,p_theme_id=>3
,p_name=>'REGIONCONTAINSITEMSTEXT'
,p_display_name=>'Region Contains Items / Text'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(689731959698504608.4103)
,p_css_classes=>'a-ButtonRegion--withItems'
,p_template_types=>'REGION'
,p_help_text=>'Check this option if this region contains items or text.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(691610454539345839.4103)
,p_theme_id=>3
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(689731959698504608.4103)
,p_css_classes=>'a-ButtonRegion--noUI'
,p_group_id=>wwv_flow_imp.id(691610009132341687.4103)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(691610726982348768.4103)
,p_theme_id=>3
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(689731959698504608.4103)
,p_css_classes=>'a-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_imp.id(691610009132341687.4103)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(691611804103356909.4103)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(689731959698504608.4103)
,p_css_classes=>'a-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_imp.id(691610992308352426.4103)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(691612599896358434.4103)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(689731959698504608.4103)
,p_css_classes=>'a-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_imp.id(691610992308352426.4103)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(691612949932361868.4103)
,p_theme_id=>3
,p_name=>'WIZARDDIALOG'
,p_display_name=>'Used for Wizard Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(689731959698504608.4103)
,p_css_classes=>'a-ButtonRegion--wizard'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(691613980489402455.4103)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(177327211140356819.4103)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_imp.id(691610992308352426.4103)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(691614593048408669.4103)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(177327211140356819.4103)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_imp.id(691610992308352426.4103)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(691615602198416769.4103)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(177327211140356819.4103)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_imp.id(691614934496412684.4103)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(691615855398424614.4103)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(177327211140356819.4103)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(691610009132341687.4103)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(691617156639451379.4103)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(177327211140356819.4103)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_imp.id(691616973788448155.4103)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(691617330946458221.4103)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(177327211140356819.4103)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_imp.id(691616973788448155.4103)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(691624039714518094.4103)
,p_theme_id=>3
,p_name=>'180PX'
,p_display_name=>'180px'
,p_display_sequence=>10
,p_css_classes=>'h180'
,p_group_id=>wwv_flow_imp.id(691619708705485573.4103)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(691624271615518898.4103)
,p_theme_id=>3
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>20
,p_css_classes=>'h240'
,p_group_id=>wwv_flow_imp.id(691619708705485573.4103)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(691624442879519682.4103)
,p_theme_id=>3
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>30
,p_css_classes=>'h320'
,p_group_id=>wwv_flow_imp.id(691619708705485573.4103)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(691625258734526314.4103)
,p_theme_id=>3
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>50
,p_css_classes=>'h480'
,p_group_id=>wwv_flow_imp.id(691619708705485573.4103)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(691625404573527240.4103)
,p_theme_id=>3
,p_name=>'540PX'
,p_display_name=>'540px'
,p_display_sequence=>60
,p_css_classes=>'h540'
,p_group_id=>wwv_flow_imp.id(691619708705485573.4103)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(691625648264528093.4103)
,p_theme_id=>3
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>70
,p_css_classes=>'h640'
,p_group_id=>wwv_flow_imp.id(691619708705485573.4103)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(691630735559611921.4103)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(126304304235156391.4103)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(691629899553589712.4103)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(691630958176614505.4103)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(126304304235156391.4103)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(691630283009598174.4103)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(691631092229617685.4103)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(126304304235156391.4103)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(691629687688573743.4103)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(691631346547619111.4103)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(126304304235156391.4103)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(691629687688573743.4103)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(691631508974620465.4103)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(126304304235156391.4103)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(691629687688573743.4103)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(691631820026625155.4103)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(126304304235156391.4103)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(691633179518635720.4103)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(126304304235156391.4103)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_imp.id(691632805063632016.4103)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(692381362484194510.4103)
,p_theme_id=>3
,p_name=>'FIRSTBUTTON'
,p_display_name=>'First Button'
,p_display_sequence=>1
,p_css_classes=>'a-Button--pillStart'
,p_group_id=>wwv_flow_imp.id(692166612263600144.4103)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(692381524691195682.4103)
,p_theme_id=>3
,p_name=>'INNERBUTTON'
,p_display_name=>'Inner Button'
,p_display_sequence=>2
,p_css_classes=>'a-Button--pill'
,p_group_id=>wwv_flow_imp.id(692166612263600144.4103)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(692381790962197051.4103)
,p_theme_id=>3
,p_name=>'LASTBUTTON'
,p_display_name=>'Last Button'
,p_display_sequence=>3
,p_css_classes=>'a-Button--pillEnd'
,p_group_id=>wwv_flow_imp.id(692166612263600144.4103)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(692382206620198280.4103)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>3
,p_css_classes=>'a-Button--large'
,p_group_id=>wwv_flow_imp.id(692167000894602128.4103)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(692382487369199773.4103)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--small'
,p_group_id=>wwv_flow_imp.id(692167000894602128.4103)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(692382740539201226.4103)
,p_theme_id=>3
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>1
,p_css_classes=>'a-Button--primary'
,p_group_id=>wwv_flow_imp.id(692167571247604773.4103)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(692383241675208198.4103)
,p_theme_id=>3
,p_name=>'SMALLLEFT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padLeft'
,p_group_id=>wwv_flow_imp.id(692167828637612722.4103)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(692383426308209580.4103)
,p_theme_id=>3
,p_name=>'LARGELEFT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapLeft'
,p_group_id=>wwv_flow_imp.id(692167828637612722.4103)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(692383661650210808.4103)
,p_theme_id=>3
,p_name=>'SMALLRIGHT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padRight'
,p_group_id=>wwv_flow_imp.id(692168169601613874.4103)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(692383832606212043.4103)
,p_theme_id=>3
,p_name=>'LARGERIGHT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapRight'
,p_group_id=>wwv_flow_imp.id(692168169601613874.4103)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(692384041509216663.4103)
,p_theme_id=>3
,p_name=>'STRONGBUTTONLABEL'
,p_display_name=>'Strong Button Label'
,p_display_sequence=>1
,p_css_classes=>'a-Button--strongLabel'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(696142711566578093.4103)
,p_theme_id=>3
,p_name=>'DEFAULTPADDING'
,p_display_name=>'Default Padding'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(177327211140356819.4103)
,p_css_classes=>'a-Region--paddedBody'
,p_group_id=>wwv_flow_imp.id(691610992308352426.4103)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(699195070516973851.4103)
,p_theme_id=>3
,p_name=>'VISIBLE'
,p_display_name=>'Visible'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(689731959698504608.4103)
,p_css_classes=>'a-ButtonRegion--showTitle'
,p_group_id=>wwv_flow_imp.id(699194246855963220.4103)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(699357621055593644.4103)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(689731959698504608.4103)
,p_css_classes=>'a-ButtonRegion--accessibleTitle'
,p_group_id=>wwv_flow_imp.id(699194246855963220.4103)
,p_template_types=>'REGION'
,p_help_text=>'Use this option to add a visually hidden heading which is accessible for screen readers, but otherwise not visible to users.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(699626763905279667.4103)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(177327211140356819.4103)
,p_css_classes=>'a-Region--accessibleHeader'
,p_group_id=>wwv_flow_imp.id(699194246855963220.4103)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(699626966036282201.4103)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(177327211140356819.4103)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(699194246855963220.4103)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(699802068476581269.4103)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(62797997509026315.4103)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(699802407718583122.4103)
,p_theme_id=>3
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(62797997509026315.4103)
,p_css_classes=>'a-LinksList--showBadge'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(699802972727584497.4103)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(62797997509026315.4103)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(699803979532586784.4103)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(62797997509026315.4103)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(699804114369588930.4103)
,p_theme_id=>3
,p_name=>'FORTOPLEVELONLY'
,p_display_name=>'For top level only'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(62797997509026315.4103)
,p_css_classes=>'a-LinksList--showTopIcons'
,p_group_id=>wwv_flow_imp.id(699801854632577609.4103)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(699804349283590370.4103)
,p_theme_id=>3
,p_name=>'FORALLITEMS'
,p_display_name=>'For all items'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(62797997509026315.4103)
,p_css_classes=>'a-LinksList--showIcons'
,p_group_id=>wwv_flow_imp.id(699801854632577609.4103)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(699929437455355707.4103)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(19962201430770078.4103)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(699929674377357548.4103)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(19962201430770078.4103)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(699929867457360285.4103)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(19962201430770078.4103)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(701377614177264047.4103)
,p_theme_id=>3
,p_name=>'REGIONHEADERBUTTON'
,p_display_name=>'Button in Region Header'
,p_display_sequence=>1
,p_css_classes=>'a-Button--regionHeader'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(701504954354104541.4103)
,p_theme_id=>3
,p_name=>'STRETCHFORMFIELD'
,p_display_name=>'Stretch Form Field'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--stretch'
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(705258498509815758.4103)
,p_theme_id=>3
,p_name=>'ALIGNLABELSLEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Form--leftLabels'
,p_group_id=>wwv_flow_imp.id(705257415511784923.4103)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(705258728607823091.4103)
,p_theme_id=>3
,p_name=>'LABELSABOVE'
,p_display_name=>'Labels Above'
,p_display_sequence=>1
,p_css_classes=>'a-Form--labelsAbove'
,p_group_id=>wwv_flow_imp.id(705258067077791834.4103)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(705258984972828407.4103)
,p_theme_id=>3
,p_name=>'FIXEDWIDTH'
,p_display_name=>'Fixed'
,p_display_sequence=>10
,p_css_classes=>'a-Form--fixedLabels'
,p_group_id=>wwv_flow_imp.id(705257788687787397.4103)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(705259180947833097.4103)
,p_theme_id=>3
,p_name=>'FIXEDMEDIUM'
,p_display_name=>'Fixed (Medium Width)'
,p_display_sequence=>20
,p_css_classes=>'a-Form-fixedLabelsMed'
,p_group_id=>wwv_flow_imp.id(705257788687787397.4103)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(705259337581834791.4103)
,p_theme_id=>3
,p_name=>'FIXEDLARGE'
,p_display_name=>'Fixed (Large Width)'
,p_display_sequence=>30
,p_css_classes=>'a-Form-fixedLabelsLarge'
,p_group_id=>wwv_flow_imp.id(705257788687787397.4103)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(705259659387844782.4103)
,p_theme_id=>3
,p_name=>'AUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form--autoWidthLabels'
,p_group_id=>wwv_flow_imp.id(705257788687787397.4103)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(705261079402877880.4103)
,p_theme_id=>3
,p_name=>'LABELAUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--autoLabelWidth'
,p_group_id=>wwv_flow_imp.id(705259938635865472.4103)
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(748943467101110290.4103)
,p_theme_id=>3
,p_name=>'REMOVE_ICON'
,p_display_name=>'Remove Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(748940840395094996.4103)
,p_css_classes=>'a-Alert--noIcon'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(748943499375112133.4103)
,p_theme_id=>3
,p_name=>'USE_COLORED_BACKGROUND'
,p_display_name=>'Use Colored Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(748940840395094996.4103)
,p_css_classes=>'a-Alert--colorBG'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(748943683837113689.4103)
,p_theme_id=>3
,p_name=>'USE_DEFAULT_ICONS'
,p_display_name=>'Use Default Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(748940840395094996.4103)
,p_css_classes=>'a-Alert--defaultIcons'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(748947363084163363.4103)
,p_theme_id=>3
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(748940840395094996.4103)
,p_css_classes=>'a-Alert--warning'
,p_group_id=>wwv_flow_imp.id(748946183635152772.4103)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(748947628094165279.4103)
,p_theme_id=>3
,p_name=>'ERROR'
,p_display_name=>'Error'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(748940840395094996.4103)
,p_css_classes=>'a-Alert--danger'
,p_group_id=>wwv_flow_imp.id(748946183635152772.4103)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(748947933370166382.4103)
,p_theme_id=>3
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(748940840395094996.4103)
,p_css_classes=>'a-Alert--success'
,p_group_id=>wwv_flow_imp.id(748946183635152772.4103)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(748948074977167724.4103)
,p_theme_id=>3
,p_name=>'INFORMATIONAL'
,p_display_name=>'Informational'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(748940840395094996.4103)
,p_css_classes=>'a-Alert--info'
,p_group_id=>wwv_flow_imp.id(748946183635152772.4103)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(748949147694178185.4103)
,p_theme_id=>3
,p_name=>'HORIZONTAL'
,p_display_name=>'Horizontal'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(748940840395094996.4103)
,p_css_classes=>'a-Alert--horizontal'
,p_group_id=>wwv_flow_imp.id(692541160455046908.4103)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(748949259689179148.4103)
,p_theme_id=>3
,p_name=>'WIZARD'
,p_display_name=>'Wizard'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(748940840395094996.4103)
,p_css_classes=>'a-Alert--wizard'
,p_group_id=>wwv_flow_imp.id(692541160455046908.4103)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(753358265381424737.4103)
,p_theme_id=>3
,p_name=>'REMOVE_TOP_BORDER'
,p_display_name=>'Remove Top Border'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(177327211140356819.4103)
,p_css_classes=>'a-Region--noTopBorder'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(761297057995689749.4103)
,p_theme_id=>3
,p_name=>'LEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_button_template_id=>wwv_flow_imp.id(407467631666671465.4103)
,p_css_classes=>'a-Button--iconLeft'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(928101457292899068.4103)
,p_theme_id=>3
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(750166499508430361.4103)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(928101585277900103.4103)
,p_theme_id=>3
,p_name=>'ADD_SLIDE_ANIMATION'
,p_display_name=>'Add Slide Animation'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(750166499508430361.4103)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(973251040702199002.4103)
,p_theme_id=>3
,p_name=>'FLOAT_ITEMS_LEFT'
,p_display_name=>'Float Items Left'
,p_display_sequence=>1
,p_css_classes=>'a-Form--floatFieldsLeft'
,p_group_id=>wwv_flow_imp.id(973241007478085524.4103)
,p_template_types=>'REGION'
,p_help_text=>'Use this option to float fields within a region to the left. The width of the field container will be calculated automatically. This option will allow you to position a button or other items immediately after other items.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(973251321881205391.4103)
,p_theme_id=>3
,p_name=>'FLOAT_COLUMNS_LEFT'
,p_display_name=>'Float Columns Left'
,p_display_sequence=>1
,p_css_classes=>'a-Form--floatColsLeft'
,p_group_id=>wwv_flow_imp.id(973241007478085524.4103)
,p_template_types=>'REGION'
,p_help_text=>'Use this option to align grid columns within the region to the left. This option will allow you to align multiple columns of items next to each other.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(976279658598162905.4103)
,p_theme_id=>3
,p_name=>'INLINE_FIELD'
,p_display_name=>'Inline Field'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--floatLeft'
,p_template_types=>'FIELD'
,p_help_text=>'Makes the field container for this item appear inline, so buttons or other objects immediately after show up on same line.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1069063365685659519.4103)
,p_theme_id=>3
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(177327211140356819.4103)
,p_css_classes=>'a-Region--simple'
,p_group_id=>wwv_flow_imp.id(691610009132341687.4103)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1140386536161755172.4103)
,p_theme_id=>3
,p_name=>'RESIZABLE'
,p_display_name=>'Resizable'
,p_display_sequence=>2
,p_region_template_id=>wwv_flow_imp.id(431176191030605311.4103)
,p_css_classes=>'js-resizable'
,p_template_types=>'REGION'
,p_help_text=>'Allow dialog to be resized.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1140392434476761157.4103)
,p_theme_id=>3
,p_name=>'DRAGGABLE'
,p_display_name=>'Draggable'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(431176191030605311.4103)
,p_css_classes=>'js-draggable'
,p_template_types=>'REGION'
,p_help_text=>'Allow dialog to be moved.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1144033764467234743.4103)
,p_theme_id=>3
,p_name=>'SMALL_480X320'
,p_display_name=>'Small (480x320)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(431176191030605311.4103)
,p_css_classes=>'js-dialog-size480x320'
,p_group_id=>wwv_flow_imp.id(1144032929399219984.4103)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1144034175264237920.4103)
,p_theme_id=>3
,p_name=>'LARGE_720X480'
,p_display_name=>'Large (720x480)'
,p_display_sequence=>3
,p_region_template_id=>wwv_flow_imp.id(431176191030605311.4103)
,p_css_classes=>'js-dialog-size720x480'
,p_group_id=>wwv_flow_imp.id(1144032929399219984.4103)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1144037051374282290.4103)
,p_theme_id=>3
,p_name=>'MODAL'
,p_display_name=>'Modal'
,p_display_sequence=>3
,p_region_template_id=>wwv_flow_imp.id(431176191030605311.4103)
,p_css_classes=>'js-modal'
,p_template_types=>'REGION'
,p_help_text=>'Display as modal.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1144813515822739415.4103)
,p_theme_id=>3
,p_name=>'MEDIUM_600X400'
,p_display_name=>'Medium (600x400)'
,p_display_sequence=>2
,p_region_template_id=>wwv_flow_imp.id(431176191030605311.4103)
,p_css_classes=>'js-dialog-size600x400'
,p_group_id=>wwv_flow_imp.id(1144032929399219984.4103)
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
 p_id=>wwv_flow_imp.id(3475503069093017.4103)
,p_build_option_name=>'Enable APEX Internal Feedback'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>9260112
,p_default_on_export=>'EXCLUDE'
);
end;
/
prompt --application/shared_components/globalization/messages
begin
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(121662256128670146)
,p_name=>'LEARN_MORE_APEX_HOME'
,p_message_language=>'de'
,p_message_text=>'Weitere Informationen zu Oracle APEX'
,p_version_scn=>2566594
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(121662330167670146)
,p_name=>'LEARN_MORE_APEX_HOME_ADB'
,p_message_language=>'de'
,p_message_text=>'Weitere Informationen zu Oracle APEX auf Autonomous Database'
,p_version_scn=>2566594
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(121661903437670146)
,p_name=>'P1_NO_WS_MESSAGE'
,p_message_language=>'de'
,p_message_text=>'Keine Workspace-Nachricht'
,p_version_scn=>2566593
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(121662041233670146)
,p_name=>'P1_RESULT_CACHE_MODE'
,p_message_language=>'de'
,p_message_text=>unistr('In dieser Datenbank ist der Parameter <code>result_cache_mode</code> auf <code>%0</code> gesetzt. Wenn Ihre Apps Abfragen ausf\00FChren, die nicht deterministische PL/SQL-Funktionen ausf\00FChren, wie <code>v()</code> oder <code>APEX_PAGE.get_url()</code>, w')
||unistr('erden m\00F6glicherweise gecachte Abfrageergebnisse f\00FCr alle Endbenutzer zur\00FCckgegeben. Wenn dieses Verhalten nicht gew\00FCnscht wird, erw\00E4gen Sie eine \00C4nderung dieses Datenbankparameters. Weitere Informationen finden Sie in der <a href="%1" target="_blank"')
||' rel="noreferrer">Dokumentation zu Oracle Database</a>.'
,p_version_scn=>2566593
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(121662198156670146)
,p_name=>'P1_RESULT_CACHE_MODE_SHORT'
,p_message_language=>'de'
,p_message_text=>'Die Einstellung <code>result_cache_mode</code> dieser Datenbank kann sich auf das Anwendungsverhalten auswirken. <a href="%0" id="result_cache_learn_link">Weitere Informationen</a>.'
,p_version_scn=>2566594
);
end;
/
prompt --application/shared_components/globalization/dyntranslations
begin
null;
end;
/
prompt --application/shared_components/security/authentications/internal_authentication
begin
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(1477739433453980.4103)
,p_name=>'Internal Authentication'
,p_scheme_type=>'PLUGIN_COM.ORACLE.APEX.AUTHN.INTERNAL.APEX'
,p_invalid_session_type=>'LOGIN'
,p_logout_url=>'f?p=4550:8:&SESSION.'
,p_cookie_name=>'ORA_WWV_USER_&INSTANCE_ID.'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_version_scn=>2617545
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_apex
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(1477230449450263.4103)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.APEX'
,p_display_name=>'INTERNAL - Oracle APEX-Accounts'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.APEX'),'')
,p_api_version=>1
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_apex'
,p_standard_attributes=>'INVALID_SESSION:LOGIN_PAGE'
,p_substitute_attributes=>true
,p_version_scn=>2617544
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_db
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(1889518129864667.4103)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.DB'
,p_display_name=>'INTERNAL - Datenbankaccounts'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.DB'),'')
,p_api_version=>1
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_db'
,p_standard_attributes=>'LOGIN_PAGE'
,p_substitute_attributes=>true
,p_version_scn=>2617544
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_header
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(1890025788864657.4103)
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
,p_version_scn=>2617544
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1890432358864657.4103)
,p_plugin_id=>wwv_flow_imp.id(1890025788864657.4103)
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
 p_id=>wwv_flow_imp.id(1890812090864656.4103)
,p_plugin_id=>wwv_flow_imp.id(1890025788864657.4103)
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
 p_id=>wwv_flow_imp.id(1891258021864656.4103)
,p_plugin_attribute_id=>wwv_flow_imp.id(1890812090864656.4103)
,p_display_sequence=>10
,p_display_value=>'Redirect to Built-In URL'
,p_return_value=>'BUILTIN_URL'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1891717534864656.4103)
,p_plugin_attribute_id=>wwv_flow_imp.id(1890812090864656.4103)
,p_display_sequence=>20
,p_display_value=>'Redirect to URL'
,p_return_value=>'URL'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1892269154864655.4103)
,p_plugin_attribute_id=>wwv_flow_imp.id(1890812090864656.4103)
,p_display_sequence=>30
,p_display_value=>'Display Error'
,p_return_value=>'ERROR'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1892768324864655.4103)
,p_plugin_id=>wwv_flow_imp.id(1890025788864657.4103)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'URL'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>60
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(1890812090864656.4103)
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
 p_id=>wwv_flow_imp.id(1893190016864655.4103)
,p_plugin_id=>wwv_flow_imp.id(1890025788864657.4103)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Error Message'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>true
,p_display_length=>60
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_imp.id(1890812090864656.4103)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'ERROR'
,p_help_text=>'Specifies the error message to be displayed if the HTTP header variable does not contain a value or the HTTP header variable does not exist.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1893593897864655.4103)
,p_plugin_id=>wwv_flow_imp.id(1890025788864657.4103)
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
 p_id=>wwv_flow_imp.id(1893974205864655.4103)
,p_plugin_attribute_id=>wwv_flow_imp.id(1893593897864655.4103)
,p_display_sequence=>10
,p_display_value=>'Each Request'
,p_return_value=>'ALWAYS'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1894485900864654.4103)
,p_plugin_attribute_id=>wwv_flow_imp.id(1893593897864655.4103)
,p_display_sequence=>20
,p_display_value=>'After Login'
,p_return_value=>'CALLBACK'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1894912481864654.4103)
,p_plugin_id=>wwv_flow_imp.id(1890025788864657.4103)
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
 p_id=>wwv_flow_imp.id(1896143759864653.4103)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.LDAP'
,p_display_name=>'INTERNAL - LDAP-Verzeichnis'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.LDAP'),'')
,p_default_escape_mode=>'HTML'
,p_api_version=>1
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_ldap'
,p_standard_attributes=>'INVALID_SESSION:LOGIN_PAGE'
,p_substitute_attributes=>true
,p_version_scn=>2617544
,p_subscribe_plugin_settings=>true
,p_help_text=>unistr('<p>Geben Sie den Benutzernamen und das Kennwort f\00FCr die Authentifizierung beim LDAP-Verzeichnis ein, das auf der Anmeldeseite angegeben wird. Beachten Sie, dass bei der Kennworteingabe m\00F6glicherweise zwischen Gro\00DF- und Kleinschreibung unterschieden w')
||'ird.</p>'
,p_version_identifier=>'1.0'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1896575338864653.4103)
,p_plugin_id=>wwv_flow_imp.id(1896143759864653.4103)
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
 p_id=>wwv_flow_imp.id(1896903444864652.4103)
,p_plugin_id=>wwv_flow_imp.id(1896143759864653.4103)
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
 p_id=>wwv_flow_imp.id(1897383756864652.4103)
,p_plugin_id=>wwv_flow_imp.id(1896143759864653.4103)
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
 p_id=>wwv_flow_imp.id(1897758536864652.4103)
,p_plugin_attribute_id=>wwv_flow_imp.id(1897383756864652.4103)
,p_display_sequence=>10
,p_display_value=>'SSL'
,p_return_value=>'SSL'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1898207168864652.4103)
,p_plugin_attribute_id=>wwv_flow_imp.id(1897383756864652.4103)
,p_display_sequence=>20
,p_display_value=>'SSL with Authentication'
,p_return_value=>'SSL_AUTH'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1898703720864652.4103)
,p_plugin_attribute_id=>wwv_flow_imp.id(1897383756864652.4103)
,p_display_sequence=>30
,p_display_value=>'No SSL'
,p_return_value=>'NO_SSL'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1899295016864652.4103)
,p_plugin_id=>wwv_flow_imp.id(1896143759864653.4103)
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
 p_id=>wwv_flow_imp.id(1899670484864652.4103)
,p_plugin_id=>wwv_flow_imp.id(1896143759864653.4103)
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
 p_id=>wwv_flow_imp.id(1900044163864652.4103)
,p_plugin_id=>wwv_flow_imp.id(1896143759864653.4103)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Search Filter'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>40
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(1899670484864652.4103)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'N'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Enter the search filter when not using an exact distinguished name (DN). Use <strong>%LDAP_USER%</strong> as a place-holder for the username. For example:',
'</p>',
'<p><pre>cn=%LDAP_USER%</pre></p>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1900436460864651.4103)
,p_plugin_id=>wwv_flow_imp.id(1896143759864653.4103)
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
 p_id=>wwv_flow_imp.id(1900854612864651.4103)
,p_plugin_id=>wwv_flow_imp.id(1896143759864653.4103)
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
'<p>Before replacing <strong>%LDAP_USER%</strong> in the LDAP distinguished name and search string,',
'&PRODUCT_NAME. can automatically escape special characters in the username.',
'</p><p>',
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
'</ul></p>'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1901224819864651.4103)
,p_plugin_attribute_id=>wwv_flow_imp.id(1900854612864651.4103)
,p_display_sequence=>10
,p_display_value=>'Standard'
,p_return_value=>'STD'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1901709439864651.4103)
,p_plugin_attribute_id=>wwv_flow_imp.id(1900854612864651.4103)
,p_display_sequence=>20
,p_display_value=>'Only special characters'
,p_return_value=>'ONLY'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1902262866864651.4103)
,p_plugin_attribute_id=>wwv_flow_imp.id(1900854612864651.4103)
,p_display_sequence=>30
,p_display_value=>'No Escaping'
,p_return_value=>'NO'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_sso
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(1903249764864650.4103)
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
,p_version_scn=>2617544
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_cloud_idm
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(1903814493864649.4103)
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
,p_version_scn=>2617544
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_saml
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(1904438596864649.4103)
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
,p_version_scn=>2617544
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_social
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(1905040324864648.4103)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.SOCIAL'
,p_display_name=>'INTERNAL - Social Sign-In'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.SOCIAL'),'')
,p_default_escape_mode=>'HTML'
,p_api_version=>2
,p_ajax_function=>'wwv_flow_authentication_dev.plugin_callback_social'
,p_session_sentry_function=>'wwv_flow_authentication_dev.plugin_sentry_social'
,p_invalid_session_function=>'wwv_flow_authentication_dev.plugin_invalid_session_social'
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_social'
,p_post_logout_function=>'wwv_flow_authentication_dev.plugin_post_logout_social'
,p_substitute_attributes=>true
,p_version_scn=>2617544
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1905420116864648.4103)
,p_plugin_id=>wwv_flow_imp.id(1905040324864648.4103)
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
 p_id=>wwv_flow_imp.id(1905880543864648.4103)
,p_plugin_attribute_id=>wwv_flow_imp.id(1905420116864648.4103)
,p_display_sequence=>10
,p_display_value=>'OpenID Connect Provider'
,p_return_value=>'OPENID_CONNECT'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1906315580864648.4103)
,p_plugin_attribute_id=>wwv_flow_imp.id(1905420116864648.4103)
,p_display_sequence=>20
,p_display_value=>'Generic OAuth2 Provider'
,p_return_value=>'OAUTH2'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1906830768864648.4103)
,p_plugin_attribute_id=>wwv_flow_imp.id(1905420116864648.4103)
,p_display_sequence=>30
,p_display_value=>'Google'
,p_return_value=>'GOOGLE'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1907357037864648.4103)
,p_plugin_attribute_id=>wwv_flow_imp.id(1905420116864648.4103)
,p_display_sequence=>40
,p_display_value=>'Facebook'
,p_return_value=>'FACEBOOK'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1907814075864647.4103)
,p_plugin_id=>wwv_flow_imp.id(1905040324864648.4103)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Discovery URL'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(1905420116864648.4103)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'OPENID_CONNECT'
,p_examples=>'https://accounts.example.com/.well-known/openid-configuration'
,p_help_text=>'Enter the OpenID Connect provider''s discovery URL.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1908200442864647.4103)
,p_plugin_id=>wwv_flow_imp.id(1905040324864648.4103)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Authorization Endpoint URL'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(1905420116864648.4103)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'OAUTH2'
,p_help_text=>'Enter the OAuth2 provider''s authorization endpoint URL.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1908608358864647.4103)
,p_plugin_id=>wwv_flow_imp.id(1905040324864648.4103)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Token Endpoint URL'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(1905420116864648.4103)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'OAUTH2'
,p_help_text=>'Enter the OAuth2 provider''s token endpoint URL.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1909025339864647.4103)
,p_plugin_id=>wwv_flow_imp.id(1905040324864648.4103)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'User Info Endpoint URL'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(1905420116864648.4103)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'OAUTH2'
,p_help_text=>'Enter the OAuth2 provider''s user info endpoint URL.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1909474775864647.4103)
,p_plugin_id=>wwv_flow_imp.id(1905040324864648.4103)
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
 p_id=>wwv_flow_imp.id(1909874923864647.4103)
,p_plugin_id=>wwv_flow_imp.id(1905040324864648.4103)
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
 p_id=>wwv_flow_imp.id(1910206099864647.4103)
,p_plugin_id=>wwv_flow_imp.id(1905040324864648.4103)
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
 p_id=>wwv_flow_imp.id(1910626896864647.4103)
,p_plugin_id=>wwv_flow_imp.id(1905040324864648.4103)
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
 p_id=>wwv_flow_imp.id(1911053478864646.4103)
,p_plugin_id=>wwv_flow_imp.id(1905040324864648.4103)
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
 p_id=>wwv_flow_imp.id(1911463347864646.4103)
,p_plugin_id=>wwv_flow_imp.id(1905040324864648.4103)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>65
,p_prompt=>'Token Authentication Method'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'BASIC_AND_CLID'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(1905420116864648.4103)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'OAUTH2'
,p_lov_type=>'STATIC'
,p_help_text=>'Enter how the credential''s client ID and client secret should be passed to the server.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1911829961864646.4103)
,p_plugin_attribute_id=>wwv_flow_imp.id(1911463347864646.4103)
,p_display_sequence=>10
,p_display_value=>'Basic Authentication'
,p_return_value=>'BASIC'
,p_help_text=>'Send client id and client secret in a Basic Authentication header.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1912335157864646.4103)
,p_plugin_attribute_id=>wwv_flow_imp.id(1911463347864646.4103)
,p_display_sequence=>20
,p_display_value=>'Basic Authentication and Client ID in Body'
,p_return_value=>'BASIC_AND_CLID'
,p_help_text=>'Send client id and client secret in a Basic Authentication header, but also send client it in the request body.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1912891054864646.4103)
,p_plugin_attribute_id=>wwv_flow_imp.id(1911463347864646.4103)
,p_display_sequence=>30
,p_display_value=>'Client ID and Client Secret in Body'
,p_return_value=>'BODY'
,p_help_text=>'Send client id and client secret in the request body.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1913370748864646.4103)
,p_plugin_attribute_id=>wwv_flow_imp.id(1911463347864646.4103)
,p_display_sequence=>40
,p_display_value=>'Client ID in Body'
,p_return_value=>'CLID'
,p_help_text=>'Only send client id in the request body.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1913862346864646.4103)
,p_plugin_id=>wwv_flow_imp.id(1905040324864648.4103)
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
prompt --application/shared_components/plugins/authorization_type/com_oracle_apex_developer_authorization
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(2224503320209632.4103)
,p_plugin_type=>'AUTHORIZATION TYPE'
,p_name=>'COM.ORACLE.APEX.DEVELOPER_AUTHORIZATION'
,p_display_name=>'Entwicklerautorisierung'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHORIZATION TYPE','COM.ORACLE.APEX.DEVELOPER_AUTHORIZATION'),'')
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function is_authorized (',
'    p_authorization in wwv_flow_plugin_api.t_authorization,',
'    p_plugin        in wwv_flow_plugin_api.t_plugin )',
'    return wwv_flow_plugin_api.t_authorization_exec_result',
'is',
'    l_result               wwv_flow_plugin_api.t_authorization_exec_result;',
'begin',
'    l_result.is_authorized := wwv_flow_authorization.is_authorized_developer ( ',
'                                  p_developer_authorization => p_authorization.attribute_01 );',
'    return l_result;',
'exception',
'    when no_data_found then',
'        l_result.is_authorized := false;',
'        return l_result;',
'end;'))
,p_api_version=>1
,p_execution_function=>'is_authorized'
,p_substitute_attributes=>true
,p_version_scn=>2617544
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1484282387965356.4103)
,p_plugin_id=>wwv_flow_imp.id(2224503320209632.4103)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Developer Role'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1489698288965353.4103)
,p_plugin_attribute_id=>wwv_flow_imp.id(1484282387965356.4103)
,p_display_sequence=>10
,p_display_value=>'ADMIN: Ability to manage flow developer privileges'
,p_return_value=>'ADMIN'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1490127846965353.4103)
,p_plugin_attribute_id=>wwv_flow_imp.id(1484282387965356.4103)
,p_display_sequence=>20
,p_display_value=>'EDIT: Ability change all attributes of specified flow(s)'
,p_return_value=>'EDIT'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1490625778965353.4103)
,p_plugin_attribute_id=>wwv_flow_imp.id(1484282387965356.4103)
,p_display_sequence=>30
,p_display_value=>'HELP: Ability edit help page for a given company'
,p_return_value=>'HELP'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1484681493965355.4103)
,p_plugin_attribute_id=>wwv_flow_imp.id(1484282387965356.4103)
,p_display_sequence=>40
,p_display_value=>'BROWSE: Access to Oracle data dictionary browser'
,p_return_value=>'BROWSE'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1485119212965354.4103)
,p_plugin_attribute_id=>wwv_flow_imp.id(1484282387965356.4103)
,p_display_sequence=>50
,p_display_value=>'CREATE: Ability to create new flows'
,p_return_value=>'CREATE'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1485651771965354.4103)
,p_plugin_attribute_id=>wwv_flow_imp.id(1484282387965356.4103)
,p_display_sequence=>60
,p_display_value=>'MONITOR: Ability to monitor flow activity'
,p_return_value=>'MONITOR'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1486104638965354.4103)
,p_plugin_attribute_id=>wwv_flow_imp.id(1484282387965356.4103)
,p_display_sequence=>70
,p_display_value=>'DB_MONITOR: Ability to monitor Oracle database attributes'
,p_return_value=>'DB_MONITOR'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1486639045965354.4103)
,p_plugin_attribute_id=>wwv_flow_imp.id(1484282387965356.4103)
,p_display_sequence=>80
,p_display_value=>'SQL: Ability to issues SQL statements'
,p_return_value=>'SQL'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1487186085965354.4103)
,p_plugin_attribute_id=>wwv_flow_imp.id(1484282387965356.4103)
,p_display_sequence=>90
,p_display_value=>'USER_MANAGER: Manage user accounts for cookie based authentication'
,p_return_value=>'USER_MANAGER'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1487604740965354.4103)
,p_plugin_attribute_id=>wwv_flow_imp.id(1484282387965356.4103)
,p_display_sequence=>100
,p_display_value=>'DATA_LOADER: Data Workshop'
,p_return_value=>'DATA_LOADER'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1488141603965353.4103)
,p_plugin_attribute_id=>wwv_flow_imp.id(1484282387965356.4103)
,p_display_sequence=>110
,p_display_value=>'RESTFUL: Ability to enable RESTful Services'
,p_return_value=>'RESTFUL'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1488667037965353.4103)
,p_plugin_attribute_id=>wwv_flow_imp.id(1484282387965356.4103)
,p_display_sequence=>130
,p_display_value=>'EDIT or SQL'
,p_return_value=>'EDIT:SQL'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1489141163965353.4103)
,p_plugin_attribute_id=>wwv_flow_imp.id(1484282387965356.4103)
,p_display_sequence=>140
,p_display_value=>'DATA_GENERATOR: Ability to access Data Generator in SQL Workshop'
,p_return_value=>'DATA_GENERATOR'
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
 p_id=>.4103
,p_name=>'Globale Seite'
,p_step_title=>'Globale Seite'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'D'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(390755402636297329.4103)
,p_plug_name=>'APEX 5 - Header'
,p_region_css_classes=>'a-Header apex-home'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(719473716690283992.4103)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_07'
,p_translate_title=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(390755785478302692.4103)
,p_plug_name=>'APEX 5 - Header Left'
,p_parent_plug_id=>wwv_flow_imp.id(390755402636297329.4103)
,p_region_css_classes=>'a-Header-col a-Header-col--left'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(719473716690283992.4103)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_translate_title=>'N'
,p_plug_query_num_rows=>15
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35954042180401544.4103)
,p_plug_name=>'Navigation Tabs Landmark'
,p_parent_plug_id=>wwv_flow_imp.id(390755785478302692.4103)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(719473716690283992.4103)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_translate_title=>'N'
,p_landmark_type=>'navigation'
,p_landmark_label=>'&PRODUCT_NAME.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(389644738049643917.4103)
,p_plug_name=>'APEX 5 - Tabs'
,p_region_name=>'a_Header_menu'
,p_parent_plug_id=>wwv_flow_imp.id(35954042180401544.4103)
,p_region_css_classes=>'a-Header-tabsContainer'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="display: none;"'
,p_plug_template=>wwv_flow_imp.id(719473716690283992.4103)
,p_plug_display_sequence=>30
,p_list_id=>wwv_flow_imp.id(1630037294194189.4103)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(576186007498036655.4103)
,p_translate_title=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(390756182006302692.4103)
,p_plug_name=>'APEX 5 - Logo'
,p_parent_plug_id=>wwv_flow_imp.id(390755785478302692.4103)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(719473716690283992.4103)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sys.htp.p(',
'    ''<a href="'' ||',
'    wwv_flow_utilities.prepare_url( ''f?p=4100:1:'' || :APP_SESSION || ''::'' || :DEBUG ) ||',
'    ''" class="a-Header-logo"'' ||',
'    wwv_flow_plugin_util.get_html_attr(',
'        p_name  => ''title'',',
'        p_value => wwv_flow_lang.system_message( ''HOME_NAV'' ) ) ||',
'    case when :APP_PAGE_ID = 1 then',
'        '' aria-current="page"''',
'    end ||',
'    ''><span role="img" aria-labelledby="logoLabel" class="a-Header-apexLogo"><span id="logoLabel" class="u-vh">'' ||',
'    wwv_flow_escape.html( wwv_flow_lang.system_message( ''HOME_NAV'' ) ) ||',
'    ''</span></span></a>'' );'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_num_rows=>15
,p_landmark_type=>'region'
,p_landmark_label=>'Logo'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(390755978988302692.4103)
,p_plug_name=>'APEX 5 - Header Right'
,p_parent_plug_id=>wwv_flow_imp.id(390755402636297329.4103)
,p_region_css_classes=>'a-Header-col a-Header-col--right'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(719473716690283992.4103)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_translate_title=>'N'
,p_plug_query_num_rows=>15
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(389656483844859551.4103)
,p_plug_name=>'APEX 5 - Header Navigation Links'
,p_parent_plug_id=>wwv_flow_imp.id(390755978988302692.4103)
,p_region_css_classes=>'a-Header-navLinks'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(719473716690283992.4103)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_translate_title=>'N'
,p_landmark_type=>'region'
,p_landmark_label=>'Navigationsleiste'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6251565515611624.4103)
,p_plug_name=>'Extension Menu'
,p_region_name=>'extensionsMenu'
,p_parent_plug_id=>wwv_flow_imp.id(389656483844859551.4103)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(719473716690283992.4103)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_list_id=>wwv_flow_imp.id(1617849920194181.4103)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(750166499508430361.4103)
,p_translate_title=>'N'
,p_plug_required_role=>wwv_flow_imp.id(3600276725917337)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(389664299829868619.4103)
,p_plug_name=>'Administration Menu'
,p_region_name=>'adminMenu'
,p_parent_plug_id=>wwv_flow_imp.id(389656483844859551.4103)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(719473716690283992.4103)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_list_id=>wwv_flow_imp.id(1618455056194184.4103)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(750166499508430361.4103)
,p_translate_title=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(490621346807921535.4103)
,p_plug_name=>'Help Menu'
,p_region_name=>'helpMenu'
,p_parent_plug_id=>wwv_flow_imp.id(389656483844859551.4103)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(719473716690283992.4103)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_list_id=>wwv_flow_imp.id(1627426286194188.4103)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(750166499508430361.4103)
,p_translate_title=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(389666198313909817.4103)
,p_plug_name=>'Header Account'
,p_parent_plug_id=>wwv_flow_imp.id(390755978988302692.4103)
,p_region_css_classes=>'a-Header-account'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(719473716690283992.4103)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'wwv_flow_4000_ui.account_mega_menu (',
'    p_username          => :APP_USER,',
'    p_workspace_id      => :WORKSPACE_ID,',
'    p_session           => :APP_SESSION,',
'    p_logout_url        => :LOGOUT_URL',
');'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_landmark_type=>'region'
,p_landmark_label=>'Account'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2250875259425711.4103)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(389656483844859551.4103)
,p_button_name=>'UPGRADE_AVAILABLE'
,p_button_static_id=>'header-upgradeAvailable'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(356399210687168533.4103)
,p_button_image_alt=>unistr('Upgrade verf\00FCgbar')
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=4000:78:&SESSION.:UPGRADE_AVAILABLE:&DEBUG.:78::'
,p_button_condition=>'wwv_flow_cloud_db_services.get_upgrade_status().state = ''SCHEDULED'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_button_css_classes=>'a-Button--noUI a-Button--navLink'
,p_icon_css_classes=>'icon-utilities-build-interval'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2251294259425712.4103)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(389656483844859551.4103)
,p_button_name=>'UPGRADE_IN_PROGRESS'
,p_button_static_id=>'header-upgradeInProgress'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(356399210687168533.4103)
,p_button_image_alt=>unistr('Upgrade wird ausgef\00FChrt')
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=4000:78:&SESSION.:UPGRADE_IN_PROGRESS:&DEBUG.:78::'
,p_button_condition=>'wwv_flow_cloud_db_services.get_upgrade_status().state = ''RUNNING'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_button_css_classes=>'a-Button--noUI a-Button--navLink'
,p_icon_css_classes=>'icon-ig-refresh u-Animate-spin'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2251639324425712.4103)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(389656483844859551.4103)
,p_button_name=>'SPOTLIGHT'
,p_button_static_id=>'header-spotlightSearch'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:a-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(407467631666671465.4103)
,p_button_image_alt=>'Suchen'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'a-Button--noUI a-Button--navLink'
,p_icon_css_classes=>'icon-search'
,p_button_cattributes=>'data-action="spotlight-search" data-no-update="true"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2252080422425712.4103)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(389656483844859551.4103)
,p_button_name=>'HEADER_EXTENSIONS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(2582194691768847.4103)
,p_button_image_alt=>'Erweiterungen'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'a-Button--noUI a-Button--navLink'
,p_icon_css_classes=>'icon-extension'
,p_button_cattributes=>'data-menu="extensionsMenu_menu"'
,p_security_scheme=>wwv_flow_imp.id(3600276725917337)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2252406557425712.4103)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(389656483844859551.4103)
,p_button_name=>'HEADER_ADMINISTRATION'
,p_button_static_id=>'header-adminMenu'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(2582194691768847.4103)
,p_button_image_alt=>'Administration'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'a-Button--noUI a-Button--navLink'
,p_icon_css_classes=>'icon-gears-alt'
,p_button_cattributes=>'data-menu="adminMenu_menu"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2252820641425713.4103)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(389656483844859551.4103)
,p_button_name=>'HEADER_FEEDBACK'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(356399210687168533.4103)
,p_button_image_alt=>'Feedback'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=4750:11001:&SESSION.::&DEBUG.:RP,11001:P11001_APPLICATION_ID,P11001_PAGE_ID:&APP_ID.,&APP_PAGE_ID.:'
,p_button_css_classes=>'a-Button--noUI a-Button--navLink'
,p_icon_css_classes=>'icon-comments'
,p_required_patch=>wwv_flow_imp.id(3475503069093017.4103)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2253269813425713.4103)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(389656483844859551.4103)
,p_button_name=>'HEADER_HELP'
,p_button_static_id=>'header-helpMenu'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(2582194691768847.4103)
,p_button_image_alt=>'Hilfe'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'a-Button--noUI a-Button--navLink'
,p_icon_css_classes=>'icon-help'
,p_button_cattributes=>'data-menu="helpMenu_menu"'
);
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_imp_page.create_page(
 p_id=>1.4103
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'Oracle APEX Home'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Developer Toolbar integration */',
'apex.builder.nameBuilderWindow();',
''))
,p_step_template=>wwv_flow_imp.id(389474351319109454.4103)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_help_text=>'start_db_home.htm'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3455065591806801.4103)
,p_plug_name=>'Fusion Applications'
,p_region_css_classes=>'a-Region--stacked a-Region--padded a-Region--flush a-Region--sideRegion'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_plug_template=>wwv_flow_imp.id(177327211140356819.4103)
,p_plug_display_sequence=>110
,p_plug_display_point=>'REGION_POSITION_03'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'    Diese APEX-Instanz ist mit Oracle Fusion Applications integriert.',
'</p>',
'<p>',
'    <a href="f?p=4020:3000:&APP_SESSION.:::3000">Fusion-Integration erstellen</a> ',
'</p>'))
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'wwv_flow_fa_util_dev.is_fa_available'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11180401733396706.4103)
,p_plug_name=>'Hidden'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>150
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_item_display_point=>'BELOW'
,p_translate_title=>'N'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(22820803259610573.4103)
,p_plug_name=>'Top-Apps'
,p_region_name=>'dashboard_region'
,p_region_css_classes=>'a-Region--scrollAuto u-Height i-h540 a-Region--simple margin-top-none a-Region--noBottomBorder'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(177327211140356819.4103)
,p_plug_display_sequence=>60
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'wwv_flow_4100_ui.top_applications_combo2 (',
'    p_app_session  => :app_session,',
'    p_security_group_id => :flow_security_group_id,    ',
'    p_image_prefix  => :image_prefix,',
'    p_days  => :P1_TIMEFRAME,',
'    p_display_count => 25,',
'    p_chart_width  => 100,',
'    p_link => ''f?p=4100:3:''||:app_session||'':::3'');'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_required_role=>wwv_flow_imp.id(2224190594209629)
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(22823018909145001.4103)
,p_plug_name=>'Topbenutzer'
,p_region_name=>'top-users'
,p_region_css_classes=>'a-Region--scrollAuto u-Height i-h540 a-Region--simple margin-top-none a-Region--noBottomBorder'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(177327211140356819.4103)
,p_plug_display_sequence=>70
,p_plug_new_grid_row=>false
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'wwv_flow_4100_ui.top_users2 (',
'    p_app_session       => :app_session,',
'    p_security_group_id => :flow_security_group_id,    ',
'    p_image_prefix      => :image_prefix,',
'    p_days              => nvl(:P1_TIMEFRAME,1),',
'    p_display_count     => 25,',
'    p_max_length        => 30,',
'    p_chart_width       => 100,',
'    p_link => ''f?p=4100:3:''||:app_session||'':::3'');'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_column_width=>'apex-col--leftBorder'
,p_plug_required_role=>wwv_flow_imp.id(2224190594209629)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(22826817850343343.4103)
,p_plug_name=>'Zeitrahmen festlegen'
,p_region_css_classes=>'a-Region-caption'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(719473716690283992.4103)
,p_plug_display_sequence=>100
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'wwv_flow_4100_ui.show_page_event_link (',
'    p_days  => :P1_TIMEFRAME,',
'    p_link => wwv_flow_page_api.get_url( p_page => 3 ));'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_column_width=>'apex-col--topBorder'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_landmark_type=>'region'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(32806801881614102.4103)
,p_plug_name=>'Workspace &COMPANY.'
,p_region_sub_css_classes=>'a-ImageNav--primary'
,p_region_template_options=>'#DEFAULT#:a-Region--noTopBorder:a-Region--paddedBody:a-Region--accessibleHeader'
,p_plug_template=>wwv_flow_imp.id(177327211140356819.4103)
,p_plug_display_sequence=>10
,p_list_id=>wwv_flow_imp.id(2218105708209619.4103)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(483868913244428740.4103)
,p_landmark_type=>'navigation'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(50223690593879168.4103)
,p_plug_name=>'Info'
,p_region_css_classes=>'a-Region--stacked a-Region--padded a-Region--flush a-Region--sideRegion'
,p_region_template_options=>'#DEFAULT#:a-Region--paddedBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(177327211140356819.4103)
,p_plug_display_sequence=>100
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>unistr('&PRODUCT_NAME. ist eine Low-Code-Entwicklungsplattform, mit der Sie skalierbare, sichere Unternehmens-Apps mit erstklassigen Features entwickeln und \00FCberall bereitstellen k\00F6nnen.')
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
 p_id=>wwv_flow_imp.id(74407113994779056.4103)
,p_plug_name=>'Learn More Region'
,p_region_css_classes=>'a-ButtonRegion--banner apex-app-builder'
,p_region_template_options=>'a-ButtonRegion--withItems'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(689731959698504608.4103)
,p_plug_display_sequence=>130
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sys.htp.p(''<div class="a-MediaBlock">'');',
'sys.htp.p(''    <div class="a-MediaBlock-graphic">'');',
'sys.htp.p(''        <span class="icon-get-started" aria-hidden="true"></span>'');',
'sys.htp.p(''    </div>'');',
'sys.htp.p(''    <div class="a-MediaBlock-content">'');',
'sys.htp.p(''        <h2>''||',
'          wwv_flow_lang.message(case when wwv_flow_global.g_cloud then ''LEARN_MORE_APEX_HOME_ADB''',
'                                            else ''LEARN_MORE_APEX_HOME'' end) ||',
'          ''</h2>'');',
'sys.htp.p(''    </div>'');',
'sys.htp.p(''</div>'');'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_landmark_label=>'Weitere Informationen zu &PRODUCT_NAME.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(389936382386693217.4103)
,p_plug_name=>'Overview Container'
,p_region_css_classes=>'a-Region--scrollAuto u-Height i-h540 a-Region--simple margin-top-none'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(719473716690283992.4103)
,p_plug_display_sequence=>80
,p_plug_new_grid_row=>false
,p_translate_title=>'N'
,p_plug_column_width=>'apex-col--leftBorder'
,p_landmark_type=>'region'
,p_landmark_label=>unistr('\00DCberblick')
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(29174009977064440.4103)
,p_plug_name=>'Upgrademeldung'
,p_parent_plug_id=>wwv_flow_imp.id(389936382386693217.4103)
,p_region_css_classes=>'a-Region--simple a-Region--noBottomBorder a-Region--helpRegion margin-top-none'
,p_region_template_options=>'#DEFAULT#:a-Region--paddedBody:a-Region--accessibleHeader'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(177327211140356819.4103)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if wwv_flow_cloud_db_services.get_upgrade_status().state = ''SCHEDULED'' then',
'    sys.htp.p(wwv_flow_lang.system_message(',
'        p_name => ''F4000_P78_UPGRADE_AVAILABLE'',',
'        p0     => wwv_flow_cloud_db_services.get_upgrade_status().upgrade_version,',
'        p1     => to_char(wwv_flow_cloud_db_services.get_upgrade_status().upgrade_date, ''&LONG_DATE_FORMAT.''),',
'        p2     => ''https://apex.oracle.com/adb-latest''));',
'else',
'    sys.htp.p(wwv_flow_lang.system_message(',
'        p_name => ''F4000_P78_UPGRADING'',',
'        p0     => ''&PRODUCT_NAME.'',',
'        p1     => ''3''));',
'end if;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'wwv_flow_cloud_db_services.get_upgrade_status().state is not null'
,p_plug_display_when_cond2=>'PLSQL'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(41016507787428664.4103)
,p_name=>'Ressourcen'
,p_parent_plug_id=>wwv_flow_imp.id(389936382386693217.4103)
,p_template=>wwv_flow_imp.id(177327211140356819.4103)
,p_display_sequence=>80
,p_region_css_classes=>'a-Region--simple a-Region--noBottomBorder margin-bottom-md'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'SUB_REGIONS'
,p_item_display_point=>'BELOW'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select case when task_link is null then',
'           ''#''',
'       else',
'           replace(',
'               replace(',
'                   replace( task_link,',
'                            ''&''||''SESSION.'', :APP_SESSION ),',
'                   ''&''||''FLOW_SESSION.'', :APP_SESSION ),',
'               ''&''||''APP_SESSION.'', :APP_SESSION )',
'        end task_link,',
'        task_name',
'  from wwv_flow_customized_tasks',
' where (   security_group_id is null',
'        or security_group_id = :FLOW_SECURITY_GROUP_ID )',
'   and displayed        = ''Y''',
'   and display_location = ''WORKSPACE_HOME''',
' order by display_sequence',
''))
,p_display_when_condition=>'select 1 from wwv_flow_customized_tasks where (security_group_id is null or security_group_id = :flow_security_group_id) and displayed = ''Y'' and display_location = ''WORKSPACE_HOME'''
,p_display_condition_type=>'EXISTS'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(19962201430770078.4103)
,p_query_num_rows=>500
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'Keine Daten gefunden.'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>5000
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1602494530247513.4103)
,p_query_column_id=>1
,p_column_alias=>'TASK_LINK'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1602510280247514.4103)
,p_query_column_id=>2
,p_column_alias=>'TASK_NAME'
,p_column_display_sequence=>20
,p_column_heading=>'Aufgabenname'
,p_column_html_expression=>'<a href="#TASK_LINK#">#TASK_NAME#</a>'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(54029762205417585.4103)
,p_plug_name=>'Ergebniscachemodus'
,p_parent_plug_id=>wwv_flow_imp.id(389936382386693217.4103)
,p_region_css_classes=>'a-Alert--noTitle margin-bottom-none'
,p_region_template_options=>'a-Alert--colorBG:a-Alert--defaultIcons:a-Alert--noIcon:a-Alert--warning:a-Alert--horizontal'
,p_plug_template=>wwv_flow_imp.id(748940840395094996.4103)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_out clob;',
'begin',
'    -- Note, the documentation link always goes to the English search results as translated',
'    -- search results don''t appear to find the relevant content.',
'    l_out := wwv_flow_lang.message(',
'        p_name => ''P1_RESULT_CACHE_MODE_SHORT'',',
'        p0     => ''javascript:void(0);'');',
'    return l_out;',
'end;'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P1_RESULT_CACHE_MODE'
,p_plug_display_when_cond2=>'FORCE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(140996302794317848.4103)
,p_plug_name=>'Systemmeldung'
,p_parent_plug_id=>wwv_flow_imp.id(389936382386693217.4103)
,p_region_css_classes=>'a-Region--simple a-Region--noBottomBorder margin-bottom-md'
,p_region_template_options=>'#DEFAULT#:a-Region--paddedBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(177327211140356819.4103)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sys.htp.p(''<div class="a-MediaBlock" style="align-items: center;">'');',
'sys.htp.p(''      <div class="a-MediaBlock-graphic">'');',
'sys.htp.p(''            <span class="a-Icon a-Icon--medium icon-system-message"></span>'');',
'sys.htp.p(''      </div>'');',
'sys.htp.p(''      <div class="a-MediaBlock-content">'');',
'wwv_flow_4050_ui.show_system_message(p_app_session => :APP_SESSION);',
'sys.htp.p(''      </div>'');',
'sys.htp.p(''</div>'');'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'wwv_flow_4050_ui.system_message_exists()'
,p_plug_display_when_cond2=>'PLSQL'
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(494102986912824336.4103)
,p_plug_name=>unistr('Verf\00FCgbare Updates')
,p_parent_plug_id=>wwv_flow_imp.id(389936382386693217.4103)
,p_region_css_classes=>'a-Region--simple a-Region--noBottomBorder margin-bottom-md'
,p_region_template_options=>'#DEFAULT#:a-Region--paddedBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(177327211140356819.4103)
,p_plug_display_sequence=>90
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'sys.htp.p(''<div id="updates" class="a-MediaBlock" style="align-items: center;"></div>'');'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'wwv_flow_4100_ui.updates_check_enabled()'
,p_plug_display_when_cond2=>'PLSQL'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(722105589619546488.4103)
,p_name=>'Zusammenfassung'
,p_region_name=>'dashboard'
,p_parent_plug_id=>wwv_flow_imp.id(389936382386693217.4103)
,p_template=>wwv_flow_imp.id(177327211140356819.4103)
,p_display_sequence=>30
,p_region_css_classes=>'a-Region--simple margin-bottom-none margin-top-none'
,p_region_sub_css_classes=>'a-AVPList--inlineDash'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   (select to_char(count(*),''999G999G999G990'') from wwv_flows where security_group_id = :flow_security_group_id)  applications,',
'   --',
'   ( select to_char(count(*),''999G999G999G990'')',
'       from sys.dba_tables',
'      where owner = ( select default_schema',
'                        from wwv_flow_fnd_user',
'                       where security_group_id = :WORKSPACE_ID',
'                         and user_name         = :APP_USER',
'                    )',
'   ) as tables,',
'   ( select to_char(count(*),''999G999G999G990'')',
'       from wwv_flow_workspace_users',
'      where workspace_id = :flow_security_group_id',
'        and DEVELOPER_TYPE in (''ADMIN'',''DEVELOPER'')',
'   ) as developers',
'',
'from sys.dual'))
,p_required_role=>wwv_flow_imp.id(2233317028209664)
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(45598789574081657.4103)
,p_query_num_rows=>7
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>unistr('Bericht enth\00E4lt keine Daten')
,p_query_row_count_max=>7
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_query_asc_image_attr=>'width="13" height="12" alt=""'
,p_query_desc_image_attr=>'width="13" height="12" alt=""'
,p_plug_query_strip_html=>'Y'
,p_comment=>'style="width:33%; float:left;"'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2210959857209596.4103)
,p_query_column_id=>1
,p_column_alias=>'APPLICATIONS'
,p_column_display_sequence=>1
,p_column_heading=>'Anwendungen'
,p_column_link=>'f?p=4000:1500:&SESSION.::&DEBUG.:RP,1500,RIR:::'
,p_column_linktext=>'#APPLICATIONS#'
,p_report_column_required_role=>wwv_flow_imp.id(2224190594209629)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2211302214209596.4103)
,p_query_column_id=>2
,p_column_alias=>'TABLES'
,p_column_display_sequence=>2
,p_column_heading=>'Tabellen'
,p_column_link=>'f?p=4500:3002:&SESSION.::&DEBUG.:RP,3002:::'
,p_column_linktext=>'#TABLES#'
,p_disable_sort_column=>'N'
,p_report_column_required_role=>wwv_flow_imp.id(1602976254825538)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2211744498209596.4103)
,p_query_column_id=>3
,p_column_alias=>'DEVELOPERS'
,p_column_display_sequence=>14
,p_column_heading=>'Entwickler'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(737233745436378280.4103)
,p_plug_name=>'Workspace-Meldung'
,p_parent_plug_id=>wwv_flow_imp.id(389936382386693217.4103)
,p_region_css_classes=>'a-Region--simple a-Region--noBorder margin-top-none margin-bottom-md'
,p_region_template_options=>'#DEFAULT#:a-Region--paddedBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(177327211140356819.4103)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if wwv_flow_4000_ui.workspace_notification_exists(p_workspace_id => :flow_security_group_id) then',
'    sys.htp.p(''<div class="a-MediaBlock" style="align-items: center;">'');',
'    sys.htp.p(''      <div class="a-MediaBlock-graphic">'');',
'    sys.htp.p(''            <span class="a-Icon a-Icon--medium icon-system-message"></span>'');',
'    sys.htp.p(''      </div>'');',
'    sys.htp.p(''      <div class="a-MediaBlock-content">'');',
'    wwv_flow_4000_ui.show_workspace_notification (',
'        p_workspace_id       => :flow_security_group_id,',
'        p_session            => :app_session);',
'    sys.htp.p(''      </div>'');',
'    sys.htp.p(''</div>'');',
'else',
'    sys.htp.p(''<div class="nodatafound padding-none">'');',
'    sys.htp.p(wwv_flow_lang.message(''P1_NO_WS_MESSAGE''));',
'    sys.htp.p(''</div>'');',
'end if;'))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(426859213848767635.4103)
,p_plug_name=>'Language'
,p_region_name=>'builder_home_lang_selector'
,p_region_template_options=>'#DEFAULT#:a-Region--paddedBody:a-Region--hideHeader'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(177327211140356819.4103)
,p_plug_display_sequence=>120
,p_plug_source=>'sys.htp.p( wwv_flow_lang.get_language_selector_list );'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_column_width=>'apex-col--bottomBorder'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'wwv_flow_4000_ui.is_translation_installed( p_flow_id => 4000 )'
,p_plug_display_when_cond2=>'PLSQL'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_landmark_type=>'exclude_landmark'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(448938046502410974.4103)
,p_plug_name=>'Weitere Informationen'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(177327211140356819.4103)
,p_plug_display_sequence=>120
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_location=>null
,p_list_id=>wwv_flow_imp.id(2220705999209625.4103)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(62797997509026315.4103)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(448938094568410975.4103)
,p_plug_name=>'Social'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_plug_template=>wwv_flow_imp.id(177327211140356819.4103)
,p_plug_display_sequence=>140
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sys.htp.p(',
'   ''<div class="a-Login-social" style="padding: 8px">''',
'|| ''<ul class="a-Login-socialLinks">''',
'|| ''  <li class="a-Login-socialLinks-item">''',
'|| ''    <a href="https://apex.oracle.com/twitter" target="_blank" rel="noopener noreferrer" class="a-Login-socialLinks-link">''',
'|| ''      <span class="a-Icon icon-xcom" aria-hidden="true"></span>''',
'|| ''      <span class="u-VisuallyHidden">X.com</span>''',
'|| ''    </a>''',
'|| ''  </li>''',
'|| ''  <li class="a-Login-socialLinks-item">''',
'|| ''    <a href="https://apex.oracle.com/linkedin" target="_blank" rel="noopener noreferrer" class="a-Login-socialLinks-link">''',
'|| ''      <span class="a-Icon icon-linkedin" aria-hidden="true"></span>''',
'|| ''      <span class="u-VisuallyHidden">LinkedIn</span>''',
'|| ''    </a>''',
'|| ''  </li>''',
'|| ''  <li class="a-Login-socialLinks-item">''',
'|| ''    <a href="https://apex.oracle.com/facebook" target="_blank" rel="noopener noreferrer" class="a-Login-socialLinks-link">''',
'|| ''      <span class="a-Icon icon-facebook" aria-hidden="true"></span>''',
'|| ''      <span class="u-VisuallyHidden">Facebook</span>''',
'|| ''    </a>''',
'|| ''  </li>''',
'|| ''  <li class="a-Login-socialLinks-item">''',
'|| ''    <a href="https://apex.oracle.com/youtube" target="_blank" rel="noopener noreferrer" class="a-Login-socialLinks-link">''',
'|| ''      <span class="a-Icon icon-youtube" aria-hidden="true"></span>''',
'|| ''      <span class="u-VisuallyHidden">YouTube</span>''',
'|| ''    </a>''',
'|| ''  </li>''',
'|| ''</ul>''',
'|| ''</div>''',
');'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_landmark_label=>'Social Networking'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(490537026777036356.4103)
,p_plug_name=>'Ergebniscache'
,p_region_template_options=>'js-draggable:js-modal:js-dialog-size480x320:h240'
,p_plug_template=>wwv_flow_imp.id(431176191030605311.4103)
,p_plug_display_sequence=>160
,p_plug_display_point=>'REGION_POSITION_04'
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_out clob;',
'begin',
'    -- Note, the documentation link always goes to the English search results as translated',
'    -- search results don''t appear to find the relevant content.',
'    l_out := wwv_flow_lang.message(',
'        p_name => ''P1_RESULT_CACHE_MODE'',',
'        p0     => :P1_RESULT_CACHE_MODE,',
'        p1     => ''https://docs.oracle.com/search/?q=result_cache_mode'' ||',
'                  ''&product=en%2Fdatabase%2Foracle%2Foracle-database'');',
'    return l_out;',
'end;'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P1_RESULT_CACHE_MODE'
,p_plug_display_when_cond2=>'FORCE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2212522592209597.4103)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(737233745436378280.4103)
,p_button_name=>'UPDATE_WS_MESSAGE'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:a-Button--regionHeader'
,p_button_template_id=>wwv_flow_imp.id(356399210687168533.4103)
,p_button_image_alt=>'Workspace-Nachricht definieren'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=4350:35:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'icon-edit'
,p_security_scheme=>wwv_flow_imp.id(2232502732209663)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2206380726209588.4103)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(74407113994779056.4103)
,p_button_name=>'GET_STARTED'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:a-Button--strongLabel'
,p_button_template_id=>wwv_flow_imp.id(177329393740370707.4103)
,p_button_image_alt=>'Erste Schritte'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'javascript:apex.navigation.openInNewWindow(''&P1_GET_STARTED_URL!JS.'');'
,p_button_css_classes=>'a-Button--dark'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2210141297209595.4103)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(494102986912824336.4103)
,p_button_name=>'SET_PREFERENCES_UPDATES'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(356399210687168533.4103)
,p_button_image_alt=>unistr('Voreinstellungen f\00FCr verf\00FCgbare Updates festlegen')
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=4100:4:&SESSION.::&DEBUG.:4::'
,p_button_css_classes=>'a-Button a-Button--withIcon a-Button--noLabel a-Button--small a-Button--noUI'
,p_icon_css_classes=>'icon-gear'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(2217850974209616.4103)
,p_branch_name=>'Go To Page 5'
,p_branch_action=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(24891665126836406.4103)
,p_name=>'P1_WARNING'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(32806801881614102.4103)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29620081536758893.4103)
,p_name=>'P1_DAYS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(32806801881614102.4103)
,p_item_default=>'7'
,p_source=>'7'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29620958483913064.4103)
,p_name=>'P1_ACTIVITY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(32806801881614102.4103)
,p_item_default=>'V'
,p_source=>'V'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(32776391273114716.4103)
,p_name=>'P1_TIMEFRAME'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(11180401733396706.4103)
,p_item_default=>'3600'
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>unistr('Legen Sie einen Zeitrahmen fest, um die auf dieser Seite angezeigten Monitorabfragen einzuschr\00E4nken.')
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54038373733417627.4103)
,p_name=>'P1_RESULT_CACHE_MODE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(54029762205417585.4103)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(281312126583015690.4103)
,p_name=>'P1_GET_STARTED_URL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(74407113994779056.4103)
,p_source=>'wwv_flow_platform.get_preference(''GET_STARTED_URL'')'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(2214080637209612.4103)
,p_computation_sequence=>10
,p_computation_item=>'P1_RESULT_CACHE_MODE'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(value)',
'  from sys.v_$parameter',
' where name = ''result_cache_mode'''))
,p_compute_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'wwv_flow_global.g_cloud',
'and :P1_RESULT_CACHE_MODE is null'))
,p_compute_when_text=>'PLSQL'
,p_compute_when_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(2214458992209612.4103)
,p_computation_sequence=>10
,p_computation_item=>'P1_TIMEFRAME'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'3600'
,p_compute_when=>'P1_TIMEFRAME'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(2215545708209613.4103)
,p_name=>'Updates - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(2210141297209595.4103)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2216027220209615.4103)
,p_event_id=>wwv_flow_imp.id(2215545708209613.4103)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(494102986912824336.4103)
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// Reload page. We have to do it with a timer, because Firefox prevents the redirect otherwise',
'setTimeout(function() {',
'    apex.navigation.redirect( apex.util.makeApplicationUrl({}) );',
'}, 0);'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(2216453649209615.4103)
,p_name=>'News - Dialog Closed'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(389936382386693217.4103)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(2216820694209615.4103)
,p_name=>'Open Result Cache Dialog'
,p_event_sequence=>30
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#result_cache_learn_link'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_when_cond=>'P1_RESULT_CACHE_MODE'
,p_display_when_cond2=>'FORCE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2217388776209616.4103)
,p_event_id=>wwv_flow_imp.id(2216820694209615.4103)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Open Region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(490537026777036356.4103)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(2215185492209612.4103)
,p_process_sequence=>30
,p_process_point=>'BEFORE_FOOTER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Call Home'
,p_process_sql_clob=>'wwv_flow_4000_ui.updates;'
,p_process_clob_language=>'PLSQL'
,p_process_when=>'wwv_flow_4100_ui.updates_check_enabled()'
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
,p_internal_uid=>2215185492209612.4103
);
end;
/
prompt --application/pages/page_00003
begin
wwv_flow_imp_page.create_page(
 p_id=>3.4103
,p_name=>unistr('Zeitrahmen f\00FCr Homepagebericht')
,p_alias=>'HOME-PAGE-REPORTING-TIMEFRAME'
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Zeitrahmen f\00FCr Homepagebericht')
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_step_template=>wwv_flow_imp.id(691639526441810142.4103)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(2611096505029836)
,p_dialog_height=>'240'
,p_dialog_width=>'730'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(206673210832101485.4103)
,p_plug_name=>unistr('Zeitrahmen f\00FCr Homepagebericht')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(719473716690283992.4103)
,p_plug_display_sequence=>10
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
 p_id=>wwv_flow_imp.id(283304705083615747.4103)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(689731959698504608.4103)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3009307345088951.4103)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(283304705083615747.4103)
,p_button_name=>'APPLY_CHANGES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(177329393740370707.4103)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Anwenden'
,p_button_position=>'NEXT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3009769630088952.4103)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(283304705083615747.4103)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(177329393740370707.4103)
,p_button_image_alt=>'Abbrechen'
,p_button_position=>'PREVIOUS'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(3011713789088961.4103)
,p_branch_name=>'Go To Page 1'
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(206674939772160695.4103)
,p_name=>'P3_TIMEFRAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(206673210832101485.4103)
,p_prompt=>'Berichtszeitrahmen'
,p_source=>'select nvl(:P1_TIMEFRAME,3600) from sys.dual'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'P3_TIMEFRAME'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d, to_char(t) t',
'from (',
'select ''10 ''||wwv_flow_lang.system_message(initcap(''SECONDS'')) d, 10 t from sys.dual union all',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''MINUTE'')) d, 60 t from sys.dual union all',
'select ''5 ''||wwv_flow_lang.system_message(initcap(''MINUTES'')) d, 5*60 t from sys.dual union all',
'select ''15 ''||wwv_flow_lang.system_message(initcap(''MINUTES'')) d, 15*60 t from sys.dual union all',
'select ''30 ''||wwv_flow_lang.system_message(initcap(''MINUTES'')) d, 30*60 t from sys.dual union all',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''HOUR'')) d, 3600 t from sys.dual union all',
'select ''2 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 2*3600  t from sys.dual union all',
'select ''3 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 3*3600  t from sys.dual union all',
'select ''4 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 4*3600  t from sys.dual union all',
'select ''6 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 6*3600 t from sys.dual union all',
'select ''8 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 8*3600 t from sys.dual union all',
'select ''12 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 12*3600 t from sys.dual union all',
'select ''18 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 18*3600 t from sys.dual union all',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''DAY'')) d, 1*24*60*60 t from sys.dual union all',
'select ''2 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, 2*24*60*60 t from sys.dual union all',
'select ''3 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, 3*24*60*60 t from sys.dual union all',
'select ''4 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, 4*24*60*60 t from sys.dual union all',
'select ''5 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, 5*24*60*60 t from sys.dual union all',
'select ''6 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, 6*24*60*60 t from sys.dual union all',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''WEEK'')) d, 7*24*60*60 t  from sys.dual',
') q'))
,p_cHeight=>1
,p_grid_column=>3
,p_field_template=>wwv_flow_imp.id(490022788869589047.4103)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Legen Sie den Zeitrahmen fest, um den Aktivit\00E4tsbericht auf der Homepage einzuschr\00E4nken.')
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3010782007088959.4103)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(3009769630088952.4103)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3011282070088960.4103)
,p_event_id=>wwv_flow_imp.id(3010782007088959.4103)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(3010326903088959.4103)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set timeframe'
,p_process_sql_clob=>':P1_TIMEFRAME := :P3_TIMEFRAME;'
,p_process_clob_language=>'PLSQL'
,p_process_when_button_id=>wwv_flow_imp.id(3009307345088951.4103)
,p_internal_uid=>3010326903088959.4103
);
end;
/
prompt --application/pages/page_00004
begin
wwv_flow_imp_page.create_page(
 p_id=>4.4103
,p_name=>unistr('Auf verf\00FCgbare Updates pr\00FCfen')
,p_alias=>'CHECK-FOR-AVAILABLE-UPDATES'
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Auf verf\00FCgbare Updates pr\00FCfen')
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_step_template=>wwv_flow_imp.id(123406906725078162.4103)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(2611096505029836)
,p_dialog_height=>'240'
,p_dialog_width=>'600'
,p_dialog_attributes=>'minWidth:500,minHeight:400'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(495602372147457383.4103)
,p_plug_name=>unistr('Auf verf\00FCgbare Updates pr\00FCfen')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(705356091066836147.4103)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'BELOW'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_plug_header=>'<p>Diese Seite steuert, welche Informationen abgefragt und an Oracle Corporation gesendet werden. </p>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(496017867699817006.4103)
,p_plug_name=>'Button Bar'
,p_region_template_options=>'#DEFAULT#:a-ButtonRegion--noUI'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(689731959698504608.4103)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
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
 p_id=>wwv_flow_imp.id(3018054203596095.4103)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(496017867699817006.4103)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(177329393740370707.4103)
,p_button_image_alt=>'Abbrechen'
,p_button_position=>'CLOSE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3018423755596095.4103)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(496017867699817006.4103)
,p_button_name=>'APPLY_CHANGES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(177329393740370707.4103)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('\00C4nderungen anwenden')
,p_button_position=>'CREATE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(495612249832520242.4103)
,p_name=>'P4_SHOW_UPDATES'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(495602372147457383.4103)
,p_use_cache_before_default=>'NO'
,p_item_default=>'Y'
,p_prompt=>unistr('Auf verf\00FCgbare Updates pr\00FCfen')
,p_source=>'F4100_P1_SHOW_UPDATES'
,p_source_type=>'PREFERENCE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'YES.NO.RETURNS.Y.N'
,p_lov=>'.'||wwv_flow_imp.id(3026135455596117)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(490022788869589047.4103)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Dieses Attribut kontrolliert, ob &PRODUCT_NAME. pr\00FCfen muss, ob Updates f\00FCr &PRODUCT_NAME. und die Oracle REST Data Services vorhanden sind.</p>'),
'',
unistr('<p>Hinweis: Zur Durchf\00FChrung dieser Pr\00FCfung \00FCbertr\00E4gt &PRODUCT_NAME. die Versionsnummer von &PRODUCT_NAME. und anderen Systemkomponenten an Oracle Corporation. Um Ihre Produkte kontinuierlich zu verbessern, m\00F6chte Oracle gerne mehr dar\00FCber wissen, wi')
||unistr('e Sie das Produkt einsetzen. Zu diesem Zweck k\00F6nnen gelegentlich Statistiken an Oracle gesendet werden, in denen die verwendeten Produktfeatures beschrieben werden. Dabei werden keine personenbezogenen Daten gesendet. Sie k\00F6nnen die Datenschutzrichtl')
||'inie von Oracle  <a rel="noopener noreferrer" href="https://www.oracle.com/privacy">hier</a> einsehen.',
'</p>'))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3025282235596115.4103)
,p_name=>'Cancel Dialog'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(3018054203596095.4103)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3025798892596115.4103)
,p_event_id=>wwv_flow_imp.id(3025282235596115.4103)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(3023052304596112.4103)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_USER_PREFERENCES'
,p_process_name=>'Set F4100_P1_SHOW_UPDATES'
,p_attribute_01=>'SET_PREFERENCE_TO_ITEM_VALUE'
,p_attribute_02=>'F4100_P1_SHOW_UPDATES'
,p_attribute_03=>'P4_SHOW_UPDATES'
,p_process_when_button_id=>wwv_flow_imp.id(3018423755596095.4103)
,p_internal_uid=>3023052304596112.4103
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(3023445334596112.4103)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(3018423755596095.4103)
,p_internal_uid=>3023445334596112.4103
);
end;
/
prompt --application/pages/page_00005
begin
wwv_flow_imp_page.create_page(
 p_id=>5.4103
,p_name=>'Zur Homepage'
,p_alias=>'GO-HOME'
,p_step_title=>'Zur Homepage'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(1801951393082309.4103)
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_branch_point=>'BEFORE_HEADER'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
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
